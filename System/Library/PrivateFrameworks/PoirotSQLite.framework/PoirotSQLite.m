uint64_t initializeBufferWithCopyOfBuffer for SQLiteStatement(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy192_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  result = (__n128)a2[8];
  v9 = a2[9];
  v10 = a2[11];
  *(_OWORD *)(a1 + 160) = a2[10];
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 128) = result;
  *(_OWORD *)(a1 + 144) = v9;
  return result;
}

uint64_t sub_244546B58(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 192))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t sub_244546BB4(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 184) = 0;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 192) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 192) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

void type metadata accessor for sqlite3_module(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D28);
}

void sub_244546C4C()
{
  qword_257371240 = -1;
}

uint64_t sub_244546C5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = sub_2445680F0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v10 - v6;
  __swift_allocate_value_buffer(v5, qword_257371248);
  __swift_project_value_buffer(v0, (uint64_t)qword_257371248);
  sub_2445680CC();
  sub_2445680C0();
  sub_2445680D8();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  return ((uint64_t (*)(char *, uint64_t))v8)(v7, v0);
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

void type metadata accessor for sqlite3_vtab_cursor(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D30);
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_244546DC4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 96))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244546DE4(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
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
  *(_BYTE *)(result + 96) = v3;
  return result;
}

void type metadata accessor for sqlite3_index_info(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D38);
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t sub_244546E50(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244546E70(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
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
  *(_BYTE *)(result + 24) = v3;
  return result;
}

void type metadata accessor for sqlite3_vtab(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D40);
}

_QWORD *__swift_memcpy8_4(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void type metadata accessor for sqlite3_index_constraint_usage(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D48);
}

uint64_t sub_244546ED0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244546EF0(uint64_t result, int a2, int a3)
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

void type metadata accessor for sqlite3_index_orderby(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D50);
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_244546F40(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_244546F60(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 12) = v3;
  return result;
}

void type metadata accessor for sqlite3_index_constraint(uint64_t a1)
{
  sub_244546FA0(a1, &qword_257370D58);
}

void sub_244546FA0(uint64_t a1, unint64_t *a2)
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

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteColumnType.getDataType()()
{
  PoirotSQLite::SQLiteDataType result;

  __asm { BR              X11 }
  return result;
}

void sub_24454701C(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void sub_24454704C()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD00000000000003ELL;
  *(_QWORD *)(v0 + 8) = 0x8000000244568B70;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  swift_willThrow();
  JUMPOUT(0x24454703CLL);
}

unint64_t sub_2445470A0()
{
  unint64_t result;

  result = qword_257370D60;
  if (!qword_257370D60)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteError, &type metadata for SQLiteError);
    atomic_store(result, (unint64_t *)&qword_257370D60);
  }
  return result;
}

void SQLiteColumnType.defaultNativeType.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_24454711C()
{
  return MEMORY[0x24BEE13C8];
}

unint64_t sub_2445471D8()
{
  unint64_t result;

  result = qword_257370D68;
  if (!qword_257370D68)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteUndefined, &type metadata for SQLiteUndefined);
    atomic_store(result, (unint64_t *)&qword_257370D68);
  }
  return result;
}

unint64_t sub_24454721C()
{
  unint64_t result;

  result = qword_257370D70;
  if (!qword_257370D70)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for Data, MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257370D70);
  }
  return result;
}

PoirotSQLite::SQLiteColumnType_optional __swiftcall SQLiteColumnType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PoirotSQLite::SQLiteColumnType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2445684D4();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

void *static SQLiteColumnType.allCases.getter()
{
  return &unk_25152AF78;
}

uint64_t SQLiteColumnType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2445472EC + 4 * byte_244569966[*v0]))(1415071060, 0xE400000000000000);
}

uint64_t sub_2445472EC()
{
  return 1112493122;
}

uint64_t sub_2445472F8()
{
  return 0x3233544E49;
}

uint64_t sub_24454730C()
{
  return 0x3436544E49;
}

uint64_t sub_244547320()
{
  return 0x3233544E4955;
}

uint64_t sub_244547334()
{
  return 0x3436544E4955;
}

uint64_t sub_244547348()
{
  return 0x54414F4C46;
}

uint64_t sub_24454735C()
{
  return 0x454C42554F44;
}

uint64_t sub_244547370()
{
  return 0x4E41454C4F4F42;
}

uint64_t sub_244547388()
{
  return 5852737;
}

uint64_t sub_244547398()
{
  return 0x454D495445544144;
}

void sub_2445473B0(char *a1)
{
  sub_244547404(*a1);
}

unint64_t sub_2445473C0()
{
  unint64_t result;

  result = qword_257370D78;
  if (!qword_257370D78)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteColumnType, &type metadata for SQLiteColumnType);
    atomic_store(result, (unint64_t *)&qword_257370D78);
  }
  return result;
}

void sub_244547404(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_244547444(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244547524 + 4 * byte_24456997C[a2]))(1112493122);
}

uint64_t sub_244547524(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 1112493122 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_244568510();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_24454767C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_244568564();
  sub_2445476C8((uint64_t)v3, v1);
  return sub_244568588();
}

void sub_2445476C0(uint64_t a1)
{
  char *v1;

  sub_2445476C8(a1, *v1);
}

void sub_2445476C8(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244547700()
{
  sub_244568204();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2445477D8()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_244568564();
  sub_2445476C8((uint64_t)v3, v1);
  return sub_244568588();
}

PoirotSQLite::SQLiteColumnType_optional sub_244547818(Swift::String *a1)
{
  return SQLiteColumnType.init(rawValue:)(*a1);
}

uint64_t sub_244547824@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SQLiteColumnType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_24454784C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257370D80;
  if (!qword_257370D80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257370D88);
    result = MEMORY[0x249512068](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257370D80);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24951205C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_2445478DC(_QWORD *a1@<X8>)
{
  *a1 = &unk_25152AF78;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteColumnType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteColumnType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_2445479D4 + 4 * byte_244569997[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_244547A08 + 4 * byte_244569992[v4]))();
}

uint64_t sub_244547A08(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244547A10(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244547A18);
  return result;
}

uint64_t sub_244547A24(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244547A2CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_244547A30(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244547A38(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244547A44(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244547A50(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteColumnType()
{
  return &type metadata for SQLiteColumnType;
}

uint64_t sub_244547A68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  SQLiteColumnDescribing.isValid(_:)(a1, a2, a3);
  return v3 & 1;
}

void SQLiteColumnDescribing.isValid(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  (*(void (**)(uint64_t *__return_ptr))(v3 + 24))(&v4);
  __asm { BR              X10 }
}

uint64_t sub_244547B00()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v3 + 40))(&v5, v2, v3);
  if (!v0)
    __asm { BR              X11 }
  return 0;
}

uint64_t sub_244547BF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void (*a11)(uint64_t, uint64_t), uint64_t a12, uint64_t a13, int a14, char a15, unsigned __int8 a16)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;

  a11(a10, v17);
  if (((*(uint64_t (**)(void))(v18 + 32))() & 1) == 0)
    JUMPOUT(0x244547BCCLL);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  swift_getDynamicType();
  v19 = (*(_QWORD *(**)(unsigned __int8 *__return_ptr))(v16[4] + 24))(&a16);
  return ((uint64_t (*)(_QWORD *))((char *)&loc_244547BCC + 4 * byte_244569AF0[a16]))(v19);
}

void sub_244547CC8()
{
  JUMPOUT(0x244547BCCLL);
}

void sub_244547CD0()
{
  JUMPOUT(0x244547BCCLL);
}

uint64_t SQLiteColumnDescribing.nullable.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(void))(a2 + 24))();
  return (*(uint64_t (**)(void))(v2 + 32))() & 1;
}

BOOL static SQLiteColumnDescribing.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t);
  _BOOL8 v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v7 = *(_QWORD *)(a3 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v31 - v12;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 32);
  v31 = v11;
  v17 = v15(v16, v14);
  v19 = v18;
  v32 = a2;
  if (v17 == v15(a3, a4) && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
    v26 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v26(v13, v31, a3);
    v26(v10, v32, a3);
    v25 = v7;
  }
  else
  {
    v22 = sub_244568510();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v23(v13, v31, a3);
    v23(v10, v32, a3);
    v24 = 0;
    v25 = v7;
    if ((v22 & 1) == 0)
      goto LABEL_9;
  }
  v27 = *(uint64_t (**)(uint64_t, uint64_t))(a4 + 24);
  v28 = v27(a3, a4);
  v24 = v28 == v27(a3, a4);
LABEL_9:
  v29 = *(void (**)(char *, uint64_t))(v25 + 8);
  v29(v10, a3);
  v29(v13, a3);
  return v24;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteColumnDescribing.ensureValidSQLNameCharacters()()
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
  char v9;
  char v10;
  uint64_t v11;
  _QWORD v12[2];

  v2 = v1;
  v3 = v0;
  v4 = sub_2445680F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 32))(v3, v2);
  v12[1] = v8;
  if (qword_257370D08 != -1)
    swift_once();
  __swift_project_value_buffer(v4, (uint64_t)qword_257371248);
  sub_2445680E4();
  sub_244548248();
  sub_24456839C();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) == 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v11 + 8) = 0;
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)v11 = 10;
    *(_BYTE *)(v11 + 24) = 5;
    swift_willThrow();
  }
  swift_bridgeObjectRelease();
}

uint64_t SQLiteColumnDescribing<>.columnName.getter()
{
  uint64_t v1;

  sub_2445682A0();
  return v1;
}

uint64_t SQLiteColumnDescribing<>.init(index:)@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v8;

  sub_244568414();
  if (MEMORY[0x2495118D0](v8, a2) <= a1)
  {
    v6 = 1;
  }
  else
  {
    sub_2445682F4();
    v6 = 0;
  }
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a3, v6, 1, a2);
}

uint64_t SQLiteColumnDescribing<>.getColumnIndex()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  sub_244568414();
  v0 = sub_2445682E8();
  MEMORY[0x249512068](MEMORY[0x24BEE12E0], v0);
  sub_244568330();
  swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    sub_2445682A0();
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v1 = v3;
    *(_QWORD *)(v1 + 8) = v4;
    *(_QWORD *)(v1 + 16) = 0;
    *(_BYTE *)(v1 + 24) = 1;
    return swift_willThrow();
  }
  result = v3;
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (v3 > 0x7FFFFFFF)
LABEL_7:
    __break(1u);
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_244548248()
{
  unint64_t result;

  result = qword_257370D90;
  if (!qword_257370D90)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257370D90);
  }
  return result;
}

uint64_t dispatch thunk of SQLiteColumnDescribing.columnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SQLiteColumnDescribing.columnName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SQLiteColumnDescribing.isValid(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))() & 1;
}

Swift::OpaquePointer_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteStatement.nextRowValues()()
{
  uint64_t v0;
  Swift::Int v1;
  Swift::Bool v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  sqlite3_stmt *v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  Swift::OpaquePointer_optional result;

  SQLiteStatement.nextRow()(&v14);
  if (v0)
    goto LABEL_20;
  v3 = v14;
  if (!v14)
  {
    v1 = 0;
    goto LABEL_20;
  }
  v4 = sub_244548494(MEMORY[0x24BEE4AF8]);
  v13 = v4;
  v5 = *(_QWORD *)(v3 + 16);
  if (!v5 || !*(_QWORD *)(v5 + 16))
  {
LABEL_16:
    sub_2445470A0();
    swift_allocError();
    v12 = 4;
LABEL_19:
    *(_QWORD *)v11 = v12;
    *(_QWORD *)(v11 + 8) = 0;
    *(_QWORD *)(v11 + 16) = 0;
    *(_BYTE *)(v11 + 24) = 5;
    swift_willThrow();
    swift_release();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v1 = v4;
  v6 = *(sqlite3_stmt **)(v3 + 24);
  if (!v6)
  {
LABEL_18:
    sub_2445470A0();
    swift_allocError();
    v12 = 3;
    goto LABEL_19;
  }
  v7 = sqlite3_column_count(v6);
  if ((v7 & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = (int)v7;
  if ((_DWORD)v7)
  {
    v1 = 0;
    while (v8 != v1)
    {
      v9 = *(_QWORD *)(v3 + 16);
      if (!v9 || !*(_QWORD *)(v9 + 16))
        goto LABEL_16;
      v10 = *(sqlite3_stmt **)(v3 + 24);
      if (!v10)
        goto LABEL_18;
      v7 = (uint64_t)sqlite3_column_name(v10, v1);
      if (v7)
      {
        sub_244568228();
        sub_2445485C0(v1);
        v7 = swift_bridgeObjectRelease();
      }
      if (v8 == ++v1)
      {
        swift_release();
        v1 = v13;
        goto LABEL_20;
      }
    }
    __break(1u);
    goto LABEL_24;
  }
  swift_release();
LABEL_20:
  v7 = v1;
LABEL_25:
  result.value._rawValue = (void *)v7;
  result.is_nil = v2;
  return result;
}

unint64_t sub_244548494(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257370D98);
  v2 = sub_2445684BC();
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
    sub_24454A510(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_244549134(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_24454A19C(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

uint64_t sub_2445485C0(Swift::Int a1)
{
  uint64_t result;
  uint64_t v2;

  result = SQLiteRow.type(at:)(a1);
  if (!v2)
    __asm { BR              X10 }
  return result;
}

uint64_t sub_244548794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_24454A19C((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_24454987C(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24454A4D4(a1, &qword_257370DA8);
    sub_244549278(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_24454A4D4((uint64_t)v9, &qword_257370DA8);
  }
}

void SQLiteStatement.nextRowValues(matching:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  char v15;
  uint64_t v16;

  v4 = *((_QWORD *)v1 + 2);
  v5 = *((_BYTE *)v1 + 40);
  v12 = *v1;
  v13 = v4;
  v14 = *(__int128 *)((char *)v1 + 24);
  v15 = v5;
  SQLiteStatement.nextRow()(&v16);
  if (!v2 && v16)
  {
    v6 = a1[3];
    v7 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v6);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 16))(v6, v7);
    swift_retain();
    v9 = sub_244549FC8(v8);
    swift_bridgeObjectRelease();
    swift_release();
    if (*(_QWORD *)(v9 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257370D98);
      v10 = sub_2445684BC();
    }
    else
    {
      v10 = MEMORY[0x24BEE4B00];
    }
    *(_QWORD *)&v12 = v10;
    v11 = swift_bridgeObjectRetain();
    sub_244549C04(v11, 1, &v12);
    swift_release();
    swift_bridgeObjectRelease();
  }
}

uint64_t SQLiteStatement.nextRowValues(ifMatching:)(_QWORD *a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  sqlite3_stmt *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  sqlite3_stmt *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  uint64_t *v50;
  uint64_t v51;
  __int128 v52[2];
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  char v56;
  unint64_t v57;

  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_BYTE *)(v2 + 40);
  v53 = *(_OWORD *)v2;
  v54 = v5;
  v55 = *(_OWORD *)(v2 + 24);
  v56 = v6;
  SQLiteStatement.nextRow()(v52);
  if (v3)
    return v1;
  v7 = *(_QWORD *)&v52[0];
  if (!*(_QWORD *)&v52[0])
    return 0;
  v8 = a1[3];
  v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
  v11 = sub_244548494(MEMORY[0x24BEE4AF8]);
  v1 = v11;
  v12 = *(_QWORD *)(v10 + 16);
  if (!v12)
  {
LABEL_33:
    swift_release();
    swift_bridgeObjectRelease();
    return v1;
  }
  v44 = v11;
  v13 = v10 + 32;
  swift_bridgeObjectRetain();
  v14 = 0;
  v46 = v12;
  v47 = v7;
  v45 = v10 + 32;
  while (1)
  {
    v15 = (_QWORD *)(v13 + 40 * v14);
    v16 = v15[3];
    v50 = v15 + 3;
    v17 = v15[4];
    __swift_project_boxed_opaque_existential_1(v15, v16);
    v49 = *(uint64_t (**)(uint64_t, uint64_t))(v17 + 32);
    v18 = v49(v16, v17);
    v51 = v19;
    v20 = *(_QWORD *)(v7 + 16);
    if (v20)
    {
      if (*(_QWORD *)(v20 + 16))
        break;
    }
    sub_2445470A0();
    v27 = (void *)swift_allocError();
    *(_QWORD *)(v26 + 16) = 0;
    v28 = 4;
LABEL_12:
    *(_QWORD *)v26 = v28;
    *(_QWORD *)(v26 + 8) = 0;
    *(_BYTE *)(v26 + 24) = 5;
LABEL_30:
    swift_willThrow();

    swift_bridgeObjectRelease();
LABEL_31:
    if (++v14 == v12)
    {
      swift_bridgeObjectRelease();
      v1 = v44;
      goto LABEL_33;
    }
  }
  v21 = v18;
  v22 = *(sqlite3_stmt **)(v7 + 24);
  if (!v22)
  {
    sub_2445470A0();
    v27 = (void *)swift_allocError();
    *(_QWORD *)(v26 + 16) = 0;
    v28 = 3;
    goto LABEL_12;
  }
  v48 = v21;
  result = sqlite3_column_count(v22);
  if ((result & 0x80000000) != 0)
    goto LABEL_37;
  v24 = (int)result;
  if (!(_DWORD)result)
  {
LABEL_25:
    sub_2445470A0();
    v27 = (void *)swift_allocError();
    *(_QWORD *)v41 = v48;
    *(_QWORD *)(v41 + 8) = v51;
    *(_QWORD *)(v41 + 16) = 0;
    *(_BYTE *)(v41 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_29:
    v13 = v45;
    v12 = v46;
    goto LABEL_30;
  }
  v25 = 0;
  while (v24 != v25)
  {
    v30 = *(_QWORD *)(v7 + 16);
    if (!v30 || !*(_QWORD *)(v30 + 16))
    {
      sub_2445470A0();
      v27 = (void *)swift_allocError();
      *(_QWORD *)(v42 + 16) = 0;
      v43 = 4;
LABEL_28:
      *(_QWORD *)v42 = v43;
      *(_QWORD *)(v42 + 8) = 0;
      *(_BYTE *)(v42 + 24) = 5;
      goto LABEL_29;
    }
    v31 = *(sqlite3_stmt **)(v7 + 24);
    if (!v31)
    {
      sub_2445470A0();
      v27 = (void *)swift_allocError();
      *(_QWORD *)(v42 + 16) = 0;
      v43 = 3;
      goto LABEL_28;
    }
    result = (uint64_t)sqlite3_column_name(v31, v25);
    if (result)
    {
      if (v48 == sub_244568228() && v51 == v32)
      {
        swift_bridgeObjectRelease();
        v7 = v47;
LABEL_23:
        swift_bridgeObjectRelease();
        v33 = v7;
        v34 = v49(v16, v17);
        v36 = v35;
        v37 = *v50;
        v38 = v15[4];
        v39 = __swift_project_boxed_opaque_existential_1(v15, *v50);
        *(_QWORD *)&v52[0] = v33;
        SQLiteRow.get<A>(from:)((uint64_t)v39, v37, v38);
        sub_24454A19C(&v53, (uint64_t)v52);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v57 = v44;
        sub_24454987C(v52, v34, v36, isUniquelyReferenced_nonNull_native);
        v44 = v57;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v12 = v46;
        v7 = v47;
        v13 = v45;
        goto LABEL_31;
      }
      v29 = sub_244568510();
      result = swift_bridgeObjectRelease();
      v7 = v47;
      if ((v29 & 1) != 0)
        goto LABEL_23;
    }
    if (v24 == ++v25)
      goto LABEL_25;
  }
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t SQLiteStatement.bind(values:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_244548FB0(a1, (void (*)(_QWORD, _QWORD, _OWORD *))sub_24454A1B4, a2);
}

uint64_t sub_244548E38(uint64_t a1, uint64_t a2, _QWORD *a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18[5];

  v6 = a3[3];
  v7 = a3[4];
  v8 = __swift_project_boxed_opaque_existential_1(a3, v6);
  v18[3] = v6;
  v9 = *(_QWORD *)(v7 + 8);
  v18[4] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v8, v6);
  *(_QWORD *)&v16 = 64;
  *((_QWORD *)&v16 + 1) = 0xE100000000000000;
  sub_24456821C();
  v11 = a4[1];
  v16 = *a4;
  v17[0] = v11;
  *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)a4 + 25);
  v12 = sub_2445573FC();
  if (!v4)
  {
    if (v12)
    {
      v13 = a4[1];
      v16 = *a4;
      v17[0] = v13;
      *(_OWORD *)((char *)v17 + 9) = *(__int128 *)((char *)a4 + 25);
      (*(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(v9 + 8))(&v16, v12, v6, v9);
    }
    else
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v14 + 8) = 0;
      *(_QWORD *)(v14 + 16) = 0;
      *(_QWORD *)v14 = 9;
      *(_BYTE *)(v14 + 24) = 5;
      swift_willThrow();
    }
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
}

uint64_t SQLiteStatement.bindIfAny(values:)@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  return sub_244548FB0(a1, (void (*)(_QWORD, _QWORD, _OWORD *))sub_24454A41C, a2);
}

uint64_t sub_244548FB0@<X0>(uint64_t a1@<X0>, void (*a2)(_QWORD, _QWORD, _OWORD *)@<X1>, _OWORD *a3@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  __int128 v6;
  uint64_t result;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];

  v6 = v3[1];
  v9 = *v3;
  v10[0] = v6;
  *(_OWORD *)((char *)v10 + 9) = *(__int128 *)((char *)v3 + 25);
  result = sub_24454A1CC(a1, a2);
  if (!v4)
  {
    v8 = v10[0];
    *a3 = v9;
    a3[1] = v8;
    *(_OWORD *)((char *)a3 + 25) = *(_OWORD *)((char *)v10 + 9);
    return sub_24454A3E8((uint64_t)&v9);
  }
  return result;
}

uint64_t sub_244549018(uint64_t a1, uint64_t a2, _QWORD *a3, __int128 *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *boxed_opaque_existential_1;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v15;
  _OWORD v16[2];
  uint64_t v17[5];

  v6 = a3[3];
  v7 = a3[4];
  v8 = __swift_project_boxed_opaque_existential_1(a3, v6);
  v17[3] = v6;
  v9 = *(_QWORD *)(v7 + 8);
  v17[4] = v9;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(boxed_opaque_existential_1, v8, v6);
  *(_QWORD *)&v15 = 64;
  *((_QWORD *)&v15 + 1) = 0xE100000000000000;
  sub_24456821C();
  v11 = a4[1];
  v15 = *a4;
  v16[0] = v11;
  *(_OWORD *)((char *)v16 + 9) = *(__int128 *)((char *)a4 + 25);
  v12 = sub_2445573FC();
  if (!v4 && v12)
  {
    v13 = a4[1];
    v15 = *a4;
    v16[0] = v13;
    *(_OWORD *)((char *)v16 + 9) = *(__int128 *)((char *)a4 + 25);
    (*(void (**)(__int128 *, uint64_t, uint64_t, uint64_t))(v9 + 8))(&v15, v12, v6, v9);
  }
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
}

unint64_t sub_244549134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_244568564();
  sub_244568204();
  v4 = sub_244568588();
  return sub_244549198(a1, a2, v4);
}

unint64_t sub_244549198(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_244568510() & 1) == 0)
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
      while (!v14 && (sub_244568510() & 1) == 0);
    }
  }
  return v6;
}

double sub_244549278@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  v8 = sub_244549134(a1, a2);
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
      sub_244549A1C();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_24454A19C((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_244549694(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

uint64_t sub_244549370(uint64_t a1, char a2)
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
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257370D98);
  v37 = a2;
  v6 = sub_2445684B0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
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
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_24454A19C(v25, (uint64_t)v38);
    }
    else
    {
      sub_24454A490((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_244568564();
    sub_244568204();
    result = sub_244568588();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_24454A19C(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_244549694(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2445683E4();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_244568564();
        swift_bridgeObjectRetain();
        sub_244568204();
        v11 = sub_244568588();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_24454987C(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_244549134(a2, a3);
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
        v19 = v18[7] + 40 * v12;
        __swift_destroy_boxed_opaque_existential_1(v19);
        return sub_24454A19C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_244549A1C();
      goto LABEL_7;
    }
    sub_244549370(v15, a4 & 1);
    v21 = sub_244549134(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2445499B0(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_244568528();
  __break(1u);
  return result;
}

uint64_t sub_2445499B0(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_24454A19C(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_244549A1C()
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
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257370D98);
  v2 = *v0;
  v3 = sub_2445684A4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
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
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_24454A490(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_24454A19C(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
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
LABEL_30:
  __break(1u);
  return result;
}

void sub_244549C04(uint64_t a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  void *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  char v34;
  char v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45[3];
  id v46;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_24454A510(a1 + 32, (uint64_t)&v43);
  v7 = v43;
  v8 = v44;
  v41 = v43;
  v42 = v44;
  sub_24454A19C(v45, (uint64_t)v40);
  v9 = (_QWORD *)*a3;
  v11 = sub_244549134(v7, v8);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_244549A1C();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v19 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v20 = (uint64_t *)(v19[6] + 16 * v11);
    *v20 = v7;
    v20[1] = v8;
    sub_24454A19C(v40, v19[7] + 40 * v11);
    v21 = v19[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v19[2] = v23;
    v24 = v4 - 1;
    if (!v24)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v25 = a1 + 88;
    while (1)
    {
      sub_24454A510(v25, (uint64_t)&v43);
      v26 = v43;
      v27 = v44;
      v41 = v43;
      v42 = v44;
      sub_24454A19C(v45, (uint64_t)v40);
      v28 = (_QWORD *)*a3;
      v29 = sub_244549134(v26, v27);
      v31 = v28[2];
      v32 = (v30 & 1) == 0;
      v22 = __OFADD__(v31, v32);
      v33 = v31 + v32;
      if (v22)
        break;
      v34 = v30;
      if (v28[3] < v33)
      {
        sub_244549370(v33, 1);
        v29 = sub_244549134(v26, v27);
        if ((v34 & 1) != (v35 & 1))
          goto LABEL_25;
      }
      if ((v34 & 1) != 0)
        goto LABEL_10;
      v36 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v29 >> 6) + 64) |= 1 << v29;
      v37 = (uint64_t *)(v36[6] + 16 * v29);
      *v37 = v26;
      v37[1] = v27;
      sub_24454A19C(v40, v36[7] + 40 * v29);
      v38 = v36[2];
      v22 = __OFADD__(v38, 1);
      v39 = v38 + 1;
      if (v22)
        goto LABEL_24;
      v36[2] = v39;
      v25 += 56;
      if (!--v24)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_244549370(v14, a2 & 1);
  v16 = sub_244549134(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v46 = v18;
    MEMORY[0x249511FD8](v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_244568528();
  __break(1u);
LABEL_26:
  sub_2445683FC();
  sub_24456821C();
  sub_244568474();
  sub_24456821C();
  sub_244568498();
  __break(1u);
}

uint64_t sub_244549FC8(uint64_t a1)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  _QWORD *i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_244552D38(0, v2, 0);
    v3 = v20;
    for (i = (_QWORD *)(a1 + 32); ; i += 5)
    {
      v6 = i[3];
      v7 = i[4];
      __swift_project_boxed_opaque_existential_1(i, v6);
      *(_QWORD *)&v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 32))(v6, v7);
      *((_QWORD *)&v16 + 1) = v8;
      v10 = i[3];
      v9 = i[4];
      v11 = __swift_project_boxed_opaque_existential_1(i, v10);
      SQLiteRow.get<A>(from:)((uint64_t)v11, v10, v9);
      if (v1)
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_244552D38(0, *(_QWORD *)(v20 + 16) + 1, 1);
      v13 = *(_QWORD *)(v20 + 16);
      v12 = *(_QWORD *)(v20 + 24);
      if (v13 >= v12 >> 1)
        sub_244552D38(v12 > 1, v13 + 1, 1);
      *(_QWORD *)(v20 + 16) = v13 + 1;
      v14 = v20 + 56 * v13;
      *(_QWORD *)(v14 + 80) = v19;
      *(_OWORD *)(v14 + 48) = v17;
      *(_OWORD *)(v14 + 64) = v18;
      *(_OWORD *)(v14 + 32) = v16;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249512050]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24454A19C(__int128 *a1, uint64_t a2)
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

uint64_t sub_24454A1B4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_244548E38(a1, a2, a3, *(__int128 **)(v3 + 16));
}

uint64_t sub_24454A1CC(uint64_t a1, void (*a2)(_QWORD, _QWORD, _OWORD *))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  int64_t v19;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;
  __int128 v23;
  _OWORD v24[2];
  uint64_t v25;
  void (*v26)(_QWORD, _QWORD, _OWORD *);

  v26 = a2;
  v18 = a1 + 64;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v19 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v9 = __clz(__rbit64(v6));
    v6 &= v6 - 1;
    v10 = v9 | (v8 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v13 = *v11;
    v12 = v11[1];
    sub_24454A490(*(_QWORD *)(a1 + 56) + 40 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    v20 = v23;
    v21[0] = v24[0];
    v21[1] = v24[1];
    v22 = v25;
    v14 = v23;
    swift_bridgeObjectRetain();
    v26(v14, *((_QWORD *)&v14 + 1), v21);
    result = sub_24454A4D4((uint64_t)&v20, &qword_257370DA0);
    if (v2)
      return swift_release();
  }
  if (__OFADD__(v8++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v8 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v8);
  if (v16)
  {
LABEL_19:
    v6 = (v16 - 1) & v16;
    v10 = __clz(__rbit64(v16)) + (v8 << 6);
    goto LABEL_5;
  }
  v17 = v8 + 1;
  if (v8 + 1 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 2;
  if (v8 + 2 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 3;
  if (v8 + 3 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
    goto LABEL_18;
  v17 = v8 + 4;
  if (v8 + 4 >= v19)
    return swift_release();
  v16 = *(_QWORD *)(v18 + 8 * v17);
  if (v16)
  {
LABEL_18:
    v8 = v17;
    goto LABEL_19;
  }
  while (1)
  {
    v8 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v8 >= v19)
      return swift_release();
    v16 = *(_QWORD *)(v18 + 8 * v8);
    ++v17;
    if (v16)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_24454A3E8(uint64_t a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24454A41C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_244549018(a1, a2, a3, *(__int128 **)(v3 + 16));
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24454A490(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24454A4D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24454A510(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x2495120E0);
  return result;
}

uint64_t sub_24454A58C()
{
  uint64_t v0;

  v0 = sub_244568180();
  __swift_allocate_value_buffer(v0, qword_257371260);
  __swift_project_value_buffer(v0, (uint64_t)qword_257371260);
  return sub_244568174();
}

uint64_t sub_24454A600()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteLogger()
{
  return objc_opt_self();
}

void SQLiteDataType.defaultNativeType.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_24454A664()
{
  return MEMORY[0x24BEE4008];
}

uint64_t sub_24454A67C()
{
  sub_24454721C();
  return MEMORY[0x24BDCDDE8];
}

uint64_t sub_24454A694()
{
  return MEMORY[0x24BEE13C8];
}

uint64_t sub_24454A6AC()
{
  return 0;
}

PoirotSQLite::SQLiteDataType_optional __swiftcall SQLiteDataType.init(rawValue:)(Swift::Int32 rawValue)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x40201030005uLL >> (8 * rawValue);
  if (rawValue >= 6)
    LOBYTE(v2) = 5;
  *v1 = v2;
  return (PoirotSQLite::SQLiteDataType_optional)rawValue;
}

uint64_t SQLiteDataType.rawValue.getter()
{
  char *v0;

  return dword_244569C1C[*v0];
}

BOOL sub_24454A6F8(char *a1, char *a2)
{
  return dword_244569C1C[*a1] == dword_244569C1C[*a2];
}

unint64_t sub_24454A720()
{
  unint64_t result;

  result = qword_257370DC0;
  if (!qword_257370DC0)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteDataType, &type metadata for SQLiteDataType);
    atomic_store(result, (unint64_t *)&qword_257370DC0);
  }
  return result;
}

uint64_t sub_24454A764()
{
  sub_244568564();
  sub_24456857C();
  return sub_244568588();
}

uint64_t sub_24454A7B0()
{
  return sub_24456857C();
}

uint64_t sub_24454A7E4()
{
  sub_244568564();
  sub_24456857C();
  return sub_244568588();
}

PoirotSQLite::SQLiteDataType_optional sub_24454A82C(Swift::Int32 *a1)
{
  return SQLiteDataType.init(rawValue:)(*a1);
}

void sub_24454A834(_DWORD *a1@<X8>)
{
  char *v1;

  *a1 = dword_244569C1C[*v1];
}

uint64_t getEnumTagSinglePayload for SQLiteDataType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SQLiteDataType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24454A928 + 4 * byte_244569B4E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24454A95C + 4 * byte_244569B49[v4]))();
}

uint64_t sub_24454A95C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24454A964(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24454A96CLL);
  return result;
}

uint64_t sub_24454A978(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24454A980);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24454A984(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24454A98C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDataType()
{
  return &type metadata for SQLiteDataType;
}

uint64_t SQLiteDatabase.makeCreateStatement(for:in:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X4>, uint64_t a6@<X8>)
{
  return sub_24454A9E0(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SQLiteSchemaDescribing.makeCreateStatementString(for:in:), a6);
}

uint64_t SQLiteDatabase.makeSelectStatement(for:in:with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X4>, uint64_t a6@<X8>)
{
  return sub_24454A9E0(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SQLiteSchemaDescribing.makeSelectStatementString(for:in:), a6);
}

uint64_t sub_24454A9E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X4>, uint64_t (*a6)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v15 = a5[3];
  v14 = a5[4];
  __swift_project_boxed_opaque_existential_1(a5, v15);
  result = a6(a1, a2, a3, a4, v15, v14);
  if (!v7)
  {
    sub_244553B18(result, v17, 0, a7);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t SQLiteDatabase.makeInsertStatement(for:in:with:values:returningRowId:replacingIfNeeded:)@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, _QWORD *a5@<X4>, uint64_t a6@<X5>, Swift::Bool a7@<W6>, Swift::Bool a8@<W7>, _OWORD *a9@<X8>)
{
  Swift::String v15;
  Swift::String_optional v16;
  uint64_t result;
  Swift::String v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v24;
  _OWORD v25[2];
  __int128 v26;
  _OWORD v27[2];

  __swift_project_boxed_opaque_existential_1(a5, a5[3]);
  v15._countAndFlagsBits = a1;
  v15._object = a2;
  v16.value._countAndFlagsBits = a3;
  v16.value._object = a4;
  v18 = SQLiteSchemaDescribing.makeInsertStatementString(for:in:returningRowId:replacingIfNeeded:)(v15, v16, a7, a8);
  result = v18._countAndFlagsBits;
  if (!v19)
  {
    sub_244553B18(v18._countAndFlagsBits, (uint64_t)v18._object, 0, (uint64_t)&v24);
    v20 = swift_bridgeObjectRelease();
    v26 = v24;
    v27[0] = v25[0];
    *(_OWORD *)((char *)v27 + 9) = *(_OWORD *)((char *)v25 + 9);
    MEMORY[0x24BDAC7A8](v20);
    result = sub_24454A1CC(a6, (void (*)(_QWORD, _QWORD, _OWORD *))sub_24454A1B4);
    v21 = v27[0];
    *a9 = v26;
    a9[1] = v21;
    *(_OWORD *)((char *)a9 + 25) = *(_OWORD *)((char *)v27 + 9);
  }
  return result;
}

uint64_t sub_24454ABFC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t SQLiteRow.get<A>(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  sqlite3_stmt *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  sqlite3_stmt *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = *v3;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  v27 = v7;
  v29 = v6;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  v10 = v9;
  v11 = *(_QWORD *)(v6 + 16);
  if (!v11 || !*(_QWORD *)(v11 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v18 = 4;
LABEL_8:
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)v17 = v18;
    *(_BYTE *)(v17 + 24) = 5;
    goto LABEL_9;
  }
  v12 = v8;
  v13 = *(sqlite3_stmt **)(v6 + 24);
  if (!v13)
  {
    sub_2445470A0();
    swift_allocError();
    v18 = 3;
    goto LABEL_8;
  }
  result = sqlite3_column_count(v13);
  if ((result & 0x80000000) == 0)
  {
    v28 = v10;
    v15 = (int)result;
    if ((_DWORD)result)
    {
      v16 = 0;
      while (v15 != v16)
      {
        v20 = *(_QWORD *)(v6 + 16);
        if (!v20 || !*(_QWORD *)(v20 + 16))
        {
          sub_2445470A0();
          swift_allocError();
          v26 = 4;
LABEL_25:
          *(_QWORD *)(v25 + 8) = 0;
          *(_QWORD *)(v25 + 16) = 0;
          *(_QWORD *)v25 = v26;
          *(_BYTE *)(v25 + 24) = 5;
          goto LABEL_9;
        }
        v21 = *(sqlite3_stmt **)(v6 + 24);
        if (!v21)
        {
          sub_2445470A0();
          swift_allocError();
          v26 = 3;
          goto LABEL_25;
        }
        result = (uint64_t)sqlite3_column_name(v21, v16);
        if (result)
        {
          if (v12 == sub_244568228() && v28 == v22)
          {
            swift_bridgeObjectRelease();
LABEL_20:
            swift_bridgeObjectRelease();
            v23 = SQLiteColumnDescribing.nullable.getter(a2, a3);
            return (*(uint64_t (**)(uint64_t *, uint64_t, _QWORD))(v27 + 56))(&v29, v16, v23 & 1);
          }
          v19 = sub_244568510();
          result = swift_bridgeObjectRelease();
          if ((v19 & 1) != 0)
            goto LABEL_20;
        }
        if (v15 == ++v16)
          goto LABEL_22;
      }
      __break(1u);
      goto LABEL_27;
    }
LABEL_22:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v24 = v12;
    *(_QWORD *)(v24 + 8) = v28;
    *(_QWORD *)(v24 + 16) = 0;
    *(_BYTE *)(v24 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
LABEL_27:
  __break(1u);
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> String.ensureValidSQLNameCharacters()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  uint64_t v10;
  _QWORD v11[2];

  v2 = v1;
  v3 = v0;
  v4 = sub_2445680F0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = v3;
  v11[1] = v2;
  if (qword_257370D08 != -1)
    swift_once();
  __swift_project_value_buffer(v4, (uint64_t)qword_257371248);
  sub_2445680E4();
  sub_244548248();
  sub_24456839C();
  v9 = v8;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v9 & 1) == 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v10 + 8) = 0;
    *(_QWORD *)(v10 + 16) = 0;
    *(_QWORD *)v10 = 10;
    *(_BYTE *)(v10 + 24) = 5;
    swift_willThrow();
  }
}

uint64_t sub_24454B014()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  v1 = sub_2445680F0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0[1];
  v10[0] = *v0;
  v10[1] = v5;
  if (qword_257370D08 != -1)
    swift_once();
  __swift_project_value_buffer(v1, (uint64_t)qword_257371248);
  sub_2445680E4();
  sub_244548248();
  sub_24456839C();
  v7 = v6;
  result = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  if ((v7 & 1) == 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v9 + 8) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    *(_QWORD *)v9 = 10;
    *(_BYTE *)(v9 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

uint64_t dispatch thunk of SQLiteNamesValidating.ensureValidSQLNameCharacters()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

BOOL UDFColumnSchema.visible.getter(uint64_t a1, uint64_t a2)
{
  return ((*(uint64_t (**)(void))(a2 + 16))() & 1) == 0;
}

uint64_t UDFColumnSchema<>.columnName.getter()
{
  uint64_t v1;

  sub_2445682A0();
  return v1;
}

uint64_t static UDFCaseIterableColumnSchema.allHidden.getter()
{
  return sub_24454B240();
}

uint64_t sub_24454B1D4@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(a2 + a1 - 8) + 8) + 16))(*(_QWORD *)(a2 + a1 - 16));
  *a3 = result & 1;
  return result;
}

uint64_t sub_24454B214()
{
  return 16;
}

__n128 sub_24454B220(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t static UDFCaseIterableColumnSchema.allVisible.getter()
{
  return sub_24454B240();
}

uint64_t sub_24454B240()
{
  uint64_t v0;
  uint64_t v1;

  sub_244568414();
  swift_getKeyPath();
  v0 = sub_2445682E8();
  MEMORY[0x249512068](MEMORY[0x24BEE12F0], v0);
  v1 = sub_24456842C();
  swift_release();
  return v1;
}

BOOL sub_24454B2F8@<W0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _BYTE *a3@<X8>)
{
  _BOOL8 result;

  result = UDFColumnSchema.visible.getter(*(_QWORD *)(a2 + a1 - 16), *(_QWORD *)(*(_QWORD *)(a2 + a1 - 8) + 8));
  *a3 = result;
  return result;
}

uint64_t sub_24454B330()
{
  return 16;
}

__n128 sub_24454B33C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_24454B348()
{
  unsigned __int8 v1;

  swift_getAtKeyPath();
  return v1;
}

uint64_t sub_24454B378()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t SQLiteTableUDF.__allocating_init(style:)(char *a1)
{
  char v3;

  swift_allocObject();
  v3 = *a1;
  return SQLiteVTab.init(style:)(&v3);
}

uint64_t SQLiteTableUDF.init(style:)(char *a1)
{
  char v2;

  v2 = *a1;
  return SQLiteVTab.init(style:)(&v2);
}

uint64_t SQLiteTableUDF.__deallocating_deinit()
{
  SQLiteVTab.deinit();
  return swift_deallocClassInstance();
}

uint64_t static SQLiteTableUDF.getTable(forConnection:)()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    result = swift_dynamicCastClass();
    if (result)
      return result;
    swift_release();
  }
  sub_24454BC24();
  swift_allocError();
  *(_DWORD *)v1 = 0;
  *(_BYTE *)(v1 + 4) = 1;
  return swift_willThrow();
}

uint64_t static SQLiteTableUDF.getConnection(forCursor:)()
{
  uint64_t result;
  uint64_t v1;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getAssociatedTypeWitness();
    result = swift_dynamicCastClass();
    if (result)
      return result;
    swift_release();
  }
  sub_24454BC24();
  swift_allocError();
  *(_DWORD *)v1 = 1;
  *(_BYTE *)(v1 + 4) = 1;
  return swift_willThrow();
}

uint64_t static SQLiteTableUDF.getTable(forCursor:)()
{
  uint64_t v0;
  uint64_t v1;

  static SQLiteTableUDF.getConnection(forCursor:)();
  if (!v1)
  {
    v0 = static SQLiteTableUDF.getTable(forConnection:)();
    swift_release();
  }
  return v0;
}

uint64_t sub_24454B5C8()
{
  sub_24454BE5C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24454B5DC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 40) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24454B620(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  v3 = sub_2445682E8();
  MEMORY[0x249512068](MEMORY[0x24BEE12E0], v3);
  if ((sub_244568324() & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_beginAccess();
    *(_QWORD *)(v1 + 40) = a1;
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = sub_244568498();
    __break(1u);
  }
  return result;
}

void sub_24454B730()
{
  sub_244568498();
  __break(1u);
}

uint64_t sub_24454B788()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t sub_24454B7A8()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t v14;

  v2 = v0;
  v3 = *v0;
  swift_beginAccess();
  v14 = v2[5];
  v5 = *(_QWORD *)(v3 + 176);
  v4 = *(_QWORD *)(v3 + 184);
  swift_getAssociatedTypeWitness();
  v6 = sub_2445682E8();
  v7 = MEMORY[0x249512068](MEMORY[0x24BEE12E0], v6);
  if ((sub_244568324() & 1) == 0 || (v8 = (uint64_t)v2, (*(void (**)(void))(*v2 + 232))(), !v1))
  {
    swift_beginAccess();
    v13 = v2[5];
    MEMORY[0x24BDAC7A8](v13);
    v12[2] = v5;
    v12[3] = v4;
    swift_bridgeObjectRetain();
    v10 = sub_244550C3C((void (*)(char *, char *))sub_24454C164, (uint64_t)v12, v6, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v7, MEMORY[0x24BEE40A8], v9);
    swift_bridgeObjectRelease();
    v13 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370FD0);
    sub_24454C180();
    v8 = sub_24456818C();
    swift_bridgeObjectRelease();
  }
  return v8;
}

uint64_t sub_24454B960@<X0>(_QWORD *a1@<X8>)
{
  uint64_t AssociatedConformanceWitness;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v3 = *(_QWORD *)(AssociatedConformanceWitness + 8);
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 32);
  v5 = swift_checkMetadataState();
  v4(v5, v3);
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v5, v3);
  (*(void (**)(uint64_t *__return_ptr))(v6 + 24))(&v8);
  sub_244568474();
  (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v5, AssociatedConformanceWitness);
  sub_24456821C();
  result = swift_bridgeObjectRelease();
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  return result;
}

uint64_t SQLiteTableUDF.BaseConnection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  swift_allocObject();
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;

  swift_getAssociatedTypeWitness();
  swift_retain();
  *(_QWORD *)(v3 + 40) = sub_2445682B8();
  swift_release();
  return SQLiteVTab.Connection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t sub_24454BBD0()
{
  return swift_bridgeObjectRelease();
}

uint64_t SQLiteTableUDF.BaseConnection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SQLiteTableUDF.BaseConnection.__deallocating_deinit()
{
  SQLiteTableUDF.BaseConnection.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_24454BC24()
{
  unint64_t result;

  result = qword_257370DC8[0];
  if (!qword_257370DC8[0])
  {
    result = MEMORY[0x249512068](&unk_244569E24, &type metadata for SQLiteTableUDFError);
    atomic_store(result, qword_257370DC8);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteTableUDF.CaseIterableColumnSchemaConnection.configureColumns()()
{
  uint64_t v0;

  swift_getAssociatedTypeWitness();
  sub_244568414();
  sub_24454B620(v0);
  swift_bridgeObjectRelease();
}

uint64_t SQLiteTableUDF.CaseIterableColumnSchemaConnection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  swift_allocObject();
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t SQLiteTableUDF.CaseIterableColumnSchemaConnection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  return SQLiteTableUDF.BaseConnection.init(_:argc:argv:)(a1, a2, a3);
}

uint64_t SQLiteTableUDF.CaseIterableColumnSchemaConnection.__deallocating_deinit()
{
  SQLiteTableUDF.BaseConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t SQLiteTableUDF.BaseCursor.__allocating_init(_:)()
{
  uint64_t v0;

  swift_allocObject();
  v0 = sub_24454BE8C();
  swift_release();
  return v0;
}

uint64_t SQLiteTableUDF.BaseCursor.init(_:)()
{
  uint64_t v0;

  v0 = sub_24454BE8C();
  swift_release();
  return v0;
}

uint64_t SQLiteTableUDF.BaseCursor.deinit()
{
  uint64_t v0;

  swift_weakDestroy();
  return v0;
}

uint64_t SQLiteTableUDF.BaseCursor.__deallocating_deinit()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_24454BE5C()
{
  uint64_t v0;

  swift_beginAccess();
  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_24454BE8C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  swift_weakInit();
  swift_beginAccess();
  swift_weakAssign();
  return v0;
}

uint64_t sub_24454BEF4@<X0>(uint64_t *a1@<X8>)
{
  *a1 = sub_24454BE5C();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24454BF1C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_24454B5DC(v0);
}

uint64_t sub_24454BF44()
{
  return 16;
}

__n128 sub_24454BF50(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of UDFColumnSchema.hidden.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24454BF68()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SQLiteTableUDF);
}

uint64_t sub_24454BFA8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.BaseConnection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SQLiteTableUDF.BaseConnection);
}

uint64_t method lookup function for SQLiteTableUDF.BaseConnection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.allColumns.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.setTableSchema(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SQLiteTableUDF.BaseConnection.configureColumns()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t sub_24454C038()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.CaseIterableColumnSchemaConnection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SQLiteTableUDF.CaseIterableColumnSchemaConnection);
}

uint64_t sub_24454C078()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SQLiteTableUDF.BaseCursor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SQLiteTableUDF.BaseCursor);
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteTableUDFError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SQLiteTableUDFError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_24454C118(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24454C134(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteTableUDFError()
{
  return &type metadata for SQLiteTableUDFError;
}

uint64_t sub_24454C164@<X0>(_QWORD *a1@<X8>)
{
  return sub_24454B960(a1);
}

unint64_t sub_24454C180()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257370FD8[0];
  if (!qword_257370FD8[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257370FD0);
    result = MEMORY[0x249512068](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, qword_257370FD8);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249512020](a1, v6, a5);
}

uint64_t sub_24454C1F8()
{
  return sub_24454B348() & 1;
}

uint64_t SQLiteArgument.argument.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SQLiteArgument.init(_:)@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  if (result)
  {
    *a2 = result;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_OWORD *)v2 = xmmword_244569E70;
    *(_QWORD *)(v2 + 16) = 0;
    *(_BYTE *)(v2 + 24) = 4;
    return swift_willThrow();
  }
  return result;
}

uint64_t SQLiteArgument.subtype.getter()
{
  sqlite3_value **v0;

  return sqlite3_value_subtype(*v0);
}

BOOL SQLiteArgument.isNull.getter()
{
  sqlite3_value **v0;

  return sqlite3_value_type(*v0) == 5;
}

uint64_t SQLiteArgument.type.getter()
{
  sqlite3_value **v0;

  return sqlite3_value_type(*v0);
}

BOOL SQLiteArgument.isText.getter()
{
  sqlite3_value **v0;

  return sqlite3_value_type(*v0) == 3;
}

BOOL SQLiteArgument.isBlob.getter()
{
  sqlite3_value **v0;
  sqlite3_value *v1;

  v1 = *v0;
  return sqlite3_value_type(*v0) == 4 || sqlite3_value_type(v1) == 3;
}

BOOL SQLiteArgument.isInteger.getter()
{
  sqlite3_value **v0;

  return sqlite3_value_type(*v0) == 1;
}

BOOL SQLiteArgument.isFloatingPoint.getter()
{
  sqlite3_value **v0;
  sqlite3_value *v1;

  v1 = *v0;
  return sqlite3_value_type(*v0) == 2 || sqlite3_value_type(v1) == 1;
}

Swift::Int32 __swiftcall SQLiteArgument.getInt32()()
{
  sqlite3_value **v0;

  return sqlite3_value_int(*v0);
}

Swift::Int64 __swiftcall SQLiteArgument.getInt64()()
{
  sqlite3_value **v0;

  return sqlite3_value_int64(*v0);
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt()()
{
  sqlite3_value **v0;

  return sqlite3_value_int64(*v0);
}

Swift::UInt __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt()()
{
  return sub_24454C678();
}

Swift::Int8 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt8()()
{
  sqlite3_value **v0;
  int v1;
  uint64_t v2;

  v1 = sqlite3_value_int(*v0);
  if (v1 >= -128)
  {
    if (v1 > 127)
      __break(1u);
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    LOBYTE(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt8 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt8()()
{
  sqlite3_value **v0;
  unsigned int v1;
  uint64_t v2;

  v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0)
    goto LABEL_4;
  if (v1 >= 0x100)
  {
    sub_24456848C();
    __break(1u);
LABEL_4:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    LOBYTE(v1) = swift_willThrow();
  }
  return v1;
}

Swift::Int16 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getInt16()()
{
  sqlite3_value **v0;
  int v1;
  uint64_t v2;

  v1 = sqlite3_value_int(*v0);
  if (v1 >= -32768)
  {
    if (v1 >= 0x8000)
      __break(1u);
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    LOWORD(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt16 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt16()()
{
  sqlite3_value **v0;
  unsigned int v1;
  uint64_t v2;

  v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0)
    goto LABEL_4;
  if (HIWORD(v1))
  {
    __break(1u);
LABEL_4:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    LOWORD(v1) = swift_willThrow();
  }
  return v1;
}

Swift::UInt32 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt32()()
{
  sqlite3_value **v0;
  Swift::UInt32 v1;
  uint64_t v2;

  v1 = sqlite3_value_int(*v0);
  if ((v1 & 0x80000000) != 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    swift_willThrow();
  }
  return v1;
}

Swift::UInt64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getUInt64()()
{
  return sub_24454C678();
}

sqlite3_int64 sub_24454C678()
{
  sqlite3_value **v0;
  sqlite3_int64 v1;
  uint64_t v2;

  v1 = sqlite3_value_int64(*v0);
  if (v1 < 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    swift_willThrow();
  }
  return v1;
}

Swift::Bool __swiftcall SQLiteArgument.getBool()()
{
  sqlite3_value **v0;

  return sqlite3_value_int(*v0) != 0;
}

Swift::Float __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getFloat()()
{
  sqlite3_value **v0;
  double v1;
  Swift::Float result;
  uint64_t v4;

  v1 = sqlite3_value_double(*v0);
  if (v1 < 3.40282347e38 || v1 > -3.40282347e38)
    return v1;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_QWORD *)v4 = 8;
  *(_BYTE *)(v4 + 24) = 5;
  swift_willThrow();
  return result;
}

Swift::Double __swiftcall SQLiteArgument.getDouble()()
{
  sqlite3_value **v0;

  return sqlite3_value_double(*v0);
}

uint64_t SQLiteArgument.withUnsafeBytes<A>(_:)(uint64_t (*a1)(const void *, uint64_t))
{
  sqlite3_value **v1;
  sqlite3_value *v3;
  const void *v4;
  const void *v5;
  uint64_t v6;

  v3 = *v1;
  v4 = sqlite3_value_blob(*v1);
  if (v4)
  {
    v5 = v4;
    v6 = sqlite3_value_bytes(v3);
    v4 = v5;
  }
  else
  {
    v6 = 0;
  }
  return a1(v4, v6);
}

uint64_t SQLiteArgument.getData()()
{
  sqlite3_value **v0;
  sqlite3_value *v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;

  v1 = *v0;
  v2 = sqlite3_value_blob(*v0);
  if (v2)
  {
    v3 = v2;
    v4 = sqlite3_value_bytes(v1);
    return sub_24454CC94(v3, v4);
  }
  else
  {
    sqlite3_value_type(v1);
    return 0;
  }
}

uint64_t SQLiteArgument.getDataNonNull()()
{
  sqlite3_value **v0;
  sqlite3_value *v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;
  uint64_t v6;

  v1 = *v0;
  v2 = sqlite3_value_blob(v1);
  if (v2)
  {
    v3 = v2;
    v4 = sqlite3_value_bytes(v1);
    return sub_24454CC94(v3, v4);
  }
  else if (sqlite3_value_type(v1) == 5)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 6;
    *(_BYTE *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  else
  {
    return 0;
  }
}

Swift::String_optional __swiftcall SQLiteArgument.getString()()
{
  sqlite3_value **v0;
  uint64_t v1;
  void *v2;
  Swift::String_optional result;

  v1 = (uint64_t)sqlite3_value_text(*v0);
  if (v1)
    v1 = sub_244568234();
  else
    v2 = 0;
  result.value._object = v2;
  result.value._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteArgument.getStringNonNull()()
{
  sqlite3_value **v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  Swift::String result;

  if (sqlite3_value_text(*v0))
  {
    v1 = sub_244568234();
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v3 + 8) = 0;
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)v3 = 6;
    *(_BYTE *)(v3 + 24) = 5;
    v1 = swift_willThrow();
  }
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

uint64_t SQLiteArgument.getBase64EncodedData()()
{
  sqlite3_value **v0;
  sqlite3_value *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *v0;
  if (sqlite3_value_type(*v0) != 4 && sqlite3_value_type(v1) != 3)
    return 0;
  if (!sqlite3_value_text(v1))
    return 0;
  sub_244568234();
  v2 = sub_244568150();
  v4 = v3;
  swift_bridgeObjectRelease();
  if (v4 >> 60 == 15)
    return 0;
  return v2;
}

uint64_t Array<A>.init(_:argc:)(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (!a1)
  {
    sub_2445470A0();
    swift_allocError();
    *(_OWORD *)v8 = xmmword_244569E80;
    *(_QWORD *)(v8 + 16) = 0;
    *(_BYTE *)(v8 + 24) = 4;
    swift_willThrow();
    return v2;
  }
  if ((a2 & 0x80000000) == 0)
  {
    v3 = a2;
    if (a2)
    {
      v5 = sub_2445682C4();
      v2 = v5;
      v6 = 0;
      *(_QWORD *)(v5 + 16) = v3;
      while (v3 != v6)
      {
        v7 = *(_QWORD *)(a1 + 8 * v6);
        if (!v7)
        {
          sub_2445470A0();
          swift_allocError();
          *(_OWORD *)v9 = xmmword_244569E70;
          *(_QWORD *)(v9 + 16) = 0;
          *(_BYTE *)(v9 + 24) = 4;
          swift_willThrow();
          *(_QWORD *)(v2 + 16) = 0;
          swift_bridgeObjectRelease();
          return v2;
        }
        *(_QWORD *)(v5 + 8 * v6++ + 32) = v7;
        if (v3 == v6)
          goto LABEL_11;
      }
      __break(1u);
      goto LABEL_15;
    }
    v2 = MEMORY[0x24BEE4AF8];
LABEL_11:
    *(_QWORD *)(v2 + 16) = v3;
    return v2;
  }
LABEL_15:
  result = sub_24456848C();
  __break(1u);
  return result;
}

uint64_t sub_24454CBD4(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
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

uint64_t sub_24454CC94(_BYTE *__src, uint64_t a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  if (a2 <= 14)
    return sub_24454CBD4(__src, &__src[a2]);
  sub_24456812C();
  swift_allocObject();
  sub_2445680FC();
  if ((unint64_t)a2 < 0x7FFFFFFF)
    return a2 << 32;
  sub_24456815C();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SQLiteArgument(uint64_t a1, int a2)
{
  int v3;

  if (!a2)
    return 0;
  if (a2 != 1 && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 2);
  if (*(_QWORD *)a1)
    v3 = -1;
  else
    v3 = 0;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteArgument(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteArgument()
{
  return &type metadata for SQLiteArgument;
}

uint64_t dispatch thunk of SQLiteUDF.register(_:database:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.type(at:)(Swift::Int at)
{
  _BYTE *v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  sqlite3_stmt *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    v9 = 5;
LABEL_10:
    *(_BYTE *)(v7 + 24) = v9;
    LOBYTE(v6) = swift_willThrow();
    return (char)v6;
  }
  v6 = *(sqlite3_stmt **)(*(_QWORD *)v2 + 24);
  if (!v6)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (at < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (at > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return (char)v6;
  }
  LODWORD(v6) = sqlite3_column_type(v6, at);
  if (((_DWORD)v6 - 1) >= 5)
  {
    sub_2445683FC();
    swift_bridgeObjectRelease();
    sub_2445684E0();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000013;
    *(_QWORD *)(v7 + 8) = 0x8000000244568E50;
    *(_QWORD *)(v7 + 16) = 0;
    v9 = 4;
    goto LABEL_10;
  }
  *v3 = 0x402010300uLL >> (8 * (v6 - 1));
  return (char)v6;
}

uint64_t SQLiteRow.get<A>(at:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24454D758(a1, a2, a3, a4);
}

{
  return sub_24454D758(a1, a2, a3, a4);
}

uint64_t SQLiteRow.getNonNull<A>(at:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v19 = a4;
  v9 = sub_244568378();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - v11;
  v20 = *v4;
  v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a3 + 16);
  swift_retain();
  result = v13(&v20, a1, a2, a3);
  if (!v5)
  {
    v15 = v19;
    v16 = *(_QWORD *)(a2 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v12, 1, a2) == 1)
    {
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v17 + 8) = 0;
      *(_QWORD *)(v17 + 16) = 0;
      *(_QWORD *)v17 = 6;
      *(_BYTE *)(v17 + 24) = 5;
      return swift_willThrow();
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v15, v12, a2);
    }
  }
  return result;
}

uint64_t SQLiteRow.forEachColumn(_:)(void (*a1)(uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  sqlite3_stmt *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3_stmt *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
LABEL_16:
    sub_2445470A0();
    swift_allocError();
    v15 = 4;
LABEL_18:
    *(_QWORD *)v14 = v15;
    *(_QWORD *)(v14 + 8) = 0;
    *(_QWORD *)(v14 + 16) = 0;
    *(_BYTE *)(v14 + 24) = 5;
    return swift_willThrow();
  }
  v6 = *(sqlite3_stmt **)(v3 + 24);
  if (!v6)
  {
LABEL_17:
    sub_2445470A0();
    swift_allocError();
    v15 = 3;
    goto LABEL_18;
  }
  result = sqlite3_column_count(v6);
  if ((result & 0x80000000) != 0)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  v8 = (int)result;
  if ((_DWORD)result)
  {
    v9 = 0;
    while (v8 != v9)
    {
      v10 = *(_QWORD *)(v3 + 16);
      if (!v10 || !*(_QWORD *)(v10 + 16))
        goto LABEL_16;
      v11 = *(sqlite3_stmt **)(v3 + 24);
      if (!v11)
        goto LABEL_17;
      result = (uint64_t)sqlite3_column_name(v11, v9);
      if (result)
      {
        v12 = sub_244568228();
        a1(v9, v12, v13);
        if (v2)
          return swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
      }
      if (v8 == ++v9)
        return result;
    }
    __break(1u);
    goto LABEL_21;
  }
  return result;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.columnIndex(for:)(Swift::String a1)
{
  uint64_t *v1;
  Swift::Int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t countAndFlagsBits;
  void *object;
  Swift::Int result;
  uint64_t v8;
  char v9;
  uint64_t v10;
  sqlite3_stmt *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
LABEL_17:
    sub_2445470A0();
    swift_allocError();
    v14 = 4;
LABEL_19:
    *(_QWORD *)(v13 + 8) = 0;
    *(_QWORD *)(v13 + 16) = 0;
    *(_QWORD *)v13 = v14;
    *(_BYTE *)(v13 + 24) = 5;
    goto LABEL_20;
  }
  countAndFlagsBits = a1._countAndFlagsBits;
  a1._countAndFlagsBits = *(_QWORD *)(v3 + 24);
  if (!a1._countAndFlagsBits)
  {
LABEL_18:
    sub_2445470A0();
    swift_allocError();
    v14 = 3;
    goto LABEL_19;
  }
  object = a1._object;
  result = sqlite3_column_count((sqlite3_stmt *)a1._countAndFlagsBits);
  if ((result & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  v8 = (int)result;
  if ((_DWORD)result)
  {
    v2 = 0;
    while (v8 != v2)
    {
      v10 = *(_QWORD *)(v3 + 16);
      if (!v10 || !*(_QWORD *)(v10 + 16))
        goto LABEL_17;
      v11 = *(sqlite3_stmt **)(v3 + 24);
      if (!v11)
        goto LABEL_18;
      result = (Swift::Int)sqlite3_column_name(v11, v2);
      if (result)
      {
        if (sub_244568228() == countAndFlagsBits && v12 == object)
        {
          swift_bridgeObjectRelease();
          return v2;
        }
        v9 = sub_244568510();
        result = swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return v2;
      }
      if (v8 == ++v2)
        goto LABEL_22;
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_22:
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v15 = countAndFlagsBits;
  *(_QWORD *)(v15 + 8) = object;
  *(_QWORD *)(v15 + 16) = 0;
  *(_BYTE *)(v15 + 24) = 1;
  swift_bridgeObjectRetain();
LABEL_20:
  swift_willThrow();
  return v2;
}

Swift::Int __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.getColumnCount()()
{
  uint64_t v0;
  uint64_t v1;
  sqlite3_stmt *v2;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1 && *(_QWORD *)(v1 + 16))
  {
    v2 = *(sqlite3_stmt **)(*(_QWORD *)v0 + 24);
    if (v2)
      return sqlite3_column_count(v2);
    sub_2445470A0();
    swift_allocError();
    v5 = 3;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    v5 = 4;
  }
  *(_QWORD *)v4 = v5;
  *(_QWORD *)(v4 + 8) = 0;
  *(_QWORD *)(v4 + 16) = 0;
  *(_BYTE *)(v4 + 24) = 5;
  return swift_willThrow();
}

Swift::String_optional __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.columnName(for:)(Swift::Int a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v3;
  sqlite3_stmt *v4;
  uint64_t v5;
  uint64_t v6;
  Swift::String_optional result;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 4;
LABEL_9:
    *(_QWORD *)v5 = v6;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
    *(_BYTE *)(v5 + 24) = 5;
    v4 = (sqlite3_stmt *)swift_willThrow();
    goto LABEL_14;
  }
  v3 = a1;
  v4 = *(sqlite3_stmt **)(*(_QWORD *)v1 + 24);
  if (!v4)
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 3;
    goto LABEL_9;
  }
  if (v3 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (v3 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v4 = (sqlite3_stmt *)sqlite3_column_name(v4, v3);
  if (v4)
    v4 = (sqlite3_stmt *)sub_244568228();
  else
    v3 = 0;
LABEL_14:
  result.value._object = (void *)v3;
  result.value._countAndFlagsBits = (uint64_t)v4;
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteRow.type(for:)(Swift::String a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t countAndFlagsBits;
  void *object;
  const char *v6;
  uint64_t v7;
  Swift::Int v8;
  char v9;
  uint64_t v10;
  sqlite3_stmt *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
LABEL_18:
    sub_2445470A0();
    swift_allocError();
    v14 = 4;
LABEL_20:
    *(_QWORD *)(v13 + 8) = 0;
    *(_QWORD *)(v13 + 16) = 0;
    *(_QWORD *)v13 = v14;
    *(_BYTE *)(v13 + 24) = 5;
    goto LABEL_21;
  }
  countAndFlagsBits = a1._countAndFlagsBits;
  a1._countAndFlagsBits = *(_QWORD *)(v2 + 24);
  if (!a1._countAndFlagsBits)
  {
LABEL_19:
    sub_2445470A0();
    swift_allocError();
    v14 = 3;
    goto LABEL_20;
  }
  object = a1._object;
  LODWORD(v6) = sqlite3_column_count((sqlite3_stmt *)a1._countAndFlagsBits);
  if ((v6 & 0x80000000) != 0)
  {
LABEL_24:
    __break(1u);
    return (char)v6;
  }
  v7 = (int)v6;
  if ((_DWORD)v6)
  {
    v8 = 0;
    while (v7 != v8)
    {
      v10 = *(_QWORD *)(v2 + 16);
      if (!v10 || !*(_QWORD *)(v10 + 16))
        goto LABEL_18;
      v11 = *(sqlite3_stmt **)(v2 + 24);
      if (!v11)
        goto LABEL_19;
      v6 = sqlite3_column_name(v11, v8);
      if (v6)
      {
        if (sub_244568228() == countAndFlagsBits && v12 == object)
        {
          swift_bridgeObjectRelease();
LABEL_17:
          LOBYTE(v6) = SQLiteRow.type(at:)(v8);
          return (char)v6;
        }
        v9 = sub_244568510();
        LOBYTE(v6) = swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          goto LABEL_17;
      }
      if (v7 == ++v8)
        goto LABEL_22;
    }
    __break(1u);
    goto LABEL_24;
  }
LABEL_22:
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v15 = countAndFlagsBits;
  *(_QWORD *)(v15 + 8) = object;
  *(_QWORD *)(v15 + 16) = 0;
  *(_BYTE *)(v15 + 24) = 1;
  swift_bridgeObjectRetain();
LABEL_21:
  LOBYTE(v6) = swift_willThrow();
  return (char)v6;
}

uint64_t sub_24454D758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t (*v8)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v10 = *v4;
  v8 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a4 + 16);
  swift_retain();
  return v8(&v10, a1, a3, a4);
}

uint64_t SQLiteRow.get<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24454D7EC(a1, a2, a3, a4, a5);
}

{
  return sub_24454D7EC(a1, a2, a3, a4, a5);
}

uint64_t sub_24454D7EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  sqlite3_stmt *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = *v5;
  v7 = *(_QWORD *)(*v5 + 16);
  if (!v7 || !*(_QWORD *)(v7 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v17 = 4;
LABEL_8:
    *(_QWORD *)(v16 + 8) = 0;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)v16 = v17;
    *(_BYTE *)(v16 + 24) = 5;
    swift_retain();
    goto LABEL_9;
  }
  v8 = *(sqlite3_stmt **)(v6 + 24);
  if (!v8)
  {
    sub_2445470A0();
    swift_allocError();
    v17 = 3;
    goto LABEL_8;
  }
  swift_retain();
  result = sqlite3_column_count(v8);
  if ((result & 0x80000000) == 0)
  {
    v25 = a5;
    v14 = (int)result;
    if ((_DWORD)result)
    {
      v15 = 0;
      while (v14 != v15)
      {
        v19 = *(_QWORD *)(v6 + 16);
        if (!v19 || !*(_QWORD *)(v19 + 16))
        {
          sub_2445470A0();
          swift_allocError();
          v24 = 4;
LABEL_25:
          *(_QWORD *)(v23 + 8) = 0;
          *(_QWORD *)(v23 + 16) = 0;
          *(_QWORD *)v23 = v24;
          *(_BYTE *)(v23 + 24) = 5;
          goto LABEL_9;
        }
        v20 = *(sqlite3_stmt **)(v6 + 24);
        if (!v20)
        {
          sub_2445470A0();
          swift_allocError();
          v24 = 3;
          goto LABEL_25;
        }
        result = (uint64_t)sqlite3_column_name(v20, v15);
        if (result)
        {
          if (sub_244568228() == a1 && v21 == a2)
          {
            swift_bridgeObjectRelease();
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
          }
          v18 = sub_244568510();
          result = swift_bridgeObjectRelease();
          if ((v18 & 1) != 0)
            return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v25 + 16))(&v26, v15, a4);
        }
        if (v14 == ++v15)
          goto LABEL_22;
      }
      __break(1u);
      goto LABEL_27;
    }
LABEL_22:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v22 = a1;
    *(_QWORD *)(v22 + 8) = a2;
    *(_QWORD *)(v22 + 16) = 0;
    *(_BYTE *)(v22 + 24) = 1;
    swift_bridgeObjectRetain();
LABEL_9:
    swift_willThrow();
    return swift_release();
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t SQLiteRow.getNonNull<A>(at:type:)(Swift::Int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t *, Swift::Int, uint64_t, uint64_t);
  char v13;
  uint64_t v14;

  v8 = *v4;
  v14 = *v4;
  result = SQLiteRow.type(at:)(a1);
  if (!v10)
  {
    if (v13 == 4)
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)v11 = 6;
      *(_BYTE *)(v11 + 24) = 5;
      return swift_willThrow();
    }
    else
    {
      v14 = v8;
      v12 = *(uint64_t (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a4 + 16);
      swift_retain();
      return v12(&v14, a1, a3, a4);
    }
  }
  return result;
}

uint64_t SQLiteRow.getNonNull<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24454DC64(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNonNull<A>(at:type:));
}

{
  return sub_24454DC64(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNonNull<A>(at:type:));
}

uint64_t SQLiteRow.getNullable<A>(at:type:)@<X0>(Swift::Int a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  void (*v12)(uint64_t *, Swift::Int, uint64_t, uint64_t);
  uint64_t v13;
  char v14;

  v9 = *v4;
  v13 = *v4;
  result = SQLiteRow.type(at:)(a1);
  if (!v11)
  {
    if (v14 == 4)
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 1, 1, a2);
    }
    else
    {
      v13 = v9;
      v12 = *(void (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a3 + 16);
      swift_retain();
      v12(&v13, a1, a2, a3);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 56))(a4, 0, 1, a2);
    }
  }
  return result;
}

uint64_t SQLiteRow.getNullable<A>(from:type:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_24454DC64(a1, a2, a3, a4, a5, (uint64_t (*)(uint64_t))SQLiteRow.getNullable<A>(at:type:));
}

uint64_t sub_24454DC64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t))
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  sqlite3_stmt *v10;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  sqlite3_stmt *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);

  v7 = *v6;
  v8 = *(_QWORD *)(*v6 + 16);
  if (!v8 || !*(_QWORD *)(v8 + 16))
  {
LABEL_18:
    sub_2445470A0();
    swift_allocError();
    v21 = 4;
LABEL_20:
    *(_QWORD *)(v20 + 8) = 0;
    *(_QWORD *)(v20 + 16) = 0;
    *(_QWORD *)v20 = v21;
    *(_BYTE *)(v20 + 24) = 5;
    return swift_willThrow();
  }
  v10 = *(sqlite3_stmt **)(v7 + 24);
  if (!v10)
  {
LABEL_19:
    sub_2445470A0();
    swift_allocError();
    v21 = 3;
    goto LABEL_20;
  }
  result = sqlite3_column_count(v10);
  if ((result & 0x80000000) == 0)
  {
    v23 = a6;
    v14 = (int)result;
    if ((_DWORD)result)
    {
      v15 = 0;
      while (v14 != v15)
      {
        v17 = *(_QWORD *)(v7 + 16);
        if (!v17 || !*(_QWORD *)(v17 + 16))
          goto LABEL_18;
        v18 = *(sqlite3_stmt **)(v7 + 24);
        if (!v18)
          goto LABEL_19;
        result = (uint64_t)sqlite3_column_name(v18, v15);
        if (result)
        {
          if (sub_244568228() == a1 && v19 == a2)
          {
            swift_bridgeObjectRelease();
            return v23(v15);
          }
          v16 = sub_244568510();
          result = swift_bridgeObjectRelease();
          if ((v16 & 1) != 0)
            return v23(v15);
        }
        if (v14 == ++v15)
          goto LABEL_22;
      }
      __break(1u);
      goto LABEL_24;
    }
LABEL_22:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v22 = a1;
    *(_QWORD *)(v22 + 8) = a2;
    *(_QWORD *)(v22 + 16) = 0;
    *(_BYTE *)(v22 + 24) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
LABEL_24:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for SQLiteRow()
{
  return &type metadata for SQLiteRow;
}

uint64_t Bool.bind(to:at:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3 & 1);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24454DF70(uint64_t a1, uint64_t a2)
{
  char *v2;

  return Bool.bind(to:at:)(a1, a2, *v2);
}

uint64_t Float.bind(to:at:)(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_double((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000015;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E90;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24454E0A0(uint64_t a1, uint64_t a2)
{
  float *v2;

  return Float.bind(to:at:)(a1, a2, *v2);
}

uint64_t Double.bind(to:at:)(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_double((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000015;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E90;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24454E1CC(uint64_t a1, uint64_t a2)
{
  double *v2;

  return Double.bind(to:at:)(a1, a2, *v2);
}

_QWORD *String.bind(to:at:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  __int128 v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  __int128 v10;
  _OWORD v11[2];

  v5 = a1[1];
  v10 = *a1;
  v11[0] = v5;
  *(_OWORD *)((char *)v11 + 9) = *(__int128 *)((char *)a1 + 25);
  v9[2] = &v10;
  v9[3] = a2;
  result = sub_24454E3B8((_QWORD *(*)(unsigned int *__return_ptr, _QWORD *))sub_24454EFD4, (uint64_t)v9, a3, a4);
  if (!v4)
  {
    if ((_DWORD)result)
    {
      v7 = result;
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)v8 = v7;
      *(_QWORD *)(v8 + 8) = 0xD000000000000015;
      *(_QWORD *)(v8 + 16) = 0x8000000244568EB0;
      *(_BYTE *)(v8 + 24) = 0;
      return (_QWORD *)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_24454E28C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _DWORD *a4@<X8>)
{
  uint64_t v5;
  sqlite3_stmt *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  sqlite3_stmt *v13;

  v5 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  if (v5 && *(_QWORD *)(v5 + 16))
  {
    v7 = *(sqlite3_stmt **)(*(_QWORD *)a2 + 24);
    if (v7)
    {
      if (a3 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a3 <= 0x7FFFFFFF)
      {
        if (qword_257370D00 == -1)
        {
LABEL_7:
          result = sqlite3_bind_text(v7, a3, a1, -1, (void (__cdecl *)(void *))qword_257371240);
          *a4 = result;
          return result;
        }
LABEL_13:
        v12 = a3;
        v13 = v7;
        v11 = a1;
        swift_once();
        LODWORD(a3) = v12;
        v7 = v13;
        a1 = v11;
        goto LABEL_7;
      }
      __break(1u);
      goto LABEL_13;
    }
    sub_2445470A0();
    swift_allocError();
    v10 = 3;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    v10 = 4;
  }
  *(_QWORD *)v9 = v10;
  *(_QWORD *)(v9 + 8) = 0;
  *(_QWORD *)(v9 + 16) = 0;
  *(_BYTE *)(v9 + 24) = 5;
  return swift_willThrow();
}

_QWORD *sub_24454E3B8(_QWORD *(*a1)(unsigned int *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *result;
  unsigned int v8;
  _QWORD v9[2];
  unsigned int v10;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    result = (_QWORD *)sub_2445683F0();
    if (!v4)
      return (_QWORD *)v10;
  }
  else if ((a4 & 0x2000000000000000) != 0)
  {
    v9[0] = a3;
    v9[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    result = a1(&v8, v9);
    if (!v4)
      return (_QWORD *)v8;
  }
  else
  {
    if ((a3 & 0x1000000000000000) != 0)
      v6 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
    else
      v6 = sub_244568420();
    result = a1((unsigned int *)v9, (_QWORD *)v6);
    if (!v4)
      return (_QWORD *)LODWORD(v9[0]);
  }
  return result;
}

uint64_t sub_24454E490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *(*v7)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 v10;
  _QWORD v12[2];
  uint64_t v13;

  if ((a4 & 0x1000000000000000) != 0 || !(a4 & 0x2000000000000000 | a3 & 0x1000000000000000))
  {
    v10 = sub_2445683F0();
    if (!v4)
      v10 = BYTE1(v13);
  }
  else
  {
    MEMORY[0x24BDAC7A8](a1);
    if ((v6 & 0x2000000000000000) != 0)
    {
      v12[0] = v5;
      v12[1] = v6 & 0xFFFFFFFFFFFFFFLL;
      v10 = v7(&v13, v12);
      if (!v4)
        v10 = v13;
    }
    else
    {
      if ((v5 & 0x1000000000000000) != 0)
      {
        v8 = (v6 & 0xFFFFFFFFFFFFFFFLL) + 32;
        v9 = v5 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v8 = sub_244568420();
      }
      v10 = sub_24456631C(v8, v9, (void (*)(uint64_t *__return_ptr))sub_24454F168);
    }
  }
  return v10 & 1;
}

_QWORD *sub_24454E590(__int128 *a1, uint64_t a2)
{
  uint64_t *v2;

  return String.bind(to:at:)(a1, a2, *v2, v2[1]);
}

void Data.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_24454E610()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int16 v5;
  char v6;
  char v7;
  char v8;
  char v9;
  _BYTE v10[144];

  v4 = v1;
  v5 = v0;
  v6 = BYTE2(v0);
  v7 = BYTE3(v0);
  v8 = BYTE4(v0);
  v9 = BYTE5(v0);
  sub_24454A3E8((uint64_t)v10);
  sub_24454E824((uint64_t)&v4, (uint64_t)&v4 + BYTE6(v0), (uint64_t)v10, v2, v1, v0);
  sub_24454F10C(v1, v0);
  sub_24454ABFC((uint64_t)v10);
  return sub_24454F10C(v1, v0);
}

uint64_t sub_24454E824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(*(_QWORD *)a3 + 16);
  if (v6 && *(_QWORD *)(v6 + 16))
  {
    if (*(_QWORD *)(*(_QWORD *)a3 + 24))
    {
      if (a4 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else if (a4 <= 0x7FFFFFFF)
      {
        __asm { BR              X12 }
      }
      __break(1u);
      JUMPOUT(0x24454E9C4);
    }
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
  }
  *(_QWORD *)(v7 + 8) = 0;
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)v7 = v8;
  *(_BYTE *)(v7 + 24) = 5;
  return swift_willThrow();
}

void sub_24454EA0C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  Data.bind(to:at:)(a1, a2, *v2, v2[1]);
}

uint64_t Array<A>.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_QWORD *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  char v27;
  uint64_t v28;

  v28 = a5;
  v25 = a2;
  v20 = *(_QWORD *)(a4 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)v7;
  v23 = *(_QWORD *)(v7 + 8);
  v24 = v10;
  v11 = *(_QWORD *)(v7 + 16);
  v12 = *(_QWORD *)(v7 + 32);
  v21 = *(_QWORD *)(v7 + 24);
  v22 = v11;
  v13 = *(_BYTE *)(v7 + 40);
  result = MEMORY[0x2495118D0](v14, v15);
  if (result < 0)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v17 = result;
  if (result)
  {
    v18 = 0;
    v19 = *(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v28 + 8);
    while (v17 != v18)
    {
      result = sub_2445682F4();
      v26[0] = v24;
      v26[1] = v23;
      v26[2] = v22;
      v26[3] = v21;
      v26[4] = v12;
      v27 = v13;
      if (__OFADD__(v18, v25))
        goto LABEL_10;
      v19(v26, v18 + v25, a4, v28);
      result = (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v9, a4);
      if (!v5 && v17 != ++v18)
        continue;
      return result;
    }
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_24454EB7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return Array<A>.bind(to:at:)(a1, a2, *v4, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8));
}

_QWORD *Array<A>.bind(to:at:)(_QWORD *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  char v18;
  uint64_t v19;

  v19 = a2;
  v4 = *(_QWORD *)(a3 + 16);
  if (v4)
  {
    v5 = 0;
    v15 = result[1];
    v16 = *result;
    v6 = result[4];
    v13 = result[3];
    v14 = result[2];
    v7 = (_QWORD *)(a3 + 32);
    v8 = v4 - 1;
    v9 = *((_BYTE *)result + 40);
    while (1)
    {
      v10 = v7[3];
      v11 = v7[4];
      result = __swift_project_boxed_opaque_existential_1(v7, v10);
      v17[0] = v16;
      v17[1] = v15;
      v17[2] = v14;
      v17[3] = v13;
      v17[4] = v6;
      v18 = v9;
      if (__OFADD__(v5, v19))
        break;
      result = (_QWORD *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v11 + 8))(v17, v5 + v19, v10, v11);
      if (!v3)
      {
        v7 += 5;
        if (v8 != v5++)
          continue;
      }
      return result;
    }
    __break(1u);
  }
  return result;
}

sqlite3_stmt *Optional<A>.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  sqlite3_stmt *result;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[12];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  char v32;

  v29 = a4;
  v30 = a2;
  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = &v25[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = *(_QWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v6);
  v14 = &v25[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = *(_QWORD *)v12;
  v15 = *(_QWORD *)(v12 + 8);
  v18 = *(_QWORD *)(v12 + 16);
  v17 = *(_QWORD *)(v12 + 24);
  v27 = *(_QWORD *)(v12 + 32);
  v28 = v17;
  v26 = *(unsigned __int8 *)(v12 + 40);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 16))(v8, v19);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v11 + 32))(v14, v8, v10);
    v31[0] = v16;
    v31[1] = v15;
    v31[2] = v18;
    v31[3] = v28;
    v31[4] = v27;
    v32 = v26;
    (*(void (**)(_QWORD *, uint64_t, uint64_t))(v29 + 8))(v31, v30, v10);
    return (sqlite3_stmt *)(*(uint64_t (**)(_BYTE *, uint64_t))(v11 + 8))(v14, v10);
  }
  v20 = v30;
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v8, a3);
  v21 = *(_QWORD *)(v16 + 16);
  if (!v21 || !*(_QWORD *)(v21 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v24 = 4;
LABEL_10:
    *(_QWORD *)v23 = v24;
    *(_QWORD *)(v23 + 8) = 0;
    *(_QWORD *)(v23 + 16) = 0;
    *(_BYTE *)(v23 + 24) = 5;
    return (sqlite3_stmt *)swift_willThrow();
  }
  result = *(sqlite3_stmt **)(v16 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v24 = 3;
    goto LABEL_10;
  }
  if (v20 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v20 <= 0x7FFFFFFF)
  {
    return (sqlite3_stmt *)sqlite3_bind_null(result, v20);
  }
  __break(1u);
  return result;
}

sqlite3_stmt *sub_24454EEAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Optional<A>.bind(to:at:)(a1, a2, a3, *(_QWORD *)(a4 - 8));
}

uint64_t RawRepresentable<>.bind(to:at:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19;

  v16 = a2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v8 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v10 = (char *)&v14 - v9;
  v11 = *a1;
  v14 = a1[1];
  v15 = v11;
  v12 = *((_QWORD *)a1 + 4);
  LOBYTE(a1) = *((_BYTE *)a1 + 40);
  sub_2445682A0();
  v17[0] = v15;
  v17[1] = v14;
  v18 = v12;
  v19 = (char)a1;
  (*(void (**)(_OWORD *, uint64_t, uint64_t, uint64_t))(a5 + 8))(v17, v16, AssociatedTypeWitness, a5);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, AssociatedTypeWitness);
}

uint64_t sub_24454EFD4@<X0>(char *a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_24454E28C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_24454EFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t result;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  result = sub_244568108();
  v14 = result;
  if (result)
  {
    result = sub_244568120();
    if (__OFSUB__(a1, result))
    {
LABEL_13:
      __break(1u);
      return result;
    }
    v14 += a1 - result;
  }
  v15 = __OFSUB__(a2, a1);
  v16 = a2 - a1;
  if (v15)
  {
    __break(1u);
    goto LABEL_13;
  }
  v17 = sub_244568114();
  if (v17 >= v16)
    v18 = v16;
  else
    v18 = v17;
  v19 = v14 + v18;
  if (v14)
    v20 = v19;
  else
    v20 = 0;
  sub_24454E824(v14, v20, a4, a5, a6, a7);
  sub_24454ABFC(a4);
  return sub_24454F10C(a6, a7);
}

uint64_t sub_24454F0C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_24454F10C(uint64_t a1, unint64_t a2)
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

uint64_t dispatch thunk of SQLiteBindable.bind(to:at:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

_QWORD *sub_24454F168@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_244566370(*(_QWORD *(**)(uint64_t *__return_ptr))(v1 + 16), a1);
}

uint64_t Bool.init(with:column:)(uint64_t a1, uint64_t a2)
{
  return sub_24454F4D8(a1, a2) & 1;
}

uint64_t sub_24454F198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_24454F4D8(a1, a2);
  if (!v3)
    *a3 = result & 1;
  return result;
}

void Float.init(with:column:)(uint64_t a1, uint64_t a2)
{
  sub_24454F6BC(a1, a2);
}

void sub_24454F1D8(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  int v5;

  sub_24454F6BC(a1, a2);
  if (!v3)
    *a3 = v5;
}

void Double.init(with:column:)(uint64_t a1, uint64_t a2)
{
  sub_24454F5D0(a1, a2);
}

void sub_24454F214(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;

  sub_24454F5D0(a1, a2);
  if (!v3)
    *a3 = v5;
}

uint64_t RawRepresentable<>.init(with:column:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;

  v28 = a6;
  v11 = sub_244568378();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - v13;
  v29 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v30 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v18 = (char *)&v27 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v31 = *a1;
  v20 = (char *)&v27 - v19;
  v21 = v33;
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v31, a2, AssociatedTypeWitness, a5);
  if (!v21)
  {
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v18, v20, AssociatedTypeWitness);
    sub_2445682AC();
    v23 = *(_QWORD *)(a3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v14, 1, a3) == 1)
    {
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      v31 = 0;
      v32 = 0xE000000000000000;
      sub_2445683FC();
      sub_24456821C();
      sub_244568594();
      sub_24456821C();
      swift_bridgeObjectRelease();
      sub_24456821C();
      sub_2445684F8();
      v24 = v31;
      v25 = v32;
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)v26 = v24;
      *(_QWORD *)(v26 + 8) = v25;
      *(_QWORD *)(v26 + 16) = 0;
      *(_BYTE *)(v26 + 24) = 4;
      swift_willThrow();
      return (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v20, AssociatedTypeWitness);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v30 + 8))(v20, AssociatedTypeWitness);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v28, v14, a3);
    }
  }
  return result;
}

{
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t result;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;

  v42 = a2;
  v40 = a6;
  v10 = sub_244568378();
  v36 = *(_QWORD *)(v10 - 8);
  v37 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v38 = (char *)&v35 - v11;
  v39 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = sub_244568378();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v35 - v16;
  v41 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v35 - v21;
  v43 = *a1;
  v23 = v45;
  result = (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16))(&v43, v42, AssociatedTypeWitness, a5);
  if (!v23)
  {
    v25 = v22;
    v26 = v41;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v41 + 48))(v17, 1, AssociatedTypeWitness) == 1)
    {
      (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v13);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v40, 1, 1, a3);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v25, v17, AssociatedTypeWitness);
      v27 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
      v45 = v25;
      v27(v20, v25, AssociatedTypeWitness);
      v28 = v38;
      sub_2445682AC();
      v29 = *(_QWORD *)(a3 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v28, 1, a3) == 1)
      {
        (*(void (**)(char *, uint64_t))(v36 + 8))(v28, v37);
        v43 = 0;
        v44 = 0xE000000000000000;
        sub_2445683FC();
        sub_24456821C();
        sub_244568594();
        sub_24456821C();
        swift_bridgeObjectRelease();
        sub_24456821C();
        v30 = v45;
        sub_2445684F8();
        v31 = v43;
        v32 = v44;
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)v33 = v31;
        *(_QWORD *)(v33 + 8) = v32;
        *(_QWORD *)(v33 + 16) = 0;
        *(_BYTE *)(v33 + 24) = 4;
        swift_willThrow();
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v30, AssociatedTypeWitness);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v26 + 8))(v45, AssociatedTypeWitness);
        v34 = v40;
        (*(void (**)(uint64_t, char *, uint64_t))(v29 + 32))(v40, v28, a3);
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v29 + 56))(v34, 0, 1, a3);
      }
    }
  }
  return result;
}

uint64_t sub_24454F4D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_8:
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 5;
    swift_willThrow();
    swift_release();
    return v6;
  }
  v3 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_8;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int(v3, a2) != 0;
  }
  __break(1u);
  return result;
}

void sub_24454F5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 4;
LABEL_8:
    *(_QWORD *)v5 = v6;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
    *(_BYTE *)(v5 + 24) = 5;
    swift_willThrow();
    swift_release();
    return;
  }
  v3 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 3;
    goto LABEL_8;
  }
  swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_column_double(v3, a2);
    return;
  }
  __break(1u);
}

void sub_24454F6BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 4;
LABEL_8:
    *(_QWORD *)v5 = v6;
    *(_QWORD *)(v5 + 8) = 0;
    *(_QWORD *)(v5 + 16) = 0;
    *(_BYTE *)(v5 + 24) = 5;
    swift_willThrow();
    swift_release();
    return;
  }
  v3 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v6 = 3;
    goto LABEL_8;
  }
  swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_column_double(v3, a2);
    return;
  }
  __break(1u);
}

uint64_t dispatch thunk of SQLiteSafeType.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t sub_24454F7C4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 24) = v3;
  *(_QWORD *)(v4 + 32) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24454F820()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteScalarUDF.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  swift_weakInit();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  return v0;
}

uint64_t SQLiteScalarUDF.init()()
{
  uint64_t v0;

  swift_weakInit();
  *(_QWORD *)(v0 + 24) = 0;
  *(_QWORD *)(v0 + 32) = 0;
  return v0;
}

uint64_t sub_24454F8CC()
{
  return 0;
}

uint64_t sub_24454F8D4()
{
  return 1;
}

uint64_t sub_24454F8DC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24454F8FC(uint64_t result, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  sqlite3 *v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const char *v10;
  unsigned int function_v2;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(sqlite3 **)(a3 + 16);
  if (v4)
  {
    v6 = result;
    swift_beginAccess();
    v3[3] = v6;
    v3[4] = a2;
    swift_bridgeObjectRetain();
    v7 = swift_bridgeObjectRelease();
    v8 = (*(uint64_t (**)(uint64_t))(*v3 + 152))(v7);
    v9 = (*(uint64_t (**)(void))(*v3 + 160))();
    v10 = (const char *)(sub_2445681EC() + 32);
    swift_retain();
    function_v2 = sqlite3_create_function_v2(v4, v10, v8, v9, v3, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_24454FC20, 0, 0, (void (__cdecl *)(void *))sub_24454FD04);
    result = swift_release();
    if (function_v2)
    {
      sub_2445683FC();
      swift_bridgeObjectRelease();
      sub_2445684E0();
      sub_24456821C();
      swift_bridgeObjectRelease();
      v12 = sub_2445544F0(0xD00000000000001DLL, 0x8000000244568F30);
      v14 = v13;
      swift_bridgeObjectRelease();
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)v15 = function_v2;
      *(_QWORD *)(v15 + 8) = v12;
      *(_QWORD *)(v15 + 16) = v14;
      *(_BYTE *)(v15 + 24) = 0;
      return swift_willThrow();
    }
  }
  return result;
}

void sub_24454FABC(sqlite3_context *a1)
{
  uint64_t v2;
  uint64_t v3;

  if (a1)
  {
    if (sqlite3_user_data(a1))
    {
      v2 = swift_retain();
      v3 = MEMORY[0x24BDAC7A8](v2);
      (*(void (**)(uint64_t (*)()))(*(_QWORD *)v3 + 176))(sub_2445504E0);
      swift_release();
    }
    else
    {
      sqlite3_result_error(a1, "Cannot bind to function instance.", -1);
    }
  }
}

uint64_t sub_24454FBB8(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v7;

  v7 = a2;
  result = Array<A>.init(_:argc:)(a3, a4);
  if (!v4)
  {
    (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)a1 + 168))(&v7, result);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_24454FC24(uint64_t a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (a1)
  {
    swift_release();
  }
  else
  {
    if (qword_257370D10 != -1)
      swift_once();
    v1 = sub_244568180();
    __swift_project_value_buffer(v1, (uint64_t)qword_257371260);
    oslog = sub_244568168();
    v2 = sub_24456836C();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_244545000, oslog, v2, "Missing function object", v3, 2u);
      MEMORY[0x2495120E0](v3, -1, -1);
    }

  }
}

uint64_t sub_24454FD08(uint64_t result)
{
  _QWORD *v1;
  sqlite3 *v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unsigned int function;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(sqlite3 **)(result + 16);
  if (v2)
  {
    result = swift_beginAccess();
    if (v1[4])
    {
      v3 = *(uint64_t (**)(uint64_t))(*v1 + 152);
      v4 = swift_bridgeObjectRetain();
      v5 = v3(v4);
      v6 = (*(uint64_t (**)(void))(*v1 + 160))();
      v7 = sub_2445681EC();
      swift_bridgeObjectRelease();
      function = sqlite3_create_function(v2, (const char *)(v7 + 32), v5, v6, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))nullsub_2, 0, 0);
      result = swift_release();
      if (function)
      {
        sub_2445683FC();
        swift_bridgeObjectRelease();
        sub_2445684E0();
        sub_24456821C();
        swift_bridgeObjectRelease();
        v9 = sub_2445544F0(0xD000000000000020, 0x8000000244568F50);
        v11 = v10;
        swift_bridgeObjectRelease();
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)v12 = function;
        *(_QWORD *)(v12 + 8) = v9;
        *(_QWORD *)(v12 + 16) = v11;
        *(_BYTE *)(v12 + 24) = 0;
        return swift_willThrow();
      }
    }
  }
  return result;
}

uint64_t SQLiteScalarUDF.deinit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  v1 = v0;
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 32);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 24);
    v4 = qword_257370D10;
    swift_bridgeObjectRetain();
    if (v4 != -1)
      swift_once();
    v5 = sub_244568180();
    __swift_project_value_buffer(v5, (uint64_t)qword_257371260);
    swift_bridgeObjectRetain();
    v6 = sub_244568168();
    v7 = sub_244568354();
    if (!os_log_type_enabled(v6, v7))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_13;
    }
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v15 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_244558788(v3, v2, &v15);
    sub_244568384();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_244545000, v6, v7, "Destroying %s function", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495120E0](v9, -1, -1);
    v10 = v8;
  }
  else
  {
    if (qword_257370D10 != -1)
      swift_once();
    v11 = sub_244568180();
    __swift_project_value_buffer(v11, (uint64_t)qword_257371260);
    v6 = sub_244568168();
    v12 = sub_244568354();
    if (!os_log_type_enabled(v6, v12))
      goto LABEL_11;
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_244545000, v6, v12, "Destroying unregistered function", v13, 2u);
    v10 = v13;
  }
  MEMORY[0x2495120E0](v10, -1, -1);
LABEL_11:

LABEL_13:
  swift_weakDestroy();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t SQLiteScalarUDF.__deallocating_deinit()
{
  SQLiteScalarUDF.deinit();
  return swift_deallocClassInstance();
}

void sub_244550148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = v0;
  if (qword_257370D10 != -1)
    swift_once();
  v2 = sub_244568180();
  __swift_project_value_buffer(v2, (uint64_t)qword_257371260);
  swift_retain_n();
  v3 = sub_244568168();
  v4 = sub_244568354();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v11 = v6;
    *(_DWORD *)v5 = 136315650;
    swift_beginAccess();
    if (*(_QWORD *)(v1 + 32))
    {
      v7 = *(_QWORD *)(v1 + 24);
      v8 = *(_QWORD *)(v1 + 32);
    }
    else
    {
      v8 = 0xE90000000000003ELL;
      v7 = 0x6E776F6E6B6E753CLL;
    }
    swift_bridgeObjectRetain();
    sub_244558788(v7, v8, &v11);
    sub_244568384();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2048;
    sub_244568384();
    *(_WORD *)(v5 + 22) = 2080;
    v9 = sub_2445681D4();
    sub_244558788(v9, v10, &v11);
    sub_244568384();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244545000, v3, v4, "Function %s received %ld parameter: %s", (uint8_t *)v5, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2495120E0](v6, -1, -1);
    MEMORY[0x2495120E0](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
}

uint64_t sub_2445503A4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_2445503C0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  *a2 = *(_QWORD *)(v3 + 24);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for SQLiteScalarUDF()
{
  return objc_opt_self();
}

uint64_t method lookup function for SQLiteScalarUDF()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteScalarUDF.name.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.parametersCount.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.options.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.perform(with:arguments:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.hookPerform(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.register(_:database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.unregister(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SQLiteScalarUDF.receivedParameter(_:index:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t sub_2445504E0()
{
  uint64_t v0;

  return sub_24454FBB8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_DWORD *)(v0 + 40));
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.ensureValidSQLNameCharacters()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v2 = (*(uint64_t (**)(void))(v0 + 16))();
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = v2 + 32;
    do
    {
      sub_24454A490(v4, (uint64_t)v7);
      v6 = v8;
      v5 = v9;
      __swift_project_boxed_opaque_existential_1(v7, v8);
      (*(void (**)(uint64_t))(*(_QWORD *)(v5 + 8) + 8))(v6);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
      if (v1)
        break;
      v4 += 40;
      --v3;
    }
    while (v3);
  }
  swift_bridgeObjectRelease();
}

uint64_t SQLiteSchema.columns.getter()
{
  return sub_2445505E4();
}

uint64_t sub_2445505B8()
{
  return sub_2445505E4();
}

void sub_2445505C8()
{
  SQLiteSchemaDescribing.ensureValidSQLNameCharacters()();
}

uint64_t sub_2445505E4()
{
  uint64_t v0;

  sub_244568414();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257371060);
  v0 = sub_244568468();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t dispatch thunk of SQLiteSchemaDescribing.columns.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24455064C()
{
  return swift_allocateGenericValueMetadata();
}

void type metadata accessor for SQLiteSchema()
{
  JUMPOUT(0x249512020);
}

uint64_t sub_244550664(uint64_t a1)
{
  return _s12PoirotSQLite0B5ErrorO2eeoiySbAC_ACtFZ_0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t _s12PoirotSQLite0B5ErrorO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 a4)
{
  return ((uint64_t (*)(void))((char *)sub_2445506A4 + 4 * byte_24456A078[a4]))();
}

uint64_t sub_2445506A4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, char a8)
{
  if (a8 || a1 != a5)
    return 0;
  if (a2 == a6 && a3 == a7)
    return 1;
  return sub_244568510();
}

uint64_t sub_2445509BC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for SQLiteError(uint64_t a1)
{
  return sub_244550A08(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_244550A08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  switch(a4)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_2445509BC(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_2445509BC(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_244550A08(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_244550A08(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_244550BF8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 4u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 5);
}

uint64_t sub_244550C10(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 5;
  if (a2 >= 5)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 5;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteError()
{
  return &type metadata for SQLiteError;
}

uint64_t sub_244550C3C(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  void (*v22)(char *, _QWORD);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  void (*v33)(char *, char *);
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char v38[32];
  uint64_t v39;

  v27 = a5;
  v28 = a8;
  v33 = a1;
  v34 = a2;
  v26 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v35 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v31 = (char *)&v24 - v13;
  v36 = a4;
  MEMORY[0x24BDAC7A8](v12);
  v30 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - v16;
  v18 = sub_24456830C();
  if (!v18)
    return sub_2445682B8();
  v19 = v18;
  v25 = v15;
  v39 = sub_244568450();
  v32 = sub_24456845C();
  sub_244568438();
  v36 = v17;
  result = sub_244568300();
  if (v19 < 0)
  {
    __break(1u);
  }
  else
  {
    v21 = v31;
    while (1)
    {
      v22 = (void (*)(char *, _QWORD))sub_24456833C();
      (*(void (**)(char *))(v11 + 16))(v21);
      v22(v38, 0);
      v23 = v37;
      v33(v21, v35);
      if (v23)
        break;
      v37 = 0;
      (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
      sub_244568444();
      sub_244568318();
      if (!--v19)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
        return v39;
      }
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v21, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v36, v25);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v26 + 32))(v28, v35, v27);
  }
  return result;
}

void SQLiteStatement.nextRowValue<A>()(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  uint64_t v8;
  char v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  char v13;
  uint64_t v14;

  v8 = *((_QWORD *)v3 + 2);
  v9 = *((_BYTE *)v3 + 40);
  v10 = *v3;
  v11 = v8;
  v12 = *(__int128 *)((char *)v3 + 24);
  v13 = v9;
  SQLiteStatement.nextRow()(&v14);
  if (!v4)
  {
    if (v14)
    {
      *(_QWORD *)&v10 = v14;
      (*(void (**)(__int128 *, uint64_t, uint64_t))(a2 + 8))(&v10, a1, a2);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a3, 0, 1, a1);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a3, 1, 1, a1);
    }
  }
}

uint64_t SQLiteStatement.singleRowIfAny<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[3];
  __int128 v11;
  char v12;

  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v7;
  v11 = xmmword_24456A100;
  v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_244557F64(v10, (void (*)(uint64_t *))sub_244551AF4);
  swift_bridgeObjectRelease();
  if (!v3)
    return swift_release();
  swift_release();
  v8 = sub_244568378();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
}

{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[3];
  __int128 v11;
  char v12;

  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v7;
  v11 = xmmword_24456A100;
  v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_244557F64(v10, (void (*)(uint64_t *))sub_244551B10);
  swift_bridgeObjectRelease();
  if (!v3)
    return swift_release();
  swift_release();
  v8 = sub_244568378();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
}

uint64_t sub_2445510F0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_244568378();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - v11;
  v16 = *a1;
  v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  result = v13(&v16, a3, a4);
  if (!v4)
  {
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(v12, 0, 1, a3);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(a2, v12, v9);
  }
  return result;
}

uint64_t sub_2445512D8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v9 = sub_244568378();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v15 - v11;
  v16 = *a1;
  v13 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  result = v13(&v16, a3, a4);
  if (!v4)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v10 + 40))(a2, v12, v9);
  return result;
}

uint64_t SQLiteStatement.singleRow<A>()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2445513DC(a1, a2, (uint64_t (*)(uint64_t, uint64_t))SQLiteStatement.singleRowIfAny<A>(), a3);
}

{
  return sub_2445513DC(a1, a2, (uint64_t (*)(uint64_t, uint64_t))SQLiteStatement.singleRowIfAny<A>(), a3);
}

uint64_t sub_2445513DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t)@<X2>, uint64_t a4@<X8>)
{
  __int128 *v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  int v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  char v27;
  uint64_t v28;

  v28 = a4;
  v9 = sub_244568378();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  v16 = *((_QWORD *)v4 + 2);
  v17 = *((_BYTE *)v4 + 40);
  v24 = *v4;
  v25 = v16;
  v26 = *(__int128 *)((char *)v4 + 24);
  v27 = v17;
  result = a3(a1, a2);
  if (!v5)
  {
    v19 = v28;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
    v20 = *(_QWORD *)(a1 - 8);
    v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v20 + 48))(v13, 1, a1);
    v22 = *(void (**)(char *, uint64_t))(v10 + 8);
    if (v21 == 1)
    {
      v22(v13, v9);
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v23 + 8) = 0;
      *(_QWORD *)(v23 + 16) = 0;
      *(_QWORD *)v23 = 5;
      *(_BYTE *)(v23 + 24) = 5;
      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v22)(v15, v9);
    }
    else
    {
      v22(v15, v9);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v20 + 32))(v19, v13, a1);
    }
  }
  return result;
}

uint64_t SQLiteStatement.rows<A>()()
{
  return sub_244551664();
}

uint64_t sub_244551598(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t *, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v11;

  MEMORY[0x24BDAC7A8](a1);
  v11 = *v7;
  v9 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v8 + 8);
  swift_retain();
  result = v9(&v11, a3, a4);
  if (!v4)
  {
    sub_2445682E8();
    return sub_2445682DC();
  }
  return result;
}

uint64_t SQLiteStatement.compactRows<A>()()
{
  return sub_244551664();
}

uint64_t sub_244551664()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  char v10;
  uint64_t v11;

  v2 = *((_QWORD *)v0 + 2);
  v3 = *((_BYTE *)v0 + 40);
  v7 = *v0;
  v8 = v2;
  v9 = *(__int128 *)((char *)v0 + 24);
  v10 = v3;
  v6 = sub_2445682B8();
  v4 = sub_2445682E8();
  SQLiteStatement.reduce<A>(into:handleRow:)((uint64_t)&v6, v4, (uint64_t)&v11);
  result = swift_bridgeObjectRelease();
  if (!v1)
    return v11;
  return result;
}

uint64_t sub_244551720(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t (*v17)(uint64_t *, uint64_t, uint64_t);
  uint64_t result;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v24 = a1;
  v23 = sub_244568378();
  v8 = *(_QWORD *)(v23 - 8);
  v9 = MEMORY[0x24BDAC7A8](v23);
  v11 = (char *)&v22 - v10;
  v25 = *(_QWORD *)(a3 - 8);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v22 - v15;
  v26 = *a2;
  v17 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(a4 + 8);
  swift_retain();
  result = v17(&v26, a3, a4);
  if (!v4)
  {
    v19 = v16;
    v20 = v23;
    v21 = v25;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v11, 1, a3) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v20);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v19, v11, a3);
      (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v14, v19, a3);
      sub_2445682E8();
      sub_2445682DC();
      return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v19, a3);
    }
  }
  return result;
}

uint64_t Array<A>.init(with:)(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  sqlite3_stmt *v6;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[7];
  _QWORD v16[3];

  v4 = *a1;
  v5 = *(_QWORD *)(*a1 + 16);
  if (!v5 || !*(_QWORD *)(v5 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v14 = 4;
LABEL_7:
    *(_QWORD *)v13 = v14;
    *(_QWORD *)(v13 + 8) = 0;
    *(_QWORD *)(v13 + 16) = 0;
    *(_BYTE *)(v13 + 24) = 5;
    swift_willThrow();
    swift_release();
    return v3;
  }
  v6 = *(sqlite3_stmt **)(v4 + 24);
  if (!v6)
  {
    sub_2445470A0();
    swift_allocError();
    v14 = 3;
    goto LABEL_7;
  }
  result = sqlite3_column_count(v6);
  if ((result & 0x80000000) == 0)
  {
    v16[1] = 0;
    v16[2] = result;
    MEMORY[0x24BDAC7A8](result);
    v15[2] = a2;
    v15[3] = a3;
    v15[4] = v4;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257371068);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB8);
    v12 = sub_244551B7C();
    v3 = sub_244550C3C((void (*)(char *, char *))sub_244551B5C, (uint64_t)v15, v10, a2, v11, v12, MEMORY[0x24BEE3F20], (uint64_t)v16);
    swift_release();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_244551A4C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t (*v10)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v12;

  v9 = *a1;
  v12 = a2;
  v10 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a4 + 16);
  swift_retain();
  result = v10(&v12, v9, a3, a4);
  if (v5)
    *a5 = v5;
  return result;
}

uint64_t sub_244551AC4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;

  result = Array<A>.init(with:)(a1, *(char **)(a2 + 16), *(_QWORD *)(a3 - 8));
  if (!v4)
    *a4 = result;
  return result;
}

uint64_t sub_244551AF4(uint64_t *a1)
{
  uint64_t *v1;

  return sub_2445510F0(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_244551B10(uint64_t *a1)
{
  uint64_t *v1;

  return sub_2445512D8(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_244551B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_244551598(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_244551B44(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_244551720(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_244551B5C(uint64_t *a1, _QWORD *a2)
{
  uint64_t *v2;

  return sub_244551A4C(a1, v2[4], v2[2], v2[3], a2);
}

unint64_t sub_244551B7C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[2];

  result = qword_257371070;
  if (!qword_257371070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257371068);
    v2 = sub_244551BE8();
    v3[0] = MEMORY[0x24BEE17A8];
    v3[1] = v2;
    result = MEMORY[0x249512068](MEMORY[0x24BEE1BD8], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257371070);
  }
  return result;
}

unint64_t sub_244551BE8()
{
  unint64_t result;

  result = qword_257371078;
  if (!qword_257371078)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_257371078);
  }
  return result;
}

uint64_t dispatch thunk of SQLiteCompoundSafeType.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of SQLiteCompoundUnsafeType.init(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return dispatch thunk of SQLiteCompoundSafeType.init(with:)(a1, a2, a3);
}

uint64_t sub_244551C58(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_244552D54(0, v1, 0);
    v2 = v14;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = v4[3];
      v6 = v4[4];
      __swift_project_boxed_opaque_existential_1(v4, v5);
      v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
      v9 = v8;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        sub_244552D54(0, *(_QWORD *)(v14 + 16) + 1, 1);
      v11 = *(_QWORD *)(v14 + 16);
      v10 = *(_QWORD *)(v14 + 24);
      if (v11 >= v10 >> 1)
        sub_244552D54(v10 > 1, v11 + 1, 1);
      *(_QWORD *)(v14 + 16) = v11 + 1;
      v12 = v14 + 16 * v11;
      *(_QWORD *)(v12 + 32) = v7;
      *(_QWORD *)(v12 + 40) = v9;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeCreateStatementString(for:in:)(Swift::String a1, Swift::String_optional in)
{
  uint64_t v2;
  uint64_t v3;
  void *object;
  uint64_t countAndFlagsBits;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char v12;
  char v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  unint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  Swift::String result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  unint64_t v44;
  uint64_t v45;
  char v46;
  char v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD v50[3];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;

  v40 = v2;
  object = in.value._object;
  countAndFlagsBits = in.value._countAndFlagsBits;
  v6 = a1._object;
  v7 = a1._countAndFlagsBits;
  v8 = sub_2445680F0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50[0] = v7;
  v50[1] = v6;
  if (qword_257370D08 != -1)
    swift_once();
  v45 = __swift_project_value_buffer(v8, (uint64_t)qword_257371248);
  sub_2445680E4();
  v44 = sub_244548248();
  sub_24456839C();
  v13 = v12;
  v43 = *(void (**)(char *, uint64_t))(v9 + 8);
  v43(v11, v8);
  if ((v13 & 1) == 0)
    goto LABEL_6;
  if (object)
  {
    v50[0] = countAndFlagsBits;
    v50[1] = object;
    sub_2445680E4();
    sub_24456839C();
    v15 = v14;
    v43(v11, v8);
    if ((v15 & 1) == 0)
    {
LABEL_6:
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v16 + 8) = 0;
      *(_QWORD *)(v16 + 16) = 0;
      *(_QWORD *)v16 = 10;
      *(_BYTE *)(v16 + 24) = 5;
      v17 = swift_willThrow();
      goto LABEL_21;
    }
    v42 = v8;
    v50[0] = countAndFlagsBits;
    v50[1] = object;
    swift_bridgeObjectRetain();
    sub_24456821C();
  }
  else
  {
    v42 = v8;
  }
  v39 = v3;
  v50[0] = 0;
  v50[1] = 0xE000000000000000;
  sub_2445683FC();
  swift_bridgeObjectRelease();
  strcpy((char *)v50, "CREATE TABLE ");
  HIWORD(v50[1]) = -4864;
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  sub_24456821C();
  v53 = v50[0];
  v54 = (void *)v50[1];
  v19 = (*(uint64_t (**)(uint64_t))(v41 + 16))(v40);
  v20 = *(_QWORD *)(v19 + 16);
  if (v20)
  {
    v55 = MEMORY[0x24BEE4AF8];
    sub_244552D54(0, v20, 0);
    v41 = v19;
    v21 = v19 + 32;
    while (1)
    {
      sub_24454A490(v21, (uint64_t)v50);
      v22 = v51;
      v23 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 32);
      v48 = v24(v22, v23);
      v49 = v25;
      sub_2445680E4();
      sub_24456839C();
      v27 = v26;
      v43(v11, v42);
      if ((v27 & 1) == 0)
        break;
      swift_bridgeObjectRelease();
      v48 = 0;
      v49 = 0xE000000000000000;
      v24(v22, v23);
      sub_24456821C();
      swift_bridgeObjectRelease();
      sub_24456821C();
      v28 = v51;
      v29 = v52;
      __swift_project_boxed_opaque_existential_1(v50, v51);
      (*(void (**)(uint64_t, uint64_t))(v29 + 24))(v28, v29);
      (*(void (**)(char *__return_ptr))(v30 + 24))(&v47);
      v46 = v47;
      sub_244568474();
      v31 = v48;
      v32 = v49;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
      v33 = v55;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244552D54(0, *(_QWORD *)(v33 + 16) + 1, 1);
        v33 = v55;
      }
      v35 = *(_QWORD *)(v33 + 16);
      v34 = *(_QWORD *)(v33 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_244552D54(v34 > 1, v35 + 1, 1);
        v33 = v55;
      }
      *(_QWORD *)(v33 + 16) = v35 + 1;
      v36 = v33 + 16 * v35;
      *(_QWORD *)(v36 + 32) = v31;
      *(_QWORD *)(v36 + 40) = v32;
      v21 += 40;
      if (!--v20)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v37 + 8) = 0;
    *(_QWORD *)(v37 + 16) = 0;
    *(_QWORD *)v37 = 10;
    *(_BYTE *)(v37 + 24) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
    swift_bridgeObjectRelease();
    swift_release();
    v17 = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v33 = MEMORY[0x24BEE4AF8];
LABEL_20:
    v50[0] = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370FD0);
    sub_24454C180();
    sub_24456818C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    v17 = v53;
    v18 = v54;
  }
LABEL_21:
  result._object = v18;
  result._countAndFlagsBits = v17;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeSelectStatementString(for:in:)(Swift::String a1, Swift::String_optional in)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *object;
  uint64_t countAndFlagsBits;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  Swift::String result;
  _QWORD v42[6];
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v4 = v3;
  v5 = v2;
  object = in.value._object;
  countAndFlagsBits = in.value._countAndFlagsBits;
  v8 = a1._object;
  v9 = a1._countAndFlagsBits;
  v10 = sub_2445680F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[4] = v9;
  v42[5] = v8;
  v49 = v9;
  v50 = (unint64_t)v8;
  if (qword_257370D08 != -1)
    swift_once();
  v46 = __swift_project_value_buffer(v10, (uint64_t)qword_257371248);
  sub_2445680E4();
  v45 = sub_244548248();
  sub_24456839C();
  v15 = v14;
  v44 = *(void (**)(char *, uint64_t))(v11 + 8);
  v44(v13, v10);
  if ((v15 & 1) == 0)
    goto LABEL_6;
  if (object)
  {
    v49 = countAndFlagsBits;
    v50 = (unint64_t)object;
    sub_2445680E4();
    sub_24456839C();
    v17 = v16;
    v44(v13, v10);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v18 + 8) = 0;
      *(_QWORD *)(v18 + 16) = 0;
      *(_QWORD *)v18 = 10;
      *(_BYTE *)(v18 + 24) = 5;
      v19 = swift_willThrow();
      goto LABEL_21;
    }
    v49 = countAndFlagsBits;
    v50 = (unint64_t)object;
    swift_bridgeObjectRetain();
    sub_24456821C();
    v21 = v49;
    v22 = v50;
  }
  else
  {
    v21 = 0;
    v22 = 0xE000000000000000;
  }
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v5, v4);
  v24 = *(_QWORD *)(v23 + 16);
  if (v24)
  {
    v42[1] = v21;
    v42[3] = v22;
    v53 = MEMORY[0x24BEE4AF8];
    sub_244552D54(0, v24, 0);
    v42[2] = v23;
    v25 = v23 + 32;
    v43 = v10;
    while (1)
    {
      sub_24454A490(v25, (uint64_t)&v49);
      v26 = v51;
      v27 = v52;
      __swift_project_boxed_opaque_existential_1(&v49, v51);
      v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 32))(v26, v27);
      v48 = v28;
      sub_2445680E4();
      sub_24456839C();
      v30 = v29;
      v44(v13, v10);
      if ((v30 & 1) == 0)
        break;
      swift_bridgeObjectRelease();
      v31 = v51;
      v32 = v52;
      __swift_project_boxed_opaque_existential_1(&v49, v51);
      v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 32))(v31, v32);
      v35 = v34;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v49);
      v36 = v53;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244552D54(0, *(_QWORD *)(v36 + 16) + 1, 1);
        v36 = v53;
      }
      v38 = *(_QWORD *)(v36 + 16);
      v37 = *(_QWORD *)(v36 + 24);
      if (v38 >= v37 >> 1)
      {
        sub_244552D54(v37 > 1, v38 + 1, 1);
        v36 = v53;
      }
      *(_QWORD *)(v36 + 16) = v38 + 1;
      v39 = v36 + 16 * v38;
      *(_QWORD *)(v39 + 32) = v33;
      *(_QWORD *)(v39 + 40) = v35;
      v25 += 40;
      --v24;
      v10 = v43;
      if (!v24)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v40 + 8) = 0;
    *(_QWORD *)(v40 + 16) = 0;
    *(_QWORD *)v40 = 10;
    *(_BYTE *)(v40 + 24) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    v36 = MEMORY[0x24BEE4AF8];
LABEL_20:
    v49 = 0x205443454C4553;
    v50 = 0xE700000000000000;
    v47 = v36;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370FD0);
    sub_24454C180();
    sub_24456818C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    swift_bridgeObjectRelease();
    v47 = 0x204D4F524620;
    v48 = 0xE600000000000000;
    sub_24456821C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    swift_bridgeObjectRelease();
    v19 = v49;
    v20 = (void *)v50;
  }
LABEL_21:
  result._object = v20;
  result._countAndFlagsBits = v19;
  return result;
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSchemaDescribing.makeInsertStatementString(for:in:returningRowId:replacingIfNeeded:)(Swift::String a1, Swift::String_optional in, Swift::Bool returningRowId, Swift::Bool replacingIfNeeded)
{
  uint64_t v4;
  uint64_t v5;
  void *object;
  uint64_t countAndFlagsBits;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  char v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t *v27;
  unint64_t v28;
  char v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  Swift::String result;
  unint64_t v39;
  _BOOL4 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;

  v5 = v4;
  LODWORD(v43) = replacingIfNeeded;
  v40 = returningRowId;
  object = in.value._object;
  countAndFlagsBits = in.value._countAndFlagsBits;
  v8 = a1._object;
  v9 = a1._countAndFlagsBits;
  v10 = sub_2445680F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = v9;
  v52 = v8;
  if (qword_257370D08 != -1)
    swift_once();
  v47 = __swift_project_value_buffer(v10, (uint64_t)qword_257371248);
  sub_2445680E4();
  v46 = sub_244548248();
  sub_24456839C();
  v15 = v14;
  v45 = *(void (**)(char *, uint64_t))(v11 + 8);
  v45(v13, v10);
  if ((v15 & 1) == 0)
    goto LABEL_6;
  if (object)
  {
    v51 = countAndFlagsBits;
    v52 = object;
    sub_2445680E4();
    sub_24456839C();
    v17 = v16;
    v45(v13, v10);
    if ((v17 & 1) == 0)
    {
LABEL_6:
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v18 + 8) = 0;
      *(_QWORD *)(v18 + 16) = 0;
      *(_QWORD *)v18 = 10;
      *(_BYTE *)(v18 + 24) = 5;
      v19 = swift_willThrow();
      goto LABEL_23;
    }
    v51 = countAndFlagsBits;
    v52 = object;
    swift_bridgeObjectRetain();
    sub_24456821C();
    v39 = v51;
  }
  else
  {
    v39 = 0;
  }
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v41, v5);
  v22 = v44;
  v23 = sub_244551C58(v21);
  v42 = v22;
  swift_bridgeObjectRelease();
  v49 = 0;
  v50 = 0xE000000000000000;
  sub_2445683FC();
  swift_bridgeObjectRelease();
  v49 = 0x545245534E49;
  v50 = 0xE600000000000000;
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  sub_24456821C();
  v51 = v49;
  v52 = (void *)v50;
  v49 = v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257370FD0);
  v25 = sub_24454C180();
  sub_24456818C();
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  v26 = *(_QWORD *)(v23 + 16);
  if (v26)
  {
    v39 = v25;
    v41 = v24;
    v48 = MEMORY[0x24BEE4AF8];
    sub_244552D54(0, v26, 0);
    v43 = v23;
    v44 = v10;
    v27 = (unint64_t *)(v23 + 40);
    while (1)
    {
      v28 = *v27;
      v49 = *(v27 - 1);
      v50 = v28;
      swift_bridgeObjectRetain();
      sub_2445680E4();
      sub_24456839C();
      v30 = v29;
      v45(v13, v10);
      if ((v30 & 1) == 0)
        break;
      v49 = 64;
      v50 = 0xE100000000000000;
      sub_24456821C();
      swift_bridgeObjectRelease();
      v32 = v49;
      v31 = v50;
      v33 = v48;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_244552D54(0, *(_QWORD *)(v33 + 16) + 1, 1);
        v33 = v48;
      }
      v35 = *(_QWORD *)(v33 + 16);
      v34 = *(_QWORD *)(v33 + 24);
      if (v35 >= v34 >> 1)
      {
        sub_244552D54(v34 > 1, v35 + 1, 1);
        v33 = v48;
      }
      v27 += 2;
      *(_QWORD *)(v33 + 16) = v35 + 1;
      v36 = v33 + 16 * v35;
      *(_QWORD *)(v36 + 32) = v32;
      *(_QWORD *)(v36 + 40) = v31;
      --v26;
      v10 = v44;
      if (!v26)
      {
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
    }
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v37 + 8) = 0;
    *(_QWORD *)(v37 + 16) = 0;
    *(_QWORD *)v37 = 10;
    *(_BYTE *)(v37 + 24) = 5;
    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
    v19 = swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v33 = MEMORY[0x24BEE4AF8];
LABEL_20:
    v49 = v33;
    sub_24456818C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    if (v40)
      sub_24456821C();
    v19 = v51;
    v20 = v52;
  }
LABEL_23:
  result._object = v20;
  result._countAndFlagsBits = v19;
  return result;
}

uint64_t sub_244552D38(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_244552D70(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_244552D54(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_244552F18(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_244552D70(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257371088);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 56 * v8)
      memmove(v10 + 4, a4 + 4, 56 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 56 * v8 || v12 >= v13 + 56 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2445684C8();
  __break(1u);
  return result;
}

uint64_t sub_244552F18(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257371080);
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
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2445684C8();
  __break(1u);
  return result;
}

uint64_t sub_244553084(uint64_t a1, uint64_t a2, uint64_t a3, int a4, sqlite3_context *a5)
{
  uint64_t v8;

  if (sub_244568210())
  {
    swift_bridgeObjectRetain();
    sub_24456821C();
  }
  MEMORY[0x249511FD8](a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB8);
  sub_2445681D4();
  sub_24456821C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24456821C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = sub_2445681EC();
  swift_bridgeObjectRelease();
  sqlite3_result_error(a5, (const char *)(v8 + 32), a4);
  return swift_release();
}

uint64_t sub_2445531BC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint8_t *static SQLiteDatabase.openInMemoryConnection()()
{
  return sub_2445549D0();
}

uint8_t *static SQLiteDatabase.openConnection(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  return sub_244554D68(a1, a2, a3);
}

void sub_2445531EC(sqlite3 *a1)
{
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;
  NSObject *oslog;

  if (sqlite3_close_v2(a1))
  {
    if (qword_257370D10 != -1)
      swift_once();
    v1 = sub_244568180();
    __swift_project_value_buffer(v1, (uint64_t)qword_257371260);
    oslog = sub_244568168();
    v2 = sub_244568360();
    if (os_log_type_enabled(oslog, v2))
    {
      v3 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v3 = 67240192;
      sub_244568384();
      _os_log_impl(&dword_244545000, oslog, v2, "Close db connection failed with code %{public}d", v3, 8u);
      MEMORY[0x2495120E0](v3, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t SQLiteDatabase.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint8_t *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = swift_allocObject();
  *(_QWORD *)(v1 + 16) = 0;
  v2 = sub_2445549D0();
  if (v0)
  {
    swift_release();
  }
  else
  {
    *(_QWORD *)(v1 + 16) = v2;
    sub_244555454();
    if (qword_257370D10 != -1)
      swift_once();
    v4 = sub_244568180();
    __swift_project_value_buffer(v4, (uint64_t)qword_257371260);
    v5 = sub_244568168();
    v6 = sub_244568354();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_244545000, v5, v6, "In-memory db connection opened", v7, 2u);
      MEMORY[0x2495120E0](v7, -1, -1);
    }

  }
  return v1;
}

uint64_t SQLiteDatabase.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v2 = v0;
  *(_QWORD *)(v0 + 16) = 0;
  v3 = sub_2445549D0();
  if (v1)
  {
    swift_release();
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v3;
    sub_244555454();
    if (qword_257370D10 != -1)
      swift_once();
    v5 = sub_244568180();
    __swift_project_value_buffer(v5, (uint64_t)qword_257371260);
    v6 = sub_244568168();
    v7 = sub_244568354();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_244545000, v6, v7, "In-memory db connection opened", v8, 2u);
      MEMORY[0x2495120E0](v8, -1, -1);
    }

  }
  return v2;
}

uint64_t SQLiteDatabase.__allocating_init(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  v8 = sub_244554D68(a1, a2, a3);
  if (v3)
  {
    swift_release();
  }
  else
  {
    *(_QWORD *)(v7 + 16) = v8;
    sub_244555454();
  }
  v9 = sub_244568144();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
  return v7;
}

uint64_t SQLiteDatabase.init(_:readOnly:requiresAuthentication:)(uint64_t a1, char a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint8_t *v6;
  uint64_t v7;

  *(_QWORD *)(v3 + 16) = 0;
  v6 = sub_244554D68(a1, a2, a3);
  if (v4)
  {
    swift_release();
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v6;
    sub_244555454();
  }
  v7 = sub_244568144();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return v3;
}

uint64_t SQLiteDatabase.__allocating_init(connection:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SQLiteDatabase.init(connection:)(a1);
  return v2;
}

uint64_t SQLiteDatabase.init(connection:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v2 = v1;
  *(_QWORD *)(v1 + 16) = 0;
  if (a1)
  {
    *(_QWORD *)(v1 + 16) = a1;
  }
  else
  {
    if (qword_257370D10 != -1)
      swift_once();
    v3 = sub_244568180();
    __swift_project_value_buffer(v3, (uint64_t)qword_257371260);
    swift_retain();
    v4 = sub_244568168();
    v5 = sub_244568360();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      v12 = v7;
      *(_DWORD *)v6 = 136315138;
      type metadata accessor for SQLiteDatabase();
      swift_retain();
      v8 = sub_2445681D4();
      sub_244558788(v8, v9, &v12);
      sub_244568384();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_244545000, v4, v5, "Can't create %s from a nil connection", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495120E0](v7, -1, -1);
      MEMORY[0x2495120E0](v6, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v10 = 0xD00000000000002BLL;
    *(_QWORD *)(v10 + 8) = 0x8000000244569090;
    *(_QWORD *)(v10 + 16) = 0;
    *(_BYTE *)(v10 + 24) = 4;
    swift_willThrow();
  }
  return v2;
}

uint64_t SQLiteDatabase.deinit()
{
  uint64_t v0;
  sqlite3 *v1;

  v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_2445531EC(v1);
    *(_QWORD *)(v0 + 16) = 0;
  }
  return v0;
}

uint64_t SQLiteDatabase.__deallocating_deinit()
{
  uint64_t v0;
  sqlite3 *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  v1 = *(sqlite3 **)(v0 + 16);
  if (v1 && sqlite3_close_v2(v1))
  {
    if (qword_257370D10 != -1)
      swift_once();
    v2 = sub_244568180();
    __swift_project_value_buffer(v2, (uint64_t)qword_257371260);
    v3 = sub_244568168();
    v4 = sub_244568360();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v5 = 67240192;
      sub_244568384();
      _os_log_impl(&dword_244545000, v3, v4, "Close db connection failed with code %{public}d", v5, 8u);
      MEMORY[0x2495120E0](v5, -1, -1);
    }

  }
  return swift_deallocClassInstance();
}

uint64_t sub_244553A78()
{
  uint64_t v0;
  uint64_t result;

  result = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 16) = 0;
  return result;
}

uint64_t sub_244553A84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a2 + 8))(a3, a4, v4, ObjectType, a2);
}

void sub_244553AE8()
{
  uint64_t v0;
  sqlite3 *v1;

  v1 = *(sqlite3 **)(v0 + 16);
  if (v1)
  {
    sub_2445531EC(v1);
    *(_QWORD *)(v0 + 16) = 0;
  }
}

BOOL sub_244553B08()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16) != 0;
}

uint64_t sub_244553B18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  sqlite3 *v7;
  uint64_t v11;
  unsigned int v12;
  sqlite3_stmt *v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  sqlite3_stmt *ppStmt[2];

  v5 = v4;
  ppStmt[1] = *(sqlite3_stmt **)MEMORY[0x24BDAC8D0];
  v7 = *(sqlite3 **)(v5 + 16);
  if (v7)
  {
    ppStmt[0] = 0;
    v11 = sub_2445681EC();
    v12 = sqlite3_prepare_v2(v7, (const char *)(v11 + 32), -1, ppStmt, 0);
    swift_release();
    v13 = ppStmt[0];
    if (ppStmt[0] && !v12)
    {
      type metadata accessor for SQLiteStatement.Context();
      v14 = swift_allocObject();
      *(_QWORD *)(v14 + 16) = v5;
      *(_QWORD *)(v14 + 24) = v13;
      *(_QWORD *)a4 = v14;
      *(_QWORD *)(a4 + 8) = a1;
      *(_QWORD *)(a4 + 16) = a2;
      *(_OWORD *)(a4 + 24) = xmmword_24456A1A0;
      *(_BYTE *)(a4 + 40) = a3 & 1;
      swift_retain();
      return swift_bridgeObjectRetain();
    }
    sub_2445683FC();
    swift_bridgeObjectRelease();
    sub_2445684E0();
    sub_24456821C();
    swift_bridgeObjectRelease();
    if ((a3 & 1) != 0)
    {
      sub_24456821C();
      sub_24456821C();
      swift_bridgeObjectRelease();
    }
    v17 = sub_2445544F0(0xD000000000000028, 0x80000002445690C0);
    v19 = v18;
    swift_bridgeObjectRelease();
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v20 = v12;
    *(_QWORD *)(v20 + 8) = v17;
    *(_QWORD *)(v20 + 16) = v19;
    *(_BYTE *)(v20 + 24) = 0;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v16 + 8) = 0;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)v16 = 0;
    *(_BYTE *)(v16 + 24) = 5;
  }
  return swift_willThrow();
}

void sub_244553D58(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  _OWORD v9[2];
  __int128 v10;
  _OWORD v11[5];
  __int128 v12;
  _OWORD v13[3];

  v3 = sub_244553B18(0xD000000000000012, 0x80000002445690F0, 0, (uint64_t)&v8);
  if (!v1)
  {
    v12 = v8;
    v13[0] = v9[0];
    *(_OWORD *)((char *)v13 + 9) = *(_OWORD *)((char *)v9 + 9);
    MEMORY[0x24BDAC7A8](v3);
    v6 = v8;
    v7[0] = v9[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v9 + 9);
    sub_244557F64((uint64_t *)&v6, (void (*)(uint64_t *))sub_244555690);
    v4 = sub_24454ABFC((uint64_t)&v12);
    a1(v4);
    v5 = sub_244553B18(0x3B54494D4D4F43, 0xE700000000000000, 0, (uint64_t)&v8);
    v10 = v8;
    v11[0] = v9[0];
    *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v9 + 9);
    MEMORY[0x24BDAC7A8](v5);
    v6 = v10;
    v7[0] = v11[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v11 + 9);
    sub_244557F64((uint64_t *)&v6, (void (*)(uint64_t *))sub_2445559B4);
    sub_24454ABFC((uint64_t)&v10);
  }
}

unint64_t sub_2445544F0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  sqlite3 *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v3 = *(sqlite3 **)(v2 + 16);
  if (v3)
  {
    v17 = a1;
    v18 = a2;
    swift_bridgeObjectRetain();
    if (sqlite3_errmsg(v3))
    {
      v4 = sub_244568228();
      v6 = HIBYTE(v5) & 0xF;
      if ((v5 & 0x2000000000000000) == 0)
        v6 = v4 & 0xFFFFFFFFFFFFLL;
      if (!v6)
        swift_bridgeObjectRelease();
      v15 = 8236;
      v16 = 0xE200000000000000;
      sub_24456821C();
      swift_bridgeObjectRelease();
      sub_24456821C();
      swift_bridgeObjectRelease();
    }
    if (qword_257370D10 != -1)
      swift_once();
    v7 = sub_244568180();
    __swift_project_value_buffer(v7, (uint64_t)qword_257371260);
    v9 = v17;
    v8 = v18;
    swift_bridgeObjectRetain_n();
    v10 = sub_244568168();
    v11 = sub_244568360();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_244558788(v9, v8, &v15);
      sub_244568384();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244545000, v10, v11, "%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495120E0](v13, -1, -1);
      MEMORY[0x2495120E0](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    return v17;
  }
  else
  {
    v16 = 0x8000000244569130;
    sub_24456821C();
    return 0xD000000000000014;
  }
}

uint64_t sub_244554764()
{
  uint64_t v0;
  uint64_t result;

  result = sub_244555454();
  if (!v0)
    return swift_retain();
  return result;
}

void sub_244554788(sqlite3_context *a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  sqlite3_value *v6;
  sqlite3_value *v7;
  double v8;
  sqlite3_value *v9;
  double v10;
  double v11;

  if (a1)
  {
    v4 = Array<A>.init(_:argc:)(a3, a2);
    v5 = v4;
    if (*(_QWORD *)(v4 + 16))
    {
      v6 = *(sqlite3_value **)(v4 + 32);
      if (sqlite3_value_type(v6) != 2 && sqlite3_value_type(v6) != 1)
        goto LABEL_11;
      if (*(_QWORD *)(v5 + 16) >= 2uLL)
      {
        v7 = *(sqlite3_value **)(v5 + 40);
        if (sqlite3_value_type(v7) == 2 || sqlite3_value_type(v7) == 1)
        {
          v8 = sqlite3_value_double(*(sqlite3_value **)(v5 + 32));
          v9 = *(sqlite3_value **)(v5 + 40);
          swift_bridgeObjectRelease();
          v10 = sqlite3_value_double(v9);
          v11 = pow(v8, v10);
LABEL_12:
          sqlite3_result_double(a1, v11);
          return;
        }
LABEL_11:
        swift_bridgeObjectRelease();
        v11 = 0.0;
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_2445548D8(sqlite3_context *a1, int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  sqlite3_value *v6;
  sqlite3_value *v7;
  double v8;
  double v9;

  if (a1)
  {
    v4 = Array<A>.init(_:argc:)(a3, a2);
    v5 = v4;
    if (*(_QWORD *)(v4 + 16))
    {
      v6 = *(sqlite3_value **)(v4 + 32);
      if (sqlite3_value_type(v6) == 2 || sqlite3_value_type(v6) == 1)
      {
        v7 = *(sqlite3_value **)(v5 + 32);
        swift_bridgeObjectRelease();
        v8 = sqlite3_value_double(v7);
        v9 = exp(v8);
      }
      else
      {
        swift_bridgeObjectRelease();
        v9 = 0.0;
      }
      sqlite3_result_double(a1, v9);
    }
    else
    {
      __break(1u);
    }
  }
}

uint8_t *sub_2445549D0()
{
  uint8_t *v0;
  uint8_t *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  sqlite3 *ppDb[2];

  ppDb[1] = *(sqlite3 **)MEMORY[0x24BDAC8D0];
  if (sqlite3_threadsafe() != 2)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = 1;
    v8 = 5;
LABEL_9:
    *(_BYTE *)(v7 + 24) = v8;
LABEL_10:
    swift_willThrow();
    return v0;
  }
  ppDb[0] = 0;
  v1 = (uint8_t *)sqlite3_open(":memory:", ppDb);
  if ((_DWORD)v1)
  {
    v0 = v1;
    if (qword_257370D10 != -1)
      swift_once();
    v2 = sub_244568180();
    __swift_project_value_buffer(v2, (uint64_t)qword_257371260);
    v3 = sub_244568168();
    v4 = sub_244568360();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v5 = 67109120;
      sub_244568384();
      _os_log_impl(&dword_244545000, v3, v4, "Error %d occurred while opening in-memory db connection", v5, 8u);
      MEMORY[0x2495120E0](v5, -1, -1);
    }

    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v6 = v0;
    *(_QWORD *)(v6 + 8) = 0xD000000000000026;
    *(_QWORD *)(v6 + 16) = 0x8000000244569280;
    *(_BYTE *)(v6 + 24) = 0;
    goto LABEL_10;
  }
  v0 = (uint8_t *)ppDb[0];
  if (!ppDb[0])
  {
    if (qword_257370D10 != -1)
      swift_once();
    v14 = sub_244568180();
    __swift_project_value_buffer(v14, (uint64_t)qword_257371260);
    v15 = sub_244568168();
    v16 = sub_244568360();
    if (os_log_type_enabled(v15, v16))
    {
      v0 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_244545000, v15, v16, "Failed to open in-memory db connection", v0, 2u);
      MEMORY[0x2495120E0](v0, -1, -1);
    }

    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000026;
    *(_QWORD *)(v7 + 8) = 0x8000000244569280;
    *(_QWORD *)(v7 + 16) = 0;
    v8 = 4;
    goto LABEL_9;
  }
  if (qword_257370D10 != -1)
    swift_once();
  v10 = sub_244568180();
  __swift_project_value_buffer(v10, (uint64_t)qword_257371260);
  v11 = sub_244568168();
  v12 = sub_244568354();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_244545000, v11, v12, "In-memory db connection opened", v13, 2u);
    MEMORY[0x2495120E0](v13, -1, -1);
  }

  return v0;
}

uint8_t *sub_244554D68(uint64_t a1, char a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  sqlite3 *ppDb[2];

  ppDb[1] = *(sqlite3 **)MEMORY[0x24BDAC8D0];
  v6 = sub_244568144();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint8_t *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v53 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v53 - v14;
  if (sqlite3_threadsafe() != 2)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v31 + 8) = 0;
    *(_QWORD *)(v31 + 16) = 0;
    *(_QWORD *)v31 = 1;
    v32 = 5;
LABEL_14:
    *(_BYTE *)(v31 + 24) = v32;
LABEL_24:
    swift_willThrow();
    return v10;
  }
  v56 = v7;
  v16 = v6;
  if ((a3 & 1) != 0)
    v17 = 3145728;
  else
    v17 = 0;
  if ((a2 & 1) != 0)
    v18 = 65537;
  else
    v18 = 65542;
  v19 = v18 | v17;
  ppDb[0] = 0;
  sub_244568138();
  v20 = sub_2445681EC();
  swift_bridgeObjectRelease();
  v21 = sqlite3_open_v2((const char *)(v20 + 32), ppDb, v19, 0);
  swift_release();
  if (v21)
  {
    if (qword_257370D10 != -1)
      swift_once();
    v22 = sub_244568180();
    __swift_project_value_buffer(v22, (uint64_t)qword_257371260);
    v23 = v56;
    v24 = v16;
    (*(void (**)(uint8_t *, uint64_t, uint64_t))(v56 + 16))(v10, a1, v16);
    v25 = sub_244568168();
    v26 = sub_244568360();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v58 = v28;
      *(_DWORD *)v27 = 67109378;
      LODWORD(v57) = v21;
      sub_244568384();
      *(_WORD *)(v27 + 8) = 2080;
      v55 = v24;
      v29 = sub_244568138();
      v57 = sub_244558788(v29, v30, &v58);
      sub_244568384();
      swift_bridgeObjectRelease();
      (*(void (**)(uint8_t *, uint64_t))(v23 + 8))(v10, v55);
      _os_log_impl(&dword_244545000, v25, v26, "Error %d occurred while opening db connection: %s", (uint8_t *)v27, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x2495120E0](v28, -1, -1);
      MEMORY[0x2495120E0](v27, -1, -1);
    }
    else
    {
      (*(void (**)(uint8_t *, uint64_t))(v23 + 8))(v10, v16);
    }

    if (ppDb[0])
      sub_2445531EC(ppDb[0]);
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v43 = v21;
    *(_QWORD *)(v43 + 8) = 0xD00000000000001CLL;
    *(_QWORD *)(v43 + 16) = 0x8000000244569220;
    *(_BYTE *)(v43 + 24) = 0;
    goto LABEL_24;
  }
  v10 = (uint8_t *)ppDb[0];
  if (!ppDb[0])
  {
    v45 = v16;
    if (qword_257370D10 != -1)
      swift_once();
    v46 = sub_244568180();
    __swift_project_value_buffer(v46, (uint64_t)qword_257371260);
    v47 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v13, a1, v45);
    v48 = sub_244568168();
    v49 = sub_244568360();
    if (os_log_type_enabled(v48, v49))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      v58 = v50;
      *(_DWORD *)v10 = 136315138;
      v55 = v45;
      v51 = sub_244568138();
      v57 = sub_244558788(v51, v52, &v58);
      sub_244568384();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v55);
      _os_log_impl(&dword_244545000, v48, v49, "Failed to open db connection with no error: %s", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495120E0](v50, -1, -1);
      MEMORY[0x2495120E0](v10, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v13, v45);
    }

    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v31 = 0xD00000000000002ALL;
    *(_QWORD *)(v31 + 8) = 0x8000000244569240;
    *(_QWORD *)(v31 + 16) = 0;
    v32 = 4;
    goto LABEL_14;
  }
  v33 = v16;
  if (qword_257370D10 != -1)
    swift_once();
  v34 = sub_244568180();
  __swift_project_value_buffer(v34, (uint64_t)qword_257371260);
  v35 = v56;
  (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v15, a1, v33);
  v36 = sub_244568168();
  v37 = sub_244568354();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = swift_slowAlloc();
    v55 = v33;
    v39 = (uint8_t *)v38;
    v54 = swift_slowAlloc();
    v58 = v54;
    *(_DWORD *)v39 = 136315138;
    v53 = v39 + 4;
    v40 = sub_244568138();
    v57 = sub_244558788(v40, v41, &v58);
    sub_244568384();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v55);
    _os_log_impl(&dword_244545000, v36, v37, "DB connection opened %s", v39, 0xCu);
    v42 = v54;
    swift_arrayDestroy();
    MEMORY[0x2495120E0](v42, -1, -1);
    MEMORY[0x2495120E0](v39, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v33);
  }

  return v10;
}

uint64_t sub_244555454()
{
  uint64_t v0;
  uint64_t v1;
  int function;
  unsigned int v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = v0;
  function = sqlite3_create_function(*(sqlite3 **)(v0 + 16), "power", 2, 5, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_2445548D4, 0, 0);
  if (function)
  {
    v3 = function;
    sub_2445683FC();
    swift_bridgeObjectRelease();
    sub_2445684E0();
    sub_24456821C();
    swift_bridgeObjectRelease();
    v4 = sub_2445544F0(0xD000000000000021, 0x80000002445691B0);
    v6 = v5;
    swift_bridgeObjectRelease();
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = v3;
LABEL_5:
    *(_QWORD *)(v7 + 8) = v4;
    *(_QWORD *)(v7 + 16) = v6;
    *(_BYTE *)(v7 + 24) = 0;
    swift_willThrow();
    return v1;
  }
  if (sqlite3_create_function(*(sqlite3 **)(v0 + 16), "exp", 1, 5, 0, (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_2445549CC, 0, 0))
  {
    sub_2445683FC();
    swift_bridgeObjectRelease();
    sub_2445684E0();
    sub_24456821C();
    swift_bridgeObjectRelease();
    v4 = sub_2445544F0(0xD00000000000001FLL, 0x80000002445691E0);
    v6 = v8;
    swift_bridgeObjectRelease();
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0;
    goto LABEL_5;
  }
  return v1;
}

uint64_t type metadata accessor for SQLiteDatabase()
{
  return objc_opt_self();
}

uint64_t sub_244555690(uint64_t a1)
{
  uint64_t v1;

  return sub_244557978(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2445556A8()
{
  return swift_bridgeObjectRelease();
}

unint64_t sub_2445556B0()
{
  unint64_t result;

  result = qword_257371090;
  if (!qword_257371090)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteDatabase.TransactionError, &type metadata for SQLiteDatabase.TransactionError);
    atomic_store(result, (unint64_t *)&qword_257371090);
  }
  return result;
}

uint64_t method lookup function for SQLiteDatabase()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteDatabase.unsafeConnection()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init(_:readOnly:requiresAuthentication:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of SQLiteDatabase.__allocating_init(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SQLiteDatabase.detachConnection()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SQLiteDatabase.register(_:withName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteDatabase.close()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteDatabase.isOpen()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SQLiteDatabase.statement(with:verboseLog:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteDatabase.transaction(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SQLiteDatabase.logAndReturnSQLErrorMessage(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SQLiteDatabase.registerMathFunctions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t sub_2445557F8()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SQLiteDatabase.TransactionError()
{
  return sub_2445556A8();
}

uint64_t _s12PoirotSQLite14SQLiteDatabaseC16TransactionErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_2445557F8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for SQLiteDatabase.TransactionError(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_2445557F8();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_2445556A8();
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

uint64_t assignWithTake for SQLiteDatabase.TransactionError(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_2445556A8();
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteDatabase.TransactionError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteDatabase.TransactionError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_244555990(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_244555998(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDatabase.TransactionError()
{
  return &type metadata for SQLiteDatabase.TransactionError;
}

uint64_t sub_2445559B4(uint64_t a1)
{
  return sub_244555690(a1);
}

void sub_2445559C8(uint64_t a1, uint64_t a2, sqlite3_context *a3)
{
  const char *v3;
  int64_t v5;
  int v6;
  void (__cdecl *v7)(void *);
  sqlite3_context *v8;
  char *v9;
  int v10;
  int64_t v11;
  int64_t v12;
  char __s[8];
  uint64_t v14;

  if ((a2 & 0x1000000000000000) == 0 && a2 & 0x2000000000000000 | a1 & 0x1000000000000000)
  {
    if ((a2 & 0x2000000000000000) != 0)
    {
      *(_QWORD *)__s = a1;
      v14 = a2 & 0xFFFFFFFFFFFFFFLL;
      v11 = strlen(__s);
      if (v11 >= (uint64_t)0xFFFFFFFF80000000)
      {
        LODWORD(v3) = v11;
        if (v11 <= 0x7FFFFFFF)
        {
          if (qword_257370D20 == -1)
          {
LABEL_14:
            v7 = (void (__cdecl *)(void *))qword_2573710A0;
            v9 = __s;
            v8 = a3;
LABEL_15:
            v10 = (int)v3;
LABEL_16:
            sqlite3_result_text(v8, v9, v10, v7);
            return;
          }
LABEL_27:
          swift_once();
          goto LABEL_14;
        }
        goto LABEL_25;
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    if ((a1 & 0x1000000000000000) != 0)
    {
      v3 = (const char *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      goto LABEL_6;
    }
    v3 = (const char *)sub_244568420();
    if (v3)
    {
LABEL_6:
      v5 = strlen(v3);
      if (v5 >= (uint64_t)0xFFFFFFFF80000000)
      {
        v6 = v5;
        if (v5 <= 0x7FFFFFFF)
        {
          if (qword_257370D20 != -1)
            swift_once();
          v7 = (void (__cdecl *)(void *))qword_2573710A0;
          v8 = a3;
          v9 = (char *)v3;
          v10 = v6;
          goto LABEL_16;
        }
        goto LABEL_26;
      }
      goto LABEL_24;
    }
    v12 = strlen(0);
    if (v12 < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else
    {
      LODWORD(v3) = v12;
      if (v12 <= 0x7FFFFFFF)
      {
        if (qword_257370D20 == -1)
        {
LABEL_22:
          v7 = (void (__cdecl *)(void *))qword_2573710A0;
          v8 = a3;
          v9 = 0;
          goto LABEL_15;
        }
LABEL_30:
        swift_once();
        goto LABEL_22;
      }
    }
    __break(1u);
    goto LABEL_30;
  }
  sub_2445683F0();
}

uint64_t SQLiteContext.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

Swift::Void __swiftcall SQLiteContext.setError(message:code:)(Swift::String message, Swift::Int32 code)
{
  sqlite3_context **v2;
  sqlite3_context *v4;
  uint64_t v5;

  v4 = *v2;
  v5 = sub_2445681EC();
  sqlite3_result_error(v4, (const char *)(v5 + 32), code);
  swift_release();
}

uint64_t SQLiteContext.setError<A>(_:message:code:)(uint64_t a1, uint64_t a2, unint64_t a3, int a4, uint64_t a5)
{
  sqlite3_context **v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  sqlite3_context *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;

  v11 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *v5;
  if (sub_244568210())
  {
    v19 = a2;
    v20 = a3;
    swift_bridgeObjectRetain();
    sub_24456821C();
    v16 = v19;
    v15 = v20;
  }
  else
  {
    v16 = 0;
    v15 = 0xE000000000000000;
  }
  v19 = 0x203A726F727245;
  v20 = 0xE700000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, a5);
  sub_2445681D4();
  sub_24456821C();
  swift_bridgeObjectRelease();
  v19 = v16;
  v20 = v15;
  swift_bridgeObjectRetain();
  sub_24456821C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v17 = sub_2445681EC();
  swift_bridgeObjectRelease();
  sqlite3_result_error(v14, (const char *)(v17 + 32), a4);
  return swift_release();
}

Swift::Void __swiftcall SQLiteContext.setDouble(_:)(Swift::Double a1)
{
  sqlite3_context **v1;

  sqlite3_result_double(*v1, a1);
}

void *(__cdecl *static SQLiteConstructor.sqlite.block.getter())(int)
{
  return j__sqlite3_malloc;
}

void sub_244555D8C()
{
  qword_257371098 = 0;
}

uint64_t SQLiteDestructor.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

_QWORD *static SQLiteDestructor.none.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_244555E20(&qword_257370D18, &qword_257371098, a1);
}

uint64_t sub_244555DBC()
{
  uint64_t result;

  if (qword_257370D00 != -1)
    result = swift_once();
  qword_2573710A0 = qword_257371240;
  return result;
}

_QWORD *static SQLiteDestructor.transient.getter@<X0>(_QWORD *a1@<X8>)
{
  return sub_244555E20(&qword_257370D20, &qword_2573710A0, a1);
}

_QWORD *sub_244555E20@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, _QWORD *a3@<X8>)
{
  if (*result != -1)
    result = (_QWORD *)swift_once();
  *a3 = *a2;
  return result;
}

void static SQLiteDestructor.sqlite.getter(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEDE148];
}

uint64_t SQLiteDestructor.block.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t SQLiteContext.context.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

Swift::Void __swiftcall SQLiteContext.setSubtype(_:)(Swift::UInt32 a1)
{
  sqlite3_context **v1;

  sqlite3_result_subtype(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setInt32(_:)(Swift::Int32 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setInt64(_:)(Swift::Int64 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int64(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt(_:)(Swift::Int a1)
{
  sqlite3_context **v1;

  sqlite3_result_int64(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt(_:)(Swift::UInt a1)
{
  sub_244556028(a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt8(_:)(Swift::Int8 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt8(_:)(Swift::UInt8 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setInt16(_:)(Swift::Int16 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt16(_:)(Swift::UInt16 a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt32(_:)(Swift::UInt32 a1)
{
  sqlite3_context **v1;
  uint64_t v2;

  if ((a1 & 0x80000000) != 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    swift_willThrow();
  }
  else
  {
    sqlite3_result_int(*v1, a1);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteContext.setUInt64(_:)(Swift::UInt64 a1)
{
  sub_244556028(a1);
}

void sub_244556028(sqlite3_int64 a1)
{
  sqlite3_context **v1;
  uint64_t v2;

  if (a1 < 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v2 + 8) = 0;
    *(_QWORD *)(v2 + 16) = 0;
    *(_QWORD *)v2 = 8;
    *(_BYTE *)(v2 + 24) = 5;
    swift_willThrow();
  }
  else
  {
    sqlite3_result_int64(*v1, a1);
  }
}

Swift::Void __swiftcall SQLiteContext.setBool(_:)(Swift::Bool a1)
{
  sqlite3_context **v1;

  sqlite3_result_int(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setFloat(_:)(Swift::Float a1)
{
  sqlite3_context **v1;

  sqlite3_result_double(*v1, a1);
}

Swift::Void __swiftcall SQLiteContext.setString(_:)(Swift::String_optional a1)
{
  sqlite3_context **v1;

  if (a1.value._object)
    sub_2445559C8(a1.value._countAndFlagsBits, (uint64_t)a1.value._object, *v1);
  else
    sqlite3_result_null(*v1);
}

Swift::Void __swiftcall SQLiteContext.setNull()()
{
  sqlite3_context **v0;

  sqlite3_result_null(*v0);
}

void sub_244556100(const char *a1, sqlite3_context *a2)
{
  int v2;
  int64_t v5;

  v5 = strlen(a1);
  if (v5 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_6;
  }
  v2 = v5;
  if (v5 > 0x7FFFFFFF)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (qword_257370D20 != -1)
LABEL_7:
    swift_once();
  sqlite3_result_text(a2, a1, v2, (void (__cdecl *)(void *))qword_2573710A0);
}

void SQLiteContext.setData(_:destructor:)(uint64_t a1, unint64_t a2)
{
  sqlite3_context **v2;

  if (a2 >> 60 != 15)
    __asm { BR              X10 }
  sqlite3_result_null(*v2);
}

uint64_t sub_24455646C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24454F0C8(a1, a2);
  return a1;
}

uint64_t sub_244556480(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24454F10C(a1, a2);
  return a1;
}

void SQLiteContext.setBuffer(_:ofSize:destructor:)(void *a1, uint64_t a2, void (__cdecl **a3)(void *))
{
  sqlite3_context **v3;

  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    sqlite3_result_blob(*v3, a1, a2, *a3);
    return;
  }
  __break(1u);
}

ValueMetadata *type metadata accessor for SQLiteConstructor()
{
  return &type metadata for SQLiteConstructor;
}

ValueMetadata *type metadata accessor for SQLiteConstructor.sqlite()
{
  return &type metadata for SQLiteConstructor.sqlite;
}

uint64_t getEnumTagSinglePayload for SQLiteDestructor(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteDestructor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
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
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteDestructor()
{
  return &type metadata for SQLiteDestructor;
}

ValueMetadata *type metadata accessor for SQLiteContext()
{
  return &type metadata for SQLiteContext;
}

uint64_t sub_244556590(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

void sub_2445565B0(const char *a1)
{
  uint64_t v1;

  sub_244556100(a1, *(sqlite3_context **)(v1 + 16));
}

uint64_t static SQLiteUndefined.sqlColumnType.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = byte_2573710A8;
  return result;
}

uint64_t static SQLiteUndefined.sqlColumnType.setter(char *a1)
{
  char v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  byte_2573710A8 = v1;
  return result;
}

uint64_t (*static SQLiteUndefined.sqlColumnType.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t static SQLiteUndefined.sqlNullable.getter()
{
  swift_beginAccess();
  return byte_2573710A9;
}

uint64_t static SQLiteUndefined.sqlNullable.setter(char a1)
{
  uint64_t result;

  result = swift_beginAccess();
  byte_2573710A9 = a1;
  return result;
}

uint64_t (*static SQLiteUndefined.sqlNullable.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteUndefined.getSQLDataType()()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD00000000000003ALL;
  *(_QWORD *)(v0 + 8) = 0x80000002445692B0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

double SQLiteUndefined.unwrapIfOptional()@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t static SQLiteUndefined.create(from:at:nullable:)()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD000000000000024;
  *(_QWORD *)(v0 + 8) = 0x80000002445692F0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

uint64_t SQLiteUndefined.bind(to:at:)()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD00000000000002FLL;
  *(_QWORD *)(v0 + 8) = 0x8000000244569320;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

unint64_t static SQLiteUndefined.create(from:)@<X0>(uint64_t a1@<X8>)
{
  unint64_t result;

  *(_QWORD *)(a1 + 24) = &type metadata for SQLiteUndefined;
  result = sub_2445471D8();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t static SQLiteUndefined.== infix(_:_:)()
{
  return 1;
}

uint64_t SQLiteUndefined.hashValue.getter()
{
  sub_244568564();
  return sub_244568588();
}

uint64_t sub_24455692C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = byte_2573710A8;
  return result;
}

uint64_t sub_244556974()
{
  swift_beginAccess();
  return byte_2573710A9;
}

uint64_t sub_2445569B4()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD00000000000003ALL;
  *(_QWORD *)(v0 + 8) = 0x80000002445692B0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

double sub_244556A20@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_244556A30()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD000000000000024;
  *(_QWORD *)(v0 + 8) = 0x80000002445692F0;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

void sub_244556A9C(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
}

uint64_t sub_244556AA4()
{
  uint64_t v0;

  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v0 = 0xD00000000000002FLL;
  *(_QWORD *)(v0 + 8) = 0x8000000244569320;
  *(_QWORD *)(v0 + 16) = 0;
  *(_BYTE *)(v0 + 24) = 4;
  return swift_willThrow();
}

uint64_t sub_244556B10()
{
  sub_244568564();
  return sub_244568588();
}

uint64_t sub_244556B44()
{
  sub_244568564();
  return sub_244568588();
}

unint64_t sub_244556B74(uint64_t a1)
{
  unint64_t result;

  result = sub_244556B98();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244556B98()
{
  unint64_t result;

  result = qword_2573710B0;
  if (!qword_2573710B0)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteUndefined, &type metadata for SQLiteUndefined);
    atomic_store(result, (unint64_t *)&qword_2573710B0);
  }
  return result;
}

unint64_t sub_244556BE0()
{
  unint64_t result;

  result = qword_2573710B8;
  if (!qword_2573710B8)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteUndefined, &type metadata for SQLiteUndefined);
    atomic_store(result, (unint64_t *)&qword_2573710B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteUndefined()
{
  return &type metadata for SQLiteUndefined;
}

void SQLiteStatement.nextRow()(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  sqlite3_stmt *v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[4];

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
LABEL_16:
    sub_2445470A0();
    swift_allocError();
    v16 = 4;
    goto LABEL_17;
  }
  v5 = *(sqlite3_stmt **)(v3 + 24);
  if (!v5)
  {
    sub_2445470A0();
    swift_allocError();
    v16 = 3;
LABEL_17:
    *(_QWORD *)(v15 + 8) = 0;
    *(_QWORD *)(v15 + 16) = 0;
    *(_QWORD *)v15 = v16;
    *(_BYTE *)(v15 + 24) = 5;
    goto LABEL_18;
  }
  v7 = v1[1];
  v6 = v1[2];
  v8 = *((unsigned __int8 *)v1 + 40);
  v9 = sqlite3_step(v5);
  if (v9 == 100)
  {
    *a1 = v3;
    swift_retain();
    return;
  }
  v10 = v9;
  if (v9 != 101)
  {
    v17 = *(_QWORD *)(v3 + 16);
    if (v17 && *(_QWORD *)(v17 + 16))
    {
      swift_retain();
      sub_2445683FC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_24456821C();
      swift_bridgeObjectRelease();
      v18 = sub_2445544F0(0xD000000000000025, 0x8000000244569350);
      v20 = v19;
      swift_release();
      swift_bridgeObjectRelease();
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)v21 = v10;
      *(_QWORD *)(v21 + 8) = v18;
      *(_QWORD *)(v21 + 16) = v20;
      *(_BYTE *)(v21 + 24) = 0;
LABEL_18:
      swift_willThrow();
      return;
    }
    goto LABEL_16;
  }
  if (v8)
  {
    if (qword_257370D10 != -1)
      swift_once();
    v11 = sub_244568180();
    __swift_project_value_buffer(v11, (uint64_t)qword_257371260);
    swift_retain();
    swift_bridgeObjectRetain();
    v12 = sub_244568168();
    v13 = sub_244568348();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v23[0] = v22;
      *(_DWORD *)v14 = 136315138;
      swift_bridgeObjectRetain();
      v23[3] = sub_244558788(v7, v6, v23);
      sub_244568384();
      swift_release();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_244545000, v12, v13, "SQL statement executed: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2495120E0](v22, -1, -1);
      MEMORY[0x2495120E0](v14, -1, -1);

      *a1 = 0;
      return;
    }

    swift_bridgeObjectRelease();
    swift_release();
  }
  *a1 = 0;
}

uint64_t SQLiteStatement.bind(_:withName:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  _QWORD *v24;

  v24 = a2;
  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = *((_BYTE *)v2 + 40);
  v18 = *v2;
  v19 = v6;
  v20 = v7;
  v21 = v8;
  v22 = v9;
  v23 = v10;
  result = sub_2445573FC();
  if (!v3)
  {
    v12 = result;
    if (result)
    {
      v17 = a1[4];
      v13 = a1;
      v14 = a1[3];
      __swift_project_boxed_opaque_existential_1(v13, v14);
      v18 = v5;
      v19 = v6;
      v20 = v7;
      v21 = v8;
      v22 = v9;
      v23 = v10;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v17 + 8))(&v18, v12, v14);
      v15 = v24;
      *v24 = v5;
      v15[1] = v6;
      v15[2] = v7;
      v15[3] = v8;
      v15[4] = v9;
      *((_BYTE *)v15 + 40) = v10;
      swift_retain();
      return swift_bridgeObjectRetain();
    }
    else
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v16 + 8) = 0;
      *(_QWORD *)(v16 + 16) = 0;
      *(_QWORD *)v16 = 9;
      *(_BYTE *)(v16 + 24) = 5;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t SQLiteStatement.bindIfAny(_:withName:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  _QWORD *v23;

  v23 = a2;
  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  v8 = v2[3];
  v9 = v2[4];
  v10 = *((_BYTE *)v2 + 40);
  v17 = *v2;
  v18 = v6;
  v19 = v7;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  result = sub_2445573FC();
  if (!v3)
  {
    v12 = result;
    if (result)
    {
      v16 = a1[4];
      v13 = a1;
      v14 = a1[3];
      __swift_project_boxed_opaque_existential_1(v13, v14);
      v17 = v5;
      v18 = v6;
      v19 = v7;
      v20 = v8;
      v21 = v9;
      v22 = v10;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v16 + 8))(&v17, v12, v14);
    }
    v15 = v23;
    *v23 = v5;
    v15[1] = v6;
    v15[2] = v7;
    v15[3] = v8;
    v15[4] = v9;
    *((_BYTE *)v15 + 40) = v10;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t SQLiteStatement.expectAtMostOneRow()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = xmmword_24456A100;
  *(_BYTE *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();
  return swift_retain();
}

void SQLiteStatement.forEach(_:)(void (*a1)(uint64_t *))
{
  __int128 *v1;
  uint64_t v2;
  char v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  char v7;

  v2 = *((_QWORD *)v1 + 2);
  v3 = *((_BYTE *)v1 + 40);
  v4 = *v1;
  v5 = v2;
  v6 = *(__int128 *)((char *)v1 + 24);
  v7 = v3;
  sub_244557F64((uint64_t *)&v4, a1);
}

void SQLiteStatement.reduce<A>(into:handleRow:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  uint64_t v13;
  char v14;

  v10 = v3[1];
  v11 = *v3;
  v7 = *((_QWORD *)v3 + 4);
  v8 = *((_BYTE *)v3 + 40);
  v9 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, a1, a2);
  v12[0] = v11;
  v12[1] = v10;
  v13 = v7;
  v14 = v8;
  sub_244557F64((uint64_t *)v12, (void (*)(uint64_t *))sub_244558858);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, a2);
}

double SQLiteStatement.init(database:statement:sqlString:verboseLog:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t v12;
  double result;

  type metadata accessor for SQLiteStatement.Context();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  *(_QWORD *)a6 = v12;
  *(_QWORD *)(a6 + 8) = a3;
  *(_QWORD *)(a6 + 16) = a4;
  result = 0.0;
  *(_OWORD *)(a6 + 24) = xmmword_24456A1A0;
  *(_BYTE *)(a6 + 40) = a5;
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteStatement.execute()()
{
  _OWORD *v0;
  __int128 v1;
  __int128 v2;
  __int128 v3;
  _OWORD v4[3];
  _OWORD v5[2];

  v1 = v0[1];
  v4[2] = *v0;
  v5[0] = v1;
  *(_OWORD *)((char *)v5 + 9) = *(_OWORD *)((char *)v0 + 25);
  v2 = v0[1];
  v3 = *v0;
  v4[0] = v2;
  *(_OWORD *)((char *)v4 + 9) = *(_OWORD *)((char *)v0 + 25);
  sub_244557F64((uint64_t *)&v3, (void (*)(uint64_t *))sub_244555690);
}

uint64_t sub_2445573CC()
{
  uint64_t v0;
  sqlite3_stmt *v1;

  v1 = *(sqlite3_stmt **)(v0 + 24);
  if (v1)
    sqlite3_finalize(v1);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2445573FC()
{
  uint64_t v0;
  uint64_t v1;
  sqlite3_stmt *v2;
  uint64_t v3;
  int v4;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  if (v1 && *(_QWORD *)(v1 + 16))
  {
    v2 = *(sqlite3_stmt **)(*(_QWORD *)v0 + 24);
    if (v2)
    {
      v3 = sub_2445681EC();
      v4 = sqlite3_bind_parameter_index(v2, (const char *)(v3 + 32));
      swift_release();
      return v4;
    }
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
  }
  *(_QWORD *)v6 = v7;
  *(_QWORD *)(v6 + 8) = 0;
  *(_QWORD *)(v6 + 16) = 0;
  *(_BYTE *)(v6 + 24) = 5;
  return swift_willThrow();
}

uint64_t SQLiteStatement.bind(_:at:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v16[5];
  char v17;
  uint64_t v18;

  v5 = *v3;
  v4 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9 = *((_BYTE *)v3 + 40);
  v10 = a1[3];
  v11 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v10);
  v16[0] = v5;
  v16[1] = v4;
  v16[2] = v6;
  v16[3] = v7;
  v16[4] = v8;
  v17 = v9;
  v12 = v18;
  result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v11 + 8))(v16, a2, v10, v11);
  if (!v12)
  {
    *(_QWORD *)a3 = v5;
    *(_QWORD *)(a3 + 8) = v4;
    *(_QWORD *)(a3 + 16) = v6;
    *(_QWORD *)(a3 + 24) = v7;
    *(_QWORD *)(a3 + 32) = v8;
    *(_BYTE *)(a3 + 40) = v9;
    swift_retain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t SQLiteStatement.bind(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return SQLiteStatement.bind(_:)(a1, a2);
}

{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[5];
  char v18;
  uint64_t v19;

  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v5 = 0;
    v19 = *v2;
    v6 = v2[2];
    v15 = v2[3];
    v16 = v2[1];
    v14 = v2[4];
    v7 = (_QWORD *)(a1 + 32);
    v8 = *((_BYTE *)v2 + 40);
    while (1)
    {
      ++v5;
      v9 = v7[3];
      v10 = v7[4];
      __swift_project_boxed_opaque_existential_1(v7, v9);
      v17[0] = v19;
      v17[1] = v16;
      v17[2] = v6;
      v17[3] = v15;
      v17[4] = v14;
      v18 = v8;
      result = (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(v10 + 8))(v17, v5, v9, v10);
      if (v3)
        break;
      v7 += 5;
      if (v4 == v5)
      {
        *(_QWORD *)a2 = v19;
        *(_QWORD *)(a2 + 8) = v16;
        *(_QWORD *)(a2 + 16) = v6;
        *(_QWORD *)(a2 + 24) = v15;
        *(_QWORD *)(a2 + 32) = v14;
        *(_BYTE *)(a2 + 40) = v8;
        swift_retain();
        return swift_bridgeObjectRetain();
      }
    }
  }
  else
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v12 + 8) = 0;
    *(_QWORD *)(v12 + 16) = 0;
    *(_QWORD *)v12 = 7;
    *(_BYTE *)(v12 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

uint64_t SQLiteStatement.reset()@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  sqlite3_stmt *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  int v20;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v17 = 4;
LABEL_10:
    *(_QWORD *)(v16 + 8) = 0;
    *(_QWORD *)(v16 + 16) = 0;
    *(_QWORD *)v16 = v17;
    *(_BYTE *)(v16 + 24) = 5;
    return swift_willThrow();
  }
  v5 = *(sqlite3_stmt **)(v3 + 24);
  if (!v5)
  {
    sub_2445470A0();
    swift_allocError();
    v17 = 3;
    goto LABEL_10;
  }
  v7 = v1[1];
  v6 = v1[2];
  v9 = v1[3];
  v8 = v1[4];
  v10 = *((_BYTE *)v1 + 40);
  v20 = sqlite3_reset(*(sqlite3_stmt **)(v3 + 24));
  if (v20)
  {
    if (qword_257370D10 != -1)
      swift_once();
    v11 = sub_244568180();
    __swift_project_value_buffer(v11, (uint64_t)qword_257371260);
    v12 = sub_244568168();
    v13 = sub_244568360();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v14 = 67109120;
      v15 = v20;
      sub_244568384();
      _os_log_impl(&dword_244545000, v12, v13, "Failed to reset a statement with error: %d", v14, 8u);
      MEMORY[0x2495120E0](v14, -1, -1);

    }
    else
    {

      v15 = v20;
    }
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v19 = v15;
    *(_QWORD *)(v19 + 8) = 0xD000000000000010;
    *(_QWORD *)(v19 + 16) = 0x8000000244569380;
    *(_BYTE *)(v19 + 24) = 0;
    return swift_willThrow();
  }
  sqlite3_clear_bindings(v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v8;
  *(_BYTE *)(a1 + 40) = v10;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_244557978(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_257370D10 != -1)
    swift_once();
  v3 = sub_244568180();
  __swift_project_value_buffer(v3, (uint64_t)qword_257371260);
  sub_24454A3E8(a2);
  v4 = sub_244568168();
  v5 = sub_244568360();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = *(_QWORD *)(a2 + 8);
    v9 = *(_QWORD *)(a2 + 16);
    swift_bridgeObjectRetain();
    sub_244558788(v8, v9, &v12);
    sub_244568384();
    swift_bridgeObjectRelease();
    sub_24454ABFC(a2);
    _os_log_impl(&dword_244545000, v4, v5, "Unexpected result: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495120E0](v7, -1, -1);
    MEMORY[0x2495120E0](v6, -1, -1);
  }
  else
  {
    sub_24454ABFC(a2);
  }

  sub_2445470A0();
  swift_allocError();
  *(_OWORD *)v10 = xmmword_24456A350;
  *(_QWORD *)(v10 + 16) = 0x80000002445693F0;
  *(_BYTE *)(v10 + 24) = 0;
  return swift_willThrow();
}

void SQLiteStatement.executeAndReset()(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  _OWORD v9[2];

  v4 = v1[1];
  v8 = *v1;
  v9[0] = v4;
  *(_OWORD *)((char *)v9 + 9) = *(__int128 *)((char *)v1 + 25);
  v5 = v1[1];
  v6 = *v1;
  v7[0] = v5;
  *(_OWORD *)((char *)v7 + 9) = *(__int128 *)((char *)v1 + 25);
  sub_244557F64((uint64_t *)&v6, (void (*)(uint64_t *))sub_2445559B4);
  if (!v2)
  {
    v6 = v8;
    v7[0] = v9[0];
    *(_OWORD *)((char *)v7 + 9) = *(_OWORD *)((char *)v9 + 9);
    SQLiteStatement.reset()(a1);
  }
}

uint64_t SQLiteStatement.singleRowIfAny<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10[3];
  __int128 v11;
  char v12;

  v5 = *v2;
  v6 = v2[1];
  v7 = v2[2];
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1, a1);
  v10[0] = v5;
  v10[1] = v6;
  v10[2] = v7;
  v11 = xmmword_24456A100;
  v12 = 0;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_244557F64(v10, (void (*)(uint64_t *))sub_2445588B0);
  swift_bridgeObjectRelease();
  if (!v3)
    return swift_release();
  swift_release();
  v8 = sub_244568378();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a2, v8);
}

uint64_t sub_244557CE0(uint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;

  v10 = sub_244568378();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v15 - v12;
  v16 = *a1;
  result = a3(&v16);
  if (!v5)
  {
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v13, 0, 1, a5);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 40))(a2, v13, v10);
  }
  return result;
}

uint64_t SQLiteStatement.singleRow<A>(_:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  char v23;
  uint64_t v24;

  v24 = a2;
  v5 = sub_244568378();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  v12 = *((_QWORD *)v2 + 2);
  v13 = *((_BYTE *)v2 + 40);
  v20 = *v2;
  v21 = v12;
  v22 = *(__int128 *)((char *)v2 + 24);
  v23 = v13;
  result = SQLiteStatement.singleRowIfAny<A>(_:)(a1, (uint64_t)&v20 - v10);
  if (!v3)
  {
    v15 = v24;
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
    v16 = *(_QWORD *)(a1 - 8);
    v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48))(v9, 1, a1);
    v18 = *(void (**)(char *, uint64_t))(v6 + 8);
    if (v17 == 1)
    {
      v18(v9, v5);
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v19 + 8) = 0;
      *(_QWORD *)(v19 + 16) = 0;
      *(_QWORD *)v19 = 5;
      *(_BYTE *)(v19 + 24) = 5;
      swift_willThrow();
      return ((uint64_t (*)(char *, uint64_t))v18)(v11, v5);
    }
    else
    {
      v18(v11, v5);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v15, v9, a1);
    }
  }
  return result;
}

void sub_244557F64(uint64_t *a1, void (*a2)(uint64_t *))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;

  v4 = *a1;
  v5 = a1[1];
  v7 = a1[2];
  v6 = a1[3];
  v8 = a1[4];
  v9 = *((_BYTE *)a1 + 40);
  v14 = *a1;
  v15 = v5;
  v16 = v7;
  v17 = v6;
  v18 = v8;
  v19 = v9;
  SQLiteStatement.nextRow()(&v20);
  if (!v2)
  {
    v13 = v4;
    v10 = v8;
    while (v20)
    {
      if (!v10)
      {
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v12 + 8) = 0;
        *(_QWORD *)(v12 + 16) = 0;
        *(_QWORD *)v12 = 2;
        *(_BYTE *)(v12 + 24) = 5;
        swift_willThrow();
        swift_release();
        return;
      }
      v14 = v20;
      a2(&v14);
      swift_release();
      --v10;
      v14 = v13;
      v15 = v5;
      v16 = v7;
      v17 = v6;
      v18 = v8;
      v19 = v9;
      SQLiteStatement.nextRow()(&v20);
    }
    if (v8 < v10)
    {
      __break(1u);
    }
    else if (v8 - v10 < v6)
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)v11 = 5;
      *(_BYTE *)(v11 + 24) = 5;
      swift_willThrow();
    }
  }
}

void SQLiteStatement.iterate(_:)(uint64_t (*a1)(_QWORD *))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[5];
  char v15;
  uint64_t v16;

  v3 = v1[1];
  v13 = *v1;
  v5 = v1[2];
  v4 = v1[3];
  v6 = v1[4];
  v7 = *((_BYTE *)v1 + 40);
  v8 = v6;
  do
  {
    v14[0] = v13;
    v14[1] = v3;
    v14[2] = v5;
    v14[3] = v4;
    v14[4] = v6;
    v15 = v7;
    SQLiteStatement.nextRow()(&v16);
    if (v2)
      break;
    if (!v16)
    {
      if (v6 < v8)
      {
        __break(1u);
      }
      else if (v6 - v8 < v4)
      {
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v10 + 8) = 0;
        *(_QWORD *)(v10 + 16) = 0;
        *(_QWORD *)v10 = 5;
        *(_BYTE *)(v10 + 24) = 5;
        swift_willThrow();
      }
      return;
    }
    if (!v8)
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v11 + 8) = 0;
      *(_QWORD *)(v11 + 16) = 0;
      *(_QWORD *)v11 = 2;
      *(_BYTE *)(v11 + 24) = 5;
      swift_willThrow();
      swift_release();
      return;
    }
    v14[0] = v16;
    v9 = a1(v14);
    swift_release();
    --v8;
  }
  while ((v9 & 1) != 0);
}

void SQLiteStatement.reduce<A>(_:handleRow:)(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  __int128 *v3;
  uint64_t v4;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD v12[2];
  uint64_t v13;
  char v14;

  v10 = v3[1];
  v11 = *v3;
  v7 = *((_QWORD *)v3 + 4);
  v8 = *((_BYTE *)v3 + 40);
  v9 = *(_QWORD *)(a2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(a3, a1, a2);
  v12[0] = v11;
  v12[1] = v10;
  v13 = v7;
  v14 = v8;
  sub_244557F64((uint64_t *)v12, (void (*)(uint64_t *))sub_2445588CC);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a3, a2);
}

uint64_t sub_244558310(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t *), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v9 = *(_QWORD *)(a5 - 8);
  v10 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (uint64_t *)MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v18 - v14;
  v16 = *v13;
  (*(void (**)(char *))(v9 + 16))(v12);
  v19 = v16;
  a3(v12, &v19);
  result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, a5);
  if (!v5)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 40))(a2, v15, a5);
  return result;
}

uint64_t SQLiteStatement.map<A>(_:)()
{
  return SQLiteStatement.compactMap<A>(_:)();
}

uint64_t SQLiteStatement.compactMap<A>(_:)()
{
  __int128 *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;
  _OWORD v8[2];
  uint64_t v9;
  char v10;
  uint64_t v11;

  v6 = v0[1];
  v7 = *v0;
  v2 = *((_QWORD *)v0 + 4);
  v3 = *((_BYTE *)v0 + 40);
  v11 = sub_2445682B8();
  v8[0] = v7;
  v8[1] = v6;
  v9 = v2;
  v10 = v3;
  sub_244557F64((uint64_t *)v8, (void (*)(uint64_t *))sub_244558950);
  v4 = v11;
  if (v1)
    swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24455851C(uint64_t *a1, uint64_t (*a2)(uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
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
  char *v17;
  uint64_t v18;
  uint64_t result;
  _QWORD v20[2];
  uint64_t (*v21)(uint64_t *);
  uint64_t v22;
  uint64_t v23;

  v21 = a2;
  v20[1] = a4;
  v7 = sub_244568378();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v20 - v10;
  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](v9);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v20 - v16;
  v23 = *a1;
  v18 = v22;
  result = v21(&v23);
  if (!v18)
  {
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, a5) == 1)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v17, v11, a5);
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, a5);
      sub_2445682E8();
      sub_2445682DC();
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, a5);
    }
  }
  return result;
}

uint64_t SQLiteStatement.expectRows()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 24) = xmmword_24456A360;
  *(_BYTE *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t SQLiteStatement.expect(minRows:maxRows:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v4 = v3[1];
  v5 = v3[2];
  *(_QWORD *)a3 = *v3;
  *(_QWORD *)(a3 + 8) = v4;
  *(_QWORD *)(a3 + 16) = v5;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
  *(_BYTE *)(a3 + 40) = 0;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t SQLiteStatement.dontExpectRows()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t SQLiteStatement.expectOneRow()@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[1];
  v3 = v1[2];
  *(_QWORD *)a1 = *v1;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  *(int64x2_t *)(a1 + 24) = vdupq_n_s64(1uLL);
  *(_BYTE *)(a1 + 40) = 0;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_244558788(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_244558B68(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244558D20((uint64_t)v12, *a3);
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
      sub_244558D20((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_244558858(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t *);
  uint64_t v3;
  uint64_t v5;

  v2 = *(uint64_t (**)(uint64_t, uint64_t *))(v1 + 24);
  v3 = *(_QWORD *)(v1 + 40);
  v5 = *a1;
  return v2(v3, &v5);
}

uint64_t type metadata accessor for SQLiteStatement.Context()
{
  return objc_opt_self();
}

uint64_t sub_2445588B0(uint64_t *a1)
{
  uint64_t v1;

  return sub_244557CE0(a1, *(_QWORD *)(v1 + 24), *(uint64_t (**)(uint64_t *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

uint64_t sub_2445588CC(uint64_t a1)
{
  uint64_t v1;

  return sub_244558310(a1, *(_QWORD *)(v1 + 24), *(void (**)(char *, uint64_t *))(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

_QWORD *sub_2445588E8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *(*v5)(_QWORD *__return_ptr, uint64_t *);
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;

  v6 = *(_QWORD *)(v2 + 16);
  v5 = *(_QWORD *(**)(_QWORD *__return_ptr, uint64_t *))(v2 + 24);
  v8 = *a1;
  result = v5(a2, &v8);
  if (!v3)
    return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a2, 0, 1, v6);
  return result;
}

uint64_t sub_244558950(uint64_t *a1)
{
  uint64_t v1;

  return sub_24455851C(a1, *(uint64_t (**)(uint64_t *))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 16));
}

uint64_t destroy for SQLiteStatement()
{
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
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

uint64_t assignWithTake for SQLiteStatement(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteStatement(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteStatement(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 41) = 1;
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
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteStatement()
{
  return &type metadata for SQLiteStatement;
}

uint64_t sub_244558B68(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_244568390();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_244558D5C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_244568420();
  if (!v8)
  {
    sub_24456848C();
    __break(1u);
LABEL_17:
    result = sub_2445684C8();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_244558D20(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_244558D5C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244558DF0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244558F64(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_244558F64(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244558DF0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_24455E67C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_244568408();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24456848C();
      __break(1u);
LABEL_10:
      v2 = sub_244568240();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2445684C8();
    __break(1u);
LABEL_14:
    result = sub_24456848C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_244558F64(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
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
        goto LABEL_30;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573710C0);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_2445684C8();
  __break(1u);
  return result;
}

uint64_t String.init(with:column:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
LABEL_9:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
    goto LABEL_9;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  result = (uint64_t)sqlite3_column_text(v3, a2);
  if (result)
    return sub_244568234();
  return result;
}

uint64_t sub_2445591AC@<X0>(uint64_t *a1@<X8>)
{
  return sub_2445591F8((uint64_t (*)(void))String.init(with:column:), a1);
}

uint64_t *Data.init(with:column:)(uint64_t *a1, uint64_t a2)
{
  return sub_244559570(a1, a2);
}

uint64_t sub_2445591DC@<X0>(uint64_t *a1@<X8>)
{
  return sub_2445591F8((uint64_t (*)(void))sub_244559570, a1);
}

uint64_t sub_2445591F8@<X0>(uint64_t (*a1)(void)@<X5>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = a1();
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t *sub_244559570(uint64_t *result, uint64_t iCol)
{
  uint64_t v2;
  uint64_t v3;
  sqlite3_stmt *v4;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *result;
  v3 = *(_QWORD *)(*result + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v10 = 4;
LABEL_9:
    *(_QWORD *)v9 = v10;
    *(_QWORD *)(v9 + 8) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    *(_BYTE *)(v9 + 24) = 5;
    swift_willThrow();
    return (uint64_t *)swift_release();
  }
  v4 = *(sqlite3_stmt **)(v2 + 24);
  if (!v4)
  {
    sub_2445470A0();
    swift_allocError();
    v10 = 3;
    goto LABEL_9;
  }
  if (iCol < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (iCol > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v6 = sqlite3_column_blob(*(sqlite3_stmt **)(v2 + 24), iCol);
  if (v6)
  {
    v7 = v6;
    swift_release();
    v8 = sqlite3_column_bytes(v4, iCol);
    return (uint64_t *)sub_24454CC94(v7, v8);
  }
  else
  {
    SQLiteRow.type(at:)(iCol);
    result = (uint64_t *)swift_release();
    if (!v11)
      return 0;
  }
  return result;
}

unint64_t sub_2445596D0(uint64_t a1)
{
  unint64_t result;

  result = sub_24454721C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of SQLiteUnsafeType.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t SQLiteVTab.init(style:)(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  int v4;
  unsigned int v5;
  uint64_t (*v6)();
  uint64_t (*v7)();

  v2 = *a1;
  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = 0;
  *(_BYTE *)(v1 + 40) = v2;
  v3 = swift_slowAlloc();
  *(_QWORD *)(v1 + 32) = v3;
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)v1 + 320))();
  v5 = *(unsigned __int8 *)(v1 + 40);
  if (*(_BYTE *)(v1 + 40))
  {
    if (v5 == 1)
      v6 = sub_24455A200;
    else
      v6 = 0;
  }
  else
  {
    v6 = sub_24455A1FC;
  }
  *(_DWORD *)v3 = v4;
  if (v5 >= 2)
    v7 = 0;
  else
    v7 = sub_24455A394;
  *(_QWORD *)(v3 + 8) = v6;
  *(_QWORD *)(v3 + 16) = sub_24455A200;
  *(_QWORD *)(v3 + 24) = sub_24455A288;
  *(_QWORD *)(v3 + 32) = sub_24455A394;
  *(_QWORD *)(v3 + 40) = v7;
  *(_QWORD *)(v3 + 48) = sub_24455A398;
  *(_QWORD *)(v3 + 56) = sub_24455A4E0;
  *(_QWORD *)(v3 + 64) = sub_24455A634;
  *(_QWORD *)(v3 + 72) = sub_24455A748;
  *(_QWORD *)(v3 + 80) = sub_24455A840;
  *(_QWORD *)(v3 + 88) = sub_24455A964;
  *(_QWORD *)(v3 + 96) = sub_24455AA64;
  *(_OWORD *)(v3 + 104) = 0u;
  *(_OWORD *)(v3 + 120) = 0u;
  *(_OWORD *)(v3 + 136) = 0u;
  *(_OWORD *)(v3 + 152) = 0u;
  *(_OWORD *)(v3 + 168) = 0u;
  *(_QWORD *)(v3 + 184) = 0;
  return v1;
}

uint64_t SQLiteVTab.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v10;

  v1 = v0;
  MEMORY[0x2495120E0](*(_QWORD *)(v0 + 32), -1, -1);
  if (qword_257370D10 != -1)
    swift_once();
  v2 = sub_244568180();
  __swift_project_value_buffer(v2, (uint64_t)qword_257371260);
  swift_retain_n();
  v3 = sub_244568168();
  v4 = sub_244568354();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136315138;
    swift_beginAccess();
    if (*(_QWORD *)(v1 + 24))
    {
      v7 = *(_QWORD *)(v1 + 16);
      v8 = *(_QWORD *)(v1 + 24);
    }
    else
    {
      v8 = 0x8000000244569600;
      v7 = 0xD000000000000010;
    }
    swift_bridgeObjectRetain();
    sub_244558788(v7, v8, &v10);
    sub_244568384();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_244545000, v3, v4, "Destroying vtable module with name %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495120E0](v6, -1, -1);
    MEMORY[0x2495120E0](v5, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_244559A04()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_244559A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  sqlite3 *v8;
  const sqlite3_module *v9;
  const char *v10;
  uint64_t result;
  uint64_t v12;

  v4 = v3;
  swift_beginAccess();
  v4[2] = a1;
  v4[3] = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v8 = *(sqlite3 **)(a3 + 16);
  v9 = (const sqlite3_module *)v4[4];
  v10 = (const char *)(sub_2445681EC() + 32);
  swift_retain();
  LODWORD(v4) = sqlite3_create_module_v2(v8, v10, v9, v4, (void (__cdecl *)(void *))sub_24455AAA4);
  result = swift_release();
  if ((_DWORD)v4)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v12 = a1;
    *(_QWORD *)(v12 + 8) = a2;
    *(_QWORD *)(v12 + 16) = 0;
    *(_BYTE *)(v12 + 24) = 2;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_244559B58(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(v1 + 16);
  result = swift_beginAccess();
  v5 = *(_QWORD *)(v1 + 24);
  if (v5)
  {
    v6 = *v3;
    swift_retain();
    swift_bridgeObjectRetain();
    sub_244559F60(v6, v5, a1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244559BD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t SQLiteVTab.Connection.init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v6 = sub_2445681C8();
  MEMORY[0x24BDAC7A8](v6);
  swift_weakInit();
  if (a2 < 3)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0xD00000000000001CLL;
    v8 = "Invalid number of parameters";
LABEL_8:
    v11 = (unint64_t)(v8 - 32) | 0x8000000000000000;
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0x7463657078656E55;
    v11 = 0xEE006C696E206465;
LABEL_9:
    *(_QWORD *)(v7 + 8) = v11;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 4;
    swift_willThrow();
    swift_release();
    swift_weakDestroy();
    type metadata accessor for SQLiteVTab.Connection();
    swift_deallocPartialClassInstance();
    return v3;
  }
  sub_2445681BC();
  v9 = sub_2445681B0();
  if (!v10)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000014;
    v8 = "Cannot create string";
    goto LABEL_8;
  }
  *(_QWORD *)(v3 + 16) = v9;
  *(_QWORD *)(v3 + 24) = v10;
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v3;
}

uint64_t SQLiteVTab.Connection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t sub_244559DF4()
{
  swift_beginAccess();
  return swift_weakLoadStrong();
}

uint64_t SQLiteVTab.Cursor.init(_:)()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  swift_weakInit();
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v0;
}

uint64_t SQLiteVTab.Cursor.deinit()
{
  uint64_t v0;

  swift_weakDestroy();
  return v0;
}

uint64_t sub_244559EC0()
{
  swift_beginAccess();
  return swift_weakLoadStrong();
}

uint64_t sub_244559F00()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return 0;
}

uint64_t sub_244559F0C()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = __OFADD__(v1, 1);
  v3 = v1 + 1;
  if (v2)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 16) = v3;
    return 0;
  }
  return result;
}

BOOL sub_244559F28()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[2];
  return v1 < (*(uint64_t (**)(void))(*v0 + 192))();
}

uint64_t sub_244559F58()
{
  return 0;
}

uint64_t sub_244559F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  const char *v8[2];
  _QWORD v9[2];

  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    sub_2445683F0();
    return swift_release();
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((a1 & 0x1000000000000000) != 0)
    {
      v5 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = a1 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      v5 = sub_244568420();
    }
    sub_244556590(v5, v6, (uint64_t (*)(void))sub_24455B10C);
    return swift_release();
  }
  v9[0] = a1;
  v9[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  v8[0] = (const char *)v9;
  v8[1] = 0;
  sqlite3_drop_modules(*(sqlite3 **)(a3 + 16), v8);
  return swift_release();
}

BOOL static SQLiteVTab.Style.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t SQLiteVTab.Style.hash(into:)()
{
  return sub_244568570();
}

uint64_t SQLiteVTab.Style.hashValue.getter()
{
  sub_244568564();
  sub_244568570();
  return sub_244568588();
}

BOOL sub_24455A0E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24455A0F4()
{
  sub_244568564();
  sub_244568570();
  return sub_244568588();
}

uint64_t sub_24455A138()
{
  return sub_244568570();
}

uint64_t sub_24455A160()
{
  sub_244568564();
  sub_244568570();
  return sub_244568588();
}

uint64_t sub_24455A1A0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24455A204(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t **a5, uint64_t a6)
{
  uint64_t v10;

  if (!a1 || !a2 || !a5 || !a4 || !a6)
    return 1;
  swift_retain();
  v10 = sub_24455B148(a1, a3, a4, a5);
  swift_release();
  return v10;
}

uint64_t sub_24455A288(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(uint64_t);
  uint64_t v4;

  if (!a1 || !a2)
    return 1;
  v3 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(a1 + 24) + 128);
  swift_retain();
  v4 = v3(a2);
  swift_release();
  return v4;
}

uint64_t sub_24455A2E8(_QWORD **a1)
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 1;
  v2 = *(void (**)(uint64_t))(*a1[3] + 136);
  v3 = swift_retain();
  v2(v3);
  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_release();
    sqlite3_free(a1);
    swift_release();
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  swift_release();
  return v4;
}

uint64_t sub_24455A398(uint64_t a1, uint64_t **a2)
{
  uint64_t v2;
  uint64_t v4;

  v2 = 1;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 24);
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v2 = sub_24455B3B4(a2, v4);
      swift_release();
      swift_release();
    }
    else
    {
      swift_release();
      return 1;
    }
  }
  return v2;
}

uint64_t sub_24455A438(uint64_t result)
{
  _QWORD *v1;

  if (!result)
    return 1;
  v1 = (_QWORD *)result;
  if (!*(_QWORD *)result)
  {
    __break(1u);
    return result;
  }
  swift_retain();
  swift_beginAccess();
  if (!swift_weakLoadStrong())
  {
    swift_release();
    return 1;
  }
  if (v1[1])
    swift_release();
  sqlite3_free(v1);
  swift_release();
  swift_release();
  return 0;
}

uint64_t sub_24455A4E4(_QWORD *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);

  if (!a1)
    return 1;
  v9 = Array<A>.init(_:argc:)(a5, a4);
  result = MEMORY[0x249511BB8]();
  if (*a1)
  {
    v11 = (void *)result;
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v12 = a1[1];
      if (v12)
      {
        v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v12 + 152);
        swift_retain();
        v8 = v13(a2, a3, v9);
        swift_release();
        swift_release();
        swift_release();
LABEL_10:
        objc_autoreleasePoolPop(v11);
        swift_bridgeObjectRelease();
        return v8;
      }
      swift_release();
    }
    swift_release();
    v8 = 1;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24455A638(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;

  if (!a1)
    return 1;
  result = MEMORY[0x249511BB8]();
  if (*a1)
  {
    v3 = (void *)result;
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v4 = a1[1];
      if (v4)
      {
        v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 160);
        v6 = swift_retain();
        v7 = v5(v6);
        swift_release();
        swift_release();
        swift_release();
LABEL_9:
        objc_autoreleasePoolPop(v3);
        return v7;
      }
      swift_release();
    }
    swift_release();
    v7 = 1;
    goto LABEL_9;
  }
  __break(1u);
  return result;
}

uint64_t sub_24455A74C(_QWORD *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _BOOL8 v7;

  if (!a1)
    return 1;
  result = MEMORY[0x249511BB8]();
  if (*a1)
  {
    v3 = (void *)result;
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v4 = a1[1];
      if (v4)
      {
        v5 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v4 + 168);
        v6 = swift_retain();
        LOBYTE(v5) = v5(v6);
        swift_release();
        swift_release();
        swift_release();
        v7 = (v5 & 1) == 0;
LABEL_10:
        objc_autoreleasePoolPop(v3);
        return v7;
      }
      swift_release();
    }
    swift_release();
    v7 = 1;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24455A844(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1 || !a2)
    return 1;
  result = MEMORY[0x249511BB8]();
  if (*a1)
  {
    v7 = (void *)result;
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v8 = a1[1];
      if (v8)
      {
        swift_retain();
        v10 = a2;
        v9 = (*(uint64_t (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 184))(a3, &v10);
        swift_release();
        swift_release();
        swift_release();
LABEL_10:
        objc_autoreleasePoolPop(v7);
        return v9;
      }
      swift_release();
    }
    swift_release();
    v9 = 1;
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24455A968(_QWORD *a1, uint64_t *a2)
{
  uint64_t result;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a1 || !a2)
    return 1;
  result = MEMORY[0x249511BB8]();
  if (*a1)
  {
    v5 = (void *)result;
    swift_retain();
    swift_beginAccess();
    if (swift_weakLoadStrong())
    {
      v6 = a1[1];
      if (v6)
      {
        v7 = *(uint64_t (**)(uint64_t))(*(_QWORD *)v6 + 176);
        v8 = swift_retain();
        v9 = v7(v8);
        swift_release();
        *a2 = v9;
        swift_release();
        swift_release();
        v10 = 0;
LABEL_11:
        objc_autoreleasePoolPop(v5);
        return v10;
      }
      swift_release();
    }
    swift_release();
    v10 = 1;
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t SQLiteVTab.__allocating_init(style:)(char *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  SQLiteVTab.init(style:)(a1);
  return v2;
}

uint64_t sub_24455AAA4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t SQLiteVTab.__deallocating_deinit()
{
  SQLiteVTab.deinit();
  return swift_deallocClassInstance();
}

uint64_t SQLiteVTab.Connection.tableName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteVTab.Connection.__allocating_init(_:argc:argv:)(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  SQLiteVTab.Connection.init(_:argc:argv:)(a1, a2, a3);
  return v6;
}

uint64_t sub_24455AB64()
{
  return 0;
}

uint64_t SQLiteVTab.Connection.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t SQLiteVTab.Cursor.__allocating_init(_:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0;
  swift_weakInit();
  swift_beginAccess();
  swift_weakAssign();
  swift_release();
  return v0;
}

uint64_t SQLiteVTab.Cursor.__deallocating_deinit()
{
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SQLiteVTab.Connection()
{
  return objc_opt_self();
}

unint64_t sub_24455AC6C()
{
  unint64_t result;

  result = qword_2573710C8;
  if (!qword_2573710C8)
  {
    result = MEMORY[0x249512068](&protocol conformance descriptor for SQLiteVTab.Style, &type metadata for SQLiteVTab.Style);
    atomic_store(result, (unint64_t *)&qword_2573710C8);
  }
  return result;
}

uint64_t sub_24455ACB0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24455ACFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_24455AD48()
{
  swift_beginAccess();
  return swift_weakAssign();
}

uint64_t sub_24455AD94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  *a1 = result;
  return result;
}

uint64_t sub_24455ADE0()
{
  swift_beginAccess();
  return swift_weakAssign();
}

uint64_t type metadata accessor for SQLiteVTab()
{
  return objc_opt_self();
}

uint64_t method lookup function for SQLiteVTab()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteVTab.moduleName.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of SQLiteVTab.__allocating_init(style:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of SQLiteVTab.register(_:database:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SQLiteVTab.unregister(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SQLiteVTab.version()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t getEnumTagSinglePayload for SQLiteVTab.Style(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SQLiteVTab.Style(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24455AF7C + 4 * byte_24456A3ED[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24455AFB0 + 4 * asc_24456A3E8[v4]))();
}

uint64_t sub_24455AFB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24455AFB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24455AFC0);
  return result;
}

uint64_t sub_24455AFCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24455AFD4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24455AFD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24455AFE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SQLiteVTab.Style()
{
  return &type metadata for SQLiteVTab.Style;
}

uint64_t method lookup function for SQLiteVTab.Connection()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.table.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.__allocating_init(_:argc:argv:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.bestIndex(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SQLiteVTab.Connection.onDisconnect()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t type metadata accessor for SQLiteVTab.Cursor()
{
  return objc_opt_self();
}

uint64_t method lookup function for SQLiteVTab.Cursor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.connection.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.filter(idxNum:idxStr:arguments:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.next()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.hasMoreRows()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.rowid()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.setValue(forColumn:on:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SQLiteVTab.Cursor.rowCount()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t sub_24455B10C(const char *a1)
{
  uint64_t v1;
  const char *v3;

  v3 = a1;
  return sqlite3_drop_modules(*(sqlite3 **)(v1 + 16), &v3);
}

uint64_t sub_24455B148(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v4;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  int v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v9 = (uint64_t *)sqlite3_malloc(32);
  if (!v9)
    return 1;
  v10 = v9;
  v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))((*(uint64_t (**)(void))(*(_QWORD *)v4 + 328))() + 120);
  v12 = swift_retain();
  v13 = v11(v12, a2, a3);
  *(_QWORD *)&v19 = 0;
  *((_QWORD *)&v19 + 1) = 0xE000000000000000;
  sub_2445683FC();
  v20 = v19;
  sub_24456821C();
  swift_bridgeObjectRetain();
  sub_24456821C();
  swift_bridgeObjectRelease();
  v14 = sub_24456821C();
  (*(void (**)(uint64_t))(*(_QWORD *)v13 + 152))(v14);
  sub_24456821C();
  swift_bridgeObjectRelease();
  sub_24456821C();
  v16 = sub_2445681EC();
  swift_bridgeObjectRelease();
  v17 = sqlite3_declare_vtab(a1, (const char *)(v16 + 32));
  swift_release();
  if (v17)
  {
    swift_release();
    return 1;
  }
  *(_QWORD *)&v20 = 0;
  DWORD2(v20) = 0;
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = v13;
  if (&v20 < (__int128 *)v10 + 2 && v10 < &v22)
  {
    result = sub_2445684C8();
    __break(1u);
  }
  else
  {
    result = 0;
    v18 = v21;
    *(_OWORD *)v10 = v20;
    *((_OWORD *)v10 + 1) = v18;
    *a4 = v10;
  }
  return result;
}

uint64_t sub_24455B3B4(uint64_t **a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t result;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t *)sqlite3_malloc(16);
  if (!v4)
    return 1;
  v5 = v4;
  v6 = *(uint64_t (**)(uint64_t))((*(uint64_t (**)(void))(*(_QWORD *)a2 + 160))() + 144);
  *(_QWORD *)&v9 = 0;
  v7 = swift_retain();
  *((_QWORD *)&v9 + 1) = v6(v7);
  if (&v9 < (__int128 *)v5 + 1 && v5 < &v10)
  {
    result = sub_2445684C8();
    __break(1u);
  }
  else
  {
    result = 0;
    *(_OWORD *)v5 = v9;
    *a1 = v5;
  }
  return result;
}

void static SQLiteInteger32<>.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

{
  *a1 = 4;
}

void static SQLiteInteger64.associatedSQLDataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static SQLiteInteger64<>.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

{
  *a1 = 5;
}

uint64_t sub_24455B514@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  int v9;
  char v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711C0);
  result = sub_244563270(&qword_2573711C8, &qword_2573711C0, (uint64_t)&protocol witness table for Int8);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_24455E758(a1, a2, 10);
    if ((result & 0x10000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_24455FA54(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_24455ED1C);
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v8 = result;
    }
    v9 = (v8 >> 8) & 1;
    if (v9)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_BYTE *)a3 = v10;
  *(_BYTE *)(a3 + 1) = v9;
  return result;
}

uint64_t sub_24455B604@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  int v9;
  char v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711B0);
  result = sub_244563270(&qword_2573711B8, &qword_2573711B0, (uint64_t)&protocol witness table for UInt8);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_24455F4A8(a1, a2, 10);
    if ((result & 0x10000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_24455FA54(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_24455FBA8);
      result = swift_bridgeObjectRelease();
    }
    else
    {
      v8 = result;
    }
    v9 = (v8 >> 8) & 1;
    if (v9)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_BYTE *)a3 = v10;
  *(_BYTE *)(a3 + 1) = v9;
  return result;
}

uint64_t sub_24455B6F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  int v8;
  unsigned int v9;
  __int16 v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711A0);
  result = sub_244563270(&qword_2573711A8, &qword_2573711A0, (uint64_t)&protocol witness table for Int16);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_24455FE50(a1, a2, 10);
    v8 = result;
    if ((result & 0x1000000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244560C74(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_244560414);
      result = swift_bridgeObjectRelease();
    }
    v9 = (v8 & 0x10000u) >> 16;
    if ((v8 & 0x10000) != 0)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_WORD *)a3 = v10;
  *(_BYTE *)(a3 + 2) = v9 & 1;
  return result;
}

uint64_t sub_24455B7E4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  int v8;
  unsigned int v9;
  __int16 v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_257371190);
  result = sub_244563270(&qword_257371198, &qword_257371190, (uint64_t)&protocol witness table for UInt16);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_2445606C8(a1, a2, 10);
    v8 = result;
    if ((result & 0x1000000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244560C74(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_244560DC0);
      result = swift_bridgeObjectRelease();
    }
    v9 = (v8 & 0x10000u) >> 16;
    if ((v8 & 0x10000) != 0)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_WORD *)a3 = v10;
  *(_BYTE *)(a3 + 2) = v9 & 1;
  return result;
}

uint64_t sub_24455B8D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_257371180);
  result = sub_244563270(&qword_257371188, &qword_257371180, (uint64_t)&protocol witness table for Int32);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_244561068(a1, a2, 10);
    v8 = result;
    if ((result & 0x10000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244561D70(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_2445615AC);
      result = swift_bridgeObjectRelease();
    }
    v9 = (v8 & 0x100000000uLL) >> 32;
    if ((v8 & 0x100000000) != 0)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_DWORD *)a3 = v10;
  *(_BYTE *)(a3 + 4) = v9 & 1;
  return result;
}

uint64_t sub_24455B9C4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int v10;

  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_257371170);
  result = sub_244563270(&qword_257371178, &qword_257371170, (uint64_t)&protocol witness table for UInt32);
  *(_QWORD *)(a3 + 32) = result;
  v7 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v7 = a1 & 0xFFFFFFFFFFFFLL;
  if (v7)
  {
    result = sub_24456182C(a1, a2, 10);
    v8 = result;
    if ((result & 0x10000000000) != 0)
    {
      swift_bridgeObjectRetain();
      v8 = sub_244561D70(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_244561ECC);
      result = swift_bridgeObjectRelease();
    }
    v9 = (v8 & 0x100000000uLL) >> 32;
    if ((v8 & 0x100000000) != 0)
      v10 = 0;
    else
      v10 = v8;
  }
  else
  {
    v10 = 0;
    LOBYTE(v9) = 1;
  }
  *(_DWORD *)a3 = v10;
  *(_BYTE *)(a3 + 4) = v9 & 1;
  return result;
}

uint64_t static SQLiteInteger32.create(from:)@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  return sub_24455BCD4(a1, a2);
}

uint64_t sub_24455BAC8@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  int v16;
  char v17;
  char v18;
  uint64_t v19;

  *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_244563270(a4, a3, a5);
  *(_QWORD *)(a6 + 32) = result;
  v13 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v13 = a1 & 0xFFFFFFFFFFFFLL;
  if (v13)
  {
    result = sub_244562214(a1, a2, 10);
    if ((v14 & 0x100) != 0)
    {
      swift_bridgeObjectRetain();
      v15 = sub_244562F68(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_244562780);
      v18 = v17;
      result = swift_bridgeObjectRelease();
      v16 = v18 & 1;
    }
    else
    {
      v15 = result;
      v16 = v14 & 1;
    }
    if (v16)
      v19 = 0;
    else
      v19 = v15;
  }
  else
  {
    v19 = 0;
    LOBYTE(v16) = 1;
  }
  *(_QWORD *)a6 = v19;
  *(_BYTE *)(a6 + 8) = v16;
  return result;
}

uint64_t sub_24455BBC4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X2>, unint64_t *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t result;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  int v16;
  char v17;
  char v18;
  uint64_t v19;

  *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(a3);
  result = sub_244563270(a4, a3, a5);
  *(_QWORD *)(a6 + 32) = result;
  v13 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v13 = a1 & 0xFFFFFFFFFFFFLL;
  if (v13)
  {
    result = sub_2445629FC(a1, a2, 10);
    if ((v14 & 0x100) != 0)
    {
      swift_bridgeObjectRetain();
      v15 = sub_244562F68(a1, a2, 10, (uint64_t (*)(_QWORD *, uint64_t, uint64_t))sub_244562FF4);
      v18 = v17;
      result = swift_bridgeObjectRelease();
      v16 = v18 & 1;
    }
    else
    {
      v15 = result;
      v16 = v14 & 1;
    }
    if (v16)
      v19 = 0;
    else
      v19 = v15;
  }
  else
  {
    v19 = 0;
    LOBYTE(v16) = 1;
  }
  *(_QWORD *)a6 = v19;
  *(_BYTE *)(a6 + 8) = v16;
  return result;
}

uint64_t static SQLiteInteger64.create(from:)@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  return sub_24455BCD4(a1, a2);
}

uint64_t sub_24455BCD4@<X0>(uint64_t a1@<X3>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v6;

  v4 = sub_244568378();
  a2[3] = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  a2[4] = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v4, &v6);
  __swift_allocate_boxed_opaque_existential_1(a2);
  swift_bridgeObjectRetain();
  return sub_2445684EC();
}

uint64_t sub_24455BD8C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2445633BC(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t SQLiteInteger32.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  uint64_t result;
  int v19;
  char v20;
  uint64_t v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  int v34;
  int v35;

  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v30 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v15 = (char *)&v30 - v14;
  v16 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  if (!v16 || !*(_QWORD *)(v16 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v25 = 4;
LABEL_11:
    *(_QWORD *)v24 = v25;
    *(_QWORD *)(v24 + 8) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_BYTE *)(v24 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v17 = *(sqlite3_stmt **)(*(_QWORD *)v11 + 24);
  if (!v17)
  {
    sub_2445470A0();
    swift_allocError();
    v25 = 3;
    goto LABEL_11;
  }
  v31 = v13;
  v32 = v12;
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    v19 = sqlite3_column_int(v17, a2);
    if (a3 == MEMORY[0x24BEE3F88])
      goto LABEL_20;
    sub_244568480();
    v20 = sub_2445683CC();
    v21 = sub_2445683C0();
    if ((v20 & 1) != 0)
    {
      if (v21 > 32)
      {
        v33 = v19;
        sub_24455C144();
        sub_2445683A8();
        v22 = sub_244568198();
        v23 = *(void (**)(char *, uint64_t))(v31 + 8);
        v23(v10, a3);
        goto LABEL_19;
      }
    }
    else if (v21 > 31)
    {
      v35 = v19;
      v27 = v31;
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v7, v15, a3);
      if (v19 < 0)
      {
        v28 = *(void (**)(char *, uint64_t))(v27 + 8);
        v28(v7, a3);
        v28(v15, a3);
LABEL_22:
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v29 + 8) = 0;
        *(_QWORD *)(v29 + 16) = 0;
        *(_QWORD *)v29 = 8;
        *(_BYTE *)(v29 + 24) = 5;
        return swift_willThrow();
      }
      sub_24455C144();
      sub_2445683A8();
      v22 = sub_244568198();
      v23 = *(void (**)(char *, uint64_t))(v27 + 8);
      v23(v10, a3);
      v23(v7, a3);
LABEL_19:
      v23(v15, a3);
      if ((v22 & 1) == 0)
        goto LABEL_20;
      goto LABEL_22;
    }
    v26 = sub_2445683B4();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, a3);
    if (v19 >= v26)
    {
LABEL_20:
      v34 = v19;
      sub_24455C144();
      return sub_2445683D8();
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_24455C144()
{
  unint64_t result;

  result = qword_2573710D0;
  if (!qword_2573710D0)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE3FC8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_2573710D0);
  }
  return result;
}

uint64_t sub_24455C188(__int128 *a1, uint64_t a2)
{
  char *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C1BC((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455C1BC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455C2D4(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455C3EC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455C500(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455C618(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455C730(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_10:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a3 < 0)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t SQLiteInteger32.bind(to:at:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  char *v4;
  void (*v5)(char *, uint64_t);
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
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
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  sqlite3_stmt *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  char v32;
  uint64_t v33;
  char *v34;
  char v35;
  uint64_t v36;
  signed int v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  char *v42;
  char *v43;
  void (*v44)(uint64_t, char *, uint64_t);
  char v45;
  uint64_t v46;
  char *v47;
  char v48;
  char *v49;
  signed int v50;
  char *v51;
  char v52;
  signed int v53;
  signed int v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[2];
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  sqlite3_stmt *v75;
  char *v76;
  uint64_t v77;
  void (*v78)(uint64_t, char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  char *v81;
  signed int v82;
  int v83;
  int v84;

  v80 = a2;
  v79 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 8);
  v8 = *(_QWORD *)(*(_QWORD *)(v79 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = *((_QWORD *)a3 - 1);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8]((char *)v69 - v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v69 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)v69 - v27;
  v28 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v28 || !*(_QWORD *)(v28 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v40 = 4;
LABEL_12:
    *(_QWORD *)(v39 + 8) = 0;
    *(_QWORD *)(v39 + 16) = 0;
    *(_QWORD *)v39 = v40;
    *(_BYTE *)(v39 + 24) = 5;
    return swift_willThrow();
  }
  v29 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v29)
  {
    sub_2445470A0();
    swift_allocError();
    v40 = 3;
    goto LABEL_12;
  }
  if (v80 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_45;
  }
  if (v80 > 0x7FFFFFFF)
  {
LABEL_45:
    __break(1u);
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  v69[1] = v8;
  v70 = v23;
  v73 = v22;
  v74 = v24;
  v76 = v25;
  v77 = v21;
  v71 = v26;
  v75 = v29;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v31 = v81;
  v30(v81, (uint64_t)v4, (uint64_t)a3);
  v32 = sub_2445683CC();
  v78 = (void (*)(uint64_t, char *, uint64_t))v30;
  v30(v20, (uint64_t)v31, (uint64_t)a3);
  v72 = v11;
  if ((v32 & 1) == 0)
  {
    v5 = *(void (**)(char *, uint64_t))(v11 + 8);
    v5(v20, (uint64_t)a3);
    v42 = v81;
    v43 = v76;
    v36 = v77;
    v44 = v78;
    goto LABEL_30;
  }
  v33 = sub_2445683C0();
  v69[0] = *(_QWORD *)(v11 + 8);
  ((void (*)(char *, char *))v69[0])(v20, a3);
  if (v33 <= 32)
  {
    v42 = v81;
    v5 = (void (*)(char *, uint64_t))v69[0];
    v36 = v77;
    v44 = v78;
    v43 = v76;
    goto LABEL_30;
  }
  v34 = v73;
  v78((uint64_t)v73, v81, (uint64_t)a3);
  v82 = 0x80000000;
  v35 = sub_2445683CC();
  v36 = v77;
  if ((v35 & 1) != 0)
  {
    if (sub_2445683C0() < 32)
    {
      v37 = sub_2445683B4();
      v5 = (void (*)(char *, uint64_t))v69[0];
      ((void (*)(char *, char *))v69[0])(v34, a3);
      v38 = v82 <= v37;
      goto LABEL_27;
    }
LABEL_20:
    sub_24455C144();
    v47 = v74;
    sub_2445683A8();
    v48 = sub_244568198();
    v5 = (void (*)(char *, uint64_t))v69[0];
    ((void (*)(char *, char *))v69[0])(v47, a3);
    v5(v34, (uint64_t)a3);
    v42 = v81;
    v44 = v78;
    v43 = v76;
    if ((v48 & 1) == 0)
      goto LABEL_30;
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v45 = sub_2445683CC();
  v46 = sub_2445683C0();
  if ((v45 & 1) != 0)
  {
    if (v46 <= 32)
    {
      swift_getAssociatedConformanceWitness();
      sub_24456851C();
      v51 = v74;
      sub_244568504();
      v52 = sub_244568198();
      v5 = (void (*)(char *, uint64_t))v69[0];
      ((void (*)(char *, char *))v69[0])(v51, a3);
      v4 = v70;
      (*(void (**)(char *, char *, char *))(v72 + 32))(v70, v34, a3);
      if ((v52 & 1) != 0)
      {
LABEL_47:
        result = ((uint64_t (*)(char *, char *))v5)(v4, a3);
        __break(1u);
        return result;
      }
      v53 = v82;
      v54 = sub_2445683B4();
      v5(v4, (uint64_t)a3);
      v38 = v53 <= v54;
LABEL_27:
      v42 = v81;
      v44 = v78;
      v43 = v76;
      if (v38)
        goto LABEL_30;
      goto LABEL_28;
    }
    goto LABEL_20;
  }
  v42 = v81;
  v44 = v78;
  v43 = v76;
  if (v46 <= 32)
  {
    v49 = v73;
    v50 = sub_2445683B4();
    v5 = (void (*)(char *, uint64_t))v69[0];
    ((void (*)(char *, char *))v69[0])(v49, a3);
    if (v82 <= v50)
      goto LABEL_30;
    goto LABEL_28;
  }
LABEL_29:
  v5 = (void (*)(char *, uint64_t))v69[0];
  ((void (*)(char *, char *))v69[0])(v73, a3);
LABEL_30:
  v55 = sub_2445683C0();
  v44(v36, v42, (uint64_t)a3);
  if (v55 >= 33)
  {
    v5((char *)v36, (uint64_t)a3);
    goto LABEL_32;
  }
  v62 = sub_2445683C0();
  v5((char *)v36, (uint64_t)a3);
  if (v62 == 32 && (sub_2445683CC() & 1) == 0)
  {
LABEL_32:
    v44((uint64_t)v43, v42, (uint64_t)a3);
    v84 = 0x7FFFFFFF;
    v56 = sub_2445683CC();
    v57 = sub_2445683C0();
    if ((v56 & 1) != 0)
    {
      if (v57 > 32)
      {
        sub_24455C144();
        v58 = v43;
        v59 = v74;
        v4 = a3;
        sub_2445683A8();
        v60 = sub_244568198();
        v5(v59, (uint64_t)a3);
        v61 = v58;
        goto LABEL_41;
      }
    }
    else if (v57 > 31)
    {
      v83 = 0x7FFFFFFF;
      v63 = v43;
      v64 = v74;
      (*(void (**)(char *, char *, char *))(v72 + 32))(v74, v63, a3);
      sub_24455C144();
      v65 = v71;
      v4 = a3;
      sub_2445683A8();
      v60 = sub_244568198();
      v5(v65, (uint64_t)a3);
      v61 = v64;
LABEL_41:
      v5(v61, (uint64_t)a3);
      if ((v60 & 1) == 0)
        goto LABEL_42;
      goto LABEL_46;
    }
    sub_2445683B4();
    v5(v43, (uint64_t)a3);
  }
LABEL_42:
  v66 = sub_2445683B4();
  v5(v42, (uint64_t)a3);
  result = sqlite3_bind_int(v75, v80, v66);
  if ((_DWORD)result)
  {
    v67 = result;
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v68 = v67;
    *(_QWORD *)(v68 + 8) = 0xD000000000000012;
    *(_QWORD *)(v68 + 16) = 0x8000000244568E70;
    *(_BYTE *)(v68 + 24) = 0;
    return swift_willThrow();
  }
  return result;
}

void sub_24455D060(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24455D06C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B514(a1, a2, a3);
}

uint64_t sub_24455D080@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_244563720(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_24455D0AC(__int128 *a1, uint64_t a2)
{
  unsigned __int8 *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C500((uint64_t)&v5, a2, *v2);
}

void sub_24455D0E0(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24455D0EC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B604(a1, a2, a3);
}

uint64_t sub_24455D100@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2445634F8(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_24455D12C(__int128 *a1, uint64_t a2)
{
  __int16 *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C2D4((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455D160@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B6F4(a1, a2, a3);
}

uint64_t sub_24455D174@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _WORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2445638A4(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_24455D1A0(__int128 *a1, uint64_t a2)
{
  unsigned __int16 *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C618((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455D1D4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B7E4(a1, a2, a3);
}

uint64_t sub_24455D1E8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_244563634(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_24455D214(__int128 *a1, uint64_t a2)
{
  int *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C3EC((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455D248@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B8D4(a1, a2, a3);
}

uint64_t sub_24455D25C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2445639DC(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t sub_24455D288(__int128 *a1, uint64_t a2)
{
  int *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455C730((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455D2BC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455B9C4(a1, a2, a3);
}

sqlite3_int64 sub_24455D2D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, sqlite3_int64 *a3@<X8>)
{
  uint64_t v3;
  sqlite3_int64 result;

  result = sub_2445640E4(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

uint64_t SQLiteInteger64.init(with:column:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  sqlite3_stmt *v17;
  uint64_t result;
  sqlite3_int64 v19;
  char v20;
  uint64_t v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  _QWORD v30[2];
  sqlite3_int64 v31;

  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v30 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v15 = (char *)v30 - v14;
  v16 = *(_QWORD *)(*(_QWORD *)v11 + 16);
  if (!v16 || !*(_QWORD *)(v16 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v25 = 4;
LABEL_11:
    *(_QWORD *)v24 = v25;
    *(_QWORD *)(v24 + 8) = 0;
    *(_QWORD *)(v24 + 16) = 0;
    *(_BYTE *)(v24 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v17 = *(sqlite3_stmt **)(*(_QWORD *)v11 + 24);
  if (!v17)
  {
    sub_2445470A0();
    swift_allocError();
    v25 = 3;
    goto LABEL_11;
  }
  v30[0] = v13;
  v30[1] = v12;
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    v19 = sqlite3_column_int64(v17, a2);
    if (a3 == MEMORY[0x24BEE4008])
      goto LABEL_20;
    sub_244568480();
    v20 = sub_2445683CC();
    v21 = sub_2445683C0();
    if ((v20 & 1) != 0)
    {
      if (v21 > 64)
      {
        v31 = v19;
        sub_24455D688();
        sub_2445683A8();
        v22 = sub_244568198();
        v23 = *(void (**)(char *, uint64_t))(v30[0] + 8);
        v23(v10, a3);
        goto LABEL_19;
      }
    }
    else if (v21 > 63)
    {
      v31 = v19;
      v27 = v30[0];
      (*(void (**)(char *, char *, uint64_t))(v30[0] + 16))(v7, v15, a3);
      if (v19 < 0)
      {
        v28 = *(void (**)(char *, uint64_t))(v27 + 8);
        v28(v7, a3);
        v28(v15, a3);
LABEL_22:
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v29 + 8) = 0;
        *(_QWORD *)(v29 + 16) = 0;
        *(_QWORD *)v29 = 8;
        *(_BYTE *)(v29 + 24) = 5;
        return swift_willThrow();
      }
      sub_24455D688();
      sub_2445683A8();
      v22 = sub_244568198();
      v23 = *(void (**)(char *, uint64_t))(v27 + 8);
      v23(v10, a3);
      v23(v7, a3);
LABEL_19:
      v23(v15, a3);
      if ((v22 & 1) == 0)
        goto LABEL_20;
      goto LABEL_22;
    }
    v26 = sub_2445683B4();
    (*(void (**)(char *, uint64_t))(v30[0] + 8))(v15, a3);
    if (v19 >= v26)
    {
LABEL_20:
      v31 = v19;
      sub_24455D688();
      return sub_2445683D8();
    }
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

unint64_t sub_24455D688()
{
  unint64_t result;

  result = qword_2573710D8;
  if (!qword_2573710D8)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2573710D8);
  }
  return result;
}

uint64_t sub_24455D6CC(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_14:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int64((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t sub_24455D7E0(uint64_t a1, uint64_t a2, sqlite3_int64 a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v3 || !*(_QWORD *)(v3 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_10:
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_QWORD *)v7 = v8;
    *(_BYTE *)(v7 + 24) = 5;
    return swift_willThrow();
  }
  result = *(_QWORD *)(*(_QWORD *)a1 + 24);
  if (!result)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_10;
  }
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (a3 < 0)
  {
LABEL_16:
    __break(1u);
    return result;
  }
  result = sqlite3_bind_int64((sqlite3_stmt *)result, a2, a3);
  if (!(_DWORD)result)
    return result;
  v5 = result;
  sub_2445470A0();
  swift_allocError();
  *(_QWORD *)v6 = v5;
  *(_QWORD *)(v6 + 8) = 0xD000000000000012;
  *(_QWORD *)(v6 + 16) = 0x8000000244568E70;
  *(_BYTE *)(v6 + 24) = 0;
  return swift_willThrow();
}

uint64_t SQLiteInteger64.bind(to:at:)(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  char *v4;
  void (*v5)(char *, uint64_t);
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
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
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  sqlite3_stmt *v29;
  void (*v30)(char *, uint64_t, uint64_t);
  char *v31;
  char v32;
  uint64_t v33;
  char *v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  char *v42;
  char *v43;
  void (*v44)(uint64_t, char *, uint64_t);
  char v45;
  uint64_t v46;
  char *v47;
  char v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char v52;
  int64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  char *v58;
  char *v59;
  char v60;
  char *v61;
  uint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  sqlite3_int64 v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[2];
  char *v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
  sqlite3_stmt *v75;
  char *v76;
  uint64_t v77;
  void (*v78)(uint64_t, char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  int64_t v83;

  v80 = a2;
  v79 = *(_QWORD *)(*(_QWORD *)(a4 + 16) + 8);
  v8 = *(_QWORD *)(*(_QWORD *)(v79 + 24) + 16);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = *((_QWORD *)a3 - 1);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = MEMORY[0x24BDAC7A8]((char *)v69 - v15);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v69 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v81 = (char *)v69 - v27;
  v28 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (!v28 || !*(_QWORD *)(v28 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v40 = 4;
LABEL_12:
    *(_QWORD *)(v39 + 8) = 0;
    *(_QWORD *)(v39 + 16) = 0;
    *(_QWORD *)v39 = v40;
    *(_BYTE *)(v39 + 24) = 5;
    return swift_willThrow();
  }
  v29 = *(sqlite3_stmt **)(*(_QWORD *)a1 + 24);
  if (!v29)
  {
    sub_2445470A0();
    swift_allocError();
    v40 = 3;
    goto LABEL_12;
  }
  if (v80 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_46;
  }
  if (v80 > 0x7FFFFFFF)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v69[1] = v8;
  v70 = v23;
  v73 = v22;
  v74 = v24;
  v76 = v25;
  v77 = v21;
  v71 = v26;
  v75 = v29;
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v31 = v81;
  v30(v81, (uint64_t)v4, (uint64_t)a3);
  v32 = sub_2445683CC();
  v78 = (void (*)(uint64_t, char *, uint64_t))v30;
  v30(v20, (uint64_t)v31, (uint64_t)a3);
  v72 = v11;
  if ((v32 & 1) == 0)
  {
    v5 = *(void (**)(char *, uint64_t))(v11 + 8);
    v5(v20, (uint64_t)a3);
    v42 = v81;
    v43 = v76;
    v36 = v77;
    v44 = v78;
    goto LABEL_31;
  }
  v33 = sub_2445683C0();
  v69[0] = *(_QWORD *)(v11 + 8);
  ((void (*)(char *, char *))v69[0])(v20, a3);
  if (v33 <= 64)
  {
    v42 = v81;
    v5 = (void (*)(char *, uint64_t))v69[0];
    v36 = v77;
    v44 = v78;
    v43 = v76;
    goto LABEL_31;
  }
  v34 = v73;
  v78((uint64_t)v73, v81, (uint64_t)a3);
  v83 = 0x8000000000000000;
  v35 = sub_2445683CC();
  v36 = v77;
  if ((v35 & 1) != 0)
  {
    if (sub_2445683C0() < 64)
    {
      v37 = sub_2445683B4();
      v5 = (void (*)(char *, uint64_t))v69[0];
      ((void (*)(char *, char *))v69[0])(v34, a3);
      v38 = v37 < v83;
      goto LABEL_27;
    }
LABEL_20:
    sub_24455D688();
    v47 = v74;
    sub_2445683A8();
    v48 = sub_244568198();
    v5 = (void (*)(char *, uint64_t))v69[0];
    ((void (*)(char *, char *))v69[0])(v47, a3);
    v5(v34, (uint64_t)a3);
    v42 = v81;
    v44 = v78;
    v43 = v76;
    if ((v48 & 1) == 0)
      goto LABEL_31;
    goto LABEL_29;
  }
  v45 = sub_2445683CC();
  v46 = sub_2445683C0();
  if ((v45 & 1) == 0)
  {
    v42 = v81;
    v44 = v78;
    v43 = v76;
    if (v46 > 64)
    {
LABEL_30:
      v5 = (void (*)(char *, uint64_t))v69[0];
      ((void (*)(char *, char *))v69[0])(v73, a3);
      goto LABEL_31;
    }
    v49 = v73;
    v50 = sub_2445683B4();
    v5 = (void (*)(char *, uint64_t))v69[0];
    ((void (*)(char *, char *))v69[0])(v49, a3);
    if (v50 >= v83)
      goto LABEL_31;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v46 > 64)
    goto LABEL_20;
  swift_getAssociatedConformanceWitness();
  sub_24456851C();
  v51 = v74;
  sub_244568504();
  v52 = sub_244568198();
  v5 = (void (*)(char *, uint64_t))v69[0];
  ((void (*)(char *, char *))v69[0])(v51, a3);
  v4 = v70;
  (*(void (**)(char *, char *, char *))(v72 + 32))(v70, v34, a3);
  if ((v52 & 1) != 0)
  {
LABEL_48:
    result = ((uint64_t (*)(char *, char *))v5)(v4, a3);
    __break(1u);
    return result;
  }
  v53 = v83;
  v54 = sub_2445683B4();
  v5(v4, (uint64_t)a3);
  v38 = v54 < v53;
LABEL_27:
  v42 = v81;
  v44 = v78;
  v43 = v76;
  if (v38)
    goto LABEL_29;
LABEL_31:
  v55 = sub_2445683C0();
  v44(v36, v42, (uint64_t)a3);
  if (v55 >= 65)
  {
    v5((char *)v36, (uint64_t)a3);
    goto LABEL_33;
  }
  v62 = sub_2445683C0();
  v5((char *)v36, (uint64_t)a3);
  if (v62 == 64 && (sub_2445683CC() & 1) == 0)
  {
LABEL_33:
    v44((uint64_t)v43, v42, (uint64_t)a3);
    v83 = 0x7FFFFFFFFFFFFFFFLL;
    v56 = sub_2445683CC();
    v57 = sub_2445683C0();
    if ((v56 & 1) != 0)
    {
      if (v57 > 64)
      {
        sub_24455D688();
        v58 = v43;
        v59 = v74;
        v4 = a3;
        sub_2445683A8();
        v60 = sub_244568198();
        v5(v59, (uint64_t)a3);
        v61 = v58;
        goto LABEL_42;
      }
    }
    else if (v57 > 63)
    {
      v82 = 0x7FFFFFFFFFFFFFFFLL;
      v63 = v43;
      v64 = v74;
      (*(void (**)(char *, char *, char *))(v72 + 32))(v74, v63, a3);
      sub_24455D688();
      v65 = v71;
      v4 = a3;
      sub_2445683A8();
      v60 = sub_244568198();
      v5(v65, (uint64_t)a3);
      v61 = v64;
LABEL_42:
      v5(v61, (uint64_t)a3);
      if ((v60 & 1) == 0)
        goto LABEL_43;
      goto LABEL_47;
    }
    sub_2445683B4();
    v5(v43, (uint64_t)a3);
  }
LABEL_43:
  v66 = sub_2445683B4();
  v5(v42, (uint64_t)a3);
  result = sqlite3_bind_int64(v75, v80, v66);
  if ((_DWORD)result)
  {
    v67 = result;
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v68 = v67;
    *(_QWORD *)(v68 + 8) = 0xD000000000000012;
    *(_QWORD *)(v68 + 16) = 0x8000000244568E70;
    *(_BYTE *)(v68 + 24) = 0;
    return swift_willThrow();
  }
  return result;
}

unint64_t sub_24455E110(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E134();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E134()
{
  unint64_t result;

  result = qword_2573710E0;
  if (!qword_2573710E0)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE3E80], MEMORY[0x24BEE3E50]);
    atomic_store(result, (unint64_t *)&qword_2573710E0);
  }
  return result;
}

unint64_t sub_24455E178(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E19C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E19C()
{
  unint64_t result;

  result = qword_2573710E8;
  if (!qword_2573710E8)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE42A0], MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_2573710E8);
  }
  return result;
}

unint64_t sub_24455E1E0(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E204();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E204()
{
  unint64_t result;

  result = qword_2573710F0;
  if (!qword_2573710F0)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE3F60], MEMORY[0x24BEE3F30]);
    atomic_store(result, (unint64_t *)&qword_2573710F0);
  }
  return result;
}

unint64_t sub_24455E248(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E26C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E26C()
{
  unint64_t result;

  result = qword_2573710F8;
  if (!qword_2573710F8)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE44C0], MEMORY[0x24BEE4478]);
    atomic_store(result, (unint64_t *)&qword_2573710F8);
  }
  return result;
}

unint64_t sub_24455E2B0(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E2D4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E2D4()
{
  unint64_t result;

  result = qword_257371100;
  if (!qword_257371100)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE3FD8], MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_257371100);
  }
  return result;
}

unint64_t sub_24455E318(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E33C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E33C()
{
  unint64_t result;

  result = qword_257371108;
  if (!qword_257371108)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE4540], MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_257371108);
  }
  return result;
}

unint64_t sub_24455E380(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E3A4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E3A4()
{
  unint64_t result;

  result = qword_257371110;
  if (!qword_257371110)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE4048], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_257371110);
  }
  return result;
}

void sub_24455E3E8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_24455E3F4@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455BAC8(a1, a2, &qword_257371160, &qword_257371168, (uint64_t)&protocol witness table for Int64, a3);
}

unint64_t sub_24455E420(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E444();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E444()
{
  unint64_t result;

  result = qword_257371118;
  if (!qword_257371118)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE45A8], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_257371118);
  }
  return result;
}

uint64_t sub_24455E488@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_2445641D0(*a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

void sub_24455E4B4(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24455E4C0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455BBC4(a1, a2, &qword_257371150, &qword_257371158, (uint64_t)&protocol witness table for UInt64, a3);
}

unint64_t sub_24455E4EC(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E510();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E510()
{
  unint64_t result;

  result = qword_257371120;
  if (!qword_257371120)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_257371120);
  }
  return result;
}

uint64_t sub_24455E554(__int128 *a1, uint64_t a2)
{
  sqlite3_int64 *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455D6CC((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455E588@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455BAC8(a1, a2, &qword_257371140, &qword_257371148, (uint64_t)&protocol witness table for Int, a3);
}

unint64_t sub_24455E5B4(uint64_t a1)
{
  unint64_t result;

  result = sub_24455E5D8();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24455E5D8()
{
  unint64_t result;

  result = qword_257371128;
  if (!qword_257371128)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BEE1EC8], MEMORY[0x24BEE1E88]);
    atomic_store(result, (unint64_t *)&qword_257371128);
  }
  return result;
}

uint64_t sub_24455E61C(__int128 *a1, uint64_t a2)
{
  sqlite3_int64 *v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];

  v3 = a1[1];
  v5 = *a1;
  v6[0] = v3;
  *(_OWORD *)((char *)v6 + 9) = *(__int128 *)((char *)a1 + 25);
  return sub_24455D7E0((uint64_t)&v5, a2, *v2);
}

uint64_t sub_24455E650@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24455BBC4(a1, a2, &qword_257371130, &qword_257371138, (uint64_t)&protocol witness table for UInt, a3);
}

_QWORD *sub_24455E67C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573710C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24455E6E0(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_24456827C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x249511858](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_24455E758(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned __int8 v16;
  char v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;
  int v29;
  char v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned int v36;
  char v37;
  int v38;
  char v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  int v43;
  unsigned int v44;
  char v45;
  int v46;
  char v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  char v54;
  int v55;
  char v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 *v60;
  unsigned int v61;
  char v62;
  int v63;
  char v64;
  _QWORD v65[2];
  unsigned __int8 v66;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v66 = 0;
    goto LABEL_145;
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v31 = v6 - 1;
        if (v6 != 1)
        {
          v32 = a3 + 87;
          if (a3 > 10)
          {
            v33 = a3 + 55;
          }
          else
          {
            v32 = 97;
            v33 = 65;
          }
          if (a3 <= 10)
            v34 = a3 + 48;
          else
            v34 = 58;
          if (result)
          {
            LOBYTE(v12) = 0;
            v35 = (unsigned __int8 *)(result + 1);
            do
            {
              v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v36 < 0x61 || v36 >= v32)
                    goto LABEL_144;
                  v37 = -87;
                }
                else
                {
                  v37 = -55;
                }
              }
              else
              {
                v37 = -48;
              }
              v38 = (char)v12 * (char)a3;
              v39 = v38;
              if ((char)v38 != v38)
                goto LABEL_143;
              v12 = (char)v38 + (char)(v36 + v37);
              if ((char)(v39 + v36 + v37) != v12)
                goto LABEL_143;
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            v16 = v12;
            v66 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v40 = a3 + 87;
        if (a3 > 10)
        {
          v41 = a3 + 55;
        }
        else
        {
          v40 = 97;
          v41 = 65;
        }
        if (a3 <= 10)
          v42 = a3 + 48;
        else
          v42 = 58;
        if (result)
        {
          LOBYTE(v43) = 0;
          do
          {
            v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                v16 = 0;
                v17 = 1;
                if (v44 < 0x61 || v44 >= v40)
                  goto LABEL_144;
                v45 = -87;
              }
              else
              {
                v45 = -55;
              }
            }
            else
            {
              v45 = -48;
            }
            v46 = (char)v43 * (char)a3;
            v47 = v46;
            if ((char)v46 != v46)
              goto LABEL_143;
            v43 = (char)v46 + (char)(v44 + v45);
            if ((char)(v47 + v44 + v45) != v43)
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v43;
          v66 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          LOBYTE(v12) = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            v18 = (char)v12 * (char)a3;
            v19 = v18;
            if ((char)v18 != v18)
              goto LABEL_143;
            v12 = (char)v18 - (char)(v14 + v15);
            if ((char)(v19 - (v14 + v15)) != v12)
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v66 = v17;
LABEL_145:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v66 << 8) | (LOBYTE(v65[0]) << 16);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        LOBYTE(v22) = 0;
        v57 = a3 + 87;
        if (a3 > 10)
        {
          v58 = a3 + 55;
        }
        else
        {
          v57 = 97;
          v58 = 65;
        }
        if (a3 <= 10)
          v59 = a3 + 48;
        else
          v59 = 58;
        v60 = (unsigned __int8 *)v65;
        while (1)
        {
          v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              v16 = 0;
              v17 = 1;
              if (v61 < 0x61 || v61 >= v57)
                goto LABEL_144;
              v62 = -87;
            }
            else
            {
              v62 = -55;
            }
          }
          else
          {
            v62 = -48;
          }
          v63 = (char)v22 * (char)a3;
          v64 = v63;
          if ((char)v63 != v63)
            goto LABEL_143;
          v22 = (char)v63 + (char)(v61 + v62);
          if ((char)(v64 + v61 + v62) != v22)
            goto LABEL_143;
          ++v60;
          if (!--v20)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      v21 = v20 - 1;
      if (v21)
      {
        LOBYTE(v22) = 0;
        v23 = a3 + 87;
        if (a3 > 10)
        {
          v24 = a3 + 55;
        }
        else
        {
          v23 = 97;
          v24 = 65;
        }
        if (a3 <= 10)
          v25 = a3 + 48;
        else
          v25 = 58;
        v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v16 = 0;
              v17 = 1;
              if (v27 < 0x61 || v27 >= v23)
                goto LABEL_144;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = (char)v22 * (char)a3;
          v30 = v29;
          if ((char)v29 != v29)
            goto LABEL_143;
          v22 = (char)v29 - (char)(v27 + v28);
          if ((char)(v30 - (v27 + v28)) != v22)
            goto LABEL_143;
          ++v26;
          if (!--v21)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    v48 = v20 - 1;
    if (v48)
    {
      LOBYTE(v22) = 0;
      v49 = a3 + 87;
      if (a3 > 10)
      {
        v50 = a3 + 55;
      }
      else
      {
        v49 = 97;
        v50 = 65;
      }
      if (a3 <= 10)
        v51 = a3 + 48;
      else
        v51 = 58;
      v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            v16 = 0;
            v17 = 1;
            if (v53 < 0x61 || v53 >= v49)
              goto LABEL_144;
            v54 = -87;
          }
          else
          {
            v54 = -55;
          }
        }
        else
        {
          v54 = -48;
        }
        v55 = (char)v22 * (char)a3;
        v56 = v55;
        if ((char)v55 != v55)
          goto LABEL_143;
        v22 = (char)v55 + (char)(v53 + v54);
        if ((char)(v56 + v53 + v54) != v22)
          goto LABEL_143;
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      v16 = v22;
      v66 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_24455ED1C(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int8 v12;
  int v13;
  int v14;
  char v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  int v23;
  char v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  int v28;
  unsigned int v29;
  char v30;
  int v31;
  char v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (char)v8 * (char)a3;
            v24 = v23;
            if ((char)v23 != v23)
              goto LABEL_72;
            v8 = (char)v23 + (char)(v21 + v22);
            if ((char)(v24 + v21 + v22) != v8)
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          LOBYTE(v28) = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (char)v28 * (char)a3;
            v32 = v31;
            if ((char)v31 != v31)
              goto LABEL_72;
            v28 = (char)v31 + (char)(v29 + v30);
            if ((char)(v32 + v29 + v30) != v28)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (char)v8 * (char)a3;
            v15 = v14;
            if ((char)v14 != v14)
              goto LABEL_72;
            v8 = (char)v14 - (char)(v10 + v11);
            if ((char)(v15 - (v10 + v11)) != v8)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24455EFD0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_244568294();
  v4 = sub_24455F04C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24455F04C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_24455F190(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_24455E67C(v9, 0);
      v12 = sub_24455F27C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x2495117F8](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x2495117F8);
LABEL_9:
      sub_244568420();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x2495117F8]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_24455F190(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_24455E6E0(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_24455E6E0(a2, a3, a4);
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
    return sub_244568264();
  }
  __break(1u);
  return result;
}

unint64_t sub_24455F27C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[2];

  if (!a2)
  {
    v13 = 0;
    v15 = a4;
LABEL_34:
    *(_QWORD *)result = a4;
    *(_QWORD *)(result + 8) = a5;
    *(_QWORD *)(result + 16) = a6;
    *(_QWORD *)(result + 24) = a7;
    *(_QWORD *)(result + 32) = v15;
    return v13;
  }
  if (!a3)
  {
    v15 = a4;
    v13 = 0;
    goto LABEL_34;
  }
  v10 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v10) = 1;
  v11 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v11 = a6 & 0xFFFFFFFFFFFFLL;
  v27 = v11;
  if (a3 < 0)
    goto LABEL_37;
  v23 = result;
  v24 = a5;
  v13 = 0;
  v14 = a5 >> 14;
  v15 = a4;
  v16 = 4 << v10;
  v17 = a4 >> 14;
  v25 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v26 = a7 & 0xFFFFFFFFFFFFFFLL;
  v22 = a4;
  v28 = a4 >> 14;
  while (1)
  {
    v18 = v15 >> 14;
    if (v15 >> 14 == v14)
      goto LABEL_33;
    v19 = v15 & 0xC;
    v20 = v15;
    if (v19 == v16)
      break;
    if (v18 < v17)
      goto LABEL_35;
LABEL_14:
    if (v18 >= v14)
      goto LABEL_35;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_244568270();
      v17 = v28;
      v21 = result;
      if (v19 != v16)
        goto LABEL_22;
    }
    else if ((a7 & 0x2000000000000000) != 0)
    {
      v29[0] = a6;
      v29[1] = v26;
      v21 = *((_BYTE *)v29 + (v20 >> 16));
      if (v19 != v16)
        goto LABEL_22;
    }
    else
    {
      result = v25;
      if ((a6 & 0x1000000000000000) == 0)
      {
        result = sub_244568420();
        v17 = v28;
      }
      v21 = *(_BYTE *)(result + (v20 >> 16));
      if (v19 != v16)
      {
LABEL_22:
        if ((a7 & 0x1000000000000000) != 0)
          goto LABEL_23;
        goto LABEL_9;
      }
    }
    result = sub_24455E6E0(v15, a6, a7);
    v17 = v28;
    v15 = result;
    if ((a7 & 0x1000000000000000) != 0)
    {
LABEL_23:
      if (v27 <= v15 >> 16)
        goto LABEL_36;
      result = sub_24456824C();
      v17 = v28;
      v15 = result;
      goto LABEL_10;
    }
LABEL_9:
    v15 = (v15 & 0xFFFFFFFFFFFF0000) + 65540;
LABEL_10:
    *(_BYTE *)(a2 + v13++) = v21;
    if (a3 == v13)
    {
      v13 = a3;
LABEL_33:
      result = v23;
      a5 = v24;
      a4 = v22;
      goto LABEL_34;
    }
  }
  result = sub_24455E6E0(v15, a6, a7);
  v17 = v28;
  v20 = result;
  v18 = result >> 14;
  if (result >> 14 >= v28)
    goto LABEL_14;
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_24455F4A8(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned __int8 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 *v24;
  unsigned int v25;
  char v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 *v31;
  unsigned int v32;
  char v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned int v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 *v44;
  unsigned int v45;
  char v46;
  unsigned __int8 v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 *v50;
  unsigned int v51;
  char v52;
  _QWORD v53[2];
  unsigned __int8 v54;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v54 = 0;
    goto LABEL_145;
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v27 = v6 - 1;
        if (v6 != 1)
        {
          v28 = a3 + 87;
          if (a3 > 10)
          {
            v29 = a3 + 55;
          }
          else
          {
            v28 = 97;
            v29 = 65;
          }
          if (a3 <= 10)
            v30 = a3 + 48;
          else
            v30 = 58;
          if (result)
          {
            LOBYTE(v12) = 0;
            v31 = (unsigned __int8 *)(result + 1);
            do
            {
              v32 = *v31;
              if (v32 < 0x30 || v32 >= v30)
              {
                if (v32 < 0x41 || v32 >= v29)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v32 < 0x61 || v32 >= v28)
                    goto LABEL_144;
                  v33 = -87;
                }
                else
                {
                  v33 = -55;
                }
              }
              else
              {
                v33 = -48;
              }
              if (((v12 * (unsigned __int16)a3) & 0xFF00) != 0)
                goto LABEL_143;
              v12 = (v12 * a3) + (v32 + v33);
              if (((v12 >> 8) & 1) != 0)
                goto LABEL_143;
              ++v31;
              --v27;
            }
            while (v27);
LABEL_76:
            v16 = v12;
            v54 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v34 = a3 + 87;
        if (a3 > 10)
        {
          v35 = a3 + 55;
        }
        else
        {
          v34 = 97;
          v35 = 65;
        }
        if (a3 <= 10)
          v36 = a3 + 48;
        else
          v36 = 58;
        if (result)
        {
          LOBYTE(v37) = 0;
          do
          {
            v38 = *(unsigned __int8 *)result;
            if (v38 < 0x30 || v38 >= v36)
            {
              if (v38 < 0x41 || v38 >= v35)
              {
                v16 = 0;
                v17 = 1;
                if (v38 < 0x61 || v38 >= v34)
                  goto LABEL_144;
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            if (((v37 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_143;
            v37 = (v37 * a3) + (v38 + v39);
            if (((v37 >> 8) & 1) != 0)
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v37;
          v54 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          LOBYTE(v12) = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            if (((v12 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_143;
            v12 = (v12 * a3) - (v14 + v15);
            if ((v12 & 0xFFFFFF00) != 0)
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v54 = v17;
LABEL_145:
        LOBYTE(v53[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v54 << 8) | (LOBYTE(v53[0]) << 16);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v18 = HIBYTE(a2) & 0xF;
  v53[0] = result;
  v53[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v18)
      {
        LOBYTE(v20) = 0;
        v47 = a3 + 87;
        if (a3 > 10)
        {
          v48 = a3 + 55;
        }
        else
        {
          v47 = 97;
          v48 = 65;
        }
        if (a3 <= 10)
          v49 = a3 + 48;
        else
          v49 = 58;
        v50 = (unsigned __int8 *)v53;
        while (1)
        {
          v51 = *v50;
          if (v51 < 0x30 || v51 >= v49)
          {
            if (v51 < 0x41 || v51 >= v48)
            {
              v16 = 0;
              v17 = 1;
              if (v51 < 0x61 || v51 >= v47)
                goto LABEL_144;
              v52 = -87;
            }
            else
            {
              v52 = -55;
            }
          }
          else
          {
            v52 = -48;
          }
          if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0)
            goto LABEL_143;
          v20 = (v20 * a3) + (v51 + v52);
          if (((v20 >> 8) & 1) != 0)
            goto LABEL_143;
          ++v50;
          if (!--v18)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v18)
    {
      v19 = v18 - 1;
      if (v19)
      {
        LOBYTE(v20) = 0;
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        v24 = (unsigned __int8 *)v53 + 1;
        while (1)
        {
          v25 = *v24;
          if (v25 < 0x30 || v25 >= v23)
          {
            if (v25 < 0x41 || v25 >= v22)
            {
              v16 = 0;
              v17 = 1;
              if (v25 < 0x61 || v25 >= v21)
                goto LABEL_144;
              v26 = -87;
            }
            else
            {
              v26 = -55;
            }
          }
          else
          {
            v26 = -48;
          }
          if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0)
            goto LABEL_143;
          v20 = (v20 * a3) - (v25 + v26);
          if ((v20 & 0xFFFFFF00) != 0)
            goto LABEL_143;
          ++v24;
          if (!--v19)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v18)
  {
    v40 = v18 - 1;
    if (v40)
    {
      LOBYTE(v20) = 0;
      v41 = a3 + 87;
      if (a3 > 10)
      {
        v42 = a3 + 55;
      }
      else
      {
        v41 = 97;
        v42 = 65;
      }
      if (a3 <= 10)
        v43 = a3 + 48;
      else
        v43 = 58;
      v44 = (unsigned __int8 *)v53 + 1;
      do
      {
        v45 = *v44;
        if (v45 < 0x30 || v45 >= v43)
        {
          if (v45 < 0x41 || v45 >= v42)
          {
            v16 = 0;
            v17 = 1;
            if (v45 < 0x61 || v45 >= v41)
              goto LABEL_144;
            v46 = -87;
          }
          else
          {
            v46 = -55;
          }
        }
        else
        {
          v46 = -48;
        }
        if (((v20 * (unsigned __int16)a3) & 0xFF00) != 0)
          goto LABEL_143;
        v20 = (v20 * a3) + (v45 + v46);
        if (((v20 >> 8) & 1) != 0)
          goto LABEL_143;
        ++v44;
        --v40;
      }
      while (v40);
LABEL_142:
      v16 = v20;
      v54 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_24455FA54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v8[2];

  swift_bridgeObjectRetain();
  v8[0] = sub_244568288();
  v8[1] = v6;
  LOWORD(a4) = sub_24455FAD8(v8, a3, a4);
  swift_bridgeObjectRelease();
  return (unsigned __int16)a4 & 0x1FF;
}

uint64_t sub_24455FAD8(uint64_t *a1, uint64_t a2, uint64_t (*a3)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  _QWORD v16[2];

  v6 = *a1;
  v7 = a1[1];
  if ((v7 & 0x1000000000000000) == 0)
  {
    if ((v7 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v16[0] = v6;
    v16[1] = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = v16;
    goto LABEL_7;
  }
  v6 = sub_24455EFD0();
  v12 = v11;
  swift_bridgeObjectRelease();
  *a1 = v6;
  a1[1] = v12;
  v7 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (_QWORD *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (_QWORD *)sub_244568420();
  }
LABEL_7:
  v13 = a3(v8, v9, a2);
  if (!v3)
    return v13 & 0x1FF;
  return v14;
}

unsigned __int8 *sub_24455FBA8(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int8 v12;
  int v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned int v25;
  char v26;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v14 = a2 - 1;
      if (a2 != 1)
      {
        v15 = a3 + 87;
        if (a3 > 10)
        {
          v16 = a3 + 55;
        }
        else
        {
          v15 = 97;
          v16 = 65;
        }
        if (a3 <= 10)
          v17 = a3 + 48;
        else
          v17 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v18 = result + 1;
          do
          {
            v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                v12 = 0;
                v13 = 1;
                if (v19 < 0x61 || v19 >= v15)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
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
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) + (v19 + v20);
            if (((v8 >> 8) & 1) != 0)
              goto LABEL_72;
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 8));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        if (result)
        {
          LOBYTE(v24) = 0;
          do
          {
            v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                v12 = 0;
                v13 = 1;
                if (v25 < 0x61 || v25 >= v21)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v26 = -87;
              }
              else
              {
                v26 = -55;
              }
            }
            else
            {
              v26 = -48;
            }
            if (((v24 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v24 = (v24 * a3) + (v25 + v26);
            if (((v24 >> 8) & 1) != 0)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 8));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOBYTE(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 8));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            if (((v8 * (unsigned __int16)a3) & 0xFF00) != 0)
              goto LABEL_72;
            v8 = (v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFFFF00) != 0)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 8));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24455FE50(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned __int16 v16;
  char v17;
  int v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;
  int v29;
  __int16 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned int v36;
  char v37;
  int v38;
  __int16 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  int v43;
  unsigned int v44;
  char v45;
  int v46;
  __int16 v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  char v54;
  int v55;
  __int16 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 *v60;
  unsigned int v61;
  char v62;
  int v63;
  __int16 v64;
  _QWORD v65[2];
  unsigned __int8 v66;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v66 = 0;
    goto LABEL_145;
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v31 = v6 - 1;
        if (v6 != 1)
        {
          v32 = a3 + 87;
          if (a3 > 10)
          {
            v33 = a3 + 55;
          }
          else
          {
            v32 = 97;
            v33 = 65;
          }
          if (a3 <= 10)
            v34 = a3 + 48;
          else
            v34 = 58;
          if (result)
          {
            LOWORD(v12) = 0;
            v35 = (unsigned __int8 *)(result + 1);
            do
            {
              v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v36 < 0x61 || v36 >= v32)
                    goto LABEL_144;
                  v37 = -87;
                }
                else
                {
                  v37 = -55;
                }
              }
              else
              {
                v37 = -48;
              }
              v38 = (__int16)v12 * (__int16)a3;
              v39 = v38;
              if ((__int16)v38 != v38)
                goto LABEL_143;
              v12 = (__int16)v38 + (v36 + v37);
              if ((__int16)(v39 + (v36 + v37)) != v12)
                goto LABEL_143;
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            v16 = v12;
            v66 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v40 = a3 + 87;
        if (a3 > 10)
        {
          v41 = a3 + 55;
        }
        else
        {
          v40 = 97;
          v41 = 65;
        }
        if (a3 <= 10)
          v42 = a3 + 48;
        else
          v42 = 58;
        if (result)
        {
          LOWORD(v43) = 0;
          do
          {
            v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                v16 = 0;
                v17 = 1;
                if (v44 < 0x61 || v44 >= v40)
                  goto LABEL_144;
                v45 = -87;
              }
              else
              {
                v45 = -55;
              }
            }
            else
            {
              v45 = -48;
            }
            v46 = (__int16)v43 * (__int16)a3;
            v47 = v46;
            if ((__int16)v46 != v46)
              goto LABEL_143;
            v43 = (__int16)v46 + (v44 + v45);
            if ((__int16)(v47 + (v44 + v45)) != v43)
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v43;
          v66 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          LOWORD(v12) = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            v18 = (__int16)v12 * (__int16)a3;
            v19 = v18;
            if ((__int16)v18 != v18)
              goto LABEL_143;
            v12 = (__int16)v18 - (v14 + v15);
            if ((__int16)(v19 - (v14 + v15)) != v12)
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v66 = v17;
LABEL_145:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v66 << 16) | (LOBYTE(v65[0]) << 24);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        LOWORD(v22) = 0;
        v57 = a3 + 87;
        if (a3 > 10)
        {
          v58 = a3 + 55;
        }
        else
        {
          v57 = 97;
          v58 = 65;
        }
        if (a3 <= 10)
          v59 = a3 + 48;
        else
          v59 = 58;
        v60 = (unsigned __int8 *)v65;
        while (1)
        {
          v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              v16 = 0;
              v17 = 1;
              if (v61 < 0x61 || v61 >= v57)
                goto LABEL_144;
              v62 = -87;
            }
            else
            {
              v62 = -55;
            }
          }
          else
          {
            v62 = -48;
          }
          v63 = (__int16)v22 * (__int16)a3;
          v64 = v63;
          if ((__int16)v63 != v63)
            goto LABEL_143;
          v22 = (__int16)v63 + (v61 + v62);
          if ((__int16)(v64 + (v61 + v62)) != v22)
            goto LABEL_143;
          ++v60;
          if (!--v20)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      v21 = v20 - 1;
      if (v21)
      {
        LOWORD(v22) = 0;
        v23 = a3 + 87;
        if (a3 > 10)
        {
          v24 = a3 + 55;
        }
        else
        {
          v23 = 97;
          v24 = 65;
        }
        if (a3 <= 10)
          v25 = a3 + 48;
        else
          v25 = 58;
        v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v16 = 0;
              v17 = 1;
              if (v27 < 0x61 || v27 >= v23)
                goto LABEL_144;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = (__int16)v22 * (__int16)a3;
          v30 = v29;
          if ((__int16)v29 != v29)
            goto LABEL_143;
          v22 = (__int16)v29 - (v27 + v28);
          if ((__int16)(v30 - (v27 + v28)) != v22)
            goto LABEL_143;
          ++v26;
          if (!--v21)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    v48 = v20 - 1;
    if (v48)
    {
      LOWORD(v22) = 0;
      v49 = a3 + 87;
      if (a3 > 10)
      {
        v50 = a3 + 55;
      }
      else
      {
        v49 = 97;
        v50 = 65;
      }
      if (a3 <= 10)
        v51 = a3 + 48;
      else
        v51 = 58;
      v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            v16 = 0;
            v17 = 1;
            if (v53 < 0x61 || v53 >= v49)
              goto LABEL_144;
            v54 = -87;
          }
          else
          {
            v54 = -55;
          }
        }
        else
        {
          v54 = -48;
        }
        v55 = (__int16)v22 * (__int16)a3;
        v56 = v55;
        if ((__int16)v55 != v55)
          goto LABEL_143;
        v22 = (__int16)v55 + (v53 + v54);
        if ((__int16)(v56 + (v53 + v54)) != v22)
          goto LABEL_143;
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      v16 = v22;
      v66 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_244560414(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int16 v12;
  int v13;
  int v14;
  __int16 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  int v23;
  __int16 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  int v28;
  unsigned int v29;
  char v30;
  int v31;
  __int16 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (__int16)v8 * (__int16)a3;
            v24 = v23;
            if ((__int16)v23 != v23)
              goto LABEL_72;
            v8 = (__int16)v23 + (v21 + v22);
            if ((__int16)(v24 + (v21 + v22)) != v8)
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          LOWORD(v28) = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (__int16)v28 * (__int16)a3;
            v32 = v31;
            if ((__int16)v31 != v31)
              goto LABEL_72;
            v28 = (__int16)v31 + (v29 + v30);
            if ((__int16)(v32 + (v29 + v30)) != v28)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (__int16)v8 * (__int16)a3;
            v15 = v14;
            if ((__int16)v14 != v14)
              goto LABEL_72;
            v8 = (__int16)v14 - (v10 + v11);
            if ((__int16)(v15 - (v10 + v11)) != v8)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_2445606C8(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned __int16 v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 *v24;
  unsigned int v25;
  char v26;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 *v31;
  unsigned int v32;
  char v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  int v37;
  unsigned int v38;
  char v39;
  int v40;
  uint64_t v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned __int8 *v45;
  unsigned int v46;
  char v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 *v51;
  unsigned int v52;
  char v53;
  _QWORD v54[2];
  unsigned __int8 v55;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v55 = 0;
    goto LABEL_145;
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v27 = v6 - 1;
        if (v6 != 1)
        {
          v28 = a3 + 87;
          if (a3 > 10)
          {
            v29 = a3 + 55;
          }
          else
          {
            v28 = 97;
            v29 = 65;
          }
          if (a3 <= 10)
            v30 = a3 + 48;
          else
            v30 = 58;
          if (result)
          {
            LOWORD(v12) = 0;
            v31 = (unsigned __int8 *)(result + 1);
            do
            {
              v32 = *v31;
              if (v32 < 0x30 || v32 >= v30)
              {
                if (v32 < 0x41 || v32 >= v29)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v32 < 0x61 || v32 >= v28)
                    goto LABEL_144;
                  v33 = -87;
                }
                else
                {
                  v33 = -55;
                }
              }
              else
              {
                v33 = -48;
              }
              if ((((unsigned __int16)v12 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
                goto LABEL_143;
              v12 = (unsigned __int16)(v12 * a3) + (v32 + v33);
              if ((v12 & 0x10000) != 0)
                goto LABEL_143;
              ++v31;
              --v27;
            }
            while (v27);
LABEL_76:
            v16 = v12;
            v55 = 0;
            goto LABEL_145;
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v34 = a3 + 87;
        if (a3 > 10)
        {
          v35 = a3 + 55;
        }
        else
        {
          v34 = 97;
          v35 = 65;
        }
        if (a3 <= 10)
          v36 = a3 + 48;
        else
          v36 = 58;
        if (result)
        {
          LOWORD(v37) = 0;
          do
          {
            v38 = *(unsigned __int8 *)result;
            if (v38 < 0x30 || v38 >= v36)
            {
              if (v38 < 0x41 || v38 >= v35)
              {
                v16 = 0;
                v17 = 1;
                if (v38 < 0x61 || v38 >= v34)
                  goto LABEL_144;
                v39 = -87;
              }
              else
              {
                v39 = -55;
              }
            }
            else
            {
              v39 = -48;
            }
            v40 = (unsigned __int16)v37 * (unsigned __int16)a3;
            if ((v40 & 0xFFFF0000) != 0)
              goto LABEL_143;
            v37 = (unsigned __int16)(v37 * a3) + (v38 + v39);
            if ((v37 & 0x10000) != 0)
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v40 + (v38 + v39);
          v55 = 0;
          goto LABEL_145;
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          LOWORD(v12) = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            if ((((unsigned __int16)v12 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
              goto LABEL_143;
            v12 = (unsigned __int16)(v12 * a3) - (v14 + v15);
            if ((v12 & 0xFFFF0000) != 0)
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v55 = v17;
LABEL_145:
        LOBYTE(v54[0]) = (a2 & 0x1000000000000000) != 0;
        return v16 | (v55 << 16) | (LOBYTE(v54[0]) << 24);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v18 = HIBYTE(a2) & 0xF;
  v54[0] = result;
  v54[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v18)
      {
        LOWORD(v20) = 0;
        v48 = a3 + 87;
        if (a3 > 10)
        {
          v49 = a3 + 55;
        }
        else
        {
          v48 = 97;
          v49 = 65;
        }
        if (a3 <= 10)
          v50 = a3 + 48;
        else
          v50 = 58;
        v51 = (unsigned __int8 *)v54;
        while (1)
        {
          v52 = *v51;
          if (v52 < 0x30 || v52 >= v50)
          {
            if (v52 < 0x41 || v52 >= v49)
            {
              v16 = 0;
              v17 = 1;
              if (v52 < 0x61 || v52 >= v48)
                goto LABEL_144;
              v53 = -87;
            }
            else
            {
              v53 = -55;
            }
          }
          else
          {
            v53 = -48;
          }
          if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
            goto LABEL_143;
          v20 = (unsigned __int16)(v20 * a3) + (v52 + v53);
          if ((v20 & 0x10000) != 0)
            goto LABEL_143;
          ++v51;
          if (!--v18)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v18)
    {
      v19 = v18 - 1;
      if (v19)
      {
        LOWORD(v20) = 0;
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        v24 = (unsigned __int8 *)v54 + 1;
        while (1)
        {
          v25 = *v24;
          if (v25 < 0x30 || v25 >= v23)
          {
            if (v25 < 0x41 || v25 >= v22)
            {
              v16 = 0;
              v17 = 1;
              if (v25 < 0x61 || v25 >= v21)
                goto LABEL_144;
              v26 = -87;
            }
            else
            {
              v26 = -55;
            }
          }
          else
          {
            v26 = -48;
          }
          if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
            goto LABEL_143;
          v20 = (unsigned __int16)(v20 * a3) - (v25 + v26);
          if ((v20 & 0xFFFF0000) != 0)
            goto LABEL_143;
          ++v24;
          if (!--v19)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v18)
  {
    v41 = v18 - 1;
    if (v41)
    {
      LOWORD(v20) = 0;
      v42 = a3 + 87;
      if (a3 > 10)
      {
        v43 = a3 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a3 <= 10)
        v44 = a3 + 48;
      else
        v44 = 58;
      v45 = (unsigned __int8 *)v54 + 1;
      do
      {
        v46 = *v45;
        if (v46 < 0x30 || v46 >= v44)
        {
          if (v46 < 0x41 || v46 >= v43)
          {
            v16 = 0;
            v17 = 1;
            if (v46 < 0x61 || v46 >= v42)
              goto LABEL_144;
            v47 = -87;
          }
          else
          {
            v47 = -55;
          }
        }
        else
        {
          v47 = -48;
        }
        if ((((unsigned __int16)v20 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
          goto LABEL_143;
        v20 = (unsigned __int16)(v20 * a3) + (v46 + v47);
        if ((v20 & 0x10000) != 0)
          goto LABEL_143;
        ++v45;
        --v41;
      }
      while (v41);
LABEL_142:
      v16 = v20;
      v55 = 0;
      goto LABEL_145;
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_244560C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v8[2];

  swift_bridgeObjectRetain();
  v8[0] = sub_244568288();
  v8[1] = v6;
  LODWORD(a4) = sub_244560CF8(v8, a3, a4);
  swift_bridgeObjectRelease();
  return a4 & 0x1FFFF;
}

uint64_t sub_244560CF8(uint64_t *a1, uint64_t a2, uint64_t (*a3)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  _QWORD v14[2];

  v6 = *a1;
  v7 = a1[1];
  if ((v7 & 0x1000000000000000) != 0)
  {
    v6 = sub_24455EFD0();
    v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v6;
    a1[1] = v12;
    v7 = v12;
    if ((v12 & 0x2000000000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000000000000000) != 0)
      {
        v8 = (_QWORD *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
        v9 = v6 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v8 = (_QWORD *)sub_244568420();
      }
      goto LABEL_7;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_3;
  }
  v9 = HIBYTE(v7) & 0xF;
  v14[0] = v6;
  v14[1] = v7 & 0xFFFFFFFFFFFFFFLL;
  v8 = v14;
LABEL_7:
  result = a3(v8, v9, a2);
  if (!v3)
    return result & 0x1FFFF;
  return result;
}

unsigned __int8 *sub_244560DC0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned __int16 v12;
  int v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  int v24;
  unsigned int v25;
  char v26;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v14 = a2 - 1;
      if (a2 != 1)
      {
        v15 = a3 + 87;
        if (a3 > 10)
        {
          v16 = a3 + 55;
        }
        else
        {
          v15 = 97;
          v16 = 65;
        }
        if (a3 <= 10)
          v17 = a3 + 48;
        else
          v17 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v18 = result + 1;
          do
          {
            v19 = *v18;
            if (v19 < 0x30 || v19 >= v17)
            {
              if (v19 < 0x41 || v19 >= v16)
              {
                v12 = 0;
                v13 = 1;
                if (v19 < 0x61 || v19 >= v15)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
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
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
              goto LABEL_72;
            v8 = (unsigned __int16)(v8 * a3) + (v19 + v20);
            if ((v8 & 0x10000) != 0)
              goto LABEL_72;
            ++v18;
            --v14;
          }
          while (v14);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | (v13 << 16));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v21 = a3 + 87;
        if (a3 > 10)
        {
          v22 = a3 + 55;
        }
        else
        {
          v21 = 97;
          v22 = 65;
        }
        if (a3 <= 10)
          v23 = a3 + 48;
        else
          v23 = 58;
        if (result)
        {
          LOWORD(v24) = 0;
          do
          {
            v25 = *result;
            if (v25 < 0x30 || v25 >= v23)
            {
              if (v25 < 0x41 || v25 >= v22)
              {
                v12 = 0;
                v13 = 1;
                if (v25 < 0x61 || v25 >= v21)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v26 = -87;
              }
              else
              {
                v26 = -55;
              }
            }
            else
            {
              v26 = -48;
            }
            if ((((unsigned __int16)v24 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
              goto LABEL_72;
            v24 = (unsigned __int16)(v24 * a3) + (v25 + v26);
            if ((v24 & 0x10000) != 0)
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v24;
          return (unsigned __int8 *)(v12 | (v13 << 16));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          LOWORD(v8) = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | (v13 << 16));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            if ((((unsigned __int16)v8 * (unsigned __int16)a3) & 0xFFFF0000) != 0)
              goto LABEL_72;
            v8 = (unsigned __int16)(v8 * a3) - (v10 + v11);
            if ((v8 & 0xFFFF0000) != 0)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | (v13 << 16));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_244561068(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned int v16;
  char v17;
  uint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned int v36;
  char v37;
  uint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  int v43;
  unsigned int v44;
  char v45;
  uint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  char v54;
  uint64_t v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 *v60;
  unsigned int v61;
  char v62;
  uint64_t v63;
  unsigned __int8 v64;
  _QWORD v65[2];
  unsigned __int8 v66;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v66 = 0;
    return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v31 = v6 - 1;
        if (v6 != 1)
        {
          v32 = a3 + 87;
          if (a3 > 10)
          {
            v33 = a3 + 55;
          }
          else
          {
            v32 = 97;
            v33 = 65;
          }
          if (a3 <= 10)
            v34 = a3 + 48;
          else
            v34 = 58;
          if (result)
          {
            v12 = 0;
            v35 = (unsigned __int8 *)(result + 1);
            do
            {
              v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v36 < 0x61 || v36 >= v32)
                    goto LABEL_144;
                  v37 = -87;
                }
                else
                {
                  v37 = -55;
                }
              }
              else
              {
                v37 = -48;
              }
              v38 = (int)v12 * (uint64_t)(int)a3;
              if (v38 != (int)v38)
                goto LABEL_143;
              v39 = v36 + v37;
              v12 = v38 + v39;
              if (__OFADD__((_DWORD)v38, v39))
                goto LABEL_143;
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            v16 = v12;
            v66 = 0;
            return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v40 = a3 + 87;
        if (a3 > 10)
        {
          v41 = a3 + 55;
        }
        else
        {
          v40 = 97;
          v41 = 65;
        }
        if (a3 <= 10)
          v42 = a3 + 48;
        else
          v42 = 58;
        if (result)
        {
          v43 = 0;
          do
          {
            v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                v16 = 0;
                v17 = 1;
                if (v44 < 0x61 || v44 >= v40)
                  goto LABEL_144;
                v45 = -87;
              }
              else
              {
                v45 = -55;
              }
            }
            else
            {
              v45 = -48;
            }
            v46 = v43 * (uint64_t)(int)a3;
            if (v46 != (int)v46)
              goto LABEL_143;
            v47 = v44 + v45;
            v43 = v46 + v47;
            if (__OFADD__((_DWORD)v46, v47))
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v46 + v47;
          v66 = 0;
          return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          v12 = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            v18 = (int)v12 * (uint64_t)(int)a3;
            if (v18 != (int)v18)
              goto LABEL_143;
            v19 = v14 + v15;
            v12 = v18 - v19;
            if (__OFSUB__((_DWORD)v18, v19))
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v66 = v17;
        return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        v22 = 0;
        v57 = a3 + 87;
        if (a3 > 10)
        {
          v58 = a3 + 55;
        }
        else
        {
          v57 = 97;
          v58 = 65;
        }
        if (a3 <= 10)
          v59 = a3 + 48;
        else
          v59 = 58;
        v60 = (unsigned __int8 *)v65;
        while (1)
        {
          v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              v16 = 0;
              v17 = 1;
              if (v61 < 0x61 || v61 >= v57)
                goto LABEL_144;
              v62 = -87;
            }
            else
            {
              v62 = -55;
            }
          }
          else
          {
            v62 = -48;
          }
          v63 = (int)v22 * (uint64_t)(int)a3;
          if (v63 != (int)v63)
            goto LABEL_143;
          v64 = v61 + v62;
          v22 = v63 + v64;
          if (__OFADD__((_DWORD)v63, v64))
            goto LABEL_143;
          ++v60;
          if (!--v20)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      v21 = v20 - 1;
      if (v21)
      {
        v22 = 0;
        v23 = a3 + 87;
        if (a3 > 10)
        {
          v24 = a3 + 55;
        }
        else
        {
          v23 = 97;
          v24 = 65;
        }
        if (a3 <= 10)
          v25 = a3 + 48;
        else
          v25 = 58;
        v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v16 = 0;
              v17 = 1;
              if (v27 < 0x61 || v27 >= v23)
                goto LABEL_144;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = (int)v22 * (uint64_t)(int)a3;
          if (v29 != (int)v29)
            goto LABEL_143;
          v30 = v27 + v28;
          v22 = v29 - v30;
          if (__OFSUB__((_DWORD)v29, v30))
            goto LABEL_143;
          ++v26;
          if (!--v21)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    v48 = v20 - 1;
    if (v48)
    {
      v22 = 0;
      v49 = a3 + 87;
      if (a3 > 10)
      {
        v50 = a3 + 55;
      }
      else
      {
        v49 = 97;
        v50 = 65;
      }
      if (a3 <= 10)
        v51 = a3 + 48;
      else
        v51 = 58;
      v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            v16 = 0;
            v17 = 1;
            if (v53 < 0x61 || v53 >= v49)
              goto LABEL_144;
            v54 = -87;
          }
          else
          {
            v54 = -55;
          }
        }
        else
        {
          v54 = -48;
        }
        v55 = (int)v22 * (uint64_t)(int)a3;
        if (v55 != (int)v55)
          goto LABEL_143;
        v56 = v53 + v54;
        v22 = v55 + v56;
        if (__OFADD__((_DWORD)v55, v56))
          goto LABEL_143;
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      v16 = v22;
      v66 = 0;
      return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

unsigned __int8 *sub_2445615AC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  uint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  uint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = (int)v8 * (uint64_t)(int)a3;
            if (v23 != (int)v23)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__OFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = (int)v28 * (uint64_t)(int)a3;
            if (v31 != (int)v31)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__OFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = (int)v8 * (uint64_t)(int)a3;
            if (v14 != (int)v14)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (__OFSUB__((_DWORD)v14, v15))
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24456182C(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unsigned int v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  unsigned int v16;
  char v17;
  unint64_t v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;
  unint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned int v36;
  char v37;
  unint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned int v43;
  unsigned int v44;
  char v45;
  unint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  char v54;
  unint64_t v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 *v60;
  unsigned int v61;
  char v62;
  unint64_t v63;
  unsigned __int8 v64;
  _QWORD v65[2];
  unsigned __int8 v66;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v16 = 0;
    v66 = 0;
    return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
  }
  v5 = result;
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      result = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
      v6 = v5 & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
    }
    v7 = *(unsigned __int8 *)result;
    if (v7 == 43)
    {
      if (v6 >= 1)
      {
        v31 = v6 - 1;
        if (v6 != 1)
        {
          v32 = a3 + 87;
          if (a3 > 10)
          {
            v33 = a3 + 55;
          }
          else
          {
            v32 = 97;
            v33 = 65;
          }
          if (a3 <= 10)
            v34 = a3 + 48;
          else
            v34 = 58;
          if (result)
          {
            v12 = 0;
            v35 = (unsigned __int8 *)(result + 1);
            do
            {
              v36 = *v35;
              if (v36 < 0x30 || v36 >= v34)
              {
                if (v36 < 0x41 || v36 >= v33)
                {
                  v16 = 0;
                  v17 = 1;
                  if (v36 < 0x61 || v36 >= v32)
                    goto LABEL_144;
                  v37 = -87;
                }
                else
                {
                  v37 = -55;
                }
              }
              else
              {
                v37 = -48;
              }
              v38 = v12 * (unint64_t)a3;
              if ((v38 & 0xFFFFFFFF00000000) != 0)
                goto LABEL_143;
              v39 = v36 + v37;
              v12 = v38 + v39;
              if (__CFADD__((_DWORD)v38, v39))
                goto LABEL_143;
              ++v35;
              --v31;
            }
            while (v31);
LABEL_76:
            v16 = v12;
            v66 = 0;
            return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
          }
          goto LABEL_99;
        }
LABEL_143:
        v16 = 0;
        v17 = 1;
        goto LABEL_144;
      }
      goto LABEL_150;
    }
    if (v7 != 45)
    {
      if (v6)
      {
        v40 = a3 + 87;
        if (a3 > 10)
        {
          v41 = a3 + 55;
        }
        else
        {
          v40 = 97;
          v41 = 65;
        }
        if (a3 <= 10)
          v42 = a3 + 48;
        else
          v42 = 58;
        if (result)
        {
          v43 = 0;
          do
          {
            v44 = *(unsigned __int8 *)result;
            if (v44 < 0x30 || v44 >= v42)
            {
              if (v44 < 0x41 || v44 >= v41)
              {
                v16 = 0;
                v17 = 1;
                if (v44 < 0x61 || v44 >= v40)
                  goto LABEL_144;
                v45 = -87;
              }
              else
              {
                v45 = -55;
              }
            }
            else
            {
              v45 = -48;
            }
            v46 = v43 * (unint64_t)a3;
            if ((v46 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_143;
            v47 = v44 + v45;
            v43 = v46 + v47;
            if (__CFADD__((_DWORD)v46, v47))
              goto LABEL_143;
            ++result;
            --v6;
          }
          while (v6);
          v16 = v46 + v47;
          v66 = 0;
          return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
        }
        goto LABEL_99;
      }
      goto LABEL_143;
    }
    if (v6 >= 1)
    {
      v8 = v6 - 1;
      if (v6 != 1)
      {
        v9 = a3 + 87;
        if (a3 > 10)
        {
          v10 = a3 + 55;
        }
        else
        {
          v9 = 97;
          v10 = 65;
        }
        if (a3 <= 10)
          v11 = a3 + 48;
        else
          v11 = 58;
        if (result)
        {
          v12 = 0;
          v13 = (unsigned __int8 *)(result + 1);
          while (1)
          {
            v14 = *v13;
            if (v14 < 0x30 || v14 >= v11)
            {
              if (v14 < 0x41 || v14 >= v10)
              {
                v16 = 0;
                v17 = 1;
                if (v14 < 0x61 || v14 >= v9)
                  goto LABEL_144;
                v15 = -87;
              }
              else
              {
                v15 = -55;
              }
            }
            else
            {
              v15 = -48;
            }
            v18 = v12 * (unint64_t)a3;
            if ((v18 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_143;
            v19 = v14 + v15;
            v12 = v18 - v19;
            if (v18 < v19)
              goto LABEL_143;
            ++v13;
            if (!--v8)
              goto LABEL_76;
          }
        }
LABEL_99:
        v16 = 0;
        v17 = 0;
LABEL_144:
        v66 = v17;
        return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
      }
      goto LABEL_143;
    }
    __break(1u);
LABEL_149:
    __break(1u);
LABEL_150:
    __break(1u);
    goto LABEL_151;
  }
  v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result != 45)
    {
      if (v20)
      {
        v22 = 0;
        v57 = a3 + 87;
        if (a3 > 10)
        {
          v58 = a3 + 55;
        }
        else
        {
          v57 = 97;
          v58 = 65;
        }
        if (a3 <= 10)
          v59 = a3 + 48;
        else
          v59 = 58;
        v60 = (unsigned __int8 *)v65;
        while (1)
        {
          v61 = *v60;
          if (v61 < 0x30 || v61 >= v59)
          {
            if (v61 < 0x41 || v61 >= v58)
            {
              v16 = 0;
              v17 = 1;
              if (v61 < 0x61 || v61 >= v57)
                goto LABEL_144;
              v62 = -87;
            }
            else
            {
              v62 = -55;
            }
          }
          else
          {
            v62 = -48;
          }
          v63 = v22 * (unint64_t)a3;
          if ((v63 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_143;
          v64 = v61 + v62;
          v22 = v63 + v64;
          if (__CFADD__((_DWORD)v63, v64))
            goto LABEL_143;
          ++v60;
          if (!--v20)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    if (v20)
    {
      v21 = v20 - 1;
      if (v21)
      {
        v22 = 0;
        v23 = a3 + 87;
        if (a3 > 10)
        {
          v24 = a3 + 55;
        }
        else
        {
          v23 = 97;
          v24 = 65;
        }
        if (a3 <= 10)
          v25 = a3 + 48;
        else
          v25 = 58;
        v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v16 = 0;
              v17 = 1;
              if (v27 < 0x61 || v27 >= v23)
                goto LABEL_144;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v22 * (unint64_t)a3;
          if ((v29 & 0xFFFFFFFF00000000) != 0)
            goto LABEL_143;
          v30 = v27 + v28;
          v22 = v29 - v30;
          if (v29 < v30)
            goto LABEL_143;
          ++v26;
          if (!--v21)
            goto LABEL_142;
        }
      }
      goto LABEL_143;
    }
    goto LABEL_149;
  }
  if (v20)
  {
    v48 = v20 - 1;
    if (v48)
    {
      v22 = 0;
      v49 = a3 + 87;
      if (a3 > 10)
      {
        v50 = a3 + 55;
      }
      else
      {
        v49 = 97;
        v50 = 65;
      }
      if (a3 <= 10)
        v51 = a3 + 48;
      else
        v51 = 58;
      v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v50)
          {
            v16 = 0;
            v17 = 1;
            if (v53 < 0x61 || v53 >= v49)
              goto LABEL_144;
            v54 = -87;
          }
          else
          {
            v54 = -55;
          }
        }
        else
        {
          v54 = -48;
        }
        v55 = v22 * (unint64_t)a3;
        if ((v55 & 0xFFFFFFFF00000000) != 0)
          goto LABEL_143;
        v56 = v53 + v54;
        v22 = v55 + v56;
        if (__CFADD__((_DWORD)v55, v56))
          goto LABEL_143;
        ++v52;
        --v48;
      }
      while (v48);
LABEL_142:
      v16 = v22;
      v66 = 0;
      return v16 | ((unint64_t)v66 << 32) | (((a2 >> 60) & 1) << 40);
    }
    goto LABEL_143;
  }
LABEL_151:
  __break(1u);
  return result;
}

uint64_t sub_244561D70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v9[2];

  swift_bridgeObjectRetain();
  v9[0] = sub_244568288();
  v9[1] = v6;
  v7 = sub_244561DFC(v9, a3, a4);
  swift_bridgeObjectRelease();
  return v7 | ((HIDWORD(v7) & 1) << 32);
}

unint64_t sub_244561DFC(uint64_t *a1, uint64_t a2, uint64_t (*a3)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  _QWORD v14[2];

  v6 = *a1;
  v7 = a1[1];
  if ((v7 & 0x1000000000000000) != 0)
  {
    v6 = sub_24455EFD0();
    v12 = v11;
    swift_bridgeObjectRelease();
    *a1 = v6;
    a1[1] = v12;
    v7 = v12;
    if ((v12 & 0x2000000000000000) == 0)
    {
LABEL_3:
      if ((v6 & 0x1000000000000000) != 0)
      {
        v8 = (_QWORD *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
        v9 = v6 & 0xFFFFFFFFFFFFLL;
      }
      else
      {
        v8 = (_QWORD *)sub_244568420();
      }
      goto LABEL_7;
    }
  }
  else if ((v7 & 0x2000000000000000) == 0)
  {
    goto LABEL_3;
  }
  v9 = HIBYTE(v7) & 0xF;
  v14[0] = v6;
  v14[1] = v7 & 0xFFFFFFFFFFFFFFLL;
  v8 = v14;
LABEL_7:
  result = a3(v8, v9, a2);
  if (!v3)
    return result | ((HIDWORD(result) & 1) << 32);
  return result;
}

unsigned __int8 *sub_244561ECC(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 *v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  unsigned __int8 v13;
  unint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 *v20;
  unsigned int v21;
  char v22;
  unint64_t v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned int v28;
  unsigned int v29;
  char v30;
  unint64_t v31;
  unsigned __int8 v32;

  v3 = *result;
  if (v3 == 43)
  {
    if (a2 >= 1)
    {
      v16 = a2 - 1;
      if (a2 != 1)
      {
        v17 = a3 + 87;
        if (a3 > 10)
        {
          v18 = a3 + 55;
        }
        else
        {
          v17 = 97;
          v18 = 65;
        }
        if (a3 <= 10)
          v19 = a3 + 48;
        else
          v19 = 58;
        if (result)
        {
          v8 = 0;
          v20 = result + 1;
          do
          {
            v21 = *v20;
            if (v21 < 0x30 || v21 >= v19)
            {
              if (v21 < 0x41 || v21 >= v18)
              {
                v12 = 0;
                v13 = 1;
                if (v21 < 0x61 || v21 >= v17)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v22 = -87;
              }
              else
              {
                v22 = -55;
              }
            }
            else
            {
              v22 = -48;
            }
            v23 = v8 * (unint64_t)a3;
            if ((v23 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v24 = v21 + v22;
            v8 = v23 + v24;
            if (__CFADD__((_DWORD)v23, v24))
              goto LABEL_72;
            ++v20;
            --v16;
          }
          while (v16);
LABEL_48:
          v13 = 0;
          v12 = v8;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
LABEL_72:
      v12 = 0;
      v13 = 1;
      return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
    }
  }
  else
  {
    if (v3 != 45)
    {
      if (a2)
      {
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v26 = a3 + 55;
        }
        else
        {
          v25 = 97;
          v26 = 65;
        }
        if (a3 <= 10)
          v27 = a3 + 48;
        else
          v27 = 58;
        if (result)
        {
          v28 = 0;
          do
          {
            v29 = *result;
            if (v29 < 0x30 || v29 >= v27)
            {
              if (v29 < 0x41 || v29 >= v26)
              {
                v12 = 0;
                v13 = 1;
                if (v29 < 0x61 || v29 >= v25)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v30 = -87;
              }
              else
              {
                v30 = -55;
              }
            }
            else
            {
              v30 = -48;
            }
            v31 = v28 * (unint64_t)a3;
            if ((v31 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v32 = v29 + v30;
            v28 = v31 + v32;
            if (__CFADD__((_DWORD)v31, v32))
              goto LABEL_72;
            ++result;
            --a2;
          }
          while (a2);
          v13 = 0;
          v12 = v28;
          return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
        }
        goto LABEL_71;
      }
      goto LABEL_72;
    }
    if (a2 >= 1)
    {
      v4 = a2 - 1;
      if (a2 != 1)
      {
        v5 = a3 + 87;
        if (a3 > 10)
        {
          v6 = a3 + 55;
        }
        else
        {
          v5 = 97;
          v6 = 65;
        }
        if (a3 <= 10)
          v7 = a3 + 48;
        else
          v7 = 58;
        if (result)
        {
          v8 = 0;
          v9 = result + 1;
          while (1)
          {
            v10 = *v9;
            if (v10 < 0x30 || v10 >= v7)
            {
              if (v10 < 0x41 || v10 >= v6)
              {
                v12 = 0;
                v13 = 1;
                if (v10 < 0x61 || v10 >= v5)
                  return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
                v11 = -87;
              }
              else
              {
                v11 = -55;
              }
            }
            else
            {
              v11 = -48;
            }
            v14 = v8 * (unint64_t)a3;
            if ((v14 & 0xFFFFFFFF00000000) != 0)
              goto LABEL_72;
            v15 = v10 + v11;
            v8 = v14 - v15;
            if (v14 < v15)
              goto LABEL_72;
            ++v9;
            if (!--v4)
              goto LABEL_48;
          }
        }
LABEL_71:
        v12 = 0;
        v13 = 0;
        return (unsigned __int8 *)(v12 | ((unint64_t)v13 << 32));
      }
      goto LABEL_72;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_24456214C(uint64_t *a1, uint64_t a2, uint64_t (*a3)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v5 = *a1;
  v6 = a1[1];
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13[0] = v5;
    v13[1] = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = v13;
    return a3(v7, v8, a2);
  }
  v5 = sub_24455EFD0();
  v11 = v10;
  swift_bridgeObjectRelease();
  *a1 = v5;
  a1[1] = v11;
  v6 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (_QWORD *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (_QWORD *)sub_244568420();
  }
  return a3(v7, v8, a2);
}

uint64_t sub_244562214(uint64_t result, unint64_t a2, uint64_t a3)
{
  unsigned __int8 *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  char v16;
  uint64_t v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 *v25;
  unsigned int v26;
  char v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 *v34;
  unsigned int v35;
  char v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  uint64_t v42;
  unsigned int v43;
  char v44;
  uint64_t v45;
  unsigned __int8 v46;
  uint64_t v47;
  unsigned __int8 v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 *v51;
  unsigned int v52;
  char v53;
  uint64_t v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 *v59;
  unsigned int v60;
  char v61;
  uint64_t v62;
  unsigned __int8 v63;
  _QWORD v64[2];
  char v65;

  if ((a2 & 0x1000000000000000) != 0)
  {
    result = 0;
    v65 = 0;
    goto LABEL_128;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      v5 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      v6 = result & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
      v5 = (unsigned __int8 *)result;
    }
    v7 = *v5;
    if (v7 == 43)
    {
      if (v6 < 1)
      {
LABEL_134:
        __break(1u);
        goto LABEL_135;
      }
      v30 = v6 - 1;
      if (v6 != 1)
      {
        v31 = a3 + 55;
        v32 = a3 + 87;
        if (a3 > 10)
        {
          v33 = 58;
        }
        else
        {
          v32 = 97;
          v31 = 65;
          v33 = a3 + 48;
        }
        if (v5)
        {
          v12 = 0;
          v34 = v5 + 1;
          do
          {
            v35 = *v34;
            if (v35 < 0x30 || v35 >= v33)
            {
              if (v35 < 0x41 || v35 >= v31)
              {
                result = 0;
                v16 = 1;
                if (v35 < 0x61 || v35 >= v32)
                  goto LABEL_88;
                v36 = -87;
              }
              else
              {
                v36 = -55;
              }
            }
            else
            {
              v36 = -48;
            }
            v37 = v12 * a3;
            if ((unsigned __int128)(v12 * (__int128)a3) >> 64 != (v12 * a3) >> 63)
              goto LABEL_129;
            v38 = v35 + v36;
            v12 = v37 + v38;
            if (__OFADD__(v37, v38))
              goto LABEL_129;
            ++v34;
            --v30;
          }
          while (v30);
LABEL_67:
          result = v12;
          v65 = 0;
          goto LABEL_128;
        }
        goto LABEL_87;
      }
    }
    else
    {
      if (v7 == 45)
      {
        if (v6 >= 1)
        {
          v8 = v6 - 1;
          if (v6 != 1)
          {
            v9 = a3 + 55;
            v10 = a3 + 87;
            if (a3 > 10)
            {
              v11 = 58;
            }
            else
            {
              v10 = 97;
              v9 = 65;
              v11 = a3 + 48;
            }
            if (v5)
            {
              v12 = 0;
              v13 = v5 + 1;
              while (1)
              {
                v14 = *v13;
                if (v14 < 0x30 || v14 >= v11)
                {
                  if (v14 < 0x41 || v14 >= v9)
                  {
                    result = 0;
                    v16 = 1;
                    if (v14 < 0x61 || v14 >= v10)
                      goto LABEL_88;
                    v15 = -87;
                  }
                  else
                  {
                    v15 = -55;
                  }
                }
                else
                {
                  v15 = -48;
                }
                v17 = v12 * a3;
                if ((unsigned __int128)(v12 * (__int128)a3) >> 64 != (v12 * a3) >> 63)
                  goto LABEL_129;
                v18 = v14 + v15;
                v12 = v17 - v18;
                if (__OFSUB__(v17, v18))
                  goto LABEL_129;
                ++v13;
                if (!--v8)
                  goto LABEL_67;
              }
            }
LABEL_87:
            result = 0;
            v16 = 0;
LABEL_88:
            v65 = v16;
            goto LABEL_128;
          }
          goto LABEL_129;
        }
        __break(1u);
        goto LABEL_133;
      }
      if (v6)
      {
        v39 = a3 + 55;
        v40 = a3 + 87;
        if (a3 > 10)
        {
          v41 = 58;
        }
        else
        {
          v40 = 97;
          v39 = 65;
          v41 = a3 + 48;
        }
        if (!v5)
          goto LABEL_87;
        v42 = 0;
        do
        {
          v43 = *v5;
          if (v43 < 0x30 || v43 >= v41)
          {
            if (v43 < 0x41 || v43 >= v39)
            {
              result = 0;
              v16 = 1;
              if (v43 < 0x61 || v43 >= v40)
                goto LABEL_88;
              v44 = -87;
            }
            else
            {
              v44 = -55;
            }
          }
          else
          {
            v44 = -48;
          }
          v45 = v42 * a3;
          if ((unsigned __int128)(v42 * (__int128)a3) >> 64 != (v42 * a3) >> 63)
            goto LABEL_129;
          v46 = v43 + v44;
          v42 = v45 + v46;
          if (__OFADD__(v45, v46))
            goto LABEL_129;
          ++v5;
          --v6;
        }
        while (v6);
        result = v45 + v46;
        v65 = 0;
LABEL_128:
        LOBYTE(v64[0]) = (a2 & 0x1000000000000000) != 0;
        return result;
      }
    }
LABEL_129:
    result = 0;
    v65 = 1;
    goto LABEL_128;
  }
  v19 = HIBYTE(a2) & 0xF;
  v64[0] = result;
  v64[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result == 45)
    {
      if (!v19)
      {
LABEL_133:
        __break(1u);
        goto LABEL_134;
      }
      v20 = v19 - 1;
      if (v20)
      {
        v21 = 0;
        v22 = a3 + 55;
        v23 = a3 + 87;
        if (a3 > 10)
        {
          v24 = 58;
        }
        else
        {
          v23 = 97;
          v22 = 65;
          v24 = a3 + 48;
        }
        v25 = (unsigned __int8 *)v64 + 1;
        while (1)
        {
          v26 = *v25;
          if (v26 < 0x30 || v26 >= v24)
          {
            if (v26 < 0x41 || v26 >= v22)
            {
              result = 0;
              if (v26 < 0x61 || v26 >= v23)
                goto LABEL_127;
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
          v28 = v21 * a3;
          if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63)
            break;
          v29 = v26 + v27;
          v21 = v28 - v29;
          if (__OFSUB__(v28, v29))
            break;
          ++v25;
          if (!--v20)
            goto LABEL_125;
        }
      }
    }
    else if (v19)
    {
      v21 = 0;
      v56 = a3 + 55;
      v57 = a3 + 87;
      if (a3 > 10)
      {
        v58 = 58;
      }
      else
      {
        v57 = 97;
        v56 = 65;
        v58 = a3 + 48;
      }
      v59 = (unsigned __int8 *)v64;
      while (1)
      {
        v60 = *v59;
        if (v60 < 0x30 || v60 >= v58)
        {
          if (v60 < 0x41 || v60 >= v56)
          {
            result = 0;
            if (v60 < 0x61 || v60 >= v57)
              goto LABEL_127;
            v61 = -87;
          }
          else
          {
            v61 = -55;
          }
        }
        else
        {
          v61 = -48;
        }
        v62 = v21 * a3;
        if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63)
          break;
        v63 = v60 + v61;
        v21 = v62 + v63;
        if (__OFADD__(v62, v63))
          break;
        ++v59;
        if (!--v19)
          goto LABEL_125;
      }
    }
LABEL_126:
    result = 0;
LABEL_127:
    v65 = 1;
    goto LABEL_128;
  }
  if (v19)
  {
    v47 = v19 - 1;
    if (v47)
    {
      v21 = 0;
      v48 = a3 + 55;
      v49 = a3 + 87;
      if (a3 > 10)
      {
        v50 = 58;
      }
      else
      {
        v49 = 97;
        v48 = 65;
        v50 = a3 + 48;
      }
      v51 = (unsigned __int8 *)v64 + 1;
      do
      {
        v52 = *v51;
        if (v52 < 0x30 || v52 >= v50)
        {
          if (v52 < 0x41 || v52 >= v48)
          {
            result = 0;
            if (v52 < 0x61 || v52 >= v49)
              goto LABEL_127;
            v53 = -87;
          }
          else
          {
            v53 = -55;
          }
        }
        else
        {
          v53 = -48;
        }
        v54 = v21 * a3;
        if ((unsigned __int128)(v21 * (__int128)a3) >> 64 != (v21 * a3) >> 63)
          goto LABEL_126;
        v55 = v52 + v53;
        v21 = v54 + v55;
        if (__OFADD__(v54, v55))
          goto LABEL_126;
        ++v51;
        --v47;
      }
      while (v47);
LABEL_125:
      result = v21;
      v65 = 0;
      goto LABEL_128;
    }
    goto LABEL_126;
  }
LABEL_135:
  __break(1u);
  return result;
}

unsigned __int8 *sub_244562780(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

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
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
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
              v14 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v14 - (v11 + v12);
              if (__OFSUB__(v14, (v11 + v12)))
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
      goto LABEL_66;
    }
    if (a2)
    {
      v23 = a3 + 48;
      v24 = a3 + 55;
      v25 = a3 + 87;
      if (a3 > 10)
      {
        v23 = 58;
      }
      else
      {
        v25 = 97;
        v24 = 65;
      }
      if (result)
      {
        v26 = 0;
        do
        {
          v27 = *result;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v24)
            {
              v13 = 0;
              if (v27 < 0x61 || v27 >= v25)
                return (unsigned __int8 *)v13;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          v29 = v26 * a3;
          if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
            return 0;
          v26 = v29 + (v27 + v28);
          if (__OFADD__(v29, (v27 + v28)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v29 + (v27 + v28));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_66:
    __break(1u);
    return result;
  }
  v15 = a2 - 1;
  if (a2 == 1)
    return 0;
  v16 = a3 + 48;
  v17 = a3 + 55;
  v18 = a3 + 87;
  if (a3 > 10)
  {
    v16 = 58;
  }
  else
  {
    v18 = 97;
    v17 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v19 = result + 1;
  do
  {
    v20 = *v19;
    if (v20 < 0x30 || v20 >= v16)
    {
      if (v20 < 0x41 || v20 >= v17)
      {
        v13 = 0;
        if (v20 < 0x61 || v20 >= v18)
          return (unsigned __int8 *)v13;
        v21 = -87;
      }
      else
      {
        v21 = -55;
      }
    }
    else
    {
      v21 = -48;
    }
    v22 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v22 + (v20 + v21);
    if (__OFADD__(v22, (v20 + v21)))
      return 0;
    ++v19;
    --v15;
  }
  while (v15);
  return (unsigned __int8 *)v9;
}

uint64_t sub_2445629FC(uint64_t result, unint64_t a2, int64_t a3)
{
  unsigned __int8 *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  char v15;
  char v16;
  unint64_t v17;
  unsigned __int8 v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  unsigned __int8 *v26;
  unsigned int v27;
  char v28;
  unint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 *v35;
  unsigned int v36;
  char v37;
  unint64_t v38;
  unsigned __int8 v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unint64_t v43;
  unsigned int v44;
  char v45;
  unint64_t v46;
  unsigned __int8 v47;
  uint64_t v48;
  unsigned __int8 v49;
  unsigned __int8 v50;
  unsigned __int8 v51;
  unsigned __int8 *v52;
  unsigned int v53;
  char v54;
  unint64_t v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 *v60;
  unsigned int v61;
  char v62;
  unint64_t v63;
  unsigned __int8 v64;
  _QWORD v65[2];
  char v66;

  if ((a2 & 0x1000000000000000) != 0)
  {
    result = 0;
    v66 = 0;
    goto LABEL_130;
  }
  if ((a2 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
    {
      v5 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      v6 = result & 0xFFFFFFFFFFFFLL;
    }
    else
    {
      result = sub_244568420();
      v5 = (unsigned __int8 *)result;
    }
    v7 = *v5;
    if (v7 == 43)
    {
      if (v6 < 1)
      {
LABEL_136:
        __break(1u);
        goto LABEL_137;
      }
      v31 = v6 - 1;
      if (v6 != 1)
      {
        v32 = a3 + 55;
        v33 = a3 + 87;
        if (a3 > 10)
        {
          v34 = 58;
        }
        else
        {
          v33 = 97;
          v32 = 65;
          v34 = a3 + 48;
        }
        if (v5)
        {
          v12 = 0;
          v35 = v5 + 1;
          do
          {
            v36 = *v35;
            if (v36 < 0x30 || v36 >= v34)
            {
              if (v36 < 0x41 || v36 >= v32)
              {
                result = 0;
                v16 = 1;
                if (v36 < 0x61 || v36 >= v33)
                  goto LABEL_90;
                v37 = -87;
              }
              else
              {
                v37 = -55;
              }
            }
            else
            {
              v37 = -48;
            }
            if (!is_mul_ok(v12, a3))
              goto LABEL_131;
            v38 = v12 * a3;
            v39 = v36 + v37;
            v19 = __CFADD__(v38, v39);
            v12 = v38 + v39;
            if (v19)
              goto LABEL_131;
            ++v35;
            --v31;
          }
          while (v31);
LABEL_69:
          result = v12;
          v66 = 0;
          goto LABEL_130;
        }
        goto LABEL_89;
      }
    }
    else
    {
      if (v7 == 45)
      {
        if (v6 >= 1)
        {
          v8 = v6 - 1;
          if (v6 != 1)
          {
            v9 = a3 + 55;
            v10 = a3 + 87;
            if (a3 > 10)
            {
              v11 = 58;
            }
            else
            {
              v10 = 97;
              v9 = 65;
              v11 = a3 + 48;
            }
            if (v5)
            {
              v12 = 0;
              v13 = v5 + 1;
              while (1)
              {
                v14 = *v13;
                if (v14 < 0x30 || v14 >= v11)
                {
                  if (v14 < 0x41 || v14 >= v9)
                  {
                    result = 0;
                    v16 = 1;
                    if (v14 < 0x61 || v14 >= v10)
                      goto LABEL_90;
                    v15 = -87;
                  }
                  else
                  {
                    v15 = -55;
                  }
                }
                else
                {
                  v15 = -48;
                }
                if (!is_mul_ok(v12, a3))
                  goto LABEL_131;
                v17 = v12 * a3;
                v18 = v14 + v15;
                v19 = v17 >= v18;
                v12 = v17 - v18;
                if (!v19)
                  goto LABEL_131;
                ++v13;
                if (!--v8)
                  goto LABEL_69;
              }
            }
LABEL_89:
            result = 0;
            v16 = 0;
LABEL_90:
            v66 = v16;
            goto LABEL_130;
          }
          goto LABEL_131;
        }
        __break(1u);
        goto LABEL_135;
      }
      if (v6)
      {
        v40 = a3 + 55;
        v41 = a3 + 87;
        if (a3 > 10)
        {
          v42 = 58;
        }
        else
        {
          v41 = 97;
          v40 = 65;
          v42 = a3 + 48;
        }
        if (!v5)
          goto LABEL_89;
        v43 = 0;
        do
        {
          v44 = *v5;
          if (v44 < 0x30 || v44 >= v42)
          {
            if (v44 < 0x41 || v44 >= v40)
            {
              result = 0;
              v16 = 1;
              if (v44 < 0x61 || v44 >= v41)
                goto LABEL_90;
              v45 = -87;
            }
            else
            {
              v45 = -55;
            }
          }
          else
          {
            v45 = -48;
          }
          if (!is_mul_ok(v43, a3))
            goto LABEL_131;
          v46 = v43 * a3;
          v47 = v44 + v45;
          v19 = __CFADD__(v46, v47);
          v43 = v46 + v47;
          if (v19)
            goto LABEL_131;
          ++v5;
          --v6;
        }
        while (v6);
        result = v43;
        v66 = 0;
LABEL_130:
        LOBYTE(v65[0]) = (a2 & 0x1000000000000000) != 0;
        return result;
      }
    }
LABEL_131:
    result = 0;
    v66 = 1;
    goto LABEL_130;
  }
  v20 = HIBYTE(a2) & 0xF;
  v65[0] = result;
  v65[1] = a2 & 0xFFFFFFFFFFFFFFLL;
  if (result != 43)
  {
    if (result == 45)
    {
      if (!v20)
      {
LABEL_135:
        __break(1u);
        goto LABEL_136;
      }
      v21 = v20 - 1;
      if (v21)
      {
        v22 = 0;
        v23 = a3 + 55;
        v24 = a3 + 87;
        if (a3 > 10)
        {
          v25 = 58;
        }
        else
        {
          v24 = 97;
          v23 = 65;
          v25 = a3 + 48;
        }
        v26 = (unsigned __int8 *)v65 + 1;
        while (1)
        {
          v27 = *v26;
          if (v27 < 0x30 || v27 >= v25)
          {
            if (v27 < 0x41 || v27 >= v23)
            {
              result = 0;
              if (v27 < 0x61 || v27 >= v24)
                goto LABEL_129;
              v28 = -87;
            }
            else
            {
              v28 = -55;
            }
          }
          else
          {
            v28 = -48;
          }
          if (!is_mul_ok(v22, a3))
            break;
          v29 = v22 * a3;
          v30 = v27 + v28;
          v19 = v29 >= v30;
          v22 = v29 - v30;
          if (!v19)
            break;
          ++v26;
          if (!--v21)
            goto LABEL_127;
        }
      }
    }
    else if (v20)
    {
      v22 = 0;
      v57 = a3 + 55;
      v58 = a3 + 87;
      if (a3 > 10)
      {
        v59 = 58;
      }
      else
      {
        v58 = 97;
        v57 = 65;
        v59 = a3 + 48;
      }
      v60 = (unsigned __int8 *)v65;
      while (1)
      {
        v61 = *v60;
        if (v61 < 0x30 || v61 >= v59)
        {
          if (v61 < 0x41 || v61 >= v57)
          {
            result = 0;
            if (v61 < 0x61 || v61 >= v58)
              goto LABEL_129;
            v62 = -87;
          }
          else
          {
            v62 = -55;
          }
        }
        else
        {
          v62 = -48;
        }
        if (!is_mul_ok(v22, a3))
          break;
        v63 = v22 * a3;
        v64 = v61 + v62;
        v19 = __CFADD__(v63, v64);
        v22 = v63 + v64;
        if (v19)
          break;
        ++v60;
        if (!--v20)
          goto LABEL_127;
      }
    }
LABEL_128:
    result = 0;
LABEL_129:
    v66 = 1;
    goto LABEL_130;
  }
  if (v20)
  {
    v48 = v20 - 1;
    if (v48)
    {
      v22 = 0;
      v49 = a3 + 55;
      v50 = a3 + 87;
      if (a3 > 10)
      {
        v51 = 58;
      }
      else
      {
        v50 = 97;
        v49 = 65;
        v51 = a3 + 48;
      }
      v52 = (unsigned __int8 *)v65 + 1;
      do
      {
        v53 = *v52;
        if (v53 < 0x30 || v53 >= v51)
        {
          if (v53 < 0x41 || v53 >= v49)
          {
            result = 0;
            if (v53 < 0x61 || v53 >= v50)
              goto LABEL_129;
            v54 = -87;
          }
          else
          {
            v54 = -55;
          }
        }
        else
        {
          v54 = -48;
        }
        if (!is_mul_ok(v22, a3))
          goto LABEL_128;
        v55 = v22 * a3;
        v56 = v53 + v54;
        v19 = __CFADD__(v55, v56);
        v22 = v55 + v56;
        if (v19)
          goto LABEL_128;
        ++v52;
        --v48;
      }
      while (v48);
LABEL_127:
      result = v22;
      v66 = 0;
      goto LABEL_130;
    }
    goto LABEL_128;
  }
LABEL_137:
  __break(1u);
  return result;
}

uint64_t sub_244562F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD *, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9[2];

  swift_bridgeObjectRetain();
  v9[0] = sub_244568288();
  v9[1] = v6;
  v7 = sub_24456214C(v9, a3, a4);
  swift_bridgeObjectRelease();
  return v7;
}

unsigned __int8 *sub_244562FF4(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  unint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int8 v15;
  BOOL v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 *v21;
  unsigned int v22;
  char v23;
  unint64_t v24;
  unsigned __int8 v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned int v30;
  char v31;
  unint64_t v32;
  unsigned __int8 v33;

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
                  v13 = 0;
                  if (v11 < 0x61 || v11 >= v8)
                    return (unsigned __int8 *)v13;
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
              if (!is_mul_ok(v9, a3))
                return 0;
              v14 = v9 * a3;
              v15 = v11 + v12;
              v16 = v14 >= v15;
              v9 = v14 - v15;
              if (!v16)
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
      goto LABEL_67;
    }
    if (a2)
    {
      v26 = a3 + 48;
      v27 = a3 + 55;
      v28 = a3 + 87;
      if (a3 > 10)
      {
        v26 = 58;
      }
      else
      {
        v28 = 97;
        v27 = 65;
      }
      if (result)
      {
        v29 = 0;
        do
        {
          v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              v13 = 0;
              if (v30 < 0x61 || v30 >= v28)
                return (unsigned __int8 *)v13;
              v31 = -87;
            }
            else
            {
              v31 = -55;
            }
          }
          else
          {
            v31 = -48;
          }
          if (!is_mul_ok(v29, a3))
            return 0;
          v32 = v29 * a3;
          v33 = v30 + v31;
          v16 = __CFADD__(v32, v33);
          v29 = v32 + v33;
          if (v16)
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  v17 = a2 - 1;
  if (a2 == 1)
    return 0;
  v18 = a3 + 48;
  v19 = a3 + 55;
  v20 = a3 + 87;
  if (a3 > 10)
  {
    v18 = 58;
  }
  else
  {
    v20 = 97;
    v19 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v21 = result + 1;
  do
  {
    v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        v13 = 0;
        if (v22 < 0x61 || v22 >= v20)
          return (unsigned __int8 *)v13;
        v23 = -87;
      }
      else
      {
        v23 = -55;
      }
    }
    else
    {
      v23 = -48;
    }
    if (!is_mul_ok(v9, a3))
      return 0;
    v24 = v9 * a3;
    v25 = v22 + v23;
    v16 = __CFADD__(v24, v25);
    v9 = v24 + v25;
    if (v16)
      return 0;
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t sub_244563270(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3;
    result = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2445632C4(__int128 *a1, uint64_t a2)
{
  return sub_24455E554(a1, a2);
}

uint64_t sub_2445632D8(__int128 *a1, uint64_t a2)
{
  return sub_24455E61C(a1, a2);
}

void static SQLiteType.getSQLNonNullDataType()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 24))(&v2);
  __asm { BR              X11 }
}

void sub_244563330(char a1@<W8>)
{
  _BYTE *v1;

  *v1 = a1;
}

uint64_t sub_2445633BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int(v3, a2);
  if ((int)result < -128)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 8;
    *(_BYTE *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  if ((int)result > 127)
  {
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_2445634F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int(v3, a2);
  if ((int)result < -32768)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 8;
    *(_BYTE *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  if ((int)result >= 0x8000)
  {
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_244563634(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
LABEL_8:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
    goto LABEL_8;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int(v3, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_244563720(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
    goto LABEL_9;
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
    goto LABEL_10;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)v8 = 8;
    *(_BYTE *)(v8 + 24) = 5;
    return swift_willThrow();
  }
  if (result >= 0x100)
  {
    sub_24456848C();
    __break(1u);
LABEL_9:
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
LABEL_10:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_2445638A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
    goto LABEL_9;
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
    goto LABEL_10;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_15;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v8 + 8) = 0;
    *(_QWORD *)(v8 + 16) = 0;
    *(_QWORD *)v8 = 8;
    *(_BYTE *)(v8 + 24) = 5;
    return swift_willThrow();
  }
  if (WORD1(result))
  {
    __break(1u);
LABEL_9:
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
LABEL_10:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_2445639DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int(v3, a2);
  if ((result & 0x80000000) != 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 8;
    *(_BYTE *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteSafeType.getSQLDataType()()
{
  uint64_t v0;
  uint64_t v1;
  PoirotSQLite::SQLiteDataType result;

  sub_244564D5C(v0, v1);
  return result;
}

uint64_t sub_244563B1C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char *v3;
  char v4;

  v4 = *v3;
  *(_QWORD *)(a3 + 24) = result;
  *(_QWORD *)(a3 + 32) = a2;
  *(_BYTE *)a3 = v4;
  return result;
}

uint64_t sub_244563B30@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563CD8(a1, a2, a3, a4, &qword_2573711C0, &qword_2573711C8, (uint64_t)&protocol witness table for Int8, a5, sub_2445633BC);
}

uint64_t static SQLiteSafeType.create(from:at:nullable:)@<X0>(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v17;
  uint64_t (*v18)(uint64_t *, Swift::Int, uint64_t, uint64_t);
  uint64_t v19;
  char v20;
  uint64_t v21;

  v7 = v6;
  v12 = *a2;
  if ((a3 & 1) == 0)
    goto LABEL_5;
  v21 = *a2;
  result = SQLiteRow.type(at:)(at);
  v7 = v14;
  if (v14)
    return result;
  if (v20 == 4)
  {
    v15 = sub_244568378();
    a6[3] = v15;
    v19 = *(_QWORD *)(a5 + 8);
    a6[4] = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v15, &v19);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a6);
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a4);
  }
  else
  {
LABEL_5:
    v21 = v12;
    v17 = *(_QWORD *)(a5 + 8);
    v18 = *(uint64_t (**)(uint64_t *, Swift::Int, uint64_t, uint64_t))(a5 + 16);
    a6[3] = a4;
    a6[4] = v17;
    __swift_allocate_boxed_opaque_existential_1(a6);
    swift_retain();
    result = v18(&v21, at, a4, a5);
    if (v7)
      return __swift_deallocate_boxed_opaque_existential_1((uint64_t)a6);
  }
  return result;
}

uint64_t sub_244563C98@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563CD8(a1, a2, a3, a4, &qword_2573711B0, &qword_2573711B8, (uint64_t)&protocol witness table for UInt8, a5, sub_244563720);
}

uint64_t sub_244563CD8@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t (*a9)(uint64_t, Swift::Int))
{
  uint64_t v9;
  uint64_t v12;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v12 = v9;
  if ((a2 & 1) == 0)
    goto LABEL_5;
  result = SQLiteRow.type(at:)(at);
  v12 = v18;
  if (v18)
    return result;
  if (v21 == 4)
  {
    *(_QWORD *)(a8 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    result = sub_2445665F0(a6, a5, a7);
    *(_QWORD *)(a8 + 32) = result;
    *(_WORD *)a8 = 256;
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v19 = swift_retain();
    result = a9(v19, at);
    if (v12)
      return __swift_deallocate_boxed_opaque_existential_1(a8);
    else
      *(_BYTE *)a8 = result;
  }
  return result;
}

void sub_244563DCC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_244563DD4@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int16 *v3;
  __int16 v4;

  v4 = *v3;
  *(_QWORD *)(a3 + 24) = result;
  *(_QWORD *)(a3 + 32) = a2;
  *(_WORD *)a3 = v4;
  return result;
}

uint64_t sub_244563DE4@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563E64(a1, a2, a3, a4, &qword_2573711A0, &qword_2573711A8, (uint64_t)&protocol witness table for Int16, a5, sub_2445634F8);
}

uint64_t sub_244563E24@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563E64(a1, a2, a3, a4, &qword_257371190, &qword_257371198, (uint64_t)&protocol witness table for UInt16, a5, sub_2445638A4);
}

uint64_t sub_244563E64@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t (*a9)(uint64_t, Swift::Int))
{
  uint64_t v9;
  uint64_t v12;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v12 = v9;
  if ((a2 & 1) == 0)
    goto LABEL_5;
  result = SQLiteRow.type(at:)(at);
  v12 = v18;
  if (v18)
    return result;
  if (v21 == 4)
  {
    *(_QWORD *)(a8 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    result = sub_2445665F0(a6, a5, a7);
    *(_QWORD *)(a8 + 32) = result;
    *(_WORD *)a8 = 0;
    *(_BYTE *)(a8 + 2) = 1;
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v19 = swift_retain();
    result = a9(v19, at);
    if (v12)
      return __swift_deallocate_boxed_opaque_existential_1(a8);
    else
      *(_WORD *)a8 = result;
  }
  return result;
}

uint64_t sub_244563F5C@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  int *v3;
  int v4;

  v4 = *v3;
  *(_QWORD *)(a3 + 24) = result;
  *(_QWORD *)(a3 + 32) = a2;
  *(_DWORD *)a3 = v4;
  return result;
}

uint64_t sub_244563F6C@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563FEC(a1, a2, a3, a4, &qword_257371180, &qword_257371188, (uint64_t)&protocol witness table for Int32, a5, sub_244563634);
}

uint64_t sub_244563FAC@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_244563FEC(a1, a2, a3, a4, &qword_257371170, &qword_257371178, (uint64_t)&protocol witness table for UInt32, a5, sub_2445639DC);
}

uint64_t sub_244563FEC@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t (*a9)(uint64_t, Swift::Int))
{
  uint64_t v9;
  uint64_t v12;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v12 = v9;
  if ((a2 & 1) == 0)
    goto LABEL_5;
  result = SQLiteRow.type(at:)(at);
  v12 = v18;
  if (v18)
    return result;
  if (v21 == 4)
  {
    *(_QWORD *)(a8 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    result = sub_2445665F0(a6, a5, a7);
    *(_QWORD *)(a8 + 32) = result;
    *(_DWORD *)a8 = 0;
    *(_BYTE *)(a8 + 4) = 1;
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v19 = swift_retain();
    result = a9(v19, at);
    if (v12)
      return __swift_deallocate_boxed_opaque_existential_1(a8);
    else
      *(_DWORD *)a8 = result;
  }
  return result;
}

sqlite3_int64 sub_2445640E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  sqlite3_int64 result;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 4;
LABEL_8:
    *(_QWORD *)v6 = v7;
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_BYTE *)(v6 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v7 = 3;
    goto LABEL_8;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (a2 <= 0x7FFFFFFF)
  {
    return sqlite3_column_int64(v3, a2);
  }
  __break(1u);
  return result;
}

uint64_t sub_2445641D0(uint64_t a1, uint64_t a2)
{
  return sub_2445641E4(a1, a2);
}

uint64_t sub_2445641E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !*(_QWORD *)(v2 + 16))
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 4;
LABEL_9:
    *(_QWORD *)v7 = v8;
    *(_QWORD *)(v7 + 8) = 0;
    *(_QWORD *)(v7 + 16) = 0;
    *(_BYTE *)(v7 + 24) = 5;
    swift_willThrow();
    return swift_release();
  }
  v3 = *(sqlite3_stmt **)(a1 + 24);
  if (!v3)
  {
    sub_2445470A0();
    swift_allocError();
    v8 = 3;
    goto LABEL_9;
  }
  result = swift_release();
  if (a2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (a2 > 0x7FFFFFFF)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  result = sqlite3_column_int64(v3, a2);
  if (result < 0)
  {
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)(v6 + 8) = 0;
    *(_QWORD *)(v6 + 16) = 0;
    *(_QWORD *)v6 = 8;
    *(_BYTE *)(v6 + 24) = 5;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_244564310@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_2445644C0(a1, a2, a3, a4, &qword_257371160, &qword_257371168, (uint64_t)&protocol witness table for Int64, a5, sub_2445640E4);
}

uint64_t sub_244564350@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_24456437C(a1, a2, a3, a4, &qword_257371150, &qword_257371158, (uint64_t)&protocol witness table for UInt64, a5);
}

uint64_t sub_24456437C@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  char v20;

  v11 = v8;
  if ((a2 & 1) == 0)
    goto LABEL_5;
  result = SQLiteRow.type(at:)(at);
  v11 = v17;
  if (v17)
    return result;
  if (v20 == 4)
  {
    *(_QWORD *)(a8 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    result = sub_2445665F0(a6, a5, a7);
    *(_QWORD *)(a8 + 32) = result;
    *(_QWORD *)a8 = 0;
    *(_BYTE *)(a8 + 8) = 1;
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v18 = swift_retain();
    result = sub_2445641E4(v18, at);
    if (v11)
      return __swift_deallocate_boxed_opaque_existential_1(a8);
    else
      *(_QWORD *)a8 = result;
  }
  return result;
}

uint64_t sub_244564470@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;

  v4 = *v3;
  a3[3] = result;
  a3[4] = a2;
  *a3 = v4;
  return result;
}

uint64_t sub_244564480@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_2445644C0(a1, a2, a3, a4, &qword_257371140, &qword_257371148, (uint64_t)&protocol witness table for Int, a5, sub_2445640E4);
}

uint64_t sub_2445644C0@<X0>(Swift::Int at@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t *a5@<X5>, unint64_t *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t (*a9)(uint64_t, Swift::Int))
{
  uint64_t v9;
  uint64_t v12;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v12 = v9;
  if ((a2 & 1) == 0)
    goto LABEL_5;
  result = SQLiteRow.type(at:)(at);
  v12 = v18;
  if (v18)
    return result;
  if (v21 == 4)
  {
    *(_QWORD *)(a8 + 24) = __swift_instantiateConcreteTypeFromMangledName(a5);
    result = sub_2445665F0(a6, a5, a7);
    *(_QWORD *)(a8 + 32) = result;
    *(_QWORD *)a8 = 0;
    *(_BYTE *)(a8 + 8) = 1;
  }
  else
  {
LABEL_5:
    *(_QWORD *)(a8 + 24) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    v19 = swift_retain();
    result = a9(v19, at);
    if (v12)
      return __swift_deallocate_boxed_opaque_existential_1(a8);
    else
      *(_QWORD *)a8 = result;
  }
  return result;
}

uint64_t sub_2445645B8@<X0>(Swift::Int a1@<X1>, char a2@<W2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  return sub_24456437C(a1, a2, a3, a4, &qword_257371130, &qword_257371138, (uint64_t)&protocol witness table for UInt, a5);
}

uint64_t static SQLiteType.sqlNull.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;

  v6 = sub_244568378();
  a3[3] = v6;
  v9 = a2;
  a3[4] = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v6, &v9);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a1);
}

uint64_t SQLiteType.isEqualTo(sqlValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t TupleTypeMetadata2;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, _QWORD, uint64_t, uint64_t);
  int v23;
  char *v24;
  void (*v25)(char *, char *, uint64_t);
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  void (*v27)(char *, uint64_t);
  char v28;
  char *v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char v38[40];

  v4 = v3;
  v33 = a3;
  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v34 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_244568378();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v35 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v13 = (char *)&v33 - v12;
  v14 = *(_QWORD *)(v9 - 8);
  v15 = MEMORY[0x24BDAC7A8](v11);
  v37 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v33 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v33 - v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v33 - v20, v4, a2);
  v22 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  v22(v21, 0, 1, a2);
  sub_24454A490(a1, (uint64_t)v38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573711D0);
  v23 = swift_dynamicCast();
  v22(v19, v23 ^ 1u, 1, a2);
  v36 = TupleTypeMetadata2;
  v24 = &v13[*(int *)(TupleTypeMetadata2 + 48)];
  v25 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
  v25(v13, v21, v9);
  v25(v24, v19, v9);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v26(v13, 1, a2) != 1)
  {
    v25(v37, v13, v9);
    if (v26(v24, 1, a2) != 1)
    {
      v29 = v34;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v34, v24, a2);
      v30 = v37;
      v28 = sub_2445681A4();
      v31 = *(void (**)(char *, uint64_t))(v7 + 8);
      v31(v29, a2);
      v27 = *(void (**)(char *, uint64_t))(v14 + 8);
      v27(v21, v9);
      v31(v30, a2);
      v27(v13, v9);
      goto LABEL_8;
    }
    v27 = *(void (**)(char *, uint64_t))(v14 + 8);
    v27(v21, v9);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v37, a2);
    goto LABEL_6;
  }
  v27 = *(void (**)(char *, uint64_t))(v14 + 8);
  v27(v21, v9);
  if (v26(v24, 1, a2) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v35 + 8))(v13, v36);
    v28 = 0;
    goto LABEL_8;
  }
  v27(v13, v9);
  v28 = 1;
LABEL_8:
  v27(v19, v9);
  return v28 & 1;
}

uint64_t SQLiteType.assumingType<A>(_:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v4 = v3;
  v8 = sub_244568378();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - v11;
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a1);
  v15 = swift_dynamicCast();
  v16 = *(_QWORD *)(a2 - 8);
  v17 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56);
  if ((v15 & 1) != 0)
  {
    v17(v12, 0, 1, a2);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(a3, v12, a2);
  }
  else
  {
    v17(v12, 1, 1, a2);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    v22 = 0;
    v23 = 0xE000000000000000;
    sub_2445683FC();
    swift_bridgeObjectRelease();
    v22 = 0x6465746365707845;
    v23 = 0xE900000000000020;
    sub_244568594();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    sub_244568594();
    sub_24456821C();
    swift_bridgeObjectRelease();
    v19 = v22;
    v20 = v23;
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v21 = v19;
    *(_QWORD *)(v21 + 8) = v20;
    *(_QWORD *)(v21 + 16) = 0;
    *(_BYTE *)(v21 + 24) = 3;
    return swift_willThrow();
  }
}

uint64_t static SQLiteUnsafeType.sqlNullable.getter()
{
  return 0;
}

uint64_t static SQLiteUnsafeType.create(from:at:nullable:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t *v18;
  char v19;
  uint64_t v20;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  HIDWORD(v25) = a3;
  v12 = sub_244568378();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v25 - v14;
  v27 = *a1;
  v16 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(a5 + 16);
  swift_retain();
  result = v16(&v27, a2, a4, a5);
  if (!v6)
  {
    v18 = a6;
    v19 = BYTE4(v25);
    v20 = *(_QWORD *)(a4 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v15, 1, a4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      if ((v19 & 1) != 0)
      {
        v18[3] = v12;
        v26 = *(_QWORD *)(a5 + 8);
        v18[4] = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v12, &v26);
        boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v18);
        return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(v20 + 56))(boxed_opaque_existential_1, 1, 1, a4);
      }
      else
      {
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v24 + 8) = 0;
        *(_QWORD *)(v24 + 16) = 0;
        *(_QWORD *)v24 = 6;
        *(_BYTE *)(v24 + 24) = 5;
        return swift_willThrow();
      }
    }
    else
    {
      v22 = *(_QWORD *)(a5 + 8);
      v18[3] = a4;
      v18[4] = v22;
      v23 = __swift_allocate_boxed_opaque_existential_1(v18);
      return (*(uint64_t (**)(uint64_t *, char *, uint64_t))(v20 + 32))(v23, v15, a4);
    }
  }
  return result;
}

PoirotSQLite::SQLiteDataType __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteUnsafeType.getSQLDataType()()
{
  uint64_t v0;
  uint64_t v1;
  PoirotSQLite::SQLiteDataType result;

  sub_244564D5C(v0, v1);
  return result;
}

void sub_244564D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(*(_QWORD *)(a2 + 8) + 24))(&v2);
  __asm { BR              X11 }
}

void sub_244564DA8(char a1@<W8>)
{
  _BYTE *v1;

  *v1 = a1;
}

uint64_t _s12PoirotSQLite0B8SafeTypePAAE16unwrapIfOptionalAA0bD0_pSgyF_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;

  v6 = *(_QWORD *)(a2 + 8);
  a3[3] = a1;
  a3[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a3);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(boxed_opaque_existential_1, v3, a1);
}

void static Bool.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t static Bool.create(from:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;
  char v7;

  v3 = sub_2445681E0();
  v4 = v2;
  if (v3 == 1702195828 && v2 == 0xE400000000000000 || (sub_244568510() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
  }
  else if (v3 == 0x65736C6166 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  else
  {
    v7 = sub_244568510();
    swift_bridgeObjectRelease();
    v5 = 0;
    if ((v7 & 1) == 0)
      v5 = 2;
  }
  *(_QWORD *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711D8);
  result = sub_2445665F0(&qword_2573711E0, &qword_2573711D8, (uint64_t)&protocol witness table for Bool);
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)a1 = v5;
  return result;
}

void sub_244564FB0(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_244564FBC@<X0>(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char v15;
  char v16;
  uint64_t v17;

  v9 = v6;
  v12 = *a2;
  if ((a3 & 1) == 0)
    goto LABEL_5;
  v17 = *a2;
  result = SQLiteRow.type(at:)(at);
  v9 = v14;
  if (v14)
    return result;
  if (v16 == 4)
  {
    *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711D8);
    result = sub_2445665F0(&qword_2573711E0, &qword_2573711D8, (uint64_t)&protocol witness table for Bool);
    *(_QWORD *)(a6 + 32) = result;
    v15 = 2;
  }
  else
  {
LABEL_5:
    v17 = v12;
    *(_QWORD *)(a6 + 24) = a4;
    *(_QWORD *)(a6 + 32) = a5;
    swift_retain();
    result = sub_24454F4D8((uint64_t)&v17, at);
    if (v9)
      return __swift_deallocate_boxed_opaque_existential_1(a6);
    v15 = result & 1;
  }
  *(_BYTE *)a6 = v15;
  return result;
}

uint64_t sub_2445650B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t result;
  char v7;

  v3 = sub_2445681E0();
  v4 = v2;
  if (v3 == 1702195828 && v2 == 0xE400000000000000 || (sub_244568510() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v5 = 1;
  }
  else if (v3 == 0x65736C6166 && v4 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    v5 = 0;
  }
  else
  {
    v7 = sub_244568510();
    swift_bridgeObjectRelease();
    v5 = 0;
    if ((v7 & 1) == 0)
      v5 = 2;
  }
  *(_QWORD *)(a1 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711D8);
  result = sub_2445665F0(&qword_2573711E0, &qword_2573711D8, (uint64_t)&protocol witness table for Bool);
  *(_QWORD *)(a1 + 32) = result;
  *(_BYTE *)a1 = v5;
  return result;
}

void static Float.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t static Float.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  _BYTE *v5;
  int v6;
  int v7;
  uint64_t result;
  _BYTE *v9;
  _QWORD v10[2];
  int v11;

  v11 = 0;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_2445683F0();
    swift_bridgeObjectRelease();
    v6 = LOBYTE(v10[0]);
  }
  else
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        swift_bridgeObjectRetain();
      }
      else
      {
        v4 = sub_244568420();
        swift_bridgeObjectRetain();
        if (!v4)
        {
          v5 = 0;
          goto LABEL_7;
        }
      }
      v5 = (_BYTE *)v4;
LABEL_7:
      sub_2445663AC(v5, (BOOL *)v10);
      v6 = LOBYTE(v10[0]);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    v10[0] = a1;
    v10[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    switch((char)a1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 32:
        swift_bridgeObjectRetain();
        goto LABEL_10;
      default:
        swift_bridgeObjectRetain();
        v9 = (_BYTE *)_swift_stdlib_strtof_clocale();
        if (v9)
          v6 = *v9 == 0;
        else
LABEL_10:
          v6 = 0;
        swift_bridgeObjectRelease();
        break;
    }
  }
LABEL_12:
  if (v6)
    v7 = v11;
  else
    v7 = 0;
  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711E8);
  result = sub_2445665F0(&qword_2573711F0, &qword_2573711E8, (uint64_t)&protocol witness table for Float);
  *(_QWORD *)(a3 + 32) = result;
  *(_DWORD *)a3 = v7;
  *(_BYTE *)(a3 + 4) = v6 ^ 1;
  return result;
}

void sub_2445653C4(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

float sub_2445653D0@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  float *v3;
  float result;

  result = *v3;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
  *(float *)a3 = result;
  return result;
}

void sub_2445653E0(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  int v14;
  char v15;
  uint64_t v16;

  v9 = v6;
  v12 = *a2;
  if ((a3 & 1) == 0)
    goto LABEL_5;
  v16 = *a2;
  SQLiteRow.type(at:)(at);
  v9 = v13;
  if (v13)
    return;
  if (v15 == 4)
  {
    *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711E8);
    *(_QWORD *)(a6 + 32) = sub_2445665F0(&qword_2573711F0, &qword_2573711E8, (uint64_t)&protocol witness table for Float);
    *(_DWORD *)a6 = 0;
    *(_BYTE *)(a6 + 4) = 1;
  }
  else
  {
LABEL_5:
    v16 = v12;
    *(_QWORD *)(a6 + 24) = a4;
    *(_QWORD *)(a6 + 32) = a5;
    swift_retain();
    sub_24454F6BC((uint64_t)&v16, at);
    if (v9)
      __swift_deallocate_boxed_opaque_existential_1(a6);
    else
      *(_DWORD *)a6 = v14;
  }
}

uint64_t sub_2445654DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6;
  int v7;
  uint64_t result;
  _QWORD v9[4];
  int v10;

  v10 = 0;
  v9[2] = &v10;
  swift_bridgeObjectRetain();
  v6 = sub_24454E490((uint64_t)sub_2445663AC, (uint64_t)v9, a1, a2);
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    v7 = v10;
  else
    v7 = 0;
  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711E8);
  result = sub_2445665F0(&qword_2573711F0, &qword_2573711E8, (uint64_t)&protocol witness table for Float);
  *(_QWORD *)(a3 + 32) = result;
  *(_DWORD *)a3 = v7;
  *(_BYTE *)(a3 + 4) = (v6 & 1) == 0;
  return result;
}

void static Double.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t static Double.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  uint64_t result;
  _BYTE *v9;
  _QWORD v10[2];
  uint64_t v11;

  v11 = 0;
  if ((a2 & 0x1000000000000000) != 0 || !(a2 & 0x2000000000000000 | a1 & 0x1000000000000000))
  {
    swift_bridgeObjectRetain();
    sub_2445683F0();
    swift_bridgeObjectRelease();
    v6 = LOBYTE(v10[0]);
  }
  else
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((a1 & 0x1000000000000000) != 0)
      {
        v4 = (a2 & 0xFFFFFFFFFFFFFFFLL) + 32;
        swift_bridgeObjectRetain();
      }
      else
      {
        v4 = sub_244568420();
        swift_bridgeObjectRetain();
        if (!v4)
        {
          v5 = 0;
          goto LABEL_7;
        }
      }
      v5 = (_BYTE *)v4;
LABEL_7:
      sub_2445663C8(v5, (BOOL *)v10);
      v6 = LOBYTE(v10[0]);
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    v10[0] = a1;
    v10[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    switch((char)a1)
    {
      case 0:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 32:
        swift_bridgeObjectRetain();
        goto LABEL_10;
      default:
        swift_bridgeObjectRetain();
        v9 = (_BYTE *)_swift_stdlib_strtod_clocale();
        if (v9)
          v6 = *v9 == 0;
        else
LABEL_10:
          v6 = 0;
        swift_bridgeObjectRelease();
        break;
    }
  }
LABEL_12:
  if (v6)
    v7 = v11;
  else
    v7 = 0;
  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711F8);
  result = sub_2445665F0(&qword_257371200, &qword_2573711F8, (uint64_t)&protocol witness table for Double);
  *(_QWORD *)(a3 + 32) = result;
  *(_QWORD *)a3 = v7;
  *(_BYTE *)(a3 + 8) = v6 ^ 1;
  return result;
}

void sub_244565784(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

double sub_244565790@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  double *v3;
  double result;

  result = *v3;
  *(_QWORD *)(a3 + 24) = a1;
  *(_QWORD *)(a3 + 32) = a2;
  *(double *)a3 = result;
  return result;
}

void sub_2445657A0(Swift::Int at@<X1>, uint64_t *a2@<X0>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;

  v9 = v6;
  v12 = *a2;
  if ((a3 & 1) == 0)
    goto LABEL_5;
  v16 = *a2;
  SQLiteRow.type(at:)(at);
  v9 = v13;
  if (v13)
    return;
  if (v15 == 4)
  {
    *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711F8);
    *(_QWORD *)(a6 + 32) = sub_2445665F0(&qword_257371200, &qword_2573711F8, (uint64_t)&protocol witness table for Double);
    *(_QWORD *)a6 = 0;
    *(_BYTE *)(a6 + 8) = 1;
  }
  else
  {
LABEL_5:
    v16 = v12;
    *(_QWORD *)(a6 + 24) = a4;
    *(_QWORD *)(a6 + 32) = a5;
    swift_retain();
    sub_24454F5D0((uint64_t)&v16, at);
    if (v9)
      __swift_deallocate_boxed_opaque_existential_1(a6);
    else
      *(_QWORD *)a6 = v14;
  }
}

uint64_t sub_24456589C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[4];
  uint64_t v10;

  v9[2] = &v10;
  swift_bridgeObjectRetain();
  v6 = sub_24454E490((uint64_t)sub_2445663C8, (uint64_t)v9, a1, a2);
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
    v7 = v10;
  else
    v7 = 0;
  *(_QWORD *)(a3 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_2573711F8);
  result = sub_2445665F0(&qword_257371200, &qword_2573711F8, (uint64_t)&protocol witness table for Double);
  *(_QWORD *)(a3 + 32) = result;
  *(_QWORD *)a3 = v7;
  *(_BYTE *)(a3 + 8) = (v6 & 1) == 0;
  return result;
}

void static String.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t static String.create(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  a3[3] = MEMORY[0x24BEE0D00];
  a3[4] = &protocol witness table for String;
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

void sub_244565998(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2445659A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *v3;
  v4 = v3[1];
  a3[3] = a1;
  a3[4] = a2;
  *a3 = v5;
  a3[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2445659B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *a1;
  swift_retain();
  result = String.init(with:column:)((uint64_t)&v15, a2);
  if (!v6)
  {
    if (v13)
    {
      a6[3] = a4;
      a6[4] = a5;
      *a6 = result;
      a6[1] = v13;
    }
    else if ((a3 & 1) != 0)
    {
      a6[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_257371220);
      result = sub_2445665F0(&qword_257371228, &qword_257371220, (uint64_t)&protocol witness table for String);
      a6[4] = result;
      *a6 = 0;
      a6[1] = 0;
    }
    else
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v14 + 8) = 0;
      *(_QWORD *)(v14 + 16) = 0;
      *(_QWORD *)v14 = 6;
      *(_BYTE *)(v14 + 24) = 5;
      return swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_244565AA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  a5[3] = a3;
  a5[4] = a4;
  *a5 = a1;
  a5[1] = a2;
  return swift_bridgeObjectRetain();
}

void static Data.sqlColumnType.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

unint64_t static Data.create(from:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  v2 = sub_244568150();
  v4 = v3;
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_257371208);
  result = sub_2445663E4();
  a1[4] = result;
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t sub_244565B24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v4 = *v3;
  v5 = v3[1];
  a3[3] = a1;
  a3[4] = a2;
  *a3 = v4;
  a3[1] = v5;
  return sub_24454F0C8(v4, v5);
}

uint64_t sub_244565B3C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t result;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *a1;
  swift_retain();
  result = (uint64_t)sub_244559570(&v15, a2);
  if (!v6)
  {
    if (v13 >> 60 == 15)
    {
      if ((a3 & 1) != 0)
      {
        *(_QWORD *)(a6 + 24) = __swift_instantiateConcreteTypeFromMangledName(&qword_257371208);
        result = sub_2445663E4();
        *(_QWORD *)(a6 + 32) = result;
        *(_OWORD *)a6 = xmmword_24456A920;
      }
      else
      {
        sub_2445470A0();
        swift_allocError();
        *(_QWORD *)(v14 + 8) = 0;
        *(_QWORD *)(v14 + 16) = 0;
        *(_QWORD *)v14 = 6;
        *(_BYTE *)(v14 + 24) = 5;
        return swift_willThrow();
      }
    }
    else
    {
      *(_QWORD *)(a6 + 24) = a4;
      *(_QWORD *)(a6 + 32) = a5;
      *(_QWORD *)a6 = result;
      *(_QWORD *)(a6 + 8) = v13;
    }
  }
  return result;
}

unint64_t sub_244565C1C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t result;

  v2 = sub_244568150();
  v4 = v3;
  a1[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_257371208);
  result = sub_2445663E4();
  a1[4] = result;
  *a1 = v2;
  a1[1] = v4;
  return result;
}

uint64_t static Optional<A>.sqlNullable.getter()
{
  return 1;
}

uint64_t static Optional<A>.sqlColumnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t static Optional<A>.create(from:at:nullable:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;

  v6 = *a1;
  return (*(uint64_t (**)(uint64_t *))(a5 + 56))(&v6);
}

uint64_t static Optional<A>.create(from:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v12;

  v8 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v8 = a1 & 0xFFFFFFFFFFFFLL;
  if (v8)
    return (*(uint64_t (**)(void))(a4 + 64))();
  v10 = sub_244568378();
  a5[3] = v10;
  v12 = a4;
  a5[4] = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v10, &v12);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56))(boxed_opaque_existential_1, 1, 1, a3);
}

uint64_t Optional<A>.getSQLDataType()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
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
  uint64_t result;
  _QWORD v15[2];

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if ((_DWORD)result == 1)
  {
    *a3 = 4;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(a2 + 40))(v5, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t Optional<A>.unwrapIfOptional()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t result;
  uint64_t v15;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if ((_DWORD)result == 1)
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(a2 + 48))(v5, a2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_244565FBC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 - 8) + 24))();
}

uint64_t sub_244565FE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  _QWORD v15[2];

  v4 = *(_QWORD *)(a2 - 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if ((_DWORD)result == 1)
  {
    *a3 = 4;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_24456610C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v4 = *(_QWORD *)(a2 - 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v12 + 16))(v11, v13);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5);
  if ((_DWORD)result == 1)
  {
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    (*(void (**)(uint64_t, uint64_t))(v4 + 48))(v5, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  }
  return result;
}

uint64_t sub_24456621C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;

  v5 = *(_QWORD *)(a5 - 8);
  v7 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v5 + 56))(&v7);
}

uint64_t sub_244566254@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;

  v6 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v6 = a1 & 0xFFFFFFFFFFFFLL;
  if (v6)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 64))();
  a5[3] = a3;
  a5[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a5);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 56))(boxed_opaque_existential_1, 1, 1);
}

uint64_t static RawRepresentable<>.sqlColumnType.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_24456631C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t *__return_ptr))
{
  uint64_t v3;
  char v4;
  uint64_t var2;

  if (a1)
  {
    a3(&var2);
    if (!v3)
      v4 = var2;
  }
  else
  {
    ((void (*)(uint64_t *__return_ptr, _QWORD, _QWORD))a3)((uint64_t *)((char *)&var2 + 1), 0, 0);
    if (!v3)
      v4 = BYTE1(var2);
  }
  return v4 & 1;
}

_QWORD *sub_244566370@<X0>(_QWORD *(*a1)(uint64_t *__return_ptr)@<X2>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v5;

  result = a1(&v5);
  if (!v2)
    *a2 = v5;
  return result;
}

_BYTE *sub_2445663AC@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_244566580(a1, MEMORY[0x24BEE4B50], a2);
}

_BYTE *sub_2445663C8@<X0>(_BYTE *a1@<X0>, BOOL *a2@<X8>)
{
  return sub_244566580(a1, MEMORY[0x24BEE4B48], a2);
}

unint64_t sub_2445663E4()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257371210;
  if (!qword_257371210)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257371208);
    v2 = sub_24454721C();
    result = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257371210);
  }
  return result;
}

unint64_t sub_244566448(uint64_t a1)
{
  unint64_t result;

  result = sub_24456646C();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_24456646C()
{
  unint64_t result;

  result = qword_257371218;
  if (!qword_257371218)
  {
    result = MEMORY[0x249512068](MEMORY[0x24BDCDE08], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257371218);
  }
  return result;
}

uint64_t sub_2445664B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v5 = *a3;
  v8 = *(_QWORD *)(*a3 + 8);
  *(_QWORD *)(a1 + 8) = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, a2, &v8);
  v7 = *(_QWORD *)(v5 + 16);
  result = MEMORY[0x249512068](MEMORY[0x24BEE4AB0], a2, &v7);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t dispatch thunk of static SQLiteType.sqlColumnType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of static SQLiteType.sqlNullable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SQLiteType.getSQLDataType()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SQLiteType.unwrapIfOptional()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of static SQLiteType.create(from:at:nullable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of static SQLiteType.create(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

_BYTE *sub_244566580@<X0>(_BYTE *result@<X0>, uint64_t (*a2)(void)@<X1>, BOOL *a3@<X8>)
{
  unsigned int v4;
  BOOL v5;
  uint64_t v6;
  BOOL v7;
  BOOL v8;

  v4 = *result;
  v5 = v4 > 0x20;
  v6 = (1 << v4) & 0x100003E01;
  v7 = v5 || v6 == 0;
  v8 = v7 && (result = (_BYTE *)a2()) != 0 && *result == 0;
  *a3 = v8;
  return result;
}

uint64_t sub_2445665F0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3;
    result = MEMORY[0x249512068](&protocol conformance descriptor for <A> A?, v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_244566658(_BYTE *a1@<X8>)
{
  sub_244563DCC(a1);
}

uint64_t sub_24456666C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  sqlite3_stmt *v7;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  sqlite3_stmt *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
LABEL_20:
    sub_2445470A0();
    swift_allocError();
    v18 = 4;
LABEL_22:
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)v17 = v18;
    *(_BYTE *)(v17 + 24) = 5;
    return swift_willThrow();
  }
  v7 = *(sqlite3_stmt **)(a3 + 24);
  if (!v7)
  {
LABEL_21:
    sub_2445470A0();
    swift_allocError();
    v18 = 3;
    goto LABEL_22;
  }
  result = sqlite3_column_count(v7);
  if ((result & 0x80000000) != 0)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  v10 = (int)result;
  if (!(_DWORD)result)
  {
LABEL_25:
    sub_2445470A0();
    swift_allocError();
    *(_QWORD *)v19 = a1;
    *(_QWORD *)(v19 + 8) = a2;
    *(_QWORD *)(v19 + 16) = 0;
    *(_BYTE *)(v19 + 24) = 1;
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v11 = 0;
  while (1)
  {
    if (v10 == v11)
    {
      __break(1u);
      goto LABEL_27;
    }
    v13 = *(_QWORD *)(a3 + 16);
    if (!v13 || !*(_QWORD *)(v13 + 16))
      goto LABEL_20;
    v14 = *(sqlite3_stmt **)(a3 + 24);
    if (!v14)
      goto LABEL_21;
    result = (uint64_t)sqlite3_column_name(v14, v11);
    if (!result)
      goto LABEL_8;
    if (sub_244568228() == a1 && v15 == a2)
      break;
    v12 = sub_244568510();
    result = swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_17;
LABEL_8:
    if (v10 == ++v11)
      goto LABEL_25;
  }
  swift_bridgeObjectRelease();
LABEL_17:
  v20 = a3;
  swift_retain();
  result = String.init(with:column:)((uint64_t)&v20, v11);
  if (!v3 && !v16)
  {
    sub_2445470A0();
    swift_allocError();
    v18 = 6;
    goto LABEL_22;
  }
  return result;
}

uint64_t SQLiteDatabaseInspector.inspectSchemas(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v6)(uint64_t, uint64_t);
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  uint64_t v36;
  uint64_t v37;

  v6 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
  v7 = *(_QWORD *)(v6(a2, a3) + 16);
  result = swift_bridgeObjectRelease();
  if (v7)
  {
    v29 = a3;
    v9 = v6(a2, a3);
    v37 = v9;
    v10 = *(_QWORD *)(v9 + 16);
    v11 = MEMORY[0x24BEE4AF8];
    if (v10)
    {
      v12 = v9;
      v36 = MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_244552D54(0, v10, 0);
      v13 = v12 + 32;
      v11 = v36;
      do
      {
        sub_244566FA8(v13, (uint64_t)&v31);
        v30[0] = 39;
        v30[1] = 0xE100000000000000;
        swift_bridgeObjectRetain();
        sub_24456821C();
        swift_bridgeObjectRelease();
        sub_24456821C();
        sub_244566FE4((uint64_t)&v31);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_244552D54(0, *(_QWORD *)(v11 + 16) + 1, 1);
          v11 = v36;
        }
        v15 = *(_QWORD *)(v11 + 16);
        v14 = *(_QWORD *)(v11 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_244552D54(v14 > 1, v15 + 1, 1);
          v11 = v36;
        }
        *(_QWORD *)(v11 + 16) = v15 + 1;
        v16 = v11 + 16 * v15;
        *(_QWORD *)(v16 + 32) = 39;
        *(_QWORD *)(v16 + 40) = 0xE100000000000000;
        v13 += 56;
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease();
    }
    v31 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257370FD0);
    sub_24454C180();
    sub_24456818C();
    swift_bridgeObjectRelease();
    v31 = 0;
    v32 = 0xE000000000000000;
    sub_2445683FC();
    sub_24456821C();
    sub_24456821C();
    swift_bridgeObjectRelease();
    sub_24456821C();
    sub_244553B18(v31, v32, 0, (uint64_t)v30);
    v17 = swift_bridgeObjectRelease();
    if (!v3)
    {
      v18 = v30[0];
      v19 = v30[2];
      *(double *)&v20 = MEMORY[0x24BDAC7A8](v17);
      v31 = v18;
      v32 = v21;
      v33 = v19;
      v34 = v20;
      v35 = v22;
      sub_244557F64(&v31, (void (*)(uint64_t *))sub_244567018);
      swift_bridgeObjectRelease();
      swift_release();
      v23 = *(_QWORD *)(v37 + 16);
      if (v23)
      {
        v24 = a2;
        v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 32);
        v26 = v37 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_244566FA8(v26, (uint64_t)&v31);
          v27 = v31;
          v28 = v32;
          swift_bridgeObjectRetain();
          sub_244566FE4((uint64_t)&v31);
          v25(v27, v28, v24, v29);
          swift_bridgeObjectRelease();
          v26 += 56;
          --v23;
        }
        while (v23);
        swift_bridgeObjectRelease();
      }
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_244566BC8(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
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
  uint64_t v20;
  unint64_t v21;
  _QWORD *i;
  BOOL v23;
  char v24;
  _BYTE v25[56];
  uint64_t v26;

  v9 = *a1;
  result = sub_24456666C(1701667182, 0xE400000000000000, *a1);
  if (!v5)
  {
    v12 = result;
    v13 = v11;
    v14 = sub_24456666C(7106931, 0xE300000000000000, v9);
    v16 = v15;
    v17 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 16))(v12, v13, a4, a5);
    if (v17 == v14 && v18 == v16)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = v18;
      v24 = sub_244568510();
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 24))(v12, v13, v14, v16, a4, a5);
    }
    swift_bridgeObjectRelease();
    v20 = *(_QWORD *)(*(_QWORD *)a3 + 16);
    if (v20)
    {
      v21 = 0;
      for (i = (_QWORD *)(*(_QWORD *)a3 + 40); ; i += 7)
      {
        v23 = *(i - 1) == v12 && *i == v13;
        if (v23 || (sub_244568510() & 1) != 0)
          break;
        if (v20 == ++v21)
          return swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      sub_244566D88(v21, (uint64_t)v25);
      return sub_244566FE4((uint64_t)v25);
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_244566D88@<X0>(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD **v2;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t result;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_244567084(v5);
  v6 = v5[2];
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = &v5[7 * a1];
    v9 = *((_OWORD *)v8 + 3);
    *(_OWORD *)a2 = *((_OWORD *)v8 + 2);
    *(_OWORD *)(a2 + 16) = v9;
    *(_OWORD *)(a2 + 32) = *((_OWORD *)v8 + 4);
    *(_QWORD *)(a2 + 48) = v8[10];
    if ((uint64_t)(v7 - a1) >= 0)
    {
      result = (uint64_t)memmove(v8 + 4, v8 + 11, 56 * (v7 - a1));
      v5[2] = v7;
      *v2 = v5;
      return result;
    }
  }
  result = sub_2445684C8();
  __break(1u);
  return result;
}

_QWORD *sub_244566E80(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257371230);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4])
          memmove(v12, a4 + 4, 56 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_244567098(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_244566FA8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for SQLiteTableDescription(a2, a1);
  return a2;
}

uint64_t sub_244566FE4(uint64_t a1)
{
  destroy for SQLiteTableDescription(a1);
  return a1;
}

uint64_t sub_244567018(uint64_t *a1)
{
  uint64_t *v1;

  return sub_244566BC8(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.tables.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.tableCreationStatementString(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.onError(table:withInvalidSchema:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

uint64_t dispatch thunk of SQLiteDatabaseInspector.onError(missingTable:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

_QWORD *sub_244567084(_QWORD *a1)
{
  return sub_244566E80(0, a1[2], 0, a1);
}

uint64_t sub_244567098(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2445684C8();
  __break(1u);
  return result;
}

uint64_t SQLiteTableDescription.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SQLiteTableDescription.schema.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24454A490(v1 + 16, a1);
}

uint64_t SQLiteTableDescription.init(name:schema:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  return sub_24454A19C(a3, (uint64_t)(a4 + 2));
}

uint64_t sub_2445671D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v13[40];
  _QWORD v14[2];
  uint64_t v15;

  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 32;
    while (1)
    {
      sub_244566FA8(v8, (uint64_t)v14);
      v9 = v14[0];
      v10 = (void *)v14[1];
      sub_24454A490((uint64_t)&v15, (uint64_t)v13);
      swift_bridgeObjectRetain();
      sub_244566FE4((uint64_t)v14);
      SQLiteDatabaseManager.create(table:with:in:)(v9, v10, (uint64_t)v13, a1, a2, a3);
      if (v3)
        break;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
      swift_bridgeObjectRelease();
      v8 += 56;
      if (!--v7)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 40))(a1, a2, a3);
  }
}

_QWORD *SQLiteDatabaseManager.create(table:with:in:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *result;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  _OWORD v11[2];
  __int128 v12;
  _OWORD v13[2];
  __int128 v14;
  _OWORD v15[2];

  result = SQLiteDatabaseManager.tableCreationStatementString(for:with:)(a1, a2, a3, a5, a6);
  if (!v6)
  {
    sub_244553B18((uint64_t)result, v8, 0, (uint64_t)&v12);
    v9 = swift_bridgeObjectRelease();
    v14 = v12;
    v15[0] = v13[0];
    *(_OWORD *)((char *)v15 + 9) = *(_OWORD *)((char *)v13 + 9);
    MEMORY[0x24BDAC7A8](v9);
    v10 = v12;
    v11[0] = v13[0];
    *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)v13 + 9);
    sub_244557F64((uint64_t *)&v10, (void (*)(uint64_t *))sub_244555690);
    return (_QWORD *)sub_24454ABFC((uint64_t)&v14);
  }
  return result;
}

uint64_t SQLiteDatabaseManager.dropTables(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  __int128 v22;
  _OWORD v23[2];
  void *v24;
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;
  __int128 v28;
  _BYTE v29[25];
  void *v30;

  v4 = v3;
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 32;
    do
    {
      sub_244566FA8(v8, (uint64_t)&v27);
      *(_QWORD *)&v22 = 0;
      *((_QWORD *)&v22 + 1) = 0xE000000000000000;
      sub_2445683FC();
      swift_bridgeObjectRelease();
      *(_QWORD *)&v22 = 0xD000000000000015;
      *((_QWORD *)&v22 + 1) = 0x8000000244569830;
      swift_bridgeObjectRetain();
      sub_24456821C();
      swift_bridgeObjectRelease();
      sub_244553B18(v22, *((uint64_t *)&v22 + 1), 0, (uint64_t)&v25);
      if (v4)
      {
        swift_bridgeObjectRelease();
        v30 = 0;
        if (qword_257370D10 != -1)
          swift_once();
        v11 = sub_244568180();
        __swift_project_value_buffer(v11, (uint64_t)qword_257371260);
        sub_244566FA8((uint64_t)&v27, (uint64_t)&v25);
        MEMORY[0x249511FD8](v4);
        MEMORY[0x249511FD8](v4);
        v12 = sub_244568168();
        v13 = sub_244568360();
        if (os_log_type_enabled(v12, v13))
        {
          v14 = swift_slowAlloc();
          v15 = swift_slowAlloc();
          *(_QWORD *)&v22 = v15;
          *(_DWORD *)v14 = 136315394;
          v16 = a1;
          v18 = *((_QWORD *)&v25 + 1);
          v17 = v25;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v14 + 4) = sub_244558788(v17, v18, (uint64_t *)&v22);
          swift_bridgeObjectRelease();
          sub_244566FE4((uint64_t)&v25);
          *(_WORD *)(v14 + 12) = 2080;
          v24 = v4;
          MEMORY[0x249511FD8](v4);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257370DB8);
          v19 = sub_2445681D4();
          *(_QWORD *)(v14 + 14) = sub_244558788(v19, v20, (uint64_t *)&v22);
          a1 = v16;
          swift_bridgeObjectRelease();

          _os_log_impl(&dword_244545000, v12, v13, "Failed to delete table: %s with %s", (uint8_t *)v14, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2495120E0](v15, -1, -1);
          MEMORY[0x2495120E0](v14, -1, -1);

        }
        else
        {

          sub_244566FE4((uint64_t)&v25);
        }

        sub_244566FE4((uint64_t)&v27);
        v4 = v30;
      }
      else
      {
        v9 = swift_bridgeObjectRelease();
        v28 = v25;
        *(_OWORD *)v29 = v26[0];
        *(_OWORD *)&v29[9] = *(_OWORD *)((char *)v26 + 9);
        MEMORY[0x24BDAC7A8](v9);
        v22 = v28;
        v23[0] = *(_OWORD *)v29;
        *(_OWORD *)((char *)v23 + 9) = *(_OWORD *)(v10 + 25);
        sub_244557F64((uint64_t *)&v22, (void (*)(uint64_t *))sub_2445559B4);
        sub_24454ABFC((uint64_t)&v28);
        sub_244566FE4((uint64_t)&v27);
      }
      v8 += 56;
      --v7;
    }
    while (v7);
  }
  return swift_bridgeObjectRelease();
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> SQLiteDatabaseManager.tableCreationStatementString(for:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  Swift::String result;
  _OWORD v18[3];
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  __int128 v24[2];
  _BYTE v25[48];

  v3 = v2;
  v4 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v7 = (*(uint64_t (**)())(v2 + 16))();
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
LABEL_9:
    v23 = 0;
    v21 = 0u;
    v22 = 0u;
    v20 = 0u;
    swift_bridgeObjectRelease();
LABEL_12:
    sub_244567C64((uint64_t)&v20);
    *(_QWORD *)&v20 = 0;
    *((_QWORD *)&v20 + 1) = 0xE000000000000000;
    sub_2445683FC();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v20 = 0x20656C626154;
    *((_QWORD *)&v20 + 1) = 0xE600000000000000;
    sub_24456821C();
    sub_24456821C();
    v13 = (void *)*((_QWORD *)&v20 + 1);
    v11 = (_QWORD *)v20;
    sub_2445470A0();
    swift_allocError();
    *(_OWORD *)v14 = __PAIR128__((unint64_t)v13, (unint64_t)v11);
    *(_QWORD *)(v14 + 16) = 0;
    *(_BYTE *)(v14 + 24) = 4;
    swift_willThrow();
    goto LABEL_13;
  }
  v9 = v7 + 32;
  while (1)
  {
    sub_244566FA8(v9, (uint64_t)v18);
    v10 = *(_QWORD *)&v18[0] == countAndFlagsBits && *((_QWORD *)&v18[0] + 1) == (_QWORD)object;
    if (v10 || (sub_244568510() & 1) != 0)
      break;
    sub_244566FE4((uint64_t)v18);
    v9 += 56;
    if (!--v8)
      goto LABEL_9;
  }
  v20 = v18[0];
  v21 = v18[1];
  v22 = v18[2];
  v23 = v19;
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v20 + 1))
    goto LABEL_12;
  sub_24454A490((uint64_t)&v21, (uint64_t)v24);
  sub_244566FE4((uint64_t)&v20);
  sub_24454A19C(v24, (uint64_t)v25);
  v11 = SQLiteDatabaseManager.tableCreationStatementString(for:with:)(countAndFlagsBits, object, (uint64_t)v25, v4, v3);
  v13 = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
LABEL_13:
  v15 = (uint64_t)v11;
  v16 = v13;
  result._object = v16;
  result._countAndFlagsBits = v15;
  return result;
}

_QWORD *SQLiteDatabaseManager.tableCreationStatementString(for:with:)(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v14;
  Swift::String v15;
  _QWORD *v16;
  uint64_t countAndFlagsBits;
  uint64_t v18;
  _QWORD v19[4];

  v10 = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(a5 + 64))(a1, a2, a4, a5);
  if (!v6)
  {
    v5 = (_QWORD *)v10;
    v12 = v11;
    sub_24454A490(a3, (uint64_t)v19);
    if (!v12)
    {
      v14 = __swift_project_boxed_opaque_existential_1(v19, v19[3]);
      v15._countAndFlagsBits = a1;
      v15._object = a2;
      v16 = v5;
      v5 = v14;
      countAndFlagsBits = SQLiteSchemaDescribing.makeCreateStatementString(for:in:)(v15, (Swift::String_optional)(unint64_t)v16)._countAndFlagsBits;
      if (!v18)
        v5 = (_QWORD *)countAndFlagsBits;
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  }
  return v5;
}

void SQLiteDatabaseManager.ensureVersion(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 24))(a1, a2, a3);
  if (!v3 && v7 != v8)
  {
    if (v8 >= v7)
    {
      sub_2445470A0();
      swift_allocError();
      *(_QWORD *)(v10 + 8) = 0;
      *(_QWORD *)(v10 + 16) = 0;
      *(_QWORD *)v10 = 11;
      *(_BYTE *)(v10 + 24) = 5;
      swift_willThrow();
    }
    else
    {
      if (v8)
        v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a3 + 48))(a1, v8, a2, a3);
      else
        v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 32))(a1, a2, a3);
      MEMORY[0x24BDAC7A8](v9);
      sub_244553D58((void (*)(uint64_t))sub_244567CA4);
    }
  }
}

uint64_t sub_244567C18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 56))(a3, a1, a4, a5);
  else
    return sub_2445671D4(a3, a4, a5);
}

uint64_t sub_244567C64(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257371238);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_244567CA4()
{
  uint64_t *v0;

  return sub_244567C18(v0[4], v0[5], v0[6], v0[2], v0[3]);
}

uint64_t destroy for SQLiteTableDescription(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
}

uint64_t initializeWithCopy for SQLiteTableDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = a2 + 16;
  v5 = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 40) = v5;
  v6 = v5;
  v7 = **(void (***)(uint64_t, uint64_t, uint64_t))(v5 - 8);
  swift_bridgeObjectRetain();
  v7(a1 + 16, v4, v6);
  return a1;
}

_QWORD *assignWithCopy for SQLiteTableDescription(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  __swift_assign_boxed_opaque_existential_1(a1 + 2, a2 + 2);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SQLiteTableDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for SQLiteTableDescription(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SQLiteTableDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SQLiteTableDescription()
{
  return &type metadata for SQLiteTableDescription;
}

uint64_t dispatch thunk of SQLiteDatabaseManager.currentVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.tables.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.validatedVersion(of:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.willCreate(database:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.populateDefaultRows(in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.willUpdateToCurrentVersion(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.updateToCurrentVersion(_:from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t dispatch thunk of SQLiteDatabaseManager.customTableCreationStatementString(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 64))();
}

uint64_t sub_2445680C0()
{
  return MEMORY[0x24BDCB630]();
}

uint64_t sub_2445680CC()
{
  return MEMORY[0x24BDCB638]();
}

uint64_t sub_2445680D8()
{
  return MEMORY[0x24BDCB6D8]();
}

uint64_t sub_2445680E4()
{
  return MEMORY[0x24BDCB720]();
}

uint64_t sub_2445680F0()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_2445680FC()
{
  return MEMORY[0x24BDCBBB0]();
}

uint64_t sub_244568108()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_244568114()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_244568120()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_24456812C()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_244568138()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_244568144()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_244568150()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_24456815C()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_244568168()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_244568174()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_244568180()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24456818C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_244568198()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2445681A4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2445681B0()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t sub_2445681BC()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2445681C8()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2445681D4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2445681E0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2445681EC()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2445681F8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_244568204()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_244568210()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24456821C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_244568228()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_244568234()
{
  return MEMORY[0x24BEE0BF0]();
}

uint64_t sub_244568240()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24456824C()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_244568258()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_244568264()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_244568270()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_24456827C()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_244568288()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_244568294()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2445682A0()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2445682AC()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_2445682B8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2445682C4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2445682D0()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_2445682DC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2445682E8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2445682F4()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_244568300()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24456830C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_244568318()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_244568324()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_244568330()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_24456833C()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_244568348()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_244568354()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_244568360()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24456836C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_244568378()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_244568384()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_244568390()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24456839C()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_2445683A8()
{
  return MEMORY[0x24BEE1FD0]();
}

uint64_t sub_2445683B4()
{
  return MEMORY[0x24BEE2068]();
}

uint64_t sub_2445683C0()
{
  return MEMORY[0x24BEE2070]();
}

uint64_t sub_2445683CC()
{
  return MEMORY[0x24BEE2078]();
}

uint64_t sub_2445683D8()
{
  return MEMORY[0x24BEE20A0]();
}

uint64_t sub_2445683E4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2445683F0()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_2445683FC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_244568408()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_244568414()
{
  return MEMORY[0x24BEE2548]();
}

uint64_t sub_244568420()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24456842C()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_244568438()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_244568444()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_244568450()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_24456845C()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_244568468()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_244568474()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_244568480()
{
  return MEMORY[0x24BEE2D88]();
}

uint64_t sub_24456848C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_244568498()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2445684A4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2445684B0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2445684BC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2445684C8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2445684D4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2445684E0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2445684EC()
{
  return MEMORY[0x24BEE3910]();
}

uint64_t sub_2445684F8()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_244568504()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_244568510()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24456851C()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_244568528()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_244568534()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_244568540()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24456854C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_244568558()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_244568564()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_244568570()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24456857C()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_244568588()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_244568594()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_strtod_clocale()
{
  return MEMORY[0x24BEE4B48]();
}

uint64_t _swift_stdlib_strtof_clocale()
{
  return MEMORY[0x24BEE4B50]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x24BEDDF80](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close_v2(sqlite3 *a1)
{
  return MEMORY[0x24BEDE018](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE038](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x24BEDE060](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *))
{
  return MEMORY[0x24BEDE0A8](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B0](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_module_v2(sqlite3 *db, const char *zName, const sqlite3_module *p, void *pClientData, void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x24BEDE0B8](db, zName, p, pClientData, xDestroy);
}

int sqlite3_declare_vtab(sqlite3 *a1, const char *zSQL)
{
  return MEMORY[0x24BEDE0F0](a1, zSQL);
}

int sqlite3_drop_modules(sqlite3 *db, const char **azKeep)
{
  return MEMORY[0x24BEDE0F8](db, azKeep);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x24BEDE148](a1);
}

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x24BEDE198](*(_QWORD *)&a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x24BEDE1B8](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1E8](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x24BEDE1F8](a1, a2);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x24BEDE200](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x24BEDE210](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x24BEDE218](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x24BEDE220](a1);
}

void sqlite3_result_subtype(sqlite3_context *a1, unsigned int a2)
{
  MEMORY[0x24BEDE230](a1, *(_QWORD *)&a2);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE238](a1, a2, *(_QWORD *)&a3, a4);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int sqlite3_threadsafe(void)
{
  return MEMORY[0x24BEDE2D8]();
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x24BEDE300](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x24BEDE308](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE310](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x24BEDE320](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE338](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE340](a1);
}

unsigned int sqlite3_value_subtype(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE350](a1);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x24BEDE368](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x24BEE4BF0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

