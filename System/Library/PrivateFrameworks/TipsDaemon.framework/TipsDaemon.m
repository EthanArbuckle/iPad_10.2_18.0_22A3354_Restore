_QWORD *sub_1DAC31C20(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v25 = -1 << *(_BYTE *)(a4 + 32);
  v26 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = 16 * v15;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v15);
    v21 = v20[1];
    v22 = (uint64_t *)(*(_QWORD *)(a4 + 56) + v19);
    v24 = *v22;
    v23 = v22[1];
    *v10 = *v20;
    v10[1] = v21;
    v10[2] = v24;
    v10[3] = v23;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      sub_1DAC324C8(v24, v23);
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain();
    result = (_QWORD *)sub_1DAC324C8(v24, v23);
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v25;
      result = v26;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void sub_1DAC31E48(__int16 a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  _QWORD v8[8];
  uint64_t v9;
  __int16 v10;
  _BYTE v11[46];

  *(_QWORD *)&v11[38] = *MEMORY[0x1E0C80C00];
  v2 = sub_1DACA2D10();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DACA2D34();
  v5 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  sub_1DACA2D28();
  v10 = a1;
  sub_1DAC49610((uint64_t)&v10, (uint64_t)v11);
  v7 = (char *)&loc_1DAC31F24 + dword_1DAC99FC4[v6 >> 62];
  v8[6] = v4;
  v8[7] = v5;
  v8[5] = v6;
  __asm { BR              X10 }
}

uint64_t sub_1DAC31F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t result;

  *(_QWORD *)(v6 - 128) = v3;
  *(_WORD *)(v6 - 120) = v5;
  *(_BYTE *)(v6 - 118) = BYTE2(v5);
  *(_BYTE *)(v6 - 117) = BYTE3(v5);
  *(_BYTE *)(v6 - 116) = BYTE4(v5);
  *(_BYTE *)(v6 - 115) = BYTE5(v5);
  sub_1DAC3250C(&qword_1EDAF3578, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  sub_1DACA2D04();
  sub_1DAC33928(v3, v5);
  v7 = swift_bridgeObjectRetain();
  *(_QWORD *)(v6 - 128) = sub_1DAC448A4(v7);
  sub_1DAC451B0((_QWORD **)(v6 - 128));
  *(_QWORD *)(v6 - 192) = v0;
  if (v0)
  {
    result = swift_release();
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = *(_QWORD *)(v6 - 128);
    if (*(_QWORD *)(v8 + 16))
    {
      *(_QWORD *)(v6 - 216) = v3;
      *(_QWORD *)(v6 - 208) = v4;
      *(_QWORD *)(v6 - 200) = v1;
      swift_retain();
      *(_QWORD *)(v6 - 224) = v8;
      __asm { BR              X9 }
    }
    swift_release();
    v9 = *(_QWORD *)(v6 - 176);
    sub_1DACA2D1C();
    *(_QWORD *)(v6 - 104) = v1;
    *(_QWORD *)(v6 - 96) = sub_1DAC3250C(&qword_1EDAF3570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA92D8]);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v6 - 128));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v4 + 16))(boxed_opaque_existential_1, v9, v1);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v6 - 128), *(_QWORD *)(v6 - 104));
    sub_1DACA27E8();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v9, v1);
    v11 = *(_QWORD *)(v6 - 144);
    __swift_destroy_boxed_opaque_existential_1(v6 - 128);
    sub_1DAC33928(v3, *(_QWORD *)(v6 - 184));
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 168) + 8))(v2, *(_QWORD *)(v6 - 160));
    return v11;
  }
  return result;
}

uint64_t sub_1DAC324C8(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_1DAC3250C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0A60C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_BYTE *sub_1DAC3254C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_1DAC49BAC(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1DAC759A0((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1DAC325C0((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1DAC325C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1DACA27DC();
  swift_allocObject();
  result = sub_1DACA27A0();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1DAC32A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAC32EC8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  uint64_t v26;

  v6 = *a1;
  v5 = a1[1];
  if (!a2 || !*(_QWORD *)(a2 + 16))
    goto LABEL_15;
  swift_bridgeObjectRetain();
  v9 = sub_1DAC331BC(v6, v5);
  if ((v10 & 1) == 0
    || (v11 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v9),
        v12 = *v11,
        v13 = v11[1],
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        !a3)
    || !*(_QWORD *)(a3 + 16)
    || (sub_1DAC331BC(v12, v13), (v14 & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_15:
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v23 = (id)sub_1DAC36AB4(v6, v5);
    swift_endAccess();
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_unknownObjectRetain();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35B8);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_15;
  sub_1DAC339C4(v25);
  swift_bridgeObjectRelease();
  v15 = objc_allocWithZone((Class)TPSContextualInfo);
  v16 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithDictionary_, v16);

  if (!v17)
    goto LABEL_15;
  v18 = objc_msgSend(v17, sel_usageEvents);
  if (!v18)
    goto LABEL_17;
  v19 = v18;
  sub_1DAC3757C(0, &qword_1EDAF2E28);
  v20 = sub_1DACA2E3C();

  if (v20 >> 62)
  {
    swift_bridgeObjectRetain();
    v21 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v21)
  {
LABEL_17:

    goto LABEL_15;
  }
  v22 = (uint64_t *)(a4 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v23 = v17;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v26 = *v22;
  *v22 = 0x8000000000000000;
  sub_1DAC37420((uint64_t)v23, v6, v5, isUniquelyReferenced_nonNull_native);
  *v22 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_16:

}

unint64_t sub_1DAC331BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DACA3250();
  sub_1DACA2DD0();
  v4 = sub_1DACA3274();
  return sub_1DAC33220(a1, a2, v4);
}

unint64_t sub_1DAC33220(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1DACA31B4() & 1) == 0)
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
      while (!v14 && (sub_1DACA31B4() & 1) == 0);
    }
  }
  return v6;
}

void *sub_1DAC33300()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v1 = v0;
  v39 = *MEMORY[0x1E0C80C00];
  v2 = sub_1DACA2D10();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_1DACA2DB8();
  v34 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DACA2D34();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v31 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DACA2D28();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36D0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DACA6F40;
  *(_QWORD *)(inited + 32) = swift_getKeyPath();
  *(_QWORD *)(inited + 40) = swift_getKeyPath();
  *(_QWORD *)(inited + 48) = swift_getKeyPath();
  v36 = inited;
  sub_1DACA2E54();
  v12 = v36;
  v33 = v36 & 0xC000000000000001;
  if ((v36 & 0xC000000000000001) == 0 && *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10) < 3uLL)
    __break(1u);
  v25 = v9;
  v26 = v5;
  v27 = v3;
  v28 = v2;
  v13 = 0;
  v29 = v8;
  v14 = v30;
  v32 = v36;
  do
  {
    if (v33)
      MEMORY[0x1DF0A5770](v13, v12);
    else
      swift_retain();
    v35 = v1;
    v15 = v1;
    swift_getAtKeyPath();

    sub_1DACA2DAC();
    sub_1DACA2DA0();
    v17 = v16;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v34 + 8))(v7, v14);
    if (v17 >> 60 != 15)
      __asm { BR              X9 }
    swift_release();
    ++v13;
    v12 = v32;
  }
  while (v13 != 3);
  swift_bridgeObjectRelease();
  v18 = v26;
  v19 = v31;
  sub_1DACA2D1C();
  v20 = v28;
  v37 = v28;
  v38 = sub_1DAC3250C(&qword_1EDAF3570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA92D8]);
  v21 = __swift_allocate_boxed_opaque_existential_1(&v36);
  v22 = v27;
  (*(void (**)(uint64_t *, char *, uint64_t))(v27 + 16))(v21, v18, v20);
  __swift_project_boxed_opaque_existential_1(&v36, v37);
  sub_1DACA27E8();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v18, v20);
  v23 = v35;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v36);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v19, v8);
  return v23;
}

uint64_t sub_1DAC33928(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DAC3396C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DAC33928(a1, a2);
  return a1;
}

unint64_t sub_1DAC33980()
{
  unint64_t result;

  result = qword_1EDAF3580;
  if (!qword_1EDAF3580)
  {
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDAF3580);
  }
  return result;
}

uint64_t sub_1DAC339C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3670);
    v2 = sub_1DACA3118();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1DAC33D7C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1DAC33D7C(v35, v36);
    sub_1DAC33D7C(v36, &v32);
    result = sub_1DACA3004();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_1DAC33D7C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1DAC75BE8();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

_OWORD *sub_1DAC33D7C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1DAC3491C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id location,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a68;

  _Block_object_dispose(&a68, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC34FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1DAC36AB4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1DAC331BC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1DAC850D0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_1DAC84510(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

void sub_1DAC37420(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1DAC331BC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1DAC850D0();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_1DAC83BD4(v15, a4 & 1);
  v20 = sub_1DAC331BC(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_1DACA3208();
  __break(1u);
}

uint64_t sub_1DAC3757C(uint64_t a1, unint64_t *a2)
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

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t sub_1DAC378E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F8);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = a5;
  v19[3] = a6;
  v19[4] = v18;
  v19[5] = a7;
  v19[6] = a8;
  v19[7] = a1;
  v19[8] = a2;
  switch(a3)
  {
    case 9:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1DACA2EA8();
      break;
    case 17:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1DACA2EC0();
      break;
    case 25:
    case 33:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1DACA2EB4();
      break;
    default:
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      sub_1DACA2ECC();
      break;
  }
  v20 = sub_1DACA2EE4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 0, 1, v20);
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_1F028C320;
  v21[5] = v19;
  sub_1DAC91E38((uint64_t)v17, (uint64_t)&unk_1F028C330, (uint64_t)v21);
  return swift_release();
}

id sub_1DAC37AD8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  _QWORD v11[6];

  v7 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a2;
  v8[3] = a3;
  v8[4] = v7;
  v11[4] = sub_1DAC4841C;
  v11[5] = v8;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 1107296256;
  v11[2] = sub_1DAC4542C;
  v11[3] = &block_descriptor_80;
  v9 = _Block_copy(v11);
  sub_1DAC37C20(a2);
  swift_retain();
  sub_1DAC37C20((uint64_t)sub_1DAC4841C);
  swift_release();
  objc_msgSend(a1, sel_setCompletionBlock_, v9);
  _Block_release(v9);
  swift_release();
  swift_release();
  return objc_msgSend(*(id *)(v3 + OBJC_IVAR___TPSSearchItemIndexer_queue), sel_addOperation_, a1);
}

uint64_t sub_1DAC37C20(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1DAC37C6C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 264) = a3;
  *(_QWORD *)(v4 + 272) = v3;
  *(_BYTE *)(v4 + 473) = a2;
  *(_QWORD *)(v4 + 256) = a1;
  type metadata accessor for UserGuideIndexItem(0);
  *(_QWORD *)(v4 + 280) = swift_task_alloc();
  v5 = sub_1DACA2C14();
  *(_QWORD *)(v4 + 288) = v5;
  *(_QWORD *)(v4 + 296) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 304) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC37CF4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DAC37D68()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v7;
  uint64_t (*v8)(void);

  v1 = *(_QWORD *)(v0 + 80) + 16;
  v2 = objc_allocWithZone(MEMORY[0x1E0DBF3F0]);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 144) = objc_msgSend(v2, sel_initWithTransactionName_, v3);

  swift_beginAccess();
  v4 = MEMORY[0x1DF0A6220](v1);
  *(_QWORD *)(v0 + 152) = v4;
  if (v4)
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v5;
    *v5 = v0;
    v5[1] = sub_1DAC48324;
    return sub_1DAC4821C();
  }
  else
  {
    v8 = (uint64_t (*)(void))(**(int **)(v0 + 88) + *(_QWORD *)(v0 + 88));
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v7;
    *v7 = v0;
    v7[1] = sub_1DAC482C0;
    return v8();
  }
}

uint64_t sub_1DAC37E8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1DAC483D0;
  return sub_1DAC37F20(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1DAC37F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[13] = a7;
  v8[14] = a8;
  v8[11] = a5;
  v8[12] = a6;
  v8[9] = a3;
  v8[10] = a4;
  v8[8] = a2;
  v9 = sub_1DACA2C14();
  v8[15] = v9;
  v8[16] = *(_QWORD *)(v9 - 8);
  v8[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC37F8C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1DAC378E4(a1, a2, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1DAC381D0(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v17;

  v2 = sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  if (!(a1 >> 62))
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_10:
    swift_bridgeObjectRelease();
    return v2;
  }
  swift_bridgeObjectRetain();
  result = sub_1DACA30E8();
  v3 = result;
  if (!result)
    goto LABEL_10;
LABEL_3:
  if (v3 >= 1)
  {
    v5 = 0;
    v17 = a1 & 0xC000000000000001;
    v6 = a1;
    do
    {
      if (v17)
        v7 = (id)MEMORY[0x1DF0A5770](v5, a1);
      else
        v7 = *(id *)(a1 + 8 * v5 + 32);
      v8 = v7;
      ++v5;
      v9 = objc_msgSend(v7, sel_identifier, v17);
      v10 = sub_1DACA2D94();
      v12 = v11;

      v13 = sub_1DAC33300();
      v15 = v14;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1DAC38344((uint64_t)v13, v15, v10, v12, isUniquelyReferenced_nonNull_native);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      a1 = v6;
    }
    while (v3 != v5);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC38344(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1DAC331BC(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1DAC8542C();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7] + 16 * v14;
      result = sub_1DAC33928(*(_QWORD *)v21, *(_QWORD *)(v21 + 8));
      *(_QWORD *)v21 = a1;
      *(_QWORD *)(v21 + 8) = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1DAC384B8(v17, a5 & 1);
  v23 = sub_1DAC331BC(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DACA3208();
  __break(1u);
  return result;
}

uint64_t sub_1DAC384B8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  __int128 v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3648);
  v6 = a2;
  v7 = sub_1DACA310C();
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v21 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v22 = v21 | (v14 << 6);
      }
      else
      {
        v23 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v23 >= v35)
          goto LABEL_33;
        v24 = v36[v23];
        ++v14;
        if (!v24)
        {
          v14 = v23 + 1;
          if (v23 + 1 >= v35)
            goto LABEL_33;
          v24 = v36[v14];
          if (!v24)
          {
            v25 = v23 + 2;
            if (v25 >= v35)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v6 & 1) != 0)
              {
                v34 = 1 << *(_BYTE *)(v5 + 32);
                if (v34 >= 64)
                  bzero(v36, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v34;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v24 = v36[v25];
            if (!v24)
            {
              while (1)
              {
                v14 = v25 + 1;
                if (__OFADD__(v25, 1))
                  goto LABEL_40;
                if (v14 >= v35)
                  goto LABEL_33;
                v24 = v36[v14];
                ++v25;
                if (v24)
                  goto LABEL_30;
              }
            }
            v14 = v25;
          }
        }
LABEL_30:
        v11 = (v24 - 1) & v24;
        v22 = __clz(__rbit64(v24)) + (v14 << 6);
      }
      v30 = 16 * v22;
      v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v30);
      v33 = *v31;
      v32 = v31[1];
      v37 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v30);
      if ((v6 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        sub_1DAC324C8(v37, *((unint64_t *)&v37 + 1));
      }
      sub_1DACA3250();
      sub_1DACA2DD0();
      result = sub_1DACA3274();
      v15 = -1 << *(_BYTE *)(v8 + 32);
      v16 = result & ~v15;
      v17 = v16 >> 6;
      if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
      {
        v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v15) >> 6;
        do
        {
          if (++v17 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v17 == v27;
          if (v17 == v27)
            v17 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v12 + 8 * v17);
        }
        while (v29 == -1);
        v18 = __clz(__rbit64(~v29)) + (v17 << 6);
      }
      *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
      v19 = 16 * v18;
      v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
      *v20 = v33;
      v20[1] = v32;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + v19) = v37;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
  *v3 = v8;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0A60AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

void sub_1DAC38874(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(*a1, *a2);
  v5 = sub_1DACA2D94();
  v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

id getHMClientConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getHMClientConnectionClass_softClass_1;
  v7 = getHMClientConnectionClass_softClass_1;
  if (!getHMClientConnectionClass_softClass_1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHMClientConnectionClass_block_invoke_1;
    v3[3] = &unk_1EA1DF510;
    v3[4] = &v4;
    __getHMClientConnectionClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DAC39474(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC397FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC39A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1DAC3B03C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3B160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3B284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3B660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3BA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3CC20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAC3D3B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id a27)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a27);
  _Unwind_Resume(a1);
}

void sub_1DAC3DFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;

  _Block_object_dispose(&a71, 8);
  _Block_object_dispose(&STACK[0x210], 8);
  _Block_object_dispose(&STACK[0x230], 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3EB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3EF0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3F0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC3FC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,char a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1DAC4018C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,char a52)
{
  id *v52;
  id *v53;
  uint64_t v54;

  objc_destroyWeak(v53);
  objc_destroyWeak(v52);
  objc_destroyWeak(location);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a52, 8);
  _Block_object_dispose((const void *)(v54 - 232), 8);
  _Block_object_dispose((const void *)(v54 - 176), 8);
  objc_destroyWeak((id *)(v54 - 184));
  _Unwind_Resume(a1);
}

void sub_1DAC41464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *a14, id *a15, uint64_t a16, id *location)
{
  uint64_t v17;

  objc_destroyWeak(location);
  _Block_object_dispose(&STACK[0x340], 8);
  objc_destroyWeak(a15);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x490], 8);
  _Block_object_dispose(&STACK[0x4C0], 8);
  _Block_object_dispose(&STACK[0x4F0], 8);
  _Block_object_dispose(&STACK[0x520], 8);
  _Block_object_dispose(&STACK[0x550], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Block_object_dispose(&STACK[0x600], 8);
  _Block_object_dispose(&STACK[0x630], 8);
  _Block_object_dispose(&STACK[0x6C8], 8);
  _Block_object_dispose(&STACK[0x6F8], 8);
  _Block_object_dispose(&STACK[0x728], 8);
  _Block_object_dispose(&STACK[0x758], 8);
  _Block_object_dispose(&STACK[0x788], 8);
  _Block_object_dispose(&STACK[0x7B8], 8);
  _Block_object_dispose(&STACK[0x828], 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v17 - 168));
  _Unwind_Resume(a1);
}

void sub_1DAC419D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  id *v28;

  _Block_object_dispose(&a28, 8);
  objc_destroyWeak(v28);
  _Unwind_Resume(a1);
}

void sub_1DAC41CDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC41E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC420A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC425B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose((const void *)(v28 - 80), 8);
  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC42EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DAC434E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC439E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC43DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

uint64_t objectdestroyTm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t objectdestroyTm_0()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_3Tm_0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1DAC447B0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

_QWORD *sub_1DAC447C0(uint64_t a1, uint64_t *a2, uint64_t (*a3)(uint64_t *, _QWORD *, uint64_t, uint64_t))
{
  uint64_t v3;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v6 = (_QWORD *)swift_allocObject();
  v7 = _swift_stdlib_malloc_size(v6);
  v8 = v7 - 32;
  if (v7 < 32)
    v8 = v7 - 1;
  v6[2] = v3;
  v6[3] = 2 * (v8 >> 5);
  v9 = a3(&v11, v6 + 4, v3, a1);
  swift_bridgeObjectRetain();
  sub_1DAC75BE8();
  if (v9 != v3)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v6;
}

_QWORD *sub_1DAC448A4(uint64_t a1)
{
  return sub_1DAC447C0(a1, &qword_1EDAF36A8, (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, uint64_t))sub_1DAC31C20);
}

char *sub_1DAC448B8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_1DAC449B8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1DAC448B8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1DAC449D4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v40;
  __int128 v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  unint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  BOOL v67;
  uint64_t v68;
  char v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD *v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;

  v3 = a1[1];
  result = sub_1DACA3190();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_1DAC45218(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v103 = result;
  v100 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    v106 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v10 = MEMORY[0x1E0DEE9D8];
LABEL_117:
      result = v10;
      v102 = v7;
      if (v11 >= 2)
      {
        v92 = *v100;
        do
        {
          v93 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v92)
            goto LABEL_159;
          v94 = result;
          v95 = *(_QWORD *)(result + 32 + 16 * v93);
          v96 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_1DAC749D0((char *)(v92 + 32 * v95), (char *)(v92 + 32 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v92 + 32 * v96, v106);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1DAC74CF4(v94);
            v94 = result;
          }
          if (v93 >= *(_QWORD *)(v94 + 16))
            goto LABEL_148;
          v97 = (_QWORD *)(v94 + 32 + 16 * v93);
          *v97 = v95;
          v97[1] = v96;
          v98 = *(_QWORD *)(v94 + 16);
          if (v11 > v98)
            goto LABEL_149;
          memmove((void *)(v94 + 32 + 16 * (v11 - 1)), (const void *)(v94 + 32 + 16 * v11), 16 * (v98 - v11));
          result = v94;
          *(_QWORD *)(v94 + 16) = v98 - 1;
          v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v102 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v102 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35C8);
    result = sub_1DACA2E6C();
    *(_QWORD *)(result + 16) = v6;
    v102 = result;
    v106 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v101 = *a1 + 8;
  v99 = *a1 - 32;
  v10 = MEMORY[0x1E0DEE9D8];
  v104 = v3;
  v105 = v9;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 32 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_1DACA31B4();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v101 + 32 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_1DACA31B4();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 4;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 32 * v18;
        v24 = 32 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = (_OWORD *)(v9 + v24);
            v28 = v9 + v23;
            v29 = *(_QWORD *)(v9 + v24);
            v30 = *(_QWORD *)(v9 + v24 + 8);
            v31 = *(_OWORD *)(v9 + v24 + 16);
            v32 = *(_OWORD *)(v9 + v23 - 16);
            *v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(_QWORD *)(v28 - 32) = v29;
            *(_QWORD *)(v28 - 24) = v30;
            *(_OWORD *)(v28 - 16) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v103)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1DAC74BFC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v43 = *(_QWORD *)(v10 + 16);
    v42 = *(_QWORD *)(v10 + 24);
    v11 = v43 + 1;
    if (v43 >= v42 >> 1)
    {
      result = (uint64_t)sub_1DAC74BFC((char *)(v42 > 1), v43 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v44 = v10 + 32;
    v45 = (uint64_t *)(v10 + 32 + 16 * v43);
    *v45 = v12;
    v45[1] = v8;
    if (v43)
    {
      v9 = v105;
      while (1)
      {
        v46 = v11 - 1;
        if (v11 >= 4)
        {
          v51 = v44 + 16 * v11;
          v52 = *(_QWORD *)(v51 - 64);
          v53 = *(_QWORD *)(v51 - 56);
          v57 = __OFSUB__(v53, v52);
          v54 = v53 - v52;
          if (v57)
            goto LABEL_134;
          v56 = *(_QWORD *)(v51 - 48);
          v55 = *(_QWORD *)(v51 - 40);
          v57 = __OFSUB__(v55, v56);
          v49 = v55 - v56;
          v50 = v57;
          if (v57)
            goto LABEL_135;
          v58 = v11 - 2;
          v59 = (uint64_t *)(v44 + 16 * (v11 - 2));
          v61 = *v59;
          v60 = v59[1];
          v57 = __OFSUB__(v60, v61);
          v62 = v60 - v61;
          if (v57)
            goto LABEL_136;
          v57 = __OFADD__(v49, v62);
          v63 = v49 + v62;
          if (v57)
            goto LABEL_138;
          if (v63 >= v54)
          {
            v81 = (uint64_t *)(v44 + 16 * v46);
            v83 = *v81;
            v82 = v81[1];
            v57 = __OFSUB__(v82, v83);
            v84 = v82 - v83;
            if (v57)
              goto LABEL_144;
            v74 = v49 < v84;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v75 = *(_QWORD *)(v10 + 32);
            v76 = *(_QWORD *)(v10 + 40);
            v57 = __OFSUB__(v76, v75);
            v68 = v76 - v75;
            v69 = v57;
            goto LABEL_98;
          }
          v48 = *(_QWORD *)(v10 + 32);
          v47 = *(_QWORD *)(v10 + 40);
          v57 = __OFSUB__(v47, v48);
          v49 = v47 - v48;
          v50 = v57;
        }
        if ((v50 & 1) != 0)
          goto LABEL_137;
        v58 = v11 - 2;
        v64 = (uint64_t *)(v44 + 16 * (v11 - 2));
        v66 = *v64;
        v65 = v64[1];
        v67 = __OFSUB__(v65, v66);
        v68 = v65 - v66;
        v69 = v67;
        if (v67)
          goto LABEL_139;
        v70 = (uint64_t *)(v44 + 16 * v46);
        v72 = *v70;
        v71 = v70[1];
        v57 = __OFSUB__(v71, v72);
        v73 = v71 - v72;
        if (v57)
          goto LABEL_141;
        if (__OFADD__(v68, v73))
          goto LABEL_143;
        if (v68 + v73 >= v49)
        {
          v74 = v49 < v73;
LABEL_104:
          if (v74)
            v46 = v58;
          goto LABEL_106;
        }
LABEL_98:
        if ((v69 & 1) != 0)
          goto LABEL_140;
        v77 = (uint64_t *)(v44 + 16 * v46);
        v79 = *v77;
        v78 = v77[1];
        v57 = __OFSUB__(v78, v79);
        v80 = v78 - v79;
        if (v57)
          goto LABEL_142;
        if (v80 < v68)
          goto LABEL_15;
LABEL_106:
        v85 = v46 - 1;
        if (v46 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9)
          goto LABEL_157;
        v86 = v9;
        v87 = (uint64_t *)(v44 + 16 * v85);
        v88 = *v87;
        v89 = (_QWORD *)(v44 + 16 * v46);
        v90 = v89[1];
        result = sub_1DAC749D0((char *)(v86 + 32 * *v87), (char *)(v86 + 32 * *v89), v86 + 32 * v90, v106);
        if (v1)
          goto LABEL_114;
        if (v90 < v88)
          goto LABEL_131;
        if (v46 > *(_QWORD *)(v10 + 16))
          goto LABEL_132;
        *v87 = v88;
        *(_QWORD *)(v44 + 16 * v85 + 8) = v90;
        v91 = *(_QWORD *)(v10 + 16);
        if (v46 >= v91)
          goto LABEL_133;
        v11 = v91 - 1;
        result = (uint64_t)memmove((void *)(v44 + 16 * v46), v89 + 2, 16 * (v91 - 1 - v46));
        *(_QWORD *)(v10 + 16) = v91 - 1;
        v74 = v91 > 2;
        v9 = v105;
        if (!v74)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v105;
LABEL_15:
    v3 = v104;
    if (v8 >= v104)
    {
      v7 = v102;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v103))
    goto LABEL_153;
  if (v12 + v103 >= v3)
    v33 = v3;
  else
    v33 = v12 + v103;
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      v34 = v99 + 32 * v8;
      do
      {
        v35 = (uint64_t *)(v9 + 32 * v8);
        result = *v35;
        v36 = v35[1];
        v37 = v12;
        v38 = v34;
        do
        {
          if (result == *(_QWORD *)v38 && v36 == *(_QWORD *)(v38 + 8))
            break;
          result = sub_1DACA31B4();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          result = *(_QWORD *)(v38 + 32);
          v36 = *(_QWORD *)(v38 + 40);
          v40 = *(_OWORD *)(v38 + 48);
          v41 = *(_OWORD *)(v38 + 16);
          *(_OWORD *)(v38 + 32) = *(_OWORD *)v38;
          *(_OWORD *)(v38 + 48) = v41;
          *(_QWORD *)v38 = result;
          *(_QWORD *)(v38 + 8) = v36;
          *(_OWORD *)(v38 + 16) = v40;
          v38 -= 32;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 32;
      }
      while (v8 != v33);
      v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

void sub_1DAC45080(uint64_t a1)
{
  uint64_t v1;

  sub_1DAC45088(a1, *(_QWORD *)(v1 + 16));
}

void sub_1DAC45088(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1DACA2818();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

unint64_t sub_1DAC450D4()
{
  unint64_t result;

  result = qword_1EDAF3630;
  if (!qword_1EDAF3630)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDAF3630);
  }
  return result;
}

uint64_t sub_1DAC45110(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = a2;
    v9 = sub_1DACA2944();
    v11 = v10;

    v12 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

uint64_t sub_1DAC451B0(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DAC75320(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_1DAC449D4(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1DAC45218(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  __int128 v14;
  __int128 v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 32 * a3 - 32;
LABEL_5:
    v9 = (uint64_t *)(v7 + 32 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = v8;
    while (1)
    {
      v13 = result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8);
      if (v13 || (result = sub_1DACA31B4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *(_QWORD *)(v12 + 32);
      v10 = *(_QWORD *)(v12 + 40);
      v14 = *(_OWORD *)(v12 + 48);
      v15 = *(_OWORD *)(v12 + 16);
      *(_OWORD *)(v12 + 32) = *(_OWORD *)v12;
      *(_OWORD *)(v12 + 48) = v15;
      *(_QWORD *)v12 = result;
      *(_QWORD *)(v12 + 8) = v10;
      *(_OWORD *)(v12 + 16) = v14;
      v12 -= 32;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_1DAC452E8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3648);
  v2 = (_QWORD *)sub_1DACA3118();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v7 = *(v4 - 1);
    v8 = *v4;
    swift_bridgeObjectRetain();
    sub_1DAC324C8(v7, v8);
    result = sub_1DAC331BC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (uint64_t *)(v2[7] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

uint64_t sub_1DAC4540C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1DAC4542C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1DAC45458(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_1DAC45478()
{
  uint64_t *v0;

  sub_1DAC45484(v0[2], v0[3], v0[4], v0[5]);
}

void sub_1DAC45484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  id v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[4];

  v8 = sub_1DACA2BCC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1DAC458A0();
  v12 = *(_QWORD *)(a2 + 16);
  if (v12)
  {
    v22 = v8;
    swift_bridgeObjectRetain();
    v13 = (uint64_t *)(a2 + 40);
    do
    {
      v14 = *v13;
      v23[0] = *(v13 - 1);
      v23[1] = v14;
      swift_bridgeObjectRetain();
      sub_1DAC32EC8(v23, a3, a4, a1);
      swift_bridgeObjectRelease();
      v13 += 2;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    v8 = v22;
  }
  v15 = *(void **)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *v11 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x1E0DEF740], v8);
  v16 = v15;
  v17 = sub_1DACA2BD8();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v11, v8);
  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_opt_self();
    swift_beginAccess();
    sub_1DAC3757C(0, &qword_1EDAF3620);
    swift_bridgeObjectRetain();
    v19 = (void *)sub_1DACA2D40();
    swift_bridgeObjectRelease();
    v20 = (void *)sub_1DACA2D88();
    objc_msgSend(v18, sel_archivedDataWithRootObject_forKey_, v19, v20);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall TPSFullTipUsageEventManager.updateContextualInfo(for:tipsDeliveryInfoMap:deliveryInfoMap:)(Swift::OpaquePointer a1, Swift::OpaquePointer_optional tipsDeliveryInfoMap, Swift::OpaquePointer_optional deliveryInfoMap)
{
  char *v3;
  void *v4;
  void *rawValue;
  NSObject *v7;
  Swift::OpaquePointer *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD v13[6];

  v4 = *(void **)&tipsDeliveryInfoMap.is_nil;
  rawValue = tipsDeliveryInfoMap.value._rawValue;
  v7 = *(NSObject **)&v3[OBJC_IVAR___TPSFullTipUsageEventManager_queue];
  v8 = (Swift::OpaquePointer *)swift_allocObject();
  v8[2]._rawValue = v3;
  v8[3]._rawValue = a1._rawValue;
  v8[4]._rawValue = rawValue;
  v8[5]._rawValue = v4;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_1DAC45478;
  *(_QWORD *)(v9 + 24) = v8;
  v13[4] = sub_1DAC4540C;
  v13[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 1107296256;
  v13[2] = sub_1DAC45458;
  v13[3] = &block_descriptor;
  v10 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  v11 = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_release();
  dispatch_sync(v7, v10);
  _Block_release(v10);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
}

uint64_t sub_1DAC458A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  uint64_t result;
  uint64_t inited;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unint64_t v16;
  unint64_t *v17;
  _QWORD v18[5];

  v1 = sub_1DACA2BCC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (_QWORD *)((char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF740], v1);
  v6 = v5;
  LOBYTE(v5) = sub_1DACA2BD8();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    if ((*(_BYTE *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_initialized) & 1) == 0)
    {
      *(_BYTE *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_initialized) = 1;
      sub_1DAC7E880();
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1DACA7510;
      *(_QWORD *)(inited + 32) = sub_1DAC3757C(0, &qword_1EDAF3600);
      *(_QWORD *)(inited + 40) = sub_1DAC3757C(0, &qword_1EDAF3640);
      *(_QWORD *)(inited + 48) = sub_1DAC3757C(0, &qword_1EDAF3620);
      sub_1DAC71000(inited);
      swift_setDeallocating();
      v9 = objc_allocWithZone(MEMORY[0x1E0C99E60]);
      v10 = (void *)sub_1DACA2E30();
      swift_bridgeObjectRelease();
      v11 = objc_msgSend(v9, sel_initWithArray_, v10);

      v18[1] = 0;
      sub_1DACA2F08();

      v12 = (void *)objc_opt_self();
      v13 = (void *)sub_1DACA2EFC();
      swift_bridgeObjectRelease();
      v14 = (void *)sub_1DACA2D88();
      v15 = objc_msgSend(v12, sel_unarchivedObjectOfClasses_forKey_, v13, v14);

      sub_1DACA2FE0();
      swift_unknownObjectRelease();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35A8);
      if (swift_dynamicCast())
        v16 = v18[0];
      else
        v16 = sub_1DAC766C0(MEMORY[0x1E0DEE9D8]);
      v17 = (unint64_t *)(v0 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
      swift_beginAccess();
      *v17 = v16;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1DAC45B80(uint64_t a1, uint64_t a2)
{
  sub_1DAC45B94(a1, a2);
}

void sub_1DAC45B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = sub_1DACA2C14();
  MEMORY[0x1E0C80A78](v3);
  __asm { BR              X10 }
}

uint64_t sub_1DAC45C14()
{
  void (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t (*v2)(_QWORD);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((v1 & 0xFF000000000000) != 0)
  {
    sub_1DACA2764();
    swift_allocObject();
    sub_1DACA2758();
    sub_1DAC47D08();
    sub_1DACA274C();
    swift_release();
    return *(unsigned __int16 *)(v6 - 88);
  }
  else
  {
    sub_1DACA2BFC();
    sub_1DACA2C98();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v3);
    v7 = v2(MEMORY[0x1E0DEE9D8]);
    v8 = 2;
    v0(2, v7);
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t type metadata accessor for UserGuideIndexHelper()
{
  return objc_opt_self();
}

uint64_t sub_1DAC45E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  _QWORD *v17;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  v4 = sub_1DACA2CC8();
  v6 = v5;
  *(_QWORD *)(v0 + 128) = v4;
  *(_QWORD *)(v0 + 136) = v5;
  sub_1DAC49C6C(v3);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  *(_QWORD *)(v0 + 144) = v7;
  if (v7(v3, 1, v1) == 1)
  {
    v9 = *(_QWORD *)(v0 + 48);
    v8 = *(_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 40);
    sub_1DAC7190C(*(_QWORD *)(v0 + 88), &qword_1EDAF3010);
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    sub_1DAC7EFFC();
    swift_allocError();
    *(_QWORD *)v11 = v4;
    *(_QWORD *)(v11 + 8) = v6;
    *(_BYTE *)(v11 + 16) = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 120);
    v14 = *(_QWORD *)(v0 + 96);
    v15 = *(_QWORD *)(v0 + 88);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 104) + 32);
    *(_QWORD *)(v0 + 152) = v16;
    v16(v13, v15, v14);
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v17;
    *v17 = v0;
    v17[1] = sub_1DAC79E20;
    return sub_1DAC465D4(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 120));
  }
}

uint64_t sub_1DAC46018(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_1DACA2C14();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(0);
  v3[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  v5 = sub_1DACA28E4();
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = swift_task_alloc();
  v3[15] = swift_task_alloc();
  return swift_task_switch();
}

void sub_1DAC4610C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void **v33;
  _QWORD aBlock[6];

  v33 = a2;
  v29 = a4;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F0);
  v5 = *(_QWORD *)(v30 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v30);
  v7 = sub_1DACA28E4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1DACA2740();
  v31 = *(_QWORD *)(v11 - 8);
  v32 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  sub_1DACA2734();
  sub_1DACA2878();
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v14)
  {
    v15 = v14;
    v28 = sub_1DACA2728();
    v27 = sub_1DACA2D88();
    swift_bridgeObjectRelease();
    sub_1DACA2D94();
    v16 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    v17 = *MEMORY[0x1E0CB3338];
    v18 = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v29, v30);
    v19 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v20 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v20 + v19, (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v18);
    aBlock[4] = sub_1DAC7F100;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DAC90E0C;
    aBlock[3] = &block_descriptor_18;
    v21 = _Block_copy(aBlock);
    swift_release();
    v23 = (void *)v27;
    v22 = (void *)v28;
    LODWORD(v24) = v17;
    v25 = objc_msgSend(v15, sel_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler_, v28, v27, 0, v16, v21, v24);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v32);
    v26 = *v33;
    *v33 = v25;

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DAC463E4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_BYTE *)(v0 + 72) & 1;
  *(_QWORD *)(v0 + 32) = 0;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v3 + 16) = v0 + 32;
  *(_QWORD *)(v3 + 24) = v1;
  *(_BYTE *)(v3 + 32) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_1DAC7E8CC;
  return sub_1DACA31D8();
}

uint64_t sub_1DAC464A8(uint64_t a1, char a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 72) = a2;
  *(_QWORD *)(v2 + 40) = a1;
  return swift_task_switch();
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(uint64_t a1)
{
  return sub_1DAC37CF4(a1, (uint64_t *)&unk_1EDAF3470);
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(uint64_t a1)
{
  return sub_1DAC37CF4(a1, qword_1EDAF31F0);
}

uint64_t sub_1DAC464EC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  v1 = v0[11];
  v2 = v0[8];
  v3 = v0[9];
  sub_1DACA2BFC();
  sub_1DACA286C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = swift_task_alloc();
  v0[13] = v5;
  *(_QWORD *)v5 = v0;
  *(_QWORD *)(v5 + 8) = sub_1DAC7A284;
  v6 = v0[4];
  *(_BYTE *)(v5 + 72) = 0;
  *(_QWORD *)(v5 + 40) = v6;
  return swift_task_switch();
}

uint64_t sub_1DAC465D4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v2[5] = swift_task_alloc();
  v2[6] = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(0);
  v2[7] = swift_task_alloc();
  v3 = sub_1DACA2C14();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC4668C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22[4];

  v22[3] = *(id *)MEMORY[0x1E0C80C00];
  v0 = sub_1DACA2C14();
  v19 = *(_QWORD *)(v0 - 8);
  v20 = v0;
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v18 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1DACA280C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DACA28E4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAC46974();
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v12 = (void *)sub_1DACA2890();
  v22[0] = 0;
  v13 = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v22);

  if (v13)
  {
    v14 = v22[0];
    sub_1DACA2800();
    sub_1DACA27F4();
    sub_1DACA2884();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    v15 = v22[0];
    v16 = (void *)sub_1DACA2824();

    swift_willThrow();
    sub_1DACA2BFC();
    v22[0] = 0;
    v22[1] = (id)0xE000000000000000;
    sub_1DACA304C();
    sub_1DACA2DDC();
    sub_1DACA28CC();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    v21 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
    sub_1DACA30D0();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();

    (*(void (**)(char *, uint64_t))(v19 + 8))(v2, v20);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1DAC46974()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v1 = (char *)&v15 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DACA28E4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v15 - v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v10 = objc_msgSend((id)objc_opt_self(), sel_appGroupIdentifier);
  if (!v10)
  {
    __break(1u);
    goto LABEL_6;
  }
  v11 = v10;
  v12 = objc_msgSend(v9, sel_containerURLForSecurityApplicationGroupIdentifier_, v10);

  if (!v12)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
    goto LABEL_7;
  }
  sub_1DACA28C0();

  v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v13(v1, v6, v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
  {
    v13(v8, v1, v2);
    sub_1DACA289C();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  }
LABEL_7:
  sub_1DAC7190C((uint64_t)v1, &qword_1EDAF3010);
  result = sub_1DACA30DC();
  __break(1u);
  return result;
}

uint64_t sub_1DAC46BE0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 128);

  *(_QWORD *)(v0 + 232) = v1;
  *(_QWORD *)(v0 + 240) = v2;
  sub_1DAC49328(*(_QWORD *)(v0 + 144), v1, v2);
  if (v3 != 2)
  {
    sub_1DACA2BFC();
    sub_1DACA304C();
    sub_1DACA2DDC();
    __asm { BR              X11 }
  }
  v5 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 168);
  swift_bridgeObjectRelease();
  sub_1DACA2BFC();
  sub_1DACA2C98();
  sub_1DAC33928(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC46D28()
{
  char v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t (*v25)();
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v4 = v2[24];
  v5 = v2[21];
  v6 = v2[22];
  v7 = v2[19];
  v2[17] = BYTE6(v3);
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  v8(v4, v5);
  if (v7 <= 1)
    v9 = 1;
  else
    v9 = v7;
  v2[31] = v9;
  if (!v0 || (swift_bridgeObjectRetain(), v10 = sub_1DAC89C24(), (v2[32] = v11) == 0))
  {
    v22 = v2[23];
    v23 = v2[21];
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v8(v22, v23);
    v24 = (_QWORD *)swift_task_alloc();
    v2[45] = v24;
    v25 = sub_1DAC953E4;
LABEL_11:
    *v24 = v2;
    v24[1] = v25;
    return sub_1DAC9488C();
  }
  v12 = v10;
  v13 = v11;
  if ((sub_1DAC99B24(v1, v3, v10) & 1) == 0)
  {
    v26 = v2[23];
    v27 = v2[21];
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v8(v26, v27);
    v24 = (_QWORD *)swift_task_alloc();
    v2[40] = v24;
    v25 = sub_1DAC95190;
    goto LABEL_11;
  }
  v31 = v2[25];
  v29 = v2[23];
  v30 = v2[21];
  v14 = sub_1DAC99E10(v2[18], v12, v13);
  v16 = v15;
  v18 = v17;
  v2[33] = v17;
  sub_1DACA2BFC();
  sub_1DACA304C();
  sub_1DACA2DDC();
  v19 = MEMORY[0x1E0DEA968];
  MEMORY[0x1DF0A5548](v14, MEMORY[0x1E0DEA968]);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  MEMORY[0x1DF0A5548](v16, v19);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  MEMORY[0x1DF0A5548](v18, v19);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v8(v29, v30);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAC96FEC(v16);
  v2[34] = sub_1DAC978F8(v31, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v18 + 16))
  {
    v20 = (_QWORD *)swift_task_alloc();
    v2[35] = v20;
    *v20 = v2;
    v20[1] = sub_1DAC94FCC;
    return sub_1DAC957E8(v18, v12, v13);
  }
  else
  {
    swift_bridgeObjectRelease();
    v2[37] = v13;
    v28 = (_QWORD *)swift_task_alloc();
    v2[38] = v28;
    *v28 = v2;
    v28[1] = sub_1DAC950B4;
    return sub_1DAC95CE0(v2[34], v2[31], v12, v13);
  }
}

uint64_t sub_1DAC47178()
{
  uint64_t v0;
  int v1;
  unint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t (*v33)();
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v1 = *(unsigned __int8 *)(v0 + 400);
  sub_1DAC4668C();
  v2 = swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 200) = sub_1DAC9776C(v2);
  *(_QWORD *)(v0 + 208) = 0;
  v3 = swift_bridgeObjectRelease();
  if (v1 == 1)
  {
    v4 = (void *)sub_1DAC47BC8(v3);
    *(_QWORD *)(v0 + 216) = v4;
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DAC47784;
    v5 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v6 = (_QWORD *)(v0 + 80);
    v6[1] = 0x40000000;
    v6[2] = sub_1DAC45110;
    v6[3] = &block_descriptor_7;
    v6[4] = v5;
    objc_msgSend(v4, sel_fetchLastClientStateWithCompletionHandler_, v6);
    return swift_continuation_await();
  }
  *(_OWORD *)(v0 + 232) = xmmword_1DACA74F0;
  sub_1DAC49328(*(_QWORD *)(v0 + 144), 0, 0xC000000000000000);
  if (v8 == 2)
  {
    v10 = *(_QWORD *)(v0 + 176);
    v9 = *(_QWORD *)(v0 + 184);
    v11 = *(_QWORD *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA2C98();
    sub_1DAC33928(0, 0xC000000000000000);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v12 = v8;
  sub_1DACA2BFC();
  sub_1DACA304C();
  sub_1DACA2DDC();
  v13 = *(_QWORD *)(v0 + 192);
  v14 = *(_QWORD *)(v0 + 168);
  v15 = *(_QWORD *)(v0 + 176);
  v16 = *(_QWORD *)(v0 + 152);
  *(_QWORD *)(v0 + 136) = 0;
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v17 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
  v17(v13, v14);
  if (v16 <= 1)
    v18 = 1;
  else
    v18 = v16;
  *(_QWORD *)(v0 + 248) = v18;
  if (!v12 || (swift_bridgeObjectRetain(), v19 = sub_1DAC89C24(), (*(_QWORD *)(v0 + 256) = v20) == 0))
  {
    v30 = *(_QWORD *)(v0 + 184);
    v31 = *(_QWORD *)(v0 + 168);
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v17(v30, v31);
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 360) = v32;
    v33 = sub_1DAC953E4;
LABEL_15:
    *v32 = v0;
    v32[1] = v33;
    return sub_1DAC9488C();
  }
  v21 = v19;
  v22 = v20;
  if ((sub_1DAC99B24(0, 0xC000000000000000, v19) & 1) == 0)
  {
    v34 = *(_QWORD *)(v0 + 184);
    v35 = *(_QWORD *)(v0 + 168);
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v17(v34, v35);
    v32 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 320) = v32;
    v33 = sub_1DAC95190;
    goto LABEL_15;
  }
  v39 = *(_QWORD *)(v0 + 200);
  v23 = *(_QWORD *)(v0 + 184);
  v38 = *(_QWORD *)(v0 + 168);
  v24 = sub_1DAC99E10(*(_QWORD *)(v0 + 144), v21, v22);
  v26 = v25;
  v37 = v27;
  *(_QWORD *)(v0 + 264) = v27;
  sub_1DACA2BFC();
  sub_1DACA304C();
  sub_1DACA2DDC();
  v28 = MEMORY[0x1E0DEA968];
  MEMORY[0x1DF0A5548](v24, MEMORY[0x1E0DEA968]);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  MEMORY[0x1DF0A5548](v26, v28);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  MEMORY[0x1DF0A5548](v37, v28);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v17(v23, v38);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAC96FEC(v26);
  *(_QWORD *)(v0 + 272) = sub_1DAC978F8(v39, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v37 + 16))
  {
    v29 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v29;
    *v29 = v0;
    v29[1] = sub_1DAC94FCC;
    return sub_1DAC957E8(v37, v21, v22);
  }
  else
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 296) = v22;
    v36 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 304) = v36;
    *v36 = v0;
    v36[1] = sub_1DAC950B4;
    return sub_1DAC95CE0(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 248), v21, v22);
  }
}

uint64_t sub_1DAC47784()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 224) = v1;
  if (v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC477F4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v4 + 152) = a3;
  *(_QWORD *)(v4 + 160) = v3;
  *(_BYTE *)(v4 + 400) = a2;
  *(_QWORD *)(v4 + 144) = a1;
  v5 = sub_1DACA2C14();
  *(_QWORD *)(v4 + 168) = v5;
  *(_QWORD *)(v4 + 176) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 184) = swift_task_alloc();
  *(_QWORD *)(v4 + 192) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC4786C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v2 = v0[37];
  v1 = v0[38];
  v3 = v0[36];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  sub_1DACA2CC8();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v4 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[39] = (uint64_t)v4;
  v4(v1, v3);
  type metadata accessor for UserGuideIndexHelper();
  v5 = (_QWORD *)swift_task_alloc();
  v0[40] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_1DAC8AF94;
  return sub_1DAC46018(v0[35], v0[32]);
}

uint64_t sub_1DAC4796C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char *v5;
  void (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  _QWORD *v14;

  v2 = v0[15];
  v1 = v0[16];
  v3 = v0[14];
  v4 = v0[11];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  v5 = sub_1DAC8ACC4(v4);
  MEMORY[0x1DF0A5548](v5, MEMORY[0x1E0DEA968]);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v6 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v0[17] = (uint64_t)v6;
  v6(v1, v3);
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1DACA30E8();
    v0[18] = v13;
    if (v13)
      goto LABEL_3;
LABEL_8:
    v0[24] = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRelease();
    v14 = (_QWORD *)swift_task_alloc();
    v0[25] = (uint64_t)v14;
    *v14 = v0;
    v14[1] = sub_1DAC8A7C0;
    return sub_1DAC8C0F8(v0[11]);
  }
  v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v0[18] = v7;
  if (!v7)
    goto LABEL_8;
LABEL_3:
  v8 = v0[11];
  v0[19] = MEMORY[0x1E0DEE9D8];
  if ((v8 & 0xC000000000000001) != 0)
    v9 = (id)MEMORY[0x1DF0A5770](0);
  else
    v9 = *(id *)(v8 + 32);
  v10 = (uint64_t)v9;
  v0[20] = (uint64_t)v9;
  v0[21] = 1;
  v11 = (_QWORD *)swift_task_alloc();
  v0[22] = (uint64_t)v11;
  *v11 = v0;
  v11[1] = sub_1DAC8A670;
  return sub_1DAC37C6C(v10, 1, v0[12]);
}

uint64_t sub_1DAC47B64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[12] = a2;
  v3[13] = v2;
  v3[11] = a1;
  v4 = sub_1DACA2C14();
  v3[14] = v4;
  v3[15] = *(_QWORD *)(v4 - 8);
  v3[16] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1DAC47BCC()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id result;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v1 = *(void **)(v0 + 136);
  if (v1)
  {
    v2 = *(id *)(v0 + 136);
LABEL_5:
    v11 = v1;
    return v2;
  }
  v3 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  result = objc_msgSend(v3, sel_spotlightBundleIdentifier);
  if (result)
  {
    v5 = result;
    sub_1DACA2D94();

    v6 = objc_allocWithZone(MEMORY[0x1E0CA6B38]);
    v7 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    v8 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    v9 = objc_msgSend(v6, sel_initWithName_protectionClass_bundleIdentifier_, v7, 0, v8);

    v10 = *(void **)(v0 + 136);
    *(_QWORD *)(v0 + 136) = v9;
    v2 = v9;

    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC47CDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_1DAC47D4C(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

unint64_t sub_1DAC47D08()
{
  unint64_t result;

  result = qword_1EDAF3108[0];
  if (!qword_1EDAF3108[0])
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8864, &type metadata for ClientStateMetaData);
    atomic_store(result, qword_1EDAF3108);
  }
  return result;
}

uint64_t sub_1DAC47D4C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[24];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3678);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1DAC47FA0();
  sub_1DACA328C();
  if (!v1)
  {
    v9[16] = 0;
    v7 = sub_1DACA3148();
    v9[15] = 1;
    sub_1DAC496C8();
    sub_1DACA313C();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

uint64_t storeEnumTagSinglePayload for ClientStateMetaData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC47F04 + 4 * byte_1DACA8845[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DAC47F38 + 4 * byte_1DACA8840[v4]))();
}

uint64_t sub_1DAC47F38(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC47F40(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC47F48);
  return result;
}

uint64_t sub_1DAC47F54(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC47F5CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DAC47F60(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC47F68(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC47F74()
{
  _BYTE *v0;

  if (*v0)
    return 0x6873616863;
  else
    return 118;
}

unint64_t sub_1DAC47FA0()
{
  unint64_t result;

  result = qword_1EDAF30F0;
  if (!qword_1EDAF30F0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA89B0, &type metadata for ClientStateMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF30F0);
  }
  return result;
}

uint64_t type metadata accessor for UserGuideIndexItem(uint64_t a1)
{
  return sub_1DAC37CF4(a1, qword_1EDAF3048);
}

uint64_t sub_1DAC47FF8()
{
  _QWORD *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(void);

  v1 = (void *)objc_opt_self();
  v0[8] = v1;
  v2 = objc_msgSend(v1, sel_standardUserDefaults);
  v3 = (void *)sub_1DACA2D88();
  v4 = objc_msgSend(v2, sel_integerForKey_, v3);

  if (v4 == (id)1)
  {
    swift_task_dealloc();
    v5 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    v7 = v0[6];
    v6 = v0[7];
    v8 = v0[5];
    sub_1DACA2BFC();
    sub_1DACA304C();
    sub_1DACA2DDC();
    v0[2] = v4;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    v0[3] = 1;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    v0[9] = sub_1DAC91FBC();
    v11 = (uint64_t (*)(void))((char *)&dword_1F028C308 + dword_1F028C308);
    v9 = (_QWORD *)swift_task_alloc();
    v0[10] = v9;
    *v9 = v0;
    v9[1] = sub_1DAC93C5C;
    v5 = v11;
  }
  return v5();
}

uint64_t sub_1DAC4821C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[4] = v0;
  v2 = sub_1DACA2C14();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC4827C()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 104))(0);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC482C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC48324()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v5)(void);

  v2 = *v1;
  *(_QWORD *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();

  v5 = (uint64_t (*)(void))(**(int **)(v2 + 88) + *(_QWORD *)(v2 + 88));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 176) = v4;
  *v4 = v2;
  v4[1] = sub_1DAC482C0;
  return v5();
}

uint64_t sub_1DAC483D0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_1DAC4841C()
{
  uint64_t v0;

  sub_1DAC48428(*(void (**)(id))(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

void sub_1DAC48428(void (*a1)(id), uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (a1)
  {
    v4 = a3 + 16;
    swift_beginAccess();
    v5 = (void *)MEMORY[0x1DF0A6220](v4);
    if (v5)
    {
      v6 = v5;
      v7 = objc_msgSend(v5, sel_error);

    }
    else
    {
      v7 = 0;
    }
    a1(v7);

  }
}

uint64_t sub_1DAC484B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DAC6F4A4;
  return sub_1DAC48508(v2, v3);
}

uint64_t sub_1DAC48508(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = sub_1DACA2C14();
  v2[2] = v4;
  v2[3] = *(_QWORD *)(v4 - 8);
  v2[4] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v2[5] = v5;
  *v5 = v2;
  v5[1] = sub_1DAC92574;
  return sub_1DAC47B64(a2, 50);
}

void SearchItemIndexer.indexUserGuides(_:qualityOfService:completionHandler:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v9 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EDAF3190);
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = a1;
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = a2;
    v11[3] = v4;
    v11[4] = 0xD000000000000020;
    v11[5] = 0x80000001DACAF220;
    v11[6] = &unk_1F028C2B8;
    v11[7] = v10;
    v12 = objc_allocWithZone((Class)sub_1DACA2C80());
    swift_bridgeObjectRetain();
    swift_retain();
    v13 = v4;
    swift_retain();
    v17 = (id)sub_1DACA2C74();
    v14 = (void *)sub_1DACA2D88();
    objc_msgSend(v17, sel_setName_, v14);

    objc_msgSend(v17, sel_setQualityOfService_, a2);
    sub_1DAC37AD8(v17, a3, a4);
    swift_release();
    swift_release();

    return;
  }
  v16 = sub_1DAC942C0((uint64_t)&unk_1EA1E1888);
  SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(v16, a2, a3, a4);
  swift_bridgeObjectRelease();
}

uint64_t sub_1DAC48860()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  sub_1DACA2BFC();
  sub_1DACA2CA4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC488DC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC4894C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DAC483D0;
  return sub_1DAC4899C(v2, v3);
}

uint64_t sub_1DAC4899C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = sub_1DACA2C14();
  v2[2] = v4;
  v2[3] = *(_QWORD *)(v4 - 8);
  v2[4] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v2[5] = v5;
  *v5 = v2;
  v5[1] = sub_1DAC488DC;
  return sub_1DAC477F4(a2, 1, 20);
}

void SearchItemIndexer.indexTips(_:qualityOfService:completionHandler:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v9 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EDAF3198);
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = a1;
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = a2;
    v11[3] = v4;
    v11[4] = 0xD00000000000001ELL;
    v11[5] = 0x80000001DACAF1D0;
    v11[6] = &unk_1F028C298;
    v11[7] = v10;
    v12 = objc_allocWithZone((Class)sub_1DACA2C80());
    swift_bridgeObjectRetain();
    swift_retain();
    v13 = v4;
    swift_retain();
    v17 = (id)sub_1DACA2C74();
    v14 = (void *)sub_1DACA2D88();
    objc_msgSend(v17, sel_setName_, v14);

    objc_msgSend(v17, sel_setQualityOfService_, a2);
    sub_1DAC37AD8(v17, a3, a4);
    swift_release();
    swift_release();

    return;
  }
  v16 = sub_1DAC942C0((uint64_t)&unk_1EA1E1830);
  SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(v16, a2, a3, a4);
  swift_bridgeObjectRelease();
}

uint64_t sub_1DAC48CEC(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v5 = *a1;
  v6 = *(_QWORD *)(v4 + *a1);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    v9 = v4;
    v11 = *(_QWORD *)(v4 + OBJC_IVAR___TPSSearchItemIndexer_name);
    v12 = *(_QWORD *)(v4 + OBJC_IVAR___TPSSearchItemIndexer_name + 8);
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(a4);
    v7 = swift_allocObject();
    swift_defaultActor_initialize();
    *(_QWORD *)(v7 + 136) = 0;
    *(_QWORD *)(v7 + 112) = v11;
    *(_QWORD *)(v7 + 120) = v12;
    *(_BYTE *)(v7 + 128) = 0;
    *(_QWORD *)(v9 + v5) = v7;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v7;
}

uint64_t sub_1DAC48E2C()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_deviceGuideIdentifier);
  sub_1DACA2D94();

  v2 = objc_msgSend(v0, sel_productVersion);
  sub_1DACA2D94();

  v3 = objc_msgSend(v0, sel_deviceName);
  sub_1DACA2D94();

  v4 = objc_msgSend(v0, sel_deviceSymbol);
  sub_1DACA2D94();

  v5 = objc_allocWithZone((Class)sub_1DACA2CF8());
  return sub_1DACA2CBC();
}

unint64_t sub_1DAC48F78()
{
  void *v0;
  id v1;
  uint64_t v2;
  objc_class *v3;
  char *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v20;
  objc_super v21;
  unint64_t v22;

  v22 = MEMORY[0x1E0DEE9D8];
  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_idsDevices);
  sub_1DAC6F8C8();
  v2 = sub_1DACA2E3C();

  v3 = (objc_class *)type metadata accessor for UserGuideManager.CloudDeviceDataSource();
  v4 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v4[OBJC_IVAR____TtCC10TipsDaemon16UserGuideManagerP33_6C8AE7B9624AFE54883FB7DC9DB35E3D21CloudDeviceDataSource_devices] = v2;
  v21.receiver = v4;
  v21.super_class = v3;
  v5 = objc_msgSendSuper2(&v21, sel_init);
  v6 = objc_msgSend(v0, sel_visionProDeviceInfoUsingDataSource_, v5);
  if (v6)
  {
    v7 = v6;
    sub_1DAC6F630(v6);
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();

  }
  v8 = (void *)objc_opt_self();
  v9 = objc_msgSend(v8, sel_watchDeviceInfo);
  if (v9)
  {
    v10 = v9;
    sub_1DAC6F630(v9);
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();

  }
  v11 = objc_msgSend(v8, sel_homePodDeviceInfo);
  if (v11)
  {
    v12 = v11;
    sub_1DAC6F630(v11);
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();

  }
  v13 = objc_msgSend(v0, sel_tvDeviceInfoUsingDataSource_, v5);
  if (v13)
  {
    v14 = v13;
    sub_1DAC6F630(v13);
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();

  }
  v15 = objc_msgSend(v8, sel_airPodsDeviceInfo);
  if (v15)
  {
    v16 = v15;
    sub_1DAC6F630(v15);
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();

  }
  v17 = v22;
  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    v20 = sub_1DACA30E8();
    swift_bridgeObjectRelease();

    if (v20)
      return v17;
    goto LABEL_23;
  }
  v18 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);

  if (!v18)
  {
LABEL_23:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v17;
}

void sub_1DAC49328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = sub_1DACA2C14();
  MEMORY[0x1E0C80A78](v4);
  __asm { BR              X10 }
}

uint64_t sub_1DAC493AC()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  char v17;
  __int16 v19;
  uint64_t v20;

  if ((v3 & 0xFF000000000000) == 0)
    return 0;
  sub_1DAC45B80(v4, v3);
  v9 = v8;
  v11 = v10;
  if (v7 != 2)
  {
    v19 = v7;
    sub_1DACA2BFC();
    *(_QWORD *)(v6 - 96) = 0;
    *(_QWORD *)(v6 - 88) = 0xE000000000000000;
    sub_1DACA304C();
    v20 = *(_QWORD *)(v6 - 88);
    *(_QWORD *)(v6 - 96) = *(_QWORD *)(v6 - 96);
    *(_QWORD *)(v6 - 88) = v20;
    sub_1DACA2DDC();
    *(_WORD *)(v6 - 98) = v19;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    *(_WORD *)(v6 - 98) = 2;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v9, v11);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v0);
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  sub_1DAC381D0(v1);
  swift_bridgeObjectRelease();
  sub_1DAC324C8(v9, v11);
  sub_1DAC31E48(2);
  v13 = v12;
  v15 = v14;
  swift_bridgeObjectRelease();
  sub_1DAC4970C(v9, v11);
  v17 = v16;
  sub_1DAC33928(v13, v15);
  sub_1DAC33928(v9, v11);
  if ((v17 & 1) != 0)
  {
    sub_1DAC33928(v9, v11);
    return 2;
  }
  else
  {
    sub_1DACA2BFC();
    sub_1DACA2C98();
    sub_1DAC33928(v9, v11);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v0);
    return 1;
  }
}

uint64_t sub_1DAC49610(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[5];

  v8[3] = MEMORY[0x1E0DEAC20];
  v8[4] = MEMORY[0x1E0CB1AA8];
  v8[0] = a1;
  v8[1] = a2;
  v2 = __swift_project_boxed_opaque_existential_1(v8, MEMORY[0x1E0DEAC20]);
  v3 = (_BYTE *)*v2;
  if (*v2 && (v4 = (_BYTE *)v2[1], v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      v6 = sub_1DAC49BAC(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      v6 = sub_1DAC759A0((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      v6 = sub_1DAC325C0((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    v6 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v6;
}

unint64_t sub_1DAC496C8()
{
  unint64_t result;

  result = qword_1EDAF3020;
  if (!qword_1EDAF3020)
  {
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EDAF3020);
  }
  return result;
}

void sub_1DAC4970C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1DAC49758()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_1DAC4978C + *((int *)qword_1DAC75980 + (v0 >> 62))))();
}

uint64_t sub_1DAC4979C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (v1 == BYTE6(v2))
  {
    if (v1 >= 1)
      __asm { BR              X10 }
    v3 = 1;
  }
  else
  {
    v3 = 0;
  }
  return v3 & 1;
}

void sub_1DAC49954(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_1DAC499B4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x1DAC49B98);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_1DAC49BAC(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_1DAC49C6C@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  sub_1DACA2CC8();
  v2 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  sub_1DACA2CEC();
  if (v3)
  {
    v4 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_userGuideURLForIdentifier_version_platformIndependent_subPath_, v2, v4, sub_1DACA2CE0() & 1, 0);

  if (v6)
  {
    sub_1DACA28C0();

    v7 = sub_1DACA28E4();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 0;
  }
  else
  {
    v7 = sub_1DACA28E4();
    v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
    v9 = a1;
    v10 = 1;
  }
  return v8(v9, v10, 1, v7);
}

uint64_t sub_1DAC49D74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_1DACA27AC();
  v11 = result;
  if (result)
  {
    result = sub_1DACA27D0();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_1DACA27C4();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_1DAC49954(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_1DAC4A054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary)
  {
    CoreTelephonyLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreTelephonyLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CoreTelephonyClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
    free(v3);
  }
  getCoreTelephonyClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCTCellularPlanManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CellularPlanManagerLibraryCore_frameworkLibrary)
  {
    CellularPlanManagerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CellularPlanManagerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CTCellularPlanManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCTCellularPlanManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCTCellularPlanManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC4A6AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary)
  {
    PassKitCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC4A9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC4B398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary_0)
  {
    CoreTelephonyLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!CoreTelephonyLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CoreTelephonyClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
    free(v3);
  }
  getCoreTelephonyClientClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC4B918(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getAFPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVTPreferencesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary)
  {
    VoiceTriggerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC4C318(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1DAC4C408(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAC4C7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAC4C954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC4D1EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAC4E864(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  id *v38;
  uint64_t v39;

  objc_destroyWeak(v38);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v39 - 184), 8);
  _Block_object_dispose((const void *)(v39 - 136), 8);
  objc_destroyWeak((id *)(v39 - 88));
  _Unwind_Resume(a1);
}

void sub_1DAC4F448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void *__getAFAssistantRestrictedSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AssistantServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_0;
  }
  else
  {
    AssistantServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)AssistantServicesLibraryCore_frameworkLibrary_0;
    if (!AssistantServicesLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AFAssistantRestricted");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAFAssistantRestrictedSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKMedicalIDStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKMedicalIDStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKMedicalIDStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKMedicalIDStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t AssistantServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
    AssistantServicesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_1;
  if (!AssistantServicesLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFPreferencesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AssistantServicesLibrary();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    return (Class)+[TPSCloudDeviceValidation idsService](v3, v4);
  }
  return result;
}

void sub_1DAC519BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC52038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC52248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC531E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCoreTelephonyClientClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CoreTelephonyLibraryCore_frameworkLibrary_1)
  {
    CoreTelephonyLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!CoreTelephonyLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CoreTelephonyClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCoreTelephonyClientClass_block_invoke_cold_1();
    free(v3);
  }
  getCoreTelephonyClientClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC53430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary)
  {
    HomeKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMClientConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getHMClientConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC53678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getPKPeerPaymentIsSetupSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PassKitCoreLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_0;
  }
  else
  {
    PassKitCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_0;
    if (!PassKitCoreLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PKPeerPaymentIsSetup");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentIsSetupSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC55AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKAccountServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary_1)
  {
    PassKitCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKAccountService");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPKAccountServiceClass_block_invoke_cold_1();
    free(v3);
  }
  getPKAccountServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC55EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC561F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC565FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getSPBeaconManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SPOwnerLibraryCore_frameworkLibrary)
  {
    SPOwnerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SPOwnerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SPBeaconManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getSPBeaconManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSPBeaconManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHMClientConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary_0)
  {
    HomeKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMClientConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getHMClientConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getPKPeerPaymentIsAvailableSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PassKitCoreLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_2;
  }
  else
  {
    PassKitCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_2;
    if (!PassKitCoreLibraryCore_frameworkLibrary_2)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PKPeerPaymentIsAvailable");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentIsAvailableSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC5705C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTPreferencesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
  {
    VoiceTriggerLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC57334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getVTPreferencesClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
  {
    VoiceTriggerLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!VoiceTriggerLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("VTPreferences");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getVTPreferencesClass_block_invoke_cold_1();
    free(v3);
  }
  getVTPreferencesClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHMClientConnectionClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary_1)
  {
    HomeKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMClientConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getHMClientConnectionClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void sub_1DAC58064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC58718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHeartRhythmAvailabilityClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_0)
  {
    HealthKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHeartRhythmAvailability");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKHeartRhythmAvailabilityClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHeartRhythmAvailabilityClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC588D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHKHealthStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHKHealthStoreClass_block_invoke_cold_1();
    return (Class)HealthKitLibrary();
  }
  return result;
}

uint64_t HealthKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HealthKitLibraryCore_frameworkLibrary_1)
    HealthKitLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = HealthKitLibraryCore_frameworkLibrary_1;
  if (!HealthKitLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1DAC58FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPKPassLibraryClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PassKitCoreLibraryCore_frameworkLibrary_3)
  {
    PassKitCoreLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!PassKitCoreLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PKPassLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getPKPassLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPKPassLibraryClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC5A08C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKFeatureStatusManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_2)
  {
    HealthKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKFeatureStatusManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getHKFeatureStatusManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getHKFeatureStatusManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC5A378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthChecklistUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_3)
  {
    HealthKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthChecklistUtilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthChecklistUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC5A6B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
  {
    ScreenTimeCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("STManagementState");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSTManagementStateClass_block_invoke_cold_1();
    free(v3);
  }
  getSTManagementStateClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC5B1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

uint64_t AssistantServicesLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
    AssistantServicesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_2;
  if (!AssistantServicesLibraryCore_frameworkLibrary_2)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getAFPreferencesClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  AssistantServicesLibrary_0();
  result = objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getAFPreferencesClass_block_invoke_cold_1();
    return (Class)+[TPSWelcomeDocument supportsSecureCoding](v3, v4);
  }
  return result;
}

void sub_1DAC5D070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&STACK[0x200], 8);
  _Block_object_dispose((const void *)(v59 - 224), 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1DAC5E5B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC5F7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  objc_destroyWeak(&location);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

Class __getFMDFMIPManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!FindMyDeviceLibraryCore_frameworkLibrary)
  {
    FindMyDeviceLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!FindMyDeviceLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("FMDFMIPManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getFMDFMIPManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getFMDFMIPManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC60FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHKSPSleepStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SleepLibraryCore_frameworkLibrary)
  {
    SleepLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SleepLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKSPSleepStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKSPSleepStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKSPSleepStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC61778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC61B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC61FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getASDSubscriptionEntitlementsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppStoreDaemonLibraryCore_frameworkLibrary)
  {
    AppStoreDaemonLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppStoreDaemonLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ASDSubscriptionEntitlements");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getASDSubscriptionEntitlementsClass_block_invoke_cold_1();
    free(v3);
  }
  getASDSubscriptionEntitlementsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC624D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getHKHealthRecordsAccountInfoStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_4)
  {
    HealthKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthRecordsAccountInfoStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKHealthRecordsAccountInfoStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthRecordsAccountInfoStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AssistantServicesLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
    AssistantServicesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  v0 = AssistantServicesLibraryCore_frameworkLibrary_3;
  if (!AssistantServicesLibraryCore_frameworkLibrary_3)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

TPSPairedDevicesCondition *__getAFPreferencesClass_block_invoke_2(uint64_t a1)
{
  TPSPairedDevicesCondition *result;
  TPSPairedDevicesCondition *v3;
  SEL v4;

  AssistantServicesLibrary_1();
  result = (TPSPairedDevicesCondition *)objc_getClass("AFPreferences");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAFPreferencesClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (TPSPairedDevicesCondition *)__getAFPreferencesClass_block_invoke_cold_1();
    return -[TPSPairedDevicesCondition init](v3, v4);
  }
  return result;
}

void sub_1DAC62FF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC6335C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC6369C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary_2)
  {
    HomeKitLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMClientConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getHMClientConnectionClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC63D84(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

Class __getASDIAPHistoryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppStoreDaemonLibraryCore_frameworkLibrary_0)
  {
    AppStoreDaemonLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AppStoreDaemonLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ASDIAPHistory");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getASDIAPHistoryClass_block_invoke_cold_1();
    free(v3);
  }
  getASDIAPHistoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC643C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC64558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DAC64844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC64AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC64C20(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAC650E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1DAC65A2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAC65CEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAC66164(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DAC662A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DAC665C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCRUsageInformationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CarPlayLibraryCore_frameworkLibrary)
  {
    CarPlayLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CarPlayLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CRUsageInformation");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCRUsageInformationClass_block_invoke_cold_1();
    free(v3);
  }
  getCRUsageInformationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC66EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC67FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getPKPeerPaymentHasCashFamilyAccountsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (PassKitCoreLibraryCore_frameworkLibrary_4)
  {
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_4;
  }
  else
  {
    PassKitCoreLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    v2 = (void *)PassKitCoreLibraryCore_frameworkLibrary_4;
    if (!PassKitCoreLibraryCore_frameworkLibrary_4)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "PKPeerPaymentHasCashFamilyAccounts");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getPKPeerPaymentHasCashFamilyAccountsSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id TPSHMManagerSpeakersConfiguredChangedNotificationString()
{
  void *v0;
  _QWORD *v1;
  void *v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v0 = (void *)MEMORY[0x1E0CB3940];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v1 = (_QWORD *)getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr;
  v8 = getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr;
  if (!getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr)
  {
    v2 = (void *)HomeKitLibrary();
    v1 = dlsym(v2, "HMHomeManagerSpeakersConfiguredChangedNotification");
    v6[3] = (uint64_t)v1;
    getHMHomeManagerSpeakersConfiguredChangedNotificationSymbolLoc_ptr = (uint64_t)v1;
  }
  _Block_object_dispose(&v5, 8);
  if (!v1)
  {
    v4 = (_Unwind_Exception *)-[TPSHeySiriEnabledValidation getCurrentState].cold.1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  objc_msgSend(v0, "stringWithUTF8String:", *v1, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t HomeKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HomeKitLibraryCore_frameworkLibrary_3)
    HomeKitLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  v0 = HomeKitLibraryCore_frameworkLibrary_3;
  if (!HomeKitLibraryCore_frameworkLibrary_3)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void __getHMClientConnectionClass_block_invoke_3(uint64_t a1)
{
  void *v2;
  SEL v3;

  HomeKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("HMClientConnection");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHMClientConnectionClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    +[TPSDataMigrator performMigrationIfNeeded](v2, v3);
  }
}

void sub_1DAC691F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC69364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHMClientConnectionClass_block_invoke_4(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HomeKitLibraryCore_frameworkLibrary_4)
  {
    HomeKitLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    if (!HomeKitLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HMClientConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHMClientConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getHMClientConnectionClass_softClass_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKHealthChecklistUtilitiesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary_5)
  {
    HealthKitLibraryCore_frameworkLibrary_5 = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary_5)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKHealthChecklistUtilities");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1();
    free(v3);
  }
  getHKHealthChecklistUtilitiesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAC69EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC69FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC6A110(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAC6A22C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAC6A320(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DAC6A454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC6A59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAC6B850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DAC6B904(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_1DAC6D570(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void type metadata accessor for LNTranscriptActionSource(uint64_t a1)
{
  sub_1DAC6EF34(a1, &qword_1F028BEB8);
}

void type metadata accessor for TPSContextualEventType(uint64_t a1)
{
  sub_1DAC6EF34(a1, &qword_1F028BEC0);
}

void type metadata accessor for QualityOfService(uint64_t a1)
{
  sub_1DAC6EF34(a1, &qword_1F028BEC8);
}

void sub_1DAC6EEF0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_1DAC6EEFC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1DAC6EF0C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for TPSAssetsConfigurationUserInterfaceStyle(uint64_t a1)
{
  sub_1DAC6EF34(a1, &qword_1F028BED0);
}

void sub_1DAC6EF34(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t Task<>.init(qualityOfService:operation:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAC6F070(a1);
  v11 = sub_1DACA2EE4();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a4;
  v12[5] = a2;
  v12[6] = a3;
  return sub_1DAC6F1CC((uint64_t)v10, (uint64_t)&unk_1F028BEE0, (uint64_t)v12, a4);
}

uint64_t sub_1DAC6F070(uint64_t a1)
{
  uint64_t result;

  switch(a1)
  {
    case 9:
      result = sub_1DACA2EA8();
      break;
    case 17:
      result = sub_1DACA2EC0();
      break;
    case 25:
    case 33:
      result = sub_1DACA2EB4();
      break;
    default:
      result = sub_1DACA2ECC();
      break;
  }
  return result;
}

uint64_t sub_1DAC6F0A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t);

  v8 = (uint64_t (*)(uint64_t))((char *)a4 + *a4);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1DAC6F4A4;
  return v8(a1);
}

uint64_t sub_1DAC6F10C()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC6F138(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[5];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DAC483D0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F028BED8 + dword_1F028BED8))(a1, v4, v5, v6);
}

uint64_t sub_1DAC6F1CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v8 = sub_1DACA2EE4();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1, 1, v8) != 1)
  {
    sub_1DACA2ED8();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DAC6F310(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DACA2E84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a4;
  v10[3] = a2;
  v10[4] = a3;
  return swift_task_create();
}

uint64_t sub_1DAC6F310(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DAC6F350(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DAC6F3B4;
  return v6(a1);
}

uint64_t sub_1DAC6F3B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC6F400()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC6F424(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 24);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC483D0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F028BEE8 + dword_1F028BEE8))(a1, v4);
}

id sub_1DAC6F528()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UserGuideManager.CloudDeviceDataSource();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id UserGuideManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id UserGuideManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id UserGuideManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DAC6F630(void *a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v2 = objc_msgSend(a1, sel_model);
  sub_1DACA2D94();

  v3 = objc_msgSend(a1, sel_maxOSVersion);
  if (v3)
  {
    v4 = v3;
    sub_1DACA2D94();

  }
  v5 = objc_msgSend(a1, sel_displayName);
  if (v5)
  {
    v6 = v5;
    sub_1DACA2D94();

  }
  v7 = objc_msgSend(a1, sel_symbolIdentifier);
  if (v7)
  {
    v8 = v7;
    sub_1DACA2D94();

  }
  v9 = objc_allocWithZone((Class)sub_1DACA2CF8());
  return sub_1DACA2CBC();
}

uint64_t _s10TipsDaemon16UserGuideManagerC10userGuidesSay0A4Core0cD0CGyFZ_0()
{
  void *v0;
  unint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x1E0DEE9D8];
  v0 = (void *)objc_opt_self();
  if (objc_msgSend(v0, sel_supportsUserGuide))
  {
    sub_1DAC48E2C();
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1DACA2E60();
    sub_1DACA2E78();
    sub_1DACA2E54();
  }
  if (objc_msgSend(v0, sel_supportsCloudDeviceUserGuide))
  {
    v1 = sub_1DAC48F78();
    if (v1)
      sub_1DAC96E34(v1);
  }
  return v3;
}

uint64_t type metadata accessor for UserGuideManager()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for UserGuideManager.CloudDeviceDataSource()
{
  return objc_opt_self();
}

unint64_t sub_1DAC6F8C8()
{
  unint64_t result;

  result = qword_1EDAF3908;
  if (!qword_1EDAF3908)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDAF3908);
  }
  return result;
}

uint64_t sub_1DAC6F904(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_task_switch();
}

id sub_1DAC6F91C()
{
  uint64_t v0;
  unint64_t v1;
  id result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v0 + 16) = MEMORY[0x1E0DEE9D8];
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 24) = v1;
  result = (id)swift_bridgeObjectRetain();
  if (!(v1 >> 62))
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v4 = *(_QWORD *)(v0 + 32);
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease_n();
    return (id)(*(uint64_t (**)(_QWORD))(v0 + 8))(MEMORY[0x1E0DEE9D8]);
  }
  swift_bridgeObjectRetain();
  v7 = sub_1DACA30E8();
  result = (id)swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 32);
  if (!v7)
    goto LABEL_14;
LABEL_3:
  if (!(v4 >> 62))
  {
    if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
    goto LABEL_18;
  }
  swift_bridgeObjectRetain();
  v8 = sub_1DACA30E8();
  result = (id)swift_bridgeObjectRelease();
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1DACA30E8();
    result = (id)swift_bridgeObjectRelease();
    if (v9)
    {
LABEL_5:
      if ((v4 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_21:
          __break(1u);
          goto LABEL_22;
        }
        result = *(id *)(v4 + 32);
LABEL_8:
        *(_QWORD *)(v0 + 40) = result;
        if (v4 >> 62)
        {
          swift_bridgeObjectRetain();
          v5 = sub_1DACA30E8();
          result = (id)swift_bridgeObjectRelease();
        }
        else
        {
          v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        if (v5)
        {
          sub_1DAC6FEFC(0, 1);
          v6 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 48) = v6;
          *v6 = v0;
          v6[1] = sub_1DAC6FB08;
          return (id)TPSTip.csSearchableItemWithThumbnail.getter();
        }
        goto LABEL_21;
      }
LABEL_19:
      result = (id)MEMORY[0x1DF0A5770](0, v4);
      goto LABEL_8;
    }
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_1DAC6FB08(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(*(_QWORD *)v1 + 40);
  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc();

  return swift_task_switch();
}

uint64_t sub_1DAC6FB68()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  id v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = (uint64_t *)(v0 + 24);
  if (*(_QWORD *)(v0 + 56))
  {
    MEMORY[0x1DF0A5524]();
    if (*(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      goto LABEL_14;
    while (1)
    {
      sub_1DACA2E78();
      sub_1DACA2E54();
      v2 = *v1;
      v3 = (unint64_t)*v1 >> 62;
      if (!v3)
      {
        if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_11;
        if ((v2 & 0xC000000000000001) != 0)
          goto LABEL_22;
        goto LABEL_6;
      }
      swift_bridgeObjectRetain();
      v9 = sub_1DACA30E8();
      swift_bridgeObjectRelease();
      if (!v9)
        goto LABEL_11;
      swift_bridgeObjectRetain();
      v10 = sub_1DACA30E8();
      swift_bridgeObjectRelease();
      if (v10)
        break;
      while (1)
      {
        __break(1u);
LABEL_21:
        if ((v2 & 0xC000000000000001) != 0)
          break;
LABEL_6:
        if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          v4 = *(id *)(v2 + 32);
          goto LABEL_8;
        }
LABEL_19:
        __break(1u);
      }
LABEL_22:
      v4 = (id)MEMORY[0x1DF0A5770](0, v2);
LABEL_8:
      *(_QWORD *)(v0 + 40) = v4;
      if (v3)
      {
        swift_bridgeObjectRetain();
        v8 = sub_1DACA30E8();
        swift_bridgeObjectRelease();
        if (v8)
        {
LABEL_10:
          sub_1DAC6FEFC(0, 1);
          v5 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v0 + 48) = v5;
          *v5 = v0;
          v5[1] = sub_1DAC6FB08;
          return TPSTip.csSearchableItemWithThumbnail.getter();
        }
      }
      else if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_10;
      }
      __break(1u);
LABEL_14:
      sub_1DACA2E60();
    }
    swift_bridgeObjectRetain();
    v11 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (!v11)
    {
      __break(1u);
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_11:
  v7 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_1DAC6FD80()
{
  void *v0;

  objc_msgSend(v0, sel_lastModifiedDate);
  return sub_1DACA319C();
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_1DAC6FDE8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1DAC38874(a1, (SEL *)&selRef_identifier, a2);
}

void sub_1DAC6FE04(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (SEL *)&selRef_setIdentifier_);
}

char *keypath_get_selector_language()
{
  return sel_language;
}

void sub_1DAC6FE1C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_1DAC38874(a1, (SEL *)&selRef_language, a2);
}

void sub_1DAC6FE38(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, (SEL *)&selRef_setLanguage_);
}

void keypath_setTm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;

  v6 = *a2;
  v7 = (id)sub_1DACA2D88();
  objc_msgSend(v6, *a5, v7);

}

uint64_t sub_1DAC6FE94@<X0>(id *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  objc_msgSend(*a1, sel_lastModifiedDate);
  result = sub_1DACA319C();
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_1DAC6FEE8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DAC324C8(a1, a2);
  return a1;
}

uint64_t sub_1DAC6FEFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    if (!(*v3 >> 62))
    {
      if (*(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_30:
      __break(1u);
      goto LABEL_31;
    }
  }
  swift_bridgeObjectRetain();
  v21 = sub_1DACA30E8();
  swift_bridgeObjectRelease();
  if (v21 < v2)
    goto LABEL_30;
LABEL_4:
  v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_32:
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    v7 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_8;
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v12 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    v9 = *v3;
    goto LABEL_15;
  }
  if (*v3 >> 62)
    goto LABEL_33;
  v7 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 - v6;
  if (__OFADD__(v7, v5))
    goto LABEL_35;
LABEL_8:
  v9 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v9;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v9 & 0x8000000000000000) == 0 && (v9 & 0x4000000000000000) == 0)
  {
    v11 = v9 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v7 = 1;
  }
  if (v9 >> 62)
    goto LABEL_36;
  v12 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v8)
    v12 = v8;
  swift_bridgeObjectRetain();
  *v3 = MEMORY[0x1DF0A577C](v7, v12, 1, v9);
  swift_bridgeObjectRelease();
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v13 = v11 + 32;
  v14 = (char *)(v11 + 32 + 8 * v4);
  sub_1DAC450D4();
  result = swift_arrayDestroy();
  if (!v5)
    return sub_1DACA2E54();
  if (*v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_1DACA30E8();
    result = swift_bridgeObjectRelease();
    v17 = v22 - v2;
    if (!__OFSUB__(v22, v2))
      goto LABEL_21;
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v16 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v17 = v16 - v2;
  if (__OFSUB__(v16, v2))
    goto LABEL_39;
LABEL_21:
  v18 = (char *)(v13 + 8 * v2);
  if (v4 != v2 || v14 >= &v18[8 * v17])
    result = (uint64_t)memmove(v14, v18, 8 * v17);
  if (*v3 >> 62)
  {
LABEL_40:
    swift_bridgeObjectRetain();
    v23 = sub_1DACA30E8();
    result = swift_bridgeObjectRelease();
    v20 = v23 + v5;
    if (!__OFADD__(v23, v5))
      goto LABEL_26;
    goto LABEL_42;
  }
  v19 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  v20 = v19 + v5;
  if (!__OFADD__(v19, v5))
  {
LABEL_26:
    *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v20;
    return sub_1DACA2E54();
  }
LABEL_42:
  __break(1u);
  return result;
}

id TPSTip.csSearchableItem.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v1 = sub_1DACA298C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DACA26D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = 0;
  if ((objc_msgSend(v0, sel_type) & 2) != 0)
  {
    if ((objc_msgSend(v0, sel_isIntro) & 1) != 0
      || (objc_msgSend(v0, sel_isOutro) & 1) != 0
      || (objc_msgSend(v0, sel_isLinkedArticle) & 1) != 0)
    {
      return 0;
    }
    else
    {
      v11 = objc_msgSend(v0, sel_identifier);
      v32 = (id)sub_1DACA2D94();

      v33 = sub_1DAC70CB0();
      v12 = TPSTip.csAttributeSet.getter();
      v31 = v2;
      if (!v12)
        v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CA6B50]), sel_init);
      v13 = v12;
      v32 = objc_allocWithZone(MEMORY[0x1E0CA6B48]);
      v14 = (void *)sub_1DACA2D88();
      swift_bridgeObjectRelease();
      v15 = (void *)sub_1DACA2D88();
      swift_bridgeObjectRelease();
      v9 = objc_msgSend(v32, sel_initWithUniqueIdentifier_domainIdentifier_attributeSet_, v14, v15, v13);

      v16 = objc_msgSend(v9, sel_uniqueIdentifier);
      v30 = sub_1DACA2D94();
      v33 = v17;

      v32 = objc_msgSend(v9, sel_attributeSet);
      v18 = objc_msgSend(v0, sel_language);
      v19 = sub_1DACA2D94();
      v21 = v20;

      v22 = objc_msgSend(v0, sel_bodyContent);
      if (v22
        && (v23 = v22,
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FA0),
            v24 = sub_1DACA2E3C(),
            v23,
            v25 = sub_1DAC70D74(v24),
            swift_bridgeObjectRelease(),
            v25))
      {
        v26 = sub_1DAC70EC0(v25);
        swift_bridgeObjectRelease();
      }
      else
      {
        v26 = 0;
      }
      *(_QWORD *)&v37 = v30;
      *((_QWORD *)&v37 + 1) = v33;
      *(_QWORD *)&v38 = v32;
      *((_QWORD *)&v38 + 1) = v19;
      *(_QWORD *)&v39 = v21;
      *((_QWORD *)&v39 + 1) = v26;
      v27 = objc_msgSend(v9, sel_attributeSet, v26);
      sub_1DAC87E40((uint64_t)v8);
      sub_1DACA2F8C();

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v28 = objc_msgSend(v9, sel_attributeSet);
      v34 = v37;
      v35 = v38;
      v36 = v39;
      sub_1DAC71790();
      sub_1DACA2F80();

      sub_1DACA295C();
      v29 = (void *)sub_1DACA2968();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v4, v1);
      objc_msgSend(v9, sel_setExpirationDate_, v29);
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  return v9;
}

uint64_t TPSTip.csSearchableItemWithThumbnail.getter()
{
  uint64_t v0;
  _QWORD *v1;

  v1[167] = v0;
  v1[173] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2EC0);
  v1[179] = swift_task_alloc();
  v1[185] = swift_task_alloc();
  v1[186] = swift_task_alloc();
  v1[187] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v1[188] = swift_task_alloc();
  v1[189] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7062C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 1384);
  v2 = *(_QWORD *)(v0 + 1336);
  *(_QWORD *)(v0 + 1520) = TPSTip.csSearchableItem.getter();
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 1528) = v3;
  *(_QWORD *)(v3 + 16) = v2;
  swift_asyncLet_begin();
  v4 = swift_task_alloc();
  *(_QWORD *)(v0 + 1536) = v4;
  *(_QWORD *)(v4 + 16) = v2;
  swift_asyncLet_begin();
  *(_DWORD *)(v0 + 1544) = *(_DWORD *)(v1 + 48);
  return swift_asyncLet_get();
}

uint64_t sub_1DAC7070C()
{
  uint64_t v0;

  sub_1DAC718C4(*(_QWORD *)(v0 + 1512), *(_QWORD *)(v0 + 1488));
  return swift_asyncLet_get();
}

uint64_t sub_1DAC70758()
{
  return swift_task_switch();
}

uint64_t sub_1DAC7076C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 1520);
  sub_1DAC718C4(*(_QWORD *)(v0 + 1504), *(_QWORD *)(v0 + 1488) + *(int *)(v0 + 1544));
  if (v1)
  {
    v2 = *(void **)(v0 + 1520);
    v3 = *(_QWORD *)(v0 + 1488);
    v4 = *(_QWORD *)(v0 + 1480);
    v5 = *(_QWORD *)(v0 + 1384);
    v6 = v3 + *(int *)(v0 + 1544);
    v7 = objc_msgSend(v2, sel_attributeSet);
    v8 = v4 + *(int *)(v5 + 48);
    sub_1DAC718C4(v3, v4);
    sub_1DAC718C4(v6, v8);
    v9 = sub_1DACA28E4();
    v10 = *(_QWORD *)(v9 - 8);
    v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v11 = 0;
    if (v22(v4, 1, v9) != 1)
    {
      v12 = *(_QWORD *)(v0 + 1480);
      v11 = (void *)sub_1DACA2890();
      (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v12, v9);
    }
    v21 = v10;
    v13 = *(_QWORD *)(v0 + 1488);
    v14 = *(_QWORD *)(v0 + 1432);
    v15 = *(_QWORD *)(v0 + 1384);
    v16 = v13 + *(int *)(v0 + 1544);
    sub_1DAC7190C(v8, &qword_1EDAF3010);
    objc_msgSend(v7, sel_setThumbnailURL_, v11);

    v17 = objc_msgSend(v2, sel_attributeSet);
    v18 = v14 + *(int *)(v15 + 48);
    sub_1DAC718C4(v13, v14);
    sub_1DAC718C4(v16, v18);
    if (v22(v18, 1, v9) == 1)
    {
      v19 = 0;
    }
    else
    {
      v19 = (void *)sub_1DACA2890();
      (*(void (**)(uint64_t, uint64_t))(v21 + 8))(v18, v9);
    }
    sub_1DAC7190C(*(_QWORD *)(v0 + 1432), &qword_1EDAF3010);
    objc_msgSend(v17, sel_setDarkThumbnailURL_, v19);

  }
  sub_1DAC7190C(*(_QWORD *)(v0 + 1488), &qword_1EDAF2EC0);
  return swift_asyncLet_finish();
}

uint64_t sub_1DAC7098C()
{
  return swift_task_switch();
}

uint64_t sub_1DAC709A0()
{
  swift_task_dealloc();
  return swift_asyncLet_finish();
}

uint64_t sub_1DAC709E8()
{
  return swift_task_switch();
}

uint64_t sub_1DAC709FC()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 1520));
}

uint64_t TPSTip.indexable.getter()
{
  void *v0;

  if ((objc_msgSend(v0, sel_type) & 2) == 0
    || (objc_msgSend(v0, sel_isIntro) & 1) != 0
    || (objc_msgSend(v0, sel_isOutro) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend(v0, sel_isLinkedArticle) ^ 1;
  }
}

void *TPSTip.csAttributeSet.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned __int8 v9;
  void *v10;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2F70);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DACA2BA8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(v0, sel_type);
  v10 = 0;
  if ((v9 & 2) != 0)
  {
    if ((objc_msgSend(v1, sel_isIntro) & 1) != 0
      || (objc_msgSend(v1, sel_isOutro) & 1) != 0
      || (objc_msgSend(v1, sel_isLinkedArticle) & 1) != 0)
    {
      return 0;
    }
    else
    {
      sub_1DAC450D4();
      sub_1DACA2FB0();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
      sub_1DACA2B90();
      v12 = objc_allocWithZone(MEMORY[0x1E0CA6B50]);
      v13 = (void *)sub_1DACA2B9C();
      v14 = objc_msgSend(v12, sel_initWithContentType_, v13);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      v10 = sub_1DAC71948(v14);

    }
  }
  return v10;
}

CSSearchableItemAttributeSet __swiftcall TPSTip.addAttributes(to:)(CSSearchableItemAttributeSet to)
{
  return (CSSearchableItemAttributeSet)sub_1DAC71948(to.super.isa);
}

uint64_t sub_1DAC70CB0()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = 1936746868;
  v2 = objc_msgSend(v0, sel_collectionIdentifiers);
  if (v2)
  {
    v3 = v2;
    v4 = sub_1DACA2E3C();

    if (*(_QWORD *)(v4 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_1DACA2DDC();
      swift_bridgeObjectRelease();
      return 0x2E73706974;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  return v1;
}

uint64_t sub_1DAC70D74(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x1E0DEE9D8];
  sub_1DAC9C614(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    for (i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35C0);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1DAC9C614(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1DAC9C614((_QWORD *)(v5 > 1), v6 + 1, 1);
        v3 = v9;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

uint64_t sub_1DAC70EC0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1DAC9C5F8(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      swift_bridgeObjectRetain_n();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35C0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35B0);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1DAC9C5F8(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1DAC9C5F8((_QWORD *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      *(_QWORD *)(v2 + 8 * v6 + 32) = v8;
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1DAC71000(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1DAC9C630(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3638);
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1DAC9C630(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1DAC9C630((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1DAC33D7C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1DAC71128(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DAC71C20;
  return sub_1DAC7117C(a1);
}

uint64_t sub_1DAC7117C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_1DACA28E4();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC711EC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[4];
  v4 = v0[5];
  v5 = (void *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3198);
  v6 = v5;
  sub_1DAC46974();
  sub_1DACA289C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  type metadata accessor for ThumbnailFetcher();
  swift_allocObject();
  v0[8] = sub_1DAC775C4(v6, v1);
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_1DAC712DC;
  return sub_1DAC77748(v0[2], 0);
}

uint64_t sub_1DAC712DC()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_1DAC71348()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC71388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 16);
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v3, 1, 1, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC713F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DAC6F3B4;
  return sub_1DAC71444(a1);
}

uint64_t sub_1DAC71444(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_1DACA28E4();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC714B4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD *v7;

  v2 = v0[6];
  v1 = v0[7];
  v3 = v0[4];
  v4 = v0[5];
  v5 = (void *)v0[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3198);
  v6 = v5;
  sub_1DAC46974();
  sub_1DACA289C();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  type metadata accessor for ThumbnailFetcher();
  swift_allocObject();
  v0[8] = sub_1DAC775C4(v6, v1);
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_1DAC715A4;
  return sub_1DAC77748(v0[2], 1);
}

uint64_t sub_1DAC715A4()
{
  void *v0;

  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

void *sub_1DAC71610()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v1 = objc_msgSend(v0, sel_fullContent);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_bodyText);

    if (v3)
      goto LABEL_9;
  }
  v4 = objc_msgSend(v0, sel_fullContent);
  if (!v4
    || (v5 = v4, v6 = objc_msgSend(v4, sel_bodyContent), v5, !v6))
  {
    v10 = objc_msgSend(v0, sel_notification);
    v9 = v10;
    if (!v10)
      return v9;
    v3 = objc_msgSend(v10, sel_text);

    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FA0);
  sub_1DACA2E3C();

  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_1DACA2E30();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v7, sel_altTextRepresentationForContent_, v8);

  if (v3)
  {
LABEL_9:
    v9 = (void *)sub_1DACA2D94();

    return v9;
  }
  return 0;
}

unint64_t sub_1DAC71790()
{
  unint64_t result;

  result = qword_1EDAF2F28;
  if (!qword_1EDAF2F28)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7FAC, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F28);
  }
  return result;
}

uint64_t sub_1DAC717D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DAC6F4A4;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1DAC71C20;
  return sub_1DAC7117C(a1);
}

uint64_t sub_1DAC7184C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  _QWORD *v4;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DAC483D0;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1DAC6F3B4;
  return sub_1DAC71444(a1);
}

uint64_t sub_1DAC718C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAC7190C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void *sub_1DAC71948(void *a1)
{
  void *v1;
  void *v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;

  v2 = v1;
  v4 = objc_msgSend(v1, sel_fullContent);
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, sel_title);

    if (v6)
    {
      sub_1DACA2D94();

      v5 = (void *)sub_1DACA2D88();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = 0;
    }
  }
  objc_msgSend(a1, sel_setDisplayName_, v5);

  v7 = objc_msgSend(v2, sel_identifier);
  if (!v7)
  {
    sub_1DACA2D94();
    v7 = (id)sub_1DACA2D88();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a1, sel_setUniqueIdentifier_, v7);

  sub_1DAC70CB0();
  v8 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setDomainIdentifier_, v8);

  v9 = objc_msgSend(v2, sel_collectionIdentifiers);
  if (v9)
  {
    v10 = sub_1DACA2E3C();

    if (*(_QWORD *)(v10 + 16))
      swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  sub_1DACA2F98();
  v11 = objc_msgSend(v2, sel_keywords);
  objc_msgSend(a1, sel_setKeywords_, v11);

  sub_1DAC71610();
  if (v12)
  {
    v13 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a1, sel_setContentDescription_, v13);

  v14 = objc_msgSend(v2, sel_fullContentAssets);
  v15 = objc_msgSend(v14, sel_alt);

  objc_msgSend(a1, sel_setTextContent_, v15);
  v16 = objc_msgSend(v2, sel_correlationID);
  if (v16)
  {
    v17 = v16;
    sub_1DACA2D94();

  }
  sub_1DACA2FA4();
  return a1;
}

BOOL TPSTargetingConditionJoinType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

uint64_t sub_1DAC71C4C()
{
  return sub_1DACA325C();
}

_QWORD *sub_1DAC71C78@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

unint64_t TPSTargetingConditionStatusType.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_1DAC71CBC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

unint64_t sub_1DAC71CE0()
{
  unint64_t result;

  result = qword_1F028BFA0;
  if (!qword_1F028BFA0)
  {
    result = MEMORY[0x1DF0A60C4](&protocol conformance descriptor for TPSTargetingConditionJoinType, &type metadata for TPSTargetingConditionJoinType);
    atomic_store(result, (unint64_t *)&qword_1F028BFA0);
  }
  return result;
}

unint64_t sub_1DAC71D28()
{
  unint64_t result;

  result = qword_1F028BFA8;
  if (!qword_1F028BFA8)
  {
    result = MEMORY[0x1DF0A60C4](&protocol conformance descriptor for TPSTargetingConditionStatusType, &type metadata for TPSTargetingConditionStatusType);
    atomic_store(result, (unint64_t *)&qword_1F028BFA8);
  }
  return result;
}

unint64_t sub_1DAC71D70()
{
  unint64_t result;

  result = qword_1F028BFB0;
  if (!qword_1F028BFB0)
  {
    result = MEMORY[0x1DF0A60C4](&protocol conformance descriptor for TPSTargetingConditionValidateType, &type metadata for TPSTargetingConditionValidateType);
    atomic_store(result, (unint64_t *)&qword_1F028BFB0);
  }
  return result;
}

uint64_t sub_1DAC71DB4()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

uint64_t sub_1DAC71DF8()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

ValueMetadata *type metadata accessor for TPSTargetingConditionJoinType()
{
  return &type metadata for TPSTargetingConditionJoinType;
}

ValueMetadata *type metadata accessor for TPSTargetingConditionStatusType()
{
  return &type metadata for TPSTargetingConditionStatusType;
}

ValueMetadata *type metadata accessor for TPSTargetingConditionValidateType()
{
  return &type metadata for TPSTargetingConditionValidateType;
}

uint64_t sub_1DAC71E74(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v14[2];
  uint64_t v15;
  __int128 v16;
  _QWORD v17[7];

  v17[5] = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v16 = a1;
  *((_QWORD *)&v16 + 1) = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FF8);
  if (!swift_dynamicCast())
  {
    v15 = 0;
    memset(v14, 0, sizeof(v14));
    sub_1DAC75A18((uint64_t)v14);
    if ((a2 & 0x1000000000000000) != 0)
      goto LABEL_20;
    if ((a2 & 0x2000000000000000) != 0)
    {
      v17[0] = a1;
      v17[1] = a2 & 0xFFFFFFFFFFFFFFLL;
      v4 = (char *)v17 + (HIBYTE(a2) & 0xF);
      v5 = v17;
    }
    else
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v2 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v3 = a1 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v2 = sub_1DACA3088();
      }
      if (v2)
        v4 = (_BYTE *)(v2 + v3);
      else
        v4 = 0;
      v5 = (_BYTE *)v2;
    }
    v6 = sub_1DAC75A58(v5, v4);
    v8 = v7;
    if (v7 >> 60 != 15)
    {
      swift_bridgeObjectRelease();
      *(_QWORD *)&v14[0] = v6;
      *((_QWORD *)&v14[0] + 1) = v8;
      return *(_QWORD *)&v14[0];
    }
    if ((a2 & 0x1000000000000000) != 0)
    {
LABEL_20:
      v9 = sub_1DACA2DE8();
    }
    else if ((a2 & 0x2000000000000000) != 0)
    {
      v9 = HIBYTE(a2) & 0xF;
    }
    else
    {
      v9 = a1 & 0xFFFFFFFFFFFFLL;
    }
    *(_QWORD *)&v14[0] = sub_1DAC75ABC(v9);
    *((_QWORD *)&v14[0] + 1) = v10;
    MEMORY[0x1E0C80A78](*(_QWORD *)&v14[0]);
    sub_1DAC73DCC();
    __asm { BR              X12 }
  }
  sub_1DAC75BB4(v14, (uint64_t)v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  sub_1DACA27E8();
  swift_bridgeObjectRelease();
  v14[0] = v16;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  return *(_QWORD *)&v14[0];
}

BOOL sub_1DAC72370(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1DAC72384()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

uint64_t sub_1DAC723C8()
{
  return sub_1DACA325C();
}

uint64_t sub_1DAC723F0()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

uint64_t sub_1DAC72430(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  unint64_t v30;

  v6 = sub_1DACA2C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAC45B94(a1, a2);
  v12 = v11;
  v14 = v13;
  if (v10 != a3)
  {
    v22 = v10;
    sub_1DACA2BFC();
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_1DACA304C();
    sub_1DACA2DDC();
    v28 = v22;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    v28 = a3;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
LABEL_8:
    sub_1DACA2DDC();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  if (a3 == 2)
  {
    sub_1DAC72764(2);
    v16 = v15;
    v18 = v17;
    sub_1DAC324C8(v12, v14);
    sub_1DAC4970C(v16, v18);
    v20 = v19;
    sub_1DAC33928(v12, v14);
    sub_1DAC33928(v16, v18);
    if ((v20 & 1) != 0)
    {
      sub_1DAC33928(v12, v14);
      return 1;
    }
    sub_1DACA2BFC();
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_1DACA304C();
    sub_1DACA2DDC();
    sub_1DAC324C8(v12, v14);
    sub_1DACA2908();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v12, v14);
    sub_1DACA2DDC();
    sub_1DAC72764(2);
    v24 = v23;
    v26 = v25;
    sub_1DACA2908();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v24, v26);
    goto LABEL_8;
  }
  sub_1DACA2BFC();
  sub_1DACA2C98();
LABEL_9:
  sub_1DAC33928(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

void sub_1DAC72764(__int16 a1)
{
  uint64_t v2;
  uint64_t v3;
  __int16 v5;
  _BYTE v6[46];

  *(_QWORD *)&v6[38] = *MEMORY[0x1E0C80C00];
  v2 = sub_1DACA2D10();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DACA2D34();
  MEMORY[0x1E0C80A78](v3);
  sub_1DACA2D28();
  v5 = a1;
  sub_1DAC49610((uint64_t)&v5, (uint64_t)v6);
  __asm { BR              X10 }
}

uint64_t sub_1DAC72858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v7 - 128) = v4;
  *(_WORD *)(v7 - 120) = v5;
  *(_BYTE *)(v7 - 118) = BYTE2(v5);
  *(_BYTE *)(v7 - 117) = BYTE3(v5);
  *(_BYTE *)(v7 - 116) = BYTE4(v5);
  *(_BYTE *)(v7 - 115) = BYTE5(v5);
  sub_1DAC3250C(&qword_1EDAF3578, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  sub_1DACA2D04();
  sub_1DAC33928(v4, v5);
  v8 = swift_bridgeObjectRetain();
  *(_QWORD *)(v7 - 128) = sub_1DAC447C0(v8, &qword_1EDAF36B0, (uint64_t (*)(uint64_t *, _QWORD *, uint64_t, uint64_t))sub_1DAC74D08);
  sub_1DAC741CC((_QWORD **)(v7 - 128));
  if (v1)
  {
    swift_release();
    __break(1u);
    JUMPOUT(0x1DAC72B78);
  }
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v7 - 128);
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    swift_retain();
    v11 = (uint64_t *)(v9 + 56);
    do
    {
      v13 = *(v11 - 1);
      v12 = *v11;
      *(_OWORD *)(v7 - 128) = *(_OWORD *)(v11 - 3);
      *(_QWORD *)(v7 - 112) = v13;
      *(_QWORD *)(v7 - 104) = v12;
      sub_1DAC72F98((uint64_t *)(v7 - 128));
      v11 += 4;
      --v10;
    }
    while (v10);
    swift_release();
  }
  swift_release();
  sub_1DACA2D1C();
  *(_QWORD *)(v7 - 104) = v0;
  *(_QWORD *)(v7 - 96) = sub_1DAC3250C(&qword_1EDAF3570, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA92D8]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v7 - 128));
  v15 = *(_QWORD *)(v7 - 160);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(boxed_opaque_existential_1, v2, v0);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v7 - 128), *(_QWORD *)(v7 - 104));
  sub_1DACA27E8();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v2, v0);
  v16 = *(_QWORD *)(v7 - 144);
  __swift_destroy_boxed_opaque_existential_1(v7 - 128);
  sub_1DAC33928(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 168) + 8))(v3, v6);
  return v16;
}

uint64_t sub_1DAC72B88(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  if (!*(_QWORD *)(a3 + 16))
    return 0;
  v6 = *a1;
  v5 = a1[1];
  swift_bridgeObjectRetain();
  v7 = sub_1DAC331BC(v6, v5);
  if ((v8 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v7);
  v11 = *v9;
  v10 = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (v11 == a1[4] && v10 == a1[5])
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v13 = sub_1DACA31B4();
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DAC72C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t result;
  _QWORD *v11;
  uint64_t i;
  uint64_t v13;
  BOOL v14;

  v5 = a5[2];
  if (!v5)
    return 0;
  if (a5[4] == a1 && a5[5] == a2)
    return 1;
  result = sub_1DACA31B4();
  if ((result & 1) != 0)
    return 1;
  if (v5 == 1)
    return 0;
  v11 = a5 + 7;
  for (i = 1; ; ++i)
  {
    v13 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v14 = *(v11 - 1) == a1 && *v11 == a2;
    if (v14 || (sub_1DACA31B4() & 1) != 0)
      return 1;
    result = 0;
    v11 += 2;
    if (v13 == v5)
      return result;
  }
  __break(1u);
  return result;
}

BOOL sub_1DAC72D0C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_1DAC72D24()
{
  _BYTE *v0;

  if (*v0)
    return 0x4764657865646E69;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_1DAC72D6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DAC76038(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DAC72D90()
{
  return 0;
}

void sub_1DAC72D9C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1DAC72DA8()
{
  sub_1DAC75FB0();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC72DD0()
{
  sub_1DAC75FB0();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC72DF8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];
  char v12;
  char v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3918);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC75FB0();
  sub_1DACA3298();
  v13 = 0;
  sub_1DACA3184();
  if (!v3)
  {
    v11[1] = a3;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3588);
    sub_1DAC762FC(&qword_1EDAF38C8, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
    sub_1DACA3178();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1DAC72F50@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_1DAC7614C(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_1DAC72F7C(_QWORD *a1)
{
  unsigned __int16 *v1;

  return sub_1DAC72DF8(a1, *v1, *((_QWORD *)v1 + 1));
}

void sub_1DAC72F98(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  sub_1DAC71E74(v1, v2);
  __asm { BR              X10 }
}

uint64_t sub_1DAC73010()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  sub_1DACA2D34();
  sub_1DAC3250C(&qword_1EDAF3578, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  sub_1DACA2D04();
  sub_1DAC33928(v2, v3);
  sub_1DAC33928(v2, v3);
  swift_bridgeObjectRetain();
  v5 = sub_1DAC71E74(v0, v1);
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)&loc_1DAC731E0
                                                            + *((int *)qword_1DAC73418 + (v4 >> 62))))(v5, v4);
}

uint64_t sub_1DAC731F0()
{
  uint64_t v0;
  unint64_t v1;

  sub_1DACA2D34();
  sub_1DAC3250C(&qword_1EDAF3578, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
  sub_1DACA2D04();
  sub_1DAC33928(v0, v1);
  return sub_1DAC33928(v0, v1);
}

uint64_t sub_1DAC73428()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_1DACA3250();
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC7540C((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC73494(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC7540C(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC734E0()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_1DACA3250();
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC7540C((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC73548(__int16 *a1, __int16 *a2)
{
  __int16 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  char v12;

  v2 = *a2;
  sub_1DAC72764(*a1);
  v4 = v3;
  v6 = v5;
  sub_1DAC72764(v2);
  v8 = v7;
  v10 = v9;
  sub_1DAC4970C(v4, v6);
  v12 = v11;
  sub_1DAC33928(v8, v10);
  sub_1DAC33928(v4, v6);
  return v12 & 1;
}

unint64_t sub_1DAC735DC()
{
  unint64_t result;

  result = qword_1F028BFB8;
  if (!qword_1F028BFB8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7268, &type metadata for UserGuideClientState);
    atomic_store(result, (unint64_t *)&qword_1F028BFB8);
  }
  return result;
}

_QWORD *sub_1DAC73630(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1DAC74F28((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1DAC75BE8();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

_QWORD *sub_1DAC73714(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_1DAC75124((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1DAC75BE8();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

void sub_1DAC737F8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_1DAC73820(a1, a2, a3, a4, (unint64_t *)&qword_1EDAF2FB8);
}

void sub_1DAC7380C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  sub_1DAC73820(a1, a2, a3, a4, (unint64_t *)&qword_1EDAF3630);
}

void sub_1DAC73820(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5;
  uint64_t v6;
  _QWORD *v9;
  int64_t v10;
  uint64_t v11;

  v5 = a4 >> 1;
  v6 = (a4 >> 1) - a3;
  if (__OFSUB__(a4 >> 1, a3))
  {
LABEL_11:
    __break(1u);
    return;
  }
  if (v6)
  {
    if (v6 <= 0)
    {
      if (v5 != a3)
      {
LABEL_7:
        sub_1DAC3757C(0, a5);
        swift_arrayInitWithCopy();
        return;
      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36D0);
      v9 = (_QWORD *)swift_allocObject();
      v10 = _swift_stdlib_malloc_size(v9);
      v11 = v10 - 32;
      if (v10 < 32)
        v11 = v10 - 25;
      v9[2] = v6;
      v9[3] = (2 * (v11 >> 3)) | 1;
      if (v5 != a3)
        goto LABEL_7;
    }
    __break(1u);
    goto LABEL_11;
  }
}

_QWORD *sub_1DAC73914(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36A8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35C8);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_1DAC73A34(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F028BFC0);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_1DAC73B54(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1DAC73CA8(a1, a2, a3, a4, &qword_1EDAF2FE8, &qword_1EDAF35B0);
}

_QWORD *sub_1DAC73B68(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1DAC73CA8(a1, a2, a3, a4, &qword_1EDAF36A0, &qword_1EDAF35C0);
}

char *sub_1DAC73B7C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36D8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_1DAC73C80(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1DAC73CA8(a1, a2, a3, a4, &qword_1EDAF3920, &qword_1EDAF38D0);
}

_QWORD *sub_1DAC73C94(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1DAC73CA8(a1, a2, a3, a4, &qword_1EDAF2FF0, &qword_1EDAF2FA8);
}

_QWORD *sub_1DAC73CA8(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  int64_t v14;
  uint64_t v15;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v15 = v14 - 32;
    if (v14 < 32)
      v15 = v14 - 25;
    v13[2] = v11;
    v13[3] = 2 * (v15 >> 3);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || v13 + 4 >= &a4[v11 + 4])
      memmove(v13 + 4, a4 + 4, 8 * v11);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v13;
}

void sub_1DAC73DCC()
{
  __asm { BR              X11 }
}

_QWORD *sub_1DAC73E2C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *(*v3)(_QWORD **__return_ptr, uint64_t *, char *);
  uint64_t v4;
  _QWORD *result;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  unsigned int v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned __int8 v12;

  v8 = v4;
  LOWORD(v9) = a1;
  BYTE2(v9) = BYTE2(a1);
  HIBYTE(v9) = BYTE3(a1);
  v10 = BYTE4(a1);
  v11 = BYTE5(a1);
  v12 = BYTE6(a1);
  result = v3(&v7, &v8, (char *)&v8 + BYTE6(a1));
  if (!v2)
    result = v7;
  v6 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)v11 << 40) | ((unint64_t)v12 << 48);
  *v1 = v8;
  v1[1] = v6;
  return result;
}

_QWORD *sub_1DAC740BC(_QWORD *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *result;
  uint64_t v6;

  if (a3)
  {
    result = a1(&v6, a3, a4 - a3);
    if (v4)
      return result;
    return (_QWORD *)v6;
  }
  result = a1(&v6, 0, 0);
  if (!v4)
    return (_QWORD *)v6;
  return result;
}

char *sub_1DAC74120(uint64_t a1, uint64_t a2, _QWORD *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  uint64_t v3;
  char *result;
  char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = (char *)sub_1DACA27AC();
  if (!result)
    goto LABEL_12;
  v8 = result;
  result = (char *)sub_1DACA27D0();
  v9 = a1 - (_QWORD)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  v10 = __OFSUB__(a2, a1);
  v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = sub_1DACA27C4();
  if (v12 >= v11)
    v13 = v11;
  else
    v13 = v12;
  result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3)
    return (char *)v14;
  return result;
}

uint64_t sub_1DAC741CC(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DAC75334(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_1DAC74234(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_1DAC74234(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  __int128 *v39;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  char v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  _QWORD *v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;

  v3 = a1[1];
  result = sub_1DACA3190();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_1DAC748F0(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v106 = result;
  v103 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x1E0DEE9D8];
    v109 = (char *)(MEMORY[0x1E0DEE9D8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
      v10 = MEMORY[0x1E0DEE9D8];
LABEL_117:
      result = v10;
      v105 = v7;
      if (v11 >= 2)
      {
        v95 = *v103;
        do
        {
          v96 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v95)
            goto LABEL_159;
          v97 = result;
          v98 = *(_QWORD *)(result + 32 + 16 * v96);
          v99 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_1DAC749D0((char *)(v95 + 32 * v98), (char *)(v95 + 32 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v95 + 32 * v99, v109);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_1DAC74CF4(v97);
            v97 = result;
          }
          if (v96 >= *(_QWORD *)(v97 + 16))
            goto LABEL_148;
          v100 = (_QWORD *)(v97 + 32 + 16 * v96);
          *v100 = v98;
          v100[1] = v99;
          v101 = *(_QWORD *)(v97 + 16);
          if (v11 > v101)
            goto LABEL_149;
          memmove((void *)(v97 + 32 + 16 * (v11 - 1)), (const void *)(v97 + 32 + 16 * v11), 16 * (v101 - v11));
          result = v97;
          *(_QWORD *)(v97 + 16) = v101 - 1;
          v11 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v105 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v105 = MEMORY[0x1E0DEE9D8];
  }
  else
  {
    v6 = v5 >> 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F028BFC0);
    result = sub_1DACA2E6C();
    *(_QWORD *)(result + 16) = v6;
    v105 = result;
    v109 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v104 = *a1 + 8;
  v102 = *a1 + 24;
  v10 = MEMORY[0x1E0DEE9D8];
  v107 = v3;
  v108 = *a1;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 32 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 32 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_1DACA31B4();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v104 + 32 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 32 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_1DACA31B4();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 4;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 32 * v18;
        v24 = 32 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = (_OWORD *)(v9 + v24);
            v28 = v9 + v23;
            v29 = *(_OWORD *)(v9 + v24);
            v30 = *(_QWORD *)(v9 + v24 + 16);
            v31 = *(_QWORD *)(v9 + v24 + 24);
            v32 = *(_OWORD *)(v9 + v23 - 16);
            *v27 = *(_OWORD *)(v9 + v23 - 32);
            v27[1] = v32;
            *(_OWORD *)(v28 - 32) = v29;
            *(_QWORD *)(v28 - 16) = v30;
            *(_QWORD *)(v28 - 8) = v31;
          }
          ++v26;
          v23 -= 32;
          v24 += 32;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v106)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_1DAC74BFC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v45 = *(_QWORD *)(v10 + 16);
    v44 = *(_QWORD *)(v10 + 24);
    v11 = v45 + 1;
    if (v45 >= v44 >> 1)
    {
      result = (uint64_t)sub_1DAC74BFC((char *)(v44 > 1), v45 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v46 = v10 + 32;
    v47 = (uint64_t *)(v10 + 32 + 16 * v45);
    *v47 = v12;
    v47[1] = v8;
    if (v45)
    {
      v9 = v108;
      while (1)
      {
        v48 = v11 - 1;
        if (v11 >= 4)
        {
          v53 = v46 + 16 * v11;
          v54 = *(_QWORD *)(v53 - 64);
          v55 = *(_QWORD *)(v53 - 56);
          v59 = __OFSUB__(v55, v54);
          v56 = v55 - v54;
          if (v59)
            goto LABEL_134;
          v58 = *(_QWORD *)(v53 - 48);
          v57 = *(_QWORD *)(v53 - 40);
          v59 = __OFSUB__(v57, v58);
          v51 = v57 - v58;
          v52 = v59;
          if (v59)
            goto LABEL_135;
          v60 = v11 - 2;
          v61 = (uint64_t *)(v46 + 16 * (v11 - 2));
          v63 = *v61;
          v62 = v61[1];
          v59 = __OFSUB__(v62, v63);
          v64 = v62 - v63;
          if (v59)
            goto LABEL_136;
          v59 = __OFADD__(v51, v64);
          v65 = v51 + v64;
          if (v59)
            goto LABEL_138;
          if (v65 >= v56)
          {
            v83 = (uint64_t *)(v46 + 16 * v48);
            v85 = *v83;
            v84 = v83[1];
            v59 = __OFSUB__(v84, v85);
            v86 = v84 - v85;
            if (v59)
              goto LABEL_144;
            v76 = v51 < v86;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v77 = *(_QWORD *)(v10 + 32);
            v78 = *(_QWORD *)(v10 + 40);
            v59 = __OFSUB__(v78, v77);
            v70 = v78 - v77;
            v71 = v59;
            goto LABEL_98;
          }
          v50 = *(_QWORD *)(v10 + 32);
          v49 = *(_QWORD *)(v10 + 40);
          v59 = __OFSUB__(v49, v50);
          v51 = v49 - v50;
          v52 = v59;
        }
        if ((v52 & 1) != 0)
          goto LABEL_137;
        v60 = v11 - 2;
        v66 = (uint64_t *)(v46 + 16 * (v11 - 2));
        v68 = *v66;
        v67 = v66[1];
        v69 = __OFSUB__(v67, v68);
        v70 = v67 - v68;
        v71 = v69;
        if (v69)
          goto LABEL_139;
        v72 = (uint64_t *)(v46 + 16 * v48);
        v74 = *v72;
        v73 = v72[1];
        v59 = __OFSUB__(v73, v74);
        v75 = v73 - v74;
        if (v59)
          goto LABEL_141;
        if (__OFADD__(v70, v75))
          goto LABEL_143;
        if (v70 + v75 >= v51)
        {
          v76 = v51 < v75;
LABEL_104:
          if (v76)
            v48 = v60;
          goto LABEL_106;
        }
LABEL_98:
        if ((v71 & 1) != 0)
          goto LABEL_140;
        v79 = (uint64_t *)(v46 + 16 * v48);
        v81 = *v79;
        v80 = v79[1];
        v59 = __OFSUB__(v80, v81);
        v82 = v80 - v81;
        if (v59)
          goto LABEL_142;
        if (v82 < v70)
          goto LABEL_15;
LABEL_106:
        v87 = v48 - 1;
        if (v48 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9)
          goto LABEL_157;
        v88 = v10;
        v89 = v9;
        v90 = (uint64_t *)(v46 + 16 * v87);
        v91 = *v90;
        v92 = (_QWORD *)(v46 + 16 * v48);
        v93 = v92[1];
        result = sub_1DAC749D0((char *)(v89 + 32 * *v90), (char *)(v89 + 32 * *v92), v89 + 32 * v93, v109);
        if (v1)
          goto LABEL_114;
        if (v93 < v91)
          goto LABEL_131;
        if (v48 > *(_QWORD *)(v88 + 16))
          goto LABEL_132;
        *v90 = v91;
        *(_QWORD *)(v46 + 16 * v87 + 8) = v93;
        v94 = *(_QWORD *)(v88 + 16);
        if (v48 >= v94)
          goto LABEL_133;
        v10 = v88;
        v11 = v94 - 1;
        result = (uint64_t)memmove((void *)(v46 + 16 * v48), v92 + 2, 16 * (v94 - 1 - v48));
        *(_QWORD *)(v88 + 16) = v94 - 1;
        v76 = v94 > 2;
        v9 = v108;
        if (!v76)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v108;
LABEL_15:
    v3 = v107;
    if (v8 >= v107)
    {
      v7 = v105;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v106))
    goto LABEL_153;
  if (v12 + v106 >= v3)
    v33 = v3;
  else
    v33 = v12 + v106;
  if (v33 >= v12)
  {
    if (v8 != v33)
    {
      v34 = (_QWORD *)(v102 + 32 * v8);
      do
      {
        v35 = (uint64_t *)(v9 + 32 * v8);
        result = *v35;
        v36 = v35[1];
        v37 = v12;
        v38 = v34;
        do
        {
          v39 = (__int128 *)(v38 - 7);
          if (result == *(v38 - 7) && v36 == *(v38 - 6))
            break;
          result = sub_1DACA31B4();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          v42 = *v39;
          v41 = *(_OWORD *)(v38 - 5);
          *(v38 - 4) = *v38;
          v38 -= 4;
          result = v38[1];
          v36 = v38[2];
          v43 = v38[3];
          v39[2] = v42;
          v39[3] = v41;
          *(v38 - 3) = result;
          *(v38 - 2) = v36;
          *(v38 - 1) = v43;
          ++v37;
        }
        while (v8 != v37);
        ++v8;
        v34 += 4;
      }
      while (v8 != v33);
      v8 = v33;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

uint64_t sub_1DAC748F0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  __int128 *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 32 * a3 + 24;
LABEL_5:
    v9 = (uint64_t *)(v7 + 32 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (_QWORD *)v8;
    while (1)
    {
      v13 = (__int128 *)(v12 - 7);
      v14 = result == *(v12 - 7) && v10 == *(v12 - 6);
      if (v14 || (result = sub_1DACA31B4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 32;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v16 = *v13;
      v15 = *(_OWORD *)(v12 - 5);
      *(v12 - 4) = *v12;
      v12 -= 4;
      result = v12[1];
      v10 = v12[2];
      v17 = v12[3];
      v13[2] = v16;
      v13[3] = v15;
      *(v12 - 3) = result;
      *(v12 - 2) = v10;
      *(v12 - 1) = v17;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1DAC749D0(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  __int128 v17;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  BOOL v22;
  __int128 v23;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = __src - __dst + 31;
  if (__src - __dst >= 0)
    v9 = __src - __dst;
  v10 = v9 >> 5;
  v11 = a3 - (_QWORD)__src;
  v12 = a3 - (_QWORD)__src + 31;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v12 = a3 - (_QWORD)__src;
  v13 = v12 >> 5;
  if (v10 >= v12 >> 5)
  {
    if (a4 != __src || &__src[32 * v13] <= a4)
      memmove(a4, __src, 32 * v13);
    v14 = &v4[32 * v13];
    if (v7 >= v6 || v11 < 32)
      goto LABEL_48;
    v18 = (char *)(a3 - 32);
    while (1)
    {
      v19 = v18 + 32;
      v20 = v6 - 32;
      v21 = *((_QWORD *)v14 - 4) == *((_QWORD *)v6 - 4) && *((_QWORD *)v14 - 3) == *((_QWORD *)v6 - 3);
      if (v21 || (sub_1DACA31B4() & 1) == 0)
      {
        v20 = v14 - 32;
        if (v19 != v14)
        {
          v14 -= 32;
LABEL_45:
          v23 = *((_OWORD *)v20 + 1);
          *(_OWORD *)v18 = *(_OWORD *)v20;
          *((_OWORD *)v18 + 1) = v23;
          goto LABEL_46;
        }
        v22 = v18 >= v14;
        v14 -= 32;
        if (v22)
          goto LABEL_45;
      }
      else
      {
        if (v19 != v6)
        {
          v6 -= 32;
          goto LABEL_45;
        }
        v22 = v18 >= v6;
        v6 -= 32;
        if (v22)
          goto LABEL_45;
      }
LABEL_46:
      if (v6 > v7)
      {
        v18 -= 32;
        if (v14 > v4)
          continue;
      }
      goto LABEL_48;
    }
  }
  if (a4 != __dst || &__dst[32 * v10] <= a4)
    memmove(a4, __dst, 32 * v10);
  v14 = &v4[32 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 32)
  {
    while (1)
    {
      v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v15 || (sub_1DACA31B4() & 1) == 0)
        break;
      v16 = v6;
      v15 = v7 == v6;
      v6 += 32;
      if (!v15)
        goto LABEL_20;
LABEL_21:
      v7 += 32;
      if (v4 >= v14 || (unint64_t)v6 >= a3)
        goto LABEL_23;
    }
    v16 = v4;
    v15 = v7 == v4;
    v4 += 32;
    if (v15)
      goto LABEL_21;
LABEL_20:
    v17 = *((_OWORD *)v16 + 1);
    *(_OWORD *)v7 = *(_OWORD *)v16;
    *((_OWORD *)v7 + 1) = v17;
    goto LABEL_21;
  }
LABEL_23:
  v6 = v7;
LABEL_48:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 0x1FuLL : 0)) & 0xFFFFFFFFFFFFFFE0])
    memmove(v6, v4, 32 * ((v14 - v4) / 32));
  return 1;
}

char *sub_1DAC74BFC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_1DAC74CF4(uint64_t a1)
{
  return sub_1DAC74BFC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1DAC74D08(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v27 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = 16 * v16;
    v21 = (uint64_t *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v23 = *v21;
    v22 = v21[1];
    v24 = (uint64_t *)(*(_QWORD *)(a4 + 56) + v20);
    v25 = *v24;
    v26 = v24[1];
    *v11 = v23;
    v11[1] = v22;
    v11[2] = v25;
    v11[3] = v26;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 4;
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          v18 = *(_QWORD *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            v17 = v12;
            goto LABEL_18;
          }
          v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            v9 = 0;
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v17 >= v14)
              {
                v9 = 0;
                v12 = v14 - 1;
                goto LABEL_37;
              }
              v18 = *(_QWORD *)(v6 + 8 * v17);
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v27;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_1DAC74F28(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1DAC75124(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

_QWORD *sub_1DAC75320(_QWORD *a1)
{
  return sub_1DAC73914(0, a1[2], 0, a1);
}

_QWORD *sub_1DAC75334(_QWORD *a1)
{
  return sub_1DAC73A34(0, a1[2], 0, a1);
}

uint64_t sub_1DAC75348(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1DACA27AC();
  if (!result || (result = sub_1DACA27D0(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1DACA27C4();
      sub_1DACA2D34();
      sub_1DAC3250C(&qword_1EDAF3578, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
      return sub_1DACA2D04();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC7540C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v9 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v9 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v9);
    ++v8;
    if (!v10)
    {
      v8 = v9 + 1;
      if (v9 + 1 >= v5)
        goto LABEL_19;
      v10 = *(_QWORD *)(v12 + 8 * v8);
      if (!v10)
        break;
    }
LABEL_18:
    v4 = (v10 - 1) & v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    swift_bridgeObjectRelease();
    sub_1DACA2DD0();
    swift_bridgeObjectRelease();
    result = sub_1DACA3274();
    v7 ^= result;
  }
  v11 = v9 + 2;
  if (v11 >= v5)
  {
LABEL_19:
    swift_release();
    return sub_1DACA325C();
  }
  v10 = *(_QWORD *)(v12 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_18;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v5)
      goto LABEL_19;
    v10 = *(_QWORD *)(v12 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1DAC755D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;

  v18 = a2 + 64;
  v3 = 1 << *(_BYTE *)(a2 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a2 + 64);
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v15 >= v6)
      goto LABEL_19;
    v16 = *(_QWORD *)(v18 + 8 * v15);
    ++v9;
    if (!v16)
    {
      v9 = v15 + 1;
      if (v15 + 1 >= v6)
        goto LABEL_19;
      v16 = *(_QWORD *)(v18 + 8 * v9);
      if (!v16)
        break;
    }
LABEL_18:
    v5 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a2 + 56) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    swift_bridgeObjectRetain();
    sub_1DAC324C8(v13, v14);
    sub_1DACA2DD0();
    swift_bridgeObjectRelease();
    sub_1DACA2950();
    sub_1DAC33928(v13, v14);
    result = sub_1DACA3274();
    v8 ^= result;
  }
  v17 = v15 + 2;
  if (v17 >= v6)
  {
LABEL_19:
    swift_release();
    return sub_1DACA325C();
  }
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
  {
    v9 = v17;
    goto LABEL_18;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v6)
      goto LABEL_19;
    v16 = *(_QWORD *)(v18 + 8 * v9);
    ++v17;
    if (v16)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_1DAC7579C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1DACA2E18();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1DF0A5500](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_1DAC75814@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  char v3;
  uint64_t v4;

  if (result)
  {
    swift_bridgeObjectRetain();
    result = sub_1DACA3058();
    if ((v3 & 1) == 0)
    {
      v4 = result;
      result = swift_bridgeObjectRelease();
      *a2 = 0;
      a2[1] = 0xE000000000000000;
      a2[2] = 15;
      a2[3] = v4;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC7589C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = a1;
  v9 = a2;
  v10 = BYTE2(a2);
  v11 = BYTE3(a2);
  v12 = BYTE4(a2);
  v13 = BYTE5(a2);
  sub_1DAC49954((uint64_t)&v8, (uint64_t)&v8 + BYTE6(a2), a3, a4);
  if (!v4)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_1DAC759A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1DACA27DC();
  swift_allocObject();
  result = sub_1DACA27A0();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1DACA2914();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1DAC75A18(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3000);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *sub_1DAC75A58(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = a2 - result;
    if (a2 == result)
    {
      return 0;
    }
    else if (v2 <= 14)
    {
      return (_BYTE *)sub_1DAC49BAC(result, a2);
    }
    else if ((unint64_t)v2 >= 0x7FFFFFFF)
    {
      return (_BYTE *)sub_1DAC759A0((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      return (_BYTE *)sub_1DAC325C0((uint64_t)result, (uint64_t)a2);
    }
  }
  return result;
}

uint64_t sub_1DAC75ABC(uint64_t result)
{
  unint64_t v1;

  if (result)
  {
    v1 = result;
    if (result <= 14)
    {
      if (result < 0)
        __break(1u);
      else
        return 0;
    }
    else
    {
      sub_1DACA27DC();
      swift_allocObject();
      sub_1DACA27B8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_1DACA2914();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

_QWORD *sub_1DAC75B58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  _QWORD v13[2];

  v5 = *(uint64_t **)(v3 + 16);
  v7 = *v5;
  v6 = v5[1];
  v13[0] = v7;
  v13[1] = v6;
  v12[2] = v13;
  result = sub_1DAC740BC((_QWORD *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_1DAC75BCC, (uint64_t)v12, a1, a2);
  *a3 = result;
  a3[1] = v9;
  a3[2] = v10;
  a3[3] = v11;
  return result;
}

uint64_t sub_1DAC75BB4(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1DAC75BCC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1DAC75814(a1, a2);
}

uint64_t sub_1DAC75BE8()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for UserGuideClientState.IndexState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
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
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGuideClientState.IndexState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC75CCC + 4 * byte_1DACA7259[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DAC75D00 + 4 * byte_1DACA7254[v4]))();
}

uint64_t sub_1DAC75D00(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC75D08(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC75D10);
  return result;
}

uint64_t sub_1DAC75D1C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC75D24);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DAC75D28(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC75D30(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC75D3C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DAC75D48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState.IndexState()
{
  return &type metadata for UserGuideClientState.IndexState;
}

uint64_t initializeBufferWithCopyOfBuffer for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for UserGuideClientState()
{
  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for UserGuideClientState(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a1 = *(_WORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGuideClientState(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGuideClientState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState()
{
  return &type metadata for UserGuideClientState;
}

unint64_t sub_1DAC75EB4(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1DAC75EE0();
  result = sub_1DAC75F24();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1DAC75EE0()
{
  unint64_t result;

  result = qword_1EDAF31B8[0];
  if (!qword_1EDAF31B8[0])
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA737C, &type metadata for UserGuideClientState);
    atomic_store(result, qword_1EDAF31B8);
  }
  return result;
}

unint64_t sub_1DAC75F24()
{
  unint64_t result;

  result = qword_1EDAF38B0;
  if (!qword_1EDAF38B0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA73A4, &type metadata for UserGuideClientState);
    atomic_store(result, (unint64_t *)&qword_1EDAF38B0);
  }
  return result;
}

unint64_t sub_1DAC75F6C()
{
  unint64_t result;

  result = qword_1F028BFC8;
  if (!qword_1F028BFC8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7354, &type metadata for UserGuideClientState.IndexState);
    atomic_store(result, (unint64_t *)&qword_1F028BFC8);
  }
  return result;
}

unint64_t sub_1DAC75FB0()
{
  unint64_t result;

  result = qword_1EDAF31A0;
  if (!qword_1EDAF31A0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7490, &type metadata for UserGuideClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF31A0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0A60B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DAC76038(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1DACA31B4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4764657865646E69 && a2 == 0xED00007365646975)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1DACA31B4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DAC7614C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3680);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DAC765A0(MEMORY[0x1E0DEE9D8]);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1DAC75FB0();
  sub_1DACA328C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[31] = 0;
    v7 = sub_1DACA3148();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3588);
    v9[30] = 1;
    sub_1DAC762FC(&qword_1EDAF3590, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    sub_1DACA313C();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1DAC762FC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAF3588);
    v8[0] = a2;
    v8[1] = a2;
    result = MEMORY[0x1DF0A60C4](a3, v7, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for UserGuideClientState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for UserGuideClientState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC76438 + 4 * byte_1DACA7263[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DAC7646C + 4 * byte_1DACA725E[v4]))();
}

uint64_t sub_1DAC7646C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC76474(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC7647CLL);
  return result;
}

uint64_t sub_1DAC76488(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC76490);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DAC76494(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC7649C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1DAC764A8(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideClientState.CodingKeys()
{
  return &type metadata for UserGuideClientState.CodingKeys;
}

unint64_t sub_1DAC764C8()
{
  unint64_t result;

  result = qword_1F028BFD0;
  if (!qword_1F028BFD0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7468, &type metadata for UserGuideClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028BFD0);
  }
  return result;
}

unint64_t sub_1DAC76510()
{
  unint64_t result;

  result = qword_1EDAF31B0;
  if (!qword_1EDAF31B0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA73D8, &type metadata for UserGuideClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF31B0);
  }
  return result;
}

unint64_t sub_1DAC76558()
{
  unint64_t result;

  result = qword_1EDAF31A8;
  if (!qword_1EDAF31A8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7400, &type metadata for UserGuideClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF31A8);
  }
  return result;
}

unint64_t sub_1DAC765A0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3910);
  v2 = (_QWORD *)sub_1DACA3118();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1DAC331BC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
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

unint64_t sub_1DAC766C0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C000);
  v2 = (_QWORD *)sub_1DACA3118();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_1DAC331BC(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
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

unint64_t sub_1DAC767D8(uint64_t a1)
{
  return sub_1DAC76810(a1, &qword_1EDAF3668, &qword_1F028BFF8, (uint64_t (*)(uint64_t *, unint64_t))sub_1DAC33D7C);
}

unint64_t sub_1DAC767F4(uint64_t a1)
{
  return sub_1DAC76810(a1, &qword_1EDAF3660, &qword_1EDAF3928, (uint64_t (*)(uint64_t *, unint64_t))sub_1DAC33D7C);
}

unint64_t sub_1DAC76810(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t *, unint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_1DACA3118();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1DAC77494(v11, (uint64_t)&v20, a3);
    v12 = v20;
    v13 = v21;
    result = sub_1DAC331BC(v20, v21);
    if ((v15 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v16 = (uint64_t *)(v8[6] + 16 * result);
    *v16 = v12;
    v16[1] = v13;
    result = a4(&v22, v8[7] + 32 * result);
    v17 = v8[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_11;
    v8[2] = v19;
    v11 += 48;
    if (!--v9)
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

unint64_t sub_1DAC76948(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3658);
  v2 = (_QWORD *)sub_1DACA3118();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_1DAC331BC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
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

uint64_t sub_1DAC76A58()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DAC76A94()
{
  return swift_deallocObject();
}

void __swiftcall TPSFullTipUsageEventManager.contextualInfo(for:)(TPSContextualInfo_optional *__return_ptr retstr, Swift::String a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028BFE0);
  sub_1DACA2F68();
}

uint64_t sub_1DAC76B10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  void *v12;
  id v13;

  sub_1DAC458A0();
  v8 = (uint64_t *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  v9 = *v8;
  if (*(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DAC331BC(a2, a3);
    if ((v11 & 1) != 0)
    {
      v12 = *(void **)(*(_QWORD *)(v9 + 56) + 8 * v10);
      v13 = v12;
    }
    else
    {
      v12 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  *a4 = v12;
  return swift_endAccess();
}

uint64_t sub_1DAC76BD0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_1DAC76B10(v1[2], v1[3], v1[4], a1);
}

uint64_t TPSFullTipUsageEventManager.contextualInfoMap()()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35A8);
  sub_1DACA2F68();
  return v1;
}

uint64_t sub_1DAC76CE0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v4;

  sub_1DAC458A0();
  v4 = (_QWORD *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  *a2 = *v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DAC76D48@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1DAC76CE0(*(_QWORD *)(v1 + 16), a1);
}

Swift::Void __swiftcall TPSFullTipUsageEventManager.removeUsageEventCache()()
{
  char *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  char isEscapingClosureAtFileLocation;
  _QWORD v7[6];

  v1 = *(NSObject **)&v0[OBJC_IVAR___TPSFullTipUsageEventManager_queue];
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_1DAC770F0;
  *(_QWORD *)(v3 + 24) = v2;
  v7[4] = sub_1DAC774EC;
  v7[5] = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 1107296256;
  v7[2] = sub_1DAC45458;
  v7[3] = &block_descriptor_13;
  v4 = _Block_copy(v7);
  v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
}

void sub_1DAC76F3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v2 = sub_1DACA2BCC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (uint64_t *)((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (_QWORD *)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap);
  swift_beginAccess();
  *v6 = MEMORY[0x1E0DEE9E0];
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + OBJC_IVAR___TPSFullTipUsageEventManager_queue);
  *v5 = v7;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF740], v2);
  v8 = v7;
  LOBYTE(v7) = sub_1DACA2BD8();
  (*(void (**)(_QWORD *, uint64_t))(v3 + 8))(v5, v2);
  if ((v7 & 1) != 0)
  {
    v9 = (void *)objc_opt_self();
    sub_1DAC3757C(0, &qword_1EDAF3620);
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1DACA2D40();
    swift_bridgeObjectRelease();
    v11 = (void *)sub_1DACA2D88();
    objc_msgSend(v9, sel_archivedDataWithRootObject_forKey_, v10, v11);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DAC770CC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1DAC770F0()
{
  uint64_t v0;

  sub_1DAC76F3C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DAC770F8()
{
  return swift_deallocObject();
}

id TPSFullTipUsageEventManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TPSFullTipUsageEventManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  objc_class *ObjectType;
  objc_super v13;
  uint64_t v14;

  ObjectType = (objc_class *)swift_getObjectType();
  v1 = sub_1DACA2F50();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_1DACA2BC0();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DACA2F5C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&ObjectType - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR___TPSFullTipUsageEventManager_tipIDToContextualInfoMap;
  v8 = v0;
  v9 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)&v0[v7] = sub_1DAC766C0(MEMORY[0x1E0DEE9D8]);
  v10 = OBJC_IVAR___TPSFullTipUsageEventManager_queue;
  sub_1DAC3757C(0, &qword_1EDAF3618);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0DEF8D8], v3);
  sub_1DACA2BB4();
  v14 = v9;
  sub_1DAC77354();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35E0);
  sub_1DAC7739C();
  sub_1DACA2FEC();
  *(_QWORD *)&v8[v10] = sub_1DACA2F74();
  v8[OBJC_IVAR___TPSFullTipUsageEventManager_initialized] = 0;

  v13.receiver = v8;
  v13.super_class = ObjectType;
  return objc_msgSendSuper2(&v13, sel_init);
}

unint64_t sub_1DAC77354()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAF3610;
  if (!qword_1EDAF3610)
  {
    v1 = sub_1DACA2F50();
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1EDAF3610);
  }
  return result;
}

unint64_t sub_1DAC7739C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAF35E8;
  if (!qword_1EDAF35E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAF35E0);
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDAF35E8);
  }
  return result;
}

id TPSFullTipUsageEventManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPSFullTipUsageEventManager()
{
  return objc_opt_self();
}

uint64_t sub_1DAC77494(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DAC774D8@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DAC76D48(a1);
}

uint64_t sub_1DAC774F8@<X0>(_QWORD *a1@<X8>)
{
  return sub_1DAC76BD0(a1);
}

uint64_t sub_1DAC7750C()
{
  return 1;
}

uint64_t sub_1DAC77514()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

uint64_t sub_1DAC77554()
{
  return sub_1DACA325C();
}

uint64_t sub_1DAC77578()
{
  sub_1DACA3250();
  sub_1DACA325C();
  return sub_1DACA3274();
}

uint64_t sub_1DAC775C4(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v21 = sub_1DACA2860();
  v6 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_1DACA28E4();
  v9 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78](v22);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = 0;
  v12 = a1;
  v13 = objc_msgSend(v12, sel_identifier);
  v14 = sub_1DACA2D94();
  v16 = v15;

  v23 = v14;
  v24 = v16;
  v17 = v21;
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0CAFD60], v21);
  sub_1DAC33980();
  sub_1DACA28D8();

  v18 = a2;
  v19 = v22;
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v18, v22);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v17);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation, v11, v19);
  return v3;
}

uint64_t sub_1DAC77748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[6] = a2;
  v3[7] = v2;
  v3[5] = a1;
  v4 = sub_1DACA2C14();
  v3[8] = v4;
  v3[9] = *(_QWORD *)(v4 - 8);
  v3[10] = swift_task_alloc();
  v3[11] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v3[12] = swift_task_alloc();
  v5 = sub_1DACA28E4();
  v3[13] = v5;
  v3[14] = *(_QWORD *)(v5 - 8);
  v3[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC777FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  sub_1DAC7865C(*(_QWORD *)(v0 + 48), v3);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 112);
  if (v4 == 1)
  {
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80);
    v9 = *(_QWORD *)(v0 + 56);
    v10 = *(_QWORD *)(v0 + 48);
    v28 = *(_QWORD *)(v0 + 64);
    v30 = *(_QWORD *)(v0 + 40);
    sub_1DAC7190C(*(_QWORD *)(v0 + 96), &qword_1EDAF3010);
    sub_1DACA2BFC();
    sub_1DACA304C();
    *(_QWORD *)(v0 + 16) = 0;
    *(_QWORD *)(v0 + 24) = 0xE000000000000000;
    sub_1DACA2DDC();
    v11 = objc_msgSend(*(id *)(v9 + 16), sel_identifier);
    sub_1DACA2D94();

    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    *(_QWORD *)(v0 + 32) = v10;
    type metadata accessor for TPSAssetsConfigurationUserInterfaceStyle(0);
    sub_1DACA30D0();
    sub_1DACA2DDC();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v30, 1, 1, v5);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v12(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104));
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_1DACA28CC();
  v14 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_fileExistsAtPath_, v14);

  v16 = *(_QWORD *)(v0 + 120);
  if (v15)
  {
    v17 = *(_QWORD *)(v0 + 104);
    v19 = *(_QWORD *)(v0 + 72);
    v18 = *(_QWORD *)(v0 + 80);
    v20 = *(_QWORD *)(v0 + 56);
    v29 = *(_QWORD *)(v0 + 64);
    v31 = *(_QWORD *)(v0 + 112);
    v21 = *(_QWORD *)(v0 + 40);
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(*(id *)(v20 + 16), sel_identifier);
    sub_1DACA2D94();

    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2878();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2CA4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v29);
    v12(v21, v16, v17);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v31 + 56))(v21, 0, 1, v17);
    goto LABEL_5;
  }
  v25 = *(_QWORD *)(v0 + 48);
  v24 = *(_QWORD *)(v0 + 56);
  v26 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v26;
  v26[2] = v24;
  v26[3] = v25;
  v26[4] = v16;
  v27 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v27;
  *v27 = v0;
  v27[1] = sub_1DAC77C04;
  return sub_1DACA31D8();
}

uint64_t sub_1DAC77C04()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC77C70()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC77CCC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 112) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1DAC77D30(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  double v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  _QWORD aBlock[7];

  v39 = a4;
  v44 = a3;
  v36 = a1;
  v5 = sub_1DACA28E4();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  MEMORY[0x1E0C80A78](v5);
  v40 = v6;
  v38 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FB0);
  v7 = *(_QWORD *)(v37 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v37);
  v9 = objc_msgSend(*(id *)(a2 + 16), sel_fullContentAssets);
  v10 = objc_msgSend(*(id *)(a2 + 16), sel_language);
  sub_1DACA2D94();

  v11 = objc_msgSend(*(id *)(a2 + 16), sel_assetFileInfoManager);
  v12 = objc_allocWithZone(MEMORY[0x1E0DBF310]);
  v13 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v9, v13, v44, v11);

  v44 = objc_msgSend(v14, sel_cacheIdentifierForType_, 2);
  v15 = (void *)objc_opt_self();
  v35 = v14;
  v43 = objc_msgSend(v15, sel_assetPathFromAssetConfiguration_type_, v14, 2);
  sub_1DAC78A1C();
  v34 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v34)
  {
    v16 = *MEMORY[0x1E0CB3338];
    v17 = swift_allocObject();
    swift_weakInit();
    v18 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v18, v36, v37);
    v21 = v41;
    v20 = v42;
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v41 + 16);
    v36 = a2;
    v23 = v38;
    v22(v38, v39, v42);
    v24 = (*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v25 = (v8 + *(unsigned __int8 *)(v21 + 80) + v24) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v17;
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v26 + v24, v18, v19);
    (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v26 + v25, v23, v20);
    aBlock[4] = sub_1DAC78B3C;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DAC90E0C;
    aBlock[3] = &block_descriptor_0;
    v27 = _Block_copy(aBlock);
    swift_release();
    v28 = v34;
    v30 = v43;
    v29 = v44;
    LODWORD(v31) = v16;
    v32 = objc_msgSend(v34, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v43, v44, 0, v27, v31);

    _Block_release(v27);
    v33 = *(void **)(v36 + 24);
    *(_QWORD *)(v36 + 24) = v32;

  }
  else
  {

    __break(1u);
  }
}

uint64_t sub_1DAC780D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t Strong;
  uint64_t v30;
  int v31;
  void (*v32)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  uint64_t v40;
  void (*v41)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;

  v44 = a11;
  v13 = sub_1DACA2C14();
  v42 = *(_QWORD *)(v13 - 8);
  v43 = v13;
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v40 - v17;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v40 - v23;
  v25 = sub_1DACA28E4();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v40 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v30 = Strong;
    sub_1DAC78C50(a3, (uint64_t)&v45);
    if (v47)
    {
      v31 = swift_dynamicCast();
      v32 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56);
      v32(v24, v31 ^ 1u, 1, v25);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) != 1)
      {
        (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
        sub_1DAC78FD8();
        sub_1DACA2BFC();
        v45 = 0;
        v46 = 0xE000000000000000;
        sub_1DACA304C();
        swift_bridgeObjectRelease();
        v45 = 0xD000000000000012;
        v46 = 0x80000001DACAE740;
        sub_1DACA2878();
        v41 = v32;
        sub_1DACA2DDC();
        swift_bridgeObjectRelease();
        sub_1DACA2DDC();
        v38 = objc_msgSend(*(id *)(v30 + 16), sel_identifier);
        sub_1DACA2D94();
        v40 = a12;

        sub_1DACA2DDC();
        swift_bridgeObjectRelease();
        sub_1DACA2CA4();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v42 + 8))(v18, v43);
        (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v22, v40, v25);
        v41(v22, 0, 1, v25);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FB0);
        sub_1DACA2E9C();
        swift_release();
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v28, v25);
      }
    }
    else
    {
      sub_1DAC7190C((uint64_t)&v45, &qword_1EDAF36F0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v24, 1, 1, v25);
    }
    swift_release();
    sub_1DAC7190C((uint64_t)v24, &qword_1EDAF3010);
  }
  sub_1DACA2BFC();
  v45 = 0;
  v46 = 0xE000000000000000;
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  v48 = 0xD00000000000001DLL;
  v49 = 0x80000001DACAE720;
  swift_beginAccess();
  v33 = swift_weakLoadStrong();
  if (v33)
  {
    v34 = *(id *)(v33 + 16);
    swift_release();
    v35 = objc_msgSend(v34, sel_identifier);

    sub_1DACA2D94();
  }
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  if (a9)
  {
    swift_getErrorValue();
    sub_1DACA3214();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v43);
    v36 = (uint64_t)a9;
  }
  else
  {
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v16, v43);
    sub_1DAC78C0C();
    v36 = swift_allocError();
  }
  v48 = v36;
  v37 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FB0);
  return sub_1DACA2E90();
}

uint64_t sub_1DAC7865C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a2;
  v4 = sub_1DACA2860();
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_1DACA28E4();
  v7 = *(_QWORD *)(v28 - 8);
  MEMORY[0x1E0C80A78](v28);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(*(id *)(v2 + 16), sel_fullContentAssets);
  v11 = objc_msgSend(*(id *)(v2 + 16), sel_language);
  sub_1DACA2D94();

  v12 = objc_msgSend(*(id *)(v2 + 16), sel_assetFileInfoManager);
  v13 = objc_allocWithZone(MEMORY[0x1E0DBF310]);
  v14 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithAssets_language_userInterfaceStyle_assetFileInfoManager_, v10, v14, a1, v12);

  v16 = objc_msgSend(v15, sel_cacheIdentifierForType_, 2);
  if (v16)
  {
    v17 = v16;
    v18 = sub_1DACA2D94();
    v20 = v19;

    v21 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation, v28);
    v30 = v18;
    v31 = v20;
    v23 = v26;
    v22 = v27;
    (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v6, *MEMORY[0x1E0CAFD68], v27);
    sub_1DAC33980();
    v24 = v29;
    sub_1DACA28D8();

    (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v22);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v21);
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v24, 0, 1, v21);
  }
  else
  {

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v29, 1, 1, v28);
  }
}

uint64_t sub_1DAC788E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC10TipsDaemon16ThumbnailFetcher_storageLocation;
  v2 = sub_1DACA28E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1DAC78948()
{
  return type metadata accessor for ThumbnailFetcher();
}

uint64_t type metadata accessor for ThumbnailFetcher()
{
  uint64_t result;

  result = qword_1EDAF2F00;
  if (!qword_1EDAF2F00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DAC7898C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DACA28E4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1DAC78A10(uint64_t a1)
{
  uint64_t v1;

  sub_1DAC77D30(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32));
}

unint64_t sub_1DAC78A1C()
{
  unint64_t result;

  result = qword_1EDAF2FC0;
  if (!qword_1EDAF2FC0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDAF2FC0);
  }
  return result;
}

uint64_t sub_1DAC78A58()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DAC78A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FB0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 64);
  v5 = sub_1DACA28E4();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v3 + v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_1DAC78B3C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v9;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FB0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 64);
  v19 = *(unsigned __int8 *)(*(_QWORD *)(sub_1DACA28E4() - 8) + 80);
  return sub_1DAC780D0(a1, a2, a3, a4, a5, a6, a7, a8, a9, *(_QWORD *)(v9 + 16), v9 + v17, v9 + ((v17 + v18 + v19) & ~v19));
}

unint64_t sub_1DAC78C0C()
{
  unint64_t result;

  result = qword_1F028C010;
  if (!qword_1F028C010)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7628, &type metadata for ThumbnailFetcher.AssetLoadError);
    atomic_store(result, (unint64_t *)&qword_1F028C010);
  }
  return result;
}

uint64_t sub_1DAC78C50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAC78C98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t);
  void **v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  uint64_t v22;
  unsigned int v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28[3];

  v27 = a2;
  v28[2] = *(id *)MEMORY[0x1E0C80C00];
  v3 = sub_1DACA2860();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DACA28E4();
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  result = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v24 = (id)objc_opt_self();
    v23 = *MEMORY[0x1E0CAFD68];
    v12 = v4;
    v13 = *(void (**)(char *, _QWORD, uint64_t))(v4 + 104);
    swift_bridgeObjectRetain();
    v22 = a1;
    v14 = (void **)(a1 + 40);
    do
    {
      v16 = *v14;
      v28[0] = *(v14 - 1);
      v28[1] = v16;
      v13(v6, v23, v3);
      sub_1DAC33980();
      swift_bridgeObjectRetain();
      sub_1DACA28D8();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v6, v3);
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v24, sel_defaultManager, v22);
      v18 = (void *)sub_1DACA2890();
      v28[0] = 0;
      v19 = objc_msgSend(v17, sel_removeItemAtURL_error_, v18, v28);

      if (v19)
      {
        v15 = v28[0];
      }
      else
      {
        v20 = v28[0];
        v21 = (void *)sub_1DACA2824();

        swift_willThrow();
      }
      v14 += 2;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v26);
      --v11;
    }
    while (v11);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_1DAC78ECC()
{
  id v0;
  void *v1;
  unsigned int v2;
  id v3;
  id v4;
  void *v5;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x1E0C80C00];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v1 = (void *)sub_1DACA2890();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_removeItemAtURL_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    v5 = (void *)sub_1DACA2824();

    swift_willThrow();
  }
}

void sub_1DAC78FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void (*v17)(char *, uint64_t);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1DACA28E4();
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_1DACA28CC();
  v8 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_fileExistsAtPath_, v8);

  if ((v9 & 1) != 0)
  {
    sub_1DACA2F44();
    if (!v0)
      sub_1DAC7190C((uint64_t)v3, &qword_1EDAF3010);
    goto LABEL_7;
  }
  sub_1DACA28B4();
  v10 = (void *)sub_1DACA2890();
  v22[0] = 0;
  v11 = objc_msgSend(v7, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v10, 1, 0, v22);

  v12 = v22[0];
  if (v11)
  {
    v13 = v22[0];
    v14 = (void *)sub_1DACA2890();
    v15 = (void *)sub_1DACA2890();
    v22[0] = 0;
    v16 = objc_msgSend(v7, sel_copyItemAtURL_toURL_error_, v14, v15, v22);

    v12 = v22[0];
    if (v16)
    {
      v17 = *(void (**)(char *, uint64_t))(v4 + 8);
      v18 = v22[0];
      v17(v6, v21);
LABEL_7:

      return;
    }
  }
  v19 = v12;
  sub_1DACA2824();

  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v21);
}

uint64_t getEnumTagSinglePayload for ThumbnailFetcher.AssetLoadError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ThumbnailFetcher.AssetLoadError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1DAC792E4 + 4 * byte_1DACA7560[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DAC79304 + 4 * byte_1DACA7565[v4]))();
}

_BYTE *sub_1DAC792E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DAC79304(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DAC7930C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DAC79314(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DAC7931C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DAC79324(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1DAC79330()
{
  return 0;
}

ValueMetadata *type metadata accessor for ThumbnailFetcher.AssetLoadError()
{
  return &type metadata for ThumbnailFetcher.AssetLoadError;
}

unint64_t sub_1DAC7934C()
{
  unint64_t result;

  result = qword_1F028C018;
  if (!qword_1F028C018)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7600, &type metadata for ThumbnailFetcher.AssetLoadError);
    atomic_store(result, &qword_1F028C018);
  }
  return result;
}

id GenerativeModelsAvailabilityValidation.__allocating_init(targetContext:)()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithTargetContext_, v2);

  return v3;
}

id GenerativeModelsAvailabilityValidation.init(targetContext:)()
{
  void *v0;
  void *v1;
  id v2;
  objc_super v4;

  v1 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  v2 = objc_msgSendSuper2(&v4, sel_initWithTargetContext_, v1);

  return v2;
}

uint64_t type metadata accessor for GenerativeModelsAvailabilityValidation()
{
  return objc_opt_self();
}

id GenerativeModelsAvailabilityValidation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GenerativeModelsAvailabilityValidation.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GenerativeModelsAvailabilityValidation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GenerativeModelsAvailabilityValidation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DAC79670(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  void (*v20)(_BYTE *, uint64_t);
  unsigned __int8 v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  char v26;
  _BYTE v28[4];
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;

  v34 = a2;
  v3 = sub_1DACA2C14();
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = &v28[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_1DACA2A64();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = &v28[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8);
  v12 = &v28[-v11];
  v13 = sub_1DACA2A7C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = &v28[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = sub_1DACA2AA0();
  v30 = *(_QWORD *)(v17 - 8);
  v31 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = &v28[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DACA2A70();
  sub_1DACA2A94();
  (*(void (**)(_BYTE *, uint64_t))(v14 + 8))(v16, v13);
  sub_1DACA2A88();
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x1E0D26088], v6);
  v29 = sub_1DACA2A58();
  v20 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
  v20(v10, v6);
  v21 = objc_msgSend(a1, sel_BOOLValue);
  sub_1DACA2C08();
  v35 = 0;
  v36 = 0xE000000000000000;
  sub_1DACA304C();
  v22 = objc_msgSend(a1, sel_name);
  if (v22)
  {
    v23 = v22;
    sub_1DACA2D94();

  }
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  v24 = objc_msgSend(a1, sel_targetContext);
  if (v24)
  {
    v25 = v24;
    sub_1DACA2D58();

  }
  else
  {
    sub_1DAC767D8(MEMORY[0x1E0DEE9D8]);
  }
  v26 = v29 ^ v21;
  sub_1DACA2D64();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C8C();
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v32 + 8))(v5, v33);
  (*(void (**)(uint64_t, BOOL, _QWORD))(v34 + 16))(v34, (v26 & 1) == 0, 0);
  v20(v12, v6);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v30 + 8))(v19, v31);
}

uint64_t sub_1DAC79A2C(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v12;
  id v13;
  uint64_t v14;

  v14 = MEMORY[0x1E0DEE9D8];
  if (a3 >> 62)
    goto LABEL_17;
  v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1DACA30E8())
  {
    for (i = 4; ; ++i)
    {
      v7 = (a3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1DF0A5770](i - 4, a3) : *(id *)(a3 + 8 * i);
      v8 = v7;
      v9 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v13 = v7;
      a1(&v12, &v13);
      if (v3)
      {
        swift_bridgeObjectRelease();

        return swift_bridgeObjectRelease();
      }

      if (v12)
      {
        MEMORY[0x1DF0A5524]();
        if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1DACA2E60();
        sub_1DACA2E78();
        sub_1DACA2E54();
      }
      if (v9 == v5)
      {
        swift_bridgeObjectRelease();
        return v14;
      }
    }
    __break(1u);
LABEL_17:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1DAC79BC4(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x656C61636F6CLL;
    else
      v3 = 0x727474416373696DLL;
    if (v2 == 1)
      v4 = 0xE600000000000000;
    else
      v4 = 0xEE00736574756269;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x656C61636F6CLL;
      else
        v6 = 0x727474416373696DLL;
      if (v5 == 1)
        v7 = 0xE600000000000000;
      else
        v7 = 0xEE00736574756269;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE600000000000000;
    v3 = 0x64496B6F6F62;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE600000000000000;
  if (v3 != 0x64496B6F6F62)
  {
LABEL_21:
    v8 = sub_1DACA31B4();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1DAC79CE4(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000013;
  else
    v3 = 0x6449646C697562;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0x80000001DACAE350;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000013;
  else
    v5 = 0x6449646C697562;
  if ((a2 & 1) != 0)
    v6 = 0x80000001DACAE350;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1DACA31B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1DAC79D8C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6873616863;
  else
    v3 = 118;
  if (v2)
    v4 = 0xE100000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6873616863;
  else
    v5 = 118;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE100000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1DACA31B4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1DAC79E20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 168) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC79E8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = v0[9];
  v2 = *(_QWORD *)(v1 + 24);
  if (v2)
  {
    v3 = *(_QWORD *)(v1 + 16);
    v4 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v0[18];
    v5 = v0[12];
    v6 = v0[13];
    v7 = v0[10];
    sub_1DAC77494(v1 + *(int *)(v0[8] + 28), v7, &qword_1EDAF3010);
    if (v4(v7, 1, v5) != 1)
    {
      v44 = v0[16];
      v45 = v0[17];
      v24 = v0[14];
      v40 = v0[15];
      v41 = (void (*)(uint64_t))v0[19];
      v25 = v0[12];
      v26 = (uint64_t *)v0[9];
      v43 = v3;
      v27 = (_QWORD *)v0[2];
      v41(v24);
      v28 = v26[1];
      v42 = *v26;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29 = sub_1DACA2CD4();
      v38 = v30;
      v39 = v29;
      v31 = v26[5];
      v37 = v26[4];
      swift_bridgeObjectRetain();
      v32 = sub_1DACA2CEC();
      v36 = v33;
      sub_1DAC7F068((uint64_t)v26, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v40, v25);
      v34 = type metadata accessor for UserGuideIndexItem(0);
      ((void (*)(char *, uint64_t, uint64_t))v41)((char *)v27 + *(int *)(v34 + 40), v24, v25);
      *v27 = v44;
      v27[1] = v45;
      v27[2] = v42;
      v27[3] = v28;
      v27[4] = v43;
      v27[5] = v2;
      v27[6] = v39;
      v27[7] = v38;
      v27[8] = v37;
      v27[9] = v31;
      v27[10] = v32;
      v27[11] = v36;
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      v23 = (uint64_t (*)(void))v0[1];
      return v23();
    }
    v8 = v0[15];
    v9 = v0[12];
    v11 = v0[9];
    v10 = v0[10];
    v13 = v0[6];
    v12 = v0[7];
    v14 = v0[5];
    swift_bridgeObjectRelease();
    sub_1DAC7190C(v10, &qword_1EDAF3010);
    sub_1DACA2BFC();
    sub_1DACA2CB0();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    sub_1DAC7EFFC();
    swift_allocError();
    *(_OWORD *)v15 = xmmword_1DACA76B0;
    *(_BYTE *)(v15 + 16) = 4;
    swift_willThrow();
    sub_1DAC7F068(v11, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v8, v9);
  }
  else
  {
    v16 = v0[15];
    v17 = v0[12];
    v18 = v0[13];
    v20 = v0[6];
    v19 = v0[7];
    v21 = v0[5];
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA2CB0();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    sub_1DAC7EFFC();
    swift_allocError();
    *(_QWORD *)v22 = 0;
    *(_QWORD *)(v22 + 8) = 0;
    *(_BYTE *)(v22 + 16) = 4;
    swift_willThrow();
    sub_1DAC7F068(v1, type metadata accessor for UserGuideIndexHelper.UserGuideAttributes);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t sub_1DAC7A1FC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 104) + 8))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7A284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  *(_QWORD *)(v4 + 112) = a1;
  *(_QWORD *)(v4 + 120) = a2;
  *(_QWORD *)(v4 + 128) = v2;
  swift_task_dealloc();
  if (!v2)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v4 + 8))();
}

void sub_1DAC7A330()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  __asm { BR              X11 }
}

uint64_t sub_1DAC7A3BC()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *(_QWORD *)(v0 + 128);
  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 96);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  *(_QWORD *)(v0 + 16) = *(unsigned __int8 *)(v0 + 126);
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  sub_1DACA2764();
  swift_allocObject();
  sub_1DACA2758();
  sub_1DAC3250C((unint64_t *)&unk_1EDAF2E30, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse, (uint64_t)&unk_1DACA78D8);
  sub_1DACA274C();
  v5 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  if (v21)
  {
    swift_release();
    sub_1DAC33928(v5, v4);
  }
  else
  {
    v6 = *(uint64_t **)(v0 + 56);
    v7 = *(_QWORD *)(v0 + 40);
    v8 = *(_QWORD **)(v0 + 24);
    v9 = v6[1];
    v20 = *v6;
    v10 = (uint64_t *)((char *)v6
                    + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24));
    v11 = v10[1];
    v19 = *v10;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12 = sub_1DAC7BBDC();
    v17 = v13;
    v18 = v12;
    swift_release();
    sub_1DAC33928(v5, v4);
    v14 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    sub_1DAC77494((uint64_t)v10 + *(int *)(v14 + 20), v7, &qword_1EDAF3010);
    sub_1DAC7F068((uint64_t)v6, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse);
    *v8 = v20;
    v8[1] = v9;
    v8[2] = v19;
    v8[3] = v11;
    v8[4] = v18;
    v8[5] = v17;
    v15 = type metadata accessor for UserGuideIndexHelper.UserGuideAttributes(0);
    sub_1DAC7F0A4(v7, (uint64_t)v8 + *(int *)(v15 + 28), &qword_1EDAF3010);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7A638(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_1DACA2C14();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v5 = sub_1DACA28E4();
  v3[8] = v5;
  v3[9] = *(_QWORD *)(v5 - 8);
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7A6C4()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;

  v1 = v0[9];
  v2 = v0[10];
  v3 = v0[7];
  v4 = v0[8];
  v9 = v0[6];
  v10 = v0[5];
  v5 = v0[3];
  v6 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v2, v5 + *(int *)(v6 + 40), v4);
  swift_bridgeObjectRetain();
  sub_1DACA2BFC();
  sub_1DACA304C();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DAC3250C(&qword_1EDAF3898, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v3, v10);
  v7 = (_QWORD *)swift_task_alloc();
  v0[11] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_1DAC7A90C;
  return sub_1DAC7AAB8(v0[3]);
}

uint64_t sub_1DAC7A90C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 96) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 104) = a1;
  return swift_task_switch();
}

uint64_t sub_1DAC7A980()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int8x16_t *v6;
  uint64_t v7;
  int8x16_t v9;

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = (int8x16_t *)swift_task_alloc();
  v9 = *(int8x16_t *)(v0 + 24);
  v6[1] = vextq_s8(v9, v9, 8uLL);
  v7 = sub_1DAC79A2C((void (*)(uint64_t *__return_ptr, id *))sub_1DAC7C8A4, (uint64_t)v6, v1);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_1DAC81764(v9.i64[0], v5, type metadata accessor for UserGuideIndexItem);
  *(_QWORD *)(v5 + *(int *)(type metadata accessor for UserGuideIndexRequest(0) + 20)) = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7AA68()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7AAB8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[45] = a1;
  v2[46] = v1;
  v3 = sub_1DACA2A34();
  v2[47] = v3;
  v2[48] = *(_QWORD *)(v3 - 8);
  v2[49] = swift_task_alloc();
  v4 = sub_1DACA2A28();
  v2[50] = v4;
  v2[51] = *(_QWORD *)(v4 - 8);
  v2[52] = swift_task_alloc();
  v5 = sub_1DACA2C14();
  v2[53] = v5;
  v2[54] = *(_QWORD *)(v5 - 8);
  v2[55] = swift_task_alloc();
  v2[56] = swift_task_alloc();
  v2[57] = swift_task_alloc();
  v6 = sub_1DACA28E4();
  v2[58] = v6;
  v2[59] = *(_QWORD *)(v6 - 8);
  v2[60] = swift_task_alloc();
  v2[61] = swift_task_alloc();
  v2[62] = swift_task_alloc();
  v2[63] = swift_task_alloc();
  v2[64] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7AC0C()
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
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  __int128 v14;

  v1 = *(_QWORD *)(v0 + 512);
  v2 = *(_QWORD *)(v0 + 464);
  v3 = *(_QWORD *)(v0 + 472);
  v4 = *(_QWORD *)(v0 + 456);
  v5 = *(_QWORD *)(v0 + 424);
  v6 = *(_QWORD *)(v0 + 432);
  v7 = *(_QWORD *)(v0 + 360);
  v8 = v7 + *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 520) = v9;
  v9(v1, v8, v2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = *(_QWORD *)(v7 + 24);
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  sub_1DACA286C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v12 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v0 + 528) = v12;
  v12(v4, v5);
  v13 = swift_task_alloc();
  *(_QWORD *)(v0 + 536) = v13;
  *(_QWORD *)v13 = v0;
  *(_QWORD *)(v13 + 8) = sub_1DAC7AD84;
  v14 = *(_OWORD *)(v0 + 504);
  *(_BYTE *)(v13 + 80) = 1;
  *(_QWORD *)(v13 + 40) = v10;
  *(_QWORD *)(v13 + 48) = v11;
  *(_OWORD *)(v13 + 24) = v14;
  return swift_task_switch();
}

uint64_t sub_1DAC7AD84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 544) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7AE2C()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  uint64_t v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 528);
  v2 = *(_QWORD *)(v0 + 456);
  v3 = *(_QWORD *)(v0 + 424);
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  sub_1DACA286C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  sub_1DACA28A8();
  v4 = (void *)objc_opt_self();
  v5 = objc_msgSend(v4, sel_defaultManager);
  sub_1DACA28CC();
  v6 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_fileExistsAtPath_, v6);

  if ((v7 & 1) != 0)
  {
    v8 = objc_msgSend(v4, sel_defaultManager);
    v9 = (void *)sub_1DACA2890();
    *(_QWORD *)(v0 + 352) = 0;
    v10 = objc_msgSend(v8, sel_removeItemAtURL_error_, v9, v0 + 352);

    v11 = *(void **)(v0 + 352);
    if (v10)
    {
      v12 = *(_QWORD *)(v0 + 544);
      v13 = v11;
    }
    else
    {
      v14 = v11;
      v15 = (void *)sub_1DACA2824();

      swift_willThrow();
      v12 = 0;
    }
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 544);
  }
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 520);
  v17 = *(_QWORD *)(v0 + 504);
  v18 = *(_QWORD *)(v0 + 488);
  v19 = *(_QWORD *)(v0 + 464);
  v20 = objc_msgSend(v4, sel_defaultManager);
  sub_1DACA28CC();
  v21 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  objc_msgSend(v20, sel_createFileAtPath_contents_attributes_, v21, 0, 0);

  sub_1DAC3757C(0, &qword_1EDAF38E0);
  v16(v18, v17, v19);
  v22 = sub_1DAC7C15C(v18, (SEL *)&selRef_fileHandleForReadingFromURL_error_);
  if (!v12)
  {
    v29 = v22;
    v30 = *(_QWORD *)(v0 + 480);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v0 + 520))(v30, *(_QWORD *)(v0 + 496), *(_QWORD *)(v0 + 464));
    v32 = sub_1DAC7C15C(v30, (SEL *)&selRef_fileHandleForWritingToURL_error_);
    v33 = *(_QWORD *)(v0 + 416);
    v34 = *(_QWORD *)(v0 + 392);
    v36 = *(_QWORD *)(v0 + 376);
    v35 = *(_QWORD *)(v0 + 384);
    (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 408) + 104))(v33, *MEMORY[0x1E0DE9C10], *(_QWORD *)(v0 + 400));
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v35 + 104))(v34, *MEMORY[0x1E0DE9C20], v36);
    sub_1DAC82518(v33, v29, v32, v34);
    v37 = *(_QWORD *)(v0 + 408);
    v38 = *(_QWORD *)(v0 + 416);
    v39 = *(_QWORD *)(v0 + 400);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 384) + 8))(*(_QWORD *)(v0 + 392), *(_QWORD *)(v0 + 376));
    (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v39);
    sub_1DACA28FC();
    v41 = v40;
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    __asm { BR              X11 }
  }
  v23 = *(_QWORD *)(v0 + 504);
  v24 = *(_QWORD *)(v0 + 512);
  v25 = *(_QWORD *)(v0 + 496);
  v26 = *(_QWORD *)(v0 + 464);
  v27 = *(_QWORD *)(v0 + 472);
  sub_1DAC7BF84();
  v28 = *(void (**)(uint64_t, uint64_t))(v27 + 8);
  v28(v25, v26);
  v28(v23, v26);
  v28(v24, v26);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7BAE4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 472) + 8))(*(_QWORD *)(v0 + 512), *(_QWORD *)(v0 + 464));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7BBDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v0 = sub_1DACA29D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DACA29EC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3030);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_1DACA2998();
  sub_1DACA29E0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1DACA29C8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v11 = sub_1DACA29B0();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_1DAC7190C((uint64_t)v10, &qword_1EDAF3030);
    v13 = objc_msgSend((id)objc_opt_self(), sel_tps_userLanguageCode);
    v14 = sub_1DACA2D94();

  }
  else
  {
    v14 = sub_1DACA29A4();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  return v14;
}

uint64_t sub_1DAC7BDB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;

  *(_BYTE *)(v5 + 80) = a5;
  *(_QWORD *)(v5 + 40) = a3;
  *(_QWORD *)(v5 + 48) = a4;
  *(_QWORD *)(v5 + 24) = a1;
  *(_QWORD *)(v5 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_1DAC7BDD0()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  _QWORD *v4;
  __int128 v6;

  v1 = *(_QWORD *)(v0 + 48);
  v6 = *(_OWORD *)(v0 + 32);
  v2 = *(_BYTE *)(v0 + 80) & 1;
  *(_QWORD *)(v0 + 16) = 0;
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *(_QWORD *)(v3 + 16) = v0 + 16;
  *(_OWORD *)(v3 + 24) = v6;
  *(_QWORD *)(v3 + 40) = v1;
  *(_BYTE *)(v3 + 48) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  sub_1DACA28E4();
  *v4 = v0;
  v4[1] = sub_1DAC7BEA8;
  return sub_1DACA31D8();
}

uint64_t sub_1DAC7BEA8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7BF14()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC7BF48()
{
  uint64_t v0;

  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1DAC7BF84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[3];
  id v11;
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = sub_1DACA2C14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DACA2BFC();
  v11 = 0;
  v12 = 0xE000000000000000;
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  v11 = (id)0xD00000000000001FLL;
  v12 = 0x80000001DACAE940;
  sub_1DACA286C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v5 = (void *)sub_1DACA2890();
  v11 = 0;
  v6 = objc_msgSend(v4, sel_removeItemAtURL_error_, v5, &v11);

  if (v6)
  {
    v7 = v11;
  }
  else
  {
    v10[1] = v11;
    v8 = v11;
    v9 = (void *)sub_1DACA2824();

    swift_willThrow();
  }
}

id sub_1DAC7C15C(uint64_t a1, SEL *a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = (void *)sub_1DACA2890();
  v13[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, v4, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_1DACA28E4();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_1DACA2824();

    swift_willThrow();
    v11 = sub_1DACA28E4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

uint64_t sub_1DAC7C270()
{
  return swift_deallocClassInstance();
}

uint64_t *sub_1DAC7C280(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v17;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    v9 = a2[9];
    a1[8] = a2[8];
    a1[9] = v9;
    v10 = a2[11];
    v11 = *(int *)(a3 + 40);
    v17 = (char *)a2 + v11;
    v12 = (char *)a1 + v11;
    a1[10] = a2[10];
    a1[11] = v10;
    v13 = sub_1DACA28E4();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v12, v17, v13);
  }
  return v3;
}

uint64_t sub_1DAC7C388(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 40);
  v5 = sub_1DACA28E4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1DAC7C3F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v15;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  v9 = a2[11];
  v10 = *(int *)(a3 + 40);
  v15 = (char *)a2 + v10;
  v11 = (char *)a1 + v10;
  a1[10] = a2[10];
  a1[11] = v9;
  v12 = sub_1DACA28E4();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v11, v15, v12);
  return a1;
}

_QWORD *sub_1DAC7C4D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 40);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1DAC7C5F0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 40);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

_QWORD *sub_1DAC7C65C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 40);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_1DAC7C718()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7C724(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1DACA28E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 40), a2, v8);
  }
}

uint64_t sub_1DAC7C7A0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7C7AC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1DACA28E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 40), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DAC7C820()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DACA28E4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void *sub_1DAC7C8A4@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *result;

  result = sub_1DAC7E9B4(*a1, *(_QWORD *)(v2 + 24));
  *a2 = result;
  return result;
}

uint64_t type metadata accessor for UserGuideIndexRequest(uint64_t a1)
{
  return sub_1DAC37CF4(a1, (uint64_t *)&unk_1EDAF38B8);
}

void sub_1DAC7C8EC(uint64_t a1, id *a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  int v11;
  id v12;

  v11 = a6 & 1;
  v12 = *a2;
  sub_1DAC7C964(a3, a2, a4, a5, v11, a1);

}

void sub_1DAC7C964(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void **v37;
  _QWORD aBlock[6];

  v37 = a2;
  v33 = a6;
  v32 = a5;
  v31 = a4;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF38D8);
  v7 = *(_QWORD *)(v34 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v34);
  v9 = sub_1DACA28E4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DACA2740();
  v35 = *(_QWORD *)(v13 - 8);
  v36 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_1DACA2734();
  sub_1DAC3757C(0, (unint64_t *)&qword_1EDAF2FC0);
  v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v16)
  {
    v17 = v16;
    v30 = sub_1DACA2728();
    v31 = sub_1DACA2D88();
    sub_1DACA2D94();
    v18 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    v19 = *MEMORY[0x1E0CB3338];
    v20 = v34;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v33, v34);
    v21 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v22 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
    aBlock[4] = sub_1DAC7EFC4;
    aBlock[5] = v22;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DAC90E0C;
    aBlock[3] = &block_descriptor_1;
    v23 = _Block_copy(aBlock);
    swift_release();
    v24 = (void *)v30;
    v25 = (void *)v31;
    LODWORD(v26) = v19;
    v27 = objc_msgSend(v17, sel_formattedDataForRequest_identifier_attributionIdentifier_requestType_priority_completionHandler_, v30, v31, 0, v18, v23, v26);
    _Block_release(v23);

    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v36);
    v28 = *v37;
    *v37 = v27;

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DAC7CC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DACA28E4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x1E0C80A78](v13);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v25 - v18;
  sub_1DAC77494(a3, (uint64_t)v25, &qword_1EDAF36F0);
  if (v25[3])
  {
    v20 = swift_dynamicCast();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, v20 ^ 1u, 1, v13);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF38D8);
      sub_1DACA2E9C();
      return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
    }
  }
  else
  {
    sub_1DAC7190C((uint64_t)v25, &qword_1EDAF36F0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  }
  sub_1DAC7190C((uint64_t)v12, &qword_1EDAF3010);
  if (a9)
  {
    v22 = (uint64_t)a9;
  }
  else
  {
    sub_1DAC7EFFC();
    v22 = swift_allocError();
    *(_QWORD *)v23 = 0;
    *(_QWORD *)(v23 + 8) = 0;
    *(_BYTE *)(v23 + 16) = 1;
  }
  v25[0] = v22;
  v24 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF38D8);
  return sub_1DACA2E90();
}

void sub_1DAC7CE64(uint64_t a1, id *a2, uint64_t a3, char a4)
{
  uint64_t v7;
  id v8;

  v7 = a4 & 1;
  v8 = *a2;
  sub_1DAC4610C(a3, a2, v7, a1);

}

uint64_t sub_1DAC7CEC4(int a1, int a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  sub_1DAC77494(a3, (uint64_t)&v15, &qword_1EDAF36F0);
  if (v16)
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v15 = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F0);
      return sub_1DACA2E9C();
    }
  }
  else
  {
    sub_1DAC7190C((uint64_t)&v15, &qword_1EDAF36F0);
  }
  if (a9)
  {
    v11 = (uint64_t)a9;
  }
  else
  {
    sub_1DAC7EFFC();
    v11 = swift_allocError();
    *(_QWORD *)v12 = 0;
    *(_QWORD *)(v12 + 8) = 0;
    *(_BYTE *)(v12 + 16) = 1;
  }
  *(_QWORD *)&v15 = v11;
  v13 = a9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F0);
  return sub_1DACA2E90();
}

uint64_t sub_1DAC7CFBC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C098);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC817EC();
  sub_1DACA3298();
  v8[15] = 0;
  sub_1DACA316C();
  if (!v1)
  {
    v8[14] = 1;
    sub_1DACA316C();
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
    v8[13] = 2;
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    sub_1DAC3250C(&qword_1F028C0A0, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes, (uint64_t)&unk_1DACA7888);
    sub_1DACA3178();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1DAC7D138@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  char v23;
  char v24;
  char v25;

  v19 = a2;
  v20 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
  MEMORY[0x1E0C80A78](v20);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3698);
  v6 = *(_QWORD *)(v21 - 8);
  MEMORY[0x1E0C80A78](v21);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = a1[3];
  v22 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_1DAC817EC();
  sub_1DACA328C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  v18 = v9;
  v25 = 0;
  *v11 = sub_1DACA3130();
  v11[1] = v13;
  v24 = 1;
  v11[2] = sub_1DACA3130();
  v11[3] = v14;
  v23 = 2;
  sub_1DAC3250C(qword_1EDAF3270, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes, (uint64_t)&unk_1DACA78B0);
  v15 = v21;
  sub_1DACA313C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  sub_1DAC8170C((uint64_t)v5, (uint64_t)v11 + *(int *)(v18 + 24), type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
  sub_1DAC81764((uint64_t)v11, v19, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return sub_1DAC7F068((uint64_t)v11, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
}

uint64_t sub_1DAC7D3D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1DAC79BC4(*a1, *a2);
}

uint64_t sub_1DAC7D3E0()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7D484()
{
  sub_1DACA2DD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC7D504()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7D5A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAC8209C();
  *a1 = result;
  return result;
}

void sub_1DAC7D5D0(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  int v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v2 = *v1;
  v3 = 0xE600000000000000;
  v4 = 0xE600000000000000;
  v5 = 0x656C61636F6CLL;
  if (v2 != 1)
  {
    v5 = 0x727474416373696DLL;
    v4 = 0xEE00736574756269;
  }
  v6 = v2 == 0;
  if (*v1)
    v7 = v5;
  else
    v7 = 0x64496B6F6F62;
  if (!v6)
    v3 = v4;
  *a1 = v7;
  a1[1] = v3;
}

uint64_t sub_1DAC7D634()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x656C61636F6CLL;
  if (*v0 != 1)
    v1 = 0x727474416373696DLL;
  if (*v0)
    return v1;
  else
    return 0x64496B6F6F62;
}

uint64_t sub_1DAC7D694@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAC8209C();
  *a1 = result;
  return result;
}

void sub_1DAC7D6B8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_1DAC7D6C4()
{
  sub_1DAC817EC();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC7D6EC()
{
  sub_1DAC817EC();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC7D714@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DAC7D138(a1, a2);
}

uint64_t sub_1DAC7D728(_QWORD *a1)
{
  return sub_1DAC7CFBC(a1);
}

uint64_t sub_1DAC7D73C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DAC7D748@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v36[4];
  _QWORD *v37;

  v31 = a2;
  v35 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
  MEMORY[0x1E0C80A78](v35);
  v30 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DACA2DB8();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  MEMORY[0x1E0C80A78](v4);
  v32 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v9 = 0;
  v9[1] = 0;
  v10 = (uint64_t)v9 + *(int *)(v7 + 20);
  v11 = sub_1DACA28E4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v13(v10, 1, 1, v11);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v14 = v37;
  sub_1DACA3280();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v16 = (uint64_t)v9;
  }
  else
  {
    v37 = v9;
    v28 = v12;
    v29 = v13;
    v15 = v35;
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    sub_1DACA31C0();
    v18 = v32;
    sub_1DACA2DAC();
    v19 = sub_1DACA2DA0();
    v21 = v20;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v18, v34);
    if (v21 >> 60 == 15)
    {
      v22 = v31;
      v23 = v37;
    }
    else
    {
      sub_1DACA2764();
      swift_allocObject();
      sub_1DACA2758();
      sub_1DAC3250C(qword_1EDAF3320, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper, (uint64_t)&unk_1DACA7C88);
      sub_1DACA274C();
      swift_release();
      sub_1DAC3396C(v19, v21);
      v24 = v30;
      v25 = *(_QWORD *)v30;
      v26 = *((_QWORD *)v30 + 1);
      v23 = v37;
      swift_bridgeObjectRelease();
      *v23 = v25;
      v23[1] = v26;
      sub_1DAC7190C(v10, &qword_1EDAF3010);
      (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v10, &v24[*(int *)(v15 + 20)], v11);
      v29(v10, 0, 1, v11);
      v22 = v31;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    sub_1DAC81764((uint64_t)v23, v22, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    v16 = (uint64_t)v23;
  }
  return sub_1DAC7F068(v16, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes);
}

uint64_t sub_1DAC7DA7C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C080);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC817A8();
  sub_1DACA3298();
  v8[15] = 0;
  sub_1DACA3154();
  if (!v1)
  {
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    v8[14] = 1;
    sub_1DACA28E4();
    sub_1DAC3250C(&qword_1F028C090, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0010]);
    sub_1DACA3160();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1DAC7DBD0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C0E0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC82058();
  sub_1DACA3298();
  v8[15] = 0;
  sub_1DACA316C();
  if (!v1)
  {
    type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
    v8[14] = 1;
    sub_1DACA28E4();
    sub_1DAC3250C(&qword_1F028C090, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0010]);
    sub_1DACA3178();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1DAC7DD24@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;

  v22 = a2;
  v4 = sub_1DACA28E4();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x1E0C80A78](v4);
  v23 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3690);
  v6 = *(_QWORD *)(v26 - 8);
  MEMORY[0x1E0C80A78](v26);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (uint64_t *)((char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC82058();
  sub_1DACA328C();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v20 = a1;
  v21 = v6;
  v12 = v11;
  v14 = v23;
  v13 = v24;
  v16 = v25;
  v15 = v26;
  v28 = 0;
  *v12 = sub_1DACA3130();
  v12[1] = v17;
  v27 = 1;
  sub_1DAC3250C(&qword_1EDAF3008, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0038]);
  sub_1DACA313C();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v15);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))((char *)v12 + *(int *)(v9 + 20), v14, v16);
  sub_1DAC81764((uint64_t)v12, v22, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return sub_1DAC7F068((uint64_t)v12, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper);
}

uint64_t sub_1DAC7DF7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = a2;
  v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  MEMORY[0x1E0C80A78](v4);
  v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3688);
  v14 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC816C8();
  sub_1DACA328C();
  if (!v2)
  {
    sub_1DAC3250C(qword_1EDAF33D0, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book, (uint64_t)&unk_1DACA7860);
    sub_1DACA313C();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_1DAC8170C(v15, (uint64_t)v11, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book);
    sub_1DAC8170C((uint64_t)v11, v13, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_1DAC7E148()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0x6449646C697562;
}

uint64_t sub_1DAC7E188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DAC820E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DAC7E1AC()
{
  sub_1DAC817A8();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC7E1D4()
{
  sub_1DAC817A8();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC7E1FC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DAC7D748(a1, a2);
}

uint64_t sub_1DAC7E210(_QWORD *a1)
{
  return sub_1DAC7DA7C(a1);
}

uint64_t sub_1DAC7E224(char *a1, char *a2)
{
  return sub_1DAC79CE4(*a1, *a2);
}

uint64_t sub_1DAC7E230()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7E2B4()
{
  sub_1DACA2DD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC7E314()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7E394@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_1DAC7E3F0(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x6449646C697562;
  if (*v1)
    v2 = 0xD000000000000013;
  v3 = 0x80000001DACAE350;
  if (!*v1)
    v3 = 0xE700000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1DAC7E434()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0x6449646C697562;
}

uint64_t sub_1DAC7E474@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_1DAC7E4D4()
{
  sub_1DAC82058();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC7E4FC()
{
  sub_1DAC82058();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC7E524@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DAC7DD24(a1, a2);
}

uint64_t sub_1DAC7E538(_QWORD *a1)
{
  return sub_1DAC7DBD0(a1);
}

uint64_t sub_1DAC7E54C()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7E5A4()
{
  return sub_1DACA2DD0();
}

uint64_t sub_1DAC7E5C4()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  return sub_1DACA3274();
}

uint64_t sub_1DAC7E618@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1DAC7E668(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "bookResponse");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

uint64_t sub_1DAC7E68C()
{
  return 0x707365526B6F6F62;
}

uint64_t sub_1DAC7E6AC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1DAC7E700(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1DAC7E70C()
{
  sub_1DAC816C8();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC7E734()
{
  sub_1DAC816C8();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC7E75C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1DAC7DF7C(a1, a2);
}

uint64_t sub_1DAC7E770(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C0A8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC816C8();
  sub_1DACA3298();
  type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  sub_1DAC3250C(&qword_1F028C0B0, type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book, (uint64_t)&unk_1DACA7838);
  sub_1DACA3178();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1DAC7E880()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3638);
  if (swift_isClassType())
    v1 = v0;
  else
    v1 = 0;
  if (v1)
    v2 = (uint64_t *)&unk_1EDAF36D0;
  else
    v2 = (uint64_t *)&unk_1EDAF36C8;
  return __swift_instantiateConcreteTypeFromMangledName(v2);
}

uint64_t sub_1DAC7E8CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC7E938()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_1DAC7E978()
{
  uint64_t v0;

  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_1DAC7E9B4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;

  v37 = sub_1DACA298C();
  v35 = *(_QWORD *)(v37 - 8);
  MEMORY[0x1E0C80A78](v37);
  v36 = (char *)v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1DACA28E4();
  v5 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 80);
  v38 = *(id *)a2;
  v39 = v11;
  v40 = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  v12 = objc_msgSend(a1, sel_attributeSet);
  v13 = (void *)sub_1DACA2D88();
  v14 = objc_msgSend(v12, sel_attributeForKey_, v13);

  if (v14)
  {
    sub_1DACA2FE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v42, 0, sizeof(v42));
  }
  sub_1DAC7F0A4((uint64_t)v42, (uint64_t)&v43, &qword_1EDAF36F0);
  if (!*((_QWORD *)&v44 + 1))
    goto LABEL_14;
  if ((swift_dynamicCast() & 1) == 0)
  {
    swift_bridgeObjectRelease();

    return 0;
  }
  v33 = v41;
  if (!objc_msgSend(v12, sel_attributeForKey_, *MEMORY[0x1E0CA6158])
    || (sub_1DACA2FE0(),
        swift_unknownObjectRelease(),
        sub_1DAC7190C((uint64_t)&v43, &qword_1EDAF36F0),
        !objc_msgSend(v12, sel_attributeForKey_, *MEMORY[0x1E0CA6150])))
  {
    v43 = 0u;
    v44 = 0u;
    swift_bridgeObjectRelease();
LABEL_14:
    swift_bridgeObjectRelease();

    sub_1DAC7190C((uint64_t)&v43, &qword_1EDAF36F0);
    return 0;
  }
  sub_1DACA2FE0();
  swift_unknownObjectRelease();
  sub_1DAC7190C((uint64_t)&v43, &qword_1EDAF36F0);
  v15 = objc_allocWithZone((Class)sub_1DACA2C38());
  swift_bridgeObjectRetain();
  v16 = (void *)sub_1DACA2C20();
  v17 = sub_1DACA2C2C();
  if (!v18)
  {

    return 0;
  }
  v32[1] = v17;
  v33 = v18;
  *(_QWORD *)&v43 = 0x6469754772657375;
  *((_QWORD *)&v43 + 1) = 0xEA00000000002E65;
  sub_1DACA2DDC();
  v19 = objc_msgSend(v16, sel_supportSiteURL);
  v38 = v16;
  if (v19)
  {
    sub_1DACA28C0();

    v20 = v34;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v7, v34);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v20);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v20);
    v22 = v35;
    if (v21 == 1)
    {
      v19 = 0;
    }
    else
    {
      v19 = (id)sub_1DACA2890();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v20);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v34);
    v22 = v35;
  }
  objc_msgSend(v12, sel_setContentURL_, v19);

  v24 = (void *)sub_1DACA2D88();
  objc_msgSend(v12, sel_setDomainIdentifier_, v24);

  if (v40)
    v25 = (void *)sub_1DACA2D88();
  else
    v25 = 0;
  objc_msgSend(v12, sel_setVersion_, v25);

  v26 = (void *)sub_1DACA2D88();
  objc_msgSend(v12, sel_setKind_, v26);

  v27 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setUniqueIdentifier_, v27);

  v28 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setDomainIdentifier_, v28);

  objc_msgSend(a1, sel_setAttributeSet_, v12);
  v29 = v36;
  sub_1DACA295C();
  v30 = (void *)sub_1DACA2968();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v29, v37);
  objc_msgSend(a1, sel_setExpirationDate_, v30);

  v31 = a1;
  return a1;
}

uint64_t sub_1DAC7EF38(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1DAC7EF6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_1DAC7EFA8(uint64_t a1)
{
  uint64_t v1;

  sub_1DAC7C8EC(a1, *(id **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_BYTE *)(v1 + 48));
}

uint64_t sub_1DAC7EFB8()
{
  return objectdestroyTm(&qword_1EDAF38D8);
}

uint64_t sub_1DAC7EFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1DAC7F138(a1, a2, a3, a4, a5, a6, a7, a8, a9, &qword_1EDAF38D8, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1DAC7CC40);
}

unint64_t sub_1DAC7EFFC()
{
  unint64_t result;

  result = qword_1F028C038;
  if (!qword_1F028C038)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA827C, &type metadata for UserGuideItemIndexingError);
    atomic_store(result, &qword_1F028C038);
  }
  return result;
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(uint64_t a1)
{
  return sub_1DAC37CF4(a1, qword_1EDAF3408);
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(uint64_t a1)
{
  return sub_1DAC37CF4(a1, qword_1EDAF32A0);
}

uint64_t sub_1DAC7F068(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DAC7F0A4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_1DAC7F0E8(uint64_t a1)
{
  uint64_t v1;

  sub_1DAC7CE64(a1, *(id **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32));
}

uint64_t sub_1DAC7F0F4()
{
  return objectdestroyTm(&qword_1EDAF35F0);
}

uint64_t sub_1DAC7F100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return sub_1DAC7F138(a1, a2, a3, a4, a5, a6, a7, a8, a9, &qword_1EDAF35F0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1DAC7CEC4);
}

uint64_t sub_1DAC7F138(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t *a10, uint64_t (*a11)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v11;
  uint64_t v20;

  v20 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(a10) - 8) + 80);
  return a11(a1, a2, a3, a4, a5, a6, a7, a8, a9, v11 + ((v20 + 16) & ~v20));
}

uint64_t *sub_1DAC7F1E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1DACA28E4();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t sub_1DAC7F2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1DACA28E4();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *sub_1DAC7F358(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1DACA28E4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *sub_1DAC7F424(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DACA28E4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1DAC7F54C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1DACA28E4();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *sub_1DAC7F608(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1DACA28E4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1DAC7F720()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7F72C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t sub_1DAC7F7B8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7F7C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DAC7F83C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DAC81CC8(a1, a2, a3, (uint64_t)&unk_1DACA7740, (uint64_t (*)(uint64_t))sub_1DAC7F850);
}

void sub_1DAC7F850()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EDAF3018)
  {
    sub_1DACA28E4();
    v0 = sub_1DACA2FD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EDAF3018);
  }
}

uint64_t *sub_1DAC7F8A4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v18 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v18 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (uint64_t *)((char *)a1 + v7);
    v9 = (char *)a2 + v7;
    v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *v8 = *(uint64_t *)((char *)a2 + v7);
    v8[1] = v10;
    v11 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
    v12 = (char *)v8 + v11;
    v13 = &v9[v11];
    v14 = sub_1DACA28E4();
    v15 = *(_QWORD *)(v14 - 8);
    v16 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v16(v13, 1, v14))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v15 + 16))(v12, v13, v14);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    }
  }
  return v3;
}

uint64_t sub_1DAC7F9D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  swift_bridgeObjectRelease();
  v5 = v4 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v6 = sub_1DACA28E4();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

_QWORD *sub_1DAC7FA74(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *v7 = *(_QWORD *)((char *)a2 + v6);
  v7[1] = v9;
  v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v11 = (char *)v7 + v10;
  v12 = &v8[v10];
  v13 = sub_1DACA28E4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

_QWORD *sub_1DAC7FB7C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 24);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (_QWORD *)((char *)a2 + v6);
  *v7 = *v8;
  v7[1] = v8[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v10 = (char *)v7 + v9;
  v11 = (char *)v8 + v9;
  v12 = sub_1DACA28E4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 24))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

_OWORD *sub_1DAC7FCF8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  *(_OWORD *)((char *)a1 + v5) = *(_OWORD *)((char *)a2 + v5);
  v8 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v9 = &v6[v8];
  v10 = &v7[v8];
  v11 = sub_1DACA28E4();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

_QWORD *sub_1DAC7FDD0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 24);
  v9 = (_QWORD *)((char *)a1 + v8);
  v10 = (_QWORD *)((char *)a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v12 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v13 = (char *)v9 + v12;
  v14 = (char *)v10 + v12;
  v15 = sub_1DACA28E4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1DAC7FF1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7FF28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_1DAC7FFA4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC7FFB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DAC80024()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1DAC80098(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = a2[1];
    *a1 = *a2;
    a1[1] = v6;
    v7 = a2[3];
    a1[2] = a2[2];
    a1[3] = v7;
    v8 = *(int *)(v4 + 24);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8 + 8);
    *v9 = *(uint64_t *)((char *)a2 + v8);
    v9[1] = v11;
    v12 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
    v13 = (char *)v9 + v12;
    v14 = &v10[v12];
    v15 = sub_1DACA28E4();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t sub_1DAC801D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  swift_bridgeObjectRelease();
  v3 = v2 + *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v4 = sub_1DACA28E4();
  v5 = *(_QWORD *)(v4 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  return result;
}

_QWORD *sub_1DAC80278(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *v7 = *(_QWORD *)((char *)a2 + v6);
  v7[1] = v9;
  v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v11 = (char *)v7 + v10;
  v12 = &v8[v10];
  v13 = sub_1DACA28E4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v15(v12, 1, v13))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  }
  return a1;
}

_QWORD *sub_1DAC8038C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  v5 = (_QWORD *)((char *)a1 + v4);
  v6 = (char *)a2 + v4;
  *v5 = *(_QWORD *)((char *)a2 + v4);
  v5[1] = *(_QWORD *)((char *)a2 + v4 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v8 = (char *)v5 + v7;
  v9 = &v6[v7];
  v10 = sub_1DACA28E4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

_OWORD *sub_1DAC8050C(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  *(_OWORD *)((char *)a1 + v5) = *(_OWORD *)((char *)a2 + v5);
  v8 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v9 = &v6[v8];
  v10 = &v7[v8];
  v11 = sub_1DACA28E4();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

_QWORD *sub_1DAC805F0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0) + 24);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *v7 = *(_QWORD *)((char *)a2 + v6);
  v7[1] = v9;
  swift_bridgeObjectRelease();
  v10 = *(int *)(type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes(0) + 20);
  v11 = (char *)v7 + v10;
  v12 = &v8[v10];
  v13 = sub_1DACA28E4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_1DAC80740()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC8074C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_1DAC80788()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC80794(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_1DAC807D4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1DAC8083C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v15 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v15 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = a2[5];
    v8 = *(int *)(a3 + 28);
    v9 = (char *)a2 + v8;
    v10 = (char *)a1 + v8;
    a1[4] = a2[4];
    a1[5] = v7;
    v11 = sub_1DACA28E4();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v13(v9, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
      memcpy(v10, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v10, v9, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
    }
  }
  return v3;
}

uint64_t sub_1DAC8095C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_1DACA28E4();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *sub_1DAC809E8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a2 + v7;
  v9 = (char *)a1 + v7;
  a1[4] = a2[4];
  a1[5] = v6;
  v10 = sub_1DACA28E4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v12(v8, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v9, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v9, v8, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
  }
  return a1;
}

_QWORD *sub_1DAC80ADC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

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
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DACA28E4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *sub_1DAC80C44(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 28);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1DACA28E4();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *sub_1DAC80D08(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(char *, uint64_t, uint64_t);
  int v15;
  int v16;
  uint64_t v17;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = *(int *)(a3 + 28);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1DACA28E4();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 40))(v10, v11, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  return a1;
}

uint64_t sub_1DAC80E40()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC80E4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_1DAC80ECC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC80ED8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_1DAC80F50()
{
  unint64_t v0;

  sub_1DAC7F850();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_1DAC80FD0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v17)(char *, char *, uint64_t);
  char *v18;
  char *v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a2[5];
    a1[4] = a2[4];
    a1[5] = v9;
    v10 = a2[7];
    a1[6] = a2[6];
    a1[7] = v10;
    v11 = a2[9];
    a1[8] = a2[8];
    a1[9] = v11;
    v12 = a2[11];
    a1[10] = a2[10];
    a1[11] = v12;
    v13 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
    v18 = (char *)a2 + v13;
    v19 = (char *)v4 + v13;
    v14 = sub_1DACA28E4();
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v17(v19, v18, v14);
    *(uint64_t *)((char *)v4 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1DAC810FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = a1 + *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v3 = sub_1DACA28E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1DAC81188(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v15;
  char *v16;

  v5 = a2[1];
  *a1 = *a2;
  a1[1] = v5;
  v6 = a2[3];
  a1[2] = a2[2];
  a1[3] = v6;
  v7 = a2[5];
  a1[4] = a2[4];
  a1[5] = v7;
  v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  v9 = a2[9];
  a1[8] = a2[8];
  a1[9] = v9;
  v10 = a2[11];
  a1[10] = a2[10];
  a1[11] = v10;
  v11 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v15 = (char *)a2 + v11;
  v16 = (char *)a1 + v11;
  v12 = sub_1DACA28E4();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v16, v15, v12);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1DAC81284(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

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
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1DAC813CC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  v9 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  return a1;
}

_QWORD *sub_1DAC8145C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[5];
  a1[4] = a2[4];
  a1[5] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[7];
  a1[6] = a2[6];
  a1[7] = v9;
  swift_bridgeObjectRelease();
  v10 = a2[9];
  a1[8] = a2[8];
  a1[9] = v10;
  swift_bridgeObjectRelease();
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRelease();
  v12 = *(int *)(type metadata accessor for UserGuideIndexItem(0) + 40);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DAC8153C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC81548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for UserGuideIndexItem(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1DAC815C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC815D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for UserGuideIndexItem(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_1DAC81648()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UserGuideIndexItem(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_1DAC816BC()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1DAC816C8()
{
  unint64_t result;

  result = qword_1EDAF3258;
  if (!qword_1EDAF3258)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7CB0, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3258);
  }
  return result;
}

uint64_t sub_1DAC8170C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper(uint64_t a1)
{
  return sub_1DAC37CF4(a1, qword_1EDAF3350);
}

uint64_t sub_1DAC81764(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DAC817A8()
{
  unint64_t result;

  result = qword_1F028C088;
  if (!qword_1F028C088)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7C38, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C088);
  }
  return result;
}

unint64_t sub_1DAC817EC()
{
  unint64_t result;

  result = qword_1EDAF33B8;
  if (!qword_1EDAF33B8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7BE8, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF33B8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC8187C + 4 * byte_1DACA76D5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DAC818B0 + 4 * byte_1DACA76D0[v4]))();
}

uint64_t sub_1DAC818B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC818B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC818C0);
  return result;
}

uint64_t sub_1DAC818CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC818D4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DAC818D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC818E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys;
}

uint64_t *sub_1DAC81914(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1DACA28E4();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1DAC819B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1DACA28E4();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1DAC819F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1DACA28E4();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_1DAC81A68(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1DAC81AE4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1DAC81B40(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1DACA28E4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1DAC81BAC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC81BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1DACA28E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1DAC81C34()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DAC81C40(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1DACA28E4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1DAC81CB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DAC81CC8(a1, a2, a3, (uint64_t)&unk_1DACA7728, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8]);
}

uint64_t sub_1DAC81CC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t result;
  unint64_t v6;

  result = a5(319);
  if (v6 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1DAC81D74 + 4 * byte_1DACA76DA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DAC81D94 + 4 * byte_1DACA76DF[v4]))();
}

_BYTE *sub_1DAC81D74(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DAC81D94(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DAC81D9C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DAC81DA4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DAC81DAC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DAC81DB4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys;
}

unint64_t sub_1DAC81DD4()
{
  unint64_t result;

  result = qword_1F028C0B8;
  if (!qword_1F028C0B8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA79F0, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0B8);
  }
  return result;
}

unint64_t sub_1DAC81E1C()
{
  unint64_t result;

  result = qword_1F028C0C0;
  if (!qword_1F028C0C0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7AD0, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0C0);
  }
  return result;
}

unint64_t sub_1DAC81E64()
{
  unint64_t result;

  result = qword_1F028C0C8;
  if (!qword_1F028C0C8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7BC0, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0C8);
  }
  return result;
}

unint64_t sub_1DAC81EAC()
{
  unint64_t result;

  result = qword_1EDAF33C8;
  if (!qword_1EDAF33C8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7AF8, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF33C8);
  }
  return result;
}

unint64_t sub_1DAC81EF4()
{
  unint64_t result;

  result = qword_1EDAF33C0;
  if (!qword_1EDAF33C0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7B20, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.Book.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF33C0);
  }
  return result;
}

unint64_t sub_1DAC81F3C()
{
  unint64_t result;

  result = qword_1F028C0D0;
  if (!qword_1F028C0D0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7A40, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0D0);
  }
  return result;
}

unint64_t sub_1DAC81F84()
{
  unint64_t result;

  result = qword_1F028C0D8;
  if (!qword_1F028C0D8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7A68, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributes.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0D8);
  }
  return result;
}

unint64_t sub_1DAC81FCC()
{
  unint64_t result;

  result = qword_1EDAF3268;
  if (!qword_1EDAF3268)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7928, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3268);
  }
  return result;
}

unint64_t sub_1DAC82014()
{
  unint64_t result;

  result = qword_1EDAF3260;
  if (!qword_1EDAF3260)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7950, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3260);
  }
  return result;
}

unint64_t sub_1DAC82058()
{
  unint64_t result;

  result = qword_1EDAF3308;
  if (!qword_1EDAF3308)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7DF0, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3308);
  }
  return result;
}

uint64_t sub_1DAC8209C()
{
  unint64_t v0;

  v0 = sub_1DACA3124();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_1DAC820E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6449646C697562 && a2 == 0xE700000000000000;
  if (v2 || (sub_1DACA31B4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x80000001DACAEA40)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1DACA31B4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t _s10TipsDaemon20UserGuideIndexHelperC20UserGuideCDSResponseV14MiscAttributesV10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC8221C + 4 * byte_1DACA76E9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DAC82250 + 4 * byte_1DACA76E4[v4]))();
}

uint64_t sub_1DAC82250(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC82258(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC82260);
  return result;
}

uint64_t sub_1DAC8226C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC82274);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DAC82278(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC82280(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys()
{
  return &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys;
}

unint64_t sub_1DAC822A0()
{
  unint64_t result;

  result = qword_1F028C0E8;
  if (!qword_1F028C0E8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7DC8, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C0E8);
  }
  return result;
}

unint64_t sub_1DAC822E8()
{
  unint64_t result;

  result = qword_1EDAF3318;
  if (!qword_1EDAF3318)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7D00, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3318);
  }
  return result;
}

unint64_t sub_1DAC82330()
{
  unint64_t result;

  result = qword_1EDAF3310;
  if (!qword_1EDAF3310)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7D28, &type metadata for UserGuideIndexHelper.UserGuideCDSResponse.MiscAttributesWrapper.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3310);
  }
  return result;
}

void sub_1DAC82380(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x1E0C80C00];
  v9[0] = 0;
  if (objc_msgSend(a1, sel_closeAndReturnError_, v9))
  {
    v3 = v9[0];
  }
  else
  {
    v4 = v9[0];
    v5 = (void *)sub_1DACA2824();

    swift_willThrow();
  }
  v9[0] = 0;
  if (objc_msgSend(a2, sel_closeAndReturnError_, v9))
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    v8 = (void *)sub_1DACA2824();

    swift_willThrow();
  }
}

uint64_t sub_1DAC8249C(uint64_t result, unint64_t a2)
{
  uint64_t v3;

  if (a2 >> 60 != 15)
  {
    v3 = result;
    sub_1DAC324C8(result, a2);
    sub_1DAC82800();
    sub_1DACA2F38();
    return sub_1DAC3396C(v3, a2);
  }
  return result;
}

void sub_1DAC82518(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[2];
  id v24;

  v9 = sub_1DACA2A34();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1DACA2A28();
  MEMORY[0x1E0C80A78](v13);
  (*(void (**)(char *, uint64_t))(v15 + 16))((char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a4, v9);
  *(_QWORD *)(swift_allocObject() + 16) = a3;
  sub_1DACA2A10();
  swift_allocObject();
  v16 = a3;
  sub_1DACA2A1C();
  if (v4)
  {
    v21 = a2;
    v22 = v16;
  }
  else
  {
    v24 = v16;
    v17 = sub_1DACA2F2C();
    v19 = v18;
    if (v18 >> 60 != 15)
    {
      v20 = v17;
      v23[0] = v17;
      v23[1] = v18;
      sub_1DAC324C8(v17, v18);
      sub_1DAC82800();
      sub_1DACA29F8();
      sub_1DAC3396C(v20, v19);
      __asm { BR              X8 }
    }
    sub_1DACA2A04();
    swift_release();
    v21 = a2;
    v22 = v24;
  }
  sub_1DAC82380(v21, v22);
}

uint64_t sub_1DAC827C4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1DAC827E8(uint64_t a1, unint64_t a2)
{
  return sub_1DAC8249C(a1, a2);
}

unint64_t sub_1DAC82800()
{
  unint64_t result;

  result = qword_1EDAF38A0;
  if (!qword_1EDAF38A0)
  {
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0CB0310], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EDAF38A0);
  }
  return result;
}

void sub_1DAC82844(uint64_t a1, void **a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  unint64_t v16;
  int64_t v17;
  id v18;
  int64_t v19;
  id v20;

  v7 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  if (!v10)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v20 = *(id *)(*(_QWORD *)(a1 + 56) + 8 * i);
    v18 = v20;
    sub_1DAC82D20(&v20, a2, a3);
    if (v3)
    {
      swift_release();

      return;
    }

    if (v10)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v12++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    if (!v16)
    {
      v17 = v12 + 1;
      if (v12 + 1 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 2;
      if (v12 + 2 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
        goto LABEL_14;
      v17 = v12 + 3;
      if (v12 + 3 >= v11)
        goto LABEL_26;
      v16 = *(_QWORD *)(v7 + 8 * v17);
      if (v16)
      {
LABEL_14:
        v12 = v17;
        goto LABEL_15;
      }
      v19 = v12 + 4;
      if (v12 + 4 >= v11)
      {
LABEL_26:
        swift_release();
        return;
      }
      v16 = *(_QWORD *)(v7 + 8 * v19);
      v12 += 4;
      if (!v16)
        break;
    }
LABEL_15:
    v10 = (v16 - 1) & v16;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v11)
      goto LABEL_26;
    v16 = *(_QWORD *)(v7 + 8 * v12);
    ++v19;
    if (v16)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
}

uint64_t sub_1DAC82B14(uint64_t a1, void *aBlock)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DAC82B7C;
  return sub_1DAC86F28(a1);
}

uint64_t sub_1DAC82B7C(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v4;

  v4 = *v1;
  *(_QWORD *)(v4 + 40) = a1;
  swift_task_dealloc();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v2;
  *v2 = v4;
  v2[1] = sub_1DAC82BEC;
  return sub_1DACA2A4C();
}

uint64_t sub_1DAC82BEC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC82C58()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, 1, 0);
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC82CA4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = (void *)sub_1DACA2818();

  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1DAC82D20(id *a1, void **a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id result;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  void **v22;
  void *v23;
  id v24;
  char v25;
  void (*v26)(char *, uint64_t);
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t *v35;
  char isUniquelyReferenced_nonNull_native;
  void (*v37)(char *, char *, uint64_t);
  uint64_t *v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;

  v38 = a3;
  v39 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3028);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v37 - v9;
  v11 = sub_1DACA298C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v37 - v16;
  v18 = *a1;
  result = objc_msgSend(*a1, sel_displayType);
  if (result != (id)2)
    return result;
  v40 = v3;
  sub_1DAC83024((uint64_t)v10);
  v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v20(v10, 1, v11) == 1)
  {
    sub_1DAC7190C((uint64_t)v10, &qword_1EDAF3028);
    goto LABEL_11;
  }
  v21 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v21(v17, v10, v11);
  v22 = v39;
  v23 = *v39;
  if (!*v39)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
    goto LABEL_9;
  }
  v37 = v21;
  v24 = v23;
  sub_1DAC83024((uint64_t)v8);

  if (v20(v8, 1, v11) == 1)
  {
LABEL_9:
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v11);
    sub_1DAC7190C((uint64_t)v8, &qword_1EDAF3028);
    goto LABEL_10;
  }
  v37(v15, v8, v11);
  v25 = sub_1DACA2974();
  v26 = *(void (**)(char *, uint64_t))(v12 + 8);
  v26(v15, v11);
  v26(v17, v11);
  if ((v25 & 1) != 0)
  {
LABEL_10:
    v27 = *v22;
    *v22 = v18;
    v28 = v18;

  }
LABEL_11:
  result = objc_msgSend(v18, sel_isHintInelgibile);
  if ((_DWORD)result)
  {
    v29 = objc_msgSend(v18, sel_correlationIdentifier);
    v30 = sub_1DACA2D94();
    v32 = v31;

    v33 = HIBYTE(v32) & 0xF;
    if ((v32 & 0x2000000000000000) == 0)
      v33 = v30 & 0xFFFFFFFFFFFFLL;
    if (v33)
    {
      v34 = objc_msgSend(v18, sel_hintIneligibleReason);
      v35 = v38;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = *v35;
      *v35 = 0x8000000000000000;
      sub_1DAC84C00((uint64_t)v34, v30, v32, isUniquelyReferenced_nonNull_native);
      *v35 = v41;
      swift_bridgeObjectRelease();
    }
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DAC83024@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3028);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v23 - v8;
  v10 = objc_msgSend(v2, sel_hintDisplayedDates);
  if (v10)
  {
    v11 = v10;
    v12 = sub_1DACA298C();
    v13 = sub_1DACA2E3C();

    v14 = *(_QWORD *)(v13 + 16);
    v15 = *(_QWORD *)(v12 - 8);
    if (v14)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v9, v13+ ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80))+ *(_QWORD *)(v15 + 72) * (v14 - 1), v12);
      v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
      v16(v9, 0, 1, v12);
    }
    else
    {
      v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
      v16(v9, 1, 1, v12);
    }
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v9, 1, v12) != 1)
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(a1, v9, v12);
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v16)(a1, 0, 1, v12);
    }
  }
  else
  {
    v17 = sub_1DACA298C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 1, 1, v17);
  }
  v18 = objc_msgSend(v2, sel_hintWouldHaveBeenDisplayedDate);
  if (v18)
  {
    v19 = v18;
    sub_1DACA2980();

    v20 = sub_1DACA298C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v7, 0, 1, v20);
  }
  else
  {
    v22 = sub_1DACA298C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 1, 1, v22);
  }
  sub_1DAC87D20((uint64_t)v7, a1);
  return sub_1DAC7190C((uint64_t)v9, &qword_1EDAF3028);
}

uint64_t sub_1DAC83254(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  _OWORD *v9;
  __int128 v10;
  uint64_t ObjectType;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    ObjectType = swift_getObjectType();
    *(_QWORD *)&v10 = a2;
    v9 = *(_OWORD **)(*(_QWORD *)(v3 + 64) + 40);
    swift_unknownObjectRetain();
    sub_1DAC33D7C(&v10, v9);
    return swift_continuation_throwingResume();
  }
}

id DeviceProfileExporter.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DeviceProfileExporter.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DeviceProfileExporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DeviceProfileExporter()
{
  return objc_opt_self();
}

uint64_t sub_1DAC833EC()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DAC83418()
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
  v4[1] = sub_1DAC483D0;
  return ((uint64_t (*)(uint64_t, void *))((char *)&dword_1F028C0F0 + dword_1F028C0F0))(v2, v3);
}

uint64_t sub_1DAC83488()
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
  v5[1] = sub_1DAC6F4A4;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F028C488 + dword_1F028C488))(v2, v3, v4);
}

uint64_t sub_1DAC83504(uint64_t a1)
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
  v7[1] = sub_1DAC6F4A4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F028C490 + dword_1F028C490))(a1, v4, v5, v6);
}

char *sub_1DAC83588(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_1DAC83688(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C128);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

double sub_1DAC837A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1DAC331BC(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1DAC33D7C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1DAC846E4(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_1DAC838B0(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3910);
  v42 = a2;
  v6 = sub_1DACA310C();
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
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1DACA3250();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1DAC83BD4(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C000);
  v38 = a2;
  v6 = sub_1DACA310C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
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
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_1DACA3250();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1DAC83EE0(uint64_t a1, char a2)
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3658);
  v37 = a2;
  v6 = sub_1DACA310C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1DACA3250();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1DAC841E8(uint64_t a1, char a2, uint64_t *a3, void (*a4)(uint64_t, _BYTE *), void (*a5)(uint64_t, _BYTE *))
{
  uint64_t *v5;
  uint64_t *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  char v42;
  _BYTE v43[32];

  v7 = v5;
  v9 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v42 = a2;
  v10 = sub_1DACA310C();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v40 = v9 + 64;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  else
    v13 = -1;
  v14 = v13 & *(_QWORD *)(v9 + 64);
  v38 = v5;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v15 = v10 + 64;
  result = swift_retain();
  v17 = 0;
  while (1)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = (_QWORD *)(v9 + 64);
    v24 = *(_QWORD *)(v40 + 8 * v22);
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = *(_QWORD *)(v40 + 8 * v17);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v7 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = *(_QWORD *)(v40 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v39)
              goto LABEL_34;
            v24 = *(_QWORD *)(v40 + 8 * v17);
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = (uint64_t *)(*(_QWORD *)(v9 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(v9 + 56) + 32 * v21;
    if ((v42 & 1) != 0)
    {
      a4(v29, v43);
    }
    else
    {
      a5(v29, v43);
      swift_bridgeObjectRetain();
    }
    sub_1DACA3250();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v30 = -1 << *(_BYTE *)(v11 + 32);
    v31 = result & ~v30;
    v32 = v31 >> 6;
    if (((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v31) & ~*(_QWORD *)(v15 + 8 * (v31 >> 6)))) | v31 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v33 = 0;
      v34 = (unint64_t)(63 - v30) >> 6;
      do
      {
        if (++v32 == v34 && (v33 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v35 = v32 == v34;
        if (v32 == v34)
          v32 = 0;
        v33 |= v35;
        v36 = *(_QWORD *)(v15 + 8 * v32);
      }
      while (v36 == -1);
      v18 = __clz(__rbit64(~v36)) + (v32 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v11 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    result = ((uint64_t (*)(_BYTE *, unint64_t))a4)(v43, *(_QWORD *)(v11 + 56) + 32 * v18);
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v7 = v38;
  v23 = (_QWORD *)(v9 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v37 = 1 << *(_BYTE *)(v9 + 32);
  if (v37 >= 64)
    bzero(v23, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v37;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v7 = v11;
  return result;
}

unint64_t sub_1DAC84510(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1DACA2FF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v9 = sub_1DACA3274();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1DAC846E4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1DACA2FF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v10 = sub_1DACA3274();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1DAC848B8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1DACA2FF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v9 = sub_1DACA3274();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1DAC84A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_1DAC331BC(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1DAC84F18();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1DAC838B0(v17, a5 & 1);
  v23 = sub_1DAC331BC(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DACA3208();
  __break(1u);
  return result;
}

uint64_t sub_1DAC84C00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_1DAC331BC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1DAC85280();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_1DAC83EE0(result, a4 & 1);
  result = sub_1DAC331BC(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_1DACA3208();
  __break(1u);
  return result;
}

_OWORD *sub_1DAC84D50(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1DAC331BC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
        return sub_1DAC33D7C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1DAC855F0(&qword_1EDAF3668, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
      goto LABEL_7;
    }
    sub_1DAC841E8(v15, a4 & 1, &qword_1EDAF3668, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
    v21 = sub_1DAC331BC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1DAC84EB0(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1DACA3208();
  __break(1u);
  return result;
}

_OWORD *sub_1DAC84EB0(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1DAC33D7C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_1DAC84F18()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3910);
  v2 = *v0;
  v3 = sub_1DACA3100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_1DAC850D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C000);
  v2 = *v0;
  v3 = sub_1DACA3100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1DAC85280()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3658);
  v2 = *v0;
  v3 = sub_1DACA3100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1DAC8542C()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  __int128 v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3648);
  v2 = *v0;
  v3 = sub_1DACA3100();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v24 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    v20 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v20 = v19;
    v20[1] = v18;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v24;
    swift_bridgeObjectRetain();
    result = (void *)sub_1DAC324C8(v24, *((unint64_t *)&v24 + 1));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1DAC855F0(uint64_t *a1, void (*a2)(unint64_t, _BYTE *), void (*a3)(_BYTE *, uint64_t))
{
  uint64_t *v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  _BYTE v31[32];

  v5 = v3;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v6 = *v3;
  v7 = sub_1DACA3100();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v5 = v8;
    return result;
  }
  v28 = v5;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v29 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_12;
    }
    v25 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v25);
    ++v12;
    if (!v26)
    {
      v12 = v25 + 1;
      if (v25 + 1 >= v16)
        goto LABEL_26;
      v26 = *(_QWORD *)(v29 + 8 * v12);
      if (!v26)
        break;
    }
LABEL_25:
    v15 = (v26 - 1) & v26;
    v18 = __clz(__rbit64(v26)) + (v12 << 6);
LABEL_12:
    v19 = 16 * v18;
    v20 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v18);
    v21 = *v20;
    v22 = v20[1];
    v23 = 32 * v18;
    a2(*(_QWORD *)(v6 + 56) + 32 * v18, v31);
    v24 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v24 = v21;
    v24[1] = v22;
    a3(v31, *(_QWORD *)(v8 + 56) + v23);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v16)
  {
LABEL_26:
    result = (void *)swift_release();
    v5 = v28;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v29 + 8 * v27);
  if (v26)
  {
    v12 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v12 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v12 >= v16)
      goto LABEL_26;
    v26 = *(_QWORD *)(v29 + 8 * v12);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

_OWORD *sub_1DAC857E0(char a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  LOBYTE(v27) = a1;
  v9 = MEMORY[0x1E0DEAFA0];
  v28 = MEMORY[0x1E0DEAFA0];
  v10 = (_QWORD *)*a5;
  v12 = sub_1DAC331BC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_OWORD *)(v18[7] + 32 * v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return sub_1DAC33D7C(&v27, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
    goto LABEL_7;
  }
  sub_1DAC841E8(v15, a4 & 1, &qword_1EDAF3660, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
  v21 = sub_1DAC331BC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1DACA3208();
    __break(1u);
    return result;
  }
  v12 = v21;
  v18 = (_QWORD *)*a5;
  if ((v16 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v23 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v27, v9);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v26 + 16))(v25);
  sub_1DAC862A0(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1DAC859A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;

  *(_QWORD *)&v27 = a1;
  v9 = MEMORY[0x1E0DEB418];
  v28 = MEMORY[0x1E0DEB418];
  v10 = (_QWORD *)*a5;
  v12 = sub_1DAC331BC(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_OWORD *)(v18[7] + 32 * v12);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return sub_1DAC33D7C(&v27, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
    goto LABEL_7;
  }
  sub_1DAC841E8(v15, a4 & 1, &qword_1EDAF3660, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
  v21 = sub_1DAC331BC(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1DACA3208();
    __break(1u);
    return result;
  }
  v12 = v21;
  v18 = (_QWORD *)*a5;
  if ((v16 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v23 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v27, v9);
  MEMORY[0x1E0C80A78](v23);
  v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_1DAC86220(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1DAC85B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, _QWORD *a6)
{
  uint64_t v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _OWORD *v20;
  _OWORD *result;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;

  v10 = MEMORY[0x1E0DEA968];
  v29 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v28 = a1;
  *((_QWORD *)&v28 + 1) = a2;
  v11 = (_QWORD *)*a6;
  v13 = sub_1DAC331BC(a3, a4);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = v11[3];
  if (v18 >= v16 && (a5 & 1) != 0)
  {
LABEL_7:
    v19 = (_QWORD *)*a6;
    if ((v17 & 1) != 0)
    {
LABEL_8:
      v20 = (_OWORD *)(v19[7] + 32 * v13);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
      return sub_1DAC33D7C(&v28, v20);
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a5 & 1) == 0)
  {
    sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
    goto LABEL_7;
  }
  sub_1DAC841E8(v16, a5 & 1, &qword_1EDAF3660, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
  v22 = sub_1DAC331BC(a3, a4);
  if ((v17 & 1) != (v23 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1DACA3208();
    __break(1u);
    return result;
  }
  v13 = v22;
  v19 = (_QWORD *)*a6;
  if ((v17 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v24 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v28, v10);
  MEMORY[0x1E0C80A78](v24);
  v26 = (uint64_t *)((char *)&v28 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v27 + 16))(v26);
  sub_1DAC861A0(v13, a3, a4, *v26, v26[1], v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1DAC85D38(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;

  v12 = __swift_instantiateConcreteTypeFromMangledName(a6);
  v31 = v12;
  *(_QWORD *)&v30 = a1;
  v13 = (_QWORD *)*a5;
  v15 = sub_1DAC331BC(a2, a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (_OWORD *)(v21[7] + 32 * v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      return sub_1DAC33D7C(&v30, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
    goto LABEL_7;
  }
  sub_1DAC841E8(v18, a4 & 1, &qword_1EDAF3660, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
  v24 = sub_1DAC331BC(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1DACA3208();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = (_QWORD *)*a5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v26 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)&v30, v12);
  MEMORY[0x1E0C80A78](v26);
  v28 = (uint64_t *)((char *)&v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v29 + 16))(v28);
  sub_1DAC86100(v15, a2, a3, *v28, v21, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v30);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1DAC85F18(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  _OWORD *v22;
  _OWORD *result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30[3];
  uint64_t v31;

  v31 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v30);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  v13 = (_QWORD *)*a5;
  v15 = sub_1DAC331BC(a2, a3);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a4 & 1) != 0)
  {
LABEL_7:
    v21 = (_QWORD *)*a5;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = (_OWORD *)(v21[7] + 32 * v15);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
      return sub_1DAC33D7C(v30, v22);
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a4 & 1) == 0)
  {
    sub_1DAC855F0(&qword_1EDAF3660, (void (*)(unint64_t, _BYTE *))sub_1DAC7EF6C, (void (*)(_BYTE *, uint64_t))sub_1DAC33D7C);
    goto LABEL_7;
  }
  sub_1DAC841E8(v18, a4 & 1, &qword_1EDAF3660, (void (*)(uint64_t, _BYTE *))sub_1DAC33D7C, (void (*)(uint64_t, _BYTE *))sub_1DAC7EF6C);
  v24 = sub_1DAC331BC(a2, a3);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = (_OWORD *)sub_1DACA3208();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = (_QWORD *)*a5;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v26 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v30, v31);
  MEMORY[0x1E0C80A78](v26);
  v28 = (char *)v30 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v29 + 16))(v28);
  sub_1DAC86320(v15, a2, a3, (uint64_t)v28, v21, a6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
  return (_OWORD *)swift_bridgeObjectRetain();
}

_OWORD *sub_1DAC86100(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  _QWORD *v11;
  _OWORD *result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  v17 = __swift_instantiateConcreteTypeFromMangledName(a6);
  *(_QWORD *)&v16 = a4;
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v11 = (_QWORD *)(a5[6] + 16 * a1);
  *v11 = a2;
  v11[1] = a3;
  result = sub_1DAC33D7C(&v16, (_OWORD *)(a5[7] + 32 * a1));
  v13 = a5[2];
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    a5[2] = v15;
  return result;
}

_OWORD *sub_1DAC861A0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v7;
  _OWORD *result;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v13 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v12 = a4;
  *((_QWORD *)&v12 + 1) = a5;
  a6[(a1 >> 6) + 8] |= 1 << a1;
  v7 = (_QWORD *)(a6[6] + 16 * a1);
  *v7 = a2;
  v7[1] = a3;
  result = sub_1DAC33D7C(&v12, (_OWORD *)(a6[7] + 32 * a1));
  v9 = a6[2];
  v10 = __OFADD__(v9, 1);
  v11 = v9 + 1;
  if (v10)
    __break(1u);
  else
    a6[2] = v11;
  return result;
}

_OWORD *sub_1DAC86220(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  *(_QWORD *)&v11 = a4;
  v12 = MEMORY[0x1E0DEB418];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1DAC33D7C(&v11, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

_OWORD *sub_1DAC862A0(unint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  LOBYTE(v11) = a4;
  v12 = MEMORY[0x1E0DEAFA0];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1DAC33D7C(&v11, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

_OWORD *sub_1DAC86320(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v13;
  _OWORD *result;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v19 = a6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v18);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v13 = (_QWORD *)(a5[6] + 16 * a1);
  *v13 = a2;
  v13[1] = a3;
  result = sub_1DAC33D7C(&v18, (_OWORD *)(a5[7] + 32 * a1));
  v15 = a5[2];
  v16 = __OFADD__(v15, 1);
  v17 = v15 + 1;
  if (v16)
    __break(1u);
  else
    a5[2] = v17;
  return result;
}

uint64_t sub_1DAC863D4()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_1DACA2C14();
  v0[70] = v1;
  v0[71] = *(_QWORD *)(v1 - 8);
  v0[72] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8645C()
{
  uint64_t v0;
  uint64_t inited;
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
  char *v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
  inited = swift_initStackObject();
  *(_QWORD *)(v0 + 584) = inited;
  *(_OWORD *)(inited + 16) = xmmword_1DACA7E40;
  *(_QWORD *)(inited + 32) = sub_1DACA2D94();
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = sub_1DACA2D94();
  *(_QWORD *)(inited + 56) = v3;
  *(_QWORD *)(inited + 64) = sub_1DACA2D94();
  *(_QWORD *)(inited + 72) = v4;
  *(_QWORD *)(inited + 80) = sub_1DACA2D94();
  *(_QWORD *)(inited + 88) = v5;
  *(_QWORD *)(inited + 96) = sub_1DACA2D94();
  *(_QWORD *)(inited + 104) = v6;
  *(_QWORD *)(inited + 112) = sub_1DACA2D94();
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 128) = sub_1DACA2D94();
  *(_QWORD *)(inited + 136) = v8;
  *(_QWORD *)(inited + 144) = sub_1DACA2D94();
  *(_QWORD *)(inited + 152) = v9;
  *(_QWORD *)(inited + 160) = sub_1DACA2D94();
  *(_QWORD *)(inited + 168) = v10;
  *(_QWORD *)(inited + 176) = sub_1DACA2D94();
  *(_QWORD *)(inited + 184) = v11;
  *(_QWORD *)(inited + 192) = sub_1DACA2D94();
  *(_QWORD *)(inited + 200) = v12;
  *(_QWORD *)(inited + 208) = sub_1DACA2D94();
  *(_QWORD *)(inited + 216) = v13;
  *(_QWORD *)(inited + 224) = sub_1DACA2D94();
  *(_QWORD *)(inited + 232) = v14;
  *(_QWORD *)(inited + 240) = sub_1DACA2D94();
  *(_QWORD *)(inited + 248) = v15;
  *(_QWORD *)(inited + 256) = sub_1DACA2D94();
  *(_QWORD *)(inited + 264) = v16;
  *(_QWORD *)(inited + 272) = sub_1DACA2D94();
  *(_QWORD *)(inited + 280) = v17;
  v18 = sub_1DACA2D94();
  v20 = v19;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = (char *)inited;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v21 = sub_1DAC83588(0, 17, 1, (char *)inited);
  v23 = *((_QWORD *)v21 + 2);
  v22 = *((_QWORD *)v21 + 3);
  if (v23 >= v22 >> 1)
    v21 = sub_1DAC83588((char *)(v22 > 1), v23 + 1, 1, v21);
  *(_QWORD *)(v0 + 592) = v21;
  *((_QWORD *)v21 + 2) = v23 + 1;
  v24 = &v21[16 * v23];
  *((_QWORD *)v24 + 4) = v18;
  *((_QWORD *)v24 + 5) = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 600) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99E08]), sel_initWithCapacity_, *((_QWORD *)v21 + 2));
  v25 = *((_QWORD *)v21 + 2);
  *(_QWORD *)(v0 + 608) = v25;
  if (v25)
  {
    v26 = (void *)objc_opt_self();
    *(_QWORD *)(v0 + 616) = v26;
    *(_QWORD *)(v0 + 624) = 0;
    v27 = *(_QWORD *)(v0 + 592);
    *(_QWORD *)(v0 + 632) = *(_QWORD *)(v27 + 32);
    *(_QWORD *)(v0 + 640) = *(_QWORD *)(v27 + 40);
    v28 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    v29 = objc_msgSend(v28, sel_init);
    *(_QWORD *)(v0 + 648) = v29;
    objc_msgSend(v29, sel_setType_, 2);
    v30 = v29;
    v31 = (void *)sub_1DACA2D88();
    objc_msgSend(v30, sel_setKey_, v31);

    v32 = objc_msgSend(v26, sel_targetValidationForCapability_, v30);
    *(_QWORD *)(v0 + 656) = v32;
    *(_QWORD *)(v0 + 56) = v0 + 440;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DAC86888;
    *(_QWORD *)(v0 + 400) = swift_continuation_init();
    *(_QWORD *)(v0 + 368) = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v0 + 376) = 0x40000000;
    *(_QWORD *)(v0 + 384) = sub_1DAC83254;
    *(_QWORD *)(v0 + 392) = &block_descriptor_2;
    objc_msgSend(v32, sel_getCurrentStateWithCompletion_, v0 + 368);
    return swift_continuation_await();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 600));
  }
}

uint64_t sub_1DAC86888()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 664) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC8692C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  sub_1DAC33D7C((_OWORD *)(v0 + 440), (_OWORD *)(v0 + 408));
  sub_1DAC7EF6C(v0 + 408, v0 + 472);
  sub_1DAC3757C(0, &qword_1EDAF3628);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v1 = *(void **)(v0 + 648);
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();

    __swift_destroy_boxed_opaque_existential_1(v0 + 408);
  }
  else
  {
    v2 = *(void **)(v0 + 648);
    v3 = *(_QWORD *)(v0 + 640);
    v4 = *(_QWORD *)(v0 + 632);
    v5 = *(void **)(v0 + 600);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 408), *(_QWORD *)(v0 + 432));
    v6 = sub_1DACA31A8();
    *(_QWORD *)(v0 + 536) = v4;
    *(_QWORD *)(v0 + 544) = v3;
    swift_bridgeObjectRetain();
    objc_msgSend(v5, sel___swift_setObject_forKeyedSubscript_, v6, sub_1DACA31F0());

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_1(v0 + 408);
    swift_bridgeObjectRelease();
  }
  v7 = *(_QWORD *)(v0 + 624) + 1;
  if (v7 == *(_QWORD *)(v0 + 608))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 600));
  }
  else
  {
    *(_QWORD *)(v0 + 624) = v7;
    v9 = *(void **)(v0 + 616);
    v10 = *(_QWORD *)(v0 + 592) + 16 * v7;
    *(_QWORD *)(v0 + 632) = *(_QWORD *)(v10 + 32);
    *(_QWORD *)(v0 + 640) = *(_QWORD *)(v10 + 40);
    v11 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    v12 = objc_msgSend(v11, sel_init);
    *(_QWORD *)(v0 + 648) = v12;
    objc_msgSend(v12, sel_setType_, 2);
    v13 = v12;
    v14 = (void *)sub_1DACA2D88();
    objc_msgSend(v13, sel_setKey_, v14);

    v15 = objc_msgSend(v9, sel_targetValidationForCapability_, v13);
    *(_QWORD *)(v0 + 656) = v15;
    *(_QWORD *)(v0 + 56) = v0 + 440;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DAC86888;
    *(_QWORD *)(v0 + 400) = swift_continuation_init();
    *(_QWORD *)(v0 + 368) = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v0 + 376) = 0x40000000;
    *(_QWORD *)(v0 + 384) = sub_1DAC83254;
    *(_QWORD *)(v0 + 392) = &block_descriptor_2;
    objc_msgSend(v15, sel_getCurrentStateWithCompletion_, v0 + 368);
    return swift_continuation_await();
  }
}

uint64_t sub_1DAC86C58()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v1 = *(void **)(v0 + 664);
  v2 = *(_QWORD *)(v0 + 576);
  v3 = *(_QWORD *)(v0 + 568);
  v13 = *(_QWORD *)(v0 + 560);
  v14 = *(void **)(v0 + 648);
  swift_willThrow();
  sub_1DACA2BE4();
  *(_QWORD *)(v0 + 504) = 0;
  *(_QWORD *)(v0 + 512) = 0xE000000000000000;
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 520) = 0xD00000000000001DLL;
  *(_QWORD *)(v0 + 528) = 0x80000001DACAEB90;
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v13);
  v4 = *(_QWORD *)(v0 + 624) + 1;
  if (v4 == *(_QWORD *)(v0 + 608))
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 600));
  }
  else
  {
    *(_QWORD *)(v0 + 624) = v4;
    v6 = *(void **)(v0 + 616);
    v7 = *(_QWORD *)(v0 + 592) + 16 * v4;
    *(_QWORD *)(v0 + 632) = *(_QWORD *)(v7 + 32);
    *(_QWORD *)(v0 + 640) = *(_QWORD *)(v7 + 40);
    v8 = objc_allocWithZone((Class)TPSDeviceCapability);
    swift_bridgeObjectRetain();
    v9 = objc_msgSend(v8, sel_init);
    *(_QWORD *)(v0 + 648) = v9;
    objc_msgSend(v9, sel_setType_, 2);
    v10 = v9;
    v11 = (void *)sub_1DACA2D88();
    objc_msgSend(v10, sel_setKey_, v11);

    v12 = objc_msgSend(v6, sel_targetValidationForCapability_, v10);
    *(_QWORD *)(v0 + 656) = v12;
    *(_QWORD *)(v0 + 56) = v0 + 440;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DAC86888;
    *(_QWORD *)(v0 + 400) = swift_continuation_init();
    *(_QWORD *)(v0 + 368) = MEMORY[0x1E0C809B0];
    *(_QWORD *)(v0 + 376) = 0x40000000;
    *(_QWORD *)(v0 + 384) = sub_1DAC83254;
    *(_QWORD *)(v0 + 392) = &block_descriptor_2;
    objc_msgSend(v12, sel_getCurrentStateWithCompletion_, v0 + 368);
    return swift_continuation_await();
  }
}

uint64_t sub_1DAC86F28(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[96] = a1;
  v2 = sub_1DACA2C14();
  v1[97] = v2;
  v1[98] = *(_QWORD *)(v2 - 8);
  v1[99] = swift_task_alloc();
  v3 = sub_1DACA298C();
  v1[100] = v3;
  v1[101] = *(_QWORD *)(v3 - 8);
  v1[102] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3028);
  v1[103] = swift_task_alloc();
  v1[104] = swift_task_alloc();
  v1[105] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1DAC86FF0()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id result;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t);
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  id v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t inited;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  _QWORD *v86;
  uint64_t (*v87)(uint64_t, uint64_t, uint64_t);
  void **v88;
  _OWORD *v89;
  uint64_t v90;
  id v91;
  _OWORD *v92;
  _QWORD v93[2];

  v1 = sub_1DAC767F4(MEMORY[0x1E0DEE9D8]);
  v2 = (void *)objc_opt_self();
  *(_BYTE *)(v0 + 144) = objc_msgSend(v2, sel_isSeniorUser);
  *(_QWORD *)(v0 + 168) = MEMORY[0x1E0DEAFA0];
  sub_1DAC33D7C((_OWORD *)(v0 + 144), (_OWORD *)(v0 + 176));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v1;
  *(_QWORD *)(v0 + 744) = 0x8000000000000000;
  v4 = *(_QWORD *)(v0 + 200);
  v5 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 176, v4);
  v6 = *(_QWORD *)(v4 - 8);
  v7 = (char *)swift_task_alloc();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v7, v5, v4);
  sub_1DAC857E0(*v7, 3487349, 0xE300000000000000, isUniquelyReferenced_nonNull_native, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 176);
  swift_task_dealloc();
  v8 = v93[0];
  swift_bridgeObjectRelease();
  v91 = v2;
  result = objc_msgSend(v2, sel_sharedInstance);
  if (!result)
  {
    __break(1u);
    goto LABEL_21;
  }
  v10 = result;
  v11 = *(void **)(v0 + 768);
  v12 = objc_msgSend(result, sel_userType);

  *(_QWORD *)(v0 + 232) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v0 + 208) = v12;
  sub_1DAC33D7C((_OWORD *)(v0 + 208), (_OWORD *)(v0 + 240));
  LOBYTE(v12) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v8;
  v13 = *(_QWORD *)(v0 + 264);
  v14 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 240, v13);
  v15 = *(_QWORD *)(v13 - 8);
  v16 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v15 + 16))(v16, v14, v13);
  sub_1DAC859A8(*v16, 0x6570795472657375, 0xE800000000000000, (char)v12, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 240);
  swift_task_dealloc();
  v17 = v93[0];
  swift_bridgeObjectRelease();
  v18 = objc_msgSend(v11, sel_experiment);
  v19 = objc_msgSend(v18, sel_camp);

  *(_QWORD *)(v0 + 296) = MEMORY[0x1E0DEB418];
  *(_QWORD *)(v0 + 272) = v19;
  sub_1DAC33D7C((_OWORD *)(v0 + 272), (_OWORD *)(v0 + 304));
  LOBYTE(v15) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v17;
  v20 = *(_QWORD *)(v0 + 328);
  v21 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 304, v20);
  v22 = *(_QWORD *)(v20 - 8);
  v23 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v22 + 16))(v23, v21, v20);
  sub_1DAC859A8(*v23, 0x656D697265707865, 0xEE00706D6143746ELL, v15, v93);
  __swift_destroy_boxed_opaque_existential_1(v0 + 304);
  swift_task_dealloc();
  *(_QWORD *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  result = objc_msgSend(v91, sel_sharedInstance);
  if (!result)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  v24 = result;
  v25 = objc_msgSend(result, sel_lastMajorVersionUpdateDate);

  v92 = (_OWORD *)(v0 + 432);
  if (v25)
  {
    sub_1DACA2980();

    v26 = 0;
  }
  else
  {
    v26 = 1;
  }
  v27 = *(_QWORD *)(v0 + 840);
  v28 = *(_QWORD *)(v0 + 832);
  v29 = *(_QWORD *)(v0 + 808);
  v30 = *(_QWORD *)(v0 + 800);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56))(v28, v26, 1, v30);
  sub_1DAC87D20(v28, v27);
  v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
  v32 = v31(v27, 1, v30);
  v33 = *(_QWORD *)(v0 + 840);
  v87 = v31;
  if (v32 == 1)
  {
    sub_1DAC7190C(v33, &qword_1EDAF3028);
    sub_1DAC837A8(0xD00000000000001CLL, 0x80000001DACAEAC0, (_OWORD *)(v0 + 368));
    sub_1DAC7190C(v0 + 368, &qword_1F028C118);
    v34 = *(_QWORD *)(v0 + 744);
  }
  else
  {
    v35 = *(_QWORD *)(v0 + 808);
    v36 = *(_QWORD *)(v0 + 800);
    *(_QWORD *)(v0 + 360) = v36;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 336));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v35 + 32))(boxed_opaque_existential_1, v33, v36);
    sub_1DAC33D7C((_OWORD *)(v0 + 336), (_OWORD *)(v0 + 496));
    v38 = *(_QWORD *)(v0 + 744);
    v39 = swift_isUniquelyReferenced_nonNull_native();
    v93[0] = v38;
    *(_QWORD *)(v0 + 744) = 0x8000000000000000;
    v40 = *(_QWORD *)(v0 + 520);
    v41 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 496, v40);
    v42 = *(_QWORD *)(v40 - 8);
    v43 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v42 + 16))(v43, v41, v40);
    sub_1DAC85F18(v43, 0xD00000000000001CLL, 0x80000001DACAEAC0, v39, v93, v36);
    __swift_destroy_boxed_opaque_existential_1(v0 + 496);
    swift_task_dealloc();
    v34 = v93[0];
    swift_bridgeObjectRelease();
  }
  v89 = (_OWORD *)(v0 + 560);
  v44 = (unint64_t *)(v0 + 752);
  v88 = (void **)(v0 + 760);
  v45 = *(void **)(v0 + 768);
  v46 = objc_msgSend((id)objc_opt_self(), sel_tps_userLanguageCode);
  v47 = sub_1DACA2D94();
  v49 = v48;

  *(_QWORD *)(v0 + 424) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v0 + 400) = v47;
  *(_QWORD *)(v0 + 408) = v49;
  sub_1DAC33D7C((_OWORD *)(v0 + 400), v92);
  LOBYTE(v49) = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v34;
  v50 = *(_QWORD *)(v0 + 456);
  v51 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v92, v50);
  v52 = *(_QWORD *)(v50 - 8);
  v53 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v52 + 16))(v53, v51, v50);
  sub_1DAC85B70(*v53, v53[1], 0xD00000000000001ALL, 0x80000001DACAEAE0, v49, v93);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
  swift_task_dealloc();
  *(_QWORD *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  v54 = objc_msgSend(v45, sel_tipStatusController);
  v55 = objc_msgSend(v54, sel_tipStatusMap);

  if (v55)
  {
    sub_1DAC3757C(0, &qword_1EDAF3608);
    v56 = sub_1DACA2D58();

  }
  else
  {
    v56 = 0;
  }
  v57 = sub_1DAC76948(MEMORY[0x1E0DEE9D8]);
  *v44 = v57;
  *v88 = 0;
  if (v56)
  {
    sub_1DAC82844(v56, v88, (uint64_t *)(v0 + 752));
    swift_bridgeObjectRelease();
    v58 = *v44;
    v59 = *v88;
  }
  else
  {
    v58 = v57;
    v59 = 0;
  }
  *(_QWORD *)(v0 + 552) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35A0);
  *(_QWORD *)(v0 + 528) = v58;
  sub_1DAC33D7C((_OWORD *)(v0 + 528), v89);
  swift_bridgeObjectRetain();
  v60 = *(_QWORD *)(v0 + 744);
  v61 = swift_isUniquelyReferenced_nonNull_native();
  v93[0] = v60;
  v62 = *(_QWORD *)(v0 + 584);
  v63 = __swift_mutable_project_boxed_opaque_existential_0((uint64_t)v89, v62);
  v64 = *(_QWORD *)(v62 - 8);
  v65 = (uint64_t *)swift_task_alloc();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v64 + 16))(v65, v63, v62);
  sub_1DAC85D38(*v65, 0x626967696C656E69, 0xEE0073706954656CLL, v61, v93, &qword_1EDAF35A0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v89);
  swift_task_dealloc();
  *(_QWORD *)(v0 + 744) = v93[0];
  swift_bridgeObjectRelease();
  if (v59)
  {
    v66 = *(_QWORD *)(v0 + 824);
    v67 = *(_QWORD *)(v0 + 800);
    v68 = v59;
    sub_1DAC83024(v66);
    v69 = v87(v66, 1, v67);
    v70 = *(_QWORD *)(v0 + 824);
    if (v69 == 1)
    {

      sub_1DAC7190C(v70, &qword_1EDAF3028);
    }
    else
    {
      v71 = *(_QWORD *)(v0 + 816);
      v72 = *(_QWORD *)(v0 + 808);
      v73 = *(_QWORD *)(v0 + 800);
      v90 = v71;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v72 + 32))(v71, v70, v73);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDAF3930);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_1DACA7E50;
      *(_QWORD *)(inited + 32) = 0x4449706974;
      *(_QWORD *)(inited + 40) = 0xE500000000000000;
      v75 = objc_msgSend(v68, sel_correlationIdentifier);
      v76 = sub_1DACA2D94();
      v78 = v77;

      *(_QWORD *)(inited + 48) = v76;
      *(_QWORD *)(inited + 56) = v78;
      *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
      strcpy((char *)(inited + 80), "displayedDate");
      *(_WORD *)(inited + 94) = -4864;
      *(_QWORD *)(inited + 120) = v73;
      v79 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 96));
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v72 + 16))(v79, v71, v73);
      v80 = sub_1DAC767F4(inited);
      *(_QWORD *)(v0 + 712) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35B0);
      *(_QWORD *)(v0 + 688) = v80;
      sub_1DAC33D7C((_OWORD *)(v0 + 688), (_OWORD *)(v0 + 464));
      v81 = *(_QWORD *)(v0 + 744);
      LOBYTE(v80) = swift_isUniquelyReferenced_nonNull_native();
      v93[0] = v81;
      v82 = *(_QWORD *)(v0 + 488);
      v83 = __swift_mutable_project_boxed_opaque_existential_0(v0 + 464, v82);
      v84 = *(_QWORD *)(v82 - 8);
      v85 = (uint64_t *)swift_task_alloc();
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v84 + 16))(v85, v83, v82);
      sub_1DAC85D38(*v85, 0xD000000000000010, 0x80000001DACAEB50, v80, v93, &qword_1EDAF35B0);
      __swift_destroy_boxed_opaque_existential_1(v0 + 464);
      swift_task_dealloc();
      *(_QWORD *)(v0 + 744) = v93[0];
      swift_bridgeObjectRelease();

      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v90, v73);
    }
  }
  v86 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 848) = v86;
  *v86 = v0;
  v86[1] = sub_1DAC879C4;
  return (id)sub_1DAC863D4();
}

uint64_t sub_1DAC879C4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 856) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC87A20()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;
  unint64_t v10;

  v9 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E8);
  sub_1DACA2D4C();
  sub_1DAC837A8(0xD000000000000012, 0x80000001DACAEB00, (_OWORD *)(v0 + 624));
  sub_1DAC7190C(v0 + 624, &qword_1F028C118);
  v1 = *(void **)(v0 + 856);
  v2 = *(_QWORD *)(v0 + 792);
  v3 = *(_QWORD *)(v0 + 784);
  v4 = *(_QWORD *)(v0 + 776);
  sub_1DACA2BE4();
  v9 = 0;
  v10 = 0xE000000000000000;
  sub_1DACA304C();
  v5 = v10;
  *(_QWORD *)(v0 + 720) = v9;
  *(_QWORD *)(v0 + 728) = v5;
  sub_1DACA2DDC();
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 736) = v6;
  sub_1DACA30D0();

  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v7 = *(_QWORD *)(v0 + 744);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t __swift_mutable_project_boxed_opaque_existential_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1DAC87D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3028);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DAC87D6C()
{
  unint64_t result;

  result = qword_1F028C130;
  if (!qword_1F028C130)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7F08, &type metadata for SpotlightIndexedEntity.IndexEntityQuery);
    atomic_store(result, (unint64_t *)&qword_1F028C130);
  }
  return result;
}

unint64_t sub_1DAC87DB4()
{
  unint64_t result;

  result = qword_1F028C138[0];
  if (!qword_1F028C138[0])
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7F68, &type metadata for SpotlightIndexedEntity.IndexEntityQuery);
    atomic_store(result, qword_1F028C138);
  }
  return result;
}

unint64_t sub_1DAC87DFC()
{
  unint64_t result;

  result = qword_1EDAF2F30;
  if (!qword_1EDAF2F30)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7FDC, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F30);
  }
  return result;
}

uint64_t sub_1DAC87E40@<X0>(uint64_t a1@<X8>)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  id v19;
  void *v20;
  char *v21;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37[6];

  v36 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2EB8);
  MEMORY[0x1E0C80A78](v2);
  v35 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1DACA2848();
  v30 = *(_QWORD *)(v34 - 8);
  v4 = MEMORY[0x1E0C80A78](v34);
  v33 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v28 = (char *)&v27 - v6;
  v7 = sub_1DACA2C68();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DACA2C50();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v27 - v15;
  v17 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  objc_msgSend(v17, sel_isPhoneUI);
  sub_1DACA2C44();
  v29 = v11;
  v18 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v31 = v10;
  v18(v14, v16, v10);
  swift_bridgeObjectRetain();
  sub_1DACA2C5C();
  v19 = objc_msgSend(*(id *)(v1 + 16), sel_displayName);
  if (v19)
  {
    v20 = v19;
    sub_1DACA2D94();

  }
  v21 = v28;
  sub_1DACA2830();
  v37[3] = v7;
  v37[4] = sub_1DAC88C24(&qword_1EDAF2F80, MEMORY[0x1E0DBF230]);
  v37[5] = sub_1DAC88C24(&qword_1EDAF2F78, MEMORY[0x1E0DBF228]);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
  v23 = v32;
  (*(void (**)(uint64_t *, char *, uint64_t))(v32 + 16))(boxed_opaque_existential_1, v9, v7);
  v24 = v30;
  v25 = v34;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v33, v21, v34);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v24 + 56))(v35, 1, 1, v25);
  sub_1DACA26C8();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v25);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v29 + 8))(v16, v31);
}

uint64_t sub_1DAC88174()
{
  uint64_t v0;

  return sub_1DAC88C10(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1DAC8818C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1DAC881A4()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = MEMORY[0x1E0DEE9D8];
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1DAC881C4()
{
  unint64_t result;

  result = qword_1F028C150;
  if (!qword_1F028C150)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7F90, &type metadata for SpotlightIndexedEntity.IndexEntityQuery);
    atomic_store(result, (unint64_t *)&qword_1F028C150);
  }
  return result;
}

unint64_t sub_1DAC8820C()
{
  unint64_t result;

  result = qword_1EDAF2F38;
  if (!qword_1EDAF2F38)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8124, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F38);
  }
  return result;
}

unint64_t sub_1DAC88254()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F028C158;
  if (!qword_1F028C158)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1F028C160);
    v2 = sub_1DAC8820C();
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0C91CE0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F028C158);
  }
  return result;
}

uint64_t sub_1DAC882B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1DAC88690();
  *v1 = v0;
  v1[1] = sub_1DAC483D0;
  return sub_1DACA26BC();
}

uint64_t sub_1DAC88324()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC483D0;
  return sub_1DACA26E0();
}

uint64_t sub_1DAC88398()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2EB8);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_1DACA283C();
  v3 = *(_QWORD *)(v12[0] - 8);
  MEMORY[0x1E0C80A78](v12[0]);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DACA29EC();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DACA2D7C();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DACA2848();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DACA2710();
  __swift_allocate_value_buffer(v10, qword_1EDAF5088);
  __swift_project_value_buffer(v10, (uint64_t)qword_1EDAF5088);
  sub_1DACA2D70();
  sub_1DACA29BC();
  (*(void (**)(char *, _QWORD, _QWORD))(v3 + 104))(v5, *MEMORY[0x1E0CAF9B8], v12[0]);
  sub_1DACA2854();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v2, 1, 1, v8);
  return sub_1DACA2704();
}

id sub_1DAC885AC()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

unint64_t sub_1DAC885B8()
{
  unint64_t result;

  result = qword_1EDAF2F20;
  if (!qword_1EDAF2F20)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8034, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F20);
  }
  return result;
}

unint64_t sub_1DAC88600()
{
  unint64_t result;

  result = qword_1EDAF2F40;
  if (!qword_1EDAF2F40)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA806C, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F40);
  }
  return result;
}

unint64_t sub_1DAC88648()
{
  unint64_t result;

  result = qword_1EDAF2F68;
  if (!qword_1EDAF2F68)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA809C, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F68);
  }
  return result;
}

unint64_t sub_1DAC88690()
{
  unint64_t result;

  result = qword_1F028C178;
  if (!qword_1F028C178)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA7EB0, &type metadata for SpotlightIndexedEntity.IndexEntityQuery);
    atomic_store(result, (unint64_t *)&qword_1F028C178);
  }
  return result;
}

uint64_t sub_1DAC886D4()
{
  return MEMORY[0x1E0C91C88];
}

unint64_t sub_1DAC886E4()
{
  unint64_t result;

  result = qword_1EDAF2F48;
  if (!qword_1EDAF2F48)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA80D4, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F48);
  }
  return result;
}

unint64_t sub_1DAC8872C()
{
  unint64_t result;

  result = qword_1EDAF2F50;
  if (!qword_1EDAF2F50)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA80FC, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F50);
  }
  return result;
}

unint64_t sub_1DAC88774()
{
  unint64_t result;

  result = qword_1EDAF2F58;
  if (!qword_1EDAF2F58)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA817C, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F58);
  }
  return result;
}

uint64_t sub_1DAC887B8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1EDAF2F18 != -1)
    swift_once();
  v2 = sub_1DACA2710();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1EDAF5088);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

unint64_t sub_1DAC8882C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F028C180;
  if (!qword_1F028C180)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F028C188);
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0C91998], v1);
    atomic_store(result, (unint64_t *)&qword_1F028C180);
  }
  return result;
}

uint64_t sub_1DAC88878()
{
  sub_1DAC87DFC();
  return sub_1DACA26B0();
}

unint64_t sub_1DAC888B4()
{
  unint64_t result;

  result = qword_1EDAF2F60;
  if (!qword_1EDAF2F60)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA81AC, &type metadata for SpotlightIndexedEntity);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F60);
  }
  return result;
}

uint64_t sub_1DAC888FC()
{
  sub_1DAC88774();
  return sub_1DACA271C();
}

ValueMetadata *type metadata accessor for SpotlightIndexedEntity.IndexEntityQuery()
{
  return &type metadata for SpotlightIndexedEntity.IndexEntityQuery;
}

uint64_t initializeBufferWithCopyOfBuffer for SpotlightIndexedEntity(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SpotlightIndexedEntity(uint64_t a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for SpotlightIndexedEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v5 = (void *)a2[2];
  v4 = a2[3];
  a1[2] = v5;
  a1[3] = v4;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRetain();
  v7 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for SpotlightIndexedEntity(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  a1[2] = v4;
  v6 = v4;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for SpotlightIndexedEntity(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SpotlightIndexedEntity(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SpotlightIndexedEntity(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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

ValueMetadata *type metadata accessor for SpotlightIndexedEntity()
{
  return &type metadata for SpotlightIndexedEntity;
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

uint64_t sub_1DAC88C10(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_1DAC88C24(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1DACA2C68();
    result = MEMORY[0x1DF0A60C4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DAC88C64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[35] = a4;
  v5[36] = v4;
  v5[33] = a2;
  v5[34] = a3;
  v5[32] = a1;
  v6 = sub_1DACA2C14();
  v5[37] = v6;
  v5[38] = *(_QWORD *)(v6 - 8);
  v5[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC88CCC()
{
  uint64_t v0;
  int *v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD);

  v1 = *(int **)(v0 + 272);
  objc_msgSend(*(id *)(v0 + 288), sel_beginIndexBatch);
  v4 = (uint64_t (*)(_QWORD))((char *)v1 + *v1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v2;
  *v2 = v0;
  v2[1] = sub_1DAC88D38;
  return v4(*(_QWORD *)(v0 + 288));
}

uint64_t sub_1DAC88D38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC88D9C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[36];
  v2 = sub_1DACA2938();
  v0[42] = v2;
  v0[10] = v0;
  v0[11] = sub_1DAC88E44;
  v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E0C809B0];
  v4 = v0 + 23;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_2;
  v4[4] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC88E44()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 344) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_1DAC88EA4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC88EE4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v0[38];
  v1 = v0[39];
  v3 = (void *)v0[36];
  v4 = v0[37];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1DACA3214();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  v5 = sub_1DACA2938();
  v0[44] = v5;
  v0[2] = v0;
  v0[3] = sub_1DAC89054;
  v6 = swift_continuation_init();
  v0[18] = MEMORY[0x1E0C809B0];
  v0[19] = 0x40000000;
  v0[20] = sub_1DAC8A5FC;
  v0[21] = &block_descriptor_3;
  v0[22] = v6;
  objc_msgSend(v3, sel_endIndexBatchWithClientState_completionHandler_, v5, v0 + 18);
  return swift_continuation_await();
}

uint64_t sub_1DAC89054()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 360) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC890B4()
{
  uint64_t v0;

  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC89100()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 352);
  v2 = *(void **)(v0 + 328);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC89154()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 336);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8919C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3670);
    v2 = sub_1DACA3118();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1DAC7EF6C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1DAC33D7C(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1DAC33D7C(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1DAC33D7C(v36, v37);
    sub_1DAC33D7C(v37, &v33);
    result = sub_1DACA3004();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1DAC33D7C(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1DAC75BE8();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_1DAC896BC(uint64_t a1)
{
  char *v1;
  char *v3;
  char *v4;
  void *v5;
  char *v6;
  void *v7;
  id v8;
  unint64_t v9;
  char v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  objc_super v17;
  __int128 v18;
  __int128 v19;

  v3 = &v1[OBJC_IVAR___TPSContextualEventBuilder_eventType];
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  v4 = &v1[OBJC_IVAR___TPSContextualEventBuilder_stream];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR___TPSContextualEventBuilder_dictionary] = a1;
  v5 = (void *)objc_opt_self();
  v6 = v1;
  swift_bridgeObjectRetain();
  v7 = (void *)sub_1DACA2D40();
  v8 = objc_msgSend(v5, sel_typeFromEventDictionary_, v7);

  *(_QWORD *)v3 = v8;
  v3[8] = 0;
  if (!*(_QWORD *)(a1 + 16) || (v9 = sub_1DAC331BC(0x6D6165727473, 0xE600000000000000), (v10 & 1) == 0))
  {
    v18 = 0u;
    v19 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1DAC7EF6C(*(_QWORD *)(a1 + 56) + 32 * v9, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_7:
    sub_1DAC89BE4((uint64_t)&v18);
    v12 = 0;
    v13 = 0;
    goto LABEL_8;
  }
  v11 = swift_dynamicCast();
  v12 = v15;
  v13 = v16;
  if (!v11)
  {
    v12 = 0;
    v13 = 0;
  }
LABEL_8:
  *(_QWORD *)v4 = v12;
  *((_QWORD *)v4 + 1) = v13;

  swift_bridgeObjectRelease();
  v17.receiver = v6;
  v17.super_class = (Class)type metadata accessor for TipsContextualEventBuilder();
  return objc_msgSendSuper2(&v17, sel_init);
}

id sub_1DAC8989C()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v15;
  uint64_t v16;
  void *v17;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_eventType + 8) & 1) != 0)
    return 0;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_eventType);
  switch(v2)
  {
    case 0:
      v5 = *(_QWORD *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_stream);
      v6 = *(_QWORD *)(v0 + OBJC_IVAR___TPSContextualEventBuilder_stream + 8);
      v7 = sub_1DACA2D94();
      if (!v6)
      {
        swift_bridgeObjectRelease();
        return 0;
      }
      if (v5 == v7 && v6 == v8)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = sub_1DACA31B4();
        swift_bridgeObjectRelease();
        if ((v10 & 1) == 0)
          return 0;
      }
      v15 = (void *)objc_opt_self();
      v16 = swift_bridgeObjectRetain();
      sub_1DAC8919C(v16);
      swift_bridgeObjectRelease();
      v17 = (void *)sub_1DACA2D40();
      swift_bridgeObjectRelease();
      v1 = objc_msgSend(v15, sel_contextualBiomeEventFromDuetEventDictionary_, v17);

      return v1;
    case 3:
      v11 = swift_bridgeObjectRetain();
      sub_1DAC8919C(v11);
      swift_bridgeObjectRelease();
      v4 = (objc_class *)MEMORY[0x1E0DBF370];
      goto LABEL_15;
    case 2:
      v3 = swift_bridgeObjectRetain();
      sub_1DAC8919C(v3);
      swift_bridgeObjectRelease();
      v4 = (objc_class *)MEMORY[0x1E0DBF388];
LABEL_15:
      v12 = objc_allocWithZone(v4);
      v13 = (void *)sub_1DACA2D40();
      swift_bridgeObjectRelease();
      v1 = objc_msgSend(v12, sel_initWithDictionary_, v13);

      return v1;
  }
  return 0;
}

id TipsContextualEventBuilder.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TipsContextualEventBuilder.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TipsContextualEventBuilder.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipsContextualEventBuilder();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TipsContextualEventBuilder()
{
  return objc_opt_self();
}

uint64_t method lookup function for TipsContextualEventBuilder()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1DAC89BE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DAC89C24()
{
  return sub_1DAC89C40();
}

uint64_t sub_1DAC89C40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  _OWORD v9[2];
  _QWORD v10[4];

  v0 = sub_1DACA2C14();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  *(_QWORD *)&v9[0] = 0xD00000000000001ELL;
  *((_QWORD *)&v9[0] + 1) = 0x80000001DACAEEC0;
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_objectForKey_, v5);

  if (v6)
  {
    sub_1DACA2FE0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v9, 0, sizeof(v9));
  }
  sub_1DAC90858((uint64_t)v9, (uint64_t)v10);
  if (v10[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
      __asm { BR              X10 }
  }
  else
  {
    sub_1DAC7190C((uint64_t)v10, &qword_1EDAF36F0);
  }
  sub_1DACA2BFC();
  sub_1DACA2C98();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t sub_1DAC89FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DAC8A008(a1, a2, a3, a4, (void (*)(void))sub_1DAC90BAC);
}

uint64_t sub_1DAC8A008(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v13 = sub_1DACA2C14();
  MEMORY[0x1E0C80A78](v13);
  sub_1DACA2788();
  swift_allocObject();
  sub_1DACA277C();
  a5();
  v6 = sub_1DACA2770();
  v8 = v7;
  swift_release();
  v9 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v10 = (void *)sub_1DACA2938();
  sub_1DACA2DDC();
  v11 = (void *)sub_1DACA2D88();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_setObject_forKey_, v10, v11);

  return sub_1DAC33928(v6, v8);
}

uint64_t sub_1DAC8A288(uint64_t a1, uint64_t a2)
{
  return sub_1DAC8A294(a1, a2, (uint64_t (*)(uint64_t, uint64_t))sub_1DAC31E48);
}

uint64_t sub_1DAC8A294(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v6 = sub_1DACA2C14();
  MEMORY[0x1E0C80A78](v6);
  swift_bridgeObjectRetain();
  v7 = a3(a1, a2);
  v9 = v8;
  swift_bridgeObjectRelease();
  sub_1DACA2788();
  swift_allocObject();
  sub_1DACA277C();
  sub_1DAC90814();
  v10 = sub_1DACA2770();
  swift_release();
  sub_1DAC33928(v7, v9);
  return v10;
}

uint64_t sub_1DAC8A468(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  result = sub_1DACA2F20();
  v3 = 0;
  v18 = result;
  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_5;
    }
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1DAC8E914(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_1DAC8A5FC(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_1DAC8A670()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_1DAC8A6D4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  id result;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 168);
  if (v1 == *(_QWORD *)(v0 + 144))
  {
    *(_QWORD *)(v0 + 192) = *(_QWORD *)(v0 + 152);
    swift_bridgeObjectRelease();
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 200) = v2;
    *v2 = v0;
    v2[1] = sub_1DAC8A7C0;
    return (id)sub_1DAC8C0F8(*(_QWORD *)(v0 + 88));
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 88);
    if ((v4 & 0xC000000000000001) != 0)
      result = (id)MEMORY[0x1DF0A5770](*(_QWORD *)(v0 + 168));
    else
      result = *(id *)(v4 + 8 * v1 + 32);
    v5 = (uint64_t)result;
    *(_QWORD *)(v0 + 160) = result;
    *(_QWORD *)(v0 + 168) = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
    }
    else
    {
      v6 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 176) = v6;
      *v6 = v0;
      v6[1] = sub_1DAC8A670;
      return (id)sub_1DAC37C6C(v5, 1, *(_QWORD *)(v0 + 96));
    }
  }
  return result;
}

uint64_t sub_1DAC8A7C0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8A824()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 192);
  if (*(_QWORD *)(v1 + 16))
  {
    sub_1DAC7EFFC();
    swift_allocError();
    *(_QWORD *)v2 = v1;
    *(_QWORD *)(v2 + 8) = 0;
    *(_BYTE *)(v2 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1DAC8A8C0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id result;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;

  v1 = *(void **)(v0 + 184);
  *(_QWORD *)(v0 + 80) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v4 = *(_QWORD *)(v0 + 128);
    v3 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
    v5 = *(_QWORD *)(v0 + 112);

    v6 = *(void **)(v0 + 16);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = *(_BYTE *)(v0 + 32);
    sub_1DACA2BFC();
    *(_QWORD *)(v0 + 56) = 0;
    *(_QWORD *)(v0 + 64) = 0xE000000000000000;
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 40) = 0xD000000000000010;
    *(_QWORD *)(v0 + 48) = 0x80000001DACAEE20;
    sub_1DACA2CC8();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    v3(v4, v5);
    sub_1DAC7EFFC();
    v9 = swift_allocError();
    *(_QWORD *)v10 = v6;
    *(_QWORD *)(v10 + 8) = v7;
    *(_BYTE *)(v10 + 16) = v8;
    sub_1DAC903A8(v6, v7, v8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *(_QWORD **)(v0 + 152);
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v12 = sub_1DAC83688(0, v12[2] + 1, 1, *(_QWORD **)(v0 + 152));
    v14 = v12[2];
    v13 = v12[3];
    if (v14 >= v13 >> 1)
      v12 = sub_1DAC83688((_QWORD *)(v13 > 1), v14 + 1, 1, v12);
    v15 = *(void **)(v0 + 160);
    v12[2] = v14 + 1;
    v12[v14 + 4] = v9;

    sub_1DAC903D4(v6, v7, v8);
    v16 = *(_QWORD *)(v0 + 168);
    if (v16 == *(_QWORD *)(v0 + 144))
    {
      *(_QWORD *)(v0 + 192) = v12;
      swift_bridgeObjectRelease();
      v17 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v17;
      *v17 = v0;
      v17[1] = sub_1DAC8A7C0;
      return (id)sub_1DAC8C0F8(*(_QWORD *)(v0 + 88));
    }
    else
    {
      *(_QWORD *)(v0 + 152) = v12;
      v19 = *(_QWORD *)(v0 + 88);
      if ((v19 & 0xC000000000000001) != 0)
        result = (id)MEMORY[0x1DF0A5770](v16);
      else
        result = *(id *)(v19 + 8 * v16 + 32);
      v20 = (uint64_t)result;
      *(_QWORD *)(v0 + 160) = result;
      *(_QWORD *)(v0 + 168) = v16 + 1;
      if (__OFADD__(v16, 1))
      {
        __break(1u);
      }
      else
      {
        v21 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 176) = v21;
        *v21 = v0;
        v21[1] = sub_1DAC8A670;
        return (id)sub_1DAC37C6C(v20, 1, *(_QWORD *)(v0 + 96));
      }
    }
  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_1DAC8ABD8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 136);
  v4 = *(_QWORD *)(v0 + 112);
  sub_1DACA2BFC();
  sub_1DACA2CB0();

  v3(v2, v4);
  v5 = *(_QWORD *)(v0 + 192);
  if (*(_QWORD *)(v5 + 16))
  {
    sub_1DAC7EFFC();
    swift_allocError();
    *(_QWORD *)v6 = v5;
    *(_QWORD *)(v6 + 8) = 0;
    *(_BYTE *)(v6 + 16) = 3;
    swift_willThrow();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

char *sub_1DAC8ACC4(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v2)
      return (char *)v3;
    v16 = MEMORY[0x1E0DEE9D8];
    result = sub_1DAC449B8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v16;
    v15 = v1 & 0xC000000000000001;
    v6 = v1;
    while (v2 != v5)
    {
      if (v15)
        v7 = (id)MEMORY[0x1DF0A5770](v5, v1);
      else
        v7 = *(id *)(v1 + 8 * v5 + 32);
      v8 = v7;
      v9 = sub_1DACA2CC8();
      v11 = v10;

      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_1DAC449B8((char *)(v12 > 1), v13 + 1, 1);
      ++v5;
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      v1 = v6;
      if (v2 == v5)
        return (char *)v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC8AE2C(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v6)
      break;
    v13 = MEMORY[0x1E0DEE9D8];
    result = sub_1DACA30AC();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x1DF0A5770](v8, a3);
      else
        v9 = *(id *)(a3 + 8 * v8 + 32);
      v10 = v9;
      v11 = v9;
      a1(&v12, &v11);

      if (v3)
        return swift_release();
      ++v8;
      sub_1DACA3094();
      sub_1DACA30B8();
      sub_1DACA30C4();
      sub_1DACA30A0();
      if (v6 == v8)
        return v13;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DAC8AF94()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8AFF8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  __int16 v33;
  _QWORD *v34;
  void (*v35)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v1 + 264);
  v3 = *(unsigned __int8 *)(v1 + 473);
  if (v2 <= 1)
    v2 = 1;
  *(_QWORD *)(v1 + 336) = v2;
  if (v3 == 1)
  {
    v4 = (void *)sub_1DAC47BC8(a1);
    *(_QWORD *)(v1 + 344) = v4;
    *(_QWORD *)(v1 + 56) = v1 + 224;
    *(_QWORD *)(v1 + 16) = v1;
    *(_QWORD *)(v1 + 24) = sub_1DAC8B5DC;
    v5 = swift_continuation_init();
    *(_QWORD *)(v1 + 144) = MEMORY[0x1E0C809B0];
    v6 = (_QWORD *)(v1 + 144);
    v6[1] = 0x40000000;
    v6[2] = sub_1DAC45110;
    v6[3] = &block_descriptor_12;
    v6[4] = v5;
    objc_msgSend(v4, sel_fetchLastClientStateWithCompletionHandler_, v6);
    return swift_continuation_await();
  }
  *(_QWORD *)(v1 + 360) = 0;
  *(_QWORD *)(v1 + 368) = 0xC000000000000000;
  swift_bridgeObjectRetain();
  v8 = sub_1DAC89C40();
  *(_QWORD *)(v1 + 376) = v9;
  if (!v9)
    goto LABEL_12;
  v10 = v8;
  v11 = v9;
  *(_QWORD *)(v1 + 384) = v8;
  if ((sub_1DAC72430(0, 0xC000000000000000, v8) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v19 = *(_QWORD *)(v1 + 304);
    v20 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    v21 = *(_QWORD *)(v1 + 288);
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v20(v19, v21);
    v22 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 432) = v22;
    *v22 = v1;
    v22[1] = sub_1DAC8BD08;
    return sub_1DAC8C7F8();
  }
  v12 = *(_QWORD *)(v1 + 304);
  v35 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
  v13 = *(_QWORD *)(v1 + 288);
  v14 = sub_1DAC72B88(*(uint64_t **)(v1 + 280), v10, v11);
  sub_1DACA2BFC();
  sub_1DACA304C();
  *(_QWORD *)(v1 + 240) = 0;
  *(_QWORD *)(v1 + 248) = 0xE000000000000000;
  sub_1DACA2DDC();
  swift_bridgeObjectRetain();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  *(_BYTE *)(v1 + 472) = v14;
  sub_1DACA30D0();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v35(v12, v13);
  if (v14 == 2)
  {
    v23 = *(_QWORD *)(v1 + 304);
    v24 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    v25 = *(_QWORD *)(v1 + 288);
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    v24(v23, v25);
    sub_1DACA2CC8();
    sub_1DACA2DDC();
    v26 = swift_bridgeObjectRelease();
    v27 = (void *)sub_1DAC47BC8(v26);
    *(_QWORD *)(v1 + 392) = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
    v28 = swift_allocObject();
    *(_OWORD *)(v28 + 16) = xmmword_1DACA8250;
    *(_QWORD *)(v28 + 32) = 0x6469754772657375;
    *(_QWORD *)(v28 + 40) = 0xEA00000000002E65;
    v29 = sub_1DACA2E30();
    *(_QWORD *)(v1 + 400) = v29;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v1 + 80) = v1;
    *(_QWORD *)(v1 + 88) = sub_1DAC8BB94;
    v30 = swift_continuation_init();
    *(_QWORD *)(v1 + 184) = MEMORY[0x1E0C809B0];
    v31 = (_QWORD *)(v1 + 184);
    v31[1] = 0x40000000;
    v31[2] = sub_1DAC8A5FC;
    v31[3] = &block_descriptor_11;
    v31[4] = v30;
    objc_msgSend(v27, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v29, v31);
    return swift_continuation_await();
  }
  if (v14 == 1)
  {
    v15 = *(_QWORD *)(v1 + 304);
    v16 = *(void (**)(uint64_t, uint64_t))(v1 + 312);
    v17 = *(_QWORD *)(v1 + 280);
    v18 = *(_QWORD *)(v1 + 288);
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    sub_1DAC33928(0, 0xC000000000000000);
    v16(v15, v18);
    sub_1DAC7F068(v17, type metadata accessor for UserGuideIndexItem);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
  else
  {
    v32 = *(_QWORD *)(v1 + 376);
    v33 = *(_WORD *)(v1 + 384);
    v34 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 416) = v34;
    *v34 = v1;
    v34[1] = sub_1DAC8BC78;
    return sub_1DAC8CFB8(*(_QWORD *)(v1 + 280), *(_QWORD *)(v1 + 336), v33, v32);
  }
}

uint64_t sub_1DAC8B5DC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 352) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC8B63C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  __int16 v27;
  _QWORD *v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 224);
  v2 = *(_QWORD *)(v0 + 232);

  *(_QWORD *)(v0 + 360) = v1;
  *(_QWORD *)(v0 + 368) = v2;
  swift_bridgeObjectRetain();
  v3 = sub_1DAC89C40();
  *(_QWORD *)(v0 + 376) = v4;
  if (!v4)
    goto LABEL_7;
  v5 = v3;
  v6 = v4;
  *(_QWORD *)(v0 + 384) = v3;
  if ((sub_1DAC72430(v1, v2, v3) & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    v13 = *(_QWORD *)(v0 + 304);
    v14 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    v15 = *(_QWORD *)(v0 + 288);
    sub_1DACA2BFC();
    sub_1DACA2C98();
    v14(v13, v15);
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 432) = v16;
    *v16 = v0;
    v16[1] = sub_1DAC8BD08;
    return sub_1DAC8C7F8();
  }
  v7 = *(_QWORD *)(v0 + 304);
  v30 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
  v29 = *(_QWORD *)(v0 + 288);
  v8 = sub_1DAC72B88(*(uint64_t **)(v0 + 280), v5, v6);
  sub_1DACA2BFC();
  sub_1DACA304C();
  *(_QWORD *)(v0 + 240) = 0;
  *(_QWORD *)(v0 + 248) = 0xE000000000000000;
  sub_1DACA2DDC();
  swift_bridgeObjectRetain();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  *(_BYTE *)(v0 + 472) = v8;
  sub_1DACA30D0();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v30(v7, v29);
  if (v8 == 2)
  {
    v17 = *(_QWORD *)(v0 + 304);
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    v19 = *(_QWORD *)(v0 + 288);
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    v18(v17, v19);
    sub_1DACA2CC8();
    sub_1DACA2DDC();
    v20 = swift_bridgeObjectRelease();
    v21 = (void *)sub_1DAC47BC8(v20);
    *(_QWORD *)(v0 + 392) = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36B8);
    v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = xmmword_1DACA8250;
    *(_QWORD *)(v22 + 32) = 0x6469754772657375;
    *(_QWORD *)(v22 + 40) = 0xEA00000000002E65;
    v23 = sub_1DACA2E30();
    *(_QWORD *)(v0 + 400) = v23;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_1DAC8BB94;
    v24 = swift_continuation_init();
    *(_QWORD *)(v0 + 184) = MEMORY[0x1E0C809B0];
    v25 = (_QWORD *)(v0 + 184);
    v25[1] = 0x40000000;
    v25[2] = sub_1DAC8A5FC;
    v25[3] = &block_descriptor_11;
    v25[4] = v24;
    objc_msgSend(v21, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v23, v25);
    return swift_continuation_await();
  }
  else if (v8 == 1)
  {
    v9 = *(_QWORD *)(v0 + 304);
    v31 = *(void (**)(uint64_t, uint64_t))(v0 + 312);
    v10 = *(_QWORD *)(v0 + 280);
    v11 = *(_QWORD *)(v0 + 288);
    swift_bridgeObjectRelease();
    sub_1DACA2BFC();
    sub_1DACA304C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2C98();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v1, v2);
    v31(v9, v11);
    sub_1DAC7F068(v10, type metadata accessor for UserGuideIndexItem);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v26 = *(_QWORD *)(v0 + 376);
    v27 = *(_WORD *)(v0 + 384);
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v28;
    *v28 = v0;
    v28[1] = sub_1DAC8BC78;
    return sub_1DAC8CFB8(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 336), v27, v26);
  }
}

uint64_t sub_1DAC8BB94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  *(_QWORD *)(*(_QWORD *)v0 + 408) = v1;
  if (v1)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC8BC04()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  __int16 v3;
  _QWORD *v4;

  v1 = *(void **)(v0 + 400);

  v2 = *(_QWORD *)(v0 + 376);
  v3 = *(_WORD *)(v0 + 384);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 416) = v4;
  *v4 = v0;
  v4[1] = sub_1DAC8BC78;
  return sub_1DAC8CFB8(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 336), v3, v2);
}

uint64_t sub_1DAC8BC78()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 424) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC8BD08()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 464) = v0;
  return swift_task_switch();
}

uint64_t sub_1DAC8BD70()
{
  uint64_t *v0;
  unint64_t v1;
  _QWORD *v2;

  v1 = sub_1DAC765A0(MEMORY[0x1E0DEE9D8]);
  v0[55] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[56] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1DAC8BDDC;
  return sub_1DAC8CFB8(v0[35], v0[42], 2, v1);
}

uint64_t sub_1DAC8BDDC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 456) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC8BE68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 280);
  sub_1DAC33928(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
  sub_1DAC7F068(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8BEC4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 464) = *(_QWORD *)(v0 + 456);
  return swift_task_switch();
}

uint64_t sub_1DAC8BF08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 280);
  sub_1DAC33928(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
  sub_1DAC7F068(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8BF64()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8BFA4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 344);
  v2 = *(_QWORD *)(v0 + 280);
  swift_willThrow();
  sub_1DAC7F068(v2, type metadata accessor for UserGuideIndexItem);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C00C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 400);
  v2 = *(void **)(v0 + 392);
  v3 = *(_QWORD *)(v0 + 360);
  v4 = *(_QWORD *)(v0 + 368);
  v5 = *(_QWORD *)(v0 + 280);
  swift_willThrow();
  sub_1DAC33928(v3, v4);
  sub_1DAC7F068(v5, type metadata accessor for UserGuideIndexItem);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C09C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 280);
  sub_1DAC33928(*(_QWORD *)(v0 + 360), *(_QWORD *)(v0 + 368));
  sub_1DAC7F068(v1, type metadata accessor for UserGuideIndexItem);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C0F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[29] = a1;
  v2[30] = v1;
  v3 = sub_1DACA2C14();
  v2[31] = v3;
  v2[32] = *(_QWORD *)(v3 - 8);
  v2[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8C158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = *(_QWORD *)(v0 + 240);
  *(_QWORD *)(v0 + 272) = *(_QWORD *)(v1 + 112);
  *(_QWORD *)(v0 + 280) = *(_QWORD *)(v1 + 120);
  swift_bridgeObjectRetain();
  sub_1DAC89C40();
  if (!v2)
    goto LABEL_9;
  v3 = sub_1DAC8ACC4(*(_QWORD *)(v0 + 232));
  v4 = swift_bridgeObjectRetain();
  v5 = sub_1DAC73714(v4);
  swift_bridgeObjectRelease();
  v6 = sub_1DAC90400((uint64_t)v5);
  swift_release();
  v7 = sub_1DAC8EAC0((uint64_t)v3, v6);
  v8 = swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v3;
  v9 = swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 288) = sub_1DAC906A4(v9, sub_1DAC90494, v8);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  v10 = MEMORY[0x1E0DEE9D8];
  sub_1DAC765A0(MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  v11 = sub_1DAC73630(v7);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v11[2];
  if (!v12)
  {
    swift_release();
    swift_release();
LABEL_9:
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  sub_1DAC449B8(0, v12, 0);
  v13 = v10;
  v14 = v11 + 5;
  do
  {
    swift_bridgeObjectRetain();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    v16 = *(_QWORD *)(v10 + 16);
    v15 = *(_QWORD *)(v10 + 24);
    if (v16 >= v15 >> 1)
      sub_1DAC449B8((char *)(v15 > 1), v16 + 1, 1);
    *(_QWORD *)(v10 + 16) = v16 + 1;
    v17 = v10 + 16 * v16;
    *(_QWORD *)(v17 + 32) = 0x6469754772657375;
    *(_QWORD *)(v17 + 40) = 0xEA00000000002E65;
    v14 += 2;
    --v12;
  }
  while (v12);
  v19 = *(_QWORD *)(v0 + 256);
  v18 = *(_QWORD *)(v0 + 264);
  v20 = *(_QWORD *)(v0 + 248);
  swift_release();
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  MEMORY[0x1DF0A5548](v13, MEMORY[0x1E0DEA968]);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  v22 = (void *)sub_1DAC47BC8(v21);
  *(_QWORD *)(v0 + 296) = v22;
  v23 = sub_1DACA2E30();
  *(_QWORD *)(v0 + 304) = v23;
  swift_release();
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_1DAC8C4E0;
  v24 = swift_continuation_init();
  *(_QWORD *)(v0 + 144) = MEMORY[0x1E0C809B0];
  *(_QWORD *)(v0 + 152) = 0x40000000;
  *(_QWORD *)(v0 + 160) = sub_1DAC8A5FC;
  *(_QWORD *)(v0 + 168) = &block_descriptor_4;
  *(_QWORD *)(v0 + 176) = v24;
  objc_msgSend(v22, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v23, v0 + 144);
  return swift_continuation_await();
}

uint64_t sub_1DAC8C4E0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 312) = v1;
  if (v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC8C550()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)(v0 + 304);
  v2 = *(_QWORD *)(v0 + 288);

  v4 = (void *)sub_1DAC47BC8(v3);
  objc_msgSend(v4, sel_beginIndexBatch);

  v6 = (void *)sub_1DAC47BC8(v5);
  *(_QWORD *)(v0 + 320) = v6;
  v7 = sub_1DAC8A294(2, v2, (uint64_t (*)(uint64_t, uint64_t))sub_1DAC72764);
  v9 = v8;
  v10 = sub_1DACA2938();
  *(_QWORD *)(v0 + 328) = v10;
  sub_1DAC33928(v7, v9);
  *(_QWORD *)(v0 + 80) = v0;
  *(_QWORD *)(v0 + 88) = sub_1DAC8C65C;
  v11 = swift_continuation_init();
  *(_QWORD *)(v0 + 184) = MEMORY[0x1E0C809B0];
  *(_QWORD *)(v0 + 192) = 0x40000000;
  *(_QWORD *)(v0 + 200) = sub_1DAC8A5FC;
  *(_QWORD *)(v0 + 208) = &block_descriptor_5;
  *(_QWORD *)(v0 + 216) = v11;
  objc_msgSend(v6, sel_endIndexBatchWithClientState_completionHandler_, v10, v0 + 184);
  return swift_continuation_await();
}

uint64_t sub_1DAC8C65C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  *(_QWORD *)(*(_QWORD *)v0 + 336) = v1;
  if (v1)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC8C6CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 288);
  v4 = *(_QWORD *)(v0 + 272);

  sub_1DAC8A008(v4, v2, 2, v3, (void (*)(void))sub_1DAC75F24);
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C750()
{
  uint64_t v0;
  void *v1;

  swift_willThrow();
  v1 = *(void **)(v0 + 304);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C7A4()
{
  uint64_t v0;
  void *v1;

  swift_willThrow();
  v1 = *(void **)(v0 + 328);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8C7F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[32] = v0;
  v2 = sub_1DACA2C14();
  v1[33] = v2;
  v1[34] = *(_QWORD *)(v2 - 8);
  v1[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8C858()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  v2 = v0[34];
  v1 = v0[35];
  v3 = v0[33];
  sub_1DACA2BFC();
  sub_1DACA2C98();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[36] = v4;
  v5 = v4(v1, v3);
  v0[37] = sub_1DAC47BC8(v5);
  return swift_task_switch();
}

uint64_t sub_1DAC8C8E0()
{
  uint64_t v0;
  _QWORD *v1;

  objc_msgSend(*(id *)(v0 + 296), sel_beginIndexBatch);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 304) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC8C950;
  v1[15] = *(_QWORD *)(v0 + 296);
  return swift_task_switch();
}

uint64_t sub_1DAC8C950()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8C9B4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[37];
  v2 = sub_1DACA2938();
  v0[40] = v2;
  v0[10] = v0;
  v0[11] = sub_1DAC8CA60;
  v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E0C809B0];
  v4 = v0 + 23;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_24;
  v4[4] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC8CA60()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 328) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_1DAC8CAC0()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void (*)(uint64_t, uint64_t))v0[36];
  v1 = (void *)v0[37];
  v3 = v0[35];
  v4 = v0[33];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1DACA3214();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  v2(v3, v4);
  v5 = sub_1DACA2938();
  v0[42] = v5;
  v0[2] = v0;
  v0[3] = sub_1DAC8CC30;
  v6 = swift_continuation_init();
  v0[18] = MEMORY[0x1E0C809B0];
  v0[19] = 0x40000000;
  v0[20] = sub_1DAC8A5FC;
  v0[21] = &block_descriptor_22;
  v0[22] = v6;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v5, v0 + 18);
  return swift_continuation_await();
}

uint64_t sub_1DAC8CC30()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 344) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC8CC90()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 296);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8CCD8()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[40];
  swift_willThrow();

  v0[44] = v0[41];
  return swift_task_switch();
}

uint64_t sub_1DAC8CD28()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8CD68()
{
  uint64_t v0;

  swift_willThrow();
  *(_QWORD *)(v0 + 352) = *(_QWORD *)(v0 + 312);
  return swift_task_switch();
}

uint64_t sub_1DAC8CDBC()
{
  _QWORD *v0;
  void *v1;
  void *v2;

  v1 = (void *)v0[42];
  v2 = (void *)v0[39];
  swift_willThrow();

  v0[44] = v0[43];
  return swift_task_switch();
}

uint64_t sub_1DAC8CE18(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_1DAC8CE30()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[15];
  v2 = sub_1DACA2E30();
  v0[16] = v2;
  v0[2] = v0;
  v0[3] = sub_1DAC8CEE4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_26;
  v4[4] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC8CEE4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC8CF44()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8CF78()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8CFB8(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  *(_QWORD *)(v5 + 72) = a4;
  *(_QWORD *)(v5 + 80) = v4;
  *(_WORD *)(v5 + 216) = a3;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = a2;
  v7 = *(_QWORD *)(type metadata accessor for UserGuideIndexItem(0) - 8);
  *(_QWORD *)(v5 + 88) = v7;
  *(_QWORD *)(v5 + 96) = *(_QWORD *)(v7 + 64);
  *(_QWORD *)(v5 + 104) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F8);
  *(_QWORD *)(v5 + 112) = swift_task_alloc();
  *(_QWORD *)(v5 + 120) = type metadata accessor for UserGuideIndexRequest(0);
  v8 = swift_task_alloc();
  *(_QWORD *)(v5 + 128) = v8;
  type metadata accessor for UserGuideIndexHelper();
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 136) = v9;
  *v9 = v5;
  v9[1] = sub_1DAC8D0A4;
  return sub_1DAC7A638(v8, a1);
}

uint64_t sub_1DAC8D0A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8D108()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v2 = *(_QWORD *)(v0 + 120);
  v1 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(uint64_t **)(v0 + 56);
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[4];
  v8 = v4[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1DAC84A8C(v7, v8, v5, v6, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v0 + 152) = v3;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DAC765A0(MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v1 + *(int *)(v2 + 20));
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_1DACA30E8();
    v11 = result;
    v13 = *(_QWORD *)(v0 + 64);
    if (v13)
    {
LABEL_3:
      v14 = sub_1DAC8E3BC(0, v11, v13, v10, v13);
      *(_QWORD *)(v0 + 160) = v14;
      v15 = *(_QWORD *)(v14 + 16);
      *(_QWORD *)(v0 + 168) = v15;
      if (!v15)
      {
        v30 = *(_QWORD *)(v0 + 152);
        v31 = *(_QWORD *)(v0 + 128);
        v32 = *(_QWORD *)(v0 + 80);
        swift_bridgeObjectRelease();
        sub_1DAC8A008(*(_QWORD *)(v32 + 112), *(_QWORD *)(v32 + 120), 2, v30, (void (*)(void))sub_1DAC75F24);
        sub_1DAC7F068(v31, type metadata accessor for UserGuideIndexRequest);
        swift_task_dealloc();
        swift_task_dealloc();
        swift_task_dealloc();
        return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(2, *(_QWORD *)(v0 + 152));
      }
      v34 = *(_QWORD *)(v0 + 88);
      v16 = sub_1DAC908A0();
      *(_QWORD *)(v0 + 176) = v16;
      *(_QWORD *)(v0 + 184) = 0;
      v17 = *(_QWORD *)(v0 + 104);
      v18 = *(_QWORD *)(v0 + 112);
      v19 = *(_QWORD *)(v0 + 80);
      v37 = *(_QWORD *)(v0 + 72);
      v38 = *(_QWORD *)(v0 + 152);
      v36 = *(_WORD *)(v0 + 216);
      v20 = *(_QWORD *)(v0 + 56);
      v35 = *(_QWORD *)(v14 + 32);
      v21 = sub_1DACA2EE4();
      v22 = *(_QWORD *)(v21 - 8);
      v23 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56);
      swift_bridgeObjectRetain();
      v23(v18, 1, 1, v21);
      sub_1DAC908EC(v20, v17);
      v24 = (*(unsigned __int8 *)(v34 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = v19;
      *(_QWORD *)(v25 + 24) = v16;
      *(_QWORD *)(v25 + 32) = v35;
      *(_QWORD *)(v25 + 40) = v19;
      *(_QWORD *)(v25 + 48) = v14;
      *(_WORD *)(v25 + 56) = 2;
      *(_QWORD *)(v25 + 64) = v38;
      *(_WORD *)(v25 + 72) = v36;
      *(_QWORD *)(v25 + 80) = v37;
      sub_1DAC90A14(v17, v25 + v24);
      LODWORD(v17) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 48))(v18, 1, v21);
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v26 = *(_QWORD *)(v0 + 112);
      if ((_DWORD)v17 == 1)
      {
        sub_1DAC7190C(*(_QWORD *)(v0 + 112), &qword_1EDAF35F8);
        if (*(_QWORD *)(v25 + 16))
          goto LABEL_6;
      }
      else
      {
        sub_1DACA2ED8();
        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v26, v21);
        if (*(_QWORD *)(v25 + 16))
        {
LABEL_6:
          swift_getObjectType();
          swift_unknownObjectRetain();
          v27 = sub_1DACA2E84();
          v29 = v28;
          swift_unknownObjectRelease();
          if (v29 | v27)
          {
            *(_QWORD *)(v0 + 16) = 0;
            *(_QWORD *)(v0 + 24) = 0;
            *(_QWORD *)(v0 + 32) = v27;
            *(_QWORD *)(v0 + 40) = v29;
          }
        }
      }
      *(_QWORD *)(v0 + 192) = swift_task_create();
      v33 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v33;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
      *v33 = v0;
      v33[1] = sub_1DAC8D530;
      return sub_1DACA2EF0();
    }
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v13 = *(_QWORD *)(v0 + 64);
    if (v13)
      goto LABEL_3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC8D530()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease_n();
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC8D5C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 168);
  swift_release();
  if (v1 + 1 == v2)
  {
    swift_bridgeObjectRelease();
    v3 = *(_QWORD *)(v0 + 152);
    v4 = *(_QWORD *)(v0 + 128);
    v5 = *(_QWORD *)(v0 + 80);
    swift_bridgeObjectRelease();
    sub_1DAC8A008(*(_QWORD *)(v5 + 112), *(_QWORD *)(v5 + 120), 2, v3, (void (*)(void))sub_1DAC75F24);
    sub_1DAC7F068(v4, type metadata accessor for UserGuideIndexRequest);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(2, *(_QWORD *)(v0 + 152));
  }
  v7 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 184) + 1;
  *(_QWORD *)(v0 + 184) = v8;
  v9 = *(_QWORD *)(v0 + 160);
  v28 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 104);
  v10 = *(_QWORD *)(v0 + 112);
  v12 = *(_QWORD *)(v0 + 88);
  v13 = *(_QWORD *)(v0 + 80);
  v26 = v7;
  v27 = *(_QWORD *)(v0 + 72);
  v25 = *(_WORD *)(v0 + 216);
  v14 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v9 + 8 * v8 + 32);
  v16 = sub_1DACA2EE4();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v17 + 56))(v10, 1, 1, v16);
  sub_1DAC908EC(v14, v11);
  v18 = (*(unsigned __int8 *)(v12 + 80) + 88) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = v13;
  *(_QWORD *)(v19 + 24) = v26;
  *(_QWORD *)(v19 + 32) = v15;
  *(_QWORD *)(v19 + 40) = v13;
  *(_QWORD *)(v19 + 48) = v9;
  *(_WORD *)(v19 + 56) = 2;
  *(_QWORD *)(v19 + 64) = v28;
  *(_WORD *)(v19 + 72) = v25;
  *(_QWORD *)(v19 + 80) = v27;
  sub_1DAC90A14(v11, v19 + v18);
  LODWORD(v15) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v10, 1, v16);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = *(_QWORD *)(v0 + 112);
  if ((_DWORD)v15 == 1)
  {
    sub_1DAC7190C(*(_QWORD *)(v0 + 112), &qword_1EDAF35F8);
    if (*(_QWORD *)(v19 + 16))
      goto LABEL_5;
  }
  else
  {
    sub_1DACA2ED8();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v20, v16);
    if (*(_QWORD *)(v19 + 16))
    {
LABEL_5:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v21 = sub_1DACA2E84();
      v23 = v22;
      swift_unknownObjectRelease();
      if (v23 | v21)
      {
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v21;
        *(_QWORD *)(v0 + 40) = v23;
      }
    }
  }
  *(_QWORD *)(v0 + 192) = swift_task_create();
  v24 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  *v24 = v0;
  v24[1] = sub_1DAC8D530;
  return sub_1DACA2EF0();
}

uint64_t sub_1DAC8D900()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8D950()
{
  uint64_t v0;

  sub_1DAC7F068(*(_QWORD *)(v0 + 128), type metadata accessor for UserGuideIndexRequest);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8D9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __int16 a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v8 + 56) = v12;
  *(_QWORD *)(v8 + 64) = v13;
  *(_WORD *)(v8 + 146) = v11;
  *(_WORD *)(v8 + 144) = a7;
  *(_QWORD *)(v8 + 40) = a6;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 24) = a4;
  *(_QWORD *)(v8 + 32) = a5;
  v9 = sub_1DACA2C14();
  *(_QWORD *)(v8 + 72) = v9;
  *(_QWORD *)(v8 + 80) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v8 + 88) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC8DA2C()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = v0[3];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = v0[10];
  v3 = v0[11];
  v5 = v0[9];
  v6 = v0[5];
  v0[2] = v2;
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v0[12] = sub_1DAC47BC8(v7);
  v8 = *(_QWORD *)(v6 + 16);
  if (v8
    && (v9 = v0[3],
        v10 = *(_QWORD *)(v0[5] + 8 * v8 + 24),
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRetain(),
        v11 = sub_1DAC8E620(v9, v10),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    v12 = 144;
    v13 = 6;
  }
  else
  {
    v12 = 146;
    v13 = 7;
  }
  v14 = sub_1DAC8A294(*(unsigned __int16 *)((char *)v0 + v12), v0[v13], (uint64_t (*)(uint64_t, uint64_t))sub_1DAC72764);
  v16 = v15;
  v17 = v0[8];
  v18 = v0[3];
  v0[13] = v15;
  v0[14] = v14;
  v19 = swift_task_alloc();
  v0[15] = v19;
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = v17;
  v20 = (_QWORD *)swift_task_alloc();
  v0[16] = v20;
  *v20 = v0;
  v20[1] = sub_1DAC8DC4C;
  return sub_1DAC88C64(v14, v16, (uint64_t)&unk_1F028C1F8, v19);
}

uint64_t sub_1DAC8DC4C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v4;

  v2 = *v1;
  *(_QWORD *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = *(void **)(v2 + 96);
  sub_1DAC33928(*(_QWORD *)(v2 + 112), *(_QWORD *)(v2 + 104));

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC8DCEC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 96);
  sub_1DAC33928(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 104));

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8DD44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = a3;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_1DAC8DD60()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[17];
  v2 = v0[18];
  v3 = (void *)v0[16];
  v4 = swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v2;
  sub_1DAC8AE2C((void (*)(uint64_t *__return_ptr, id *))sub_1DAC90B90, v4, v1);
  swift_task_dealloc();
  sub_1DAC3757C(0, (unint64_t *)&qword_1EDAF2FB8);
  v5 = sub_1DACA2E30();
  v0[19] = v5;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[3] = sub_1DAC8DE7C;
  v6 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v7 = v0 + 10;
  v7[1] = 0x40000000;
  v7[2] = sub_1DAC8A5FC;
  v7[3] = &block_descriptor_20;
  v7[4] = v6;
  objc_msgSend(v3, sel_indexSearchableItems_completionHandler_, v5, v7);
  return swift_continuation_await();
}

uint64_t sub_1DAC8DE7C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC8DEDC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC8DF10()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 152);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1DAC8DF50@<X0>(void **a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v19;
  _QWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v20 = a3;
  v19 = sub_1DACA26D4();
  v5 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v10 = *(_QWORD *)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  v11 = objc_msgSend(v8, sel_uniqueIdentifier);
  v12 = sub_1DACA2D94();
  v14 = v13;

  v15 = objc_msgSend(v8, sel_attributeSet);
  *(_QWORD *)&v24 = v12;
  *((_QWORD *)&v24 + 1) = v14;
  *(_QWORD *)&v25 = v15;
  *((_QWORD *)&v25 + 1) = v10;
  v26 = v9;
  swift_bridgeObjectRetain();
  v16 = objc_msgSend(v8, (SEL)&selRef_supportsUserGuide);
  sub_1DAC87E40((uint64_t)v7);
  sub_1DACA2F8C();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  v17 = objc_msgSend(v8, (SEL)&selRef_supportsUserGuide);
  v21 = v24;
  v22 = v25;
  v23 = v26;
  sub_1DAC71790();
  sub_1DACA2F80();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  *v20 = v8;
  return v8;
}

uint64_t sub_1DAC8E0F4(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DAC8E120(a1, a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1DAC7380C, (unint64_t *)&qword_1EDAF3630, 0x1E0DBF408);
}

uint64_t sub_1DAC8E120(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, unint64_t *, uint64_t, uint64_t), unint64_t *a6, uint64_t a7)
{
  uint64_t (*v7)(uint64_t, unint64_t *, uint64_t, uint64_t);
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;

  v13 = a1 + a3;
  if (__OFADD__(a1, a3))
  {
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    v25 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v25 < v13)
      v13 = v25;
    if (v13 < v8)
      goto LABEL_39;
    swift_bridgeObjectRetain();
    v26 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v26 >= v8)
      goto LABEL_7;
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v10 = a7;
  v11 = a6;
  v7 = a5;
  v9 = a2;
  v8 = a1;
  v12 = a2 >> 62;
  if (a2 >> 62)
    goto LABEL_31;
  v14 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v14 < v13)
    v13 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v13 < a1)
    goto LABEL_39;
  if (v14 < a1)
    goto LABEL_35;
LABEL_7:
  if (v8 < 0)
  {
LABEL_36:
    __break(1u);
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  if (v12)
  {
    swift_bridgeObjectRetain();
    v15 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v15 < v13)
    goto LABEL_37;
  if (v13 < 0)
  {
LABEL_38:
    __break(1u);
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  if ((v9 & 0xC000000000000001) != 0 && v13 != v8)
  {
    if (v13 > (unint64_t)v8)
    {
      sub_1DAC3757C(0, v11);
      v16 = v8;
      do
      {
        v17 = v16 + 1;
        sub_1DACA3064();
        v16 = v17;
      }
      while (v13 != v17);
      goto LABEL_18;
    }
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
LABEL_18:
  if (v12)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1DACA30F4();
    v11 = v18;
    v8 = v19;
    v13 = v20;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      goto LABEL_23;
LABEL_22:
    v21 = v7(v10, v11, v8, v13);
    goto LABEL_29;
  }
  v10 = v9 & 0xFFFFFFFFFFFFFF8;
  v11 = (unint64_t *)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
  v13 = (2 * v13) | 1;
  swift_bridgeObjectRetain();
  if ((v13 & 1) == 0)
    goto LABEL_22;
LABEL_23:
  sub_1DACA31CC();
  swift_unknownObjectRetain_n();
  v22 = swift_dynamicCastClass();
  if (!v22)
  {
    swift_unknownObjectRelease();
    v22 = MEMORY[0x1E0DEE9D8];
  }
  v23 = *(_QWORD *)(v22 + 16);
  swift_release();
  if (__OFSUB__((unint64_t)v13 >> 1, v8))
    goto LABEL_41;
  if (v23 != ((unint64_t)v13 >> 1) - v8)
  {
LABEL_42:
    swift_unknownObjectRelease();
    goto LABEL_22;
  }
  v21 = swift_dynamicCastClass();
  if (!v21)
  {
    swift_unknownObjectRelease();
    v21 = MEMORY[0x1E0DEE9D8];
  }
LABEL_29:
  swift_unknownObjectRelease();
  return v21;
}

uint64_t sub_1DAC8E3BC(uint64_t a1, int64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  _BYTE v30[8];
  _BYTE v31[8];
  uint64_t v32;

  v6 = v5;
  v9 = a1;
  v10 = 0;
  v11 = a1;
  while (1)
  {
    v12 = v11 <= a2;
    if (a3 > 0)
      v12 = v11 >= a2;
    if (v12)
      break;
    v13 = __OFADD__(v11, a3);
    v11 += a3;
    if (v13)
      v11 = (v11 >> 63) ^ 0x8000000000000000;
    v13 = __OFADD__(v10++, 1);
    if (v13)
    {
      __break(1u);
      break;
    }
  }
  v32 = MEMORY[0x1E0DEE9D8];
  result = (uint64_t)sub_1DAC9C64C(0, v10, 0);
  v15 = v32;
  if (v10)
  {
    while (1)
    {
      v16 = v9 <= a2;
      if (a3 > 0)
        v16 = v9 >= a2;
      if (v16)
        break;
      if (__OFADD__(v9, a3))
        v17 = ((v9 + a3) >> 63) ^ 0x8000000000000000;
      else
        v17 = v9 + a3;
      result = sub_1DAC8E120(v9, a4, a5, (uint64_t)v31, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1DAC737F8, (unint64_t *)&qword_1EDAF2FB8, 0x1E0CA6B48);
      if (v6)
        goto LABEL_37;
      v18 = result;
      v6 = 0;
      v32 = v15;
      v20 = *(_QWORD *)(v15 + 16);
      v19 = *(_QWORD *)(v15 + 24);
      if (v20 >= v19 >> 1)
      {
        result = (uint64_t)sub_1DAC9C64C((_QWORD *)(v19 > 1), v20 + 1, 1);
        v15 = v32;
      }
      *(_QWORD *)(v15 + 16) = v20 + 1;
      *(_QWORD *)(v15 + 8 * v20 + 32) = v18;
      v9 = v17;
      if (!--v10)
        goto LABEL_23;
    }
    __break(1u);
  }
  else
  {
    v17 = v9;
LABEL_23:
    v21 = v17 <= a2;
    if (a3 > 0)
      v21 = v17 >= a2;
    if (v21)
    {
LABEL_26:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        v22 = __OFADD__(v17, a3) ? ((v17 + a3) >> 63) ^ 0x8000000000000000 : v17 + a3;
        v23 = sub_1DAC8E120(v17, a4, a5, (uint64_t)v30, (uint64_t (*)(uint64_t, unint64_t *, uint64_t, uint64_t))sub_1DAC737F8, (unint64_t *)&qword_1EDAF2FB8, 0x1E0CA6B48);
        if (v6)
          break;
        v24 = v23;
        v6 = 0;
        v32 = v15;
        v26 = *(_QWORD *)(v15 + 16);
        v25 = *(_QWORD *)(v15 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_1DAC9C64C((_QWORD *)(v25 > 1), v26 + 1, 1);
          v15 = v32;
        }
        *(_QWORD *)(v15 + 16) = v26 + 1;
        *(_QWORD *)(v15 + 8 * v26 + 32) = v24;
        v27 = v22 <= a2;
        if (a3 > 0)
          v27 = v22 >= a2;
        v17 = v22;
        if (v27)
          goto LABEL_26;
      }
LABEL_37:
      swift_bridgeObjectRelease();
      swift_release();
    }
    return v15;
  }
  return result;
}

id sub_1DAC8E620(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_1DACA30E8();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x1DF0A5770](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x1DF0A5770](0, v2);
LABEL_21:
    v14 = v13;
    sub_1DAC3757C(0, (unint64_t *)&qword_1EDAF2FB8);
    v15 = sub_1DACA2FC8();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x1DF0A5770](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x1DF0A5770](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_1DACA2FC8();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_1DACA2FC8();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC8E914(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1DACA3250();
  swift_bridgeObjectRetain();
  sub_1DACA2DD0();
  v8 = sub_1DACA3274();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1DACA31B4() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1DACA31B4() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1DAC8FCC0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1DAC8EAC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t isStackAllocationSafe;
  char v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v26 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v25[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_1DACA3250();
      swift_bridgeObjectRetain();
      sub_1DACA2DD0();
      v9 = sub_1DACA3274();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1DACA31B4() & 1) != 0)
        {
          isStackAllocationSafe = swift_bridgeObjectRelease();
          v27 = v5;
LABEL_19:
          v19 = *(_BYTE *)(v2 + 32);
          v20 = (unint64_t)((1 << v19) + 63) >> 6;
          v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
          {
            MEMORY[0x1E0C80A78](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            v22 = sub_1DAC8F510((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            v22 = sub_1DAC8F510((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1DF0A6190](v23, -1, -1);
          }
          return v22;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1DACA31B4() & 1) != 0)
          {
            v27 = v5;
            isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1DAC8EDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_1DAC75BE8();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1DACA3250();
      swift_bridgeObjectRetain();
      sub_1DACA2DD0();
      v19 = sub_1DACA3274();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1DACA31B4() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1DACA31B4() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_1DAC8F738((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1DAC75BE8();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_1DAC8F738((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1DAC75BE8();
      MEMORY[0x1DF0A6190](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1DAC8F234()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FC8);
  v3 = sub_1DACA3034();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1DACA3250();
      sub_1DACA2DD0();
      result = sub_1DACA3274();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1DAC8F510(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1DAC8FA2C(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_29;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    v14 = sub_1DACA3274();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_4;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1DACA31B4() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1DACA31B4() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    result = swift_bridgeObjectRelease();
LABEL_15:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_30;
      --v31;
      if (!v23)
        return MEMORY[0x1E0DEE9E8];
    }
LABEL_5:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DAC8F738(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  int64_t v36;
  uint64_t v38;
  unint64_t *v39;
  uint64_t v40;

  v7 = *(_QWORD *)(a3 + 16);
  v39 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v40 = a3 + 56;
  while (2)
  {
    v38 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
          goto LABEL_16;
        }
        v13 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_47;
        }
        v14 = (unint64_t)(a5[2] + 64) >> 6;
        v15 = a5[3];
        if (v13 >= v14)
          goto LABEL_45;
        v16 = a5[1];
        v17 = *(_QWORD *)(v16 + 8 * v13);
        if (!v17)
        {
          v18 = v9 + 2;
          v15 = v9 + 1;
          if (v9 + 2 >= v14)
            goto LABEL_45;
          v17 = *(_QWORD *)(v16 + 8 * v18);
          if (!v17)
          {
            v15 = v9 + 2;
            if (v9 + 3 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
            if (v17)
            {
              v13 = v9 + 3;
              goto LABEL_15;
            }
            v18 = v9 + 4;
            v15 = v9 + 3;
            if (v9 + 4 >= v14)
              goto LABEL_45;
            v17 = *(_QWORD *)(v16 + 8 * v18);
            if (!v17)
            {
              v13 = v9 + 5;
              v15 = v9 + 4;
              if (v9 + 5 >= v14)
                goto LABEL_45;
              v17 = *(_QWORD *)(v16 + 8 * v13);
              if (!v17)
              {
                v15 = v14 - 1;
                v36 = v9 + 6;
                while (v14 != v36)
                {
                  v17 = *(_QWORD *)(v16 + 8 * v36++);
                  if (v17)
                  {
                    v13 = v36 - 1;
                    goto LABEL_15;
                  }
                }
LABEL_45:
                a5[3] = v15;
                a5[4] = 0;
                swift_retain();
                return sub_1DAC8FA2C(v39, a2, v38, a3);
              }
              goto LABEL_15;
            }
          }
          v13 = v18;
        }
LABEL_15:
        v11 = (v17 - 1) & v17;
        v12 = __clz(__rbit64(v17)) + (v13 << 6);
        v9 = v13;
LABEL_16:
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v22 = sub_1DACA3274();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v40 + 8 * (v24 >> 6))) == 0)
          goto LABEL_3;
        v27 = *(_QWORD *)(a3 + 48);
        v28 = (_QWORD *)(v27 + 16 * v24);
        v29 = *v28 == v21 && v28[1] == v20;
        if (v29 || (sub_1DACA31B4() & 1) != 0)
          break;
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v40 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1DACA31B4() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_23;
          }
        }
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      result = swift_bridgeObjectRelease();
LABEL_23:
      v30 = v39[v25];
      v39[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v38 - 1;
    if (__OFSUB__(v38, 1))
    {
LABEL_47:
      __break(1u);
      return result;
    }
    if (v38 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1DAC8FA2C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;

  v4 = a4;
  if (!a3)
  {
    v8 = MEMORY[0x1E0DEE9E8];
LABEL_36:
    swift_release();
    return v8;
  }
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
    return v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FC8);
  result = sub_1DACA3040();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
      goto LABEL_39;
    if (v14 >= v30)
      goto LABEL_36;
    v15 = a1[v14];
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v30)
        goto LABEL_36;
      v15 = a1[v10];
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v30)
          goto LABEL_36;
        v15 = a1[v10];
        if (!v15)
          break;
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v18 = *v17;
    v19 = v17[1];
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v20 = -1 << *(_BYTE *)(v8 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6))) != 0)
    {
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v11 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v11 + 8 * v22);
      }
      while (v27 == -1);
      v23 = __clz(__rbit64(~v27)) + (v22 << 6);
    }
    *(_QWORD *)(v11 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (!v5)
      goto LABEL_36;
  }
  v16 = v14 + 3;
  if (v16 >= v30)
    goto LABEL_36;
  v15 = a1[v16];
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v30)
      goto LABEL_36;
    v15 = a1[v10];
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_1DAC8FCC0(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1DAC8F234();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1DAC8FE58();
      goto LABEL_22;
    }
    sub_1DAC90008();
  }
  v11 = *v4;
  sub_1DACA3250();
  sub_1DACA2DD0();
  result = sub_1DACA3274();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1DACA31B4(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1DACA31FC();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1DACA31B4();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_1DAC8FE58()
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
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FC8);
  v2 = *v0;
  v3 = sub_1DACA3028();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
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
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DAC90008()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FC8);
  v3 = sub_1DACA3034();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
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
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

void (*sub_1DAC902B4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1DAC90334(v6, a2, a3);
  return sub_1DAC90308;
}

void sub_1DAC90308(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1DAC90334(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1DF0A5770](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1DAC903A0;
  }
  __break(1u);
  return result;
}

void sub_1DAC903A0(id *a1)
{

}

id sub_1DAC903A8(id result, uint64_t a2, char a3)
{
  if (a3 == 3 || a3 == 2)
    return (id)swift_bridgeObjectRetain();
  if (a3 == 1)
    return result;
  return result;
}

void sub_1DAC903D4(void *a1, uint64_t a2, char a3)
{
  if (a3 == 3 || a3 == 2)
  {
    swift_bridgeObjectRelease();
  }
  else if (a3 == 1)
  {

  }
}

uint64_t sub_1DAC90400(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_1DACA2F20();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_1DAC8E914(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_1DAC90494(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1DAC72C48(a1, a2, a3, a4, *(_QWORD **)(v4 + 16));
}

uint64_t sub_1DAC9049C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v23 = (unint64_t *)result;
  v24 = 0;
  v6 = 0;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v26 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_5;
    }
    v18 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v18 >= v26)
      return sub_1DAC9CA48(v23, a2, v24, a3);
    v19 = *(_QWORD *)(v25 + 8 * v18);
    ++v6;
    if (!v19)
    {
      v6 = v18 + 1;
      if (v18 + 1 >= v26)
        return sub_1DAC9CA48(v23, a2, v24, a3);
      v19 = *(_QWORD *)(v25 + 8 * v6);
      if (!v19)
      {
        v6 = v18 + 2;
        if (v18 + 2 >= v26)
          return sub_1DAC9CA48(v23, a2, v24, a3);
        v19 = *(_QWORD *)(v25 + 8 * v6);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v9 = (v19 - 1) & v19;
    v11 = __clz(__rbit64(v19)) + (v6 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    v15 = (uint64_t *)(*(_QWORD *)(a3 + 56) + 16 * v11);
    v17 = *v15;
    v16 = v15[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    LOBYTE(v17) = a4(v13, v14, v17, v16);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
    {
      *(unint64_t *)((char *)v23 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v24++, 1))
      {
        __break(1u);
        return sub_1DAC9CA48(v23, a2, v24, a3);
      }
    }
  }
  v20 = v18 + 3;
  if (v20 >= v26)
    return sub_1DAC9CA48(v23, a2, v24, a3);
  v19 = *(_QWORD *)(v25 + 8 * v20);
  if (v19)
  {
    v6 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v6 >= v26)
      return sub_1DAC9CA48(v23, a2, v24, a3);
    v19 = *(_QWORD *)(v25 + 8 * v6);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1DAC906A4(uint64_t isStackAllocationSafe, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  char v7;
  unint64_t v8;
  size_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[2];

  v6 = isStackAllocationSafe;
  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = *(_BYTE *)(isStackAllocationSafe + 32);
  v8 = (unint64_t)((1 << v7) + 63) >> 6;
  v9 = 8 * v8;
  if ((v7 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v9);
    v10 = sub_1DAC9049C((uint64_t)v13 - ((v9 + 15) & 0x3FFFFFFFFFFFFFF0), v8, v6, a2);
    if (v3)
      swift_willThrow();
    else
      return v10;
  }
  else
  {
    v11 = (void *)swift_slowAlloc();
    bzero(v11, v9);
    a3 = sub_1DAC9049C((uint64_t)v11, v8, v6, a2);
    MEMORY[0x1DF0A6190](v11, -1, -1);
  }
  return a3;
}

unint64_t sub_1DAC90814()
{
  unint64_t result;

  result = qword_1EDAF2F10;
  if (!qword_1EDAF2F10)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA888C, &type metadata for ClientStateMetaData);
    atomic_store(result, (unint64_t *)&qword_1EDAF2F10);
  }
  return result;
}

uint64_t sub_1DAC90858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1DAC908A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDAF38A8;
  if (!qword_1EDAF38A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAF3190);
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8810, v1);
    atomic_store(result, (unint64_t *)&qword_1EDAF38A8);
  }
  return result;
}

uint64_t sub_1DAC908EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAC90930()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for UserGuideIndexItem(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 88) & ~v2;
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v0 + v3 + *(int *)(v1 + 40);
  v5 = sub_1DACA28E4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_1DAC90A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UserGuideIndexItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAC90A58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  _QWORD *v9;
  uint64_t v11;

  type metadata accessor for UserGuideIndexItem(0);
  v3 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = *(_QWORD *)(v1 + 40);
  v7 = *(_QWORD *)(v1 + 48);
  v11 = *(_QWORD *)(v1 + 64);
  v8 = *(_WORD *)(v1 + 56);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1DAC483D0;
  return sub_1DAC8D9B0(a1, v3, v4, v5, v6, v7, v8, v11);
}

uint64_t sub_1DAC90B28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 v5;

  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v1 + 16);
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1DAC6F4A4;
  *(_OWORD *)(v4 + 136) = v5;
  *(_QWORD *)(v4 + 128) = a1;
  return swift_task_switch();
}

id sub_1DAC90B90@<X0>(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_1DAC8DF50(a1, *(_QWORD *)(v2 + 16), a2);
}

unint64_t sub_1DAC90BAC()
{
  unint64_t result;

  result = qword_1EDAF2EE8;
  if (!qword_1EDAF2EE8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8568, &type metadata for TipsClientState);
    atomic_store(result, (unint64_t *)&qword_1EDAF2EE8);
  }
  return result;
}

unint64_t sub_1DAC90BF0()
{
  unint64_t result;

  result = qword_1EDAF2EF0;
  if (!qword_1EDAF2EF0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8540, &type metadata for TipsClientState);
    atomic_store(result, (unint64_t *)&qword_1EDAF2EF0);
  }
  return result;
}

void destroy for UserGuideItemIndexingError(uint64_t a1)
{
  sub_1DAC903D4(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s10TipsDaemon26UserGuideItemIndexingErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1DAC903A8(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UserGuideItemIndexingError(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1DAC903A8(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1DAC903D4(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for UserGuideItemIndexingError(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1DAC903D4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserGuideItemIndexingError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UserGuideItemIndexingError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 252;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DAC90DC8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 3u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_1DAC90DE0(uint64_t result, unsigned int a2)
{
  if (a2 >= 4)
  {
    *(_QWORD *)result = a2 - 4;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UserGuideItemIndexingError()
{
  return &type metadata for UserGuideItemIndexingError;
}

uint64_t sub_1DAC90E0C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (*v22)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *);
  __int128 v23;
  __int128 v24;

  v22 = *(void (**)(uint64_t, uint64_t, __int128 *, void *, unint64_t, uint64_t, uint64_t, uint64_t, void *))(a1 + 32);
  if (a2)
  {
    v12 = sub_1DACA2D94();
    v14 = v13;
    if (a3)
    {
LABEL_3:
      *((_QWORD *)&v24 + 1) = swift_getObjectType();
      *(_QWORD *)&v23 = a3;
      goto LABEL_6;
    }
  }
  else
  {
    v12 = 0;
    v14 = 0;
    if (a3)
      goto LABEL_3;
  }
  v23 = 0u;
  v24 = 0u;
LABEL_6:
  swift_retain();
  swift_unknownObjectRetain();
  if (!a4)
  {
    v17 = 0xF000000000000000;
    if (a6)
      goto LABEL_8;
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v15 = a4;
  a4 = (void *)sub_1DACA2944();
  v17 = v16;

  if (!a6)
    goto LABEL_10;
LABEL_8:
  v18 = sub_1DACA2D94();
  a6 = v19;
LABEL_11:
  v20 = a7;
  v22(v12, v14, &v23, a4, v17, a5, v18, a6, a7);

  swift_bridgeObjectRelease();
  sub_1DAC3396C((uint64_t)a4, v17);
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1DAC7190C((uint64_t)&v23, &qword_1EDAF36F0);
}

uint64_t sub_1DAC90FD0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_1DAC9108C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC911D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  return sub_1DAC77494(v3, a1, &qword_1EDAF3010);
}

uint64_t sub_1DAC9132C(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAC77494(a1, (uint64_t)v6, &qword_1EDAF3010);
  v7 = *a2 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  sub_1DAC91DF0((uint64_t)v6, v7);
  return swift_endAccess();
}

id AssetsDownloadOperation.__allocating_init(_:assetURLPath:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  objc_super v15;

  v9 = (char *)objc_allocWithZone(v4);
  v10 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL];
  v11 = sub_1DACA28E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  *(_DWORD *)&v9[OBJC_IVAR___TPSAssetsDownloadOperation_priority] = *MEMORY[0x1E0CB3338];
  *(_QWORD *)&v9[OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem] = 0;
  v12 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;
  v13 = &v9[OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath];
  *(_QWORD *)v13 = a3;
  *((_QWORD *)v13 + 1) = a4;
  v15.receiver = v9;
  v15.super_class = v4;
  return objc_msgSendSuper2(&v15, sel_init);
}

id AssetsDownloadOperation.init(_:assetURLPath:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  objc_super v14;

  v9 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL];
  v10 = sub_1DACA28E4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *(_DWORD *)&v4[OBJC_IVAR___TPSAssetsDownloadOperation_priority] = *MEMORY[0x1E0CB3338];
  *(_QWORD *)&v4[OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem] = 0;
  v11 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier];
  *(_QWORD *)v11 = a1;
  *((_QWORD *)v11 + 1) = a2;
  v12 = &v4[OBJC_IVAR___TPSAssetsDownloadOperation_assetURLPath];
  *(_QWORD *)v12 = a3;
  *((_QWORD *)v12 + 1) = a4;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return objc_msgSendSuper2(&v14, sel_init);
}

uint64_t type metadata accessor for AssetsDownloadOperation()
{
  uint64_t result;

  result = qword_1F028C258;
  if (!qword_1F028C258)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DAC916B0()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  _QWORD aBlock[6];

  sub_1DAC78A1C();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  if (v1)
  {
    v2 = v1;
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v4 = (void *)sub_1DACA2D88();
    swift_bridgeObjectRelease();
    v5 = *(_DWORD *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_priority);
    v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_1DAC91AE8;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1DAC90E0C;
    aBlock[3] = &block_descriptor_5;
    v7 = _Block_copy(aBlock);
    swift_release();
    LODWORD(v8) = v5;
    v9 = objc_msgSend(v2, sel_formattedDataForPath_identifier_attributionIdentifier_priority_completionHandler_, v3, v4, 0, v7, v8);
    _Block_release(v7);

    v10 = *(void **)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem);
    *(_QWORD *)(v0 + OBJC_IVAR___TPSAssetsDownloadOperation_urlSessionItem) = v9;

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1DAC9185C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DAC91880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void (*v24)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v25;
  void *v26;
  _BYTE v28[24];
  uint64_t v29;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = &v28[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x1E0C80A78](v12);
  v16 = &v28[-v15 - 8];
  v17 = sub_1DACA28E4();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = &v28[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_beginAccess();
  v21 = MEMORY[0x1DF0A6220](a10 + 16);
  if (v21)
  {
    v22 = (void *)v21;
    sub_1DAC77494(a3, (uint64_t)v28, &qword_1EDAF36F0);
    if (v29)
    {
      v23 = swift_dynamicCast();
      v24 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v18 + 56);
      v24(v16, v23 ^ 1u, 1, v17);
      if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) != 1)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 32))(v20, v16, v17);
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v18 + 16))(v14, v20, v17);
        v24(v14, 0, 1, v17);
        v25 = (uint64_t)v22 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
        swift_beginAccess();
        sub_1DAC91DF0((uint64_t)v14, v25);
        swift_endAccess();
        objc_msgSend(v22, sel_finishWithError_, 0);

        (*(void (**)(_BYTE *, uint64_t))(v18 + 8))(v20, v17);
        return;
      }
    }
    else
    {
      sub_1DAC7190C((uint64_t)v28, &qword_1EDAF36F0);
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
    }
    v26 = a9;
    sub_1DAC7190C((uint64_t)v16, &qword_1EDAF3010);
    if (a9)
      v26 = (void *)sub_1DACA2818();
    objc_msgSend(v22, sel_finishWithError_, v26);

  }
}

void sub_1DAC91AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  uint64_t v9;

  sub_1DAC91880(a1, a2, a3, a4, a5, a6, a7, a8, a9, v9);
}

id AssetsDownloadOperation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AssetsDownloadOperation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AssetsDownloadOperation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssetsDownloadOperation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DAC91BEC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TPSAssetsDownloadOperation_assetIdentifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DAC91C44@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR___TPSAssetsDownloadOperation_downloadedURL;
  swift_beginAccess();
  return sub_1DAC77494(v3, a2, &qword_1EDAF3010);
}

uint64_t sub_1DAC91D0C()
{
  return type metadata accessor for AssetsDownloadOperation();
}

void sub_1DAC91D14()
{
  unint64_t v0;

  sub_1DAC7F850();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for AssetsDownloadOperation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AssetsDownloadOperation.assetIdentifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of AssetsDownloadOperation.downloadedURL.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AssetsDownloadOperation.__allocating_init(_:assetURLPath:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t sub_1DAC91DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3010);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAC91E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DACA2EE4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DACA2ED8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DAC6F310(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DACA2E84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

BOOL SearchItemIndexer.IndexItemType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

void *static SearchItemIndexer.IndexItemType.allCases.getter()
{
  return &unk_1EA1E17D0;
}

void sub_1DAC91FAC(_QWORD *a1@<X8>)
{
  *a1 = &unk_1EA1E1800;
}

uint64_t sub_1DAC91FBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer;
  if (*(_QWORD *)(v0 + OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR___TPSSearchItemIndexer_name);
    v3 = *(_QWORD *)(v0 + OBJC_IVAR___TPSSearchItemIndexer_name + 8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3198);
    v2 = swift_allocObject();
    swift_bridgeObjectRetain();
    swift_defaultActor_initialize();
    *(_QWORD *)(v2 + 136) = 0;
    *(_QWORD *)(v2 + 112) = v4;
    *(_QWORD *)(v2 + 120) = v3;
    *(_BYTE *)(v2 + 128) = 0;
    *(_QWORD *)(v0 + v1) = v2;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v2;
}

id sub_1DAC92068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id result;

  sub_1DAC450D4();
  v0 = sub_1DACA2FB0();
  v2 = v1;
  v3 = objc_allocWithZone((Class)type metadata accessor for SearchItemIndexer());
  result = SearchItemIndexer.init(name:)(v0, v2);
  qword_1EDAF3038 = (uint64_t)result;
  return result;
}

id SearchItemIndexer.__allocating_init(name:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return SearchItemIndexer.init(name:)(a1, a2);
}

id static SearchItemIndexer.default.getter()
{
  if (qword_1EDAF3040 != -1)
    swift_once();
  return (id)qword_1EDAF3038;
}

id SearchItemIndexer.init(name:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v7;
  id v8;
  char *v9;
  id v10;
  void *v11;
  char *v12;
  objc_super v14;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  v7 = OBJC_IVAR___TPSSearchItemIndexer_queue;
  v8 = objc_allocWithZone(MEMORY[0x1E0CB3828]);
  v9 = v3;
  v10 = objc_msgSend(v8, sel_init);
  v11 = (void *)sub_1DACA2D88();
  objc_msgSend(v10, sel_setName_, v11);

  objc_msgSend(v10, sel_setMaxConcurrentOperationCount_, 1);
  *(_QWORD *)&v3[v7] = v10;
  *(_QWORD *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___legacyIndexer] = 0;
  *(_QWORD *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer] = 0;
  *(_QWORD *)&v9[OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer] = 0;
  v12 = &v9[OBJC_IVAR___TPSSearchItemIndexer_name];
  *(_QWORD *)v12 = a1;
  *((_QWORD *)v12 + 1) = a2;

  v14.receiver = v9;
  v14.super_class = ObjectType;
  return objc_msgSendSuper2(&v14, sel_init);
}

id SearchItemIndexer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SearchItemIndexer.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchItemIndexer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void SearchItemIndexer.deleteAllItems(ofTypes:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  id v16;

  v8 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EDAF3198);
  v9 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EDAF3190);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v8;
  v10[4] = v9;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = v4;
  v11[4] = 0xD000000000000027;
  v11[5] = 0x80000001DACAF1F0;
  v11[6] = &unk_1F028C2A8;
  v11[7] = v10;
  v12 = objc_allocWithZone((Class)sub_1DACA2C80());
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v13 = v4;
  swift_retain();
  v16 = (id)sub_1DACA2C74();
  v14 = (void *)sub_1DACA2D88();
  objc_msgSend(v16, sel_setName_, v14);

  objc_msgSend(v16, sel_setQualityOfService_, a2);
  sub_1DAC37AD8(v16, a3, a4);
  swift_release();
  swift_release();
  swift_release();

}

uint64_t sub_1DAC92574()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC925E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  sub_1DACA2BFC();
  sub_1DACA2CA4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void SearchItemIndexer.reindexTips(_:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EDAF3198);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = a1;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = v4;
  v11[4] = 0xD000000000000020;
  v11[5] = 0x80000001DACAF250;
  v11[6] = &unk_1F028C2C8;
  v11[7] = v10;
  v12 = objc_allocWithZone((Class)sub_1DACA2C80());
  swift_retain();
  swift_bridgeObjectRetain();
  v13 = v4;
  swift_retain();
  v15 = (id)sub_1DACA2C74();
  v14 = (void *)sub_1DACA2D88();
  objc_msgSend(v15, sel_setName_, v14);

  objc_msgSend(v15, sel_setQualityOfService_, a2);
  sub_1DAC37AD8(v15, a3, a4);
  swift_release();
  swift_release();

}

uint64_t sub_1DAC927F0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = sub_1DACA2C14();
  v2[2] = v4;
  v2[3] = *(_QWORD *)(v4 - 8);
  v2[4] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v2[5] = v5;
  *v5 = v2;
  v5[1] = sub_1DAC92874;
  return sub_1DAC477F4(a2, 0, 20);
}

uint64_t sub_1DAC92874()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC928E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  sub_1DACA2BFC();
  sub_1DACA2CA4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void SearchItemIndexer.reindexUserGuides(_:qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EDAF3190);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  *(_QWORD *)(v10 + 24) = a1;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = v4;
  v11[4] = 0xD000000000000027;
  v11[5] = 0x80000001DACAF280;
  v11[6] = &unk_1F028C2D8;
  v11[7] = v10;
  v12 = objc_allocWithZone((Class)sub_1DACA2C80());
  swift_retain();
  swift_bridgeObjectRetain();
  v13 = v4;
  swift_retain();
  v15 = (id)sub_1DACA2C74();
  v14 = (void *)sub_1DACA2D88();
  objc_msgSend(v15, sel_setName_, v14);

  objc_msgSend(v15, sel_setQualityOfService_, a2);
  sub_1DAC37AD8(v15, a3, a4);
  swift_release();
  swift_release();

}

uint64_t sub_1DAC92BB4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;

  v2[2] = a1;
  v2[3] = a2;
  v3 = sub_1DACA2C14();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v4 = (_QWORD *)swift_task_alloc();
  v2[7] = v4;
  *v4 = v2;
  v4[1] = sub_1DAC92C28;
  return sub_1DAC8C7F8();
}

uint64_t sub_1DAC92C28()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;

  v2 = *v1;
  v3 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v3 + 8))();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v2 + 64) = v5;
    *v5 = v3;
    v5[1] = sub_1DAC92CB4;
    return sub_1DAC47B64(*(_QWORD *)(v2 + 24), 50);
  }
}

uint64_t sub_1DAC92CB4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC92D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  sub_1DACA2BFC();
  sub_1DACA2CA4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void SearchItemIndexer.deleteAllItems(qualityOfService:completionHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v7 = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EDAF3198);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = v3;
  v8[4] = 0xD00000000000001FLL;
  v8[5] = 0x80000001DACAF2B0;
  v8[6] = &unk_1F028C2E8;
  v8[7] = v7;
  v9 = objc_allocWithZone((Class)sub_1DACA2C80());
  swift_retain_n();
  v10 = v3;
  v12 = (id)sub_1DACA2C74();
  v11 = (void *)sub_1DACA2D88();
  objc_msgSend(v12, sel_setName_, v11);

  objc_msgSend(v12, sel_setQualityOfService_, a1);
  sub_1DAC37AD8(v12, a2, a3);
  swift_release_n();

}

uint64_t sub_1DAC92FB8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  v1 = sub_1DACA2C14();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  v4 = (uint64_t (__cdecl *)())((char *)&dword_1F028C308 + dword_1F028C308);
  v2 = (_QWORD *)swift_task_alloc();
  v0[5] = v2;
  *v2 = v0;
  v2[1] = sub_1DAC9303C;
  return v4();
}

uint64_t sub_1DAC9303C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (!v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DAC930AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  sub_1DACA2BFC();
  sub_1DACA2CA4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93128()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[15] = v0;
  v1[16] = *v0;
  v2 = sub_1DACA28E4();
  v1[17] = v2;
  v1[18] = *(_QWORD *)(v2 - 8);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v3 = sub_1DACA2C14();
  v1[21] = v3;
  v1[22] = *(_QWORD *)(v3 - 8);
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC931C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;

  v2 = v0[22];
  v1 = v0[23];
  v3 = v0[21];
  sub_1DACA2BFC();
  sub_1DACA2C98();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = sub_1DAC47BCC();
  v0[24] = v4;
  v0[2] = v0;
  v0[3] = sub_1DAC932B4;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v0[11] = 0x40000000;
  v0[12] = sub_1DAC8A5FC;
  v0[13] = &block_descriptor_6;
  v0[14] = v5;
  objc_msgSend(v4, sel_deleteAllSearchableItemsWithCompletionHandler_, v0 + 10);
  return swift_continuation_await();
}

uint64_t sub_1DAC932B4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC93314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);

  sub_1DAC46974();
  sub_1DACA289C();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v2, v3);
  sub_1DAC78ECC();
  v5(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC933D0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC934D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;

  v3[4] = a2;
  v3[5] = a3;
  v3[3] = a1;
  v4 = sub_1DACA2C14();
  v3[6] = v4;
  v3[7] = *(_QWORD *)(v4 - 8);
  v3[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC93538()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(v0 + 120) = v2;
  v3 = -1;
  v4 = -1 << v2;
  if (-(-1 << v2) < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 56);
  v6 = (_QWORD *)swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = 0;
    v8 = __clz(__rbit64(v5));
    v9 = (v5 - 1) & v5;
    goto LABEL_5;
  }
  v13 = 63 - v4;
  if ((unint64_t)(63 - v4) <= 0x7F)
    goto LABEL_29;
  v14 = v6[8];
  if (!v14)
  {
    if (v13 >= 0xC0)
    {
      v14 = v6[9];
      if (v14)
      {
        v7 = 2;
        goto LABEL_11;
      }
      if (v13 >= 0x100)
      {
        v14 = v6[10];
        if (v14)
        {
          v7 = 3;
          goto LABEL_11;
        }
        if (v13 >= 0x140)
        {
          v14 = v6[11];
          if (v14)
          {
            v7 = 4;
            goto LABEL_11;
          }
          v16 = 0;
          v17 = v13 >> 6;
          if (v17 <= 5)
            v17 = 5;
          v18 = v17 - 5;
          while (v18 != v16)
          {
            v14 = v6[v16++ + 12];
            if (v14)
            {
              v7 = v16 + 4;
              goto LABEL_11;
            }
          }
        }
      }
    }
LABEL_29:
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v7 = 1;
LABEL_11:
  v9 = (v14 - 1) & v14;
  v8 = __clz(__rbit64(v14)) + (v7 << 6);
LABEL_5:
  *(_QWORD *)(v0 + 72) = v7;
  *(_QWORD *)(v0 + 80) = v9;
  v10 = *(_QWORD *)(v6[6] + 8 * v8);
  if (v10)
  {
    if (v10 == 1)
    {
      v11 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v11;
      *v11 = v0;
      v11[1] = sub_1DAC9397C;
      return sub_1DAC8C7F8();
    }
    else
    {
      *(_QWORD *)(v0 + 16) = v10;
      return sub_1DACA31E4();
    }
  }
  else
  {
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v15;
    *v15 = v0;
    v15[1] = sub_1DAC9371C;
    return sub_1DAC9488C();
  }
}

uint64_t sub_1DAC9371C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC93780()
{
  uint64_t v0;
  uint64_t result;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  int64_t v14;

  sub_1DACA2BFC();
  sub_1DACA2CA4();
  result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  if (v3)
  {
    v4 = __clz(__rbit64(v3));
    v5 = (v3 - 1) & v3;
    v6 = v4 | (v2 << 6);
    result = *(_QWORD *)(v0 + 24);
    goto LABEL_3;
  }
  v9 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  v10 = (unint64_t)((1 << *(_BYTE *)(v0 + 120)) + 63) >> 6;
  result = *(_QWORD *)(v0 + 24);
  if (v9 >= v10)
  {
LABEL_22:
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = result + 56;
  v12 = *(_QWORD *)(result + 56 + 8 * v9);
  ++v2;
  if (!v12)
  {
    v2 = v9 + 1;
    if (v9 + 1 < v10)
    {
      v12 = *(_QWORD *)(v11 + 8 * v2);
      if (v12)
        goto LABEL_9;
      v2 = v9 + 2;
      if (v9 + 2 < v10)
      {
        v12 = *(_QWORD *)(v11 + 8 * v2);
        if (v12)
          goto LABEL_9;
        v14 = v9 + 3;
        if (v14 < v10)
        {
          v12 = *(_QWORD *)(v11 + 8 * v14);
          if (v12)
          {
            v2 = v14;
            goto LABEL_9;
          }
          while (1)
          {
            v2 = v14 + 1;
            if (__OFADD__(v14, 1))
              break;
            if (v2 >= v10)
              goto LABEL_22;
            v12 = *(_QWORD *)(v11 + 8 * v2);
            ++v14;
            if (v12)
              goto LABEL_9;
          }
LABEL_24:
          __break(1u);
          return result;
        }
      }
    }
    goto LABEL_22;
  }
LABEL_9:
  v5 = (v12 - 1) & v12;
  v6 = __clz(__rbit64(v12)) + (v2 << 6);
LABEL_3:
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v6);
  if (v7)
  {
    if (v7 == 1)
    {
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v8;
      *v8 = v0;
      v8[1] = sub_1DAC9397C;
      return sub_1DAC8C7F8();
    }
    else
    {
      *(_QWORD *)(v0 + 16) = v7;
      return sub_1DACA31E4();
    }
  }
  else
  {
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v13;
    *v13 = v0;
    v13[1] = sub_1DAC9371C;
    return sub_1DAC9488C();
  }
}

uint64_t sub_1DAC9397C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC939E0()
{
  uint64_t v0;
  uint64_t result;
  int64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  int64_t v14;

  sub_1DACA2BFC();
  sub_1DACA2CA4();
  result = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 48));
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  if (v3)
  {
    v4 = __clz(__rbit64(v3));
    v5 = (v3 - 1) & v3;
    v6 = v4 | (v2 << 6);
    result = *(_QWORD *)(v0 + 24);
    goto LABEL_3;
  }
  v9 = v2 + 1;
  if (__OFADD__(v2, 1))
  {
    __break(1u);
    goto LABEL_24;
  }
  v10 = (unint64_t)((1 << *(_BYTE *)(v0 + 120)) + 63) >> 6;
  result = *(_QWORD *)(v0 + 24);
  if (v9 >= v10)
  {
LABEL_22:
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v11 = result + 56;
  v12 = *(_QWORD *)(result + 56 + 8 * v9);
  ++v2;
  if (!v12)
  {
    v2 = v9 + 1;
    if (v9 + 1 < v10)
    {
      v12 = *(_QWORD *)(v11 + 8 * v2);
      if (v12)
        goto LABEL_9;
      v2 = v9 + 2;
      if (v9 + 2 < v10)
      {
        v12 = *(_QWORD *)(v11 + 8 * v2);
        if (v12)
          goto LABEL_9;
        v14 = v9 + 3;
        if (v14 < v10)
        {
          v12 = *(_QWORD *)(v11 + 8 * v14);
          if (v12)
          {
            v2 = v14;
            goto LABEL_9;
          }
          while (1)
          {
            v2 = v14 + 1;
            if (__OFADD__(v14, 1))
              break;
            if (v2 >= v10)
              goto LABEL_22;
            v12 = *(_QWORD *)(v11 + 8 * v2);
            ++v14;
            if (v12)
              goto LABEL_9;
          }
LABEL_24:
          __break(1u);
          return result;
        }
      }
    }
    goto LABEL_22;
  }
LABEL_9:
  v5 = (v12 - 1) & v12;
  v6 = __clz(__rbit64(v12)) + (v2 << 6);
LABEL_3:
  *(_QWORD *)(v0 + 72) = v2;
  *(_QWORD *)(v0 + 80) = v5;
  v7 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v6);
  if (v7)
  {
    if (v7 == 1)
    {
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 104) = v8;
      *v8 = v0;
      v8[1] = sub_1DAC9397C;
      return sub_1DAC8C7F8();
    }
    else
    {
      *(_QWORD *)(v0 + 16) = v7;
      return sub_1DACA31E4();
    }
  }
  else
  {
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v13;
    *v13 = v0;
    v13[1] = sub_1DAC9371C;
    return sub_1DAC9488C();
  }
}

uint64_t sub_1DAC93BDC()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93C1C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93C5C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC93CC8()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 96) = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___tipsIndexer, 1936746868, 0xE400000000000000, &qword_1EDAF3198);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC93D38;
  return sub_1DAC9488C();
}

uint64_t sub_1DAC93D38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC93DA4()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 120) = sub_1DAC48CEC(&OBJC_IVAR___TPSSearchItemIndexer____lazy_storage___userGuideIndexer, 0x6469754772657375, 0xE900000000000065, &qword_1EDAF3190);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC93E20;
  return sub_1DAC8C7F8();
}

uint64_t sub_1DAC93E20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC93E8C()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = objc_msgSend(*(id *)(v0 + 64), sel_standardUserDefaults);
  v2 = (void *)sub_1DACA2D88();
  objc_msgSend(v1, sel_setInteger_forKey_, 1, v2);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93F1C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93F5C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93F9C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC93FE0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void (*v7)(void *);

  v1 = *(void **)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v7 = *(void (**)(void *))(v0 + 104);
  sub_1DACA2BFC();
  sub_1DACA304C();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  sub_1DACA30D0();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = v1;
  v7(v1);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC94154()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void (*v7)(void *);

  v1 = *(void **)(v0 + 184);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 120);
  v7 = *(void (**)(void *))(v0 + 104);
  sub_1DACA2BFC();
  sub_1DACA304C();
  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0xE000000000000000;
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  *(_QWORD *)(v0 + 56) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  sub_1DACA30D0();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v5 = v1;
  v7(v1);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC942C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C310);
    v3 = sub_1DACA3040();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_QWORD *)(v6 + 8 * v4);
      sub_1DACA3250();
      sub_1DACA325C();
      result = sub_1DACA3274();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_QWORD *)(v14 + 8 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_QWORD *)(v14 + 8 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_QWORD *)(v14 + 8 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1DAC94400()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC94434()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DAC6F4A4;
  return sub_1DAC934D4(v2, v3, v4);
}

uint64_t sub_1DAC944A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DAC6F4A4;
  return sub_1DAC927F0(v2, v3);
}

uint64_t sub_1DAC944FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DAC6F4A4;
  return sub_1DAC92BB4(v2, v3);
}

uint64_t sub_1DAC94550()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC6F4A4;
  return sub_1DAC92FB8();
}

unint64_t sub_1DAC945A0()
{
  unint64_t result;

  result = qword_1F028C2F0;
  if (!qword_1F028C2F0)
  {
    result = MEMORY[0x1DF0A60C4](&protocol conformance descriptor for SearchItemIndexer.IndexItemType, &type metadata for SearchItemIndexer.IndexItemType);
    atomic_store(result, (unint64_t *)&qword_1F028C2F0);
  }
  return result;
}

unint64_t sub_1DAC945E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F028C2F8;
  if (!qword_1F028C2F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F028C300);
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1F028C2F8);
  }
  return result;
}

uint64_t type metadata accessor for SearchItemIndexer()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchItemIndexer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchItemIndexer.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

ValueMetadata *type metadata accessor for SearchItemIndexer.IndexItemType()
{
  return &type metadata for SearchItemIndexer.IndexItemType;
}

uint64_t sub_1DAC94678()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DAC9469C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1DAC946C0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC946F4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC94730()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC9475C(uint64_t a1)
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
  v7[1] = sub_1DAC6F4A4;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F028C328 + dword_1F028C328))(a1, v4, v5, v6);
}

uint64_t sub_1DAC947E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC94804(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC6F4A4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F028C338 + dword_1F028C338))(a1, v4);
}

uint64_t sub_1DAC9488C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[32] = v0;
  v1[33] = *v0;
  v2 = sub_1DACA28E4();
  v1[34] = v2;
  v1[35] = *(_QWORD *)(v2 - 8);
  v1[36] = swift_task_alloc();
  v1[37] = swift_task_alloc();
  v3 = sub_1DACA2C14();
  v1[38] = v3;
  v1[39] = *(_QWORD *)(v3 - 8);
  v1[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC9492C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  v2 = v0[39];
  v1 = v0[40];
  v3 = v0[38];
  sub_1DACA2BFC();
  sub_1DACA2C98();
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8);
  v0[41] = v4;
  v5 = v4(v1, v3);
  v0[42] = sub_1DAC47BC8(v5);
  return swift_task_switch();
}

uint64_t sub_1DAC949B8()
{
  uint64_t v0;
  _QWORD *v1;

  objc_msgSend(*(id *)(v0 + 336), sel_beginIndexBatch);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 344) = v1;
  *v1 = v0;
  v1[1] = sub_1DAC94A28;
  v1[15] = *(_QWORD *)(v0 + 336);
  return swift_task_switch();
}

uint64_t sub_1DAC94A28()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC94A8C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[42];
  v2 = sub_1DACA2938();
  v0[45] = v2;
  v0[10] = v0;
  v0[11] = sub_1DAC94B38;
  v3 = swift_continuation_init();
  v0[23] = MEMORY[0x1E0C809B0];
  v4 = v0 + 23;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_27;
  v4[4] = v3;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC94B38()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 368) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_1DAC94B98()
{
  _QWORD *v0;
  void *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (void (*)(uint64_t, uint64_t))v0[41];
  v1 = (void *)v0[42];
  v3 = v0[40];
  v4 = v0[38];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1DACA3214();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  v2(v3, v4);
  v5 = sub_1DACA2938();
  v0[47] = v5;
  v0[2] = v0;
  v0[3] = sub_1DAC94D08;
  v6 = swift_continuation_init();
  v0[18] = MEMORY[0x1E0C809B0];
  v0[19] = 0x40000000;
  v0[20] = sub_1DAC8A5FC;
  v0[21] = &block_descriptor_25;
  v0[22] = v6;
  objc_msgSend(v1, sel_endIndexBatchWithClientState_completionHandler_, v5, v0 + 18);
  return swift_continuation_await();
}

uint64_t sub_1DAC94D08()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 384) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC94D68()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 336);

  return swift_task_switch();
}

uint64_t sub_1DAC94DB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 280);
  sub_1DAC46974();
  sub_1DACA289C();
  v5 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v5(v1, v3);
  sub_1DAC78ECC();
  v5(v2, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC94E60()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[45];
  swift_willThrow();

  v0[49] = v0[46];
  return swift_task_switch();
}

uint64_t sub_1DAC94EB0()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC94F0C()
{
  uint64_t v0;

  swift_willThrow();
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v0 + 352);
  return swift_task_switch();
}

uint64_t sub_1DAC94F60()
{
  _QWORD *v0;
  void *v1;
  void *v2;

  v1 = (void *)v0[47];
  v2 = (void *)v0[44];
  swift_willThrow();

  v0[49] = v0[48];
  return swift_task_switch();
}

uint64_t sub_1DAC94FCC(__int16 a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t **v3;
  uint64_t *v6;
  _QWORD *v8;

  v6 = *v3;
  v6[36] = v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v2)
  {
    swift_bridgeObjectRelease();
    return swift_task_switch();
  }
  else
  {
    v6[37] = a2;
    v8 = (_QWORD *)swift_task_alloc();
    v6[38] = (uint64_t)v8;
    *v8 = v6;
    v8[1] = sub_1DAC950B4;
    return sub_1DAC95CE0(v6[34], v6[31], a1, a2);
  }
}

uint64_t sub_1DAC950B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 312) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC9514C()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC95190()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + 352) = v0;
  }
  return swift_task_switch();
}

uint64_t sub_1DAC95200()
{
  uint64_t *v0;
  unint64_t v1;
  _QWORD *v2;

  v1 = sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  v0[41] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[42] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1DAC95270;
  return sub_1DAC95CE0(v0[25], v0[31], 2, v1);
}

uint64_t sub_1DAC95270()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 344) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC952FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 240);
  swift_bridgeObjectRelease();
  sub_1DAC33928(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC95350()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 352) = *(_QWORD *)(v0 + 344);
  return swift_task_switch();
}

uint64_t sub_1DAC953A0()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC953E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 392) = v0;
  return swift_task_switch();
}

uint64_t sub_1DAC9544C()
{
  uint64_t *v0;
  unint64_t v1;
  _QWORD *v2;

  v1 = sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  v0[46] = v1;
  v2 = (_QWORD *)swift_task_alloc();
  v0[47] = (uint64_t)v2;
  *v2 = v0;
  v2[1] = sub_1DAC954BC;
  return sub_1DAC95CE0(v0[25], v0[31], 2, v1);
}

uint64_t sub_1DAC954BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC95548()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC95598()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 392) = *(_QWORD *)(v0 + 384);
  return swift_task_switch();
}

uint64_t sub_1DAC955DC()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC9562C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 216);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC9567C()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC956C0()
{
  uint64_t v0;

  sub_1DAC33928(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 240));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC9571C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return swift_task_switch();
}

uint64_t sub_1DAC95734()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[15];
  v2 = sub_1DACA2E30();
  v0[16] = v2;
  v0[2] = v0;
  v0[3] = sub_1DAC8CEE4;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_29;
  v4[4] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithDomainIdentifiers_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC957E8(uint64_t a1, __int16 a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_WORD *)(v4 + 160) = a2;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 40) = *v3;
  v5 = sub_1DACA28E4();
  *(_QWORD *)(v4 + 48) = v5;
  *(_QWORD *)(v4 + 56) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v4 + 64) = swift_task_alloc();
  *(_QWORD *)(v4 + 72) = swift_task_alloc();
  v6 = sub_1DACA2C14();
  *(_QWORD *)(v4 + 80) = v6;
  *(_QWORD *)(v4 + 88) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v4 + 96) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC95890()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 16);
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  MEMORY[0x1DF0A5548](v4, MEMORY[0x1E0DEA968]);
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  if (v5)
  {
    v7 = *(_QWORD *)(v0 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = (uint64_t *)(v7 + 40);
    do
    {
      v12 = *(v8 - 1);
      v13 = *v8;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = sub_1DAC331BC(v12, v13);
      LOBYTE(v12) = v15;
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1DAC8542C();
        swift_bridgeObjectRelease();
        v9 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v14);
        v10 = *v9;
        v11 = v9[1];
        sub_1DAC848B8(v14, v6);
        swift_bridgeObjectRelease();
        sub_1DAC33928(v10, v11);
      }
      swift_bridgeObjectRelease();
      v8 += 2;
      --v5;
    }
    while (v5);
    v16 = swift_bridgeObjectRelease();
  }
  else
  {
    v16 = swift_bridgeObjectRetain();
  }
  *(_QWORD *)(v0 + 104) = v6;
  v17 = *(_QWORD *)(v0 + 16);
  v18 = *(unsigned __int16 *)(v0 + 160);
  *(_QWORD *)(v0 + 112) = sub_1DAC47BC8(v16);
  swift_bridgeObjectRetain();
  v19 = sub_1DAC8A288(v18, v6);
  v21 = v20;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 120) = v19;
  *(_QWORD *)(v0 + 128) = v21;
  v22 = swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v22;
  *(_QWORD *)(v22 + 16) = v17;
  v23 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v23;
  *v23 = v0;
  v23[1] = sub_1DAC95AD8;
  return sub_1DAC88C64(v19, v21, (uint64_t)&unk_1F028C378, v22);
}

uint64_t sub_1DAC95AD8()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  v3 = v2[16];
  v5 = (void *)v2[14];
  v4 = v2[15];
  if (v0)
  {
    swift_bridgeObjectRelease();
    sub_1DAC33928(v4, v3);
  }
  else
  {
    sub_1DAC33928(v2[15], v2[16]);
  }

  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC95B94()
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
  void (*v11)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v5 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  v7 = *(_QWORD *)(v0 + 16);
  v8 = *(_QWORD *)(v6 + 112);
  v9 = *(_QWORD *)(v6 + 120);
  v10 = *(unsigned __int16 *)(v0 + 160);
  swift_bridgeObjectRetain();
  sub_1DAC89FEC(v8, v9, v10, v1);
  swift_bridgeObjectRelease();
  sub_1DAC46974();
  sub_1DACA289C();
  v11 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v11(v3, v5);
  sub_1DAC78C98(v7, v2);
  v11(v2, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(unsigned __int16 *)(v0 + 160), *(_QWORD *)(v0 + 104));
}

uint64_t sub_1DAC95C98()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC95CE0(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 96) = a4;
  *(_QWORD *)(v5 + 104) = v4;
  *(_WORD *)(v5 + 184) = a3;
  *(_QWORD *)(v5 + 80) = a1;
  *(_QWORD *)(v5 + 88) = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35F8);
  *(_QWORD *)(v5 + 112) = swift_task_alloc();
  return swift_task_switch();
}

void sub_1DAC95D44()
{
  uint64_t v0;
  unint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int16 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  _QWORD *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v1 = *(_QWORD *)(v0 + 80);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    v3 = *(_QWORD *)(v0 + 88);
    if (v3)
    {
LABEL_3:
      v4 = *(_QWORD *)(v0 + 96);
      v5 = *(_WORD *)(v0 + 184);
      v6 = *(_QWORD *)(v0 + 80);
      swift_bridgeObjectRetain();
      v7 = sub_1DAC96C04(0, v2, v3, v6, v3);
      *(_QWORD *)(v0 + 120) = v7;
      v8 = swift_allocObject();
      *(_QWORD *)(v0 + 128) = v8;
      *(_WORD *)(v8 + 16) = v5;
      *(_QWORD *)(v8 + 24) = v4;
      v9 = *(_QWORD *)(v7 + 16);
      *(_QWORD *)(v0 + 136) = v9;
      if (!v9)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_beginAccess();
        v23 = *(_QWORD *)(v8 + 24);
        v24 = *(unsigned __int16 *)(v8 + 16);
        swift_bridgeObjectRetain();
        swift_release();
        swift_task_dealloc();
        (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v24, v23);
        return;
      }
      v10 = sub_1DAC97D00(&qword_1F028C388, &qword_1EDAF3198, (uint64_t)&unk_1DACA8810);
      *(_QWORD *)(v0 + 144) = v10;
      *(_QWORD *)(v0 + 152) = 0;
      v11 = *(_QWORD *)(v0 + 104);
      v12 = *(_QWORD *)(v0 + 112);
      v13 = *(_QWORD *)(v7 + 32);
      v14 = sub_1DACA2EE4();
      v15 = *(_QWORD *)(v14 - 8);
      v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56);
      swift_bridgeObjectRetain();
      v16(v12, 1, 1, v14);
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = v11;
      v17[3] = v10;
      v17[4] = v13;
      v17[5] = v11;
      v17[6] = v8;
      v18 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14);
      swift_retain_n();
      swift_bridgeObjectRetain();
      swift_retain();
      v19 = *(_QWORD *)(v0 + 112);
      if (v18 == 1)
      {
        sub_1DAC7190C(*(_QWORD *)(v0 + 112), &qword_1EDAF35F8);
        if (v11)
          goto LABEL_6;
      }
      else
      {
        sub_1DACA2ED8();
        (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v19, v14);
        if (v17[2])
        {
LABEL_6:
          swift_getObjectType();
          swift_unknownObjectRetain();
          v20 = sub_1DACA2E84();
          v22 = v21;
          swift_unknownObjectRelease();
          if (v22 | v20)
          {
            *(_QWORD *)(v0 + 16) = 0;
            *(_QWORD *)(v0 + 24) = 0;
            *(_QWORD *)(v0 + 32) = v20;
            *(_QWORD *)(v0 + 40) = v22;
          }
        }
      }
      *(_QWORD *)(v0 + 160) = swift_task_create();
      v25 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 168) = v25;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
      *v25 = v0;
      v25[1] = sub_1DAC960A4;
      sub_1DACA2EF0();
      return;
    }
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v3 = *(_QWORD *)(v0 + 88);
    if (v3)
      goto LABEL_3;
  }
  __break(1u);
}

uint64_t sub_1DAC960A4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  if (v0)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC96124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v1 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 136);
  swift_release();
  if (v1 + 1 == v2)
  {
    v3 = *(_QWORD *)(v0 + 128);
    swift_bridgeObjectRelease();
    swift_beginAccess();
    v4 = *(_QWORD *)(v3 + 24);
    v5 = *(unsigned __int16 *)(v3 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v5, v4);
  }
  v7 = *(_QWORD *)(v0 + 144);
  v8 = *(_QWORD *)(v0 + 152) + 1;
  *(_QWORD *)(v0 + 152) = v8;
  v9 = *(_QWORD *)(v0 + 128);
  v10 = *(_QWORD *)(v0 + 104);
  v11 = *(_QWORD *)(v0 + 112);
  v12 = *(_QWORD *)(*(_QWORD *)(v0 + 120) + 8 * v8 + 32);
  v13 = sub_1DACA2EE4();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v11, 1, 1, v13);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v10;
  v15[3] = v7;
  v15[4] = v12;
  v15[5] = v10;
  v15[6] = v9;
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_retain();
  v16 = *(_QWORD *)(v0 + 112);
  if ((_DWORD)v11 == 1)
  {
    sub_1DAC7190C(*(_QWORD *)(v0 + 112), &qword_1EDAF35F8);
    if (v10)
      goto LABEL_5;
  }
  else
  {
    sub_1DACA2ED8();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v13);
    if (v15[2])
    {
LABEL_5:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v17 = sub_1DACA2E84();
      v19 = v18;
      swift_unknownObjectRelease();
      if (v19 | v17)
      {
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v17;
        *(_QWORD *)(v0 + 40) = v19;
      }
    }
  }
  *(_QWORD *)(v0 + 160) = swift_task_create();
  v20 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E0);
  *v20 = v0;
  v20[1] = sub_1DAC960A4;
  return sub_1DACA2EF0();
}

uint64_t sub_1DAC963A8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC963E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[13] = a5;
  v6[14] = a6;
  v6[12] = a4;
  v7 = sub_1DACA2C14();
  v6[15] = v7;
  v6[16] = *(_QWORD *)(v7 - 8);
  v6[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC96450()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[12];
  sub_1DACA2BFC();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = v0[16];
  v3 = v0[17];
  v5 = v0[15];
  v0[11] = v2;
  sub_1DACA319C();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2CA4();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  v6 = (_QWORD *)swift_task_alloc();
  v0[18] = v6;
  *v6 = v0;
  v6[1] = sub_1DAC965A8;
  return sub_1DAC6F904(v0[12]);
}

uint64_t sub_1DAC965A8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC96608()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 152);
  if (v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    if (v17)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v2 = *(_QWORD *)(v0 + 112);
    v3 = *(_QWORD *)(v0 + 96);
    swift_beginAccess();
    v4 = sub_1DAC381D0(v3);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *(_QWORD *)(v2 + 24);
    *(_QWORD *)(v2 + 24) = 0x8000000000000000;
    sub_1DAC970D4(v4, (uint64_t)sub_1DAC97584, 0, isUniquelyReferenced_nonNull_native, &v18);
    *(_QWORD *)(v2 + 24) = v18;
    swift_bridgeObjectRelease();
    v6 = *(_QWORD *)(v0 + 152);
    v7 = *(_QWORD *)(v0 + 112);
    v8 = swift_endAccess();
    *(_QWORD *)(v0 + 160) = sub_1DAC47BC8(v8);
    swift_beginAccess();
    v9 = *(_QWORD *)(v2 + 24);
    v10 = *(unsigned __int16 *)(v7 + 16);
    swift_bridgeObjectRetain();
    v11 = sub_1DAC8A288(v10, v9);
    v13 = v12;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 168) = v11;
    *(_QWORD *)(v0 + 176) = v13;
    v14 = swift_task_alloc();
    *(_QWORD *)(v0 + 184) = v14;
    *(_QWORD *)(v14 + 16) = v6;
    v15 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v15;
    *v15 = v0;
    v15[1] = sub_1DAC96804;
    return sub_1DAC88C64(v11, v13, (uint64_t)&unk_1F028C3A0, v14);
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC96804()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 200) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    v3 = v2[22];
    v5 = (void *)v2[20];
    v4 = v2[21];
    swift_bridgeObjectRelease();
    sub_1DAC33928(v4, v3);

    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_1DAC968A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 24);
  v4 = *(_QWORD *)(v1 + 112);
  v5 = *(_QWORD *)(v1 + 120);
  v6 = *(unsigned __int16 *)(v2 + 16);
  swift_bridgeObjectRetain();
  sub_1DAC89FEC(v4, v5, v6, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC96930()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(void **)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 168);
  swift_bridgeObjectRelease();
  sub_1DAC33928(v2, v1);

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC969A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch();
}

uint64_t sub_1DAC969B8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[15];
  sub_1DAC97CC4();
  v2 = sub_1DACA2E30();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_1DAC96A6C;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_23;
  v4[4] = v3;
  objc_msgSend(v1, sel_indexSearchableItems_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC96A6C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 144) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAC96ACC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC96B00()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 136);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC96B40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 120) = a1;
  *(_QWORD *)(v2 + 128) = a2;
  return swift_task_switch();
}

uint64_t sub_1DAC96B58()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[15];
  v2 = sub_1DACA2E30();
  v0[17] = v2;
  v0[2] = v0;
  v0[3] = sub_1DAC96A6C;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_1DAC8A5FC;
  v4[3] = &block_descriptor_11_0;
  v4[4] = v3;
  objc_msgSend(v1, sel_deleteSearchableItemsWithIdentifiers_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_1DAC96C04(uint64_t a1, int64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t result;
  uint64_t v15;
  BOOL v16;
  int64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  BOOL v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  BOOL v27;
  _BYTE v30[8];
  _BYTE v31[8];
  uint64_t v32;

  v6 = v5;
  v9 = a1;
  v10 = 0;
  v11 = a1;
  while (1)
  {
    v12 = v11 <= a2;
    if (a3 > 0)
      v12 = v11 >= a2;
    if (v12)
      break;
    v13 = __OFADD__(v11, a3);
    v11 += a3;
    if (v13)
      v11 = (v11 >> 63) ^ 0x8000000000000000;
    v13 = __OFADD__(v10++, 1);
    if (v13)
    {
      __break(1u);
      break;
    }
  }
  v32 = MEMORY[0x1E0DEE9D8];
  result = (uint64_t)sub_1DAC9C668(0, v10, 0);
  v15 = v32;
  if (v10)
  {
    while (1)
    {
      v16 = v9 <= a2;
      if (a3 > 0)
        v16 = v9 >= a2;
      if (v16)
        break;
      if (__OFADD__(v9, a3))
        v17 = ((v9 + a3) >> 63) ^ 0x8000000000000000;
      else
        v17 = v9 + a3;
      result = sub_1DAC8E0F4(v9, a4, a5, (uint64_t)v31);
      if (v6)
        goto LABEL_37;
      v18 = result;
      v6 = 0;
      v32 = v15;
      v20 = *(_QWORD *)(v15 + 16);
      v19 = *(_QWORD *)(v15 + 24);
      if (v20 >= v19 >> 1)
      {
        result = (uint64_t)sub_1DAC9C668((_QWORD *)(v19 > 1), v20 + 1, 1);
        v15 = v32;
      }
      *(_QWORD *)(v15 + 16) = v20 + 1;
      *(_QWORD *)(v15 + 8 * v20 + 32) = v18;
      v9 = v17;
      if (!--v10)
        goto LABEL_23;
    }
    __break(1u);
  }
  else
  {
    v17 = v9;
LABEL_23:
    v21 = v17 <= a2;
    if (a3 > 0)
      v21 = v17 >= a2;
    if (v21)
    {
LABEL_26:
      swift_bridgeObjectRelease();
    }
    else
    {
      while (1)
      {
        v22 = __OFADD__(v17, a3) ? ((v17 + a3) >> 63) ^ 0x8000000000000000 : v17 + a3;
        v23 = sub_1DAC8E0F4(v17, a4, a5, (uint64_t)v30);
        if (v6)
          break;
        v24 = v23;
        v6 = 0;
        v32 = v15;
        v26 = *(_QWORD *)(v15 + 16);
        v25 = *(_QWORD *)(v15 + 24);
        if (v26 >= v25 >> 1)
        {
          sub_1DAC9C668((_QWORD *)(v25 > 1), v26 + 1, 1);
          v15 = v32;
        }
        *(_QWORD *)(v15 + 16) = v26 + 1;
        *(_QWORD *)(v15 + 8 * v26 + 32) = v24;
        v27 = v22 <= a2;
        if (a3 > 0)
          v27 = v22 >= a2;
        v17 = v22;
        if (v27)
          goto LABEL_26;
      }
LABEL_37:
      swift_bridgeObjectRelease();
      swift_release();
    }
    return v15;
  }
  return result;
}

uint64_t sub_1DAC96E34(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1DF0A577C](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1DAC973DC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1DACA30E8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1DACA2E54();
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC96FEC(uint64_t result)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = *(_QWORD *)(result + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(v6 + 16))
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = (uint64_t)sub_1DAC83588((char *)result, v10, 1, (char *)v3);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v7 = *(_QWORD *)(v3 + 16);
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    *(_QWORD *)(v3 + 16) = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1DAC970D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  _QWORD *v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t result;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v55 = a1;
  v56 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v57 = v8;
  v58 = 0;
  v59 = v11 & v9;
  v60 = a2;
  v61 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1DAC975BC(&v52);
  v12 = *((_QWORD *)&v52 + 1);
  if (!*((_QWORD *)&v52 + 1))
    goto LABEL_27;
  v13 = v52;
  v15 = v53;
  v14 = v54;
  v16 = (_QWORD *)*a5;
  v18 = sub_1DAC331BC(v52, *((uint64_t *)&v52 + 1));
  v19 = v16[2];
  v20 = (v17 & 1) == 0;
  v21 = v19 + v20;
  if (__OFADD__(v19, v20))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v22 = v17;
  if (v16[3] >= v21)
  {
    if ((a4 & 1) != 0)
    {
      v25 = (_QWORD *)*a5;
      if ((v17 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_1DAC8542C();
      v25 = (_QWORD *)*a5;
      if ((v22 & 1) != 0)
        goto LABEL_12;
    }
LABEL_14:
    v25[(v18 >> 6) + 8] |= 1 << v18;
    v27 = (uint64_t *)(v25[6] + 16 * v18);
    *v27 = v13;
    v27[1] = v12;
    v28 = (_QWORD *)(v25[7] + 16 * v18);
    *v28 = v15;
    v28[1] = v14;
    v29 = v25[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (v30)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v25[2] = v31;
LABEL_16:
    sub_1DAC975BC(&v52);
    for (i = *((_QWORD *)&v52 + 1); *((_QWORD *)&v52 + 1); i = *((_QWORD *)&v52 + 1))
    {
      v34 = v52;
      v36 = v53;
      v35 = v54;
      v37 = (_QWORD *)*a5;
      v39 = sub_1DAC331BC(v52, i);
      v40 = v37[2];
      v41 = (v38 & 1) == 0;
      v42 = v40 + v41;
      if (__OFADD__(v40, v41))
        goto LABEL_28;
      v43 = v38;
      if (v37[3] < v42)
      {
        sub_1DAC384B8(v42, 1);
        v44 = sub_1DAC331BC(v34, i);
        if ((v43 & 1) != (v45 & 1))
          goto LABEL_30;
        v39 = v44;
      }
      v46 = (_QWORD *)*a5;
      if ((v43 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v33 = v46[7] + 16 * v39;
        sub_1DAC33928(*(_QWORD *)v33, *(_QWORD *)(v33 + 8));
        *(_QWORD *)v33 = v36;
        *(_QWORD *)(v33 + 8) = v35;
      }
      else
      {
        v46[(v39 >> 6) + 8] |= 1 << v39;
        v47 = (uint64_t *)(v46[6] + 16 * v39);
        *v47 = v34;
        v47[1] = i;
        v48 = (_QWORD *)(v46[7] + 16 * v39);
        *v48 = v36;
        v48[1] = v35;
        v49 = v46[2];
        v30 = __OFADD__(v49, 1);
        v50 = v49 + 1;
        if (v30)
          goto LABEL_29;
        v46[2] = v50;
      }
      sub_1DAC975BC(&v52);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1DAC75BE8();
    return swift_release();
  }
  sub_1DAC384B8(v21, a4 & 1);
  v23 = sub_1DAC331BC(v13, v12);
  if ((v22 & 1) == (v24 & 1))
  {
    v18 = v23;
    v25 = (_QWORD *)*a5;
    if ((v22 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    swift_bridgeObjectRelease();
    v26 = v25[7] + 16 * v18;
    sub_1DAC33928(*(_QWORD *)v26, *(_QWORD *)(v26 + 8));
    *(_QWORD *)v26 = v15;
    *(_QWORD *)(v26 + 8) = v14;
    goto LABEL_16;
  }
LABEL_30:
  result = sub_1DACA3208();
  __break(1u);
  return result;
}

uint64_t sub_1DAC973DC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1DACA30E8();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1DACA30E8();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1DAC97D00(&qword_1F028C3B8, &qword_1F028C3B0, MEMORY[0x1E0DEAF50]);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C3B0);
            v10 = sub_1DAC902B4(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_1DACA2CF8();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAC97584@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  a2[2] = v4;
  a2[3] = v5;
  *a2 = v3;
  a2[1] = v2;
  swift_bridgeObjectRetain();
  return sub_1DAC324C8(v4, v5);
}

uint64_t sub_1DAC975BC@<X0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  int64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(_QWORD *);
  uint64_t result;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  _QWORD v24[4];

  v3 = *v1;
  v5 = v1[3];
  v4 = v1[4];
  v6 = v5;
  if (v4)
  {
    v7 = (v4 - 1) & v4;
    v8 = __clz(__rbit64(v4)) | (v5 << 6);
LABEL_3:
    v9 = 16 * v8;
    v10 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v8);
    v11 = *v10;
    v12 = v10[1];
    v13 = (uint64_t *)(*(_QWORD *)(v3 + 56) + v9);
    v14 = *v13;
    v15 = v13[1];
    v1[3] = v6;
    v1[4] = v7;
    v16 = (void (*)(_QWORD *))v1[5];
    v24[0] = v11;
    v24[1] = v12;
    v24[2] = v14;
    v24[3] = v15;
    swift_bridgeObjectRetain();
    sub_1DAC324C8(v14, v15);
    v16(v24);
    swift_bridgeObjectRelease();
    return sub_1DAC33928(v14, v15);
  }
  v18 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v19 = (unint64_t)(v1[2] + 64) >> 6;
    if (v18 < v19)
    {
      v20 = v1[1];
      v21 = *(_QWORD *)(v20 + 8 * v18);
      if (v21)
      {
LABEL_7:
        v7 = (v21 - 1) & v21;
        v8 = __clz(__rbit64(v21)) + (v18 << 6);
        v6 = v18;
        goto LABEL_3;
      }
      v22 = v5 + 2;
      v6 = v5 + 1;
      if (v5 + 2 < v19)
      {
        v21 = *(_QWORD *)(v20 + 8 * v22);
        if (v21)
        {
LABEL_10:
          v18 = v22;
          goto LABEL_7;
        }
        v6 = v5 + 2;
        if (v5 + 3 < v19)
        {
          v21 = *(_QWORD *)(v20 + 8 * (v5 + 3));
          if (v21)
          {
            v18 = v5 + 3;
            goto LABEL_7;
          }
          v22 = v5 + 4;
          v6 = v5 + 3;
          if (v5 + 4 < v19)
          {
            v21 = *(_QWORD *)(v20 + 8 * v22);
            if (v21)
              goto LABEL_10;
            v18 = v5 + 5;
            v6 = v5 + 4;
            if (v5 + 5 < v19)
            {
              v21 = *(_QWORD *)(v20 + 8 * v18);
              if (v21)
                goto LABEL_7;
              v6 = v19 - 1;
              v23 = v5 + 6;
              while (v19 != v23)
              {
                v21 = *(_QWORD *)(v20 + 8 * v23++);
                if (v21)
                {
                  v18 = v23 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v1[3] = v6;
    v1[4] = 0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_1DAC9776C(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  char **v4;
  char **v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_19;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      v4 = &selRef_initWithAppEntity_;
      v5 = &selRef_initWithAppEntity_;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)MEMORY[0x1DF0A5770](v3, a1);
LABEL_7:
        v7 = v6;
        v8 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_18;
        if ((objc_msgSend(v6, v4[466]) & 2) == 0
          || (objc_msgSend(v7, v5[82]) & 1) != 0
          || objc_msgSend(v7, sel_isOutro)
          || (objc_msgSend(v7, sel_isLinkedArticle) & 1) != 0)
        {

        }
        else
        {
          sub_1DACA3094();
          sub_1DACA30B8();
          v5 = &selRef_initWithAppEntity_;
          sub_1DACA30C4();
          sub_1DACA30A0();
          v4 = &selRef_initWithAppEntity_;
        }
        ++v3;
        if (v8 == v2)
          return v10;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      v2 = sub_1DACA30E8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    v6 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1DAC978F8(unint64_t a1, _QWORD *a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  BOOL v14;
  _QWORD *v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v3 = a1;
  v25 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_33;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v4)
  {
    while (1)
    {
      v19 = v3;
      v5 = 0;
      v23 = v3 & 0xFFFFFFFFFFFFFF8;
      v24 = v3 & 0xC000000000000001;
      v21 = v4;
      v22 = (_QWORD *)(v3 + 32);
      v20 = a2 + 7;
      while (1)
      {
        if (v24)
        {
          v6 = (id)MEMORY[0x1DF0A5770](v5, v19);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v23 + 16))
          {
            __break(1u);
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
          v6 = (id)v22[v5];
        }
        v7 = v6;
        if (__OFADD__(v5++, 1))
          goto LABEL_31;
        v9 = objc_msgSend(v6, sel_identifier);
        v10 = sub_1DACA2D94();
        v3 = (unint64_t)v11;

        v12 = (_QWORD *)a2[2];
        if (v12)
          break;

        swift_bridgeObjectRelease();
LABEL_5:
        if (v5 == v4)
          return v25;
      }
      v13 = a2;
      v14 = a2[4] == v10 && a2[5] == v3;
      if (v14 || (sub_1DACA31B4() & 1) != 0)
        break;
      if (v12 == (_QWORD *)1)
      {
LABEL_27:

        swift_bridgeObjectRelease();
        goto LABEL_17;
      }
      v15 = v20;
      v16 = 1;
      while (1)
      {
        a2 = (_QWORD *)(v16 + 1);
        if (__OFADD__(v16, 1))
          break;
        v17 = *(v15 - 1) == v10 && *v15 == v3;
        if (v17 || (sub_1DACA31B4() & 1) != 0)
          goto LABEL_16;
        v15 += 2;
        ++v16;
        if (a2 == v12)
          goto LABEL_27;
      }
LABEL_32:
      __break(1u);
LABEL_33:
      v4 = sub_1DACA30E8();
      if (!v4)
        return MEMORY[0x1E0DEE9D8];
    }
LABEL_16:
    swift_bridgeObjectRelease();
    sub_1DACA3094();
    sub_1DACA30B8();
    sub_1DACA30C4();
    v3 = (unint64_t)&v25;
    sub_1DACA30A0();
LABEL_17:
    v4 = v21;
    a2 = v13;
    goto LABEL_5;
  }
  return MEMORY[0x1E0DEE9D8];
}

uint64_t sub_1DAC97B1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC483D0;
  v5[15] = a1;
  v5[16] = v4;
  return swift_task_switch();
}

uint64_t sub_1DAC97B80()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DAC97BA4()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC97BE0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1DAC6F4A4;
  return sub_1DAC963E8(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1DAC97C60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC6F4A4;
  v5[15] = a1;
  v5[16] = v4;
  return swift_task_switch();
}

unint64_t sub_1DAC97CC4()
{
  unint64_t result;

  result = qword_1EDAF2FB8;
  if (!qword_1EDAF2FB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDAF2FB8);
  }
  return result;
}

uint64_t sub_1DAC97D00(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0A60C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DAC97D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6[16] = a5;
  v6[17] = v5;
  v6[14] = a3;
  v6[15] = a4;
  v6[12] = a1;
  v6[13] = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C448);
  v6[18] = v7;
  v6[19] = *(_QWORD *)(v7 - 8);
  v6[20] = swift_task_alloc();
  v8 = sub_1DACA2B54();
  v6[21] = v8;
  v6[22] = *(_QWORD *)(v8 - 8);
  v6[23] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C450);
  v6[24] = v9;
  v6[25] = *(_QWORD *)(v9 - 8);
  v6[26] = swift_task_alloc();
  v10 = sub_1DACA2B30();
  v6[27] = v10;
  v6[28] = *(_QWORD *)(v10 - 8);
  v6[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C410);
  v6[30] = swift_task_alloc();
  v11 = sub_1DACA2AD0();
  v6[31] = v11;
  v6[32] = *(_QWORD *)(v11 - 8);
  v6[33] = swift_task_alloc();
  v6[34] = swift_task_alloc();
  v12 = sub_1DACA2C14();
  v6[35] = v12;
  v6[36] = *(_QWORD *)(v12 - 8);
  v6[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC97EAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  void *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = v0[36];
  v2 = v0[37];
  v3 = v0[35];
  v14 = v0[34];
  v15 = v0[32];
  v16 = v0[33];
  v17 = v0[31];
  v13 = v0[30];
  sub_1DACA2BE4();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v4 = *(void (**)(uint64_t, uint64_t))(v1 + 8);
  v0[38] = v4;
  v4(v2, v3);
  v5 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v6 = objc_msgSend(v5, sel_defaultEnvironment);
  v7 = sub_1DAC99928();
  v8 = MEMORY[0x1E0CF8938];
  v0[5] = v7;
  v0[6] = v8;
  v0[2] = v6;
  v9 = sub_1DACA2B60();
  swift_bridgeObjectRelease();
  v0[39] = v9;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v10 = sub_1DACA2ADC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v13, 1, 1, v10);
  swift_bridgeObjectRetain();
  sub_1DACA2AC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v16, v14, v17);
  swift_bridgeObjectRetain();
  sub_1DACA2B24();
  swift_getObjectType();
  sub_1DACA2B48();
  sub_1DACA2AB8();
  swift_allocObject();
  v0[40] = sub_1DACA2AAC();
  v11 = (_QWORD *)swift_task_alloc();
  v0[41] = v11;
  *v11 = v0;
  v11[1] = sub_1DAC981B0;
  return sub_1DACA2AE8();
}

uint64_t sub_1DAC981B0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 336) = v0;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v2[22] + 8))(v2[23], v2[21]);
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1DAC98238()
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
  _OWORD *v10;
  void *v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(v0 + 152);
  v1 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 144);
  sub_1DACA2B3C();
  sub_1DACA2B6C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(_QWORD *)(v0 + 272);
  v5 = *(_QWORD *)(v0 + 248);
  v6 = *(_QWORD *)(v0 + 224);
  v15 = *(_QWORD *)(v0 + 232);
  v16 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 208);
  v14 = *(_QWORD *)(v0 + 216);
  v9 = *(_QWORD *)(v0 + 192);
  v8 = *(_QWORD *)(v0 + 200);
  v11 = *(void **)(v0 + 88);
  v10 = *(_OWORD **)(v0 + 96);
  if (v11)
  {
    v12 = objc_msgSend(*(id *)(v0 + 88), sel_value);

    sub_1DACA2FE0();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v15, v14);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v4, v5);
  }
  else
  {
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v15, v14);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v4, v5);
    *v10 = 0u;
    v10[1] = 0u;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC983F4()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 304);
  v2 = *(_QWORD *)(v0 + 296);
  v4 = *(_QWORD *)(v0 + 272);
  v3 = *(_QWORD *)(v0 + 280);
  v9 = *(_QWORD *)(v0 + 256);
  v10 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 224);
  v8 = *(_QWORD *)(v0 + 216);
  sub_1DACA2BE4();
  sub_1DACA304C();
  swift_bridgeObjectRelease();
  swift_getErrorValue();
  sub_1DACA3214();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  v1(v2, v3);
  swift_willThrow();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC986DC(int a1, int a2, uint64_t a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  v5[10] = a5;
  v5[11] = _Block_copy(aBlock);
  v8 = sub_1DACA2D94();
  v10 = v9;
  v5[12] = v9;
  v11 = sub_1DACA2D94();
  v13 = v12;
  v5[13] = v12;
  if (a3)
    v14 = sub_1DACA2D58();
  else
    v14 = 0;
  v5[14] = v14;
  a5;
  v15 = (_QWORD *)swift_task_alloc();
  v5[15] = v15;
  *v15 = v5;
  v15[1] = sub_1DAC99B20;
  return sub_1DAC97D40((uint64_t)(v5 + 2), v8, v10, v11, v13);
}

uint64_t sub_1DAC987D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7[24] = a6;
  v7[25] = v6;
  v7[22] = a4;
  v7[23] = a5;
  v7[20] = a2;
  v7[21] = a3;
  v7[19] = a1;
  v8 = sub_1DACA2B84();
  v7[26] = v8;
  v7[27] = *(_QWORD *)(v8 - 8);
  v7[28] = swift_task_alloc();
  v9 = sub_1DACA2B18();
  v7[29] = v9;
  v7[30] = *(_QWORD *)(v9 - 8);
  v7[31] = swift_task_alloc();
  v10 = sub_1DACA2C14();
  v7[32] = v10;
  v7[33] = *(_QWORD *)(v10 - 8);
  v7[34] = swift_task_alloc();
  v7[35] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F028C410);
  v7[36] = swift_task_alloc();
  v11 = sub_1DACA2AD0();
  v7[37] = v11;
  v7[38] = *(_QWORD *)(v11 - 8);
  v7[39] = swift_task_alloc();
  v7[40] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC98900()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = 0x65756C6176;
  v1 = v0[36];
  v23 = v0[24];
  v2 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v3 = objc_msgSend(v2, sel_defaultEnvironment);
  v4 = sub_1DAC99928();
  v0[2] = v3;
  v5 = MEMORY[0x1E0CF8938];
  v0[5] = v4;
  v0[6] = v5;
  v6 = sub_1DACA2B60();
  swift_bridgeObjectRelease();
  v0[41] = v6;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v7 = sub_1DACA2ADC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v1, 1, 1, v7);
  swift_bridgeObjectRetain();
  sub_1DACA2AC4();
  if (v23
    && (v8 = v0[24], *(_QWORD *)(v8 + 16))
    && (v9 = sub_1DAC331BC(0x79747265706F7270, 0xEC000000656D614ELL), (v10 & 1) != 0))
  {
    v11 = (uint64_t *)(*(_QWORD *)(v8 + 56) + 16 * v9);
    v12 = v11[1];
    v24 = *v11;
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = 0xE500000000000000;
  }
  v0[42] = v24;
  v0[43] = v12;
  v19 = v0[38];
  v20 = v0[39];
  v21 = v0[37];
  v22 = v0[40];
  v13 = v0[35];
  v17 = v0[33];
  v18 = v0[32];
  sub_1DACA2BE4();
  sub_1DACA304C();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  v14 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
  v0[44] = v14;
  v14(v13, v18);
  sub_1DACA2B00();
  swift_bridgeObjectRetain();
  sub_1DACA2B0C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v20, v22, v21);
  sub_1DACA2B78();
  swift_getObjectType();
  v15 = (_QWORD *)swift_task_alloc();
  v0[45] = v15;
  *v15 = v0;
  v15[1] = sub_1DAC98C68;
  return sub_1DACA2AF4();
}

uint64_t sub_1DAC98C68(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 368) = a1;
  *(_QWORD *)(v3 + 376) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAC98CD4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);

  v1 = *(void **)(v0 + 368);
  if (v1)
  {
    swift_bridgeObjectRelease();
    v2 = (void *)sub_1DACA2FBC();
    if (v2)
    {
      v3 = v2;
      v4 = objc_msgSend(v2, sel_value);

      sub_1DACA2FE0();
      swift_unknownObjectRelease();
    }
    else
    {
      *(_OWORD *)(v0 + 56) = 0u;
      *(_OWORD *)(v0 + 72) = 0u;
    }
    sub_1DAC78C50(v0 + 56, v0 + 88);
    if (*(_QWORD *)(v0 + 112))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v7 = *(_QWORD *)(v0 + 272);
        v26 = *(_QWORD *)(v0 + 256);
        v28 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
        sub_1DACA2BE4();
        sub_1DACA304C();
        sub_1DACA2DDC();
        sub_1DACA2DDC();
        swift_bridgeObjectRelease();
        sub_1DACA2DDC();
        sub_1DACA2DDC();
        sub_1DACA2DDC();
        sub_1DACA2DDC();
        sub_1DACA2C98();

        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        v28(v7, v26);
      }
      else
      {

        swift_unknownObjectRelease();
      }
    }
    else
    {

      swift_unknownObjectRelease();
      sub_1DAC89BE4(v0 + 88);
    }
    v8 = *(_QWORD *)(v0 + 320);
    v9 = *(_QWORD *)(v0 + 296);
    v10 = *(_QWORD *)(v0 + 304);
    v12 = *(_QWORD *)(v0 + 240);
    v11 = *(_QWORD *)(v0 + 248);
    v13 = *(_QWORD *)(v0 + 232);
    v14 = *(_QWORD *)(v0 + 152);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 216) + 8))(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 208));
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v13);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
    sub_1DAC90858(v0 + 56, v14);
  }
  else
  {
    v24 = *(_QWORD *)(v0 + 304);
    v25 = *(_QWORD *)(v0 + 296);
    v27 = *(_QWORD *)(v0 + 320);
    v5 = *(_QWORD *)(v0 + 280);
    v18 = *(_QWORD *)(v0 + 256);
    v22 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    v23 = *(_QWORD *)(v0 + 248);
    v20 = *(_QWORD *)(v0 + 240);
    v21 = *(_QWORD *)(v0 + 232);
    v19 = *(_QWORD *)(v0 + 224);
    v16 = *(_QWORD *)(v0 + 216);
    v17 = *(_QWORD *)(v0 + 208);
    v6 = *(_OWORD **)(v0 + 152);
    sub_1DACA2BE4();
    sub_1DACA304C();
    sub_1DACA2DDC();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    sub_1DACA2DDC();
    sub_1DACA2DDC();
    sub_1DACA2DDC();
    sub_1DACA2CB0();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
    v22(v5, v18);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v19, v17);
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v23, v21);
    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v27, v25);
    *v6 = 0u;
    v6[1] = 0u;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC99128()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  v13 = *(_QWORD *)(v0 + 320);
  v11 = *(_QWORD *)(v0 + 304);
  v12 = *(_QWORD *)(v0 + 296);
  v1 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 240);
  v9 = *(_QWORD *)(v0 + 232);
  v10 = *(_QWORD *)(v0 + 248);
  v3 = *(_QWORD *)(v0 + 256);
  v4 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 224);
  sub_1DACA2BE4();
  sub_1DACA304C();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  swift_getErrorValue();
  sub_1DACA3214();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2CB0();
  swift_bridgeObjectRelease();
  v7(v1, v3);
  swift_willThrow();
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v10, v9);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAC994D0(int a1, int a2, uint64_t a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v5[10] = a5;
  v5[11] = _Block_copy(aBlock);
  v8 = sub_1DACA2D94();
  v10 = v9;
  v5[12] = v9;
  v11 = sub_1DACA2D94();
  v13 = v12;
  v5[13] = v12;
  if (a3)
    a3 = sub_1DACA2D58();
  v5[14] = a3;
  a5;
  v14 = (_QWORD *)swift_task_alloc();
  v5[15] = v14;
  *v14 = v5;
  v14[1] = sub_1DAC995CC;
  return sub_1DAC987D8((uint64_t)(v5 + 2), v8, v10, v11, v13, a3);
}

uint64_t sub_1DAC995CC()
{
  void *v0;
  uint64_t *v1;
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);

  v2 = (_QWORD *)*v1;
  v3 = *(void **)(*v1 + 80);
  v4 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v0)
  {
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))v2[11];
    v6 = (void *)sub_1DACA2818();

    ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v6);
    _Block_release(v5);
  }
  else
  {
    sub_1DAC90858((uint64_t)(v2 + 2), (uint64_t)(v2 + 6));
    v7 = v2[9];
    if (v7)
    {
      v8 = __swift_project_boxed_opaque_existential_1(v2 + 6, v2[9]);
      v9 = *(_QWORD *)(v7 - 8);
      v10 = swift_task_alloc();
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(v9 + 16))(v10, v8, v7);
      v11 = sub_1DACA31A8();
      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v7);
      swift_task_dealloc();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)(v2 + 6));
    }
    else
    {
      v11 = 0;
    }
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))v2[11];
    v12[2](v12, v11, 0);
    _Block_release(v12);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id AppIntentsHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id AppIntentsHelper.init()()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = &v0[OBJC_IVAR___TPSAppIntentsHelper_clientLabel];
  *(_QWORD *)v2 = 0xD000000000000019;
  *((_QWORD *)v2 + 1) = 0x80000001DACAF800;
  *(_WORD *)&v0[OBJC_IVAR___TPSAppIntentsHelper_source] = 3;
  v4.receiver = v0;
  v4.super_class = ObjectType;
  return objc_msgSendSuper2(&v4, sel_init);
}

id AppIntentsHelper.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AppIntentsHelper()
{
  return objc_opt_self();
}

uint64_t sub_1DAC998A0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1DAC483D0;
  return ((uint64_t (*)(int, int, uint64_t, void *, void *))((char *)&dword_1F028C3F8 + dword_1F028C3F8))(v2, v3, v4, v5, v6);
}

unint64_t sub_1DAC99928()
{
  unint64_t result;

  result = qword_1F028C418;
  if (!qword_1F028C418)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F028C418);
  }
  return result;
}

unint64_t sub_1DAC99964(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DACA3004();
  return sub_1DAC99A20(a1, v2);
}

uint64_t sub_1DAC99998()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_1DAC6F4A4;
  return ((uint64_t (*)(int, int, uint64_t, void *, void *))((char *)&dword_1F028C420 + dword_1F028C420))(v2, v3, v4, v5, v6);
}

unint64_t sub_1DAC99A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1DAC99AE4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1DF0A5710](v9, a1);
      sub_1DAC7EF38((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1DAC99AE4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1DAC99B24(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  unint64_t v30;

  v6 = sub_1DACA2C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAC45B80(a1, a2);
  v12 = v11;
  v14 = v13;
  if (v10 == a3)
  {
    sub_1DAC31E48(a3);
    v16 = v15;
    v18 = v17;
    sub_1DAC324C8(v12, v14);
    sub_1DAC4970C(v16, v18);
    v20 = v19;
    sub_1DAC33928(v12, v14);
    sub_1DAC33928(v16, v18);
    if ((v20 & 1) != 0)
    {
      sub_1DAC33928(v12, v14);
      return 1;
    }
    sub_1DACA2BFC();
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_1DACA304C();
    sub_1DACA2DDC();
    sub_1DAC324C8(v12, v14);
    sub_1DACA2908();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v12, v14);
    sub_1DACA2DDC();
    sub_1DAC31E48(a3);
    v24 = v23;
    v26 = v25;
    sub_1DACA2908();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DAC33928(v24, v26);
  }
  else
  {
    v22 = v10;
    sub_1DACA2BFC();
    v29 = 0;
    v30 = 0xE000000000000000;
    sub_1DACA304C();
    sub_1DACA2DDC();
    v28 = v22;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
    sub_1DACA2DDC();
    v28 = a3;
    sub_1DACA319C();
    sub_1DACA2DDC();
    swift_bridgeObjectRelease();
  }
  sub_1DACA2DDC();
  sub_1DACA2C98();
  swift_bridgeObjectRelease();
  sub_1DAC33928(v12, v14);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return 0;
}

_QWORD *sub_1DAC99E10(unint64_t a1, uint64_t a2, uint64_t a3)
{
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
  _QWORD *v16;
  uint64_t v18;

  swift_bridgeObjectRetain();
  sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  swift_bridgeObjectRelease();
  v6 = sub_1DAC381D0(a1);
  swift_bridgeObjectRelease();
  v7 = swift_bridgeObjectRetain();
  v8 = sub_1DAC8A468(v7);
  v9 = swift_bridgeObjectRetain();
  v10 = sub_1DAC8A468(v9);
  v11 = v10;
  if (*(_QWORD *)(v8 + 16) <= *(_QWORD *)(v10 + 16) >> 3)
  {
    v18 = v10;
    swift_bridgeObjectRetain();
    sub_1DAC9A448(v8);
    v12 = v18;
  }
  else
  {
    swift_bridgeObjectRetain();
    v12 = sub_1DAC8EDCC(v8, v11);
  }
  if (*(_QWORD *)(v11 + 16) <= *(_QWORD *)(v8 + 16) >> 3)
  {
    swift_bridgeObjectRetain();
    sub_1DAC9A448(v11);
    v13 = v8;
  }
  else
  {
    swift_bridgeObjectRetain();
    v13 = sub_1DAC8EDCC(v11, v8);
  }
  v14 = sub_1DAC9A5DC(v11, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v15 = sub_1DAC9B7C4(v14, a2, a3, 2, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v16 = sub_1DAC73630(v12);
  swift_bridgeObjectRelease();
  sub_1DAC73630(v15);
  swift_release();
  sub_1DAC73630(v13);
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1DAC99FE4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD v11[2];
  char v12;
  char v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FD8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC9BA2C();
  sub_1DACA3298();
  v13 = 0;
  sub_1DACA3184();
  if (!v3)
  {
    v11[1] = a3;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2F88);
    sub_1DAC9BD58(&qword_1EDAF2F90, (uint64_t (*)(void))sub_1DAC9BA70, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEA0B8]);
    sub_1DACA3178();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1DAC9A144()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000013;
  else
    return 0x6E6F6973726576;
}

uint64_t sub_1DAC9A184@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1DAC9BAB4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1DAC9A1A8()
{
  sub_1DAC9BA2C();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC9A1D0()
{
  sub_1DAC9BA2C();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC9A1F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_1DAC9BBA0(a1);
  if (!v2)
  {
    *(_WORD *)a2 = result;
    *(_QWORD *)(a2 + 8) = v5;
  }
  return result;
}

uint64_t sub_1DAC9A224(_QWORD *a1)
{
  unsigned __int16 *v1;

  return sub_1DAC99FE4(a1, *v1, *((_QWORD *)v1 + 1));
}

uint64_t sub_1DAC9A240()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_1DACA3250();
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC755D0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC9A2AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 8);
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC755D0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC9A2F8()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 8);
  sub_1DACA3250();
  sub_1DACA3268();
  swift_bridgeObjectRetain();
  sub_1DAC755D0((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC9A360(__int16 *a1, unsigned __int16 *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  char v12;

  v2 = (unsigned __int16)*a1;
  if (v2 != *a2)
    return 0;
  sub_1DAC31E48(*a1);
  v4 = v3;
  v6 = v5;
  sub_1DAC31E48(v2);
  v8 = v7;
  v10 = v9;
  sub_1DAC4970C(v4, v6);
  v12 = v11;
  sub_1DAC33928(v8, v10);
  sub_1DAC33928(v4, v6);
  return v12 & 1;
}

unint64_t sub_1DAC9A404()
{
  unint64_t result;

  result = qword_1F028C458;
  if (!qword_1F028C458)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA84A8, &type metadata for TipsClientState);
    atomic_store(result, (unint64_t *)&qword_1F028C458);
  }
  return result;
}

uint64_t sub_1DAC9A448(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1DAC9AC98(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1DAC9A5DC(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[2];

  v3 = isStackAllocationSafe;
  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  v6 = 8 * v5;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v6);
    v7 = sub_1DAC9A75C((uint64_t)v10 - ((v6 + 15) & 0x3FFFFFFFFFFFFFF0), v5, a2, v3);
    swift_release();
  }
  else
  {
    v8 = (void *)swift_slowAlloc();
    bzero(v8, v6);
    v7 = sub_1DAC9A75C((uint64_t)v8, v5, a2, v3);
    swift_release();
    MEMORY[0x1DF0A6190](v8, -1, -1);
  }
  return v7;
}

uint64_t sub_1DAC9A75C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t v28;
  unint64_t i;
  unint64_t v30;
  _QWORD *v31;
  BOOL v32;
  BOOL v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  BOOL v52;
  uint64_t v53;
  _QWORD *v54;
  BOOL v55;
  unint64_t *v57;
  uint64_t v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  int64_t v62;
  int64_t v63;

  v4 = a4;
  v5 = a3;
  v57 = (unint64_t *)result;
  if (*(_QWORD *)(a4 + 16) < *(_QWORD *)(a3 + 16))
  {
    v6 = 0;
    v58 = a4 + 56;
    v7 = 1 << *(_BYTE *)(a4 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(a4 + 56);
    v59 = (unint64_t)(v7 + 63) >> 6;
    v61 = 0;
    v10 = a3 + 56;
    while (1)
    {
      while (1)
      {
        if (v9)
        {
          v11 = __clz(__rbit64(v9));
          v9 &= v9 - 1;
          v62 = v6;
          v12 = v11 | (v6 << 6);
        }
        else
        {
          v13 = v6 + 1;
          if (__OFADD__(v6, 1))
          {
            __break(1u);
            goto LABEL_81;
          }
          if (v13 >= v59)
            goto LABEL_79;
          v14 = *(_QWORD *)(v58 + 8 * v13);
          v15 = v6 + 1;
          if (!v14)
          {
            v15 = v6 + 2;
            if (v6 + 2 >= v59)
              goto LABEL_79;
            v14 = *(_QWORD *)(v58 + 8 * v15);
            if (!v14)
            {
              v15 = v6 + 3;
              if (v6 + 3 >= v59)
                goto LABEL_79;
              v14 = *(_QWORD *)(v58 + 8 * v15);
              if (!v14)
              {
                v16 = v6 + 4;
                if (v6 + 4 >= v59)
                  goto LABEL_79;
                v14 = *(_QWORD *)(v58 + 8 * v16);
                if (!v14)
                {
                  while (1)
                  {
                    v15 = v16 + 1;
                    if (__OFADD__(v16, 1))
                      goto LABEL_83;
                    if (v15 >= v59)
                      goto LABEL_79;
                    v14 = *(_QWORD *)(v58 + 8 * v15);
                    ++v16;
                    if (v14)
                      goto LABEL_22;
                  }
                }
                v15 = v6 + 4;
              }
            }
          }
LABEL_22:
          v9 = (v14 - 1) & v14;
          v62 = v15;
          v12 = __clz(__rbit64(v14)) + (v15 << 6);
        }
        v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v12);
        v19 = *v17;
        v18 = v17[1];
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v20 = sub_1DACA3274();
        v21 = -1 << *(_BYTE *)(v5 + 32);
        v22 = v20 & ~v21;
        v23 = v22 >> 6;
        v24 = 1 << v22;
        if (((1 << v22) & *(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
          break;
LABEL_6:
        result = swift_bridgeObjectRelease();
        v6 = v62;
        v5 = a3;
        v4 = a4;
      }
      v25 = *(_QWORD *)(a3 + 48);
      v26 = (_QWORD *)(v25 + 16 * v22);
      v27 = *v26 == v19 && v26[1] == v18;
      if (!v27 && (sub_1DACA31B4() & 1) == 0)
      {
        v28 = ~v21;
        for (i = v22 + 1; ; i = v30 + 1)
        {
          v30 = i & v28;
          if (((*(_QWORD *)(v10 + (((i & v28) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v28)) & 1) == 0)
            break;
          v31 = (_QWORD *)(v25 + 16 * v30);
          v32 = *v31 == v19 && v31[1] == v18;
          if (v32 || (sub_1DACA31B4() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v23 = v30 >> 6;
            v24 = 1 << v30;
            goto LABEL_38;
          }
        }
        goto LABEL_6;
      }
      result = swift_bridgeObjectRelease();
LABEL_38:
      v6 = v62;
      v5 = a3;
      v57[v23] |= v24;
      v33 = __OFADD__(v61++, 1);
      v4 = a4;
      if (v33)
        goto LABEL_82;
    }
  }
  v34 = 0;
  v60 = a3 + 56;
  v61 = 0;
  v35 = 1 << *(_BYTE *)(a3 + 32);
  if (v35 < 64)
    v36 = ~(-1 << v35);
  else
    v36 = -1;
  v37 = v36 & *(_QWORD *)(a3 + 56);
  v63 = (unint64_t)(v35 + 63) >> 6;
  v38 = a4 + 56;
  while (1)
  {
    if (v37)
    {
      v39 = __clz(__rbit64(v37));
      v37 &= v37 - 1;
      v40 = v39 | (v34 << 6);
      goto LABEL_63;
    }
    v41 = v34 + 1;
    if (__OFADD__(v34, 1))
    {
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    if (v41 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v41);
    ++v34;
    if (!v42)
    {
      v34 = v41 + 1;
      if (v41 + 1 >= v63)
        goto LABEL_79;
      v42 = *(_QWORD *)(v60 + 8 * v34);
      if (!v42)
      {
        v34 = v41 + 2;
        if (v41 + 2 >= v63)
          goto LABEL_79;
        v42 = *(_QWORD *)(v60 + 8 * v34);
        if (!v42)
          break;
      }
    }
LABEL_62:
    v37 = (v42 - 1) & v42;
    v40 = __clz(__rbit64(v42)) + (v34 << 6);
LABEL_63:
    v44 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v40);
    v46 = *v44;
    v45 = v44[1];
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    v47 = sub_1DACA3274();
    v48 = -1 << *(_BYTE *)(v4 + 32);
    v49 = v47 & ~v48;
    if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
      goto LABEL_46;
    v50 = *(_QWORD *)(a4 + 48);
    v51 = (_QWORD *)(v50 + 16 * v49);
    v52 = *v51 == v46 && v51[1] == v45;
    if (v52 || (sub_1DACA31B4() & 1) != 0)
    {
LABEL_76:
      result = swift_bridgeObjectRelease();
      *(unint64_t *)((char *)v57 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
      v33 = __OFADD__(v61++, 1);
      v5 = a3;
      v4 = a4;
      if (v33)
      {
        __break(1u);
LABEL_79:
        swift_retain();
        return sub_1DAC8FA2C(v57, a2, v61, v5);
      }
    }
    else
    {
      v53 = ~v48;
      while (1)
      {
        v49 = (v49 + 1) & v53;
        if (((*(_QWORD *)(v38 + ((v49 >> 3) & 0xFFFFFFFFFFFFF8)) >> v49) & 1) == 0)
          break;
        v54 = (_QWORD *)(v50 + 16 * v49);
        v55 = *v54 == v46 && v54[1] == v45;
        if (v55 || (sub_1DACA31B4() & 1) != 0)
          goto LABEL_76;
      }
LABEL_46:
      result = swift_bridgeObjectRelease();
      v5 = a3;
      v4 = a4;
    }
  }
  v43 = v41 + 3;
  if (v43 >= v63)
    goto LABEL_79;
  v42 = *(_QWORD *)(v60 + 8 * v43);
  if (v42)
  {
    v34 = v43;
    goto LABEL_62;
  }
  while (1)
  {
    v34 = v43 + 1;
    if (__OFADD__(v43, 1))
      break;
    if (v34 >= v63)
      goto LABEL_79;
    v42 = *(_QWORD *)(v60 + 8 * v34);
    ++v43;
    if (v42)
      goto LABEL_62;
  }
LABEL_84:
  __break(1u);
  return result;
}

uint64_t sub_1DAC9AC98(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1DACA3250();
  swift_bridgeObjectRetain();
  sub_1DACA2DD0();
  v6 = sub_1DACA3274();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1DACA31B4() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1DACA31B4() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1DAC8FE58();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1DAC9AE24(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

unint64_t sub_1DAC9AE24(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1DACA2FF8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1DACA3250();
        swift_bridgeObjectRetain();
        sub_1DACA2DD0();
        v10 = sub_1DACA3274();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_1DAC9AFE8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  uint64_t *v33;
  uint64_t v37;
  uint64_t v38;
  int64_t v39;

  v5 = a5;
  v6 = a4;
  v7 = 0;
  v8 = 0;
  v11 = *(_QWORD *)(a3 + 56);
  v9 = a3 + 56;
  v10 = v11;
  v12 = 1 << *(_BYTE *)(v9 - 24);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v10;
  v38 = v9;
  v39 = (unint64_t)(v12 + 63) >> 6;
  while (2)
  {
    v37 = v7;
    while (1)
    {
      if (v14)
      {
        v15 = __clz(__rbit64(v14));
        v14 &= v14 - 1;
        v16 = v15 | (v8 << 6);
      }
      else
      {
        if (__OFADD__(v8++, 1))
        {
          __break(1u);
          JUMPOUT(0x1DAC9B720);
        }
        if (v8 >= v39)
          goto LABEL_41;
        v18 = *(_QWORD *)(v38 + 8 * v8);
        if (!v18)
        {
          v19 = v8 + 1;
          if (v8 + 1 >= v39)
            goto LABEL_41;
          v18 = *(_QWORD *)(v38 + 8 * v19);
          if (!v18)
          {
            v19 = v8 + 2;
            if (v8 + 2 >= v39)
              goto LABEL_41;
            v18 = *(_QWORD *)(v38 + 8 * v19);
            if (!v18)
            {
              v19 = v8 + 3;
              if (v8 + 3 >= v39)
                goto LABEL_41;
              v18 = *(_QWORD *)(v38 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v8 = v19 + 1;
                  if (__OFADD__(v19, 1))
                  {
                    __break(1u);
                    JUMPOUT(0x1DAC9B734);
                  }
                  if (v8 >= v39)
                    goto LABEL_41;
                  v18 = *(_QWORD *)(v38 + 8 * v8);
                  ++v19;
                  if (v18)
                    goto LABEL_19;
                }
              }
            }
          }
          v8 = v19;
        }
LABEL_19:
        v14 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v8 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v16);
      v21 = *v20;
      v22 = v20[1];
      v23 = *(_QWORD *)(v6 + 16);
      swift_bridgeObjectRetain();
      if (v23)
      {
        swift_bridgeObjectRetain();
        v24 = sub_1DAC331BC(v21, v22);
        if ((v25 & 1) != 0)
        {
          v26 = (uint64_t *)(*(_QWORD *)(v6 + 56) + 16 * v24);
          v27 = *v26;
          v28 = v26[1];
          sub_1DAC324C8(*v26, v28);
        }
        else
        {
          v27 = 0;
          v28 = 0xF000000000000000;
        }
        swift_bridgeObjectRelease();
        if (!*(_QWORD *)(v5 + 16))
        {
LABEL_24:
          v29 = 0;
          v30 = 0xF000000000000000;
          goto LABEL_31;
        }
      }
      else
      {
        v27 = 0;
        v28 = 0xF000000000000000;
        if (!*(_QWORD *)(v5 + 16))
          goto LABEL_24;
      }
      swift_bridgeObjectRetain();
      v31 = sub_1DAC331BC(v21, v22);
      if ((v32 & 1) != 0)
      {
        v33 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v31);
        v29 = *v33;
        v30 = v33[1];
        sub_1DAC324C8(*v33, v30);
      }
      else
      {
        v29 = 0;
        v30 = 0xF000000000000000;
      }
      swift_bridgeObjectRelease();
LABEL_31:
      if (v28 >> 60 != 15)
        break;
      if (v30 >> 60 != 15)
        goto LABEL_38;
      swift_bridgeObjectRelease();
      v6 = a4;
      v5 = a5;
    }
    if (v30 >> 60 != 15)
      __asm { BR              X8 }
LABEL_38:
    sub_1DAC3396C(v27, v28);
    sub_1DAC3396C(v29, v30);
    swift_bridgeObjectRelease();
    v6 = a4;
    v5 = a5;
    *(unint64_t *)((char *)a1 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v7 = v37 + 1;
    if (!__OFADD__(v37, 1))
      continue;
    break;
  }
  __break(1u);
LABEL_41:
  swift_retain();
  return sub_1DAC8FA2C(a1, a2, v37, a3);
}

uint64_t sub_1DAC9B7C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char v9;
  unsigned int v10;
  unint64_t v11;
  size_t v12;
  uint64_t isStackAllocationSafe;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = *(_BYTE *)(a1 + 32);
  v10 = v9 & 0x3F;
  v11 = (unint64_t)((1 << v9) + 63) >> 6;
  v12 = 8 * v11;
  swift_bridgeObjectRetain_n();
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v10 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0), v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_1DAC9AFE8((_QWORD *)((char *)v17 - ((v12 + 15) & 0x3FFFFFFFFFFFFFF0)), v11, a1, a3, a5);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v5)
      swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = (void *)swift_slowAlloc();
    bzero(v15, v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = sub_1DAC9AFE8((unint64_t *)v15, v11, a1, a3, a5);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    MEMORY[0x1DF0A6190](v15, -1, -1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

ValueMetadata *type metadata accessor for TipsClientState()
{
  return &type metadata for TipsClientState;
}

unint64_t sub_1DAC9BA00(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1DAC90BF0();
  result = sub_1DAC90BAC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1DAC9BA2C()
{
  unint64_t result;

  result = qword_1EDAF2ED0;
  if (!qword_1EDAF2ED0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8654, &type metadata for TipsClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF2ED0);
  }
  return result;
}

unint64_t sub_1DAC9BA70()
{
  unint64_t result;

  result = qword_1EDAF2EC8;
  if (!qword_1EDAF2EC8)
  {
    result = MEMORY[0x1DF0A60C4](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EDAF2EC8);
  }
  return result;
}

uint64_t sub_1DAC9BAB4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000;
  if (v2 || (sub_1DACA31B4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x80000001DACAF9F0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_1DACA31B4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1DAC9BBA0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FD0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_1DAC452E8(MEMORY[0x1E0DEE9D8]);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_1DAC9BA2C();
  sub_1DACA328C();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    v9[31] = 0;
    v7 = sub_1DACA3148();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2F88);
    v9[30] = 1;
    sub_1DAC9BD58(&qword_1EDAF2F98, (uint64_t (*)(void))sub_1DAC496C8, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEA0D8]);
    sub_1DACA313C();
    swift_bridgeObjectRelease();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

uint64_t sub_1DAC9BD58(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDAF2F88);
    v10[0] = a3;
    v10[1] = a2();
    result = MEMORY[0x1DF0A60C4](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TipsClientState.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DAC9BE18 + 4 * byte_1DACA84A1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1DAC9BE4C + 4 * byte_1DACA849C[v4]))();
}

uint64_t sub_1DAC9BE4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC9BE54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DAC9BE5CLL);
  return result;
}

uint64_t sub_1DAC9BE68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DAC9BE70);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1DAC9BE74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DAC9BE7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TipsClientState.CodingKeys()
{
  return &type metadata for TipsClientState.CodingKeys;
}

unint64_t sub_1DAC9BE9C()
{
  unint64_t result;

  result = qword_1F028C460;
  if (!qword_1F028C460)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA862C, &type metadata for TipsClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C460);
  }
  return result;
}

unint64_t sub_1DAC9BEE4()
{
  unint64_t result;

  result = qword_1EDAF2EE0;
  if (!qword_1EDAF2EE0)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA859C, &type metadata for TipsClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF2EE0);
  }
  return result;
}

unint64_t sub_1DAC9BF2C()
{
  unint64_t result;

  result = qword_1EDAF2ED8;
  if (!qword_1EDAF2ED8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA85C4, &type metadata for TipsClientState.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF2ED8);
  }
  return result;
}

uint64_t static TipKitContentManager.updateContent(meta:documents:clientConditions:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F028C470 + dword_1F028C470);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC9BFDC;
  return v7(a1, a2);
}

uint64_t sub_1DAC9BFDC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    v5 = 0;
  else
    v5 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_1DAC9C180(uint64_t a1, uint64_t a2, uint64_t a3, void *aBlock)
{
  _QWORD *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);

  v4[2] = _Block_copy(aBlock);
  if (a1)
    a1 = sub_1DACA2D58();
  v4[3] = a1;
  if (a2)
    a2 = sub_1DACA2D58();
  v4[4] = a2;
  if (a3)
    v8 = sub_1DACA2F14();
  else
    v8 = 0;
  v4[5] = v8;
  v11 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F028C470 + dword_1F028C470);
  v9 = (_QWORD *)swift_task_alloc();
  v4[6] = v9;
  *v9 = v4;
  v9[1] = sub_1DAC9C284;
  return v11(a1, a2);
}

uint64_t sub_1DAC9C284(char a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *v2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v1)
  {
    v6 = (void *)sub_1DACA2818();

    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, a1 & 1, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id TipKitContentManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TipKitContentManager.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id TipKitContentManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DAC9C40C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DAC6F4A4;
  return v6();
}

uint64_t sub_1DAC9C460(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DAC6F4A4;
  return v7();
}

uint64_t sub_1DAC9C4B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DACA2EE4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DACA2ED8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DAC6F310(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DACA2E84();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

_QWORD *sub_1DAC9C5F8(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1DAC73B54(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1DAC9C614(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1DAC73B68(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_1DAC9C630(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_1DAC73B7C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1DAC9C64C(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1DAC73C80(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_1DAC9C668(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_1DAC73C94(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1DAC9C684(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  unint64_t v4;
  size_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v2 = isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_1DAC9C7D4((uint64_t)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v4, v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_1DAC9C7D4((uint64_t)v7, v4, v2);
    MEMORY[0x1DF0A6190](v7, -1, -1);
  }
  return v2;
}

uint64_t sub_1DAC9C7D4(uint64_t result, uint64_t a2, uint64_t a3)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  unint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  char v22[32];
  uint64_t v23;

  v19 = (unint64_t *)result;
  v20 = 0;
  v4 = 0;
  v5 = a3 + 64;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (v8)
  {
    v10 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    v11 = v10 | (v4 << 6);
LABEL_18:
    v15 = *(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v11);
    if (*(_QWORD *)(v15 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v16 = sub_1DAC331BC(0xD000000000000010, 0x80000001DACAFAB0);
      if ((v17 & 1) != 0
        && (sub_1DAC7EF6C(*(_QWORD *)(v15 + 56) + 32 * v16, (uint64_t)v22),
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35D8),
            (swift_dynamicCast() & 1) != 0))
      {
        v21 = *(_QWORD *)(v23 + 16);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if (v21)
        {
          *(unint64_t *)((char *)v19 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
          v12 = __OFADD__(v20++, 1);
          if (v12)
            goto LABEL_32;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
      }
    }
  }
  v12 = __OFADD__(v4++, 1);
  if (v12)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (v4 >= v9)
    return sub_1DAC9CD04(v19, a2, v20, a3);
  v13 = *(_QWORD *)(v5 + 8 * v4);
  if (v13)
  {
LABEL_17:
    v8 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v4 << 6);
    goto LABEL_18;
  }
  v14 = v4 + 1;
  if (v4 + 1 >= v9)
    return sub_1DAC9CD04(v19, a2, v20, a3);
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v4 + 2;
  if (v4 + 2 >= v9)
    return sub_1DAC9CD04(v19, a2, v20, a3);
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
    goto LABEL_16;
  v14 = v4 + 3;
  if (v4 + 3 >= v9)
    return sub_1DAC9CD04(v19, a2, v20, a3);
  v13 = *(_QWORD *)(v5 + 8 * v14);
  if (v13)
  {
LABEL_16:
    v4 = v14;
    goto LABEL_17;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v9)
      return sub_1DAC9CD04(v19, a2, v20, a3);
    v13 = *(_QWORD *)(v5 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_17;
  }
LABEL_31:
  __break(1u);
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_1DAC9CA48(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  unint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3910);
  result = sub_1DACA3118();
  v9 = result;
  v39 = a1;
  v40 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v41 = v11;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v40)
        return v9;
      v16 = v39[v15];
      v17 = v11 + 1;
      if (!v16)
      {
        v17 = v11 + 2;
        if (v11 + 2 >= v40)
          return v9;
        v16 = v39[v17];
        if (!v16)
        {
          v17 = v11 + 3;
          if (v11 + 3 >= v40)
            return v9;
          v16 = v39[v17];
          if (!v16)
          {
            v18 = v11 + 4;
            if (v11 + 4 >= v40)
              return v9;
            v16 = v39[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v17 >= v40)
                  return v9;
                v16 = v39[v17];
                ++v18;
                if (v16)
                  goto LABEL_24;
              }
            }
            v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v41 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = 16 * v14;
    v20 = v4;
    v21 = (uint64_t *)(*(_QWORD *)(v4 + 48) + v19);
    v23 = *v21;
    v22 = v21[1];
    v24 = (uint64_t *)(*(_QWORD *)(v4 + 56) + v19);
    v25 = *v24;
    v26 = v24[1];
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v27 = -1 << *(_BYTE *)(v9 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      v30 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v33 = v29 == v32;
        if (v29 == v32)
          v29 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v29);
      }
      while (v34 == -1);
      v30 = __clz(__rbit64(~v34)) + (v29 << 6);
    }
    *(_QWORD *)(v12 + ((v30 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v30;
    v35 = 16 * v30;
    v36 = (_QWORD *)(*(_QWORD *)(v9 + 48) + v35);
    *v36 = v23;
    v36[1] = v22;
    v37 = (_QWORD *)(*(_QWORD *)(v9 + 56) + v35);
    *v37 = v25;
    v37[1] = v26;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    v4 = v20;
    v11 = v41;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1DAC9CD04(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t *v32;
  uint64_t v33;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3650);
  result = sub_1DACA3118();
  v9 = result;
  v32 = a1;
  v33 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v33)
        return v9;
      v16 = v32[v15];
      ++v11;
      if (!v16)
      {
        v11 = v15 + 1;
        if (v15 + 1 >= v33)
          return v9;
        v16 = v32[v11];
        if (!v16)
        {
          v11 = v15 + 2;
          if (v15 + 2 >= v33)
            return v9;
          v16 = v32[v11];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v33)
              return v9;
            v16 = v32[v17];
            if (!v16)
            {
              while (1)
              {
                v11 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_41;
                if (v11 >= v33)
                  return v9;
                v16 = v32[v11];
                ++v17;
                if (v16)
                  goto LABEL_24;
              }
            }
            v11 = v17;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v14 = __clz(__rbit64(v16)) + (v11 << 6);
    }
    v18 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v14);
    sub_1DACA3250();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DACA2DD0();
    result = sub_1DACA3274();
    v22 = -1 << *(_BYTE *)(v9 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6))) != 0)
    {
      v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v12 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v24);
      }
      while (v29 == -1);
      v25 = __clz(__rbit64(~v29)) + (v24 << 6);
    }
    *(_QWORD *)(v12 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    v30 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v25);
    *v30 = v20;
    v30[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v25) = v21;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v9;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1DAC9CF9C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v2[33] = a1;
  v2[34] = a2;
  v3 = sub_1DACA2C14();
  v2[35] = v3;
  v2[36] = *(_QWORD *)(v3 - 8);
  v2[37] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DAC9CFFC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  char v27;
  void *v28;
  uint64_t v29;
  _OWORD *v30;
  uint64_t v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = *(_QWORD *)(v0 + 264);
  if (!v1)
    goto LABEL_12;
  if (!*(_QWORD *)(v1 + 16))
    goto LABEL_12;
  v2 = sub_1DAC331BC(0x79726576696C6564, 0xEC0000006F666E49);
  if ((v3 & 1) == 0)
    goto LABEL_12;
  sub_1DAC7EF6C(*(_QWORD *)(v1 + 56) + 32 * v2, v0 + 16);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF3598);
  if (!swift_dynamicCast())
    goto LABEL_12;
  v5 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 248);
  if (!v5
    || !*(_QWORD *)(v5 + 16)
    || (v7 = sub_1DAC331BC(0x746E656D75636F64, 0xE900000000000073), (v8 & 1) == 0)
    || (sub_1DAC7EF6C(*(_QWORD *)(v5 + 56) + 32 * v7, v0 + 80),
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF35D0),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
LABEL_12:
    v14 = *(_QWORD *)(v0 + 288);
    v13 = *(_QWORD *)(v0 + 296);
    v15 = *(_QWORD *)(v0 + 280);
    sub_1DACA2BF0();
    sub_1DACA2CA4();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    goto LABEL_13;
  }
  v32 = (_OWORD *)(v0 + 48);
  v30 = (_OWORD *)(v0 + 208);
  v10 = *(_QWORD *)(v0 + 240);
  v29 = sub_1DAC9C684(v6);
  swift_bridgeObjectRelease();
  v34 = MEMORY[0x1E0DEE9D8];
  v11 = *(_QWORD *)(v10 + 16);
  v31 = v9;
  if (v11)
  {
    v12 = (uint64_t *)(v10 + 32);
    v33 = MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v17 = *v12;
      if (*(_QWORD *)(*v12 + 16))
      {
        swift_bridgeObjectRetain();
        v18 = sub_1DAC331BC(0x746E65746E6F63, 0xE700000000000000);
        if ((v19 & 1) != 0)
        {
          sub_1DAC7EF6C(*(_QWORD *)(v17 + 56) + 32 * v18, v0 + 144);
          if ((swift_dynamicCast() & 1) != 0)
          {
            if (*(_QWORD *)(*(_QWORD *)(v0 + 256) + 16))
            {
              sub_1DAC331BC(1768843629, 0xE400000000000000);
              v21 = v20;
              swift_bridgeObjectRelease();
              if ((v21 & 1) != 0)
              {
                v22 = v33;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                {
                  sub_1DAC9C614(0, *(_QWORD *)(v33 + 16) + 1, 1);
                  v22 = v34;
                }
                v24 = *(_QWORD *)(v22 + 16);
                v23 = *(_QWORD *)(v22 + 24);
                v25 = v24 + 1;
                if (v24 >= v23 >> 1)
                {
                  sub_1DAC9C614((_QWORD *)(v23 > 1), v24 + 1, 1);
                  v25 = v24 + 1;
                  v22 = v34;
                }
                *(_QWORD *)(v22 + 16) = v25;
                v33 = v22;
                *(_QWORD *)(v22 + 8 * v24 + 32) = v17;
                goto LABEL_16;
              }
            }
            else
            {
              swift_bridgeObjectRelease();
            }
          }
        }
        swift_bridgeObjectRelease();
      }
LABEL_16:
      ++v12;
      if (!--v11)
        goto LABEL_29;
    }
  }
  v33 = MEMORY[0x1E0DEE9D8];
LABEL_29:
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 200) = v4;
  *(_QWORD *)(v0 + 176) = v29;
  sub_1DAC33D7C((_OWORD *)(v0 + 176), v30);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_1DAC84D50(v30, 0x79726576696C6564, 0xEC0000006F666E49, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 136) = v31;
  *(_QWORD *)(v0 + 112) = v33;
  sub_1DAC33D7C((_OWORD *)(v0 + 112), v32);
  v27 = swift_isUniquelyReferenced_nonNull_native();
  sub_1DAC84D50(v32, 0x746E656D75636F64, 0xE900000000000073, v27);
  swift_bridgeObjectRelease();
  v28 = (void *)sub_1DACA2D40();
  *(_QWORD *)(v0 + 304) = v28;
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF36E8);
  sub_1DACA2D4C();
  *(_QWORD *)(v0 + 312) = 0;

LABEL_13:
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1DAC9D4B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DAC9D520()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_1DAC9D560()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t type metadata accessor for TipKitContentManager()
{
  return objc_opt_self();
}

uint64_t sub_1DAC9D5CC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1DAC9D608()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1DAC483D0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))((char *)&dword_1F028C478 + dword_1F028C478))(v2, v3, v4, v5);
}

uint64_t sub_1DAC9D690()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAC9D6B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DAC483D0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F028C498 + dword_1F028C498))(a1, v4);
}

id CloudDeviceHasPhoneOrPadValidation.__allocating_init(targetContext:)()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithTargetContext_, v2);

  return v3;
}

id CloudDeviceHasPhoneOrPadValidation.init(targetContext:)()
{
  void *v0;
  void *v1;
  id v2;
  objc_super v4;

  v1 = (void *)sub_1DACA2D40();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  v2 = objc_msgSendSuper2(&v4, sel_initWithTargetContext_, v1);

  return v2;
}

id CloudDeviceHasPhoneOrPadValidation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CloudDeviceHasPhoneOrPadValidation.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CloudDeviceHasPhoneOrPadValidation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CloudDeviceHasPhoneOrPadValidation()
{
  return objc_opt_self();
}

uint64_t sub_1DAC9DA04(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v15;
  unsigned int v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v25 = a2;
  v3 = sub_1DACA2C14();
  v23 = *(_QWORD *)(v3 - 8);
  v24 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_idsDevices);
  sub_1DAC6F8C8();
  v7 = sub_1DACA2E3C();

  if (v7 >> 62)
    goto LABEL_22;
  v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v8; v8 = sub_1DACA30E8())
  {
    v9 = 4;
    while (1)
    {
      v10 = (v7 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1DF0A5770](v9 - 4, v7) : *(id *)(v7 + 8 * v9);
      v11 = v10;
      v12 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      v13 = objc_msgSend(v10, sel_deviceType);

      if (v13 == (id)2 || v13 == (id)4)
      {
        v15 = 1;
        goto LABEL_15;
      }
      ++v9;
      if (v12 == v8)
        goto LABEL_13;
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
  }
LABEL_13:
  v15 = 0;
LABEL_15:
  swift_bridgeObjectRelease_n();
  v16 = objc_msgSend(a1, sel_BOOLValue);
  sub_1DACA2C08();
  v26 = 0;
  v27 = 0xE000000000000000;
  sub_1DACA304C();
  v17 = objc_msgSend(a1, sel_name);
  if (v17)
  {
    v18 = v17;
    sub_1DACA2D94();

  }
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  v19 = objc_msgSend(a1, sel_targetContext);
  if (v19)
  {
    v20 = v19;
    sub_1DACA2D58();

  }
  else
  {
    sub_1DAC767D8(MEMORY[0x1E0DEE9D8]);
  }
  sub_1DACA2D64();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DACA2DDC();
  sub_1DACA2DDC();
  swift_bridgeObjectRelease();
  sub_1DACA2C8C();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v25 + 16))(v25, v15 ^ v16 ^ 1, 0);
}

uint64_t sub_1DAC9DD5C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1DAC9DDB8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_1DAC9DDE4()
{
  sub_1DAC9DDB8();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for CoreSpotlightIndexer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CoreSpotlightIndexer);
}

uint64_t sub_1DAC9DE08()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DAC9DE14()
{
  return sub_1DAC9DE08();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0A6064](a1, v6, a5);
}

uint64_t destroy for ClientStateMetaData(uint64_t a1)
{
  return sub_1DAC33928(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t _s10TipsDaemon19ClientStateMetaDataVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1DAC324C8(v3, v4);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

uint64_t assignWithCopy for ClientStateMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  sub_1DAC324C8(v3, v4);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  sub_1DAC33928(v5, v6);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for ClientStateMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  sub_1DAC33928(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientStateMetaData(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 16) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 16) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ClientStateMetaData(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 16) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientStateMetaData()
{
  return &type metadata for ClientStateMetaData;
}

uint64_t sub_1DAC9E000(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v13 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDAF2FE0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1DAC47FA0();
  sub_1DACA3298();
  LOBYTE(v14) = 0;
  sub_1DACA3184();
  if (!v4)
  {
    v14 = a3;
    v15 = v13;
    v16 = 1;
    sub_1DAC9BA70();
    sub_1DACA3178();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1DAC9E13C(char *a1, char *a2)
{
  return sub_1DAC79D8C(*a1, *a2);
}

uint64_t sub_1DAC9E148()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC9E1B8()
{
  sub_1DACA2DD0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAC9E204()
{
  sub_1DACA3250();
  sub_1DACA2DD0();
  swift_bridgeObjectRelease();
  return sub_1DACA3274();
}

uint64_t sub_1DAC9E270@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

void sub_1DAC9E2CC(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 118;
  if (*v1)
    v2 = 0x6873616863;
  v3 = 0xE100000000000000;
  if (*v1)
    v3 = 0xE500000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1DAC9E2FC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_1DACA3124();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_1DAC9E35C()
{
  sub_1DAC47FA0();
  return sub_1DACA32A4();
}

uint64_t sub_1DAC9E384()
{
  sub_1DAC47FA0();
  return sub_1DACA32B0();
}

uint64_t sub_1DAC9E3AC(_QWORD *a1)
{
  unsigned __int16 *v1;

  return sub_1DAC9E000(a1, *v1, *((_QWORD *)v1 + 1), *((_QWORD *)v1 + 2));
}

ValueMetadata *type metadata accessor for ClientStateMetaData.CodingKeys()
{
  return &type metadata for ClientStateMetaData.CodingKeys;
}

unint64_t sub_1DAC9E3DC()
{
  unint64_t result;

  result = qword_1F028C4A8;
  if (!qword_1F028C4A8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA8988, &type metadata for ClientStateMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1F028C4A8);
  }
  return result;
}

unint64_t sub_1DAC9E424()
{
  unint64_t result;

  result = qword_1EDAF3100;
  if (!qword_1EDAF3100)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA88C0, &type metadata for ClientStateMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF3100);
  }
  return result;
}

unint64_t sub_1DAC9E46C()
{
  unint64_t result;

  result = qword_1EDAF30F8;
  if (!qword_1EDAF30F8)
  {
    result = MEMORY[0x1DF0A60C4](&unk_1DACA88E8, &type metadata for ClientStateMetaData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EDAF30F8);
  }
  return result;
}

void __getCoreTelephonyClientClass_block_invoke_cold_1()
{
  void *v0;
  char v1;
  NSObject *v2;

  v0 = (void *)abort_report_np();
  -[TPSDictationLanguageValidation validateWithCompletion:].cold.1(v0, v1, v2);
}

uint64_t __getCTCellularPlanManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSHeadEnrollmentValidation validateWithCompletion:].cold.1(v0);
}

void __getPKPassLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;
  char v1;
  os_log_t v2;

  v0 = abort_report_np();
  +[TPSTargetingValidator validateConditions:joinType:context:cache:completionQueue:completionHandler:].cold.1(v0, v1, v2);
}

uint64_t __getAFPreferencesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getVTPreferencesClass_block_invoke_cold_1(v0);
}

void __getVTPreferencesClass_block_invoke_cold_1()
{
  abort_report_np();
  __199__TPSTipsManager_contentWithMetaDictionary_documents_isRemote_processTipKitContent_contextualEligibility_widgetEligibility_notificationEligibility_preferredNotificationIdentifiers_completionHandler___block_invoke_6_cold_1();
}

uint64_t __getHKMedicalIDStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSContactsTrustedAccountValidation validateBeneficiaryAssignmentWithCompletion:].cold.1(v0);
}

uint64_t __getHMClientConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSAppStoreRegionValidation validateWithCompletion:].cold.1(v0);
}

uint64_t __getPKAccountServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __52__TPSPairedAirTagValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

void __getSPBeaconManagerClass_block_invoke_cold_1()
{
  void *v0;
  char v1;
  NSObject *v2;

  v0 = (void *)abort_report_np();
  -[TPSPairedWatchValidation validateWithCompletion:].cold.1(v0, v1, v2);
}

uint64_t __getSTManagementStateClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSNRElectrocardiogramValidation validateWithCompletion:].cold.1(v0);
}

uint64_t __getHKHeartRhythmAvailabilityClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKHealthStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getHKHealthStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKFeatureStatusManagerClass_block_invoke_cold_1(v0);
}

void __getHKFeatureStatusManagerClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  -[TPSNRDeviceCapabilityValidation validateWithCompletion:].cold.1(v0, v1);
}

void __getHKHealthChecklistUtilitiesClass_block_invoke_cold_1()
{
  void *v0;
  NSObject *v1;

  v0 = (void *)abort_report_np();
  -[TPSInclusivityCondition _valuesFromValueTypeArray:].cold.1(v0, v1);
}

uint64_t __getFMDFMIPManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSSleepSetupValidation validateWithCompletion:].cold.1(v0);
}

uint64_t __getHKSPSleepStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __51__TPSExcludeAppsValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getASDSubscriptionEntitlementsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __59__TPSHRAccountInfoStatusValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getHKHealthRecordsAccountInfoStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __51__TPSFamilyChildValidation_validateWithCompletion___block_invoke_cold_1(v0);
}

uint64_t __getASDIAPHistoryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __81__TPSEventsHistoryController_processEventProviderQueryResults_completionHandler___block_invoke_cold_1(v0);
}

uint64_t __getCRUsageInformationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[TPSUserTypesValidation validateWithCompletion:].cold.1(v0);
}

uint64_t sub_1DACA26B0()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_1DACA26BC()
{
  return MEMORY[0x1E0C90778]();
}

uint64_t sub_1DACA26C8()
{
  return MEMORY[0x1E0C91458]();
}

uint64_t sub_1DACA26D4()
{
  return MEMORY[0x1E0C914D0]();
}

uint64_t sub_1DACA26E0()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1DACA26EC()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1DACA26F8()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1DACA2704()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1DACA2710()
{
  return MEMORY[0x1E0C91930]();
}

uint64_t sub_1DACA271C()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_1DACA2728()
{
  return MEMORY[0x1E0CADEE8]();
}

uint64_t sub_1DACA2734()
{
  return MEMORY[0x1E0CADF10]();
}

uint64_t sub_1DACA2740()
{
  return MEMORY[0x1E0CADF50]();
}

uint64_t sub_1DACA274C()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1DACA2758()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1DACA2764()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1DACA2770()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1DACA277C()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1DACA2788()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1DACA2794()
{
  return MEMORY[0x1E0CAE8A8]();
}

uint64_t sub_1DACA27A0()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1DACA27AC()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1DACA27B8()
{
  return MEMORY[0x1E0CAE8D8]();
}

uint64_t sub_1DACA27C4()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1DACA27D0()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1DACA27DC()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1DACA27E8()
{
  return MEMORY[0x1E0CAEE50]();
}

uint64_t sub_1DACA27F4()
{
  return MEMORY[0x1E0CAF388]();
}

uint64_t sub_1DACA2800()
{
  return MEMORY[0x1E0CAF3D0]();
}

uint64_t sub_1DACA280C()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1DACA2818()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DACA2824()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DACA2830()
{
  return MEMORY[0x1E0CAF9B0]();
}

uint64_t sub_1DACA283C()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1DACA2848()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1DACA2854()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1DACA2860()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1DACA286C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1DACA2878()
{
  return MEMORY[0x1E0CAFE08]();
}

uint64_t sub_1DACA2884()
{
  return MEMORY[0x1E0CAFE18]();
}

uint64_t sub_1DACA2890()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DACA289C()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1DACA28A8()
{
  return MEMORY[0x1E0CAFE90]();
}

uint64_t sub_1DACA28B4()
{
  return MEMORY[0x1E0CAFEB8]();
}

uint64_t sub_1DACA28C0()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DACA28CC()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1DACA28D8()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1DACA28E4()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DACA28F0()
{
  return MEMORY[0x1E0CB0088]();
}

uint64_t sub_1DACA28FC()
{
  return MEMORY[0x1E0CB00A0]();
}

uint64_t sub_1DACA2908()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1DACA2914()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1DACA2920()
{
  return MEMORY[0x1E0CB0160]();
}

uint64_t sub_1DACA292C()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1DACA2938()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DACA2944()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DACA2950()
{
  return MEMORY[0x1E0CB0240]();
}

uint64_t sub_1DACA295C()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1DACA2968()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1DACA2974()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1DACA2980()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1DACA298C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DACA2998()
{
  return MEMORY[0x1E0CB0A80]();
}

uint64_t sub_1DACA29A4()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1DACA29B0()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1DACA29BC()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DACA29C8()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1DACA29D4()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1DACA29E0()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1DACA29EC()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DACA29F8()
{
  return MEMORY[0x1E0DE9BF0]();
}

uint64_t sub_1DACA2A04()
{
  return MEMORY[0x1E0DE9BF8]();
}

uint64_t sub_1DACA2A10()
{
  return MEMORY[0x1E0DE9C00]();
}

uint64_t sub_1DACA2A1C()
{
  return MEMORY[0x1E0DE9C08]();
}

uint64_t sub_1DACA2A28()
{
  return MEMORY[0x1E0DE9C18]();
}

uint64_t sub_1DACA2A34()
{
  return MEMORY[0x1E0DE9C28]();
}

uint64_t sub_1DACA2A40()
{
  return MEMORY[0x1E0DBF1A8]();
}

uint64_t sub_1DACA2A4C()
{
  return MEMORY[0x1E0DBF1B8]();
}

uint64_t sub_1DACA2A58()
{
  return MEMORY[0x1E0D26078]();
}

uint64_t sub_1DACA2A64()
{
  return MEMORY[0x1E0D26090]();
}

uint64_t sub_1DACA2A70()
{
  return MEMORY[0x1E0D260B8]();
}

uint64_t sub_1DACA2A7C()
{
  return MEMORY[0x1E0D260E8]();
}

uint64_t sub_1DACA2A88()
{
  return MEMORY[0x1E0D260F8]();
}

uint64_t sub_1DACA2A94()
{
  return MEMORY[0x1E0D26150]();
}

uint64_t sub_1DACA2AA0()
{
  return MEMORY[0x1E0D26168]();
}

uint64_t sub_1DACA2AAC()
{
  return MEMORY[0x1E0CF8878]();
}

uint64_t sub_1DACA2AB8()
{
  return MEMORY[0x1E0CF8880]();
}

uint64_t sub_1DACA2AC4()
{
  return MEMORY[0x1E0CF8888]();
}

uint64_t sub_1DACA2AD0()
{
  return MEMORY[0x1E0CF8890]();
}

uint64_t sub_1DACA2ADC()
{
  return MEMORY[0x1E0CF8898]();
}

uint64_t sub_1DACA2AE8()
{
  return MEMORY[0x1E0CF88A8]();
}

uint64_t sub_1DACA2AF4()
{
  return MEMORY[0x1E0CF88B8]();
}

uint64_t sub_1DACA2B00()
{
  return MEMORY[0x1E0CF88C8]();
}

uint64_t sub_1DACA2B0C()
{
  return MEMORY[0x1E0CF88D0]();
}

uint64_t sub_1DACA2B18()
{
  return MEMORY[0x1E0CF88D8]();
}

uint64_t sub_1DACA2B24()
{
  return MEMORY[0x1E0CF88E0]();
}

uint64_t sub_1DACA2B30()
{
  return MEMORY[0x1E0CF88E8]();
}

uint64_t sub_1DACA2B3C()
{
  return MEMORY[0x1E0CF88F0]();
}

uint64_t sub_1DACA2B48()
{
  return MEMORY[0x1E0CF8900]();
}

uint64_t sub_1DACA2B54()
{
  return MEMORY[0x1E0CF8908]();
}

uint64_t sub_1DACA2B60()
{
  return MEMORY[0x1E0CF8910]();
}

uint64_t sub_1DACA2B6C()
{
  return MEMORY[0x1E0CF8918]();
}

uint64_t sub_1DACA2B78()
{
  return MEMORY[0x1E0CF8928]();
}

uint64_t sub_1DACA2B84()
{
  return MEMORY[0x1E0CF8930]();
}

uint64_t sub_1DACA2B90()
{
  return MEMORY[0x1E0DF0188]();
}

uint64_t sub_1DACA2B9C()
{
  return MEMORY[0x1E0DF01F8]();
}

uint64_t sub_1DACA2BA8()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1DACA2BB4()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DACA2BC0()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DACA2BCC()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1DACA2BD8()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1DACA2BE4()
{
  return MEMORY[0x1E0DBF1C8]();
}

uint64_t sub_1DACA2BF0()
{
  return MEMORY[0x1E0DBF1D0]();
}

uint64_t sub_1DACA2BFC()
{
  return MEMORY[0x1E0DBF1D8]();
}

uint64_t sub_1DACA2C08()
{
  return MEMORY[0x1E0DBF1E0]();
}

uint64_t sub_1DACA2C14()
{
  return MEMORY[0x1E0DBF1E8]();
}

uint64_t sub_1DACA2C20()
{
  return MEMORY[0x1E0DBF1F0]();
}

uint64_t sub_1DACA2C2C()
{
  return MEMORY[0x1E0DBF1F8]();
}

uint64_t sub_1DACA2C38()
{
  return MEMORY[0x1E0DBF200]();
}

uint64_t sub_1DACA2C44()
{
  return MEMORY[0x1E0DBF208]();
}

uint64_t sub_1DACA2C50()
{
  return MEMORY[0x1E0DBF210]();
}

uint64_t sub_1DACA2C5C()
{
  return MEMORY[0x1E0DBF218]();
}

uint64_t sub_1DACA2C68()
{
  return MEMORY[0x1E0DBF220]();
}

uint64_t sub_1DACA2C74()
{
  return MEMORY[0x1E0DBF238]();
}

uint64_t sub_1DACA2C80()
{
  return MEMORY[0x1E0DBF240]();
}

uint64_t sub_1DACA2C8C()
{
  return MEMORY[0x1E0DBF248]();
}

uint64_t sub_1DACA2C98()
{
  return MEMORY[0x1E0DBF250]();
}

uint64_t sub_1DACA2CA4()
{
  return MEMORY[0x1E0DBF258]();
}

uint64_t sub_1DACA2CB0()
{
  return MEMORY[0x1E0DBF260]();
}

uint64_t sub_1DACA2CBC()
{
  return MEMORY[0x1E0DBF268]();
}

uint64_t sub_1DACA2CC8()
{
  return MEMORY[0x1E0DBF270]();
}

uint64_t sub_1DACA2CD4()
{
  return MEMORY[0x1E0DBF278]();
}

uint64_t sub_1DACA2CE0()
{
  return MEMORY[0x1E0DBF280]();
}

uint64_t sub_1DACA2CEC()
{
  return MEMORY[0x1E0DBF288]();
}

uint64_t sub_1DACA2CF8()
{
  return MEMORY[0x1E0DBF290]();
}

uint64_t sub_1DACA2D04()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1DACA2D10()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1DACA2D1C()
{
  return MEMORY[0x1E0CA9920]();
}

uint64_t sub_1DACA2D28()
{
  return MEMORY[0x1E0CA9938]();
}

uint64_t sub_1DACA2D34()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1DACA2D40()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1DACA2D4C()
{
  return MEMORY[0x1E0CB17F8]();
}

uint64_t sub_1DACA2D58()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1DACA2D64()
{
  return MEMORY[0x1E0DE9E38]();
}

uint64_t sub_1DACA2D70()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1DACA2D7C()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1DACA2D88()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DACA2D94()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DACA2DA0()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1DACA2DAC()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1DACA2DB8()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1DACA2DC4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DACA2DD0()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DACA2DDC()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DACA2DE8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DACA2DF4()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1DACA2E00()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1DACA2E0C()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1DACA2E18()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1DACA2E24()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DACA2E30()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DACA2E3C()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DACA2E48()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DACA2E54()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DACA2E60()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DACA2E6C()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DACA2E78()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DACA2E84()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DACA2E90()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1DACA2E9C()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1DACA2EA8()
{
  return MEMORY[0x1E0DF06F8]();
}

uint64_t sub_1DACA2EB4()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1DACA2EC0()
{
  return MEMORY[0x1E0DF0738]();
}

uint64_t sub_1DACA2ECC()
{
  return MEMORY[0x1E0DF0740]();
}

uint64_t sub_1DACA2ED8()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DACA2EE4()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DACA2EF0()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1DACA2EFC()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1DACA2F08()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1DACA2F14()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1DACA2F20()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1DACA2F2C()
{
  return MEMORY[0x1E0CB1CF0]();
}

uint64_t sub_1DACA2F38()
{
  return MEMORY[0x1E0CB1CF8]();
}

uint64_t sub_1DACA2F44()
{
  return MEMORY[0x1E0CB1DC0]();
}

uint64_t sub_1DACA2F50()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1DACA2F5C()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DACA2F68()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1DACA2F74()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1DACA2F80()
{
  return MEMORY[0x1E0C91D38]();
}

uint64_t sub_1DACA2F8C()
{
  return MEMORY[0x1E0C91D40]();
}

uint64_t sub_1DACA2F98()
{
  return MEMORY[0x1E0DBF2A0]();
}

uint64_t sub_1DACA2FA4()
{
  return MEMORY[0x1E0DBF2A8]();
}

uint64_t sub_1DACA2FB0()
{
  return MEMORY[0x1E0DBF2B0]();
}

uint64_t sub_1DACA2FBC()
{
  return MEMORY[0x1E0CF8940]();
}

uint64_t sub_1DACA2FC8()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DACA2FD4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DACA2FE0()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1DACA2FEC()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DACA2FF8()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1DACA3004()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1DACA3010()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1DACA301C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DACA3028()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1DACA3034()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1DACA3040()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DACA304C()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DACA3058()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DACA3064()
{
  return MEMORY[0x1E0DEC3D0]();
}

uint64_t sub_1DACA3070()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DACA307C()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1DACA3088()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DACA3094()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DACA30A0()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DACA30AC()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DACA30B8()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DACA30C4()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DACA30D0()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1DACA30DC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DACA30E8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DACA30F4()
{
  return MEMORY[0x1E0DECD20]();
}

uint64_t sub_1DACA3100()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1DACA310C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1DACA3118()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DACA3124()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DACA3130()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1DACA313C()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1DACA3148()
{
  return MEMORY[0x1E0DED000]();
}

uint64_t sub_1DACA3154()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1DACA3160()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1DACA316C()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1DACA3178()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1DACA3184()
{
  return MEMORY[0x1E0DED130]();
}

uint64_t sub_1DACA3190()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1DACA319C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DACA31A8()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1DACA31B4()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DACA31C0()
{
  return MEMORY[0x1E0DED628]();
}

uint64_t sub_1DACA31CC()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1DACA31D8()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1DACA31E4()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_1DACA31F0()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1DACA31FC()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1DACA3208()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1DACA3214()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1DACA3220()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DACA322C()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DACA3238()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DACA3244()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DACA3250()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DACA325C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DACA3268()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1DACA3274()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1DACA3280()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1DACA328C()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1DACA3298()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1DACA32A4()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1DACA32B0()
{
  return MEMORY[0x1E0DEE8E8]();
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x1E0DE2B40]();
}

uint64_t MSCanSendMail()
{
  return MEMORY[0x1E0D46A90]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t batteryUIHasNoteworthyInformation()
{
  return MEMORY[0x1E0D7FE70]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x1E0DF0F68]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x1E0DF0F70]();
}

uint64_t swift_asyncLet_get()
{
  return MEMORY[0x1E0DF0F78]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x1E0DEED90]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

