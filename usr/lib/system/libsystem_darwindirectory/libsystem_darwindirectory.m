void __getStore_block_invoke()
{
  _DWORD *v0;
  uint64_t v1;
  _OWORD v2[5];
  uint64_t v3;

  v3 = *MEMORY[0x24BDB0D28];
  v0 = malloc_type_calloc(1uLL, 4uLL, 0x61D5536CuLL);
  if (!v0)
    __getStore_block_invoke_cold_1(&v1, v2);
  qword_2540D7AE8 = (uint64_t)v0;
  *v0 = 0;
  if (getSideEffects_once != -1)
    dispatch_once(&getSideEffects_once, &__block_literal_global_3);
  qword_2540D7AF0 = getSideEffects_sideEffects;
}

void *__getSideEffects_block_invoke()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *result;
  uint64_t v16;
  _OWORD v17[5];
  uint64_t v18;

  v18 = *MEMORY[0x24BDB0D28];
  v0 = malloc_type_calloc(1uLL, 0x40uLL, 0x61D5536CuLL);
  if (!v0)
    __getSideEffects_block_invoke_cold_1(&v16, v17);
  getSideEffects_sideEffects = (uint64_t)v0;
  *v0 = &__block_literal_global_6;
  v1 = _Block_copy(&__block_literal_global_6);
  v2 = getSideEffects_sideEffects;
  *(_QWORD *)getSideEffects_sideEffects = v1;
  *(_QWORD *)(v2 + 8) = &__block_literal_global_9;
  v3 = _Block_copy(&__block_literal_global_9);
  v4 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 8) = v3;
  *(_QWORD *)(v4 + 16) = &__block_literal_global_12;
  v5 = _Block_copy(&__block_literal_global_12);
  v6 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 16) = v5;
  *(_QWORD *)(v6 + 24) = &__block_literal_global_15;
  v7 = _Block_copy(&__block_literal_global_15);
  v8 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 24) = v7;
  *(_QWORD *)(v8 + 32) = &__block_literal_global_18;
  v9 = _Block_copy(&__block_literal_global_18);
  v10 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 32) = v9;
  *(_QWORD *)(v10 + 40) = &__block_literal_global_21;
  v11 = _Block_copy(&__block_literal_global_21);
  v12 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 40) = v11;
  *(_QWORD *)(v12 + 48) = &__block_literal_global_24;
  v13 = _Block_copy(&__block_literal_global_24);
  v14 = getSideEffects_sideEffects;
  *(_QWORD *)(getSideEffects_sideEffects + 48) = v13;
  *(_QWORD *)(v14 + 56) = &__block_literal_global_27;
  result = _Block_copy(&__block_literal_global_27);
  *(_QWORD *)(getSideEffects_sideEffects + 56) = result;
  return result;
}

uint64_t ___ddrsReaderExtractRecordStoreBootUUID_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDB0D28];
  if (a2 == 6)
  {
    if (!a3)
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    if (*(_QWORD *)a3 != MEMORY[0x24BDB1330])
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_3(&v5, v6);
    if (*(_QWORD *)(a3 + 8) != 16)
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_2(&v5, v6);
    uuid_copy(*(unsigned __int8 **)(a1 + 40), *(const unsigned __int8 **)(a3 + 16));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 3;
  }
  else if (a2 == 5)
  {
    if (!a3)
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    return strncmp(*(const char **)a3, "ddrsKeyBootUUID", 0xFuLL) != 0;
  }
  else
  {
    return 0;
  }
}

uint64_t DarwinDirectoryRecordStoreApply(int a1, uint64_t a2)
{
  if (getStore_once != -1)
    dispatch_once(&getStore_once, &__block_literal_global);
  _ddrsReaderApplyToStore((uint64_t)&getStore_store, a1, 0, a2);
  return 1;
}

uint64_t DarwinDirectoryRecordStoreApplyWithFilter(int a1, const unsigned __int8 *a2, uint64_t a3)
{
  if (getStore_once != -1)
    dispatch_once(&getStore_once, &__block_literal_global);
  _ddrsReaderApplyToStore((uint64_t)&getStore_store, a1, a2, a3);
  return 1;
}

void _ddrsReaderApplyToStore(uint64_t a1, int a2, const unsigned __int8 *a3, uint64_t a4)
{
  const char *v8;
  uint64_t v9;
  int v10;
  char *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  _QWORD v16[10];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t (*v26)(uint64_t, int, const char **);
  void *v27;
  uint64_t v28;
  const char *v29;
  const unsigned __int8 *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  char out[45];
  char __str[11];
  uint64_t v36;

  v36 = *MEMORY[0x24BDB0D28];
  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 24));
  _ddrsReaderUpdateRecordStoreIfNeeded(a1);
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (a2)
  {
    if (a2 != 1)
      _ddrsReaderApplyToStore_cold_1();
    v8 = "ddrsKeyGroupRecordList";
  }
  else
  {
    v8 = "ddrsKeyUserRecordList";
  }
  v9 = MEMORY[0x24BDB0CE0];
  if (!a3)
  {
    v14 = 0;
LABEL_18:
    *(_QWORD *)&v25 = v9;
    *((_QWORD *)&v25 + 1) = 0x40000000;
    v26 = ___ddrsReaderApplyToStoreRecords_block_invoke;
    v27 = &unk_24E596A88;
    v30 = a3;
    v31 = v14;
    v33 = a2;
    v32 = a1;
    v28 = a4;
    v29 = v8;
    xpc_traverse_serialized_data();
    goto LABEL_19;
  }
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  memset(out, 0, 37);
  v10 = *(_DWORD *)a3;
  if (*(_DWORD *)a3 == 2)
  {
    v11 = out;
    uuid_unparse(a3 + 8, out);
    v12 = "ddrsKeyGroupUUIDMap";
    v13 = "ddrsKeyUserUUIDMap";
  }
  else if (v10 == 1)
  {
    v11 = (char *)*((_QWORD *)a3 + 1);
    v12 = "ddrsKeyGroupNameMap";
    v13 = "ddrsKeyUserNameMap";
  }
  else
  {
    if (v10)
      _ddrsReaderApplyToStore_cold_2();
    v11 = __str;
    snprintf(__str, 0xBuLL, "%u", *((_DWORD *)a3 + 2));
    v12 = "ddrsKeyGroupIDMap";
    v13 = "ddrsKeyUserIDMap";
  }
  if (a2)
    v15 = v12;
  else
    v15 = v13;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2000000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2000000000;
  v20 = -1;
  v16[1] = v9;
  v16[2] = 0x40000000;
  v16[3] = ___ddrsReaderFindStoreRecordIndex_block_invoke;
  v16[4] = &unk_24E596AB0;
  v16[7] = v11;
  v16[8] = v15;
  v16[9] = strlen(v15);
  v16[5] = &v21;
  v16[6] = &v17;
  xpc_traverse_serialized_data();
  if (!*((_BYTE *)v22 + 24))
    _ddrsReaderApplyToStore_cold_3(v16, &v25);
  v14 = v18[3];
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  if (v14 != -1)
    goto LABEL_18;
LABEL_19:
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 24));
}

void _ddrsReaderUpdateRecordStoreIfNeeded(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x24BDB0D28];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (*(_DWORD *)(a1 + 16) == -1)
  {
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    if (*(_DWORD *)(a1 + 16) != -1)
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_5(&v3, v5);
    if ((*(unsigned int (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) + 16))())
    {
      v5[0] = 0uLL;
      v3 = 0;
      v4 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
        v5[0] = 0uLL;
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        v3 = 0;
        v4 = 0;
      }
      _os_log_simple();
    }
  }
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (*(_DWORD *)(a1 + 16) != -1)
    (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  if (!*(_QWORD *)a1)
  {
    v5[0] = 0uLL;
    v3 = 0;
    v4 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
      v5[0] = 0uLL;
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      _dyld_get_shared_cache_range();
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    _os_log_simple();
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    v2 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
      _ddrsReaderUnloadRecordStore(a1);
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
    if (*(_QWORD *)a1)
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_4(&v3, v5);
    if (*(_QWORD *)(a1 + 8))
      _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(&v3, v5);
    if (_ddrsReaderLoadAndValidateRecordStoreAtPath((uint64_t)"/private/var/db/DarwinDirectory/local/recordStore.data", a1))
    {
      v5[0] = 0uLL;
      v3 = 0;
      v4 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
        v5[0] = 0uLL;
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        v3 = 0;
        v4 = 0;
      }
      _os_log_simple();
      ++*(_WORD *)(a1 + 20);
    }
    else
    {
      if (v2)
        _ddrsReaderUpdateRecordStoreIfNeeded_cold_2();
      if ((_ddrsReaderLoadAndValidateRecordStoreAtPath((uint64_t)"/System/Library/DarwinDirectory/system/recordStore.data", a1) & 1) == 0)_ddrsReaderUpdateRecordStoreIfNeeded_cold_1();
      v5[0] = 0uLL;
      v3 = 0;
      v4 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
        v5[0] = 0uLL;
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        _dyld_get_shared_cache_range();
      }
      else
      {
        v3 = 0;
        v4 = 0;
      }
      _os_log_simple();
    }
  }
}

uint64_t __getSideEffects_block_invoke_8(int a1, int token, int *check)
{
  return notify_check(token, check);
}

uint64_t __getSideEffects_block_invoke_7(int a1, char *name, int *out_token)
{
  return notify_register_check(name, out_token);
}

uint64_t _ddrsReaderLoadAndValidateRecordStoreAtPath(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t result;
  uint64_t v14;
  unsigned __int8 uu2[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unsigned __int8 uu[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, int, uint64_t);
  void *v29;
  uint64_t *v30;
  unsigned __int8 *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDB0D28];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
  v3 = *(_QWORD **)(a2 + 32);
  v4 = (*(uint64_t (**)(void))(*v3 + 16))();
  if ((_DWORD)v4 == -1)
  {
    v7 = *__error();
    v26 = 0;
    v27 = 0;
    v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v26 = 0;
      v27 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      *(_QWORD *)uu = 0;
      _dyld_get_shared_cache_range();
    }
    else
    {
      v32 = 0;
      v33 = 0;
    }
    strerror(v7);
    _os_log_simple();
    result = 0;
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    return result;
  }
  v5 = v4;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  *(_OWORD *)uu2 = 0u;
  if ((*(unsigned int (**)(void))(v3[2] + 16))())
  {
    v6 = *__error();
    v26 = 0;
    v27 = 0;
    v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v26 = 0;
      v27 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) == 0)
    {
      v32 = 0;
      v33 = 0;
      goto LABEL_17;
    }
LABEL_6:
    *(_QWORD *)uu = 0;
    _dyld_get_shared_cache_range();
LABEL_17:
    strerror(v6);
    _os_log_simple();
    v9 = 0;
    goto LABEL_18;
  }
  v9 = (*(uint64_t (**)(void))(v3[3] + 16))();
  if (v9 == -1)
  {
    v6 = *__error();
    v26 = 0;
    v27 = 0;
    v32 = 0;
    v33 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
    {
      v26 = 0;
      v27 = 0;
    }
    if ((_dyld_get_shared_cache_uuid() & 1) == 0)
    {
      v32 = 0;
      v33 = 0;
      goto LABEL_17;
    }
    goto LABEL_6;
  }
LABEL_18:
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3[1] + 16))(v3[1], v5, v8);
  v10 = v21;
  if (!v9)
    v10 = 0;
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v10;
  if (v9)
  {
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
    *(_QWORD *)uu = 0;
    v25 = 0;
    os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a2 + 24));
    v32 = 0;
    v33 = &v32;
    v34 = 0x2000000000;
    v35 = 0;
    v26 = MEMORY[0x24BDB0CE0];
    v27 = 0x40000000;
    v28 = ___ddrsReaderExtractRecordStoreBootUUID_block_invoke;
    v29 = &unk_24E596A60;
    v30 = &v32;
    v31 = uu;
    xpc_traverse_serialized_data();
    if (!*((_BYTE *)v33 + 24))
      _ddrsReaderLoadAndValidateRecordStoreAtPath_cold_1(&v14, uu2);
    _Block_object_dispose(&v32, 8);
    if (uuid_is_null(uu))
    {
      memset(uu2, 0, sizeof(uu2));
      v26 = 0;
      v27 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
        memset(uu2, 0, sizeof(uu2));
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        v32 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        v26 = 0;
        v27 = 0;
      }
      _os_log_simple();
      return 1;
    }
    memset(uu2, 0, sizeof(uu2));
    if ((*(unsigned int (**)(_QWORD, unsigned __int8 *, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 56)
                                                                            + 16))(*(_QWORD *)(*(_QWORD *)(a2 + 32) + 56), uu2, v11))
    {
      v12 = *__error();
      v26 = 0;
      v27 = 0;
      v32 = 0;
      v33 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        v26 = 0;
        v27 = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        v14 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        v32 = 0;
        v33 = 0;
      }
      strerror(v12);
    }
    else
    {
      if (!uuid_compare(uu, uu2))
        return 1;
      v26 = 0;
      v27 = 0;
      v32 = 0;
      v33 = 0;
      if ((_dyld_get_image_uuid() & 1) == 0)
      {
        v26 = 0;
        v27 = 0;
      }
      if ((_dyld_get_shared_cache_uuid() & 1) != 0)
      {
        v14 = 0;
        _dyld_get_shared_cache_range();
      }
      else
      {
        v32 = 0;
        v33 = 0;
      }
    }
    _os_log_simple();
    memset(uu2, 0, sizeof(uu2));
    v26 = 0;
    v27 = 0;
    if ((_dyld_get_image_uuid() & 1) == 0)
      memset(uu2, 0, sizeof(uu2));
    if ((_dyld_get_shared_cache_uuid() & 1) != 0)
    {
      v32 = 0;
      _dyld_get_shared_cache_range();
    }
    else
    {
      v26 = 0;
      v27 = 0;
    }
    _os_log_simple();
    _ddrsReaderUnloadRecordStore(a2);
  }
  return 0;
}

uint64_t __getSideEffects_block_invoke_2(int a1, char *a2, int a3)
{
  return open(a2, a3);
}

void *__getSideEffects_block_invoke_5(uint64_t a1, size_t a2, int a3, int a4, int a5)
{
  return mmap(0, a2, a3, a4, a5, 0);
}

uint64_t __getSideEffects_block_invoke_4(int a1, int a2, stat *a3)
{
  return fstat(a2, a3);
}

uint64_t __getSideEffects_block_invoke_3(int a1, int a2)
{
  return close(a2);
}

uint64_t ___ddrsReaderFindStoreRecordIndex_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  _OWORD v6[5];
  uint64_t v7;

  v7 = *MEMORY[0x24BDB0D28];
  if (a2 != 6)
  {
    if (a2 != 5)
      return 0;
    if (!a3)
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    if (*(_BYTE *)(v3 + 24))
    {
      result = strcmp(*(const char **)a3, *(const char **)(a1 + 48));
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      result = strncmp(*(const char **)a3, *(const char **)(a1 + 56), *(_QWORD *)(a1 + 64));
      if (!(_DWORD)result)
      {
        *(_BYTE *)(v3 + 24) = 1;
        return result;
      }
    }
    return 1;
  }
  if (!a3)
    ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v5, v6);
  if (*(_QWORD *)a3 == MEMORY[0x24BDB1318])
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(a3 + 16);
  return 3;
}

uint64_t ___ddrsReaderApplyToStoreRecords_block_invoke(uint64_t a1, int a2, const char **a3)
{
  uint64_t result;
  const char *v6;
  const char *v7;
  size_t v8;
  int v9;
  xpc_object_t value;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t v16;
  const unsigned __int8 *bytes;
  xpc_object_t v18;
  xpc_object_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  xpc_object_t v22;
  xpc_object_t v23;
  size_t count;
  size_t v25;
  size_t v26;
  xpc_object_t v27;
  const char *v28;
  uint64_t v29;
  _OWORD v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  const char *string_ptr;
  _OWORD v36[5];
  uint64_t v37;

  v37 = *MEMORY[0x24BDB0D28];
  string_ptr = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  memset(v30, 0, sizeof(v30));
  if (a2 != 4)
  {
    if (a2 != 7)
    {
      result = 0;
      if (a2 == 5)
      {
        if (!a3)
          ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v29, v36);
        v6 = *a3;
        v7 = *(const char **)(a1 + 40);
        v8 = strlen(v7);
        return strncmp(v6, v7, v8) != 0;
      }
      return result;
    }
    if (!a3)
      ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(&v29, v36);
    v9 = *(unsigned __int8 *)(a1 + 72);
    if (v9 == 1)
      *((_QWORD *)&v33 + 1) = v30;
    LOBYTE(v31) = v9;
    if (MEMORY[0x2207D211C](a3) != MEMORY[0x24BDB1308])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_12(&v29, v36);
    value = xpc_dictionary_get_value(a3, "ID");
    v11 = MEMORY[0x2207D211C]();
    v12 = MEMORY[0x24BDB1328];
    if (v11 != MEMORY[0x24BDB1328])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(&v29, v36);
    DWORD1(v31) = xpc_uint64_get_value(value);
    v13 = xpc_dictionary_get_value(a3, "name");
    v14 = MEMORY[0x2207D211C]();
    v15 = MEMORY[0x24BDB1320];
    if (v14 != MEMORY[0x24BDB1320])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
    *((_QWORD *)&v31 + 1) = xpc_string_get_string_ptr(v13);
    v16 = xpc_dictionary_get_value(a3, "UUID");
    if (MEMORY[0x2207D211C]() != MEMORY[0x24BDB1330])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_9(&v29, v36);
    bytes = xpc_uuid_get_bytes(v16);
    uuid_copy((unsigned __int8 *)&v32, bytes);
    v18 = xpc_dictionary_get_value(a3, "isMutable");
    if (MEMORY[0x2207D211C]() != MEMORY[0x24BDB1300])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_8(&v29, v36);
    LOBYTE(v33) = xpc_BOOL_get_value(v18);
    if (v9 != 1)
    {
      if (!v9)
      {
        v19 = xpc_dictionary_get_value(a3, "primaryGroupID");
        if (MEMORY[0x2207D211C]() != v12)
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(&v29, v36);
        DWORD2(v33) = xpc_uint64_get_value(v19);
        v20 = xpc_dictionary_get_value(a3, "fullName");
        if (MEMORY[0x2207D211C]() != v15)
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        *(_QWORD *)&v34 = xpc_string_get_string_ptr(v20);
        v21 = xpc_dictionary_get_value(a3, "homeDirectory");
        if (MEMORY[0x2207D211C]() != v15)
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        *((_QWORD *)&v34 + 1) = xpc_string_get_string_ptr(v21);
        v22 = xpc_dictionary_get_value(a3, "shell");
        if (MEMORY[0x2207D211C]() != v15)
          ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(&v29, v36);
        string_ptr = xpc_string_get_string_ptr(v22);
      }
      goto LABEL_33;
    }
    v23 = xpc_dictionary_get_value(a3, "memberNames");
    if (MEMORY[0x2207D211C]() != MEMORY[0x24BDB12F8])
      ___ddrsReaderApplyToStoreRecords_block_invoke_cold_7(&v29, v36);
    count = xpc_array_get_count(v23);
    v25 = count;
    if (count >= 0x20)
    {
      *((_QWORD *)&v33 + 1) = malloc_type_malloc(8 * count + 8, 0x10040436913F5uLL);
      *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v25) = 0;
    }
    else
    {
      *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * count) = 0;
      if (!count)
      {
LABEL_33:
        WORD1(v33) = *(_WORD *)(*(_QWORD *)(a1 + 64) + 20);
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        if (*(_BYTE *)(a1 + 72) == 1 && *((_OWORD **)&v33 + 1) != v30)
          free(*((void **)&v33 + 1));
        return 0;
      }
    }
    v26 = 0;
    do
    {
      v27 = xpc_array_get_value(v23, v26);
      if (MEMORY[0x2207D211C]() != v15)
        ___ddrsReaderApplyToStoreRecords_block_invoke_cold_6(&v29, v36);
      v28 = xpc_string_get_string_ptr(v27);
      *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v26++) = v28;
    }
    while (v25 != v26);
    goto LABEL_33;
  }
  if (!*(_QWORD *)(a1 + 48))
    return 2;
  if (!a3)
    ___ddrsReaderApplyToStoreRecords_block_invoke_cold_13(&v29, v36);
  if (*a3 == *(const char **)(a1 + 56))
    return 2;
  else
    return 1;
}

uint64_t _ddrsGetGeneration(uint64_t a1)
{
  uint64_t v2;

  os_unfair_lock_lock(*(os_unfair_lock_t *)(a1 + 24));
  _ddrsReaderUpdateRecordStoreIfNeeded(a1);
  v2 = *(unsigned __int16 *)(a1 + 20);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)(a1 + 24));
  return v2;
}

uint64_t _ddrsReaderUnloadRecordStore(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = *MEMORY[0x24BDB0D28];
  os_unfair_lock_assert_owner(*(const os_unfair_lock **)(a1 + 24));
  if (!*(_QWORD *)a1)
    _ddrsReaderUnloadRecordStore_cold_1(&v3, v4);
  if (!*(_QWORD *)(a1 + 8))
    _ddrsReaderUnloadRecordStore_cold_2(&v3, v4);
  result = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  if ((_DWORD)result)
    _ddrsReaderUnloadRecordStore_cold_3(&v3, v4);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

double OUTLINED_FUNCTION_1(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return abort_with_reason();
}

uint64_t DarwinDirectoryGetGeneration()
{
  if (getStore_once != -1)
    dispatch_once(&getStore_once, &__block_literal_global);
  return _ddrsGetGeneration((uint64_t)&getStore_store);
}

uint64_t __getSideEffects_block_invoke_6(int a1, void *a2, size_t a3)
{
  return munmap(a2, a3);
}

uint64_t __getSideEffects_block_invoke_9(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3;
  size_t v5;
  char in[16];
  _BYTE v7[21];
  uint64_t v8;

  v8 = *MEMORY[0x24BDB0D28];
  *(_OWORD *)in = 0u;
  memset(v7, 0, sizeof(v7));
  v5 = 37;
  v3 = sysctlbyname("kern.bootsessionuuid", in, &v5, 0, 0);
  if (!(_DWORD)v3)
    uuid_parse(in, a2);
  return v3;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return _os_crash_msg();
}

void _ddrsReaderApplyToStore_cold_1()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5();
  _ddrsReaderApplyToStore_cold_2(v0);
}

void _ddrsReaderApplyToStore_cold_2()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5();
  _ddrsReaderApplyToStore_cold_3(v0);
}

void _ddrsReaderApplyToStore_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_1()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5();
  _ddrsReaderUpdateRecordStoreIfNeeded_cold_2(v0);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_2()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_5();
  _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(v0);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUpdateRecordStoreIfNeeded_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderUnloadRecordStore_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void _ddrsReaderLoadAndValidateRecordStoreAtPath_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderExtractRecordStoreBootUUID_block_invoke_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_5(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_6(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_7(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_8(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_9(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_12(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void ___ddrsReaderApplyToStoreRecords_block_invoke_cold_13(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

void __getStore_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_4();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();
  __break(1u);
}

void __getSideEffects_block_invoke_cold_1(_QWORD *a1, _OWORD *a2)
{
  int *v2;
  const void *v3;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_4();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0();
  v3 = (const void *)OUTLINED_FUNCTION_2_0();
  __break(1u);
  _Block_copy(v3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDB0CC8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDB0CD0](a1, *(_QWORD *)&a2);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDB0F50]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x24BDB0C88]();
}

uint64_t _dyld_get_shared_cache_range()
{
  return MEMORY[0x24BDB0C98]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x24BDB0CA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDB0D38]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDB12D8]();
}

uint64_t _os_log_simple()
{
  return MEMORY[0x24BDB11C8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x24BDB0F70]();
}

int close(int a1)
{
  return MEMORY[0x24BDB0F88](*(_QWORD *)&a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDB0C40](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDB1128](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDB0FB0](*(_QWORD *)&a1, a2);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1188](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1190](size, type_id);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDB1088](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDB1098](a1, a2);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x24BDB11B0](*(_QWORD *)&token, check);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDB11B8](name, out_token);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDB10A0](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDB12E8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDB1270](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDB1278](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDB1288](lock);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDB0E80](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDB0E98](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDB0EA8](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDB0EB8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDB0EC0](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0F00](a1, a2, a3, a4, a5);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x24BDB0F10](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x24BDB0F18](dst, src);
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x24BDB0F20](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x24BDB0F28](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0F30](uu, out);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB1338](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB1340](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB1348](xBOOL);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB13A8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB13D8](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB13F0](xstring);
}

uint64_t xpc_traverse_serialized_data()
{
  return MEMORY[0x24BDB13F8]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB1408](xuint);
}

