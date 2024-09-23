id ii_default_log_handle()
{
  if (ii_default_log_handle__pasOnceToken2 != -1)
    dispatch_once(&ii_default_log_handle__pasOnceToken2, &__block_literal_global_16);
  return (id)ii_default_log_handle__pasExprOnceResult;
}

uint64_t sub_1C3B52DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    type metadata accessor for AppLaunchCounter();
    v2 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v2 + 16) = sub_1C3B62C0C();
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D025D0]), sel_init);
    v4 = objc_msgSend(v3, sel_publisherFromStartTime_, CFAbsoluteTimeGetCurrent() + -1209600.0);

    *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = &unk_1E7E5CB58;
    v5 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B530CC, MEMORY[0x1E0C809B0], 1107296256, v15, v19);
    swift_bridgeObjectRetain();
    swift_release();
    v6 = objc_msgSend(v4, sel_filterWithIsIncluded_, v5);
    _Block_release(v5);

    swift_bridgeObjectRetain();
    v7 = (void *)sub_1C3B62BE8();
    swift_bridgeObjectRelease();
    *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = &unk_1E7E5CB58;
    v8 = MEMORY[0x1E0C809B0];
    v9 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B5311C, MEMORY[0x1E0C809B0], 1107296256, v16, v20);
    swift_bridgeObjectRetain();
    swift_release();
    v10 = OUTLINED_FUNCTION_8(v6, sel_reduceWithInitial_nextPartialResult_);
    _Block_release(v9);

    v11 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B53384, v8, 1107296256, v17, v21);
    v12 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B533D4, v8, 1107296256, v18, v22);
    swift_retain();
    swift_release();
    v13 = OUTLINED_FUNCTION_8(v10, sel_sinkWithCompletion_receiveInput_);
    _Block_release(v12);
    _Block_release(v11);

    swift_beginAccess();
    v1 = *(_QWORD *)(v2 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    *(_QWORD *)(v0 + 16) = v1;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3();
  }
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1C3B530CC(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

id sub_1C3B5311C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(_QWORD *__return_ptr, _QWORD *, id);
  id v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v5 = *(void (**)(_QWORD *__return_ptr, _QWORD *, id))(a1 + 32);
  v10[3] = swift_getObjectType();
  v10[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(v9, v10, v6);
  swift_release();

  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  v7 = (void *)sub_1C3B62E88();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v7;
}

void sub_1C3B531C8(void *a1)
{
  os_log_type_t v2;
  NSObject *v3;
  id v4;
  uint8_t *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *log;
  uint64_t v12;

  if (objc_msgSend(a1, sel_state) == (id)1)
  {
    v2 = sub_1C3B62CA8();
    v3 = ii_default_log_handle();
    if (v3)
    {
      log = v3;
      if (os_log_type_enabled(v3, v2))
      {
        v4 = a1;
        v5 = (uint8_t *)swift_slowAlloc();
        v12 = swift_slowAlloc();
        *(_DWORD *)v5 = 136315138;
        v6 = objc_msgSend(v4, sel_error);
        if (v6)
        {
          v7 = v6;
          swift_getErrorValue();
          v8 = sub_1C3B62EAC();
          v10 = v9;

        }
        else
        {
          v8 = 0;
          v10 = 0xE000000000000000;
        }
        sub_1C3B53908(v8, v10, &v12);
        sub_1C3B62CD8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1C3B51000, log, v2, "AppLaunchCounter: failed to completely read Biome stream %s", v5, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_7();
      }

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1C3B53384(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_1C3B533D4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1C3B5341C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  swift_bridgeObjectRetain();
  v2 = sub_1C3B52DB0();
  v3 = sub_1C3B544C8(v2);
  swift_bridgeObjectRelease();
  v4 = sub_1C3B534BC(v3);
  swift_release();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a1;
  sub_1C3B54704(v4, (uint64_t)sub_1C3B546D0, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  OUTLINED_FUNCTION_6();
  return v6;
}

unint64_t sub_1C3B534BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  _OWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E1830);
    v2 = (_QWORD *)sub_1C3B62DD4();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = MEMORY[0x1E0DEE9B8] + 8;
  v11 = MEMORY[0x1E0DEBB98];
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v34 = (v5 - 1) & v5;
        v12 = __clz(__rbit64(v5)) | (v9 << 6);
      }
      else
      {
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
          goto LABEL_34;
        if (v13 >= v31)
        {
LABEL_31:
          sub_1C3B54BA4();
          return (unint64_t)v2;
        }
        v14 = *(_QWORD *)(v32 + 8 * v13);
        v15 = v9 + 1;
        if (!v14)
        {
          v15 = v9 + 2;
          if (v9 + 2 >= v31)
            goto LABEL_31;
          v14 = *(_QWORD *)(v32 + 8 * v15);
          if (!v14)
          {
            v15 = v9 + 3;
            if (v9 + 3 >= v31)
              goto LABEL_31;
            v14 = *(_QWORD *)(v32 + 8 * v15);
            if (!v14)
            {
              v15 = v9 + 4;
              if (v9 + 4 >= v31)
                goto LABEL_31;
              v14 = *(_QWORD *)(v32 + 8 * v15);
              if (!v14)
              {
                v16 = v9 + 5;
                if (v9 + 5 >= v31)
                  goto LABEL_31;
                v14 = *(_QWORD *)(v32 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_35;
                    if (v15 >= v31)
                      goto LABEL_31;
                    v14 = *(_QWORD *)(v32 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_25;
                  }
                }
                v15 = v9 + 5;
              }
            }
          }
        }
LABEL_25:
        v34 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v15 << 6);
        v9 = v15;
      }
      v17 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v12);
      v35 = *v17;
      v36 = v17[1];
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      sub_1C3B54BAC(v6, v7);
      sub_1C3B54BAC(v7, v40);
      sub_1C3B54BAC(v40, &v38);
      result = sub_1C3B54070(v35, v36);
      v18 = result;
      if ((v19 & 1) == 0)
        break;
      v33 = v9;
      v20 = v7;
      v21 = v6;
      v22 = v1;
      v23 = v11;
      v24 = v10;
      v25 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v25 = v35;
      v25[1] = v36;
      v10 = v24;
      v11 = v23;
      v1 = v22;
      v6 = v21;
      v7 = v20;
      v9 = v33;
      v26 = (_OWORD *)(v2[7] + 32 * v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
      result = (unint64_t)sub_1C3B54BAC(&v38, v26);
      v5 = v34;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_1C3B54BAC(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_33;
    v2[2] = v30;
    v5 = v34;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1C3B538CC()
{
  OUTLINED_FUNCTION_4();
  return swift_deallocClassInstance();
}

uint64_t sub_1C3B538EC()
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0();
  *(_QWORD *)(result + 16) = 0;
  return result;
}

uint64_t sub_1C3B53908(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1C3B539D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1C3B54958((uint64_t)v12, *a3);
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
      sub_1C3B54958((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1C3B539D8(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1C3B53B2C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1C3B62CE4();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1C3B53BF0(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1C3B62D2C();
    if (!v8)
    {
      result = sub_1C3B62D98();
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

void *sub_1C3B53B2C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C3B62DE0();
  __break(1u);
  return result;
}

uint64_t sub_1C3B53BF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1C3B53C84(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1C3B53E58(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1C3B53E58((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1C3B53C84(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1C3B62C60();
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
  v3 = sub_1C3B53DF4(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1C3B62D14();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1C3B62DE0();
  __break(1u);
LABEL_14:
  result = sub_1C3B62D98();
  __break(1u);
  return result;
}

_QWORD *sub_1C3B53DF4(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1C3B53E58(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67E0);
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
    sub_1C3B53FF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1C3B53F2C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1C3B53F2C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1C3B62DE0();
  __break(1u);
  return result;
}

char *sub_1C3B53FF0(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1C3B62DE0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_1C3B54070(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1C3B62EE8();
  sub_1C3B62C48();
  v4 = sub_1C3B62F00();
  return sub_1C3B540D4(a1, a2, v4);
}

unint64_t sub_1C3B540D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1C3B62E94() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1C3B62E94() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1C3B541B4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E1830);
  v6 = sub_1C3B62DC8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v17)) + (v13 << 6))
    {
      v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
      v21 = *v19;
      v20 = v19[1];
      v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * i);
      if ((a2 & 1) != 0)
      {
        sub_1C3B54BAC(v22, v35);
      }
      else
      {
        sub_1C3B54958((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1C3B62EE8();
      sub_1C3B62C48();
      result = sub_1C3B62F00();
      v23 = -1 << *(_BYTE *)(v7 + 32);
      v24 = result & ~v23;
      v25 = v24 >> 6;
      if (((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6))) == 0)
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v23) >> 6;
        while (++v25 != v28 || (v27 & 1) == 0)
        {
          v29 = v25 == v28;
          if (v25 == v28)
            v25 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v25);
          if (v30 != -1)
          {
            v26 = __clz(__rbit64(~v30)) + (v25 << 6);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      v26 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v11 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
      *(_QWORD *)(v11 + ((v26 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v26;
      v31 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v26);
      *v31 = v21;
      v31[1] = v20;
      result = (uint64_t)sub_1C3B54BAC(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v26));
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v16 = v13 + 1;
      if (__OFADD__(v13, 1))
        goto LABEL_40;
      if (v16 >= v33)
        goto LABEL_33;
      v17 = v34[v16];
      ++v13;
      if (!v17)
      {
        v13 = v16 + 1;
        if (v16 + 1 >= v33)
          goto LABEL_33;
        v17 = v34[v13];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v33)
          {
LABEL_33:
            swift_release();
            v3 = v2;
            if ((a2 & 1) != 0)
            {
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 >= 64)
                sub_1C3B544AC(0, (unint64_t)(v32 + 63) >> 6, v34);
              else
                *v34 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
            }
            break;
          }
          v17 = v34[v18];
          if (!v17)
          {
            while (1)
            {
              v13 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_41;
              if (v13 >= v33)
                goto LABEL_33;
              v17 = v34[v13];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v13 = v18;
        }
      }
LABEL_18:
      v10 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C3B544AC(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_1C3B544C8(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67D0);
  result = sub_1C3B62DBC();
  v3 = (_QWORD *)result;
  v4 = 0;
  v5 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  v10 = result + 64;
  if (!v8)
    goto LABEL_5;
LABEL_4:
  v11 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v11 | (v4 << 6); ; i = __clz(__rbit64(v14)) + (v4 << 6))
  {
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    if (v16)
    {
      v17 = v16 / 0xA;
      if (v17 >= 5)
        v17 = 5;
      v16 = v17 + 1;
    }
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v19 = *v18;
    result = v18[1];
    *(_QWORD *)(v10 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v20 = (_QWORD *)(v3[6] + 16 * i);
    *v20 = v19;
    v20[1] = result;
    *(_QWORD *)(v3[7] + 8 * i) = v16;
    v21 = v3[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
    {
      __break(1u);
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
    v3[2] = v23;
    result = swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_4;
LABEL_5:
    v13 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_28;
    if (v13 >= v9)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v5 + 8 * v13);
    ++v4;
    if (!v14)
    {
      v4 = v13 + 1;
      if (v13 + 1 >= v9)
        return (uint64_t)v3;
      v14 = *(_QWORD *)(v5 + 8 * v4);
      if (!v14)
      {
        v4 = v13 + 2;
        if (v13 + 2 >= v9)
          return (uint64_t)v3;
        v14 = *(_QWORD *)(v5 + 8 * v4);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v8 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v9)
    return (uint64_t)v3;
  v14 = *(_QWORD *)(v5 + 8 * v15);
  if (v14)
  {
    v4 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v4 >= v9)
      return (uint64_t)v3;
    v14 = *(_QWORD *)(v5 + 8 * v4);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1C3B54694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1C3B54958(a4, a1);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_1C3B546D0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_1C3B54694((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1C3B54704(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _OWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  _BYTE v25[32];
  _OWORD v26[2];
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  sub_1C3B54994(a1, a2, a3, &v30);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1C3B549D0(&v28);
  v7 = *((_QWORD *)&v28 + 1);
  if (!*((_QWORD *)&v28 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1C3B54BA4();
    return swift_release();
  }
  while (1)
  {
    v8 = v28;
    sub_1C3B54BAC(&v29, v27);
    v9 = *a5;
    v11 = sub_1C3B54070(v8, v7);
    v12 = *(_QWORD *)(v9 + 16);
    v13 = (v10 & 1) == 0;
    v14 = v12 + v13;
    if (__OFADD__(v12, v13))
      break;
    v15 = v10;
    if (*(_QWORD *)(v9 + 24) >= v14)
    {
      if ((a4 & 1) != 0)
      {
        if ((v10 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67C0);
        sub_1C3B62D8C();
        if ((v15 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      sub_1C3B541B4(v14, a4 & 1);
      v16 = sub_1C3B54070(v8, v7);
      if ((v15 & 1) != (v17 & 1))
        goto LABEL_17;
      v11 = v16;
      if ((v15 & 1) != 0)
      {
LABEL_9:
        sub_1C3B54958(*(_QWORD *)(*a5 + 56) + 32 * v11, (uint64_t)v25);
        sub_1C3B54958((uint64_t)v25, (uint64_t)v26);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
        swift_bridgeObjectRelease();
        v18 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v11);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
        sub_1C3B54BAC(v26, v18);
        goto LABEL_13;
      }
    }
    v19 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v20 = (uint64_t *)(v19[6] + 16 * v11);
    *v20 = v8;
    v20[1] = v7;
    sub_1C3B54BAC(v27, (_OWORD *)(v19[7] + 32 * v11));
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_16;
    v19[2] = v23;
LABEL_13:
    sub_1C3B549D0(&v28);
    v7 = *((_QWORD *)&v28 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v28 + 1))
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_1C3B62EA0();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for AppLaunchCounter()
{
  return objc_opt_self();
}

uint64_t sub_1C3B54958(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1C3B54994@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_1C3B549D0@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  void (*v19)(_OWORD *);
  uint64_t result;
  _OWORD v21[3];
  _OWORD v22[3];
  __int128 v23;
  _OWORD v24[2];

  v3 = *v1;
  v4 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v7 = v5;
  v8 = v1[4];
  if (v8)
  {
    v9 = (v8 - 1) & v8;
    v10 = __clz(__rbit64(v8)) | (v5 << 6);
LABEL_3:
    v11 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_1C3B54958(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    swift_bridgeObjectRetain();
    goto LABEL_23;
  }
  v14 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
    return result;
  }
  v15 = (unint64_t)(v6 + 64) >> 6;
  if (v14 < v15)
  {
    v16 = *(_QWORD *)(v4 + 8 * v14);
    if (v16)
    {
LABEL_7:
      v9 = (v16 - 1) & v16;
      v10 = __clz(__rbit64(v16)) + (v14 << 6);
      v7 = v14;
      goto LABEL_3;
    }
    v17 = v5 + 2;
    v7 = v5 + 1;
    if (v5 + 2 < v15)
    {
      v16 = *(_QWORD *)(v4 + 8 * v17);
      if (v16)
      {
LABEL_10:
        v14 = v17;
        goto LABEL_7;
      }
      v7 = v5 + 2;
      if (v5 + 3 < v15)
      {
        v16 = *(_QWORD *)(v4 + 8 * (v5 + 3));
        if (v16)
        {
          v14 = v5 + 3;
          goto LABEL_7;
        }
        v17 = v5 + 4;
        v7 = v5 + 3;
        if (v5 + 4 < v15)
        {
          v16 = *(_QWORD *)(v4 + 8 * v17);
          if (v16)
            goto LABEL_10;
          v14 = v5 + 5;
          v7 = v5 + 4;
          if (v5 + 5 < v15)
          {
            v16 = *(_QWORD *)(v4 + 8 * v14);
            if (v16)
              goto LABEL_7;
            v7 = v15 - 1;
            v18 = v5 + 6;
            while (v18 < v15)
            {
              v16 = *(_QWORD *)(v4 + 8 * v18++);
              if (v16)
              {
                v14 = v18 - 1;
                goto LABEL_7;
              }
            }
          }
        }
      }
    }
  }
  v9 = 0;
  memset(v24, 0, sizeof(v24));
  v23 = 0u;
LABEL_23:
  *v1 = v3;
  v1[1] = v4;
  v1[2] = v6;
  v1[3] = v7;
  v1[4] = v9;
  v19 = (void (*)(_OWORD *))v1[5];
  result = sub_1C3B54C1C((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_1C3B54C64((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_1C3B54BA4()
{
  return swift_release();
}

_OWORD *sub_1C3B54BAC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD77F0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t sub_1C3B54C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1C3B54C64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1800);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1C3B54CA4()
{
  OUTLINED_FUNCTION_4();
  return swift_deallocObject();
}

uint64_t sub_1C3B54CC4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = objc_msgSend(a1, sel_eventBody);
  if (!v3)
    goto LABEL_9;
  v4 = v3;
  v5 = objc_msgSend(v3, sel_bundleID);

  v6 = sub_1C3B62C3C();
  v8 = v7;

  sub_1C3B5A8A0(v6, v8);
  LODWORD(v6) = v9;
  swift_bridgeObjectRelease();
  if ((_DWORD)v6 == 4)
    goto LABEL_9;
  v10 = *(_QWORD *)(v2 + 16);
  if (v10)
  {
    sub_1C3B55148();
    swift_bridgeObjectRetain();
    v11 = 0;
    do
    {
      v12 = sub_1C3B62C24();
      if ((v12 & 1) != 0)
        break;
    }
    while (v10 - 1 != v11++);
    OUTLINED_FUNCTION_3();
  }
  else
  {
LABEL_9:
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1C3B54DFC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  char v22;
  unint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;

  v4 = *(_QWORD *)(v2 + 16);
  sub_1C3B54958(a1, (uint64_t)&v31);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67D8);
  result = swift_dynamicCast();
  if ((_DWORD)result)
  {
    v7 = v30;
  }
  else
  {
    result = sub_1C3B62C0C();
    v7 = (_QWORD *)result;
  }
  v29 = *(_QWORD *)(v4 + 16);
  if (v29)
  {
    v27 = v5;
    v28 = a2;
    swift_bridgeObjectRetain();
    v8 = 0;
    while (1)
    {
      v9 = *(unsigned __int8 *)(v4 + v8 + 32);
      v10 = v9 >= 3 ? 0xD000000000000017 : 0xD000000000000013;
      v11 = v9 >= 3 ? 0x80000001C3B644C0 : 0x80000001C3B644A0;
      if (v7[2] && (v12 = OUTLINED_FUNCTION_2(), (v13 & 1) != 0))
        v14 = *(_QWORD *)(v7[7] + 8 * v12);
      else
        v14 = 0;
      OUTLINED_FUNCTION_5();
      v15 = v14 + 1;
      if (v14 == -1)
        break;
      swift_isUniquelyReferenced_nonNull_native();
      v31 = v7;
      v16 = OUTLINED_FUNCTION_2();
      if (__OFADD__(v7[2], (v17 & 1) == 0))
        goto LABEL_29;
      v18 = v16;
      v19 = v17;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67E8);
      v20 = sub_1C3B62D80();
      v7 = v31;
      if ((v20 & 1) != 0)
      {
        v21 = OUTLINED_FUNCTION_2();
        if ((v19 & 1) != (v22 & 1))
          goto LABEL_31;
        v18 = v21;
      }
      if ((v19 & 1) != 0)
      {
        *(_QWORD *)(v7[7] + 8 * v18) = v15;
      }
      else
      {
        v7[(v18 >> 6) + 8] |= 1 << v18;
        v23 = (unint64_t *)(v7[6] + 16 * v18);
        *v23 = v10;
        v23[1] = v11;
        *(_QWORD *)(v7[7] + 8 * v18) = v15;
        v24 = v7[2];
        v25 = __OFADD__(v24, 1);
        v26 = v24 + 1;
        if (v25)
          goto LABEL_30;
        v7[2] = v26;
        swift_bridgeObjectRetain();
      }
      ++v8;
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_5();
      if (v29 == v8)
      {
        result = swift_bridgeObjectRelease();
        v5 = v27;
        a2 = v28;
        goto LABEL_27;
      }
    }
    __break(1u);
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
LABEL_31:
    result = sub_1C3B62EA0();
    __break(1u);
  }
  else
  {
LABEL_27:
    a2[3] = v5;
    *a2 = v7;
  }
  return result;
}

void sub_1C3B55050()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67D8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_beginAccess();
    *(_QWORD *)(v0 + 16) = v3;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3B62CA8();
    v1 = ii_default_log_handle();
    if (v1)
    {
      v2 = v1;
      sub_1C3B62BB8();

    }
    else
    {
      __break(1u);
    }
  }
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1C3B55148()
{
  unint64_t result;

  result = qword_1EF8E67F0;
  if (!qword_1EF8E67F0)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63E7C, &type metadata for BundleId);
    atomic_store(result, (unint64_t *)&qword_1EF8E67F0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

void *OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

unint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3B54070(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_7()
{
  JUMPOUT(0x1C3BD785CLL);
}

id OUTLINED_FUNCTION_8(id a1, SEL a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(a1, a2, v2, v3);
}

BOOL sub_1C3B55200(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_1C3B55210()
{
  sub_1C3B62EF4();
  OUTLINED_FUNCTION_10();
}

void sub_1C3B55230()
{
  OUTLINED_FUNCTION_29();
  sub_1C3B62EF4();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0();
}

BOOL sub_1C3B5525C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1C3B55200(*a1, *a2);
}

void sub_1C3B55268()
{
  sub_1C3B55230();
}

void sub_1C3B55270()
{
  sub_1C3B55210();
}

void sub_1C3B55278()
{
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_42();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0();
}

BOOL sub_1C3B552AC(char a1, char a2)
{
  return a1 == a2;
}

void sub_1C3B552BC()
{
  sub_1C3B62EF4();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B552DC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 7955819 && a2 == 0xE300000000000000;
  if (v3 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    OUTLINED_FUNCTION_3();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6156656C62756F64 && a2 == 0xEB0000000065756CLL;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      OUTLINED_FUNCTION_3();
      return 1;
    }
    else if (a1 == 0x6156676E69727473 && a2 == 0xEB0000000065756CLL)
    {
      OUTLINED_FUNCTION_3();
      return 2;
    }
    else
    {
      v8 = OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_3();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1C3B553F0(char a1)
{
  return qword_1C3B63C38[a1];
}

BOOL sub_1C3B55410(char *a1, char *a2)
{
  return sub_1C3B552AC(*a1, *a2);
}

void sub_1C3B5541C()
{
  sub_1C3B5628C();
}

void sub_1C3B55434()
{
  sub_1C3B552BC();
}

uint64_t sub_1C3B55440()
{
  char *v0;

  return sub_1C3B553F0(*v0);
}

void sub_1C3B55448(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  *a3 = sub_1C3B552DC(a1, a2);
  OUTLINED_FUNCTION_10();
}

void sub_1C3B5546C(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1C3B55478()
{
  sub_1C3B57988();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_1C3B55498()
{
  sub_1C3B57988();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_18();
}

void sub_1C3B554B8(_QWORD *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1840);
  OUTLINED_FUNCTION_35();
  MEMORY[0x1E0C80A78]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B57988();
  OUTLINED_FUNCTION_16();
  sub_1C3B62E4C();
  if (!v1)
  {
    OUTLINED_FUNCTION_14();
    sub_1C3B62E40();
    OUTLINED_FUNCTION_22();
    sub_1C3B62E34();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11();
}

void sub_1C3B555A8(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E68C8);
  OUTLINED_FUNCTION_49();
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B57988();
  sub_1C3B62F0C();
  if (v2)
  {
    OUTLINED_FUNCTION_15();
  }
  else
  {
    v23 = 0;
    OUTLINED_FUNCTION_27();
    v8 = sub_1C3B62E04();
    v10 = v9;
    v22 = 1;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_27();
    v11 = sub_1C3B62DF8();
    v20 = v12;
    v19 = v11;
    v21 = 2;
    OUTLINED_FUNCTION_27();
    v13 = sub_1C3B62DEC();
    v15 = v14;
    v16 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8);
    v17 = v13;
    OUTLINED_FUNCTION_7_0((uint64_t)v7, v16);
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_15();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_37();
    *(_QWORD *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v19;
    *(_BYTE *)(a2 + 24) = v20 & 1;
    *(_QWORD *)(a2 + 32) = v17;
    *(_QWORD *)(a2 + 40) = v15;
  }
  OUTLINED_FUNCTION_8_0();
}

void sub_1C3B55734(_QWORD *a1)
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
  __n128 v10;
  __int128 v11[3];

  sub_1C3B555A8(a1, (uint64_t)v11);
  if (!v1)
    OUTLINED_FUNCTION_51(v2, v3, v4, v5, v6, v7, v8, v9, v11[0], v11[1], v10);
  OUTLINED_FUNCTION_50();
}

void sub_1C3B55760(_QWORD *a1)
{
  sub_1C3B554B8(a1);
}

uint64_t sub_1C3B55774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 40);
  if (v1)
  {
    OUTLINED_FUNCTION_40();
    return v1;
  }
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    OUTLINED_FUNCTION_25();
    v4 = (_QWORD *)(v2 + 72);
    v5 = (char *)MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v6 = *(v4 - 4);
      if ((*(_BYTE *)(v4 - 2) & 1) != 0)
      {
        if (!*v4)
        {
          v18 = 0;
          v16 = 0u;
          v17 = 0u;
          v15 = 0u;
          goto LABEL_16;
        }
        *(_QWORD *)&v15 = *(v4 - 5);
        *((_QWORD *)&v15 + 1) = v6;
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_25();
      }
      else
      {
        *(_QWORD *)&v15 = *(v4 - 5);
        *((_QWORD *)&v15 + 1) = v6;
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_25();
      }
      sub_1C3B62CFC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v15 + 1))
      {
        v11 = v15;
        v12 = v16;
        v13 = v17;
        v14 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v5 = OUTLINED_FUNCTION_45(0, *((_QWORD *)v5 + 2) + 1);
        v8 = *((_QWORD *)v5 + 2);
        v7 = *((_QWORD *)v5 + 3);
        if (v8 >= v7 >> 1)
          v5 = OUTLINED_FUNCTION_45((char *)(v7 > 1), v8 + 1);
        *((_QWORD *)v5 + 2) = v8 + 1;
        v9 = &v5[56 * v8];
        *((_QWORD *)v9 + 10) = v14;
        *((_OWORD *)v9 + 3) = v12;
        *((_OWORD *)v9 + 4) = v13;
        *((_OWORD *)v9 + 2) = v11;
        goto LABEL_17;
      }
LABEL_16:
      sub_1C3B58650((uint64_t)&v15, &qword_1EF8E68E8);
LABEL_17:
      v4 += 6;
      if (!--v3)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_20;
      }
    }
  }
  v5 = (char *)MEMORY[0x1E0DEE9D8];
LABEL_20:
  v1 = sub_1C3B56084((uint64_t)v5);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v0 + 40) = v1;
  return v1;
}

void sub_1C3B55988(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  unint64_t v4;
  _BYTE *v5;
  char *v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  unint64_t v21;
  int v22;
  _BYTE *v23;
  os_log_type_t v24;
  NSObject *v25;
  NSObject *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  char *v36;
  unint64_t v37;
  char *v38;
  int64_t v39;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  int64_t v45;
  uint64_t v46;
  __int128 v47;
  _OWORD v48[2];
  __int128 v49;
  _OWORD v50[2];
  _QWORD v51[5];
  id v52;
  unint64_t v53;
  _BYTE v54[32];
  uint64_t v55;
  _OWORD v56[3];
  void *v57;
  unint64_t v58;
  _BYTE v59[32];
  __int128 v60;
  _OWORD v61[2];
  unsigned __int8 v62;

  v3 = v2;
  sub_1C3B58564(a1, v51);
  v44 = v51[0];
  v45 = v51[3];
  v42 = v51[1];
  v43 = (unint64_t)(v51[2] + 64) >> 6;
  v4 = v51[4];
  v5 = v59;
  swift_bridgeObjectRetain();
  v6 = (char *)MEMORY[0x1E0DEE9D8];
  if (!v4)
    goto LABEL_3;
LABEL_2:
  v46 = (v4 - 1) & v4;
  v7 = __clz(__rbit64(v4)) | (v45 << 6);
  while (1)
  {
    v11 = (uint64_t *)(*(_QWORD *)(v44 + 48) + 16 * v7);
    v13 = *v11;
    v12 = v11[1];
    sub_1C3B54958(*(_QWORD *)(v44 + 56) + 32 * v7, (uint64_t)v50);
    *(_QWORD *)&v49 = v13;
    *((_QWORD *)&v49 + 1) = v12;
    v47 = v49;
    v48[0] = v50[0];
    v48[1] = v50[1];
    swift_bridgeObjectRetain();
    v14 = *((_QWORD *)&v47 + 1);
    v15 = v47;
    v60 = v47;
    sub_1C3B54958((uint64_t)v48, (uint64_t)v61);
    sub_1C3B54958((uint64_t)v48, (uint64_t)v59);
    swift_bridgeObjectRetain();
    sub_1C3B54958((uint64_t)v59, (uint64_t)v56);
    sub_1C3B5859C();
    swift_bridgeObjectRetain();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v16 = v52;
      objc_msgSend(v52, sel_doubleValue);
      v18 = v17;

      v19 = 0;
      v20 = v18;
      v21 = MEMORY[0x1E0DEE9B8];
    }
    else
    {
      sub_1C3B54958((uint64_t)v59, (uint64_t)v56);
      v21 = MEMORY[0x1E0DEE9B8];
      v22 = swift_dynamicCast();
      v20 = v22 ? v52 : 0;
      v19 = v22 ^ 1;
    }
    sub_1C3B54958((uint64_t)v59, (uint64_t)v56);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v52;
      v21 = v53;
      swift_bridgeObjectRetain();
    }
    else
    {
      if ((v19 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        sub_1C3B585D8();
        v3 = (void *)swift_allocError();
        *v23 = 0;
        swift_willThrow();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v59);
        swift_bridgeObjectRelease();
        goto LABEL_26;
      }
      v5 = 0;
      v21 = 0;
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v59);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v62 = v19;
LABEL_26:
    if (v3)
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
      v24 = sub_1C3B62CA8();
      v25 = ii_default_log_handle();
      if (!v25)
        goto LABEL_49;
      v26 = v25;
      v60 = v47;
      sub_1C3B54958((uint64_t)v48, (uint64_t)v61);
      sub_1C3B58688((uint64_t)&v60, (uint64_t)&v57, &qword_1ED7E1800);
      v56[0] = v60;
      v56[1] = v61[0];
      v56[2] = v61[1];
      if (os_log_type_enabled(v26, v24))
      {
        v27 = a2;
        swift_bridgeObjectRetain();
        v28 = swift_slowAlloc();
        v41 = swift_slowAlloc();
        v55 = v41;
        *(_DWORD *)v28 = 136315394;
        v29 = *(_QWORD *)&v27[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
        v30 = *(_QWORD *)&v27[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8];
        swift_bridgeObjectRetain();
        v52 = (id)sub_1C3B53908(v29, v30, &v55);
        sub_1C3B62CD8();
        swift_bridgeObjectRelease();

        *(_WORD *)(v28 + 12) = 2080;
        v31 = (uint64_t)v57;
        v32 = v58;
        v52 = v57;
        v53 = v58;
        sub_1C3B54958((uint64_t)v59, (uint64_t)v54);
        swift_bridgeObjectRetain();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v54);
        v52 = (id)sub_1C3B53908(v31, v32, &v55);
        sub_1C3B62CD8();
        swift_bridgeObjectRelease();
        sub_1C3B58650((uint64_t)v56, &qword_1ED7E1800);
        sub_1C3B58650((uint64_t)&v57, &qword_1ED7E1800);
        _os_log_impl(&dword_1C3B51000, v26, v24, "MetricMessage: Found message %s with uncodable value for key %s, this key will not be persisted.", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1C3BD785C](v41, -1, -1);
        MEMORY[0x1C3BD785C](v28, -1, -1);

      }
      else
      {
        swift_bridgeObjectRetain();

        sub_1C3B58650((uint64_t)v56, &qword_1ED7E1800);
        sub_1C3B58650((uint64_t)&v57, &qword_1ED7E1800);
      }
      v3 = 0;
      v21 = 0;
      v5 = 0;
      v33 = 0;
      v20 = 0;
      v14 = 0;
      v15 = 0;
    }
    else
    {
      v33 = v62;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v61);
    }
    sub_1C3B58650((uint64_t)&v47, &qword_1ED7E1800);
    if (v14)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v6 = sub_1C3B57B10(0, *((_QWORD *)v6 + 2) + 1, 1, (uint64_t)v6);
      v34 = v6;
      v35 = *((_QWORD *)v6 + 2);
      v36 = v34;
      v37 = *((_QWORD *)v34 + 3);
      if (v35 >= v37 >> 1)
        v36 = sub_1C3B57B10((char *)(v37 > 1), v35 + 1, 1, (uint64_t)v36);
      *((_QWORD *)v36 + 2) = v35 + 1;
      v38 = &v36[48 * v35];
      v6 = v36;
      *((_QWORD *)v38 + 4) = v15;
      *((_QWORD *)v38 + 5) = v14;
      *((_QWORD *)v38 + 6) = v20;
      v38[56] = v33 != 0;
      *((_QWORD *)v38 + 8) = v5;
      *((_QWORD *)v38 + 9) = v21;
    }
    v4 = v46;
    v5 = v59;
    if (v46)
      goto LABEL_2;
LABEL_3:
    v8 = v45 + 1;
    if (__OFADD__(v45, 1))
      break;
    if (v8 >= v43)
      goto LABEL_47;
    v9 = *(_QWORD *)(v42 + 8 * v8);
    if (!v9)
    {
      v10 = v45 + 2;
      if (v45 + 2 >= v43)
        goto LABEL_47;
      v9 = *(_QWORD *)(v42 + 8 * v10);
      if (v9)
        goto LABEL_12;
      v10 = v45 + 3;
      if (v45 + 3 >= v43)
        goto LABEL_47;
      v9 = *(_QWORD *)(v42 + 8 * v10);
      if (v9)
        goto LABEL_12;
      v10 = v45 + 4;
      if (v45 + 4 >= v43)
        goto LABEL_47;
      v9 = *(_QWORD *)(v42 + 8 * v10);
      if (v9)
      {
LABEL_12:
        v8 = v10;
      }
      else
      {
        v8 = v45 + 5;
        if (v45 + 5 >= v43)
          goto LABEL_47;
        v9 = *(_QWORD *)(v42 + 8 * v8);
        if (!v9)
        {
          v39 = v45 + 6;
          while (v39 < v43)
          {
            v9 = *(_QWORD *)(v42 + 8 * v39++);
            if (v9)
            {
              v8 = v39 - 1;
              goto LABEL_13;
            }
          }
LABEL_47:

          swift_release();
          return;
        }
      }
    }
LABEL_13:
    v46 = (v9 - 1) & v9;
    v7 = __clz(__rbit64(v9)) + (v8 << 6);
    v45 = v8;
  }
  __break(1u);
LABEL_49:
  __break(1u);
}

uint64_t sub_1C3B56084(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6900);
    v1 = sub_1C3B62DD4();
  }
  else
  {
    v1 = MEMORY[0x1E0DEE9E0];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_1C3B57F38(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1C3B5612C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x646E656B636162 && a2 == 0xE700000000000000;
  if (v3 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    OUTLINED_FUNCTION_3();
    return 0;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000001C3B645D0 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x73646C656966 && a2 == 0xE600000000000000;
    if (v6 || (OUTLINED_FUNCTION_0_0() & 1) != 0)
    {
      OUTLINED_FUNCTION_3();
      return 2;
    }
    else if (a1 == 0x7372655661746164 && a2 == 0xEB000000006E6F69)
    {
      OUTLINED_FUNCTION_3();
      return 3;
    }
    else
    {
      v8 = OUTLINED_FUNCTION_0_0();
      OUTLINED_FUNCTION_3();
      if ((v8 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

void sub_1C3B5628C()
{
  OUTLINED_FUNCTION_29();
  sub_1C3B62EF4();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_6_0();
}

uint64_t sub_1C3B562B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1C3B562F0 + 4 * byte_1C3B63840[a1]))(0xD000000000000011, 0x80000001C3B645D0);
}

uint64_t sub_1C3B562F0()
{
  return 0x646E656B636162;
}

uint64_t sub_1C3B56308()
{
  return 0x73646C656966;
}

uint64_t sub_1C3B5631C()
{
  return 0x7372655661746164;
}

void sub_1C3B5633C(_QWORD *a1)
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1848);
  OUTLINED_FUNCTION_35();
  MEMORY[0x1E0C80A78]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B57828();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_22();
  sub_1C3B62E64();
  if (!v1)
  {
    OUTLINED_FUNCTION_14();
    sub_1C3B62E4C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1808);
    sub_1C3B578E4((unint64_t *)&unk_1ED7E1810, (uint64_t (*)(void))sub_1C3B5794C, MEMORY[0x1E0DEAF10]);
    OUTLINED_FUNCTION_22();
    sub_1C3B62E58();
    OUTLINED_FUNCTION_22();
    sub_1C3B62E70();
  }
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_11();
}

void sub_1C3B56484(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E68B0);
  OUTLINED_FUNCTION_49();
  MEMORY[0x1E0C80A78]();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B57828();
  sub_1C3B62F0C();
  if (v2)
  {
    OUTLINED_FUNCTION_15();
  }
  else
  {
    OUTLINED_FUNCTION_26();
    v5 = sub_1C3B62E1C();
    OUTLINED_FUNCTION_26();
    v6 = sub_1C3B62E04();
    v8 = v7;
    v10 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1808);
    sub_1C3B578E4(&qword_1EF8E68C0, (uint64_t (*)(void))sub_1C3B578A8, MEMORY[0x1E0DEAF40]);
    swift_bridgeObjectRetain();
    sub_1C3B62E10();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_26();
    v9 = sub_1C3B62E28();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_32();
    OUTLINED_FUNCTION_23();
    *(_BYTE *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v8;
    *(_QWORD *)(a2 + 24) = v11;
    *(_DWORD *)(a2 + 32) = v9;
    *(_QWORD *)(a2 + 40) = 0;
  }
  OUTLINED_FUNCTION_8_0();
}

uint64_t sub_1C3B5668C()
{
  unsigned __int8 *v0;

  return sub_1C3B562B8(*v0);
}

void sub_1C3B56694(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  *a3 = sub_1C3B5612C(a1, a2);
  OUTLINED_FUNCTION_10();
}

void sub_1C3B566B4(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1C3B566C0()
{
  sub_1C3B57828();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_19();
}

uint64_t sub_1C3B566E0()
{
  sub_1C3B57828();
  OUTLINED_FUNCTION_33();
  return OUTLINED_FUNCTION_18();
}

void sub_1C3B56700(_QWORD *a1)
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
  __n128 v10;
  __int128 v11[3];

  sub_1C3B56484(a1, (uint64_t)v11);
  if (!v1)
    OUTLINED_FUNCTION_51(v2, v3, v4, v5, v6, v7, v8, v9, v11[0], v11[1], v10);
  OUTLINED_FUNCTION_50();
}

void sub_1C3B5672C(_QWORD *a1)
{
  sub_1C3B5633C(a1);
}

uint64_t sub_1C3B56790()
{
  uint64_t v1;

  v1 = sub_1C3B62E7C();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_36();
  sub_1C3B62C54();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_40();
  sub_1C3B62C00();
  sub_1C3B62C54();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0();
  sub_1C3B62E7C();
  sub_1C3B62C54();
  OUTLINED_FUNCTION_3();
  return v1;
}

uint64_t sub_1C3B56894()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray])
  {
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray];
  }
  else
  {
    v3 = v0;
    v4 = OUTLINED_FUNCTION_36();
    sub_1C3B55988(v4, v3);
    v2 = v5;
    OUTLINED_FUNCTION_20();
    *(_QWORD *)&v0[v1] = v2;
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_4_0();
  }
  swift_bridgeObjectRetain();
  return v2;
}

id sub_1C3B56924(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return sub_1C3B5697C(a1, a2, a3, a4);
}

id sub_1C3B5697C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;
  _QWORD *v5;
  objc_super v7;

  *(_QWORD *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage____lazy_storage___codableArray] = 0;
  v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend] = a4;
  v5 = &v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents] = a1;
  *(_DWORD *)&v4[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_dataVersion] = 1;
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for MetricMessage();
  return objc_msgSendSuper2(&v7, sel_init);
}

uint64_t type metadata accessor for MetricMessage()
{
  return objc_opt_self();
}

uint64_t sub_1C3B56A10(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;

  v4 = v3;
  v5 = 0;
  if (a3 == 1)
  {
    sub_1C3B62A5C();
    OUTLINED_FUNCTION_34();
    sub_1C3B62A50();
    sub_1C3B56BB8();
    sub_1C3B62A44();
    OUTLINED_FUNCTION_44();
    v6 = sub_1C3B55774();
    v7 = sub_1C3B56C30(v6);
    swift_bridgeObjectRelease();
    v5 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _QWORD))(v4 + 144))(v7, v10, v11, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v5;
}

unint64_t sub_1C3B56BB8()
{
  unint64_t result;

  result = qword_1EF8E6A50[0];
  if (!qword_1EF8E6A50[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B639EC, &unk_1E7E5CEF0);
    atomic_store(result, qword_1EF8E6A50);
  }
  return result;
}

unint64_t sub_1C3B56BF4()
{
  unint64_t result;

  result = qword_1EF8E6830;
  if (!qword_1EF8E6830)
  {
    result = MEMORY[0x1C3BD7808](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF8E6830);
  }
  return result;
}

unint64_t sub_1C3B56C30(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  int64_t v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E1830);
    v2 = (_QWORD *)sub_1C3B62DD4();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v28 = 0;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v7 = __clz(__rbit64(v5));
        v5 &= v5 - 1;
        v8 = v7 | (v28 << 6);
      }
      else
      {
        v9 = v28 + 1;
        if (__OFADD__(v28, 1))
          goto LABEL_34;
        if (v9 >= v26)
        {
LABEL_31:
          sub_1C3B54BA4();
          return (unint64_t)v2;
        }
        v10 = *(_QWORD *)(v27 + 8 * v9);
        v11 = v28 + 1;
        if (!v10)
        {
          v11 = v28 + 2;
          if (v28 + 2 >= v26)
            goto LABEL_31;
          v10 = *(_QWORD *)(v27 + 8 * v11);
          if (!v10)
          {
            v11 = v28 + 3;
            if (v28 + 3 >= v26)
              goto LABEL_31;
            v10 = *(_QWORD *)(v27 + 8 * v11);
            if (!v10)
            {
              v11 = v28 + 4;
              if (v28 + 4 >= v26)
                goto LABEL_31;
              v10 = *(_QWORD *)(v27 + 8 * v11);
              if (!v10)
              {
                v12 = v28 + 5;
                if (v28 + 5 >= v26)
                  goto LABEL_31;
                v10 = *(_QWORD *)(v27 + 8 * v12);
                if (!v10)
                {
                  while (1)
                  {
                    v11 = v12 + 1;
                    if (__OFADD__(v12, 1))
                      goto LABEL_35;
                    if (v11 >= v26)
                      goto LABEL_31;
                    v10 = *(_QWORD *)(v27 + 8 * v11);
                    ++v12;
                    if (v10)
                      goto LABEL_25;
                  }
                }
                v11 = v28 + 5;
              }
            }
          }
        }
LABEL_25:
        v5 = (v10 - 1) & v10;
        v8 = __clz(__rbit64(v10)) + (v11 << 6);
        v28 = v11;
      }
      v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v8);
      v15 = *v13;
      v14 = v13[1];
      sub_1C3B58614(*(_QWORD *)(a1 + 56) + 40 * v8, (uint64_t)&v35);
      v33 = v15;
      v34 = v14;
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      v17 = v15;
      v16 = v14;
      sub_1C3B54BAC(&v29, v31);
      sub_1C3B54BAC(v31, v32);
      sub_1C3B54BAC(v32, &v30);
      result = sub_1C3B54070(v17, v14);
      v18 = result;
      if ((v19 & 1) == 0)
        break;
      v20 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v20 = v17;
      v20[1] = v16;
      v21 = (_OWORD *)(v2[7] + 32 * v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v21);
      result = (unint64_t)sub_1C3B54BAC(&v30, v21);
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v22 = (uint64_t *)(v2[6] + 16 * result);
    *v22 = v17;
    v22[1] = v16;
    result = (unint64_t)sub_1C3B54BAC(&v30, (_OWORD *)(v2[7] + 32 * result));
    v23 = v2[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_33;
    v2[2] = v25;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_1C3B56FF4()
{
  return sub_1C3B57074(MEMORY[0x1E0CAF670], MEMORY[0x1E0CAF668], MEMORY[0x1E0CAF638]);
}

unint64_t sub_1C3B57010()
{
  unint64_t result;

  result = qword_1ED7E1E98[0];
  if (!qword_1ED7E1E98[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B639C4, &unk_1E7E5CEF0);
    atomic_store(result, qword_1ED7E1E98);
  }
  return result;
}

uint64_t sub_1C3B57058()
{
  return sub_1C3B57074((void (*)(_QWORD))MEMORY[0x1E0CAE1E8], (void (*)(void))MEMORY[0x1E0CAE1D8], (uint64_t (*)(_BYTE *, void *, unint64_t))MEMORY[0x1E0CAE1A0]);
}

uint64_t sub_1C3B57074(void (*a1)(_QWORD), void (*a2)(void), uint64_t (*a3)(_BYTE *, void *, unint64_t))
{
  uint64_t v3;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BYTE v14[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;

  v7 = *(_BYTE *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend);
  v9 = *(_QWORD *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier);
  v8 = *(_QWORD *)(v3 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8);
  OUTLINED_FUNCTION_36();
  v10 = sub_1C3B56894();
  a1(0);
  OUTLINED_FUNCTION_34();
  a2();
  v14[0] = v7;
  v15 = v9;
  v16 = v8;
  v17 = v10;
  v18 = 1;
  v19 = 0;
  v11 = sub_1C3B57010();
  v12 = a3(v14, &unk_1E7E5CEF0, v11);
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_3();
  return v12;
}

id sub_1C3B57174(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a1;
  a3();
  v6 = v5;

  if (v6 >> 60 == 15)
    return OUTLINED_FUNCTION_9(0);
  OUTLINED_FUNCTION_39();
  v8 = (void *)sub_1C3B62AA4();
  v9 = OUTLINED_FUNCTION_39();
  sub_1C3B579C4(v9, v10);
  return OUTLINED_FUNCTION_9(v8);
}

void sub_1C3B571D8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_1C3B57210()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetricMessage();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1C3B5728C()
{
  unint64_t result;

  result = qword_1EF8E6838;
  if (!qword_1EF8E6838)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63868, &unk_1E7E5CDD0);
    atomic_store(result, (unint64_t *)&qword_1EF8E6838);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1C3B572D8(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_52(-1);
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
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 2);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 2);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 2);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_52(v8);
}

uint64_t sub_1C3B5735C(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1C3B573A8 + 4 * byte_1C3B63849[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_48 + 4 * byte_1C3B63844[v4]))();
}

uint64_t sub_1C3B573E0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C3B573E8);
  return result;
}

uint64_t sub_1C3B573F0(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C3B573F8);
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1C3B57408(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1C3B57414(_BYTE *a1, char a2)
{
  return OUTLINED_FUNCTION_31(a1, a2 & 1);
}

void type metadata accessor for MetricsError()
{
  OUTLINED_FUNCTION_13();
}

void sub_1C3B57428(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B57454()
{
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_0();
}

void sub_1C3B57478(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_10();
}

void sub_1C3B574BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_0();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_17();
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void sub_1C3B5753C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B5758C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1C3B575CC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      return OUTLINED_FUNCTION_38(result);
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for CodableField()
{
  OUTLINED_FUNCTION_13();
}

void type metadata accessor for IIMetricsBackend()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF8E68A8)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF8E68A8);
  }
}

uint64_t sub_1C3B57664()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_3_0();
}

void sub_1C3B57690(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_28();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_17();
}

void sub_1C3B576E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12(a1, a2);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_0();
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(v2 + 24);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_0();
  *(_DWORD *)(v3 + 32) = *(_DWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v2 + 40);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_17();
}

void sub_1C3B5774C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_12(a1, a2);
  swift_bridgeObjectRelease();
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v2 + 16);
  swift_bridgeObjectRelease();
  *(_DWORD *)(v3 + 32) = *(_DWORD *)(v2 + 32);
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(v2 + 40);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B57798(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1C3B577D8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      return OUTLINED_FUNCTION_38(result);
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for StorableMessage()
{
  OUTLINED_FUNCTION_13();
}

unint64_t sub_1C3B57828()
{
  unint64_t result;

  result = qword_1ED7E1CF0;
  if (!qword_1ED7E1CF0)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63BE0, &unk_1E7E5CE60);
    atomic_store(result, (unint64_t *)&qword_1ED7E1CF0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1C3BD77FC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1C3B578A8()
{
  unint64_t result;

  result = qword_1EF8E6CE8;
  if (!qword_1EF8E6CE8)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B6399C, &unk_1E7E5CD48);
    atomic_store(result, (unint64_t *)&qword_1EF8E6CE8);
  }
  return result;
}

uint64_t sub_1C3B578E4(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED7E1808);
    v8 = a2();
    result = MEMORY[0x1C3BD7808](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1C3B5794C()
{
  unint64_t result;

  result = qword_1ED7E1C60[0];
  if (!qword_1ED7E1C60[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63974, &unk_1E7E5CD48);
    atomic_store(result, qword_1ED7E1C60);
  }
  return result;
}

unint64_t sub_1C3B57988()
{
  unint64_t result;

  result = qword_1ED7E1AB8;
  if (!qword_1ED7E1AB8)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63B90, &unk_1E7E5CCB8);
    atomic_store(result, (unint64_t *)&qword_1ED7E1AB8);
  }
  return result;
}

uint64_t sub_1C3B579C4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1C3B579D8(a1, a2);
  return a1;
}

uint64_t sub_1C3B579D8(uint64_t a1, unint64_t a2)
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

char *sub_1C3B57A1C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E68F0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C3B57E20((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3B57C04(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_1C3B57B10(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(qword_1ED7E1850);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 48);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C3B57EAC((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3B57D24(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C3B57C04(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E68F8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3B62DE0();
  __break(1u);
  return result;
}

uint64_t sub_1C3B57D24(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3B62DE0();
  __break(1u);
  return result;
}

char *sub_1C3B57E20(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3B62DE0();
    __break(1u);
  }
  else if (__dst != __src || &__src[56 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 56 * a2);
  }
  return __src;
}

char *sub_1C3B57EAC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3B62DE0();
    __break(1u);
  }
  else if (__dst != __src || &__src[48 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 48 * a2);
  }
  return __src;
}

void sub_1C3B57F38(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  void *v25;
  id v26;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  id v38;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  v5 = a1 + 32;
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_1C3B58688(v5, (uint64_t)&v33, &qword_1EF8E68F8);
    v6 = v33;
    v7 = v34;
    v31 = v33;
    v32 = v34;
    v28 = v35;
    v29 = v36;
    v30 = v37;
    v8 = (_QWORD *)*a3;
    v10 = sub_1C3B54070(v33, v34);
    v11 = v8[2];
    v12 = (v9 & 1) == 0;
    v13 = v11 + v12;
    if (__OFADD__(v11, v12))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1C3B62EA0();
      __break(1u);
      goto LABEL_20;
    }
    v14 = v9;
    if (v8[3] < v13)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v9 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6908);
      sub_1C3B62D8C();
      if ((v14 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v17 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v10 >> 6) + 64) |= 1 << v10;
    v18 = (uint64_t *)(v17[6] + 16 * v10);
    *v18 = v6;
    v18[1] = v7;
    v19 = v17[7] + 40 * v10;
    v20 = v28;
    v21 = v29;
    *(_QWORD *)(v19 + 32) = v30;
    *(_OWORD *)v19 = v20;
    *(_OWORD *)(v19 + 16) = v21;
    v22 = v17[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
      goto LABEL_18;
    v17[2] = v24;
    v5 += 56;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1C3B5823C(v13, a2 & 1);
  v15 = sub_1C3B54070(v6, v7);
  if ((v14 & 1) != (v16 & 1))
    goto LABEL_19;
  v10 = v15;
  if ((v14 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v25 = (void *)swift_allocError();
  swift_willThrow();
  v38 = v25;
  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E6910);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();
    sub_1C3B586C4((uint64_t)&v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return;
  }
LABEL_20:
  sub_1C3B62D08();
  sub_1C3B62C54();
  sub_1C3B62D74();
  sub_1C3B62C54();
  sub_1C3B62DA4();
  __break(1u);
}

uint64_t sub_1C3B5823C(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6900);
  v42 = a2;
  v6 = sub_1C3B62DC8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(_QWORD *)(v5 + 56) + 40 * i;
    if ((v42 & 1) != 0)
    {
      v24 = *(_OWORD *)v23;
      v25 = *(_OWORD *)(v23 + 16);
      v45 = *(_QWORD *)(v23 + 32);
      v43 = v24;
      v44 = v25;
    }
    else
    {
      sub_1C3B58614(v23, (uint64_t)&v43);
      swift_bridgeObjectRetain();
    }
    sub_1C3B62EE8();
    sub_1C3B62C48();
    result = sub_1C3B62F00();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) == 0)
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v26) >> 6;
      while (++v28 != v31 || (v30 & 1) == 0)
      {
        v32 = v28 == v31;
        if (v28 == v31)
          v28 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v11 + 8 * v28);
        if (v33 != -1)
        {
          v29 = __clz(__rbit64(~v33)) + (v28 << 6);
          goto LABEL_31;
        }
      }
      __break(1u);
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_31:
    *(_QWORD *)(v11 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    v34 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v29);
    *v34 = v22;
    v34[1] = v21;
    v35 = *(_QWORD *)(v7 + 56) + 40 * v29;
    v36 = v43;
    v37 = v44;
    *(_QWORD *)(v35 + 32) = v45;
    *(_OWORD *)v35 = v36;
    *(_OWORD *)(v35 + 16) = v37;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_42;
    if (v16 >= v40)
    {
      swift_release();
      v3 = v39;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_35;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v41 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v40)
        goto LABEL_33;
      v18 = *(_QWORD *)(v41 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v40)
  {
    v18 = *(_QWORD *)(v41 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_43;
        if (v13 >= v40)
          goto LABEL_33;
        v18 = *(_QWORD *)(v41 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_33:
  swift_release();
  v3 = v39;
LABEL_35:
  if ((v42 & 1) != 0)
  {
    v38 = 1 << *(_BYTE *)(v5 + 32);
    if (v38 >= 64)
      sub_1C3B544AC(0, (unint64_t)(v38 + 63) >> 6, v17);
    else
      *v17 = -1 << v38;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C3B58564@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  *a2 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v5 = v6;
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

unint64_t sub_1C3B5859C()
{
  unint64_t result;

  result = qword_1ED7E1820;
  if (!qword_1ED7E1820)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED7E1820);
  }
  return result;
}

unint64_t sub_1C3B585D8()
{
  unint64_t result;

  result = qword_1EF8E68D8;
  if (!qword_1EF8E68D8)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B638D0, &unk_1E7E5CDD0);
    atomic_store(result, (unint64_t *)&qword_1EF8E68D8);
  }
  return result;
}

uint64_t sub_1C3B58614(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

void sub_1C3B58650(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_10();
}

void sub_1C3B58688(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  __swift_instantiateConcreteTypeFromMangledName(a3);
  v3 = OUTLINED_FUNCTION_39();
  v4(v3);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B586C4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1C3B586F8(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_52(-1);
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 3);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 3);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 3);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_52(v8);
}

uint64_t sub_1C3B5877C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1C3B587C8 + 4 * byte_1C3B63853[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_48_0 + 4 * byte_1C3B6384E[v4]))();
}

uint64_t sub_1C3B58800(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C3B58808);
  return result;
}

uint64_t sub_1C3B58810(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C3B58818);
  return OUTLINED_FUNCTION_31();
}

_BYTE *sub_1C3B58828(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for CodableField.CodingKeys()
{
  OUTLINED_FUNCTION_13();
}

uint64_t sub_1C3B5883C(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return OUTLINED_FUNCTION_52(-1);
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 4);
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 4);
    }
    v4 = a1[1];
    if (a1[1])
      return OUTLINED_FUNCTION_52((*a1 | (v4 << 8)) - 4);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return OUTLINED_FUNCTION_52(v8);
}

uint64_t sub_1C3B588C0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1C3B5890C + 4 * byte_1C3B6385D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)j__OUTLINED_FUNCTION_48_1 + 4 * byte_1C3B63858[v4]))();
}

uint64_t sub_1C3B58944(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C3B5894CLL);
  return result;
}

uint64_t sub_1C3B58954(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C3B5895CLL);
  return OUTLINED_FUNCTION_31();
}

void type metadata accessor for StorableMessage.CodingKeys()
{
  OUTLINED_FUNCTION_13();
}

unint64_t sub_1C3B5897C()
{
  unint64_t result;

  result = qword_1EF8E6CF0;
  if (!qword_1EF8E6CF0)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63AB0, &unk_1E7E5CE60);
    atomic_store(result, (unint64_t *)&qword_1EF8E6CF0);
  }
  return result;
}

unint64_t sub_1C3B589BC()
{
  unint64_t result;

  result = qword_1EF8E6E00[0];
  if (!qword_1EF8E6E00[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63B68, &unk_1E7E5CCB8);
    atomic_store(result, qword_1EF8E6E00);
  }
  return result;
}

unint64_t sub_1C3B589FC()
{
  unint64_t result;

  result = qword_1ED7E1AD0[0];
  if (!qword_1ED7E1AD0[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63AD8, &unk_1E7E5CCB8);
    atomic_store(result, qword_1ED7E1AD0);
  }
  return result;
}

unint64_t sub_1C3B58A3C()
{
  unint64_t result;

  result = qword_1ED7E1AC8;
  if (!qword_1ED7E1AC8)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63B00, &unk_1E7E5CCB8);
    atomic_store(result, (unint64_t *)&qword_1ED7E1AC8);
  }
  return result;
}

unint64_t sub_1C3B58A7C()
{
  unint64_t result;

  result = qword_1ED7E1D00[0];
  if (!qword_1ED7E1D00[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63A20, &unk_1E7E5CE60);
    atomic_store(result, qword_1ED7E1D00);
  }
  return result;
}

unint64_t sub_1C3B58ABC()
{
  unint64_t result;

  result = qword_1ED7E1CF8;
  if (!qword_1ED7E1CF8)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63A48, &unk_1E7E5CE60);
    atomic_store(result, (unint64_t *)&qword_1ED7E1CF8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_1C3B62E94();
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return sub_1C3B62C54();
}

uint64_t OUTLINED_FUNCTION_7_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

id OUTLINED_FUNCTION_9(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_12(uint64_t result, uint64_t a2)
{
  *(_BYTE *)result = *(_BYTE *)a2;
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

void OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 1;
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(v0);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_1C3B62F18();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return sub_1C3B62F30();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_1C3B62F24();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_1C3B62F00();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_1C3B62EE8();
}

_BYTE *OUTLINED_FUNCTION_31@<X0>(_BYTE *result@<X0>, char a2@<W8>)
{
  *result = a2;
  return result;
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_37()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t result)
{
  *(_BYTE *)(result + 48) = 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_1C3B62EE8();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return sub_1C3B62EF4();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_release();
}

char *OUTLINED_FUNCTION_45(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_1C3B57A1C(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_46(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_47(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

__n128 OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, __int128 a10, __n128 a11)
{
  _OWORD *v11;
  __n128 result;

  *v11 = a9;
  v11[1] = a10;
  result = a11;
  v11[2] = a11;
  return result;
}

uint64_t OUTLINED_FUNCTION_52@<X0>(int a1@<W8>)
{
  return (a1 + 1);
}

uint64_t sub_1C3B58D88()
{
  uint64_t result;

  result = sub_1C3B58DA4();
  qword_1ED7E1F28 = result;
  return result;
}

uint64_t sub_1C3B58DA4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[2];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17A8);
  v0 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v2 = (char *)v14 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v0);
  v4 = (char *)v14 - v3;
  v5 = sub_1C3B62A98();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_resourcesDirectory);
  sub_1C3B62C3C();

  sub_1C3B62A8C();
  swift_bridgeObjectRelease();
  sub_1C3B62A80();
  sub_1C3B596E4((uint64_t)v2);
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) == 1)
  {
    sub_1C3B596E4((uint64_t)v4);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
    sub_1C3B62A74();
    v11 = (void *)sub_1C3B62C30();
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v10, sel_contentsAtPath_, v11);

    if (v12)
    {
      sub_1C3B62AB0();

      sub_1C3B62A5C();
      swift_allocObject();
      sub_1C3B62A50();
      sub_1C3B59730();
      sub_1C3B62A44();
      OUTLINED_FUNCTION_2_1();
      swift_release();
      OUTLINED_FUNCTION_3_1();
      return v14[1];
    }
    OUTLINED_FUNCTION_2_1();
  }
  return 0;
}

uint64_t *sub_1C3B59018()
{
  if (qword_1ED7E19A0 != -1)
    swift_once();
  return &qword_1ED7E1F28;
}

uint64_t sub_1C3B59058()
{
  return OUTLINED_FUNCTION_5_1();
}

uint64_t sub_1C3B59078(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000011 && a2 == 0x80000001C3B646C0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_1C3B62E94();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

void sub_1C3B590FC()
{
  sub_1C3B62EE8();
  OUTLINED_FUNCTION_5_1();
  sub_1C3B62F00();
  OUTLINED_FUNCTION_6_0();
}

unint64_t sub_1C3B59130()
{
  return 0x80000001C3B646C0;
}

uint64_t sub_1C3B59144()
{
  return 1;
}

void sub_1C3B59154()
{
  sub_1C3B62EE8();
  OUTLINED_FUNCTION_5_1();
  sub_1C3B62F00();
  OUTLINED_FUNCTION_6_0();
}

unint64_t sub_1C3B59184()
{
  sub_1C3B59130();
  return 0xD000000000000011;
}

uint64_t sub_1C3B591A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t result;

  result = sub_1C3B59078(a1, a2);
  *a3 = result != 0;
  return result;
}

void sub_1C3B591D0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1C3B591DC()
{
  sub_1C3B59320();
  return sub_1C3B62F24();
}

uint64_t sub_1C3B59204()
{
  sub_1C3B59320();
  return sub_1C3B62F30();
}

uint64_t MetricConfiguration.encode(to:)(_QWORD *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6980);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_0_1();
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B59320();
  sub_1C3B62F18();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6988);
  sub_1C3B59478(&qword_1EF8E6990, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
  sub_1C3B62E58();
  return OUTLINED_FUNCTION_1_0();
}

unint64_t sub_1C3B59320()
{
  unint64_t result;

  result = qword_1EF8E6F18[0];
  if (!qword_1EF8E6F18[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63DB8, &type metadata for MetricConfiguration.CodingKeys);
    atomic_store(result, qword_1EF8E6F18);
  }
  return result;
}

_QWORD *MetricConfiguration.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6998);
  OUTLINED_FUNCTION_6_1();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_0_1();
  v3 = __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_1C3B59320();
  sub_1C3B62F0C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6988);
    sub_1C3B59478(&qword_1EF8E69A0, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
    sub_1C3B62E10();
    OUTLINED_FUNCTION_1_0();
    v3 = v5;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  return v3;
}

uint64_t sub_1C3B59478(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF8E6988);
    v8 = a2;
    result = MEMORY[0x1C3BD7808](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *sub_1C3B594D8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = MetricConfiguration.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1C3B59500(_QWORD *a1)
{
  return MetricConfiguration.encode(to:)(a1);
}

ValueMetadata *type metadata accessor for MetricConfiguration()
{
  return &type metadata for MetricConfiguration;
}

uint64_t getEnumTagSinglePayload for MetricConfiguration.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MetricConfiguration.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1C3B595C0 + 4 * byte_1C3B63C80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1C3B595E0 + 4 * byte_1C3B63C85[v4]))();
}

_BYTE *sub_1C3B595C0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1C3B595E0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C3B595E8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C3B595F0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1C3B595F8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1C3B59600(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1C3B5960C()
{
  return 0;
}

ValueMetadata *type metadata accessor for MetricConfiguration.CodingKeys()
{
  return &type metadata for MetricConfiguration.CodingKeys;
}

unint64_t sub_1C3B59628()
{
  unint64_t result;

  result = qword_1EF8E7120[0];
  if (!qword_1EF8E7120[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63D90, &type metadata for MetricConfiguration.CodingKeys);
    atomic_store(result, qword_1EF8E7120);
  }
  return result;
}

unint64_t sub_1C3B59668()
{
  unint64_t result;

  result = qword_1EF8E7230;
  if (!qword_1EF8E7230)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63D00, &type metadata for MetricConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF8E7230);
  }
  return result;
}

unint64_t sub_1C3B596A8()
{
  unint64_t result;

  result = qword_1EF8E7238[0];
  if (!qword_1EF8E7238[0])
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63D28, &type metadata for MetricConfiguration.CodingKeys);
    atomic_store(result, qword_1EF8E7238);
  }
  return result;
}

uint64_t sub_1C3B596E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17A8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t sub_1C3B59730()
{
  unint64_t result;

  result = qword_1EF8E69A8;
  if (!qword_1EF8E69A8)
  {
    result = MEMORY[0x1C3BD7808](&protocol conformance descriptor for MetricConfiguration, &type metadata for MetricConfiguration);
    atomic_store(result, (unint64_t *)&qword_1EF8E69A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C3B579D8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_1C3B62EF4();
}

uint64_t sub_1C3B597CC(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int64_t v27;
  int64_t v28;
  _QWORD v29[4];
  __int128 v30;
  _OWORD v31[2];
  __int128 v32;
  _OWORD v33[2];
  _QWORD v34[6];
  uint64_t v35;

  sub_1C3B58564(a1, v34);
  v1 = v34[0];
  v2 = v34[4];
  v26 = v34[1];
  v27 = (unint64_t)(v34[2] + 64) >> 6;
  v28 = v34[3];
  result = swift_bridgeObjectRetain();
  v4 = MEMORY[0x1E0DEE9D8];
  while (v2)
  {
    v5 = __clz(__rbit64(v2));
    v2 &= v2 - 1;
    v6 = v5 | (v28 << 6);
LABEL_20:
    v11 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v13 = *v11;
    v12 = v11[1];
    sub_1C3B54958(*(_QWORD *)(v1 + 56) + 32 * v6, (uint64_t)v33);
    *(_QWORD *)&v32 = v13;
    *((_QWORD *)&v32 + 1) = v12;
    v30 = v32;
    v31[0] = v33[0];
    v31[1] = v33[1];
    v14 = v32;
    sub_1C3B54958((uint64_t)v31, (uint64_t)v29);
    sub_1C3B59CDC();
    swift_bridgeObjectRetain();
    if (swift_dynamicCast())
    {
      v15 = v35;
      swift_bridgeObjectRetain();
      sub_1C3B54C64((uint64_t)&v30);
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_1C3B59D28(0, *(_QWORD *)(v4 + 16) + 1, 1, v4);
        v4 = result;
      }
      v17 = *(_QWORD *)(v4 + 16);
      v16 = *(_QWORD *)(v4 + 24);
      if (v17 >= v16 >> 1)
      {
        result = (uint64_t)sub_1C3B59D28((char *)(v16 > 1), v17 + 1, 1, v4);
        v4 = result;
      }
      *(_QWORD *)(v4 + 16) = v17 + 1;
      v18 = v4 + 24 * v17;
      *(_OWORD *)(v18 + 32) = v14;
      *(_QWORD *)(v18 + 48) = v15;
    }
    else
    {
      v19 = sub_1C3B62CA8();
      result = (uint64_t)ii_default_log_handle();
      if (!result)
        goto LABEL_33;
      v20 = result;
      sub_1C3B54958((uint64_t)v31, (uint64_t)v29);
      v21 = v19;
      if (os_log_type_enabled(v20, v19))
      {
        v22 = swift_slowAlloc();
        v23 = swift_slowAlloc();
        v35 = v23;
        *(_DWORD *)v22 = 136315138;
        __swift_project_boxed_opaque_existential_0(v29, v29[3]);
        swift_getDynamicType();
        v24 = sub_1C3B62F3C();
        *(_QWORD *)(v22 + 4) = sub_1C3B53908(v24, v25, &v35);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
        _os_log_impl(&dword_1C3B51000, v20, v21, "CABackend: failed to convert item of type %s to NSObject", (uint8_t *)v22, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1C3BD785C](v23, -1, -1);
        MEMORY[0x1C3BD785C](v22, -1, -1);

      }
      else
      {

        __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
      }
      result = sub_1C3B54C64((uint64_t)&v30);
    }
  }
  v7 = v28 + 1;
  if (!__OFADD__(v28, 1))
  {
    if (v7 >= v27)
      goto LABEL_31;
    v8 = *(_QWORD *)(v26 + 8 * v7);
    v9 = v28 + 1;
    if (!v8)
    {
      v9 = v28 + 2;
      if (v28 + 2 >= v27)
        goto LABEL_31;
      v8 = *(_QWORD *)(v26 + 8 * v9);
      if (!v8)
      {
        v9 = v28 + 3;
        if (v28 + 3 >= v27)
          goto LABEL_31;
        v8 = *(_QWORD *)(v26 + 8 * v9);
        if (!v8)
        {
          v9 = v28 + 4;
          if (v28 + 4 >= v27)
            goto LABEL_31;
          v8 = *(_QWORD *)(v26 + 8 * v9);
          if (!v8)
          {
            v9 = v28 + 5;
            if (v28 + 5 >= v27)
              goto LABEL_31;
            v8 = *(_QWORD *)(v26 + 8 * v9);
            if (!v8)
            {
              v10 = v28 + 6;
              while (v10 < v27)
              {
                v8 = *(_QWORD *)(v26 + 8 * v10++);
                if (v8)
                {
                  v9 = v10 - 1;
                  goto LABEL_19;
                }
              }
LABEL_31:
              swift_release();
              return v4;
            }
          }
        }
      }
    }
LABEL_19:
    v2 = (v8 - 1) & v8;
    v6 = __clz(__rbit64(v8)) + (v9 << 6);
    v28 = v9;
    goto LABEL_20;
  }
  __break(1u);
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_1C3B59BA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69B8);
    v1 = sub_1C3B62DD4();
  }
  else
  {
    v1 = MEMORY[0x1E0DEE9E0];
  }
  v4 = v1;
  v2 = swift_bridgeObjectRetain();
  sub_1C3B59FC4(v2, 1, &v4);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1C3B59C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = sub_1C3B597CC(a3);
  v4 = sub_1C3B59BA0(v3);
  v5 = (void *)sub_1C3B62C30();
  sub_1C3B59CDC();
  v6 = (void *)sub_1C3B62BE8();
  AnalyticsSendEvent();

  return v4;
}

unint64_t sub_1C3B59CDC()
{
  unint64_t result;

  result = qword_1EF8E69B0;
  if (!qword_1EF8E69B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF8E69B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for CoreAnalyticsDispatcher()
{
  return &type metadata for CoreAnalyticsDispatcher;
}

char *sub_1C3B59D28(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69C8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C3B59F38((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3B59E1C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C3B59E1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69D0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3B62DE0();
  __break(1u);
  return result;
}

char *sub_1C3B59F38(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3B62DE0();
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

void sub_1C3B59FC4(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v3;
  void **i;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  void *v24;
  id v25;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return;
  }
  for (i = (void **)(swift_bridgeObjectRetain() + 48); ; i += 3)
  {
    v7 = (uint64_t)*(i - 2);
    v6 = (uint64_t)*(i - 1);
    v8 = *i;
    v9 = (_QWORD *)*a3;
    swift_bridgeObjectRetain();
    v10 = v8;
    v12 = sub_1C3B54070(v7, v6);
    v13 = v9[2];
    v14 = (v11 & 1) == 0;
    v15 = v13 + v14;
    if (__OFADD__(v13, v14))
    {
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      sub_1C3B62EA0();
      __break(1u);
      goto LABEL_20;
    }
    v16 = v11;
    if (v9[3] < v15)
      break;
    if ((a2 & 1) != 0)
    {
      if ((v11 & 1) != 0)
        goto LABEL_14;
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69C0);
      sub_1C3B62D8C();
      if ((v16 & 1) != 0)
        goto LABEL_14;
    }
LABEL_10:
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v12 >> 6) + 64) |= 1 << v12;
    v20 = (uint64_t *)(v19[6] + 16 * v12);
    *v20 = v7;
    v20[1] = v6;
    *(_QWORD *)(v19[7] + 8 * v12) = v10;
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_18;
    v19[2] = v23;
    a2 = 1;
    if (!--v3)
    {
      swift_bridgeObjectRelease_n();
      return;
    }
  }
  sub_1C3B5A294(v15, a2 & 1);
  v17 = sub_1C3B54070(v7, v6);
  if ((v16 & 1) != (v18 & 1))
    goto LABEL_19;
  v12 = v17;
  if ((v16 & 1) == 0)
    goto LABEL_10;
LABEL_14:
  v24 = (void *)swift_allocError();
  swift_willThrow();
  v25 = v24;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF8E6910);
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease_n();
    return;
  }
LABEL_20:
  sub_1C3B62D08();
  sub_1C3B62C54();
  sub_1C3B62D74();
  sub_1C3B62C54();
  sub_1C3B62DA4();
  __break(1u);
}

uint64_t sub_1C3B5A294(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  _QWORD *v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69B8);
  v38 = a2;
  v6 = sub_1C3B62DC8();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v14 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v14 | (v13 << 6); ; i = __clz(__rbit64(v18)) + (v13 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v22 = *v20;
    v21 = v20[1];
    v23 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v24 = v23;
    }
    sub_1C3B62EE8();
    sub_1C3B62C48();
    result = sub_1C3B62F00();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = result & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) == 0)
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v25) >> 6;
      while (++v27 != v30 || (v29 & 1) == 0)
      {
        v31 = v27 == v30;
        if (v27 == v30)
          v27 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v27);
        if (v32 != -1)
        {
          v28 = __clz(__rbit64(~v32)) + (v27 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
    v33 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v28);
    *v33 = v22;
    v33[1] = v21;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v28) = v23;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v36)
    {
      swift_release();
      v3 = v35;
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v37 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v36)
        goto LABEL_32;
      v18 = *(_QWORD *)(v37 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v36)
  {
    v18 = *(_QWORD *)(v37 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v36)
          goto LABEL_32;
        v18 = *(_QWORD *)(v37 + 8 * v13);
        ++v19;
        if (v18)
          goto LABEL_18;
      }
    }
    v13 = v19;
    goto LABEL_18;
  }
LABEL_32:
  swift_release();
  v3 = v35;
LABEL_34:
  if ((v38 & 1) != 0)
  {
    v34 = 1 << *(_BYTE *)(v5 + 32);
    if (v34 >= 64)
      sub_1C3B544AC(0, (unint64_t)(v34 + 63) >> 6, v17);
    else
      *v17 = -1 << v34;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1C3B5A590()
{
  uint64_t v0;

  v0 = sub_1C3B62BDC();
  __swift_allocate_value_buffer(v0, qword_1EF8E7560);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF8E7560);
  return sub_1C3B62BD0();
}

uint64_t sub_1C3B5A604()
{
  uint64_t v0;

  if (qword_1EF8E72C0 != -1)
    swift_once();
  v0 = sub_1C3B62BDC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_1EF8E7560);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t sub_1C3B5A6A4()
{
  return sub_1C3B62EF4();
}

void sub_1C3B5A6C8()
{
  sub_1C3B62EE8();
  sub_1C3B62EF4();
  sub_1C3B62F00();
  OUTLINED_FUNCTION_6_0();
}

void sub_1C3B5A704()
{
  sub_1C3B5A6C8();
}

uint64_t sub_1C3B5A70C()
{
  return sub_1C3B5A6A4();
}

void sub_1C3B5A714()
{
  sub_1C3B62EE8();
  sub_1C3B62EF4();
  sub_1C3B62F00();
  OUTLINED_FUNCTION_6_0();
}

void sub_1C3B5A74C()
{
  unint64_t v0;
  unsigned int v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_1_1();
  if (v2)
    v3 = 0x80000001C3B64730;
  else
    v3 = 0xEE006C69616D2E65;
  if (v1 >= 2)
    v4 = v3;
  else
    v4 = v0;
  OUTLINED_FUNCTION_1_1();
  if (!v13)
  {
    v8 = v11;
    v9 = v12;
  }
  if (v10 >= 2)
    v14 = v8;
  else
    v14 = v6;
  if (v10 >= 2)
    v15 = v9;
  else
    v15 = v7;
  if (v5 != v14 || v4 != v15)
    sub_1C3B62E94();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
}

unint64_t sub_1C3B5A820(unsigned __int8 a1)
{
  unint64_t v1;

  v1 = 0x6C7070612E6D6F63;
  if (a1)
    v1 = 0xD000000000000013;
  if (a1 - 1 >= 2)
    return v1;
  else
    return 0xD000000000000014;
}

void sub_1C3B5A88C()
{
  sub_1C3B5A74C();
}

unint64_t sub_1C3B5A898()
{
  unsigned __int8 *v0;

  return sub_1C3B5A820(*v0);
}

void sub_1C3B5A8A0(uint64_t a1, uint64_t a2)
{
  if ((a1 != 0xD000000000000014 || a2 != 0x80000001C3B64750)
    && (OUTLINED_FUNCTION_0_0() & 1) == 0
    && (a1 != 0xD000000000000013 || a2 != 0x80000001C3B64730)
    && (OUTLINED_FUNCTION_0_0() & 1) == 0
    && (OUTLINED_FUNCTION_0_0() & 1) == 0
    && (a1 != 0x6C7070612E6D6F63 || a2 != 0xEE006C69616D2E65))
  {
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_17();
}

uint64_t getEnumTagSinglePayload for BundleId(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for BundleId(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1C3B5AA9C + 4 * byte_1C3B63E35[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1C3B5AAD0 + 4 * asc_1C3B63E30[v4]))();
}

uint64_t sub_1C3B5AAD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C3B5AAD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C3B5AAE0);
  return result;
}

uint64_t sub_1C3B5AAEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C3B5AAF4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1C3B5AAF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C3B5AB00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BundleId()
{
  return &type metadata for BundleId;
}

void sub_1C3B5AB34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
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

  OUTLINED_FUNCTION_12_0();
  v46 = v0;
  v49 = v4;
  v48 = OUTLINED_FUNCTION_7_1();
  v45 = *(_QWORD *)(v48 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_98();
  v47 = v6;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v40 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17C8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_26_0();
  v41 = (char *)v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17C0);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_44_0();
  v13 = sub_1C3B62A38();
  v43 = *(_QWORD *)(v13 - 8);
  v44 = v13;
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_0_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17B8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_26_0();
  v42 = v16;
  v17 = sub_1C3B62B28();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  OUTLINED_FUNCTION_11_0();
  v19 = sub_1C3B62B58();
  v20 = *(_QWORD *)(v19 - 8);
  v40 = v19;
  v21 = MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v40 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v40 - v24;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v3, *MEMORY[0x1E0CB0ED8], v17);
  sub_1C3B62B34();
  OUTLINED_FUNCTION_51_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
  __swift_storeEnumTagSinglePayload(v1, 1, 1, v19);
  v26 = sub_1C3B62B64();
  __swift_storeEnumTagSinglePayload((uint64_t)v41, 1, 1, v26);
  v27 = v45;
  sub_1C3B62A2C();
  v28 = v46;
  sub_1C3B62B40();
  v29 = v42;
  sub_1C3B62B4C();
  v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v41 = v9;
  v31 = v48;
  v30(v9, v48);
  v32 = v2;
  v33 = v47;
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v32, v44);
  v44 = v20;
  v34 = v23;
  v35 = v23;
  v36 = v40;
  (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v35, v25, v40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v33, v28, v31);
  if (__swift_getEnumTagSinglePayload(v29, 1, v31) == 1)
  {
    v37 = (uint64_t)v41;
    sub_1C3B62B40();
    sub_1C3B62AE0();
    OUTLINED_FUNCTION_41_0(v37);
    OUTLINED_FUNCTION_41_0(v33);
    v38 = *(void (**)(char *, uint64_t))(v44 + 8);
    v38(v34, v36);
    v38(v25, v36);
    sub_1C3B5AF08(v29);
  }
  else
  {
    OUTLINED_FUNCTION_41_0(v33);
    v39 = *(void (**)(char *, uint64_t))(v44 + 8);
    v39(v34, v36);
    v39(v25, v36);
    OUTLINED_FUNCTION_81(v49, v29, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v27 + 32));
  }
  OUTLINED_FUNCTION_4_1();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1C3B5AF08(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1C3B5AF48()
{
  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_77();
  sub_1C3B5AF80();
  OUTLINED_FUNCTION_17();
}

void sub_1C3B5AF80()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v7;

  OUTLINED_FUNCTION_12_0();
  v4 = v3;
  OUTLINED_FUNCTION_50_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17D0);
  OUTLINED_FUNCTION_72();
  MEMORY[0x1E0C80A78]();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_32_0();
  v5 = v0;
  v6 = v4;
  sub_1C3B62B94();
  OUTLINED_FUNCTION_33_0((uint64_t)v5 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricStorage_stream, v1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 32));

  v7.receiver = v5;
  v7.super_class = (Class)OUTLINED_FUNCTION_112();
  objc_msgSendSuper2(&v7, sel_init);

  OUTLINED_FUNCTION_4_1();
}

uint64_t type metadata accessor for MetricStorage(uint64_t a1)
{
  return sub_1C3B6008C(a1, (uint64_t *)&unk_1ED7E1A60);
}

uint64_t sub_1C3B5B054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  OUTLINED_FUNCTION_50_0();
  sub_1C3B60260(0, &qword_1ED7E17E8);
  v3 = (void *)objc_opt_self();
  v4 = (void *)OUTLINED_FUNCTION_31_0();
  v5 = objc_msgSend(v3, sel_suggestionsSubdirectory_, v4);

  v6 = sub_1C3B62C3C();
  v8 = v7;

  v9 = OUTLINED_FUNCTION_101(v6, v8);
  return (*(uint64_t (**)(uint64_t, uint64_t, id))(v0 + 88))(v2, v1, v9);
}

id sub_1C3B5B114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_1C3B62C30();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithStoreBasePath_segmentSize_, v5, a3);

  return v6;
}

id sub_1C3B5B1AC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_112();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_1C3B5B21C()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_1C3B62C30();
  v2 = objc_msgSend(v0, sel_suggestionsDirectoryFile_, v1);

  v3 = sub_1C3B62C3C();
  v5 = v4;

  qword_1ED7E1F48 = v3;
  unk_1ED7E1F50 = v5;
}

uint64_t MetricStore.enrichmentProviders.getter()
{
  return sub_1C3B5B314();
}

void MetricStore.enrichmentProviders.setter(uint64_t a1)
{
  sub_1C3B5B360(a1, &OBJC_IVAR___IISMetricStore_enrichmentProviders);
}

void MetricStore.enrichmentProviders.modify()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_10();
}

uint64_t MetricStore.messageListeners.getter()
{
  return sub_1C3B5B314();
}

uint64_t sub_1C3B5B314()
{
  OUTLINED_FUNCTION_1_2();
  return swift_bridgeObjectRetain();
}

void MetricStore.messageListeners.setter(uint64_t a1)
{
  sub_1C3B5B360(a1, &OBJC_IVAR___IISMetricStore_messageListeners);
}

void sub_1C3B5B360(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  OUTLINED_FUNCTION_1_2();
  *v4 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_0();
}

void MetricStore.messageListeners.modify()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_10();
}

id sub_1C3B5B3DC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for MetricStore(0)), sel_init);
  static MetricStore.sharedInstance = (uint64_t)result;
  return result;
}

uint64_t *MetricStore.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1ED7E1A38 != -1)
    swift_once();
  return &static MetricStore.sharedInstance;
}

id static MetricStore.sharedInstance.getter()
{
  if (qword_1ED7E1A38 != -1)
    swift_once();
  return (id)static MetricStore.sharedInstance;
}

id MetricStore.__allocating_init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, double a8)
{
  OUTLINED_FUNCTION_77();
  return MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(a8, a1, a2, a3, a4, a5, a6, a7);
}

id MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v8;
  id v14;
  id v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  objc_class *v24;
  objc_super v26;

  v24 = (objc_class *)OUTLINED_FUNCTION_78();
  v14 = objc_allocWithZone((Class)OUTLINED_FUNCTION_112());
  v15 = a4;
  v16 = v8;
  sub_1C3B5AF80();
  v18 = v17;
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D815F0]), sel_initWithGuardedData_, v17);

  *(_QWORD *)&v16[OBJC_IVAR___IISMetricStore_storageLock] = v19;
  *(_QWORD *)&v16[OBJC_IVAR___IISMetricStore_enrichmentProviders] = a5;
  *(_QWORD *)&v16[OBJC_IVAR___IISMetricStore_messageListeners] = a6;
  v20 = (uint64_t)&v16[OBJC_IVAR___IISMetricStore_windowStartDate];
  v21 = *(_QWORD *)(OUTLINED_FUNCTION_7_1() - 8);
  OUTLINED_FUNCTION_38_0(v20, a7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 16));
  *(_QWORD *)&v16[OBJC_IVAR___IISMetricStore_configuration] = a8;
  *(double *)&v16[OBJC_IVAR___IISMetricStore_sendInterval] = a1;

  v26.receiver = v16;
  v26.super_class = v24;
  v22 = objc_msgSendSuper2(&v26, sel_init);

  OUTLINED_FUNCTION_51_0(a7, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
  return v22;
}

void sub_1C3B5B688()
{
  uint64_t v0;
  objc_class *v1;
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
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  _BYTE *v27;
  uint64_t v28;
  id v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[5];
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  Class v49;
  uint64_t v50;

  OUTLINED_FUNCTION_12_0();
  v48 = v2;
  v49 = v1;
  v47 = v3;
  v4 = OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_53();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OUTLINED_FUNCTION_7_1();
  v45 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_25_0(v10, v43[0]);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v43 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v43 - v15;
  sub_1C3B60260(0, &qword_1ED7E17E8);
  v17 = (void *)objc_opt_self();
  v18 = (void *)OUTLINED_FUNCTION_31_0();
  v19 = objc_msgSend(v17, sel_suggestionsSubdirectory_, v18);

  v20 = sub_1C3B62C3C();
  v22 = v21;

  v46 = OUTLINED_FUNCTION_101(v20, v22);
  v23 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  if (qword_1ED7E1A40 != -1)
    swift_once();
  v24 = (void *)sub_1C3B62C30();
  v25 = objc_msgSend(v23, sel_contentsAtPath_, v24);

  v43[4] = (uint64_t)v7;
  if (v25)
  {
    sub_1C3B62AB0();

    sub_1C3B629FC();
    OUTLINED_FUNCTION_34();
    sub_1C3B629F0();
    sub_1C3B601A8(&qword_1ED7E17A0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    sub_1C3B629E4();
    OUTLINED_FUNCTION_96();
    OUTLINED_FUNCTION_44();
    v38 = v45;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v16, v14, v8);
    v39 = v44;
  }
  else
  {
    sub_1C3B5BB6C();
    v26 = (void *)swift_allocError();
    *v27 = 2;
    swift_willThrow();
    v28 = sub_1C3B5A604();
    (*(void (**)(char *, uint64_t, uint64_t))(v0 + 16))(v7, v28, v4);
    v29 = v26;
    v30 = v26;
    v31 = sub_1C3B62BC4();
    v32 = sub_1C3B62CA8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = OUTLINED_FUNCTION_9_0();
      v43[2] = v0;
      v34 = (uint8_t *)v33;
      v50 = OUTLINED_FUNCTION_9_0();
      *(_DWORD *)v34 = 136315138;
      v43[3] = v8;
      v43[1] = v4;
      swift_getErrorValue();
      v35 = OUTLINED_FUNCTION_118();
      v37 = OUTLINED_FUNCTION_115(v35, v36);
      OUTLINED_FUNCTION_113(v37);
      sub_1C3B62CD8();
      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_37_0();
      OUTLINED_FUNCTION_37_0();
      _os_log_impl(&dword_1C3B51000, v31, v32, "MetricStore: failed to decode start date from local file, setting start date of tomorrow UTC: %s", v34, 0xCu);
      OUTLINED_FUNCTION_108();
      OUTLINED_FUNCTION_7();
    }
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_37_0();

    (*(void (**)(char *, uint64_t))(v0 + 8))(v7, v4);
    v39 = v44;
    sub_1C3B62B10();
    sub_1C3B5AB34();
    v38 = v45;
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v39, v8);
    sub_1C3B5BBA8();
    OUTLINED_FUNCTION_37_0();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17F8);
  v40 = OUTLINED_FUNCTION_5_2();
  *(_OWORD *)(v40 + 16) = xmmword_1C3B63F00;
  type metadata accessor for AppLaunchCounter();
  *(_QWORD *)(v40 + 32) = sub_1C3B538EC();
  v50 = v40;
  sub_1C3B62C84();
  v41 = v50;
  (*(void (**)(uint64_t, char *, uint64_t))(v38 + 16))(v39, v16, v8);
  v42 = *sub_1C3B59018();
  objc_allocWithZone(v49);
  OUTLINED_FUNCTION_28();
  MetricStore.init(identifier:storeConfig:enrichmentProviders:messageListeners:windowStartDate:configuration:sendInterval:)(2419200.0, v47, v48, v46, v41, MEMORY[0x1E0DEE9D8], v39, v42);
  (*(void (**)(char *, uint64_t))(v38 + 8))(v16, v8);
  OUTLINED_FUNCTION_4_1();
}

unint64_t sub_1C3B5BB6C()
{
  unint64_t result;

  result = qword_1ED7E17E0;
  if (!qword_1ED7E17E0)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63F88, &type metadata for MetricError);
    atomic_store(result, (unint64_t *)&qword_1ED7E17E0);
  }
  return result;
}

void sub_1C3B5BBA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_53();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_44_0();
  sub_1C3B62A98();
  OUTLINED_FUNCTION_58();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_11_0();
  sub_1C3B62A20();
  OUTLINED_FUNCTION_34();
  sub_1C3B62A14();
  OUTLINED_FUNCTION_7_1();
  sub_1C3B601A8(&qword_1EF8E69E0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  sub_1C3B62A08();
  if (qword_1ED7E1A40 != -1)
    swift_once();
  sub_1C3B62A68();
  sub_1C3B62ABC();
  OUTLINED_FUNCTION_39_0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_105();
  swift_release();
  OUTLINED_FUNCTION_4_1();
}

void sub_1C3B5BE1C(void (*a1)(unint64_t, unint64_t))
{
  OUTLINED_FUNCTION_78();
  a1(0xD00000000000001BLL, 0x80000001C3B64770);
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_17();
}

uint64_t MetricStore.saveMessage(_:backend:messageIdentifier:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v5 = v4;
  OUTLINED_FUNCTION_32_0();
  v10 = sub_1C3B56C30(a1);
  OUTLINED_FUNCTION_28();
  v11 = sub_1C3B56924(v10, a3, a4, a2);
  v12 = *(void **)(v5 + OBJC_IVAR___IISMetricStore_storageLock);
  v13 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v13 + 16) = v11;
  v14 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v14 + 16) = sub_1C3B5F818;
  *(_QWORD *)(v14 + 24) = v13;
  v15 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B5C394, MEMORY[0x1E0C809B0], 1107296256, v18, v19);
  v16 = v11;
  OUTLINED_FUNCTION_122();
  swift_release();
  objc_msgSend(v12, sel_runWithLockAcquired_, v15);

  _Block_release(v15);
  LOBYTE(v12) = OUTLINED_FUNCTION_68();
  result = OUTLINED_FUNCTION_73();
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_44();
    return a1;
  }
  return result;
}

unint64_t sub_1C3B5C020(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  unint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  void *v17;
  id v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t *v25;
  uint64_t *v26;
  _OWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED7E1830);
    v2 = (_QWORD *)sub_1C3B62DD4();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v33 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v32 = (unint64_t)(63 - v3) >> 6;
  v6 = &v38;
  v7 = &v40;
  result = swift_bridgeObjectRetain();
  v34 = 0;
  v9 = (unint64_t *)&qword_1EF8E69B0;
  v10 = 0x1E0DE7910uLL;
  while (1)
  {
    while (1)
    {
      if (v5)
      {
        v35 = (v5 - 1) & v5;
        v11 = __clz(__rbit64(v5)) | (v34 << 6);
      }
      else
      {
        v12 = v34 + 1;
        if (__OFADD__(v34, 1))
          goto LABEL_34;
        if (v12 >= v32)
        {
LABEL_31:
          sub_1C3B54BA4();
          return (unint64_t)v2;
        }
        v13 = *(_QWORD *)(v33 + 8 * v12);
        v14 = v34 + 1;
        if (!v13)
        {
          v14 = v34 + 2;
          if (v34 + 2 >= v32)
            goto LABEL_31;
          v13 = *(_QWORD *)(v33 + 8 * v14);
          if (!v13)
          {
            v14 = v34 + 3;
            if (v34 + 3 >= v32)
              goto LABEL_31;
            v13 = *(_QWORD *)(v33 + 8 * v14);
            if (!v13)
            {
              v14 = v34 + 4;
              if (v34 + 4 >= v32)
                goto LABEL_31;
              v13 = *(_QWORD *)(v33 + 8 * v14);
              if (!v13)
              {
                v15 = v34 + 5;
                if (v34 + 5 >= v32)
                  goto LABEL_31;
                v13 = *(_QWORD *)(v33 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      goto LABEL_35;
                    if (v14 >= v32)
                      goto LABEL_31;
                    v13 = *(_QWORD *)(v33 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_25;
                  }
                }
                v14 = v34 + 5;
              }
            }
          }
        }
LABEL_25:
        v34 = v14;
        v35 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
      }
      v16 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v11);
      v17 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v11);
      v36 = *v16;
      v37 = v16[1];
      sub_1C3B60260(0, v9);
      swift_bridgeObjectRetain();
      v18 = v17;
      swift_dynamicCast();
      sub_1C3B54BAC(v6, v7);
      sub_1C3B54BAC(v7, v41);
      sub_1C3B54BAC(v41, &v39);
      result = sub_1C3B54070(v36, v37);
      v19 = result;
      if ((v20 & 1) == 0)
        break;
      v21 = v7;
      v22 = v6;
      v23 = v1;
      v24 = v10;
      v25 = v9;
      v26 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v26 = v36;
      v26[1] = v37;
      v9 = v25;
      v10 = v24;
      v1 = v23;
      v6 = v22;
      v7 = v21;
      v27 = (_OWORD *)(v2[7] + 32 * v19);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v27);
      result = (unint64_t)sub_1C3B54BAC(&v39, v27);
      v5 = v35;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v28 = (uint64_t *)(v2[6] + 16 * result);
    *v28 = v36;
    v28[1] = v37;
    result = (unint64_t)sub_1C3B54BAC(&v39, (_OWORD *)(v2[7] + 32 * result));
    v29 = v2[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
      goto LABEL_33;
    v2[2] = v31;
    v5 = v35;
  }
  __break(1u);
LABEL_33:
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

void sub_1C3B5C394(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

Swift::Void __swiftcall MetricStore.removeAllMetrics(withPrefix:)(Swift::String withPrefix)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  object = withPrefix._object;
  countAndFlagsBits = withPrefix._countAndFlagsBits;
  v4 = *(void **)(v1 + OBJC_IVAR___IISMetricStore_storageLock);
  v5 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v5 + 16) = countAndFlagsBits;
  *(_QWORD *)(v5 + 24) = object;
  v6 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v6 + 16) = sub_1C3B5F8FC;
  *(_QWORD *)(v6 + 24) = v5;
  v7 = OUTLINED_FUNCTION_1((uint64_t)sub_1C3B5C394, MEMORY[0x1E0C809B0], 1107296256, v8, v9);
  OUTLINED_FUNCTION_36();
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_runWithLockAcquired_, v7);
  _Block_release(v7);
  LOBYTE(v4) = OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_44();
  if ((v4 & 1) != 0)
    __break(1u);
}

void MetricStore.registerEnrichmentProvider(_:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)(v0 + OBJC_IVAR___IISMetricStore_enrichmentProviders);
  OUTLINED_FUNCTION_1_2();
  v2 = swift_unknownObjectRetain();
  MEMORY[0x1C3BD7094](v2);
  sub_1C3B5F514(*(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10));
  sub_1C3B62C9C();
  sub_1C3B62C84();
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_64();
}

void MetricStore.registerMessageListener(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = (uint64_t *)(v2 + OBJC_IVAR___IISMetricStore_messageListeners);
  OUTLINED_FUNCTION_1_2();
  swift_retain();
  sub_1C3B5F4CC();
  v7 = *(char **)(*v6 + 16);
  sub_1C3B5F540(v7);
  v8 = *v6;
  *(_QWORD *)(v8 + 16) = v7 + 1;
  v9 = v8 + 16 * (_QWORD)v7;
  *(_QWORD *)(v9 + 32) = sub_1C3B5F970;
  *(_QWORD *)(v9 + 40) = v5;
  OUTLINED_FUNCTION_80();
  OUTLINED_FUNCTION_64();
}

uint64_t sub_1C3B5C7B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)sub_1C3B62C30();
  v6 = (void *)sub_1C3B62BE8();
  v7 = (*(uint64_t (**)(uint64_t, void *, void *))(a4 + 16))(a4, v5, v6);

  return v7;
}

void MetricStore.sendMessages(shouldContinue:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v33;
  _WORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t);
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v44;
  _WORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;

  OUTLINED_FUNCTION_56();
  v2 = v0;
  v4 = v3;
  v56 = OUTLINED_FUNCTION_7_1();
  v54 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_25_0(v6, v52);
  MEMORY[0x1E0C80A78](v7);
  v55 = (char *)&v52 - v8;
  v9 = OUTLINED_FUNCTION_23_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_43_0();
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v52 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v52 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v52 - v18;
  sub_1C3B5CC20();
  if (v20)
  {
    v21 = (_QWORD *)sub_1C3B5D4AC(v20);
    v22 = OUTLINED_FUNCTION_19_0();
    if ((v4(v22) & 1) != 0)
    {
      v23 = sub_1C3B5DA5C(v21, v4);
      OUTLINED_FUNCTION_20();
      if (v23)
      {
        sub_1C3B5DD28();
        v25 = v24;
        v26 = OUTLINED_FUNCTION_3();
        if (v25)
        {
          MEMORY[0x1E0C80A78](v26);
          *(&v52 - 2) = v2;
          sub_1C3B5F20C(v25, (void (*)(uint64_t, uint64_t, uint64_t))sub_1C3B5F9A8);
          OUTLINED_FUNCTION_19_0();
          v27 = v2 + OBJC_IVAR___IISMetricStore_windowStartDate;
          OUTLINED_FUNCTION_1_2();
          v29 = v53;
          v28 = v54;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v53, v27, v56);
          v30 = (uint64_t)v55;
          OUTLINED_FUNCTION_69();
          OUTLINED_FUNCTION_65(v29);
          sub_1C3B5E468(v30);
          OUTLINED_FUNCTION_65(v30);
          OUTLINED_FUNCTION_84(v29);
          OUTLINED_FUNCTION_69();
          OUTLINED_FUNCTION_65(v29);
          OUTLINED_FUNCTION_1_2();
          OUTLINED_FUNCTION_33_0(v27, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 40));
          swift_endAccess();
          OUTLINED_FUNCTION_84(v30);
          sub_1C3B5BBA8();
          OUTLINED_FUNCTION_65(v30);
        }
        else
        {
          sub_1C3B5A604();
          OUTLINED_FUNCTION_93();
          OUTLINED_FUNCTION_33_0((uint64_t)v17, v48, v49);
          sub_1C3B62BC4();
          v50 = OUTLINED_FUNCTION_46_0();
          if (OUTLINED_FUNCTION_6_2(v50))
          {
            v51 = (uint8_t *)OUTLINED_FUNCTION_8_1();
            *(_WORD *)v51 = 0;
            OUTLINED_FUNCTION_17_0(&dword_1C3B51000, v23, (os_log_type_t)v17, "MetricStore: deferring post-enrichment.", v51);
            OUTLINED_FUNCTION_7();
          }

          (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v9);
        }
      }
      else
      {
        sub_1C3B5A604();
        OUTLINED_FUNCTION_93();
        OUTLINED_FUNCTION_33_0((uint64_t)v14, v42, v43);
        sub_1C3B62BC4();
        v44 = OUTLINED_FUNCTION_46_0();
        if (OUTLINED_FUNCTION_6_2(v44))
        {
          v45 = (_WORD *)OUTLINED_FUNCTION_8_1();
          OUTLINED_FUNCTION_55(v45);
          OUTLINED_FUNCTION_3_2(&dword_1C3B51000, v46, v47, "MetricStore: deferring after generation of missing messages.");
          OUTLINED_FUNCTION_7();
        }

        (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
      }
    }
    else
    {
      OUTLINED_FUNCTION_20();
      sub_1C3B5A604();
      OUTLINED_FUNCTION_93();
      OUTLINED_FUNCTION_33_0((uint64_t)v19, v37, v38);
      v39 = sub_1C3B62BC4();
      v40 = sub_1C3B62CB4();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)OUTLINED_FUNCTION_8_1();
        *(_WORD *)v41 = 0;
        OUTLINED_FUNCTION_17_0(&dword_1C3B51000, v39, v40, "MetricStore: deferring after grouping of messages.", v41);
        OUTLINED_FUNCTION_7();
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v19, v9);
    }
  }
  else
  {
    sub_1C3B5A604();
    OUTLINED_FUNCTION_93();
    OUTLINED_FUNCTION_33_0(v1, v31, v32);
    OUTLINED_FUNCTION_86();
    v33 = OUTLINED_FUNCTION_46_0();
    if (OUTLINED_FUNCTION_6_2(v33))
    {
      v34 = (_WORD *)OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_55(v34);
      OUTLINED_FUNCTION_3_2(&dword_1C3B51000, v35, v36, "MetricStore: deferring sending of messages fetching messages.");
      OUTLINED_FUNCTION_7();
    }

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v1, v9);
  }
  OUTLINED_FUNCTION_22_0();
}

void sub_1C3B5CC20()
{
  char *v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t (*v23)@<X0>(uint64_t *@<X8>);
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  unint64_t v45;
  int64_t v46;
  unint64_t v47;
  int64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char v56;
  void *v57;
  id v58;
  char v59;
  char v60;
  char v61;
  _QWORD *v62;
  char v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  unint64_t v72;
  char v73;
  unint64_t v74;
  char v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int64_t v93;
  _QWORD *v94;
  _QWORD v95[7];

  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_50_0();
  v90 = *(_QWORD *)(OUTLINED_FUNCTION_23_0() - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_26_0();
  v88 = v4;
  v5 = OUTLINED_FUNCTION_5_2();
  *(_BYTE *)(v5 + 16) = 0;
  v6 = OUTLINED_FUNCTION_5_2();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67D8);
  *(_QWORD *)(v6 + 16) = sub_1C3B62C0C();
  v7 = OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_32_0();
  *(_QWORD *)(v7 + 16) = sub_1C3B62C0C();
  v8 = v7 + 16;
  v9 = *(void **)&v0[OBJC_IVAR___IISMetricStore_storageLock];
  v10 = (_QWORD *)OUTLINED_FUNCTION_5_2();
  v10[2] = v0;
  v10[3] = v5;
  v10[4] = v2;
  v10[5] = v1;
  v10[6] = v6;
  v10[7] = v7;
  v11 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v11 + 16) = sub_1C3B5FA1C;
  *(_QWORD *)(v11 + 24) = v10;
  v95[4] = sub_1C3B60338;
  v95[5] = v11;
  v95[0] = MEMORY[0x1E0C809B0];
  v95[1] = 1107296256;
  v95[2] = sub_1C3B5C394;
  v95[3] = &block_descriptor_35;
  v12 = _Block_copy(v95);
  v13 = v0;
  swift_retain();
  OUTLINED_FUNCTION_122();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_runWithLockAcquired_, v12);
  _Block_release(v12);
  LOBYTE(v12) = OUTLINED_FUNCTION_68();
  v14 = swift_release();
  if ((v12 & 1) != 0)
    goto LABEL_73;
  if ((v2(v14) & 1) == 0 || (OUTLINED_FUNCTION_1_2(), *(_BYTE *)(v5 + 16) == 1))
  {
    v15 = sub_1C3B5A604();
    OUTLINED_FUNCTION_38_0(v88, v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v90 + 16));
    v16 = sub_1C3B62BC4();
    v17 = sub_1C3B62CB4();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)OUTLINED_FUNCTION_8_1();
      *(_WORD *)v18 = 0;
      OUTLINED_FUNCTION_17_0(&dword_1C3B51000, v16, v17, "MetricStore: deferring fetching of grouped messages.", v18);
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_51_0(v88, *(uint64_t (**)(uint64_t, uint64_t))(v90 + 8));
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
LABEL_7:
    OUTLINED_FUNCTION_4_1();
    return;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69E8);
  v83 = sub_1C3B62C0C();
  OUTLINED_FUNCTION_1_2();
  v80 = *(_QWORD *)(v6 + 16) + 64;
  OUTLINED_FUNCTION_40_0();
  v21 = v20 & v19;
  v81 = v22;
  swift_bridgeObjectRetain();
  v23 = 0;
  v24 = 0;
  if (!v21)
    goto LABEL_11;
  while (2)
  {
    v84 = (v21 - 1) & v21;
    v85 = v24;
    v25 = __clz(__rbit64(v21)) | (v24 << 6);
LABEL_29:
    v37 = (uint64_t *)(*(_QWORD *)(v81 + 48) + 16 * v25);
    v38 = *(_QWORD *)(*(_QWORD *)(v81 + 56) + 8 * v25);
    v87 = *v37;
    v91 = v37[1];
    v92 = v38 + 64;
    OUTLINED_FUNCTION_40_0();
    v41 = v40 & v39;
    v93 = (unint64_t)(v42 + 63) >> 6;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_40();
    v43 = 0;
    while (1)
    {
      if (v41)
      {
        OUTLINED_FUNCTION_109();
        v45 = v44 | (v43 << 6);
        goto LABEL_46;
      }
      v46 = v43 + 1;
      if (__OFADD__(v43, 1))
      {
        __break(1u);
        goto LABEL_67;
      }
      if (v46 >= v93)
        goto LABEL_10;
      v47 = *(_QWORD *)(v92 + 8 * v46);
      ++v43;
      if (!v47)
      {
        v43 = v46 + 1;
        if (v46 + 1 >= v93)
          goto LABEL_10;
        v47 = *(_QWORD *)(v92 + 8 * v43);
        if (!v47)
        {
          v43 = v46 + 2;
          if (v46 + 2 >= v93)
            goto LABEL_10;
          v47 = *(_QWORD *)(v92 + 8 * v43);
          if (!v47)
            break;
        }
      }
LABEL_45:
      v41 = (v47 - 1) & v47;
      v45 = __clz(__rbit64(v47)) + (v43 << 6);
LABEL_46:
      v49 = (uint64_t *)(*(_QWORD *)(v38 + 48) + 16 * v45);
      v50 = *v49;
      v51 = v49[1];
      v52 = *(_QWORD *)(*(_QWORD *)(v38 + 56) + 8 * v45);
      OUTLINED_FUNCTION_1_2();
      v53 = *(_QWORD *)v8;
      v54 = *(_QWORD *)(*(_QWORD *)v8 + 16);
      OUTLINED_FUNCTION_45_0();
      if (!v54)
        goto LABEL_49;
      OUTLINED_FUNCTION_45_0();
      v55 = sub_1C3B54070(v50, v51);
      if ((v56 & 1) != 0)
      {
        v57 = *(void **)(*(_QWORD *)(v53 + 56) + 8 * v55);
        swift_endAccess();
        v58 = v57;
        swift_bridgeObjectRelease_n();
        OUTLINED_FUNCTION_36();
        v86 = v58;
        sub_1C3B5FA30((uint64_t)v23);
        swift_isUniquelyReferenced_nonNull_native();
        v94 = (_QWORD *)v83;
        v89 = OUTLINED_FUNCTION_95();
        OUTLINED_FUNCTION_91();
        if (v28)
          goto LABEL_68;
        v60 = v59;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69F0);
        v61 = OUTLINED_FUNCTION_87();
        v62 = v94;
        if ((v61 & 1) != 0)
        {
          v89 = OUTLINED_FUNCTION_95();
          if ((v60 & 1) != (v63 & 1))
            goto LABEL_75;
        }
        OUTLINED_FUNCTION_6();
        if ((v60 & 1) == 0)
        {
          OUTLINED_FUNCTION_28();
          sub_1C3B5EFC0((uint64_t *)&v94);
          v64 = (uint64_t)v94;
          v62[(v89 >> 6) + 8] |= 1 << v89;
          v65 = (_QWORD *)(v62[6] + 16 * v89);
          *v65 = v87;
          v65[1] = v91;
          *(_QWORD *)(v62[7] + 8 * v89) = v64;
          v66 = v62[2];
          v28 = __OFADD__(v66, 1);
          v67 = v66 + 1;
          if (v28)
            goto LABEL_70;
          v62[2] = v67;
        }
        swift_bridgeObjectRetain();
        v68 = v62[7];
        v83 = (uint64_t)v62;
        OUTLINED_FUNCTION_19_0();
        swift_isUniquelyReferenced_nonNull_native();
        v94 = *(_QWORD **)(v68 + 8 * v89);
        v69 = (uint64_t)v94;
        v82 = v68;
        *(_QWORD *)(v68 + 8 * v89) = 0x8000000000000000;
        v70 = sub_1C3B5FA40((uint64_t)v86);
        if (__OFADD__(*(_QWORD *)(v69 + 16), (v71 & 1) == 0))
          goto LABEL_69;
        v72 = v70;
        v73 = v71;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E69F8);
        if ((sub_1C3B62D80() & 1) != 0)
        {
          v74 = sub_1C3B5FA40((uint64_t)v86);
          if ((v73 & 1) != (v75 & 1))
            goto LABEL_75;
          v72 = v74;
        }
        v76 = v94;
        if ((v73 & 1) != 0)
        {
          *(_QWORD *)(v94[7] + 8 * v72) = v52;
        }
        else
        {
          OUTLINED_FUNCTION_71((uint64_t)&v94[v72 >> 6]);
          *(_QWORD *)(v76[6] + 8 * v72) = v86;
          *(_QWORD *)(v76[7] + 8 * v72) = v52;
          v77 = v76[2];
          v28 = __OFADD__(v77, 1);
          v78 = v77 + 1;
          if (v28)
            goto LABEL_71;
          v76[2] = v78;
          v79 = v86;
        }
        *(_QWORD *)(v82 + 8 * v89) = v76;

        OUTLINED_FUNCTION_19_0();
        swift_bridgeObjectRelease();

        v23 = sub_1C3B5EFC0;
      }
      else
      {
        OUTLINED_FUNCTION_63();
LABEL_49:
        swift_endAccess();
        OUTLINED_FUNCTION_63();
      }
    }
    v48 = v46 + 3;
    if (v48 < v93)
    {
      v47 = *(_QWORD *)(v92 + 8 * v48);
      if (!v47)
      {
        while (1)
        {
          v43 = v48 + 1;
          if (__OFADD__(v48, 1))
            break;
          if (v43 >= v93)
            goto LABEL_10;
          v47 = *(_QWORD *)(v92 + 8 * v43);
          ++v48;
          if (v47)
            goto LABEL_45;
        }
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
        goto LABEL_72;
      }
      v43 = v48;
      goto LABEL_45;
    }
LABEL_10:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_67();
    v21 = v84;
    v24 = v85;
    if (v84)
      continue;
    break;
  }
LABEL_11:
  if (__OFADD__(v24, 1))
  {
LABEL_72:
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  OUTLINED_FUNCTION_76();
  if (v27 == v28)
    goto LABEL_65;
  if (*(_QWORD *)(v80 + 8 * v26))
    goto LABEL_28;
  OUTLINED_FUNCTION_35_0();
  if (v27 == v28)
    goto LABEL_65;
  OUTLINED_FUNCTION_75();
  if (v29)
    goto LABEL_28;
  OUTLINED_FUNCTION_35_0();
  if (v27 == v28)
    goto LABEL_65;
  OUTLINED_FUNCTION_75();
  if (v30)
    goto LABEL_28;
  OUTLINED_FUNCTION_76();
  if (v27 == v28)
  {
LABEL_65:
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    OUTLINED_FUNCTION_14_0();
    sub_1C3B5FA30((uint64_t)v23);
    goto LABEL_7;
  }
  if (*(_QWORD *)(v80 + 8 * v31))
  {
LABEL_28:
    OUTLINED_FUNCTION_117();
    v84 = v34;
    v85 = v35;
    v25 = v36 + (v35 << 6);
    goto LABEL_29;
  }
  while (!__OFADD__(v31, 1))
  {
    OUTLINED_FUNCTION_35_0();
    if (v27 == v28)
      goto LABEL_65;
    OUTLINED_FUNCTION_75();
    v31 = v32 + 1;
    if (v33)
      goto LABEL_28;
  }
LABEL_74:
  __break(1u);
LABEL_75:
  sub_1C3B62EA0();
  __break(1u);
}

uint64_t sub_1C3B5D4AC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  unint64_t v7;
  int64_t v8;
  char v9;
  BOOL v10;
  uint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  _OWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unsigned int v52;
  uint64_t v53;
  uint64_t result;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  _OWORD v64[2];
  __int128 v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[6];

  sub_1C3B58564(a1, v68);
  v55 = v68[1];
  v1 = v68[3];
  v2 = v68[4];
  v56 = (unint64_t)(v68[2] + 64) >> 6;
  v57 = v68[0];
  OUTLINED_FUNCTION_40();
  v3 = MEMORY[0x1E0DEE9E0];
  if (!v2)
    goto LABEL_3;
LABEL_2:
  OUTLINED_FUNCTION_109();
  v5 = v4 | (v1 << 6);
  while (1)
  {
    v13 = (uint64_t *)(*(_QWORD *)(v57 + 48) + 16 * v5);
    v14 = v13[1];
    v61 = *v13;
    v15 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v5);
    v16 = *(_QWORD *)(v15 + 16);
    if (v16)
      break;
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_104();
    v38 = MEMORY[0x1E0DEE9D8];
LABEL_49:
    swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v65 = v3;
    v39 = sub_1C3B54070(v61, v14);
    if (__OFADD__(*(_QWORD *)(v3 + 16), (v40 & 1) == 0))
      goto LABEL_78;
    v41 = v39;
    v42 = v40;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A00);
    if ((sub_1C3B62D80() & 1) != 0)
    {
      v43 = sub_1C3B54070(v61, v14);
      if ((v42 & 1) != (v44 & 1))
        goto LABEL_81;
      v41 = v43;
    }
    v45 = v65;
    if ((v42 & 1) != 0)
    {
      v46 = *(_QWORD *)(v65 + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v46 + 8 * v41) = v38;
    }
    else
    {
      OUTLINED_FUNCTION_120(v65 + 8 * (v41 >> 6));
      v48 = (uint64_t *)(v47 + 16 * v41);
      *v48 = v61;
      v48[1] = v14;
      *(_QWORD *)(*(_QWORD *)(v45 + 56) + 8 * v41) = v38;
      v49 = *(_QWORD *)(v45 + 16);
      v10 = __OFADD__(v49, 1);
      v50 = v49 + 1;
      if (v10)
        goto LABEL_79;
      *(_QWORD *)(v45 + 16) = v50;
      OUTLINED_FUNCTION_104();
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_23();
    v3 = v45;
    if (v2)
      goto LABEL_2;
LABEL_3:
    v6 = v1 + 1;
    if (__OFADD__(v1, 1))
      goto LABEL_80;
    if (v6 >= v56)
      goto LABEL_69;
    v7 = *(_QWORD *)(v55 + 8 * v6);
    v8 = v1 + 1;
    if (!v7)
    {
      OUTLINED_FUNCTION_103();
      if (v9 == v10)
        goto LABEL_69;
      OUTLINED_FUNCTION_102();
      if (!v7)
      {
        OUTLINED_FUNCTION_103();
        if (v9 == v10)
          goto LABEL_69;
        OUTLINED_FUNCTION_102();
        if (!v7)
        {
          OUTLINED_FUNCTION_103();
          if (v9 == v10)
            goto LABEL_69;
          OUTLINED_FUNCTION_102();
          if (!v7)
          {
            OUTLINED_FUNCTION_103();
            if (v9 == v10)
              goto LABEL_69;
            OUTLINED_FUNCTION_102();
            if (!v7)
            {
              v8 = v11 + 5;
              if (v11 + 5 >= v56)
                goto LABEL_69;
              v7 = *(_QWORD *)(v55 + 8 * v8);
              if (!v7)
              {
                v12 = v1 + 7;
                while (v12 < v56)
                {
                  v7 = *(_QWORD *)(v55 + 8 * v12++);
                  if (v7)
                  {
                    v8 = v12 - 1;
                    goto LABEL_24;
                  }
                }
LABEL_69:
                swift_release();
                return v3;
              }
            }
          }
        }
      }
    }
LABEL_24:
    v2 = (v7 - 1) & v7;
    v5 = __clz(__rbit64(v7)) + (v8 << 6);
    v1 = v8;
  }
  v67 = MEMORY[0x1E0DEE9D8];
  OUTLINED_FUNCTION_52_0();
  v60 = v14;
  OUTLINED_FUNCTION_104();
  sub_1C3B62D50();
  v18 = v15 + 64;
  v17 = *(_QWORD *)(v15 + 64);
  v58 = v2;
  if (v17)
  {
    v19 = 0;
LABEL_28:
    v20 = __clz(__rbit64(v17)) + (v19 << 6);
    goto LABEL_29;
  }
  v51 = *(unsigned __int8 *)(v15 + 32);
  v52 = v51 & 0x3F;
  v20 = 1 << v51;
  if (v52 >= 7)
  {
    v17 = *(_QWORD *)(v15 + 72);
    if (v17)
    {
      v19 = 1;
      goto LABEL_28;
    }
    if (v52 >= 8)
    {
      v17 = *(_QWORD *)(v15 + 80);
      if (!v17)
      {
        v53 = 11;
        while (v53 - 8 < (unint64_t)(v20 + 63) >> 6)
        {
          v17 = *(_QWORD *)(v15 + 8 * v53++);
          if (v17)
          {
            v19 = v53 - 9;
            goto LABEL_28;
          }
        }
        goto LABEL_29;
      }
      v19 = 2;
      goto LABEL_28;
    }
  }
LABEL_29:
  v59 = v15 + 64;
  while (v16)
  {
    if (v20 < 0 || v20 >= 1 << *(_BYTE *)(v15 + 32))
      goto LABEL_71;
    if ((*(_QWORD *)(v18 + 8 * ((unint64_t)v20 >> 6)) & (1 << v20)) == 0)
      goto LABEL_72;
    v62 = v16;
    v63 = *(_DWORD *)(v15 + 36);
    v21 = v15;
    v22 = *(char **)(*(_QWORD *)(v15 + 48) + 8 * v20);
    v23 = *(_QWORD *)&v22[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents];
    v24 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v20);
    v66 = MEMORY[0x1E0DEBB98];
    *(_QWORD *)&v65 = v24;
    sub_1C3B54BAC(&v65, v64);
    v25 = v22;
    OUTLINED_FUNCTION_28();
    swift_isUniquelyReferenced_nonNull_native();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_90();
    if (v10)
      goto LABEL_73;
    v28 = v26;
    v29 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67C0);
    if ((sub_1C3B62D80() & 1) != 0)
    {
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_57();
      if (!v31)
        goto LABEL_81;
      v28 = v30;
    }
    if ((v29 & 1) != 0)
    {
      v32 = (_OWORD *)(*(_QWORD *)(v23 + 56) + 32 * v28);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v32);
      sub_1C3B54BAC(v64, v32);
    }
    else
    {
      OUTLINED_FUNCTION_120(v23 + 8 * (v28 >> 6));
      v34 = (_QWORD *)(v33 + 16 * v28);
      *v34 = 0x756F43746E657665;
      v34[1] = 0xEA0000000000746ELL;
      sub_1C3B54BAC(v64, (_OWORD *)(*(_QWORD *)(v23 + 56) + 32 * v28));
      v35 = *(_QWORD *)(v23 + 16);
      v10 = __OFADD__(v35, 1);
      v36 = v35 + 1;
      if (v10)
        goto LABEL_77;
      *(_QWORD *)(v23 + 16) = v36;
    }
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_32_0();
    v37 = v25[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend];
    OUTLINED_FUNCTION_52_0();
    sub_1C3B56924(v23, v61, v60, v37);

    sub_1C3B62D38();
    sub_1C3B62D5C();
    sub_1C3B62D68();
    sub_1C3B62D44();
    if (v20 >= -(-1 << *(_BYTE *)(v21 + 32)))
      goto LABEL_74;
    v18 = v59;
    if ((*(_QWORD *)(v59 + 8 * ((unint64_t)v20 >> 6)) & (1 << v20)) == 0)
      goto LABEL_75;
    v15 = v21;
    if (v63 != *(_DWORD *)(v21 + 36))
      goto LABEL_76;
    v20 = sub_1C3B62CF0();
    v16 = v62 - 1;
    if (v62 == 1)
    {
      v38 = v67;
      v2 = v58;
      v14 = v60;
      goto LABEL_49;
    }
  }
  __break(1u);
LABEL_71:
  __break(1u);
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
LABEL_74:
  __break(1u);
LABEL_75:
  __break(1u);
LABEL_76:
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  result = sub_1C3B62EA0();
  __break(1u);
  return result;
}

uint64_t sub_1C3B5DA5C(_QWORD *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  _QWORD *v30;
  uint64_t v31;

  v4 = *(_QWORD **)(v2 + OBJC_IVAR___IISMetricStore_configuration);
  if (v4)
    v5 = v4;
  else
    v5 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v6 = v5[2];
  if (!v6)
  {
    OUTLINED_FUNCTION_45_0();
    OUTLINED_FUNCTION_28();
LABEL_24:
    OUTLINED_FUNCTION_23();
    return (uint64_t)a1;
  }
  v9 = v5[4];
  v8 = v5[5];
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_28();
  v10 = OUTLINED_FUNCTION_27_0();
  if ((a2(v10) & 1) == 0)
  {
LABEL_22:
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_5();
    return 0;
  }
  v11 = 0;
  v12 = v5 + 7;
  v30 = v5;
  while (1)
  {
    if (a1[2] && (OUTLINED_FUNCTION_27_0(), OUTLINED_FUNCTION_54(), v14 = v13, OUTLINED_FUNCTION_5(), (v14 & 1) != 0))
    {
      OUTLINED_FUNCTION_5();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17F8);
      v15 = OUTLINED_FUNCTION_5_2();
      *(_OWORD *)(v15 + 16) = xmmword_1C3B63F00;
      OUTLINED_FUNCTION_32_0();
      v16 = sub_1C3B62C0C();
      OUTLINED_FUNCTION_27_0();
      *(_QWORD *)(v15 + 32) = sub_1C3B56924(v16, v9, v8, 0);
      sub_1C3B62C84();
      v31 = v15;
      swift_isUniquelyReferenced_nonNull_native();
      v17 = OUTLINED_FUNCTION_54();
      if (__OFADD__(a1[2], (v18 & 1) == 0))
        goto LABEL_27;
      v19 = v17;
      v20 = v18;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A00);
      if ((sub_1C3B62D80() & 1) != 0)
      {
        v21 = sub_1C3B54070(v9, v8);
        if ((v20 & 1) != (v22 & 1))
          goto LABEL_29;
        v19 = v21;
      }
      if ((v20 & 1) != 0)
      {
        v23 = a1[7];
        swift_bridgeObjectRelease();
        *(_QWORD *)(v23 + 8 * v19) = v31;
      }
      else
      {
        OUTLINED_FUNCTION_71((uint64_t)&a1[v19 >> 6]);
        v24 = (uint64_t *)(a1[6] + 16 * v19);
        *v24 = v9;
        v24[1] = v8;
        *(_QWORD *)(a1[7] + 8 * v19) = v31;
        v25 = a1[2];
        v26 = __OFADD__(v25, 1);
        v27 = v25 + 1;
        if (v26)
          goto LABEL_28;
        a1[2] = v27;
        OUTLINED_FUNCTION_27_0();
      }
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_6();
      v5 = v30;
    }
    if (v6 - 1 == v11)
      goto LABEL_24;
    if ((unint64_t)++v11 >= v5[2])
      break;
    v9 = *(v12 - 1);
    v8 = *v12;
    v28 = OUTLINED_FUNCTION_27_0();
    v12 += 2;
    if ((a2(v28) & 1) == 0)
      goto LABEL_22;
  }
  __break(1u);
LABEL_27:
  __break(1u);
LABEL_28:
  __break(1u);
LABEL_29:
  result = sub_1C3B62EA0();
  __break(1u);
  return result;
}

void sub_1C3B5DD28()
{
  uint64_t v0;
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
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t i;
  uint64_t v16;
  char v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE *v37;
  _BYTE *v38;
  void *v39;
  uint64_t *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  _QWORD *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t (*v59)(_QWORD, uint64_t, _QWORD);
  os_log_type_t v60;
  _WORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (*v65)(_QWORD, uint64_t, _QWORD);
  os_log_type_t v66;
  _WORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  id v96;
  uint64_t v97;

  OUTLINED_FUNCTION_12_0();
  v89 = v1;
  v90 = v2;
  v4 = v3;
  v72 = OUTLINED_FUNCTION_23_0();
  v74 = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_98();
  v73 = v6;
  MEMORY[0x1E0C80A78](v7);
  v71 = (char *)&v70 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A08);
  v81 = sub_1C3B62C0C();
  v9 = *(_QWORD *)(v4 + 64);
  v75 = v4 + 64;
  v10 = 1 << *(_BYTE *)(v4 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v9;
  v13 = (uint64_t *)(v0 + OBJC_IVAR___IISMetricStore_enrichmentProviders);
  v80 = v4;
  OUTLINED_FUNCTION_121();
  v77 = v13;
  OUTLINED_FUNCTION_1_2();
  v14 = 0;
  v76 = (unint64_t)(v10 + 63) >> 6;
  v92 = MEMORY[0x1E0DEE9B8] + 8;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v78 = (v12 - 1) & v12;
  v79 = v14;
  for (i = __clz(__rbit64(v12)) | (v14 << 6); ; i = v26 + (v25 << 6))
  {
    v27 = *(_QWORD *)(v80 + 56);
    v28 = (uint64_t *)(*(_QWORD *)(v80 + 48) + 16 * i);
    v29 = v28[1];
    v82 = *v28;
    v83 = v29;
    v30 = *(_QWORD *)(v27 + 8 * i);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_36();
    if ((OUTLINED_FUNCTION_88() & 1) == 0)
    {
      OUTLINED_FUNCTION_20();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_1C3B5A604();
      OUTLINED_FUNCTION_92();
      OUTLINED_FUNCTION_29_0(v64, v65);
      sub_1C3B62BC4();
      v66 = OUTLINED_FUNCTION_46_0();
      if (OUTLINED_FUNCTION_6_2(v66))
      {
        v67 = (_WORD *)OUTLINED_FUNCTION_8_1();
        OUTLINED_FUNCTION_55(v67);
        OUTLINED_FUNCTION_3_2(&dword_1C3B51000, v68, v69, "MetricStore: deferring enrichment of messages.");
        OUTLINED_FUNCTION_7();
      }

      (*(void (**)(char *, uint64_t))(v74 + 8))(v71, v30);
      goto LABEL_72;
    }
    v31 = *v77;
    if ((unint64_t)*v77 >> 62)
      break;
    v32 = *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_121();
    if (v32)
      goto LABEL_26;
LABEL_57:
    OUTLINED_FUNCTION_4_0();
    v46 = v81;
    swift_isUniquelyReferenced_nonNull_native();
    v97 = v46;
    sub_1C3B54070(v82, v83);
    OUTLINED_FUNCTION_90();
    if (v18)
      goto LABEL_79;
    v10 = v47;
    v49 = v48;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A00);
    if ((sub_1C3B62D80() & 1) != 0)
    {
      sub_1C3B54070(v82, v83);
      OUTLINED_FUNCTION_57();
      if (!v51)
        goto LABEL_84;
      v10 = v50;
    }
    v81 = v97;
    if ((v49 & 1) != 0)
    {
      v52 = *(_QWORD *)(v97 + 56);
      swift_bridgeObjectRelease();
      *(_QWORD *)(v52 + 8 * v10) = v30;
    }
    else
    {
      OUTLINED_FUNCTION_71(v97 + 8 * ((unint64_t)v10 >> 6));
      v54 = (_QWORD *)(v53[6] + 16 * v10);
      v55 = v83;
      *v54 = v82;
      v54[1] = v55;
      *(_QWORD *)(v53[7] + 8 * v10) = v30;
      v56 = v53[2];
      v18 = __OFADD__(v56, 1);
      v57 = v56 + 1;
      if (v18)
        goto LABEL_82;
      v53[2] = v57;
      swift_bridgeObjectRetain();
    }
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6();
    v14 = v79;
    v12 = v78;
    if (v78)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v14, 1))
      goto LABEL_81;
    OUTLINED_FUNCTION_76();
    if (v17 == v18)
      goto LABEL_72;
    if (!*(_QWORD *)(v75 + 8 * v16))
    {
      OUTLINED_FUNCTION_35_0();
      if (v17 == v18)
        goto LABEL_72;
      OUTLINED_FUNCTION_59();
      if (!v19)
      {
        OUTLINED_FUNCTION_35_0();
        if (v17 == v18)
          goto LABEL_72;
        OUTLINED_FUNCTION_59();
        if (!v20)
        {
          OUTLINED_FUNCTION_76();
          if (v17 == v18)
            goto LABEL_72;
          if (!*(_QWORD *)(v75 + 8 * v21))
          {
            while (!__OFADD__(v21, 1))
            {
              OUTLINED_FUNCTION_35_0();
              if (v17 == v18)
                goto LABEL_72;
              OUTLINED_FUNCTION_59();
              v21 = v22 + 1;
              if (v23)
                goto LABEL_22;
            }
            goto LABEL_83;
          }
        }
      }
    }
LABEL_22:
    OUTLINED_FUNCTION_117();
    v78 = v24;
    v79 = v25;
  }
  if (v31 < 0)
    v10 = *v77;
  else
    v10 = v31 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain_n();
  v32 = sub_1C3B62DB0();
  OUTLINED_FUNCTION_4_0();
  if (!v32)
    goto LABEL_57;
LABEL_26:
  v88 = v31 & 0xC000000000000001;
  if ((v31 & 0xC000000000000001) != 0)
  {
    v96 = (id)MEMORY[0x1C3BD713C](0, v31);
  }
  else
  {
    if (!*(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_80;
    v96 = *(id *)(v31 + 32);
    swift_unknownObjectRetain();
  }
  if ((OUTLINED_FUNCTION_88() & 1) == 0)
  {
LABEL_69:
    OUTLINED_FUNCTION_4_0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_20();
    sub_1C3B5A604();
    OUTLINED_FUNCTION_92();
    OUTLINED_FUNCTION_29_0(v58, v59);
    sub_1C3B62BC4();
    v60 = OUTLINED_FUNCTION_46_0();
    if (OUTLINED_FUNCTION_6_2(v60))
    {
      v61 = (_WORD *)OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_55(v61);
      OUTLINED_FUNCTION_3_2(&dword_1C3B51000, v62, v63, "MetricStore: deferring enrichment of messages.");
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_79();
    (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v73, v30);
LABEL_72:
    swift_release();
    OUTLINED_FUNCTION_4_1();
    return;
  }
  v84 = v31 + 32;
  v85 = v31 & 0xFFFFFFFFFFFFFF8;
  v33 = 1;
  v86 = v32;
  v87 = v31;
  while (1)
  {
    if ((unint64_t)v30 >> 62)
    {
      if (v30 < 0)
        v10 = v30;
      else
        v10 = v30 & 0xFFFFFFFFFFFFFF8;
      OUTLINED_FUNCTION_36();
      v34 = sub_1C3B62DB0();
      OUTLINED_FUNCTION_20();
      if (!v34)
      {
LABEL_44:
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_79();
        v30 = MEMORY[0x1E0DEE9D8];
        goto LABEL_45;
      }
    }
    else
    {
      v34 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v34)
        goto LABEL_44;
    }
    v97 = MEMORY[0x1E0DEE9D8];
    sub_1C3B62D50();
    if (v34 < 0)
      goto LABEL_77;
    v91 = v33;
    v35 = OUTLINED_FUNCTION_32_0();
    v36 = 0;
    v93 = v30 & 0xC000000000000001;
    v94 = v35;
    v95 = v30;
    do
    {
      if (v93)
        v37 = (_BYTE *)MEMORY[0x1C3BD713C](v36, v30);
      else
        v37 = *(id *)(v30 + 8 * v36 + 32);
      v38 = v37;
      ++v36;
      v39 = (void *)sub_1C3B62BE8();
      v40 = (uint64_t *)&v38[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
      v41 = (void *)sub_1C3B62C30();
      v42 = objc_msgSend(v96, sel_enrichMessage_messageName_, v39, v41);

      v43 = sub_1C3B62BF4();
      v44 = *v40;
      v45 = v40[1];
      LOBYTE(v40) = v38[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend];
      swift_bridgeObjectRetain();
      sub_1C3B56924(v43, v44, v45, (char)v40);

      sub_1C3B62D38();
      sub_1C3B62D5C();
      sub_1C3B62D68();
      sub_1C3B62D44();
      v30 = v95;
    }
    while (v34 != v36);
    v10 = v97;
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_79();
    v30 = v10;
    v32 = v86;
    v31 = v87;
    v33 = v91;
LABEL_45:
    if (v33 == v32)
      goto LABEL_57;
    if (v88)
    {
      v96 = (id)MEMORY[0x1C3BD713C](v33, v31);
    }
    else
    {
      if (v33 >= *(_QWORD *)(v85 + 16))
        goto LABEL_78;
      v96 = *(id *)(v84 + 8 * v33);
      swift_unknownObjectRetain();
    }
    v18 = __OFADD__(v33++, 1);
    if (v18)
      break;
    if ((OUTLINED_FUNCTION_88() & 1) == 0)
      goto LABEL_69;
  }
  __break(1u);
LABEL_77:
  __break(1u);
LABEL_78:
  __break(1u);
LABEL_79:
  __break(1u);
LABEL_80:
  __break(1u);
LABEL_81:
  __break(1u);
LABEL_82:
  __break(1u);
LABEL_83:
  __break(1u);
LABEL_84:
  sub_1C3B62EA0();
  __break(1u);
}

uint64_t sub_1C3B5E468(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  _QWORD aBlock[6];

  v3 = OUTLINED_FUNCTION_7_1();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x1E0C80A78](v3);
  v6 = *(void **)(v1 + OBJC_IVAR___IISMetricStore_storageLock);
  OUTLINED_FUNCTION_38_0((uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  v7 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v8 = swift_allocObject();
  OUTLINED_FUNCTION_38_0(v8 + v7, (uint64_t)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
  v9 = OUTLINED_FUNCTION_5_2();
  *(_QWORD *)(v9 + 16) = sub_1C3B5FDAC;
  *(_QWORD *)(v9 + 24) = v8;
  aBlock[4] = sub_1C3B60338;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1C3B5C394;
  aBlock[3] = &block_descriptor_46;
  v10 = _Block_copy(aBlock);
  OUTLINED_FUNCTION_122();
  swift_release();
  objc_msgSend(v6, sel_runWithLockAcquired_, v10);
  _Block_release(v10);
  LOBYTE(v6) = OUTLINED_FUNCTION_68();
  OUTLINED_FUNCTION_67();
  result = OUTLINED_FUNCTION_73();
  if ((v6 & 1) != 0)
    __break(1u);
  return result;
}

Swift::Bool __swiftcall MetricStore.shouldSendMessages()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  Swift::Bool result;
  uint64_t v10;

  v2 = OUTLINED_FUNCTION_7_1();
  v3 = (void (*)(uint64_t))MEMORY[0x1E0CB0870];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_43_0();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v10 - v6;
  sub_1C3B62AF8();
  v8 = v0 + OBJC_IVAR___IISMetricStore_windowStartDate;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_81(v1, v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  sub_1C3B601A8(&qword_1ED7E17B0, v3);
  sub_1C3B62C18();
  OUTLINED_FUNCTION_41_0(v1);
  OUTLINED_FUNCTION_41_0((uint64_t)v7);
  OUTLINED_FUNCTION_21_0();
  return result;
}

uint64_t sub_1C3B5E774()
{
  uint64_t v0;
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
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  OUTLINED_FUNCTION_56();
  v38 = v4;
  v39 = v5;
  v34 = v6;
  v35 = v7;
  v32 = v8;
  v33 = v9;
  v37 = v10;
  v12 = v11;
  v14 = v13;
  v15 = OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_53();
  MEMORY[0x1E0C80A78](v16);
  OUTLINED_FUNCTION_61();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17D0);
  OUTLINED_FUNCTION_58();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_60();
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A20);
  v36 = *(_QWORD *)(v19 - 8);
  OUTLINED_FUNCTION_15_0();
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v14 + OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricStorage_stream, v17);
  v23 = &v12[OBJC_IVAR___IISMetricStore_windowStartDate];
  OUTLINED_FUNCTION_1_2();
  (*(void (**)(uint64_t, char *, uint64_t))(v0 + 16))(v1, v23, v15);
  sub_1C3B62AD4();
  (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v15);
  sub_1C3B6022C(&qword_1ED7E17F0, &qword_1ED7E17D0);
  sub_1C3B62BAC();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v17);
  v24 = (_QWORD *)OUTLINED_FUNCTION_5_2();
  v25 = v32;
  v26 = v33;
  v24[2] = v12;
  v24[3] = v25;
  v28 = v34;
  v27 = v35;
  v24[4] = v26;
  v24[5] = v28;
  v24[6] = v27;
  sub_1C3B6022C(&qword_1EF8E6A28, &qword_1EF8E6A20);
  swift_retain();
  v29 = v12;
  swift_retain();
  swift_retain();
  swift_retain();

  OUTLINED_FUNCTION_67();
  OUTLINED_FUNCTION_73();
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v22, v19);
}

void sub_1C3B5E9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _BYTE *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  _DWORD *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v19[7];
  uint64_t v20;

  OUTLINED_FUNCTION_12_0();
  v2 = v1;
  v4 = v3;
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_72();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v4, sel_state) == (id)1)
  {
    v8 = (_BYTE *)(v2 + 16);
    v9 = sub_1C3B5A604();
    OUTLINED_FUNCTION_81((uint64_t)v7, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 16));
    v10 = v4;
    v11 = OUTLINED_FUNCTION_86();
    v12 = sub_1C3B62CA8();
    if (os_log_type_enabled(v11, v12))
    {
      v19[1] = v8;
      v13 = (_DWORD *)OUTLINED_FUNCTION_9_0();
      v19[0] = OUTLINED_FUNCTION_9_0();
      v20 = v19[0];
      *v13 = 136315138;
      v14 = objc_msgSend(v10, sel_error, v19[0]);
      if (v14)
      {
        v15 = v14;
        swift_getErrorValue();
        v16 = sub_1C3B62EAC();
        v18 = v17;

      }
      else
      {
        v16 = 0;
        v18 = 0xE000000000000000;
      }
      v19[6] = sub_1C3B53908(v16, v18, &v20);
      sub_1C3B62CD8();

      OUTLINED_FUNCTION_19_0();
      OUTLINED_FUNCTION_82(&dword_1C3B51000, v11, v12, "MetricStore: failed to completely read Biome stream: %s");
      OUTLINED_FUNCTION_108();
      OUTLINED_FUNCTION_7();
    }

    OUTLINED_FUNCTION_21();
    OUTLINED_FUNCTION_1_2();
    *v8 = 1;
  }
  OUTLINED_FUNCTION_4_1();
}

void sub_1C3B5EB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  char *v23;
  void *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  char v34;
  unint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  char v47;
  unint64_t v48;
  char v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  os_log_type_t v64;
  _WORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void (*v73)(uint64_t);
  uint64_t v74;

  OUTLINED_FUNCTION_56();
  v71 = v3;
  v72 = v2;
  v5 = v4;
  v73 = v6;
  v8 = v7;
  v10 = v9;
  v11 = OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_72();
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v69 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = OUTLINED_FUNCTION_7_1();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_61();
  objc_msgSend(v10, sel_timestamp);
  v18 = v17;
  v19 = v8 + OBJC_IVAR___IISMetricStore_windowStartDate;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_38_0(v0, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v16 + 16));
  sub_1C3B62AD4();
  v21 = v20;
  v22 = OUTLINED_FUNCTION_51_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
  if (v21 + *(double *)(v8 + OBJC_IVAR___IISMetricStore_sendInterval) < v18)
    goto LABEL_21;
  v23 = (char *)OUTLINED_FUNCTION_100(v22, sel_eventBody);
  if (!v23)
  {
    v62 = sub_1C3B5A604();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v14, v62, v11);
    v63 = (void *)sub_1C3B62BC4();
    v64 = sub_1C3B62CA8();
    if (OUTLINED_FUNCTION_6_2(v64))
    {
      v65 = (_WORD *)OUTLINED_FUNCTION_8_1();
      OUTLINED_FUNCTION_55(v65);
      OUTLINED_FUNCTION_3_2(&dword_1C3B51000, v66, v67, "MetricStore: failed to fetch event body from event.");
      OUTLINED_FUNCTION_7();
    }

    v68 = OUTLINED_FUNCTION_39_0(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    v73(v68);
    goto LABEL_21;
  }
  v24 = v23;
  v25 = (uint64_t *)(v5 + 16);
  v27 = *(_QWORD *)&v23[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier];
  v26 = *(_QWORD *)&v23[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageIdentifier + 8];
  v28 = OUTLINED_FUNCTION_27_0();
  v29 = OUTLINED_FUNCTION_100(v28, sel_description);
  v70 = sub_1C3B62C3C();
  v31 = v30;

  OUTLINED_FUNCTION_1_2();
  swift_isUniquelyReferenced_nonNull_native();
  v74 = *v25;
  *v25 = 0x8000000000000000;
  OUTLINED_FUNCTION_97();
  OUTLINED_FUNCTION_91();
  if (v34)
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v35 = v32;
  v36 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A30);
  v37 = OUTLINED_FUNCTION_87();
  v38 = v74;
  if ((v37 & 1) != 0)
  {
    OUTLINED_FUNCTION_97();
    OUTLINED_FUNCTION_57();
    if (!v40)
      goto LABEL_25;
    v35 = v39;
  }
  *v25 = v38;
  swift_bridgeObjectRelease();
  v41 = (_QWORD *)*v25;
  if ((v36 & 1) == 0)
  {
    OUTLINED_FUNCTION_40();
    sub_1C3B5EF7C(&v74);
    sub_1C3B5FB78(v35, v27, v26, v74, v41);
  }
  swift_bridgeObjectRetain();
  v42 = v41[7];
  OUTLINED_FUNCTION_3();
  swift_isUniquelyReferenced_nonNull_native();
  v74 = *(_QWORD *)(v42 + 8 * v35);
  v43 = v74;
  *(_QWORD *)(v42 + 8 * v35) = 0x8000000000000000;
  v44 = OUTLINED_FUNCTION_99();
  if (__OFADD__(*(_QWORD *)(v43 + 16), (v45 & 1) == 0))
    goto LABEL_23;
  v46 = v44;
  v47 = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E67E8);
  if ((sub_1C3B62D80() & 1) == 0)
    goto LABEL_14;
  v48 = OUTLINED_FUNCTION_99();
  if ((v47 & 1) == (v49 & 1))
  {
    v46 = v48;
LABEL_14:
    *(_QWORD *)(v42 + 8 * v35) = v74;
    swift_bridgeObjectRelease();
    v50 = *(_QWORD **)(v42 + 8 * v35);
    OUTLINED_FUNCTION_121();
    if ((v47 & 1) == 0)
    {
      sub_1C3B5FB78(v46, v70, v31, 0, v50);
      OUTLINED_FUNCTION_52_0();
    }
    v51 = v50[7];
    v52 = *(_QWORD *)(v51 + 8 * v46);
    v53 = __CFADD__(v52, 1);
    v54 = v52 + 1;
    if (!v53)
    {
      *(_QWORD *)(v51 + 8 * v46) = v54;
      swift_endAccess();
      OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_23();
      v55 = OUTLINED_FUNCTION_4_0();
      v56 = OUTLINED_FUNCTION_100(v55, sel_description);
      v57 = sub_1C3B62C3C();
      v59 = v58;

      OUTLINED_FUNCTION_1_2();
      v60 = v24;
      sub_1C3B5FBC0((uint64_t)v60, v57, v59);
      swift_endAccess();
      v61 = OUTLINED_FUNCTION_20();
      v73(v61);

LABEL_21:
      OUTLINED_FUNCTION_22_0();
      return;
    }
    goto LABEL_24;
  }
LABEL_25:
  sub_1C3B62EA0();
  __break(1u);
}

uint64_t sub_1C3B5EF7C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1C3B62C0C();
  *a1 = result;
  return result;
}

uint64_t sub_1C3B5EFC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MetricMessage();
  sub_1C3B601A8(&qword_1EF8E6A18, (void (*)(uint64_t))type metadata accessor for MetricMessage);
  result = sub_1C3B62C0C();
  *a1 = result;
  return result;
}

uint64_t sub_1C3B5F024(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *__return_ptr, _QWORD *, unint64_t *);
  unint64_t v19;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  _QWORD v28[2];

  OUTLINED_FUNCTION_50_0();
  if (v8 >> 62)
    goto LABEL_18;
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_40();
  for (; v9; v9 = sub_1C3B62DB0())
  {
    v10 = a4 + OBJC_IVAR___IISMetricStore_messageListeners;
    a4 = a3 & 0xC000000000000001;
    v24 = v10;
    OUTLINED_FUNCTION_1_2();
    v11 = 0;
    v25 = a3 + 32;
    v22 = v9;
    v23 = a3;
    v21 = a3 & 0xC000000000000001;
    while (1)
    {
      v12 = a4 ? (char *)MEMORY[0x1C3BD713C](v11, a3) : (char *)*(id *)(v25 + 8 * v11);
      v13 = v12;
      if (__OFADD__(v11++, 1))
        break;
      if (v12[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_backend])
      {

      }
      else
      {
        v15 = sub_1C3B59C48(v5, v4, *(_QWORD *)&v12[OBJC_IVAR____TtC24PersonalIntelligenceCore13MetricMessage_messageContents]);
        v16 = *(_QWORD *)(*(_QWORD *)v24 + 16);
        if (v16)
        {
          v17 = swift_bridgeObjectRetain() + 40;
          do
          {
            v18 = *(void (**)(char *__return_ptr, _QWORD *, unint64_t *))(v17 - 8);
            swift_retain();
            v19 = sub_1C3B5C020(v15);
            v28[0] = v5;
            v28[1] = v4;
            v27 = v19;
            v18(&v26, v28, &v27);
            OUTLINED_FUNCTION_44();
            OUTLINED_FUNCTION_5();
            v17 += 16;
            --v16;
          }
          while (v16);

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v9 = v22;
          a3 = v23;
          a4 = v21;
        }
        else
        {

          swift_bridgeObjectRelease();
        }
      }
      if (v11 == v9)
        return OUTLINED_FUNCTION_3();
    }
    __break(1u);
LABEL_18:
    OUTLINED_FUNCTION_40();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C3B5F20C(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];

  sub_1C3B58564(a1, v19);
  v3 = v19[0];
  v4 = v19[1];
  v5 = v19[3];
  v6 = v19[4];
  v7 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_3;
LABEL_2:
  v9 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v10 = v9 | (v5 << 6);
  while (1)
  {
    v15 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v16 = *v15;
    v17 = v15[1];
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 8 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v16, v17, v18);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v6)
      goto LABEL_2;
LABEL_3:
    v11 = v5 + 1;
    if (__OFADD__(v5, 1))
      break;
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v4 + 8 * v11);
    v13 = v5 + 1;
    if (!v12)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v4 + 8 * v13);
      if (!v12)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v4 + 8 * v13);
        if (!v12)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v4 + 8 * v13);
          if (!v12)
          {
            v13 = v5 + 5;
            if (v5 + 5 >= v7)
              return swift_release();
            v12 = *(_QWORD *)(v4 + 8 * v13);
            if (!v12)
            {
              v14 = v5 + 6;
              while (v14 < v7)
              {
                v12 = *(_QWORD *)(v4 + 8 * v14++);
                if (v12)
                {
                  v13 = v14 - 1;
                  goto LABEL_18;
                }
              }
              return swift_release();
            }
          }
        }
      }
    }
LABEL_18:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v5 = v13;
  }
  __break(1u);
  return result;
}

void sub_1C3B5F38C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v4 = OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_58();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_60();
  if (a1)
  {
    v6 = a1;
    objc_msgSend(v6, sel_timestamp);
    sub_1C3B62AC8();
    sub_1C3B62AEC();

    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  }
  OUTLINED_FUNCTION_21_0();
}

id MetricStore.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_78();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_1C3B5F4CC()
{
  uint64_t *v0;
  uint64_t v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1C3B5F57C(result, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = (uint64_t)result;
  }
  return result;
}

uint64_t sub_1C3B5F514(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_1C3B62C90();
  return result;
}

char *sub_1C3B5F540(char *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_1C3B5F57C((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = (uint64_t)result;
  }
  return result;
}

char *sub_1C3B5F57C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A40);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1C3B5F77C((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C3B5F668(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_1C3B5F668(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A48);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1C3B62DE0();
  __break(1u);
  return result;
}

char *sub_1C3B5F77C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1C3B62DE0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1C3B5F800()
{
  OUTLINED_FUNCTION_89();
  OUTLINED_FUNCTION_48_0();
  return swift_deallocObject();
}

void sub_1C3B5F818()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17D0);
  sub_1C3B6022C(&qword_1ED7E17F0, &qword_1ED7E17D0);
  v2 = (id)sub_1C3B62BA0();
  objc_msgSend(v2, sel_sendEvent_, v1);

}

void sub_1C3B5F8A4()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_10();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1C3B5F8D8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1C3B5F8FC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17D0);
  sub_1C3B62B7C();
  OUTLINED_FUNCTION_13_0();
}

uint64_t sub_1C3B5F94C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_1C3B5F970(_QWORD *a1@<X0>, _QWORD *a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;

  *a3 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, a1[1], *a2) & 1;
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1C3B5F9A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1C3B5F024(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1C3B5F9B0()
{
  return swift_deallocObject();
}

uint64_t sub_1C3B5F9C0()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_48_0();
  return swift_deallocObject();
}

uint64_t sub_1C3B5F9DC()
{
  OUTLINED_FUNCTION_89();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1C3B5FA1C()
{
  return sub_1C3B5E774();
}

uint64_t sub_1C3B5FA30(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_1C3B5FA40(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1C3B62CC0();
  return sub_1C3B5FA70(a1, v2);
}

unint64_t sub_1C3B5FA70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for MetricMessage();
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_1C3B62CCC();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_1C3B62CCC();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_1C3B5FB78(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

uint64_t sub_1C3B5FBC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1C3B5FC3C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_1C3B5FC3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  uint64_t v16;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1C3B54070(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8E6A38);
  if ((sub_1C3B62D80() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1C3B54070(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_1C3B62EA0();
    __break(1u);
    return;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];

    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1C3B5FB78(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_1C3B5FD50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_7_1();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_1C3B5FDAC()
{
  OUTLINED_FUNCTION_7_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E17D0);
  sub_1C3B62B7C();
  OUTLINED_FUNCTION_13_0();
}

unint64_t sub_1C3B5FE18()
{
  unint64_t result;

  result = qword_1EF8E6A10;
  if (!qword_1EF8E6A10)
  {
    result = MEMORY[0x1C3BD7808](&unk_1C3B63F20, &type metadata for MetricError);
    atomic_store(result, (unint64_t *)&qword_1EF8E6A10);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MetricError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MetricError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1C3B5FF28 + 4 * byte_1C3B63F15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1C3B5FF5C + 4 * byte_1C3B63F10[v4]))();
}

uint64_t sub_1C3B5FF5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C3B5FF64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1C3B5FF6CLL);
  return result;
}

uint64_t sub_1C3B5FF78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1C3B5FF80);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1C3B5FF84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1C3B5FF8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MetricError()
{
  return &type metadata for MetricError;
}

uint64_t OUTLINED_FUNCTION_112()
{
  return type metadata accessor for MetricStorage(0);
}

void sub_1C3B5FFB0()
{
  unint64_t v0;

  sub_1C3B6001C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_1C3B6001C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED7E17D8)
  {
    type metadata accessor for MetricMessage();
    v0 = sub_1C3B62B88();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED7E17D8);
  }
}

uint64_t sub_1C3B60070()
{
  return type metadata accessor for MetricStore(0);
}

uint64_t type metadata accessor for MetricStore(uint64_t a1)
{
  return sub_1C3B6008C(a1, (uint64_t *)&unk_1ED7E1A50);
}

uint64_t sub_1C3B6008C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1C3B600BC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1C3B62B1C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1C3B60160()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  OUTLINED_FUNCTION_48_0();
  return swift_deallocObject();
}

uint64_t sub_1C3B6017C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1C3B60198(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1C3B5C7B4(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

void sub_1C3B601A0(void *a1)
{
  sub_1C3B5F38C(a1);
}

void sub_1C3B601A8(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_94();
  }
  OUTLINED_FUNCTION_10();
}

void sub_1C3B601DC()
{
  sub_1C3B5E9A0();
}

uint64_t sub_1C3B601E4()
{
  OUTLINED_FUNCTION_89();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1C3B6021C()
{
  sub_1C3B5EB88();
}

void sub_1C3B6022C(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_94();
  }
  OUTLINED_FUNCTION_10();
}

void sub_1C3B60260(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_10();
}

void sub_1C3B60294(void *a1)
{
  id v1;
  void *v2;

  if (a1)
  {
    v1 = objc_msgSend(a1, sel_eventBody);
    if (v1)
    {
      v2 = v1;
      OUTLINED_FUNCTION_45_0();

      OUTLINED_FUNCTION_39();
      sub_1C3B62C6C();
      OUTLINED_FUNCTION_63();
    }
  }
  OUTLINED_FUNCTION_21_0();
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_6_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_1C3B62B1C();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return swift_release();
}

void OUTLINED_FUNCTION_17_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_19_0()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_1C3B54070(0x756F43746E657665, 0xEA0000000000746ELL);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return sub_1C3B62BDC();
}

void OUTLINED_FUNCTION_25_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_29_0@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(_QWORD, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(*(_QWORD *)(v2 - 256), a1, *(_QWORD *)(v3 - 320));
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_1C3B62C30();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return type metadata accessor for MetricMessage();
}

uint64_t OUTLINED_FUNCTION_33_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_34_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_37_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_39_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_41_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_46_0()
{
  return sub_1C3B62CB4();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_51_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_52_0()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_54()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3B54070(v1, v0);
}

_WORD *OUTLINED_FUNCTION_55(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_63()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_67()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_1C3B62AE0();
}

void OUTLINED_FUNCTION_71(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_release();
}

id OUTLINED_FUNCTION_77()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_getObjectType();
}

uint64_t OUTLINED_FUNCTION_79()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_80()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_81@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_82(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

id OUTLINED_FUNCTION_83(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(a1 + 16) = v2;
  return v1;
}

uint64_t OUTLINED_FUNCTION_84(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v1, v3);
}

uint64_t OUTLINED_FUNCTION_86()
{
  return sub_1C3B62BC4();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_1C3B62D80();
}

uint64_t OUTLINED_FUNCTION_88()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 184))();
}

void OUTLINED_FUNCTION_89()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_94()
{
  JUMPOUT(0x1C3BD7808);
}

unint64_t OUTLINED_FUNCTION_95()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3B54070(*(_QWORD *)(v1 - 224), v0);
}

uint64_t OUTLINED_FUNCTION_96()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C3B579D8(v1, v0);
}

unint64_t OUTLINED_FUNCTION_97()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3B54070(v1, v0);
}

unint64_t OUTLINED_FUNCTION_99()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1C3B54070(*(_QWORD *)(v1 - 184), v0);
}

id OUTLINED_FUNCTION_100(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_101(uint64_t a1, uint64_t a2)
{
  return sub_1C3B5B114(a1, a2, 102400);
}

uint64_t OUTLINED_FUNCTION_104()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_105()
{
  unint64_t v0;
  uint64_t v1;

  return sub_1C3B579D8(v1, v0);
}

uint64_t OUTLINED_FUNCTION_108()
{
  return swift_arrayDestroy();
}

void *OUTLINED_FUNCTION_111(int a1, int a2, void *aBlock)
{
  return _Block_copy(aBlock);
}

uint64_t OUTLINED_FUNCTION_113(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return v1 - 136;
}

uint64_t OUTLINED_FUNCTION_115(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_1C3B53908(a1, a2, (uint64_t *)(v2 - 96));
}

void OUTLINED_FUNCTION_116(void (*a1)(unint64_t, unint64_t)@<X8>)
{
  sub_1C3B5BE1C(a1);
}

uint64_t OUTLINED_FUNCTION_118()
{
  return sub_1C3B62EAC();
}

void OUTLINED_FUNCTION_120(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_retain();
}

void sub_1C3B60D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void IIExit(int a1)
{
  _exit(a1);
}

void __ii_default_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD74CC]();
  v1 = os_log_create("com.apple.proactive.PersonalIntelligenceCore", "Default");
  v2 = (void *)ii_default_log_handle__pasExprOnceResult;
  ii_default_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

id ii_private_log_handle()
{
  if (ii_private_log_handle__pasOnceToken3 != -1)
    dispatch_once(&ii_private_log_handle__pasOnceToken3, &__block_literal_global_4);
  return (id)ii_private_log_handle__pasExprOnceResult;
}

void __ii_private_log_handle_block_invoke()
{
  void *v0;
  os_log_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD74CC]();
  v1 = os_log_create("com.apple.proactive.PersonalIntelligenceCore", "Private-Data");
  v2 = (void *)ii_private_log_handle__pasExprOnceResult;
  ii_private_log_handle__pasExprOnceResult = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void sub_1C3B61EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1C3B628B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1C3B629E4()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1C3B629F0()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1C3B629FC()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1C3B62A08()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1C3B62A14()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1C3B62A20()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1C3B62A2C()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1C3B62A38()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1C3B62A44()
{
  return MEMORY[0x1E0CAF5C8]();
}

uint64_t sub_1C3B62A50()
{
  return MEMORY[0x1E0CAF5F8]();
}

uint64_t sub_1C3B62A5C()
{
  return MEMORY[0x1E0CAF608]();
}

uint64_t sub_1C3B62A68()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1C3B62A74()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1C3B62A80()
{
  return MEMORY[0x1E0CAFF88]();
}

uint64_t sub_1C3B62A8C()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1C3B62A98()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1C3B62AA4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1C3B62AB0()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1C3B62ABC()
{
  return MEMORY[0x1E0CB0270]();
}

uint64_t sub_1C3B62AC8()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1C3B62AD4()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1C3B62AE0()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1C3B62AEC()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1C3B62AF8()
{
  return MEMORY[0x1E0CB0700]();
}

uint64_t sub_1C3B62B04()
{
  return MEMORY[0x1E0CB0828]();
}

uint64_t sub_1C3B62B10()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1C3B62B1C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1C3B62B28()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1C3B62B34()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1C3B62B40()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1C3B62B4C()
{
  return MEMORY[0x1E0CB1068]();
}

uint64_t sub_1C3B62B58()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1C3B62B64()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1C3B62B70()
{
  return MEMORY[0x1E0D023A0]();
}

uint64_t sub_1C3B62B7C()
{
  return MEMORY[0x1E0D02508]();
}

uint64_t sub_1C3B62B88()
{
  return MEMORY[0x1E0D02510]();
}

uint64_t sub_1C3B62B94()
{
  return MEMORY[0x1E0D02520]();
}

uint64_t sub_1C3B62BA0()
{
  return MEMORY[0x1E0D02540]();
}

uint64_t sub_1C3B62BAC()
{
  return MEMORY[0x1E0D02548]();
}

uint64_t sub_1C3B62BB8()
{
  return MEMORY[0x1E0DF2080]();
}

uint64_t sub_1C3B62BC4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1C3B62BD0()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1C3B62BDC()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1C3B62BE8()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1C3B62BF4()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1C3B62C00()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1C3B62C0C()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1C3B62C18()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1C3B62C24()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1C3B62C30()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1C3B62C3C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1C3B62C48()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1C3B62C54()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1C3B62C60()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1C3B62C6C()
{
  return MEMORY[0x1E0DEA940]();
}

uint64_t sub_1C3B62C78()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1C3B62C84()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1C3B62C90()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1C3B62C9C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1C3B62CA8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1C3B62CB4()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1C3B62CC0()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1C3B62CCC()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1C3B62CD8()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1C3B62CE4()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1C3B62CF0()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1C3B62CFC()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1C3B62D08()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1C3B62D14()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1C3B62D20()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1C3B62D2C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1C3B62D38()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1C3B62D44()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1C3B62D50()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1C3B62D5C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1C3B62D68()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1C3B62D74()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1C3B62D80()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1C3B62D8C()
{
  return MEMORY[0x1E0DECAF8]();
}

uint64_t sub_1C3B62D98()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1C3B62DA4()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1C3B62DB0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1C3B62DBC()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1C3B62DC8()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1C3B62DD4()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1C3B62DE0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1C3B62DEC()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1C3B62DF8()
{
  return MEMORY[0x1E0DECF68]();
}

uint64_t sub_1C3B62E04()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1C3B62E10()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1C3B62E1C()
{
  return MEMORY[0x1E0DED018]();
}

uint64_t sub_1C3B62E28()
{
  return MEMORY[0x1E0DED028]();
}

uint64_t sub_1C3B62E34()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1C3B62E40()
{
  return MEMORY[0x1E0DED0A0]();
}

uint64_t sub_1C3B62E4C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1C3B62E58()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1C3B62E64()
{
  return MEMORY[0x1E0DED148]();
}

uint64_t sub_1C3B62E70()
{
  return MEMORY[0x1E0DED158]();
}

uint64_t sub_1C3B62E7C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1C3B62E88()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1C3B62E94()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1C3B62EA0()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1C3B62EAC()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1C3B62EB8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1C3B62EC4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1C3B62ED0()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1C3B62EDC()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1C3B62EE8()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1C3B62EF4()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1C3B62F00()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1C3B62F0C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1C3B62F18()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1C3B62F24()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1C3B62F30()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1C3B62F3C()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
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

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _exit(int a1)
{
  MEMORY[0x1E0C80F80](*(_QWORD *)&a1);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
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

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

