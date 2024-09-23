unint64_t _getDatestamp()
{
  void *v0;
  double v1;
  unint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1 / 0x15180uLL;

  return v2;
}

void lookupBlockCreatingIfNotExists(void *a1, uint64_t a2, unsigned int a3, char a4, unsigned int a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  unint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  __int16 v22;
  __int16 v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v11 = a1;
  v12 = a6;
  if (!v11)
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 172, "storage");
  if (!a2)
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 173, "key");
  v13 = v12;
  if (!v12)
    __assert_rtn("lookupBlockCreatingIfNotExists", "PETAggregateState.m", 176, "block");
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v14 = a3 + (unint64_t)a5 + 10;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __lookupBlockCreatingIfNotExists_block_invoke;
  v17[3] = &unk_1E2A41330;
  v21 = a2;
  v22 = a3;
  v15 = v11;
  v18 = v15;
  v24 = a4;
  v23 = a5;
  v16 = v13;
  v19 = v16;
  v20 = &v25;
  objc_msgSend(v15, "expand:andRunWithLock:", v14, v17);
  if (*((_BYTE *)v26 + 24))
    objc_msgSend(v15, "reset");

  _Block_object_dispose(&v25, 8);
}

void sub_18FAB2D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __lookupBlockCreatingIfNotExists_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  __int16 v8;
  uint64_t v9;
  unsigned __int8 *v10;
  __int16 v11;
  unsigned int v12;
  unsigned int BucketPtr;
  unsigned int v14;
  unsigned int v15;
  unint64_t v16;
  unsigned __int8 *v17;
  int v18;
  uint64_t v19;
  int v20;
  char v21;
  __int16 v22;
  uint64_t v23;
  uint64_t result;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = 8997;
  v9 = *(unsigned __int16 *)(a1 + 64);
  if (*(_WORD *)(a1 + 64))
  {
    v10 = *(unsigned __int8 **)(a1 + 56);
    do
    {
      v11 = *v10++;
      v8 = 435 * (v8 ^ v11);
      --v9;
    }
    while (v9);
  }
  v12 = 4 * (v8 ^ HIBYTE(v8));
  BucketPtr = getBucketPtr(a2, a3, v12, *(void **)(a1 + 32));
  if (BucketPtr == -1)
  {
    LOWORD(v20) = *(_WORD *)(a1 + 64);
LABEL_15:
    v21 = *(_BYTE *)(a1 + 68);
    v22 = *(_WORD *)(a1 + 66);
    v23 = a2 + a4;
    *(_BYTE *)v23 = -28;
    *(_BYTE *)(v23 + 1) = v21;
    *(_WORD *)(v23 + 2) = v22;
    *(_WORD *)(v23 + 4) = v20;
    *(_DWORD *)(v23 + 6) = -1;
    memcpy((void *)(a2 + a4 + 10), *(const void **)(a1 + 56), *(unsigned __int16 *)(a1 + 64));
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      setBucketPtr(a2, a3, v12, a4, *(void **)(a1 + 32));
      return 1;
    }
LABEL_32:
    __assert_rtn("lookupBlockCreatingIfNotExists_block_invoke", "PETAggregateState.m", 226, "!keepNewAllocation");
  }
  v14 = BucketPtr;
  while (1)
  {
    v15 = v14;
    v16 = v14 + 10;
    if (v16 > a3)
    {
LABEL_17:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        LOWORD(v32) = 0;
        v25 = MEMORY[0x1E0C81028];
        v26 = "Bounds overflow! Invalid data";
        v27 = 2;
LABEL_30:
        _os_log_error_impl(&dword_18FAB0000, v25, OS_LOG_TYPE_ERROR, v26, (uint8_t *)&v32, v27);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v17 = (unsigned __int8 *)(a2 + v14);
    v18 = *v17;
    if (v18 != 228)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v32 = 67109376;
        v33 = 228;
        v34 = 1024;
        v35 = v18;
        v25 = MEMORY[0x1E0C81028];
        v26 = "Magic number not found: expected %i, got %i";
        goto LABEL_29;
      }
      goto LABEL_20;
    }
    v14 = *(_DWORD *)(v17 + 6);
    v19 = *((unsigned __int16 *)v17 + 2);
    v20 = *(unsigned __int16 *)(a1 + 64);
    if (v20 == (_DWORD)v19)
    {
      if (v16 + v19 > a3)
        goto LABEL_17;
      if (!memcmp(*(const void **)(a1 + 56), v17 + 10, *((unsigned __int16 *)v17 + 2)))
        break;
    }
    if (v15 >= v14)
    {
      objc_msgSend(*(id *)(a1 + 32), "saveCorruptState");
      objc_msgSend(*(id *)(a1 + 32), "resetLocked");
      __break(1u);
      goto LABEL_32;
    }
    if (v14 == -1)
    {
      v12 = v15 + 6;
      goto LABEL_15;
    }
  }
  v28 = v17[1];
  v29 = *(unsigned __int8 *)(a1 + 68);
  if (v29 != v28)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v32 = 67109376;
      v33 = v29;
      v34 = 1024;
      v35 = v28;
      v25 = MEMORY[0x1E0C81028];
      v26 = "Block type mismatch: expected %i, got %i";
LABEL_29:
      v27 = 14;
      goto LABEL_30;
    }
LABEL_20:
    result = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    return result;
  }
  v30 = *((unsigned __int16 *)v17 + 1);
  v31 = *(unsigned __int16 *)(a1 + 66);
  if (v31 != v30)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v32 = 67109376;
      v33 = v31;
      v34 = 1024;
      v35 = v30;
      v25 = MEMORY[0x1E0C81028];
      v26 = "Block length mismatch: expected %u, got %u";
      goto LABEL_29;
    }
    goto LABEL_20;
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, unsigned __int8 *, uint64_t, uint64_t, unint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, &v17[v19 + 10], a2 + a4, a2, a3);
}

uint64_t getBucketPtr(uint64_t a1, unint64_t a2, unsigned int a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t result;

  v7 = a4;
  v8 = v7;
  if ((unint64_t)a3 + 4 > a2)
  {
    objc_msgSend(v7, "saveCorruptState");
    result = objc_msgSend(v8, "resetLocked");
    __break(1u);
  }
  else
  {
    v9 = *(unsigned int *)(a1 + a3);

    return v9;
  }
  return result;
}

void sub_18FAB3C28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_18FAB7034()
{
  uint64_t v0;

  v0 = sub_18FAD57F0();
  __swift_allocate_value_buffer(v0, qword_1EE183DA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE183DA8);
  return sub_18FAD57E4();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_18FAB70F4()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  type metadata accessor for EventTracker();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v0;
  qword_1EE183B98 = result;
  return result;
}

uint64_t static EventTracker.shared.getter()
{
  if (qword_1EE183BA0 != -1)
    swift_once();
  return swift_retain();
}

void sub_18FAB718C(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *oslog;
  uint64_t v22;

  v7 = *(void **)(v5 + 16);
  if (v7)
  {
    v11 = OUTLINED_FUNCTION_0(a1);
    if (v6)
    {
      if (qword_1EE183BA8 != -1)
        swift_once();
      v13 = sub_18FAD57F0();
      __swift_project_value_buffer(v13, (uint64_t)qword_1EE183DA8);
      swift_bridgeObjectRetain_n();
      oslog = sub_18FAD57D8();
      v14 = sub_18FAD5814();
      if (os_log_type_enabled(oslog, v14))
      {
        v15 = (uint8_t *)OUTLINED_FUNCTION_2();
        v22 = OUTLINED_FUNCTION_2();
        *(_DWORD *)v15 = 136315138;
        swift_bridgeObjectRetain();
        sub_18FAB767C(a2, a3, &v22);
        sub_18FAD5820();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_18FAB0000, oslog, v14, "PET2 does not support required fields on %s", v15, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      v16 = v11;
      v17 = v12;
      v18 = (void *)sub_18FAD57C0();
      sub_18FAB7DE4(v16, v17);
      v19 = (void *)sub_18FAD57FC();
      if (a5)
        v20 = sub_18FAD57FC();
      else
        v20 = 0;
      objc_msgSend(v7, sel_logMessageData_objcClassName_subGroup_, v18, v19, v20);

    }
  }
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_18FAB73EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  return swift_task_switch();
}

uint64_t sub_18FAB740C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  unint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;

  v2 = *(void **)(*(_QWORD *)(v1 + 64) + 16);
  if (v2)
  {
    v3 = OUTLINED_FUNCTION_0(*(_QWORD **)(v1 + 24));
    if (v0)
    {
      if (qword_1EE183BA8 != -1)
        swift_once();
      v5 = sub_18FAD57F0();
      __swift_project_value_buffer(v5, (uint64_t)qword_1EE183DA8);
      swift_bridgeObjectRetain_n();
      v6 = sub_18FAD57D8();
      v7 = sub_18FAD5814();
      v8 = os_log_type_enabled(v6, v7);
      v9 = *(_QWORD *)(v1 + 40);
      if (v8)
      {
        v17 = *(_QWORD *)(v1 + 32);
        v10 = (uint8_t *)OUTLINED_FUNCTION_2();
        v18 = OUTLINED_FUNCTION_2();
        *(_DWORD *)v10 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v1 + 16) = sub_18FAB767C(v17, v9, &v18);
        sub_18FAD5820();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_18FAB0000, v6, v7, "PET2 does not support required fields on %s", v10, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      swift_bridgeObjectRelease_n();
      OUTLINED_FUNCTION_3();
    }
    else
    {
      v11 = v3;
      v12 = v4;
      v13 = *(_QWORD *)(v1 + 56);
      v6 = sub_18FAD57C0();
      sub_18FAB7DE4(v11, v12);
      v14 = (void *)sub_18FAD57FC();
      if (v13)
        v15 = (void *)sub_18FAD57FC();
      else
        v15 = 0;
      objc_msgSend(v2, sel_logMessageData_objcClassName_subGroup_, v6, v14, v15);

    }
  }
  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t EventTracker.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t EventTracker.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_18FAB767C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_18FAB774C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_18FAB7F5C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_18FAB7F5C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18FAB774C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_18FAB78A0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_18FAD582C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_18FAB7964(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_18FAD5844();
    if (!v8)
    {
      result = sub_18FAD5850();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_18FAB78A0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_18FAD585C();
  __break(1u);
  return result;
}

uint64_t sub_18FAB7964(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_18FAB79F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_18FAB7BCC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_18FAB7BCC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18FAB79F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_18FAD5808();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_18FAB7B68(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_18FAD5838();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_18FAD585C();
  __break(1u);
LABEL_14:
  result = sub_18FAD5850();
  __break(1u);
  return result;
}

_QWORD *sub_18FAB7B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE183BC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_18FAB7BCC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE183BC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_18FAB7D64(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_18FAB7CA0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_18FAB7CA0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_18FAD585C();
  __break(1u);
  return result;
}

char *sub_18FAB7D64(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_18FAD585C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_18FAB7DE4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t type metadata accessor for EventTracker()
{
  return objc_opt_self();
}

uint64_t method lookup function for EventTracker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EventTracker.log(message:objcClassName:subGroup:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of EventTracker.log(message:objcClassName:subGroup:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(*(_QWORD *)v5 + 104)
                                                                            + *(_QWORD *)(*(_QWORD *)v5 + 104));
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v12;
  *v12 = v6;
  v12[1] = sub_18FAB7EF4;
  return v14(a1, a2, a3, a4, a5);
}

uint64_t sub_18FAB7EF4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_18FAB7F5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x194007578]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0(_QWORD *a1)
{
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  return sub_18FAD57CC();
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x1940075CCLL);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_3()
{
  void *v0;

}

uint64_t ___findBucket_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void sub_18FAB9B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void parse(uint64_t a1, void *a2, void *a3)
{
  unsigned int (**v5)(id, unint64_t, _BYTE *);
  void (**v6)(_QWORD);
  unint64_t Varint;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFData *Mutable;
  uint64_t v15;
  CFIndex Length;
  __CFData *v17;
  const UInt8 *BytePtr;
  CFIndex v19;
  unint64_t v20;
  _QWORD v21[6];
  char v22;

  v5 = a2;
  v6 = a3;
  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a1 + 8))
  {
    while (1)
    {
      Varint = readVarint(a1);
      if (*(_BYTE *)(a1 + 40))
        break;
      v8 = Varint;
      v9 = Varint >> 3;
      v10 = *(_QWORD *)(a1 + 16);
      switch(Varint & 7)
      {
        case 0uLL:
          readVarint(a1);
          if (!*(_BYTE *)(a1 + 40))
            goto LABEL_18;
          goto LABEL_25;
        case 1uLL:
          v11 = v10 + 8;
          goto LABEL_16;
        case 2uLL:
          v12 = readVarint(a1);
          if (*(_BYTE *)(a1 + 40))
            goto LABEL_25;
          v13 = *(_QWORD *)(a1 + 16);
          if ((unint64_t)(v13 + v12) > *(_QWORD *)(a1 + 8))
          {
LABEL_23:
            *(_BYTE *)(a1 + 40) = 1;
            goto LABEL_25;
          }
          *(_QWORD *)(a1 + 16) = v13 + v12;
          v22 = 0;
          if (!v5[2](v5, v9, &v22))
            goto LABEL_20;
          if (v22)
          {
            Mutable = CFDataCreateMutable(0, 0);
            v15 = *(_QWORD *)(a1 + 16);
            v21[0] = v13;
            v21[1] = v15;
            v21[2] = v13;
            v21[3] = v13;
            v21[4] = Mutable;
            v21[5] = 0;
            *(_QWORD *)(a1 + 24) = v15;
            parse(v21, v5, v6);
            writeVarint(*(__CFData **)(a1 + 32), v8);
            Length = CFDataGetLength(Mutable);
            if (Length < 0)
            {
              *(_BYTE *)(a1 + 40) = 1;
              CFRelease(Mutable);
              goto LABEL_25;
            }
            writeVarint(*(__CFData **)(a1 + 32), Length);
            v17 = *(__CFData **)(a1 + 32);
            BytePtr = CFDataGetBytePtr(Mutable);
            v19 = CFDataGetLength(Mutable);
            CFDataAppendBytes(v17, BytePtr, v19);
            CFRelease(Mutable);
            if (v6)
              v6[2](v6);
            v20 = *(_QWORD *)(a1 + 16);
          }
          else
          {
LABEL_19:
            CFDataAppendBytes(*(CFMutableDataRef *)(a1 + 32), *(const UInt8 **)(a1 + 24), *(_QWORD *)(a1 + 16) - *(_QWORD *)(a1 + 24));
LABEL_20:
            v20 = *(_QWORD *)(a1 + 16);
            *(_QWORD *)(a1 + 24) = v20;
          }
          if (v20 >= *(_QWORD *)(a1 + 8))
            goto LABEL_25;
          break;
        case 5uLL:
          v11 = v10 + 4;
LABEL_16:
          if (v11 > *(_QWORD *)(a1 + 8))
            goto LABEL_23;
          *(_QWORD *)(a1 + 16) = v11;
LABEL_18:
          LOBYTE(v21[0]) = 0;
          if (((unsigned int (**)(id, unint64_t, _QWORD *))v5)[2](v5, v9, v21))
            goto LABEL_19;
          goto LABEL_20;
        default:
          goto LABEL_23;
      }
    }
  }
LABEL_25:

}

uint64_t readVarint(uint64_t a1)
{
  int v2;
  uint64_t result;
  unint64_t v4;
  unint64_t v5;

  v2 = 0;
  result = 0;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16) + 1;
  while (1)
  {
    if (v5 > v4)
    {
LABEL_6:
      result = 0;
      *(_BYTE *)(a1 + 40) = 1;
      return result;
    }
    *(_QWORD *)(a1 + 16) = v5;
    if (*(_BYTE *)(a1 + 40))
      return 0;
    result |= (unint64_t)(*(_BYTE *)(v5 - 1) & 0x7F) << v2;
    if ((*(_BYTE *)(v5 - 1) & 0x80) == 0)
      return result;
    v2 += 7;
    ++v5;
    if (v2 == 70)
      goto LABEL_6;
  }
}

void writeVarint(__CFData *a1, unint64_t a2)
{
  UInt8 *v2;
  unint64_t v3;
  unint64_t v4;
  UInt8 bytes[10];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
    v2 = bytes;
  }
  else
  {
    v2 = bytes;
    do
    {
      *v2++ = a2 | 0x80;
      v3 = a2 >> 7;
      v4 = a2 >> 14;
      a2 >>= 7;
    }
    while (v4);
  }
  *v2 = v3;
  CFDataAppendBytes(a1, bytes, v2 - bytes + 1);
}

BOOL PETDistributionReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  int *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      switch((v10 >> 3))
      {
        case 1u:
          *(_BYTE *)(a1 + 40) |= 4u;
          v18 = *v3;
          v19 = *(_QWORD *)(a2 + v18);
          if (v19 <= 0xFFFFFFFFFFFFFFF7 && v19 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v19);
            *(_QWORD *)(a2 + v18) = v19 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR___PETDistribution__min;
          goto LABEL_41;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 <= 0xFFFFFFFFFFFFFFF7 && v22 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v22 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR___PETDistribution__max;
          goto LABEL_41;
        case 3u:
          *(_BYTE *)(a1 + 40) |= 2u;
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v24);
            *(_QWORD *)(a2 + v23) = v24 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR___PETDistribution__mean;
          goto LABEL_41;
        case 4u:
          *(_BYTE *)(a1 + 40) |= 8u;
          v25 = *v3;
          v26 = *(_QWORD *)(a2 + v25);
          if (v26 <= 0xFFFFFFFFFFFFFFF7 && v26 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v20 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v26);
            *(_QWORD *)(a2 + v25) = v26 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v20 = 0;
          }
          v27 = &OBJC_IVAR___PETDistribution__variance;
LABEL_41:
          *(_QWORD *)(a1 + *v27) = v20;
          goto LABEL_42;
        default:
          if ((PBReaderSkipValueWithTag() & 1) == 0)
            return 0;
LABEL_42:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          break;
      }
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

id createBlankStorage()
{
  id v0;

  v0 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 1024));
  memset((void *)objc_msgSend(v0, "mutableBytes"), 255, 0x400uLL);
  return v0;
}

uint64_t PETAggregationKeyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  PETRawMessage *v35;
  uint64_t v36;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      v13 = v12 + 1;
      if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
        break;
      v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v13;
      v10 |= (unint64_t)(v14 & 0x7F) << v8;
      if ((v14 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v15 = v9++ >= 9;
      if (v15)
      {
        v10 = 0;
        v16 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v16 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v16 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 36) |= 4u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          v23 = v22 + 1;
          if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
            goto LABEL_42;
          v18 += 7;
          v15 = v19++ >= 9;
          if (v15)
          {
            LODWORD(v20) = 0;
            goto LABEL_44;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_42:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_44:
        v36 = 32;
        goto LABEL_49;
      case 2u:
        v26 = 0;
        v27 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 36) |= 2u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          v30 = v29 + 1;
          if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
            *(_QWORD *)(a2 + v28) = v30;
            v20 |= (unint64_t)(v31 & 0x7F) << v26;
            if (v31 < 0)
            {
              v26 += 7;
              v15 = v27++ >= 9;
              if (v15)
              {
                LODWORD(v20) = 0;
                goto LABEL_48;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_48:
        v36 = 16;
LABEL_49:
        *(_DWORD *)(a1 + v36) = v20;
        goto LABEL_52;
      case 3u:
        *(_BYTE *)(a1 + 36) |= 1u;
        v32 = *v3;
        v33 = *(_QWORD *)(a2 + v32);
        if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v34 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v33 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v34 = 0;
        }
        *(_QWORD *)(a1 + 8) = v34;
        goto LABEL_52;
      case 4u:
        v35 = objc_alloc_init(PETRawMessage);
        objc_storeStrong((id *)(a1 + 24), v35);
        if (PBReaderPlaceMark() && (PETRawMessageReadFrom((uint64_t)v35, a2) & 1) != 0)
        {
          PBReaderRecallMark();

LABEL_52:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_52;
    }
  }
}

uint64_t PET1KeyReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t v17;
  void *v18;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        PBReaderReadString();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v17;

      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18FABEDEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__555(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__556(uint64_t a1)
{

}

uint64_t PETUploadReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  PETMetadata *v17;
  uint64_t result;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(PETMetadata);
        objc_storeStrong((id *)(a1 + 32), v17);
        if (PBReaderPlaceMark() && (PETMetadataReadFrom((uint64_t)v17, a2) & 1) != 0)
          goto LABEL_27;
        goto LABEL_46;
      case 2u:
        v17 = objc_alloc_init(PETAggregatedMessage);
        objc_msgSend((id)a1, "addAggregatedMessages:", v17);
        if (!PBReaderPlaceMark() || (PETAggregatedMessageReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_46;
        goto LABEL_27;
      case 3u:
        v17 = objc_alloc_init(PETRawMessage);
        objc_msgSend((id)a1, "addUnaggregatedMessages:", v17);
        if (PBReaderPlaceMark() && (PETRawMessageReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_27:
          PBReaderRecallMark();

LABEL_44:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_46:

        return 0;
      case 5u:
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 52) |= 1u;
        while (2)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if (v24 < 0)
            {
              v19 += 7;
              v14 = v20++ >= 9;
              if (v14)
              {
                v21 = 0;
                goto LABEL_43;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_43:
        *(_BYTE *)(a1 + 48) = v21 != 0;
        goto LABEL_44;
      case 6u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 16;
        goto LABEL_39;
      case 7u:
        PBReaderReadData();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 24;
LABEL_39:
        v27 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_44;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_44;
    }
  }
}

uint64_t PETMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  char v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  char v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  char v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  char v56;
  unsigned int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  char v61;
  char v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char v67;
  char v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  char v73;
  char v74;
  unsigned int v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  void *v79;
  BOOL v80;
  uint64_t v81;
  uint64_t v82;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 100) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_101;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_103;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_101:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_103:
          *(_QWORD *)(a1 + 8) = v19;
          continue;
        case 3u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 64;
          goto LABEL_99;
        case 4u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 40;
          goto LABEL_99;
        case 5u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 16;
          goto LABEL_99;
        case 6u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_WORD *)(a1 + 100) |= 0x20u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            if (v30 == -1 || v30 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v30 + 1;
              v28 |= (unint64_t)(v31 & 0x7F) << v26;
              if (v31 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v28 = 0;
                  goto LABEL_107;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v28 = 0;
LABEL_107:
          v80 = v28 != 0;
          v81 = 94;
          goto LABEL_136;
        case 7u:
          v32 = 0;
          v33 = 0;
          v34 = 0;
          *(_WORD *)(a1 + 100) |= 0x80u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            if (v36 == -1 || v36 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v37 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v36 + 1;
              v34 |= (unint64_t)(v37 & 0x7F) << v32;
              if (v37 < 0)
              {
                v32 += 7;
                v14 = v33++ >= 9;
                if (v14)
                {
                  v34 = 0;
                  goto LABEL_111;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v34 = 0;
LABEL_111:
          v80 = v34 != 0;
          v81 = 96;
          goto LABEL_136;
        case 8u:
          v38 = 0;
          v39 = 0;
          v40 = 0;
          *(_WORD *)(a1 + 100) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            if (v42 == -1 || v42 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v43 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v42 + 1;
              v40 |= (unint64_t)(v43 & 0x7F) << v38;
              if (v43 < 0)
              {
                v38 += 7;
                v14 = v39++ >= 9;
                if (v14)
                {
                  v40 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v40 = 0;
LABEL_115:
          v80 = v40 != 0;
          v81 = 93;
          goto LABEL_136;
        case 9u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 32;
          goto LABEL_99;
        case 0xAu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
          goto LABEL_99;
        case 0xBu:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_WORD *)(a1 + 100) |= 2u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            if (v48 == -1 || v48 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v49 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
              *(_QWORD *)(a2 + v47) = v48 + 1;
              v46 |= (unint64_t)(v49 & 0x7F) << v44;
              if (v49 < 0)
              {
                v44 += 7;
                v14 = v45++ >= 9;
                if (v14)
                {
                  LODWORD(v46) = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v46) = 0;
LABEL_119:
          v82 = 24;
          goto LABEL_141;
        case 0xCu:
          v50 = 0;
          v51 = 0;
          v52 = 0;
          *(_WORD *)(a1 + 100) |= 0x100u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            if (v54 == -1 || v54 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v55 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v54);
              *(_QWORD *)(a2 + v53) = v54 + 1;
              v52 |= (unint64_t)(v55 & 0x7F) << v50;
              if (v55 < 0)
              {
                v50 += 7;
                v14 = v51++ >= 9;
                if (v14)
                {
                  v52 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v52 = 0;
LABEL_123:
          v80 = v52 != 0;
          v81 = 97;
          goto LABEL_136;
        case 0xDu:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 72;
          goto LABEL_99;
        case 0xEu:
          v56 = 0;
          v57 = 0;
          v58 = 0;
          *(_WORD *)(a1 + 100) |= 0x200u;
          while (2)
          {
            v59 = *v3;
            v60 = *(_QWORD *)(a2 + v59);
            if (v60 == -1 || v60 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v61 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v60);
              *(_QWORD *)(a2 + v59) = v60 + 1;
              v58 |= (unint64_t)(v61 & 0x7F) << v56;
              if (v61 < 0)
              {
                v56 += 7;
                v14 = v57++ >= 9;
                if (v14)
                {
                  v58 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v58 = 0;
LABEL_127:
          v80 = v58 != 0;
          v81 = 98;
          goto LABEL_136;
        case 0xFu:
          v62 = 0;
          v63 = 0;
          v64 = 0;
          *(_WORD *)(a1 + 100) |= 0x40u;
          while (2)
          {
            v65 = *v3;
            v66 = *(_QWORD *)(a2 + v65);
            if (v66 == -1 || v66 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v67 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v66);
              *(_QWORD *)(a2 + v65) = v66 + 1;
              v64 |= (unint64_t)(v67 & 0x7F) << v62;
              if (v67 < 0)
              {
                v62 += 7;
                v14 = v63++ >= 9;
                if (v14)
                {
                  v64 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v64 = 0;
LABEL_131:
          v80 = v64 != 0;
          v81 = 95;
          goto LABEL_136;
        case 0x10u:
          v68 = 0;
          v69 = 0;
          v70 = 0;
          *(_WORD *)(a1 + 100) |= 8u;
          while (2)
          {
            v71 = *v3;
            v72 = *(_QWORD *)(a2 + v71);
            if (v72 == -1 || v72 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v73 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v72);
              *(_QWORD *)(a2 + v71) = v72 + 1;
              v70 |= (unint64_t)(v73 & 0x7F) << v68;
              if (v73 < 0)
              {
                v68 += 7;
                v14 = v69++ >= 9;
                if (v14)
                {
                  v70 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v70 = 0;
LABEL_135:
          v80 = v70 != 0;
          v81 = 92;
LABEL_136:
          *(_BYTE *)(a1 + v81) = v80;
          continue;
        case 0x11u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_99;
        case 0x12u:
          v74 = 0;
          v75 = 0;
          v46 = 0;
          *(_WORD *)(a1 + 100) |= 4u;
          break;
        case 0x13u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 80;
LABEL_99:
          v79 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v76 = *v3;
        v77 = *(_QWORD *)(a2 + v76);
        if (v77 == -1 || v77 >= *(_QWORD *)(a2 + *v4))
          break;
        v78 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v77);
        *(_QWORD *)(a2 + v76) = v77 + 1;
        v46 |= (unint64_t)(v78 & 0x7F) << v74;
        if ((v78 & 0x80) == 0)
          goto LABEL_138;
        v74 += 7;
        v14 = v75++ >= 9;
        if (v14)
        {
          LODWORD(v46) = 0;
          goto LABEL_140;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_138:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v46) = 0;
LABEL_140:
      v82 = 88;
LABEL_141:
      *(_DWORD *)(a1 + v82) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_18FAC3B84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id displayStringForKey(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  v3 = 0;
  v4 = a2;
  do
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1, v4, qword_18FADA968[v3]);
    if (v5)
      v6 = 1;
    else
      v6 = v3 == 3;
    ++v3;
  }
  while (!v6);
  return v5;
}

void enumerateChain(uint64_t a1, unint64_t a2, unsigned int a3, void *a4, void *a5, void *a6)
{
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned int v19;
  unint64_t v20;
  uint8_t *v21;
  NSObject *v22;
  const char *v23;
  BOOL v24;
  uint64_t v25;
  __int16 v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  v15 = MEMORY[0x1E0C81028];
  do
  {
    if (v10 == 0xFFFFFFFF)
    {

      return;
    }
    v16 = v10 + 10;
    if (v10 + 10 > a2)
      break;
    v17 = a1 + v10;
    if (*(unsigned __int8 *)(a1 + v10) != 228)
      break;
    v18 = *(unsigned __int16 *)(v17 + 4);
    v19 = v16 + v18;
    if (v16 + v18 + *(unsigned __int16 *)(v17 + 2) > a2)
      break;
    v20 = *(unsigned int *)(v17 + 6);
    v13 = v17 + 10;
    switch(*(_BYTE *)(v17 + 1))
    {
      case 0:
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v26 = 0;
          v21 = (uint8_t *)&v26;
          v22 = v15;
          v23 = "Can not have value node inside value node";
          goto LABEL_17;
        }
        break;
      case 1:
        if (v11)
          (*((void (**)(id, uint64_t, uint64_t, double))v11 + 2))(v11, v13, v18, *(double *)(a1 + v19));
        break;
      case 2:
        visitDistribution(a1, a2, v13, v18, v19, v12, v14);
        break;
      case 3:
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v25) = 0;
          v21 = (uint8_t *)&v25;
          v22 = v15;
          v23 = "Can not have distribution-tail node inside value node";
LABEL_17:
          _os_log_error_impl(&dword_18FAB0000, v22, OS_LOG_TYPE_ERROR, v23, v21, 2u);
        }
        break;
      default:
        break;
    }
    v24 = v10 >= v20;
    v10 = v20;
  }
  while (!v24);
  objc_msgSend(v14, "saveCorruptState", v13, v25);
  objc_msgSend(v14, "resetLocked");
  __break(1u);
}

void visitDistribution(uint64_t a1, unint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  unsigned __int16 *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  unsigned int v23;
  void (**v24)(_QWORD);
  __n128 v25;
  __int16 v26;
  uint64_t v27;
  unsigned __int16 v28;
  unsigned int *v29;
  unint64_t v30;
  __int16 v31;
  _QWORD v32[66];
  _QWORD v33[265];
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  id v37;
  _QWORD v38[9];

  v38[8] = *MEMORY[0x1E0C80C00];
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (!v13)
    goto LABEL_21;
  v16 = (unsigned __int16 *)(a1 + a5);
  if (*((_DWORD *)v16 + 11) != 1167568894)
  {
LABEL_23:
    objc_msgSend(v15, "saveCorruptState");
    objc_msgSend(v15, "resetLocked");
    __break(1u);
  }
  v35 = a3;
  v36 = a4;
  v37 = v14;
  v34 = *v16;
  v17 = *((unsigned int *)v16 + 1);
  v18 = *((double *)v16 + 1);
  v19 = *((double *)v16 + 2);
  v20 = *((double *)v16 + 3);
  v21 = *((double *)v16 + 4);
  v22 = *((unsigned int *)v16 + 10);
  v23 = v16[1];
  MEMORY[0x1E0C80A78]();
  bzero(v33, 0x83FuLL);
  MEMORY[0x1E0C80A78]();
  bzero(v32, 0x20FuLL);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __visitDistribution_block_invoke;
  v38[3] = &__block_descriptor_64_e5_v8__0l;
  v38[4] = v33;
  v38[5] = 1;
  v38[6] = v32;
  v38[7] = 1;
  v24 = (void (**)(_QWORD))MEMORY[0x194007398](v38);
  v33[0] = v16 + 24;
  if (v23 >= 0xFA)
    v26 = 250;
  else
    v26 = v23;
  LOWORD(v32[0]) = v26;
  if (v22 != 0xFFFFFFFF)
  {
    v28 = v23 - v26;
    v27 = 1;
    while (v22 + 2048 <= a2)
    {
      v29 = (unsigned int *)(a1 + v22);
      if (*(_DWORD *)(a1 + v22 + 4) != -461418838)
        break;
      v30 = *v29;
      v33[v27] = v29 + 2;
      v31 = v28;
      if (v28 >= 0xFFu)
        v31 = 255;
      *((_WORD *)v32 + v27) = v31;
      if (v22 >= v30)
        break;
      ++v27;
      v28 -= v31;
      v22 = v30;
      if (v30 == 0xFFFFFFFF)
        goto LABEL_15;
    }
    v15 = v37;
    objc_msgSend(v37, "saveCorruptState", v32[0]);
    objc_msgSend(v15, "resetLocked");
    __break(1u);
    goto LABEL_23;
  }
  v27 = 1;
LABEL_15:
  if (v17 <= 1)
    v25.n128_u64[0] = 0x7FF8000000000000;
  else
    v25.n128_f64[0] = v19 / (double)(v17 - 1);
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t, _QWORD *, _QWORD *, double, __n128, double, double))v13
   + 2))(v13, v35, v36, v34, v17, v27, v33, v32, v18, v25, v20, v21);
  if (v24)
    v24[2](v24);

  v15 = v37;
LABEL_21:

}

void sub_18FAC43B4(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (v1)
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Unwind_Resume(exception_object);
}

void __visitDistribution_block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 40))
    free(*(void **)(a1 + 32));
  if (!*(_BYTE *)(a1 + 56))
    free(*(void **)(a1 + 48));
}

void callWithHashableBytesOfString(void *a1, void *a2)
{
  _QWORD *v3;
  const char *CStringPtr;
  void *v5;
  unsigned __int16 v6;
  void (*v7)(_QWORD *, void *, uint64_t);
  uint64_t v8;
  const UniChar *CharactersPtr;
  __int16 v10;
  __CFString *v11;
  void *v12;
  __CFString *theString;

  theString = a1;
  v3 = a2;
  CStringPtr = CFStringGetCStringPtr(theString, 0x600u);
  if (CStringPtr)
  {
    v5 = (void *)CStringPtr;
    v6 = -[__CFString length](theString, "length");
    v7 = (void (*)(_QWORD *, void *, uint64_t))v3[2];
    v8 = v6;
LABEL_5:
    v7(v3, v5, v8);
    goto LABEL_6;
  }
  CharactersPtr = CFStringGetCharactersPtr(theString);
  if (CharactersPtr)
  {
    v5 = (void *)CharactersPtr;
    v10 = -[__CFString length](theString, "length");
    v7 = (void (*)(_QWORD *, void *, uint64_t))v3[2];
    v8 = 2 * (v10 & 0x7FFFu);
    goto LABEL_5;
  }
  if (-[__CFString canBeConvertedToEncoding:](theString, "canBeConvertedToEncoding:", 1))
  {
    v11 = objc_retainAutorelease(theString);
    ((void (*)(_QWORD *, uint64_t, _QWORD))v3[2])(v3, -[__CFString UTF8String](v11, "UTF8String"), (unsigned __int16)-[__CFString length](v11, "length"));
  }
  else
  {
    v12 = malloc_type_malloc(2 * -[__CFString length](theString, "length"), 0x1000040BDFB0063uLL);
    -[__CFString getCharacters:](theString, "getCharacters:", v12);
    ((void (*)(_QWORD *, void *, _QWORD))v3[2])(v3, v12, 2 * (-[__CFString length](theString, "length") & 0x7FFF));
    free(v12);
  }
LABEL_6:

}

void setBucketPtr(uint64_t a1, unint64_t a2, unsigned int a3, int a4, void *a5)
{
  id v9;
  void *v10;

  v9 = a5;
  if ((unint64_t)a3 + 4 <= a2 && *(_DWORD *)(a1 + a3) == -1)
  {
    *(_DWORD *)(a1 + a3) = a4;

  }
  else
  {
    v10 = v9;
    objc_msgSend(v9, "saveCorruptState");
    objc_msgSend(v10, "resetLocked");
    __break(1u);
  }
}

void sub_18FAC4730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t COMAPPLEPETCOMMONPETMetadataReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  char v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  char v49;
  unsigned int v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  char v54;
  char v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  char v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  char v72;
  char v73;
  unsigned int v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  unint64_t v81;
  char v82;
  uint64_t result;
  void *v84;
  BOOL v85;
  uint64_t v86;
  uint64_t v87;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 2u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_WORD *)(a1 + 116) |= 1u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_109;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_111;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_109:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_111:
          *(_QWORD *)(a1 + 8) = v19;
          continue;
        case 3u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 72;
          goto LABEL_107;
        case 4u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 40;
          goto LABEL_107;
        case 5u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 16;
          goto LABEL_107;
        case 6u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_WORD *)(a1 + 116) |= 0x40u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v27 |= (unint64_t)(v30 & 0x7F) << v25;
              if (v30 < 0)
              {
                v25 += 7;
                v14 = v26++ >= 9;
                if (v14)
                {
                  v27 = 0;
                  goto LABEL_115;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v27 = 0;
LABEL_115:
          v85 = v27 != 0;
          v86 = 110;
          goto LABEL_144;
        case 7u:
          v31 = 0;
          v32 = 0;
          v33 = 0;
          *(_WORD *)(a1 + 116) |= 0x100u;
          while (2)
          {
            v34 = *v3;
            v35 = *(_QWORD *)(a2 + v34);
            if (v35 == -1 || v35 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v35);
              *(_QWORD *)(a2 + v34) = v35 + 1;
              v33 |= (unint64_t)(v36 & 0x7F) << v31;
              if (v36 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v33 = 0;
                  goto LABEL_119;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v33 = 0;
LABEL_119:
          v85 = v33 != 0;
          v86 = 112;
          goto LABEL_144;
        case 8u:
          v37 = 0;
          v38 = 0;
          v39 = 0;
          *(_WORD *)(a1 + 116) |= 0x20u;
          while (2)
          {
            v40 = *v3;
            v41 = *(_QWORD *)(a2 + v40);
            if (v41 == -1 || v41 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v42 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v41);
              *(_QWORD *)(a2 + v40) = v41 + 1;
              v39 |= (unint64_t)(v42 & 0x7F) << v37;
              if (v42 < 0)
              {
                v37 += 7;
                v14 = v38++ >= 9;
                if (v14)
                {
                  v39 = 0;
                  goto LABEL_123;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v39 = 0;
LABEL_123:
          v85 = v39 != 0;
          v86 = 109;
          goto LABEL_144;
        case 9u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 32;
          goto LABEL_107;
        case 0xAu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 48;
          goto LABEL_107;
        case 0xBu:
          v43 = 0;
          v44 = 0;
          v45 = 0;
          *(_WORD *)(a1 + 116) |= 2u;
          while (2)
          {
            v46 = *v3;
            v47 = *(_QWORD *)(a2 + v46);
            if (v47 == -1 || v47 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v47);
              *(_QWORD *)(a2 + v46) = v47 + 1;
              v45 |= (unint64_t)(v48 & 0x7F) << v43;
              if (v48 < 0)
              {
                v43 += 7;
                v14 = v44++ >= 9;
                if (v14)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v45) = 0;
LABEL_127:
          v87 = 24;
          goto LABEL_153;
        case 0xCu:
          v49 = 0;
          v50 = 0;
          v51 = 0;
          *(_WORD *)(a1 + 116) |= 0x200u;
          while (2)
          {
            v52 = *v3;
            v53 = *(_QWORD *)(a2 + v52);
            if (v53 == -1 || v53 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v54 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v53);
              *(_QWORD *)(a2 + v52) = v53 + 1;
              v51 |= (unint64_t)(v54 & 0x7F) << v49;
              if (v54 < 0)
              {
                v49 += 7;
                v14 = v50++ >= 9;
                if (v14)
                {
                  v51 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v51 = 0;
LABEL_131:
          v85 = v51 != 0;
          v86 = 113;
          goto LABEL_144;
        case 0xDu:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 80;
          goto LABEL_107;
        case 0xEu:
          v55 = 0;
          v56 = 0;
          v57 = 0;
          *(_WORD *)(a1 + 116) |= 0x400u;
          while (2)
          {
            v58 = *v3;
            v59 = *(_QWORD *)(a2 + v58);
            if (v59 == -1 || v59 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v60 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v59);
              *(_QWORD *)(a2 + v58) = v59 + 1;
              v57 |= (unint64_t)(v60 & 0x7F) << v55;
              if (v60 < 0)
              {
                v55 += 7;
                v14 = v56++ >= 9;
                if (v14)
                {
                  v57 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v57 = 0;
LABEL_135:
          v85 = v57 != 0;
          v86 = 114;
          goto LABEL_144;
        case 0xFu:
          v61 = 0;
          v62 = 0;
          v63 = 0;
          *(_WORD *)(a1 + 116) |= 0x80u;
          while (2)
          {
            v64 = *v3;
            v65 = *(_QWORD *)(a2 + v64);
            if (v65 == -1 || v65 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v66 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v65);
              *(_QWORD *)(a2 + v64) = v65 + 1;
              v63 |= (unint64_t)(v66 & 0x7F) << v61;
              if (v66 < 0)
              {
                v61 += 7;
                v14 = v62++ >= 9;
                if (v14)
                {
                  v63 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v63 = 0;
LABEL_139:
          v85 = v63 != 0;
          v86 = 111;
          goto LABEL_144;
        case 0x10u:
          v67 = 0;
          v68 = 0;
          v69 = 0;
          *(_WORD *)(a1 + 116) |= 0x10u;
          while (2)
          {
            v70 = *v3;
            v71 = *(_QWORD *)(a2 + v70);
            if (v71 == -1 || v71 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v72 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v71);
              *(_QWORD *)(a2 + v70) = v71 + 1;
              v69 |= (unint64_t)(v72 & 0x7F) << v67;
              if (v72 < 0)
              {
                v67 += 7;
                v14 = v68++ >= 9;
                if (v14)
                {
                  v69 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v69 = 0;
LABEL_143:
          v85 = v69 != 0;
          v86 = 108;
LABEL_144:
          *(_BYTE *)(a1 + v86) = v85;
          continue;
        case 0x11u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 56;
          goto LABEL_107;
        case 0x12u:
          v73 = 0;
          v74 = 0;
          v45 = 0;
          *(_WORD *)(a1 + 116) |= 8u;
          while (2)
          {
            v75 = *v3;
            v76 = *(_QWORD *)(a2 + v75);
            if (v76 == -1 || v76 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v76);
              *(_QWORD *)(a2 + v75) = v76 + 1;
              v45 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                v14 = v74++ >= 9;
                if (v14)
                {
                  LODWORD(v45) = 0;
                  goto LABEL_148;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v45) = 0;
LABEL_148:
          v87 = 104;
          goto LABEL_153;
        case 0x13u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 96;
          goto LABEL_107;
        case 0x14u:
          v78 = 0;
          v79 = 0;
          v45 = 0;
          *(_WORD *)(a1 + 116) |= 4u;
          break;
        case 0x16u:
          PBReaderReadString();
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = 64;
LABEL_107:
          v84 = *(void **)(a1 + v24);
          *(_QWORD *)(a1 + v24) = v23;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v80 = *v3;
        v81 = *(_QWORD *)(a2 + v80);
        if (v81 == -1 || v81 >= *(_QWORD *)(a2 + *v4))
          break;
        v82 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
        *(_QWORD *)(a2 + v80) = v81 + 1;
        v45 |= (unint64_t)(v82 & 0x7F) << v78;
        if ((v82 & 0x80) == 0)
          goto LABEL_150;
        v78 += 7;
        v14 = v79++ >= 9;
        if (v14)
        {
          LODWORD(v45) = 0;
          goto LABEL_152;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_150:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v45) = 0;
LABEL_152:
      v87 = 88;
LABEL_153:
      *(_DWORD *)(a1 + v87) = v45;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PETAggregatedMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  PETDistribution *v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v18 = objc_alloc_init(PETDistribution);
        objc_storeStrong((id *)(a1 + 16), v18);
        if (!PBReaderPlaceMark() || !PETDistributionReadFrom((uint64_t)v18, a2))
        {
LABEL_42:

          return 0;
        }
      }
      else
      {
        if ((_DWORD)v17 == 2)
        {
          v19 = 0;
          v20 = 0;
          v21 = 0;
          *(_BYTE *)(a1 + 32) |= 1u;
          while (1)
          {
            v22 = *v3;
            v23 = *(_QWORD *)(a2 + v22);
            if (v23 == -1 || v23 >= *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 1;
            v21 |= (unint64_t)(v24 & 0x7F) << v19;
            if ((v24 & 0x80) == 0)
              goto LABEL_37;
            v19 += 7;
            v14 = v20++ >= 9;
            if (v14)
            {
              LODWORD(v21) = 0;
              goto LABEL_39;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v21) = 0;
LABEL_39:
          *(_DWORD *)(a1 + 8) = v21;
          continue;
        }
        if ((_DWORD)v17 != 1)
        {
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
        }
        v18 = objc_alloc_init(PETAggregationKey);
        objc_storeStrong((id *)(a1 + 24), v18);
        if (!PBReaderPlaceMark() || (PETAggregationKeyReadFrom((uint64_t)v18, a2) & 1) == 0)
          goto LABEL_42;
      }
      PBReaderRecallMark();

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t PETRawMessageReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 8;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            v18 = 0;
            v19 = 0;
            v20 = 0;
            *(_BYTE *)(a1 + 28) |= 1u;
            while (1)
            {
              v21 = *v3;
              v22 = *(_QWORD *)(a2 + v21);
              if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
                break;
              v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
              *(_QWORD *)(a2 + v21) = v22 + 1;
              v20 |= (unint64_t)(v23 & 0x7F) << v18;
              if ((v23 & 0x80) == 0)
                goto LABEL_34;
              v18 += 7;
              v14 = v19++ >= 9;
              if (v14)
              {
                LODWORD(v20) = 0;
                goto LABEL_36;
              }
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_34:
            if (*(_BYTE *)(a2 + *v5))
              LODWORD(v20) = 0;
LABEL_36:
            *(_DWORD *)(a1 + 24) = v20;
          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        PBReaderReadData();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 16;
      }
      v26 = *(void **)(a1 + v25);
      *(_QWORD *)(a1 + v25) = v24;

    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t chunkCompareByOffset(_DWORD *a1, _DWORD *a2)
{
  if (*a1 < *a2)
    return 0xFFFFFFFFLL;
  else
    return *a1 > *a2;
}

uint64_t ___findBucket_block_invoke_1415(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  char v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  char v39;
  unsigned int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char v44;
  char v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v18 = 0;
          v19 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 44) |= 4u;
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_60;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_62:
          v54 = 24;
          goto LABEL_80;
        case 2u:
          v26 = 0;
          v27 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 0x20u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v31;
              v28 |= (unint64_t)(v32 & 0x7F) << v26;
              if (v32 < 0)
              {
                v26 += 7;
                v15 = v27++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_66:
          v55 = 40;
          goto LABEL_75;
        case 3u:
          v33 = 0;
          v34 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 8u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v37;
              v28 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_70:
          v55 = 32;
          goto LABEL_75;
        case 4u:
          v39 = 0;
          v40 = 0;
          v28 = 0;
          *(_BYTE *)(a1 + 44) |= 0x10u;
          while (2)
          {
            v41 = *v3;
            v42 = *(_QWORD *)(a2 + v41);
            v43 = v42 + 1;
            if (v42 == -1 || v43 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v44 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v42);
              *(_QWORD *)(a2 + v41) = v43;
              v28 |= (unint64_t)(v44 & 0x7F) << v39;
              if (v44 < 0)
              {
                v39 += 7;
                v15 = v40++ >= 9;
                if (v15)
                {
                  LODWORD(v28) = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v28) = 0;
LABEL_74:
          v55 = 36;
LABEL_75:
          *(_DWORD *)(a1 + v55) = v28;
          continue;
        case 5u:
          v45 = 0;
          v46 = 0;
          v20 = 0;
          *(_BYTE *)(a1 + 44) |= 2u;
          break;
        case 6u:
          *(_BYTE *)(a1 + 44) |= 1u;
          v51 = *v3;
          v52 = *(_QWORD *)(a2 + v51);
          if (v52 <= 0xFFFFFFFFFFFFFFF7 && v52 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v53 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v52);
            *(_QWORD *)(a2 + v51) = v52 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v53 = 0;
          }
          *(_QWORD *)(a1 + 8) = v53;
          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v47 = *v3;
        v48 = *(_QWORD *)(a2 + v47);
        v49 = v48 + 1;
        if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
          break;
        v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v48);
        *(_QWORD *)(a2 + v47) = v49;
        v20 |= (unint64_t)(v50 & 0x7F) << v45;
        if ((v50 & 0x80) == 0)
          goto LABEL_77;
        v45 += 7;
        v15 = v46++ >= 9;
        if (v15)
        {
          v20 = 0;
          goto LABEL_79;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_77:
      if (*(_BYTE *)(a2 + *v5))
        v20 = 0;
LABEL_79:
      v54 = 16;
LABEL_80:
      *(_QWORD *)(a1 + v54) = v20;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSUberEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  COMAPPLEPROACTIVEGMSGMSInferenceEvent *v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  void *v33;
  char v34;
  unsigned int v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x1E0D82BB8];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 144) |= 4u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_68;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_70;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_68:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_70:
        *(_DWORD *)(a1 + 72) = v19;
        goto LABEL_80;
      case 2u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 32;
        goto LABEL_53;
      case 3u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 104;
        goto LABEL_53;
      case 4u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 112;
        goto LABEL_53;
      case 5u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 96;
        goto LABEL_53;
      case 6u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 136;
        goto LABEL_53;
      case 7u:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 40;
        goto LABEL_53;
      case 8u:
        v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSInferenceEvent);
        objc_storeStrong((id *)(a1 + 88), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 9u:
        v27 = 0;
        v28 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 144) |= 2u;
        while (2)
        {
          v30 = *v3;
          v31 = *(_QWORD *)(a2 + v30);
          if (v31 == -1 || v31 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v31);
            *(_QWORD *)(a2 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if (v32 < 0)
            {
              v27 += 7;
              v14 = v28++ >= 9;
              if (v14)
              {
                v29 = 0;
                goto LABEL_74;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_74:
        v39 = 16;
        goto LABEL_79;
      case 0xAu:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 128;
        goto LABEL_53;
      case 0xBu:
        v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSAssetEvent);
        objc_storeStrong((id *)(a1 + 24), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSAssetEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 0xCu:
        v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent);
        objc_storeStrong((id *)(a1 + 80), v26);
        if (!PBReaderPlaceMark()
          || (COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom((uint64_t)v26, a2) & 1) == 0)
        {
          goto LABEL_82;
        }
        goto LABEL_66;
      case 0xDu:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 48;
        goto LABEL_53;
      case 0xEu:
        PBReaderReadString();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = 56;
LABEL_53:
        v33 = *(void **)(a1 + v25);
        *(_QWORD *)(a1 + v25) = v24;

        goto LABEL_80;
      case 0xFu:
        v34 = 0;
        v35 = 0;
        v29 = 0;
        *(_BYTE *)(a1 + 144) |= 1u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v29 |= (unint64_t)(v38 & 0x7F) << v34;
            if (v38 < 0)
            {
              v34 += 7;
              v14 = v35++ >= 9;
              if (v14)
              {
                v29 = 0;
                goto LABEL_78;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v29 = 0;
LABEL_78:
        v39 = 8;
LABEL_79:
        *(_QWORD *)(a1 + v39) = v29;
        goto LABEL_80;
      case 0x10u:
        v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSError);
        objc_storeStrong((id *)(a1 + 64), v26);
        if (!PBReaderPlaceMark() || (COMAPPLEPROACTIVEGMSGMSErrorReadFrom((uint64_t)v26, a2) & 1) == 0)
          goto LABEL_82;
        goto LABEL_66;
      case 0x11u:
        v26 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSPrewarmEvent);
        objc_storeStrong((id *)(a1 + 120), v26);
        if (PBReaderPlaceMark()
          && (COMAPPLEPROACTIVEGMSGMSPrewarmEventReadFrom((uint64_t)v26, a2) & 1) != 0)
        {
LABEL_66:
          PBReaderRecallMark();

LABEL_80:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_82:

        return 0;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_80;
    }
  }
}

BOOL COMAPPLEPROACTIVEGMSGMSPETUploadEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  COMAPPLEPETCOMMONPETMetadata *v17;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = objc_alloc_init(COMAPPLEPETCOMMONPETMetadata);
        objc_storeStrong((id *)(a1 + 8), v17);
        if (!PBReaderPlaceMark() || (COMAPPLEPETCOMMONPETMetadataReadFrom((uint64_t)v17, a2) & 1) == 0)
          goto LABEL_30;
LABEL_25:
        PBReaderRecallMark();

        goto LABEL_27;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_27:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v17 = objc_alloc_init(COMAPPLEPROACTIVEGMSGMSUberEvent);
    objc_storeStrong((id *)(a1 + 16), v17);
    if (!PBReaderPlaceMark() || (COMAPPLEPROACTIVEGMSGMSUberEventReadFrom((uint64_t)v17, a2) & 1) == 0)
    {
LABEL_30:

      return 0;
    }
    goto LABEL_25;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  BOOL v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    while (2)
    {
      if (!*(_BYTE *)(a2 + *v5))
      {
        v8 = 0;
        v9 = 0;
        v10 = 0;
        while (1)
        {
          v11 = *v3;
          v12 = *(_QWORD *)(a2 + v11);
          v13 = v12 + 1;
          if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
            break;
          v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
          *(_QWORD *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0)
            goto LABEL_12;
          v8 += 7;
          v15 = v9++ >= 9;
          if (v15)
          {
            v10 = 0;
            v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
        v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(_BYTE *)(a2 + *v5))
          v10 = 0;
LABEL_14:
        if (v16)
          v17 = 1;
        else
          v17 = (v10 & 7) == 4;
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              v18 = 0;
              v19 = 0;
              v20 = 0;
              *(_BYTE *)(a1 + 64) |= 0x10u;
              break;
            case 2u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 48;
              goto LABEL_30;
            case 3u:
              PBReaderReadString();
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = 56;
LABEL_30:
              v28 = *(void **)(a1 + v27);
              *(_QWORD *)(a1 + v27) = v26;

              goto LABEL_56;
            case 4u:
              *(_BYTE *)(a1 + 64) |= 8u;
              v29 = *v3;
              v30 = *(_QWORD *)(a2 + v29);
              if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v30);
                *(_QWORD *)(a2 + v29) = v30 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v31 = 0;
              }
              v38 = 32;
              goto LABEL_55;
            case 5u:
              *(_BYTE *)(a1 + 64) |= 2u;
              v32 = *v3;
              v33 = *(_QWORD *)(a2 + v32);
              if (v33 <= 0xFFFFFFFFFFFFFFF7 && v33 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v33);
                *(_QWORD *)(a2 + v32) = v33 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v31 = 0;
              }
              v38 = 16;
              goto LABEL_55;
            case 6u:
              *(_BYTE *)(a1 + 64) |= 1u;
              v34 = *v3;
              v35 = *(_QWORD *)(a2 + v34);
              if (v35 <= 0xFFFFFFFFFFFFFFF7 && v35 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v35);
                *(_QWORD *)(a2 + v34) = v35 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v31 = 0;
              }
              v38 = 8;
              goto LABEL_55;
            case 7u:
              *(_BYTE *)(a1 + 64) |= 4u;
              v36 = *v3;
              v37 = *(_QWORD *)(a2 + v36);
              if (v37 <= 0xFFFFFFFFFFFFFFF7 && v37 + 8 <= *(_QWORD *)(a2 + *v4))
              {
                v31 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v37);
                *(_QWORD *)(a2 + v36) = v37 + 8;
              }
              else
              {
                *(_BYTE *)(a2 + *v5) = 1;
                v31 = 0;
              }
              v38 = 24;
LABEL_55:
              *(_QWORD *)(a1 + v38) = v31;
              goto LABEL_56;
            default:
              result = PBReaderSkipValueWithTag();
              if (!(_DWORD)result)
                return result;
LABEL_56:
              if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
                return *(_BYTE *)(a2 + *v5) == 0;
              continue;
          }
          while (1)
          {
            v21 = *v3;
            v22 = *(_QWORD *)(a2 + v21);
            v23 = v22 + 1;
            if (v22 == -1 || v23 > *(_QWORD *)(a2 + *v4))
              break;
            v24 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
            *(_QWORD *)(a2 + v21) = v23;
            v20 |= (unint64_t)(v24 & 0x7F) << v18;
            if ((v24 & 0x80) == 0)
              goto LABEL_44;
            v18 += 7;
            v15 = v19++ >= 9;
            if (v15)
            {
              v20 = 0;
              goto LABEL_46;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_44:
          if (*(_BYTE *)(a2 + *v5))
            v20 = 0;
LABEL_46:
          *(_QWORD *)(a1 + 40) = v20;
          goto LABEL_56;
        }
      }
      break;
    }
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSInferenceEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  unint64_t v7;
  unint64_t v8;
  int *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  BOOL v27;
  int v28;
  char v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t result;
  char v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  char v76;
  unsigned int v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  char v81;
  char v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  char v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char v100;
  unsigned int v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  char v105;
  char v106;
  unsigned int v107;
  uint64_t v108;
  uint64_t v109;
  unint64_t v110;
  char v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = 0x1EE183000uLL;
    v8 = 0x1EE183000uLL;
    v9 = (int *)MEMORY[0x1E0D82BB8];
    v10 = 0x1EE183000uLL;
    v11 = 0x1EE183000uLL;
    v12 = 0x1EE183000uLL;
    v13 = 0x1EE183000uLL;
    v14 = 0x1EE183000uLL;
    v15 = 0x1EE183000uLL;
    v16 = 0x1EE183000uLL;
    v17 = 0x1EE183000uLL;
    v18 = 0x1EE183000uLL;
    v19 = 0x1EE183000uLL;
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v20 = 0;
      v21 = 0;
      v22 = 0;
      while (1)
      {
        v23 = *v3;
        v24 = *(_QWORD *)(a2 + v23);
        v25 = v24 + 1;
        if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
          break;
        v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v24);
        *(_QWORD *)(a2 + v23) = v25;
        v22 |= (unint64_t)(v26 & 0x7F) << v20;
        if ((v26 & 0x80) == 0)
          goto LABEL_12;
        v20 += 7;
        v27 = v21++ >= 9;
        if (v27)
        {
          v22 = 0;
          v28 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v28 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v22 = 0;
LABEL_14:
      if (v28 || (v22 & 7) == 4)
        break;
      switch((v22 >> 3))
      {
        case 1u:
          v30 = 0;
          v31 = 0;
          v32 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x100000u;
          while (1)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            v35 = v34 + 1;
            if (v34 == -1 || v35 > *(_QWORD *)(a2 + *v4))
              break;
            v36 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v34);
            *(_QWORD *)(a2 + v33) = v35;
            v32 |= (unint64_t)(v36 & 0x7F) << v30;
            if ((v36 & 0x80) == 0)
              goto LABEL_121;
            v30 += 7;
            v27 = v31++ >= 9;
            if (v27)
            {
              LODWORD(v32) = 0;
              goto LABEL_123;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_121:
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v32) = 0;
LABEL_123:
          *(_DWORD *)(a1 + *(int *)(v8 + 2212)) = v32;
          continue;
        case 2u:
          v44 = 0;
          v45 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 8u;
          while (2)
          {
            v47 = *v3;
            v48 = *(_QWORD *)(a2 + v47);
            v49 = v48 + 1;
            if (v48 == -1 || v49 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v50 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v48);
              *(_QWORD *)(a2 + v47) = v49;
              v46 |= (unint64_t)(v50 & 0x7F) << v44;
              if (v50 < 0)
              {
                v44 += 7;
                v27 = v45++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_127;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_127:
          v118 = *(int *)(v10 + 2216);
          goto LABEL_156;
        case 3u:
          v51 = 0;
          v52 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x10u;
          while (2)
          {
            v53 = *v3;
            v54 = *(_QWORD *)(a2 + v53);
            v55 = v54 + 1;
            if (v54 == -1 || v55 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v56 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v54);
              *(_QWORD *)(a2 + v53) = v55;
              v46 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                v27 = v52++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_131;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_131:
          v118 = *(int *)(v11 + 2220);
          goto LABEL_156;
        case 4u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x40000u;
          v57 = *v3;
          v58 = *(_QWORD *)(a2 + v57);
          if (v58 <= 0xFFFFFFFFFFFFFFF7 && v58 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v58);
            *(_QWORD *)(a2 + v57) = v58 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v12 + 2224);
          goto LABEL_181;
        case 5u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x10000u;
          v60 = *v3;
          v61 = *(_QWORD *)(a2 + v60);
          if (v61 <= 0xFFFFFFFFFFFFFFF7 && v61 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v61);
            *(_QWORD *)(a2 + v60) = v61 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v13 + 2228);
          goto LABEL_181;
        case 6u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x20000u;
          v62 = *v3;
          v63 = *(_QWORD *)(a2 + v62);
          if (v63 <= 0xFFFFFFFFFFFFFFF7 && v63 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v63);
            *(_QWORD *)(a2 + v62) = v63 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v14 + 2232);
          goto LABEL_181;
        case 7u:
          v64 = 0;
          v65 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x80000u;
          while (2)
          {
            v66 = *v3;
            v67 = *(_QWORD *)(a2 + v66);
            v68 = v67 + 1;
            if (v67 == -1 || v68 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v69 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v67);
              *(_QWORD *)(a2 + v66) = v68;
              v46 |= (unint64_t)(v69 & 0x7F) << v64;
              if (v69 < 0)
              {
                v64 += 7;
                v27 = v65++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_135;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_135:
          v118 = *(int *)(v15 + 2236);
          goto LABEL_156;
        case 8u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 4u;
          v70 = *v3;
          v71 = *(_QWORD *)(a2 + v70);
          if (v71 <= 0xFFFFFFFFFFFFFFF7 && v71 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v71);
            *(_QWORD *)(a2 + v70) = v71 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v16 + 2240);
          goto LABEL_181;
        case 9u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 2u;
          v72 = *v3;
          v73 = *(_QWORD *)(a2 + v72);
          if (v73 <= 0xFFFFFFFFFFFFFFF7 && v73 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v73);
            *(_QWORD *)(a2 + v72) = v73 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v17 + 2244);
          goto LABEL_181;
        case 0xAu:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 1u;
          v74 = *v3;
          v75 = *(_QWORD *)(a2 + v74);
          if (v75 <= 0xFFFFFFFFFFFFFFF7 && v75 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v75);
            *(_QWORD *)(a2 + v74) = v75 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = *(int *)(v18 + 2248);
          goto LABEL_181;
        case 0xBu:
          v76 = 0;
          v77 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x1000u;
          while (2)
          {
            v78 = *v3;
            v79 = *(_QWORD *)(a2 + v78);
            v80 = v79 + 1;
            if (v79 == -1 || v80 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v81 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v79);
              *(_QWORD *)(a2 + v78) = v80;
              v46 |= (unint64_t)(v81 & 0x7F) << v76;
              if (v81 < 0)
              {
                v76 += 7;
                v27 = v77++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_139;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_139:
          v118 = *(int *)(v19 + 2252);
          goto LABEL_156;
        case 0xCu:
          v82 = 0;
          v83 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x20u;
          while (2)
          {
            v84 = *v3;
            v85 = *(_QWORD *)(a2 + v84);
            v86 = v85 + 1;
            if (v85 == -1 || v86 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v87 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v85);
              *(_QWORD *)(a2 + v84) = v86;
              v46 |= (unint64_t)(v87 & 0x7F) << v82;
              if (v87 < 0)
              {
                v82 += 7;
                v27 = v83++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_143;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_143:
          v118 = 48;
          goto LABEL_156;
        case 0xDu:
          v88 = 0;
          v89 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x400u;
          while (2)
          {
            v90 = *v3;
            v91 = *(_QWORD *)(a2 + v90);
            v92 = v91 + 1;
            if (v91 == -1 || v92 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v93 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v91);
              *(_QWORD *)(a2 + v90) = v92;
              v46 |= (unint64_t)(v93 & 0x7F) << v88;
              if (v93 < 0)
              {
                v88 += 7;
                v27 = v89++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_147;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_147:
          v118 = 88;
          goto LABEL_156;
        case 0xEu:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x100u;
          v94 = *v3;
          v95 = *(_QWORD *)(a2 + v94);
          if (v95 <= 0xFFFFFFFFFFFFFFF7 && v95 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v95);
            *(_QWORD *)(a2 + v94) = v95 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 72;
          goto LABEL_181;
        case 0xFu:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x4000u;
          v96 = *v3;
          v97 = *(_QWORD *)(a2 + v96);
          if (v97 <= 0xFFFFFFFFFFFFFFF7 && v97 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v97);
            *(_QWORD *)(a2 + v96) = v97 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 120;
          goto LABEL_181;
        case 0x10u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x200u;
          v98 = *v3;
          v99 = *(_QWORD *)(a2 + v98);
          if (v99 <= 0xFFFFFFFFFFFFFFF7 && v99 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v99);
            *(_QWORD *)(a2 + v98) = v99 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 80;
          goto LABEL_181;
        case 0x11u:
          v100 = 0;
          v101 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x80u;
          while (2)
          {
            v102 = *v3;
            v103 = *(_QWORD *)(a2 + v102);
            v104 = v103 + 1;
            if (v103 == -1 || v104 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v105 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v103);
              *(_QWORD *)(a2 + v102) = v104;
              v46 |= (unint64_t)(v105 & 0x7F) << v100;
              if (v105 < 0)
              {
                v100 += 7;
                v27 = v101++ >= 9;
                if (v27)
                {
                  v46 = 0;
                  goto LABEL_151;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v46 = 0;
LABEL_151:
          v118 = 64;
          goto LABEL_156;
        case 0x12u:
          v106 = 0;
          v107 = 0;
          v46 = 0;
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x8000u;
          break;
        case 0x13u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x2000u;
          v112 = *v3;
          v113 = *(_QWORD *)(a2 + v112);
          if (v113 <= 0xFFFFFFFFFFFFFFF7 && v113 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v113);
            *(_QWORD *)(a2 + v112) = v113 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 112;
          goto LABEL_181;
        case 0x14u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x40u;
          v114 = *v3;
          v115 = *(_QWORD *)(a2 + v114);
          if (v115 <= 0xFFFFFFFFFFFFFFF7 && v115 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v115);
            *(_QWORD *)(a2 + v114) = v115 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 56;
          goto LABEL_181;
        case 0x15u:
          *(_DWORD *)(a1 + *(int *)(v7 + 2208)) |= 0x800u;
          v116 = *v3;
          v117 = *(_QWORD *)(a2 + v116);
          if (v117 <= 0xFFFFFFFFFFFFFFF7 && v117 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v59 = *(_QWORD *)(*(_QWORD *)(a2 + *v9) + v117);
            *(_QWORD *)(a2 + v116) = v117 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v59 = 0;
          }
          v119 = 96;
LABEL_181:
          *(_QWORD *)(a1 + v119) = v59;
          continue;
        default:
          v37 = v8;
          v38 = v10;
          v39 = v7;
          v40 = v11;
          v41 = v12;
          v42 = a1;
          result = PBReaderSkipValueWithTag();
          v19 = 0x1EE183000;
          a1 = v42;
          v13 = 0x1EE183000;
          v5 = (int *)MEMORY[0x1E0D82BC8];
          v12 = v41;
          v14 = 0x1EE183000;
          v11 = v40;
          v15 = 0x1EE183000;
          v7 = v39;
          v17 = 0x1EE183000;
          v10 = v38;
          v16 = 0x1EE183000;
          v8 = v37;
          v18 = 0x1EE183000;
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v108 = *v3;
        v109 = *(_QWORD *)(a2 + v108);
        v110 = v109 + 1;
        if (v109 == -1 || v110 > *(_QWORD *)(a2 + *v4))
          break;
        v111 = *(_BYTE *)(*(_QWORD *)(a2 + *v9) + v109);
        *(_QWORD *)(a2 + v108) = v110;
        v46 |= (unint64_t)(v111 & 0x7F) << v106;
        if ((v111 & 0x80) == 0)
          goto LABEL_153;
        v106 += 7;
        v27 = v107++ >= 9;
        if (v27)
        {
          v46 = 0;
          goto LABEL_155;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_153:
      if (*(_BYTE *)(a2 + *v5))
        v46 = 0;
LABEL_155:
      v118 = 128;
LABEL_156:
      *(_QWORD *)(a1 + v118) = v46;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSPrewarmEventReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      v18 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        *(_BYTE *)(a1 + 28) |= 1u;
        v26 = *v3;
        v27 = *(_QWORD *)(a2 + v26);
        if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(_QWORD *)(a2 + *v4))
        {
          v28 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 8;
        }
        else
        {
          *(_BYTE *)(a2 + *v5) = 1;
          v28 = 0;
        }
        *(_QWORD *)(a1 + 8) = v28;
      }
      else if ((_DWORD)v18 == 2)
      {
        v29 = 0;
        v30 = 0;
        v31 = 0;
        *(_BYTE *)(a1 + 28) |= 4u;
        while (1)
        {
          v32 = *v3;
          v33 = *(_QWORD *)(a2 + v32);
          v34 = v33 + 1;
          if (v33 == -1 || v34 > *(_QWORD *)(a2 + *v4))
            break;
          v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v33);
          *(_QWORD *)(a2 + v32) = v34;
          v31 |= (unint64_t)(v35 & 0x7F) << v29;
          if ((v35 & 0x80) == 0)
            goto LABEL_45;
          v29 += 7;
          v15 = v30++ >= 9;
          if (v15)
          {
            LODWORD(v31) = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v31) = 0;
LABEL_47:
        *(_DWORD *)(a1 + 24) = v31;
      }
      else if ((_DWORD)v18 == 1)
      {
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)(a1 + 28) |= 2u;
        while (1)
        {
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          v24 = v23 + 1;
          if (v23 == -1 || v24 > *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v23);
          *(_QWORD *)(a2 + v22) = v24;
          v21 |= (unint64_t)(v25 & 0x7F) << v19;
          if ((v25 & 0x80) == 0)
            goto LABEL_41;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            v21 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v21 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 16) = v21;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t COMAPPLEPROACTIVEGMSGMSErrorReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  char v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t result;

  v3 = (int *)MEMORY[0x1E0D82BF0];
  v4 = (int *)MEMORY[0x1E0D82BD8];
  v5 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)(a2 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        v23 = 0;
        v24 = 0;
        v25 = 0;
        *(_BYTE *)(a1 + 20) |= 1u;
        while (1)
        {
          v26 = *v3;
          v27 = *(_QWORD *)(a2 + v26);
          if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            break;
          v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
          *(_QWORD *)(a2 + v26) = v27 + 1;
          v25 |= (unint64_t)(v28 & 0x7F) << v23;
          if ((v28 & 0x80) == 0)
            goto LABEL_41;
          v23 += 7;
          v14 = v24++ >= 9;
          if (v14)
          {
            v25 = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          v25 = 0;
LABEL_43:
        *(_QWORD *)(a1 + 8) = v25;
      }
      else if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 20) |= 2u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_37;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_39;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_37:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_39:
        *(_DWORD *)(a1 + 16) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t sub_18FAD57C0()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18FAD57CC()
{
  return MEMORY[0x1E0D3EC58]();
}

uint64_t sub_18FAD57D8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18FAD57E4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18FAD57F0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18FAD57FC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18FAD5808()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18FAD5814()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_18FAD5820()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18FAD582C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18FAD5838()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18FAD5844()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18FAD5850()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18FAD585C()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1E0D82C10]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1E0D82C28]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1E0D82C38]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1E0D82C58]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x1E0D82C68]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1E0D82C98]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1E0D82CB0]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1E0D82CB8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x1E0D82CC0]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1E0D82CE0]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1E0D82CF0]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1E0D82D00]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1E0D82D10]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1E0D82D28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1E0C83548](*(_QWORD *)&fd, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

passwd *__cdecl getpwuid(uid_t a1)
{
  return (passwd *)MEMORY[0x1E0C837A0](*(_QWORD *)&a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
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

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

