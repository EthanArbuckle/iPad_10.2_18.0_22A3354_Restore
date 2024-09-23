uint64_t sub_1A039D594(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 24) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(_WORD *)((char *)a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v8 + 24) & ~v8, v6, v4);
      v16 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((_BYTE *)a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A039D668 + 4 * byte_1A03D6830[(v10 - 1)]))();
}

uint64_t FastColumn.projectedValue.getter()
{
  return swift_retain();
}

_QWORD *FastColumn.init(wrappedValue:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a3;
  v3[4] = a1;
  v3[2] = a2;
  return v3;
}

uint64_t _s5TeaDB8SQLErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A039D738(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_1A039D738(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 0x1Cu)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t dispatch thunk of Column.value.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_1A039D760(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t destroy for Expression()
{
  return swift_release();
}

uint64_t destroy for SQLError(uint64_t a1)
{
  return sub_1A03AE590(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1A039D7A8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
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
  *(_BYTE *)(result + 8) = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for Versions(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1A039D820(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t storeEnumTagSinglePayload for Versions(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for OrderBy(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1A039D8AC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return (v6 + v12 + 1);
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A039D95C + 4 * byte_1A03D8FD8[(v8 - 1)]))();
}

uint64_t type metadata accessor for JSON(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JSON);
}

uint64_t sub_1A039D9B4(_QWORD *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a3;
  v9 = *(_QWORD *)(*a3 + 8);
  a1[1] = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEE9A0], a2, &v9);
  v8 = *(_QWORD *)(v5 + 16);
  a1[2] = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEE988], a2, &v8);
  v7 = *(_QWORD *)(v5 + 24);
  result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for <A> A?, a2, &v7);
  a1[3] = result;
  return result;
}

uint64_t Date.queryValue.getter()
{
  sub_1A03D5900();
  sub_1A03D5D68();
  return 0;
}

uint64_t sub_1A039DA84(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyEntity<A>);
  result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyEntity<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A039DAC8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A039DB08()
{
  return swift_initClassMetadata2();
}

uint64_t == infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_QWORD *)(v3 + 32) = v0;
  OUTLINED_FUNCTION_21_2(v3 | 0x8000000000000000);
  return OUTLINED_FUNCTION_9_3();
}

{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_8();
  v2 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v2);
  *v0 = v1;
  return OUTLINED_FUNCTION_0_7();
}

uint64_t sub_1A039DBA4()
{
  return swift_initClassMetadata2();
}

uint64_t JSON.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  sub_1A03D57EC();
  OUTLINED_FUNCTION_31();
  sub_1A03D57E0();
  v2 = sub_1A03D57D4();
  v4 = v3;
  result = swift_release();
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = 4;
  return result;
}

uint64_t sub_1A039DC90()
{
  return sub_1A039DCA8();
}

uint64_t sub_1A039DCA8()
{
  return sub_1A039DCE0();
}

uint64_t sub_1A039DCE0()
{
  return sub_1A03D5E1C();
}

uint64_t sub_1A039DD24()
{
  return swift_initClassMetadata2();
}

unint64_t sub_1A039DD64()
{
  unint64_t result;

  result = qword_1ED0CE010;
  if (!qword_1ED0CE010)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CE010);
  }
  return result;
}

void KeyValueStore.readAsync(_:)()
{
  OUTLINED_FUNCTION_1();
  type metadata accessor for KeyValueStore.Promises();
}

#error "1A039DDE0: call analysis failed (funcsize=15)"

uint64_t sub_1A039DE18(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyJSON<A>);
  result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyJSON<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

char *sub_1A039DE5C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1A03B1D80(0, (unint64_t *)&unk_1ED0CE018, MEMORY[0x1E0DEE720], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A03C501C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03B4D40(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A039DF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  __int128 v18;
  char v19;
  uint64_t v20;
  char v21;

  v6 = *(_QWORD **)v4;
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  OUTLINED_FUNCTION_5_11(a1, a2, *(_QWORD *)(v6[13] + 8), a4);
  v21 = 4;
  v8 = sub_1A03A050C(v7);
  v20 = 0xF000000000000007;
  v18 = 0uLL;
  v19 = -1;
  v9 = v6[10];
  v10 = v6[12];
  v11 = sub_1A03A9DFC(v8, &v20, (uint64_t)&v18, 0, 1, v9, v10);
  OUTLINED_FUNCTION_6_5();
  sub_1A03A60E8(v11, v9, v10, v12);
  v13 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_7(v13, (uint64_t)&v18);
  v16 = OUTLINED_FUNCTION_0_19(&v21, v14, v15, &v18);
  sub_1A03AD83C(v16);
  OUTLINED_FUNCTION_4_5();
  return v5;
}

uint64_t Database.deinit()
{
  uint64_t v0;

  swift_release();

  return v0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.close()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_72();
  if (*(_QWORD *)(v0 + 24))
  {
    v2 = *(_QWORD *)(v0 + 16);
    if (v2)
    {
      if ((*(_QWORD *)(v2 + 16) & 4) != 0)
        v1 = sub_1A03B3860();
    }
    MEMORY[0x1E0C80A78](v1);
    sub_1A03D5E1C();
    OUTLINED_FUNCTION_20_0();
  }
}

uint64_t sub_1A039E138(uint64_t *a1)
{
  uint64_t result;
  unint64_t v2;

  result = type metadata accessor for LazyLoader.LoadState(319, a1[10], a1[11], a1[12]);
  if (v2 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1A039E1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  OUTLINED_FUNCTION_7_14();
  a29 = v31;
  a30 = v32;
  v33 = *v30;
  v35 = *v34;
  v37 = *(_QWORD *)v36;
  v38 = *(_QWORD *)(v36 + 8);
  v39 = *(_BYTE *)(v36 + 16);
  OUTLINED_FUNCTION_5_11((uint64_t)v34, v36, *(_QWORD *)(*(_QWORD *)(*v30 + 104) + 8), v40);
  v41 = OUTLINED_FUNCTION_12_9();
  sub_1A03A050C(v41);
  a15 = v35;
  *(_QWORD *)&a11 = v37;
  *((_QWORD *)&a11 + 1) = v38;
  a12 = v39;
  v42 = *(_QWORD *)(v33 + 80);
  v43 = *(_QWORD *)(v33 + 96);
  swift_retain();
  v44 = OUTLINED_FUNCTION_10_7();
  v49 = sub_1A03A9DFC(v44, v45, v46, v47, v48, v42, v43);
  swift_release();
  OUTLINED_FUNCTION_6_5();
  sub_1A03A60E8(v49, v42, v43, v50);
  v51 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_7(v51, (uint64_t)&a11);
  v54 = OUTLINED_FUNCTION_0_19(&a20, v52, v53, &a11);
  OUTLINED_FUNCTION_4_16(v54);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_1A039E290()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_1A039E310()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A039E350(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A039E39C(qword_1ED0CE050, MEMORY[0x1E0CB08C0]);
  result = sub_1A039E39C(&qword_1ED0CE048, MEMORY[0x1E0CB0890]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A039E39C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1A03D5918();
    result = MEMORY[0x1A1AF9BC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A039E3DC()
{
  return swift_initClassMetadata2();
}

void KeyValueStore.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_1A03B1D80(0, (unint64_t *)&qword_1ED0CE768, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = OUTLINED_FUNCTION_32();
  *(_OWORD *)(v4 + 16) = xmmword_1A03D6820;
  *(_QWORD *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 40) = a2;
  swift_bridgeObjectRetain();
  KeyValueStore.read(_:maxAge:)(v4);
  swift_bridgeObjectRelease();
  sub_1A03D5B40();
  swift_bridgeObjectRelease();
  v5 = sub_1A03D5B28();
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DE9FA0], v5);
  sub_1A03D5DA4();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
}

uint64_t KeyValueStore.Promises.allKeys()()
{
  sub_1A039E5BC();
  OUTLINED_FUNCTION_31();
  return sub_1A03D5A08();
}

void sub_1A039E5BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CDAF0)
  {
    sub_1A03B1D80(255, (unint64_t *)&qword_1ED0CE718, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    v0 = sub_1A03D5A14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CDAF0);
  }
}

uint64_t sub_1A039E628(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_bundleIdentifier);

  if (!v2)
    return 0;
  v3 = sub_1A03D5BDC();

  return v3;
}

uint64_t sub_1A039E694()
{
  id v0;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  sub_1A039E628(v0);
  sub_1A039DD64();
  OUTLINED_FUNCTION_0_3();
  result = sub_1A03D5EB8();
  qword_1ED0D0000 = result;
  return result;
}

uint64_t KeyValueStore.Promises.write(_:)()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_8_0();
  return OUTLINED_FUNCTION_41();
}

uint64_t QuerySome.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A039E7A4()
{
  return swift_initClassMetadata2();
}

uint64_t Database.asyncWrite(_:qos:block:)()
{
  sub_1A03A1F38();
  OUTLINED_FUNCTION_31();
  return sub_1A03D5A08();
}

uint64_t sub_1A039E840()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A039E880(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_1A039E8A0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1A039E8C0()
{
  sub_1A039E8C8();
}

void sub_1A039E8C8()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A039E920()
{
  sub_1A03D59CC();
  swift_endAccess();
  return swift_bridgeObjectRelease();
}

uint64_t Delete.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t LazyJSON.__deallocating_deinit()
{
  LazyJSON.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyJSON.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t sub_1A039E9C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A039EA48(void (*a1)(uint64_t *))
{
  return sub_1A039EA74(a1);
}

uint64_t sub_1A039EA74(void (*a1)(uint64_t *))
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = KeyValueStore.allKeys()();
    swift_release();
    v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.allKeys()()
{
  uint64_t v0;
  uint64_t v2;

  v2 = MEMORY[0x1E0DEE9D8];
  sub_1A03D5E1C();
  if (v0)
    swift_bridgeObjectRelease();
  return v2;
}

void Database.__allocating_init(safeLocation:)()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  __n128 *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  __n128 *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __n128 *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v0;
  if (qword_1ED0CE030 != -1)
    swift_once();
  sub_1A03A00AC();
  v40 = v3;
  v4 = (__n128 *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_51(v4, (__n128)xmmword_1A03D6820);
  v5 = OUTLINED_FUNCTION_74();
  v7 = v6;
  v4[3].n128_u64[1] = MEMORY[0x1E0DEA968];
  v8 = sub_1A03A0110();
  v4[4].n128_u64[0] = v8;
  v4[2].n128_u64[0] = v5;
  v4[2].n128_u64[1] = v7;
  sub_1A03D5DEC();
  OUTLINED_FUNCTION_36_0();

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_43_0();
  if (qword_1ED0CDB10 != -1)
    swift_once();
  HIBYTE(v46) = 0;
  OUTLINED_FUNCTION_0();
  BYTE4(v42) = 1;
  OUTLINED_FUNCTION_0_6();
  v38 = v2;
  if (v1)
  {
    v9 = v1;
    v10 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    v11 = (__n128 *)OUTLINED_FUNCTION_0();
    v12 = OUTLINED_FUNCTION_7_3(v11, (__n128)xmmword_1A03D6810);
    v13 = MEMORY[0x1E0DEA968];
    v11[3].n128_u64[1] = MEMORY[0x1E0DEA968];
    v11[4].n128_u64[0] = v8;
    v11[2].n128_u64[0] = v12;
    v11[2].n128_u64[1] = v14;
    v15 = sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
    OUTLINED_FUNCTION_56(v15, v16, v15, MEMORY[0x1E0DED578], MEMORY[0x1E0DED588], v17, v18, v19, v31, v33, 2, 4, v36, v38, v40, v42, v44, v46, (char)v9);
    v37 = v20;
    sub_1A03D6008();
    v11[6].n128_u64[0] = v13;
    v11[6].n128_u64[1] = v8;
    v11[4].n128_u64[1] = 0;
    v11[5].n128_u64[0] = 0xE000000000000000;
    OUTLINED_FUNCTION_78();
    OUTLINED_FUNCTION_77();

    OUTLINED_FUNCTION_45();
    HIBYTE(v47) = 0;
    OUTLINED_FUNCTION_0();
    BYTE4(v43) = 1;
    OUTLINED_FUNCTION_0_6();
    if (v10)
    {
      v21 = (id)qword_1ED0D0000;
      HIDWORD(v34) = sub_1A03D5DD4();
      v22 = (__n128 *)OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_7_3(v22, v35);
      OUTLINED_FUNCTION_2_4();
      v23 = MEMORY[0x1E0DEA968];
      v22[3].n128_u64[1] = MEMORY[0x1E0DEA968];
      v22[4].n128_u64[0] = v8;
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_56(v24, v25, v26, MEMORY[0x1E0DED578], MEMORY[0x1E0DED588], v27, v28, v29, v32, v34, v35.n128_i64[0], v35.n128_i64[1], v37, v39, v41, v43, v45, v47, 0);
      sub_1A03D6008();
      v22[6].n128_u64[0] = v23;
      v22[6].n128_u64[1] = v8;
      v22[4].n128_u64[1] = 0;
      v22[5].n128_u64[0] = 0;
      OUTLINED_FUNCTION_77();

      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_75();

      v30 = v10;
    }
    else
    {
      OUTLINED_FUNCTION_2_4();
      v30 = v9;
    }

  }
  else
  {
    OUTLINED_FUNCTION_2_4();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t sub_1A039EEC4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A039EF04()
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

uint64_t KeyValueStore.subscript.getter(uint64_t a1)
{
  return KeyValueStore.read(_:maxAge:)(a1);
}

uint64_t JSON.init(valueType:connection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t result;
  uint64_t v14;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v8 + 16) == 4)
  {
    v11 = *(_QWORD *)v8;
    v12 = *(_QWORD *)(v8 + 8);
    sub_1A03D5960();
    OUTLINED_FUNCTION_31();
    sub_1A03AC284(v11, v12);
    sub_1A03D5954();
    sub_1A03D5948();
    swift_release();
    OUTLINED_FUNCTION_1_21();
    OUTLINED_FUNCTION_1_21();
    __swift_destroy_boxed_opaque_existential_1(a2);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v7 + 32))(a4, v10, a3);
  }
  else
  {
    sub_1A03D6038();
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A039F178()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Database()
{
  return objc_opt_self();
}

uint64_t sub_1A039F1F8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t LazyLoader.__deallocating_deinit()
{
  LazyLoader.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyLoader.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t State;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 104);
  State = type metadata accessor for LazyLoader.LoadState(0, *(_QWORD *)(*(_QWORD *)v0 + 80), *(_QWORD *)(*(_QWORD *)v0 + 88), *(_QWORD *)(*(_QWORD *)v0 + 96));
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(State - 8) + 8))(v1, State);
  swift_release();
  return v0;
}

void sub_1A039F2E8(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x10)
    v3 = 16;
  v4 = *((unsigned __int8 *)a1 + v3);
  if (v4 < 3)
  {
    if (v4 == 2)
    {

    }
    else if (v4 == 1)
    {
      swift_release();
    }
    else
    {
      (*(void (**)(void))(v2 + 8))();
    }
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    ((void (*)(void))((char *)&loc_1A039F330 + 4 * byte_1A03D94ED[v5]))();
  }
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.userVersion()()
{
  uint64_t v0;
  uint64_t v1;
  Swift::Int v2;
  uint64_t v3;
  uint64_t v4;
  char v6;
  Swift::Int v7;
  unint64_t v8;
  char v9;

  if (*(_QWORD *)(v0 + 16))
  {
    swift_retain();
    sub_1A03AEFF4(0xD000000000000014, 0x80000001A03D9AC0);
    if (v1)
    {
      swift_release();
    }
    else
    {
      sub_1A03ADEE4();
      v6 = 1;
      sub_1A03ADFEC((uint64_t)&v6);
      v2 = v7;
      if (v9 == 1)
      {
        sub_1A03AE2E4();
        OUTLINED_FUNCTION_40();
        OUTLINED_FUNCTION_25();
      }
      else
      {
        sub_1A03ADE98(v7, v8, v9);
        sub_1A03AE2E4();
        OUTLINED_FUNCTION_40();
        OUTLINED_FUNCTION_25();
        return -1;
      }
    }
  }
  else
  {
    sub_1A03BCD78();
    v3 = OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v3, v4);
  }
  return v2;
}

void Create<>.migrate<A>(from:ifNotExists:migrate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  __int128 v40;
  uint64_t v41;
  _UNKNOWN **v42;
  uint64_t v43;

  if (!*(_QWORD *)(v7 + 56))
  {
LABEL_11:
    OUTLINED_FUNCTION_40_2();
    sub_1A03A63F0(v24);
    goto LABEL_12;
  }
  v43 = a6;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_26_4();
  OUTLINED_FUNCTION_25();
  if (!v8)
  {
    swift_retain();
    v9 = OUTLINED_FUNCTION_38_2();
    v41 = MEMORY[0x1E0DEA968];
    v42 = &protocol witness table for String;
    *(_QWORD *)&v40 = v9;
    *((_QWORD *)&v40 + 1) = v10;
    v11 = OUTLINED_FUNCTION_4_4();
    OUTLINED_FUNCTION_43_2(v11);
    sub_1A03A5D80(&v40, v12);
    v13 = sub_1A03A7208(v11, 0, 0, 0xFFu);
    v15 = v14;
    OUTLINED_FUNCTION_56_1();
    OUTLINED_FUNCTION_20_0();
    if (v13)
    {
      v38 = (uint64_t *)(v15 + 32);
      OUTLINED_FUNCTION_72();
      v16 = *(_QWORD *)(v15 + 32);
      OUTLINED_FUNCTION_72();
      v18 = *(_QWORD *)(v16 + 24);
      v17 = *(_QWORD *)(v16 + 32);
      v19 = *(uint64_t (**)(void))(*(_QWORD *)(a7 + 8) + 40);
      OUTLINED_FUNCTION_24_3();
      v20 = v19();
      if (!v17)
      {
        OUTLINED_FUNCTION_6_5();
        goto LABEL_26;
      }
      if (v18 == v20 && v17 == v21)
      {
        OUTLINED_FUNCTION_6_11();
        OUTLINED_FUNCTION_6_5();
      }
      else
      {
        v23 = OUTLINED_FUNCTION_7_16();
        OUTLINED_FUNCTION_6_11();
        OUTLINED_FUNCTION_6_5();
        if ((v23 & 1) == 0)
          goto LABEL_26;
      }
      v25 = *v38;
      OUTLINED_FUNCTION_72();
      v27 = *(_QWORD *)(v25 + 24);
      v26 = *(_QWORD *)(v25 + 32);
      OUTLINED_FUNCTION_24_3();
      v28 = OUTLINED_FUNCTION_38_2();
      if (v26)
      {
        if (v27 == v28 && v26 == v29)
        {
          OUTLINED_FUNCTION_6_11();
          OUTLINED_FUNCTION_6_5();
          goto LABEL_26;
        }
        v31 = OUTLINED_FUNCTION_7_16();
        OUTLINED_FUNCTION_6_11();
        OUTLINED_FUNCTION_6_5();
        if ((v31 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        OUTLINED_FUNCTION_6_5();
      }
      OUTLINED_FUNCTION_40_2();
      sub_1A03D389C(v32, v33, v34, v35, v36, v37);
LABEL_26:
      swift_release();
      OUTLINED_FUNCTION_55_0();
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_12:
  OUTLINED_FUNCTION_13_8();
}

uint64_t assertion<A>(_:invoking:)(char *a1, void (*a2)(void))
{
  void *v2;
  char v5;

  v5 = *a1;
  sub_1A039F7C0(&v5);
  if (v2)

  a2();
  return swift_release();
}

uint64_t sub_1A039F7C0(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  v2 = *a1;
  type metadata accessor for Assertion();
  v3 = swift_allocObject();
  *(_BYTE *)(v3 + 16) = v2;
  sub_1A03B3A5C();
  if (v1)
    swift_release();
  return v3;
}

uint64_t && infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *a2;
  v4 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  OUTLINED_FUNCTION_17_2(v4 | 0x6000000000000000);
  return OUTLINED_FUNCTION_8_3();
}

uint64_t sub_1A039F864(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = *(_QWORD *)(a1 + 80);
  result = sub_1A03D5EC4();
  if (v5 <= 0x3F)
  {
    type metadata accessor for Column.Func(255, v2, *(_QWORD *)(a1 + 88), v4);
    result = sub_1A03D5EC4();
    if (v6 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void sub_1A039F920()
{
  type metadata accessor for QuerySome();
}

uint64_t sub_1A039F950(uint64_t a1)
{
  __int128 v2;

  OUTLINED_FUNCTION_0_22(a1);
  return sub_1A039F980(&v2);
}

void type metadata accessor for QuerySome()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t sub_1A039F980(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_1A03A5D80(a1, v2 + 16);
  return v2;
}

uint64_t Query.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A039F9E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1A1AF9BC4](a4);
  result = MEMORY[0x1A1AF9BC4](a5, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t Create.__deallocating_deinit()
{
  Create.deinit();
  return swift_deallocClassInstance();
}

uint64_t Create.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A039FA74(*(_QWORD *)(v0 + 56));
  return v0;
}

uint64_t sub_1A039FA74(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t KeyValueStore.Promises.read(_:maxAge:)()
{
  OUTLINED_FUNCTION_40_0();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_8_0();
  return OUTLINED_FUNCTION_41();
}

uint64_t sub_1A039FB18()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1A039FB38()
{
  uint64_t v0;

  return sub_1A039FB50(*(uint64_t **)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t sub_1A039FB50(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *a2;
  sub_1A03A5C98();
  v9 = sub_1A039FC78(v5, v6, v7, v8);
  result = swift_release();
  if (!v2)
  {
    v21 = v9;
    MEMORY[0x1E0C80A78](result);
    v11 = *(_OWORD *)(v4 + 96);
    v18 = *(_OWORD *)(v4 + 80);
    v19 = v11;
    v20 = *(_QWORD *)(v4 + 112);
    type metadata accessor for KVSEntity(255, v18, v11, v12);
    v13 = sub_1A03D5D50();
    v14 = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v13);
    v16 = sub_1A03D2B08((void (*)(char *, uint64_t))sub_1A03B8734, (uint64_t)&v17, v13, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEDCE8], v14, MEMORY[0x1E0DEDD18], v15);
    swift_bridgeObjectRelease();
    *a1 = v16;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A039FC78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  __int128 v15;
  char v16;
  uint64_t v17;
  char v18;

  OUTLINED_FUNCTION_0_8(a1, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 88) + 24), a4);
  v18 = 4;
  v17 = 0xF000000000000007;
  v15 = 0uLL;
  v16 = -1;
  v6 = OUTLINED_FUNCTION_1_5(&v17, (uint64_t)&v15);
  OUTLINED_FUNCTION_3_4(v6, v7, v8, v9);
  v10 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_4(v10, (uint64_t)&v15);
  v13 = OUTLINED_FUNCTION_5_4(&v18, v11, v12, &v15);
  OUTLINED_FUNCTION_7_5(v13);
  OUTLINED_FUNCTION_4_5();
  return v5;
}

uint64_t FastEntity.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t _s5TeaDB8DatabaseC8LocationOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A03A0094(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

void Database.__allocating_init(safeLocation:assertions:recoveryMode:)()
{
  void *v0;
  uint64_t v1;
  __n128 *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  __n128 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __n128 *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  if (qword_1ED0CE030 != -1)
    swift_once();
  sub_1A03A00AC();
  v34 = v1;
  v2 = (__n128 *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_51(v2, (__n128)xmmword_1A03D6820);
  v3 = OUTLINED_FUNCTION_74();
  v5 = v4;
  v2[3].n128_u64[1] = MEMORY[0x1E0DEA968];
  v36 = sub_1A03A0110();
  v2[4].n128_u64[0] = v36;
  v2[2].n128_u64[0] = v3;
  v2[2].n128_u64[1] = v5;
  sub_1A03D5DEC();
  OUTLINED_FUNCTION_36_0();

  OUTLINED_FUNCTION_8_1();
  HIBYTE(v45) = 0;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_43_0();
  BYTE4(v41) = 1;
  OUTLINED_FUNCTION_0_6();
  v38 = v0;
  if (v0)
  {
    v6 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    v7 = (__n128 *)OUTLINED_FUNCTION_0();
    v8 = OUTLINED_FUNCTION_7_3(v7, (__n128)xmmword_1A03D6810);
    v9 = MEMORY[0x1E0DEA968];
    v10 = v36;
    v7[3].n128_u64[1] = MEMORY[0x1E0DEA968];
    v7[4].n128_u64[0] = v36;
    v7[2].n128_u64[0] = v8;
    v7[2].n128_u64[1] = v11;
    v12 = sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
    OUTLINED_FUNCTION_56(v12, v13, v12, MEMORY[0x1E0DED578], MEMORY[0x1E0DED588], v14, v15, v16, 2, 4, v30, v32, v34, v36, (uint64_t)v38, v41, v43, v45, (char)v38);
    v33 = v17;
    sub_1A03D6008();
    v7[6].n128_u64[0] = v9;
    v7[6].n128_u64[1] = v10;
    v7[4].n128_u64[1] = 0;
    v7[5].n128_u64[0] = 0xE000000000000000;
    OUTLINED_FUNCTION_78();
    sub_1A03D5A2C();

    swift_bridgeObjectRelease();
    HIBYTE(v46) = 0;
    OUTLINED_FUNCTION_0();
    BYTE4(v42) = 1;
    OUTLINED_FUNCTION_0_6();
    if (v6)
    {
      v18 = (id)qword_1ED0D0000;
      sub_1A03D5DD4();
      v19 = (__n128 *)OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_7_3(v19, v29);
      OUTLINED_FUNCTION_2_4();
      v20 = MEMORY[0x1E0DEA968];
      v21 = v37;
      v19[3].n128_u64[1] = MEMORY[0x1E0DEA968];
      v19[4].n128_u64[0] = v37;
      OUTLINED_FUNCTION_73();
      OUTLINED_FUNCTION_56(v22, v23, v24, MEMORY[0x1E0DED578], MEMORY[0x1E0DED588], v25, v26, v27, v29.n128_i64[0], v29.n128_i64[1], v31, v33, v35, v37, (uint64_t)v39, v42, v44, v46, 0);
      sub_1A03D6008();
      v19[6].n128_u64[0] = v20;
      v19[6].n128_u64[1] = v21;
      v19[4].n128_u64[1] = 0;
      v19[5].n128_u64[0] = 0;
      OUTLINED_FUNCTION_77();

      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_0();
      OUTLINED_FUNCTION_75();

      v28 = v6;
    }
    else
    {
      OUTLINED_FUNCTION_2_4();
      v28 = v39;
    }

  }
  else
  {
    OUTLINED_FUNCTION_2_4();
  }
  OUTLINED_FUNCTION_23_1();
}

uint64_t sub_1A03A0094(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRetain();
  return result;
}

void sub_1A03A00AC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CDFF0)
  {
    sub_1A03A5FF8(255, &qword_1ED0CDFF8);
    v0 = sub_1A03D6110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CDFF0);
  }
}

unint64_t sub_1A03A0110()
{
  unint64_t result;

  result = qword_1ED0CDFD0;
  if (!qword_1ED0CDFD0)
  {
    result = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED0CDFD0);
  }
  return result;
}

uint64_t Save.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

void sub_1A03A0170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1A03A019C(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_BYTE *)(v4 + 24), *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48));
  OUTLINED_FUNCTION_64();
}

uint64_t sub_1A03A019C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a1;
  *(_QWORD *)(v16 + 24) = a2;
  v17 = swift_allocObject();
  swift_weakInit();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v17;
  *(_QWORD *)(v18 + 24) = a3;
  *(_QWORD *)(v18 + 32) = a4;
  *(_BYTE *)(v18 + 40) = a6;
  *(_QWORD *)(v18 + 48) = a7;
  *(_QWORD *)(v18 + 56) = a8;
  *(_QWORD *)(v18 + 64) = sub_1A03A3FD8;
  *(_QWORD *)(v18 + 72) = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A03A255C(a9, (uint64_t)sub_1A03A33F0, v18);
  sub_1A03D5E34();
  swift_release();
  return swift_release();
}

uint64_t dispatch thunk of Query.first(_:orderBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_1A03A02D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  char v24;

  v6 = *a1;
  v7 = *(_QWORD *)a2;
  v8 = *(_QWORD *)(a2 + 8);
  v9 = *(_BYTE *)(a2 + 16);
  v10 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  OUTLINED_FUNCTION_0_8((uint64_t)a1, a2, *(_QWORD *)(v10 + 24), a4);
  v24 = 4;
  v23 = v6;
  *(_QWORD *)&v21 = v7;
  *((_QWORD *)&v21 + 1) = v8;
  v22 = v9;
  v11 = OUTLINED_FUNCTION_6_4(&v23, (uint64_t)&v21);
  OUTLINED_FUNCTION_12_3(v11, v12, v13, v14);
  v15 = OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_4(v15, (uint64_t)&v21);
  v18 = OUTLINED_FUNCTION_9_4(&v24, v16, v17, &v21);
  OUTLINED_FUNCTION_13_4(v18);
  result = OUTLINED_FUNCTION_11_5();
  if (!v5)
  {
    *(_QWORD *)&v21 = v10;
    v20 = OUTLINED_FUNCTION_14_4();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v20);
    sub_1A03D5DA4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t dispatch thunk of QuerySome.first(_:orderBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_1A03A03E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
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
  uint64_t result;
  uint64_t v21;
  __int128 v22;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_7_14();
  v26 = v1;
  v27 = v2;
  v4 = *v3;
  v5 = v0 + 16;
  v7 = *(_QWORD *)v6;
  v8 = *(_QWORD *)(v6 + 8);
  v9 = *(unsigned __int8 *)(v6 + 16);
  OUTLINED_FUNCTION_9_10((uint64_t)v3, v6, v2, v10);
  v11 = OUTLINED_FUNCTION_3_15();
  v24 = v4;
  *(_QWORD *)&v22 = v7;
  *((_QWORD *)&v22 + 1) = v8;
  v23 = v9;
  swift_retain();
  OUTLINED_FUNCTION_15_11(v11, &v24, (uint64_t)&v22, 1, 0);
  swift_release();
  v12 = OUTLINED_FUNCTION_6_5();
  v16 = OUTLINED_FUNCTION_11_11(v12, v13, v14, v15);
  v18 = v17;
  swift_bridgeObjectRelease();
  sub_1A03AE220(v5, (uint64_t)&v22);
  v19 = sub_1A03AD7A0(&v25, v16, v18, &v22);
  OUTLINED_FUNCTION_4_16(v19);
  result = OUTLINED_FUNCTION_11_5();
  if (!v9)
  {
    *(_QWORD *)&v22 = v5;
    v21 = OUTLINED_FUNCTION_14_4();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v21);
    sub_1A03D5DA4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A03A050C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v4 = &v9[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(void))(*(_QWORD *)(v5 + 8) + 8))();
  v6 = sub_1A03B0058(a1);
  v7 = sub_1A03CCF68(v6);
  swift_bridgeObjectRelease();
  (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, a1);
  return v7;
}

uint64_t PreparedStatement.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t FastColumn.wrappedValue.getter()
{
  OUTLINED_FUNCTION_0_17();
  return swift_retain();
}

uint64_t dispatch thunk of Delete.all()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_1A03A0660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v33[7];

  OUTLINED_FUNCTION_3_7(a4, *v4);
  v8 = sub_1A03A0898(v6, v7);
  OUTLINED_FUNCTION_8_7(v8, v9, v10, v11);
  v12 = OUTLINED_FUNCTION_4_9();
  v20 = OUTLINED_FUNCTION_9_6(v12, v13, v14, v15, v16, v17, v18, v19, v29);
  v28 = OUTLINED_FUNCTION_2_9(v20, v21, v22, v23, v24, v25, v26, v27, v29, v30, v31, v32, *(int *)v33, *(__int16 *)&v33[4], v33[6], 3);
  OUTLINED_FUNCTION_1_10(v28);
  OUTLINED_FUNCTION_0_13();
  if (!v5)
    OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_7();
}

uint64_t sub_1A03A06CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v7 = v6;
  v9 = *(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    sub_1A03ACC98(v8 > 1, v9 + 1, 1, v6);
    v7 = v21;
  }
  *(_QWORD *)(v7 + 16) = v9 + 1;
  v10 = v7 + 16 * v9;
  *(_QWORD *)(v10 + 32) = 0x46204554454C4544;
  *(_QWORD *)(v10 + 40) = 0xEB000000004D4F52;
  v11 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 32))(a2);
  v13 = v12;
  v15 = *(_QWORD *)(v7 + 16);
  v14 = *(_QWORD *)(v7 + 24);
  v16 = v15 + 1;
  if (v15 >= v14 >> 1)
  {
    sub_1A03ACC98(v14 > 1, v15 + 1, 1, v7);
    v7 = v22;
  }
  *(_QWORD *)(v7 + 16) = v16;
  v17 = v7 + 16 * v15;
  *(_QWORD *)(v17 + 32) = v11;
  *(_QWORD *)(v17 + 40) = v13;
  if (*(_QWORD *)(a1 + 16))
  {
    v18 = *(_QWORD *)(v7 + 24);
    if (v16 >= v18 >> 1)
    {
      sub_1A03ACC98(v18 > 1, v15 + 2, 1, v7);
      v7 = v23;
    }
    *(_QWORD *)(v7 + 16) = v15 + 2;
    v19 = v7 + 16 * v16;
    *(_QWORD *)(v19 + 32) = 0x4552454857;
    *(_QWORD *)(v19 + 40) = 0xE500000000000000;
    sub_1A03A86F0();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1A03A0848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for DeleteCommand(0, a2, a3, a4);
  return sub_1A03AD180();
}

uint64_t type metadata accessor for DeleteCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DeleteCommand);
}

uint64_t sub_1A03A0898(uint64_t a1, uint64_t a2)
{
  return sub_1A03A06CC(MEMORY[0x1E0DEE9D8], a1, a2);
}

uint64_t Assertion.__deallocating_deinit()
{
  Assertion.deinit();
  return swift_deallocClassInstance();
}

uint64_t FastColumn.__deallocating_deinit()
{
  FastColumn.deinit();
  OUTLINED_FUNCTION_2_16();
  return swift_deallocClassInstance();
}

uint64_t FastColumn.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1A03A0908()
{
  sub_1A03A0928();
  return swift_deallocClassInstance();
}

uint64_t sub_1A03A0928()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 40);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t LazyJSON.loaderValue.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  LazyLoader.load()(a1, a2);
  return __swift_storeEnumTagSinglePayload((uint64_t)a2, 0, 1, *(_QWORD *)(v4 + 80));
}

void LazyLoader.load()(uint64_t a1@<X0>, id a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t State;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  int EnumCaseMultiPayload;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  _QWORD *v26;
  id v27;
  _QWORD *v28;
  _DWORD v29[4];
  _QWORD *v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;

  v32 = a2;
  v3 = v2;
  v4 = (_QWORD *)*v2;
  v5 = v4[10];
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  State = type metadata accessor for LazyLoader.LoadState(0, v5, v4[11], v4[12]);
  v8 = *(_QWORD *)(State - 8);
  v9 = MEMORY[0x1E0C80A78](State);
  v30 = (_QWORD *)((char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v29 - v11;
  sub_1A03D596C();
  v13 = (uint64_t)v3 + *(_QWORD *)(*v3 + 104);
  swift_beginAccess();
  v31 = v8;
  OUTLINED_FUNCTION_39((uint64_t)v12, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!EnumCaseMultiPayload)
    goto LABEL_10;
  if (EnumCaseMultiPayload != 1)
  {
    swift_willThrow();
    goto LABEL_11;
  }
  v15 = (void *)*((_QWORD *)v12 + 1);
  v16 = v33;
  (*(void (**)(void))v12)();
  if (!v16)
  {
    swift_release();
    v28 = v30;
    OUTLINED_FUNCTION_6_12((uint64_t)v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    swift_storeEnumTagMultiPayload();
    OUTLINED_FUNCTION_1_24();
    OUTLINED_FUNCTION_39(v13, (uint64_t)v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 40));
    swift_endAccess();
LABEL_10:
    OUTLINED_FUNCTION_6_12((uint64_t)v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
    goto LABEL_11;
  }
  v33 = v15;
  if (qword_1ED0CE030 != -1)
    swift_once();
  v32 = (id)qword_1ED0D0000;
  v29[3] = sub_1A03D5DD4();
  sub_1A03A00AC();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_1A03D6810;
  v18 = sub_1A03D623C();
  v20 = v19;
  v21 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEA968];
  v22 = sub_1A03A0110();
  *(_QWORD *)(v17 + 64) = v22;
  *(_QWORD *)(v17 + 32) = v18;
  *(_QWORD *)(v17 + 40) = v20;
  v34 = 0;
  v35 = 0xE000000000000000;
  v36 = v16;
  sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
  sub_1A03D6008();
  v23 = v34;
  v24 = v35;
  *(_QWORD *)(v17 + 96) = v21;
  *(_QWORD *)(v17 + 104) = v22;
  *(_QWORD *)(v17 + 72) = v23;
  *(_QWORD *)(v17 + 80) = v24;
  v25 = v32;
  sub_1A03D5A2C();

  swift_bridgeObjectRelease();
  v26 = v30;
  *v30 = v16;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_1_24();
  v27 = v16;
  OUTLINED_FUNCTION_39(v13, (uint64_t)v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 40));
  swift_endAccess();
  swift_willThrow();
  swift_release();
LABEL_11:
  sub_1A03A0F98();
  OUTLINED_FUNCTION_10();
}

id *sub_1A03A0CDC(id *a1, id *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 3)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 2)
    {

    }
    else if (v8 == 1)
    {
      swift_release();
    }
    else
    {
      (*(void (**)(id *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 3)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 2)
    {
      *a1 = *a2;
      v12 = 2;
    }
    else if (v10 == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(id *, id *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

_QWORD *sub_1A03A0E94(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
  if (v6 >= 3)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 2)
  {
    v9 = *(id *)a2;
    v10 = *(id *)a2;
    *a1 = v9;
    *((_BYTE *)a1 + v5) = 2;
  }
  else if (v6 == 1)
  {
    v8 = *(_QWORD *)(a2 + 8);
    *a1 = *(_QWORD *)a2;
    a1[1] = v8;
    *((_BYTE *)a1 + v5) = 1;
    swift_retain();
  }
  else
  {
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    *((_BYTE *)a1 + v5) = 0;
  }
  return a1;
}

uint64_t sub_1A03A0F98()
{
  return sub_1A03D5978();
}

uint64_t sub_1A03A0FC0()
{
  return sub_1A03A0FE0();
}

uint64_t sub_1A03A0FE0()
{
  sub_1A03D5960();
  swift_allocObject();
  sub_1A03D5954();
  sub_1A03D5948();
  return swift_release();
}

uint64_t sub_1A03A1078@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1A03A1098(v1[4], v1[5], (uint64_t)(v1 + 6), v1[2], v1[3], a1);
}

uint64_t sub_1A03A1098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int EnumTagSinglePayload;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  _UNKNOWN **v42;
  char v43;

  v35 = a6;
  v37 = sub_1A03D5EC4();
  v11 = *(_QWORD *)(v37 - 8);
  v12 = MEMORY[0x1E0C80A78](v37);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v34 - v15;
  v17 = *(_QWORD *)(a5 + 8);
  type metadata accessor for Statement(0, a4, *(_QWORD *)(v17 + 24), v18);
  v43 = 4;
  v41 = MEMORY[0x1E0DEA968];
  v42 = &protocol witness table for String;
  *(_QWORD *)&v39 = a1;
  *((_QWORD *)&v39 + 1) = a2;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = 25705;
  *(_QWORD *)(v19 + 24) = 0xE200000000000000;
  sub_1A03AE220((uint64_t)&v39, v19 + 32);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v39);
  v38 = v19;
  v39 = 0uLL;
  v40 = -1;
  v20 = sub_1A03A9ED4(&v38, (uint64_t)&v39, 1, 0, a4, v17);
  swift_release();
  v22 = sub_1A03A60E8(v20, a4, v17, v21);
  v24 = v23;
  swift_bridgeObjectRelease();
  sub_1A03AE220(a3, (uint64_t)&v39);
  v25 = sub_1A03AD7A0(&v43, v22, v24, &v39);
  v26 = v36;
  v27 = sub_1A03AD83C(v25);
  if (v26)
  {

    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, a4);
  }
  else
  {
    v28 = v27;
    swift_release();
    *(_QWORD *)&v39 = v28;
    v29 = sub_1A03D5D50();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v29);
    sub_1A03D5DA4();
    swift_bridgeObjectRelease();
  }
  v30 = v37;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v37);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v14, 1, a4);
  v32 = *(void (**)(char *, uint64_t))(v11 + 8);
  if (EnumTagSinglePayload == 1)
  {
    v32(v14, v30);
    sub_1A03CE710();
    swift_allocError();
    swift_willThrow();
    return ((uint64_t (*)(char *, uint64_t))v32)(v16, v30);
  }
  else
  {
    v32(v16, v30);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v35, v14, a4);
  }
}

void sub_1A03A1368()
{
  sub_1A03A1388();
}

void sub_1A03A1388()
{
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A03A1B60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 96);
  type metadata accessor for KVSEntity(255, v5, v6, a4);
  v7 = sub_1A03D5D50();
  v8 = Database.read<A>(block:)();
  if (v4)
  {
    if (qword_1ED0CE030 != -1)
      swift_once();
    v9 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    sub_1A03A00AC();
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A03D6810;
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
    v13 = v12;
    v14 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
    v15 = sub_1A03A0110();
    *(_QWORD *)(v10 + 64) = v15;
    *(_QWORD *)(v10 + 32) = v11;
    *(_QWORD *)(v10 + 40) = v13;
    sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
    sub_1A03D6008();
    *(_QWORD *)(v10 + 96) = v14;
    *(_QWORD *)(v10 + 104) = v15;
    *(_QWORD *)(v10 + 72) = 0;
    *(_QWORD *)(v10 + 80) = 0xE000000000000000;
    sub_1A03D5A2C();

    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  else
  {
    MEMORY[0x1E0C80A78](v8);
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF60], v7);
    return sub_1A03D5F84();
  }
}

uint64_t Database.read<A>(block:)()
{
  return sub_1A03D5E1C();
}

uint64_t sub_1A03A1DDC()
{
  uint64_t v0;

  return sub_1A03A1DF4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1A03A1DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v5;

  v5 = 0;
  swift_retain();
  v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A03A3FF4, a2);
  swift_release();
  return v3;
}

uint64_t Database.asyncWrite(_:block:)(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;

  sub_1A03A298C(0, &qword_1ED0CDDB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v7);
  v9 = &v13[-v8];
  LOBYTE(a1) = *a1;
  v10 = sub_1A03D5A98();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v10);
  v14 = v3;
  v15 = (char)a1;
  v16 = a2;
  v17 = a3;
  v18 = v9;
  sub_1A03A1F38();
  OUTLINED_FUNCTION_31();
  v11 = sub_1A03D5A08();
  sub_1A03A2A28((uint64_t)v9);
  return v11;
}

void sub_1A03A1F38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CDBE0[0])
  {
    v0 = sub_1A03D5A14();
    if (!v1)
      atomic_store(v0, qword_1ED0CDBE0);
  }
}

void Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
  uint64_t v0;
  unsigned __int8 v1;
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
  unint64_t v14;
  sqlite3 **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  sqlite3 *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  char v31;
  char v32;
  _BYTE v33[5];
  char v34;

  OUTLINED_FUNCTION_32_0();
  v10 = OUTLINED_FUNCTION_11_3(v3, v4, v5, v6, v7, v8, v9);
  v11 = OUTLINED_FUNCTION_65(v10);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x1E0C80A78](v13);
  v14 = OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_17_1(v14);
  v15 = (sqlite3 **)MEMORY[0x1E0DEF810];
  sub_1A03ABCC4(&qword_1ED0CE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  v17 = v16;
  OUTLINED_FUNCTION_55(v16, v18, v19, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  v21 = v20;
  OUTLINED_FUNCTION_58((unint64_t *)&unk_1ED0CE730);
  v22 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_49(v22, *MEMORY[0x1E0DEF8D0]);
  *(_QWORD *)(v2 + 16) = OUTLINED_FUNCTION_10_1();
  if ((v21 & 2) != 0)
    OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_25_0();
  v24 = v23;
  v25 = sub_1A03D5BF4();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_25();
  if ((_DWORD)v24)
  {
    if (sqlite3_errmsg(*v15))
    {
      sub_1A03D5C54();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_4_3();
      *(_QWORD *)v26 = v24;
      *(_QWORD *)(v26 + 8) = v25;
    }
    else
    {
      sub_1A03BCD78();
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_57();
      *(_QWORD *)v26 = v30;
      *(_QWORD *)(v26 + 8) = 0x80000001A03D9A10;
    }
    *(_QWORD *)(v26 + 16) = &unk_1ED0CE728;
    *(_QWORD *)(v26 + 24) = v17;
    *(_BYTE *)(v26 + 32) = v1;
    OUTLINED_FUNCTION_30_0();
    if (*v15)
      sqlite3_close(*v15);
    OUTLINED_FUNCTION_9_0();
    goto LABEL_20;
  }
  sub_1A03A23C4((uint64_t)&unk_1ED0CE728, v17, v1);
  v27 = *v15;
  if (!*v15)
    goto LABEL_20;
  OUTLINED_FUNCTION_76();
  v28 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_41_0(v28);
  *v15 = v27;
  if ((*(_QWORD *)v33 & 0x100000000) == 0)
    sqlite3_busy_timeout(v27, *(int *)v33);
  OUTLINED_FUNCTION_24_1();
  if (v0)
  {
    if ((v32 & 1) != 0
      && (OUTLINED_FUNCTION_71(),
          sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788),
          (OUTLINED_FUNCTION_50() & 1) != 0))
    {
      if (v34 == 10)
      {
        OUTLINED_FUNCTION_47();
        if (qword_1ED0CE030 != -1)
          swift_once();
        v29 = (id)qword_1ED0D0000;
        sub_1A03D5DE0();
        OUTLINED_FUNCTION_52();

        OUTLINED_FUNCTION_42_0();
        OUTLINED_FUNCTION_9_0();
        OUTLINED_FUNCTION_44();
        goto LABEL_20;
      }
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_46();
    }
    else
    {
      OUTLINED_FUNCTION_9_0();
    }
    swift_willThrow();
    goto LABEL_20;
  }
  if ((v31 & 1) == 0)
  {
    OUTLINED_FUNCTION_33_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22_1((uint64_t)"PRAGMA cache_size = ");
    sub_1A03D6104();
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_1();
LABEL_20:
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_10();
}

void sub_1A03A2324(sqlite3 *a1)
{
  uint64_t v2;
  unsigned int v3;

  v2 = OUTLINED_FUNCTION_10_8();
  v3 = sqlite3_exec(a1, (const char *)(v2 + 32), 0, 0, 0);
  swift_release();
  swift_bridgeObjectRetain();
  sub_1A03AE380(v3);
  OUTLINED_FUNCTION_5_13();
}

uint64_t sub_1A03A23C4(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 1u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1A03A23DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  uint64_t result;
  uint64_t v13;

  v1 = sub_1A03D5864();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v13 - v6;
  v8 = *(_QWORD *)v0;
  if (!*(_BYTE *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
    return v8;
  }
  if (*(_BYTE *)(v0 + 16) != 1)
    return 0x3A79726F6D656D3ALL;
  v9 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  v10 = sub_1A03D5CD8();

  if (*(_QWORD *)(v10 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_1A03D5840();
    OUTLINED_FUNCTION_45();
    sub_1A03D584C();
    v8 = sub_1A03D5858();
    v11 = *(void (**)(char *, uint64_t))(v2 + 8);
    v11(v5, v1);
    v11(v7, v1);
    return v8;
  }
  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_1A03A255C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t aBlock;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  void *v27;
  uint64_t v28;
  uint64_t v29;

  v23 = a2;
  v5 = sub_1A03D5A80();
  MEMORY[0x1E0C80A78](v5);
  sub_1A03A298C(0, &qword_1ED0CDDB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v22 - v7;
  v9 = sub_1A03D5A98();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v22 - v14;
  sub_1A03A2A7C(a1, (uint64_t)v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9) == 1)
  {
    sub_1A03A2A28((uint64_t)v8);
    v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1A03A298C(0, &qword_1ED0CDDB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_1A03D6820;
    sub_1A03D5A74();
    aBlock = v17;
    sub_1A03ABCC4(&qword_1ED0CE6C0, v16, MEMORY[0x1E0DEF510]);
    sub_1A03A298C(0, &qword_1ED0CE708, v16, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v16);
    sub_1A03D5F00();
    v28 = v23;
    v29 = a3;
    aBlock = MEMORY[0x1E0C809B0];
    v25 = 1107296256;
    v26 = sub_1A03A33C8;
    v27 = &block_descriptor_22;
    _Block_copy(&aBlock);
    sub_1A03D5AD4();
    swift_allocObject();
    swift_retain();
    v18 = sub_1A03D5AC8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    sub_1A03A298C(0, &qword_1ED0CDDB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v22 = a3;
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_1A03D6810;
    sub_1A03D5A74();
    sub_1A03D5A68();
    aBlock = v19;
    v20 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1A03ABCC4(&qword_1ED0CE6C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1A03A298C(0, &qword_1ED0CE708, v20, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v20);
    sub_1A03D5F00();
    v28 = v23;
    v29 = v22;
    aBlock = MEMORY[0x1E0C809B0];
    v25 = 1107296256;
    v26 = sub_1A03A33C8;
    v27 = &block_descriptor_25;
    _Block_copy(&aBlock);
    sub_1A03D5AD4();
    swift_allocObject();
    swift_retain();
    v18 = sub_1A03D5ABC();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  }
  swift_release();
  return v18;
}

void sub_1A03A298C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

void sub_1A03A29E4(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;

  if (!*a1)
  {
    sub_1A03A298C(255, a2, a3, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    atomic_store(MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF38], v4), a1);
  }
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03A2A28(uint64_t a1)
{
  uint64_t v2;

  sub_1A03A298C(0, &qword_1ED0CDDB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A03A2A7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03A298C(0, &qword_1ED0CDDB8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF5B0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1A03A2AD8()
{
  unint64_t result;

  result = qword_1ED0CE748;
  if (!qword_1ED0CE748)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CE748);
  }
  return result;
}

uint64_t sub_1A03A2B14(_BYTE *a1, sqlite3 *a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  sqlite3 *v6;

  v4 = *a1;
  v5 = *(_QWORD *)(v2 + 16);
  if (v5 && (*(_QWORD *)(v5 + 16) & 0x10) != 0)
  {
    sub_1A03B3860();
    if (v4)
      goto LABEL_4;
LABEL_6:
    v6 = a2;
    goto LABEL_7;
  }
  if (!*a1)
    goto LABEL_6;
LABEL_4:
  v6 = a2;
LABEL_7:
  sub_1A03A2324(v6);
  return swift_release();
}

void KeyValueStore.init(database:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_1A03D5A80();
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_3();
  sub_1A03D5E70();
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_3();
  sub_1A03D5E04();
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_3();
  sub_1A03D5DF8();
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v4);
  sub_1A03D5A98();
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_3();
  *(_QWORD *)(v0 + 32) = sub_1A03A4610;
  *(_QWORD *)(v0 + 40) = 0;
  type metadata accessor for KVSEntry();
}

void sub_1A03A2D48()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = sub_1A03D5AEC();
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 48) = v5;
  *(_BYTE *)(v3 + 80) = 1;
  *(_QWORD *)(v3 + 16) = v1;
  v6 = v0;
  v8 = type metadata accessor for KVSEntity(0, v2, v0, v7);
  swift_retain();
  v9 = MEMORY[0x1A1AF9BC4](&unk_1A03D6AB8, v8);
  v10 = *(_QWORD *)(v4 - 200);
  v12 = Database.table<A>(_:)(v8, v8, v9, v11);
  if (v10)
  {
    OUTLINED_FUNCTION_16();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v4 - 184);
    *(_QWORD *)(v4 - 176) = v2;
    *(_QWORD *)(v4 - 168) = v13;
    v14 = *(_QWORD *)(v4 - 192);
    *(_QWORD *)(v4 - 160) = v6;
    *(_QWORD *)(v4 - 152) = v14;
    *(_QWORD *)(v4 - 144) = *(_QWORD *)(v4 - 72);
    OUTLINED_FUNCTION_18_0();
  }
  *(_QWORD *)(v3 + 24) = v12;
  *(_QWORD *)(v4 - 328) = sub_1A03A32A8(0, (unint64_t *)&qword_1ED0CE748);
  *(_QWORD *)(v4 - 304) = v6;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v4 - 200) = 0;
  *(_QWORD *)(v4 - 336) = v15(v2, v6);
  *(_QWORD *)(v4 - 344) = v16;
  sub_1A03D5A8C();
  *(_QWORD *)(v4 - 176) = MEMORY[0x1E0DEE9D8];
  v17 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  sub_1A03ABC90(&qword_1ED0CE740, (void (*)(uint64_t))MEMORY[0x1E0DEF810]);
  *(_QWORD *)(v4 - 320) = v1;
  sub_1A03A298C(0, &qword_1ED0CE728, v17, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  *(_QWORD *)(v4 - 312) = v2;
  sub_1A03A29E4((unint64_t *)&unk_1ED0CE730, &qword_1ED0CE728, v17);
  sub_1A03D5F00();
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v4 - 296) + 104))(*(_QWORD *)(v4 - 288), *MEMORY[0x1E0DEF8D0], *(_QWORD *)(v4 - 280));
  *(_QWORD *)(v3 + 56) = sub_1A03D5E40();
  sub_1A03A32A8(0, &qword_1ED0CE758);
  v18 = *(_QWORD *)(v4 - 272);
  sub_1A03D5E64();
  v19 = sub_1A03D5E7C();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v4 - 264) + 8))(v18, *(_QWORD *)(v4 - 256));
  *(_QWORD *)(v3 + 64) = v19;
  swift_retain();
  sub_1A03A3394();
  *(_BYTE *)(v4 - 96) = 0;
  swift_beginAccess();
  v21 = *(_QWORD *)(v4 - 192);
  v20 = *(_QWORD *)(v4 - 184);
  *(_QWORD *)(v4 - 176) = *(_QWORD *)(v4 - 312);
  *(_QWORD *)(v4 - 168) = v20;
  *(_QWORD *)(v4 - 160) = *(_QWORD *)(v4 - 304);
  *(_QWORD *)(v4 - 152) = v21;
  *(_QWORD *)(v4 - 144) = *(_QWORD *)(v4 - 72);
  OUTLINED_FUNCTION_18_0();
}

void sub_1A03A3028(uint64_t a1)
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
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 40))(v1, v8 - 104, a1);
  swift_endAccess();
  *(_QWORD *)(v8 - 256) = *(_QWORD *)(v7 + 64);
  swift_getObjectType();
  v9 = OUTLINED_FUNCTION_0();
  swift_weakInit();
  v10 = (_QWORD *)OUTLINED_FUNCTION_0();
  v10[2] = v3;
  v10[3] = v5;
  v10[4] = v2;
  v10[5] = v6;
  v10[6] = v4;
  v10[7] = v9;
  *(_QWORD *)(v8 - 144) = sub_1A03B5C4C;
  *(_QWORD *)(v8 - 136) = v10;
  *(_QWORD *)(v8 - 176) = MEMORY[0x1E0C809B0];
  *(_QWORD *)(v8 - 168) = 1107296256;
  *(_QWORD *)(v8 - 160) = sub_1A03A33C8;
  *(_QWORD *)(v8 - 152) = &block_descriptor;
  v11 = _Block_copy((const void *)(v8 - 176));
  swift_retain();
  v12 = *(_QWORD *)(v8 - 208);
  sub_1A03D5A8C();
  v13 = *(_QWORD *)(v8 - 232);
  sub_1A03A32E0();
  sub_1A03D5E88();
  _Block_release(v11);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 224) + 8))(v13, *(_QWORD *)(v8 - 216));
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 248) + 8))(v12, *(_QWORD *)(v8 - 240));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_25();
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_1A03D5EA0();
  v14 = swift_unknownObjectRelease();
  MEMORY[0x1E0C80A78](v14);
  sub_1A03D5A20();
  v15 = (_QWORD *)OUTLINED_FUNCTION_0();
  v15[2] = *(_QWORD *)(v8 - 312);
  v15[3] = v5;
  v15[4] = *(_QWORD *)(v8 - 304);
  v15[5] = v6;
  v15[6] = *(_QWORD *)(v8 - 72);
  v16 = (void *)sub_1A03D59E4();
  sub_1A03D59F0();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_34();

  OUTLINED_FUNCTION_20_0();
  JUMPOUT(0x1A03A322CLL);
}

void KeyValueStore.promises.getter()
{
  OUTLINED_FUNCTION_1();
  type metadata accessor for KeyValueStore.Promises();
}

uint64_t sub_1A03A327C()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_35();
  return OUTLINED_FUNCTION_11_0(v0);
}

void type metadata accessor for KeyValueStore.Promises()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t sub_1A03A32A8(uint64_t a1, unint64_t *a2)
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

void sub_1A03A32E0()
{
  uint64_t (*v0)(uint64_t);

  sub_1A03D5A80();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  sub_1A03ABC90(&qword_1ED0CE6C0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
  sub_1A03A298C(0, &qword_1ED0CE708, v0, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v0);
  sub_1A03D5F00();
  OUTLINED_FUNCTION_17();
}

uint64_t sub_1A03A3394()
{
  swift_weakInit();
  swift_weakAssign();
  return swift_release();
}

uint64_t sub_1A03A33C8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_12();
  v1(v2);
  return swift_release();
}

void sub_1A03A33F0()
{
  uint64_t v0;

  sub_1A03A3408(*(_QWORD *)(v0 + 16), *(void (**)(void *))(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40), *(uint64_t (**)(uint64_t))(v0 + 48), *(_QWORD *)(v0 + 56), *(void (**)(uint64_t))(v0 + 64));
}

void sub_1A03A3408(uint64_t a1, void (*a2)(void *), uint64_t a3, char a4, uint64_t (*a5)(uint64_t), uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t Strong;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v13 = Strong;
    LOBYTE(v17) = a4;
    swift_retain();
    swift_retain();
    sub_1A03A364C((uint64_t)&v17, v13, a5, a6, a7);
    swift_release();
  }
  else
  {
    v14 = sub_1A03D59B4();
    sub_1A03ABCC4(&qword_1EE597778, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB35A0], MEMORY[0x1E0DB35A8]);
    v15 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v16, *MEMORY[0x1E0DB3590], v14);
    a2(v15);

  }
}

uint64_t sub_1A03A364C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4, void (*a5)(uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(a2 + 16);
  if (v6)
  {
    if ((*(_QWORD *)(v6 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A03B3860();
    }
    else
    {
      swift_retain();
    }
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    sub_1A03A3F88(0, v8, v9, v10);
    inited = swift_initStackObject();
    v12 = type metadata accessor for Connection();
    *(_QWORD *)(inited + 64) = v12;
    *(_QWORD *)(inited + 72) = &off_1E4374B70;
    v13 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(inited + 40) = v6;
    *(_QWORD *)(inited + 80) = v13;
    *(_BYTE *)(inited + 32) = 5;
    *(_QWORD *)(inited + 16) = 0x204E49474542;
    *(_QWORD *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A03A3B40();
    if (v5)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A03A0928();
      v15 = swift_deallocClassInstance();
      v16 = a3(v15);
      a5(v16);
      v17 = swift_initStackObject();
      *(_QWORD *)(v17 + 64) = v12;
      *(_QWORD *)(v17 + 72) = &off_1E4374B70;
      *(_QWORD *)(v17 + 40) = v6;
      *(_QWORD *)(v17 + 80) = MEMORY[0x1E0DEE9D8];
      *(_BYTE *)(v17 + 32) = 5;
      *(_QWORD *)(v17 + 16) = 0xD000000000000013;
      *(_QWORD *)(v17 + 24) = 0x80000001A03D9BE0;
      swift_retain();
      sub_1A03A3B40();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A03A0928();
    swift_deallocClassInstance();
    swift_release();
    swift_release();
  }
  else
  {
    sub_1A03BCD78();
    swift_allocError();
    *(_OWORD *)v7 = 0u;
    *(_OWORD *)(v7 + 16) = 0u;
    *(_BYTE *)(v7 + 32) = 0;
    swift_willThrow();
    swift_release();
  }
  return swift_release();
}

uint64_t Database.table<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _UNKNOWN **v12;

  v6 = *(_QWORD *)(v4 + 16);
  if (v6)
  {
    type metadata accessor for Table(0, a2, a3, a4);
    v11 = OUTLINED_FUNCTION_76();
    v12 = &off_1E4374B70;
    *(_QWORD *)&v10 = v6;
    v5 = sub_1A039F980(&v10);
    swift_retain();
  }
  else
  {
    sub_1A03BCD78();
    v7 = OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v7, v8);
  }
  return v5;
}

uint64_t type metadata accessor for Connection()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Table(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Table);
}

uint64_t sub_1A03A3B40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  int v8;
  uint64_t result;
  char v10;
  char v11;
  char v12;

  v2 = v1;
  OUTLINED_FUNCTION_72();
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    OUTLINED_FUNCTION_24_3();
    v5 = v3 + 40;
    while (1)
    {
      v6 = *(void (**)(uint64_t))(v5 - 8);
      v7 = OUTLINED_FUNCTION_12();
      v1 = v2;
      v6(v7);
      if (v2)
        break;
      swift_release();
      v5 += 16;
      if (!--v4)
      {
        OUTLINED_FUNCTION_6_11();
        goto LABEL_6;
      }
    }
    swift_release();
    return OUTLINED_FUNCTION_6_11();
  }
  else
  {
LABEL_6:
    OUTLINED_FUNCTION_9_11();
    v8 = *(unsigned __int8 *)(v0 + 32);
    if ((v12 & 0x10) != 0)
LABEL_13:
      sub_1A03B3860();
    while (2)
    {
      OUTLINED_FUNCTION_8_14();
      if (v1)
      {
        return OUTLINED_FUNCTION_9_0();
      }
      else
      {
        switch(v8)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            OUTLINED_FUNCTION_19_6();
            sub_1A03AE2E4();
            OUTLINED_FUNCTION_40();
            OUTLINED_FUNCTION_9_0();
            result = MEMORY[0x1E0DEE9D8];
            break;
          default:
            if (!v10 || (v11 & 8) == 0)
              continue;
            goto LABEL_13;
        }
      }
      break;
    }
  }
  return result;
}

void sub_1A03A3F88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CDDA0)
  {
    v4 = type metadata accessor for Statement(0, (uint64_t)&type metadata for RawEntity, (uint64_t)&off_1E43764E0, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CDDA0);
  }
}

void sub_1A03A3FD8()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03A3FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_1A03A6368(v4, a2, a3, a4);
}

void sub_1A03A400C()
{
  sub_1A03AB490();
}

uint64_t sub_1A03A4024(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1A03A405C(a1, a2, a3, a4, *(_QWORD *)(v4 + 56), *(_QWORD *)(v4 + 64));
}

uint64_t sub_1A03A405C(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = KeyValueStore.read(_:maxAge:)(a6);
    swift_release();
    v10 = v9;
    a1(&v10);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t KeyValueStore.read(_:maxAge:)(uint64_t a1)
{
  _QWORD *v1;
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
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  void (*v28)(uint64_t);
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v45 = a1;
  v44 = (_QWORD *)*v1;
  sub_1A03B6070();
  v43 = v2;
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_21();
  v6 = v4 - v5;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v39 - v8;
  sub_1A03B85C8(0, qword_1ED0CDDC8, (uint64_t (*)(void))sub_1A03B60D4, MEMORY[0x1E0DEA4B0]);
  v11 = v10;
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_21();
  v15 = v13 - v14;
  MEMORY[0x1E0C80A78](v16);
  v47 = (uint64_t)&v39 - v17;
  v42 = *(_QWORD *)(OUTLINED_FUNCTION_29() - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v18);
  OUTLINED_FUNCTION_21();
  v21 = v19 - v20;
  v23 = MEMORY[0x1E0C80A78](v22);
  v25 = (char *)&v39 - v24;
  MEMORY[0x1E0C80A78](v23);
  v27 = (char *)&v39 - v26;
  v46 = v1;
  v28 = (void (*)(uint64_t))v1[4];
  v29 = OUTLINED_FUNCTION_12();
  v28(v29);
  OUTLINED_FUNCTION_25();
  sub_1A03D58E8();
  sub_1A03D58E8();
  sub_1A03B60D4();
  v48 = v21;
  v49 = v25;
  result = sub_1A03D5BB8();
  if ((result & 1) != 0)
  {
    v40 = v11;
    v41 = v27;
    v31 = v43;
    v32 = (uint64_t)&v9[*(int *)(v43 + 48)];
    OUTLINED_FUNCTION_7((uint64_t)v9, (uint64_t)v49);
    OUTLINED_FUNCTION_7(v32, v48);
    v33 = v6 + *(int *)(v31 + 48);
    OUTLINED_FUNCTION_7(v6, (uint64_t)v9);
    OUTLINED_FUNCTION_7(v33, v32);
    OUTLINED_FUNCTION_7(v15, v6);
    OUTLINED_FUNCTION_6(v33);
    v34 = v6 + *(int *)(v31 + 48);
    OUTLINED_FUNCTION_7(v6, (uint64_t)v9);
    OUTLINED_FUNCTION_7(v34, v32);
    OUTLINED_FUNCTION_7(v15 + *(int *)(v40 + 36), v34);
    OUTLINED_FUNCTION_6(v6);
    sub_1A03B60F0(v15, v47);
    v35 = v44[11];
    v37 = v44[12];
    v36 = v44[13];
    v38 = v44[14];
    v50 = v44[10];
    v51 = v35;
    v42 = v36;
    v43 = v35;
    v52 = v37;
    v53 = v36;
    v40 = v38;
    v54 = v38;
    type metadata accessor for KVSEntry();
  }
  __break(1u);
  return result;
}

uint64_t type metadata accessor for KVSEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for KVSEntity);
}

void FastEntity.init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7F10);
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_36_1(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = OUTLINED_FUNCTION_28_2(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = OUTLINED_FUNCTION_19_4((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_14_8(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  v1[16].n128_u64[0] = OUTLINED_FUNCTION_7_11((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v7;
  v1[19].n128_u64[1] = OUTLINED_FUNCTION_6_8(&v1[20].n128_u64[1]);
  v1[20].n128_u64[0] = v8;
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_7_0();
}

void FastEntity.init<A, B, C, D, E>(_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7F00);
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_28_2(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = OUTLINED_FUNCTION_19_4(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = OUTLINED_FUNCTION_14_8((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_7_11(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  v1[16].n128_u64[0] = OUTLINED_FUNCTION_6_8((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v7;
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_10_5();
}

void FastEntity.init<A, B, C>(_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7EE0);
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_14_8(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = OUTLINED_FUNCTION_7_11(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = OUTLINED_FUNCTION_6_8((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_26();
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_12_7(v1, (__n128)xmmword_1A03D7F70);
  v4 = (_QWORD *)OUTLINED_FUNCTION_44_0(v2, v3);
  v5 = OUTLINED_FUNCTION_25_1(v4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_43_1(v5, v6);
  v8 = OUTLINED_FUNCTION_28_2(v7);
  v10 = (_QWORD *)OUTLINED_FUNCTION_41_1(v8, v9);
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_21_4(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = OUTLINED_FUNCTION_19_4((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  v13 = OUTLINED_FUNCTION_14_8(&v1[20].n128_u64[1]);
  v15 = (_QWORD *)OUTLINED_FUNCTION_52_0(v13, v14);
  v16 = OUTLINED_FUNCTION_6_8(v15);
  v18 = (_QWORD *)OUTLINED_FUNCTION_50_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A03A4924(v18);
  v1[27].n128_u64[0] = v19;
  v20 = OUTLINED_FUNCTION_7_11((__n128 *)v1[31].n128_u64);
  v22 = (_QWORD *)OUTLINED_FUNCTION_49_0(v20, v21);
  v1[33].n128_u64[1] = OUTLINED_FUNCTION_26_2(v22);
  v1[34].n128_u64[0] = v23;
  v1[37].n128_u64[0] = sub_1A03A4924((__n128 *)v1[38].n128_u64);
  v1[37].n128_u64[1] = v24;
  v1[40].n128_u64[1] = sub_1A03A4924(&v1[41].n128_u64[1]);
  v1[41].n128_u64[0] = v25;
  OUTLINED_FUNCTION_33_1();
  swift_release();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_42_1();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_11();
}

uint64_t sub_1A03A4924(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *v1;
  v4 = v1[2];
  OUTLINED_FUNCTION_0_17();
  v5 = v1[4];
  a1[3] = type metadata accessor for Column(0, *(_QWORD *)(v3 + 80), *(_QWORD *)(v3 + 88), v6);
  a1[4] = &off_1E4375748;
  *a1 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for Column(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Column);
}

void FastEntity.init<A>(_:)()
{
  uint64_t v0;
  __n128 *v1;
  unint64_t v2;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_12_7(v1, (__n128)xmmword_1A03D6820);
  v1[2].n128_u64[1] = v2;
  OUTLINED_FUNCTION_25();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03A49F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE760)
  {
    sub_1A03ACECC();
    v0 = sub_1A03D6110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE760);
  }
}

void sub_1A03A4A48()
{
  sub_1A03A4A68();
}

void sub_1A03A4A68()
{
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A03A4AA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v3, v2 + *(int *)(a1 + 60), v1);
}

uint64_t sub_1A03A4AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v5;

  return a5(a1, a2, a3, a4, v5[7], v5[8], v5[2], v5[3], v5[4], v5[5], v5[6]);
}

uint64_t sub_1A03A4B10()
{
  uint64_t result;

  result = swift_weakLoadStrong();
  if (result)
    KeyValueStore.write(_:)();
  __break(1u);
  return result;
}

void KeyValueStore.write(_:)()
{
  type metadata accessor for KVSEntry();
}

void sub_1A03A5304(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

void sub_1A03A54F4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A03A5538(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 60), v2, v1);
}

void sub_1A03A5568(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = *v1;
  v4 = (void *)MEMORY[0x1A1AF9810]();
  sub_1A03A55E0(a1, *(_QWORD *)(v3 + 88), *(_QWORD *)(v3 + 112), &v5);
  objc_autoreleasePoolPop(v4);
}

uint64_t sub_1A03A55E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD v18[4];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_1A03D6110();
  swift_allocObject();
  sub_1A03D5CFC();
  v11 = (char *)v10 + *(int *)(TupleTypeMetadata2 + 48);
  *v10 = 118;
  v10[1] = 0xE100000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(v11, a1, a2);
  sub_1A03D5D50();
  v12 = sub_1A03D5B10();
  sub_1A03D57EC();
  swift_allocObject();
  sub_1A03D57E0();
  v18[3] = v12;
  v13 = sub_1A03D5B64();
  v18[0] = MEMORY[0x1E0DEA970];
  v18[1] = a3;
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEA0B8], v13, v18);
  v14 = sub_1A03D57D4();
  v16 = v15;
  swift_bridgeObjectRelease();
  result = swift_release();
  if (!v4)
  {
    *a4 = v14;
    a4[1] = v16;
  }
  return result;
}

uint64_t *Column.init(primaryKey:index:unique:default:onUpdate:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v6;
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
  void (*v21)(uint64_t, uint64_t, uint64_t);

  v6 = v5;
  v10 = *v5;
  v11 = *(_QWORD *)(*v5 + 80);
  v12 = *(_QWORD *)(v10 + 88);
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v6 + *(_QWORD *)(*v6 + 104), 1, 1, v11);
  v13 = *(_QWORD *)(*v6 + 112);
  *((_BYTE *)v6 + v13) = 0;
  v14 = *(_QWORD *)(*v6 + 120);
  *((_BYTE *)v6 + v14) = 0;
  v15 = *(_QWORD *)(*v6 + 128);
  *((_BYTE *)v6 + v15) = 0;
  v16 = (uint64_t)v6 + *(_QWORD *)(*v6 + 136);
  v18 = type metadata accessor for Column.Func(0, v11, v12, v17);
  __swift_storeEnumTagSinglePayload(v16, 1, 1, v18);
  v19 = (uint64_t)v6 + *(_QWORD *)(*v6 + 144);
  OUTLINED_FUNCTION_8_6(v19, 1);
  *((_BYTE *)v6 + v13) = a1;
  *((_BYTE *)v6 + v14) = a2;
  *((_BYTE *)v6 + v15) = a3;
  OUTLINED_FUNCTION_5_6();
  v20 = OUTLINED_FUNCTION_26_1();
  v21 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40);
  v21(v16, a4, v20);
  swift_endAccess();
  OUTLINED_FUNCTION_5_6();
  v21(v19, a5, v20);
  swift_endAccess();
  return v6;
}

void static String.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static Date.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_1A03A58FC(_BYTE *a1@<X8>)
{
  static LazyJSON.dataType.getter(a1);
}

void static LazyJSON.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_1A03A591C(uint64_t a1, uint64_t a2)
{
  return static _Optional.dataType.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 - 8));
}

uint64_t static _Optional.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

void sub_1A03A594C(_BYTE *a1@<X8>)
{
  static LazyEntity.dataType.getter(a1);
}

void static LazyEntity.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_1A03A5968(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0u;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void static JSON.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void static Data.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

void static Int.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1A03A5B40()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 24))();
}

uint64_t sub_1A03A5B60()
{
  uint64_t v0;

  return sub_1A03A5B78(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

#error "1A03A5BAC: call analysis failed (funcsize=51)"

void sub_1A03A5C48(uint64_t (*a1)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = a1(0, *(_QWORD *)(*(_QWORD *)v1 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 88) + 8));
  v3 = OUTLINED_FUNCTION_0_22(v2);
  OUTLINED_FUNCTION_2_22(v3);
  OUTLINED_FUNCTION_1_22();
}

uint64_t type metadata accessor for Query(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Query);
}

void sub_1A03A5C98()
{
  sub_1A03A5C48((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for Query);
}

void sub_1A03A5CAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, _UNKNOWN **a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;

  OUTLINED_FUNCTION_48();
  a24 = v25;
  a25 = v27;
  v28 = *(_QWORD *)(v26 + 16);
  if (v28)
  {
    v29 = v26;
    a13 = MEMORY[0x1E0DEE9D8];
    sub_1A03A5D98(0, v28, 0);
    v30 = a13;
    v31 = (uint64_t *)(v29 + 40);
    do
    {
      v33 = *(v31 - 1);
      v32 = *v31;
      a13 = v30;
      v35 = *(_QWORD *)(v30 + 16);
      v34 = *(_QWORD *)(v30 + 24);
      swift_bridgeObjectRetain();
      if (v35 >= v34 >> 1)
      {
        sub_1A03A5D98((char *)(v34 > 1), v35 + 1, 1);
        v30 = a13;
      }
      v31 += 2;
      a11 = MEMORY[0x1E0DEA968];
      a12 = &protocol witness table for String;
      *(_QWORD *)&a9 = v33;
      *((_QWORD *)&a9 + 1) = v32;
      *(_QWORD *)(v30 + 16) = v35 + 1;
      sub_1A03A5D80(&a9, v30 + 40 * v35 + 32);
      --v28;
    }
    while (v28);
  }
  OUTLINED_FUNCTION_11();
}

uint64_t sub_1A03A5D80(__int128 *a1, uint64_t a2)
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

char *sub_1A03A5D98(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A03A5DB4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1A03A5DB4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1A03A5E98();
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A03C5200(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03A5EFC((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void sub_1A03A5E98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CDDA8)
  {
    sub_1A03A5FF8(255, &qword_1ED0CE008);
    v0 = sub_1A03D6110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CDDA8);
  }
}

uint64_t sub_1A03A5EFC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (v3 = a1 + 40 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1A03D6050();
    __break(1u);
  }
  else
  {
    sub_1A03A5FF8(0, &qword_1ED0CE008);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A03A5FF8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1A03A6044(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18[2];
  uint64_t v19;
  char v20;

  v6 = *a1;
  OUTLINED_FUNCTION_0_8((uint64_t)a1, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 88) + 24), a4);
  v20 = 4;
  v19 = v6;
  OUTLINED_FUNCTION_15_4();
  v9 = OUTLINED_FUNCTION_1_5(v7, v8);
  OUTLINED_FUNCTION_3_4(v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_4(v13, (uint64_t)v18);
  v16 = OUTLINED_FUNCTION_5_4(&v20, v14, v15, v18);
  OUTLINED_FUNCTION_7_5(v16);
  OUTLINED_FUNCTION_4_5();
  return v5;
}

uint64_t sub_1A03A60E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for SelectCommand(0, a2, a3, a4);
  return sub_1A03AD180();
}

uint64_t type metadata accessor for SelectCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SelectCommand);
}

void sub_1A03A6138(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20[2];

  v4 = v2;
  v7 = sub_1A03A8DAC(a1, a2);
  OUTLINED_FUNCTION_16_8();
  OUTLINED_FUNCTION_12();
  sub_1A03AA668(a1, a2, 1);
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A03AD1F8();
  *(_QWORD *)&v20[0] = sub_1A03D5B94();
  *((_QWORD *)&v20[0] + 1) = v8;
  swift_bridgeObjectRetain();
  sub_1A03D5C48();
  OUTLINED_FUNCTION_4_11();
  swift_bridgeObjectRelease();
  v9 = v20[0];
  sub_1A03B3408(v4 + 16, (uint64_t)v20);
  sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_initStackObject();
  sub_1A03A80D8(1, v9, *((uint64_t *)&v9 + 1), v20);
  v10 = sub_1A03C49CC(v7, (uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1A03AF1B8);
  OUTLINED_FUNCTION_6_11();
  v11 = *(_QWORD *)(v10 + 16);
  if (v11)
  {
    swift_bridgeObjectRetain();
    v12 = (uint64_t *)(v10 + 40);
    v13 = MEMORY[0x1E0DEE9D8];
    do
    {
      v14 = *(v12 - 1);
      if (v14)
      {
        v15 = *v12;
        OUTLINED_FUNCTION_16_8();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_18_4();
          v13 = v18;
        }
        v16 = *(_QWORD *)(v13 + 16);
        if (v16 >= *(_QWORD *)(v13 + 24) >> 1)
        {
          OUTLINED_FUNCTION_18_4();
          v13 = v19;
        }
        *(_QWORD *)(v13 + 16) = v16 + 1;
        v17 = v13 + 16 * v16;
        *(_QWORD *)(v17 + 32) = v14;
        *(_QWORD *)(v17 + 40) = v15;
      }
      v12 += 2;
      --v11;
    }
    while (v11);
    OUTLINED_FUNCTION_18();
  }
  OUTLINED_FUNCTION_18();
  sub_1A03A810C();
  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_6_11();
  OUTLINED_FUNCTION_40_2();
  sub_1A03A79C0();
  OUTLINED_FUNCTION_40();
  if (!v3)
    OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_13_8();
}

uint64_t sub_1A03A6368(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  v4 = *a1;
  sub_1A03A6FDC((uint64_t)a1, a2, a3, a4);
  v6 = type metadata accessor for KVSEntity(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 96), v5);
  MEMORY[0x1A1AF9BC4](&unk_1A03D6A9C, v6);
  v7 = sub_1A03A63E8();
  sub_1A03A63F0(v7 & 1);
  return swift_release();
}

uint64_t sub_1A03A63E8()
{
  return 1;
}

uint64_t sub_1A03A63F0(char a1)
{
  return sub_1A03A6408(a1, 1);
}

uint64_t sub_1A03A6408(char a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v4 = v2;
  v6 = *v4;
  result = sub_1A03A6C94(a2, v4);
  if (!v3)
  {
    v8 = sub_1A03A6724(a1 & 1);
    sub_1A03AD83C(v8);
    OUTLINED_FUNCTION_32_1();
    OUTLINED_FUNCTION_6_5();
    sub_1A03A6F10(a1 & 1);
    type metadata accessor for Statement(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(*(_QWORD *)(v6 + 88) + 24), v9);
    sub_1A03D5CE4();
    OUTLINED_FUNCTION_47_1();
  }
  return result;
}

uint64_t sub_1A03A66F4(uint64_t a1)
{
  return sub_1A03A6700(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_1A03A6700(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1A03A6724(uint64_t a1)
{
  uint64_t v1;
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  __int128 v31[2];
  char v32;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v30 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_14_0();
  v7 = v6 - v5;
  v9 = *(_QWORD *)(v8 + 88);
  v10 = *(_QWORD *)(v9 + 24);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v3, v10);
  type metadata accessor for Statement(0, v3, v10, v11);
  v32 = 0;
  v12 = sub_1A03A9084(0, a1, v3, v9);
  v14 = sub_1A03A9034(v12, v3, v9, v13);
  v16 = v15;
  swift_bridgeObjectRelease();
  sub_1A03B3408(v1 + 16, (uint64_t)v31);
  sub_1A03AD7A0(&v32, v14, v16, v31);
  v17 = sub_1A03B0058(v3);
  v18 = sub_1A03C49CC(v17, (uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1A03B32D0);
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    swift_bridgeObjectRetain();
    v20 = (uint64_t *)(v18 + 40);
    v21 = MEMORY[0x1E0DEE9D8];
    do
    {
      v22 = *(v20 - 1);
      if (v22)
      {
        v23 = *v20;
        OUTLINED_FUNCTION_16_8();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_21_5();
          v21 = v26;
        }
        v24 = *(_QWORD *)(v21 + 16);
        if (v24 >= *(_QWORD *)(v21 + 24) >> 1)
        {
          OUTLINED_FUNCTION_21_5();
          v21 = v27;
        }
        *(_QWORD *)(v21 + 16) = v24 + 1;
        v25 = v21 + 16 * v24;
        *(_QWORD *)(v25 + 32) = v22;
        *(_QWORD *)(v25 + 40) = v23;
      }
      v20 += 2;
      --v19;
    }
    while (v19);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v28 = sub_1A03A810C();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v7, v3);
  return v28;
}

uint64_t sub_1A03A6960(char a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v9 = v8;
  v11 = *(_QWORD *)(v8 + 16);
  v10 = *(_QWORD *)(v8 + 24);
  v12 = v11 + 1;
  if (v11 >= v10 >> 1)
  {
    sub_1A03ACC98(v10 > 1, v11 + 1, 1, v8);
    v9 = v33;
  }
  *(_QWORD *)(v9 + 16) = v12;
  v13 = v9 + 16 * v11;
  *(_QWORD *)(v13 + 32) = 0x455441455243;
  *(_QWORD *)(v13 + 40) = 0xE600000000000000;
  if ((a1 & 1) != 0)
  {
    v14 = *(_QWORD *)(v9 + 24);
    if (v12 >= v14 >> 1)
    {
      sub_1A03ACC98(v14 > 1, v11 + 2, 1, v9);
      v9 = v38;
    }
    *(_QWORD *)(v9 + 16) = v11 + 2;
    v15 = v9 + 16 * v12;
    *(_QWORD *)(v15 + 32) = 1347241300;
    *(_QWORD *)(v15 + 40) = 0xE400000000000000;
    v12 = *(_QWORD *)(v9 + 16);
  }
  v16 = *(_QWORD *)(v9 + 24);
  v17 = v12 + 1;
  if (v12 >= v16 >> 1)
  {
    sub_1A03ACC98(v16 > 1, v12 + 1, 1, v9);
    v9 = v34;
  }
  *(_QWORD *)(v9 + 16) = v17;
  v18 = v9 + 16 * v12;
  *(_QWORD *)(v18 + 32) = 0x454C424154;
  *(_QWORD *)(v18 + 40) = 0xE500000000000000;
  if ((a2 & 1) != 0)
  {
    v19 = *(_QWORD *)(v9 + 24);
    if (v17 >= v19 >> 1)
    {
      sub_1A03ACC98(v19 > 1, v12 + 2, 1, v9);
      v9 = v39;
    }
    *(_QWORD *)(v9 + 16) = v12 + 2;
    v20 = v9 + 16 * v17;
    strcpy((char *)(v20 + 32), "IF NOT EXISTS");
    *(_WORD *)(v20 + 46) = -4864;
  }
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 32))(a3, a4);
  v23 = v22;
  v25 = *(_QWORD *)(v9 + 16);
  v24 = *(_QWORD *)(v9 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A03ACC98(v24 > 1, v25 + 1, 1, v9);
    v9 = v35;
  }
  *(_QWORD *)(v9 + 16) = v25 + 1;
  v26 = v9 + 16 * v25;
  *(_QWORD *)(v26 + 32) = v21;
  *(_QWORD *)(v26 + 40) = v23;
  v27 = swift_bridgeObjectRetain();
  sub_1A03A9088(v27, a3);
  swift_bridgeObjectRelease();
  v28 = swift_bridgeObjectRetain();
  sub_1A03A9864(v28, a3);
  swift_bridgeObjectRelease();
  sub_1A03A86F0();
  sub_1A03AD238();
  sub_1A03AD1F8();
  sub_1A03D5B94();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A03ACC98(0, *(_QWORD *)(v9 + 16) + 1, 1, v9);
    v9 = v36;
  }
  v30 = *(_QWORD *)(v9 + 16);
  v29 = *(_QWORD *)(v9 + 24);
  if (v30 >= v29 >> 1)
  {
    sub_1A03ACC98(v29 > 1, v30 + 1, 1, v9);
    v9 = v37;
  }
  *(_QWORD *)(v9 + 16) = v30 + 1;
  v31 = v9 + 16 * v30;
  *(_QWORD *)(v31 + 32) = 40;
  *(_QWORD *)(v31 + 40) = 0xE100000000000000;
  return v9;
}

uint64_t sub_1A03A6C94(char a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;
  uint64_t v29;

  if ((a1 & 1) == 0 || !a2[7])
    return 0;
  v5 = *a2;
  swift_retain();
  sub_1A03A7728(1, 1);
  swift_release();
  if (!v2)
  {
    v6 = *(_QWORD *)(v5 + 80);
    v7 = *(_QWORD *)(v5 + 88);
    v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 32);
    swift_retain();
    v9 = v8(v6, v7);
    v27 = MEMORY[0x1E0DEA968];
    v28 = &protocol witness table for String;
    *(_QWORD *)&v26 = v9;
    *((_QWORD *)&v26 + 1) = v10;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = 25705;
    *(_QWORD *)(v11 + 24) = 0xE200000000000000;
    sub_1A03A5D80(&v26, v11 + 32);
    v3 = sub_1A03A7208(v11, 0, 0, 0xFFu);
    v13 = v12;
    swift_release();
    swift_release();
    if (v3)
    {
      swift_beginAccess();
      v15 = *(_QWORD *)(v13 + 32);
      swift_beginAccess();
      v16 = *(_QWORD *)(v15 + 32);
      v29 = *(_QWORD *)(v15 + 24);
      v17 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 40);
      sub_1A03AA4A4(v3);
      swift_bridgeObjectRetain();
      v18 = v17(v6, v7);
      if (v16)
      {
        if (v29 == v18 && v16 == v19)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_19:
          swift_release();
          swift_release();
          return v3;
        }
        v21 = sub_1A03D6134();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v21 & 1) != 0)
          goto LABEL_19;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      type metadata accessor for Drop(0, v6, v7, v22);
      sub_1A03B3408((uint64_t)(a2 + 2), (uint64_t)&v26);
      sub_1A039F980(&v26);
      sub_1A03D23CC(1, v23, v24, v25);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  return v3;
}

uint64_t sub_1A03A6F10(uint64_t a1)
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

  v2 = v1;
  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v5 = *(_QWORD *)(v3 + 88);
  sub_1A03A9540(a1, v4, v5);
  type metadata accessor for CreateIndexCommand(255, v4, v5, v6);
  v7 = sub_1A03D5D50();
  v9 = type metadata accessor for Statement(0, v4, *(_QWORD *)(v5 + 24), v8);
  v10 = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v7);
  v12 = sub_1A03D2B08((void (*)(char *, uint64_t))sub_1A03D45F4, v2, v7, v9, MEMORY[0x1E0DEDCE8], v10, MEMORY[0x1E0DEDD18], v11);
  swift_bridgeObjectRelease();
  return v12;
}

void sub_1A03A6FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10[2];
  __int128 v11[2];

  v6 = *v4;
  v5 = (uint64_t)(v4 + 2);
  type metadata accessor for Create(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(*(_QWORD *)(v6 + 88) + 8), a4);
  sub_1A03AE220(v5, (uint64_t)v11);
  sub_1A03AE220(v5, (uint64_t)v10);
  v7 = sub_1A03A7058(v10);
  sub_1A03A71B0(v11, (uint64_t)v7, v8, v9);
}

_QWORD *sub_1A03A7058(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  __int128 v28[2];

  v2 = sub_1A03AE220((uint64_t)a1, (uint64_t)v28);
  OUTLINED_FUNCTION_8_11(v2, &qword_1ED0CE600, v3, v4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Create);
  v5 = (_QWORD *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_16_7((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12, v26, v28[0]);
  v5[8] = 0;
  v5[9] = 0;
  v5[7] = 0;
  sub_1A03AE220((uint64_t)a1, (uint64_t)v28);
  sub_1A03A7148(0, qword_1ED0CE368, (uint64_t (*)(void))sub_1A03B4FE0, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Save);
  v13 = OUTLINED_FUNCTION_0();
  v21 = OUTLINED_FUNCTION_16_7(v13, v14, v15, v16, v17, v18, v19, v20, v27, v28[0]);
  OUTLINED_FUNCTION_8_11(v21, qword_1ED0CE3F0, v22, v23, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Query);
  v24 = OUTLINED_FUNCTION_0();
  sub_1A03A5D80(a1, v24 + 16);
  return v5;
}

void sub_1A03A7148(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

uint64_t type metadata accessor for Create(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Create);
}

void sub_1A03A71B0(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;

  v8 = (_QWORD *)swift_allocObject();
  sub_1A03A5D80(a1, (uint64_t)(v8 + 2));
  v8[7] = a2;
  v8[8] = a3;
  v8[9] = a4;
  OUTLINED_FUNCTION_26();
}

uint64_t sub_1A03A7208(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16[2];

  v6 = v4;
  swift_retain();
  sub_1A03A9F6C(a2, a3, a4);
  sub_1A03A73BC(42, 0xE100000000000000, a1, a2, a3, a4, 1, 0);
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A03AD1F8();
  *(_QWORD *)&v16[0] = sub_1A03D5B94();
  *((_QWORD *)&v16[0] + 1) = v11;
  swift_bridgeObjectRetain();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v12 = v16[0];
  sub_1A03B3408(v6 + 16, (uint64_t)v16);
  sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_initStackObject();
  v13 = sub_1A03A80D8(4, v12, *((uint64_t *)&v12 + 1), v16);
  v14 = sub_1A03A79C0();
  swift_release();
  if (!v5)
  {
    if (*(_QWORD *)(v14 + 16))
    {
      v13 = *(_QWORD *)(v14 + 32);
      swift_retain();
      swift_retain();
    }
    else
    {
      v13 = 0;
    }
    swift_bridgeObjectRelease();
  }
  return v13;
}

uint64_t sub_1A03A73BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6, uint64_t a7, char a8)
{
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v16 = v15;
  v18 = *(_QWORD *)(v15 + 16);
  v17 = *(_QWORD *)(v15 + 24);
  v19 = v17 >> 1;
  v20 = v18 + 1;
  if (v17 >> 1 <= v18)
  {
    OUTLINED_FUNCTION_0_0(v17 > 1, v18 + 1);
    OUTLINED_FUNCTION_17_6();
  }
  *(_QWORD *)(v16 + 16) = v20;
  v21 = v16 + 16 * v18;
  *(_QWORD *)(v21 + 32) = 0x5443454C4553;
  *(_QWORD *)(v21 + 40) = 0xE600000000000000;
  v22 = v18 + 2;
  if (v19 < v22)
  {
    OUTLINED_FUNCTION_0_25(v17);
    v16 = v59;
  }
  *(_QWORD *)(v16 + 16) = v22;
  v23 = v16 + 16 * v20;
  *(_QWORD *)(v23 + 32) = a1;
  *(_QWORD *)(v23 + 40) = a2;
  OUTLINED_FUNCTION_15_12();
  if (!(!v27 & v26))
  {
    OUTLINED_FUNCTION_0_0(v24 > 1, a2);
    OUTLINED_FUNCTION_17_6();
  }
  *(_QWORD *)(v16 + 16) = a2;
  v28 = v16 + 16 * v22;
  *(_QWORD *)(v28 + 32) = 1297044038;
  *(_QWORD *)(v28 + 40) = 0xE400000000000000;
  if (v25 < v22 + 2)
  {
    OUTLINED_FUNCTION_0_25(v24);
    v16 = v60;
  }
  OUTLINED_FUNCTION_22_3();
  strcpy((char *)(v29 + 32), "table_versions");
  *(_BYTE *)(v29 + 47) = -18;
  if ((~a3 & 0xF000000000000007) != 0)
  {
    OUTLINED_FUNCTION_31_2();
    if (v26)
    {
      OUTLINED_FUNCTION_0_25(v30);
      v16 = v62;
    }
    OUTLINED_FUNCTION_22_3();
    *(_QWORD *)(v31 + 32) = 0x4552454857;
    *(_QWORD *)(v31 + 40) = 0xE500000000000000;
    sub_1A03B2888();
    a2 = v32;
    v34 = v33;
    v36 = *(_QWORD *)(v16 + 16);
    v35 = *(_QWORD *)(v16 + 24);
    if (v36 >= v35 >> 1)
    {
      OUTLINED_FUNCTION_0_25(v35);
      v16 = v63;
    }
    *(_QWORD *)(v16 + 16) = v36 + 1;
    v37 = v16 + 16 * v36;
    *(_QWORD *)(v37 + 32) = a2;
    *(_QWORD *)(v37 + 40) = v34;
    sub_1A03AA450(a3);
  }
  if (a6 != 0xFF)
  {
    OUTLINED_FUNCTION_31_2();
    if (v26)
    {
      OUTLINED_FUNCTION_0_25(v38);
      v16 = v61;
    }
    OUTLINED_FUNCTION_22_3();
    *(_QWORD *)(v39 + 32) = 0x594220524544524FLL;
    *(_QWORD *)(v39 + 40) = 0xE800000000000000;
    if ((a6 & 1) != 0)
    {
      sub_1A03AB470();
      OUTLINED_FUNCTION_15_12();
      if (!(!v27 & v26))
      {
        OUTLINED_FUNCTION_0_0(v47 > 1, a2);
        OUTLINED_FUNCTION_17_6();
      }
      OUTLINED_FUNCTION_37_1();
      if (v42 != v43)
      {
        OUTLINED_FUNCTION_0_25(v48);
        v16 = v67;
      }
      OUTLINED_FUNCTION_22_3();
      *(_QWORD *)(v49 + 32) = 4412225;
      v45 = v49 + 32;
      v46 = 0xE300000000000000;
    }
    else
    {
      sub_1A03AB470();
      OUTLINED_FUNCTION_15_12();
      if (!(!v27 & v26))
      {
        OUTLINED_FUNCTION_0_0(v40 > 1, a2);
        OUTLINED_FUNCTION_17_6();
      }
      OUTLINED_FUNCTION_37_1();
      if (v42 != v43)
      {
        OUTLINED_FUNCTION_0_25(v41);
        v16 = v66;
      }
      OUTLINED_FUNCTION_22_3();
      *(_QWORD *)(v44 + 32) = 1129530692;
      v45 = v44 + 32;
      v46 = 0xE400000000000000;
    }
    *(_QWORD *)(v45 + 8) = v46;
    sub_1A03AB478(a4, a5, a6);
  }
  if ((a8 & 1) == 0)
  {
    OUTLINED_FUNCTION_31_2();
    if (v26)
    {
      OUTLINED_FUNCTION_0_25(v50);
      v16 = v64;
    }
    OUTLINED_FUNCTION_22_3();
    *(_QWORD *)(v51 + 32) = 0x54494D494CLL;
    *(_QWORD *)(v51 + 40) = 0xE500000000000000;
    v52 = sub_1A03D6104();
    v54 = v53;
    v56 = *(_QWORD *)(v16 + 16);
    v55 = *(_QWORD *)(v16 + 24);
    if (v56 >= v55 >> 1)
    {
      OUTLINED_FUNCTION_0_0(v55 > 1, v56 + 1);
      v16 = v65;
    }
    *(_QWORD *)(v16 + 16) = v56 + 1;
    v57 = v16 + 16 * v56;
    *(_QWORD *)(v57 + 32) = v52;
    *(_QWORD *)(v57 + 40) = v54;
  }
  return v16;
}

uint64_t sub_1A03A7728(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v4 = v2;
  result = sub_1A03A8174(a2, v4);
  if (!v3)
  {
    v9 = result;
    v10 = v8;
    sub_1A03A7E64(a1 & 1);
    sub_1A03A79C0();
    OUTLINED_FUNCTION_56_1();
    OUTLINED_FUNCTION_6_5();
    v12 = sub_1A03A8BCC(a1 & 1);
    OUTLINED_FUNCTION_16_8();
    v13 = sub_1A03D2940(v12, v4);
    OUTLINED_FUNCTION_6_5();
    if (v13 >> 62)
      goto LABEL_28;
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    while (1)
    {
      v23 = v4;
      v24 = v9;
      v25 = v10;
      if (!v14)
        break;
      v10 = v13 & 0xC000000000000001;
      v9 = 4;
      while (1)
      {
        if (v10)
          MEMORY[0x1A1AF94E0](v9 - 4, v13);
        else
          OUTLINED_FUNCTION_12();
        v4 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
          break;
        sub_1A03A79C0();
        OUTLINED_FUNCTION_25();
        OUTLINED_FUNCTION_35_2();
        ++v9;
        if (v4 == v14)
          goto LABEL_13;
      }
      __break(1u);
LABEL_28:
      swift_bridgeObjectRetain();
      v14 = sub_1A03D6044();
      OUTLINED_FUNCTION_45();
    }
LABEL_13:
    OUTLINED_FUNCTION_45();
    if ((a2 & 1) == 0)
    {
      v11 = v24;
      return sub_1A03A7E38(v11);
    }
    if (!v24)
      goto LABEL_21;
    OUTLINED_FUNCTION_72();
    v15 = *(_QWORD *)(v25 + 32);
    swift_retain();
    sub_1A03AA4A4(v24);
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_20_0();
    OUTLINED_FUNCTION_72();
    v17 = *(_QWORD *)(v15 + 24);
    v16 = *(_QWORD *)(v15 + 32);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_32_1();
    if (!v16)
      goto LABEL_21;
    if (v17 == 0x302E302E30 && v16 == 0xE500000000000000)
    {
      OUTLINED_FUNCTION_6_5();
    }
    else
    {
      OUTLINED_FUNCTION_57_1();
      v19 = sub_1A03D6134();
      OUTLINED_FUNCTION_6_5();
      if ((v19 & 1) == 0)
      {
LABEL_21:
        if (*(_QWORD *)(v23 + 56))
        {
          OUTLINED_FUNCTION_12();
          OUTLINED_FUNCTION_57_1();
          v21 = sub_1A03AA50C(v20);
          sub_1A03A6138((uint64_t)v21, v22);
          sub_1A03A7E38(v24);
          OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_16();
          return OUTLINED_FUNCTION_25();
        }
      }
    }
    v11 = v24;
    return sub_1A03A7E38(v11);
  }
  return result;
}

uint64_t sub_1A03A79C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  uint64_t v7;
  int v8;
  uint64_t result;
  char v10;
  char v11;
  char v12;

  v2 = v1;
  OUTLINED_FUNCTION_72();
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    OUTLINED_FUNCTION_24_3();
    v5 = v3 + 40;
    while (1)
    {
      v6 = *(void (**)(uint64_t))(v5 - 8);
      v7 = OUTLINED_FUNCTION_12();
      v1 = v2;
      v6(v7);
      if (v2)
        break;
      swift_release();
      v5 += 16;
      if (!--v4)
      {
        OUTLINED_FUNCTION_6_11();
        goto LABEL_6;
      }
    }
    swift_release();
    return OUTLINED_FUNCTION_6_11();
  }
  else
  {
LABEL_6:
    OUTLINED_FUNCTION_9_11();
    v8 = *(unsigned __int8 *)(v0 + 32);
    if ((v12 & 0x10) != 0)
LABEL_13:
      sub_1A03B3860();
    while (2)
    {
      OUTLINED_FUNCTION_8_14();
      if (v1)
      {
        return OUTLINED_FUNCTION_9_0();
      }
      else
      {
        switch(v8)
        {
          case 0:
          case 1:
          case 2:
          case 3:
            OUTLINED_FUNCTION_18_7();
            sub_1A03AE2E4();
            OUTLINED_FUNCTION_20_0();
            OUTLINED_FUNCTION_9_0();
            result = MEMORY[0x1E0DEE9D8];
            break;
          default:
            if (!v10 || (v11 & 8) == 0)
              continue;
            goto LABEL_13;
        }
      }
      break;
    }
  }
  return result;
}

uint64_t sub_1A03A7E38(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_1A03A7E64(uint64_t a1)
{
  uint64_t v1;
  char v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21[2];

  v2 = a1;
  v3 = sub_1A03B3058(a1);
  v5 = v4;
  sub_1A03A83C4(0, v2);
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A03AD1F8();
  *(_QWORD *)&v21[0] = sub_1A03D5B94();
  *((_QWORD *)&v21[0] + 1) = v6;
  swift_bridgeObjectRetain();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = v21[0];
  sub_1A03B3408(v1 + 16, (uint64_t)v21);
  sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
  swift_allocObject();
  sub_1A03A80D8(0, v7, *((uint64_t *)&v7 + 1), v21);
  v8 = sub_1A03A8DAC((uint64_t)v3, v5);
  v9 = sub_1A03C49CC(v8, (uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1A03D4554);
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    swift_bridgeObjectRetain();
    v11 = (uint64_t *)(v9 + 40);
    v12 = MEMORY[0x1E0DEE9D8];
    do
    {
      v13 = *(v11 - 1);
      if (v13)
      {
        v14 = *v11;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A03B2574();
          v12 = v17;
        }
        v15 = *(_QWORD *)(v12 + 16);
        if (v15 >= *(_QWORD *)(v12 + 24) >> 1)
        {
          sub_1A03B2574();
          v12 = v18;
        }
        *(_QWORD *)(v12 + 16) = v15 + 1;
        v16 = v12 + 16 * v15;
        *(_QWORD *)(v16 + 32) = v13;
        *(_QWORD *)(v16 + 40) = v14;
      }
      v11 += 2;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v19 = sub_1A03A810C();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_1A03A80D8(char a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;

  *(_BYTE *)(v4 + 32) = a1;
  *(_QWORD *)(v4 + 80) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  sub_1A03A5D80(a4, v4 + 40);
  return v4;
}

uint64_t sub_1A03A810C()
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1A03B24DC();
  swift_endAccess();
  return swift_retain();
}

uint64_t sub_1A03A8174(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  _UNKNOWN **v15;

  if ((a1 & 1) == 0 || !*(_QWORD *)(a2 + 56))
    return 0;
  swift_retain();
  sub_1A03A7728(1, 1);
  swift_release();
  if (!v2)
  {
    v14 = MEMORY[0x1E0DEA968];
    v15 = &protocol witness table for String;
    strcpy((char *)&v13, "table_versions");
    HIBYTE(v13) = -18;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = 25705;
    *(_QWORD *)(v5 + 24) = 0xE200000000000000;
    sub_1A03A5D80(&v13, v5 + 32);
    swift_retain();
    v3 = sub_1A03A7208(v5, 0, 0, 0xFFu);
    v7 = v6;
    swift_release();
    swift_release();
    if (v3)
    {
      swift_beginAccess();
      v9 = *(_QWORD *)(v7 + 32);
      swift_beginAccess();
      v10 = *(_QWORD *)(v9 + 32);
      if (v10
        && (*(_QWORD *)(v9 + 24) == 0x302E302E30 ? (v11 = v10 == 0xE500000000000000) : (v11 = 0),
            v11 || (sub_1A03D6134() & 1) != 0))
      {
        sub_1A03AA4A4(v3);
        swift_release();
        swift_release();
      }
      else
      {
        sub_1A03B3408(a2 + 16, (uint64_t)&v13);
        sub_1A03D4574(0);
        v12 = swift_initStackObject() + 16;
        sub_1A03A5D80(&v13, v12);
        sub_1A03AA4A4(v3);
        sub_1A03D361C(1);
        swift_setDeallocating();
        __swift_destroy_boxed_opaque_existential_1(v12);
        swift_release();
        swift_release();
      }
    }
  }
  return v3;
}

uint64_t sub_1A03A83C4(char a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v5 = v4;
  v7 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v8 = v7 + 1;
  if (v7 >= v6 >> 1)
  {
    sub_1A03ACC98(v6 > 1, v7 + 1, 1, v4);
    v5 = v26;
  }
  *(_QWORD *)(v5 + 16) = v8;
  v9 = v5 + 16 * v7;
  *(_QWORD *)(v9 + 32) = 0x455441455243;
  *(_QWORD *)(v9 + 40) = 0xE600000000000000;
  if ((a1 & 1) != 0)
  {
    v10 = *(_QWORD *)(v5 + 24);
    if (v8 >= v10 >> 1)
    {
      sub_1A03ACC98(v10 > 1, v7 + 2, 1, v5);
      v5 = v31;
    }
    *(_QWORD *)(v5 + 16) = v7 + 2;
    v11 = v5 + 16 * v8;
    *(_QWORD *)(v11 + 32) = 1347241300;
    *(_QWORD *)(v11 + 40) = 0xE400000000000000;
    v8 = *(_QWORD *)(v5 + 16);
  }
  v12 = *(_QWORD *)(v5 + 24);
  v13 = v8 + 1;
  if (v8 >= v12 >> 1)
  {
    sub_1A03ACC98(v12 > 1, v8 + 1, 1, v5);
    v5 = v27;
  }
  *(_QWORD *)(v5 + 16) = v13;
  v14 = v5 + 16 * v8;
  *(_QWORD *)(v14 + 32) = 0x454C424154;
  *(_QWORD *)(v14 + 40) = 0xE500000000000000;
  if ((a2 & 1) != 0)
  {
    v15 = *(_QWORD *)(v5 + 24);
    if (v13 >= v15 >> 1)
    {
      sub_1A03ACC98(v15 > 1, v8 + 2, 1, v5);
      v5 = v32;
    }
    *(_QWORD *)(v5 + 16) = v8 + 2;
    v16 = v5 + 16 * v13;
    strcpy((char *)(v16 + 32), "IF NOT EXISTS");
    *(_WORD *)(v16 + 46) = -4864;
  }
  v18 = *(_QWORD *)(v5 + 16);
  v17 = *(_QWORD *)(v5 + 24);
  if (v18 >= v17 >> 1)
  {
    sub_1A03ACC98(v17 > 1, v18 + 1, 1, v5);
    v5 = v28;
  }
  *(_QWORD *)(v5 + 16) = v18 + 1;
  v19 = v5 + 16 * v18;
  strcpy((char *)(v19 + 32), "table_versions");
  *(_BYTE *)(v19 + 47) = -18;
  v20 = swift_bridgeObjectRetain();
  sub_1A03A8788(v20);
  swift_bridgeObjectRelease();
  v21 = swift_bridgeObjectRetain();
  sub_1A03A9AF0(v21);
  swift_bridgeObjectRelease();
  sub_1A03A86F0();
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A03AD1F8();
  sub_1A03D5B94();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_1A03ACC98(0, *(_QWORD *)(v5 + 16) + 1, 1, v5);
    v5 = v29;
  }
  v23 = *(_QWORD *)(v5 + 16);
  v22 = *(_QWORD *)(v5 + 24);
  if (v23 >= v22 >> 1)
  {
    sub_1A03ACC98(v22 > 1, v23 + 1, 1, v5);
    v5 = v30;
  }
  *(_QWORD *)(v5 + 16) = v23 + 1;
  v24 = v5 + 16 * v23;
  *(_QWORD *)(v24 + 32) = 40;
  *(_QWORD *)(v24 + 40) = 0xE100000000000000;
  return v5;
}

void sub_1A03A86F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_54_1();
  if (v6)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v7 = OUTLINED_FUNCTION_42_2();
  if (!v7 || v5 > *(_QWORD *)(v2 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v5;
    else
      v8 = v4;
    OUTLINED_FUNCTION_0_0(v7, v8);
    v2 = v9;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_14;
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_49_1();
  if (v10 != v6)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v11 = OUTLINED_FUNCTION_48_0();
  sub_1A03AD484(v11, v12, v13);
  if (!v3)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v2;
    OUTLINED_FUNCTION_26();
    return;
  }
  v14 = *(_QWORD *)(v2 + 16);
  v6 = __OFADD__(v14, v3);
  v15 = v14 + v3;
  if (!v6)
  {
    *(_QWORD *)(v2 + 16) = v15;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1A03A8788(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v1 = sub_1A03B3058(a1);
  v3 = sub_1A03A8DAC((uint64_t)v1, v2);
  v4 = MEMORY[0x1E0DEE9D8];
  if (*(_QWORD *)(v3 + 16))
  {
    sub_1A03ACCBC(v3 + 32, (uint64_t)&v17);
  }
  else
  {
    v20 = 0;
    v18 = 0u;
    v19 = 0u;
    v17 = 0u;
  }
  sub_1A03D4610((uint64_t)&v17, (uint64_t)&v21, (unint64_t *)&qword_1ED0CE6D8, (uint64_t (*)(uint64_t))sub_1A03ACECC);
  v5 = v22;
  if (v22)
  {
    v6 = v21;
    sub_1A03A5D80(&v23, (uint64_t)&v17);
    sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v8 = v7;
    v10 = *(_QWORD *)(v7 + 16);
    v9 = *(_QWORD *)(v7 + 24);
    if (v10 >= v9 >> 1)
    {
      sub_1A03ACC98(v9 > 1, v10 + 1, 1, v7);
      v8 = v14;
    }
    *(_QWORD *)(v8 + 16) = v10 + 1;
    v11 = v8 + 16 * v10;
    *(_QWORD *)(v11 + 32) = v6;
    *(_QWORD *)(v11 + 40) = v5;
    v12 = *((_QWORD *)&v18 + 1);
    v13 = v19;
    __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v18 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v13 + 8))(&v16, v12, v13);
    __asm { BR              X9 }
  }
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v4;
}

void sub_1A03A8B84(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEA968]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1A03A8BCC(uint64_t a1)
{
  char v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26[3];

  v1 = a1;
  v2 = sub_1A03B3058(a1);
  result = sub_1A03A8DAC((uint64_t)v2, v3);
  v5 = result;
  v6 = 0;
  v7 = *(_QWORD *)(result + 16);
  v18 = result + 32;
  v8 = MEMORY[0x1E0DEE9D8];
  v17 = v1 & 1;
  while (1)
  {
    if (v6 == v7)
    {
      v23 = 0;
      v21 = 0u;
      v22 = 0u;
      v6 = v7;
      v20 = 0u;
      goto LABEL_6;
    }
    if (v6 >= *(_QWORD *)(v5 + 16))
      break;
    sub_1A03ACCBC(v18 + 56 * v6++, (uint64_t)&v20);
LABEL_6:
    sub_1A03D4610((uint64_t)&v20, (uint64_t)&v24, (unint64_t *)&qword_1ED0CE6D8, (uint64_t (*)(uint64_t))sub_1A03ACECC);
    v9 = v25;
    if (!v25)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      return v8;
    }
    v10 = v24;
    sub_1A03A5D80(v26, (uint64_t)&v20);
    v11 = *((_QWORD *)&v21 + 1);
    v12 = v22;
    __swift_project_boxed_opaque_existential_1(&v20, *((uint64_t *)&v21 + 1));
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v12 + 48))(v11, v12) & 1) != 0)
    {
      sub_1A03B3408((uint64_t)&v20, (uint64_t)v19);
      v13 = sub_1A03D3324(v10, v9, v19, v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03C4BE0();
        v8 = v15;
      }
      v14 = *(_QWORD *)(v8 + 16);
      if (v14 >= *(_QWORD *)(v8 + 24) >> 1)
      {
        sub_1A03C4BE0();
        v8 = v16;
      }
      *(_QWORD *)(v8 + 16) = v14 + 1;
      *(_QWORD *)(v8 + 8 * v14 + 32) = v13;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v20);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A03A8DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[3] = &type metadata for Versions.Entity;
  v5[4] = &off_1E4376000;
  v5[0] = a1;
  v5[1] = a2;
  __swift_project_boxed_opaque_existential_1(v5, (uint64_t)&type metadata for Versions.Entity);
  type metadata accessor for FastEntity();
  swift_initStackObject();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A03A8EB8();
  v3 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

uint64_t type metadata accessor for FastEntity()
{
  return objc_opt_self();
}

uint64_t destroy for Versions.Entity()
{
  swift_release();
  return swift_release();
}

void sub_1A03A8EB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1A03A298C(0, (unint64_t *)&qword_1ED0CE760, (uint64_t (*)(uint64_t))sub_1A03ACECC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A03D6810;
  *(_QWORD *)(v1 + 32) = sub_1A03A8F54((_QWORD *)(v1 + 48));
  *(_QWORD *)(v1 + 40) = v2;
  *(_QWORD *)(v1 + 88) = sub_1A03A8F54((_QWORD *)(v1 + 104));
  *(_QWORD *)(v1 + 96) = v3;
  swift_release();
  swift_release();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_26();
}

uint64_t sub_1A03A8F54(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess();
  v4 = *(_QWORD *)(v1 + 32);
  sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE578, MEMORY[0x1E0DEA968], (uint64_t)&protocol witness table for String, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Column);
  a1[3] = v5;
  a1[4] = &off_1E4375748;
  *a1 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return v3;
}

void sub_1A03A8FEC(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v6 = a5(0, a3, a4);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_1A03A9034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CreateTableCommand(0, a2, a3, a4);
  return sub_1A03AD180();
}

uint64_t type metadata accessor for CreateTableCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CreateTableCommand);
}

uint64_t sub_1A03A9088(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32[3];

  v22 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v5 + 24) + 8))(v6, *(_QWORD *)(v5 + 24));
  v23 = a2;
  v21 = v4;
  result = sub_1A03B0058(a2);
  v8 = *(_QWORD *)(result + 16);
  v24 = result + 32;
  v9 = MEMORY[0x1E0DEE9D8];
  if (v8)
  {
    if (!*(_QWORD *)(result + 16))
    {
      __break(1u);
      return result;
    }
    sub_1A03ACCBC(v24, (uint64_t)&v26);
  }
  else
  {
    v29 = 0;
    v27 = 0u;
    v28 = 0u;
    v26 = 0u;
  }
  sub_1A03A9760((uint64_t)&v26, (uint64_t)&v30);
  v10 = v31;
  if (v31)
  {
    v11 = v30;
    sub_1A03A5D80(v32, (uint64_t)&v26);
    sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v13 = v12;
    v15 = *(_QWORD *)(v12 + 16);
    v14 = *(_QWORD *)(v12 + 24);
    if (v15 >= v14 >> 1)
    {
      sub_1A03ACC98(v14 > 1, v15 + 1, 1, v12);
      v13 = v19;
    }
    *(_QWORD *)(v13 + 16) = v15 + 1;
    v16 = v13 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v11;
    *(_QWORD *)(v16 + 40) = v10;
    v17 = *((_QWORD *)&v27 + 1);
    v18 = v28;
    __swift_project_boxed_opaque_existential_1(&v26, *((uint64_t *)&v27 + 1));
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v18 + 8))(&v25, v17, v18);
    __asm { BR              X9 }
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v23);
  return v9;
}

BOOL sub_1A03A94BC()
{
  return sub_1A03A94E0();
}

BOOL sub_1A03A94E0()
{
  uint64_t v0;

  return dynamic_cast_existential_1_conditional(*(_QWORD *)(*(_QWORD *)v0 + 80)) == 0;
}

uint64_t sub_1A03A9510()
{
  return sub_1A03A9534() & 1;
}

uint64_t sub_1A03A9534()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_23_3(*(_QWORD *)(*(_QWORD *)v0 + 128));
}

uint64_t sub_1A03A9540(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t IndexCommand;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;

  v5 = a1;
  v22 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  IndexCommand = type metadata accessor for CreateIndexCommand(0, v8, v9, v10);
  v35 = sub_1A03D5AF8();
  v24 = a3;
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(a3 + 24) + 8))(a2, *(_QWORD *)(a3 + 24));
  v26 = a2;
  v21 = v7;
  result = sub_1A03B0058(a2);
  v12 = result;
  v13 = 0;
  v14 = *(_QWORD *)(result + 16);
  v25 = result + 32;
  v15 = v5 & 1;
  while (1)
  {
    if (v13 == v14)
    {
      v31 = 0;
      v29 = 0u;
      v30 = 0u;
      v13 = v14;
      v28 = 0u;
      goto LABEL_6;
    }
    if (v13 >= *(_QWORD *)(v12 + 16))
      break;
    sub_1A03ACCBC(v25 + 56 * v13++, (uint64_t)&v28);
LABEL_6:
    sub_1A03A9760((uint64_t)&v28, (uint64_t)&v32);
    v16 = v33;
    if (!v33)
    {
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v21, v26);
      return v35;
    }
    v17 = v32;
    sub_1A03A5D80(&v34, (uint64_t)&v28);
    v19 = *((_QWORD *)&v29 + 1);
    v18 = v30;
    __swift_project_boxed_opaque_existential_1(&v28, *((uint64_t *)&v29 + 1));
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v18 + 48))(v19, v18) & 1) != 0)
    {
      sub_1A03AE220((uint64_t)&v28, (uint64_t)v27);
      v27[0] = sub_1A03C4398(v17, v16, v27, v15, v26, v24);
      sub_1A03D5D50();
      sub_1A03D5D2C();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v28);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A03A9760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03A97A4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A03A97A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE6D8)
  {
    sub_1A03ACECC();
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE6D8);
  }
}

uint64_t sub_1A03A97F8()
{
  return sub_1A03A981C() & 1;
}

uint64_t sub_1A03A981C()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_23_3(*(_QWORD *)(*(_QWORD *)v0 + 120));
}

uint64_t sub_1A03A9828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_1A03ABD54();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t type metadata accessor for CreateIndexCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for CreateIndexCommand);
}

uint64_t sub_1A03A9864(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 24) + 8))(v4, *(_QWORD *)(v3 + 24));
  v5 = sub_1A03B0058(a2);
  v6 = sub_1A03D2E24(v5);
  v7 = sub_1A03D2774(v6);
  v8 = swift_bridgeObjectRelease();
  if (*(_QWORD *)(v7 + 16))
  {
    OUTLINED_FUNCTION_2_11(v8, v9, v10, MEMORY[0x1E0DEE9D8]);
    v12 = v11;
    v14 = *(_QWORD *)(v11 + 16);
    v13 = *(_QWORD *)(v11 + 24);
    v15 = v13 >> 1;
    v16 = v14 + 1;
    if (v13 >> 1 <= v14)
    {
      OUTLINED_FUNCTION_0_0(v13 > 1, v14 + 1);
      v12 = v35;
      v13 = *(_QWORD *)(v35 + 24);
      v15 = v13 >> 1;
    }
    *(_QWORD *)(v12 + 16) = v16;
    v17 = v12 + 16 * v14;
    *(_QWORD *)(v17 + 32) = 0x5952414D495250;
    *(_QWORD *)(v17 + 40) = 0xE700000000000000;
    v18 = v14 + 2;
    if (v15 < v18)
    {
      OUTLINED_FUNCTION_0_0(v13 > 1, v18);
      v12 = v36;
    }
    *(_QWORD *)(v12 + 16) = v18;
    v19 = v12 + 16 * v16;
    *(_QWORD *)(v19 + 32) = 5850443;
    *(_QWORD *)(v19 + 40) = 0xE300000000000000;
    sub_1A03AD238();
    sub_1A03AD1F8();
    OUTLINED_FUNCTION_3_9();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    v21 = *(_QWORD *)(v12 + 16);
    v20 = *(_QWORD *)(v12 + 24);
    if (v21 >= v20 >> 1)
    {
      OUTLINED_FUNCTION_0_0(v20 > 1, v21 + 1);
      v12 = v37;
    }
    *(_QWORD *)(v12 + 16) = v21 + 1;
    v22 = v12 + 16 * v21;
    *(_QWORD *)(v22 + 32) = 40;
    *(_QWORD *)(v22 + 40) = 0xE100000000000000;
    v23 = OUTLINED_FUNCTION_3_9();
    v25 = v24;
    v26 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_2_11(v26, v27, v28, MEMORY[0x1E0DEE9D8]);
    v30 = v29;
    v32 = *(_QWORD *)(v29 + 16);
    v31 = *(_QWORD *)(v29 + 24);
    if (v32 >= v31 >> 1)
    {
      OUTLINED_FUNCTION_0_0(v31 > 1, v32 + 1);
      v30 = v38;
    }
    *(_QWORD *)(v30 + 16) = v32 + 1;
    v33 = v30 + 16 * v32;
    *(_QWORD *)(v33 + 32) = v23;
    *(_QWORD *)(v33 + 40) = v25;
    OUTLINED_FUNCTION_1_12();
  }
  else
  {
    OUTLINED_FUNCTION_1_12();
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  return v30;
}

uint64_t sub_1A03A9AF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = sub_1A03B3058(a1);
  v3 = sub_1A03A8DAC((uint64_t)v1, v2);
  v4 = sub_1A03D2E24(v3);
  v5 = sub_1A03D2774(v4);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v5 + 16))
  {
    sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v7 = v6;
    v9 = *(_QWORD *)(v6 + 16);
    v8 = *(_QWORD *)(v6 + 24);
    v10 = v8 >> 1;
    v11 = v9 + 1;
    if (v8 >> 1 <= v9)
    {
      sub_1A03ACC98(v8 > 1, v9 + 1, 1, v6);
      v7 = v27;
      v8 = *(_QWORD *)(v27 + 24);
      v10 = v8 >> 1;
    }
    *(_QWORD *)(v7 + 16) = v11;
    v12 = v7 + 16 * v9;
    *(_QWORD *)(v12 + 32) = 0x5952414D495250;
    *(_QWORD *)(v12 + 40) = 0xE700000000000000;
    v13 = v9 + 2;
    if (v10 < v13)
    {
      sub_1A03ACC98(v8 > 1, v13, 1, v7);
      v7 = v28;
    }
    *(_QWORD *)(v7 + 16) = v13;
    v14 = v7 + 16 * v11;
    *(_QWORD *)(v14 + 32) = 5850443;
    *(_QWORD *)(v14 + 40) = 0xE300000000000000;
    sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
    sub_1A03AD1F8();
    sub_1A03D5B94();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    v16 = *(_QWORD *)(v7 + 16);
    v15 = *(_QWORD *)(v7 + 24);
    if (v16 >= v15 >> 1)
    {
      sub_1A03ACC98(v15 > 1, v16 + 1, 1, v7);
      v7 = v29;
    }
    *(_QWORD *)(v7 + 16) = v16 + 1;
    v17 = v7 + 16 * v16;
    *(_QWORD *)(v17 + 32) = 40;
    *(_QWORD *)(v17 + 40) = 0xE100000000000000;
    v18 = sub_1A03D5B94();
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
    v22 = v21;
    v24 = *(_QWORD *)(v21 + 16);
    v23 = *(_QWORD *)(v21 + 24);
    if (v24 >= v23 >> 1)
    {
      sub_1A03ACC98(v23 > 1, v24 + 1, 1, v21);
      v22 = v30;
    }
    *(_QWORD *)(v22 + 16) = v24 + 1;
    v25 = v22 + 16 * v24;
    *(_QWORD *)(v25 + 32) = v18;
    *(_QWORD *)(v25 + 40) = v20;
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x1E0DEE9D8];
  }
  swift_release();
  swift_release();
  return v22;
}

uint64_t sub_1A03A9D94()
{
  return sub_1A03A9DB8() & 1;
}

uint64_t sub_1A03A9DB8()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_23_3(*(_QWORD *)(*(_QWORD *)v0 + 112));
}

void sub_1A03A9DC4(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03A9DFC(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  unsigned __int8 v20;
  uint64_t v21;

  v10 = a5 & 1;
  v11 = *a2;
  v12 = *(_QWORD *)a3;
  v13 = *(_QWORD *)(a3 + 8);
  v14 = *(_BYTE *)(a3 + 16);
  sub_1A03AD238();
  sub_1A03AD1F8();
  v15 = sub_1A03D5B94();
  v17 = v16;
  v21 = v11;
  v19[0] = v12;
  v19[1] = v13;
  v20 = v14;
  sub_1A03AA468(v11);
  sub_1A03A9F6C(v12, v13, v14);
  return sub_1A03A9F84(v15, v17, &v21, (uint64_t)v19, a4, v10, a6, a7);
}

uint64_t sub_1A03A9ED4(uint64_t *a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v12;
  _QWORD v14[2];
  unsigned __int8 v15;
  uint64_t v16;

  v9 = a4 & 1;
  v10 = *(_QWORD *)a2;
  v11 = *(_QWORD *)(a2 + 8);
  v12 = *(_BYTE *)(a2 + 16);
  v16 = *a1;
  v14[0] = v10;
  v14[1] = v11;
  v15 = v12;
  sub_1A03AA468(v16);
  sub_1A03A9F6C(v10, v11, v12);
  return sub_1A03A9F84(42, 0xE100000000000000, &v16, (uint64_t)v14, a3, v9, a5, a6);
}

uint64_t sub_1A03A9F6C(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 != 255)
    return sub_1A03AB470();
  return result;
}

uint64_t sub_1A03A9F84(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  int64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int v85;
  uint64_t v86;

  v13 = *a3;
  v14 = *(_QWORD *)a4;
  v86 = *(_QWORD *)(a4 + 8);
  v85 = *(unsigned __int8 *)(a4 + 16);
  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v16 = v15;
  v18 = *(_QWORD *)(v15 + 16);
  v17 = *(_QWORD *)(v15 + 24);
  v19 = v17 >> 1;
  v20 = v18 + 1;
  if (v17 >> 1 <= v18)
  {
    sub_1A03ACC98(v17 > 1, v18 + 1, 1, v15);
    v16 = v72;
    v17 = *(_QWORD *)(v72 + 24);
    v19 = v17 >> 1;
  }
  *(_QWORD *)(v16 + 16) = v20;
  v21 = v16 + 16 * v18;
  *(_QWORD *)(v21 + 32) = 0x5443454C4553;
  *(_QWORD *)(v21 + 40) = 0xE600000000000000;
  v22 = v18 + 2;
  if (v19 < v22)
  {
    sub_1A03ACC98(v17 > 1, v22, 1, v16);
    v16 = v73;
  }
  *(_QWORD *)(v16 + 16) = v22;
  v23 = v16 + 16 * v20;
  *(_QWORD *)(v23 + 32) = a1;
  *(_QWORD *)(v23 + 40) = a2;
  v25 = *(_QWORD *)(v16 + 16);
  v24 = *(_QWORD *)(v16 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A03ACC98(v24 > 1, v25 + 1, 1, v16);
    v16 = v74;
  }
  *(_QWORD *)(v16 + 16) = v25 + 1;
  v26 = v16 + 16 * v25;
  *(_QWORD *)(v26 + 32) = 1297044038;
  *(_QWORD *)(v26 + 40) = 0xE400000000000000;
  v27 = (*(uint64_t (**)(uint64_t, uint64_t))(a8 + 32))(a7, a8);
  v29 = v28;
  v31 = *(_QWORD *)(v16 + 16);
  v30 = *(_QWORD *)(v16 + 24);
  v32 = v31 + 1;
  if (v31 >= v30 >> 1)
  {
    sub_1A03ACC98(v30 > 1, v31 + 1, 1, v16);
    v16 = v75;
  }
  *(_QWORD *)(v16 + 16) = v32;
  v33 = v16 + 16 * v31;
  *(_QWORD *)(v33 + 32) = v27;
  *(_QWORD *)(v33 + 40) = v29;
  if ((~v13 & 0xF000000000000007) != 0)
  {
    v34 = *(_QWORD *)(v16 + 24);
    if (v32 >= v34 >> 1)
    {
      sub_1A03ACC98(v34 > 1, v31 + 2, 1, v16);
      v16 = v77;
    }
    *(_QWORD *)(v16 + 16) = v31 + 2;
    v35 = v16 + 16 * v32;
    *(_QWORD *)(v35 + 32) = 0x4552454857;
    *(_QWORD *)(v35 + 40) = 0xE500000000000000;
    sub_1A03B2888();
    v37 = v36;
    v39 = v38;
    v41 = *(_QWORD *)(v16 + 16);
    v40 = *(_QWORD *)(v16 + 24);
    if (v41 >= v40 >> 1)
    {
      sub_1A03ACC98(v40 > 1, v41 + 1, 1, v16);
      v16 = v78;
    }
    *(_QWORD *)(v16 + 16) = v41 + 1;
    v42 = v16 + 16 * v41;
    *(_QWORD *)(v42 + 32) = v37;
    *(_QWORD *)(v42 + 40) = v39;
    sub_1A03AA450(v13);
  }
  if (v85 != 255)
  {
    v44 = *(_QWORD *)(v16 + 16);
    v43 = *(_QWORD *)(v16 + 24);
    if (v44 >= v43 >> 1)
    {
      sub_1A03ACC98(v43 > 1, v44 + 1, 1, v16);
      v16 = v76;
    }
    *(_QWORD *)(v16 + 16) = v44 + 1;
    v45 = v16 + 16 * v44;
    *(_QWORD *)(v45 + 32) = 0x594220524544524FLL;
    *(_QWORD *)(v45 + 40) = 0xE800000000000000;
    if ((v85 & 1) != 0)
    {
      sub_1A03AB470();
      v56 = *(_QWORD *)(v16 + 16);
      v55 = *(_QWORD *)(v16 + 24);
      v57 = v55 >> 1;
      v58 = v56 + 1;
      if (v55 >> 1 <= v56)
      {
        sub_1A03ACC98(v55 > 1, v56 + 1, 1, v16);
        v16 = v83;
        v55 = *(_QWORD *)(v83 + 24);
        v57 = v55 >> 1;
      }
      *(_QWORD *)(v16 + 16) = v58;
      v59 = v16 + 16 * v56;
      *(_QWORD *)(v59 + 32) = v14;
      *(_QWORD *)(v59 + 40) = v86;
      v60 = v56 + 2;
      if (v57 < v60)
      {
        sub_1A03ACC98(v55 > 1, v60, 1, v16);
        v16 = v84;
      }
      *(_QWORD *)(v16 + 16) = v60;
      v61 = v16 + 16 * v58;
      *(_QWORD *)(v61 + 32) = 4412225;
      v53 = v61 + 32;
      v54 = 0xE300000000000000;
    }
    else
    {
      sub_1A03AB470();
      v47 = *(_QWORD *)(v16 + 16);
      v46 = *(_QWORD *)(v16 + 24);
      v48 = v46 >> 1;
      v49 = v47 + 1;
      if (v46 >> 1 <= v47)
      {
        sub_1A03ACC98(v46 > 1, v47 + 1, 1, v16);
        v16 = v81;
        v46 = *(_QWORD *)(v81 + 24);
        v48 = v46 >> 1;
      }
      *(_QWORD *)(v16 + 16) = v49;
      v50 = v16 + 16 * v47;
      *(_QWORD *)(v50 + 32) = v14;
      *(_QWORD *)(v50 + 40) = v86;
      v51 = v47 + 2;
      if (v48 < v51)
      {
        sub_1A03ACC98(v46 > 1, v51, 1, v16);
        v16 = v82;
      }
      *(_QWORD *)(v16 + 16) = v51;
      v52 = v16 + 16 * v49;
      *(_QWORD *)(v52 + 32) = 1129530692;
      v53 = v52 + 32;
      v54 = 0xE400000000000000;
    }
    *(_QWORD *)(v53 + 8) = v54;
    sub_1A03AB478(v14, v86, v85);
  }
  if ((a6 & 1) == 0)
  {
    v63 = *(_QWORD *)(v16 + 16);
    v62 = *(_QWORD *)(v16 + 24);
    if (v63 >= v62 >> 1)
    {
      sub_1A03ACC98(v62 > 1, v63 + 1, 1, v16);
      v16 = v79;
    }
    *(_QWORD *)(v16 + 16) = v63 + 1;
    v64 = v16 + 16 * v63;
    *(_QWORD *)(v64 + 32) = 0x54494D494CLL;
    *(_QWORD *)(v64 + 40) = 0xE500000000000000;
    v65 = sub_1A03D6104();
    v67 = v66;
    v69 = *(_QWORD *)(v16 + 16);
    v68 = *(_QWORD *)(v16 + 24);
    if (v69 >= v68 >> 1)
    {
      sub_1A03ACC98(v68 > 1, v69 + 1, 1, v16);
      v16 = v80;
    }
    *(_QWORD *)(v16 + 16) = v69 + 1;
    v70 = v16 + 16 * v69;
    *(_QWORD *)(v70 + 32) = v65;
    *(_QWORD *)(v70 + 40) = v67;
  }
  return v16;
}

uint64_t sub_1A03AA450(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_release();
  return result;
}

uint64_t sub_1A03AA468(uint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return swift_retain();
  return result;
}

void sub_1A03AA480(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1A03B0654(a1, a2, a3, a4, &qword_1ED0CDFE8, (uint64_t)&type metadata for Versions.Entity, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1A03B3EC4, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1A03C50F8);
}

uint64_t sub_1A03AA4A4(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

unint64_t sub_1A03AA4D0()
{
  unint64_t result;

  result = qword_1ED0CE630[0];
  if (!qword_1ED0CE630[0])
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D8114, &type metadata for Versions.Entity);
    atomic_store(result, qword_1ED0CE630);
  }
  return result;
}

_QWORD *sub_1A03AA50C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_9_9(a1, (unint64_t *)&qword_1ED0CE578, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for Column);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1();
  v2 = v1;
  OUTLINED_FUNCTION_9_9(v1, &qword_1ED0CE0D8, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for FastColumn);
  v3 = (_QWORD *)OUTLINED_FUNCTION_0();
  v3[2] = 25705;
  v3[3] = 0xE200000000000000;
  v3[4] = v2;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1();
  v5 = v4;
  v6 = OUTLINED_FUNCTION_0();
  v7 = OUTLINED_FUNCTION_2_13(v6);
  *(_QWORD *)(v7 + 24) = v8;
  *(_QWORD *)(v7 + 32) = v5;
  swift_retain();
  sub_1A03AC5B8();
  swift_retain();
  swift_retain();
  swift_release();
  swift_retain();
  sub_1A03AC5B8();
  swift_release();
  swift_release();
  swift_release();
  return v3;
}

uint64_t sub_1A03AA668(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unsigned __int8 v10;
  void (*v11)(_QWORD *__return_ptr, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  int64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
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
  _QWORD v74[2];
  _BYTE v75[40];
  uint64_t v76;
  unint64_t v77;
  unsigned __int8 v78[40];
  uint64_t v79;

  HIDWORD(v70) = a3;
  v5 = sub_1A03D593C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v9 = *(_QWORD *)(a1 + 32);
  swift_beginAccess();
  if (*(_QWORD *)(v9 + 32))
  {
LABEL_5:
    swift_bridgeObjectRetain();
    goto LABEL_6;
  }
  sub_1A03D32D8((uint64_t)&v76);
  v10 = v78[0];
  if (v78[0] != 255)
  {
    v11 = (void (*)(_QWORD *__return_ptr, uint64_t))v76;
    v12 = v77;
    if ((v78[0] & 1) != 0)
    {
      swift_retain();
      swift_retain();
      v13 = sub_1A03D45CC((uint64_t)v11, v12, v10);
      v11(v74, v13);
      sub_1A03B3174((uint64_t)v11, v12, v10);
      sub_1A03B3174((uint64_t)v11, v12, v10);
      swift_release();
      swift_release();
    }
    goto LABEL_5;
  }
  sub_1A03D5930();
  sub_1A03D5924();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
LABEL_6:
  v14 = sub_1A03A8DAC(a1, a2);
  v15 = *(_QWORD *)(v14 + 16);
  v16 = MEMORY[0x1E0DEE9D8];
  v73 = a1;
  v72 = a2;
  v71 = v14;
  if (v15)
  {
    v76 = MEMORY[0x1E0DEE9D8];
    swift_bridgeObjectRetain();
    sub_1A03AD374(0, v15, 0);
    v16 = MEMORY[0x1E0DEE9D8];
    v17 = v76;
    v18 = (_QWORD *)(v14 + 48);
    do
    {
      sub_1A03AAD5C(*(v18 - 2), *(v18 - 1), v18);
      v20 = v19;
      v22 = v21;
      v76 = v17;
      v24 = *(_QWORD *)(v17 + 16);
      v23 = *(_QWORD *)(v17 + 24);
      if (v24 >= v23 >> 1)
      {
        sub_1A03AD374((char *)(v23 > 1), v24 + 1, 1);
        v16 = MEMORY[0x1E0DEE9D8];
        v17 = v76;
      }
      *(_QWORD *)(v17 + 16) = v24 + 1;
      v25 = v17 + 16 * v24;
      *(_QWORD *)(v25 + 32) = v20;
      *(_QWORD *)(v25 + 40) = v22;
      v18 += 7;
      --v15;
    }
    while (v15);
    swift_bridgeObjectRelease_n();
    v14 = v71;
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x1E0DEE9D8];
  }
  v26 = *(_QWORD *)(v14 + 16);
  if (v26)
  {
    v79 = v16;
    sub_1A03AD374(0, v26, 0);
    v27 = v14 + 32;
    v28 = v79;
    do
    {
      sub_1A03ACCBC(v27, (uint64_t)&v76);
      v30 = v76;
      v29 = v77;
      v74[0] = v76;
      v74[1] = v77;
      sub_1A03B3408((uint64_t)v78, (uint64_t)v75);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v75);
      sub_1A03A9DC4((uint64_t)&v76, (uint64_t (*)(_QWORD))sub_1A03ACECC);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03AD374(0, *(_QWORD *)(v28 + 16) + 1, 1);
        v28 = v79;
      }
      v32 = *(_QWORD *)(v28 + 16);
      v31 = *(_QWORD *)(v28 + 24);
      if (v32 >= v31 >> 1)
      {
        sub_1A03AD374((char *)(v31 > 1), v32 + 1, 1);
        v28 = v79;
      }
      *(_QWORD *)(v28 + 16) = v32 + 1;
      v33 = v28 + 16 * v32;
      *(_QWORD *)(v33 + 32) = v30;
      *(_QWORD *)(v33 + 40) = v29;
      v27 += 56;
      --v26;
    }
    while (v26);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v28 = MEMORY[0x1E0DEE9D8];
  }
  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v35 = v34;
  v37 = *(_QWORD *)(v34 + 16);
  v36 = *(_QWORD *)(v34 + 24);
  v38 = v37 + 1;
  if (v37 >= v36 >> 1)
  {
    sub_1A03ACC98(v36 > 1, v37 + 1, 1, v34);
    v35 = v63;
  }
  *(_QWORD *)(v35 + 16) = v38;
  v39 = v35 + 16 * v37;
  *(_QWORD *)(v39 + 32) = 0x545245534E49;
  *(_QWORD *)(v39 + 40) = 0xE600000000000000;
  if ((v70 & 0x100000000) != 0)
  {
    v40 = *(_QWORD *)(v35 + 24);
    v41 = v37 + 2;
    if (v38 >= v40 >> 1)
    {
      sub_1A03ACC98(v40 > 1, v41, 1, v35);
      v35 = v69;
    }
    *(_QWORD *)(v35 + 16) = v41;
    v42 = v35 + 16 * v38;
    *(_QWORD *)(v42 + 32) = 0x414C50455220524FLL;
    *(_QWORD *)(v42 + 40) = 0xEA00000000004543;
    v38 = *(_QWORD *)(v35 + 16);
  }
  v43 = *(_QWORD *)(v35 + 24);
  v44 = v38 + 1;
  if (v38 >= v43 >> 1)
  {
    sub_1A03ACC98(v43 > 1, v38 + 1, 1, v35);
    v35 = v64;
  }
  *(_QWORD *)(v35 + 16) = v44;
  v45 = v35 + 16 * v38;
  *(_QWORD *)(v45 + 32) = 1330925129;
  *(_QWORD *)(v45 + 40) = 0xE400000000000000;
  v46 = *(_QWORD *)(v35 + 24);
  v47 = v38 + 2;
  if (v47 > (uint64_t)(v46 >> 1))
  {
    sub_1A03ACC98(v46 > 1, v47, 1, v35);
    v35 = v65;
  }
  *(_QWORD *)(v35 + 16) = v47;
  v48 = v35 + 16 * v44;
  strcpy((char *)(v48 + 32), "table_versions");
  *(_BYTE *)(v48 + 47) = -18;
  v76 = 40;
  v77 = 0xE100000000000000;
  v74[0] = v28;
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
  sub_1A03AD1F8();
  sub_1A03D5B94();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  v49 = v76;
  v50 = v77;
  v52 = *(_QWORD *)(v35 + 16);
  v51 = *(_QWORD *)(v35 + 24);
  v53 = v51 >> 1;
  v54 = v52 + 1;
  if (v51 >> 1 <= v52)
  {
    sub_1A03ACC98(v51 > 1, v52 + 1, 1, v35);
    v35 = v66;
    v51 = *(_QWORD *)(v66 + 24);
    v53 = v51 >> 1;
  }
  *(_QWORD *)(v35 + 16) = v54;
  v55 = v35 + 16 * v52;
  *(_QWORD *)(v55 + 32) = v49;
  *(_QWORD *)(v55 + 40) = v50;
  if (v53 < (uint64_t)(v52 + 2))
  {
    sub_1A03ACC98(v51 > 1, v52 + 2, 1, v35);
    v35 = v67;
  }
  *(_QWORD *)(v35 + 16) = v52 + 2;
  v56 = v35 + 16 * v54;
  *(_QWORD *)(v56 + 32) = 0x5345554C4156;
  *(_QWORD *)(v56 + 40) = 0xE600000000000000;
  v76 = 40;
  v77 = 0xE100000000000000;
  v74[0] = v17;
  sub_1A03D5B94();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  v57 = v76;
  v58 = v77;
  v60 = *(_QWORD *)(v35 + 16);
  v59 = *(_QWORD *)(v35 + 24);
  if (v60 >= v59 >> 1)
  {
    sub_1A03ACC98(v59 > 1, v60 + 1, 1, v35);
    v35 = v68;
  }
  *(_QWORD *)(v35 + 16) = v60 + 1;
  v61 = v35 + 16 * v60;
  *(_QWORD *)(v61 + 32) = v57;
  *(_QWORD *)(v61 + 40) = v58;
  swift_release();
  swift_release();
  return v35;
}

void sub_1A03AAD5C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3[3];
  v4 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 16))(&v5, v3, v4);
  __asm { BR              X10 }
}

uint64_t sub_1A03AADD8()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1A03B2CA0();
  sub_1A03D5EE8();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  sub_1A03ADE98(v1, v2, 0);
  v3 = sub_1A03AF8F4(39, 0xE100000000000000, v0);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1A03AAF1C()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = Data.queryValue.getter();
  sub_1A03AF8F4(v3, v4, v0);
  swift_bridgeObjectRelease();
  sub_1A03ADE98(v1, v2, 4);
  JUMPOUT(0x1A03AAEF4);
}

void sub_1A03AAF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,_QWORD *a22,unsigned __int8 a23)
{
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;

  v24 = v23[3];
  v25 = v23[4];
  __swift_project_boxed_opaque_existential_1(v23, v24);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v25 + 32))(&a21, v24, v25);
  v26 = a21;
  v27 = a22;
  switch(a23)
  {
    case 0u:
      a21 = 39;
      a22 = (_QWORD *)0xE100000000000000;
      sub_1A03AE264(v26, (unint64_t)v27, 0);
      sub_1A03B2CA0();
      sub_1A03D5EE8();
      sub_1A03D5C48();
      swift_bridgeObjectRelease();
      sub_1A03D5C48();
      sub_1A03C075C(v26, (unint64_t)v27, 0);
      v28 = v26;
      v29 = (unint64_t)v27;
      v30 = 0;
      goto LABEL_20;
    case 1u:
      sub_1A03D6104();
      sub_1A03C075C(v26, (unint64_t)v27, 1);
      v28 = v26;
      v29 = (unint64_t)v27;
      v30 = 1;
      goto LABEL_20;
    case 2u:
LABEL_7:
      sub_1A03C075C(v26, (unint64_t)v27, 2);
      sub_1A03C075C(v26, (unint64_t)v27, 2);
      break;
    case 3u:
      a21 = 0;
      a22 = (_QWORD *)0xE000000000000000;
      sub_1A03D5D68();
      sub_1A03C075C(v26, (unint64_t)v27, 3);
      v28 = v26;
      v29 = (unint64_t)v27;
      v30 = 3;
      goto LABEL_20;
    case 4u:
      sub_1A03AE264(a21, (unint64_t)a22, 4);
      Data.queryValue.getter();
      sub_1A03C075C(v26, (unint64_t)v27, 4);
      v28 = v26;
      v29 = (unint64_t)v27;
      v30 = 4;
LABEL_20:
      sub_1A03C075C(v28, v29, v30);
      break;
    case 5u:
      sub_1A03C075C(a21, (unint64_t)a22, 5);
      sub_1A03C075C(v26, (unint64_t)v27, 5);
      break;
    default:
      v31 = *(_QWORD *)(a21 + 24);
      v32 = *(_QWORD *)(a21 + 32);
      __swift_project_boxed_opaque_existential_1((_QWORD *)a21, v31);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v32 + 24))(&a21, v31, v32);
      v26 = a23;
      v27 = (_QWORD *)a21;
      v33 = (unint64_t)a22;
      a21 = 0;
      a22 = (_QWORD *)0xE000000000000000;
      sub_1A03D5F30();
      swift_bridgeObjectRelease();
      a21 = 0xD000000000000011;
      a22 = (_QWORD *)0x80000001A03D9C60;
      sub_1A03D5C48();
      sub_1A03D5C48();
      sub_1A03D5C48();
      sub_1A03D5C48();
      sub_1A03D5C48();
      sub_1A03D5C48();
      switch((int)v26)
      {
        case 0:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 19:
        case 21:
        case 22:
        case 23:
        case 24:
        case 25:
        case 26:
        case 27:
          sub_1A03AE264((uint64_t)v27, v33, 0);
          sub_1A03B2CA0();
          goto LABEL_5;
        case 1:
          sub_1A03D6104();
          v34 = (uint64_t)v27;
          v35 = v33;
          v36 = 1;
          goto LABEL_15;
        case 2:
          sub_1A03C075C((uint64_t)v27, v33, 2);
          goto LABEL_19;
        case 3:
          sub_1A03D5D68();
          v34 = (uint64_t)v27;
          v35 = v33;
          v36 = 3;
          goto LABEL_15;
        case 4:
          sub_1A03AE264((uint64_t)v27, v33, 4);
          Data.queryValue.getter();
          v34 = (uint64_t)v27;
          v35 = v33;
          v36 = 4;
          goto LABEL_15;
        case 5:
          sub_1A03C075C((uint64_t)v27, v33, 5);
          goto LABEL_19;
        case 12:
LABEL_5:
          sub_1A03D5EE8();
          sub_1A03D5C48();
          swift_bridgeObjectRelease();
          sub_1A03D5C48();
          v34 = (uint64_t)v27;
          v35 = v33;
          v36 = 0;
LABEL_15:
          sub_1A03C075C(v34, v35, v36);
LABEL_19:
          sub_1A03D5C48();
          swift_bridgeObjectRelease();
          sub_1A03D5C48();
          v28 = (uint64_t)v27;
          v29 = v33;
          v30 = v26;
          goto LABEL_20;
        case 20:
          goto LABEL_7;
        default:
          goto LABEL_21;
      }
  }
LABEL_21:
  JUMPOUT(0x1A03AAEF4);
}

uint64_t sub_1A03AB468()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03AB470()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A03AB478(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 != 255)
    return sub_1A03AB468();
  return result;
}

void sub_1A03AB490()
{
  type metadata accessor for KVSEntry();
}

void sub_1A03AB874(uint64_t (*a1)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = a1(0, *(_QWORD *)(*(_QWORD *)v1 + 80), *(_QWORD *)(*(_QWORD *)v1 + 88));
  v3 = OUTLINED_FUNCTION_0_22(v2);
  OUTLINED_FUNCTION_2_22(v3);
  OUTLINED_FUNCTION_1_22();
}

void sub_1A03AB8B4()
{
  sub_1A03AB874((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for Save);
}

uint64_t type metadata accessor for Save(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Save);
}

uint64_t sub_1A03AB8D4(__int128 *a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0();
  sub_1A03A5D80(a1, v2 + 16);
  return v2;
}

uint64_t type metadata accessor for Delete(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Delete);
}

void sub_1A03AB91C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1A03AB940(a1, a2, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_1A03AB934(char a1)
{
  return a1 & 1;
}

void sub_1A03AB940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[12];

  v15[2] = a3;
  v15[11] = a2;
  sub_1A03A298C(0, &qword_1ED0CDBD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v13);
  v15[4] = (char *)v15 - v14;
  v15[5] = a4;
  v15[6] = a5;
  v15[7] = a6;
  v15[8] = a7;
  v15[9] = a8;
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A03AB9E0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  char v23;
  _BYTE v24[96];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v2 - 152) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v5 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = &v24[-v9];
  v12 = *v1;
  v11 = v1[1];
  v13 = &v24[*(int *)(v8 + 48) - v9];
  *v10 = v12;
  v10[1] = v11;
  v14 = *(_QWORD *)(a1 - 8);
  v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v15(v13, *(char **)(v2 - 72), a1);
  *(_QWORD *)(v2 - 72) = TupleTypeMetadata2;
  v16 = (char *)v7 + *(int *)(TupleTypeMetadata2 + 48);
  *v7 = v12;
  v7[1] = v11;
  v15(v16, v13, a1);
  v17 = *((_QWORD *)v16 + 1);
  v18 = *(void (**)(char *, uint64_t))(v14 + 8);
  v19 = *(_QWORD *)(v2 - 128);
  swift_bridgeObjectRetain();
  swift_retain();
  v18(v16, a1);
  v20 = v17 + *(_QWORD *)(*(_QWORD *)v17 + 104);
  swift_beginAccess();
  sub_1A03B86D0(v20, v19, (uint64_t)&qword_1ED0CDBD8, (uint64_t)MEMORY[0x1E0CB0870], (uint64_t)MEMORY[0x1E0DEB940], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_1A03A298C);
  swift_release();
  v21 = sub_1A03D5918();
  result = __swift_getEnumTagSinglePayload(v19, 1, v21);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v23 = sub_1A03B61A0(v19);
    (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v2 - 152) + 8))(v10, *(_QWORD *)(v2 - 72));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v19, v21);
    return v23 & 1;
  }
  return result;
}

_QWORD *sub_1A03ABBA0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 24) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 24) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_retain();
  swift_retain();
  swift_retain();
  v10(v8, v9, v5);
  return a1;
}

uint64_t sub_1A03ABC30(uint64_t a1, uint64_t a2)
{
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

void type metadata accessor for KVSEntry()
{
  JUMPOUT(0x1A1AF9B88);
}

void sub_1A03ABC90(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_37();
  }
  OUTLINED_FUNCTION_14();
}

void sub_1A03ABCC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x1A1AF9BC4](a3, v5), a1);
  }
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03ABD00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03AC4DC(0, &qword_1ED0CDBD8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A03ABD54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_1A03A298C(0, &qword_1ED0CDC80, (uint64_t (*)(uint64_t))sub_1A03AC528, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v14 - v4;
  sub_1A03AC2C8(0, v6, v7, v8);
  swift_allocObject();
  sub_1A03B3124();
  v10 = v9;
  sub_1A03AC528(0);
  v12 = v11;
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v12);
  sub_1A03B85C8(0, qword_1ED0CDC90, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A03AC370();
  sub_1A03AC318(0);
  swift_allocObject();
  sub_1A03AC544();
  return v10;
}

uint64_t sub_1A03ABF04(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t (*v8)(uint64_t, uint64_t);
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
  uint64_t v31;

  v31 = a2;
  v8 = (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940];
  sub_1A03A298C(0, &qword_1ED0CDBD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v31 - v10;
  sub_1A03A298C(0, &qword_1ED0CDC80, (uint64_t (*)(uint64_t))sub_1A03AC528, v8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v31 - v16;
  sub_1A03AC2C8(0, v18, v19, v20);
  swift_allocObject();
  sub_1A03B3124();
  v22 = v21;
  sub_1A03AC528(0);
  v24 = v23;
  __swift_storeEnumTagSinglePayload((uint64_t)v17, 1, 1, v23);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 1, 1, v24);
  sub_1A03B85C8(0, qword_1ED0CDC90, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  swift_retain();
  sub_1A03AC370();
  v26 = v25;
  sub_1A03AC318(0);
  swift_allocObject();
  swift_retain();
  sub_1A03AC544();
  swift_retain();
  sub_1A03AC5B8();
  swift_release();
  v27 = sub_1A03D5918();
  v28 = *(_QWORD *)(v27 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v11, a5, v27);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v27);
  v29 = v26 + *(_QWORD *)(*(_QWORD *)v26 + 104);
  swift_beginAccess();
  sub_1A03B2D34((uint64_t)v11, v29);
  swift_endAccess();
  swift_release();
  sub_1A03AC284(a3, a4);
  sub_1A03AC5E4();
  sub_1A03B0014(a3, a4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(a5, v27);
  return v22;
}

void sub_1A03AC208(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v6 = sub_1A03D5918();
    sub_1A03ABC90(qword_1ED0CDBC0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    v8 = a3(a1, v6, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1A03AC284(uint64_t a1, unint64_t a2)
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

void sub_1A03AC2C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CE578)
  {
    v4 = type metadata accessor for Column(0, MEMORY[0x1E0DEA968], (uint64_t)&protocol witness table for String, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CE578);
  }
}

void sub_1A03AC318(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CDC88)
  {
    v2 = sub_1A03B43E8();
    v4 = type metadata accessor for Column(a1, MEMORY[0x1E0CB0338], v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CDC88);
  }
}

void sub_1A03AC370()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  OUTLINED_FUNCTION_48();
  v16 = v1;
  v17 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v0[16] = 3;
  v9 = (uint64_t)&v0[*(_QWORD *)(*(_QWORD *)v0 + 104)];
  v10 = sub_1A03D5918();
  __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
  v11 = *(_QWORD *)(*(_QWORD *)v0 + 112);
  v0[v11] = 0;
  v12 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v0[v12] = 0;
  v13 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  v0[v13] = 0;
  v14 = (uint64_t)&v0[*(_QWORD *)(*(_QWORD *)v0 + 136)];
  sub_1A03AC528(0);
  OUTLINED_FUNCTION_19_5(v14);
  v15 = (uint64_t)&v0[*(_QWORD *)(*(_QWORD *)v0 + 144)];
  OUTLINED_FUNCTION_19_5(v15);
  v0[v11] = v8;
  v0[v12] = v6;
  v0[v13] = v4;
  OUTLINED_FUNCTION_3_13();
  sub_1A03AC49C(v16, v14, &qword_1ED0CDC80, sub_1A03AC528);
  swift_endAccess();
  OUTLINED_FUNCTION_3_13();
  sub_1A03AC49C(v17, v15, &qword_1ED0CDC80, sub_1A03AC528);
  swift_endAccess();
  OUTLINED_FUNCTION_11();
}

void sub_1A03AC49C(uint64_t a1, uint64_t a2, unint64_t *a3, void (*a4)(uint64_t))
{
  uint64_t v4;

  sub_1A03AC4DC(0, a3, a4);
  OUTLINED_FUNCTION_26_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40));
  OUTLINED_FUNCTION_14();
}

void sub_1A03AC4DC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1A03D5EC4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_1A03AC528(uint64_t a1)
{
  sub_1A03B85C8(a1, &qword_1ED0CDC78, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column.Func);
}

void sub_1A03AC544()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 v9;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_12_8();
  *(_BYTE *)(v0 + 16) = 4;
  *(_OWORD *)(v0 + 24) = xmmword_1A03D8270;
  OUTLINED_FUNCTION_1_15(v1, v2, v3);
  v4 = OUTLINED_FUNCTION_11_10();
  sub_1A03AC5A0(v4, v5, v6);
  OUTLINED_FUNCTION_3_13();
  v7 = OUTLINED_FUNCTION_8_12();
  sub_1A03AC5A0(v7, v8, v9);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_1A03AC5A0(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_1A03CCC28(result, a2, a3 & 1);
  return result;
}

void sub_1A03AC5B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_7_12();
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_8();
}

void sub_1A03AC5E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_7_12();
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  *(_QWORD *)(v1 + 24) = v2;
  *(_QWORD *)(v1 + 32) = v0;
  sub_1A03B2DC8(v3, v4);
  OUTLINED_FUNCTION_4_8();
}

uint64_t sub_1A03AC610(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  void (*v15)(_QWORD *__return_ptr, uint64_t);
  unint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t (*v18)(uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  unint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v64;
  uint64_t v65;
  unint64_t v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD v76[2];
  uint64_t v77;
  uint64_t v78;
  void (*v79)(uint64_t, uint64_t);
  uint64_t v80;
  int v81;
  uint64_t v82;
  void (*v83)(_QWORD *__return_ptr, uint64_t);
  unint64_t v84;
  _BYTE v85[40];
  uint64_t v86;
  unint64_t v87;
  char v88[40];
  uint64_t v89;
  uint64_t v90;

  v81 = a2;
  v80 = sub_1A03D593C();
  v78 = *(_QWORD *)(v80 - 8);
  v7 = MEMORY[0x1E0C80A78](v80);
  v9 = (char *)v76 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v7);
  v12 = (char *)v76 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = MEMORY[0x1E0DEE9D8];
  v13 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 24);
  v14 = v13(a3, a4);
  swift_beginAccess();
  v15 = *(void (**)(_QWORD *__return_ptr, uint64_t))(v14 + 24);
  v16 = *(_QWORD *)(v14 + 32);
  swift_bridgeObjectRetain();
  swift_release();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v82 = a1;
  v17(v12, a1, a3);
  if (v16)
  {
    v18 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
LABEL_7:
    OUTLINED_FUNCTION_3_5(v18);
    goto LABEL_8;
  }
  v19 = v9;
  v20 = v78;
  v21 = v80;
  v13(a3, a4);
  sub_1A03D32D8((uint64_t)&v86);
  swift_release();
  if (v88[0] != 255)
  {
    v15 = (void (*)(_QWORD *__return_ptr, uint64_t))v86;
    v16 = v87;
    if ((v88[0] & 1) != 0)
    {
      v22 = swift_retain();
      v15(&v83, v22);
      OUTLINED_FUNCTION_5_5();
      OUTLINED_FUNCTION_5_5();
      v15 = v83;
      v16 = v84;
    }
    v18 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    goto LABEL_7;
  }
  OUTLINED_FUNCTION_3_5(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  v64 = v19;
  sub_1A03D5930();
  v65 = sub_1A03D5924();
  v16 = v66;
  v67 = *(void (**)(char *, uint64_t))(v20 + 8);
  v15 = (void (*)(_QWORD *__return_ptr, uint64_t))v65;
  v67(v64, v21);
LABEL_8:
  v23 = *(_QWORD *)(a4 + 8);
  v24 = sub_1A03B0058(a3);
  MEMORY[0x1E0C80A78](v24);
  v76[-6] = a3;
  v76[-5] = a4;
  v76[-4] = &v90;
  v76[-3] = v15;
  v76[-2] = v16;
  v80 = sub_1A03D2844((void (*)(_QWORD *__return_ptr, uint64_t))sub_1A03AD2B0, (uint64_t)&v76[-8], v24);
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(v24 + 16);
  if (v25)
  {
    v77 = v23;
    v78 = a3;
    v89 = MEMORY[0x1E0DEE9D8];
    sub_1A03AD374(0, v25, 0);
    v76[1] = v24;
    v26 = v24 + 32;
    v27 = v89;
    do
    {
      sub_1A03ACCBC(v26, (uint64_t)&v86);
      v28 = v86;
      v29 = v87;
      v83 = (void (*)(_QWORD *__return_ptr, uint64_t))v86;
      v84 = v87;
      sub_1A03AE220((uint64_t)v88, (uint64_t)v85);
      swift_bridgeObjectRetain();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
      sub_1A03ACD00((uint64_t)&v86);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03AD374(0, *(_QWORD *)(v27 + 16) + 1, 1);
        v27 = v89;
      }
      v31 = *(_QWORD *)(v27 + 16);
      v30 = *(_QWORD *)(v27 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_1A03AD374((char *)(v30 > 1), v31 + 1, 1);
        v27 = v89;
      }
      *(_QWORD *)(v27 + 16) = v31 + 1;
      v32 = v27 + 16 * v31;
      *(_QWORD *)(v32 + 32) = v28;
      *(_QWORD *)(v32 + 40) = v29;
      v26 += 56;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    a3 = v78;
    v23 = v77;
  }
  else
  {
    swift_bridgeObjectRelease();
    v27 = MEMORY[0x1E0DEE9D8];
  }
  v33 = v90;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    OUTLINED_FUNCTION_0_9(0, *(_QWORD *)(v33 + 16) + 1);
    v33 = v68;
  }
  v35 = *(_QWORD *)(v33 + 16);
  v34 = *(_QWORD *)(v33 + 24);
  v36 = v35 + 1;
  if (v35 >= v34 >> 1)
  {
    OUTLINED_FUNCTION_0_9(v34 > 1, v35 + 1);
    v33 = v69;
  }
  *(_QWORD *)(v33 + 16) = v36;
  v37 = v33 + 16 * v35;
  *(_QWORD *)(v37 + 32) = 0x545245534E49;
  *(_QWORD *)(v37 + 40) = 0xE600000000000000;
  if ((v81 & 1) != 0)
  {
    v38 = *(_QWORD *)(v33 + 24);
    if (v36 >= v38 >> 1)
    {
      OUTLINED_FUNCTION_0_9(v38 > 1, v35 + 2);
      v33 = v75;
    }
    *(_QWORD *)(v33 + 16) = v35 + 2;
    v39 = v33 + 16 * v36;
    *(_QWORD *)(v39 + 32) = 0x414C50455220524FLL;
    *(_QWORD *)(v39 + 40) = 0xEA00000000004543;
    v36 = *(_QWORD *)(v33 + 16);
  }
  v40 = *(_QWORD *)(v33 + 24);
  if (v36 >= v40 >> 1)
  {
    OUTLINED_FUNCTION_0_9(v40 > 1, v36 + 1);
    v33 = v70;
  }
  *(_QWORD *)(v33 + 16) = v36 + 1;
  v41 = v33 + 16 * v36;
  *(_QWORD *)(v41 + 32) = 1330925129;
  *(_QWORD *)(v41 + 40) = 0xE400000000000000;
  v42 = (*(uint64_t (**)(uint64_t, uint64_t))(v23 + 32))(a3, v23);
  v44 = v43;
  v46 = *(_QWORD *)(v33 + 16);
  v45 = *(_QWORD *)(v33 + 24);
  if (v46 >= v45 >> 1)
  {
    OUTLINED_FUNCTION_0_9(v45 > 1, v46 + 1);
    v33 = v71;
  }
  *(_QWORD *)(v33 + 16) = v46 + 1;
  v47 = v33 + 16 * v46;
  *(_QWORD *)(v47 + 32) = v42;
  *(_QWORD *)(v47 + 40) = v44;
  v86 = 40;
  v87 = 0xE100000000000000;
  v83 = (void (*)(_QWORD *__return_ptr, uint64_t))v27;
  sub_1A03AD238();
  sub_1A03AD1F8();
  OUTLINED_FUNCTION_2_6();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_6();
  v48 = v86;
  v49 = v87;
  v51 = *(_QWORD *)(v33 + 16);
  v50 = *(_QWORD *)(v33 + 24);
  v52 = v50 >> 1;
  v53 = v51 + 1;
  if (v50 >> 1 <= v51)
  {
    OUTLINED_FUNCTION_0_9(v50 > 1, v51 + 1);
    v33 = v72;
    v50 = *(_QWORD *)(v72 + 24);
    v52 = v50 >> 1;
  }
  v54 = v79;
  *(_QWORD *)(v33 + 16) = v53;
  v55 = v33 + 16 * v51;
  *(_QWORD *)(v55 + 32) = v48;
  *(_QWORD *)(v55 + 40) = v49;
  if (v52 < (uint64_t)(v51 + 2))
  {
    OUTLINED_FUNCTION_0_9(v50 > 1, v51 + 2);
    v33 = v73;
  }
  v56 = v80;
  *(_QWORD *)(v33 + 16) = v51 + 2;
  v57 = v33 + 16 * v53;
  *(_QWORD *)(v57 + 32) = 0x5345554C4156;
  *(_QWORD *)(v57 + 40) = 0xE600000000000000;
  v86 = 40;
  v87 = 0xE100000000000000;
  v83 = (void (*)(_QWORD *__return_ptr, uint64_t))v56;
  OUTLINED_FUNCTION_2_6();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_7_6();
  v58 = v86;
  v59 = v87;
  v61 = *(_QWORD *)(v33 + 16);
  v60 = *(_QWORD *)(v33 + 24);
  if (v61 >= v60 >> 1)
  {
    OUTLINED_FUNCTION_0_9(v60 > 1, v61 + 1);
    v33 = v74;
  }
  *(_QWORD *)(v33 + 16) = v61 + 1;
  v62 = v33 + 16 * v61;
  *(_QWORD *)(v62 + 32) = v58;
  *(_QWORD *)(v62 + 40) = v59;
  v90 = v33;
  v54(v82, a3);
  return v90;
}

uint64_t destroy for Versions()
{
  swift_release();
  swift_release();
  return swift_release();
}

void sub_1A03ACC98(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_1A03B0654(a1, a2, a3, a4, (unint64_t *)&qword_1ED0CE768, MEMORY[0x1E0DEA968], (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_1A03B2064, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1A03B1EF0);
}

uint64_t sub_1A03ACCBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03ACECC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A03ACD00(uint64_t a1)
{
  uint64_t v2;

  sub_1A03ACECC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A03ACD3C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v12[56];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v17 = MEMORY[0x1E0DEE9D8];
    sub_1A03ACF78(0, v1, 0);
    v4 = a1 + 32;
    do
    {
      sub_1A03ACF34(v4, (uint64_t)v12);
      sub_1A03ACE68();
      sub_1A03ACECC();
      swift_dynamicCast();
      v2 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03ACF78(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v17;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1A03ACF78((_QWORD *)(v5 > 1), v6 + 1, 1);
        v2 = v17;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      v7 = v2 + 56 * v6;
      v8 = v13;
      v9 = v14;
      v10 = v15;
      *(_QWORD *)(v7 + 80) = v16;
      *(_OWORD *)(v7 + 48) = v9;
      *(_OWORD *)(v7 + 64) = v10;
      *(_OWORD *)(v7 + 32) = v8;
      v4 += 56;
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1A03ACE68()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CE6F8)
  {
    sub_1A03B3DD0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CE6F8);
  }
}

void sub_1A03ACECC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CE6D0)
  {
    sub_1A03B3DD0();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CE6D0);
  }
}

uint64_t sub_1A03ACF34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03ACE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *sub_1A03ACF78(_QWORD *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  _QWORD *result;

  result = sub_1A03ACF94(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

_QWORD *sub_1A03ACF94(_QWORD *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;

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
    sub_1A03A298C(0, (unint64_t *)&qword_1ED0CE760, (uint64_t (*)(uint64_t))sub_1A03ACECC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    sub_1A03C5070(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03AD090(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A03AD090(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 56 * a2 > a1 ? (v3 = a1 + 56 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1A03D6050();
    __break(1u);
  }
  else
  {
    sub_1A03ACECC();
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_1A03AD180()
{
  uint64_t v1;

  sub_1A03AD238();
  sub_1A03AD1F8();
  v1 = sub_1A03D5B94();
  swift_bridgeObjectRetain();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  return v1;
}

unint64_t sub_1A03AD1F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED0CE720;
  if (!qword_1ED0CE720)
  {
    sub_1A03AD238();
    result = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1ED0CE720);
  }
  return result;
}

void sub_1A03AD238()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE718)
  {
    v0 = sub_1A03D5D50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE718);
  }
}

uint64_t sub_1A03AD280(uint64_t a1)
{
  return sub_1A03AD28C(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_1A03AD28C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_1A03AD2B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A03AD2D4(a1, a2);
}

uint64_t sub_1A03AD2D4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1 + 2;
  swift_bridgeObjectRetain();
  sub_1A03AF1C0(v3, v4, v5);
  v7 = v6;
  v9 = v8;
  result = swift_bridgeObjectRelease();
  *a2 = v7;
  a2[1] = v9;
  return result;
}

char *sub_1A03AD374(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A03AD390(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1A03AD390(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1A03B1D80(0, (unint64_t *)&qword_1ED0CE768, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A03B1EF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03AD484((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A03AD484(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_0_15();
  result = OUTLINED_FUNCTION_10_4();
  __break(1u);
  return result;
}

uint64_t sub_1A03AD530()
{
  return swift_retain();
}

uint64_t sub_1A03AD538(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  __int128 v34[2];
  char v35;

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 88);
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 8) + 24);
  v11 = sub_1A03B0058(v4);
  type metadata accessor for Statement(0, v4, v10, v12);
  v35 = 1;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v13 = sub_1A03AC610((uint64_t)v7, 1, v4, v9);
  v15 = sub_1A03B2CE4(v13, v4, v9, v14);
  v17 = v16;
  swift_bridgeObjectRelease();
  sub_1A03AE220(v2 + 16, (uint64_t)v34);
  sub_1A03AD7A0(&v35, v15, v17, v34);
  v18 = v33;
  v19 = sub_1A03C49CC(v11, (uint64_t (*)(_QWORD, _QWORD, uint64_t))sub_1A03AF1B8);
  v20 = v18;
  swift_bridgeObjectRelease();
  v21 = *(_QWORD *)(v19 + 16);
  if (v21)
  {
    v33 = v18;
    swift_bridgeObjectRetain();
    v22 = (uint64_t *)(v19 + 40);
    v23 = MEMORY[0x1E0DEE9D8];
    do
    {
      v24 = *(v22 - 1);
      if (v24)
      {
        v25 = *v22;
        swift_retain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_18_4();
          v23 = v28;
        }
        v26 = *(_QWORD *)(v23 + 16);
        if (v26 >= *(_QWORD *)(v23 + 24) >> 1)
        {
          OUTLINED_FUNCTION_18_4();
          v23 = v29;
        }
        *(_QWORD *)(v23 + 16) = v26 + 1;
        v27 = v23 + 16 * v26;
        *(_QWORD *)(v27 + 32) = v24;
        *(_QWORD *)(v27 + 40) = v25;
      }
      v22 += 2;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    v20 = v33;
  }
  swift_bridgeObjectRelease();
  sub_1A03A810C();
  swift_release();
  v30 = swift_bridgeObjectRelease();
  sub_1A03AD83C(v30);
  result = swift_release();
  if (!v20)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t type metadata accessor for Statement(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Statement);
}

uint64_t sub_1A03AD7A0(char *a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  sub_1A03AD804(a1, a2, a3, a4);
  return v8;
}

uint64_t sub_1A03AD804(char *a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;
  char v5;

  v5 = *a1;
  *(_QWORD *)(v4 + 80) = MEMORY[0x1E0DEE9D8];
  *(_BYTE *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 16) = a2;
  *(_QWORD *)(v4 + 24) = a3;
  sub_1A03A5D80(a4, v4 + 40);
  return v4;
}

uint64_t sub_1A03AD83C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t *v11;
  int v12;
  char v13;
  uint64_t v14;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t *v21;
  uint64_t v22;

  v3 = v1;
  v18 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v16[4] = *(_QWORD *)(v18 - 8);
  v4 = MEMORY[0x1E0C80A78](a1);
  v16[3] = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  swift_beginAccess();
  v6 = *(_QWORD *)(v1 + 80);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    v8 = v6 + 40;
    while (1)
    {
      v9 = *(void (**)(uint64_t))(v8 - 8);
      v10 = swift_retain();
      v9(v10);
      if (v2)
        break;
      swift_release();
      v8 += 16;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    OUTLINED_FUNCTION_0_16();
    (*(void (**)(uint64_t **__return_ptr, uint64_t, uint64_t))(v7 + 8))(&v21, v6, v7);
    v11 = v21;
    v12 = *(unsigned __int8 *)(v1 + 32);
    if ((v21 & 0x10) != 0)
    {
LABEL_13:
      *(_QWORD *)&v20 = v11;
      v17 = sub_1A03B3860();
    }
    else
    {
LABEL_12:
      v17 = 0;
    }
    OUTLINED_FUNCTION_0_16();
    v14 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v7 + 16))(*(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), v6, v7);
    if (v2)
    {
      swift_release();
    }
    else
    {
      v19 = v14;
      v11 = &v22;
      v3 = v18;
      switch(v12)
      {
        case 0:
        case 1:
        case 2:
        case 3:
          OUTLINED_FUNCTION_1_16();
          v3 = sub_1A03D5D14();
          sub_1A03AE2E4();
          swift_release();
          swift_release();
          break;
        default:
          if (!v13 || (&v22 & 8) == 0)
            goto LABEL_12;
          goto LABEL_13;
      }
    }
  }
  return v3;
}

uint64_t sub_1A03ADE98(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 4)
    return sub_1A03B0014(result, a2);
  if (!a3)
    return swift_bridgeObjectRelease();
  return result;
}

void sub_1A03ADEB8(_BYTE *a1@<X8>)
{
  Column.dataType.getter(a1);
}

void Column.dataType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t sub_1A03ADEE4()
{
  uint64_t v0;
  unsigned int v1;

  v1 = sqlite3_step(*(sqlite3_stmt **)(v0 + 24));
  swift_retain();
  return sub_1A03AE5A8(v1);
}

uint64_t sub_1A03ADF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03ADF98();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A03ADF98()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CDFE0)
  {
    sub_1A03B4380();
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CDFE0);
  }
}

void sub_1A03ADFEC(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1A03AE020(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t result;
  uint64_t v18;

  result = (uint64_t)sqlite3_column_text(*(sqlite3_stmt **)(v15 + 24), v16);
  if (result)
  {
    result = sub_1A03D5C60();
    *(_QWORD *)v14 = result;
    *(_QWORD *)(v14 + 8) = v18;
    *(_BYTE *)(v14 + 16) = 0;
  }
  else
  {
    *(_QWORD *)v14 = 0;
    *(_QWORD *)(v14 + 8) = 0;
    *(_BYTE *)(v14 + 16) = 5;
  }
  return result;
}

void sub_1A03AE0EC(uint64_t a1, uint64_t a2)
{
  sub_1A03AE10C(a1, a2);
}

void sub_1A03AE10C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  void (*v15)(_QWORD *, _BYTE *, uint64_t, uint64_t);
  _BYTE *v16;
  uint64_t v17;
  _BYTE v18[40];
  _QWORD v19[2];
  char v20;

  v5 = *v2;
  v6 = *(_QWORD *)(*v2 + 80);
  OUTLINED_FUNCTION_26_1();
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v7);
  v9 = &v18[-v8];
  v10 = *(unsigned __int8 *)(a1 + 16);
  if (v10 == 255)
  {
    v16 = &v18[-v8];
    v17 = 1;
  }
  else
  {
    v12 = *(_QWORD *)a1;
    v11 = *(_QWORD *)(a1 + 8);
    if (v10 == 5 && (v11 | v12) == 0)
    {
      OUTLINED_FUNCTION_8_6((uint64_t)v9, 1);
      OUTLINED_FUNCTION_17_3();
      OUTLINED_FUNCTION_17_3();
      goto LABEL_9;
    }
    v19[0] = v12;
    v19[1] = v11;
    v20 = v10;
    sub_1A03AE220(a2, (uint64_t)v18);
    v14 = *(_QWORD *)(v5 + 88);
    v15 = *(void (**)(_QWORD *, _BYTE *, uint64_t, uint64_t))(v14 + 48);
    sub_1A03AE264(v12, v11, v10);
    v15(v19, v18, v6, v14);
    v16 = v9;
    v17 = 0;
  }
  OUTLINED_FUNCTION_8_6((uint64_t)v16, v17);
LABEL_9:
  sub_1A03AE284((uint64_t)v9);
}

uint64_t sub_1A03AE220(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A03AE264(uint64_t result, unint64_t a2, char a3)
{
  if (a3 == 4)
    return sub_1A03AC284(result, a2);
  if (!a3)
    return swift_bridgeObjectRetain();
  return result;
}

void sub_1A03AE284(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 104);
  OUTLINED_FUNCTION_5_6();
  v4 = OUTLINED_FUNCTION_35();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  swift_endAccess();
  OUTLINED_FUNCTION_4_8();
}

uint64_t sub_1A03AE2E4()
{
  uint64_t v0;
  unsigned int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  uint64_t v8;

  v1 = sqlite3_finalize(*(sqlite3_stmt **)(v0 + 24));
  v2 = sub_1A03AE798(v1);
  v4 = v3;
  v6 = v5;
  if ((sub_1A03AED70(v2, v3, v5) & 1) != 0)
    return sub_1A03AE590(v2, v4, v6);
  sub_1A03B2FE0();
  swift_allocError();
  *(_QWORD *)v8 = v2;
  *(_QWORD *)(v8 + 8) = v4;
  *(_BYTE *)(v8 + 16) = v6;
  return swift_willThrow();
}

uint64_t sub_1A03AE380(unsigned int a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_1A03AE798(a1);
  v3 = v2;
  v5 = v4;
  if ((sub_1A03AED70(v1, v2, v4) & 1) != 0)
  {
    OUTLINED_FUNCTION_6_10();
    return swift_bridgeObjectRelease();
  }
  else
  {
    if (v5 != 29 || __PAIR128__(v3, v1) >= 3)
    {
      if (qword_1ED0CE030 != -1)
        swift_once();
      v12 = (id)qword_1ED0D0000;
      sub_1A03D5DD4();
      sub_1A03A00AC();
      v7 = OUTLINED_FUNCTION_7_15();
      *(_OWORD *)(v7 + 16) = xmmword_1A03D6810;
      sub_1A03D6008();
      *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
      v8 = sub_1A03A0110();
      *(_QWORD *)(v7 + 64) = v8;
      *(_QWORD *)(v7 + 32) = 0;
      *(_QWORD *)(v7 + 40) = 0xE000000000000000;
      v13 = sub_1A03D6128();
      v14 = v9;
      sub_1A03D5C48();
      sub_1A03D5C48();
      OUTLINED_FUNCTION_8_13();
      *(_QWORD *)(v7 + 96) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v7 + 104) = v8;
      *(_QWORD *)(v7 + 72) = v13;
      *(_QWORD *)(v7 + 80) = v14;
      sub_1A03D5A2C();

      swift_bridgeObjectRelease();
    }
    sub_1A03B2FE0();
    v10 = OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_4_19(v10, v11);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_1A03AE590(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 0x1Cu)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1A03AE5A8(unsigned int a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v1 = sub_1A03AE798(a1);
  v3 = v2;
  v5 = v4;
  if ((sub_1A03AED70(v1, v2, v4) & 1) != 0)
  {
    OUTLINED_FUNCTION_6_10();
  }
  else
  {
    if (v5 != 29 || __PAIR128__(v3, v1) >= 3)
    {
      if (qword_1ED0CE030 != -1)
        swift_once();
      v6 = (id)qword_1ED0D0000;
      sub_1A03D5DD4();
      sub_1A03A00AC();
      v7 = OUTLINED_FUNCTION_7_15();
      *(_OWORD *)(v7 + 16) = xmmword_1A03D6810;
      sub_1A03D6008();
      *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
      v8 = sub_1A03A0110();
      *(_QWORD *)(v7 + 64) = v8;
      *(_QWORD *)(v7 + 32) = 0;
      *(_QWORD *)(v7 + 40) = 0xE000000000000000;
      v13 = sub_1A03D6128();
      v14 = v9;
      sub_1A03D5C48();
      sub_1A03D5C48();
      OUTLINED_FUNCTION_8_13();
      *(_QWORD *)(v7 + 96) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v7 + 104) = v8;
      *(_QWORD *)(v7 + 72) = v13;
      *(_QWORD *)(v7 + 80) = v14;
      sub_1A03D5A2C();

      swift_bridgeObjectRelease();
    }
    sub_1A03B2FE0();
    v10 = OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_4_19(v10, v11);
  }
  return swift_release();
}

unint64_t sub_1A03AE798(unsigned int a1)
{
  unint64_t v1;
  int v2;
  sqlite3 *v3;
  int v4;
  sqlite3 *v5;
  int v6;
  sqlite3 *v7;
  int v8;
  sqlite3 *v9;
  int v10;
  sqlite3 *v11;
  int v12;
  sqlite3 *v13;
  int v14;
  sqlite3 *v15;
  int v16;
  sqlite3 *v17;
  int v18;
  sqlite3 *v19;
  int v20;
  sqlite3 *v21;
  int v22;
  sqlite3 *v23;
  int v24;
  sqlite3 *v25;
  int v26;
  sqlite3 *v27;
  int v28;
  sqlite3 *v29;
  int v30;
  sqlite3 *v31;
  int v32;
  sqlite3 *v33;
  int v34;
  sqlite3 *v35;
  int v36;
  sqlite3 *v37;
  int v38;
  sqlite3 *v39;
  int v40;
  sqlite3 *v41;
  int v42;
  sqlite3 *v43;
  int v44;
  sqlite3 *v45;
  int v46;
  sqlite3 *v47;
  int v48;
  sqlite3 *v49;
  int v50;
  sqlite3 *v51;
  int v52;
  sqlite3 *v53;
  int v54;
  sqlite3 *v55;
  int v56;
  sqlite3 *v57;

  v1 = a1;
  switch(a1)
  {
    case 0u:
      return v1;
    case 1u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v3 && OUTLINED_FUNCTION_0_24(v2, v3))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 2u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v5 && OUTLINED_FUNCTION_0_24(v4, v5))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 3u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v7 && OUTLINED_FUNCTION_0_24(v6, v7))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 4u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v9 && OUTLINED_FUNCTION_0_24(v8, v9))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 5u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v11 && OUTLINED_FUNCTION_0_24(v10, v11))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 6u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v13 && OUTLINED_FUNCTION_0_24(v12, v13))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 7u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v15 && OUTLINED_FUNCTION_0_24(v14, v15))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 8u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v17 && OUTLINED_FUNCTION_0_24(v16, v17))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 9u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v19 && OUTLINED_FUNCTION_0_24(v18, v19))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xAu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v21 && OUTLINED_FUNCTION_0_24(v20, v21))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xBu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v23 && OUTLINED_FUNCTION_0_24(v22, v23))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xCu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v25 && OUTLINED_FUNCTION_0_24(v24, v25))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xDu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v27 && OUTLINED_FUNCTION_0_24(v26, v27))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xEu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v29 && OUTLINED_FUNCTION_0_24(v28, v29))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0xFu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v31 && OUTLINED_FUNCTION_0_24(v30, v31))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x10u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v33 && OUTLINED_FUNCTION_0_24(v32, v33))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x11u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v35 && OUTLINED_FUNCTION_0_24(v34, v35))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x12u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v37 && OUTLINED_FUNCTION_0_24(v36, v37))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x13u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v39 && OUTLINED_FUNCTION_0_24(v38, v39))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x14u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v41 && OUTLINED_FUNCTION_0_24(v40, v41))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x15u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v43 && OUTLINED_FUNCTION_0_24(v42, v43))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x16u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v45 && OUTLINED_FUNCTION_0_24(v44, v45))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x17u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v47 && OUTLINED_FUNCTION_0_24(v46, v47))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x18u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v49 && OUTLINED_FUNCTION_0_24(v48, v49))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x19u:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v51 && OUTLINED_FUNCTION_0_24(v50, v51))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x1Au:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v53 && OUTLINED_FUNCTION_0_24(v52, v53))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x1Bu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v55 && OUTLINED_FUNCTION_0_24(v54, v55))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    case 0x1Cu:
      OUTLINED_FUNCTION_2_23();
      OUTLINED_FUNCTION_1_23();
      if (v57 && OUTLINED_FUNCTION_0_24(v56, v57))
      {
        sub_1A03D5C54();
        OUTLINED_FUNCTION_3_19();
      }
      break;
    default:
      if (a1 == 100)
      {
        v1 = 1;
      }
      else if (a1 == 101)
      {
        v1 = 2;
      }
      else
      {
        sub_1A03D5F30();
        swift_bridgeObjectRelease();
        sub_1A03D6104();
        sub_1A03D5C48();
        swift_bridgeObjectRelease();
        v1 = 0xD00000000000001ALL;
      }
      break;
  }
  return v1;
}

uint64_t sub_1A03AED70(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return ((uint64_t (*)(void))((char *)sub_1A03AED8C + 4 * byte_1A03D92E2[a3]))();
}

uint64_t sub_1A03AED8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
    return 0;
  if (a1 == a4 && a2 == a5)
    return 1;
  else
    return sub_1A03D6134();
}

void sub_1A03AEFD4(uint64_t a1, uint64_t a2)
{
  sub_1A03AEFF4(a1, a2);
}

void sub_1A03AEFF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  sqlite3 *v6;
  sqlite3_stmt *v7;
  sqlite3_stmt *v8[2];

  v8[1] = *(sqlite3_stmt **)MEMORY[0x1E0C80C00];
  v8[0] = 0;
  v6 = *(sqlite3 **)(v2 + 24);
  sub_1A03AF0CC(v6, a1, a2, v8);
  if (!v3)
  {
    v7 = v8[0];
    if (v8[0])
    {
      type metadata accessor for PreparedStatement();
      swift_allocObject();
      sub_1A03AF178((uint64_t)v7, (uint64_t)v6, a1, a2);
      swift_bridgeObjectRetain();
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1A03AF0CC(sqlite3 *a1, uint64_t a2, uint64_t a3, sqlite3_stmt **a4)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_10_8();
  LODWORD(a4) = sqlite3_prepare_v2(a1, (const char *)(v6 + 32), -1, a4, 0);
  swift_release();
  swift_bridgeObjectRetain();
  sub_1A03AE380(a4);
  OUTLINED_FUNCTION_5_13();
}

_QWORD *sub_1A03AF178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[2] = a2;
  v4[3] = a1;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t type metadata accessor for PreparedStatement()
{
  return objc_opt_self();
}

void sub_1A03AF1A8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(*(_QWORD *)v1 + 16);
}

uint64_t sub_1A03AF1B8(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_1A03AFE84(a1, a2, a3, v3);
}

void sub_1A03AF1C0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a3[3];
  v4 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v3);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v4 + 16))(&v5, v3, v4);
  __asm { BR              X10 }
}

uint64_t sub_1A03AF244()
{
  _QWORD *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  sub_1A03B2CA0();
  sub_1A03D5EE8();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  sub_1A03ADE98(v1, v2, 0);
  v3 = sub_1A03AF8F4(39, 0xE100000000000000, v0);
  swift_bridgeObjectRelease();
  return v3;
}

void sub_1A03AF8D4(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_1A03AFB3C(a1, a2);
}

uint64_t sub_1A03AF8F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  unint64_t v24;
  char v25;

  v4 = a3[3];
  v5 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v4);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v5 + 32))(&v23, v4, v5);
  v6 = v23;
  v7 = v24;
  switch(v25)
  {
    case 0:
      v23 = 39;
      v24 = 0xE100000000000000;
      sub_1A03AE264(v6, v7, 0);
      sub_1A03B2CA0();
      sub_1A03D5EE8();
      sub_1A03D5C48();
      OUTLINED_FUNCTION_18();
      OUTLINED_FUNCTION_7_6();
      v8 = OUTLINED_FUNCTION_1_6(v6, v7, 0);
      v10 = 0;
      goto LABEL_7;
    case 1:
      sub_1A03D6104();
      v11 = OUTLINED_FUNCTION_8_5();
      v13 = OUTLINED_FUNCTION_1_6(v11, v12, 1);
      v15 = 1;
      goto LABEL_9;
    case 2:
      v16 = OUTLINED_FUNCTION_1_6(v23, v24, 2);
      sub_1A03C075C(v16, v17, 2);
      return v6 & 1 | 0x30;
    case 3:
      v23 = 0;
      v24 = 0xE000000000000000;
      sub_1A03D5D68();
      v8 = OUTLINED_FUNCTION_1_6(v6, v7, 3);
      v10 = 3;
LABEL_7:
      sub_1A03C075C(v8, v9, v10);
      return v23;
    case 4:
      sub_1A03AE264(v23, v24, 4);
      Data.queryValue.getter();
      v18 = OUTLINED_FUNCTION_8_5();
      v13 = OUTLINED_FUNCTION_1_6(v18, v19, 4);
      v15 = 4;
LABEL_9:
      sub_1A03C075C(v13, v14, v15);
      break;
    case 5:
      v20 = OUTLINED_FUNCTION_1_6(v23, v24, 5);
      sub_1A03C075C(v20, v21, 5);
      a1 = 1280070990;
      break;
    default:
      swift_bridgeObjectRetain();
      break;
  }
  return a1;
}

void sub_1A03AFB1C(_OWORD *a1@<X8>)
{
  sub_1A03AFC10(a1);
}

void sub_1A03AFB3C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  char v14;

  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 80);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_19_3();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_11_7();
  if (__swift_getEnumTagSinglePayload(v4, 1, v7))
  {
    OUTLINED_FUNCTION_3_6();
    v10 = 0uLL;
    v11 = 5;
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v3, v4, v7);
    v12 = OUTLINED_FUNCTION_3_6();
    OUTLINED_FUNCTION_13_6(v12, *(_QWORD *)(v6 + 88));
    OUTLINED_FUNCTION_21_3(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    v10 = v13;
    v11 = v14;
  }
  *(_OWORD *)a2 = v10;
  *(_BYTE *)(a2 + 16) = v11;
  OUTLINED_FUNCTION_7_0();
}

void sub_1A03AFC10(_OWORD *a1@<X8>)
{
  sub_1A03AFC1C((void (*)(uint64_t))sub_1A03AFD74, a1);
}

void sub_1A03AFC1C(void (*a1)(uint64_t)@<X0>, _OWORD *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  __int128 v25;
  char v26;

  v24 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v23 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_19_3();
  v22 = *(_QWORD *)(v6 + 88);
  v8 = type metadata accessor for Column.Func(0, v5, v22, v7);
  v9 = *(_QWORD *)(v8 - 8);
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v21 - v11;
  sub_1A03D5EC4();
  OUTLINED_FUNCTION_20();
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v21 - v15;
  a1(v14);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v8))
  {
    OUTLINED_FUNCTION_16_4();
    v17 = 0uLL;
    v18 = -1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v16, v8);
    OUTLINED_FUNCTION_16_4();
    sub_1A03C30F8(v8, v3);
    v19 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    OUTLINED_FUNCTION_13_6(v19, v22);
    OUTLINED_FUNCTION_21_3(*(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    v17 = v25;
    v18 = v26;
  }
  v20 = v24;
  *v24 = v17;
  *((_BYTE *)v20 + 16) = v18;
  OUTLINED_FUNCTION_7_0();
}

void sub_1A03AFD74()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  OUTLINED_FUNCTION_0_12();
  type metadata accessor for Column.Func(255, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), v2);
  v3 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_0(v3);
  OUTLINED_FUNCTION_4_8();
}

uint64_t Column.__deallocating_deinit()
{
  Column.deinit();
  return swift_deallocClassInstance();
}

uint64_t *Column.deinit()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = *v0;
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 104);
  v3 = *(_QWORD *)(*v0 + 80);
  v4 = OUTLINED_FUNCTION_27_0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v2, v4);
  v5 = (uint64_t)v0 + *(_QWORD *)(*v0 + 136);
  type metadata accessor for Column.Func(255, v3, *(_QWORD *)(v1 + 88), v6);
  v7 = OUTLINED_FUNCTION_35();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v5, v7);
  v8((uint64_t)v0 + *(_QWORD *)(*v0 + 144), v7);
  return v0;
}

uint64_t type metadata accessor for Column.Func(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Column.Func);
}

uint64_t sub_1A03AFE84(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a3[3];
  v6 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 80))(a4 + 16, v5, v6);
}

uint64_t sub_1A03AFED0(uint64_t a1)
{
  return Column.saveChain(for:)(a1);
}

uint64_t Column.saveChain(for:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *v1;
  v5 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_18_3();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_11_7();
  if (OUTLINED_FUNCTION_15_6())
  {
    OUTLINED_FUNCTION_3_6();
    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_30_1(v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    OUTLINED_FUNCTION_3_6();
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 88) + 24) + 8))(a1, v5);
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v2, v5);
  }
  return v8;
}

void sub_1A03AFFDC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_12();
  v0 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_0(v0);
  OUTLINED_FUNCTION_4_8();
}

uint64_t sub_1A03B0014(uint64_t a1, unint64_t a2)
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

uint64_t sub_1A03B0058(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v13;
  __int128 v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  _BYTE v29[32];
  _BYTE v30[40];
  _OWORD v31[2];
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v2 = sub_1A03D61E8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (uint64_t (**)(uint64_t, uint64_t))((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_1_19((uint64_t)&v23 - v10);
  sub_1A03A5FF8(0, &qword_1ED0CE828);
  if (OUTLINED_FUNCTION_3_16())
  {
    OUTLINED_FUNCTION_0_21();
    v11 = *(_QWORD *)(OUTLINED_FUNCTION_2_19(v6[1]) + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_5:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v25);
    return v11;
  }
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  sub_1A03B1FA0((uint64_t)&v32, &qword_1ED0CE830, &qword_1ED0CE828);
  OUTLINED_FUNCTION_1_19((uint64_t)v9);
  sub_1A03A5FF8(0, &qword_1ED0CE800);
  if (OUTLINED_FUNCTION_3_16())
  {
    OUTLINED_FUNCTION_0_21();
    v11 = OUTLINED_FUNCTION_2_19(v6[4]);
    goto LABEL_5;
  }
  v34 = 0;
  v32 = 0u;
  v33 = 0u;
  sub_1A03B1FA0((uint64_t)&v32, &qword_1ED0CE808, &qword_1ED0CE800);
  *((_QWORD *)&v26 + 1) = a1;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v25);
  OUTLINED_FUNCTION_1_19((uint64_t)boxed_opaque_existential_0);
  sub_1A03D61D0();
  sub_1A03D61DC();
  sub_1A03D5FFC();
  swift_release();
  swift_retain();
  sub_1A03D605C();
  OUTLINED_FUNCTION_5_12();
  v24 = v2;
  v23 = v3;
  if (v35)
  {
    v13 = MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v14 = v32;
      sub_1A03B0594(&v33, v31);
      if (*((_QWORD *)&v14 + 1))
      {
        sub_1A03B0558((uint64_t)v31, (uint64_t)v29);
        sub_1A03A5FF8(0, qword_1ED0CE0E0);
        if ((OUTLINED_FUNCTION_3_16() & 1) == 0)
        {
          *(_QWORD *)&v27 = 0;
          v26 = 0u;
          v25 = 0u;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
          sub_1A03B1FA0((uint64_t)&v25, (unint64_t *)&qword_1EE597C00, qword_1ED0CE0E0);
          goto LABEL_17;
        }
        sub_1A03A5D80(&v25, (uint64_t)v30);
        v25 = v14;
        sub_1A03AE220((uint64_t)v30, (uint64_t)&v26);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          OUTLINED_FUNCTION_4_18();
          v13 = v20;
        }
        v15 = *(_QWORD *)(v13 + 16);
        if (v15 >= *(_QWORD *)(v13 + 24) >> 1)
        {
          OUTLINED_FUNCTION_4_18();
          v13 = v21;
        }
        *(_QWORD *)(v13 + 16) = v15 + 1;
        v16 = v13 + 56 * v15;
        v17 = v25;
        v18 = v26;
        v19 = v27;
        *(_QWORD *)(v16 + 80) = v28;
        *(_OWORD *)(v16 + 48) = v18;
        *(_OWORD *)(v16 + 64) = v19;
        *(_OWORD *)(v16 + 32) = v17;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v30);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
LABEL_17:
      sub_1A03D605C();
      OUTLINED_FUNCTION_5_12();
      if (!v35)
        goto LABEL_20;
    }
  }
  v13 = MEMORY[0x1E0DEE9D8];
LABEL_20:
  swift_release_n();
  v11 = sub_1A03ACD3C(v13);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t (**)(uint64_t, uint64_t), uint64_t))(v23 + 8))(v6, v24);
  return v11;
}

_QWORD *sub_1A03B0478(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  OUTLINED_FUNCTION_12();
  swift_retain();
  return a1;
}

uint64_t sub_1A03B04C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03B0504();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A03B0504()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE6E8)
  {
    sub_1A03B4314();
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE6E8);
  }
}

uint64_t sub_1A03B0558(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1A03B0594(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1A03B05A4()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_14_7();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_11_8();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_6_6();
  if (v2)
  {
    OUTLINED_FUNCTION_17_4(v6, &qword_1ED0CE770, (void (*)(uint64_t))sub_1A03ACE68);
    v7 = (const void *)OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_12_6(v7);
    *(_QWORD *)(v2 + 16) = v1;
    *(_QWORD *)(v2 + 24) = 2 * (v8 / 56);
  }
  if ((v0 & 1) != 0)
  {
    v9 = (char *)OUTLINED_FUNCTION_15_7();
    sub_1A03B1F44(v9, v10, v11);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v12 = OUTLINED_FUNCTION_7_9();
    sub_1A03B2158(v12, v13, v14, v15);
  }
  OUTLINED_FUNCTION_26();
}

void sub_1A03B0654(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t a6, void (*a7)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a8)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  size_t v18;
  _QWORD *v19;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v13 != v14)
    {
      OUTLINED_FUNCTION_11_8();
      if (v13)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  else
  {
    v12 = a2;
  }
  v15 = *(_QWORD *)(a4 + 16);
  if (v12 <= v15)
    v16 = *(_QWORD *)(a4 + 16);
  else
    v16 = v12;
  if (v16)
  {
    sub_1A03C5378(0, a5);
    v17 = (_QWORD *)OUTLINED_FUNCTION_8_8();
    v18 = _swift_stdlib_malloc_size(v17);
    v17[2] = v15;
    v17[3] = 2 * ((uint64_t)(v18 - 32) / 16);
  }
  else
  {
    v17 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v19 = v17 + 4;
  if ((a1 & 1) != 0)
  {
    a8(a4 + 32, v15, v19);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    a7(0, v15, v19, a4);
  }
  OUTLINED_FUNCTION_26();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return EntityType.init(valueType:connection:)(v3, v2, v1, a1, v4);
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 112) + 8))(v1, v0);
}

unint64_t OUTLINED_FUNCTION_1_3()
{
  unsigned __int8 *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;

  v5 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)(v4 - 128) = *(_QWORD *)v2;
  *(_QWORD *)(v4 - 120) = v5;
  *(_DWORD *)(v4 - 108) = *(unsigned __int8 *)(v2 + 16);
  *(_QWORD *)(v4 - 168) = *v1;
  *(_DWORD *)(v4 - 188) = *v0;
  v6 = **(unsigned __int8 **)(v4 - 160);
  *(_QWORD *)(v4 - 224) = *(_QWORD *)v3;
  *(_DWORD *)(v4 - 208) = *(unsigned __int8 *)(v3 + 8);
  *(_DWORD *)(v4 - 204) = v6;
  *(_DWORD *)(v4 - 212) = **(unsigned __int8 **)(v4 - 152);
  return sub_1A03A2AD8();
}

uint64_t OUTLINED_FUNCTION_1_4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v2;
  return sub_1A03AE220(v1, a1 + 32);
}

uint64_t OUTLINED_FUNCTION_1_5(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_1A03A9ED4(a1, a2, 0, 1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_1_6(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v3;

  sub_1A03C075C(a1, a2, a3);
  return v3;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_1_8()
{
  type metadata accessor for Store.Promises();
}

uint64_t sub_1A03B0840()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_1_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static ColumnType.createTableChain(for:ifNotExists:)(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t a1)
{
  return sub_1A03AD83C(a1);
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return sub_1A03D6050();
}

void OUTLINED_FUNCTION_0_0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A03ACC98(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_1_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_1_14()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_1_15(char a1, char a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 56) = 0;
  *(_QWORD *)(v3 + 48) = 0;
  *(_BYTE *)(v3 + 64) = -1;
  *(_QWORD *)(v3 + 80) = 0;
  *(_QWORD *)(v3 + 72) = 0;
  *(_BYTE *)(v3 + 88) = -1;
  *(_BYTE *)(v3 + 40) = a1;
  *(_BYTE *)(v3 + 41) = a2;
  *(_BYTE *)(v3 + 42) = a3;
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_1_16()
{
  return sub_1A03ADEE4();
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_1_19(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

void OUTLINED_FUNCTION_1_20(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_1_21()
{
  uint64_t v0;
  unint64_t v1;

  return sub_1A03ADE98(v0, v1, 4);
}

uint64_t OUTLINED_FUNCTION_1_24()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_6(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_1A03D59FC();
}

uint64_t OUTLINED_FUNCTION_6_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_6_3()
{
  sqlite3 *v0;

  sub_1A03A2324(v0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_4(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_1A03A9ED4(a1, a2, 1, 0, v2, v3);
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return sub_1A03D6134();
}

uint64_t OUTLINED_FUNCTION_6_8(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 8) + 8))(v1, *(_QWORD *)(v0 + 16));
}

uint64_t OUTLINED_FUNCTION_6_10()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1A03AE590(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_11()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_12@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return sub_1A03D5A14();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t v0;

  return v0;
}

uint64_t (*OUTLINED_FUNCTION_5_1(uint64_t a1))()
{
  uint64_t v1;
  uint64_t v2;

  return EntityType.saveChain(for:)(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_4(char *a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03AD7A0(a1, v4, v5, a4);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;
  unsigned __int8 v1;
  uint64_t v2;

  return sub_1A03B3174(v0, v2, v1);
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_9()
{
  return sub_1A03D5C48();
}

void OUTLINED_FUNCTION_0_1()
{
  sub_1A03B3124();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_5_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Statement(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_5_12()
{
  uint64_t v0;

  return sub_1A03B04C0(v0 - 304, v0 - 144);
}

uint64_t OUTLINED_FUNCTION_5_14()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_22()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_0_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_0_6()
{
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_0_8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for Statement(0, v4, a3, a4);
}

void OUTLINED_FUNCTION_0_9(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_1A03ACC98(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_0_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v5;

  return a5(a1, a2, a3, a4, v5[7], v5[8], v5[2], v5[3], v5[4], v5[5], v5[6]);
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_13()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_0_14@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_bridgeObjectRelease();
}

_QWORD *OUTLINED_FUNCTION_0_16()
{
  uint64_t v0;
  _QWORD *v1;

  return __swift_project_boxed_opaque_existential_1(v1, *(_QWORD *)(v0 + 64));
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_0_19(char *a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03AD7A0(a1, v4, v5, a4);
}

unint64_t OUTLINED_FUNCTION_0_20(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

_QWORD *OUTLINED_FUNCTION_0_21()
{
  uint64_t v0;

  sub_1A03A5D80((__int128 *)(v0 - 144), v0 - 304);
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 304), *(_QWORD *)(v0 - 280));
}

uint64_t OUTLINED_FUNCTION_0_22(uint64_t a1, ...)
{
  uint64_t v1;
  va_list va;

  va_start(va, a1);
  return sub_1A03AE220(v1, (uint64_t)va);
}

sqlite3_int64 OUTLINED_FUNCTION_0_23()
{
  uint64_t v0;
  int v1;

  return sqlite3_column_int64(*(sqlite3_stmt **)(v0 + 24), v1);
}

const char *OUTLINED_FUNCTION_0_24(int a1, sqlite3 *a2)
{
  return sqlite3_errmsg(a2);
}

void OUTLINED_FUNCTION_0_25(unint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  sub_1A03ACC98(a1 > 1, v1, 1, v2);
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1A03A06CC(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_3_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static EntityType.createTableChain(for:ifNotExists:)(a1, a2, a3, a4);
}

void OUTLINED_FUNCTION_3_2()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_3_3@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  return sub_1A03AE220((a1 & 0xFFFFFFFFFFFFFFFLL) + 32, (uint64_t)&a2);
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03A60E8(a1, v4, v5, a4);
}

uint64_t OUTLINED_FUNCTION_3_5@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 288) = a1;
  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_7@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  return type metadata accessor for Statement(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 88) + 8) + 24), a1);
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_9()
{
  return sub_1A03D5B94();
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return sub_1A03D5C30();
}

__n128 OUTLINED_FUNCTION_3_11()
{
  __n128 *v0;

  return v0[1];
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  return sub_1A03D60A4();
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_3_14()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_3_15()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = 4;
  return sub_1A03A050C(v0);
}

uint64_t OUTLINED_FUNCTION_3_16()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_3_17()
{
  void *v0;

  return v0;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1A1AF9B88](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t (*OUTLINED_FUNCTION_4_1(uint64_t a1))()
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;

  return static EntityType.createTableChain(for:ifNotExists:shouldVersion:)(v4, v3, v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  unint64_t v1;

  return sub_1A03ADE98(a1, v1, 4);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_1A03D5C48();
}

__n128 OUTLINED_FUNCTION_4_7()
{
  uint64_t v0;

  return *(__n128 *)(v0 + 40);
}

uint64_t OUTLINED_FUNCTION_4_9()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_11()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_4_12()
{
  sub_1A03A49F4();
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return sub_1A03D60EC();
}

void OUTLINED_FUNCTION_4_14(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 312) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_4_16(uint64_t a1)
{
  return sub_1A03AD83C(a1);
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_4_18()
{
  sub_1A03B05A4();
}

uint64_t OUTLINED_FUNCTION_4_19(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 16) = v2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_4_20()
{
  return sub_1A03D599C();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return sub_1A03D5E40();
}

char *OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;

  return sub_1A03AD374(0, *(_QWORD *)(v0 + 16) + 1, 1);
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return sub_1A03D6050();
}

uint64_t OUTLINED_FUNCTION_10_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for MixedKeyValueStore.Promises(255, v4, v5, a4);
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_10_7()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_8()
{
  return sub_1A03D5BF4();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

void OUTLINED_FUNCTION_7_1()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_7_3(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_1A03A23DC();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1)
{
  return sub_1A03AD83C(a1);
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_1A03D5C48();
}

void OUTLINED_FUNCTION_7_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
  type metadata accessor for Store.Promises();
}

uint64_t sub_1A03B12E4()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_7_8@<X0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return type metadata accessor for Statement(0, v2, *(_QWORD *)(a2 + 24), a1);
}

uint64_t OUTLINED_FUNCTION_7_9()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_11(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_7_12()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_7_15()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7_16()
{
  return sub_1A03D6134();
}

uint64_t OUTLINED_FUNCTION_7_17()
{
  return sub_1A03D5990();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(v1, 0, 1, v0);
  return sub_1A03B0014(*(_QWORD *)(v2 - 96), *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_11_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v8 - 184) = v7;
  *(_QWORD *)(v8 - 200) = a7;
  *(_QWORD *)(v8 - 160) = a4;
  *(_QWORD *)(v8 - 152) = a6;
  return sub_1A03D5E04();
}

char *OUTLINED_FUNCTION_11_4()
{
  int64_t v0;

  return sub_1A03AD374(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_11_5()
{
  return swift_release();
}

void OUTLINED_FUNCTION_11_6()
{
  sub_1A03A1F38();
}

void OUTLINED_FUNCTION_11_7()
{
  sub_1A03AFFDC();
}

void OUTLINED_FUNCTION_11_9()
{
  sub_1A03C4B30();
}

uint64_t OUTLINED_FUNCTION_11_10()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t result;

  result = *v4;
  *v4 = v3;
  *(_QWORD *)(v0 + 56) = v2;
  *(_BYTE *)(v0 + 64) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return sub_1A03A60E8(v4, v5, v6, a4);
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(&a9, v9, a1);
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return EntityType.valueType.getter(a1, a2);
}

uint64_t OUTLINED_FUNCTION_2_3@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1A03A23C4(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_72()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return sub_1A03D5B94();
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return Database.write(_:block:)();
}

uint64_t OUTLINED_FUNCTION_2_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  uint64_t v16;
  uint64_t v17;

  return sub_1A03AD7A0(&a16, v16, v17, &a9);
}

void OUTLINED_FUNCTION_2_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03ACC98(0, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_13(uint64_t result)
{
  *(_QWORD *)(result + 16) = 0x6E6F6973726576;
  return result;
}

uint64_t OUTLINED_FUNCTION_2_14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 - 256) + 8))(*(_QWORD *)(v1 - 272), *(_QWORD *)(v1 - 256));
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return sub_1A03AE2E4();
}

uint64_t OUTLINED_FUNCTION_2_16()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_2_17@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return type metadata accessor for LazyLoader(0, v1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t OUTLINED_FUNCTION_2_18()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_19@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

void OUTLINED_FUNCTION_2_20()
{
  JUMPOUT(0x1A1AF9C78);
}

uint64_t OUTLINED_FUNCTION_2_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 88));
}

uint64_t OUTLINED_FUNCTION_2_22(uint64_t a1, ...)
{
  uint64_t (*v1)(char *);
  va_list va;

  va_start(va, a1);
  return v1(va);
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

__n128 OUTLINED_FUNCTION_8_0()
{
  __n128 *v0;

  return v0[2];
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 120);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_8_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A03AE220(v2, a2);
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_8_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03A0848(a1, v4, v5, a4);
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_8_9()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_8_10()
{
  return swift_release();
}

void OUTLINED_FUNCTION_8_11(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t (*v5)(void);
  uint64_t v6;

  sub_1A03A7148(0, a2, v5, v6, a5);
}

uint64_t OUTLINED_FUNCTION_8_12()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char v4;
  uint64_t result;

  result = *v3;
  *v3 = v2;
  *(_QWORD *)(v1 + 80) = v0;
  *(_BYTE *)(v1 + 88) = v4;
  return result;
}

uint64_t OUTLINED_FUNCTION_8_13()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_8_14()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v0[8];
  v3 = v0[9];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v3 + 16))(v0[2], v0[3], v2, v3);
}

uint64_t OUTLINED_FUNCTION_15(void (*a1)(_QWORD))
{
  return objectdestroy_11Tm(a1, a1);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_15_1()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_1A03D5F00();
}

void OUTLINED_FUNCTION_15_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v0 + 16) = v3;
  v5 = v0 + 16 * v4;
  *(_QWORD *)(v5 + 32) = v1;
  *(_QWORD *)(v5 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_15_6()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_15_7()
{
  uint64_t v0;

  return v0 + 32;
}

_QWORD *OUTLINED_FUNCTION_15_9(_QWORD *result)
{
  uint64_t v1;

  result[2] = 25705;
  result[3] = 0xE200000000000000;
  result[4] = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_15_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_11(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;

  return sub_1A03A9DFC(a1, a2, a3, a4, a5, v5, v6);
}

void OUTLINED_FUNCTION_14_1()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_BYTE *)(a2 + 32) = 0;
  return swift_willThrow();
}

void OUTLINED_FUNCTION_44()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_14_3()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_14_4()
{
  return sub_1A03D5D50();
}

uint64_t OUTLINED_FUNCTION_14_6(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_14_8(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_14_9()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_9_4(char *a1, uint64_t a2, uint64_t a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03AD7A0(a1, v4, v5, a4);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_9_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return sub_1A03AE220(v9, (uint64_t)&a9);
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  return sub_1A03D5CB4();
}

void OUTLINED_FUNCTION_9_9(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _UNKNOWN **))
{
  sub_1A03B318C(0, a2, a3);
}

uint64_t OUTLINED_FUNCTION_9_10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for Statement(0, v5, *(_QWORD *)(v4 + 8), a4);
}

uint64_t OUTLINED_FUNCTION_9_11()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[8];
  v2 = v0[9];
  __swift_project_boxed_opaque_existential_1(v0 + 5, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t v0;

  return v0;
}

char *OUTLINED_FUNCTION_12_2@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_1A03AD374((char *)(a1 > 1), v1, 1);
}

uint64_t OUTLINED_FUNCTION_12_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return sub_1A03A60E8(a1, v4, v5, a4);
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_1A03D5A08();
}

uint64_t OUTLINED_FUNCTION_12_5(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

size_t OUTLINED_FUNCTION_12_6(const void *a1)
{
  return _swift_stdlib_malloc_size(a1);
}

uint64_t OUTLINED_FUNCTION_12_7(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return sub_1A03A4924((__n128 *)a1[3].n128_u64);
}

uint64_t OUTLINED_FUNCTION_12_9()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 65) = 4;
  return v0;
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 240) + 8))(*(_QWORD *)(v0 - 248), *(_QWORD *)(v0 - 232));
}

uint64_t OUTLINED_FUNCTION_19_1()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_19_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19_4(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_19_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_19_6()
{
  return sub_1A03ADEE4();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(&a9, v9);
}

uint64_t OUTLINED_FUNCTION_13_0(uint64_t a1, uint64_t a2)
{
  return __swift_destroy_boxed_opaque_existential_1(a2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_13_4(uint64_t a1)
{
  return sub_1A03AD83C(a1);
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return sub_1A03D5D50();
}

uint64_t OUTLINED_FUNCTION_13_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t))(a2 + 40))(v2);
}

uint64_t OUTLINED_FUNCTION_13_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A03AE220(v2, a2);
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = v1;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_QWORD *)(v2 - 160) = a1;
  *(_QWORD *)(v2 - 152) = v1 + 24;
  return sub_1A03D5A8C();
}

uint64_t OUTLINED_FUNCTION_17_2@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_17_3()
{
  return sub_1A03AE264(0, 0, 5);
}

void OUTLINED_FUNCTION_17_4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  sub_1A03B1E68(0, a2, a3);
}

uint64_t OUTLINED_FUNCTION_17_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for MixedKeyValueStore.Promises(255, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_16_1()
{
  _BYTE *v0;

  static EntityType.dataType.getter(v0);
}

uint64_t OUTLINED_FUNCTION_16_2@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;

  *v2 = a1;
  return v1;
}

uint64_t OUTLINED_FUNCTION_16_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

void OUTLINED_FUNCTION_16_5(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t OUTLINED_FUNCTION_16_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 a10)
{
  return sub_1A03A5D80(&a10, a1 + 16);
}

uint64_t OUTLINED_FUNCTION_16_8()
{
  return swift_retain();
}

void sub_1A03B1D80(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

void OUTLINED_FUNCTION_18_0()
{
  type metadata accessor for KeyValueStore.Promises();
}

uint64_t sub_1A03B1DD4()
{
  return sub_1A03D5EC4();
}

void OUTLINED_FUNCTION_18_4()
{
  sub_1A03B2574();
}

uint64_t OUTLINED_FUNCTION_18_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_18_7()
{
  return sub_1A03ADEE4();
}

void sub_1A03B1E68(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_1A03D6110();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

char *sub_1A03B1EF0(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_10();
    result = (char *)OUTLINED_FUNCTION_1_11();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_14(a3, result);
  }
  return result;
}

char *sub_1A03B1F44(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_10();
    result = (char *)OUTLINED_FUNCTION_1_11();
    __break(1u);
  }
  else if (a3 != result || &result[56 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_14(a3, result);
  }
  return result;
}

uint64_t sub_1A03B1FA0(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t v4;

  sub_1A03B1FDC(0, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_1A03B1FDC(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1A03A5FF8(255, a3);
    v4 = sub_1A03D5EC4();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_20_1()
{
  return sub_1A03D5A98();
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return sub_1A03D5C48();
}

uint64_t sub_1A03B2064(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03B2158(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1A03ACE68();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03B2274()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t dynamic_cast_existential_1_conditional(uint64_t a1)
{
  if (swift_conformsToProtocol2())
    return a1;
  else
    return 0;
}

char *sub_1A03B22B0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A03B22CC(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1A03B22CC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1A03A298C(0, (unint64_t *)&unk_1ED0CE778, (uint64_t (*)(uint64_t))sub_1A03B4D08, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A03B1EF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03B23C0((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A03B23C0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (v3 = a1 + 16 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_1A03D6050();
    __break(1u);
  }
  else
  {
    sub_1A03A298C(0, &qword_1ED0CE7A8, (uint64_t (*)(uint64_t))sub_1A03B2724, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t String.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A03B24D4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return String.valueType.getter(*v1, v1[1], a1);
}

void sub_1A03B24DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  char v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_54_1();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_42_2() || v4 > *(_QWORD *)(v2 + 24) >> 1)
  {
    OUTLINED_FUNCTION_21_5();
    v2 = v6;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_49_1();
  if (v7 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = OUTLINED_FUNCTION_48_0();
  sub_1A03C6A00(v8, v9, v10);
  if (!v3)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    *v1 = v2;
    OUTLINED_FUNCTION_26();
    return;
  }
  v11 = *(_QWORD *)(v2 + 16);
  v5 = __OFADD__(v11, v3);
  v12 = v11 + v3;
  if (!v5)
  {
    *(_QWORD *)(v2 + 16) = v12;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_1A03B2574()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_14_7();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_6_6();
  if (v1)
  {
    OUTLINED_FUNCTION_17_4(v5, &qword_1ED0CDAF8, (void (*)(uint64_t))sub_1A03B2764);
    v6 = (const void *)OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_12_6(v6);
    OUTLINED_FUNCTION_16_5(v7);
  }
  if ((v0 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_15_7();
    sub_1A03C50F8(v8, v9, v10);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_7_9();
    sub_1A03B2614(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A03B2614(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_1A03B2724();
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

unint64_t sub_1A03B2724()
{
  unint64_t result;

  result = qword_1ED0CE7A0;
  if (!qword_1ED0CE7A0)
  {
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1ED0CE7A0);
  }
  return result;
}

unint64_t sub_1A03B2764()
{
  unint64_t result;

  result = qword_1ED0CE790;
  if (!qword_1ED0CE790)
  {
    result = swift_getFunctionTypeMetadata0();
    atomic_store(result, (unint64_t *)&qword_1ED0CE790);
  }
  return result;
}

uint64_t sub_1A03B27A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = String.init(valueType:connection:)(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t String.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  if (*(_BYTE *)(a1 + 16))
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  else
  {
    v3 = sub_1A03D5CA8();
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v3;
  }
  return result;
}

void sub_1A03B2888()
{
  __asm { BR              X11 }
}

uint64_t sub_1A03B28C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1A03AE220(a1 + 32, (uint64_t)v5);
  OUTLINED_FUNCTION_5_3();
  sub_1A03D5C48();
  v1 = v6;
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v2);
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  v3 = v8;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3;
}

uint64_t String.queryValue.getter()
{
  sub_1A03B2CA0();
  sub_1A03D5EE8();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  return 39;
}

unint64_t sub_1A03B2CA0()
{
  unint64_t result;

  result = qword_1ED0CE6C8;
  if (!qword_1ED0CE6C8)
  {
    result = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1ED0CE6C8);
  }
  return result;
}

uint64_t sub_1A03B2CDC()
{
  return String.queryValue.getter();
}

uint64_t sub_1A03B2CE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for InsertCommand(0, a2, a3, a4);
  return sub_1A03AD180();
}

uint64_t type metadata accessor for InsertCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InsertCommand);
}

uint64_t sub_1A03B2D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03A298C(0, &qword_1ED0CDBD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t Date.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A03D5900();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 3;
  return result;
}

uint64_t sub_1A03B2DC8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1A03B0014(a1, a2);
  return a1;
}

uint64_t Data.valueType.getter@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 4;
  return sub_1A03AC284(a1, a2);
}

uint64_t Data.queryValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  unsigned __int8 v5;
  _QWORD *v6;
  _QWORD v7[4];

  v0 = sub_1A03D58DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[2] = 0;
  v7[3] = 0xE000000000000000;
  sub_1A03D58A0();
  result = sub_1A03D58D0();
  if ((result & 0x100) != 0)
  {
LABEL_8:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    v7[0] = 10104;
    v7[1] = 0xE200000000000000;
    swift_bridgeObjectRetain();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    return v7[0];
  }
  else
  {
    v5 = result;
    while (1)
    {
      if (qword_1ED0CE028 != -1)
        result = swift_once();
      v6 = off_1ED0CE000;
      if (*((_QWORD *)off_1ED0CE000 + 2) <= (unint64_t)(v5 >> 4))
        break;
      result = sub_1A03D5C18();
      if (v6[2] <= (unint64_t)(v5 & 0xF))
        goto LABEL_10;
      sub_1A03D5C18();
      result = sub_1A03D58D0();
      v5 = result;
      if ((result & 0x100) != 0)
        goto LABEL_8;
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03B2F74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return Data.valueType.getter(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_mutable_project_boxed_opaque_existential_1(v1 - 120, v0);
}

uint64_t OUTLINED_FUNCTION_21_1()
{
  return sub_1A03D5DF8();
}

uint64_t OUTLINED_FUNCTION_21_2@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_21_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_21_4(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

void OUTLINED_FUNCTION_21_5()
{
  sub_1A03B2574();
}

unint64_t sub_1A03B2FE0()
{
  unint64_t result;

  result = qword_1ED0CE608;
  if (!qword_1ED0CE608)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D9334, &type metadata for SQLError);
    atomic_store(result, (unint64_t *)&qword_1ED0CE608);
  }
  return result;
}

void OUTLINED_FUNCTION_22_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = 0xD000000000000014;
  *(_QWORD *)(v1 - 96) = (a1 - 32) | 0x8000000000000000;
  *(_QWORD *)(v1 - 72) = *(_QWORD *)(v1 - 224);
}

uint64_t OUTLINED_FUNCTION_22_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return sub_1A03AE220(v9, (uint64_t)&a9);
}

void OUTLINED_FUNCTION_22_3()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

_QWORD *sub_1A03B3058(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_9_9(a1, (unint64_t *)&qword_1ED0CE578, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for Column);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_9_9(v1, &qword_1ED0CE0D8, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for FastColumn);
  v2 = (_QWORD *)OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_15_9(v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1();
  v4 = v3;
  v5 = OUTLINED_FUNCTION_0();
  v6 = OUTLINED_FUNCTION_2_13(v5);
  *(_QWORD *)(v6 + 24) = v7;
  *(_QWORD *)(v6 + 32) = v4;
  return v2;
}

void sub_1A03B3124()
{
  uint64_t v0;
  char v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 v9;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_12_8();
  *(_BYTE *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  OUTLINED_FUNCTION_1_15(v1, v2, v3);
  v4 = OUTLINED_FUNCTION_11_10();
  sub_1A03B3174(v4, v5, v6);
  OUTLINED_FUNCTION_3_13();
  v7 = OUTLINED_FUNCTION_8_12();
  sub_1A03B3174(v7, v8, v9);
  OUTLINED_FUNCTION_11();
}

uint64_t sub_1A03B3174(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_1A03C0770(result, a2, a3 & 1);
  return result;
}

void sub_1A03B318C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, _UNKNOWN **))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x1E0DEA968], &protocol witness table for String);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_1A03B31E0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = LazyJSON.__allocating_init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t LazyJSON.__allocating_init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_1_7();
  LazyJSON.init(valueType:connection:)(a1, a2);
  return v4;
}

uint64_t Date.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 16) == 3)
  {
    sub_1A03D58F4();
    return __swift_destroy_boxed_opaque_existential_1(a2);
  }
  else
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03B32D4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = LazyEntity.__allocating_init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t LazyEntity.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13[2];

  if (*((_BYTE *)a1 + 16))
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  else
  {
    v3 = v2;
    v6 = *a1;
    v5 = a1[1];
    v7 = *v3;
    v3[2] = *a1;
    v3[3] = v5;
    v8 = *(_QWORD *)(v7 + 80);
    v9 = *(_QWORD *)(v7 + 88);
    OUTLINED_FUNCTION_2_17(*(_QWORD *)(v9 + 8));
    sub_1A03AE220(a2, (uint64_t)v13);
    v10 = (_QWORD *)OUTLINED_FUNCTION_0();
    v10[2] = v8;
    v10[3] = v9;
    v10[4] = v6;
    v10[5] = v5;
    sub_1A03A5D80(v13, (uint64_t)(v10 + 6));
    OUTLINED_FUNCTION_5_10();
    v11 = LazyLoader.__allocating_init(block:)((uint64_t)sub_1A03A1078, (uint64_t)v10);
    __swift_destroy_boxed_opaque_existential_1(a2);
    v3[4] = v11;
    return (uint64_t)v3;
  }
  return result;
}

void sub_1A03B3408(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_14();
}

uint64_t LazyJSON.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;

  if (*((_BYTE *)a1 + 16) == 4)
  {
    v3 = v2;
    v6 = *a1;
    v5 = a1[1];
    v7 = *v2;
    v8 = *(_QWORD *)(*v2 + 80);
    v9 = *(_QWORD *)(v7 + 88);
    v10 = *(_QWORD *)(v7 + 96);
    type metadata accessor for LazyLoader(0, v8, v9, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = v8;
    v11[3] = v9;
    v11[4] = v10;
    v11[5] = v6;
    v11[6] = v5;
    v12 = LazyLoader.__allocating_init(block:)((uint64_t)sub_1A03A0FC0, (uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1(a2);
    v3[2] = v12;
    return (uint64_t)v3;
  }
  else
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for LazyLoader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyLoader);
}

uint64_t LazyLoader.__allocating_init(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_14();
  LazyLoader.init(block:)(a1, a2);
  return v4;
}

void LazyLoader.init(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = OUTLINED_FUNCTION_7_17();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_2_24();
  v7 = v3[14];
  sub_1A03D5984();
  sub_1A03D59A8();
  OUTLINED_FUNCTION_31();
  *(_QWORD *)(v2 + v7) = OUTLINED_FUNCTION_4_20();
  v8 = (_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 104));
  *v8 = a1;
  v8[1] = a2;
  type metadata accessor for LazyLoader.LoadState(0, v3[10], v3[11], v3[12]);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_26();
}

uint64_t type metadata accessor for LazyLoader.LoadState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyLoader.LoadState);
}

uint64_t LazyEntity.__allocating_init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_0();
  LazyEntity.init(valueType:connection:)(a1, a2);
  return v4;
}

void sub_1A03B3690(uint64_t a1)
{
  Optional<A>.init(valueType:connection:)(a1);
}

void Optional<A>.init(valueType:connection:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_17_0();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_18_1();
  v6 = MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_13_0(v6, v7);
  __asm { BR              X12 }
}

void sub_1A03B3740(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  *(_QWORD *)(v4 - 96) = a1;
  *(_QWORD *)(v4 - 88) = v1;
  if ((OUTLINED_FUNCTION_1_0() & 1) != 0)
  {
    v5 = OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_4_0(v5, v3, v6);
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_6_0(v2, 1);
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t sub_1A03B3860()
{
  char *v0;
  char v1;
  uint64_t v2;

  v1 = *v0;
  type metadata accessor for Assertion();
  v2 = swift_allocObject();
  *(_BYTE *)(v2 + 16) = (v1 & 0x20) != 0;
  sub_1A03B3A5C();
  return v2;
}

uint64_t type metadata accessor for Assertion()
{
  return objc_opt_self();
}

void sub_1A03B3A5C()
{
  uint64_t v0;
  uint64_t *v1;
  os_unfair_lock_s *v2;

  if (qword_1ED0CE7D0 != -1)
    swift_once();
  v1 = (uint64_t *)(qword_1ED0CE870 + 16);
  v2 = (os_unfair_lock_s *)(qword_1ED0CE870 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED0CE870 + 24));
  sub_1A03D0004(v1, v0);
  os_unfair_lock_unlock(v2);
}

unint64_t sub_1A03B3AE0(char a1, uint64_t a2)
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
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1A03B3B94(char a1)
{
  char v1;
  uint64_t v2;

  v1 = a1 & 1;
  sub_1A03D61AC();
  sub_1A03D61B8();
  v2 = sub_1A03D61C4();
  return sub_1A03B3AE0(v1, v2);
}

id sub_1A03B3BF0()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_1A03D5BD0();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_1A03D5BD0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_attributeWithDomain_name_, v0, v1);

  return v2;
}

id sub_1A03B3C80(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)sub_1A03D5BD0();
  swift_bridgeObjectRelease();
  sub_1A03D1734(0, (unint64_t *)&unk_1ED0CE7B0);
  v6 = (void *)sub_1A03D5CCC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v3, sel_initWithExplanation_target_attributes_, v5, a3, v6);

  return v7;
}

unint64_t sub_1A03B3D24()
{
  unint64_t result;

  result = qword_1ED0CE7F0;
  if (!qword_1ED0CE7F0)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Assertion.Name, &type metadata for Assertion.Name);
    atomic_store(result, (unint64_t *)&qword_1ED0CE7F0);
  }
  return result;
}

void static Column.createTableChain(for:ifNotExists:shouldVersion:)()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(v0 + 88) + 24) + 24))();
  OUTLINED_FUNCTION_14();
}

uint64_t Int.queryValue.getter()
{
  return sub_1A03D6104();
}

uint64_t sub_1A03B3DC8()
{
  return Int.queryValue.getter();
}

unint64_t sub_1A03B3DD0()
{
  unint64_t result;

  result = qword_1ED0CE0E0[0];
  if (!qword_1ED0CE0E0[0])
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, qword_1ED0CE0E0);
  }
  return result;
}

uint64_t sub_1A03B3E24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x10)
    v3 = 16;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return swift_release();
    else
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_1A03B3E6C + 4 * byte_1A03D794D[v5]))();
  }
}

uint64_t sub_1A03B3EC4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03B3FB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = Data.init(valueType:connection:)(a1, a2);
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t Data.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  if (*(_BYTE *)(a1 + 16) == 4)
  {
    sub_1A03B4080(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
    v4 = v3;
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v4;
  }
  else
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  return result;
}

void sub_1A03B4080(uint64_t a1, uint64_t a2)
{
  char *v2;
  _QWORD v3[5];

  v3[3] = MEMORY[0x1E0CB0338];
  v3[4] = MEMORY[0x1E0CB0318];
  v3[0] = a1;
  v3[1] = a2;
  v2 = (char *)&loc_1A03B40D4
     + dword_1A03BB95C[__swift_project_boxed_opaque_existential_1(v3, MEMORY[0x1E0CB0338])[1] >> 62];
  __asm { BR              X10 }
}

uint64_t sub_1A03B40E4()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  sub_1A03AC284(v1, v0);
  sub_1A03BBAD8(BYTE6(v2), &v5);
  sub_1A03B0014(v1, v0);
  v3 = v5;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v6);
  return v3;
}

uint64_t sub_1A03B4210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  result = sub_1A03D5804();
  v7 = result;
  if (result)
  {
    result = sub_1A03D581C();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v7 += a1 - result;
  }
  v8 = __OFSUB__(a2, a1);
  v9 = a2 - a1;
  if (v8)
  {
    __break(1u);
    goto LABEL_13;
  }
  v10 = sub_1A03D5810();
  if (v10 >= v9)
    v11 = v9;
  else
    v11 = v10;
  v12 = v7 + v11;
  if (v7)
    v13 = v12;
  else
    v13 = 0;
  return sub_1A03B42A0(v7, v13, a3);
}

uint64_t sub_1A03B42A0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
    result = sub_1A03D5870();
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = MEMORY[0x1A1AF8E08]();
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = MEMORY[0x1A1AF8E14]();
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

void sub_1A03B4314()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CE6E0)
  {
    sub_1A03B4ECC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CE6E0);
  }
}

void sub_1A03B4380()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CDFD8)
  {
    sub_1A03ACECC();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CDFD8);
  }
}

unint64_t sub_1A03B43E8()
{
  unint64_t result;

  result = qword_1ED0CDBB0;
  if (!qword_1ED0CDBB0)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Data, MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED0CDBB0);
  }
  return result;
}

uint64_t sub_1A03B4424@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result;

  result = Int.init(valueType:connection:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t Int.init(valueType:connection:)(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (*((_BYTE *)a1 + 16) == 1)
  {
    v2 = *a1;
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v2;
  }
  else
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for ValueOf(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_1A03D5918();
}

void OUTLINED_FUNCTION_37()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_29_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t dispatch thunk of Table.delete.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

void sub_1A03B454C()
{
  sub_1A03AB874((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for Delete);
}

uint64_t sub_1A03B4560()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t storeEnumTagSinglePayload for OrderBy(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for OrderBy()
{
  return &type metadata for OrderBy;
}

ValueMetadata *type metadata accessor for Expression()
{
  return &type metadata for Expression;
}

ValueMetadata *type metadata accessor for AssertionOptions()
{
  return &type metadata for AssertionOptions;
}

uint64_t sub_1A03B45E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A03B4610()
{
  unint64_t result;

  result = qword_1ED0CE618;
  if (!qword_1ED0CE618)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D8098, &type metadata for Versions.Entity);
    atomic_store(result, (unint64_t *)&qword_1ED0CE618);
  }
  return result;
}

unint64_t sub_1A03B464C()
{
  unint64_t result;

  result = qword_1ED0CE610;
  if (!qword_1ED0CE610)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D8070, &type metadata for Versions.Entity);
    atomic_store(result, (unint64_t *)&qword_1ED0CE610);
  }
  return result;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1A03B4694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D6A48, (uint64_t)&unk_1A03D6A20);
}

uint64_t sub_1A03B46A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D6A9C, (uint64_t)&unk_1A03D6A80);
}

uint64_t sub_1A03B46BC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A03B46C4()
{
  return swift_allocateGenericValueMetadata();
}

ValueMetadata *type metadata accessor for Transaction()
{
  return &type metadata for Transaction;
}

uint64_t dispatch thunk of Table.query.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

void sub_1A03B46E8(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

BOOL sub_1A03B46F0(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

uint64_t sub_1A03B471C(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

void type metadata accessor for Database.Location()
{
  OUTLINED_FUNCTION_18_2();
}

_BYTE *sub_1A03B4740(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for Database.RecoveryMode()
{
  OUTLINED_FUNCTION_18_2();
}

uint64_t dispatch thunk of Table.querySome<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_1A03B4764()
{
  return sub_1A03D5EF4();
}

BOOL sub_1A03B4780(_QWORD *a1, uint64_t *a2)
{
  return sub_1A03B46F0(a1, *a2);
}

ValueMetadata *type metadata accessor for Assertion.Name()
{
  return &type metadata for Assertion.Name;
}

uint64_t *sub_1A03B4798(uint64_t *result, uint64_t a2)
{
  *result = *result & 0xFFFFFFFFFFFFFF8 | (a2 << 60);
  return result;
}

void static AssertionOptions.write.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_20(a1);
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

_BYTE *sub_1A03B47CC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void sub_1A03B47D4(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t sub_1A03B489C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = AssertionOptions.rawValue.getter();
  *a1 = result;
  return result;
}

uint64_t AssertionOptions.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
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

uint64_t LazyEntity.loader.getter()
{
  return swift_retain();
}

uint64_t type metadata accessor for FastColumn(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FastColumn);
}

uint64_t sub_1A03B490C(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

uint64_t sub_1A03B491C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

TeaDB::AssertionOptions sub_1A03B494C(Swift::Int *a1)
{
  return AssertionOptions.init(rawValue:)(*a1);
}

uint64_t sub_1A03B4954(uint64_t *a1)
{
  return sub_1A03B490C(*a1);
}

void static AssertionOptions.immediate.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_20(a1);
}

TeaDB::AssertionOptions __swiftcall AssertionOptions.init(rawValue:)(TeaDB::AssertionOptions rawValue)
{
  TeaDB::AssertionOptions *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

_QWORD *sub_1A03B496C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

_QWORD *static AssertionOptions.all.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A03B496C(&qword_1ED0CE7D8, &qword_1ED0CE810, a1);
}

unint64_t sub_1A03B49C8(unint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t result;
  unint64_t v9;
  uint64_t i;
  uint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unsigned int v15;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unint64_t v22;
  uint64_t v23;

  v4 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v4 = a1;
  v5 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v5 = 11;
  v6 = v5 | (v4 << 16);
  v7 = sub_1A03B4C04(0xFuLL, a1, a2);
  result = sub_1A03B4C04(v6, a1, a2);
  v9 = result >> 14;
  if (v7 >> 14 < result >> 14)
  {
    for (i = 0; ; ++i)
    {
      v11 = i + 1;
      if (__OFADD__(i, 1))
        break;
      if ((a2 & 0x1000000000000000) != 0)
      {
        result = sub_1A03D5C00();
        v7 = result;
      }
      else
      {
        v12 = v7 >> 16;
        if ((a2 & 0x2000000000000000) != 0)
        {
          v22 = a1;
          v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          v13 = *((unsigned __int8 *)&v22 + v12);
        }
        else
        {
          result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0)
            result = sub_1A03D5F6C();
          v13 = *(unsigned __int8 *)(result + v12);
        }
        v14 = (char)v13;
        v15 = __clz(v13 ^ 0xFF) - 24;
        if (v14 >= 0)
          LOBYTE(v15) = 1;
        v7 = ((v12 + v15) << 16) | 5;
      }
      if (v9 <= v7 >> 14)
        return v11;
    }
    __break(1u);
LABEL_42:
    __break(1u);
    return result;
  }
  if (v9 < v7 >> 14)
  {
    v11 = 0;
    while (!__OFSUB__(v11--, 1))
    {
      if ((a2 & 0x1000000000000000) != 0)
      {
        result = sub_1A03D5C0C();
        v7 = result;
      }
      else
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          v22 = a1;
          v23 = a2 & 0xFFFFFFFFFFFFFFLL;
          if ((*((_BYTE *)&v22 + (v7 >> 16) - 1) & 0xC0) == 0x80)
          {
            v20 = 0;
            do
              v21 = *((_BYTE *)&v22 + (v7 >> 16) + v20-- - 2) & 0xC0;
            while (v21 == 128);
            v19 = 1 - v20;
          }
          else
          {
            v19 = 1;
          }
        }
        else
        {
          result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((a1 & 0x1000000000000000) == 0)
            result = sub_1A03D5F6C();
          v17 = 0;
          do
            v18 = *(_BYTE *)(result + (v7 >> 16) - 1 + v17--) & 0xC0;
          while (v18 == 128);
          v19 = -v17;
        }
        v7 = (v7 - (v19 << 16)) & 0xFFFFFFFFFFFF0000 | 5;
      }
      if (v9 >= v7 >> 14)
        return v11;
    }
    goto LABEL_42;
  }
  return 0;
}

unint64_t sub_1A03B4C04(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_1A03BBA6C(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_1A03BB974(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

uint64_t LazyJSON.loader.getter()
{
  return swift_retain();
}

uint64_t destroy for OrderBy()
{
  return sub_1A03AB468();
}

uint64_t sub_1A03B4CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A03A4AD8(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03A4B10);
}

uint64_t objectdestroy_11Tm(void (*a1)(_QWORD), void (*a2)(_QWORD))
{
  uint64_t v2;

  a1(*(_QWORD *)(v2 + 16));
  a2(*(_QWORD *)(v2 + 24));
  return swift_deallocObject();
}

void sub_1A03B4D08(uint64_t a1)
{
  sub_1A03A298C(a1, &qword_1ED0CE798, (uint64_t (*)(uint64_t))sub_1A03B2764, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
}

char *sub_1A03B4D24(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A039DE5C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void *sub_1A03B4D40(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[4 * a2] <= __src || &__src[4 * a2] <= __dst))
    return memcpy(__dst, __src, 4 * a2);
  result = (void *)sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t Bool.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (*(_BYTE *)(a1 + 16) == 2)
  {
    v2 = *(_DWORD *)a1 & 1;
    __swift_destroy_boxed_opaque_existential_1(a2);
    return v2;
  }
  else
  {
    result = sub_1A03D6038();
    __break(1u);
  }
  return result;
}

void static Bool.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_1A03B4EA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = Bool.init(valueType:connection:)(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_1A03B4ECC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE6F0)
  {
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE6F0);
  }
}

uint64_t dispatch thunk of QuerySome.where(_:orderBy:limit:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v4 + 144))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of QuerySome.all()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

unint64_t sub_1A03B4F54()
{
  unint64_t result;

  result = qword_1ED0CE7F8;
  if (!qword_1ED0CE7F8)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Assertion.Name, &type metadata for Assertion.Name);
    atomic_store(result, (unint64_t *)&qword_1ED0CE7F8);
  }
  return result;
}

uint64_t sub_1A03B4F90(uint64_t a1)
{
  return sub_1A03CEAFC(a1, sub_1A03D140C, &qword_1ED0CE870);
}

unint64_t sub_1A03B4FA4()
{
  unint64_t result;

  result = qword_1ED0CE628;
  if (!qword_1ED0CE628)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D80C0, &type metadata for Versions.Entity);
    atomic_store(result, (unint64_t *)&qword_1ED0CE628);
  }
  return result;
}

unint64_t sub_1A03B4FE0()
{
  unint64_t result;

  result = qword_1ED0CE620;
  if (!qword_1ED0CE620)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D80F8, &type metadata for Versions.Entity);
    atomic_store(result, (unint64_t *)&qword_1ED0CE620);
  }
  return result;
}

uint64_t sub_1A03B501C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A03B45E0(a1, a2, a3, (uint64_t (*)(void))sub_1A03B4610, (uint64_t (*)(void))sub_1A03B464C);
}

uint64_t sub_1A03B5030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A03B45E0(a1, a2, a3, (uint64_t (*)(void))sub_1A03AA4D0, (uint64_t (*)(void))sub_1A03B4FA4);
}

uint64_t type metadata accessor for LazyJSON(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyJSON);
}

uint64_t Database.__deallocating_deinit()
{
  Database.deinit();
  return swift_deallocClassInstance();
}

void type metadata accessor for Database.CacheSize()
{
  OUTLINED_FUNCTION_18_2();
}

uint64_t sub_1A03B5084()
{
  uint64_t v0;

  return sub_1A03B509C(*(sqlite3 **)(v0 + 16));
}

uint64_t sub_1A03B509C(sqlite3 *a1)
{
  unsigned int v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = sqlite3_close(a1);
  v2 = sub_1A03AE798(v1);
  v4 = v3;
  v6 = v5;
  if ((sub_1A03AED70(v2, v3, v5) & 1) != 0)
    return sub_1A03AE590(v2, v4, v6);
  if (v6 != 29 || __PAIR128__(v4, v2) >= 3)
  {
    if (qword_1ED0CE030 != -1)
      swift_once();
    v8 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    sub_1A03A00AC();
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_1A03D6810;
    sub_1A03D6008();
    v10 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEA968];
    v11 = sub_1A03A0110();
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 40) = 0xE000000000000000;
    *(_QWORD *)(v9 + 96) = v10;
    *(_QWORD *)(v9 + 104) = v11;
    *(_QWORD *)(v9 + 64) = v11;
    *(_QWORD *)(v9 + 72) = 0x65736F6C63;
    *(_QWORD *)(v9 + 80) = 0xE500000000000000;
    sub_1A03D5A2C();

    swift_bridgeObjectRelease();
  }
  sub_1A03B2FE0();
  swift_allocError();
  *(_QWORD *)v12 = v2;
  *(_QWORD *)(v12 + 8) = v4;
  *(_BYTE *)(v12 + 16) = v6;
  return swift_willThrow();
}

void type metadata accessor for Database.JournalingMode()
{
  OUTLINED_FUNCTION_18_2();
}

void type metadata accessor for Database.VacuumMode()
{
  OUTLINED_FUNCTION_18_2();
}

TeaDB::ValueOf __swiftcall ValueOf.init(_:)(TeaDB::ValueOf result)
{
  TeaDB::ValueOf *v1;

  *v1 = result;
  return result;
}

uint64_t destroy for ValueOf()
{
  return swift_bridgeObjectRelease();
}

ValueMetadata *type metadata accessor for ValueOf()
{
  return &type metadata for ValueOf;
}

uint64_t ValueOf.queryValue.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A03B52DC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

uint64_t dispatch thunk of Create.table(ifNotExists:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of Column.value.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t Table.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of Table.create.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of Table.save.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_1A03B534C()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for Store()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t dispatch thunk of Query.where(_:orderBy:limit:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v4 + 128))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of Query.all(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t sub_1A03B53E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  char v19;
  uint64_t v20;
  char v21;

  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  OUTLINED_FUNCTION_0_8(a1, a2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v4 + 88) + 24), a4);
  v21 = 4;
  v20 = 0xF000000000000007;
  *(_QWORD *)&v18 = v6;
  *((_QWORD *)&v18 + 1) = v7;
  v19 = v8;
  v9 = OUTLINED_FUNCTION_1_5(&v20, (uint64_t)&v18);
  OUTLINED_FUNCTION_3_4(v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_8_4(v13, (uint64_t)&v18);
  v16 = OUTLINED_FUNCTION_5_4(&v21, v14, v15, &v18);
  OUTLINED_FUNCTION_7_5(v16);
  OUTLINED_FUNCTION_4_5();
  return v5;
}

uint64_t dispatch thunk of Query.all()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of Save.entity(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_1A03B54C4()
{
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for JSON<A>);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03B54E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for JSON<A>, a4);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03B5508(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for JSON<A>);
  result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for JSON<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A03B5550@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return JSON.init(valueType:connection:)(a1, a2, *(_QWORD *)(a3 + 16), a4);
}

uint64_t sub_1A03B555C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1A03B556C()
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

uint64_t JSON.value.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2);
}

uint64_t JSON.init(value:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t type metadata accessor for MixedKeyValueStore(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MixedKeyValueStore);
}

unint64_t sub_1A03B5624()
{
  unint64_t result;

  result = qword_1ED0CE820;
  if (!qword_1ED0CE820)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for AssertionOptions, &type metadata for AssertionOptions);
    atomic_store(result, (unint64_t *)&qword_1ED0CE820);
  }
  return result;
}

unint64_t sub_1A03B5660()
{
  unint64_t result;

  result = qword_1ED0CE7E0;
  if (!qword_1ED0CE7E0)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for AssertionOptions, &type metadata for AssertionOptions);
    atomic_store(result, (unint64_t *)&qword_1ED0CE7E0);
  }
  return result;
}

unint64_t sub_1A03B569C()
{
  unint64_t result;

  result = qword_1ED0CE7C0;
  if (!qword_1ED0CE7C0)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for AssertionOptions, &type metadata for AssertionOptions);
    atomic_store(result, (unint64_t *)&qword_1ED0CE7C0);
  }
  return result;
}

unint64_t sub_1A03B56D8()
{
  unint64_t result;

  result = qword_1ED0CE818;
  if (!qword_1ED0CE818)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for AssertionOptions, &type metadata for AssertionOptions);
    atomic_store(result, (unint64_t *)&qword_1ED0CE818);
  }
  return result;
}

void sub_1A03B5714()
{
  qword_1ED0CDB00 = 28;
}

void static AssertionOptions.close.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_20(a1);
}

void static AssertionOptions.read.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_20(a1);
}

void sub_1A03B5758()
{
  qword_1ED0CE810 = 30;
}

void type metadata accessor for KeyValueStore()
{
  JUMPOUT(0x1A1AF9B88);
}

void static KeyValueStore.+= infix(_:_:)()
{
  KeyValueStore.write(_:)();
}

uint64_t sub_1A03B5800()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for LazyEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyEntity);
}

uint64_t sub_1A03B5858()
{
  return swift_deallocClassInstance();
}

unint64_t sub_1A03B586C()
{
  unint64_t result;

  result = qword_1ED0CE040;
  if (!qword_1ED0CE040)
  {
    result = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0CB0378], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED0CE040);
  }
  return result;
}

unint64_t sub_1A03B58A8()
{
  unint64_t result;

  result = qword_1ED0CE038;
  if (!qword_1ED0CE038)
  {
    result = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0CB0350], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1ED0CE038);
  }
  return result;
}

void *sub_1A03B58E4()
{
  void *result;

  result = (void *)sub_1A03BB650(0xD000000000000010, 0x80000001A03D9900);
  off_1ED0CE000 = result;
  return result;
}

unint64_t sub_1A03B5930(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A03B586C();
  result = sub_1A03B58A8();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t tdb_truncate_db()
{
  return _sqlite3_db_truncate();
}

void KeyValueStore.__allocating_init(database:)()
{
  OUTLINED_FUNCTION_0();
  KeyValueStore.init(database:)();
}

uint64_t sub_1A03B5998()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1A03B59AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A03B59D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t result;
  id v19;
  id v20;
  _QWORD *v21;
  void *v22;
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v25 = a6;
  v11 = sub_1A03D5A80();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1A03D5A98();
  v26 = *(_QWORD *)(v15 - 8);
  v27 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v19 = *(id *)(result + 56);
    v24 = v12;
    v20 = v19;
    swift_release();
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = a2;
    v21[3] = a3;
    v21[4] = a4;
    v21[5] = a5;
    v21[6] = v25;
    v21[7] = a1;
    aBlock[4] = sub_1A03B8758;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A03BCDB4;
    aBlock[3] = &block_descriptor_49;
    v22 = _Block_copy(aBlock);
    swift_retain();
    sub_1A03D5A8C();
    v28 = MEMORY[0x1E0DEE9D8];
    v23 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1A03ABC90(&qword_1ED0CE6C0, (void (*)(uint64_t))MEMORY[0x1E0DEF4F8]);
    sub_1A03A298C(0, &qword_1ED0CE708, v23, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v23);
    sub_1A03D5F00();
    MEMORY[0x1A1AF93B4](0, v17, v14, v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v14, v11);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v17, v27);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A03B5C28()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03B5C4C()
{
  return sub_1A03B8764(sub_1A03B59D0);
}

uint64_t sub_1A03B5C58()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    type metadata accessor for KVSEntry();
  }
  return result;
}

void sub_1A03B5E64()
{
  sub_1A03D5D50();
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03B5E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  if (qword_1ED0CE030 != -1)
    swift_once();
  v6 = (id)qword_1ED0D0000;
  sub_1A03D5DD4();
  sub_1A03A00AC();
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A03D6810;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 8))(a2, a4);
  v10 = v9;
  v11 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v7 + 56) = MEMORY[0x1E0DEA968];
  v12 = sub_1A03A0110();
  *(_QWORD *)(v7 + 64) = v12;
  *(_QWORD *)(v7 + 32) = v8;
  *(_QWORD *)(v7 + 40) = v10;
  sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
  sub_1A03D6008();
  *(_QWORD *)(v7 + 96) = v11;
  *(_QWORD *)(v7 + 104) = v12;
  *(_QWORD *)(v7 + 72) = 0;
  *(_QWORD *)(v7 + 80) = 0xE000000000000000;
  sub_1A03D5A2C();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03B5FEC()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_1A03B5FF8(uint64_t a1)
{
  uint64_t *v1;

  return sub_1A03B5E8C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_1A03B6008@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v3 = *a1;
  v4 = (_QWORD *)(*a1 + 24);
  swift_beginAccess();
  result = *(_QWORD *)(v3 + 32);
  if (result)
  {
    *a2 = *v4;
    a2[1] = result;
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03B6070()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CDDC0)
  {
    sub_1A03D5918();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CDDC0);
  }
}

void sub_1A03B60D4()
{
  sub_1A03ABC90(&qword_1ED0CDBD0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
}

uint64_t sub_1A03B60F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03B85C8(0, qword_1ED0CDDC8, (uint64_t (*)(void))sub_1A03B60D4, MEMORY[0x1E0DEA4B0]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A03B614C(uint64_t a1)
{
  uint64_t v2;

  sub_1A03B85C8(0, qword_1ED0CDDC8, (uint64_t (*)(void))sub_1A03B60D4, MEMORY[0x1E0DEA4B0]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A03B61A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  uint64_t v15;

  v2 = v1;
  v4 = MEMORY[0x1E0DEA4B0];
  sub_1A03B85C8(0, qword_1ED0CDDC8, (uint64_t (*)(void))sub_1A03B60D4, MEMORY[0x1E0DEA4B0]);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v15 - v6;
  v8 = sub_1A03D5918();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03B60D4();
  v12 = sub_1A03D5BAC();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
  sub_1A03B86D0(v2, (uint64_t)v7, (uint64_t)qword_1ED0CDDC8, (uint64_t)sub_1A03B60D4, v4, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_1A03B85C8);
  if ((v12 & 1) != 0)
    v13 = sub_1A03D5BB8();
  else
    v13 = 0;
  sub_1A03B614C((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13 & 1;
}

uint64_t sub_1A03B630C(uint64_t a1)
{
  uint64_t (*v2)(void);
  uint64_t (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  char v10;
  uint64_t v11;

  v2 = MEMORY[0x1E0CB0870];
  v3 = MEMORY[0x1E0DEB940];
  sub_1A03A298C(0, &qword_1ED0CDBD8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v11 - v5;
  v7 = *(_QWORD *)(a1 + 8) + *(_QWORD *)(**(_QWORD **)(a1 + 8) + 104);
  swift_beginAccess();
  sub_1A03B86D0(v7, (uint64_t)v6, (uint64_t)&qword_1ED0CDBD8, (uint64_t)v2, (uint64_t)v3, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t))sub_1A03A298C);
  v8 = sub_1A03D5918();
  result = __swift_getEnumTagSinglePayload((uint64_t)v6, 1, v8);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v10 = sub_1A03B61A0((uint64_t)v6);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v6, v8);
    return v10 & 1;
  }
  return result;
}

uint64_t sub_1A03B643C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v3 = *a1;
  result = sub_1A03C8B60(&v7);
  v5 = v8;
  if (v8 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    v6 = v7;
    sub_1A03B6644(v8, a2);
    sub_1A03B2DC8(v6, v5);
    return __swift_storeEnumTagSinglePayload(a2, 0, 1, *(_QWORD *)(v3 + 88));
  }
  return result;
}

void sub_1A03B6644(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t **v2;
  uint64_t *v5;
  void *v6;

  v5 = *v2;
  v6 = (void *)MEMORY[0x1A1AF9810]();
  sub_1A03B7468(a1, v5[10], v5[11], v5[12], v5[13], v5[14], a2);
  objc_autoreleasePoolPop(v6);
}

uint64_t sub_1A03B66B8(uint64_t a1, uint64_t *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;

  v3 = v2;
  v5 = *a2;
  swift_beginAccess();
  v6 = *(_QWORD *)(a1 + 16);
  v8 = type metadata accessor for KVSEntity(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 96), v7);
  swift_bridgeObjectRetain();
  v12 = sub_1A03D5CE4();
  if (v12 == MEMORY[0x1A1AF92C4](v6, v8))
    return swift_bridgeObjectRelease();
  while (1)
  {
    v9 = sub_1A03D5D20();
    sub_1A03D5D08();
    if ((v9 & 1) == 0)
      break;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    MEMORY[0x1A1AF92D0](&v12, v6, v8);
    swift_bridgeObjectRelease();
    sub_1A03B454C();
    sub_1A03C46FC();
    if (v3)
    {

      v3 = 0;
    }
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    v10 = v12;
    if (v10 == MEMORY[0x1A1AF92C4](v6, v8))
      return swift_bridgeObjectRelease();
  }
  result = sub_1A03D5F48();
  __break(1u);
  return result;
}

uint64_t sub_1A03B6864()
{
  return OUTLINED_FUNCTION_15((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1A03B6870()
{
  uint64_t v0;

  return sub_1A03B66B8(*(_QWORD *)(v0 + 16), *(uint64_t **)(v0 + 24));
}

uint64_t sub_1A03B6888()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A03B68AC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03B68D0()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_1A03B68DC()
{
  return OUTLINED_FUNCTION_15((void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t KeyValueStore.delete(_:)(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t result;
  uint64_t v8;
  _QWORD v9[6];

  v3 = *(NSObject **)(v1 + 56);
  v4 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = a1;
  v5 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v5 + 16) = sub_1A03B6AFC;
  *(_QWORD *)(v5 + 24) = v4;
  v9[4] = sub_1A03B8A34;
  v9[5] = v5;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = sub_1A039E880;
  v9[3] = &block_descriptor_37;
  v6 = _Block_copy(v9);
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_30();
  swift_retain();
  swift_release();
  dispatch_sync(v3, v6);
  _Block_release(v6);
  LOBYTE(v3) = OUTLINED_FUNCTION_28();
  result = OUTLINED_FUNCTION_16();
  if ((v3 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v8 + 16) = a1;
    *(_QWORD *)(v8 + 24) = v1;
    LOBYTE(v9[0]) = 0;
    swift_retain();
    OUTLINED_FUNCTION_30();
    Database.asyncWrite(_:block:)(v9, (uint64_t)sub_1A03B6BD4, v8);
    swift_release();
    OUTLINED_FUNCTION_16();
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_20_0();
    return a1;
  }
  return result;
}

void sub_1A03B6A5C()
{
  swift_beginAccess();
  type metadata accessor for KVSEntry();
}

uint64_t sub_1A03B6AAC()
{
  sub_1A03D59D8();
  return swift_endAccess();
}

uint64_t sub_1A03B6AE8()
{
  return objectdestroy_11Tm((void (*)(_QWORD))MEMORY[0x1E0DEEE30], (void (*)(_QWORD))MEMORY[0x1E0DEEB08]);
}

void sub_1A03B6AFC()
{
  sub_1A03B6A5C();
}

uint64_t sub_1A03B6B04()
{
  return OUTLINED_FUNCTION_5();
}

uint64_t sub_1A03B6B10(uint64_t result)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v1;
  v3 = *(_QWORD *)(result + 16);
  if (v3)
  {
    v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      sub_1A03B454C();
      swift_bridgeObjectRetain();
      sub_1A03C480C(v6, v5, v7, v8);
      if (v2)
      {

        v2 = 0;
      }
      v4 += 2;
      swift_release();
      swift_bridgeObjectRelease();
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A03B6BC0()
{
  return objectdestroy_11Tm((void (*)(_QWORD))MEMORY[0x1E0DEEB08], (void (*)(_QWORD))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1A03B6BD4()
{
  uint64_t v0;

  return sub_1A03B6B10(*(_QWORD *)(v0 + 16));
}

void sub_1A03B6BEC(uint64_t a1, uint64_t *a2)
{
  KeyValueStore.subscript.getter(*a2, a2[1]);
}

uint64_t sub_1A03B6C10(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = sub_1A03D5EC4();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v12 - v6;
  v9 = *a3;
  v8 = a3[1];
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v6, a1);
  swift_bridgeObjectRetain();
  return KeyValueStore.subscript.setter((uint64_t)v7, v9, v8);
}

uint64_t KeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD v22[2];

  v7 = *(_QWORD *)(*(_QWORD *)v3 + 88);
  v8 = sub_1A03D5EC4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v22 - v11;
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v10);
  v15 = (char *)v22 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) != 1)
  {
    v22[0] = a1;
    OUTLINED_FUNCTION_39((uint64_t)v15, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 32));
    v18 = OUTLINED_FUNCTION_42();
    sub_1A03D6110();
    swift_allocObject();
    sub_1A03D5CFC();
    v20 = (uint64_t)v19 + *(int *)(v18 + 48);
    *v19 = a2;
    v19[1] = a3;
    OUTLINED_FUNCTION_39(v20, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v13 + 16));
    sub_1A03D5D50();
    sub_1A03D5B10();
    KeyValueStore.write(_:)();
  }
  v16 = *(void (**)(char *, uint64_t))(v9 + 8);
  v16(v12, v8);
  sub_1A03B1D80(0, (unint64_t *)&qword_1ED0CE768, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v17 = OUTLINED_FUNCTION_32();
  *(_OWORD *)(v17 + 16) = xmmword_1A03D6820;
  *(_QWORD *)(v17 + 32) = a2;
  *(_QWORD *)(v17 + 40) = a3;
  KeyValueStore.delete(_:)(v17);
  swift_bridgeObjectRelease_n();
  return ((uint64_t (*)(uint64_t, uint64_t))v16)(a1, v8);
}

void KeyValueStore.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;

  v7 = malloc(0x38uLL);
  *a1 = v7;
  v7[1] = a3;
  v7[2] = v3;
  *v7 = a2;
  v8 = OUTLINED_FUNCTION_35();
  v7[3] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[4] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[5] = malloc(v10);
  v7[6] = malloc(v10);
  KeyValueStore.subscript.getter(a2, a3);
  OUTLINED_FUNCTION_26();
}

void sub_1A03B6F88(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  v3 = (void *)(*a1)[5];
  v4 = (void *)(*a1)[6];
  if ((a2 & 1) != 0)
  {
    v5 = v2[3];
    v6 = v2[4];
    v7 = v2[1];
    v8 = *v2;
    OUTLINED_FUNCTION_39((*a1)[5], (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    swift_bridgeObjectRetain();
    KeyValueStore.subscript.setter((uint64_t)v3, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v9 = v2[1];
    v10 = *v2;
    swift_bridgeObjectRetain();
    KeyValueStore.subscript.setter((uint64_t)v4, v10, v9);
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t KeyValueStore.Promises.delete(_:)()
{
  sub_1A039E5BC();
  OUTLINED_FUNCTION_31();
  return sub_1A03D5A08();
}

uint64_t sub_1A03B7094(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v9;

  result = swift_weakLoadStrong();
  if (result)
  {
    KeyValueStore.delete(_:)(a6);
    swift_release();
    v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void KeyValueStore.readAsync(_:maxAge:)()
{
  OUTLINED_FUNCTION_1();
  type metadata accessor for KeyValueStore.Promises();
}

uint64_t sub_1A03B714C()
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
  uint64_t result;
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
  char v20;

  v1 = OUTLINED_FUNCTION_24_0();
  result = OUTLINED_FUNCTION_2_0(v1, v2, v3, v4, v5, v6, v7, v8, v18);
  if ((v20 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v10 = KeyValueStore.Promises.read(_:maxAge:)();
    OUTLINED_FUNCTION_13(v10, v11, v12, v13, v14, v15, v16, v17, v19);
    return v0;
  }
  return result;
}

void KeyValueStore.writeAsync(_:)()
{
  sub_1A03B71AC();
}

void KeyValueStore.deleteAsync(_:)()
{
  sub_1A03B71AC();
}

void sub_1A03B71AC()
{
  OUTLINED_FUNCTION_1();
  type metadata accessor for KeyValueStore.Promises();
}

#error "1A03B71FC: call analysis failed (funcsize=21)"

void KeyValueStore.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  type metadata accessor for KeyValueStore.Promises();
}

uint64_t sub_1A03B72A8()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t);

  OUTLINED_FUNCTION_35();
  v1 = OUTLINED_FUNCTION_36();
  v2(v1);
  return v0;
}

void KeyValueStore.__deallocating_deinit()
{
  KeyValueStore.deinit();
}

uint64_t sub_1A03B72DC()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1A03B72F0()
{
  return sub_1A03D61B8();
}

uint64_t sub_1A03B7314()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

void sub_1A03B7354()
{
  KeyValueStore.readAsync(_:)();
}

void sub_1A03B7374()
{
  KeyValueStore.readAsync(_:maxAge:)();
}

void sub_1A03B7394()
{
  KeyValueStore.writeAsync(_:)();
}

void sub_1A03B73B4()
{
  KeyValueStore.deleteAsync(_:)();
}

uint64_t sub_1A03B73D4()
{
  return sub_1A03A63E8();
}

uint64_t sub_1A03B73E8()
{
  return sub_1A03B7314();
}

uint64_t sub_1A03B73FC()
{
  return sub_1A03B72F0();
}

uint64_t sub_1A03B7410()
{
  sub_1A03D61AC();
  sub_1A03B72F0();
  return sub_1A03D61C4();
}

uint64_t sub_1A03B7468@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t v30;

  v19 = a4;
  v20 = a6;
  v22 = a2;
  v23 = a1;
  v21 = a7;
  v9 = sub_1A03D5EC4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - v11;
  sub_1A03D5960();
  swift_allocObject();
  sub_1A03D5954();
  v13 = sub_1A03D5B64();
  v29[0] = MEMORY[0x1E0DEA9A0];
  v29[1] = a5;
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEA0D8], v13, v29);
  v14 = v30;
  sub_1A03D5948();
  result = swift_release();
  if (!v14)
  {
    v16 = v21;
    v17 = v22;
    v30 = a5;
    v18 = v24;
    v24 = 118;
    v25 = 0xE100000000000000;
    MEMORY[0x1A1AF90FC](&v24, v18, MEMORY[0x1E0DEA968], a3, MEMORY[0x1E0DEA978]);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      v24 = v17;
      v25 = a3;
      v26 = v19;
      v27 = v30;
      v28 = v20;
      type metadata accessor for KeyValueStore.TranslationError();
    }
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(v16, v12, a3);
  }
  return result;
}

BOOL sub_1A03B7674(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_1A03B7684()
{
  return sub_1A03D61B8();
}

uint64_t sub_1A03B76A8(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  BOOL v6;
  char v8;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A03D6134() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x4164657461647075 && a2 == 0xE900000000000074;
    if (v6 || (sub_1A03D6134() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0x6F734A65756C6176 && a2 == 0xE90000000000006ELL)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v8 = sub_1A03D6134();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1A03B77EC()
{
  return 3;
}

uint64_t sub_1A03B77F4()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

uint64_t sub_1A03B7838()
{
  return 0;
}

uint64_t sub_1A03B7844(char a1)
{
  if (!a1)
    return 25705;
  if (a1 == 1)
    return 0x4164657461647075;
  return 0x6F734A65756C6176;
}

BOOL sub_1A03B789C(char *a1, char *a2)
{
  return sub_1A03B7674(*a1, *a2);
}

uint64_t sub_1A03B78B0()
{
  return sub_1A03B77F4();
}

uint64_t sub_1A03B78BC()
{
  return sub_1A03B7684();
}

uint64_t sub_1A03B78C8()
{
  sub_1A03D61AC();
  sub_1A03B7684();
  return sub_1A03D61C4();
}

uint64_t sub_1A03B790C()
{
  char *v0;

  return sub_1A03B7844(*v0);
}

uint64_t sub_1A03B7918@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03B76A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A03B7944()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03B7964@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03B77EC();
  *a1 = result;
  return result;
}

uint64_t sub_1A03B7990(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D6CA8, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03B79C4(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D6CA8, a1);
  return sub_1A03D6230();
}

uint64_t sub_1A03B79F8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v20 = a3;
  v19 = a4;
  v8 = type metadata accessor for KVSEntity.CodingKeys(255, a5, a6, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D6CA8, v8);
  v9 = sub_1A03D60F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  v23 = a2;
  v22 = 0;
  sub_1A03AC2C8(0, v13, v14, v15);
  sub_1A03ABC90(&qword_1EE597470, (void (*)(uint64_t))sub_1A03AC2C8);
  v16 = v21;
  sub_1A03D60EC();
  if (!v16)
  {
    v17 = v19;
    v23 = v20;
    v22 = 1;
    sub_1A03B85C8(0, qword_1ED0CDC90, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    sub_1A03B8654(&qword_1EE597478);
    sub_1A03D60EC();
    v23 = v17;
    v22 = 2;
    sub_1A03AC318(0);
    sub_1A03ABC90(qword_1EE597480, sub_1A03AC318);
    sub_1A03D60EC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1A03B7C10(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;

  v5 = type metadata accessor for KVSEntity.CodingKeys(255, a2, a3, a4);
  v35 = MEMORY[0x1A1AF9BC4](&unk_1A03D6CA8, v5);
  v30 = sub_1A03D60B0();
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v7 = (char *)&v29 - v6;
  sub_1A03A298C(0, &qword_1ED0CDC80, (uint64_t (*)(uint64_t))sub_1A03AC528, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v29 - v12;
  sub_1A03AC2C8(0, v14, v15, v16);
  swift_initStackObject();
  sub_1A03B3124();
  v33 = v17;
  sub_1A03AC528(0);
  v19 = v18;
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v19);
  sub_1A03B85C8(0, qword_1ED0CDC90, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A03AC370();
  v34 = v20;
  sub_1A03AC318(0);
  swift_initStackObject();
  sub_1A03AC544();
  v32 = v21;
  v22 = a1[3];
  v31 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v22);
  v23 = v7;
  v24 = v36;
  sub_1A03D6200();
  if (v24)
  {
    v28 = v33;
  }
  else
  {
    v25 = v29;
    v37 = 0;
    sub_1A03ABC90(&qword_1EE597458, (void (*)(uint64_t))sub_1A03AC2C8);
    v26 = v30;
    sub_1A03D60A4();
    swift_release();
    v28 = v38;
    v37 = 1;
    sub_1A03B8654(&qword_1EE597460);
    swift_retain();
    sub_1A03D60A4();
    swift_release();
    v37 = 2;
    sub_1A03ABC90(&qword_1EE597468, sub_1A03AC318);
    swift_retain();
    sub_1A03D60A4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v23, v26);
    swift_retain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  swift_release();
  swift_release();
  swift_release();
  return v28;
}

uint64_t sub_1A03B80C4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = sub_1A03B7C10(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_1A03B80F8(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1A03B79F8(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_1A03B811C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A03A4AD8(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03B7094);
}

uint64_t sub_1A03B8128()
{
  return 40;
}

__n128 sub_1A03B8134(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t dispatch thunk of static KeyValueStoreDescriptor.name.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static KeyValueStoreDescriptor.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t method lookup function for KeyValueStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of KeyValueStore.__allocating_init(database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t initializeBufferWithCopyOfBuffer for Database.Errors(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1A03B81C0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A03B81E0(uint64_t result, int a2, int a3)
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
  sub_1A03B1D80(a1, &qword_1EE597440, (uint64_t)&unk_1E4376AE8, MEMORY[0x1E0DEEC78]);
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

uint64_t sub_1A03B8230(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A03B8250(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1A03B1D80(a1, (unint64_t *)&unk_1EE597448, (uint64_t)&unk_1E4376A10, MEMORY[0x1E0DEEC78]);
}

_QWORD *assignWithCopy for Versions(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for Versions(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t *sub_1A03B836C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = ((v6 + 24) & ~v6) + *(_QWORD *)(v5 + 64);
  v8 = *(_DWORD *)(v5 + 80) & 0x100000;
  v9 = *a2;
  *a1 = *a2;
  if (v6 > 7 || v8 != 0 || v7 > 0x18)
  {
    a1 = (uint64_t *)(v9 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v12 = a2[2];
    a1[1] = a2[1];
    a1[2] = v12;
    v13 = ((unint64_t)a1 + v6 + 24) & ~v6;
    v14 = ((unint64_t)a2 + v6 + 24) & ~v6;
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_retain();
    swift_retain();
    swift_retain();
    v15(v13, v14, v4);
  }
  return a1;
}

_QWORD *sub_1A03B8448(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 24))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

uint64_t sub_1A03B84E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 24 + a1) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 24 + a2) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

_QWORD *sub_1A03B8540(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(unint64_t, unint64_t))(v6 + 40))(((unint64_t)a1 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80), ((unint64_t)a2 + *(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  return a1;
}

void sub_1A03B85C8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v8 = sub_1A03D5918();
    v9 = a3();
    v10 = a4(a1, v8, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
  OUTLINED_FUNCTION_26();
}

void sub_1A03B862C()
{
  sub_1A03ABC90(qword_1ED0CDBC0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
}

uint64_t type metadata accessor for KVSEntity.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for KVSEntity.CodingKeys);
}

void sub_1A03B8654(_QWORD *a1)
{
  if (!*a1)
  {
    sub_1A03B85C8(255, qword_1ED0CDC90, (uint64_t (*)(void))sub_1A03B862C, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    OUTLINED_FUNCTION_37();
  }
  OUTLINED_FUNCTION_14();
}

void type metadata accessor for KeyValueStore.TranslationError()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t sub_1A03B86AC(uint64_t a1)
{
  return sub_1A03B630C(a1) & 1;
}

void sub_1A03B86D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(_QWORD, uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;

  v6 = a6(0, a3, a4, a5);
  OUTLINED_FUNCTION_11_0(v6);
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03B8708()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A03B8734@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A03B6008(a1, a2);
}

uint64_t sub_1A03B8758()
{
  return sub_1A03B8764((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03B5C58);
}

uint64_t sub_1A03B8764(uint64_t (*a1)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;

  return a1(v1[7], v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_1A03B8778()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for LazyLoaderError(unsigned int *a1, int a2)
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

uint64_t sub_1A03B87D4(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03B8814 + 4 * byte_1A03D683E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03B8834 + 4 * byte_1A03D6843[v4]))();
}

_BYTE *sub_1A03B8814(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03B8834(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03B883C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03B8844(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03B884C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03B8854(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1A03B8860()
{
  return 0;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1A03B1D80(a1, &qword_1ED0CE8E8, (uint64_t)&unk_1E4376990, MEMORY[0x1E0DEEC78]);
}

uint64_t sub_1A03B8888()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t getEnumTagSinglePayload for Transaction(unsigned __int8 *a1, unsigned int a2)
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

uint64_t sub_1A03B8918(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03B8964 + 4 * byte_1A03D684D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A03B8998 + 4 * byte_1A03D6848[v4]))();
}

uint64_t sub_1A03B8998(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03B89A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03B89A8);
  return result;
}

uint64_t sub_1A03B89B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03B89BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A03B89C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03B89C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1A03B1D80(a1, (unint64_t *)&unk_1EE597590, (uint64_t)&unk_1E4376B68, MEMORY[0x1E0DEEC78]);
}

void sub_1A03B89F0()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03B8A00()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03B8A10()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03B8A20()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_isEscapingClosureAtFileLocation();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  return sub_1A03D5B64();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_retain();
}

uint64_t Optional<A>.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t result;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_14_0();
  v9 = v8 - v7;
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_14_0();
  v13 = v12 - v11;
  (*(void (**)(uint64_t, uint64_t))(v14 + 16))(v12 - v11, v15);
  result = __swift_getEnumTagSinglePayload(v13, 1, v5);
  if ((_DWORD)result == 1)
  {
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    *(_BYTE *)(a3 + 16) = 5;
  }
  else
  {
    OUTLINED_FUNCTION_4_0(v9, v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
    (*(void (**)(uint64_t, uint64_t))(a2 + 40))(v5, a2);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_1A03B8BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return Optional<A>.valueType.getter(a1, *(_QWORD *)(a2 - 8), a3);
}

uint64_t static Optional<A>.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(a1, a2, 1);
}

uint64_t static Optional<A>.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t Optional<A>.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v5) == 1)
    return 0;
  OUTLINED_FUNCTION_4_0((uint64_t)v9, (uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 32));
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 8))(a1, v5, a3);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return v14;
}

uint64_t sub_1A03B8D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Optional<A>.saveChain(for:)(a1, a2, *(_QWORD *)(a3 - 8));
}

uint64_t sub_1A03B8D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return static Optional<A>.createTableChain(for:ifNotExists:)(a1, a2, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8));
}

uint64_t sub_1A03B8D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static Optional<A>.createTableChain(for:ifNotExists:shouldVersion:)(a1, a2, a3, *(_QWORD *)(a4 + 16), *(_QWORD *)(a5 - 8));
}

uint64_t _Optional.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1A03D5EC4();
  return OUTLINED_FUNCTION_12_0(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t _Optional.value.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1A03D5EC4();
  return OUTLINED_FUNCTION_12_0(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*_Optional.value.modify())()
{
  return nullsub_1;
}

uint64_t _Optional.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  char v17;

  v3 = v2;
  v6 = *(_QWORD *)(a1 + 16);
  v7 = sub_1A03D5EC4();
  v8 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v15 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v15 - v10, v3, v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6) == 1)
  {
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v13 = 0uLL;
    v14 = 5;
  }
  else
  {
    (*(void (**)(__int128 *__return_ptr, uint64_t))(*(_QWORD *)(a1 + 24) + 40))(&v16, v6);
    v15 = v16;
    v14 = v17;
    result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v11, v6);
    v13 = v15;
  }
  *(_OWORD *)a2 = v13;
  *(_BYTE *)(a2 + 16) = v14;
  return result;
}

void _Optional.init(valueType:connection:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_17_0();
  MEMORY[0x1E0C80A78](v5);
  OUTLINED_FUNCTION_19_0();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_18_1();
  v8 = MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_13_0(v8, v9);
  v10 = *(unsigned __int8 *)(a1 + 16);
  OUTLINED_FUNCTION_6_0(a2, 1);
  __asm { BR              X9 }
}

void sub_1A03B8F94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  *(_QWORD *)(v4 - 96) = v3;
  *(_QWORD *)(v4 - 88) = v2;
  if ((OUTLINED_FUNCTION_1_0() & 1) != 0)
  {
    v5 = OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_0_2(v5);
    v6 = OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_4_0(v6, v1, v7);
    OUTLINED_FUNCTION_10_0();
  }
  else
  {
    swift_bridgeObjectRelease();
    v8 = OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_0_2(v8);
    OUTLINED_FUNCTION_6_0(v0, 1);
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t _Optional.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  OUTLINED_FUNCTION_6_0(a2, 1);
  v4 = OUTLINED_FUNCTION_2_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
}

void _Optional.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  v20 = a4;
  v7 = sub_1A03D5EC4();
  v8 = *(_QWORD *)(v7 - 8);
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v19 - v10;
  v19[1] = a3;
  v25 = type metadata accessor for _Optional(0, a2, a3, v12);
  v22 = *(_QWORD *)(v25 - 8);
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v19 - v14;
  OUTLINED_FUNCTION_23_0((uint64_t)v19 - v14, 1);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v16 = v21;
  sub_1A03D61F4();
  if (v16)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v25);
  }
  else
  {
    v19[0] = v8;
    v21 = v7;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    if ((sub_1A03D614C() & 1) == 0)
    {
      __swift_project_boxed_opaque_existential_1(v23, v24);
      sub_1A03D6140();
      OUTLINED_FUNCTION_23_0((uint64_t)v11, 0);
      (*(void (**)(char *, char *, uint64_t))(v19[0] + 40))(v15, v11, v21);
    }
    OUTLINED_FUNCTION_22_0();
    v17 = v22;
    v18 = v25;
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 16))(v20, v15, v25);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v15, v18);
  }
  OUTLINED_FUNCTION_10();
}

uint64_t type metadata accessor for _Optional(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _Optional);
}

void _Optional.encode(to:)(_QWORD *a1, uint64_t a2)
{
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
  _QWORD v14[10];

  v14[1] = a2;
  v3 = *(_QWORD *)(a2 + 16);
  v4 = sub_1A03D5EC4();
  v5 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_20();
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v14 - v8;
  v10 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_14_0();
  v13 = v12 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D620C();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 16))(v9, v14[9], v4);
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    OUTLINED_FUNCTION_21_0();
    sub_1A03D6164();
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v13, v9, v3);
    OUTLINED_FUNCTION_21_0();
    sub_1A03D6158();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v3);
  }
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_10();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
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

uint64_t sub_1A03B94BC(uint64_t a1)
{
  return static _Optional.dataType.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

void sub_1A03B94CC(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _Optional.init(valueType:connection:)(a1, a2);
}

uint64_t sub_1A03B94D4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for _Optional<A>);
  result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for _Optional<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void sub_1A03B9518(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _Optional.init(from:)(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

void sub_1A03B9534(_QWORD *a1, uint64_t a2)
{
  _Optional.encode(to:)(a1, a2);
}

uint64_t sub_1A03B9548()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1A03D5EC4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1A03B95B4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  uint64_t v11;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_DWORD *)(v6 + 80);
  if (*(_DWORD *)(v6 + 84))
    v8 = *(_QWORD *)(v6 + 64);
  else
    v8 = *(_QWORD *)(v6 + 64) + 1;
  if (*(_DWORD *)(v6 + 80) > 7u || (v7 & 0x100000) != 0 || v8 > 0x18)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else if (__swift_getEnumTagSinglePayload((uint64_t)a2, 1, *(_QWORD *)(a3 + 16)))
  {
    memcpy(a1, a2, v8);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_1A03B9684(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(a2 + 16);
  result = __swift_getEnumTagSinglePayload(a1, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return result;
}

void *sub_1A03B96D0(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 16))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A03B9760(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 24))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

void *sub_1A03B9838(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  uint64_t v7;
  int v8;
  size_t v9;
  size_t v10;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v7 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    v8 = *(_DWORD *)(v7 + 84);
    v9 = *(_QWORD *)(v7 + 64);
    if (v8)
      v10 = v9;
    else
      v10 = v9 + 1;
    memcpy(a1, a2, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v7 + 32))(a1, a2, v5);
    __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
  }
  return a1;
}

void *sub_1A03B98C8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v5;
  int EnumTagSinglePayload;
  int v7;
  uint64_t v8;
  size_t v9;

  v5 = *(_QWORD *)(a3 + 16);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)a1, 1, v5);
  v7 = __swift_getEnumTagSinglePayload((uint64_t)a2, 1, v5);
  v8 = *(_QWORD *)(v5 - 8);
  if (EnumTagSinglePayload)
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(a1, a2, v5);
      __swift_storeEnumTagSinglePayload((uint64_t)a1, 0, 1, v5);
      return a1;
    }
  }
  else
  {
    if (!v7)
    {
      (*(void (**)(void *, const void *, uint64_t))(v8 + 40))(a1, a2, v5);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(a1, v5);
  }
  if (*(_DWORD *)(v8 + 84))
    v9 = *(_QWORD *)(v8 + 64);
  else
    v9 = *(_QWORD *)(v8 + 64) + 1;
  memcpy(a1, a2, v9);
  return a1;
}

uint64_t sub_1A03B99A0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  char v10;
  int v11;
  unsigned int v12;
  int v13;
  unsigned int EnumTagSinglePayload;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = v6 - 1;
  if (!(_DWORD)v6)
    v7 = 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (!(_DWORD)v6)
    ++v8;
  if (!a2)
    return 0;
  v9 = a2 - v7;
  if (a2 > v7)
  {
    v10 = 8 * v8;
    if (v8 > 3)
      goto LABEL_8;
    v12 = ((v9 + ~(-1 << v10)) >> v10) + 1;
    if (HIWORD(v12))
    {
      v11 = *(_DWORD *)(a1 + v8);
      if (v11)
        goto LABEL_15;
    }
    else
    {
      if (v12 <= 0xFF)
      {
        if (v12 < 2)
          goto LABEL_22;
LABEL_8:
        v11 = *(unsigned __int8 *)(a1 + v8);
        if (!*(_BYTE *)(a1 + v8))
          goto LABEL_22;
LABEL_15:
        v13 = (v11 - 1) << v10;
        if (v8 > 3)
          v13 = 0;
        if ((_DWORD)v8)
        {
          if (v8 > 3)
            LODWORD(v8) = 4;
          __asm { BR              X12 }
        }
        return v7 + v13 + 1;
      }
      v11 = *(unsigned __int16 *)(a1 + v8);
      if (*(_WORD *)(a1 + v8))
        goto LABEL_15;
    }
  }
LABEL_22:
  if (v6 < 2)
    return 0;
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(a1, v6, v4);
  if (EnumTagSinglePayload >= 2)
    return EnumTagSinglePayload - 1;
  else
    return 0;
}

void sub_1A03B9ACC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  size_t v10;
  size_t v11;
  char v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = v8 - 1;
  if (!v8)
    v9 = 0;
  v10 = *(_QWORD *)(v7 + 64);
  if (v8)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = 8 * v11;
  v13 = a3 >= v9;
  v14 = a3 - v9;
  if (v14 != 0 && v13)
  {
    if (v11 <= 3)
    {
      v15 = ((v14 + ~(-1 << v12)) >> v12) + 1;
      if (HIWORD(v15))
      {
        v6 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v6 = 2;
      }
      else
      {
        v6 = v15 > 1;
      }
    }
    else
    {
      v6 = 1u;
    }
  }
  if (v9 < a2)
  {
    v16 = ~v9 + a2;
    if (v11 < 4)
    {
      if ((_DWORD)v11)
      {
        v17 = v16 & ~(-1 << v12);
        bzero(a1, v11);
        if ((_DWORD)v11 == 3)
        {
          *a1 = v17;
          *((_BYTE *)a1 + 2) = BYTE2(v17);
        }
        else if ((_DWORD)v11 == 2)
        {
          *a1 = v17;
        }
        else
        {
          *(_BYTE *)a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v11);
      *(_DWORD *)a1 = v16;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void sub_1A03B9C60()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_1A03B9C68()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

uint64_t sub_1A03B9C90()
{
  id v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  result = sub_1A039E628(v0);
  v3 = 0x6C7070612E6D6F63;
  if (v2)
    v3 = result;
  v4 = 0xEF62646165742E65;
  if (v2)
    v4 = v2;
  qword_1ED0D0020 = v3;
  *(_QWORD *)algn_1ED0D0028 = v4;
  return result;
}

uint64_t sub_1A03B9CFC()
{
  uint64_t v0;

  v0 = sub_1A03D5A50();
  __swift_allocate_value_buffer(v0, qword_1ED0D0008);
  __swift_project_value_buffer(v0, (uint64_t)qword_1ED0D0008);
  if (qword_1ED0CE858 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_0_3();
  return sub_1A03D5A44();
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

BOOL static DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataType.hash(into:)()
{
  return sub_1A03D61B8();
}

uint64_t DataType.hashValue.getter()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

uint64_t sub_1A03B9E7C()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

unint64_t sub_1A03B9EC0()
{
  unint64_t result;

  result = qword_1EE5976E0;
  if (!qword_1EE5976E0)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for DataType, &type metadata for DataType);
    atomic_store(result, (unint64_t *)&qword_1EE5976E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for DataType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFC)
  {
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
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for DataType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03B9FD0 + 4 * byte_1A03D6E25[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1A03BA004 + 4 * byte_1A03D6E20[v4]))();
}

uint64_t sub_1A03BA004(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BA00C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03BA014);
  return result;
}

uint64_t sub_1A03BA020(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03BA028);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1A03BA02C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BA034(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataType()
{
  return &type metadata for DataType;
}

void sub_1A03BA050(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D6AB8, a1);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_14();
}

void sub_1A03BA07C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static EntityType.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_1A03BA08C()
{
  OUTLINED_FUNCTION_14_1();
}

uint64_t sub_1A03BA0B0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  return OUTLINED_FUNCTION_2_2(v0, v1);
}

uint64_t sub_1A03BA0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  swift_beginAccess();
  v4 = *(_QWORD *)(a1 + 32);
  swift_beginAccess();
  result = *(_QWORD *)(v4 + 32);
  if (result)
  {
    *(_QWORD *)a2 = *(_QWORD *)(v4 + 24);
    *(_QWORD *)(a2 + 8) = result;
    *(_BYTE *)(a2 + 16) = 0;
    return swift_bridgeObjectRetain();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t EntityType.valueType.getter@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v3 = (*(uint64_t (**)(void))(a1 + 24))();
  swift_beginAccess();
  v5 = *(_QWORD *)(v3 + 24);
  v4 = *(_QWORD *)(v3 + 32);
  swift_bridgeObjectRetain();
  result = swift_release();
  if (v4)
  {
    *(_QWORD *)a2 = v5;
    *(_QWORD *)(a2 + 8) = v4;
    *(_BYTE *)(a2 + 16) = 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03BA1A8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1();
}

void sub_1A03BA1C8(uint64_t a1)
{
  OUTLINED_FUNCTION_1_1(a1);
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A03BA1D4(uint64_t a1, unint64_t a2, char a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  __int128 v16;
  uint64_t v17;
  _UNKNOWN **v18;

  if (!a3)
  {
    v17 = MEMORY[0x1E0DEA968];
    v18 = &protocol witness table for String;
    *(_QWORD *)&v16 = a1;
    *((_QWORD *)&v16 + 1) = a2;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = 25705;
    *(_QWORD *)(v7 + 24) = 0xE200000000000000;
    sub_1A03AE220((uint64_t)&v16, v7 + 32);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v16);
    *(_QWORD *)&v16 = sub_1A03A73BC(42, 0xE100000000000000, v7, 0, 0, 0xFFu, 0, 1);
    sub_1A03AD238();
    sub_1A03AD1F8();
    *(_QWORD *)&v16 = sub_1A03D5B94();
    *((_QWORD *)&v16 + 1) = v8;
    swift_bridgeObjectRetain();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 = v16;
    sub_1A03AE220(a4, (uint64_t)&v16);
    sub_1A03BB424(0, v10, v11, v12);
    swift_initStackObject();
    sub_1A03A80D8(4, v9, *((uint64_t *)&v9 + 1), &v16);
    v13 = sub_1A03A79C0();
    swift_release();
    if (*(_QWORD *)(v13 + 16))
    {
      v14 = *(_QWORD *)(v13 + 32);
      swift_retain();
      swift_retain();
      swift_bridgeObjectRelease();
      sub_1A03ADE98(a1, a2, 0);
      __swift_destroy_boxed_opaque_existential_1(a4);
      return v14;
    }
    swift_bridgeObjectRelease();
    __break(1u);
  }
  result = sub_1A03D6038();
  __break(1u);
  return result;
}

uint64_t EntityType.init(valueType:connection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
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
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  char v30;
  uint64_t v31;
  _UNKNOWN **v32;
  char v33;

  v10 = sub_1A03D5EC4();
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v27 - v12;
  if (!*(_BYTE *)(a1 + 16))
  {
    v14 = *(_QWORD *)a1;
    v15 = *(_QWORD *)(a1 + 8);
    v16 = *(_QWORD *)(a4 + 8);
    type metadata accessor for Statement(0, a3, *(_QWORD *)(v16 + 24), v11);
    v33 = 4;
    v31 = MEMORY[0x1E0DEA968];
    v32 = &protocol witness table for String;
    *(_QWORD *)&v29 = v14;
    *((_QWORD *)&v29 + 1) = v15;
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = 25705;
    *(_QWORD *)(v17 + 24) = 0xE200000000000000;
    sub_1A03AE220((uint64_t)&v29, v17 + 32);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v29);
    v28 = v17;
    v29 = 0uLL;
    v30 = -1;
    v18 = sub_1A03A9ED4(&v28, (uint64_t)&v29, 0, 1, a3, v16);
    swift_release();
    v20 = sub_1A03A60E8(v18, a3, v16, v19);
    v22 = v21;
    swift_bridgeObjectRelease();
    sub_1A03AE220(a2, (uint64_t)&v29);
    v23 = sub_1A03AD7A0(&v33, v20, v22, &v29);
    v24 = sub_1A03AD83C(v23);
    swift_release();
    *(_QWORD *)&v29 = v24;
    v25 = sub_1A03D5D50();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v25);
    sub_1A03D5DA4();
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, a3) != 1)
    {
      sub_1A03ADE98(v14, v15, 0);
      __swift_destroy_boxed_opaque_existential_1(a2);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(a5, v13, a3);
    }
    __break(1u);
  }
  result = sub_1A03D6038();
  __break(1u);
  return result;
}

void sub_1A03BA690()
{
  uint64_t v0;

  v0 = MEMORY[0x1A1AF9BC4](&unk_1A03D6AB8);
  OUTLINED_FUNCTION_5_1(v0);
  OUTLINED_FUNCTION_0_4();
}

uint64_t (*sub_1A03BA6C8(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v5;
  __int128 v7[2];

  sub_1A03AE220(a1, (uint64_t)v7);
  v5 = swift_allocObject();
  sub_1A03A5D80(v7, v5 + 16);
  *(_QWORD *)(v5 + 56) = a2;
  *(_QWORD *)(v5 + 64) = a3;
  swift_retain();
  swift_retain();
  return sub_1A03BB538;
}

uint64_t (*EntityType.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;
  __int128 v13[2];

  v6 = *(_QWORD *)(a2 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x1E0C80A78](a1);
  sub_1A03AE220(v8, (uint64_t)v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a2);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  sub_1A03A5D80(v13, v10 + 32);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  return sub_1A03BADB4;
}

void sub_1A03BA824()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1A03BA844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

uint64_t (*sub_1A03BA850(uint64_t a1, char a2))()
{
  uint64_t v3;
  __int128 v5[2];

  sub_1A03AE220(a1, (uint64_t)v5);
  v3 = swift_allocObject();
  sub_1A03A5D80(v5, v3 + 16);
  *(_BYTE *)(v3 + 56) = a2;
  *(_BYTE *)(v3 + 57) = 1;
  return sub_1A03BB638;
}

uint64_t static EntityType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a4 + 16) + 24) + 24))(a1, a2, 1, a3);
}

void sub_1A03BA8D4()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_15_1();
}

void sub_1A03BA8F4(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_0_4();
}

uint64_t (*sub_1A03BA908(uint64_t a1, char a2, char a3))()
{
  uint64_t v5;
  __int128 v7[2];

  sub_1A03AE220(a1, (uint64_t)v7);
  v5 = swift_allocObject();
  sub_1A03A5D80(v7, v5 + 16);
  *(_BYTE *)(v5 + 56) = a2;
  *(_BYTE *)(v5 + 57) = a3;
  return sub_1A03BB474;
}

uint64_t (*static EntityType.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5))()
{
  uint64_t v9;
  __int128 v11[2];

  sub_1A03AE220(a1, (uint64_t)v11);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a4;
  *(_QWORD *)(v9 + 24) = a5;
  sub_1A03A5D80(v11, v9 + 32);
  *(_BYTE *)(v9 + 72) = a2;
  *(_BYTE *)(v9 + 73) = a3;
  return sub_1A03BAE08;
}

uint64_t sub_1A03BA9FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1A03BAA28(uint64_t a1, char a2, char a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *inited;
  __int128 v12[2];
  __int128 v13[2];
  _BYTE v14[40];
  __int128 v15[2];

  sub_1A03AE220(a1, (uint64_t)v15);
  sub_1A03A5D80(v15, (uint64_t)v14);
  sub_1A03AE220((uint64_t)v14, (uint64_t)v13);
  sub_1A03AE220((uint64_t)v14, (uint64_t)v12);
  v5 = sub_1A03A7058(v12);
  v7 = v6;
  v9 = v8;
  sub_1A03BB554(0, &qword_1ED0CE600, (uint64_t (*)(void))sub_1A03AA4D0, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Create);
  inited = (_QWORD *)swift_initStackObject();
  sub_1A03A5D80(v13, (uint64_t)(inited + 2));
  inited[7] = v5;
  inited[8] = v7;
  inited[9] = v9;
  sub_1A03A7728(a2, a3);
  swift_setDeallocating();
  sub_1A03BB494();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_1A03BAB34(uint64_t a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13[2];

  type metadata accessor for Table(0, a4, a5, a4);
  sub_1A03AE220(a1, (uint64_t)v13);
  v8 = sub_1A039F980(v13);
  sub_1A03A6FDC(v8, v9, v10, v11);
  sub_1A03A6408(a2, a3);
  swift_release();
  return swift_release();
}

uint64_t sub_1A03BABD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  __int128 v7[2];
  _BYTE v8[40];
  __int128 v9[2];

  sub_1A03AE220(a1, (uint64_t)v9);
  sub_1A03A5D80(v9, (uint64_t)v8);
  sub_1A03AE220((uint64_t)v8, (uint64_t)v7);
  sub_1A03BB554(0, qword_1ED0CE368, (uint64_t (*)(void))sub_1A03B4FE0, (uint64_t)&type metadata for Versions.Entity, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Save);
  v5 = swift_initStackObject() + 16;
  sub_1A03A5D80(v7, v5);
  sub_1A03A6138(a2, a3);
  swift_setDeallocating();
  __swift_destroy_boxed_opaque_existential_1(v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_1A03BACB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v7[2];

  type metadata accessor for Table(0, a3, a4, a4);
  sub_1A03AE220(a1, (uint64_t)v7);
  sub_1A039F980(v7);
  sub_1A03AB8B4();
  sub_1A03AD538(a2);
  swift_release();
  return swift_release();
}

uint64_t sub_1A03BAD48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1A03BADB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_1A03BACB4(v0 + 32, v0 + ((v2 + 72) & ~v2), v1, *(_QWORD *)(v0 + 24));
}

uint64_t sub_1A03BADE4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t sub_1A03BAE08()
{
  uint64_t v0;

  return sub_1A03BAB34(v0 + 32, *(_BYTE *)(v0 + 72), *(_BYTE *)(v0 + 73), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t dispatch thunk of EntityType.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1A03BAE34()
{
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_1A03BAE50()
{
  return 0;
}

uint64_t sub_1A03BAE5C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  sub_1A03BB554(0, &qword_1EE597708, (uint64_t (*)(void))sub_1A03BB3E8, (uint64_t)&type metadata for RawEntity.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v8 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03BB3E8();
  sub_1A03D6218();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1A03BAF38(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t sub_1A03BAF60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03BAE34();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A03BAF88()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03BAFA0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03A63E8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A03BAFC8()
{
  sub_1A03BB3E8();
  return sub_1A03D6224();
}

uint64_t sub_1A03BAFF0()
{
  sub_1A03BB3E8();
  return sub_1A03D6230();
}

uint64_t sub_1A03BB018()
{
  uint64_t v0;

  v0 = qword_1EE5976E8;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1A03BB04C()
{
  uint64_t v0;

  v0 = *(_QWORD *)a000;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_1A03BB080(uint64_t a1)
{
  return sub_1A03BAF38(a1);
}

uint64_t sub_1A03BB094(_QWORD *a1)
{
  return sub_1A03BAE5C(a1);
}

void sub_1A03BB0A8(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D7CE4, a1);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_14();
}

void sub_1A03BB0D4()
{
  OUTLINED_FUNCTION_14_1();
}

uint64_t sub_1A03BB0F8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  return OUTLINED_FUNCTION_2_2(v0, v1);
}

void sub_1A03BB104()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1();
}

void sub_1A03BB124(uint64_t a1)
{
  OUTLINED_FUNCTION_1_1(a1);
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03BB130()
{
  uint64_t v0;

  v0 = MEMORY[0x1A1AF9BC4](&unk_1A03D7CE4);
  OUTLINED_FUNCTION_5_1(v0);
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03BB168()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1A03BB188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

void sub_1A03BB194()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_15_1();
}

void sub_1A03BB1B4(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A03BB1CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1A03BA0BC(*v1, a1);
}

void sub_1A03BB1D4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;

  *a3 = sub_1A03BA1D4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), a2);
  a3[1] = v4;
  OUTLINED_FUNCTION_14();
}

uint64_t (*sub_1A03BB204(uint64_t a1))()
{
  uint64_t *v1;

  return sub_1A03BA6C8(a1, *v1, v1[1]);
}

void sub_1A03BB214(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8458, a1);
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_14();
}

void sub_1A03BB240()
{
  OUTLINED_FUNCTION_14_1();
}

uint64_t sub_1A03BB264()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  return OUTLINED_FUNCTION_2_2(v0, v1);
}

void sub_1A03BB270()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_7_1();
}

void sub_1A03BB290(uint64_t a1)
{
  OUTLINED_FUNCTION_1_1(a1);
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03BB29C()
{
  uint64_t v0;

  v0 = MEMORY[0x1A1AF9BC4](&unk_1A03D8458);
  OUTLINED_FUNCTION_5_1(v0);
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03BB2D4()
{
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_7_1();
}

uint64_t sub_1A03BB2F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_3_1(v0, v1, v2, v3);
}

void sub_1A03BB300()
{
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_15_1();
}

void sub_1A03BB320(uint64_t a1)
{
  OUTLINED_FUNCTION_4_1(a1);
  OUTLINED_FUNCTION_0_4();
}

ValueMetadata *type metadata accessor for RawEntity()
{
  return &type metadata for RawEntity;
}

unint64_t sub_1A03BB344(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A03BB370();
  result = sub_1A03BB3AC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_1A03BB370()
{
  unint64_t result;

  result = qword_1ED0CDBA0;
  if (!qword_1ED0CDBA0)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D6EFC, &type metadata for RawEntity);
    atomic_store(result, (unint64_t *)&qword_1ED0CDBA0);
  }
  return result;
}

unint64_t sub_1A03BB3AC()
{
  unint64_t result;

  result = qword_1ED0CDB98;
  if (!qword_1ED0CDB98)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D6ED4, &type metadata for RawEntity);
    atomic_store(result, (unint64_t *)&qword_1ED0CDB98);
  }
  return result;
}

unint64_t sub_1A03BB3E8()
{
  unint64_t result;

  result = qword_1EE597710;
  if (!qword_1EE597710)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D6FAC, &type metadata for RawEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597710);
  }
  return result;
}

void sub_1A03BB424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CE6B8)
  {
    v4 = type metadata accessor for Statement(0, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CE6B8);
  }
}

uint64_t sub_1A03BB474()
{
  uint64_t v0;

  return sub_1A03BAA28(v0 + 16, *(_BYTE *)(v0 + 56), *(_BYTE *)(v0 + 57));
}

uint64_t sub_1A03BB494()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  sub_1A039FA74(*(_QWORD *)(v0 + 56));
  return swift_deallocClassInstance();
}

uint64_t sub_1A03BB4C4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1A03BB4E8(uint64_t a1, uint64_t *a2)
{
  return sub_1A03BABD8(a1, *a2, a2[1]);
}

uint64_t sub_1A03BB504()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03BB538()
{
  uint64_t v0;

  return sub_1A03BB4E8(v0 + 16, (uint64_t *)(v0 + 56));
}

void sub_1A03BB554(uint64_t a1, unint64_t *a2, uint64_t (*a3)(void), uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v9 = a3();
    v10 = a5(a1, a4, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
  OUTLINED_FUNCTION_0_4();
}

ValueMetadata *type metadata accessor for RawEntity.CodingKeys()
{
  return &type metadata for RawEntity.CodingKeys;
}

unint64_t sub_1A03BB5BC()
{
  unint64_t result;

  result = qword_1EE597718;
  if (!qword_1EE597718)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D6F5C, &type metadata for RawEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597718);
  }
  return result;
}

unint64_t sub_1A03BB5FC()
{
  unint64_t result;

  result = qword_1EE597720;
  if (!qword_1EE597720)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D6F84, &type metadata for RawEntity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597720);
  }
  return result;
}

uint64_t sub_1A03BB638()
{
  return sub_1A03BB474();
}

uint64_t sub_1A03BB650(unint64_t a1, unint64_t a2)
{
  unint64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a1;
  v4 = sub_1A03B49C8(a1, a2);
  v5 = MEMORY[0x1E0DEE9D8];
  if (v4)
  {
    v6 = v4;
    v30 = MEMORY[0x1E0DEE9D8];
    sub_1A03B4D24(0, v4 & ~(v4 >> 63), 0);
    if (v6 < 0)
      goto LABEL_57;
    v7 = (v3 >> 59) & 1;
    if ((a2 & 0x1000000000000000) == 0)
      LOBYTE(v7) = 1;
    v8 = 4 << v7;
    if ((a2 & 0x2000000000000000) != 0)
      v9 = HIBYTE(a2) & 0xF;
    else
      v9 = v3 & 0xFFFFFFFFFFFFLL;
    v10 = 15;
    v26 = 4 << v7;
    v27 = v3;
    v25 = v9;
    do
    {
      v11 = v10 & 0xC;
      v12 = (v10 & 1) == 0 || v11 == v8;
      v13 = v12;
      if (v12)
      {
        v14 = v10;
        if (v11 == v8)
          v14 = sub_1A03D0A4C(v10, v3, a2);
        if (v14 >> 16 >= v9)
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
LABEL_56:
          __break(1u);
LABEL_57:
          __break(1u);
          JUMPOUT(0x1A03BB95CLL);
        }
        if ((v14 & 1) == 0)
          sub_1A03BB974(v14, v3, a2);
      }
      else if (v10 >> 16 >= v9)
      {
        goto LABEL_54;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v15 = sub_1A03D5F24();
      }
      else
      {
        if ((a2 & 0x2000000000000000) != 0)
        {
          v28 = v3;
          v29 = a2 & 0xFFFFFFFFFFFFFFLL;
        }
        else if ((v3 & 0x1000000000000000) == 0)
        {
          sub_1A03D5F6C();
        }
        v15 = sub_1A03D5F78();
      }
      v16 = v15;
      v5 = v30;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03B4D24(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v30;
      }
      v18 = *(_QWORD *)(v5 + 16);
      v17 = *(_QWORD *)(v5 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1A03B4D24((char *)(v17 > 1), v18 + 1, 1);
        v5 = v30;
      }
      *(_QWORD *)(v5 + 16) = v18 + 1;
      *(_DWORD *)(v5 + 4 * v18 + 32) = v16;
      if (v13)
      {
        v8 = v26;
        v3 = v27;
        v9 = v25;
        if (v11 == v26)
          v10 = sub_1A03D0A4C(v10, v27, a2);
        if (v25 <= v10 >> 16)
          goto LABEL_55;
        if ((v10 & 1) == 0)
          v10 = v10 & 0xC | sub_1A03BB974(v10, v27, a2) & 0xFFFFFFFFFFFFFFF3 | 1;
      }
      else
      {
        v9 = v25;
        v8 = v26;
        v3 = v27;
        if (v25 <= v10 >> 16)
          goto LABEL_56;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v10 = sub_1A03D5C00();
      }
      else
      {
        v19 = v10 >> 16;
        if ((a2 & 0x2000000000000000) != 0)
        {
          v28 = v3;
          v29 = a2 & 0xFFFFFFFFFFFFFFLL;
          v21 = *((unsigned __int8 *)&v28 + v19);
        }
        else
        {
          v20 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
          if ((v3 & 0x1000000000000000) == 0)
            v20 = sub_1A03D5F6C();
          v21 = *(unsigned __int8 *)(v20 + v19);
        }
        v22 = (char)v21;
        v23 = __clz(v21 ^ 0xFF) - 24;
        if (v22 >= 0)
          LOBYTE(v23) = 1;
        v10 = ((v19 + v23) << 16) | 5;
      }
      --v6;
    }
    while (v6);
  }
  return v5;
}

uint64_t sub_1A03BB96C()
{
  return Data.queryValue.getter();
}

unint64_t sub_1A03BB974(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) != 0)
    {
      v10 = HIBYTE(a3) & 0xF;
      if ((a3 & 0x2000000000000000) == 0)
        v10 = a2 & 0xFFFFFFFFFFFFLL;
      if (v5 != v10)
        return sub_1A03D5F18();
    }
    else
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v9 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
        }
        else
        {
          v9 = result >> 16;
        }
        v5 = v9;
      }
      else
      {
        if ((a2 & 0x1000000000000000) != 0)
        {
          v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
          v7 = a2 & 0xFFFFFFFFFFFFLL;
        }
        else
        {
          v12 = result >> 16;
          v6 = sub_1A03D5F6C();
          v5 = v12;
        }
        if (v5 != v7)
        {
          do
            v8 = *(_BYTE *)(v6 + v5--) & 0xC0;
          while (v8 == 128);
          ++v5;
        }
      }
      return v5 << 16;
    }
  }
  return result;
}

unint64_t sub_1A03BBA6C(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_1A03D0A4C(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 < result >> 16)
    __break(1u);
  return result;
}

uint64_t sub_1A03BBAD8@<X0>(uint64_t a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;
  uint64_t v7;

  if (a1)
  {
    if (a1 <= 14)
    {
      result = sub_1A03D5870();
      v6 = v7 & 0xFFFFFFFFFFFFFFLL;
    }
    else
    {
      sub_1A03D5828();
      swift_allocObject();
      v4 = sub_1A03D57F8();
      if ((unint64_t)a1 >= 0x7FFFFFFF)
      {
        sub_1A03D58AC();
        result = swift_allocObject();
        *(_QWORD *)(result + 16) = 0;
        *(_QWORD *)(result + 24) = a1;
        v6 = v4 | 0x8000000000000000;
      }
      else
      {
        result = a1 << 32;
        v6 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    result = 0;
    v6 = 0xC000000000000000;
  }
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_1A03BBC34()
{
  unint64_t v0;

  v0 = sub_1A03D6068();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_1A03BBC80()
{
  return 6;
}

uint64_t sub_1A03BBC88(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1A03BBCB4 + 4 * byte_1A03D703C[a1]))(1954047348, 0xE400000000000000);
}

uint64_t sub_1A03BBCB4()
{
  return 0x72656765746E69;
}

uint64_t sub_1A03BBCCC()
{
  return 1819242338;
}

uint64_t sub_1A03BBCD8()
{
  return 0x656C62756F64;
}

uint64_t sub_1A03BBCEC()
{
  return 1651469410;
}

uint64_t sub_1A03BBCF8()
{
  return 1819047278;
}

uint64_t sub_1A03BBD04(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1A03BBD30 + 4 * byte_1A03D7042[a1]))(1954047348, 0xE400000000000000);
}

uint64_t sub_1A03BBD30()
{
  return 0x72656765746E69;
}

uint64_t sub_1A03BBD48()
{
  return 1819242338;
}

uint64_t sub_1A03BBD54()
{
  return 0x656C62756F64;
}

uint64_t sub_1A03BBD68()
{
  return 1651469410;
}

uint64_t sub_1A03BBD74()
{
  return 1819047278;
}

void sub_1A03BBD80(char *a1)
{
  sub_1A03BCDE0(*a1);
}

uint64_t sub_1A03BBD8C()
{
  unsigned __int8 *v0;

  return sub_1A03BBD94(*v0);
}

uint64_t sub_1A03BBD94(unsigned __int8 a1)
{
  sub_1A03D61AC();
  sub_1A03BBC88(a1);
  sub_1A03D5C24();
  swift_bridgeObjectRelease();
  return sub_1A03D61C4();
}

uint64_t sub_1A03BBDF4(char a1)
{
  return sub_1A03BBF1C(0, a1);
}

void sub_1A03BBE00(uint64_t a1)
{
  char *v1;

  sub_1A03BBE08(a1, *v1);
}

void sub_1A03BBE08(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1A03BBE40()
{
  sub_1A03D5C24();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03BBEA4(uint64_t a1, char a2)
{
  if (!a2)
    OUTLINED_FUNCTION_6_2();
  sub_1A03D5C24();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03BBF14(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_1A03BBFAC(a1, *v1);
}

uint64_t sub_1A03BBF1C(uint64_t a1, char a2)
{
  sub_1A03D61AC();
  if (!a2)
    OUTLINED_FUNCTION_6_2();
  sub_1A03D5C24();
  OUTLINED_FUNCTION_8_1();
  return sub_1A03D61C4();
}

uint64_t sub_1A03BBFAC(uint64_t a1, unsigned __int8 a2)
{
  sub_1A03D61AC();
  sub_1A03BBC88(a2);
  sub_1A03D5C24();
  swift_bridgeObjectRelease();
  return sub_1A03D61C4();
}

uint64_t sub_1A03BC008@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03BBC34();
  *a1 = result;
  return result;
}

uint64_t sub_1A03BC034@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1A03BBC88(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_1A03BC05C()
{
  unsigned __int8 *v0;

  return sub_1A03BBD04(*v0);
}

uint64_t sub_1A03BC064@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03BBC7C();
  *a1 = result;
  return result;
}

uint64_t sub_1A03BC088()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03BC0A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03BBC80();
  *a1 = result;
  return result;
}

uint64_t sub_1A03BC0C8()
{
  sub_1A03BC330();
  return sub_1A03D6224();
}

uint64_t sub_1A03BC0F0()
{
  sub_1A03BC330();
  return sub_1A03D6230();
}

uint64_t ValueType.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1A03BC53C(0, &qword_1EE597728, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED048]);
  MEMORY[0x1E0C80A78](v5);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03BC330();
  sub_1A03D6200();
  if (!v2)
  {
    v6 = sub_1A03D6074();
    v8 = v7;
    OUTLINED_FUNCTION_0_5();
    *(_QWORD *)a2 = v6;
    *(_QWORD *)(a2 + 8) = v8;
    *(_BYTE *)(a2 + 16) = 0;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_1A03BC330()
{
  unint64_t result;

  result = qword_1EE597730;
  if (!qword_1EE597730)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D7244, &type metadata for ValueType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597730);
  }
  return result;
}

void ValueType.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  sub_1A03BC53C(0, &qword_1EE597738, (uint64_t (*)(uint64_t, ValueMetadata *, unint64_t))MEMORY[0x1E0DED170]);
  MEMORY[0x1E0C80A78](v3);
  v4 = *(unsigned __int8 *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03BC330();
  sub_1A03D6218();
  __asm { BR              X9 }
}

uint64_t sub_1A03BC434()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 0;
  sub_1A03D60BC();
  return OUTLINED_FUNCTION_1_2();
}

void sub_1A03BC53C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A03BC330();
    v7 = a3(a1, &type metadata for ValueType.CodingKeys, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_1A03BC598@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ValueType.init(from:)(a1, a2);
}

void sub_1A03BC5AC(_QWORD *a1)
{
  ValueType.encode(to:)(a1);
}

void ValueType.description.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1A03BC604()
{
  uint64_t v0;

  swift_bridgeObjectRetain();
  return v0;
}

void static ValueType.== infix(_:_:)(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_1A03BC738@<X0>(int a1@<W8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v7;

  if (a1)
  {
    v7 = 0;
  }
  else
  {
    if (v1 != v2 || v3 != v4)
    {
      OUTLINED_FUNCTION_7_2();
      return sub_1A03D6134();
    }
    v7 = 1;
  }
  return v7 & 1;
}

void ValueType.queryValue.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_1A03BC874()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 48) = 39;
  *(_QWORD *)(v0 - 40) = 0xE100000000000000;
  sub_1A03B2CA0();
  sub_1A03D5EE8();
  sub_1A03D5C48();
  OUTLINED_FUNCTION_8_1();
  sub_1A03D5C48();
  return *(_QWORD *)(v0 - 48);
}

uint64_t destroy for ValueType(uint64_t a1)
{
  return sub_1A03ADE98(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s5TeaDB9ValueTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A03AE264(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ValueType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A03AE264(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1A03ADE98(v6, v7, v8);
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

uint64_t assignWithTake for ValueType(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1A03ADE98(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueType(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 5)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ValueType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1A03BCB24(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 4u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_1A03BCB3C(uint64_t result, unsigned int a2)
{
  if (a2 >= 5)
  {
    *(_QWORD *)result = a2 - 5;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 5;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValueType()
{
  return &type metadata for ValueType;
}

uint64_t getEnumTagSinglePayload for ValueType.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
    if (a2 + 5 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 5) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ValueType.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1A03BCC38 + 4 * byte_1A03D706B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1A03BCC6C + 4 * byte_1A03D7066[v4]))();
}

uint64_t sub_1A03BCC6C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BCC74(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03BCC7CLL);
  return result;
}

uint64_t sub_1A03BCC88(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03BCC90);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1A03BCC94(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BCC9C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ValueType.CodingKeys()
{
  return &type metadata for ValueType.CodingKeys;
}

unint64_t sub_1A03BCCBC()
{
  unint64_t result;

  result = qword_1EE597740;
  if (!qword_1EE597740)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D721C, &type metadata for ValueType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597740);
  }
  return result;
}

unint64_t sub_1A03BCCFC()
{
  unint64_t result;

  result = qword_1EE597748;
  if (!qword_1EE597748)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D7154, &type metadata for ValueType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597748);
  }
  return result;
}

unint64_t sub_1A03BCD3C()
{
  unint64_t result;

  result = qword_1EE597750;
  if (!qword_1EE597750)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D717C, &type metadata for ValueType.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597750);
  }
  return result;
}

unint64_t sub_1A03BCD78()
{
  unint64_t result;

  result = qword_1EE597758;
  if (!qword_1EE597758)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Database.Errors, &type metadata for Database.Errors);
    atomic_store(result, (unint64_t *)&qword_1EE597758);
  }
  return result;
}

uint64_t sub_1A03BCDB4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1A03BCDE0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1A03BCE20(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1A03BCE8C + 4 * byte_1A03D729E[a2]))(0x72656765746E69);
}

void sub_1A03BCE8C(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x72656765746E69 || v1 != 0xE700000000000000)
    sub_1A03D6134();
  OUTLINED_FUNCTION_8_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_4();
}

BOOL sub_1A03BCF1C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_1A03BCF28(char a1, char a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = 0xE900000000000045;
  v3 = 0x4445525245464544;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0x54414944454D4D49;
    else
      v4 = 0x564953554C435845;
    v5 = 0xE900000000000045;
  }
  else
  {
    v5 = 0xE800000000000000;
    v4 = 0x4445525245464544;
  }
  if (a2)
  {
    if (a2 == 1)
      v3 = 0x54414944454D4D49;
    else
      v3 = 0x564953554C435845;
  }
  else
  {
    v2 = 0xE800000000000000;
  }
  if (v4 != v3 || v5 != v2)
    sub_1A03D6134();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_0_4();
}

BOOL static Database.RecoveryMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

void Database.RecoveryMode.hash(into:)()
{
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_14();
}

void Database.RecoveryMode.hashValue.getter()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_38_0();
}

BOOL static Database.VacuumMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void Database.VacuumMode.hash(into:)()
{
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_14();
}

void _s5TeaDB8DatabaseC14JournalingModeO9hashValueSivg_0()
{
  OUTLINED_FUNCTION_53();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_38_0();
}

void sub_1A03BD0E4()
{
  sub_1A03D61AC();
  OUTLINED_FUNCTION_39_0();
  OUTLINED_FUNCTION_70();
  OUTLINED_FUNCTION_38_0();
}

void static Database.ConnectionMode.defaultTransient.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0x4014000000000000;
  *(_BYTE *)(a1 + 8) = 0;
}

uint64_t Database.__allocating_init(location:journalingMode:recoveryMode:cacheSize:vacuumMode:shouldTakeRBAssertion:busyTimeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  if ((a6 & 1) != 0)
  {
    if (qword_1ED0CE7D8 == -1)
      goto LABEL_5;
    goto LABEL_6;
  }
  if (qword_1ED0CDB10 != -1)
LABEL_6:
    swift_once();
LABEL_5:
  v6 = OUTLINED_FUNCTION_0();
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
  return v6;
}

void Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1();
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1A03BD27C()
{
  uint64_t v0;
  uint64_t v1;
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 16);
  if (v1 && (*(_QWORD *)(v1 + 16) & 0x10) != 0)
    sub_1A03B3860();
  v2 = tdb_truncate_db();
  v3 = sub_1A03AE798(v2);
  v5 = v4;
  v7 = v6;
  if ((sub_1A03AED70(v3, v4, v6) & 1) != 0)
  {
    sub_1A03AE590(v3, v5, v7);
  }
  else
  {
    if (v7 != 29 || __PAIR128__(v5, v3) >= 3)
    {
      if (qword_1ED0CE030 != -1)
        swift_once();
      v8 = (id)qword_1ED0D0000;
      sub_1A03D5DD4();
      sub_1A03A00AC();
      v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1A03D6810;
      sub_1A03D6008();
      v10 = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v9 + 56) = MEMORY[0x1E0DEA968];
      v11 = sub_1A03A0110();
      *(_QWORD *)(v9 + 32) = 0;
      *(_QWORD *)(v9 + 40) = 0xE000000000000000;
      *(_QWORD *)(v9 + 96) = v10;
      *(_QWORD *)(v9 + 104) = v11;
      *(_QWORD *)(v9 + 64) = v11;
      *(_QWORD *)(v9 + 72) = 0x657461636E757274;
      *(_QWORD *)(v9 + 80) = 0xE800000000000000;
      sub_1A03D5A2C();

      swift_bridgeObjectRelease();
    }
    sub_1A03B2FE0();
    swift_allocError();
    *(_QWORD *)v12 = v3;
    *(_QWORD *)(v12 + 8) = v5;
    *(_BYTE *)(v12 + 16) = v7;
    swift_willThrow();
  }
  return swift_release();
}

void Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)()
{
  OUTLINED_FUNCTION_32_0();
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1();
  Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)();
  OUTLINED_FUNCTION_10();
}

void Database.init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)()
{
  uint64_t v0;
  unsigned __int8 v1;
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
  unint64_t v14;
  sqlite3 **v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  sqlite3 *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  char v31;
  char v32;
  _BYTE v33[5];
  char v34;

  OUTLINED_FUNCTION_32_0();
  v10 = OUTLINED_FUNCTION_11_3(v3, v4, v5, v6, v7, v8, v9);
  v11 = OUTLINED_FUNCTION_65(v10);
  MEMORY[0x1E0C80A78](v11);
  OUTLINED_FUNCTION_21_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_20_1();
  OUTLINED_FUNCTION_28_0();
  MEMORY[0x1E0C80A78](v13);
  v14 = OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_17_1(v14);
  v15 = (sqlite3 **)MEMORY[0x1E0DEF810];
  sub_1A03ABCC4(&qword_1ED0CE740, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  v17 = v16;
  OUTLINED_FUNCTION_55(v16, v18, v19, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  v21 = v20;
  OUTLINED_FUNCTION_58((unint64_t *)&unk_1ED0CE730);
  v22 = OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_49(v22, *MEMORY[0x1E0DEF8D0]);
  *(_QWORD *)(v2 + 16) = OUTLINED_FUNCTION_10_1();
  if ((v21 & 2) != 0)
    OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_25_0();
  v24 = v23;
  v25 = sub_1A03D5BF4();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_26_0();
  OUTLINED_FUNCTION_60();
  OUTLINED_FUNCTION_25();
  if ((_DWORD)v24)
  {
    if (sqlite3_errmsg(*v15))
    {
      sub_1A03D5C54();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_4_3();
      *(_QWORD *)v26 = v24;
      *(_QWORD *)(v26 + 8) = v25;
    }
    else
    {
      sub_1A03BCD78();
      OUTLINED_FUNCTION_4_3();
      OUTLINED_FUNCTION_57();
      *(_QWORD *)v26 = v30;
      *(_QWORD *)(v26 + 8) = 0x80000001A03D9A10;
    }
    *(_QWORD *)(v26 + 16) = &qword_1ED0CE728;
    *(_QWORD *)(v26 + 24) = v17;
    *(_BYTE *)(v26 + 32) = v1;
    OUTLINED_FUNCTION_30_0();
    if (*v15)
      sqlite3_close(*v15);
    OUTLINED_FUNCTION_9_0();
    goto LABEL_20;
  }
  sub_1A03A23C4((uint64_t)&qword_1ED0CE728, v17, v1);
  v27 = *v15;
  if (!*v15)
    goto LABEL_20;
  OUTLINED_FUNCTION_76();
  v28 = OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_41_0(v28);
  *v15 = v27;
  if ((*(_QWORD *)v33 & 0x100000000) == 0)
    sqlite3_busy_timeout(v27, *(int *)v33);
  OUTLINED_FUNCTION_24_1();
  if (v0)
  {
    if ((v32 & 1) != 0
      && (OUTLINED_FUNCTION_71(),
          sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788),
          (OUTLINED_FUNCTION_50() & 1) != 0))
    {
      if (v34 == 10)
      {
        OUTLINED_FUNCTION_47();
        if (qword_1ED0CE030 != -1)
          swift_once();
        v29 = (id)qword_1ED0D0000;
        sub_1A03D5DE0();
        OUTLINED_FUNCTION_52();

        OUTLINED_FUNCTION_42_0();
        OUTLINED_FUNCTION_9_0();
        OUTLINED_FUNCTION_44();
        goto LABEL_20;
      }
      OUTLINED_FUNCTION_9_0();
      OUTLINED_FUNCTION_46();
    }
    else
    {
      OUTLINED_FUNCTION_9_0();
    }
    swift_willThrow();
    goto LABEL_20;
  }
  if ((v31 & 1) == 0)
  {
    OUTLINED_FUNCTION_33_0();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22_1((uint64_t)"PRAGMA cache_size = ");
    sub_1A03D6104();
    OUTLINED_FUNCTION_59();
    OUTLINED_FUNCTION_8_1();
    OUTLINED_FUNCTION_13_2();
    OUTLINED_FUNCTION_6_3();
    OUTLINED_FUNCTION_8_1();
  }
  OUTLINED_FUNCTION_34_0();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_13_2();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_8_1();
LABEL_20:
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_10();
}

_QWORD *sub_1A03BD854()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v9 = sub_1A03D5E04();
  v1 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1A03D5DF8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1A03D5A98();
  MEMORY[0x1E0C80A78](v6);
  v10 = sub_1A03A2AD8();
  v0[2] = 0;
  v0[3] = 0;
  sub_1A03D5A8C();
  v11 = MEMORY[0x1E0DEE9D8];
  sub_1A03ABCC4(&qword_1ED0CE740, v5, MEMORY[0x1E0DEF828]);
  sub_1A03A298C(0, &qword_1ED0CE728, v5, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A03A29E4((unint64_t *)&unk_1ED0CE730, &qword_1ED0CE728, v5);
  sub_1A03D5F00();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v9);
  v0[4] = sub_1A03D5E40();
  v0[2] = 0;
  swift_release();
  return v0;
}

void static Database.noop()()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_75();
  OUTLINED_FUNCTION_14();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.setUserVersion(_:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    if ((*(_QWORD *)(v2 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A03B3860();
    }
    else
    {
      swift_retain();
    }
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    sub_1A03D6104();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13_2();
    sub_1A03A2324(*(sqlite3 **)(v2 + 24));
    OUTLINED_FUNCTION_20_0();
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    sub_1A03BCD78();
    v3 = OUTLINED_FUNCTION_4_3();
    OUTLINED_FUNCTION_14_2(v3, v4);
  }
}

uint64_t Database.asyncRead<A>(block:)()
{
  uint64_t v0;

  sub_1A03D5A14();
  OUTLINED_FUNCTION_0();
  swift_weakInit();
  v0 = sub_1A03D59FC();
  swift_release();
  return v0;
}

void sub_1A03BDC24(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t Strong;
  _QWORD *v21;
  void (*v22)(_QWORD);
  void *v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(_QWORD);
  uint64_t v33;
  _QWORD aBlock[6];

  v32 = a3;
  v14 = sub_1A03D5A80();
  v31 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1A03D5A98();
  v29 = *(_QWORD *)(v17 - 8);
  v30 = v17;
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v28[1] = *(_QWORD *)(Strong + 32);
    v21 = (_QWORD *)swift_allocObject();
    v21[2] = a8;
    v21[3] = a6;
    v21[4] = a7;
    v21[5] = a1;
    v22 = v32;
    v21[6] = a2;
    v21[7] = v22;
    v21[8] = a4;
    aBlock[4] = sub_1A03BFCAC;
    aBlock[5] = v21;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A03BCDB4;
    aBlock[3] = &block_descriptor_12;
    v23 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A03D5A8C();
    v33 = MEMORY[0x1E0DEE9D8];
    v24 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
    sub_1A03ABCC4(&qword_1ED0CE6C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1A03A298C(0, &qword_1ED0CE708, v24, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
    sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v24);
    sub_1A03D5F00();
    MEMORY[0x1A1AF93B4](0, v19, v16, v23);
    _Block_release(v23);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v16, v14);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v30);
    swift_release();
    swift_release();
  }
  else
  {
    v25 = sub_1A03D59B4();
    sub_1A03ABCC4(&qword_1EE597778, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB35A0], MEMORY[0x1E0DB35A8]);
    v26 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x1E0DB3590], v25);
    v32(v26);

  }
}

uint64_t sub_1A03BDF04(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  char *v12;
  uint64_t v14;

  v9 = *(_QWORD *)(a7 - 8);
  v10 = (void (*)(void))MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10();
  a3(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a7);
}

uint64_t Database.write(_:block:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  OUTLINED_FUNCTION_32_0();
  v23 = v1;
  v24 = v2;
  v17 = v3;
  v4 = v0;
  v16 = v5;
  v7 = v6;
  v8 = sub_1A03D5A80();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v7) = *v7;
  v15 = *(_QWORD *)(v4 + 32);
  sub_1A03A298C(0, &qword_1ED0CDDB0, v9, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1A03D6820;
  sub_1A03D5A74();
  v22 = v13;
  sub_1A03ABCC4(&qword_1ED0CE6C0, v9, MEMORY[0x1E0DEF510]);
  sub_1A03A298C(0, &qword_1ED0CE708, v9, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v9);
  sub_1A03D5F00();
  v18 = v4;
  v19 = (char)v7;
  v20 = v16;
  v21 = v17;
  sub_1A03D5E10();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v8);
}

uint64_t sub_1A03BE174(uint64_t a1, char a2, void (*a3)(uint64_t))
{
  char v4;

  v4 = a2;
  return sub_1A03BE1A0((uint64_t)&v4, a1, a3);
}

uint64_t sub_1A03BE1A0(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    if ((*(_QWORD *)(v4 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A03B3860();
    }
    else
    {
      swift_retain();
    }
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    sub_1A03A3F88(0, v7, v8, v9);
    inited = swift_initStackObject();
    v11 = type metadata accessor for Connection();
    *(_QWORD *)(inited + 64) = v11;
    *(_QWORD *)(inited + 72) = &off_1E4374B70;
    v12 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(inited + 40) = v4;
    *(_QWORD *)(inited + 80) = v12;
    *(_BYTE *)(inited + 32) = 5;
    *(_QWORD *)(inited + 16) = 0x204E49474542;
    *(_QWORD *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A03A3B40();
    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A03A0928();
      v13 = swift_deallocClassInstance();
      a3(v13);
      v14 = swift_initStackObject();
      *(_QWORD *)(v14 + 64) = v11;
      *(_QWORD *)(v14 + 72) = &off_1E4374B70;
      *(_QWORD *)(v14 + 40) = v4;
      *(_QWORD *)(v14 + 80) = v12;
      *(_BYTE *)(v14 + 32) = 5;
      *(_QWORD *)(v14 + 16) = 0xD000000000000013;
      *(_QWORD *)(v14 + 24) = 0x80000001A03D9BE0;
      swift_retain();
      sub_1A03A3B40();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A03A0928();
    swift_deallocClassInstance();
    return swift_release();
  }
  else
  {
    sub_1A03BCD78();
    swift_allocError();
    *(_OWORD *)v5 = 0u;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_BYTE *)(v5 + 32) = 0;
    return swift_willThrow();
  }
}

uint64_t sub_1A03BE544(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(v2 + 16);
  if (v4)
  {
    v5 = v2;
    if ((*(_QWORD *)(v4 + 16) & 0x10) != 0)
    {
      swift_retain();
      sub_1A03B3860();
    }
    else
    {
      swift_retain();
    }
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    sub_1A03A3F88(0, v8, v9, v10);
    inited = swift_initStackObject();
    v12 = type metadata accessor for Connection();
    *(_QWORD *)(inited + 64) = v12;
    *(_QWORD *)(inited + 72) = &off_1E4374B70;
    v13 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(inited + 40) = v4;
    *(_QWORD *)(inited + 80) = v13;
    *(_BYTE *)(inited + 32) = 5;
    *(_QWORD *)(inited + 16) = 0x204E49474542;
    *(_QWORD *)(inited + 24) = 0xE600000000000000;
    swift_retain();
    sub_1A03A3B40();
    if (v3)
    {
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_setDeallocating();
      sub_1A03A0928();
      swift_deallocClassInstance();
      a2(v5);
      v14 = swift_initStackObject();
      *(_QWORD *)(v14 + 64) = v12;
      *(_QWORD *)(v14 + 72) = &off_1E4374B70;
      *(_QWORD *)(v14 + 40) = v4;
      *(_QWORD *)(v14 + 80) = MEMORY[0x1E0DEE9D8];
      *(_BYTE *)(v14 + 32) = 5;
      *(_QWORD *)(v14 + 16) = 0xD000000000000013;
      *(_QWORD *)(v14 + 24) = 0x80000001A03D9BE0;
      swift_retain();
      sub_1A03A3B40();
      swift_release();
      swift_bridgeObjectRelease();
    }
    swift_setDeallocating();
    sub_1A03A0928();
    swift_deallocClassInstance();
    return swift_release();
  }
  else
  {
    sub_1A03BCD78();
    swift_allocError();
    *(_OWORD *)v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(_BYTE *)(v6 + 32) = 0;
    return swift_willThrow();
  }
}

uint64_t Database.asyncWriteWithDatabase<A>(_:block:)()
{
  sub_1A03D5A14();
  return sub_1A03D59FC();
}

uint64_t sub_1A03BE978(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD aBlock[6];

  v31 = a7;
  v32 = a8;
  v30 = a6;
  v27 = a3;
  v28 = a1;
  v29 = a2;
  v26 = a9;
  v11 = sub_1A03D5A98();
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1A03D5A80();
  v15 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v16 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(_QWORD *)(a5 + 32);
  sub_1A03A298C(0, &qword_1ED0CDDB0, v15, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1A03D6820;
  sub_1A03D5A74();
  aBlock[0] = v19;
  sub_1A03ABCC4(&qword_1ED0CE6C0, v15, MEMORY[0x1E0DEF510]);
  sub_1A03A298C(0, &qword_1ED0CE708, v15, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEAEC8]);
  sub_1A03A29E4(&qword_1ED0CE710, &qword_1ED0CE708, v15);
  sub_1A03D5F00();
  v20 = swift_allocObject();
  swift_weakInit();
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v26;
  *(_QWORD *)(v21 + 24) = v20;
  *(_QWORD *)(v21 + 32) = v27;
  *(_QWORD *)(v21 + 40) = a4;
  *(_BYTE *)(v21 + 48) = v30;
  v22 = v32;
  *(_QWORD *)(v21 + 56) = v31;
  *(_QWORD *)(v21 + 64) = v22;
  v23 = v29;
  *(_QWORD *)(v21 + 72) = v28;
  *(_QWORD *)(v21 + 80) = v23;
  aBlock[4] = sub_1A03BFC28;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A03BCDB4;
  aBlock[3] = &block_descriptor_0;
  v24 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A03D5A8C();
  MEMORY[0x1A1AF93B4](0, v13, v18, v24);
  _Block_release(v24);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v14);
  swift_release();
  return swift_release();
}

void sub_1A03BEC40(uint64_t a1, void (*a2)(void *), uint64_t a3, char a4)
{
  uint64_t Strong;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    LOBYTE(v10) = a4;
    MEMORY[0x1E0C80A78](Strong);
    sub_1A03BE544((uint64_t)&v10, (void (*)(uint64_t))sub_1A03BFC58);
    swift_release();
  }
  else
  {
    v7 = sub_1A03D59B4();
    sub_1A03ABCC4(&qword_1EE597778, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB35A0], MEMORY[0x1E0DB35A8]);
    v8 = (void *)swift_allocError();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(v9, *MEMORY[0x1E0DB3590], v7);
    a2(v8);

  }
}

uint64_t sub_1A03BEEA8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *), uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t result;
  uint64_t v15;

  v9 = *(_QWORD *)(a6 - 8);
  v10 = MEMORY[0x1E0C80A78]();
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = v13(v10);
  if (!v6)
  {
    a4(v12);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a6);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.checkpoint()()
{
  sub_1A03BF170();
}

uint64_t sub_1A03BEF64(int a1, sqlite3 *db)
{
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  v2 = sqlite3_wal_checkpoint_v2(db, 0, 3, 0, 0);
  v3 = sub_1A03AE798(v2);
  v5 = v4;
  v7 = v6;
  if ((sub_1A03AED70(v3, v4, v6) & 1) != 0)
    return sub_1A03AE590(v3, v5, v7);
  if (v7 != 29 || __PAIR128__(v5, v3) >= 3)
  {
    if (qword_1ED0CE030 != -1)
      swift_once();
    v9 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    sub_1A03A00AC();
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_1A03D6810;
    sub_1A03D6008();
    v11 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v10 + 56) = MEMORY[0x1E0DEA968];
    v12 = sub_1A03A0110();
    *(_QWORD *)(v10 + 32) = 0;
    *(_QWORD *)(v10 + 40) = 0xE000000000000000;
    *(_QWORD *)(v10 + 96) = v11;
    *(_QWORD *)(v10 + 104) = v12;
    *(_QWORD *)(v10 + 64) = v12;
    *(_QWORD *)(v10 + 72) = 0x696F706B63656863;
    *(_QWORD *)(v10 + 80) = 0xEA0000000000746ELL;
    sub_1A03D5A2C();

    swift_bridgeObjectRelease();
  }
  sub_1A03B2FE0();
  swift_allocError();
  *(_QWORD *)v13 = v3;
  *(_QWORD *)(v13 + 8) = v5;
  *(_BYTE *)(v13 + 16) = v7;
  return swift_willThrow();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.incrementalVacuum()()
{
  sub_1A03BF170();
}

uint64_t sub_1A03BF170()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = OUTLINED_FUNCTION_72();
  if (*(_QWORD *)(v0 + 24))
  {
    v2 = *(_QWORD *)(v0 + 16);
    if (v2)
    {
      if ((*(_QWORD *)(v2 + 16) & 0x10) != 0)
        v1 = sub_1A03B3860();
    }
    MEMORY[0x1E0C80A78](v1);
    sub_1A03D5E1C();
    return swift_release();
  }
  else
  {
    sub_1A03BCD78();
    OUTLINED_FUNCTION_4_3();
    *(_OWORD *)v3 = xmmword_1A03D7520;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = 0;
    *(_BYTE *)(v3 + 32) = 0;
    return OUTLINED_FUNCTION_30_0();
  }
}

uint64_t sub_1A03BF278@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_1A03BF284(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

BOOL sub_1A03BF294(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

BOOL sub_1A03BF2A0(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

uint64_t sub_1A03BF2AC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_1A03BF2D0(uint64_t a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t *v4;

  sub_1A03BDC24(a1, a2, a3, a4, v4[3], v4[4], v4[5], v4[2]);
}

uint64_t sub_1A03BF2DC()
{
  uint64_t v0;

  return sub_1A03BE174(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(void (**)(uint64_t))(v0 + 32));
}

void sub_1A03BF2FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_1A03BE978(a1, a2, a3, a4, *(_QWORD *)(v4 + 24), *(unsigned __int8 *)(v4 + 32), *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48), *(_QWORD *)(v4 + 16));
  OUTLINED_FUNCTION_64();
}

uint64_t sub_1A03BF324()
{
  uint64_t v0;

  return sub_1A03BEF64(*(_QWORD *)(v0 + 16), *(sqlite3 **)(v0 + 24));
}

void sub_1A03BF33C()
{
  uint64_t v0;

  sub_1A03A2324(*(sqlite3 **)(v0 + 24));
}

unint64_t sub_1A03BF370()
{
  unint64_t result;

  result = qword_1EE597760;
  if (!qword_1EE597760)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Database.JournalingMode, &type metadata for Database.JournalingMode);
    atomic_store(result, (unint64_t *)&qword_1EE597760);
  }
  return result;
}

unint64_t sub_1A03BF3B0()
{
  unint64_t result;

  result = qword_1EE597768;
  if (!qword_1EE597768)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Database.RecoveryMode, &type metadata for Database.RecoveryMode);
    atomic_store(result, (unint64_t *)&qword_1EE597768);
  }
  return result;
}

unint64_t sub_1A03BF3F0()
{
  unint64_t result;

  result = qword_1EE597770;
  if (!qword_1EE597770)
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Database.VacuumMode, &type metadata for Database.VacuumMode);
    atomic_store(result, (unint64_t *)&qword_1EE597770);
  }
  return result;
}

uint64_t method lookup function for Database()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v7 + 104))(a1, a2, a3, a4, a5, a6, a7 | ((HIDWORD(a7) & 1) << 32));
}

uint64_t dispatch thunk of Database.__allocating_init(location:assertions:journalingMode:recoveryMode:cacheSize:vacuumMode:busyTimeout:connectionMode:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, unint64_t))(v7 + 112))(a1, a2, a3, a4, a5, a6, a7 | ((HIDWORD(a7) & 1) << 32));
}

uint64_t destroy for Database.Location(uint64_t a1)
{
  return sub_1A03A23C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t assignWithCopy for Database.Location(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A03A0094(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1A03A23C4(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for Database.Location(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1A03A23C4(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Database.Location(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Database.Location(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1A03BF5BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

unint64_t destroy for Database.Errors(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    return sub_1A03A23C4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
  }
  return result;
}

uint64_t initializeWithCopy for Database.Errors(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  __int128 v7;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    v7 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v7;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    v4 = *(_QWORD *)(a2 + 16);
    v5 = *(_QWORD *)(a2 + 24);
    v6 = *(_BYTE *)(a2 + 32);
    swift_bridgeObjectRetain();
    sub_1A03A0094(v4, v5, v6);
    *(_QWORD *)(a1 + 16) = v4;
    *(_QWORD *)(a1 + 24) = v5;
    *(_BYTE *)(a1 + 32) = v6;
  }
  return a1;
}

uint64_t assignWithCopy for Database.Errors(uint64_t a1, __int128 *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;

  v4 = *((_QWORD *)a2 + 1);
  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      v11 = *((_QWORD *)a2 + 2);
      v12 = *((_QWORD *)a2 + 3);
      v13 = *((_BYTE *)a2 + 32);
      swift_bridgeObjectRetain();
      sub_1A03A0094(v11, v12, v13);
      *(_QWORD *)(a1 + 16) = v11;
      *(_QWORD *)(a1 + 24) = v12;
      *(_BYTE *)(a1 + 32) = v13;
      return a1;
    }
LABEL_7:
    v14 = *a2;
    v15 = a2[1];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_OWORD *)a1 = v14;
    *(_OWORD *)(a1 + 16) = v15;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    sub_1A03A23C4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
    goto LABEL_7;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *((_QWORD *)a2 + 2);
  v6 = *((_QWORD *)a2 + 3);
  v7 = *((_BYTE *)a2 + 32);
  sub_1A03A0094(v5, v6, v7);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v10 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v7;
  sub_1A03A23C4(v8, v9, v10);
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

uint64_t assignWithTake for Database.Errors(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  __int128 v9;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    sub_1A03A23C4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_BYTE *)(a1 + 32));
LABEL_5:
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v9;
    *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v8 = *(_BYTE *)(a1 + 32);
  *(_BYTE *)(a1 + 32) = v5;
  sub_1A03A23C4(v6, v7, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for Database.Errors(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Database.Errors(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_1A03BF8EC(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_1A03BF904(uint64_t result, int a2)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
  }
  else if (a2)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  return result;
}

void type metadata accessor for Database.Errors()
{
  OUTLINED_FUNCTION_18_2();
}

uint64_t getEnumTagSinglePayload for Database.RecoveryMode(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFF)
  {
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
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Database.RecoveryMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03BFA14 + 4 * byte_1A03D72A9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A03BFA48 + 4 * byte_1A03D72A4[v4]))();
}

uint64_t sub_1A03BFA48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BFA50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03BFA58);
  return result;
}

uint64_t sub_1A03BFA64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03BFA6CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A03BFA70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BFA78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s5TeaDB8DatabaseC14JournalingModeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03BFAE4 + 4 * byte_1A03D72B3[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A03BFB18 + 4 * byte_1A03D72AE[v4]))();
}

uint64_t sub_1A03BFB18(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BFB20(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03BFB28);
  return result;
}

uint64_t sub_1A03BFB34(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03BFB3CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A03BFB40(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03BFB48(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTagSinglePayload for Database.ConnectionMode(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Database.ConnectionMode(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_1A03BFBA4(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A03BFBC0(uint64_t result, int a2)
{
  char v2;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    v2 = 1;
  }
  else
  {
    v2 = 0;
  }
  *(_BYTE *)(result + 8) = v2;
  return result;
}

void type metadata accessor for Database.ConnectionMode()
{
  OUTLINED_FUNCTION_18_2();
}

uint64_t sub_1A03BFBEC()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1A03BFC28()
{
  uint64_t v0;

  sub_1A03BEC40(*(_QWORD *)(v0 + 24), *(void (**)(void *))(v0 + 32), *(_QWORD *)(v0 + 40), *(_BYTE *)(v0 + 48));
  OUTLINED_FUNCTION_64();
}

uint64_t sub_1A03BFC58(uint64_t a1)
{
  uint64_t v1;

  return sub_1A03BEEA8(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A03BFC78()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03BFCAC()
{
  uint64_t v0;

  return sub_1A03BDF04(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(char *))(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16));
}

uint64_t sub_1A03BFCC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03BFCE4()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  sqlite3 *v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 104) = *(_DWORD *)(v1 - 188);
  return sub_1A03A2B14((_BYTE *)(v1 - 104), v0);
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 120);
  *(_QWORD *)(v0 - 104) = *(_QWORD *)(v0 - 128);
  *(_QWORD *)(v0 - 96) = v1;
  *(_BYTE *)(v0 - 88) = *(_DWORD *)(v0 - 108);
  return sub_1A03A23DC();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  const char *v0;
  sqlite3 **v1;

  return sqlite3_open_v2(v0, v1, 65542, 0);
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  sqlite3 *v0;
  char v1;
  uint64_t v2;

  *(_BYTE *)(v2 - 104) = v1;
  return sub_1A03A2B14((_BYTE *)(v2 - 104), v0);
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0xE000000000000000;
  return sub_1A03D5F30();
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 104) = 0;
  *(_QWORD *)(v0 - 96) = 0xE000000000000000;
  return sub_1A03D5F30();
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return sub_1A03D5A2C();
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return sub_1A03D61B8();
}

uint64_t OUTLINED_FUNCTION_41_0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v1;
  *v2 = a1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_1A03BD27C();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  unsigned __int8 v0;
  uint64_t v1;
  uint64_t v2;

  return sub_1A03A0094(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_46()
{
  uint64_t v0;
  uint64_t v1;
  unsigned __int8 v2;

  return sub_1A03AE590(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_47()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1A03AE590(v0, v1, 0xAu);
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 144) + 104))(v2, a2, *(_QWORD *)(v3 - 136));
}

uint64_t OUTLINED_FUNCTION_50()
{
  return swift_dynamicCast();
}

id OUTLINED_FUNCTION_51(__n128 *a1, __n128 a2)
{
  void *v2;

  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_52()
{
  return sub_1A03D5A2C();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return sub_1A03D61AC();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_1A03D61B8();
}

void OUTLINED_FUNCTION_55(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  unint64_t *v4;
  uint64_t (*v5)(uint64_t);

  sub_1A03A298C(0, v4, v5, a4);
}

char *OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  return &a19;
}

void OUTLINED_FUNCTION_58(unint64_t *a1)
{
  unint64_t *v1;
  uint64_t (*v2)(uint64_t);

  sub_1A03A29E4(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_1A03D5C48();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_61()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = v0;
  return sub_1A03B3860();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_1A03D6008();
}

uint64_t OUTLINED_FUNCTION_65(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 144) = *(_QWORD *)(result - 8);
  *(_QWORD *)(v1 - 136) = result;
  return result;
}

unint64_t OUTLINED_FUNCTION_69()
{
  return sub_1A03BCD78();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_1A03D61C4();
}

id OUTLINED_FUNCTION_71()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 72) = v0;
  return v0;
}

void OUTLINED_FUNCTION_73()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 32) = v0;
  *(_QWORD *)(v1 + 40) = v2;
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_1A03A23DC();
}

_QWORD *OUTLINED_FUNCTION_75()
{
  return sub_1A03BD854();
}

uint64_t OUTLINED_FUNCTION_76()
{
  return type metadata accessor for Connection();
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_1A03D5A2C();
}

uint64_t sub_1A03C0014()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A03C0040()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t != infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_16_2(v0 | 0x1000000000000000);
  return OUTLINED_FUNCTION_0_7();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_8();
  v3 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  *(_QWORD *)(v3 + 32) = v0;
  OUTLINED_FUNCTION_21_2(v3 | 0x9000000000000000);
  return OUTLINED_FUNCTION_9_3();
}

uint64_t > infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_16_2(v0 | 0x2000000000000000);
  return OUTLINED_FUNCTION_0_7();
}

uint64_t >= infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_16_2(v0 | 0x3000000000000000);
  return OUTLINED_FUNCTION_0_7();
}

uint64_t < infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_16_2(v0 | 0x4000000000000000);
  return OUTLINED_FUNCTION_0_7();
}

uint64_t <= infix(_:_:)()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_8();
  v1 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_1_4(v1);
  OUTLINED_FUNCTION_16_2(v0 | 0x5000000000000000);
  return OUTLINED_FUNCTION_0_7();
}

uint64_t sub_1A03C01CC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t || infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *a1;
  v3 = *a2;
  v4 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  OUTLINED_FUNCTION_17_2(v4 | 0x7000000000000000);
  return OUTLINED_FUNCTION_8_3();
}

_QWORD *initializeBufferWithCopyOfBuffer for Expression(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for Expression(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for Expression(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Expression(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x77 && *(_BYTE *)(a1 + 8))
    {
      v2 = *(_DWORD *)a1 + 118;
    }
    else
    {
      v2 = ((*(_QWORD *)a1 >> 60) & 0x8F | (16 * (*(_QWORD *)a1 & 7))) ^ 0x7F;
      if (v2 >= 0x76)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t storeEnumTagSinglePayload for Expression(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x76)
  {
    *(_QWORD *)result = a2 - 119;
    if (a3 >= 0x77)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x77)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 4) & 7 | (8 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_1A03C0380(_QWORD *a1)
{
  return *a1 >> 60;
}

_QWORD *sub_1A03C038C(_QWORD *result)
{
  *result &= 0xFFFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return sub_1A03B2888();
}

BOOL static StatementOperation.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t StatementOperation.hash(into:)()
{
  return sub_1A03D61B8();
}

uint64_t StatementOperation.hashValue.getter()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

unint64_t sub_1A03C0438()
{
  unint64_t result;

  result = qword_1EE597780[0];
  if (!qword_1EE597780[0])
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for StatementOperation, &type metadata for StatementOperation);
    atomic_store(result, qword_1EE597780);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for StatementOperation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1A03C04C0 + 4 * byte_1A03D7575[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1A03C04F4 + 4 * byte_1A03D7570[v4]))();
}

uint64_t sub_1A03C04F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03C04FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03C0504);
  return result;
}

uint64_t sub_1A03C0510(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03C0518);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1A03C051C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03C0524(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StatementOperation()
{
  return &type metadata for StatementOperation;
}

uint64_t sub_1A03C0540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  __int128 v19[2];
  unint64_t v20;
  char v21;

  v6 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  OUTLINED_FUNCTION_0_8(a1, a2, *(_QWORD *)(v6 + 24), a4);
  v21 = 4;
  v20 = 0xF000000000000007;
  OUTLINED_FUNCTION_15_4();
  v9 = OUTLINED_FUNCTION_6_4(v7, v8);
  OUTLINED_FUNCTION_12_3(v9, v10, v11, v12);
  v13 = OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_8_4(v13, (uint64_t)v19);
  v16 = OUTLINED_FUNCTION_9_4(&v21, v14, v15, v19);
  OUTLINED_FUNCTION_13_4(v16);
  result = OUTLINED_FUNCTION_11_5();
  if (!v5)
  {
    *(_QWORD *)&v19[0] = v6;
    v18 = OUTLINED_FUNCTION_14_4();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v18);
    sub_1A03D5DA4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t Query.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t dispatch thunk of QueryValueType.queryValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for Query()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Query.first(orderBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

_QWORD *assignWithCopy for ValueOf(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ValueOf(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ValueOf(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for ValueOf(uint64_t result, int a2, int a3)
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

uint64_t sub_1A03C075C(uint64_t result, unint64_t a2, char a3)
{
  if (a3 != -1)
    return sub_1A03ADE98(result, a2, a3);
  return result;
}

uint64_t sub_1A03C0770(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t LazyJSON.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_1_7();
  LazyJSON.init(value:)(a1);
  return v2;
}

uint64_t LazyJSON.init(value:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for LazyLoader(0, v4, *(_QWORD *)(v8 + 88), *(_QWORD *)(v8 + 96));
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = LazyLoader.__allocating_init(object:)((uint64_t)v7);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(_QWORD *)(v2 + 16) = v9;
  return v2;
}

uint64_t sub_1A03C0868()
{
  uint64_t v0;

  sub_1A03B0014(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  return swift_deallocObject();
}

uint64_t LazyJSON.valueType.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v3 = MEMORY[0x1E0C80A78](a1);
  LazyLoader.load()(v3, (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1A03D57EC();
  swift_allocObject();
  sub_1A03D57E0();
  v5 = sub_1A03D57D4();
  v7 = v6;
  OUTLINED_FUNCTION_2_7();
  result = swift_release();
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v7;
  *(_BYTE *)(a2 + 16) = 4;
  return result;
}

uint64_t sub_1A03C0984(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x726564616F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A03C0A00()
{
  return 0x726564616F6CLL;
}

uint64_t sub_1A03C0A14()
{
  return sub_1A03A63E8();
}

uint64_t sub_1A03C0A20()
{
  return sub_1A03B7314();
}

uint64_t sub_1A03C0A30()
{
  return sub_1A03B72F0();
}

uint64_t sub_1A03C0A40()
{
  sub_1A03D61AC();
  sub_1A03B72F0();
  return sub_1A03D61C4();
}

uint64_t sub_1A03C0A84()
{
  return sub_1A03C0A00();
}

uint64_t sub_1A03C0A94@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03C0984(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A03C0AC8()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03C0AEC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03A63E8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A03C0B20(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D7878, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03C0B54(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D7878, a1);
  return sub_1A03D6230();
}

uint64_t LazyJSON.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 80);
  v13 = *(_QWORD *)(*v2 + 88);
  v14 = v5;
  v6 = *(_QWORD *)(v4 + 96);
  v7 = type metadata accessor for LazyJSON.CodingKeys(255, v5, v13, v6);
  MEMORY[0x1A1AF9BC4](&unk_1A03D7878, v7);
  v8 = sub_1A03D60F8();
  v15 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  v16 = v2[2];
  v11 = type metadata accessor for LazyLoader(0, v14, v13, v6);
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyLoader<A>, v11);
  sub_1A03D60EC();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v8);
}

uint64_t type metadata accessor for LazyJSON.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyJSON.CodingKeys);
}

uint64_t LazyJSON.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  LazyJSON.init(from:)(a1);
  return v2;
}

_QWORD *LazyJSON.init(from:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = *(_QWORD *)(*v1 + 88);
  v8 = *(_QWORD *)(*v1 + 80);
  v6 = *(_QWORD *)(*v1 + 96);
  v3 = type metadata accessor for LazyJSON.CodingKeys(255, v8, v7, v6);
  MEMORY[0x1A1AF9BC4](&unk_1A03D7878, v3);
  v9 = sub_1A03D60B0();
  MEMORY[0x1E0C80A78](v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6200();
  if (v10)
  {
    swift_deallocPartialClassInstance();
  }
  else
  {
    v4 = type metadata accessor for LazyLoader(0, v8, v7, v6);
    MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyLoader<A>, v4);
    sub_1A03D60A4();
    OUTLINED_FUNCTION_0_10();
    v1[2] = v11;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v1;
}

uint64_t sub_1A03C0EB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return LazyJSON.valueType.getter(a1, a2);
}

uint64_t sub_1A03C0ED8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = LazyJSON.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1A03C0F00(_QWORD *a1)
{
  return LazyJSON.encode(to:)(a1);
}

uint64_t method lookup function for LazyJSON()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(valueType:connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyJSON.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A03C0F54(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03C0F94 + 4 * byte_1A03D76E8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03C0FB4 + 4 * byte_1A03D76ED[v4]))();
}

_BYTE *sub_1A03C0F94(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03C0FB4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03C0FBC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03C0FC4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03C0FCC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03C0FD4(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_1A03C0FE0()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03C0FF0()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03C1000()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03C1010()
{
  type metadata accessor for Store.Promises();
}

void sub_1A03C104C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  v10 = sub_1A03D5EC4();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(&a9, v9, v10);
  sub_1A03C1100();
}

void sub_1A03C108C()
{
  swift_beginAccess();
  OUTLINED_FUNCTION_1_8();
}

void sub_1A03C10D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
  OUTLINED_FUNCTION_23();
}

void type metadata accessor for Store.Promises()
{
  JUMPOUT(0x1A1AF9B88);
}

void sub_1A03C1100()
{
  swift_beginAccess();
  OUTLINED_FUNCTION_1_8();
}

void sub_1A03C1148(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 40))(v2, v1, a1);
  swift_endAccess();
  OUTLINED_FUNCTION_23();
}

void Store.__allocating_init(database:)(uint64_t a1)
{
  swift_allocObject();
  Store.init(database:)(a1);
}

void sub_1A03C11A8()
{
  OUTLINED_FUNCTION_16_3();
}

void Store.init(database:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1[4] = 0;
  v3 = *v1;
  *((_BYTE *)v1 + 40) = 1;
  v1[2] = a1;
  v4 = *(_QWORD *)(v3 + 88);
  v5 = *(_QWORD *)(v3 + 112);
  swift_retain();
  v7 = Database.table<A>(_:)(v4, v4, v5, v6);
  if (v2)
  {
    swift_release();
    swift_release();
    OUTLINED_FUNCTION_7_7();
  }
  v1[3] = v7;
  swift_retain();
  sub_1A03A3394();
  swift_beginAccess();
  OUTLINED_FUNCTION_7_7();
}

void sub_1A03C12C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 40))(v3, v6 - 136, a1);
  v7 = swift_endAccess();
  MEMORY[0x1E0C80A78](v7);
  sub_1A03D5A20();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v4;
  v8[3] = v2;
  v8[4] = *(_QWORD *)(v6 - 72);
  v8[5] = v5;
  v8[6] = v1;
  v9 = (void *)sub_1A03D59E4();
  sub_1A03D59F0();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  JUMPOUT(0x1A03C138CLL);
}

uint64_t sub_1A03C13B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v5;

  v5 = 0;
  swift_retain();
  v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A03C2FC4, a2);
  swift_release();
  return v3;
}

uint64_t sub_1A03C1414()
{
  uint64_t v0;

  return sub_1A03C13B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1A03C142C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;

  sub_1A03A6FDC(a1, a2, a3, a4);
  v4 = sub_1A03A63E8();
  sub_1A03A63F0(v4 & 1);
  return swift_release();
}

uint64_t sub_1A03C148C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  if (qword_1ED0CE030 != -1)
    swift_once();
  v0 = (id)qword_1ED0D0000;
  sub_1A03D5DD4();
  sub_1A03A00AC();
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_1A03D6810;
  v2 = sub_1A03D623C();
  v4 = v3;
  v5 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v1 + 56) = MEMORY[0x1E0DEA968];
  v6 = sub_1A03A0110();
  *(_QWORD *)(v1 + 64) = v6;
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v4;
  sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
  sub_1A03D6008();
  *(_QWORD *)(v1 + 96) = v5;
  *(_QWORD *)(v1 + 104) = v6;
  *(_QWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0xE000000000000000;
  sub_1A03D5A2C();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03C15E4()
{
  return swift_deallocObject();
}

uint64_t sub_1A03C15F4()
{
  return sub_1A03C148C();
}

void sub_1A03C1604()
{
  OUTLINED_FUNCTION_13_5();
  Database.read<A>(block:)();
  OUTLINED_FUNCTION_16_3();
}

uint64_t sub_1A03C1658@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];

  v4 = *a1;
  sub_1A03A5C98();
  v9 = sub_1A039FC78(v5, v6, v7, v8);
  result = swift_release();
  if (!v2)
  {
    v24[2] = v9;
    v11 = sub_1A03C17F4();
    v12 = MEMORY[0x1E0C80A78](v11);
    v19 = *(_QWORD *)(v4 + 80);
    v20 = *(_OWORD *)(v4 + 88);
    v21 = *(_OWORD *)(v4 + 104);
    v22 = v12;
    v23 = v13;
    v14 = sub_1A03D5D50();
    v15 = sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
    v16 = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v14);
    v17 = sub_1A03D2B08((void (*)(char *, uint64_t))sub_1A03C2F6C, (uint64_t)&v18, v14, v19, v15, v16, MEMORY[0x1E0DEDB38], (uint64_t)v24);
    swift_release();
    result = swift_bridgeObjectRelease();
    *a2 = v17;
  }
  return result;
}

uint64_t sub_1A03C17DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;

  return sub_1A03C1658(v1, a1);
}

uint64_t (*sub_1A03C17F4())()
{
  swift_retain();
  return sub_1A03C2FB0;
}

uint64_t sub_1A03C1824()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t result;

  sub_1A03D57EC();
  swift_allocObject();
  sub_1A03D57E0();
  v1 = sub_1A03D57D4();
  v3 = v2;
  result = swift_release();
  if (!v0)
  {
    sub_1A03D5960();
    swift_allocObject();
    sub_1A03D5954();
    sub_1A03D5948();
    swift_release();
    return sub_1A03B0014(v1, v3);
  }
  return result;
}

void sub_1A03C190C(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = v2;
  v23 = a2;
  v20 = *v4;
  v6 = *(_QWORD *)(v20 + 88);
  v7 = sub_1A03D5EC4();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v19 - v10;
  v12 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *a1;
  v21 = v4;
  v22 = v15;
  Database.read<A>(block:)();
  if (!v3)
  {
    v16 = v23;
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6) == 1)
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      v17 = 1;
      v18 = v16;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, v6);
      sub_1A03C1824();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v6);
      v17 = 0;
      v18 = v16;
    }
    __swift_storeEnumTagSinglePayload(v18, v17, 1, *(_QWORD *)(v20 + 80));
  }
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1A03C1A80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[2];
  char v7;
  uint64_t v8;

  sub_1A03A5C98();
  v8 = a2;
  v6[0] = 0;
  v6[1] = 0;
  v7 = -1;
  sub_1A03A02D8(&v8, (uint64_t)v6, v3, v4);
  return swift_release();
}

uint64_t sub_1A03C1AF4()
{
  uint64_t v0;

  return sub_1A03C1A80(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1A03C1B0C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  OUTLINED_FUNCTION_13_5();
  result = Database.read<A>(block:)();
  if (!v0)
    return v2;
  return result;
}

uint64_t sub_1A03C1B78@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t (*v9)();
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[2];
  char v23;
  uint64_t v24;

  v6 = *a1;
  sub_1A03A5C98();
  v24 = a2;
  v22[0] = 0;
  v22[1] = 0;
  v23 = -1;
  v7 = sub_1A03A6044(&v24, (uint64_t)v22, 0, 1);
  result = swift_release();
  if (!v3)
  {
    v22[0] = v7;
    v9 = sub_1A03C1D38();
    v10 = MEMORY[0x1E0C80A78](v9);
    v17 = *(_QWORD *)(v6 + 80);
    v18 = *(_OWORD *)(v6 + 88);
    v19 = *(_OWORD *)(v6 + 104);
    v20 = v10;
    v21 = v11;
    v12 = sub_1A03D5D50();
    v13 = sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
    v14 = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v12);
    v15 = sub_1A03D2B08((void (*)(char *, uint64_t))sub_1A03C2F6C, (uint64_t)&v16, v12, v17, v13, v14, MEMORY[0x1E0DEDB38], (uint64_t)&v24);
    swift_release();
    result = swift_bridgeObjectRelease();
    *a3 = v15;
  }
  return result;
}

uint64_t sub_1A03C1D20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1A03C1B78(*(uint64_t **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t (*sub_1A03C1D38())()
{
  swift_retain();
  return sub_1A03C2FDC;
}

uint64_t sub_1A03C1D68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t result;

  v6 = *v2;
  result = OUTLINED_FUNCTION_2_8();
  if (!v3)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v6 + 80) - 8) + 16))(a2, a1);
  return result;
}

void sub_1A03C1DDC()
{
  uint64_t v0;

  sub_1A03C220C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)sub_1A03AB8B4, (void (*)(char *))sub_1A03AD538);
}

uint64_t sub_1A03C1E04()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t result;

  sub_1A03D57EC();
  swift_allocObject();
  sub_1A03D57E0();
  v1 = sub_1A03D57D4();
  v3 = v2;
  result = swift_release();
  if (!v0)
  {
    sub_1A03D5960();
    swift_allocObject();
    sub_1A03D5954();
    sub_1A03D5948();
    swift_release();
    return sub_1A03B0014(v1, v3);
  }
  return result;
}

uint64_t sub_1A03C1EEC(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_2_8();
  if (!v1)
    swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A03C1F3C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  uint64_t result;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = v2;
  v22 = *(_QWORD *)(*a2 + 88);
  v21 = *(_QWORD *)(v22 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(v9 + 80);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v6);
  v14 = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[0] = v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v20 - v15;
  swift_bridgeObjectRetain();
  v17 = sub_1A03D5CE4();
  v24 = v17;
  if (v17 != MEMORY[0x1A1AF92C4](a1, v10))
  {
    v20[1] = a2[3];
    v20[2] = a2;
    while (1)
    {
      v18 = sub_1A03D5D20();
      sub_1A03D5D08();
      if ((v18 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v16, a1+ ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80))+ *(_QWORD *)(v11 + 72) * v17, v10);
      }
      else
      {
        result = sub_1A03D5F48();
        if (v20[0] != 8)
        {
          __break(1u);
          return result;
        }
        v23 = result;
        (*(void (**)(char *, uint64_t *, uint64_t))(v11 + 16))(v16, &v23, v10);
        swift_unknownObjectRelease();
      }
      swift_bridgeObjectRetain();
      MEMORY[0x1A1AF92D0](&v24, a1, v10);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v16, v10);
      sub_1A03AB8B4();
      sub_1A03C1E04();
      if (v3)
        break;
      sub_1A03AD538((uint64_t)v8);
      v3 = 0;
      swift_release();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v8, v22);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
      v17 = v24;
      if (v17 == MEMORY[0x1A1AF92C4](a1, v10))
        return swift_bridgeObjectRelease();
    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03C21B8()
{
  uint64_t v0;

  return sub_1A03C1F3C(*(_QWORD *)(v0 + 16), *(_QWORD **)(v0 + 24));
}

uint64_t sub_1A03C21D0()
{
  return OUTLINED_FUNCTION_2_8();
}

void sub_1A03C220C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(void);
  uint64_t v11;

  v6 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](a1);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10();
  sub_1A03C1E04();
  if (!v4)
  {
    a4(v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  swift_release();
  OUTLINED_FUNCTION_10();
}

void sub_1A03C22D0()
{
  uint64_t v0;

  sub_1A03C220C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (uint64_t)sub_1A03B454C, (void (*)(char *))sub_1A03C46FC);
}

uint64_t sub_1A03C22F8()
{
  return OUTLINED_FUNCTION_2_8();
}

uint64_t sub_1A03C2338(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  sub_1A03B454C();
  sub_1A03C480C(a2, a3, v5, v6);
  return swift_release();
}

uint64_t sub_1A03C2390()
{
  uint64_t *v0;

  return sub_1A03C2338(v0[2], v0[3], v0[4]);
}

uint64_t sub_1A03C23AC()
{
  return Database.write(_:block:)();
}

uint64_t sub_1A03C23E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1A03B454C();
  sub_1A03A0660(v0, v1, v2, v3);
  return swift_release();
}

uint64_t sub_1A03C2420()
{
  return sub_1A03C23E0();
}

void Store.Promises.all()()
{
  sub_1A03D5D50();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_14_5();
}

uint64_t sub_1A03C249C(void (*a1)(uint64_t *))
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C1604();
    v4 = v3;
    swift_release();
    v5 = v4;
    a1(&v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03C2550(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A03C2D58(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C249C);
}

uint64_t Store.Promises.first(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1A03C268C(a1, a2, (void (*)(uint64_t, _QWORD))MEMORY[0x1E0DEB940]);
}

uint64_t sub_1A03C2570(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  v8 = sub_1A03D5EC4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v13 - v10;
  result = swift_weakLoadStrong();
  if (result)
  {
    v14 = a6;
    sub_1A03C190C(&v14, (uint64_t)v11);
    swift_release();
    a1(v11);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C266C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C2A1C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2570);
}

uint64_t Store.Promises.filter(_:)(uint64_t a1, uint64_t a2)
{
  return sub_1A03C268C(a1, a2, (void (*)(uint64_t, _QWORD))MEMORY[0x1E0DEAEC8]);
}

uint64_t sub_1A03C268C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, _QWORD))
{
  a3(255, *(_QWORD *)(a2 + 16));
  OUTLINED_FUNCTION_38();
  return sub_1A03D59FC();
}

uint64_t sub_1A03C2708(void (*a1)(uint64_t *))
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = sub_1A03C1B0C();
    swift_release();
    v4 = v3;
    a1(&v4);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C27C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C2A1C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2708);
}

void Store.Promises.save(_:)()
{
  sub_1A03D5A14();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_9_5();
}

{
  sub_1A03D5D50();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_4_7();
  OUTLINED_FUNCTION_41();
  OUTLINED_FUNCTION_9_5();
}

uint64_t sub_1A03C2818(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;

  v10 = *(_QWORD *)(a7 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C1D68(a6, (uint64_t)v12);
    swift_release();
    a1(v12);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a7);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C2904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C2A1C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2818);
}

uint64_t sub_1A03C2958(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v9;

  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C1EEC(a6);
    swift_release();
    v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C2A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C2A1C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2958);
}

void sub_1A03C2A1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  OUTLINED_FUNCTION_0_11(a1, a2, a3, a4, a5);
  OUTLINED_FUNCTION_15_5();
}

void Store.Promises.delete(_:)()
{
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_14_5();
}

{
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_14_5();
}

uint64_t sub_1A03C2A7C(uint64_t (*a1)(uint64_t))
{
  uint64_t result;
  uint64_t v3;

  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C21D0();
    v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C2B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C2A1C(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2A7C);
}

uint64_t sub_1A03C2B80(uint64_t (*a1)(uint64_t))
{
  uint64_t result;
  uint64_t v3;

  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C22F8();
    v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A03C2C38(uint64_t (*a1)(uint64_t))
{
  sub_1A03C2B80(a1);
  OUTLINED_FUNCTION_15_5();
}

uint64_t Store.Promises.deleteAll()()
{
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_31();
  return OUTLINED_FUNCTION_12_4();
}

uint64_t sub_1A03C2CB4(uint64_t (*a1)(uint64_t))
{
  uint64_t result;
  uint64_t v3;

  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03C23AC();
    v3 = swift_release();
    return a1(v3);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03C2D4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A03C2D58(a1, a2, a3, a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A03C2CB4);
}

uint64_t sub_1A03C2D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v5;

  return a5(a1, a2, a3, a4, v5[7], v5[2], v5[3], v5[4], v5[5], v5[6]);
}

void Store.deinit()
{
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_1_8();
}

uint64_t sub_1A03C2DCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
  return v2;
}

void Store.__deallocating_deinit()
{
  Store.deinit();
}

uint64_t sub_1A03C2E04()
{
  return swift_deallocClassInstance();
}

void sub_1A03C2E18()
{
  sub_1A03C108C();
}

uint64_t sub_1A03C2E3C()
{
  return 40;
}

__n128 sub_1A03C2E48(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t method lookup function for Store()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Store.promises.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of Store.__allocating_init(database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of Store.all()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of Store.first(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of Store.filter(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of Store.save(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of Store.delete(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of Store.deleteAll()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t sub_1A03C2F6C(uint64_t a1, _QWORD *a2)
{
  return sub_1A03C2F80(a1, a2);
}

uint64_t sub_1A03C2F80(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v2 + 56))();
  if (v3)
    *a2 = v3;
  return result;
}

uint64_t sub_1A03C2FB0()
{
  return sub_1A03C1824();
}

uint64_t sub_1A03C2FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1A03C142C(v4, a2, a3, a4);
}

uint64_t sub_1A03C2FDC()
{
  return sub_1A03C2FB0();
}

uint64_t Column.__allocating_init(primaryKey:index:unique:default:onUpdate:)(char a1, char a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  Column.init(primaryKey:index:unique:default:onUpdate:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t sub_1A03C305C()
{
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for _Optional<A>);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C3080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for _Optional<A>, a3);
  v3 = OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_1_9(v3, v4, v5, v6);
}

uint64_t static ColumnType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 + 24) + 24))(a1, a2, 1, a3);
}

uint64_t sub_1A03C30D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for _Optional<A>, a4);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C30F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void (**v2)(void);
  uint64_t v5;

  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_18_3();
  (*(void (**)(void (**)(void)))(v5 + 16))(v2);
  if (swift_getEnumCaseMultiPayload() != 1)
    return (*(uint64_t (**)(uint64_t, void (**)(void)))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 32))(a2, v2);
  (*v2)();
  return swift_release();
}

uint64_t sub_1A03C3198()
{
  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyJSON<A>);
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C31B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyJSON<A>, v2);
  return OUTLINED_FUNCTION_1_9(a1, a2, v2, v5);
}

uint64_t sub_1A03C31F8()
{
  uint64_t v0;

  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyJSON<A>, v0);
  return OUTLINED_FUNCTION_24();
}

uint64_t (*autoUpdate<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))()
{
  _QWORD *v8;

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a1;
  v8[5] = a2;
  swift_retain();
  return sub_1A03C33C0;
}

void sub_1A03C328C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_1A03D5EC4();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v6 - v3;
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v6 - v3, a1);
  sub_1A03AE284((uint64_t)v4);
}

void sub_1A03C3310()
{
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_14();
}

void sub_1A03C334C(_OWORD *a1@<X8>)
{
  sub_1A03AFC1C((void (*)(uint64_t))sub_1A03C3358, a1);
}

void sub_1A03C3358()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  OUTLINED_FUNCTION_0_12();
  type metadata accessor for Column.Func(255, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), v2);
  v3 = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_11_0(v3);
  OUTLINED_FUNCTION_4_8();
}

uint64_t sub_1A03C339C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03C33C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t Column.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  Column.init(from:)(a1);
  return v2;
}

_QWORD *Column.init(from:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
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
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  char *v19;

  v3 = v1;
  v5 = *v1;
  v6 = *(_QWORD *)(v5 + 80);
  v7 = sub_1A03D5EC4();
  v16 = *(_QWORD *)(v7 - 8);
  v17 = v7;
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v8);
  v19 = (char *)&v16 - v9;
  v10 = *(_QWORD *)(v5 + 88);
  (*(void (**)(uint64_t, uint64_t))(v10 + 32))(v6, v10);
  v11 = (uint64_t)v3 + *(_QWORD *)(*v3 + 104);
  OUTLINED_FUNCTION_23_0(v11, 1);
  *((_BYTE *)v3 + *(_QWORD *)(*v3 + 112)) = 0;
  *((_BYTE *)v3 + *(_QWORD *)(*v3 + 120)) = 0;
  *((_BYTE *)v3 + *(_QWORD *)(*v3 + 128)) = 0;
  v12 = (uint64_t)v3 + *(_QWORD *)(*v3 + 136);
  type metadata accessor for Column.Func(0, v6, v10, v13);
  OUTLINED_FUNCTION_14_6(v12);
  OUTLINED_FUNCTION_14_6((uint64_t)v3 + *(_QWORD *)(*v3 + 144));
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D61F4();
  if (v2)
  {
    swift_release();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1(v18, v18[3]);
    v14 = (uint64_t)v19;
    sub_1A03D6140();
    OUTLINED_FUNCTION_23_0(v14, 0);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 40))(v11, v14, v17);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v3;
}

uint64_t sub_1A03C3624(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  _BYTE v10[24];
  uint64_t v11;
  uint64_t v12;

  v2 = v1;
  v4 = *v2;
  v5 = sub_1A03D5EC4();
  OUTLINED_FUNCTION_20();
  MEMORY[0x1E0C80A78](v6);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D620C();
  sub_1A03AFFDC();
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
  v12 = *(_QWORD *)(*(_QWORD *)(v4 + 88) + 16);
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEE988], v5, &v12);
  OUTLINED_FUNCTION_28_1();
  sub_1A03D6158();
  v7 = OUTLINED_FUNCTION_28_1();
  v8(v7);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
}

void sub_1A03C3740(_OWORD *a1@<X8>)
{
  sub_1A03C334C(a1);
}

void static Column.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 88) + 24) + 24))(a1, a2, 1);
  OUTLINED_FUNCTION_14();
}

uint64_t sub_1A03C378C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = Column.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1A03C37B4(_QWORD *a1)
{
  return sub_1A03C3624(a1);
}

uint64_t Column.description.getter()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  _QWORD v15[2];

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  v2 = OUTLINED_FUNCTION_2_1();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v15 - v6;
  v8 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v5);
  v10 = (char *)v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03AFFDC();
  if (OUTLINED_FUNCTION_15_6() == 1)
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    sub_1A03AFFDC();
    return sub_1A03D5BE8();
  }
  else
  {
    OUTLINED_FUNCTION_30_1((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    OUTLINED_FUNCTION_28_1();
    sub_1A03D611C();
    v11 = v15[0];
    v12 = OUTLINED_FUNCTION_28_1();
    v13(v12);
  }
  return v11;
}

uint64_t sub_1A03C390C()
{
  return Column.description.getter();
}

void sub_1A03C392C()
{
  sub_1A03AFFDC();
}

uint64_t sub_1A03C3950()
{
  return 16;
}

__n128 sub_1A03C395C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of ColumnType.valueType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ColumnType.init(valueType:connection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t method lookup function for Column()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Column.value.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Column.__allocating_init(primaryKey:index:unique:default:onUpdate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 328))();
}

uint64_t dispatch thunk of Column.notNull.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of Column.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 344))();
}

uint64_t dispatch thunk of Column.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t *sub_1A03C39DC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8));
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 != 1)
    {
      (*(void (**)(uint64_t *))(v4 + 16))(a1);
      *((_BYTE *)v3 + v5) = 0;
      return v3;
    }
    v11 = a2[1];
    *v3 = *a2;
    v3[1] = v11;
    *((_BYTE *)v3 + v5) = 1;
  }
  swift_retain();
  return v3;
}

_QWORD *sub_1A03C3AF0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    swift_retain();
    v9 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *))(v4 + 16))(a1);
    v9 = 0;
  }
  *((_BYTE *)a1 + v5) = v9;
  return a1;
}

_QWORD *sub_1A03C3BC8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_release();
    else
      (*(void (**)(_QWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *((_BYTE *)a1 + v7) = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v6 + 16))(a1, a2, v5);
      *((_BYTE *)a1 + v7) = 0;
    }
  }
  return a1;
}

_OWORD *sub_1A03C3D58(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 2)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 1)
  {
    *a1 = *a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

_OWORD *sub_1A03C3E2C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  char v12;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *((unsigned __int8 *)a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_release();
    else
      (*(void (**)(_OWORD *, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *((unsigned __int8 *)a2 + v7);
    if (v10 >= 2)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 1)
    {
      *a1 = *a2;
      v12 = 1;
    }
    else
    {
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v12 = 0;
    }
    *((_BYTE *)a1 + v7) = v12;
  }
  return a1;
}

uint64_t sub_1A03C3FB8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x10uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 254) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 2)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 255);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03C407C + 4 * byte_1A03D7970[(v4 - 1)]))();
}

void sub_1A03C40C8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFF)
  {
    v8 = 0u;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v9 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v11;
      }
      else
      {
        *(_BYTE *)a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_1A03C426C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x10uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03C42B4 + 4 * byte_1A03D797E[v3]))();
}

uint64_t sub_1A03C42FC()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C4308()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C4310()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C4318()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t sub_1A03C4320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for JSON<A>, a3);
  v3 = OUTLINED_FUNCTION_6_1();
  return OUTLINED_FUNCTION_1_9(v3, v4, v5, v6);
}

uint64_t sub_1A03C4358()
{
  return OUTLINED_FUNCTION_24();
}

uint64_t OUTLINED_FUNCTION_23_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_26_1()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return sub_1A03D5EC4();
}

uint64_t OUTLINED_FUNCTION_28_1()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_30_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_1A03C4398(uint64_t a1, uint64_t a2, _QWORD *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v11 = v10;
  v13 = *(_QWORD *)(v10 + 16);
  v12 = *(_QWORD *)(v10 + 24);
  if (v13 >= v12 >> 1)
  {
    sub_1A03ACC98(v12 > 1, v13 + 1, 1, v10);
    v11 = v33;
  }
  *(_QWORD *)(v11 + 16) = v13 + 1;
  v14 = v11 + 16 * v13;
  *(_QWORD *)(v14 + 32) = 0x455441455243;
  *(_QWORD *)(v14 + 40) = 0xE600000000000000;
  v15 = a3[3];
  v16 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v15);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 56))(v15, v16);
  v18 = *(_QWORD *)(v11 + 16);
  if ((v17 & 1) != 0)
  {
    v19 = *(_QWORD *)(v11 + 24);
    v20 = v18 + 1;
    if (v18 >= v19 >> 1)
    {
      sub_1A03ACC98(v19 > 1, v18 + 1, 1, v11);
      v11 = v36;
    }
    *(_QWORD *)(v11 + 16) = v20;
    v21 = v11 + 16 * v18;
    *(_QWORD *)(v21 + 32) = 0x455551494E55;
    *(_QWORD *)(v21 + 40) = 0xE600000000000000;
  }
  else
  {
    v20 = *(_QWORD *)(v11 + 16);
  }
  v22 = *(_QWORD *)(v11 + 24);
  v23 = v20 + 1;
  if (v20 >= v22 >> 1)
  {
    sub_1A03ACC98(v22 > 1, v20 + 1, 1, v11);
    v11 = v34;
  }
  *(_QWORD *)(v11 + 16) = v23;
  v24 = v11 + 16 * v20;
  *(_QWORD *)(v24 + 32) = 0x5845444E49;
  *(_QWORD *)(v24 + 40) = 0xE500000000000000;
  if ((a4 & 1) != 0)
  {
    v25 = *(_QWORD *)(v11 + 24);
    v26 = v20 + 2;
    if (v23 >= v25 >> 1)
    {
      sub_1A03ACC98(v25 > 1, v26, 1, v11);
      v11 = v37;
    }
    *(_QWORD *)(v11 + 16) = v26;
    v27 = v11 + 16 * v23;
    strcpy((char *)(v27 + 32), "IF NOT EXISTS");
    *(_WORD *)(v27 + 46) = -4864;
  }
  sub_1A03D5F30();
  swift_bridgeObjectRelease();
  v28 = *(void (**)(uint64_t, uint64_t))(a6 + 32);
  v28(a5, a6);
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  sub_1A03D5C48();
  sub_1A03D5C48();
  v28(a5, a6);
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  v30 = *(_QWORD *)(v11 + 16);
  v29 = *(_QWORD *)(v11 + 24);
  if (v30 >= v29 >> 1)
  {
    sub_1A03ACC98(v29 > 1, v30 + 1, 1, v11);
    v11 = v35;
  }
  *(_QWORD *)(v11 + 16) = v30 + 1;
  v31 = v11 + 16 * v30;
  *(_QWORD *)(v31 + 32) = 0x5F7865646E69;
  *(_QWORD *)(v31 + 40) = 0xE600000000000000;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return v11;
}

uint64_t sub_1A03C46B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for CreateIndexCommand(0, a2, a3, a4);
  return sub_1A03AD180();
}

uint64_t sub_1A03C46FC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14[2];
  char v15;

  v2 = v0;
  v3 = *v0;
  v15 = 3;
  v5 = *(_QWORD *)(v3 + 80);
  v4 = *(_QWORD *)(v3 + 88);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(v5, v4);
  swift_beginAccess();
  v7 = *(_QWORD *)(v6 + 32);
  swift_bridgeObjectRetain();
  result = swift_release();
  if (v7)
  {
    OUTLINED_FUNCTION_7_8(v9, *(_QWORD *)(v4 + 8));
    v10 = sub_1A03D4848();
    OUTLINED_FUNCTION_6_5();
    v12 = sub_1A03A0848(v10, v5, v4, v11);
    OUTLINED_FUNCTION_4_9();
    sub_1A03AE220((uint64_t)(v2 + 2), (uint64_t)v14);
    v13 = sub_1A03AD7A0(&v15, v12, v4, v14);
    OUTLINED_FUNCTION_1_10(v13);
    result = OUTLINED_FUNCTION_0_13();
    if (!v1)
      return OUTLINED_FUNCTION_6_5();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03C480C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t result;
  __int128 v15[2];
  char v16;

  v6 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v7 = *(_QWORD *)(*(_QWORD *)v4 + 88);
  OUTLINED_FUNCTION_7_8(a4, *(_QWORD *)(v7 + 8));
  v16 = 3;
  v8 = sub_1A03D4848();
  v10 = sub_1A03A0848(v8, v6, v7, v9);
  v12 = v11;
  swift_bridgeObjectRelease();
  sub_1A03AE220(v4 + 16, (uint64_t)v15);
  v13 = sub_1A03AD7A0(&v16, v10, v12, v15);
  OUTLINED_FUNCTION_1_10(v13);
  result = OUTLINED_FUNCTION_0_13();
  if (!v5)
    return OUTLINED_FUNCTION_6_5();
  return result;
}

void sub_1A03C48D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[7];

  v6 = *a1;
  OUTLINED_FUNCTION_3_7(a4, *v4);
  v7 = sub_1A03D4940();
  OUTLINED_FUNCTION_8_7(v7, v8, v9, v10);
  v11 = OUTLINED_FUNCTION_4_9();
  v19 = OUTLINED_FUNCTION_9_6(v11, v12, v13, v14, v15, v16, v17, v18, v6);
  v27 = OUTLINED_FUNCTION_2_9(v19, v20, v21, v22, v23, v24, v25, v26, v28, v29, v30, v31, *(int *)v32, *(__int16 *)&v32[4], v32[6], 3);
  OUTLINED_FUNCTION_1_10(v27);
  OUTLINED_FUNCTION_0_13();
  if (!v5)
    OUTLINED_FUNCTION_6_5();
  OUTLINED_FUNCTION_5_7();
}

uint64_t Delete.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t method lookup function for Delete()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Delete.entity(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of Delete.by(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of Delete.where(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_1A03C49CC(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, uint64_t))
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)();
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v17 = MEMORY[0x1E0DEE9D8];
    sub_1A03B22B0(0, v2, 0);
    v6 = a1 + 48;
    do
    {
      v7 = a2(*(_QWORD *)(v6 - 16), *(_QWORD *)(v6 - 8), v6);
      if (v7)
      {
        v9 = v7;
        v10 = v8;
        v11 = swift_allocObject();
        *(_QWORD *)(v11 + 16) = v9;
        *(_QWORD *)(v11 + 24) = v10;
        v12 = sub_1A03C5358;
      }
      else
      {
        v12 = 0;
        v11 = 0;
      }
      v3 = v17;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A03B22B0(0, *(_QWORD *)(v17 + 16) + 1, 1);
        v3 = v17;
      }
      v14 = *(_QWORD *)(v3 + 16);
      v13 = *(_QWORD *)(v3 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1A03B22B0((char *)(v13 > 1), v14 + 1, 1);
        v3 = v17;
      }
      *(_QWORD *)(v3 + 16) = v14 + 1;
      v15 = v3 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v12;
      *(_QWORD *)(v15 + 40) = v11;
      v6 += 56;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t Save.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

void sub_1A03C4B30()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  const void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_14_7();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_6_6();
  if (v1)
  {
    sub_1A03C5378(0, &qword_1EE597818);
    v5 = (const void *)OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_12_6(v5);
    OUTLINED_FUNCTION_16_5(v6);
  }
  if ((v0 & 1) != 0)
  {
    v7 = (char *)OUTLINED_FUNCTION_15_7();
    sub_1A03C5074(v7, v8, v9);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v10 = OUTLINED_FUNCTION_7_9();
    sub_1A03C4D2C(v10, v11, v12, v13);
  }
  OUTLINED_FUNCTION_0_4();
}

uint64_t method lookup function for Save()
{
  return swift_lookUpClassMethod();
}

void sub_1A03C4BE0()
{
  char v0;
  uint64_t v1;
  char v2;
  char v3;
  char v4;
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_14_7();
  if ((v2 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v3 != v4)
    {
      OUTLINED_FUNCTION_11_8();
      if (v3)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_6_6();
  if (v1)
  {
    OUTLINED_FUNCTION_17_4(v5, &qword_1EE597808, sub_1A03C52DC);
    v6 = (const void *)OUTLINED_FUNCTION_8_8();
    OUTLINED_FUNCTION_12_6(v6);
    OUTLINED_FUNCTION_16_5(v7);
  }
  if ((v0 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_15_7();
    sub_1A03C517C(v8, v9, v10);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_7_9();
    sub_1A03C4E20(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03C4C80()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  _QWORD *v6;
  size_t v7;
  char *v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;

  OUTLINED_FUNCTION_14_7();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_5_8();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_11_8();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_4_10();
    }
  }
  OUTLINED_FUNCTION_6_6();
  if (v2)
  {
    sub_1A03C5378(0, qword_1EE597820);
    v6 = (_QWORD *)OUTLINED_FUNCTION_0();
    v7 = _swift_stdlib_malloc_size(v6);
    v6[2] = v1;
    v6[3] = 2 * v7 - 64;
  }
  if ((v0 & 1) != 0)
  {
    v8 = (char *)OUTLINED_FUNCTION_15_7();
    sub_1A03C525C(v8, v9, v10);
    OUTLINED_FUNCTION_3_8();
  }
  else
  {
    v11 = OUTLINED_FUNCTION_7_9();
    sub_1A03C4F30(v11, v12, v13, v14);
  }
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A03C4D2C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03C4E20(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      sub_1A03C52DC(0);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_1A03D6050();
  __break(1u);
  return result;
}

char *sub_1A03C4F30(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = (char *)sub_1A03D6050();
  __break(1u);
  return result;
}

char *sub_1A03C501C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_10();
    result = (char *)OUTLINED_FUNCTION_1_11();
    __break(1u);
  }
  else if (a3 != result || &result[4 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_14(a3, result);
  }
  return result;
}

char *sub_1A03C5074(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A03D6050();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_1A03C50F8(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A03D6050();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_1A03C517C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_1A03D6050();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_1A03C5200(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_10();
    result = (char *)OUTLINED_FUNCTION_1_11();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_14(a3, result);
  }
  return result;
}

char *sub_1A03C525C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1A03D6050();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void sub_1A03C52DC(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t IndexCommand;
  uint64_t v5;

  if (!qword_1EE597810)
  {
    v2 = sub_1A03AA4D0();
    IndexCommand = type metadata accessor for CreateIndexCommand(a1, (uint64_t)&type metadata for Versions.Entity, v2, v3);
    if (!v5)
      atomic_store(IndexCommand, (unint64_t *)&qword_1EE597810);
  }
}

uint64_t sub_1A03C5334()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A03C5358()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_1A03C5378(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1A03D6110();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t static BaseType.tableName.getter()
{
  return sub_1A03D623C();
}

uint64_t dispatch thunk of static BaseType.tableName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of static BaseType.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_1A03C53F0(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t sub_1A03C53F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

uint64_t sub_1A03C5410(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x797469746E65 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A03C548C()
{
  return 0x797469746E65;
}

uint64_t sub_1A03C54A0()
{
  return sub_1A03A63E8();
}

uint64_t sub_1A03C54A8()
{
  return sub_1A03B7314();
}

uint64_t sub_1A03C54B4()
{
  return sub_1A03B72F0();
}

uint64_t sub_1A03C54C0()
{
  sub_1A03D61AC();
  sub_1A03B72F0();
  return sub_1A03D61C4();
}

uint64_t sub_1A03C5500()
{
  return sub_1A03C548C();
}

uint64_t sub_1A03C550C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03C5410(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A03C553C()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03C555C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03A63E8();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1A03C558C(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D7E00, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03C55C0(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D7E00, a1);
  return sub_1A03D6230();
}

uint64_t sub_1A03C55F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 32))();
  sub_1A03D5C48();
  return v3;
}

uint64_t sub_1A03C5640(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 8) + 40))();
}

uint64_t sub_1A03C5668(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 24) + 24))(*(_QWORD *)(a1 + 16));
}

uint64_t sub_1A03C5674(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 8) + 24) + 8))();
}

void sub_1A03C56A0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  v5 = *(_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a2 + 16);
  v6 = type metadata accessor for MigratableEntity.CodingKeys(255, v11, v5, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D7E00, v6);
  v7 = sub_1A03D60F8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v11 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  sub_1A03D60EC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  OUTLINED_FUNCTION_10();
}

void sub_1A03C57A8(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v23 = a4;
  v27 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v28 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for MigratableEntity.CodingKeys(255, v8, v9, v10);
  MEMORY[0x1A1AF9BC4](&unk_1A03D7E00, v11);
  v29 = sub_1A03D60B0();
  v24 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v25 = a2;
  v26 = a3;
  v13 = type metadata accessor for MigratableEntity(0, a2, a3, v12);
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v22 - v15;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v17 = v30;
  sub_1A03D6200();
  if (!v17)
  {
    v18 = v16;
    v22 = v14;
    v30 = v13;
    v19 = v25;
    v20 = v27;
    v21 = v28;
    sub_1A03D60A4();
    OUTLINED_FUNCTION_1_13();
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v18, v21, v19);
    (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v23, v18, v30);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1A03C5980(uint64_t a1)
{
  return sub_1A03C55F4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_1A03C598C(uint64_t a1)
{
  return sub_1A03C5640(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_1A03C5998(uint64_t a1)
{
  return sub_1A03C5674(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

void sub_1A03C59A4(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_1A03C57A8(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

void sub_1A03C59C0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03C56A0(a1, a2, a3, a4);
}

uint64_t sub_1A03C59D4(uint64_t a1)
{
  return sub_1A03B0058(*(_QWORD *)(a1 + 16));
}

uint64_t sub_1A03C59EC(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x1A1AF9BC4](&unk_1A03D7CE4);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1A03C5A18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D7C74, (uint64_t)&unk_1A03D7C4C);
}

uint64_t sub_1A03C5A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D7CC8, (uint64_t)&unk_1A03D7CAC);
}

uint64_t type metadata accessor for MigratableEntity.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MigratableEntity.CodingKeys);
}

uint64_t type metadata accessor for MigratableEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MigratableEntity);
}

uint64_t sub_1A03C5A58(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03C5A98 + 4 * byte_1A03D7BF0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03C5AB8 + 4 * byte_1A03D7BF5[v4]))();
}

_BYTE *sub_1A03C5A98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03C5AB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03C5AC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03C5AC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03C5AD0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03C5AD8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1A03C5AE4()
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

uint64_t *sub_1A03C5B50(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1A03C5BC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_1A03C5BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_1A03C5C20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_1A03C5C50(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  char v9;
  int v10;
  unsigned int v11;
  int v12;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  v7 = a2 - v6;
  if (a2 <= v6)
    goto LABEL_18;
  v8 = *(_QWORD *)(v5 + 64);
  v9 = 8 * v8;
  if (v8 <= 3)
  {
    v11 = ((v7 + ~(-1 << v9)) >> v9) + 1;
    if (HIWORD(v11))
    {
      v10 = *(_DWORD *)(a1 + v8);
      if (!v10)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 > 0xFF)
    {
      v10 = *(unsigned __int16 *)(a1 + v8);
      if (!*(_WORD *)(a1 + v8))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v11 < 2)
    {
LABEL_18:
      if ((_DWORD)v6)
        return __swift_getEnumTagSinglePayload(a1, v6, v4);
      return 0;
    }
  }
  v10 = *(unsigned __int8 *)(a1 + v8);
  if (!*(_BYTE *)(a1 + v8))
    goto LABEL_18;
LABEL_11:
  v12 = (v10 - 1) << v9;
  if (v8 > 3)
    v12 = 0;
  if (!(_DWORD)v8)
    return (v6 + v12 + 1);
  if (v8 > 3)
    LODWORD(v8) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03C5D00 + 4 * byte_1A03D7BFA[(v8 - 1)]))();
}

void sub_1A03C5D4C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  char v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  int v15;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = 8 * v8;
  v10 = a3 >= v7;
  v11 = a3 - v7;
  if (v11 != 0 && v10)
  {
    if (v8 <= 3)
    {
      v14 = ((v11 + ~(-1 << v9)) >> v9) + 1;
      if (HIWORD(v14))
      {
        v12 = 4u;
      }
      else if (v14 >= 0x100)
      {
        v12 = 2;
      }
      else
      {
        v12 = v14 > 1;
      }
    }
    else
    {
      v12 = 1u;
    }
  }
  else
  {
    v12 = 0u;
  }
  if (v7 < a2)
  {
    v13 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v15 = v13 & ~(-1 << v9);
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v15;
          *((_BYTE *)a1 + 2) = BYTE2(v15);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v15;
        }
        else
        {
          *(_BYTE *)a1 = v15;
        }
      }
    }
    else
    {
      bzero(a1, v8);
      *(_DWORD *)a1 = v13;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X10 }
}

void sub_1A03C5EF4()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03C5F04()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03C5F14()
{
  JUMPOUT(0x1A1AF9BC4);
}

void static CGRect.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CGRect.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  BOOL v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  if (*(_BYTE *)(a1 + 16))
    goto LABEL_47;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = 0xE000000000000000;
  v39 = 0;
  v40 = 0xE000000000000000;
  v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0)
    v6 = v3 & 0xFFFFFFFFFFFFLL;
  v35 = v3;
  v36 = v4;
  v37 = 0;
  v38 = v6;
  swift_bridgeObjectRetain();
  v7 = sub_1A03D5C6C();
  if (v8)
  {
    v9 = v7;
    v10 = v8;
    do
    {
      if (v9 != 91 || v10 != 0xE100000000000000)
      {
        v12 = OUTLINED_FUNCTION_6_7();
        v13 = v9 == 93 && v10 == 0xE100000000000000;
        v14 = v13;
        if ((v12 & 1) == 0 && !v14 && (OUTLINED_FUNCTION_6_7() & 1) == 0)
          MEMORY[0x1A1AF91C8](v9, v10);
      }
      OUTLINED_FUNCTION_2();
      v9 = sub_1A03D5C6C();
      v10 = v15;
    }
    while (v15);
    v16 = v39;
    v5 = v40;
  }
  else
  {
    v16 = 0;
  }
  v17 = swift_bridgeObjectRelease();
  v35 = 44;
  v36 = 0xE100000000000000;
  MEMORY[0x1E0C80A78](v17);
  v32 = (uint64_t)&v35;
  swift_bridgeObjectRetain();
  v18 = sub_1A03C63E0(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1A03C6BE8, (uint64_t)&v31, v16, v5);
  swift_bridgeObjectRelease();
  v19 = *(_QWORD *)(v18 + 16);
  if (v19)
  {
    v34 = a2;
    v35 = MEMORY[0x1E0DEE9D8];
    sub_1A03C6AC8(0, v19, 0);
    v20 = v35;
    v21 = v18 + 56;
    do
    {
      OUTLINED_FUNCTION_8_9();
      v22 = sub_1A03D5D74();
      v24 = v23;
      v35 = v20;
      v26 = *(_QWORD *)(v20 + 16);
      v25 = *(_QWORD *)(v20 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_1A03C6AC8((char *)(v25 > 1), v26 + 1, 1);
        v20 = v35;
      }
      *(_QWORD *)(v20 + 16) = v26 + 1;
      v27 = v20 + 16 * v26;
      *(_QWORD *)(v27 + 32) = v22;
      *(_BYTE *)(v27 + 40) = v24 & 1;
      v21 += 32;
      --v19;
    }
    while (v19);
    OUTLINED_FUNCTION_2();
    a2 = v34;
  }
  else
  {
    OUTLINED_FUNCTION_2();
    v20 = MEMORY[0x1E0DEE9D8];
  }
  v28 = *(_QWORD *)(v20 + 16);
  if (!v28)
  {
    __break(1u);
LABEL_40:
    __break(1u);
LABEL_41:
    __break(1u);
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  if ((*(_BYTE *)(v20 + 40) & 1) != 0)
  {
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if (v28 < 2)
    goto LABEL_40;
  if ((*(_BYTE *)(v20 + 56) & 1) != 0)
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  if (v28 < 3)
    goto LABEL_41;
  if ((*(_BYTE *)(v20 + 72) & 1) == 0)
  {
    if (v28 >= 4)
    {
      v29 = *(_BYTE *)(v20 + 88);
      swift_bridgeObjectRelease();
      if ((v29 & 1) == 0)
      {
        sub_1A03ADE98(v3, v4, 0);
        return __swift_destroy_boxed_opaque_existential_1(a2);
      }
      goto LABEL_46;
    }
    goto LABEL_42;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  v33 = 0;
  v32 = 31;
  result = sub_1A03D6038();
  __break(1u);
  return result;
}

uint64_t CGRect.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  sub_1A03D5F30();
  swift_bridgeObjectRelease();
  sub_1A03D5D5C();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_9();
  sub_1A03D5D5C();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_2();
  sub_1A03D5C48();
  sub_1A03D5D5C();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_9();
  sub_1A03D5D5C();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_2();
  result = sub_1A03D5C48();
  *(_QWORD *)a1 = 23387;
  *(_QWORD *)(a1 + 8) = 0xE200000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_1A03C636C@<X0>(uint64_t a1@<X8>)
{
  return CGRect.valueType.getter(a1);
}

uint64_t sub_1A03C6378@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = CGRect.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  a3[1] = v6;
  a3[2] = v7;
  a3[3] = v8;
  return result;
}

uint64_t sub_1A03C63A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4)
    return 1;
  else
    return sub_1A03D6134() & 1;
}

uint64_t sub_1A03C63E0(uint64_t a1, unsigned __int8 a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
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
  _QWORD *v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
  {
    OUTLINED_FUNCTION_0_15();
    goto LABEL_40;
  }
  v10 = OUTLINED_FUNCTION_7_10();
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
  v42 = v10 + 16;
  v47 = OUTLINED_FUNCTION_7_10();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_1A03C67B0(v30 | (v11 << 16), v47, a2 & 1, v10);
    OUTLINED_FUNCTION_4_11();
    v13 = *(_QWORD *)(v10 + 16);
    OUTLINED_FUNCTION_8_9();
    swift_release();
LABEL_36:
    swift_release();
    return v13;
  }
  v41 = a1;
  v48 = 4 * v12;
  v13 = MEMORY[0x1E0DEE9D8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_1A03D5C9C();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_4_11();
      return v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
    {
      v14 = OUTLINED_FUNCTION_3_10();
      goto LABEL_21;
    }
    v20 = (v15 >> 14 == v14 >> 14) & a2;
    if (v20 != 1)
    {
      if (v14 >> 14 < v15 >> 14)
        goto LABEL_38;
      v21 = OUTLINED_FUNCTION_9_7();
      v43 = v23;
      v44 = v22;
      v45 = v24;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_11_9();
        v13 = v28;
      }
      v25 = *(_QWORD *)(v13 + 16);
      if (v25 >= *(_QWORD *)(v13 + 24) >> 1)
      {
        OUTLINED_FUNCTION_11_9();
        v13 = v29;
      }
      *(_QWORD *)(v13 + 16) = v25 + 1;
      v26 = (_QWORD *)(v13 + 32 * v25);
      v26[4] = v21;
      v26[5] = v45;
      v26[6] = v44;
      v26[7] = v43;
      *(_QWORD *)v42 = v13;
    }
    v27 = OUTLINED_FUNCTION_3_10();
    v14 = v27;
    *(_QWORD *)(v47 + 16) = v27;
    if ((v20 & 1) == 0 && *(_QWORD *)(v13 + 16) == v41)
      break;
    v15 = v27;
    v16 = v27;
LABEL_21:
    if (v48 == v14 >> 14)
      goto LABEL_30;
  }
  v16 = v27;
  v15 = v27;
LABEL_30:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_4_11();
LABEL_35:
    OUTLINED_FUNCTION_8_9();
    swift_release();
    goto LABEL_36;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = OUTLINED_FUNCTION_9_7();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    OUTLINED_FUNCTION_4_11();
    sub_1A03C68B4();
    v38 = *(_QWORD *)(*(_QWORD *)v42 + 16);
    sub_1A03C68FC(v38);
    v13 = *(_QWORD *)v42;
    *(_QWORD *)(v13 + 16) = v38 + 1;
    v39 = (_QWORD *)(v13 + 32 * v38);
    v39[4] = v31;
    v39[5] = v33;
    v39[6] = v35;
    v39[7] = v37;
    *(_QWORD *)v42 = v13;
    goto LABEL_35;
  }
LABEL_38:
  OUTLINED_FUNCTION_0_15();
LABEL_40:
  result = sub_1A03D602C();
  __break(1u);
  return result;
}

uint64_t sub_1A03C67B0(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
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
  _QWORD *v16;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_1A03D5CB4();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    sub_1A03C68B4();
    v14 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 16);
    sub_1A03C68FC(v14);
    v15 = *(_QWORD *)(a4 + 16);
    *(_QWORD *)(v15 + 16) = v14 + 1;
    v16 = (_QWORD *)(v15 + 32 * v14);
    v16[4] = v7;
    v16[5] = v9;
    v16[6] = v11;
    v16[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_1A03D602C();
  __break(1u);
  return result;
}

void sub_1A03C68B4()
{
  uint64_t *v0;
  uint64_t v1;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v3;

  v1 = *v0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1A03C4B30();
    *v0 = v3;
  }
}

void sub_1A03C68FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (a1 + 1 > *(_QWORD *)(*(_QWORD *)v1 + 24) >> 1)
  {
    sub_1A03C4B30();
    *(_QWORD *)v1 = v2;
  }
}

void *sub_1A03C6938(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[16 * a2] <= __src || &__src[16 * a2] <= __dst))
    return memcpy(__dst, __src, 16 * a2);
  result = (void *)sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03C6A00(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 16 * a2 > a1 ? (v3 = a1 + 16 * a2 > a3) : (v3 = 0), v3))
  {
    OUTLINED_FUNCTION_0_15();
    result = OUTLINED_FUNCTION_10_4();
    __break(1u);
  }
  else
  {
    sub_1A03B2724();
    return swift_arrayInitWithCopy();
  }
  return result;
}

char *sub_1A03C6AC8(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_1A03C6AE4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_1A03C6AE4(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_1A03C6C90();
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1A03B1EF0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03C6938(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_1A03C6BC0(uint64_t *a1, uint64_t *a2)
{
  return sub_1A03C63A0(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_1A03C6BE8(uint64_t *a1)
{
  uint64_t v1;

  return sub_1A03C6BC0(a1, *(uint64_t **)(v1 + 16)) & 1;
}

uint64_t sub_1A03C6C04(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A03C6C50(&qword_1EE597928, MEMORY[0x1E0C9B9E0]);
  result = sub_1A03C6C50(&qword_1EE597930, MEMORY[0x1E0C9B9C0]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A03C6C50(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGRect(255);
    result = MEMORY[0x1A1AF9BC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A03C6C90()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE597938)
  {
    sub_1A03B1D80(255, &qword_1EE597940, MEMORY[0x1E0DEB070], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEB940]);
    v0 = sub_1A03D6110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE597938);
  }
}

uint64_t sub_1A03C6CFC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A03C6D20()
{
  return swift_deallocObject();
}

uint64_t sub_1A03C6D34(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1A03AB470();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for OrderBy(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_1A03AB470();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_1A03AB468();
  return a1;
}

uint64_t assignWithTake for OrderBy(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_1A03AB468();
  return a1;
}

uint64_t sub_1A03C6E14(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t FastEntity.__allocating_init<A>(_:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_7();
  FastEntity.init<A>(_:)();
  return v0;
}

void FastEntity.__allocating_init<A, B>(_:_:)()
{
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B>(_:_:)();
  OUTLINED_FUNCTION_0_4();
}

void FastEntity.init<A, B>(_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D6810);
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_7_11(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = OUTLINED_FUNCTION_6_8(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_26();
}

void FastEntity.__allocating_init<A, B, C>(_:_:_:)()
{
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B, C>(_:_:_:)();
  OUTLINED_FUNCTION_0_4();
}

void FastEntity.__allocating_init<A, B, C, D>(_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B, C, D>(_:_:_:_:)();
  OUTLINED_FUNCTION_26();
}

void FastEntity.init<A, B, C, D>(_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7EF0);
  v1[2].n128_u64[0] = OUTLINED_FUNCTION_19_4(v2);
  v1[2].n128_u64[1] = v3;
  v1[5].n128_u64[1] = OUTLINED_FUNCTION_14_8(&v1[6].n128_u64[1]);
  v1[6].n128_u64[0] = v4;
  v1[9].n128_u64[0] = OUTLINED_FUNCTION_7_11((__n128 *)v1[10].n128_u64);
  v1[9].n128_u64[1] = v5;
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_6_8(&v1[13].n128_u64[1]);
  v1[13].n128_u64[0] = v6;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_10_5();
}

void FastEntity.__allocating_init<A, B, C, D, E>(_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B, C, D, E>(_:_:_:_:_:)();
  OUTLINED_FUNCTION_26();
}

void FastEntity.__allocating_init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B, C, D, E, F>(_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_10_5();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_1_7();
  FastEntity.init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_10_5();
}

void FastEntity.init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7F20);
  v3 = OUTLINED_FUNCTION_25_1(v2);
  v5 = (_QWORD *)OUTLINED_FUNCTION_64_0(v3, v4);
  v6 = OUTLINED_FUNCTION_36_1(v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_63(v6, v7);
  v9 = OUTLINED_FUNCTION_21_4(v8);
  v11 = (_QWORD *)OUTLINED_FUNCTION_61_0(v9, v10);
  v12 = OUTLINED_FUNCTION_19_4(v11);
  v14 = (_QWORD *)OUTLINED_FUNCTION_59_0(v12, v13);
  v15 = OUTLINED_FUNCTION_14_8(v14);
  v17 = (_QWORD *)OUTLINED_FUNCTION_57_0(v15, v16);
  v18 = OUTLINED_FUNCTION_7_11(v17);
  v20 = (_QWORD *)OUTLINED_FUNCTION_56_0(v18, v19);
  v1[23].n128_u64[0] = OUTLINED_FUNCTION_6_8(v20);
  v1[23].n128_u64[1] = v21;
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_7_0();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_12();
  FastEntity.init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_7_0();
}

void FastEntity.init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;

  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7F30);
  v3 = OUTLINED_FUNCTION_26_2(v2);
  v5 = (_QWORD *)OUTLINED_FUNCTION_64_0(v3, v4);
  v6 = OUTLINED_FUNCTION_25_1(v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_63(v6, v7);
  v9 = OUTLINED_FUNCTION_36_1(v8);
  v11 = (_QWORD *)OUTLINED_FUNCTION_61_0(v9, v10);
  v12 = OUTLINED_FUNCTION_21_4(v11);
  v14 = (_QWORD *)OUTLINED_FUNCTION_59_0(v12, v13);
  v15 = OUTLINED_FUNCTION_19_4(v14);
  v17 = (_QWORD *)OUTLINED_FUNCTION_57_0(v15, v16);
  v18 = OUTLINED_FUNCTION_14_8(v17);
  v20 = (_QWORD *)OUTLINED_FUNCTION_56_0(v18, v19);
  v1[23].n128_u64[0] = OUTLINED_FUNCTION_7_11(v20);
  v1[23].n128_u64[1] = v21;
  v1[26].n128_u64[1] = OUTLINED_FUNCTION_6_8(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v22;
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_9_8();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_12();
  FastEntity.init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_9_8();
}

void FastEntity.init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  __n128 *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;

  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_31_1(v1, (__n128)xmmword_1A03D7F40);
  v3 = OUTLINED_FUNCTION_6_8(v2);
  v5 = (_QWORD *)OUTLINED_FUNCTION_64_0(v3, v4);
  v6 = OUTLINED_FUNCTION_26_2(v5);
  v8 = (_QWORD *)OUTLINED_FUNCTION_63(v6, v7);
  v9 = OUTLINED_FUNCTION_25_1(v8);
  v11 = (_QWORD *)OUTLINED_FUNCTION_61_0(v9, v10);
  v12 = OUTLINED_FUNCTION_36_1(v11);
  v14 = (_QWORD *)OUTLINED_FUNCTION_59_0(v12, v13);
  v15 = OUTLINED_FUNCTION_21_4(v14);
  v17 = (_QWORD *)OUTLINED_FUNCTION_57_0(v15, v16);
  v18 = OUTLINED_FUNCTION_19_4(v17);
  v20 = (_QWORD *)OUTLINED_FUNCTION_56_0(v18, v19);
  v1[23].n128_u64[0] = OUTLINED_FUNCTION_14_8(v20);
  v1[23].n128_u64[1] = v21;
  v1[26].n128_u64[1] = OUTLINED_FUNCTION_7_11(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v22;
  v1[30].n128_u64[0] = sub_1A03A4924((__n128 *)v1[31].n128_u64);
  v1[30].n128_u64[1] = v23;
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_25();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_9_8();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_16_6();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_18_5();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_30_2();
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  __n128 *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_4_12();
  v0 = (__n128 *)OUTLINED_FUNCTION_0();
  v1 = OUTLINED_FUNCTION_12_7(v0, (__n128)xmmword_1A03D7F50);
  v3 = (_QWORD *)OUTLINED_FUNCTION_44_0(v1, v2);
  v4 = OUTLINED_FUNCTION_7_11(v3);
  v6 = (_QWORD *)OUTLINED_FUNCTION_43_1(v4, v5);
  v7 = OUTLINED_FUNCTION_6_8(v6);
  v9 = (_QWORD *)OUTLINED_FUNCTION_41_1(v7, v8);
  v0[12].n128_u64[1] = OUTLINED_FUNCTION_26_2(v9);
  v0[13].n128_u64[0] = v10;
  v0[16].n128_u64[0] = OUTLINED_FUNCTION_25_1((__n128 *)v0[17].n128_u64);
  v0[16].n128_u64[1] = v11;
  v12 = OUTLINED_FUNCTION_28_2(&v0[20].n128_u64[1]);
  v14 = (_QWORD *)OUTLINED_FUNCTION_52_0(v12, v13);
  v15 = OUTLINED_FUNCTION_19_4(v14);
  v17 = (_QWORD *)OUTLINED_FUNCTION_50_0(v15, v16);
  v0[26].n128_u64[1] = OUTLINED_FUNCTION_14_8(v17);
  v0[27].n128_u64[0] = v18;
  v19 = OUTLINED_FUNCTION_21_4((__n128 *)v0[31].n128_u64);
  v21 = (_QWORD *)OUTLINED_FUNCTION_49_0(v19, v20);
  v0[33].n128_u64[1] = sub_1A03A4924(v21);
  v0[34].n128_u64[0] = v22;
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_25();
  *(_QWORD *)(v23 + 16) = v0;
  OUTLINED_FUNCTION_30_2();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_12();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_11();
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  OUTLINED_FUNCTION_48();
  OUTLINED_FUNCTION_46_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_12_7(v1, (__n128)xmmword_1A03D7F60);
  v4 = (_QWORD *)OUTLINED_FUNCTION_44_0(v2, v3);
  v5 = OUTLINED_FUNCTION_21_4(v4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_43_1(v5, v6);
  v8 = OUTLINED_FUNCTION_19_4(v7);
  v10 = (_QWORD *)OUTLINED_FUNCTION_41_1(v8, v9);
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_14_8(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = OUTLINED_FUNCTION_7_11((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  v13 = OUTLINED_FUNCTION_6_8(&v1[20].n128_u64[1]);
  v15 = (_QWORD *)OUTLINED_FUNCTION_52_0(v13, v14);
  v16 = OUTLINED_FUNCTION_25_1(v15);
  v18 = (_QWORD *)OUTLINED_FUNCTION_50_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A03A4924(v18);
  v1[27].n128_u64[0] = v19;
  v20 = OUTLINED_FUNCTION_26_2((__n128 *)v1[31].n128_u64);
  v22 = (_QWORD *)OUTLINED_FUNCTION_49_0(v20, v21);
  v23 = OUTLINED_FUNCTION_28_2(v22);
  v1[37].n128_u64[0] = OUTLINED_FUNCTION_39_1(v23, v24);
  v1[37].n128_u64[1] = v25;
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_42_1();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_11();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_18_5();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_15_8();
}

void FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_3_11();
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_12();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  OUTLINED_FUNCTION_29_0();
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_12_7(v1, (__n128)xmmword_1A03D7F80);
  v4 = (_QWORD *)OUTLINED_FUNCTION_44_0(v2, v3);
  v5 = OUTLINED_FUNCTION_6_8(v4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_43_1(v5, v6);
  v8 = OUTLINED_FUNCTION_26_2(v7);
  v10 = (_QWORD *)OUTLINED_FUNCTION_41_1(v8, v9);
  v1[12].n128_u64[1] = OUTLINED_FUNCTION_25_1(v10);
  v1[13].n128_u64[0] = v11;
  v1[16].n128_u64[0] = OUTLINED_FUNCTION_28_2((__n128 *)v1[17].n128_u64);
  v1[16].n128_u64[1] = v12;
  v13 = OUTLINED_FUNCTION_21_4(&v1[20].n128_u64[1]);
  v15 = (_QWORD *)OUTLINED_FUNCTION_52_0(v13, v14);
  v16 = OUTLINED_FUNCTION_14_8(v15);
  v18 = (_QWORD *)OUTLINED_FUNCTION_50_0(v16, v17);
  v1[26].n128_u64[1] = sub_1A03A4924(v18);
  v1[27].n128_u64[0] = v19;
  v20 = OUTLINED_FUNCTION_19_4((__n128 *)v1[31].n128_u64);
  v22 = (_QWORD *)OUTLINED_FUNCTION_49_0(v20, v21);
  v23 = OUTLINED_FUNCTION_7_11(v22);
  v25 = OUTLINED_FUNCTION_39_1(v23, v24);
  v27 = OUTLINED_FUNCTION_34_1(v25, v26);
  v1[44].n128_u64[0] = OUTLINED_FUNCTION_38_1(v27, v28);
  v1[44].n128_u64[1] = v29;
  swift_release();
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_15_8();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_18_5();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;
  __n128 *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;

  OUTLINED_FUNCTION_40_1();
  OUTLINED_FUNCTION_53_0();
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_4_12();
  v1 = (__n128 *)OUTLINED_FUNCTION_0();
  v2 = OUTLINED_FUNCTION_12_7(v1, (__n128)xmmword_1A03D7F90);
  v4 = (_QWORD *)OUTLINED_FUNCTION_64_0(v2, v3);
  v5 = OUTLINED_FUNCTION_14_8(v4);
  v7 = (_QWORD *)OUTLINED_FUNCTION_63(v5, v6);
  v8 = OUTLINED_FUNCTION_7_11(v7);
  v10 = (_QWORD *)OUTLINED_FUNCTION_61_0(v8, v9);
  v11 = OUTLINED_FUNCTION_6_8(v10);
  v13 = (_QWORD *)OUTLINED_FUNCTION_59_0(v11, v12);
  v14 = OUTLINED_FUNCTION_26_2(v13);
  v16 = (_QWORD *)OUTLINED_FUNCTION_57_0(v14, v15);
  v17 = OUTLINED_FUNCTION_25_1(v16);
  v19 = (_QWORD *)OUTLINED_FUNCTION_56_0(v17, v18);
  v1[23].n128_u64[0] = OUTLINED_FUNCTION_21_4(v19);
  v1[23].n128_u64[1] = v20;
  v1[26].n128_u64[1] = sub_1A03A4924(&v1[27].n128_u64[1]);
  v1[27].n128_u64[0] = v21;
  v1[30].n128_u64[0] = OUTLINED_FUNCTION_36_1((__n128 *)v1[31].n128_u64);
  v1[30].n128_u64[1] = v22;
  v1[33].n128_u64[1] = OUTLINED_FUNCTION_19_4(&v1[34].n128_u64[1]);
  v1[34].n128_u64[0] = v23;
  v1[37].n128_u64[0] = sub_1A03A4924((__n128 *)v1[38].n128_u64);
  v1[37].n128_u64[1] = v24;
  v1[40].n128_u64[1] = sub_1A03A4924(&v1[41].n128_u64[1]);
  v1[41].n128_u64[0] = v25;
  v1[44].n128_u64[0] = sub_1A03A4924((__n128 *)v1[45].n128_u64);
  v1[44].n128_u64[1] = v26;
  v1[47].n128_u64[1] = sub_1A03A4924(&v1[48].n128_u64[1]);
  v1[48].n128_u64[0] = v27;
  OUTLINED_FUNCTION_33_1();
  OUTLINED_FUNCTION_55_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_35_1();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_42_1();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_58_0();
  *(_QWORD *)(v0 + 16) = v1;
  OUTLINED_FUNCTION_15_8();
}

uint64_t FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_11();
  v0 = OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_2_12();
  FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)();
  return v0;
}

void FastEntity.init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  __n128 *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;

  OUTLINED_FUNCTION_51_0();
  OUTLINED_FUNCTION_4_12();
  v0 = (__n128 *)OUTLINED_FUNCTION_0();
  v1 = OUTLINED_FUNCTION_12_7(v0, (__n128)xmmword_1A03D7FA0);
  v3 = (_QWORD *)OUTLINED_FUNCTION_44_0(v1, v2);
  v4 = OUTLINED_FUNCTION_14_8(v3);
  v6 = (_QWORD *)OUTLINED_FUNCTION_43_1(v4, v5);
  v7 = OUTLINED_FUNCTION_7_11(v6);
  v9 = (_QWORD *)OUTLINED_FUNCTION_41_1(v7, v8);
  v0[12].n128_u64[1] = OUTLINED_FUNCTION_6_8(v9);
  v0[13].n128_u64[0] = v10;
  v0[16].n128_u64[0] = OUTLINED_FUNCTION_25_1((__n128 *)v0[17].n128_u64);
  v0[16].n128_u64[1] = v11;
  v12 = OUTLINED_FUNCTION_21_4(&v0[20].n128_u64[1]);
  v14 = (_QWORD *)OUTLINED_FUNCTION_52_0(v12, v13);
  v15 = OUTLINED_FUNCTION_28_2(v14);
  v17 = (_QWORD *)OUTLINED_FUNCTION_50_0(v15, v16);
  v0[26].n128_u64[1] = OUTLINED_FUNCTION_19_4(v17);
  v0[27].n128_u64[0] = v18;
  v19 = OUTLINED_FUNCTION_26_2((__n128 *)v0[31].n128_u64);
  v21 = (_QWORD *)OUTLINED_FUNCTION_49_0(v19, v20);
  v0[33].n128_u64[1] = OUTLINED_FUNCTION_28_2(v21);
  v0[34].n128_u64[0] = v22;
  v23 = OUTLINED_FUNCTION_21_4((__n128 *)v0[38].n128_u64);
  v25 = OUTLINED_FUNCTION_34_1(v23, v24);
  v0[44].n128_u64[0] = OUTLINED_FUNCTION_38_1(v25, v26);
  v0[44].n128_u64[1] = v27;
  v0[47].n128_u64[1] = sub_1A03A4924(&v0[48].n128_u64[1]);
  v0[48].n128_u64[0] = v28;
  v0[51].n128_u64[0] = sub_1A03A4924((__n128 *)v0[52].n128_u64);
  v0[51].n128_u64[1] = v29;
  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_8_10();
  OUTLINED_FUNCTION_23_4();
  OUTLINED_FUNCTION_33_1();
  swift_release();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_32_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_60_0();
  OUTLINED_FUNCTION_58_0();
  swift_release();
  swift_release();
  *(_QWORD *)(v30 + 16) = v0;
  OUTLINED_FUNCTION_29_0();
}

uint64_t FastEntity.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t dispatch thunk of FastEntityProviding.fastEntity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for FastEntity()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A>(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B>(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C>(_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D>(_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E>(_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F>(_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G>(_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H>(_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I>(_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J>(_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K>(_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L>(_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M>(_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of FastEntity.__allocating_init<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_:_:_:_:_:_:_:_:_:_:_:_:_:_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t OUTLINED_FUNCTION_23_4()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_1(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_26_2(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_28_2(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

__n128 *OUTLINED_FUNCTION_31_1(__n128 *a1, __n128 a2)
{
  a1[1] = a2;
  return a1 + 3;
}

uint64_t OUTLINED_FUNCTION_32_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[74] = a1;
  v2[75] = a2;
  return sub_1A03A4924(v2 + 83);
}

uint64_t OUTLINED_FUNCTION_35_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_36_1(_QWORD *a1)
{
  return sub_1A03A4924(a1);
}

uint64_t OUTLINED_FUNCTION_38_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[81] = a1;
  v2[82] = a2;
  return sub_1A03A4924(v2 + 90);
}

uint64_t OUTLINED_FUNCTION_39_1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[67] = a1;
  v2[68] = a2;
  return sub_1A03A4924(v2 + 76);
}

uint64_t OUTLINED_FUNCTION_41_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  return v2 + 216;
}

uint64_t OUTLINED_FUNCTION_42_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_43_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return v2 + 160;
}

uint64_t OUTLINED_FUNCTION_44_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return v2 + 104;
}

uint64_t OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 480) = a1;
  *(_QWORD *)(v2 + 488) = a2;
  return v2 + 552;
}

uint64_t OUTLINED_FUNCTION_50_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 368) = a1;
  *(_QWORD *)(v2 + 376) = a2;
  return v2 + 440;
}

uint64_t OUTLINED_FUNCTION_52_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 312) = a1;
  *(_QWORD *)(v2 + 320) = a2;
  return v2 + 384;
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_56_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 312) = a1;
  *(_QWORD *)(v2 + 320) = a2;
  return v2 + 384;
}

uint64_t OUTLINED_FUNCTION_57_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 256) = a1;
  *(_QWORD *)(v2 + 264) = a2;
  return v2 + 328;
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_59_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 200) = a1;
  *(_QWORD *)(v2 + 208) = a2;
  return v2 + 272;
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_61_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 144) = a1;
  *(_QWORD *)(v2 + 152) = a2;
  return v2 + 216;
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return v2 + 160;
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return v2 + 104;
}

uint64_t dispatch thunk of ConnectionType.assertions.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ConnectionType.prepare(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of ConnectionType.invoke(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

void sub_1A03C8010()
{
  uint64_t v0;

  sub_1A03A2324(*(sqlite3 **)(v0 + 24));
}

void sub_1A03C8030()
{
  sub_1A03C8010();
}

void sub_1A03C8054(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  a1[2] = a2[2];
  swift_retain();
  OUTLINED_FUNCTION_12();
  swift_retain();
  OUTLINED_FUNCTION_0_4();
}

ValueMetadata *type metadata accessor for Versions()
{
  return &type metadata for Versions;
}

uint64_t sub_1A03C80A4()
{
  swift_beginAccess();
  return swift_retain();
}

void sub_1A03C80E4()
{
  type metadata accessor for FastEntity();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_12();
  swift_retain();
  sub_1A03A8EB8();
  OUTLINED_FUNCTION_0_4();
}

BOOL sub_1A03C8134(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A03C8144()
{
  return sub_1A03D61B8();
}

uint64_t sub_1A03C8168(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_1A03D6134() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A03C823C()
{
  return 2;
}

uint64_t sub_1A03C8244()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

uint64_t sub_1A03C8288(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6E6F6973726576;
  else
    return 25705;
}

uint64_t sub_1A03C82B4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v13 = a3;
  sub_1A03A7148(0, &qword_1EE597960, (uint64_t (*)(void))sub_1A03C8924, (uint64_t)&type metadata for Versions.Entity.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED170]);
  v7 = v6;
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v13 - v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03C8924();
  v11 = sub_1A03D6218();
  v15 = a2;
  v14 = 0;
  OUTLINED_FUNCTION_9_9(v11, &qword_1ED0CE0D8, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for FastColumn);
  sub_1A03C8984(&qword_1EE597968, (uint64_t)&protocol conformance descriptor for FastColumn<A>);
  OUTLINED_FUNCTION_4_13();
  if (!v3)
  {
    v15 = v13;
    v14 = 1;
    OUTLINED_FUNCTION_4_13();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

_QWORD *sub_1A03C8400(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  _QWORD *v13;

  sub_1A03A7148(0, &qword_1EE597948, (uint64_t (*)(void))sub_1A03C8924, (uint64_t)&type metadata for Versions.Entity.CodingKeys, (uint64_t (*)(uint64_t, uint64_t, uint64_t))MEMORY[0x1E0DED048]);
  v3 = MEMORY[0x1E0C80A78](v2);
  OUTLINED_FUNCTION_9_9(v3, (unint64_t *)&qword_1ED0CE578, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for Column);
  swift_initStackObject();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_9_9(v4, &qword_1ED0CE0D8, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for FastColumn);
  inited = (_QWORD *)swift_initStackObject();
  OUTLINED_FUNCTION_15_9(inited);
  swift_initStackObject();
  OUTLINED_FUNCTION_0_1();
  v7 = v6;
  v8 = swift_initStackObject();
  v9 = OUTLINED_FUNCTION_2_13(v8);
  *(_QWORD *)(v9 + 24) = v10;
  *(_QWORD *)(v9 + 32) = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03C8924();
  sub_1A03D6200();
  if (v12)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    OUTLINED_FUNCTION_16();
    swift_setDeallocating();
    sub_1A03C8960();
    swift_deallocClassInstance();
  }
  else
  {
    sub_1A03C8984(&qword_1EE597958, (uint64_t)&protocol conformance descriptor for FastColumn<A>);
    OUTLINED_FUNCTION_3_12();
    OUTLINED_FUNCTION_16();
    inited = v13;
    swift_retain();
    OUTLINED_FUNCTION_3_12();
    swift_release();
    OUTLINED_FUNCTION_6_9();
    OUTLINED_FUNCTION_12();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_release();
    OUTLINED_FUNCTION_16();
  }
  return inited;
}

BOOL sub_1A03C8640(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A03C8134(*a1, *a2);
}

uint64_t sub_1A03C864C()
{
  return sub_1A03C8244();
}

uint64_t sub_1A03C8654()
{
  return sub_1A03C8144();
}

uint64_t sub_1A03C865C()
{
  char *v0;

  return sub_1A03C8288(*v0);
}

uint64_t sub_1A03C8664@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03C8168(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A03C8688@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03C823C();
  *a1 = result;
  return result;
}

uint64_t sub_1A03C86AC()
{
  sub_1A03C8924();
  return sub_1A03D6224();
}

uint64_t sub_1A03C86D4()
{
  sub_1A03C8924();
  return sub_1A03D6230();
}

uint64_t sub_1A03C86FC()
{
  return sub_1A03C80A4();
}

void sub_1A03C8704()
{
  sub_1A03C80E4();
}

uint64_t sub_1A03C870C()
{
  return 0x65765F656C626174;
}

uint64_t sub_1A03C8730()
{
  return 0x302E302E30;
}

_QWORD *sub_1A03C8744@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  uint64_t v4;

  result = sub_1A03B3058(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

_QWORD *sub_1A03C876C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  OUTLINED_FUNCTION_12();
  return a1;
}

_QWORD *assignWithCopy for Versions.Entity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for Versions.Entity(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Versions.Entity(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Versions.Entity(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Versions.Entity()
{
  return &type metadata for Versions.Entity;
}

_QWORD *sub_1A03C88C0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = sub_1A03C8400(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_1A03C88E8(_QWORD *a1)
{
  uint64_t *v1;

  return sub_1A03C82B4(a1, *v1, v1[1]);
}

unint64_t sub_1A03C8900(uint64_t a1)
{
  unint64_t result;

  result = sub_1A03B4FE0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A03C8924()
{
  unint64_t result;

  result = qword_1EE597950;
  if (!qword_1EE597950)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D8214, &type metadata for Versions.Entity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597950);
  }
  return result;
}

uint64_t sub_1A03C8960()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_1A03C8984(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    sub_1A03B318C(255, &qword_1ED0CE0D8, (uint64_t (*)(_QWORD, _QWORD, _UNKNOWN **))type metadata accessor for FastColumn);
    result = MEMORY[0x1A1AF9BC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Versions.Entity.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03C8A20 + 4 * byte_1A03D8049[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A03C8A54 + 4 * byte_1A03D8044[v4]))();
}

uint64_t sub_1A03C8A54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03C8A5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03C8A64);
  return result;
}

uint64_t sub_1A03C8A70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03C8A78);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A03C8A7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03C8A84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Versions.Entity.CodingKeys()
{
  return &type metadata for Versions.Entity.CodingKeys;
}

unint64_t sub_1A03C8AA4()
{
  unint64_t result;

  result = qword_1EE597970;
  if (!qword_1EE597970)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D81EC, &type metadata for Versions.Entity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597970);
  }
  return result;
}

unint64_t sub_1A03C8AE4()
{
  unint64_t result;

  result = qword_1EE597978;
  if (!qword_1EE597978)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D815C, &type metadata for Versions.Entity.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EE597978);
  }
  return result;
}

unint64_t sub_1A03C8B24()
{
  unint64_t result;

  result = qword_1EE597980[0];
  if (!qword_1EE597980[0])
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D8184, &type metadata for Versions.Entity.CodingKeys);
    atomic_store(result, qword_1EE597980);
  }
  return result;
}

uint64_t sub_1A03C8B60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;

  OUTLINED_FUNCTION_3_13();
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  *a1 = v3;
  a1[1] = v4;
  return sub_1A03CCC94(v3, v4);
}

uint64_t MixedKeyValueStore.promises.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = OUTLINED_FUNCTION_3_13();
  v4 = OUTLINED_FUNCTION_17_5(v0, v1, v2, v3);
  return OUTLINED_FUNCTION_26_3(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
}

uint64_t type metadata accessor for MixedKeyValueStore.Promises(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MixedKeyValueStore.Promises);
}

uint64_t MixedKeyValueStore.__allocating_init(database:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = swift_allocObject();
  MixedKeyValueStore.init(database:)(a1, v3, v4, v5);
  return v2;
}

uint64_t *MixedKeyValueStore.init(database:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BYTE v29[16];

  v6 = v4;
  v7 = *v4;
  v4[6] = 0;
  v8 = v4 + 6;
  v4[4] = (uint64_t)sub_1A03A4610;
  v4[5] = 0;
  *((_BYTE *)v4 + 56) = 1;
  v4[2] = a1;
  v9 = *(_QWORD *)(v7 + 80);
  v10 = *(_QWORD *)(v7 + 88);
  v11 = type metadata accessor for MKVSEntity(0, v9, v10, a4);
  swift_retain();
  v12 = MEMORY[0x1A1AF9BC4](&unk_1A03D8458, v11);
  v14 = Database.table<A>(_:)(v11, v11, v12, v13);
  if (v5)
  {
    OUTLINED_FUNCTION_20_0();
    swift_release();
    v15 = swift_release();
    v19 = OUTLINED_FUNCTION_10_6(v15, v16, v17, v18);
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v8, v19);
    swift_deallocPartialClassInstance();
  }
  else
  {
    v6[3] = v14;
    swift_retain();
    sub_1A03A3394();
    v29[8] = 0;
    v20 = swift_beginAccess();
    v24 = OUTLINED_FUNCTION_10_6(v20, v21, v22, v23);
    (*(void (**)(uint64_t *, _BYTE *, uint64_t))(*(_QWORD *)(v24 - 8) + 40))(v8, v29, v24);
    v25 = swift_endAccess();
    MEMORY[0x1E0C80A78](v25);
    sub_1A03D5A20();
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v9;
    *(_QWORD *)(v26 + 24) = v10;
    v27 = (void *)sub_1A03D59E4();
    sub_1A03D59F0();
    swift_release();
    OUTLINED_FUNCTION_25();
    swift_release();

    OUTLINED_FUNCTION_20_0();
  }
  return v6;
}

uint64_t type metadata accessor for MKVSEntity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MKVSEntity);
}

uint64_t sub_1A03C8E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v5;

  v5 = 0;
  swift_retain();
  v3 = Database.asyncWrite(_:block:)(&v5, (uint64_t)sub_1A03CCD10, a2);
  swift_release();
  return v3;
}

uint64_t sub_1A03C8E9C()
{
  uint64_t v0;

  return sub_1A03C8E3C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1A03C8EB4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *a1;
  sub_1A03A6FDC((uint64_t)a1, a2, a3, a4);
  v6 = type metadata accessor for MKVSEntity(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), v5);
  MEMORY[0x1A1AF9BC4](&unk_1A03D843C, v6);
  sub_1A03A63F0(1);
  return swift_release();
}

uint64_t sub_1A03C8F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  if (qword_1ED0CE030 != -1)
    swift_once();
  v5 = (id)qword_1ED0D0000;
  sub_1A03D5DD4();
  sub_1A03A00AC();
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_1A03D6810;
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v9 = v8;
  v10 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v6 + 56) = MEMORY[0x1E0DEA968];
  v11 = sub_1A03A0110();
  *(_QWORD *)(v6 + 64) = v11;
  *(_QWORD *)(v6 + 32) = v7;
  *(_QWORD *)(v6 + 40) = v9;
  sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
  sub_1A03D6008();
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = v11;
  *(_QWORD *)(v6 + 72) = 0;
  *(_QWORD *)(v6 + 80) = 0xE000000000000000;
  sub_1A03D5A2C();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03C9080()
{
  return swift_deallocObject();
}

uint64_t sub_1A03C9090(uint64_t a1)
{
  uint64_t v1;

  return sub_1A03C8F20(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void MixedKeyValueStore.allKeys()()
{
  uint64_t v0;

  sub_1A039DCE0();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_24_2();
}

uint64_t sub_1A03C90F8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
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

  v4 = *a2;
  sub_1A03A5C98();
  v9 = sub_1A039FC78(v5, v6, v7, v8);
  result = swift_release();
  if (!v2)
  {
    v20 = v9;
    MEMORY[0x1E0C80A78](result);
    v11 = *(_QWORD *)(v4 + 88);
    v18 = *(_QWORD *)(v4 + 80);
    v19 = v11;
    type metadata accessor for MKVSEntity(255, v18, v11, v12);
    v13 = sub_1A03D5D50();
    v14 = MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v13);
    v16 = sub_1A03D2B08((void (*)(char *, uint64_t))sub_1A03CCCF4, (uint64_t)&v17, v13, MEMORY[0x1E0DEA968], MEMORY[0x1E0DEDCE8], v14, MEMORY[0x1E0DEDD18], v15);
    swift_bridgeObjectRelease();
    *a1 = v16;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1A03C9210()
{
  uint64_t v0;

  return sub_1A03C90F8(*(uint64_t **)(v0 + 16), *(uint64_t **)(v0 + 24));
}

void MixedKeyValueStore.read<A>(_:maxAge:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = sub_1A03D5918();
  MEMORY[0x1E0C80A78](v3);
  OUTLINED_FUNCTION_4_14(v0, v2);
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_37_0();
}

uint64_t sub_1A03C92D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, _QWORD);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  _BYTE v54[80];

  sub_1A03D5EC4();
  OUTLINED_FUNCTION_18_6();
  MEMORY[0x1E0C80A78](v10);
  *(_QWORD *)(v8 - 224) = &v54[-v11];
  *(_QWORD *)(v8 - 232) = *(_QWORD *)(a1 - 8);
  OUTLINED_FUNCTION_18_6();
  v13 = MEMORY[0x1E0C80A78](v12);
  MEMORY[0x1E0C80A78](v13);
  OUTLINED_FUNCTION_9();
  *(_QWORD *)(v8 - 216) = v14;
  MEMORY[0x1E0C80A78](v15);
  *(_QWORD *)(v8 - 192) = &v54[-v18];
  if (!*(_QWORD *)(v1 + 16))
  {
    swift_getTupleTypeMetadata2();
    sub_1A03D5D14();
    return sub_1A03D5B10();
  }
  *(_QWORD *)(v8 - 168) = v17;
  *(_QWORD *)(v8 - 240) = v16;
  *(_QWORD *)(v8 - 136) = sub_1A03D5AEC();
  v19 = sub_1A03C98A4(v3, v1, v5, v7);
  if (v2)
  {
    swift_bridgeObjectRelease();
    return v1;
  }
  v21 = v6;
  v22 = v19;
  *(_QWORD *)(v8 - 184) = v3;
  *(_QWORD *)(v8 - 320) = v7;
  *(_QWORD *)(v8 - 256) = v21;
  *(_QWORD *)(v8 - 328) = v4;
  *(_QWORD *)(v8 - 176) = 0;
  v23 = type metadata accessor for MKVSEntity(0, *(_QWORD *)(v8 - 208), *(_QWORD *)(v8 - 200), v20);
  OUTLINED_FUNCTION_15_10();
  v24 = sub_1A03D5CE4();
  OUTLINED_FUNCTION_45();
  *(_QWORD *)(v8 - 144) = v24;
  v25 = MEMORY[0x1A1AF92C4](v22, v23);
  *(_QWORD *)(v8 - 248) = v5;
  *(_QWORD *)(v8 - 264) = a1;
  if (v24 == v25)
  {
    OUTLINED_FUNCTION_45();
    v39 = *(void (**)(uint64_t))(*(_QWORD *)(v8 - 184) + 32);
    v40 = OUTLINED_FUNCTION_12();
    v41 = *(_QWORD *)(v8 - 312);
    v39(v40);
    OUTLINED_FUNCTION_25();
    v42 = *(_QWORD *)(v8 - 328);
    sub_1A03D58E8();
    v43 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v8 - 304) + 8);
    *(_QWORD *)(v8 - 168) = v43;
    v44 = v43(v41, *(_QWORD *)(v8 - 296));
    MEMORY[0x1E0C80A78](v44);
    v46 = *(_QWORD *)(v8 - 208);
    v45 = *(_QWORD *)(v8 - 200);
    v48 = *(_QWORD *)(v8 - 256);
    v47 = *(_QWORD *)(v8 - 248);
    *(_QWORD *)&v54[-48] = v46;
    *(_QWORD *)&v54[-40] = v47;
    v49 = *(_QWORD *)(v8 - 320);
    *(_QWORD *)&v54[-32] = v45;
    *(_QWORD *)&v54[-24] = v49;
    v53 = v42;
    swift_bridgeObjectRetain();
    v50 = sub_1A03D5B34();
    MEMORY[0x1E0C80A78](v50);
    *(_QWORD *)&v54[-48] = v46;
    *(_QWORD *)&v54[-40] = v47;
    *(_QWORD *)&v54[-32] = v45;
    *(_QWORD *)&v54[-24] = v49;
    v52 = v48;
    v1 = sub_1A03D5B4C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, _QWORD))(v8 - 168))(v42, *(_QWORD *)(v8 - 296));
    return v1;
  }
  *(_QWORD *)(v8 - 272) = v22 + 32;
  v26 = *(_QWORD *)(v8 - 320);
  v27 = *(_QWORD *)(v8 - 192);
  *(_QWORD *)(v8 - 280) = v22;
  *(_QWORD *)(v8 - 288) = v23;
  v28 = sub_1A03D5D20();
  sub_1A03D5D08();
  if ((v28 & 1) == 0)
  {
    sub_1A03D5F48();
    __break(1u);
    goto LABEL_14;
  }
  v29 = (uint64_t *)(*(_QWORD *)(v8 - 272) + 24 * v24);
  v31 = *v29;
  v30 = v29[1];
  v32 = v29[2];
  OUTLINED_FUNCTION_15_10();
  swift_retain();
  *(_QWORD *)(v8 - 192) = v30;
  swift_retain();
  swift_retain();
  MEMORY[0x1A1AF92D0](v8 - 144, v22, v23);
  OUTLINED_FUNCTION_45();
  sub_1A03C8B60((uint64_t *)(v8 - 160));
  v33 = *(_QWORD *)(v8 - 152);
  if (v33 >> 60 == 15)
  {
LABEL_14:
    __break(1u);
    JUMPOUT(0x1A03C9894);
  }
  v34 = *(_QWORD *)(v8 - 160);
  v35 = *(_QWORD *)(v8 - 248);
  v36 = v26;
  v37 = *(_QWORD *)(v8 - 256);
  v38 = *(_QWORD *)(v8 - 176);
  sub_1A03C9B40(v35, v36, v27);
  v1 = v38;
  sub_1A03B2DC8(v34, v33);
  *(_QWORD *)(v8 - 176) = v38;
  if (!v38)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 168) + 16))(*(_QWORD *)(v8 - 216), v27, v35);
    v52 = v37;
    sub_1A03C9BD4(v31, *(_QWORD *)(v8 - 192), v32, *(_QWORD **)(v8 - 240));
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_20_0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

void type metadata accessor for MKVSEntry()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t sub_1A03C98A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v15;

  v5 = *(_QWORD *)(*(_QWORD *)a1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 88);
  type metadata accessor for MKVSEntity(255, v5, v6, a4);
  sub_1A03D5D50();
  Database.read<A>(block:)();
  if (!v4)
    return v15;
  if (qword_1ED0CE030 != -1)
    swift_once();
  v7 = (id)qword_1ED0D0000;
  sub_1A03D5DD4();
  sub_1A03A00AC();
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1A03D6810;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v6);
  v11 = v10;
  v12 = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v8 + 56) = MEMORY[0x1E0DEA968];
  v13 = sub_1A03A0110();
  *(_QWORD *)(v8 + 64) = v13;
  *(_QWORD *)(v8 + 32) = v9;
  *(_QWORD *)(v8 + 40) = v11;
  sub_1A03A5FF8(0, (unint64_t *)&qword_1ED0CE788);
  sub_1A03D6008();
  *(_QWORD *)(v8 + 96) = v12;
  *(_QWORD *)(v8 + 104) = v13;
  *(_QWORD *)(v8 + 72) = 0;
  *(_QWORD *)(v8 + 80) = 0xE000000000000000;
  sub_1A03D5A2C();

  swift_bridgeObjectRelease();
  return swift_willThrow();
}

#error "1A03C9AA4: call analysis failed (funcsize=51)"

void sub_1A03C9B40(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  void *v8;

  v7 = *v3;
  v8 = (void *)MEMORY[0x1A1AF9810]();
  sub_1A03CBB98(*(_QWORD *)(v7 + 80), a1, *(_QWORD *)(v7 + 88), a2, a3);
  objc_autoreleasePoolPop(v8);
}

void sub_1A03C9BD4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
  type metadata accessor for MKVSEntry();
}

uint64_t sub_1A03C9C18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 32))(v3 + *(int *)(a1 + 60), v2, v1);
}

void sub_1A03C9C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[12];

  v15[2] = a3;
  v15[11] = a2;
  sub_1A03AC4DC(0, &qword_1ED0CDBD8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v13);
  v15[4] = (char *)v15 - v14;
  v15[5] = a4;
  v15[6] = a5;
  v15[7] = a6;
  v15[8] = a7;
  v15[9] = a8;
  type metadata accessor for MKVSEntry();
}

uint64_t sub_1A03C9CE0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t TupleTypeMetadata2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  char v23;
  _BYTE v24[96];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  *(_QWORD *)(v2 - 152) = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v5 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v7 = &v24[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = &v24[-v9];
  v12 = *v1;
  v11 = v1[1];
  v13 = &v24[*(int *)(v8 + 48) - v9];
  *v10 = v12;
  v10[1] = v11;
  v14 = *(_QWORD *)(a1 - 8);
  v15 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v15(v13, *(char **)(v2 - 72), a1);
  *(_QWORD *)(v2 - 72) = TupleTypeMetadata2;
  v16 = (char *)v7 + *(int *)(TupleTypeMetadata2 + 48);
  *v7 = v12;
  v7[1] = v11;
  v15(v16, v13, a1);
  v17 = *((_QWORD *)v16 + 1);
  v18 = *(void (**)(char *, uint64_t))(v14 + 8);
  v19 = *(_QWORD *)(v2 - 128);
  swift_bridgeObjectRetain();
  swift_retain();
  v18(v16, a1);
  v20 = v17 + *(_QWORD *)(*(_QWORD *)v17 + 104);
  swift_beginAccess();
  sub_1A03ABD00(v20, v19);
  swift_release();
  v21 = sub_1A03D5918();
  result = __swift_getEnumTagSinglePayload(v19, 1, v21);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_1A03ABC90(&qword_1ED0CDBD0, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
    v23 = sub_1A03D5BA0();
    (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v2 - 152) + 8))(v10, *(_QWORD *)(v2 - 72));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v19, v21);
    return (v23 & 1) == 0;
  }
  return result;
}

void sub_1A03C9EAC()
{
  type metadata accessor for MKVSEntry();
}

uint64_t sub_1A03C9EE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 16))(v3, v2 + *(int *)(a1 + 60), v1);
}

void MixedKeyValueStore.write<A>(_:)()
{
  OUTLINED_FUNCTION_37_0();
}

void sub_1A03CA554(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;

  v7 = (void *)MEMORY[0x1A1AF9810]();
  sub_1A03CBA00(a1, a2, a4, &v8);
  objc_autoreleasePoolPop(v7);
}

uint64_t sub_1A03CA5EC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
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
  uint64_t v30;

  v30 = a2;
  sub_1A03AC4DC(0, &qword_1ED0CDBD8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v30 - v9;
  sub_1A03AC4DC(0, &qword_1ED0CDC80, sub_1A03AC528);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v30 - v15;
  sub_1A03AC2C8(0, v17, v18, v19);
  swift_allocObject();
  sub_1A03B3124();
  v21 = v20;
  sub_1A03AC528(0);
  v23 = v22;
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v22);
  __swift_storeEnumTagSinglePayload((uint64_t)v14, 1, 1, v23);
  sub_1A03AC208(0, qword_1ED0CDC90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  swift_retain();
  sub_1A03AC370();
  v25 = v24;
  sub_1A03AC318(0);
  swift_allocObject();
  swift_retain();
  sub_1A03AC544();
  swift_retain();
  sub_1A03AC5B8();
  swift_release();
  v26 = sub_1A03D5918();
  v27 = *(_QWORD *)(v26 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v10, a5, v26);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v26);
  v28 = v25 + *(_QWORD *)(*(_QWORD *)v25 + 104);
  swift_beginAccess();
  sub_1A03AC49C((uint64_t)v10, v28, &qword_1ED0CDBD8, (void (*)(uint64_t))MEMORY[0x1E0CB0870]);
  swift_endAccess();
  swift_release();
  sub_1A03AC284(a3, a4);
  sub_1A03AC5E4();
  sub_1A03B0014(a3, a4);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(a5, v26);
  return v21;
}

void sub_1A03CA8E8()
{
  type metadata accessor for MKVSEntry();
}

void MixedKeyValueStore.delete(_:)()
{
  uint64_t v0;

  Database.write(_:block:)();
  if (!v0)
    OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_24_2();
}

uint64_t sub_1A03CAD0C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(result + 16);
  if (v2)
  {
    v3 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    while (1)
    {
      v5 = *(v3 - 1);
      v4 = *v3;
      sub_1A03B454C();
      swift_bridgeObjectRetain();
      sub_1A03C480C(v5, v4, v6, v7);
      if (v1)
        break;
      v3 += 2;
      swift_bridgeObjectRelease();
      swift_release();
      if (!--v2)
        return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

void MixedKeyValueStore.subscript.getter(uint64_t a1, uint64_t a2)
{
  uint64_t inited;

  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE768, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A03D6820;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  MixedKeyValueStore.read<A>(_:maxAge:)();
}

uint64_t sub_1A03CAE54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v1)
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_33_2();
    return __swift_storeEnumTagSinglePayload(v0, 1, 1, v2);
  }
  else
  {
    OUTLINED_FUNCTION_34_2();
    OUTLINED_FUNCTION_33_2();
    sub_1A03D5B40();
    swift_bridgeObjectRelease();
    v4 = sub_1A03D5B28();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DE9FA0], v4);
    sub_1A03D5DA4();
    return swift_bridgeObjectRelease();
  }
}

void sub_1A03CAF1C(uint64_t a1, uint64_t *a2)
{
  MixedKeyValueStore.subscript.getter(*a2, a2[1]);
}

uint64_t sub_1A03CAF4C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v6 = *(uint64_t *)((char *)a3 + a4 - 32);
  v7 = *(uint64_t *)((char *)a3 + a4 - 16);
  v8 = *(uint64_t *)((char *)a3 + a4 - 8);
  v9 = sub_1A03D5EC4();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v16 - v10;
  v13 = *a3;
  v12 = a3[1];
  (*(void (**)(char *, uint64_t))(v14 + 16))((char *)&v16 - v10, a1);
  swift_bridgeObjectRetain();
  return MixedKeyValueStore.subscript.setter((uint64_t)v11, v13, v12, v6, v7, v8);
}

uint64_t MixedKeyValueStore.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t);
  uint64_t inited;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v24[4];

  v24[1] = a5;
  v24[2] = a6;
  v10 = sub_1A03D5EC4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v24 - v13;
  v15 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](v12);
  v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a1, v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, a4) != 1)
  {
    v24[0] = a1;
    OUTLINED_FUNCTION_39((uint64_t)v17, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
    v20 = OUTLINED_FUNCTION_42();
    sub_1A03D6110();
    swift_allocObject();
    sub_1A03D5CFC();
    v22 = (uint64_t)v21 + *(int *)(v20 + 48);
    *v21 = a2;
    v21[1] = a3;
    OUTLINED_FUNCTION_39(v22, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
    sub_1A03B5E64();
    sub_1A03D5B10();
    MixedKeyValueStore.write<A>(_:)();
  }
  v18 = *(void (**)(char *, uint64_t))(v11 + 8);
  v18(v14, v10);
  sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE768, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DED1E8]);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A03D6820;
  *(_QWORD *)(inited + 32) = a2;
  *(_QWORD *)(inited + 40) = a3;
  MixedKeyValueStore.delete(_:)();
  swift_bridgeObjectRelease_n();
  return ((uint64_t (*)(uint64_t, uint64_t))v18)(a1, v10);
}

void MixedKeyValueStore.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;

  v13 = malloc(0x50uLL);
  *a1 = v13;
  v13[4] = a6;
  v13[5] = v6;
  v13[2] = a4;
  v13[3] = a5;
  *v13 = a2;
  v13[1] = a3;
  v14 = sub_1A03D5EC4();
  v13[6] = v14;
  v15 = *(_QWORD *)(v14 - 8);
  v13[7] = v15;
  v16 = *(_QWORD *)(v15 + 64);
  v13[8] = malloc(v16);
  v13[9] = malloc(v16);
  MixedKeyValueStore.subscript.getter(a2, a3);
}

void (*sub_1A03CB2F4())(uint64_t **a1, char a2)
{
  return sub_1A03CB318;
}

void sub_1A03CB318(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
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

  v2 = *a1;
  v3 = (void *)(*a1)[8];
  v4 = (void *)(*a1)[9];
  if ((a2 & 1) != 0)
  {
    v5 = v2[6];
    v6 = v2[7];
    v7 = v2[4];
    v9 = v2[2];
    v8 = v2[3];
    v11 = *v2;
    v10 = v2[1];
    OUTLINED_FUNCTION_39((uint64_t)v3, (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    swift_bridgeObjectRetain();
    MixedKeyValueStore.subscript.setter((uint64_t)v3, v11, v10, v9, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v12 = v2[4];
    v14 = v2[2];
    v13 = v2[3];
    v16 = *v2;
    v15 = v2[1];
    OUTLINED_FUNCTION_15_10();
    MixedKeyValueStore.subscript.setter((uint64_t)v4, v16, v15, v14, v13, v12);
  }
  free(v4);
  free(v3);
  free(v2);
}

void MixedKeyValueStore.subscript.getter()
{
  MixedKeyValueStore.read<A>(_:maxAge:)();
}

uint64_t sub_1A03CB424()
{
  uint64_t v0;
  uint64_t result;

  if (v0)
  {
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_42();
    sub_1A03D5D14();
    return sub_1A03D5B10();
  }
  return result;
}

void static MixedKeyValueStore.+= infix<A>(_:_:)()
{
  MixedKeyValueStore.write<A>(_:)();
}

void sub_1A03CB4BC()
{
  void *v0;

  if (v0)

  else
    swift_bridgeObjectRelease();
}

void MixedKeyValueStore.Promises.allKeys()()
{
  sub_1A039E5BC();
  OUTLINED_FUNCTION_31();
  sub_1A03D5A08();
  OUTLINED_FUNCTION_24_2();
}

uint64_t sub_1A03CB534(void (*a1)(uint64_t *))
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = swift_weakLoadStrong();
  if (result)
  {
    MixedKeyValueStore.allKeys()();
    v4 = v3;
    swift_release();
    v5 = v4;
    a1(&v5);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MixedKeyValueStore.Promises.read<A>(_:maxAge:)()
{
  OUTLINED_FUNCTION_53_0();
  sub_1A03D5B64();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_7_13();
  return OUTLINED_FUNCTION_41();
}

void sub_1A03CB65C()
{
  if (swift_weakLoadStrong())
    MixedKeyValueStore.read<A>(_:maxAge:)();
  __break(1u);
}

uint64_t MixedKeyValueStore.Promises.write<A>(_:)()
{
  OUTLINED_FUNCTION_53_0();
  sub_1A03D5B64();
  OUTLINED_FUNCTION_38();
  OUTLINED_FUNCTION_7_13();
  return OUTLINED_FUNCTION_41();
}

void sub_1A03CB7B4()
{
  if (swift_weakLoadStrong())
    MixedKeyValueStore.write<A>(_:)();
  __break(1u);
}

void MixedKeyValueStore.Promises.delete(_:)()
{
  sub_1A039E5BC();
  OUTLINED_FUNCTION_31();
  sub_1A03D5A08();
  OUTLINED_FUNCTION_24_2();
}

uint64_t sub_1A03CB8D4(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t result;
  uint64_t v9;

  result = swift_weakLoadStrong();
  if (result)
  {
    MixedKeyValueStore.delete(_:)();
    swift_release();
    v9 = a6;
    a1(&v9);
    return swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void MixedKeyValueStore.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  v1 = swift_release();
  v5 = OUTLINED_FUNCTION_17_5(v1, v2, v3, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v0 + 48, v5);
  OUTLINED_FUNCTION_0_4();
}

uint64_t MixedKeyValueStore.__deallocating_deinit()
{
  MixedKeyValueStore.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A03CBA00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X5>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t TupleTypeMetadata2;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _QWORD v18[4];

  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  sub_1A03D6110();
  swift_allocObject();
  sub_1A03D5CFC();
  v11 = (char *)v10 + *(int *)(TupleTypeMetadata2 + 48);
  *v10 = 118;
  v10[1] = 0xE100000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(v11, a1, a2);
  sub_1A03B5E64();
  v12 = sub_1A03D5B10();
  sub_1A03D57EC();
  swift_allocObject();
  sub_1A03D57E0();
  v18[3] = v12;
  v13 = sub_1A03D5B64();
  v18[0] = MEMORY[0x1E0DEA970];
  v18[1] = a3;
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEA0B8], v13, v18);
  v14 = sub_1A03D57D4();
  v16 = v15;
  swift_bridgeObjectRelease();
  result = swift_release();
  if (!v4)
  {
    *a4 = v14;
    a4[1] = v16;
  }
  return result;
}

uint64_t sub_1A03CBB98@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
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
  _QWORD v25[2];
  _QWORD v26[4];

  v23 = a1;
  v24 = a3;
  v22 = a5;
  v7 = sub_1A03D5EC4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v21 - v9;
  sub_1A03D5960();
  swift_allocObject();
  sub_1A03D5954();
  v11 = sub_1A03D5B64();
  v26[0] = MEMORY[0x1E0DEA9A0];
  v26[1] = a4;
  MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEA0D8], v11, v26);
  v12 = v26[3];
  sub_1A03D5948();
  result = swift_release();
  if (!v12)
  {
    v14 = v8;
    v16 = v22;
    v15 = v23;
    v18 = v24;
    v17 = v25[0];
    v25[0] = 118;
    v25[1] = 0xE100000000000000;
    MEMORY[0x1A1AF90FC](v25, v17, MEMORY[0x1E0DEA968], a2, MEMORY[0x1E0DEA978]);
    swift_bridgeObjectRelease();
    if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v7);
      v20 = type metadata accessor for MixedKeyValueStore.TranslationError(0, v15, v18, v19);
      MEMORY[0x1A1AF9BC4](&unk_1A03D85E8, v20);
      swift_allocError();
      return swift_willThrow();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(v16, v10, a2);
    }
  }
  return result;
}

uint64_t sub_1A03CBD8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  sub_1A03AC4DC(0, &qword_1ED0CDC80, sub_1A03AC528);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v14 - v4;
  sub_1A03AC2C8(0, v6, v7, v8);
  swift_allocObject();
  sub_1A03B3124();
  v10 = v9;
  sub_1A03AC528(0);
  v12 = v11;
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v11);
  __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v12);
  sub_1A03AC208(0, qword_1ED0CDC90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A03AC370();
  sub_1A03AC318(0);
  swift_allocObject();
  sub_1A03AC544();
  return v10;
}

uint64_t sub_1A03CBF2C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v20 = a3;
  v19 = a4;
  v8 = type metadata accessor for MKVSEntity.CodingKeys(255, a5, a6, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D8628, v8);
  v9 = sub_1A03D60F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  v23 = a2;
  v22 = 0;
  sub_1A03AC2C8(0, v13, v14, v15);
  sub_1A03ABC90(&qword_1EE597470, (void (*)(uint64_t))sub_1A03AC2C8);
  v16 = v21;
  sub_1A03D60EC();
  if (!v16)
  {
    v17 = v19;
    v23 = v20;
    v22 = 1;
    sub_1A03AC208(0, qword_1ED0CDC90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    sub_1A03CCC44(&qword_1EE597478);
    sub_1A03D60EC();
    v23 = v17;
    v22 = 2;
    sub_1A03AC318(0);
    sub_1A03ABC90(qword_1EE597480, sub_1A03AC318);
    sub_1A03D60EC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1A03CC13C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  char *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;

  v5 = type metadata accessor for MKVSEntity.CodingKeys(255, a2, a3, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D8628, v5);
  v32 = sub_1A03D60B0();
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v7 = (char *)&v30 - v6;
  sub_1A03AC4DC(0, &qword_1ED0CDC80, sub_1A03AC528);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v30 - v12;
  sub_1A03AC2C8(0, v14, v15, v16);
  v30 = v17;
  swift_initStackObject();
  sub_1A03B3124();
  v35 = v18;
  sub_1A03AC528(0);
  v20 = v19;
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v19);
  __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v20);
  sub_1A03AC208(0, qword_1ED0CDC90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
  swift_allocObject();
  sub_1A03AC370();
  v36 = v21;
  sub_1A03AC318(0);
  swift_initStackObject();
  sub_1A03AC544();
  v33 = v22;
  v23 = a1[3];
  v34 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v23);
  v24 = v37;
  sub_1A03D6200();
  if (v24)
  {
    v29 = v35;
  }
  else
  {
    v25 = v31;
    v38 = 0;
    sub_1A03ABC90(&qword_1EE597458, (void (*)(uint64_t))sub_1A03AC2C8);
    v26 = v32;
    v27 = v7;
    sub_1A03D60A4();
    swift_release();
    v29 = v39;
    v38 = 1;
    sub_1A03CCC44(&qword_1EE597460);
    swift_retain();
    sub_1A03D60A4();
    swift_release();
    v38 = 2;
    sub_1A03ABC90(&qword_1EE597468, sub_1A03AC318);
    swift_retain();
    sub_1A03D60A4();
    swift_release();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v26);
    swift_retain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  swift_release();
  swift_release();
  swift_release();
  return v29;
}

uint64_t sub_1A03CC5EC(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8628, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03CC620(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8628, a1);
  return sub_1A03D6230();
}

uint64_t sub_1A03CC654@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_1A03CBD8C();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_1A03CC684@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = sub_1A03CC13C(a1, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
  if (!v4)
  {
    *a4 = result;
    a4[1] = v7;
    a4[2] = v8;
  }
  return result;
}

uint64_t sub_1A03CC6B8(_QWORD *a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1A03CBF2C(a1, *v2, v2[1], v2[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_1A03CC6DC()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

void sub_1A03CC70C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_1A03C9C48(a1, a2, v2[7], v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_1A03CC724(char a1)
{
  return a1 & 1;
}

void sub_1A03CC730()
{
  sub_1A03C9EAC();
}

void sub_1A03CC750()
{
  sub_1A03CA8E8();
}

uint64_t sub_1A03CC770()
{
  uint64_t v0;

  return sub_1A03CAD0C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A03CC788(void (*a1)(uint64_t *))
{
  return sub_1A03CB534(a1);
}

void sub_1A03CC794()
{
  sub_1A03CB65C();
}

void sub_1A03CC7CC()
{
  sub_1A03CB7B4();
}

uint64_t sub_1A03CC800(void (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_1A03CB8D4(a1, a2, a3, a4, *(_QWORD *)(v4 + 32), *(_QWORD *)(v4 + 40));
}

uint64_t sub_1A03CC814()
{
  return 40;
}

__n128 sub_1A03CC820(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  *(__n128 *)a2 = result;
  *(_OWORD *)(a2 + 16) = v3;
  return result;
}

uint64_t method lookup function for MixedKeyValueStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MixedKeyValueStore.__allocating_init(database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A03CC858()
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

uint64_t sub_1A03CC8D0(_QWORD *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a3 + 24);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 24) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)((char *)a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)((char *)a1 + v10);
      if (!*(_WORD *)((char *)a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload(((unint64_t)a1 + v8 + 24) & ~v8, v6, v4);
      v16 = *a1;
      if (*a1 >= 0xFFFFFFFFuLL)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *((unsigned __int8 *)a1 + v10);
  if (!*((_BYTE *)a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03CC9A4 + 4 * byte_1A03D8280[(v10 - 1)]))();
}

void sub_1A03CCA10(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  size_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0u;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        bzero(a1, v7);
        if ((_DWORD)v7 == 3)
        {
          *a1 = v12;
          *((_BYTE *)a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      bzero(a1, v7);
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_1A03CCC00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D83E8, (uint64_t)&unk_1A03D83C0);
}

uint64_t sub_1A03CCC14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A039F9E4(a1, a2, a3, (uint64_t)&unk_1A03D843C, (uint64_t)&unk_1A03D8420);
}

uint64_t sub_1A03CCC28(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return sub_1A03B0014(a1, a2);
}

uint64_t type metadata accessor for MKVSEntity.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MKVSEntity.CodingKeys);
}

void sub_1A03CCC44(_QWORD *a1)
{
  if (!*a1)
  {
    sub_1A03AC208(255, qword_1ED0CDC90, (uint64_t (*)(uint64_t, uint64_t, uint64_t))type metadata accessor for Column);
    OUTLINED_FUNCTION_37();
  }
  OUTLINED_FUNCTION_14();
}

uint64_t type metadata accessor for MixedKeyValueStore.TranslationError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MixedKeyValueStore.TranslationError);
}

uint64_t sub_1A03CCC94(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1A03AC284(a1, a2);
  return a1;
}

uint64_t sub_1A03CCCA8()
{
  _QWORD *v0;

  return sub_1A03C9A70(v0[5], v0[6], v0[2], v0[3], v0[4]);
}

uint64_t sub_1A03CCCC8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1A03CCCF4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_1A03B6008(a1, a2);
}

uint64_t sub_1A03CCD10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_1A03C8EB4(v4, a2, a3, a4);
}

uint64_t sub_1A03CCD28(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03CCD68 + 4 * byte_1A03D828E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03CCD88 + 4 * byte_1A03D8293[v4]))();
}

_BYTE *sub_1A03CCD68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03CCD88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03CCD90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03CCD98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03CCDA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03CCDA8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1A03CCDB4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03CCE00 + 4 * byte_1A03D829D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A03CCE34 + 4 * byte_1A03D8298[v4]))();
}

uint64_t sub_1A03CCE34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CCE3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03CCE44);
  return result;
}

uint64_t sub_1A03CCE50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03CCE58);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A03CCE5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CCE64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1A03CCE70()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CCE80()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CCE90()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CCEA0()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t OUTLINED_FUNCTION_26_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_33_2()
{
  return sub_1A03CC6DC();
}

uint64_t OUTLINED_FUNCTION_34_2()
{
  return swift_setDeallocating();
}

uint64_t OUTLINED_FUNCTION_36_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_37_0()
{
  type metadata accessor for MKVSEntry();
}

uint64_t sub_1A03CCF04()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A03CCF30()
{
  return sub_1A03CCF04();
}

uint64_t Int.valueType.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t sub_1A03CCF60@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return Int.valueType.getter(*v1, a1);
}

uint64_t sub_1A03CCF68(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    sub_1A03AD374(0, v1, 0);
    v2 = v11;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v7 >> 1)
        sub_1A03AD374((char *)(v7 > 1), v8 + 1, 1);
      v4 += 7;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

_QWORD *FastColumn.__allocating_init(wrappedValue:name:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  OUTLINED_FUNCTION_2_16();
  result = (_QWORD *)swift_allocObject();
  result[3] = a3;
  result[4] = a1;
  result[2] = a2;
  return result;
}

uint64_t FastColumn.name.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t FastColumn.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_release();
}

uint64_t (*FastColumn.wrappedValue.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1A03CD124(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_1A03D6134() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x5664657070617277 && a2 == 0xEC00000065756C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A03CD218(char a1)
{
  if ((a1 & 1) != 0)
    return 0x5664657070617277;
  else
    return 1701667182;
}

BOOL sub_1A03CD250(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A03C8134(*a1, *a2);
}

uint64_t sub_1A03CD264()
{
  return sub_1A03C8244();
}

uint64_t sub_1A03CD274()
{
  return sub_1A03C8144();
}

uint64_t sub_1A03CD284()
{
  sub_1A03D61AC();
  sub_1A03C8144();
  return sub_1A03D61C4();
}

uint64_t sub_1A03CD2C8()
{
  char *v0;

  return sub_1A03CD218(*v0);
}

uint64_t sub_1A03CD2D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03CD124(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A03CD304()
{
  return sub_1A03B7838();
}

uint64_t sub_1A03CD328@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1A03C823C();
  *a1 = result;
  return result;
}

uint64_t sub_1A03CD354(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8950, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03CD388(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8950, a1);
  return sub_1A03D6230();
}

uint64_t FastColumn.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;

  v5 = v4;
  v7 = *(_QWORD *)(*v5 + 88);
  v18 = *(_QWORD *)(*v5 + 80);
  v17 = v7;
  v8 = type metadata accessor for FastColumn.CodingKeys(255, v18, v7, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D8950, v8);
  v9 = sub_1A03D60F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  v21 = 0;
  v13 = v19;
  sub_1A03D60BC();
  if (!v13)
  {
    swift_beginAccess();
    v22 = v5[4];
    v20 = 1;
    type metadata accessor for Column(0, v18, v17, v14);
    OUTLINED_FUNCTION_3_14();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for FastColumn.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FastColumn.CodingKeys);
}

void FastColumn.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_2_16();
  swift_allocObject();
  FastColumn.init(from:)(a1, v2, v3, v4);
}

uint64_t sub_1A03CD57C()
{
  uint64_t v0;

  return v0;
}

void FastColumn.init(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for FastColumn.CodingKeys(255, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  OUTLINED_FUNCTION_3_14();
}

uint64_t sub_1A03CD5E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = sub_1A03D60B0();
  *(_QWORD *)(v2 - 104) = v3;
  MEMORY[0x1E0C80A78](v3);
  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  v4 = *(_QWORD *)(v2 - 96);
  sub_1A03D6200();
  if (!v4)
  {
    v5 = *(_QWORD *)(v2 - 112);
    *(_QWORD *)(v2 - 96) = v0;
    *(_BYTE *)(v2 - 65) = 0;
    *(_QWORD *)(v1 + 16) = sub_1A03D6074();
    *(_QWORD *)(v1 + 24) = v6;
    type metadata accessor for Column(0, v5, *(_QWORD *)(v2 - 120), v7);
    *(_BYTE *)(v2 - 66) = 1;
    OUTLINED_FUNCTION_3_14();
  }
  swift_deallocPartialClassInstance();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v0);
  return v1;
}

void sub_1A03CD750(uint64_t a1)
{
  FastColumn.__allocating_init(from:)(a1);
}

uint64_t sub_1A03CD764(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  if (!v2)
    *v1 = result;
  return result;
}

uint64_t sub_1A03CD778(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return FastColumn.encode(to:)(a1, a2, a3, a4);
}

uint64_t FastColumn.description.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_17();
  swift_retain();
  v0 = Column.description.getter();
  swift_release();
  return v0;
}

uint64_t sub_1A03CD7EC()
{
  return FastColumn.description.getter();
}

uint64_t method lookup function for FastColumn()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FastColumn.__allocating_init(wrappedValue:name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FastColumn.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1A03CD838(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03CD884 + 4 * byte_1A03D879D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A03CD8B8 + 4 * asc_1A03D8798[v4]))();
}

uint64_t sub_1A03CD8B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CD8C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03CD8C8);
  return result;
}

uint64_t sub_1A03CD8D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03CD8DCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A03CD8E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CD8E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1A03CD8F4()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CD904()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CD914()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t Transaction.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x54414944454D4D49;
  if (*v0 != 1)
    v1 = 0x564953554C435845;
  if (*v0)
    return v1;
  else
    return 0x4445525245464544;
}

TeaDB::Transaction_optional __swiftcall Transaction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TeaDB::Transaction_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1A03D6068();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1A03CD9E0(char *a1, char *a2)
{
  sub_1A03BCF28(*a1, *a2);
}

unint64_t sub_1A03CD9F0()
{
  unint64_t result;

  result = qword_1EE597B08[0];
  if (!qword_1EE597B08[0])
  {
    result = MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for Transaction, &type metadata for Transaction);
    atomic_store(result, qword_1EE597B08);
  }
  return result;
}

uint64_t sub_1A03CDA2C()
{
  char *v0;

  return sub_1A03BBDF4(*v0);
}

uint64_t sub_1A03CDA34(uint64_t a1)
{
  char *v1;

  return sub_1A03BBEA4(a1, *v1);
}

uint64_t sub_1A03CDA3C(uint64_t a1)
{
  char *v1;

  return sub_1A03BBF1C(a1, *v1);
}

TeaDB::Transaction_optional sub_1A03CDA44(Swift::String *a1)
{
  return Transaction.init(rawValue:)(*a1);
}

uint64_t sub_1A03CDA50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = Transaction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t storeEnumTagSinglePayload for Transaction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03CDAC0 + 4 * byte_1A03D89A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A03CDAF4 + 4 * byte_1A03D89A0[v4]))();
}

uint64_t sub_1A03CDAF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CDAFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03CDB04);
  return result;
}

uint64_t sub_1A03CDB10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03CDB18);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A03CDB1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CDB24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void LazyEntity.identifier.getter()
{
  OUTLINED_FUNCTION_5_10();
  OUTLINED_FUNCTION_14();
}

uint64_t LazyEntity.loaderValue.getter@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  LazyLoader.load()(a1, a2);
  return __swift_storeEnumTagSinglePayload((uint64_t)a2, 0, 1, *(_QWORD *)(v4 + 80));
}

uint64_t LazyEntity.__allocating_init(value:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0();
  LazyEntity.init(value:)(a1);
  return v2;
}

uint64_t LazyEntity.init(value:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 88);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 24))(v4, v9);
  swift_beginAccess();
  v12 = *(_QWORD *)(v10 + 24);
  v11 = *(_QWORD *)(v10 + 32);
  OUTLINED_FUNCTION_5_10();
  result = swift_release();
  if (v11)
  {
    v2[2] = v12;
    v2[3] = v11;
    OUTLINED_FUNCTION_2_17(*(_QWORD *)(v9 + 8));
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v14 = LazyLoader.__allocating_init(object:)((uint64_t)v7);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
    v2[4] = v14;
    return (uint64_t)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A03CDCF8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

uint64_t LazyEntity.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A03CDD34(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v7;

  v2 = a1 == 0x696669746E656469 && a2 == 0xEA00000000007265;
  if (v2 || (sub_1A03D6134() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x726564616F6CLL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_1A03CDE24(char a1)
{
  if ((a1 & 1) != 0)
    return 0x726564616F6CLL;
  else
    return 0x696669746E656469;
}

uint64_t sub_1A03CDE5C()
{
  char *v0;

  return sub_1A03CDE24(*v0);
}

uint64_t sub_1A03CDE6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03CDD34(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1A03CDE98(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8C30, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03CDECC(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D8C30, a1);
  return sub_1A03D6230();
}

uint64_t LazyEntity.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t LazyEntity.__deallocating_deinit()
{
  LazyEntity.deinit();
  return swift_deallocClassInstance();
}

uint64_t LazyEntity.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;

  v5 = v4;
  v7 = *(_QWORD *)(*v5 + 88);
  v17 = *(_QWORD *)(*v5 + 80);
  v16 = v7;
  v8 = type metadata accessor for LazyEntity.CodingKeys(255, v17, v7, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D8C30, v8);
  v9 = sub_1A03D60F8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - v11;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1A03D6218();
  v21 = 0;
  v13 = v18;
  sub_1A03D60BC();
  if (!v13)
  {
    v19 = v5[4];
    v20 = 1;
    v14 = type metadata accessor for LazyLoader(0, v17, *(_QWORD *)(*(_QWORD *)(v16 + 8) + 8), *(_QWORD *)(*(_QWORD *)(v16 + 8) + 16));
    MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyLoader<A>, v14);
    sub_1A03D60EC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t type metadata accessor for LazyEntity.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LazyEntity.CodingKeys);
}

uint64_t LazyEntity.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = swift_allocObject();
  LazyEntity.init(from:)(a1, v3, v4, v5);
  return v2;
}

_QWORD *LazyEntity.init(from:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  char v23;
  char v24;

  v6 = *(_QWORD *)(*v4 + 80);
  v17 = *(_QWORD *)(*v4 + 88);
  v18 = v6;
  v7 = type metadata accessor for LazyEntity.CodingKeys(255, v6, v17, a4);
  MEMORY[0x1A1AF9BC4](&unk_1A03D8C30, v7);
  v20 = sub_1A03D60B0();
  MEMORY[0x1E0C80A78](v20);
  v9 = (char *)&v17 - v8;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v19 = v9;
  v10 = v21;
  sub_1A03D6200();
  if (v10)
  {
    swift_deallocPartialClassInstance();
    v16 = (uint64_t)a1;
  }
  else
  {
    v12 = v17;
    v11 = v18;
    v21 = a1;
    v24 = 0;
    v4[2] = sub_1A03D6074();
    v4[3] = v13;
    v14 = type metadata accessor for LazyLoader(0, v11, *(_QWORD *)(*(_QWORD *)(v12 + 8) + 8), *(_QWORD *)(*(_QWORD *)(v12 + 8) + 16));
    v23 = 1;
    MEMORY[0x1A1AF9BC4](&protocol conformance descriptor for LazyLoader<A>, v14);
    sub_1A03D60A4();
    OUTLINED_FUNCTION_0_18();
    v16 = (uint64_t)v21;
    v4[4] = v22;
  }
  __swift_destroy_boxed_opaque_existential_1(v16);
  return v4;
}

uint64_t sub_1A03CE2E0@<X0>(uint64_t a1@<X8>)
{
  return LazyEntity.valueType.getter(a1);
}

uint64_t sub_1A03CE300@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = LazyEntity.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_1A03CE328(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return LazyEntity.encode(to:)(a1, a2, a3, a4);
}

uint64_t sub_1A03CE348(uint64_t a1)
{
  return LazyEntity.saveChain(for:)(a1);
}

uint64_t LazyEntity.saveChain(for:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LazyLoader.load()(v6, v8);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 88) + 16) + 24) + 8))(a1, v4);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v9;
}

void static LazyEntity.createTableChain(for:ifNotExists:)()
{
  void (*v0)(void);

  OUTLINED_FUNCTION_4_15();
  v0();
  OUTLINED_FUNCTION_14();
}

void static LazyEntity.createTableChain(for:ifNotExists:shouldVersion:)()
{
  void (*v0)(void);

  OUTLINED_FUNCTION_4_15();
  v0();
  OUTLINED_FUNCTION_14();
}

uint64_t method lookup function for LazyEntity()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(valueType:connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyEntity.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_1A03CE5F8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03CE644 + 4 * byte_1A03D8A75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A03CE678 + 4 * byte_1A03D8A70[v4]))();
}

uint64_t sub_1A03CE678(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CE680(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03CE688);
  return result;
}

uint64_t sub_1A03CE694(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03CE69CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A03CE6A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CE6A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1A03CE6B4()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CE6C4()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03CE6D4()
{
  JUMPOUT(0x1A1AF9BC4);
}

uint64_t sub_1A03CE6E4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

unint64_t sub_1A03CE710()
{
  unint64_t result;

  result = qword_1EE597B90;
  if (!qword_1EE597B90)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D9650, &type metadata for LazyLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EE597B90);
  }
  return result;
}

void sub_1A03CE74C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, __int128 a11, char a12, uint64_t a13, uint64_t a14, unint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30)
{
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  OUTLINED_FUNCTION_7_14();
  a29 = v31;
  a30 = v32;
  v34 = *(_QWORD *)v33;
  v35 = *(_QWORD *)(v33 + 8);
  v36 = *(_BYTE *)(v33 + 16);
  OUTLINED_FUNCTION_5_11(v33, v32, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v30 + 104) + 8), v37);
  v38 = OUTLINED_FUNCTION_12_9();
  sub_1A03A050C(v38);
  a15 = 0xF000000000000007;
  *(_QWORD *)&a11 = v34;
  *((_QWORD *)&a11 + 1) = v35;
  a12 = v36;
  sub_1A03AB470();
  v39 = OUTLINED_FUNCTION_10_7();
  OUTLINED_FUNCTION_15_11(v39, v40, v41, v42, v43);
  OUTLINED_FUNCTION_6_5();
  v44 = sub_1A03AB468();
  OUTLINED_FUNCTION_11_11(v44, v45, v46, v47);
  v48 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_13_7(v48, (uint64_t)&a11);
  v51 = OUTLINED_FUNCTION_0_19(&a20, v49, v50, &a11);
  OUTLINED_FUNCTION_4_16(v51);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_1_18();
}

uint64_t sub_1A03CE81C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  char v24;

  v6 = (uint64_t)(v4 + 2);
  v5 = *v4;
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  OUTLINED_FUNCTION_9_10(a1, a2, a3, a4);
  v10 = OUTLINED_FUNCTION_3_15();
  v23 = 0xF000000000000007;
  *(_QWORD *)&v21 = v7;
  *((_QWORD *)&v21 + 1) = v8;
  v22 = v9;
  sub_1A03AB470();
  v11 = *(_QWORD *)(v5 + 80);
  v12 = *(_QWORD *)(v5 + 96);
  v13 = sub_1A03A9DFC(v10, &v23, (uint64_t)&v21, 1, 0, v11, v12);
  OUTLINED_FUNCTION_6_5();
  sub_1A03AB468();
  v15 = sub_1A03A60E8(v13, v11, v12, v14);
  v17 = v16;
  swift_bridgeObjectRelease();
  sub_1A03AE220(v6, (uint64_t)&v21);
  v18 = sub_1A03AD7A0(&v24, v15, v17, &v21);
  sub_1A03AD83C(v18);
  result = OUTLINED_FUNCTION_11_5();
  if (!v12)
  {
    *(_QWORD *)&v21 = v6;
    v20 = OUTLINED_FUNCTION_14_4();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF50], v20);
    sub_1A03D5DA4();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t QuerySome.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t method lookup function for QuerySome()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of QuerySome.all(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of QuerySome.first(orderBy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t Bool.queryValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 49;
  else
    return 48;
}

uint64_t Bool.valueType.getter@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result & 1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 2;
  return result;
}

uint64_t sub_1A03CEA08@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return Bool.valueType.getter(*v1, a1);
}

uint64_t sub_1A03CEA10()
{
  char *v0;

  return Bool.queryValue.getter(*v0);
}

uint64_t sub_1A03CEA2C(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (sub_1A03D10C4(a1), (v2 & 1) != 0))
    return swift_unknownObjectRetain();
  else
    return 0;
}

uint64_t assertion<A>(invoking:)(void (*a1)(void))
{
  char v2;

  v2 = 0;
  return assertion<A>(_:invoking:)(&v2, a1);
}

uint64_t Assertion.__allocating_init(name:)(_BYTE *a1)
{
  uint64_t v1;

  *(_BYTE *)(OUTLINED_FUNCTION_2_18() + 16) = *a1;
  sub_1A03B3A5C();
  if (v1)
    OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_4_17();
}

uint64_t sub_1A03CEAE8(uint64_t a1)
{
  return sub_1A03CEAFC(a1, sub_1A03D1570, &qword_1ED0CE878);
}

uint64_t sub_1A03CEAFC(uint64_t a1, void (*a2)(_QWORD), uint64_t *a3)
{
  uint64_t result;

  a2(0);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = MEMORY[0x1E0DEE9E0];
  *a3 = result;
  return result;
}

uint64_t sub_1A03CEB40()
{
  uint64_t v0;

  v0 = sub_1A03D5A5C();
  __swift_allocate_value_buffer(v0, qword_1ED0CE890);
  *(_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1ED0CE890) = 500;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

BOOL static Assertion.Name.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t Assertion.Name.hash(into:)()
{
  return sub_1A03D61B8();
}

uint64_t Assertion.Name.hashValue.getter()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

void sub_1A03CEC30(unsigned __int8 *a1@<X0>, uint64_t a2@<X8>)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  id v28;
  char v29;
  unint64_t v31;
  uint64_t v32;
  id v33[2];

  v33[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = *a1;
  sub_1A03D1690(0, (unint64_t *)&unk_1ED0CE840);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1A03D8D00;
  v29 = v2;
  if (v2)
    v4 = 0x61546873696E6946;
  else
    v4 = 0xD000000000000019;
  if (v2)
    v5 = 0xED0000776F4E6B73;
  else
    v5 = 0x80000001A03DA160;
  sub_1A03D1734(0, &qword_1ED0CE838);
  v31 = v5;
  *(_QWORD *)(v3 + 32) = sub_1A03B3BF0();
  *(_QWORD *)(v3 + 40) = objc_msgSend((id)objc_opt_self(), sel_attributeWithCompletionPolicy_, 1);
  v33[0] = (id)v3;
  sub_1A03D5CF0();
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentProcess);
  v7 = objc_allocWithZone(MEMORY[0x1E0D87C98]);
  v8 = sub_1A03B3C80(0xD000000000000020, 0x80000001A03DA3C0, v6);
  if (qword_1ED0CE850 != -1)
    swift_once();
  v9 = sub_1A03D5A50();
  __swift_project_value_buffer(v9, (uint64_t)qword_1ED0D0008);
  v10 = sub_1A03D5A38();
  v11 = sub_1A03D5DC8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (void *)swift_slowAlloc();
    v33[0] = v13;
    *(_DWORD *)v12 = 136446210;
    sub_1A03D04F0(v4, v31, (uint64_t *)v33);
    sub_1A03D5ED0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1A039B000, v10, v11, "Acquiring RBSAssertion. Name=%{public}s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1A1AF9C78](v13, -1, -1);
    MEMORY[0x1A1AF9C78](v12, -1, -1);
  }

  v33[0] = 0;
  if (objc_msgSend(v8, sel_acquireWithError_, v33))
  {
    v14 = v33[0];
    v15 = sub_1A03D5A38();
    v16 = sub_1A03D5DC8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = (void *)swift_slowAlloc();
      v33[0] = v18;
      *(_DWORD *)v17 = 136446210;
      sub_1A03D04F0(v4, v31, (uint64_t *)v33);
      sub_1A03D5ED0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A039B000, v15, v16, "Acquired RBSAssertion. Name=%{public}s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A1AF9C78](v18, -1, -1);
      MEMORY[0x1A1AF9C78](v17, -1, -1);
    }

    *(_BYTE *)a2 = v29;
    *(_QWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 16) = 1;
  }
  else
  {
    v19 = v33[0];
    v20 = (void *)sub_1A03D5834();

    swift_willThrow();
    v21 = v20;
    v22 = v20;
    v23 = sub_1A03D5A38();
    v24 = sub_1A03D5DD4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v26 = (_QWORD *)swift_slowAlloc();
      v27 = (void *)swift_slowAlloc();
      v33[0] = v27;
      *(_DWORD *)v25 = 136446466;
      sub_1A03D04F0(v4, v31, (uint64_t *)v33);
      sub_1A03D5ED0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 2114;
      v28 = v20;
      v32 = _swift_stdlib_bridgeErrorToNSError();
      sub_1A03D5ED0();
      *v26 = v32;

      _os_log_impl(&dword_1A039B000, v23, v24, "Error acquiring RBSAssertion. Name=%{public}s, Error=%{public}@", (uint8_t *)v25, 0x16u);
      sub_1A03D16D0();
      swift_arrayDestroy();
      MEMORY[0x1A1AF9C78](v26, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x1A1AF9C78](v27, -1, -1);
      MEMORY[0x1A1AF9C78](v25, -1, -1);
    }
    else
    {

    }
    swift_willThrow();

  }
}

id sub_1A03CF244@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;
  void *v2;
  int v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v15;
  uint64_t v16;

  v5 = *((_QWORD *)v1 + 2);
  v6 = v5 + 1;
  if (__OFADD__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *v1;
    v2 = (void *)*((_QWORD *)v1 + 1);
    if (qword_1ED0CE850 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v7 = sub_1A03D5A50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED0D0008);
  v15 = v2;
  v8 = sub_1A03D5A38();
  v9 = sub_1A03D5DC8();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v16 = v11;
    *(_DWORD *)v10 = 136446466;
    if (v3)
      v12 = 0x61546873696E6946;
    else
      v12 = 0xD000000000000019;
    if (v3)
      v13 = 0xED0000776F4E6B73;
    else
      v13 = 0x80000001A03DA160;
    sub_1A03D04F0(v12, v13, &v16);
    sub_1A03D5ED0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2050;
    sub_1A03D5ED0();
    _os_log_impl(&dword_1A039B000, v8, v9, "Increasing interest in assertion. Name=%{public}s, New Interest Count=%{public}ld", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A1AF9C78](v11, -1, -1);
    MEMORY[0x1A1AF9C78](v10, -1, -1);

  }
  else
  {

  }
  *(_BYTE *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v15;
  *(_QWORD *)(a1 + 16) = v6;
  return v15;
}

id sub_1A03CF46C@<X0>(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id result;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v5 = *((_QWORD *)v1 + 2);
  v6 = v5 - 1;
  if (__OFSUB__(v5, 1))
  {
    __break(1u);
  }
  else
  {
    v3 = *v1;
    v2 = (void *)*((_QWORD *)v1 + 1);
    if (qword_1ED0CE850 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v7 = sub_1A03D5A50();
  __swift_project_value_buffer(v7, (uint64_t)qword_1ED0D0008);
  v23 = v2;
  v8 = sub_1A03D5A38();
  v9 = sub_1A03D5DC8();
  v22 = v3;
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v24 = v11;
    *(_DWORD *)v10 = 136446466;
    if ((_DWORD)v3)
      v12 = 0x61546873696E6946;
    else
      v12 = 0xD000000000000019;
    if ((_DWORD)v3)
      v13 = 0xED0000776F4E6B73;
    else
      v13 = 0x80000001A03DA160;
    sub_1A03D04F0(v12, v13, &v24);
    sub_1A03D5ED0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2050;
    sub_1A03D5ED0();
    _os_log_impl(&dword_1A039B000, v8, v9, "Decreasing interest in assertion. Name=%{public}s, New Interest Count=%{public}ld", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1A1AF9C78](v11, -1, -1);
    MEMORY[0x1A1AF9C78](v10, -1, -1);

  }
  else
  {

  }
  if (v6 < 1)
  {
    v15 = v23;
    v16 = sub_1A03D5A38();
    v17 = sub_1A03D5DC8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      *(_DWORD *)v18 = 136446210;
      v24 = v19;
      if ((_DWORD)v22)
        v20 = 0x61546873696E6946;
      else
        v20 = 0xD000000000000019;
      if ((_DWORD)v22)
        v21 = 0xED0000776F4E6B73;
      else
        v21 = 0x80000001A03DA160;
      sub_1A03D04F0(v20, v21, &v24);
      sub_1A03D5ED0();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1A039B000, v16, v17, "Assertion no longer has interest; invalidating assertion. Name=%{public}s",
        v18,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x1A1AF9C78](v19, -1, -1);
      MEMORY[0x1A1AF9C78](v18, -1, -1);

    }
    else
    {

    }
    result = objc_msgSend(v15, sel_invalidate);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
  else
  {
    *a1 = v22;
    a1[1] = v23;
    a1[2] = v6;
    return v23;
  }
  return result;
}

uint64_t Assertion.__allocating_init()()
{
  uint64_t v0;

  *(_BYTE *)(OUTLINED_FUNCTION_2_18() + 16) = 0;
  sub_1A03B3A5C();
  if (v0)
    OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_4_17();
}

uint64_t Assertion.init()()
{
  uint64_t v0;
  uint64_t v1;

  *(_BYTE *)(v0 + 16) = 0;
  sub_1A03B3A5C();
  if (v1)
    OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_4_17();
}

uint64_t Assertion.init(name:)(_BYTE *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + 16) = *a1;
  sub_1A03B3A5C();
  if (v2)
    OUTLINED_FUNCTION_25();
  return OUTLINED_FUNCTION_4_17();
}

uint64_t Assertion.deinit()
{
  uint64_t v0;
  unsigned __int8 v2;

  v2 = *(_BYTE *)(v0 + 16);
  sub_1A03CF920(&v2);
  return v0;
}

uint64_t sub_1A03CF920(unsigned __int8 *a1)
{
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
  _BYTE *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  uint64_t ObjectType;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _BYTE *v34;
  _BYTE *v35;
  uint64_t v36;
  uint64_t v37;
  _BYTE *v38;
  void (*v39)(_BYTE *, uint64_t);
  uint64_t v40;
  _BYTE *v41;
  _QWORD *v42;
  void (*v43)(_BYTE *, uint64_t);
  _BYTE v45[12];
  int v46;
  uint64_t v47;
  uint64_t v48;
  _BYTE *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _BYTE *v53;
  uint64_t v54;
  _BYTE *v55;
  uint64_t v56;
  _BYTE *v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD aBlock[8];

  v2 = sub_1A03D5A5C();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v58 = &v45[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v3);
  v57 = &v45[-v5];
  v56 = sub_1A03D5AB0();
  v54 = *(_QWORD *)(v56 - 8);
  v6 = MEMORY[0x1E0C80A78](v56);
  v53 = &v45[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v55 = &v45[-v8];
  v9 = sub_1A03D5A80();
  v50 = *(_QWORD *)(v9 - 8);
  v51 = v9;
  MEMORY[0x1E0C80A78](v9);
  v49 = &v45[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v48 = sub_1A03D5A98();
  v47 = *(_QWORD *)(v48 - 8);
  MEMORY[0x1E0C80A78](v48);
  v12 = &v45[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = sub_1A03D5E4C();
  v14 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF938];
  v15 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v17 = &v45[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = sub_1A03D593C();
  v61 = *(_QWORD *)(v18 - 8);
  v62 = v18;
  v19 = *(_QWORD *)(v61 + 64);
  v20 = MEMORY[0x1E0C80A78](v18);
  v21 = &v45[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v23 = &v45[-v22];
  v46 = *a1;
  sub_1A03D5930();
  sub_1A03D1734(0, &qword_1ED0CE758);
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1A03CFFC4(&qword_1ED0CE8F0, v14, MEMORY[0x1E0DEF948]);
  sub_1A03CFF70();
  sub_1A03CFFC4(&qword_1ED0CE8E0, (uint64_t (*)(uint64_t))sub_1A03CFF70, MEMORY[0x1E0DEAF38]);
  sub_1A03D5F00();
  v24 = sub_1A03D5E58();
  (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v17, v13);
  if (qword_1ED0CE888 != -1)
    swift_once();
  v25 = qword_1ED0CE878 + 16;
  v26 = (os_unfair_lock_s *)(qword_1ED0CE878 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED0CE878 + 24));
  sub_1A03D00D8(v25, (uint64_t)v23, v24);
  os_unfair_lock_unlock(v26);
  ObjectType = swift_getObjectType();
  v29 = v61;
  v28 = v62;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v61 + 16))(v21, v23, v62);
  v30 = (*(unsigned __int8 *)(v29 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
  v31 = v30 + v19;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = v52;
  (*(void (**)(unint64_t, _BYTE *, uint64_t))(v29 + 32))(v32 + v30, v21, v28);
  *(_BYTE *)(v32 + v31) = v46;
  aBlock[4] = sub_1A03D0270;
  aBlock[5] = v32;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1A03A33C8;
  aBlock[3] = &block_descriptor_1;
  v33 = _Block_copy(aBlock);
  sub_1A03B5E88();
  v34 = v49;
  sub_1A03A32E0();
  sub_1A03D5E88();
  _Block_release(v33);
  (*(void (**)(_BYTE *, uint64_t))(v50 + 8))(v34, v51);
  (*(void (**)(_BYTE *, uint64_t))(v47 + 8))(v12, v48);
  swift_release();
  v35 = v53;
  sub_1A03D5AA4();
  if (qword_1ED0CE8B0 != -1)
    swift_once();
  v36 = v60;
  v37 = __swift_project_value_buffer(v60, (uint64_t)qword_1ED0CE890);
  v38 = v55;
  MEMORY[0x1A1AF906C](v35, v37);
  v39 = *(void (**)(_BYTE *, uint64_t))(v54 + 8);
  v40 = v56;
  v39(v35, v56);
  v41 = v57;
  sub_1A03D0464((uint64_t)v57);
  v42 = v58;
  sub_1A03D04A8(v58);
  MEMORY[0x1A1AF9438](v38, v41, v42, ObjectType);
  v43 = *(void (**)(_BYTE *, uint64_t))(v59 + 8);
  v43(v42, v36);
  v43(v41, v36);
  v39(v38, v40);
  sub_1A03D5EA0();
  swift_unknownObjectRelease();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v61 + 8))(v23, v62);
}

uint64_t method lookup function for Assertion()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Assertion.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of Assertion.__allocating_init(name:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t storeEnumTagSinglePayload for Assertion.Name(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03CFF00 + 4 * byte_1A03D8D25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A03CFF34 + 4 * byte_1A03D8D20[v4]))();
}

uint64_t sub_1A03CFF34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CFF3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A03CFF44);
  return result;
}

uint64_t sub_1A03CFF50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A03CFF58);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A03CFF5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A03CFF64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_1A03CFF70()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE8D8)
  {
    sub_1A03D5E4C();
    v0 = sub_1A03D5D50();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE8D8);
  }
}

uint64_t sub_1A03CFFC4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1A1AF9BC4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A03D0004(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v9;
  void *v10;
  id v11;
  unsigned __int8 v12[8];
  void *v13;
  uint64_t v14;
  char v15[8];
  uint64_t v16;
  uint64_t v17;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *a1;
  if (*(_QWORD *)(*a1 + 16) && (v5 = sub_1A03B3B94(*(_BYTE *)(a2 + 16)), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(v4 + 56) + 24 * v5;
    v8 = *(_BYTE *)v7;
    v10 = *(void **)(v7 + 8);
    v9 = *(_QWORD *)(v7 + 16);
    v12[0] = v8;
    v13 = v10;
    v14 = v9;
    v11 = v10;
    sub_1A03CF244((uint64_t)v15);
    sub_1A03D0FD4(v15[0], v16, v17, v3);

  }
  else
  {
    v12[0] = v3;
    sub_1A03CEC30(v12, (uint64_t)v15);
    if (!v2)
      sub_1A03D0FD4(v15[0], v16, v17, v3);
  }
}

uint64_t sub_1A03D00D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  return sub_1A03D1058(a3, a2);
}

void sub_1A03D0124(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v5;
  os_unfair_lock_s *v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;

  if (qword_1ED0CE888 != -1)
    swift_once();
  v5 = (uint64_t *)(qword_1ED0CE878 + 16);
  v6 = (os_unfair_lock_s *)(qword_1ED0CE878 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED0CE878 + 24));
  sub_1A03D02AC(v5, a2);
  os_unfair_lock_unlock(v6);
  if (qword_1ED0CE7D0 != -1)
    swift_once();
  v7 = (uint64_t *)(qword_1ED0CE870 + 16);
  v8 = (os_unfair_lock_s *)(qword_1ED0CE870 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_1ED0CE870 + 24));
  sub_1A03D032C(v7, a3 & 1);
  os_unfair_lock_unlock(v8);
}

uint64_t sub_1A03D020C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_1A03D593C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_1A03D0270()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(sub_1A03D593C() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  sub_1A03D0124(*(_QWORD *)(v0 + 16), v0 + v2, *(_BYTE *)(v0 + v2 + *(_QWORD *)(v1 + 64)));
}

uint64_t sub_1A03D02AC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_1A03CEA2C(a2, *a1);
  sub_1A03D0E8C(a2);
  result = swift_unknownObjectRelease();
  if (v3)
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1A03D5E94();
    return swift_unknownObjectRelease_n();
  }
  return result;
}

void sub_1A03D032C(uint64_t *a1, char a2)
{
  uint64_t v2;
  char v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _BYTE v12[8];
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v2 = *a1;
  if (*(_QWORD *)(*a1 + 16) && (v3 = a2 & 1, v4 = sub_1A03B3B94(a2 & 1), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(v2 + 56) + 24 * v4;
    v7 = *(_BYTE *)v6;
    v9 = *(void **)(v6 + 8);
    v8 = *(_QWORD *)(v6 + 16);
    v12[0] = v7;
    v13 = v9;
    v14 = v8;
    v10 = v9;
    sub_1A03CF46C(&v15);
    if (v16)
    {
      sub_1A03D0FD4(v15 & 1, v16, v17, v3);

      return;
    }
    sub_1A03D0D88(v3, (uint64_t)v12);
    v11 = v13;

  }
  else
  {
    if (qword_1ED0CE030 != -1)
      swift_once();
    v11 = (id)qword_1ED0D0000;
    sub_1A03D5DD4();
    sub_1A03D5A2C();
  }

}

uint64_t sub_1A03D0464@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x1E0DEF498];
  v3 = sub_1A03D5A5C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1A03D04A8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = 0;
  v2 = *MEMORY[0x1E0DEF480];
  v3 = sub_1A03D5A5C();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

uint64_t sub_1A03D04F0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1A03D05C0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1A03B0558((uint64_t)v12, *a3);
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
      sub_1A03B0558((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_1A03D05C0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_1A03D0714((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1A03D5EDC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1A03D07D8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1A03D5F6C();
    if (!v8)
    {
      result = sub_1A03D602C();
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

void *sub_1A03D0714(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1A03D6050();
  __break(1u);
  return result;
}

uint64_t sub_1A03D07D8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1A03D086C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1A03D0AA4(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1A03D0AA4((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1A03D086C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1A03D5C78();
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
  v3 = sub_1A03D09DC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1A03D5F3C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1A03D6050();
  __break(1u);
LABEL_14:
  result = sub_1A03D602C();
  __break(1u);
  return result;
}

_QWORD *sub_1A03D09DC(uint64_t a1, uint64_t a2)
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
  sub_1A03D1690(0, qword_1ED0CD7A8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1A03D0A4C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_1A03D5C90();
    OUTLINED_FUNCTION_0_20(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x1A1AF9210](15, a1 >> 16);
    OUTLINED_FUNCTION_0_20(v3);
    return v4 | 8;
  }
}

char *sub_1A03D0AA4(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_1A03D1690(0, qword_1ED0CD7A8);
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
    sub_1A03C525C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A03D0B84(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1A03D0B84(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1A03D6050();
  __break(1u);
  return result;
}

unint64_t sub_1A03D0C48(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  char v14;
  _QWORD v16[2];

  v3 = v2;
  v16[1] = a1;
  v5 = sub_1A03D593C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v3 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    v13 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    do
    {
      v13(v8, *(_QWORD *)(v3 + 48) + v12 * v10, v5);
      sub_1A03CFFC4(&qword_1ED0CE868, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v14 = sub_1A03D5BC4();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

unint64_t sub_1A03D0D88@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  unint64_t result;
  char v5;
  unint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_1A03B3B94(a1 & 1);
  if ((v5 & 1) != 0)
  {
    v6 = result;
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v2;
    *v2 = 0x8000000000000000;
    sub_1A03D1428(0, &qword_1ED0CE928, MEMORY[0x1E0DECB20]);
    sub_1A03D6014();
    v7 = *(_QWORD *)(v11 + 56) + 24 * v6;
    v8 = *(_BYTE *)v7;
    v10 = *(_QWORD *)(v7 + 8);
    v9 = *(_QWORD *)(v7 + 16);
    *(_BYTE *)a2 = v8;
    *(_QWORD *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v9;
    sub_1A03B3D24();
    sub_1A03D6020();
    *v2 = v11;
    return swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_1A03D0E8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v11;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_1A03D10C4(a1);
  LOBYTE(a1) = v5;
  swift_bridgeObjectRelease();
  if ((a1 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v11 = *v2;
  *v2 = 0x8000000000000000;
  sub_1A03D15F8(0, &qword_1ED0CE920, MEMORY[0x1E0DECB20]);
  sub_1A03D6014();
  v6 = *(_QWORD *)(v11 + 48);
  v7 = sub_1A03D593C();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6 + *(_QWORD *)(*(_QWORD *)(v7 - 8) + 72) * v4, v7);
  v9 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v4);
  sub_1A03D1484();
  sub_1A03CFFC4(&qword_1ED0CE860, v8, MEMORY[0x1E0CB09C8]);
  sub_1A03D6020();
  *v2 = v11;
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_1A03D0FD4(char a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t *v4;
  char v7;
  char v8;
  uint64_t v10;

  v7 = a1 & 1;
  v8 = a4 & 1;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v4;
  *v4 = 0x8000000000000000;
  sub_1A03D1130(v7, a2, a3, v8);
  *v4 = v10;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A03D1058(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_1A03D1264(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

unint64_t sub_1A03D10C4(uint64_t a1)
{
  uint64_t v2;

  sub_1A03D593C();
  sub_1A03CFFC4(&qword_1ED0CE860, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v2 = sub_1A03D5B88();
  return sub_1A03D0C48(a1, v2);
}

void sub_1A03D1130(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  char v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;

  v5 = (_QWORD **)v4;
  v9 = a4 & 1;
  v10 = (_QWORD *)*v4;
  v11 = sub_1A03B3B94(a4 & 1);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  sub_1A03D1428(0, &qword_1ED0CE928, MEMORY[0x1E0DECB20]);
  if ((sub_1A03D6014() & 1) == 0)
    goto LABEL_5;
  v15 = sub_1A03B3B94(v9);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    sub_1A03D6170();
    __break(1u);
    return;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7] + 24 * v13;

    *(_BYTE *)v18 = a1 & 1;
    *(_QWORD *)(v18 + 8) = a2;
    *(_QWORD *)(v18 + 16) = a3;
  }
  else
  {
    sub_1A03D13B4(v13, v9, a1 & 1, a2, a3, v17);
  }
}

uint64_t sub_1A03D1264(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;

  v3 = (_QWORD **)v2;
  v6 = sub_1A03D593C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (_QWORD *)*v2;
  v11 = sub_1A03D10C4(a2);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_10;
  }
  v13 = v11;
  v14 = v12;
  sub_1A03D15F8(0, &qword_1ED0CE920, MEMORY[0x1E0DECB20]);
  if ((sub_1A03D6014() & 1) == 0)
    goto LABEL_5;
  v15 = sub_1A03D10C4(a2);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_10:
    result = sub_1A03D6170();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v3;
  if ((v14 & 1) != 0)
  {
    v18 = v17[7];
    result = swift_unknownObjectRelease();
    *(_QWORD *)(v18 + 8 * v13) = a1;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    return sub_1A03D14D8(v13, (uint64_t)v9, a1, v17);
  }
  return result;
}

unint64_t sub_1A03D13B4(unint64_t result, char a2, char a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a6[6] + result) = a2 & 1;
  v6 = a6[7] + 24 * result;
  *(_BYTE *)v6 = a3 & 1;
  *(_QWORD *)(v6 + 8) = a4;
  *(_QWORD *)(v6 + 16) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

void sub_1A03D140C(uint64_t a1)
{
  sub_1A03D158C(a1, (unint64_t *)&unk_1ED0CE910, (uint64_t)&unk_1ED0CE8C8, (void (*)(uint64_t, uint64_t, uint64_t (*)(void)))sub_1A03D1428);
}

void sub_1A03D1428(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, ValueMetadata *, ValueMetadata *, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_1A03B3D24();
    v7 = a3(a1, &type metadata for Assertion.Name, &type metadata for Assertion.RunningAssertion, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
  OUTLINED_FUNCTION_0_4();
}

unint64_t sub_1A03D1484()
{
  unint64_t result;

  result = qword_1ED0CE8F8;
  if (!qword_1ED0CE8F8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CE8F8);
  }
  return result;
}

uint64_t sub_1A03D14D8(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_1A03D593C();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

void sub_1A03D1570(uint64_t a1)
{
  sub_1A03D158C(a1, (unint64_t *)&unk_1ED0CE900, (uint64_t)&unk_1ED0CE8B8, (void (*)(uint64_t, uint64_t, uint64_t (*)(void)))sub_1A03D15F8);
}

void sub_1A03D158C(uint64_t a1, unint64_t *a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t (*)(void)))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    a4(255, a3, MEMORY[0x1E0DEA048]);
    type metadata accessor for os_unfair_lock_s(255);
    v5 = sub_1A03D5F60();
    if (!v6)
      atomic_store(v5, a2);
  }
  OUTLINED_FUNCTION_0_4();
}

void sub_1A03D15F8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, unint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    v6 = sub_1A03D593C();
    v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998];
    v8 = sub_1A03D1484();
    v9 = sub_1A03CFFC4(&qword_1ED0CE860, v7, MEMORY[0x1E0CB09C8]);
    v10 = a3(a1, v6, v8, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

void sub_1A03D1690(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1A03D6110();
    if (!v4)
      atomic_store(v3, a2);
  }
  OUTLINED_FUNCTION_14();
}

void sub_1A03D16D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CD5A0[0])
  {
    sub_1A03D1734(255, &qword_1ED0CD598);
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, qword_1ED0CD5A0);
  }
}

void sub_1A03D1734(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_14();
}

uint64_t initializeBufferWithCopyOfBuffer for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  v5 = v3;
  return a1;
}

void destroy for Assertion.RunningAssertion(uint64_t a1)
{

}

uint64_t assignWithCopy for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for Assertion.RunningAssertion(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for Assertion.RunningAssertion(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
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

uint64_t storeEnumTagSinglePayload for Assertion.RunningAssertion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Assertion.RunningAssertion()
{
  return &type metadata for Assertion.RunningAssertion;
}

uint64_t dispatch thunk of ConstructType.init()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void static CGSize.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t CGSize.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  _QWORD v22[2];

  if (*(_BYTE *)(a1 + 16))
    goto LABEL_18;
  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v22[0] = 44;
  v22[1] = 0xE100000000000000;
  MEMORY[0x1E0C80A78](a1);
  v19 = (uint64_t)v22;
  swift_bridgeObjectRetain();
  v5 = sub_1A03C63E0(0x7FFFFFFFFFFFFFFFLL, 1u, sub_1A03C6BE8, (uint64_t)&v18, v3, v4);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v21 = a2;
    v22[0] = MEMORY[0x1E0DEE9D8];
    sub_1A03C6AC8(0, v6, 0);
    v7 = v22[0];
    v8 = v5 + 56;
    do
    {
      swift_bridgeObjectRetain();
      v9 = sub_1A03D5D74();
      v11 = v10;
      v22[0] = v7;
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_1A03C6AC8((char *)(v12 > 1), v13 + 1, 1);
        v7 = v22[0];
      }
      *(_QWORD *)(v7 + 16) = v13 + 1;
      v14 = v7 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_BYTE *)(v14 + 40) = v11 & 1;
      v8 += 32;
      --v6;
    }
    while (v6);
    OUTLINED_FUNCTION_2();
    a2 = v21;
  }
  else
  {
    OUTLINED_FUNCTION_2();
    v7 = MEMORY[0x1E0DEE9D8];
  }
  v15 = *(_QWORD *)(v7 + 16);
  if (!v15)
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if ((*(_BYTE *)(v7 + 40) & 1) == 0)
  {
    if (v15 >= 2)
    {
      v16 = *(_BYTE *)(v7 + 56);
      swift_bridgeObjectRelease();
      if ((v16 & 1) == 0)
      {
        sub_1A03ADE98(v3, v4, 0);
        return __swift_destroy_boxed_opaque_existential_1(a2);
      }
      goto LABEL_17;
    }
    goto LABEL_15;
  }
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
LABEL_18:
  v20 = 0;
  v19 = 28;
  result = sub_1A03D6038();
  __break(1u);
  return result;
}

uint64_t CGSize.valueType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1A03D5D5C();
  v5 = v2;
  sub_1A03D5C48();
  sub_1A03D5D5C();
  sub_1A03D5C48();
  result = OUTLINED_FUNCTION_2();
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = 0;
  return result;
}

uint64_t sub_1A03D1B98@<X0>(uint64_t a1@<X8>)
{
  return CGSize.valueType.getter(a1);
}

uint64_t sub_1A03D1BA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = CGSize.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  a3[1] = v6;
  return result;
}

uint64_t sub_1A03D1BC4(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1A03D1C10(&qword_1EE597C08, MEMORY[0x1E0C9BA08]);
  result = sub_1A03D1C10(qword_1EE597C10, MEMORY[0x1E0C9B9F0]);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1A03D1C10(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CGSize(255);
    result = MEMORY[0x1A1AF9BC4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1A03D1C50@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

void static AssertionOptions.open.getter(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_1_20(a1);
}

_QWORD *static AssertionOptions.legacy.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A03B496C(qword_1ED0CDB10, &qword_1ED0CDB00, a1);
}

BOOL sub_1A03D1CC8(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A03BFD2C(*a1, *v1);
}

uint64_t sub_1A03D1CD4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A03D1CE0(*a1, *v2, a2);
}

uint64_t sub_1A03D1CE0@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 | result;
  return result;
}

uint64_t sub_1A03D1CEC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A03BF278(*a1, *v2, a2);
}

uint64_t sub_1A03D1CF8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A03D1D04(*a1, *v2, a2);
}

uint64_t sub_1A03D1D04@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 ^ result;
  return result;
}

uint64_t sub_1A03D1D10@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A03D1D18(*a1, a2);
}

uint64_t sub_1A03D1D18@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & result;
  if (v3)
    *v2 &= ~result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t sub_1A03D1D40@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A03D1D48(*a1, a2);
}

uint64_t sub_1A03D1D48@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  *v2 |= result;
  v4 = v3 & result;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v4 == 0;
  return result;
}

uint64_t sub_1A03D1D68(uint64_t *a1)
{
  return sub_1A03BF284(*a1);
}

uint64_t sub_1A03D1D70(uint64_t *a1)
{
  return sub_1A03D1D78(*a1);
}

uint64_t sub_1A03D1D78(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

uint64_t sub_1A03D1D88@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A03D1D94(*a1, *v2, a2);
}

uint64_t sub_1A03D1D94@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & ~result;
  return result;
}

BOOL sub_1A03D1DA0(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A03BF294(*a1, *v1);
}

BOOL sub_1A03D1DAC(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A03D1DB8(*a1, *v1);
}

BOOL sub_1A03D1DB8(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_1A03D1DC4(uint64_t *a1)
{
  uint64_t *v1;

  return sub_1A03BF2A0(*a1, *v1);
}

BOOL sub_1A03D1DD0()
{
  uint64_t *v0;

  return sub_1A03D1DD8(*v0);
}

BOOL sub_1A03D1DD8(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_1A03D1DE4(uint64_t *a1)
{
  return sub_1A03D1DEC(*a1);
}

uint64_t sub_1A03D1DEC(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

TeaDB::AssertionOptions sub_1A03D1DFC@<X0>(Swift::Int *a1@<X0>, uint64_t a2@<X8>)
{
  TeaDB::AssertionOptions result;

  result.rawValue = AssertionOptions.init(rawValue:)(*a1).rawValue;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

BOOL sub_1A03D1E24(uint64_t *a1, uint64_t *a2)
{
  return sub_1A03BCF1C(*a1, *a2);
}

unint64_t sub_1A03D1E34()
{
  unint64_t result;

  result = qword_1ED0CE788;
  if (!qword_1ED0CE788)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CE788);
  }
  return result;
}

uint64_t sub_1A03D1E88(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x65756C6176 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_1A03D6134();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_1A03D1F04()
{
  return 0x65756C6176;
}

uint64_t sub_1A03D1F18()
{
  return sub_1A03D1F04();
}

uint64_t sub_1A03D1F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1A03D1E88(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_1A03D1F5C(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D9170, a1);
  return sub_1A03D6224();
}

uint64_t sub_1A03D1F90(uint64_t a1)
{
  MEMORY[0x1A1AF9BC4](&unk_1A03D9170, a1);
  return sub_1A03D6230();
}

void JSON.encode(to:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v3 = a2[3];
  v9 = a2[2];
  v4 = type metadata accessor for JSON.CodingKeys(255, v9, v3, a2[4]);
  MEMORY[0x1A1AF9BC4](&unk_1A03D9170, v4);
  OUTLINED_FUNCTION_3_18();
  v5 = sub_1A03D60F8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v9 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  OUTLINED_FUNCTION_3_18();
  sub_1A03D6218();
  sub_1A03D60EC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  OUTLINED_FUNCTION_10();
}

uint64_t type metadata accessor for JSON.CodingKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JSON.CodingKeys);
}

void JSON.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v25 = a5;
  v30 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v31 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for JSON.CodingKeys(255, v10, v11, v12);
  MEMORY[0x1A1AF9BC4](&unk_1A03D9170, v13);
  OUTLINED_FUNCTION_3_18();
  v32 = sub_1A03D60B0();
  v26 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v15 = (char *)&v23 - v14;
  v28 = a2;
  v29 = a3;
  v24 = type metadata accessor for JSON(0, a2, a3, a4);
  v16 = *(_QWORD *)(v24 - 8);
  MEMORY[0x1E0C80A78](v24);
  v18 = (char *)&v23 - v17;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v27 = v15;
  OUTLINED_FUNCTION_3_18();
  v19 = v33;
  sub_1A03D6200();
  if (!v19)
  {
    v33 = v16;
    v20 = v30;
    v21 = v31;
    v22 = v28;
    sub_1A03D60A4();
    OUTLINED_FUNCTION_2_21();
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v18, v21, v22);
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v25, v18, v24);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_10();
}

void sub_1A03D2294(_QWORD *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  JSON.init(from:)(a1, a2[2], a2[3], a2[4], a3);
}

void sub_1A03D22B4(_QWORD *a1, _QWORD *a2)
{
  JSON.encode(to:)(a1, a2);
}

uint64_t sub_1A03D22C8(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03D2308 + 4 * byte_1A03D8FE6[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03D2328 + 4 * byte_1A03D8FEB[v4]))();
}

_BYTE *sub_1A03D2308(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03D2328(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03D2330(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03D2338(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03D2340(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03D2348(_DWORD *result)
{
  *result = 0;
  return result;
}

void sub_1A03D2354()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03D2364()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03D2374()
{
  JUMPOUT(0x1A1AF9BC4);
}

void sub_1A03D2384()
{
  sub_1A03A5C48((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for Drop);
}

uint64_t Table.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t method lookup function for Table()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Table.drop.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_1A03D23CC(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13[2];
  char v14;

  v6 = v4;
  v8 = *(_QWORD *)(*(_QWORD *)v6 + 80);
  v9 = *(_QWORD *)(*(_QWORD *)v6 + 88);
  type metadata accessor for Statement(0, v8, *(_QWORD *)(v9 + 24), a4);
  v14 = 3;
  if ((a1 & 1) != 0)
  {
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v13[0] = 0xD000000000000015;
    *((_QWORD *)&v13[0] + 1) = 0x80000001A03DA430;
  }
  else
  {
    *(_QWORD *)&v13[0] = 0x42415420504F5244;
    *((_QWORD *)&v13[0] + 1) = 0xEB0000000020454CLL;
  }
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v8, v9);
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  v10 = v13[0];
  sub_1A03AE220(v6 + 16, (uint64_t)v13);
  v11 = sub_1A03AD7A0(&v14, v10, *((uint64_t *)&v10 + 1), v13);
  sub_1A03AD83C(v11);
  result = swift_release();
  if (!v5)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t Drop.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return v0;
}

uint64_t Drop.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_1A03D2560()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for Drop(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Drop);
}

uint64_t method lookup function for Drop()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Drop.table(ifExists:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t PreparedStatement.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t method lookup function for PreparedStatement()
{
  return swift_lookUpClassMethod();
}

uint64_t assignWithCopy for SQLError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1A039D738(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1A03AE590(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for SQLError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1A03AE590(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xE3 && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 226;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 0x1D)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xE2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 227;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xE3)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xE3)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_1A03D2718(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 0x1Cu)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 29);
}

uint64_t sub_1A03D2730(uint64_t result, unsigned int a2)
{
  if (a2 >= 0x1D)
  {
    *(_QWORD *)result = a2 - 29;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 29;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLError()
{
  return &type metadata for SQLError;
}

uint64_t sub_1A03D2758(uint64_t a1)
{
  return sub_1A03AED70(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_1A03D2774(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    sub_1A03AD374(0, v1, 0);
    v2 = v11;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v8 = *(_QWORD *)(v11 + 16);
      v7 = *(_QWORD *)(v11 + 24);
      OUTLINED_FUNCTION_24_3();
      if (v8 >= v7 >> 1)
        sub_1A03AD374((char *)(v7 > 1), v8 + 1, 1);
      v4 += 7;
      *(_QWORD *)(v11 + 16) = v8 + 1;
      v9 = v11 + 16 * v8;
      *(_QWORD *)(v9 + 32) = v6;
      *(_QWORD *)(v9 + 40) = v5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1A03D2844(void (*a1)(_QWORD *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v16[2];
  uint64_t v17;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = MEMORY[0x1E0DEE9D8];
  if (v5)
  {
    v17 = MEMORY[0x1E0DEE9D8];
    sub_1A03AD374(0, v5, 0);
    v6 = v17;
    for (i = a3 + 32; ; i += 56)
    {
      a1(v16, i);
      if (v4)
        break;
      v4 = 0;
      v10 = v16[0];
      v9 = v16[1];
      v17 = v6;
      v12 = *(_QWORD *)(v6 + 16);
      v11 = *(_QWORD *)(v6 + 24);
      if (v12 >= v11 >> 1)
      {
        sub_1A03AD374((char *)(v11 > 1), v12 + 1, 1);
        v6 = v17;
      }
      *(_QWORD *)(v6 + 16) = v12 + 1;
      v13 = v6 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v10;
      *(_QWORD *)(v13 + 40) = v9;
      if (!--v5)
        return v6;
    }
    OUTLINED_FUNCTION_9_0();
  }
  return v6;
}

uint64_t sub_1A03D2940(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v11[2];
  uint64_t v12;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1A03D5FB4();
    v5 = (uint64_t *)(a1 + 32);
    sub_1A03A8B84(0, (unint64_t *)&qword_1ED0CE718, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x1E0DEAEC8]);
    sub_1A03AD1F8();
    do
    {
      v6 = *v5++;
      *(_QWORD *)&v11[0] = v6;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v11[0] = sub_1A03D5B94();
      *((_QWORD *)&v11[0] + 1) = v7;
      swift_bridgeObjectRetain();
      sub_1A03D5C48();
      swift_bridgeObjectRelease();
      v8 = v11[0];
      sub_1A03B3408(a2 + 16, (uint64_t)v11);
      sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
      swift_allocObject();
      sub_1A03A80D8(0, v8, *((uint64_t *)&v8 + 1), v11);
      swift_bridgeObjectRelease();
      sub_1A03D5F90();
      sub_1A03D5FC0();
      sub_1A03D5FCC();
      sub_1A03D5F9C();
      --v3;
    }
    while (v3);
    v9 = v12;
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  return v9;
}

uint64_t sub_1A03D2B08(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t result;
  uint64_t v28;
  void (*v29)(char *, _QWORD);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t AssociatedTypeWitness;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51[32];
  uint64_t v52;

  v38 = a5;
  v39 = a8;
  v46 = a1;
  v47 = a2;
  v37 = *(_QWORD *)(a5 - 8);
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v9);
  OUTLINED_FUNCTION_14_0();
  v48 = v11 - v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v14 = (char *)&v35 - v13;
  OUTLINED_FUNCTION_4();
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_14_0();
  v18 = v17 - v16;
  v19 = swift_getAssociatedTypeWitness();
  v40 = *(_QWORD *)(v19 - 8);
  v41 = v19;
  OUTLINED_FUNCTION_4();
  v21 = MEMORY[0x1E0C80A78](v20);
  v36 = (char *)&v35 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v35 - v23;
  v25 = sub_1A03D5D8C();
  if (!v25)
    return sub_1A03D5D14();
  v26 = v25;
  v52 = sub_1A03D5AF8();
  v42 = sub_1A03D5FF0();
  sub_1A03D5FA8();
  v44 = a6;
  result = sub_1A03D5D80();
  if ((v26 & 0x8000000000000000) == 0)
  {
    v28 = v26;
    v43 = v18;
    while (v28)
    {
      v49 = v28;
      v29 = (void (*)(char *, _QWORD))sub_1A03D5DBC();
      (*(void (**)(char *))(v12 + 16))(v14);
      v29(v51, 0);
      v30 = v24;
      v31 = v50;
      v46(v14, v48);
      if (v31)
      {
        OUTLINED_FUNCTION_29_1();
        (*(void (**)(char *, uint64_t))(v40 + 8))(v24, v41);
        swift_release();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 32))(v39, v48, v38);
      }
      v50 = 0;
      OUTLINED_FUNCTION_29_1();
      sub_1A03D5FD8();
      result = sub_1A03D5D98();
      v28 = v49 - 1;
      if (v49 == 1)
      {
        v33 = v40;
        v32 = v41;
        v34 = v36;
        (*(void (**)(char *, char *, uint64_t))(v40 + 32))(v36, v30, v41);
        sub_1A03D5F0C();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v34, v32);
        return v52;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A03D2E24(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v2 = MEMORY[0x1E0DEE9D8];
  v20 = MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = a1 + 32;
    do
    {
      if (v4 >= *(_QWORD *)(a1 + 16))
      {
        __break(1u);
        JUMPOUT(0x1A03D2FA0);
      }
      sub_1A03ACCBC(v5, (uint64_t)&v16);
      v6 = *((_QWORD *)&v18 + 1);
      v7 = v19;
      __swift_project_boxed_opaque_existential_1(&v17, *((uint64_t *)&v18 + 1));
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 40))(v6, v7) & 1) != 0)
      {
        v12 = v16;
        v13 = v17;
        v14 = v18;
        v15 = v19;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1A03ACF78(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v20;
        v9 = *(_QWORD *)(v20 + 16);
        v8 = *(_QWORD *)(v20 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1A03ACF78((_QWORD *)(v8 > 1), v9 + 1, 1);
          v2 = v20;
        }
        *(_QWORD *)(v2 + 16) = v9 + 1;
        v10 = v2 + 56 * v9;
        *(_OWORD *)(v10 + 32) = v12;
        *(_OWORD *)(v10 + 48) = v13;
        *(_OWORD *)(v10 + 64) = v14;
        *(_QWORD *)(v10 + 80) = v15;
      }
      else
      {
        sub_1A03A9DC4((uint64_t)&v16, (uint64_t (*)(_QWORD))sub_1A03ACECC);
      }
      ++v4;
      v5 += 56;
    }
    while (v3 != v4);
  }
  OUTLINED_FUNCTION_18();
  return v2;
}

uint64_t sub_1A03D2FD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  char v24[32];
  _BYTE v25[40];
  _OWORD v26[2];
  _QWORD v27[2];
  __int128 v28;
  uint64_t v29;

  v0 = sub_1A03D61E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  *((_QWORD *)&v21 + 1) = &type metadata for RawEntity;
  sub_1A03D61D0();
  sub_1A03D61DC();
  sub_1A03D5FFC();
  swift_release();
  swift_retain();
  sub_1A03D605C();
  sub_1A03D4610((uint64_t)&v20, (uint64_t)v27, (unint64_t *)&qword_1ED0CE6E8, (uint64_t (*)(uint64_t))sub_1A03B4314);
  v19 = v0;
  v18 = v1;
  v17 = v3;
  if (v29)
  {
    v4 = MEMORY[0x1E0DEE9D8];
    while (1)
    {
      v6 = v27[0];
      v5 = v27[1];
      sub_1A03B0594(&v28, v26);
      if (v5)
      {
        sub_1A03B0558((uint64_t)v26, (uint64_t)v24);
        sub_1A03A5FF8(0, qword_1ED0CE0E0);
        if ((swift_dynamicCast() & 1) == 0)
        {
          *(_QWORD *)&v22 = 0;
          v21 = 0u;
          v20 = 0u;
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
          sub_1A03A9DC4((uint64_t)&v20, (uint64_t (*)(_QWORD))sub_1A03D4664);
          goto LABEL_12;
        }
        sub_1A03A5D80(&v20, (uint64_t)v25);
        *(_QWORD *)&v20 = v6;
        *((_QWORD *)&v20 + 1) = v5;
        sub_1A03B3408((uint64_t)v25, (uint64_t)&v21);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A03B05A4();
          v4 = v12;
        }
        v7 = *(_QWORD *)(v4 + 16);
        if (v7 >= *(_QWORD *)(v4 + 24) >> 1)
        {
          sub_1A03B05A4();
          v4 = v13;
        }
        *(_QWORD *)(v4 + 16) = v7 + 1;
        v8 = v4 + 56 * v7;
        v9 = v20;
        v10 = v21;
        v11 = v22;
        *(_QWORD *)(v8 + 80) = v23;
        *(_OWORD *)(v8 + 48) = v10;
        *(_OWORD *)(v8 + 64) = v11;
        *(_OWORD *)(v8 + 32) = v9;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
      }
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
LABEL_12:
      sub_1A03D605C();
      sub_1A03D4610((uint64_t)&v20, (uint64_t)v27, (unint64_t *)&qword_1ED0CE6E8, (uint64_t (*)(uint64_t))sub_1A03B4314);
      if (!v29)
        goto LABEL_15;
    }
  }
  v4 = MEMORY[0x1E0DEE9D8];
LABEL_15:
  swift_release_n();
  v14 = sub_1A03ACD3C(v4);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v17, v19);
  return v14;
}

uint64_t sub_1A03D32D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_BYTE *)(v1 + 64);
  *(_BYTE *)(a1 + 16) = v5;
  return sub_1A03D45CC(v3, v4, v5);
}

uint64_t sub_1A03D3324(uint64_t a1, uint64_t a2, _QWORD *a3, char a4)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  sub_1A03ACC98(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v7 = v6;
  v9 = *(_QWORD *)(v6 + 16);
  v8 = *(_QWORD *)(v6 + 24);
  if (v9 >= v8 >> 1)
  {
    sub_1A03ACC98(v8 > 1, v9 + 1, 1, v6);
    v7 = v28;
  }
  *(_QWORD *)(v7 + 16) = v9 + 1;
  v10 = v7 + 16 * v9;
  *(_QWORD *)(v10 + 32) = 0x455441455243;
  *(_QWORD *)(v10 + 40) = 0xE600000000000000;
  v11 = a3[3];
  v12 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v11);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 56))(v11, v12);
  v14 = *(_QWORD *)(v7 + 16);
  if ((v13 & 1) != 0)
  {
    v15 = *(_QWORD *)(v7 + 24);
    v16 = v14 + 1;
    if (v14 >= v15 >> 1)
    {
      sub_1A03ACC98(v15 > 1, v14 + 1, 1, v7);
      v7 = v31;
    }
    *(_QWORD *)(v7 + 16) = v16;
    v17 = v7 + 16 * v14;
    *(_QWORD *)(v17 + 32) = 0x455551494E55;
    *(_QWORD *)(v17 + 40) = 0xE600000000000000;
  }
  else
  {
    v16 = *(_QWORD *)(v7 + 16);
  }
  v18 = *(_QWORD *)(v7 + 24);
  v19 = v16 + 1;
  if (v16 >= v18 >> 1)
  {
    sub_1A03ACC98(v18 > 1, v16 + 1, 1, v7);
    v7 = v29;
  }
  *(_QWORD *)(v7 + 16) = v19;
  v20 = v7 + 16 * v16;
  *(_QWORD *)(v20 + 32) = 0x5845444E49;
  *(_QWORD *)(v20 + 40) = 0xE500000000000000;
  if ((a4 & 1) != 0)
  {
    v21 = *(_QWORD *)(v7 + 24);
    v22 = v16 + 2;
    if (v19 >= v21 >> 1)
    {
      sub_1A03ACC98(v21 > 1, v22, 1, v7);
      v7 = v32;
    }
    *(_QWORD *)(v7 + 16) = v22;
    v23 = v7 + 16 * v19;
    strcpy((char *)(v23 + 32), "IF NOT EXISTS");
    *(_WORD *)(v23 + 46) = -4864;
  }
  sub_1A03D5F30();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  sub_1A03D5C48();
  sub_1A03D5C48();
  sub_1A03D5C48();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  v25 = *(_QWORD *)(v7 + 16);
  v24 = *(_QWORD *)(v7 + 24);
  if (v25 >= v24 >> 1)
  {
    sub_1A03ACC98(v24 > 1, v25 + 1, 1, v7);
    v7 = v30;
  }
  *(_QWORD *)(v7 + 16) = v25 + 1;
  v26 = v7 + 16 * v25;
  *(_QWORD *)(v26 + 32) = 0xD000000000000015;
  *(_QWORD *)(v26 + 40) = 0x80000001A03DA4D0;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a3);
  return v7;
}

uint64_t sub_1A03D361C(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  __int128 v6[2];

  if ((a1 & 1) != 0)
  {
    *(_QWORD *)&v6[0] = 0;
    *((_QWORD *)&v6[0] + 1) = 0xE000000000000000;
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    sub_1A03B3408(v1 + 16, (uint64_t)v6);
    sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
    swift_initStackObject();
    v3 = 0xD000000000000024;
    v4 = 0x80000001A03DA510;
  }
  else
  {
    sub_1A03B3408(v1 + 16, (uint64_t)v6);
    sub_1A03A8FEC(0, (unint64_t *)&qword_1ED0CE6B8, (uint64_t)&type metadata for Versions.Entity, (uint64_t)&off_1E4376068, (uint64_t (*)(_QWORD, uint64_t, uint64_t))type metadata accessor for Statement);
    swift_initStackObject();
    v4 = 0x80000001A03DA4F0;
    v3 = 0xD00000000000001ALL;
  }
  sub_1A03A80D8(3, v3, v4, v6);
  sub_1A03A79C0();
  result = swift_release();
  if (!v2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1A03D3770(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  __swift_project_boxed_opaque_existential_1(a3, a3[3]);
  swift_getDynamicType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3[4] + 96))(a4 + 16, a5, a6);
}

uint64_t sub_1A03D37E4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  __int128 v14[2];
  char v15;

  v5 = a2 + 16;
  v6 = *a1;
  v7 = *(_QWORD *)(*(_QWORD *)a2 + 80);
  v8 = *(_QWORD *)(*(_QWORD *)a2 + 88);
  type metadata accessor for Statement(0, v7, *(_QWORD *)(v8 + 24), a3);
  v15 = 0;
  v10 = sub_1A03C46B8(v6, v7, v8, v9);
  v12 = v11;
  sub_1A03B3408(v5, (uint64_t)v14);
  result = sub_1A03AD7A0(&v15, v10, v12, v14);
  *a4 = result;
  return result;
}

uint64_t Create<>.EntityMigration.init(migrate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  *a4 = a3;
  a4[1] = result;
  a4[2] = a2;
  return result;
}

uint64_t sub_1A03D389C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  __int128 v50;
  char v51;
  int v52;
  char v53;

  v52 = a3;
  v9 = *(_QWORD *)(*(_QWORD *)v6 + 80);
  v10 = type metadata accessor for MigratableEntity(255, v9, a5, a4);
  v11 = MEMORY[0x1A1AF9BC4](&unk_1A03D7CC8, v10);
  type metadata accessor for Create(0, v10, v11, v12);
  v47 = v6 + 16;
  sub_1A03B3408(v6 + 16, (uint64_t)&v50);
  sub_1A03A71B0(&v50, 0, 0, 0);
  sub_1A03A6724(1);
  v13 = swift_release();
  sub_1A03AD83C(v13);
  if (!v7)
  {
    v43 = v6;
    v44 = v9;
    swift_release();
    swift_bridgeObjectRelease();
    v14 = *(_QWORD *)(a6 + 8);
    type metadata accessor for Statement(0, a4, *(_QWORD *)(v14 + 24), v15);
    v53 = 4;
    v49 = 0xF000000000000007;
    v50 = 0uLL;
    v51 = -1;
    v16 = sub_1A03A9ED4(&v49, (uint64_t)&v50, 0, 1, a4, v14);
    v18 = sub_1A03A60E8(v16, a4, v14, v17);
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_1A03B3408(v47, (uint64_t)&v50);
    v21 = sub_1A03AD7A0(&v53, v18, v20, &v50);
    v23 = sub_1A03AD83C(v21);
    swift_release();
    v24 = MEMORY[0x1A1AF9BC4](&unk_1A03D7CE4, v10);
    type metadata accessor for Save(0, v10, v24, v25);
    sub_1A03B3408(v47, (uint64_t)&v50);
    v26 = sub_1A03AB8D4(&v50);
    *(_QWORD *)&v50 = v23;
    MEMORY[0x1E0C80A78](v26);
    v27 = sub_1A03D5D50();
    MEMORY[0x1A1AF9BC4](MEMORY[0x1E0DEAF38], v27);
    sub_1A03D5CC0();
    swift_bridgeObjectRelease();
    LOBYTE(v49) = 3;
    strcpy((char *)&v50, "DROP TABLE ");
    HIDWORD(v50) = -352321536;
    (*(void (**)(void))(v14 + 32))();
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    v28 = v50;
    sub_1A03B3408(v47, (uint64_t)&v50);
    v29 = sub_1A03AD7A0((char *)&v49, v28, *((uint64_t *)&v28 + 1), &v50);
    sub_1A03AD83C(v29);
    swift_release();
    swift_bridgeObjectRelease();
    v30 = *(_QWORD *)(a5 + 8);
    v32 = type metadata accessor for Statement(0, v44, *(_QWORD *)(v30 + 24), v31);
    LOBYTE(v49) = 2;
    *(_QWORD *)&v50 = 0;
    *((_QWORD *)&v50 + 1) = 0xE000000000000000;
    sub_1A03D5F30();
    swift_bridgeObjectRelease();
    strcpy((char *)&v50, "ALTER TABLE ");
    BYTE13(v50) = 0;
    HIWORD(v50) = -5120;
    sub_1A03C55F4(v44, a5);
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    v33 = *(void (**)(uint64_t, uint64_t))(v30 + 32);
    v33(v44, v30);
    sub_1A03D5C48();
    swift_bridgeObjectRelease();
    sub_1A03D5C48();
    v34 = v50;
    sub_1A03B3408(v47, (uint64_t)&v50);
    v35 = sub_1A03AD7A0((char *)&v49, v34, *((uint64_t *)&v34 + 1), &v50);
    sub_1A03AD83C(v35);
    v48 = (uint64_t (*)(uint64_t, uint64_t))v33;
    swift_release();
    swift_bridgeObjectRelease();
    v36 = sub_1A03A6F10(v52 & 1);
    *(_QWORD *)&v50 = sub_1A03D5CE4();
    if ((_QWORD)v50 != MEMORY[0x1A1AF92C4](v36, v32))
    {
      do
      {
        v40 = sub_1A03D5D20();
        sub_1A03D5D08();
        if ((v40 & 1) != 0)
          swift_retain();
        else
          sub_1A03D5F48();
        swift_bridgeObjectRetain();
        MEMORY[0x1A1AF92D0](&v50, v36, v32);
        v41 = swift_bridgeObjectRelease();
        sub_1A03AD83C(v41);
        swift_release();
        swift_bridgeObjectRelease();
        v42 = v50;
      }
      while (v42 != MEMORY[0x1A1AF92C4](v36, v32));
    }
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v43 + 56))
    {
      swift_retain();
      v37 = v48(v44, v30);
      (*(void (**)(uint64_t, uint64_t))(v30 + 40))(v44, v30);
      v38 = sub_1A03AA50C(v37);
      sub_1A03A6138((uint64_t)v38, v39);
      swift_release();
      swift_release();
      swift_release();
    }
  }
  return swift_release();
}

uint64_t Create<>.migrate<A>(from:ifNotExists:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  uint64_t v32;
  uint64_t v33;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  uint64_t *v53;
  __int128 v54;
  uint64_t v55;
  _UNKNOWN **v56;
  uint64_t v57;

  if (!v6[7])
    return sub_1A03A63F0(a2 & 1);
  v57 = a6;
  v50 = a2;
  v10 = *v6;
  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_26_4();
  result = OUTLINED_FUNCTION_25();
  if (v7)
    return result;
  v12 = *(_QWORD *)(v10 + 80);
  v13 = *(_QWORD *)(a5 + 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 32);
  swift_retain();
  v15 = v14(v12, v13);
  v55 = MEMORY[0x1E0DEA968];
  v56 = &protocol witness table for String;
  *(_QWORD *)&v54 = v15;
  *((_QWORD *)&v54 + 1) = v16;
  v17 = OUTLINED_FUNCTION_4_4();
  OUTLINED_FUNCTION_43_2(v17);
  sub_1A03A5D80(&v54, v18);
  v19 = sub_1A03A7208(v17, 0, 0, 0xFFu);
  v21 = v20;
  swift_release();
  swift_release();
  v46 = v13;
  a2 = v50;
  if (!v19)
    return sub_1A03A63F0(a2 & 1);
  if (!a3)
  {
LABEL_25:
    sub_1A03A63F0(v50 & 1);
    OUTLINED_FUNCTION_20_0();
    return OUTLINED_FUNCTION_55_0();
  }
  v22 = (uint64_t *)(a4 & 0xFFFFFFFFFFFFFFFELL);
  v53 = (uint64_t *)(v21 + 32);
  OUTLINED_FUNCTION_72();
  v23 = (uint64_t *)(v57 & 0xFFFFFFFFFFFFFFFELL);
  while (1)
  {
    v57 = a3;
    v24 = *v22;
    v25 = *v23;
    v47 = *(_QWORD *)(*(_QWORD *)a1 + 8);
    v26 = *(_QWORD *)(*(_QWORD *)a1 + 16);
    v27 = *v53;
    OUTLINED_FUNCTION_72();
    v29 = *(_QWORD *)(v27 + 24);
    v28 = *(_QWORD *)(v27 + 32);
    v49 = v25;
    v30 = *(_QWORD *)(v25 + 8);
    v31 = *(uint64_t (**)(uint64_t, uint64_t))(v30 + 40);
    swift_bridgeObjectRetain();
    swift_retain();
    v48 = v24;
    v32 = v31(v24, v30);
    if (!v28)
    {
      swift_release();
      OUTLINED_FUNCTION_6_5();
      goto LABEL_14;
    }
    if (v29 == v32 && v28 == v33)
    {
      OUTLINED_FUNCTION_4_11();
      OUTLINED_FUNCTION_6_5();
    }
    else
    {
      v35 = OUTLINED_FUNCTION_7_16();
      OUTLINED_FUNCTION_4_11();
      OUTLINED_FUNCTION_6_5();
      if ((v35 & 1) == 0)
      {
        swift_release();
LABEL_14:
        v36 = v57;
        goto LABEL_24;
      }
    }
    v37 = *v53;
    OUTLINED_FUNCTION_72();
    v39 = *(_QWORD *)(v37 + 24);
    v38 = *(_QWORD *)(v37 + 32);
    v40 = *(uint64_t (**)(void))(v46 + 40);
    swift_bridgeObjectRetain();
    v41 = v40();
    v36 = v57;
    if (!v38)
      break;
    v43 = v39 == v41 && v38 == v42;
    v44 = v26;
    if (v43)
    {
      OUTLINED_FUNCTION_20_0();
      OUTLINED_FUNCTION_4_11();
      OUTLINED_FUNCTION_6_5();
    }
    else
    {
      v45 = OUTLINED_FUNCTION_7_16();
      OUTLINED_FUNCTION_4_11();
      OUTLINED_FUNCTION_6_5();
      if ((v45 & 1) == 0)
        goto LABEL_29;
      OUTLINED_FUNCTION_20_0();
    }
LABEL_24:
    a1 += 8;
    ++v23;
    ++v22;
    a3 = v36 - 1;
    if (!a3)
      goto LABEL_25;
  }
  OUTLINED_FUNCTION_6_5();
  v44 = v26;
LABEL_29:
  swift_retain();
  sub_1A03D389C(v47, v44, v50 & 1, v48, a5, v49);
  swift_release();
  OUTLINED_FUNCTION_55_0();
  return swift_release_n();
}

uint64_t sub_1A03D422C(uint64_t a1, uint64_t (*a2)(uint64_t), char *a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t result;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t (*v34)(uint64_t);
  uint64_t v35;

  v33 = a3;
  v34 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)a4 + 80);
  v30 = *(_QWORD *)(v5 - 8);
  v31 = a4;
  MEMORY[0x1E0C80A78](a1);
  v7 = (uint64_t (*)(uint64_t))((char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(_QWORD *)(v5 + 16);
  v9 = sub_1A03D5EC4();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v29 - v12;
  v32 = v8;
  v14 = *(_QWORD *)(v8 - 8);
  v15 = MEMORY[0x1E0C80A78](v11);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v29 - v18;
  v20 = v35;
  result = v34(a1);
  if (!v20)
  {
    v35 = 0;
    v33 = v17;
    v34 = v7;
    v22 = v19;
    v23 = v5;
    v24 = v32;
    if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v32) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    }
    else
    {
      v25 = v14;
      v26 = v22;
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v22, v13, v24);
      v27 = (uint64_t)v33;
      (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v33, v26, v24);
      v28 = v34;
      sub_1A03C53F8(v27, v24, (uint64_t)v34);
      sub_1A03AD538((uint64_t)v28);
      (*(void (**)(uint64_t (*)(uint64_t), uint64_t))(v30 + 8))(v28, v23);
      return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v26, v24);
    }
  }
  return result;
}

uint64_t sub_1A03D4420()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocObject();
}

uint64_t method lookup function for Create()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Create.table(ifNotExists:shouldVersion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t sub_1A03D4474(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_retain();
  return a1;
}

uint64_t sub_1A03D44A8()
{
  return swift_release();
}

_QWORD *sub_1A03D44B0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_1A03D44F0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  swift_release();
  return a1;
}

void type metadata accessor for Create<>.EntityMigration()
{
  JUMPOUT(0x1A1AF9B88);
}

uint64_t sub_1A03D4534(uint64_t a1)
{
  uint64_t v1;

  return sub_1A03D422C(a1, *(uint64_t (**)(uint64_t))(v1 + 32), *(char **)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_1A03D4554(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_1A03D3770(a1, a2, a3, *(_QWORD *)(v3 + 16), *(unsigned __int8 *)(v3 + 24), *(unsigned __int8 *)(v3 + 25));
}

void sub_1A03D4574(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1EE597D18)
  {
    v2 = sub_1A03AA4D0();
    v4 = type metadata accessor for Drop(a1, (uint64_t)&type metadata for Versions.Entity, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1EE597D18);
  }
}

uint64_t sub_1A03D45CC(uint64_t result, uint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_1A03D45E4(result, a2, a3 & 1);
  return result;
}

uint64_t sub_1A03D45E4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1A03D45F4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  return sub_1A03D37E4(a1, v3, a2, a3);
}

void sub_1A03D4610(uint64_t a1, uint64_t a2, unint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v6;

  sub_1A03A298C(0, a3, a4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a2, a1, v6);
  OUTLINED_FUNCTION_14();
}

void sub_1A03D4664()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE597C00)
  {
    sub_1A03A5FF8(255, qword_1ED0CE0E0);
    v0 = sub_1A03D5EC4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE597C00);
  }
}

uint64_t OUTLINED_FUNCTION_24_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_26_4()
{
  return sub_1A03A7728(1, 1);
}

uint64_t OUTLINED_FUNCTION_28_3()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_30_3()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;

  sub_1A03ADE98(v0, v1, v2);
  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v3 - 72));
}

uint64_t OUTLINED_FUNCTION_34_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  return a3(a1, a2, v3, v4);
}

uint64_t OUTLINED_FUNCTION_35_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_36_3()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

void OUTLINED_FUNCTION_37_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v2 + 16) = v1;
  v5 = v2 + 16 * v0;
  *(_QWORD *)(v5 + 32) = v4;
  *(_QWORD *)(v5 + 40) = v3;
}

uint64_t OUTLINED_FUNCTION_38_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

__n128 OUTLINED_FUNCTION_39_2(__n128 a1, __n128 a2)
{
  __n128 *v2;
  __n128 *v3;
  __n128 result;

  *v2 = a1;
  v2[1] = a2;
  result = v3[2];
  v2[2] = result;
  v2[3].n128_u64[0] = v3[3].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_42_2()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_43_2(uint64_t result)
{
  *(_QWORD *)(result + 16) = 25705;
  *(_QWORD *)(result + 24) = 0xE200000000000000;
  return result;
}

void OUTLINED_FUNCTION_47_1()
{
  JUMPOUT(0x1A1AF92C4);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  uint64_t v0;

  return v0 + 32;
}

BOOL OUTLINED_FUNCTION_52_1@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_55_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return sub_1A03ACCBC(v1 + v3 * a1, v2);
}

uint64_t OUTLINED_FUNCTION_56_1()
{
  return swift_release();
}

uint64_t sub_1A03D4848()
{
  uint64_t inited;

  sub_1A03D49A8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A03D7EE0;
  *(_QWORD *)(inited + 32) = 25705;
  *(_QWORD *)(inited + 40) = 0xE200000000000000;
  *(_QWORD *)(inited + 48) = 61;
  *(_QWORD *)(inited + 56) = 0xE100000000000000;
  sub_1A03B2CA0();
  sub_1A03D5EE8();
  sub_1A03D5C48();
  swift_bridgeObjectRelease();
  sub_1A03D5C48();
  *(_QWORD *)(inited + 64) = 39;
  *(_QWORD *)(inited + 72) = 0xE100000000000000;
  return OUTLINED_FUNCTION_0_26();
}

uint64_t sub_1A03D4940()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;

  sub_1A03D49A8();
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1A03D6820;
  sub_1A03B2888();
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  return OUTLINED_FUNCTION_0_26();
}

void sub_1A03D49A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CE768)
  {
    v0 = sub_1A03D6110();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CE768);
  }
}

uint64_t dispatch thunk of StatementChainType.saveChain(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of static StatementChainType.createTableChain(for:ifNotExists:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of static StatementChainType.createTableChain(for:ifNotExists:shouldVersion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t LazyLoader.__allocating_init(object:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_5_14();
  LazyLoader.init(object:)(a1);
  return v2;
}

void LazyLoader.init(object:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_7_17();
  MEMORY[0x1E0C80A78](v4);
  OUTLINED_FUNCTION_2_24();
  v5 = v2[14];
  sub_1A03D5984();
  sub_1A03D59A8();
  OUTLINED_FUNCTION_31();
  *(_QWORD *)(v1 + v5) = OUTLINED_FUNCTION_4_20();
  v6 = v2[10];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 104), a1, v6);
  type metadata accessor for LazyLoader.LoadState(0, v6, v2[11], v2[12]);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_26();
}

uint64_t LazyLoader.__allocating_init(from:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v15[4];

  v4 = *(_QWORD *)(v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v15[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v15[-1] - v10;
  v12 = (uint64_t)__swift_project_boxed_opaque_existential_1(v9, v9[3]);
  sub_1A03D61F4();
  if (!v2)
  {
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    sub_1A03D6140();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v11, v4);
    v12 = LazyLoader.__allocating_init(object:)((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    OUTLINED_FUNCTION_22_0();
  }
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v12;
}

void LazyLoader.encode(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _BYTE v10[24];
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (_QWORD *)MEMORY[0x1E0C80A78](a1);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v8 = sub_1A03D620C();
  LazyLoader.load()(v8, v7);
  if (!v2)
  {
    __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v10, v11);
    sub_1A03D6158();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
  OUTLINED_FUNCTION_22_0();
  OUTLINED_FUNCTION_10();
}

uint64_t sub_1A03D4D34@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = LazyLoader.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

void sub_1A03D4D5C(uint64_t a1)
{
  LazyLoader.encode(to:)(a1);
}

uint64_t method lookup function for LazyLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of LazyLoader.__allocating_init(object:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of LazyLoader.__allocating_init(block:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

char *sub_1A03D4D98(char *a1, id *a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  char *v8;
  unsigned int v9;
  uint64_t v10;
  char *v11;
  char *v13;
  char *v14;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = (char *)*a2;
    *(_QWORD *)v3 = *a2;
    v3 = &v8[(unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8];
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 3)
    {
      if (v5 <= 3)
        v10 = v5;
      else
        v10 = 4;
      __asm { BR              X13 }
    }
    if (v9 == 2)
    {
      v13 = (char *)*a2;
      v14 = (char *)*a2;
      *(_QWORD *)v3 = v13;
      v3[v5] = 2;
      return v3;
    }
    if (v9 != 1)
    {
      (*(void (**)(char *))(v4 + 16))(a1);
      v3[v5] = 0;
      return v3;
    }
    v11 = (char *)a2[1];
    *(_QWORD *)v3 = *a2;
    *((_QWORD *)v3 + 1) = v11;
    v3[v5] = 1;
  }
  swift_retain();
  return v3;
}

uint64_t sub_1A03D4ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x10uLL)
      v7 = 16;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 3)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 2)
    {

    }
    else if (v8 == 1)
    {
      swift_release();
    }
    else
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    }
    v10 = *(unsigned __int8 *)(a2 + v7);
    if (v10 >= 3)
    {
      if (v7 <= 3)
        v11 = v7;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    if (v10 == 2)
    {
      v13 = *(void **)a2;
      v14 = v13;
      *(_QWORD *)a1 = v13;
      *(_BYTE *)(a1 + v7) = 2;
    }
    else if (v10 == 1)
    {
      v12 = *(_QWORD *)(a2 + 8);
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = v12;
      *(_BYTE *)(a1 + v7) = 1;
      swift_retain();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
      *(_BYTE *)(a1 + v7) = 0;
    }
  }
  return a1;
}

_QWORD *sub_1A03D50A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x10uLL)
    v5 = 16;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *((unsigned __int8 *)a2 + v5);
  if (v6 >= 3)
  {
    if (v5 <= 3)
      v7 = v5;
    else
      v7 = 4;
    __asm { BR              X13 }
  }
  if (v6 == 2)
  {
    *a1 = *a2;
    v8 = 2;
  }
  else if (v6 == 1)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v8 = 1;
  }
  else
  {
    (*(void (**)(_QWORD *))(v4 + 32))(a1);
    v8 = 0;
  }
  *((_BYTE *)a1 + v5) = v8;
  return a1;
}

uint64_t sub_1A03D518C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x10uLL)
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_21;
  v4 = v3 + 1;
  v5 = 8 * (v3 + 1);
  if ((v3 + 1) <= 3)
  {
    v8 = ((a2 + ~(-1 << v5) - 253) >> v5) + 1;
    if (HIWORD(v8))
    {
      v6 = *(_DWORD *)(a1 + v4);
      if (!v6)
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 > 0xFF)
    {
      v6 = *(unsigned __int16 *)(a1 + v4);
      if (!*(_WORD *)(a1 + v4))
        goto LABEL_21;
      goto LABEL_14;
    }
    if (v8 < 2)
    {
LABEL_21:
      v10 = *(unsigned __int8 *)(a1 + v3);
      if (v10 >= 3)
        return (v10 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v6 = *(unsigned __int8 *)(a1 + v4);
  if (!*(_BYTE *)(a1 + v4))
    goto LABEL_21;
LABEL_14:
  v9 = (v6 - 1) << v5;
  if (v4 > 3)
    v9 = 0;
  if (!(_DWORD)v4)
    return (v9 + 254);
  if (v4 > 3)
    LODWORD(v4) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03D5250 + 4 * byte_1A03D9510[(v4 - 1)]))();
}

void sub_1A03D529C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x10)
    v5 = 16;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    v8 = 0u;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v9 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v11;
      }
      else
      {
        *(_BYTE *)a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_1A03D5440(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 16;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x10uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 3u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A03D5488 + 4 * byte_1A03D951E[v3]))();
}

void sub_1A03D54D0(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x10uLL)
    v4 = 16;
  else
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (a2 > 2)
  {
    v5 = a2 - 3;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 3;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 3;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t storeEnumTagSinglePayload for LazyLoaderError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A03D55D8 + 4 * byte_1A03D9523[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A03D55F8 + 4 * byte_1A03D9528[v4]))();
}

_BYTE *sub_1A03D55D8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A03D55F8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03D5600(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03D5608(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A03D5610(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A03D5618(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LazyLoaderError()
{
  return &type metadata for LazyLoaderError;
}

unint64_t sub_1A03D5638()
{
  unint64_t result;

  result = qword_1EE597D20;
  if (!qword_1EE597D20)
  {
    result = MEMORY[0x1A1AF9BC4](&unk_1A03D9628, &type metadata for LazyLoaderError);
    atomic_store(result, (unint64_t *)&qword_1EE597D20);
  }
  return result;
}

uint64_t sub_1A03D567C()
{
  sub_1A03D61AC();
  sub_1A03D61B8();
  return sub_1A03D61C4();
}

uint64_t Double.queryValue.getter()
{
  sub_1A03D5D68();
  return 0;
}

void static Double.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t Double.init(valueType:connection:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 16) == 3)
    return __swift_destroy_boxed_opaque_existential_1(a2);
  result = sub_1A03D6038();
  __break(1u);
  return result;
}

void Double.valueType.getter(uint64_t a1@<X8>, double a2@<D0>)
{
  *(double *)a1 = a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 3;
}

void sub_1A03D57A0(uint64_t a1@<X8>)
{
  double *v1;

  Double.valueType.getter(a1, *v1);
}

uint64_t sub_1A03D57A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = Double.init(valueType:connection:)(a1, a2);
  *a3 = v5;
  return result;
}

uint64_t sub_1A03D57CC()
{
  return Double.queryValue.getter();
}

uint64_t sub_1A03D57D4()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1A03D57E0()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1A03D57EC()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1A03D57F8()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1A03D5804()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1A03D5810()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1A03D581C()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1A03D5828()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1A03D5834()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1A03D5840()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1A03D584C()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1A03D5858()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1A03D5864()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A03D5870()
{
  return MEMORY[0x1E0CB0080]();
}

uint64_t sub_1A03D587C()
{
  return MEMORY[0x1E0CB0098]();
}

uint64_t sub_1A03D5888()
{
  return MEMORY[0x1E0CB00F8]();
}

uint64_t sub_1A03D5894()
{
  return MEMORY[0x1E0CB0110]();
}

uint64_t sub_1A03D58A0()
{
  return MEMORY[0x1E0CB0120]();
}

uint64_t sub_1A03D58AC()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1A03D58B8()
{
  return MEMORY[0x1E0CB0218]();
}

uint64_t sub_1A03D58C4()
{
  return MEMORY[0x1E0CB0248]();
}

uint64_t sub_1A03D58D0()
{
  return MEMORY[0x1E0CB02B8]();
}

uint64_t sub_1A03D58DC()
{
  return MEMORY[0x1E0CB02C0]();
}

uint64_t sub_1A03D58E8()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1A03D58F4()
{
  return MEMORY[0x1E0CB07B0]();
}

uint64_t sub_1A03D5900()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1A03D590C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1A03D5918()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A03D5924()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1A03D5930()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1A03D593C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1A03D5948()
{
  return MEMORY[0x1E0DB3020]();
}

uint64_t sub_1A03D5954()
{
  return MEMORY[0x1E0DB3030]();
}

uint64_t sub_1A03D5960()
{
  return MEMORY[0x1E0DB3038]();
}

uint64_t sub_1A03D596C()
{
  return MEMORY[0x1E0DB31E0]();
}

uint64_t sub_1A03D5978()
{
  return MEMORY[0x1E0DB31E8]();
}

uint64_t sub_1A03D5984()
{
  return MEMORY[0x1E0DB31F0]();
}

uint64_t sub_1A03D5990()
{
  return MEMORY[0x1E0DB31F8]();
}

uint64_t sub_1A03D599C()
{
  return MEMORY[0x1E0DB3210]();
}

uint64_t sub_1A03D59A8()
{
  return MEMORY[0x1E0DB3220]();
}

uint64_t sub_1A03D59B4()
{
  return MEMORY[0x1E0DB35A0]();
}

uint64_t sub_1A03D59C0()
{
  return MEMORY[0x1E0DB41C8]();
}

uint64_t sub_1A03D59CC()
{
  return MEMORY[0x1E0DB47C0]();
}

uint64_t sub_1A03D59D8()
{
  return MEMORY[0x1E0DB47C8]();
}

uint64_t sub_1A03D59E4()
{
  return MEMORY[0x1E0DB4AB8]();
}

uint64_t sub_1A03D59F0()
{
  return MEMORY[0x1E0DB4C30]();
}

uint64_t sub_1A03D59FC()
{
  return MEMORY[0x1E0DB4CB8]();
}

uint64_t sub_1A03D5A08()
{
  return MEMORY[0x1E0DB4CC0]();
}

uint64_t sub_1A03D5A14()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1A03D5A20()
{
  return MEMORY[0x1E0DB4E88]();
}

uint64_t sub_1A03D5A2C()
{
  return MEMORY[0x1E0DF2078]();
}

uint64_t sub_1A03D5A38()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1A03D5A44()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1A03D5A50()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1A03D5A5C()
{
  return MEMORY[0x1E0DEF4A8]();
}

uint64_t sub_1A03D5A68()
{
  return MEMORY[0x1E0DEF4D0]();
}

uint64_t sub_1A03D5A74()
{
  return MEMORY[0x1E0DEF4E8]();
}

uint64_t sub_1A03D5A80()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A03D5A8C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A03D5A98()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A03D5AA4()
{
  return MEMORY[0x1E0DEF698]();
}

uint64_t sub_1A03D5AB0()
{
  return MEMORY[0x1E0DEF6B8]();
}

uint64_t sub_1A03D5ABC()
{
  return MEMORY[0x1E0DEF6F8]();
}

uint64_t sub_1A03D5AC8()
{
  return MEMORY[0x1E0DEF708]();
}

uint64_t sub_1A03D5AD4()
{
  return MEMORY[0x1E0DEF728]();
}

uint64_t sub_1A03D5AE0()
{
  return MEMORY[0x1E0DEF750]();
}

uint64_t sub_1A03D5AEC()
{
  return MEMORY[0x1E0DE9D60]();
}

uint64_t sub_1A03D5AF8()
{
  return MEMORY[0x1E0DE9D70]();
}

uint64_t sub_1A03D5B04()
{
  return MEMORY[0x1E0DB5120]();
}

uint64_t sub_1A03D5B10()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A03D5B1C()
{
  return MEMORY[0x1E0DE9F38]();
}

uint64_t sub_1A03D5B28()
{
  return MEMORY[0x1E0DE9F78]();
}

uint64_t sub_1A03D5B34()
{
  return MEMORY[0x1E0DE9FA8]();
}

uint64_t sub_1A03D5B40()
{
  return MEMORY[0x1E0DE9FC0]();
}

uint64_t sub_1A03D5B4C()
{
  return MEMORY[0x1E0DEA038]();
}

uint64_t sub_1A03D5B58()
{
  return MEMORY[0x1E0DEA040]();
}

uint64_t sub_1A03D5B64()
{
  return MEMORY[0x1E0DEA048]();
}

uint64_t sub_1A03D5B70()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1A03D5B7C()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1A03D5B88()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1A03D5B94()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A03D5BA0()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1A03D5BAC()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1A03D5BB8()
{
  return MEMORY[0x1E0DEA3D0]();
}

uint64_t sub_1A03D5BC4()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A03D5BD0()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A03D5BDC()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A03D5BE8()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1A03D5BF4()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1A03D5C00()
{
  return MEMORY[0x1E0DEA6A0]();
}

uint64_t sub_1A03D5C0C()
{
  return MEMORY[0x1E0DEA6A8]();
}

uint64_t sub_1A03D5C18()
{
  return MEMORY[0x1E0DEA6C0]();
}

uint64_t sub_1A03D5C24()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A03D5C30()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1A03D5C3C()
{
  return MEMORY[0x1E0DEA7F8]();
}

uint64_t sub_1A03D5C48()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A03D5C54()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1A03D5C60()
{
  return MEMORY[0x1E0DEA830]();
}

uint64_t sub_1A03D5C6C()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1A03D5C78()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1A03D5C84()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1A03D5C90()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1A03D5C9C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1A03D5CA8()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1A03D5CB4()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A03D5CC0()
{
  return MEMORY[0x1E0DEAB40]();
}

uint64_t sub_1A03D5CCC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1A03D5CD8()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A03D5CE4()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1A03D5CF0()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A03D5CFC()
{
  return MEMORY[0x1E0DEADC0]();
}

uint64_t sub_1A03D5D08()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A03D5D14()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A03D5D20()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A03D5D2C()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A03D5D38()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A03D5D44()
{
  return MEMORY[0x1E0DEAEA8]();
}

uint64_t sub_1A03D5D50()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A03D5D5C()
{
  return MEMORY[0x1E0DEAFE8]();
}

uint64_t sub_1A03D5D68()
{
  return MEMORY[0x1E0DEB030]();
}

uint64_t sub_1A03D5D74()
{
  return MEMORY[0x1E0DEB110]();
}

uint64_t sub_1A03D5D80()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A03D5D8C()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A03D5D98()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A03D5DA4()
{
  return MEMORY[0x1E0DEB620]();
}

uint64_t sub_1A03D5DB0()
{
  return MEMORY[0x1E0DEB660]();
}

uint64_t sub_1A03D5DBC()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A03D5DC8()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1A03D5DD4()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1A03D5DE0()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1A03D5DEC()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1A03D5DF8()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1A03D5E04()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1A03D5E10()
{
  return MEMORY[0x1E0DEF8F0]();
}

uint64_t sub_1A03D5E1C()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1A03D5E28()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A03D5E34()
{
  return MEMORY[0x1E0DEF908]();
}

uint64_t sub_1A03D5E40()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1A03D5E4C()
{
  return MEMORY[0x1E0DEF938]();
}

uint64_t sub_1A03D5E58()
{
  return MEMORY[0x1E0DEF978]();
}

uint64_t sub_1A03D5E64()
{
  return MEMORY[0x1E0DEF9A0]();
}

uint64_t sub_1A03D5E70()
{
  return MEMORY[0x1E0DEF9B0]();
}

uint64_t sub_1A03D5E7C()
{
  return MEMORY[0x1E0DEF9D8]();
}

uint64_t sub_1A03D5E88()
{
  return MEMORY[0x1E0DEF9F0]();
}

uint64_t sub_1A03D5E94()
{
  return MEMORY[0x1E0DEFA18]();
}

uint64_t sub_1A03D5EA0()
{
  return MEMORY[0x1E0DEFA30]();
}

uint64_t sub_1A03D5EAC()
{
  return MEMORY[0x1E0DEFAA8]();
}

uint64_t sub_1A03D5EB8()
{
  return MEMORY[0x1E0DF22E0]();
}

uint64_t sub_1A03D5EC4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A03D5ED0()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1A03D5EDC()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1A03D5EE8()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1A03D5EF4()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1A03D5F00()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A03D5F0C()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1A03D5F18()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_1A03D5F24()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1A03D5F30()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A03D5F3C()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1A03D5F48()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A03D5F54()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A03D5F60()
{
  return MEMORY[0x1E0DEC518]();
}

uint64_t sub_1A03D5F6C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A03D5F78()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1A03D5F84()
{
  return MEMORY[0x1E0DEC5F8]();
}

uint64_t sub_1A03D5F90()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1A03D5F9C()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1A03D5FA8()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A03D5FB4()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1A03D5FC0()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1A03D5FCC()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1A03D5FD8()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A03D5FE4()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A03D5FF0()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A03D5FFC()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1A03D6008()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1A03D6014()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1A03D6020()
{
  return MEMORY[0x1E0DECB00]();
}

uint64_t sub_1A03D602C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1A03D6038()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1A03D6044()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A03D6050()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1A03D605C()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1A03D6068()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A03D6074()
{
  return MEMORY[0x1E0DECFC0]();
}

uint64_t sub_1A03D6080()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1A03D608C()
{
  return MEMORY[0x1E0DECFD0]();
}

uint64_t sub_1A03D6098()
{
  return MEMORY[0x1E0DECFE0]();
}

uint64_t sub_1A03D60A4()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1A03D60B0()
{
  return MEMORY[0x1E0DED048]();
}

uint64_t sub_1A03D60BC()
{
  return MEMORY[0x1E0DED0F0]();
}

uint64_t sub_1A03D60C8()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1A03D60D4()
{
  return MEMORY[0x1E0DED100]();
}

uint64_t sub_1A03D60E0()
{
  return MEMORY[0x1E0DED110]();
}

uint64_t sub_1A03D60EC()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1A03D60F8()
{
  return MEMORY[0x1E0DED170]();
}

uint64_t sub_1A03D6104()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1A03D6110()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1A03D611C()
{
  return MEMORY[0x1E0DED548]();
}

uint64_t sub_1A03D6128()
{
  return MEMORY[0x1E0DED568]();
}

uint64_t sub_1A03D6134()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A03D6140()
{
  return MEMORY[0x1E0DED658]();
}

uint64_t sub_1A03D614C()
{
  return MEMORY[0x1E0DED690]();
}

uint64_t sub_1A03D6158()
{
  return MEMORY[0x1E0DED6F8]();
}

uint64_t sub_1A03D6164()
{
  return MEMORY[0x1E0DED740]();
}

uint64_t sub_1A03D6170()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A03D617C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1A03D6188()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1A03D6194()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1A03D61A0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1A03D61AC()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A03D61B8()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A03D61C4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A03D61D0()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1A03D61DC()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1A03D61E8()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1A03D61F4()
{
  return MEMORY[0x1E0DEE230]();
}

uint64_t sub_1A03D6200()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1A03D620C()
{
  return MEMORY[0x1E0DEE260]();
}

uint64_t sub_1A03D6218()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1A03D6224()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1A03D6230()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1A03D623C()
{
  return MEMORY[0x1E0DEE978]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sqlite3_db_truncate()
{
  return MEMORY[0x1E0DE8530]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
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

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x1E0DE8A98](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x1E0DEEC38]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x1E0DEEC90]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x1E0DEEEB8]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
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

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

