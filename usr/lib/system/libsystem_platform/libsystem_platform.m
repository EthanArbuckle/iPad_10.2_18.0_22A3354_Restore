unsigned int *(*os_unfair_lock_lock_with_options())(unsigned int *result, int a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *, int))os_unfair_lock_lock_with_options_VARIANT_armv81;
  else
    return os_unfair_lock_lock_with_options_VARIANT_mp;
}

unint64_t _platform_memcmp(unint64_t *a1, unint64_t *a2, unint64_t a3)
{
  BOOL v3;
  unint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  int8x16_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  BOOL v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  uint8x16_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  unsigned int v29;

  v3 = a3 >= 0x10;
  v4 = a3 - 16;
  if (!v3)
  {
    v3 = __CFADD__(v4, 8);
    v17 = v4 + 8;
    if (v3)
    {
      v19 = *a1++;
      v18 = v19;
      v21 = *a2++;
      v20 = v21;
      v22 = v18 - v21;
      if (v18 != v21)
        goto LABEL_18;
      v17 -= 8;
    }
    v3 = __CFADD__(v17, 4);
    v23 = v17 + 4;
    if (!v3)
    {
      v23 += 4;
      v22 = 0;
      goto LABEL_20;
    }
    v24 = *(_DWORD *)a1;
    a1 = (unint64_t *)((char *)a1 + 4);
    v18 = v24;
    v25 = *(_DWORD *)a2;
    a2 = (unint64_t *)((char *)a2 + 4);
    v20 = v25;
    v22 = v18 - v25;
    if (v18 == v25)
    {
      do
      {
LABEL_20:
        v3 = v23-- != 0;
        if (!v3)
          break;
        v28 = *(unsigned __int8 *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        v27 = v28;
        v29 = *(unsigned __int8 *)a2;
        a2 = (unint64_t *)((char *)a2 + 1);
        v22 = v27 - v29;
      }
      while (v27 == v29);
      return v22;
    }
LABEL_18:
    v26 = __clz(bswap64(v22)) & 0xFFFFFFFFFFFFFFF8;
    return (v18 >> v26) - (unint64_t)(v20 >> v26);
  }
  if (v4)
  {
    v5 = (unint64_t *)((char *)a1 + v4);
    v6 = (unint64_t *)((char *)a2 + v4);
    while (1)
    {
      v7 = *(int8x16_t *)a1;
      a1 += 2;
      v8 = v7;
      v9 = *(int8x16_t *)a2;
      a2 += 2;
      v10 = vceqq_s8(v8, v9);
      v8.i8[0] = vminvq_u8((uint8x16_t)v10);
      if (!v8.i32[0])
        break;
      v11 = v4 > 0x10;
      v4 -= 16;
      if (!v11)
      {
        a1 = v5;
        a2 = v6;
        goto LABEL_8;
      }
    }
  }
  else
  {
LABEL_8:
    v12 = *(int8x16_t *)a1;
    a1 += 2;
    v13 = v12;
    v14 = *(int8x16_t *)a2;
    a2 += 2;
    v10 = vceqq_s8(v13, v14);
    v13.i8[0] = vminvq_u8((uint8x16_t)v10);
    if (v13.i32[0])
      return 0;
  }
  v16 = (uint8x16_t)vorrq_s8(v10, (int8x16_t)xmmword_1DED87F20);
  v16.i8[0] = vminvq_u8(v16);
  return *((unsigned __int8 *)a1 + v16.u32[0] - 16) - (unint64_t)*((unsigned __int8 *)a2 + v16.u32[0] - 16);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  int v1;
  uint32_t os_unfair_lock_opaque;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) != v1)
    os_unfair_lock_assert_owner_cold_1(os_unfair_lock_opaque);
}

unsigned int *(*os_unfair_recursive_lock_lock_with_options())(unsigned int *result, int a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *, int))os_unfair_recursive_lock_lock_with_options_VARIANT_armv81;
  else
    return os_unfair_recursive_lock_lock_with_options_VARIANT_mp;
}

uint64_t _os_once_gate_broadcast(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result;
  uint64_t v4;

  result = a2 | 1;
  if ((_DWORD)result != a3)
    _os_once_gate_unowned_abort(result);
  if ((a2 & 1) != 0)
  {
    v4 = a2;
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_1F044D8A8 = a2;
    __break(1u);
LABEL_9:
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_1F044D8A8 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      result = __ulock_wake();
      if ((result & 0x80000000) == 0)
        break;
      if ((_DWORD)result != -4)
      {
        v4 = -(int)result;
        if ((_DWORD)v4 != 2)
          goto LABEL_9;
        return result;
      }
    }
  }
  return result;
}

uint64_t _os_once_gate_wait(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  unint64_t v4;
  unint64_t *v8;
  unint64_t v9;

  v4 = __ldxr((unint64_t *)result);
  if (v4 == -1)
  {
LABEL_19:
    __clrex();
    return result;
  }
  v8 = (unint64_t *)result;
  v9 = a4;
  while ((v4 & 3) != 1)
  {
    if (v4)
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4)
      {
        __clrex();
      }
      else if (__stxr(v4 & 0xFFFFFFFFFFFFFFFELL, v8))
      {
        goto LABEL_12;
      }
      if ((v4 | 1) == a4)
        _os_once_gate_recursive_abort(a4);
      result = __ulock_wait();
      if ((result & 0x80000000) != 0 && (_DWORD)result != -4 && -(int)result != 14)
      {
        if (-(int)result == 105)
          _os_once_gate_corruption_abort(v4);
        qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
        qword_1F044D8A8 = -(int)result;
        __break(1u);
        return result;
      }
    }
    else if (!__stxr(v9, v8))
    {
      __dmb(9u);
      return _os_once_callout(v8, a2, a3, a4);
    }
LABEL_12:
    v4 = __ldxr(v8);
    if (v4 == -1)
      goto LABEL_19;
  }
  __clrex();
  __dmb(9u);
  if (4 * MEMORY[0xFFFFFC180] - v4 - 15 <= 0xFFFFFFFFFFFFFFEFLL)
    *v8 = -1;
  return result;
}

uint64_t _os_once_gate_wait_0(uint64_t result, uint64_t a2, uint64_t (*a3)(uint64_t), unsigned int a4)
{
  atomic_ullong v4;
  atomic_ullong *v8;
  unint64_t v9;
  atomic_ullong v10;
  atomic_ullong v11;

  v4 = *(_QWORD *)result;
  if (*(_QWORD *)result != -1)
  {
    v8 = (atomic_ullong *)result;
    v9 = a4;
    while ((v4 & 3) != 1)
    {
      if (v4)
      {
        if ((v4 & 0xFFFFFFFFFFFFFFFELL) == v4
          || (v10 = v4,
              atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v10, v4 & 0xFFFFFFFFFFFFFFFELL, memory_order_relaxed, memory_order_relaxed), v10 == v4))
        {
          if ((v4 | 1) == a4)
            _os_once_gate_recursive_abort(a4);
          result = __ulock_wait();
          if ((result & 0x80000000) != 0 && (_DWORD)result != -4 && -(int)result != 14)
          {
            if (-(int)result == 105)
              _os_once_gate_corruption_abort(v4);
            qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
            qword_1F044D8A8 = -(int)result;
            __break(1u);
            return result;
          }
          v4 = *v8;
        }
        else
        {
          v4 = v10;
        }
      }
      else
      {
        v11 = 0;
        atomic_compare_exchange_strong_explicit(v8, (unint64_t *)&v11, v9, memory_order_relaxed, memory_order_relaxed);
        if (!v11)
        {
          __dmb(9u);
          return _os_once_callout_0(v8, a2, a3, a4);
        }
        v4 = v11;
      }
      if (v4 == -1)
        return result;
    }
    __dmb(9u);
    if ((unint64_t)(4 * MEMORY[0xFFFFFC180] - v4 - 15) <= 0xFFFFFFFFFFFFFFEFLL)
      *v8 = -1;
  }
  return result;
}

void _sigtramp(void (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __in_sigtramp = a3;
  a1(a3, a4, a5);
  __in_sigtramp = 0;
  __sigreturn();
  __break(1u);
}

uint64_t _os_semaphore_dispose(semaphore_t semaphore)
{
  uint64_t result;

  result = semaphore_destroy(*MEMORY[0x1E0C883F0], semaphore);
  if ((_DWORD)result)
    _os_semaphore_dispose_cold_1(result);
  return result;
}

uint64_t _os_semaphore_create()
{
  kern_return_t v0;
  semaphore_t semaphore;

  v0 = semaphore_create(*MEMORY[0x1E0C883F0], &semaphore, 0, 0);
  if (v0)
  {
    if (v0 == -301)
      _os_semaphore_create_cold_2();
    _os_semaphore_create_cold_1(v0);
  }
  return semaphore;
}

uint64_t __platform_sigaction(int a1)
{
  if ((a1 - 32) >= 0xFFFFFFE1 && a1 != 17 && a1 != 9)
    return __sigaction();
  *__error() = 22;
  return 0xFFFFFFFFLL;
}

int _setjmp(jmp_buf a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v21 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 56);
  *(_QWORD *)a1 = v1;
  *((_QWORD *)a1 + 1) = v2;
  *((_QWORD *)a1 + 2) = v3;
  *((_QWORD *)a1 + 3) = v4;
  *((_QWORD *)a1 + 4) = v5;
  *((_QWORD *)a1 + 5) = v6;
  *((_QWORD *)a1 + 6) = v7;
  *((_QWORD *)a1 + 7) = v8;
  *((_QWORD *)a1 + 8) = v9;
  *((_QWORD *)a1 + 9) = v10;
  *((_QWORD *)a1 + 10) = v11 ^ v21;
  *((_QWORD *)a1 + 11) = v12 ^ v21;
  *((_QWORD *)a1 + 12) = (unint64_t)&v23 ^ v21;
  *((_QWORD *)a1 + 14) = v13;
  *((_QWORD *)a1 + 15) = v14;
  *((_QWORD *)a1 + 16) = v15;
  *((_QWORD *)a1 + 17) = v16;
  *((_QWORD *)a1 + 18) = v17;
  *((_QWORD *)a1 + 19) = v18;
  *((_QWORD *)a1 + 20) = v19;
  *((_QWORD *)a1 + 21) = v20;
  return 0;
}

void _longjmp(jmp_buf a1, int a2)
{
  _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
}

int sigsetjmp(sigjmp_buf a1, int a2)
{
  a1[46] = a2;
  if (a2)
    return setjmp(a1);
  else
    return _setjmp(a1);
}

int setjmp(jmp_buf a1)
{
  uint64_t v1;
  uint64_t v2;
  int v5;

  *(_QWORD *)a1 = v1;
  *((_QWORD *)a1 + 1) = v2;
  sigprocmask(1, 0, (sigset_t *)a1 + 44);
  __sigaltstack();
  a1[47] = v5;
  return _setjmp(a1);
}

void siglongjmp(sigjmp_buf a1, int a2)
{
  if (!a1[46])
    _longjmp(a1, a2);
  longjmp(a1, a2);
}

void longjmp(jmp_buf a1, int a2)
{
  sigset_t v4[2];

  *(_QWORD *)v4 = *((_QWORD *)a1 + 22);
  sigprocmask(3, v4, 0);
  _sigunaltstack();
  _longjmp(a1, a2);
}

uint64_t _simple_asl_log(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 v11;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 336) != -1)
    _os_alloc_once_0(MEMORY[0x1E0C87FA0] + 336, 32, (uint64_t)_simple_asl_init_context, a4, a5, a6, a7, a8);
  v11 = os_log_simple_type_from_asl(a1);
  return _os_log_simple_shim(v11, a2, a3);
}

uint64_t os_log_simple_type_from_asl(int a1)
{
  unsigned int v1;

  v1 = a1 & ~(a1 >> 31);
  if (v1 >= 7)
    v1 = 7;
  return os_log_simple_type_from_asl__level2ostype[v1];
}

uint64_t __libplatform_init(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  __pfz_setup(a3);
  _simple_asl_init(a2, a4, v6, v7, v8, v9, v10, v11);
  return __libkernel_platform_init();
}

int8x16_t *_simple_asl_init(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  int8x16_t *result;
  _QWORD *v12;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 336) == -1)
    v10 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 344);
  else
    v10 = _os_alloc_once_0(MEMORY[0x1E0C87FA0] + 336, 32, (uint64_t)_simple_asl_init_context, a4, a5, a6, a7, a8);
  result = (int8x16_t *)_simple_getenv(a1, (uint64_t)"ASL_DISABLE");
  if (!result || (result = (int8x16_t *)_platform_strcmp(result, (int8x16_t *)"1"), (_DWORD)result))
  {
    *(_BYTE *)v10 = 1;
    if (a2)
    {
      v12 = *(_QWORD **)(a2 + 32);
      if (v12)
        *(_QWORD *)(v10 + 8) = *v12;
    }
  }
  return result;
}

_BYTE *__pfz_setup(uint64_t *a1)
{
  _BYTE *result;
  char v2;
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  int v6;
  int v7;
  _QWORD *v8;
  unint64_t v9;

  result = (_BYTE *)_simple_getenv(a1, (uint64_t)"pfz");
  if (result)
  {
    if (*result == 48 && result[1] == 120 && (v2 = result[2]) != 0)
    {
      v3 = 0;
      v4 = result + 3;
      do
      {
        v5 = v2;
        if ((v2 - 48) >= 0xAu)
        {
          v6 = -87;
          if ((v5 - 97) >= 6u)
          {
            if ((v5 - 65) > 5u)
              goto LABEL_13;
            v6 = -55;
          }
        }
        else
        {
          v6 = -48;
        }
        v3 = (v6 + v5) + 16 * v3;
        v7 = *v4++;
        v2 = v7;
      }
      while (v7);
    }
    else
    {
LABEL_13:
      v3 = 0;
    }
    v8 = result - 4;
    v9 = _platform_strlen((uint64_t)result);
    result = _platform_bzero(v8, v9 + 4);
    if (v3)
      commpage_pfz_base = v3;
  }
  return result;
}

_QWORD *_platform_bzero(_QWORD *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v8;
  _QWORD *v9;

  if (a2 < 0x40)
    JUMPOUT(0x1DED88A40);
  if (a2 < 0x8000)
    JUMPOUT(0x1DED889E0);
  *result = 0;
  result[1] = 0;
  result[2] = 0;
  result[3] = 0;
  result[4] = 0;
  result[5] = 0;
  result[6] = 0;
  result[7] = 0;
  v2 = (unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0;
  v3 = (unint64_t)result + a2 - v2 - 64;
  if ((unint64_t)result + a2 > v2 + 64)
  {
    do
    {
      __asm { DC              ZVA, X3 }
      v2 += 64;
      v8 = v3 > 0x40;
      v3 -= 64;
    }
    while (v8);
  }
  v9 = (_QWORD *)(v2 + v3);
  *v9 = 0;
  v9[1] = 0;
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = 0;
  v9[5] = 0;
  v9[6] = 0;
  v9[7] = 0;
  return result;
}

uint64_t *_platform_memset(uint64_t *result, unsigned __int8 a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t *v4;
  _QWORD *v5;
  unint64_t v6;
  BOOL v7;
  unint64_t j;
  uint64_t *v9;
  unint64_t v10;
  BOOL v11;
  unint64_t i;

  v3 = 0x101010101010101 * a2;
  v4 = result;
  if (a3 < 0x40)
  {
    while (1)
    {
      v11 = a3 >= 8;
      a3 -= 8;
      if (!v11)
        break;
      *v4++ = v3;
    }
    for (i = a3 + 8; i; --i)
    {
      *(_BYTE *)v4 = v3;
      v4 = (uint64_t *)((char *)v4 + 1);
    }
  }
  else
  {
    if (a3 < 0x8000)
    {
      *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      v5 = (_QWORD *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0);
      v10 = (unint64_t)result + a3;
      v7 = v10 > (unint64_t)(v5 + 8);
      for (j = v10 - (_QWORD)(v5 + 8); v7; j -= 64)
      {
        *v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        v7 = j > 0x40;
      }
    }
    else
    {
      if (!v3)
        JUMPOUT(0x1DED8890CLL);
      *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      result[4] = v3;
      result[5] = v3;
      result[6] = v3;
      result[7] = v3;
      v5 = (_QWORD *)((unint64_t)(result + 8) & 0xFFFFFFFFFFFFFFC0);
      v6 = (unint64_t)result + a3;
      v7 = v6 > (unint64_t)(v5 + 8);
      for (j = v6 - (_QWORD)(v5 + 8); v7; j -= 64)
      {
        *v5 = v3;
        v5[1] = v3;
        v5[2] = v3;
        v5[3] = v3;
        v5[4] = v3;
        v5[5] = v3;
        v5[6] = v3;
        v5[7] = v3;
        v5 += 8;
        v7 = j > 0x40;
      }
    }
    v9 = (_QWORD *)((char *)v5 + j);
    *v9 = v3;
    v9[1] = v3;
    v9[2] = v3;
    v9[3] = v3;
    v9[4] = v3;
    v9[5] = v3;
    v9[6] = v3;
    v9[7] = v3;
  }
  return result;
}

mach_vm_address_t *_simple_asl_msg_new()
{
  mach_vm_address_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  mach_vm_address_t *v7;
  int v9;

  v0 = (mach_vm_address_t *)_simple_salloc();
  v7 = v0;
  if (v0 && _simple_sprintf(v0, "         0", v1, v2, v3, v4, v5, v6, v9))
  {
    _simple_sfree(v7);
    return 0;
  }
  return v7;
}

mach_vm_address_t *_os_log_simple(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, int a9)
{
  uint64_t v9;
  mach_vm_address_t *result;
  mach_vm_address_t *v18;
  uint64_t v19;

  result = (mach_vm_address_t *)_simple_salloc();
  if (result)
  {
    v18 = result;
    _simple_vesprintf(result, 0, a7, &a9);
    v19 = _simple_string((_BYTE **)v18);
    __os_log_simple_offset(a1, a2, a3, a4, v9, a5, a6, v19);
    return _simple_sfree(v18);
  }
  return result;
}

vm_address_t _simple_salloc()
{
  _QWORD *v0;
  vm_address_t result;
  vm_address_t v2;
  vm_address_t v3;
  vm_address_t address;

  v0 = (_QWORD *)MEMORY[0x1E0C88820];
  if (vm_allocate(*MEMORY[0x1E0C883F0], &address, *MEMORY[0x1E0C88820], 1))
    return 0;
  v2 = address + 40;
  *(_QWORD *)address = address + 40;
  result = address;
  v3 = address + *v0 - 1;
  *(_QWORD *)(address + 8) = v2;
  *(_QWORD *)(result + 16) = v3;
  *(_QWORD *)(result + 32) = _enlarge;
  return result;
}

uint64_t __os_log_simple_offset(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, uint64_t a8)
{
  pid_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t buffer[4];
  int v32;

  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v25 = 0u;
  v24[0] = a6;
  v24[1] = a7;
  v24[2] = a8;
  v24[3] = mach_continuous_time();
  v13 = getpid();
  *(_QWORD *)&v25 = v13;
  if (proc_pidinfo(v13, 17, 0, buffer, 56) == 56)
  {
    *((_QWORD *)&v25 + 1) = buffer[2];
    *(_QWORD *)&v26 = v32;
    _platform_memmove((uint64_t *)&v28 + 1, buffer, 0x10uLL);
  }
  *((_QWORD *)&v26 + 1) = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) - 8);
  if (a1)
  {
    if (*(int *)(a1 + 24) >= 0)
      v14 = a1;
    else
      v14 = a4;
    *(_QWORD *)&v27 = a5 - v14;
    v15 = a2;
  }
  else
  {
    v15 = (uint64_t *)&v28 + 1;
  }
  _platform_memmove((uint64_t *)&v27 + 1, v15, 0x10uLL);
  _platform_memmove((uint64_t *)&v29 + 1, a3, 0x10uLL);
  return _os_log_simple_send((uint64_t)v24, v16, v17, v18, v19, v20, v21, v22);
}

mach_vm_address_t *_simple_sfree(mach_vm_address_t *address)
{
  mach_vm_address_t v1;
  mach_vm_size_t *v2;
  vm_map_t *v3;
  mach_vm_size_t v4;

  if (address)
  {
    v1 = (mach_vm_address_t)address;
    v2 = (mach_vm_size_t *)MEMORY[0x1E0C88820];
    v3 = (vm_map_t *)MEMORY[0x1E0C883F0];
    if (((*MEMORY[0x1E0C88820] - 1) & *address) != 0)
    {
      v4 = address[2] - (_QWORD)address + 1;
    }
    else
    {
      mach_vm_deallocate(*MEMORY[0x1E0C883F0], *address, address[2] - *address + 1);
      v4 = *v2;
    }
    return (mach_vm_address_t *)mach_vm_deallocate(*v3, v1, v4);
  }
  return address;
}

uint64_t _simple_vesprintf(_BYTE *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  __simple_bprintf(a1, a2, a3, a4);
  return 0;
}

_BYTE *__simple_bprintf(_BYTE *result, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, int *a4)
{
  unsigned __int8 *v4;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  char v11;
  unsigned __int8 *v12;
  _BYTE *v13;
  int v14;
  _BYTE *v15;
  BOOL v16;
  int8x16_t *v17;
  char v18;
  unsigned __int8 *v19;
  _BYTE *v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  _BYTE *v30;
  int *v31;
  int v32;
  unsigned __int8 *v33;
  uint64_t v34;
  unsigned int v35;
  char v36;
  unsigned __int8 *v37;
  _BYTE *v38;
  int v39;
  _BYTE *v40;
  std::ios_base *v41;
  uint64_t v42;
  char v43;
  unsigned __int8 *v44;
  _BYTE *v45;
  int v46;
  _BYTE *v47;
  int *v48;
  int v49;
  char v50;
  unsigned __int8 *v51;
  _BYTE *v52;
  int v53;
  const char **v54;
  const char *v55;
  const char *v56;
  int v57;
  uint64_t v58;
  char v59;
  unsigned __int8 *v60;
  _BYTE *v61;
  int v62;
  _BYTE *v63;
  char v64;
  unsigned __int8 *v65;
  _BYTE *v66;
  int v67;
  char *v68;
  char v69;
  unint64_t *v70;
  unint64_t v71;
  unint64_t *v72;
  unint64_t v73;
  char v74;
  unsigned __int8 *v75;
  _BYTE *v76;
  int v77;
  _BYTE *v78;
  _BYTE *v79;
  char v80;
  unsigned __int8 *v81;
  _BYTE *v82;
  int v83;
  unsigned __int8 *v84;
  unsigned __int8 v85;

  if (!*a3)
    return result;
  v4 = a3;
  v6 = (uint64_t)result;
  do
  {
    result = _platform_strchr((uint64_t)v4, 0x25u);
    if (!result)
    {
      while (1)
      {
        v85 = *v4;
        if (!*v4)
          break;
        if (a2 && (result = (_BYTE *)a2(*v4)) != 0)
        {
          v80 = *result;
          if (*result)
          {
            v81 = result + 1;
            do
            {
              v82 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v82 >= *(_QWORD *)(v6 + 16))
              {
                result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v82 = *(_BYTE **)(v6 + 8);
              }
              *(_QWORD *)(v6 + 8) = v82 + 1;
              *v82 = v80;
              v83 = *v81++;
              v80 = v83;
            }
            while (v83);
          }
        }
        else
        {
          v84 = *(unsigned __int8 **)(v6 + 8);
          if ((unint64_t)v84 >= *(_QWORD *)(v6 + 16))
          {
            result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            v84 = *(unsigned __int8 **)(v6 + 8);
          }
          *(_QWORD *)(v6 + 8) = v84 + 1;
          *v84 = v85;
        }
        ++v4;
      }
      return result;
    }
    v7 = result;
    v8 = result - v4;
    if (result - v4 >= 1)
    {
      do
      {
        v10 = *v4++;
        v9 = v10;
        if (a2 && (result = (_BYTE *)a2(v9)) != 0)
        {
          v11 = *result;
          if (*result)
          {
            v12 = result + 1;
            do
            {
              v13 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v13 >= *(_QWORD *)(v6 + 16))
              {
                result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v13 = *(_BYTE **)(v6 + 8);
              }
              *(_QWORD *)(v6 + 8) = v13 + 1;
              *v13 = v11;
              v14 = *v12++;
              v11 = v14;
            }
            while (v14);
          }
        }
        else
        {
          v15 = *(_BYTE **)(v6 + 8);
          if ((unint64_t)v15 >= *(_QWORD *)(v6 + 16))
          {
            result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
            v15 = *(_BYTE **)(v6 + 8);
          }
          *(_QWORD *)(v6 + 8) = v15 + 1;
          *v15 = v9;
        }
        v16 = v8-- <= 1;
      }
      while (!v16);
    }
    v17 = (int8x16_t *)(v7 + 1);
    if (v7[1] == 37)
    {
      if (a2 && (result = (_BYTE *)a2(37)) != 0)
      {
        v18 = *result;
        if (*result)
        {
          v19 = result + 1;
          do
          {
            v20 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v20 >= *(_QWORD *)(v6 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v20 = *(_BYTE **)(v6 + 8);
            }
            *(_QWORD *)(v6 + 8) = v20 + 1;
            *v20 = v18;
            v21 = *v19++;
            v18 = v21;
          }
          while (v21);
        }
      }
      else
      {
        v30 = *(_BYTE **)(v6 + 8);
        if ((unint64_t)v30 >= *(_QWORD *)(v6 + 16))
        {
          result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          v30 = *(_BYTE **)(v6 + 8);
        }
        *(_QWORD *)(v6 + 8) = v30 + 1;
        *v30 = 37;
      }
      v4 = v7 + 2;
      continue;
    }
    result = (_BYTE *)_platform_strncmp((int8x16_t *)(v7 + 1), (int8x16_t *)".*s", 3uLL);
    if (!(_DWORD)result)
    {
LABEL_44:
      v31 = a4;
      v32 = *a4;
      a4 += 4;
      if (v32 >= 1)
      {
        v33 = (unsigned __int8 *)*((_QWORD *)v31 + 1);
        do
        {
          v35 = *v33++;
          v34 = v35;
          if (a2 && (result = (_BYTE *)a2(v34)) != 0)
          {
            v36 = *result;
            if (*result)
            {
              v37 = result + 1;
              do
              {
                v38 = *(_BYTE **)(v6 + 8);
                if ((unint64_t)v38 >= *(_QWORD *)(v6 + 16))
                {
                  result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  v38 = *(_BYTE **)(v6 + 8);
                }
                *(_QWORD *)(v6 + 8) = v38 + 1;
                *v38 = v36;
                v39 = *v37++;
                v36 = v39;
              }
              while (v39);
            }
          }
          else
          {
            v40 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v40 >= *(_QWORD *)(v6 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v40 = *(_BYTE **)(v6 + 8);
            }
            *(_QWORD *)(v6 + 8) = v40 + 1;
            *v40 = v34;
          }
          v16 = v32-- <= 1;
        }
        while (!v16);
      }
      v17 = (int8x16_t *)((char *)v17 + 2);
      goto LABEL_148;
    }
    v22 = 0;
    v23 = 0;
    v24 = 0;
    while (1)
    {
      v25 = v17->i8[0];
      v26 = v17->u8[0];
      if (v25 > 98)
      {
        switch(v17->i8[0])
        {
          case 'c':
            if (v24 >= 2)
            {
              if (v23)
                v42 = 48;
              else
                v42 = 32;
              do
              {
                if (a2 && (result = (_BYTE *)a2(v42)) != 0)
                {
                  v43 = *result;
                  if (*result)
                  {
                    v44 = result + 1;
                    do
                    {
                      v45 = *(_BYTE **)(v6 + 8);
                      if ((unint64_t)v45 >= *(_QWORD *)(v6 + 16))
                      {
                        result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        v45 = *(_BYTE **)(v6 + 8);
                      }
                      *(_QWORD *)(v6 + 8) = v45 + 1;
                      *v45 = v43;
                      v46 = *v44++;
                      v43 = v46;
                    }
                    while (v46);
                  }
                }
                else
                {
                  v47 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v47 >= *(_QWORD *)(v6 + 16))
                  {
                    result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v47 = *(_BYTE **)(v6 + 8);
                  }
                  *(_QWORD *)(v6 + 8) = v47 + 1;
                  *v47 = v42;
                }
                v16 = v24-- <= 2;
              }
              while (!v16);
            }
            v48 = a4;
            a4 += 2;
            v49 = *v48;
            if (a2 && (result = (_BYTE *)a2(*v48)) != 0)
            {
              v50 = *result;
              if (*result)
              {
                v51 = result + 1;
                do
                {
                  v52 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v52 >= *(_QWORD *)(v6 + 16))
                  {
                    result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v52 = *(_BYTE **)(v6 + 8);
                  }
                  *(_QWORD *)(v6 + 8) = v52 + 1;
                  *v52 = v50;
                  v53 = *v51++;
                  v50 = v53;
                }
                while (v53);
              }
            }
            else
            {
              v78 = *(_BYTE **)(v6 + 8);
              if ((unint64_t)v78 >= *(_QWORD *)(v6 + 16))
              {
                result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                v78 = *(_BYTE **)(v6 + 8);
              }
              *(_QWORD *)(v6 + 8) = v78 + 1;
              *v78 = v49;
            }
            break;
          case 'd':
          case 'i':
            a4 += 2;
            result = dec((std::ios_base *)v6);
            break;
          case 'l':
            ++v22;
            v17 = (int8x16_t *)((char *)v17 + 1);
            goto LABEL_32;
          case 'o':
            a4 += 2;
            result = oct((std::ios_base *)v6);
            break;
          case 'p':
            a4 += 2;
            v41 = (std::ios_base *)v6;
            goto LABEL_90;
          case 's':
            v54 = (const char **)a4;
            a4 += 2;
            v55 = *v54;
            if (v55)
              v56 = v55;
            else
              v56 = "(null)";
            result = (_BYTE *)_platform_strlen((uint64_t)v56);
            v57 = v24 - (_DWORD)result;
            if (v24 - (int)result >= 1)
            {
              if (v23)
                v58 = 48;
              else
                v58 = 32;
              do
              {
                if (a2 && (result = (_BYTE *)a2(v58)) != 0)
                {
                  v59 = *result;
                  if (*result)
                  {
                    v60 = result + 1;
                    do
                    {
                      v61 = *(_BYTE **)(v6 + 8);
                      if ((unint64_t)v61 >= *(_QWORD *)(v6 + 16))
                      {
                        result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                        v61 = *(_BYTE **)(v6 + 8);
                      }
                      *(_QWORD *)(v6 + 8) = v61 + 1;
                      *v61 = v59;
                      v62 = *v60++;
                      v59 = v62;
                    }
                    while (v62);
                  }
                }
                else
                {
                  v63 = *(_BYTE **)(v6 + 8);
                  if ((unint64_t)v63 >= *(_QWORD *)(v6 + 16))
                  {
                    result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                    v63 = *(_BYTE **)(v6 + 8);
                  }
                  *(_QWORD *)(v6 + 8) = v63 + 1;
                  *v63 = v58;
                }
                v16 = v57-- <= 1;
              }
              while (!v16);
            }
            while (1)
            {
              v69 = *v56;
              if (!*v56)
                break;
              if (a2 && (result = (_BYTE *)a2(*(unsigned __int8 *)v56)) != 0)
              {
                v64 = *result;
                if (*result)
                {
                  v65 = result + 1;
                  do
                  {
                    v66 = *(_BYTE **)(v6 + 8);
                    if ((unint64_t)v66 >= *(_QWORD *)(v6 + 16))
                    {
                      result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                      v66 = *(_BYTE **)(v6 + 8);
                    }
                    *(_QWORD *)(v6 + 8) = v66 + 1;
                    *v66 = v64;
                    v67 = *v65++;
                    v64 = v67;
                  }
                  while (v67);
                }
              }
              else
              {
                v68 = *(char **)(v6 + 8);
                if ((unint64_t)v68 >= *(_QWORD *)(v6 + 16))
                {
                  result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
                  v68 = *(char **)(v6 + 8);
                }
                *(_QWORD *)(v6 + 8) = v68 + 1;
                *v68 = v69;
              }
              ++v56;
            }
            break;
          case 'u':
            v70 = (unint64_t *)a4;
            a4 += 2;
            if (v22)
              v71 = *v70;
            else
              v71 = *(unsigned int *)v70;
            result = udec(v6, a2, v71, v24, v23);
            break;
          case 'x':
            goto LABEL_62;
          case 'y':
            v72 = (unint64_t *)a4;
            a4 += 2;
            if (v22)
              v73 = *v72;
            else
              v73 = *(unsigned int *)v72;
            result = ydec(v6, a2, v73, v24, v23);
            break;
          default:
            goto LABEL_130;
        }
        goto LABEL_148;
      }
      if ((v25 - 49) >= 9)
        break;
LABEL_35:
      if ((v26 - 48) <= 9)
      {
        do
        {
          v27 = 10 * v24 + v26;
          v28 = v17->u8[1];
          v17 = (int8x16_t *)((char *)v17 + 1);
          LOBYTE(v26) = v28;
          v24 = v27 - 48;
        }
        while ((v28 - 48) < 0xA);
      }
LABEL_32:
      result = (_BYTE *)_platform_strncmp(v17, (int8x16_t *)".*s", 3uLL);
      if (!(_DWORD)result)
        goto LABEL_44;
    }
    if (v25 == 48)
    {
      ++v23;
      v29 = v17->u8[1];
      v17 = (int8x16_t *)((char *)v17 + 1);
      v26 = v29;
      goto LABEL_35;
    }
    if (v25 == 88)
    {
LABEL_62:
      a4 += 2;
      v41 = (std::ios_base *)v6;
LABEL_90:
      result = hex(v41);
    }
    else
    {
LABEL_130:
      if (a2 && (result = (_BYTE *)a2(v17->u8[0])) != 0)
      {
        v74 = *result;
        if (*result)
        {
          v75 = result + 1;
          do
          {
            v76 = *(_BYTE **)(v6 + 8);
            if ((unint64_t)v76 >= *(_QWORD *)(v6 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
              v76 = *(_BYTE **)(v6 + 8);
            }
            *(_QWORD *)(v6 + 8) = v76 + 1;
            *v76 = v74;
            v77 = *v75++;
            v74 = v77;
          }
          while (v77);
        }
      }
      else
      {
        v79 = *(_BYTE **)(v6 + 8);
        if ((unint64_t)v79 >= *(_QWORD *)(v6 + 16))
        {
          result = (_BYTE *)(*(uint64_t (**)(uint64_t))(v6 + 32))(v6);
          v79 = *(_BYTE **)(v6 + 8);
        }
        *(_QWORD *)(v6 + 8) = v79 + 1;
        *v79 = v26;
      }
    }
LABEL_148:
    v4 = &v17->u8[1];
  }
  while (*v4);
  return result;
}

unsigned __int8 *_platform_strchr(uint64_t a1, unsigned __int8 a2)
{
  int8x16_t v2;
  uint64_t v3;
  unint64_t v4;
  int8x16_t v5;
  uint8x16_t i;
  int8x16_t v7;
  uint8x16_t v8;
  unsigned __int8 *result;

  v2 = vdupq_n_s8(a2);
  v3 = a1 & 0xF;
  v4 = a1 & 0xFFFFFFFFFFFFFFF0;
  v5 = *(int8x16_t *)&algn_1DED89610[-v3];
  for (i = (uint8x16_t)vorrq_s8(vbicq_s8(*(int8x16_t *)v4, vceqq_s8(*(int8x16_t *)v4, v2)), v5);
        ;
        i = (uint8x16_t)vbicq_s8(v7, v5))
  {
    v5.i8[0] = vminvq_u8(i);
    if (!v5.i32[0])
      break;
    v7 = *(int8x16_t *)(v4 + 16);
    v4 += 16;
    v5 = vceqq_s8(v7, v2);
  }
  v8 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v5, v5)), (int8x16_t)xmmword_1DED89600);
  v8.i8[0] = vminvq_u8(v8);
  result = (unsigned __int8 *)(v4 + v8.u32[0]);
  if (a2 != (unint64_t)*result)
    return 0;
  return result;
}

uint64_t _simple_string(_BYTE **a1)
{
  *a1[1] = 0;
  return (uint64_t)*a1;
}

uint64_t _simple_sprintf(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  __simple_bprintf(a1, 0, a2, &a9);
  return 0;
}

std::ios_base *__cdecl dec(std::ios_base *__str)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  int v3;
  int v4;
  uint64_t (*v5)(uint64_t);
  int v7;
  unint64_t v8;
  char *v9;
  unint64_t v10;
  BOOL v11;
  _BOOL4 v12;
  _BYTE *v13;
  unsigned __int8 *v14;
  _BYTE *v15;
  int v16;
  _BYTE *v17;
  std::ios_base *result;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unsigned __int8 *v22;
  _BYTE *v23;
  int v24;
  _BYTE *v25;
  char v27;
  unsigned __int8 *v28;
  _BYTE *v29;
  int v30;
  _BYTE *v31;
  char v32;
  unsigned __int8 *v33;
  _BYTE *v34;
  int v35;
  char *v36;
  char v37;
  char v38;
  char v39;

  v5 = v1;
  v7 = (v2 >> 63) + v3;
  v8 = (unint64_t)v2 >> 63;
  v39 = 0;
  if (v2)
  {
    v9 = &v39;
    if (v2 >= 0)
      v10 = v2;
    else
      v10 = -v2;
    do
    {
      *--v9 = (v10 % 0xA) | 0x30;
      v11 = v10 >= 0xA;
      v10 /= 0xAuLL;
    }
    while (v11);
    v12 = v4 != 0;
    if (v2 < 0 && v4)
    {
      if (v1 && (v13 = (_BYTE *)v1(45)) != 0)
      {
        LODWORD(v8) = *v13;
        if (*v13)
        {
          v14 = v13 + 1;
          do
          {
            v15 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v15 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v15 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v15 + 1;
            *v15 = v8;
            v16 = *v14++;
            LODWORD(v8) = v16;
          }
          while (v16);
        }
      }
      else
      {
        v17 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v17 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v17 = *(_BYTE **)&__str->__fmtflags_;
        }
        LODWORD(v8) = 0;
        *(_QWORD *)&__str->__fmtflags_ = v17 + 1;
        *v17 = 45;
      }
      v12 = 1;
    }
  }
  else
  {
    v9 = &v38;
    v38 = 48;
    v12 = v4 != 0;
  }
  result = (std::ios_base *)_platform_strlen((uint64_t)v9);
  v19 = v7 - (_QWORD)result;
  if (v19 >= 1)
  {
    if (v12)
      v20 = 48;
    else
      v20 = 32;
    do
    {
      if (v5 && (result = (std::ios_base *)v5(v20)) != 0)
      {
        v21 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          v22 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            v23 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v23 >= __str->__precision_)
            {
              result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v23 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v23 + 1;
            *v23 = v21;
            v24 = *v22++;
            v21 = v24;
          }
          while (v24);
        }
      }
      else
      {
        v25 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v25 >= __str->__precision_)
        {
          result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v25 = *(_BYTE **)&__str->__fmtflags_;
        }
        *(_QWORD *)&__str->__fmtflags_ = v25 + 1;
        *v25 = v20;
      }
    }
    while (v19-- > 1);
  }
  if ((_DWORD)v8)
  {
    if (v5 && (result = (std::ios_base *)v5(45)) != 0)
    {
      v27 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        v28 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          v29 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v29 >= __str->__precision_)
          {
            result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            v29 = *(_BYTE **)&__str->__fmtflags_;
          }
          *(_QWORD *)&__str->__fmtflags_ = v29 + 1;
          *v29 = v27;
          v30 = *v28++;
          v27 = v30;
        }
        while (v30);
      }
    }
    else
    {
      v31 = *(_BYTE **)&__str->__fmtflags_;
      if ((unint64_t)v31 >= __str->__precision_)
      {
        result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        v31 = *(_BYTE **)&__str->__fmtflags_;
      }
      *(_QWORD *)&__str->__fmtflags_ = v31 + 1;
      *v31 = 45;
    }
  }
  while (1)
  {
    v37 = *v9;
    if (!*v9)
      break;
    if (v5 && (result = (std::ios_base *)v5(*v9)) != 0)
    {
      v32 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        v33 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          v34 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v34 >= __str->__precision_)
          {
            result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            v34 = *(_BYTE **)&__str->__fmtflags_;
          }
          *(_QWORD *)&__str->__fmtflags_ = v34 + 1;
          *v34 = v32;
          v35 = *v33++;
          v32 = v35;
        }
        while (v35);
      }
    }
    else
    {
      v36 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v36 >= __str->__precision_)
      {
        result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        v36 = *(char **)&__str->__fmtflags_;
      }
      *(_QWORD *)&__str->__fmtflags_ = v36 + 1;
      *v36 = v37;
    }
    ++v9;
  }
  return result;
}

uint64_t _os_log_simple_parse(unsigned __int16 *a1, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a2 < 0x68)
    return 94;
  v5 = *a1;
  v6 = a1[1];
  if (v5 + v6 + 104 > a2)
    return 7;
  v7 = *((unsigned __int8 *)a1 + 4);
  if (v7 > 0x10 || ((1 << v7) & 0x10007) == 0)
    return 22;
  *(_BYTE *)a3 = v7;
  if ((_DWORD)v6)
  {
    v10 = (uint64_t)a1 + v5 + 104;
    if (*(_BYTE *)(v10 + (v6 - 1)))
      return 22;
  }
  else
  {
    v10 = 0;
  }
  *(_QWORD *)(a3 + 8) = v10;
  if ((_DWORD)v5)
  {
    if (!*((_BYTE *)a1 + (v5 - 1) + 104))
    {
      v11 = *((_QWORD *)a1 + 1);
      *(_QWORD *)(a3 + 16) = a1 + 52;
      *(_QWORD *)(a3 + 24) = v11;
      if (v11)
      {
        if (v11 <= mach_continuous_time())
        {
          v12 = *((_QWORD *)a1 + 2);
          *(_QWORD *)(a3 + 32) = v12;
          *(_QWORD *)(a3 + 40) = *((_QWORD *)a1 + 3);
          *(_QWORD *)(a3 + 48) = *((_QWORD *)a1 + 4);
          *(_QWORD *)(a3 + 56) = *((_QWORD *)a1 + 5);
          if (v12)
          {
            *(_QWORD *)(a3 + 64) = *((_QWORD *)a1 + 6);
            _platform_memmove((uint64_t *)(a3 + 72), (uint64_t *)a1 + 7, 0x10uLL);
            _platform_memmove((uint64_t *)(a3 + 88), (uint64_t *)a1 + 9, 0x10uLL);
            _platform_memmove((uint64_t *)(a3 + 104), (uint64_t *)a1 + 11, 0x10uLL);
            return 0;
          }
        }
      }
    }
  }
  return 22;
}

uint64_t _os_log_simple_send(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19[243];

  if ((_simple_asl_get_fd(a1, a2, a3, a4, a5, a6, a7, a8) & 0x80000000) != 0)
    return 9;
  if ((MEMORY[0xFFFFFC105] & 4) != 0)
    return 0;
  v9 = _platform_strlen(*(_QWORD *)(a1 + 16)) + 1;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
    v11 = _platform_strlen(v10) + 1;
  else
    v11 = 0;
  v13 = v11 + v9 + 104;
  v14 = __CFADD__(v11, v9 + 104);
  result = 84;
  if (v9 < 0xFFFFFFFFFFFFFF98 && !v14)
  {
    if (v13 <= 0x800)
    {
      _platform_memmove(&v16, (uint64_t *)(a1 + 72), 0x10uLL);
      _platform_memmove(&v17, (uint64_t *)(a1 + 88), 0x10uLL);
      _platform_memmove(&v18, (uint64_t *)(a1 + 104), 0x10uLL);
      _platform_strlcpy(v19, *(uint64_t **)(a1 + 16), v9);
      if (v11)
        _platform_strlcpy((uint64_t *)((char *)v19 + v9), *(uint64_t **)(a1 + 8), v11);
      v15 = __sendto();
      if ((v15 & 0x8000000000000000) != 0)
      {
        return *__error();
      }
      else if (v15 >= v13)
      {
        return 0;
      }
      else
      {
        return 40;
      }
    }
    else
    {
      return 7;
    }
  }
  return result;
}

uint64_t _simple_getenv(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  unsigned __int8 *v10;
  uint64_t v11;

  v4 = _platform_strlen(a2);
  if (!a1)
    return 0;
  v5 = v4;
  result = *a1;
  if (!*a1)
    return result;
  while (1)
  {
    if (_platform_strlen(result) >= v5)
    {
      v7 = *a1;
      if (v5)
      {
        v8 = v5;
        v9 = (unsigned __int8 *)*a1;
        v10 = (unsigned __int8 *)a2;
        while (*v9 == *v10)
        {
          ++v10;
          ++v9;
          if (!--v8)
            goto LABEL_8;
        }
        goto LABEL_9;
      }
LABEL_8:
      if (*(_BYTE *)(v7 + v5) == 61)
        return v5 + v7 + 1;
    }
LABEL_9:
    v11 = a1[1];
    ++a1;
    result = v11;
    if (!v11)
      return result;
  }
}

unint64_t _platform_strlcat(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;

  v6 = _platform_strlen((uint64_t)a2);
  v7 = _platform_strnlen(a1, a3);
  v8 = a3 - v7;
  if (a3 == v7)
  {
    v9 = a3;
  }
  else
  {
    v9 = v7;
    v10 = (uint64_t *)(a1 + v7);
    if (v6 >= v8)
    {
      _platform_memmove(v10, a2, v8 - 1);
      *(_BYTE *)(a3 + a1 - 1) = 0;
    }
    else
    {
      _platform_memmove(v10, a2, v6 + 1);
    }
  }
  return v9 + v6;
}

int8x16_t *_platform_strstr(int8x16_t *a1, _BYTE *a2)
{
  int8x16_t *v2;
  int8x16_t *v3;
  int v4;
  unint64_t v5;
  int v6;
  int8x16_t *v7;

  v2 = a1;
  v3 = (int8x16_t *)(a2 + 1);
  v4 = *a2;
  if (!*a2)
    return a1;
  v5 = _platform_strlen((uint64_t)(a2 + 1));
  while (1)
  {
    v6 = v2->u8[0];
    if (!v2->i8[0])
      break;
    v7 = v2;
    v2 = (int8x16_t *)((char *)v2 + 1);
    if (v6 == v4 && !_platform_strncmp(v2, v3, v5))
      return v7;
  }
  return 0;
}

unint64_t _platform_strlcpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v6 = _platform_strlen((uint64_t)a2);
  v7 = v6;
  if (v6 >= a3)
  {
    if (a3)
    {
      v8 = a3 - 1;
      _platform_memmove(a1, a2, v8);
      *((_BYTE *)a1 + v8) = 0;
    }
  }
  else
  {
    _platform_memmove(a1, a2, v6 + 1);
  }
  return v7;
}

uint64_t *_platform_strncpy(uint64_t *a1, uint64_t *a2, unint64_t a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v6 = _platform_strnlen((uint64_t)a2, a3);
  v7 = a3 - v6;
  if (a3 <= v6)
  {
    _platform_memmove(a1, a2, a3);
  }
  else
  {
    v8 = v6;
    _platform_memmove(a1, a2, v6);
    _platform_memset((uint64_t *)((char *)a1 + v8), 0, v7);
  }
  return a1;
}

uint64_t *_platform_strcpy(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;

  v4 = _platform_strlen((uint64_t)a2);
  _platform_memmove(a1, a2, v4 + 1);
  return a1;
}

uint64_t *_platform_memmove(uint64_t *result, uint64_t *a2, unint64_t a3)
{
  uint64_t *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  unint64_t v15;
  BOOL v16;
  unint64_t k;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  unint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  BOOL v43;
  unint64_t j;
  char v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t i;
  char v72;

  if ((char *)result - (char *)a2 < a3)
  {
    if (result != a2)
    {
      v46 = (char *)result + a3;
      v47 = (char *)a2 + a3;
      if (a3 < 0x40)
      {
        while (1)
        {
          v43 = a3 >= 8;
          a3 -= 8;
          if (!v43)
            break;
          v70 = *((_QWORD *)v47 - 1);
          v47 -= 8;
          *((_QWORD *)v46 - 1) = v70;
          v46 -= 8;
        }
        for (i = a3 + 8; i; --i)
        {
          v72 = *--v47;
          *--v46 = v72;
        }
      }
      else
      {
        if (a3 < 0x4000)
        {
          v65 = *((_QWORD *)v47 - 2);
          v66 = *((_QWORD *)v47 - 1);
          v67 = *((_QWORD *)v47 - 4);
          v68 = *((_QWORD *)v47 - 3);
          v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0;
          v69 = v47 - &v46[-v52];
          v54 = *(_QWORD *)(v69 - 16);
          v55 = *(_QWORD *)(v69 - 8);
          v56 = *(_QWORD *)(v69 - 32);
          v57 = *(_QWORD *)(v69 - 24);
          *((_QWORD *)v46 - 2) = v65;
          *((_QWORD *)v46 - 1) = v66;
          *((_QWORD *)v46 - 4) = v67;
          *((_QWORD *)v46 - 3) = v68;
          v58 = v69 - 32;
          v59 = v52 - (_QWORD)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_QWORD *)(v52 - 16) = v54;
              *(_QWORD *)(v52 - 8) = v55;
              *(_QWORD *)(v52 - 32) = v56;
              *(_QWORD *)(v52 - 24) = v57;
              v52 -= 32;
              v54 = *(_QWORD *)(v58 - 16);
              v55 = *(_QWORD *)(v58 - 8);
              v56 = *(_QWORD *)(v58 - 32);
              v57 = *(_QWORD *)(v58 - 24);
              v58 -= 32;
              v16 = v59 > 0x20;
              v59 -= 32;
            }
            while (v16);
          }
        }
        else
        {
          v48 = *((_QWORD *)v47 - 2);
          v49 = *((_QWORD *)v47 - 1);
          v50 = *((_QWORD *)v47 - 4);
          v51 = *((_QWORD *)v47 - 3);
          v52 = (unint64_t)(v46 - 1) & 0xFFFFFFFFFFFFFFE0;
          v53 = v47 - &v46[-v52];
          v54 = *(_QWORD *)(v53 - 16);
          v55 = *(_QWORD *)(v53 - 8);
          v56 = *(_QWORD *)(v53 - 32);
          v57 = *(_QWORD *)(v53 - 24);
          *((_QWORD *)v46 - 2) = v48;
          *((_QWORD *)v46 - 1) = v49;
          *((_QWORD *)v46 - 4) = v50;
          *((_QWORD *)v46 - 3) = v51;
          v58 = v53 - 32;
          v59 = v52 - (_QWORD)result - 64;
          if (v52 - (unint64_t)result > 0x40)
          {
            do
            {
              *(_QWORD *)(v52 - 16) = v54;
              *(_QWORD *)(v52 - 8) = v55;
              *(_QWORD *)(v52 - 32) = v56;
              *(_QWORD *)(v52 - 24) = v57;
              v52 -= 32;
              v54 = *(_QWORD *)(v58 - 16);
              v55 = *(_QWORD *)(v58 - 8);
              v56 = *(_QWORD *)(v58 - 32);
              v57 = *(_QWORD *)(v58 - 24);
              v58 -= 32;
              v16 = v59 > 0x20;
              v59 -= 32;
            }
            while (v16);
          }
        }
        v60 = v58 - v59;
        v61 = *(_QWORD *)(v60 - 16);
        v62 = *(_QWORD *)(v60 - 8);
        v63 = *(_QWORD *)(v60 - 32);
        v64 = *(_QWORD *)(v60 - 24);
        *(_QWORD *)(v52 - 16) = v54;
        *(_QWORD *)(v52 - 8) = v55;
        *(_QWORD *)(v52 - 32) = v56;
        *(_QWORD *)(v52 - 24) = v57;
        result[2] = v61;
        result[3] = v62;
        *result = v63;
        result[1] = v64;
      }
    }
  }
  else
  {
    v3 = result;
    if (a3 < 0x40)
    {
      while (1)
      {
        v43 = a3 >= 8;
        a3 -= 8;
        if (!v43)
          break;
        v42 = *a2++;
        *v3++ = v42;
      }
      for (j = a3 + 8; j; --j)
      {
        v45 = *(_BYTE *)a2;
        a2 = (uint64_t *)((char *)a2 + 1);
        *(_BYTE *)v3 = v45;
        v3 = (uint64_t *)((char *)v3 + 1);
      }
    }
    else
    {
      if ((char *)a2 - (char *)result < a3)
      {
        if (a3 < 0x4000)
        {
          v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0);
          v30 = *a2;
          v31 = a2[1];
          v32 = a2[2];
          v33 = a2[3];
          v34 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          v10 = *v34;
          v11 = v34[1];
          v12 = v34[2];
          v13 = v34[3];
          v14 = v34 + 4;
          v35 = a3 - (v4 - (char *)result);
          *result = v30;
          result[1] = v31;
          result[2] = v32;
          result[3] = v33;
          v16 = v35 > 0x40;
          for (k = v35 - 64; v16; k -= 32)
          {
            *(_QWORD *)v4 = v10;
            *((_QWORD *)v4 + 1) = v11;
            *((_QWORD *)v4 + 2) = v12;
            *((_QWORD *)v4 + 3) = v13;
            v4 += 32;
            v10 = *v14;
            v11 = v14[1];
            v12 = v14[2];
            v13 = v14[3];
            v14 += 4;
            v16 = k > 0x20;
          }
        }
        else
        {
          v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0);
          v24 = *a2;
          v25 = a2[1];
          v26 = a2[2];
          v27 = a2[3];
          v28 = (uint64_t *)((char *)a2 + v4 - (char *)result);
          v10 = *v28;
          v11 = v28[1];
          v12 = v28[2];
          v13 = v28[3];
          v14 = v28 + 4;
          v29 = a3 - (v4 - (char *)result);
          *result = v24;
          result[1] = v25;
          result[2] = v26;
          result[3] = v27;
          v16 = v29 > 0x40;
          for (k = v29 - 64; v16; k -= 32)
          {
            *(_QWORD *)v4 = v10;
            *((_QWORD *)v4 + 1) = v11;
            *((_QWORD *)v4 + 2) = v12;
            *((_QWORD *)v4 + 3) = v13;
            v4 += 32;
            v10 = *v14;
            v11 = v14[1];
            v12 = v14[2];
            v13 = v14[3];
            v14 += 4;
            v16 = k > 0x20;
          }
        }
      }
      else if (a3 < 0x4000)
      {
        v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0);
        v18 = *a2;
        v19 = a2[1];
        v20 = a2[2];
        v21 = a2[3];
        v22 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        v10 = *v22;
        v11 = v22[1];
        v12 = v22[2];
        v13 = v22[3];
        v14 = v22 + 4;
        v23 = a3 - (v4 - (char *)result);
        *result = v18;
        result[1] = v19;
        result[2] = v20;
        result[3] = v21;
        v16 = v23 > 0x40;
        for (k = v23 - 64; v16; k -= 32)
        {
          *(_QWORD *)v4 = v10;
          *((_QWORD *)v4 + 1) = v11;
          *((_QWORD *)v4 + 2) = v12;
          *((_QWORD *)v4 + 3) = v13;
          v4 += 32;
          v10 = *v14;
          v11 = v14[1];
          v12 = v14[2];
          v13 = v14[3];
          v14 += 4;
          v16 = k > 0x20;
        }
      }
      else
      {
        v4 = (char *)((unint64_t)(result + 4) & 0xFFFFFFFFFFFFFFE0);
        v5 = *a2;
        v6 = a2[1];
        v7 = a2[2];
        v8 = a2[3];
        v9 = (uint64_t *)((char *)a2 + v4 - (char *)result);
        v10 = *v9;
        v11 = v9[1];
        v12 = v9[2];
        v13 = v9[3];
        v14 = v9 + 4;
        v15 = a3 - (v4 - (char *)result);
        *result = v5;
        result[1] = v6;
        result[2] = v7;
        result[3] = v8;
        v16 = v15 > 0x40;
        for (k = v15 - 64; v16; k -= 32)
        {
          *(_QWORD *)v4 = v10;
          *((_QWORD *)v4 + 1) = v11;
          *((_QWORD *)v4 + 2) = v12;
          *((_QWORD *)v4 + 3) = v13;
          v4 += 32;
          v10 = *v14;
          v11 = v14[1];
          v12 = v14[2];
          v13 = v14[3];
          v14 += 4;
          v16 = k > 0x20;
        }
      }
      v36 = (uint64_t *)((char *)v14 + k);
      v37 = *v36;
      v38 = v36[1];
      v39 = v36[2];
      v40 = v36[3];
      *(_QWORD *)v4 = v10;
      *((_QWORD *)v4 + 1) = v11;
      *((_QWORD *)v4 + 2) = v12;
      *((_QWORD *)v4 + 3) = v13;
      v41 = &v4[k];
      *((_QWORD *)v41 + 4) = v37;
      *((_QWORD *)v41 + 5) = v38;
      *((_QWORD *)v41 + 6) = v39;
      *((_QWORD *)v41 + 7) = v40;
    }
  }
  return result;
}

unint64_t _platform_strnlen(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  int8x16_t *v4;
  int8x16_t v5;
  uint8x16_t v6;
  unint64_t v7;
  uint8x16_t v8;
  BOOL v9;
  uint8x16_t v10;
  unint64_t v11;

  if (a2 < 0)
    return _platform_strlen(a1);
  if (!a2)
    return 0;
  v3 = a1 & 0xFFFFFFFFFFFFFFF0;
  v4 = (int8x16_t *)&algn_1DED8A310[-(a1 & 0xF)];
  v5 = *v4;
  v6 = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v4);
  v7 = a2 + (a1 & 0xF);
  while (1)
  {
    v5.i8[0] = vminvq_u8(v6);
    if (!v5.i32[0])
      break;
    v9 = v7 > 0x10;
    v7 -= 16;
    if (!v9)
      return v3 - a1 + v7 + 16;
    v8 = *(uint8x16_t *)(v3 + 16);
    v3 += 16;
    v6 = v8;
  }
  v10 = (uint8x16_t)veorq_s8(v5, v5);
  v10.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v6, v10), (int8x16_t)xmmword_1DED8A300));
  v11 = v3 - a1;
  if (v7 >= v10.u32[0])
    v7 = v10.u32[0];
  return v11 + v7;
}

unint64_t _platform_strlen(uint64_t a1)
{
  unint64_t v1;
  int8x16_t *v2;
  int8x16_t v3;
  uint8x16_t i;
  uint8x16_t v5;
  uint8x16_t v6;

  v1 = a1 & 0xFFFFFFFFFFFFFFF0;
  v2 = (int8x16_t *)&algn_1DED8A310[-(a1 & 0xF)];
  v3 = *v2;
  for (i = (uint8x16_t)vorrq_s8(*(int8x16_t *)(a1 & 0xFFFFFFFFFFFFFFF0), *v2); ; i = v5)
  {
    v3.i8[0] = vminvq_u8(i);
    if (!v3.i32[0])
      break;
    v5 = *(uint8x16_t *)(v1 + 16);
    v1 += 16;
  }
  v6 = (uint8x16_t)veorq_s8(v3, v3);
  v6.i8[0] = vminvq_u8((uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, v6), (int8x16_t)xmmword_1DED8A300));
  return v1 - a1 + v6.u32[0];
}

uint64_t _simple_asl_get_fd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 336) == -1)
    v8 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 344);
  else
    v8 = _os_alloc_once_0(MEMORY[0x1E0C87FA0] + 336, 32, (uint64_t)_simple_asl_init_context, a4, a5, a6, a7, a8);
  if (!*(_BYTE *)v8)
    return 0xFFFFFFFFLL;
  if (*(_QWORD *)(v8 + 24) != -1)
    _os_once_0(v8 + 24, 0, (uint64_t)_simple_asl_connect_once, a4, a5, a6, a7, a8);
  return *(unsigned int *)(v8 + 16);
}

unint64_t (*_os_alloc_once())(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_alloc_once_VARIANT_armv81;
  else
    return _os_alloc_once_VARIANT_mp;
}

unint64_t *(*_os_once())(unint64_t *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_once_VARIANT_armv81;
  else
    return _os_once_VARIANT_mp;
}

uint64_t _os_once_callout(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result;
  unint64_t v7;
  unsigned int v8;

  result = a3(a2);
  v7 = (4 * MEMORY[0xFFFFFC180]) | 1;
  do
    v8 = __ldxr(a1);
  while (__stlxr(v7, a1));
  if (v8 != a4)
    return _os_once_gate_broadcast((uint64_t)a1, v8, a4);
  return result;
}

uint64_t _os_once_callout_0(atomic_ullong *a1, uint64_t a2, uint64_t (*a3)(uint64_t), int a4)
{
  uint64_t result;
  unsigned int v7;

  result = a3(a2);
  v7 = atomic_exchange_explicit(a1, (4 * MEMORY[0xFFFFFC180]) | 1, memory_order_release);
  if (v7 != a4)
    return _os_once_gate_broadcast((uint64_t)a1, v7, a4);
  return result;
}

uint64_t _os_alloc(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t *v4;
  unint64_t v5;
  uint64_t result;
  uint64_t (*v7)(void);

  v1 = (_QWORD *)MEMORY[0x1E0C88820];
  v2 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  if (v2 - 1 >= (unint64_t)(2 * *MEMORY[0x1E0C88820] - 16))
    _os_alloc_cold_1((*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0, (int32_t *)v2);
  v4 = (unint64_t *)_os_alloc_heap;
  if (!_os_alloc_heap)
    goto LABEL_5;
  do
    v5 = __ldxr(v4);
  while (__stxr(v5 + v2, v4));
  if (v5 + v2 <= 2 * *v1 - 16)
    result = (uint64_t)v4 + v5 + 16;
  else
LABEL_5:
    result = _os_alloc_slow(v4, v2);
  *(_QWORD *)(*(_QWORD *)a1 + 8) = result;
  v7 = *(uint64_t (**)(void))(a1 + 16);
  if (v7)
    return v7();
  return result;
}

uint64_t _os_alloc_0(uint64_t a1)
{
  _QWORD *v1;
  unint64_t v2;
  atomic_ullong *v4;
  unint64_t add_explicit;
  uint64_t result;
  uint64_t (*v7)(void);

  v1 = (_QWORD *)MEMORY[0x1E0C88820];
  v2 = (*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0;
  if (v2 - 1 >= 2 * *MEMORY[0x1E0C88820] - 16)
    _os_alloc_cold_1((*(_DWORD *)(a1 + 8) + 15) & 0xFFFFFFF0, (int32_t *)v2);
  v4 = (atomic_ullong *)_os_alloc_heap;
  if (_os_alloc_heap
    && (add_explicit = atomic_fetch_add_explicit((atomic_ullong *volatile)_os_alloc_heap, v2, memory_order_relaxed),
        add_explicit + v2 <= 2 * *v1 - 16))
  {
    result = (uint64_t)v4 + add_explicit + 16;
  }
  else
  {
    result = _os_alloc_slow_0(v4, v2);
  }
  *(_QWORD *)(*(_QWORD *)a1 + 8) = result;
  v7 = *(uint64_t (**)(void))(a1 + 16);
  if (v7)
    return v7();
  return result;
}

uint64_t _os_alloc_slow(unint64_t *a1, uint64_t a2)
{
  mach_vm_address_t *v4;
  vm_map_t *v5;
  mach_vm_address_t v6;
  uint64_t result;
  mach_vm_address_t v8;
  unint64_t v9;
  unint64_t v10;
  mach_vm_address_t address;

  v4 = (mach_vm_address_t *)MEMORY[0x1E0C88820];
  v5 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v6 = *MEMORY[0x1E0C88820];
  while (1)
  {
    address = v6;
    result = mach_vm_map(*v5, &address, 2 * v6, 0, 1224736769, 0, 0, 0, 3, 7, 1u);
    if ((_DWORD)result)
      break;
    v8 = address;
    while (1)
    {
      v9 = __ldxr((unint64_t *)&_os_alloc_heap);
      if ((unint64_t *)v9 != a1)
        break;
      if (!__stxr(v8, (unint64_t *)&_os_alloc_heap))
      {
        *(_QWORD *)(v8 + 8) = a1;
        a1 = (unint64_t *)v8;
        goto LABEL_8;
      }
    }
    __clrex();
    mach_vm_deallocate(*v5, v8, 2 * *v4);
    a1 = (unint64_t *)_os_alloc_heap;
    if (!_os_alloc_heap)
    {
      v6 = *v4;
      continue;
    }
    do
LABEL_8:
      v10 = __ldxr(a1);
    while (__stxr(v10 + a2, a1));
    v6 = *v4;
    if (v10 + a2 <= 2 * *v4 - 16)
      return (uint64_t)a1 + v10 + 16;
  }
  qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_1F044D8A8 = (int)result;
  __break(1u);
  return result;
}

uint64_t _os_alloc_slow_0(atomic_ullong *a1, unint64_t a2)
{
  mach_vm_address_t *v4;
  vm_map_t *v5;
  mach_vm_address_t v6;
  uint64_t result;
  mach_vm_address_t v8;
  atomic_ullong *v9;
  unint64_t add_explicit;
  mach_vm_address_t address;

  v4 = (mach_vm_address_t *)MEMORY[0x1E0C88820];
  v5 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v6 = *MEMORY[0x1E0C88820];
  while (1)
  {
    address = v6;
    result = mach_vm_map(*v5, &address, 2 * v6, 0, 1224736769, 0, 0, 0, 3, 7, 1u);
    if ((_DWORD)result)
      break;
    v8 = address;
    v9 = a1;
    atomic_compare_exchange_strong_explicit(&_os_alloc_heap, (unint64_t *)&v9, address, memory_order_relaxed, memory_order_relaxed);
    if (v9 == a1)
    {
      *(_QWORD *)(v8 + 8) = a1;
      a1 = (atomic_ullong *)v8;
LABEL_6:
      add_explicit = atomic_fetch_add_explicit(a1, a2, memory_order_relaxed);
      v6 = *v4;
      if (add_explicit + a2 <= 2 * *v4 - 16)
        return (uint64_t)a1 + add_explicit + 16;
    }
    else
    {
      mach_vm_deallocate(*v5, v8, 2 * *v4);
      a1 = (atomic_ullong *)_os_alloc_heap;
      if (_os_alloc_heap)
        goto LABEL_6;
      v6 = *v4;
    }
  }
  qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: Failed to allocate in os_alloc_once";
  qword_1F044D8A8 = (int)result;
  __break(1u);
  return result;
}

uint64_t _simple_asl_init_context(uint64_t result)
{
  *(_QWORD *)(result + 8) = "unknown";
  *(_DWORD *)(result + 16) = -1;
  return result;
}

void _simple_asl_connect_once(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 336) == -1)
    v8 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 344);
  else
    v8 = _os_alloc_once_0(MEMORY[0x1E0C87FA0] + 336, 32, (uint64_t)_simple_asl_init_context, a4, a5, a6, a7, a8);
  if (*(_DWORD *)(v8 + 16) == -1)
    *(_DWORD *)(v8 + 16) = _simple_asl_connect();
}

uint64_t _simple_asl_connect()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  sockaddr v5;

  v0 = socket(1, 2, 0);
  v1 = v0;
  if ((_DWORD)v0 != -1)
  {
    fcntl(v0, 2, 1);
    v5.sa_family = 1;
    v2 = _platform_strlen((uint64_t)"/var/run/syslog");
    if (v2 + 1 < 0x68)
      v3 = v2 + 1;
    else
      v3 = 104;
    _platform_memmove((uint64_t *)v5.sa_data, (uint64_t *)"/var/run/syslog", v3);
    if (connect(v1, &v5, 0x6Au) == -1)
    {
      close(v1);
      return 0xFFFFFFFFLL;
    }
  }
  return v1;
}

BOOL (*os_unfair_recursive_lock_tryunlock4objc())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (BOOL (*)(unsigned int *))os_unfair_recursive_lock_tryunlock4objc_VARIANT_armv81;
  else
    return os_unfair_recursive_lock_tryunlock4objc_VARIANT_mp;
}

uint64_t _os_unfair_lock_unlock_slow(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v4;

  result = a3 | 1;
  if ((_DWORD)result != a2)
    _os_unfair_lock_unowned_abort(result);
  if ((a3 & 1) != 0)
  {
    v4 = a3;
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
    qword_1F044D8A8 = a3;
    __break(1u);
LABEL_9:
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
    qword_1F044D8A8 = v4;
    __break(1u);
  }
  else
  {
    while (1)
    {
      result = __ulock_wake();
      if ((result & 0x80000000) == 0)
        break;
      if ((_DWORD)result != -4)
      {
        v4 = -(int)result;
        if ((_DWORD)v4 != 2)
          goto LABEL_9;
        return result;
      }
    }
  }
  return result;
}

uint64_t _os_unfair_lock_lock_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4;
  int v7;
  unsigned int v8;
  int v9;
  _BOOL4 v11;
  unsigned int v13;
  uint64_t v14;
  uint64_t result;

  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_1F044D8A8 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_34:
    _os_unfair_lock_recursive_abort(v4);
  }
  v4 = a4;
  v7 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
LABEL_3:
        v8 = *a1;
        if (!*a1)
        {
          while (1)
          {
            v8 = __ldaxr(a1);
            if (v8)
              break;
            if (!__stxr(v4 & ~v7, a1))
              return 1;
          }
          __clrex();
        }
        v9 = v8 | 1;
        v11 = (a2 & 0x1000000) == 0 || v9 != -1;
        if (v9 == v4 && v11)
          goto LABEL_34;
        if (v8 == (v8 & 0xFFFFFFFE))
          goto LABEL_23;
        do
        {
          v13 = __ldxr(a1);
          if (v13 != v8)
          {
            __clrex();
            goto LABEL_3;
          }
        }
        while (__stxr(v8 & 0xFFFFFFFE, a1));
        v8 &= ~1u;
LABEL_23:
        result = __ulock_wait2();
        if ((result & 0x80000000) != 0)
          break;
        if ((_DWORD)result)
          v7 = 1;
      }
      v14 = -(int)result;
      if ((int)v14 > 13)
        break;
      if ((_DWORD)v14 != 4)
        goto LABEL_38;
    }
  }
  while ((_DWORD)v14 == 14);
  result = 0;
  if ((_DWORD)v14 != 60)
  {
    if ((_DWORD)v14 == 105)
      _os_unfair_lock_corruption_abort(v8);
LABEL_38:
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_1F044D8A8 = v14;
    __break(1u);
  }
  return result;
}

uint64_t _os_unfair_lock_lock_slow_0(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  unsigned int v4;
  int v7;
  unsigned int v8;
  int v9;
  BOOL v10;
  int v11;
  unsigned int v13;
  uint64_t result;
  uint64_t v15;

  if ((a2 & 0xFCFAFFFF) != 0)
  {
    qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Invalid options";
    qword_1F044D8A8 = a2 & 0xFEFFFFFF;
    __break(1u);
LABEL_30:
    _os_unfair_lock_recursive_abort(v4);
  }
  v4 = a4;
  v7 = 0;
  do
  {
    while (1)
    {
      while (1)
      {
        do
        {
          v8 = *a1;
          if (!*a1)
          {
            atomic_compare_exchange_strong_explicit(a1, &v8, v4 & ~v7, memory_order_acquire, memory_order_acquire);
            if (!v8)
              return 1;
          }
          v9 = v8 | 1;
          v10 = (a2 & 0x1000000) != 0 && v9 == -1;
          v11 = !v10;
          if (v9 == v4 && v11 != 0)
            goto LABEL_30;
          if (v8 == (v8 & 0xFFFFFFFE))
            break;
          v13 = v8;
          atomic_compare_exchange_strong_explicit(a1, &v13, v8 & 0xFFFFFFFE, memory_order_relaxed, memory_order_relaxed);
          v10 = v13 == v8;
          v8 &= ~1u;
        }
        while (!v10);
        result = __ulock_wait2();
        if ((result & 0x80000000) != 0)
          break;
        if ((_DWORD)result)
          v7 = 1;
      }
      v15 = -(int)result;
      if ((int)v15 > 13)
        break;
      if ((_DWORD)v15 != 4)
        goto LABEL_34;
    }
  }
  while ((_DWORD)v15 == 14);
  result = 0;
  if ((_DWORD)v15 != 60)
  {
    if ((_DWORD)v15 == 105)
      _os_unfair_lock_corruption_abort(v8);
LABEL_34:
    qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait2 failure";
    qword_1F044D8A8 = v15;
    __break(1u);
  }
  return result;
}

unsigned int *(*os_unfair_recursive_lock_unlock())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *))os_unfair_recursive_lock_unlock_VARIANT_armv81;
  else
    return os_unfair_recursive_lock_unlock_VARIANT_mp;
}

uint64_t (*os_unfair_recursive_lock_trylock())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(unsigned int *))os_unfair_recursive_lock_trylock_VARIANT_armv81;
  else
    return os_unfair_recursive_lock_trylock_VARIANT_mp;
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  int v1;
  uint32_t os_unfair_lock_opaque;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  os_unfair_lock_opaque = lock->_os_unfair_lock_opaque;
  if ((os_unfair_lock_opaque | 1) == v1)
    os_unfair_lock_assert_not_owner_cold_1(os_unfair_lock_opaque);
}

unint64_t _platform_memchr(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int8x16_t v3;
  uint64_t v4;
  unint64_t v5;
  int8x16_t v6;
  uint8x16_t v7;
  unint64_t v8;
  int8x16_t v9;
  BOOL v10;
  unint64_t result;
  uint8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  unint64_t v15;
  int8x16_t v16;
  uint8x16_t i;
  int8x16_t v18;
  uint8x16_t v19;

  if (!a3)
    return 0;
  if (a3 < 0)
  {
    v13 = vdupq_n_s8(a2);
    v14 = a1 & 0xF;
    v15 = a1 & 0xFFFFFFFFFFFFFFF0;
    v16 = *(int8x16_t *)&algn_1DED8AF10[-v14];
    for (i = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v15, v13), v16); ; i = (uint8x16_t)vsubq_s8(v18, v13))
    {
      v16.i8[0] = vminvq_u8(i);
      if (!v16.i32[0])
        break;
      v18 = *(int8x16_t *)(v15 + 16);
      v15 += 16;
    }
    v19 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(i, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_1DED8AF00);
    v19.i8[0] = vminvq_u8(v19);
    return v15 + v19.u32[0];
  }
  else
  {
    v3 = vdupq_n_s8(a2);
    v4 = a1 & 0xF;
    v5 = a1 & 0xFFFFFFFFFFFFFFF0;
    v6 = *(int8x16_t *)&algn_1DED8AF10[-v4];
    v7 = (uint8x16_t)vorrq_s8(vsubq_s8(*(int8x16_t *)v5, v3), v6);
    v8 = a3 + v4;
    while (1)
    {
      v6.i8[0] = vminvq_u8(v7);
      if (!v6.i32[0])
        break;
      v10 = v8 > 0x10;
      v8 -= 16;
      if (!v10)
        return 0;
      v9 = *(int8x16_t *)(v5 + 16);
      v5 += 16;
      v7 = (uint8x16_t)vsubq_s8(v9, v3);
    }
    v12 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v7, (uint8x16_t)veorq_s8(v3, v3)), (int8x16_t)xmmword_1DED8AF00);
    v12.i8[0] = vminvq_u8(v12);
    result = v5 + v12.u32[0];
    if (v12.u32[0] >= v8)
      return 0;
  }
  return result;
}

int64_t OSAtomicAdd64(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicAdd64_VARIANT_armv81;
  else
    return (int64_t)OSAtomicAdd64_VARIANT_mp;
}

int ffs(int a1)
{
  return 32 - __clz(a1 & -a1);
}

int ffsll(uint64_t a1)
{
  return 64 - __clz(a1 & -a1);
}

int fls(int a1)
{
  return 32 - __clz(a1);
}

int flsll(uint64_t a1)
{
  return 64 - __clz(a1);
}

BOOL OSAtomicCompareAndSwapPtrBarrier(void *__oldValue, void *__newValue, void **__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapPtrBarrier_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapPtrBarrier_VARIANT_mp;
}

void _platform_memset_pattern4(uint64_t a1, const float *a2, unint64_t a3)
{
  vld1q_dup_f32(a2);
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000)
      JUMPOUT(0x1DED8B114);
    JUMPOUT(0x1DED8B190);
  }
  JUMPOUT(0x1DED8B210);
}

void _platform_memset_pattern8(uint64_t a1, const double *a2, unint64_t a3)
{
  vld1q_dup_f64(a2);
  if (a3 >= 0x40)
  {
    if (a3 >= 0x8000)
      JUMPOUT(0x1DED8B114);
    JUMPOUT(0x1DED8B190);
  }
  JUMPOUT(0x1DED8B210);
}

int8x16_t *_platform_memset_pattern16(int8x16_t *result, int8x16_t *a2, unint64_t a3)
{
  int8x16_t v3;
  _OWORD *v4;
  unint64_t v5;
  BOOL v6;
  unint64_t v7;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t *v11;
  unint64_t v12;
  int8x16_t v13;
  BOOL v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;

  v3 = *a2;
  if (a3 < 0x40)
  {
    while (1)
    {
      v14 = a3 >= 0x10;
      a3 -= 16;
      if (!v14)
        break;
      *result++ = v3;
    }
    v15 = a3 + 16;
    if (v15)
    {
      v17 = v3.u64[1];
      v16 = v3.i64[0];
      do
      {
        result->i8[0] = v16;
        result = (int8x16_t *)((char *)result + 1);
        v16 = (v16 >> 8) | (v17 << 56);
        v17 >>= 8;
        --v15;
      }
      while (v15);
    }
  }
  else
  {
    if (a3 < 0x8000)
    {
      *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      v12 = (unint64_t)result->u64 + a3;
      v6 = v12 > (unint64_t)(v4 + 4);
      v7 = v12 - (_QWORD)(v4 + 4);
      v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        v13 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1DED8B260 + v8));
        do
        {
          *v4 = v13;
          v4[1] = v13;
          v4[2] = v13;
          v4[3] = v13;
          v4 += 4;
          v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    else
    {
      *result = v3;
      result[1] = v3;
      result[2] = v3;
      result[3] = v3;
      v4 = (_OWORD *)((unint64_t)&result[4] & 0xFFFFFFFFFFFFFFC0);
      v5 = (unint64_t)result->u64 + a3;
      v6 = v5 > (unint64_t)(v4 + 4);
      v7 = v5 - (_QWORD)(v4 + 4);
      v8 = ((_BYTE)v4 - (_BYTE)result) & 0xF;
      if (v6)
      {
        v9 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1DED8B260 + v8));
        do
        {
          *v4 = v9;
          v4[1] = v9;
          v4[2] = v9;
          v4[3] = v9;
          v4 += 4;
          v6 = v7 > 0x40;
          v7 -= 64;
        }
        while (v6);
      }
    }
    v10 = vqtbl1q_s8(v3, *(int8x16_t *)((char *)qword_1DED8B260 + (((_BYTE)v8 + (_BYTE)v7) & 0xF)));
    v11 = (int8x16_t *)((char *)v4 + v7);
    *v11 = v10;
    v11[1] = v10;
    v11[2] = v10;
    v11[3] = v10;
  }
  return result;
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return OSAtomicDequeue_VARIANT_armv81;
  else
    return OSAtomicDequeue_VARIANT_mp;
}

int32_t OSAtomicAnd32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAnd32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicAnd32Barrier_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwap32Barrier(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwap32Barrier_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwap32Barrier_VARIANT_mp;
}

unsigned int *(*os_unfair_lock_unlock_no_tsd())(unsigned int *result, int a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *, int))os_unfair_lock_unlock_no_tsd_VARIANT_armv81;
  else
    return os_unfair_lock_unlock_no_tsd_VARIANT_mp;
}

unsigned int *(*os_unfair_lock_lock_no_tsd())(unsigned int *result, int a2, unsigned int a3)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *, int, unsigned int))os_unfair_lock_lock_no_tsd_VARIANT_armv81;
  else
    return os_unfair_lock_lock_no_tsd_VARIANT_mp;
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)os_unfair_lock_trylock_VARIANT_armv81;
  else
    return (char)os_unfair_lock_trylock_VARIANT_mp;
}

int32_t OSAtomicAdd32Barrier(int32_t __theAmount, int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAdd32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicAdd32Barrier_VARIANT_mp;
}

int32_t OSAtomicAdd32(int32_t __theAmount, int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAdd32_VARIANT_armv81;
  else
    return (int)OSAtomicAdd32_VARIANT_mp;
}

unsigned int *(*spin_unlock())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return spin_unlock_VARIANT_armv81;
  else
    return spin_unlock_VARIANT_mp;
}

unsigned int *(*spin_lock())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return spin_lock_VARIANT_armv81;
  else
    return spin_lock_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwapLong(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapLong_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapLong_VARIANT_mp;
}

BOOL OSAtomicTestAndSetBarrier(uint32_t __n, void *__theAddress)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicTestAndSetBarrier_VARIANT_armv81;
  else
    return (char)OSAtomicTestAndSetBarrier_VARIANT_mp;
}

BOOL OSAtomicTestAndClear(uint32_t __n, void *__theAddress)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicTestAndClear_VARIANT_armv81;
  else
    return (char)OSAtomicTestAndClear_VARIANT_mp;
}

void sys_icache_invalidate(void *start, size_t len)
{
  unint64_t v2;
  size_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v10;
  unsigned int v11;

  if (len)
  {
    v2 = (unint64_t)start & 0xFFFFFFFFFFFFFFC0;
    v3 = ~((len + (start & 0x3F) - 1) >> 6);
    __dsb(0xBu);
    v4 = 20;
    v5 = 0;
    do
    {
      __asm { IC              IVAU, X9 }
      v2 += 64;
      if (!--v4)
      {
        if (v5)
        {
LABEL_5:
          __dsb(0xBu);
          v4 = 20;
        }
        else
        {
          v10 = &cpus_that_need_dsb_for_ic_ivau;
          while (1)
          {
            v11 = *v10++;
            v5 = v11;
            if (!v11)
              break;
            if ((_DWORD)v5 == MEMORY[0xFFFFFC080])
              goto LABEL_5;
          }
          v4 = 0;
          v5 = 1;
        }
      }
      ++v3;
    }
    while (v3);
    __dsb(0xBu);
    __isb(0xFu);
  }
}

void sys_dcache_flush(void *start, size_t len)
{
  __dsb(0xBu);
}

BOOL OSAtomicTestAndClearBarrier(uint32_t __n, void *__theAddress)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicTestAndClearBarrier_VARIANT_armv81;
  else
    return (char)OSAtomicTestAndClearBarrier_VARIANT_mp;
}

int64_t OSAtomicIncrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicIncrement64Barrier_VARIANT_armv81;
  else
    return (int64_t)OSAtomicIncrement64Barrier_VARIANT_mp;
}

unint64_t _platform_strncmp(int8x16_t *a1, int8x16_t *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v9;
  unint64_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint8x16_t v14;
  int8x16_t v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  BOOL v23;
  uint8x16_t v24;

  v3 = 0;
  if (!a3)
    return v3;
  while ((a1 & 0xF) != 0)
  {
    v5 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    v4 = v5;
    v6 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    v3 = v4 - v6;
    if (v4 == v6 && (_DWORD)v4 != 0)
    {
      if (--a3)
        continue;
    }
    return v3;
  }
  if ((a2 & 0xF) == 0)
    goto LABEL_30;
  v9 = -(uint64_t)a2 & 0xFF0;
  if (!v9)
    goto LABEL_16;
LABEL_11:
  if (a3 > v9)
  {
    v10 = a3 - v9;
    while (1)
    {
      v11 = *a1++;
      v12 = v11;
      v13 = *a2++;
      v15 = vceqq_s8(v12, v13);
      v14 = (uint8x16_t)vandq_s8(v12, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0])
        break;
      v9 -= 16;
      if (!v9)
      {
        a3 = v10;
LABEL_16:
        while (1)
        {
          v17 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          v16 = v17;
          v18 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          v3 = v16 - v18;
          if (v16 != v18 || (_DWORD)v16 == 0)
            return v3;
          if (!--a3)
            return v3;
          if ((a1 & 0xF) == 0)
          {
            v9 = 4080;
            goto LABEL_11;
          }
        }
      }
    }
  }
  else
  {
LABEL_30:
    while (1)
    {
      v20 = *a1++;
      v21 = v20;
      v22 = *a2++;
      v15 = vceqq_s8(v21, v22);
      v14 = (uint8x16_t)vandq_s8(v21, v15);
      v15.i8[0] = vminvq_u8(v14);
      if (!v15.i32[0])
        break;
      v23 = a3 > 0x10;
      a3 -= 16;
      if (!v23)
        return 0;
    }
  }
  v24 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v14, (uint8x16_t)veorq_s8(v15, v15)), (int8x16_t)xmmword_1DED8B5C0);
  v24.i8[0] = vminvq_u8(v24);
  if (v24.u32[0] >= a3)
    return 0;
  else
    return a1[-1].u8[v24.u32[0]] - (unint64_t)a2[-1].u8[v24.u32[0]];
}

unint64_t _platform_strcmp(int8x16_t *a1, int8x16_t *a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  uint8x16_t v12;
  int8x16_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  uint8x16_t v21;

  while ((a1 & 0xF) != 0)
  {
    v3 = a1->u8[0];
    a1 = (int8x16_t *)((char *)a1 + 1);
    v2 = v3;
    v4 = a2->u8[0];
    a2 = (int8x16_t *)((char *)a2 + 1);
    v5 = v2 - v4;
    if (v2 != v4 || (_DWORD)v2 == 0)
      return v5;
  }
  if ((a2 & 0xF) != 0)
  {
    v8 = -(uint64_t)a2 & 0xFF0;
    if (!v8)
      goto LABEL_12;
LABEL_10:
    while (1)
    {
      v9 = *a1++;
      v10 = v9;
      v11 = *a2++;
      v13 = vceqq_s8(v10, v11);
      v12 = (uint8x16_t)vandq_s8(v10, v13);
      v13.i8[0] = vminvq_u8(v12);
      if (!v13.i32[0])
        break;
      v8 -= 16;
      if (!v8)
      {
LABEL_12:
        while (1)
        {
          v15 = a1->u8[0];
          a1 = (int8x16_t *)((char *)a1 + 1);
          v14 = v15;
          v16 = a2->u8[0];
          a2 = (int8x16_t *)((char *)a2 + 1);
          v5 = v14 - v16;
          if (v14 != v16 || (_DWORD)v14 == 0)
            return v5;
          if ((a1 & 0xF) == 0)
          {
            v8 = 4080;
            goto LABEL_10;
          }
        }
      }
    }
  }
  else
  {
    do
    {
      v18 = *a1++;
      v19 = v18;
      v20 = *a2++;
      v13 = vceqq_s8(v19, v20);
      v12 = (uint8x16_t)vandq_s8(v19, v13);
      v13.i8[0] = vminvq_u8(v12);
    }
    while (v13.i32[0]);
  }
  v21 = (uint8x16_t)vorrq_s8((int8x16_t)vcgtq_u8(v12, (uint8x16_t)veorq_s8(v13, v13)), (int8x16_t)xmmword_1DED8B6E0);
  v21.i8[0] = vminvq_u8(v21);
  return a1[-1].u8[v21.u32[0]] - (unint64_t)a2[-1].u8[v21.u32[0]];
}

int32_t OSAtomicIncrement32Barrier(int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicIncrement32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicIncrement32Barrier_VARIANT_mp;
}

int32_t OSAtomicDecrement32Barrier(int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicDecrement32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicDecrement32Barrier_VARIANT_mp;
}

uint64_t _os_log_simple_shim(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  return __os_log_simple_offset(0, (uint64_t *)&UUID_NULL, (uint64_t *)&UUID_NULL, 0, 0, a1, a2, a3);
}

void (*_os_nospin_lock_unlock())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (void (*)(unsigned int *))_os_nospin_lock_unlock_VARIANT_armv81;
  else
    return _os_nospin_lock_unlock_VARIANT_mp;
}

int32_t OSAtomicOr32(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicOr32_VARIANT_armv81;
  else
    return (int)OSAtomicOr32_VARIANT_mp;
}

uint64_t _simple_sappend(uint64_t a1, _BYTE *a2)
{
  char v2;
  unsigned __int8 *v4;
  _BYTE *v5;
  int v6;

  v2 = *a2;
  if (*a2)
  {
    v4 = a2 + 1;
    do
    {
      v5 = *(_BYTE **)(a1 + 8);
      if ((unint64_t)v5 >= *(_QWORD *)(a1 + 16))
      {
        (*(void (**)(uint64_t))(a1 + 32))(a1);
        v5 = *(_BYTE **)(a1 + 8);
      }
      *(_QWORD *)(a1 + 8) = v5 + 1;
      *v5 = v2;
      v6 = *v4++;
      v2 = v6;
    }
    while (v6);
  }
  return 0;
}

uint64_t (*_os_nospin_lock_lock())(uint64_t result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_nospin_lock_lock_VARIANT_armv81;
  else
    return _os_nospin_lock_lock_VARIANT_mp;
}

int32_t OSAtomicIncrement32(int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicIncrement32_VARIANT_armv81;
  else
    return (int)OSAtomicIncrement32_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwap64Barrier(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwap64Barrier_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwap64Barrier_VARIANT_mp;
}

int32_t OSAtomicDecrement32(int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicDecrement32_VARIANT_armv81;
  else
    return (int)OSAtomicDecrement32_VARIANT_mp;
}

uint64_t os_lock_unlock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 24))(a1);
}

uint64_t os_lock_lock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t (*_os_lock_handoff_unlock())(uint64_t result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_lock_handoff_unlock_VARIANT_armv81;
  else
    return _os_lock_handoff_unlock_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwap32(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwap32_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwap32_VARIANT_mp;
}

void (*_os_lock_handoff_lock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_lock_handoff_lock_VARIANT_armv81;
  else
    return (void (*)(uint64_t))_os_lock_handoff_lock_VARIANT_mp;
}

BOOL OSAtomicTestAndSet(uint32_t __n, void *__theAddress)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicTestAndSet_VARIANT_armv81;
  else
    return (char)OSAtomicTestAndSet_VARIANT_mp;
}

void _os_unfair_lock_unowned_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_unfair_lock not owned by current thread";
  qword_1F044D8A8 = a1;
  __break(1u);
}

uint64_t _os_log_simple_parse_type(_BYTE *a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a2 + 4);
  if (v2 > 0x10 || ((1 << v2) & 0x10007) == 0)
    return 22;
  result = 0;
  *a1 = v2;
  return result;
}

uint64_t _os_log_simple_parse_subsystem(uint64_t a1, unsigned __int16 *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (!a2[1])
  {
    v2 = 0;
    goto LABEL_5;
  }
  v2 = (uint64_t)a2 + *a2 + 104;
  if (!*(_BYTE *)(v2 + a2[1] - 1))
  {
LABEL_5:
    v3 = 0;
    *(_QWORD *)(a1 + 8) = v2;
    return v3;
  }
  return 22;
}

uint64_t _os_log_simple_parse_message(uint64_t a1, _WORD *a2)
{
  uint64_t result;

  if (!*a2 || *((_BYTE *)a2 + (unsigned __int16)*a2 + 103))
    return 22;
  result = 0;
  *(_QWORD *)(a1 + 16) = a2 + 52;
  return result;
}

uint64_t _os_log_simple_parse_timestamp(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v2;
  v3 = 22;
  if (v2)
  {
    if (v2 <= mach_continuous_time())
      return 0;
    else
      return 22;
  }
  return v3;
}

uint64_t _os_log_simple_parse_identifiers(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[2];
  a1[4] = v2;
  a1[5] = a2[3];
  a1[6] = a2[4];
  a1[7] = a2[5];
  if (v2)
    return 0;
  else
    return 22;
}

void _os_log_simple_reinit_4launchd(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  int v9;

  if (*(_QWORD *)(MEMORY[0x1E0C87FA0] + 336) == -1)
    v8 = *(_QWORD *)(MEMORY[0x1E0C87FA0] + 344);
  else
    v8 = _os_alloc_once_0(MEMORY[0x1E0C87FA0] + 336, 32, (uint64_t)_simple_asl_init_context, a4, a5, a6, a7, a8);
  if (*(_BYTE *)v8)
  {
    v9 = *(_DWORD *)(v8 + 16);
    if (v9 != -1)
      _os_log_simple_reinit_4launchd_cold_1(v9);
    *(_DWORD *)(v8 + 16) = _simple_asl_connect();
  }
}

_BYTE *_simple_asl_msg_set(_BYTE *result, int8x16_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int8x16_t *v23;
  int v24;
  int v25;

  if (result)
  {
    if (a2)
    {
      v10 = result;
      result = (_BYTE *)_simple_sprintf(result, " [", a3, a4, a5, a6, a7, a8, v25);
      if (!(_DWORD)result)
      {
        result = (_BYTE *)_simple_esprintf(v10, (uint64_t (*)(uint64_t))_simple_asl_escape_key, "%s", v11, v12, v13, v14, v15, (int)a2);
        if (!(_DWORD)result)
        {
          if (a3)
          {
            result = (_BYTE *)_simple_esprintf(v10, (uint64_t (*)(uint64_t))_simple_asl_escape_val, " %s", v16, v17, v18, v19, v20, a3);
            if ((_DWORD)result)
              return result;
            if (!_platform_strcmp(a2, (int8x16_t *)"Message"))
            {
              v21 = _simple_string((_BYTE **)v10);
              v22 = _platform_strlen(v21);
              if (!_platform_strcmp((int8x16_t *)(v21 + v22 - 2), (int8x16_t *)"\\n"))
              {
                v23 = (int8x16_t *)(v22 + v21 - 4);
                do
                {
                  v23->i8[2] = 0;
                  v24 = _platform_strcmp(v23, (int8x16_t *)"\\n");
                  v23 = (int8x16_t *)((char *)v23 - 2);
                }
                while (!v24);
              }
              _simple_sresize((uint64_t *)v10);
            }
          }
          return (_BYTE *)_simple_sappend((uint64_t)v10, "]");
        }
      }
    }
  }
  return result;
}

const char *_simple_asl_escape_key(int a1)
{
  if (a1 <= 90)
  {
    if (a1 == 10)
      return "\\n";
    if (a1 == 32)
      return "\\s";
  }
  else
  {
    switch(a1)
    {
      case ']':
        return "\\]";
      case '\\':
        return "\\\\";
      case '[':
        return "\\[";
    }
  }
  return 0;
}

const char *_simple_asl_escape_val(int a1)
{
  if (a1 > 91)
  {
    if (a1 != 92)
    {
      if (a1 == 93)
        return "\\]";
      return 0;
    }
    return "\\\\";
  }
  else
  {
    if (a1 != 10)
    {
      if (a1 == 91)
        return "\\[";
      return 0;
    }
    return "\\n";
  }
}

uint64_t _simple_asl_send(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  pid_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uid_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  gid_t v40;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  int v64;
  int v65;
  int v66;
  int v67;
  int v68;

  result = _simple_asl_get_fd((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  if ((result & 0x80000000) == 0)
  {
    __gettimeofday();
    result = _simple_sprintf(a1, " [PID ", v10, v11, v12, v13, v14, v15, v63);
    if (!(_DWORD)result)
    {
      v16 = getpid();
      result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v17, v18, v19, v20, v21, v16);
      if (!(_DWORD)result)
      {
        result = _simple_sprintf(a1, "] [UID ", v22, v23, v24, v25, v26, v27, v64);
        if (!(_DWORD)result)
        {
          v28 = getuid();
          result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v29, v30, v31, v32, v33, v28);
          if (!(_DWORD)result)
          {
            result = _simple_sprintf(a1, "] [GID ", v34, v35, v36, v37, v38, v39, v65);
            if (!(_DWORD)result)
            {
              v40 = getgid();
              result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%u", v41, v42, v43, v44, v45, v40);
              if (!(_DWORD)result)
              {
                result = _simple_sprintf(a1, "] [Time ", v46, v47, v48, v49, v50, v51, v66);
                if (!(_DWORD)result)
                {
                  result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%lu", v52, v53, v54, v55, v56, v67);
                  if (!(_DWORD)result)
                  {
                    result = _simple_sappend((uint64_t)a1, "] [TimeNanoSec ");
                    if (!(_DWORD)result)
                    {
                      result = _simple_esprintf(a1, (uint64_t (*)(uint64_t))_simple_asl_escape_val, "%d", v57, v58, v59, v60, v61, 1000 * v68);
                      if (!(_DWORD)result)
                      {
                        result = _simple_sappend((uint64_t)a1, "]\n");
                        if (!(_DWORD)result)
                        {
                          v62 = _simple_string((_BYTE **)a1);
                          _platform_strlen(v62);
                          return __sendto();
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _simple_asl_log_prog(int a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;

  v5 = os_log_simple_type_from_asl(a1);
  return _os_log_simple_shim(v5, a2, a3);
}

ssize_t _simple_vdprintf(int a1, unsigned __int8 *a2, int *a3)
{
  _BYTE v4[32];
  _QWORD v5[3];
  int v6;
  ssize_t (*v7)(_QWORD *);

  v6 = a1;
  v5[0] = v4;
  v5[1] = v4;
  v5[2] = v5;
  v7 = _flush_reset;
  __simple_bprintf(v5, 0, a2, a3);
  return _flush((ssize_t)v5);
}

ssize_t _flush_reset(_QWORD *a1)
{
  ssize_t result;

  result = _flush((ssize_t)a1);
  a1[1] = *a1;
  return result;
}

ssize_t _flush(ssize_t result)
{
  char *v1;
  int64_t v2;
  ssize_t v3;
  BOOL v4;

  v1 = *(char **)result;
  v2 = *(_QWORD *)(result + 8) - *(_QWORD *)result;
  if (v2 >= 1)
  {
    v3 = result;
    while (1)
    {
      while (1)
      {
        result = write(*(_DWORD *)(v3 + 24), v1, v2);
        if (result < 0)
          break;
        v4 = v2 <= result;
        v2 -= result;
        v1 += v2;
        if (v4)
          return result;
      }
      if (*__error() != 4)
      {
        result = (ssize_t)__error();
        if (*(_DWORD *)result != 35)
          break;
      }
    }
  }
  return result;
}

ssize_t _simple_dprintf(int a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return _simple_vdprintf(a1, a2, &a9);
}

uint64_t *_enlarge(uint64_t a1)
{
  vm_address_t *v2;
  vm_map_t *v3;
  vm_address_t *v4;
  uint64_t *result;
  unint64_t v6;
  vm_size_t v7;
  kern_return_t v8;
  vm_address_t v9;
  uint64_t *v10;
  vm_address_t v11;
  vm_address_t v12;
  vm_address_t address;

  v2 = (vm_address_t *)(a1 + 16);
  address = *(_QWORD *)(a1 + 16) + 1;
  v3 = (vm_map_t *)MEMORY[0x1E0C883F0];
  v4 = (vm_address_t *)MEMORY[0x1E0C88820];
  result = (uint64_t *)vm_allocate(*MEMORY[0x1E0C883F0], &address, *MEMORY[0x1E0C88820], 0);
  if ((_DWORD)result)
  {
    v6 = *(_QWORD *)(a1 + 16) - *(_QWORD *)a1 + 1;
    v7 = (v6 + *v4) & -(uint64_t)*v4;
    v8 = vm_allocate(*v3, &address, v7, 1);
    if (v8)
      _enlarge_cold_1(v8);
    v9 = address - *(_QWORD *)a1;
    result = _platform_memmove((uint64_t *)address, *(uint64_t **)a1, v6);
    v10 = *(uint64_t **)a1;
    v11 = *v4;
    if (((*v4 - 1) & *(_QWORD *)a1) != 0)
    {
      v6 &= -(uint64_t)v11;
      v10 = (uint64_t *)(((unint64_t)v10 + v11) & -(uint64_t)v11);
      *(_QWORD *)a1 = v10;
      v12 = v7 + address - 1;
    }
    else
    {
      v12 = *v2 + v11 + v9;
    }
    *v2 = v12;
    if (v6)
      result = (uint64_t *)mach_vm_deallocate(*v3, (mach_vm_address_t)v10, v6);
    *(_QWORD *)a1 = address;
    v2 = (vm_address_t *)(a1 + 8);
  }
  else
  {
    v9 = *v4;
  }
  *v2 += v9;
  return result;
}

uint64_t _simple_vsprintf(_BYTE *a1, unsigned __int8 *a2, int *a3)
{
  __simple_bprintf(a1, 0, a2, a3);
  return 0;
}

uint64_t _simple_esprintf(_BYTE *a1, uint64_t (*a2)(uint64_t), unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  __simple_bprintf(a1, a2, a3, &a9);
  return 0;
}

unint64_t _simple_sresize(uint64_t *a1)
{
  uint64_t v2;
  unint64_t result;

  v2 = *a1;
  result = _platform_strlen(*a1);
  a1[1] = v2 + result;
  return result;
}

uint64_t _simple_esappend(uint64_t a1, uint64_t (*a2)(_QWORD), unsigned __int8 *a3)
{
  unsigned __int8 v3;
  unsigned __int8 *v4;
  _BYTE *v7;
  char v8;
  unsigned __int8 *v9;
  _BYTE *v10;
  int v11;
  unsigned __int8 *v12;
  int v13;

  v3 = *a3;
  if (*a3)
  {
    v4 = a3;
    do
    {
      if (a2 && (v7 = (_BYTE *)a2(v3)) != 0)
      {
        v8 = *v7;
        if (*v7)
        {
          v9 = v7 + 1;
          do
          {
            v10 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v10 >= *(_QWORD *)(a1 + 16))
            {
              (*(void (**)(uint64_t))(a1 + 32))(a1);
              v10 = *(_BYTE **)(a1 + 8);
            }
            *(_QWORD *)(a1 + 8) = v10 + 1;
            *v10 = v8;
            v11 = *v9++;
            v8 = v11;
          }
          while (v11);
        }
      }
      else
      {
        v12 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v12 >= *(_QWORD *)(a1 + 16))
        {
          (*(void (**)(uint64_t))(a1 + 32))(a1);
          v12 = *(unsigned __int8 **)(a1 + 8);
        }
        *(_QWORD *)(a1 + 8) = v12 + 1;
        *v12 = v3;
      }
      v13 = *++v4;
      v3 = v13;
    }
    while (v13);
  }
  return 0;
}

ssize_t _simple_put(ssize_t result, int a2)
{
  *(_DWORD *)(result + 24) = a2;
  return _flush(result);
}

ssize_t _simple_putline(ssize_t a1, int a2)
{
  _BYTE *v3;
  ssize_t result;

  *(_DWORD *)(a1 + 24) = a2;
  v3 = *(_BYTE **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3 + 1;
  *v3 = 10;
  result = _flush(a1);
  --*(_QWORD *)(a1 + 8);
  return result;
}

std::ios_base *__cdecl oct(std::ios_base *__str)
{
  uint64_t (*v1)(uint64_t);
  unint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  char *v8;
  BOOL v9;
  uint64_t v10;
  std::ios_base *result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  int v17;
  _BYTE *v18;
  char v20;
  unsigned __int8 *v21;
  _BYTE *v22;
  int v23;
  char *v24;
  char v25;
  char v26;
  char v27;

  v5 = v4;
  v6 = v1;
  v27 = 0;
  if (v2)
  {
    v8 = &v27;
    do
    {
      *--v8 = v2 & 7 | 0x30;
      v9 = v2 >= 8;
      v2 >>= 3;
    }
    while (v9);
  }
  else
  {
    v8 = &v26;
    v26 = 48;
  }
  v10 = v3;
  result = (std::ios_base *)_platform_strlen((uint64_t)v8);
  v12 = v10 - (_QWORD)result;
  if (v12 >= 1)
  {
    if (v5)
      v13 = 48;
    else
      v13 = 32;
    do
    {
      if (v6 && (result = (std::ios_base *)v6(v13)) != 0)
      {
        v14 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          v15 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            v16 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v16 >= __str->__precision_)
            {
              result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v16 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v16 + 1;
            *v16 = v14;
            v17 = *v15++;
            v14 = v17;
          }
          while (v17);
        }
      }
      else
      {
        v18 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v18 >= __str->__precision_)
        {
          result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v18 = *(_BYTE **)&__str->__fmtflags_;
        }
        *(_QWORD *)&__str->__fmtflags_ = v18 + 1;
        *v18 = v13;
      }
    }
    while (v12-- > 1);
  }
  while (1)
  {
    v25 = *v8;
    if (!*v8)
      break;
    if (v6 && (result = (std::ios_base *)v6(*v8)) != 0)
    {
      v20 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        v21 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          v22 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v22 >= __str->__precision_)
          {
            result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            v22 = *(_BYTE **)&__str->__fmtflags_;
          }
          *(_QWORD *)&__str->__fmtflags_ = v22 + 1;
          *v22 = v20;
          v23 = *v21++;
          v20 = v23;
        }
        while (v23);
      }
    }
    else
    {
      v24 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v24 >= __str->__precision_)
      {
        result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        v24 = *(char **)&__str->__fmtflags_;
      }
      *(_QWORD *)&__str->__fmtflags_ = v24 + 1;
      *v24 = v25;
    }
    ++v8;
  }
  return result;
}

std::ios_base *__cdecl hex(std::ios_base *__str)
{
  uint64_t (*v1)(uint64_t);
  unint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  const char *v11;
  char *v12;
  BOOL v13;
  char *v14;
  unsigned __int8 v15;
  _BYTE *v16;
  char v17;
  unsigned __int8 *v18;
  _BYTE *v19;
  int v20;
  unsigned __int8 *v21;
  unsigned __int8 v22;
  char v23;
  std::ios_base *result;
  int v25;
  uint64_t v26;
  char v27;
  unsigned __int8 *v28;
  _BYTE *v29;
  int v30;
  _BYTE *v31;
  char *v33;
  unsigned __int8 v34;
  char v35;
  unsigned __int8 *v36;
  _BYTE *v37;
  int v38;
  unsigned __int8 *v39;
  unsigned __int8 v40;
  char v41;
  unsigned __int8 *v42;
  _BYTE *v43;
  int v44;
  char *v45;
  char v46;
  char v47;
  char v48;

  v7 = v4;
  v8 = v3;
  v9 = v1;
  v11 = "0123456789ABCDEF";
  if (!v5)
    v11 = "0123456789abcdef";
  v48 = 0;
  if (v2)
  {
    v12 = &v48;
    do
    {
      *--v12 = v11[v2 & 0xF];
      v13 = v2 >= 0x10;
      v2 >>= 4;
    }
    while (v13);
    if (!v6)
      goto LABEL_23;
  }
  else
  {
    v12 = &v47;
    v47 = 48;
    if (!v6)
    {
LABEL_23:
      v23 = 1;
      goto LABEL_25;
    }
  }
  v8 = v3 - 2;
  if (v4)
  {
    v14 = (char *)&_0x;
    v15 = 48;
    do
    {
      if (v9 && (v16 = (_BYTE *)v9(v15)) != 0)
      {
        v17 = *v16;
        if (*v16)
        {
          v18 = v16 + 1;
          do
          {
            v19 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v19 >= __str->__precision_)
            {
              (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v19 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v19 + 1;
            *v19 = v17;
            v20 = *v18++;
            v17 = v20;
          }
          while (v20);
        }
      }
      else
      {
        v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v21 >= __str->__precision_)
        {
          (*(void (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v21 = *(unsigned __int8 **)&__str->__fmtflags_;
        }
        *(_QWORD *)&__str->__fmtflags_ = v21 + 1;
        *v21 = v15;
      }
      v22 = *++v14;
      v15 = v22;
    }
    while (v14 != (char *)&unk_1DED92610);
    goto LABEL_23;
  }
  v23 = 0;
LABEL_25:
  result = (std::ios_base *)_platform_strlen((uint64_t)v12);
  v25 = v8 - (_DWORD)result;
  if (v25 >= 1)
  {
    if (v7)
      v26 = 48;
    else
      v26 = 32;
    do
    {
      if (v9 && (result = (std::ios_base *)v9(v26)) != 0)
      {
        v27 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          v28 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            v29 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v29 >= __str->__precision_)
            {
              result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v29 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v29 + 1;
            *v29 = v27;
            v30 = *v28++;
            v27 = v30;
          }
          while (v30);
        }
      }
      else
      {
        v31 = *(_BYTE **)&__str->__fmtflags_;
        if ((unint64_t)v31 >= __str->__precision_)
        {
          result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v31 = *(_BYTE **)&__str->__fmtflags_;
        }
        *(_QWORD *)&__str->__fmtflags_ = v31 + 1;
        *v31 = v26;
      }
    }
    while (v25-- > 1);
  }
  if ((v23 & 1) == 0)
  {
    v33 = (char *)&_0x;
    v34 = 48;
    do
    {
      if (v9 && (result = (std::ios_base *)v9(v34)) != 0)
      {
        v35 = (char)result->__vftable;
        if (LOBYTE(result->__vftable))
        {
          v36 = (unsigned __int8 *)&result->__vftable + 1;
          do
          {
            v37 = *(_BYTE **)&__str->__fmtflags_;
            if ((unint64_t)v37 >= __str->__precision_)
            {
              result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
              v37 = *(_BYTE **)&__str->__fmtflags_;
            }
            *(_QWORD *)&__str->__fmtflags_ = v37 + 1;
            *v37 = v35;
            v38 = *v36++;
            v35 = v38;
          }
          while (v38);
        }
      }
      else
      {
        v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        if ((unint64_t)v39 >= __str->__precision_)
        {
          result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
          v39 = *(unsigned __int8 **)&__str->__fmtflags_;
        }
        *(_QWORD *)&__str->__fmtflags_ = v39 + 1;
        *v39 = v34;
      }
      v40 = *++v33;
      v34 = v40;
    }
    while (v33 != (char *)&unk_1DED92610);
  }
  while (1)
  {
    v46 = *v12;
    if (!*v12)
      break;
    if (v9 && (result = (std::ios_base *)v9(*v12)) != 0)
    {
      v41 = (char)result->__vftable;
      if (LOBYTE(result->__vftable))
      {
        v42 = (unsigned __int8 *)&result->__vftable + 1;
        do
        {
          v43 = *(_BYTE **)&__str->__fmtflags_;
          if ((unint64_t)v43 >= __str->__precision_)
          {
            result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
            v43 = *(_BYTE **)&__str->__fmtflags_;
          }
          *(_QWORD *)&__str->__fmtflags_ = v43 + 1;
          *v43 = v41;
          v44 = *v42++;
          v41 = v44;
        }
        while (v44);
      }
    }
    else
    {
      v45 = *(char **)&__str->__fmtflags_;
      if ((unint64_t)v45 >= __str->__precision_)
      {
        result = (std::ios_base *)(*(uint64_t (**)(std::ios_base *))&__str->__rdstate_)(__str);
        v45 = *(char **)&__str->__fmtflags_;
      }
      *(_QWORD *)&__str->__fmtflags_ = v45 + 1;
      *v45 = v46;
    }
    ++v12;
  }
  return result;
}

_BYTE *udec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  char *v8;
  BOOL v9;
  uint64_t v10;
  _BYTE *result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  int v17;
  _BYTE *v18;
  char v20;
  unsigned __int8 *v21;
  _BYTE *v22;
  int v23;
  char *v24;
  char v25;
  char v26;
  char v27;

  v27 = 0;
  if (a3)
  {
    v8 = &v27;
    do
    {
      *--v8 = (a3 % 0xA) | 0x30;
      v9 = a3 >= 0xA;
      a3 /= 0xAuLL;
    }
    while (v9);
  }
  else
  {
    v8 = &v26;
    v26 = 48;
  }
  v10 = a4;
  result = (_BYTE *)_platform_strlen((uint64_t)v8);
  v12 = v10 - (_QWORD)result;
  if (v12 >= 1)
  {
    if (a5)
      v13 = 48;
    else
      v13 = 32;
    do
    {
      if (a2 && (result = (_BYTE *)a2(v13)) != 0)
      {
        v14 = *result;
        if (*result)
        {
          v15 = result + 1;
          do
          {
            v16 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v16 >= *(_QWORD *)(a1 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              v16 = *(_BYTE **)(a1 + 8);
            }
            *(_QWORD *)(a1 + 8) = v16 + 1;
            *v16 = v14;
            v17 = *v15++;
            v14 = v17;
          }
          while (v17);
        }
      }
      else
      {
        v18 = *(_BYTE **)(a1 + 8);
        if ((unint64_t)v18 >= *(_QWORD *)(a1 + 16))
        {
          result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          v18 = *(_BYTE **)(a1 + 8);
        }
        *(_QWORD *)(a1 + 8) = v18 + 1;
        *v18 = v13;
      }
    }
    while (v12-- > 1);
  }
  while (1)
  {
    v25 = *v8;
    if (!*v8)
      break;
    if (a2 && (result = (_BYTE *)a2(*v8)) != 0)
    {
      v20 = *result;
      if (*result)
      {
        v21 = result + 1;
        do
        {
          v22 = *(_BYTE **)(a1 + 8);
          if ((unint64_t)v22 >= *(_QWORD *)(a1 + 16))
          {
            result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            v22 = *(_BYTE **)(a1 + 8);
          }
          *(_QWORD *)(a1 + 8) = v22 + 1;
          *v22 = v20;
          v23 = *v21++;
          v20 = v23;
        }
        while (v23);
      }
    }
    else
    {
      v24 = *(char **)(a1 + 8);
      if ((unint64_t)v24 >= *(_QWORD *)(a1 + 16))
      {
        result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
        v24 = *(char **)(a1 + 8);
      }
      *(_QWORD *)(a1 + 8) = v24 + 1;
      *v24 = v25;
    }
    ++v8;
  }
  return result;
}

_BYTE *ydec(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t a3, int a4, int a5)
{
  _BYTE *result;
  char *v8;
  unsigned __int8 v9;
  char v10;
  unsigned __int8 *v11;
  _BYTE *v12;
  int v13;
  unsigned __int8 *v14;
  unsigned __int8 v15;
  char *v16;
  unsigned __int8 v17;
  char v18;
  unsigned __int8 *v19;
  _BYTE *v20;
  int v21;
  unsigned __int8 *v22;
  unsigned __int8 v23;
  char v24;
  unsigned __int8 *v25;
  _BYTE *v26;
  int v27;
  _BYTE *v28;

  if (a3 < 0xA00000)
  {
    if (a3 >> 11 < 5)
    {
      result = udec(a1, a2, a3, a4, a5);
      if (a2 && (result = (_BYTE *)a2(98)) != 0)
      {
        v24 = *result;
        if (*result)
        {
          v25 = result + 1;
          do
          {
            v26 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v26 >= *(_QWORD *)(a1 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              v26 = *(_BYTE **)(a1 + 8);
            }
            *(_QWORD *)(a1 + 8) = v26 + 1;
            *v26 = v24;
            v27 = *v25++;
            v24 = v27;
          }
          while (v27);
        }
      }
      else
      {
        v28 = *(_BYTE **)(a1 + 8);
        if ((unint64_t)v28 >= *(_QWORD *)(a1 + 16))
        {
          result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          v28 = *(_BYTE **)(a1 + 8);
        }
        *(_QWORD *)(a1 + 8) = v28 + 1;
        *v28 = 98;
      }
    }
    else
    {
      result = udec(a1, a2, (a3 + 512) >> 10, a4, a5);
      v16 = "KB";
      v17 = 75;
      do
      {
        if (a2 && (result = (_BYTE *)a2(v17)) != 0)
        {
          v18 = *result;
          if (*result)
          {
            v19 = result + 1;
            do
            {
              v20 = *(_BYTE **)(a1 + 8);
              if ((unint64_t)v20 >= *(_QWORD *)(a1 + 16))
              {
                result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
                v20 = *(_BYTE **)(a1 + 8);
              }
              *(_QWORD *)(a1 + 8) = v20 + 1;
              *v20 = v18;
              v21 = *v19++;
              v18 = v21;
            }
            while (v21);
          }
        }
        else
        {
          v22 = *(unsigned __int8 **)(a1 + 8);
          if ((unint64_t)v22 >= *(_QWORD *)(a1 + 16))
          {
            result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
            v22 = *(unsigned __int8 **)(a1 + 8);
          }
          *(_QWORD *)(a1 + 8) = v22 + 1;
          *v22 = v17;
        }
        v23 = *++v16;
        v17 = v23;
      }
      while (v16 != "");
    }
  }
  else
  {
    result = udec(a1, a2, (a3 + 0x80000) >> 20, a4, a5);
    v8 = "MB";
    v9 = 77;
    do
    {
      if (a2 && (result = (_BYTE *)a2(v9)) != 0)
      {
        v10 = *result;
        if (*result)
        {
          v11 = result + 1;
          do
          {
            v12 = *(_BYTE **)(a1 + 8);
            if ((unint64_t)v12 >= *(_QWORD *)(a1 + 16))
            {
              result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
              v12 = *(_BYTE **)(a1 + 8);
            }
            *(_QWORD *)(a1 + 8) = v12 + 1;
            *v12 = v10;
            v13 = *v11++;
            v10 = v13;
          }
          while (v13);
        }
      }
      else
      {
        v14 = *(unsigned __int8 **)(a1 + 8);
        if ((unint64_t)v14 >= *(_QWORD *)(a1 + 16))
        {
          result = (_BYTE *)(*(uint64_t (**)(uint64_t))(a1 + 32))(a1);
          v14 = *(unsigned __int8 **)(a1 + 8);
        }
        *(_QWORD *)(a1 + 8) = v14 + 1;
        *v14 = v9;
      }
      v15 = *++v8;
      v9 = v15;
    }
    while (v8 != "");
  }
  return result;
}

int sys_cache_control(int function, void *start, size_t len)
{
  if (function == 2)
  {
    sys_dcache_flush(start, len);
    return 0;
  }
  if (function == 1)
  {
    sys_icache_invalidate(start, len);
    return 0;
  }
  return 45;
}

uint64_t os_lock_trylock(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 16))(a1);
}

BOOL os_unfair_recursive_lock_owned(_DWORD *a1)
{
  int v1;

  v1 = *a1 | 1;
  return v1 == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
}

_DWORD *os_unfair_recursive_lock_unlock_forked_child(_DWORD *result)
{
  int v1;
  int v2;

  if (!*result)
    os_unfair_recursive_lock_unlock_forked_child_cold_1();
  v1 = result[1];
  if (v1)
  {
    v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    result[1] = v1 - 1;
  }
  else
  {
    v2 = 0;
  }
  *result = v2;
  return result;
}

uint64_t _os_semaphore_signal()
{
  uint64_t result;

  result = MEMORY[0x1DF0EFFE8]();
  if ((_DWORD)result)
    _os_semaphore_signal_cold_1(result);
  return result;
}

uint64_t _os_semaphore_wait(uint64_t a1)
{
  uint64_t result;

  while (1)
  {
    result = MEMORY[0x1DF0EFFF4](a1);
    if (!(_DWORD)result)
      break;
    if ((_DWORD)result != 14)
      _os_semaphore_wait_cold_1(result);
  }
  return result;
}

int64_t OSAtomicAdd64Barrier(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicAdd64Barrier_VARIANT_armv81;
  else
    return (int64_t)OSAtomicAdd64Barrier_VARIANT_mp;
}

int64_t OSAtomicIncrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicIncrement64_VARIANT_armv81;
  else
    return (int64_t)OSAtomicIncrement64_VARIANT_mp;
}

int64_t OSAtomicDecrement64(OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicDecrement64_VARIANT_armv81;
  else
    return (int64_t)OSAtomicDecrement64_VARIANT_mp;
}

int64_t OSAtomicDecrement64Barrier(OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int64_t)OSAtomicDecrement64Barrier_VARIANT_armv81;
  else
    return (int64_t)OSAtomicDecrement64Barrier_VARIANT_mp;
}

int32_t OSAtomicAnd32(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAnd32_VARIANT_armv81;
  else
    return (int)OSAtomicAnd32_VARIANT_mp;
}

int32_t OSAtomicAnd32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAnd32Orig_VARIANT_armv81;
  else
    return (int)OSAtomicAnd32Orig_VARIANT_mp;
}

int32_t OSAtomicAnd32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicAnd32OrigBarrier_VARIANT_armv81;
  else
    return (int)OSAtomicAnd32OrigBarrier_VARIANT_mp;
}

int32_t OSAtomicOr32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicOr32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicOr32Barrier_VARIANT_mp;
}

int32_t OSAtomicOr32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicOr32Orig_VARIANT_armv81;
  else
    return (int)OSAtomicOr32Orig_VARIANT_mp;
}

int32_t OSAtomicOr32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicOr32OrigBarrier_VARIANT_armv81;
  else
    return (int)OSAtomicOr32OrigBarrier_VARIANT_mp;
}

int32_t OSAtomicXor32(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicXor32_VARIANT_armv81;
  else
    return (int)OSAtomicXor32_VARIANT_mp;
}

int32_t OSAtomicXor32Barrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicXor32Barrier_VARIANT_armv81;
  else
    return (int)OSAtomicXor32Barrier_VARIANT_mp;
}

int32_t OSAtomicXor32Orig(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicXor32Orig_VARIANT_armv81;
  else
    return (int)OSAtomicXor32Orig_VARIANT_mp;
}

int32_t OSAtomicXor32OrigBarrier(uint32_t __theMask, uint32_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (int)OSAtomicXor32OrigBarrier_VARIANT_armv81;
  else
    return (int)OSAtomicXor32OrigBarrier_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwapPtr(void *__oldValue, void *__newValue, void **__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapPtr_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapPtr_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwapInt(int __oldValue, int __newValue, int *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapInt_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapInt_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwapIntBarrier(int __oldValue, int __newValue, int *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapIntBarrier_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapIntBarrier_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwapLongBarrier(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwapLongBarrier_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwapLongBarrier_VARIANT_mp;
}

BOOL OSAtomicCompareAndSwap64(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSAtomicCompareAndSwap64_VARIANT_armv81;
  else
    return (char)OSAtomicCompareAndSwap64_VARIANT_mp;
}

BOOL OSSpinLockTry(OSSpinLock *__lock)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (char)OSSpinLockTry_VARIANT_armv81;
  else
    return (char)OSSpinLockTry_VARIANT_mp;
}

uint64_t (*spin_lock_try())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(unsigned int *))spin_lock_try_VARIANT_armv81;
  else
    return spin_lock_try_VARIANT_mp;
}

unsigned int *(*_spin_lock())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return spin_lock_VARIANT_armv81;
  else
    return spin_lock_VARIANT_mp;
}

uint64_t (*_spin_lock_try())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(unsigned int *))spin_lock_try_VARIANT_armv81;
  else
    return spin_lock_try_VARIANT_mp;
}

unsigned int *(*_spin_unlock())(unsigned int *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return spin_unlock_VARIANT_armv81;
  else
    return spin_unlock_VARIANT_mp;
}

uint64_t (*os_sync_wait_on_address())(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return os_sync_wait_on_address_VARIANT_armv81;
  else
    return os_sync_wait_on_address_VARIANT_mp;
}

uint64_t (*os_sync_wait_on_address_with_deadline())(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return os_sync_wait_on_address_with_deadline_VARIANT_armv81;
  else
    return os_sync_wait_on_address_with_deadline_VARIANT_mp;
}

uint64_t (*os_sync_wait_on_address_with_timeout())(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return os_sync_wait_on_address_with_timeout_VARIANT_armv81;
  else
    return os_sync_wait_on_address_with_timeout_VARIANT_mp;
}

uint64_t (*os_sync_wake_by_address_any())(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return os_sync_wake_by_address_any_VARIANT_armv81;
  else
    return os_sync_wake_by_address_any_VARIANT_mp;
}

uint64_t (*os_sync_wake_by_address_all())(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return os_sync_wake_by_address_all_VARIANT_armv81;
  else
    return os_sync_wake_by_address_all_VARIANT_mp;
}

uint64_t (*os_unfair_lock_trylock_with_options())(unsigned int *a1, int a2, uint64_t a3)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(unsigned int *, int, uint64_t))os_unfair_lock_trylock_with_options_VARIANT_armv81;
  else
    return os_unfair_lock_trylock_with_options_VARIANT_mp;
}

unsigned int *(*os_unfair_lock_lock_with_flags())(unsigned int *result, int a2)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(unsigned int *, int))os_unfair_lock_lock_with_flags_VARIANT_armv81;
  else
    return os_unfair_lock_lock_with_flags_VARIANT_mp;
}

uint64_t (*_os_nospin_lock_trylock())(unsigned int *a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(unsigned int *))_os_nospin_lock_trylock_VARIANT_armv81;
  else
    return _os_nospin_lock_trylock_VARIANT_mp;
}

unsigned int *(*_os_lock_spin_lock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_lock_spin_lock_VARIANT_armv81;
  else
    return _os_lock_spin_lock_VARIANT_mp;
}

uint64_t (*_os_lock_spin_trylock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(uint64_t))_os_lock_spin_trylock_VARIANT_armv81;
  else
    return _os_lock_spin_trylock_VARIANT_mp;
}

uint64_t (*_os_lock_spin_unlock())(uint64_t result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_lock_spin_unlock_VARIANT_armv81;
  else
    return _os_lock_spin_unlock_VARIANT_mp;
}

uint64_t (*_os_lock_handoff_trylock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(uint64_t))_os_lock_handoff_trylock_VARIANT_armv81;
  else
    return _os_lock_handoff_trylock_VARIANT_mp;
}

unsigned int *(*_os_lock_unfair_lock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(uint64_t))_os_lock_unfair_lock_VARIANT_armv81;
  else
    return _os_lock_unfair_lock_VARIANT_mp;
}

uint64_t (*_os_lock_unfair_trylock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(uint64_t))_os_lock_unfair_trylock_VARIANT_armv81;
  else
    return _os_lock_unfair_trylock_VARIANT_mp;
}

unsigned int *(*_os_lock_unfair_unlock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(uint64_t))_os_lock_unfair_unlock_VARIANT_armv81;
  else
    return _os_lock_unfair_unlock_VARIANT_mp;
}

unsigned int *(*_os_lock_nospin_lock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unsigned int *(*)(uint64_t))_os_lock_nospin_lock_VARIANT_armv81;
  else
    return _os_lock_nospin_lock_VARIANT_mp;
}

uint64_t (*_os_lock_nospin_trylock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (uint64_t (*)(uint64_t))_os_lock_nospin_trylock_VARIANT_armv81;
  else
    return _os_lock_nospin_trylock_VARIANT_mp;
}

void (*_os_lock_nospin_unlock())(uint64_t a1)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return _os_lock_nospin_unlock_VARIANT_armv81;
  else
    return _os_lock_nospin_unlock_VARIANT_mp;
}

unint64_t *(*__os_once_reset())(unint64_t *result)
{
  if ((MEMORY[0xFFFFFC023] & 2) != 0)
    return (unint64_t *(*)(unint64_t *))__os_once_reset_VARIANT_armv81;
  else
    return __os_once_reset_VARIANT_mp;
}

unsigned int *_OSSpinLockLockSlow_VARIANT_mp(unsigned int *result)
{
  int i;
  signed int v2;

  for (i = 100; ; --i)
  {
    while (1)
    {
      v2 = __ldaxr(result);
      if (v2)
        break;
      if (!__stxr(1u, result))
        return result;
    }
    if (v2 != 1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }
    if (!i)
      break;
    __wfe();
  }
  __clrex();
  return (unsigned int *)_OSSpinLockLockYield(result);
}

unint64_t _OSSpinLockLockYield(unsigned int *a1)
{
  unint64_t result;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  mach_timebase_info info;

  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    v3 = -1;
  }
  else
  {
    v4 = 1000000 * (unint64_t)info.denom / info.numer;
    result = mach_absolute_time();
    v3 = result + v4;
  }
  v5 = 1;
  v6 = 1;
  while (1)
  {
    v7 = *a1;
    if (!*a1)
      break;
LABEL_6:
    if (v7 != 1)
      _os_lock_corruption_abort((uint64_t)a1, v7);
    result = MEMORY[0x1DF0F003C](0, v6, v5);
    if ((_DWORD)v6 == 2)
    {
      v5 = (v5 + 1);
    }
    else
    {
      result = mach_absolute_time();
      if (result < v3)
        v6 = 1;
      else
        v6 = 2;
    }
  }
  do
  {
    v7 = __ldaxr(a1);
    if (v7)
    {
      __clrex();
      goto LABEL_6;
    }
  }
  while (__stxr(1u, a1));
  return result;
}

unsigned int *spin_lock_VARIANT_mp(unsigned int *result)
{
  while (!__ldaxr(result))
  {
    if (!__stxr(1u, result))
      return result;
  }
  __clrex();
  return _OSSpinLockLockSlow_VARIANT_mp(result);
}

uint64_t OSSpinLockTry_VARIANT_mp(unsigned int *a1)
{
  uint64_t result;

  while (!__ldaxr(a1))
  {
    result = 1;
    if (!__stxr(1u, a1))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t spin_lock_try_VARIANT_mp(unsigned int *a1)
{
  uint64_t result;

  while (!__ldaxr(a1))
  {
    result = 1;
    if (!__stxr(1u, a1))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

unsigned int *spin_unlock_VARIANT_mp(unsigned int *result)
{
  atomic_store(0, result);
  return result;
}

unsigned int *_os_lock_spin_lock_VARIANT_mp(uint64_t a1)
{
  unsigned int *result;

  result = (unsigned int *)(a1 + 8);
  while (!__ldaxr(result))
  {
    if (!__stxr(1u, result))
      return result;
  }
  __clrex();
  return _OSSpinLockLockSlow_VARIANT_mp(result);
}

uint64_t _os_lock_spin_trylock_VARIANT_mp(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v1))
  {
    result = 1;
    if (!__stxr(1u, v1))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t _os_lock_spin_unlock_VARIANT_mp(uint64_t result)
{
  atomic_store(0, (unsigned int *)(result + 8));
  return result;
}

uint64_t _os_lock_handoff_lock_VARIANT_mp(uint64_t a1)
{
  unsigned int v1;
  unsigned int *v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2))
      return a1;
  }
  __clrex();
  return _os_lock_handoff_lock_slow(a1);
}

uint64_t _os_lock_handoff_lock_slow(uint64_t a1)
{
  char v1;
  unsigned int v2;
  unsigned int *v3;
  int v4;
  int v5;
  int v6;
  uint64_t result;

  v1 = 0;
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v3 = (unsigned int *)(a1 + 8);
  v4 = 1;
  v5 = 100;
LABEL_2:
  v6 = v5;
  while (1)
  {
    LODWORD(result) = *v3;
    if (!*v3)
      break;
LABEL_8:
    if ((_DWORD)result == v2)
      _os_lock_recursive_abort(v2);
    v5 = v6 - 1;
    if (!v6)
    {
      MEMORY[0x1DF0F003C]();
LABEL_11:
      ++v4;
      v1 = 1;
      goto LABEL_2;
    }
    MEMORY[0x1DF0F003C]();
    v6 = v5;
    if ((v1 & 1) != 0)
      goto LABEL_11;
  }
  do
  {
    result = __ldaxr(v3);
    if ((_DWORD)result)
    {
      __clrex();
      goto LABEL_8;
    }
  }
  while (__stxr(v2, v3));
  return result;
}

uint64_t _os_lock_handoff_trylock_VARIANT_mp(uint64_t a1)
{
  unsigned int v1;
  unsigned int *v2;
  uint64_t result;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = (unsigned int *)(a1 + 8);
  while (!__ldaxr(v2))
  {
    if (!__stxr(v1, v2))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t _os_lock_handoff_unlock_VARIANT_mp(uint64_t result)
{
  atomic_store(0, (unsigned int *)(result + 8));
  return result;
}

unsigned int *os_unfair_lock_lock_VARIANT_mp(unsigned int *result)
{
  unsigned int v1;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v1, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, 0, 0, v1);
}

unsigned int *os_unfair_lock_lock_with_options_VARIANT_mp(unsigned int *result, int a2)
{
  unsigned int v2;

  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0, v2);
}

uint64_t os_unfair_lock_trylock_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t result;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v1, a1))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t os_unfair_lock_trylock_with_options_VARIANT_mp(unsigned int *a1, int a2, uint64_t a3)
{
  unsigned int v3;

  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v3, a1))
      return 1;
  }
  __clrex();
  return _os_unfair_lock_trylock_with_options_slow(a1, a2, a3, v3);
}

uint64_t _os_unfair_lock_trylock_with_options_slow(unsigned int *a1, int a2, uint64_t a3, unsigned int a4)
{
  unint64_t v8;
  uint64_t v9;
  mach_timebase_info info;

  if ((a2 & 0x2000000) != 0)
  {
    if (mach_absolute_time() <= a3)
      return _os_unfair_lock_lock_slow(a1, a2, a3, a4);
  }
  else if (a3)
  {
    mach_timebase_info(&info);
    v8 = info.denom * a3 / info.numer;
    v9 = mach_absolute_time();
    return _os_unfair_lock_lock_slow(a1, a2 | 0x2000000u, v9 + v8, a4);
  }
  return 0;
}

unsigned int *os_unfair_lock_unlock_VARIANT_mp(unsigned int *result)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v2 != v1)
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v2);
  return result;
}

unsigned int *os_unfair_lock_lock_no_tsd_VARIANT_mp(unsigned int *result, int a2, unsigned int a3)
{
  while (!__ldaxr(result))
  {
    if (!__stxr(a3, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0, a3);
}

unsigned int *os_unfair_lock_unlock_no_tsd_VARIANT_mp(unsigned int *result, int a2)
{
  unsigned int v2;

  do
    v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v2 != a2)
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  return result;
}

unsigned int *os_unfair_lock_lock_with_flags_VARIANT_mp(unsigned int *result, int a2)
{
  unsigned int v2;

  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0, v2);
}

unsigned int *os_unfair_recursive_lock_lock_with_options_VARIANT_mp(unsigned int *result, int a2)
{
  unsigned int v2;
  unsigned int v3;
  char v4;

  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v3 = __ldaxr(result);
    if (v3)
      break;
    if (!__stxr(v2, result))
    {
      v4 = 1;
      goto LABEL_6;
    }
  }
  v4 = 0;
  __clrex();
LABEL_6:
  if ((v4 & 1) == 0)
  {
    if ((v3 | 1) == v2)
      ++result[1];
    else
      return (unsigned int *)_os_unfair_lock_lock_slow(result, a2, 0, v2);
  }
  return result;
}

uint64_t os_unfair_recursive_lock_trylock_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  unsigned int v2;
  char v3;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (1)
  {
    v2 = __ldaxr(a1);
    if (v2)
      break;
    if (!__stxr(v1, a1))
    {
      v3 = 1;
      goto LABEL_6;
    }
  }
  v3 = 0;
  __clrex();
LABEL_6:
  if ((v3 & 1) != 0)
    return 1;
  if ((v2 | 1) == v1)
  {
    ++a1[1];
    return 1;
  }
  return 0;
}

unsigned int *os_unfair_recursive_lock_unlock_VARIANT_mp(unsigned int *result)
{
  int v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = result[1];
  if (v2)
  {
    if ((*result | 1) != v1)
      _os_unfair_lock_unowned_abort(*result | 1);
    result[1] = v2 - 1;
  }
  else
  {
    do
      v3 = __ldxr(result);
    while (__stlxr(0, result));
    if (v3 != v1)
      return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v3);
  }
  return result;
}

BOOL os_unfair_recursive_lock_tryunlock4objc_VARIANT_mp(unsigned int *a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;

  v1 = *a1 | 1;
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    v3 = a1[1];
    if (v3)
    {
      if ((*a1 | 1) != v1)
        _os_unfair_lock_unowned_abort(*a1 | 1);
      a1[1] = v3 - 1;
    }
    else
    {
      do
        v4 = __ldxr(a1);
      while (__stlxr(0, a1));
      if (v4 != v1)
        _os_unfair_lock_unlock_slow((uint64_t)a1, v1, v4);
    }
  }
  return v1 == v2;
}

unsigned int *_os_lock_unfair_lock_VARIANT_mp(uint64_t a1)
{
  unsigned int *result;
  unsigned int v2;

  result = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_unfair_lock_lock_slow(result, 0, 0, v2);
}

uint64_t _os_lock_unfair_trylock_VARIANT_mp(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

unsigned int *_os_lock_unfair_unlock_VARIANT_mp(uint64_t a1)
{
  unsigned int *result;
  int v2;
  unsigned int v3;

  result = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v3 = __ldxr(result);
  while (__stlxr(0, result));
  if (v3 != v2)
    return (unsigned int *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  return result;
}

uint64_t _os_nospin_lock_lock_VARIANT_mp(uint64_t result)
{
  unsigned int v1;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr((unsigned int *)result))
  {
    if (!__stxr(v1, (unsigned int *)result))
      return result;
  }
  __clrex();
  return _os_nospin_lock_lock_slow(result);
}

uint64_t _os_nospin_lock_lock_slow(uint64_t result)
{
  unsigned int *v1;
  int v2;
  int v3;
  int i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  int v9;

  v1 = (unsigned int *)result;
  v2 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  for (i = 1; ; ++i)
  {
    do
    {
      while (1)
      {
        while (1)
        {
          v5 = *v1;
          if (!(_DWORD)v5)
          {
            while (1)
            {
              v5 = __ldaxr(v1);
              if ((_DWORD)v5)
                break;
              if (!__stxr(v3 & ~v2, v1))
                return result;
            }
            __clrex();
          }
          v6 = v5 & 0xFFFFFFFE;
          if (v5 == v6 || v6 == 0)
            break;
          while (1)
          {
            v8 = __ldxr(v1);
            if (v8 != v5)
              break;
            if (!__stxr(v6, v1))
              goto LABEL_13;
          }
          __clrex();
        }
LABEL_13:
        result = __ulock_wait();
        if ((result & 0x80000000) != 0)
          break;
        if ((_DWORD)result)
          v2 = 1;
      }
      v9 = -(int)result;
    }
    while ((_DWORD)result == -4 || v9 == 14);
    if (v9 != 60)
      break;
  }
  qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
  qword_1F044D8A8 = -(int)result;
  __break(1u);
  return result;
}

uint64_t _os_nospin_lock_trylock_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t result;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(a1))
  {
    if (!__stxr(v1, a1))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

void _os_nospin_lock_unlock_VARIANT_mp(unsigned int *a1)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v2 = __ldxr(a1);
  while (__stlxr(0, a1));
  if (v2 != v1)
    _os_nospin_lock_unlock_slow((uint64_t)a1, v2);
}

void _os_nospin_lock_unlock_slow(uint64_t a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if ((a2 | 1) == *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24))
  {
    if ((a2 & 1) != 0)
    {
      v3 = a2;
      qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: unlock_slow with no waiters";
      qword_1F044D8A8 = a2;
      __break(1u);
LABEL_8:
      qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wake failure";
      qword_1F044D8A8 = v3;
      __break(1u);
    }
    else
    {
      while (1)
      {
        v2 = __ulock_wake();
        if ((v2 & 0x80000000) == 0)
          break;
        if (v2 != -4)
        {
          v3 = -v2;
          if ((_DWORD)v3 != 2)
            goto LABEL_8;
          return;
        }
      }
    }
  }
}

unsigned int *_os_lock_nospin_lock_VARIANT_mp(uint64_t a1)
{
  unsigned int *result;
  unsigned int v2;

  result = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(result))
  {
    if (!__stxr(v2, result))
      return result;
  }
  __clrex();
  return (unsigned int *)_os_nospin_lock_lock_slow((uint64_t)result);
}

uint64_t _os_lock_nospin_trylock_VARIANT_mp(uint64_t a1)
{
  unsigned int *v1;
  unsigned int v2;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  while (!__ldaxr(v1))
  {
    if (!__stxr(v2, v1))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

void _os_lock_nospin_unlock_VARIANT_mp(uint64_t a1)
{
  unsigned int *v1;
  int v2;
  unsigned int v3;

  v1 = (unsigned int *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v3 = __ldxr(v1);
  while (__stlxr(0, v1));
  if (v3 != v2)
    _os_nospin_lock_unlock_slow((uint64_t)v1, v3);
}

unint64_t *__os_once_reset_VARIANT_mp(unint64_t *result)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  do
    v2 = __ldxr(result);
  while (__stlxr(0, result));
  if (v1 != v2)
    return (unint64_t *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  return result;
}

unint64_t *_os_once_VARIANT_mp(unint64_t *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t v3;
  uint64_t v4;

  v3 = atomic_load(result);
  if ((v3 & 3) == 1)
  {
    if (4 * MEMORY[0xFFFFFC180] - v3 - 15 <= 0xFFFFFFFFFFFFFFEFLL)
      *result = -1;
  }
  else
  {
    v4 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    while (!__ldaxr(result))
    {
      if (!__stxr(v4, result))
        return (unint64_t *)_os_once_callout(result, a2, a3, v4);
    }
    __clrex();
    return (unint64_t *)_os_once_gate_wait((uint64_t)result, a2, a3, v4);
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline_VARIANT_mp(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  int v6;
  uint64_t result;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    v6 = 22;
    if (a6 && a5 == 32)
    {
      result = __ulock_wait2();
      if ((result & 0x80000000) == 0)
        return result;
      v6 = -(int)result;
    }
  }
  else
  {
    v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_with_timeout_VARIANT_mp(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  int v6;
  uint64_t result;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    v6 = 22;
    if (a6 && a5 == 32)
    {
      result = __ulock_wait2();
      if ((result & 0x80000000) == 0)
        return result;
      v6 = -(int)result;
    }
  }
  else
  {
    v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_VARIANT_mp(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t result;
  int v5;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    result = __ulock_wait2();
    if ((result & 0x80000000) == 0)
      return result;
    v5 = -(int)result;
  }
  else
  {
    v5 = 22;
  }
  *__error() = v5;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_any_VARIANT_mp(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  int v4;

  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    result = __ulock_wake();
    if ((result & 0x80000000) == 0)
      return result;
    v4 = -(int)result;
  }
  else
  {
    v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_all_VARIANT_mp(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  int v4;

  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    result = __ulock_wake();
    if ((result & 0x80000000) == 0)
      return result;
    v4 = -(int)result;
  }
  else
  {
    v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

unint64_t _os_alloc_once_VARIANT_mp(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v5[3];

  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once_VARIANT_mp(a1, (uint64_t)v5, _os_alloc);
  return a1[1];
}

uint64_t OSAtomicAdd32_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 + a1;
  }
  while (__stxr(v3, a2));
  return v3;
}

uint64_t OSAtomicAdd32Barrier_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldaxr(a2);
    v3 = v2 + a1;
  }
  while (__stlxr(v3, a2));
  return v3;
}

uint64_t OSAtomicIncrement32_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  do
  {
    v1 = __ldxr(a1);
    v2 = v1 + 1;
  }
  while (__stxr(v2, a1));
  return v2;
}

uint64_t OSAtomicIncrement32Barrier_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  do
  {
    v1 = __ldaxr(a1);
    v2 = v1 + 1;
  }
  while (__stlxr(v2, a1));
  return v2;
}

uint64_t OSAtomicDecrement32_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  do
  {
    v1 = __ldxr(a1);
    v2 = v1 - 1;
  }
  while (__stxr(v2, a1));
  return v2;
}

uint64_t OSAtomicDecrement32Barrier_VARIANT_mp(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;

  do
  {
    v1 = __ldaxr(a1);
    v2 = v1 - 1;
  }
  while (__stlxr(v2, a1));
  return v2;
}

unint64_t OSAtomicAdd64_VARIANT_mp(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 + a1;
  }
  while (__stxr(v3, a2));
  return v3;
}

unint64_t OSAtomicAdd64Barrier_VARIANT_mp(uint64_t a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;

  do
  {
    v2 = __ldaxr(a2);
    v3 = v2 + a1;
  }
  while (__stlxr(v3, a2));
  return v3;
}

unint64_t OSAtomicIncrement64_VARIANT_mp(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;

  do
  {
    v1 = __ldxr(a1);
    v2 = v1 + 1;
  }
  while (__stxr(v2, a1));
  return v2;
}

unint64_t OSAtomicIncrement64Barrier_VARIANT_mp(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;

  do
  {
    v1 = __ldaxr(a1);
    v2 = v1 + 1;
  }
  while (__stlxr(v2, a1));
  return v2;
}

unint64_t OSAtomicDecrement64_VARIANT_mp(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;

  do
  {
    v1 = __ldxr(a1);
    v2 = v1 - 1;
  }
  while (__stxr(v2, a1));
  return v2;
}

unint64_t OSAtomicDecrement64Barrier_VARIANT_mp(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;

  do
  {
    v1 = __ldaxr(a1);
    v2 = v1 - 1;
  }
  while (__stlxr(v2, a1));
  return v2;
}

uint64_t OSAtomicAnd32_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 & a1;
  }
  while (__stxr(v3, a2));
  return v3;
}

uint64_t OSAtomicAnd32Barrier_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldaxr(a2);
    v3 = v2 & a1;
  }
  while (__stlxr(v3, a2));
  return v3;
}

uint64_t OSAtomicAnd32Orig_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldxr(a2);
  while (__stxr(v2 & a1, a2));
  return v2;
}

uint64_t OSAtomicAnd32OrigBarrier_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldaxr(a2);
  while (__stlxr(v2 & a1, a2));
  return v2;
}

uint64_t OSAtomicOr32_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 | a1;
  }
  while (__stxr(v3, a2));
  return v3;
}

uint64_t OSAtomicOr32Barrier_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldaxr(a2);
    v3 = v2 | a1;
  }
  while (__stlxr(v3, a2));
  return v3;
}

uint64_t OSAtomicOr32Orig_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldxr(a2);
  while (__stxr(v2 | a1, a2));
  return v2;
}

uint64_t OSAtomicOr32OrigBarrier_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldaxr(a2);
  while (__stlxr(v2 | a1, a2));
  return v2;
}

uint64_t OSAtomicXor32_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldxr(a2);
    v3 = v2 ^ a1;
  }
  while (__stxr(v3, a2));
  return v3;
}

uint64_t OSAtomicXor32Barrier_VARIANT_mp(int a1, unsigned int *a2)
{
  unsigned int v2;
  uint64_t v3;

  do
  {
    v2 = __ldaxr(a2);
    v3 = v2 ^ a1;
  }
  while (__stlxr(v3, a2));
  return v3;
}

uint64_t OSAtomicXor32Orig_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldxr(a2);
  while (__stxr(v2 ^ a1, a2));
  return v2;
}

uint64_t OSAtomicXor32OrigBarrier_VARIANT_mp(int a1, unsigned int *a2)
{
  uint64_t v2;

  do
    v2 = __ldaxr(a2);
  while (__stlxr(v2 ^ a1, a2));
  return v2;
}

uint64_t OSAtomicCompareAndSwap32_VARIANT_mp(int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwap32Barrier_VARIANT_mp(int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldaxr(a3);
    if (v3 != a1)
      break;
    if (!__stlxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapPtr_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapPtrBarrier_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldaxr(a3);
    if (v3 != a1)
      break;
    if (!__stlxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapInt_VARIANT_mp(int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapIntBarrier_VARIANT_mp(int a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldaxr(a3);
    if (v3 != a1)
      break;
    if (!__stlxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapLong_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwapLongBarrier_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldaxr(a3);
    if (v3 != a1)
      break;
    if (!__stlxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwap64_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldxr(a3);
    if (v3 != a1)
      break;
    if (!__stxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

uint64_t OSAtomicCompareAndSwap64Barrier_VARIANT_mp(uint64_t a1, unint64_t a2, unint64_t *a3)
{
  unint64_t v3;
  uint64_t result;

  while (1)
  {
    v3 = __ldaxr(a3);
    if (v3 != a1)
      break;
    if (!__stlxr(a2, a3))
      return 1;
  }
  result = 0;
  __clrex();
  return result;
}

BOOL OSAtomicTestAndSet_VARIANT_mp(int a1, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v3 = a1 + 8 * (a2 & 3);
  if ((a2 & 3) == 0)
    v2 = a2;
  v4 = 0x80u >> (a1 & 7) << (v3 & 0x18);
  v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndSetBarrier_VARIANT_mp(int a1, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v3 = a1 + 8 * (a2 & 3);
  if ((a2 & 3) == 0)
    v2 = a2;
  v4 = 0x80u >> (a1 & 7) << (v3 & 0x18);
  v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 | v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClear_VARIANT_mp(int a1, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v3 = a1 + 8 * (a2 & 3);
  if ((a2 & 3) == 0)
    v2 = a2;
  v4 = 0x80u >> (a1 & 7) << (v3 & 0x18);
  v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    v6 = __ldxr(v5);
  while (__stxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

BOOL OSAtomicTestAndClearBarrier_VARIANT_mp(int a1, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int *v5;
  unsigned int v6;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  v3 = a1 + 8 * (a2 & 3);
  if ((a2 & 3) == 0)
    v2 = a2;
  v4 = 0x80u >> (a1 & 7) << (v3 & 0x18);
  v5 = (unsigned int *)(v2 + ((v3 >> 3) & 0x1FFFFFFC));
  do
    v6 = __ldaxr(v5);
  while (__stlxr(v6 & ~v4, v5));
  return (v6 & v4) != 0;
}

unint64_t *OSAtomicEnqueue_VARIANT_mp(unint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *result;
  do
  {
    do
    {
      *(_QWORD *)(a2 + a3) = v3;
      v4 = __ldxr(result);
      v5 = v3 == v4;
      v3 = v4;
    }
    while (!v5);
    v3 = v4;
  }
  while (__stlxr(a2, result));
  return result;
}

unint64_t OSAtomicDequeue_VARIANT_mp(unint64_t *a1, uint64_t a2)
{
  unint64_t result;

  while (1)
  {
    result = __ldaxr(a1);
    if (!result)
      break;
    if (!__stxr(*(_QWORD *)(result + a2), a1))
      return result;
  }
  __clrex();
  return result;
}

void OSMemoryBarrier_VARIANT_mp()
{
  __dmb(0xBu);
}

unsigned int *_OSSpinLockLockSlow_VARIANT_armv81(unsigned int *result)
{
  int i;
  signed int v2;

  for (i = 100; ; --i)
  {
    while (1)
    {
      v2 = __ldxr(result);
      if (v2)
        break;
      __clrex();
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v2, 1u, memory_order_acquire, memory_order_acquire);
      if (!v2)
        return result;
    }
    if (v2 != 1)
    {
      __clrex();
      _os_lock_corruption_abort((uint64_t)result, v2);
    }
    if (!i)
      break;
    __wfe();
  }
  __clrex();
  return (unsigned int *)_OSSpinLockLockYield_0((atomic_uint *)result);
}

unint64_t _OSSpinLockLockYield_0(atomic_uint *a1)
{
  unint64_t result;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  atomic_uint v7;
  mach_timebase_info info;

  result = mach_timebase_info(&info);
  if ((_DWORD)result)
  {
    v3 = -1;
  }
  else
  {
    v4 = 1000000 * (unint64_t)info.denom / info.numer;
    result = mach_absolute_time();
    v3 = result + v4;
  }
  v5 = 1;
  v6 = 1;
  while (1)
  {
    v7 = *a1;
    if (!*a1)
    {
      atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v7, 1u, memory_order_acquire, memory_order_acquire);
      if (!v7)
        break;
    }
    if (v7 != 1)
      _os_lock_corruption_abort((uint64_t)a1, v7);
    result = MEMORY[0x1DF0F003C](0, v6, v5);
    if ((_DWORD)v6 == 2)
    {
      v5 = (v5 + 1);
    }
    else
    {
      result = mach_absolute_time();
      if (result < v3)
        v6 = 1;
      else
        v6 = 2;
    }
  }
  return result;
}

unsigned int *spin_lock_VARIANT_armv81(unsigned int *result)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  if (v1)
    return _OSSpinLockLockSlow_VARIANT_armv81(result);
  return result;
}

BOOL OSSpinLockTry_VARIANT_armv81(atomic_uint *a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

BOOL spin_lock_try_VARIANT_armv81(atomic_uint *a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

unsigned int *spin_unlock_VARIANT_armv81(unsigned int *result)
{
  atomic_store(0, result);
  return result;
}

unsigned int *_os_lock_spin_lock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  unsigned int *result;

  v1 = 0;
  result = (unsigned int *)(a1 + 8);
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  if (v1)
    return _OSSpinLockLockSlow_VARIANT_armv81(result);
  return result;
}

BOOL _os_lock_spin_trylock_VARIANT_armv81(uint64_t a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, 1u, memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_spin_unlock_VARIANT_armv81(uint64_t result)
{
  atomic_store(0, (unsigned int *)(result + 8));
  return result;
}

void _os_lock_handoff_lock_VARIANT_armv81(uint64_t a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1)
    _os_lock_handoff_lock_slow_0(a1);
}

void _os_lock_handoff_lock_slow_0(uint64_t a1)
{
  char v2;
  unsigned int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;

  v2 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v4 = 100;
  v5 = 1;
LABEL_2:
  v6 = 1 - v4;
  while (1)
  {
    v7 = v6;
    v8 = *(_DWORD *)(a1 + 8);
    if (!v8)
    {
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v8, v3, memory_order_acquire, memory_order_acquire);
      if (!v8)
        break;
    }
    if (v8 == v3)
      _os_lock_recursive_abort(v3);
    ++v6;
    if (v7 == 1)
    {
      MEMORY[0x1DF0F003C]();
LABEL_8:
      ++v5;
      v4 = -v7;
      v2 = 1;
      goto LABEL_2;
    }
    MEMORY[0x1DF0F003C]();
    if ((v2 & 1) != 0)
      goto LABEL_8;
  }
}

BOOL _os_lock_handoff_trylock_VARIANT_armv81(uint64_t a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t _os_lock_handoff_unlock_VARIANT_armv81(uint64_t result)
{
  atomic_store(0, (unsigned int *)(result + 8));
  return result;
}

atomic_uint *os_unfair_lock_lock_VARIANT_armv81(atomic_uint *result)
{
  int v1;
  unsigned int v2;

  v1 = 0;
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, v2, memory_order_acquire, memory_order_acquire);
  if (v1)
    return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, 0, 0, v2);
  return result;
}

atomic_uint *os_unfair_lock_lock_with_options_VARIANT_armv81(atomic_uint *result, int a2)
{
  int v2;
  unsigned int v3;

  v2 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2)
    return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, a2, 0, v3);
  return result;
}

BOOL os_unfair_lock_trylock_VARIANT_armv81(atomic_uint *a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

uint64_t os_unfair_lock_trylock_with_options_VARIANT_armv81(atomic_uint *a1, int a2, uint64_t a3)
{
  int v3;
  unsigned int v4;

  v3 = 0;
  v4 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v3, v4, memory_order_acquire, memory_order_acquire);
  if (v3)
    return _os_unfair_lock_trylock_with_options_slow_0(a1, a2, a3, v4);
  else
    return 1;
}

uint64_t _os_unfair_lock_trylock_with_options_slow_0(atomic_uint *a1, int a2, uint64_t a3, unsigned int a4)
{
  unint64_t v8;
  uint64_t v9;
  mach_timebase_info info;

  if ((a2 & 0x2000000) != 0)
  {
    if (mach_absolute_time() <= a3)
      return _os_unfair_lock_lock_slow_0(a1, a2, a3, a4);
  }
  else if (a3)
  {
    mach_timebase_info(&info);
    v8 = info.denom * a3 / info.numer;
    v9 = mach_absolute_time();
    return _os_unfair_lock_lock_slow_0(a1, a2 | 0x2000000u, v9 + v8, a4);
  }
  return 0;
}

atomic_uint *os_unfair_lock_unlock_VARIANT_armv81(atomic_uint *result)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v2 != v1)
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v2);
  return result;
}

atomic_uint *os_unfair_lock_lock_no_tsd_VARIANT_armv81(atomic_uint *result, int a2, unsigned int a3)
{
  int v3;

  v3 = 0;
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v3, a3, memory_order_acquire, memory_order_acquire);
  if (v3)
    return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, a2, 0, a3);
  return result;
}

atomic_uint *os_unfair_lock_unlock_no_tsd_VARIANT_armv81(atomic_uint *result, int a2)
{
  unsigned int v2;

  v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v2 != a2)
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, a2, v2);
  return result;
}

atomic_uint *os_unfair_lock_lock_with_flags_VARIANT_armv81(atomic_uint *result, int a2)
{
  int v2;
  unsigned int v3;

  v2 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v2, v3, memory_order_acquire, memory_order_acquire);
  if (v2)
    return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, a2, 0, v3);
  return result;
}

atomic_uint *os_unfair_recursive_lock_lock_with_options_VARIANT_armv81(atomic_uint *result, int a2)
{
  unsigned int v2;
  int v3;

  v3 = 0;
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v3, v2, memory_order_acquire, memory_order_acquire);
  if (v3)
  {
    if ((v3 | 1) == v2)
      ++result[1];
    else
      return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, a2, 0, v2);
  }
  return result;
}

uint64_t os_unfair_recursive_lock_trylock_VARIANT_armv81(atomic_uint *a1)
{
  unsigned int v1;
  int v2;

  v2 = 0;
  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v2, v1, memory_order_acquire, memory_order_acquire);
  if (!v2)
    return 1;
  if ((v2 | 1) == v1)
  {
    ++a1[1];
    return 1;
  }
  return 0;
}

atomic_uint *os_unfair_recursive_lock_unlock_VARIANT_armv81(atomic_uint *result)
{
  int v1;
  atomic_uint v2;
  unsigned int v3;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = result[1];
  if (v2)
  {
    if ((*result | 1) != v1)
      _os_unfair_lock_unowned_abort(*result | 1);
    result[1] = v2 - 1;
  }
  else
  {
    v3 = atomic_exchange_explicit(result, 0, memory_order_release);
    if (v3 != v1)
      return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v1, v3);
  }
  return result;
}

BOOL os_unfair_recursive_lock_tryunlock4objc_VARIANT_armv81(atomic_uint *a1)
{
  int v1;
  int v2;
  atomic_uint v3;
  unsigned int v4;

  v1 = *a1 | 1;
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  if (v1 == v2)
  {
    v3 = a1[1];
    if (v3)
    {
      if ((*a1 | 1) != v1)
        _os_unfair_lock_unowned_abort(*a1 | 1);
      a1[1] = v3 - 1;
    }
    else
    {
      v4 = atomic_exchange_explicit(a1, 0, memory_order_release);
      if (v4 != v1)
        _os_unfair_lock_unlock_slow((uint64_t)a1, v1, v4);
    }
  }
  return v1 == v2;
}

atomic_uint *_os_lock_unfair_lock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  atomic_uint *result;
  unsigned int v3;

  v1 = 0;
  result = (atomic_uint *)(a1 + 8);
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, v3, memory_order_acquire, memory_order_acquire);
  if (v1)
    return (atomic_uint *)_os_unfair_lock_lock_slow_0(result, 0, 0, v3);
  return result;
}

BOOL _os_lock_unfair_trylock_VARIANT_armv81(uint64_t a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

atomic_uint *_os_lock_unfair_unlock_VARIANT_armv81(uint64_t a1)
{
  atomic_uint *result;
  int v2;
  unsigned int v3;

  result = (atomic_uint *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v3 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v3 != v2)
    return (atomic_uint *)_os_unfair_lock_unlock_slow((uint64_t)result, v2, v3);
  return result;
}

uint64_t _os_nospin_lock_lock_VARIANT_armv81(uint64_t result)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1)
    return _os_nospin_lock_lock_slow_0(result);
  return result;
}

uint64_t _os_nospin_lock_lock_slow_0(uint64_t result)
{
  atomic_uint *v1;
  int v2;
  int v3;
  int v4;
  atomic_uint v5;
  unsigned int v6;
  atomic_uint v8;
  int v9;

  v1 = (atomic_uint *)result;
  v2 = 0;
  v3 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v4 = 1;
  while (1)
  {
    v5 = *v1;
    if (!*v1)
    {
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v5, v3 & ~v2, memory_order_acquire, memory_order_acquire);
      if (!v5)
        break;
    }
    v6 = v5 & 0xFFFFFFFE;
    if (v5 != (v5 & 0xFFFFFFFE) && v6 != 0)
    {
      v8 = v5;
      atomic_compare_exchange_strong_explicit(v1, (unsigned int *)&v8, v6, memory_order_relaxed, memory_order_relaxed);
      if (v8 != v5)
        continue;
    }
    result = __ulock_wait();
    if ((result & 0x80000000) != 0)
    {
      v9 = -(int)result;
      if ((_DWORD)result != -4 && v9 != 14)
      {
        if (v9 != 60)
        {
          qword_1F044D878 = (uint64_t)"BUG IN LIBPLATFORM: ulock_wait failure";
          qword_1F044D8A8 = -(int)result;
          __break(1u);
          return result;
        }
        ++v4;
      }
    }
    else if ((_DWORD)result)
    {
      v2 = 1;
    }
  }
  return result;
}

BOOL _os_nospin_lock_trylock_VARIANT_armv81(atomic_uint *a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit(a1, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_nospin_lock_unlock_VARIANT_armv81(atomic_uint *a1)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = atomic_exchange_explicit(a1, 0, memory_order_release);
  if (v2 != v1)
    _os_nospin_lock_unlock_slow((uint64_t)a1, v2);
}

atomic_uint *_os_lock_nospin_lock_VARIANT_armv81(uint64_t a1)
{
  int v1;
  atomic_uint *result;

  v1 = 0;
  result = (atomic_uint *)(a1 + 8);
  atomic_compare_exchange_strong_explicit(result, (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  if (v1)
    return (atomic_uint *)_os_nospin_lock_lock_slow_0((uint64_t)result);
  return result;
}

BOOL _os_lock_nospin_trylock_VARIANT_armv81(uint64_t a1)
{
  int v1;

  v1 = 0;
  atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(a1 + 8), (unsigned int *)&v1, *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24), memory_order_acquire, memory_order_acquire);
  return v1 == 0;
}

void _os_lock_nospin_unlock_VARIANT_armv81(uint64_t a1)
{
  atomic_uint *v1;
  int v2;
  unsigned int v3;

  v1 = (atomic_uint *)(a1 + 8);
  v2 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v3 = atomic_exchange_explicit(v1, 0, memory_order_release);
  if (v3 != v2)
    _os_nospin_lock_unlock_slow((uint64_t)v1, v3);
}

atomic_ullong *__os_once_reset_VARIANT_armv81(atomic_ullong *result)
{
  int v1;
  unsigned int v2;

  v1 = *(_DWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
  v2 = atomic_exchange_explicit(result, 0, memory_order_release);
  if (v1 != v2)
    return (atomic_ullong *)_os_once_gate_broadcast((uint64_t)result, v2, v1);
  return result;
}

unint64_t *_os_once_VARIANT_armv81(unint64_t *result, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = atomic_load(result);
  if ((v3 & 3) == 1)
  {
    if (4 * MEMORY[0xFFFFFC180] - v3 - 15 <= 0xFFFFFFFFFFFFFFEFLL)
      *result = -1;
  }
  else
  {
    v4 = 0;
    v5 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 24);
    atomic_compare_exchange_strong_explicit((atomic_ullong *volatile)result, (unint64_t *)&v4, v5, memory_order_acquire, memory_order_acquire);
    if (v4)
      return (unint64_t *)_os_once_gate_wait_0((uint64_t)result, a2, a3, v5);
    else
      return (unint64_t *)_os_once_callout_0((atomic_ullong *)result, a2, a3, v5);
  }
  return result;
}

uint64_t os_sync_wait_on_address_with_deadline_VARIANT_armv81(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  int v6;
  uint64_t result;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    v6 = 22;
    if (a6 && a5 == 32)
    {
      result = __ulock_wait2();
      if ((result & 0x80000000) == 0)
        return result;
      v6 = -(int)result;
    }
  }
  else
  {
    v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_with_timeout_VARIANT_armv81(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, uint64_t a6)
{
  int v6;
  uint64_t result;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    v6 = 22;
    if (a6 && a5 == 32)
    {
      result = __ulock_wait2();
      if ((result & 0x80000000) == 0)
        return result;
      v6 = -(int)result;
    }
  }
  else
  {
    v6 = 22;
  }
  *__error() = v6;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wait_on_address_VARIANT_armv81(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t result;
  int v5;

  if (a4 <= 1 && (a3 == 8 || a3 == 4))
  {
    result = __ulock_wait2();
    if ((result & 0x80000000) == 0)
      return result;
    v5 = -(int)result;
  }
  else
  {
    v5 = 22;
  }
  *__error() = v5;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_any_VARIANT_armv81(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  int v4;

  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    result = __ulock_wake();
    if ((result & 0x80000000) == 0)
      return result;
    v4 = -(int)result;
  }
  else
  {
    v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

uint64_t os_sync_wake_by_address_all_VARIANT_armv81(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  int v4;

  if (a3 <= 1 && (a2 == 8 || a2 == 4))
  {
    result = __ulock_wake();
    if ((result & 0x80000000) == 0)
      return result;
    v4 = -(int)result;
  }
  else
  {
    v4 = 22;
  }
  *__error() = v4;
  return 0xFFFFFFFFLL;
}

unint64_t _os_alloc_once_VARIANT_armv81(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD v5[3];

  v5[0] = a1;
  v5[1] = a2;
  v5[2] = a3;
  _os_once_VARIANT_armv81(a1, (uint64_t)v5, _os_alloc_0);
  return a1[1];
}

uint64_t OSAtomicAdd32_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_add_explicit(a2, a1, memory_order_relaxed) + a1;
}

uint64_t OSAtomicAdd32Barrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_add(a2, a1) + a1;
}

uint64_t OSAtomicIncrement32_VARIANT_armv81(atomic_uint *a1)
{
  return atomic_fetch_add_explicit(a1, 1u, memory_order_relaxed) + 1;
}

uint64_t OSAtomicIncrement32Barrier_VARIANT_armv81(atomic_uint *a1)
{
  return atomic_fetch_add(a1, 1u) + 1;
}

uint64_t OSAtomicDecrement32_VARIANT_armv81(atomic_uint *a1)
{
  return atomic_fetch_add_explicit(a1, 0xFFFFFFFF, memory_order_relaxed) - 1;
}

uint64_t OSAtomicDecrement32Barrier_VARIANT_armv81(atomic_uint *a1)
{
  return atomic_fetch_add(a1, 0xFFFFFFFF) - 1;
}

unint64_t OSAtomicAdd64_VARIANT_armv81(unint64_t a1, atomic_ullong *a2)
{
  return atomic_fetch_add_explicit(a2, a1, memory_order_relaxed) + a1;
}

unint64_t OSAtomicAdd64Barrier_VARIANT_armv81(unint64_t a1, atomic_ullong *a2)
{
  return atomic_fetch_add(a2, a1) + a1;
}

unint64_t OSAtomicIncrement64_VARIANT_armv81(atomic_ullong *a1)
{
  return atomic_fetch_add_explicit(a1, 1uLL, memory_order_relaxed) + 1;
}

unint64_t OSAtomicIncrement64Barrier_VARIANT_armv81(atomic_ullong *a1)
{
  return atomic_fetch_add(a1, 1uLL) + 1;
}

unint64_t OSAtomicDecrement64_VARIANT_armv81(atomic_ullong *a1)
{
  return atomic_fetch_add_explicit(a1, 0xFFFFFFFFFFFFFFFFLL, memory_order_relaxed) - 1;
}

unint64_t OSAtomicDecrement64Barrier_VARIANT_armv81(atomic_ullong *a1)
{
  return atomic_fetch_add(a1, 0xFFFFFFFFFFFFFFFFLL) - 1;
}

uint64_t OSAtomicAnd32_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_and_explicit(a2, a1, memory_order_relaxed) & a1;
}

uint64_t OSAtomicAnd32Barrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_and(a2, a1) & a1;
}

uint64_t OSAtomicAnd32Orig_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_and_explicit(a2, a1, memory_order_relaxed);
}

uint64_t OSAtomicAnd32OrigBarrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_and(a2, a1);
}

uint64_t OSAtomicOr32_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_or_explicit(a2, a1, memory_order_relaxed) | a1;
}

uint64_t OSAtomicOr32Barrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_or(a2, a1) | a1;
}

uint64_t OSAtomicOr32Orig_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_or_explicit(a2, a1, memory_order_relaxed);
}

uint64_t OSAtomicOr32OrigBarrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_or(a2, a1);
}

uint64_t OSAtomicXor32_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_xor_explicit(a2, a1, memory_order_relaxed) ^ a1;
}

uint64_t OSAtomicXor32Barrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_xor(a2, a1) ^ a1;
}

uint64_t OSAtomicXor32Orig_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_xor_explicit(a2, a1, memory_order_relaxed);
}

uint64_t OSAtomicXor32OrigBarrier_VARIANT_armv81(unsigned int a1, atomic_uint *a2)
{
  return atomic_fetch_xor(a2, a1);
}

BOOL OSAtomicCompareAndSwap32_VARIANT_armv81(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3;

  v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unsigned int *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwap32Barrier_VARIANT_armv81(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3;

  v3 = a1;
  atomic_compare_exchange_strong(a3, (unsigned int *)&v3, a2);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapPtr_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unint64_t *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapPtrBarrier_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong(a3, (unint64_t *)&v3, a2);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapInt_VARIANT_armv81(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3;

  v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unsigned int *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapIntBarrier_VARIANT_armv81(int a1, unsigned int a2, atomic_uint *a3)
{
  int v3;

  v3 = a1;
  atomic_compare_exchange_strong(a3, (unsigned int *)&v3, a2);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapLong_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unint64_t *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwapLongBarrier_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong(a3, (unint64_t *)&v3, a2);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwap64_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong_explicit(a3, (unint64_t *)&v3, a2, memory_order_relaxed, memory_order_relaxed);
  return v3 == a1;
}

BOOL OSAtomicCompareAndSwap64Barrier_VARIANT_armv81(uint64_t a1, unint64_t a2, atomic_ullong *a3)
{
  uint64_t v3;

  v3 = a1;
  atomic_compare_exchange_strong(a3, (unint64_t *)&v3, a2);
  return v3 == a1;
}

BOOL OSAtomicTestAndSet_VARIANT_armv81(int a1, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 3) == 0)
    v2 = a2;
  return (atomic_fetch_or_explicit((atomic_uint *volatile)(v2 + (((a1 + 8 * (a2 & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18), memory_order_relaxed) & (0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndSetBarrier_VARIANT_armv81(int a1, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 3) == 0)
    v2 = a2;
  return (atomic_fetch_or((atomic_uint *volatile)(v2 + (((a1 + 8 * (a2 & 3)) >> 3) & 0x1FFFFFFC)), 0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18)) & (0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClear_VARIANT_armv81(int a1, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 3) == 0)
    v2 = a2;
  return (atomic_fetch_and_explicit((atomic_uint *volatile)(v2 + (((a1 + 8 * (a2 & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18)), memory_order_relaxed) & (0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18))) != 0;
}

BOOL OSAtomicTestAndClearBarrier_VARIANT_armv81(int a1, unint64_t a2)
{
  unint64_t v2;

  v2 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 3) == 0)
    v2 = a2;
  return (atomic_fetch_and((atomic_uint *volatile)(v2 + (((a1 + 8 * (a2 & 3)) >> 3) & 0x1FFFFFFC)), ~(0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18))) & (0x80u >> (a1 & 7) << ((a1 + 8 * (a2 & 3)) & 0x18))) != 0;
}

unint64_t *OSAtomicEnqueue_VARIANT_armv81(unint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v4;
  unint64_t v5;

  _X4 = a2;
  if ((result & 0xF) != 0)
    return _OSAtomicEnqueue_misalign(result, a2, a3);
  v4 = *result;
  v5 = result[1];
  do
  {
    *(_QWORD *)(a2 + a3) = v4;
    _X9 = v5;
    __asm { CASPL           X8, X9, X4, X5, [X0] }
    _ZF = _X8 == v4;
    v4 = _X8;
  }
  while (!_ZF);
  return result;
}

unint64_t *_OSAtomicEnqueue_misalign(unint64_t *result, unint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  BOOL v5;

  v3 = *result;
  do
  {
    do
    {
      *(_QWORD *)(a2 + a3) = v3;
      v4 = __ldxr(result);
      v5 = v3 == v4;
      v3 = v4;
    }
    while (!v5);
    v3 = v4;
  }
  while (__stlxr(a2, result));
  return result;
}

unint64_t OSAtomicDequeue_VARIANT_armv81(unint64_t *a1, uint64_t a2)
{
  unint64_t v2;
  BOOL v10;

  if ((a1 & 0xF) != 0)
    return _OSAtomicDequeue_misalign(a1, a2);
  v2 = atomic_load(a1);
  if (v2)
  {
    do
    {
      _X4 = *(_QWORD *)(v2 + a2);
      _X7 = a1[1];
      __asm { CASPA           X6, X7, X4, X5, [X0] }
      v10 = _X6 == v2;
      if (_X6 != v2)
        v2 = _X6;
    }
    while (!v10 && v2);
  }
  return v2;
}

unint64_t _OSAtomicDequeue_misalign(unint64_t *a1, uint64_t a2)
{
  unint64_t result;

  while (1)
  {
    result = __ldaxr(a1);
    if (!result)
      break;
    if (!__stxr(*(_QWORD *)(result + a2), a1))
      return result;
  }
  __clrex();
  return result;
}

void OSMemoryBarrier_VARIANT_armv81()
{
  __dmb(0xBu);
}

uint64_t _sigunaltstack()
{
  return __sigreturn();
}

char *_platform_memccpy(uint64_t *a1, uint64_t *a2, unsigned int a3, unint64_t a4)
{
  unint64_t v7;
  unint64_t v8;

  if (!a4)
    return 0;
  v7 = _platform_memchr((uint64_t)a2, a3, a4);
  if (v7)
  {
    v8 = v7 - (_QWORD)a2 + 1;
    _platform_memmove(a1, a2, v8);
    return (char *)a1 + v8;
  }
  else
  {
    _platform_memmove(a1, a2, a4);
    return 0;
  }
}

uint64_t sub_1DED8F820()
{
  return 0;
}

BOOL _platform_memcmp_zero_aligned8(int8x16_t *a1, unint64_t a2)
{
  int8x16_t *v2;
  int8x16_t *v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t i;
  uint64_t v12;
  uint64_t v13;

  if (a2 < 0x40)
  {
    if (a2)
    {
      v12 = 0;
      do
      {
        v13 = a1->i64[0];
        a1 = (int8x16_t *)((char *)a1 + 8);
        v12 |= v13;
        v9 = a2 > 8;
        a2 -= 8;
      }
      while (v9);
      return v12 != 0;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v2 = a1;
    v3 = (int8x16_t *)((unint64_t)&a1[4] & 0xFFFFFFFFFFFFFFC0);
    v4 = *v2;
    v5 = v2[1];
    v6 = v2[2];
    v7 = v2[3];
    v8 = a2 - ((char *)v3 - (char *)v2);
    v9 = v8 > 0x40;
    for (i = v8 - 64; v9; i -= 64)
    {
      v4 = vorrq_s8(v4, *v3);
      v5 = vorrq_s8(v5, v3[1]);
      v6 = vorrq_s8(v6, v3[2]);
      v7 = vorrq_s8(v7, v3[3]);
      v3 += 4;
      v9 = i > 0x40;
    }
    return vmaxvq_u8((uint8x16_t)vorrq_s8(vorrq_s8(vorrq_s8(v4, *(int8x16_t *)((char *)v3 + i)), vorrq_s8(v5, *(int8x16_t *)((char *)&v3[1] + i))), vorrq_s8(vorrq_s8(v6, *(int8x16_t *)((char *)&v3[2] + i)), vorrq_s8(v7, *(int8x16_t *)((char *)&v3[3] + i))))) != 0;
  }
}

uint64_t swapcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t getcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

uint64_t setcontext()
{
  *__error() = 45;
  return 0xFFFFFFFFLL;
}

void _os_log_simple_reinit_4launchd_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: asl fd already initialized";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _enlarge_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Failed to allocate memory for buffer";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_lock_corruption_abort(uint64_t a1, uint64_t a2)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_lock is corrupt";
  qword_1F044D8A8 = a2;
  __break(1u);
}

void _os_unfair_lock_recursive_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_unfair_lock";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_unfair_lock_corruption_abort(unsigned int a1)
{
  if (a1 - 512 <= 0x3FE00)
  {
    qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt, or owner thread exited without unlocking";
    qword_1F044D8A8 = a1;
    __break(1u);
  }
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_unfair_lock is corrupt";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_once_gate_recursive_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_once_t";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_once_gate_unowned_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Unlock of an os_once_t not owned by current thread";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_once_gate_corruption_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: os_once_t is corrupt";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void os_unfair_lock_assert_owner_cold_1(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly not owned by current thread";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void os_unfair_lock_assert_not_owner_cold_1(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Assertion failed: Lock unexpectedly owned by current thread";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void os_unfair_recursive_lock_unlock_forked_child_cold_1()
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Lock was not held";
  __break(1u);
}

void _os_semaphore_create_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Creating semaphore failed, possible port leak";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_semaphore_create_cold_2()
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Allocating semaphore failed with MIG_REPLY_MISMATCH";
  qword_1F044D8A8 = -301;
  __break(1u);
}

void _os_semaphore_dispose_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Destroying semaphore failed";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_semaphore_signal_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Signaling semaphore failed";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_semaphore_wait_cold_1(int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Waiting on semaphore failed";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_lock_recursive_abort(unsigned int a1)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Trying to recursively lock an os_lock";
  qword_1F044D8A8 = a1;
  __break(1u);
}

void _os_alloc_cold_1(uint64_t __theAmount, int32_t *__theValue)
{
  qword_1F044D878 = (uint64_t)"BUG IN CLIENT OF LIBPLATFORM: Requested allocation size is invalid";
  qword_1F044D8A8 = __theAmount;
  __break(1u);
  OSAtomicAdd32_0(__theAmount, __theValue);
}

int32_t OSAtomicAdd32_0(int32_t __theAmount, int32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, int32_t *))OSAtomicAdd32_ptr)(*(uint64_t *)&__theAmount, __theValue);
}

int32_t OSAtomicAdd32Barrier_0(int32_t __theAmount, int32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, int32_t *))OSAtomicAdd32Barrier_ptr)(*(uint64_t *)&__theAmount, __theValue);
}

int64_t OSAtomicAdd64_0(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(int64_t, OSAtomic_int64_aligned64_t *))OSAtomicAdd64_ptr)(__theAmount, __theValue);
}

int64_t OSAtomicAdd64Barrier_0(int64_t __theAmount, OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(int64_t, OSAtomic_int64_aligned64_t *))OSAtomicAdd64Barrier_ptr)(__theAmount, __theValue);
}

int32_t OSAtomicAnd32_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicAnd32_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicAnd32Barrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicAnd32Barrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicAnd32Orig_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicAnd32Orig_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicAnd32OrigBarrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicAnd32OrigBarrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

BOOL OSAtomicCompareAndSwap32_0(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, int32_t *))OSAtomicCompareAndSwap32_ptr)(*(uint64_t *)&__oldValue, *(uint64_t *)&__newValue, __theValue);
}

BOOL OSAtomicCompareAndSwap32Barrier_0(int32_t __oldValue, int32_t __newValue, int32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, int32_t *))OSAtomicCompareAndSwap32Barrier_ptr)(*(uint64_t *)&__oldValue, *(uint64_t *)&__newValue, __theValue);
}

BOOL OSAtomicCompareAndSwap64_0(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(int64_t, int64_t, OSAtomic_int64_aligned64_t *))OSAtomicCompareAndSwap64_ptr)(__oldValue, __newValue, __theValue);
}

BOOL OSAtomicCompareAndSwap64Barrier_0(int64_t __oldValue, int64_t __newValue, OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(int64_t, int64_t, OSAtomic_int64_aligned64_t *))OSAtomicCompareAndSwap64Barrier_ptr)(__oldValue, __newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapInt_0(int __oldValue, int __newValue, int *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, int *))OSAtomicCompareAndSwapInt_ptr)(*(uint64_t *)&__oldValue, *(uint64_t *)&__newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapIntBarrier_0(int __oldValue, int __newValue, int *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, int *))OSAtomicCompareAndSwapIntBarrier_ptr)(*(uint64_t *)&__oldValue, *(uint64_t *)&__newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapLong_0(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *))OSAtomicCompareAndSwapLong_ptr)(__oldValue, __newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapLongBarrier_0(uint64_t __oldValue, uint64_t __newValue, uint64_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *))OSAtomicCompareAndSwapLongBarrier_ptr)(__oldValue, __newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapPtr_0(void *__oldValue, void *__newValue, void **__theValue)
{
  return ((uint64_t (*)(void *, void *, void **))OSAtomicCompareAndSwapPtr_ptr)(__oldValue, __newValue, __theValue);
}

BOOL OSAtomicCompareAndSwapPtrBarrier_0(void *__oldValue, void *__newValue, void **__theValue)
{
  return ((uint64_t (*)(void *, void *, void **))OSAtomicCompareAndSwapPtrBarrier_ptr)(__oldValue, __newValue, __theValue);
}

int32_t OSAtomicDecrement32_0(int32_t *__theValue)
{
  return ((uint64_t (*)(int32_t *))OSAtomicDecrement32_ptr)(__theValue);
}

int32_t OSAtomicDecrement32Barrier_0(int32_t *__theValue)
{
  return ((uint64_t (*)(int32_t *))OSAtomicDecrement32Barrier_ptr)(__theValue);
}

int64_t OSAtomicDecrement64_0(OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *))OSAtomicDecrement64_ptr)(__theValue);
}

int64_t OSAtomicDecrement64Barrier_0(OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *))OSAtomicDecrement64Barrier_ptr)(__theValue);
}

void *__cdecl OSAtomicDequeue_0(OSQueueHead *__list, size_t a2)
{
  return (void *)((uint64_t (*)(OSQueueHead *, size_t))OSAtomicDequeue_ptr)(__list, a2);
}

void OSAtomicEnqueue_0(OSQueueHead *__list, void *__new, size_t a3)
{
  ((void (*)(OSQueueHead *, void *, size_t))OSAtomicEnqueue_ptr)(__list, __new, a3);
}

int32_t OSAtomicIncrement32_0(int32_t *__theValue)
{
  return ((uint64_t (*)(int32_t *))OSAtomicIncrement32_ptr)(__theValue);
}

int32_t OSAtomicIncrement32Barrier_0(int32_t *__theValue)
{
  return ((uint64_t (*)(int32_t *))OSAtomicIncrement32Barrier_ptr)(__theValue);
}

int64_t OSAtomicIncrement64_0(OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *))OSAtomicIncrement64_ptr)(__theValue);
}

int64_t OSAtomicIncrement64Barrier_0(OSAtomic_int64_aligned64_t *__theValue)
{
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *))OSAtomicIncrement64Barrier_ptr)(__theValue);
}

int32_t OSAtomicOr32_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicOr32_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicOr32Barrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicOr32Barrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicOr32Orig_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicOr32Orig_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicOr32OrigBarrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicOr32OrigBarrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

BOOL OSAtomicTestAndClear_0(uint32_t __n, void *__theAddress)
{
  return ((uint64_t (*)(uint64_t, void *))OSAtomicTestAndClear_ptr)(*(uint64_t *)&__n, __theAddress);
}

BOOL OSAtomicTestAndClearBarrier_0(uint32_t __n, void *__theAddress)
{
  return ((uint64_t (*)(uint64_t, void *))OSAtomicTestAndClearBarrier_ptr)(*(uint64_t *)&__n, __theAddress);
}

BOOL OSAtomicTestAndSet_0(uint32_t __n, void *__theAddress)
{
  return ((uint64_t (*)(uint64_t, void *))OSAtomicTestAndSet_ptr)(*(uint64_t *)&__n, __theAddress);
}

BOOL OSAtomicTestAndSetBarrier_0(uint32_t __n, void *__theAddress)
{
  return ((uint64_t (*)(uint64_t, void *))OSAtomicTestAndSetBarrier_ptr)(*(uint64_t *)&__n, __theAddress);
}

int32_t OSAtomicXor32_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicXor32_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicXor32Barrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicXor32Barrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicXor32Orig_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicXor32Orig_ptr)(*(uint64_t *)&__theMask, __theValue);
}

int32_t OSAtomicXor32OrigBarrier_0(uint32_t __theMask, uint32_t *__theValue)
{
  return ((uint64_t (*)(uint64_t, uint32_t *))OSAtomicXor32OrigBarrier_ptr)(*(uint64_t *)&__theMask, __theValue);
}

void OSMemoryBarrier_0(void)
{
  ((void (*)())OSMemoryBarrier_ptr)();
}

void OSSpinLockLock_0(OSSpinLock *__lock)
{
  ((void (*)(OSSpinLock *))OSSpinLockLock_ptr)(__lock);
}

BOOL OSSpinLockTry_0(OSSpinLock *__lock)
{
  return ((uint64_t (*)(OSSpinLock *))OSSpinLockTry_ptr)(__lock);
}

void OSSpinLockUnlock_0(OSSpinLock *__lock)
{
  ((void (*)(OSSpinLock *))OSSpinLockUnlock_ptr)(__lock);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C87D88]();
}

uint64_t __gettimeofday()
{
  return MEMORY[0x1E0C87DD0]();
}

uint64_t __libkernel_platform_init()
{
  return MEMORY[0x1E0C87DF0]();
}

uint64_t __os_once_reset_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return __os_once_reset_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __sendto()
{
  return MEMORY[0x1E0C87ED8]();
}

uint64_t __sigaction()
{
  return MEMORY[0x1E0C87EF8]();
}

uint64_t __sigaltstack()
{
  return MEMORY[0x1E0C87F00]();
}

uint64_t __sigreturn()
{
  return MEMORY[0x1E0C87F08]();
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

uint64_t _os_alloc_once_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_alloc_once_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_handoff_lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_handoff_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_handoff_trylock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_handoff_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_handoff_unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_handoff_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_nospin_lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_nospin_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_nospin_trylock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_nospin_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_nospin_unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_nospin_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_spin_lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_spin_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_spin_trylock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_spin_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_spin_unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_spin_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_unfair_lock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_unfair_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_unfair_trylock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_unfair_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t j___os_lock_unfair_unlock(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_lock_unfair_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_nospin_lock_lock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_nospin_lock_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_nospin_lock_trylock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_nospin_lock_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_nospin_lock_unlock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_nospin_lock_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _os_once_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _os_once_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _spin_lock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _spin_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _spin_lock_try_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _spin_lock_try_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t _spin_unlock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return _spin_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int close(int a1)
{
  return MEMORY[0x1E0C88018](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C88028](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C88090](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

gid_t getgid(void)
{
  return MEMORY[0x1E0C88170]();
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C88190]();
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C881C0]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C882B0]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C882D0]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C88400](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C88410](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C88418](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

uint64_t os_sync_wait_on_address_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_sync_wait_on_address_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_sync_wait_on_address_with_deadline_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_sync_wait_on_address_with_deadline_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_sync_wait_on_address_with_timeout_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_sync_wait_on_address_with_timeout_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_sync_wake_by_address_all_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_sync_wake_by_address_all_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_sync_wake_by_address_any_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_sync_wake_by_address_any_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void os_unfair_lock_lock_0(os_unfair_lock_t lock)
{
  ((void (*)(os_unfair_lock_s *))os_unfair_lock_lock_ptr)(lock);
}

uint64_t os_unfair_lock_lock_no_tsd_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_lock_lock_no_tsd_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_lock_lock_with_flags_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_lock_lock_with_flags_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_lock_lock_with_options_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_lock_lock_with_options_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL os_unfair_lock_trylock_0(os_unfair_lock_t lock)
{
  return ((uint64_t (*)(os_unfair_lock_s *))os_unfair_lock_trylock_ptr)(lock);
}

uint64_t os_unfair_lock_trylock_with_options_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_lock_trylock_with_options_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

void os_unfair_lock_unlock_0(os_unfair_lock_t lock)
{
  ((void (*)(os_unfair_lock_s *))os_unfair_lock_unlock_ptr)(lock);
}

uint64_t os_unfair_lock_unlock_no_tsd_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_lock_unlock_no_tsd_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_recursive_lock_lock_with_options_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_recursive_lock_lock_with_options_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_recursive_lock_trylock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_recursive_lock_trylock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_recursive_lock_tryunlock4objc_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_recursive_lock_tryunlock4objc_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t os_unfair_recursive_lock_unlock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return os_unfair_recursive_lock_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C88608](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

kern_return_t semaphore_create(task_t task, semaphore_t *semaphore, int policy, int value)
{
  return MEMORY[0x1E0C88678](*(_QWORD *)&task, semaphore, *(_QWORD *)&policy, *(_QWORD *)&value);
}

kern_return_t semaphore_destroy(task_t task, semaphore_t semaphore)
{
  return MEMORY[0x1E0C88680](*(_QWORD *)&task, *(_QWORD *)&semaphore);
}

kern_return_t semaphore_signal(semaphore_t semaphore)
{
  return MEMORY[0x1E0C88688](*(_QWORD *)&semaphore);
}

kern_return_t semaphore_wait(semaphore_t semaphore)
{
  return MEMORY[0x1E0C88698](*(_QWORD *)&semaphore);
}

int sigprocmask(int a1, const sigset_t *a2, sigset_t *a3)
{
  return MEMORY[0x1E0C88710](*(_QWORD *)&a1, a2, a3);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C88728](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

uint64_t spin_lock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return spin_lock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t spin_lock_try_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return spin_lock_try_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t spin_unlock_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return spin_unlock_ptr(a1, a2, a3, a4, a5, a6, a7, a8);
}

kern_return_t thread_switch(mach_port_name_t thread_name, int option, mach_msg_timeout_t option_time)
{
  return MEMORY[0x1E0C887C0](*(_QWORD *)&thread_name, *(_QWORD *)&option, *(_QWORD *)&option_time);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C887E0](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C887F0](*(_QWORD *)&target_task, address, size);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C888E0](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t sub_1DED90458(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_alloc_once_ptr = (uint64_t (*)())_os_alloc_once();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_alloc_once_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED904BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_once_ptr = (uint64_t (*)())_os_once();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_once_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90520(uint64_t a1, int32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAdd32_ptr = (uint64_t (*)())OSAtomicAdd32(a1, a2);
  return ((uint64_t (*)(uint64_t, int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAdd32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90584(uint64_t a1, int32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAdd32Barrier_ptr = (uint64_t (*)())OSAtomicAdd32Barrier(a1, a2);
  return ((uint64_t (*)(uint64_t, int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAdd32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED905E8(int32_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicIncrement32_ptr = (uint64_t (*)())OSAtomicIncrement32(a1);
  return ((uint64_t (*)(int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicIncrement32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9064C(int32_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicIncrement32Barrier_ptr = (uint64_t (*)())OSAtomicIncrement32Barrier(a1);
  return ((uint64_t (*)(int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicIncrement32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED906B0(int32_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicDecrement32_ptr = (uint64_t (*)())OSAtomicDecrement32(a1);
  return ((uint64_t (*)(int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicDecrement32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90714(int32_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicDecrement32Barrier_ptr = (uint64_t (*)())OSAtomicDecrement32Barrier(a1);
  return ((uint64_t (*)(int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicDecrement32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90778(int64_t a1, OSAtomic_int64_aligned64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAdd64_ptr = (uint64_t (*)())OSAtomicAdd64(a1, a2);
  return ((uint64_t (*)(int64_t, OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAdd64_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED907DC(int64_t a1, OSAtomic_int64_aligned64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAdd64Barrier_ptr = (uint64_t (*)())OSAtomicAdd64Barrier(a1, a2);
  return ((uint64_t (*)(int64_t, OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAdd64Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90840(OSAtomic_int64_aligned64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicIncrement64_ptr = (uint64_t (*)())OSAtomicIncrement64(a1);
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicIncrement64_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED908A4(OSAtomic_int64_aligned64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicIncrement64Barrier_ptr = (uint64_t (*)())OSAtomicIncrement64Barrier(a1);
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicIncrement64Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90908(OSAtomic_int64_aligned64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicDecrement64_ptr = (uint64_t (*)())OSAtomicDecrement64(a1);
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicDecrement64_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9096C(OSAtomic_int64_aligned64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicDecrement64Barrier_ptr = (uint64_t (*)())OSAtomicDecrement64Barrier(a1);
  return ((uint64_t (*)(OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicDecrement64Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED909D0(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAnd32_ptr = (uint64_t (*)())OSAtomicAnd32(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAnd32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90A34(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAnd32Barrier_ptr = (uint64_t (*)())OSAtomicAnd32Barrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAnd32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90A98(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAnd32Orig_ptr = (uint64_t (*)())OSAtomicAnd32Orig(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAnd32Orig_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90AFC(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicAnd32OrigBarrier_ptr = (uint64_t (*)())OSAtomicAnd32OrigBarrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicAnd32OrigBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90B60(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicOr32_ptr = (uint64_t (*)())OSAtomicOr32(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicOr32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90BC4(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicOr32Barrier_ptr = (uint64_t (*)())OSAtomicOr32Barrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicOr32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90C28(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicOr32Orig_ptr = (uint64_t (*)())OSAtomicOr32Orig(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicOr32Orig_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90C8C(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicOr32OrigBarrier_ptr = (uint64_t (*)())OSAtomicOr32OrigBarrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicOr32OrigBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90CF0(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicXor32_ptr = (uint64_t (*)())OSAtomicXor32(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicXor32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90D54(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicXor32Barrier_ptr = (uint64_t (*)())OSAtomicXor32Barrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicXor32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90DB8(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicXor32Orig_ptr = (uint64_t (*)())OSAtomicXor32Orig(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicXor32Orig_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90E1C(uint64_t a1, uint32_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicXor32OrigBarrier_ptr = (uint64_t (*)())OSAtomicXor32OrigBarrier(a1, a2);
  return ((uint64_t (*)(uint64_t, uint32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicXor32OrigBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90E80(uint64_t a1, uint64_t a2, int32_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwap32_ptr = (uint64_t (*)())OSAtomicCompareAndSwap32(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwap32_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90EE4(uint64_t a1, uint64_t a2, int32_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwap32Barrier_ptr = (uint64_t (*)())OSAtomicCompareAndSwap32Barrier(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, int32_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwap32Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90F48(void *a1, void *a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapPtr_ptr = (uint64_t (*)())OSAtomicCompareAndSwapPtr(a1, a2, a3);
  return ((uint64_t (*)(void *, void *, void **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapPtr_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED90FAC(void *a1, void *a2, void **a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapPtrBarrier_ptr = (uint64_t (*)())OSAtomicCompareAndSwapPtrBarrier(a1, a2, a3);
  return ((uint64_t (*)(void *, void *, void **, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapPtrBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91010(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapInt_ptr = (uint64_t (*)())OSAtomicCompareAndSwapInt(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapInt_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91074(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapIntBarrier_ptr = (uint64_t (*)())OSAtomicCompareAndSwapIntBarrier(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, int *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapIntBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED910D8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapLong_ptr = (uint64_t (*)())OSAtomicCompareAndSwapLong(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapLong_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9113C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwapLongBarrier_ptr = (uint64_t (*)())OSAtomicCompareAndSwapLongBarrier(a1, a2, a3);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwapLongBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED911A0(int64_t a1, int64_t a2, OSAtomic_int64_aligned64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwap64_ptr = (uint64_t (*)())OSAtomicCompareAndSwap64(a1, a2, a3);
  return ((uint64_t (*)(int64_t, int64_t, OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwap64_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91204(int64_t a1, int64_t a2, OSAtomic_int64_aligned64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicCompareAndSwap64Barrier_ptr = (uint64_t (*)())OSAtomicCompareAndSwap64Barrier(a1, a2, a3);
  return ((uint64_t (*)(int64_t, int64_t, OSAtomic_int64_aligned64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicCompareAndSwap64Barrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91268(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicTestAndSet_ptr = (uint64_t (*)())OSAtomicTestAndSet(a1, a2);
  return ((uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicTestAndSet_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED912CC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicTestAndSetBarrier_ptr = (uint64_t (*)())OSAtomicTestAndSetBarrier(a1, a2);
  return ((uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicTestAndSetBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91330(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicTestAndClear_ptr = (uint64_t (*)())OSAtomicTestAndClear(a1, a2);
  return ((uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicTestAndClear_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91394(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicTestAndClearBarrier_ptr = (uint64_t (*)())OSAtomicTestAndClearBarrier(a1, a2);
  return ((uint64_t (*)(uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicTestAndClearBarrier_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED913F8(OSQueueHead *a1, void *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  OSAtomicEnqueue(a1, a2, a3);
  OSAtomicEnqueue_ptr = v8;
  return ((uint64_t (*)(OSQueueHead *, void *, size_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9145C(OSQueueHead *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSAtomicDequeue_ptr = (uint64_t (*)())OSAtomicDequeue(a1, a2);
  return ((uint64_t (*)(OSQueueHead *, size_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSAtomicDequeue_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED914C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  OSMemoryBarrier();
  OSMemoryBarrier_ptr = v8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91524(OSSpinLock *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  OSSpinLockLock(a1);
  OSSpinLockLock_ptr = v8;
  return ((uint64_t (*)(OSSpinLock *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91588(OSSpinLock *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OSSpinLockTry_ptr = (uint64_t (*)())OSSpinLockTry(a1);
  return ((uint64_t (*)(OSSpinLock *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))OSSpinLockTry_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED915EC(OSSpinLock *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  OSSpinLockUnlock(a1);
  OSSpinLockUnlock_ptr = v8;
  return ((uint64_t (*)(OSSpinLock *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  spin_lock_ptr = (uint64_t (*)())spin_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))spin_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED916B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  spin_lock_try_ptr = (uint64_t (*)())spin_lock_try();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))spin_lock_try_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  spin_unlock_ptr = (uint64_t (*)())spin_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))spin_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9177C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _spin_lock_ptr = (uint64_t (*)())_spin_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_spin_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED917E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _spin_lock_try_ptr = (uint64_t (*)())_spin_lock_try();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_spin_lock_try_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _spin_unlock_ptr = (uint64_t (*)())_spin_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_spin_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED918A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_sync_wait_on_address_ptr = (uint64_t (*)())os_sync_wait_on_address();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_sync_wait_on_address_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9190C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_sync_wait_on_address_with_deadline_ptr = (uint64_t (*)())os_sync_wait_on_address_with_deadline();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_sync_wait_on_address_with_deadline_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_sync_wait_on_address_with_timeout_ptr = (uint64_t (*)())os_sync_wait_on_address_with_timeout();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_sync_wait_on_address_with_timeout_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED919D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_sync_wake_by_address_any_ptr = (uint64_t (*)())os_sync_wake_by_address_any();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_sync_wake_by_address_any_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_sync_wake_by_address_all_ptr = (uint64_t (*)())os_sync_wake_by_address_all();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_sync_wake_by_address_all_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91A9C(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  os_unfair_lock_lock(a1);
  os_unfair_lock_lock_ptr = v8;
  return ((uint64_t (*)(os_unfair_lock_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91B00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_lock_no_tsd_ptr = (uint64_t (*)())os_unfair_lock_lock_no_tsd();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_lock_no_tsd_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91B64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_lock_with_options_ptr = (uint64_t (*)())os_unfair_lock_lock_with_options();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_lock_with_options_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91BC8(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_trylock_ptr = (uint64_t (*)())os_unfair_lock_trylock(a1);
  return ((uint64_t (*)(os_unfair_lock_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91C2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_trylock_with_options_ptr = (uint64_t (*)())os_unfair_lock_trylock_with_options();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_trylock_with_options_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91C90(os_unfair_lock_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v8)();

  os_unfair_lock_unlock(a1);
  os_unfair_lock_unlock_ptr = v8;
  return ((uint64_t (*)(os_unfair_lock_s *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_unlock_no_tsd_ptr = (uint64_t (*)())os_unfair_lock_unlock_no_tsd();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_unlock_no_tsd_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_recursive_lock_lock_with_options_ptr = (uint64_t (*)())os_unfair_recursive_lock_lock_with_options();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_recursive_lock_lock_with_options_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91DBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_recursive_lock_trylock_ptr = (uint64_t (*)())os_unfair_recursive_lock_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_recursive_lock_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91E20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_recursive_lock_tryunlock4objc_ptr = (uint64_t (*)())os_unfair_recursive_lock_tryunlock4objc();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_recursive_lock_tryunlock4objc_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_recursive_lock_unlock_ptr = (uint64_t (*)())os_unfair_recursive_lock_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_recursive_lock_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91EE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  os_unfair_lock_lock_with_flags_ptr = (uint64_t (*)())os_unfair_lock_lock_with_flags();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))os_unfair_lock_lock_with_flags_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_nospin_lock_lock_ptr = (uint64_t (*)())_os_nospin_lock_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_nospin_lock_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED91FB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_nospin_lock_trylock_ptr = (uint64_t (*)())_os_nospin_lock_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_nospin_lock_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92014(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_nospin_lock_unlock_ptr = (uint64_t (*)())_os_nospin_lock_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_nospin_lock_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92078(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_spin_lock_ptr = (uint64_t (*)())_os_lock_spin_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_spin_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED920DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_spin_trylock_ptr = (uint64_t (*)())_os_lock_spin_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_spin_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_spin_unlock_ptr = (uint64_t (*)())_os_lock_spin_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_spin_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED921A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_handoff_lock_ptr = (uint64_t (*)())_os_lock_handoff_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_handoff_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92208(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_handoff_trylock_ptr = (uint64_t (*)())_os_lock_handoff_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_handoff_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED9226C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_handoff_unlock_ptr = (uint64_t (*)())_os_lock_handoff_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_handoff_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED922D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_unfair_lock_ptr = (uint64_t (*)())_os_lock_unfair_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_unfair_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92334(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_unfair_trylock_ptr = (uint64_t (*)())_os_lock_unfair_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_unfair_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_unfair_unlock_ptr = (uint64_t (*)())_os_lock_unfair_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_unfair_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED923FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_nospin_lock_ptr = (uint64_t (*)())_os_lock_nospin_lock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_nospin_lock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92460(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_nospin_trylock_ptr = (uint64_t (*)())_os_lock_nospin_trylock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_nospin_trylock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED924C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _os_lock_nospin_unlock_ptr = (uint64_t (*)())_os_lock_nospin_unlock();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_os_lock_nospin_unlock_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1DED92528(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __os_once_reset_ptr = (uint64_t (*)())__os_once_reset();
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__os_once_reset_ptr)(a1, a2, a3, a4, a5, a6, a7, a8);
}
