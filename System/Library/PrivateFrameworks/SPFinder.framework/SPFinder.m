uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E8598]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

void sub_21590BF38(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21590C0DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t finderStateChangedHandler(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  NSObject *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  LogCategory_Unspecified();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_215909000, v10, OS_LOG_TYPE_DEFAULT, "SPFinderStateManager Received SPFinderStateChangedNotification distributed notification.", (uint8_t *)&v13, 2u);
  }

  LogCategory_Unspecified();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138413058;
    v14 = a1;
    v15 = 2112;
    v16 = a3;
    v17 = 2112;
    v18 = a4;
    v19 = 2112;
    v20 = a5;
    _os_log_debug_impl(&dword_215909000, v11, OS_LOG_TYPE_DEBUG, "Finder State FWK: %@, %@, %@, %@", (uint8_t *)&v13, 0x2Au);
  }

  return objc_msgSend(a2, "updateStateBlock");
}

id LogCategory_Unspecified()
{
  if (LogCategory_Unspecified_onceToken != -1)
    dispatch_once(&LogCategory_Unspecified_onceToken, &__block_literal_global);
  return (id)LogCategory_Unspecified_log;
}

id LogCategory_AdvertisementCache()
{
  if (LogCategory_AdvertisementCache_onceToken != -1)
    dispatch_once(&LogCategory_AdvertisementCache_onceToken, &__block_literal_global_3);
  return (id)LogCategory_AdvertisementCache_log;
}

void sub_21590F33C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21590F5DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21590F848(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21590FAAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_21590FE88(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2159100EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_215910358(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_2159104F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215910620(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_215910710()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = v0;
  return swift_task_switch();
}

uint64_t sub_215910728()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  swift_beginAccess();
  v1 = swift_bridgeObjectRetain();
  v2 = sub_2159113FC(v1);
  swift_bridgeObjectRelease();
  if ((v2 & 1) != 0)
  {
    sub_215912210();
    *(_QWORD *)(v0 + 40) = 0;
    *(_QWORD *)(v0 + 48) = 0xE000000000000000;
    sub_2159121BC();
    sub_21591221C();
    sub_2159121BC();
    return sub_215912228();
  }
  else
  {
    swift_beginAccess();
    sub_215910BB0();
    swift_endAccess();
    if (qword_254DEAF50 != -1)
      swift_once();
    v4 = sub_215912198();
    __swift_project_value_buffer(v4, (uint64_t)qword_254DEB2D0);
    v5 = sub_215912180();
    v6 = sub_2159121EC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_215909000, v5, v6, "Booted SPOwner locationd Swift context", v7, 2u);
      MEMORY[0x2199E85F8](v7, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_215910934()
{
  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for SwiftBootstrapManager()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for SwiftBootstrapManager.Context(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SwiftBootstrapManager.Context(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_215910A08 + 4 * byte_215913BE0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_215910A28 + 4 * byte_215913BE5[v4]))();
}

_BYTE *sub_215910A08(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_215910A28(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_215910A30(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_215910A38(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_215910A40(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_215910A48(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_215910A54()
{
  return 0;
}

ValueMetadata *type metadata accessor for SwiftBootstrapManager.Context()
{
  return &type metadata for SwiftBootstrapManager.Context;
}

uint64_t sub_215910A70()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_215910A8C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_215912234();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_215910ADC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_215911494();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_215910B04()
{
  unint64_t result;

  result = qword_254DEB030;
  if (!qword_254DEB030)
  {
    result = MEMORY[0x2199E85A4](&unk_215913CA8, &type metadata for SwiftBootstrapManager.Context);
    atomic_store(result, (unint64_t *)&qword_254DEB030);
  }
  return result;
}

uint64_t sub_215910B48()
{
  uint64_t v0;

  v0 = sub_215912198();
  __swift_allocate_value_buffer(v0, qword_254DEB2D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DEB2D0);
  return sub_21591218C();
}

BOOL sub_215910BB0()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;

  v1 = *v0;
  sub_21591224C();
  swift_bridgeObjectRetain();
  sub_2159121B0();
  v2 = sub_215912258() & ~(-1 << *(_BYTE *)(v1 + 32));
  v3 = (1 << v2) & *(_QWORD *)(v1 + ((v2 >> 3) & 0xFFFFFFFFFFFFF8) + 56);
  swift_bridgeObjectRelease();
  if (!v3)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *v0;
    *v0 = 0x8000000000000000;
    sub_215910F30(v2, isUniquelyReferenced_nonNull_native);
    *v0 = v6;
    swift_bridgeObjectRelease();
  }
  return v3 == 0;
}

uint64_t sub_215910C9C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DEB038);
  v3 = sub_215912204();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (!v8)
      {
        v14 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_36:
          __break(1u);
LABEL_37:
          __break(1u);
          return result;
        }
        if (v14 >= v9)
          goto LABEL_31;
        v8 = v6[v14];
        ++v12;
        if (!v8)
        {
          v12 = v14 + 1;
          if (v14 + 1 >= v9)
            goto LABEL_31;
          v8 = v6[v12];
          if (!v8)
          {
            v12 = v14 + 2;
            if (v14 + 2 >= v9)
              goto LABEL_31;
            v8 = v6[v12];
            if (!v8)
            {
              v15 = v14 + 3;
              if (v15 >= v9)
              {
LABEL_31:
                swift_release();
                v1 = v0;
                v23 = 1 << *(_BYTE *)(v2 + 32);
                if (v23 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v23 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v23;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v8 = v6[v15];
              if (!v8)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_37;
                  if (v12 >= v9)
                    goto LABEL_31;
                  v8 = v6[v12];
                  ++v15;
                  if (v8)
                    goto LABEL_22;
                }
              }
              v12 = v15;
            }
          }
        }
      }
LABEL_22:
      sub_21591224C();
      sub_2159121B0();
      result = sub_215912258();
      v16 = -1 << *(_BYTE *)(v4 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v10 + 8 * (v17 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v19 = 0;
        v20 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v20 && (v19 & 1) != 0)
          {
            __break(1u);
            goto LABEL_36;
          }
          v21 = v18 == v20;
          if (v18 == v20)
            v18 = 0;
          v19 |= v21;
          v22 = *(_QWORD *)(v10 + 8 * v18);
        }
        while (v22 == -1);
        v13 = __clz(__rbit64(~v22)) + (v18 << 6);
      }
      v8 &= v8 - 1;
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_215910F30(uint64_t result, char a2)
{
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v3 = result;
  v4 = *(_QWORD *)(*v2 + 16);
  v5 = *(_QWORD *)(*v2 + 24);
  if (v5 <= v4 || (a2 & 1) == 0)
  {
    if ((a2 & 1) != 0)
    {
      sub_215910C9C();
      goto LABEL_8;
    }
    if (v5 <= v4)
    {
      sub_21591119C();
LABEL_8:
      v6 = *v2;
      sub_21591224C();
      sub_2159121B0();
      result = sub_215912258();
      v3 = result & ~(-1 << *(_BYTE *)(v6 + 32));
      if (((*(_QWORD *)(v6 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> v3) & 1) != 0)
        goto LABEL_12;
      goto LABEL_9;
    }
    result = (uint64_t)sub_215911040();
  }
LABEL_9:
  v7 = *v2;
  *(_QWORD *)(*v2 + 8 * (v3 >> 6) + 56) |= 1 << v3;
  v8 = *(_QWORD *)(v7 + 16);
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (!v9)
  {
    *(_QWORD *)(v7 + 16) = v10;
    return result;
  }
  __break(1u);
LABEL_12:
  result = sub_215912240();
  __break(1u);
  return result;
}

void *sub_215911040()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DEB038);
  v2 = *v0;
  v3 = sub_2159121F8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_27:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (!v12)
    {
      v14 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_29;
      }
      if (v14 >= v13)
        goto LABEL_27;
      v12 = *(_QWORD *)(v6 + 8 * v14);
      ++v9;
      if (!v12)
      {
        v9 = v14 + 1;
        if (v14 + 1 >= v13)
          goto LABEL_27;
        v12 = *(_QWORD *)(v6 + 8 * v9);
        if (!v12)
        {
          v9 = v14 + 2;
          if (v14 + 2 >= v13)
            goto LABEL_27;
          v12 = *(_QWORD *)(v6 + 8 * v9);
          if (!v12)
            break;
        }
      }
    }
LABEL_12:
    v12 &= v12 - 1;
  }
  v15 = v14 + 3;
  if (v15 >= v13)
    goto LABEL_27;
  v12 = *(_QWORD *)(v6 + 8 * v15);
  if (v12)
  {
    v9 = v15;
    goto LABEL_12;
  }
  while (1)
  {
    v9 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v9 >= v13)
      goto LABEL_27;
    v12 = *(_QWORD *)(v6 + 8 * v9);
    ++v15;
    if (v12)
      goto LABEL_12;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_21591119C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  unint64_t v20;
  BOOL v21;
  uint64_t v22;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DEB038);
  v3 = sub_215912204();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_33:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (!v8)
    {
      v14 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v14 >= v9)
        goto LABEL_31;
      v8 = *(_QWORD *)(v6 + 8 * v14);
      ++v12;
      if (!v8)
      {
        v12 = v14 + 1;
        if (v14 + 1 >= v9)
          goto LABEL_31;
        v8 = *(_QWORD *)(v6 + 8 * v12);
        if (!v8)
        {
          v12 = v14 + 2;
          if (v14 + 2 >= v9)
            goto LABEL_31;
          v8 = *(_QWORD *)(v6 + 8 * v12);
          if (!v8)
            break;
        }
      }
    }
LABEL_22:
    sub_21591224C();
    sub_2159121B0();
    result = sub_215912258();
    v16 = -1 << *(_BYTE *)(v4 + 32);
    v17 = result & ~v16;
    v18 = v17 >> 6;
    if (((-1 << v17) & ~*(_QWORD *)(v10 + 8 * (v17 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v10 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v19 = 0;
      v20 = (unint64_t)(63 - v16) >> 6;
      do
      {
        if (++v18 == v20 && (v19 & 1) != 0)
        {
          __break(1u);
          goto LABEL_34;
        }
        v21 = v18 == v20;
        if (v18 == v20)
          v18 = 0;
        v19 |= v21;
        v22 = *(_QWORD *)(v10 + 8 * v18);
      }
      while (v22 == -1);
      v13 = __clz(__rbit64(~v22)) + (v18 << 6);
    }
    v8 &= v8 - 1;
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    ++*(_QWORD *)(v4 + 16);
  }
  v15 = v14 + 3;
  if (v15 >= v9)
  {
LABEL_31:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_33;
  }
  v8 = *(_QWORD *)(v6 + 8 * v15);
  if (v8)
  {
    v12 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v9)
      goto LABEL_31;
    v8 = *(_QWORD *)(v6 + 8 * v12);
    ++v15;
    if (v8)
      goto LABEL_22;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_2159113FC(uint64_t a1)
{
  unint64_t v2;

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  sub_21591224C();
  sub_2159121B0();
  v2 = sub_215912258() & ~(-1 << *(_BYTE *)(a1 + 32));
  return (*(_QWORD *)(a1 + ((v2 >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> v2) & 1;
}

uint64_t sub_21591148C()
{
  return 1;
}

uint64_t sub_215911494()
{
  return 0x6E6F697461636F6CLL;
}

uint64_t sub_2159114B0()
{
  sub_21591224C();
  sub_2159121B0();
  return sub_215912258();
}

uint64_t sub_215911504()
{
  return sub_2159121B0();
}

uint64_t sub_215911520()
{
  sub_21591224C();
  sub_2159121B0();
  return sub_215912258();
}

uint64_t sub_215911570()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SwiftBootstrapManager();
  v0 = swift_allocObject();
  result = swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = MEMORY[0x24BEE4B08];
  qword_254DEB2E8 = v0;
  return result;
}

uint64_t static ObjCSwiftBridge.bootstrap(context:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254DEB048 + dword_254DEB048);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_215911624;
  return v7(a1, a2);
}

uint64_t sub_215911624()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215911798(int a1, void *aBlock)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v2[2] = _Block_copy(aBlock);
  v3 = sub_2159121A4();
  v5 = v4;
  v2[3] = v4;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254DEB048 + dword_254DEB048);
  v6 = (_QWORD *)swift_task_alloc();
  v2[4] = v6;
  *v6 = v2;
  v6[1] = sub_215911820;
  return v8(v3, v5);
}

uint64_t sub_215911820()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 16);
  if (v0)
  {
    v4 = (void *)sub_215912174();

    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 16), 0);
  }
  _Block_release(*(const void **)(v2 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id ObjCSwiftBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ObjCSwiftBridge.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ObjCSwiftBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ObjCSwiftBridge();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_215911980(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_215912088;
  return v6();
}

uint64_t sub_2159119D4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_215912088;
  return v7();
}

uint64_t sub_215911A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2159121E0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2159121D4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_215911FB4(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2159121C8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_215911B6C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_215911BD0;
  return v6(a1);
}

uint64_t sub_215911BD0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215911C1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_215911C34()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  swift_bridgeObjectRetain();
  v1 = sub_215912234();
  swift_bridgeObjectRelease();
  if (v1)
  {
    sub_215912210();
    swift_bridgeObjectRelease();
    sub_2159121BC();
    sub_2159121BC();
    return sub_215912228();
  }
  else
  {
    if (qword_254DEAF58 != -1)
      swift_once();
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v3;
    *v3 = v0;
    v3[1] = sub_215911D84;
    return sub_215910710();
  }
}

uint64_t sub_215911D84()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t type metadata accessor for ObjCSwiftBridge()
{
  return objc_opt_self();
}

uint64_t sub_215911DEC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_215911E18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_215911624;
  return ((uint64_t (*)(int, void *))((char *)&dword_254DEB080 + dword_254DEB080))(v2, v3);
}

uint64_t sub_215911E88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_215912088;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254DEB090 + dword_254DEB090))(v2, v3, v4);
}

uint64_t objectdestroy_5Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215911F30(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215912088;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_254DEB0A0 + dword_254DEB0A0))(a1, v4, v5, v6);
}

uint64_t sub_215911FB4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DEB078);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_215911FF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215912018(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_215911624;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254DEB0B0 + dword_254DEB0B0))(a1, v4);
}

uint64_t sub_215912174()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_215912180()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21591218C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_215912198()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2159121A4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2159121B0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2159121BC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2159121C8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2159121D4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2159121E0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2159121EC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2159121F8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_215912204()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_215912210()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21591221C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_215912228()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_215912234()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_215912240()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21591224C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_215912258()
{
  return MEMORY[0x24BEE4328]();
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

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

