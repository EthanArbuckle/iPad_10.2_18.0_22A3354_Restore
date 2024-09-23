@implementation VARIANT

uint64_t _dispatch_block_invoke_direct_VARIANT_mp(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *StatusReg;
  uint64_t v13;
  unsigned int *v14;
  int v15;
  uint64_t v16;
  unsigned int *v17;
  unsigned int v18;
  BOOL v19;
  signed int v20;
  unsigned int *v21;
  unsigned int v22;

  v1 = *(_QWORD *)(result + 8);
  v2 = *(_DWORD *)(result + 16);
  if ((v2 & 4) != 0)
    _dispatch_block_invoke_direct_VARIANT_mp_cold_3(*(_DWORD *)(result + 16));
  v3 = result;
  if ((v2 & 1) == 0)
  {
    v4 = 0;
    if ((v1 & 0x40000000) != 0)
    {
      v5 = 0;
      if ((v1 & 0x30) != 0x10)
      {
        v6 = *(_QWORD *)(v3 + 24);
        v7 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) & 0xFFFFFFLL;
        v8 = v7 != 0;
        v9 = v7 < (v6 & 0xFFFFFFuLL);
        v10 = v6 & 0xFFFFFFFF02FFFFFFLL;
        if (v8 && v9)
          v4 = v7;
        else
          v4 = 0;
        if (v8 && v9)
          v5 = v10;
        else
          v5 = 0;
      }
      if ((v1 & 0x80000000) == 0)
        goto LABEL_12;
    }
    else
    {
      v5 = 0;
      if ((v1 & 0x80000000) == 0)
      {
LABEL_12:
        v11 = -1;
        goto LABEL_15;
      }
    }
    v11 = *(_QWORD *)(v3 + 32);
LABEL_15:
    StatusReg = (_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = StatusReg[4];
    if ((v13 & 0x1000000) != 0)
    {
      if (v5)
        goto LABEL_47;
      v5 = v13 & 0xFFFFFFFFFEFFFFFFLL;
    }
    else if (v5 == (v13 & 0xFFFFFFFF77FFFFFFLL))
    {
LABEL_17:
      if (v11 == -1)
        goto LABEL_23;
      if (StatusReg[28] == v11)
      {
        if (v11)
        {
          v14 = (unsigned int *)(v11 + 12);
          do
            v15 = __ldxr(v14);
          while (__stxr(v15 + 1, v14));
          if (v15 <= 0)
            dispatch_group_notify_VARIANT_mp_cold_3();
        }
LABEL_23:
        *(_DWORD *)(v3 + 64) = StatusReg[3];
        result = _dispatch_client_callout(*(_QWORD *)(v3 + 40), *(uint64_t (**)(void))(*(_QWORD *)(v3 + 40) + 16));
        v16 = StatusReg[4];
        if ((v16 & 0x1000000) != 0)
        {
          if (v4)
            goto LABEL_49;
          v4 = v16 & 0xFFFFFFFFFEFFFFFFLL;
        }
        else if (v4 == (v16 & 0xFFFFFFFF77FFFFFFLL))
        {
LABEL_25:
          if (v11 == -1)
            goto LABEL_31;
          if (StatusReg[28] == v11)
          {
            if (v11)
            {
              v17 = (unsigned int *)(v11 + 12);
              do
              {
                v18 = __ldxr(v17);
                v19 = __OFSUB__(v18, 1);
                v20 = v18 - 1;
              }
              while (__stxr(v20, v17));
              if ((v20 < 0) ^ v19 | (v20 == 0))
                _dispatch_async_redirect_invoke_cold_1();
            }
            goto LABEL_31;
          }
          v4 = 0;
LABEL_49:
          result = _dispatch_set_priority_and_voucher_slow_VARIANT_mp(v4, v11, 6);
          if ((v2 & 8) != 0)
            return result;
          goto LABEL_32;
        }
        if (v4)
          goto LABEL_49;
        goto LABEL_25;
      }
      v5 = 0;
LABEL_47:
      v11 = _dispatch_set_priority_and_voucher_slow_VARIANT_mp(v5, v11, 0);
      goto LABEL_23;
    }
    if (v5)
      goto LABEL_47;
    goto LABEL_17;
  }
LABEL_31:
  if ((v2 & 8) != 0)
    return result;
LABEL_32:
  v21 = (unsigned int *)(v3 + 20);
  do
    v22 = __ldxr(v21);
  while (__stxr(v22 + 1, v21));
  if (!v22)
    return dispatch_group_leave_VARIANT_mp(*(_QWORD *)(v3 + 48));
  return result;
}

unsigned int *__dispatch_io_create_VARIANT_mp_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  unint64_t StatusReg;
  off_t v7;
  const char *v8;
  unsigned int *v9;
  unsigned int *v10;
  int v11;
  unsigned int *result;
  unsigned int *v13;
  int v14;

  v4 = *(_DWORD *)(a2 + 24);
  if (!v4)
  {
    v5 = *(_WORD *)(a2 + 36) & 0xF000;
    if (v5 == 0x4000)
    {
      v4 = 21;
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) != 1 || (v4 = 29, v5 != 4096) && v5 != 49152)
    {
      if (*(_QWORD *)(a1 + 48) == 1)
      {
        StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        do
        {
          v7 = lseek(*(_DWORD *)a2, 0, 1);
          if (v7 != -1)
            goto LABEL_12;
          v4 = **(_DWORD **)(StatusReg + 8);
        }
        while (v4 == 4);
        if (!v4)
        {
LABEL_12:
          v4 = 0;
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136) = v7;
          goto LABEL_14;
        }
        _dispatch_bug(389, v4);
      }
      else
      {
        v4 = 0;
      }
    }
  }
LABEL_14:
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 144) = v4;
  dispatch_suspend_VARIANT_mp(*(_QWORD *)(a2 + 64));
  _dispatch_io_init(*(_QWORD **)(a1 + 40), a2, *(_QWORD *)(a1 + 56), v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v9 = *(unsigned int **)(a1 + 40);
  if (v9[2] != 0x7FFFFFFF)
  {
    v10 = v9 + 2;
    do
      v11 = __ldxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (v11 <= 1)
    {
      if (v11 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v9, v8);
    }
  }
  result = *(unsigned int **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v13 = result + 2;
    do
      v14 = __ldxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (v14 <= 1)
    {
      if (v14 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v8);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

unsigned int *__dispatch_io_create_with_path_VARIANT_mp_block_invoke(uint64_t a1)
{
  unint64_t StatusReg;
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unsigned int *v12;
  unsigned int *v13;
  int v14;
  unsigned int *result;
  unsigned int *v16;
  int v17;
  uint64_t v18;
  int v19;
  _BYTE *v20;
  int v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v24[6])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  stat v25;
  uint64_t v26;
  uint64_t v27;
  stat v28;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  memset(&v28, 0, sizeof(v28));
  do
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (const char *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 8) & 0x200100) != 0)
      v5 = lstat(v4, &v28);
    else
      v5 = stat(v4, &v28);
    if (v5 != -1)
      goto LABEL_8;
    v6 = **(_DWORD **)(StatusReg + 8);
  }
  while (v6 == 4);
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if ((*(_BYTE *)(v9 + 9) & 2) != 0)
    {
      v10 = *(_QWORD *)(v9 + 16);
      if (*(_BYTE *)(v9 + v10 + 23) != 47)
      {
        while (1)
        {
          v18 = v10 - 1;
          if (v10 < 1)
            break;
          v19 = *(unsigned __int8 *)(v9 + v10-- + 23);
          if (v19 == 47)
          {
            v20 = (_BYTE *)(v9 + v18 + 24);
            goto LABEL_31;
          }
        }
        v20 = 0;
LABEL_31:
        *v20 = 0;
        do
        {
          if (stat((const char *)(*(_QWORD *)(a1 + 40) + 24), &v28) != -1)
            goto LABEL_35;
          v21 = **(_DWORD **)(StatusReg + 8);
        }
        while (v21 == 4);
        if (!v21)
        {
LABEL_35:
          v28.st_mode = 0x8000;
          *v20 = 47;
          v8 = *(_QWORD *)(a1 + 48);
          goto LABEL_36;
        }
        *v20 = 47;
        *(_DWORD *)(*(_QWORD *)(a1 + 48) + 144) = v6;
        goto LABEL_17;
      }
    }
LABEL_16:
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 144) = v6;
LABEL_17:
    free(*(void **)(a1 + 40));
    _dispatch_io_init(*(_QWORD **)(a1 + 48), 0, *(_QWORD *)(a1 + 56), v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    v12 = *(unsigned int **)(a1 + 48);
    if (v12[2] != 0x7FFFFFFF)
    {
      v13 = v12 + 2;
      do
        v14 = __ldxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (v14 <= 1)
      {
        if (v14 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v12, v11);
      }
    }
    result = *(unsigned int **)(a1 + 56);
    if (result[2] != 0x7FFFFFFF)
    {
      v16 = result + 2;
      do
        v17 = __ldxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (v17 <= 1)
      {
        if (v17 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        return (unsigned int *)_os_object_dispose(result, v11);
      }
    }
    return result;
  }
LABEL_8:
  v7 = v28.st_mode & 0xF000;
  if (v7 == 0x4000)
  {
    v6 = 21;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v8 + 72) == 1)
  {
    v6 = 29;
    if (v7 == 4096 || v7 == 49152)
      goto LABEL_16;
  }
LABEL_36:
  *(_DWORD *)(v8 + 144) = 0;
  dispatch_suspend_VARIANT_mp(*(_QWORD *)(v8 + 48));
  if (_dispatch_io_init_pred != -1)
    dispatch_once_f_VARIANT_mp((unint64_t *)&_dispatch_io_init_pred, 0, _dispatch_io_queues_init);
  v24[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  v24[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  v24[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_path_VARIANT_mp_block_invoke_2;
  v24[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87040;
  v25 = v28;
  v22 = *(_QWORD *)(a1 + 56);
  v26 = *(_QWORD *)(a1 + 48);
  v27 = v22;
  v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
  v24[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v24[5] = v23;
  return (unsigned int *)dispatch_async_VARIANT_mp((unsigned int *)_dispatch_io_devs_lockq, v24);
}

unsigned int *__dispatch_io_create_with_path_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  const char *v3;
  unsigned int *v4;
  unsigned int *v5;
  int v6;
  unsigned int *result;
  unsigned int *v8;
  int v9;

  v2 = _dispatch_fd_entry_create_with_path(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48), *(_WORD *)(a1 + 52));
  _dispatch_io_init(*(_QWORD **)(a1 + 192), (uint64_t)v2, *(_QWORD *)(a1 + 200), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 48));
  v4 = *(unsigned int **)(a1 + 192);
  if (v4[2] != 0x7FFFFFFF)
  {
    v5 = v4 + 2;
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (v6 <= 1)
    {
      if (v6 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v4, v3);
    }
  }
  result = *(unsigned int **)(a1 + 200);
  if (result[2] != 0x7FFFFFFF)
  {
    v8 = result + 2;
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9 <= 1)
    {
      if (v9 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_with_path_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

unsigned int *__dispatch_io_create_with_io_VARIANT_mp_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  unsigned int *v10;
  unsigned int *v11;
  int v12;
  unsigned int *result;
  unsigned int *v14;
  int v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int *v18;
  uint64_t (*aBlock[9])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v2 + 120) & 3) != 0)
  {
    v3 = 89;
  }
  else
  {
    v3 = *(_DWORD *)(v2 + 144);
    if (!v3)
    {
      aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
      aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_io_VARIANT_mp_block_invoke_2;
      aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E870D8;
      v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56);
      v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
      aBlock[6] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48);
      aBlock[7] = v16;
      v18 = *(unsigned int **)(v2 + 56);
      aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
      aBlock[8] = v17;
      aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
      aBlock[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v2;
      return (unsigned int *)dispatch_async_VARIANT_mp(v18, aBlock);
    }
  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  *(_DWORD *)(v4 + 144) = v3;
  _dispatch_io_init((_QWORD *)v4, 0, v5, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v7 = *(unsigned int **)(a1 + 48);
  if (v7[2] != 0x7FFFFFFF)
  {
    v8 = v7 + 2;
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9 <= 1)
    {
      if (v9 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v7, v6);
    }
  }
  v10 = *(unsigned int **)(a1 + 40);
  if (v10[2] != 0x7FFFFFFF)
  {
    v11 = v10 + 2;
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (v12 <= 1)
    {
      if (v12 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v10, v6);
    }
  }
  result = *(unsigned int **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v14 = result + 2;
    do
      v15 = __ldxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (v15 <= 1)
    {
      if (v15 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v6);
    }
  }
  return result;
}

unsigned int *__dispatch_io_create_with_io_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char *v7;
  unsigned int *v8;
  unsigned int *v9;
  int v10;
  unsigned int *v11;
  unsigned int *v12;
  int v13;
  unsigned int *result;
  unsigned int *v15;
  int v16;
  uint64_t v17;
  unint64_t StatusReg;
  off_t v19;
  int v20;
  uint64_t v21;
  int v22;
  const char *v23;
  unsigned int *v24;
  unsigned int *v25;
  int v26;
  unsigned int *v27;
  unsigned int *v28;
  int v29;
  uint64_t v30;
  __int16 v31;
  int v32;
  size_t v33;
  _QWORD *v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int *v36;
  int v37;
  uint64_t (*aBlock[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v39;
  __int16 v40;

  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v2 + 120) & 3) != 0)
  {
    v3 = 89;
    goto LABEL_7;
  }
  v3 = *(_DWORD *)(v2 + 144);
  if (v3)
    goto LABEL_7;
  v4 = *(_QWORD *)(v2 + 112);
  v3 = *(_DWORD *)(v4 + 24);
  if (v3)
    goto LABEL_7;
  v5 = *(_WORD *)(v4 + 36) & 0xF000;
  if (v5 == 0x4000)
  {
    v3 = 21;
LABEL_7:
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v6 + 144) = v3;
    _dispatch_io_init((_QWORD *)v6, 0, *(_QWORD *)(a1 + 64), v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
    v8 = *(unsigned int **)(a1 + 48);
    if (v8[2] != 0x7FFFFFFF)
    {
      v9 = v8 + 2;
      do
        v10 = __ldxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (v10 <= 1)
      {
        if (v10 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v8, v7);
      }
    }
    v11 = *(unsigned int **)(a1 + 40);
    if (v11[2] != 0x7FFFFFFF)
    {
      v12 = v11 + 2;
      do
        v13 = __ldxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (v13 <= 1)
      {
        if (v13 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v11, v7);
      }
    }
    result = *(unsigned int **)(a1 + 64);
    if (result[2] != 0x7FFFFFFF)
    {
      v15 = result + 2;
      do
        v16 = __ldxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (v16 <= 1)
      {
        if (v16 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        return (unsigned int *)_os_object_dispose(result, v7);
      }
    }
    return result;
  }
  v17 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v17 + 72) == 1)
  {
    v3 = 29;
    if (v5 == 4096 || v5 == 49152)
      goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 56) == 1 && *(_DWORD *)(v2 + 124) != -1)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      v19 = lseek(**(_DWORD **)(*(_QWORD *)(a1 + 40) + 112), 0, 1);
      if (v19 != -1)
        goto LABEL_29;
      v3 = **(_DWORD **)(StatusReg + 8);
    }
    while (v3 == 4);
    if (!v3)
    {
LABEL_29:
      v2 = *(_QWORD *)(a1 + 40);
      v17 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(v17 + 136) = v19;
      goto LABEL_30;
    }
    _dispatch_bug(590, v3);
    goto LABEL_7;
  }
LABEL_30:
  *(_DWORD *)(v17 + 144) = 0;
  v20 = *(_DWORD *)(v2 + 124);
  if (v20 == -1)
  {
    *(_QWORD *)(v17 + 124) = -1;
    v30 = *(_QWORD *)(v2 + 112);
    v31 = *(_WORD *)(v30 + 36);
    v32 = *(_DWORD *)(v30 + 32);
    v33 = *(_QWORD *)(*(_QWORD *)(v30 + 8) + 16) + 25;
    v34 = malloc_type_malloc(v33, 0x2C5081E5uLL);
    memcpy(v34, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8), v33);
    *v34 = *(_QWORD *)(a1 + 48);
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_io_VARIANT_mp_block_invoke_3;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E870B0;
    v39 = v32;
    v40 = v31;
    v35 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
    aBlock[6] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48);
    aBlock[7] = v35;
    aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    aBlock[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v34;
    dispatch_async_VARIANT_mp((unsigned int *)_dispatch_io_devs_lockq, aBlock);
  }
  else
  {
    v21 = *(_QWORD *)(v2 + 112);
    v22 = *(_DWORD *)(v2 + 128);
    *(_DWORD *)(v17 + 124) = v20;
    *(_DWORD *)(v17 + 128) = v22;
    dispatch_suspend_VARIANT_mp(*(_QWORD *)(v21 + 64));
    _dispatch_io_init(*(_QWORD **)(a1 + 48), v21, *(_QWORD *)(a1 + 64), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
    v24 = *(unsigned int **)(a1 + 48);
    if (v24[2] != 0x7FFFFFFF)
    {
      v25 = v24 + 2;
      do
        v26 = __ldxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (v26 <= 1)
      {
        if (v26 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v24, v23);
      }
    }
    v27 = *(unsigned int **)(a1 + 64);
    if (v27[2] != 0x7FFFFFFF)
    {
      v28 = v27 + 2;
      do
        v29 = __ldxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (v29 <= 1)
      {
        if (v29 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v27, v23);
      }
    }
  }
  result = *(unsigned int **)(a1 + 40);
  if (result[2] != 0x7FFFFFFF)
  {
    v36 = result + 2;
    do
      v37 = __ldxr(v36);
    while (__stlxr(v37 - 1, v36));
    if (v37 <= 1)
    {
      if (v37 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v23);
    }
  }
  return result;
}

unsigned int *__dispatch_io_create_with_io_VARIANT_mp_block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  const char *v3;
  unsigned int *v4;
  unsigned int *v5;
  int v6;
  unsigned int *result;
  unsigned int *v8;
  int v9;

  v2 = _dispatch_fd_entry_create_with_path(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 64), *(_WORD *)(a1 + 68));
  _dispatch_io_init(*(_QWORD **)(a1 + 48), (uint64_t)v2, *(_QWORD *)(a1 + 56), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_mp(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v4 = *(unsigned int **)(a1 + 48);
  if (v4[2] != 0x7FFFFFFF)
  {
    v5 = v4 + 2;
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (v6 <= 1)
    {
      if (v6 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v4, v3);
    }
  }
  result = *(unsigned int **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v8 = result + 2;
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9 <= 1)
    {
      if (v9 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_with_io_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_io_set_high_water_VARIANT_mp_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  unsigned int *v6;
  int v7;

  result = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 80) > v4)
  {
    *(_QWORD *)(result + 80) = v4;
    v4 = *(_QWORD *)(a1 + 40);
  }
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  *(_QWORD *)(result + 88) = v5;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    v6 = (unsigned int *)(result + 8);
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_set_low_water_VARIANT_mp_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t result;
  unint64_t v4;
  unsigned int *v5;
  int v6;

  result = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 88) < v4)
  {
    *(_QWORD *)(result + 88) = v4;
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(result + 80) = v4;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    v5 = (unsigned int *)(result + 8);
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (v6 <= 1)
    {
      if (v6 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_set_interval_VARIANT_mp_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  int v9;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  if (v5 < 0x7FFFFFFFFFFFFFFFLL)
    v3 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(result + 96) = v3;
  *(_QWORD *)(result + 104) = v7;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    v8 = (unsigned int *)(result + 8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9 <= 1)
    {
      if (v9 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

unsigned int *___dispatch_io_set_target_queue_VARIANT_mp_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  unsigned int *v6;
  int v7;
  unsigned int *result;
  unsigned int *v9;
  int v10;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(unsigned int **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4;
  if (v5[2] != 0x7FFFFFFF)
  {
    v6 = v5 + 2;
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v5, a2);
    }
  }
  result = *(unsigned int **)(a1 + 32);
  if (result[2] != 0x7FFFFFFF)
  {
    v9 = result + 2;
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (v10 <= 1)
    {
      if (v10 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_close_VARIANT_mp_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(unsigned int **)(v1 + 56);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_close_VARIANT_mp_block_invoke_2;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_16;
  aBlock[4] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v1;
  return dispatch_async_VARIANT_mp(v2, aBlock);
}

uint64_t __dispatch_io_close_VARIANT_mp_block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t result;
  unsigned int *v4;
  unsigned int v5;
  uint64_t v6;
  _QWORD *v7;
  unsigned int *v8;
  int v9;

  result = *(_QWORD *)(a1 + 32);
  v4 = (unsigned int *)(result + 120);
  if ((*(_BYTE *)(result + 120) & 3) == 0)
  {
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 | 1, v4));
    result = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(result + 112);
    if (v6)
    {
      v7 = *(_QWORD **)(v6 + 8);
      if (v7)
      {
        *v7 = 0;
        result = *(_QWORD *)(a1 + 32);
      }
      *(_QWORD *)(result + 112) = 0;
      dispatch_resume_VARIANT_mp(*(_QWORD *)(v6 + 64));
      result = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    v8 = (unsigned int *)(result + 8);
    do
      v9 = __ldxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (v9 <= 1)
    {
      if (v9 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_barrier_VARIANT_mp_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 24);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_barrier_VARIANT_mp_block_invoke_2;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87230;
  v6 = *(_OWORD *)(v1 + 56);
  v7 = v3;
  v8 = v1;
  aBlock[4] = v2;
  return dispatch_async_VARIANT_mp((unsigned int *)v6, aBlock);
}

void *__dispatch_io_barrier_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*aBlock[7])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  dispatch_suspend_VARIANT_mp(*(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(unsigned int **)(a1 + 56);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_barrier_VARIANT_mp_block_invoke_3;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87208;
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
  aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  aBlock[5] = v4;
  aBlock[6] = v5;
  return dispatch_group_notify_VARIANT_mp(v2, v3, aBlock);
}

unsigned int *__dispatch_io_barrier_VARIANT_mp_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  unint64_t StatusReg;
  const char *v4;
  unsigned int *result;
  unsigned int *v6;
  int v7;
  _QWORD v8[3];

  v2 = a1[5];
  v8[1] = "io";
  v8[2] = v2;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v8[0] = *(_QWORD *)(StatusReg + 184);
  *(_QWORD *)(StatusReg + 184) = v8;
  (*(void (**)(void))(a1[4] + 16))();
  *(_QWORD *)(StatusReg + 184) = v8[0];
  dispatch_resume_VARIANT_mp(a1[6]);
  result = (unsigned int *)a1[5];
  if (result[2] != 0x7FFFFFFF)
  {
    v6 = result + 2;
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v4);
    }
  }
  return result;
}

uint64_t __dispatch_io_barrier_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

unsigned int *__dispatch_io_read_VARIANT_mp_block_invoke(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v3;
  unsigned int *v4;
  unsigned int *v5;
  unsigned int *v6;
  int v7;
  unsigned int *result;
  unsigned int *v9;
  int v10;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_create(0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &_dispatch_data_empty, *(_QWORD *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  if (v2)
  {
    v4 = *(unsigned int **)(*(_QWORD *)(a1 + 40) + 56);
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_read_VARIANT_mp_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_22;
    aBlock[4] = v2;
    dispatch_async_VARIANT_mp(v4, aBlock);
  }
  v5 = *(unsigned int **)(a1 + 40);
  if (v5[2] != 0x7FFFFFFF)
  {
    v6 = v5 + 2;
    do
      v7 = __ldxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v5, v3);
    }
  }
  result = *(unsigned int **)(a1 + 64);
  if (result[2] != 0x7FFFFFFF)
  {
    v9 = result + 2;
    do
      v10 = __ldxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (v10 <= 1)
    {
      if (v10 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_read_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  return _dispatch_operation_enqueue(*(_QWORD *)(a1 + 32), 0, &_dispatch_data_empty);
}

uint64_t __dispatch_io_read_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

unsigned int *__dispatch_io_write_VARIANT_mp_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t size_VARIANT_mp;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int *v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v9;
  unsigned int *v10;
  unsigned int *v11;
  int v12;
  unsigned int *result;
  unsigned int *v14;
  int v15;
  uint64_t (*v16[6])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  size_VARIANT_mp = dispatch_data_get_size_VARIANT_mp((uint64_t)v4);
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_create(1, v2, v3, size_VARIANT_mp, v4, *(_QWORD *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  if (v6)
  {
    v7 = *(unsigned int **)(*(_QWORD *)(a1 + 40) + 56);
    v16[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v16[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v16[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_write_VARIANT_mp_block_invoke_2;
    v16[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_26;
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56);
    v16[4] = v6;
    v16[5] = v8;
    dispatch_async_VARIANT_mp(v7, v16);
  }
  else
  {
    _dispatch_objc_release(*(id *)(a1 + 56));
  }
  v10 = *(unsigned int **)(a1 + 40);
  if (v10[2] != 0x7FFFFFFF)
  {
    v11 = v10 + 2;
    do
      v12 = __ldxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (v12 <= 1)
    {
      if (v12 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v10, v9);
    }
  }
  result = *(unsigned int **)(a1 + 64);
  if (result[2] != 0x7FFFFFFF)
  {
    v14 = result + 2;
    do
      v15 = __ldxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (v15 <= 1)
    {
      if (v15 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v9);
    }
  }
  return result;
}

void __dispatch_io_write_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  _dispatch_operation_enqueue(*(_QWORD *)(a1 + 32), 1u, *(id *)(a1 + 40));
  _dispatch_objc_release(*(id *)(a1 + 40));
}

uint64_t __dispatch_io_write_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void __dispatch_read_VARIANT_mp_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v6;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  _QWORD *v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  uint64_t (*v18[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v19[3];
  int v20;
  _QWORD v21[4];
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v23;

  v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_mp_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87370;
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v4 = *(unsigned int **)(a1 + 40);
    aBlock[4] = v5;
    v23 = v3;
    dispatch_async_VARIANT_mp(v4, aBlock);
    v7 = *(unsigned int **)(a1 + 40);
    if (v7[2] != 0x7FFFFFFF)
    {
      v8 = v7 + 2;
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 <= 1)
      {
        if (v9 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v7, v6);
      }
    }
  }
  else
  {
    v11 = *(_QWORD **)(a2 + 88);
    if (!v11)
    {
      v11 = _dispatch_io_create(0);
      *((_DWORD *)v11 + 31) = *(_DWORD *)(a1 + 56);
      *((_DWORD *)v11 + 32) = *(_DWORD *)(a1 + 56);
      v11[14] = a2;
      dispatch_retain_VARIANT_mp(*(_QWORD *)(a2 + 72));
      dispatch_retain_VARIANT_mp(*(_QWORD *)(a2 + 80));
      *(_OWORD *)(v11 + 7) = *(_OWORD *)(a2 + 72);
      *(_QWORD *)(a2 + 88) = v11;
    }
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2000000000;
    v21[3] = &_dispatch_data_empty;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2000000000;
    v20 = 0;
    v12 = *(unsigned int **)(a2 + 64);
    v13 = MEMORY[0x1E0C87450];
    v18[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v18[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v18[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_mp_block_invoke_3;
    v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E873C0;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
    v18[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v18[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21;
    v18[6] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v19;
    v18[7] = v14;
    dispatch_async_VARIANT_mp(v12, v18);
    v15 = *(_QWORD *)(a1 + 48);
    v17[0] = v13;
    v17[1] = 0x40000000;
    v17[2] = __dispatch_read_VARIANT_mp_block_invoke_5;
    v17[3] = &unk_1E1E873E8;
    v17[4] = v21;
    v17[5] = v19;
    v16 = _dispatch_operation_create(0, (uint64_t)v11, 0, v15, &_dispatch_data_empty, (uint64_t)&unk_1ECCEA080, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v17);
    if (v16)
      _dispatch_operation_enqueue(v16, 0, &_dispatch_data_empty);
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
  }
}

uint64_t __dispatch_read_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, __objc2_class **, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &_dispatch_data_empty, *(unsigned int *)(a1 + 40));
}

unsigned int *__dispatch_read_VARIANT_mp_block_invoke_3(uint64_t a1)
{
  unsigned int *v2;
  const char *v3;
  unsigned int *result;
  unsigned int *v5;
  int v6;
  uint64_t (*aBlock[4])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v8;
  uint64_t v9;

  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_mp_block_invoke_4;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87398;
  v8 = *(_OWORD *)(a1 + 32);
  v2 = *(unsigned int **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 48);
  dispatch_async_VARIANT_mp(v2, aBlock);
  result = *(unsigned int **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v5 = result + 2;
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (v6 <= 1)
    {
      if (v6 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

void __dispatch_read_VARIANT_mp_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _dispatch_objc_release(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __dispatch_read_VARIANT_mp_block_invoke_5(uint64_t a1, int a2, _QWORD *a3, int a4)
{
  _QWORD *concat_VARIANT_mp;

  if (a3)
  {
    concat_VARIANT_mp = dispatch_data_create_concat_VARIANT_mp(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a3);
    _dispatch_objc_release(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = concat_VARIANT_mp;
  }
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
}

uint64_t __dispatch_read_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void __dispatch_write_VARIANT_mp_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v6;
  unsigned int *v7;
  unsigned int *v8;
  int v9;
  _QWORD *v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v15;
  uint64_t size_VARIANT_mp;
  uint64_t v17;
  _QWORD v18[6];
  uint64_t (*v19[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v20[3];
  int v21;
  _QWORD v22[4];
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v24;

  v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_mp_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87458;
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v4 = *(unsigned int **)(a1 + 40);
    aBlock[4] = v5;
    v24 = v3;
    dispatch_async_VARIANT_mp(v4, aBlock);
    v7 = *(unsigned int **)(a1 + 40);
    if (v7[2] != 0x7FFFFFFF)
    {
      v8 = v7 + 2;
      do
        v9 = __ldxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (v9 <= 1)
      {
        if (v9 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v7, v6);
      }
    }
  }
  else
  {
    v11 = *(_QWORD **)(a2 + 88);
    if (!v11)
    {
      v11 = _dispatch_io_create(0);
      *((_DWORD *)v11 + 31) = *(_DWORD *)(a1 + 56);
      *((_DWORD *)v11 + 32) = *(_DWORD *)(a1 + 56);
      v11[14] = a2;
      dispatch_retain_VARIANT_mp(*(_QWORD *)(a2 + 72));
      dispatch_retain_VARIANT_mp(*(_QWORD *)(a2 + 80));
      *(_OWORD *)(v11 + 7) = *(_OWORD *)(a2 + 72);
      *(_QWORD *)(a2 + 88) = v11;
    }
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2000000000;
    v22[3] = 0;
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v21 = 0;
    v12 = *(unsigned int **)(a2 + 64);
    v13 = MEMORY[0x1E0C87450];
    v19[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v19[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v19[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_mp_block_invoke_3;
    v19[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E874A8;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
    v19[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v19[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v22;
    v19[6] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v20;
    v19[7] = v14;
    dispatch_async_VARIANT_mp(v12, v19);
    v15 = *(void **)(a1 + 48);
    size_VARIANT_mp = dispatch_data_get_size_VARIANT_mp((uint64_t)v15);
    v18[0] = v13;
    v18[1] = 0x40000000;
    v18[2] = __dispatch_write_VARIANT_mp_block_invoke_5;
    v18[3] = &unk_1E1E874D0;
    v18[4] = v22;
    v18[5] = v20;
    v17 = _dispatch_operation_create(1, (uint64_t)v11, 0, size_VARIANT_mp, v15, (uint64_t)&unk_1ECCEA080, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v18);
    if (v17)
      _dispatch_operation_enqueue(v17, 1u, *(id *)(a1 + 48));
    _dispatch_objc_release(*(id *)(a1 + 48));
    _Block_object_dispose(v20, 8);
    _Block_object_dispose(v22, 8);
  }
}

uint64_t __dispatch_write_VARIANT_mp_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

unsigned int *__dispatch_write_VARIANT_mp_block_invoke_3(uint64_t a1)
{
  unsigned int *v2;
  const char *v3;
  unsigned int *result;
  unsigned int *v5;
  int v6;
  uint64_t (*aBlock[4])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v8;
  uint64_t v9;

  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_mp_block_invoke_4;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E87480;
  v8 = *(_OWORD *)(a1 + 32);
  v2 = *(unsigned int **)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 48);
  dispatch_async_VARIANT_mp(v2, aBlock);
  result = *(unsigned int **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v5 = result + 2;
    do
      v6 = __ldxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (v6 <= 1)
    {
      if (v6 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (unsigned int *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

void __dispatch_write_VARIANT_mp_block_invoke_4(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    _dispatch_objc_release(v2);
}

id __dispatch_write_VARIANT_mp_block_invoke_5(id result, int a2, id a3, int a4)
{
  uint64_t v6;

  if (a2)
  {
    v6 = (uint64_t)result;
    if (a3)
    {
      result = _dispatch_objc_retain(a3);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = a3;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = a4;
  }
  return result;
}

uint64_t __dispatch_write_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_data_create_f_VARIANT_mp_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_data_make_memory_entry_VARIANT_mp_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

void _dispatch_block_invoke_direct_VARIANT_armv81(uint64_t a1)
{
  uint64_t v1;
  int v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *StatusReg;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_DWORD *)(a1 + 16);
  if ((v2 & 4) != 0)
    _dispatch_block_invoke_direct_VARIANT_mp_cold_3(*(_DWORD *)(a1 + 16));
  if ((v2 & 1) == 0)
  {
    v4 = 0;
    if ((v1 & 0x40000000) != 0)
    {
      v5 = 0;
      if ((v1 & 0x30) != 0x10)
      {
        v6 = *(_QWORD *)(a1 + 24);
        v7 = *(_QWORD *)(_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3)) + 32) & 0xFFFFFFLL;
        v8 = v7 != 0;
        v9 = v7 < (v6 & 0xFFFFFFuLL);
        v10 = v6 & 0xFFFFFFFF02FFFFFFLL;
        if (v8 && v9)
          v4 = v7;
        else
          v4 = 0;
        if (v8 && v9)
          v5 = v10;
        else
          v5 = 0;
      }
      if ((v1 & 0x80000000) == 0)
        goto LABEL_12;
    }
    else
    {
      v5 = 0;
      if ((v1 & 0x80000000) == 0)
      {
LABEL_12:
        v11 = -1;
        goto LABEL_15;
      }
    }
    v11 = *(_QWORD *)(a1 + 32);
LABEL_15:
    StatusReg = (_QWORD *)_ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    v13 = StatusReg[4];
    if ((v13 & 0x1000000) != 0)
    {
      if (v5)
        goto LABEL_41;
      v5 = v13 & 0xFFFFFFFFFEFFFFFFLL;
    }
    else if (v5 == (v13 & 0xFFFFFFFF77FFFFFFLL))
    {
LABEL_17:
      if (v11 == -1)
        goto LABEL_21;
      if (StatusReg[28] == v11)
      {
        if (v11 && (int)atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 12), 1u, memory_order_relaxed) <= 0)
          dispatch_group_notify_VARIANT_mp_cold_3();
LABEL_21:
        *(_DWORD *)(a1 + 64) = StatusReg[3];
        _dispatch_client_callout(*(_QWORD *)(a1 + 40), *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16));
        v14 = StatusReg[4];
        if ((v14 & 0x1000000) != 0)
        {
          if (v4)
            goto LABEL_43;
          v4 = v14 & 0xFFFFFFFFFEFFFFFFLL;
        }
        else if (v4 == (v14 & 0xFFFFFFFF77FFFFFFLL))
        {
LABEL_23:
          if (v11 == -1)
            goto LABEL_27;
          if (StatusReg[28] == v11)
          {
            if (v11
              && (int)atomic_fetch_add_explicit((atomic_uint *volatile)(v11 + 12), 0xFFFFFFFF, memory_order_relaxed) <= 1)
            {
              _dispatch_async_redirect_invoke_cold_1();
            }
            goto LABEL_27;
          }
          v4 = 0;
LABEL_43:
          _dispatch_set_priority_and_voucher_slow_VARIANT_armv81(v4, v11, 6);
          if ((v2 & 8) != 0)
            return;
          goto LABEL_28;
        }
        if (v4)
          goto LABEL_43;
        goto LABEL_23;
      }
      v5 = 0;
LABEL_41:
      _dispatch_set_priority_and_voucher_slow_VARIANT_armv81(v5, v11, 0);
      v11 = v15;
      goto LABEL_21;
    }
    if (v5)
      goto LABEL_41;
    goto LABEL_17;
  }
LABEL_27:
  if ((v2 & 8) != 0)
    return;
LABEL_28:
  if (!atomic_fetch_add_explicit((atomic_uint *volatile)(a1 + 20), 1u, memory_order_relaxed))
    dispatch_group_leave_VARIANT_armv81(*(_QWORD *)(a1 + 48));
}

atomic_uint *__dispatch_io_create_VARIANT_armv81_block_invoke(uint64_t a1, uint64_t a2)
{
  int v4;
  int v5;
  unint64_t StatusReg;
  off_t v7;
  const char *v8;
  atomic_uint *v9;
  int add_explicit;
  atomic_uint *result;
  int v12;

  v4 = *(_DWORD *)(a2 + 24);
  if (!v4)
  {
    v5 = *(_WORD *)(a2 + 36) & 0xF000;
    if (v5 == 0x4000)
    {
      v4 = 21;
    }
    else if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) != 1 || (v4 = 29, v5 != 4096) && v5 != 49152)
    {
      if (*(_QWORD *)(a1 + 48) == 1)
      {
        StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
        do
        {
          v7 = lseek(*(_DWORD *)a2, 0, 1);
          if (v7 != -1)
            goto LABEL_12;
          v4 = **(_DWORD **)(StatusReg + 8);
        }
        while (v4 == 4);
        if (!v4)
        {
LABEL_12:
          v4 = 0;
          *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136) = v7;
          goto LABEL_14;
        }
        _dispatch_bug(389, v4);
      }
      else
      {
        v4 = 0;
      }
    }
  }
LABEL_14:
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 144) = v4;
  dispatch_suspend_VARIANT_armv81(*(_QWORD *)(a2 + 64));
  _dispatch_io_init_0(*(_QWORD **)(a1 + 40), a2, *(_QWORD *)(a1 + 56), v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  v9 = *(atomic_uint **)(a1 + 40);
  if (v9[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v9 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v9, v8);
    }
  }
  result = *(atomic_uint **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v12 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v12 <= 1)
    {
      if (v12 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v8);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

atomic_uint *__dispatch_io_create_with_path_VARIANT_armv81_block_invoke(uint64_t a1)
{
  unint64_t StatusReg;
  uint64_t v3;
  const char *v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  atomic_uint *v12;
  int add_explicit;
  atomic_uint *result;
  int v15;
  uint64_t v16;
  int v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v22[6])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  stat v23;
  uint64_t v24;
  uint64_t v25;
  stat v26;

  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  memset(&v26, 0, sizeof(v26));
  do
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = (const char *)(v3 + 24);
    if ((*(_DWORD *)(v3 + 8) & 0x200100) != 0)
      v5 = lstat(v4, &v26);
    else
      v5 = stat(v4, &v26);
    if (v5 != -1)
      goto LABEL_8;
    v6 = **(_DWORD **)(StatusReg + 8);
  }
  while (v6 == 4);
  if (v6)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if ((*(_BYTE *)(v9 + 9) & 2) != 0)
    {
      v10 = *(_QWORD *)(v9 + 16);
      if (*(_BYTE *)(v9 + v10 + 23) != 47)
      {
        while (1)
        {
          v16 = v10 - 1;
          if (v10 < 1)
            break;
          v17 = *(unsigned __int8 *)(v9 + v10-- + 23);
          if (v17 == 47)
          {
            v18 = (_BYTE *)(v9 + v16 + 24);
            goto LABEL_28;
          }
        }
        v18 = 0;
LABEL_28:
        *v18 = 0;
        do
        {
          if (stat((const char *)(*(_QWORD *)(a1 + 40) + 24), &v26) != -1)
            goto LABEL_32;
          v19 = **(_DWORD **)(StatusReg + 8);
        }
        while (v19 == 4);
        if (!v19)
        {
LABEL_32:
          v26.st_mode = 0x8000;
          *v18 = 47;
          v8 = *(_QWORD *)(a1 + 48);
          goto LABEL_33;
        }
        *v18 = 47;
        *(_DWORD *)(*(_QWORD *)(a1 + 48) + 144) = v6;
        goto LABEL_17;
      }
    }
LABEL_16:
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 144) = v6;
LABEL_17:
    free(*(void **)(a1 + 40));
    _dispatch_io_init_0(*(_QWORD **)(a1 + 48), 0, *(_QWORD *)(a1 + 56), v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    v12 = *(atomic_uint **)(a1 + 48);
    if (v12[2] != 0x7FFFFFFF)
    {
      add_explicit = atomic_fetch_add_explicit(v12 + 2, 0xFFFFFFFF, memory_order_release);
      if (add_explicit <= 1)
      {
        if (add_explicit != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v12, v11);
      }
    }
    result = *(atomic_uint **)(a1 + 56);
    if (result[2] != 0x7FFFFFFF)
    {
      v15 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
      if (v15 <= 1)
      {
        if (v15 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        return (atomic_uint *)_os_object_dispose(result, v11);
      }
    }
    return result;
  }
LABEL_8:
  v7 = v26.st_mode & 0xF000;
  if (v7 == 0x4000)
  {
    v6 = 21;
    goto LABEL_16;
  }
  v8 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v8 + 72) == 1)
  {
    v6 = 29;
    if (v7 == 4096 || v7 == 49152)
      goto LABEL_16;
  }
LABEL_33:
  *(_DWORD *)(v8 + 144) = 0;
  dispatch_suspend_VARIANT_armv81(*(_QWORD *)(v8 + 48));
  if (_dispatch_io_init_pred != -1)
    dispatch_once_f_VARIANT_armv81(&_dispatch_io_init_pred, 0, _dispatch_io_queues_init_0);
  v22[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  v22[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  v22[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_path_VARIANT_armv81_block_invoke_2;
  v22[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E883B8;
  v23 = v26;
  v20 = *(_QWORD *)(a1 + 56);
  v24 = *(_QWORD *)(a1 + 48);
  v25 = v20;
  v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
  v22[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v22[5] = v21;
  return (atomic_uint *)dispatch_async_VARIANT_armv81((atomic_uint *)_dispatch_io_devs_lockq, v22);
}

atomic_uint *__dispatch_io_create_with_path_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  const char *v3;
  atomic_uint *v4;
  int add_explicit;
  atomic_uint *result;
  int v7;

  v2 = _dispatch_fd_entry_create_with_path_0(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 48), *(_WORD *)(a1 + 52));
  _dispatch_io_init_0(*(_QWORD **)(a1 + 192), (uint64_t)v2, *(_QWORD *)(a1 + 200), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 192) + 48));
  v4 = *(atomic_uint **)(a1 + 192);
  if (v4[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v4, v3);
    }
  }
  result = *(atomic_uint **)(a1 + 200);
  if (result[2] != 0x7FFFFFFF)
  {
    v7 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_with_path_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

atomic_uint *__dispatch_io_create_with_io_VARIANT_armv81_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  const char *v6;
  atomic_uint *v7;
  int add_explicit;
  atomic_uint *v9;
  int v10;
  atomic_uint *result;
  int v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  atomic_uint *v15;
  uint64_t (*aBlock[9])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v2 + 120) & 3) != 0)
  {
    v3 = 89;
  }
  else
  {
    v3 = *(_DWORD *)(v2 + 144);
    if (!v3)
    {
      aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
      aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_io_VARIANT_armv81_block_invoke_2;
      aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88450;
      v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56);
      v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
      aBlock[6] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48);
      aBlock[7] = v13;
      v15 = *(atomic_uint **)(v2 + 56);
      aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
      aBlock[8] = v14;
      aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
      aBlock[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v2;
      return (atomic_uint *)dispatch_async_VARIANT_armv81(v15, aBlock);
    }
  }
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  *(_DWORD *)(v4 + 144) = v3;
  _dispatch_io_init_0((_QWORD *)v4, 0, v5, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v7 = *(atomic_uint **)(a1 + 48);
  if (v7[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v7 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v7, v6);
    }
  }
  v9 = *(atomic_uint **)(a1 + 40);
  if (v9[2] != 0x7FFFFFFF)
  {
    v10 = atomic_fetch_add_explicit(v9 + 2, 0xFFFFFFFF, memory_order_release);
    if (v10 <= 1)
    {
      if (v10 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v9, v6);
    }
  }
  result = *(atomic_uint **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v12 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v12 <= 1)
    {
      if (v12 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v6);
    }
  }
  return result;
}

atomic_uint *__dispatch_io_create_with_io_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  const char *v7;
  atomic_uint *v8;
  int add_explicit;
  atomic_uint *v10;
  int v11;
  atomic_uint *result;
  int v13;
  uint64_t v14;
  unint64_t StatusReg;
  off_t v16;
  int v17;
  uint64_t v18;
  int v19;
  const char *v20;
  atomic_uint *v21;
  int v22;
  atomic_uint *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  int v27;
  size_t v28;
  _QWORD *v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v31;
  uint64_t (*aBlock[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v33;
  __int16 v34;

  v2 = *(_QWORD *)(a1 + 40);
  if ((*(_BYTE *)(v2 + 120) & 3) != 0)
  {
    v3 = 89;
    goto LABEL_7;
  }
  v3 = *(_DWORD *)(v2 + 144);
  if (v3)
    goto LABEL_7;
  v4 = *(_QWORD *)(v2 + 112);
  v3 = *(_DWORD *)(v4 + 24);
  if (v3)
    goto LABEL_7;
  v5 = *(_WORD *)(v4 + 36) & 0xF000;
  if (v5 == 0x4000)
  {
    v3 = 21;
LABEL_7:
    v6 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v6 + 144) = v3;
    _dispatch_io_init_0((_QWORD *)v6, 0, *(_QWORD *)(a1 + 64), v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
    v8 = *(atomic_uint **)(a1 + 48);
    if (v8[2] != 0x7FFFFFFF)
    {
      add_explicit = atomic_fetch_add_explicit(v8 + 2, 0xFFFFFFFF, memory_order_release);
      if (add_explicit <= 1)
      {
        if (add_explicit != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v8, v7);
      }
    }
    v10 = *(atomic_uint **)(a1 + 40);
    if (v10[2] != 0x7FFFFFFF)
    {
      v11 = atomic_fetch_add_explicit(v10 + 2, 0xFFFFFFFF, memory_order_release);
      if (v11 <= 1)
      {
        if (v11 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v10, v7);
      }
    }
    result = *(atomic_uint **)(a1 + 64);
    if (result[2] != 0x7FFFFFFF)
    {
      v13 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
      if (v13 <= 1)
      {
        if (v13 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        return (atomic_uint *)_os_object_dispose(result, v7);
      }
    }
    return result;
  }
  v14 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v14 + 72) == 1)
  {
    v3 = 29;
    if (v5 == 4096 || v5 == 49152)
      goto LABEL_7;
  }
  if (*(_QWORD *)(a1 + 56) == 1 && *(_DWORD *)(v2 + 124) != -1)
  {
    StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
    do
    {
      v16 = lseek(**(_DWORD **)(*(_QWORD *)(a1 + 40) + 112), 0, 1);
      if (v16 != -1)
        goto LABEL_23;
      v3 = **(_DWORD **)(StatusReg + 8);
    }
    while (v3 == 4);
    if (!v3)
    {
LABEL_23:
      v2 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(v14 + 136) = v16;
      goto LABEL_24;
    }
    _dispatch_bug(590, v3);
    goto LABEL_7;
  }
LABEL_24:
  *(_DWORD *)(v14 + 144) = 0;
  v17 = *(_DWORD *)(v2 + 124);
  if (v17 == -1)
  {
    *(_QWORD *)(v14 + 124) = -1;
    v25 = *(_QWORD *)(v2 + 112);
    v26 = *(_WORD *)(v25 + 36);
    v27 = *(_DWORD *)(v25 + 32);
    v28 = *(_QWORD *)(*(_QWORD *)(v25 + 8) + 16) + 25;
    v29 = malloc_type_malloc(v28, 0x2C5081E5uLL);
    memcpy(v29, *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 112) + 8), v28);
    *v29 = *(_QWORD *)(a1 + 48);
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_create_with_io_VARIANT_armv81_block_invoke_3;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88428;
    v33 = v27;
    v34 = v26;
    v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
    aBlock[6] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48);
    aBlock[7] = v30;
    aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    aBlock[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v29;
    dispatch_async_VARIANT_armv81((atomic_uint *)_dispatch_io_devs_lockq, aBlock);
  }
  else
  {
    v18 = *(_QWORD *)(v2 + 112);
    v19 = *(_DWORD *)(v2 + 128);
    *(_DWORD *)(v14 + 124) = v17;
    *(_DWORD *)(v14 + 128) = v19;
    dispatch_suspend_VARIANT_armv81(*(_QWORD *)(v18 + 64));
    _dispatch_io_init_0(*(_QWORD **)(a1 + 48), v18, *(_QWORD *)(a1 + 64), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
    dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
    v21 = *(atomic_uint **)(a1 + 48);
    if (v21[2] != 0x7FFFFFFF)
    {
      v22 = atomic_fetch_add_explicit(v21 + 2, 0xFFFFFFFF, memory_order_release);
      if (v22 <= 1)
      {
        if (v22 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v21, v20);
      }
    }
    v23 = *(atomic_uint **)(a1 + 64);
    if (v23[2] != 0x7FFFFFFF)
    {
      v24 = atomic_fetch_add_explicit(v23 + 2, 0xFFFFFFFF, memory_order_release);
      if (v24 <= 1)
      {
        if (v24 != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v23, v20);
      }
    }
  }
  result = *(atomic_uint **)(a1 + 40);
  if (result[2] != 0x7FFFFFFF)
  {
    v31 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v31 <= 1)
    {
      if (v31 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v20);
    }
  }
  return result;
}

atomic_uint *__dispatch_io_create_with_io_VARIANT_armv81_block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  const char *v3;
  atomic_uint *v4;
  int add_explicit;
  atomic_uint *result;
  int v7;

  v2 = _dispatch_fd_entry_create_with_path_0(*(_QWORD *)(a1 + 40), *(_DWORD *)(a1 + 64), *(_WORD *)(a1 + 68));
  _dispatch_io_init_0(*(_QWORD **)(a1 + 48), (uint64_t)v2, *(_QWORD *)(a1 + 56), 0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  dispatch_resume_VARIANT_armv81(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48));
  v4 = *(atomic_uint **)(a1 + 48);
  if (v4[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v4 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v4, v3);
    }
  }
  result = *(atomic_uint **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    v7 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v7 <= 1)
    {
      if (v7 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_create_with_io_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_io_set_high_water_VARIANT_armv81_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t result;
  unint64_t v4;
  uint64_t v5;
  int add_explicit;

  result = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 80) > v4)
  {
    *(_QWORD *)(result + 80) = v4;
    v4 = *(_QWORD *)(a1 + 40);
  }
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  *(_QWORD *)(result + 88) = v5;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(result + 8), 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_set_low_water_VARIANT_armv81_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t result;
  unint64_t v4;
  int add_explicit;

  result = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(result + 88) < v4)
  {
    *(_QWORD *)(result + 88) = v4;
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(result + 80) = v4;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(result + 8), 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_set_interval_VARIANT_armv81_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int add_explicit;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = a1 + 32;
  result = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v6 + 8);
  if (v5 < 0x7FFFFFFFFFFFFFFFLL)
    v3 = v5;
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(result + 96) = v3;
  *(_QWORD *)(result + 104) = v7;
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(result + 8), 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

atomic_uint *___dispatch_io_set_target_queue_VARIANT_armv81_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v3;
  uint64_t v4;
  atomic_uint *v5;
  int add_explicit;
  atomic_uint *result;
  int v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(atomic_uint **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4;
  if (v5[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v5 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v5, a2);
    }
  }
  result = *(atomic_uint **)(a1 + 32);
  if (result[2] != 0x7FFFFFFF)
  {
    v8 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v8 <= 1)
    {
      if (v8 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_close_VARIANT_armv81_block_invoke(uint64_t a1)
{
  uint64_t v1;
  atomic_uint *v2;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(atomic_uint **)(v1 + 56);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_close_VARIANT_armv81_block_invoke_2;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_16_0;
  aBlock[4] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v1;
  return dispatch_async_VARIANT_armv81(v2, aBlock);
}

uint64_t __dispatch_io_close_VARIANT_armv81_block_invoke_2(uint64_t a1, const char *a2)
{
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  int add_explicit;

  result = *(_QWORD *)(a1 + 32);
  if ((*(_BYTE *)(result + 120) & 3) == 0)
  {
    atomic_fetch_or_explicit((atomic_uint *volatile)(result + 120), 1u, memory_order_relaxed);
    result = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(result + 112);
    if (v4)
    {
      v5 = *(_QWORD **)(v4 + 8);
      if (v5)
      {
        *v5 = 0;
        result = *(_QWORD *)(a1 + 32);
      }
      *(_QWORD *)(result + 112) = 0;
      dispatch_resume_VARIANT_armv81(*(_QWORD *)(v4 + 64));
      result = *(_QWORD *)(a1 + 32);
    }
  }
  if (*(_DWORD *)(result + 8) != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit((atomic_uint *volatile)(result + 8), 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return _os_object_dispose((void *)result, a2);
    }
  }
  return result;
}

uint64_t __dispatch_io_barrier_VARIANT_armv81_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v1 + 24);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_barrier_VARIANT_armv81_block_invoke_2;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E885A8;
  v6 = *(_OWORD *)(v1 + 56);
  v7 = v3;
  v8 = v1;
  aBlock[4] = v2;
  return dispatch_async_VARIANT_armv81((atomic_uint *)v6, aBlock);
}

void *__dispatch_io_barrier_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  atomic_uint *v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t (*aBlock[7])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  dispatch_suspend_VARIANT_armv81(*(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(atomic_uint **)(a1 + 56);
  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_barrier_VARIANT_armv81_block_invoke_3;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88580;
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 64);
  v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
  aBlock[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
  aBlock[5] = v4;
  aBlock[6] = v5;
  return dispatch_group_notify_VARIANT_armv81(v2, v3, aBlock);
}

atomic_uint *__dispatch_io_barrier_VARIANT_armv81_block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  unint64_t StatusReg;
  const char *v4;
  atomic_uint *result;
  int add_explicit;
  _QWORD v7[3];

  v2 = a1[5];
  v7[1] = "io";
  v7[2] = v2;
  StatusReg = _ReadStatusReg(ARM64_SYSREG(3, 3, 13, 0, 3));
  v7[0] = *(_QWORD *)(StatusReg + 184);
  *(_QWORD *)(StatusReg + 184) = v7;
  (*(void (**)(void))(a1[4] + 16))();
  *(_QWORD *)(StatusReg + 184) = v7[0];
  dispatch_resume_VARIANT_armv81(a1[6]);
  result = (atomic_uint *)a1[5];
  if (result[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v4);
    }
  }
  return result;
}

uint64_t __dispatch_io_barrier_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

atomic_uint *__dispatch_io_read_VARIANT_armv81_block_invoke(uint64_t a1)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v3;
  atomic_uint *v4;
  atomic_uint *v5;
  int add_explicit;
  atomic_uint *result;
  int v8;
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_create_0(0, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), &_dispatch_data_empty, *(_QWORD *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  if (v2)
  {
    v4 = *(atomic_uint **)(*(_QWORD *)(a1 + 40) + 56);
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_read_VARIANT_armv81_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_22_0;
    aBlock[4] = v2;
    dispatch_async_VARIANT_armv81(v4, aBlock);
  }
  v5 = *(atomic_uint **)(a1 + 40);
  if (v5[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v5 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v5, v3);
    }
  }
  result = *(atomic_uint **)(a1 + 64);
  if (result[2] != 0x7FFFFFFF)
  {
    v8 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v8 <= 1)
    {
      if (v8 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

uint64_t __dispatch_io_read_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  return _dispatch_operation_enqueue_0(*(_QWORD *)(a1 + 32), 0, &_dispatch_data_empty);
}

uint64_t __dispatch_io_read_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

atomic_uint *__dispatch_io_write_VARIANT_armv81_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t size_VARIANT_armv81;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  atomic_uint *v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v9;
  atomic_uint *v10;
  int add_explicit;
  atomic_uint *result;
  int v13;
  uint64_t (*v14[6])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  size_VARIANT_armv81 = dispatch_data_get_size_VARIANT_armv81((uint64_t)v4);
  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_dispatch_operation_create_0(1, v2, v3, size_VARIANT_armv81, v4, *(_QWORD *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32));
  if (v6)
  {
    v7 = *(atomic_uint **)(*(_QWORD *)(a1 + 40) + 56);
    v14[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v14[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v14[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_io_write_VARIANT_armv81_block_invoke_2;
    v14[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&__block_descriptor_tmp_26_0;
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 56);
    v14[4] = v6;
    v14[5] = v8;
    dispatch_async_VARIANT_armv81(v7, v14);
  }
  else
  {
    _dispatch_objc_release(*(id *)(a1 + 56));
  }
  v10 = *(atomic_uint **)(a1 + 40);
  if (v10[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(v10 + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      _os_object_dispose(v10, v9);
    }
  }
  result = *(atomic_uint **)(a1 + 64);
  if (result[2] != 0x7FFFFFFF)
  {
    v13 = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (v13 <= 1)
    {
      if (v13 != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v9);
    }
  }
  return result;
}

void __dispatch_io_write_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  _dispatch_operation_enqueue_0(*(_QWORD *)(a1 + 32), 1u, *(id *)(a1 + 40));
  _dispatch_objc_release(*(id *)(a1 + 40));
}

uint64_t __dispatch_io_write_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void __dispatch_read_VARIANT_armv81_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  atomic_uint *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v6;
  atomic_uint *v7;
  int add_explicit;
  _QWORD *v10;
  atomic_uint *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[6];
  uint64_t (*v17[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v18[3];
  int v19;
  _QWORD v20[4];
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v22;

  v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_armv81_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E886E8;
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v4 = *(atomic_uint **)(a1 + 40);
    aBlock[4] = v5;
    v22 = v3;
    dispatch_async_VARIANT_armv81(v4, aBlock);
    v7 = *(atomic_uint **)(a1 + 40);
    if (v7[2] != 0x7FFFFFFF)
    {
      add_explicit = atomic_fetch_add_explicit(v7 + 2, 0xFFFFFFFF, memory_order_release);
      if (add_explicit <= 1)
      {
        if (add_explicit != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v7, v6);
      }
    }
  }
  else
  {
    v10 = *(_QWORD **)(a2 + 88);
    if (!v10)
    {
      v10 = _dispatch_io_create_0(0);
      *((_DWORD *)v10 + 31) = *(_DWORD *)(a1 + 56);
      *((_DWORD *)v10 + 32) = *(_DWORD *)(a1 + 56);
      v10[14] = a2;
      dispatch_retain_VARIANT_armv81(*(_QWORD *)(a2 + 72));
      dispatch_retain_VARIANT_armv81(*(_QWORD *)(a2 + 80));
      *(_OWORD *)(v10 + 7) = *(_OWORD *)(a2 + 72);
      *(_QWORD *)(a2 + 88) = v10;
    }
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2000000000;
    v20[3] = &_dispatch_data_empty;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2000000000;
    v19 = 0;
    v11 = *(atomic_uint **)(a2 + 64);
    v12 = MEMORY[0x1E0C87450];
    v17[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v17[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v17[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_armv81_block_invoke_3;
    v17[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88738;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
    v17[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v17[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v20;
    v17[6] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v18;
    v17[7] = v13;
    dispatch_async_VARIANT_armv81(v11, v17);
    v14 = *(_QWORD *)(a1 + 48);
    v16[0] = v12;
    v16[1] = 0x40000000;
    v16[2] = __dispatch_read_VARIANT_armv81_block_invoke_5;
    v16[3] = &unk_1E1E88760;
    v16[4] = v20;
    v16[5] = v18;
    v15 = _dispatch_operation_create_0(0, (uint64_t)v10, 0, v14, &_dispatch_data_empty, (uint64_t)&unk_1ECCEA080, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v16);
    if (v15)
      _dispatch_operation_enqueue_0(v15, 0, &_dispatch_data_empty);
    _Block_object_dispose(v18, 8);
    _Block_object_dispose(v20, 8);
  }
}

uint64_t __dispatch_read_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, __objc2_class **, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), &_dispatch_data_empty, *(unsigned int *)(a1 + 40));
}

atomic_uint *__dispatch_read_VARIANT_armv81_block_invoke_3(uint64_t a1)
{
  atomic_uint *v2;
  const char *v3;
  atomic_uint *result;
  int add_explicit;
  uint64_t (*aBlock[4])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v7;
  uint64_t v8;

  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_read_VARIANT_armv81_block_invoke_4;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88710;
  v7 = *(_OWORD *)(a1 + 32);
  v2 = *(atomic_uint **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  dispatch_async_VARIANT_armv81(v2, aBlock);
  result = *(atomic_uint **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

void __dispatch_read_VARIANT_armv81_block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _dispatch_objc_release(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __dispatch_read_VARIANT_armv81_block_invoke_5(uint64_t a1, int a2, _QWORD *a3, int a4)
{
  _QWORD *concat_VARIANT_armv81;

  if (a3)
  {
    concat_VARIANT_armv81 = dispatch_data_create_concat_VARIANT_armv81(*(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), a3);
    _dispatch_objc_release(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = concat_VARIANT_armv81;
  }
  if (a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a4;
}

uint64_t __dispatch_read_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

void __dispatch_write_VARIANT_armv81_block_invoke(uint64_t a1, uint64_t a2)
{
  int v3;
  atomic_uint *v4;
  uint64_t (*v5)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  const char *v6;
  atomic_uint *v7;
  int add_explicit;
  _QWORD *v10;
  atomic_uint *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v14;
  uint64_t size_VARIANT_armv81;
  uint64_t v16;
  _QWORD v17[6];
  uint64_t (*v18[8])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD v19[3];
  int v20;
  _QWORD v21[4];
  uint64_t (*aBlock[5])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v23;

  v3 = *(_DWORD *)(a2 + 24);
  if (v3)
  {
    aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_armv81_block_invoke_2;
    aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E887D0;
    v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v4 = *(atomic_uint **)(a1 + 40);
    aBlock[4] = v5;
    v23 = v3;
    dispatch_async_VARIANT_armv81(v4, aBlock);
    v7 = *(atomic_uint **)(a1 + 40);
    if (v7[2] != 0x7FFFFFFF)
    {
      add_explicit = atomic_fetch_add_explicit(v7 + 2, 0xFFFFFFFF, memory_order_release);
      if (add_explicit <= 1)
      {
        if (add_explicit != 1)
          _os_object_allows_weak_reference_VARIANT_mp_cold_1();
        _os_object_dispose(v7, v6);
      }
    }
  }
  else
  {
    v10 = *(_QWORD **)(a2 + 88);
    if (!v10)
    {
      v10 = _dispatch_io_create_0(0);
      *((_DWORD *)v10 + 31) = *(_DWORD *)(a1 + 56);
      *((_DWORD *)v10 + 32) = *(_DWORD *)(a1 + 56);
      v10[14] = a2;
      dispatch_retain_VARIANT_armv81(*(_QWORD *)(a2 + 72));
      dispatch_retain_VARIANT_armv81(*(_QWORD *)(a2 + 80));
      *(_OWORD *)(v10 + 7) = *(_OWORD *)(a2 + 72);
      *(_QWORD *)(a2 + 88) = v10;
    }
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x2000000000;
    v21[3] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2000000000;
    v20 = 0;
    v11 = *(atomic_uint **)(a2 + 64);
    v12 = MEMORY[0x1E0C87450];
    v18[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
    v18[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
    v18[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_armv81_block_invoke_3;
    v18[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E88820;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40);
    v18[4] = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32);
    v18[5] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v21;
    v18[6] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v19;
    v18[7] = v13;
    dispatch_async_VARIANT_armv81(v11, v18);
    v14 = *(void **)(a1 + 48);
    size_VARIANT_armv81 = dispatch_data_get_size_VARIANT_armv81((uint64_t)v14);
    v17[0] = v12;
    v17[1] = 0x40000000;
    v17[2] = __dispatch_write_VARIANT_armv81_block_invoke_5;
    v17[3] = &unk_1E1E88848;
    v17[4] = v21;
    v17[5] = v19;
    v16 = _dispatch_operation_create_0(1, (uint64_t)v10, 0, size_VARIANT_armv81, v14, (uint64_t)&unk_1ECCEA080, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v17);
    if (v16)
      _dispatch_operation_enqueue_0(v16, 1u, *(id *)(a1 + 48));
    _dispatch_objc_release(*(id *)(a1 + 48));
    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v21, 8);
  }
}

uint64_t __dispatch_write_VARIANT_armv81_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, *(unsigned int *)(a1 + 40));
}

atomic_uint *__dispatch_write_VARIANT_armv81_block_invoke_3(uint64_t a1)
{
  atomic_uint *v2;
  const char *v3;
  atomic_uint *result;
  int add_explicit;
  uint64_t (*aBlock[4])(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v7;
  uint64_t v8;

  aBlock[0] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x1E0C87450];
  aBlock[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))0x40000000;
  aBlock[2] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))__dispatch_write_VARIANT_armv81_block_invoke_4;
  aBlock[3] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))&unk_1E1E887F8;
  v7 = *(_OWORD *)(a1 + 32);
  v2 = *(atomic_uint **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 48);
  dispatch_async_VARIANT_armv81(v2, aBlock);
  result = *(atomic_uint **)(a1 + 56);
  if (result[2] != 0x7FFFFFFF)
  {
    add_explicit = atomic_fetch_add_explicit(result + 2, 0xFFFFFFFF, memory_order_release);
    if (add_explicit <= 1)
    {
      if (add_explicit != 1)
        _os_object_allows_weak_reference_VARIANT_mp_cold_1();
      return (atomic_uint *)_os_object_dispose(result, v3);
    }
  }
  return result;
}

void __dispatch_write_VARIANT_armv81_block_invoke_4(uint64_t a1)
{
  void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    _dispatch_objc_release(v2);
}

id __dispatch_write_VARIANT_armv81_block_invoke_5(id result, int a2, id a3, int a4)
{
  uint64_t v6;

  if (a2)
  {
    v6 = (uint64_t)result;
    if (a3)
    {
      result = _dispatch_objc_retain(a3);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 32) + 8) + 24) = a3;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v6 + 40) + 8) + 24) = a4;
  }
  return result;
}

uint64_t __dispatch_write_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_data_create_f_VARIANT_armv81_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40));
}

uint64_t __dispatch_data_make_memory_entry_VARIANT_armv81_block_invoke(uint64_t a1, int a2, uint64_t a3, void *__src, size_t __n)
{
  memcpy((void *)(*(_QWORD *)(a1 + 32) + a3), __src, __n);
  return 1;
}

void _dispatch_block_invoke_direct_VARIANT_mp_cold_3(unsigned int a1)
{
  qword_1EDF52D08 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: A block object may not be both run more than once and waited for";
  qword_1EDF52D38 = a1;
  __break(1u);
}

@end
