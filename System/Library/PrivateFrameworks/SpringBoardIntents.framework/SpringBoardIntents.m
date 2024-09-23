uint64_t getEnumTagSinglePayload for Focus.FocusEntity(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_2479B9B40()
{
  sub_2479B9B68();
  return sub_2479BFB3C();
}

unint64_t sub_2479B9B68()
{
  unint64_t result;

  result = qword_25444DDA8;
  if (!qword_25444DDA8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0BD4, &type metadata for Focus);
    atomic_store(result, (unint64_t *)&qword_25444DDA8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Focus.FocusEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_2479B9BFC@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

ValueMetadata *type metadata accessor for Focus.FocusEntity()
{
  return &type metadata for Focus.FocusEntity;
}

uint64_t sub_2479B9C18()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2479B9C60()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2479B9C18;
  return sub_2479BFBF0();
}

uint64_t sub_2479B9CCC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2479B9CF0();
  *a1 = result;
  return result;
}

uint64_t sub_2479B9CF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  _OWORD v17[4];

  v0 = sub_2479BFC08();
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576D22E0);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v17 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2480);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2479BFC68();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2488);
  sub_2479BFC50();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v14 = sub_2479BFB54();
  memset(v17, 0, sizeof(v17));
  v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v15(v8, 1, 1, v14);
  v15(v6, 1, 1, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6090], v0);
  sub_2479B9EF8();
  return sub_2479BFB84();
}

unint64_t sub_2479B9EF8()
{
  unint64_t result;

  result = qword_2576D2418[0];
  if (!qword_2576D2418[0])
  {
    result = MEMORY[0x249586EF4](&unk_2479C08E0, &type metadata for Focus.FocusEntity);
    atomic_store(result, qword_2576D2418);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Focus.FocusEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_2479B9F6C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedActivityManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24A8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2479C08C0;
  *(_QWORD *)(v2 + 32) = sub_2479BFD04();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = 0;
  *(_QWORD *)(v2 + 56) = 0xE000000000000000;
  *(_OWORD *)(v2 + 64) = xmmword_2479C08D0;
  *(_QWORD *)(v2 + 80) = 0xD000000000000010;
  *(_QWORD *)(v2 + 88) = 0x80000002479C11D0;
  v36 = (_QWORD *)v2;
  v4 = objc_msgSend(v1, sel_availableActivities);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576D24B0);
  v5 = sub_2479BFD1C();

  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v29 = v1;
    v30 = v0;
    if (v6)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease_n();

    return (*(uint64_t (**)(_QWORD *))(v30 + 8))(v36);
  }
  swift_bridgeObjectRetain();
  result = sub_2479BFD70();
  v6 = result;
  v29 = v1;
  v30 = v0;
  if (!result)
    goto LABEL_13;
LABEL_3:
  if (v6 >= 1)
  {
    v8 = 0;
    v31 = v5 & 0xC000000000000001;
    v32 = v6;
    v33 = v5;
    do
    {
      if (v31)
      {
        v9 = (void *)MEMORY[0x249586B40](v8, v5);
      }
      else
      {
        v9 = *(void **)(v5 + 8 * v8 + 32);
        swift_unknownObjectRetain();
      }
      v10 = objc_msgSend(v9, sel_activityIdentifier);
      v11 = sub_2479BFD04();
      v34 = v12;
      v35 = v11;

      v13 = objc_msgSend(v9, sel_activityDisplayName);
      v14 = sub_2479BFD04();
      v16 = v15;

      v17 = objc_msgSend(v9, sel_activitySymbolImageName);
      v18 = sub_2479BFD04();
      v20 = v19;

      v21 = objc_msgSend(v9, sel_activityColorName);
      v22 = sub_2479BFD04();
      v24 = v23;

      v25 = v36;
      v27 = v36[2];
      v26 = v36[3];
      if (v27 >= v26 >> 1)
        v25 = sub_2479BA250((_QWORD *)(v26 > 1), v27 + 1, 1, v36);
      ++v8;
      v25[2] = v27 + 1;
      v36 = v25;
      v28 = &v25[8 * v27];
      v28[4] = v35;
      v28[5] = v34;
      v28[6] = v14;
      v28[7] = v16;
      v28[8] = v18;
      v28[9] = v20;
      v28[10] = v22;
      v28[11] = v24;
      swift_unknownObjectRelease();
      v5 = v33;
    }
    while (v32 != v8);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2479BA250(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2479BAAD0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_2479BA35C@<X0>(uint64_t a1@<X8>)
{
  return sub_2479BA394(a1);
}

uint64_t sub_2479BA394@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;

  v30 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2308);
  MEMORY[0x24BDAC7A8](v2);
  v28 = (uint64_t)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2480);
  MEMORY[0x24BDAC7A8](v4);
  v27 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2479BFC5C();
  v25 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (uint64_t *)((char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = sub_2479BFCA4();
  MEMORY[0x24BDAC7A8](v9);
  v24 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2479BFCEC();
  MEMORY[0x24BDAC7A8](v11);
  v12 = sub_2479BFC68();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v24 - v17;
  v20 = *v1;
  v19 = v1[1];
  v29 = v1;
  if (v20 == sub_2479BFD04() && v19 == v21)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = sub_2479BFDA0();
    swift_bridgeObjectRelease();
    if ((v22 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      sub_2479BFC50();
      goto LABEL_7;
    }
  }
  sub_2479BFCE0();
  sub_2479BFC98();
  *v8 = sub_2479BA8E0(0, &qword_2576D24C0);
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v25 + 104))(v8, *MEMORY[0x24BDCD338], v26);
  sub_2479BFC74();
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v27, 1, 1, v12);
  sub_2479BA6D8(v28);
  sub_2479BFBD8();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v18, v12);
}

id sub_2479BA6D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *ObjCClassFromMetadata;
  id v4;
  id result;
  uint64_t v6;
  _BYTE v7[16];
  _BYTE v8[16];
  _QWORD v9[2];
  _QWORD v10[2];

  sub_2479BA870(v1 + 32, (uint64_t)v8);
  sub_2479BA870((uint64_t)v8, (uint64_t)v9);
  if (v9[1])
  {
    sub_2479BA870(v1 + 48, (uint64_t)v7);
    sub_2479BA870((uint64_t)v7, (uint64_t)v10);
    if (v10[1])
    {
      sub_2479BA8E0(0, qword_2576D24D0);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      sub_2479BA8B8((uint64_t)v7);
      sub_2479BA8B8((uint64_t)v7);
      sub_2479BA8B8((uint64_t)v8);
      if (objc_msgSend(ObjCClassFromMetadata, sel_respondsToSelector_, sub_2479BFCB0()))
      {
        v4 = objc_msgSend(ObjCClassFromMetadata, sel_performSelector_, sub_2479BFCB0());
        result = ObjCClassFromMetadata;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        swift_unknownObjectRetain();
        objc_opt_self();
        if (swift_dynamicCastObjCClass())
          return (id)sub_2479BFBC0();
        swift_unknownObjectRelease();
      }
      else
      {
        sub_2479BE8BC((uint64_t)v7);
      }
      sub_2479BE8BC((uint64_t)v8);
    }
  }
  v6 = sub_2479BFBCC();
  return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, 1, 1, v6);
}

uint64_t sub_2479BA870(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479BA8B8(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2479BA8E0(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t destroy for Focus.FocusEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Focus.FocusEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249586EDC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2479BAAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2479BAAD0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2479BFD88();
  __break(1u);
  return result;
}

uint64_t sub_2479BABC0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (!v1)
    **(_QWORD **)(v4 + 16) = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2479BAC1C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_2576D24A0 + dword_2576D24A0);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_2479BABC0;
  return v4();
}

id NSStringFromSBINAppIntentActionSource(unint64_t a1)
{
  if (a1 < 3)
    return *((id *)&off_25190EB30 + a1);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id SBINLogCommon()
{
  if (SBINLogCommon_onceToken != -1)
    dispatch_once(&SBINLogCommon_onceToken, &__block_literal_global);
  return (id)SBINLogCommon___logObj;
}

id SBINLogIntentExecution()
{
  if (SBINLogIntentExecution_onceToken != -1)
    dispatch_once(&SBINLogIntentExecution_onceToken, &__block_literal_global_3);
  return (id)SBINLogIntentExecution___logObj;
}

Class __getFCActivityManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FocusLibraryCore_frameworkLibrary)
  {
    FocusLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FocusLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FCActivityManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFCActivityManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFCActivityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

__CFString *NSStringFromSBINCameraCaptureMode(unint64_t a1)
{
  if (a1 < 3)
    return off_25190EC58[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromSBINCameraCaptureDevice(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("front");
  if (a1 == 1)
  {
    v1 = CFSTR("back");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<unknown: %lu>"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t sub_2479BBB4C()
{
  uint64_t v0;

  v0 = sub_2479BFC38();
  __swift_allocate_value_buffer(v0, qword_2576D26B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D26B0);
  return sub_2479BFC2C();
}

unint64_t sub_2479BBBAC()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  unint64_t result;
  _QWORD v28[4];
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2308);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v32 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v28[3] = (char *)v28 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2480);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v29 = (char *)v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)v28 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v28 - v10;
  v12 = sub_2479BFC68();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = v12;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v28[2] = (char *)v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v33 = (char *)v28 - v18;
  MEMORY[0x24BDAC7A8](v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2310);
  v19 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576D2318) - 8);
  v20 = *(_QWORD *)(v19 + 72);
  v21 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v30 = 4 * v20;
  v22 = swift_allocObject();
  v31 = v22;
  *(_OWORD *)(v22 + 16) = xmmword_2479C03F0;
  v23 = v22 + v21;
  *(_BYTE *)(v22 + v21) = 0;
  v28[1] = 0xD000000000000016;
  sub_2479BFC50();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v24(v11, 1, 1, v14);
  sub_2479BFBC0();
  sub_2479BFBD8();
  *(_BYTE *)(v23 + v20) = 1;
  sub_2479BFC50();
  v28[0] = v14;
  v24(v34, 1, 1, v14);
  sub_2479BFBC0();
  sub_2479BFBD8();
  *(_BYTE *)(v23 + 2 * v20) = 2;
  sub_2479BFC50();
  v24(v29, 1, 1, v14);
  sub_2479BFBC0();
  sub_2479BFBD8();
  *(_BYTE *)(v23 + 3 * v20) = 3;
  sub_2479BFC50();
  v25 = v34;
  v26 = v28[0];
  v24(v34, 1, 1, v28[0]);
  sub_2479BFBC0();
  sub_2479BFBD8();
  *(_BYTE *)(v23 + v30) = 4;
  sub_2479BFC50();
  v24(v25, 1, 1, v26);
  sub_2479BFBC0();
  sub_2479BFBD8();
  result = sub_2479BC080(v31);
  qword_2576D26C8 = result;
  return result;
}

unint64_t sub_2479BC080(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2318);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576D2320);
  v6 = sub_2479BFD7C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_2479BD674(v12, (uint64_t)v5);
    v14 = *v5;
    result = sub_2479BD238(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_2479BFBE4();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_2479BC210(char a1)
{
  return *(_QWORD *)&aRearphotfrontp[8 * a1];
}

uint64_t sub_2479BC230(char *a1, char *a2)
{
  return sub_2479BC284(*a1, *a2);
}

unint64_t sub_2479BC240()
{
  unint64_t result;

  result = qword_25444DCC8;
  if (!qword_25444DCC8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C041C, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCC8);
  }
  return result;
}

uint64_t sub_2479BC284(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aRearphotfrontp[8 * a1] == *(_QWORD *)&aRearphotfrontp[8 * a2]
    && *(_QWORD *)&aRearphotfrontp[8 * a1 + 40] == *(_QWORD *)&aRearphotfrontp[8 * a2 + 40])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_2479BFDA0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_2479BC308()
{
  return sub_2479BC310();
}

uint64_t sub_2479BC310()
{
  sub_2479BFDAC();
  sub_2479BFD10();
  swift_bridgeObjectRelease();
  return sub_2479BFDB8();
}

uint64_t sub_2479BC378()
{
  return sub_2479BC380();
}

uint64_t sub_2479BC380()
{
  sub_2479BFD10();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2479BC3C0()
{
  return sub_2479BC3C8();
}

uint64_t sub_2479BC3C8()
{
  sub_2479BFDAC();
  sub_2479BFD10();
  swift_bridgeObjectRelease();
  return sub_2479BFDB8();
}

uint64_t sub_2479BC42C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2479BD3C4();
  *a1 = result;
  return result;
}

uint64_t sub_2479BC458@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2479BC210(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2479BC484()
{
  unint64_t result;

  result = qword_25444DC80;
  if (!qword_25444DC80)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0534, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DC80);
  }
  return result;
}

unint64_t sub_2479BC4CC()
{
  unint64_t result;

  result = qword_25444DCA8;
  if (!qword_25444DCA8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C056C, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCA8);
  }
  return result;
}

unint64_t sub_2479BC514()
{
  unint64_t result;

  result = qword_25444DCD0;
  if (!qword_25444DCD0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0484, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCD0);
  }
  return result;
}

uint64_t sub_2479BC558()
{
  return MEMORY[0x24BEE0D78];
}

uint64_t sub_2479BC564()
{
  return sub_2479BD1F8(&qword_2576D2238, &qword_2576D2240, MEMORY[0x24BEE12E0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249586EE8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2479BC5D4(_QWORD *a1@<X8>)
{
  *a1 = &unk_25190ED08;
}

unint64_t sub_2479BC5E8()
{
  unint64_t result;

  result = qword_25444DC98;
  if (!qword_25444DC98)
  {
    result = MEMORY[0x249586EF4](&unk_2479C059C, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DC98);
  }
  return result;
}

unint64_t sub_2479BC630()
{
  unint64_t result;

  result = qword_25444DCA0;
  if (!qword_25444DCA0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C05C4, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCA0);
  }
  return result;
}

unint64_t sub_2479BC678()
{
  unint64_t result;

  result = qword_25444DC88;
  if (!qword_25444DC88)
  {
    result = MEMORY[0x249586EF4](&unk_2479C05EC, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DC88);
  }
  return result;
}

unint64_t sub_2479BC6C0()
{
  unint64_t result;

  result = qword_25444DC90;
  if (!qword_25444DC90)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0644, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DC90);
  }
  return result;
}

uint64_t sub_2479BC704@<X0>(uint64_t a1@<X8>)
{
  return sub_2479BCF18(&qword_2576D2200, (uint64_t (*)(_QWORD))MEMORY[0x24BDB6200], (uint64_t)qword_2576D26B0, a1);
}

uint64_t sub_2479BC728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2479BCA64(a1, a2, a3, (void (*)(void))sub_2479BC73C);
}

unint64_t sub_2479BC73C()
{
  unint64_t result;

  result = qword_2576D2248;
  if (!qword_2576D2248)
  {
    result = MEMORY[0x249586EF4](&unk_2479C04BC, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_2576D2248);
  }
  return result;
}

uint64_t sub_2479BC780()
{
  sub_2479BC73C();
  return sub_2479BFAE8();
}

unint64_t sub_2479BC7BC()
{
  unint64_t result;

  result = qword_25444DCB0;
  if (!qword_25444DCB0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0684, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCB0);
  }
  return result;
}

unint64_t sub_2479BC804()
{
  unint64_t result;

  result = qword_25444DCD8;
  if (!qword_25444DCD8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C04FC, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCD8);
  }
  return result;
}

unint64_t sub_2479BC84C()
{
  unint64_t result;

  result = qword_25444DCC0;
  if (!qword_25444DCC0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0444, &type metadata for CameraMode);
    atomic_store(result, (unint64_t *)&qword_25444DCC0);
  }
  return result;
}

uint64_t sub_2479BC890()
{
  if (qword_2576D2208 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2479BC8D0()
{
  sub_2479BC6C0();
  return sub_2479BFC14();
}

unint64_t sub_2479BC90C()
{
  unint64_t result;

  result = qword_2576D2258[0];
  if (!qword_2576D2258[0])
  {
    result = MEMORY[0x249586EF4](&unk_2479C06EC, &type metadata for OpenCamera);
    atomic_store(result, qword_2576D2258);
  }
  return result;
}

uint64_t sub_2479BC950()
{
  return MEMORY[0x24BEE40A0];
}

uint64_t sub_2479BC95C()
{
  return MEMORY[0x24BEE4080];
}

unint64_t sub_2479BC96C()
{
  unint64_t result;

  result = qword_25444DCF0;
  if (!qword_25444DCF0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0714, &type metadata for OpenCamera);
    atomic_store(result, (unint64_t *)&qword_25444DCF0);
  }
  return result;
}

unint64_t sub_2479BC9B4()
{
  unint64_t result;

  result = qword_25444DCF8;
  if (!qword_25444DCF8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C07A4, &type metadata for OpenCamera);
    atomic_store(result, (unint64_t *)&qword_25444DCF8);
  }
  return result;
}

unint64_t sub_2479BC9FC()
{
  unint64_t result;

  result = qword_25444DCE0;
  if (!qword_25444DCE0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C07CC, &type metadata for OpenCamera);
    atomic_store(result, (unint64_t *)&qword_25444DCE0);
  }
  return result;
}

uint64_t sub_2479BCA40()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BCA50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2479BCA64(a1, a2, a3, (void (*)(void))sub_2479BC96C);
}

uint64_t sub_2479BCA64(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BCAA4()
{
  uint64_t v0;

  v0 = sub_2479BFC68();
  __swift_allocate_value_buffer(v0, qword_2576D26D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D26D0);
  return sub_2479BFC50();
}

uint64_t sub_2479BCB04(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[15] = a1;
  v2[16] = a2;
  sub_2479BFD40();
  v2[17] = sub_2479BFD34();
  v2[18] = sub_2479BFD28();
  v2[19] = v3;
  return swift_task_switch();
}

uint64_t sub_2479BCB70()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  sub_2479BFB6C();
  v1 = 8 * *(char *)(v0 + 80);
  v2 = *(_QWORD *)((char *)&unk_2479C0820 + v1);
  v3 = *(_QWORD *)((char *)&unk_2479C0848 + v1);
  v4 = swift_retain();
  v5 = sub_2479BE930(v4);
  swift_release();
  v6 = objc_msgSend(objc_allocWithZone((Class)SBINOpenCameraAppIntent), sel_initWithCaptureDevice_captureMode_systemContext_, v2, v3, v5);
  *(_QWORD *)(v0 + 160) = v6;

  v7 = objc_msgSend((id)objc_opt_self(), sel_sharedSystemCoordinator);
  *(_QWORD *)(v0 + 168) = v7;
  *(_QWORD *)(v0 + 56) = v0 + 176;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_2479BCCC0;
  *(_QWORD *)(v0 + 112) = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v0 + 88) = 0x40000000;
  *(_QWORD *)(v0 + 96) = sub_2479BF010;
  *(_QWORD *)(v0 + 104) = &block_descriptor;
  objc_msgSend(v7, sel_performAppIntent_withCompletion_, v6, v0 + 80);
  return swift_continuation_await();
}

uint64_t sub_2479BCCC0()
{
  return swift_task_switch();
}

uint64_t sub_2479BCD04()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  os_log_type_t type;

  v1 = *(void **)(v0 + 168);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 176);

  if (qword_2576D2218 != -1)
    swift_once();
  v3 = *(void **)(v0 + 160);
  v4 = sub_2479BFCC8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576D26E8);
  v5 = v3;
  v6 = sub_2479BFCBC();
  v7 = sub_2479BFD4C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 160);
  if (v8)
  {
    type = v7;
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412546;
    *(_QWORD *)(v0 + 80) = v9;
    v12 = v9;
    sub_2479BFD58();
    *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_2479BFD58();
    _os_log_impl(&dword_2479B8000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2300);
    swift_arrayDestroy();
    MEMORY[0x249586F3C](v11, -1, -1);
    MEMORY[0x249586F3C](v10, -1, -1);
    v13 = *(NSObject **)(v0 + 160);
  }
  else
  {

    v13 = *(NSObject **)(v0 + 160);
    v6 = v13;
  }

  sub_2479BFB60();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2479BCEF4@<X0>(uint64_t a1@<X8>)
{
  return sub_2479BCF18(&qword_2576D2210, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2576D26D0, a1);
}

uint64_t sub_2479BCF18@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_2479BCF90()
{
  return 0;
}

uint64_t sub_2479BCFA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2479B9C18;
  return sub_2479BCB04(a1, v4);
}

uint64_t sub_2479BCFF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2479BD40C();
  *a1 = result;
  return result;
}

uint64_t sub_2479BD01C()
{
  sub_2479BC96C();
  return sub_2479BFB3C();
}

ValueMetadata *type metadata accessor for OpenCamera()
{
  return &type metadata for OpenCamera;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CameraMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraMode(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2479BD13C + 4 * byte_2479C0415[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2479BD170 + 4 * byte_2479C0410[v4]))();
}

uint64_t sub_2479BD170(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479BD178(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2479BD180);
  return result;
}

uint64_t sub_2479BD18C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2479BD194);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2479BD198(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479BD1A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2479BD1AC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2479BD1B4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CameraMode()
{
  return &type metadata for CameraMode;
}

uint64_t sub_2479BD1CC()
{
  return sub_2479BD1F8((unint64_t *)&qword_2576D2270, (uint64_t *)&unk_2576D2470, MEMORY[0x24BDB5E58]);
}

uint64_t sub_2479BD1F8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x249586EF4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2479BD238(char a1)
{
  uint64_t v2;

  sub_2479BFDAC();
  sub_2479BFD10();
  swift_bridgeObjectRelease();
  v2 = sub_2479BFDB8();
  return sub_2479BD2B4(a1, v2);
}

unint64_t sub_2479BD2B4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    v6 = 8 * a1;
    v7 = *(_QWORD *)&aRearphotfrontp[v6];
    v8 = *(_QWORD *)&aRearphotfrontp[v6 + 40];
    while (*(_QWORD *)&aRearphotfrontp[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4)] != v7
         || *(_QWORD *)&aRearphotfrontp[8 * *(char *)(*(_QWORD *)(v2 + 48) + v4) + 40] != v8)
    {
      v10 = sub_2479BFDA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v10 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t sub_2479BD3C4()
{
  unint64_t v0;

  v0 = sub_2479BFD94();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_2479BD40C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(_BYTE *, uint64_t, uint64_t, uint64_t);
  _BYTE v18[16];

  v0 = sub_2479BFC08();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576D22E0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v9 = &v18[-v8];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2480);
  MEMORY[0x24BDAC7A8](v10);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_2479BFC68();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576D22F0);
  sub_2479BFC50();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  v18[15] = 0;
  v15 = sub_2479BFB54();
  v16 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v9, 1, 1, v15);
  v16(v7, 1, 1, v15);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDB6090], v0);
  sub_2479BC73C();
  return sub_2479BFB78();
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

uint64_t sub_2479BD674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2318);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id sub_2479BD6BC()
{
  uint64_t v0;
  id result;

  v0 = sub_2479BFCC8();
  __swift_allocate_value_buffer(v0, qword_2576D26E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D26E8);
  result = SBINLogIntentExecution();
  if (result)
    return (id)sub_2479BFCD4();
  __break(1u);
  return result;
}

unint64_t sub_2479BD720()
{
  unint64_t result;

  result = qword_25444DD40;
  if (!qword_25444DD40)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0938, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD40);
  }
  return result;
}

unint64_t sub_2479BD768()
{
  unint64_t result;

  result = qword_25444DD58;
  if (!qword_25444DD58)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0970, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD58);
  }
  return result;
}

unint64_t sub_2479BD7B0()
{
  unint64_t result;

  result = qword_25444DD90;
  if (!qword_25444DD90)
  {
    result = MEMORY[0x249586EF4](&unk_2479C09A0, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD90);
  }
  return result;
}

unint64_t sub_2479BD7F8()
{
  unint64_t result;

  result = qword_2576D23F8;
  if (!qword_2576D23F8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0AD8, &type metadata for Focus.FocusQuery);
    atomic_store(result, (unint64_t *)&qword_2576D23F8);
  }
  return result;
}

uint64_t sub_2479BD83C()
{
  return MEMORY[0x24BDB6618];
}

uint64_t sub_2479BD848()
{
  uint64_t v0;

  v0 = sub_2479BFC68();
  __swift_allocate_value_buffer(v0, qword_2576D2700);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D2700);
  return sub_2479BFC50();
}

uint64_t sub_2479BD8A8()
{
  uint64_t v0;

  v0 = sub_2479BFC38();
  __swift_allocate_value_buffer(v0, qword_2576D2718);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D2718);
  return sub_2479BFC2C();
}

unint64_t sub_2479BD904()
{
  unint64_t result;

  result = qword_25444DD60;
  if (!qword_25444DD60)
  {
    result = MEMORY[0x249586EF4](&unk_2479C09D8, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD60);
  }
  return result;
}

unint64_t sub_2479BD94C()
{
  unint64_t result;

  result = qword_25444DD68;
  if (!qword_25444DD68)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0A00, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD68);
  }
  return result;
}

unint64_t sub_2479BD994()
{
  unint64_t result;

  result = qword_25444DD50;
  if (!qword_25444DD50)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0A28, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD50);
  }
  return result;
}

unint64_t sub_2479BD9DC()
{
  unint64_t result;

  result = qword_25444DD78;
  if (!qword_25444DD78)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0A80, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD78);
  }
  return result;
}

uint64_t sub_2479BDA20()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_2479BDA2C@<X0>(uint64_t a1@<X8>)
{
  return sub_2479BCF18(&qword_2576D2228, (uint64_t (*)(_QWORD))MEMORY[0x24BDB6200], (uint64_t)qword_2576D2718, a1);
}

uint64_t sub_2479BDA50()
{
  return sub_2479BD1F8(&qword_2576D2400, (uint64_t *)&unk_2576D2408, MEMORY[0x24BDB6250]);
}

uint64_t sub_2479BDA7C()
{
  sub_2479B9EF8();
  return sub_2479BFAF4();
}

unint64_t sub_2479BDAB8()
{
  unint64_t result;

  result = qword_25444DD80;
  if (!qword_25444DD80)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0AB0, &type metadata for Focus.FocusEntity);
    atomic_store(result, (unint64_t *)&qword_25444DD80);
  }
  return result;
}

uint64_t sub_2479BDAFC()
{
  sub_2479BD9DC();
  return sub_2479BFC44();
}

unint64_t sub_2479BDB38()
{
  unint64_t result;

  result = qword_25444DD28;
  if (!qword_25444DD28)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0B30, &type metadata for Focus.FocusQuery);
    atomic_store(result, (unint64_t *)&qword_25444DD28);
  }
  return result;
}

unint64_t sub_2479BDB80()
{
  unint64_t result;

  result = qword_25444DD30;
  if (!qword_25444DD30)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0B90, &type metadata for Focus.FocusQuery);
    atomic_store(result, (unint64_t *)&qword_25444DD30);
  }
  return result;
}

uint64_t sub_2479BDBC8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = a1;
  v4 = (uint64_t (__cdecl *)())((char *)&dword_2576D24A0 + dword_2576D24A0);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_2479BDC24;
  return v4();
}

uint64_t sub_2479BDC24(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v4 + 8))();
  *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_2479BDCA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  v3 = sub_2479BE68C(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

unint64_t sub_2479BDD10()
{
  unint64_t result;

  result = qword_25444DD20;
  if (!qword_25444DD20)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0BB8, &type metadata for Focus.FocusQuery);
    atomic_store(result, (unint64_t *)&qword_25444DD20);
  }
  return result;
}

unint64_t sub_2479BDD58()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2576D2438;
  if (!qword_2576D2438)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2576D2440);
    v2 = sub_2479BD994();
    result = MEMORY[0x249586EF4](MEMORY[0x24BDB6638], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2576D2438);
  }
  return result;
}

uint64_t sub_2479BDDBC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2479BD7F8();
  *v1 = v0;
  v1[1] = sub_2479BE8E4;
  return sub_2479BFB48();
}

unint64_t sub_2479BDE30()
{
  unint64_t result;

  result = qword_25444DDB8;
  if (!qword_25444DDB8)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0C64, &type metadata for Focus);
    atomic_store(result, (unint64_t *)&qword_25444DDB8);
  }
  return result;
}

unint64_t sub_2479BDE78()
{
  unint64_t result;

  result = qword_25444DDA0;
  if (!qword_25444DDA0)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0C8C, &type metadata for Focus);
    atomic_store(result, (unint64_t *)&qword_25444DDA0);
  }
  return result;
}

uint64_t sub_2479BDEBC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BDECC()
{
  sub_2479B9B68();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BDF0C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[18] = a1;
  v2[19] = a2;
  sub_2479BFD40();
  v2[20] = sub_2479BFD34();
  v2[21] = sub_2479BFD28();
  v2[22] = v3;
  return swift_task_switch();
}

uint64_t sub_2479BDF78()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  sub_2479BFB6C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = swift_retain();
  v2 = sub_2479BE944(v1);
  swift_release();
  v3 = objc_allocWithZone((Class)SBINFocusAppIntent);
  v4 = (void *)sub_2479BFCF8();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithModeIdentifier_systemContext_, v4, v2);
  v0[23] = v5;

  v6 = objc_msgSend((id)objc_opt_self(), sel_sharedSystemCoordinator);
  v0[24] = v6;
  v0[7] = v0 + 25;
  v0[2] = v0;
  v0[3] = sub_2479BE0E8;
  v0[14] = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_2479BF010;
  v0[13] = &block_descriptor_0;
  objc_msgSend(v6, sel_performAppIntent_withCompletion_, v5, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_2479BE0E8()
{
  return swift_task_switch();
}

uint64_t sub_2479BE12C()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  os_log_type_t type;

  v1 = *(void **)(v0 + 192);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 200);

  if (qword_2576D2218 != -1)
    swift_once();
  v3 = *(void **)(v0 + 184);
  v4 = sub_2479BFCC8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576D26E8);
  v5 = v3;
  v6 = sub_2479BFCBC();
  v7 = sub_2479BFD4C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 184);
  if (v8)
  {
    type = v7;
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412546;
    *(_QWORD *)(v0 + 80) = v9;
    v12 = v9;
    sub_2479BFD58();
    *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_2479BFD58();
    _os_log_impl(&dword_2479B8000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2300);
    swift_arrayDestroy();
    MEMORY[0x249586F3C](v11, -1, -1);
    MEMORY[0x249586F3C](v10, -1, -1);
    v13 = *(NSObject **)(v0 + 184);
  }
  else
  {

    v13 = *(NSObject **)(v0 + 184);
    v6 = v13;
  }

  sub_2479BFB60();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2479BE31C@<X0>(uint64_t a1@<X8>)
{
  return sub_2479BCF18(&qword_2576D2220, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2576D2700, a1);
}

uint64_t sub_2479BE340(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2479B9C18;
  return sub_2479BDF0C(a1, v4);
}

ValueMetadata *type metadata accessor for Focus()
{
  return &type metadata for Focus;
}

ValueMetadata *type metadata accessor for Focus.FocusQuery()
{
  return &type metadata for Focus.FocusQuery;
}

_QWORD *assignWithCopy for Focus.FocusEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for Focus.FocusEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2479BE4C8()
{
  return sub_2479BD1F8((unint64_t *)&qword_2576D2270, (uint64_t *)&unk_2576D2470, MEMORY[0x24BDB5E58]);
}

uint64_t sub_2479BE4F4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2479BE510(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2479BE510(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24A8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[64 * v8])
      memmove(v13, v14, v8 << 6);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[64 * v8] || v13 >= &v14[64 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2479BFD88();
  __break(1u);
  return result;
}

uint64_t sub_2479BE678()
{
  return swift_task_switch();
}

uint64_t sub_2479BE68C(uint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  unint64_t v28;
  uint64_t v29;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = 0;
    v23 = result + 32;
    v21 = (_QWORD *)(a2 + 56);
    v22 = MEMORY[0x24BEE4AF8];
    v29 = a2;
    v26 = *(_QWORD *)(result + 16);
    while (1)
    {
      if (v3 <= v2)
        v4 = v2;
      else
        v4 = v3;
      v28 = v4;
      while (1)
      {
        if (v3 == v28)
          goto LABEL_34;
        v5 = v3++;
        v6 = *(_QWORD *)(a2 + 16);
        if (!v6)
          goto LABEL_7;
        v7 = v23 + (v5 << 6);
        v8 = *(_QWORD *)v7;
        v9 = *(_QWORD *)(v7 + 8);
        v10 = *(_QWORD *)(v7 + 24);
        v24 = *(_QWORD *)(v7 + 32);
        v25 = *(_QWORD *)(v7 + 16);
        v27 = *(_OWORD *)(v7 + 40);
        v11 = *(_QWORD *)(v7 + 56);
        if (*(_QWORD *)(v29 + 32) == *(_QWORD *)v7 && *(_QWORD *)(v29 + 40) == v9)
          break;
        result = sub_2479BFDA0();
        if ((result & 1) != 0)
          break;
        if (v6 != 1)
        {
          v13 = v21;
          v14 = 1;
          while (1)
          {
            v15 = v14 + 1;
            if (__OFADD__(v14, 1))
              break;
            if (*(v13 - 1) == v8 && *v13 == v9)
              goto LABEL_25;
            result = sub_2479BFDA0();
            if ((result & 1) != 0)
              goto LABEL_25;
            v13 += 2;
            ++v14;
            if (v15 == v6)
              goto LABEL_7;
          }
          __break(1u);
LABEL_34:
          __break(1u);
          return result;
        }
LABEL_7:
        a2 = v29;
        if (v3 == v26)
          return v22;
      }
LABEL_25:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v17 = v22;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = sub_2479BE4F4(0, *(_QWORD *)(v22 + 16) + 1, 1);
        v17 = v22;
      }
      v19 = *(_QWORD *)(v17 + 16);
      v18 = *(_QWORD *)(v17 + 24);
      if (v19 >= v18 >> 1)
      {
        result = sub_2479BE4F4(v18 > 1, v19 + 1, 1);
        v17 = v22;
      }
      *(_QWORD *)(v17 + 16) = v19 + 1;
      v22 = v17;
      v20 = v17 + (v19 << 6);
      *(_QWORD *)(v20 + 32) = v8;
      *(_QWORD *)(v20 + 40) = v9;
      *(_QWORD *)(v20 + 48) = v25;
      *(_QWORD *)(v20 + 56) = v10;
      *(_QWORD *)(v20 + 64) = v24;
      *(_OWORD *)(v20 + 72) = v27;
      *(_QWORD *)(v20 + 88) = v11;
      v2 = v26;
      a2 = v29;
      if (v3 == v26)
        return v22;
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2479BE8BC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_2479BE8EC()
{
  unint64_t result;

  result = qword_25444DD08;
  if (!qword_25444DD08)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0D30, &type metadata for ToggleFlashlight);
    atomic_store(result, (unint64_t *)&qword_25444DD08);
  }
  return result;
}

id sub_2479BE930(uint64_t a1)
{
  return sub_2479BE958(a1, (void (*)(uint64_t))sub_2479BC96C, (uint64_t)&type metadata for OpenCamera);
}

id sub_2479BE944(uint64_t a1)
{
  return sub_2479BE958(a1, (void (*)(uint64_t))sub_2479B9B68, (uint64_t)&type metadata for Focus);
}

id sub_2479BE958(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v34 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24F0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2479BFB9C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v34 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24F8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v34 - v19;
  v21 = sub_2479BFBB4();
  v35 = *(_QWORD *)(v21 - 8);
  v36 = v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v34 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = a1;
  a2(v22);
  sub_2479BFB18();
  sub_2479BFB90();
  sub_2479BFBA8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_2479BF8EC((uint64_t)v7, &qword_2576D24F0);
    v25 = 0;
  }
  else
  {
    v26 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v26(v14, v7, v8);
    v26(v12, v14, v8);
    v27 = (*(uint64_t (**)(char *, uint64_t))(v9 + 88))(v12, v8);
    v25 = 2;
    if (v27 != *MEMORY[0x24BDB5B10]
      && v27 != *MEMORY[0x24BDB5B08]
      && v27 != *MEMORY[0x24BDB5B18]
      && v27 != *MEMORY[0x24BDB5B40]
      && v27 != *MEMORY[0x24BDB5B28])
    {
      if (v27 == *MEMORY[0x24BDB5AF8])
      {
        v25 = 1;
      }
      else
      {
        v25 = 2;
        if (v27 != *MEMORY[0x24BDB5B48] && v27 != *MEMORY[0x24BDB5B00])
        {
          (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
          v25 = 2;
        }
      }
    }
  }
  sub_2479BF8A4((uint64_t)v20, (uint64_t)v18);
  v28 = sub_2479BFC8C();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v18, 1, v28) != 1)
  {
    v30 = (void *)sub_2479BFC80();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v28);
  }
  v31 = objc_allocWithZone((Class)SBINAppIntentSystemContext);
  v32 = objc_msgSend(v31, sel_initWithPreciseTimestamp_actionSource_, v30, v25, v34);

  sub_2479BF8EC((uint64_t)v20, &qword_2576D24F8);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v24, v36);
  return v32;
}

id sub_2479BECBC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24F0);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2479BFB9C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24F8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  v28 = sub_2479BFBB4();
  v16 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2479BE8EC();
  sub_2479BFB18();
  sub_2479BFB90();
  sub_2479BFBA8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_2479BF8EC((uint64_t)v2, &qword_2576D24F0);
    v19 = 0;
  }
  else
  {
    v20 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v20(v9, v2, v3);
    v20(v7, v9, v3);
    v21 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
    v19 = 2;
    if (v21 != *MEMORY[0x24BDB5B10]
      && v21 != *MEMORY[0x24BDB5B08]
      && v21 != *MEMORY[0x24BDB5B18]
      && v21 != *MEMORY[0x24BDB5B40]
      && v21 != *MEMORY[0x24BDB5B28])
    {
      if (v21 == *MEMORY[0x24BDB5AF8])
      {
        v19 = 1;
      }
      else
      {
        v19 = 2;
        if (v21 != *MEMORY[0x24BDB5B48] && v21 != *MEMORY[0x24BDB5B00])
        {
          (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
          v19 = 2;
        }
      }
    }
  }
  sub_2479BF8A4((uint64_t)v15, (uint64_t)v13);
  v22 = sub_2479BFC8C();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v13, 1, v22) != 1)
  {
    v24 = (void *)sub_2479BFC80();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v22);
  }
  v25 = objc_msgSend(objc_allocWithZone((Class)SBINAppIntentSystemContext), sel_initWithPreciseTimestamp_actionSource_, v24, v19);

  sub_2479BF8EC((uint64_t)v15, &qword_2576D24F8);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v28);
  return v25;
}

uint64_t sub_2479BF010(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_2479BF024()
{
  uint64_t v0;

  v0 = sub_2479BFC68();
  __swift_allocate_value_buffer(v0, qword_2576D2730);
  __swift_project_value_buffer(v0, (uint64_t)qword_2576D2730);
  return sub_2479BFC50();
}

uint64_t sub_2479BF084(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[15] = a1;
  sub_2479BFD40();
  v1[16] = sub_2479BFD34();
  v1[17] = sub_2479BFD28();
  v1[18] = v2;
  return swift_task_switch();
}

uint64_t sub_2479BF0F0()
{
  _QWORD *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;

  sub_2479BE8EC();
  sub_2479BFB3C();
  v1 = (void *)sub_2479BFCF8();
  v0[19] = v1;
  swift_bridgeObjectRelease();
  v2 = v1;
  v3 = sub_2479BECBC();
  v4 = objc_msgSend(objc_allocWithZone((Class)SBINAppIntent), sel_initWithIdentifier_systemContext_, v2, v3);
  v0[20] = v4;

  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedSystemCoordinator);
  v0[21] = v5;
  v0[7] = v0 + 22;
  v0[2] = v0;
  v0[3] = sub_2479BF230;
  v6 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v0[11] = 0x40000000;
  v0[12] = sub_2479BF010;
  v0[13] = &block_descriptor_1;
  v0[14] = v6;
  objc_msgSend(v5, sel_performAppIntent_withCompletion_, v4, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_2479BF230()
{
  return swift_task_switch();
}

uint64_t sub_2479BF274()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  NSObject *v13;
  void *v14;
  os_log_type_t type;

  v1 = *(void **)(v0 + 168);
  swift_release();
  v2 = *(unsigned __int8 *)(v0 + 176);

  if (qword_2576D2218 != -1)
    swift_once();
  v3 = *(void **)(v0 + 160);
  v4 = sub_2479BFCC8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2576D26E8);
  v5 = v3;
  v6 = sub_2479BFCBC();
  v7 = sub_2479BFD4C();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 160);
  if (v8)
  {
    type = v7;
    v10 = swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412546;
    *(_QWORD *)(v0 + 80) = v9;
    v12 = v9;
    sub_2479BFD58();
    *v11 = v9;

    *(_WORD *)(v10 + 12) = 1024;
    *(_DWORD *)(v0 + 80) = v2;
    sub_2479BFD58();
    _os_log_impl(&dword_2479B8000, v6, type, "%@ intent performed successfully: %{BOOL}d", (uint8_t *)v10, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576D2300);
    swift_arrayDestroy();
    MEMORY[0x249586F3C](v11, -1, -1);
    MEMORY[0x249586F3C](v10, -1, -1);
    v13 = *(NSObject **)(v0 + 160);
  }
  else
  {

    v13 = *(NSObject **)(v0 + 160);
    v6 = v13;
  }
  v14 = *(void **)(v0 + 152);

  sub_2479BFB60();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2479BF47C()
{
  unint64_t result;

  result = qword_25444DD10;
  if (!qword_25444DD10)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0DC0, &type metadata for ToggleFlashlight);
    atomic_store(result, (unint64_t *)&qword_25444DD10);
  }
  return result;
}

unint64_t sub_2479BF4C4()
{
  unint64_t result;

  result = qword_25444DD00;
  if (!qword_25444DD00)
  {
    result = MEMORY[0x249586EF4](&unk_2479C0DE8, &type metadata for ToggleFlashlight);
    atomic_store(result, (unint64_t *)&qword_25444DD00);
  }
  return result;
}

uint64_t sub_2479BF508()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BF518()
{
  sub_2479BE8EC();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2479BF558@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2576D2230 != -1)
    swift_once();
  v2 = sub_2479BFC68();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2576D2730);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2479BF5C8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2479B9C18;
  return sub_2479BF084(a1);
}

uint64_t sub_2479BF618()
{
  sub_2479BE8EC();
  return sub_2479BFB3C();
}

ValueMetadata *type metadata accessor for ToggleFlashlight()
{
  return &type metadata for ToggleFlashlight;
}

unint64_t sub_2479BF654()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2576D2270;
  if (!qword_2576D2270)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2576D2470);
    result = MEMORY[0x249586EF4](MEMORY[0x24BDB5E58], v1);
    atomic_store(result, (unint64_t *)&qword_2576D2270);
  }
  return result;
}

uint64_t sub_2479BF6A0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2479BF6B0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_2479BF6E4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_2479BF704(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2479BFD58();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

_BYTE **sub_2479BF7B4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_2479BF7C4(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_2479BFD88();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_2479BF858(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_2479BF87C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_2479BF8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576D24F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2479BF8EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __getFCActivityManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBINAppIntent initWithIdentifier:systemContext:].cold.1(v0);
}

uint64_t sub_2479BFAC4()
{
  return MEMORY[0x24BDB4BE8]();
}

uint64_t sub_2479BFAD0()
{
  return MEMORY[0x24BDB4BF0]();
}

uint64_t sub_2479BFADC()
{
  return MEMORY[0x24BDB4BF8]();
}

uint64_t sub_2479BFAE8()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_2479BFAF4()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_2479BFB00()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_2479BFB0C()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_2479BFB18()
{
  return MEMORY[0x24BDB4E00]();
}

uint64_t sub_2479BFB24()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_2479BFB30()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_2479BFB3C()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_2479BFB48()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_2479BFB54()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_2479BFB60()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_2479BFB6C()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_2479BFB78()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_2479BFB84()
{
  return MEMORY[0x24BDB5518]();
}

uint64_t sub_2479BFB90()
{
  return MEMORY[0x24BDB5AF0]();
}

uint64_t sub_2479BFB9C()
{
  return MEMORY[0x24BDB5B50]();
}

uint64_t sub_2479BFBA8()
{
  return MEMORY[0x24BDB5B68]();
}

uint64_t sub_2479BFBB4()
{
  return MEMORY[0x24BDB5B70]();
}

uint64_t sub_2479BFBC0()
{
  return MEMORY[0x24BDFBB98]();
}

uint64_t sub_2479BFBCC()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_2479BFBD8()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_2479BFBE4()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_2479BFBF0()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_2479BFBFC()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_2479BFC08()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_2479BFC14()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_2479BFC20()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_2479BFC2C()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_2479BFC38()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_2479BFC44()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_2479BFC50()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_2479BFC5C()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_2479BFC68()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2479BFC74()
{
  return MEMORY[0x24BDCD3A8]();
}

uint64_t sub_2479BFC80()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2479BFC8C()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2479BFC98()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2479BFCA4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2479BFCB0()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_2479BFCBC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2479BFCC8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2479BFCD4()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2479BFCE0()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2479BFCEC()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2479BFCF8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2479BFD04()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2479BFD10()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2479BFD1C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2479BFD28()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2479BFD34()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2479BFD40()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2479BFD4C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2479BFD58()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2479BFD64()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2479BFD70()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2479BFD7C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2479BFD88()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2479BFD94()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2479BFDA0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2479BFDAC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2479BFDB8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
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

