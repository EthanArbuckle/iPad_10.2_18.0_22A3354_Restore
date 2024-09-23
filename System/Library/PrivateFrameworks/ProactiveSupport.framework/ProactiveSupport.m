void sub_1A09594BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09596DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A095985C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0959980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0959B44(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A0959C88(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A0959C94(_Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;

  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exc_buf);
      if (!v9)
        JUMPOUT(0x1A0959BF4);
      JUMPOUT(0x1A0959C30);
    }
    v10 = objc_begin_catch(exc_buf);
    v11 = MEMORY[0x1E0C81028];
    v12 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v10, "debugDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a9) = 138412290;
      *(_QWORD *)((char *)&a9 + 4) = v13;
      _os_log_fault_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "-[_PASSqliteDatabase withDbLockExecuteBlock:] caught an exception during invocation of block.\n\nException: %@", (uint8_t *)&a9, 0xCu);

    }
    objc_exception_rethrow();
  }
  _Unwind_Resume(exc_buf);
}

void sub_1A0959D48(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A0959CA4);
  }
  _Unwind_Resume(a1);
}

void sub_1A0959D60(_Unwind_Exception *a1)
{
  char v1;

  if ((v1 & 1) != 0)
    JUMPOUT(0x1A0959D68);
  _Unwind_Resume(a1);
}

void sub_1A0959D70(uint64_t a1, int a2)
{
  if (!a2)
    sub_1A0959D74();
  objc_terminate();
}

void sub_1A095A2BC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void **_PASCompactStringArrayDestroy(void **result)
{
  void **v1;
  void *v2;

  if (result)
  {
    v1 = result;
    v2 = *result;
    if (v2)
    {
      v1[1] = v2;
      operator delete(v2);
    }
    JUMPOUT(0x1A1AFD770);
  }
  return result;
}

uint64_t _PAS_sqlite3_bind_nsstring(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  int v8;
  sqlite3_uint64 v9;
  sqlite3_stmt *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  const char *v16;
  unsigned __int8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  sqlite3_uint64 v27;
  sqlite3_uint64 v28;
  const char *v29;
  const char *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;
  sqlite3_uint64 v39;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _PAS_sqlite3_bind_nsstring(sqlite3_stmt * _Nonnull, int, NSString * _Nonnull __strong)");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("_PASSqliteDatabase.m"), 76, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("str != nil"));

  }
  v39 = 0;
  v6 = objc_msgSend(v5, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v39);
  if (!v6)
  {
    v14 = objc_retainAutorelease(v5);
    v15 = objc_msgSend(v14, "_fastCharacterContents");
    if (v15)
    {
      v16 = (const char *)v15;
      v9 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 10);
      v10 = a1;
      v11 = a2;
      v12 = v16;
      v13 = -1;
LABEL_8:
      v17 = 4;
LABEL_18:
      v18 = sqlite3_bind_text64(v10, v11, v12, v9, (void (__cdecl *)(void *))v13, v17);
      goto LABEL_19;
    }
    v39 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 4);
    if (v39)
    {
      v19 = objc_msgSend(v14, "length");
      if (!v19)
        __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 128, "length > 0");
      v20 = v19;
      v21 = (const char *)sqlite3_malloc64(v39);
      if (v21)
      {
        v22 = v21;
        v32 = 0;
        v33 = 0;
        objc_msgSend(v14, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v21, v39, 0, 4, 0, 0, v20, &v32);
        if (v33)
          __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 133, "remainingRange.length == 0");
        v9 = v39;
        v13 = (uint64_t)MEMORY[0x1E0DE87D0];
        v10 = a1;
        v11 = a2;
        v12 = v22;
        goto LABEL_17;
      }
    }
    else
    {
      v27 = objc_msgSend(v14, "lengthOfBytesUsingEncoding:", 10);
      if (!v27)
        __assert_rtn("_PAS_sqlite3_bind_nsstring", "_PASSqliteDatabase.m", 114, "utf16Size != 0");
      v28 = v27;
      v29 = (const char *)sqlite3_malloc64(v27);
      if (v29)
      {
        v30 = v29;
        objc_msgSend(v14, "getCharacters:", v29);
        v13 = (uint64_t)MEMORY[0x1E0DE87D0];
        v10 = a1;
        v11 = a2;
        v12 = v30;
        v9 = v28;
        goto LABEL_8;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v31);
  }
  v7 = (const char *)v6;
  v8 = _NSIsNSCFConstantString();
  v9 = v39;
  if (v8)
  {
    v10 = a1;
    v11 = a2;
    v12 = v7;
    v13 = 0;
LABEL_17:
    v17 = 1;
    goto LABEL_18;
  }
  if (v39 - 17 > 0x7FFFFFED)
  {
    v10 = a1;
    v11 = a2;
    v12 = v7;
    v13 = -1;
    goto LABEL_17;
  }
  CFRetain(v5);
  v34 = MEMORY[0x1E0C809B0];
  v35 = 3221225472;
  v36 = ___PAS_sqlite3_bind_nsstring_block_invoke;
  v37 = &__block_descriptor_40_e9_v16__0_v8l;
  v38 = v5;
  v18 = sqlite3_bind_text_b();
LABEL_19:
  v23 = v18;

  return v23;
}

void sub_1A095BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A095BD30(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A095BD50(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A095BD04);
}

uint64_t sub_1A095BE24()
{
  void *v0;
  void *v1;
  void (**v2)(_QWORD, float);
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  int v5;
  void *v6;
  void *v7;
  int v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  uint64_t v11;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;

  if ((v5 & 0x10000000) != 0)
  {
    if (v2)
      v2[2](v2, COERCE_FLOAT(16 * v5));
    v9 = v14;
    v10 = v13;
  }
  else
  {
    v8 = v5 & 0xFFFFFFF;
    if ((v5 & 0xFFFFFFF) == 0xFFFFFFF)
    {
      v11 = 1;
      v10 = v13;
      v9 = v14;
LABEL_9:
      if (v9)
        v9[2](v9, v11);
      goto LABEL_13;
    }
    v10 = v13;
    v9 = v14;
    if (v8 == 268435454)
    {
      v11 = 0;
      goto LABEL_9;
    }
    if (v4)
      v4[2](v4, (v8 - 0x7FFFFFF));
  }
LABEL_13:

  return 1;
}

void sub_1A095CA48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A095CC08()
{
  __break(1u);
}

void sub_1A095CC74()
{
  objc_end_catch();
  JUMPOUT(0x1A095CC40);
}

void sub_1A095CF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __unregisterForAKSEvents_block_invoke()
{
  return AKSEventsUnregister();
}

uint64_t lockState()
{
  uint64_t result;

  LODWORD(result) = MKBGetDeviceLockState();
  if (result >= 4)
    return 1;
  else
    return result;
}

void sub_1A095DE08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t registerForAKSEvents(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  uint8_t v6[8];
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, int, CFDictionaryRef);
  void *v10;
  id v11;

  v2 = a2;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __registerForAKSEvents_block_invoke;
  v10 = &unk_1E4430520;
  v3 = v2;
  v11 = v3;
  v4 = AKSEventsRegister();
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed register: AKSEventsRegister", v6, 2u);
  }

  return v4;
}

id getLockStateChangedQueue()
{
  if (getLockStateChangedQueue_onceToken != -1)
    dispatch_once(&getLockStateChangedQueue_onceToken, &__block_literal_global_47);
  return (id)getLockStateChangedQueue_queue;
}

id _PAS_sqlite3_column_nsdata(sqlite3_stmt *a1, int a2)
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__3236;
  v9 = __Block_byref_object_dispose__3237;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___PAS_sqlite3_column_nsdata_block_invoke;
  v4[3] = &unk_1E44306F8;
  v4[4] = &v5;
  _PAS_sqlite3_column_blob_bytes_block(a1, a2, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1A095E4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PAS_sqlite3_column_blob_bytes_block(sqlite3_stmt *a1, int a2, void *a3)
{
  int v5;
  void *BytePtr;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = a3;
  v5 = sqlite3_column_bytes(a1, a2);
  if (v5 < 1)
  {
    if (sqlite3_column_type(a1, a2) != 4)
    {
      v7 = 0;
      goto LABEL_7;
    }
    BytePtr = (void *)CFDataGetBytePtr((CFDataRef)&unk_1EE5A9FD0);
  }
  else
  {
    BytePtr = (void *)sqlite3_column_blob(a1, a2);
  }
  v7 = BytePtr;
LABEL_7:
  v8[2](v8, v7, v5);

}

void unregisterForAKSEvents(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    dispatch_get_global_queue(0, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __unregisterForAKSEvents_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    dispatch_async(v2, block);

  }
}

uint64_t unlockedSinceBoot()
{
  unsigned __int8 v0;
  uint64_t result;

  v0 = atomic_load(unlockedSinceBoot_haveSeenUnlocked);
  if ((v0 & 1) != 0)
    return 1;
  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result != 1)
    return 0;
  atomic_store(1u, unlockedSinceBoot_haveSeenUnlocked);
  return result;
}

BOOL formattedForContentProtection()
{
  return MKBDeviceFormattedForContentProtection() != 0;
}

uint64_t xClose(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  if (v2)
  {
    CFRelease(v2);
    a1[1] = 0;
  }
  sqlite3_free(a1);
  return 0;
}

uint64_t xFilter(_QWORD *a1, int a2, _BYTE *a3, int a4, sqlite3_value **a5)
{
  void *v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  char v15;
  const void *v16;
  id v17;
  id v18;
  _QWORD *v19;
  char v20;
  unsigned __int8 *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  BOOL (*v28)(uint64_t, int, uint64_t);
  void *v29;
  id v30;
  _BYTE *v31;
  sqlite3_value **v32;
  int v33;
  char v34;
  _BYTE buf[28];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = *(void **)(*a1 + 24);
  v11 = sqlite3_value_pointer(*a5, (const char *)objc_msgSend(v10, "sqliteMethodName"));
  if (v11)
  {
    v12 = v11;
    v13 = (void *)objc_opt_new();
    v14 = (void *)CFRetain(v12);
    objc_msgSend(v13, "setCollection:", v14);

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = a3;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = a2;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = objc_opt_class();
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections xFilter idxStr:%s idxNum:%d for %@", buf, 0x1Cu);
    }
    v15 = objc_msgSend((id)objc_opt_class(), "hasKey");
    v16 = (const void *)a1[1];
    if (v16)
      CFRelease(v16);
    v17 = v13;
    a1[1] = v17;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_DWORD *)&buf[24] = 1;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v28 = __xFilter_block_invoke;
    v29 = &unk_1E4430590;
    v31 = buf;
    v32 = a5;
    v34 = v15;
    v18 = v17;
    v30 = v18;
    v33 = a4;
    v19 = v27;
    v20 = *a3;
    if (*a3)
    {
      v21 = a3 + 4;
      do
      {
        if (v20 == 118)
        {
          v22 = 0;
        }
        else
        {
          if (v20 != 107)
LABEL_21:
            __break(1u);
          v22 = 1;
        }
        v28((uint64_t)v19, v22, (10 * *(v21 - 2) + 100 * *(v21 - 3) + *(v21 - 1) + 48));
        v23 = *v21;
        v21 += 4;
        v20 = v23;
      }
      while (v23);
    }

    v24 = 0;
    v25 = 1;
    switch(a2)
    {
      case 0:
        goto LABEL_20;
      case 1:
        if ((v15 & 1) != 0)
          goto LABEL_20;
        v24 = 1;
LABEL_16:
        objc_msgSend(v18, "applyRowIdSort:", v24);
        goto LABEL_20;
      case 2:
        goto LABEL_16;
      case 3:
        goto LABEL_19;
      case 4:
        v25 = 0;
LABEL_19:
        objc_msgSend(v18, "applyValueSort:", v25);
LABEL_20:
        objc_msgSend(v18, "finalizeConstraints", v24);

        _Block_object_dispose(buf, 8);
        return 0;
      default:
        goto LABEL_21;
    }
  }
  *(_QWORD *)(*a1 + 16) = sqlite3_mprintf("Object of incorrect type passed to %s", (const char *)objc_msgSend(v10, "sqliteMethodName"));
  return 1;
}

void sub_1A095FC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t xBestIndex(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  char v5;
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  _BYTE *v12;
  BOOL v13;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  uint64_t v21;
  const __CFString *v22;
  int *v23;
  uint64_t v24;
  int v25;
  BOOL v26;
  _BOOL4 v27;
  uint64_t v28;
  double *v29;
  void *v30;
  uint64_t v31;
  int v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  uint64_t v40;
  int v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  _BOOL8 v46;
  NSObject *v47;
  const char *v48;
  int v49;
  int v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  const __CFString *v62;
  void *v63;
  uint8_t buf[4];
  _BYTE v65[28];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 24);
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSubclassOfClass:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("_PASSqliteCollections.m"), 1391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cursorClass isSubclassOfClass:[_PASSqliteCollectionsCursor self]]"));

  }
  v6 = objc_msgSend(v3, "hasKey");
  if (v6)
    v7 = 2;
  else
    v7 = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v65 = v3;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Beginning xBestIndex for %@", buf, 0xCu);
  }
  *(_DWORD *)(a2 + 40) = 0;
  v8 = *(_DWORD *)a2;
  if (*(int *)a2 < 1)
    goto LABEL_14;
  v9 = 0;
  v10 = 0;
  v11 = v6 - 1;
  v12 = (_BYTE *)(*(_QWORD *)(a2 + 8) + 5);
  v13 = 1;
  while (*(v12 - 1) != 2 || *(_DWORD *)(v12 - 5) != v7 || !*v12)
  {
    v13 = ++v10 < v8;
    v9 += 8;
    v12 += 12;
    if (v8 == v10)
      goto LABEL_14;
  }
  v15 = *(_QWORD *)(a2 + 32) + v9;
  *(_DWORD *)v15 = 1;
  *(_BYTE *)(v15 + 4) = 1;
  if (!v13)
  {
LABEL_14:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v65 = v3;
      _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Ending xBestIndex for %@: pointer constraint missing", buf, 0xCu);
    }
    return 0;
  }
  objc_msgSend(v3, "baseEstimatedRows");
  v17 = v16;
  objc_msgSend(v3, "baseEstimatedCost");
  v19 = v18;
  v63 = (void *)objc_opt_new();
  v20 = *(_DWORD *)a2;
  if (*(int *)a2 >= 1)
  {
    v21 = 0;
    v22 = CFSTR("rowId");
    v23 = *(int **)(a2 + 8);
    if (v6)
      v22 = CFSTR("key");
    v62 = v22;
    v24 = -1;
    do
    {
      if (*((_BYTE *)v23 + 5))
      {
        v25 = *v23;
        v26 = *v23 == v11 || v25 == v6;
        if (v26)
        {
          v27 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
          if (v25 == v6)
          {
            if (v27)
            {
              v42 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v65 = v42;
              *(_WORD *)&v65[4] = 2112;
              *(_QWORD *)&v65[6] = v3;
              _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Considering value->%hhu for %@", buf, 0x12u);
            }
            objc_msgSend(v3, "planningInfoForValueConstraint:", *((unsigned __int8 *)v23 + 4));
            v28 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (v27)
            {
              v43 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)v65 = v62;
              *(_WORD *)&v65[8] = 1024;
              *(_DWORD *)&v65[10] = v43;
              *(_WORD *)&v65[14] = 2112;
              *(_QWORD *)&v65[16] = v3;
              _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Considering %@->%hhu for %@", buf, 0x1Cu);
            }
            v31 = *((unsigned __int8 *)v23 + 4);
            if ((v6 & 1) != 0)
              objc_msgSend(v3, "planningInfoForKeyConstraint:", v31);
            else
              objc_msgSend(v3, "planningInfoForRowIdConstraint:", v31);
            v28 = objc_claimAutoreleasedReturnValue();
          }
          v29 = (double *)v28;
          if (v28)
          {
            v32 = *(unsigned __int8 *)(v28 + 9);
            v33 = *(unsigned __int8 *)(v28 + 8);
            v34 = *(_QWORD *)(a2 + 8) + 12 * v21;
            v35 = *(_DWORD *)v34;
            v36 = *(unsigned __int8 *)(v34 + 4);
            v26 = v35 == v6 - 1;
            v37 = 118;
            if (v26)
              v37 = 107;
            objc_msgSend(v63, "appendFormat:", CFSTR("%c%03d"), v37, v36);
            v38 = *(_QWORD *)(a2 + 32);
            v39 = (_DWORD *)(v38 + 8 * v21);
            *v39 = 2;
            if (v21)
            {
              v40 = v24;
              while (v40 + 1 >= 1)
              {
                v41 = *(_DWORD *)(v38 + 8 * v40--);
                if (v41 >= 2)
                {
                  *v39 = v41 + 1;
                  break;
                }
              }
            }
            if (v32)
              *(_BYTE *)(v38 + 8 * v21 + 4) = 1;
            if (v33)
              *(_DWORD *)(a2 + 80) |= 1u;
            v17 = v17 * v29[2];
            v19 = v19 * v29[3];
            v11 = v6 - 1;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              *(double *)v65 = v19;
              *(_WORD *)&v65[8] = 2048;
              *(double *)&v65[10] = v17;
              *(_WORD *)&v65[18] = 2112;
              *(_QWORD *)&v65[20] = v3;
              _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Estimated cost now %f, estimated rows now %f for %@", buf, 0x20u);
            }
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              v44 = *((unsigned __int8 *)v23 + 4);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v65 = v44;
              *(_WORD *)&v65[4] = 2112;
              *(_QWORD *)&v65[6] = v3;
              _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections No optimization: %hhu for %@", buf, 0x12u);
            }
            v29 = 0;
            v11 = v6 - 1;
          }
          goto LABEL_57;
        }
        if (v25 != v7)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v29 = (double *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("_PASSqliteCollections.m"), 1444, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("constraint->iColumn == pointerColumn"));

LABEL_57:
          v20 = *(_DWORD *)a2;
        }
      }
      ++v21;
      v23 += 3;
      ++v24;
    }
    while (v21 < v20);
  }
  if (*(_DWORD *)(a2 + 16) != 1)
    goto LABEL_81;
  v45 = *(_QWORD *)(a2 + 24);
  if (*(_DWORD *)v45 == v11)
  {
    v46 = *(_BYTE *)(v45 + 4) != 0;
    if (v6)
    {
      if ((objc_msgSend(v3, "canOrderByKey:", v46) & 1) == 0)
        goto LABEL_63;
    }
    else if (!objc_msgSend(v3, "canOrderByRowId:", v46))
    {
LABEL_63:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v65 = v3;
        v47 = MEMORY[0x1E0C81028];
        v48 = "#passqlitecollections unable to optimize rowid/key ORDER BY for %@";
LABEL_80:
        _os_log_debug_impl(&dword_1A0957000, v47, OS_LOG_TYPE_DEBUG, v48, buf, 0xCu);
        goto LABEL_81;
      }
      goto LABEL_81;
    }
    *(_DWORD *)(a2 + 60) = 1;
    if (*(_BYTE *)(v45 + 4))
      v50 = 1;
    else
      v50 = 2;
    *(_DWORD *)(a2 + 40) = v50;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      goto LABEL_81;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v65 = v3;
    v47 = MEMORY[0x1E0C81028];
    v48 = "#passqlitecollections will optimize rowid/key ORDER BY for %@";
    goto LABEL_80;
  }
  if (*(_DWORD *)v45 == v6)
  {
    if (objc_msgSend(v3, "canOrderByValue:", *(_BYTE *)(v45 + 4) != 0))
    {
      *(_DWORD *)(a2 + 60) = 1;
      if (*(_BYTE *)(v45 + 4))
        v49 = 3;
      else
        v49 = 4;
      *(_DWORD *)(a2 + 40) = v49;
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        goto LABEL_81;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v65 = v3;
      v47 = MEMORY[0x1E0C81028];
      v48 = "#passqlitecollections will optimize value ORDER BY for %@";
      goto LABEL_80;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v65 = v3;
      v47 = MEMORY[0x1E0C81028];
      v48 = "#passqlitecollections unable to optimize value ORDER BY for %@";
      goto LABEL_80;
    }
  }
LABEL_81:
  *(double *)(a2 + 64) = v19;
  v51 = 1.0;
  if (v17 >= 1.0)
    v51 = v17;
  *(_QWORD *)(a2 + 72) = (uint64_t)v51;
  v52 = objc_msgSend(v63, "lengthOfBytesUsingEncoding:", 1);
  v53 = v52 + 1;
  v54 = sqlite3_malloc((int)v52 + 1);
  if (!v54)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v61 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v61);
  }
  *(_QWORD *)(a2 + 48) = v54;
  if ((objc_msgSend(v63, "getCString:maxLength:encoding:", v54, v53, 1) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int xBestIndex(sqlite3_vtab *, sqlite3_index_info *)");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("_PASSqliteCollections.m"), 1475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[indexString getCString:info->idxStr maxLength:indexStringLength encoding:NSASCIIStringEncoding]"));

  }
  *(_DWORD *)(a2 + 56) = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v55 = *(_QWORD *)(a2 + 64);
    v56 = *(_QWORD *)(a2 + 72);
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)v65 = v55;
    *(_WORD *)&v65[8] = 2048;
    *(_QWORD *)&v65[10] = v56;
    *(_WORD *)&v65[18] = 2112;
    *(_QWORD *)&v65[20] = v3;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitecollections Ending xBestIndex (estimatedCost: %f, estimatedRows: %lld) for %@", buf, 0x20u);
  }

  return 0;
}

uint64_t _indexForBindParam(sqlite3_stmt *a1, char *zName)
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    if (zName)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASSqliteStatement.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("stmt"));

    if (zName)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_PASSqliteStatement.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

LABEL_3:
  v4 = sqlite3_bind_parameter_index(a1, zName);
  if ((int)v4 <= 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _indexForBindParam(sqlite3_stmt *, const char *)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_PASSqliteStatement.m"), 255, CFSTR("Unknown bind parameter \"%s\""), zName);

  }
  return v4;
}

uint64_t _PAS_sqlite3_bind_nsdata(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  sqlite3_uint64 v7;
  uint64_t v8;
  const UInt8 *BytePtr;
  uint64_t v10;
  void *v12;
  void *v13;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _PAS_sqlite3_bind_nsdata(sqlite3_stmt * _Nonnull, int, NSData *__strong _Nonnull)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_PASSqliteDatabase.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data != nil"));

  }
  objc_msgSend(v5, "_pas_dataWithNonnullBytes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  if (v7 - 17 > 0x7FFFFFED)
  {
    BytePtr = CFDataGetBytePtr((CFDataRef)v6);
    v8 = sqlite3_bind_blob64(a1, a2, BytePtr, v7, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    CFRetain(v6);
    CFDataGetBytePtr((CFDataRef)v6);
    v8 = sqlite3_bind_blob_b();
  }
  v10 = v8;

  return v10;
}

void sub_1A0962ADC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A0962DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t xOpen(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t result;

  v3 = sqlite3_malloc64(0x10uLL);
  if (!v3)
    return 7;
  v4 = v3;
  result = 0;
  *v4 = 0;
  v4[1] = 0;
  *a2 = v4;
  return result;
}

void sub_1A0963318(void *a1)
{
  pthread_mutex_t *v1;

  objc_begin_catch(a1);
  pthread_mutex_unlock(v1);
  objc_exception_rethrow();
}

void sub_1A096332C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09635B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *_PASFullwidthLatinToHalfwidth(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UniChar v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  _WORD *v21;
  _WORD *v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  UniChar v28;
  int64_t v29;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  int64_t v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  CFStringRef theString;
  const UniChar *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  int64_t v50;
  uint64_t v51;
  CFRange v52;
  CFRange v53;

  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  if (!v2)
    goto LABEL_26;
  v3 = v2;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  theString = v1;
  v48 = 0;
  v49 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v46 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v50 = 0;
  v51 = 0;
  v47 = CStringPtr;
  if (v3 >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 64;
    while (1)
    {
      v10 = (unint64_t)v8 >= 4 ? 4 : v8;
      v11 = v49;
      if (v49 > v8)
      {
        if (v46)
        {
          v12 = v46[v8 + v48];
        }
        else if (v47)
        {
          v12 = v47[v48 + v8];
        }
        else
        {
          if (v51 <= v8 || v7 > v8)
          {
            v14 = v10 + v6;
            v15 = v9 - v10;
            v16 = v8 - v10;
            v17 = v16 + 64;
            if (v16 + 64 >= v49)
              v17 = v49;
            v50 = v16;
            v51 = v17;
            if (v49 >= v15)
              v11 = v15;
            v52.length = v11 + v14;
            v52.location = v16 + v48;
            CFStringGetCharacters(theString, v52, (UniChar *)&v37);
            v7 = v50;
          }
          v12 = *((_WORD *)&v37 + v8 - v7);
        }
        if ((unsigned __int16)(v12 + 255) < 0x5Eu)
          break;
      }
      ++v8;
      --v6;
      ++v9;
      if (v3 == v8)
        goto LABEL_26;
    }
    v21 = malloc_type_malloc(2 * v3, 0x1000040BDFB0063uLL);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0, v37, v38, v39, v40, v41, v42, v43, v44);
      v36 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v36);
    }
    v22 = v21;
    v23 = 0;
    v24 = 0;
    v25 = 64;
    do
    {
      if ((unint64_t)v24 >= 4)
        v26 = 4;
      else
        v26 = v24;
      v27 = v49;
      if (v49 <= v24)
      {
        v28 = 0;
      }
      else if (v46)
      {
        v28 = v46[v24 + v48];
      }
      else if (v47)
      {
        v28 = v47[v48 + v24];
      }
      else
      {
        v29 = v50;
        if (v51 <= v24 || v50 > v24)
        {
          v31 = v26 + v23;
          v32 = v25 - v26;
          v33 = v24 - v26;
          v34 = v33 + 64;
          if (v33 + 64 >= v49)
            v34 = v49;
          v50 = v33;
          v51 = v34;
          if (v49 >= v32)
            v27 = v32;
          v53.length = v27 + v31;
          v53.location = v33 + v48;
          CFStringGetCharacters(theString, v53, (UniChar *)&v37);
          v29 = v50;
        }
        v28 = *((_WORD *)&v37 + v24 - v29);
      }
      if ((unsigned __int16)(v28 + 255) < 0x5Eu)
        v28 += 288;
      v22[v24++] = v28;
      --v23;
      ++v25;
    }
    while (v3 != v24);
    v35 = objc_alloc(MEMORY[0x1E0CB3940]);
    v18 = (__CFString *)objc_msgSend(v35, "initWithCharactersNoCopy:length:freeWhenDone:", v22, v3, 1, v37, v38, v39, v40, v41, v42, v43, v44);
  }
  else
  {
LABEL_26:
    v18 = v1;
  }
  v19 = v18;

  return v19;
}

__CFString *_PASTryToConvertPhoneNumberToASCII(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  size_t v3;
  uint64_t FastestEncoding;
  char *v5;
  __CFString *v6;
  void *v7;
  char *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex v16;
  UniChar v17;
  int64_t v18;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  CFIndex v23;
  __CFString *v24;
  _OWORD buffer[8];
  __CFString *v27;
  const UniChar *v28;
  const char *v29;
  uint64_t v30;
  CFIndex v31;
  int64_t v32;
  int64_t v33;
  uint64_t v34;
  CFRange v35;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  if (!v2)
    goto LABEL_47;
  v3 = v2;
  FastestEncoding = CFStringGetFastestEncoding(v1);
  if ((_DWORD)FastestEncoding == 1536)
    goto LABEL_47;
  if (v3 > 0x1FF)
  {
    v5 = (char *)malloc_type_malloc(v3, 0x100004077774924uLL);
  }
  else
  {
    MEMORY[0x1E0C80A78](FastestEncoding);
    v5 = (char *)buffer - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v5, v3);
  }
  v6 = v1;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v5;
  if (!v7)
    goto LABEL_44;
  memset(buffer, 0, sizeof(buffer));
  Length = CFStringGetLength(v6);
  v27 = v6;
  v30 = 0;
  v31 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  v28 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  v32 = 0;
  v33 = 0;
  v8 = v5;
  v29 = CStringPtr;
  if (Length < 1)
  {
LABEL_44:

    v1 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v5, v8 - v5, 1);
    goto LABEL_45;
  }
  v12 = 0;
  v13 = 0;
  v14 = 64;
  v8 = v5;
  while (1)
  {
    if ((unint64_t)v13 >= 4)
      v15 = 4;
    else
      v15 = v13;
    v16 = v31;
    if (v31 <= v13)
    {
      LOBYTE(v17) = 0;
      goto LABEL_18;
    }
    if (v28)
    {
      v17 = v28[v13 + v30];
    }
    else if (v29)
    {
      v17 = v29[v30 + v13];
    }
    else
    {
      v18 = v32;
      if (v33 <= v13 || v32 > v13)
      {
        v20 = v15 + v12;
        v21 = v14 - v15;
        v22 = v13 - v15;
        v23 = v22 + 64;
        if (v22 + 64 >= v31)
          v23 = v31;
        v32 = v22;
        v33 = v23;
        if (v31 >= v21)
          v16 = v21;
        v35.length = v16 + v20;
        v35.location = v22 + v30;
        CFStringGetCharacters(v27, v35, (UniChar *)buffer);
        v18 = v32;
      }
      v17 = *((_WORD *)buffer + v13 - v18);
    }
    if (v17 > 0x2029u)
      break;
    if (v17 == 160)
      goto LABEL_39;
    if (v17 != 8211)
      goto LABEL_40;
    LOBYTE(v17) = 45;
LABEL_18:
    *v8++ = v17;
LABEL_33:
    ++v13;
    --v12;
    ++v14;
    if (Length == v13)
      goto LABEL_44;
  }
  if (v17 - 8234 < 5)
    goto LABEL_33;
  if (v17 == 12288)
  {
LABEL_39:
    LOBYTE(v17) = 32;
    goto LABEL_18;
  }
LABEL_40:
  if (v17 - 65281 < 0x5E)
  {
    LOBYTE(v17) = v17 + 32;
    goto LABEL_18;
  }
  if (v17 < 0x80u)
    goto LABEL_18;
  v1 = v6;
LABEL_45:

  if (v3 >= 0x200)
    free(v5);
LABEL_47:
  v24 = v1;

  return v24;
}

id _PAS_sqlite3_column_nsstring(sqlite3_stmt *a1, int a2)
{
  const unsigned __int8 *v4;
  void *v5;
  void *v6;
  id v7;
  const void *v8;
  void *v9;

  v4 = sqlite3_column_text(a1, a2);
  if (!v4)
    goto LABEL_7;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v4, sqlite3_column_bytes(a1, a2), 4);
  v6 = v5;
  if (!v5)
  {
    v8 = sqlite3_column_text16(a1, a2);
    if (v8)
    {
      v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v8, (unint64_t)sqlite3_column_bytes16(a1, a2) >> 1);
      goto LABEL_6;
    }
LABEL_7:
    v9 = 0;
    return v9;
  }
  v7 = v5;
LABEL_6:
  v9 = v7;

  return v9;
}

uint64_t xColumn(uint64_t a1, uint64_t a2, int a3)
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t *v9;
  __int16 v11;
  uint8_t buf[2];

  v4 = *(id *)(a1 + 8);
  if (!objc_msgSend((id)objc_opt_class(), "hasKey"))
  {
    if (a3 != 1)
    {
      if (a3)
        goto LABEL_11;
      goto LABEL_8;
    }
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    v11 = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = (uint8_t *)&v11;
LABEL_18:
    _os_log_fault_impl(&dword_1A0957000, v8, OS_LOG_TYPE_FAULT, "#passqlitecollections xColumn accessing pointer for some reason", v9, 2u);
    goto LABEL_15;
  }
  if (a3 == 2)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_15;
    *(_WORD *)buf = 0;
    v8 = MEMORY[0x1E0C81028];
    v9 = buf;
    goto LABEL_18;
  }
  if (a3 == 1)
  {
LABEL_8:
    -[_PASSqliteCollectionsCursor outputValue](v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (a3)
    goto LABEL_11;
  objc_msgSend(v4, "outputKey");
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v6 = (void *)v5;
  if (v5)
  {
    _PASSqliteSetResult();

LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
LABEL_11:
  v7 = 1;
LABEL_16:

  return v7;
}

void _PASSqliteSetResult()
{
  sqlite3_context *v0;
  id v1;
  id v2;
  CFTypeID v3;
  id v4;
  double v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  sqlite3_uint64 v9;
  sqlite3_context *v10;
  const char *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  sqlite3_uint64 v15;
  sqlite3_uint64 v16;
  void *v17;
  const void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  sqlite3_uint64 v25;
  const char *v26;
  const char *v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  sqlite3_uint64 v35;
  sqlite3_int64 valuePtr[513];

  v0 = (sqlite3_context *)MEMORY[0x1E0C80A78]();
  valuePtr[512] = *MEMORY[0x1E0C80C00];
  v2 = v1;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSqliteSetResult(sqlite3_context * _Nonnull, __strong id _Nonnull)");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("_PASSqliteDatabase.m"), 348, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objcObject"));

  }
  v3 = CFGetTypeID(v2);
  if (v3 == CFNumberGetTypeID() || v3 == CFBooleanGetTypeID())
  {
    v4 = v2;
    if (CFNumberIsFloatType((CFNumberRef)v4))
    {
      objc_msgSend(v4, "doubleValue");
      sqlite3_result_double(v0, v5);
    }
    else
    {
      valuePtr[0] = 0;
      CFNumberGetValue((CFNumberRef)v4, kCFNumberSInt64Type, valuePtr);
      sqlite3_result_int64(v0, valuePtr[0]);
    }
    goto LABEL_24;
  }
  if (v3 == CFStringGetTypeID())
  {
    v4 = v2;
    v35 = 0;
    v6 = objc_msgSend(v4, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v35);
    if (v6)
    {
      v7 = (const char *)v6;
      v8 = _NSIsNSCFConstantString() - 1;
      v9 = v35;
      v10 = v0;
      v11 = v7;
LABEL_11:
      v12 = 1;
LABEL_23:
      sqlite3_result_text64(v10, v11, v9, (void (__cdecl *)(void *))v8, v12);
      goto LABEL_24;
    }
    v19 = objc_msgSend(v4, "_fastCharacterContents");
    if (v19)
    {
      v20 = (const char *)v19;
      v9 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 10);
      v10 = v0;
      v11 = v20;
      v8 = -1;
LABEL_22:
      v12 = 4;
      goto LABEL_23;
    }
    v23 = objc_msgSend(v4, "length");
    v33 = 0;
    v34 = 0;
    v24 = objc_msgSend(v4, "maximumLengthOfBytesUsingEncoding:", 4);
    if (v24 <= 0x1000)
    {
      objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", valuePtr, v24, &v35, 4, 0, 0, v23, &v33);
      if (!v34)
      {
        v9 = v35;
        v11 = (const char *)valuePtr;
        v10 = v0;
        v8 = -1;
        goto LABEL_11;
      }
    }
    v25 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 4);
    v35 = v25;
    if (v25)
    {
      v26 = (const char *)sqlite3_malloc64(v25);
      if (v26)
      {
        v27 = v26;
        objc_msgSend(v4, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v26, v35, 0, 4, 0, 0, v23, &v33);
        if (v34)
          __assert_rtn("_PASSqliteSetResult", "_PASSqliteDatabase.m", 408, "remainingRange.length == 0");
        v9 = v35;
        v8 = (uint64_t)MEMORY[0x1E0DE87D0];
        v10 = v0;
        v11 = v27;
        goto LABEL_11;
      }
    }
    else
    {
      v30 = (const char *)sqlite3_malloc64(objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 10));
      if (v30)
      {
        v31 = v30;
        objc_msgSend(v4, "getCharacters:", v30);
        v9 = objc_msgSend(v4, "lengthOfBytesUsingEncoding:", 10);
        v8 = (uint64_t)MEMORY[0x1E0DE87D0];
        v10 = v0;
        v11 = v31;
        goto LABEL_22;
      }
    }
LABEL_40:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v32);
  }
  if (v3 == CFDateGetTypeID())
  {
    v4 = v2;
    v13 = (void *)MEMORY[0x1A1AFDC98]();
    if (_PASSqliteSetResult__pasOnceToken9 != -1)
      dispatch_once(&_PASSqliteSetResult__pasOnceToken9, &__block_literal_global_3368);
    objc_msgSend((id)_PASSqliteSetResult__pasExprOnceResult, "stringFromDate:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
    _PASSqliteSetResult(v0, v14);

    goto LABEL_24;
  }
  if (v3 == CFDataGetTypeID())
  {
    v4 = v2;
    v15 = objc_msgSend(v4, "length");
    if (!v15)
    {
      sqlite3_result_zeroblob64(v0, 0);
      goto LABEL_24;
    }
    v16 = v15;
    v17 = sqlite3_malloc64(v15);
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v4, "getBytes:length:", v17, v16);
      sqlite3_result_blob64(v0, v18, v16, (void (__cdecl *)(void *))MEMORY[0x1E0DE87D0]);
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_40;
  }
  if (v3 != CFNullGetTypeID())
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSqliteSetResult(sqlite3_context * _Nonnull, __strong id _Nonnull)");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("_PASSqliteDatabase.m"), 439, CFSTR("unsupported sql type %@"), objc_opt_class());

  }
  sqlite3_result_null(v0);
LABEL_25:

}

uint64_t xNext(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  void *v4;

  v1 = *(_BYTE **)(a1 + 8);
  if (v1)
  {
    if (v1[9])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel_stepOutputRow, v1, CFSTR("_PASSqliteCollections.m"), 367, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_eof"));

    }
    v2 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(v1, "stepIndexedRow");
    -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](v1);
    objc_autoreleasePoolPop(v2);
  }
  return 0;
}

uint64_t xEof(uint64_t a1)
{
  void *v1;
  _BYTE *v2;
  uint64_t v3;

  v1 = *(void **)(a1 + 8);
  if (!v1)
    return 0;
  v2 = v1;
  -[_PASSqliteCollectionsCursor stayOnOrStepToOutputRow](v2);
  v3 = v2[9];

  return v3;
}

__CFString *_PASJoinStrings(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  size_t v23;
  size_t v24;
  char *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  const __CFString *v29;
  __CFString *v30;
  const char *CStringPtr;
  CFRange v32;
  size_t v33;
  char *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  const __CFString *v38;
  __CFString *v39;
  const UniChar *CharactersPtr;
  CFRange v41;
  const __CFString *v42;
  __CFString *v43;
  const char *v44;
  CFRange v45;
  const __CFString *v46;
  __CFString *v47;
  const UniChar *v48;
  CFRange v49;
  char *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  const __CFString *v54;
  __CFString *v55;
  const char *v56;
  unint64_t v57;
  CFRange v58;
  size_t v59;
  void *v60;
  char *v61;
  uint64_t v62;
  void *v63;
  CFIndex v64;
  const __CFString *v65;
  __CFString *v66;
  const UniChar *v67;
  unint64_t v68;
  CFRange v69;
  int v71;
  int v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  uint64_t v77;
  id v78;
  size_t v79;
  char *v80;
  id v81;
  size_t v82;
  void *memptr;
  uint64_t v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    v6 = v5;
    v7 = v5 - 1;
    if (v5 == 1)
    {
      v8 = (void *)MEMORY[0x1A1AFDC98]();
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (__CFString *)objc_msgSend(v10, "copy");
LABEL_74:

      objc_autoreleasePoolPop(v8);
      goto LABEL_75;
    }
    v77 = MEMORY[0x1A1AFDC98]();
    v12 = objc_msgSend(v4, "length");
    v13 = v12 * v7;
    v82 = v12;
    v78 = v4;
    if (v12)
    {
      v14 = objc_msgSend(v4, "canBeConvertedToEncoding:", 1);
    }
    else
    {
      v4 = 0;
      v14 = 1;
    }
    v9 = v4;
    v10 = 0;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17 != v16)
      {
        if (!v10)
          v10 = (void *)objc_msgSend(v3, "mutableCopy");
        objc_msgSend(v10, "setObject:atIndexedSubscript:", v17, i);
      }
      v18 = objc_msgSend(v17, "length");
      if (v18)
      {
        v19 = v18;
        if (!v9)
          v9 = v17;
        v13 += v19;
        if ((v14 & 1) != 0)
          v14 = objc_msgSend(v17, "canBeConvertedToEncoding:", 1);
        else
          v14 = 0;
      }

    }
    if (!v13)
    {
      v11 = &stru_1E4431528;
      goto LABEL_73;
    }
    if (v13 == objc_msgSend(v9, "length"))
    {
      v11 = (__CFString *)objc_msgSend(v9, "copy");
LABEL_73:
      v8 = (void *)v77;
      v4 = v78;
      goto LABEL_74;
    }
    if (v10)
      v20 = v10;
    else
      v20 = v3;
    v21 = v20;
    v81 = v21;
    v22 = v78;
    v23 = v82;
    if ((v14 & 1) != 0)
    {
      memptr = 0;
      v84 = 0;
      v79 = v13 + 1;
      if (v13 + 1 <= 0x400)
      {
        MEMORY[0x1E0C80A78](v21);
        v25 = (char *)&v74 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
        bzero(v25, v24);
        v80 = v25;
        memptr = v25;
        LOBYTE(v84) = 1;
        goto LABEL_30;
      }
      v71 = malloc_type_posix_memalign(&memptr, 8uLL, v13 + 1, 0x2F5DE5DAuLL);
      LOBYTE(v84) = 0;
      if (!v71)
      {
        v23 = v82;
        v80 = (char *)memptr;
LABEL_30:
        v75 = v84;
        objc_msgSend(v81, "objectAtIndexedSubscript:", 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "length");
        v28 = v27;
        v29 = v26;
        v30 = (__CFString *)v29;
        if (v27)
        {
          CStringPtr = CFStringGetCStringPtr(v29, 0x600u);
          if (v27 > v13)
            goto LABEL_76;
          v32.location = (CFIndex)CStringPtr;
          if (CStringPtr)
          {
            memcpy(v80, CStringPtr, v27);
          }
          else
          {
            v32.length = v27;
            CFStringGetBytes(v30, v32, 0x600u, 0, 0, (UInt8 *)v80, v27, 0);
          }
        }

        v42 = v22;
        v43 = (__CFString *)v42;
        if (!v23)
          goto LABEL_51;
        v44 = CFStringGetCStringPtr(v42, 0x600u);
        v28 = v27 + v23;
        if (v27 + v23 <= v13)
        {
          v45.location = (CFIndex)v44;
          if (v44)
          {
            memcpy(&v80[v27], v44, v23);
          }
          else
          {
            v45.length = v23;
            CFStringGetBytes(v43, v45, 0x600u, 0, 0, (UInt8 *)&v80[v27], v23, 0);
          }
LABEL_51:
          v76 = v30;

          v50 = &v80[v27];
          v51 = 1;
          while (1)
          {
            objc_msgSend(v81, "objectAtIndexedSubscript:", v51);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "length");
            v54 = v52;
            v55 = (__CFString *)v54;
            if (v53)
            {
              v56 = CFStringGetCStringPtr(v54, 0x600u);
              v57 = v53 + v28;
              if (v53 + v28 > v13)
                goto LABEL_76;
              v58.location = (CFIndex)v56;
              if (v56)
              {
                memcpy(&v80[v28], v56, v53);
              }
              else
              {
                v58.length = v53;
                CFStringGetBytes(v55, v58, 0x600u, 0, 0, (UInt8 *)&v80[v28], v53, 0);
              }
            }
            else
            {
              v57 = v28;
            }

            if (v57 == v13)
              break;
            ++v51;
            v59 = v82;
            memcpy(&v80[v57], v50, v82);
            v28 = v57 + v59;

          }
          v80[v13] = 0;
          v60 = (void *)MEMORY[0x1E0CB3940];
LABEL_72:
          objc_msgSend(v60, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:");
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

          goto LABEL_73;
        }
LABEL_76:
        __assert_rtn("appendASCII", "_PASStringUtil.m", 362, "*destCursor + len <= destLen");
      }
LABEL_82:
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v73);
    }
    memptr = 0;
    v84 = 0;
    v75 = 2 * v13;
    if (((2 * v13) | 1) > 0x400)
    {
      v72 = malloc_type_posix_memalign(&memptr, 8uLL, 2 * v13, 0x2D4962CFuLL);
      LOBYTE(v84) = 0;
      if (v72)
        goto LABEL_82;
      v23 = v82;
      v80 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](v21);
      v34 = (char *)&v74 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v34, v33);
      v80 = v34;
      memptr = v34;
      LOBYTE(v84) = 1;
    }
    objc_msgSend(v81, "objectAtIndexedSubscript:", 0, v84);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "length");
    v37 = v36;
    v38 = v35;
    v39 = (__CFString *)v38;
    if (v36)
    {
      CharactersPtr = CFStringGetCharactersPtr(v38);
      if (v36 > v13)
        goto LABEL_77;
      v41.location = (CFIndex)CharactersPtr;
      if (CharactersPtr)
      {
        memcpy(v80, CharactersPtr, 2 * v36);
      }
      else
      {
        v41.length = v36;
        CFStringGetCharacters(v39, v41, (UniChar *)v80);
      }
    }

    v46 = v22;
    v47 = (__CFString *)v46;
    v79 = 2 * v23;
    if (!v23)
      goto LABEL_62;
    v48 = CFStringGetCharactersPtr(v46);
    v37 = v36 + v23;
    if (v36 + v23 <= v13)
    {
      v49.location = (CFIndex)v48;
      if (v48)
      {
        memcpy(&v80[2 * v36], v48, v79);
      }
      else
      {
        v49.length = v23;
        CFStringGetCharacters(v47, v49, (UniChar *)&v80[2 * v36]);
      }
LABEL_62:
      v76 = v39;

      v61 = &v80[2 * v36];
      v62 = 1;
      while (1)
      {
        objc_msgSend(v81, "objectAtIndexedSubscript:", v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "length");
        v65 = v63;
        v66 = (__CFString *)v65;
        if (v64)
        {
          v67 = CFStringGetCharactersPtr(v65);
          v68 = v64 + v37;
          if (v64 + v37 > v13)
            goto LABEL_77;
          v69.location = (CFIndex)v67;
          if (v67)
          {
            memcpy(&v80[2 * v37], v67, 2 * v64);
          }
          else
          {
            v69.length = v64;
            CFStringGetCharacters(v66, v69, (UniChar *)&v80[2 * v37]);
          }
        }
        else
        {
          v68 = v37;
        }

        if (v68 == v13)
          break;
        ++v62;
        memcpy(&v80[2 * v68], v61, v79);
        v37 = v68 + v82;

      }
      v60 = (void *)MEMORY[0x1E0CB3940];
      goto LABEL_72;
    }
LABEL_77:
    __assert_rtn("appendUnicode", "_PASStringUtil.m", 380, "*destCursor + len <= destLen");
  }
  v11 = &stru_1E4431528;
LABEL_75:

  return v11;
}

void releaseObjcObject(void *a1)
{
  id v2;
  int v3;
  id v4;
  __int16 v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v3 = 138412546;
    v4 = (id)objc_opt_class();
    v5 = 2048;
    v6 = a1;
    v2 = v4;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "#passqlitestatement Releasing %@ %p", (uint8_t *)&v3, 0x16u);

  }
}

void sub_1A096683C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0967B24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A0967BA4(void *a1)
{
  objc_begin_catch(a1);
  objc_terminate();
}

void sub_1A0967BB0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void _PASIterateLongChars(void *a1, void *a2)
{
  __CFString *v3;
  void (**v4)(id, _QWORD, UniChar *, uint64_t, uint64_t);
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  CFIndex v9;
  UniChar v10;
  uint64_t v11;
  int64_t v12;
  CFIndex v13;
  UniChar v14;
  uint64_t v15;
  CFIndex v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  UniChar v21;
  UniChar v22;
  UniChar buffer[8];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __CFString *v31;
  const UniChar *v32;
  const char *v33;
  uint64_t v34;
  CFIndex v35;
  uint64_t v36;
  uint64_t v37;
  CFRange v38;
  CFRange v39;

  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    *(_OWORD *)buffer = 0u;
    v24 = 0u;
    Length = CFStringGetLength(v3);
    v31 = v3;
    v34 = 0;
    v35 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    v32 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    v33 = CStringPtr;
    v36 = 0;
    v37 = 0;
    if (Length >= 1)
    {
      v8 = 0;
      do
      {
        if (v8 < 0 || (v9 = v35, v35 <= v8))
        {
          v10 = 0;
        }
        else if (v32)
        {
          v10 = v32[v34 + v8];
        }
        else if (v33)
        {
          v10 = v33[v34 + v8];
        }
        else
        {
          if (v37 <= v8 || (v17 = v36, v36 > v8))
          {
            v18 = v8 - 4;
            if ((unint64_t)v8 < 4)
              v18 = 0;
            if (v18 + 64 < v35)
              v9 = v18 + 64;
            v36 = v18;
            v37 = v9;
            v38.location = v34 + v18;
            v38.length = v9 - v18;
            CFStringGetCharacters(v31, v38, buffer);
            v17 = v36;
          }
          v10 = buffer[v8 - v17];
        }
        v21 = v10;
        v22 = 0;
        v11 = v10;
        if (v10 >> 10 == 54 && v8 < Length - 1 && v8 >= -1 && (v12 = v8 + 1, v13 = v35, v35 > v8 + 1))
        {
          if (v32)
          {
            v14 = v32[v34 + v12];
          }
          else if (v33)
          {
            v14 = v33[v34 + v12];
          }
          else
          {
            if (v37 <= v12 || (v19 = v36, v36 > v12))
            {
              v20 = v8 - 3;
              if ((unint64_t)v12 < 4)
                v20 = 0;
              if (v20 + 64 < v35)
                v13 = v20 + 64;
              v36 = v20;
              v37 = v13;
              v39.location = v34 + v20;
              v39.length = v13 - v20;
              CFStringGetCharacters(v31, v39, buffer);
              v19 = v36;
            }
            v14 = buffer[v12 - v19];
          }
          v22 = v14;
          v15 = v8;
          if (v14 >> 10 == 55)
          {
            v11 = (v21 << 10) + v14 - 56613888;
            v15 = v8 + 1;
          }
        }
        else
        {
          v15 = v8;
        }
        v16 = v15 + 1;
        v4[2](v4, v11, &v21, v8, v15 + 1 - v8);
        v8 = v16;
      }
      while (v16 < Length);
    }
  }

}

void sub_1A0968148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A096866C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A09688B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void __getLockStateChangedQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("_PASDeviceState.lockStateChanged", v0);
  v2 = (void *)getLockStateChangedQueue_queue;
  getLockStateChangedQueue_queue = (uint64_t)v1;

}

id _PASKeepOnlyCharacterSet(void *a1, const __CFCharacterSet *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  id v25;
  void *v26;
  id v28;
  UniChar buffer[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFStringRef theString;
  const UniChar *v38;
  const char *v39;
  uint64_t v40;
  CFIndex v41;
  int64_t v42;
  int64_t v43;
  CFRange v44;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    v7 = (__CFString *)v3;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      *(_OWORD *)buffer = 0u;
      v30 = 0u;
      Length = CFStringGetLength(v7);
      theString = v7;
      v40 = 0;
      v41 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      v38 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      v28 = v3;
      v42 = 0;
      v43 = 0;
      v39 = CStringPtr;
      if (Length < 1)
      {
        v14 = 0;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 64;
        do
        {
          if ((unint64_t)v13 >= 4)
            v16 = 4;
          else
            v16 = v13;
          v17 = v41;
          if (v41 <= v13)
          {
            v18 = 0;
          }
          else if (v38)
          {
            v18 = v38[v13 + v40];
          }
          else if (v39)
          {
            v18 = v39[v40 + v13];
          }
          else
          {
            v19 = v42;
            if (v43 <= v13 || v42 > v13)
            {
              v21 = v16 + v12;
              v22 = v15 - v16;
              v23 = v13 - v16;
              v24 = v23 + 64;
              if (v23 + 64 >= v41)
                v24 = v41;
              v42 = v23;
              v43 = v24;
              if (v41 >= v22)
                v17 = v22;
              v44.length = v17 + v21;
              v44.location = v23 + v40;
              CFStringGetCharacters(theString, v44, buffer);
              v19 = v42;
            }
            v18 = buffer[v13 - v19];
          }
          if (CFCharacterSetIsCharacterMember(a2, v18))
            v6[v14++] = v18;
          ++v13;
          --v12;
          ++v15;
        }
        while (Length != v13);
      }
      v3 = v28;
    }
    else
    {
      v14 = 0;
    }

    if (v14 == v5)
    {
      free(v6);
      v25 = (id)-[__CFString copy](v7, "copy");
    }
    else
    {
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v6, v14, 1);
    }
  }
  else
  {
    v25 = v3;
  }
  v26 = v25;

  return v26;
}

id _PASRemoveCharacterSet(void *a1, const __CFCharacterSet *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _WORD *v6;
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  UniChar v18;
  int64_t v19;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  id v25;
  void *v26;
  id v28;
  UniChar buffer[8];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CFStringRef theString;
  const UniChar *v38;
  const char *v39;
  uint64_t v40;
  CFIndex v41;
  int64_t v42;
  int64_t v43;
  CFRange v44;

  v3 = a1;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = v4;
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    v7 = (__CFString *)v3;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      *(_OWORD *)buffer = 0u;
      v30 = 0u;
      Length = CFStringGetLength(v7);
      theString = v7;
      v40 = 0;
      v41 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v7);
      CStringPtr = 0;
      v38 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
      v28 = v3;
      v42 = 0;
      v43 = 0;
      v39 = CStringPtr;
      if (Length < 1)
      {
        v14 = 0;
      }
      else
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 64;
        do
        {
          if ((unint64_t)v13 >= 4)
            v16 = 4;
          else
            v16 = v13;
          v17 = v41;
          if (v41 <= v13)
          {
            v18 = 0;
          }
          else if (v38)
          {
            v18 = v38[v13 + v40];
          }
          else if (v39)
          {
            v18 = v39[v40 + v13];
          }
          else
          {
            v19 = v42;
            if (v43 <= v13 || v42 > v13)
            {
              v21 = v16 + v12;
              v22 = v15 - v16;
              v23 = v13 - v16;
              v24 = v23 + 64;
              if (v23 + 64 >= v41)
                v24 = v41;
              v42 = v23;
              v43 = v24;
              if (v41 >= v22)
                v17 = v22;
              v44.length = v17 + v21;
              v44.location = v23 + v40;
              CFStringGetCharacters(theString, v44, buffer);
              v19 = v42;
            }
            v18 = buffer[v13 - v19];
          }
          if (!CFCharacterSetIsCharacterMember(a2, v18))
            v6[v14++] = v18;
          ++v13;
          --v12;
          ++v15;
        }
        while (Length != v13);
      }
      v3 = v28;
    }
    else
    {
      v14 = 0;
    }

    if (v14 == v5)
    {
      free(v6);
      v25 = (id)-[__CFString copy](v7, "copy");
    }
    else
    {
      v25 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v6, v14, 1);
    }
  }
  else
  {
    v25 = v3;
  }
  v26 = v25;

  return v26;
}

unint64_t _PASMurmur3_x64_128(unsigned __int16 *a1, unint64_t a2, unsigned int a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unsigned int v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unsigned __int8 v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  unsigned int v73;

  v3 = a3;
  v4 = a2 & 0xF;
  v72 = a2;
  v73 = a2 & 0xF;
  if (a2 >= 0x10)
  {
    *((_QWORD *)&v16 + 1) = (0x4CF5AD432745937FLL
                           * ((0x88A129EA80000000 * *(_QWORD *)a1) | ((0x87C37B91114253D5 * *(_QWORD *)a1) >> 33))) ^ v3;
    *(_QWORD *)&v16 = 0x4CF5AD432745937FLL
                    * ((0x88A129EA80000000 * *(_QWORD *)a1) | ((0x87C37B91114253D5 * *(_QWORD *)a1) >> 33));
    v17 = 5 * ((v16 >> 37) + v3);
    *((_QWORD *)&v16 + 1) = (0x87C37B91114253D5
                           * ((0x4E8B26FE00000000 * *((_QWORD *)a1 + 1)) | ((unint64_t)(0x4CF5AD432745937FLL
                                                                                               * *((_QWORD *)a1 + 1)) >> 31))) ^ v3;
    *(_QWORD *)&v16 = 0x87C37B91114253D5
                    * ((0x4E8B26FE00000000 * *((_QWORD *)a1 + 1)) | ((unint64_t)(0x4CF5AD432745937FLL
                                                                                        * *((_QWORD *)a1 + 1)) >> 31));
    v3 = v17 + 1390208809;
    v7 = 5 * (v17 + 1390208809 + (v16 >> 33)) + 944331445;
    v8 = (uint64_t *)((char *)a1 + (a2 & 0xFFFFFFFFFFFFFFF0));
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFF0) >= 17)
    {
      v18 = (uint64_t *)(a1 + 8);
      do
      {
        v20 = *v18;
        v19 = v18[1];
        v18 += 2;
        v3 = 5
           * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v20) | ((0x87C37B91114253D5 * v20) >> 33))) ^ v3, 37)+ v7)+ 1390208809;
        v7 = 5
           * (v3
            + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v19) | ((unint64_t)(0x4CF5AD432745937FLL * v19) >> 31))) ^ v7, 33))+ 944331445;
      }
      while (v18 < v8);
    }
    LOBYTE(v5) = 0;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    v6 = 0;
    switch(v4)
    {
      case 1uLL:
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LOBYTE(v5) = *(_BYTE *)v8;
        goto LABEL_36;
      case 2uLL:
        LOBYTE(v15) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LODWORD(v5) = *(unsigned __int16 *)v8;
        LODWORD(v14) = v5 >> 8;
        goto LABEL_36;
      case 3uLL:
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LODWORD(v5) = *(unsigned __int16 *)v8 | (*((unsigned __int8 *)v8 + 2) << 16);
        LODWORD(v14) = v5 >> 8;
        LOBYTE(v15) = *((_BYTE *)v8 + 2);
        goto LABEL_36;
      case 4uLL:
        LOBYTE(v69) = 0;
        LOBYTE(v70) = 0;
        v68 = 0;
        LODWORD(v5) = *(_DWORD *)v8;
        LODWORD(v14) = *(_DWORD *)v8 >> 8;
        LODWORD(v15) = HIWORD(*(_DWORD *)v8);
        LODWORD(v47) = HIBYTE(*(_DWORD *)v8);
        goto LABEL_32;
      case 5uLL:
        v68 = 0;
        LOBYTE(v69) = 0;
        v5 = *(unsigned int *)v8;
        v70 = *((unsigned __int8 *)v8 + 4);
        v48 = v5 | (v70 << 32);
        v14 = v48 >> 8;
        v15 = v48 >> 16;
        v47 = v48 >> 24;
LABEL_32:
        LOBYTE(v71) = v47;
        goto LABEL_36;
      case 6uLL:
        LODWORD(v21) = *((unsigned __int16 *)v8 + 2);
        v5 = *(unsigned int *)v8;
        v49 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 2) << 32);
        v15 = v49 >> 16;
        v23 = v49 >> 24;
        v68 = 0;
        v69 = v21 >> 8;
        v14 = v49 >> 8;
LABEL_34:
        LOBYTE(v70) = v21;
        LOBYTE(v71) = v23;
        goto LABEL_36;
      case 7uLL:
        v50 = *((unsigned __int16 *)v8 + 2) | (*((unsigned __int8 *)v8 + 6) << 16);
        v5 = *(unsigned int *)v8;
        v51 = v5 & 0xFF000000FFFFFFFFLL | ((*(_QWORD *)&v50 & 0xFFFFFFLL) << 32);
        v15 = v51 >> 16;
        v52 = v51 >> 24;
        v68 = *((_BYTE *)v8 + 6);
        v14 = v51 >> 8;
        LOWORD(v70) = *((_WORD *)v8 + 2);
        LOBYTE(v71) = v52;
        v69 = v50 >> 8;
LABEL_36:
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
        break;
      case 8uLL:
        goto LABEL_45;
      case 9uLL:
        LOBYTE(v9) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LOBYTE(v5) = *((_BYTE *)v8 + 8);
        goto LABEL_45;
      case 0xAuLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = *((unsigned __int16 *)v8 + 4);
        LODWORD(v9) = v5 >> 8;
        goto LABEL_45;
      case 0xBuLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = *((unsigned __int16 *)v8 + 4) | (*((unsigned __int8 *)v8 + 10) << 16);
        LODWORD(v9) = v5 >> 8;
        LOBYTE(v10) = *((_BYTE *)v8 + 10);
        goto LABEL_45;
      case 0xCuLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = *((_DWORD *)v8 + 2);
        LODWORD(v9) = v5 >> 8;
        LODWORD(v10) = WORD1(v5);
        LODWORD(v11) = BYTE3(v5);
        goto LABEL_45;
      case 0xDuLL:
        LOBYTE(v13) = 0;
        v6 = 0;
        v12 = *((unsigned __int8 *)v8 + 12);
        v5 = *((unsigned int *)v8 + 2);
        v53 = v5 | (v12 << 32);
        v9 = v53 >> 8;
        v10 = v53 >> 16;
        v11 = v53 >> 24;
        goto LABEL_45;
      case 0xEuLL:
        v6 = 0;
        LODWORD(v12) = *((unsigned __int16 *)v8 + 6);
        v5 = *((unsigned int *)v8 + 2);
        v54 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 6) << 32);
        v9 = v54 >> 8;
        v10 = v54 >> 16;
        v11 = v54 >> 24;
        v13 = v12 >> 8;
        goto LABEL_45;
      case 0xFuLL:
        LODWORD(v12) = *((unsigned __int16 *)v8 + 6) | (*((unsigned __int8 *)v8 + 14) << 16);
        v5 = *((unsigned int *)v8 + 2);
        v55 = v5 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
        v9 = v55 >> 8;
        v10 = v55 >> 16;
        v11 = v55 >> 24;
        v13 = v12 >> 8;
        v6 = ((v12 & 0xFFFFFF) << 32) & 0xFF000000000000;
        goto LABEL_45;
      default:
        v6 = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v5) = 0;
        v32 = 0;
        LOBYTE(v33) = 0;
        LOBYTE(v34) = 0;
        LOBYTE(v35) = 0;
        LOBYTE(v36) = 0;
        LOBYTE(v37) = 0;
        LOBYTE(v38) = 0;
        LOBYTE(v39) = 0;
        v40 = 0;
        v41 = 0;
        v42 = 0;
        v43 = 0;
        v44 = 0;
        v45 = 0;
        v46 = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v14) = 0;
        if (v73 >= 8)
          goto LABEL_46;
        break;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
    v6 = 0;
    v7 = v3;
    v8 = (uint64_t *)a1;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    switch(v4)
    {
      case 1uLL:
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LOBYTE(v5) = *(_BYTE *)a1;
        goto LABEL_13;
      case 2uLL:
        LOBYTE(v15) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LODWORD(v5) = *a1;
        LODWORD(v14) = v5 >> 8;
        goto LABEL_13;
      case 3uLL:
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        LODWORD(v5) = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v14) = v5 >> 8;
        LOBYTE(v15) = *((_BYTE *)a1 + 2);
        goto LABEL_13;
      case 4uLL:
        LOBYTE(v69) = 0;
        LOBYTE(v70) = 0;
        v68 = 0;
        LODWORD(v5) = *(_DWORD *)a1;
        LODWORD(v14) = *(_DWORD *)a1 >> 8;
        LODWORD(v15) = HIWORD(*(_DWORD *)a1);
        v71 = HIBYTE(*(_DWORD *)a1);
LABEL_13:
        v7 = v3;
        goto LABEL_36;
      case 5uLL:
        v68 = 0;
        LOBYTE(v69) = 0;
        v21 = *((unsigned __int8 *)a1 + 4);
        v5 = *(unsigned int *)a1;
        v22 = v5 | (v21 << 32);
        v14 = v22 >> 8;
        v15 = v22 >> 16;
        v23 = v22 >> 24;
        v7 = v3;
        goto LABEL_34;
      case 6uLL:
        v5 = *(unsigned int *)a1;
        v24 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)a1[2] << 32);
        v14 = v24 >> 8;
        v15 = v24 >> 16;
        v25 = v24 >> 24;
        v7 = v3;
        LOWORD(v70) = a1[2];
        LOBYTE(v71) = v25;
        v68 = 0;
        v69 = BYTE1(v70);
        goto LABEL_36;
      case 7uLL:
        v26 = a1[2] | (*((unsigned __int8 *)a1 + 6) << 16);
        v5 = *(unsigned int *)a1;
        v27 = v5 & 0xFF000000FFFFFFFFLL | ((*(_QWORD *)&v26 & 0xFFFFFFLL) << 32);
        v14 = v27 >> 8;
        v15 = v27 >> 16;
        v28 = v27 >> 24;
        v7 = v3;
        LOWORD(v70) = a1[2];
        LOBYTE(v71) = v28;
        v68 = *((_BYTE *)a1 + 6);
        v69 = v26 >> 8;
        goto LABEL_36;
      case 8uLL:
        break;
      case 9uLL:
        LOBYTE(v9) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LOBYTE(v5) = *((_BYTE *)a1 + 8);
        goto LABEL_21;
      case 0xAuLL:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = a1[4];
        LODWORD(v9) = v5 >> 8;
        goto LABEL_21;
      case 0xBuLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = a1[4] | (*((unsigned __int8 *)a1 + 10) << 16);
        LODWORD(v9) = v5 >> 8;
        LOBYTE(v10) = *((_BYTE *)a1 + 10);
        goto LABEL_21;
      case 0xCuLL:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v6 = 0;
        LODWORD(v5) = *((_DWORD *)a1 + 2);
        LODWORD(v9) = v5 >> 8;
        LODWORD(v10) = WORD1(v5);
        LODWORD(v11) = BYTE3(v5);
LABEL_21:
        v7 = v3;
        v8 = (uint64_t *)a1;
        break;
      case 0xDuLL:
        LOBYTE(v13) = 0;
        v6 = 0;
        v12 = *((unsigned __int8 *)a1 + 12);
        v5 = *((unsigned int *)a1 + 2);
        v29 = v5 | (v12 << 32);
        v9 = v29 >> 8;
        v10 = v29 >> 16;
        v11 = v29 >> 24;
        v7 = v3;
        v8 = (uint64_t *)a1;
        break;
      case 0xEuLL:
        v6 = 0;
        v5 = *((unsigned int *)a1 + 2);
        LODWORD(v12) = a1[6];
        v30 = v5 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)a1[6] << 32);
        v9 = v30 >> 8;
        v10 = v30 >> 16;
        v11 = v30 >> 24;
        v13 = v12 >> 8;
        goto LABEL_25;
      case 0xFuLL:
        LODWORD(v12) = a1[6] | (*((unsigned __int8 *)a1 + 14) << 16);
        v5 = *((unsigned int *)a1 + 2);
        v31 = v5 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
        v9 = v31 >> 8;
        v10 = v31 >> 16;
        v11 = v31 >> 24;
        v13 = v12 >> 8;
        v6 = ((v12 & 0xFFFFFF) << 32) & 0xFF000000000000;
LABEL_25:
        v7 = v3;
        v8 = (uint64_t *)a1;
        break;
      default:
        v7 = v3;
        LOBYTE(v14) = 0;
        LOBYTE(v15) = 0;
        LOBYTE(v70) = 0;
        LOBYTE(v71) = 0;
        v68 = 0;
        LOBYTE(v69) = 0;
        goto LABEL_36;
    }
LABEL_45:
    v39 = *v8;
    v33 = HIWORD(*v8);
    v32 = v39 & 0xFF00000000000000;
    v34 = v39 >> 40;
    v35 = HIDWORD(v39);
    v36 = v39 >> 24;
    v37 = v39 >> 16;
    v38 = v39 >> 8;
LABEL_46:
    v14 = v32 | v39 | (unint64_t)(unsigned __int16)(v38 << 8) | ((unint64_t)v37 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v36 << 24) | ((unint64_t)v35 << 32) | ((unint64_t)v34 << 40) | ((unint64_t)v33 << 48);
    v3 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v14) | ((0x87C37B91114253D5 * v14) >> 33));
    v40 = v6;
    v41 = v13;
    v42 = v12;
    v43 = v11;
    v44 = v10;
    v45 = v9;
    v46 = v5;
    v68 = v33;
    LOBYTE(v69) = v34;
    LOBYTE(v70) = v35;
    LOBYTE(v71) = v36;
    LOBYTE(v15) = v37;
    LOBYTE(v14) = v38;
    LOBYTE(v5) = v39;
  }
  v56 = v72;
  switch(v73)
  {
    case 1u:
      v57 = v5;
      goto LABEL_56;
    case 2u:
      v58 = v5 | ((unint64_t)v14 << 8);
      goto LABEL_52;
    case 3u:
      v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16);
      goto LABEL_52;
    case 4u:
      v58 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v71 << 24);
LABEL_52:
      v59 = 0x87C37B91114253D5 * v58;
      v60 = 0x88A129EA80000000 * v58;
      goto LABEL_57;
    case 5u:
      v57 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v71 << 24) | ((unint64_t)v70 << 32);
      goto LABEL_56;
    case 6u:
      v57 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v71 << 24) | ((unint64_t)v70 << 32) | ((unint64_t)v69 << 40);
      goto LABEL_56;
    case 7u:
      v57 = v5 | (unint64_t)(unsigned __int16)(v14 << 8) | ((unint64_t)v15 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v71 << 24) | ((unint64_t)v70 << 32) | ((unint64_t)v69 << 40) | ((unint64_t)v68 << 48);
LABEL_56:
      v59 = 0x87C37B91114253D5 * v57;
      v60 = 0x88A129EA80000000 * v57;
LABEL_57:
      v3 ^= 0x4CF5AD432745937FLL * (v60 | (v59 >> 33));
      break;
    case 8u:
      break;
    case 9u:
      v61 = v46;
      goto LABEL_65;
    case 0xAu:
      v61 = v46 | ((unint64_t)v45 << 8);
      goto LABEL_65;
    case 0xBu:
      v61 = v46 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16);
      goto LABEL_65;
    case 0xCu:
      v61 = v46 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v43 << 24);
      goto LABEL_65;
    case 0xDu:
      v61 = v46 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v43 << 24) | ((unint64_t)v42 << 32);
      goto LABEL_65;
    case 0xEu:
      v61 = v46 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v43 << 24) | ((unint64_t)v42 << 32) | ((unint64_t)v41 << 40);
      goto LABEL_65;
    case 0xFu:
      v61 = v46 | (unint64_t)(unsigned __int16)(v45 << 8) | ((unint64_t)v44 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v43 << 24) | ((unint64_t)v42 << 32) | ((unint64_t)v41 << 40) | v40;
LABEL_65:
      v7 ^= 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v61) | ((0x4CF5AD432745937FLL * v61) >> 31));
      break;
    default:
      v56 = v72;
      break;
  }
  v62 = v7 ^ v56;
  v63 = v62 + (v3 ^ v56);
  v64 = v63 + v62;
  v65 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v63 ^ (v63 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v63 ^ (v63 >> 33))) >> 33));
  v66 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v64 ^ (v64 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v64 ^ (v64 >> 33))) >> 33));
  return (v66 ^ (v66 >> 33)) + (v65 ^ (v65 >> 33));
}

__CFString *_PASCollapseWhitespaceAndStrip(void *a1)
{
  __CFString *v1;
  unint64_t v2;
  unint64_t v3;
  size_t v4;
  char *v5;
  void *v6;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v10;
  int64_t v11;
  int64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  CFIndex v24;
  char v25;
  uint64_t v26;
  int v27;
  unint64_t v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v32;
  unint64_t v33;
  _OWORD buffer[8];
  __CFString *v35;
  const UniChar *v36;
  const char *v37;
  uint64_t v38;
  CFIndex v39;
  int64_t v40;
  int64_t v41;
  uint64_t v42;
  CFRange v43;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  if (v2)
  {
    v3 = v2;
    if (v2 > 0x1FF)
    {
      v5 = (char *)malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
      if (!v5)
        goto LABEL_66;
    }
    else
    {
      MEMORY[0x1E0C80A78](v2);
      v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
    }
    v1 = v1;
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      memset(buffer, 0, sizeof(buffer));
      Length = CFStringGetLength(v1);
      v35 = v1;
      v38 = 0;
      v39 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v1);
      CStringPtr = 0;
      v36 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
      v33 = v3;
      v40 = 0;
      v41 = 0;
      v37 = CStringPtr;
      if (Length >= 1)
      {
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 64;
        v16 = 1;
        while (1)
        {
          if ((unint64_t)v12 >= 4)
            v17 = 4;
          else
            v17 = v12;
          v18 = v39;
          if (v39 <= v12)
          {
            v19 = 0;
          }
          else
          {
            if (v36)
            {
              v19 = v36[v12 + v38];
            }
            else if (v37)
            {
              v19 = v37[v38 + v12];
            }
            else
            {
              if (v41 <= v12 || v11 > v12)
              {
                v21 = v17 + v10;
                v22 = v15 - v17;
                v23 = v12 - v17;
                v24 = v23 + 64;
                if (v23 + 64 >= v39)
                  v24 = v39;
                v40 = v23;
                v41 = v24;
                if (v39 >= v22)
                  v18 = v22;
                v43.length = v18 + v21;
                v43.location = v23 + v38;
                CFStringGetCharacters(v35, v43, (UniChar *)buffer);
                v11 = v40;
              }
              v19 = *((_WORD *)buffer + v12 - v11);
            }
            if (v19 == 10 || v19 == 32)
            {
LABEL_47:
              if ((v16 & 1) == 0)
              {
                *(_WORD *)&v5[2 * v14++] = 32;
                v13 = v13 & 1 | (v19 != 32);
              }
              v16 = 1;
              goto LABEL_51;
            }
          }
          if ((unsigned __int16)(v19 - 48) >= 0xAu && (unsigned __int16)((v19 & 0xFFDF) - 65) >= 0x1Au)
          {
            if (v19 > 0x9Fu)
            {
              if (v19 == 160 || v19 == 5760)
                goto LABEL_47;
            }
            else if (v19 == 9 || v19 == 32)
            {
              goto LABEL_47;
            }
            if ((unsigned __int16)(v19 - 0x2000) < 0xCu)
              goto LABEL_47;
            if (v19 > 0x2027u)
            {
              if (v19 - 8232 <= 0x37 && ((1 << (v19 - 40)) & 0x80000000000083) != 0
                || v19 == 12288)
              {
                goto LABEL_47;
              }
            }
            else if (v19 - 10 < 4 || v19 == 133)
            {
              goto LABEL_47;
            }
          }
          v16 = 0;
          *(_WORD *)&v5[2 * v14++] = v19;
LABEL_51:
          ++v12;
          --v10;
          ++v15;
          if (Length == v12)
            goto LABEL_55;
        }
      }
      v14 = 0;
      v13 = 0;
LABEL_55:
      v25 = v13;
      v3 = v33;
    }
    else
    {
      v14 = 0;
      v25 = 0;
    }

    v26 = v14 - 1;
    while (v26 != -1)
    {
      v27 = *(unsigned __int16 *)&v5[2 * v26--];
      if (v27 != 32)
      {
        v28 = v26 + 2;
        if ((v25 & 1) != 0)
          goto LABEL_63;
        goto LABEL_62;
      }
    }
    v28 = 0;
    if ((v25 & 1) != 0)
      goto LABEL_63;
LABEL_62:
    if (v28 >= -[__CFString length](v1, "length"))
      goto LABEL_64;
LABEL_63:
    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharacters:length:", v5, v28);

    v1 = (__CFString *)v29;
LABEL_64:
    if (v3 >= 0x200)
      free(v5);
  }
LABEL_66:
  v30 = v1;

  return v30;
}

uint64_t AsyncFIFOQueue.__allocating_init(priority:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  AsyncFIFOQueue.init(priority:)(a1);
  return v2;
}

uint64_t AsyncFIFOQueue.init(priority:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;

  v36 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9740);
  MEMORY[0x1E0C80A78](v2);
  v35 = (uint64_t)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9748);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9768);
  v32 = *(_QWORD *)(v34 - 8);
  v8 = MEMORY[0x1E0C80A78](v34);
  v33 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31[1] = v9;
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)v31 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9758);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v31 - v16;
  v37 = v1;
  swift_defaultActor_initialize();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9750);
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  v38 = v17;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9870);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DF07B8], v4);
  v20 = v11;
  sub_1A09B3FA0();
  sub_1A096A8D0((uint64_t)v17, (uint64_t)v15, &qword_1EE5A9758);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v15, 1, v18);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v22 = v37;
    (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v37 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation, v15, v18);
    v24 = v35;
    v23 = v36;
    sub_1A096A8D0(v36, v35, &qword_1EE5A9740);
    v26 = v32;
    v25 = v33;
    v27 = v34;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v33, v20, v34);
    v28 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = 0;
    *(_QWORD *)(v29 + 24) = 0;
    (*(void (**)(unint64_t, char *, uint64_t))(v26 + 32))(v29 + v28, v25, v27);
    v30 = sub_1A096ACF4(v24, (uint64_t)&unk_1EE5A98A8, v29);
    sub_1A096AE40(v23, &qword_1EE5A9740);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v27);
    *(_QWORD *)(v22 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__task) = v30;
    sub_1A096AE40((uint64_t)v17, &qword_1EE5A9758);
    return v22;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AFE5EC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A096A854(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1A096AE40(a2, &qword_1EE5A9758);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9750);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a2, a1, v4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
}

uint64_t sub_1A096A8C8(uint64_t a1)
{
  uint64_t v1;

  return sub_1A096A854(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A096A8D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1A096A914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9760);
  v4[5] = v5;
  v4[6] = *(_QWORD *)(v5 - 8);
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1A096A978()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9768);
  sub_1A09B3F88();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_1A096AA00;
  return sub_1A09B3F94();
}

uint64_t sub_1A096AA00()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1A096AA54()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v5)(void);

  v1 = *(int **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 72) = v1;
  *(_QWORD *)(v0 + 80) = v2;
  if (!v1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    goto LABEL_5;
  }
  if ((sub_1A09B3FB8() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 8))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 40));
    sub_1A096B4B4((uint64_t)v1);
LABEL_5:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = (uint64_t (*)(void))((char *)v1 + *v1);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v4;
  *v4 = v0;
  v4[1] = sub_1A096AB10;
  return v5();
}

uint64_t sub_1A096AB10()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 72);
  v3 = *v0;
  swift_task_dealloc();
  sub_1A096B4B4(v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 64) = v4;
  *v4 = v3;
  v4[1] = sub_1A096AA00;
  return sub_1A09B3F94();
}

uint64_t sub_1A096ABAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9768);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1A096AC24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9768) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1A096ACAC;
  return sub_1A096A914(a1, v5, v6, v7);
}

uint64_t sub_1A096ACAC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A096ACF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1A09B3F58();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1A09B3F4C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1A096AE40(a1, &qword_1EE5A9740);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A09B3F40();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1A096AE40(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t AsyncFIFOQueue.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9740);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1A09B3F58();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  type metadata accessor for AsyncFIFOQueue();
  v4 = swift_allocObject();
  AsyncFIFOQueue.init(priority:)((uint64_t)v2);
  return v4;
}

uint64_t type metadata accessor for AsyncFIFOQueue()
{
  uint64_t result;

  result = qword_1EE5A9848;
  if (!qword_1EE5A9848)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t AsyncFIFOQueue.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0;
  v2 = v0 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9750);
  sub_1A09B3F70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  swift_defaultActor_destroy();
  return v1;
}

uint64_t AsyncFIFOQueue.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC16ProactiveSupport14AsyncFIFOQueue__streamContinuation;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9750);
  sub_1A09B3F70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_1A096B03C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1EE5A9480);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v10[0] = &unk_1EE5A98B8;
  v10[1] = v8;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A9750);
  sub_1A09B3F64();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1A096B114(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v5 = (uint64_t (*)(void))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v3;
  *v3 = v2;
  v3[1] = sub_1A096B4C4;
  return v5();
}

uint64_t sub_1A096B168()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A096B18C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A096B4C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE5A98B0 + dword_1EE5A98B0))(a1, v4);
}

uint64_t sub_1A096B1FC()
{
  return sub_1A09B3FAC();
}

uint64_t AsyncFIFOQueue.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1A096B234()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1A096B240()
{
  return type metadata accessor for AsyncFIFOQueue();
}

void sub_1A096B248()
{
  unint64_t v0;

  sub_1A096B2F8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AsyncFIFOQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncFIFOQueue.__allocating_init(priority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of AsyncFIFOQueue.async(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of AsyncFIFOQueue.cancel()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

void sub_1A096B2F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE5A9868)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A9870);
    v0 = sub_1A09B3F7C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE5A9868);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1A1AFE5F8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1A096B394(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1A096B3F8;
  return v6(a1);
}

uint64_t sub_1A096B3F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1A096B444(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1A096ACAC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE5A98C0 + dword_1EE5A98C0))(a1, v4);
}

uint64_t sub_1A096B4B4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void sub_1A096B4CC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  _QWORD v20[4];
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  *(_QWORD *)&v21 = a4;
  *((_QWORD *)&v21 + 1) = a5;
  v10 = sub_1A09B4000();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v20 - v12;
  v22 = MEMORY[0x1E0DEE9D8];
  v23 = MEMORY[0x1E0DEE9D8] + 32;
  v24 = xmmword_1A09B9530;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE5A98D0);
  v15 = sub_1A0970D60();
  MEMORY[0x1A1AFCEF4](&v22, a1, v14, a2, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a6, v10);
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 48))(v13, 1, a2);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if ((v16 == 1 || sub_1A09B3EA4() != 1) && (MEMORY[0x1A1AFCED0](a1, v14, a2, v15) & 1) == 0)
  {
    v22 = a1;
    v17 = sub_1A09B3EBC();
    v18 = sub_1A09B3E80();
    v20[1] = v20;
    v30 = v18;
    MEMORY[0x1E0C80A78](v18);
    v20[-4] = a2;
    v20[-3] = a3;
    v19 = v21;
    *(_OWORD *)&v20[-2] = v21;
    v20[2] = sub_1A09B3EBC();
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], v17);
    sub_1A09B3F1C();
    v20[3] = 0;
    swift_bridgeObjectRelease();
    v28 = v29;
    v22 = MEMORY[0x1E0DEDA70];
    v23 = a2;
    *(_QWORD *)&v24 = MEMORY[0x1E0DEDA90];
    *((_QWORD *)&v24 + 1) = MEMORY[0x1E0DEDA78];
    v25 = MEMORY[0x1E0DEDA80];
    v26 = a3;
    v27 = v19;
    type metadata accessor for StandardTrieNode();
  }
  swift_bridgeObjectRelease();
  v22 = a2;
  v23 = a3;
  v24 = v21;
  type metadata accessor for StringTrieNode();
}

void sub_1A096B754()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  v5 = sub_1A09B3E98();
  *(_QWORD *)(v4 - 176) = v5;
  MEMORY[0x1E0C80A78](v5);
  sub_1A09B3EBC();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], *(_QWORD *)(v4 - 208));
  sub_1A09B3F1C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 - 176) = v1;
  *(_QWORD *)(v4 - 168) = v2;
  *(_QWORD *)(v4 - 160) = v3;
  *(_QWORD *)(v4 - 152) = v0;
  type metadata accessor for StringTrieNode();
}

void sub_1A096B834(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + *(int *)(a1 + 52)) = v2;
  JUMPOUT(0x1A096B83CLL);
}

uint64_t sub_1A096B85C(uint64_t *a1, _QWORD *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  __int128 v31;
  char *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  char v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *);
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  int v54;
  char *v55;
  uint64_t v56;
  _QWORD *v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;

  v50 = a5;
  v51 = a6;
  v57 = a4;
  v52 = a1;
  v8 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v8);
  v55 = (char *)&v44 - v9;
  v46 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A98D0);
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v13 = (_OWORD *)((char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (uint64_t *)((char *)&v44 - v15);
  v17 = *(int *)(v14 + 48);
  v18 = (char *)&v44 + v17 - v15;
  v19 = (char *)a2 + v17;
  v21 = *a2;
  v20 = a2[1];
  v22 = a2[2];
  v23 = a2[3];
  *v16 = *a2;
  v16[1] = v20;
  v56 = v20;
  v16[2] = v22;
  v16[3] = v23;
  v24 = *(_QWORD *)(a3 - 8);
  v47 = *(void (**)(char *))(v24 + 16);
  v48 = v19;
  v47(v18);
  v25 = *(void (**)(char *, uint64_t))(v24 + 8);
  v53 = v21;
  swift_unknownObjectRetain();
  v25(v18, a3);
  v49 = v23;
  if (v22 == v23 >> 1)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v22 >= (uint64_t)(v23 >> 1))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v54 = *(unsigned __int8 *)(v56 + v22);
  v45 = v22 + 1;
  v26 = (_QWORD *)swift_allocObject();
  v27 = v57;
  v26[2] = a3;
  v26[3] = v27;
  v29 = v50;
  v28 = v51;
  v26[4] = v50;
  v26[5] = v28;
  v30 = (char *)v13 + *(int *)(TupleTypeMetadata2 + 48);
  v31 = *((_OWORD *)a2 + 1);
  *v13 = *(_OWORD *)a2;
  v13[1] = v31;
  ((void (*)(char *, char *, uint64_t))v47)(v30, v48, a3);
  v32 = v55;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v55, v30, a3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v32, 0, 1, a3);
  v59 = v53;
  v60 = v56;
  v61 = v45;
  v62 = v49;
  v33 = (_QWORD *)swift_allocObject();
  v34 = v57;
  v33[2] = a3;
  v33[3] = v34;
  v33[4] = v29;
  v33[5] = v28;
  v33[6] = sub_1A0972EA4;
  v33[7] = v26;
  v57 = v26;
  swift_unknownObjectRetain_n();
  v35 = v52;
  swift_isUniquelyReferenced_nonNull_native();
  v63 = *v35;
  v36 = v63;
  *v35 = 0x8000000000000000;
  sub_1A0970B2C(v54);
  if (__OFADD__(*(_QWORD *)(v36 + 16), (v37 & 1) == 0))
  {
LABEL_12:
    __break(1u);
LABEL_13:
    result = sub_1A09B40F0();
    __break(1u);
    return result;
  }
  v38 = v37;
  sub_1A0970D60();
  sub_1A09B3EBC();
  sub_1A09B4060();
  v39 = sub_1A09B4048();
  v40 = v63;
  if ((v39 & 1) != 0)
  {
    sub_1A0970B2C(v54);
    if ((v38 & 1) != (v41 & 1))
      goto LABEL_13;
  }
  *v35 = v40;
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    v42 = swift_bridgeObjectRetain();
    v63 = ((uint64_t (*)(uint64_t))v33[6])(v42);
    v58 = v54;
    sub_1A09B4054();
  }
  swift_bridgeObjectRelease();
  sub_1A09B3EE0();
  swift_release();
  swift_release();
  return swift_unknownObjectRelease_n();
}

uint64_t sub_1A096BC20()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A98D0);
  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  sub_1A0970D60();
  return sub_1A09B3E98();
}

void sub_1A096BC90()
{
  type metadata accessor for StandardTrieNode();
}

void sub_1A096BD08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v9 - v6;
  v8 = swift_bridgeObjectRetain();
  sub_1A096BDF4(v8, MEMORY[0x1E0DEDA70], v4, MEMORY[0x1E0DEDA90], MEMORY[0x1E0DEDA78], v0, v2, v1, (uint64_t)v7, v3);
}

void sub_1A096BDF4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD v46[3];

  v32 = a8;
  v37 = a7;
  *((_QWORD *)&v35 + 1) = a5;
  *(_QWORD *)&v35 = a4;
  v31 = a1;
  v36 = a10;
  v14 = sub_1A09B4000();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v30 - v16;
  *(_QWORD *)&v46[0] = sub_1A09B3E8C();
  v18 = sub_1A09B3F34();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEAF28], v18);
  sub_1A09B3EF8();
  swift_bridgeObjectRelease();
  v34 = v38;
  v46[0] = v38;
  v46[1] = v39;
  v19 = sub_1A09B4018();
  v33 = a6;
  v45 = a6;
  v20 = v31;
  v21 = MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v19, &v45);
  MEMORY[0x1A1AFCEF4](v46, v20, v19, a3, v21);
  swift_unknownObjectRelease();
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  *(_QWORD *)&v34 = a9;
  v22(v17, a9, v14);
  v23 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 48))(v17, 1, a3);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if ((v23 == 1 || sub_1A09B3EA4() != 1) && (MEMORY[0x1A1AFCED0](v20, v19, a3, v21) & 1) == 0)
  {
    *(_QWORD *)&v38 = v20;
    v24 = sub_1A09B3EBC();
    v25 = v33;
    v44 = sub_1A09B3E80();
    MEMORY[0x1E0C80A78](v44);
    v30[-8] = a2;
    v30[-7] = a3;
    v26 = *((_QWORD *)&v35 + 1);
    v30[-6] = v35;
    v30[-5] = v26;
    v27 = v37;
    v30[-4] = v25;
    v30[-3] = v27;
    v28 = v32;
    v30[-2] = v32;
    v29 = v28;
    v30[-1] = v36;
    v30[1] = sub_1A09B3EBC();
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], v24);
    sub_1A09B3F1C();
    v30[2] = 0;
    swift_bridgeObjectRelease();
    v44 = *(_QWORD *)&v46[0];
    *(_QWORD *)&v38 = a2;
    *((_QWORD *)&v38 + 1) = a3;
    v39 = v35;
    v40 = v25;
    v41 = v37;
    v42 = v29;
    v43 = v36;
    type metadata accessor for StandardTrieNode();
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)&v38 = a2;
  *((_QWORD *)&v38 + 1) = a3;
  v39 = v35;
  v40 = v33;
  v41 = v37;
  v42 = v32;
  v43 = v36;
  type metadata accessor for StandardTrieNode();
}

void sub_1A096C174(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v11;

  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  v11 = sub_1A09B3E98();
  *(_QWORD *)(v9 - 312) = &a9;
  *(_QWORD *)(v9 - 232) = v11;
  MEMORY[0x1E0C80A78](v11);
  sub_1A09B3EBC();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], *(_QWORD *)(v9 - 328));
  sub_1A09B3F1C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(*(_QWORD *)(v9 - 288) + *(int *)(a1 + 84)) = *(_QWORD *)(v9 - 224);
  JUMPOUT(0x1A096C270);
}

uint64_t sub_1A096C290@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v40 = a6;
  v11 = sub_1A09B4000();
  v33 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  MEMORY[0x1E0C80A78](v11);
  v36 = (char *)&v32 - v12;
  v13 = *(_QWORD *)(a5 + 16);
  v14 = sub_1A09B4000();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v32 - v17;
  v19 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v16);
  v41 = (char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = a1;
  v38 = a4;
  v46 = a1;
  v47 = a2;
  v21 = a2;
  v35 = a3;
  v48 = a3;
  v49 = a4;
  v22 = sub_1A09B4018();
  v23 = MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF88], v22);
  sub_1A09B3FD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v18, 1, v13) == 1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
    v24 = sub_1A09B4000();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v40, v39, v24);
  }
  v32 = v23;
  v26 = v21;
  v27 = v37;
  v28 = v38;
  v29 = v36;
  (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v41, v18, v13);
  v30 = *(_QWORD *)(v39 + *(int *)(a5 + 84));
  if (!v30)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v41, v13);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a5 + 24) - 8) + 56))(v40, 1, 1);
  }
  MEMORY[0x1A1AFCEF4](v41, v30, v13, a5, *(_QWORD *)(a5 + 48));
  v31 = *(_QWORD *)(a5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, a5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v19 + 8))(v41, v13);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v29, v34);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a5 + 24) - 8) + 56))(v40, 1, 1);
  }
  v42 = v27;
  v43 = v26;
  v44 = v35;
  v45 = v28;
  swift_unknownObjectRetain();
  sub_1A09B3FF4();
  sub_1A096C290(v46, v47, v48, v49, a5);
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v41, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v29, a5);
}

uint64_t sub_1A096C55C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t TupleTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char *v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *, uint64_t);
  _QWORD v36[3];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v38 = a5;
  v39 = a6;
  v37 = a4;
  v42 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v36[0] = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1A09B4000();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v40 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v12 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v14 = (char *)v36 - v13;
  v15 = *(_QWORD *)(v10 - 8);
  v16 = MEMORY[0x1E0C80A78](v12);
  v43 = (char *)v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v20 = (char *)v36 - v19;
  MEMORY[0x1E0C80A78](v18);
  v22 = (char *)v36 - v21;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v36[1] = a1;
  v23((char *)v36 - v21, a1, v10);
  v36[2] = a2;
  v23(v20, a2, v10);
  v41 = TupleTypeMetadata2;
  v24 = *(int *)(TupleTypeMetadata2 + 48);
  v25 = a3;
  v26 = v42;
  v27 = &v14[v24];
  v23(v14, (uint64_t)v22, v10);
  v23(v27, (uint64_t)v20, v10);
  v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v28(v14, 1, v25) == 1)
  {
    v29 = *(void (**)(char *, uint64_t))(v15 + 8);
    v29(v20, v10);
    v29(v22, v10);
    if (v28(v27, 1, v25) == 1)
    {
      v29(v14, v10);
      v30 = v39;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v23(v43, (uint64_t)v14, v10);
  if (v28(v27, 1, v25) == 1)
  {
    v31 = *(void (**)(char *, uint64_t))(v15 + 8);
    v31(v20, v10);
    v31(v22, v10);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v43, v25);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v41);
    return 0;
  }
  v33 = (char *)v36[0];
  (*(void (**)(_QWORD, char *, uint64_t))(v26 + 32))(v36[0], v27, v25);
  v30 = v39;
  LODWORD(v41) = sub_1A09B3F04();
  v34 = *(void (**)(char *, uint64_t))(v26 + 8);
  v34(v33, v25);
  v35 = *(void (**)(char *, uint64_t))(v15 + 8);
  v35(v20, v10);
  v35(v22, v10);
  v34(v43, v25);
  v35(v14, v10);
  if ((v41 & 1) != 0)
  {
LABEL_9:
    v44 = v25;
    v45 = v37;
    v46 = v38;
    v47 = v30;
    type metadata accessor for StringTrieNode();
  }
  return 0;
}

void sub_1A096C868(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(int *)(a1 + 52);
  v7 = *(_QWORD *)(*(_QWORD *)(v5 - 208) + v6);
  if (*(_QWORD *)(*(_QWORD *)(v5 - 216) + v6))
  {
    if (v7)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      *(_QWORD *)(v5 - 144) = MEMORY[0x1E0DEDA70];
      *(_QWORD *)(v5 - 136) = v1;
      v8 = MEMORY[0x1E0DEDA78];
      *(_QWORD *)(v5 - 128) = MEMORY[0x1E0DEDA90];
      *(_QWORD *)(v5 - 120) = v8;
      *(_QWORD *)(v5 - 112) = MEMORY[0x1E0DEDA80];
      *(_QWORD *)(v5 - 104) = v4;
      *(_QWORD *)(v5 - 96) = v3;
      *(_QWORD *)(v5 - 88) = v2;
      type metadata accessor for StandardTrieNode();
    }
  }
  else if (!v7)
  {
    JUMPOUT(0x1A096C7B0);
  }
  JUMPOUT(0x1A096C7ACLL);
}

BOOL sub_1A096C928(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A096C938()
{
  return sub_1A09B4114();
}

uint64_t sub_1A096C95C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x65756C6176 && a2 == 0xE500000000000000;
  if (v2 || (sub_1A09B40E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6156627573 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A09B40E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A096CA50()
{
  sub_1A09B4108();
  sub_1A09B4114();
  return sub_1A09B4120();
}

uint64_t sub_1A096CA94(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6156627573;
  else
    return 0x65756C6176;
}

BOOL sub_1A096CACC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A096C928(*a1, *a2);
}

uint64_t sub_1A096CAE4()
{
  return sub_1A096CA50();
}

uint64_t sub_1A096CAF8()
{
  return sub_1A096C938();
}

uint64_t sub_1A096CB0C()
{
  sub_1A09B4108();
  sub_1A096C938();
  return sub_1A09B4120();
}

uint64_t sub_1A096CB54()
{
  char *v0;

  return sub_1A096CA94(*v0);
}

uint64_t sub_1A096CB68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A096C95C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A096CB98()
{
  return 0;
}

uint64_t sub_1A096CBA4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A0972D78();
  *a1 = result;
  return result;
}

uint64_t sub_1A096CBD4(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9D50, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A096CC08(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9D50, a1);
  return sub_1A09B4150();
}

void sub_1A096CC3C()
{
  type metadata accessor for StringTrieNode.CodingKeys();
}

uint64_t sub_1A096CC8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  MEMORY[0x1A1AFE604](&unk_1A09B9D50, a1);
  v5 = sub_1A09B40D8();
  *(_QWORD *)(v4 - 176) = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v16 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v8 = v5;
  v10 = *(_QWORD *)(v4 - 200);
  v9 = *(_QWORD *)(v4 - 192);
  sub_1A09B4138();
  *(_BYTE *)(v4 - 152) = 0;
  v11 = *(_QWORD *)(v4 - 184);
  sub_1A09B40C0();
  if (!v11)
  {
    *(_QWORD *)(v4 - 72) = *(_QWORD *)(v9 + *(int *)(v3 + 52));
    *(_BYTE *)(v4 - 81) = 1;
    *(_QWORD *)(v4 - 152) = MEMORY[0x1E0DEDA70];
    *(_QWORD *)(v4 - 144) = v2;
    v12 = MEMORY[0x1E0DEDA78];
    *(_QWORD *)(v4 - 136) = MEMORY[0x1E0DEDA90];
    *(_QWORD *)(v4 - 128) = v12;
    v13 = *(_QWORD *)(v4 - 208);
    *(_QWORD *)(v4 - 120) = MEMORY[0x1E0DEDA80];
    *(_QWORD *)(v4 - 112) = v13;
    v14 = *(_QWORD *)(v4 - 216);
    *(_QWORD *)(v4 - 104) = v10;
    *(_QWORD *)(v4 - 96) = v14;
    type metadata accessor for StandardTrieNode();
  }
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v4 - 176) + 8))(v7, v8);
}

void sub_1A096CE44(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[24];

  v11[1] = a5;
  v9 = sub_1A09B4000();
  v11[7] = *(_QWORD *)(v9 - 8);
  v11[8] = v9;
  MEMORY[0x1E0C80A78](v9);
  v11[9] = (char *)v11 - v10;
  v11[15] = a1;
  v11[16] = a2;
  v11[17] = a3;
  v11[18] = a4;
  type metadata accessor for StringTrieNode.CodingKeys();
}

void sub_1A096CED0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x1A1AFE604](&unk_1A09B9D50, a1);
  v6 = sub_1A09B40A8();
  *(_QWORD *)(v5 - 184) = v6;
  *(_QWORD *)(v5 - 224) = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  *(_QWORD *)(v5 - 248) = v4;
  *(_QWORD *)(v5 - 240) = v2;
  *(_QWORD *)(v5 - 152) = v2;
  *(_QWORD *)(v5 - 144) = v1;
  *(_QWORD *)(v5 - 192) = v1;
  *(_QWORD *)(v5 - 136) = v4;
  *(_QWORD *)(v5 - 128) = v3;
  *(_QWORD *)(v5 - 256) = v3;
  type metadata accessor for StringTrieNode();
}

uint64_t sub_1A096CF48(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v17 - v5;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  *(_QWORD *)(v3 - 232) = v1;
  v7 = *(_QWORD *)(v3 - 176);
  sub_1A09B412C();
  if (!v7)
  {
    v8 = *(_QWORD *)(v3 - 248);
    *(_QWORD *)(v3 - 272) = v4;
    v9 = v6;
    *(_QWORD *)(v3 - 176) = v2;
    v11 = *(_QWORD *)(v3 - 216);
    v10 = *(_QWORD *)(v3 - 208);
    *(_BYTE *)(v3 - 152) = 0;
    v12 = *(_QWORD *)(v3 - 240);
    sub_1A09B4084();
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 32))(v9, *(_QWORD *)(v3 - 200), v10);
    *(_QWORD *)(v3 - 152) = MEMORY[0x1E0DEDA70];
    *(_QWORD *)(v3 - 144) = v12;
    v14 = MEMORY[0x1E0DEDA78];
    *(_QWORD *)(v3 - 136) = MEMORY[0x1E0DEDA90];
    *(_QWORD *)(v3 - 128) = v14;
    v15 = *(_QWORD *)(v3 - 192);
    *(_QWORD *)(v3 - 120) = MEMORY[0x1E0DEDA80];
    *(_QWORD *)(v3 - 112) = v15;
    v16 = *(_QWORD *)(v3 - 256);
    *(_QWORD *)(v3 - 104) = v8;
    *(_QWORD *)(v3 - 96) = v16;
    type metadata accessor for StandardTrieNode();
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
}

void sub_1A096D09C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v8 = *(_QWORD *)(v6 - 184);
  v9 = sub_1A09B3EBC();
  *(_BYTE *)(v6 - 152) = 1;
  v10 = MEMORY[0x1A1AFE604](&unk_1A09B97B0, a1);
  *(_QWORD *)(v6 - 168) = v4;
  *(_QWORD *)(v6 - 160) = v10;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D8], v9, v6 - 168);
  sub_1A09B4084();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 224) + 8))(v1, v8);
  if (v3)
  {
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v6 - 176));
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 216) + 8))(v2, *(_QWORD *)(v6 - 208));
  }
  else
  {
    *(_QWORD *)(v2 + *(int *)(v5 + 52)) = *(_QWORD *)(v6 - 72);
    v11 = *(_QWORD *)(v6 - 272);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v11 + 16))(*(_QWORD *)(v6 - 264), v2, v5);
    __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v6 - 176));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v5);
  }
  JUMPOUT(0x1A096D020);
}

void sub_1A096D19C(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  sub_1A096CE44(a1[2], a1[3], a1[4], a1[5], a2);
}

void sub_1A096D1BC()
{
  sub_1A096CC3C();
}

uint64_t sub_1A096D1D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1A096C55C(a1, a2, a3[2], a3[3], a3[4], a3[5]);
}

uint64_t sub_1A096D1E4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t TupleTypeMetadata2;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(void);
  uint64_t v40;
  uint64_t result;
  void (*v42)(char *, uint64_t);
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, char *, uint64_t);
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD *v59;
  char *v60;
  __int128 v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  char v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, uint64_t);
  uint64_t v81;
  void (*v82)(char *, uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  _OWORD *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  char *v92;
  void (*v93)(void);
  char *v94;
  uint64_t v95;
  __int128 v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;

  v90 = a8;
  v98 = a6;
  v99 = a7;
  v97 = a5;
  v91 = a1;
  v13 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v13);
  v92 = (char *)&v81 - v14;
  v89 = sub_1A09B4000();
  v88 = *(_QWORD *)(v89 - 8);
  MEMORY[0x1E0C80A78](v89);
  v16 = (char *)&v81 - v15;
  v104 = sub_1A09B4018();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v18 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v87 = (_OWORD *)((char *)&v81 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (uint64_t *)((char *)&v81 - v21);
  v23 = MEMORY[0x1E0C80A78](v20);
  v24 = *(_QWORD *)(a3 - 8);
  v25 = MEMORY[0x1E0C80A78](v23);
  v85 = (char *)&v81 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v103 = (uint64_t)&v81 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v101 = (char *)&v81 - v30;
  v95 = v29;
  v31 = *(int *)(v29 + 48);
  v33 = (char *)v32 + v31;
  v34 = (char *)a2 + v31;
  v36 = *a2;
  v35 = a2[1];
  *(_QWORD *)&v96 = a2;
  v38 = a2[2];
  v37 = a2[3];
  *v32 = v36;
  v32[1] = v35;
  v32[2] = v38;
  v32[3] = v37;
  v102 = *(_QWORD *)(a4 - 8);
  v39 = *(void (**)(void))(v102 + 16);
  v100 = v33;
  v94 = v34;
  v105 = a4;
  v93 = v39;
  v39();
  *(_QWORD *)&v110 = v36;
  *((_QWORD *)&v110 + 1) = v35;
  v111 = v38;
  v112 = v37;
  v40 = MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF88], v104);
  sub_1A09B3FD0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v16, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v88 + 8))(v16, v89);
    return (*(uint64_t (**)(char *, uint64_t))(v102 + 8))(v100, v105);
  }
  v84 = v40;
  v89 = a10;
  v88 = a9;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v101, v16, a3);
  v86 = a3;
  v42 = *(void (**)(char *, uint64_t))(v102 + 8);
  v43 = v105;
  v42(v100, v105);
  v44 = (char *)v22 + *(int *)(v95 + 48);
  v46 = *(char **)v96;
  v45 = *(_QWORD *)(v96 + 8);
  v47 = v24;
  v49 = *(_QWORD *)(v96 + 16);
  v48 = *(_QWORD *)(v96 + 24);
  *v22 = *(_QWORD *)v96;
  v22[1] = v45;
  v22[2] = v49;
  v22[3] = v48;
  ((void (*)(char *, char *, uint64_t))v93)(v44, v94, v43);
  swift_unknownObjectRetain();
  v42(v44, v43);
  v50 = v86;
  v83 = v47;
  v51 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 16);
  v51(v103, v101, v86);
  v52 = (_QWORD *)swift_allocObject();
  v52[2] = v50;
  v52[3] = v43;
  v53 = v98;
  v52[4] = v97;
  v52[5] = v53;
  v54 = v90;
  v52[6] = v99;
  v52[7] = v54;
  v55 = v89;
  v52[8] = v88;
  v52[9] = v55;
  *(_QWORD *)&v107 = v46;
  *((_QWORD *)&v107 + 1) = v45;
  v108 = v49;
  v109 = v48;
  swift_unknownObjectRetain();
  v100 = v46;
  v56 = sub_1A09B400C();
  if (__OFADD__(v56, 1))
  {
    __break(1u);
    goto LABEL_13;
  }
  v82 = (void (*)(char *, uint64_t, uint64_t))v51;
  v113 = v56 + 1;
  sub_1A09B3FDC();
  v57 = v111;
  v58 = v112;
  v59 = v87;
  v60 = (char *)v87 + *(int *)(v95 + 48);
  v61 = *(_OWORD *)(v96 + 16);
  *v87 = *(_OWORD *)v96;
  v59[1] = v61;
  v96 = v110;
  v62 = v105;
  ((void (*)(char *, char *, uint64_t))v93)(v60, v94, v105);
  v63 = v102;
  v64 = v92;
  (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v92, v60, v62);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v64, 0, 1, v62);
  v107 = v96;
  v108 = v57;
  v109 = v58;
  v65 = v86;
  v66 = (_QWORD *)swift_allocObject();
  v66[2] = v65;
  v66[3] = v62;
  v67 = v98;
  v68 = v99;
  v66[4] = v97;
  v66[5] = v67;
  v66[6] = v68;
  v66[7] = v54;
  v69 = v89;
  v66[8] = v88;
  v66[9] = v69;
  v66[10] = sub_1A0972E38;
  v66[11] = v52;
  v70 = v91;
  swift_isUniquelyReferenced_nonNull_native();
  v113 = *v70;
  v71 = v113;
  *v70 = 0x8000000000000000;
  v72 = sub_1A0970B60(v103, v65, v68);
  if (__OFADD__(*(_QWORD *)(v71 + 16), (v73 & 1) == 0))
  {
LABEL_13:
    __break(1u);
LABEL_14:
    result = sub_1A09B40F0();
    __break(1u);
    return result;
  }
  v74 = v73;
  v102 = v72;
  v106 = v68;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v104, &v106);
  sub_1A09B3EBC();
  sub_1A09B4060();
  v75 = sub_1A09B4048();
  v76 = v113;
  if ((v75 & 1) != 0)
  {
    v102 = sub_1A0970B60(v103, v65, v68);
    if ((v74 & 1) != (v77 & 1))
      goto LABEL_14;
  }
  *v91 = v76;
  swift_bridgeObjectRelease();
  if ((v74 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    v78 = v103;
  }
  else
  {
    v79 = swift_bridgeObjectRetain();
    v113 = ((uint64_t (*)(uint64_t))v66[10])(v79);
    v78 = v103;
    v82(v85, v103, v65);
    sub_1A09B4054();
  }
  swift_bridgeObjectRelease();
  sub_1A09B3EE0();
  swift_unknownObjectRelease();
  v80 = *(void (**)(uint64_t, uint64_t))(v83 + 8);
  v80(v78, v65);
  v80((uint64_t)v101, v65);
  swift_release();
  return swift_release();
}

uint64_t sub_1A096D8E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v8;

  v6 = sub_1A09B4018();
  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  v8 = a5;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v6, &v8);
  return sub_1A09B3E98();
}

void sub_1A096D97C()
{
  type metadata accessor for StandardTrieNode();
}

void sub_1A096D9E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  void (*v17)(_BYTE *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[80];

  *(_QWORD *)(v4 - 200) = a1;
  v5 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v5);
  v7 = &v22[-v6];
  v8 = sub_1A09B4018();
  *(_QWORD *)(v4 - 72) = v1;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v8, v4 - 72);
  sub_1A09B3EBC();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = &v22[-v14];
  v16 = *(int *)(v13 + 48);
  v17 = *(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v17(&v22[-v14], v3, v2);
  v18 = v3;
  v19 = *(_QWORD *)(v3 + v16);
  *(_QWORD *)&v15[v16] = v19;
  v20 = *(int *)(TupleTypeMetadata2 + 48);
  v17(v12, v18, v2);
  *(_QWORD *)&v12[v20] = v19;
  v21 = swift_bridgeObjectRetain();
  sub_1A096BDF4(v21, v2, *(_QWORD *)(v4 - 224), *(_QWORD *)(v4 - 184), *(_QWORD *)(v4 - 176), *(_QWORD *)(v4 - 216), *(_QWORD *)(v4 - 168), *(_QWORD *)(v4 - 192), (uint64_t)v7, *(_QWORD *)(v4 - 208));
}

uint64_t sub_1A096DBA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  char *v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  void (*v40)(char *, uint64_t);
  uint64_t v41;
  char *v42;
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
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v44 = a6;
  v45 = a8;
  v48 = a3;
  v49 = a7;
  v43 = a5;
  v50 = a10;
  v54 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v42 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1A09B4000();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v51 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v16 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v18 = (char *)&v41 - v17;
  v19 = *(_QWORD *)(v14 - 8);
  v20 = MEMORY[0x1E0C80A78](v16);
  v55 = (char *)&v41 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v41 - v23;
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v41 - v25;
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v46 = a1;
  v27((char *)&v41 - v25, a1, v14);
  v47 = a2;
  v27(v24, a2, v14);
  v52 = TupleTypeMetadata2;
  v28 = v54;
  v29 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
  v27(v18, (uint64_t)v26, v14);
  v27(v29, (uint64_t)v24, v14);
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v53 = a4;
  if (v30(v18, 1, a4) == 1)
  {
    v31 = *(void (**)(char *, uint64_t))(v19 + 8);
    v31(v24, v14);
    v31(v26, v14);
    v32 = v53;
    if (v30(v29, 1, v53) == 1)
    {
      v31(v18, v14);
      v33 = v50;
      goto LABEL_9;
    }
    goto LABEL_6;
  }
  v34 = v28;
  v27(v55, (uint64_t)v18, v14);
  v32 = v53;
  if (v30(v29, 1, v53) == 1)
  {
    v35 = *(void (**)(char *, uint64_t))(v19 + 8);
    v35(v24, v14);
    v35(v26, v14);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v55, v32);
LABEL_6:
    (*(void (**)(char *, uint64_t))(v51 + 8))(v18, v52);
    return 0;
  }
  v37 = v34;
  v38 = v42;
  (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v42, v29, v32);
  v33 = v50;
  LODWORD(v52) = sub_1A09B3F04();
  v39 = *(void (**)(char *, uint64_t))(v37 + 8);
  v39(v38, v32);
  v40 = *(void (**)(char *, uint64_t))(v19 + 8);
  v40(v24, v14);
  v40(v26, v14);
  v39(v55, v32);
  v40(v18, v14);
  if ((v52 & 1) != 0)
  {
LABEL_9:
    v56 = v48;
    v57 = v32;
    v58 = v43;
    v59 = v44;
    v60 = v49;
    v61 = v45;
    v62 = a9;
    v63 = v33;
    type metadata accessor for StandardTrieNode();
  }
  return 0;
}

void sub_1A096DEF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(int *)(a1 + 84);
  v3 = *(_QWORD *)(*(_QWORD *)(v1 - 224) + v2);
  if (*(_QWORD *)(*(_QWORD *)(v1 - 232) + v2))
  {
    if (v3)
    {
      v4 = a1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      MEMORY[0x1A1AFE604](&unk_1A09B9760, v4);
      LOBYTE(v4) = sub_1A09B3EC8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v4 & 1) != 0)
LABEL_10:
        JUMPOUT(0x1A096DE18);
    }
  }
  else if (!v3)
  {
    goto LABEL_10;
  }
  JUMPOUT(0x1A096DE14);
}

void sub_1A096DF78()
{
  type metadata accessor for StandardTrieNode.CodingKeys();
}

uint64_t sub_1A096DFE4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  MEMORY[0x1A1AFE604](&unk_1A09B9DA0, a1);
  v4 = sub_1A09B40D8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v13 - v6;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  v8 = *(_QWORD *)(v3 - 184);
  sub_1A09B4138();
  *(_BYTE *)(v3 - 152) = 0;
  v9 = *(_QWORD *)(v3 - 176);
  sub_1A09B40C0();
  if (!v9)
  {
    *(_QWORD *)(v3 - 152) = *(_QWORD *)(v8 + *(int *)(v2 + 84));
    *(_BYTE *)(v3 - 65) = 1;
    v10 = sub_1A09B3EBC();
    v11 = MEMORY[0x1A1AFE604](&unk_1A09B9788, v2);
    *(_QWORD *)(v3 - 168) = *(_QWORD *)(v3 - 232);
    *(_QWORD *)(v3 - 160) = v11;
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0B8], v10, v3 - 168);
    sub_1A09B40C0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_1A096E154(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v21 = a4;
  v22 = a7;
  v17[1] = a8;
  v18 = sub_1A09B4000();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)v17 - v16;
  v23 = a1;
  v24 = a2;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a6;
  v29 = a7;
  v30 = a9;
  type metadata accessor for StandardTrieNode.CodingKeys();
}

void sub_1A096E208(uint64_t a1)
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

  *(_QWORD *)(v7 - 184) = MEMORY[0x1A1AFE604](&unk_1A09B9DA0, a1);
  v8 = sub_1A09B40A8();
  *(_QWORD *)(v7 - 208) = v8;
  *(_QWORD *)(v7 - 232) = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  *(_QWORD *)(v7 - 264) = v6;
  *(_QWORD *)(v7 - 152) = v6;
  *(_QWORD *)(v7 - 144) = v3;
  *(_QWORD *)(v7 - 248) = v4;
  *(_QWORD *)(v7 - 240) = v3;
  *(_QWORD *)(v7 - 256) = v2;
  v9 = *(_QWORD *)(v7 - 200);
  *(_QWORD *)(v7 - 136) = v2;
  *(_QWORD *)(v7 - 128) = v9;
  *(_QWORD *)(v7 - 120) = v4;
  *(_QWORD *)(v7 - 112) = v1;
  *(_QWORD *)(v7 - 200) = v1;
  *(_QWORD *)(v7 - 104) = *(_QWORD *)(v7 - 192);
  *(_QWORD *)(v7 - 96) = v5;
  type metadata accessor for StandardTrieNode();
}

uint64_t sub_1A096E298(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v17 - v6;
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  *(_QWORD *)(v3 - 192) = v1;
  v8 = *(_QWORD *)(v3 - 176);
  sub_1A09B412C();
  if (v8)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  *(_QWORD *)(v3 - 184) = v5;
  v9 = v7;
  *(_QWORD *)(v3 - 176) = v2;
  v10 = *(_QWORD *)(v3 - 256);
  v11 = *(_QWORD *)(v3 - 272);
  *(_BYTE *)(v3 - 152) = 0;
  v12 = *(_QWORD *)(v3 - 224);
  sub_1A09B4084();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 32))(v7, *(_QWORD *)(v3 - 216), v11);
  v13 = sub_1A09B3EBC();
  *(_BYTE *)(v3 - 65) = 1;
  v14 = MEMORY[0x1A1AFE604](&unk_1A09B97B0, a1);
  *(_QWORD *)(v3 - 168) = v10;
  *(_QWORD *)(v3 - 160) = v14;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D8], v13, v3 - 168);
  sub_1A09B4084();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 - 232) + 8))(*(_QWORD *)(v3 - 192), *(_QWORD *)(v3 - 208));
  *(_QWORD *)&v7[*(int *)(a1 + 84)] = *(_QWORD *)(v3 - 152);
  v15 = *(_QWORD *)(v3 - 184);
  (*(void (**)(_QWORD, char *, uint64_t))(v15 + 16))(*(_QWORD *)(v3 - 280), v9, a1);
  __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 176));
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v9, a1);
}

void sub_1A096E4A0()
{
  type metadata accessor for StringTrieNode();
}

void sub_1A096E4F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 208) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v17 - 200) = a1;
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v17 - 264) = (char *)&a9 - v18;
  *(_QWORD *)(v17 - 152) = v16;
  *(_QWORD *)(v17 - 144) = v10;
  *(_QWORD *)(v17 - 136) = v15;
  *(_QWORD *)(v17 - 128) = v14;
  *(_QWORD *)(v17 - 120) = v13;
  *(_QWORD *)(v17 - 112) = v9;
  *(_QWORD *)(v17 - 104) = v12;
  *(_QWORD *)(v17 - 96) = v11;
  type metadata accessor for StandardTrieNode();
}

void sub_1A096E544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 224) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v17 - 216) = a1;
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v17 - 272) = (char *)&a9 - v18;
  *(_QWORD *)(v17 - 256) = v16;
  *(_QWORD *)(v17 - 248) = v15;
  *(_QWORD *)(v17 - 152) = v16;
  *(_QWORD *)(v17 - 144) = v10;
  *(_QWORD *)(v17 - 184) = v10;
  *(_QWORD *)(v17 - 176) = v9;
  *(_QWORD *)(v17 - 136) = v15;
  *(_QWORD *)(v17 - 128) = v14;
  *(_QWORD *)(v17 - 240) = v14;
  *(_QWORD *)(v17 - 232) = v13;
  *(_QWORD *)(v17 - 120) = v13;
  *(_QWORD *)(v17 - 112) = v9;
  *(_QWORD *)(v17 - 104) = v12;
  *(_QWORD *)(v17 - 96) = v11;
  *(_QWORD *)(v17 - 192) = v11;
  type metadata accessor for Trie.RootNode();
}

uint64_t sub_1A096E5A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  void (*v16)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  _BYTE v27[80];

  v3 = a1;
  v4 = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = &v27[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v5);
  v9 = &v27[-v8];
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v11 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v12 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v14 = &v27[-v13];
  v15 = &v27[*(int *)(v12 + 48) - v13];
  v16 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16);
  v16(&v27[-v13], *(_BYTE **)(v2 - 168), v3);
  v16(v15, *(_BYTE **)(v2 - 160), v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v16(v7, v14, v3);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v17 = *(_QWORD *)(v2 - 208);
      v18 = *(_QWORD *)(v2 - 200);
      v19 = *(_QWORD *)(v2 - 264);
      (*(void (**)(uint64_t, _BYTE *, uint64_t))(v17 + 32))(v19, v15, v18);
      v20 = sub_1A096C55C((uint64_t)v7, v19, *(_QWORD *)(v2 - 184), *(_QWORD *)(v2 - 176), v1, *(_QWORD *)(v2 - 192));
      v21 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
      v21(v19, v18);
      v21((uint64_t)v7, v18);
      goto LABEL_10;
    }
    (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)(v2 - 208) + 8))(v7, *(_QWORD *)(v2 - 200));
LABEL_7:
    v20 = 0;
    v4 = v11;
    v3 = TupleTypeMetadata2;
    goto LABEL_10;
  }
  v16(v9, v14, v3);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(_BYTE *, _QWORD))(*(_QWORD *)(v2 - 224) + 8))(v9, *(_QWORD *)(v2 - 216));
    goto LABEL_7;
  }
  v22 = *(_QWORD *)(v2 - 224);
  v23 = *(_QWORD *)(v2 - 216);
  v24 = *(_QWORD *)(v2 - 272);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v22 + 32))(v24, v15, v23);
  v20 = sub_1A096DBA8((uint64_t)v9, v24, *(_QWORD *)(v2 - 256), *(_QWORD *)(v2 - 184), *(_QWORD *)(v2 - 248), *(_QWORD *)(v2 - 240), *(_QWORD *)(v2 - 232), *(_QWORD *)(v2 - 176), v1, *(_QWORD *)(v2 - 192));
  v25 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v25(v24, v23);
  v25((uint64_t)v9, v23);
LABEL_10:
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v14, v3);
  return v20 & 1;
}

uint64_t sub_1A096E7D8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x647261646E617473 && a2 == 0xE800000000000000;
  if (v2 || (sub_1A09B40E4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E69727473 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1A09B40E4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A096E8C0(char a1)
{
  if ((a1 & 1) != 0)
    return 0x676E69727473;
  else
    return 0x647261646E617473;
}

uint64_t sub_1A096E8F4(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 1701080942 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1A09B40E4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

void sub_1A096E968()
{
  type metadata accessor for Trie.RootNode.StringCodingKeys();
}

void sub_1A096E9D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v15 = MEMORY[0x1A1AFE604](&unk_1A09B9E90, a1);
  *(_QWORD *)(v13 - 248) = a1;
  *(_QWORD *)(v13 - 264) = v15;
  v16 = sub_1A09B40D8();
  *(_QWORD *)(v13 - 216) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v13 - 208) = v16;
  MEMORY[0x1E0C80A78](v16);
  *(_QWORD *)(v13 - 232) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 152) = v12;
  *(_QWORD *)(v13 - 144) = v10;
  *(_QWORD *)(v13 - 136) = v11;
  *(_QWORD *)(v13 - 128) = v9;
  *(_QWORD *)(v13 - 192) = v9;
  type metadata accessor for StringTrieNode();
}

void sub_1A096EA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *(_QWORD *)(v16 - 224) = a1;
  *(_QWORD *)(v16 - 240) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v16 - 256) = (char *)&a9 - v17;
  *(_QWORD *)(v16 - 152) = v15;
  *(_QWORD *)(v16 - 144) = v11;
  *(_QWORD *)(v16 - 136) = v14;
  *(_QWORD *)(v16 - 128) = v12;
  *(_QWORD *)(v16 - 120) = *(_QWORD *)(v16 - 176);
  *(_QWORD *)(v16 - 112) = v9;
  *(_QWORD *)(v16 - 200) = v9;
  *(_QWORD *)(v16 - 104) = v10;
  *(_QWORD *)(v16 - 96) = v13;
  type metadata accessor for Trie.RootNode.StandardCodingKeys();
}

void sub_1A096EAA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v18 = MEMORY[0x1A1AFE604](&unk_1A09B9E40, a1);
  *(_QWORD *)(v16 - 304) = a1;
  *(_QWORD *)(v16 - 328) = v18;
  v19 = sub_1A09B40D8();
  *(_QWORD *)(v16 - 272) = v19;
  *(_QWORD *)(v16 - 280) = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  *(_QWORD *)(v16 - 288) = (char *)&a9 - v20;
  *(_QWORD *)(v16 - 152) = v9;
  *(_QWORD *)(v16 - 144) = v12;
  *(_QWORD *)(v16 - 136) = v14;
  *(_QWORD *)(v16 - 128) = v13;
  *(_QWORD *)(v16 - 120) = v15;
  *(_QWORD *)(v16 - 112) = v10;
  v21 = *(_QWORD *)(v16 - 192);
  *(_QWORD *)(v16 - 104) = v11;
  *(_QWORD *)(v16 - 96) = v21;
  type metadata accessor for StandardTrieNode();
}

void sub_1A096EB3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 296) = a1;
  *(_QWORD *)(v17 - 312) = *(_QWORD *)(a1 - 8);
  v18 = MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v17 - 320) = (char *)&a9 - v19;
  *(_QWORD *)(v17 - 184) = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v18);
  *(_QWORD *)(v17 - 152) = v9;
  *(_QWORD *)(v17 - 144) = v12;
  *(_QWORD *)(v17 - 136) = v14;
  *(_QWORD *)(v17 - 128) = v13;
  v20 = *(_QWORD *)(v17 - 200);
  *(_QWORD *)(v17 - 120) = v16;
  *(_QWORD *)(v17 - 112) = v20;
  *(_QWORD *)(v17 - 104) = v11;
  *(_QWORD *)(v17 - 96) = v10;
  type metadata accessor for Trie.RootNode.CodingKeys();
}

uint64_t sub_1A096EBCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v19;

  MEMORY[0x1A1AFE604](&unk_1A09B9DF0, a1);
  v4 = sub_1A09B40D8();
  *(_QWORD *)(v3 - 176) = v4;
  *(_QWORD *)(v3 - 192) = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v19 - v5;
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v3 - 168), *(_QWORD *)(*(_QWORD *)(v3 - 168) + 24));
  sub_1A09B4138();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v3 - 184) + 16))(v1, *(_QWORD *)(v3 - 160), v2);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = *(_QWORD *)(v3 - 240);
    v8 = *(_QWORD *)(v3 - 256);
    v9 = *(_QWORD *)(v3 - 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v1, v9);
    *(_BYTE *)(v3 - 152) = 1;
    v10 = *(_QWORD *)(v3 - 232);
    v11 = *(_QWORD *)(v3 - 176);
    sub_1A09B40B4();
    MEMORY[0x1A1AFE604](&unk_1A09B96E8, v9);
    v12 = *(_QWORD *)(v3 - 208);
    sub_1A09B40CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 216) + 8))(v10, v12);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
  }
  else
  {
    v13 = *(_QWORD *)(v3 - 312);
    v14 = *(_QWORD *)(v3 - 320);
    v15 = *(_QWORD *)(v3 - 296);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 32))(v14, v1, v15);
    *(_BYTE *)(v3 - 152) = 0;
    v16 = *(_QWORD *)(v3 - 288);
    v11 = *(_QWORD *)(v3 - 176);
    sub_1A09B40B4();
    MEMORY[0x1A1AFE604](&unk_1A09B9788, v15);
    v17 = *(_QWORD *)(v3 - 272);
    sub_1A09B40CC();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 280) + 8))(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v14, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v3 - 192) + 8))(v6, v11);
}

void sub_1A096EE28()
{
  type metadata accessor for Trie.RootNode.StringCodingKeys();
}

void sub_1A096EE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v19 = MEMORY[0x1A1AFE604](&unk_1A09B9E90, a1);
  *(_QWORD *)(v17 - 272) = a1;
  *(_QWORD *)(v17 - 288) = v19;
  v20 = sub_1A09B40A8();
  *(_QWORD *)(v17 - 344) = v20;
  *(_QWORD *)(v17 - 320) = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  *(_QWORD *)(v17 - 264) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 160) = v10;
  *(_QWORD *)(v17 - 152) = v16;
  *(_QWORD *)(v17 - 144) = v15;
  *(_QWORD *)(v17 - 136) = v14;
  *(_QWORD *)(v17 - 128) = v12;
  *(_QWORD *)(v17 - 120) = v11;
  *(_QWORD *)(v17 - 112) = v13;
  *(_QWORD *)(v17 - 104) = v9;
  *(_QWORD *)(v17 - 200) = v13;
  type metadata accessor for Trie.RootNode.StandardCodingKeys();
}

void sub_1A096EF28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v19 = MEMORY[0x1A1AFE604](&unk_1A09B9E40, a1);
  *(_QWORD *)(v17 - 296) = a1;
  *(_QWORD *)(v17 - 304) = v19;
  v20 = sub_1A09B40A8();
  *(_QWORD *)(v17 - 376) = v20;
  *(_QWORD *)(v17 - 328) = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  *(_QWORD *)(v17 - 280) = (char *)&a9 - v21;
  *(_QWORD *)(v17 - 160) = v10;
  *(_QWORD *)(v17 - 152) = v16;
  *(_QWORD *)(v17 - 144) = v15;
  *(_QWORD *)(v17 - 136) = v14;
  *(_QWORD *)(v17 - 128) = v12;
  *(_QWORD *)(v17 - 120) = v11;
  *(_QWORD *)(v17 - 112) = v13;
  *(_QWORD *)(v17 - 104) = v9;
  type metadata accessor for Trie.RootNode.CodingKeys();
}

void sub_1A096EFB8(uint64_t a1)
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

  *(_QWORD *)(v8 - 216) = MEMORY[0x1A1AFE604](&unk_1A09B9DF0, a1);
  v9 = sub_1A09B40A8();
  *(_QWORD *)(v8 - 248) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 - 240) = v9;
  MEMORY[0x1E0C80A78](v9);
  *(_QWORD *)(v8 - 368) = v2;
  *(_QWORD *)(v8 - 160) = v2;
  *(_QWORD *)(v8 - 152) = v7;
  *(_QWORD *)(v8 - 232) = v7;
  *(_QWORD *)(v8 - 360) = v6;
  *(_QWORD *)(v8 - 144) = v6;
  *(_QWORD *)(v8 - 136) = v5;
  *(_QWORD *)(v8 - 352) = v5;
  *(_QWORD *)(v8 - 336) = v4;
  *(_QWORD *)(v8 - 128) = v4;
  *(_QWORD *)(v8 - 120) = v3;
  *(_QWORD *)(v8 - 224) = v3;
  *(_QWORD *)(v8 - 112) = *(_QWORD *)(v8 - 200);
  *(_QWORD *)(v8 - 104) = v1;
  *(_QWORD *)(v8 - 312) = v1;
  type metadata accessor for Trie.RootNode();
}

uint64_t sub_1A096F05C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE v39[96];

  *(_QWORD *)(v2 - 256) = a1;
  *(_QWORD *)(v2 - 384) = *(_QWORD *)(a1 - 8);
  v3 = MEMORY[0x1E0C80A78](a1);
  v5 = &v39[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = MEMORY[0x1E0C80A78](v3);
  v8 = &v39[-v7];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v39[-v9];
  v11 = *(_QWORD **)(v2 - 72);
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v12 = *(_QWORD *)(v2 - 208);
  sub_1A09B412C();
  if (!v12)
  {
    *(_QWORD *)(v2 - 408) = v8;
    *(_QWORD *)(v2 - 400) = v5;
    *(_QWORD *)(v2 - 416) = v10;
    v13 = *(_QWORD *)(v2 - 232);
    v14 = *(_QWORD *)(v2 - 224);
    *(_QWORD *)(v2 - 216) = 0;
    *(_QWORD *)(v2 - 208) = v1;
    v15 = *(_QWORD *)(v2 - 240);
    *(_QWORD *)(v2 - 160) = sub_1A09B409C();
    v16 = sub_1A09B3F34();
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEAF38], v16);
    *(_QWORD *)(v2 - 192) = sub_1A09B4024();
    *(_QWORD *)(v2 - 184) = v17;
    *(_QWORD *)(v2 - 176) = v18;
    *(_QWORD *)(v2 - 168) = v19;
    v20 = sub_1A09B4018();
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF88], v20);
    sub_1A09B3FC4();
    v21 = *(unsigned __int8 *)(v2 - 160);
    if (v21 == 2
      || (v23 = *(_OWORD *)(v2 - 192),
          v22 = *(_OWORD *)(v2 - 176),
          *(_OWORD *)(v2 - 432) = v23,
          *(_OWORD *)(v2 - 160) = v23,
          *(_OWORD *)(v2 - 144) = v22,
          (sub_1A09B3FE8() & 1) == 0))
    {
      v28 = sub_1A09B403C();
      swift_allocError();
      v29 = v15;
      v31 = v30;
      __swift_instantiateConcreteTypeFromMangledName(qword_1EE5A9960);
      *v31 = *(_QWORD *)(v2 - 256);
      v32 = *(_QWORD *)(v2 - 208);
      sub_1A09B4078();
      sub_1A09B4030();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v31, *MEMORY[0x1E0DEC450], v28);
      swift_willThrow();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 8))(v32, v29);
    }
    else
    {
      if ((v21 & 1) != 0)
      {
        *(_BYTE *)(v2 - 160) = 1;
        v33 = *(_QWORD *)(v2 - 216);
        v34 = *(_QWORD *)(v2 - 208);
        sub_1A09B406C();
        if (!v33)
        {
          *(_QWORD *)(v2 - 160) = v13;
          *(_QWORD *)(v2 - 152) = v14;
          v37 = *(_QWORD *)(v2 - 312);
          *(_QWORD *)(v2 - 144) = *(_QWORD *)(v2 - 200);
          *(_QWORD *)(v2 - 136) = v37;
          type metadata accessor for StringTrieNode();
        }
        swift_unknownObjectRelease();
        v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 8);
        v27 = v34;
      }
      else
      {
        *(_BYTE *)(v2 - 160) = 0;
        v24 = *(_QWORD *)(v2 - 216);
        v25 = *(_QWORD *)(v2 - 208);
        sub_1A09B406C();
        if (!v24)
        {
          *(_QWORD *)(v2 - 160) = *(_QWORD *)(v2 - 368);
          *(_QWORD *)(v2 - 152) = v13;
          v35 = *(_QWORD *)(v2 - 352);
          *(_QWORD *)(v2 - 144) = *(_QWORD *)(v2 - 360);
          *(_QWORD *)(v2 - 136) = v35;
          *(_QWORD *)(v2 - 128) = *(_QWORD *)(v2 - 336);
          *(_QWORD *)(v2 - 120) = v14;
          v36 = *(_QWORD *)(v2 - 312);
          *(_QWORD *)(v2 - 112) = *(_QWORD *)(v2 - 200);
          *(_QWORD *)(v2 - 104) = v36;
          type metadata accessor for StandardTrieNode();
        }
        swift_unknownObjectRelease();
        v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 248) + 8);
        v27 = v25;
      }
      v26(v27, v15);
    }
    v11 = *(_QWORD **)(v2 - 72);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_1A096F5B0(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_1A096F6AC(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096C928);
}

uint64_t sub_1A096F5C0(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1A096F734(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096C938);
}

uint64_t sub_1A096F5CC(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1A096F77C(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096C938);
}

uint64_t sub_1A096F5D8(_QWORD *a1, uint64_t a2)
{
  return sub_1A096F7E8(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096CA94);
}

uint64_t sub_1A096F5E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_1A096F830(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096C95C, a4);
}

uint64_t sub_1A096F5F0@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1A096F884(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0972D78, a2);
}

uint64_t sub_1A096F5FC(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9DA0, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A096F630(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9DA0, a1);
  return sub_1A09B4150();
}

uint64_t sub_1A096F664(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A0970A8C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096E154);
}

void sub_1A096F680()
{
  sub_1A096DF78();
}

uint64_t sub_1A096F694(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return sub_1A0970AF0(a1, a2, a3, a4, sub_1A096DBA8);
}

uint64_t sub_1A096F6A0(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4)
{
  return sub_1A096F6AC(a1, a2, a3, a4, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0973214);
}

uint64_t sub_1A096F6AC(unsigned __int8 *a1, unsigned __int8 *a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(*a1, *a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]) & 1;
}

uint64_t sub_1A096F6F0()
{
  return sub_1A096CA50();
}

uint64_t sub_1A096F728(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1A096F734(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0973208);
}

uint64_t sub_1A096F734(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;

  return a4(a1, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
}

uint64_t sub_1A096F770(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return sub_1A096F77C(a1, a2, a3, (void (*)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0973208);
}

uint64_t sub_1A096F77C(uint64_t a1, _QWORD *a2, uint64_t a3, void (*a4)(_BYTE *, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v4;
  _BYTE v8[72];

  sub_1A09B4108();
  a4(v8, *v4, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
  return sub_1A09B4120();
}

uint64_t sub_1A096F7DC(_QWORD *a1, uint64_t a2)
{
  return sub_1A096F7E8(a1, a2, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096E8C0);
}

uint64_t sub_1A096F7E8(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  unsigned __int8 *v3;

  return a3(*v3, a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
}

uint64_t sub_1A096F824@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, _BYTE *a4@<X8>)
{
  return sub_1A096F830(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096E7D8, a4);
}

uint64_t sub_1A096F830@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t (*a4)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X4>, _BYTE *a5@<X8>)
{
  uint64_t result;

  result = a4(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]);
  *a5 = result;
  return result;
}

uint64_t sub_1A096F878@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1A096F884(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0973228, a2);
}

uint64_t sub_1A096F884@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  *a3 = result;
  return result;
}

uint64_t sub_1A096F8C0(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9DF0, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A096F8F4(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9DF0, a1);
  return sub_1A09B4150();
}

uint64_t sub_1A096F928()
{
  return 1;
}

uint64_t sub_1A096F938()
{
  return 1701080942;
}

uint64_t sub_1A096F94C@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1A09705DC(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A097322C, a2);
}

uint64_t sub_1A096F958(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9E40, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A096F98C(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9E40, a1);
  return sub_1A09B4150();
}

uint64_t sub_1A096F9C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A096E8F4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A096FA08(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9E90, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A096FA3C(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B9E90, a1);
  return sub_1A09B4150();
}

uint64_t sub_1A096FA70(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A0970A8C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096EE28);
}

void sub_1A096FA8C()
{
  sub_1A096E968();
}

uint64_t sub_1A096FAA0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return sub_1A0970AF0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096E4A0);
}

void Trie.init(dictionary:)(uint64_t a1@<X2>, uint64_t a2@<X6>, uint64_t a3@<X7>, uint64_t a4@<X8>, uint64_t a5)
{
  uint64_t v7;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A98D0);
  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  sub_1A0970D60();
  sub_1A09B3E98();
  v7 = sub_1A09B3EBC();
  sub_1A09B3EBC();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], v7);
  sub_1A09B3F1C();
  swift_bridgeObjectRelease();
  sub_1A096B4CC(v10, a1, a2, a3, a5, a4);
}

uint64_t sub_1A096FC1C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A096FC4C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v30 = a1;
  v6 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v27 - v7;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (uint64_t *)((char *)&v27 - v14);
  v16 = *(int *)(v13 + 48);
  v29 = (char *)&v27 + v16 - v14;
  v17 = (char *)a2 + v16;
  v19 = *a2;
  v18 = a2[1];
  *v15 = v19;
  v15[1] = v18;
  v20 = *(_QWORD *)(a4 - 8);
  v21 = *(void (**)(void))(v20 + 16);
  v21();
  v22 = sub_1A09B3F10();
  v23 = *(_QWORD *)(v22 + 16);
  v28 = v22 + 32;
  v24 = (2 * v23) | 1;
  v25 = &v12[*(int *)(TupleTypeMetadata2 + 48)];
  ((void (*)(char *, char *, uint64_t))v21)(v25, v17, a4);
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v8, v25, a4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v8, 0, 1, a4);
  v31 = v22;
  v32 = v28;
  v33 = 0;
  v34 = v24;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A98D0);
  sub_1A0970D60();
  sub_1A09B3EBC();
  sub_1A09B3EE0();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v29, a4);
}

void Trie.init(dictionary:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v21;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[1] = a1;
  v14 = sub_1A09B4018();
  swift_getTupleTypeMetadata2();
  sub_1A09B3F28();
  v23[0] = a6;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v14, v23);
  v22[2] = sub_1A09B3E98();
  v15 = sub_1A09B3F34();
  v22[0] = a6;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEAF18], v15, v22);
  v16 = sub_1A09B3EBC();
  sub_1A09B3EBC();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEA0D0], v16);
  sub_1A09B3F1C();
  swift_bridgeObjectRelease();
  sub_1A096BDF4(v21, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1A096FFF0()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1A0970020(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t TupleTypeMetadata2;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  __int128 v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v33 = a1;
  v31 = a3;
  v32 = a7;
  v9 = sub_1A09B4000();
  MEMORY[0x1E0C80A78](v9);
  v29 = (char *)&v28 - v10;
  v11 = sub_1A09B3F34();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v13 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(int *)(MEMORY[0x1E0C80A78](v13) + 48);
  v30 = (char *)&v28 + v17 - v16;
  v18 = (char *)a2 + v17;
  v19 = *a2;
  *(_QWORD *)((char *)&v28 - v16) = *a2;
  v20 = *(_QWORD *)(a4 - 8);
  v21 = *(void (**)(void))(v20 + 16);
  v21();
  *(_QWORD *)&v34 = v19;
  swift_bridgeObjectRetain();
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEAF28], v11);
  sub_1A09B3EF8();
  swift_bridgeObjectRelease();
  v22 = v38;
  v23 = v39;
  v24 = &v15[*(int *)(TupleTypeMetadata2 + 48)];
  v28 = v37;
  ((void (*)(char *, char *, uint64_t))v21)(v24, v18, a4);
  v25 = v29;
  (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v29, v24, a4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v25, 0, 1, a4);
  v34 = v28;
  v35 = v22;
  v36 = v23;
  v26 = sub_1A09B4018();
  v40 = v32;
  MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v26, &v40);
  sub_1A09B3EBC();
  sub_1A09B3EE0();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v30, a4);
}

void Trie.subscript.getter()
{
  type metadata accessor for StandardTrieNode();
}

void sub_1A09702B0(uint64_t a1)
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

  *(_QWORD *)(v9 - 184) = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v9 - 144) = v2;
  *(_QWORD *)(v9 - 136) = v4;
  *(_QWORD *)(v9 - 128) = v1;
  *(_QWORD *)(v9 - 120) = v6;
  *(_QWORD *)(v9 - 112) = v7;
  *(_QWORD *)(v9 - 104) = v3;
  *(_QWORD *)(v9 - 96) = v8;
  *(_QWORD *)(v9 - 88) = v5;
  type metadata accessor for Trie.RootNode();
}

uint64_t sub_1A09702FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[96];

  v6 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v8 = &v12[-v7];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 16))(&v12[-v7], *(_QWORD *)(v4 - 168), a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(*(_QWORD *)(v4 - 160), 1, 1, v3);
    return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, a1);
  }
  else
  {
    v10 = *(_QWORD *)(v4 - 184);
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v10 + 32))(v2, v8, v1);
    *(_QWORD *)(v4 - 152) = *(_QWORD *)(v4 - 176);
    v11 = sub_1A09B3F34();
    swift_bridgeObjectRetain();
    MEMORY[0x1A1AFE604](MEMORY[0x1E0DEAF28], v11);
    sub_1A09B3EF8();
    swift_bridgeObjectRelease();
    sub_1A096C290(*(_QWORD *)(v4 - 144), *(_QWORD *)(v4 - 136), *(_QWORD *)(v4 - 128), *(_QWORD *)(v4 - 120), v1, *(_QWORD *)(v4 - 160));
    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v2, v1);
  }
}

void static Trie.== infix(_:_:)()
{
  sub_1A096E4A0();
}

uint64_t sub_1A097044C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65646F4E746F6F72 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1A09B40E4();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A09704D0()
{
  sub_1A09B4108();
  sub_1A09B4114();
  return sub_1A09B4120();
}

uint64_t sub_1A0970510()
{
  return sub_1A09B4114();
}

uint64_t sub_1A0970534()
{
  sub_1A09B4108();
  sub_1A09B4114();
  return sub_1A09B4120();
}

uint64_t sub_1A0970570()
{
  return 0x65646F4E746F6F72;
}

uint64_t sub_1A0970588@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A097044C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A09705D0@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X8>)
{
  return sub_1A09705DC(a1, (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096F928, a2);
}

uint64_t sub_1A09705DC@<X0>(_QWORD *a1@<X1>, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD)@<X3>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = a2(a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9]);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A097061C(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B98E0, a1);
  return sub_1A09B4144();
}

uint64_t sub_1A0970650(uint64_t a1)
{
  MEMORY[0x1A1AFE604](&unk_1A09B98E0, a1);
  return sub_1A09B4150();
}

void Trie.encode(to:)()
{
  type metadata accessor for Trie.CodingKeys();
}

void sub_1A09706EC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  MEMORY[0x1A1AFE604](&unk_1A09B98E0, a1);
  v4 = sub_1A09B40D8();
  MEMORY[0x1E0C80A78](v4);
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_1A09B4138();
  v5 = *(_QWORD *)(v3 - 160);
  *(_QWORD *)(v3 - 144) = v1;
  *(_QWORD *)(v3 - 136) = v5;
  v6 = *(_QWORD *)(v3 - 176);
  *(_QWORD *)(v3 - 128) = *(_QWORD *)(v3 - 168);
  *(_QWORD *)(v3 - 120) = v6;
  v7 = *(_QWORD *)(v3 - 192);
  *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 184);
  *(_QWORD *)(v3 - 104) = v7;
  v8 = *(_QWORD *)(v3 - 208);
  *(_QWORD *)(v3 - 96) = *(_QWORD *)(v3 - 200);
  *(_QWORD *)(v3 - 88) = v8;
  type metadata accessor for Trie.RootNode();
}

uint64_t sub_1A09707A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  MEMORY[0x1A1AFE604](&unk_1A09B98B8, a1);
  sub_1A09B40CC();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v3, v2);
}

void Trie.init(from:)()
{
  type metadata accessor for Trie.RootNode();
}

void sub_1A097087C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v17 - 200) = *(_QWORD *)(a1 - 8);
  *(_QWORD *)(v17 - 192) = a1;
  MEMORY[0x1E0C80A78](a1);
  *(_QWORD *)(v17 - 184) = (char *)&a9 - v18;
  *(_QWORD *)(v17 - 144) = v15;
  *(_QWORD *)(v17 - 136) = v12;
  *(_QWORD *)(v17 - 128) = v13;
  *(_QWORD *)(v17 - 120) = v14;
  *(_QWORD *)(v17 - 112) = v11;
  *(_QWORD *)(v17 - 104) = v16;
  *(_QWORD *)(v17 - 96) = v9;
  *(_QWORD *)(v17 - 88) = v10;
  type metadata accessor for Trie.CodingKeys();
}

void sub_1A09708C8(uint64_t a1)
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

  *(_QWORD *)(v8 - 160) = MEMORY[0x1A1AFE604](&unk_1A09B98E0, a1);
  v9 = sub_1A09B40A8();
  *(_QWORD *)(v8 - 176) = v9;
  *(_QWORD *)(v8 - 208) = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  *(_QWORD *)(v8 - 144) = v6;
  *(_QWORD *)(v8 - 136) = v3;
  *(_QWORD *)(v8 - 128) = v4;
  *(_QWORD *)(v8 - 120) = v5;
  *(_QWORD *)(v8 - 112) = v2;
  *(_QWORD *)(v8 - 104) = v7;
  *(_QWORD *)(v8 - 96) = *(_QWORD *)(v8 - 168);
  *(_QWORD *)(v8 - 88) = v1;
  type metadata accessor for Trie();
}

uint64_t sub_1A0970940(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v14 - v5;
  v7 = *(_QWORD **)(v2 - 152);
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  *(_QWORD *)(v2 - 168) = v1;
  v8 = *(_QWORD *)(v2 - 72);
  sub_1A09B412C();
  v9 = (uint64_t)v7;
  if (!v8)
  {
    *(_QWORD *)(v2 - 160) = v4;
    *(_QWORD *)(v2 - 72) = a1;
    v10 = *(_QWORD *)(v2 - 208);
    v11 = *(_QWORD *)(v2 - 200);
    v12 = *(_QWORD *)(v2 - 192);
    MEMORY[0x1A1AFE604](&unk_1A09B9890, v12);
    sub_1A09B4090();
    (*(void (**)(_QWORD, _QWORD))(v10 + 8))(*(_QWORD *)(v2 - 168), *(_QWORD *)(v2 - 176));
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 32))(v6, *(_QWORD *)(v2 - 184), v12);
    (*(void (**)(_QWORD, char *, _QWORD))(*(_QWORD *)(v2 - 160) + 32))(*(_QWORD *)(v2 - 216), v6, *(_QWORD *)(v2 - 72));
    v9 = (uint64_t)v7;
  }
  return __swift_destroy_boxed_opaque_existential_1(v9);
}

uint64_t sub_1A0970A70(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1A0970A8C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))Trie.init(from:));
}

uint64_t sub_1A0970A8C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(a1, a2[2], a2[3], a2[4], a2[5], a2[6], a2[7], a2[8], a2[9]);
}

void sub_1A0970AD0()
{
  Trie.encode(to:)();
}

uint64_t sub_1A0970AE4(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  return sub_1A0970AF0(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))static Trie.== infix(_:_:));
}

uint64_t sub_1A0970AF0(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  return a5(a1, a2, a3[2], a3[3], a3[4], a3[5], a3[6], a3[7], a3[8], a3[9]) & 1;
}

unint64_t sub_1A0970B2C(unsigned __int8 a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x1A1AFD11C](*(_QWORD *)(v1 + 40), a1, 1);
  return sub_1A0970BA8(a1, v3);
}

unint64_t sub_1A0970B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_1A09B3EEC();
  return sub_1A0970C48(a1, v6, a2, a3);
}

unint64_t sub_1A0970BA8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(unsigned __int8 *)(v7 + result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(unsigned __int8 *)(v7 + result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1A0970C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  char v16;
  _QWORD v18[2];

  v5 = v4;
  v18[0] = a1;
  v18[1] = a4;
  v7 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = -1 << *(_BYTE *)(v5 + 32);
  v12 = v11 & ~v10;
  if (((*(_QWORD *)(v5 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v13 = ~v10;
    v14 = *(_QWORD *)(v7 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v15(v9, *(_QWORD *)(v5 + 48) + v14 * v12, a3);
      v16 = sub_1A09B3F04();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, a3);
      if ((v16 & 1) != 0)
        break;
      v12 = (v12 + 1) & v13;
    }
    while (((*(_QWORD *)(v5 + 64 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  return v12;
}

unint64_t sub_1A0970D60()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EE5A98D8[0];
  if (!qword_1EE5A98D8[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EE5A98D0);
    v2 = MEMORY[0x1E0DEDA80];
    result = MEMORY[0x1A1AFE604](MEMORY[0x1E0DEBF60], v1, &v2);
    atomic_store(result, qword_1EE5A98D8);
  }
  return result;
}

uint64_t sub_1A0970DBC(uint64_t a1, uint64_t a2)
{
  return sub_1A0972DF4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096FC4C);
}

void type metadata accessor for Trie.RootNode()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

uint64_t sub_1A0970DE4(uint64_t a1, uint64_t a2)
{
  return sub_1A0972DF4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A0970020);
}

void type metadata accessor for StandardTrieNode()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

void type metadata accessor for Trie.CodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for Trie()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1A0970E68()
{
  return swift_allocateGenericValueMetadata();
}

void sub_1A0970E70()
{
  type metadata accessor for Trie.RootNode();
}

uint64_t sub_1A0970F0C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A0970F24()
{
  return 0;
}

uint64_t sub_1A0970F30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A09B4000();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A0970FA4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if ((v7 & 0x1000F8) != 0 || ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 24)))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A09710B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return swift_bridgeObjectRelease();
}

void *sub_1A0971120(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  *(_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A09711E8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  *(_QWORD *)(((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1A0971304(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  *(_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A09713C8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  *(_QWORD *)(((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A09714DC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  if (v7 < a2)
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X16 }
  }
  if (v6 < 0x7FFFFFFE)
  {
    v14 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    if (v14 >= 0xFFFFFFFF)
      LODWORD(v14) = -1;
    if ((v14 + 1) >= 2)
      return v14;
    else
      return 0;
  }
  else
  {
    v13 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v13 >= 2)
      return v13 - 1;
    else
      return 0;
  }
}

void sub_1A097161C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_1A0971714@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t result;

  v12[v13] = 0;
  if (a1)
  {
    if (v10 < 0x7FFFFFFE)
    {
      v15 = (_QWORD *)((unint64_t)&v12[a2 + 7] & 0xFFFFFFFFFFFFFFF8);
      if (a1 > 0x7FFFFFFE)
      {
        *v15 = 0;
        *(_DWORD *)v15 = a1 - 0x7FFFFFFF;
      }
      else
      {
        *v15 = a1;
      }
    }
    else if (v10 >= a1)
    {
      return (*(uint64_t (**)(_BYTE *, _QWORD))(v11 + 56))(v12, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v14 = a2;
      else
        v14 = 4;
      bzero(v12, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_1A097181C()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1A097182C()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_1A0971834()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_1A0971840()
{
  type metadata accessor for StandardTrieNode();
}

uint64_t *sub_1A097190C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  unint64_t v9;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  int v15;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  v9 = (v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  if ((v7 & 0x1000F8) != 0 || v9 + 9 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    v12 = v9 + 8;
    v13 = *((unsigned __int8 *)a2 + v9 + 8);
    if (((v9 + 8) & 0xFFFFFFF8) != 0 && v13 >= 2)
      v13 = *(_DWORD *)a2 + 2;
    v15 = (*(uint64_t (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 24));
    if (v13 == 1)
    {
      if (v15)
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      *((_BYTE *)a1 + v12) = 1;
    }
    else
    {
      if (v15)
      {
        memcpy(a1, a2, v8);
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      *((_BYTE *)a1 + v12) = 0;
    }
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A0971ABC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 24);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return swift_bridgeObjectRelease();
}

void *sub_1A0971B34(void *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;
  unsigned int v9;
  int v11;
  char v12;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84))
    v7 = *(_QWORD *)(v6 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64) + 1;
  v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0)
    v9 = *a2 + 2;
  v11 = (*(uint64_t (**)(_DWORD *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 24));
  if (v9 == 1)
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    v12 = 1;
  }
  else
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    v12 = 0;
    *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
  }
  *((_BYTE *)a1 + v8) = v12;
  swift_bridgeObjectRetain();
  return a1;
}

_DWORD *sub_1A0971CA8(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;
  unsigned int (*v9)(_DWORD *, uint64_t, uint64_t);
  unsigned int v10;
  unsigned int v12;
  char v13;
  void (*v14)(_DWORD *, _QWORD, uint64_t, uint64_t);

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    v9 = *(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48);
    if (!v9(a1, 1, *(_QWORD *)(a3 + 24)))
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, v5);
    swift_bridgeObjectRelease();
    v10 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    v12 = v9(a2, 1, v5);
    if (v10 == 1)
    {
      if (v12)
      {
        memcpy(a1, a2, v7);
        v13 = 1;
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
        v14 = *(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56);
        v13 = 1;
        v14(a1, 0, 1, v5);
      }
    }
    else
    {
      if (v12)
      {
        memcpy(a1, a2, v7);
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
        (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      v13 = 0;
    }
    *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v8) = v13;
    swift_bridgeObjectRetain();
  }
  return a1;
}

void *sub_1A0971E3C(void *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;
  unsigned int v9;
  int v11;
  char v12;
  void (*v13)(void *, _QWORD, uint64_t, uint64_t);

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  if (*(_DWORD *)(v6 + 84))
    v7 = *(_QWORD *)(v6 + 64);
  else
    v7 = *(_QWORD *)(v6 + 64) + 1;
  v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v9 = *((unsigned __int8 *)a2 + v8);
  if (v9 >= 2 && (v8 & 0xFFFFFFF8) != 0)
    v9 = *a2 + 2;
  v11 = (*(uint64_t (**)(_DWORD *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 24));
  if (v9 == 1)
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
      v12 = 1;
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v13 = *(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56);
      v12 = 1;
      v13(a1, 0, 1, v5);
    }
  }
  else
  {
    if (v11)
    {
      memcpy(a1, a2, v7);
    }
    else
    {
      (*(void (**)(void *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    v12 = 0;
  }
  *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
  *((_BYTE *)a1 + v8) = v12;
  return a1;
}

_DWORD *sub_1A0971F90(_DWORD *a1, _DWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  unint64_t v8;
  unsigned int (*v9)(_DWORD *, uint64_t, uint64_t);
  unsigned int v10;
  unsigned int v12;
  char v13;
  void (*v14)(_DWORD *, _QWORD, uint64_t, uint64_t);

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 24);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_DWORD *)(v6 + 84))
      v7 = *(_QWORD *)(v6 + 64);
    else
      v7 = *(_QWORD *)(v6 + 64) + 1;
    v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    v9 = *(unsigned int (**)(_DWORD *, uint64_t, uint64_t))(v6 + 48);
    if (!v9(a1, 1, *(_QWORD *)(a3 + 24)))
      (*(void (**)(_DWORD *, uint64_t))(v6 + 8))(a1, v5);
    swift_bridgeObjectRelease();
    v10 = *((unsigned __int8 *)a2 + v8);
    if ((v8 & 0xFFFFFFF8) != 0 && v10 >= 2)
      v10 = *a2 + 2;
    v12 = v9(a2, 1, v5);
    if (v10 == 1)
    {
      if (v12)
      {
        memcpy(a1, a2, v7);
        v13 = 1;
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
        v14 = *(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56);
        v13 = 1;
        v14(a1, 0, 1, v5);
      }
    }
    else
    {
      if (v12)
      {
        memcpy(a1, a2, v7);
      }
      else
      {
        (*(void (**)(_DWORD *, _DWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
        (*(void (**)(_DWORD *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      }
      v13 = 0;
    }
    *(_QWORD *)(((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFF8);
    *((_BYTE *)a1 + v8) = v13;
  }
  return a1;
}

uint64_t sub_1A0972120(unsigned __int8 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  unsigned int v9;
  int v10;
  int v12;
  int v13;
  unsigned int v14;

  v3 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v4 = *(_DWORD *)(v3 + 84);
  v5 = *(_QWORD *)(v3 + 64);
  if (!v4)
    ++v5;
  if (!a2)
    return 0;
  v6 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  if (a2 < 0xFF)
    goto LABEL_20;
  v7 = v6 + 9;
  v8 = 8 * (v6 + 9);
  if ((v6 + 9) <= 3)
  {
    v9 = (a2 + 1) >> v8;
    if (v9 > 0xFFFE)
    {
      v10 = *(_DWORD *)&a1[v7];
      if (!v10)
        goto LABEL_20;
      goto LABEL_13;
    }
    if (v9 > 0xFE)
    {
      v10 = *(unsigned __int16 *)&a1[v7];
      if (!*(_WORD *)&a1[v7])
        goto LABEL_20;
      goto LABEL_13;
    }
    if (!v9)
      goto LABEL_20;
  }
  v10 = a1[v7];
  if (!a1[v7])
  {
LABEL_20:
    v14 = a1[v6 + 8];
    if (v14 >= 2)
      return (v14 ^ 0xFF) + 1;
    else
      return 0;
  }
LABEL_13:
  v12 = (v10 - 1) << v8;
  if (v7 >= 4)
    v12 = 0;
  if ((_DWORD)v7 == 1)
    v13 = *a1;
  else
    v13 = *(_DWORD *)a1;
  return (v13 | v12) + 255;
}

void sub_1A09721E8(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v6 = *(_DWORD *)(v5 + 84);
  v7 = *(_QWORD *)(v5 + 64);
  if (!v6)
    ++v7;
  v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = v8 + 9;
  if (a3 < 0xFF)
  {
    v10 = 0u;
  }
  else if (v9 <= 3)
  {
    v12 = (a3 + 1) >> (8 * v9);
    if (v12 > 0xFFFE)
    {
      v10 = 4u;
    }
    else if (v12 >= 0xFF)
    {
      v10 = 2;
    }
    else
    {
      v10 = v12 != 0;
    }
  }
  else
  {
    v10 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v11 = a2 - 255;
  if (v9 < 4)
  {
    bzero(a1, v9);
    if ((_DWORD)v9 == 1)
    {
      *a1 = v11;
      goto LABEL_20;
    }
    v11 = v11;
  }
  else
  {
    bzero(a1, v8 + 9);
  }
  *(_DWORD *)a1 = v11;
LABEL_20:
  __asm { BR              X10 }
}

uint64_t sub_1A0972364(_DWORD *a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  v3 = *(_DWORD *)(v2 + 84);
  v4 = *(_QWORD *)(v2 + 64);
  if (!v3)
    ++v4;
  v5 = ((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v6 = *((unsigned __int8 *)a1 + v5);
  v7 = v5 & 0xFFFFFFF8;
  if (v6 >= 2 && v7 != 0)
    return (*a1 + 2);
  return v6;
}

void sub_1A09723AC(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  size_t v7;
  char v8;
  unsigned int v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v6;
  v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (a2 > 1)
  {
    if ((v7 & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2;
    if ((v7 & 0xFFFFFFF8) != 0)
      v9 = a2 - 2;
    else
      v9 = 0;
    a1[v7] = v8;
    bzero(a1, v7);
    *(_DWORD *)a1 = v9;
  }
  else
  {
    a1[v7] = a2;
  }
}

void type metadata accessor for StringTrieNode()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

uint64_t sub_1A0972430()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A0972438()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A09B4000();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A09724AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if ((v7 & 0x1000F8) != 0 || ((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    if ((*(unsigned int (**)(uint64_t *, uint64_t, _QWORD))(v6 + 48))(a2, 1, *(_QWORD *)(a3 + 16)))
    {
      memcpy(a1, a2, v8);
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    }
    *(_QWORD *)(((unint64_t)a1 + v8 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1A09725B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(a1, 1, v3))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return swift_bridgeObjectRelease();
}

void *sub_1A0972628(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  *(_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

void *sub_1A09726F0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 16))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 24))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  *(_QWORD *)(((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_1A097280C(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(a2, 1, v5))
  {
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
    if (v7)
      v9 = v8;
    else
      v9 = v8 + 1;
    memcpy(a1, a2, v9);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(a1, a2, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
    v7 = *(_DWORD *)(v6 + 84);
    v8 = *(_QWORD *)(v6 + 64);
  }
  if (v7)
    v10 = v8;
  else
    v10 = v8 + 1;
  *(_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

void *sub_1A09728D0(void *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(void *, uint64_t, uint64_t);
  int v8;
  int v9;
  size_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v6 + 48);
  v8 = v7(a1, 1, v5);
  v9 = v7(a2, 1, v5);
  if (v8)
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 32))(a1, a2, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(a1, 0, 1, v5);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v9)
    {
      (*(void (**)(void *, void *, uint64_t))(v6 + 40))(a1, a2, v5);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v6 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v6 + 84))
    v10 = *(_QWORD *)(v6 + 64);
  else
    v10 = *(_QWORD *)(v6 + 64) + 1;
  memcpy(a1, a2, v10);
LABEL_10:
  if (*(_DWORD *)(v6 + 84))
    v11 = *(_QWORD *)(v6 + 64);
  else
    v11 = *(_QWORD *)(v6 + 64) + 1;
  *(_QWORD *)(((unint64_t)a1 + v11 + 7) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v11 + 7) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A09729E4(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v13;
  unint64_t v14;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  if (v7 < a2)
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    __asm { BR              X16 }
  }
  if (v6 < 0x7FFFFFFE)
  {
    v14 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
    if (v14 >= 0xFFFFFFFF)
      LODWORD(v14) = -1;
    if ((v14 + 1) >= 2)
      return v14;
    else
      return 0;
  }
  else
  {
    v13 = (*(uint64_t (**)(void))(v4 + 48))();
    if (v13 >= 2)
      return v13 - 1;
    else
      return 0;
  }
}

void sub_1A0972B24(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((_DWORD)v11 + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X13 }
}

uint64_t sub_1A0972C1C@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned int v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  int v14;
  _QWORD *v15;
  uint64_t result;

  v12[v13] = 0;
  if (a1)
  {
    if (v10 < 0x7FFFFFFE)
    {
      v15 = (_QWORD *)((unint64_t)&v12[a2 + 7] & 0xFFFFFFFFFFFFFFF8);
      if (a1 > 0x7FFFFFFE)
      {
        *v15 = 0;
        *(_DWORD *)v15 = a1 - 0x7FFFFFFF;
      }
      else
      {
        *v15 = a1;
      }
    }
    else if (v10 >= a1)
    {
      return (*(uint64_t (**)(_BYTE *, _QWORD))(v11 + 56))(v12, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v14 = a2;
      else
        v14 = 4;
      bzero(v12, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_1A0972D24()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1A0972D34()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_1A0972D3C()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

void sub_1A0972D48()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0972D58()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0972D68()
{
  JUMPOUT(0x1A1AFE604);
}

uint64_t sub_1A0972D78()
{
  return 2;
}

void type metadata accessor for Trie.RootNode.StringCodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

void type metadata accessor for Trie.RootNode.StandardCodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

void type metadata accessor for Trie.RootNode.CodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

void type metadata accessor for StandardTrieNode.CodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

void type metadata accessor for StringTrieNode.CodingKeys()
{
  JUMPOUT(0x1A1AFE5BCLL);
}

uint64_t sub_1A0972DBC(uint64_t a1, uint64_t a2)
{
  return sub_1A0972DF4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096D1E4);
}

uint64_t sub_1A0972DD8(uint64_t a1, uint64_t a2)
{
  return sub_1A0972DF4(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A096D97C);
}

uint64_t sub_1A0972DF4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6], v3[7], v3[8], v3[9]);
}

uint64_t sub_1A0972E28()
{
  return swift_deallocObject();
}

uint64_t sub_1A0972E38()
{
  uint64_t *v0;

  return sub_1A096D8E8(v0[2], v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_1A0972E4C()
{
  return swift_deallocObject();
}

uint64_t sub_1A0972E5C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;

  return sub_1A096B85C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

void sub_1A0972E78()
{
  sub_1A096BC90();
}

uint64_t sub_1A0972E94()
{
  return swift_deallocObject();
}

uint64_t sub_1A0972EA4()
{
  return sub_1A096BC20();
}

uint64_t sub_1A0972EB0()
{
  return swift_deallocObject();
}

uint64_t sub_1A0972EC0()
{
  return swift_allocateGenericValueMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1A0972EDC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1A0972EE4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

uint64_t sub_1A0972EF0(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t sub_1A0972F80(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1A0972FCC + 4 * byte_1A09B9575[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A0973000 + 4 * byte_1A09B9570[v4]))();
}

uint64_t sub_1A0973000(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0973008(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A0973010);
  return result;
}

uint64_t sub_1A097301C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A0973024);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A0973028(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0973030(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A097303C(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t sub_1A097308C(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1A09730CC + 4 * byte_1A09B957A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A09730EC + 4 * byte_1A09B957F[v4]))();
}

_BYTE *sub_1A09730CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A09730EC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A09730F4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A09730FC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A0973104(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A097310C(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_1A0973118()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973128()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973138()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973148()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973158()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973168()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973178()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973188()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A0973198()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731A8()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731B8()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731C8()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731D8()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731E8()
{
  JUMPOUT(0x1A1AFE604);
}

void sub_1A09731F8()
{
  JUMPOUT(0x1A1AFE604);
}

uint64_t sub_1A0973208()
{
  return sub_1A096C938();
}

BOOL sub_1A0973214(int a1, int a2)
{
  return sub_1A096C928(a1, a2);
}

void sub_1A09752D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t cfAllocateAlwaysFailing()
{
  return 0;
}

void cfDeallocateReleaseInfo(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

id corruptionError(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The lazy plist archive is corrupt: %@"), v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("The lazy plist archive is corrupt."), *MEMORY[0x1E0CB2D50]);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB2D68]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2AA0]);
  v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 4, v9);

  return v10;
}

void sub_1A0976828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__133(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__134(uint64_t a1)
{

}

uint64_t cfAllocateAlwaysFailing_176()
{
  return 0;
}

void cfDeallocateReleaseInfo_177(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

id notPLPlistError(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The file is not a lazy plist archive: %@"), v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("The file is not a lazy plist archive."), *MEMORY[0x1E0CB2D50]);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB2D68]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2AA0]);
  v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 2, v9);

  return v10;
}

void _PASEnumerateSimpleLinesInString(void *a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t (**v6)(id, unint64_t, uint64_t);
  __CFString *v7;
  void *v8;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  UniChar v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  __CFString *v31;
  id v32;
  uint64_t (**v33)(id, unint64_t, uint64_t);
  UniChar buffer[8];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  CFStringRef theString;
  const UniChar *v43;
  const char *v44;
  uint64_t v45;
  CFIndex v46;
  int64_t v47;
  int64_t v48;
  CFRange v49;

  v5 = a1;
  v6 = a2;
  if (objc_msgSend(v5, "length"))
  {
    v7 = (__CFString *)v5;
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
      goto LABEL_35;
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    *(_OWORD *)buffer = 0u;
    v35 = 0u;
    Length = CFStringGetLength(v7);
    theString = v7;
    v45 = 0;
    v46 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v7);
    CStringPtr = 0;
    v43 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
    v47 = 0;
    v48 = 0;
    v44 = CStringPtr;
    if (Length > 0)
    {
      v31 = v7;
      v32 = v5;
      v33 = v6;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 64;
      do
      {
        if ((unint64_t)v15 >= 4)
          v17 = 4;
        else
          v17 = v15;
        v18 = v46;
        if (v46 <= v15)
        {
          ++v14;
        }
        else
        {
          if (v43)
          {
            v19 = v43[v15 + v45];
          }
          else if (v44)
          {
            v19 = v44[v45 + v15];
          }
          else
          {
            v20 = v47;
            if (v48 <= v15 || v47 > v15)
            {
              v22 = v17 + v12;
              v23 = v16 - v17;
              v24 = v15 - v17;
              v25 = v24 + 64;
              if (v24 + 64 >= v46)
                v25 = v46;
              v47 = v24;
              v48 = v25;
              if (v46 >= v23)
                v18 = v23;
              v49.length = v18 + v22;
              v49.location = v24 + v45;
              CFStringGetCharacters(theString, v49, buffer);
              v20 = v47;
            }
            v19 = buffer[v15 - v20];
          }
          ++v14;
          if (v19 == 10)
          {
            if ((a3 & 1) != 0 || v14 - v13 >= 2)
            {
              v26 = a3;
              v27 = MEMORY[0x1A1AFDC98]();
              v28 = v33[2](v33, v13, v14 - v13);
              v29 = (void *)v27;
              a3 = v26;
              objc_autoreleasePoolPop(v29);
              v13 = v14;
              if (!v28)
              {
                v5 = v32;
                v6 = v33;
                v7 = v31;
                goto LABEL_35;
              }
            }
            else
            {
              v13 = v14;
            }
          }
        }
        ++v15;
        --v12;
        ++v16;
      }
      while (Length != v15);

      v5 = v32;
      v6 = v33;
      if (v14 > v13)
      {
        v30 = (void *)MEMORY[0x1A1AFDC98]();
        v33[2](v33, v13, v14 - v13);
        objc_autoreleasePoolPop(v30);
      }
    }
    else
    {
LABEL_35:

    }
  }

}

void _PASEnumerateSimpleLinesInUTF8Data(void *a1, void *a2, char a3)
{
  uint64_t (**v5)(id, _QWORD, unint64_t);
  id v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  void *v17;
  id v18;

  v18 = a1;
  v5 = a2;
  if (!objc_msgSend(v18, "length"))
    goto LABEL_14;
  v6 = objc_retainAutorelease(v18);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");
  if (!v8)
    goto LABEL_14;
  v9 = v8;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11 + 1;
    if (*(_BYTE *)(v7 + v11) != 10)
    {
      v13 = v10;
LABEL_10:
      v10 = v13;
      goto LABEL_11;
    }
    v13 = v11 + 1;
    v14 = v11 - v10 + 1;
    if ((a3 & 1) == 0 && v14 < 2)
      goto LABEL_10;
    v15 = (void *)MEMORY[0x1A1AFDC98]();
    v16 = v5[2](v5, v10, v14);
    objc_autoreleasePoolPop(v15);
    if (v16)
      goto LABEL_10;
LABEL_11:
    v11 = v12;
  }
  while (v9 != v12);
  if (v9 > v10)
  {
    v17 = (void *)MEMORY[0x1A1AFDC98]();
    v5[2](v5, v10, v9 - v10);
    objc_autoreleasePoolPop(v17);
  }
LABEL_14:

}

id _PASBytesToHex(char *a1, uint64_t a2)
{
  uint64_t v2;
  char *v3;
  size_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  char v10;
  unsigned int v11;
  char v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  uint64_t v18;
  void *memptr;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = a2;
    v3 = a1;
    v4 = (2 * a2) | 1;
    memptr = 0;
    v20 = 0;
    if (v4 > 0x400)
    {
      v16 = malloc_type_posix_memalign(&memptr, 8uLL, v4, 0x20F40F3CuLL);
      LOBYTE(v20) = 0;
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v17);
      }
      v5 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](a1);
      v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v5, v4);
      memptr = v5;
      LOBYTE(v20) = 1;
    }
    v6 = 2 * v2;
    v7 = v20;
    if (v2)
    {
      v8 = v5 + 1;
      do
      {
        if (*v3 >= 0xA0u)
          v9 = 87;
        else
          v9 = 48;
        *(v8 - 1) = v9 + (*v3 >> 4);
        v10 = *v3++;
        v11 = v10 & 0xF;
        if (v11 >= 0xA)
          v12 = 87;
        else
          v12 = 48;
        *v8 = v12 + v11;
        v8 += 2;
        --v2;
      }
      while (v2);
    }
    v5[v6] = 0;
    v13 = (void *)MEMORY[0x1A1AFDC98]();
    objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v5, v7, v4, 1, 1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

_BYTE *_PASHexToBytes(_BYTE *result, unint64_t a2, size_t *a3)
{
  _BYTE *v4;
  size_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  char v9;
  char v10;
  char v11;
  unsigned int v12;
  int v13;
  char v14;
  char v15;
  id v16;

  if (result)
  {
    v4 = result;
    v5 = a2 >> 1;
    if (a3)
      *a3 = v5;
    result = malloc_type_malloc(v5, 0x2212EFC4uLL);
    if (!result)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v16);
    }
    if (a2)
    {
      v6 = 0;
      v7 = v4 + 1;
      do
      {
        v8 = (char)*(v7 - 1);
        if (v8 >= 58)
          v9 = 9;
        else
          v9 = 0;
        v10 = v9 + v8;
        v12 = *v7;
        v7 += 2;
        v11 = v12;
        v13 = (char)v12;
        if (v12 >= 0x47)
          v14 = -87;
        else
          v14 = -55;
        if (v13 >= 58)
          v15 = v14;
        else
          v15 = -48;
        result[v6++] = v15 + v11 + 16 * v10;
      }
      while (((a2 - 1) >> 1) + 1 != v6);
    }
  }
  return result;
}

uint64_t _PASIsAllDigits(void *a1)
{
  __CFString *v1;
  void *v2;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFIndex v11;
  UniChar v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFIndex v17;
  uint64_t v18;
  _OWORD v20[8];
  CFStringRef theString;
  const UniChar *v22;
  const char *v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  CFRange v28;

  v1 = a1;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    goto LABEL_26;
  memset(v20, 0, sizeof(v20));
  Length = CFStringGetLength(v1);
  theString = v1;
  v24 = 0;
  v25 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v22 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v26 = 0;
  v27 = 0;
  v23 = CStringPtr;
  if (Length >= 1)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 64;
    while (1)
    {
      v10 = (unint64_t)v8 >= 4 ? 4 : v8;
      v11 = v25;
      if (v25 <= v8)
        break;
      if (v22)
      {
        v12 = v22[v8 + v24];
      }
      else if (v23)
      {
        v12 = v23[v24 + v8];
      }
      else
      {
        if (v27 <= v8 || v7 > v8)
        {
          v14 = v10 + v6;
          v15 = v9 - v10;
          v16 = v8 - v10;
          v17 = v16 + 64;
          if (v16 + 64 >= v25)
            v17 = v25;
          v26 = v16;
          v27 = v17;
          if (v25 >= v15)
            v11 = v15;
          v28.length = v11 + v14;
          v28.location = v16 + v24;
          CFStringGetCharacters(theString, v28, (UniChar *)v20);
          v7 = v26;
        }
        v12 = *((_WORD *)v20 + v8 - v7);
      }
      if ((unsigned __int16)(v12 - 48) >= 0xAu)
        break;
      ++v8;
      --v6;
      ++v9;
      if (Length == v8)
        goto LABEL_26;
    }
    v18 = 0;
  }
  else
  {
LABEL_26:
    v18 = 1;
  }

  return v18;
}

uint64_t _PASIsAllUppercase(void *a1)
{
  id v1;
  const __CFCharacterSet *Predefined;
  __CFString *v3;
  void *v4;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  UniChar v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  uint64_t v20;
  _OWORD v22[8];
  CFStringRef theString;
  const UniChar *v24;
  const char *v25;
  uint64_t v26;
  CFIndex v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;

  v1 = a1;
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  v3 = (__CFString *)v1;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_28;
  memset(v22, 0, sizeof(v22));
  Length = CFStringGetLength(v3);
  theString = v3;
  v26 = 0;
  v27 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v3);
  CStringPtr = 0;
  v24 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
  v28 = 0;
  v29 = 0;
  v25 = CStringPtr;
  if (Length >= 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 64;
    while (1)
    {
      v11 = (unint64_t)v9 >= 4 ? 4 : v9;
      v12 = v27;
      if (v27 <= v9)
      {
        v13 = 0;
      }
      else if (v24)
      {
        v13 = v24[v9 + v26];
      }
      else if (v25)
      {
        v13 = v25[v26 + v9];
      }
      else
      {
        v14 = v28;
        if (v29 <= v9 || v28 > v9)
        {
          v16 = v11 + v8;
          v17 = v10 - v11;
          v18 = v9 - v11;
          v19 = v18 + 64;
          if (v18 + 64 >= v27)
            v19 = v27;
          v28 = v18;
          v29 = v19;
          if (v27 >= v17)
            v12 = v17;
          v30.length = v12 + v16;
          v30.location = v18 + v26;
          CFStringGetCharacters(theString, v30, (UniChar *)v22);
          v14 = v28;
        }
        v13 = *((_WORD *)v22 + v9 - v14);
      }
      if (CFCharacterSetIsCharacterMember(Predefined, v13))
        break;
      ++v9;
      --v8;
      ++v10;
      if (Length == v9)
        goto LABEL_28;
    }
    v20 = 0;
  }
  else
  {
LABEL_28:
    v20 = 1;
  }

  return v20;
}

uint64_t _PASLooksLikeNumber(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  CFIndex v12;
  UniChar v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFIndex v18;
  _OWORD v20[8];
  CFStringRef theString;
  const UniChar *v22;
  const char *v23;
  uint64_t v24;
  CFIndex v25;
  uint64_t v26;
  uint64_t v27;
  CFRange v28;

  v1 = a1;
  objc_opt_self();
  v2 = objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    memset(v20, 0, sizeof(v20));
    Length = CFStringGetLength(v1);
    theString = v1;
    v24 = 0;
    v25 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v1);
    CStringPtr = 0;
    v22 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
    v26 = 0;
    v27 = 0;
    v23 = CStringPtr;
    if (Length < 1)
    {
      v9 = 0;
LABEL_30:
      v2 = v9 & 1;
    }
    else
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 64;
      while (1)
      {
        v11 = (unint64_t)v8 >= 4 ? 4 : v8;
        v12 = v25;
        if (v25 <= v8)
          break;
        if (v22)
        {
          v13 = v22[v8 + v24];
        }
        else if (v23)
        {
          v13 = v23[v24 + v8];
        }
        else
        {
          if (v27 <= v8 || v7 > v8)
          {
            v15 = v11 + v6;
            v16 = v10 - v11;
            v17 = v8 - v11;
            v18 = v17 + 64;
            if (v17 + 64 >= v25)
              v18 = v25;
            v26 = v17;
            v27 = v18;
            if (v25 >= v16)
              v12 = v16;
            v28.length = v12 + v15;
            v28.location = v17 + v24;
            CFStringGetCharacters(theString, v28, (UniChar *)v20);
            v7 = v26;
          }
          v13 = *((_WORD *)v20 + v8 - v7);
        }
        if (v13 - 48 >= 0xA)
        {
          if (v13 - 44 > 2)
            break;
        }
        else
        {
          v9 = 1;
        }
        ++v8;
        --v6;
        ++v10;
        if (Length == v8)
          goto LABEL_30;
      }
      v2 = 0;
    }
  }

  return v2;
}

uint64_t _PASInsensitiveStringContainsString(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (!a1 || !a2)
    return 0;
  v3 = a2;
  _PASNormalizeUnicodeString(a1, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _PASNormalizeUnicodeString(v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsString:", v5);
  return v6;
}

id _PASNormalizeUnicodeString(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  fastNormalizeUnicodeString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _PASSimpleICUTransform(CFSTR("[^…] NFKD; Latin-ASCII; [[:Nonspacing Mark:]&[:Zinh:]] Remove; NFC; Lower"), v3, a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

__CFString *fastNormalizeUnicodeString(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  CFIndex Length;
  const UniChar *CharactersPtr;
  uint64_t v10;
  uint64_t v11;
  const char *CStringPtr;
  uint64_t v13;
  int64_t v14;
  char v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFIndex v19;
  UniChar v20;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  CFIndex v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  size_t v33;
  char *v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  CFIndex v38;
  const UniChar *v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFIndex v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  int64_t v52;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  CFIndex v57;
  __CFString *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  unsigned __int16 v63;
  uint64_t v64;
  int v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  __int128 buffer;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __CFString *v77;
  const UniChar *v78;
  const char *v79;
  uint64_t v80;
  CFIndex v81;
  int64_t v82;
  int64_t v83;
  uint64_t v84;
  CFRange v85;
  CFRange v86;

  v84 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (CFStringGetFastestEncoding(v1) != 1536)
  {
    v5 = -[__CFString length](v1, "length");
    v6 = v1;
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      goto LABEL_37;
    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v70 = 0u;
    buffer = 0u;
    Length = CFStringGetLength(v6);
    v77 = v6;
    v80 = 0;
    v81 = Length;
    CharactersPtr = CFStringGetCharactersPtr(v6);
    CStringPtr = 0;
    v78 = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
    v82 = 0;
    v83 = 0;
    v79 = CStringPtr;
    if (Length > 0)
    {
      v13 = 0;
      v14 = 0;
      v15 = 0;
      v16 = 0;
      v17 = 64;
      do
      {
        if ((unint64_t)v16 >= 4)
          v18 = 4;
        else
          v18 = v16;
        v19 = v81;
        if (v81 > v16)
        {
          if (v78)
          {
            v20 = v78[v16 + v80];
          }
          else if (v79)
          {
            v20 = v79[v80 + v16];
          }
          else
          {
            if (v83 <= v16 || v14 > v16)
            {
              v22 = v18 + v13;
              v23 = v17 - v18;
              v24 = v16 - v18;
              v25 = v24 + 64;
              if (v24 + 64 >= v81)
                v25 = v81;
              v82 = v24;
              v83 = v25;
              if (v81 >= v23)
                v19 = v23;
              v85.length = v19 + v22;
              v26 = v1;
              v27 = v10;
              v28 = v5;
              v29 = v11;
              v85.location = v24 + v80;
              CFStringGetCharacters(v77, v85, (UniChar *)&buffer);
              v11 = v29;
              v5 = v28;
              v10 = v27;
              v1 = v26;
              v14 = v82;
            }
            v20 = *((_WORD *)&buffer + v16 - v14);
          }
          if (v20 >= 0x100u && (unsigned __int16)(v20 - 0x2000) > 0x6Fu)
          {

            v3 = 0;
            goto LABEL_39;
          }
          switch(v20)
          {
            case 0x41u:
            case 0x42u:
            case 0x43u:
            case 0x44u:
            case 0x45u:
            case 0x46u:
            case 0x47u:
            case 0x48u:
            case 0x49u:
            case 0x4Au:
            case 0x4Bu:
            case 0x4Cu:
            case 0x4Du:
            case 0x4Eu:
            case 0x4Fu:
            case 0x50u:
            case 0x51u:
            case 0x52u:
            case 0x53u:
            case 0x54u:
            case 0x55u:
            case 0x56u:
            case 0x57u:
            case 0x58u:
            case 0x59u:
            case 0x5Au:
            case 0xA0u:
            case 0xA1u:
            case 0xA8u:
            case 0xAAu:
            case 0xADu:
            case 0xAFu:
            case 0xB2u:
            case 0xB3u:
            case 0xB4u:
            case 0xB5u:
            case 0xB8u:
            case 0xB9u:
            case 0xBAu:
            case 0xBFu:
            case 0xC0u:
            case 0xC1u:
            case 0xC2u:
            case 0xC3u:
            case 0xC4u:
            case 0xC5u:
            case 0xC7u:
            case 0xC8u:
            case 0xC9u:
            case 0xCAu:
            case 0xCBu:
            case 0xCCu:
            case 0xCDu:
            case 0xCEu:
            case 0xCFu:
            case 0xD0u:
            case 0xD1u:
            case 0xD2u:
            case 0xD3u:
            case 0xD4u:
            case 0xD5u:
            case 0xD6u:
            case 0xD7u:
            case 0xD8u:
            case 0xD9u:
            case 0xDAu:
            case 0xDBu:
            case 0xDCu:
            case 0xDDu:
            case 0xE0u:
            case 0xE1u:
            case 0xE2u:
            case 0xE3u:
            case 0xE4u:
            case 0xE5u:
            case 0xE7u:
            case 0xE8u:
            case 0xE9u:
            case 0xEAu:
            case 0xEBu:
            case 0xECu:
            case 0xEDu:
            case 0xEEu:
            case 0xEFu:
            case 0xF0u:
            case 0xF1u:
            case 0xF2u:
            case 0xF3u:
            case 0xF4u:
            case 0xF5u:
            case 0xF6u:
            case 0xF7u:
            case 0xF8u:
            case 0xF9u:
            case 0xFAu:
            case 0xFBu:
            case 0xFCu:
            case 0xFDu:
            case 0xFFu:
              goto LABEL_33;
            case 0x5Bu:
            case 0x5Cu:
            case 0x5Du:
            case 0x5Eu:
            case 0x5Fu:
            case 0x60u:
            case 0x61u:
            case 0x62u:
            case 0x63u:
            case 0x64u:
            case 0x65u:
            case 0x66u:
            case 0x67u:
            case 0x68u:
            case 0x69u:
            case 0x6Au:
            case 0x6Bu:
            case 0x6Cu:
            case 0x6Du:
            case 0x6Eu:
            case 0x6Fu:
            case 0x70u:
            case 0x71u:
            case 0x72u:
            case 0x73u:
            case 0x74u:
            case 0x75u:
            case 0x76u:
            case 0x77u:
            case 0x78u:
            case 0x79u:
            case 0x7Au:
            case 0x7Bu:
            case 0x7Cu:
            case 0x7Du:
            case 0x7Eu:
            case 0x7Fu:
            case 0x80u:
            case 0x81u:
            case 0x82u:
            case 0x83u:
            case 0x84u:
            case 0x85u:
            case 0x86u:
            case 0x87u:
            case 0x88u:
            case 0x89u:
            case 0x8Au:
            case 0x8Bu:
            case 0x8Cu:
            case 0x8Du:
            case 0x8Eu:
            case 0x8Fu:
            case 0x90u:
            case 0x91u:
            case 0x92u:
            case 0x93u:
            case 0x94u:
            case 0x95u:
            case 0x96u:
            case 0x97u:
            case 0x98u:
            case 0x99u:
            case 0x9Au:
            case 0x9Bu:
            case 0x9Cu:
            case 0x9Du:
            case 0x9Eu:
            case 0x9Fu:
            case 0xA2u:
            case 0xA3u:
            case 0xA4u:
            case 0xA5u:
            case 0xA6u:
            case 0xA7u:
            case 0xACu:
            case 0xB0u:
            case 0xB6u:
            case 0xB7u:
              break;
            case 0xA9u:
            case 0xAEu:
            case 0xB1u:
            case 0xBCu:
            case 0xBDu:
            case 0xBEu:
LABEL_32:
              v5 += 2;
              goto LABEL_33;
            case 0xABu:
            case 0xBBu:
            case 0xC6u:
            case 0xDEu:
            case 0xDFu:
            case 0xE6u:
            case 0xFEu:
LABEL_31:
              ++v5;
LABEL_33:
              v15 = 1;
              break;
            default:
              switch(v20)
              {
                case 0x2000u:
                case 0x2001u:
                case 0x2002u:
                case 0x2003u:
                case 0x2004u:
                case 0x2005u:
                case 0x2006u:
                case 0x2007u:
                case 0x2008u:
                case 0x2009u:
                case 0x200Au:
                case 0x2010u:
                case 0x2011u:
                case 0x2012u:
                case 0x2013u:
                case 0x2014u:
                case 0x2015u:
                case 0x2017u:
                case 0x2018u:
                case 0x2019u:
                case 0x201Au:
                case 0x201Bu:
                case 0x201Cu:
                case 0x201Du:
                case 0x201Fu:
                case 0x2024u:
                case 0x202Fu:
                case 0x2032u:
                case 0x2039u:
                case 0x203Au:
                case 0x203Eu:
                case 0x2044u:
                case 0x2045u:
                case 0x2046u:
                case 0x204Eu:
                case 0x205Fu:
                  goto LABEL_33;
                case 0x2016u:
                case 0x201Eu:
                case 0x2025u:
                case 0x2033u:
                case 0x2036u:
                case 0x203Cu:
                case 0x2047u:
                case 0x2048u:
                case 0x2049u:
                  goto LABEL_31;
                case 0x2034u:
                case 0x2037u:
                  goto LABEL_32;
                case 0x2057u:
                  v5 += 3;
                  goto LABEL_33;
                default:
                  goto LABEL_34;
              }
          }
        }
LABEL_34:
        ++v16;
        --v13;
        ++v17;
      }
      while (Length != v16);

      if ((v15 & 1) != 0)
      {
        v32 = 2 * v5;
        buffer = 0uLL;
        if (((2 * v5) | 1uLL) > 0x400)
        {
          v65 = malloc_type_posix_memalign((void **)&buffer, 8uLL, 2 * v5, 0xC77F6B9DuLL);
          BYTE8(buffer) = 0;
          if (v65)
          {
            objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
            v66 = (id)objc_claimAutoreleasedReturnValue();
            objc_exception_throw(v66);
          }
          v34 = (char *)buffer;
        }
        else
        {
          MEMORY[0x1E0C80A78](v31);
          v34 = (char *)&v67 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
          bzero(v34, v33);
          *(_QWORD *)&buffer = v34;
          BYTE8(buffer) = 1;
        }
        v35 = *((_QWORD *)&buffer + 1);
        v36 = v6;
        objc_opt_self();
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          v67 = v35;
          v68 = v32;
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v70 = 0u;
          buffer = 0u;
          v38 = CFStringGetLength(v36);
          v77 = v36;
          v80 = 0;
          v81 = v38;
          v39 = CFStringGetCharactersPtr(v36);
          v41 = 0;
          v78 = v39;
          if (!v39)
            v41 = CFStringGetCStringPtr(v36, 0x600u);
          v82 = 0;
          v83 = 0;
          v79 = v41;
          if (v38 >= 1)
          {
            v42 = 0;
            v43 = 0;
            v44 = 0;
            v45 = 64;
            do
            {
              if ((unint64_t)v43 >= 4)
                v46 = 4;
              else
                v46 = v43;
              v47 = v81;
              if (v81 <= v43)
              {
                v48 = 0;
LABEL_55:
                v49 = 1;
                v50 = v44;
                v51 = v48;
              }
              else
              {
                if (v78)
                {
                  v48 = v78[v43 + v80];
                }
                else if (v79)
                {
                  v48 = v79[v80 + v43];
                }
                else
                {
                  v52 = v82;
                  if (v83 <= v43 || v82 > v43)
                  {
                    v54 = v46 + v42;
                    v55 = v45 - v46;
                    v56 = v43 - v46;
                    v57 = v56 + 64;
                    if (v56 + 64 >= v81)
                      v57 = v81;
                    v82 = v56;
                    v83 = v57;
                    if (v81 >= v55)
                      v47 = v55;
                    v86.length = v47 + v54;
                    v58 = v36;
                    v59 = v40;
                    v86.location = v56 + v80;
                    CFStringGetCharacters(v77, v86, (UniChar *)&buffer);
                    v40 = v59;
                    v36 = v58;
                    v52 = v82;
                  }
                  v48 = *((_WORD *)&buffer + v43 - v52);
                }
                v51 = 97;
                v49 = 1;
                v50 = v44;
                switch(v48)
                {
                  case 65:
                  case 170:
                  case 192:
                  case 193:
                  case 194:
                  case 195:
                  case 196:
                  case 197:
                  case 224:
                  case 225:
                  case 226:
                  case 227:
                  case 228:
                  case 229:
                    break;
                  case 66:
                    v51 = 98;
                    goto LABEL_120;
                  case 67:
                  case 199:
                  case 231:
                    v51 = 99;
                    goto LABEL_120;
                  case 68:
                  case 208:
                  case 240:
                    v51 = 100;
                    goto LABEL_120;
                  case 69:
                  case 200:
                  case 201:
                  case 202:
                  case 203:
                  case 232:
                  case 233:
                  case 234:
                  case 235:
                    v51 = 101;
                    goto LABEL_120;
                  case 70:
                    v51 = 102;
                    goto LABEL_120;
                  case 71:
                    v51 = 103;
                    goto LABEL_120;
                  case 72:
                    v51 = 104;
                    goto LABEL_120;
                  case 73:
                  case 204:
                  case 205:
                  case 206:
                  case 207:
                  case 236:
                  case 237:
                  case 238:
                  case 239:
                    v51 = 105;
                    goto LABEL_120;
                  case 74:
                    v51 = 106;
                    goto LABEL_120;
                  case 75:
                    v51 = 107;
                    goto LABEL_120;
                  case 76:
                    v51 = 108;
                    goto LABEL_120;
                  case 77:
                    v51 = 109;
                    goto LABEL_120;
                  case 78:
                  case 209:
                  case 241:
                    v51 = 110;
                    goto LABEL_120;
                  case 79:
                  case 186:
                  case 210:
                  case 211:
                  case 212:
                  case 213:
                  case 214:
                  case 216:
                  case 242:
                  case 243:
                  case 244:
                  case 245:
                  case 246:
                  case 248:
                    v51 = 111;
                    goto LABEL_120;
                  case 80:
                    v51 = 112;
                    goto LABEL_120;
                  case 81:
                    v51 = 113;
                    goto LABEL_120;
                  case 82:
                    v51 = 114;
                    goto LABEL_120;
                  case 83:
                    v51 = 115;
                    goto LABEL_120;
                  case 84:
                    v51 = 116;
                    goto LABEL_120;
                  case 85:
                  case 217:
                  case 218:
                  case 219:
                  case 220:
                  case 249:
                  case 250:
                  case 251:
                  case 252:
                    v51 = 117;
                    goto LABEL_120;
                  case 86:
                    v51 = 118;
                    goto LABEL_120;
                  case 87:
                    v51 = 119;
                    goto LABEL_120;
                  case 88:
                    v51 = 120;
                    goto LABEL_120;
                  case 89:
                  case 221:
                  case 253:
                  case 255:
                    v51 = 121;
                    goto LABEL_120;
                  case 90:
                    v51 = 122;
                    goto LABEL_120;
                  case 160:
                  case 168:
                  case 175:
                  case 180:
                  case 184:
                    v51 = 32;
                    goto LABEL_120;
                  case 161:
                    v51 = 33;
                    goto LABEL_120;
                  case 169:
                    v60 = 2 * v44;
                    v61 = 6488104;
                    goto LABEL_103;
                  case 171:
                    v50 = v44 + 1;
                    v51 = 60;
                    goto LABEL_118;
                  case 173:
                    v51 = 45;
                    goto LABEL_120;
                  case 174:
                    v60 = 2 * v44;
                    v61 = 7471144;
LABEL_103:
                    *(_DWORD *)&v34[v60] = v61;
                    v50 = v44 + 2;
                    v51 = 41;
                    goto LABEL_117;
                  case 177:
                    *(_DWORD *)&v34[2 * v44] = 3080235;
                    v50 = v44 + 2;
                    v51 = 45;
                    goto LABEL_117;
                  case 178:
                    v51 = 50;
                    goto LABEL_120;
                  case 179:
                    v51 = 51;
                    goto LABEL_120;
                  case 181:
                    v51 = 956;
                    goto LABEL_120;
                  case 185:
                    v51 = 49;
                    goto LABEL_120;
                  case 187:
                    v50 = v44 + 1;
                    v51 = 62;
                    goto LABEL_118;
                  case 188:
                    v62 = 2 * v44;
                    v63 = 49;
                    goto LABEL_115;
                  case 189:
                    *(_DWORD *)&v34[2 * v44] = 3080241;
                    v50 = v44 + 2;
                    v51 = 50;
                    goto LABEL_117;
                  case 190:
                    v62 = 2 * v44;
                    v63 = 51;
LABEL_115:
                    *(_DWORD *)&v34[v62] = v63 | 0x2F0000;
                    v50 = v44 + 2;
                    v51 = 52;
LABEL_117:
                    v49 = 3;
                    break;
                  case 191:
                    v51 = 63;
                    goto LABEL_120;
                  case 198:
                  case 230:
                    v50 = v44 + 1;
                    *(_WORD *)&v34[2 * v44] = 97;
                    v51 = 101;
                    goto LABEL_119;
                  case 215:
                    v51 = 42;
                    goto LABEL_120;
                  case 222:
                  case 254:
                    v50 = v44 + 1;
                    *(_WORD *)&v34[2 * v44] = 116;
                    v51 = 104;
                    goto LABEL_119;
                  case 223:
                    v50 = v44 + 1;
                    v51 = 115;
LABEL_118:
                    *(_WORD *)&v34[2 * v44] = v51;
LABEL_119:
                    v49 = 2;
                    break;
                  case 247:
                    v51 = 47;
LABEL_120:
                    v49 = 1;
                    v50 = v44;
                    break;
                  default:
                    goto LABEL_55;
                }
              }
              v44 += v49;
              *(_WORD *)&v34[2 * v50] = v51;
              ++v43;
              --v42;
              ++v45;
            }
            while (v38 != v43);
          }
          v32 = v68;
          v35 = v67;
        }

        v64 = MEMORY[0x1A1AFDC98]();
        objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v34, v35, v32, 2483028224, 0, 0);
        v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v4 = (void *)v64;
        goto LABEL_3;
      }
    }
    else
    {
LABEL_37:

    }
    v3 = v6;
    goto LABEL_39;
  }
  v2 = MEMORY[0x1A1AFDC98]();
  -[__CFString lowercaseString](v1, "lowercaseString");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)v2;
LABEL_3:
  objc_autoreleasePoolPop(v4);
LABEL_39:

  return v3;
}

id _PASSimpleICUTransform(void *a1, void *a2, int a3)
{
  id v5;
  __CFString *v6;
  __CFString *v7;
  uint64_t v8;
  _PASTuple2 *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *MutableCopy;
  const char *CStringPtr;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v22;
  const __CFString *v23;
  uint64_t Length;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  const __CFString *v33;
  const UniChar *CharactersPtr;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t cf;
  _QWORD v39[4];
  __CFString *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  int *v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  if (v5 && v6)
  {
    if (-[__CFString _pas_retainsConmingledBackingStore](v6, "_pas_retainsConmingledBackingStore"))
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v7);

      v7 = (__CFString *)v8;
    }
    pthread_mutex_lock((pthread_mutex_t *)&icuLock);
    if (a3)
    {
      v9 = -[_PASTuple2 initWithFirst:second:]([_PASTuple2 alloc], "initWithFirst:second:", v5, v7);
      _getIcuTransformResultCache();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
LABEL_28:

        goto LABEL_29;
      }
    }
    else
    {
      v9 = 0;
    }
    v47 = 0;
    v48 = &v47;
    v49 = 0x2020000000;
    v50 = 0;
    v43 = 0;
    v44 = (int *)&v43;
    v45 = 0x2020000000;
    v46 = 0;
    _getIcuTransformCache();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v12, "count") >= 0x65)
      _destroyIcuTransformCache();
    objc_msgSend(v12, "objectForKeyedSubscript:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = objc_msgSend(v13, "pointerValue");
      v48[3] = v15;
    }
    else
    {
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = ___PASSimpleICUTransform_block_invoke;
      v39[3] = &unk_1E4430490;
      v18 = (__CFString *)v5;
      v40 = v18;
      v41 = &v47;
      v42 = &v43;
      _PASMemoryHeavyOperation(v39);
      if (v44[6] > 0)
      {
        v19 = v40;
        goto LABEL_23;
      }
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v48[3]);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v18);

    }
    MutableCopy = CFStringCreateMutableCopy(0, 0, v7);
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v35 = 0u;
    v23 = MutableCopy;
    Length = (int)CFStringGetLength(MutableCopy);
    v33 = MutableCopy;
    v36 = Length;
    CharactersPtr = CFStringGetCharactersPtr(MutableCopy);
    if (CharactersPtr)
      CStringPtr = 0;
    else
      CStringPtr = CFStringGetCStringPtr(MutableCopy, 0x600u);
    *(_QWORD *)&v35 = CStringPtr;
    v37 = 0;
    cf = 0;
    v44[6] = 0;
    utrans_trans();
    if (v44[6] >= 1)
    {
      CFRelease(MutableCopy);
      if (!a3)
        goto LABEL_27;
      goto LABEL_24;
    }
    v19 = v7;
    v7 = (__CFString *)MutableCopy;
LABEL_23:

    if (!a3)
    {
LABEL_27:
      pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
      v7 = v7;

      _Block_object_dispose(&v43, 8);
      _Block_object_dispose(&v47, 8);
      v11 = v7;
      goto LABEL_28;
    }
LABEL_24:
    _getIcuTransformResultCache();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v20, "count") >= 0x19)
      objc_msgSend(v20, "removeAllObjects");
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v7, v9, v23, Length, v25, v26, v27, v28, v29, v30, v31, v32, v33, CharactersPtr, v35, v36, v37,
      cf);

    goto LABEL_27;
  }
  v7 = v6;
  v11 = v7;
LABEL_29:

  return v11;
}

void sub_1A097878C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t _getIcuTransformResultCache()
{
  if (_getIcuTransformResultCache__pasOnceToken14 != -1)
    dispatch_once(&_getIcuTransformResultCache__pasOnceToken14, &__block_literal_global_33);
  return objc_msgSend((id)_getIcuTransformResultCache__pasExprOnceResult, "result");
}

id _getIcuTransformCache()
{
  if (_getIcuTransformCache__pasOnceToken13 != -1)
    dispatch_once(&_getIcuTransformCache__pasOnceToken13, &__block_literal_global_38);
  return (id)_getIcuTransformCache__pasExprOnceResult;
}

void _destroyIcuTransformCache()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _getIcuTransformCache();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(v0, "objectEnumerator", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5), "pointerValue");
        utrans_close();
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

  objc_msgSend(v0, "removeAllObjects");
}

uint64_t __CFStringReplaceableLength(uint64_t a1)
{
  return *(unsigned int *)(a1 + 8);
}

uint64_t __CFStringReplaceableCharAt(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFRange v11;

  if (*(_QWORD *)(a1 + 8) <= a2)
  {
    return (unsigned __int16)-1;
  }
  else
  {
    if (a2 < 0)
      return 0;
    v3 = a2;
    v4 = *(_QWORD *)(a1 + 176);
    if (v4 <= a2)
    {
      return 0;
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 152);
      if (v5)
      {
        return *(unsigned __int16 *)(v5 + 2 * (*(_QWORD *)(a1 + 168) + a2));
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 160);
        if (v8)
        {
          return (unsigned __int16)*(char *)(v8 + *(_QWORD *)(a1 + 168) + a2);
        }
        else
        {
          if (*(_QWORD *)(a1 + 192) <= a2 || (v9 = *(_QWORD *)(a1 + 184), v9 > a2))
          {
            v10 = a2 - 4;
            if ((unint64_t)a2 < 4)
              v10 = 0;
            if (v10 + 64 < v4)
              v4 = v10 + 64;
            *(_QWORD *)(a1 + 184) = v10;
            *(_QWORD *)(a1 + 192) = v4;
            v11.location = *(_QWORD *)(a1 + 168) + v10;
            v11.length = v4 - v10;
            CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v11, (UniChar *)(a1 + 16));
            v9 = *(_QWORD *)(a1 + 184);
          }
          return *(unsigned __int16 *)(a1 + 16 + 2 * (v3 - v9));
        }
      }
    }
  }
}

uint64_t __CFStringReplaceableChar32At(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int16 v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  uint64_t v17;
  int64_t v18;
  int64_t v19;
  CFRange v20;
  CFRange v21;

  if (*(_QWORD *)(a1 + 8) <= a2)
    return 0xFFFFLL;
  if (a2 < 0)
    return 0;
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 176);
  if (v4 <= a2)
    return 0;
  v5 = a1 + 16;
  v6 = *(_QWORD *)(a1 + 152);
  if (v6)
  {
    v7 = *(_WORD *)(v6 + 2 * (*(_QWORD *)(a1 + 168) + a2));
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 160);
    if (v10)
    {
      v7 = *(char *)(v10 + *(_QWORD *)(a1 + 168) + a2);
    }
    else
    {
      if (*(_QWORD *)(a1 + 192) <= a2 || (v11 = *(_QWORD *)(a1 + 184), v11 > a2))
      {
        v12 = a2 - 4;
        if ((unint64_t)a2 < 4)
          v12 = 0;
        if (v12 + 64 < v4)
          v4 = v12 + 64;
        *(_QWORD *)(a1 + 184) = v12;
        *(_QWORD *)(a1 + 192) = v4;
        v20.location = *(_QWORD *)(a1 + 168) + v12;
        v20.length = v4 - v12;
        CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v20, (UniChar *)(a1 + 16));
        v11 = *(_QWORD *)(a1 + 184);
      }
      v7 = *(_WORD *)(v5 + 2 * (v3 - v11));
    }
  }
  if (v7 >> 10 != 54 || *(_QWORD *)(a1 + 8) - 1 <= v3)
    return v7;
  v8 = v7;
  v13 = v3 + 1;
  v14 = *(_QWORD *)(a1 + 176);
  if (v14 > v13)
  {
    v15 = *(_QWORD *)(a1 + 152);
    if (v15)
    {
      v16 = *(_WORD *)(v15 + 2 * (*(_QWORD *)(a1 + 168) + v13));
    }
    else
    {
      v17 = *(_QWORD *)(a1 + 160);
      if (v17)
      {
        v16 = *(char *)(v17 + *(_QWORD *)(a1 + 168) + v13);
      }
      else
      {
        if (*(_QWORD *)(a1 + 192) <= v13 || (v18 = *(_QWORD *)(a1 + 184), v18 > v13))
        {
          v19 = v13 - 4;
          if ((unint64_t)v13 < 4)
            v19 = 0;
          if (v19 + 64 < v14)
            v14 = v19 + 64;
          *(_QWORD *)(a1 + 184) = v19;
          *(_QWORD *)(a1 + 192) = v14;
          v21.location = *(_QWORD *)(a1 + 168) + v19;
          v21.length = v14 - v19;
          CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v21, (UniChar *)(a1 + 16));
          v18 = *(_QWORD *)(a1 + 184);
        }
        v16 = *(_WORD *)(v5 + 2 * (v13 - v18));
      }
    }
    if (v16 >> 10 == 55)
      return ((_DWORD)v8 << 10) + v16 - 56613888;
  }
  return v8;
}

const char *__CFStringReplaceableReplace(uint64_t a1, int a2, int a3, UniChar *chars, int a5)
{
  __CFString *v8;
  const __CFString *MutableWithExternalCharactersNoCopy;
  CFIndex Length;
  const __CFString *v11;
  const UniChar *CharactersPtr;
  const char *result;
  CFRange v14;

  v8 = *(__CFString **)(a1 + 200);
  if (v8)
  {
    CFStringSetExternalCharactersNoCopy(v8, chars, a5, a5);
    MutableWithExternalCharactersNoCopy = *(const __CFString **)(a1 + 200);
  }
  else
  {
    MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE30], chars, a5, a5, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    *(_QWORD *)(a1 + 200) = MutableWithExternalCharactersNoCopy;
  }
  v14.location = a2;
  v14.length = a3 - a2;
  CFStringReplace(*(CFMutableStringRef *)a1, v14, MutableWithExternalCharactersNoCopy);
  Length = CFStringGetLength(*(CFStringRef *)a1);
  *(_QWORD *)(a1 + 8) = Length;
  v11 = *(const __CFString **)a1;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)a1;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = Length;
  CharactersPtr = CFStringGetCharactersPtr(v11);
  result = 0;
  *(_QWORD *)(a1 + 152) = CharactersPtr;
  if (!CharactersPtr)
    result = CFStringGetCStringPtr(v11, 0x600u);
  *(_QWORD *)(a1 + 160) = result;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  return result;
}

void __CFStringReplaceableExtract(uint64_t a1, int a2, int a3, UniChar *__dst)
{
  UniChar *v4;
  uint64_t v6;
  CFIndex v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  CFIndex v11;
  uint64_t v12;
  BOOL v13;
  CFIndex v14;
  CFIndex v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  CFRange v19;
  char *v20;
  UniChar v21;

  v4 = __dst;
  v6 = a2;
  v7 = a3 - a2;
  v8 = *(_QWORD *)(a1 + 152);
  if (v8)
  {
    memmove(__dst, (const void *)(v8 + 2 * *(_QWORD *)(a1 + 168) + 2 * a2), 2 * v7);
  }
  else
  {
    v9 = (char *)(a1 + 16);
    v10 = *(_QWORD *)(a1 + 184);
    v11 = v10 - v6;
    if (v10 > v6 || (v12 = *(_QWORD *)(a1 + 192), v13 = v12 <= v6, v14 = v12 - v6, v13))
    {
      v16 = __OFSUB__(v7 + v6, v10);
      v17 = v7 + v6 - v10;
      if (!((v17 < 0) ^ v16 | (v17 == 0)) && v7 + v6 < *(_QWORD *)(a1 + 192))
      {
        memmove(&__dst[v11], v9, 2 * v17);
        v7 = v11;
      }
    }
    else
    {
      if (v7 >= v14)
        v15 = v14;
      else
        v15 = v7;
      memmove(__dst, &v9[2 * (v6 - v10)], 2 * v15);
      v4 += v15;
      v6 += v15;
      v7 -= v15;
    }
    if (v7 >= 1)
    {
      v18 = *(_QWORD *)(a1 + 160);
      v19.location = *(_QWORD *)(a1 + 168) + v6;
      if (v18)
      {
        v20 = (char *)(v18 + v19.location);
        do
        {
          v21 = *v20++;
          *v4++ = v21;
          --v7;
        }
        while (v7);
      }
      else
      {
        v19.length = v7;
        CFStringGetCharacters(*(CFStringRef *)(a1 + 144), v19, v4);
      }
    }
  }
}

const char *__CFStringReplaceableCopy(uint64_t a1, int a2, int a3, int a4)
{
  const __CFString *v6;
  CFIndex Length;
  const __CFString *v8;
  const UniChar *CharactersPtr;
  const char *result;
  CFRange v11;

  v11.length = a3 - a2;
  v11.location = a2;
  v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE30], *(CFStringRef *)a1, v11);
  CFStringInsert(*(CFMutableStringRef *)a1, a4, v6);
  CFRelease(v6);
  Length = CFStringGetLength(*(CFStringRef *)a1);
  *(_QWORD *)(a1 + 8) = Length;
  v8 = *(const __CFString **)a1;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)a1;
  *(_QWORD *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = Length;
  CharactersPtr = CFStringGetCharactersPtr(v8);
  result = 0;
  *(_QWORD *)(a1 + 152) = CharactersPtr;
  if (!CharactersPtr)
    result = CFStringGetCStringPtr(v8, 0x600u);
  *(_QWORD *)(a1 + 160) = result;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  return result;
}

void ___getIcuTransformCache_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = objc_opt_new();
  v2 = (void *)_getIcuTransformCache__pasExprOnceResult;
  _getIcuTransformCache__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

void ___getIcuTransformResultCache_block_invoke()
{
  void *v0;
  _PASLazyPurgeableResult *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = -[_PASLazyPurgeableResult initWithBlock:]([_PASLazyPurgeableResult alloc], "initWithBlock:", &__block_literal_global_36);
  v2 = (void *)_getIcuTransformResultCache__pasExprOnceResult;
  _getIcuTransformResultCache__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id ___getIcuTransformResultCache_block_invoke_2()
{
  return (id)objc_opt_new();
}

id _PASCharacterSetWithCharactersInString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v1 = a1;
  v2 = (void *)MEMORY[0x1A1AFDC98]();
  v3 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = ___PASCharacterSetWithCharactersInString_block_invoke;
  v7[3] = &unk_1E442F660;
  v8 = v3;
  v4 = v3;
  _PASIterateLongChars(v1, v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  objc_autoreleasePoolPop(v2);
  return v5;
}

uint64_t _PASGetNameCharacterSet()
{
  if (_PASGetNameCharacterSet_onceToken != -1)
    dispatch_once(&_PASGetNameCharacterSet_onceToken, &__block_literal_global_263);
  return _PASGetNameCharacterSet_charset;
}

id _PASRemoveWhitespace(void *a1)
{
  id v1;
  uint64_t v2;
  _WORD *v3;
  __CFString *v4;
  void *v5;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  UniChar v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  id v22;
  void *v23;
  _OWORD v25[8];
  CFStringRef theString;
  const UniChar *v27;
  const char *v28;
  uint64_t v29;
  CFIndex v30;
  int64_t v31;
  int64_t v32;
  CFRange v33;

  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  if (v2)
  {
    v3 = malloc_type_malloc(2 * v2, 0x1000040BDFB0063uLL);
    v4 = (__CFString *)v1;
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      memset(v25, 0, sizeof(v25));
      Length = CFStringGetLength(v4);
      theString = v4;
      v29 = 0;
      v30 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v4);
      CStringPtr = 0;
      v27 = CharactersPtr;
      if (!CharactersPtr)
        CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
      v31 = 0;
      v32 = 0;
      v28 = CStringPtr;
      if (Length >= 1)
      {
        v9 = 0;
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v13 = 64;
        while (1)
        {
          if ((unint64_t)v11 >= 4)
            v14 = 4;
          else
            v14 = v11;
          v15 = v30;
          if (v30 <= v11)
          {
            v16 = 0;
          }
          else
          {
            if (v27)
            {
              v16 = v27[v11 + v29];
            }
            else if (v28)
            {
              v16 = v28[v29 + v11];
            }
            else
            {
              if (v32 <= v11 || v10 > v11)
              {
                v18 = v14 + v9;
                v19 = v13 - v14;
                v20 = v11 - v14;
                v21 = v20 + 64;
                if (v20 + 64 >= v30)
                  v21 = v30;
                v31 = v20;
                v32 = v21;
                if (v30 >= v19)
                  v15 = v19;
                v33.length = v15 + v18;
                v33.location = v20 + v29;
                CFStringGetCharacters(theString, v33, (UniChar *)v25);
                v10 = v31;
              }
              v16 = *((_WORD *)v25 + v11 - v10);
            }
            if (v16 == 10 || v16 == 32)
              goto LABEL_45;
          }
          if ((unsigned __int16)(v16 - 48) < 0xAu || (unsigned __int16)((v16 & 0xFFDF) - 65) < 0x1Au)
            goto LABEL_44;
          if (v16 > 0x9Fu)
          {
            if (v16 == 160 || v16 == 5760)
              goto LABEL_45;
          }
          else if (v16 == 9 || v16 == 32)
          {
            goto LABEL_45;
          }
          if ((unsigned __int16)(v16 - 0x2000) >= 0xCu)
            break;
LABEL_45:
          ++v11;
          --v9;
          ++v13;
          if (Length == v11)
            goto LABEL_48;
        }
        if (v16 > 0x2027u)
        {
          if (v16 - 8232 <= 0x37 && ((1 << (v16 - 40)) & 0x80000000000083) != 0
            || v16 == 12288)
          {
            goto LABEL_45;
          }
        }
        else if (v16 - 10 < 4 || v16 == 133)
        {
          goto LABEL_45;
        }
LABEL_44:
        v3[v12++] = v16;
        goto LABEL_45;
      }
    }
    v12 = 0;
LABEL_48:

    v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCharactersNoCopy:length:freeWhenDone:", v3, v12, 1);
  }
  else
  {
    v22 = v1;
  }
  v23 = v22;

  return v23;
}

id _PASRemoveSomePunctuation(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = _PASRemoveSomePunctuation_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&_PASRemoveSomePunctuation_onceToken, &__block_literal_global_7);
  _PASRemoveCharacterSet(v2, (const __CFCharacterSet *)_PASRemoveSomePunctuation_charset);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _PASStripQuotationMarks(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    if (_PASGetQuotationMarkCharacterSet_onceToken != -1)
      dispatch_once(&_PASGetQuotationMarkCharacterSet_onceToken, &__block_literal_global_28);
    v2 = (id)_PASGetQuotationMarkCharacterSet_quotationMarks;
    v3 = objc_msgSend(v1, "characterAtIndex:", 0);
    v4 = objc_msgSend(v1, "characterAtIndex:", objc_msgSend(v1, "length") - 1);
    if (objc_msgSend(v2, "characterIsMember:", v3)
      && objc_msgSend(v2, "characterIsMember:", v4))
    {
      objc_msgSend(v1, "stringByTrimmingCharactersInSet:", v2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v1;
    }
    v6 = v5;

  }
  else
  {
    v6 = v1;
  }

  return v6;
}

uint64_t _PASGetQuotationMarkCharacterSet()
{
  if (_PASGetQuotationMarkCharacterSet_onceToken != -1)
    dispatch_once(&_PASGetQuotationMarkCharacterSet_onceToken, &__block_literal_global_28);
  return _PASGetQuotationMarkCharacterSet_quotationMarks;
}

__CFString *_PASTrimTrailingWhitespace(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  uint64_t v3;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  UniChar v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  CFStringRef theString;
  const UniChar *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFRange v39;

  v1 = a1;
  v2 = -[__CFString length](v1, "length");
  if (!v2)
  {
LABEL_46:
    v21 = v1;
    goto LABEL_47;
  }
  v3 = v2;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  theString = v1;
  v35 = 0;
  v36 = v2;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  v33 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  v6 = 0;
  v37 = 0;
  v38 = 0;
  v7 = v3 - 1;
  v34 = CStringPtr;
  v8 = 1 - v3;
  v9 = v3 + 63;
  v10 = v3;
  do
  {
    v11 = v10;
    if (v7 >= 4)
      v12 = 4;
    else
      v12 = v7;
    v13 = v10-- < 1;
    if (v13 || v36 < v11)
    {
      v14 = 0;
    }
    else
    {
      if (v33)
      {
        v14 = v33[v11 - 1 + v35];
      }
      else if (v34)
      {
        v14 = v34[v35 - 1 + v11];
      }
      else
      {
        if (v38 < v11 || v6 >= v11)
        {
          v15 = v9 - v12;
          v16 = -v12;
          v17 = v12 + v8;
          v18 = v11 + v16;
          v19 = v18 - 1;
          v20 = v18 + 63;
          if (v20 >= v36)
            v20 = v36;
          v37 = v19;
          v38 = v20;
          if (v36 < v15)
            v15 = v36;
          v39.length = v15 + v17;
          v39.location = v19 + v35;
          CFStringGetCharacters(theString, v39, (UniChar *)&v24);
          v6 = v37;
        }
        v14 = *((_WORD *)&v24 + v11 - v6 - 1);
      }
      if (v14 == 10 || v14 == 32)
        goto LABEL_41;
    }
    if ((unsigned __int16)(v14 - 48) < 0xAu || (unsigned __int16)((v14 & 0xFFDF) - 65) < 0x1Au)
      goto LABEL_44;
    if (v14 > 0x9Fu)
    {
      if (v14 == 160 || v14 == 5760)
        goto LABEL_41;
    }
    else if (v14 == 9 || v14 == 32)
    {
      goto LABEL_41;
    }
    if ((unsigned __int16)(v14 - 0x2000) >= 0xCu)
    {
      if (v14 > 0x2027u)
      {
        if ((v14 - 8232 > 0x37 || ((1 << (v14 - 40)) & 0x80000000000083) == 0)
          && v14 != 12288)
        {
          goto LABEL_44;
        }
      }
      else if (v14 - 10 >= 4 && v14 != 133)
      {
        goto LABEL_44;
      }
    }
LABEL_41:
    --v7;
    ++v8;
    --v9;
  }
  while (v10);
  v11 = 0;
LABEL_44:
  if (v11 >= v3)
    goto LABEL_46;
  -[__CFString substringToIndex:](v1, "substringToIndex:", v11, v24, v25, v26, v27, v28, v29, v30, v31);
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_47:
  v22 = v21;

  return v22;
}

void _PASUtfNCursorInit(_QWORD *a1, void *a2)
{
  __CFString *v3;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  const __CFString *theString;

  v3 = a2;
  if (v3)
  {
    theString = v3;
    Length = CFStringGetLength(v3);
    a1[23] = Length;
    a1[16] = theString;
    a1[19] = 0;
    a1[20] = Length;
    CharactersPtr = CFStringGetCharactersPtr(theString);
    CStringPtr = 0;
    a1[17] = CharactersPtr;
    if (!CharactersPtr)
      CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
    a1[18] = CStringPtr;
    a1[21] = 0;
    a1[22] = 0;
    a1[24] = 0;
    a1[25] = 0;
    v3 = (__CFString *)theString;
  }

}

BOOL _PASUtfNCursorAdvance(UniChar *buffer)
{
  unint64_t v1;
  unint64_t v2;
  int64_t v4;
  uint64_t v5;
  UniChar v6;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  UniChar v14;
  unsigned int v15;
  uint64_t v16;
  UniChar *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  uint64_t v23;
  CFRange v24;
  CFRange v25;

  v1 = *((_QWORD *)buffer + 25);
  v2 = *((_QWORD *)buffer + 23);
  if (v1 >= v2)
    return v1 < v2;
  *((_QWORD *)buffer + 25) = v1 + 1;
  if ((v1 & 0x8000000000000000) != 0 || (v4 = *((_QWORD *)buffer + 20), v4 <= (uint64_t)v1))
  {
    ++*((_QWORD *)buffer + 24);
    return v1 < v2;
  }
  v5 = *((_QWORD *)buffer + 17);
  if (v5)
  {
    v6 = *(_WORD *)(v5 + 2 * (*((_QWORD *)buffer + 19) + v1));
  }
  else
  {
    v8 = *((_QWORD *)buffer + 18);
    if (v8)
    {
      v6 = *(char *)(v8 + *((_QWORD *)buffer + 19) + v1);
    }
    else
    {
      if (*((_QWORD *)buffer + 22) <= (int64_t)v1 || (v9 = *((_QWORD *)buffer + 21), v9 > (uint64_t)v1))
      {
        v10 = v1 - 4;
        if (v1 < 4)
          v10 = 0;
        if ((uint64_t)(v10 + 64) < v4)
          v4 = v10 + 64;
        *((_QWORD *)buffer + 21) = v10;
        *((_QWORD *)buffer + 22) = v4;
        v24.location = *((_QWORD *)buffer + 19) + v10;
        v24.length = v4 - v10;
        CFStringGetCharacters(*((CFStringRef *)buffer + 16), v24, buffer);
        v9 = *((_QWORD *)buffer + 21);
      }
      v6 = buffer[v1 - v9];
    }
  }
  if ((v6 & 0xFC00) == 0xDC00)
    goto LABEL_39;
  if ((v6 & 0xFC00) == 0xD800)
  {
    v11 = *((_QWORD *)buffer + 25);
    if ((unint64_t)v11 < *((_QWORD *)buffer + 23))
    {
      *((_QWORD *)buffer + 25) = v11 + 1;
      if ((v11 & 0x8000000000000000) == 0)
      {
        v12 = *((_QWORD *)buffer + 20);
        if (v12 > v11)
        {
          v13 = *((_QWORD *)buffer + 17);
          if (v13)
          {
            v14 = *(_WORD *)(v13 + 2 * (*((_QWORD *)buffer + 19) + v11));
          }
          else
          {
            v20 = *((_QWORD *)buffer + 18);
            if (v20)
            {
              v14 = *(char *)(v20 + *((_QWORD *)buffer + 19) + v11);
            }
            else
            {
              if (*((_QWORD *)buffer + 22) <= v11 || (v21 = *((_QWORD *)buffer + 21), v21 > v11))
              {
                v22 = v11 - 4;
                if ((unint64_t)v11 < 4)
                  v22 = 0;
                if (v22 + 64 < v12)
                  v12 = v22 + 64;
                *((_QWORD *)buffer + 21) = v22;
                *((_QWORD *)buffer + 22) = v12;
                v25.location = *((_QWORD *)buffer + 19) + v22;
                v25.length = v12 - v22;
                CFStringGetCharacters(*((CFStringRef *)buffer + 16), v25, buffer);
                v21 = *((_QWORD *)buffer + 21);
              }
              v14 = buffer[v11 - v21];
            }
          }
          if (v14 >> 10 == 55)
          {
            v15 = (v6 << 10) + v14 - 56613888;
LABEL_40:
            v23 = *((_QWORD *)buffer + 24);
            v17 = buffer + 96;
            v16 = v23;
            goto LABEL_41;
          }
        }
      }
    }
LABEL_39:
    v15 = 65533;
    goto LABEL_40;
  }
  v15 = v6;
  v18 = *((_QWORD *)buffer + 24);
  v17 = buffer + 96;
  v16 = v18;
  if (v6 >= 0x80u)
  {
LABEL_41:
    v19 = v16 + 2;
    goto LABEL_42;
  }
  v19 = v16 + 1;
LABEL_42:
  *(_QWORD *)v17 = v19;
  if (v15 >= 0x800)
  {
    *(_QWORD *)v17 = v19 + 1;
    if (v15 >= 0x10000)
      *(_QWORD *)v17 = v19 + 2;
  }
  return v1 < v2;
}

void _PASConvertUtf8ByteOffsetsToUtf16WordOffsets(uint64_t a1, uint64_t a2, void *a3)
{
  const __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  _OWORD v8[12];
  __int128 v9;

  v5 = a3;
  v6 = (__CFString *)v5;
  if (a2 && v5 && !CFStringGetCStringPtr(v5, 0x600u))
  {
    v9 = 0u;
    memset(v8, 0, sizeof(v8));
    _PASUtfNCursorInit(v8, v6);
    v7 = 0;
    do
    {
      while ((unint64_t)v9 < *(_QWORD *)(a1 + 8 * v7) && _PASUtfNCursorAdvance((UniChar *)v8))
        ;
      *(_QWORD *)(a1 + 8 * v7++) = *((_QWORD *)&v9 + 1);
    }
    while (v7 != a2);
  }

}

uint64_t _PASSimpleICUClearCache()
{
  void *v0;

  pthread_mutex_lock((pthread_mutex_t *)&icuLock);
  _destroyIcuTransformCache();
  _getIcuTransformResultCache();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "removeAllObjects");

  return pthread_mutex_unlock((pthread_mutex_t *)&icuLock);
}

id _PASNormalizeUnicodeStringMinimally(void *a1, int a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a1;
  fastNormalizeUnicodeStringMinimally(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    _PASSimpleICUTransform(CFSTR("[^…] NFKC; Fullwidth-Halfwidth; [､｡‘’“”،] Latin-ASCII"), v3, a2);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

id fastNormalizeUnicodeStringMinimally(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *CStringPtr;
  uint64_t v9;
  int64_t v10;
  char v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  UniChar v16;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  CFIndex v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  size_t v25;
  char *v26;
  uint64_t v27;
  __CFString *v28;
  void *v29;
  CFIndex v30;
  uint64_t v31;
  const UniChar *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  CFIndex v39;
  unsigned __int16 v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFIndex v49;
  __CFString *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  unsigned __int16 v54;
  void *v55;
  void *v56;
  int v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  __int128 buffer;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __CFString *v70;
  const UniChar *v71;
  const char *v72;
  uint64_t v73;
  CFIndex v74;
  uint64_t v75;
  int64_t v76;
  uint64_t v77;
  CFRange v78;
  CFRange v79;

  v77 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (CFStringGetFastestEncoding(v1) == 1536)
  {
    v2 = v1;
LABEL_123:
    v56 = v2;
    goto LABEL_124;
  }
  v3 = -[__CFString length](v1, "length");
  v4 = v1;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_121;
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v63 = 0u;
  buffer = 0u;
  Length = CFStringGetLength(v4);
  v70 = v4;
  v73 = 0;
  v74 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v4);
  CStringPtr = 0;
  v71 = CharactersPtr;
  if (!CharactersPtr)
    CStringPtr = CFStringGetCStringPtr(v4, 0x600u);
  v75 = 0;
  v76 = 0;
  v72 = CStringPtr;
  if (Length <= 0)
  {
LABEL_121:

    goto LABEL_122;
  }
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 64;
  do
  {
    if ((unint64_t)v12 >= 4)
      v14 = 4;
    else
      v14 = v12;
    v15 = v74;
    if (v74 > v12)
    {
      if (v71)
      {
        v16 = v71[v12 + v73];
      }
      else if (v72)
      {
        v16 = v72[v73 + v12];
      }
      else
      {
        if (v76 <= v12 || v10 > v12)
        {
          v18 = v14 + v9;
          v19 = v13 - v14;
          v20 = v12 - v14;
          v21 = v20 + 64;
          if (v20 + 64 >= v74)
            v21 = v74;
          v75 = v20;
          v76 = v21;
          if (v74 >= v19)
            v15 = v19;
          v78.length = v15 + v18;
          v78.location = v20 + v73;
          CFStringGetCharacters(v70, v78, (UniChar *)&buffer);
          v10 = v75;
        }
        v16 = *((_WORD *)&buffer + v12 - v10);
      }
      if (v16 >= 0x100u && (unsigned __int16)(v16 - 0x2000) > 0x6Fu)
      {

        v56 = 0;
        goto LABEL_124;
      }
      if (v16 <= 0x2046u)
      {
        if (v16 - 0x2000 > 0x3E)
          goto LABEL_35;
        if (((1 << v16) & 0x8010330207FFLL) == 0)
        {
          if (((1 << v16) & 0x5048002000800000) != 0)
            goto LABEL_30;
          if (((1 << v16) & 0x90000000000000) != 0)
            goto LABEL_39;
LABEL_35:
          if (v16 - 160 > 0x1E)
            goto LABEL_45;
          v22 = 1 << (v16 + 96);
          if ((v22 & 0x62C0401) != 0)
            goto LABEL_44;
          if ((v22 & 0x1108100) != 0)
          {
LABEL_30:
            ++v3;
          }
          else
          {
            if ((v22 & 0x70000000) == 0)
              goto LABEL_45;
LABEL_39:
            v3 += 2;
          }
        }
LABEL_44:
        v11 = 1;
        goto LABEL_45;
      }
      if (v16 - 8263 < 3)
        goto LABEL_30;
      if (v16 == 8279)
      {
        v3 += 3;
        goto LABEL_44;
      }
      if (v16 == 8287)
        goto LABEL_44;
    }
LABEL_45:
    ++v12;
    --v9;
    ++v13;
  }
  while (Length != v12);

  if ((v11 & 1) == 0)
  {
LABEL_122:
    v2 = v4;
    goto LABEL_123;
  }
  v24 = 2 * v3;
  buffer = 0uLL;
  if (((2 * v3) | 1uLL) > 0x400)
  {
    v58 = malloc_type_posix_memalign((void **)&buffer, 8uLL, 2 * v3, 0x6398AB95uLL);
    BYTE8(buffer) = 0;
    if (v58)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v59 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v59);
    }
    v26 = (char *)buffer;
  }
  else
  {
    MEMORY[0x1E0C80A78](v23);
    v26 = (char *)&v60 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v26, v25);
    *(_QWORD *)&buffer = v26;
    BYTE8(buffer) = 1;
  }
  v27 = *((_QWORD *)&buffer + 1);
  v28 = v4;
  objc_opt_self();
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v60 = v27;
    v61 = v24;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
    buffer = 0u;
    v30 = CFStringGetLength(v28);
    v70 = v28;
    v73 = 0;
    v74 = v30;
    v32 = CFStringGetCharactersPtr(v28);
    v33 = 0;
    v71 = v32;
    if (!v32)
      v33 = CFStringGetCStringPtr(v28, 0x600u);
    v75 = 0;
    v76 = 0;
    v72 = v33;
    if (v30 >= 1)
    {
      v34 = 0;
      v35 = 0;
      v36 = 0;
      v37 = 64;
      while (1)
      {
        v38 = (unint64_t)v35 >= 4 ? 4 : v35;
        v39 = v74;
        if (v74 <= v35)
          break;
        if (v71)
        {
          v40 = v71[v35 + v73];
        }
        else if (v72)
        {
          v40 = v72[v73 + v35];
        }
        else
        {
          v44 = v75;
          if (v76 <= v35 || v75 > v35)
          {
            v46 = v38 + v34;
            v47 = v37 - v38;
            v48 = v35 - v38;
            v49 = v48 + 64;
            if (v48 + 64 >= v74)
              v49 = v74;
            v75 = v48;
            v76 = v49;
            if (v74 >= v47)
              v39 = v47;
            v79.length = v39 + v46;
            v50 = v28;
            v51 = v31;
            v79.location = v48 + v73;
            CFStringGetCharacters(v70, v79, (UniChar *)&buffer);
            v31 = v51;
            v28 = v50;
            v44 = v75;
          }
          v40 = *((_WORD *)&buffer + v35 - v44);
        }
        v43 = 32;
        v41 = 1;
        if (v40 <= 0x2046u)
        {
          v42 = v36;
          switch(v40)
          {
            case 0x2000u:
            case 0x2001u:
            case 0x2002u:
            case 0x2003u:
            case 0x2004u:
            case 0x2005u:
            case 0x2006u:
            case 0x2007u:
            case 0x2008u:
            case 0x2009u:
            case 0x200Au:
            case 0x202Fu:
              goto LABEL_118;
            case 0x200Bu:
            case 0x200Cu:
            case 0x200Du:
            case 0x200Eu:
            case 0x200Fu:
            case 0x2010u:
            case 0x2012u:
            case 0x2013u:
            case 0x2014u:
            case 0x2015u:
            case 0x2016u:
            case 0x201Au:
            case 0x201Bu:
            case 0x201Eu:
            case 0x201Fu:
            case 0x2020u:
            case 0x2021u:
            case 0x2022u:
            case 0x2023u:
            case 0x2026u:
            case 0x2027u:
            case 0x2028u:
            case 0x2029u:
            case 0x202Au:
            case 0x202Bu:
            case 0x202Cu:
            case 0x202Du:
            case 0x202Eu:
            case 0x2030u:
            case 0x2031u:
            case 0x2032u:
            case 0x2035u:
            case 0x2038u:
            case 0x2039u:
            case 0x203Au:
            case 0x203Bu:
            case 0x203Du:
              goto LABEL_61;
            case 0x2011u:
              v43 = 8208;
              goto LABEL_113;
            case 0x2017u:
              v42 = v36 + 1;
              *(_WORD *)&v26[2 * v36] = 32;
              v43 = 819;
              goto LABEL_88;
            case 0x2018u:
            case 0x2019u:
              v43 = 39;
              goto LABEL_113;
            case 0x201Cu:
            case 0x201Du:
              v43 = 34;
              goto LABEL_113;
            case 0x2024u:
              v43 = 46;
LABEL_113:
              v41 = 1;
              v42 = v36;
              goto LABEL_118;
            case 0x2025u:
              v42 = v36 + 1;
              v43 = 46;
              goto LABEL_86;
            case 0x2033u:
              v42 = v36 + 1;
              v43 = 8242;
              goto LABEL_86;
            case 0x2034u:
              *(_DWORD *)&v26[2 * v36] = 540155954;
              v42 = v36 + 2;
              v43 = 8242;
              goto LABEL_117;
            case 0x2036u:
              v42 = v36 + 1;
              v43 = 8245;
              goto LABEL_86;
            case 0x2037u:
              *(_DWORD *)&v26[2 * v36] = 540352565;
              v42 = v36 + 2;
              v43 = 8245;
              goto LABEL_117;
            case 0x203Cu:
              v42 = v36 + 1;
              v43 = 33;
              goto LABEL_86;
            case 0x203Eu:
              v42 = v36 + 1;
              *(_WORD *)&v26[2 * v36] = 32;
              v43 = 773;
              goto LABEL_88;
            default:
              v42 = v36;
              switch(v40)
              {
                case 0xA0u:
                  goto LABEL_118;
                case 0xA8u:
                  v42 = v36 + 1;
                  *(_WORD *)&v26[2 * v36] = 32;
                  v43 = 776;
                  goto LABEL_88;
                case 0xAAu:
                  v43 = 97;
                  goto LABEL_113;
                case 0xAFu:
                  v42 = v36 + 1;
                  *(_WORD *)&v26[2 * v36] = 32;
                  v43 = 772;
                  goto LABEL_88;
                case 0xB2u:
                  v43 = 50;
                  goto LABEL_113;
                case 0xB3u:
                  v43 = 51;
                  goto LABEL_113;
                case 0xB4u:
                  v42 = v36 + 1;
                  *(_WORD *)&v26[2 * v36] = 32;
                  v43 = 769;
                  goto LABEL_88;
                case 0xB5u:
                  v43 = 956;
                  goto LABEL_113;
                case 0xB8u:
                  v42 = v36 + 1;
                  *(_WORD *)&v26[2 * v36] = 32;
                  v43 = 807;
                  goto LABEL_88;
                case 0xB9u:
                  v43 = 49;
                  goto LABEL_113;
                case 0xBAu:
                  v43 = 111;
                  goto LABEL_113;
                case 0xBCu:
                  v53 = 2 * v36;
                  v54 = 49;
                  goto LABEL_116;
                case 0xBDu:
                  *(_DWORD *)&v26[2 * v36] = 541327409;
                  v42 = v36 + 2;
                  v43 = 50;
                  break;
                case 0xBEu:
                  v53 = 2 * v36;
                  v54 = 51;
LABEL_116:
                  *(_DWORD *)&v26[v53] = v54 | 0x20440000;
                  v42 = v36 + 2;
                  v43 = 52;
                  break;
                default:
                  goto LABEL_61;
              }
LABEL_117:
              v41 = 3;
              break;
          }
          goto LABEL_118;
        }
        if (v40 <= 0x2048u)
        {
          if (v40 == 8263)
          {
            v42 = v36 + 1;
            v43 = 63;
LABEL_86:
            *(_WORD *)&v26[2 * v36] = v43;
            goto LABEL_88;
          }
          if (v40 == 8264)
          {
            v42 = v36 + 1;
            *(_WORD *)&v26[2 * v36] = 63;
            v43 = 33;
LABEL_88:
            v41 = 2;
            goto LABEL_118;
          }
          goto LABEL_61;
        }
        if (v40 == 8265)
        {
          v42 = v36 + 1;
          *(_WORD *)&v26[2 * v36] = 33;
          v43 = 63;
          goto LABEL_88;
        }
        if (v40 == 8279)
        {
          v52 = &v26[2 * v36];
          *(_DWORD *)v52 = 540155954;
          v42 = v36 + 3;
          v43 = 8242;
          *((_WORD *)v52 + 2) = 8242;
          v41 = 4;
          goto LABEL_118;
        }
        v42 = v36;
        if (v40 != 8287)
          goto LABEL_61;
LABEL_118:
        v36 += v41;
        *(_WORD *)&v26[2 * v42] = v43;
        ++v35;
        --v34;
        ++v37;
        if (v30 == v35)
          goto LABEL_119;
      }
      v40 = 0;
LABEL_61:
      v41 = 1;
      v42 = v36;
      v43 = v40;
      goto LABEL_118;
    }
LABEL_119:
    v24 = v61;
    v27 = v60;
  }

  v55 = (void *)MEMORY[0x1A1AFDC98]();
  objc_msgSend(MEMORY[0x1E0CB3940], "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v26, v27, v24, 2483028224, 0, 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v55);
LABEL_124:

  return v56;
}

id _PASSlowNormalizeUnicodeString(void *a1, int a2)
{
  return _PASSimpleICUTransform(CFSTR("[^…] NFKD; Latin-ASCII; [[:Nonspacing Mark:]&[:Zinh:]] Remove; NFC; Lower"),
           a1,
           a2);
}

id _PASSlowNormalizeUnicodeStringMinimally(void *a1, int a2)
{
  return _PASSimpleICUTransform(CFSTR("[^…] NFKC; Fullwidth-Halfwidth; [､｡‘’“”،] Latin-ASCII"), a1, a2);
}

id _PASGetNounsAndNames(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  if (_PASGetNounsAndNames__pasOnceToken26 != -1)
    dispatch_once(&_PASGetNounsAndNames__pasOnceToken26, &__block_literal_global_15);
  v3 = (id)_PASGetNounsAndNames__pasExprOnceResult;
  v4 = objc_msgSend(v1, "length");
  v5 = *MEMORY[0x1E0CB2D18];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___PASGetNounsAndNames_block_invoke_2;
  v12[3] = &unk_1E442F6E8;
  v13 = v3;
  v6 = v2;
  v14 = v6;
  v15 = v1;
  v7 = v1;
  v8 = v3;
  objc_msgSend(v7, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v4, v5, 22, 0, v12);
  v9 = v15;
  v10 = v6;

  return v10;
}

__CFString *_PASRepairString(void *a1)
{
  __CFString *v1;
  uint64_t v2;
  __CFString *v3;
  __CFString *v4;
  const char *CStringPtr;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  CFIndex Length;
  const UniChar *CharactersPtr;
  const char *v12;
  uint64_t v13;
  int64_t v14;
  UniChar v15;
  int64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  CFIndex v20;
  UniChar v21;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  CFIndex v26;
  __CFString *v27;
  void *v28;
  CFIndex v29;
  const UniChar *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  UniChar v34;
  BOOL v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  CFIndex v39;
  UniChar v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  CFIndex v46;
  id v47;
  UniChar *v48;
  uint64_t v49;
  void *v50;
  __CFString *v51;
  _WORD v52[2];
  UniChar v53;
  UniChar buffer[8];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __CFString *v62;
  const UniChar *v63;
  const char *v64;
  uint64_t v65;
  CFIndex v66;
  uint64_t v67;
  int64_t v68;
  CFRange v69;
  CFRange v70;

  v1 = a1;
  if (-[__CFString length](v1, "length"))
  {
    v2 = -[__CFString fastestEncoding](v1, "fastestEncoding");
    if (v2 != 4 && v2 != 1)
    {
      CStringPtr = CFStringGetCStringPtr(v1, 4u);
      v7 = v1;
      v8 = v7;
      if (CStringPtr)
      {
        v4 = v7;
        goto LABEL_6;
      }
      objc_opt_self();
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {

LABEL_41:
        v3 = v8;
        goto LABEL_5;
      }
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      *(_OWORD *)buffer = 0u;
      v55 = 0u;
      Length = CFStringGetLength(v8);
      v62 = v8;
      v65 = 0;
      v66 = Length;
      CharactersPtr = CFStringGetCharactersPtr(v8);
      v12 = 0;
      v63 = CharactersPtr;
      if (!CharactersPtr)
        v12 = CFStringGetCStringPtr(v8, 0x600u);
      v64 = v12;
      v67 = 0;
      v68 = 0;
      if (Length >= 1)
      {
        v13 = 0;
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v17 = 1;
        v18 = 64;
        while (1)
        {
          if ((unint64_t)v16 >= 4)
            v19 = 4;
          else
            v19 = v16;
          v20 = v66;
          if (v66 <= v16)
          {
            if (v15 >> 10 == 54)
              goto LABEL_39;
            v21 = 0;
          }
          else
          {
            if (v63)
            {
              v21 = v63[v16 + v65];
            }
            else if (v64)
            {
              v21 = v64[v65 + v16];
            }
            else
            {
              if (v68 <= v16 || v14 > v16)
              {
                v23 = v19 + v13;
                v24 = v18 - v19;
                v25 = v16 - v19;
                v26 = v25 + 64;
                if (v25 + 64 >= v66)
                  v26 = v66;
                v67 = v25;
                v68 = v26;
                if (v66 >= v24)
                  v20 = v24;
                v69.length = v20 + v23;
                v69.location = v25 + v65;
                CFStringGetCharacters(v62, v69, buffer);
                v14 = v67;
              }
              v21 = buffer[v16 - v14];
            }
            if ((v15 >> 10 == 54) != (v21 >> 10 == 55))
              goto LABEL_39;
          }
          v17 = ++v16 < Length;
          --v13;
          ++v18;
          v15 = v21;
          if (Length == v16)
            goto LABEL_39;
        }
      }
      v15 = 0;
      v17 = 0;
LABEL_39:

      if (!v17 && (v15 & 0xFC00) != 0xD800)
        goto LABEL_41;
      v4 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", -[__CFString length](v8, "length"));
      v27 = v8;
      objc_opt_self();
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        *(_OWORD *)buffer = 0u;
        v55 = 0u;
        v29 = CFStringGetLength(v27);
        v62 = v27;
        v65 = 0;
        v66 = v29;
        v30 = CFStringGetCharactersPtr(v27);
        v31 = 0;
        v63 = v30;
        if (!v30)
          v31 = CFStringGetCStringPtr(v27, 0x600u);
        v51 = v27;
        v64 = v31;
        v67 = 0;
        v68 = 0;
        if (v29 >= 1)
        {
          v32 = 0;
          v33 = 0;
          v34 = 0;
          v35 = 0;
          v36 = 64;
          while (1)
          {
            v37 = 0;
            v38 = (unint64_t)v33 >= 4 ? 4 : v33;
            v53 = 0;
            v39 = v66;
            if (v66 <= v33)
              break;
            if (v63)
            {
              v40 = v63[v33 + v65];
            }
            else if (v64)
            {
              v40 = v64[v65 + v33];
            }
            else
            {
              v41 = v67;
              if (v68 <= v33 || v67 > v33)
              {
                v43 = v38 + v32;
                v44 = v36 - v38;
                v45 = v33 - v38;
                v46 = v45 + 64;
                if (v45 + 64 >= v66)
                  v46 = v66;
                v67 = v45;
                v68 = v46;
                if (v66 >= v44)
                  v39 = v44;
                v70.length = v39 + v43;
                v70.location = v45 + v65;
                CFStringGetCharacters(v62, v70, buffer);
                v41 = v67;
              }
              v40 = buffer[v33 - v41];
            }
            v53 = v40;
            v37 = (v40 & 0xFC00) == 55296;
            if (v35 && (v40 & 0xFC00) == 56320)
            {
              v52[0] = v34;
              v52[1] = v40;
              v47 = objc_alloc(MEMORY[0x1E0CB3940]);
              v48 = v52;
              v49 = 2;
LABEL_69:
              v50 = (void *)objc_msgSend(v47, "initWithCharacters:length:", v48, v49, v51);
              -[__CFString appendString:](v4, "appendString:", v50);

              goto LABEL_70;
            }
            if ((v40 & 0xF800 | 0x400) != 0xDC00)
              break;
LABEL_70:
            ++v33;
            v34 = v53;
            --v32;
            ++v36;
            v35 = v37;
            if (v29 == v33)
              goto LABEL_71;
          }
          v47 = objc_alloc(MEMORY[0x1E0CB3940]);
          v48 = &v53;
          v49 = 1;
          goto LABEL_69;
        }
LABEL_71:
        v27 = v51;
      }

      goto LABEL_6;
    }
  }
  v3 = v1;
LABEL_5:
  v4 = v3;
LABEL_6:

  return v4;
}

uint64_t _PASMurmur3_x86_32_init(uint64_t result, int a2)
{
  *(_DWORD *)result = a2;
  *(_DWORD *)(result + 4) = 0;
  *(_BYTE *)(result + 11) = 0;
  return result;
}

unsigned __int8 *_PASMurmur3_x86_32_update(unsigned __int8 *result, unsigned __int16 *a2, uint64_t a3)
{
  int v3;
  unsigned __int8 *v4;
  uint64_t v5;
  size_t v6;
  char v7;
  unint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;
  char *v16;
  uint64_t v17;
  char *v18;
  int v19;
  unint64_t v20;

  v3 = a3;
  v4 = result;
  v5 = result[11];
  v6 = (v5 + a3) & 3;
  if ((unint64_t)(v5 + a3) >= 4)
  {
    v8 = (v5 + a3) & 0xFFFFFFFFFFFFFFFCLL;
    switch(result[11])
    {
      case 0u:
        v9 = *(_DWORD *)a2;
        v10 = *(_DWORD *)a2 >> 8;
        v11 = HIWORD(*(_DWORD *)a2);
        v12 = HIBYTE(*(_DWORD *)a2);
        break;
      case 1u:
        LOBYTE(v9) = result[8];
        LOBYTE(v10) = *(_BYTE *)a2;
        v11 = *(unsigned __int16 *)((char *)a2 + 1);
        goto LABEL_10;
      case 2u:
        v9 = *((unsigned __int16 *)result + 4);
        v10 = v9 >> 8;
        v11 = *a2;
LABEL_10:
        v12 = v11 >> 8;
        break;
      case 3u:
        v9 = *((unsigned __int16 *)result + 4);
        v10 = v9 >> 8;
        LOBYTE(v11) = result[10];
        v12 = *(unsigned __int8 *)a2;
        break;
      default:
        LOBYTE(v10) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v11) = 0;
        v12 = 0;
        break;
    }
    v13 = (v11 << 16) | (v12 << 24) | v9 | (v10 << 8);
    HIDWORD(v14) = (461845907 * ((380141568 * v13) | ((-862048943 * v13) >> 17))) ^ *(_DWORD *)result;
    LODWORD(v14) = HIDWORD(v14);
    v15 = 5 * (v14 >> 19) - 430675100;
    *(_DWORD *)result = v15;
    v16 = (char *)a2 - v5 + 4;
    v17 = v8 - 4;
    v18 = &v16[v17];
    if (v17 >= 1)
    {
      do
      {
        v19 = *(_DWORD *)v16;
        v16 += 4;
        HIDWORD(v20) = (461845907 * ((380141568 * v19) | ((-862048943 * v19) >> 17))) ^ v15;
        LODWORD(v20) = HIDWORD(v20);
        v15 = 5 * (v20 >> 19) - 430675100;
        *(_DWORD *)result = v15;
      }
      while (v16 < v18);
    }
    if (v6 - 1 <= 2)
      result = (unsigned __int8 *)memcpy(result + 8, v18, v6);
  }
  else
  {
    v7 = v6 - v5;
    if ((v7 - 1) <= 2u)
    {
      result = (unsigned __int8 *)memcpy(&result[v5 + 8], a2, (v7 - 1) + 1);
      LOBYTE(v5) = v4[11];
    }
    LOBYTE(v6) = v5 + v7;
  }
  v4[11] = v6;
  *((_DWORD *)v4 + 1) += v3;
  return result;
}

uint64_t _PASMurmur3_x86_32_final(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;

  v1 = *(unsigned __int8 *)(a1 + 11);
  switch(v1)
  {
    case 1:
      v2 = *(unsigned __int8 *)(a1 + 8);
      break;
    case 2:
      v2 = *(unsigned __int16 *)(a1 + 8);
      break;
    case 3:
      v2 = *(unsigned __int16 *)(a1 + 8) | (*(unsigned __int8 *)(a1 + 10) << 16);
      break;
    default:
      v3 = *(_DWORD *)a1;
      goto LABEL_9;
  }
  v3 = (461845907 * ((380141568 * v2) | ((-862048943 * v2) >> 17))) ^ *(_DWORD *)a1;
LABEL_9:
  v4 = -2048144789 * (v3 ^ *(_DWORD *)(a1 + 4) ^ ((v3 ^ *(_DWORD *)(a1 + 4)) >> 16));
  v5 = (-1028477387 * (v4 ^ (v4 >> 13))) ^ ((-1028477387 * (v4 ^ (v4 >> 13))) >> 16);
  *(_DWORD *)a1 = v5;
  return v5;
}

uint64_t _PASMurmur3_x86_32(unsigned __int16 *a1, unint64_t a2, int a3)
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  unsigned int v12;

  v3 = a2 & 3;
  if (a2 >= 4)
  {
    HIDWORD(v5) = (461845907 * ((380141568 * *(_DWORD *)a1) | ((-862048943 * *(_DWORD *)a1) >> 17))) ^ a3;
    LODWORD(v5) = HIDWORD(v5);
    a3 = 5 * (v5 >> 19) - 430675100;
    v6 = (unsigned __int16 *)((char *)a1 + (a2 & 0xFFFFFFFFFFFFFFFCLL));
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFFCLL) >= 5)
    {
      v7 = a1 + 2;
      do
      {
        v8 = *(_DWORD *)v7;
        v7 += 2;
        HIDWORD(v9) = (461845907 * ((380141568 * v8) | ((-862048943 * v8) >> 17))) ^ a3;
        LODWORD(v9) = HIDWORD(v9);
        a3 = 5 * (v9 >> 19) - 430675100;
      }
      while (v7 < v6);
    }
    if (v3 != 1)
    {
      if (v3 != 3)
      {
        if (v3 != 2)
          goto LABEL_20;
        LOWORD(v4) = *v6;
        goto LABEL_13;
      }
      v10 = *((unsigned __int8 *)v6 + 2);
      v11 = *v6;
LABEL_18:
      v4 = (v11 | (v10 << 16)) & 0xFFFFFF;
      goto LABEL_19;
    }
LABEL_15:
    v4 = *(unsigned __int8 *)v6;
    goto LABEL_19;
  }
  switch(v3)
  {
    case 1uLL:
      v6 = a1;
      goto LABEL_15;
    case 3uLL:
      v10 = *((unsigned __int8 *)a1 + 2);
      v11 = *a1;
      goto LABEL_18;
    case 2uLL:
      LOWORD(v4) = *a1;
LABEL_13:
      v4 = (unsigned __int16)v4;
LABEL_19:
      a3 ^= 461845907 * ((380141568 * v4) | ((-862048943 * v4) >> 17));
      break;
  }
LABEL_20:
  v12 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  return (-1028477387 * (v12 ^ (v12 >> 13))) ^ ((-1028477387 * (v12 ^ (v12 >> 13))) >> 16);
}

int32x4_t _PASMurmur3_x86_128_init(int32x4_t *a1, unsigned int a2)
{
  int32x4_t result;

  result = vdupq_n_s32(a2);
  *a1 = result;
  a1[1].i32[0] = 0;
  a1[2].i8[3] = 0;
  return result;
}

int8x8_t *_PASMurmur3_x86_128_update(int8x8_t *result, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int8x8_t *v8;
  uint64_t v9;
  size_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int32x2_t v16;
  int32x2_t v17;
  uint32x2_t v18;
  int32x2_t v19;
  uint32x2_t v20;
  int32x2_t v21;
  int32x2_t v22;
  int32x2_t *v23;
  uint64_t v24;
  int32x2_t *v25;
  int32x2_t v26;
  int32x2_t v27;
  uint32x2_t v28;
  uint32x2_t v29;
  int32x2_t v30;

  v7 = a3;
  v8 = result;
  v9 = result[4].u8[3];
  v10 = (v9 + a3) & 0xF;
  if ((unint64_t)(v9 + a3) >= 0x10)
  {
    v12 = (v9 + a3) & 0xFFFFFFFFFFFFFFF0;
    LOBYTE(v13) = result[4].i8[3];
    switch((char)v13)
    {
      case 0:
        v13 = *(_QWORD *)a2;
        v4 = *((_QWORD *)a2 + 1);
        v3 = *(_QWORD *)a2 >> 8;
        v5 = *(_QWORD *)a2 >> 16;
        v6 = HIDWORD(*(_QWORD *)a2);
        break;
      case 1:
        LOBYTE(v13) = result[2].i8[4];
        LOBYTE(v3) = *a2;
        LOWORD(v5) = *(_WORD *)(a2 + 1);
        LODWORD(v6) = *(_DWORD *)(a2 + 3);
        v4 = *(_QWORD *)(a2 + 7);
        break;
      case 2:
        LODWORD(v13) = result[2].u16[2];
        LODWORD(v3) = v13 >> 8;
        LOWORD(v5) = *(_WORD *)a2;
        LODWORD(v6) = *(_DWORD *)(a2 + 2);
        v4 = *(_QWORD *)(a2 + 6);
        break;
      case 3:
        LODWORD(v13) = result[2].u16[2];
        LODWORD(v3) = v13 >> 8;
        LOWORD(v5) = result[2].u8[6] | (*a2 << 8);
        LODWORD(v6) = *(_DWORD *)(a2 + 1);
        v4 = *(_QWORD *)(a2 + 5);
        break;
      case 4:
        LODWORD(v13) = result[2].i32[1];
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        LODWORD(v6) = *(_DWORD *)a2;
        v4 = *(_QWORD *)(a2 + 4);
        break;
      case 5:
        LODWORD(v13) = result[2].i32[1];
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        LODWORD(v6) = (*(unsigned __int16 *)a2 << 8) | (a2[2] << 24) | result[3].u8[0];
        v4 = *(_QWORD *)(a2 + 3);
        break;
      case 6:
        LODWORD(v13) = result[2].i32[1];
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        LODWORD(v6) = result[3].u16[0] | (*(unsigned __int16 *)a2 << 16);
        v4 = *(_QWORD *)(a2 + 2);
        break;
      case 7:
        LODWORD(v13) = result[2].i32[1];
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        LODWORD(v6) = result[3].u16[0] | (result[3].u8[2] << 16) | (*a2 << 24);
        v4 = *(_QWORD *)(a2 + 1);
        break;
      case 8:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v4 = *(_QWORD *)a2;
        break;
      case 9:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v14 = ((unint64_t)*(unsigned int *)a2 << 8) | ((unint64_t)(*((unsigned __int16 *)a2 + 2) | (a2[6] << 16)) << 40);
        v15 = result[3].u8[4];
        goto LABEL_17;
      case 10:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v14 = ((unint64_t)*(unsigned int *)a2 << 16) | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 48);
        v15 = result[3].u16[2];
LABEL_17:
        v4 = v14 | v15;
        break;
      case 11:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = ((unint64_t)*(unsigned int *)a2 << 24) | ((unint64_t)a2[4] << 56) | result[3].u16[2] | ((unint64_t)result[3].u8[6] << 16);
        v6 = HIDWORD(v13);
        break;
      case 12:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = result[3].u32[1] | ((unint64_t)*(unsigned int *)a2 << 32);
        goto LABEL_23;
      case 13:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = result[3].u32[1] | ((unint64_t)result[4].u8[0] << 32) | ((unint64_t)(*(unsigned __int16 *)a2 | (a2[2] << 16)) << 40);
        goto LABEL_23;
      case 14:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = result[3].u32[1] | ((unint64_t)result[4].u16[0] << 32) | ((unint64_t)*(unsigned __int16 *)a2 << 48);
        goto LABEL_23;
      case 15:
        v13 = *(unint64_t *)((char *)&result[2] + 4);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = result[3].u32[1] | ((unint64_t)(result[4].u16[0] | (result[4].u8[2] << 16)) << 32) | ((unint64_t)*a2 << 56);
LABEL_23:
        v6 = HIDWORD(v13);
        break;
      default:
        break;
    }
    v16.i8[0] = v13;
    v16.i8[1] = v3;
    v16.i8[2] = v5;
    v16.i8[3] = BYTE1(v5);
    v16.i32[1] = v6;
    v17 = (int32x2_t)result[1];
    v18 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v16, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v16, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789), *result);
    v19 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v18, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v18, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32((int32x2_t)*result, 1), v17)), (int32x2_t)0x500000005);
    v20 = (uint32x2_t)veor_s8((int8x8_t)v17, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32((int32x2_t)v4, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32((int32x2_t)v4, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
    v21 = vdup_lane_s32(v19, 0);
    v21.i32[0] = v17.i32[1];
    v22 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v21, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v20, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v20, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
    *result = (int8x8_t)v19;
    result[1] = (int8x8_t)v22;
    v23 = (int32x2_t *)&a2[-v9 + 16];
    v24 = v12 - 16;
    v25 = (int32x2_t *)((char *)v23 + v24);
    if (v24 >= 1)
    {
      do
      {
        v26 = *v23;
        v27 = v23[1];
        v23 += 2;
        v28 = (uint32x2_t)veor_s8((int8x8_t)v19, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v26, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v26, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789));
        v19 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v28, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v28, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32(v19, 1), v22)), (int32x2_t)0x500000005);
        v29 = (uint32x2_t)veor_s8((int8x8_t)v22, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v27, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(v27, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
        v30 = vdup_lane_s32(v19, 0);
        v30.i32[0] = v22.i32[1];
        v22 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v30, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v29, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v29, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
        *result = (int8x8_t)v19;
        result[1] = (int8x8_t)v22;
      }
      while (v23 < v25);
    }
    if (v10 - 1 <= 0xE)
      result = (int8x8_t *)memcpy((char *)&result[2] + 4, v25, v10);
  }
  else
  {
    v11 = v10 - v9;
    if ((v11 - 1) <= 0xEu)
    {
      result = (int8x8_t *)memcpy((char *)&result[2] + v9 + 4, a2, (v11 - 1) + 1);
      LOBYTE(v9) = v8[4].i8[3];
    }
    LOBYTE(v10) = v9 + v11;
  }
  v8[4].i8[3] = v10;
  v8[2].i32[0] += v7;
  return result;
}

unint64_t _PASMurmur3_x86_128_final(int8x8_t *a1)
{
  int v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  int v8;
  int32x2_t v9;
  uint32x4_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int32x4_t v13;
  unsigned int v14;
  uint64_t v15;
  int32x2_t v16;

  v1 = a1[4].u8[3];
  switch(a1[4].i8[3])
  {
    case 1:
      v6 = a1[2].u8[4];
      goto LABEL_21;
    case 2:
      v6 = a1[2].u16[2];
      goto LABEL_21;
    case 3:
      v6 = a1[2].u16[2] | (a1[2].u8[6] << 16);
LABEL_21:
      v2 = (-1425107063 * ((-888307712 * v6) | ((597399067 * v6) >> 17))) ^ a1->i32[0];
      a1->i32[0] = v2;
      break;
    case 4:
    case 5:
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
    case 9:
    case 0xA:
    case 0xB:
      goto LABEL_3;
    case 0xC:
    case 0xD:
    case 0xE:
    case 0xF:
      a1[1].i32[0] ^= -1578923117 * ((-1781923840 * a1[3].i32[1]) | ((951274213 * a1[3].i32[1]) >> 15));
LABEL_3:
      a1->i32[1] ^= 951274213 * ((-1752629248 * a1[3].i32[0]) | ((-1425107063 * a1[3].i32[0]) >> 16));
LABEL_4:
      v2 = (-1425107063 * ((-888307712 * a1[2].i32[1]) | ((597399067 * a1[2].i32[1]) >> 17))) ^ a1->i32[0];
      switch(v1)
      {
        case 5:
          v3 = a1[3].u8[0];
          goto LABEL_8;
        case 6:
          v3 = a1[3].u16[0];
          goto LABEL_8;
        case 7:
          v3 = a1[3].u16[0] | (a1[3].u8[2] << 16);
LABEL_8:
          a1->i32[1] ^= 951274213 * ((-1752629248 * v3) | ((-1425107063 * v3) >> 16));
          goto LABEL_22;
        case 9:
          v4 = a1[3].u8[4];
          goto LABEL_12;
        case 10:
          v4 = a1[3].u16[2];
          goto LABEL_12;
        case 11:
          v4 = a1[3].u16[2] | (a1[3].u8[6] << 16);
LABEL_12:
          a1[1].i32[0] ^= -1578923117 * ((-1781923840 * v4) | ((951274213 * v4) >> 15));
          goto LABEL_22;
        case 13:
          v5 = a1[4].u8[0];
          goto LABEL_16;
        case 14:
          v5 = a1[4].u16[0];
          goto LABEL_16;
        case 15:
          v5 = a1[4].u16[0] | (a1[4].u8[2] << 16);
LABEL_16:
          a1[1].i32[1] ^= 597399067 * ((776732672 * v5) | ((-1578923117 * v5) >> 14));
          break;
        default:
          goto LABEL_22;
      }
      break;
    default:
      v2 = a1->i32[0];
      break;
  }
LABEL_22:
  v7 = a1[2].u32[0];
  v8 = a1->i32[1] ^ v7;
  v9 = (int32x2_t)veor_s8(a1[1], (int8x8_t)vdup_n_s32(v7));
  v10.i32[0] = v8 + (v2 ^ v7) + v9.i32[0] + v9.i32[1];
  v10.i32[1] = v10.i32[0] + v8;
  v10.u64[1] = (unint64_t)vadd_s32(vdup_n_s32(v10.u32[0]), v9);
  v11 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v10, 0x10uLL), (int8x16_t)v10), vdupq_n_s32(0x85EBCA6B));
  v12 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v11, 0xDuLL), v11), vdupq_n_s32(0xC2B2AE35));
  v13 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v12, 0x10uLL), v12);
  v14 = vaddvq_s32(v13);
  v15 = v14;
  a1->i32[0] = v14;
  v16 = vadd_s32(vdup_n_s32(v14), (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v13, (int8x16_t)v13, 4uLL));
  *(int32x2_t *)((char *)a1 + 4) = v16;
  a1[1].i32[1] = v15 + v13.i32[3];
  return v15 | ((unint64_t)v16.u32[0] << 32);
}

double _PASMurmur3_x86_128(unsigned __int16 *a1, unint64_t a2, int a3)
{
  int v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  unint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  int v17;
  int v18;
  _DWORD *v19;
  unint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unint64_t v27;
  unint64_t v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  BOOL v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  __int32 v41;
  uint32x4_t v42;
  int8x16_t v43;
  int8x16_t v44;
  int32x4_t v45;
  unsigned int v46;
  unsigned __int32 v47;
  int32x2_t v48;
  int8x16_t v49;
  double result;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;

  v3 = a2 & 0xF;
  if (a2 >= 0x10)
  {
    v15 = a2 & 0xF;
    HIDWORD(v16) = (-1425107063 * ((-888307712 * *(_DWORD *)a1) | ((597399067 * *(_DWORD *)a1) >> 17))) ^ a3;
    LODWORD(v16) = HIDWORD(v16);
    v17 = 5 * ((v16 >> 13) + a3) + 1444728091;
    HIDWORD(v16) = (951274213
                  * ((-1752629248 * *((_DWORD *)a1 + 1)) | ((-1425107063 * *((_DWORD *)a1 + 1)) >> 16))) ^ a3;
    LODWORD(v16) = HIDWORD(v16);
    v5 = 5 * ((v16 >> 15) + a3) + 197830471;
    HIDWORD(v16) = (-1578923117
                  * ((-1781923840 * *((_DWORD *)a1 + 2)) | ((951274213 * *((_DWORD *)a1 + 2)) >> 15))) ^ a3;
    LODWORD(v16) = HIDWORD(v16);
    v18 = 5 * ((v16 >> 17) + a3);
    HIDWORD(v16) = (597399067
                  * ((776732672 * *((_DWORD *)a1 + 3)) | ((-1578923117 * *((_DWORD *)a1 + 3)) >> 14))) ^ a3;
    LODWORD(v16) = HIDWORD(v16);
    v6 = v18 - 1764942795;
    v7 = 5 * (v17 + (v16 >> 19)) + 850148119;
    v8 = (unint64_t)a1 + (a2 & 0xFFFFFFFFFFFFFFF0);
    if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFF0) < 17)
    {
      a3 = v17;
    }
    else
    {
      v19 = a1 + 8;
      a3 = v17;
      do
      {
        HIDWORD(v20) = a3 ^ (-1425107063 * ((-888307712 * *v19) | ((597399067 * *v19) >> 17)));
        LODWORD(v20) = HIDWORD(v20);
        a3 = 5 * ((v20 >> 13) + v5) + 1444728091;
        HIDWORD(v20) = v5 ^ (951274213 * ((-1752629248 * v19[1]) | ((-1425107063 * v19[1]) >> 16)));
        LODWORD(v20) = HIDWORD(v20);
        v5 = 5 * (v6 + (v20 >> 15)) + 197830471;
        HIDWORD(v20) = v6 ^ (-1578923117 * ((-1781923840 * v19[2]) | ((951274213 * v19[2]) >> 15)));
        LODWORD(v20) = HIDWORD(v20);
        v21 = 5 * (v7 + (v20 >> 17));
        HIDWORD(v20) = v7 ^ (597399067 * ((776732672 * v19[3]) | ((-1578923117 * v19[3]) >> 14)));
        LODWORD(v20) = HIDWORD(v20);
        v6 = v21 - 1764942795;
        v7 = 5 * ((v20 >> 19) + a3) + 850148119;
        v19 += 4;
      }
      while ((unint64_t)v19 < v8);
    }
    LOBYTE(v4) = 0;
    LOBYTE(v9) = 0;
    v10 = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    switch(a2 & 0xF)
    {
      case 1uLL:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LOBYTE(v4) = *(_BYTE *)v8;
        goto LABEL_35;
      case 2uLL:
        LOBYTE(v14) = 0;
        v4 = *(unsigned __int16 *)v8;
        LODWORD(v13) = v4 >> 8;
        goto LABEL_35;
      case 3uLL:
        v4 = *(unsigned __int16 *)v8 | (*(unsigned __int8 *)(v8 + 2) << 16);
        LODWORD(v13) = v4 >> 8;
        LOBYTE(v14) = *(_BYTE *)(v8 + 2);
LABEL_35:
        HIDWORD(v57) = 0;
        v58 = 0;
        v10 = 0;
        LOBYTE(v9) = 0;
        v29 = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v11) = 0;
        v30 = 0;
        goto LABEL_52;
      case 4uLL:
        goto LABEL_39;
      case 5uLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v4) = *(_BYTE *)(v8 + 4);
        goto LABEL_39;
      case 6uLL:
        LOBYTE(v12) = 0;
        v4 = *(unsigned __int16 *)(v8 + 4);
        LODWORD(v11) = v4 >> 8;
        goto LABEL_39;
      case 7uLL:
        v4 = *(unsigned __int16 *)(v8 + 4) | (*(unsigned __int8 *)(v8 + 6) << 16);
        LODWORD(v11) = v4 >> 8;
        LOBYTE(v12) = *(_BYTE *)(v8 + 6);
LABEL_39:
        HIDWORD(v57) = 0;
        v58 = 0;
        v10 = 0;
        LOBYTE(v9) = 0;
        v29 = 0;
        LODWORD(v22) = *(_DWORD *)v8;
        LODWORD(v8) = *(_DWORD *)v8 & 0xFF000000;
        LODWORD(v14) = WORD1(v22);
        LODWORD(v13) = v22 >> 8;
        goto LABEL_51;
      case 8uLL:
        goto LABEL_43;
      case 9uLL:
        LOBYTE(v9) = 0;
        v10 = 0;
        LOBYTE(v4) = *(_BYTE *)(v8 + 8);
        goto LABEL_43;
      case 0xAuLL:
        v10 = 0;
        v4 = *(unsigned __int16 *)(v8 + 8);
        v9 = v4 >> 8;
        goto LABEL_43;
      case 0xBuLL:
        v4 = *(unsigned __int16 *)(v8 + 8) | (*(unsigned __int8 *)(v8 + 10) << 16);
        v9 = v4 >> 8;
        v10 = *(_BYTE *)(v8 + 10);
LABEL_43:
        HIDWORD(v57) = 0;
        v58 = 0;
        v22 = *(_QWORD *)v8;
        v32 = HIBYTE(*(_QWORD *)v8);
        v12 = HIWORD(*(_QWORD *)v8);
        v11 = *(_QWORD *)v8 >> 40;
        v23 = HIDWORD(*(_QWORD *)v8);
        v8 = *(_QWORD *)v8 & 0xFF000000;
        v14 = v22 >> 16;
        v13 = v22 >> 8;
        goto LABEL_50;
      case 0xCuLL:
        LOBYTE(v22) = 0;
        v56 = 0;
        LOBYTE(v57) = 0;
        goto LABEL_48;
      case 0xDuLL:
        v56 = 0;
        LOBYTE(v57) = 0;
        LOBYTE(v22) = *(_BYTE *)(v8 + 12);
        goto LABEL_48;
      case 0xEuLL:
        LODWORD(v22) = *(unsigned __int16 *)(v8 + 12);
        v56 = 0;
        LODWORD(v57) = v22 >> 8;
        goto LABEL_48;
      case 0xFuLL:
        LODWORD(v22) = *(unsigned __int16 *)(v8 + 12) | (*(unsigned __int8 *)(v8 + 14) << 16);
        v56 = v22 & 0xFF0000;
        LODWORD(v57) = v22 >> 8;
        goto LABEL_48;
      default:
        if (((1 << v15) & 0xF0) != 0)
        {
          HIDWORD(v57) = 0;
          v58 = 0;
          v10 = 0;
          LOBYTE(v9) = 0;
          v29 = 0;
          LOBYTE(v12) = 0;
          LOBYTE(v11) = 0;
          LOBYTE(v4) = 0;
          LODWORD(v8) = 0;
          LOBYTE(v14) = 0;
          LOBYTE(v13) = 0;
          LOBYTE(v22) = 0;
          goto LABEL_51;
        }
        if (((1 << v15) & 0xF00) != 0)
        {
          HIDWORD(v57) = 0;
          v58 = 0;
          v10 = 0;
          LOBYTE(v9) = 0;
          LOBYTE(v4) = 0;
          LODWORD(v32) = 0;
          LOBYTE(v12) = 0;
          LOBYTE(v11) = 0;
          LOBYTE(v23) = 0;
          LODWORD(v8) = 0;
          LOBYTE(v14) = 0;
          LOBYTE(v13) = 0;
          LOBYTE(v22) = 0;
          goto LABEL_50;
        }
        v56 = 0;
        v57 = 0;
        v58 = 0;
        LODWORD(v23) = 0;
        LOBYTE(v24) = 0;
        LOBYTE(v25) = 0;
        LOBYTE(v26) = 0;
        LOBYTE(v54) = 0;
        LODWORD(v55) = 0;
        LOBYTE(v52) = 0;
        LOBYTE(v53) = 0;
        LODWORD(v8) = 0;
        LOBYTE(v51) = 0;
        LOBYTE(v27) = 0;
        LOBYTE(v28) = 0;
        v10 = 0;
        LOBYTE(v9) = 0;
        v29 = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v11) = 0;
        v30 = 0;
        LOBYTE(v14) = 0;
        LOBYTE(v13) = 0;
        LOBYTE(v4) = 0;
        v31 = ((1 << v15) & 0xF000) == 0;
        v3 = a2 & 0xF;
        LOBYTE(v22) = 0;
        if (v31)
          goto LABEL_52;
        break;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
    v5 = a3;
    v6 = a3;
    v7 = a3;
    v8 = (unint64_t)a1;
    LOBYTE(v9) = 0;
    v10 = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    switch(a2 & 0xF)
    {
      case 1uLL:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LOBYTE(v4) = *(_BYTE *)a1;
        goto LABEL_14;
      case 2uLL:
        LOBYTE(v14) = 0;
        v4 = *a1;
        LODWORD(v13) = v4 >> 8;
        goto LABEL_14;
      case 3uLL:
        v4 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v13) = v4 >> 8;
        LOBYTE(v14) = *((_BYTE *)a1 + 2);
LABEL_14:
        v5 = a3;
        v6 = a3;
        v7 = a3;
        goto LABEL_35;
      case 4uLL:
        goto LABEL_39;
      case 5uLL:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v4) = *((_BYTE *)a1 + 4);
        goto LABEL_18;
      case 6uLL:
        LOBYTE(v12) = 0;
        v4 = a1[2];
        LODWORD(v11) = v4 >> 8;
        goto LABEL_18;
      case 7uLL:
        v4 = a1[2] | (*((unsigned __int8 *)a1 + 6) << 16);
        LODWORD(v11) = v4 >> 8;
        LOBYTE(v12) = *((_BYTE *)a1 + 6);
LABEL_18:
        v5 = a3;
        v6 = a3;
        v7 = a3;
        v8 = (unint64_t)a1;
        goto LABEL_39;
      case 8uLL:
        goto LABEL_43;
      case 9uLL:
        LOBYTE(v9) = 0;
        v10 = 0;
        LOBYTE(v4) = *((_BYTE *)a1 + 8);
        goto LABEL_22;
      case 0xAuLL:
        v10 = 0;
        v4 = a1[4];
        v9 = v4 >> 8;
        goto LABEL_22;
      case 0xBuLL:
        v4 = a1[4] | (*((unsigned __int8 *)a1 + 10) << 16);
        v9 = v4 >> 8;
        v10 = *((_BYTE *)a1 + 10);
LABEL_22:
        v5 = a3;
        v6 = a3;
        v7 = a3;
        v8 = (unint64_t)a1;
        goto LABEL_43;
      case 0xCuLL:
        LOBYTE(v22) = 0;
        v56 = 0;
        LOBYTE(v57) = 0;
        goto LABEL_27;
      case 0xDuLL:
        v56 = 0;
        LOBYTE(v57) = 0;
        LOBYTE(v22) = *((_BYTE *)a1 + 12);
        goto LABEL_27;
      case 0xEuLL:
        LODWORD(v22) = a1[6];
        v56 = 0;
        LODWORD(v57) = v22 >> 8;
        goto LABEL_27;
      case 0xFuLL:
        LODWORD(v22) = a1[6] | (*((unsigned __int8 *)a1 + 14) << 16);
        LODWORD(v57) = v22 >> 8;
        v56 = v22 & 0xFF0000;
LABEL_27:
        v5 = a3;
        v6 = a3;
        v7 = a3;
        v8 = (unint64_t)a1;
        break;
      default:
        v5 = a3;
        v6 = a3;
        v7 = a3;
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        goto LABEL_35;
    }
LABEL_48:
    v26 = *(_DWORD *)(v8 + 8);
    LODWORD(v23) = v26 & 0xFF000000;
    v24 = HIWORD(v26);
    v25 = v26 >> 8;
    v28 = *(_QWORD *)v8;
    v55 = HIBYTE(*(_QWORD *)v8);
    v54 = HIWORD(*(_QWORD *)v8);
    v53 = *(_QWORD *)v8 >> 40;
    v52 = HIDWORD(*(_QWORD *)v8);
    v8 = *(_QWORD *)v8 & 0xFF000000;
    v51 = v28 >> 16;
    v27 = v28 >> 8;
  }
  v33 = v23 | v26 | (unsigned __int16)(v25 << 8) | (v24 << 16);
  v6 ^= -1578923117 * ((-1781923840 * v33) | ((951274213 * v33) >> 15));
  HIDWORD(v57) = v56;
  LOBYTE(v58) = v57;
  BYTE4(v58) = v22;
  v10 = v24;
  LOBYTE(v9) = v25;
  LOBYTE(v4) = v26;
  LOBYTE(v12) = v54;
  LODWORD(v32) = v55;
  LOBYTE(v23) = v52;
  LOBYTE(v11) = v53;
  LOBYTE(v14) = v51;
  LOBYTE(v13) = v27;
  LOBYTE(v22) = v28;
LABEL_50:
  v34 = v23 | (unsigned __int16)(v11 << 8) | (v12 << 16) | ((_DWORD)v32 << 24);
  v5 ^= 951274213 * ((-1752629248 * v34) | ((-1425107063 * v34) >> 16));
  v29 = v4;
  LOBYTE(v4) = v23;
LABEL_51:
  v35 = v8 | v22 | (unsigned __int16)(v13 << 8) | (v14 << 16);
  a3 ^= -1425107063 * ((-888307712 * v35) | ((597399067 * v35) >> 17));
  v30 = v4;
  LOBYTE(v4) = v22;
LABEL_52:
  switch(v3)
  {
    case 1:
      v36 = v4;
      goto LABEL_56;
    case 2:
      v36 = v4 | (v13 << 8);
      goto LABEL_56;
    case 3:
      v36 = v4 | (unsigned __int16)(v13 << 8) | (v14 << 16);
LABEL_56:
      a3 ^= -1425107063 * ((-888307712 * v36) | ((597399067 * v36) >> 17));
      break;
    case 5:
      v37 = v30;
      goto LABEL_60;
    case 6:
      v37 = v30 | (v11 << 8);
      goto LABEL_60;
    case 7:
      v37 = v30 | (unsigned __int16)(v11 << 8) | (v12 << 16);
LABEL_60:
      v5 ^= 951274213 * ((-1752629248 * v37) | ((-1425107063 * v37) >> 16));
      break;
    case 9:
      v38 = v29;
      goto LABEL_64;
    case 10:
      v38 = v29 | (v9 << 8);
      goto LABEL_64;
    case 11:
      v38 = v29 | (unsigned __int16)(v9 << 8) | (v10 << 16);
LABEL_64:
      v6 ^= -1578923117 * ((-1781923840 * v38) | ((951274213 * v38) >> 15));
      break;
    case 13:
      v39 = BYTE4(v58);
      goto LABEL_68;
    case 14:
      v39 = BYTE4(v58) | (v58 << 8);
      goto LABEL_68;
    case 15:
      v39 = BYTE4(v58) | (v58 << 8) | HIDWORD(v57);
LABEL_68:
      v7 ^= 597399067 * ((776732672 * v39) | ((-1578923117 * v39) >> 14));
      break;
    default:
      break;
  }
  v40 = v5 ^ a2;
  v41 = v40 + (a3 ^ a2) + (v6 ^ a2) + (v7 ^ a2);
  v42.i32[0] = v41;
  v42.i32[1] = v41 + v40;
  v42.i32[2] = v41 + (v6 ^ a2);
  v42.i32[3] = v41 + (v7 ^ a2);
  v43 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v42, 0x10uLL), (int8x16_t)v42), vdupq_n_s32(0x85EBCA6B));
  v44 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v43, 0xDuLL), v43), vdupq_n_s32(0xC2B2AE35));
  v45 = (int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v44, 0x10uLL), v44);
  v46 = vaddvq_s32(v45);
  v47 = v46 + v45.i32[2];
  v48 = vdup_n_s32(v46);
  v49.i64[0] = v48.u32[0];
  v49.i64[1] = v47;
  *(_QWORD *)&result = vorrq_s8((int8x16_t)vshll_n_s32(vadd_s32(v48, vzip2_s32(*(int32x2_t *)v45.i8, (int32x2_t)*(_OWORD *)&vextq_s8((int8x16_t)v45, (int8x16_t)v45, 8uLL))), 0x20uLL), v49).u64[0];
  return result;
}

uint64_t _PASMurmur3_x64_128_init(uint64_t result, unsigned int a2)
{
  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a2;
  *(_DWORD *)(result + 16) = 0;
  *(_BYTE *)(result + 35) = 0;
  return result;
}

uint64_t _PASMurmur3_x64_128_update(uint64_t result, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a3;
  v8 = result;
  v9 = *(unsigned __int8 *)(result + 35);
  v10 = (v9 + a3) & 0xF;
  if ((unint64_t)(v9 + a3) >= 0x10)
  {
    v12 = (v9 + a3) & 0xFFFFFFFFFFFFFFF0;
    LOBYTE(v13) = *(_BYTE *)(result + 35);
    switch((char)v13)
    {
      case 0:
        v13 = *(_QWORD *)a2;
        v4 = *((_QWORD *)a2 + 1);
        v3 = *(_QWORD *)a2 >> 8;
        v5 = *(_QWORD *)a2 >> 16;
        goto LABEL_23;
      case 1:
        LOBYTE(v13) = *(_BYTE *)(result + 20);
        LOBYTE(v3) = *a2;
        LOWORD(v5) = *(_WORD *)(a2 + 1);
        v6 = *(unsigned int *)(a2 + 3);
        v4 = *(_QWORD *)(a2 + 7);
        break;
      case 2:
        LODWORD(v13) = *(unsigned __int16 *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LOWORD(v5) = *(_WORD *)a2;
        v6 = *(unsigned int *)(a2 + 2);
        v4 = *(_QWORD *)(a2 + 6);
        break;
      case 3:
        LODWORD(v13) = *(unsigned __int16 *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LOWORD(v5) = *(unsigned __int8 *)(result + 22) | (*a2 << 8);
        v6 = *(unsigned int *)(a2 + 1);
        v4 = *(_QWORD *)(a2 + 5);
        break;
      case 4:
        LODWORD(v13) = *(_DWORD *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        v6 = *(unsigned int *)a2;
        v4 = *(_QWORD *)(a2 + 4);
        break;
      case 5:
        LODWORD(v13) = *(_DWORD *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        v6 = (*(unsigned __int16 *)a2 << 8) | (a2[2] << 24) | *(unsigned __int8 *)(result + 24);
        v4 = *(_QWORD *)(a2 + 3);
        break;
      case 6:
        LODWORD(v13) = *(_DWORD *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        v6 = *(unsigned __int16 *)(result + 24) | (*(unsigned __int16 *)a2 << 16);
        v4 = *(_QWORD *)(a2 + 2);
        break;
      case 7:
        LODWORD(v13) = *(_DWORD *)(result + 20);
        LODWORD(v3) = v13 >> 8;
        LODWORD(v5) = WORD1(v13);
        v6 = *(unsigned __int16 *)(result + 24) | (*(unsigned __int8 *)(result + 26) << 16) | (*a2 << 24);
        v4 = *(_QWORD *)(a2 + 1);
        break;
      case 8:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v4 = *(_QWORD *)a2;
        break;
      case 9:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v14 = ((unint64_t)*(unsigned int *)a2 << 8) | ((unint64_t)(*((unsigned __int16 *)a2 + 2) | (a2[6] << 16)) << 40);
        v15 = *(unsigned __int8 *)(result + 28);
        goto LABEL_17;
      case 10:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v6 = HIDWORD(v13);
        v14 = ((unint64_t)*(unsigned int *)a2 << 16) | ((unint64_t)*((unsigned __int16 *)a2 + 2) << 48);
        v15 = *(unsigned __int16 *)(result + 28);
LABEL_17:
        v4 = v14 | v15;
        break;
      case 11:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = ((unint64_t)*(unsigned int *)a2 << 24) | ((unint64_t)a2[4] << 56) | *(unsigned __int16 *)(result + 28) | ((unint64_t)*(unsigned __int8 *)(result + 30) << 16);
        v6 = HIDWORD(v13);
        break;
      case 12:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned int *)a2 << 32);
        goto LABEL_23;
      case 13:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned __int8 *)(result + 32) << 32) | ((unint64_t)(*(unsigned __int16 *)a2 | (a2[2] << 16)) << 40);
        goto LABEL_23;
      case 14:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = *(unsigned int *)(result + 28) | ((unint64_t)*(unsigned __int16 *)(result + 32) << 32) | ((unint64_t)*(unsigned __int16 *)a2 << 48);
        goto LABEL_23;
      case 15:
        v13 = *(_QWORD *)(result + 20);
        v3 = v13 >> 8;
        v5 = v13 >> 16;
        v4 = *(unsigned int *)(result + 28) | ((unint64_t)(*(unsigned __int16 *)(result + 32) | (*(unsigned __int8 *)(result + 34) << 16)) << 32) | ((unint64_t)*a2 << 56);
LABEL_23:
        v6 = HIDWORD(v13);
        break;
      default:
        break;
    }
    result = 0x4CF5AD432745937FLL;
    v16 = v13 | (unint64_t)(unsigned __int16)(v3 << 8) | ((unint64_t)(unsigned __int16)v5 << 16) | (v6 << 32);
    v17 = *(_QWORD *)(v8 + 8);
    v18 = 5
        * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v16) | ((0x87C37B91114253D5 * v16) >> 33))) ^ *(_QWORD *)v8, 37)+ v17)+ 1390208809;
    v19 = 5
        * (v18
         + __ROR8__((0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v4) | ((0x4CF5AD432745937FLL * v4) >> 31))) ^ v17, 33))+ 944331445;
    *(_QWORD *)v8 = v18;
    *(_QWORD *)(v8 + 8) = v19;
    v20 = &a2[-v9 + 16];
    v21 = v12 - 16;
    v22 = &v20[v21];
    if (v21 >= 1)
    {
      do
      {
        v23 = *(_QWORD *)v20;
        v24 = *((_QWORD *)v20 + 1);
        v20 += 16;
        v18 = 5
            * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v23) | ((0x87C37B91114253D5 * v23) >> 33))) ^ v18, 37)+ v19)+ 1390208809;
        v19 = 5
            * (v18
             + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v24) | ((unint64_t)(0x4CF5AD432745937FLL * v24) >> 31))) ^ v19, 33))+ 944331445;
        *(_QWORD *)v8 = v18;
        *(_QWORD *)(v8 + 8) = v19;
      }
      while (v20 < v22);
    }
    if (v10 - 1 <= 0xE)
      result = (uint64_t)memcpy((void *)(v8 + 20), v22, v10);
  }
  else
  {
    v11 = v10 - v9;
    if ((v11 - 1) <= 0xEu)
    {
      result = (uint64_t)memcpy((void *)(result + v9 + 20), a2, (v11 - 1) + 1);
      LOBYTE(v9) = *(_BYTE *)(v8 + 35);
    }
    LOBYTE(v10) = v9 + v11;
  }
  *(_BYTE *)(v8 + 35) = v10;
  *(_DWORD *)(v8 + 16) += v7;
  return result;
}

unint64_t _PASMurmur3_x64_128_final(uint64_t a1)
{
  int v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v1 = *(unsigned __int8 *)(a1 + 35);
  if ((v1 & 0xF8) == 8)
    *(_QWORD *)a1 ^= 0x4CF5AD432745937FLL
                   * ((0x88A129EA80000000 * *(_QWORD *)(a1 + 20)) | ((0x87C37B91114253D5 * *(_QWORD *)(a1 + 20)) >> 33));
  switch(v1)
  {
    case 1:
      v2 = *(unsigned __int8 *)(a1 + 20);
      goto LABEL_12;
    case 2:
      v2 = *(unsigned __int16 *)(a1 + 20);
      goto LABEL_12;
    case 3:
      v2 = *(unsigned __int16 *)(a1 + 20) | ((unint64_t)*(unsigned __int8 *)(a1 + 22) << 16);
      goto LABEL_12;
    case 4:
      v2 = *(unsigned int *)(a1 + 20);
      goto LABEL_12;
    case 5:
      v3 = *(unsigned __int8 *)(a1 + 24);
      goto LABEL_11;
    case 6:
      v3 = *(unsigned __int16 *)(a1 + 24);
      goto LABEL_11;
    case 7:
      v3 = *(unsigned __int16 *)(a1 + 24) | (*(unsigned __int8 *)(a1 + 26) << 16);
LABEL_11:
      v2 = *(unsigned int *)(a1 + 20) | (unint64_t)(v3 << 32);
LABEL_12:
      v4 = 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v2) | ((0x87C37B91114253D5 * v2) >> 33));
      v5 = (_QWORD *)a1;
      goto LABEL_22;
    case 9:
      v6 = *(unsigned __int8 *)(a1 + 28);
      goto LABEL_21;
    case 10:
      v6 = *(unsigned __int16 *)(a1 + 28);
      goto LABEL_21;
    case 11:
      v6 = *(unsigned __int16 *)(a1 + 28) | ((unint64_t)*(unsigned __int8 *)(a1 + 30) << 16);
      goto LABEL_21;
    case 12:
      v6 = *(unsigned int *)(a1 + 28);
      goto LABEL_21;
    case 13:
      v7 = *(unsigned __int8 *)(a1 + 32);
      goto LABEL_20;
    case 14:
      v7 = *(unsigned __int16 *)(a1 + 32);
      goto LABEL_20;
    case 15:
      v7 = *(unsigned __int16 *)(a1 + 32) | (*(unsigned __int8 *)(a1 + 34) << 16);
LABEL_20:
      v6 = *(unsigned int *)(a1 + 28) | (unint64_t)(v7 << 32);
LABEL_21:
      v4 = 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v6) | ((0x4CF5AD432745937FLL * v6) >> 31));
      v5 = (_QWORD *)(a1 + 8);
LABEL_22:
      *v5 ^= v4;
      break;
    default:
      break;
  }
  v8 = *(unsigned int *)(a1 + 16);
  v9 = *(_QWORD *)a1 ^ v8;
  v10 = *(_QWORD *)(a1 + 8) ^ v8;
  v11 = v10 + v9;
  v12 = v11 + v10;
  v13 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v11 ^ (v11 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v11 ^ (v11 >> 33))) >> 33));
  v14 = v13 ^ (v13 >> 33);
  v15 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v12 ^ (v12 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v12 ^ (v12 >> 33))) >> 33));
  v16 = v15 ^ (v15 >> 33);
  *(_QWORD *)a1 = v16 + v14;
  *(_QWORD *)(a1 + 8) = v16 + v14 + v16;
  return v16 + v14;
}

unsigned __int16 *_PAS_MurmurHash3_x86_32(unsigned __int16 *result, signed int a2, int a3, unsigned int *a4)
{
  uint64_t v4;
  unint64_t v5;
  unsigned __int16 *v6;
  unsigned __int16 *v7;
  int v8;
  unint64_t v9;
  int v10;
  unsigned int v11;

  v4 = a2 & 3;
  if (a2 < 4)
  {
    if (v4 != 1)
    {
      if (v4 != 2)
      {
        if (v4 != 3)
          goto LABEL_19;
        goto LABEL_13;
      }
      v6 = result;
LABEL_17:
      v10 = *v6;
      goto LABEL_18;
    }
    v6 = result;
LABEL_15:
    v10 = *(unsigned __int8 *)v6;
    goto LABEL_18;
  }
  HIDWORD(v5) = (461845907 * ((380141568 * *(_DWORD *)result) | ((-862048943 * *(_DWORD *)result) >> 17))) ^ a3;
  LODWORD(v5) = HIDWORD(v5);
  a3 = 5 * (v5 >> 19) - 430675100;
  v6 = (unsigned __int16 *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFCLL));
  if ((uint64_t)(a2 & 0xFFFFFFFFFFFFFFFCLL) >= 5)
  {
    v7 = result + 2;
    do
    {
      v8 = *(_DWORD *)v7;
      v7 += 2;
      HIDWORD(v9) = (461845907 * ((380141568 * v8) | ((-862048943 * v8) >> 17))) ^ a3;
      LODWORD(v9) = HIDWORD(v9);
      a3 = 5 * (v9 >> 19) - 430675100;
    }
    while (v7 < v6);
  }
  if (v4 == 1)
    goto LABEL_15;
  if (v4 == 2)
    goto LABEL_17;
  if (v4 != 3)
    goto LABEL_19;
  result = (unsigned __int16 *)((char *)result + (a2 & 0xFFFFFFFFFFFFFFFCLL));
LABEL_13:
  v10 = *result | (*((unsigned __int8 *)result + 2) << 16);
LABEL_18:
  a3 ^= 461845907 * ((380141568 * v10) | ((-862048943 * v10) >> 17));
LABEL_19:
  v11 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  *a4 = (-1028477387 * (v11 ^ (v11 >> 13))) ^ ((-1028477387 * (v11 ^ (v11 >> 13))) >> 16);
  return result;
}

int8x16_t _PAS_MurmurHash3_x86_128(int32x2_t *a1, unsigned int a2, unsigned int a3, int8x16_t *a4)
{
  uint64_t v4;
  unsigned int v5;
  unint64_t v6;
  int32x2_t *v7;
  unsigned int v8;
  unsigned __int32 v9;
  int8x8_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  int32x2_t v16;
  uint32x2_t v17;
  int32x2_t v18;
  uint32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int32x2_t *v22;
  int32x2_t v23;
  int32x2_t v24;
  uint32x2_t v25;
  uint32x2_t v26;
  int32x2_t v27;
  unsigned int v28;
  unsigned int v29;
  int v30;
  int32x2_t v31;
  unint64_t v32;
  int32x2_t *v33;
  __int32 v34;
  unsigned __int32 v35;
  __int32 v36;
  __int32 v37;
  unint64_t v38;
  uint64_t v39;
  unsigned int v40;
  unsigned __int8 v41;
  unint64_t v42;
  int32x2_t v43;
  unsigned __int16 v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint32x4_t v53;
  int8x16_t v54;
  int8x16_t v55;
  int8x16_t v56;
  int8x16_t result;
  int8x16_t v58;
  __int32 v59;
  int8x16_t v60;

  v4 = a2 & 0xFLL;
  if (a2 < 0x10)
  {
    LOBYTE(v5) = 0;
    v6 = (unint64_t)vdup_n_s32(a3);
    v7 = a1;
    LOBYTE(v8) = 0;
    LOBYTE(v9) = 0;
    v10 = (int8x8_t)v6;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    switch(v4)
    {
      case 1:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LOBYTE(v5) = a1->i8[0];
        goto LABEL_12;
      case 2:
        LOBYTE(v14) = 0;
        v5 = a1->u16[0];
        LODWORD(v13) = v5 >> 8;
        goto LABEL_12;
      case 3:
        v5 = a1->u16[0] | (a1->u8[2] << 16);
        LODWORD(v13) = v5 >> 8;
        LOBYTE(v14) = a1->i8[2];
        goto LABEL_12;
      case 4:
        goto LABEL_37;
      case 5:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v5) = a1->i8[4];
        goto LABEL_16;
      case 6:
        LOBYTE(v12) = 0;
        v5 = a1->u16[2];
        LODWORD(v11) = v5 >> 8;
        goto LABEL_16;
      case 7:
        v5 = a1->u16[2] | (a1->u8[6] << 16);
        LODWORD(v11) = v5 >> 8;
        LOBYTE(v12) = a1->i8[6];
LABEL_16:
        v7 = a1;
        v10 = (int8x8_t)v6;
        goto LABEL_37;
      case 8:
        goto LABEL_41;
      case 9:
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v5) = a1[1].i8[0];
        goto LABEL_20;
      case 10:
        LOBYTE(v9) = 0;
        v5 = a1[1].u16[0];
        v8 = v5 >> 8;
        goto LABEL_20;
      case 11:
        v5 = a1[1].u16[0] | (a1[1].u8[2] << 16);
        v8 = v5 >> 8;
        LOBYTE(v9) = a1[1].i8[2];
LABEL_20:
        v7 = a1;
        v10 = (int8x8_t)v6;
        goto LABEL_41;
      case 12:
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        v30 = 0;
        v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        v33 = a1 + 1;
        goto LABEL_25;
      case 13:
        LOBYTE(v29) = 0;
        v30 = 0;
        v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        v33 = a1 + 1;
        LOBYTE(v28) = a1[1].i8[4];
        goto LABEL_25;
      case 14:
        v30 = 0;
        v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        v33 = a1 + 1;
        v28 = a1[1].u16[2];
        v29 = v28 >> 8;
        goto LABEL_25;
      case 15:
        v31 = *a1;
        LODWORD(v32) = HIBYTE(a1->u32[0]);
        v33 = a1 + 1;
        v28 = a1[1].u16[2] | (a1[1].u8[6] << 16);
        v29 = v28 >> 8;
        v30 = a1[1].u8[6];
LABEL_25:
        v21 = (int32x2_t)v6;
        goto LABEL_47;
      default:
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
LABEL_12:
        v18 = (int32x2_t)v6;
        v21 = (int32x2_t)v6;
        goto LABEL_33;
    }
  }
  v15 = (int)a2 & 0xFFFFFFFFFFFFFFF0;
  v16 = vdup_n_s32(a3);
  v17 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(*a1, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(*a1, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789), (int8x8_t)v16);
  v18 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v17, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v17, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), v16), (int32x2_t)0x500000005);
  v19 = (uint32x2_t)veor_s8((int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(a1[1], (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(a1[1], (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93), (int8x8_t)v16);
  v20 = vdup_lane_s32(v18, 0);
  v20.i32[0] = a3;
  v21 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32(v20, (int32x2_t)vorr_s8((int8x8_t)vshl_u32(v19, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v19, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL))), (int32x2_t)0x500000005);
  v7 = (int32x2_t *)((char *)a1 + v15);
  if (v15 >= 17)
  {
    v22 = a1 + 2;
    do
    {
      v23 = *v22;
      v24 = v22[1];
      v22 += 2;
      v25 = (uint32x2_t)veor_s8((int8x8_t)v18, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v23, (int32x2_t)0xAB0E9789239B961BLL), (uint32x2_t)0xFFFFFFF0FFFFFFEFLL), (int8x8_t)vmul_s32(v23, (int32x2_t)0x97890000CB0D8000)), (int32x2_t)0x38B34AE5AB0E9789));
      v18 = vmla_s32((int32x2_t)0xBCAA747561CCD1BLL, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v25, (uint32x2_t)0x1100000013), (int8x8_t)vshl_u32(v25, (uint32x2_t)0xFFFFFFF1FFFFFFF3)), vzip1_s32(vdup_lane_s32(v18, 1), v21)), (int32x2_t)0x500000005);
      v26 = (uint32x2_t)veor_s8((int8x8_t)v21, (int8x8_t)vmul_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32((uint32x2_t)vmul_s32(v24, (int32x2_t)0xA1E38B9338B34AE5), (uint32x2_t)0xFFFFFFF2FFFFFFF1), (int8x8_t)vmul_s32(v24, (int32x2_t)0x2E4C000095CA0000)), (int32x2_t)0x239B961BA1E38B93));
      v27 = vdup_lane_s32(v18, 0);
      v27.i32[0] = v21.i32[1];
      v21 = vmla_s32((int32x2_t)0x32AC3B1796CD1C35, vadd_s32((int32x2_t)vorr_s8((int8x8_t)vshl_u32(v26, (uint32x2_t)0xD0000000FLL), (int8x8_t)vshl_u32(v26, (uint32x2_t)0xFFFFFFEDFFFFFFEFLL)), v27), (int32x2_t)0x500000005);
    }
    while (v22 < v7);
  }
  v6 = __PAIR64__(v21.u32[1], v18.u32[0]);
  LOBYTE(v5) = 0;
  LOBYTE(v8) = 0;
  LOBYTE(v9) = 0;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  v10 = vext_s8((int8x8_t)v18, (int8x8_t)v21, 4uLL);
  switch(v4)
  {
    case 1:
      LOBYTE(v13) = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v5) = v7->i8[0];
      goto LABEL_33;
    case 2:
      LOBYTE(v14) = 0;
      v5 = v7->u16[0];
      LODWORD(v13) = v5 >> 8;
      goto LABEL_33;
    case 3:
      v5 = v7->u16[0] | (v7->u8[2] << 16);
      LODWORD(v13) = v5 >> 8;
      LOBYTE(v14) = v7->i8[2];
LABEL_33:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      v30 = 0;
      v36 = v18.i32[1];
      v37 = v18.i32[0];
      v35 = v21.i32[0];
      v34 = v21.i32[1];
      v31.i8[0] = v5;
      LOBYTE(v5) = 0;
      goto LABEL_51;
    case 4:
      goto LABEL_37;
    case 5:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v5) = v7->i8[4];
      goto LABEL_37;
    case 6:
      LOBYTE(v12) = 0;
      v5 = v7->u16[2];
      LODWORD(v11) = v5 >> 8;
      goto LABEL_37;
    case 7:
      v5 = v7->u16[2] | (v7->u8[6] << 16);
      LODWORD(v11) = v5 >> 8;
      LOBYTE(v12) = v7->i8[6];
LABEL_37:
      v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      v30 = 0;
      v31.i32[0] = v7->i32[0];
      LODWORD(v14) = HIWORD(v7->i32[0]);
      LODWORD(v13) = (unsigned __int32)v7->i32[0] >> 8;
      LODWORD(v32) = HIBYTE(v7->i32[0]);
      v36 = v10.i32[0];
      v35 = v10.u32[1];
      goto LABEL_50;
    case 8:
      goto LABEL_41;
    case 9:
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v5) = v7[1].i8[0];
      goto LABEL_41;
    case 10:
      LOBYTE(v9) = 0;
      v5 = v7[1].u16[0];
      v8 = v5 >> 8;
      goto LABEL_41;
    case 11:
      v5 = v7[1].u16[0] | (v7[1].u8[2] << 16);
      v8 = v5 >> 8;
      LOBYTE(v9) = v7[1].i8[2];
LABEL_41:
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      v30 = 0;
      v31 = *v7;
      v12 = HIWORD(*(unint64_t *)v7);
      v38 = HIDWORD(*(unint64_t *)v7);
      v11 = *(unint64_t *)v7 >> 40;
      v14 = *(unint64_t *)v7 >> 16;
      v13 = *(unint64_t *)v7 >> 8;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      v42 = HIBYTE(*(unint64_t *)v7);
      v36 = v10.i32[0];
      v35 = v10.u32[1];
      goto LABEL_49;
    case 12:
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      v30 = 0;
      v43 = *v7;
      v33 = v7 + 1;
      v31 = v43;
      LODWORD(v32) = v43.u8[3];
      goto LABEL_46;
    case 13:
      LOBYTE(v29) = 0;
      v30 = 0;
      v31 = *v7;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      LOBYTE(v28) = v7[1].i8[4];
      v33 = v7 + 1;
      goto LABEL_46;
    case 14:
      v30 = 0;
      v31 = *v7;
      LODWORD(v32) = HIBYTE(v7->u32[0]);
      v28 = v7[1].u16[2];
      v33 = v7 + 1;
      v29 = v28 >> 8;
      goto LABEL_46;
    case 15:
      v31 = *v7;
      v32 = *(unint64_t *)v7 >> 24;
      v44 = v7[1].u8[6];
      v45 = v7[1].u16[2];
      v33 = v7 + 1;
      v28 = v45 & 0xFF00FFFF | (v44 << 16);
      v29 = v28 >> 8;
      v30 = v44;
LABEL_46:
      v21.i32[1] = v18.i32[1];
LABEL_47:
      v5 = v33->i32[0];
      v9 = HIWORD(v33->i32[0]);
      v8 = (unsigned __int32)v33->i32[0] >> 8;
      v39 = HIBYTE(*(_QWORD *)&v31);
      v38 = HIDWORD(*(_QWORD *)&v31);
      v12 = HIWORD(*(_QWORD *)&v31);
      v11 = *(_QWORD *)&v31 >> 40;
      v14 = *(_QWORD *)&v31 >> 16;
      v13 = *(_QWORD *)&v31 >> 8;
      v40 = v33->i32[0] & 0xFF000000;
      goto LABEL_48;
    default:
      v31.i8[0] = 0;
      v34 = v21.i32[1];
      v35 = v21.i32[0];
      v36 = v18.i32[1];
      v37 = v18.i32[0];
      if (((1 << v4) & 0xF0) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        v41 = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        v30 = 0;
        goto LABEL_50;
      }
      if (((1 << v4) & 0xF00) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v38) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LODWORD(v42) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        v30 = 0;
LABEL_49:
        v41 = v5;
        v5 = v38 | (unsigned __int16)(v11 << 8) | (v12 << 16) | ((_DWORD)v42 << 24);
        v36 ^= 951274213 * ((-1752629248 * v5) | ((-1425107063 * v5) >> 16));
        LOBYTE(v5) = v38;
LABEL_50:
        v47 = v31.u8[0] | (unsigned __int16)(v13 << 8) | (v14 << 16) | ((_DWORD)v32 << 24);
        v37 = (-1425107063 * ((-888307712 * v47) | ((597399067 * v47) >> 17))) ^ v6;
        v34 = HIDWORD(v6);
        goto LABEL_51;
      }
      if (((1 << v4) & 0xF000) != 0)
      {
        LOBYTE(v13) = 0;
        LOBYTE(v14) = 0;
        LODWORD(v32) = 0;
        LOBYTE(v38) = 0;
        v21.i32[1] = v18.i32[1];
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LODWORD(v39) = 0;
        LOBYTE(v5) = 0;
        LOBYTE(v8) = 0;
        LOBYTE(v9) = 0;
        v40 = 0;
        LOBYTE(v28) = 0;
        LOBYTE(v29) = 0;
        v30 = 0;
LABEL_48:
        v46 = v40 | v5 | (unsigned __int16)(v8 << 8) | (v9 << 16);
        v35 = (-1578923117 * ((-1781923840 * v46) | ((951274213 * v46) >> 15))) ^ v21.i32[0];
        v36 = v21.i32[1];
        LODWORD(v42) = v39;
        goto LABEL_49;
      }
      LOBYTE(v13) = 0;
      LOBYTE(v14) = 0;
      LOBYTE(v5) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      v41 = 0;
      LOBYTE(v8) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v29) = 0;
      v30 = 0;
LABEL_51:
      switch((int)v4)
      {
        case 1:
          v48 = v31.u8[0];
          goto LABEL_55;
        case 2:
          v48 = v31.u8[0] | (v13 << 8);
          goto LABEL_55;
        case 3:
          v48 = v31.u8[0] | (unsigned __int16)(v13 << 8) | (v14 << 16);
LABEL_55:
          v37 ^= -1425107063 * ((-888307712 * v48) | ((597399067 * v48) >> 17));
          break;
        case 5:
          v49 = v5;
          goto LABEL_59;
        case 6:
          v49 = v5 | (v11 << 8);
          goto LABEL_59;
        case 7:
          v49 = v5 | (unsigned __int16)(v11 << 8) | (v12 << 16);
LABEL_59:
          v36 ^= 951274213 * ((-1752629248 * v49) | ((-1425107063 * v49) >> 16));
          break;
        case 9:
          v50 = v41;
          goto LABEL_63;
        case 10:
          v50 = v41 | (v8 << 8);
          goto LABEL_63;
        case 11:
          v50 = v41 | (unsigned __int16)(v8 << 8) | (v9 << 16);
LABEL_63:
          v35 ^= -1578923117 * ((-1781923840 * v50) | ((951274213 * v50) >> 15));
          break;
        case 13:
          v51 = v28;
          goto LABEL_67;
        case 14:
          v51 = v28 | (v29 << 8);
          goto LABEL_67;
        case 15:
          v51 = v28 | (v29 << 8) | (v30 << 16);
LABEL_67:
          v34 ^= 597399067 * ((776732672 * v51) | ((-1578923117 * v51) >> 14));
          break;
        default:
          break;
      }
      v52 = (v36 ^ a2) + (v37 ^ a2) + (v35 ^ a2) + (v34 ^ a2);
      v53.i32[0] = v52;
      v53.i32[1] = v52 + (v36 ^ a2);
      v53.i32[2] = v52 + (v35 ^ a2);
      v53.i32[3] = v52 + (v34 ^ a2);
      v54 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32(v53, 0x10uLL), (int8x16_t)v53), vdupq_n_s32(0x85EBCA6B));
      v55 = (int8x16_t)vmulq_s32((int32x4_t)veorq_s8((int8x16_t)vshrq_n_u32((uint32x4_t)v54, 0xDuLL), v54), vdupq_n_s32(0xC2B2AE35));
      v56 = (int8x16_t)vshrq_n_u32((uint32x4_t)v55, 0x10uLL);
      result = veorq_s8(v56, v55);
      v56.i32[0] = vaddvq_s32((int32x4_t)result);
      v58 = vextq_s8(v56, v56, 4uLL);
      v59 = v56.i32[0];
      *(int32x2_t *)v56.i8 = vadd_s32(vdup_n_s32(v56.u32[0]), (int32x2_t)*(_OWORD *)&vextq_s8(result, result, 4uLL));
      v60 = vextq_s8(v58, v56, 0xCuLL);
      v60.i32[3] = v59 + result.i32[3];
      *a4 = v60;
      return result;
  }
}

uint64_t _PAS_MurmurHash3_x64_128(uint64_t *a1, uint64_t a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unsigned int v49;
  unint64_t v50;
  uint64_t result;
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unsigned __int8 v65;
  int v66;
  uint64_t v67;
  unint64_t v68;
  unsigned int v71;

  v4 = a3;
  v5 = a2 & 0xF;
  v71 = a2 & 0xF;
  if (a2 < 0x10)
  {
    LOBYTE(v6) = 0;
    v7 = 0;
    v8 = a1;
    LOBYTE(v9) = 0;
    LOBYTE(v10) = 0;
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    LOBYTE(v13) = 0;
    v14 = v4;
    switch(v5)
    {
      case 1:
        LOBYTE(v15) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        v65 = 0;
        LOBYTE(v66) = 0;
        LOBYTE(v6) = *(_BYTE *)a1;
        goto LABEL_16;
      case 2:
        LOBYTE(v16) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        v65 = 0;
        LOBYTE(v66) = 0;
        LODWORD(v6) = *(unsigned __int16 *)a1;
        LODWORD(v15) = v6 >> 8;
        goto LABEL_16;
      case 3:
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        v65 = 0;
        LOBYTE(v66) = 0;
        LODWORD(v6) = *(unsigned __int16 *)a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        LODWORD(v15) = v6 >> 8;
        LOBYTE(v16) = *((_BYTE *)a1 + 2);
        goto LABEL_16;
      case 4:
        LOBYTE(v66) = 0;
        LOBYTE(v67) = 0;
        v65 = 0;
        LODWORD(v6) = *(_DWORD *)a1;
        LODWORD(v15) = *(_DWORD *)a1 >> 8;
        LODWORD(v16) = HIWORD(*(_DWORD *)a1);
        LODWORD(v68) = HIBYTE(*(_DWORD *)a1);
        goto LABEL_16;
      case 5:
        v65 = 0;
        LOBYTE(v66) = 0;
        v6 = *(unsigned int *)a1;
        v23 = v6 | ((unint64_t)*((unsigned __int8 *)a1 + 4) << 32);
        v15 = v23 >> 8;
        v16 = v23 >> 16;
        LOBYTE(v67) = *((_BYTE *)a1 + 4);
        v68 = v23 >> 24;
        goto LABEL_16;
      case 6:
        v6 = *(unsigned int *)a1;
        v24 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)a1 + 2) << 32);
        v15 = v24 >> 8;
        v16 = v24 >> 16;
        LOWORD(v67) = *((_WORD *)a1 + 2);
        v68 = v24 >> 24;
        v65 = 0;
        v66 = BYTE1(v67);
        goto LABEL_16;
      case 7:
        v25 = *((unsigned __int16 *)a1 + 2) | (*((unsigned __int8 *)a1 + 6) << 16);
        v6 = *(unsigned int *)a1;
        v26 = v6 & 0xFF000000FFFFFFFFLL | ((*(_QWORD *)&v25 & 0xFFFFFFLL) << 32);
        v15 = v26 >> 8;
        v16 = v26 >> 16;
        LOWORD(v67) = *((_WORD *)a1 + 2);
        v68 = v26 >> 24;
        v65 = *((_BYTE *)a1 + 6);
        v66 = v25 >> 8;
        goto LABEL_16;
      case 8:
        goto LABEL_27;
      case 9:
        LOBYTE(v9) = 0;
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v7 = 0;
        LOBYTE(v6) = *((_BYTE *)a1 + 8);
        goto LABEL_21;
      case 10:
        LOBYTE(v10) = 0;
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v7 = 0;
        LODWORD(v6) = *((unsigned __int16 *)a1 + 4);
        LODWORD(v9) = v6 >> 8;
        goto LABEL_21;
      case 11:
        LOBYTE(v11) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v7 = 0;
        LODWORD(v6) = *((unsigned __int16 *)a1 + 4) | (*((unsigned __int8 *)a1 + 10) << 16);
        LODWORD(v9) = v6 >> 8;
        LOBYTE(v10) = *((_BYTE *)a1 + 10);
        goto LABEL_21;
      case 12:
        LOBYTE(v12) = 0;
        LOBYTE(v13) = 0;
        v7 = 0;
        LODWORD(v6) = *((_DWORD *)a1 + 2);
        LODWORD(v9) = v6 >> 8;
        LODWORD(v10) = WORD1(v6);
        LODWORD(v11) = BYTE3(v6);
LABEL_21:
        v8 = a1;
        goto LABEL_26;
      case 13:
        LOBYTE(v13) = 0;
        v7 = 0;
        v12 = *((unsigned __int8 *)a1 + 12);
        v6 = *((unsigned int *)a1 + 2);
        v27 = v6 | (v12 << 32);
        v9 = v27 >> 8;
        v11 = v27 >> 24;
        v8 = a1;
        v10 = v27 >> 16;
        goto LABEL_26;
      case 14:
        v7 = 0;
        v6 = *((unsigned int *)a1 + 2);
        LODWORD(v12) = *((unsigned __int16 *)a1 + 6);
        v28 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)a1 + 6) << 32);
        v9 = v28 >> 8;
        v29 = v28 >> 16;
        v11 = v28 >> 24;
        v13 = v12 >> 8;
        goto LABEL_25;
      case 15:
        LODWORD(v12) = *((unsigned __int16 *)a1 + 6) | (*((unsigned __int8 *)a1 + 14) << 16);
        v6 = *((unsigned int *)a1 + 2);
        v30 = v6 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
        v9 = v30 >> 8;
        v29 = v30 >> 16;
        v11 = v30 >> 24;
        v13 = v12 >> 8;
        v7 = *((unsigned __int8 *)a1 + 14);
LABEL_25:
        v8 = a1;
        LOBYTE(v10) = v29;
LABEL_26:
        v14 = v4;
        goto LABEL_27;
      default:
        LOBYTE(v15) = 0;
        LOBYTE(v16) = 0;
        LOBYTE(v67) = 0;
        LOBYTE(v68) = 0;
        v65 = 0;
        LOBYTE(v66) = 0;
LABEL_16:
        v14 = v4;
        goto LABEL_38;
    }
  }
  v17 = (int)a2 & 0xFFFFFFFFFFFFFFF0;
  *((_QWORD *)&v18 + 1) = (0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *a1) | ((0x87C37B91114253D5 * *a1) >> 33))) ^ a3;
  *(_QWORD *)&v18 = 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *a1) | ((0x87C37B91114253D5 * *a1) >> 33));
  v19 = 5 * ((v18 >> 37) + a3);
  *((_QWORD *)&v18 + 1) = (0x87C37B91114253D5
                         * ((0x4E8B26FE00000000 * a1[1]) | ((unint64_t)(0x4CF5AD432745937FLL * a1[1]) >> 31))) ^ a3;
  *(_QWORD *)&v18 = 0x87C37B91114253D5
                  * ((0x4E8B26FE00000000 * a1[1]) | ((unint64_t)(0x4CF5AD432745937FLL * a1[1]) >> 31));
  v14 = v19 + 1390208809;
  v4 = 5 * (v14 + (v18 >> 33)) + 944331445;
  v8 = (uint64_t *)((char *)a1 + v17);
  if (v17 >= 17)
  {
    v20 = a1 + 2;
    do
    {
      v22 = *v20;
      v21 = v20[1];
      v20 += 2;
      v14 = 5
          * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v22) | ((0x87C37B91114253D5 * v22) >> 33))) ^ v14, 37)+ v4)+ 1390208809;
      v4 = 5
         * (v14
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * v21) | ((unint64_t)(0x4CF5AD432745937FLL * v21) >> 31))) ^ v4, 33))+ 944331445;
    }
    while (v20 < v8);
  }
  LOBYTE(v6) = 0;
  LOBYTE(v9) = 0;
  LOBYTE(v10) = 0;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  LOBYTE(v13) = 0;
  v7 = 0;
  switch(v5)
  {
    case 1:
      LOBYTE(v15) = 0;
      LOBYTE(v16) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      v65 = 0;
      LOBYTE(v66) = 0;
      LOBYTE(v6) = *(_BYTE *)v8;
      goto LABEL_38;
    case 2:
      LOBYTE(v16) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      v65 = 0;
      LOBYTE(v66) = 0;
      LODWORD(v6) = *(unsigned __int16 *)v8;
      LODWORD(v15) = v6 >> 8;
      goto LABEL_38;
    case 3:
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      v65 = 0;
      LOBYTE(v66) = 0;
      LODWORD(v6) = *(unsigned __int16 *)v8 | (*((unsigned __int8 *)v8 + 2) << 16);
      LODWORD(v15) = v6 >> 8;
      LOBYTE(v16) = *((_BYTE *)v8 + 2);
      goto LABEL_38;
    case 4:
      LOBYTE(v66) = 0;
      LOBYTE(v67) = 0;
      v65 = 0;
      LODWORD(v6) = *(_DWORD *)v8;
      LODWORD(v15) = *(_DWORD *)v8 >> 8;
      LODWORD(v16) = HIWORD(*(_DWORD *)v8);
      LODWORD(v46) = HIBYTE(*(_DWORD *)v8);
      goto LABEL_35;
    case 5:
      v65 = 0;
      LOBYTE(v66) = 0;
      v6 = *(unsigned int *)v8;
      v67 = *((unsigned __int8 *)v8 + 4);
      v47 = v6 | (v67 << 32);
      v15 = v47 >> 8;
      v16 = v47 >> 16;
      v46 = v47 >> 24;
LABEL_35:
      LOBYTE(v68) = v46;
      goto LABEL_38;
    case 6:
      v6 = *(unsigned int *)v8;
      v48 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 2) << 32);
      v15 = v48 >> 8;
      v16 = v48 >> 16;
      v65 = 0;
      v66 = HIBYTE(*((unsigned __int16 *)v8 + 2));
      LOWORD(v67) = *((_WORD *)v8 + 2);
      v68 = v48 >> 24;
      goto LABEL_38;
    case 7:
      v49 = *((unsigned __int16 *)v8 + 2) | (*((unsigned __int8 *)v8 + 6) << 16);
      v6 = *(unsigned int *)v8;
      v50 = v6 & 0xFF000000FFFFFFFFLL | ((*(_QWORD *)&v49 & 0xFFFFFFLL) << 32);
      v15 = v50 >> 8;
      v16 = v50 >> 16;
      LOWORD(v67) = *((_WORD *)v8 + 2);
      v68 = v50 >> 24;
      v65 = *((_BYTE *)v8 + 6);
      v66 = v49 >> 8;
LABEL_38:
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      goto LABEL_39;
    case 8:
      goto LABEL_27;
    case 9:
      LOBYTE(v9) = 0;
      LOBYTE(v10) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      v7 = 0;
      LOBYTE(v6) = *((_BYTE *)v8 + 8);
      goto LABEL_27;
    case 10:
      LOBYTE(v10) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      v7 = 0;
      LODWORD(v6) = *((unsigned __int16 *)v8 + 4);
      LODWORD(v9) = v6 >> 8;
      goto LABEL_27;
    case 11:
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      v7 = 0;
      LODWORD(v6) = *((unsigned __int16 *)v8 + 4) | (*((unsigned __int8 *)v8 + 10) << 16);
      LODWORD(v9) = v6 >> 8;
      LOBYTE(v10) = *((_BYTE *)v8 + 10);
      goto LABEL_27;
    case 12:
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      v7 = 0;
      LODWORD(v6) = *((_DWORD *)v8 + 2);
      LODWORD(v9) = v6 >> 8;
      LODWORD(v10) = WORD1(v6);
      LODWORD(v11) = BYTE3(v6);
      goto LABEL_27;
    case 13:
      LOBYTE(v13) = 0;
      v7 = 0;
      v12 = *((unsigned __int8 *)v8 + 12);
      v6 = *((unsigned int *)v8 + 2);
      v62 = v6 | (v12 << 32);
      v9 = v62 >> 8;
      v10 = v62 >> 16;
      v11 = v62 >> 24;
      goto LABEL_27;
    case 14:
      v7 = 0;
      LODWORD(v12) = *((unsigned __int16 *)v8 + 6);
      v6 = *((unsigned int *)v8 + 2);
      v63 = v6 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)*((unsigned __int16 *)v8 + 6) << 32);
      v9 = v63 >> 8;
      v11 = v63 >> 24;
      v13 = v12 >> 8;
      v10 = v63 >> 16;
      goto LABEL_27;
    case 15:
      LODWORD(v12) = *((unsigned __int16 *)v8 + 6) | (*((unsigned __int8 *)v8 + 14) << 16);
      v6 = *((unsigned int *)v8 + 2);
      v64 = v6 & 0xFF000000FFFFFFFFLL | ((v12 & 0xFFFFFF) << 32);
      v9 = v64 >> 8;
      v11 = v64 >> 24;
      v13 = v12 >> 8;
      v7 = *((unsigned __int8 *)v8 + 14);
      v10 = v64 >> 16;
LABEL_27:
      v31 = *v8;
      v32 = HIWORD(*v8);
      v33 = v31 >> 40;
      v34 = HIDWORD(v31);
      v35 = v31 >> 24;
      v36 = v31 >> 16;
      v37 = v31 >> 8;
      v38 = v31 & 0xFF00000000000000;
      goto LABEL_28;
    default:
      LOBYTE(v31) = 0;
      LOBYTE(v37) = 0;
      LOBYTE(v36) = 0;
      LOBYTE(v35) = 0;
      LOBYTE(v34) = 0;
      LOBYTE(v33) = 0;
      LOBYTE(v32) = 0;
      v38 = 0;
      LOBYTE(v6) = 0;
      LOBYTE(v9) = 0;
      LOBYTE(v10) = 0;
      LOBYTE(v11) = 0;
      LOBYTE(v12) = 0;
      LOBYTE(v13) = 0;
      v65 = 0;
      LOBYTE(v15) = 0;
      LOBYTE(v16) = 0;
      LOBYTE(v67) = 0;
      LOBYTE(v68) = 0;
      LOBYTE(v66) = 0;
      v39 = 0;
      v40 = 0;
      v41 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
      v45 = 0;
      v7 = 0;
      if (v71 < 8)
        goto LABEL_39;
LABEL_28:
      v39 = v6;
      v6 = v38 | v31 | (unint64_t)(unsigned __int16)(v37 << 8) | ((unint64_t)v36 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v35 << 24) | ((unint64_t)v34 << 32) | ((unint64_t)v33 << 40) | ((unint64_t)v32 << 48);
      v14 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v6) | ((0x87C37B91114253D5 * v6) >> 33));
      LOBYTE(v6) = v31;
      LOBYTE(v15) = v37;
      LOBYTE(v16) = v36;
      LOBYTE(v67) = v34;
      LOBYTE(v68) = v35;
      v65 = v32;
      LOBYTE(v66) = v33;
      v40 = v9;
      v41 = v10;
      v42 = v11;
      v43 = v12;
      v44 = v13;
      v45 = v7;
LABEL_39:
      result = a2;
      v52 = a4;
      switch(v71)
      {
        case 1u:
          v53 = v6;
          goto LABEL_47;
        case 2u:
          v53 = v6 | ((unint64_t)v15 << 8);
          goto LABEL_47;
        case 3u:
          v53 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v16 << 16);
          goto LABEL_47;
        case 4u:
          v53 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v16 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v68 << 24);
          goto LABEL_47;
        case 5u:
          v53 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v16 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v68 << 24) | ((unint64_t)v67 << 32);
          goto LABEL_47;
        case 6u:
          v53 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v16 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v68 << 24) | ((unint64_t)v67 << 32) | ((unint64_t)v66 << 40);
          goto LABEL_47;
        case 7u:
          v53 = v6 | (unint64_t)(unsigned __int16)(v15 << 8) | ((unint64_t)v16 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v68 << 24) | ((unint64_t)v67 << 32) | ((unint64_t)v66 << 40) | ((unint64_t)v65 << 48);
LABEL_47:
          v14 ^= 0x4CF5AD432745937FLL * ((0x88A129EA80000000 * v53) | ((0x87C37B91114253D5 * v53) >> 33));
          break;
        case 8u:
          break;
        case 9u:
          v54 = v39;
          goto LABEL_55;
        case 0xAu:
          v54 = v39 | ((unint64_t)v40 << 8);
          goto LABEL_55;
        case 0xBu:
          v54 = v39 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v41 << 16);
          goto LABEL_55;
        case 0xCu:
          v54 = v39 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v41 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v42 << 24);
          goto LABEL_55;
        case 0xDu:
          v54 = v39 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v41 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v42 << 24) | ((unint64_t)v43 << 32);
          goto LABEL_55;
        case 0xEu:
          v54 = v39 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v41 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v42 << 24) | ((unint64_t)v43 << 32) | ((unint64_t)v44 << 40);
          goto LABEL_55;
        case 0xFu:
          v54 = v39 | (unint64_t)(unsigned __int16)(v40 << 8) | ((unint64_t)v41 << 16) & 0xFFFFFFFF00FFFFFFLL | ((unint64_t)v42 << 24) | ((unint64_t)v43 << 32) | ((unint64_t)v44 << 40) | (v45 << 48);
LABEL_55:
          v4 ^= 0x87C37B91114253D5 * ((0x4E8B26FE00000000 * v54) | ((0x4CF5AD432745937FLL * v54) >> 31));
          break;
        default:
          result = a2;
          v52 = a4;
          break;
      }
      v55 = v4 ^ result;
      v56 = v55 + (v14 ^ result);
      v57 = v56 + v55;
      v58 = 0xC4CEB9FE1A85EC53
          * ((0xFF51AFD7ED558CCDLL * (v56 ^ (v56 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v56 ^ (v56 >> 33))) >> 33));
      v59 = 0xC4CEB9FE1A85EC53
          * ((0xFF51AFD7ED558CCDLL * (v57 ^ (v57 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v57 ^ (v57 >> 33))) >> 33));
      v60 = v59 ^ (v59 >> 33);
      v61 = v60 + (v58 ^ (v58 >> 33));
      *v52 = v61;
      v52[1] = v61 + v60;
      return result;
  }
}

void sub_1A0981F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id procNameForPid(int a1, int *a2)
{
  int v4;
  unsigned int v6;
  _BYTE buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  *__error() = 0;
  getpid();
  v4 = sandbox_check();
  if (v4)
  {
    if (v4 == 1)
      *a2 = 0;
    else
      *a2 = *__error();
    return 0;
  }
  else
  {
    *__error() = 0;
    v6 = proc_name(a1, buffer, 0x400u);
    if (a2)
      *a2 = *__error();
    if ((v6 & 0x80000000) != 0)
      return 0;
    else
      return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", buffer, v6, 4);
  }
}

void sub_1A0983078(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A0983120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09831C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09839A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1A0984C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0984E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09872C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__857(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__858(uint64_t a1)
{

}

double _PASCompactStringArrayCreate()
{
  uint64_t v0;
  double result;

  v0 = operator new();
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  result = NAN;
  *(_QWORD *)(v0 + 32) = -1;
  return result;
}

void _PASCompactStringArrayAppendString(uint64_t a1, char *__s)
{
  size_t v4;
  unsigned int v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int __src;
  uint64_t v14;

  if (a1)
  {
    if (__s)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_PASCompactStringArray.mm"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

    if (__s)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_PASCompactStringArray.mm"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

LABEL_3:
  v4 = strlen(__s);
  v5 = v4;
  v6 = *(char **)(a1 + 8);
  if ((unint64_t)&v6[v4 - *(_QWORD *)a1 - 4294967292u] <= 0xFFFFFFFEFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASCompactStringArrayAppendString(struct _PASCompactStringArray * _Nonnull, const char * _Nonnull)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_PASCompactStringArray.mm"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array->buffer.size() + szStringSize + sizeof(uint32_t) <= UINT32_MAX"));

    v6 = *(char **)(a1 + 8);
  }
  __src = v5;
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, v6, (char *)&__src, (char *)&v14, 4);
  std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(a1, *(char **)(a1 + 8), __s, &__s[__src], __src);
}

void sub_1A09875A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::__insert_with_size[abi:ne180100]<unsigned char const*,unsigned char const*>(uint64_t a1, char *__dst, char *__src, char *a4, int64_t a5)
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

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E442DC78, MEMORY[0x1E0DE42D0]);
}

void sub_1A0987830(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void _PASCompactStringArrayMinimizeSpace(unint64_t *a1)
{
  void *v1;
  void *v2;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASCompactStringArrayMinimizeSpace(struct _PASCompactStringArray * _Nonnull)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("_PASCompactStringArray.mm"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

    a1 = 0;
  }
  std::vector<unsigned char>::shrink_to_fit(a1);
}

void sub_1A0987900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void std::vector<unsigned char>::shrink_to_fit(unint64_t *a1)
{
  char *v1;
  unint64_t v2;
  char *v3;
  unint64_t v5;
  char *v6;
  char v7;

  v1 = (char *)a1[1];
  v2 = *a1;
  v3 = &v1[-*a1];
  if (a1[2] - *a1 > (unint64_t)v3)
  {
    if (v1 == (char *)v2)
    {
      v5 = (unint64_t)&v1[-*a1];
    }
    else
    {
      v5 = (unint64_t)operator new((size_t)&v1[-*a1]);
      v3 += v5;
      v6 = &v1[~v2];
      do
      {
        v7 = *--v1;
        (v6--)[v5] = v7;
      }
      while (v1 != (char *)v2);
    }
    *a1 = v5;
    a1[1] = (unint64_t)v3;
    a1[2] = (unint64_t)v3;
    if (v2)
      operator delete((void *)v2);
  }
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t _PASCompactStringArrayFindStringWithSize(uint64_t *a1, void *__s1, size_t __n)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  if (a1)
  {
    if (__s1)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t _PASCompactStringArrayFindStringWithSize(const struct _PASCompactStringArray * _Nonnull, const char * _Nonnull, size_t)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_PASCompactStringArray.mm"), 64, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

    if (__s1)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t _PASCompactStringArrayFindStringWithSize(const struct _PASCompactStringArray * _Nonnull, const char * _Nonnull, size_t)");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("_PASCompactStringArray.mm"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("string"));

LABEL_3:
  v7 = *a1;
  v6 = a1[1];
  v8 = v6 - *a1;
  if (v6 == *a1)
    return -1;
  v10 = *((_DWORD *)a1 + 6);
  v9 = *((_DWORD *)a1 + 7);
  v11 = v10;
  while (1)
  {
    v12 = (unsigned int *)(v7 + v11);
    v13 = *v12;
    if (v13 == __n && !memcmp(__s1, v12 + 1, __n))
      break;
    v14 = v11 + v13 + 4;
    if (v8 == v14)
      v9 = 0;
    else
      ++v9;
    if (v8 == v14)
      v11 = 0;
    else
      v11 += v13 + 4;
    if (v11 == v10)
      return -1;
  }
  if (*((_DWORD *)a1 + 8) == -1)
  {
    *((_DWORD *)a1 + 8) = v11;
    *((_DWORD *)a1 + 9) = v9;
  }
  v16 = v11 + v13 + 4;
  if (v8 == v16)
    v17 = 0;
  else
    v17 = v9 + 1;
  if (v8 == v16)
    LODWORD(v16) = 0;
  *((_DWORD *)a1 + 6) = v16;
  *((_DWORD *)a1 + 7) = v17;
  return v9;
}

void sub_1A0987B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _PASCompactStringArrayFindString(uint64_t *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return _PASCompactStringArrayFindStringWithSize(a1, __s, v4);
}

double _PASCompactStringArrayResetSearchHint(_DWORD *a1)
{
  int v2;
  int v3;
  void *v4;
  void *v5;
  double result;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASCompactStringArrayResetSearchHint(const struct _PASCompactStringArray * _Nonnull)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("_PASCompactStringArray.mm"), 118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

  }
  v2 = a1[8];
  if (v2 != -1)
  {
    v3 = a1[9];
    a1[6] = v2;
    a1[7] = v3;
    result = NAN;
    *((_QWORD *)a1 + 4) = -1;
  }
  return result;
}

void sub_1A0987C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A0987DD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0987E64(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A0987F8C(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A09882E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0988364(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A0988438(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1A0988598(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1A09886B0(_Unwind_Exception *a1)
{
  pthread_mutex_t *v1;

  pthread_mutex_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1A098882C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A09888F0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0988BBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  pthread_mutex_t *v3;
  void *v4;
  void *v5;

  pthread_mutex_unlock(v3);
  _Unwind_Resume(a1);
}

void sub_1A0988D18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  pthread_mutex_t *v10;
  void *v11;
  void *v12;

  v12 = v11;

  pthread_mutex_unlock(v10);
  _Unwind_Resume(a1);
}

uint64_t *std::unique_ptr<proactive::pas::SynchronizedObject<`anonymous namespace'::HDGuardedData,proactive::pas::detail::RecursiveMutex>>::reset[abi:ne180100](uint64_t *result, uint64_t a2)
{
  uint64_t v2;

  v2 = *result;
  *result = a2;
  if (v2)
  {
    pthread_mutex_destroy((pthread_mutex_t *)(v2 + 8));
    JUMPOUT(0x1A1AFD770);
  }
  return result;
}

void _ZN12_GLOBAL__N_110SimdVectorIDv8_ffE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  char *v21;
  void *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *v34[2];

  v4 = *(_QWORD *)(a1 + 24);
  v5 = (a2 + 7) >> 3;
  v6 = *(char **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (v7 - *(_QWORD *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8)
      goto LABEL_21;
    v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  v9 = v5 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(_QWORD *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  if ((a2 + 7) >> 62)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v11 = v10 - (_QWORD)v6;
  if (v11 >> 4 > v5)
    v5 = v11 >> 4;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
    v12 = 0x7FFFFFFFFFFFFFFLL;
  else
    v12 = v5;
  _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v12, v8, a1 + 16);
  v13 = (char *)v34[0];
  bzero(v34[0], 32 * v9);
  v14 = &v13[32 * v9];
  v34[0] = v14;
  v16 = *(char **)a1;
  v15 = *(char **)(a1 + 8);
  v17 = v33;
  if (v15 == *(char **)a1)
  {
    v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      v18 = *((_OWORD *)v15 - 2);
      v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *((_OWORD *)v17 - 2) = v18;
      *((_OWORD *)v17 - 1) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    v20 = *(char **)a1;
    v15 = *(char **)(a1 + 8);
    v14 = (char *)v34[0];
  }
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v14;
  v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v34[1];
  v34[0] = v15;
  v34[1] = v22;
  v32 = v20;
  v33 = v20;
  if (v15 != v20)
    v34[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  if (v20)
    free(v20);
LABEL_21:
  *(_QWORD *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    v23 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
    if (v23 < (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 5)
    {
      _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v23, (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5, a1 + 16);
      v25 = *(char **)a1;
      v24 = *(char **)(a1 + 8);
      v26 = v33;
      if (v24 == *(char **)a1)
      {
        v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          v27 = *((_OWORD *)v24 - 2);
          v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *((_OWORD *)v26 - 2) = v27;
          *((_OWORD *)v26 - 1) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        v29 = *(char **)a1;
        v24 = *(char **)(a1 + 8);
      }
      *(_QWORD *)a1 = v26;
      v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v34;
      v34[0] = v24;
      v34[1] = v30;
      v32 = v29;
      v33 = v29;
      if (v24 != v29)
        v34[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      if (v29)
        free(v29);
    }
    v31 = *(_QWORD *)(a1 + 24);
    if (v31)
      bzero((void *)(*(_QWORD *)a1 + 4 * v31), *(_QWORD *)(a1 + 8) - (*(_QWORD *)a1 + 4 * v31));
  }
}

void sub_1A0989024(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1A0988FF0);
}

void _ZN12_GLOBAL__N_110SimdVectorIDv8_ijE6resizeEm(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  char *v20;
  char *v21;
  void *v22;
  unint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  __int128 v27;
  __int128 v28;
  char *v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void *v34[2];

  v4 = *(_QWORD *)(a1 + 24);
  v5 = (a2 + 7) >> 3;
  v6 = *(char **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = (v7 - *(_QWORD *)a1) >> 5;
  if (v5 <= v8)
  {
    if (v5 >= v8)
      goto LABEL_21;
    v21 = &v6[32 * v5];
    goto LABEL_15;
  }
  v9 = v5 - v8;
  v10 = *(_QWORD *)(a1 + 16);
  if (v5 - v8 <= (v10 - v7) >> 5)
  {
    bzero(*(void **)(a1 + 8), 32 * v9);
    v21 = (char *)(v7 + 32 * v9);
LABEL_15:
    *(_QWORD *)(a1 + 8) = v21;
    goto LABEL_21;
  }
  if ((a2 + 7) >> 62)
    std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
  v11 = v10 - (_QWORD)v6;
  if (v11 >> 4 > v5)
    v5 = v11 >> 4;
  if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
    v12 = 0x7FFFFFFFFFFFFFFLL;
  else
    v12 = v5;
  _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v12, v8, a1 + 16);
  v13 = (char *)v34[0];
  bzero(v34[0], 32 * v9);
  v14 = &v13[32 * v9];
  v34[0] = v14;
  v16 = *(char **)a1;
  v15 = *(char **)(a1 + 8);
  v17 = v33;
  if (v15 == *(char **)a1)
  {
    v20 = *(char **)(a1 + 8);
  }
  else
  {
    do
    {
      v18 = *((_OWORD *)v15 - 2);
      v19 = *((_OWORD *)v15 - 1);
      v15 -= 32;
      *((_OWORD *)v17 - 2) = v18;
      *((_OWORD *)v17 - 1) = v19;
      v17 -= 32;
    }
    while (v15 != v16);
    v20 = *(char **)a1;
    v15 = *(char **)(a1 + 8);
    v14 = (char *)v34[0];
  }
  *(_QWORD *)a1 = v17;
  *(_QWORD *)(a1 + 8) = v14;
  v22 = *(void **)(a1 + 16);
  *(void **)(a1 + 16) = v34[1];
  v34[0] = v15;
  v34[1] = v22;
  v32 = v20;
  v33 = v20;
  if (v15 != v20)
    v34[0] = &v15[(v20 - v15 + 31) & 0xFFFFFFFFFFFFFFE0];
  if (v20)
    free(v20);
LABEL_21:
  *(_QWORD *)(a1 + 24) = a2;
  if (v4 > a2)
  {
    v23 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5;
    if (v23 < (uint64_t)(*(_QWORD *)(a1 + 16) - *(_QWORD *)a1) >> 5)
    {
      _ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(&v32, v23, (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 5, a1 + 16);
      v25 = *(char **)a1;
      v24 = *(char **)(a1 + 8);
      v26 = v33;
      if (v24 == *(char **)a1)
      {
        v29 = *(char **)(a1 + 8);
      }
      else
      {
        do
        {
          v27 = *((_OWORD *)v24 - 2);
          v28 = *((_OWORD *)v24 - 1);
          v24 -= 32;
          *((_OWORD *)v26 - 2) = v27;
          *((_OWORD *)v26 - 1) = v28;
          v26 -= 32;
        }
        while (v24 != v25);
        v29 = *(char **)a1;
        v24 = *(char **)(a1 + 8);
      }
      *(_QWORD *)a1 = v26;
      v30 = *(void **)(a1 + 16);
      *(_OWORD *)(a1 + 8) = *(_OWORD *)v34;
      v34[0] = v24;
      v34[1] = v30;
      v32 = v29;
      v33 = v29;
      if (v24 != v29)
        v34[0] = &v24[(v29 - v24 + 31) & 0xFFFFFFFFFFFFFFE0];
      if (v29)
        free(v29);
    }
    v31 = *(_QWORD *)(a1 + 24);
    if (v31)
      bzero((void *)(*(_QWORD *)a1 + 4 * v31), *(_QWORD *)(a1 + 8) - (*(_QWORD *)a1 + 4 * v31));
  }
}

void sub_1A098923C(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x1A0989208);
}

_QWORD *_ZNSt3__114__split_bufferIDv8_iRN12_GLOBAL__N_120SimdAlignedAllocatorIS1_EEEC1EmmS5_(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v7;
  char *v8;
  std::bad_alloc *exception;
  std::bad_alloc *v11;
  void *memptr;

  a1[3] = 0;
  a1[4] = a4;
  if (a2)
  {
    memptr = 0;
    if (malloc_type_posix_memalign(&memptr, 0x40uLL, 32 * a2, 0x1000040E0EAB150uLL))
    {
      exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
      v11 = std::bad_alloc::bad_alloc(exception);
      __cxa_throw(v11, MEMORY[0x1E0DE4EA8], MEMORY[0x1E0DE4DC0]);
    }
    v7 = (char *)memptr;
  }
  else
  {
    v7 = 0;
  }
  v8 = &v7[32 * a3];
  *a1 = v7;
  a1[1] = v8;
  a1[2] = v8;
  a1[3] = &v7[32 * a2];
  return a1;
}

float entropy(uint64_t ***a1, int a2, int a3)
{
  float v3;
  size_t v8;
  unint64_t v9;
  uint64_t v10;
  float *v11;
  size_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  float32x4_t v17;
  float32x4_t v18;
  float32x4_t *v19;
  float32x4_t v20;
  float32x4_t v21;
  float32x4_t *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  double v28;
  float v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  float v34;
  int8x16_t v35;
  float v36;
  int v38;
  id v39;
  id v40;
  uint64_t v41;
  void *memptr;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = 0.0;
  if (a2 != 0xFFFF && a3 != 0xFFFF)
    return v3;
  v8 = (**a1)[1] - ***a1;
  v9 = v8 | 0xF;
  memptr = 0;
  v43 = 0;
  if ((v8 | 0xF) > 0x800)
  {
    v10 = malloc_type_posix_memalign(&memptr, 0x10uLL, v8, 0xE01A67FCuLL);
    LOBYTE(v43) = 0;
    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v39);
    }
    v11 = (float *)memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78](a1);
    bzero((char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v8 | 0xF);
    v11 = (float *)(((unint64_t)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0);
  }
  v12 = v8 | 3;
  memptr = 0;
  v43 = 0;
  if ((v8 | 3) > 0x800)
  {
    v38 = malloc_type_posix_memalign(&memptr, 8uLL, v8, 0x26506326uLL);
    LOBYTE(v43) = 0;
    if (v38)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v40);
    }
    v13 = (char *)memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78](v10);
    v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, v12);
  }
  if ((a3 & a2) == 0xFFFF)
  {
    v14 = **a1;
    v15 = *v14;
    if (v14[1] == *v14)
    {
      v17 = 0uLL;
      v18 = 0uLL;
    }
    else
    {
      v16 = 0;
      v17 = 0uLL;
      v18 = 0uLL;
      do
      {
        v19 = (float32x4_t *)(v15 + 32 * v16);
        v20 = *v19;
        v21 = v19[1];
        v18 = vaddq_f32(v18, v21);
        v17 = vaddq_f32(v17, *v19);
        v22 = (float32x4_t *)&v11[8 * v16];
        *v22 = v20;
        v22[1] = v21;
        ++v16;
        v14 = **a1;
        v15 = *v14;
      }
      while (v16 < (v14[1] - *v14) >> 5);
    }
    v26 = *((_DWORD *)v14 + 6);
    v35 = (int8x16_t)vaddq_f32(v17, v18);
    v28 = vaddv_f32(vadd_f32(*(float32x2_t *)v35.i8, (float32x2_t)*(_OWORD *)&vextq_s8(v35, v35, 8uLL)));
LABEL_30:
    if (v26 < 1)
    {
      v3 = 0.0;
    }
    else
    {
      v36 = v28;
      cblas_sscal(v26, 1.0 / v36, v11, 1);
      LODWORD(memptr) = (v26 + 7) & 0xFFFFFFF8;
      vvlog2f((float *)v13, v11, (const int *)&memptr);
      v3 = -cblas_sdot(v26, v11, 1, (const float *)v13, 1);
    }
    goto LABEL_33;
  }
  if (a2 == 0xFFFF)
  {
    v23 = **a1;
    v24 = v23[3];
    if (v24)
    {
      v25 = 0;
      v26 = 0;
      v27 = v23[4];
      v28 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v27 + 4 * v25) == a3)
        {
          v29 = *(float *)(*v23 + 4 * v25);
          v28 = v28 + v29;
          v11[v26++] = v29;
        }
        ++v25;
      }
      while (v24 > v25);
      goto LABEL_30;
    }
  }
  else
  {
    v30 = **a1;
    v31 = v30[3];
    if (v31)
    {
      v32 = 0;
      v26 = 0;
      v33 = v30[4];
      v28 = 0.0;
      do
      {
        if (*(unsigned __int16 *)(v33 + 4 * v32 + 2) == a2)
        {
          v34 = *(float *)(*v30 + 4 * v32);
          v28 = v28 + v34;
          v11[v26++] = v34;
        }
        ++v32;
      }
      while (v31 > v32);
      goto LABEL_30;
    }
  }
LABEL_33:
  if (v12 >= 0x801)
    free(v13);
  if (v9 >= 0x801)
    free(v11);
  if (fabsf(v3) == INFINITY)
    return 0.0;
  return v3;
}

unint64_t *_PASRngSeed64(unint64_t *result, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = 0x94D049BB133111EBLL
     * ((0xBF58476D1CE4E5B9 * ((a2 | 1) ^ (a2 >> 30))) ^ ((0xBF58476D1CE4E5B9 * ((a2 | 1) ^ (a2 >> 30))) >> 27));
  v3 = 0x63660277528772BBLL
     * ((0x3CD0EB9D47532DFBLL * ((a2 | 1) ^ (a2 >> 29))) ^ ((0x3CD0EB9D47532DFBLL * ((a2 | 1) ^ (a2 >> 29))) >> 26));
  *result = v2 ^ (v2 >> 31);
  result[1] = v3 ^ (v3 >> 33);
  return result;
}

uint64_t _PASBuddyAllocatorCreateWithAlignedBuffer(_QWORD *a1, unint64_t a2)
{
  proactive::pas::buddyalloc *v4;
  _anonymous_namespace_ *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  _QWORD *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  size_t v24;
  void *v25;
  uint8_t buf[4];
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((a1 & 0xF) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "struct _PASBuddyAllocator *_PASBuddyAllocatorCreateWithAlignedBuffer(void * _Nonnull, size_t)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("_PASBuddyAllocator.mm"), 691, CFSTR("_PASBuddyAllocator buffer must be 16-byte aligned."));

  }
  LODWORD(v4) = -1;
  do
  {
    v5 = (_anonymous_namespace_ *)proactive::pas::buddyalloc::heapSizeForLevels((proactive::pas::buddyalloc *)((_DWORD)v4 + 2));
    v4 = (proactive::pas::buddyalloc *)((_DWORD)v4 + 1);
  }
  while ((unint64_t)v5 <= a2);
  if ((_DWORD)v4)
  {
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v27 = proactive::pas::buddyalloc::heapSizeForLevels(v4);
      v28 = 2048;
      v29 = a2;
      _os_log_debug_impl(&dword_1A0957000, v6, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator selecting heap size %zu to fit in buffer of size %zu.", buf, 0x16u);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "struct _PASBuddyAllocator *_PASBuddyAllocatorCreateWithAlignedBuffer(void * _Nonnull, size_t)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_PASBuddyAllocator.mm"), 694, CFSTR("_PASBuddyAllocator can't create heap of size %zu bytes."), a2);

  }
  v9 = operator new();
  *(_OWORD *)(v9 + 8) = 0u;
  *(_OWORD *)(v9 + 40) = 0u;
  *(_OWORD *)(v9 + 24) = 0u;
  *(_QWORD *)v9 = a1;
  *(_DWORD *)(v9 + 8) = (_DWORD)v4;
  *(_QWORD *)(v9 + 56) = 0;
  *(_QWORD *)(v9 + 64) = v9 + 16;
  *(_DWORD *)(v9 + 72) = 0;
  if ((_DWORD)v4)
  {
    v10 = (char *)a1 + (16 << (v4 - 1));
    v11 = (char *)((unint64_t)((1 << (v4 - 1)) + 7) >> 3);
    v12 = &v11[(_QWORD)v10];
    *(_QWORD *)(v9 + 16) = v10;
    *(_QWORD *)(v9 + 24) = &v11[(_QWORD)v10];
    bzero(v10, (size_t)v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::bitmapSizeForLevels");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("_PASBuddyAllocatorPOD.h"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    v21 = *(void **)(v9 + 16);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::bitmapSizeForLevels");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_PASBuddyAllocatorPOD.h"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    bzero(v21, v24);
    v12 = *(char **)(v9 + 24);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::bitmapSizeForLevels");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_PASBuddyAllocatorPOD.h"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

  }
  bzero(v12, (size_t)v11);
  v13 = (_QWORD *)operator new[]();
  bzero(v13, 8 * v4);
  *(_QWORD *)(v9 + 56) = v13;
  *a1 = 0;
  a1[1] = 0;
  *v13 = a1;
  return v9;
}

void sub_1A098BEE0(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v2;
  void *v3;

  MEMORY[0x1A1AFD770](v1, 0x10F0C407B7769EDLL);
  _Unwind_Resume(a1);
}

unint64_t proactive::pas::buddyalloc::heapSizeForLevels(proactive::pas::buddyalloc *this)
{
  char v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if ((_DWORD)this)
  {
    v1 = (_BYTE)this - 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::bitmapSizeForLevels");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_PASBuddyAllocatorPOD.h"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    v1 = -1;
  }
  return (16 << v1) + 2 * ((unint64_t)((1 << v1) + 7) >> 3);
}

void sub_1A098C09C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id `anonymous namespace'::logHandle(_anonymous_namespace_ *this)
{
}

void ___ZN12_GLOBAL__N_19logHandleEv_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = os_log_create("com.apple.proactive", "buddyalloc");

  objc_autoreleasePoolPop(v0);
}

uint64_t _PASBuddyAllocatorDestroy(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 56);
    if (v1)
      MEMORY[0x1A1AFD758](v1, 0x20C8093837F09);
    JUMPOUT(0x1A1AFD770);
  }
  return result;
}

uint64_t *`anonymous namespace'::BuddyAllocator::alloc(os_unfair_lock_s *this, unint64_t a2)
{
  int v4;
  uint32_t os_unfair_lock_opaque;
  uint32_t v6;
  unint64_t v7;
  unsigned int v8;
  char v9;
  NSObject *v10;
  os_unfair_lock_s *v11;
  uint64_t *v12;
  uint32_t v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _anonymous_namespace_ *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  _BYTE buf[12];
  __int16 v30;
  unint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v4 = 0;
  os_unfair_lock_opaque = this[2]._os_unfair_lock_opaque;
  v6 = os_unfair_lock_opaque - 1;
  while (v6 != v4)
  {
    v7 = 16 << v4++;
    if (v7 >= a2)
    {
      v8 = os_unfair_lock_opaque - v4;
      v9 = os_unfair_lock_opaque - v4 + 1;
      goto LABEL_7;
    }
  }
  v8 = 0;
  v7 = 16 << v6;
  v9 = 1;
LABEL_7:
  if (v7 < a2)
  {
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)&this->_os_unfair_lock_opaque;
      v21 = proactive::pas::buddyalloc::blockStorageSizeForLevels((proactive::pas::buddyalloc *)this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v20;
      v30 = 2048;
      v31 = a2;
      v32 = 2048;
      v33 = v21;
      _os_log_error_impl(&dword_1A0957000, v10, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx failed request to allocate %zu bytes on heap of size %zu", buf, 0x20u);
    }
LABEL_22:

    return 0;
  }
  *(_QWORD *)buf = this + 16;
  v11 = this + 18;
  os_unfair_lock_lock(this + 18);
  if (!v12)
  {
    os_unfair_lock_unlock(this + 18);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v22 = *(_QWORD *)&this->_os_unfair_lock_opaque;
      v23 = proactive::pas::buddyalloc::blockStorageSizeForLevels((proactive::pas::buddyalloc *)this[2]._os_unfair_lock_opaque);
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v22;
      v30 = 2048;
      v31 = a2;
      v32 = 2048;
      v33 = v23;
      _os_log_debug_impl(&dword_1A0957000, v10, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx out of memory while requesting %zu bytes on heap of size %zu", buf, 0x20u);
    }
    goto LABEL_22;
  }
  v13 = this[2]._os_unfair_lock_opaque;
  v14 = *(_QWORD **)&this[16]._os_unfair_lock_opaque;
  v15 = v14[2];
  v16 = (16 << (v13 - v9)) + v15;
  if (v16 <= v14[3])
    v17 = v14[3];
  else
    v17 = (16 << (v13 - v9)) + v15;
  v14[2] = v16;
  v14[3] = v17;
  ++v14[4];
  if (!v13)
  {
    v28 = v16;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    LOBYTE(v13) = 0;
    v16 = v28;
  }
  if (v16 > 16 << (v13 - 1))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *(anonymous namespace)::BuddyAllocator::allocBlock");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_PASBuddyAllocator.mm"), 231, CFSTR("bytes allocated exceeded heap size"));

  }
  os_unfair_lock_unlock(v11);
  return v12;
}

void sub_1A098C4AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  void *v2;
  void *v3;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t proactive::pas::buddyalloc::blockStorageSizeForLevels(proactive::pas::buddyalloc *this)
{
  char v1;
  void *v3;
  void *v4;

  v1 = (char)this;
  if (!(_DWORD)this)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

  }
  return 16 << (v1 - 1);
}

void sub_1A098C5A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t *`anonymous namespace'::BuddyAllocator::allocBlock_locked(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  uint64_t v6;
  uint64_t *v7;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  int v13;
  unint64_t v14;
  int v15;
  _QWORD *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;

  v6 = a3;
  v7 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)*a2 + 40) + 8 * a3);
  if (v7)
  {
LABEL_2:
    return v7;
  }
  if (!a3)
    return 0;
  v9 = a3 - 1;
  v7 = (uint64_t *)v10;
  if (v10)
  {
    v11 = *(_QWORD **)*a2;
    v12 = *(_DWORD *)(a1 + 8);
    v13 = ~(-1 << v9);
    v14 = (unint64_t)(((unint64_t)(v10 - *(_QWORD *)a1) >> (v12
                                                                                      - a3
                                                                                      + 4))
                           + v13) >> 3;
    v15 = 1 << ((((unint64_t)(v10 - *(_QWORD *)a1) >> (v12 - a3 + 4))
               + ~(-1 << v9)) & 7);
    if ((v15 & *(_BYTE *)(*v11 + v14)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::splitBlock(SyncPtr &, void *, unsigned int)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_PASBuddyAllocator.mm"), 177, CFSTR("splitBlock called on an already-split block"));

      v11 = *(_QWORD **)*a2;
      v12 = *(_DWORD *)(a1 + 8);
      v21 = (((unint64_t)v7 - *(_QWORD *)a1) >> (v12 - a3 + 4)) + v13;
      v14 = v21 >> 3;
      v15 = 1 << (v21 & 7);
    }
    if ((v15 & *(_BYTE *)(v11[1] + v14)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::splitBlock(SyncPtr &, void *, unsigned int)");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("_PASBuddyAllocator.mm"), 178, CFSTR("splitBlock called on a block with an allocated child"));

      v12 = *(_DWORD *)(a1 + 8);
    }
    v16 = (uint64_t *)((char *)v7 + (16 << (v12 + ~(_BYTE)a3)));
    *v16 = 0;
    v16[1] = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)*a2 + 40) + 8 * v6) = v16;
    *v7 = 0;
    v7[1] = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)*a2 + 40) + 8 * v6) = v7;
    v17 = (unint64_t)((((unint64_t)v7 - *(_QWORD *)a1) >> (*(_DWORD *)(a1 + 8)
                                                                                     - a3
                                                                                     + 4))
                           + v13) >> 3;
    *(_BYTE *)(**(_QWORD **)*a2 + v17) |= 1 << (((((unint64_t)v7 - *(_QWORD *)a1) >> (*(_DWORD *)(a1 + 8)
                                                                                           - a3
                                                                                           + 4))
                                               + v13) & 7);
    v7 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)*a2 + 40) + 8 * v6);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *(anonymous namespace)::BuddyAllocator::allocBlock_locked(SyncPtr &, unsigned int)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("_PASBuddyAllocator.mm"), 212, CFSTR("allocBlock expected non-empty freeList"));

      v7 = *(uint64_t **)(*(_QWORD *)(*(_QWORD *)*a2 + 40) + 8 * v6);
    }
    goto LABEL_2;
  }
  return v7;
}

void sub_1A098C904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

_QWORD *`anonymous namespace'::insertAtHead(_QWORD *a1, _QWORD *a2)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (a2)
  {
    if (!a1)
      return a2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_PASBuddyAllocator.mm"), 56, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

    if (!a1)
      return a2;
  }
  if (*a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_PASBuddyAllocator.mm"), 58, CFSTR("insertAtHead: oldHead is not list head"));

  }
  if (*a2 || a2[1])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::insertAtHead(balloc::FreeListNode *, balloc::FreeListNode *)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_PASBuddyAllocator.mm"), 59, CFSTR("removeNode: unexpectedly inserting linked node"));

  }
  a2[1] = a1;
  *a1 = a2;
  return a2;
}

void sub_1A098CABC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t *`anonymous namespace'::removeNode(uint64_t *a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a1;
  if (a1)
  {
    if (a2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("_PASBuddyAllocator.mm"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oldHead"));

    if (a2)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("_PASBuddyAllocator.mm"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

LABEL_3:
  if (*v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_PASBuddyAllocator.mm"), 70, CFSTR("removeNode: oldHead is not list head"));

  }
  if (v3 == a2)
  {
    v3 = (uint64_t *)v3[1];
    goto LABEL_10;
  }
  v4 = *a2;
  if (!*a2)
  {
    if (!a2[1])
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "balloc::FreeListNode *(anonymous namespace)::removeNode(balloc::FreeListNode *, balloc::FreeListNode *)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_PASBuddyAllocator.mm"), 71, CFSTR("removeNode: unexpectedly removing unlinked node from nontrivial list"));

    }
LABEL_10:
    v4 = *a2;
    if (!*a2)
      goto LABEL_12;
  }
  *(_QWORD *)(v4 + 8) = a2[1];
LABEL_12:
  v7 = (_QWORD *)a2[1];
  if (v7)
    *v7 = v4;
  *a2 = 0;
  a2[1] = 0;
  return v3;
}

void sub_1A098CCF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::BuddyAllocator::toggleBuddyAllocationState(uint64_t result, uint64_t a2, uint64_t a3, int a4)
{
  unint64_t v4;

  if (a4)
  {
    v4 = (unint64_t)(((unint64_t)(a3 - *(_QWORD *)result) >> (*(_DWORD *)(result + 8)
                                                                                        - a4
                                                                                        + 4))
                          + ~(-1 << (a4 - 1))) >> 3;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + v4) ^= 1 << ((((unint64_t)(a3 - *(_QWORD *)result) >> (*(_DWORD *)(result + 8) - a4 + 4))
                                                              + ~(-1 << (a4 - 1))) & 7);
  }
  return result;
}

uint64_t *_PASBuddyAllocatorAllocZeros(os_unfair_lock_s *a1, unint64_t a2)
{
  uint64_t *v3;
  uint64_t *v4;

  v4 = v3;
  if (v3)
    bzero(v3, a2);
  return v4;
}

uint64_t *_PASBuddyAllocatorRealloc(os_unfair_lock_s *this, void *a2, unint64_t a3)
{
  uint64_t *v6;
  unint64_t v7;
  size_t v8;

  if (!a2)
  if (a3)
  {
    if (v6)
    {
      if (v7 >= a3)
        v8 = a3;
      else
        v8 = v7;
      memcpy(v6, a2, v8);
    }
  }
  else
  {
    return 0;
  }
  return v6;
}

void `anonymous namespace'::BuddyAllocator::free(os_unfair_lock_s *this, unint64_t a2)
{
  uint64_t *v2;
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint32_t os_unfair_lock_opaque;
  int v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  os_unfair_lock_s *lock;

  if (a2)
  {
    v2 = (uint64_t *)a2;
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::free(const void *)");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("_PASBuddyAllocator.mm"), 600, CFSTR("Attempt to free block %p which does not lie in the _PASBuddyAllocator heap at %p"), v2, *(_QWORD *)&this->_os_unfair_lock_opaque);

    }
    v4 = this + 16;
    lock = this + 18;
    os_unfair_lock_lock(this + 18);
    v30 = v5;
    while (1)
    {
      if (!v5)
        break;
      v6 = *(_QWORD *)&this[16]._os_unfair_lock_opaque;
      v7 = (unint64_t)v2 - *(_QWORD *)&this->_os_unfair_lock_opaque;
      os_unfair_lock_opaque = this[2]._os_unfair_lock_opaque;
      v9 = ~(-1 << (v5 - 1));
      v10 = (v7 >> (os_unfair_lock_opaque - v5 + 4)) + v9;
      if (((*(unsigned __int8 *)(*(_QWORD *)(v6 + 8) + (v10 >> 3)) >> (v10 & 7)) & 1) != 0)
        break;
      v11 = os_unfair_lock_opaque + ~(_BYTE)v5;
      if (((v7 >> v11) & 0x10) != 0)
        v12 = -16;
      else
        v12 = 16;
      v13 = (uint64_t *)((char *)v2 + (v12 << v11));
      if (v13 < v2)
        v2 = v13;
      v14 = **(_QWORD **)&this[16]._os_unfair_lock_opaque;
      v15 = (unint64_t)((((unint64_t)v2 - *(_QWORD *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque - v5 + 4))
                             + v9) >> 3;
      v16 = 1 << (((((unint64_t)v2 - *(_QWORD *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque
                                                                                        - v5
                                                                                        + 4))
                 + v9) & 7);
      v17 = *(unsigned __int8 *)(v14 + v15);
      if ((v16 & v17) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::freeBlock_locked(SyncPtr &, void *, unsigned int)");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("_PASBuddyAllocator.mm"), 266, CFSTR("Merging a block which was not split."));

        v14 = **(_QWORD **)&this[16]._os_unfair_lock_opaque;
        v15 = (unint64_t)((((unint64_t)v2 - *(_QWORD *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque - v5 + 4))
                               + v9) >> 3;
        v16 = 1 << (((((unint64_t)v2 - *(_QWORD *)&this->_os_unfair_lock_opaque) >> (this[2]._os_unfair_lock_opaque
                                                                                          - v5
                                                                                          + 4))
                   + v9) & 7);
        LOBYTE(v17) = *(_BYTE *)(v14 + v15);
      }
      *(_BYTE *)(v14 + v15) = v17 & ~(_BYTE)v16;
      --v5;
    }
    *v2 = 0;
    v2[1] = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&this[16]._os_unfair_lock_opaque + 40) + 8 * v5) = v2;
    v18 = *(_QWORD *)&this[16]._os_unfair_lock_opaque;
    v19 = *(_QWORD *)(v18 + 16);
    v20 = this[2]._os_unfair_lock_opaque + ~v30;
    if (v19 < 16 << (LOBYTE(this[2]._os_unfair_lock_opaque) + ~(_BYTE)v30))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::freeBlock(const void *)");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("_PASBuddyAllocator.mm"), 284, CFSTR("freeing more bytes than were allocated"));

      v18 = *(_QWORD *)&this[16]._os_unfair_lock_opaque;
      v19 = *(_QWORD *)(v18 + 16);
      v20 = this[2]._os_unfair_lock_opaque + ~v30;
    }
    *(_QWORD *)(v18 + 16) = (-16 << v20) + v19;
    v21 = *(_QWORD *)(v18 + 32);
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void (anonymous namespace)::BuddyAllocator::freeBlock(const void *)");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("_PASBuddyAllocator.mm"), 287, CFSTR("freeing more blocks than were allocated"));

      v18 = *(_QWORD *)&v4->_os_unfair_lock_opaque;
      v21 = *(_QWORD *)(*(_QWORD *)&v4->_os_unfair_lock_opaque + 32);
    }
    *(_QWORD *)(v18 + 32) = v21 - 1;
    os_unfair_lock_unlock(lock);
  }
}

void sub_1A098D22C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, os_unfair_lock_t lock)
{
  void *v14;
  void *v15;

  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::BuddyAllocator::sizeOfAllocatedRegion(os_unfair_lock_s *this, const void *a2)
{
  char v4;
  void *v6;
  void *v7;

  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t (anonymous namespace)::BuddyAllocator::sizeOfAllocatedRegion(const void *)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASBuddyAllocator.mm"), 613, CFSTR("Attempt to find size of block %p which does not lie in the _PASBuddyAllocator heap at %p"), a2, *(_QWORD *)&this->_os_unfair_lock_opaque);

  }
  os_unfair_lock_lock(this + 18);
  os_unfair_lock_unlock(this + 18);
  return 16 << (LOBYTE(this[2]._os_unfair_lock_opaque) + ~v4);
}

void sub_1A098D388(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

BOOL `anonymous namespace'::BuddyAllocator::heapContains(_anonymous_namespace_::BuddyAllocator *this, unint64_t a2)
{
  uint64_t v2;
  int v5;
  void *v6;
  void *v7;

  v2 = *(_QWORD *)this;
  if (*(_QWORD *)this > a2)
    return 0;
  v5 = *((_DWORD *)this + 2);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

  }
  return (16 << (v5 - 1)) + v2 > a2;
}

void sub_1A098D474(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t `anonymous namespace'::BuddyAllocator::levelForBlock(uint64_t a1, _QWORD **a2, uint64_t a3)
{
  int v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  v3 = *(_DWORD *)(a1 + 8);
  v4 = 1;
  do
  {
    v5 = (v3 - 1);
    if (v3 == 1)
      break;
    v6 = ((unint64_t)(a3 - *(_QWORD *)a1) >> (v4++ + 4)) + ~(-1 << (v3 - 2));
    v7 = *(unsigned __int8 *)(**a2 + (v6 >> 3)) >> (v6 & 7);
    v3 = v5;
  }
  while ((v7 & 1) == 0);
  return v5;
}

uint64_t _PASBuddyAllocatorSizeOfBuffer(os_unfair_lock_s *a1, const void *a2)
{
  {
  }
  else
  {
    return 0;
  }
}

void _PASBuddyAllocatorUsage(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (a2)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    v4 = *(_DWORD *)(a1 + 8);
    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    }
    *(_QWORD *)a2 = 16 << (v4 - 1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v5 = *(_QWORD *)(a1 + 64);
    *(_OWORD *)(a2 + 8) = *(_OWORD *)(v5 + 16);
    *(_QWORD *)(a2 + 24) = *(_QWORD *)(v5 + 32);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

void sub_1A098D638(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t _PASBuddyAllocatorIntegrityCheck(os_unfair_lock_s *a1)
{
  os_unfair_lock_s *v1;
  os_unfair_lock_s *v2;
  _anonymous_namespace_ *v3;
  NSObject *v4;
  _anonymous_namespace_ *v5;
  unint64_t os_unfair_lock_opaque;
  unint64_t v7;
  BOOL v8;
  char v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t **v13;
  NSObject *v14;
  NSObject *v15;
  _anonymous_namespace_ *v16;
  unint64_t v17;
  unint64_t i;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _anonymous_namespace_ *v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t j;
  os_unfair_lock_s *v28;
  unint64_t v29;
  _anonymous_namespace_ *v30;
  _anonymous_namespace_ **v31;
  _anonymous_namespace_ **v32;
  unint64_t v33;
  _anonymous_namespace_ *v34;
  BOOL v35;
  uint64_t v36;
  _anonymous_namespace_ *v37;
  uint64_t v38;
  _BYTE *v39;
  int v40;
  uint64_t v41;
  int v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  _anonymous_namespace_ *v46;
  uint64_t v47;
  _anonymous_namespace_ *v48;
  _anonymous_namespace_ **v49;
  NSObject *v50;
  BOOL v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  NSObject *v60;
  uint32_t v61;
  uint64_t v62;
  uint64_t v63;
  _anonymous_namespace_ **v64;
  int v65;
  _anonymous_namespace_ *v66;
  _anonymous_namespace_ *v67;
  _anonymous_namespace_ *v68;
  _anonymous_namespace_ *v69;
  _anonymous_namespace_ *v70;
  _anonymous_namespace_ *v71;
  _BOOL4 v72;
  _anonymous_namespace_ *v73;
  _anonymous_namespace_ **v74;
  uint64_t v75;
  NSObject *v76;
  _anonymous_namespace_ *v77;
  _anonymous_namespace_ **v78;
  uint64_t v79;
  _anonymous_namespace_ *v80;
  _anonymous_namespace_ **v81;
  _anonymous_namespace_ **v82;
  uint64_t v83;
  uint32_t v84;
  NSObject *v85;
  _anonymous_namespace_ *v86;
  uint32_t v87;
  unint64_t v88;
  unint64_t v89;
  BOOL v90;
  char v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
  unint64_t v95;
  _anonymous_namespace_ *v96;
  _anonymous_namespace_ *v97;
  _anonymous_namespace_ *v98;
  unint64_t v99;
  _anonymous_namespace_ *v100;
  _anonymous_namespace_ *v101;
  os_unfair_lock_s *v102;
  uint64_t v103;
  uint64_t v104;
  uint32_t v105;
  NSObject *v106;
  NSObject *v107;
  _anonymous_namespace_ *v108;
  _anonymous_namespace_ **v109;
  uint32_t v110;
  uint32_t v111;
  _anonymous_namespace_ *v112;
  _anonymous_namespace_ *v113;
  char *v114;
  char v115;
  void *v116;
  uint64_t v117;
  _anonymous_namespace_ *v118;
  unint64_t v119;
  _anonymous_namespace_ **v120;
  _anonymous_namespace_ **v121;
  _anonymous_namespace_ **v122;
  unint64_t v123;
  _anonymous_namespace_ **v124;
  _anonymous_namespace_ **v125;
  _anonymous_namespace_ **v126;
  _anonymous_namespace_ *v127;
  _anonymous_namespace_ *v128;
  _anonymous_namespace_ **v129;
  NSObject *v130;
  uint32_t v131;
  unint64_t v132;
  unint64_t v133;
  char v134;
  unsigned int v135;
  unsigned int v136;
  _anonymous_namespace_ *v137;
  unint64_t v138;
  char *v139;
  _anonymous_namespace_ **v140;
  _anonymous_namespace_ *v141;
  _anonymous_namespace_ *v142;
  _anonymous_namespace_ **v143;
  unint64_t v144;
  _anonymous_namespace_ **v145;
  _anonymous_namespace_ **v146;
  int v147;
  _anonymous_namespace_ **v148;
  _anonymous_namespace_ *v149;
  _anonymous_namespace_ **v150;
  _anonymous_namespace_ **v151;
  unint64_t v152;
  _anonymous_namespace_ **v153;
  _anonymous_namespace_ **v154;
  int v155;
  uint64_t v158;
  const char *v159;
  const char *v160;
  const char *v161;
  uint64_t v162;
  const char *v163;
  const char *v164;
  uint64_t v165;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  os_unfair_lock_s *v176;
  _anonymous_namespace_ **v177;
  _anonymous_namespace_ *v178;
  uint64_t v179;
  uint8_t buf[4];
  uint64_t v181;
  __int16 v182;
  _BYTE v183[10];
  _BYTE v184[10];
  _WORD v185[15];

  v1 = a1;
  *(_QWORD *)&v185[11] = *MEMORY[0x1E0C80C00];
  v178 = 0;
  v179 = 0;
  v2 = a1 + 18;
  os_unfair_lock_lock(a1 + 18);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v53 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v53;
    _os_log_debug_impl(&dword_1A0957000, v4, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist linkage", buf, 0xCu);
  }

  os_unfair_lock_opaque = v1[2]._os_unfair_lock_opaque;
  if (!(_DWORD)os_unfair_lock_opaque)
    goto LABEL_19;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  while (1)
  {
    v10 = *(unint64_t **)(*(_QWORD *)(*(_QWORD *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * v7);
    if (v10)
      break;
LABEL_14:
    ++v7;
    ++v9;
    v8 = v7 >= os_unfair_lock_opaque;
    if (v7 == os_unfair_lock_opaque)
      goto LABEL_19;
  }
  v11 = *v10;
  if (*v10)
  {
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v54 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
      *(_DWORD *)buf = 134218240;
      v181 = v54;
      v182 = 1024;
      *(_DWORD *)v183 = v7;
      _os_log_error_impl(&dword_1A0957000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: list node at level %u is not a list head", buf, 0x12u);

      goto LABEL_18;
    }
    goto LABEL_17;
  }
  v12 = (unint64_t)(16 << (os_unfair_lock_opaque - 1)) >> (os_unfair_lock_opaque
                                                                                   + ~v9
                                                                                   + 4);
  while (1)
  {
    v13 = (unint64_t **)v10[1];
    if (!v13)
    {
      v11 = (v11 + 1);
LABEL_13:
      if (v12 < v11)
      {
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          v56 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
          *(_DWORD *)buf = 134218240;
          v181 = v56;
          v182 = 1024;
          *(_DWORD *)v183 = v7;
          _os_log_error_impl(&dword_1A0957000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: freelist at level %u does not terminate before maximum size", buf, 0x12u);

          goto LABEL_18;
        }
LABEL_17:

        goto LABEL_18;
      }
      goto LABEL_14;
    }
    if (*v13 != v10)
      break;
    v11 = (v11 + 1);
    v10 = (unint64_t *)v10[1];
    if (v12 < v11)
      goto LABEL_13;
  }
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    goto LABEL_17;
  v57 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
  *(_DWORD *)buf = 134218240;
  v181 = v57;
  v182 = 1024;
  *(_DWORD *)v183 = v7;
  _os_log_error_impl(&dword_1A0957000, v14, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: list node at level %u has corrupt back link", buf, 0x12u);

LABEL_18:
  if (!v8)
    goto LABEL_241;
LABEL_19:
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v55 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v55;
    _os_log_debug_impl(&dword_1A0957000, v15, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist nodes are valid blocks", buf, 0xCu);
  }

  v17 = v1[2]._os_unfair_lock_opaque;
  if ((_DWORD)v17)
  {
    for (i = 0; i < v17; ++i)
    {
      v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * i);
      if (v19)
      {
        v20 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
        v21 = 16 << (v17 + ~(_BYTE)i);
        do
        {
          if (v20 > v19)
            goto LABEL_80;
          v16 = (_anonymous_namespace_ *)(v21 + v19);
          v22 = v1[2]._os_unfair_lock_opaque;
          if (v21 + v19 > (16 << (v17 - 1)) + *(_QWORD *)&v1->_os_unfair_lock_opaque)
            goto LABEL_80;
          while (1)
          {
            v16 = (_anonymous_namespace_ *)(16 << (v22 - 1));
            if ((_anonymous_namespace_ *)v21 == v16)
              break;
            if (!--v22)
              goto LABEL_80;
          }
          if (((v19 - v20) & (v21 - 1)) != 0)
          {
LABEL_80:
            v50 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v58 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
              *(_DWORD *)buf = 134218240;
              v181 = v58;
              v182 = 1024;
              *(_DWORD *)v183 = i;
              v59 = "_PASBuddyAllocator 0x%lx integrityCheck: freelist node at level %u identifies an invalid block";
              goto LABEL_92;
            }
            goto LABEL_81;
          }
          v19 = *(_QWORD *)(v19 + 8);
        }
        while (v19);
      }
    }
  }
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    v62 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v62;
    _os_log_debug_impl(&dword_1A0957000, v23, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist blocks are pairwise disjoint", buf, 0xCu);
  }

  v178 = 0;
  v179 = 0;
  v176 = v2;
  v177 = &v178;
  v25 = v1[2]._os_unfair_lock_opaque;
  if (!(_DWORD)v25)
    goto LABEL_116;
  v26 = 0;
  for (j = 0; j < v25; ++j)
  {
    v28 = v1;
    v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v1[16]._os_unfair_lock_opaque + 40) + 8 * j);
    if (!v29)
      goto LABEL_75;
    do
    {
      v30 = v178;
      v31 = &v178;
      v32 = &v178;
      if (!v178)
        goto LABEL_45;
      do
      {
        while (1)
        {
          v32 = (_anonymous_namespace_ **)v30;
          v33 = *((_QWORD *)v30 + 4);
          if (v33 <= v29)
            break;
          v30 = *v32;
          v31 = v32;
          if (!*v32)
            goto LABEL_45;
        }
        if (v33 >= v29)
        {
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v63 = *(_QWORD *)&v28->_os_unfair_lock_opaque;
            *(_DWORD *)buf = 134218240;
            v181 = v63;
            v182 = 1024;
            *(_DWORD *)v183 = j;
            _os_log_error_impl(&dword_1A0957000, v50, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: freelist node at level %u has same starting address as another node", buf, 0x12u);
          }
          v51 = 0;
          v2 = v176;
          goto LABEL_85;
        }
        v30 = v32[1];
      }
      while (v30);
      v31 = v32 + 1;
LABEL_45:
      v24 = (_anonymous_namespace_ *)operator new(0x30uLL);
      *((_QWORD *)v24 + 4) = v29;
      *((_QWORD *)v24 + 5) = 16 << (v25 + ~(_BYTE)j);
      *(_QWORD *)v24 = 0;
      *((_QWORD *)v24 + 1) = 0;
      *((_QWORD *)v24 + 2) = v32;
      *v31 = v24;
      if (*v177)
      {
        v177 = (_anonymous_namespace_ **)*v177;
        v24 = *v31;
      }
      v34 = v178;
      v35 = v24 == v178;
      *((_BYTE *)v24 + 24) = v24 == v178;
      v2 = v176;
      if (!v35)
      {
        do
        {
          v36 = *((_QWORD *)v24 + 2);
          if (*(_BYTE *)(v36 + 24))
            break;
          v37 = *(_anonymous_namespace_ **)(v36 + 16);
          v38 = *(_QWORD *)v37;
          if (*(_QWORD *)v37 == v36)
          {
            v41 = *((_QWORD *)v37 + 1);
            if (!v41 || (v42 = *(unsigned __int8 *)(v41 + 24), v39 = (_BYTE *)(v41 + 24), v42))
            {
              if (*(_anonymous_namespace_ **)v36 == v24)
              {
                v43 = (uint64_t *)*((_QWORD *)v24 + 2);
              }
              else
              {
                v43 = *(uint64_t **)(v36 + 8);
                v44 = *v43;
                *(_QWORD *)(v36 + 8) = *v43;
                if (v44)
                {
                  *(_QWORD *)(v44 + 16) = v36;
                  v37 = *(_anonymous_namespace_ **)(v36 + 16);
                }
                v43[2] = (uint64_t)v37;
                *(_QWORD *)(*(_QWORD *)(v36 + 16) + 8 * (**(_QWORD **)(v36 + 16) != v36)) = v43;
                *v43 = v36;
                *(_QWORD *)(v36 + 16) = v43;
                v37 = (_anonymous_namespace_ *)v43[2];
                v36 = *(_QWORD *)v37;
              }
              *((_BYTE *)v43 + 24) = 1;
              *((_BYTE *)v37 + 24) = 0;
              v47 = *(_QWORD *)(v36 + 8);
              *(_QWORD *)v37 = v47;
              if (v47)
                *(_QWORD *)(v47 + 16) = v37;
              *(_QWORD *)(v36 + 16) = *((_QWORD *)v37 + 2);
              *(_QWORD *)(*((_QWORD *)v37 + 2) + 8 * (**((_QWORD **)v37 + 2) != (_QWORD)v37)) = v36;
              *(_QWORD *)(v36 + 8) = v37;
              goto LABEL_73;
            }
          }
          else if (!v38 || (v40 = *(unsigned __int8 *)(v38 + 24), v39 = (_BYTE *)(v38 + 24), v40))
          {
            if (*(_anonymous_namespace_ **)v36 == v24)
            {
              v45 = *((_QWORD *)v24 + 1);
              *(_QWORD *)v36 = v45;
              if (v45)
              {
                *(_QWORD *)(v45 + 16) = v36;
                v37 = *(_anonymous_namespace_ **)(v36 + 16);
              }
              *((_QWORD *)v24 + 2) = v37;
              *(_QWORD *)(*(_QWORD *)(v36 + 16) + 8 * (**(_QWORD **)(v36 + 16) != v36)) = v24;
              *((_QWORD *)v24 + 1) = v36;
              *(_QWORD *)(v36 + 16) = v24;
              v37 = (_anonymous_namespace_ *)*((_QWORD *)v24 + 2);
            }
            else
            {
              v24 = (_anonymous_namespace_ *)*((_QWORD *)v24 + 2);
            }
            *((_BYTE *)v24 + 24) = 1;
            *((_BYTE *)v37 + 24) = 0;
            v36 = *((_QWORD *)v37 + 1);
            v46 = *(_anonymous_namespace_ **)v36;
            *((_QWORD *)v37 + 1) = *(_QWORD *)v36;
            if (v46)
              *((_QWORD *)v46 + 2) = v37;
            *(_QWORD *)(v36 + 16) = *((_QWORD *)v37 + 2);
            *(_QWORD *)(*((_QWORD *)v37 + 2) + 8 * (**((_QWORD **)v37 + 2) != (_QWORD)v37)) = v36;
            *(_QWORD *)v36 = v37;
LABEL_73:
            *((_QWORD *)v37 + 2) = v36;
            break;
          }
          *(_BYTE *)(v36 + 24) = 1;
          v24 = v37;
          *((_BYTE *)v37 + 24) = v37 == v34;
          *v39 = 1;
        }
        while (v37 != v34);
      }
      v179 = ++v26;
      v29 = *(_QWORD *)(v29 + 8);
    }
    while (v29);
LABEL_75:
    v1 = v28;
  }
  if (v177 != &v178)
  {
    v48 = v177[1];
    if (v48)
    {
      do
      {
        v49 = (_anonymous_namespace_ **)v48;
        v48 = *(_anonymous_namespace_ **)v48;
      }
      while (v48);
    }
    else
    {
      v64 = v177;
      do
      {
        v49 = (_anonymous_namespace_ **)v64[2];
        v35 = *v49 == (_anonymous_namespace_ *)v64;
        v64 = v49;
      }
      while (!v35);
    }
    if (v49 != &v178)
    {
      LOBYTE(v65) = 0;
      v67 = v177[4];
      v66 = v177[5];
      do
      {
        v68 = v49[4];
        v69 = v49[5];
        if (v67 <= v68)
          v70 = v49[4];
        else
          v70 = v67;
        v71 = (_anonymous_namespace_ *)((char *)v67 + (_QWORD)v66);
        if ((char *)v68 + (unint64_t)v69 < (char *)v71)
          v71 = (_anonymous_namespace_ *)((char *)v68 + (_QWORD)v69);
        v72 = v70 < v71;
        if ((_BYTE)v65)
          v65 = 1;
        else
          v65 = v72;
        v73 = v49[1];
        if (v73)
        {
          do
          {
            v74 = (_anonymous_namespace_ **)v73;
            v73 = *(_anonymous_namespace_ **)v73;
          }
          while (v73);
        }
        else
        {
          do
          {
            v74 = (_anonymous_namespace_ **)v49[2];
            v35 = *v74 == (_anonymous_namespace_ *)v49;
            v49 = v74;
          }
          while (!v35);
        }
        v67 = v68;
        v66 = v69;
        v49 = v74;
      }
      while (v74 != &v178);
      if (v65)
      {
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v75 = *(_QWORD *)&v28->_os_unfair_lock_opaque;
          *(_DWORD *)buf = 134217984;
          v181 = v75;
          v59 = "_PASBuddyAllocator 0x%lx integrityCheck: freelist blocks are not pairwise disjoint";
          v60 = v50;
          v61 = 12;
          goto LABEL_93;
        }
        goto LABEL_81;
      }
    }
  }
LABEL_116:
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
  {
    v165 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v165;
    _os_log_debug_impl(&dword_1A0957000, v76, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying freelist blocks are consistent with count of bytes allocated", buf, 0xCu);
  }

  v78 = v177;
  if (v177 == &v178)
  {
    v79 = 0;
  }
  else
  {
    v79 = 0;
    do
    {
      v80 = v78[1];
      v81 = v78;
      if (v80)
      {
        do
        {
          v82 = (_anonymous_namespace_ **)v80;
          v80 = *(_anonymous_namespace_ **)v80;
        }
        while (v80);
      }
      else
      {
        do
        {
          v82 = (_anonymous_namespace_ **)v81[2];
          v35 = *v82 == (_anonymous_namespace_ *)v81;
          v81 = v82;
        }
        while (!v35);
      }
      v79 += (uint64_t)v78[5];
      v78 = v82;
    }
    while (v82 != &v178);
  }
  v83 = *(_QWORD *)(*(_QWORD *)&v1[16]._os_unfair_lock_opaque + 16);
  v84 = v1[2]._os_unfair_lock_opaque;
  if (!v84)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v172, "handleFailureInFunction:file:lineNumber:description:", v173, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

  }
  v85 = objc_claimAutoreleasedReturnValue();
  v50 = v85;
  if (v83 + v79 != 16 << (v84 - 1))
  {
    v2 = v176;
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
    {
      v102 = v1;
      v103 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
      v104 = *(_QWORD *)(*(_QWORD *)&v102[16]._os_unfair_lock_opaque + 16);
      v105 = v102[2]._os_unfair_lock_opaque;
      if (!v105)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "handleFailureInFunction:file:lineNumber:description:", v175, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

        v2 = v176;
      }
      *(_DWORD *)buf = 134218752;
      v181 = v103;
      v182 = 2048;
      *(_QWORD *)v183 = v104;
      *(_WORD *)&v183[8] = 2048;
      *(_QWORD *)v184 = v79;
      *(_WORD *)&v184[8] = 2048;
      *(_QWORD *)v185 = 16 << (v105 - 1);
      v59 = "_PASBuddyAllocator 0x%lx integrityCheck: inconsistent heap usage (%zu allocated, %zu free, %zu total size)";
      v60 = v50;
      v61 = 42;
      goto LABEL_93;
    }
LABEL_81:
    v51 = 0;
    goto LABEL_85;
  }
  v2 = v176;
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
  {
    v168 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v168;
    _os_log_debug_impl(&dword_1A0957000, v50, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying split blocks do not appear in the freelist", buf, 0xCu);
  }

  v87 = v1[2]._os_unfair_lock_opaque;
  v88 = v87 - 1;
  if (v87 != 1)
  {
    v89 = 0;
    v90 = 0;
    v91 = 0;
    v92 = 0;
LABEL_135:
    v93 = 0;
    v94 = 16 << (v87 + ~v91);
    while (1)
    {
      if (((*(unsigned __int8 *)(**(_QWORD **)&v1[16]._os_unfair_lock_opaque + ((unint64_t)v92 >> 3)) >> (v92 & 7)) & 1) != 0
        && v178)
      {
        v95 = *(_QWORD *)&v1->_os_unfair_lock_opaque + v94 * v93;
        v96 = (_anonymous_namespace_ *)&v178;
        v97 = v178;
        do
        {
          v98 = v97;
          v86 = v96;
          v99 = *((_QWORD *)v97 + 4);
          if (v99 >= v95)
            v96 = v97;
          else
            v97 = (_anonymous_namespace_ *)((char *)v97 + 8);
          v97 = *(_anonymous_namespace_ **)v97;
        }
        while (v97);
        if (v96 != (_anonymous_namespace_ *)&v178)
        {
          v100 = v99 >= v95 ? v98 : v86;
          if (*((_QWORD *)v100 + 4) == v95)
          {
            v101 = v99 >= v95 ? v98 : v86;
            if (*((_QWORD *)v101 + 5) == v94)
              break;
          }
        }
      }
      ++v92;
      if (++v93 >> v89)
      {
        ++v89;
        ++v91;
        v90 = v89 >= v88;
        if (v89 == v88)
          goto LABEL_162;
        goto LABEL_135;
      }
    }
    v106 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      v171 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
      *(_DWORD *)buf = 134218496;
      v181 = v171;
      v182 = 1024;
      *(_DWORD *)v183 = v93;
      *(_WORD *)&v183[4] = 1024;
      *(_DWORD *)&v183[6] = v89;
      _os_log_error_impl(&dword_1A0957000, v106, OS_LOG_TYPE_ERROR, "_PASBuddyAllocator 0x%lx integrityCheck: split block %u at level %u was found in the freelist", buf, 0x18u);
    }

    if (!v90)
    {
LABEL_241:
      v52 = 0;
      goto LABEL_242;
    }
  }
LABEL_162:
  v107 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG))
  {
    v169 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v169;
    _os_log_debug_impl(&dword_1A0957000, v107, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying buddy pairs are not simultaneously in freelists", buf, 0xCu);
  }

  v109 = v177;
  if (v177 != &v178)
  {
    v110 = v1[2]._os_unfair_lock_opaque;
    v111 = v110;
    do
    {
      v113 = v109[4];
      v112 = v109[5];
      if (v111)
      {
        v114 = 0;
        v115 = -1;
        while ((_anonymous_namespace_ *)(16 << (v111 + v115)) != v112)
        {
          ++v114;
          --v115;
          if ((char *)v111 == v114)
            goto LABEL_170;
        }
        if (!(_DWORD)v114)
          goto LABEL_191;
      }
      else
      {
LABEL_170:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v114 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL (anonymous namespace)::BuddyAllocator::integrityCheck_verifyFreeListsHaveNoBuddyPairs(const std::set<BlockRange> &) const");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v116, CFSTR("_PASBuddyAllocator.mm"), 479, CFSTR("Failed to find level for block size"));

        v110 = v1[2]._os_unfair_lock_opaque;
        LODWORD(v114) = -1;
      }
      if (((((unint64_t)v113 - *(_QWORD *)&v1->_os_unfair_lock_opaque) >> (v110 + ~(_BYTE)v114)) & 0x10) != 0)
        v117 = -16;
      else
        v117 = 16;
      v118 = v178;
      if (!v178)
        goto LABEL_190;
      v119 = (unint64_t)v113 + (v117 << (v110 + ~(_BYTE)v114));
      v120 = &v178;
      do
      {
        v121 = (_anonymous_namespace_ **)v118;
        v122 = v120;
        v123 = *((_QWORD *)v118 + 4);
        v124 = (_anonymous_namespace_ **)((char *)v118 + 8);
        if (v123 >= v119)
        {
          v124 = v121;
          v120 = v121;
        }
        v118 = *v124;
      }
      while (v118);
      if (v120 != &v178 && (v123 >= v119 ? (v125 = v121) : (v125 = v122), v125[4] == (_anonymous_namespace_ *)v119))
      {
        if (v123 >= v119)
          v126 = v121;
        else
          v126 = v122;
        v127 = v126[5];
        v111 = v110;
        if (v127 == v112)
        {
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v167 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
            *(_DWORD *)buf = 134218240;
            v181 = v167;
            v182 = 1024;
            *(_DWORD *)v183 = (_DWORD)v114;
            v59 = "_PASBuddyAllocator 0x%lx integrityCheck: found buddy pair in freelist at level %u";
LABEL_92:
            v60 = v50;
            v61 = 18;
LABEL_93:
            _os_log_error_impl(&dword_1A0957000, v60, OS_LOG_TYPE_ERROR, v59, buf, v61);
          }
          goto LABEL_81;
        }
      }
      else
      {
LABEL_190:
        v111 = v110;
      }
LABEL_191:
      v128 = v109[1];
      if (v128)
      {
        do
        {
          v129 = (_anonymous_namespace_ **)v128;
          v128 = *(_anonymous_namespace_ **)v128;
        }
        while (v128);
      }
      else
      {
        do
        {
          v129 = (_anonymous_namespace_ **)v109[2];
          v35 = *v129 == (_anonymous_namespace_ *)v109;
          v109 = v129;
        }
        while (!v35);
      }
      v109 = v129;
    }
    while (v129 != &v178);
  }
  v130 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
  {
    v170 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
    *(_DWORD *)buf = 134217984;
    v181 = v170;
    _os_log_debug_impl(&dword_1A0957000, v130, OS_LOG_TYPE_DEBUG, "_PASBuddyAllocator 0x%lx integrityCheck: verifying half-allocation bitmap against freelists", buf, 0xCu);
  }

  v131 = v1[2]._os_unfair_lock_opaque;
  v132 = v131 - 1;
  if (v131 == 1)
  {
    v52 = 1;
    goto LABEL_242;
  }
  v133 = 0;
  v51 = 0;
  v134 = 0;
  v135 = 0;
  v52 = 1;
  while (2)
  {
    v136 = 0;
    v137 = (_anonymous_namespace_ *)(16 << (v131 - 2 - v133));
    do
    {
      if (!v178)
      {
        v147 = 0;
LABEL_233:
        v155 = 0;
        goto LABEL_234;
      }
      v138 = *(_QWORD *)&v1->_os_unfair_lock_opaque + (16 << (v131 + ~v134)) * v136;
      v139 = (char *)v137 + v138;
      v140 = &v178;
      v141 = v178;
      do
      {
        v142 = v141;
        v143 = v140;
        v144 = *((_QWORD *)v141 + 4);
        if (v144 >= v138)
          v140 = (_anonymous_namespace_ **)v141;
        else
          v141 = (_anonymous_namespace_ *)((char *)v141 + 8);
        v141 = *(_anonymous_namespace_ **)v141;
      }
      while (v141);
      if (v140 == &v178
        || (v144 >= v138 ? (v145 = (_anonymous_namespace_ **)v142) : (v145 = v143),
            v145[4] != (_anonymous_namespace_ *)v138))
      {
        v147 = 0;
      }
      else
      {
        if (v144 >= v138)
          v146 = (_anonymous_namespace_ **)v142;
        else
          v146 = v143;
        v147 = v146[5] == v137;
      }
      v148 = &v178;
      v149 = v178;
      do
      {
        v150 = (_anonymous_namespace_ **)v149;
        v151 = v148;
        v152 = *((_QWORD *)v149 + 4);
        if (v152 >= (unint64_t)v139)
          v148 = (_anonymous_namespace_ **)v149;
        else
          v149 = (_anonymous_namespace_ *)((char *)v149 + 8);
        v149 = *(_anonymous_namespace_ **)v149;
      }
      while (v149);
      if (v148 == &v178)
        goto LABEL_233;
      v153 = v152 >= (unint64_t)v139 ? v150 : v151;
      if (v153[4] != (_anonymous_namespace_ *)v139)
        goto LABEL_233;
      if (v152 >= (unint64_t)v139)
        v154 = v150;
      else
        v154 = v151;
      v155 = v154[5] == v137;
LABEL_234:
      if (((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)&v1[16]._os_unfair_lock_opaque + 8)
                                + ((unint64_t)v135 >> 3)) >> (v135 & 7)) & 1) != 0)
      {
        if (v147 == v155)
        {
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          {
            v158 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
            v159 = "allocated";
            *(_DWORD *)buf = 134219010;
            if (v147)
              v160 = "free";
            else
              v160 = "allocated";
            v181 = v158;
            v182 = 1024;
            if (v155)
              v159 = "free";
            *(_DWORD *)v183 = v136;
            *(_WORD *)&v183[4] = 1024;
            *(_DWORD *)&v183[6] = v133;
            *(_WORD *)v184 = 2080;
            *(_QWORD *)&v184[2] = v160;
            v185[0] = 2080;
            *(_QWORD *)&v185[1] = v159;
            v161 = "_PASBuddyAllocator 0x%lx integrityCheck: block %u in level %u has half-alloc set with left-child %s a"
                   "nd right-child %s";
LABEL_258:
            _os_log_error_impl(&dword_1A0957000, v50, OS_LOG_TYPE_ERROR, v161, buf, 0x2Cu);
          }
LABEL_85:

          v52 = v51;
          goto LABEL_242;
        }
      }
      else if ((v147 | v155) == 1)
      {
        v50 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          goto LABEL_85;
        v162 = *(_QWORD *)&v1->_os_unfair_lock_opaque;
        v163 = "allocated";
        *(_DWORD *)buf = 134219010;
        if (v147)
          v164 = "free";
        else
          v164 = "allocated";
        v181 = v162;
        v182 = 1024;
        if (v155)
          v163 = "free";
        *(_DWORD *)v183 = v136;
        *(_WORD *)&v183[4] = 1024;
        *(_DWORD *)&v183[6] = v133;
        *(_WORD *)v184 = 2080;
        *(_QWORD *)&v184[2] = v164;
        v185[0] = 2080;
        *(_QWORD *)&v185[1] = v163;
        v161 = "_PASBuddyAllocator 0x%lx integrityCheck: block %u in level %u has half-alloc bit clear with left-child %s"
               " and right-child %s";
        goto LABEL_258;
      }
      ++v135;
      ++v136;
    }
    while (!(v136 >> v133));
    ++v133;
    ++v134;
    v51 = v133 >= v132;
    if (v133 != v132)
      continue;
    break;
  }
LABEL_242:
  os_unfair_lock_unlock(v2);
  return v52 & 1;
}

void sub_1A098E7C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock, uint64_t a12, _QWORD *a13)
{
  void *v13;
  void *v14;
  void *v15;

  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void std::__tree<`anonymous namespace'::BuddyAllocator::BlockRange>::destroy(_QWORD *a1)
{
  if (a1)
  {
    operator delete(a1);
  }
}

unint64_t _PASBuddyAllocatorBufferSizeForHeapOfSize(unint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v5;

  v2 = 1;
  while (16 << (v2 - 1) < a1)
  {
    v2 = (v2 + 1);
    if (!(_DWORD)v2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "size_t proactive::pas::buddyalloc::blockStorageSizeForLevels");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_PASBuddyAllocatorPOD.h"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numLevels > 0"));

    }
  }
  return proactive::pas::buddyalloc::heapSizeForLevels((proactive::pas::buddyalloc *)v2);
}

void sub_1A098E958(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

id makeOptionLongHelp(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  if (objc_msgSend(v1, "count"))
    objc_msgSend(v2, "appendString:", CFSTR("\nOption Details:\n"));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v25;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v6);
        v8 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v7, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("--%@"), v9);

        objc_msgSend(v7, "shortName");
        v11 = objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          v12 = (void *)v11;
          objc_msgSend(v7, "shortName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "length");

          if (v14)
          {
            v15 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v7, "shortName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "name");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v15, "initWithFormat:", CFSTR("-%@, --%@"), v16, v17);

            v10 = (void *)v18;
          }
        }
        objc_msgSend(v7, "argMetavar");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v7, "argMetavar");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "helpDescription");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("  %@ %@ -- %@\n"), v10, v20, v21);

        }
        else
        {
          objc_msgSend(v7, "helpDescription");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR("  %@ -- %@\n"), v10, v20);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v4);
  }

  return v2;
}

id makeOptionShortHelp(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      v9 = v5;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
        objc_msgSend(v10, "argMetavar");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "name");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v11)
        {
          objc_msgSend(v10, "argMetavar");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v12, "initWithFormat:", CFSTR(" --%@ %@ "), v14, v15);

          v6 = (void *)v16;
        }
        else
        {
          v15 = v6;
          v6 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR(" --%@ "), v13);
        }

        if (objc_msgSend(v10, "required"))
          v17 = v6;
        else
          v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(" [%@] "), v6);
        v5 = v17;

        objc_msgSend(v2, "appendString:", v5);
        ++v8;
        v9 = v5;
      }
      while (v4 != v8);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);

  }
  return v2;
}

BOOL _PASEvaluateLogFaultAndProbCrashCriteria()
{
  uint64_t v0;
  unsigned __int8 v1;
  _BOOL8 v2;
  _QWORD *v4;
  unsigned __int8 v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = atomic_load(_PASLogFaultAndProbCrashArmed);
  if ((v1 & 1) != 0)
  {
    os_unfair_lock_lock(&_PASEvaluateLogFaultAndProbCrashCriteria__PASProbCrashLock);
    v4 = (_QWORD *)_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses;
    if (!_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses)
    {
      v5 = arc4random_uniform(_PASLogFaultAndProbCrashWindowSize);
      v6 = v5;
      _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount = v5;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v10[0] = 67109120;
        v10[1] = v6;
        _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "_PASEvaluateLogFaultAndProbCrashCriteria: Will skip %hhu unique callsite(s) before crashing", (uint8_t *)v10, 8u);
        v6 = _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount;
      }
      if (!v6)
        goto LABEL_15;
      v4 = malloc_type_calloc(v6, 8uLL, 0x80040B8603338uLL);
      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v9);
      }
      _PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddresses = (uint64_t)v4;
    }
    if (_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount)
    {
      v7 = 0;
      do
      {
        v8 = v4[v7];
        v2 = v8 != v0;
        if (v8 == v0)
          goto LABEL_17;
        if (!v8)
        {
          v2 = 0;
          v4[v7] = v0;
          goto LABEL_17;
        }
      }
      while (_PASEvaluateLogFaultAndProbCrashCriteria_seenReturnAddressesCount != ++v7);
    }
LABEL_15:
    v2 = 1;
LABEL_17:
    os_unfair_lock_unlock(&_PASEvaluateLogFaultAndProbCrashCriteria__PASProbCrashLock);
    return v2;
  }
  return 0;
}

void sub_1A0991C48(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t _pas_calculateDefaultGeoHash(double a1, double a2)
{
  return _pas_calculateGeoHash(0xEu, a1, a2);
}

uint64_t _pas_calculateGeoHash(unsigned int a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t result;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  if (a1 >= 0x20)
    v3 = 32;
  else
    v3 = a1;
  if (!(_DWORD)v3)
    return 0;
  result = 0;
  v5 = 180.0;
  v6 = -90.0;
  v7 = -180.0;
  v8 = 90.0;
  do
  {
    v9 = (v8 + v6) * 0.5;
    v10 = (v7 + v5) * 0.5;
    if (v9 < a2)
      v6 = (v8 + v6) * 0.5;
    else
      v8 = (v8 + v6) * 0.5;
    if (v10 >= a3)
      v5 = (v7 + v5) * 0.5;
    else
      v7 = (v7 + v5) * 0.5;
    result = (v10 < a3) | (2 * (v9 >= a2)) | (4 * result);
    --v3;
  }
  while (v3);
  return result;
}

void cfDeallocateReleaseBackingObject(int a1, CFTypeRef cf)
{
  CFRelease(cf);
}

uint64_t advanceCursor(uint64_t a1, char *a2, _DWORD *a3)
{
  unint64_t v4;
  char *v5;
  unsigned int RuneUtf8;
  int v7;
  unsigned int v8;
  int v10;

  v4 = *a3;
  v5 = (char *)(a1 + (v4 >> 8));
  v10 = 0;
  RuneUtf8 = getRuneUtf8(v5, a2, &v10);
  v7 = v10;
  v8 = v10 - 1114112;
  if ((v4 & 0x80) != 0 || v8 < 0xFFF00000)
  {
    *a3 = (v4 + ((RuneUtf8 - (_DWORD)v5) << 8)) & 0xFFFFFF7F;
    if (v8 >> 20 != 4095)
      return (unsigned __int16)v7;
    if ((v4 & 0x80) != 0)
    {
      LOWORD(v7) = v7 & 0x3FF | 0xDC00;
      return (unsigned __int16)v7;
    }
  }
  else
  {
    *a3 = v4 | 0x80;
  }
  return (unsigned __int16)(((v7 + 67043328) >> 10) - 10240);
}

char *getRuneUtf8(char *a1, char *a2, int *a3)
{
  char *v3;
  int v4;
  int v5;
  char *v6;
  int v7;
  uint64_t v8;
  int v9;
  char v10;

  if (a1 == a2)
    goto LABEL_19;
  v4 = *a1;
  v3 = a1 + 1;
  v5 = v4;
  if ((v4 & 0x80000000) == 0)
  {
    v6 = v3;
    goto LABEL_20;
  }
  if ((v5 & 0xE0) == 0xC0)
  {
    v7 = v5 & 0x1F;
    LODWORD(v8) = 1;
    goto LABEL_10;
  }
  if ((v5 & 0xF0) == 0xE0)
  {
    v7 = v5 & 0xF;
    LODWORD(v8) = 2;
    goto LABEL_10;
  }
  if ((v5 & 0xF8) == 0xF0)
  {
    v7 = v5 & 7;
    LODWORD(v8) = 3;
LABEL_10:
    v9 = v8 + 1;
    v6 = v3;
    while (v6 != a2)
    {
      v10 = *v6++;
      v5 = v10 & 0x3F | (v7 << 6);
      --v9;
      v7 = v5;
      if (v9 <= 1)
        goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v3 == a2)
  {
LABEL_19:
    v5 = 0;
    v6 = 0;
    goto LABEL_20;
  }
  v8 = 0;
  while (1)
  {
    v6 = &v3[v8];
    if ((v3[v8] & 0x80000000) == 0)
      break;
    v5 = 0;
    v6 = 0;
    if (&v3[++v8] == a2)
      goto LABEL_20;
  }
  v7 = 65533;
  v3 += v8;
  v5 = 65533;
  if ((_DWORD)v8)
    goto LABEL_10;
LABEL_20:
  *a3 = v5;
  return v6;
}

void sub_1A099593C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A0995954(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1A0995A98);
}

void sub_1A099595C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, int buf, uint64_t a17, uint64_t a18, const __CFString *a19, const __CFString *a20,uint64_t a21,id a22)
{
  id v22;
  id v23;
  void *v24;
  void *v25;

  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(a1);
      JUMPOUT(0x1A099575CLL);
    }
    v22 = objc_begin_catch(a1);
    if (!+[_PASDeviceInfo isInternalBuild](_PASDeviceInfo, "isInternalBuild") && a15)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        buf = 138412290;
        _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "A bogus or corrupt journal file was found and has been cleaned up. Relaunching: %@", (uint8_t *)&buf, 0xCu);
      }
      v24 = (void *)MEMORY[0x1E0C99DA0];
      a19 = CFSTR("fullPath");
      a20 = CFSTR("originalException");
      a22 = v22;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a21, &a19, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "exceptionWithName:reason:userInfo:", CFSTR("_PASDatabaseJournalWillRecoverOnNextLaunch"), CFSTR("A bogus or corrupt journal file was found and has been cleaned up. Relaunching."), v25);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = objc_retainAutorelease(v22);
    }
    objc_exception_throw(v23);
  }
  _Unwind_Resume(a1);
}

void sub_1A0995A84(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A099596CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1A0996234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  objc_end_catch();
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

BOOL _sqliteErrorIndicatesDeviceBecameLocked(void *a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("sqliteCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = objc_msgSend(v2, "integerValue") == 778;
  else
    v3 = 0;

  return v3;
}

void sub_1A09969B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id wrongVersionError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  v2 = (void *)objc_opt_new();
  v3 = v2;
  if (v1)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported format version: %@"), v1);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2D50]);

  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Unsupported format version."), *MEMORY[0x1E0CB2D50]);
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0CB2D68]);

  v5 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v6 = (void *)objc_msgSend(v3, "copy");
  v7 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 3, v6);

  return v7;
}

id fileAccessError(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = a2;
  v4 = a1;
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (v3)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("The file cannot be opened: %@"), v3);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CB2D50]);

  }
  else
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", CFSTR("The file cannot be opened."), *MEMORY[0x1E0CB2D50]);
  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *MEMORY[0x1E0CB2D68]);

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CB2AA0]);
  v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v9 = (void *)objc_msgSend(v6, "copy");
  v10 = (void *)objc_msgSend(v8, "initWithDomain:code:userInfo:", CFSTR("_PASLazyPlistErrorDomain"), 1, v9);

  return v10;
}

void sub_1A09991C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0999280(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2044(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2045(uint64_t a1)
{

}

void sub_1A0999634(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A099994C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A099996C(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A0999914);
}

uint64_t computeHashes_MURMUR3_X64_128(_QWORD *a1, int a2, unsigned int a3, uint64_t *a4, uint64_t a5)
{
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  uint64x2_t v16;
  uint64_t v17;
  _DWORD *v18;
  int32x2_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64x2_t v24;
  uint64_t v25;
  _DWORD *v26;
  int v27;
  int32x2_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;

  v31 = 0;
  v32 = 0;
  result = _PAS_MurmurHash3_x64_128(a4, a5, a3, &v31);
  v9 = v31;
  v8 = v32;
  *a1 = v31;
  a1[1] = v8;
  if (a2 >= 5)
  {
    v10 = 0;
    v11 = HIDWORD(v9);
    v12 = a2;
    v13 = 6;
    if (a2 <= 6uLL)
      v14 = 6;
    else
      v14 = a2;
    v15 = (unint64_t)(v14 - 5) >> 1;
    v16 = (uint64x2_t)vdupq_n_s64(v15);
    v17 = (v15 & 0x7FFFFFFFFFFFFFFELL) + 2;
    v18 = a1 + 3;
    result = (4 * HIDWORD(v9));
    do
    {
      v19 = vmovn_s64((int64x2_t)vcgeq_u64(v16, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v10), (int8x16_t)xmmword_1A09B9530)));
      if ((v19.i8[0] & 1) != 0)
      {
        v20 = 715827883 * ((v13 - 2) * (v13 - 2) - 1) * (v13 - 2);
        *(v18 - 2) = result + v9 + HIDWORD(v20) + (v20 >> 63);
      }
      if ((v19.i8[4] & 1) != 0)
      {
        v21 = 715827883 * (v13 * v13 - 1) * v13;
        *v18 = 6 * v11 + v9 + HIDWORD(v21) + (v21 >> 63);
      }
      v10 += 2;
      v18 += 4;
      LODWORD(v9) = v9 + result;
      v13 += 4;
    }
    while (v17 != v10);
    if (a2 >= 6)
    {
      v22 = 0;
      if (a2 <= 7uLL)
        v12 = 7;
      v23 = (unint64_t)(v12 - 6) >> 1;
      v24 = (uint64x2_t)vdupq_n_s64(v23);
      v25 = (v23 & 0x7FFFFFFFFFFFFFFELL) + 2;
      v26 = (_DWORD *)a1 + 7;
      v27 = 5;
      do
      {
        v28 = vmovn_s64((int64x2_t)vcgeq_u64(v24, (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v22), (int8x16_t)xmmword_1A09B9530)));
        if ((v28.i8[0] & 1) != 0)
        {
          v29 = 715827883 * (v27 * v27 - 1) * v27;
          *(v26 - 2) = 5 * HIDWORD(v8) + v8 + HIDWORD(v29) + (v29 >> 63);
        }
        result = v28.u32[1];
        if ((v28.i8[4] & 1) != 0)
        {
          v30 = 715827883 * ((v27 + 2) * (v27 + 2) - 1) * (v27 + 2);
          result = 7 * HIDWORD(v8) + (_DWORD)v8 + HIDWORD(v30) + (v30 >> 63);
          *v26 = result;
        }
        v22 += 2;
        v27 += 4;
        v26 += 4;
        LODWORD(v8) = v8 + 4 * HIDWORD(v8);
      }
      while (v25 != v22);
    }
  }
  return result;
}

unsigned __int16 *computeHashes_MURMUR3_X86_32(int *a1, int a2, int a3, unsigned __int16 *a4, signed int a5)
{
  unsigned __int16 *result;
  int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  unsigned int v15;
  int v16;

  v16 = 0;
  result = _PAS_MurmurHash3_x86_32(a4, a5, a3, (unsigned int *)&v16);
  v10 = v16;
  *a1 = v16;
  if (a2 != 1)
  {
    v15 = 0;
    result = _PAS_MurmurHash3_x86_32(a4, a5, v10, &v15);
    v11 = v15;
    a1[1] = v15;
    if (a2 >= 3)
    {
      v12 = v11 + 1;
      v13 = v10 + v11;
      v14 = 2;
      do
      {
        v13 += v12;
        v12 += v14;
        a1[v14++] = v13;
      }
      while (a2 != v14);
    }
  }
  return result;
}

void sub_1A099B448(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t levenshtein<char>(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5;
  int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unsigned int i;
  uint64_t v18;
  int v19;
  size_t v20;
  size_t v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD *v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  int v35;
  int v37;
  id v38;
  size_t v39;
  unint64_t v40;
  uint64_t v41;
  void *memptr;
  uint64_t v43;
  uint64_t v44;

  v5 = a3;
  v8 = 0;
  v9 = 0;
  v44 = *MEMORY[0x1E0C80C00];
  if (a3 >= a4)
    v10 = a4;
  else
    v10 = a3;
  if (a4 <= a3)
    v11 = a3;
  else
    v11 = a4;
  while (*(unsigned __int8 *)(a1 + v9) == *(unsigned __int8 *)(a2 + v9))
  {
    ++v9;
    --v8;
    if (!(v10 + v8))
    {
      v12 = 0;
      return v11 - v10 + v12;
    }
  }
  v13 = 0;
  v14 = a3 + v8;
  v15 = v10 + v8;
  v12 = -v15;
  v16 = a4 - 1;
  for (i = a3 - 1; *(unsigned __int8 *)(a1 + i) == *(unsigned __int8 *)(a2 + v16); --i)
  {
    --v14;
    ++v13;
    --v16;
    if (v15 == v13)
    {
      v10 = v9;
      return v11 - v10 + v12;
    }
  }
  v19 = v9 + v13;
  LODWORD(v40) = v11;
  v20 = 4 * (v11 - ((_DWORD)v9 + v13)) + 4;
  memptr = 0;
  v43 = 0;
  v41 = v20 | 3;
  v39 = v20;
  if ((v20 | 3) > 0x7D0)
  {
    v37 = malloc_type_posix_memalign(&memptr, 8uLL, v20, 0x3DC39743uLL);
    LOBYTE(v43) = 0;
    if (v37)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0, v39);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v38);
    }
    v22 = memptr;
  }
  else
  {
    MEMORY[0x1E0C80A78](a1);
    v22 = (_DWORD *)((char *)&v39 - ((v21 + 15) & 0x1FFFFFFF0));
    bzero(v22, v21);
  }
  v23 = v40;
  v40 = a4 + v8 - v13;
  v24 = (v23 + v8 - v13);
  bzero(v22, v39);
  v25 = 0;
  do
  {
    v22[v25] = v25;
    ++v25;
  }
  while (v24 + 1 != v25);
  v26 = v41;
  if (v19 != v5)
  {
    v27 = 0;
    if (v14 <= 1)
      v28 = 1;
    else
      v28 = v14;
    v29 = v40;
    if (v40 <= 1)
      v29 = 1;
    v30 = v22 + 1;
    do
    {
      v31 = *(unsigned __int8 *)(a1 + (v9 + v27));
      v32 = v27 + 1;
      *v22 = v27 + 1;
      if (v19 != a4)
      {
        v33 = 0;
        v34 = v27 + 1;
        do
        {
          if (*(unsigned __int8 *)(a2 + (v9 + v33)) != v31)
            LODWORD(v27) = v27 + 1;
          v35 = v30[v33];
          if (v35 + 1 >= v34 + 1)
            ++v34;
          else
            v34 = v35 + 1;
          if (v34 >= v27)
            v34 = v27;
          v30[v33++] = v34;
          LODWORD(v27) = v35;
        }
        while (v29 != v33);
      }
      v27 = v32;
    }
    while (v32 != v28);
    v5 = v9 + v13;
  }
  v18 = v22[a4 - v5];
  if (v26 > 0x7D0)
    free(v22);
  return v18;
}

uint64_t levenshtein<unsigned int>(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  unsigned int v5;
  unsigned int v6;
  int v9;
  uint64_t v10;
  unsigned int v11;
  int v12;
  unsigned int v13;
  uint64_t v14;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  size_t v22;
  size_t v23;
  _DWORD *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _DWORD *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  int v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  size_t v41;
  unsigned int v42;
  uint64_t v43;
  void *memptr;
  uint64_t v45;
  uint64_t v46;

  v5 = a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (a3 >= a4)
    v6 = a4;
  else
    v6 = a3;
  if (v6)
  {
    v9 = 0;
    v10 = 0;
    if (a4 <= a3)
      v11 = a3;
    else
      v11 = a4;
    while (*(_DWORD *)(a1 + 4 * v10) == *(_DWORD *)(a2 + 4 * v10))
    {
      ++v10;
      --v9;
      if (!(v6 + v9))
        goto LABEL_10;
    }
    v16 = 0;
    v17 = a3 + v9;
    v18 = v6 + v9;
    v12 = -v18;
    v19 = a4 - 1;
    v20 = a3 - 1;
    while (*(_DWORD *)(a1 + 4 * v20) == *(_DWORD *)(a2 + 4 * v19))
    {
      --v17;
      ++v16;
      --v19;
      --v20;
      if (v18 == v16)
      {
        v6 = v10;
        goto LABEL_11;
      }
    }
    v21 = v10 + v16;
    v42 = v11;
    v22 = 4 * (v11 - ((_DWORD)v10 + v16)) + 4;
    memptr = 0;
    v45 = 0;
    v43 = v22 | 3;
    v41 = v22;
    if ((v22 | 3) > 0x7D0)
    {
      v37 = malloc_type_posix_memalign(&memptr, 8uLL, v22, 0x3DC39743uLL);
      LOBYTE(v45) = 0;
      if (v37)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v38 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v38);
      }
      v24 = memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](a1);
      v24 = (_DWORD *)((char *)&v39 - ((v23 + 15) & 0x1FFFFFFF0));
      bzero(v24, v23);
    }
    v40 = a4 + v9 - v16;
    v25 = v42 + v9 - v16;
    bzero(v24, v41);
    v26 = 0;
    do
    {
      v24[v26] = v26;
      ++v26;
    }
    while (v25 + 1 != v26);
    v27 = v43;
    if (v21 != v5)
    {
      v28 = 0;
      if (v17 <= 1)
        v29 = 1;
      else
        v29 = v17;
      v30 = v40;
      if (v40 <= 1)
        v30 = 1;
      v31 = v24 + 1;
      do
      {
        v32 = *(_DWORD *)(a1 + 4 * (v10 + v28));
        v33 = v28 + 1;
        *v24 = v28 + 1;
        if (v21 != a4)
        {
          v34 = 0;
          v35 = v28 + 1;
          do
          {
            if (*(_DWORD *)(a2 + 4 * (v10 + v34)) != v32)
              LODWORD(v28) = v28 + 1;
            v36 = v31[v34];
            if (v36 + 1 >= v35 + 1)
              ++v35;
            else
              v35 = v36 + 1;
            if (v35 >= v28)
              v35 = v28;
            v31[v34++] = v35;
            LODWORD(v28) = v36;
          }
          while (v30 != v34);
        }
        v28 = v33;
      }
      while (v33 != v29);
      v5 = v10 + v16;
    }
    v14 = v24[a4 - v5];
    if (v27 > 0x7D0)
      free(v24);
  }
  else
  {
LABEL_10:
    v12 = 0;
LABEL_11:
    if (a3 <= a4)
      v13 = a4;
    else
      v13 = a3;
    return v13 - v6 + v12;
  }
  return v14;
}

uint64_t __Block_byref_object_copy__2262(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2263(uint64_t a1)
{

}

void sub_1A099BE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A099BF98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void _PASMemoryHeavyOperation(void *a1)
{
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  qos_class_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASMemoryHeavyOperation(void (^__strong)(void))");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASMemoryHeavyOperationLock.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  if (_PASMemoryHeavyOperation_onceToken != -1)
    dispatch_once(&_PASMemoryHeavyOperation_onceToken, &__block_literal_global_2333);
  if (pthread_getspecific(_PASMemoryHeavyOperation_tlKey))
  {
    v2 = (void *)MEMORY[0x1A1AFDC98]();
    v1[2](v1);
    objc_autoreleasePoolPop(v2);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = ___PASMemoryHeavyOperation_block_invoke_2;
    v8[3] = &unk_1E4430548;
    v9 = v1;
    v3 = (void *)MEMORY[0x1A1AFDE78](v8);
    v4 = qos_class_self();
    v5 = _PASMemoryHeavyOperation_uiQueue;
    if (v4 <= 0x18)
    {
      dispatch_sync((dispatch_queue_t)_PASMemoryHeavyOperation_uiQueue, &__block_literal_global_9);
      v5 = _PASMemoryHeavyOperation_lowQueue;
    }
    dispatch_sync(v5, v3);

  }
}

void sub_1A099CE18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2370(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2371(uint64_t a1)
{

}

void sub_1A099DE8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A099EE00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id posixError(int a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0CB2D68];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", strerror(a1));
  v8[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v5 = (void *)objc_msgSend(v4, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], a1, v3);

  return v5;
}

uint64_t __Block_byref_object_copy__2560(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2561(uint64_t a1)
{

}

void sub_1A09A0698(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09A0AF8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09A0BE8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09A1450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 88), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2829(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AFDE78](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2830(uint64_t a1)
{

}

id currentOsBuild()
{
  if (getCurrentOsBuild_once != -1)
    dispatch_once(&getCurrentOsBuild_once, &__block_literal_global_32);
  return (id)getCurrentOsBuild_build;
}

id registerForLockStateChanges(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint32_t v5;
  uint32_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  int out_token;
  uint8_t buf[4];
  uint32_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  out_token = -1;
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __registerForLockStateChanges_block_invoke;
  v12 = &unk_1E44304F8;
  v13 = v3;
  v4 = v3;
  v5 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, a1, &v9);
  if (v5)
  {
    v6 = v5;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v6;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to register for kMobileKeyBagLockStatusNotificationID with error %u", buf, 8u);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", out_token, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void unregisterForLockStateChanges(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint32_t v4;
  uint32_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint32_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "intValue");
    v4 = notify_cancel(v3);
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v6[0] = 67109376;
        v6[1] = v3;
        v7 = 1024;
        v8 = v5;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to unregister notify token %d with error %u", (uint8_t *)v6, 0xEu);
      }
    }
  }

}

void registerOnceForFirstUnlock(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v1 = a1;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __registerOnceForFirstUnlock_block_invoke;
  block[3] = &unk_1E4430548;
  v7 = v1;
  v2 = registerOnceForFirstUnlock_onceToken;
  v3 = v1;
  v5 = v3;
  if (v2 == -1)
  {
    v4 = v3;
  }
  else
  {
    dispatch_once(&registerOnceForFirstUnlock_onceToken, block);
    v4 = v7;
  }

}

void __registerOnceForFirstUnlock_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  dispatch_get_global_queue(0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(id *)(a1 + 32);
  registerOnceForFirstUnlock_registrationToken = MKBEventsRegister();

}

void __registerOnceForFirstUnlock_block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v3 = (void *)MEMORY[0x1A1AFDE78](*(_QWORD *)(a1 + 32));
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Running MobileKeyBag class C unlock block: %@", (uint8_t *)&v8, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4 = (void *)MEMORY[0x1A1AFDE78](*(_QWORD *)(a1 + 32));
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Ran MobileKeyBag class C unlock block: %@", (uint8_t *)&v8, 0xCu);

    }
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("_PASDeviceState.firstUnlockUnregistration", v6);

    dispatch_async(v7, &__block_literal_global_40);
  }
}

uint64_t __registerOnceForFirstUnlock_block_invoke_39()
{
  uint64_t result;

  result = MKBEventsUnregister();
  registerOnceForFirstUnlock_registrationToken = 0;
  return result;
}

uint64_t __registerForAKSEvents_block_invoke(uint64_t result, int a2, CFDictionaryRef theDict)
{
  void *v3;
  void *v4;
  uint64_t v6;
  CFTypeID v7;
  uint64_t (*v8)(void);
  CFTypeID v9;
  CFTypeID v10;
  uint8_t v11[16];
  uint8_t buf[8];
  void *value[7];

  if (a2 == 1)
  {
    value[5] = v3;
    value[6] = v4;
    v6 = result;
    value[0] = 0;
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E0CFD640], (const void **)value))
    {
      v7 = CFGetTypeID(value[0]);
      if (v7 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Cx expiring", buf, 2u);
          }
          v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
          return v8();
        }
      }
    }
    if (CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E0CFD638], (const void **)value))
    {
      v9 = CFGetTypeID(value[0]);
      if (v9 == CFBooleanGetTypeID())
      {
        if (CFBooleanGetValue((CFBooleanRef)value[0]))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Cx expired", buf, 2u);
          }
          v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
          return v8();
        }
      }
    }
    *(_QWORD *)buf = 0;
    result = CFDictionaryGetValueIfPresent(theDict, (const void *)*MEMORY[0x1E0CFD648], (const void **)value);
    if ((_DWORD)result)
    {
      v10 = CFGetTypeID(value[0]);
      result = CFNumberGetTypeID();
      if (v10 == result)
      {
        result = CFNumberGetValue((CFNumberRef)value[0], kCFNumberLongLongType, buf);
        if ((_DWORD)result)
        {
          switch(*(_DWORD *)buf)
          {
            case 0:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Unlocked", v11, 2u);
              }
              v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
              return v8();
            case 1:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Locked", v11, 2u);
              }
              v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
              return v8();
            case 2:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Locking", v11, 2u);
              }
              v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
              return v8();
            case 3:
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v11 = 0;
                _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "AKS: Disabled", v11, 2u);
              }
              v8 = *(uint64_t (**)(void))(*(_QWORD *)(v6 + 32) + 16);
              return v8();
            default:
              return result;
          }
        }
      }
    }
  }
  return result;
}

uint64_t __registerForLockStateChanges_block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = MKBGetDeviceLockState();
  if (v2 >= 4)
    v3 = 1;
  else
    v3 = v2;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, v3);
}

void __getCurrentOsBuild_block_invoke()
{
  const __CFDictionary *v0;
  uint64_t v1;
  void *v2;

  v0 = (const __CFDictionary *)_CFCopyServerVersionDictionary();
  if (v0 || (v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary()) != 0)
  {
    CFDictionaryGetValue(v0, (const void *)*MEMORY[0x1E0C9AB90]);
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)getCurrentOsBuild_build;
    getCurrentOsBuild_build = v1;

    CFRelease(v0);
  }
}

uint64_t __runUnlockBlocks_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
}

void _pas_registerSqliteCollections(sqlite3 *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1A1AFDC98]();
  objc_opt_self();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v3;
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v5;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v6;
  objc_opt_self();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1A1AFDC98](v10);
        sqlite3_create_module(a1, (const char *)objc_msgSend(v14, "sqliteMethodName", (_QWORD)v16), &_pas_collection_sqlite_module, v14);
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v11 = v10;
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

uint64_t xConnect(sqlite3 *a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  char v11;
  uint64_t result;
  void *v13;
  void *v14;

  v8 = sqlite3_malloc64(0x20uLL);
  v9 = v8;
  if (v8)
  {
    *v8 = 0;
    v8[1] = 0;
    v8[2] = 0;
    v8[3] = a2;
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a2, "isSubclassOfClass:", v10);

    if ((v11 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int xConnect(sqlite3 *, void *, int, const char *const *, sqlite3_vtab **, char **)");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("_PASSqliteCollections.m"), 1345, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[pVtab->pasCursorClass isSubclassOfClass:[_PASSqliteCollectionsCursor self]]"));

    }
    result = sqlite3_declare_vtab(a1, (const char *)objc_msgSend((id)v9[3], "sqliteCreateTableStatement"));
  }
  else
  {
    result = 7;
  }
  *a5 = v9;
  return result;
}

uint64_t xDisconnect(void *a1)
{
  sqlite3_free(a1);
  return 0;
}

uint64_t xDestroy(void *a1)
{
  sqlite3_free(a1);
  return 0;
}

uint64_t xRowId(uint64_t a1, _QWORD *a2)
{
  id v3;
  void *v5;
  void *v6;

  v3 = *(id *)(a1 + 8);
  if ((objc_msgSend((id)objc_opt_class(), "hasRowId") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int xRowId(sqlite3_vtab_cursor *, sqlite_int64 *)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_PASSqliteCollections.m"), 1595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[cursor.class hasRowId]"));

  }
  *a2 = objc_msgSend(v3, "outputRowId");

  return 0;
}

BOOL __xFilter_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  int v11;
  _BOOL8 v12;
  int v14;
  int v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  _PASSqliteGetValue(*(sqlite3_value **)(*(_QWORD *)(a1 + 48)
                                       + 8 * *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v7 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 60))
    {
      objc_msgSend(v7, "applyKeyConstraint:withArgument:", a3, v6);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109634;
        v15 = a3;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = objc_opt_class();
        v8 = MEMORY[0x1E0C81028];
        v9 = "#passqlitecollections Using key->%d(%@) for %@";
LABEL_9:
        _os_log_debug_impl(&dword_1A0957000, v8, OS_LOG_TYPE_DEBUG, v9, (uint8_t *)&v14, 0x1Cu);
      }
    }
    else
    {
      objc_msgSend(v7, "applyRowIdConstraint:withArgument:", a3, v6);
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v14 = 67109634;
        v15 = a3;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = objc_opt_class();
        v8 = MEMORY[0x1E0C81028];
        v9 = "#passqlitecollections Using rowId->%d(%@) for %@";
        goto LABEL_9;
      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "applyConstraint:withArgument:", a3, v6);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v14 = 67109634;
      v15 = a3;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = objc_opt_class();
      v8 = MEMORY[0x1E0C81028];
      v9 = "#passqlitecollections Using value->%d(%@) for %@";
      goto LABEL_9;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(_DWORD *)(v10 + 24) + 1;
  *(_DWORD *)(v10 + 24) = v11;
  v12 = v11 < *(_DWORD *)(a1 + 56);

  return v12;
}

void sub_1A09A39A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, id);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  __destructor_8_sb0_sb16_sb24((id *)va);
  __destructor_8_sb0_sb16_sb24((id *)va1);
  _Unwind_Resume(a1);
}

void sub_1A09A3CCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, id);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  __destructor_8_sb0_sb16_sb24((id *)va);
  __destructor_8_sb0_sb16_sb24((id *)va1);
  _Unwind_Resume(a1);
}

void sub_1A09A3FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  id v4;
  va_list va;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, id);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  __destructor_8_sb0_sb16_sb24((id *)va);
  __destructor_8_sb0_sb16_sb24((id *)va1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3087(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3088(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AFDE78](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1A09A43EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A09A448C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void __destructor_8_sb0_sb16_sb24(id *a1)
{

}

uint64_t _PASIsInternalDevice()
{
  return os_variant_has_internal_diagnostics();
}

void sub_1A09A4AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A5918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A5A38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A09A6240(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A09A6E00(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_end_catch();
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A09A6F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A70E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

void sub_1A09A71F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A7334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A7444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A7544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A7658(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1A09A77C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09A78E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3236(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3237(uint64_t a1)
{

}

void sub_1A09A877C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1A09A87A8(void *exc_buf, int a2)
{
  if (a2)
  {
    objc_begin_catch(exc_buf);
    JUMPOUT(0x1A09A8674);
  }
  JUMPOUT(0x1A09A879CLL);
}

__CFString *_PASQMarksSeparatedByCommas(uint64_t a1)
{
  uint64_t v1;
  size_t v2;
  size_t v3;
  char *v4;
  char *v5;
  __CFString *v6;
  int v8;
  id v9;
  uint64_t v10;
  void *memptr;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = 2 * a1;
    v3 = (2 * a1) | 1;
    memptr = 0;
    v12 = 0;
    if (v3 > 0x100)
    {
      v8 = malloc_type_posix_memalign(&memptr, 8uLL, v2, 0xBA780C1DuLL);
      LOBYTE(v12) = 0;
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v9);
      }
      v4 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1E0C80A78](a1);
      v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v4, v3);
    }
    v5 = v4 + 1;
    do
    {
      *(_WORD *)(v5 - 1) = 11327;
      v5 += 2;
      --v1;
    }
    while (v1);
    v6 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v4, v2 - 1, 1);
    if (v3 > 0x100)
      free(v4);
  }
  else
  {
    v6 = &stru_1E4431528;
  }
  return v6;
}

uint64_t _PAS_sqlite3_bind_nssecurecoding(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int _PAS_sqlite3_bind_nssecurecoding(sqlite3_stmt * _Nonnull, int, __strong id<NSSecureCoding> _Nonnull)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_PASSqliteDatabase.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("obj != nil"));

  }
  v6 = (void *)MEMORY[0x1A1AFDC98]();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;
  v9 = v8;
  if (v7)
  {

    objc_autoreleasePoolPop(v6);
    v10 = _PAS_sqlite3_bind_nsdata(a1, a2, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Can not archive data: %@", buf, 0xCu);
    }
    v10 = sqlite3_bind_null(a1, a2);

    objc_autoreleasePoolPop(v6);
  }

  return v10;
}

__CFString *getQueryPlan(sqlite3 *a1, void *a2)
{
  id v3;
  __CFString *v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  const unsigned __int8 *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  sqlite3_stmt *ppStmt;

  v3 = a2;
  ppStmt = 0;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("CREATE ")) & 1) != 0
    || (objc_msgSend(v3, "hasPrefix:", CFSTR("DROP ")) & 1) != 0)
  {
    v4 = CFSTR("(no query plan for create and drop queries)");
  }
  else
  {
    v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("EXPLAIN QUERY PLAN %@"), v3));
    sqlite3_prepare_v2(a1, (const char *)objc_msgSend(v6, "UTF8String"), -1, &ppStmt, 0);

    if (ppStmt)
    {
      v7 = (void *)objc_opt_new();
      v8 = (void *)objc_opt_new();
      while (sqlite3_step(ppStmt) == 100)
      {
        v9 = sqlite3_column_int(ppStmt, 0);
        v10 = sqlite3_column_int(ppStmt, 1);
        v11 = sqlite3_column_text(ppStmt, 3);
        v12 = sqlite3_column_bytes(ppStmt, 3);
        if (v10
          && (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10),
              v13 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v8, "objectForKeyedSubscript:", v13),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              v14))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue") + 4;

        }
        else
        {
          v17 = 0;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, v19);

        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%4td %*s"), v9, (v12 + v17), v11);
        objc_msgSend(v7, "addObject:", v20);

      }
      sqlite3_finalize(ppStmt);
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v7, "_pas_componentsJoinedByString:", CFSTR("\n"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = CFSTR("(empty query plan)");
      }

    }
    else
    {
      v4 = CFSTR("(query plan could not be generated)");
    }
  }

  return v4;
}

void sqliteBlockFunction(sqlite3_context *a1, int a2, sqlite3_value **a3)
{
  void *v6;
  void (**v7)(_QWORD, _QWORD);
  __CFArray *Mutable;
  void *v9;
  uint64_t v10;
  sqlite3_value **v11;
  sqlite3_value *v12;
  id Value;
  void *v14;
  void *v15;

  v6 = (void *)MEMORY[0x1A1AFDC98]();
  if (a2 >= 1 && sqlite3_value_pointer(*a3, "_pas_block"))
  {
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AFDE78]();
    Mutable = CFArrayCreateMutable(0, (a2 - 1), MEMORY[0x1E0C9B378]);
    v9 = (void *)MEMORY[0x1A1AFDC98]();
    if (a2 >= 2)
    {
      v10 = a2 - 1;
      v11 = a3 + 1;
      do
      {
        v12 = *v11++;
        Value = _PASSqliteGetValue(v12);
        CFArrayAppendValue(Mutable, Value);
        --v10;
      }
      while (v10);
    }
    objc_autoreleasePoolPop(v9);
    ((void (**)(_QWORD, __CFArray *))v7)[2](v7, Mutable);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(Mutable);
    if (v14)
    {
      _PASSqliteSetResult();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      _PASSqliteSetResult();

    }
  }
  else
  {
    sqlite3_result_error_code(a1, 20);
  }
  objc_autoreleasePoolPop(v6);
}

void sub_1A09A9608(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09A9628(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A09A9588);
}

id _PASSqliteGetValue(sqlite3_value *a1)
{
  id result;
  uint64_t v3;
  id v4;
  const unsigned __int8 *v5;
  void *v6;
  id v7;
  const void *v8;
  id v9;
  const void *v10;
  void *v11;

  result = (id)sqlite3_value_type(a1);
  switch((int)result)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_value_int64(a1));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", sqlite3_value_double(a1));
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = sqlite3_value_text(a1);
      v6 = (void *)objc_msgSend(v4, "initWithBytes:length:encoding:", v5, sqlite3_value_bytes(a1), 4);
      if (v6)
        return v6;
      v7 = objc_alloc(MEMORY[0x1E0CB3940]);
      v8 = sqlite3_value_text16(a1);
      v3 = objc_msgSend(v7, "initWithCharacters:length:", v8, (unint64_t)sqlite3_value_bytes16(a1) >> 1);
LABEL_8:
      v6 = (void *)v3;
      return v6;
    case 4:
      v9 = objc_alloc(MEMORY[0x1E0C99D50]);
      v10 = sqlite3_value_blob(a1);
      v11 = (void *)objc_msgSend(v9, "initWithBytes:length:", v10, sqlite3_value_bytes(a1));
      objc_msgSend(v11, "_pas_dataWithNonnullBytes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    case 5:
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v3 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    default:
      __break(1u);
      return result;
  }
}

void sub_1A09A9D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t runDebugCommandCallback(_BYTE *a1, int a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7;
  unint64_t i;
  int v10;
  unint64_t v11;

  if (!*a1)
  {
    v7 = (a2 - 1);
    if (a2 >= 1)
    {
      for (i = 0; i != a2; ++i)
      {
        printf("%s ", *(const char **)(a4 + 8 * i));
        if (i < v7)
          putchar(9);
      }
    }
    putchar(10);
    v10 = 80;
    do
    {
      putchar(45);
      --v10;
    }
    while (v10);
    putchar(10);
    *a1 = 1;
  }
  if (a2 >= 1)
  {
    v11 = 0;
    do
    {
      printf("%s ", *(const char **)(a3 + 8 * v11));
      if (v11 < (a2 - 1))
        putchar(9);
      ++v11;
    }
    while (a2 != v11);
  }
  putchar(10);
  fflush((FILE *)*MEMORY[0x1E0C80C20]);
  return 0;
}

void moveOrRemoveDbFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "moveItemAtPath:toPath:error:", v3, v4, &v9);
  v7 = v9;

  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Corrupt database file moved to \"%@\".", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v4;
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to move corrupt database file to \"%@\": %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeItemAtPath:error:", v3, 0);

  }
}

id _PAS_sqlite3_column_nssecurecoding(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__3236;
  v16 = __Block_byref_object_dispose__3237;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___PAS_sqlite3_column_nssecurecoding_block_invoke;
  v9[3] = &unk_1E4430720;
  v11 = &v12;
  v6 = v5;
  v10 = v6;
  _PAS_sqlite3_column_blob_bytes_block(a1, a2, v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void sub_1A09AAAAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09AC708(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09AC728(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A09AC4D8);
}

void sub_1A09ADE48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17)
    (*(void (**)(void))(a17 + 16))();
  _Unwind_Resume(exception_object);
}

void sub_1A09AE164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{

  _Unwind_Resume(a1);
}

uint64_t bumpChecked(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  void *v5;
  void *v6;

  result = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(a1 + 8) - result < a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *bumpChecked(_PASLPAllocContext * _Nonnull, size_t)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("_PASLPWriterV1.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offset(allocContext->bumpp, allocContext->endp) >= (ptrdiff_t)byteCount"));

    result = *(_QWORD *)(a1 + 24);
  }
  *(_QWORD *)(a1 + 24) = result + a2;
  return result;
}

void alignChecked(_QWORD *a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v3 = (char *)a1[3];
  v4 = &v3[-*a1];
  v5 = (unint64_t)&v4[a2 - 1] / a2 * a2;
  v6 = *a1 + v5;
  if (v6 >= a1[1])
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *alignChecked(_PASLPAllocContext * _Nonnull, size_t)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("_PASLPWriterV1.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("alignedPtr < allocContext->endp"));

    v3 = (char *)a1[3];
  }
  bzero(v3, v5 - (_QWORD)v4);
  a1[3] = v6;
}

uint64_t _block_invoke(uint64_t *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  void **Value;
  void *v9;
  size_t v10;
  _QWORD v12[2];

  v6 = *a1;
  v7 = a3 & 0xFFFFFF0000000000 | ((unint64_t)BYTE4(a3) << 32) | a3;
  v12[0] = a2;
  v12[1] = v7;
  Value = (void **)CFSetGetValue(*(CFSetRef *)(v6 + 16), v12);
  if (Value)
  {
    v9 = *Value;
  }
  else
  {
    v10 = a3;
    alignChecked((_QWORD *)*a1, BYTE4(a3));
    v9 = (void *)bumpChecked(*a1, a3);
    memcpy(v9, a2, v10);
    cacheBuffer(*(__CFSet **)(*a1 + 16), *(_QWORD *)(*a1 + 32), (uint64_t)v9, v7);
  }
  return ((_DWORD)v9 - *(_DWORD *)*a1);
}

void cacheBuffer(__CFSet *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[2];

  v5[0] = a3;
  v5[1] = a4;
  ++*(_QWORD *)(a2 + 120);
  if (CFSetGetCount(a1) < 0x2000)
    CFSetAddValue(a1, v5);
}

__n128 retainBufferDescr(const __CFAllocator *a1, __n128 *a2)
{
  _OWORD *v3;
  __n128 result;
  id v5;

  v3 = CFAllocatorAllocate(a1, 16, 0);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  result = *a2;
  *v3 = *a2;
  return result;
}

BOOL isEqualBufferDescr(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(unsigned int *)(a1 + 8);
  return __PAIR64__(*(unsigned __int8 *)(a1 + 12), v2) == __PAIR64__(*(unsigned __int8 *)(a2 + 12), *(_DWORD *)(a2 + 8))
      && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t hashBufferDescr(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unsigned __int16 *v3;
  unsigned int v4;
  unint64_t v5;

  v1 = *(unsigned int *)(a1 + 8);
  if (v1 >= 0x20)
    v2 = 32;
  else
    v2 = v1;
  v3 = *(unsigned __int16 **)a1;
  v4 = _PASMurmur3_x86_32(*(unsigned __int16 **)a1, v2, v1 + *(unsigned __int8 *)(a1 + 12));
  if (v1 >= 0x21)
  {
    if ((unint64_t)(v1 - 32) >= 0x20)
      v5 = 32;
    else
      v5 = v1 - 32;
    v4 ^= _PASMurmur3_x86_32((unsigned __int16 *)((char *)v3 + v1 - v5), v5, 0);
  }
  return v4;
}

void sub_1A09AF858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09AF9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B0964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1A09B0BC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B0DB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B183C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B1C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B1D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B1E10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A09B1ED8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A09B1EF8(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x1A09B1E90);
}

uint64_t __Block_byref_object_copy__3867(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3868(uint64_t a1)
{

}

void sub_1A09B2894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _PASSharedKeySetSupportLoadOnce()
{
  if (_PASSharedKeySetSupportLoadOnce__pasOnceToken2 != -1)
    dispatch_once(&_PASSharedKeySetSupportLoadOnce__pasOnceToken2, &__block_literal_global_3946);
}

uint64_t _PASSharedKeySetCount(uint64_t a1)
{
  return _sharedKeySetCount(a1, _sharedKeySetCountSelector);
}

uint64_t _PASSharedKeySetIndexForKey(uint64_t a1, uint64_t a2)
{
  return _sharedKeySetIndexForKey(a1, _sharedKeySetIndexForKeySelector, a2);
}

uint64_t _PASSharedKeySetKeyAtIndex(uint64_t a1, uint64_t a2)
{
  return _sharedKeySetKeyAtIndex(a1, _sharedKeySetKeyAtIndexSelector, a2);
}

void sub_1A09B3B7C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_1A09B3D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

uint64_t sub_1A09B3E80()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1A09B3E8C()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A09B3E98()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A09B3EA4()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_1A09B3EB0()
{
  return MEMORY[0x1E0DE9FC8]();
}

uint64_t sub_1A09B3EBC()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A09B3EC8()
{
  return MEMORY[0x1E0DEA088]();
}

uint64_t sub_1A09B3ED4()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1A09B3EE0()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1A09B3EEC()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A09B3EF8()
{
  return MEMORY[0x1E0DEA450]();
}

uint64_t sub_1A09B3F04()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A09B3F10()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1A09B3F1C()
{
  return MEMORY[0x1E0DEAB20]();
}

uint64_t sub_1A09B3F28()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A09B3F34()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A09B3F40()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1A09B3F4C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1A09B3F58()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1A09B3F64()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1A09B3F70()
{
  return MEMORY[0x1E0DF07E0]();
}

uint64_t sub_1A09B3F7C()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1A09B3F88()
{
  return MEMORY[0x1E0DF07F8]();
}

uint64_t sub_1A09B3F94()
{
  return MEMORY[0x1E0DF0800]();
}

uint64_t sub_1A09B3FA0()
{
  return MEMORY[0x1E0DF0840]();
}

uint64_t sub_1A09B3FAC()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1A09B3FB8()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1A09B3FC4()
{
  return MEMORY[0x1E0DEB5C8]();
}

uint64_t sub_1A09B3FD0()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A09B3FDC()
{
  return MEMORY[0x1E0DEB650]();
}

uint64_t sub_1A09B3FE8()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A09B3FF4()
{
  return MEMORY[0x1E0DEB678]();
}

uint64_t sub_1A09B4000()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A09B400C()
{
  return MEMORY[0x1E0DEBEA8]();
}

uint64_t sub_1A09B4018()
{
  return MEMORY[0x1E0DEBF30]();
}

uint64_t sub_1A09B4024()
{
  return MEMORY[0x1E0DEBF58]();
}

uint64_t sub_1A09B4030()
{
  return MEMORY[0x1E0DEC470]();
}

uint64_t sub_1A09B403C()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1A09B4048()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1A09B4054()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t sub_1A09B4060()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1A09B406C()
{
  return MEMORY[0x1E0DECF38]();
}

uint64_t sub_1A09B4078()
{
  return MEMORY[0x1E0DECF40]();
}

uint64_t sub_1A09B4084()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1A09B4090()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A09B409C()
{
  return MEMORY[0x1E0DED038]();
}

uint64_t sub_1A09B40A8()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1A09B40B4()
{
  return MEMORY[0x1E0DED070]();
}

uint64_t sub_1A09B40C0()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1A09B40CC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A09B40D8()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1A09B40E4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A09B40F0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A09B40FC()
{
  return MEMORY[0x1E0DEDEE0]();
}

uint64_t sub_1A09B4108()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A09B4114()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A09B4120()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A09B412C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A09B4138()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A09B4144()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A09B4150()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t AKSEventsRegister()
{
  return MEMORY[0x1E0CFD2E0]();
}

uint64_t AKSEventsUnregister()
{
  return MEMORY[0x1E0CFD2E8]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

uint64_t CFBurstTrieContains()
{
  return MEMORY[0x1E0C981D0]();
}

uint64_t CFBurstTrieContainsUTF8String()
{
  return MEMORY[0x1E0C981D8]();
}

uint64_t CFBurstTrieCreateFromFile()
{
  return MEMORY[0x1E0C981E8]();
}

uint64_t CFBurstTrieRelease()
{
  return MEMORY[0x1E0C98208]();
}

void CFCharacterSetAddCharactersInRange(CFMutableCharacterSetRef theSet, CFRange theRange)
{
  MEMORY[0x1E0C982A0](theSet, theRange.location, theRange.length);
}

CFCharacterSetRef CFCharacterSetCreateCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982B8](alloc, theSet);
}

CFMutableCharacterSetRef CFCharacterSetCreateMutableCopy(CFAllocatorRef alloc, CFCharacterSetRef theSet)
{
  return (CFMutableCharacterSetRef)MEMORY[0x1E0C982D0](alloc, theSet);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AB0](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98DA0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x1E0C98F48](encoding);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFMutableStringRef CFStringCreateMutableWithExternalCharactersNoCopy(CFAllocatorRef alloc, UniChar *chars, CFIndex numChars, CFIndex capacity, CFAllocatorRef externalCharactersAllocator)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98FA0](alloc, chars, numChars, capacity, externalCharactersAllocator);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFStringEncoding CFStringGetFastestEncoding(CFStringRef theString)
{
  return MEMORY[0x1E0C990D8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

void CFStringInsert(CFMutableStringRef str, CFIndex idx, CFStringRef insertedStr)
{
  MEMORY[0x1E0C991B8](str, idx, insertedStr);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

void CFStringSetExternalCharactersNoCopy(CFMutableStringRef theString, UniChar *chars, CFIndex length, CFIndex capacity)
{
  MEMORY[0x1E0C99200](theString, chars, length, capacity);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t ITSCollationContextFreeContextForDatabaseHandle()
{
  return MEMORY[0x1E0D3EF70]();
}

uint64_t ITSRegisterSQLiteICUTokenizer()
{
  return MEMORY[0x1E0D3EF88]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x1E0D4E4A8]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x1E0D4E4B0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t NLLanguageIdentifierConsumeString()
{
  return MEMORY[0x1E0D17080]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1E0D17088]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1E0D17090]();
}

uint64_t NLLanguageIdentifierRelease()
{
  return MEMORY[0x1E0D170A8]();
}

uint64_t NLLanguageIdentifierReset()
{
  return MEMORY[0x1E0D170B8]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1E0D170C8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSZone *NSDefaultMallocZone(void)
{
  return (NSZone *)MEMORY[0x1E0CB2960]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl NSZoneCalloc(NSZone *zone, NSUInteger numElems, NSUInteger byteSize)
{
  return (void *)MEMORY[0x1E0CB3450](zone, numElems, byteSize);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x1E0CB3458](zone, ptr);
}

NSZone *__cdecl NSZoneFromPointer(void *ptr)
{
  return (NSZone *)MEMORY[0x1E0CB3460](ptr);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _NSIsNSCFConstantString()
{
  return MEMORY[0x1E0C9A870]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x1E0DE4DB0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E442DC90();
}

void operator delete(void *__p)
{
  off_1E442DC98(__p);
}

uint64_t operator delete()
{
  return off_1E442DCA0();
}

uint64_t operator new[]()
{
  return off_1E442DCA8();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E442DCB0(__sz);
}

uint64_t operator new()
{
  return off_1E442DCB8();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _exit(int a1)
{
  MEMORY[0x1E0C80F80](*(_QWORD *)&a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x1E0DE9290](adler, buf, *(_QWORD *)&len);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x1E0C81740](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

float cblas_sdot(const int __N, const float *__X, const int __incX, const float *__Y, const int __incY)
{
  float result;

  MEMORY[0x1E0C8BBD8](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __Y, *(_QWORD *)&__incY);
  return result;
}

void cblas_sscal(const int __N, const float __alpha, float *__X, const int __incX)
{
  MEMORY[0x1E0C8BC60](*(_QWORD *)&__N, __X, *(_QWORD *)&__incX, __alpha);
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C82638](a1, a2);
}

size_t class_getInstanceSize(Class cls)
{
  return MEMORY[0x1E0DE7AB0](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5270](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

size_t compression_encode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x1E0DE5280](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(_QWORD *)&algorithm);
}

uLong crc32_z(uLong crc, const Bytef *buf, z_size_t len)
{
  return MEMORY[0x1E0DE92B8](crc, buf, len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_barrier(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF0](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82C98](block, timeout);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_io_close(dispatch_io_t channel, dispatch_io_close_flags_t flags)
{
  MEMORY[0x1E0C82D58](channel, flags);
}

dispatch_io_t dispatch_io_create(dispatch_io_type_t type, dispatch_fd_t fd, dispatch_queue_t queue, void *cleanup_handler)
{
  return (dispatch_io_t)MEMORY[0x1E0C82D60](type, *(_QWORD *)&fd, queue, cleanup_handler);
}

void dispatch_io_read(dispatch_io_t channel, off_t offset, size_t length, dispatch_queue_t queue, dispatch_io_handler_t io_handler)
{
  MEMORY[0x1E0C82D80](channel, offset, length, queue, io_handler);
}

void dispatch_io_set_high_water(dispatch_io_t channel, size_t high_water)
{
  MEMORY[0x1E0C82D88](channel, high_water);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

int getopt_long(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1E0C83730](*(_QWORD *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x1E0C83F08](memptr, alignment, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C841F0](a1, a2, *(_QWORD *)&a3);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x1E0C84210](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x1E0DE7C00](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x1E0DE7C68](obj);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

int posix_spawn(pid_t *a1, const char *a2, const posix_spawn_file_actions_t *a3, const posix_spawnattr_t *a4, char *const __argv[], char *const __envp[])
{
  return MEMORY[0x1E0C84B38](a1, a2, a3, a4, __argv, __envp);
}

int posix_spawn_file_actions_addclose(posix_spawn_file_actions_t *a1, int a2)
{
  return MEMORY[0x1E0C84B40](a1, *(_QWORD *)&a2);
}

int posix_spawn_file_actions_adddup2(posix_spawn_file_actions_t *a1, int a2, int a3)
{
  return MEMORY[0x1E0C84B48](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int posix_spawn_file_actions_init(posix_spawn_file_actions_t *a1)
{
  return MEMORY[0x1E0C84B68](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_trylock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E30](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x1E0C84F80]();
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

int scandir(const char *a1, dirent ***a2, int (__cdecl *a3)(const dirent *), int (__cdecl *a4)(const dirent **, const dirent **))
{
  return MEMORY[0x1E0C85250](a1, a2, a3, a4);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int setlinebuf(FILE *a1)
{
  return MEMORY[0x1E0C85350](a1);
}

int setuid(uid_t a1)
{
  return MEMORY[0x1E0C85390](*(_QWORD *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sqlite3_backup_finish(sqlite3_backup *p)
{
  return MEMORY[0x1E0DE8558](p);
}

sqlite3_backup *__cdecl sqlite3_backup_init(sqlite3 *pDest, const char *zDestName, sqlite3 *pSource, const char *zSourceName)
{
  return (sqlite3_backup *)MEMORY[0x1E0DE8560](pDest, zDestName, pSource, zSourceName);
}

int sqlite3_backup_step(sqlite3_backup *p, int nPage)
{
  return MEMORY[0x1E0DE8578](p, *(_QWORD *)&nPage);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

uint64_t sqlite3_bind_blob_b()
{
  return MEMORY[0x1E0DE8590]();
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D0](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x1E0DE85E8](a1, *(_QWORD *)&a2, a3, a4, a5, encoding);
}

uint64_t sqlite3_bind_text_b()
{
  return MEMORY[0x1E0DE85F0]();
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes16(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8670](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const char *__cdecl sqlite3_column_origin_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE86A8](a1, *(_QWORD *)&a2);
}

const char *__cdecl sqlite3_column_table_name(sqlite3_stmt *a1, int a2)
{
  return (const char *)MEMORY[0x1E0DE86B0](a1, *(_QWORD *)&a2);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const void *__cdecl sqlite3_column_text16(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE86C0](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x1E0DE8708](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData)
{
  return MEMORY[0x1E0DE8718](db, zName, p, pClientData);
}

int sqlite3_db_config(sqlite3 *a1, int op, ...)
{
  return MEMORY[0x1E0DE8738](a1, *(_QWORD *)&op);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x1E0DE8770](a1, zSQL);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

const char *__cdecl sqlite3_errstr(int a1)
{
  return (const char *)MEMORY[0x1E0DE8790](*(_QWORD *)&a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE87B0](db);
}

int sqlite3_extended_result_codes(sqlite3 *a1, int onoff)
{
  return MEMORY[0x1E0DE87B8](a1, *(_QWORD *)&onoff);
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8820](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x1E0DE8838](*(_QWORD *)&a1);
}

void *__cdecl sqlite3_malloc64(sqlite3_uint64 a1)
{
  return (void *)MEMORY[0x1E0DE8840](a1);
}

char *sqlite3_mprintf(const char *a1, ...)
{
  return (char *)MEMORY[0x1E0DE8848](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88C0](a1, a2, a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x1E0DE88C8](a1, a2);
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88D8](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x1E0DE88F8](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x1E0DE8900](a1);
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
  MEMORY[0x1E0DE8918](a1, a2, a3, a4, encoding);
}

int sqlite3_result_zeroblob64(sqlite3_context *a1, sqlite3_uint64 n)
{
  return MEMORY[0x1E0DE8930](a1, n);
}

const char *__cdecl sqlite3_sql(sqlite3_stmt *pStmt)
{
  return (const char *)MEMORY[0x1E0DE8998](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stmt_status(sqlite3_stmt *a1, int op, int resetFlg)
{
  return MEMORY[0x1E0DE89C0](a1, *(_QWORD *)&op, *(_QWORD *)&resetFlg);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A20](a1);
}

int sqlite3_value_bytes16(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A28](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x1E0DE8A30](a1);
  return result;
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1E0DE8A58](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

const void *__cdecl sqlite3_value_text16(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A68](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

uint64_t utrans_close()
{
  return MEMORY[0x1E0DE6AC8]();
}

uint64_t utrans_openU()
{
  return MEMORY[0x1E0DE6AD0]();
}

uint64_t utrans_trans()
{
  return MEMORY[0x1E0DE6AD8]();
}

void vvlog2f(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x1E0C8DA80](a1, a2, a3);
}

pid_t waitpid(pid_t a1, int *a2, int a3)
{
  return MEMORY[0x1E0C85BD0](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

