void sub_248A6A23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
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

void sub_248A6A960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_248A6B63C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A6D0A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id *v25;
  uint64_t v26;

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)(v26 - 128));
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_248A6D41C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A6DC3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A6E324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_248A6F950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_248A6FBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t initializeBufferWithCopyOfBuffer for TipBodyImageBuilder(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_248A70288(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_248A702A8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADE20);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADE28);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADE30);
}

void type metadata accessor for UIPopoverArrowDirection(uint64_t a1)
{
  sub_248A71710(a1, (unint64_t *)&unk_2577ADE38);
}

void type metadata accessor for TPKClientContextKey(uint64_t a1)
{
  sub_248A71710(a1, &qword_25446CC80);
}

uint64_t getEnumTagSinglePayload for Move(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Move(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADE48);
}

uint64_t sub_248A703A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_248A9C334();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v11 = sub_248A902D0();
  if (!v11)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v45 = v8;
  swift_retain();
  v12 = sub_248A9C3A0();
  v14 = v13;
  v16 = v15;
  v17 = sub_248A9C5C8();
  v19 = *(_QWORD *)(a3 + 16);
  v47 = v6;
  v48 = v11;
  v46 = v7;
  if (v19 && (v20 = sub_248A86858(v17, v18), (v21 & 1) != 0))
  {
    sub_248A71670(*(_QWORD *)(a3 + 56) + 32 * v20, (uint64_t)&v51);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v52 + 1))
    {
      v22 = swift_dynamicCast();
      v23 = v22 == 0;
      if (v22)
        v24 = v49;
      else
        v24 = 0;
      if (v23)
        v25 = 0;
      else
        v25 = v50;
      goto LABEL_13;
    }
  }
  else
  {
    v51 = 0u;
    v52 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_248A71634((uint64_t)&v51, (uint64_t *)&unk_25446CD50);
  v24 = 0;
  v25 = 0;
LABEL_13:
  v26 = v16 & 1;
  v27 = sub_248A7070C(v24, v25, v12, v14, v26);
  v29 = v28;
  v31 = v30 & 1;
  swift_bridgeObjectRelease();
  sub_248A71624(v12, v14, v26);
  swift_bridgeObjectRelease();
  sub_248A9C484();
  v32 = sub_248A9C340();
  v34 = v33;
  v36 = v35;
  swift_release();
  v37 = v36 & 1;
  sub_248A71624(v27, v29, v31);
  swift_bridgeObjectRelease();
  v39 = v45;
  v38 = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v45 + 104))(v10, *MEMORY[0x24BDF18C8], v46);
  v40 = sub_248A9C2EC();
  v41 = (uint64_t)v47;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v47, 1, 1, v40);
  sub_248A9C31C();
  sub_248A71634(v41, (uint64_t *)&unk_2577ADE98);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v10, v38);
  sub_248A9C2F8();
  sub_248A9C328();
  swift_release();
  v42 = sub_248A9C37C();
  swift_release();
  swift_release();
  sub_248A71624(v32, v34, v37);
  swift_bridgeObjectRelease();
  return v42;
}

uint64_t sub_248A7070C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v7;
  uint64_t v11;
  char v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v7 = a5 & 1;
  if (!a2)
    goto LABEL_10;
  if (sub_248A9C5C8() == a1 && v11 == a2)
  {
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  v13 = sub_248A9C7FC();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
  {
LABEL_10:
    v16 = a3;
    v17 = a4;
    v18 = v7;
LABEL_11:
    sub_248A71614(v16, v17, v18);
    swift_bridgeObjectRetain();
    return a3;
  }
  sub_248A716AC();
  v14 = (void *)sub_248A75754(a1, a2);
  if (!v14)
  {
    v18 = a5 & 1;
    v16 = a3;
    v17 = a4;
    goto LABEL_11;
  }
  v15 = v14;
  MEMORY[0x2495A3484]();
  a3 = sub_248A9C340();

  swift_release();
  return a3;
}

uint64_t sub_248A7085C()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  _BYTE v15[32];

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v0);
  v2 = &v15[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v3 = sub_248A9C334();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF1860], v3);
  v7 = sub_248A9C2EC();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v2, 1, 1, v7);
  sub_248A9C31C();
  sub_248A71634((uint64_t)v2, (uint64_t *)&unk_2577ADE98);
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  sub_248A9C2F8();
  sub_248A9C328();
  swift_release();
  v8 = sub_248A9C37C();
  v10 = v9;
  v12 = v11;
  swift_release();
  sub_248A9C484();
  v13 = sub_248A9C340();
  swift_release();
  sub_248A71624(v8, v10, v12 & 1);
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_248A70A3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  _BYTE *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  char v38;
  id v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  _BYTE v43[4];
  unsigned int v44;
  uint64_t v45;
  _BYTE *v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v56 = a5;
  v57 = a3;
  v8 = a4 & 1;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v9);
  v49 = &v43[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_248A9C334();
  v47 = *(_QWORD *)(v11 - 8);
  v48 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v46 = &v43[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1 && (v13 = *(_QWORD *)(a1 + 16)) != 0)
  {
    v54 = (id)objc_opt_self();
    sub_248A71614(a2, v57, a4 & 1);
    v44 = *MEMORY[0x24BDF1860];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14 = 0;
    v53 = v13 - 1;
    v52 = MEMORY[0x24BEE4AD8] + 8;
    v45 = a1;
    do
    {
      v24 = swift_bridgeObjectRetain();
      sub_248A84960(v24);
      v25 = (void *)sub_248A9C574();
      swift_bridgeObjectRelease();
      v26 = objc_msgSend(v54, sel_markTypeForMarkDictionary_, v25);

      v55 = a2;
      if (v26 == (id)3)
      {
        v28 = v46;
        v27 = v47;
        v29 = v8;
        v30 = v48;
        (*(void (**)(_BYTE *, _QWORD, uint64_t))(v47 + 104))(v46, v44, v48);
        v31 = sub_248A9C2EC();
        v32 = (uint64_t)v49;
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v49, 1, 1, v31);
        sub_248A9C31C();
        sub_248A71634(v32, (uint64_t *)&unk_2577ADE98);
        (*(void (**)(_BYTE *, uint64_t))(v27 + 8))(v28, v30);
        sub_248A9C2F8();
        sub_248A9C328();
        swift_release();
        v51 = v29 & 1;
        v33 = sub_248A9C37C();
        v35 = v34;
        LOBYTE(v28) = v36;
        v50 = v37;
        swift_release();
        v38 = v28 & 1;
        v39 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
        MEMORY[0x2495A3484](v39);
        a2 = sub_248A9C340();
        v18 = v40;
        LOBYTE(v30) = v41;
        v22 = v42;
        swift_release();
        v8 = v30 & 1;
        sub_248A71624(v33, v35, v38);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_248A71624(v55, v57, v51);
        result = swift_bridgeObjectRelease();
        if (v53 == v14)
        {
LABEL_10:
          swift_bridgeObjectRelease();
          return a2;
        }
      }
      else
      {
        v15 = v8 & 1;
        v16 = v57;
        a2 = sub_248A7085C();
        v18 = v17;
        v20 = v19;
        v22 = v21;
        swift_bridgeObjectRelease();
        v8 = v20 & 1;
        sub_248A71624(v55, v16, v15);
        result = swift_bridgeObjectRelease();
        if (v53 == v14)
          goto LABEL_10;
      }
      ++v14;
      v56 = v22;
      v57 = v18;
    }
    while (!__OFADD__(v14, 1));
    __break(1u);
  }
  else
  {
    return sub_248A7085C();
  }
  return result;
}

uint64_t sub_248A70E10(uint64_t a1, uint64_t a2)
{
  return sub_248A7103C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_248A70E24(uint64_t a1, uint64_t a2)
{
  return sub_248A7103C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

void sub_248A70E3C(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_248A70E44@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_248A70E58@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

_QWORD *sub_248A70E6C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_248A70E98@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_248A70EBC(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_248A70ED0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_248A70EE4(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_248A70EF8(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_248A70F0C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_248A70F20()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_248A70F30()
{
  return sub_248A9C73C();
}

_QWORD *sub_248A70F48(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

_QWORD *sub_248A70F5C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_248A70F6C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

BOOL sub_248A70F78(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248A70F8C()
{
  sub_248A9C5C8();
  sub_248A9C5E0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A70FCC()
{
  uint64_t v0;

  sub_248A9C5C8();
  sub_248A9C82C();
  sub_248A9C5E0();
  v0 = sub_248A9C844();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_248A7103C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_248A9C5C8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_248A71078(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_248A9C5B0();
  *a2 = 0;
  return result;
}

uint64_t sub_248A710EC(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_248A9C5BC();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_248A71168@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_248A9C5C8();
  v2 = sub_248A9C5A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_248A711A8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_248A711BC(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_248A711EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_248A71200(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_248A71218@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_248A71888(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

uint64_t sub_248A71254()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_248A9C5C8();
  v2 = v1;
  if (v0 == sub_248A9C5C8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_248A9C7FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_QWORD *sub_248A712DC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_248A712EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248A9C5C8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_248A71314()
{
  sub_248A713F0((unint64_t *)&qword_2577ADE88, (uint64_t (*)(uint64_t))type metadata accessor for TPKClientContextKey, (uint64_t)&unk_248A9E1E4);
  sub_248A713F0(&qword_2577ADE90, (uint64_t (*)(uint64_t))type metadata accessor for TPKClientContextKey, (uint64_t)&unk_248A9E184);
  return sub_248A9C7E4();
}

uint64_t sub_248A71398()
{
  return sub_248A713F0(&qword_2577ADE50, (uint64_t (*)(uint64_t))type metadata accessor for TPKClientContextKey, (uint64_t)&unk_248A9E148);
}

uint64_t sub_248A713C4()
{
  return sub_248A713F0((unint64_t *)&unk_2577ADE58, (uint64_t (*)(uint64_t))type metadata accessor for TPKClientContextKey, (uint64_t)&unk_248A9E11C);
}

uint64_t sub_248A713F0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495A3E38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248A71430()
{
  return sub_248A713F0((unint64_t *)&unk_25446CC70, (uint64_t (*)(uint64_t))type metadata accessor for TPKClientContextKey, (uint64_t)&unk_248A9E1B8);
}

uint64_t sub_248A7145C()
{
  return sub_248A713F0(&qword_2577ADE68, (uint64_t (*)(uint64_t))type metadata accessor for UIPopoverArrowDirection, (uint64_t)&unk_248A9E2B4);
}

uint64_t sub_248A71488()
{
  return sub_248A713F0(&qword_2577ADE70, (uint64_t (*)(uint64_t))type metadata accessor for UIPopoverArrowDirection, (uint64_t)&unk_248A9E280);
}

uint64_t sub_248A714B4()
{
  return sub_248A713F0(&qword_2577ADE78, (uint64_t (*)(uint64_t))type metadata accessor for UIPopoverArrowDirection, (uint64_t)&unk_248A9E2E0);
}

uint64_t sub_248A714E0()
{
  return sub_248A713F0(&qword_2577ADE80, (uint64_t (*)(uint64_t))type metadata accessor for UIPopoverArrowDirection, (uint64_t)&unk_248A9E31C);
}

uint64_t sub_248A7150C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_248A9C5A4();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_248A71550()
{
  sub_248A713F0(&qword_2577ADEF8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248A9E544);
  sub_248A713F0((unint64_t *)&unk_2577ADF00, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248A9E4E4);
  return sub_248A9C7E4();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A3E20]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_248A71614(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_248A71624(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_248A71634(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_248A71670(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_248A716AC()
{
  unint64_t result;

  result = qword_2577ADEA8;
  if (!qword_2577ADEA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577ADEA8);
  }
  return result;
}

void type metadata accessor for TPSMonitoringEventsEventOptions(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADEB0);
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_248A71710(a1, &qword_2577ADEB8);
}

void sub_248A71710(uint64_t a1, unint64_t *a2)
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

uint64_t sub_248A71754()
{
  return sub_248A713F0(&qword_2577ADEC0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248A9E4A8);
}

uint64_t sub_248A71780()
{
  return sub_248A713F0(&qword_2577ADEC8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248A9E47C);
}

uint64_t sub_248A717AC()
{
  return sub_248A713F0(&qword_2577ADED0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_248A9E518);
}

uint64_t sub_248A717D8()
{
  return sub_248A713F0(&qword_2577ADED8, (uint64_t (*)(uint64_t))type metadata accessor for TPSMonitoringEventsEventOptions, (uint64_t)&unk_248A9E604);
}

uint64_t sub_248A71804()
{
  return sub_248A713F0(&qword_2577ADEE0, (uint64_t (*)(uint64_t))type metadata accessor for TPSMonitoringEventsEventOptions, (uint64_t)&unk_248A9E5D4);
}

uint64_t sub_248A71830()
{
  return sub_248A713F0(&qword_2577ADEE8, (uint64_t (*)(uint64_t))type metadata accessor for TPSMonitoringEventsEventOptions, (uint64_t)&unk_248A9E62C);
}

uint64_t sub_248A7185C()
{
  return sub_248A713F0(&qword_2577ADEF0, (uint64_t (*)(uint64_t))type metadata accessor for TPSMonitoringEventsEventOptions, (uint64_t)&unk_248A9E664);
}

uint64_t sub_248A71888(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

unint64_t sub_248A7192C()
{
  unint64_t result;

  result = sub_248A71950(MEMORY[0x24BEE4AF8]);
  qword_2577B0870 = result;
  return result;
}

unint64_t sub_248A71950(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE068);
  v2 = (_QWORD *)sub_248A9C7D8();
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
    result = sub_248A86858(v5, v6);
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

unint64_t sub_248A71A68(uint64_t a1)
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
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE060);
  v2 = (_QWORD *)sub_248A9C7D8();
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
    swift_unknownObjectRetain();
    result = sub_248A86858(v5, v6);
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
    v2[2] = v13;
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

unint64_t sub_248A71B80(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE050);
  v2 = sub_248A9C7D8();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_248A74E18(v6, (uint64_t)&v13);
    v7 = v13;
    result = sub_248A868BC(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_248A74E60(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
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

uint64_t static TipKitViewModel.TipKitContextIdentifier.getter()
{
  return 0x696669746E656469;
}

uint64_t sub_248A71CB4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_248A71D30(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = v2;
  return sub_248A9C010();
}

uint64_t sub_248A71D9C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_248A71E14()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_248A9C010();
}

uint64_t (*sub_248A71E7C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_248A9BFF8();
  return sub_248A71EF4;
}

uint64_t sub_248A71EF8()
{
  return sub_248A72EF4((uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent, &qword_2577ADFD8);
}

uint64_t sub_248A71F0C(uint64_t a1)
{
  return sub_248A72F74(a1, &qword_2577ADFE0, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent, &qword_2577ADFD8);
}

uint64_t (*sub_248A71F28(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFE0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFD8);
  sub_248A9BFE0();
  swift_endAccess();
  return sub_248A71FF0;
}

void *TipKitViewModel.tipContentController.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipContentController);
  v2 = v1;
  return v1;
}

uint64_t sub_248A72020()
{
  return sub_248A720F0();
}

uint64_t sub_248A7202C(uint64_t a1)
{
  return sub_248A72140(a1, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewBackgroundColor);
}

uint64_t (*sub_248A72038())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_248A72080(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v6 = v5;
  swift_retain();
  return swift_release();
}

uint64_t sub_248A720E4()
{
  return sub_248A720F0();
}

uint64_t sub_248A720F0()
{
  swift_beginAccess();
  return swift_retain();
}

uint64_t sub_248A72134(uint64_t a1)
{
  return sub_248A72140(a1, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor);
}

uint64_t sub_248A72140(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)(v2 + *a2);
  swift_beginAccess();
  *v4 = a1;
  return swift_release();
}

uint64_t (*sub_248A7218C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_248A721D0(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void *sub_248A72230()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A7227C(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*sub_248A722CC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_248A72310@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_248A75044;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_248A729F8(v4);
}

uint64_t sub_248A723A4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_248A75014;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_248A729F8(v3);
  return sub_248A72A78(v8);
}

uint64_t sub_248A7245C()
{
  return sub_248A72998(&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler, (void (*)(_QWORD, _QWORD))sub_248A75068);
}

uint64_t sub_248A72470(uint64_t a1, uint64_t a2)
{
  return sub_248A72A1C(a1, a2, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_248A7506C);
}

uint64_t (*sub_248A72484())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_248A724C8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, _QWORD *@<X1>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_248A74FE4;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_248A729F8(v4);
}

uint64_t sub_248A7255C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_248A74FA8;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_248A729F8(v3);
  return sub_248A72A78(v8);
}

uint64_t sub_248A72614()
{
  return sub_248A72998(&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler, (void (*)(_QWORD, _QWORD))sub_248A75068);
}

uint64_t sub_248A72628(uint64_t a1, uint64_t a2)
{
  return sub_248A72A1C(a1, a2, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler, (uint64_t (*)(uint64_t, uint64_t))sub_248A7506C);
}

uint64_t (*sub_248A7263C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_248A72680@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)@<X0>(_QWORD *@<X0>, uint64_t *@<X8>);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_248A74F7C;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_248A729F8(v4);
}

uint64_t sub_248A72714(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_248A74F44;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_248A729F8(v3);
  return sub_248A72A78(v8);
}

uint64_t sub_248A727CC()
{
  return sub_248A72998(&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler, (void (*)(_QWORD, _QWORD))sub_248A75068);
}

uint64_t sub_248A727E0(uint64_t a1, uint64_t a2)
{
  return sub_248A72A1C(a1, a2, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler, (uint64_t (*)(uint64_t, uint64_t))sub_248A7506C);
}

uint64_t (*sub_248A727F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_248A72838@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *, _QWORD *, _QWORD *);

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_248A74F18;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_248A729F8(v4);
}

uint64_t sub_248A728CC(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_248A74EDC;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_248A729F8(v3);
  return sub_248A72A78(v8);
}

uint64_t sub_248A72984()
{
  return sub_248A72998(&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler, (void (*)(_QWORD, _QWORD))sub_248A729F8);
}

uint64_t sub_248A72998(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

uint64_t sub_248A729F8(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_248A72A08(uint64_t a1, uint64_t a2)
{
  return sub_248A72A1C(a1, a2, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler, (uint64_t (*)(uint64_t, uint64_t))sub_248A72A78);
}

uint64_t sub_248A72A1C(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

uint64_t sub_248A72A78(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t (*sub_248A72A88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_248A72ACC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_248A72B48(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_248A9C010();
}

uint64_t sub_248A72BB8()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_248A72C30()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_248A9C010();
}

uint64_t (*sub_248A72C98(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_248A9BFF8();
  return sub_248A71EF4;
}

void sub_248A72D10(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_248A72D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_248A9BFE0();
  return swift_endAccess();
}

uint64_t sub_248A72DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_248A9BFEC();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_248A72EE0()
{
  return sub_248A72EF4((uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent, &qword_2577ADFF0);
}

uint64_t sub_248A72EF4(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_248A9BFE0();
  return swift_endAccess();
}

uint64_t sub_248A72F58(uint64_t a1)
{
  return sub_248A72F74(a1, &qword_2577ADFF8, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent, &qword_2577ADFF0);
}

uint64_t sub_248A72F74(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_248A9BFEC();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_248A7304C(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFF8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFF0);
  sub_248A9BFE0();
  swift_endAccess();
  return sub_248A71FF0;
}

void sub_248A73114(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_248A9BFEC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_248A9BFEC();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

id TipKitViewModel.__allocating_init(identifier:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return TipKitViewModel.init(identifier:)(a1);
}

uint64_t sub_248A73270()
{
  char *v0;
  uint64_t v1;
  char *v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  if (!v3)
    return 0;
  v0 = &v3[OBJC_IVAR___TPKContent_customizationID];
  swift_beginAccess();
  v1 = *(_QWORD *)v0;

  return v1;
}

id TipKitViewModel.init(identifier:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  objc_class *v22;
  uint64_t v24;
  objc_super v25;
  uint64_t v26;

  v24 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFF0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577ADFD8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = &v1[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent];
  LOBYTE(v26) = 0;
  v11 = v1;
  sub_248A9BFD4();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v9, v6);
  *(_QWORD *)&v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewBackgroundColor] = 0;
  v12 = (uint64_t *)&v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor];
  *(_QWORD *)&v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon] = 0;
  v13 = &v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler];
  *(_QWORD *)v13 = 0;
  *((_QWORD *)v13 + 1) = 0;
  v14 = &v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v16 = &v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v17 = &v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent];
  v26 = 0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577AE660);
  sub_248A9BFD4();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v17, v5, v2);
  v18 = objc_allocWithZone((Class)TPKContentController);
  v19 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithContext_, v19, v24);

  *(_QWORD *)&v11[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipContentController] = v20;
  v21 = sub_248A9C46C();
  swift_beginAccess();
  *v12 = v21;

  swift_release();
  v22 = (objc_class *)type metadata accessor for TipKitViewModel();
  v25.receiver = v11;
  v25.super_class = v22;
  return objc_msgSendSuper2(&v25, sel_init);
}

void sub_248A73568()
{
  sub_248A73580((SEL *)&selRef_addDelegate_content_);
}

void sub_248A73574()
{
  sub_248A73580((SEL *)&selRef_removeDelegate_content_);
}

void sub_248A73580(SEL *a1)
{
  uint64_t v1;
  void *v2;
  void *v4;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipContentController);
  if (v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    objc_msgSend(v2, *a1, v1, v4);

  }
}

void *sub_248A73624()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v16;

  v1 = v0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  if (!v16)
    return 0;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipContentController);
  if (!v2)
  {

    return 0;
  }
  v3 = (char *)objc_msgSend(v2, sel_createContentViewWithContent_, v16);
  v4 = v3;
  if (!v3)
    goto LABEL_10;
  v5 = *(_QWORD *)(MEMORY[0x24BEBD250] + 8);
  v6 = *(_QWORD *)(MEMORY[0x24BEBD250] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEBD250] + 24);
  v8 = &v3[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  *(_QWORD *)v8 = *MEMORY[0x24BEBD250];
  *((_QWORD *)v8 + 1) = v5;
  *((_QWORD *)v8 + 2) = v6;
  *((_QWORD *)v8 + 3) = v7;
  objc_msgSend(v3, sel_setDirectionalLayoutMargins_);
  v9 = (_QWORD *)(v0 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewBackgroundColor);
  swift_beginAccess();
  if (*v9)
  {
    sub_248A716AC();
    swift_retain_n();
    v10 = v4;
    v11 = (void *)sub_248A9C6E8();
    objc_msgSend(v10, sel_setBackgroundColor_, v11);

    swift_release();
  }
  v12 = (_QWORD *)(v1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor);
  swift_beginAccess();
  if (*v12)
  {
    sub_248A716AC();
    swift_retain_n();
    v13 = v4;
    v14 = (void *)sub_248A9C6E8();
    (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v13) + 0x148))();

    swift_release();
  }
  else
  {
LABEL_10:

  }
  return v4;
}

uint64_t sub_248A73820(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void (**v4)(void *, uint64_t, unint64_t);
  uint64_t result;
  void (*v6)(void *, uint64_t, unint64_t);
  uint64_t inited;
  void *v8;

  v4 = (void (**)(void *, uint64_t, unint64_t))(v2
                                                               + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler);
  result = swift_beginAccess();
  v6 = *v4;
  if (*v4)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    if (v8)
    {
      if (a2)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE000);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_248A9E770;
        *(_QWORD *)(inited + 32) = 0x696669746E656469;
        *(_QWORD *)(inited + 40) = 0xEA00000000007265;
        *(_QWORD *)(inited + 48) = sub_248A9C5A4();
        a2 = sub_248A71A68(inited);
      }
      v6(v8, 3, a2);

      swift_bridgeObjectRelease();
    }
    return sub_248A72A78((uint64_t)v6);
  }
  return result;
}

uint64_t sub_248A7396C(uint64_t a1, void *a2)
{
  void *v2;
  id v4;
  id v5;
  id v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v4 = a2;
  v5 = v2;
  sub_248A9C010();
  swift_getKeyPath();
  swift_getKeyPath();
  v6 = v5;
  return sub_248A9C010();
}

void *sub_248A73AF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void (**v6)(uint64_t);
  void (*v7)(uint64_t);
  void **v8;
  void *v9;
  id v10;

  v4 = v3;
  v6 = (void (**)(uint64_t))(v4 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_customizationHandler);
  swift_beginAccess();
  v7 = *v6;
  if (*v6)
  {
    swift_retain();
    v7(a3);
    sub_248A72A78((uint64_t)v7);
  }
  v8 = (void **)(v4 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v9 = *v8;
  v10 = v9;
  return v9;
}

uint64_t sub_248A73C88()
{
  void *v0;
  id v1;

  swift_getKeyPath();
  swift_getKeyPath();
  v1 = v0;
  return sub_248A9C010();
}

uint64_t sub_248A73D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void (**v8)(uint64_t, uint64_t, uint64_t);
  uint64_t result;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v8 = (void (**)(uint64_t, uint64_t, uint64_t))(v4
                                                       + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_eventOccurredHandler);
  result = swift_beginAccess();
  v10 = *v8;
  if (*v8)
  {
    swift_retain();
    v10(a3, a2, a4);
    return sub_248A72A78((uint64_t)v10);
  }
  return result;
}

uint64_t sub_248A73EE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (**v6)(uint64_t, uint64_t);
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;

  v6 = (uint64_t (**)(uint64_t, uint64_t))(v3
                                                 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_personalizationHandler);
  swift_beginAccess();
  v7 = *v6;
  if (!*v6)
    return 0;
  swift_retain();
  v8 = v7(a3, a2);
  sub_248A72A78((uint64_t)v7);
  return v8;
}

uint64_t sub_248A7407C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (**v4)(uint64_t);
  uint64_t (*v5)(uint64_t);
  uint64_t v6;

  v4 = (uint64_t (**)(uint64_t))(v2 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_clientContextMapHandler);
  swift_beginAccess();
  v5 = *v4;
  if (!*v4)
    return 0;
  swift_retain();
  v6 = v5(a2);
  sub_248A72A78((uint64_t)v5);
  return v6;
}

id TipKitViewModel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TipKitViewModel.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TipKitViewModel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipKitViewModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_248A743C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for TipKitViewModel();
  result = sub_248A9BFC8();
  *a1 = result;
  return result;
}

id _s12TipKitLegacy0aB9ViewModelC19modelWithIdentifieryACSSFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  char v6;
  void *v7;
  id v8;
  id v10;
  id v11;
  id v12;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;

  if (qword_2577ADDB0 != -1)
    swift_once();
  swift_beginAccess();
  v4 = qword_2577B0870;
  if (*(_QWORD *)(qword_2577B0870 + 16))
  {
    swift_bridgeObjectRetain();
    v5 = sub_248A86858(a1, a2);
    if ((v6 & 1) != 0)
    {
      v7 = *(void **)(*(_QWORD *)(v4 + 56) + 8 * v5);
      swift_endAccess();
      v8 = v7;
      swift_bridgeObjectRelease();
      return v8;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  v10 = objc_allocWithZone((Class)type metadata accessor for TipKitViewModel());
  swift_bridgeObjectRetain();
  v11 = TipKitViewModel.init(identifier:)(a1);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v12 = v11;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v14 = qword_2577B0870;
  qword_2577B0870 = 0x8000000000000000;
  sub_248A871D4((uint64_t)v12, a1, a2, isUniquelyReferenced_nonNull_native);
  qword_2577B0870 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  return v12;
}

uint64_t type metadata accessor for TipKitViewModel()
{
  uint64_t result;

  result = qword_2577AE030;
  if (!qword_2577AE030)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_248A745B8()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_248A745C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_248A72D5C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent, &qword_2577ADFD8);
}

uint64_t sub_248A745E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248A72DC8(a1, a2, a3, a4, &qword_2577ADFE0, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__hasContent, &qword_2577ADFD8);
}

uint64_t sub_248A74614@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewBackgroundColor, a2);
}

uint64_t sub_248A74620(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_248A72080(a1, a2, a3, a4, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewBackgroundColor);
}

uint64_t sub_248A7463C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_11Tm(a1, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor, a2);
}

uint64_t keypath_get_11Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  *a3 = *v4;
  return swift_retain();
}

uint64_t sub_248A74698(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_248A72080(a1, a2, a3, a4, &OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewContentBackgroundColor);
}

id sub_248A746B4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipViewIcon);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_248A74728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_248A72D5C(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent, &qword_2577ADFF0);
}

uint64_t sub_248A7474C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248A72DC8(a1, a2, a3, a4, &qword_2577ADFF8, (uint64_t)&OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel__tipContent, &qword_2577ADFF0);
}

uint64_t sub_248A74778()
{
  return type metadata accessor for TipKitViewModel();
}

void sub_248A74780()
{
  unint64_t v0;
  unint64_t v1;

  sub_248A74D28();
  if (v0 <= 0x3F)
  {
    sub_248A74D7C();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for TipKitViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TipKitViewModel.hasContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TipKitViewModel.hasContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TipKitViewModel.hasContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of TipKitViewModel.$hasContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of TipKitViewModel.$hasContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TipKitViewModel.$hasContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewBackgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewBackgroundColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewBackgroundColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewContentBackgroundColor.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewContentBackgroundColor.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewContentBackgroundColor.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewIcon.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewIcon.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TipKitViewModel.tipViewIcon.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TipKitViewModel.customizationHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of TipKitViewModel.customizationHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TipKitViewModel.customizationHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TipKitViewModel.personalizationHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TipKitViewModel.personalizationHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t dispatch thunk of TipKitViewModel.personalizationHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of TipKitViewModel.clientContextMapHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of TipKitViewModel.clientContextMapHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of TipKitViewModel.clientContextMapHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of TipKitViewModel.eventOccurredHandler.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of TipKitViewModel.eventOccurredHandler.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of TipKitViewModel.eventOccurredHandler.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of TipKitViewModel.tipContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of TipKitViewModel.tipContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of TipKitViewModel.tipContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of TipKitViewModel.$tipContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x190))();
}

uint64_t dispatch thunk of TipKitViewModel.$tipContent.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x198))();
}

uint64_t dispatch thunk of TipKitViewModel.$tipContent.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of TipKitViewModel.contentId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of TipKitViewModel.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 432))();
}

uint64_t dispatch thunk of TipKitViewModel.start()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of TipKitViewModel.pause()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of TipKitViewModel.createTipContentView()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of TipKitViewModel.actionTapped(identifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D0))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:contentDidBecomeAvailable:animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1D8))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:contentView:iconForCustomizationID:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:didFinishWith:animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:eventOccurred:content:context:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F0))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:personalizedStringForID:content:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1F8))();
}

uint64_t dispatch thunk of TipKitViewModel.contentController(_:clientContextMapForKeys:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x200))();
}

void sub_248A74D28()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577AE040)
  {
    v0 = sub_248A9C01C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577AE040);
  }
}

void sub_248A74D7C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577AE048)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_2577AE660);
    v0 = sub_248A9C01C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577AE048);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495A3E2C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_248A74E18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE058);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_248A74E60(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_248A74E70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577ADE88;
  if (!qword_2577ADE88)
  {
    type metadata accessor for TPKClientContextKey(255);
    result = MEMORY[0x2495A3E38](&unk_248A9E1E4, v1);
    atomic_store(result, (unint64_t *)&qword_2577ADE88);
  }
  return result;
}

uint64_t sub_248A74EB8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248A74EDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t *, uint64_t *, uint64_t *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(uint64_t (**)(uint64_t *, uint64_t *, uint64_t *))(v3 + 16);
  v7 = a2;
  v8 = a1;
  v6 = a3;
  return v4(&v8, &v7, &v6);
}

uint64_t sub_248A74F18(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v3 + 16))(*a1, *a2, *a3);
}

uint64_t sub_248A74F44(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t *__return_ptr, uint64_t *);
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16);
  v5 = a1;
  v2(&v4, &v5);
  return v4;
}

uint64_t sub_248A74F7C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(v2 + 16))(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_248A74FA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t *__return_ptr, uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t *))(v2 + 16);
  v6 = a2;
  v7 = a1;
  v3(&v5, &v7, &v6);
  return v5;
}

uint64_t sub_248A74FE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v6;

  result = (*(uint64_t (**)(_QWORD, _QWORD))(v3 + 16))(*a1, *a2);
  *a3 = result;
  a3[1] = v6;
  return result;
}

uint64_t sub_248A75014(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_248A75044(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

_QWORD *sub_248A75090(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE070);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_248A751C4(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE080);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088) - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_248A75340(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE098);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_248A75438(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE090);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_248A75538(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v2 = a1 + 32;
  swift_bridgeObjectRetain();
  v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    sub_248A756C8(v2, (uint64_t)v15);
    v4 = v16;
    v5 = v17;
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    result = (_QWORD *)__swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    v8 = *(_QWORD *)(v6 + 16);
    v9 = v3[2];
    v10 = v9 + v8;
    if (__OFADD__(v9, v8))
      break;
    result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v10 <= v3[3] >> 1)
    {
      if (*(_QWORD *)(v6 + 16))
        goto LABEL_14;
    }
    else
    {
      if (v9 <= v10)
        v11 = v9 + v8;
      else
        v11 = v9;
      result = sub_248A75090(result, v11, 1, v3);
      v3 = result;
      if (*(_QWORD *)(v6 + 16))
      {
LABEL_14:
        if ((v3[3] >> 1) - v3[2] < v8)
          goto LABEL_23;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE070);
        result = (_QWORD *)swift_arrayInitWithCopy();
        if (v8)
        {
          v12 = v3[2];
          v13 = __OFADD__(v12, v8);
          v14 = v12 + v8;
          if (v13)
            goto LABEL_24;
          v3[2] = v14;
        }
        goto LABEL_4;
      }
    }
    if (v8)
      goto LABEL_22;
LABEL_4:
    swift_bridgeObjectRelease();
    v2 += 40;
    if (!--v1)
    {
      swift_bridgeObjectRelease();
      return v3;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_248A756C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_248A75754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v6;
  uint64_t v7;
  char v9;
  char v10;
  void *ObjCClassFromMetadata;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[2];
  _QWORD v20[4];

  if (sub_248A9C5C8() == a1 && v4 == a2)
    goto LABEL_15;
  v6 = sub_248A9C7FC();
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    return 0;
  if (sub_248A9C5C8() == a1 && v7 == a2)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = sub_248A9C7FC();
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
    return 0;
  sub_248A9C5C8();
  v10 = sub_248A9C64C();
  swift_bridgeObjectRelease();
  if ((v10 & 1) == 0)
  {
    v20[0] = sub_248A9C5C8();
    v20[1] = v16;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v19[0] = sub_248A9C658();
    *((_QWORD *)&v19[0] + 1) = v17;
    sub_248A9C5EC();
    swift_bridgeObjectRelease();
    v12 = sub_248A75754(*(_QWORD *)&v19[0], *((_QWORD *)&v19[0] + 1));
    swift_bridgeObjectRelease();
    return v12;
  }
  sub_248A716AC();
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_bridgeObjectRetain();
  v12 = 0;
  if (objc_msgSend(ObjCClassFromMetadata, sel_respondsToSelector_, sub_248A9BF8C()))
  {
    v13 = (void *)sub_248A9C5A4();
    v14 = objc_msgSend(ObjCClassFromMetadata, sel_valueForKey_, v13);

    if (v14)
    {
      sub_248A9C730();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v19, 0, sizeof(v19));
    }
    sub_248A759D4((uint64_t)v19, (uint64_t)v20);
    if (v20[3])
    {
      if (swift_dynamicCast())
        return v18;
      else
        return 0;
    }
    sub_248A75A1C((uint64_t)v20);
    return 0;
  }
  return v12;
}

uint64_t sub_248A759D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25446CD50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A75A1C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25446CD50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248A75A9C()
{
  return sub_248A75E10(&OBJC_IVAR___TPKContentPopoverViewController_sourceViewController);
}

void sub_248A75AF8(void *a1)
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void (*sub_248A75B4C(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___TPKContentPopoverViewController_sourceViewController;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2495A3F58](v5);
  return sub_248A75BBC;
}

void sub_248A75BBC(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {

    swift_endAccess();
  }
  else
  {
    swift_endAccess();

  }
  free(v3);
}

void *sub_248A75C6C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A75D14(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t sub_248A75DAC()
{
  return 1;
}

id sub_248A75DC0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = a1 + *a3;
  swift_beginAccess();
  return (id)MEMORY[0x2495A3F58](v3);
}

uint64_t sub_248A75E04()
{
  return sub_248A75E10(&OBJC_IVAR___TPKContentPopoverViewController_sourceView);
}

uint64_t sub_248A75E10(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = v1 + *a1;
  swift_beginAccess();
  return MEMORY[0x2495A3F58](v2);
}

void sub_248A75EF0(void *a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_popoverPresentationController);
  objc_msgSend(v3, sel_setSourceView_, a1);

  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void sub_248A75F7C(id *a1, void **a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a2;
  v3 = *a1;
  v4 = objc_msgSend(v2, sel_popoverPresentationController);
  objc_msgSend(v4, sel_setSourceView_, v3);

  swift_beginAccess();
  swift_unknownObjectWeakAssign();

}

void (*sub_248A76014(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___TPKContentPopoverViewController_sourceView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2495A3F58](v5);
  return sub_248A76084;
}

void sub_248A76084(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v2 = *(void **)a1;
  v4 = (void **)(*(_QWORD *)a1 + 24);
  v3 = *v4;
  v5 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v6 = v3;
    v7 = objc_msgSend(v5, sel_popoverPresentationController);
    objc_msgSend(v7, sel_setSourceView_, v6);

    swift_unknownObjectWeakAssign();
    v3 = *v4;
  }
  else
  {
    v8 = objc_msgSend(*(id *)(*(_QWORD *)a1 + 32), sel_popoverPresentationController);
    objc_msgSend(v8, sel_setSourceView_, v3);

    swift_unknownObjectWeakAssign();
  }

  free(v2);
}

double sub_248A761F0()
{
  void *v0;
  id v1;
  void *v2;
  double v3;
  double v4;

  v1 = objc_msgSend(v0, sel_popoverPresentationController);
  if (!v1)
    return 0.0;
  v2 = v1;
  objc_msgSend(v1, sel_sourceRect);
  v4 = v3;

  return v4;
}

void sub_248A76300(double a1, double a2, double a3, double a4)
{
  void *v4;
  id v9;

  v9 = objc_msgSend(v4, sel_popoverPresentationController);
  objc_msgSend(v9, sel_setSourceRect_, a1, a2, a3, a4);

}

void sub_248A76374(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_msgSend(*a1, sel_popoverPresentationController);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_sourceRect);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    v10 = 0;
    v12 = 0;
    v6 = 0;
    v8 = 0;
  }
  *a2 = v6;
  a2[1] = v8;
  a2[2] = v10;
  a2[3] = v12;
}

void sub_248A763FC(double *a1, id *a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = objc_msgSend(*a2, sel_popoverPresentationController);
  objc_msgSend(v6, sel_setSourceRect_, v2, v3, v4, v5);

}

void (*sub_248A76468(_QWORD *a1))(double **a1)
{
  void *v1;
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  v4 = objc_msgSend(v1, sel_popoverPresentationController);
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_sourceRect);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0;
    v7 = 0;
    v9 = 0;
  }
  *v3 = v7;
  v3[1] = v9;
  v3[2] = v11;
  v3[3] = v13;
  return sub_248A76518;
}

void sub_248A76518(double **a1)
{
  double *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;

  v1 = *a1;
  v2 = **a1;
  v3 = (*a1)[1];
  v4 = (*a1)[2];
  v5 = (*a1)[3];
  v6 = objc_msgSend(*((id *)*a1 + 4), sel_popoverPresentationController);
  objc_msgSend(v6, sel_setSourceRect_, v2, v3, v4, v5);

  free(v1);
}

id sub_248A765F8()
{
  void *v0;
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(v0, sel_popoverPresentationController);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_permittedArrowDirections);

    return v3;
  }
  return result;
}

void sub_248A766A4(uint64_t a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_popoverPresentationController);
  objc_msgSend(v3, sel_setPermittedArrowDirections_, a1);

}

void sub_248A766F8(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(*a1, sel_popoverPresentationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_permittedArrowDirections);

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_248A7675C(uint64_t *a1, id *a2)
{
  uint64_t v2;
  id v3;

  v2 = *a1;
  v3 = objc_msgSend(*a2, sel_popoverPresentationController);
  objc_msgSend(v3, sel_setPermittedArrowDirections_, v2);

}

void (*sub_248A767B0(_QWORD *a1))(uint64_t *a1)
{
  void *v1;
  id v3;
  void *v4;
  id v5;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_popoverPresentationController);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_permittedArrowDirections);

  }
  else
  {
    v5 = 0;
  }
  *a1 = v5;
  return sub_248A76824;
}

void sub_248A76824(uint64_t *a1)
{
  uint64_t v1;
  id v2;

  v1 = *a1;
  v2 = objc_msgSend((id)a1[1], sel_popoverPresentationController);
  objc_msgSend(v2, sel_setPermittedArrowDirections_, v1);

}

double sub_248A768BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_248A76944(double a1)
{
  char *v1;
  char *v2;
  double *v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  void (*v12)(void);
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  char isEscapingClosureAtFileLocation;
  _QWORD v20[6];

  v2 = v1;
  v4 = (double *)&v1[OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth];
  swift_beginAccess();
  *v4 = a1;
  result = sub_248A77EB4();
  if ((v7 & 1) == 0)
  {
    v8 = result;
    v9 = v6;
    v10 = &v2[OBJC_IVAR___TPKContentPopoverViewController_contentView];
    swift_beginAccess();
    v11 = *(_QWORD **)v10;
    if (*(_QWORD *)v10)
    {
      v12 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v11) + 0x138);
      v13 = v11;
      v12();

    }
    v14 = (void *)objc_opt_self();
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = v2;
    v15[3] = v8;
    v15[4] = v9;
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = sub_248A786B4;
    *(_QWORD *)(v16 + 24) = v15;
    v20[4] = sub_248A786C8;
    v20[5] = v16;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 1107296256;
    v20[2] = sub_248A77E94;
    v20[3] = &block_descriptor;
    v17 = _Block_copy(v20);
    v18 = v2;
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_performWithoutAnimation_, v17);
    _Block_release(v17);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void (*sub_248A76B14(_QWORD *a1))(_QWORD **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x50uLL);
  *a1 = v3;
  v3[9] = v1;
  swift_beginAccess();
  return sub_248A76B6C;
}

void sub_248A76B6C(_QWORD **a1, char a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD **v9;
  _QWORD *v10;
  void (*v11)(void);
  _QWORD *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) != 0)
    goto LABEL_6;
  v4 = sub_248A77EB4();
  if ((v6 & 1) != 0)
    goto LABEL_6;
  v7 = v4;
  v8 = v5;
  v9 = (_QWORD **)(v3[9] + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  v10 = *v9;
  if (*v9)
  {
    v11 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v10) + 0x138);
    v12 = v10;
    v11();

  }
  v13 = (void *)v3[9];
  v14 = (void *)objc_opt_self();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v13;
  v15[3] = v7;
  v15[4] = v8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = sub_248A786B4;
  *(_QWORD *)(v16 + 24) = v15;
  v3[4] = sub_248A78BA0;
  v3[5] = v16;
  *v3 = MEMORY[0x24BDAC760];
  v3[1] = 1107296256;
  v3[2] = sub_248A77E94;
  v3[3] = &block_descriptor_14;
  v17 = _Block_copy(v3);
  v18 = v13;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_performWithoutAnimation_, v17);
  _Block_release(v17);
  LOBYTE(v17) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v17 & 1) == 0)
LABEL_6:
    free(v3);
  else
    __break(1u);
}

char *TPKContentPopoverViewController.__allocating_init(contentController:tipContent:sourceViewController:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:)(a1, a2, a3);
}

char *TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:)(void *a1, void *a2, void *a3)
{
  char *v3;
  char *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  id *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  objc_super v35;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___TPKContentPopoverViewController_contentView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth] = 0;
  v35.receiver = v3;
  v35.super_class = (Class)type metadata accessor for TPKContentPopoverViewController();
  v7 = (char *)objc_msgSendSuper2(&v35, sel_initWithNibName_bundle_, 0, 0);
  objc_msgSend(v7, sel_setModalPresentationStyle_, 7);
  objc_msgSend(v7, sel_setModalInPresentation_, 0);
  v8 = objc_msgSend(v7, sel_popoverPresentationController);
  objc_msgSend(v8, sel_setPermittedArrowDirections_, 3);

  v9 = objc_allocWithZone((Class)type metadata accessor for TPKTipContentPlainView());
  v10 = a1;
  v11 = a2;
  v12 = objc_msgSend(v9, sel_initWithController_content_, v10, v11);
  v13 = v12;
  if (v12)
  {
    v14 = *MEMORY[0x24BEBD250];
    v15 = *(double *)(MEMORY[0x24BEBD250] + 8);
    v16 = *(double *)(MEMORY[0x24BEBD250] + 16);
    v17 = *(double *)(MEMORY[0x24BEBD250] + 24);
    v18 = v12;
    objc_msgSend(v18, sel_setDirectionalLayoutMargins_, v14, v15, v16, v17);
    sub_248A88BB0();

  }
  v19 = (id *)&v7[OBJC_IVAR___TPKContentPopoverViewController_contentView];
  swift_beginAccess();
  v20 = *v19;
  *v19 = v13;

  v21 = *v19;
  if (*v19)
  {
    v22 = (void *)objc_opt_self();
    v23 = v21;
    v24 = objc_msgSend(v22, sel_clearColor);
    objc_msgSend(v23, sel_setBackgroundColor_, v24);

    if (*v19)
      objc_msgSend(*v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  }
  if (a3)
  {
    swift_beginAccess();
    swift_unknownObjectWeakAssign();
    v25 = a3;
    v26 = objc_msgSend(v25, sel_view);
    v27 = &v7[OBJC_IVAR___TPKContentPopoverViewController_sourceView];
    swift_beginAccess();
    swift_unknownObjectWeakAssign();

    v28 = objc_msgSend(v7, sel_popoverPresentationController);
    if (v28)
    {
      v29 = v28;
      v30 = (void *)MEMORY[0x2495A3F58](v27);
      sub_248A78078(v30);

      sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
      v31 = sub_248A9C67C();
      swift_bridgeObjectRelease();
      objc_msgSend(v29, sel_setPassthroughViews_, v31);

      v32 = v11;
      v10 = v25;
      v11 = v25;
      v25 = v29;
    }
    else
    {
      v32 = v7;
      v31 = (uint64_t)v25;
    }

    v33 = v11;
    v10 = v25;
    v11 = (id)v31;
  }
  else
  {
    v33 = v7;
  }

  return v7;
}

id TPKContentPopoverViewController.__allocating_init(contentController:tipContent:sourceViewController:popoverDelegate:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_msgSend(objc_allocWithZone(v3), sel_initWithContentController_tipContent_sourceViewController_, a1, a2, a3);

  if (v7)
    swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v7;
}

id TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:popoverDelegate:)(void *a1, void *a2, void *a3)
{
  void *v3;
  id v7;

  v7 = objc_msgSend(v3, sel_initWithContentController_tipContent_sourceViewController_, a1, a2, a3);

  if (v7)
    swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  return v7;
}

id TPKContentPopoverViewController.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___TPKContentPopoverViewController_contentView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKContentPopoverViewController();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

uint64_t sub_248A77418()
{
  void *v0;
  uint64_t result;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  id v10;
  char isEscapingClosureAtFileLocation;
  _QWORD v12[6];
  objc_super v13;

  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for TPKContentPopoverViewController();
  objc_msgSendSuper2(&v13, sel_viewDidLayoutSubviews);
  result = sub_248A77EB4();
  if ((v3 & 1) == 0)
  {
    v4 = result;
    v5 = v2;
    v6 = (void *)objc_opt_self();
    v7 = (_QWORD *)swift_allocObject();
    v7[2] = v0;
    v7[3] = v4;
    v7[4] = v5;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_248A786B4;
    *(_QWORD *)(v8 + 24) = v7;
    v12[4] = sub_248A78BA0;
    v12[5] = v8;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 1107296256;
    v12[2] = sub_248A77E94;
    v12[3] = &block_descriptor_25;
    v9 = _Block_copy(v12);
    v10 = v0;
    swift_retain();
    swift_release();
    objc_msgSend(v6, sel_performWithoutAnimation_, v9);
    _Block_release(v9);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_248A77670(char a1)
{
  void *v1;
  id v3;
  id v4;

  v3 = objc_msgSend(v1, sel_presentingViewController);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_dismissViewControllerAnimated_completion_, a1 & 1, 0);

  }
}

void sub_248A7774C()
{
  char *v0;
  id v1;
  void *v2;
  char *v3;
  void *v4;
  void *v5;

  v1 = objc_msgSend(v0, sel_popoverPresentationController);
  if (v1)
  {
    v2 = v1;
    v3 = &v0[OBJC_IVAR___TPKContentPopoverViewController_sourceView];
    swift_beginAccess();
    v4 = (void *)MEMORY[0x2495A3F58](v3);
    sub_248A78078(v4);

    sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
    v5 = (void *)sub_248A9C67C();
    swift_bridgeObjectRelease();
    objc_msgSend(v2, sel_setPassthroughViews_, v5);

  }
}

void sub_248A77910()
{
  char *v0;
  id *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;

  v1 = (id *)&v0[OBJC_IVAR___TPKContentPopoverViewController_contentView];
  swift_beginAccess();
  if (*v1)
  {
    v2 = *v1;
    v3 = objc_msgSend(v2, sel_superview);

    if (v3)
    {
LABEL_10:

      return;
    }
    v4 = objc_msgSend(v0, sel_view);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, sel_addSubview_, v2);

      v6 = objc_msgSend(v0, sel_view);
      if (v6)
      {
        v7 = v6;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
        v8 = swift_allocObject();
        *(_OWORD *)(v8 + 16) = xmmword_248A9E8B0;
        v9 = objc_msgSend(v2, sel_leadingAnchor);
        v10 = objc_msgSend(v0, sel_view);
        if (v10)
        {
          v11 = v10;
          v12 = objc_msgSend(v10, sel_safeAreaLayoutGuide);

          v13 = objc_msgSend(v12, sel_leadingAnchor);
          v14 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v13);

          *(_QWORD *)(v8 + 32) = v14;
          v15 = objc_msgSend(v2, sel_topAnchor);
          v16 = objc_msgSend(v0, sel_view);
          if (v16)
          {
            v17 = v16;
            v18 = objc_msgSend(v16, sel_safeAreaLayoutGuide);

            v19 = objc_msgSend(v18, sel_topAnchor);
            v20 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v19);

            *(_QWORD *)(v8 + 40) = v20;
            v21 = objc_msgSend(v0, sel_view);
            if (v21)
            {
              v22 = v21;
              v23 = objc_msgSend(v21, sel_safeAreaLayoutGuide);

              v24 = objc_msgSend(v23, sel_trailingAnchor);
              v25 = objc_msgSend(v2, sel_trailingAnchor);
              v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

              *(_QWORD *)(v8 + 48) = v26;
              v27 = objc_msgSend(v0, sel_view);
              if (v27)
              {
                v28 = v27;
                v29 = objc_msgSend(v27, sel_safeAreaLayoutGuide);

                v30 = objc_msgSend(v29, sel_bottomAnchor);
                v31 = objc_msgSend(v2, sel_bottomAnchor);
                v32 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v31);

                *(_QWORD *)(v8 + 56) = v32;
                v34 = v8;
                sub_248A9C694();
                sub_248A78B44(0, (unint64_t *)&qword_2577AE0F8);
                v33 = sub_248A9C67C();
                swift_bridgeObjectRelease();
                objc_msgSend(v7, sel_addConstraints_, v33, v34);

                v2 = (id)v33;
                goto LABEL_10;
              }
LABEL_17:
              __break(1u);
              return;
            }
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
LABEL_15:
          __break(1u);
          goto LABEL_16;
        }
LABEL_14:
        __break(1u);
        goto LABEL_15;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_14;
  }
}

uint64_t sub_248A77CF0(char a1)
{
  char *v1;
  void *v2;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  void (*v11)(void);
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  id v17;
  char isEscapingClosureAtFileLocation;
  _QWORD aBlock[6];

  v2 = v1;
  result = sub_248A77EB4();
  if ((v6 & 1) == 0)
  {
    v7 = result;
    v8 = v5;
    if ((a1 & 1) != 0)
    {
      v9 = &v1[OBJC_IVAR___TPKContentPopoverViewController_contentView];
      swift_beginAccess();
      v10 = *(_QWORD **)v9;
      if (*(_QWORD *)v9)
      {
        v11 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v10) + 0x138);
        v12 = v10;
        v11();

      }
    }
    v13 = (void *)objc_opt_self();
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = v2;
    v14[3] = v7;
    v14[4] = v8;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_248A786B4;
    *(_QWORD *)(v15 + 24) = v14;
    aBlock[4] = sub_248A78BA0;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_248A77E94;
    aBlock[3] = &block_descriptor_46;
    v16 = _Block_copy(aBlock);
    v17 = v2;
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_performWithoutAnimation_, v16);
    _Block_release(v16);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_248A77E94(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_248A77EB4()
{
  char *v0;
  id *v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  double *v7;
  double v8;
  uint64_t v9;
  id v10;
  id v11;
  double Width;
  uint64_t v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v1 = (id *)&v0[OBJC_IVAR___TPKContentPopoverViewController_contentView];
  swift_beginAccess();
  if (!*v1)
    return 0;
  v2 = *v1;
  v3 = objc_msgSend(v0, sel_presentingViewController);
  if (!v3
    || (v4 = v3, v5 = objc_msgSend(v3, sel_traitCollection), v4, !v5))
  {

    return 0;
  }
  objc_msgSend(v2, sel_frame);
  if (CGRectGetWidth(v14) == 0.0)
  {

    return 0;
  }
  v7 = (double *)&v0[OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth];
  swift_beginAccess();
  v8 = *v7;
  if (*v7 == 0.0 || (objc_msgSend(v2, sel_frame), v8 >= CGRectGetWidth(v15)))
  {
    v10 = objc_msgSend(v5, sel_horizontalSizeClass);
    v11 = objc_msgSend(v5, sel_verticalSizeClass);
    objc_msgSend(v2, sel_frame);
    Width = CGRectGetWidth(v16);
    if (v10 != (id)1 || v11 != (id)2)
      Width = fmin(Width, 320.0);
    objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, Width, 0.0);
  }
  else
  {
    objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v8, 0.0);
  }
  v13 = v9;

  return v13;
}

uint64_t sub_248A78078(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t ObjectType;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (!a1)
    return MEMORY[0x24BEE4AF8];
  v1 = a1;
  v2 = objc_msgSend(v1, sel_superview);
  if (!v2)
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_248A9E8C0;
    *(_QWORD *)(v10 + 32) = v1;
    v12 = v10;
    sub_248A9C694();
    return v12;
  }
  v3 = v2;
  ObjectType = swift_getObjectType();
  if (ObjectType == sub_248A78B44(0, (unint64_t *)&unk_2577AE100))
  {

    goto LABEL_9;
  }
  v5 = v3;
  v6 = sub_248A78078(v3);

  v7 = v1;
  v8 = swift_bridgeObjectRetain();
  MEMORY[0x2495A36AC](v8);
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_248A9C6A0();
  sub_248A9C6AC();
  sub_248A9C694();
  v9 = v6;

  swift_bridgeObjectRelease();
  return v9;
}

void sub_248A781D8()
{
  char *v0;
  void **v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;

  v1 = (void **)&v0[OBJC_IVAR___TPKContentPopoverViewController_contentView];
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    v3 = (void *)objc_opt_self();
    v4 = v2;
    v5 = objc_msgSend(v3, sel_effectWithStyle_, 8);
    v6 = objc_msgSend(v0, sel_traitCollection);
    v7 = objc_msgSend(v6, sel_userInterfaceStyle);

    v8 = objc_msgSend((id)objc_opt_self(), sel_effectForBlurEffect_style_, v5, v7 == (id)2);
    sub_248A8C998(v8);

  }
}

id sub_248A782D8()
{
  void *v0;
  objc_class *v1;
  id v2;
  void *v3;
  id v4;
  objc_super v6;
  objc_super v7;

  v1 = (objc_class *)type metadata accessor for TPKContentPopoverViewController();
  v7.receiver = v0;
  v7.super_class = v1;
  v2 = objc_msgSendSuper2(&v7, sel_popoverPresentationController);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_delegate);
    swift_unknownObjectRelease();
    if (!v4)
    {
      objc_msgSend(v3, sel_setDelegate_, v0);
      objc_msgSend(v3, sel_setPopoverLayoutMargins_, *MEMORY[0x24BEBE158], *(double *)(MEMORY[0x24BEBE158] + 8), *(double *)(MEMORY[0x24BEBE158] + 16), *(double *)(MEMORY[0x24BEBE158] + 24));
      return v3;
    }

  }
  v6.receiver = v0;
  v6.super_class = v1;
  return objc_msgSendSuper2(&v6, sel_popoverPresentationController);
}

id TPKContentPopoverViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_248A9C5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void TPKContentPopoverViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPKContentPopoverViewController.__deallocating_deinit()
{
  return sub_248A78660(type metadata accessor for TPKContentPopoverViewController);
}

char *TPKContentViewController.__allocating_init(contentController:tipContent:sourceViewController:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return TPKContentPopoverViewController.init(contentController:tipContent:sourceViewController:)(a1, a2, a3);
}

id TPKContentViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKContentViewController.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKContentViewController();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TPKContentViewController.__deallocating_deinit()
{
  return sub_248A78660(type metadata accessor for TPKContentViewController);
}

id sub_248A78660(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_248A78690()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_248A786B8()
{
  return swift_deallocObject();
}

uint64_t sub_248A786C8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t sub_248A78700()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for TPKContentPopoverViewController()
{
  return objc_opt_self();
}

uint64_t sub_248A78730()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for TPKContentViewController()
{
  return objc_opt_self();
}

uint64_t sub_248A78760@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPKContentPopoverViewController_sourceViewController, a2);
}

uint64_t sub_248A7876C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

id sub_248A787C0@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___TPKContentPopoverViewController_contentView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t sub_248A78814@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR___TPKContentPopoverViewController_sourceView, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = *a1 + *a2;
  swift_beginAccess();
  result = MEMORY[0x2495A3F58](v4);
  *a3 = result;
  return result;
}

double sub_248A78884@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR___TPKContentPopoverViewController_preferredPopoverWidth);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_248A788D4(double *a1)
{
  return sub_248A76944(*a1);
}

uint64_t method lookup function for TPKContentPopoverViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceViewController.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceViewController.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceViewController.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.contentView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController._canShowWhileLocked.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceView.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceView.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceRect.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceRect.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.sourceRect.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.permittedArrowDirections.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.permittedArrowDirections.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.permittedArrowDirections.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.preferredPopoverWidth.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.preferredPopoverWidth.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.preferredPopoverWidth.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.__allocating_init(contentController:tipContent:sourceViewController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.dismissPopover(animated:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x130))();
}

uint64_t dispatch thunk of TPKContentPopoverViewController.passthroughViewsNeedsUpdate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t sub_248A78B20(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_248A78B44(uint64_t a1, unint64_t *a2)
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

id sub_248A78B7C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setPreferredContentSize_, *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_248A78B90()
{
  return swift_deallocObject();
}

void *sub_248A78C14()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A78CBC(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

id sub_248A78D4C()
{
  char *v0;
  void **v1;
  void *v2;
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  id v10;

  v1 = (void **)&v0[OBJC_IVAR___TPKTipContentCollectionViewCell_tipView];
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    v3 = *v1;
  }
  else
  {
    v4 = (char *)objc_allocWithZone((Class)type metadata accessor for TPKContentView());
    v5 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
    v6 = (void *)objc_opt_self();
    v7 = v0;
    v8 = v4;
    *(_QWORD *)&v4[v5] = objc_msgSend(v6, sel_currentTraitCollection);
    v8[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
    v9 = OBJC_IVAR___TPKContentView_imageProxy;
    type metadata accessor for TipImageProxy();
    *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

    v3 = sub_248A7993C(v8);
    v2 = 0;
  }
  v10 = v2;
  return v3;
}

void sub_248A78EF0(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = v2;
  v6 = (id *)(v3 + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  if (*v6)
    objc_msgSend(*v6, sel_removeFromSuperview);
  v7 = objc_allocWithZone((Class)type metadata accessor for TPKTipContentHintView());
  v8 = a2;
  v9 = a1;
  v10 = objc_msgSend(v7, sel_initWithController_content_, v8, v9);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    sub_248A9AC58();

  }
  v13 = *v6;
  *v6 = v11;

  sub_248A78FD0();
}

void sub_248A78FD0()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v1 = objc_msgSend(v0, sel_tipView);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v0, sel_contentView);
    objc_msgSend(v3, sel_addSubview_, v2);

    v4 = objc_msgSend(v0, sel_contentView);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_248A9E8B0;
    v6 = objc_msgSend(v2, sel_leadingAnchor);
    v7 = objc_msgSend(v0, sel_contentView);
    v8 = objc_msgSend(v7, sel_leadingAnchor);

    v9 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v8);
    *(_QWORD *)(v5 + 32) = v9;
    v10 = objc_msgSend(v2, sel_topAnchor);
    v11 = objc_msgSend(v0, sel_contentView);
    v12 = objc_msgSend(v11, sel_topAnchor);

    v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
    *(_QWORD *)(v5 + 40) = v13;
    v14 = objc_msgSend(v2, sel_trailingAnchor);
    v15 = objc_msgSend(v0, sel_contentView);
    v16 = objc_msgSend(v15, sel_trailingAnchor);

    v17 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v16);
    *(_QWORD *)(v5 + 48) = v17;
    v18 = objc_msgSend(v2, sel_bottomAnchor);
    v19 = objc_msgSend(v0, sel_contentView);
    v20 = objc_msgSend(v19, sel_bottomAnchor);

    v21 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v20);
    *(_QWORD *)(v5 + 56) = v21;
    sub_248A9C694();
    sub_248A798FC();
    v22 = (id)sub_248A9C67C();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_addConstraints_, v22);

  }
}

void sub_248A792E4()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_tipView);
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v0, sel_addSubview_, v2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
    v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_248A9E8B0;
    v5 = v1;
    v6 = objc_msgSend(v3, sel_leadingAnchor);
    v7 = objc_msgSend(v5, sel_leadingAnchor);
    v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

    *(_QWORD *)(v4 + 32) = v8;
    v9 = objc_msgSend(v3, sel_topAnchor);
    v10 = objc_msgSend(v5, sel_topAnchor);
    v11 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v10);

    *(_QWORD *)(v4 + 40) = v11;
    v12 = objc_msgSend(v3, sel_trailingAnchor);
    v13 = objc_msgSend(v5, sel_trailingAnchor);
    v14 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v13);

    *(_QWORD *)(v4 + 48) = v14;
    v15 = objc_msgSend(v3, sel_bottomAnchor);
    v16 = objc_msgSend(v5, sel_bottomAnchor);
    v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    *(_QWORD *)(v4 + 56) = v17;
    sub_248A9C694();
    sub_248A798FC();
    v18 = (id)sub_248A9C67C();
    swift_bridgeObjectRelease();
    objc_msgSend(v5, sel_addConstraints_, v18);

  }
}

id TPKTipContentCollectionViewCell.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TPKTipContentCollectionViewCell.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_super v10;

  *(_QWORD *)&v4[OBJC_IVAR___TPKTipContentCollectionViewCell_tipView] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id TPKTipContentCollectionViewCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentCollectionViewCell.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentCollectionViewCell_tipView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentCollectionViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentCollectionViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPKTipContentCollectionViewCell()
{
  return objc_opt_self();
}

id sub_248A79848@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___TPKTipContentCollectionViewCell_tipView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for TPKTipContentCollectionViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKTipContentCollectionViewCell.tipView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TPKTipContentCollectionViewCell.tipContentView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPKTipContentCollectionViewCell.setContent(_:contentController:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

unint64_t sub_248A798FC()
{
  unint64_t result;

  result = qword_2577AE0F8;
  if (!qword_2577AE0F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577AE0F8);
  }
  return result;
}

id sub_248A7993C(char *a1)
{
  char *v2;
  uint64_t v8;
  void *v9;
  char *v10;
  objc_super v12;

  v2 = &a1[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)v2 = _Q0;
  *((_OWORD *)v2 + 1) = _Q0;
  v8 = OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor;
  v9 = (void *)objc_opt_self();
  v10 = a1;
  *(_QWORD *)&a1[v8] = objc_msgSend(v9, sel_tertiarySystemFillColor);
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_hostingView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_viewModel] = 0;
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_content] = 0;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for TPKBaseContentView();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

id sub_248A79A60()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView;
  v2 = *(void **)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView);
  }
  else
  {
    type metadata accessor for TPKTipContentAnnotationBubbleView();
    v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_248A79B28()
{
  uint64_t v0;
  _BYTE *v1;
  uint64_t result;

  v1 = (_BYTE *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection);
  if (*(_BYTE *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection + 8) != 1)
    return *(_QWORD *)v1;
  result = -1;
  *(_QWORD *)v1 = -1;
  v1[8] = 0;
  return result;
}

double sub_248A79B70()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect;
  if ((*(_BYTE *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect + 32) & 1) == 0)
    return *(double *)v1;
  *(_BYTE *)(v1 + 32) = 0;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  return 0.0;
}

double sub_248A79BB0()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter;
  if ((*(_BYTE *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter + 16) & 1) == 0)
    return *(double *)v1;
  *(_QWORD *)v1 = 0;
  *(_QWORD *)(v1 + 8) = 0;
  result = 0.0;
  *(_BYTE *)(v1 + 16) = 0;
  return result;
}

uint64_t sub_248A79BE0()
{
  uint64_t v0;
  int v1;
  uint64_t result;

  v1 = *(unsigned __int8 *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset);
  if (v1 != 2)
    return v1 & 1;
  result = 0;
  *(_BYTE *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset) = 0;
  return result;
}

uint64_t type metadata accessor for TPKTipContentAnnotationView()
{
  return objc_opt_self();
}

char *TPKTipContentAnnotationView.__allocating_init(contentController:tipContent:sourceView:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return TPKTipContentAnnotationView.init(contentController:tipContent:sourceView:)(a1, a2, a3);
}

char *TPKTipContentAnnotationView.init(contentController:tipContent:sourceView:)(void *a1, void *a2, void *a3)
{
  void *v3;
  char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = (char *)objc_msgSend(v3, sel_initWithController_content_, a1, a2);
  if (v7)
  {
    *(_QWORD *)&v7[OBJC_IVAR___TPKTipContentAnnotationView_sourceType] = sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
    swift_unknownObjectWeakAssign();
    v8 = *(double *)&v7[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
    v9 = *(double *)&v7[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 8];
    v10 = *(double *)&v7[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 16];
    v11 = *(double *)&v7[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 24];
    v12 = v7;
    objc_msgSend(v12, sel_setDirectionalLayoutMargins_, v8, v9, v10, v11);
    v13 = sub_248A79A60();
    v14 = *(id *)&v12[OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor];
    objc_msgSend(v13, sel_setBackgroundColor_, v14);

    v15 = sub_248A79A60();
    objc_msgSend(v15, sel_setClipsToBounds_, 1);

    v16 = sub_248A79A60();
    objc_msgSend(v16, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

    sub_248A7A5A4();
    sub_248A7A8D4();

  }
  return v7;
}

char *TPKTipContentAnnotationView.__allocating_init(contentController:tipContent:sourceBarButtonItem:)(void *a1, void *a2, void *a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return TPKTipContentAnnotationView.init(contentController:tipContent:sourceBarButtonItem:)(a1, a2, a3);
}

char *TPKTipContentAnnotationView.init(contentController:tipContent:sourceBarButtonItem:)(void *a1, void *a2, void *a3)
{
  void *v3;
  id v7;
  void *v8;
  char *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = sub_248A8C388();
  if (v7)
  {
    v8 = v7;
    v9 = (char *)objc_msgSend(v3, sel_initWithController_content_, a1, a2);
    if (v9)
    {
      *(_QWORD *)&v9[OBJC_IVAR___TPKTipContentAnnotationView_sourceType] = sub_248A78B44(0, &qword_2577AE158);
      swift_unknownObjectWeakAssign();
      v10 = *(double *)&v9[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
      v11 = *(double *)&v9[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 8];
      v12 = *(double *)&v9[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 16];
      v13 = *(double *)&v9[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 24];
      v14 = v9;
      objc_msgSend(v14, sel_setDirectionalLayoutMargins_, v10, v11, v12, v13);
      v15 = sub_248A79A60();
      v16 = *(id *)&v14[OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor];
      objc_msgSend(v15, sel_setBackgroundColor_, v16);

      v17 = sub_248A79A60();
      objc_msgSend(v17, sel_setClipsToBounds_, 1);

      v18 = sub_248A79A60();
      objc_msgSend(v18, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

      sub_248A7A5A4();
      sub_248A7A8D4();

    }
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v9;
}

void sub_248A7A168()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for TPKTipContentAnnotationView();
  objc_msgSendSuper2(&v4, sel_layoutSubviews);
  if ((sub_248A79BE0() & 1) != 0)
  {
    *((_BYTE *)v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset) = 0;
    v1 = sub_248A79A60();
    v2 = objc_msgSend(v1, sel_superview);

    if (v2)
    {
      v3 = sub_248A79A60();
      objc_msgSend(v3, sel_removeFromSuperview);

    }
    sub_248A7A8D4();
  }
  sub_248A7AB74();
}

void sub_248A7A274()
{
  id v0;
  id v1;
  id v2;

  v0 = sub_248A79A60();
  v1 = objc_msgSend(v0, sel_superview);

  if (v1)
  {
    v2 = sub_248A79A60();
    objc_msgSend(v2, sel_removeFromSuperview);

  }
  sub_248A7A8D4();
}

void sub_248A7A4CC(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(_QWORD *)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = a1;
  v3 = a1;

  v4 = sub_248A79A60();
  objc_msgSend(v4, sel_setBackgroundColor_, v3);

}

void sub_248A7A5A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;

  v1 = *(void **)(v0 + OBJC_IVAR___TPKBaseContentView_hostingView);
  if (v1)
  {
    v27 = v1;
    v2 = objc_msgSend(v27, sel_superview);

    if (v2)
    {
      v3 = v27;
    }
    else
    {
      v4 = sub_248A79A60();
      objc_msgSend(v4, sel_addSubview_, v27);

      v5 = sub_248A79A60();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
      v6 = swift_allocObject();
      *(_OWORD *)(v6 + 16) = xmmword_248A9E8B0;
      v7 = objc_msgSend(v27, sel_leadingAnchor);
      v8 = sub_248A79A60();
      v9 = objc_msgSend(v8, sel_leadingAnchor);

      v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v9);
      *(_QWORD *)(v6 + 32) = v10;
      v11 = objc_msgSend(v27, sel_topAnchor);
      v12 = sub_248A79A60();
      v13 = objc_msgSend(v12, sel_topAnchor);

      v14 = sub_248A79B28();
      v15 = 0.0;
      v16 = 0.0;
      if (v14 == 1)
      {

        v16 = 13.0;
      }
      v17 = objc_msgSend(v11, sel_constraintEqualToAnchor_constant_, v13, v16);

      *(_QWORD *)(v6 + 40) = v17;
      v18 = sub_248A79A60();
      v19 = objc_msgSend(v18, sel_trailingAnchor);

      v20 = objc_msgSend(v27, sel_trailingAnchor);
      v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

      *(_QWORD *)(v6 + 48) = v21;
      v22 = sub_248A79A60();
      v23 = objc_msgSend(v22, sel_bottomAnchor);

      v24 = objc_msgSend(v27, sel_bottomAnchor);
      if (*(_QWORD *)(v0 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection) != 1)
      {

        v15 = 13.0;
      }
      v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_constant_, v24, v15);

      *(_QWORD *)(v6 + 56) = v25;
      sub_248A9C694();
      sub_248A78B44(0, (unint64_t *)&qword_2577AE0F8);
      v26 = sub_248A9C67C();
      swift_bridgeObjectRelease();
      objc_msgSend(v5, sel_addConstraints_, v26);

      v3 = (void *)v26;
    }

  }
}

void sub_248A7A8D4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v1 = v0;
  v2 = sub_248A79A60();
  objc_msgSend(v1, sel_addSubview_, v2);

  v3 = objc_msgSend(v1, sel_layoutMarginsGuide);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_248A9E8B0;
  v5 = sub_248A79A60();
  v6 = objc_msgSend(v5, sel_leadingAnchor);

  v7 = objc_msgSend(v3, sel_leadingAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_, v7);

  *(_QWORD *)(v4 + 32) = v8;
  v9 = sub_248A79A60();
  v10 = objc_msgSend(v9, sel_topAnchor);

  v11 = objc_msgSend(v3, sel_topAnchor);
  v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

  *(_QWORD *)(v4 + 40) = v12;
  v13 = objc_msgSend(v3, sel_trailingAnchor);
  v14 = sub_248A79A60();
  v15 = objc_msgSend(v14, sel_trailingAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v4 + 48) = v16;
  v17 = objc_msgSend(v3, sel_bottomAnchor);
  v18 = sub_248A79A60();
  v19 = objc_msgSend(v18, sel_bottomAnchor);

  v20 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v4 + 56) = v20;
  sub_248A9C694();
  sub_248A78B44(0, (unint64_t *)&qword_2577AE0F8);
  v21 = (id)sub_248A9C67C();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_addConstraints_, v21);

}

void sub_248A7AB74()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  char v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  char *v40;
  CGFloat *v41;
  double v42;
  char *v43;
  uint64_t v44;
  id v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_window);
  v3 = objc_msgSend(v2, sel_rootViewController);

  v4 = objc_msgSend(v3, sel_view);
  v5 = *(void **)&v1[OBJC_IVAR___TPKBaseContentView_hostingView];
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
    goto LABEL_6;
  v7 = MEMORY[0x2495A3F58](&v1[OBJC_IVAR___TPKTipContentAnnotationView_sourceView]);
  if (!v7)
    goto LABEL_6;
  v8 = (void *)v7;
  v9 = v5;
  v10 = v4;
  v11 = objc_msgSend(v8, sel_superview);
  if (!v11)
  {

LABEL_6:
    v45 = sub_248A79A60();
    sub_248A90A2C();
    goto LABEL_7;
  }
  v4 = v11;
  v12 = objc_msgSend(v8, sel_window);
  v13 = objc_msgSend(v12, sel_rootViewController);

  v14 = objc_msgSend(v1, sel_window);
  v15 = objc_msgSend(v14, sel_rootViewController);

  if (v13)
  {
    if (!v15)
    {
      v17 = 0;
      goto LABEL_18;
    }
    sub_248A78B44(0, &qword_2577AE1A8);
    v16 = v13;
    v17 = sub_248A9C700();

  }
  else
  {
    if (!v15)
    {
      v17 = 1;
      goto LABEL_19;
    }
    v17 = 0;
  }
  v13 = v15;
LABEL_18:

LABEL_19:
  objc_msgSend(v8, sel_frame);
  objc_msgSend(v4, sel_convertRect_toCoordinateSpace_, v10);
  x = v46.origin.x;
  y = v46.origin.y;
  width = v46.size.width;
  height = v46.size.height;
  MidX = CGRectGetMidX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MidY = CGRectGetMidY(v47);
  if ((v17 & 1) != 0)
  {
    v24 = MidY;
    objc_msgSend(v9, sel_frame);
    objc_msgSend(v1, sel_convertRect_toCoordinateSpace_, v10);
    v25 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect];
    *(_QWORD *)v25 = v26;
    *((_QWORD *)v25 + 1) = v27;
    *((_QWORD *)v25 + 2) = v28;
    *((_QWORD *)v25 + 3) = v29;
    v25[32] = 0;
    v30 = *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationView_sourceType];
    v31 = MidX;
    v32 = v24;
    if (v30)
    {
      v33 = sub_248A78B44(0, &qword_2577AE158);
      v31 = MidX;
      v32 = v24;
      if (v33 == v30)
        objc_msgSend(v9, sel_convertPoint_fromCoordinateSpace_, v10, MidX, v24);
    }
    v34 = (double *)&v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter];
    *v34 = v31;
    v34[1] = v32;
    *((_BYTE *)v34 + 16) = 0;
    objc_msgSend(v9, sel_convertPoint_fromCoordinateSpace_, v10, MidX, v24);
    v36 = v35;
    sub_248A79BB0();
    *(_QWORD *)v34 = v36;
    *((_QWORD *)v34 + 1) = v37;
    *((_BYTE *)v34 + 16) = 0;
  }
  sub_248A79BB0();
  v39 = v38;
  v48.origin.x = sub_248A79B70();
  if (CGRectGetMinY(v48) < v39 && sub_248A79B28() != 2)
  {
    v40 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection];
    *(_QWORD *)v40 = 2;
    v40[8] = 0;
    objc_msgSend(v1, sel_directionalLayoutMargins);
    objc_msgSend(v1, sel_setDirectionalLayoutMargins_);
    sub_248A7AFC0();
  }
  v41 = (CGFloat *)&v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter];
  v42 = *(double *)&v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter + 8];
  if (v42 < CGRectGetMaxY(*(CGRect *)&v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect])
    && sub_248A79B28() != 1)
  {
    v43 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection];
    *(_QWORD *)v43 = 1;
    v43[8] = 0;
    objc_msgSend(v1, sel_directionalLayoutMargins);
    objc_msgSend(v1, sel_setDirectionalLayoutMargins_, 3.0);
    sub_248A7AFC0();
  }
  v45 = sub_248A79A60();
  v44 = sub_248A79B28();
  sub_248A90CA0(v44, *v41);

LABEL_7:
}

void sub_248A7AFC0()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  char v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  double v34;
  double v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;

  v1 = *(void **)(v0 + OBJC_IVAR___TPKBaseContentView_hostingView);
  if (!v1)
    return;
  v2 = v1;
  v41 = v0;
  v3 = sub_248A79A60();
  v4 = objc_msgSend(v3, sel_constraints);

  sub_248A78B44(0, (unint64_t *)&qword_2577AE0F8);
  v5 = sub_248A9C688();

  v44 = MEMORY[0x24BEE4AF8];
  if (v5 >> 62)
    goto LABEL_46;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  v7 = v2;
LABEL_4:
  v8 = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v9 = 0;
    v42 = v2;
    v2 = (id)(v5 & 0xFFFFFFFFFFFFFF8);
    while (1)
    {
      if ((v5 & 0xC000000000000001) != 0)
      {
        v10 = (id)MEMORY[0x2495A379C](v9, v5);
      }
      else
      {
        if (v9 >= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_45:
          __break(1u);
LABEL_46:
          v23 = v2;
          v6 = sub_248A9C7B4();
          goto LABEL_4;
        }
        v10 = *(id *)(v5 + 8 * v9 + 32);
      }
      v11 = v10;
      v12 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_45;
      if (objc_msgSend(v10, sel_firstItem))
      {
        objc_opt_self();
        if (swift_dynamicCastObjCClass())
        {
          sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
          v13 = v42;
          swift_unknownObjectRetain();
          v14 = sub_248A9C700();
          swift_unknownObjectRelease_n();

          if ((v14 & 1) != 0)
            goto LABEL_20;
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
      if (objc_msgSend(v11, sel_secondItem))
      {
        objc_opt_self();
        if (!swift_dynamicCastObjCClass())
        {

          swift_unknownObjectRelease();
          goto LABEL_7;
        }
        sub_248A78B44(0, (unint64_t *)&qword_2577AEEA0);
        v15 = v42;
        swift_unknownObjectRetain();
        v16 = sub_248A9C700();
        swift_unknownObjectRelease_n();

        if ((v16 & 1) != 0)
        {
LABEL_20:
          sub_248A9C778();
          sub_248A9C790();
          sub_248A9C79C();
          sub_248A9C784();
          goto LABEL_7;
        }
      }

LABEL_7:
      ++v9;
      if (v12 == v6)
      {
        v17 = v44;
        v2 = v42;
        v8 = MEMORY[0x24BEE4AF8];
        goto LABEL_26;
      }
    }
  }
  v17 = MEMORY[0x24BEE4AF8];
LABEL_26:
  swift_bridgeObjectRelease();

  if ((v17 & 0x8000000000000000) == 0 && (v17 & 0x4000000000000000) == 0)
  {
    v18 = *(_QWORD *)(v17 + 16);
    if (v18)
      goto LABEL_29;
LABEL_48:
    swift_release();
    v22 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_52;
    goto LABEL_49;
  }
  v18 = sub_248A9C7B4();
  if (!v18)
    goto LABEL_48;
LABEL_29:
  if (v18 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v18; ++i)
  {
    if ((v17 & 0xC000000000000001) != 0)
      v20 = (id)MEMORY[0x2495A379C](i, v17);
    else
      v20 = *(id *)(v17 + 8 * i + 32);
    v21 = v20;
    if (objc_msgSend(v20, sel_firstAttribute) == (id)3
      || objc_msgSend(v21, sel_secondAttribute) == (id)3
      || objc_msgSend(v21, sel_firstAttribute) == (id)4
      || objc_msgSend(v21, sel_secondAttribute) == (id)4)
    {
      sub_248A9C778();
      sub_248A9C790();
      sub_248A9C79C();
      sub_248A9C784();
    }
    else
    {

    }
  }
  swift_release();
  v22 = v8;
  if (v8 < 0)
  {
LABEL_52:
    swift_retain();
    v27 = sub_248A9C7B4();
    swift_release();
    if (!v27)
      goto LABEL_53;
    goto LABEL_51;
  }
LABEL_49:
  if ((v22 & 0x4000000000000000) != 0)
    goto LABEL_52;
  if (!*(_QWORD *)(v22 + 16))
  {
LABEL_53:
    swift_release();
    v24 = v41;
    goto LABEL_54;
  }
LABEL_51:
  v24 = v41;
  v25 = sub_248A79A60();
  v26 = (void *)sub_248A9C67C();
  swift_release();
  objc_msgSend(v25, sel_removeConstraints_, v26);

LABEL_54:
  v28 = sub_248A79A60();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_248A9E9A0;
  v30 = objc_msgSend(v2, sel_topAnchor);
  v31 = sub_248A79A60();
  v32 = objc_msgSend(v31, sel_topAnchor);

  v33 = sub_248A79B28();
  v34 = 0.0;
  v35 = 0.0;
  if (v33 == 1)
  {

    v35 = 13.0;
  }
  v36 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v32, v35);

  *(_QWORD *)(v29 + 32) = v36;
  v37 = sub_248A79A60();
  v38 = objc_msgSend(v37, sel_bottomAnchor);

  v39 = objc_msgSend(v2, sel_bottomAnchor);
  if (*(_QWORD *)(v24 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection) != 1)
  {

    v34 = 13.0;
  }
  v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v39, v34);

  *(_QWORD *)(v29 + 40) = v40;
  sub_248A9C694();
  v43 = (id)sub_248A9C67C();
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_addConstraints_, v43);

}

_QWORD *TPKTipContentAnnotationView.__allocating_init(controller:content:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return TPKTipContentAnnotationView.init(controller:content:)(a1, a2);
}

_QWORD *TPKTipContentAnnotationView.init(controller:content:)(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + OBJC_IVAR___TPKTipContentAnnotationView_sourceType) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v2 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView) = 0;
  v5 = v2 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection;
  *(_QWORD *)v5 = 0;
  *(_BYTE *)(v5 + 8) = 1;
  v6 = v2 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect;
  *(_OWORD *)v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  *(_BYTE *)(v6 + 32) = 1;
  v7 = v2 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter;
  *(_QWORD *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0;
  *(_BYTE *)(v7 + 16) = 1;
  *(_BYTE *)(v2 + OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset) = 2;
  return TPKContentView.init(controller:content:)(a1, a2);
}

id TPKTipContentAnnotationView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentAnnotationView.init(coder:)(void *a1)
{
  _BYTE *v1;
  char *v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationView_sourceType] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView] = 0;
  v3 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection];
  *(_QWORD *)v3 = 0;
  v3[8] = 1;
  v4 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 1;
  v5 = &v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v1[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset] = 2;
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for TPKTipContentAnnotationView();
  v6 = objc_msgSendSuper2(&v8, sel_initWithCoder_, a1);

  return v6;
}

void sub_248A7B8A8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();

}

id TPKTipContentAnnotationView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentAnnotationView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TPKTipContentAnnotationView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKTipContentAnnotationView.annotationViewNeedsLayout()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x2E0))();
}

id sub_248A7B964()
{
  _BYTE *v0;
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  _BYTE *v6;
  uint64_t v7;

  *(_QWORD *)&v0[OBJC_IVAR___TPKTipContentAnnotationView_sourceType] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___bubbleView] = 0;
  v1 = &v0[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___arrowDirection];
  *(_QWORD *)v1 = 0;
  v1[8] = 1;
  v2 = &v0[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingRect];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  v2[32] = 1;
  v3 = &v0[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___sourceCenter];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v0[OBJC_IVAR___TPKTipContentAnnotationView____lazy_storage___hostingViewNeedsReset] = 2;
  v4 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v5 = (void *)objc_opt_self();
  v6 = v0;
  *(_QWORD *)&v0[v4] = objc_msgSend(v5, sel_currentTraitCollection);
  v6[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
  v7 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(_QWORD *)&v6[v7] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  return -[TPKBaseContentView initWithReusableTipView:]_0(v6);
}

uint64_t sub_248A7BA7C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_248A7BAEC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  return swift_release();
}

uint64_t sub_248A7BB50()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  return swift_release();
}

double sub_248A7BBB4@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

void (*sub_248A7BC34(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_248A9BFF8();
  return sub_248A72D10;
}

uint64_t (*sub_248A7BCAC())()
{
  __int128 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_248A78BA0;
}

uint64_t (*sub_248A7BD40())()
{
  __int128 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v1;
  return sub_248A786C8;
}

void *sub_248A7BDD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v10;

  v0 = type metadata accessor for TipBodyTextBuilder();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0))
  {
    sub_248A7CB44((uint64_t)v6);
    return 0;
  }
  else
  {
    sub_248A7CEF0((uint64_t)v6, (uint64_t)v3);
    sub_248A7CB44((uint64_t)v6);
    v7 = *(void **)&v3[*(int *)(v0 + 48)];
    v8 = v7;
    sub_248A7CF34((uint64_t)v3);
  }
  return v7;
}

uint64_t sub_248A7BF14(char *a1, void *a2)
{
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(uint64_t, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char *v40;
  id v41;
  char *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void (*v50)(uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  char *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  id v72;
  id v73;
  uint64_t v74;
  _QWORD v76[3];
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92[48];
  id v93[2];
  _OWORD v94[3];

  v88 = a2;
  v86 = a1;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE460);
  v87 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v84 = (char *)v76 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE468);
  v90 = *(_QWORD *)(v89 - 8);
  MEMORY[0x24BDAC7A8](v89);
  v83 = (char *)v76 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE470);
  v5 = *(_QWORD *)(v91 - 8);
  MEMORY[0x24BDAC7A8](v91);
  v7 = (char *)v76 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v77 = (uint64_t)v76 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v76 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v76 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE478);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v76 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v2 + 16) = 0;
  v20 = v2 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__title;
  v94[0] = 0uLL;
  v76[2] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE220);
  sub_248A9BFD4();
  v82 = v17;
  v21 = *(void (**)(uint64_t, char *, uint64_t))(v17 + 32);
  v79 = v20;
  v80 = v16;
  v21(v20, v19, v16);
  v22 = v2 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__textBuilder;
  v23 = type metadata accessor for TipBodyTextBuilder();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v15, 1, 1, v23);
  sub_248A7CAFC((uint64_t)v15, (uint64_t)v13);
  v76[1] = v8;
  sub_248A9BFD4();
  v76[0] = v15;
  v24 = (uint64_t)v15;
  v25 = v22;
  sub_248A7CB44(v24);
  v81 = v5;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v22, v7, v91);
  v26 = (char *)(v2 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__actionsBuilder);
  memset(v94, 0, sizeof(v94));
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE248);
  v28 = v83;
  v78 = v27;
  sub_248A9BFD4();
  v29 = v89;
  (*(void (**)(char *, char *))(v90 + 32))(v26, v28);
  v30 = v2 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__tapHandler;
  *(_QWORD *)&v94[0] = nullsub_1;
  *((_QWORD *)&v94[0] + 1) = 0;
  __swift_instantiateConcreteTypeFromMangledName(qword_2577AE258);
  v31 = v84;
  sub_248A9BFD4();
  v32 = *(void (**)(uint64_t, char *, uint64_t))(v87 + 32);
  v33 = v85;
  v32(v30, v31, v85);
  v34 = v2 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__closeHandler;
  *(_QWORD *)&v94[0] = nullsub_1;
  *((_QWORD *)&v94[0] + 1) = 0;
  v35 = v86;
  sub_248A9BFD4();
  v32(v34, v31, v33);
  if (v35)
  {
    v36 = v80;
    v87 = v25;
    v37 = v91;
    v84 = v26;
    v85 = v2;
    v38 = OBJC_IVAR___TPKContent_tip;
    v39 = *(void **)&v35[OBJC_IVAR___TPKContent_tip];
    if (v39)
    {
      v40 = v35;
      v41 = objc_msgSend(v39, sel_miniContent);
      v39 = v41;
      if (v41)
      {
        v42 = v35;
        v43 = objc_msgSend(v41, sel_title);

        if (v43)
        {
          v44 = sub_248A9C5C8();
          v46 = v45;

          v47 = sub_248A7D358(v44, v46);
          v39 = v48;
          swift_bridgeObjectRelease();
          if (v39)
            v49 = (void *)v47;
          else
            v49 = 0;
        }
        else
        {
          v49 = 0;
          v39 = 0;
        }
        goto LABEL_12;
      }
    }
    else
    {
      v52 = v35;
    }
    v42 = v35;
    v49 = 0;
LABEL_12:
    v53 = v37;
    v54 = v36;
    v55 = v76[0];
    v56 = v79;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v56, v54);
    v93[0] = v49;
    v93[1] = v39;
    sub_248A9BFD4();
    swift_endAccess();
    v57 = *(void **)&v42[v38];
    v58 = v42;
    if (v57)
      v59 = objc_msgSend(v57, sel_miniContent);
    else
      v59 = 0;
    v60 = (uint64_t)v88;
    swift_unknownObjectRetain();
    v61 = v77;
    sub_248A84E08(v57, v59, v60, v77);
    v62 = v87;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v62, v53);
    sub_248A7CAFC(v61, v55);
    sub_248A9BFD4();
    sub_248A7CB44(v61);
    swift_endAccess();
    v63 = *(void **)&v58[v38];
    if (v63)
    {
      v64 = objc_msgSend(v63, sel_miniContent);
      v65 = v64;
      if (!v64)
      {
LABEL_20:
        v67 = v89;
        v68 = v90;
        v51 = v85;
        v69 = v84;
        v70 = sub_248A9C454();
        sub_248A933CC((unint64_t)v65, v70, 0, 0, (unint64_t *)v94);
        swift_beginAccess();
        (*(void (**)(char *, uint64_t))(v68 + 8))(v69, v67);
        sub_248A7CDF4((uint64_t)v94, (uint64_t)v93);
        sub_248A9BFD4();
        swift_endAccess();
        v71 = &v58[OBJC_IVAR___TPKContent_customizationID];
        swift_beginAccess();
        v72 = objc_msgSend(v88, sel_contentView_iconForCustomizationID_, 0, *(_QWORD *)v71);
        v73 = objc_msgSend((id)objc_opt_self(), sel_secondaryLabelColor);
        v74 = MEMORY[0x2495A3484](v73);
        sub_248A87DF4(v72, v74, (uint64_t)v93, 0.0, 0.0);
        swift_beginAccess();
        sub_248A7CE3C((uint64_t)v93, (uint64_t)v92);
        sub_248A9BFD4();
        sub_248A7CE78(v93);
        swift_endAccess();

        swift_unknownObjectRelease();
        return v51;
      }
      v66 = objc_msgSend(v64, sel_actions);

      if (v66)
      {
        sub_248A7CEAC();
        v65 = (void *)sub_248A9C688();

        goto LABEL_20;
      }
    }
    v65 = 0;
    goto LABEL_20;
  }
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v79, v80);
  (*(void (**)(uint64_t, uint64_t))(v81 + 8))(v25, v91);
  (*(void (**)(char *, uint64_t))(v90 + 8))(v26, v29);
  v50 = *(void (**)(uint64_t, uint64_t))(v87 + 8);
  v50(v30, v33);
  v50(v34, v33);
  type metadata accessor for MiniTipViewModel();
  swift_deallocPartialClassInstance();
  return 0;
}

uint64_t sub_248A7C78C()
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

  v1 = v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__title;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE478);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__imageBuilder;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE488);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__textBuilder;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE470);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__actionsBuilder;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE468);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__tapHandler;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE460);
  v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11(v0 + OBJC_IVAR____TtC12TipKitLegacy16MiniTipViewModel__closeHandler, v10);
  return swift_deallocClassInstance();
}

uint64_t sub_248A7C8B8()
{
  return type metadata accessor for MiniTipViewModel();
}

uint64_t type metadata accessor for MiniTipViewModel()
{
  uint64_t result;

  result = qword_2577AE208;
  if (!qword_2577AE208)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248A7C8FC()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_248A7CA74(319, &qword_2577AE218, &qword_2577AE220);
  if (v0 <= 0x3F)
  {
    sub_248A7CA20();
    if (v1 <= 0x3F)
    {
      sub_248A7CA74(319, &qword_2577AE230, &qword_2577AE238);
      if (v2 <= 0x3F)
      {
        sub_248A7CA74(319, &qword_2577AE240, &qword_2577AE248);
        if (v3 <= 0x3F)
        {
          sub_248A7CA74(319, &qword_2577AE250, qword_2577AE258);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_248A7CA20()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577AE228)
  {
    v0 = sub_248A9C01C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577AE228);
  }
}

void sub_248A7CA74(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_248A9C01C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_248A7CAC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MiniTipViewModel();
  result = sub_248A9BFC8();
  *a1 = result;
  return result;
}

uint64_t sub_248A7CAFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A7CB44(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

double sub_248A7CB88@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_248A7CC04()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_248A9C010();
}

uint64_t sub_248A7CC84()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  return swift_release();
}

uint64_t sub_248A7CCEC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v9 - v6;
  sub_248A7CAFC(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A7CAFC((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_248A9C010();
  return sub_248A7CB44((uint64_t)v7);
}

uint64_t sub_248A7CDD4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_248A7CDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE248);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A7CE3C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for TipBodyImageBuilder(a2, a1);
  return a2;
}

id *sub_248A7CE78(id *a1)
{
  destroy for TipBodyImageBuilder(a1);
  return a1;
}

unint64_t sub_248A7CEAC()
{
  unint64_t result;

  result = qword_2577AE480;
  if (!qword_2577AE480)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577AE480);
  }
  return result;
}

uint64_t sub_248A7CEF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipBodyTextBuilder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A7CF34(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TipBodyTextBuilder();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248A7CF78()
{
  swift_release();
  return swift_deallocObject();
}

id sub_248A7D308()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TipImageProxy();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TipImageProxy()
{
  return objc_opt_self();
}

uint64_t sub_248A7D358(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v4 = sub_248A9BF50();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = a1;
  v13[1] = a2;
  sub_248A9BF44();
  sub_248A7D434();
  v8 = sub_248A9C724();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

unint64_t sub_248A7D434()
{
  unint64_t result;

  result = qword_25446CCE0;
  if (!qword_25446CCE0)
  {
    result = MEMORY[0x2495A3E38](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25446CCE0);
  }
  return result;
}

BOOL sub_248A7D478(void *a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  id v14;

  if (!a1)
    return 1;
  v2 = a1;
  v3 = objc_msgSend(v1, sel_horizontalSizeClass);
  if (v3 == objc_msgSend(v2, sel_horizontalSizeClass))
  {
    v4 = objc_msgSend(v1, sel_verticalSizeClass);
    if (v4 == objc_msgSend(v2, sel_verticalSizeClass))
    {
      v5 = objc_msgSend(v1, sel_preferredContentSizeCategory);
      v6 = objc_msgSend(v2, sel_preferredContentSizeCategory);
      v7 = sub_248A9C5C8();
      v9 = v8;
      if (v7 == sub_248A9C5C8() && v9 == v10)
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_8;
      }
      v11 = sub_248A9C7FC();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
      {
LABEL_8:
        v12 = objc_msgSend(v1, sel_legibilityWeight);
        if (v12 == objc_msgSend(v2, sel_legibilityWeight))
        {
          v13 = objc_msgSend(v1, sel_userInterfaceIdiom);
          v14 = objc_msgSend(v2, sel_userInterfaceIdiom);

          return v13 != v14;
        }
      }
    }
  }

  return 1;
}

uint64_t TipKitSectionHeader.viewModel.getter(uint64_t a1)
{
  return sub_248A7D678(a1, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))MEMORY[0x24BDEB790]);
}

unint64_t sub_248A7D624()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577AE4C0;
  if (!qword_2577AE4C0)
  {
    v1 = type metadata accessor for TipKitViewModel();
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TipKitViewModel, v1);
    atomic_store(result, (unint64_t *)&qword_2577AE4C0);
  }
  return result;
}

uint64_t TipKitSectionHeader.$viewModel.getter(uint64_t a1)
{
  return sub_248A7D678(a1, MEMORY[0x24BDEB798]);
}

uint64_t sub_248A7D678(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = (uint64_t *)(v2 + *(int *)(a1 + 48));
  v4 = *v3;
  v5 = v3[1];
  v6 = *((unsigned __int8 *)v3 + 16);
  v7 = type metadata accessor for TipKitViewModel();
  v8 = sub_248A7D624();
  return a2(v4, v5, v6, v7, v8);
}

void TipKitSectionHeader.init(viewModel:isSectionHeader:tappable:eligibleIds:listCells:)(void *a1@<X0>, char a2@<W1>, char a3@<W2>, uint64_t a4@<X3>, void (*a5)(void)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  *(_WORD *)a8 = 1;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  v18 = a8 + *(int *)(type metadata accessor for TipKitSectionHeader(0, a6, a7, v17) + 48);
  *(_QWORD *)v18 = sub_248A7D7DC;
  *(_QWORD *)(v18 + 8) = v16;
  *(_BYTE *)(v18 + 16) = 0;
  *(_BYTE *)(a8 + 1) = a2;
  *(_BYTE *)a8 = a3;
  *(_QWORD *)(a8 + 8) = a4;
  v19 = a1;
  a5();

}

uint64_t sub_248A7D7B8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_248A7D7DC()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t type metadata accessor for TipKitSectionHeader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for TipKitSectionHeader);
}

uint64_t TipKitSectionHeader.init(identifier:isSectionHeader:tappable:eligibleIds:listCells:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t (*a6)(void)@<X5>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_WORD *)a8 = 1;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  v19 = a8 + *(int *)(type metadata accessor for TipKitSectionHeader(0, a7, a9, v18) + 48);
  *(_QWORD *)v19 = sub_248A7D8E4;
  *(_QWORD *)(v19 + 8) = v17;
  *(_BYTE *)(v19 + 16) = 0;
  *(_BYTE *)(a8 + 1) = a3;
  *(_BYTE *)a8 = a4;
  *(_QWORD *)(a8 + 8) = a5;
  return a6();
}

uint64_t sub_248A7D8C0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_248A7D8E4()
{
  uint64_t v0;

  return _s12TipKitLegacy0aB9ViewModelC19modelWithIdentifieryACSSFZ_0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t TipKitSectionHeader.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(unint64_t, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[2];
  _QWORD v69[2];
  uint64_t v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[3];

  v63 = a2;
  v3 = *(_QWORD *)(a1 - 8);
  v59 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v54 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4C8);
  v6 = *(_QWORD *)(a1 + 16);
  v52 = (void (*)(char *, uint64_t, uint64_t))sub_248A9C520();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4D0);
  swift_getTupleTypeMetadata2();
  v7 = sub_248A9C55C();
  v8 = sub_248A9C280();
  v9 = sub_248A9C280();
  v10 = sub_248A9C49C();
  v56 = *(_QWORD *)(v10 - 8);
  v53 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v49 = (char *)&v47 - v11;
  v12 = sub_248A9C0B8();
  v62 = *(_QWORD *)(v12 - 8);
  v57 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v64 = (char *)&v47 - v13;
  v60 = sub_248A9C0B8();
  v61 = *(_QWORD *)(v60 - 8);
  v14 = MEMORY[0x24BDAC7A8](v60);
  v55 = (char *)&v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v58 = (char *)&v47 - v16;
  v17 = *(_QWORD *)(a1 + 24);
  v18 = v6;
  v50 = v6;
  v65 = v6;
  v66 = v17;
  v51 = v2;
  v67 = v2;
  v73[0] = sub_248A7EDC4();
  v73[1] = v17;
  v73[2] = MEMORY[0x24BDF5138];
  v19 = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v52, v73);
  v20 = MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v7);
  v72[0] = v19;
  v72[1] = v20;
  v21 = MEMORY[0x24BDEF3E0];
  v71[0] = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v8, v72);
  v71[1] = v17;
  v22 = MEMORY[0x2495A3E38](v21, v9, v71);
  sub_248A9C490();
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v23 = v54;
  v24 = v2;
  v25 = a1;
  v48 = a1;
  v52(v54, v24, a1);
  v26 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v18;
  *(_QWORD *)(v27 + 24) = v17;
  v28 = *(void (**)(unint64_t, char *, uint64_t))(v3 + 32);
  v29 = v23;
  v28(v27 + v26, v23, v25);
  v70 = v22;
  v30 = v53;
  v31 = MEMORY[0x2495A3E38](MEMORY[0x24BDF3F50], v53, &v70);
  v32 = v49;
  sub_248A9C430();
  swift_release();
  (*(void (**)(char *, uint64_t))(v56 + 8))(v32, v30);
  v33 = v48;
  v52(v29, v51, v48);
  v34 = swift_allocObject();
  *(_QWORD *)(v34 + 16) = v50;
  *(_QWORD *)(v34 + 24) = v17;
  v28(v34 + v26, v29, v33);
  v35 = MEMORY[0x24BDF0910];
  v69[0] = v31;
  v69[1] = MEMORY[0x24BDF0910];
  v36 = MEMORY[0x24BDED308];
  v37 = v57;
  v38 = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v57, v69);
  v39 = v55;
  v40 = v64;
  sub_248A9C3D0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v62 + 8))(v40, v37);
  v68[0] = v38;
  v68[1] = v35;
  v41 = v60;
  MEMORY[0x2495A3E38](v36, v60, v68);
  v42 = v61;
  v43 = *(void (**)(char *, char *, uint64_t))(v61 + 16);
  v44 = v58;
  v43(v58, v39, v41);
  v45 = *(void (**)(char *, uint64_t))(v42 + 8);
  v45(v39, v41);
  v43(v63, v44, v41);
  return ((uint64_t (*)(char *, uint64_t))v45)(v44, v41);
}

uint64_t sub_248A7DDDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v28;
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
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, char *);
  char *v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t KeyPath;
  uint64_t *v86;
  char *v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  char *v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  void (*v100)(char *, uint64_t, uint64_t);
  void (*v101)(uint64_t, uint64_t);
  char *v102;
  char *v103;
  char *v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t, char *);
  char *v113;
  char *v114;
  unint64_t v115;
  char *v116;
  uint64_t v117;
  void (*v118)(char *, char *);
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t *v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char *v158;
  char *v159;
  uint64_t v160;
  char *v161;
  _QWORD v162[3];
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  char v172;
  _QWORD v173[2];
  _QWORD v174[3];
  _QWORD v175[5];
  _QWORD v176[2];
  _QWORD v177[2];
  _QWORD v178[2];
  _QWORD v179[3];
  _QWORD v180[2];
  _QWORD v181[4];

  v157 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4D0);
  swift_getTupleTypeMetadata2();
  v8 = sub_248A9C55C();
  v137 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v136 = (char *)&v132 - v10;
  v160 = *(_QWORD *)(a2 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v132 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v151 = (char *)&v132 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE5D8);
  v133 = *(_QWORD *)(v15 - 8);
  v134 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v132 = (char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v147 = v7;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v135 = (char *)&v132 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v146 = (uint64_t)&v132 - v20;
  v138 = __swift_instantiateConcreteTypeFromMangledName(qword_2577AE550);
  MEMORY[0x24BDAC7A8](v138);
  v140 = (uint64_t *)((char *)&v132 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE5E0);
  MEMORY[0x24BDAC7A8](v22);
  v139 = (char *)&v132 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE4C8);
  MEMORY[0x24BDAC7A8](v24);
  v141 = (char *)&v132 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = v26;
  v27 = sub_248A9C520();
  v143 = *(_QWORD *)(v27 - 8);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v145 = (char *)&v132 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v144 = (char *)&v132 - v30;
  v155 = v31;
  v156 = v8;
  v32 = sub_248A9C280();
  v150 = *(_QWORD *)(v32 - 8);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v149 = (char *)&v132 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v33);
  v148 = (char *)&v132 - v35;
  v159 = (char *)a3;
  v37 = type metadata accessor for TipKitSectionHeader(0, a2, a3, v36);
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v40 = (char *)&v132 - v39;
  v154 = v32;
  v158 = (char *)a2;
  v41 = sub_248A9C280();
  v152 = *(_QWORD *)(v41 - 8);
  v153 = v41;
  MEMORY[0x24BDAC7A8](v41);
  v161 = (char *)&v132 - v42;
  v43 = (void *)TipKitSectionHeader.viewModel.getter(v37);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();

  swift_release();
  swift_release();
  if (v163 != 1)
    goto LABEL_5;
  v44 = (void *)TipKitSectionHeader.viewModel.getter(v37);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();

  swift_release();
  swift_release();
  v45 = (void *)v163;
  if (!(_QWORD)v163)
    goto LABEL_5;
  v46 = (uint64_t *)(v163 + OBJC_IVAR___TPKContent_customizationID);
  swift_beginAccess();
  v47 = *v46;

  v48 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v40, a1, v37);
  if (v48)
  {
    v49 = sub_248A9B2E4(v47, *((_QWORD *)v40 + 1));
    v50 = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v40, v37);
    if ((v49 & 1) == 0)
    {
LABEL_5:
      v51 = a1 + *(int *)(v37 + 44);
      v52 = (uint64_t)v158;
      v53 = *(void (**)(char *, uint64_t, char *))(v160 + 16);
      v54 = v151;
      v53(v151, v51, v158);
      v53(v13, (uint64_t)v54, (char *)v52);
      v55 = sub_248A7EDC4();
      v56 = v159;
      v181[0] = v55;
      v181[1] = v159;
      v57 = MEMORY[0x24BDF5138];
      v181[2] = MEMORY[0x24BDF5138];
      v58 = v155;
      v59 = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v155, v181);
      v60 = v156;
      v61 = MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v156);
      v180[0] = v59;
      v180[1] = v61;
      v62 = v154;
      MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v154, v180);
      sub_248A7ED00((uint64_t)v13, v62, v52);
      v63 = *(void (**)(char *, uint64_t))(v160 + 8);
      v63(v13, v52);
      v64 = v54;
      v65 = v52;
      goto LABEL_11;
    }
  }
  else
  {
    v50 = (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v40, v37);
  }
  if (*(_BYTE *)(a1 + 1) == 1)
  {
    v66 = TipKitSectionHeader.viewModel.getter(v37);
    *(_QWORD *)&v163 = sub_248A9C460();
    v67 = sub_248A9C4FC();
    v160 = v67;
    v68 = sub_248A9C2E0();
    sub_248A9C028();
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v76 = v75;
    v77 = sub_248A9C2B0();
    sub_248A9C028();
    *(_QWORD *)&v163 = v66;
    *((_QWORD *)&v163 + 1) = v67;
    v78 = (void *)v66;
    LOBYTE(v164) = v68;
    *((_QWORD *)&v164 + 1) = v70;
    *(_QWORD *)&v165 = v72;
    *((_QWORD *)&v165 + 1) = v74;
    *(_QWORD *)&v166 = v76;
    BYTE8(v166) = 0;
    LOBYTE(v167) = v77;
    *((_QWORD *)&v167 + 1) = v79;
    *(_QWORD *)&v168 = v80;
    *((_QWORD *)&v168 + 1) = v81;
    *(_QWORD *)&v169 = v82;
    BYTE8(v169) = 0;
    v83 = sub_248A9C370();
    v170 = 0u;
    v171 = 0u;
    v172 = 0;
    v84 = (uint64_t)v139;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v83 - 8) + 56))(v139, 1, 1, v83);
    KeyPath = swift_getKeyPath();
    v86 = v140;
    sub_248A7FEC4(v84, (uint64_t)v140 + *(int *)(v138 + 28), &qword_2577AE5E0);
    *v86 = KeyPath;
    v87 = v141;
    sub_248A7FEC4((uint64_t)v86, (uint64_t)&v141[*(int *)(v142 + 36)], qword_2577AE550);
    v88 = v170;
    v89 = v171;
    *((_OWORD *)v87 + 6) = v169;
    *((_OWORD *)v87 + 7) = v88;
    *((_OWORD *)v87 + 8) = v89;
    v87[144] = v172;
    v90 = v166;
    *((_OWORD *)v87 + 2) = v165;
    *((_OWORD *)v87 + 3) = v90;
    v91 = v168;
    *((_OWORD *)v87 + 4) = v167;
    *((_OWORD *)v87 + 5) = v91;
    v92 = v164;
    *(_OWORD *)v87 = v163;
    *((_OWORD *)v87 + 1) = v92;
    sub_248A7FF08((void **)&v163);
    sub_248A71634((uint64_t)v86, qword_2577AE550);
    sub_248A71634(v84, &qword_2577AE5E0);
    swift_release();

    MEMORY[0x24BDAC7A8](v93);
    v94 = v159;
    *(&v132 - 4) = v158;
    *(&v132 - 3) = v94;
    *(&v132 - 2) = (char *)a1;
    v95 = sub_248A7EDC4();
    v96 = (uint64_t)v145;
    sub_248A9C508();
    v162[0] = v95;
    v162[1] = v94;
    v97 = MEMORY[0x24BDF5138];
    v162[2] = MEMORY[0x24BDF5138];
    v58 = v155;
    MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v155, v162);
    v98 = v143;
    v99 = v144;
    v100 = *(void (**)(char *, uint64_t, uint64_t))(v143 + 16);
    v100(v144, v96, v58);
    v101 = *(void (**)(uint64_t, uint64_t))(v98 + 8);
    v101(v96, v58);
    v100((char *)v96, (uint64_t)v99, v58);
    v60 = v156;
    MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v156);
    v102 = v148;
    sub_248A7EA88(v96, v58);
    v101(v96, v58);
    v101((uint64_t)v99, v58);
  }
  else
  {
    MEMORY[0x24BDAC7A8](v50);
    v103 = v158;
    *(&v132 - 4) = v158;
    v104 = v103;
    *(&v132 - 3) = v159;
    *(&v132 - 2) = (char *)a1;
    sub_248A7EFF0();
    v105 = v132;
    sub_248A9C514();
    *(_QWORD *)&v163 = sub_248A9C460();
    swift_retain();
    v145 = (char *)sub_248A9C4FC();
    v107 = v133;
    v106 = v134;
    v108 = (uint64_t)v135;
    (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v135, v105, v134);
    swift_release();
    *(_QWORD *)(v108 + *(int *)(v147 + 36)) = v145;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v105, v106);
    v109 = v146;
    sub_248A7FCE4(v108, v146);
    v110 = a1 + *(int *)(v37 + 44);
    v111 = v160;
    v112 = *(void (**)(char *, uint64_t, char *))(v160 + 16);
    v113 = v151;
    v114 = v104;
    v112(v151, v110, v104);
    sub_248A7FEC4(v109, v108, &qword_2577AE4D0);
    *(_QWORD *)&v163 = v108;
    v112(v13, (uint64_t)v113, v104);
    *((_QWORD *)&v163 + 1) = v13;
    v176[0] = v147;
    v176[1] = v104;
    v115 = sub_248A7FD2C();
    v116 = v159;
    v175[3] = v115;
    v175[4] = v159;
    v117 = (uint64_t)v136;
    sub_248A7EB4C((uint64_t *)&v163, 2uLL, (uint64_t)v176);
    v118 = *(void (**)(char *, char *))(v111 + 8);
    v118(v13, v104);
    sub_248A71634(v108, &qword_2577AE4D0);
    v175[0] = sub_248A7EDC4();
    v175[1] = v116;
    v97 = MEMORY[0x24BDF5138];
    v175[2] = MEMORY[0x24BDF5138];
    v58 = v155;
    MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v155, v175);
    v60 = v156;
    MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v156);
    v102 = v148;
    sub_248A7ED00(v117, v58, v60);
    (*(void (**)(uint64_t, uint64_t))(v137 + 8))(v117, v60);
    v118(v113, v114);
    sub_248A71634(v146, &qword_2577AE4D0);
  }
  v119 = sub_248A7EDC4();
  v56 = v159;
  v174[0] = v119;
  v174[1] = v159;
  v174[2] = v97;
  v120 = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v58, v174);
  v121 = MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v60);
  v173[0] = v120;
  v173[1] = v121;
  v62 = v154;
  MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v154, v173);
  v122 = v150;
  v57 = v97;
  v123 = (uint64_t)v149;
  (*(void (**)(char *, char *, uint64_t))(v150 + 16))(v149, v102, v62);
  sub_248A7EA88(v123, v62);
  v63 = *(void (**)(char *, uint64_t))(v122 + 8);
  v63((char *)v123, v62);
  v64 = v102;
  v65 = v62;
LABEL_11:
  v63(v64, v65);
  v124 = v157;
  v126 = v152;
  v125 = v153;
  v179[0] = sub_248A7EDC4();
  v179[1] = v56;
  v179[2] = v57;
  v127 = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v58, v179);
  v128 = MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v60);
  v178[0] = v127;
  v178[1] = v128;
  v129 = MEMORY[0x24BDEF3E0];
  v177[0] = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v62, v178);
  v177[1] = v56;
  MEMORY[0x2495A3E38](v129, v125, v177);
  v130 = v161;
  (*(void (**)(uint64_t, char *, uint64_t))(v126 + 16))(v124, v161, v125);
  return (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v130, v125);
}

uint64_t sub_248A7E9D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_248A7DDDC(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_248A7E9E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v15;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1 + *(int *)(type metadata accessor for TipKitSectionHeader(0, v9, v10, v11) + 44);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v13(v8, v12, a2);
  v13(a3, (uint64_t)v8, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a2);
}

uint64_t sub_248A7EA88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_248A9C268();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_248A9C274();
}

uint64_t sub_248A7EB4C(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v4 = a1;
  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8](a1);
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *v4++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_248A9C568();
  }
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8](TupleTypeMetadata);
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_248A9C568();
}

uint64_t sub_248A7ED00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_248A9C268();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_248A9C274();
}

unint64_t sub_248A7EDC4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE4D8;
  if (!qword_2577AE4D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4C8);
    v2[0] = sub_248A7EE48();
    v2[1] = sub_248A7F034(&qword_2577AE548, qword_2577AE550, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE4D8);
  }
  return result;
}

unint64_t sub_248A7EE48()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE4E0;
  if (!qword_2577AE4E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4E8);
    v2[0] = sub_248A7EF00(&qword_2577AE4F0, &qword_2577AE4F8, sub_248A7EEE4);
    v2[1] = sub_248A7F034(&qword_2577AE538, &qword_2577AE540, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE4E0);
  }
  return result;
}

uint64_t sub_248A7EEE4()
{
  return sub_248A7EF00(&qword_2577AE500, &qword_2577AE508, (uint64_t (*)(void))sub_248A7EF6C);
}

uint64_t sub_248A7EF00(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_248A7EF6C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE510;
  if (!qword_2577AE510)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE518);
    v2[0] = sub_248A7EFF0();
    v2[1] = sub_248A7F034(&qword_2577AE528, &qword_2577AE530, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE510);
  }
  return result;
}

unint64_t sub_248A7EFF0()
{
  unint64_t result;

  result = qword_2577AE520;
  if (!qword_2577AE520)
  {
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TipKitView, &type metadata for TipKitView);
    atomic_store(result, (unint64_t *)&qword_2577AE520);
  }
  return result;
}

uint64_t sub_248A7F034(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495A3E38](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_248A7F078(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_248A7F088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248A7F14C((uint64_t (*)(void))TipKitSectionHeader.startTipKit(), a2, a3, a4);
}

Swift::Void __swiftcall TipKitSectionHeader.startTipKit()()
{
  uint64_t v0;

  sub_248A7F198(v0, (SEL *)&selRef_addDelegate_content_);
}

uint64_t objectdestroy_5Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for TipKitSectionHeader(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v8 + *(int *)(v6 + 44), v5);
  sub_248A7F078(*(_QWORD *)(v8 + *(int *)(v6 + 48)), *(void **)(v8 + *(int *)(v6 + 48) + 8), *(_BYTE *)(v8 + *(int *)(v6 + 48) + 16));
  return swift_deallocObject();
}

uint64_t sub_248A7F140(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_248A7F14C((uint64_t (*)(void))TipKitSectionHeader.stopTipKit(), a2, a3, a4);
}

uint64_t sub_248A7F14C(uint64_t (*a1)(void), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for TipKitSectionHeader(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return a1();
}

Swift::Void __swiftcall TipKitSectionHeader.stopTipKit()()
{
  uint64_t v0;

  sub_248A7F198(v0, (SEL *)&selRef_removeDelegate_content_);
}

void sub_248A7F198(uint64_t a1, SEL *a2)
{
  char *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (char *)TipKitSectionHeader.viewModel.getter(a1);
  v4 = *(void **)&v3[OBJC_IVAR____TtC12TipKitLegacy15TipKitViewModel_tipContentController];
  if (v4)
  {
    v5 = v3;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    objc_msgSend(v4, *a2, v5, v6);

  }
  else
  {

  }
}

uint64_t sub_248A7F260()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248A7F29C()
{
  return sub_248A9C3E8();
}

uint64_t sub_248A7F2B8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_248A7F2C0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_QWORD *sub_248A7F350(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 17 > 0x18)
  {
    v10 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    a1[1] = *((_BYTE *)a2 + 1);
    v11 = (_QWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
    v12 = (_QWORD *)(((unint64_t)a2 + 9) & 0xFFFFFFFFFFFFFFF8);
    *v11 = *v12;
    v13 = ((unint64_t)v11 + v6 + 8) & ~v6;
    v14 = ((unint64_t)v12 + v6 + 8) & ~v6;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v15(v13, v14, v4);
    v16 = (v7 + v13) & 0xFFFFFFFFFFFFFFF8;
    v17 = (v7 + v14) & 0xFFFFFFFFFFFFFFF8;
    v18 = *(_QWORD *)v17;
    v19 = *(void **)(v17 + 8);
    LOBYTE(v14) = *(_BYTE *)(v17 + 16);
    sub_248A7F46C(*(_QWORD *)v17, v19, v14);
    *(_QWORD *)v16 = v18;
    *(_QWORD *)(v16 + 8) = v19;
    *(_BYTE *)(v16 + 16) = v14;
  }
  return v3;
}

id sub_248A7F46C(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain();
}

void sub_248A7F47C(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = (a1 + 9) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v5 = (v3 + *(unsigned __int8 *)(v4 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v5);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_248A7F078(*(_QWORD *)v6, *(void **)(v6 + 8), *(_BYTE *)(v6 + 16));
}

_BYTE *sub_248A7F4EC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (_QWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_QWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)v4 + v8 + 8) & ~v8;
  v10 = ((unint64_t)v5 + v8 + 8) & ~v8;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
  swift_bridgeObjectRetain();
  v11(v9, v10, v6);
  v12 = *(_QWORD *)(v7 + 64) + 7;
  v13 = (v12 + v9) & 0xFFFFFFFFFFFFFFF8;
  v14 = (v12 + v10) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(_QWORD *)v14;
  v16 = *(void **)(v14 + 8);
  LOBYTE(v10) = *(_BYTE *)(v14 + 16);
  sub_248A7F46C(*(_QWORD *)v14, v16, v10);
  *(_QWORD *)v13 = v15;
  *(_QWORD *)(v13 + 8) = v16;
  *(_BYTE *)(v13 + 16) = v10;
  return a1;
}

_BYTE *sub_248A7F5B4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (_QWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)v5 + v8 + 8) & ~v8;
  v10 = ((unint64_t)v6 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 24))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v11 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)v13;
  v15 = *(void **)(v13 + 8);
  LOBYTE(v5) = *(_BYTE *)(v13 + 16);
  sub_248A7F46C(*(_QWORD *)v13, v15, (char)v5);
  v16 = *(_QWORD *)v12;
  v17 = *(void **)(v12 + 8);
  v18 = *(_BYTE *)(v12 + 16);
  *(_QWORD *)v12 = v14;
  *(_QWORD *)(v12 + 8) = v15;
  *(_BYTE *)(v12 + 16) = (_BYTE)v5;
  sub_248A7F078(v16, v17, v18);
  return a1;
}

_BYTE *sub_248A7F694(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char v13;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = (_QWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v5 = (_QWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  *v4 = *v5;
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)v4 + v7 + 8) & ~v7;
  v9 = ((unint64_t)v5 + v7 + 8) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 32))(v8, v9);
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (v10 + v8) & 0xFFFFFFFFFFFFFFF8;
  v12 = (v10 + v9) & 0xFFFFFFFFFFFFFFF8;
  v13 = *(_BYTE *)(v12 + 16);
  *(_OWORD *)v11 = *(_OWORD *)v12;
  *(_BYTE *)(v11 + 16) = v13;
  return a1;
}

_BYTE *sub_248A7F73C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t v15;
  void *v16;
  char v17;

  *a1 = *a2;
  a1[1] = a2[1];
  v5 = (_QWORD *)((unint64_t)(a1 + 9) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)((unint64_t)(a2 + 9) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)v5 + v8 + 8) & ~v8;
  v10 = ((unint64_t)v6 + v8 + 8) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (v11 + v9) & 0xFFFFFFFFFFFFFFF8;
  v13 = (v11 + v10) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_BYTE *)(v13 + 16);
  v15 = *(_QWORD *)v12;
  v16 = *(void **)(v12 + 8);
  v17 = *(_BYTE *)(v12 + 16);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_BYTE *)(v12 + 16) = v14;
  sub_248A7F078(v15, v16, v17);
  return a1;
}

uint64_t sub_248A7F804(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t *v14;
  unint64_t v15;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(unsigned __int8 *)(v4 + 80);
  if (v6 >= a2)
  {
    v14 = (unint64_t *)((a1 + 9) & 0xFFFFFFFFFFFFFFF8);
    if ((v5 & 0x80000000) != 0)
    {
      return (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v14 + v7 + 8) & ~v7);
    }
    else
    {
      v15 = *v14;
      if (v15 >= 0xFFFFFFFF)
        LODWORD(v15) = -1;
      return (v15 + 1);
    }
  }
  else
  {
    v8 = ((*(_QWORD *)(v4 + 64) + ((v7 + 16) & ~v7) + 7) & 0xFFFFFFFFFFFFFFF8) + 17;
    v9 = (a2 - v6 + 255) >> (8 * v8);
    if (v8 < 4)
      v10 = v9 + 1;
    else
      v10 = 2;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    return ((uint64_t (*)(void))((char *)&loc_248A7F89C + 4 * byte_248A9EC20[v12]))();
  }
}

void sub_248A7F934(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(_QWORD *)(v5 + 64)
       + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 17;
  if (v6 >= a3)
  {
    v10 = 0;
    if (v6 >= a2)
      goto LABEL_17;
  }
  else
  {
    if (v7 <= 3)
      v8 = ((a3 - v6 + 255) >> (8 * v7)) + 1;
    else
      v8 = 2;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    if (v6 >= a2)
LABEL_17:
      __asm { BR              X13 }
  }
  if (v7 >= 4)
    v11 = ~v6 + a2;
  else
    v11 = (~(_BYTE)v6 + a2);
  bzero(a1, v7);
  if ((_DWORD)v7 == 1)
    *a1 = v11;
  else
    *(_DWORD *)a1 = v11;
  __asm { BR              X10 }
}

void sub_248A7FA64()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x248A7FAD4);
}

void sub_248A7FA6C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x248A7FA74);
  JUMPOUT(0x248A7FAD4);
}

void sub_248A7FA8C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x248A7FAD4);
}

void sub_248A7FA94()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x248A7FAD4);
}

void sub_248A7FA9C(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_WORD *)(v3 + v4) = 0;
  if (a2)
  {
    if ((a3 & 0x80000000) == 0)
    {
      if ((a2 & 0x80000000) == 0)
        JUMPOUT(0x248A7FAD0);
      JUMPOUT(0x248A7FACCLL);
    }
    JUMPOUT(0x248A7FAA8);
  }
  JUMPOUT(0x248A7FAD4);
}

uint64_t sub_248A7FAEC(uint64_t a1)
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
  _QWORD v14[2];
  _QWORD v15[2];
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[3];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4C8);
  v2 = sub_248A9C520();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4D0);
  swift_getTupleTypeMetadata2();
  v3 = sub_248A9C55C();
  v4 = sub_248A9C280();
  v5 = sub_248A9C280();
  v6 = sub_248A9C49C();
  v7 = sub_248A9C0B8();
  v8 = sub_248A9C0B8();
  v19[0] = sub_248A7EDC4();
  v19[1] = v1;
  v19[2] = MEMORY[0x24BDF5138];
  v18[0] = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v2, v19);
  v18[1] = MEMORY[0x2495A3E38](MEMORY[0x24BDF5428], v3);
  v9 = MEMORY[0x24BDEF3E0];
  v17[0] = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v4, v18);
  v17[1] = v1;
  v16 = MEMORY[0x2495A3E38](v9, v5, v17);
  v10 = MEMORY[0x2495A3E38](MEMORY[0x24BDF3F50], v6, &v16);
  v11 = MEMORY[0x24BDF0910];
  v15[0] = v10;
  v15[1] = MEMORY[0x24BDF0910];
  v12 = MEMORY[0x24BDED308];
  v14[0] = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v7, v15);
  v14[1] = v11;
  return MEMORY[0x2495A3E38](v12, v8, v14);
}

uint64_t sub_248A7FCB0@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for TipKitSectionHeader(0, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1);
  result = TipKitSectionHeader.viewModel.getter(v4);
  *a2 = result;
  return result;
}

uint64_t sub_248A7FCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE4D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_248A7FD2C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE5E8;
  if (!qword_2577AE5E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE4D0);
    v2[0] = sub_248A7FDB0();
    v2[1] = sub_248A7F034(&qword_2577AE528, &qword_2577AE530, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE5E8);
  }
  return result;
}

unint64_t sub_248A7FDB0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[3];

  result = qword_2577AE5F0;
  if (!qword_2577AE5F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE5D8);
    v2 = sub_248A7EFF0();
    v3[0] = MEMORY[0x24BDF5138];
    v3[1] = v2;
    v3[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDF4AF8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2577AE5F0);
  }
  return result;
}

uint64_t sub_248A7FE20()
{
  return sub_248A9C160();
}

uint64_t sub_248A7FE40(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE5E0);
  MEMORY[0x24BDAC7A8](v2);
  sub_248A7FEC4(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2577AE5E0);
  return sub_248A9C16C();
}

uint64_t sub_248A7FEC4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void **sub_248A7FF08(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_retain();
  v3 = v2;
  return a1;
}

uint64_t sub_248A7FF34@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_248A7E9E4(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2495A3DB4](a1, v6, a5);
}

uint64_t sub_248A7FFF4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPKContent_displayCount;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_248A800E8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPKContent_identifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_248A801A4(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___TPKContent_identifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A80250()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPKContent_customizationID;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_248A80320()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___TPKContent_version;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_248A80434()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_248A80504(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A80600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  id v3;
  void *v4;
  id v5;
  void *v6;

  v1 = OBJC_IVAR___TPKContent_tip;
  result = *(_QWORD *)(v0 + OBJC_IVAR___TPKContent_tip);
  if (result)
  {
    v3 = objc_msgSend((id)result, sel_miniContent);
    if (v3)
    {
      v4 = v3;
      v5 = objc_msgSend(v3, sel_bodyText);

      if (v5)
      {
LABEL_7:

        return 1;
      }
    }
    result = *(_QWORD *)(v0 + v1);
    if (result)
    {
      result = (uint64_t)objc_msgSend((id)result, sel_miniContent);
      if (result)
      {
        v6 = (void *)result;
        v5 = objc_msgSend((id)result, sel_bodyContent);

        if (!v5)
          return 0;
        goto LABEL_7;
      }
    }
  }
  return result;
}

id sub_248A806E4()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + OBJC_IVAR___TPKContent_tip);
  if (result)
    return objc_msgSend(result, sel_isLocalContent);
  return result;
}

uint64_t sub_248A8082C()
{
  char *v0;
  char *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  objc_super v70;

  v1 = v0;
  v70.receiver = v0;
  v70.super_class = (Class)type metadata accessor for TPKContent();
  v2 = objc_msgSendSuper2(&v70, sel_debugDescription);
  v3 = sub_248A9C5C8();
  v5 = v4;

  *(_QWORD *)&v57 = v3;
  *((_QWORD *)&v57 + 1) = v5;
  v68 = 0x4025203D204025;
  v69 = 0xE700000000000000;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25446CD40);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_248A9EDA0;
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  v8 = sub_248A80FCC();
  *(_QWORD *)(v6 + 64) = v8;
  *(_QWORD *)(v6 + 32) = 0x696669746E656469;
  *(_QWORD *)(v6 + 40) = 0xEA00000000007265;
  v9 = &v1[OBJC_IVAR___TPKContent_identifier];
  swift_beginAccess();
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  *(_QWORD *)(v6 + 96) = v7;
  *(_QWORD *)(v6 + 104) = v8;
  *(_QWORD *)(v6 + 72) = v10;
  *(_QWORD *)(v6 + 80) = v11;
  sub_248A7D434();
  swift_bridgeObjectRetain();
  v12 = sub_248A9C718();
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v12;
  *((_QWORD *)&v57 + 1) = v14;
  v66 = 0x646C25203D204025;
  v67 = 0xE800000000000000;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v15 + 56) = v7;
  *(_QWORD *)(v15 + 64) = v8;
  strcpy((char *)(v15 + 32), "displayCount");
  *(_BYTE *)(v15 + 45) = 0;
  *(_WORD *)(v15 + 46) = -5120;
  v16 = &v1[OBJC_IVAR___TPKContent_displayCount];
  swift_beginAccess();
  v17 = *(_QWORD *)v16;
  v18 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v15 + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v15 + 104) = v18;
  *(_QWORD *)(v15 + 72) = v17;
  v19 = sub_248A9C718();
  v21 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v19;
  *((_QWORD *)&v57 + 1) = v21;
  v64 = 0x646C25203D204025;
  v65 = 0xE800000000000000;
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v22 + 56) = v7;
  *(_QWORD *)(v22 + 64) = v8;
  *(_QWORD *)(v22 + 32) = 0x7A696D6F74737563;
  *(_QWORD *)(v22 + 40) = 0xEF44496E6F697461;
  v23 = &v1[OBJC_IVAR___TPKContent_customizationID];
  swift_beginAccess();
  v24 = *(_QWORD *)v23;
  *(_QWORD *)(v22 + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v22 + 104) = v18;
  *(_QWORD *)(v22 + 72) = v24;
  v25 = sub_248A9C718();
  v27 = v26;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v25;
  *((_QWORD *)&v57 + 1) = v27;
  v28 = 0xE700000000000000;
  v64 = 0x4025203D204025;
  v65 = 0xE700000000000000;
  v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v29 + 56) = v7;
  *(_QWORD *)(v29 + 64) = v8;
  *(_QWORD *)(v29 + 32) = 0x6574617473;
  *(_QWORD *)(v29 + 40) = 0xE500000000000000;
  v30 = v1;
  v31 = 0x7373696D736964;
  switch(*(_QWORD *)&v1[OBJC_IVAR___TPKContent_state])
  {
    case 0:
      v31 = 0xD000000000000028;
      v32 = "pendingRestartTrackingTriggerEventsCheck";
      goto LABEL_6;
    case 1:
      v31 = 0xD00000000000001BLL;
      v32 = "monitorInitialDisplayEvents";
      goto LABEL_6;
    case 2:
      v31 = 0xD000000000000014;
      v32 = "monitorDisplayEvents";
LABEL_6:
      v28 = (unint64_t)(v32 - 32) | 0x8000000000000000;
      break;
    case 3:
      v28 = 0xEF79616C70736944;
      v31 = 0x726F467964616572;
      break;
    case 4:
      v31 = 0x6979616C70736964;
      v28 = 0xEA0000000000676ELL;
      break;
    case 5:
      break;
    default:
      sub_248A9C808();
      __break(1u);
      JUMPOUT(0x248A80F94);
  }
  *(_QWORD *)(v29 + 96) = v7;
  *(_QWORD *)(v29 + 104) = v8;
  *(_QWORD *)(v29 + 72) = v31;
  *(_QWORD *)(v29 + 80) = v28;
  v33 = sub_248A9C718();
  v35 = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v33;
  *((_QWORD *)&v57 + 1) = v35;
  v64 = 0x4025203D204025;
  v65 = 0xE700000000000000;
  v36 = swift_allocObject();
  *(_OWORD *)(v36 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v36 + 56) = v7;
  *(_QWORD *)(v36 + 64) = v8;
  *(_QWORD *)(v36 + 32) = 0xD000000000000010;
  *(_QWORD *)(v36 + 40) = 0x8000000248AA0F50;
  v37 = *(void **)&v1[OBJC_IVAR___TPKContent_monitoringEvents];
  if (v37)
  {
    v38 = objc_msgSend(v37, sel_debugDescription);
    v39 = sub_248A9C5C8();
    v41 = v40;

    v42 = (uint64_t *)(v36 + 72);
    *(_QWORD *)(v36 + 96) = v7;
    *(_QWORD *)(v36 + 104) = v8;
    if (v41)
    {
      *v42 = v39;
      goto LABEL_13;
    }
  }
  else
  {
    v42 = (uint64_t *)(v36 + 72);
    *(_QWORD *)(v36 + 96) = v7;
    *(_QWORD *)(v36 + 104) = v8;
  }
  *v42 = 7104878;
  v41 = 0xE300000000000000;
LABEL_13:
  *(_QWORD *)(v36 + 80) = v41;
  v43 = sub_248A9C718();
  v45 = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v57 = v43;
  *((_QWORD *)&v57 + 1) = v45;
  v46 = swift_allocObject();
  *(_OWORD *)(v46 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v46 + 56) = v7;
  *(_QWORD *)(v46 + 64) = v8;
  *(_QWORD *)(v46 + 32) = 0x6E6F6973726576;
  *(_QWORD *)(v46 + 40) = 0xE700000000000000;
  v47 = &v30[OBJC_IVAR___TPKContent_version];
  swift_beginAccess();
  v48 = *(_QWORD *)v47;
  *(_QWORD *)(v46 + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v46 + 104) = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v46 + 72) = v48;
  v49 = sub_248A9C718();
  v51 = v50;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v62 = v49;
  v63 = v51;
  v60 = 0x4025203D204025;
  v61 = 0xE700000000000000;
  v52 = swift_allocObject();
  *(_OWORD *)(v52 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v52 + 56) = v7;
  *(_QWORD *)(v52 + 64) = v8;
  *(_QWORD *)(v52 + 32) = 0x6F666E4972657375;
  *(_QWORD *)(v52 + 40) = 0xE800000000000000;
  v53 = &v30[OBJC_IVAR___TPKContent_userInfo];
  swift_beginAccess();
  v54 = *(_QWORD *)v53;
  if (v54)
  {
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE648);
    v59 = sub_248A81010();
    *(_QWORD *)&v57 = v54;
    sub_248A8105C(&v57, v52 + 72);
  }
  else
  {
    *(_QWORD *)(v52 + 96) = v7;
    *(_QWORD *)(v52 + 104) = v8;
    *(_QWORD *)(v52 + 72) = 7104878;
    *(_QWORD *)(v52 + 80) = 0xE300000000000000;
  }
  swift_bridgeObjectRetain();
  v55 = sub_248A9C718();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v55;
}

uint64_t type metadata accessor for TPKContent()
{
  return objc_opt_self();
}

unint64_t sub_248A80FCC()
{
  unint64_t result;

  result = qword_25446CCE8;
  if (!qword_25446CCE8)
  {
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25446CCE8);
  }
  return result;
}

unint64_t sub_248A81010()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577AE650;
  if (!qword_2577AE650)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE648);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDCF848], v1);
    atomic_store(result, (unint64_t *)&qword_2577AE650);
  }
  return result;
}

uint64_t sub_248A8105C(__int128 *a1, uint64_t a2)
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

void static TPKContent.emptyContent()()
{
  id v0;
  uint64_t v1;

  v0 = objc_allocWithZone((Class)type metadata accessor for TPKContent());
  sub_248A8118C(0x746E6F4374736554, 0xEB00000000746E65, 0, 0, 0);
  if (!v1)
    __break(1u);
}

void sub_248A810D4(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  id v11;

  v11 = objc_allocWithZone(v5);
  sub_248A8118C(a1, a2, a3, a4, a5);
}

void sub_248A8118C(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v15;
  char *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  uint64_t v27;
  char v28;
  char *v29;
  void *v30;
  uint64_t v31;
  unsigned __int8 *v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  unsigned __int8 *v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int8 *v45;
  unsigned int v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  objc_super v51;
  _QWORD v52[4];

  v9 = OBJC_IVAR___TPKContent_tip;
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_tip] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_cachedViewModel] = 0;
  v10 = &v5[OBJC_IVAR___TPKContent_displayCount];
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_displayCount] = 0;
  v11 = &v5[OBJC_IVAR___TPKContent_userInfo];
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_userInfo] = 0;
  v12 = OBJC_IVAR___TPKContent_monitoringEvents;
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_monitoringEvents] = 0;
  v13 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v13 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v13)
  {
    v29 = v5;
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    v30 = *(void **)&v5[v12];

    type metadata accessor for TPKContent();
    swift_deallocPartialClassInstance();
    return;
  }
  swift_beginAccess();
  *(_QWORD *)v10 = 0;
  *(_QWORD *)&v5[OBJC_IVAR___TPKContent_customizationID] = a4;
  v15 = (void *)objc_opt_self();
  v16 = v5;
  v17 = objc_msgSend(v15, sel_sharedInstance);
  if (!v17)
    goto LABEL_65;
  v18 = v17;
  v49 = a5;
  v19 = objc_msgSend(v17, sel_majorVersion);

  if (v19)
  {
    v20 = sub_248A9C5C8();
    v22 = v21;

    v23 = HIBYTE(v22) & 0xF;
    v24 = v20 & 0xFFFFFFFFFFFFLL;
    if ((v22 & 0x2000000000000000) != 0)
      v25 = HIBYTE(v22) & 0xF;
    else
      v25 = v20 & 0xFFFFFFFFFFFFLL;
    if (!v25)
    {
      swift_bridgeObjectRelease();
      v35 = 0;
LABEL_43:
      *(_QWORD *)&v16[OBJC_IVAR___TPKContent_version] = v35;
      v36 = &v16[OBJC_IVAR___TPKContent_identifier];
      *(_QWORD *)v36 = a1;
      *((_QWORD *)v36 + 1) = a2;
      swift_beginAccess();
      *(_QWORD *)v11 = v49;
      swift_bridgeObjectRelease();
      v37 = *(void **)&v5[v12];
      *(_QWORD *)&v5[v12] = a3;
      v38 = a3;

      v39 = v38;
      *(_QWORD *)&v16[OBJC_IVAR___TPKContent_state] = sub_248A89240(a3);

      v51.receiver = v16;
      v51.super_class = (Class)type metadata accessor for TPKContent();
      objc_msgSendSuper2(&v51, sel_init);

      return;
    }
    if ((v22 & 0x1000000000000000) != 0)
    {
      v27 = (uint64_t)sub_248A82EB8(v20, v22, 10);
      LOBYTE(v20) = v48;
LABEL_40:
      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
        v35 = 0;
      else
        v35 = v27;
      goto LABEL_43;
    }
    if ((v22 & 0x2000000000000000) == 0)
    {
      if ((v20 & 0x1000000000000000) != 0)
        v26 = (unsigned __int8 *)((v22 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v26 = (unsigned __int8 *)sub_248A9C76C();
      v27 = (uint64_t)sub_248A82F9C(v26, v24, 10);
      LOBYTE(v20) = v28 & 1;
      goto LABEL_40;
    }
    v52[0] = v20;
    v52[1] = v22 & 0xFFFFFFFFFFFFFFLL;
    if (v20 == 43)
    {
      if (!v23)
      {
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      if (v23 == 1 || (BYTE1(v20) - 48) > 9u)
      {
LABEL_37:
        v27 = 0;
        LOBYTE(v20) = 1;
        goto LABEL_40;
      }
      v27 = (BYTE1(v20) - 48);
      if (v23 != 2)
      {
        if ((BYTE2(v20) - 48) > 9u)
          goto LABEL_37;
        v27 = 10 * (BYTE1(v20) - 48) + (BYTE2(v20) - 48);
        v31 = v23 - 3;
        if (v31)
        {
          v32 = (unsigned __int8 *)v52 + 3;
          while (1)
          {
            v33 = *v32 - 48;
            if (v33 > 9)
              goto LABEL_37;
            v34 = 10 * v27;
            if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
              goto LABEL_37;
            v27 = v34 + v33;
            if (__OFADD__(v34, v33))
              goto LABEL_37;
            LOBYTE(v20) = 0;
            ++v32;
            if (!--v31)
              goto LABEL_40;
          }
        }
      }
    }
    else
    {
      if (v20 == 45)
      {
        if (v23)
        {
          if (v23 == 1 || (BYTE1(v20) - 48) > 9u)
            goto LABEL_37;
          if (v23 == 2)
          {
            LOBYTE(v20) = 0;
            v27 = -(uint64_t)(BYTE1(v20) - 48);
            goto LABEL_40;
          }
          if ((BYTE2(v20) - 48) > 9u)
            goto LABEL_37;
          v27 = -10 * (BYTE1(v20) - 48) - (BYTE2(v20) - 48);
          v44 = v23 - 3;
          if (v44)
          {
            v45 = (unsigned __int8 *)v52 + 3;
            while (1)
            {
              v46 = *v45 - 48;
              if (v46 > 9)
                goto LABEL_37;
              v47 = 10 * v27;
              if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
                goto LABEL_37;
              v27 = v47 - v46;
              if (__OFSUB__(v47, v46))
                goto LABEL_37;
              LOBYTE(v20) = 0;
              ++v45;
              if (!--v44)
                goto LABEL_40;
            }
          }
          goto LABEL_39;
        }
        __break(1u);
        goto LABEL_64;
      }
      if (!v23 || (v20 - 48) > 9u)
        goto LABEL_37;
      v27 = (v20 - 48);
      if (v23 != 1)
      {
        if ((BYTE1(v20) - 48) > 9u)
          goto LABEL_37;
        v27 = 10 * (v20 - 48) + (BYTE1(v20) - 48);
        v40 = v23 - 2;
        if (v40)
        {
          v41 = (unsigned __int8 *)v52 + 2;
          while (1)
          {
            v42 = *v41 - 48;
            if (v42 > 9)
              goto LABEL_37;
            v43 = 10 * v27;
            if ((unsigned __int128)(v27 * (__int128)10) >> 64 != (10 * v27) >> 63)
              goto LABEL_37;
            v27 = v43 + v42;
            if (__OFADD__(v43, v42))
              goto LABEL_37;
            LOBYTE(v20) = 0;
            ++v41;
            if (!--v40)
              goto LABEL_40;
          }
        }
      }
    }
LABEL_39:
    LOBYTE(v20) = 0;
    goto LABEL_40;
  }
LABEL_66:
  __break(1u);
}

char *sub_248A81700(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  void *v9;
  id v10;
  void *v11;
  id v12;
  char *v13;
  void *v14;

  v5 = v4;
  v9 = a1;
  v10 = objc_msgSend(a1, sel_identifier);
  if (v10)
  {
    if (a4)
    {
LABEL_3:
      v11 = (void *)sub_248A9C574();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_248A9C5C8();
    v10 = (id)sub_248A9C5A4();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  v12 = objc_msgSend(v5, sel_initWithIdentifier_monitoringEvents_customizationID_userInfo_, v10, a2, a3, v11);

  v13 = (char *)v12;
  if (v13)
  {

    v14 = *(void **)&v13[OBJC_IVAR___TPKContent_tip];
    *(_QWORD *)&v13[OBJC_IVAR___TPKContent_tip] = v9;
    v9 = v14;
  }

  return v13;
}

id TPKContent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return TPKContent.init(coder:)(a1);
}

id TPKContent.init(coder:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  objc_super v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;

  v2 = v1;
  v4 = OBJC_IVAR___TPKContent_tip;
  *(_QWORD *)&v2[OBJC_IVAR___TPKContent_tip] = 0;
  *(_QWORD *)&v2[OBJC_IVAR___TPKContent_cachedViewModel] = 0;
  v5 = (uint64_t *)&v2[OBJC_IVAR___TPKContent_displayCount];
  *(_QWORD *)&v2[OBJC_IVAR___TPKContent_displayCount] = 0;
  v6 = &v2[OBJC_IVAR___TPKContent_userInfo];
  *(_QWORD *)&v2[OBJC_IVAR___TPKContent_userInfo] = 0;
  v7 = OBJC_IVAR___TPKContent_monitoringEvents;
  *(_QWORD *)&v2[OBJC_IVAR___TPKContent_monitoringEvents] = 0;
  sub_248A78B44(0, (unint64_t *)&unk_25446CD30);
  v8 = v2;
  v9 = sub_248A9C6DC();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = sub_248A9C5C8();
    v13 = v12;

    v14 = (uint64_t *)&v8[OBJC_IVAR___TPKContent_identifier];
    *v14 = v11;
    v14[1] = v13;
    sub_248A78B44(0, &qword_25446CD28);
    v15 = (void *)sub_248A9C6DC();
    if (v15)
    {
      v40 = 0;
      v41 = 1;
      sub_248A9C6C4();

      v15 = 0;
    }
    swift_beginAccess();
    *v5 = (uint64_t)v15;
    v16 = sub_248A9C6DC();
    if (v16)
    {
      v17 = (void *)v16;
      v38 = 0;
      v39 = 1;
      sub_248A9C6C4();

    }
    *(_QWORD *)&v8[OBJC_IVAR___TPKContent_customizationID] = 0;
    v20 = sub_248A9C6DC();
    if (v20)
    {
      v21 = (void *)v20;
      v38 = 0;
      v39 = 1;
      sub_248A9C6C4();

    }
    *(_QWORD *)&v8[OBJC_IVAR___TPKContent_version] = 0;
    sub_248A78B44(0, (unint64_t *)&unk_25446CD10);
    v22 = sub_248A9C6DC();
    v23 = *(void **)&v2[v7];
    *(_QWORD *)&v2[v7] = v22;

    sub_248A78B44(0, &qword_25446CCF8);
    v24 = sub_248A9C6DC();
    if (v24)
    {
      v25 = (void *)v24;
      v38 = 0;
      sub_248A9C580();

    }
    swift_beginAccess();
    *(_QWORD *)v6 = 0;
    swift_bridgeObjectRelease();
    sub_248A78B44(0, &qword_25446CD20);
    v26 = sub_248A9C6DC();
    v27 = *(void **)&v2[v4];
    *(_QWORD *)&v2[v4] = v26;

    v28 = sub_248A9C6DC();
    if (v28)
    {
      v29 = (void *)v28;
      sub_248A9C6C4();

      v28 = 0;
    }
    v30 = sub_248A893C8(v28);
    if ((v31 & 1) != 0)
      v32 = 3;
    else
      v32 = v30;
    v33 = *v5;
    v34 = *(void **)&v2[v7];
    v35 = v34;
    *(_QWORD *)&v8[OBJC_IVAR___TPKContent_state] = sub_248A893D8(v32, v33, v34);

    v37.receiver = v8;
    v37.super_class = (Class)type metadata accessor for TPKContent();
    v19 = objc_msgSendSuper2(&v37, sel_init);

  }
  else
  {

    swift_release();
    swift_bridgeObjectRelease();
    v18 = *(void **)&v2[v7];

    type metadata accessor for TPKContent();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v19;
}

id TPKContent.__allocating_init(copy:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_248A8387C((uint64_t)a1);

  return v4;
}

id TPKContent.init(copy:)(void *a1)
{
  id v2;

  v2 = sub_248A8387C((uint64_t)a1);

  return v2;
}

uint64_t sub_248A81DF0(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unsigned __int8 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  objc_class *v15;
  uint64_t v17;
  char *v18;
  objc_super v19;
  _QWORD v20[3];
  uint64_t v21;

  sub_248A83A7C(a1, (uint64_t)v20);
  if (v21)
  {
    type metadata accessor for TPKContent();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = &v18[OBJC_IVAR___TPKContent_identifier];
      swift_beginAccess();
      v4 = *(_QWORD *)v3;
      v5 = *((_QWORD *)v3 + 1);
      v6 = &v1[OBJC_IVAR___TPKContent_identifier];
      swift_beginAccess();
      if (v4 == *(_QWORD *)v6 && v5 == *((_QWORD *)v6 + 1))
      {

        v8 = 1;
      }
      else
      {
        v8 = sub_248A9C7FC();

      }
      return v8 & 1;
    }
  }
  else
  {
    sub_248A75A1C((uint64_t)v20);
  }
  sub_248A83A7C(a1, (uint64_t)v20);
  v9 = v21;
  if (v21)
  {
    v10 = __swift_project_boxed_opaque_existential_1(v20, v21);
    v11 = *(_QWORD *)(v9 - 8);
    MEMORY[0x24BDAC7A8](v10);
    v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    v14 = sub_248A9C7F0();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    v14 = 0;
  }
  v15 = (objc_class *)type metadata accessor for TPKContent();
  v19.receiver = v1;
  v19.super_class = v15;
  v8 = objc_msgSendSuper2(&v19, sel_isEqual_, v14);
  swift_unknownObjectRelease();
  return v8 & 1;
}

void sub_248A82018(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;

  swift_beginAccess();
  v3 = (void *)sub_248A9C6B8();
  v4 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  swift_beginAccess();
  v5 = (void *)sub_248A9C6B8();
  v6 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v5, v6);

  swift_beginAccess();
  v7 = (void *)sub_248A9C6B8();
  v8 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  v9 = (void *)sub_248A9C6B8();
  v10 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v9, v10);

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v11 = (void *)sub_248A9C5A4();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v11, v12);

  v13 = (_QWORD *)(v1 + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  if (*v13)
  {
    swift_bridgeObjectRetain();
    v14 = (void *)sub_248A9C574();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v14, v15);

  v16 = *(id *)(v1 + OBJC_IVAR___TPKContent_monitoringEvents);
  v17 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v16, v17);

  v18 = *(id *)(v1 + OBJC_IVAR___TPKContent_tip);
  v19 = (void *)sub_248A9C5A4();
  objc_msgSend(a1, sel_encodeObject_forKey_, v18, v19);

}

uint64_t sub_248A823DC@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  uint64_t result;

  v3 = objc_allocWithZone((Class)type metadata accessor for TPKContent());
  v4 = v1;
  v5 = sub_248A8387C((uint64_t)v4);

  result = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577AE660);
  a1[3] = result;
  *a1 = v5;
  return result;
}

uint64_t sub_248A82498()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t result;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPKContent_displayCount);
  if (*(_QWORD *)(v0 + OBJC_IVAR___TPKContent_state) == 4)
  {
    swift_beginAccess();
    v2 = *v1 + 1;
    if (!__OFADD__(*v1, 1))
      goto LABEL_6;
    __break(1u);
  }
  swift_beginAccess();
  v2 = *v1;
LABEL_6:
  v3 = (uint64_t *)(v0 + OBJC_IVAR___TPKContent_displayCount);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_248A82570(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___TPKContent_displayCount);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t sub_248A82600()
{
  uint64_t v0;
  uint64_t result;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  result = *(_QWORD *)(v0 + OBJC_IVAR___TPKContent_state);
  switch(result)
  {
    case 0:
      v2 = *(void **)(v0 + OBJC_IVAR___TPKContent_monitoringEvents);
      if (v2
        && (v3 = objc_msgSend(v2, sel_initialDisplayEventMap)) != 0
        && (v4 = v3,
            sub_248A78B44(0, (unint64_t *)&qword_25446CD00),
            v5 = sub_248A9C58C(),
            v4,
            v6 = *(_QWORD *)(v5 + 16),
            swift_bridgeObjectRelease(),
            v6))
      {
        result = 9;
      }
      else
      {
        result = 10;
      }
      break;
    case 1:
      return result;
    case 2:
      result = 2;
      break;
    case 4:
      v7 = *(void **)(v0 + OBJC_IVAR___TPKContent_monitoringEvents);
      if (v7
        && (v8 = objc_msgSend(v7, sel_displayEventMap)) != 0
        && (v9 = v8,
            sub_248A78B44(0, (unint64_t *)&qword_25446CD00),
            v10 = sub_248A9C58C(),
            v9,
            v11 = *(_QWORD *)(v10 + 16),
            swift_bridgeObjectRelease(),
            v11))
      {
        result = 52;
      }
      else
      {
        result = 48;
      }
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t sub_248A827A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t inited;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  char v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  char v28;
  char v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  char v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v3 = v2;
  v6 = *(_QWORD *)(v2 + OBJC_IVAR___TPKContent_state);
  if (v6 == 1)
  {
    v17 = *(void **)(v2 + OBJC_IVAR___TPKContent_monitoringEvents);
    if (!v17)
      return 0;
    v18 = objc_msgSend(v17, sel_initialDisplayEventMap);
    if (!v18)
      return 0;
    v19 = v18;
    sub_248A78B44(0, (unint64_t *)&qword_25446CD00);
    v20 = sub_248A9C58C();

    if (*(_QWORD *)(v20 + 16))
    {
      swift_bridgeObjectRetain();
      sub_248A86858(a1, a2);
      v22 = v21;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v22 & 1;
    }
    goto LABEL_45;
  }
  if (v6 == 2)
  {
    v24 = *(void **)(v2 + OBJC_IVAR___TPKContent_monitoringEvents);
    if (!v24)
      return 0;
    v25 = objc_msgSend(v24, sel_displayEventMap);
    if (!v25)
      return 0;
    v26 = v25;
    sub_248A78B44(0, (unint64_t *)&qword_25446CD00);
    v27 = sub_248A9C58C();

    if (*(_QWORD *)(v27 + 16))
    {
      swift_bridgeObjectRetain();
      sub_248A86858(a1, a2);
      v29 = v28;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v29 & 1) != 0)
        return 2;
      else
        return 0;
    }
    goto LABEL_45;
  }
  if (v6 != 4)
    return 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE738);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_248A9EDB0;
  v8 = OBJC_IVAR___TPKContent_monitoringEvents;
  v9 = *(void **)(v2 + OBJC_IVAR___TPKContent_monitoringEvents);
  if (!v9)
    goto LABEL_22;
  v10 = objc_msgSend(v9, sel_restartTrackingTriggerEventMap);
  if (!v10)
    goto LABEL_22;
  v11 = v10;
  sub_248A78B44(0, (unint64_t *)&qword_25446CD00);
  v12 = sub_248A9C58C();

  if (!*(_QWORD *)(v12 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_22:
    v15 = 0;
    v16 = 1;
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  sub_248A86858(a1, a2);
  v14 = v13;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = 4;
  if ((v14 & 1) == 0)
    v15 = 0;
  v16 = v14 ^ 1;
LABEL_23:
  *(_QWORD *)(inited + 32) = v15;
  *(_BYTE *)(inited + 40) = v16 & 1;
  v30 = *(void **)(v3 + v8);
  if (!v30)
    goto LABEL_30;
  v31 = objc_msgSend(v30, sel_dismissalEventMap);
  if (!v31)
    goto LABEL_30;
  v32 = v31;
  sub_248A78B44(0, (unint64_t *)&qword_25446CD00);
  v33 = sub_248A9C58C();

  if (!*(_QWORD *)(v33 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_30:
    v36 = 0;
    v37 = 1;
    goto LABEL_31;
  }
  swift_bridgeObjectRetain();
  sub_248A86858(a1, a2);
  v35 = v34;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36 = 16;
  if ((v35 & 1) == 0)
    v36 = 0;
  v37 = v35 ^ 1;
LABEL_31:
  *(_QWORD *)(inited + 48) = v36;
  *(_BYTE *)(inited + 56) = v37 & 1;
  v38 = *(void **)(v3 + v8);
  if (!v38)
    goto LABEL_38;
  v39 = objc_msgSend(v38, sel_desiredOutcomeEventMap);
  if (!v39)
    goto LABEL_38;
  v40 = v39;
  sub_248A78B44(0, (unint64_t *)&qword_25446CD00);
  v41 = sub_248A9C58C();

  if (!*(_QWORD *)(v41 + 16))
  {
    swift_bridgeObjectRelease();
LABEL_38:
    v44 = 0;
    v45 = 1;
    goto LABEL_39;
  }
  swift_bridgeObjectRetain();
  sub_248A86858(a1, a2);
  v43 = v42;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v44 = 32;
  if ((v43 & 1) == 0)
    v44 = 0;
  v45 = v43 ^ 1;
LABEL_39:
  *(_QWORD *)(inited + 64) = v44;
  *(_BYTE *)(inited + 72) = v45 & 1;
  v46 = sub_248A837B0(inited);
  swift_setDeallocating();
  v47 = *((_QWORD *)v46 + 2);
  if (!v47)
  {
LABEL_45:
    swift_bridgeObjectRelease();
    return 0;
  }
  v48 = 0;
  v23 = 0;
  do
  {
    v49 = *(_QWORD *)&v46[8 * v48 + 32];
    if ((v49 & ~v23) == 0)
      v49 = 0;
    v23 |= v49;
    ++v48;
  }
  while (v47 != v48);
  swift_bridgeObjectRelease();
  return v23;
}

uint64_t sub_248A82C9C(uint64_t result)
{
  char *v1;
  uint64_t v2;
  void *v3;
  char *v4;

  if (result)
  {
    v2 = OBJC_IVAR___TPKContent_cachedViewModel;
    if (!*(_QWORD *)&v1[OBJC_IVAR___TPKContent_cachedViewModel])
    {
      v3 = (void *)result;
      type metadata accessor for MiniTipViewModel();
      swift_allocObject();
      swift_unknownObjectRetain_n();
      v4 = v1;
      *(_QWORD *)&v1[v2] = sub_248A7BF14(v1, v3);
      swift_unknownObjectRelease();
      return swift_release();
    }
  }
  return result;
}

id static TPKContent.== infix(_:_:)(void *a1, uint64_t a2)
{
  return objc_msgSend(a1, sel_isEqual_, a2);
}

id TPKContent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TPKContent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPKContent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unsigned __int8 *sub_248A82EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_248A9C658();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_248A83218();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_248A9C76C();
  }
LABEL_7:
  v11 = sub_248A82F9C(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_248A82F9C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_248A83218()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_248A9C664();
  v4 = sub_248A83294(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_248A83294(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_248A833D8(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_248A834C4(v9, 0);
      v12 = sub_248A83528((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x2495A3610](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2495A3610);
LABEL_9:
      sub_248A9C76C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2495A3610]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_248A833D8(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_248A83738(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_248A83738(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_248A9C628();
  }
  __break(1u);
  return result;
}

_QWORD *sub_248A834C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(qword_25446CD60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_248A83528(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_248A83738(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_248A9C634();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_248A9C76C();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_248A83738(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_248A9C610();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_248A83738(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_248A9C640();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x2495A3658](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

char *sub_248A837B0(uint64_t a1)
{
  uint64_t v1;
  _BYTE *v2;
  char *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (char *)MEMORY[0x24BEE4AF8];
  v2 = (_BYTE *)(a1 + 40);
  v3 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((*v2 & 1) == 0)
    {
      v4 = *((_QWORD *)v2 - 1);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v3 = sub_248A75340(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
      v6 = *((_QWORD *)v3 + 2);
      v5 = *((_QWORD *)v3 + 3);
      if (v6 >= v5 >> 1)
        v3 = sub_248A75340((char *)(v5 > 1), v6 + 1, 1, v3);
      *((_QWORD *)v3 + 2) = v6 + 1;
      *(_QWORD *)&v3[8 * v6 + 32] = v4;
    }
    v2 += 16;
    --v1;
  }
  while (v1);
  return v3;
}

id sub_248A8387C(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;

  v3 = OBJC_IVAR___TPKContent_tip;
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_tip] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_cachedViewModel] = 0;
  v4 = &v1[OBJC_IVAR___TPKContent_displayCount];
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_displayCount] = 0;
  v5 = &v1[OBJC_IVAR___TPKContent_userInfo];
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_userInfo] = 0;
  v6 = OBJC_IVAR___TPKContent_monitoringEvents;
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_monitoringEvents] = 0;
  v7 = (uint64_t *)(a1 + OBJC_IVAR___TPKContent_displayCount);
  swift_beginAccess();
  v8 = *v7;
  swift_beginAccess();
  *(_QWORD *)v4 = v8;
  v9 = (_QWORD *)(a1 + OBJC_IVAR___TPKContent_customizationID);
  swift_beginAccess();
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_customizationID] = *v9;
  v10 = (_QWORD *)(a1 + OBJC_IVAR___TPKContent_version);
  swift_beginAccess();
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_version] = *v10;
  *(_QWORD *)&v1[OBJC_IVAR___TPKContent_state] = *(_QWORD *)(a1 + OBJC_IVAR___TPKContent_state);
  v11 = (uint64_t *)(a1 + OBJC_IVAR___TPKContent_identifier);
  swift_beginAccess();
  v12 = *v11;
  v13 = v11[1];
  v14 = &v1[OBJC_IVAR___TPKContent_identifier];
  *(_QWORD *)v14 = v12;
  *((_QWORD *)v14 + 1) = v13;
  v15 = (uint64_t *)(a1 + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  v16 = *v15;
  swift_beginAccess();
  *(_QWORD *)v5 = v16;
  v17 = v1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = *(void **)(a1 + OBJC_IVAR___TPKContent_monitoringEvents);
  v19 = *(void **)&v1[v6];
  *(_QWORD *)&v1[v6] = v18;
  v20 = v18;

  v21 = *(void **)(a1 + OBJC_IVAR___TPKContent_tip);
  v22 = *(void **)&v1[v3];
  *(_QWORD *)&v1[v3] = v21;
  v23 = v21;

  v25.receiver = v17;
  v25.super_class = (Class)type metadata accessor for TPKContent();
  return objc_msgSendSuper2(&v25, sel_init);
}

uint64_t sub_248A83A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25446CD50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A83AC4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPKContent_displayCount, a2);
}

uint64_t sub_248A83AD0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPKContent_displayCount);
}

uint64_t sub_248A83ADC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TPKContent_identifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_248A83B34@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPKContent_customizationID, a2);
}

uint64_t sub_248A83B40(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPKContent_customizationID);
}

uint64_t sub_248A83B4C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR___TPKContent_version, a2);
}

uint64_t keypath_getTm_0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_248A83BA4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR___TPKContent_version);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t sub_248A83BF8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___TPKContent_userInfo);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t method lookup function for TPKContent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKContent.displayCount.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of TPKContent.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of TPKContent.customizationID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPKContent.version.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of TPKContent.userInfo.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

uint64_t dispatch thunk of TPKContent.hasTipContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of TPKContent.isLocalContent.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of static TPKContent.supportsSecureCoding.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 392))();
}

uint64_t dispatch thunk of TPKContent.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 408))();
}

uint64_t dispatch thunk of TPKContent.__allocating_init(copy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 416))();
}

uint64_t dispatch thunk of TPKContent.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A8))();
}

uint64_t dispatch thunk of TPKContent.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B0))();
}

uint64_t dispatch thunk of TPKContent.updateDisplayCount(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t sub_248A83D8C()
{
  return swift_bridgeObjectRetain();
}

id sub_248A83D94(uint64_t a1, char *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v4 = sub_248A91078(a2);
  v5 = v4[2];
  if (v5)
  {
    v6 = (uint64_t)(v4 + 4);
    do
    {
      sub_248A756C8(v6, (uint64_t)v10);
      v7 = v11;
      v8 = v12;
      __swift_project_boxed_opaque_existential_1(v10, v11);
      (*(void (**)(id, uint64_t, uint64_t))(v8 + 16))(v3, v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
      v6 += 40;
      --v5;
    }
    while (v5);
  }

  swift_bridgeObjectRelease();
  return v3;
}

uint64_t *sub_248A83E5C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_unknownObjectWeakCopyInit();
    v7 = a3[5];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_248A9BF80();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v14 = a3[6];
    v15 = a3[7];
    v16 = (uint64_t *)((char *)a1 + v14);
    v17 = (uint64_t *)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    v19 = (uint64_t *)((char *)a1 + v15);
    v20 = (uint64_t *)((char *)a2 + v15);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = a3[8];
    v23 = a3[9];
    v24 = (uint64_t *)((char *)a1 + v22);
    v25 = (uint64_t *)((char *)a2 + v22);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = (uint64_t *)((char *)a1 + v23);
    v28 = (uint64_t *)((char *)a2 + v23);
    v29 = v28[1];
    *v27 = *v28;
    v27[1] = v29;
    v30 = a3[11];
    *(uint64_t *)((char *)a1 + a3[10]) = *(uint64_t *)((char *)a2 + a3[10]);
    *(uint64_t *)((char *)a1 + v30) = *(uint64_t *)((char *)a2 + v30);
    v31 = a3[12];
    v32 = *(void **)((char *)a2 + v31);
    *(uint64_t *)((char *)a1 + v31) = (uint64_t)v32;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v33 = v32;
  }
  return a1;
}

void sub_248A83FF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_unknownObjectWeakDestroy();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_248A9BF80();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

uint64_t sub_248A840C4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;

  v6 = swift_unknownObjectWeakCopyInit();
  v7 = a3[5];
  v8 = (void *)(v6 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_248A9BF80();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[6];
  v14 = a3[7];
  v15 = (_QWORD *)(a1 + v13);
  v16 = (_QWORD *)(a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  v18 = (_QWORD *)(a1 + v14);
  v19 = (_QWORD *)(a2 + v14);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  v21 = a3[8];
  v22 = a3[9];
  v23 = (_QWORD *)(a1 + v21);
  v24 = (_QWORD *)(a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  v26 = (_QWORD *)(a1 + v22);
  v27 = (_QWORD *)(a2 + v22);
  v28 = v27[1];
  *v26 = *v27;
  v26[1] = v28;
  v29 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v29) = *(_QWORD *)(a2 + v29);
  v30 = a3[12];
  v31 = *(void **)(a2 + v30);
  *(_QWORD *)(a1 + v30) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = v31;
  return a1;
}

uint64_t sub_248A84224(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v6 = swift_unknownObjectWeakCopyAssign();
  v7 = a3[5];
  v8 = (void *)(v6 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_248A9BF80();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = a3[7];
  v20 = (_QWORD *)(a1 + v19);
  v21 = (_QWORD *)(a2 + v19);
  *v20 = *v21;
  v20[1] = v21[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = a3[8];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (_QWORD *)(a2 + v22);
  *v23 = *v24;
  v23[1] = v24[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v25 = a3[9];
  v26 = (_QWORD *)(a1 + v25);
  v27 = (_QWORD *)(a2 + v25);
  *v26 = *v27;
  v26[1] = v27[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = a3[12];
  v29 = *(void **)(a1 + v28);
  v30 = *(void **)(a2 + v28);
  *(_QWORD *)(a1 + v28) = v30;
  v31 = v30;

  return a1;
}

uint64_t sub_248A84438(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = swift_unknownObjectWeakTakeInit();
  v7 = a3[5];
  v8 = (void *)(v6 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_248A9BF80();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  *(_OWORD *)(a1 + v13) = *(_OWORD *)(a2 + v13);
  v14 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v14) = *(_OWORD *)(a2 + v14);
  v15 = a3[11];
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v15) = *(_QWORD *)(a2 + v15);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  return a1;
}

uint64_t sub_248A84548(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;

  v6 = swift_unknownObjectWeakTakeAssign();
  v7 = a3[5];
  v8 = (void *)(v6 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_248A9BF80();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (uint64_t *)(a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[7];
  v22 = (_QWORD *)(a1 + v21);
  v23 = (uint64_t *)(a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = a3[8];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (uint64_t *)(a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v31 = a3[9];
  v32 = (_QWORD *)(a1 + v31);
  v33 = (uint64_t *)(a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[10]) = *(_QWORD *)(a2 + a3[10]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  v36 = a3[12];
  v37 = *(void **)(a1 + v36);
  *(_QWORD *)(a1 + v36) = *(_QWORD *)(a2 + v36);

  return a1;
}

uint64_t sub_248A84708()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248A84714(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 20), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_248A8479C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248A847A8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 20), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for TipBodyTextBuilder()
{
  uint64_t result;

  result = qword_2577AE800;
  if (!qword_2577AE800)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248A84868()
{
  unint64_t v0;

  sub_248A8490C();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_248A8490C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577AE810)
  {
    sub_248A9BF80();
    v0 = sub_248A9C70C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577AE810);
  }
}

uint64_t sub_248A84960(uint64_t a1)
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  int64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[3];
  _OWORD v37[2];
  __int128 v38;
  _OWORD v39[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE880);
    v2 = sub_248A9C7D8();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v26 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  if (v3 < 64)
    v4 = ~(-1 << v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(v3 + 63) >> 6;
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
      goto LABEL_26;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v13 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v13);
    ++v8;
    if (!v14)
    {
      v8 = v13 + 1;
      if (v13 + 1 >= v27)
        goto LABEL_35;
      v14 = *(_QWORD *)(v26 + 8 * v8);
      if (!v14)
      {
        v8 = v13 + 2;
        if (v13 + 2 >= v27)
          goto LABEL_35;
        v14 = *(_QWORD *)(v26 + 8 * v8);
        if (!v14)
          break;
      }
    }
LABEL_25:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v8 << 6);
LABEL_26:
    v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = *v16;
    v17 = v16[1];
    sub_248A71670(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v39);
    *(_QWORD *)&v38 = v18;
    *((_QWORD *)&v38 + 1) = v17;
    v36[2] = v38;
    v37[0] = v39[0];
    v37[1] = v39[1];
    *(_QWORD *)&v36[0] = v18;
    *((_QWORD *)&v36[0] + 1) = v17;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_248A74E60(v37, v31);
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_248A74E60(v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_248A74E60(v35, v36);
    sub_248A74E60(v36, &v32);
    result = sub_248A9C748();
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
          goto LABEL_36;
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
    result = (uint64_t)sub_248A74E60(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v15 = v13 + 3;
  if (v15 >= v27)
  {
LABEL_35:
    swift_release();
    swift_release();
    return v2;
  }
  v14 = *(_QWORD *)(v26 + 8 * v15);
  if (v14)
  {
    v8 = v15;
    goto LABEL_25;
  }
  while (1)
  {
    v8 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v8 >= v27)
      goto LABEL_35;
    v14 = *(_QWORD *)(v26 + 8 * v8);
    ++v15;
    if (v14)
      goto LABEL_25;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_248A84CE0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v20;

  v6 = (int *)type metadata accessor for TipBodyTextBuilder();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  v9 = &v8[v6[8]];
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v8[v6[10]] = MEMORY[0x24BEE4AF8];
  v11 = v6[11];
  *(_QWORD *)&v8[v11] = sub_248A71B80(v10);
  *(_QWORD *)&v8[v6[12]] = 0;
  v12 = &v8[v6[5]];
  v13 = sub_248A9BF80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = &v8[v6[6]];
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = &v8[v6[7]];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  *(_QWORD *)v9 = a1;
  *((_QWORD *)v9 + 1) = a2;
  if (a2)
    v16 = a1;
  else
    v16 = 0;
  v17 = 0xE000000000000000;
  if (a2)
    v17 = a2;
  v18 = &v8[v6[9]];
  *(_QWORD *)v18 = v16;
  *((_QWORD *)v18 + 1) = v17;
  sub_248A84FF8((uint64_t)v8, a3);
  return swift_bridgeObjectRetain();
}

uint64_t sub_248A84E08@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;

  v8 = type metadata accessor for TipBodyTextBuilder();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    swift_unknownObjectRelease();

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  }
  if (!a1)
  {

    swift_unknownObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a4, 1, 1, v8);
  }
  v12 = a2;
  v13 = a1;
  v14 = objc_msgSend(v12, sel_bodyContent);
  if (v14
    && (v15 = v14,
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE860),
        v16 = sub_248A9C688(),
        v15,
        v17 = (_QWORD *)sub_248A855E0(v16),
        swift_bridgeObjectRelease(),
        v17))
  {
    sub_248A8503C(v17, v13, a3, (uint64_t)v11);

  }
  else
  {
    v19 = objc_msgSend(v12, sel_bodyText);
    if (v19)
    {
      v20 = v19;
      v21 = sub_248A9C5C8();
      v23 = v22;

    }
    else
    {
      v21 = 0;
      v23 = 0;
    }
    sub_248A84CE0(v21, v23, (uint64_t)v11);

    swift_unknownObjectRelease();
  }
  sub_248A84FF8((uint64_t)v11, a4);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v9 + 56))(a4, 0, 1, v8);
}

uint64_t sub_248A84FF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipBodyTextBuilder();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A8503C@<X0>(_QWORD *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  int *v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t inited;
  void **v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  char isUniquelyReferenced_nonNull_native;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  void *v55;
  _QWORD *v56;
  uint64_t i;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  id v61;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD v67[2];
  __int128 v68;
  uint64_t v69;

  v64 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v63 - v11;
  swift_unknownObjectWeakInit();
  v13 = (int *)type metadata accessor for TipBodyTextBuilder();
  v14 = (_QWORD *)(a4 + v13[8]);
  *v14 = 0;
  v14[1] = 0;
  v15 = (_QWORD *)(a4 + v13[9]);
  *v15 = 0;
  v15[1] = 0xE000000000000000;
  v16 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a4 + v13[10]) = MEMORY[0x24BEE4AF8];
  v17 = v13[11];
  *(_QWORD *)(a4 + v17) = sub_248A71B80(v16);
  *(_QWORD *)(a4 + v13[12]) = 0;
  v65 = a4;
  swift_unknownObjectWeakAssign();
  v18 = objc_msgSend(a2, sel_miniContent);
  if (v18
    && (v19 = v18, v20 = objc_msgSend(v18, sel_assets), v19, v20))
  {
    v21 = objc_msgSend(v20, sel_baseURL);

    if (v21)
    {
      sub_248A9BF74();

      v22 = sub_248A9BF80();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v10, 0, 1, v22);
    }
    else
    {
      v25 = sub_248A9BF80();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v10, 1, 1, v25);
    }
    v24 = v65;
    sub_248A8572C((uint64_t)v10, (uint64_t)v12);
  }
  else
  {
    v23 = sub_248A9BF80();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    v24 = v65;
  }
  sub_248A8572C((uint64_t)v12, v24 + v13[5]);
  v26 = objc_msgSend(a2, sel_identifier);
  v27 = sub_248A9C5C8();
  v29 = v28;

  v30 = (uint64_t *)(v24 + v13[6]);
  *v30 = v27;
  v30[1] = v29;
  v31 = objc_msgSend(a2, sel_language);
  v32 = sub_248A9C5C8();
  v34 = v33;

  v35 = (uint64_t *)(v24 + v13[7]);
  *v35 = v32;
  v35[1] = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE868);
  inited = swift_initStackObject();
  v37 = (void **)MEMORY[0x24BEBB360];
  *(_OWORD *)(inited + 16) = xmmword_248A9E770;
  v38 = *v37;
  *(_QWORD *)(inited + 32) = v38;
  v39 = *MEMORY[0x24BEBE220];
  v40 = v38;
  v41 = objc_msgSend(a2, sel_language);
  if (!v41)
  {
    sub_248A9C5C8();
    v41 = (id)sub_248A9C5A4();
    swift_bridgeObjectRelease();
  }
  v42 = objc_msgSend((id)objc_opt_self(), sel_tps_preferredFontForTextStyle_symoblicTraits_languageCode_, v39, 0, v41);

  *(_QWORD *)(inited + 64) = sub_248A8681C();
  *(_QWORD *)(inited + 40) = v42;
  *(_QWORD *)(v24 + v17) = sub_248A71B80(inited);
  swift_bridgeObjectRelease();
  v43 = (void *)*MEMORY[0x24BEBB368];
  v44 = (void *)objc_opt_self();
  v45 = v43;
  v46 = MEMORY[0x2495A3484](objc_msgSend(v44, sel_secondaryLabelColor));
  v69 = MEMORY[0x24BDF3E48];
  *(_QWORD *)&v68 = v46;
  sub_248A74E60(&v68, v67);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v66 = *(_QWORD *)(v24 + v17);
  *(_QWORD *)(v24 + v17) = 0x8000000000000000;
  sub_248A87330(v67, v45, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(v24 + v17) = v66;

  swift_bridgeObjectRelease();
  v48 = objc_msgSend(a2, sel_miniContent);
  v49 = v48;
  if (v48)
  {
    v50 = objc_msgSend(v48, sel_bodyText);

    if (v50)
    {
      v49 = (void *)sub_248A9C5C8();
      v52 = v51;

      goto LABEL_15;
    }
    v49 = 0;
  }
  v52 = 0;
LABEL_15:
  v53 = v64;
  swift_bridgeObjectRelease();
  *v14 = v49;
  v14[1] = v52;
  if (v53)
  {
    v64 = a2;
    v54 = v53[2];
    if (v54)
    {
      v63 = a3;
      v55 = (void *)objc_opt_self();
      v56 = v53;
      swift_bridgeObjectRetain();
      for (i = 0; i != v54; ++i)
      {
        v58 = v56[i + 4];
        v59 = swift_bridgeObjectRetain();
        sub_248A84960(v59);
        v60 = (void *)sub_248A9C574();
        swift_bridgeObjectRelease();
        v61 = objc_msgSend(v55, sel_contentTypeForContentDictionary_, v60);

        if (v61)
        {
          if (v61 == (id)2)
          {
            sub_248A85EE8(v58);
          }
          else if (v61 == (id)1)
          {
            sub_248A85774(v58);
          }
        }
        else
        {
          sub_248A85A88(v58);
        }
        swift_bridgeObjectRelease();
      }

      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {

      swift_unknownObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {

    return swift_unknownObjectRelease();
  }
}

uint64_t sub_248A855E0(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  sub_248A87828(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    for (i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE860);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE648);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_248A87828(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_248A87828((_QWORD *)(v5 > 1), v6 + 1, 1);
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

uint64_t sub_248A8572C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A85774(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;

  v2 = sub_248A9C5C8();
  if (!*(_QWORD *)(a1 + 16) || (v4 = sub_248A86858(v2, v3), (v5 & 1) == 0))
  {
    v32 = 0u;
    v33 = 0u;
    swift_bridgeObjectRelease();
    return sub_248A71634((uint64_t)&v32, (uint64_t *)&unk_25446CD50);
  }
  sub_248A71670(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)&v32);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v33 + 1))
    return sub_248A71634((uint64_t)&v32, (uint64_t *)&unk_25446CD50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE878);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v7 = *(int *)(type metadata accessor for TipBodyTextBuilder() + 40);
    v8 = *(_QWORD *)(v30 + v7);
    if (*(_QWORD *)(v8 + 16))
    {
      swift_bridgeObjectRetain();
      sub_248A9C1A8();
      v9 = sub_248A9C388();
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v16 = v12 & 1;
      swift_bridgeObjectRetain();
      sub_248A71614(v9, v11, v16);
      swift_bridgeObjectRetain();
      v17 = (char *)v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v17 = sub_248A75438(0, *(_QWORD *)(v8 + 16) + 1, 1, (char *)v8);
      v19 = *((_QWORD *)v17 + 2);
      v18 = *((_QWORD *)v17 + 3);
      v20 = v19 + 1;
      if (v19 >= v18 >> 1)
      {
        v29 = sub_248A75438((char *)(v18 > 1), v19 + 1, 1, v17);
        v20 = v19 + 1;
        v17 = v29;
      }
      *((_QWORD *)v17 + 2) = v20;
      v21 = &v17[32 * v19];
      *((_QWORD *)v21 + 4) = v9;
      *((_QWORD *)v21 + 5) = v11;
      v21[48] = v13 & 1;
      *((_QWORD *)v21 + 7) = v15;
      sub_248A71624(v9, v11, v13 & 1);
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v30 + v7) = v17;
    }
    v22 = *(_QWORD *)(v31 + 16);
    if (v22)
    {
      v23 = (void *)objc_opt_self();
      swift_bridgeObjectRetain();
      for (i = 0; i != v22; ++i)
      {
        v25 = *(_QWORD *)(v31 + 8 * i + 32);
        v26 = swift_bridgeObjectRetain();
        sub_248A84960(v26);
        v27 = (void *)sub_248A9C574();
        swift_bridgeObjectRelease();
        v28 = objc_msgSend(v23, sel_contentTypeForContentDictionary_, v27);

        if (v28)
        {
          if (v28 == (id)2)
          {
            sub_248A85EE8(v25);
          }
          else if (v28 == (id)1)
          {
            sub_248A85774(v25);
          }
        }
        else
        {
          sub_248A85A88(v25);
        }
        swift_bridgeObjectRelease();
      }
      return swift_bridgeObjectRelease_n();
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_248A85A88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;

  v2 = v1;
  v4 = (void *)objc_opt_self();
  sub_248A84960(a1);
  v5 = (void *)sub_248A9C574();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_textForContentNode_, v5);

  if (v6)
  {
    v7 = sub_248A9C5C8();
    v9 = v8;

    v10 = sub_248A9C5C8();
    v60 = v2;
    if (*(_QWORD *)(a1 + 16) && (v12 = sub_248A86858(v10, v11), (v13 & 1) != 0))
    {
      sub_248A71670(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)&v62);
      swift_bridgeObjectRelease();
      if (*((_QWORD *)&v63 + 1))
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE878);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v59 = type metadata accessor for TipBodyTextBuilder();
          v57 = *(int *)(v59 + 40);
          v14 = *(_QWORD *)(v2 + v57);
          *(_QWORD *)&v62 = v7;
          *((_QWORD *)&v62 + 1) = v9;
          sub_248A7D434();
          swift_bridgeObjectRetain();
          v15 = sub_248A9C394();
          v17 = v16;
          v19 = v18 & 1;
          v21 = sub_248A70A3C(v61, v15, v16, v18 & 1, v20);
          v23 = v22;
          v25 = v24;
          v27 = v26;
          swift_bridgeObjectRelease();
          v28 = v19;
          v29 = v27;
          sub_248A71624(v15, v17, v28);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
          sub_248A71614(v21, v23, v25 & 1);
          swift_bridgeObjectRetain();
          v30 = (char *)v14;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v30 = sub_248A75438(0, *(_QWORD *)(v14 + 16) + 1, 1, (char *)v14);
          v32 = *((_QWORD *)v30 + 2);
          v31 = *((_QWORD *)v30 + 3);
          if (v32 >= v31 >> 1)
            v30 = sub_248A75438((char *)(v31 > 1), v32 + 1, 1, v30);
          v33 = v2;
          *((_QWORD *)v30 + 2) = v32 + 1;
          v34 = &v30[32 * v32];
          *((_QWORD *)v34 + 4) = v21;
          *((_QWORD *)v34 + 5) = v23;
          v34[48] = v25 & 1;
          *((_QWORD *)v34 + 7) = v29;
          sub_248A71624(v21, v23, v25 & 1);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v35 = v57;
LABEL_18:
          *(_QWORD *)(v33 + v35) = v30;
          type metadata accessor for TipBodyTextBuilder();
          v54 = (_QWORD *)(v33 + *(int *)(v59 + 36));
          v55 = v54[1];
          *(_QWORD *)&v62 = *v54;
          *((_QWORD *)&v62 + 1) = v55;
          swift_bridgeObjectRetain();
          sub_248A9C5F8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v56 = *((_QWORD *)&v62 + 1);
          *v54 = v62;
          v54[1] = v56;
          return;
        }
LABEL_13:
        v36 = type metadata accessor for TipBodyTextBuilder();
        v58 = *(int *)(v36 + 40);
        v59 = v36;
        v37 = *(_QWORD *)(v2 + v58);
        *(_QWORD *)&v62 = v7;
        *((_QWORD *)&v62 + 1) = v9;
        sub_248A7D434();
        swift_bridgeObjectRetain();
        v38 = sub_248A9C394();
        v40 = v39;
        v42 = v41 & 1;
        v43 = sub_248A7085C();
        v45 = v44;
        v47 = v46;
        v49 = v48;
        v50 = v46 & 1;
        sub_248A71624(v38, v40, v42);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        sub_248A71614(v43, v45, v50);
        swift_bridgeObjectRetain();
        v30 = (char *)v37;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v30 = sub_248A75438(0, *(_QWORD *)(v37 + 16) + 1, 1, (char *)v37);
        v52 = *((_QWORD *)v30 + 2);
        v51 = *((_QWORD *)v30 + 3);
        if (v52 >= v51 >> 1)
          v30 = sub_248A75438((char *)(v51 > 1), v52 + 1, 1, v30);
        *((_QWORD *)v30 + 2) = v52 + 1;
        v53 = &v30[32 * v52];
        *((_QWORD *)v53 + 4) = v43;
        *((_QWORD *)v53 + 5) = v45;
        v53[48] = v47 & 1;
        *((_QWORD *)v53 + 7) = v49;
        sub_248A71624(v43, v45, v47 & 1);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v33 = v60;
        v35 = v58;
        goto LABEL_18;
      }
    }
    else
    {
      v62 = 0u;
      v63 = 0u;
      swift_bridgeObjectRelease();
    }
    sub_248A71634((uint64_t)&v62, (uint64_t *)&unk_25446CD50);
    goto LABEL_13;
  }
}

uint64_t sub_248A85EE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;

  v2 = v1;
  v4 = sub_248A9C5C8();
  if (!*(_QWORD *)(a1 + 16) || (v6 = sub_248A86858(v4, v5), (v7 & 1) == 0))
  {
    v39 = 0u;
    v40 = 0u;
    goto LABEL_9;
  }
  sub_248A71670(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v39);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v40 + 1))
    return sub_248A71634((uint64_t)&v39, (uint64_t *)&unk_25446CD50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE648);
  result = swift_dynamicCast();
  if ((result & 1) == 0)
    return result;
  v9 = sub_248A9C5C8();
  if (*(_QWORD *)(v37 + 16) && (v11 = sub_248A86858(v9, v10), (v12 & 1) != 0))
  {
    sub_248A71670(*(_QWORD *)(v37 + 56) + 32 * v11, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v40 + 1))
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return sub_248A71634((uint64_t)&v39, (uint64_t *)&unk_25446CD50);
  }
  if ((swift_dynamicCast() & 1) == 0)
    return swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13 = sub_248A703A0(v37, v38, v37);
  if (v16)
  {
    v17 = v13;
    v18 = v14;
    v19 = v15;
    v20 = v16;
    v21 = v15 & 1;
    v36 = *(int *)(type metadata accessor for TipBodyTextBuilder() + 40);
    v22 = *(_QWORD *)(v2 + v36);
    sub_248A71614(v17, v18, v21);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v23 = (char *)v22;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v23 = sub_248A75438(0, *(_QWORD *)(v22 + 16) + 1, 1, (char *)v22);
    v25 = *((_QWORD *)v23 + 2);
    v24 = *((_QWORD *)v23 + 3);
    v26 = v25 + 1;
    if (v25 >= v24 >> 1)
    {
      v35 = sub_248A75438((char *)(v24 > 1), v25 + 1, 1, v23);
      v26 = v25 + 1;
      v23 = v35;
    }
    *((_QWORD *)v23 + 2) = v26;
    v27 = &v23[32 * v25];
    *((_QWORD *)v27 + 4) = v17;
    *((_QWORD *)v27 + 5) = v18;
    v27[48] = v19 & 1;
    *((_QWORD *)v27 + 7) = v20;
    sub_248A71624(v17, v18, v19 & 1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v2 + v36) = v23;
  }
  v28 = sub_248A9C5C8();
  if (*(_QWORD *)(v37 + 16) && (v30 = sub_248A86858(v28, v29), (v31 & 1) != 0))
  {
    sub_248A71670(*(_QWORD *)(v37 + 56) + 32 * v30, (uint64_t)&v39);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v40 + 1))
    return sub_248A71634((uint64_t)&v39, (uint64_t *)&unk_25446CD50);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v32 = (_QWORD *)(v2 + *(int *)(type metadata accessor for TipBodyTextBuilder() + 36));
    v33 = v32[1];
    *(_QWORD *)&v39 = *v32;
    *((_QWORD *)&v39 + 1) = v33;
    swift_bridgeObjectRetain();
    sub_248A9C5F8();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v34 = *((_QWORD *)&v39 + 1);
    *v32 = v39;
    v32[1] = v34;
  }
  return result;
}

double sub_248A86228@<D0>(_OWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char v68;
  _QWORD *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char v80;
  uint64_t v81;
  double result;
  __int128 v83;
  char v84;
  _OWORD *v85;
  _BYTE v86[4];
  int v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _OWORD *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  __int128 v105;
  __int128 v106;
  char v107;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v86[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_248A9C334();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v86[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = type metadata accessor for TipBodyTextBuilder();
  v11 = v10;
  v12 = *(_QWORD *)(v1 + *(int *)(v10 + 40));
  v13 = *(_QWORD *)(v12 + 16);
  v95 = a1;
  if (v13)
  {
    *(_QWORD *)&v105 = 0;
    *((_QWORD *)&v105 + 1) = 0xE000000000000000;
    v14 = sub_248A7D434();
    swift_bridgeObjectRetain();
    v16 = sub_248A9C394();
    v18 = v17;
    v20 = v19;
    v21 = v15 & 1;
    v22 = *(_QWORD *)(v12 + 16);
    if (v22)
    {
      v87 = v15;
      v89 = v14;
      v93 = v11;
      v94 = v1;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_248A71614(v16, v18, v21);
      v88 = v12;
      v23 = v12 + 56;
      v92 = v20;
      v24 = v20;
      v91 = v16;
      v25 = v16;
      v90 = v18;
      v26 = v21;
      v27 = v18;
      do
      {
        v99 = v22;
        v97 = v27;
        v96 = v25;
        v98 = v24;
        v28 = *(_QWORD *)(v23 - 24);
        v29 = *(_QWORD *)(v23 - 16);
        v30 = *(_BYTE *)(v23 - 8);
        v23 += 32;
        sub_248A71614(v28, v29, v30);
        swift_bridgeObjectRetain();
        v31 = v26 & 1;
        v32 = v99;
        v25 = sub_248A9C364();
        v27 = v33;
        v26 = v34 & 1;
        v35 = v29;
        v24 = v36;
        sub_248A71624(v28, v35, v30);
        swift_bridgeObjectRelease();
        sub_248A71624(v96, v97, v31);
        swift_bridgeObjectRelease();
        v22 = v32 - 1;
      }
      while (v22);
      swift_bridgeObjectRelease();
      sub_248A71624(v91, v90, v87 & 1);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v16 = v25;
      v18 = v27;
      v1 = v94;
      v11 = v93;
    }
    else
    {
      v26 = v15 & 1;
      swift_bridgeObjectRelease();
    }
    v41 = (_QWORD *)(v1 + *(int *)(v11 + 36));
    v42 = v41[1];
    *(_QWORD *)&v105 = *v41;
    *((_QWORD *)&v105 + 1) = v42;
    swift_bridgeObjectRetain();
    v43 = sub_248A9C394();
    v45 = v44;
    v47 = v46 & 1;
    v48 = sub_248A9C358();
    v98 = v50;
    v99 = v49;
    v52 = v51 & 1;
    sub_248A71624(v43, v45, v47);
    swift_bridgeObjectRelease();
    sub_248A71624(v16, v18, v26);
    swift_bridgeObjectRelease();
    v100 = v48;
    v101 = v99;
    v102 = v52;
    v103 = v98;
    v104 = 1;
  }
  else
  {
    v37 = (uint64_t *)(v1 + *(int *)(v10 + 32));
    v38 = v37[1];
    v94 = v1;
    v93 = v10;
    if (v38)
    {
      v39 = *v37;
      v40 = v38;
    }
    else
    {
      v39 = 0;
      v40 = 0xE000000000000000;
    }
    *(_QWORD *)&v105 = v39;
    *((_QWORD *)&v105 + 1) = v40;
    v99 = sub_248A7D434();
    swift_bridgeObjectRetain();
    v53 = sub_248A9C394();
    v55 = v54;
    v57 = v56 & 1;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BDF1860], v6);
    v58 = sub_248A9C2EC();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v5, 1, 1, v58);
    sub_248A9C31C();
    sub_248A71634((uint64_t)v5, (uint64_t *)&unk_2577ADE98);
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
    sub_248A9C2F8();
    sub_248A9C328();
    swift_release();
    v59 = sub_248A9C37C();
    v61 = v60;
    v63 = v62;
    swift_release();
    sub_248A71624(v53, v55, v57);
    swift_bridgeObjectRelease();
    sub_248A9C484();
    v64 = sub_248A9C340();
    v66 = v65;
    v68 = v67;
    swift_release();
    sub_248A71624(v59, v61, v63 & 1);
    swift_bridgeObjectRelease();
    v69 = (_QWORD *)(v94 + *(int *)(v93 + 36));
    v70 = v69[1];
    *(_QWORD *)&v105 = *v69;
    *((_QWORD *)&v105 + 1) = v70;
    swift_bridgeObjectRetain();
    v71 = sub_248A9C394();
    v73 = v72;
    v75 = v74 & 1;
    v76 = sub_248A9C358();
    v98 = v77;
    v99 = v76;
    v79 = v78;
    v81 = v80 & 1;
    sub_248A71624(v71, v73, v75);
    swift_bridgeObjectRelease();
    sub_248A71624(v64, v66, v68 & 1);
    swift_bridgeObjectRelease();
    v100 = v99;
    v101 = v79;
    v102 = v81;
    v103 = v98;
    v104 = 0;
  }
  sub_248A9C274();
  result = *(double *)&v105;
  v83 = v106;
  v84 = v107;
  v85 = v95;
  *v95 = v105;
  v85[1] = v83;
  *((_BYTE *)v85 + 32) = v84;
  return result;
}

unint64_t sub_248A8681C()
{
  unint64_t result;

  result = qword_2577AE870;
  if (!qword_2577AE870)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577AE870);
  }
  return result;
}

unint64_t sub_248A86858(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_248A9C82C();
  sub_248A9C5E0();
  v4 = sub_248A9C844();
  return sub_248A8693C(a1, a2, v4);
}

unint64_t sub_248A868BC(uint64_t a1)
{
  uint64_t v2;

  sub_248A9C5C8();
  sub_248A9C82C();
  sub_248A9C5E0();
  v2 = sub_248A9C844();
  swift_bridgeObjectRelease();
  return sub_248A86A1C(a1, v2);
}

unint64_t sub_248A8693C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_248A9C7FC() & 1) == 0)
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
      while (!v14 && (sub_248A9C7FC() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_248A86A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_248A9C5C8();
    v8 = v7;
    if (v6 == sub_248A9C5C8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_248A9C7FC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_248A9C5C8();
          v15 = v14;
          if (v13 == sub_248A9C5C8() && v15 == v16)
            break;
          v18 = sub_248A9C7FC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_248A86B90(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE068);
  v38 = a2;
  v6 = sub_248A9C7CC();
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
    sub_248A9C82C();
    sub_248A9C5E0();
    result = sub_248A9C844();
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

uint64_t sub_248A86E9C(uint64_t a1, char a2)
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
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  _OWORD *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE050);
  v35 = a2;
  v6 = sub_248A9C7CC();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v34 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v33 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v13 << 6);
      goto LABEL_22;
    }
    v17 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v17 >= v33)
      break;
    v18 = (_QWORD *)(v5 + 64);
    v19 = *(_QWORD *)(v34 + 8 * v17);
    ++v13;
    if (!v19)
    {
      v13 = v17 + 1;
      if (v17 + 1 >= v33)
        goto LABEL_34;
      v19 = *(_QWORD *)(v34 + 8 * v13);
      if (!v19)
      {
        v20 = v17 + 2;
        if (v20 >= v33)
        {
LABEL_34:
          swift_release();
          if ((v35 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v19 = *(_QWORD *)(v34 + 8 * v20);
        if (!v19)
        {
          while (1)
          {
            v13 = v20 + 1;
            if (__OFADD__(v20, 1))
              goto LABEL_43;
            if (v13 >= v33)
              goto LABEL_34;
            v19 = *(_QWORD *)(v34 + 8 * v13);
            ++v20;
            if (v19)
              goto LABEL_21;
          }
        }
        v13 = v20;
      }
    }
LABEL_21:
    v10 = (v19 - 1) & v19;
    v16 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_22:
    v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * v16);
    v22 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v16);
    if ((v35 & 1) != 0)
    {
      sub_248A74E60(v22, v36);
    }
    else
    {
      sub_248A71670((uint64_t)v22, (uint64_t)v36);
      v23 = v21;
    }
    sub_248A9C5C8();
    sub_248A9C82C();
    sub_248A9C5E0();
    v24 = sub_248A9C844();
    result = swift_bridgeObjectRelease();
    v25 = -1 << *(_BYTE *)(v7 + 32);
    v26 = v24 & ~v25;
    v27 = v26 >> 6;
    if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v28 = 0;
      v29 = (unint64_t)(63 - v25) >> 6;
      do
      {
        if (++v27 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v30 = v27 == v29;
        if (v27 == v29)
          v27 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v11 + 8 * v27);
      }
      while (v31 == -1);
      v14 = __clz(__rbit64(~v31)) + (v27 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v14) = v21;
    result = (uint64_t)sub_248A74E60(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v18 = (_QWORD *)(v5 + 64);
  if ((v35 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v18, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v18 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_248A871D4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_248A86858(a2, a3);
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
    sub_248A874B4();
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
  sub_248A86B90(v15, a4 & 1);
  v20 = sub_248A86858(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_248A9C820();
  __break(1u);
}

_OWORD *sub_248A87330(_OWORD *a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;
  unint64_t v18;
  char v19;

  v4 = (_QWORD **)v3;
  v7 = (_QWORD *)*v3;
  v9 = sub_248A868BC((uint64_t)a2);
  v10 = v7[2];
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
  }
  else
  {
    v13 = v8;
    v14 = v7[3];
    if (v14 >= v12 && (a3 & 1) != 0)
    {
LABEL_7:
      v15 = *v4;
      if ((v13 & 1) != 0)
      {
LABEL_8:
        v16 = (_OWORD *)(v15[7] + 32 * v9);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
        return sub_248A74E60(a1, v16);
      }
      goto LABEL_11;
    }
    if (v14 >= v12 && (a3 & 1) == 0)
    {
      sub_248A87664();
      goto LABEL_7;
    }
    sub_248A86E9C(v12, a3 & 1);
    v18 = sub_248A868BC((uint64_t)a2);
    if ((v13 & 1) == (v19 & 1))
    {
      v9 = v18;
      v15 = *v4;
      if ((v13 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_248A87450(v9, (uint64_t)a2, a1, v15);
      return a2;
    }
  }
  type metadata accessor for Key(0);
  result = (_OWORD *)sub_248A9C820();
  __break(1u);
  return result;
}

_OWORD *sub_248A87450(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  _OWORD *result;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  *(_QWORD *)(a4[6] + 8 * a1) = a2;
  result = sub_248A74E60(a3, (_OWORD *)(a4[7] + 32 * a1));
  v6 = a4[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a4[2] = v8;
  return result;
}

id sub_248A874B4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE068);
  v2 = *v0;
  v3 = sub_248A9C7C0();
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

id sub_248A87664()
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
  void *v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  _OWORD v22[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE050);
  v2 = *v0;
  v3 = sub_248A9C7C0();
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
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 32 * v15;
    sub_248A71670(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v22);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    sub_248A74E60(v22, (_OWORD *)(*(_QWORD *)(v4 + 56) + v18));
    result = v17;
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_248A87828(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_248A87844(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_248A87844(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE888);
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
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4])
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE648);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

BOOL TPKContentControllerDismissalReason.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

unint64_t sub_248A8798C()
{
  unint64_t result;

  result = qword_2577AE890;
  if (!qword_2577AE890)
  {
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TPKContentControllerDismissalReason, &type metadata for TPKContentControllerDismissalReason);
    atomic_store(result, (unint64_t *)&qword_2577AE890);
  }
  return result;
}

uint64_t sub_248A879D0()
{
  sub_248A9C82C();
  sub_248A9C838();
  return sub_248A9C844();
}

uint64_t sub_248A87A14()
{
  return sub_248A9C838();
}

uint64_t sub_248A87A3C()
{
  sub_248A9C82C();
  sub_248A9C838();
  return sub_248A9C844();
}

_QWORD *sub_248A87A7C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2;

  v2 = *result != 1 && *result != 0;
  *(_QWORD *)a2 = *result == 1;
  *(_BYTE *)(a2 + 8) = v2;
  return result;
}

ValueMetadata *type metadata accessor for TPKContentControllerDismissalReason()
{
  return &type metadata for TPKContentControllerDismissalReason;
}

void destroy for TipBodyImageBuilder(id *a1)
{

  swift_release();
  swift_unknownObjectWeakDestroy();

}

uint64_t initializeWithCopy for TipBodyImageBuilder(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v6 = v4;
  swift_retain();
  swift_unknownObjectWeakCopyInit();
  v7 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = v7;
  return a1;
}

uint64_t assignWithCopy for TipBodyImageBuilder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_unknownObjectWeakCopyAssign();
  v7 = *(void **)(a2 + 40);
  v8 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v7;
  v9 = v7;

  return a1;
}

uint64_t initializeWithTake for TipBodyImageBuilder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t assignWithTake for TipBodyImageBuilder(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_unknownObjectWeakTakeAssign();
  v5 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  return a1;
}

uint64_t getEnumTagSinglePayload for TipBodyImageBuilder(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TipBodyImageBuilder(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TipBodyImageBuilder()
{
  return &type metadata for TipBodyImageBuilder;
}

void sub_248A87D40()
{
  uint64_t v0;
  id v1;

  if (*(double *)(v0 + 16) == 0.0 && *(double *)(v0 + 24) == 0.0)
  {
    if (*(_QWORD *)v0)
    {
      v1 = *(id *)v0;
      objc_msgSend(v1, sel_isSymbolImage);
      objc_msgSend(v1, sel_size);
      objc_msgSend(v1, sel_size);

    }
  }
}

void sub_248A87DF4(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  id v10;
  void *v11;
  id v12;
  id v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  *(_QWORD *)a3 = 0;
  swift_unknownObjectWeakInit();
  v10 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_, 6, 15.0);
  *(_QWORD *)(a3 + 40) = v10;
  v11 = *(void **)a3;
  *(_QWORD *)a3 = a1;
  v12 = a1;

  *(double *)(a3 + 16) = a4;
  *(double *)(a3 + 24) = a5;
  *(_QWORD *)(a3 + 8) = a2;
  if (a1)
  {
    v13 = v12;
    swift_retain();
    if (objc_msgSend(v13, sel_isSymbolImage))
    {
      objc_msgSend(v13, sel_size);
      v15 = v14;
      objc_msgSend(v13, sel_size);
      *(_QWORD *)(a3 + 16) = 0x4046800000000000;
      *(double *)(a3 + 24) = 45.0 / (v15 / v16);
      v17 = objc_msgSend(v13, sel_imageWithConfiguration_, v10);

      if (v17)
      {
        sub_248A716AC();
        swift_retain();
        v18 = v17;
        v19 = (void *)sub_248A9C6E8();
        v20 = objc_msgSend(v18, sel_imageWithTintColor_renderingMode_, v19, 2);

        swift_release();
        *(_QWORD *)a3 = v20;
      }
      else
      {

        swift_release();
        *(_QWORD *)a3 = 0;
      }
    }
    else
    {

      swift_release();
    }
  }
}

void sub_248A87FCC(void *a1)
{
  id *v1;
  id v3;
  double v4;
  double v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  swift_unknownObjectWeakAssign();
  if (*v1)
  {
    v3 = *v1;
    if (objc_msgSend(v3, sel_isSymbolImage))
    {
      sub_248A87D40();
      objc_msgSend(a1, sel_setFrame_, 0.0, 0.0, v4, v5);
      sub_248A716AC();
      swift_retain();
      v6 = (void *)sub_248A9C6E8();
      objc_msgSend(a1, sel_setTintColor_, v6);

      objc_msgSend(a1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(a1, sel_setContentMode_, 1);
      v7 = v1[5];
      v8 = objc_msgSend(v3, sel_imageWithConfiguration_, v7);

      swift_retain();
      v10 = v8;
      v9 = (void *)sub_248A9C6E8();
      v3 = objc_msgSend(v10, sel_imageWithTintColor_renderingMode_, v9, 2);

      objc_msgSend(a1, sel_setImage_, v3);
    }
    else
    {
      v10 = v3;
    }

  }
}

void sub_248A8817C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  unsigned __int8 *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;

  if (a1)
  {
    swift_retain();
    swift_release();
    *(_QWORD *)(v1 + 8) = a1;
  }
  v3 = v1 + 32;
  v4 = (void *)MEMORY[0x2495A3F58](v1 + 32);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_image);

    if (v6)
    {
      if (objc_msgSend(v6, sel_isSymbolImage)
        && (v7 = (unsigned __int8 *)MEMORY[0x2495A3F58](v1 + 32)) != 0
        && (v8 = v7[OBJC_IVAR___TipImageProxy_shouldDisplay], v7, v8 == 1))
      {
        sub_248A716AC();
        swift_retain();
        v15 = sub_248A9C6E8();
        v9 = (void *)MEMORY[0x2495A3F58](v3);
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, sel_setTintColor_, v15);

        }
        v11 = MEMORY[0x2495A3F58](v3);
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(v6, sel_imageWithTintColor_renderingMode_, v15, 2);
          objc_msgSend(v12, sel_setImage_, v13);

        }
        v14 = (void *)v15;
      }
      else
      {
        v14 = v6;
      }

    }
  }
}

double sub_248A882E8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unsigned __int8 *v4;
  int v5;
  void *v6;
  id v7;
  double result;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  char v13;
  char v14;
  _OWORD v15[4];
  uint64_t v16;
  char v17;
  char v18;

  v3 = a1 + 32;
  v4 = (unsigned __int8 *)MEMORY[0x2495A3F58](a1 + 32);
  if (v4 && (v5 = v4[OBJC_IVAR___TipImageProxy_shouldDisplay], v4, v5 == 1))
  {
    v6 = (void *)MEMORY[0x2495A3F58](v3);
    if (v6)
    {
      v7 = v6;
      sub_248A87D40();
      sub_248A87D40();
      sub_248A9C544();
      sub_248A9C070();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE8B8);
      sub_248A8877C();
      sub_248A9C274();

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE8B8);
      sub_248A8877C();
      sub_248A9C274();
    }
  }
  else
  {
    sub_248A8854C((uint64_t)v15);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE898);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE8A0);
  sub_248A88848((unint64_t *)&qword_2577AE8A8, &qword_2577AE898, sub_248A8877C);
  sub_248A88848((unint64_t *)&qword_2577AE8C8, &qword_2577AE8A0, sub_248A888B4);
  sub_248A9C274();
  result = *(double *)v15;
  v9 = v15[1];
  v10 = v15[2];
  v11 = v15[3];
  v12 = v16;
  v13 = v17;
  v14 = v18;
  *(_OWORD *)a2 = v15[0];
  *(_OWORD *)(a2 + 16) = v9;
  *(_OWORD *)(a2 + 32) = v10;
  *(_OWORD *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 64) = v12;
  *(_BYTE *)(a2 + 72) = v13;
  *(_BYTE *)(a2 + 73) = v14;
  return result;
}

double sub_248A8854C@<D0>(uint64_t a1@<X8>)
{
  id *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  double result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  _QWORD v15[4];
  __int128 v16;
  _QWORD v17[3];
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  unsigned __int8 v28;
  __int128 v29;

  v3 = sub_248A9C4C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*v1)
  {
    v7 = *v1;
    sub_248A9C4A8();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF3FD0], v3);
    v8 = sub_248A9C4E4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_248A87D40();
    sub_248A87D40();
    sub_248A9C544();
    sub_248A9C070();
    v15[0] = v8;
    *(_OWORD *)&v15[1] = xmmword_248A9EF60;
    v15[3] = v25;
    *(_QWORD *)&v16 = v26;
    *((_QWORD *)&v16 + 1) = v27;
    v17[0] = v28;
    *(_OWORD *)&v17[1] = v29;
    v18 = 0;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE8D8);
    sub_248A888B4();
    sub_248A9C274();
    swift_release();

  }
  else
  {
    v16 = 0u;
    memset(v17, 0, sizeof(v17));
    memset(v15, 0, sizeof(v15));
    v18 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE8D8);
    sub_248A888B4();
    sub_248A9C274();
  }
  result = *(double *)&v19;
  v10 = v20;
  v11 = v21;
  v12 = v22;
  v13 = v23;
  v14 = v24;
  *(_OWORD *)a1 = v19;
  *(_OWORD *)(a1 + 16) = v10;
  *(_OWORD *)(a1 + 32) = v11;
  *(_OWORD *)(a1 + 48) = v12;
  *(_QWORD *)(a1 + 64) = v13;
  *(_BYTE *)(a1 + 72) = v14;
  return result;
}

uint64_t sub_248A8877C()
{
  return sub_248A88798(&qword_2577AE8B0, &qword_2577AE8B8, (uint64_t (*)(void))sub_248A88804);
}

uint64_t sub_248A88798(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_248A88804()
{
  unint64_t result;

  result = qword_2577AE8C0;
  if (!qword_2577AE8C0)
  {
    result = MEMORY[0x2495A3E38](&unk_248A9F7F4, &type metadata for TipProxyContainer);
    atomic_store(result, (unint64_t *)&qword_2577AE8C0);
  }
  return result;
}

uint64_t sub_248A88848(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248A888B4()
{
  return sub_248A88798(&qword_2577AE8D0, &qword_2577AE8D8, (uint64_t (*)(void))sub_248A888D0);
}

unint64_t sub_248A888D0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE8E0;
  if (!qword_2577AE8E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE8E8);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEEC40];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE8E0);
  }
  return result;
}

void sub_248A889F4()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___TPKBaseContentView_hostingView), sel_superview);

  if (v2)
    objc_msgSend(*(id *)(v0 + v1), sel_removeFromSuperview);
  sub_248A88BB0();
}

id sub_248A88AD8(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(_QWORD *)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = a1;
  v3 = a1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR___TPKBaseContentView_hostingView), sel_setBackgroundColor_, v3);
}

void sub_248A88BB0()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;

  v1 = *(void **)&v0[OBJC_IVAR___TPKBaseContentView_hostingView];
  if (v1)
  {
    v2 = v0;
    v18 = v1;
    v3 = objc_msgSend(v18, sel_superview);

    if (v3)
    {

    }
    else
    {
      objc_msgSend(v2, sel_addSubview_, v18);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_248A9E8B0;
      v5 = objc_msgSend(v18, sel_leadingAnchor);
      v6 = objc_msgSend(v2, sel_leadingAnchor);
      v7 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v6);

      *(_QWORD *)(v4 + 32) = v7;
      v8 = objc_msgSend(v18, sel_topAnchor);
      v9 = objc_msgSend(v2, sel_topAnchor);
      v10 = objc_msgSend(v8, sel_constraintEqualToAnchor_, v9);

      *(_QWORD *)(v4 + 40) = v10;
      v11 = objc_msgSend(v2, sel_trailingAnchor);
      v12 = objc_msgSend(v18, sel_trailingAnchor);
      v13 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v12);

      *(_QWORD *)(v4 + 48) = v13;
      v14 = objc_msgSend(v2, sel_bottomAnchor);
      v15 = objc_msgSend(v18, sel_bottomAnchor);
      v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

      *(_QWORD *)(v4 + 56) = v16;
      sub_248A9C694();
      sub_248A798FC();
      v17 = (void *)sub_248A9C67C();
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_addConstraints_, v17);

    }
  }
}

_QWORD *TPKTipContentPlainView.__allocating_init(controller:content:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return TPKContentView.init(controller:content:)(a1, a2);
}

id TPKTipContentPlainView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentPlainView.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentPlainView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

uint64_t type metadata accessor for TPKTipContentPlainView()
{
  return objc_opt_self();
}

id TPKTipContentPlainView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentPlainView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TPKTipContentPlainView()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for TPKContentState()
{
  return &type metadata for TPKContentState;
}

uint64_t sub_248A890C4(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000028;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0xD00000000000001BLL;
      break;
    case 2:
      result = 0xD000000000000014;
      break;
    case 3:
      result = 0x726F467964616572;
      break;
    case 4:
      result = 0x6979616C70736964;
      break;
    case 5:
      result = 0x7373696D736964;
      break;
    default:
      result = sub_248A9C808();
      __break(1u);
      break;
  }
  return result;
}

unint64_t sub_248A891C0@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_248A893C8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_248A891F0()
{
  uint64_t *v0;

  return sub_248A890C4(*v0);
}

unint64_t sub_248A891FC()
{
  unint64_t result;

  result = qword_2577AE918;
  if (!qword_2577AE918)
  {
    result = MEMORY[0x2495A3E38](&unk_248A9F070, &type metadata for TPKContentState);
    atomic_store(result, (unint64_t *)&qword_2577AE918);
  }
  return result;
}

uint64_t sub_248A89240(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(v1, sel_restartTrackingTriggerEventMap);
    if (v2)
    {
      v3 = v2;
      sub_248A89508();
      v4 = sub_248A9C58C();

      v5 = *(_QWORD *)(v4 + 16);
      swift_bridgeObjectRelease();
      if (v5)
      {

        return 0;
      }
    }
    else
    {

    }
    v7 = v1;
    v8 = objc_msgSend(v7, sel_initialDisplayEventMap);
    if (v8)
    {
      v9 = v8;
      sub_248A89508();
      v10 = sub_248A9C58C();

      v11 = *(_QWORD *)(v10 + 16);
      swift_bridgeObjectRelease();
      if (v11)
      {

        return 1;
      }
    }
    else
    {

    }
    v12 = v7;
    v13 = objc_msgSend(v12, sel_displayEventMap);
    if (v13)
    {
      v14 = v13;
      sub_248A89508();
      v15 = sub_248A9C58C();

      v16 = *(_QWORD *)(v15 + 16);
      swift_bridgeObjectRelease();
      if (v16)
        return 2;
    }
    else
    {

    }
  }
  return 3;
}

unint64_t sub_248A893C8(unint64_t result)
{
  if (result > 5)
    return 0;
  return result;
}

uint64_t sub_248A893D8(uint64_t a1, uint64_t a2, id a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a1 == 4)
  {
    if (a3)
    {
      v5 = objc_msgSend(a3, sel_displayEventMap);
      if (!v5)
      {
LABEL_11:

        return 3;
      }
      v6 = v5;
      sub_248A89508();
      v7 = sub_248A9C58C();

      v8 = *(_QWORD *)(v7 + 16);
      swift_bridgeObjectRelease();
      if (v8)
        return 2;
    }
    return 3;
  }
  v4 = a1;
  if (a1 == 3)
  {
    if (!a2)
    {
      if (!a3)
        return 3;
      v9 = objc_msgSend(a3, sel_restartTrackingTriggerEventMap);
      if (v9)
        goto LABEL_19;
    }
    goto LABEL_11;
  }
  if (a1 != 1)
  {

    return v4;
  }
  if (!a2)
  {
    if (!a3)
      return 1;
    v9 = objc_msgSend(a3, sel_restartTrackingTriggerEventMap);
    if (v9)
    {
LABEL_19:

      return 0;
    }
  }

  return 1;
}

unint64_t sub_248A89508()
{
  unint64_t result;

  result = qword_25446CD00;
  if (!qword_25446CD00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25446CD00);
  }
  return result;
}

ValueMetadata *type metadata accessor for Close()
{
  return &type metadata for Close;
}

ValueMetadata *type metadata accessor for Move()
{
  return &type metadata for Move;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for Arc(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Arc(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for Arc()
{
  return &type metadata for Arc;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Line(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Line(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Line()
{
  return &type metadata for Line;
}

id sub_248A896A0(void *a1)
{
  return objc_msgSend(a1, sel_closePath);
}

id sub_248A896AC(void *a1)
{
  double *v1;

  return objc_msgSend(a1, sel_moveToPoint_, *v1, v1[1]);
}

id sub_248A896BC(id a1)
{
  uint64_t v1;
  double v3;
  int v4;
  double v5;
  double v6;
  double v7;

  v3 = *(double *)(v1 + 16);
  v4 = *(unsigned __int8 *)(v1 + 24);
  if ((*(_BYTE *)(v1 + 8) & 1) != 0)
  {
    objc_msgSend(a1, sel_currentPoint);
    v6 = v5;
    if (!v4)
      return objc_msgSend(a1, sel_addLineToPoint_, v6, v3);
    goto LABEL_5;
  }
  v6 = *(double *)v1;
  if (*(_BYTE *)(v1 + 24))
  {
LABEL_5:
    objc_msgSend(a1, sel_currentPoint);
    v3 = v7;
  }
  return objc_msgSend(a1, sel_addLineToPoint_, v6, v3);
}

id sub_248A89740(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_addArcWithCenter_radius_startAngle_endAngle_clockwise_, *(unsigned __int8 *)(v1 + 40), *(double *)v1, *(double *)(v1 + 8), *(double *)(v1 + 16), *(double *)(v1 + 24), *(double *)(v1 + 32));
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

uint64_t getEnumTagSinglePayload for Curve(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Curve(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 48) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Curve()
{
  return &type metadata for Curve;
}

id sub_248A897D8(void *a1)
{
  double *v1;

  return objc_msgSend(a1, sel_addCurveToPoint_controlPoint1_controlPoint2_, *v1, v1[1], v1[2], v1[3], v1[4], v1[5]);
}

unint64_t TPKContentControllerState.init(rawValue:)(unint64_t a1)
{
  return sub_248A8983C(a1);
}

unint64_t sub_248A8980C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_248A8983C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_248A8983C(unint64_t result)
{
  if (result > 7)
    return 0;
  return result;
}

unint64_t sub_248A89850()
{
  unint64_t result;

  result = qword_2577AE920;
  if (!qword_2577AE920)
  {
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TPKContentControllerState, &type metadata for TPKContentControllerState);
    atomic_store(result, (unint64_t *)&qword_2577AE920);
  }
  return result;
}

ValueMetadata *type metadata accessor for TPKContentControllerState()
{
  return &type metadata for TPKContentControllerState;
}

uint64_t sub_248A898A4(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE930);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE938);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE940);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v13, a1, v4);
    *(_QWORD *)&v13[*(int *)(v11 + 36)] = a2;
    sub_248A89E8C((uint64_t)v13, (uint64_t)v10);
    swift_storeEnumTagMultiPayload();
    sub_248A7F034(&qword_2577AE948, &qword_2577AE940, (uint64_t)&unk_248A9F368);
    sub_248A7F034(qword_2577AE950, &qword_2577AE930, MEMORY[0x24BDEFB78]);
    v14 = a2;
    sub_248A9C274();
    return sub_248A89ED4((uint64_t)v13);
  }
  else
  {
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    v16(v7, a1, v4);
    v16(v10, (uint64_t)v7, v4);
    swift_storeEnumTagMultiPayload();
    sub_248A7F034(&qword_2577AE948, &qword_2577AE940, (uint64_t)&unk_248A9F368);
    sub_248A7F034(qword_2577AE950, &qword_2577AE930, MEMORY[0x24BDEFB78]);
    sub_248A9C274();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id sub_248A89AE4(uint64_t a1, uint64_t a2)
{
  return sub_248A8A558(a2);
}

id sub_248A89AEC(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_248A8A660(a1, a3);
}

uint64_t sub_248A89B04()
{
  return sub_248A9C1F0();
}

uint64_t sub_248A89B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2495A3E38](&unk_248A9F2D8, a3);
  return sub_248A9C250();
}

uint64_t sub_248A89BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x2495A3E38](&unk_248A9F2D8, a3);
  return sub_248A9C1FC();
}

void sub_248A89BFC(uint64_t a1)
{
  MEMORY[0x2495A3E38](&unk_248A9F2D8, a1);
  sub_248A9C244();
  __break(1u);
}

uint64_t sub_248A89C34()
{
  return sub_248A9C064();
}

uint64_t sub_248A89C4C(uint64_t a1)
{
  void **v1;

  return sub_248A898A4(a1, *v1);
}

uint64_t View.visualEffect(effect:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  v4 = a1;
  return MEMORY[0x2495A3460](&v4, a2, &type metadata for VisualEffectModifier, a3);
}

uint64_t sub_248A89C84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_248A9C0B8();
  v4[0] = v1;
  v4[1] = sub_248A89CD8();
  return MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_248A89CD8()
{
  unint64_t result;

  result = qword_2577AE928;
  if (!qword_2577AE928)
  {
    result = MEMORY[0x2495A3E38](&unk_248A9F258, &type metadata for VisualEffectModifier);
    atomic_store(result, (unint64_t *)&qword_2577AE928);
  }
  return result;
}

void **initializeBufferWithCopyOfBuffer for VisualEffectModifier(void **a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for VisualEffectModifier(id *a1)
{

}

void **assignWithCopy for VisualEffectModifier(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *a1;
  v4 = *a2;
  *a1 = *a2;
  v5 = v4;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for VisualEffectModifier(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for VisualEffectModifier(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for VisualEffectModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for VisualEffectModifier()
{
  return &type metadata for VisualEffectModifier;
}

uint64_t sub_248A89E7C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248A89E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A89ED4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE940);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248A89F14()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_248A89F1C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_248A89F94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  void *v10;
  id v11;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = *(void **)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = v10;
    v11 = v10;
  }
  return v4;
}

void sub_248A8A048(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();

}

uint64_t sub_248A8A088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  *v7 = v8;
  v9 = v8;
  return a1;
}

uint64_t sub_248A8A0E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;
  void *v9;
  id v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);
  v9 = *v7;
  *v7 = v8;
  v10 = v8;

  return a1;
}

uint64_t sub_248A8A150(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_248A8A1AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void **v7;
  void *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (void **)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = *v7;
  *v7 = *(void **)((v6 + a2) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_248A8A210(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_248A8A28C + 4 * byte_248A9F230[v10]))();
  }
}

void sub_248A8A310(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_248A8A404()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x248A8A478);
}

void sub_248A8A40C(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x248A8A414);
  JUMPOUT(0x248A8A478);
}

void sub_248A8A454()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x248A8A478);
}

void sub_248A8A45C()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x248A8A478);
}

uint64_t sub_248A8A464(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_WORD *)(v5 + v6) = 0;
  if (!a2)
    JUMPOUT(0x248A8A478);
  if (a3 < 0x7FFFFFFF)
  {
    if ((a2 & 0x80000000) == 0)
      JUMPOUT(0x248A8A474);
    JUMPOUT(0x248A8A470);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v5);
}

uint64_t type metadata accessor for VisualEffectModifier.VisualEffectBridgeView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VisualEffectModifier.VisualEffectBridgeView);
}

unint64_t sub_248A8A4A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE9D8;
  if (!qword_2577AE9D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE9E0);
    v2[0] = sub_248A7F034(&qword_2577AE948, &qword_2577AE940, (uint64_t)&unk_248A9F368);
    v2[1] = sub_248A7F034(qword_2577AE950, &qword_2577AE930, MEMORY[0x24BDEFB78]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE9D8);
  }
  return result;
}

void sub_248A8A53C()
{
  JUMPOUT(0x2495A3E38);
}

uint64_t sub_248A8A54C()
{
  return MEMORY[0x24BDF5560];
}

id sub_248A8A558(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12;

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9C0A0();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (void *)sub_248A9C088();
  objc_msgSend(v8, sel_setAutoresizingMask_, 18);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, *(_QWORD *)(v2 + *(int *)(a1 + 36)));
  v10 = objc_msgSend(v9, sel_contentView);
  objc_msgSend(v10, sel_addSubview_, v8);

  return v9;
}

id sub_248A8A660(void *a1, uint64_t a2)
{
  uint64_t v2;

  return objc_msgSend(a1, sel_setEffect_, *(_QWORD *)(v2 + *(int *)(a2 + 36)));
}

uint64_t TipKitView.init(viewModel:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t TipKitContextIdentifier.getter()
{
  return 0x696669746E656469;
}

id TipKitView.viewModel.getter()
{
  id *v0;
  id v1;
  id v2;

  v1 = *v0;
  v2 = *v0;
  return v1;
}

char *TipKitView.makeUIView(context:)()
{
  void **v0;
  void *v1;
  id v2;
  id v3;

  v1 = *v0;
  v2 = objc_allocWithZone((Class)type metadata accessor for _TipKitViewInternal());
  v3 = v1;
  return sub_248A8A874(v1);
}

uint64_t type metadata accessor for _TipKitViewInternal()
{
  return objc_opt_self();
}

char *sub_248A8A718()
{
  void **v0;
  void *v1;
  id v2;
  id v3;

  v1 = *v0;
  v2 = objc_allocWithZone((Class)type metadata accessor for _TipKitViewInternal());
  v3 = v1;
  return sub_248A8A874(v1);
}

uint64_t sub_248A8A74C()
{
  sub_248A8AD10();
  return sub_248A9C250();
}

uint64_t sub_248A8A79C()
{
  sub_248A8AD10();
  return sub_248A9C1FC();
}

void sub_248A8A7EC()
{
  sub_248A8AD10();
  sub_248A9C244();
  __break(1u);
}

char *sub_248A8A874(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  objc_super v24;

  *(_QWORD *)&v1[OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView] = 0;
  v24.receiver = v1;
  v24.super_class = (Class)type metadata accessor for _TipKitViewInternal();
  v3 = (char *)objc_msgSendSuper2(&v24, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v4 = v3;
  if (a1)
  {
    v5 = a1;
    v6 = sub_248A73624();

  }
  else
  {
    v6 = 0;
  }
  v7 = OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView;
  v8 = *(void **)&v3[OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView];
  *(_QWORD *)&v3[OBJC_IVAR____TtC12TipKitLegacy19_TipKitViewInternal_tipContentView] = v6;

  v9 = *(void **)&v3[v7];
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v10, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addSubview_, v10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_248A9F3C0;
    v12 = v3;
    v13 = objc_msgSend(v10, sel_leadingAnchor);
    v14 = objc_msgSend(v12, sel_leadingAnchor);
    v15 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v14);

    *(_QWORD *)(v11 + 32) = v15;
    v16 = objc_msgSend(v10, sel_trailingAnchor);
    v17 = objc_msgSend(v12, sel_trailingAnchor);
    v18 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v17);

    *(_QWORD *)(v11 + 40) = v18;
    v19 = objc_msgSend(v10, sel_topAnchor);
    v20 = objc_msgSend(v12, sel_topAnchor);
    v21 = objc_msgSend(v19, sel_constraintEqualToAnchor_, v20);

    *(_QWORD *)(v11 + 48) = v21;
    sub_248A9C694();
    sub_248A798FC();
    v22 = (void *)sub_248A9C67C();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_addConstraints_, v22);

  }
  return v3;
}

id _TipKitViewInternal.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void _TipKitViewInternal.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id _TipKitViewInternal.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _TipKitViewInternal();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

ValueMetadata *type metadata accessor for TipKitView()
{
  return &type metadata for TipKitView;
}

uint64_t method lookup function for _TipKitViewInternal()
{
  return swift_lookUpClassMethod();
}

unint64_t sub_248A8AD10()
{
  unint64_t result;

  result = qword_2577AEA18;
  if (!qword_2577AEA18)
  {
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TipKitView, &type metadata for TipKitView);
    atomic_store(result, (unint64_t *)&qword_2577AEA18);
  }
  return result;
}

double sub_248A8AD54(uint64_t a1)
{
  uint64_t v2;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v2 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v2 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = &off_2519C13B8;
  return result;
}

double sub_248A8ADA0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;

  v3 = *v1;
  v4 = v1[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v5 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v5 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = &off_2519C13A0;
  *(_QWORD *)(v5 + 32) = v3;
  *(_QWORD *)(v5 + 40) = v4;
  return result;
}

uint64_t sub_248A8ADFC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *v1;
  v4 = *((_BYTE *)v1 + 8);
  v5 = v1[2];
  v6 = *((_BYTE *)v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v7 + 56) = a1;
  *(_QWORD *)(v7 + 64) = &off_2519C1370;
  v8 = swift_allocObject();
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v8 + 16) = v3;
  *(_BYTE *)(v8 + 24) = v4;
  *(_QWORD *)(v8 + 32) = v5;
  *(_BYTE *)(v8 + 40) = v6;
  return v7;
}

uint64_t sub_248A8AE98()
{
  return swift_deallocObject();
}

uint64_t sub_248A8AEA8(uint64_t a1)
{
  __int128 *v1;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  v8 = v1[1];
  v9 = *v1;
  v3 = *((_QWORD *)v1 + 4);
  v4 = *((_BYTE *)v1 + 40);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = &off_2519C1388;
  v6 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 48) = v3;
  *(_BYTE *)(v6 + 56) = v4;
  return v5;
}

uint64_t sub_248A8AF54()
{
  return swift_deallocObject();
}

uint64_t sub_248A8AF64(uint64_t a1)
{
  __int128 *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;

  v8 = v1[1];
  v9 = *v1;
  v3 = *((_QWORD *)v1 + 4);
  v4 = *((_QWORD *)v1 + 5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v5 + 56) = a1;
  *(_QWORD *)(v5 + 64) = &off_2519C1498;
  v6 = swift_allocObject();
  *(_QWORD *)(v5 + 32) = v6;
  *(_OWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 48) = v3;
  *(_QWORD *)(v6 + 56) = v4;
  return v5;
}

uint64_t sub_248A8B000(uint64_t a1, uint64_t a2)
{
  return sub_248A8B018(a1, a2, (uint64_t)&off_2519C1A70);
}

uint64_t sub_248A8B00C(uint64_t a1, uint64_t a2)
{
  return sub_248A8B018(a1, a2, (uint64_t)&off_2519C1A58);
}

uint64_t sub_248A8B018(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  v15 = v3[1];
  v16 = *v3;
  v13 = v3[3];
  v14 = v3[2];
  v12 = v3[4];
  v6 = *((_QWORD *)v3 + 10);
  v7 = *((_QWORD *)v3 + 11);
  v8 = *((_BYTE *)v3 + 96);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE078);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_248A9E770;
  *(_QWORD *)(v9 + 56) = a1;
  *(_QWORD *)(v9 + 64) = a3;
  v10 = swift_allocObject();
  *(_QWORD *)(v9 + 32) = v10;
  *(_OWORD *)(v10 + 16) = v16;
  *(_OWORD *)(v10 + 32) = v15;
  *(_OWORD *)(v10 + 48) = v14;
  *(_OWORD *)(v10 + 64) = v13;
  *(_OWORD *)(v10 + 80) = v12;
  *(_QWORD *)(v10 + 96) = v6;
  *(_QWORD *)(v10 + 104) = v7;
  *(_BYTE *)(v10 + 112) = v8;
  return v9;
}

uint64_t sub_248A8B0E8()
{
  return swift_deallocObject();
}

double static TPKContentView.defaultMicaSize.getter()
{
  return 64.0;
}

id static TPKContentView.siriIcon(with:)(uint64_t a1)
{
  return objc_msgSend((id)objc_opt_self(), sel_tipKitSiriIconWithTraitCollection_, a1);
}

id static TPKContentView.tipsIcon(with:)()
{
  return objc_msgSend((id)objc_opt_self(), sel_tipsAppHomeScreenIcon);
}

unint64_t TPKContentControllerEvent.init(rawValue:)(unint64_t a1)
{
  return sub_248A8B23C(a1);
}

unint64_t sub_248A8B20C@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_248A8B23C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

unint64_t sub_248A8B23C(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

unint64_t sub_248A8B250()
{
  unint64_t result;

  result = qword_2577AEA20;
  if (!qword_2577AEA20)
  {
    result = MEMORY[0x2495A3E38](&protocol conformance descriptor for TPKContentControllerEvent, &type metadata for TPKContentControllerEvent);
    atomic_store(result, (unint64_t *)&qword_2577AEA20);
  }
  return result;
}

ValueMetadata *type metadata accessor for TPKContentControllerEvent()
{
  return &type metadata for TPKContentControllerEvent;
}

_QWORD *sub_248A8B2A4(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  uint64_t inited;
  uint64_t v12;
  double *v13;
  _QWORD *v14;
  uint64_t v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  double *v27;
  _QWORD *v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  _QWORD *v49;
  CGFloat height;
  CGFloat width;
  double v53;
  CGFloat y;
  double v55;
  CGFloat x;
  CGFloat MaxX;
  double v58;
  _QWORD v59[5];
  _QWORD v60[3];
  uint64_t v61;
  _UNKNOWN **v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v2 = *(unsigned __int8 *)(a1 + 96);
  if (v2 == 1)
  {
    v3 = *(double *)a1;
    v4 = *(double *)(a1 + 8);
    v63 = *(CGRect *)(a1 + 48);
    y = v63.origin.y;
    x = v63.origin.x;
    height = v63.size.height;
    width = v63.size.width;
    v5 = CGRectGetHeight(v63);
    v6 = *(double *)(a1 + 80);
    v7 = v5 - v6;
    v8 = *(double *)(a1 + 32);
    v9 = (v3 + v8) * 0.5;
    v58 = *(double *)(a1 + 40);
    v10 = (v4 + v58) * 0.5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_248A9EDB0;
    *(_QWORD *)(inited + 56) = &type metadata for Move;
    *(_QWORD *)(inited + 64) = &off_2519C13E0;
    *(double *)(inited + 32) = v3;
    *(CGFloat *)(inited + 40) = v7;
    *(_QWORD *)(inited + 96) = &type metadata for Line;
    *(_QWORD *)(inited + 104) = &off_2519C1400;
    v12 = swift_allocObject();
    *(_QWORD *)(inited + 72) = v12;
    *(double *)(v12 + 16) = v3;
    *(_BYTE *)(v12 + 24) = 0;
    *(double *)(v12 + 32) = v4 + 6.0;
    *(_BYTE *)(v12 + 40) = 0;
    *(_QWORD *)(inited + 136) = &type metadata for Curve;
    *(_QWORD *)(inited + 144) = &off_2519C14B0;
    v13 = (double *)swift_allocObject();
    *(_QWORD *)(inited + 112) = v13;
    v13[2] = v9;
    v13[3] = v10;
    v13[4] = v3;
    v13[5] = v4;
    v13[6] = v9;
    v13[7] = v10;
    v14 = sub_248A75538(inited);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v17 = height;
    v16 = width;
    v19 = y;
    v18 = x;
    v61 = v15;
    v62 = &off_2519C0FF0;
    v60[0] = v14;
  }
  else
  {
    v20 = *(double *)(a1 + 80);
    v21 = *(double *)(a1 + 8);
    v22 = *(double *)a1 + -6.0;
    v23 = *(double *)a1 + 2.5;
    v24 = *(double *)a1 + 0.5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v25 = swift_initStackObject();
    *(_OWORD *)(v25 + 16) = xmmword_248A9EDB0;
    *(_QWORD *)(v25 + 56) = &type metadata for Move;
    *(_QWORD *)(v25 + 64) = &off_2519C13E0;
    *(double *)(v25 + 32) = v20;
    *(double *)(v25 + 40) = v21;
    *(_QWORD *)(v25 + 96) = &type metadata for Line;
    *(_QWORD *)(v25 + 104) = &off_2519C1400;
    v26 = swift_allocObject();
    *(_QWORD *)(v25 + 72) = v26;
    *(double *)(v26 + 16) = v22;
    *(_BYTE *)(v26 + 24) = 0;
    *(double *)(v26 + 32) = v21;
    *(_BYTE *)(v26 + 40) = 0;
    *(_QWORD *)(v25 + 136) = &type metadata for Curve;
    *(_QWORD *)(v25 + 144) = &off_2519C14B0;
    v27 = (double *)swift_allocObject();
    *(_QWORD *)(v25 + 112) = v27;
    v27[2] = v23;
    v27[3] = v21 + -2.0;
    v27[4] = v24;
    v27[5] = v21;
    v27[6] = v24;
    v27[7] = v21;
    v28 = sub_248A75538(v25);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v62 = &off_2519C0FF0;
    v60[0] = v28;
    v8 = *(double *)(a1 + 32);
    v58 = *(double *)(a1 + 40);
    if (v2 == 2)
    {
      v29 = *(double *)(a1 + 24);
      v53 = (v8 + *(double *)(a1 + 16)) * 0.5;
      v55 = (*(double *)(a1 + 40) + v29) * 0.5;
      v30 = *(double *)(a1 + 48);
      v31 = *(double *)(a1 + 56);
      v32 = *(double *)(a1 + 64);
      v33 = *(double *)(a1 + 72);
      v64.origin.x = v30;
      v64.origin.y = v31;
      v64.size.width = v32;
      v64.size.height = v33;
      MaxX = CGRectGetMaxX(v64);
      v34 = v29 + 6.0;
      v65.origin.x = v30;
      v65.origin.y = v31;
      v65.size.width = v32;
      v65.size.height = v33;
      v35 = CGRectGetMaxX(v65);
      v66.origin.x = v30;
      v66.origin.y = v31;
      v66.size.width = v32;
      v66.size.height = v33;
      v36 = CGRectGetMaxX(v66);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
      v37 = swift_initStackObject();
      *(_OWORD *)(v37 + 16) = xmmword_248A9EDA0;
      *(_QWORD *)(v37 + 56) = &type metadata for Line;
      *(_QWORD *)(v37 + 64) = &off_2519C1400;
      v38 = swift_allocObject();
      *(_QWORD *)(v37 + 32) = v38;
      *(double *)(v38 + 16) = v53;
      *(_BYTE *)(v38 + 24) = 0;
      *(double *)(v38 + 32) = v55;
      *(_BYTE *)(v38 + 40) = 0;
      *(_QWORD *)(v37 + 96) = &type metadata for Curve;
      *(_QWORD *)(v37 + 104) = &off_2519C14B0;
      v39 = swift_allocObject();
      *(_QWORD *)(v37 + 72) = v39;
      *(CGFloat *)(v39 + 16) = MaxX;
      goto LABEL_10;
    }
    v18 = *(double *)(a1 + 48);
    v19 = *(double *)(a1 + 56);
    v16 = *(double *)(a1 + 64);
    v17 = *(double *)(a1 + 72);
    v6 = v20;
  }
  v40 = *(double *)(a1 + 16);
  v34 = *(double *)(a1 + 24);
  v41 = v40 + -2.5;
  v42 = CGRectGetWidth(*(CGRect *)&v18) - v6;
  if (v40 + 6.0 >= v42)
    v43 = v42;
  else
    v43 = v40 + 6.0;
  v35 = v40 + -0.5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
  v37 = swift_initStackObject();
  *(_OWORD *)(v37 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v37 + 56) = &type metadata for Line;
  *(_QWORD *)(v37 + 64) = &off_2519C1400;
  v44 = swift_allocObject();
  *(_QWORD *)(v37 + 32) = v44;
  *(double *)(v44 + 16) = v41;
  *(_BYTE *)(v44 + 24) = 0;
  *(double *)(v44 + 32) = v34 + -2.0;
  *(_BYTE *)(v44 + 40) = 0;
  *(_QWORD *)(v37 + 96) = &type metadata for Curve;
  *(_QWORD *)(v37 + 104) = &off_2519C14B0;
  v39 = swift_allocObject();
  *(_QWORD *)(v37 + 72) = v39;
  *(double *)(v39 + 16) = v43;
  v29 = v34;
  v36 = v35;
LABEL_10:
  *(double *)(v39 + 24) = v34;
  *(double *)(v39 + 32) = v35;
  *(double *)(v39 + 40) = v29;
  *(CGFloat *)(v39 + 48) = v36;
  *(double *)(v39 + 56) = v34;
  v45 = sub_248A75538(v37);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
  swift_arrayDestroy();
  v59[4] = &off_2519C0FF0;
  v59[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
  v59[0] = v45;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
  v46 = swift_initStackObject();
  *(_OWORD *)(v46 + 16) = xmmword_248A9F600;
  sub_248A756C8((uint64_t)v60, v46 + 32);
  *(_QWORD *)(v46 + 96) = &type metadata for Line;
  *(_QWORD *)(v46 + 104) = &off_2519C1400;
  v47 = swift_allocObject();
  *(_QWORD *)(v46 + 72) = v47;
  *(double *)(v47 + 16) = v8 + -2.0;
  *(_BYTE *)(v47 + 24) = 0;
  *(double *)(v47 + 32) = v58 + 1.0;
  *(_BYTE *)(v47 + 40) = 0;
  *(_QWORD *)(v46 + 136) = &type metadata for Curve;
  *(_QWORD *)(v46 + 144) = &off_2519C14B0;
  v48 = (double *)swift_allocObject();
  *(_QWORD *)(v46 + 112) = v48;
  v48[2] = v8 + 2.0;
  v48[3] = v58 + 1.0;
  v48[4] = v8;
  v48[5] = v58 + -0.5;
  v48[6] = v8;
  v48[7] = v58 + -0.5;
  sub_248A756C8((uint64_t)v59, v46 + 152);
  v49 = sub_248A75538(v46);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
  swift_arrayDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  return v49;
}

uint64_t sub_248A8B88C(uint64_t a1)
{
  return sub_248A8BE10(a1, (uint64_t (*)(uint64_t))sub_248A8B2A4);
}

_QWORD *sub_248A8B8DC(uint64_t a1)
{
  int v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  double v13;
  CGFloat Width;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double *v23;
  _QWORD *v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  _QWORD *v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double *v40;
  _QWORD *v41;
  _QWORD v43[5];
  _QWORD v44[3];
  uint64_t v45;
  _UNKNOWN **v46;

  v2 = *(unsigned __int8 *)(a1 + 96);
  if (v2 == 4)
  {
    v3 = *(double *)a1;
    v4 = *(double *)(a1 + 8);
    v5 = *(double *)(a1 + 32);
    v6 = *(double *)(a1 + 40);
    v7 = (*(double *)a1 + v5) * 0.5;
    v8 = (v4 + v6) * 0.5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_248A9EDA0;
    *(_QWORD *)(inited + 56) = &type metadata for Line;
    *(_QWORD *)(inited + 64) = &off_2519C1400;
    v10 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v10;
    *(double *)(v10 + 16) = v3;
    *(_BYTE *)(v10 + 24) = 0;
    *(double *)(v10 + 32) = v4 + -6.0;
    *(_BYTE *)(v10 + 40) = 0;
    *(_QWORD *)(inited + 96) = &type metadata for Curve;
    *(_QWORD *)(inited + 104) = &off_2519C14B0;
    v11 = swift_allocObject();
    *(_QWORD *)(inited + 72) = v11;
    *(double *)(v11 + 16) = v7;
    *(double *)(v11 + 24) = v8;
    *(double *)(v11 + 32) = v3;
    *(double *)(v11 + 40) = v4;
    *(double *)(v11 + 48) = v7;
    *(double *)(v11 + 56) = v8;
    v12 = sub_248A75538(inited);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v46 = &off_2519C0FF0;
    v44[0] = v12;
    v13 = *(double *)(a1 + 80);
  }
  else
  {
    Width = CGRectGetWidth(*(CGRect *)(a1 + 48));
    v13 = *(double *)(a1 + 80);
    v15 = Width - v13;
    v16 = *(double *)a1;
    v17 = *(double *)(a1 + 8);
    if (*(double *)a1 + 6.0 >= v15)
      v18 = v15;
    else
      v18 = *(double *)a1 + 6.0;
    v19 = v16 + -2.5;
    v20 = v16 + -0.5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v21 = swift_initStackObject();
    *(_OWORD *)(v21 + 16) = xmmword_248A9EDA0;
    *(_QWORD *)(v21 + 56) = &type metadata for Line;
    *(_QWORD *)(v21 + 64) = &off_2519C1400;
    v22 = swift_allocObject();
    *(_QWORD *)(v21 + 32) = v22;
    *(double *)(v22 + 16) = v18;
    *(_BYTE *)(v22 + 24) = 0;
    *(double *)(v22 + 32) = v17;
    *(_BYTE *)(v22 + 40) = 0;
    *(_QWORD *)(v21 + 96) = &type metadata for Curve;
    *(_QWORD *)(v21 + 104) = &off_2519C14B0;
    v23 = (double *)swift_allocObject();
    *(_QWORD *)(v21 + 72) = v23;
    v23[2] = v19;
    v23[3] = v17 + 2.0;
    v23[4] = v20;
    v23[5] = v17;
    v23[6] = v20;
    v23[7] = v17;
    v24 = sub_248A75538(v21);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v46 = &off_2519C0FF0;
    v44[0] = v24;
    v5 = *(double *)(a1 + 32);
    v6 = *(double *)(a1 + 40);
    if (v2 == 3)
    {
      v25 = *(double *)(a1 + 16);
      v26 = *(double *)(a1 + 24);
      v27 = v26 + -6.0;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
      v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_248A9EDA0;
      *(_QWORD *)(v28 + 56) = &type metadata for Line;
      *(_QWORD *)(v28 + 64) = &off_2519C1400;
      v29 = swift_allocObject();
      *(_QWORD *)(v28 + 32) = v29;
      *(double *)(v29 + 16) = (v5 + v25) * 0.5;
      *(_BYTE *)(v29 + 24) = 0;
      *(double *)(v29 + 32) = (v6 + v26) * 0.5;
      *(_BYTE *)(v29 + 40) = 0;
      *(_QWORD *)(v28 + 96) = &type metadata for Curve;
      *(_QWORD *)(v28 + 104) = &off_2519C14B0;
      v30 = (double *)swift_allocObject();
      *(_QWORD *)(v28 + 72) = v30;
      v30[2] = v25;
      goto LABEL_12;
    }
  }
  v31 = *(double *)(a1 + 16);
  v27 = *(double *)(a1 + 24);
  v32 = v31 + 2.5;
  if (v13 > v31 + -6.0)
    v33 = v13;
  else
    v33 = v31 + -6.0;
  v25 = v31 + 0.5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
  v28 = swift_initStackObject();
  *(_OWORD *)(v28 + 16) = xmmword_248A9EDA0;
  *(_QWORD *)(v28 + 56) = &type metadata for Line;
  *(_QWORD *)(v28 + 64) = &off_2519C1400;
  v34 = swift_allocObject();
  *(_QWORD *)(v28 + 32) = v34;
  *(double *)(v34 + 16) = v32;
  *(_BYTE *)(v34 + 24) = 0;
  *(double *)(v34 + 32) = v27 + 2.0;
  *(_BYTE *)(v34 + 40) = 0;
  *(_QWORD *)(v28 + 96) = &type metadata for Curve;
  *(_QWORD *)(v28 + 104) = &off_2519C14B0;
  v30 = (double *)swift_allocObject();
  *(_QWORD *)(v28 + 72) = v30;
  v30[2] = v33;
  v26 = v27;
LABEL_12:
  v30[3] = v27;
  v30[4] = v25;
  v30[5] = v26;
  v30[6] = v25;
  v30[7] = v27;
  v35 = sub_248A75538(v28);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
  swift_arrayDestroy();
  v43[4] = &off_2519C0FF0;
  v43[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
  v43[0] = v35;
  v36 = v6 + 0.5;
  v37 = v6 + -1.0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
  v38 = swift_initStackObject();
  *(_OWORD *)(v38 + 16) = xmmword_248A9F600;
  sub_248A756C8((uint64_t)v44, v38 + 32);
  *(_QWORD *)(v38 + 96) = &type metadata for Line;
  *(_QWORD *)(v38 + 104) = &off_2519C1400;
  v39 = swift_allocObject();
  *(_QWORD *)(v38 + 72) = v39;
  *(double *)(v39 + 16) = v5 + 2.0;
  *(_BYTE *)(v39 + 24) = 0;
  *(double *)(v39 + 32) = v37;
  *(_BYTE *)(v39 + 40) = 0;
  *(_QWORD *)(v38 + 136) = &type metadata for Curve;
  *(_QWORD *)(v38 + 144) = &off_2519C14B0;
  v40 = (double *)swift_allocObject();
  *(_QWORD *)(v38 + 112) = v40;
  v40[2] = v5 + -2.0;
  v40[3] = v37;
  v40[4] = v5;
  v40[5] = v36;
  v40[6] = v5;
  v40[7] = v36;
  sub_248A756C8((uint64_t)v43, v38 + 152);
  v41 = sub_248A75538(v38);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
  swift_arrayDestroy();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v43);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return v41;
}

uint64_t sub_248A8BE10(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2(v2);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = (_QWORD *)(v4 + 32);
    do
    {
      v7 = v6[3];
      v8 = v6[4];
      __swift_project_boxed_opaque_existential_1(v6, v7);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v7, v8);
      v6 += 5;
      --v5;
    }
    while (v5);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A8BE94(uint64_t a1)
{
  return sub_248A8BE10(a1, (uint64_t (*)(uint64_t))sub_248A8B8DC);
}

void sub_248A8BEE4(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, CGFloat a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>, double a11, double a12)
{
  double v18;
  double v19;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat Width;
  double v27;
  CGFloat v28;
  BOOL v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v18 = a4;
  v19 = a3;
  v21 = a11;
  v22 = a3 + a5;
  v23 = v22 * 0.5;
  if (a1 == 2)
  {
    v34.origin.x = a7;
    v34.origin.y = a8;
    v32 = a6;
    v34.size.width = a9;
    v34.size.height = a10;
    v24 = v18;
    v19 = CGRectGetWidth(v34) + a12 * -2.5;
    v35.origin.x = a7;
    v35.origin.y = a8;
    v35.size.width = a9;
    v35.size.height = a10;
    v25 = v23 - (CGRectGetWidth(v35) - v23);
    if (v19 <= v25)
      v19 = v25;
    v36.origin.x = a7;
    v36.origin.y = a8;
    v36.size.width = a9;
    v36.size.height = a10;
    Width = CGRectGetWidth(v36);
    v18 = v24;
    a6 = v32;
    v21 = a11;
    a5 = Width;
    v27 = v32;
  }
  else
  {
    if (a1 == 1)
    {
      if (v22 >= a12 * 2.5)
        a5 = a12 * 2.5;
      else
        a5 = v22;
      v19 = 0.0;
LABEL_15:
      v27 = v18;
      goto LABEL_16;
    }
    if (v19 >= a11)
    {
      v37.origin.x = a7;
      v37.origin.y = a8;
      v33 = a6;
      v37.size.width = a9;
      v37.size.height = a10;
      v31 = v18;
      v28 = CGRectGetWidth(v37);
      v18 = v31;
      a6 = v33;
      v21 = a11;
      v29 = v28 - a11 < a5;
      v27 = v31;
      if (!v29)
        goto LABEL_16;
      v38.origin.x = a7;
      v38.origin.y = a8;
      v38.size.width = a9;
      v38.size.height = a10;
      v19 = v23 - (CGRectGetWidth(v38) - a11 - v23);
      v39.origin.x = a7;
      v39.origin.y = a8;
      v39.size.width = a9;
      v39.size.height = a10;
      v30 = CGRectGetWidth(v39);
      v18 = v31;
      a6 = v33;
      v21 = a11;
      a5 = v30 - a11;
      goto LABEL_15;
    }
    a5 = v23 + v23 - a11;
    v27 = a4;
    v19 = a11;
  }
LABEL_16:
  *(double *)a2 = v19;
  *(double *)(a2 + 8) = v27;
  *(CGFloat *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = v23;
  *(double *)(a2 + 40) = v18 - a12;
  *(CGFloat *)(a2 + 48) = a7;
  *(CGFloat *)(a2 + 56) = a8;
  *(CGFloat *)(a2 + 64) = a9;
  *(CGFloat *)(a2 + 72) = a10;
  *(double *)(a2 + 80) = v21;
  *(double *)(a2 + 88) = a12;
  *(_BYTE *)(a2 + 96) = a1;
}

void sub_248A8C0B0(char a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>, CGFloat a9@<D6>, CGFloat a10@<D7>, double a11, double a12)
{
  double v18;
  double v21;
  double v22;
  double v23;
  double Width;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  CGFloat MaxX;
  CGFloat v30;
  double v31;
  double v33;
  double v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v18 = a4;
  v21 = a11;
  v22 = a3 + a5;
  v23 = v22 * 0.5;
  if (a1 == 4)
  {
    v35.origin.x = a7;
    v35.origin.y = a8;
    v31 = v18;
    v33 = a6;
    v35.size.width = a9;
    v35.size.height = a10;
    Width = CGRectGetWidth(v35);
    v36.origin.x = a7;
    v36.origin.y = a8;
    v36.size.width = a9;
    v36.size.height = a10;
    v27 = CGRectGetWidth(v36) + a12 * -2.5;
    v37.origin.x = a7;
    v37.origin.y = a8;
    v37.size.width = a9;
    v37.size.height = a10;
    v28 = CGRectGetWidth(v37);
    v18 = v31;
    a6 = v33;
    v21 = a11;
    v25 = v23 - (v28 - v23);
    if (v27 > v25)
      v25 = v27;
    goto LABEL_19;
  }
  if (a1 != 3)
  {
    v34 = a6;
    v38.origin.x = a7;
    v38.origin.y = a8;
    v38.size.width = a9;
    v38.size.height = a10;
    MaxX = CGRectGetMaxX(v38);
    v21 = a11;
    if (MaxX - a11 >= a3)
    {
      if (a5 < a11)
        v25 = a11;
      else
        v25 = a5;
      if (a5 < a11)
        Width = v23 + v23 - a11;
      else
        Width = a3;
    }
    else
    {
      v39.origin.x = a7;
      v39.origin.y = a8;
      v39.size.width = a9;
      v39.size.height = a10;
      Width = CGRectGetMaxX(v39) - a11;
      v40.origin.x = a7;
      v40.origin.y = a8;
      v40.size.width = a9;
      v40.size.height = a10;
      v30 = CGRectGetMaxX(v40);
      v21 = a11;
      v25 = v23 - (v30 - a11 - v23);
    }
    v18 = a4;
    a6 = v34;
LABEL_19:
    v26 = v18;
    goto LABEL_20;
  }
  if (v22 >= a12 * 2.5)
    Width = a12 * 2.5;
  else
    Width = v22;
  v25 = 0.0;
  v26 = a6;
LABEL_20:
  *(double *)a2 = Width;
  *(double *)(a2 + 8) = v26;
  *(double *)(a2 + 16) = v25;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = v23;
  *(double *)(a2 + 40) = v18 + a12;
  *(CGFloat *)(a2 + 48) = a7;
  *(CGFloat *)(a2 + 56) = a8;
  *(CGFloat *)(a2 + 64) = a9;
  *(CGFloat *)(a2 + 72) = a10;
  *(double *)(a2 + 80) = v21;
  *(double *)(a2 + 88) = a12;
  *(_BYTE *)(a2 + 96) = a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

ValueMetadata *type metadata accessor for UpArrow()
{
  return &type metadata for UpArrow;
}

uint64_t _s12TipKitLegacy7UpArrowVwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 97))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 96);
  v4 = v3 >= 5;
  v5 = v3 - 5;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s12TipKitLegacy7UpArrowVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 96) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 97) = 0;
    if (a2)
      *(_BYTE *)(result + 96) = a2 + 4;
  }
  return result;
}

ValueMetadata *type metadata accessor for DownArrow()
{
  return &type metadata for DownArrow;
}

uint64_t sub_248A8C368()
{
  return swift_deallocObject();
}

uint64_t sub_248A8C378()
{
  return swift_deallocObject();
}

id sub_248A8C388()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  uint64_t v4;
  _OWORD v5[2];
  _BYTE v6[24];
  uint64_t v7;

  result = objc_msgSend(v0, sel_customView);
  if (!result)
  {
    v2 = (void *)sub_248A9C5A4();
    v3 = objc_msgSend(v0, sel_valueForKey_, v2);

    if (v3)
    {
      sub_248A9C730();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v5, 0, sizeof(v5));
    }
    sub_248A759D4((uint64_t)v5, (uint64_t)v6);
    if (v7)
    {
      sub_248A8C47C();
      if ((swift_dynamicCast() & 1) != 0)
        return (id)v4;
    }
    else
    {
      sub_248A75A1C((uint64_t)v6);
    }
    return 0;
  }
  return result;
}

unint64_t sub_248A8C47C()
{
  unint64_t result;

  result = qword_2577AEEA0;
  if (!qword_2577AEEA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577AEEA0);
  }
  return result;
}

_QWORD *TPKContentView.init(controller:content:)(void *a1, void *a2)
{
  char *v2;
  uint64_t v5;
  void *v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  v5 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v6 = (void *)objc_opt_self();
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_currentTraitCollection);
  v7[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
  v8 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  v9 = a1;
  v10 = a2;
  v11 = TPKBaseContentView.init(controller:content:)(v9, v10);
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    sub_248A8CA5C();

  }
  return v12;
}

id sub_248A8C5A0(void *a1, char *a2)
{
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  _QWORD *v6;
  void (*v7)(_QWORD *);
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_QWORD *);
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id result;
  uint64_t v22;
  void *v23;
  id v24;
  void (*v25)(_QWORD *, _QWORD);
  void (*v26)(_QWORD *, _QWORD);
  void (*v27)(_QWORD *, _QWORD);
  _QWORD v28[4];

  v3 = v2;
  sub_248A8EEF4(a1, a2);
  v4 = &v2[OBJC_IVAR___TPKBaseContentView_viewModel];
  swift_beginAccess();
  v5 = *(_QWORD *)v4;
  swift_unownedRetainStrong();
  if (v5)
  {
    v7 = sub_248A7BC34(v28);
    if (v6[5])
    {
      v8 = v6;
      v9 = (void *)v6[4];
      v10 = v6[2];
      v26 = (void (*)(_QWORD *, _QWORD))v7;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_248A729F8(v10);
      v11 = v9;
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248A72A78(v10);
      swift_release();

      v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v13 = v8[2];
      v8[2] = sub_248A8E754;
      v8[3] = v12;
      sub_248A72A78(v13);
      v26(v28, 0);
    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v7)(v28, 0);
    }
    swift_release();
  }
  v14 = *(_QWORD *)v4;
  swift_unownedRetainStrong();
  if (v14)
  {
    v15 = sub_248A7BC34(v28);
    if (v16[5])
    {
      v17 = v16;
      v27 = (void (*)(_QWORD *, _QWORD))v15;
      v18 = (void *)v16[4];
      v19 = v16[2];
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_248A729F8(v19);
      v20 = v18;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248A72A78(v19);
      swift_release();

      result = objc_msgSend(v3, sel_tintColor);
      if (!result)
      {
        __break(1u);
        return result;
      }
      v17[5] = MEMORY[0x2495A3484]();
      swift_release();
      v27(v28, 0);
    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v15)(v28, 0);
    }
    swift_release();
  }
  v22 = *(_QWORD *)v4;
  result = (id)swift_unownedRetainStrong();
  if (v22)
  {
    v23 = *(void **)&v3[OBJC_IVAR___TPKContentView_imageProxy];
    swift_getKeyPath();
    swift_getKeyPath();
    v24 = v23;
    v25 = (void (*)(_QWORD *, _QWORD))sub_248A9BFF8();
    sub_248A87FCC(v24);

    v25(v28, 0);
    swift_release();
    swift_release();
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_248A8C868()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for TipBodyView();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (uint64_t *)((char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = (uint64_t *)(v0 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v5 = *v4;
  swift_unownedRetainStrong();
  if (!v5)
    return 0;
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
  swift_storeEnumTagMultiPayload();
  v6 = (uint64_t *)((char *)v3 + *(int *)(v1 + 20));
  type metadata accessor for MiniTipViewModel();
  sub_248A8E6E8();
  swift_retain();
  *v6 = sub_248A9C07C();
  v6[1] = v7;
  v8 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA90));
  v9 = sub_248A9C094();
  swift_release();
  return v9;
}

void sub_248A8C998(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  void (*v8)(_QWORD *);
  void *v9;
  _QWORD v10[4];

  v3 = (uint64_t *)(v1 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v4 = *v3;
  swift_unownedRetainStrong();
  if (v4)
  {
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = a1;
    v6 = a1;

    v8 = sub_248A7BC34(v10);
    if (*(_QWORD *)(v7 + 40))
    {
      v9 = *(void **)(v7 + 32);
      *(_QWORD *)(v7 + 32) = a1;
      v6 = v6;

    }
    ((void (*)(_QWORD *, _QWORD))v8)(v10, 0);
    swift_release();
  }
  else
  {
    v6 = a1;
  }

}

void sub_248A8CA5C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = *MEMORY[0x24BEBE100];
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5[4] = sub_248A8E7C4;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_248A8EE50;
  v5[3] = &block_descriptor_0;
  v3 = _Block_copy(v5);
  swift_release();
  v4 = objc_msgSend(v0, sel_addObserverForName_object_queue_usingBlock_, v1, 0, 0, v3);
  _Block_release(v3);
  swift_unknownObjectRelease();

}

id TPKContentView.iconImageView.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___TPKContentView_imageProxy);
}

uint64_t TPKContentView.displaysBottomSeparator.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR___TPKContentView_displayBottomSeparator);
}

uint64_t TPKContentView.displaysBottomSeparator.setter(char a1)
{
  _QWORD *v1;

  *((_BYTE *)v1 + OBJC_IVAR___TPKContentView_displayBottomSeparator) = a1;
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x1D8))();
}

uint64_t (*TPKContentView.displaysBottomSeparator.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = OBJC_IVAR___TPKContentView_displayBottomSeparator;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(v1 + v2);
  return sub_248A8CC48;
}

uint64_t sub_248A8CC48(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)a1;
  *((_BYTE *)v1 + *(_QWORD *)(a1 + 8)) = *(_BYTE *)(a1 + 16);
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x1D8))();
}

id TPKContentView.preferredActionTintColor.getter()
{
  uint64_t v0;
  id *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v1 = (id *)(v0 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v2 = *v1;
  swift_unownedRetainStrong();
  if (v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v2 = (id)v11;
    if (v11)
    {
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_248A729F8(v8);
      v3 = v10;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248A72A78(v8);
      swift_release();

      swift_retain();
      sub_248A8E390(v6, v7, v8, v9, v10, v11);
      v4 = (void *)sub_248A9C43C();
      swift_release();
      if (v4)
      {
        v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v4);

      }
      else
      {
        return 0;
      }
    }
  }
  return v2;
}

void TPKContentView.preferredActionTintColor.setter(id a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _QWORD *v5;
  void (*v6)(_QWORD *);
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];

  v3 = (uint64_t *)(v1 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v4 = *v3;
  swift_unownedRetainStrong();
  if (v4)
  {
    v6 = sub_248A7BC34(v12);
    if (v5[5])
    {
      v7 = v5;
      v8 = (void *)v5[4];
      v9 = v5[2];
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_248A729F8(v9);
      v10 = v8;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_248A72A78(v9);
      swift_release();

      if (a1)
      {
        a1 = a1;
        v11 = MEMORY[0x2495A3484]();
      }
      else
      {
        v11 = sub_248A9C454();
      }
      v7[5] = v11;
      swift_release();
    }
    ((void (*)(_QWORD *, _QWORD))v6)(v12, 0);
    swift_release();
  }

}

void (*TPKContentView.preferredActionTintColor.modify(id *a1))(id *a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = TPKContentView.preferredActionTintColor.getter();
  return sub_248A8CFF0;
}

void sub_248A8CFF0(id *a1, char a2)
{
  id v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    TPKContentView.preferredActionTintColor.setter(v2);

  }
  else
  {
    TPKContentView.preferredActionTintColor.setter(*a1);
  }
}

id TPKContentView.preferredIconImageTintColor.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v6;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v2 = *v1;
  swift_unownedRetainStrong();
  if (!v2)
    return 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  swift_release();
  swift_retain();
  sub_248A7CE78(&v6);
  v3 = (void *)sub_248A9C43C();
  swift_release();
  if (!v3)
    return 0;
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v3);

  return v4;
}

void TPKContentView.preferredIconImageTintColor.setter(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_BYTE *, _QWORD);
  _BYTE v7[32];

  v3 = (uint64_t *)(v1 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v4 = *v3;
  swift_unownedRetainStrong();
  if (v4)
  {
    if (a1)
      v5 = MEMORY[0x2495A3484](a1);
    else
      v5 = 0;
    swift_getKeyPath();
    swift_getKeyPath();
    v6 = (void (*)(_BYTE *, _QWORD))sub_248A9BFF8();
    sub_248A8817C(v5);
    swift_release();
    v6(v7, 0);
    swift_release();

    swift_release();
    swift_release();
  }
  else
  {

  }
}

void (*TPKContentView.preferredIconImageTintColor.modify(id **a1))(uint64_t a1, char a2)
{
  char *v1;
  id *v3;
  uint64_t v4;
  id *v5;
  id v6;
  void *v7;

  v3 = (id *)malloc(0x60uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___TPKBaseContentView_viewModel;
  v3[10] = v1;
  v3[11] = (id)v4;
  v5 = (id *)&v1[v4];
  swift_beginAccess();
  v6 = *v5;
  swift_unownedRetainStrong();
  if (v6)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    swift_retain();
    sub_248A7CE78(v3);
    v7 = (void *)sub_248A9C43C();
    swift_release();
    if (v7)
    {
      v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithCGColor_, v7);

    }
    else
    {
      v6 = 0;
    }
  }
  v3[9] = v6;
  return sub_248A8D3F0;
}

void sub_248A8D3F0(uint64_t a1, char a2)
{
  void *v3;
  id v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(void *, _QWORD);
  void (*v10)(void *, _QWORD);

  v3 = *(void **)a1;
  v5 = (id *)(*(_QWORD *)a1 + 72);
  v4 = *v5;
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 80) + *(_QWORD *)(*(_QWORD *)a1 + 88));
  swift_unownedRetainStrong();
  if ((a2 & 1) != 0)
  {
    if (v6)
    {
      if (v4)
        v7 = MEMORY[0x2495A3484](v4);
      else
        v7 = 0;
      swift_getKeyPath();
      swift_getKeyPath();
      v9 = (void (*)(void *, _QWORD))sub_248A9BFF8();
      sub_248A8817C(v7);
      swift_release();
      v9(v3, 0);
      swift_release();
      swift_release();

      swift_release();
    }

  }
  else if (v6)
  {
    if (v4)
      v8 = MEMORY[0x2495A3484](v4);
    else
      v8 = 0;
    swift_getKeyPath();
    swift_getKeyPath();
    v10 = (void (*)(void *, _QWORD))sub_248A9BFF8();
    sub_248A8817C(v8);
    swift_release();
    v10(v3, 0);
    swift_release();
    swift_release();

    swift_release();
  }
  else
  {

  }
  free(v3);
}

double TPKContentView.preferredMicaLayerSize.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  id v3;
  id v5[3];

  v1 = (uint64_t *)(v0 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v2 = *v1;
  swift_unownedRetainStrong();
  if (v2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v3 = v5[2];
    sub_248A7CE78(v5);
  }
  else
  {
    v3 = 0;
  }
  return *(double *)&v3;
}

uint64_t TPKContentView.preferredMicaLayerSize.setter(double a1, double a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(_BYTE *, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE v12[32];

  v5 = (uint64_t *)(v2 + OBJC_IVAR___TPKBaseContentView_viewModel);
  swift_beginAccess();
  v6 = *v5;
  result = swift_unownedRetainStrong();
  if (v6)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v8 = (void (*)(_BYTE *, _QWORD))sub_248A9BFF8();
    *(double *)(v9 + 16) = a1;
    *(double *)(v9 + 24) = a2;
    v10 = (void *)MEMORY[0x2495A3F58](v9 + 32);
    if (v10)
    {
      v11 = v10;
      if (*((_BYTE *)v10 + OBJC_IVAR___TipImageProxy_shouldDisplay) == 1)
        objc_msgSend(v10, sel_setFrame_, 0.0, 0.0, a1, a2);

    }
    v8(v12, 0);
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

void (*TPKContentView.preferredMicaLayerSize.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  char *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;

  v3 = (char *)malloc(0x68uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___TPKBaseContentView_viewModel;
  *((_QWORD *)v3 + 11) = v1;
  *((_QWORD *)v3 + 12) = v4;
  v5 = (uint64_t *)(v1 + v4);
  swift_beginAccess();
  v6 = *v5;
  swift_unownedRetainStrong();
  if (v6)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v9 = *((_OWORD *)v3 + 1);
    sub_248A7CE78((id *)v3);
    v7 = v9;
  }
  else
  {
    v7 = 0uLL;
  }
  *(_OWORD *)(v3 + 72) = v7;
  return sub_248A8D8FC;
}

void sub_248A8D8FC(uint64_t a1, char a2)
{
  _QWORD *v2;
  double v3;
  double v4;
  uint64_t v5;
  void (*v6)(_QWORD *, _QWORD);
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = *(_QWORD **)a1;
  v3 = *(double *)(*(_QWORD *)a1 + 72);
  v4 = *(double *)(*(_QWORD *)a1 + 80);
  if ((a2 & 1) != 0)
  {
    TPKContentView.preferredMicaLayerSize.setter(*(double *)(*(_QWORD *)a1 + 72), *(double *)(*(_QWORD *)a1 + 80));
  }
  else
  {
    v5 = *(_QWORD *)(v2[11] + v2[12]);
    swift_unownedRetainStrong();
    if (v5)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v6 = (void (*)(_QWORD *, _QWORD))sub_248A9BFF8();
      *(double *)(v7 + 16) = v3;
      *(double *)(v7 + 24) = v4;
      v8 = (void *)MEMORY[0x2495A3F58](v7 + 32);
      if (v8)
      {
        v9 = v8;
        if ((*((_BYTE *)v8 + OBJC_IVAR___TipImageProxy_shouldDisplay) & 1) != 0)
          objc_msgSend(v8, sel_setFrame_, 0.0, 0.0, v3, v4);

      }
      v6(v2, 0);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  free(v2);
}

id TPKContentView._preferredTraitCollection.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___TPKContentView_preferredTraitCollection);
}

void TPKContentView._preferredTraitCollection.setter(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR___TPKContentView_preferredTraitCollection);
  *(_QWORD *)(v1 + OBJC_IVAR___TPKContentView_preferredTraitCollection) = a1;

}

void (*TPKContentView._preferredTraitCollection.modify(_QWORD *a1))(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v2 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  a1[1] = v1;
  a1[2] = v2;
  v3 = *(void **)(v1 + v2);
  *a1 = v3;
  v4 = v3;
  return sub_248A8DAC0;
}

void sub_248A8DAC0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a1[1];
  v1 = a1[2];
  v3 = *a1;
  v4 = *(void **)(v2 + v1);
  *(_QWORD *)(v2 + v1) = v3;

}

_QWORD *TPKContentView.__allocating_init(controller:content:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return TPKContentView.init(controller:content:)(a1, a2);
}

id TPKContentView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKContentView.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v4 = (void *)objc_opt_self();
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_currentTraitCollection);
  v5[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
  v6 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for TPKContentView();
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

void sub_248A8DE98(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = (_QWORD *)MEMORY[0x2495A3F58](v3);
  if (v4)
  {
    v5 = v4;
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x130))(a1);

  }
}

void sub_248A8DFE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x2495A3F58](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x2495A3F58](v4 + OBJC_IVAR___TPKBaseContentView_viewDelegate);

    if (v6)
    {
      swift_beginAccess();
      v7 = (void *)MEMORY[0x2495A3F58](v3);
      objc_msgSend(v6, sel_contentView_actionTapped_, v7, a1);

      swift_unknownObjectRelease();
    }
  }
}

void sub_248A8E140()
{
  uint64_t v0;

}

id TPKContentView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_248A8E1D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_248A9C1C0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_248A9C0F4();
}

double sub_248A8E250@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  __int128 v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

uint64_t sub_248A8E2D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = *a1;
  v2 = a1[1];
  v3 = a1[2];
  v4 = a1[3];
  v5 = (void *)a1[4];
  v6 = a1[5];
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A8E75C(v1, v2, v3, v4, v5, v6);
  swift_retain();
  return sub_248A9C010();
}

void sub_248A8E390(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248A72A78(a3);
    swift_release();

  }
}

uint64_t sub_248A8E3F8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  return swift_release();
}

id *sub_248A8E464(uint64_t a1)
{
  uint64_t v2;
  id v3[6];

  sub_248A7CE3C(a1, (uint64_t)v3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A7CE3C((uint64_t)v3, (uint64_t)&v2);
  swift_retain();
  sub_248A9C010();
  return sub_248A7CE78(v3);
}

uint64_t type metadata accessor for TPKContentView()
{
  return objc_opt_self();
}

_QWORD *sub_248A8E510@<X0>(_QWORD *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *(_BYTE *)(*result + OBJC_IVAR___TPKContentView_displayBottomSeparator);
  return result;
}

uint64_t sub_248A8E528(_BYTE *a1, _QWORD **a2)
{
  _QWORD *v2;

  v2 = *a2;
  *((_BYTE *)v2 + OBJC_IVAR___TPKContentView_displayBottomSeparator) = *a1;
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v2) + 0x1D8))();
}

id sub_248A8E570@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = TPKContentView.preferredActionTintColor.getter();
  *a1 = result;
  return result;
}

void sub_248A8E598(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  TPKContentView.preferredActionTintColor.setter(v1);
}

id sub_248A8E5C4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = TPKContentView.preferredIconImageTintColor.getter();
  *a1 = result;
  return result;
}

void sub_248A8E5EC(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  TPKContentView.preferredIconImageTintColor.setter(v1);
}

void sub_248A8E618(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(double *)a1 = TPKContentView.preferredMicaLayerSize.getter();
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t sub_248A8E640(double *a1)
{
  return TPKContentView.preferredMicaLayerSize.setter(*a1, a1[1]);
}

id sub_248A8E664@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR___TPKContentView_preferredTraitCollection);
  *a2 = v2;
  return v2;
}

void sub_248A8E67C(void **a1, _QWORD *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *a1;
  v4 = *(id *)(*a2 + OBJC_IVAR___TPKContentView_preferredTraitCollection);
  *(_QWORD *)(*a2 + OBJC_IVAR___TPKContentView_preferredTraitCollection) = *a1;
  v3 = v2;

}

uint64_t method lookup function for TPKContentView()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_248A8E6C4()
{
  return sub_248A9C0E8();
}

unint64_t sub_248A8E6E8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577AEA88;
  if (!qword_2577AEA88)
  {
    v1 = type metadata accessor for MiniTipViewModel();
    result = MEMORY[0x2495A3E38](&unk_248A9EA20, v1);
    atomic_store(result, (unint64_t *)&qword_2577AEA88);
  }
  return result;
}

uint64_t sub_248A8E730()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_248A8E754(uint64_t a1)
{
  uint64_t v1;

  sub_248A8DFE8(a1, v1);
}

uint64_t sub_248A8E75C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v8;
  uint64_t result;

  if (a6)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_248A729F8(a3);
    v8 = a5;
    return swift_retain();
  }
  return result;
}

void sub_248A8E7C4(uint64_t a1)
{
  uint64_t v1;

  sub_248A8DE98(a1, v1);
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

ValueMetadata *type metadata accessor for TipProxyContainer()
{
  return &type metadata for TipProxyContainer;
}

id sub_248A8E7F8()
{
  id *v0;

  return *v0;
}

id sub_248A8E800(void *a1, double a2)
{
  double v3;

  LODWORD(a2) = 1144750080;
  objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 0, a2);
  LODWORD(v3) = 1144750080;
  return objc_msgSend(a1, sel_setContentCompressionResistancePriority_forAxis_, 1, v3);
}

uint64_t sub_248A8E854()
{
  sub_248A8E918();
  return sub_248A9C250();
}

uint64_t sub_248A8E8A4()
{
  sub_248A8E918();
  return sub_248A9C1FC();
}

void sub_248A8E8F4()
{
  sub_248A8E918();
  sub_248A9C244();
  __break(1u);
}

unint64_t sub_248A8E918()
{
  unint64_t result;

  result = qword_2577AEA98;
  if (!qword_2577AEA98)
  {
    result = MEMORY[0x2495A3E38](&unk_248A9F764, &type metadata for TipProxyContainer);
    atomic_store(result, (unint64_t *)&qword_2577AEA98);
  }
  return result;
}

id TPKBaseContentView.defaultDirectionalEdgeInsets.setter(double a1, double a2, double a3, double a4)
{
  char *v4;
  double *v5;

  v5 = (double *)&v4[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  *v5 = a1;
  v5[1] = a2;
  v5[2] = a3;
  v5[3] = a4;
  return objc_msgSend(v4, sel_setDirectionalLayoutMargins_);
}

void TPKBaseContentView.contentBackgroundColor.setter(void *a1)
{
  _QWORD *v1;

  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v1) + 0x148))();

}

void sub_248A8E9BC(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v3 = *(id *)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(_QWORD *)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = a1;
  v2 = a1;

}

double TPKBaseContentView.defaultDirectionalEdgeInsets.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets);
}

void *TPKBaseContentView.contentBackgroundColor.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  v2 = v1;
  return v1;
}

void *sub_248A8EA34()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A8EA80()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v1 = *MEMORY[0x24BEBE088];
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v5[4] = sub_248A902A8;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_248A8EE50;
  v5[3] = &block_descriptor_1;
  v3 = _Block_copy(v5);
  swift_release();
  v4 = objc_msgSend(v0, sel_addObserverForName_object_queue_usingBlock_, v1, 0, 0, v3);
  _Block_release(v3);
  swift_unknownObjectRelease();

}

_QWORD *TPKBaseContentView.init(controller:content:)(void *a1, void *a2)
{
  char *v2;
  char *v3;
  char *v6;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *ObjCClassFromMetadata;
  id v19;
  uint64_t ObjCClassMetadata;
  _QWORD *v21;
  void **v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  objc_super v33;
  void *v34;

  v3 = v2;
  swift_getObjectType();
  v6 = &v2[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)v6 = _Q0;
  *((_OWORD *)v6 + 1) = _Q0;
  v12 = OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor;
  v13 = (void *)objc_opt_self();
  v14 = v2;
  *(_QWORD *)&v3[v12] = objc_msgSend(v13, sel_tertiarySystemFillColor);
  v15 = OBJC_IVAR___TPKBaseContentView_hostingView;
  *(_QWORD *)&v14[OBJC_IVAR___TPKBaseContentView_hostingView] = 0;
  v16 = (uint64_t)&v14[OBJC_IVAR___TPKBaseContentView_viewDelegate];
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v14[OBJC_IVAR___TPKBaseContentView_viewModel] = 0;
  v17 = OBJC_IVAR___TPKBaseContentView_content;
  *(_QWORD *)&v14[OBJC_IVAR___TPKBaseContentView_content] = 0;
  v34 = &unk_2577B1D98;
  v32 = swift_dynamicCastObjCProtocolConditional();
  if (!v32)
    goto LABEL_7;
  v31 = a2;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v19 = a1;
  objc_msgSend(ObjCClassFromMetadata, sel_classForCoder);
  ObjCClassMetadata = swift_getObjCClassMetadata();
  if (ObjCClassMetadata == type metadata accessor for TPKContentView())
  {

    a2 = v31;
LABEL_7:

    sub_248A78B20(v16);
    swift_unownedRelease();
    v29 = *(void **)&v14[v17];

    type metadata accessor for TPKBaseContentView();
    swift_deallocPartialClassInstance();
    return 0;
  }

  v33.receiver = v14;
  v33.super_class = (Class)type metadata accessor for TPKBaseContentView();
  v21 = objc_msgSendSuper2(&v33, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v22 = (void **)((char *)v21 + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  v23 = *v22;
  *v22 = v31;
  v24 = v31;

  v25 = swift_unknownObjectWeakAssign();
  v26 = MEMORY[0x2495A3F58](v25);
  if (v26)
  {
    v27 = (void *)v26;
    v28 = v21;
    objc_msgSend(v27, sel_contentViewWasCreated_, v28);

    swift_unknownObjectRelease();
  }
  (*(void (**)(uint64_t, id))((*MEMORY[0x24BEE4EA0] & *v21) + 0x150))(v32, v24);
  sub_248A8EA80();

  return v21;
}

uint64_t type metadata accessor for TPKBaseContentView()
{
  return objc_opt_self();
}

uint64_t sub_248A8EE50(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_248A9BF68();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_248A9BF5C();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_248A8EEF4(void *a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = v2;
  v5 = OBJC_IVAR___TPKContent_cachedViewModel;
  v6 = *(_QWORD *)&a2[OBJC_IVAR___TPKContent_cachedViewModel];
  if (v6)
  {
    *(_QWORD *)&a2[OBJC_IVAR___TPKContent_cachedViewModel] = 0;
  }
  else
  {
    type metadata accessor for MiniTipViewModel();
    swift_allocObject();
    swift_unknownObjectRetain_n();
    v8 = a2;
    *(_QWORD *)&a2[v5] = sub_248A7BF14(a2, a1);
    swift_unknownObjectRelease();
    result = swift_release();
    v6 = *(_QWORD *)&a2[v5];
    *(_QWORD *)&a2[v5] = 0;
    if (!v6)
      return result;
  }
  v10 = OBJC_IVAR___TPKBaseContentView_hostingView;
  if (!*(_QWORD *)((char *)v2 + OBJC_IVAR___TPKBaseContentView_hostingView))
  {
    v11 = (_QWORD *)((char *)v2 + OBJC_IVAR___TPKBaseContentView_viewModel);
    swift_beginAccess();
    swift_retain();
    swift_unownedRelease();
    *v11 = v6;
    swift_endAccess();
    swift_unownedRetain();
    swift_release();
    v12 = *v11;
    swift_unownedRetainStrong();
    if (v12)
    {
      v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      swift_getKeyPath();
      swift_getKeyPath();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = sub_248A901B8;
      *(_QWORD *)(v14 + 24) = v13;
      sub_248A9C010();
    }
    v15 = *v11;
    v16 = swift_unownedRetainStrong();
    if (v15)
    {
      v17 = swift_allocObject();
      swift_unknownObjectWeakInit();
      v18 = swift_allocObject();
      *(_QWORD *)(v18 + 16) = v17;
      *(_QWORD *)(v18 + 24) = a2;
      swift_getKeyPath();
      swift_getKeyPath();
      v19 = swift_allocObject();
      *(_QWORD *)(v19 + 16) = sub_248A90258;
      *(_QWORD *)(v19 + 24) = v18;
      v20 = a2;
      v16 = sub_248A9C010();
    }
    v21 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x158))(v16);
    v22 = *(void **)((char *)v3 + v10);
    *(_QWORD *)((char *)v3 + v10) = v21;

    v23 = *(void **)((char *)v3 + v10);
    if (v23)
    {
      v24 = v23;
      objc_msgSend(v3, sel_directionalLayoutMargins);
      objc_msgSend(v24, sel_setDirectionalLayoutMargins_);

      v25 = *(void **)((char *)v3 + v10);
      if (v25)
      {
        objc_msgSend(v25, sel_setInsetsLayoutMarginsFromSafeArea_, 0);
        v26 = *(void **)((char *)v3 + v10);
        if (v26)
        {
          objc_msgSend(v26, sel_setPreservesSuperviewLayoutMargins_, 0);
          v27 = *(void **)((char *)v3 + v10);
          if (v27)
          {
            v28 = v27;
            objc_msgSend(v28, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

          }
        }
      }
    }
  }
  return swift_release();
}

void sub_248A8F354(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

void (*TPKBaseContentView.contentBackgroundColor.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  return sub_248A8F46C;
}

void sub_248A8F46C(uint64_t a1, char a2)
{
  void (*v2)(id);
  id v3;
  void *v4;
  id v5;

  v2 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(a1 + 8)) + 0x148);
  v5 = *(id *)a1;
  if ((a2 & 1) != 0)
  {
    v3 = v5;
    v2(v5);

    v4 = v3;
  }
  else
  {
    v2(v5);
    v4 = v5;
  }

}

void (*TPKBaseContentView.defaultDirectionalEdgeInsets.modify(_QWORD *a1))(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _OWORD *v5;
  __int128 v6;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets;
  v3[4] = v1;
  v3[5] = v4;
  v5 = (_OWORD *)(v1 + v4);
  v6 = v5[1];
  *(_OWORD *)v3 = *v5;
  *((_OWORD *)v3 + 1) = v6;
  return sub_248A8F568;
}

void sub_248A8F568(uint64_t a1)
{
  _QWORD *v1;
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD **)a1;
  v2 = *(char **)(*(_QWORD *)a1 + 32);
  v3 = &v2[v1[5]];
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  *(_QWORD *)v3 = *v1;
  *((_QWORD *)v3 + 1) = v4;
  *((_QWORD *)v3 + 2) = v5;
  *((_QWORD *)v3 + 3) = v6;
  objc_msgSend(v2, sel_setDirectionalLayoutMargins_);
  free(v1);
}

_QWORD *TPKBaseContentView.__allocating_init(controller:content:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return TPKBaseContentView.init(controller:content:)(a1, a2);
}

id TPKBaseContentView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKBaseContentView.init(coder:)(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  objc_super v14;

  v3 = &v1[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)v3 = _Q0;
  *((_OWORD *)v3 + 1) = _Q0;
  v9 = OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor;
  v10 = (void *)objc_opt_self();
  v11 = v1;
  *(_QWORD *)&v1[v9] = objc_msgSend(v10, sel_tertiarySystemFillColor);
  *(_QWORD *)&v11[OBJC_IVAR___TPKBaseContentView_hostingView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v11[OBJC_IVAR___TPKBaseContentView_viewModel] = 0;
  *(_QWORD *)&v11[OBJC_IVAR___TPKBaseContentView_content] = 0;

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for TPKBaseContentView();
  v12 = objc_msgSendSuper2(&v14, sel_initWithCoder_, a1);

  return v12;
}

id sub_248A8F77C(uint64_t a1)
{
  char *v1;
  id v3;
  uint64_t v4;
  void *v5;
  char **v6;
  uint64_t v7;
  objc_super v9;

  v3 = objc_msgSend(v1, sel_window);

  if (a1)
  {
    if (!v3)
    {
      v4 = MEMORY[0x2495A3F58](&v1[OBJC_IVAR___TPKBaseContentView_viewDelegate]);
      if (v4)
      {
        v5 = (void *)v4;
        v6 = &selRef_contentViewWillBeShown_;
LABEL_8:
        objc_msgSend(v5, *v6, v1);
        swift_unknownObjectRelease();
      }
    }
  }
  else if (v3)
  {
    v7 = MEMORY[0x2495A3F58](&v1[OBJC_IVAR___TPKBaseContentView_viewDelegate]);
    if (v7)
    {
      v5 = (void *)v7;
      v6 = &selRef_contentViewWillBeRemoved_;
      goto LABEL_8;
    }
  }
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for TPKBaseContentView();
  return objc_msgSendSuper2(&v9, sel_willMoveToWindow_, a1);
}

void sub_248A8F8A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = (_QWORD *)MEMORY[0x2495A3F58](v3);
  if (v4)
  {
    v5 = v4;
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v4) + 0x128))(a1);

  }
}

void sub_248A8FA24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2495A3F58](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x2495A3F58](v2 + OBJC_IVAR___TPKBaseContentView_viewDelegate);

    if (v4)
    {
      swift_beginAccess();
      v5 = (void *)MEMORY[0x2495A3F58](v1);
      objc_msgSend(v4, sel_contentViewCloseButtonTapped_, v5);

      swift_unknownObjectRelease();
    }
  }
}

void sub_248A8FAD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2495A3F58](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x2495A3F58](v2 + OBJC_IVAR___TPKBaseContentView_viewDelegate);

    if (v4)
    {
      swift_beginAccess();
      v5 = (void *)MEMORY[0x2495A3F58](v1);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      v6 = (void *)sub_248A9C5A4();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_contentView_viewTappedForIdentifier_, v5, v6);

      swift_unknownObjectRelease();
    }
  }
}

void sub_248A8FC40()
{
  sub_248A9C7A8();
  __break(1u);
}

id TPKBaseContentView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void TPKBaseContentView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TPKBaseContentView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKBaseContentView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_248A8FDC8@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

id sub_248A8FE1C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(*a1 + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *a2 = v2;
  return v2;
}

void sub_248A8FE34(id *a1, _QWORD **a2)
{
  id v2;
  void (*v3)(id);
  id v4;

  v2 = *a1;
  v3 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & **a2) + 0x148);
  v4 = *a1;
  v3(v2);

}

__n128 sub_248A8FE90@<Q0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  v2 = *a1 + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets;
  result = *(__n128 *)v2;
  v4 = *(_OWORD *)(v2 + 16);
  *a2 = *(_OWORD *)v2;
  a2[1] = v4;
  return result;
}

id sub_248A8FEAC(uint64_t *a1, void **a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  v6 = *a2;
  v7 = (char *)*a2 + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets;
  *v7 = v2;
  v7[1] = v3;
  v7[2] = v4;
  v7[3] = v5;
  return objc_msgSend(v6, sel_setDirectionalLayoutMargins_);
}

uint64_t method lookup function for TPKBaseContentView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKBaseContentView.content.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of TPKBaseContentView.__allocating_init(controller:content:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

double sub_248A8FF70@<D0>(_OWORD *a1@<X8>)
{
  return sub_248A8FFAC(a1);
}

uint64_t sub_248A8FF84()
{
  return sub_248A90038();
}

double sub_248A8FF98@<D0>(_OWORD *a1@<X8>)
{
  return sub_248A8FFAC(a1);
}

double sub_248A8FFAC@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_248A90024()
{
  return sub_248A90038();
}

uint64_t sub_248A90038()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  swift_retain();
  return sub_248A9C010();
}

uint64_t sub_248A90194()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_248A901B8()
{
  uint64_t v0;

  sub_248A8FA24(v0);
}

double sub_248A901C0@<D0>(_OWORD *a1@<X8>)
{
  return sub_248A8FFAC(a1);
}

uint64_t sub_248A901E4()
{
  return sub_248A90038();
}

uint64_t sub_248A90208()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248A9022C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_248A90258()
{
  uint64_t v0;

  sub_248A8FAD0(*(_QWORD *)(v0 + 16));
}

double sub_248A90260@<D0>(_OWORD *a1@<X8>)
{
  return sub_248A8FFAC(a1);
}

uint64_t sub_248A90284()
{
  return sub_248A90038();
}

void sub_248A902A8(uint64_t a1)
{
  uint64_t v1;

  sub_248A8F8A4(a1, v1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

void *sub_248A902D0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEAF8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_248A9C4C0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRelease();
  sub_248A90490();
  swift_bridgeObjectRetain();
  v7 = (void *)sub_248A9C6F4();

  if (v7)
  {
    sub_248A9C4B4();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDF3FD0], v3);
    sub_248A9C4E4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v8 = *MEMORY[0x24BDF4068];
    v9 = sub_248A9C4D8();
    v10 = *(_QWORD *)(v9 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v2, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v2, 0, 1, v9);
    v7 = (void *)sub_248A9C4CC();
    swift_release();
    sub_248A904CC((uint64_t)v2);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_248A90490()
{
  unint64_t result;

  result = qword_2577AEB00;
  if (!qword_2577AEB00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2577AEB00);
  }
  return result;
}

uint64_t sub_248A904CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEAF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s12ArrowPinningOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s12ArrowPinningOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_248A905F4 + 4 * byte_248A9F91D[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_248A90628 + 4 * byte_248A9F918[v4]))();
}

uint64_t sub_248A90628(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A90630(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248A90638);
  return result;
}

uint64_t sub_248A90644(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248A9064CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_248A90650(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A90658(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248A90664(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_248A9066C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *_s12ArrowPinningOMa()
{
  return &_s12ArrowPinningON;
}

unint64_t sub_248A90688()
{
  unint64_t result;

  result = qword_2577AEB08;
  if (!qword_2577AEB08)
  {
    result = MEMORY[0x2495A3E38](&unk_248A9F970, &_s12ArrowPinningON);
    atomic_store(result, (unint64_t *)&qword_2577AEB08);
  }
  return result;
}

BOOL sub_248A906CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_248A906E0()
{
  sub_248A9C82C();
  sub_248A9C838();
  return sub_248A9C844();
}

uint64_t sub_248A90724()
{
  return sub_248A9C838();
}

uint64_t sub_248A9074C()
{
  sub_248A9C82C();
  sub_248A9C838();
  return sub_248A9C844();
}

id static UIImage.tipKitSiriIcon(traitCollection:)(void *a1)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  id v4;
  void *v5;
  id v6;

  type metadata accessor for TPKContent();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = a1;
  v5 = (void *)sub_248A9C5A4();
  v6 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v5, v3, v4);

  return v6;
}

id sub_248A90844(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t ObjCClassFromMetadata;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  type metadata accessor for TPKContent();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = objc_msgSend(v5, sel_bundleForClass_, ObjCClassFromMetadata);
  v8 = v6;
  v9 = (void *)sub_248A9C5A4();
  v10 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v9, v7, v8);

  return v10;
}

void sub_248A90910()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
  v1 = (void *)sub_248A9C5A4();
  v2 = objc_msgSend(v0, sel_initWithString_, v1);

  qword_2577B08B8 = (uint64_t)v2;
}

id sub_248A9097C()
{
  if (qword_2577ADDB8 != -1)
    swift_once();
  return (id)qword_2577B08B8;
}

id sub_248A909BC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer;
  v2 = *(void **)(v0 + OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDE5758]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_248A90A2C()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  double v4;
  double Width;
  CGFloat v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  id v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v1 = v0;
  v2 = sub_248A909BC();
  objc_msgSend(v1, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

  v3 = sub_248A909BC();
  if (*(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection] == 1)
    v4 = 13.0;
  else
    v4 = 0.0;
  objc_msgSend(v1, sel_bounds);
  Width = CGRectGetWidth(v19);
  objc_msgSend(v1, sel_bounds);
  v6 = CGRectGetHeight(v20) + -13.0;
  v7 = objc_msgSend((id)objc_opt_self(), sel_bezierPathWithRoundedRect_cornerRadius_, 0.0, v4, Width, v6, 13.0);
  v8 = objc_msgSend(v7, sel_CGPath);

  objc_msgSend(v3, sel_setPath_, v8);
  v9 = sub_248A909BC();
  objc_msgSend(v9, sel_setFillRule_, *MEMORY[0x24BDE5988]);

  v10 = objc_msgSend(v1, sel_layer);
  v11 = objc_msgSend(v10, sel_mask);

  v12 = sub_248A909BC();
  v13 = v12;
  if (!v11)
  {

    goto LABEL_8;
  }
  sub_248A78B44(0, &qword_2577AEB60);
  v14 = v11;
  v15 = sub_248A9C700();

  if ((v15 & 1) == 0)
  {
LABEL_8:
    v16 = objc_msgSend(v1, sel_layer);
    v17 = sub_248A909BC();
    objc_msgSend(v16, sel_setMask_, v17);

    v18 = objc_msgSend(v1, sel_layer);
    objc_msgSend(v18, sel_setMasksToBounds_, 1);

  }
}

void sub_248A90CA0(uint64_t a1, CGFloat a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  id v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  char v40;
  id v41;
  id v42;
  id v43;
  char v44;
  id v45;
  uint64_t v46;
  char *v47;
  id v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  v3 = v2;
  v6 = OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter;
  if (*(double *)&v2[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter] == a2
    && *(_QWORD *)&v2[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection] == a1)
  {
    v7 = sub_248A909BC();
    objc_msgSend(v7, sel_frame);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v3, sel_bounds);
    v53.origin.x = v16;
    v53.origin.y = v17;
    v53.size.width = v18;
    v53.size.height = v19;
    v50.origin.x = v9;
    v50.origin.y = v11;
    v50.size.width = v13;
    v50.size.height = v15;
    if (CGRectEqualToRect(v50, v53))
      return;
  }
  v20 = sub_248A909BC();
  objc_msgSend(v20, sel_frame);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  objc_msgSend(v3, sel_bounds);
  v54.origin.x = v29;
  v54.origin.y = v30;
  v54.size.width = v31;
  v54.size.height = v32;
  v51.origin.x = v22;
  v51.origin.y = v24;
  v51.size.width = v26;
  v51.size.height = v28;
  if (!CGRectEqualToRect(v51, v54))
  {
    v33 = sub_248A909BC();
    objc_msgSend(v3, sel_bounds);
    objc_msgSend(v33, sel_setFrame_);

    v34 = sub_248A909BC();
    objc_msgSend(v34, sel_setFillRule_, *MEMORY[0x24BDE5988]);

  }
  v35 = objc_msgSend(v3, sel_layer);
  v36 = objc_msgSend(v35, sel_mask);

  v37 = sub_248A909BC();
  v38 = v37;
  if (v36)
  {
    sub_248A78B44(0, &qword_2577AEB60);
    v39 = v36;
    v40 = sub_248A9C700();

    if ((v40 & 1) != 0)
      goto LABEL_11;
  }
  else
  {

  }
  v41 = objc_msgSend(v3, sel_layer);
  v42 = sub_248A909BC();
  objc_msgSend(v41, sel_setMask_, v42);

  v43 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v43, sel_setMasksToBounds_, 1);

LABEL_11:
  if (a2 >= 22.75)
  {
    objc_msgSend(v3, sel_bounds);
    if (CGRectGetWidth(v52) + -13.0 + -13.0 + 3.25 >= a2)
    {
      v44 = 0;
    }
    else
    {
      v44 = 4 * (a1 == 2);
      if (a1 == 1)
        v44 = 2;
    }
  }
  else
  {
    if (a1 == 2)
      v44 = 3;
    else
      v44 = 0;
    if (a1 == 1)
      v44 = 1;
  }
  v3[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning] = v44;
  *(CGFloat *)&v3[v6] = a2;
  *(_QWORD *)&v3[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection] = a1;
  v45 = sub_248A909BC();
  v46 = sub_248A78B44(0, &qword_2577AEB58);
  v47 = v3;
  v48 = sub_248A83D94(v46, v47);

  v49 = objc_msgSend(v48, sel_CGPath);
  objc_msgSend(v45, sel_setPath_, v49);

}

_QWORD *sub_248A91078(char *a1)
{
  uint64_t v2;
  double v3;
  CGFloat Width;
  CGFloat MinY;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD *v24;
  uint64_t v25;
  __int128 *v26;
  __int128 *v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  CGFloat v62;
  double MaxY;
  double v64;
  double v65;
  double v66;
  CGFloat v67;
  double v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD *v78;
  uint64_t v79;
  char *v80;
  __int128 *v81;
  uint64_t v82;
  double v83;
  CGFloat v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  CGFloat v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  double v97;
  CGFloat v98;
  double v99;
  double v100;
  CGFloat v101;
  CGFloat v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  _QWORD *v106;
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;
  __int128 v111;
  uint64_t v112;
  __int128 v113;
  __int128 v114;
  _UNKNOWN **v115;
  __int128 v116;
  __int128 v117;
  _UNKNOWN **v118;
  __int128 v119;
  uint64_t v120;
  _UNKNOWN **v121;
  __int128 v122;
  uint64_t v123;
  _UNKNOWN **v124;
  __int128 v125;
  uint64_t v126;
  _UNKNOWN **v127;
  _QWORD v128[3];
  uint64_t v129;
  _UNKNOWN **v130;
  _QWORD v131[3];
  uint64_t v132;
  _UNKNOWN **v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  char v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  char v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  CGRect v152;
  CGRect v153;
  CGRect v154;
  CGRect v155;
  CGRect v156;
  CGRect v157;
  CGRect v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;

  v2 = OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection;
  if (*(_QWORD *)&a1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection] == 1)
    v3 = 13.0;
  else
    v3 = 0.0;
  objc_msgSend(a1, sel_bounds);
  Width = CGRectGetWidth(v148);
  objc_msgSend(a1, sel_bounds);
  v150.size.height = CGRectGetHeight(v149) + -13.0;
  v150.origin.x = 0.0;
  v150.origin.y = v3;
  v150.size.width = Width;
  MinY = CGRectGetMinY(v150);
  if (*(_QWORD *)&a1[v2] == 1)
  {
    v6 = OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter;
    v7 = *(double *)&a1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter];
    objc_msgSend(a1, sel_bounds);
    v8 = CGRectGetWidth(v151);
    objc_msgSend(a1, sel_bounds);
    v153.size.height = CGRectGetHeight(v152) + -13.0;
    v153.origin.x = 0.0;
    v153.origin.y = 13.0;
    v153.size.width = v8;
    v9 = CGRectGetMinY(v153);
    if (*(_QWORD *)&a1[v2] == 1)
      v10 = 13.0;
    else
      v10 = 0.0;
    v11 = v7 + -13.0;
    v12 = *(double *)&a1[v6] + 13.0;
    objc_msgSend(a1, sel_bounds);
    v13 = CGRectGetWidth(v154);
    objc_msgSend(a1, sel_bounds);
    v156.size.height = CGRectGetHeight(v155) + -13.0;
    v156.origin.x = 0.0;
    v156.origin.y = v10;
    v156.size.width = v13;
    v14 = CGRectGetMinY(v156);
    objc_msgSend(a1, sel_bounds);
    sub_248A8BEE4(a1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning], (uint64_t)&v134, v11, v9, v12, v14, v15, v16, v17, v18, 13.0, 13.0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_248A9E770;
    *(_QWORD *)(v19 + 56) = &type metadata for UpArrow;
    *(_QWORD *)(v19 + 64) = &off_2519C1A88;
    v20 = swift_allocObject();
    *(_QWORD *)(v19 + 32) = v20;
    v21 = v139;
    *(_OWORD *)(v20 + 80) = v138;
    *(_OWORD *)(v20 + 96) = v21;
    *(_BYTE *)(v20 + 112) = v140;
    v22 = v135;
    *(_OWORD *)(v20 + 16) = v134;
    *(_OWORD *)(v20 + 32) = v22;
    v23 = v137;
    *(_OWORD *)(v20 + 48) = v136;
    *(_OWORD *)(v20 + 64) = v23;
    v24 = sub_248A75538(v19);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    *((_QWORD *)&v142 + 1) = v25;
    *(_QWORD *)&v143 = &off_2519C0FF0;
    *(_QWORD *)&v141 = v24;
    sub_248A9233C((uint64_t)&v141, (uint64_t)v128);
    if (v129)
    {
      v26 = (__int128 *)v128;
LABEL_12:
      sub_248A8105C(v26, (uint64_t)v131);
      goto LABEL_16;
    }
    v133 = &off_2519C0FF0;
    v132 = v25;
    v131[0] = MEMORY[0x24BEE4AF8];
    v27 = (__int128 *)v128;
  }
  else
  {
    *(_QWORD *)&v143 = 0;
    v141 = 0u;
    v142 = 0u;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v134);
    if (*((_QWORD *)&v135 + 1))
    {
      v26 = &v134;
      goto LABEL_12;
    }
    v133 = &off_2519C0FF0;
    v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v131[0] = MEMORY[0x24BEE4AF8];
    v27 = &v134;
  }
  sub_248A92384((uint64_t)v27);
LABEL_16:
  sub_248A92384((uint64_t)&v141);
  v28 = OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning;
  if (a1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning] == 2)
  {
    *(_QWORD *)&v143 = 0;
    v141 = 0u;
    v142 = 0u;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v125);
    if (v126)
    {
LABEL_26:
      sub_248A8105C(&v125, (uint64_t)v128);
      goto LABEL_29;
    }
    v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v130 = &off_2519C0FF0;
    v129 = v44;
    v128[0] = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v125);
  }
  else
  {
    objc_msgSend(a1, sel_bounds);
    v29 = CGRectGetWidth(v157);
    if (*(_QWORD *)&a1[v2] == 1)
      v30 = 13.0;
    else
      v30 = 0.0;
    v31 = v29 + -13.0;
    objc_msgSend(a1, sel_bounds);
    v32 = CGRectGetWidth(v158);
    objc_msgSend(a1, sel_bounds);
    v160.size.height = CGRectGetHeight(v159) + -13.0;
    v160.origin.x = 0.0;
    v160.origin.y = v30;
    v160.size.width = v32;
    v33 = CGRectGetMinY(v160);
    objc_msgSend(a1, sel_bounds);
    v34 = CGRectGetWidth(v161);
    if (*(_QWORD *)&a1[v2] == 1)
      v35 = 13.0;
    else
      v35 = 0.0;
    v36 = v34 + -13.0;
    objc_msgSend(a1, sel_bounds);
    v37 = CGRectGetWidth(v162);
    objc_msgSend(a1, sel_bounds);
    v164.size.height = CGRectGetHeight(v163) + -13.0;
    v164.origin.x = 0.0;
    v164.origin.y = v35;
    v164.size.width = v37;
    v38 = CGRectGetMinY(v164) + 13.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v39 = swift_allocObject();
    *(_OWORD *)(v39 + 16) = xmmword_248A9EDA0;
    *(_QWORD *)(v39 + 56) = &type metadata for Line;
    *(_QWORD *)(v39 + 64) = &off_2519C1400;
    v40 = swift_allocObject();
    *(_QWORD *)(v39 + 32) = v40;
    *(double *)(v40 + 16) = v31;
    *(_BYTE *)(v40 + 24) = 0;
    *(CGFloat *)(v40 + 32) = v33;
    *(_BYTE *)(v40 + 40) = 0;
    *(_QWORD *)(v39 + 96) = &type metadata for Arc;
    *(_QWORD *)(v39 + 104) = &off_2519C13F0;
    v41 = swift_allocObject();
    *(_QWORD *)(v39 + 72) = v41;
    *(double *)(v41 + 16) = v36;
    *(CGFloat *)(v41 + 24) = v38;
    *(_OWORD *)(v41 + 32) = xmmword_248A9F9A0;
    *(_QWORD *)(v41 + 48) = 0;
    *(_BYTE *)(v41 + 56) = 1;
    v42 = sub_248A75538(v39);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    *((_QWORD *)&v142 + 1) = v43;
    *(_QWORD *)&v143 = &off_2519C0FF0;
    *(_QWORD *)&v141 = v42;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v125);
    if (v126)
      goto LABEL_26;
    v130 = &off_2519C0FF0;
    v129 = v43;
    v128[0] = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v125);
  }
LABEL_29:
  sub_248A92384((uint64_t)&v141);
  if (a1[v28] == 4)
  {
    *(_QWORD *)&v143 = 0;
    v141 = 0u;
    v142 = 0u;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v122);
    if (v123)
    {
LABEL_39:
      sub_248A8105C(&v122, (uint64_t)&v125);
      goto LABEL_42;
    }
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v127 = &off_2519C0FF0;
    v126 = v59;
    *(_QWORD *)&v125 = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v122);
  }
  else
  {
    objc_msgSend(a1, sel_bounds);
    v45 = CGRectGetWidth(v165);
    if (*(_QWORD *)&a1[v2] == 1)
      v46 = 13.0;
    else
      v46 = 0.0;
    objc_msgSend(a1, sel_bounds);
    v47 = CGRectGetWidth(v166);
    objc_msgSend(a1, sel_bounds);
    v168.size.height = CGRectGetHeight(v167) + -13.0;
    v168.origin.x = 0.0;
    v168.origin.y = v46;
    v168.size.width = v47;
    v48 = CGRectGetMaxY(v168) + -13.0;
    objc_msgSend(a1, sel_bounds);
    v49 = CGRectGetWidth(v169);
    if (*(_QWORD *)&a1[v2] == 1)
      v50 = 13.0;
    else
      v50 = 0.0;
    v51 = v49 + -13.0;
    objc_msgSend(a1, sel_bounds);
    v52 = CGRectGetWidth(v170);
    objc_msgSend(a1, sel_bounds);
    v172.size.height = CGRectGetHeight(v171) + -13.0;
    v172.origin.x = 0.0;
    v172.origin.y = v50;
    v172.size.width = v52;
    v53 = CGRectGetMaxY(v172) + -13.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_248A9EDA0;
    *(_QWORD *)(v54 + 56) = &type metadata for Line;
    *(_QWORD *)(v54 + 64) = &off_2519C1400;
    v55 = swift_allocObject();
    *(_QWORD *)(v54 + 32) = v55;
    *(CGFloat *)(v55 + 16) = v45;
    *(_BYTE *)(v55 + 24) = 0;
    *(double *)(v55 + 32) = v48;
    *(_BYTE *)(v55 + 40) = 0;
    *(_QWORD *)(v54 + 96) = &type metadata for Arc;
    *(_QWORD *)(v54 + 104) = &off_2519C13F0;
    v56 = swift_allocObject();
    *(_QWORD *)(v54 + 72) = v56;
    *(double *)(v56 + 16) = v51;
    *(CGFloat *)(v56 + 24) = v53;
    *(_OWORD *)(v56 + 32) = xmmword_248A9F9B0;
    *(_QWORD *)(v56 + 48) = 0x3FF921FB54442D18;
    *(_BYTE *)(v56 + 56) = 1;
    v57 = sub_248A75538(v54);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    *((_QWORD *)&v142 + 1) = v58;
    *(_QWORD *)&v143 = &off_2519C0FF0;
    *(_QWORD *)&v141 = v57;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v122);
    if (v123)
      goto LABEL_39;
    v127 = &off_2519C0FF0;
    v126 = v58;
    *(_QWORD *)&v125 = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v122);
  }
LABEL_42:
  sub_248A92384((uint64_t)&v141);
  if (*(_QWORD *)&a1[v2] == 2)
  {
    v60 = OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter;
    v61 = *(double *)&a1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter];
    objc_msgSend(a1, sel_bounds);
    v62 = CGRectGetWidth(v173);
    objc_msgSend(a1, sel_bounds);
    v175.size.height = CGRectGetHeight(v174) + -13.0;
    v175.origin.x = 0.0;
    v175.origin.y = 0.0;
    v175.size.width = v62;
    MaxY = CGRectGetMaxY(v175);
    if (*(_QWORD *)&a1[v2] == 1)
      v64 = 13.0;
    else
      v64 = 0.0;
    v65 = v61 + 13.0;
    v66 = *(double *)&a1[v60] + -13.0;
    objc_msgSend(a1, sel_bounds);
    v67 = CGRectGetWidth(v176);
    objc_msgSend(a1, sel_bounds);
    v178.size.height = CGRectGetHeight(v177) + -13.0;
    v178.origin.x = 0.0;
    v178.origin.y = v64;
    v178.size.width = v67;
    v68 = CGRectGetMaxY(v178);
    objc_msgSend(a1, sel_bounds);
    sub_248A8C0B0(a1[v28], (uint64_t)&v141, v65, MaxY, v66, v68, v69, v70, v71, v72, 13.0, 13.0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v73 = swift_allocObject();
    *(_OWORD *)(v73 + 16) = xmmword_248A9E770;
    *(_QWORD *)(v73 + 56) = &type metadata for DownArrow;
    *(_QWORD *)(v73 + 64) = &off_2519C1A98;
    v74 = swift_allocObject();
    *(_QWORD *)(v73 + 32) = v74;
    v75 = v146;
    *(_OWORD *)(v74 + 80) = v145;
    *(_OWORD *)(v74 + 96) = v75;
    *(_BYTE *)(v74 + 112) = v147;
    v76 = v142;
    *(_OWORD *)(v74 + 16) = v141;
    *(_OWORD *)(v74 + 32) = v76;
    v77 = v144;
    *(_OWORD *)(v74 + 48) = v143;
    *(_OWORD *)(v74 + 64) = v77;
    v78 = sub_248A75538(v73);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v120 = v79;
    v121 = &off_2519C0FF0;
    *(_QWORD *)&v119 = v78;
    sub_248A9233C((uint64_t)&v119, (uint64_t)&v116);
    if (*((_QWORD *)&v117 + 1))
    {
      sub_248A8105C(&v116, (uint64_t)&v122);
    }
    else
    {
      v124 = &off_2519C0FF0;
      v123 = v79;
      *(_QWORD *)&v122 = MEMORY[0x24BEE4AF8];
      sub_248A92384((uint64_t)&v116);
    }
    v80 = "@(#)PROGRAM:TipKitLegacy  PROJECT:Tips-765.2\n" + 16;
    v81 = &v119;
  }
  else
  {
    *(_QWORD *)&v143 = 0;
    v141 = 0u;
    v142 = 0u;
    sub_248A9233C((uint64_t)&v141, (uint64_t)&v119);
    if (v120)
    {
      sub_248A8105C(&v119, (uint64_t)&v122);
    }
    else
    {
      v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
      v124 = &off_2519C0FF0;
      v123 = v82;
      *(_QWORD *)&v122 = MEMORY[0x24BEE4AF8];
      sub_248A92384((uint64_t)&v119);
    }
    v80 = "itLegacy  PROJECT:Tips-765.2\n";
    v81 = &v141;
  }
  sub_248A92384((uint64_t)v81);
  if (a1[v28] == 3)
  {
    v118 = 0;
    v116 = 0u;
    v117 = 0u;
    sub_248A9233C((uint64_t)&v116, (uint64_t)&v113);
    if (*((_QWORD *)&v114 + 1))
    {
LABEL_64:
      sub_248A8105C(&v113, (uint64_t)&v119);
      goto LABEL_67;
    }
    v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    v121 = &off_2519C0FF0;
    v120 = v94;
    *(_QWORD *)&v119 = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v113);
  }
  else
  {
    if (*(_QWORD *)&a1[v2] == 1)
      v83 = 13.0;
    else
      v83 = 0.0;
    objc_msgSend(a1, sel_bounds);
    v84 = CGRectGetWidth(v179);
    objc_msgSend(a1, sel_bounds);
    v181.size.height = CGRectGetHeight(v180) + -13.0;
    v181.origin.x = 0.0;
    v181.origin.y = v83;
    v181.size.width = v84;
    v85 = CGRectGetMaxY(v181);
    if (*(_QWORD *)&a1[v2] == 1)
      v86 = 13.0;
    else
      v86 = 0.0;
    objc_msgSend(a1, sel_bounds);
    v87 = CGRectGetWidth(v182);
    objc_msgSend(a1, sel_bounds);
    v184.size.height = CGRectGetHeight(v183) + -13.0;
    v184.origin.x = 0.0;
    v184.origin.y = v86;
    v184.size.width = v87;
    v88 = CGRectGetMaxY(v184) + -13.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v89 = swift_allocObject();
    *(_OWORD *)(v89 + 16) = *((_OWORD *)v80 + 218);
    *(_QWORD *)(v89 + 56) = &type metadata for Line;
    *(_QWORD *)(v89 + 64) = &off_2519C1400;
    v90 = swift_allocObject();
    *(_QWORD *)(v89 + 32) = v90;
    *(_QWORD *)(v90 + 16) = 0x402A000000000000;
    *(_BYTE *)(v90 + 24) = 0;
    *(CGFloat *)(v90 + 32) = v85;
    *(_BYTE *)(v90 + 40) = 0;
    *(_QWORD *)(v89 + 96) = &type metadata for Arc;
    *(_QWORD *)(v89 + 104) = &off_2519C13F0;
    v91 = swift_allocObject();
    *(_QWORD *)(v89 + 72) = v91;
    *(_QWORD *)(v91 + 16) = 0x402A000000000000;
    *(CGFloat *)(v91 + 24) = v88;
    *(_OWORD *)(v91 + 32) = xmmword_248A9F9C0;
    *(_QWORD *)(v91 + 48) = 0x400921FB54442D18;
    *(_BYTE *)(v91 + 56) = 1;
    v92 = sub_248A75538(v89);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    *((_QWORD *)&v117 + 1) = v93;
    v118 = &off_2519C0FF0;
    *(_QWORD *)&v116 = v92;
    sub_248A9233C((uint64_t)&v116, (uint64_t)&v113);
    if (*((_QWORD *)&v114 + 1))
      goto LABEL_64;
    v121 = &off_2519C0FF0;
    v120 = v93;
    *(_QWORD *)&v119 = MEMORY[0x24BEE4AF8];
    sub_248A92384((uint64_t)&v113);
  }
LABEL_67:
  sub_248A92384((uint64_t)&v116);
  if (a1[v28] == 1)
  {
    v115 = 0;
    v113 = 0u;
    v114 = 0u;
    sub_248A9233C((uint64_t)&v113, (uint64_t)&v111);
    if (!v112)
    {
      v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
      v118 = &off_2519C0FF0;
      v96 = MEMORY[0x24BEE4AF8];
      *((_QWORD *)&v117 + 1) = v95;
LABEL_79:
      *(_QWORD *)&v116 = v96;
      sub_248A92384((uint64_t)&v111);
      goto LABEL_80;
    }
  }
  else
  {
    if (*(_QWORD *)&a1[v2] == 1)
      v97 = 13.0;
    else
      v97 = 0.0;
    objc_msgSend(a1, sel_bounds);
    v98 = CGRectGetWidth(v185);
    objc_msgSend(a1, sel_bounds);
    v187.size.height = CGRectGetHeight(v186) + -13.0;
    v187.origin.x = 0.0;
    v187.origin.y = v97;
    v187.size.width = v98;
    v99 = CGRectGetMinY(v187) + 13.0;
    if (*(_QWORD *)&a1[v2] == 1)
      v100 = 13.0;
    else
      v100 = 0.0;
    objc_msgSend(a1, sel_bounds);
    v101 = CGRectGetWidth(v188);
    objc_msgSend(a1, sel_bounds);
    v190.size.height = CGRectGetHeight(v189) + -13.0;
    v190.origin.x = 0.0;
    v190.origin.y = v100;
    v190.size.width = v101;
    v102 = CGRectGetMinY(v190) + 13.0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
    v103 = swift_allocObject();
    *(_OWORD *)(v103 + 16) = *((_OWORD *)v80 + 218);
    *(_QWORD *)(v103 + 56) = &type metadata for Line;
    *(_QWORD *)(v103 + 64) = &off_2519C1400;
    v104 = swift_allocObject();
    *(_QWORD *)(v103 + 32) = v104;
    *(_QWORD *)(v104 + 16) = 0;
    *(_BYTE *)(v104 + 24) = 0;
    *(double *)(v104 + 32) = v99;
    *(_BYTE *)(v104 + 40) = 0;
    *(_QWORD *)(v103 + 96) = &type metadata for Arc;
    *(_QWORD *)(v103 + 104) = &off_2519C13F0;
    v105 = swift_allocObject();
    *(_QWORD *)(v103 + 72) = v105;
    *(_QWORD *)(v105 + 16) = 0x402A000000000000;
    *(CGFloat *)(v105 + 24) = v102;
    *(_OWORD *)(v105 + 32) = xmmword_248A9F9D0;
    *(_QWORD *)(v105 + 48) = 0x4012D97C7F3321D2;
    *(_BYTE *)(v105 + 56) = 1;
    v106 = sub_248A75538(v103);
    swift_setDeallocating();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
    swift_arrayDestroy();
    swift_deallocClassInstance();
    v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA38);
    *((_QWORD *)&v114 + 1) = v107;
    v115 = &off_2519C0FF0;
    *(_QWORD *)&v113 = v106;
    sub_248A9233C((uint64_t)&v113, (uint64_t)&v111);
    if (!v112)
    {
      v118 = &off_2519C0FF0;
      v96 = MEMORY[0x24BEE4AF8];
      *((_QWORD *)&v117 + 1) = v107;
      goto LABEL_79;
    }
  }
  sub_248A8105C(&v111, (uint64_t)&v116);
LABEL_80:
  sub_248A92384((uint64_t)&v113);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA28);
  v108 = swift_allocObject();
  *(_OWORD *)(v108 + 16) = xmmword_248A9F9E0;
  *(_QWORD *)(v108 + 56) = &type metadata for Move;
  *(_QWORD *)(v108 + 64) = &off_2519C13E0;
  *(_QWORD *)(v108 + 32) = 0x402A000000000000;
  *(CGFloat *)(v108 + 40) = MinY;
  sub_248A756C8((uint64_t)v131, v108 + 72);
  sub_248A756C8((uint64_t)v128, v108 + 112);
  sub_248A756C8((uint64_t)&v125, v108 + 152);
  sub_248A756C8((uint64_t)&v122, v108 + 192);
  sub_248A756C8((uint64_t)&v119, v108 + 232);
  sub_248A756C8((uint64_t)&v116, v108 + 272);
  *(_QWORD *)(v108 + 336) = &type metadata for Close;
  *(_QWORD *)(v108 + 344) = &off_2519C13D0;
  v109 = sub_248A75538(v108);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA30);
  swift_arrayDestroy();
  swift_deallocClassInstance();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v116);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v119);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v122);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v125);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v131);
  return v109;
}

id sub_248A92238(void *a1)
{
  _BYTE *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowDirection] = -1;
  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowCenter] = 0;
  v1[OBJC_IVAR___TPKTipContentAnnotationBubbleView_arrowPinning] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentAnnotationBubbleView____lazy_storage___maskLayer] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentAnnotationBubbleView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_248A922DC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentAnnotationBubbleView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPKTipContentAnnotationBubbleView()
{
  return objc_opt_self();
}

uint64_t sub_248A9233C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A92384(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_248A923C4()
{
  return swift_deallocObject();
}

uint64_t sub_248A923D4()
{
  return swift_deallocObject();
}

uint64_t sub_248A923E4()
{
  return swift_deallocObject();
}

uint64_t destroy for TipBodyActionsBuilder(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(a1 + 16))
    swift_release();

  return swift_release();
}

_QWORD *initializeWithCopy for TipBodyActionsBuilder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v8 = (void *)a2[4];
  v9 = a2[5];
  a1[4] = v8;
  a1[5] = v9;
  v10 = v8;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for TipBodyActionsBuilder(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  if (!a1[2])
  {
    if (v4)
    {
      v6 = a2[3];
      a1[2] = v4;
      a1[3] = v6;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_retain();
  swift_release();
LABEL_8:
  v7 = (void *)a1[4];
  v8 = (void *)a2[4];
  a1[4] = v8;
  v9 = v8;

  a1[5] = a2[5];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for TipBodyActionsBuilder(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v6;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  swift_release();
LABEL_8:

  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TipBodyActionsBuilder(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipBodyActionsBuilder(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipBodyActionsBuilder()
{
  return &type metadata for TipBodyActionsBuilder;
}

uint64_t sub_248A926EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t *v20;
  id v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48[8];
  uint64_t v49;

  v46 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB78);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB80);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB88);
  v8 = MEMORY[0x24BDAC7A8](v47);
  v44 = (uint64_t)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v45 = (uint64_t)&v40 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v40 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (uint64_t *)((char *)&v40 - v19);
  v21 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v21, sel_scale);
  v23 = v22;

  sub_248A93908(v1 + 8, (uint64_t)v48, &qword_2577AEB90);
  sub_248A93908((uint64_t)v48, (uint64_t)&v49, &qword_2577AEB90);
  if (v49 && *(_QWORD *)(v49 + 16))
  {
    sub_248A7FEC4(v49 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80)), (uint64_t)v20, &qword_2577AE088);
    v24 = *(int *)(v11 + 48);
    v25 = (uint64_t *)v18;
    v42 = v2;
    v43 = v18;
    v26 = &v18[v24];
    v27 = (char *)v20 + v24;
    v28 = *v20;
    v29 = v20[1];
    *v25 = v28;
    v25[1] = v29;
    v30 = sub_248A9BF80();
    v41 = v4;
    v31 = *(_QWORD *)(v30 - 8);
    (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v26, v27, v30);
    swift_bridgeObjectRetain();
    v32 = sub_248A9C1CC();
    v33 = (char *)v15 + *(int *)(v11 + 48);
    *v15 = v28;
    v15[1] = v29;
    (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v33, v26, v30);
    *(_QWORD *)v7 = v32;
    *((_QWORD *)v7 + 1) = 0;
    v7[16] = 0;
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEBA8);
    sub_248A92AE0(v1, v15, (uint64_t)&v7[*(int *)(v34 + 44)], v23);
    sub_248A71634((uint64_t)v15, &qword_2577AE088);
    v35 = sub_248A9C544();
    v36 = v44;
    sub_248A94374(0.0, 1, 0.0, 1, INFINITY, 0, 44.0, 0, v44, 44.0, 0, 0.0, 1, v35, v37);
    sub_248A71634((uint64_t)v7, &qword_2577AEB80);
    v38 = v45;
    sub_248A93908(v36, v45, &qword_2577AEB88);
    sub_248A7FEC4(v38, (uint64_t)v41, &qword_2577AEB88);
    swift_storeEnumTagMultiPayload();
    sub_248A93884();
    sub_248A9C274();
    sub_248A71634(v38, &qword_2577AEB88);
    return sub_248A71634((uint64_t)v43, &qword_2577AE088);
  }
  else
  {
    swift_storeEnumTagMultiPayload();
    sub_248A93884();
    return sub_248A9C274();
  }
}

uint64_t sub_248A92AE0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, char *, uint64_t);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  id v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  _OWORD v81[8];
  uint64_t v82;
  _OWORD v83[8];
  uint64_t v84;

  v8 = sub_248A9C0D0();
  v9 = *(_QWORD *)(v8 - 8);
  v64 = v8;
  v65 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v62 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (uint64_t *)((char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEBB0);
  v63 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59);
  v56 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEBB8);
  v60 = *(_QWORD *)(v15 - 8);
  v61 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v57 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v58 = (char *)&v54 - v18;
  v19 = objc_msgSend((id)objc_opt_self(), sel_separatorColor);
  v20 = MEMORY[0x2495A3484](v19);
  v21 = *(void **)(a1 + 32);
  v22 = v21;
  v55 = v22;
  v23 = sub_248A9C544();
  sub_248A943CC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v72, 0.0, 1, 1.0 / a4, 0, v23, v24, v20, 0, 1, v21);

  swift_release();
  sub_248A93908(a1, (uint64_t)&v71, &qword_2577AEBC0);
  sub_248A93908(a1 + 8, (uint64_t)&v70, &qword_2577AEB90);
  v25 = *(_QWORD *)(a1 + 16);
  v69 = *(_QWORD *)(a1 + 40);
  v26 = (_OWORD *)swift_allocObject();
  v27 = *(_OWORD *)(a1 + 16);
  v26[1] = *(_OWORD *)a1;
  v26[2] = v27;
  v26[3] = *(_OWORD *)(a1 + 32);
  v28 = *(int *)(v11 + 48);
  v29 = (char *)v13 + v28;
  v30 = (char *)a2 + v28;
  v31 = *a2;
  v32 = a2[1];
  *v13 = v31;
  v13[1] = v32;
  v33 = sub_248A9BF80();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 16))(v29, v30, v33);
  v66 = v13;
  v67 = a1;
  v68 = a4;
  v34 = v55;
  sub_248A939AC((uint64_t)&v71);
  sub_248A939AC((uint64_t)&v70);
  sub_248A729F8(v25);
  sub_248A939D4((uint64_t)&v69);
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEBC8);
  sub_248A939FC();
  v35 = v56;
  sub_248A9C4F0();
  sub_248A71634((uint64_t)v13, &qword_2577AE088);
  v36 = v62;
  sub_248A9C0C4();
  sub_248A7F034(&qword_2577AEC18, &qword_2577AEBB0, MEMORY[0x24BDF43B0]);
  sub_248A93B70();
  v37 = v57;
  v38 = v59;
  v39 = v64;
  sub_248A9C3C4();
  (*(void (**)(char *, uint64_t))(v65 + 8))(v36, v39);
  (*(void (**)(char *, uint64_t))(v63 + 8))(v35, v38);
  v41 = v60;
  v40 = v61;
  v42 = v58;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v58, v37, v61);
  v43 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v43(v37, v42, v40);
  v44 = v77;
  v81[6] = v78;
  v81[7] = v79;
  v45 = v74;
  v46 = v75;
  v81[2] = v74;
  v81[3] = v75;
  v47 = v76;
  v81[4] = v76;
  v81[5] = v77;
  v48 = v73;
  v49 = v72;
  v81[0] = v72;
  v81[1] = v73;
  v50 = v79;
  *(_OWORD *)(a3 + 96) = v78;
  *(_OWORD *)(a3 + 112) = v50;
  *(_OWORD *)(a3 + 32) = v45;
  *(_OWORD *)(a3 + 48) = v46;
  *(_OWORD *)(a3 + 64) = v47;
  *(_OWORD *)(a3 + 80) = v44;
  v82 = v80;
  *(_QWORD *)(a3 + 128) = v80;
  *(_OWORD *)a3 = v49;
  *(_OWORD *)(a3 + 16) = v48;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEC28);
  v43((char *)(a3 + *(int *)(v51 + 48)), v37, v40);
  sub_248A93BB8((uint64_t)v81);
  v52 = *(void (**)(char *, uint64_t))(v41 + 8);
  v52(v42, v40);
  v52(v37, v40);
  v83[6] = v78;
  v83[7] = v79;
  v84 = v80;
  v83[2] = v74;
  v83[3] = v75;
  v83[4] = v76;
  v83[5] = v77;
  v83[0] = v72;
  v83[1] = v73;
  return sub_248A93BEC((uint64_t)v83);
}

void sub_248A92FB8(unint64_t *a1)
{
  void (*v1)(void);
  unint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  id v6;
  id v7;

  v1 = (void (*)(void))a1[2];
  if (!v1)
    return;
  v2 = *a1;
  if (!*a1)
  {
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_248A9C7B4())
      goto LABEL_5;
    goto LABEL_11;
  }
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_5:
  if ((v2 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x2495A379C](0, v2);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v4 = *(id *)(v2 + 32);
LABEL_8:
    v6 = v4;
    swift_bridgeObjectRelease();
    v5 = v6;
LABEL_13:
    v7 = v5;
    v1();

    return;
  }
  __break(1u);
}

__n128 sub_248A930A8@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t KeyPath;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 result;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  _OWORD v38[11];
  _QWORD v39[3];
  char v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;

  v37 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(int *)(v8 + 48);
  v12 = (char *)v10 + v11;
  v36 = (char *)v10 + v11;
  v13 = (char *)a1 + v11;
  v14 = *a1;
  v15 = a1[1];
  *v10 = v14;
  v10[1] = v15;
  v16 = sub_248A9BF80();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v12, v13, v16);
  *(_QWORD *)&v38[0] = v14;
  *((_QWORD *)&v38[0] + 1) = v15;
  sub_248A7D434();
  swift_bridgeObjectRetain();
  v18 = sub_248A9C394();
  v20 = v19;
  LOBYTE(v14) = v21 & 1;
  (*(void (**)(char *, uint64_t))(v17 + 8))(v36, v16);
  v39[0] = *(_QWORD *)(v37 + 40);
  *(_QWORD *)&v38[0] = v39[0];
  swift_retain();
  v22 = sub_248A9C34C();
  v24 = v23;
  v26 = v25;
  v37 = v25;
  LOBYTE(v16) = v27 & 1;
  sub_248A71624(v18, v20, v14);
  swift_bridgeObjectRelease();
  sub_248A93C1C((uint64_t)v39);
  KeyPath = swift_getKeyPath();
  v29 = swift_getKeyPath();
  v39[1] = v22;
  v39[2] = v24;
  v40 = v16;
  v41 = v26;
  v42 = KeyPath;
  v43 = 1;
  v44 = v29;
  v45 = 0x3FE0000000000000;
  sub_248A9C550();
  sub_248A945A8(0.0, 1, 0.0, 1, INFINITY, 0, -1.0 / a4 + 44.0, 0, v38, 0.0, 1, 0.0, 1);
  sub_248A71624(v22, v24, v16);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v30 = v38[9];
  *(_OWORD *)(a3 + 128) = v38[8];
  *(_OWORD *)(a3 + 144) = v30;
  *(_OWORD *)(a3 + 160) = v38[10];
  v31 = v38[5];
  *(_OWORD *)(a3 + 64) = v38[4];
  *(_OWORD *)(a3 + 80) = v31;
  v32 = v38[7];
  *(_OWORD *)(a3 + 96) = v38[6];
  *(_OWORD *)(a3 + 112) = v32;
  v33 = v38[1];
  *(_OWORD *)a3 = v38[0];
  *(_OWORD *)(a3 + 16) = v33;
  result = (__n128)v38[3];
  *(_OWORD *)(a3 + 32) = v38[2];
  *(__n128 *)(a3 + 48) = result;
  return result;
}

uint64_t sub_248A93330@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248A9C118();
  *a1 = result & 1;
  return result;
}

uint64_t sub_248A9335C()
{
  return sub_248A9C124();
}

uint64_t sub_248A93380@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248A9C130();
  *a1 = v3;
  return result;
}

uint64_t sub_248A933A8()
{
  return sub_248A9C13C();
}

uint64_t sub_248A933CC@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X3>, unint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t *v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v10 = sub_248A9BF80();
  v11 = *(_QWORD *)(v10 - 8);
  v58 = v10;
  v59 = v11;
  MEMORY[0x24BDAC7A8](v10);
  v57 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE7A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEB70);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (uint64_t *)((char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE088);
  v60 = *(_QWORD *)(v56 - 8);
  v19 = MEMORY[0x24BDAC7A8](v56);
  v55 = (uint64_t)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v52 = (uint64_t)&v47 - v21;
  if (!a1)
  {
    swift_release();
    sub_248A72A78((uint64_t)a3);
    result = swift_bridgeObjectRelease();
    a4 = 0;
    v44 = 0;
    v45 = 0;
    v46 = 0;
LABEL_26:
    *a5 = a1;
    a5[1] = (unint64_t)a4;
    a5[2] = v44;
    a5[3] = (unint64_t)v45;
    a5[4] = 0;
    a5[5] = v46;
    return result;
  }
  v54 = a1;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain_n();
    a1 = v54;
    v22 = sub_248A9C7B4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain_n();
  }
  v48 = a2;
  v49 = (uint64_t)a3;
  v50 = a4;
  v51 = a5;
  if (!v22)
  {
    a4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
    result = swift_bridgeObjectRelease_n();
    if (a4[2])
    {
      v45 = v50;
      a5 = v51;
      v46 = v48;
      v44 = v49;
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_release();
      sub_248A72A78(v49);
      result = swift_bridgeObjectRelease();
      a1 = 0;
      a4 = 0;
      v44 = 0;
      v45 = 0;
      v46 = 0;
      a5 = v51;
    }
    goto LABEL_26;
  }
  v53 = a1 & 0xC000000000000001;
  a4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  a2 = 4;
  while (1)
  {
    a5 = (unint64_t *)(a2 - 4);
    if (v53)
      v23 = (id)MEMORY[0x2495A379C](a2 - 4, a1);
    else
      v23 = *(id *)(a1 + 8 * a2);
    a3 = v23;
    v24 = a2 - 3;
    if (__OFADD__(a5, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    v25 = a4;
    v26 = objc_msgSend(v23, sel_text);
    if (!v26)
      break;
    v27 = v26;
    v28 = sub_248A9C5C8();
    v30 = v29;

    *v18 = v28;
    v18[1] = v30;
    v31 = objc_msgSend(a3, sel_URL);
    if (!v31)
      goto LABEL_30;
    v32 = v31;
    v33 = v57;
    sub_248A9BF74();

    v34 = v59;
    v35 = *(void (**)(char *, char *, uint64_t))(v59 + 32);
    v36 = v33;
    v37 = v58;
    v35(v15, v36, v58);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v15, 0, 1, v37);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48))(v15, 1, v37);
    if ((_DWORD)result == 1)
      goto LABEL_31;
    v39 = v56;
    v35((char *)v18 + *(int *)(v56 + 48), v15, v37);
    v40 = v60;
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v18, 0, 1, v39);

    a4 = v25;
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v40 + 48))(v18, 1, v39) == 1)
    {
      sub_248A71634((uint64_t)v18, &qword_2577AEB70);
    }
    else
    {
      v41 = v52;
      sub_248A93908((uint64_t)v18, v52, &qword_2577AE088);
      sub_248A93908(v41, v55, &qword_2577AE088);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        a4 = (_QWORD *)sub_248A751C4(0, v25[2] + 1, 1, v25);
      v43 = a4[2];
      v42 = a4[3];
      if (v43 >= v42 >> 1)
        a4 = (_QWORD *)sub_248A751C4(v42 > 1, v43 + 1, 1, a4);
      a4[2] = v43 + 1;
      sub_248A93908(v55, (uint64_t)a4+ ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80))+ *(_QWORD *)(v60 + 72) * v43, &qword_2577AE088);
    }
    a1 = v54;
    ++a2;
    if (v24 == v22)
      goto LABEL_23;
  }
  __break(1u);
LABEL_30:
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v59 + 56))(v15, 1, 1, v58);
LABEL_31:
  __break(1u);
  return result;
}

unint64_t sub_248A93884()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEB98;
  if (!qword_2577AEB98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEB88);
    v2[0] = sub_248A7F034(&qword_2577AEBA0, &qword_2577AEB80, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEB98);
  }
  return result;
}

uint64_t sub_248A93908(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_248A9394C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_248A93998()
{
  uint64_t v0;

  sub_248A92FB8((unint64_t *)(v0 + 16));
}

double sub_248A939A0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_248A930A8((uint64_t *)*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1, *(double *)(v1 + 32)).n128_u64[0];
  return result;
}

uint64_t sub_248A939AC(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248A939D4(uint64_t a1)
{
  swift_retain();
  return a1;
}

unint64_t sub_248A939FC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEBD0;
  if (!qword_2577AEBD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEBC8);
    v2[0] = sub_248A93A68();
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEBD0);
  }
  return result;
}

unint64_t sub_248A93A68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEBD8;
  if (!qword_2577AEBD8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEBE0);
    v2[0] = sub_248A93AEC();
    v2[1] = sub_248A7F034(&qword_2577AEC08, &qword_2577AEC10, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEBD8);
  }
  return result;
}

unint64_t sub_248A93AEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2577AEBE8;
  if (!qword_2577AEBE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEBF0);
    v2 = sub_248A7F034(&qword_2577AEBF8, &qword_2577AEC00, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2577AEBE8);
  }
  return result;
}

unint64_t sub_248A93B70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2577AEC20;
  if (!qword_2577AEC20)
  {
    v1 = sub_248A9C0D0();
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED858], v1);
    atomic_store(result, (unint64_t *)&qword_2577AEC20);
  }
  return result;
}

uint64_t sub_248A93BB8(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 16);
  swift_retain();
  return a1;
}

uint64_t sub_248A93BEC(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 16);
  swift_release();

  return a1;
}

uint64_t sub_248A93C1C(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_248A93C44@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_248A9C118();
  *a1 = result & 1;
  return result;
}

uint64_t sub_248A93C70()
{
  return sub_248A9C124();
}

uint64_t sub_248A93C94@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_248A9C130();
  *a1 = v3;
  return result;
}

uint64_t sub_248A93CBC()
{
  return sub_248A9C13C();
}

uint64_t *sub_248A93CE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248A9C1C0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
  }
  swift_retain();
  return a1;
}

uint64_t sub_248A93DC0(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_248A9C1C0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  return swift_release();
}

_QWORD *sub_248A93E34(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_248A9C1C0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain();
  return a1;
}

_QWORD *sub_248A93EEC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  if (a1 != a2)
  {
    sub_248A71634((uint64_t)a1, &qword_2577AEA80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_248A9C1C0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_retain();
  swift_release();
  return a1;
}

char *sub_248A93FD0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_248A9C1C0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  return a1;
}

char *sub_248A94078(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_248A71634((uint64_t)a1, &qword_2577AEA80);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_248A9C1C0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v12 = *(_QWORD *)v10;
  v11 = *((_QWORD *)v10 + 1);
  *(_QWORD *)v9 = v12;
  *((_QWORD *)v9 + 1) = v11;
  swift_release();
  return a1;
}

uint64_t sub_248A94148()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_248A94154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEC30);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_248A941D8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248A941E4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEC30);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for TipBodyView()
{
  uint64_t result;

  result = qword_2577AEC90;
  if (!qword_2577AEC90)
    return swift_getSingletonMetadata();
  return result;
}

void sub_248A942A0()
{
  unint64_t v0;

  sub_248A94310();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_248A94310()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2577AECA0)
  {
    sub_248A9C1C0();
    v0 = sub_248A9C034();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2577AECA0);
  }
}

uint64_t sub_248A94364()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_248A94374@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_248A9474C(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_2577AEB80, &qword_2577AEB88).n128_u64[0];
  return result;
}

uint64_t sub_248A943CC@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18, void *a19)
{
  void *v20;
  void *v29;
  id v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v20 = a19;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248A9C6D0();
    v29 = (void *)sub_248A9C2A4();
    sub_248A9BF98();

    v20 = a19;
  }
  sub_248A9C0DC();
  *(_OWORD *)(a9 + 72) = v35;
  *(_OWORD *)(a9 + 88) = v36;
  *(_OWORD *)(a9 + 104) = v37;
  *(_OWORD *)(a9 + 120) = v38;
  *(_OWORD *)(a9 + 24) = v32;
  *(_OWORD *)(a9 + 40) = v33;
  *(_QWORD *)a9 = a16;
  *(_BYTE *)(a9 + 8) = a17 & 1;
  *(_BYTE *)(a9 + 9) = a18 & 1;
  *(_QWORD *)(a9 + 16) = v20;
  *(_OWORD *)(a9 + 56) = v34;
  v30 = v20;
  return swift_retain();
}

uint64_t sub_248A945A8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248A9C6D0();
    v23 = (void *)sub_248A9C2A4();
    sub_248A9BF98();

  }
  sub_248A9C0DC();
  v24 = v13[1];
  *a9 = *v13;
  a9[1] = v24;
  v25 = v13[3];
  a9[2] = v13[2];
  a9[3] = v25;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[4] = v27;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_248A983E4((uint64_t)v13);
}

__n128 sub_248A9474C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t *v19;
  void *v28;
  _OWORD *v29;
  __n128 result;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __n128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v19 = a17;
  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248A9C6D0();
    v28 = (void *)sub_248A9C2A4();
    sub_248A9BF98();

    v19 = a17;
  }
  sub_248A9C0DC();
  sub_248A7FEC4(v17, a9, a16);
  v29 = (_OWORD *)(a9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v19) + 36));
  v29[4] = v35;
  v29[5] = v36;
  v29[6] = v37;
  *v29 = v31;
  v29[1] = v32;
  result = v34;
  v29[2] = v33;
  v29[3] = v34;
  return result;
}

uint64_t sub_248A94918@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, _OWORD *a9@<X8>, double a10, char a11, double a12, char a13)
{
  _OWORD *v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248A9C6D0();
    v23 = (void *)sub_248A9C2A4();
    sub_248A9BF98();

  }
  sub_248A9C0DC();
  v24 = v13[3];
  a9[2] = v13[2];
  a9[3] = v24;
  v25 = v13[4];
  v26 = v13[1];
  *a9 = *v13;
  a9[1] = v26;
  a9[8] = v31;
  a9[9] = v32;
  a9[10] = v33;
  a9[11] = v34;
  a9[4] = v25;
  a9[5] = v28;
  a9[6] = v29;
  a9[7] = v30;
  return sub_248A989F0((uint64_t)v13);
}

uint64_t *sub_248A94AC4@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v13;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  if ((a2 & 1) != 0)
    a1 = -INFINITY;
  if ((a4 & 1) != 0)
    a3 = a1;
  if ((a6 & 1) != 0)
    a5 = a3;
  if (a1 > a3 || a3 > a5)
    goto LABEL_22;
  if ((a8 & 1) != 0)
    a7 = -INFINITY;
  if ((a11 & 1) != 0)
    a10 = a7;
  if ((a13 & 1) != 0)
    a12 = a10;
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_248A9C6D0();
    v23 = (void *)sub_248A9C2A4();
    sub_248A9BF98();

  }
  sub_248A9C0DC();
  v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 120) = v30;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 152) = v32;
  *(_OWORD *)(a9 + 168) = v33;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 88) = v28;
  *(_QWORD *)(a9 + 64) = *(_QWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 104) = v29;
  return sub_248A98A64((uint64_t *)v13);
}

uint64_t sub_248A94C7C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, _QWORD, uint64_t);
  uint64_t result;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, char *, uint64_t);
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  void (*v41)(char *, uint64_t);
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  char *v67;
  _QWORD *v68;
  uint64_t v69;
  __int128 v70;

  v66 = a1;
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECD0);
  v1 = MEMORY[0x24BDAC7A8](v61);
  v3 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v53 = (char *)&v50 - v4;
  v5 = sub_248A9C0AC();
  v68 = *(_QWORD **)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v67 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v50 - v8;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECD8);
  v10 = MEMORY[0x24BDAC7A8](v63);
  v52 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v62 = (uint64_t)&v50 - v12;
  v13 = sub_248A9C298();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECE0);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (uint64_t *)((char *)&v50 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECE8);
  v59 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v21 = (char *)&v50 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECF0);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v55 = (char *)&v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AECF8);
  MEMORY[0x24BDAC7A8](v64);
  v65 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v19 = sub_248A9C538();
  v19[1] = v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED00);
  sub_248A95288(v69, (uint64_t)v19 + *(int *)(v25 + 44));
  sub_248A9C28C();
  v26 = sub_248A7F034(&qword_2577AED08, &qword_2577AECE0, MEMORY[0x24BDF4750]);
  v57 = v21;
  v54 = v17;
  v27 = v68;
  v51 = v26;
  sub_248A9C40C();
  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v29 = v9;
  v30 = v13;
  v31 = v67;
  v28(v16, v30);
  sub_248A71634((uint64_t)v19, &qword_2577AECE0);
  v32 = (void (*)(char *, _QWORD, uint64_t))v27[13];
  v32(v9, *MEMORY[0x24BDECF10], v5);
  v32(v31, *MEMORY[0x24BDECEC0], v5);
  sub_248A713F0(&qword_2577AED10, (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50], MEMORY[0x24BDECF70]);
  result = sub_248A9C598();
  if ((result & 1) != 0)
  {
    v35 = (uint64_t)v52;
    v34 = v53;
    v36 = v61;
    v37 = &v53[*(int *)(v61 + 48)];
    v38 = (void (*)(char *, char *, uint64_t))v27[4];
    v38(v53, v29, v5);
    v38(v37, v31, v5);
    v39 = &v3[*(int *)(v36 + 48)];
    v40 = (void (*)(char *, char *, uint64_t))v27[2];
    v40(v3, v34, v5);
    v40(v39, v37, v5);
    v38((char *)v35, v3, v5);
    v41 = (void (*)(char *, uint64_t))v27[1];
    v41(v39, v5);
    v42 = &v3[*(int *)(v36 + 48)];
    v38(v3, v34, v5);
    v38(v42, v37, v5);
    v38((char *)(v35 + *(int *)(v63 + 36)), v42, v5);
    v41(v3, v5);
    v43 = v62;
    sub_248A93908(v35, v62, &qword_2577AECD8);
    *(_QWORD *)&v70 = v54;
    *((_QWORD *)&v70 + 1) = v51;
    swift_getOpaqueTypeConformance2();
    sub_248A7F034(&qword_2577AED18, &qword_2577AECD8, MEMORY[0x24BEE08F8]);
    v45 = v55;
    v44 = v56;
    v46 = v57;
    sub_248A9C3F4();
    sub_248A71634(v43, &qword_2577AECD8);
    (*(void (**)(char *, uint64_t))(v59 + 8))(v46, v44);
    v47 = v58;
    v48 = (uint64_t)v65;
    v49 = v60;
    (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v65, v45, v60);
    *(_BYTE *)(v48 + *(int *)(v64 + 36)) = 0;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v45, v49);
    type metadata accessor for TipBodyView();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    *(_OWORD *)(swift_allocObject() + 16) = v70;
    swift_release();
    sub_248A97964();
    sub_248A9C3DC();
    swift_release();
    return sub_248A71634(v48, &qword_2577AECF8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_248A95288@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  v48 = a2;
  v44 = sub_248A9C0D0();
  v47 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v4 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED38);
  v43 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED40);
  v45 = *(_QWORD *)(v7 - 8);
  v46 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED48);
  MEMORY[0x24BDAC7A8](v41);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED50);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v42 = (uint64_t)&v39 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED58);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v39 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED60);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v39 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v39 - v23;
  *(_QWORD *)v18 = sub_248A9C1CC();
  *((_QWORD *)v18 + 1) = 0;
  v18[16] = 0;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED68);
  sub_248A957DC(a1, (uint64_t)&v18[*(int *)(v25 + 44)]);
  v26 = sub_248A9C544();
  sub_248A9474C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v22, 0.0, 1, 0.0, 1, v26, v27, &qword_2577AED58, &qword_2577AED60);
  sub_248A71634((uint64_t)v18, &qword_2577AED58);
  sub_248A93908((uint64_t)v22, (uint64_t)v24, &qword_2577AED60);
  type metadata accessor for TipBodyView();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_248A9C004();
  swift_release();
  swift_release();
  *(_OWORD *)(swift_allocObject() + 16) = v49;
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2577AED70);
  sub_248A97A9C();
  sub_248A9C4F0();
  sub_248A9C0C4();
  sub_248A7F034(&qword_2577AEDC0, &qword_2577AED38, MEMORY[0x24BDF43B0]);
  sub_248A713F0((unint64_t *)&qword_2577AEC20, (uint64_t (*)(uint64_t))MEMORY[0x24BDED868], MEMORY[0x24BDED858]);
  v28 = v39;
  v29 = v40;
  v30 = v44;
  sub_248A9C3C4();
  (*(void (**)(char *, uint64_t))(v47 + 8))(v4, v30);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v6, v29);
  sub_248A9C544();
  sub_248A9C070();
  v32 = v45;
  v31 = v46;
  (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v10, v28, v46);
  v33 = &v10[*(int *)(v41 + 36)];
  v34 = v50;
  *(_OWORD *)v33 = v49;
  *((_OWORD *)v33 + 1) = v34;
  *((_OWORD *)v33 + 2) = v51;
  (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v31);
  sub_248A97C10();
  sub_248A9C418();
  sub_248A71634((uint64_t)v10, &qword_2577AED48);
  v35 = v42;
  sub_248A93908((uint64_t)v14, v42, &qword_2577AED50);
  sub_248A7FEC4((uint64_t)v24, (uint64_t)v22, &qword_2577AED60);
  sub_248A7FEC4(v35, (uint64_t)v14, &qword_2577AED50);
  v36 = v48;
  sub_248A7FEC4((uint64_t)v22, v48, &qword_2577AED60);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDD0);
  sub_248A7FEC4((uint64_t)v14, v36 + *(int *)(v37 + 48), &qword_2577AED50);
  sub_248A71634(v35, &qword_2577AED50);
  sub_248A71634((uint64_t)v24, &qword_2577AED60);
  sub_248A71634((uint64_t)v14, &qword_2577AED50);
  return sub_248A71634((uint64_t)v22, &qword_2577AED60);
}

uint64_t sub_248A957DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _BYTE *v51;
  char v52;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v68[2];
  id v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  id v86[4];
  uint64_t v87;
  id v88[6];
  id v89[12];

  v84 = a2;
  v73 = sub_248A9C1C0();
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v71 = (uint64_t)v68 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for TipBodyView();
  MEMORY[0x24BDAC7A8](v4);
  v79 = (uint64_t)v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDD8);
  MEMORY[0x24BDAC7A8](v6);
  v74 = (uint64_t)v68 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDE0);
  MEMORY[0x24BDAC7A8](v8);
  v77 = (uint64_t)v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDE8);
  v81 = *(_QWORD *)(v82 - 8);
  v10 = MEMORY[0x24BDAC7A8](v82);
  v76 = (uint64_t)v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v75 = (uint64_t)v68 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDF0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v83 = (char *)v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v68 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEDF8);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE00);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v68 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE08);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v80 = (char *)v68 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)v68 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v68 - v30;
  v85 = a1 + *(int *)(v4 + 20);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_248A9C004();
  swift_release();
  swift_release();
  swift_release();
  if (v89[0] && objc_msgSend(v89[0], sel_isSymbolImage))
    v32 = sub_248A9C190();
  else
    v32 = sub_248A9C19C();
  v33 = v32;
  sub_248A7CE78(v89);
  *(_QWORD *)v20 = v33;
  *((_QWORD *)v20 + 1) = 0x4026000000000000;
  v20[16] = 0;
  v34 = (uint64_t)&v20[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE10) + 44)];
  v78 = a1;
  sub_248A96174(a1, v34);
  v35 = sub_248A9C550();
  v36 = 1;
  sub_248A9474C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v23, 0.0, 1, 0.0, 1, v35, v37, &qword_2577AEDF8, &qword_2577AEE00);
  sub_248A71634((uint64_t)v20, &qword_2577AEDF8);
  v38 = sub_248A9C2BC();
  sub_248A7FEC4((uint64_t)v23, (uint64_t)v29, &qword_2577AEE00);
  v39 = &v29[*(int *)(v24 + 36)];
  *v39 = v38;
  *(_OWORD *)(v39 + 8) = xmmword_248A9FAA0;
  *(_OWORD *)(v39 + 24) = xmmword_248A9FAA0;
  v39[40] = 0;
  sub_248A71634((uint64_t)v23, &qword_2577AEE00);
  sub_248A93908((uint64_t)v29, (uint64_t)v31, &qword_2577AEE08);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_248A9C004();
  swift_release();
  swift_release();
  swift_release();
  if (v89[11])
  {
    v68[0] = v89[7];
    v69 = v89[8];
    v68[1] = v89[9];
    v70 = v89[10];
    v40 = v74;
    sub_248A926EC(v74);
    v41 = sub_248A9C550();
    v42 = v77;
    sub_248A9474C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v77, 0.0, 1, 0.0, 1, v41, v43, &qword_2577AEDD8, &qword_2577AEDE0);
    sub_248A71634(v40, &qword_2577AEDD8);
    LODWORD(v74) = sub_248A9C2C8();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v44 = v88[0];
    sub_248A7CE3C((uint64_t)v88, (uint64_t)v86);
    if (v44)
    {
      sub_248A7CE78(v86);
      sub_248A7CE78(v88);
      v45 = v79;
      sub_248A983A0(v78, v79);
      goto LABEL_8;
    }
    v51 = (_BYTE *)MEMORY[0x2495A3F58](&v87);
    sub_248A7CE78(v86);
    v45 = v79;
    if (v51)
    {
      v52 = v51[OBJC_IVAR___TipImageProxy_shouldDisplay];

      sub_248A7CE78(v88);
      sub_248A983A0(v78, v45);
      if ((v52 & 1) != 0)
      {
LABEL_8:
        v46 = v71;
        sub_248A97D00(v71);
        v47 = sub_248A9C1B4();
        (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v46, v73);
        sub_248A98940(v45, (uint64_t (*)(_QWORD))type metadata accessor for TipBodyView);
        if ((v47 & 1) == 0)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          swift_retain();
          sub_248A9C004();
          swift_release();
          swift_release();
          sub_248A87D40();
          sub_248A7CE78(v86);
          swift_release();
        }
        goto LABEL_16;
      }
    }
    else
    {
      sub_248A7CE78(v88);
      sub_248A983A0(v78, v45);
    }
    sub_248A98940(v45, (uint64_t (*)(_QWORD))type metadata accessor for TipBodyView);
LABEL_16:
    sub_248A9C028();
    v54 = v53;
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v61 = v76;
    sub_248A7FEC4(v42, v76, &qword_2577AEDE0);
    v50 = v82;
    v62 = v61 + *(int *)(v82 + 36);
    *(_BYTE *)v62 = v74;
    *(_QWORD *)(v62 + 8) = v54;
    *(_QWORD *)(v62 + 16) = v56;
    *(_QWORD *)(v62 + 24) = v58;
    *(_QWORD *)(v62 + 32) = v60;
    *(_BYTE *)(v62 + 40) = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_248A72A78((uint64_t)v69);
    swift_release();

    sub_248A71634(v42, &qword_2577AEDE0);
    v63 = v61;
    v64 = v75;
    sub_248A93908(v63, v75, &qword_2577AEDE8);
    sub_248A93908(v64, (uint64_t)v17, &qword_2577AEDE8);
    v36 = 0;
    v48 = v84;
    v49 = (uint64_t)v83;
    goto LABEL_17;
  }
  v48 = v84;
  v49 = (uint64_t)v83;
  v50 = v82;
LABEL_17:
  v65 = (uint64_t)v80;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v81 + 56))(v17, v36, 1, v50);
  sub_248A7FEC4((uint64_t)v31, v65, &qword_2577AEE08);
  sub_248A7FEC4((uint64_t)v17, v49, &qword_2577AEDF0);
  sub_248A7FEC4(v65, v48, &qword_2577AEE08);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE18);
  sub_248A7FEC4(v49, v48 + *(int *)(v66 + 48), &qword_2577AEDF0);
  sub_248A71634((uint64_t)v17, &qword_2577AEDF0);
  sub_248A71634((uint64_t)v31, &qword_2577AEE08);
  sub_248A71634(v49, &qword_2577AEDF0);
  return sub_248A71634(v65, &qword_2577AEE08);
}

uint64_t sub_248A96174@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  double v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69[4];
  _QWORD v70[5];
  char v71;
  char v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  char v83;
  id v84;

  v68 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE20);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE28);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v67 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v66 = (uint64_t)&v54 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE30);
  MEMORY[0x24BDAC7A8](v10);
  v65 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE38);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v64 = (uint64_t)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_248A9C1C0();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE40);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v54 - v23;
  sub_248A97D00((uint64_t)v18);
  v25 = sub_248A9C1B4();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  v26 = 1;
  if ((v25 & 1) == 0)
  {
    v58 = v5;
    v59 = v13;
    v60 = v12;
    v61 = v24;
    v62 = v22;
    v27 = *(int *)(type metadata accessor for TipBodyView() + 20);
    v63 = a1;
    v28 = a1 + v27;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v29 = v73;
    sub_248A7CE3C((uint64_t)&v73, (uint64_t)v69);
    if (v29)
    {
      sub_248A7CE78(v69);
      sub_248A7CE78(&v73);
LABEL_4:
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_248A9C004();
      swift_release();
      swift_release();
      swift_release();
      sub_248A882E8((uint64_t)&v84, (uint64_t)&v73);
      v31 = v73;
      v30 = (uint64_t)v74;
      v32 = (uint64_t)v75;
      v56 = (uint64_t)v76;
      v33 = v78;
      v55 = v77;
      v34 = v79;
      v54 = v80;
      v35 = v81;
      v57 = v28;
      v36 = v82;
      v37 = v83;
      v69[0] = v73;
      v69[1] = v74;
      v69[2] = v75;
      v69[3] = v76;
      v70[0] = v77;
      v70[1] = v78;
      v70[2] = v79;
      v70[3] = v80;
      v70[4] = v81;
      v71 = v82;
      v72 = v83;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE58);
      sub_248A9843C();
      sub_248A9C400();
      sub_248A985E4(v31, v30, v32, v56, v55, v33, v34, v54, v35, v36, v37);
      sub_248A7CE78(&v84);
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_248A9C004();
      swift_release();
      swift_release();
      swift_release();
      sub_248A87D40();
      v39 = v38;
      sub_248A7CE78(&v73);
      v40 = sub_248A9C550();
      v41 = v64;
      v42 = (uint64_t)v65;
      sub_248A9474C(0.0, 1, 0.0, 1, v39, 0, 0.0, 1, v64, 0.0, 1, 0.0, 1, v40, v43, &qword_2577AEE30, &qword_2577AEE38);
      sub_248A71634(v42, &qword_2577AEE30);
      v24 = v61;
      sub_248A93908(v41, (uint64_t)v61, &qword_2577AEE38);
      v26 = 0;
      a1 = v63;
      v22 = v62;
LABEL_10:
      v12 = v60;
      v13 = v59;
      v5 = v58;
      goto LABEL_11;
    }
    v44 = (_BYTE *)MEMORY[0x2495A3F58](v70);
    sub_248A7CE78(v69);
    if (v44)
    {
      v45 = v44[OBJC_IVAR___TipImageProxy_shouldDisplay];

      sub_248A7CE78(&v73);
      if ((v45 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      sub_248A7CE78(&v73);
    }
    v26 = 1;
    a1 = v63;
    v22 = v62;
    v24 = v61;
    goto LABEL_10;
  }
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v24, v26, 1, v12);
  *(_QWORD *)v5 = sub_248A9C1CC();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE48);
  sub_248A968B4(a1, (uint64_t)&v5[*(int *)(v46 + 44)]);
  v47 = sub_248A9C52C();
  v48 = v67;
  sub_248A9474C(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, v67, 0.0, 1, 0.0, 1, v47, v49, &qword_2577AEE20, &qword_2577AEE28);
  sub_248A71634((uint64_t)v5, &qword_2577AEE20);
  v50 = v66;
  sub_248A93908(v48, v66, &qword_2577AEE28);
  sub_248A7FEC4((uint64_t)v24, (uint64_t)v22, &qword_2577AEE40);
  sub_248A7FEC4(v50, v48, &qword_2577AEE28);
  v51 = v68;
  sub_248A7FEC4((uint64_t)v22, v68, &qword_2577AEE40);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE50);
  sub_248A7FEC4(v48, v51 + *(int *)(v52 + 48), &qword_2577AEE28);
  sub_248A71634(v50, &qword_2577AEE28);
  sub_248A71634((uint64_t)v24, &qword_2577AEE40);
  sub_248A71634(v48, &qword_2577AEE28);
  return sub_248A71634((uint64_t)v22, &qword_2577AEE40);
}

uint64_t sub_248A968B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t KeyPath;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE *v99;
  char v100;
  char v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  char v125;
  _BYTE v126[7];
  _OWORD v127[12];
  __int128 v128;
  _OWORD v129[2];
  char v130;
  char v131;
  char v132;
  _BYTE v133[231];
  _OWORD v134[12];
  char v135;
  _BYTE v136[7];
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  _OWORD v155[6];
  _BYTE v156[231];
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  uint64_t v184;
  char v185;
  _BYTE v186[7];
  uint64_t v187;
  char v188;
  _BYTE v189[7];
  uint64_t v190;
  char v191;
  _BYTE v192[7];
  uint64_t v193;
  uint64_t v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  uint64_t v207;
  char v208;
  uint64_t v209;
  char v210;
  uint64_t v211;
  uint64_t v212;
  __int128 v213;
  __int128 v214;
  char v215;
  uint64_t v216;
  char v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  char v222;
  uint64_t v223;
  uint64_t v224;
  char v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE238);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TipBodyTextBuilder();
  v118 = *(_QWORD *)(v7 - 8);
  v119 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v120 = (uint64_t)&v103 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v9);
  v114 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_248A9C334();
  v112 = *(_QWORD *)(v11 - 8);
  v113 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE30);
  MEMORY[0x24BDAC7A8](v14);
  v115 = (char *)&v103 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE38);
  v116 = *(_QWORD *)(v123 - 8);
  MEMORY[0x24BDAC7A8](v123);
  v111 = (uint64_t)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_248A9C1C0();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v103 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE40);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v121 = (uint64_t)&v103 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v103 - v24;
  sub_248A97D00((uint64_t)v20);
  v26 = sub_248A9C1B4();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  v124 = v25;
  v122 = a2;
  v117 = v6;
  if ((v26 & 1) != 0)
  {
    v27 = *(int *)(type metadata accessor for TipBodyView() + 20);
    v110 = a1;
    v28 = a1 + v27;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    v29 = v195;
    sub_248A7CE3C((uint64_t)&v195, (uint64_t)&v169);
    if (v29)
    {
      sub_248A7CE78((id *)&v169);
      sub_248A7CE78((id *)&v195);
    }
    else
    {
      v99 = (_BYTE *)MEMORY[0x2495A3F58](&v171);
      sub_248A7CE78((id *)&v169);
      if (!v99)
      {
        sub_248A7CE78((id *)&v195);
        v43 = 1;
        goto LABEL_5;
      }
      v100 = v99[OBJC_IVAR___TipImageProxy_shouldDisplay];

      sub_248A7CE78((id *)&v195);
      if ((v100 & 1) == 0)
      {
        v43 = 1;
        goto LABEL_5;
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    sub_248A882E8((uint64_t)&v142, (uint64_t)&v195);
    v30 = v195;
    v31 = *((_QWORD *)&v196 + 1);
    v108 = v28;
    v109 = v13;
    v32 = v197;
    v106 = v196;
    v107 = *((_QWORD *)&v197 + 1);
    v104 = *((_QWORD *)&v198 + 1);
    v105 = v198;
    v33 = v199;
    v34 = BYTE8(v199);
    v35 = BYTE9(v199);
    v169 = v195;
    v170 = v196;
    v171 = v197;
    v172 = v198;
    *(_QWORD *)&v173 = v199;
    WORD4(v173) = WORD4(v199);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE58);
    sub_248A9843C();
    sub_248A9C400();
    v102 = v35;
    v6 = v117;
    v101 = v34;
    v25 = v124;
    v36 = v32;
    v13 = v109;
    sub_248A985E4((void *)v30, *((uint64_t *)&v30 + 1), v106, v31, v36, v107, v105, v104, v33, v101, v102);
    sub_248A7CE78((id *)&v142);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    sub_248A87D40();
    v38 = v37;
    sub_248A7CE78((id *)&v195);
    v39 = sub_248A9C550();
    v40 = v111;
    v41 = (uint64_t)v115;
    sub_248A9474C(0.0, 1, 0.0, 1, v38, 0, 0.0, 1, v111, 0.0, 1, 0.0, 1, v39, v42, &qword_2577AEE30, &qword_2577AEE38);
    sub_248A71634(v41, &qword_2577AEE30);
    sub_248A93908(v40, (uint64_t)v25, &qword_2577AEE38);
    v43 = 0;
LABEL_5:
    a1 = v110;
    goto LABEL_7;
  }
  v43 = 1;
LABEL_7:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v116 + 56))(v25, v43, 1, v123);
  v44 = a1 + *(int *)(type metadata accessor for TipBodyView() + 20);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_248A9C004();
  swift_release();
  swift_release();
  swift_release();
  v123 = v44;
  if (*((_QWORD *)&v195 + 1))
  {
    sub_248A7D434();
    v45 = sub_248A9C394();
    v47 = v46;
    v116 = v48;
    v50 = v49 & 1;
    v51 = v112;
    v52 = v113;
    (*(void (**)(char *, _QWORD, uint64_t))(v112 + 104))(v13, *MEMORY[0x24BDF1878], v113);
    v53 = sub_248A9C2EC();
    v54 = (uint64_t)v114;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v114, 1, 1, v53);
    sub_248A9C31C();
    sub_248A71634(v54, (uint64_t *)&unk_2577ADE98);
    (*(void (**)(char *, uint64_t))(v51 + 8))(v13, v52);
    sub_248A9C304();
    sub_248A9C328();
    swift_release();
    v55 = sub_248A9C37C();
    v57 = v56;
    LOBYTE(v52) = v58;
    v60 = v59;
    swift_release();
    v61 = v52 & 1;
    sub_248A71624(v45, v47, v50);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    v63 = swift_getKeyPath();
    v64 = sub_248A9C478();
    v65 = swift_getKeyPath();
    v220 = v55;
    v221 = v57;
    v222 = v61;
    v223 = v60;
    v224 = KeyPath;
    v225 = 1;
    v226 = v63;
    v227 = 0x3FE0000000000000;
    v228 = v65;
    v229 = v64;
    sub_248A9C52C();
    sub_248A94918(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, &v195, 0.0, 1, 0.0, 1);
    sub_248A71624(v55, v57, v61);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v165 = v203;
    v166 = v204;
    v167 = v205;
    v168 = v206;
    v161 = v199;
    v162 = v200;
    v163 = v201;
    v164 = v202;
    v157 = v195;
    v158 = v196;
    v159 = v197;
    v160 = v198;
    LOBYTE(v51) = sub_248A9C2D4();
    sub_248A9C028();
    v67 = v66;
    v69 = v68;
    v71 = v70;
    v73 = v72;
    v125 = 0;
    sub_248A9C544();
    sub_248A9C070();
    v127[8] = v165;
    v127[9] = v166;
    v127[10] = v167;
    v127[11] = v168;
    v127[4] = v161;
    v127[5] = v162;
    v127[6] = v163;
    v127[7] = v164;
    v127[0] = v157;
    v127[1] = v158;
    v127[2] = v159;
    v127[3] = v160;
    LOBYTE(v128) = v51;
    *(_DWORD *)((char *)&v128 + 1) = *(_DWORD *)v126;
    DWORD1(v128) = *(_DWORD *)&v126[3];
    *((_QWORD *)&v128 + 1) = v67;
    *(_QWORD *)&v129[0] = v69;
    *((_QWORD *)&v129[0] + 1) = v71;
    *(_QWORD *)&v129[1] = v73;
    BYTE8(v129[1]) = v125;
    v150 = v165;
    v151 = v166;
    v153 = v168;
    v152 = v167;
    v146 = v161;
    v147 = v162;
    v149 = v164;
    v148 = v163;
    v142 = v157;
    v143 = v158;
    v145 = v160;
    v144 = v159;
    v155[0] = v129[0];
    *(_OWORD *)((char *)v155 + 9) = *(_OWORD *)((char *)v129 + 9);
    v154 = v128;
    v134[8] = v165;
    v134[9] = v166;
    v134[10] = v167;
    v134[11] = v168;
    v134[4] = v161;
    v134[5] = v162;
    v134[6] = v163;
    v134[7] = v164;
    v134[0] = v157;
    v134[1] = v158;
    v74 = v207;
    LOBYTE(v55) = v208;
    v75 = v209;
    LOBYTE(KeyPath) = v210;
    v76 = v211;
    v77 = v212;
    *(_DWORD *)v136 = *(_DWORD *)v126;
    *(_DWORD *)&v136[3] = *(_DWORD *)&v126[3];
    v132 = 1;
    v131 = v208;
    v130 = v210;
    v134[2] = v159;
    v134[3] = v160;
    v135 = v51;
    v137 = v67;
    v138 = v69;
    v139 = v71;
    v140 = v73;
    v141 = v125;
    sub_248A989F0((uint64_t)v127);
    sub_248A9897C((uint64_t)v134);
    v181 = v154;
    v182 = v155[0];
    v183 = v155[1];
    v177 = v150;
    v178 = v151;
    v180 = v153;
    v179 = v152;
    v173 = v146;
    v174 = v147;
    v176 = v149;
    v175 = v148;
    v169 = v142;
    v170 = v143;
    v172 = v145;
    v171 = v144;
    v184 = 0;
    v185 = 1;
    *(_DWORD *)v186 = *(_DWORD *)v156;
    *(_DWORD *)&v186[3] = *(_DWORD *)&v156[3];
    v187 = v74;
    v188 = v55;
    *(_DWORD *)v189 = *(_DWORD *)v133;
    *(_DWORD *)&v189[3] = *(_DWORD *)&v133[3];
    v190 = v75;
    v191 = KeyPath;
    v6 = v117;
    *(_DWORD *)v192 = v213;
    *(_DWORD *)&v192[3] = *(_DWORD *)((char *)&v213 + 3);
    v193 = v76;
    v194 = v77;
    nullsub_1(&v169);
  }
  else
  {
    sub_248A98630(&v169);
  }
  sub_248A93908((uint64_t)&v169, (uint64_t)&v195, &qword_2577AEE78);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_248A9C004();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v118 + 48))(v6, 1, v119) == 1)
  {
    sub_248A71634((uint64_t)v6, &qword_2577AE238);
    sub_248A98668((uint64_t)&v169);
  }
  else
  {
    sub_248A84FF8((uint64_t)v6, v120);
    sub_248A86228(&v169);
    v78 = v169;
    v79 = v170;
    v80 = v171;
    v81 = swift_getKeyPath();
    v82 = swift_getKeyPath();
    v213 = v78;
    v214 = v79;
    v215 = v80;
    v216 = v81;
    v217 = 1;
    v218 = v82;
    v219 = 0x3FE0000000000000;
    sub_248A9C52C();
    sub_248A94AC4(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v142, 0.0, 1, 0.0, 1);
    sub_248A98818(v78, *((uint64_t *)&v78 + 1), v79);
    swift_release();
    swift_release();
    v83 = sub_248A9C2D4();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_248A9C004();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_248A9C028();
    v85 = v84;
    v87 = v86;
    v89 = v88;
    v91 = v90;
    LOBYTE(v134[0]) = 0;
    sub_248A98940(v120, (uint64_t (*)(_QWORD))type metadata accessor for TipBodyTextBuilder);
    v177 = v150;
    v178 = v151;
    v179 = v152;
    *(_QWORD *)&v180 = v153;
    v173 = v146;
    v174 = v147;
    v175 = v148;
    v176 = v149;
    v169 = v142;
    v170 = v143;
    v171 = v144;
    v172 = v145;
    BYTE8(v180) = v83;
    *(_QWORD *)&v181 = v85;
    *((_QWORD *)&v181 + 1) = v87;
    *(_QWORD *)&v182 = v89;
    *((_QWORD *)&v182 + 1) = v91;
    LOBYTE(v183) = v134[0];
    nullsub_1(&v169);
  }
  sub_248A93908((uint64_t)&v169, (uint64_t)v127, &qword_2577AEE80);
  v92 = (uint64_t)v124;
  v93 = v121;
  sub_248A7FEC4((uint64_t)v124, v121, &qword_2577AEE40);
  sub_248A93908((uint64_t)&v195, (uint64_t)v134, &qword_2577AEE78);
  sub_248A93908((uint64_t)v127, (uint64_t)v133, &qword_2577AEE80);
  v94 = v122;
  sub_248A7FEC4(v93, v122, &qword_2577AEE40);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEE88);
  v96 = v94 + *(int *)(v95 + 48);
  sub_248A93908((uint64_t)v134, (uint64_t)&v142, &qword_2577AEE78);
  sub_248A93908((uint64_t)&v142, v96, &qword_2577AEE78);
  v97 = v94 + *(int *)(v95 + 64);
  sub_248A93908((uint64_t)v133, (uint64_t)v156, &qword_2577AEE80);
  sub_248A93908((uint64_t)v156, v97, &qword_2577AEE80);
  sub_248A98840((uint64_t)&v142, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_248A98690);
  sub_248A98760((uint64_t)v156, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_248A986FC);
  sub_248A71634(v92, &qword_2577AEE40);
  sub_248A93908((uint64_t)v133, (uint64_t)&v157, &qword_2577AEE80);
  sub_248A98760((uint64_t)&v157, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_248A987DC);
  sub_248A93908((uint64_t)v134, (uint64_t)&v169, &qword_2577AEE78);
  sub_248A98840((uint64_t)&v169, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_248A988C4);
  return sub_248A71634(v93, &qword_2577AEE40);
}

double sub_248A977E4@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2577ADE98);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_248A9C4B4();
  v6 = sub_248A9C2EC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  sub_248A9C310();
  sub_248A71634((uint64_t)v4, (uint64_t *)&unk_2577ADE98);
  sub_248A9C304();
  v7 = sub_248A9C328();
  swift_release();
  KeyPath = swift_getKeyPath();
  v9 = objc_msgSend((id)objc_opt_self(), sel_tertiaryLabelColor);
  v10 = MEMORY[0x2495A3484](v9);
  v11 = swift_getKeyPath();
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(_QWORD *)(a1 + 24) = KeyPath;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v11;
  *(_QWORD *)(a1 + 48) = v10;
  result = 2.0;
  *(_OWORD *)(a1 + 56) = xmmword_248A9FAB0;
  return result;
}

uint64_t sub_248A97938()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248A9795C()
{
  uint64_t v0;

  return sub_248A7CDD4(*(uint64_t (**)(void))(v0 + 16));
}

unint64_t sub_248A97964()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2577AED20;
  if (!qword_2577AED20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AECF8);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AECE8);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AECD8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AECE0);
    sub_248A7F034(&qword_2577AED08, &qword_2577AECE0, MEMORY[0x24BDF4750]);
    v4[2] = v2;
    v4[3] = v3;
    v4[4] = swift_getOpaqueTypeConformance2();
    v4[5] = sub_248A7F034(&qword_2577AED18, &qword_2577AECD8, MEMORY[0x24BEE08F8]);
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_248A7F034(&qword_2577AED28, &qword_2577AED30, MEMORY[0x24BDEFAD8]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2577AED20);
  }
  return result;
}

unint64_t sub_248A97A9C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AED78;
  if (!qword_2577AED78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AED70);
    v2[0] = sub_248A97B08();
    v2[1] = MEMORY[0x24BDEC438];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AED78);
  }
  return result;
}

unint64_t sub_248A97B08()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AED80;
  if (!qword_2577AED80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AED88);
    v2[0] = sub_248A97B8C();
    v2[1] = sub_248A7F034(&qword_2577AEDB0, &qword_2577AEDB8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AED80);
  }
  return result;
}

unint64_t sub_248A97B8C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AED90;
  if (!qword_2577AED90)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AED98);
    v2[0] = sub_248A888D0();
    v2[1] = sub_248A7F034(&qword_2577AEDA0, &qword_2577AEDA8, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AED90);
  }
  return result;
}

unint64_t sub_248A97C10()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  _QWORD v5[6];

  result = qword_2577AEDC8;
  if (!qword_2577AEDC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AED48);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AED38);
    v3 = sub_248A9C0D0();
    v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDED868];
    v5[2] = v2;
    v5[3] = v3;
    v5[4] = sub_248A7F034(&qword_2577AEDC0, &qword_2577AED38, MEMORY[0x24BDF43B0]);
    v5[5] = sub_248A713F0((unint64_t *)&qword_2577AEC20, v4, MEMORY[0x24BDED858]);
    v5[0] = swift_getOpaqueTypeConformance2();
    v5[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v5);
    atomic_store(result, (unint64_t *)&qword_2577AEDC8);
  }
  return result;
}

uint64_t sub_248A97D00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_248A9C184();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEA80);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A7FEC4(v2, (uint64_t)v10, &qword_2577AEA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_248A9C1C0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_248A9C6D0();
    v14 = sub_248A9C2A4();
    if (os_log_type_enabled(v14, v13))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      *(_QWORD *)(v15 + 4) = sub_248A97F10(0xD000000000000013, 0x8000000248AA1860, &v18);
      _os_log_impl(&dword_248A67000, v14, v13, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495A3EC8](v16, -1, -1);
      MEMORY[0x2495A3EC8](v15, -1, -1);
    }

    sub_248A9C178();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

unint64_t sub_248A97F10(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_248A97FE0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_248A71670((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_248A71670((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

unint64_t sub_248A97FE0(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_248A980DC(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_248A9C76C();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_248A980DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_248A98170(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_248A98208(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_248A98208((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_248A98170(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_248A834C4(v2, 0);
      result = sub_248A9C754();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_248A9C604();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

char *sub_248A98208(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_25446CD60);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_248A982F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248A9C148();
  *a1 = result;
  return result;
}

uint64_t sub_248A98318()
{
  swift_retain();
  return sub_248A9C154();
}

uint64_t sub_248A98340@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_248A9C100();
  *a1 = result;
  return result;
}

uint64_t sub_248A98368()
{
  swift_retain();
  return sub_248A9C10C();
}

uint64_t sub_248A983A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipBodyView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A983E4(uint64_t a1)
{
  sub_248A71614(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_248A9843C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2577AEE60;
  if (!qword_2577AEE60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEE58);
    v2 = sub_248A984A0();
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2577AEE60);
  }
  return result;
}

unint64_t sub_248A984A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEE68;
  if (!qword_2577AEE68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEE70);
    v2[0] = sub_248A9850C();
    v2[1] = sub_248A98578();
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEE68);
  }
  return result;
}

unint64_t sub_248A9850C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE8A8;
  if (!qword_2577AE8A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE898);
    v2[0] = sub_248A8877C();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE8A8);
  }
  return result;
}

unint64_t sub_248A98578()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AE8C8;
  if (!qword_2577AE8C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AE8A0);
    v2[0] = sub_248A888B4();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AE8C8);
  }
  return result;
}

void sub_248A985E4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, char a11)
{
  if ((a11 & 1) != 0)
    sub_248A98618((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 & 1);
  else
    sub_248A9860C(a1, a2, a3, a4, a5, a6, a7, a8 & 1);
}

void sub_248A9860C(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  if ((a8 & 1) == 0)

}

uint64_t sub_248A98618(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10)
{
  uint64_t result;

  if ((a10 & 1) == 0)
    return swift_release();
  return result;
}

double sub_248A98630(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[17] = 0u;
  a1[18] = 0u;
  a1[15] = 0u;
  a1[16] = 0u;
  a1[13] = 0u;
  a1[14] = 0u;
  a1[11] = 0u;
  a1[12] = 0u;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

double sub_248A98668(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 224) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_248A98690(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_248A71614(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_248A986FC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    sub_248A98738(result, a2, a3);
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_248A98738(uint64_t a1, uint64_t a2, char a3)
{
  sub_248A71614(a1, a2, a3 & 1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_248A98760(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 224);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4);
  return a1;
}

uint64_t sub_248A987DC(uint64_t result, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a6)
  {
    sub_248A98818(result, a2, a3);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_248A98818(uint64_t a1, uint64_t a2, char a3)
{
  sub_248A71624(a1, a2, a3 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_248A98840(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = *(_OWORD *)(a1 + 256);
  v7 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  v5 = *(_OWORD *)(a1 + 240);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    *(_QWORD *)(a1 + 288),
    *(_QWORD *)(a1 + 296));
  return a1;
}

uint64_t sub_248A988C4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_248A71624(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_248A98940(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_248A9897C(uint64_t a1)
{
  sub_248A71624(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_248A989F0(uint64_t a1)
{
  sub_248A71614(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t *sub_248A98A64(uint64_t *a1)
{
  sub_248A98738(*a1, a1[1], a1[2]);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_248A98AB8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AECF8);
  sub_248A97964();
  return swift_getOpaqueTypeConformance2();
}

void *sub_248A98B54()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A98BFC(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t sub_248A98C8C()
{
  char *v0;
  void **v1;
  void *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  id v10;

  v1 = (void **)&v0[OBJC_IVAR___TPKTipContentTableViewCell_tipView];
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    v3 = (uint64_t)*v1;
  }
  else
  {
    v4 = (char *)objc_allocWithZone((Class)type metadata accessor for TPKContentView());
    v5 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
    v6 = (void *)objc_opt_self();
    v7 = v0;
    v8 = v4;
    *(_QWORD *)&v4[v5] = objc_msgSend(v6, sel_currentTraitCollection);
    v8[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
    v9 = OBJC_IVAR___TPKContentView_imageProxy;
    type metadata accessor for TipImageProxy();
    *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

    v3 = sub_248A79938(v8);
    v2 = 0;
  }
  v10 = v2;
  return v3;
}

uint64_t sub_248A98F30(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = v2;
  v6 = (id *)(v3 + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  if (*v6)
    objc_msgSend(*v6, sel_removeFromSuperview);
  v7 = objc_allocWithZone((Class)type metadata accessor for TPKTipContentHintView());
  v8 = a2;
  v9 = a1;
  v10 = objc_msgSend(v7, sel_initWithController_content_, v8, v9);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    sub_248A9AC58();

  }
  v13 = *v6;
  *v6 = v11;

  return sub_248A78FCC();
}

id TPKTipContentTableViewCell.__allocating_init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_248A9C5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id TPKTipContentTableViewCell.init(style:reuseIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  void *v5;
  id v6;
  objc_super v8;

  *(_QWORD *)&v3[OBJC_IVAR___TPKTipContentTableViewCell_tipView] = 0;
  if (a3)
  {
    v5 = (void *)sub_248A9C5A4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  v6 = objc_msgSendSuper2(&v8, sel_initWithStyle_reuseIdentifier_, a1, v5);

  return v6;
}

id TPKTipContentTableViewCell.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentTableViewCell.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentTableViewCell_tipView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentTableViewCell.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentTableViewCell();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPKTipContentTableViewCell()
{
  return objc_opt_self();
}

id sub_248A9935C@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___TPKTipContentTableViewCell_tipView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for TPKTipContentTableViewCell()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKTipContentTableViewCell.tipView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TPKTipContentTableViewCell.tipContentView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPKTipContentTableViewCell.setContent(_:contentController:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

void *sub_248A99458()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_248A99500(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t sub_248A99590()
{
  char *v0;
  void **v1;
  void *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  id v10;

  v1 = (void **)&v0[OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView];
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    v3 = (uint64_t)*v1;
  }
  else
  {
    v4 = (char *)objc_allocWithZone((Class)type metadata accessor for TPKContentView());
    v5 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
    v6 = (void *)objc_opt_self();
    v7 = v0;
    v8 = v4;
    *(_QWORD *)&v4[v5] = objc_msgSend(v6, sel_currentTraitCollection);
    v8[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
    v9 = OBJC_IVAR___TPKContentView_imageProxy;
    type metadata accessor for TipImageProxy();
    *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

    v3 = sub_248A79938(v8);
    v2 = 0;
  }
  v10 = v2;
  return v3;
}

void sub_248A99734(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = v2;
  v6 = (id *)(v3 + OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView);
  swift_beginAccess();
  if (*v6)
    objc_msgSend(*v6, sel_removeFromSuperview);
  v7 = objc_allocWithZone((Class)type metadata accessor for TPKTipContentHintView());
  v8 = a2;
  v9 = a1;
  v10 = objc_msgSend(v7, sel_initWithController_content_, v8, v9);
  v11 = v10;
  if (v10)
  {
    v12 = v10;
    sub_248A9AC58();

  }
  v13 = *v6;
  *v6 = v11;

  sub_248A792E4();
}

id TPKTipContentCollectionHeaderView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

id TPKTipContentCollectionHeaderView.init(frame:)(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_super v10;

  *(_QWORD *)&v4[OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView] = 0;
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for TPKTipContentCollectionHeaderView();
  return objc_msgSendSuper2(&v10, sel_initWithFrame_, a1, a2, a3, a4);
}

id TPKTipContentCollectionHeaderView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentCollectionHeaderView.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentCollectionHeaderView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentCollectionHeaderView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentCollectionHeaderView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TPKTipContentCollectionHeaderView()
{
  return objc_opt_self();
}

id sub_248A99AF4@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR___TPKTipContentCollectionHeaderView_tipView);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for TPKTipContentCollectionHeaderView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TPKTipContentCollectionHeaderView.tipView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TPKTipContentCollectionHeaderView.tipContentView.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of TPKTipContentCollectionHeaderView.setContent(_:contentController:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

UIModalPresentationStyle __swiftcall TPKContentPopoverViewController.adaptivePresentationStyle(for:)(UIPresentationController a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  UIModalPresentationStyle v5;

  v3 = (void *)MEMORY[0x2495A3F58](v1 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (!v3)
    return -1;
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_adaptivePresentationStyleForPresentationController_) & 1) != 0)
    v5 = (UIModalPresentationStyle)objc_msgSend(v4, sel_adaptivePresentationStyleForPresentationController_, a1.super.isa);
  else
    v5 = UIModalPresentationNone;
  swift_unknownObjectRelease();
  return v5;
}

UIModalPresentationStyle __swiftcall TPKContentPopoverViewController.adaptivePresentationStyle(for:traitCollection:)(UIPresentationController a1, UITraitCollection traitCollection)
{
  uint64_t v2;
  void *v5;
  void *v6;
  UIModalPresentationStyle v7;

  v5 = (void *)MEMORY[0x2495A3F58](v2 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (!v5)
    return -1;
  v6 = v5;
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_adaptivePresentationStyleForPresentationController_traitCollection_) & 1) != 0)v7 = (UIModalPresentationStyle)objc_msgSend(v6, sel_adaptivePresentationStyleForPresentationController_traitCollection_, a1.super.isa, traitCollection.super.isa);
  else
    v7 = UIModalPresentationNone;
  swift_unknownObjectRelease();
  return v7;
}

void __swiftcall TPKContentPopoverViewController.presentationController(_:viewControllerForAdaptivePresentationStyle:)(UIViewController_optional *__return_ptr retstr, UIPresentationController _, UIModalPresentationStyle viewControllerForAdaptivePresentationStyle)
{
  uint64_t v3;
  void *v6;
  void *v7;

  v6 = (void *)MEMORY[0x2495A3F58](v3 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (v6)
  {
    v7 = v6;
    if ((objc_msgSend(v6, sel_respondsToSelector_, sel_presentationController_viewControllerForAdaptivePresentationStyle_) & 1) != 0)objc_msgSend(v7, sel_presentationController_viewControllerForAdaptivePresentationStyle_, _.super.isa, viewControllerForAdaptivePresentationStyle);
    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall TPKContentPopoverViewController.presentationControllerWillDismiss(_:)(UIPresentationController a1)
{
  sub_248A9A3A0((uint64_t)a1.super.isa, (SEL *)&selRef_presentationControllerWillDismiss_);
}

Swift::Void __swiftcall TPKContentPopoverViewController.presentationControllerDidAttemptToDismiss(_:)(UIPresentationController a1)
{
  sub_248A9A3A0((uint64_t)a1.super.isa, (SEL *)&selRef_presentationControllerDidAttemptToDismiss_);
}

Swift::Void __swiftcall TPKContentPopoverViewController.prepareForPopoverPresentation(_:)(UIPopoverPresentationController a1)
{
  char *v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x2495A3F58](&v1[OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate]);
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(v3, sel_respondsToSelector_, sel_prepareForPopoverPresentation_) & 1) != 0)
      objc_msgSend(v4, sel_prepareForPopoverPresentation_, a1.super.super.isa);
    swift_unknownObjectRelease();
  }
  v5 = objc_msgSend(v1, sel_popoverPresentationController);
  if (v5)
  {
    v6 = v5;
    v7 = &v1[OBJC_IVAR___TPKContentPopoverViewController_sourceView];
    swift_beginAccess();
    v8 = (void *)MEMORY[0x2495A3F58](v7);
    sub_248A78078(v8);

    sub_248A8C47C();
    v9 = (void *)sub_248A9C67C();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setPassthroughViews_, v9);

  }
}

void *TPKContentPopoverViewController.popoverPresentationController(_:willRepositionPopoverTo:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *result;
  void *v8;

  result = (void *)MEMORY[0x2495A3F58](v3 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (result)
  {
    v8 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, sel_popoverPresentationController_willRepositionPopoverToRect_inView_) & 1) != 0)objc_msgSend(v8, sel_popoverPresentationController_willRepositionPopoverToRect_inView_, a1, a2, a3);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

Swift::Bool __swiftcall TPKContentPopoverViewController.popoverPresentationControllerShouldDismissPopover(_:)(UIPopoverPresentationController a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)MEMORY[0x2495A3F58](v1 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (!v3)
    return 0;
  v4 = v3;
  if ((objc_msgSend(v3, sel_respondsToSelector_, sel_presentationControllerShouldDismiss_) & 1) != 0)
    v5 = objc_msgSend(v4, sel_presentationControllerShouldDismiss_, a1.super.super.isa);
  else
    v5 = 0;
  swift_unknownObjectRelease();
  return v5;
}

Swift::Void __swiftcall TPKContentPopoverViewController.popoverPresentationControllerDidDismissPopover(_:)(UIPopoverPresentationController a1)
{
  sub_248A9A3A0((uint64_t)a1.super.super.isa, (SEL *)&selRef_presentationControllerDidDismiss_);
}

void *sub_248A9A3A0(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  void *result;
  void *v6;

  result = (void *)MEMORY[0x2495A3F58](v2 + OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate);
  if (result)
  {
    v6 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, *a2) & 1) != 0)
      objc_msgSend(v6, *a2, a1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_248A9A428(char *a1, uint64_t a2, void *a3, SEL *a4)
{
  void *result;
  void *v8;
  id v9;
  char *v10;

  result = (void *)MEMORY[0x2495A3F58](&a1[OBJC_IVAR___TPKContentPopoverViewController_popoverDelegate]);
  if (result)
  {
    v8 = result;
    if ((objc_msgSend(result, sel_respondsToSelector_, *a4) & 1) != 0)
    {
      v9 = a3;
      v10 = a1;
      objc_msgSend(v8, *a4, v9);

    }
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

id TPKTipContentHintView.__allocating_init(contentController:tipContent:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;
  id v6;
  id v7;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithController_content_, a1, a2);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_248A9AC58();

  }
  return v6;
}

id TPKTipContentHintView.init(contentController:tipContent:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  id v6;
  id v7;

  v5 = objc_msgSend(v2, sel_initWithController_content_, a1, a2);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    sub_248A9AC58();

  }
  return v6;
}

void sub_248A9A6C0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;

  v1 = v0;
  v2 = OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView;
  v3 = *(void **)&v0[OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView];
  v4 = OBJC_IVAR___TPKContentView_displayBottomSeparator;
  if (v3)
  {
    if ((v0[OBJC_IVAR___TPKContentView_displayBottomSeparator] & 1) != 0)
      goto LABEL_9;
    objc_msgSend(v3, sel_removeFromSuperview);
    v5 = *(void **)&v0[v2];
    *(_QWORD *)&v0[v2] = 0;

    v3 = *(void **)&v0[v2];
    if (v3)
      goto LABEL_9;
    v4 = OBJC_IVAR___TPKContentView_displayBottomSeparator;
  }
  if (v0[v4] == 1)
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
    v7 = *(void **)&v0[v2];
    *(_QWORD *)&v0[v2] = v6;

    v8 = *(void **)&v0[v2];
    if (v8)
    {
      objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      v9 = *(void **)&v0[v2];
      if (v9)
      {
        v10 = (void *)objc_opt_self();
        v11 = v9;
        v12 = objc_msgSend(v10, sel_separatorColor);
        objc_msgSend(v11, sel_setBackgroundColor_, v12);

        v3 = *(void **)&v1[v2];
        if (v3)
        {
LABEL_9:
          v13 = v3;
          objc_msgSend(v1, sel_addSubview_, v13);
          v14 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
          objc_msgSend(v14, sel_scale);
          v16 = v15;

          __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
          v17 = swift_allocObject();
          *(_OWORD *)(v17 + 16) = xmmword_248A9F3C0;
          v18 = objc_msgSend(v13, sel_heightAnchor);
          v19 = objc_msgSend(v18, sel_constraintEqualToConstant_, 1.0 / v16);

          *(_QWORD *)(v17 + 32) = v19;
          v20 = objc_msgSend(v13, sel_widthAnchor);
          v21 = objc_msgSend(v1, sel_widthAnchor);
          v22 = objc_msgSend(v20, sel_constraintEqualToAnchor_, v21);

          *(_QWORD *)(v17 + 40) = v22;
          v23 = objc_msgSend(v1, sel_bottomAnchor);
          v24 = objc_msgSend(v13, sel_bottomAnchor);
          v25 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v24);

          *(_QWORD *)(v17 + 48) = v25;
          sub_248A9C694();
          sub_248A798FC();
          v26 = (id)sub_248A9C67C();
          swift_bridgeObjectRelease();
          objc_msgSend(v1, sel_addConstraints_, v26);

        }
      }
    }
  }
}

void sub_248A9AA0C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v2 = objc_msgSend(*(id *)(v0 + OBJC_IVAR___TPKBaseContentView_hostingView), sel_superview);

  if (v2)
    objc_msgSend(*(id *)(v0 + v1), sel_removeFromSuperview);
  sub_248A9AD34();
}

void sub_248A9AC58()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(v0, sel_setDirectionalLayoutMargins_, *(double *)&v0[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets], *(double *)&v0[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 8], *(double *)&v0[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 16], *(double *)&v0[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets + 24]);
  v1 = OBJC_IVAR___TPKBaseContentView_hostingView;
  v2 = *(void **)&v0[OBJC_IVAR___TPKBaseContentView_hostingView];
  if (v2)
  {
    objc_msgSend(v2, sel_setBackgroundColor_, *(_QWORD *)&v0[OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor]);
    v3 = *(void **)&v0[v1];
    if (v3)
    {
      v4 = objc_msgSend(v3, sel_layer);
      if (v4)
      {
        v5 = v4;
        objc_msgSend(v4, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);
        objc_msgSend(v5, sel_setCornerRadius_, 13.0);

      }
    }
  }
  sub_248A9AD34();
}

uint64_t type metadata accessor for TPKTipContentHintView()
{
  return objc_opt_self();
}

void sub_248A9AD34()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;

  v1 = *(void **)&v0[OBJC_IVAR___TPKBaseContentView_hostingView];
  if (v1)
  {
    v2 = v0;
    v22 = v1;
    v3 = objc_msgSend(v22, sel_superview);

    if (v3)
    {

    }
    else
    {
      objc_msgSend(v2, sel_addSubview_, v22);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE0F0);
      v4 = swift_allocObject();
      *(_OWORD *)(v4 + 16) = xmmword_248A9E8B0;
      v5 = objc_msgSend(v22, sel_leadingAnchor);
      v6 = objc_msgSend(v2, sel_layoutMarginsGuide);
      v7 = objc_msgSend(v6, sel_leadingAnchor);

      v8 = objc_msgSend(v5, sel_constraintEqualToAnchor_, v7);
      *(_QWORD *)(v4 + 32) = v8;
      v9 = objc_msgSend(v22, sel_topAnchor);
      v10 = objc_msgSend(v2, sel_layoutMarginsGuide);
      v11 = objc_msgSend(v10, sel_topAnchor);

      v12 = objc_msgSend(v9, sel_constraintEqualToAnchor_, v11);
      *(_QWORD *)(v4 + 40) = v12;
      v13 = objc_msgSend(v2, sel_layoutMarginsGuide);
      v14 = objc_msgSend(v13, sel_trailingAnchor);

      v15 = objc_msgSend(v22, sel_trailingAnchor);
      v16 = objc_msgSend(v14, sel_constraintEqualToAnchor_, v15);

      *(_QWORD *)(v4 + 48) = v16;
      v17 = objc_msgSend(v2, sel_layoutMarginsGuide);
      v18 = objc_msgSend(v17, sel_bottomAnchor);

      v19 = objc_msgSend(v22, sel_bottomAnchor);
      v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

      *(_QWORD *)(v4 + 56) = v20;
      sub_248A9C694();
      sub_248A798FC();
      v21 = (void *)sub_248A9C67C();
      swift_bridgeObjectRelease();
      objc_msgSend(v2, sel_addConstraints_, v21);

    }
  }
}

_QWORD *TPKTipContentHintView.__allocating_init(controller:content:)(void *a1, void *a2)
{
  objc_class *v2;
  char *v5;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView] = 0;
  return TPKContentView.init(controller:content:)(a1, a2);
}

_QWORD *TPKTipContentHintView.init(controller:content:)(void *a1, void *a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView) = 0;
  return TPKContentView.init(controller:content:)(a1, a2);
}

id TPKTipContentHintView.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id TPKTipContentHintView.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for TPKTipContentHintView();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

void sub_248A9B1E4()
{
  uint64_t v0;

}

id TPKTipContentHintView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TPKTipContentHintView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TPKTipContentHintView()
{
  return swift_lookUpClassMethod();
}

id sub_248A9B240()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  uint64_t v4;

  *(_QWORD *)&v0[OBJC_IVAR___TPKTipContentHintView_bottomSeparatorView] = 0;
  v1 = OBJC_IVAR___TPKContentView_preferredTraitCollection;
  v2 = (void *)objc_opt_self();
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_currentTraitCollection);
  v3[OBJC_IVAR___TPKContentView_displayBottomSeparator] = 0;
  v4 = OBJC_IVAR___TPKContentView_imageProxy;
  type metadata accessor for TipImageProxy();
  *(_QWORD *)&v3[v4] = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);

  return -[TPKBaseContentView initWithReusableTipView:]_0(v3);
}

uint64_t sub_248A9B2E4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t TipKitSection.viewModel.getter()
{
  return sub_248A9B360((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))MEMORY[0x24BDEB790]);
}

uint64_t TipKitSection.$viewModel.getter()
{
  return sub_248A9B360(MEMORY[0x24BDEB798]);
}

uint64_t sub_248A9B360(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(unsigned __int8 *)(v1 + 32);
  v5 = type metadata accessor for TipKitViewModel();
  v6 = sub_248A7D624();
  return a1(v2, v3, v4, v5, v6);
}

uint64_t TipKitSection.init(viewModel:tappable:eligibleIds:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_BYTE *)a4 = a2;
  *(_QWORD *)(a4 + 8) = a3;
  *(_QWORD *)(a4 + 16) = sub_248A7D7DC;
  *(_QWORD *)(a4 + 24) = result;
  *(_BYTE *)(a4 + 32) = 0;
  return result;
}

uint64_t sub_248A9B41C()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t TipKitSection.init(identifier:tappable:eligibleIds:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)a5 = a3;
  *(_QWORD *)(a5 + 8) = a4;
  *(_QWORD *)(a5 + 16) = sub_248A7D8E4;
  *(_QWORD *)(a5 + 24) = result;
  *(_BYTE *)(a5 + 32) = 0;
  return result;
}

uint64_t sub_248A9B4AC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t TipKitSection.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  _OWORD v4[2];
  char v5;

  v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  v5 = *(_BYTE *)(v1 + 32);
  return sub_248A9B500((uint64_t)v4, a1);
}

uint64_t sub_248A9B500@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;

  v37 = a2;
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEF08);
  MEMORY[0x24BDAC7A8](v36);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE5D8);
  v32 = *(_QWORD *)(v5 - 8);
  v33 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v30 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AE4D0);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEF00);
  v8 = MEMORY[0x24BDAC7A8](v35);
  v29 = (uint64_t)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v34 = (uint64_t)&v28 - v10;
  sub_248A9BDB0(a1);
  type metadata accessor for TipKitViewModel();
  sub_248A7D624();
  v11 = (void *)sub_248A9C040();
  sub_248A9BDF8(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();

  swift_release();
  swift_release();
  if (v39 != 1)
    goto LABEL_6;
  sub_248A9BDB0(a1);
  v12 = (void *)sub_248A9C040();
  sub_248A9BDF8(a1);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_248A9C004();

  swift_release();
  swift_release();
  v13 = v39;
  if (!v39)
    goto LABEL_6;
  v14 = (uint64_t *)&v39[OBJC_IVAR___TPKContent_customizationID];
  swift_beginAccess();
  v15 = *v14;

  v17 = *(_QWORD *)(a1 + 8);
  if (!*(_QWORD *)(v17 + 16) || (v16 = sub_248A9B2E4(v15, v17), (v16 & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](v16);
    *(&v28 - 2) = a1;
    sub_248A7EFF0();
    v18 = v30;
    sub_248A9C514();
    v38 = sub_248A9C460();
    swift_retain();
    v19 = sub_248A9C4FC();
    v21 = (uint64_t)v31;
    v20 = v32;
    v22 = v33;
    (*(void (**)(char *, char *, uint64_t))(v32 + 16))(v31, v18, v33);
    swift_release();
    *(_QWORD *)(v21 + *(int *)(v28 + 36)) = v19;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v18, v22);
    v23 = v29;
    sub_248A7FEC4(v21, v29, &qword_2577AE4D0);
    v24 = v23 + *(int *)(v35 + 36);
    *(_BYTE *)(v24 + 32) = 0;
    *(_OWORD *)v24 = 0u;
    *(_OWORD *)(v24 + 16) = 0u;
    sub_248A71634(v21, &qword_2577AE4D0);
    v25 = v23;
    v26 = v34;
    sub_248A9BE58(v25, v34);
    sub_248A7FEC4(v26, (uint64_t)v4, &qword_2577AEF00);
    swift_storeEnumTagMultiPayload();
    sub_248A9BCF4();
    sub_248A9C274();
    return sub_248A71634(v26, &qword_2577AEF00);
  }
  else
  {
LABEL_6:
    swift_storeEnumTagMultiPayload();
    sub_248A9BCF4();
    return sub_248A9C274();
  }
}

uint64_t sub_248A9B964()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_248A9B974@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  sub_248A9BDB0(a1);
  type metadata accessor for TipKitViewModel();
  sub_248A7D624();
  v4 = sub_248A9C040();
  result = sub_248A9BDF8(a1);
  *a2 = v4;
  return result;
}

uint64_t sub_248A9B9E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int128 v2;
  _OWORD v4[2];
  char v5;

  v2 = *(_OWORD *)(v1 + 16);
  v4[0] = *(_OWORD *)v1;
  v4[1] = v2;
  v5 = *(_BYTE *)(v1 + 32);
  return sub_248A9B500((uint64_t)v4, a1);
}

void destroy for TipKitSection(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_248A7F078(*(_QWORD *)(a1 + 16), *(void **)(a1 + 24), *(_BYTE *)(a1 + 32));
}

uint64_t initializeWithCopy for TipKitSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 24);
  v5 = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  sub_248A7F46C(v3, v4, v5);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = v5;
  return a1;
}

uint64_t assignWithCopy for TipKitSection(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;

  v2 = a2;
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v2 + 16);
  v5 = *(void **)(v2 + 24);
  LOBYTE(v2) = *(_BYTE *)(v2 + 32);
  sub_248A7F46C(v4, v5, v2);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(void **)(a1 + 24);
  v8 = *(_BYTE *)(a1 + 32);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = v2;
  sub_248A7F078(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TipKitSection(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  void *v6;
  char v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  v4 = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(void **)(a1 + 24);
  v7 = *(_BYTE *)(a1 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = v4;
  sub_248A7F078(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for TipKitSection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TipKitSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TipKitSection()
{
  return &type metadata for TipKitSection;
}

unint64_t sub_248A9BC24()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2577AEED8;
  if (!qword_2577AEED8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEEE0);
    v2 = sub_248A9BC88();
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDF3F50], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2577AEED8);
  }
  return result;
}

unint64_t sub_248A9BC88()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEEE8;
  if (!qword_2577AEEE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEEF0);
    v2[0] = sub_248A9BCF4();
    v2[1] = MEMORY[0x24BDF5138];
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEEE8);
  }
  return result;
}

unint64_t sub_248A9BCF4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2577AEEF8;
  if (!qword_2577AEEF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2577AEF00);
    v2[0] = sub_248A7FD2C();
    v2[1] = sub_248A9BD70(&qword_2577AE538, &qword_2577AE540);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2577AEEF8);
  }
  return result;
}

uint64_t sub_248A9BD70(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495A3E38](MEMORY[0x24BDEFB48], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248A9BDB0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  swift_bridgeObjectRetain();
  sub_248A7F46C(v2, v3, v4);
  return a1;
}

uint64_t sub_248A9BDF8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  v4 = *(_BYTE *)(a1 + 32);
  swift_bridgeObjectRelease();
  sub_248A7F078(v2, v3, v4);
  return a1;
}

uint64_t sub_248A9BE50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_248A9B974(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_248A9BE58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2577AEF00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248A9BEA0()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_248A9BF44()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_248A9BF50()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_248A9BF5C()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_248A9BF68()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_248A9BF74()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_248A9BF80()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_248A9BF8C()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_248A9BF98()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_248A9BFA4()
{
  return MEMORY[0x24BEBC340]();
}

uint64_t sub_248A9BFB0()
{
  return MEMORY[0x24BEBC348]();
}

uint64_t sub_248A9BFBC()
{
  return MEMORY[0x24BEBC360]();
}

uint64_t sub_248A9BFC8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_248A9BFD4()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_248A9BFE0()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_248A9BFEC()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_248A9BFF8()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_248A9C004()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_248A9C010()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_248A9C01C()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_248A9C028()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_248A9C034()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_248A9C040()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_248A9C04C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_248A9C058()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_248A9C064()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_248A9C070()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_248A9C07C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_248A9C088()
{
  return MEMORY[0x24BDECC98]();
}

uint64_t sub_248A9C094()
{
  return MEMORY[0x24BDECCA0]();
}

uint64_t sub_248A9C0A0()
{
  return MEMORY[0x24BDECCD0]();
}

uint64_t sub_248A9C0AC()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_248A9C0B8()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_248A9C0C4()
{
  return MEMORY[0x24BDED860]();
}

uint64_t sub_248A9C0D0()
{
  return MEMORY[0x24BDED868]();
}

uint64_t sub_248A9C0DC()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_248A9C0E8()
{
  return MEMORY[0x24BDEDF90]();
}

uint64_t sub_248A9C0F4()
{
  return MEMORY[0x24BDEDF98]();
}

uint64_t sub_248A9C100()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_248A9C10C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_248A9C118()
{
  return MEMORY[0x24BDEE0A0]();
}

uint64_t sub_248A9C124()
{
  return MEMORY[0x24BDEE0A8]();
}

uint64_t sub_248A9C130()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_248A9C13C()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_248A9C148()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_248A9C154()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_248A9C160()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_248A9C16C()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_248A9C178()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_248A9C184()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_248A9C190()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_248A9C19C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_248A9C1A8()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_248A9C1B4()
{
  return MEMORY[0x24BDEEE38]();
}

uint64_t sub_248A9C1C0()
{
  return MEMORY[0x24BDEEEA0]();
}

uint64_t sub_248A9C1CC()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_248A9C1D8()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_248A9C1E4()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_248A9C1F0()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_248A9C1FC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_248A9C208()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_248A9C214()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_248A9C220()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_248A9C22C()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_248A9C238()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_248A9C244()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_248A9C250()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_248A9C25C()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_248A9C268()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_248A9C274()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_248A9C280()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_248A9C28C()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_248A9C298()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_248A9C2A4()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_248A9C2B0()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_248A9C2BC()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_248A9C2C8()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_248A9C2D4()
{
  return MEMORY[0x24BDF14F8]();
}

uint64_t sub_248A9C2E0()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_248A9C2EC()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_248A9C2F8()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_248A9C304()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_248A9C310()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_248A9C31C()
{
  return MEMORY[0x24BDF1768]();
}

uint64_t sub_248A9C328()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_248A9C334()
{
  return MEMORY[0x24BDF1900]();
}

uint64_t sub_248A9C340()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_248A9C34C()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_248A9C358()
{
  return MEMORY[0x24BDF1D50]();
}

uint64_t sub_248A9C364()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_248A9C370()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_248A9C37C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_248A9C388()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_248A9C394()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_248A9C3A0()
{
  return MEMORY[0x24BDF1FF8]();
}

uint64_t sub_248A9C3AC()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_248A9C3B8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_248A9C3C4()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_248A9C3D0()
{
  return MEMORY[0x24BDF23D8]();
}

uint64_t sub_248A9C3DC()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_248A9C3E8()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_248A9C3F4()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_248A9C400()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_248A9C40C()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_248A9C418()
{
  return MEMORY[0x24BDF3298]();
}

uint64_t sub_248A9C424()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_248A9C430()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_248A9C43C()
{
  return MEMORY[0x24BDF3BE0]();
}

uint64_t sub_248A9C448()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_248A9C454()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_248A9C460()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_248A9C46C()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_248A9C478()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_248A9C484()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_248A9C490()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_248A9C49C()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_248A9C4A8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_248A9C4B4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_248A9C4C0()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_248A9C4CC()
{
  return MEMORY[0x24BDF4028]();
}

uint64_t sub_248A9C4D8()
{
  return MEMORY[0x24BDF4070]();
}

uint64_t sub_248A9C4E4()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_248A9C4F0()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_248A9C4FC()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_248A9C508()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_248A9C514()
{
  return MEMORY[0x24BDF4AC8]();
}

uint64_t sub_248A9C520()
{
  return MEMORY[0x24BDF4AE0]();
}

uint64_t sub_248A9C52C()
{
  return MEMORY[0x24BDF4EC0]();
}

uint64_t sub_248A9C538()
{
  return MEMORY[0x24BDF4EC8]();
}

uint64_t sub_248A9C544()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_248A9C550()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_248A9C55C()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_248A9C568()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_248A9C574()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_248A9C580()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_248A9C58C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_248A9C598()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_248A9C5A4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_248A9C5B0()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_248A9C5BC()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_248A9C5C8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_248A9C5D4()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_248A9C5E0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_248A9C5EC()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_248A9C5F8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_248A9C604()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_248A9C610()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_248A9C61C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_248A9C628()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_248A9C634()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_248A9C640()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_248A9C64C()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_248A9C658()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_248A9C664()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_248A9C670()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_248A9C67C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_248A9C688()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_248A9C694()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_248A9C6A0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_248A9C6AC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_248A9C6B8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_248A9C6C4()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_248A9C6D0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_248A9C6DC()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_248A9C6E8()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_248A9C6F4()
{
  return MEMORY[0x24BEB7F18]();
}

uint64_t sub_248A9C700()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_248A9C70C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_248A9C718()
{
  return MEMORY[0x24BDD0508]();
}

uint64_t sub_248A9C724()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_248A9C730()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_248A9C73C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_248A9C748()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_248A9C754()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_248A9C760()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_248A9C76C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_248A9C778()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_248A9C784()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_248A9C790()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_248A9C79C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_248A9C7A8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_248A9C7B4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_248A9C7C0()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_248A9C7CC()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_248A9C7D8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_248A9C7E4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_248A9C7F0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_248A9C7FC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_248A9C808()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_248A9C814()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_248A9C820()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_248A9C82C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_248A9C838()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_248A9C844()
{
  return MEMORY[0x24BEE4328]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_unownedRelease()
{
  return MEMORY[0x24BEE4FF0]();
}

uint64_t swift_unownedRetain()
{
  return MEMORY[0x24BEE4FF8]();
}

uint64_t swift_unownedRetainStrong()
{
  return MEMORY[0x24BEE5000]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

