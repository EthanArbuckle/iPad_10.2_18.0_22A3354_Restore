id _MSLogSystem()
{
  if (_MSLogSystem_onceToken[0] != -1)
    dispatch_once(_MSLogSystem_onceToken, &__block_literal_global);
  return (id)_MSLogSystem_log;
}

uint64_t sub_24B47C264()
{
  uint64_t v0;
  id v1;

  if (qword_257990120 != -1)
    swift_once();
  v0 = qword_257994BC8;
  v1 = (id)qword_257994BC8;
  return v0;
}

uint64_t sub_24B47C2D0()
{
  return 1;
}

unint64_t sub_24B47C2D8()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257990300);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = 4804673;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = sub_24B4ADD1C();
  *(_QWORD *)(inited + 56) = 0x6874654D70747468;
  *(_QWORD *)(inited + 64) = 0xEA0000000000646FLL;
  *(_QWORD *)(inited + 72) = sub_24B4ADD1C();
  return sub_24B4A5BA4(inited);
}

id sub_24B47C370()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailAvailableAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailAvailableAPIRequest()
{
  uint64_t result;

  result = qword_257990160;
  if (!qword_257990160)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B47C3E0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24B47C414()
{
  return type metadata accessor for EmailAvailableAPIRequest();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EmailAvailableAPIResponse(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for EmailAvailableAPIResponse(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B47C518 + 4 * byte_24B4AE7B5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24B47C54C + 4 * byte_24B4AE7B0[v4]))();
}

uint64_t sub_24B47C54C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B47C554(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B47C55CLL);
  return result;
}

uint64_t sub_24B47C568(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B47C570);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24B47C574(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B47C57C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmailAvailableAPIResponse()
{
  return &type metadata for EmailAvailableAPIResponse;
}

uint64_t sub_24B47C5A0()
{
  return 0x6C69616D65;
}

uint64_t sub_24B47C5B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_24B4ADFC8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24B47C640()
{
  return 0;
}

void sub_24B47C64C(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24B47C658()
{
  sub_24B47CE40();
  return sub_24B4AE058();
}

uint64_t sub_24B47C680()
{
  sub_24B47CE40();
  return sub_24B4AE064();
}

uint64_t sub_24B47C6A8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990330);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B47CE40();
  sub_24B4AE04C();
  sub_24B4ADFB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24B47C794()
{
  sub_24B4AE01C();
  sub_24B4AE028();
  return sub_24B4AE034();
}

uint64_t sub_24B47C7D4()
{
  return sub_24B4AE028();
}

uint64_t sub_24B47C7F8()
{
  sub_24B4AE01C();
  sub_24B4AE028();
  return sub_24B4AE034();
}

uint64_t sub_24B47C834()
{
  return 0x6C62616C69617661;
}

uint64_t sub_24B47C850@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6C62616C69617661 && a2 == 0xE900000000000065)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_24B4ADFC8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24B47C8F0()
{
  sub_24B47CAB8();
  return sub_24B4AE058();
}

uint64_t sub_24B47C918()
{
  sub_24B47CAB8();
  return sub_24B4AE064();
}

uint64_t sub_24B47C940@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t result;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579902F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B47CAB8();
  sub_24B4AE040();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v9 = sub_24B4ADF98();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9 & 1;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD20F38]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_24B47CAB8()
{
  unint64_t result;

  result = qword_2579902F8;
  if (!qword_2579902F8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AE9DC, &type metadata for EmailAvailableAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579902F8);
  }
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

BOOL sub_24B47CB1C(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_24B47CB30@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_24B47CB40(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *initializeBufferWithCopyOfBuffer for EmailAvailableAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for EmailAvailableAPIRequestBody()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for EmailAvailableAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
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

_QWORD *assignWithTake for EmailAvailableAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmailAvailableAPIRequestBody(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for EmailAvailableAPIRequestBody(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for EmailAvailableAPIRequestBody()
{
  return &type metadata for EmailAvailableAPIRequestBody;
}

void type metadata accessor for ACAccountCredentialRenewResult(uint64_t a1)
{
  sub_24B47CFE0(a1, &qword_257990308);
}

uint64_t initializeBufferWithCopyOfBuffer for AccountCreationFinishView(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24B47CCE0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24B47CD00(uint64_t result, int a2, int a3)
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
  sub_24B47CFE0(a1, &qword_257990310);
}

uint64_t sub_24B47CD4C()
{
  return 0;
}

ValueMetadata *type metadata accessor for EmailAvailableAPIResponse.CodingKeys()
{
  return &type metadata for EmailAvailableAPIResponse.CodingKeys;
}

unint64_t sub_24B47CD6C()
{
  unint64_t result;

  result = qword_257990318;
  if (!qword_257990318)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AE954, &type metadata for EmailAvailableAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990318);
  }
  return result;
}

unint64_t sub_24B47CDB4()
{
  unint64_t result;

  result = qword_257990320;
  if (!qword_257990320)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AE8C4, &type metadata for EmailAvailableAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990320);
  }
  return result;
}

unint64_t sub_24B47CDFC()
{
  unint64_t result;

  result = qword_257990328;
  if (!qword_257990328)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AE8EC, &type metadata for EmailAvailableAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990328);
  }
  return result;
}

unint64_t sub_24B47CE40()
{
  unint64_t result;

  result = qword_257990338;
  if (!qword_257990338)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEAF4, &type metadata for EmailAvailableAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990338);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmailCreateAPIResponse.CodingKeys(unsigned int *a1, int a2)
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

uint64_t _s19iCloudMailAccountUI25EmailAvailableAPIResponseV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B47CF14 + 4 * byte_24B4AE7BA[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B47CF34 + 4 * byte_24B4AE7BF[v4]))();
}

_BYTE *sub_24B47CF14(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B47CF34(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B47CF3C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B47CF44(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B47CF4C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B47CF54(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for EmailAvailableAPIRequestBody.CodingKeys()
{
  return &type metadata for EmailAvailableAPIRequestBody.CodingKeys;
}

uint64_t sub_24B47CF70(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24B47CF90(uint64_t result, int a2, int a3)
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
  sub_24B47CFE0(a1, &qword_257990340);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_24B47CFE0(a1, &qword_257990348);
}

void sub_24B47CFE0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_24B47D028()
{
  unint64_t result;

  result = qword_257990350;
  if (!qword_257990350)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEACC, &type metadata for EmailAvailableAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990350);
  }
  return result;
}

unint64_t sub_24B47D070()
{
  unint64_t result;

  result = qword_257990358;
  if (!qword_257990358)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEA3C, &type metadata for EmailAvailableAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990358);
  }
  return result;
}

unint64_t sub_24B47D0B8()
{
  unint64_t result;

  result = qword_257990360;
  if (!qword_257990360)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEA64, &type metadata for EmailAvailableAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990360);
  }
  return result;
}

uint64_t sub_24B47D110@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (**v21)();
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v24 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990398);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990380);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990378);
  v23 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903A0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)v5 = sub_24B4AD884();
  *((_QWORD *)v5 + 1) = v16;
  v5[16] = 0;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903A8);
  sub_24B47D388(a1, &v5[*(int *)(v17 + 44)]);
  LOBYTE(a1) = sub_24B4AD950();
  sub_24B480840((uint64_t)v5, (uint64_t)v8, &qword_257990398);
  v18 = &v8[*(int *)(v6 + 36)];
  *v18 = a1;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  v18[40] = 1;
  sub_24B480884((uint64_t)v5, &qword_257990398);
  v19 = sub_24B4803CC();
  MEMORY[0x24BD205FC](2, MEMORY[0x24BEE4AF8], v6, v19);
  sub_24B480884((uint64_t)v8, &qword_257990380);
  v25 = v6;
  v26 = v19;
  swift_getOpaqueTypeConformance2();
  sub_24B4ADAB8();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v9);
  v20 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 16))(v24, v15, v12);
  v21 = (uint64_t (**)())(v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257990368) + 36));
  *v21 = sub_24B47F188;
  v21[1] = 0;
  v21[2] = 0;
  v21[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t sub_24B47D388@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v39 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903B0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v40 = (uint64_t)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v37 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903B8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v37 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903C0);
  v15 = *(_QWORD *)(v14 - 8);
  v37 = v14;
  v38 = v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v37 - v19;
  v41 = a1;
  sub_24B4AD938();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579903C8);
  sub_24B480FAC(&qword_2579903D0, &qword_2579903C8, MEMORY[0x24BDF4700]);
  v21 = v20;
  sub_24B4AD674();
  sub_24B47EACC((uint64_t)v13);
  if ((*(_BYTE *)(a1 + 40) & 1) != 0)
  {
    sub_24B47EF80((uint64_t)v7);
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903D8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v7, 0, 1, v23);
  }
  else
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903D8);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 1, 1, v22);
  }
  v24 = v38;
  v25 = *(void (**)(char *, char *, uint64_t))(v38 + 16);
  v26 = v21;
  v27 = v21;
  v28 = v37;
  v25(v18, v27, v37);
  sub_24B480840((uint64_t)v13, (uint64_t)v11, &qword_2579903B8);
  v29 = v40;
  sub_24B480840((uint64_t)v7, v40, &qword_2579903B0);
  v30 = (uint64_t)v13;
  v31 = (uint64_t)v7;
  v32 = (uint64_t)v11;
  v33 = v39;
  v25(v39, v18, v28);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903E0);
  sub_24B480840(v32, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_2579903B8);
  sub_24B480840(v29, (uint64_t)&v33[*(int *)(v34 + 64)], &qword_2579903B0);
  sub_24B480884(v31, &qword_2579903B0);
  sub_24B480884(v30, &qword_2579903B8);
  v35 = *(void (**)(char *, uint64_t))(v24 + 8);
  v35(v26, v28);
  sub_24B480884(v29, &qword_2579903B0);
  sub_24B480884(v32, &qword_2579903B8);
  return ((uint64_t (*)(char *, uint64_t))v35)(v18, v28);
}

void *sub_24B47D69C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _BYTE __src[512];
  _BYTE v7[512];

  v4 = sub_24B4AD884();
  sub_24B47D718(a1, (uint64_t)__src);
  memcpy(&v7[7], __src, 0x1F9uLL);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0x4030000000000000;
  *(_BYTE *)(a2 + 16) = 0;
  return memcpy((void *)(a2 + 17), v7, 0x200uLL);
}

uint64_t sub_24B47D718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t KeyPath;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t ObjCClassFromMetadata;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BYTE __dst[304];
  _QWORD v78[46];
  char v79;
  char v80;
  char v81;
  char v82;
  uint64_t v83;
  unint64_t v84;
  _BYTE v85[305];
  _BYTE v86[7];
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  _BYTE v93[7];
  _BYTE __src[312];

  v4 = sub_24B4ADC50();
  v72 = v5;
  v73 = v4;
  sub_24B47DEC0(a1, (uint64_t)__src);
  v71 = sub_24B4AD95C();
  sub_24B4AD644();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v92 = 0;
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v63 = (void *)objc_opt_self();
  v14 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADD70();
  sub_24B4ADD70();
  sub_24B4AD470();

  swift_bridgeObjectRelease();
  sub_24B480634();
  v15 = sub_24B4ADA28();
  v17 = v16;
  v19 = v18 & 1;
  sub_24B4AD980();
  v20 = sub_24B4ADA1C();
  v22 = v21;
  v24 = v23;
  swift_release();
  sub_24B4808C0(v15, v17, v19);
  swift_bridgeObjectRelease();
  sub_24B4AD998();
  v69 = sub_24B4AD9C8();
  v70 = v25;
  v75 = v26;
  v58 = v27;
  sub_24B4808C0(v20, v22, v24 & 1);
  swift_bridgeObjectRelease();
  v28 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_24B4ADD70();
  sub_24B4ADD70();
  sub_24B4AD470();

  swift_bridgeObjectRelease();
  v29 = sub_24B4ADA28();
  v67 = v30;
  v68 = v29;
  v57 = v31;
  v74 = v32;
  swift_bridgeObjectRetain();
  v33 = sub_24B4ADA28();
  v35 = v34;
  v37 = v36 & 1;
  sub_24B4AD98C();
  v38 = sub_24B4ADA1C();
  v40 = v39;
  v42 = v41;
  swift_release();
  sub_24B4808C0(v33, v35, v37);
  swift_bridgeObjectRelease();
  sub_24B4AD998();
  v43 = sub_24B4AD9C8();
  v59 = v44;
  v60 = v43;
  v46 = v45;
  v62 = v47;
  sub_24B4808C0(v38, v40, v42 & 1);
  swift_bridgeObjectRelease();
  v48 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  v83 = 2777980912;
  v84 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v49 = sub_24B4AD470();
  v51 = v50;

  swift_bridgeObjectRelease();
  v83 = v49;
  v84 = v51;
  v52 = sub_24B4ADA28();
  v64 = v54;
  v66 = v53;
  LOBYTE(v48) = v55 & 1;
  KeyPath = swift_getKeyPath();
  memcpy(__dst, __src, sizeof(__dst));
  LODWORD(v76) = *(_DWORD *)v93;
  *(_DWORD *)((char *)&v76 + 3) = *(_DWORD *)&v93[3];
  v78[0] = v73;
  v78[1] = v72;
  memcpy(&v78[2], __src, 0x130uLL);
  LOBYTE(v78[40]) = v71;
  *(_DWORD *)((char *)&v78[40] + 1) = *(_DWORD *)v93;
  HIDWORD(v78[40]) = *(_DWORD *)&v93[3];
  v78[41] = v7;
  v78[42] = v9;
  v78[43] = v11;
  v78[44] = v13;
  LOBYTE(v78[45]) = 0;
  memcpy((void *)a2, v78, 0x169uLL);
  v82 = v58 & 1;
  v81 = v57 & 1;
  v80 = v46 & 1;
  v79 = (char)v48;
  *(_QWORD *)(a2 + 368) = v69;
  *(_QWORD *)(a2 + 376) = v75;
  *(_BYTE *)(a2 + 384) = v58 & 1;
  *(_QWORD *)(a2 + 392) = v70;
  *(_QWORD *)(a2 + 400) = v68;
  *(_QWORD *)(a2 + 408) = v67;
  *(_BYTE *)(a2 + 416) = v57 & 1;
  *(_QWORD *)(a2 + 424) = v74;
  *(_QWORD *)(a2 + 432) = v60;
  *(_QWORD *)(a2 + 440) = v59;
  *(_BYTE *)(a2 + 448) = v46 & 1;
  *(_QWORD *)(a2 + 456) = v62;
  *(_QWORD *)(a2 + 464) = v52;
  *(_QWORD *)(a2 + 472) = v66;
  *(_BYTE *)(a2 + 480) = (_BYTE)v48;
  *(_QWORD *)(a2 + 488) = v64;
  *(_QWORD *)(a2 + 496) = KeyPath;
  *(_BYTE *)(a2 + 504) = 1;
  sub_24B4808D8((uint64_t)v78);
  sub_24B4809E0(v69, v75, v58 & 1);
  swift_bridgeObjectRetain();
  sub_24B4809E0(v68, v67, v57 & 1);
  swift_bridgeObjectRetain();
  sub_24B4809E0(v60, v59, v46 & 1);
  swift_bridgeObjectRetain();
  sub_24B4809E0(v52, v66, (char)v48);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24B4808C0(v52, v66, (char)v48);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24B4808C0(v60, v59, v46 & 1);
  swift_bridgeObjectRelease();
  sub_24B4808C0(v68, v67, v57 & 1);
  swift_bridgeObjectRelease();
  sub_24B4808C0(v69, v75, v58 & 1);
  swift_bridgeObjectRelease();
  v83 = v73;
  v84 = v72;
  memcpy(v85, __dst, 0x130uLL);
  v85[304] = v71;
  *(_DWORD *)v86 = v76;
  *(_DWORD *)&v86[3] = *(_DWORD *)((char *)&v76 + 3);
  v87 = v7;
  v88 = v9;
  v89 = v11;
  v90 = v13;
  v91 = 0;
  return sub_24B4809F0((uint64_t)&v83);
}

uint64_t sub_24B47DEC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t KeyPath;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t ObjCClassFromMetadata;
  id v25;
  char *v26;
  uint64_t v27;
  char v28;
  char v29;
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
  unsigned __int8 v40;
  char v41;
  char v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
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
  uint64_t v78;
  _OWORD *v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  void (*v85)(char *, uint64_t);
  int v86;
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
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  id v103;
  _OWORD *v104;
  _BYTE v105[7];
  char v106;
  _BYTE v107[7];
  char v108;
  int v109;
  __int16 v110;
  unsigned __int8 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD v118[3];
  __int128 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  _OWORD v123[12];
  char v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  __int128 v136;
  uint64_t v137;
  __int128 v138;
  uint64_t v139;
  uint64_t (*v140)();
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unsigned __int8 v145;
  uint64_t v146;
  unsigned __int8 v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  char v151;
  char *v152;
  char v153;
  uint64_t v154;
  uint64_t v155;

  v93 = a2;
  v3 = sub_24B4ADB84();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v85 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = (_OWORD *)a1;
  v8 = *(void **)(a1 + 32);
  v9 = (unsigned int *)MEMORY[0x24BDF3FD0];
  v97 = v7;
  v98 = v5;
  v96 = v4;
  if (v8)
  {
    v103 = v8;
    sub_24B4ADB6C();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v9, v3);
    v10 = sub_24B4ADB90();
    swift_release();
    v85 = *(void (**)(char *, uint64_t))(v4 + 8);
    v85(v7, v3);
    sub_24B4ADC50();
    sub_24B4AD6BC();
    v102 = v144;
    v11 = v145;
    v12 = v146;
    v13 = v147;
    v15 = v148;
    v14 = v149;
    sub_24B4ADB54();
    v16 = sub_24B4ADB48();
    swift_release();
    v125 = v10;
    v126 = v102;
    v127 = v11;
    v128 = v12;
    v129 = v13;
    v130 = v15;
    v131 = v14;
    v132 = v16;
    v133 = xmmword_24B4AEB60;
    v134 = 0x4010000000000000;
    v135 = 0uLL;
    *(_QWORD *)&v136 = 0;
    BYTE8(v136) = 0;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904C0);
    sub_24B480B0C(&qword_2579904C8, &qword_2579904B8, (uint64_t (*)(void))sub_24B480B78);
    sub_24B480B0C(&qword_2579904E0, &qword_2579904C0, (uint64_t (*)(void))sub_24B480BDC);
    sub_24B4AD8A8();
    swift_release();
    swift_release();

    v17 = v85;
  }
  else
  {
    sub_24B4ADB78();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *v9, v3);
    v103 = (id)sub_24B4ADB90();
    swift_release();
    v17 = *(void (**)(char *, uint64_t))(v4 + 8);
    v17(v7, v3);
    sub_24B4ADC50();
    sub_24B4AD6BC();
    *((_QWORD *)&v101 + 1) = v145;
    v102 = v144;
    v100 = v147;
    *(_QWORD *)&v101 = v146;
    v18 = v148;
    v19 = v149;
    v20 = sub_24B4ADB60();
    KeyPath = swift_getKeyPath();
    v22 = sub_24B4AD950();
    sub_24B4ADB54();
    v23 = sub_24B4ADB48();
    swift_release();
    v125 = (uint64_t)v103;
    v126 = v102;
    v127 = *((_QWORD *)&v101 + 1);
    v128 = v101;
    v129 = v100;
    v130 = v18;
    v131 = v19;
    v132 = KeyPath;
    *(_QWORD *)&v133 = v20;
    *((_QWORD *)&v133 + 1) = v22 | 0x10000;
    v134 = v23;
    v135 = xmmword_24B4AEB60;
    *(_QWORD *)&v136 = 0x4010000000000000;
    BYTE8(v136) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904C0);
    sub_24B480B0C(&qword_2579904C8, &qword_2579904B8, (uint64_t (*)(void))sub_24B480B78);
    sub_24B480B0C(&qword_2579904E0, &qword_2579904C0, (uint64_t (*)(void))sub_24B480BDC);
    sub_24B4AD8A8();
  }
  v94 = *(_QWORD *)&v123[1];
  v95 = *((_QWORD *)&v123[0] + 1);
  v102 = *((_QWORD *)&v123[1] + 1);
  v103 = *(id *)&v123[0];
  v101 = v123[2];
  v99 = *((_QWORD *)&v123[3] + 1);
  v100 = *(_QWORD *)&v123[3];
  v91 = *((_QWORD *)&v123[4] + 1);
  v92 = *(_QWORD *)&v123[4];
  v89 = *((_QWORD *)&v123[5] + 1);
  v90 = *(_QWORD *)&v123[5];
  v87 = *((_QWORD *)&v123[6] + 1);
  v88 = *(_QWORD *)&v123[6];
  v86 = LOBYTE(v123[7]);
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v25 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADB9C();
  v26 = v97;
  v27 = v98;
  (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v97, *MEMORY[0x24BDF3FD0], v98);
  v96 = sub_24B4ADB90();
  swift_release();
  v17(v26, v27);
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v28 = v151;
  v97 = v152;
  v98 = v150;
  v29 = v153;
  v31 = v154;
  v30 = v155;
  v32 = (uint64_t)v104;
  v123[0] = v104[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  sub_24B4ADBB4();
  v33 = v125;
  sub_24B4ADC8C();
  v35 = v34;
  v37 = v36;
  sub_24B4ADB54();
  v38 = sub_24B4ADB48();
  swift_release();
  v111 = 1;
  v108 = v28;
  v106 = v29;
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 112) = *(_QWORD *)(v32 + 96);
  HIWORD(v127) = v110;
  *(_DWORD *)((char *)&v127 + 2) = v109;
  *(_DWORD *)((char *)&v129 + 1) = *(_DWORD *)v107;
  HIDWORD(v129) = *(_DWORD *)&v107[3];
  *(_DWORD *)((char *)&v131 + 1) = *(_DWORD *)v105;
  HIDWORD(v131) = *(_DWORD *)&v105[3];
  WORD3(v113) = v110;
  v40 = v111;
  *(_DWORD *)((char *)&v113 + 2) = v109;
  DWORD1(v114) = *(_DWORD *)&v107[3];
  v41 = v108;
  *(_DWORD *)((char *)&v114 + 1) = *(_DWORD *)v107;
  DWORD1(v115) = *(_DWORD *)&v105[3];
  v42 = v106;
  *((_QWORD *)&v112 + 1) = 0;
  LOWORD(v113) = v111;
  v43 = v97;
  v44 = v98;
  *((_QWORD *)&v113 + 1) = v98;
  LOBYTE(v114) = v108;
  *((_QWORD *)&v114 + 1) = v97;
  LOBYTE(v115) = v106;
  *(_DWORD *)((char *)&v115 + 1) = *(_DWORD *)v105;
  v45 = v31;
  *((_QWORD *)&v115 + 1) = v31;
  *(_QWORD *)&v116 = v30;
  v46 = v30;
  *((_QWORD *)&v116 + 1) = v33;
  *(_QWORD *)&v117 = v33;
  *((_QWORD *)&v117 + 1) = v35;
  *(_QWORD *)&v118[0] = v37;
  *(_OWORD *)((char *)v118 + 8) = xmmword_24B4AEB70;
  *((_QWORD *)&v118[1] + 1) = v38;
  v47 = v38;
  v118[2] = xmmword_24B4AEB60;
  *(_QWORD *)&v119 = 0x4010000000000000;
  *((_QWORD *)&v119 + 1) = sub_24B480D6C;
  v121 = 0;
  v122 = 0;
  v120 = v39;
  v48 = v86;
  v124 = v86;
  v49 = v118[1];
  *(_QWORD *)((char *)&v123[11] + 7) = 0;
  *(_OWORD *)((char *)&v123[10] + 7) = (unint64_t)v39;
  *(_OWORD *)((char *)&v123[9] + 7) = v119;
  *(_OWORD *)((char *)&v123[8] + 7) = xmmword_24B4AEB60;
  v50 = v93;
  *(_BYTE *)(v93 + 112) = v86;
  v51 = v123[9];
  v52 = v123[10];
  *(_OWORD *)(v50 + 288) = *(_OWORD *)((char *)&v123[10] + 15);
  *(_OWORD *)(v50 + 257) = v51;
  *(_OWORD *)(v50 + 273) = v52;
  v53 = v96;
  *(_QWORD *)&v112 = v96;
  *(_OWORD *)((char *)&v123[7] + 7) = v49;
  v54 = v123[8];
  *(_OWORD *)((char *)&v123[6] + 7) = v118[0];
  *(_OWORD *)((char *)&v123[5] + 7) = v117;
  *(_OWORD *)((char *)&v123[4] + 7) = v116;
  *(_OWORD *)((char *)&v123[3] + 7) = v115;
  *(_OWORD *)((char *)&v123[2] + 7) = v114;
  *(_OWORD *)((char *)&v123[1] + 7) = v113;
  *(_OWORD *)((char *)v123 + 7) = v112;
  v55 = v123[0];
  v56 = v123[1];
  v57 = v123[2];
  v58 = v123[4];
  v59 = v123[5];
  v60 = v123[6];
  v61 = v123[7];
  *(_OWORD *)(v50 + 161) = v123[3];
  *(_OWORD *)(v50 + 145) = v57;
  *(_OWORD *)(v50 + 129) = v56;
  *(_OWORD *)(v50 + 113) = v55;
  *(_OWORD *)(v50 + 225) = v61;
  v63 = v102;
  v62 = (uint64_t)v103;
  v65 = v94;
  v64 = v95;
  *(_QWORD *)v50 = v103;
  *(_QWORD *)(v50 + 8) = v64;
  *(_QWORD *)(v50 + 16) = v65;
  *(_QWORD *)(v50 + 24) = v63;
  v66 = v63;
  v67 = v101;
  *(_QWORD *)(v50 + 32) = v101;
  v68 = v67;
  *(_QWORD *)&v101 = v67;
  v69 = *((_QWORD *)&v101 + 1);
  *(_QWORD *)(v50 + 40) = *((_QWORD *)&v101 + 1);
  v70 = v69;
  *((_QWORD *)&v101 + 1) = v69;
  v71 = v100;
  *(_QWORD *)(v50 + 48) = v100;
  v100 = v71;
  v72 = v99;
  v73 = v91;
  v74 = v92;
  *(_QWORD *)(v50 + 56) = v99;
  *(_QWORD *)(v50 + 64) = v74;
  v76 = v89;
  v75 = v90;
  *(_QWORD *)(v50 + 72) = v73;
  *(_QWORD *)(v50 + 80) = v75;
  v77 = v87;
  v78 = v88;
  *(_QWORD *)(v50 + 88) = v76;
  *(_QWORD *)(v50 + 96) = v78;
  *(_QWORD *)(v50 + 104) = v77;
  *(_OWORD *)(v50 + 209) = v60;
  *(_OWORD *)(v50 + 193) = v59;
  *(_OWORD *)(v50 + 177) = v58;
  *(_OWORD *)(v50 + 241) = v54;
  LOBYTE(v127) = v40;
  v128 = v44;
  LOBYTE(v129) = v41;
  v130 = v43;
  LOBYTE(v131) = v42;
  v132 = v45;
  *(_QWORD *)&v133 = v46;
  v137 = v47;
  v139 = 0x4010000000000000;
  v140 = sub_24B480D6C;
  v79 = v104;
  v80 = v104[5];
  *(_OWORD *)(v39 + 80) = v104[4];
  *(_OWORD *)(v39 + 96) = v80;
  v81 = v79[1];
  *(_OWORD *)(v39 + 16) = *v79;
  *(_OWORD *)(v39 + 32) = v81;
  v82 = v79[3];
  *(_OWORD *)(v39 + 48) = v79[2];
  *(_OWORD *)(v39 + 64) = v82;
  v141 = v39;
  v142 = 0;
  v125 = v53;
  v126 = 0;
  *((_QWORD *)&v133 + 1) = v33;
  v134 = v33;
  *(_QWORD *)&v135 = v35;
  *((_QWORD *)&v135 + 1) = v37;
  v136 = xmmword_24B4AEB70;
  v138 = xmmword_24B4AEB60;
  v143 = 0;
  BYTE1(v127) = 0;
  v83 = v48;
  sub_24B480980(v62, v64, v65, v66, v68, v70, v71, v72, v74, v73, v75, v76, v78, v77, v48);
  sub_24B480D74((uint64_t)&v112);
  sub_24B4804A0((uint64_t)v104);
  sub_24B480DD8((uint64_t)&v125);
  return sub_24B480A98((uint64_t)v103, v64, v65, v102, v101, *((uint64_t *)&v101 + 1), v100, v99, v74, v73, v75, v76, v78, v77, v83);
}

uint64_t sub_24B47E7A0(uint64_t a1)
{
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
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v2 = sub_24B4ADC98();
  v25 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4ADCBC();
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24B4ADCD4();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v22 - v13;
  sub_24B480E3C();
  v15 = (void *)sub_24B4ADE48();
  sub_24B4ADCC8();
  MEMORY[0x24BD207DC](v12, 0.16);
  v22 = *(void (**)(char *, uint64_t))(v9 + 8);
  v22(v12, v8);
  v16 = swift_allocObject();
  v17 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v16 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v16 + 96) = v17;
  *(_QWORD *)(v16 + 112) = *(_QWORD *)(a1 + 96);
  v18 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v16 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v16 + 32) = v18;
  v19 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v16 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v16 + 64) = v19;
  aBlock[4] = sub_24B480EC8;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor;
  v20 = _Block_copy(aBlock);
  sub_24B4804A0(a1);
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B480EE8((unint64_t *)&qword_257991E90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B480FAC((unint64_t *)&qword_257991EA0, &qword_257990558, MEMORY[0x24BEE12C8]);
  sub_24B4ADEC0();
  MEMORY[0x24BD20914](v14, v7, v4, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v2);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
  return ((uint64_t (*)(char *, uint64_t))v22)(v14, v8);
}

uint64_t sub_24B47EA54()
{
  sub_24B4ADC68();
  sub_24B4AD710();
  return swift_release();
}

uint64_t sub_24B47EACC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  char v53;

  v50 = a1;
  v2 = sub_24B4AD680();
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v47 = (char *)&v37 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46 = sub_24B4AD920();
  v44 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v37 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990448);
  v38 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990450);
  MEMORY[0x24BDAC7A8](v41);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990458);
  v43 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990460);
  MEMORY[0x24BDAC7A8](v39);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903B8);
  MEMORY[0x24BDAC7A8](v42);
  v14 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_allocObject();
  v16 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v15 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v15 + 96) = v16;
  *(_QWORD *)(v15 + 112) = *(_QWORD *)(v1 + 96);
  v17 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v15 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v15 + 32) = v17;
  v18 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v15 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v15 + 64) = v18;
  v51 = v1;
  sub_24B4804A0(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990468);
  sub_24B4806CC();
  sub_24B4ADBCC();
  v52 = *(_OWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  v19 = 1;
  if ((v53 & 1) == 0)
  {
    v52 = *(_OWORD *)(v1 + 64);
    sub_24B4ADBB4();
    v19 = v53;
  }
  KeyPath = swift_getKeyPath();
  v21 = swift_allocObject();
  *(_BYTE *)(v21 + 16) = v19;
  v22 = v38;
  v23 = v40;
  (*(void (**)(char *, char *, uint64_t))(v38 + 16))(v8, v6, v40);
  v24 = (uint64_t *)&v8[*(int *)(v41 + 36)];
  *v24 = KeyPath;
  v24[1] = (uint64_t)sub_24B480FEC;
  v24[2] = v21;
  (*(void (**)(char *, uint64_t))(v22 + 8))(v6, v23);
  v25 = v37;
  sub_24B4AD914();
  sub_24B480760();
  sub_24B480EE8((unint64_t *)&qword_2579904A8, (uint64_t (*)(uint64_t))MEMORY[0x24BDF0DA8], MEMORY[0x24BDF0D88]);
  v26 = v46;
  sub_24B4ADA58();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v26);
  sub_24B480884((uint64_t)v8, &qword_257990450);
  v28 = v47;
  v27 = v48;
  v29 = v49;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x24BDEB488], v49);
  v30 = swift_getKeyPath();
  v31 = (uint64_t *)&v12[*(int *)(v39 + 36)];
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990428);
  (*(void (**)(char *, char *, uint64_t))(v27 + 16))((char *)v31 + *(int *)(v32 + 28), v28, v29);
  *v31 = v30;
  v33 = v43;
  v34 = v45;
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))(v12, v10, v45);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v34);
  LOBYTE(v34) = sub_24B4AD944();
  sub_24B480840((uint64_t)v12, (uint64_t)v14, &qword_257990460);
  v35 = &v14[*(int *)(v42 + 36)];
  *v35 = v34;
  *(_OWORD *)(v35 + 8) = 0u;
  *(_OWORD *)(v35 + 24) = 0u;
  v35[40] = 1;
  sub_24B480884((uint64_t)v12, &qword_257990460);
  return sub_24B4807FC((uint64_t)v14, v50, &qword_2579903B8);
}

uint64_t sub_24B47EF80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  uint64_t KeyPath;
  uint64_t v16;
  uint64_t *v17;
  _BYTE v19[16];
  uint64_t v20;
  __int128 v21;
  char v22;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v19[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579903D8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v19[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = swift_allocObject();
  v11 = *(_OWORD *)(v1 + 80);
  *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
  *(_OWORD *)(v10 + 96) = v11;
  *(_QWORD *)(v10 + 112) = *(_QWORD *)(v1 + 96);
  v12 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v10 + 32) = v12;
  v13 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(v10 + 64) = v13;
  v20 = v1;
  sub_24B4804A0(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579903F0);
  sub_24B48050C();
  sub_24B4ADBCC();
  v21 = *(_OWORD *)(v1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  if ((v22 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v21 = *(_OWORD *)(v1 + 64);
    sub_24B4ADBB4();
    v14 = v22;
  }
  KeyPath = swift_getKeyPath();
  v16 = swift_allocObject();
  *(_BYTE *)(v16 + 16) = v14;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v4 + 16))(v9, v6, v3);
  v17 = (uint64_t *)&v9[*(int *)(v7 + 36)];
  *v17 = KeyPath;
  v17[1] = (uint64_t)sub_24B48062C;
  v17[2] = v16;
  (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
  return sub_24B4807FC((uint64_t)v9, a1, &qword_2579903D8);
}

uint64_t sub_24B47F188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_24B4AD560();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257990130 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_24B4AD548();
  v6 = sub_24B4ADDE8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24B47A000, v5, v6, "[AccountCreation - All Set] page viewed", v7, 2u);
    MEMORY[0x24BD20FF8](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24B47F2B4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _BYTE v14[16];
  __int128 v15;

  v2 = v1;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if ((a1 & 1) != 0)
    v8 = *(_OWORD *)(v1 + 64);
  else
    v8 = *(_OWORD *)(v1 + 48);
  v15 = v8;
  v14[15] = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBC0();
  if (qword_257990130 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, v9, v4);
  v10 = sub_24B4AD548();
  v11 = sub_24B4ADDE8();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_24B47A000, v10, v11, "[AccountCreation - All Set] tapped on Done", v12, 2u);
    MEMORY[0x24BD20FF8](v12, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return (*(uint64_t (**)(_QWORD))(v2 + 16))(a1 & 1);
}

uint64_t sub_24B47F43C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[7];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990480);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_24B4AD86C();
  *((_QWORD *)v6 + 1) = 0x4028000000000000;
  v6[16] = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579904B0);
  sub_24B47F570(a1, (uint64_t)&v6[*(int *)(v7 + 44)]);
  sub_24B4ADC50();
  sub_24B4AD764();
  sub_24B480840((uint64_t)v6, a2, &qword_257990480);
  v8 = (_OWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257990468) + 36));
  v9 = v13[5];
  v8[4] = v13[4];
  v8[5] = v9;
  v8[6] = v13[6];
  v10 = v13[1];
  *v8 = v13[0];
  v8[1] = v10;
  v11 = v13[3];
  v8[2] = v13[2];
  v8[3] = v11;
  return sub_24B480884((uint64_t)v6, &qword_257990480);
}

uint64_t sub_24B47F570@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t *v19;
  uint64_t v20;
  uint64_t ObjCClassFromMetadata;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  _QWORD v39[4];
  uint64_t *v40;
  __int128 v41;
  char v42;

  v39[2] = a2;
  v39[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_257990438);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v40 = (_QWORD *)((char *)v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_24B4AD680();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990418);
  v9 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990408);
  v13 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v39 - v16;
  v41 = *(_OWORD *)(a1 + 48);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  if (v42 == 1)
  {
    sub_24B4AD6B0();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDEB498], v4);
    KeyPath = swift_getKeyPath();
    v39[1] = v12;
    v19 = (uint64_t *)&v15[*(int *)(v12 + 36)];
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990428);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v19 + *(int *)(v20 + 28), v7, v4);
    *v19 = KeyPath;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_24B4807FC((uint64_t)v15, (uint64_t)v17, &qword_257990408);
    sub_24B480840((uint64_t)v17, (uint64_t)v40, &qword_257990408);
    swift_storeEnumTagMultiPayload();
    sub_24B480578();
    sub_24B4AD8A8();
    return sub_24B480884((uint64_t)v17, &qword_257990408);
  }
  else
  {
    _s18CurrentBundleClassCMa();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v23 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    *(_QWORD *)&v41 = 2777980912;
    *((_QWORD *)&v41 + 1) = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v24 = sub_24B4AD470();
    v26 = v25;

    swift_bridgeObjectRelease();
    *(_QWORD *)&v41 = v24;
    *((_QWORD *)&v41 + 1) = v26;
    sub_24B480634();
    v27 = sub_24B4ADA28();
    v29 = v28;
    LOBYTE(v26) = v30 & 1;
    sub_24B4AD9A4();
    v31 = sub_24B4AD9C8();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    sub_24B4808C0(v27, v29, v26);
    swift_bridgeObjectRelease();
    v38 = v40;
    *v40 = v31;
    v38[1] = v33;
    *((_BYTE *)v38 + 16) = v35 & 1;
    v38[3] = v37;
    swift_storeEnumTagMultiPayload();
    sub_24B480578();
    return sub_24B4AD8A8();
  }
}

uint64_t sub_24B47F968@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t KeyPath;
  uint64_t *v19;
  uint64_t v20;
  uint64_t ObjCClassFromMetadata;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t *v34;
  __int128 v35;
  char v36;

  v32[1] = a2;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990438);
  MEMORY[0x24BDAC7A8](v33);
  v34 = (_QWORD *)((char *)v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_24B4AD680();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990418);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990408);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v32 - v16;
  v35 = *(_OWORD *)(a1 + 64);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  if (v36 == 1)
  {
    sub_24B4AD6B0();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDEB498], v4);
    KeyPath = swift_getKeyPath();
    v32[0] = v12;
    v19 = (uint64_t *)&v15[*(int *)(v12 + 36)];
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990428);
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))((char *)v19 + *(int *)(v20 + 28), v7, v4);
    *v19 = KeyPath;
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v15, v11, v8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_24B4807FC((uint64_t)v15, (uint64_t)v17, &qword_257990408);
    sub_24B480840((uint64_t)v17, (uint64_t)v34, &qword_257990408);
    swift_storeEnumTagMultiPayload();
    sub_24B480578();
    sub_24B4AD8A8();
    return sub_24B480884((uint64_t)v17, &qword_257990408);
  }
  else
  {
    _s18CurrentBundleClassCMa();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v23 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    *(_QWORD *)&v35 = 2777980912;
    *((_QWORD *)&v35 + 1) = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v24 = sub_24B4AD470();
    v26 = v25;

    swift_bridgeObjectRelease();
    *(_QWORD *)&v35 = v24;
    *((_QWORD *)&v35 + 1) = v26;
    sub_24B480634();
    v27 = sub_24B4ADA28();
    v28 = v34;
    *v34 = v27;
    v28[1] = v29;
    *((_BYTE *)v28 + 16) = v30 & 1;
    v28[3] = v31;
    swift_storeEnumTagMultiPayload();
    sub_24B480578();
    return sub_24B4AD8A8();
  }
}

uint64_t sub_24B47FD34()
{
  return sub_24B4ADA7C();
}

uint64_t sub_24B47FD4C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990368);
  sub_24B4802C4();
  return sub_24B4AD734();
}

uint64_t sub_24B47FDC8()
{
  return sub_24B4AD770();
}

uint64_t sub_24B47FDE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_24B4AD680();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return MEMORY[0x24BD20278](v4);
}

double sub_24B47FE64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  double result;
  double v15;
  uint64_t v16;

  sub_24B4ADBA8();
  sub_24B4ADBA8();
  sub_24B4ADBA8();
  result = v15;
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = a3;
  *(_QWORD *)(a7 + 24) = a4;
  *(_QWORD *)(a7 + 32) = a5;
  *(_BYTE *)(a7 + 40) = a6;
  *(_BYTE *)(a7 + 48) = LOBYTE(v15);
  *(_QWORD *)(a7 + 56) = v16;
  *(_BYTE *)(a7 + 64) = LOBYTE(v15);
  *(_QWORD *)(a7 + 72) = v16;
  *(double *)(a7 + 80) = v15;
  *(_QWORD *)(a7 + 88) = v16;
  *(_QWORD *)(a7 + 96) = 0x4030000000000000;
  return result;
}

uint64_t destroy for AccountCreationFinishView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v6;
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain();
  swift_release();
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = v6;

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
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
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for AccountCreationFinishView(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  v4 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_release();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountCreationFinishView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 104))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountCreationFinishView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 104) = 1;
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
    *(_BYTE *)(result + 104) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountCreationFinishView()
{
  return &type metadata for AccountCreationFinishView;
}

uint64_t sub_24B4802AC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24B4802BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B47D110(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B4802C4()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_257990370;
  if (!qword_257990370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990368);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990378);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990380);
    sub_24B4803CC();
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257990370);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD20F44](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24B4803CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257990388;
  if (!qword_257990388)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990380);
    v2[0] = sub_24B480FAC(&qword_257990390, &qword_257990398, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257990388);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void *sub_24B480468@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B47D69C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24B480474()
{
  return sub_24B47F2B4(1);
}

uint64_t sub_24B480498@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B47F968(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24B4804A0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v3 = v2;
  swift_retain();
  swift_retain();
  return a1;
}

unint64_t sub_24B48050C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579903F8;
  if (!qword_2579903F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579903F0);
    v2[0] = sub_24B480578();
    v2[1] = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579903F8);
  }
  return result;
}

unint64_t sub_24B480578()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257990400;
  if (!qword_257990400)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990408);
    v2[0] = sub_24B480FAC(&qword_257990410, &qword_257990418, MEMORY[0x24BDEBC00]);
    v2[1] = sub_24B480FAC(&qword_257990420, &qword_257990428, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257990400);
  }
  return result;
}

uint64_t sub_24B48061C()
{
  return swift_deallocObject();
}

_BYTE *sub_24B48062C(_BYTE *a1)
{
  uint64_t v1;

  return sub_24B49FD74(a1, *(_BYTE *)(v1 + 16));
}

unint64_t sub_24B480634()
{
  unint64_t result;

  result = qword_257990440;
  if (!qword_257990440)
  {
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257990440);
  }
  return result;
}

uint64_t sub_24B480678()
{
  return sub_24B4AD770();
}

uint64_t sub_24B4806A0()
{
  return sub_24B47F2B4(0);
}

uint64_t sub_24B4806C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B47F43C(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B4806CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257990470;
  if (!qword_257990470)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990468);
    v2[0] = sub_24B480FAC(&qword_257990478, &qword_257990480, MEMORY[0x24BDF4498]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257990470);
  }
  return result;
}

uint64_t sub_24B480750()
{
  return swift_deallocObject();
}

unint64_t sub_24B480760()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257990488;
  if (!qword_257990488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990450);
    v2[0] = sub_24B480FAC(&qword_257990490, &qword_257990448, MEMORY[0x24BDF43B0]);
    v2[1] = sub_24B480FAC(&qword_257990498, &qword_2579904A0, MEMORY[0x24BDF1248]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257990488);
  }
  return result;
}

uint64_t sub_24B4807FC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_24B480840(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24B480884(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24B4808C0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_24B4808D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 288);
  v3 = *(_QWORD *)(a1 + 304);
  sub_24B480980(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128));
  swift_retain();
  swift_retain();
  sub_24B4809D0(v2);
  sub_24B4809D0(v3);
  return a1;
}

uint64_t sub_24B480980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if ((a15 & 1) != 0)
  {
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return swift_retain();
}

uint64_t sub_24B4809D0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24B4809E0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_24B4809F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 288);
  v3 = *(_QWORD *)(a1 + 304);
  sub_24B480A98(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_BYTE *)(a1 + 128));
  swift_release();
  swift_release();
  sub_24B480AF4(v2);
  sub_24B480AF4(v3);
  return a1;
}

uint64_t sub_24B480A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  uint64_t result;

  swift_release();
  result = swift_release();
  if ((a15 & 1) != 0)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_24B480AF4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_24B480B0C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x24BDEC468];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24B480B78()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579904D0;
  if (!qword_2579904D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579904D8);
    v2[0] = MEMORY[0x24BDF40E8];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579904D0);
  }
  return result;
}

unint64_t sub_24B480BDC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579904E8;
  if (!qword_2579904E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579904F0);
    v2[0] = sub_24B480C60();
    v2[1] = sub_24B480FAC(&qword_257990538, &qword_257990540, MEMORY[0x24BDEB950]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579904E8);
  }
  return result;
}

unint64_t sub_24B480C60()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579904F8;
  if (!qword_2579904F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990500);
    v2[0] = sub_24B480CE4();
    v2[1] = sub_24B480FAC(&qword_257990528, &qword_257990530, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579904F8);
  }
  return result;
}

unint64_t sub_24B480CE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257990508;
  if (!qword_257990508)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990510);
    v2[0] = sub_24B480B78();
    v2[1] = sub_24B480FAC(&qword_257990518, &qword_257990520, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257990508);
  }
  return result;
}

uint64_t sub_24B480D6C()
{
  uint64_t v0;

  return sub_24B47E7A0(v0 + 16);
}

uint64_t sub_24B480D74(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 152);
  v3 = *(_QWORD *)(a1 + 168);
  swift_retain();
  swift_retain();
  sub_24B4809D0(v2);
  sub_24B4809D0(v3);
  return a1;
}

uint64_t sub_24B480DD8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 152);
  v3 = *(_QWORD *)(a1 + 168);
  swift_release();
  swift_release();
  sub_24B480AF4(v2);
  sub_24B480AF4(v3);
  return a1;
}

unint64_t sub_24B480E3C()
{
  unint64_t result;

  result = qword_257990550;
  if (!qword_257990550)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257990550);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B480EC8()
{
  return sub_24B47EA54();
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

uint64_t sub_24B480EE8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD20F50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B480F28()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  return sub_24B4ADBC0();
}

uint64_t sub_24B480F80()
{
  return sub_24B480FAC(&qword_257990560, &qword_257990568, MEMORY[0x24BDED358]);
}

uint64_t sub_24B480FAC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD20F50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t destroy for MSSubmitButton()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for MSSubmitButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MSSubmitButton(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MSSubmitButton(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MSSubmitButton()
{
  return &type metadata for MSSubmitButton;
}

uint64_t sub_24B48124C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24B48125C@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v2 = v1;
  v35 = a1;
  v3 = sub_24B4AD680();
  v33 = *(_QWORD *)(v3 - 8);
  v34 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v32 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4AD920();
  v29 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990570);
  v28 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990578);
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990580);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990588);
  sub_24B481B6C();
  sub_24B4ADBCC();
  sub_24B4AD914();
  sub_24B480FAC(&qword_2579905B8, &qword_257990570, MEMORY[0x24BDF43B0]);
  sub_24B481C8C();
  sub_24B4ADA58();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v8);
  v18 = v32;
  v17 = v33;
  v19 = v34;
  (*(void (**)(char *, _QWORD, uint64_t))(v33 + 104))(v32, *MEMORY[0x24BDEB488], v34);
  KeyPath = swift_getKeyPath();
  v21 = (uint64_t *)&v16[*(int *)(v14 + 36)];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990428);
  (*(void (**)(char *, char *, uint64_t))(v17 + 16))((char *)v21 + *(int *)(v22 + 28), v18, v19);
  *v21 = KeyPath;
  v24 = v30;
  v23 = v31;
  (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v16, v13, v31);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v18, v19);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v23);
  LOBYTE(v23) = sub_24B4AD944();
  v25 = v35;
  sub_24B480840((uint64_t)v16, v35, &qword_257990580);
  v26 = v25 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579905C0) + 36);
  *(_BYTE *)v26 = v23;
  *(_OWORD *)(v26 + 8) = 0u;
  *(_OWORD *)(v26 + 24) = 0u;
  *(_BYTE *)(v26 + 40) = 1;
  return sub_24B480884((uint64_t)v16, &qword_257990580);
}

uint64_t sub_24B481584@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;

  v54 = a2;
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905C8);
  v50 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v49 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905D0);
  MEMORY[0x24BDAC7A8](v51);
  v53 = (uint64_t)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4AD680();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990418);
  v46 = *(_QWORD *)(v9 - 8);
  v47 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990408);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905A0);
  v15 = MEMORY[0x24BDAC7A8](v52);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v48 = (uint64_t)&v46 - v18;
  v74 = *a1;
  LOBYTE(v75) = *((_BYTE *)a1 + 16);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905D8);
  MEMORY[0x24BD206EC](&v65, v19);
  if (v65 == 1)
  {
    sub_24B4AD6B0();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BDEB498], v5);
    KeyPath = swift_getKeyPath();
    v21 = (uint64_t *)&v14[*(int *)(v12 + 36)];
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990428);
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v21 + *(int *)(v22 + 28), v8, v5);
    *v21 = KeyPath;
    v24 = v46;
    v23 = v47;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v14, v11, v47);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v23);
    v25 = sub_24B4ADC50();
    sub_24B496B00(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v17, 0.0, 1, 0.0, 1, v25, v26);
    sub_24B480884((uint64_t)v14, &qword_257990408);
    v27 = v48;
    sub_24B481D18((uint64_t)v17, v48);
    sub_24B480840(v27, v53, &qword_2579905A0);
    swift_storeEnumTagMultiPayload();
    sub_24B481D94(&qword_257990598, &qword_2579905A0, (uint64_t (*)(void))sub_24B480578, MEMORY[0x24BDEDBB8]);
    v28 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579905A8);
    v29 = sub_24B481C28();
    *(_QWORD *)&v74 = v28;
    *((_QWORD *)&v74 + 1) = v29;
    swift_getOpaqueTypeConformance2();
    sub_24B4AD8A8();
    return sub_24B480884(v27, &qword_2579905A0);
  }
  else
  {
    v31 = *((_QWORD *)a1 + 6);
    *(_QWORD *)&v74 = *((_QWORD *)a1 + 5);
    *((_QWORD *)&v74 + 1) = v31;
    sub_24B480634();
    swift_bridgeObjectRetain();
    v32 = sub_24B4ADA28();
    v34 = v33;
    v36 = v35;
    v38 = v37 & 1;
    v39 = sub_24B4ADC50();
    sub_24B496B58(0.0, 0, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v65, 0.0, 1, 0.0, 1, v39, v40, v32, v34, v38, v36);
    sub_24B4808C0(v32, v34, v38);
    swift_bridgeObjectRelease();
    v80 = v71;
    v81 = v72;
    v82 = v73;
    v76 = v67;
    v77 = v68;
    v78 = v69;
    v79 = v70;
    v74 = v65;
    v75 = v66;
    v62 = v71;
    v63 = v72;
    v64 = v73;
    v58 = v67;
    v59 = v68;
    v60 = v69;
    v61 = v70;
    v56 = v65;
    v57 = v66;
    sub_24B4AD9A4();
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905A8);
    v42 = sub_24B481C28();
    v43 = v49;
    sub_24B4ADA4C();
    sub_24B481CDC((uint64_t)&v74);
    v44 = v50;
    v45 = v55;
    (*(void (**)(uint64_t, char *, uint64_t))(v50 + 16))(v53, v43, v55);
    swift_storeEnumTagMultiPayload();
    sub_24B481D94(&qword_257990598, &qword_2579905A0, (uint64_t (*)(void))sub_24B480578, MEMORY[0x24BDEDBB8]);
    *(_QWORD *)&v65 = v41;
    *((_QWORD *)&v65 + 1) = v42;
    swift_getOpaqueTypeConformance2();
    sub_24B4AD8A8();
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v43, v45);
  }
}

uint64_t sub_24B481B24@<X0>(uint64_t a1@<X8>)
{
  return sub_24B48125C(a1);
}

uint64_t sub_24B481B64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B481584(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_24B481B6C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_257990590;
  if (!qword_257990590)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990588);
    v2 = sub_24B481D94(&qword_257990598, &qword_2579905A0, (uint64_t (*)(void))sub_24B480578, MEMORY[0x24BDEDBB8]);
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579905A8);
    v3[3] = sub_24B481C28();
    v3[0] = v2;
    v3[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257990590);
  }
  return result;
}

unint64_t sub_24B481C28()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579905B0;
  if (!qword_2579905B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579905A8);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579905B0);
  }
  return result;
}

unint64_t sub_24B481C8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2579904A8;
  if (!qword_2579904A8)
  {
    v1 = sub_24B4AD920();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDF0D88], v1);
    atomic_store(result, (unint64_t *)&qword_2579904A8);
  }
  return result;
}

uint64_t sub_24B481CDC(uint64_t a1)
{
  sub_24B4808C0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24B481D18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579905A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B481D60()
{
  return sub_24B481D94(&qword_2579905E0, &qword_2579905C0, (uint64_t (*)(void))sub_24B481DFC, MEMORY[0x24BDECC60]);
}

uint64_t sub_24B481D94(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24B481DFC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2579905E8;
  if (!qword_2579905E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990580);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990570);
    v2[3] = sub_24B4AD920();
    v2[4] = sub_24B480FAC(&qword_2579905B8, &qword_257990570, MEMORY[0x24BDF43B0]);
    v2[5] = sub_24B481C8C();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_24B480FAC(&qword_257990420, &qword_257990428, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579905E8);
  }
  return result;
}

uint64_t sub_24B481EE0()
{
  uint64_t v0;
  id v1;

  if (qword_257990120 != -1)
    swift_once();
  v0 = qword_257994BC8;
  v1 = (id)qword_257994BC8;
  return v0;
}

unint64_t sub_24B481F4C()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257990300);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = 4804673;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = sub_24B4ADD1C();
  *(_QWORD *)(inited + 56) = 0x6874654D70747468;
  *(_QWORD *)(inited + 64) = 0xEA0000000000646FLL;
  *(_QWORD *)(inited + 72) = sub_24B4ADD1C();
  return sub_24B4A5BA4(inited);
}

id sub_24B481FE4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailCreateAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailCreateAPIRequest()
{
  uint64_t result;

  result = qword_257990618;
  if (!qword_257990618)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B482054(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v12[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579907D0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B482808();
  sub_24B4AE04C();
  v14 = 0;
  sub_24B4ADFB0();
  if (!v5)
  {
    v13 = 1;
    sub_24B4ADFB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24B48217C()
{
  return type metadata accessor for EmailCreateAPIRequest();
}

ValueMetadata *type metadata accessor for EmailCreateAPIResponse()
{
  return &type metadata for EmailCreateAPIResponse;
}

BOOL sub_24B482194(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_24B4821AC()
{
  sub_24B4AE01C();
  sub_24B4AE028();
  return sub_24B4AE034();
}

uint64_t sub_24B4821F0()
{
  return sub_24B4AE028();
}

uint64_t sub_24B482218()
{
  sub_24B4AE01C();
  sub_24B4AE028();
  return sub_24B4AE034();
}

uint64_t sub_24B482258()
{
  _BYTE *v0;

  if (*v0)
    return 0x6C69616D65;
  else
    return 0x496E726574746170;
}

uint64_t sub_24B482294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24B482A94(a1, a2);
  *a3 = result;
  return result;
}

void sub_24B4822B8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24B4822C4()
{
  sub_24B482808();
  return sub_24B4AE058();
}

uint64_t sub_24B4822EC()
{
  sub_24B482808();
  return sub_24B4AE064();
}

uint64_t sub_24B482314(_QWORD *a1)
{
  uint64_t *v1;

  return sub_24B482054(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24B482330()
{
  sub_24B4824A4();
  return sub_24B4AE058();
}

uint64_t sub_24B482358()
{
  sub_24B4824A4();
  return sub_24B4AE064();
}

uint64_t sub_24B482380@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579907A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B4824A4();
  sub_24B4AE040();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v9 = sub_24B4ADF8C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

unint64_t sub_24B4824A4()
{
  unint64_t result;

  result = qword_2579907B0;
  if (!qword_2579907B0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEF38, &type metadata for EmailCreateAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907B0);
  }
  return result;
}

uint64_t destroy for EmailCreateAPIRequestBody()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for EmailCreateAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for EmailCreateAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for EmailCreateAPIRequestBody(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for EmailCreateAPIRequestBody(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for EmailCreateAPIRequestBody(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIRequestBody()
{
  return &type metadata for EmailCreateAPIRequestBody;
}

uint64_t storeEnumTagSinglePayload for EmailCreateAPIResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B4826D4 + 4 * byte_24B4AED90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B4826F4 + 4 * byte_24B4AED95[v4]))();
}

_BYTE *sub_24B4826D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B4826F4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B4826FC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B482704(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B48270C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B482714(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIResponse.CodingKeys()
{
  return &type metadata for EmailCreateAPIResponse.CodingKeys;
}

unint64_t sub_24B482734()
{
  unint64_t result;

  result = qword_2579907B8;
  if (!qword_2579907B8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEEE8, &type metadata for EmailCreateAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907B8);
  }
  return result;
}

unint64_t sub_24B48277C()
{
  unint64_t result;

  result = qword_2579907C0;
  if (!qword_2579907C0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEE58, &type metadata for EmailCreateAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907C0);
  }
  return result;
}

unint64_t sub_24B4827C4()
{
  unint64_t result;

  result = qword_2579907C8;
  if (!qword_2579907C8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEE80, &type metadata for EmailCreateAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907C8);
  }
  return result;
}

unint64_t sub_24B482808()
{
  unint64_t result;

  result = qword_2579907D8;
  if (!qword_2579907D8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF040, &type metadata for EmailCreateAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for EmailCreateAPIRequestBody.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EmailCreateAPIRequestBody.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B482928 + 4 * byte_24B4AED9F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24B48295C + 4 * byte_24B4AED9A[v4]))();
}

uint64_t sub_24B48295C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B482964(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B48296CLL);
  return result;
}

uint64_t sub_24B482978(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B482980);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24B482984(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B48298C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B482998(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24B4829A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for EmailCreateAPIRequestBody.CodingKeys()
{
  return &type metadata for EmailCreateAPIRequestBody.CodingKeys;
}

unint64_t sub_24B4829C0()
{
  unint64_t result;

  result = qword_2579907E0;
  if (!qword_2579907E0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF018, &type metadata for EmailCreateAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907E0);
  }
  return result;
}

unint64_t sub_24B482A08()
{
  unint64_t result;

  result = qword_2579907E8;
  if (!qword_2579907E8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEF88, &type metadata for EmailCreateAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907E8);
  }
  return result;
}

unint64_t sub_24B482A50()
{
  unint64_t result;

  result = qword_2579907F0;
  if (!qword_2579907F0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEFB0, &type metadata for EmailCreateAPIRequestBody.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579907F0);
  }
  return result;
}

uint64_t sub_24B482A94(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E726574746170 && a2 == 0xE900000000000064;
  if (v2 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C69616D65 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24B4ADFC8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24B482B88()
{
  uint64_t v0;
  id v1;

  if (qword_257990120 != -1)
    swift_once();
  v0 = qword_257994BC8;
  v1 = (id)qword_257994BC8;
  return v0;
}

id sub_24B482BF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudMailValidationRulesAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for iCloudMailValidationRulesAPIRequest()
{
  uint64_t result;

  result = qword_257990820;
  if (!qword_257990820)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B482C64()
{
  return type metadata accessor for iCloudMailValidationRulesAPIRequest();
}

uint64_t destroy for ValidationRule()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ValidationRule(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ValidationRule(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ValidationRule(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ValidationRule(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ValidationRule(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ValidationRule()
{
  return &type metadata for ValidationRule;
}

ValueMetadata *type metadata accessor for iCloudMailValidationRulesAPIResponse()
{
  return &type metadata for iCloudMailValidationRulesAPIResponse;
}

BOOL sub_24B482F10(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24B482F24()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24B482F4C + 4 * byte_24B4AF090[*v0]))(1701606770, 0xE400000000000000);
}

uint64_t sub_24B482F4C()
{
  return 0x74697243656C7572;
}

uint64_t sub_24B482F6C()
{
  return 0x646F43726F727265;
}

uint64_t sub_24B482F88()
{
  return 0x73654D726F727265;
}

uint64_t sub_24B482FA8()
{
  return 0x614D646C756F6873;
}

uint64_t sub_24B482FC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24B4831B0(a1, a2);
  *a3 = result;
  return result;
}

void sub_24B482FEC(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_24B482FF8()
{
  sub_24B483774();
  return sub_24B4AE058();
}

uint64_t sub_24B483020()
{
  sub_24B483774();
  return sub_24B4AE064();
}

__n128 sub_24B483048@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  char v7;

  sub_24B483410(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_BYTE *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_24B483098()
{
  return 0x73656C7572;
}

uint64_t sub_24B4830AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x73656C7572 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_24B4ADFC8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24B483138()
{
  sub_24B4838E4();
  return sub_24B4AE058();
}

uint64_t sub_24B483160()
{
  sub_24B4838E4();
  return sub_24B4AE064();
}

_QWORD *sub_24B483188@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_24B4837B8(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_24B4831B0(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701606770 && a2 == 0xE400000000000000;
  if (v2 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x74697243656C7572 && a2 == 0xEC00000061697265 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x646F43726F727265 && a2 == 0xE900000000000065 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73654D726F727265 && a2 == 0xEC00000065676173 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x614D646C756F6873 && a2 == 0xEB00000000686374)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    v6 = sub_24B4ADFC8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 4;
    else
      return 5;
  }
}

uint64_t sub_24B483410@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579909A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B483774();
  sub_24B4AE040();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v35 = 0;
  v9 = sub_24B4ADF8C();
  v11 = v10;
  v29 = v9;
  v34 = 1;
  swift_bridgeObjectRetain();
  v12 = sub_24B4ADF8C();
  v30 = v13;
  v26 = v12;
  v33 = 2;
  swift_bridgeObjectRetain();
  v28 = 0;
  v25 = sub_24B4ADF8C();
  v32 = 3;
  v15 = v14;
  swift_bridgeObjectRetain();
  v16 = sub_24B4ADF8C();
  v27 = v15;
  v23 = v16;
  v24 = v17;
  v31 = 4;
  swift_bridgeObjectRetain();
  v18 = sub_24B4ADF98();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v19 = v24;
  swift_bridgeObjectRelease();
  v20 = v27;
  swift_bridgeObjectRelease();
  v21 = v30;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v29;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v21;
  *(_QWORD *)(a2 + 32) = v25;
  *(_QWORD *)(a2 + 40) = v20;
  *(_QWORD *)(a2 + 48) = v23;
  *(_QWORD *)(a2 + 56) = v19;
  *(_BYTE *)(a2 + 64) = v18 & 1;
  return result;
}

unint64_t sub_24B483774()
{
  unint64_t result;

  result = qword_2579909B0;
  if (!qword_2579909B0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF354, &type metadata for ValidationRule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909B0);
  }
  return result;
}

_QWORD *sub_24B4837B8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579909B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B4838E4();
  sub_24B4AE040();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579909C8);
    sub_24B483928();
    sub_24B4ADFA4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_24B4838E4()
{
  unint64_t result;

  result = qword_2579909C0;
  if (!qword_2579909C0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF304, &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909C0);
  }
  return result;
}

unint64_t sub_24B483928()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2579909D0;
  if (!qword_2579909D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579909C8);
    v2 = sub_24B48398C();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2579909D0);
  }
  return result;
}

unint64_t sub_24B48398C()
{
  unint64_t result;

  result = qword_2579909D8;
  if (!qword_2579909D8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF160, &type metadata for ValidationRule);
    atomic_store(result, (unint64_t *)&qword_2579909D8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for iCloudMailValidationRulesAPIResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B483A10 + 4 * byte_24B4AF095[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B483A30 + 4 * byte_24B4AF09A[v4]))();
}

_BYTE *sub_24B483A10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B483A30(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B483A38(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B483A40(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B483A48(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B483A50(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for iCloudMailValidationRulesAPIResponse.CodingKeys()
{
  return &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys;
}

uint64_t getEnumTagSinglePayload for ValidationRule.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ValidationRule.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B483B48 + 4 * byte_24B4AF0A4[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24B483B7C + 4 * byte_24B4AF09F[v4]))();
}

uint64_t sub_24B483B7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B483B84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B483B8CLL);
  return result;
}

uint64_t sub_24B483B98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B483BA0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24B483BA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B483BAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_24B483BB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ValidationRule.CodingKeys()
{
  return &type metadata for ValidationRule.CodingKeys;
}

unint64_t sub_24B483BD4()
{
  unint64_t result;

  result = qword_2579909E0;
  if (!qword_2579909E0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF224, &type metadata for ValidationRule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909E0);
  }
  return result;
}

unint64_t sub_24B483C1C()
{
  unint64_t result;

  result = qword_2579909E8;
  if (!qword_2579909E8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF2DC, &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909E8);
  }
  return result;
}

unint64_t sub_24B483C64()
{
  unint64_t result;

  result = qword_2579909F0;
  if (!qword_2579909F0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF24C, &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909F0);
  }
  return result;
}

unint64_t sub_24B483CAC()
{
  unint64_t result;

  result = qword_2579909F8;
  if (!qword_2579909F8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF274, &type metadata for iCloudMailValidationRulesAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2579909F8);
  }
  return result;
}

unint64_t sub_24B483CF4()
{
  unint64_t result;

  result = qword_257990A00;
  if (!qword_257990A00)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF194, &type metadata for ValidationRule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990A00);
  }
  return result;
}

unint64_t sub_24B483D3C()
{
  unint64_t result;

  result = qword_257990A08;
  if (!qword_257990A08)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF1BC, &type metadata for ValidationRule.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990A08);
  }
  return result;
}

void sub_24B483D80(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_24B483DD0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24B483E3C + 4 * byte_24B4AF3B5[a2]))(0xD000000000000024);
}

uint64_t sub_24B483E3C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000024 && v1 == 0x800000024B4B0E20)
    v2 = 1;
  else
    v2 = sub_24B4ADFC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_24B483EE4(char a1)
{
  sub_24B4AE01C();
  __asm { BR              X10 }
}

uint64_t sub_24B483F40()
{
  sub_24B4ADD58();
  swift_bridgeObjectRelease();
  return sub_24B4AE034();
}

void sub_24B483FBC(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_24B484004()
{
  sub_24B4ADD58();
  return swift_bridgeObjectRelease();
}

void sub_24B484068(uint64_t a1, char a2)
{
  sub_24B4AE01C();
  __asm { BR              X10 }
}

uint64_t sub_24B4840C0()
{
  sub_24B4ADD58();
  swift_bridgeObjectRelease();
  return sub_24B4AE034();
}

uint64_t sub_24B48413C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24B484178 + 4 * byte_24B4AF3C9[a1]))(0xD000000000000020, 0x800000024B4B0DF0);
}

unint64_t sub_24B484178()
{
  return 0xD000000000000024;
}

uint64_t sub_24B4841A0()
{
  uint64_t v0;

  return v0 + 5;
}

void sub_24B4841C8(char *a1)
{
  sub_24B483D80(*a1);
}

void sub_24B4841D4()
{
  char *v0;

  sub_24B483EE4(*v0);
}

void sub_24B4841DC(uint64_t a1)
{
  char *v1;

  sub_24B483FBC(a1, *v1);
}

void sub_24B4841E4(uint64_t a1)
{
  char *v1;

  sub_24B484068(a1, *v1);
}

uint64_t sub_24B4841EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24B484388();
  *a1 = result;
  return result;
}

uint64_t sub_24B484218@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24B48413C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24B484240()
{
  uint64_t result;

  result = sub_24B4ADD1C();
  qword_257994BC8 = result;
  return result;
}

uint64_t storeEnumTagSinglePayload for AccountBagKeys.SubFeature(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B4842C0 + 4 * byte_24B4AF3D3[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24B4842F4 + 4 * byte_24B4AF3CE[v4]))();
}

uint64_t sub_24B4842F4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B4842FC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B484304);
  return result;
}

uint64_t sub_24B484310(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B484318);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24B48431C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B484324(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccountBagKeys.SubFeature()
{
  return &type metadata for AccountBagKeys.SubFeature;
}

unint64_t sub_24B484344()
{
  unint64_t result;

  result = qword_257990A10;
  if (!qword_257990A10)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF44C, &type metadata for AccountBagKeys.SubFeature);
    atomic_store(result, (unint64_t *)&qword_257990A10);
  }
  return result;
}

uint64_t sub_24B484388()
{
  unint64_t v0;

  v0 = sub_24B4ADF80();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_24B4843D4()
{
  return swift_initClassMetadata2();
}

void sub_24B484438(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_257990A18);
  *(_QWORD *)(v1 + qword_257990A18) = a1;

}

uint64_t sub_24B48444C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + qword_257990A28;
  swift_beginAccess();
  return sub_24B480840(v3, a1, &qword_257990C48);
}

id sub_24B4844A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id result;
  id v7;

  v1 = *(void **)(v0 + qword_257990A18);
  if (v1)
  {
    v2 = *(id *)(v0 + qword_257990A18);
LABEL_5:
    v7 = v1;
    return v2;
  }
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_defaultStore);
  v5 = *(void **)(v0 + qword_257990A18);
  *(_QWORD *)(v0 + qword_257990A18) = v4;

  result = objc_msgSend(v3, sel_defaultStore);
  if (result)
  {
    v2 = result;
    v1 = 0;
    goto LABEL_5;
  }
  __break(1u);
  return result;
}

id sub_24B48453C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v1 = qword_257990A30;
  v2 = *(void **)(v0 + qword_257990A30);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_257990A30);
  }
  else
  {
    sub_24B484B64(v0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v5;
    v3 = v5;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t sub_24B48459C()
{
  return 0;
}

uint64_t sub_24B4845A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24B4845D0 + 4 * byte_24B4AF4C0[a1]))(5522759, 0xE300000000000000);
}

uint64_t sub_24B4845D0()
{
  return 1414745936;
}

uint64_t sub_24B4845E0()
{
  return 5526864;
}

uint64_t sub_24B4845EC()
{
  return 0x4554454C4544;
}

uint64_t sub_24B484600()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32[5];
  __int128 v33;
  __int128 v34;

  v1 = sub_24B4AD560();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (void *)(*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))(v3);
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(*(id *)((char *)v0 + qword_257990A20), sel_propertiesForDataclass_, v6);
  if (v11)
  {
    v12 = v11;
    v13 = sub_24B4ADCF8();

    v30 = v8;
    v31 = v10;
    swift_bridgeObjectRetain();
    sub_24B4ADEE4();
    if (*(_QWORD *)(v13 + 16) && (v14 = sub_24B495B80((uint64_t)v32), (v15 & 1) != 0))
    {
      sub_24B489C14(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v33);
    }
    else
    {
      v33 = 0u;
      v34 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_24B489CF0((uint64_t)v32);
    if (*((_QWORD *)&v34 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        swift_bridgeObjectRelease();

        return v30;
      }
    }
    else
    {
      sub_24B480884((uint64_t)&v33, &qword_257990C50);
    }
  }
  if (qword_257990130 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v1, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v17, v1);
  v18 = v6;
  swift_bridgeObjectRetain_n();
  v19 = v18;
  v20 = sub_24B4AD548();
  v21 = sub_24B4ADDF4();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v29 = v5;
    v24 = v23;
    v32[0] = v23;
    *(_DWORD *)v22 = 136315394;
    v28 = v2;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v33 = sub_24B49F648(v8, v10, v32);
    sub_24B4ADE90();

    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    v25 = sub_24B4ADD28();
    *(_QWORD *)&v33 = sub_24B49F648(v25, v26, v32);
    sub_24B4ADE90();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v20, v21, "Account bag has no value for key: %s in %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v24, -1, -1);
    MEMORY[0x24BD20FF8](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v1);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  }
  swift_bridgeObjectRelease();

  return 0;
}

id sub_24B4849D0(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  sub_24B484600();

  v2 = (void *)sub_24B4ADD1C();
  swift_bridgeObjectRelease();
  return v2;
}

void sub_24B484A24()
{
  sub_24B4ADF38();
  __break(1u);
}

uint64_t sub_24B484A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for MSAPIResponse(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4);
}

uint64_t sub_24B484A88()
{
  uint64_t ObjCClassMetadata;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  ObjCClassMetadata = swift_getObjCClassMetadata();
  sub_24B484A7C(ObjCClassMetadata, v1, v2, v3);
  return swift_getObjCClassFromMetadata();
}

void sub_24B484AAC()
{
  sub_24B4ADF38();
  __break(1u);
}

void sub_24B484B08()
{
  sub_24B4ADF38();
  __break(1u);
}

void sub_24B484B64(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v2 = sub_24B4844A4();
  v3 = sub_24B4844A4();
  v4 = objc_msgSend(v3, sel_aida_accountForiCloudAccount_, *(_QWORD *)(a1 + qword_257990A20));

  v5 = objc_allocWithZone(MEMORY[0x24BE049B0]);
  v6 = (void *)sub_24B4ADD1C();
  v7 = objc_msgSend(v5, sel_initWithAccountStore_grandSlamAccount_appTokenID_, v2, v4, v6);

  if (!v7)
    __break(1u);
}

id sub_24B484C28(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v9;

  v2 = sub_24B4AD3EC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1;
  sub_24B484CC4((uint64_t)v5);

  v7 = (void *)sub_24B4AD3BC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v7;
}

void sub_24B484CC4(uint64_t a1@<X8>)
{
  _QWORD *v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  objc_class *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  char *v24;
  _QWORD v25[13];
  objc_super v26;

  v2 = v1;
  v25[3] = a1;
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v4 = *MEMORY[0x24BEE4EA0] & *v1;
  v5 = sub_24B4AD560();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - v8;
  v11 = (objc_class *)type metadata accessor for MSRequest(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), v10);
  v26.receiver = v1;
  v26.super_class = v11;
  v12 = objc_msgSendSuper2(&v26, sel_urlRequest);
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_mutableCopy);

    sub_24B4ADEB4();
    swift_unknownObjectRelease();
    sub_24B489CA0(0, &qword_257990C40);
    v14 = swift_dynamicCast();
    v15 = (void *)v25[10];
    if (((*(uint64_t (**)(uint64_t))((*v3 & *v1) + 0xE0))(v14) & 1) != 0)
    {
      v17 = sub_24B48453C();
      objc_msgSend(v17, sel_setUseAltDSID_, 1);

      v18 = sub_24B48453C();
      v19 = objc_msgSend(v18, sel_signURLRequest_isUserInitiated_, v15, 1);

      if ((v19 & 1) == 0)
      {
        if (qword_257990130 != -1)
          swift_once();
        v20 = __swift_project_value_buffer(v5, (uint64_t)qword_257994C18);
        (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v20, v5);
        v21 = sub_24B4AD548();
        v22 = sub_24B4ADDF4();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_24B47A000, v21, v22, "Unable to sign grandslam request", v23, 2u);
          MEMORY[0x24BD20FF8](v23, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      }
      v16 = objc_msgSend(v15, sel_aa_addBasicAuthorizationHeaderWithAccount_preferUsingPassword_, *(_QWORD *)((char *)v2 + qword_257990A20), 0);
    }
    else
    {
      v16 = objc_msgSend(v15, sel_aa_addAuthTokenOrBasicAuthHeaderWithAccount_preferUsingPassword_, *(_QWORD *)((char *)v1 + qword_257990A20), 0);
    }
    v24 = (char *)&loc_24B484F7C
        + *((int *)qword_24B485438 + (*(unsigned __int8 (**)(id))((*v3 & *v2) + 0xD8))(v16));
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x24B485438);
}

uint64_t sub_24B485448()
{
  uint64_t v0;

  sub_24B4AD434();
  swift_allocObject();
  sub_24B4AD428();
  v0 = sub_24B4AD41C();
  swift_release();
  return v0;
}

void sub_24B4854D8()
{
  sub_24B489368();
}

uint64_t sub_24B4854F4(_QWORD *a1, uint64_t a2)
{
  return sub_24B48706C(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_24B489394);
}

id sub_24B485500()
{
  return sub_24B487094((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for MSRequest);
}

uint64_t sub_24B48550C(uint64_t a1)
{

  sub_24B480884(a1 + qword_257990A28, &qword_257990C48);
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for MSRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MSRequest);
}

uint64_t sub_24B48558C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for MSResult(319, *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24B4855FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  void (*v26)(_QWORD);
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v36[5];
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(_QWORD);
  uint64_t v44;
  char *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v47 = a2;
  v49 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B4AD4C4();
  v8 = *(_QWORD *)(v7 - 8);
  v39 = v7;
  v40 = v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v36[2] = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v36[1] = (char *)v36 - v12;
  v48 = *(_QWORD *)(v3 + 80);
  v37 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_24B4AD560();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v41 = (char *)v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v36[0] = (char *)v36 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v36[4] = (char *)v36 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v36 - v23;
  if (qword_257990130 != -1)
    swift_once();
  v45 = v14;
  *(_QWORD *)&v46 = v3;
  v25 = __swift_project_value_buffer(v15, (uint64_t)qword_257994C18);
  v26 = *(void (**)(_QWORD))(v16 + 16);
  v42 = v25;
  v43 = v26;
  v26(v24);
  v27 = sub_24B4AD548();
  v28 = sub_24B4ADE0C();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_24B47A000, v27, v28, "Parsing response", v29, 2u);
    MEMORY[0x24BD20FF8](v29, -1, -1);
  }

  v30 = *(void (**)(char *, uint64_t))(v16 + 8);
  v44 = v15;
  v30(v24, v15);
  sub_24B4AD410();
  swift_allocObject();
  sub_24B4AD404();
  v31 = v45;
  v32 = *(_QWORD *)(v46 + 88);
  sub_24B4AD3F8();
  swift_release();
  v33 = v48;
  (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(a3, v31, v48);
  type metadata accessor for MSResult(0, v33, v32, v34);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_24B486464(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22[2];

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(sub_24B486A60(a1) + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991EC0);
    v6 = sub_24B4ADF68();
  }
  else
  {
    v6 = MEMORY[0x24BEE4B00];
  }
  v22[0] = v6;
  v7 = swift_bridgeObjectRetain();
  sub_24B48874C(v7, 1, v22);
  swift_bridgeObjectRelease();
  sub_24B488B1C(v22[0]);
  swift_release();
  if (qword_257990130 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  swift_retain();
  v9 = sub_24B4AD548();
  v10 = sub_24B4ADDF4();
  if (os_log_type_enabled(v9, v10))
  {
    v20 = v2;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v19 = v3;
    v13 = v12;
    v22[0] = v12;
    *(_DWORD *)v11 = 136380675;
    v18 = v11 + 4;
    swift_retain();
    v14 = sub_24B4ADD04();
    v16 = v15;
    swift_release();
    v21 = sub_24B49F648(v14, v16, v22);
    sub_24B4ADE90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v9, v10, "Response headers: %{private}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v13, -1, -1);
    MEMORY[0x24BD20FF8](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v5, v20);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_24B486740()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_24B4ADD7C();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_24B4ADD7C();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_24B4ADFC8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_24B4ADD7C();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_24B4ADD7C();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_24B4868A4(uint64_t a1, uint64_t a2, void *a3, void *a4, int a5)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  v9 = sub_24B4AD4DC();
  v11 = v10;

  sub_24B4894CC(v7, v9, v11, a5);
  v13 = v12;
  sub_24B489AAC(v9, v11);

  return v13;
}

uint64_t sub_24B486934(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = sub_24B4AD4DC();
  v9 = v8;

  sub_24B489630(v5, v7, v9);
  v11 = v10;
  sub_24B489AAC(v7, v9);

  return v11;
}

uint64_t sub_24B4869B0(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = sub_24B4AD4DC();
  v12 = v11;

  v13 = sub_24B4ADD28();
  v15 = v14;

  sub_24B489788(v7, v10, v12, v13, v15);
  v17 = v16;
  sub_24B489AAC(v10, v12);

  return v17;
}

uint64_t sub_24B486A60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  int64_t v8;
  _QWORD *v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t i;
  unint64_t v14;
  unint64_t v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _OWORD v27[2];
  _OWORD v28[2];
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a1 + 64);
  v33 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & v2;
  v6 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v5)
    goto LABEL_31;
LABEL_6:
  v10 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v10 < v6)
    {
      v11 = *(_QWORD *)(v33 + 8 * v10);
      ++v8;
      if (v11)
        goto LABEL_21;
      v8 = v10 + 1;
      if (v10 + 1 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 2;
      if (v10 + 2 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
        goto LABEL_21;
      v8 = v10 + 3;
      if (v10 + 3 >= v6)
        goto LABEL_32;
      v11 = *(_QWORD *)(v33 + 8 * v8);
      if (v11)
      {
LABEL_21:
        v5 = (v11 - 1) & v11;
        for (i = __clz(__rbit64(v11)) + (v8 << 6); ; i = v19 | (v8 << 6))
        {
          sub_24B489C60(*(_QWORD *)(a1 + 48) + 40 * i, (uint64_t)v30);
          sub_24B489C14(*(_QWORD *)(a1 + 56) + 32 * i, (uint64_t)v31 + 8);
          v28[0] = v31[0];
          v28[1] = v31[1];
          v29 = v32;
          v27[0] = v30[0];
          v27[1] = v30[1];
          sub_24B489C60((uint64_t)v27, (uint64_t)&v20);
          if (swift_dynamicCast())
          {
            v24 = v23;
            sub_24B489C14((uint64_t)v28 + 8, (uint64_t)&v25);
          }
          else
          {
            v24 = 0u;
            v25 = 0u;
            v26 = 0u;
          }
          sub_24B480884((uint64_t)v27, &qword_257990C28);
          if (*((_QWORD *)&v24 + 1))
          {
            v20 = v24;
            v21 = v25;
            v22 = v26;
            result = swift_isUniquelyReferenced_nonNull_native();
            if ((result & 1) == 0)
            {
              result = (uint64_t)sub_24B488628(0, v9[2] + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v15 = v9[2];
            v14 = v9[3];
            if (v15 >= v14 >> 1)
            {
              result = (uint64_t)sub_24B488628((_QWORD *)(v14 > 1), v15 + 1, 1, v9);
              v9 = (_QWORD *)result;
            }
            v9[2] = v15 + 1;
            v16 = &v9[6 * v15];
            v17 = v20;
            v18 = v22;
            v16[3] = v21;
            v16[4] = v18;
            v16[2] = v17;
            if (!v5)
              goto LABEL_6;
          }
          else
          {
            result = sub_24B480884((uint64_t)&v24, &qword_257990C30);
            if (!v5)
              goto LABEL_6;
          }
LABEL_31:
          v19 = __clz(__rbit64(v5));
          v5 &= v5 - 1;
        }
      }
      v12 = v10 + 4;
      if (v12 < v6)
      {
        v11 = *(_QWORD *)(v33 + 8 * v12);
        if (v11)
        {
          v8 = v12;
          goto LABEL_21;
        }
        while (1)
        {
          v8 = v12 + 1;
          if (__OFADD__(v12, 1))
            goto LABEL_34;
          if (v8 >= v6)
            break;
          v11 = *(_QWORD *)(v33 + 8 * v8);
          ++v12;
          if (v11)
            goto LABEL_21;
        }
      }
    }
LABEL_32:
    swift_release();
    return (uint64_t)v9;
  }
  __break(1u);
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_24B486D40(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  _QWORD v37[2];
  _BYTE v38[32];

  v2 = a1[1];
  v37[0] = *a1;
  v37[1] = v2;
  sub_24B489C14(a2, (uint64_t)v38);
  v35[0] = v37[0];
  v35[1] = v2;
  sub_24B489C14((uint64_t)v38, (uint64_t)&v36);
  v3 = sub_24B4ADD40();
  v5 = v4;
  if (v3 == sub_24B4ADD40() && v5 == v6)
  {
    swift_bridgeObjectRetain_n();
    goto LABEL_8;
  }
  v8 = sub_24B4ADFC8();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0)
  {
    v11 = sub_24B4ADD40();
    v13 = v12;
    if (v11 != sub_24B4ADD40() || v13 != v14)
    {
      v15 = sub_24B4ADFC8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v15 & 1) != 0)
        goto LABEL_6;
      v16 = sub_24B4ADD40();
      v18 = v17;
      if (v16 != sub_24B4ADD40() || v18 != v19)
      {
        v20 = sub_24B4ADFC8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_6;
        v21 = sub_24B4ADD40();
        v23 = v22;
        if (v21 != sub_24B4ADD40() || v23 != v24)
        {
          v25 = sub_24B4ADFC8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v25 & 1) != 0)
            goto LABEL_6;
          v26 = sub_24B4ADD40();
          v28 = v27;
          if (v26 != sub_24B4ADD40() || v28 != v29)
          {
            v30 = sub_24B4ADFC8();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v30 & 1) != 0)
              goto LABEL_6;
            v31 = sub_24B4ADD40();
            v33 = v32;
            if (v31 != sub_24B4ADD40() || v33 != v34)
            {
              v9 = sub_24B4ADFC8();
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_8:
    v9 = 1;
LABEL_9:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_6:
  v9 = 1;
LABEL_10:
  sub_24B480884((uint64_t)v37, &qword_257990C10);
  sub_24B480884((uint64_t)v35, &qword_257990C10);
  return v9 & 1;
}

uint64_t sub_24B487060(_QWORD *a1, uint64_t a2)
{
  return sub_24B48706C(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_24B489904);
}

uint64_t sub_24B48706C(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  return a3(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x58));
}

id sub_24B487088()
{
  return sub_24B487094((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for MSAPIResponse);
}

id sub_24B487094(uint64_t (*a1)(_QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)a1(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_24B4870E4(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x60);
  v5 = type metadata accessor for MSResult(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x58), a4);
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t type metadata accessor for MSAPIResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MSAPIResponse);
}

uint64_t type metadata accessor for MSResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MSResult);
}

uint64_t initializeWithCopy for MSError(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MSError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v5;
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

uint64_t assignWithTake for MSError(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for MSError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 41))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MSError(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 41) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MSError()
{
  return &type metadata for MSError;
}

uint64_t sub_24B487310()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24B487318()
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

uint64_t sub_24B487388(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x29uLL)
    v5 = 41;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_DWORD *)(v4 + 80);
  if ((v6 & 0x1000F8) != 0 || (unint64_t)(v5 + 1) > 0x18)
  {
    v8 = *a2;
    *(_QWORD *)v3 = *a2;
    v3 = v8 + ((unsigned __int16)((v6 & 0xF8) + 23) & (unsigned __int16)~(v6 & 0xF8) & 0x1F8);
    swift_retain();
  }
  else
  {
    v9 = *((unsigned __int8 *)a2 + v5);
    if (v9 >= 2)
      v9 = *(_DWORD *)a2 + 2;
    if (v9 == 1)
    {
      v10 = a2[1];
      *(_QWORD *)v3 = *a2;
      *(_QWORD *)(v3 + 8) = v10;
      *(_QWORD *)(v3 + 16) = a2[2];
      *(_BYTE *)(v3 + 24) = *((_BYTE *)a2 + 24);
      *(_QWORD *)(v3 + 32) = a2[4];
      *(_BYTE *)(v3 + 40) = *((_BYTE *)a2 + 40);
      *(_BYTE *)(v3 + v5) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t))(v4 + 16))(a1);
      *(_BYTE *)(v3 + v5) = 0;
    }
  }
  return v3;
}

uint64_t sub_24B487460(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  if (v3 <= 0x29)
    v3 = 41;
  v4 = *(unsigned __int8 *)(a1 + v3);
  if (v4 < 2)
  {
    if (v4 == 1)
      return swift_bridgeObjectRelease();
    else
      return (*(uint64_t (**)(void))(v2 + 8))();
  }
  else
  {
    if (v3 <= 3)
      v5 = v3;
    else
      v5 = 4;
    return ((uint64_t (*)(void))((char *)&loc_24B4874A8 + 4 * byte_24B4AF4C4[v5]))();
  }
}

uint64_t sub_24B487500(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x29uLL)
    v5 = 41;
  else
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(a2 + v5);
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
    v8 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
    swift_bridgeObjectRetain();
    v9 = 1;
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(a1);
    v9 = 0;
  }
  *(_BYTE *)(a1 + v5) = v9;
  return a1;
}

uint64_t sub_24B4875F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x29uLL)
      v7 = 41;
    else
      v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(a1 + v7);
    if (v8 >= 2)
    {
      if (v7 <= 3)
        v9 = v7;
      else
        v9 = 4;
      __asm { BR              X12 }
    }
    if (v8 == 1)
      swift_bridgeObjectRelease();
    else
      (*(void (**)(uint64_t, _QWORD))(v6 + 8))(a1, *(_QWORD *)(a3 + 16));
    v10 = *(unsigned __int8 *)(a2 + v7);
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
      *(_QWORD *)a1 = *(_QWORD *)a2;
      *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
      v12 = *(_QWORD *)(a2 + 16);
      *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v12;
      v13 = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
      *(_QWORD *)(a1 + 32) = v13;
      *(_BYTE *)(a1 + v7) = 1;
      swift_bridgeObjectRetain();
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a1, a2, v5);
      *(_BYTE *)(a1 + v7) = 0;
    }
  }
  return a1;
}

_OWORD *sub_24B4877B0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  __int128 v8;
  char v9;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  if (*(_QWORD *)(v4 + 64) <= 0x29uLL)
    v5 = 41;
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
    *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
    v9 = 1;
  }
  else
  {
    (*(void (**)(_OWORD *))(v4 + 32))(a1);
    v9 = 0;
  }
  *((_BYTE *)a1 + v5) = v9;
  return a1;
}

_OWORD *sub_24B48788C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  __int128 v12;
  char v13;

  if (a1 != a2)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    if (*(_QWORD *)(v6 + 64) <= 0x29uLL)
      v7 = 41;
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
      swift_bridgeObjectRelease();
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
      v12 = a2[1];
      *a1 = *a2;
      a1[1] = v12;
      *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
      v13 = 1;
    }
    else
    {
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(v6 + 32))(a1, a2, v5);
      v13 = 0;
    }
    *((_BYTE *)a1 + v7) = v13;
  }
  return a1;
}

uint64_t sub_24B487A20(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 41;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 0x29uLL)
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
  return ((uint64_t (*)(void))((char *)&loc_24B487AE4 + 4 * byte_24B4AF4E7[(v4 - 1)]))();
}

void sub_24B487B30(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 0x29)
    v5 = 41;
  v6 = v5 + 1;
  if (a3 < 0xFF)
  {
    v7 = 0;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 254) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v8 = a2 - 255;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_24B487CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 41;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 0x29uLL)
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_24B487D20 + 4 * byte_24B4AF4F5[v3]))();
}

void sub_24B487D68(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 0x29uLL)
    v4 = 41;
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

uint64_t sub_24B487E30()
{
  return sub_24B48820C();
}

uint64_t sub_24B487E4C()
{
  return sub_24B4ADD58();
}

uint64_t sub_24B487E68()
{
  return sub_24B488290();
}

uint64_t sub_24B487E84@<X0>(BOOL *a1@<X8>)
{
  return sub_24B4882E4(a1);
}

void sub_24B487E90(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000019;
  a1[1] = 0x800000024B4B0F80;
}

unint64_t sub_24B487EB0()
{
  return 0xD000000000000019;
}

uint64_t sub_24B487ECC@<X0>(BOOL *a1@<X8>)
{
  return sub_24B488378(a1);
}

uint64_t sub_24B487ED8()
{
  sub_24B489A68();
  return sub_24B4AE058();
}

uint64_t sub_24B487F00()
{
  sub_24B489A68();
  return sub_24B4AE064();
}

double sub_24B487F28@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];

  sub_24B489930(a1, (uint64_t)&v6);
  if (!v2)
  {
    v5 = v7[0];
    *a2 = v6;
    a2[1] = v5;
    result = *(double *)((char *)v7 + 9);
    *(_OWORD *)((char *)a2 + 25) = *(_OWORD *)((char *)v7 + 9);
  }
  return result;
}

uint64_t sub_24B487F68(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990BD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B489A68();
  sub_24B4AE04C();
  sub_24B4ADFB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24B488054()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADD70();
  sub_24B4ADD70();
  v2 = sub_24B4AD470();
  v4 = v3;

  result = swift_bridgeObjectRelease();
  qword_257994BD0 = v2;
  *(_QWORD *)algn_257994BD8 = v4;
  qword_257994BE0 = 0;
  byte_257994BE8 = 1;
  qword_257994BF0 = 0;
  byte_257994BF8 = 1;
  return result;
}

uint64_t sub_24B488160()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t sub_24B4881AC()
{
  unint64_t result;

  result = qword_257990BC0;
  if (!qword_257990BC0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF688, &type metadata for MSError);
    atomic_store(result, (unint64_t *)&qword_257990BC0);
  }
  return result;
}

uint64_t sub_24B4881F0()
{
  return sub_24B48820C();
}

uint64_t sub_24B48820C()
{
  sub_24B4AE01C();
  sub_24B4ADD58();
  return sub_24B4AE034();
}

uint64_t sub_24B488258()
{
  return sub_24B4ADD58();
}

uint64_t sub_24B488274()
{
  return sub_24B488290();
}

uint64_t sub_24B488290()
{
  sub_24B4AE01C();
  sub_24B4ADD58();
  return sub_24B4AE034();
}

uint64_t sub_24B4882D8@<X0>(BOOL *a1@<X8>)
{
  return sub_24B4882E4(a1);
}

uint64_t sub_24B4882E4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24B4ADF80();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_24B488330(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000010;
  a1[1] = 0x800000024B4B0FA0;
}

unint64_t sub_24B488350()
{
  return 0xD000000000000010;
}

uint64_t sub_24B48836C@<X0>(BOOL *a1@<X8>)
{
  return sub_24B488378(a1);
}

uint64_t sub_24B488378@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24B4ADF80();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_24B4883C8()
{
  sub_24B489E4C();
  return sub_24B4AE058();
}

uint64_t sub_24B4883F0()
{
  sub_24B489E4C();
  return sub_24B4AE064();
}

uint64_t sub_24B488418@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990C70);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B489E4C();
  sub_24B4AE040();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v9 = sub_24B4ADF8C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *a2 = v9;
  a2[1] = v11;
  return result;
}

uint64_t sub_24B48853C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990C80);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B489E4C();
  sub_24B4AE04C();
  sub_24B4ADFB0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

_QWORD *sub_24B488628(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257990C38);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
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
    sub_24B4893C0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void sub_24B48874C(uint64_t a1, char a2, _QWORD *a3)
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
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  char v35;
  char v36;
  _QWORD *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _OWORD v46[2];
  id v47;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  sub_24B480840(a1 + 32, (uint64_t)&v44, &qword_257990C18);
  v7 = v44;
  v8 = v45;
  v42 = v44;
  v43 = v45;
  sub_24B489C50(v46, v41);
  v9 = (_QWORD *)*a3;
  v11 = sub_24B495B1C(v7, v8);
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
      sub_24B494C78();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v20 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v21 = (uint64_t *)(v20[6] + 16 * v11);
    *v21 = v7;
    v21[1] = v8;
    sub_24B489C50(v41, (_OWORD *)(v20[7] + 32 * v11));
    v22 = v20[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v20[2] = v24;
    v25 = v4 - 1;
    if (!v25)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return;
    }
    v26 = a1 + 80;
    while (1)
    {
      sub_24B480840(v26, (uint64_t)&v44, &qword_257990C18);
      v27 = v44;
      v28 = v45;
      v42 = v44;
      v43 = v45;
      sub_24B489C50(v46, v41);
      v29 = (_QWORD *)*a3;
      v30 = sub_24B495B1C(v27, v28);
      v32 = v29[2];
      v33 = (v31 & 1) == 0;
      v23 = __OFADD__(v32, v33);
      v34 = v32 + v33;
      if (v23)
        break;
      v35 = v31;
      if (v29[3] < v34)
      {
        sub_24B494670(v34, 1);
        v30 = sub_24B495B1C(v27, v28);
        if ((v35 & 1) != (v36 & 1))
          goto LABEL_25;
      }
      if ((v35 & 1) != 0)
        goto LABEL_10;
      v37 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v30 >> 6) + 64) |= 1 << v30;
      v38 = (uint64_t *)(v37[6] + 16 * v30);
      *v38 = v27;
      v38[1] = v28;
      sub_24B489C50(v41, (_OWORD *)(v37[7] + 32 * v30));
      v39 = v37[2];
      v23 = __OFADD__(v39, 1);
      v40 = v39 + 1;
      if (v23)
        goto LABEL_24;
      v37[2] = v40;
      v26 += 48;
      if (!--v25)
        goto LABEL_22;
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_24B494670(v14, a2 & 1);
  v16 = sub_24B495B1C(v7, v8);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v18 = (void *)swift_allocError();
    swift_willThrow();
    v47 = v18;
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257990C20);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    }
    goto LABEL_26;
  }
LABEL_25:
  sub_24B4ADFD4();
  __break(1u);
LABEL_26:
  sub_24B4ADEF0();
  sub_24B4ADD70();
  sub_24B4ADF20();
  sub_24B4ADD70();
  sub_24B4ADF38();
  __break(1u);
}

unint64_t *sub_24B488B1C(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  unint64_t *v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_24B488C6C((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_24B488C6C((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x24BD20FF8](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_24B488C6C(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  char v20;
  _BYTE v22[32];
  _QWORD v23[2];
  unint64_t *v24;

  v24 = result;
  v5 = 0;
  v6 = 0;
  v7 = a3 + 64;
  v8 = 1 << *(_BYTE *)(a3 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a3 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (v10)
  {
    v12 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v13 = v12 | (v6 << 6);
LABEL_17:
    v17 = *(_QWORD *)(a3 + 56);
    v18 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 16 * v13);
    v19 = v18[1];
    v23[0] = *v18;
    v23[1] = v19;
    sub_24B489C14(v17 + 32 * v13, (uint64_t)v22);
    swift_bridgeObjectRetain();
    v20 = sub_24B486D40(v23, (uint64_t)v22);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    result = (unint64_t *)swift_bridgeObjectRelease();
    if (v3)
      return result;
    if ((v20 & 1) != 0)
    {
      *(unint64_t *)((char *)v24 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = __OFADD__(v5++, 1);
      if (v14)
        goto LABEL_30;
    }
  }
  v14 = __OFADD__(v6++, 1);
  if (v14)
  {
    __break(1u);
    goto LABEL_29;
  }
  if (v6 >= v11)
    return (unint64_t *)sub_24B488E40(v24, a2, v5, a3);
  v15 = *(_QWORD *)(v7 + 8 * v6);
  if (v15)
  {
LABEL_16:
    v10 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v6 << 6);
    goto LABEL_17;
  }
  v16 = v6 + 1;
  if (v6 + 1 >= v11)
    return (unint64_t *)sub_24B488E40(v24, a2, v5, a3);
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v6 + 2;
  if (v6 + 2 >= v11)
    return (unint64_t *)sub_24B488E40(v24, a2, v5, a3);
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
    goto LABEL_15;
  v16 = v6 + 3;
  if (v6 + 3 >= v11)
    return (unint64_t *)sub_24B488E40(v24, a2, v5, a3);
  v15 = *(_QWORD *)(v7 + 8 * v16);
  if (v15)
  {
LABEL_15:
    v6 = v16;
    goto LABEL_16;
  }
  while (1)
  {
    v6 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v6 >= v11)
      return (unint64_t *)sub_24B488E40(v24, a2, v5, a3);
    v15 = *(_QWORD *)(v7 + 8 * v6);
    ++v16;
    if (v15)
      goto LABEL_16;
  }
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24B488E40(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  _OWORD v32[2];
  _OWORD v33[2];

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991EC0);
  result = sub_24B4ADF68();
  v8 = result;
  v30 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v30)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v30)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v30)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v30)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v30)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    sub_24B489C14(*(_QWORD *)(v4 + 56) + 32 * v13, (uint64_t)v33);
    sub_24B489C50(v33, v32);
    sub_24B4AE01C();
    swift_bridgeObjectRetain();
    sub_24B4ADD58();
    result = sub_24B4AE034();
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
          goto LABEL_39;
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
    *v28 = v19;
    v28[1] = v18;
    result = (uint64_t)sub_24B489C50(v32, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v23));
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_24B489100(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  if (a1 > -3001)
  {
    switch(a1)
    {
      case -1003:
        result = 7;
        break;
      case -1002:
        result = 6;
        break;
      case -1001:
        result = 5;
        break;
      case -1000:
        result = 3;
        break;
      default:
        if (a1 == -2000)
        {
          result = 0;
        }
        else
        {
          if (a1 != -3000)
            return 16;
          result = 2;
        }
        break;
    }
  }
  else if (a1 > -21123)
  {
    v2 = a1 + 9008;
    result = 1;
    switch(v2)
    {
      case 0:
        result = 15;
        break;
      case 1:
        result = 9;
        break;
      case 6:
        result = 8;
        break;
      case 7:
        return result;
      case 8:
        result = 4;
        break;
      default:
        return 16;
    }
  }
  else
  {
    switch(a1)
    {
      case -300009:
        return 14;
      case -23629:
        return 12;
      case -22411:
        return 11;
      default:
        return 16;
    }
  }
  return result;
}

void sub_24B489234(uint64_t a1)
{
  char *v1;

  v1 = (char *)sub_24B489268 + 4 * byte_24B4AF507[sub_24B489100(a1)];
  __asm { BR              X10 }
}

uint64_t sub_24B489268()
{
  return 12337;
}

uint64_t sub_24B489278()
{
  return 12593;
}

uint64_t sub_24B489288()
{
  return 13105;
}

uint64_t sub_24B489298()
{
  return 13873;
}

uint64_t sub_24B4892A8()
{
  return 14129;
}

uint64_t sub_24B4892B8()
{
  return 14385;
}

uint64_t sub_24B4892C8()
{
  return 14641;
}

uint64_t sub_24B4892D8()
{
  return 12338;
}

uint64_t sub_24B4892E8()
{
  return 12594;
}

uint64_t sub_24B4892F8()
{
  return 12850;
}

uint64_t sub_24B489308()
{
  return 13106;
}

uint64_t sub_24B489318()
{
  return 13362;
}

uint64_t sub_24B489328()
{
  return 13618;
}

uint64_t sub_24B489338()
{
  return 13874;
}

uint64_t sub_24B489348()
{
  return 14130;
}

uint64_t sub_24B489358()
{
  return 12589;
}

void sub_24B489368()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_24B489394()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24B4893C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257990C18);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_24B4ADF74();
  __break(1u);
  return result;
}

void sub_24B4894CC(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  id v19;
  uint64_t ObjectType;
  int v21;
  objc_super v22;

  v21 = a4;
  ObjectType = swift_getObjectType();
  v7 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50);
  v8 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58);
  v10 = type metadata accessor for MSResult(0, v7, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&ObjectType - v12;
  v14 = v4;
  sub_24B4855FC((uint64_t)a1, a3, (uint64_t)v13);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v14) + 0x60)], v13, v10);

  v15 = a1;
  v16 = (void *)sub_24B4AD4D0();
  v18 = (objc_class *)type metadata accessor for MSAPIResponse(0, v7, v8, v17);
  v22.receiver = v14;
  v22.super_class = v18;
  v19 = objc_msgSendSuper2(&v22, sel_initWithHTTPResponse_data_bodyIsPlist_, v15, v16, v21 & 1, ObjectType);

  if (!v19)
    __break(1u);
}

void sub_24B489630(void *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  void *v15;
  uint64_t v16;
  objc_class *v17;
  id v18;
  _QWORD v19[2];
  objc_super v20;

  v19[1] = swift_getObjectType();
  v6 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x50);
  v7 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x58);
  v9 = type metadata accessor for MSResult(0, v6, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v19 - v11;
  v13 = v3;
  sub_24B4855FC((uint64_t)a1, a3, (uint64_t)v12);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v13[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v13) + 0x60)], v12, v9);

  v14 = a1;
  v15 = (void *)sub_24B4AD4D0();
  v17 = (objc_class *)type metadata accessor for MSAPIResponse(0, v6, v7, v16);
  v20.receiver = v13;
  v20.super_class = v17;
  v18 = objc_msgSendSuper2(&v20, sel_initWithHTTPResponse_data_, v14, v15);

  if (!v18)
    __break(1u);
}

void sub_24B489788(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v25;

  v23 = a4;
  v24 = a5;
  swift_getObjectType();
  v8 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v5) + 0x58);
  v22 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v5) + 0x50);
  v10 = type metadata accessor for MSResult(0, v22, v8, v9);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v21 - v12;
  v14 = v5;
  sub_24B4855FC((uint64_t)a1, a3, (uint64_t)v13);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v14[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v14) + 0x60)], v13, v10);

  v15 = a1;
  v16 = (void *)sub_24B4AD4D0();
  v17 = (void *)sub_24B4ADD1C();
  swift_bridgeObjectRelease();
  v19 = (objc_class *)type metadata accessor for MSAPIResponse(0, v22, v8, v18);
  v25.receiver = v14;
  v25.super_class = v19;
  v20 = objc_msgSendSuper2(&v25, sel_initWithHTTPResponse_data_mediaType_, v15, v16, v17);

  if (!v20)
    __break(1u);
}

void sub_24B489904()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24B489930@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990BC8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B489A68();
  sub_24B4AE040();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v9 = sub_24B4ADF8C();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_QWORD *)(a2 + 16) = 0;
  *(_BYTE *)(a2 + 24) = 1;
  *(_QWORD *)(a2 + 32) = 0;
  *(_BYTE *)(a2 + 40) = 1;
  return result;
}

unint64_t sub_24B489A68()
{
  unint64_t result;

  result = qword_257990BD0;
  if (!qword_257990BD0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF86C, &type metadata for MSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990BD0);
  }
  return result;
}

uint64_t sub_24B489AAC(uint64_t a1, unint64_t a2)
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

unint64_t sub_24B489AF0()
{
  unint64_t result;

  result = qword_257990BE0;
  if (!qword_257990BE0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF660, &type metadata for MSError);
    atomic_store(result, (unint64_t *)&qword_257990BE0);
  }
  return result;
}

unint64_t sub_24B489B34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257990BF8;
  if (!qword_257990BF8)
  {
    v1 = sub_24B489CA0(255, &qword_257990BF0);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE5BE8], v1);
    atomic_store(result, (unint64_t *)&qword_257990BF8);
  }
  return result;
}

unint64_t sub_24B489B8C()
{
  unint64_t result;

  result = qword_257990C00;
  if (!qword_257990C00)
  {
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257990C00);
  }
  return result;
}

unint64_t sub_24B489BD0()
{
  unint64_t result;

  result = qword_257990C08;
  if (!qword_257990C08)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF844, &type metadata for LegacyMSError);
    atomic_store(result, (unint64_t *)&qword_257990C08);
  }
  return result;
}

uint64_t sub_24B489C14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_24B489C50(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24B489C60(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24B489CA0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24B489CD8(__int128 *a1, uint64_t a2)
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

uint64_t sub_24B489CF0(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD20EE4](a1, v6, a5);
}

ValueMetadata *type metadata accessor for LegacyMSError()
{
  return &type metadata for LegacyMSError;
}

ValueMetadata *type metadata accessor for MSError.CodingKeys()
{
  return &type metadata for MSError.CodingKeys;
}

unint64_t sub_24B489D78()
{
  unint64_t result;

  result = qword_257990C58;
  if (!qword_257990C58)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF7F4, &type metadata for MSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C58);
  }
  return result;
}

unint64_t sub_24B489DC0()
{
  unint64_t result;

  result = qword_257990C60;
  if (!qword_257990C60)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF72C, &type metadata for MSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C60);
  }
  return result;
}

unint64_t sub_24B489E08()
{
  unint64_t result;

  result = qword_257990C68;
  if (!qword_257990C68)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF754, &type metadata for MSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C68);
  }
  return result;
}

unint64_t sub_24B489E4C()
{
  unint64_t result;

  result = qword_257990C78;
  if (!qword_257990C78)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF9AC, &type metadata for LegacyMSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C78);
  }
  return result;
}

uint64_t _s19iCloudMailAccountUI7MSErrorV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B489ED0 + 4 * byte_24B4AF518[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B489EF0 + 4 * byte_24B4AF51D[v4]))();
}

_BYTE *sub_24B489ED0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B489EF0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B489EF8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B489F00(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B489F08(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B489F10(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LegacyMSError.CodingKeys()
{
  return &type metadata for LegacyMSError.CodingKeys;
}

unint64_t sub_24B489F30()
{
  unint64_t result;

  result = qword_257990C88;
  if (!qword_257990C88)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF984, &type metadata for LegacyMSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C88);
  }
  return result;
}

unint64_t sub_24B489F78()
{
  unint64_t result;

  result = qword_257990C90;
  if (!qword_257990C90)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF8BC, &type metadata for LegacyMSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C90);
  }
  return result;
}

unint64_t sub_24B489FC0()
{
  unint64_t result;

  result = qword_257990C98;
  if (!qword_257990C98)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF8E4, &type metadata for LegacyMSError.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990C98);
  }
  return result;
}

uint64_t sub_24B48A008()
{
  uint64_t v0;
  id v1;

  if (qword_257990120 != -1)
    swift_once();
  v0 = qword_257994BC8;
  v1 = (id)qword_257994BC8;
  return v0;
}

unint64_t sub_24B48A074()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257990300);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = 4804673;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  *(_QWORD *)(inited + 48) = sub_24B4ADD1C();
  *(_QWORD *)(inited + 56) = 0x6874654D70747468;
  *(_QWORD *)(inited + 64) = 0xEA0000000000646FLL;
  *(_QWORD *)(inited + 72) = sub_24B4ADD1C();
  return sub_24B4A5BA4(inited);
}

id sub_24B48A10C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EmailSuggestionsAPIRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EmailSuggestionsAPIRequest()
{
  uint64_t result;

  result = qword_257990CC8;
  if (!qword_257990CC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B48A17C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v12[0] = a4;
  v12[1] = a5;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990E68);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B48A8D0();
  sub_24B4AE04C();
  v14 = 0;
  sub_24B4ADFB0();
  if (!v5)
  {
    v13 = 1;
    sub_24B4ADFB0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_24B48A2A4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990E98);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B48AA58();
  sub_24B4AE04C();
  v9[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990E80);
  sub_24B48AAE0(&qword_257990EA0, (uint64_t (*)(void))sub_24B48AB48, MEMORY[0x24BEE12A0]);
  sub_24B4ADFBC();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_24B48A3C0()
{
  return type metadata accessor for EmailSuggestionsAPIRequest();
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.EmailSuggestion()
{
  return &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion;
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse()
{
  return &type metadata for EmailSuggestionsAPIResponse;
}

uint64_t sub_24B48A3E8()
{
  _BYTE *v0;

  if (*v0)
    return 1701667182;
  else
    return 0x496E726574746170;
}

uint64_t sub_24B48A420@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24B48A638(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_24B48A444()
{
  sub_24B48A8D0();
  return sub_24B4AE058();
}

uint64_t sub_24B48A46C()
{
  sub_24B48A8D0();
  return sub_24B4AE064();
}

uint64_t sub_24B48A494@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_24B48A724(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_24B48A4C0(_QWORD *a1)
{
  uint64_t *v1;

  return sub_24B48A17C(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_24B48A4DC()
{
  return 0x6974736567677573;
}

uint64_t sub_24B48A4FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6974736567677573 && a2 == 0xEB00000000736E6FLL)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_24B4ADFC8();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_24B48A5A8()
{
  sub_24B48AA58();
  return sub_24B4AE058();
}

uint64_t sub_24B48A5D0()
{
  sub_24B48AA58();
  return sub_24B4AE064();
}

_QWORD *sub_24B48A5F8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_24B48A914(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_24B48A620(_QWORD *a1)
{
  uint64_t *v1;

  return sub_24B48A2A4(a1, *v1);
}

uint64_t sub_24B48A638(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x496E726574746170 && a2 == 0xE900000000000064;
  if (v2 || (sub_24B4ADFC8() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1701667182 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_24B4ADFC8();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_24B48A724(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990E58);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B48A8D0();
  sub_24B4AE040();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v11 = 0;
    v7 = sub_24B4ADF8C();
    v10 = 1;
    swift_bridgeObjectRetain();
    sub_24B4ADF8C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t sub_24B48A8D0()
{
  unint64_t result;

  result = qword_257990E60;
  if (!qword_257990E60)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFD18, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990E60);
  }
  return result;
}

_QWORD *sub_24B48A914(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990E70);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24B48AA58();
  sub_24B4AE040();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257990E80);
    sub_24B48AAE0(&qword_257990E88, (uint64_t (*)(void))sub_24B48AA9C, MEMORY[0x24BEE12D0]);
    sub_24B4ADFA4();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    v7 = (_QWORD *)v9[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v7;
}

unint64_t sub_24B48AA58()
{
  unint64_t result;

  result = qword_257990E78;
  if (!qword_257990E78)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFCC8, &type metadata for EmailSuggestionsAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990E78);
  }
  return result;
}

unint64_t sub_24B48AA9C()
{
  unint64_t result;

  result = qword_257990E90;
  if (!qword_257990E90)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFB24, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion);
    atomic_store(result, (unint64_t *)&qword_257990E90);
  }
  return result;
}

uint64_t sub_24B48AAE0(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990E80);
    v8 = a2();
    result = MEMORY[0x24BD20F50](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24B48AB48()
{
  unint64_t result;

  result = qword_257990EA8;
  if (!qword_257990EA8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFAFC, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion);
    atomic_store(result, (unint64_t *)&qword_257990EA8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for EmailSuggestionsAPIResponse.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B48ABCC + 4 * byte_24B4AFA20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B48ABEC + 4 * byte_24B4AFA25[v4]))();
}

_BYTE *sub_24B48ABCC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B48ABEC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B48ABF4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B48ABFC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B48AC04(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B48AC0C(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.CodingKeys()
{
  return &type metadata for EmailSuggestionsAPIResponse.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24B48AC74 + 4 * byte_24B4AFA2F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24B48ACA8 + 4 * byte_24B4AFA2A[v4]))();
}

uint64_t sub_24B48ACA8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B48ACB0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24B48ACB8);
  return result;
}

uint64_t sub_24B48ACC4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24B48ACCCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24B48ACD0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24B48ACD8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys()
{
  return &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys;
}

unint64_t sub_24B48ACF8()
{
  unint64_t result;

  result = qword_257990EB0;
  if (!qword_257990EB0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFBE8, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990EB0);
  }
  return result;
}

unint64_t sub_24B48AD40()
{
  unint64_t result;

  result = qword_257990EB8;
  if (!qword_257990EB8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFCA0, &type metadata for EmailSuggestionsAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990EB8);
  }
  return result;
}

unint64_t sub_24B48AD88()
{
  unint64_t result;

  result = qword_257990EC0;
  if (!qword_257990EC0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFC10, &type metadata for EmailSuggestionsAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990EC0);
  }
  return result;
}

unint64_t sub_24B48ADD0()
{
  unint64_t result;

  result = qword_257990EC8;
  if (!qword_257990EC8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFC38, &type metadata for EmailSuggestionsAPIResponse.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990EC8);
  }
  return result;
}

unint64_t sub_24B48AE18()
{
  unint64_t result;

  result = qword_257990ED0;
  if (!qword_257990ED0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFB58, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990ED0);
  }
  return result;
}

unint64_t sub_24B48AE60()
{
  unint64_t result;

  result = qword_257990ED8;
  if (!qword_257990ED8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFB80, &type metadata for EmailSuggestionsAPIResponse.EmailSuggestion.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257990ED8);
  }
  return result;
}

uint64_t sub_24B48AEA4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_24B48AEAC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24B48AEB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t sub_24B48AEBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t sub_24B48AEC4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t sub_24B48AECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t sub_24B48AED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_24B48AEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  _BYTE v13[40];
  _QWORD v14[5];

  v5 = *(void **)(v2 + 16);
  v6 = *(void **)(v2 + 24);
  v14[3] = &type metadata for EmailAvailableAPIRequestBody;
  v14[4] = sub_24B48C18C();
  v14[0] = a1;
  v14[1] = a2;
  v7 = objc_allocWithZone((Class)type metadata accessor for EmailAvailableAPIRequest());
  sub_24B48C144((uint64_t)v14, (uint64_t)v13);
  v8 = v5;
  v9 = v6;
  swift_bridgeObjectRetain();
  v10 = sub_24B494FE0(v5, v9, (uint64_t)v13);

  sub_24B480884((uint64_t)v14, &qword_257990C48);
  v11 = sub_24B48DF38();

  return v11;
}

uint64_t sub_24B48AFA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  void *v10;
  _QWORD *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _BYTE v18[40];
  _QWORD v19[5];

  v9 = *(void **)(v4 + 16);
  v10 = *(void **)(v4 + 24);
  v19[3] = &type metadata for EmailCreateAPIRequestBody;
  v19[4] = sub_24B48C0D4();
  v11 = (_QWORD *)swift_allocObject();
  v19[0] = v11;
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = a4;
  v12 = objc_allocWithZone((Class)type metadata accessor for EmailCreateAPIRequest());
  sub_24B48C144((uint64_t)v19, (uint64_t)v18);
  v13 = v9;
  v14 = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = sub_24B494FEC(v9, v14, (uint64_t)v18);

  sub_24B480884((uint64_t)v19, &qword_257990C48);
  v16 = sub_24B48E13C();

  return v16;
}

uint64_t sub_24B48B098()
{
  uint64_t v0;
  uint64_t result;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  _BYTE v6[40];
  __int128 v7;
  __int128 v8;

  result = (uint64_t)objc_msgSend(*(id *)(v0 + 24), sel_propertiesForDataclass_, *MEMORY[0x24BDB3E38]);
  if (result)
  {
    v2 = (void *)result;
    v3 = sub_24B4ADCF8();

    sub_24B48C090();
    sub_24B4ADEE4();
    if (*(_QWORD *)(v3 + 16) && (v4 = sub_24B495B80((uint64_t)v6), (v5 & 1) != 0))
    {
      sub_24B489C14(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v7);
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_24B489CF0((uint64_t)v6);
    if (*((_QWORD *)&v8 + 1))
    {
      result = swift_dynamicCast();
      if ((_DWORD)result)
        return 4;
    }
    else
    {
      sub_24B480884((uint64_t)&v7, &qword_257990C50);
      return 0;
    }
  }
  return result;
}

void sub_24B48B1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE04D48]), sel_initWithAppleAccount_grandSlamAccount_accountStore_, *(_QWORD *)(v2 + 24), 0, *(_QWORD *)(v2 + 16));
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = a1;
    *(_QWORD *)(v7 + 24) = a2;
    v10[4] = sub_24B48C070;
    v10[5] = v7;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 1107296256;
    v10[2] = sub_24B48B2BC;
    v10[3] = &block_descriptor_35;
    v8 = _Block_copy(v10);
    v9 = v6;
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_profilePictureForAccountOwnerWithCompletion_, v8);
    _Block_release(v8);

  }
  else
  {
    __break(1u);
  }
}

void sub_24B48B2BC(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_24B48B330(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  void *v29;
  id v30;
  char *v31;
  char *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v37 = a1;
  v38 = a2;
  v2 = sub_24B4ADC98();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v42 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4ADCBC();
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B4ADCA4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24B4AD560();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257990130 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
  v16 = sub_24B4AD548();
  v17 = sub_24B4ADDE8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v35 = v8;
    v19 = v7;
    v20 = v3;
    v21 = v2;
    v22 = v18;
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_24B47A000, v16, v17, "[AccountCreation - Startup] update ACAccount started", v18, 2u);
    v23 = v22;
    v2 = v21;
    v3 = v20;
    v7 = v19;
    v8 = v35;
    MEMORY[0x24BD20FF8](v23, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v24 = *(void **)(v36 + 24);
  objc_msgSend(v24, sel_setEnabled_forDataclass_, 1, *MEMORY[0x24BDB3E38]);
  sub_24B480E3C();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5490], v7);
  v25 = (void *)sub_24B4ADE60();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v26 = swift_allocObject();
  swift_weakInit();
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = v26;
  v27[3] = v24;
  v28 = v38;
  v27[4] = v37;
  v27[5] = v28;
  aBlock[4] = sub_24B48BF30;
  aBlock[5] = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_0;
  v29 = _Block_copy(aBlock);
  swift_retain();
  v30 = v24;
  swift_retain();
  v31 = v39;
  sub_24B4ADCB0();
  v43 = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  v32 = v42;
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v31, v32, v29);
  _Block_release(v29);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v32, v2);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v41);
  swift_release();
  return swift_release();
}

void sub_24B48B700(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t Strong;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD v13[6];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = *(id *)(Strong + 16);
    swift_release();
    v9 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v9;
    v10[3] = a2;
    v10[4] = a3;
    v10[5] = a4;
    v13[4] = sub_24B48BFEC;
    v13[5] = v10;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_24B4A6670;
    v13[3] = &block_descriptor_10;
    v11 = _Block_copy(v13);
    v12 = a2;
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_aa_updatePropertiesForAppleAccount_completion_, v12, v11);
    _Block_release(v11);

  }
}

void sub_24B48B870(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t Strong;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  _QWORD v15[6];

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v10 = *(id *)(Strong + 16);
    swift_release();
    v11 = swift_allocObject();
    swift_beginAccess();
    swift_weakLoadStrong();
    swift_weakInit();
    swift_release();
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v11;
    v12[3] = a4;
    v12[4] = a5;
    v12[5] = a6;
    v15[4] = sub_24B48C030;
    v15[5] = v12;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 1107296256;
    v15[2] = sub_24B4A6670;
    v15[3] = &block_descriptor_17;
    v13 = _Block_copy(v15);
    v14 = a4;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_saveVerifiedAccount_withCompletionHandler_, v14, v13);
    _Block_release(v13);

  }
}

void sub_24B48B9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t Strong;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_257990FC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = sub_24B4ADD28();
  *(_QWORD *)(inited + 40) = v10;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 56) = sub_24B4ADD28();
  *(_QWORD *)(inited + 64) = v11;
  *(_BYTE *)(inited + 72) = 0;
  v12 = sub_24B4A5DF0(inited);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v14 = *(id *)(Strong + 16);
    swift_release();
    sub_24B4A62C8(v12);
    swift_bridgeObjectRelease();
    v15 = (void *)sub_24B4ADCEC();
    swift_bridgeObjectRelease();
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a5;
    *(_QWORD *)(v16 + 24) = a6;
    aBlock[4] = sub_24B48C060;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24B4A6670;
    aBlock[3] = &block_descriptor_23;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_renewCredentialsForAccount_options_completion_, a4, v15, v17);
    _Block_release(v17);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24B48BBA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD aBlock[6];

  v6 = sub_24B4ADC98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24B4ADCBC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)aBlock - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B480E3C();
  v14 = (void *)sub_24B4ADE48();
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  aBlock[4] = sub_24B48C068;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_29;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v13, v9, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_24B48BD78(uint64_t (*a1)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v12;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257990130 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_24B4AD548();
  v8 = sub_24B4ADDE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B47A000, v7, v8, "[AccountCreation - Startup] update ACAccount successful", v9, 2u);
    MEMORY[0x24BD20FF8](v9, -1, -1);
  }

  v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return a1(v10);
}

uint64_t sub_24B48BEBC()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ACRepositoryDefault()
{
  return objc_opt_self();
}

uint64_t sub_24B48BF08()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_24B48BF30()
{
  uint64_t v0;

  sub_24B48B700(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
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

unint64_t sub_24B48BF54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257991E90;
  if (!qword_257991E90)
  {
    v1 = sub_24B4ADC98();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_257991E90);
  }
  return result;
}

unint64_t sub_24B48BF9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257991EA0;
  if (!qword_257991EA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257990558);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257991EA0);
  }
  return result;
}

void sub_24B48BFEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B48B870(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_24B48C030(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_24B48B9E0(a1, a2, v2[2], v2[3], v2[4], v2[5]);
}

uint64_t sub_24B48C03C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B48C060(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B48BBA8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_24B48C068()
{
  uint64_t v0;

  return sub_24B48BD78(*(uint64_t (**)(uint64_t))(v0 + 16));
}

uint64_t sub_24B48C070()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24B48C090()
{
  unint64_t result;

  result = qword_257990FC8;
  if (!qword_257990FC8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF474, &type metadata for AccountBagKeys.SubFeature);
    atomic_store(result, (unint64_t *)&qword_257990FC8);
  }
  return result;
}

unint64_t sub_24B48C0D4()
{
  unint64_t result;

  result = qword_257990FD0;
  if (!qword_257990FD0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEF10, &type metadata for EmailCreateAPIRequestBody);
    atomic_store(result, (unint64_t *)&qword_257990FD0);
  }
  return result;
}

uint64_t sub_24B48C118()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B48C144(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24B48C18C()
{
  unint64_t result;

  result = qword_257990FD8;
  if (!qword_257990FD8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AE9B4, &type metadata for EmailAvailableAPIRequestBody);
    atomic_store(result, (unint64_t *)&qword_257990FD8);
  }
  return result;
}

uint64_t sub_24B48C200(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  _QWORD *v17;
  NSObject *v18;
  int v19;
  BOOL v20;
  _DWORD *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  _QWORD *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  uint64_t aBlock[7];

  v57 = a3;
  v62 = a2;
  v58 = a1;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - v9;
  v11 = sub_24B4AD500();
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v55 = v13;
  v56 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v47 - v14;
  sub_24B4AD4F4();
  if (qword_257990130 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v15, v4);
  v17 = v3;
  v18 = sub_24B4AD548();
  v19 = sub_24B4ADDE8();
  v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  v53 = v8;
  v54 = v4;
  if (v20)
  {
    v49 = v19;
    v21 = (_DWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *v21 = 136315394;
    v22 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v17) + 0xD8))();
    v50 = v16;
    v51 = v15;
    v52 = v5;
    __asm { BR              X10 }
  }

  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v16(v8, v15, v4);
  v24 = v17;
  v25 = sub_24B4AD548();
  v26 = sub_24B4ADDE8();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = *(_QWORD *)((char *)v24 + qword_257990A38);
    v30 = *(_QWORD *)((char *)v24 + qword_257990A38 + 8);
    swift_bridgeObjectRetain();
    v63 = sub_24B49F648(v29, v30, aBlock);
    sub_24B4ADE90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v25, v26, "X-Apple-Request-UUID: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v28, -1, -1);
    MEMORY[0x24BD20FF8](v27, -1, -1);

    v31 = v53;
    v32 = v54;
  }
  else
  {

    v31 = v8;
    v32 = v4;
  }
  v23(v31, v32);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = v59;
  v34 = v60;
  v36 = v56;
  v37 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v56, v59, v61);
  v38 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v39 = v38 + v55;
  v40 = (v38 + v55) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  v42 = v40 + v41;
  *(_QWORD *)(v41 + 16) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v41 + v38, v36, v37);
  *(_BYTE *)(v41 + v39) = v57 & 1;
  v43 = v62;
  *(_QWORD *)(v42 + 8) = v58;
  *(_QWORD *)(v42 + 16) = v43;
  aBlock[4] = (uint64_t)sub_24B49564C;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24B48FE68;
  aBlock[3] = (uint64_t)&block_descriptor_98;
  v44 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v45 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_2579915F0);
  v64.receiver = v24;
  v64.super_class = v45;
  objc_msgSendSuper2(&v64, sel_performRequestWithHandler_, v44);
  _Block_release(v44);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v37);
}

uint64_t sub_24B48C84C(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  _QWORD *v17;
  NSObject *v18;
  int v19;
  BOOL v20;
  _DWORD *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  _QWORD *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  uint64_t aBlock[7];

  v57 = a3;
  v62 = a2;
  v58 = a1;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - v9;
  v11 = sub_24B4AD500();
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v55 = v13;
  v56 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v47 - v14;
  sub_24B4AD4F4();
  if (qword_257990130 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v15, v4);
  v17 = v3;
  v18 = sub_24B4AD548();
  v19 = sub_24B4ADDE8();
  v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  v53 = v8;
  v54 = v4;
  if (v20)
  {
    v49 = v19;
    v21 = (_DWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *v21 = 136315394;
    v22 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v17) + 0xD8))();
    v50 = v16;
    v51 = v15;
    v52 = v5;
    __asm { BR              X10 }
  }

  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v16(v8, v15, v4);
  v24 = v17;
  v25 = sub_24B4AD548();
  v26 = sub_24B4ADDE8();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = *(_QWORD *)((char *)v24 + qword_257990A38);
    v30 = *(_QWORD *)((char *)v24 + qword_257990A38 + 8);
    swift_bridgeObjectRetain();
    v63 = sub_24B49F648(v29, v30, aBlock);
    sub_24B4ADE90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v25, v26, "X-Apple-Request-UUID: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v28, -1, -1);
    MEMORY[0x24BD20FF8](v27, -1, -1);

    v31 = v53;
    v32 = v54;
  }
  else
  {

    v31 = v8;
    v32 = v4;
  }
  v23(v31, v32);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = v59;
  v34 = v60;
  v36 = v56;
  v37 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v56, v59, v61);
  v38 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v39 = v38 + v55;
  v40 = (v38 + v55) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  v42 = v40 + v41;
  *(_QWORD *)(v41 + 16) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v41 + v38, v36, v37);
  *(_BYTE *)(v41 + v39) = v57 & 1;
  v43 = v62;
  *(_QWORD *)(v42 + 8) = v58;
  *(_QWORD *)(v42 + 16) = v43;
  aBlock[4] = (uint64_t)sub_24B4954D4;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24B48FE68;
  aBlock[3] = (uint64_t)&block_descriptor_1;
  v44 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v45 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_257991598);
  v64.receiver = v24;
  v64.super_class = v45;
  objc_msgSendSuper2(&v64, sel_performRequestWithHandler_, v44);
  _Block_release(v44);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v37);
}

uint64_t sub_24B48CE98(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  _QWORD *v17;
  NSObject *v18;
  int v19;
  BOOL v20;
  _DWORD *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  _QWORD *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  uint64_t aBlock[7];

  v57 = a3;
  v62 = a2;
  v58 = a1;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - v9;
  v11 = sub_24B4AD500();
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v55 = v13;
  v56 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v47 - v14;
  sub_24B4AD4F4();
  if (qword_257990130 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v15, v4);
  v17 = v3;
  v18 = sub_24B4AD548();
  v19 = sub_24B4ADDE8();
  v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  v53 = v8;
  v54 = v4;
  if (v20)
  {
    v49 = v19;
    v21 = (_DWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *v21 = 136315394;
    v22 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v17) + 0xD8))();
    v50 = v16;
    v51 = v15;
    v52 = v5;
    __asm { BR              X10 }
  }

  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v16(v8, v15, v4);
  v24 = v17;
  v25 = sub_24B4AD548();
  v26 = sub_24B4ADDE8();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = *(_QWORD *)((char *)v24 + qword_257990A38);
    v30 = *(_QWORD *)((char *)v24 + qword_257990A38 + 8);
    swift_bridgeObjectRetain();
    v63 = sub_24B49F648(v29, v30, aBlock);
    sub_24B4ADE90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v25, v26, "X-Apple-Request-UUID: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v28, -1, -1);
    MEMORY[0x24BD20FF8](v27, -1, -1);

    v31 = v53;
    v32 = v54;
  }
  else
  {

    v31 = v8;
    v32 = v4;
  }
  v23(v31, v32);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = v59;
  v34 = v60;
  v36 = v56;
  v37 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v56, v59, v61);
  v38 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v39 = v38 + v55;
  v40 = (v38 + v55) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  v42 = v40 + v41;
  *(_QWORD *)(v41 + 16) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v41 + v38, v36, v37);
  *(_BYTE *)(v41 + v39) = v57 & 1;
  v43 = v62;
  *(_QWORD *)(v42 + 8) = v58;
  *(_QWORD *)(v42 + 16) = v43;
  aBlock[4] = (uint64_t)sub_24B495854;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24B48FE68;
  aBlock[3] = (uint64_t)&block_descriptor_177;
  v44 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v45 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_257991680);
  v64.receiver = v24;
  v64.super_class = v45;
  objc_msgSendSuper2(&v64, sel_performRequestWithHandler_, v44);
  _Block_release(v44);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v37);
}

uint64_t sub_24B48D4E4(uint64_t a1, uint64_t a2, int a3)
{
  void *v3;
  uint64_t v4;
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
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  _QWORD *v17;
  NSObject *v18;
  int v19;
  BOOL v20;
  _DWORD *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  _QWORD *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  int v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  objc_super v64;
  uint64_t aBlock[7];

  v57 = a3;
  v62 = a2;
  v58 = a1;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v47 - v9;
  v11 = sub_24B4AD500();
  v60 = *(_QWORD *)(v11 - 8);
  v61 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v55 = v13;
  v56 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v59 = (char *)&v47 - v14;
  sub_24B4AD4F4();
  if (qword_257990130 != -1)
    swift_once();
  v15 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16(v10, v15, v4);
  v17 = v3;
  v18 = sub_24B4AD548();
  v19 = sub_24B4ADDE8();
  v20 = os_log_type_enabled(v18, (os_log_type_t)v19);
  v53 = v8;
  v54 = v4;
  if (v20)
  {
    v49 = v19;
    v21 = (_DWORD *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    aBlock[0] = v48;
    *v21 = 136315394;
    v22 = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v17) + 0xD8))();
    v50 = v16;
    v51 = v15;
    v52 = v5;
    __asm { BR              X10 }
  }

  v23 = *(void (**)(char *, uint64_t))(v5 + 8);
  v23(v10, v4);
  v16(v8, v15, v4);
  v24 = v17;
  v25 = sub_24B4AD548();
  v26 = sub_24B4ADDE8();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    aBlock[0] = v28;
    *(_DWORD *)v27 = 136315138;
    v29 = *(_QWORD *)((char *)v24 + qword_257990A38);
    v30 = *(_QWORD *)((char *)v24 + qword_257990A38 + 8);
    swift_bridgeObjectRetain();
    v63 = sub_24B49F648(v29, v30, aBlock);
    sub_24B4ADE90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v25, v26, "X-Apple-Request-UUID: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v28, -1, -1);
    MEMORY[0x24BD20FF8](v27, -1, -1);

    v31 = v53;
    v32 = v54;
  }
  else
  {

    v31 = v8;
    v32 = v4;
  }
  v23(v31, v32);
  v33 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v35 = v59;
  v34 = v60;
  v36 = v56;
  v37 = v61;
  (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v56, v59, v61);
  v38 = (*(unsigned __int8 *)(v34 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
  v39 = v38 + v55;
  v40 = (v38 + v55) & 0xFFFFFFFFFFFFFFF8;
  v41 = swift_allocObject();
  v42 = v40 + v41;
  *(_QWORD *)(v41 + 16) = v33;
  (*(void (**)(unint64_t, char *, uint64_t))(v34 + 32))(v41 + v38, v36, v37);
  *(_BYTE *)(v41 + v39) = v57 & 1;
  v43 = v62;
  *(_QWORD *)(v42 + 8) = v58;
  *(_QWORD *)(v42 + 16) = v43;
  aBlock[4] = (uint64_t)sub_24B49575C;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24B48FE68;
  aBlock[3] = (uint64_t)&block_descriptor_149;
  v44 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v45 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_257991650);
  v64.receiver = v24;
  v64.super_class = v45;
  objc_msgSendSuper2(&v64, sel_performRequestWithHandler_, v44);
  _Block_release(v44);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v37);
}

uint64_t sub_24B48DB30()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v12[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579915D0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579915D8);
  swift_allocObject();
  v8 = v0;
  v12[1] = (id)sub_24B4AD59C();
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v12[0] = (id)sub_24B4ADE48();
  v9 = sub_24B4ADE24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_24B480FAC(&qword_2579915E0, &qword_2579915D8, MEMORY[0x24BDB9E58]);
  sub_24B495434();
  sub_24B4AD608();
  sub_24B480884((uint64_t)v3, &qword_257991568);

  swift_release();
  sub_24B480FAC(&qword_2579915E8, &qword_2579915D0, MEMORY[0x24BDB9A08]);
  v10 = sub_24B4AD5E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_24B48DD34()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v12[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991570);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991578);
  swift_allocObject();
  v8 = v0;
  v12[1] = (id)sub_24B4AD59C();
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v12[0] = (id)sub_24B4ADE48();
  v9 = sub_24B4ADE24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_24B480FAC(&qword_257991580, &qword_257991578, MEMORY[0x24BDB9E58]);
  sub_24B495434();
  sub_24B4AD608();
  sub_24B480884((uint64_t)v3, &qword_257991568);

  swift_release();
  sub_24B480FAC(&qword_257991590, &qword_257991570, MEMORY[0x24BDB9A08]);
  v10 = sub_24B4AD5E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_24B48DF38()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v12[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991660);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991668);
  swift_allocObject();
  v8 = v0;
  v12[1] = (id)sub_24B4AD59C();
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v12[0] = (id)sub_24B4ADE48();
  v9 = sub_24B4ADE24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_24B480FAC(&qword_257991670, &qword_257991668, MEMORY[0x24BDB9E58]);
  sub_24B495434();
  sub_24B4AD608();
  sub_24B480884((uint64_t)v3, &qword_257991568);

  swift_release();
  sub_24B480FAC(&qword_257991678, &qword_257991660, MEMORY[0x24BDB9A08]);
  v10 = sub_24B4AD5E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

uint64_t sub_24B48E13C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v12[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991568);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991630);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(swift_allocObject() + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991638);
  swift_allocObject();
  v8 = v0;
  v12[1] = (id)sub_24B4AD59C();
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v12[0] = (id)sub_24B4ADE48();
  v9 = sub_24B4ADE24();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  sub_24B480FAC(&qword_257991640, &qword_257991638, MEMORY[0x24BDB9E58]);
  sub_24B495434();
  sub_24B4AD608();
  sub_24B480884((uint64_t)v3, &qword_257991568);

  swift_release();
  sub_24B480FAC(&qword_257991648, &qword_257991630, MEMORY[0x24BDB9A08]);
  v10 = sub_24B4AD5E4();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v10;
}

void sub_24B48E340(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5, int a6, void *a7, uint64_t a8)
{
  sub_24B48ED04(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_251C5ABB0, (uint64_t)sub_24B49568C, &block_descriptor_110, (uint64_t)&unk_251C58D40, (uint64_t)&unk_251C5AB60, (uint64_t)sub_24B49565C, &block_descriptor_104);
}

void sub_24B48E3D0(void *a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5, int a6, void (*a7)(_QWORD, _QWORD, _QWORD), uint64_t a8)
{
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void (*v37)(_QWORD, _QWORD, _QWORD);
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t);
  id v41;
  void (*v42)(_QWORD, _QWORD, _QWORD);
  id v43;
  id v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  int v48;
  BOOL v49;
  uint64_t v50;
  _QWORD *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  void (*v55)(char *, uint64_t);
  id v56;
  id v57;
  uint64_t inited;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  id v72;
  _QWORD *v73;
  void *v74;
  void *v75;
  char *v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  id v80;
  void (*v81)(char *, uint64_t);
  void *v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, uint64_t);
  uint64_t v85;
  uint64_t v86;
  char *v87;
  char *v88;
  NSObject *v89;
  id v90;
  void *v91;
  void (*v92)(_QWORD, _QWORD, _QWORD);
  uint64_t v93;
  uint64_t aBlock[26];

  v92 = a7;
  LODWORD(v90) = a6;
  v89 = a3;
  aBlock[25] = *MEMORY[0x24BDAC8D0];
  v12 = sub_24B4AD560();
  v13 = *(void (**)(char *, uint64_t))(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v79 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v79 - v17;
  swift_beginAccess();
  v19 = MEMORY[0x24BD21064](a4 + 16);
  if (v19)
  {
    v20 = (void *)v19;
    v91 = a1;
    if (a2)
      v21 = objc_msgSend(a2, sel_statusCode);
    else
      v21 = 0;
    if (qword_257990130 != -1)
      swift_once();
    v87 = v16;
    v22 = __swift_project_value_buffer(v12, (uint64_t)qword_257994C18);
    v23 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v13 + 2);
    v83 = v22;
    v84 = v23;
    ((void (*)(char *))v23)(v18);
    v24 = v20;
    v25 = sub_24B4AD548();
    v26 = sub_24B4ADDE8();
    v27 = os_log_type_enabled(v25, v26);
    v88 = v24;
    if (v27)
    {
      v28 = swift_slowAlloc();
      v86 = a8;
      v81 = v13;
      v29 = v28;
      v30 = swift_slowAlloc();
      aBlock[0] = v30;
      *(_DWORD *)v29 = 134218242;
      v80 = v21;
      v93 = (uint64_t)v21;
      v85 = v12;
      v31 = v24;
      sub_24B4ADE90();
      *(_WORD *)(v29 + 12) = 2080;
      v79 = v29 + 14;
      v32 = a2;
      v34 = *(_QWORD *)&v24[qword_257990A38];
      v33 = *(_QWORD *)&v24[qword_257990A38 + 8];
      swift_bridgeObjectRetain();
      v35 = v34;
      a2 = v32;
      v36 = v91;
      v93 = sub_24B49F648(v35, v33, aBlock);
      v37 = v92;
      sub_24B4ADE90();

      v12 = v85;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B47A000, v25, v26, "[%ld] Response: X-Apple-Request-UUID: %s", (uint8_t *)v29, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24BD20FF8](v30, -1, -1);
      v38 = v29;
      v39 = v86;
      MEMORY[0x24BD20FF8](v38, -1, -1);

      v40 = (void (*)(char *, uint64_t))*((_QWORD *)v81 + 1);
      v40(v18, v12);
      if (v80 != (id)401)
        goto LABEL_15;
    }
    else
    {

      v40 = (void (*)(char *, uint64_t))*((_QWORD *)v13 + 1);
      v40(v18, v12);
      v39 = a8;
      v41 = v21;
      v36 = v91;
      v37 = v92;
      if (v41 != (id)401)
        goto LABEL_15;
    }
    if ((v90 & 1) != 0)
    {
      v81 = v40;
      v42 = v37;
      v84(v87, v83, v12);
      v43 = a2;
      v44 = v36;
      v45 = v43;
      v46 = v44;
      v47 = sub_24B4AD548();
      v48 = sub_24B4ADDF4();
      v49 = os_log_type_enabled(v47, (os_log_type_t)v48);
      v82 = a2;
      v90 = v45;
      v89 = v46;
      if (v49)
      {
        LODWORD(v84) = v48;
        v85 = v12;
        v86 = v39;
        v50 = swift_slowAlloc();
        v51 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v50 = 138412546;
        if (v36)
        {
          v52 = v89;
          aBlock[0] = (uint64_t)v89;
          v53 = v89;
          sub_24B4ADE90();
        }
        else
        {
          aBlock[0] = 0;
          sub_24B4ADE90();
          v52 = v89;
        }
        *v51 = v91;

        *(_WORD *)(v50 + 12) = 2112;
        v56 = v90;
        if (v82)
        {
          aBlock[0] = (uint64_t)v90;
          v57 = v90;
        }
        else
        {
          aBlock[0] = 0;
        }
        sub_24B4ADE90();
        v42 = v92;
        v12 = v85;
        v55 = v81;
        v51[1] = v82;

        _os_log_impl(&dword_24B47A000, v47, (os_log_type_t)v84, "401 response from server for request %@ response %@", (uint8_t *)v50, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2579915A0);
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v51, -1, -1);
        MEMORY[0x24BD20FF8](v50, -1, -1);
        v39 = v86;
      }
      else
      {

        v47 = v46;
        v55 = v81;
      }

      v55(v87, v12);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257990C38);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
      *(_QWORD *)(inited + 32) = sub_24B4ADD28();
      *(_QWORD *)(inited + 40) = v59;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
      *(_BYTE *)(inited + 48) = 1;
      *(_QWORD *)(inited + 80) = sub_24B4ADD28();
      *(_QWORD *)(inited + 88) = v60;
      *(_QWORD *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2579910B8);
      *(_QWORD *)(inited + 96) = &unk_251C58D70;
      v61 = sub_24B4A5CBC(inited);
      v62 = qword_257990A18;
      v63 = v88;
      v64 = *(void **)&v88[qword_257990A18];
      if (v64)
      {
        v65 = *(void **)&v88[qword_257990A18];
      }
      else
      {
        v66 = (void *)objc_opt_self();
        v67 = objc_msgSend(v66, sel_defaultStore);
        v68 = *(void **)&v63[v62];
        *(_QWORD *)&v63[v62] = v67;

        v69 = objc_msgSend(v66, sel_defaultStore);
        if (!v69)
        {
          __break(1u);
          return;
        }
        v65 = v69;
        v64 = 0;
      }
      v70 = *(void **)&v63[qword_257990A20];
      v71 = v64;
      v72 = v70;
      sub_24B4A5F04(v61);
      swift_bridgeObjectRelease();
      v54 = (void *)sub_24B4ADCEC();
      swift_bridgeObjectRelease();
      v73 = (_QWORD *)swift_allocObject();
      v73[2] = v42;
      v73[3] = v39;
      v74 = v82;
      v73[4] = v91;
      v73[5] = v74;
      v73[6] = v63;
      aBlock[4] = (uint64_t)sub_24B4954FC;
      aBlock[5] = (uint64_t)v73;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_24B4A6670;
      aBlock[3] = (uint64_t)&block_descriptor_63;
      v75 = _Block_copy(aBlock);
      v76 = v63;
      v77 = v89;
      v78 = v90;
      swift_retain();
      swift_release();
      objc_msgSend(v65, sel_renewCredentialsForAccount_options_completion_, v72, v54, v75);
      _Block_release(v75);

      goto LABEL_27;
    }
LABEL_15:
    v37(v36, a2, v89);
    v54 = v88;
LABEL_27:

  }
}

void sub_24B48EC74(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5, int a6, void *a7, uint64_t a8)
{
  sub_24B48ED04(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_251C5AE80, (uint64_t)sub_24B4959C0, &block_descriptor_190, (uint64_t)&unk_251C58DA0, (uint64_t)&unk_251C5AE30, (uint64_t)sub_24B495920, &block_descriptor_183);
}

void sub_24B48ED04(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5, int a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  _QWORD *v33;
  NSObject *v34;
  os_log_type_t v35;
  BOOL v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  id v56;
  id v57;
  id v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  id v70;
  id v71;
  id v72;
  NSObject *v73;
  NSObject *v74;
  os_log_type_t v75;
  BOOL v76;
  uint64_t v77;
  _QWORD *v78;
  NSObject *v79;
  void (*v80)(char *, uint64_t);
  id v81;
  id v82;
  uint64_t inited;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  void *v101;
  _QWORD *v102;
  char *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void (*v108)(char *, uint64_t, uint64_t);
  uint64_t v109;
  uint64_t v110;
  int v111;
  void *v112;
  char *v113;
  uint64_t v114;
  _QWORD *v115;
  id v116;
  char *v117;
  id v118;
  uint64_t v119;
  id v120;
  uint64_t v121;
  uint64_t aBlock;
  uint64_t v123;
  void *v124;
  void *v125;
  uint64_t v126;
  _QWORD *v127;
  uint64_t v128;

  v119 = a8;
  v115 = a5;
  v118 = a3;
  v128 = *MEMORY[0x24BDAC8D0];
  v20 = sub_24B4AD500();
  v114 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v117 = (char *)&v105 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_24B4AD560();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v105 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v105 - v27;
  swift_beginAccess();
  v29 = MEMORY[0x24BD21064](a4 + 16);
  if (!v29)
    return;
  v30 = (void *)v29;
  if (a2)
    v120 = objc_msgSend(a2, sel_statusCode);
  else
    v120 = 0;
  v110 = v20;
  v111 = a6;
  v113 = v26;
  if (qword_257990130 != -1)
    swift_once();
  v31 = __swift_project_value_buffer(v22, (uint64_t)qword_257994C18);
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
  v107 = v31;
  v108 = v32;
  ((void (*)(char *))v32)(v28);
  v33 = v30;
  v34 = sub_24B4AD548();
  v35 = sub_24B4ADDE8();
  v36 = os_log_type_enabled(v34, v35);
  v116 = a1;
  v37 = a7;
  if (v36)
  {
    v38 = swift_slowAlloc();
    v112 = a2;
    v39 = v38;
    v105 = swift_slowAlloc();
    aBlock = v105;
    *(_DWORD *)v39 = 134218242;
    v121 = (uint64_t)v120;
    v106 = v22;
    sub_24B4ADE90();
    *(_WORD *)(v39 + 12) = 2080;
    v109 = v23;
    v41 = *(_QWORD *)((char *)v33 + qword_257990A38);
    v40 = *(_QWORD *)((char *)v33 + qword_257990A38 + 8);
    swift_bridgeObjectRetain();
    v121 = sub_24B49F648(v41, v40, &aBlock);
    v22 = v106;
    sub_24B4ADE90();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v34, v35, "[%ld] Response: X-Apple-Request-UUID: %s", (uint8_t *)v39, 0x16u);
    v42 = v105;
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v42, -1, -1);
    v43 = v39;
    a2 = v112;
    MEMORY[0x24BD20FF8](v43, -1, -1);

    v109 = *(_QWORD *)(v109 + 8);
  }
  else
  {

    v109 = *(_QWORD *)(v23 + 8);
  }
  v44 = ((uint64_t (*)(char *, uint64_t))v109)(v28, v22);
  v45 = (*(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v33) + 0xF0))(v44);
  if (v45)
  {
    v46 = v45;
    swift_bridgeObjectRetain();
    sub_24B4AD4F4();
    sub_24B4AD4E8();
    v48 = v47 * 1000.0;
    if ((~*(_QWORD *)&v48 & 0x7FF0000000000000) != 0)
    {
      if (v48 > -9.22337204e18)
      {
        if (v48 < 9.22337204e18)
        {
          v49 = v22;
          v115 = v33;
          v112 = a11;
          v50 = sub_24B4ADDC4();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          aBlock = v46;
          sub_24B49496C(v50, 0x79636E6574616CLL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
          v52 = aBlock;
          swift_bridgeObjectRelease();
          v53 = sub_24B4ADDC4();
          v54 = swift_isUniquelyReferenced_nonNull_native();
          aBlock = v52;
          sub_24B49496C(v53, 0x6F43737574617473, 0xEA00000000006564, v54);
          v55 = aBlock;
          swift_bridgeObjectRelease();
          v56 = v118;
          if (v118)
          {
            v121 = (uint64_t)v118;
            v57 = v118;
            v58 = v56;
            __swift_instantiateConcreteTypeFromMangledName(&qword_257990C20);
            if (swift_dynamicCast())
            {
              v59 = v126;
              v60 = v127;
              swift_bridgeObjectRelease();
              if (v60)
                v61 = -1;
              else
                v61 = v59;
              sub_24B489234(v61);
              v62 = sub_24B4ADD1C();
              swift_bridgeObjectRelease();
              v63 = swift_isUniquelyReferenced_nonNull_native();
              aBlock = v55;
              sub_24B49496C(v62, 0x646F43726F727265, 0xE900000000000065, v63);
              v55 = aBlock;
              swift_bridgeObjectRelease();
              v64 = v118;
            }
            else
            {
              v64 = v56;
            }

          }
          v22 = v49;
          v65 = (void *)sub_24B4ADD1C();
          swift_bridgeObjectRelease();
          v66 = swift_allocObject();
          *(_QWORD *)(v66 + 16) = v55;
          v126 = a10;
          v127 = (_QWORD *)v66;
          aBlock = MEMORY[0x24BDAC760];
          v123 = 1107296256;
          v124 = sub_24B48F97C;
          v125 = v112;
          v67 = _Block_copy(&aBlock);
          swift_release();
          AnalyticsSendEventLazy();
          _Block_release(v67);

          (*(void (**)(char *, uint64_t))(v114 + 8))(v117, v110);
          v33 = v115;
          goto LABEL_23;
        }
LABEL_44:
        __break(1u);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_44;
  }
LABEL_23:
  if (v120 == (id)401 && (v111 & 1) != 0)
  {
    v118 = v37;
    v68 = a12;
    v108(v113, v107, v22);
    v69 = a2;
    v70 = v116;
    v71 = v116;
    v72 = v69;
    v73 = v71;
    v74 = sub_24B4AD548();
    v75 = sub_24B4ADDF4();
    v76 = os_log_type_enabled(v74, v75);
    v120 = v72;
    v117 = (char *)v73;
    if (v76)
    {
      v114 = a12;
      v115 = v33;
      v112 = a2;
      v77 = swift_slowAlloc();
      v78 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v77 = 138412546;
      if (v70)
      {
        aBlock = (uint64_t)v73;
        v79 = v73;
      }
      else
      {
        aBlock = 0;
      }
      sub_24B4ADE90();
      *v78 = v70;

      *(_WORD *)(v77 + 12) = 2112;
      if (v112)
      {
        v81 = v120;
        aBlock = (uint64_t)v120;
        v82 = v120;
        sub_24B4ADE90();
        v80 = (void (*)(char *, uint64_t))v109;
      }
      else
      {
        aBlock = 0;
        sub_24B4ADE90();
        v80 = (void (*)(char *, uint64_t))v109;
        v81 = v120;
      }
      a2 = v112;
      v78[1] = v112;

      _os_log_impl(&dword_24B47A000, v74, v75, "401 response from server for request %@ response %@", (uint8_t *)v77, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2579915A0);
      swift_arrayDestroy();
      MEMORY[0x24BD20FF8](v78, -1, -1);
      MEMORY[0x24BD20FF8](v77, -1, -1);
      v33 = v115;
      v68 = v114;
    }
    else
    {

      v74 = v73;
      v80 = (void (*)(char *, uint64_t))v109;
    }

    v80(v113, v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257990C38);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
    *(_QWORD *)(inited + 32) = sub_24B4ADD28();
    *(_QWORD *)(inited + 40) = v84;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 48) = 1;
    *(_QWORD *)(inited + 80) = sub_24B4ADD28();
    *(_QWORD *)(inited + 88) = v85;
    *(_QWORD *)(inited + 120) = __swift_instantiateConcreteTypeFromMangledName(&qword_2579910B8);
    *(_QWORD *)(inited + 96) = v68;
    v86 = sub_24B4A5CBC(inited);
    v87 = qword_257990A18;
    v88 = *(void **)((char *)v33 + qword_257990A18);
    if (v88)
    {
      v89 = a2;
      v90 = *(void **)((char *)v33 + qword_257990A18);
    }
    else
    {
      v91 = (void *)objc_opt_self();
      v92 = objc_msgSend(v91, sel_defaultStore);
      v93 = *(void **)((char *)v33 + v87);
      *(_QWORD *)((char *)v33 + v87) = v92;

      v94 = objc_msgSend(v91, sel_defaultStore);
      if (!v94)
      {
        __break(1u);
        return;
      }
      v90 = v94;
      v89 = a2;
      v88 = 0;
    }
    v95 = *(void **)((char *)v33 + qword_257990A20);
    v96 = v88;
    v97 = v95;
    sub_24B4A5F04(v86);
    swift_bridgeObjectRelease();
    v98 = sub_24B4ADCEC();
    swift_bridgeObjectRelease();
    v99 = (_QWORD *)swift_allocObject();
    v100 = v119;
    v99[2] = v118;
    v99[3] = v100;
    v99[4] = v116;
    v99[5] = v89;
    v99[6] = v33;
    v126 = a14;
    v127 = v99;
    aBlock = MEMORY[0x24BDAC760];
    v123 = 1107296256;
    v124 = sub_24B4A6670;
    v125 = a15;
    v101 = _Block_copy(&aBlock);
    v102 = v33;
    v103 = v117;
    v104 = v120;
    swift_retain();
    swift_release();
    objc_msgSend(v90, sel_renewCredentialsForAccount_options_completion_, v97, v98, v101);
    _Block_release(v101);

    v33 = (_QWORD *)v98;
  }
  else
  {
    ((void (*)(id, void *, id))v37)(v116, a2, v118);
  }

}

void sub_24B48F8EC(void *a1, void *a2, void *a3, uint64_t a4, _QWORD *a5, int a6, void *a7, uint64_t a8)
{
  sub_24B48ED04(a1, a2, a3, a4, a5, a6, a7, a8, (uint64_t)&unk_251C5AD18, (uint64_t)sub_24B4959C0, &block_descriptor_162, (uint64_t)&unk_251C58DD0, (uint64_t)&unk_251C5ACC8, (uint64_t)sub_24B49576C, &block_descriptor_155);
}

id sub_24B48F97C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_24B489CA0(0, &qword_2579915F8);
    v4 = (void *)sub_24B4ADCEC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_24B48FA00(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24B48FA30(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_24B48C200);
}

uint64_t sub_24B48FA0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24B48FA30(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_24B48C84C);
}

uint64_t sub_24B48FA18(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24B48FA30(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_24B48CE98);
}

uint64_t sub_24B48FA24(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_24B48FA30(a1, a2, a3, a4, a5, a6, a7, (uint64_t (*)(_QWORD, uint64_t, _QWORD))sub_24B48D4E4);
}

uint64_t sub_24B48FA30(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t (*a8)(_QWORD, uint64_t, _QWORD))
{
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
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t, uint64_t);

  v42 = a6;
  v43 = a4;
  v44 = a3;
  v41 = a2;
  v11 = sub_24B4AD560();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v41 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v41 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v41 - v22;
  if (a1)
  {
    if (a1 == 1)
    {
      if (qword_257990130 != -1)
        swift_once();
      v33 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v21, v33, v11);
      v34 = sub_24B4AD548();
      v35 = sub_24B4ADDDC();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v36 = 0;
        _os_log_impl(&dword_24B47A000, v34, v35, "auth token renew failed. User rejected.", v36, 2u);
        MEMORY[0x24BD20FF8](v36, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v21, v11);
    }
    else if (a1 == 2)
    {
      if (qword_257990130 != -1)
        swift_once();
      v24 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v23, v24, v11);
      v25 = sub_24B4AD548();
      v26 = sub_24B4ADDDC();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_24B47A000, v25, v26, "auth token renew failed.", v27, 2u);
        MEMORY[0x24BD20FF8](v27, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v23, v11);
    }
    else
    {
      if (qword_257990130 != -1)
        swift_once();
      v37 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v37, v11);
      v38 = sub_24B4AD548();
      v39 = sub_24B4ADDDC();
      if (os_log_type_enabled(v38, v39))
      {
        v40 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v40 = 0;
        _os_log_impl(&dword_24B47A000, v38, v39, "auth token renew failed. @unknown result", v40, 2u);
        MEMORY[0x24BD20FF8](v40, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
    }
    return v44(a5, v42, v41);
  }
  else
  {
    if (qword_257990130 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v18, v28, v11);
    v29 = sub_24B4AD548();
    v30 = sub_24B4ADDDC();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_24B47A000, v29, v30, "auth token renewed. Retrying request with server.", v31, 2u);
      MEMORY[0x24BD20FF8](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, v11);
    return a8(v44, v43, 0);
  }
}

void sub_24B48FE68(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(void *, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(a2, a3, a4);
  swift_release();

}

uint64_t sub_24B48FEF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v10;

  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = a1;
  *(_QWORD *)(v10 + 24) = a2;
  swift_retain();
  a6(a5, v10, 1);
  return swift_release();
}

uint64_t sub_24B48FF6C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *), uint64_t a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a8)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v12;
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
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int16 v32;

  if (a2 && (__swift_instantiateConcreteTypeFromMangledName(a6), (v12 = (_QWORD *)swift_dynamicCastClass()) != 0))
  {
    v13 = (char *)v12 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v12) + 0x60);
    v15 = *(_QWORD *)v13;
    v14 = *((_QWORD *)v13 + 1);
    v17 = *((_QWORD *)v13 + 2);
    v16 = *((_QWORD *)v13 + 3);
    v18 = *((_QWORD *)v13 + 4);
    v19 = v13[40];
    if ((v13[41] & 1) != 0)
    {
      v20 = v13[24] & 1;
      v29 = v15;
      *(_QWORD *)&v30 = v14;
      *((_QWORD *)&v30 + 1) = v17;
      *(_QWORD *)&v31 = v20;
      *((_QWORD *)&v31 + 1) = v18;
      LOBYTE(v32) = v19 & 1;
      HIBYTE(v32) = 1;
      a7(v15, v14, v17, v16, v18, v19, 1);
      swift_bridgeObjectRetain();
      a4(&v29);
      swift_bridgeObjectRelease();
      v21 = v15;
      v22 = v14;
      v23 = v17;
      v24 = v16;
      v25 = v18;
      v26 = v19;
      v27 = 1;
    }
    else
    {
      v29 = *(_QWORD *)v13;
      v30 = 0u;
      v31 = 0u;
      v32 = 0;
      a7(v15, v14, v17, v16, v18, v19, 0);
      a7(v15, v14, v17, v16, v18, v19, 0);
      swift_bridgeObjectRetain();
      a4(&v29);
      swift_bridgeObjectRelease_n();
      v21 = v15;
      v22 = v14;
      v23 = v17;
      v24 = v16;
      v25 = v18;
      v26 = v19;
      v27 = 0;
    }
  }
  else
  {
    a8 = a9;
    if (qword_257990128 != -1)
      swift_once();
    v29 = qword_257994BD0;
    v30 = xmmword_257994BD8;
    LOBYTE(v31) = byte_257994BE8;
    *((_QWORD *)&v31 + 1) = qword_257994BF0;
    LOBYTE(v32) = byte_257994BF8;
    HIBYTE(v32) = 1;
    swift_bridgeObjectRetain();
    a4(&v29);
    v21 = v29;
    v23 = *((_QWORD *)&v30 + 1);
    v22 = v30;
    v25 = *((_QWORD *)&v31 + 1);
    v24 = v31;
    v27 = HIBYTE(v32);
    v26 = v32;
  }
  return a8(v21, v22, v23, v24, v25, v26, v27);
}

uint64_t sub_24B4901A4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *))
{
  _QWORD *v5;
  char *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int16 v29;

  if (!a2
    || (__swift_instantiateConcreteTypeFromMangledName(&qword_257991688),
        (v5 = (_QWORD *)swift_dynamicCastClass()) == 0))
  {
    if (qword_257990128 != -1)
      swift_once();
    v26 = qword_257994BD0;
    v27 = xmmword_257994BD8;
    LOBYTE(v28) = byte_257994BE8;
    *((_QWORD *)&v28 + 1) = qword_257994BF0;
    LOBYTE(v29) = byte_257994BF8;
    HIBYTE(v29) = 1;
    swift_bridgeObjectRetain();
    a4(&v26);
    v18 = v26;
    v20 = *((_QWORD *)&v27 + 1);
    v19 = v27;
    v22 = *((_QWORD *)&v28 + 1);
    v21 = v28;
    v24 = HIBYTE(v29);
    v23 = v29;
    return sub_24B495950(v18, v19, v20, v21, v22, v23, v24);
  }
  v6 = (char *)v5 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v5) + 0x60);
  v7 = *v6;
  if ((v6[41] & 1) != 0)
  {
    v8 = v6[40];
    v9 = v6[24] & 1;
    v11 = *((_QWORD *)v6 + 3);
    v10 = *((_QWORD *)v6 + 4);
    v13 = *((_QWORD *)v6 + 1);
    v12 = *((_QWORD *)v6 + 2);
    v14 = *(_QWORD *)v6;
    v17 = *(_DWORD *)(v6 + 1);
    v15 = v6 + 1;
    v16 = v17;
    LOWORD(v17) = *((_WORD *)v15 + 2);
    LOBYTE(v15) = v15[6];
    LOBYTE(v26) = v7;
    HIBYTE(v26) = (_BYTE)v15;
    *(_WORD *)((char *)&v26 + 5) = v17;
    *(_DWORD *)((char *)&v26 + 1) = v16;
    *(_QWORD *)&v27 = v13;
    *((_QWORD *)&v27 + 1) = v12;
    *(_QWORD *)&v28 = v9;
    *((_QWORD *)&v28 + 1) = v10;
    LOBYTE(v29) = v8 & 1;
    HIBYTE(v29) = 1;
    sub_24B495940(v14, v13, v12, v11, v10, v8, 1);
    swift_bridgeObjectRetain();
    a4(&v26);
    swift_bridgeObjectRelease();
    v18 = v14;
    v19 = v13;
    v20 = v12;
    v21 = v11;
    v22 = v10;
    v23 = v8;
    v24 = 1;
    return sub_24B495950(v18, v19, v20, v21, v22, v23, v24);
  }
  v26 = v7 & 1;
  v27 = 0u;
  v28 = 0u;
  v29 = 0;
  return ((uint64_t (*)(uint64_t *))a4)(&v26);
}

uint64_t sub_24B49037C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *))
{
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int16 v19;

  if (a2
    && (__swift_instantiateConcreteTypeFromMangledName(&qword_257991658),
        (v5 = (_QWORD *)swift_dynamicCastClass()) != 0))
  {
    v6 = (char *)v5 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v5) + 0x60);
    v8 = *(_QWORD *)v6;
    v7 = *((_QWORD *)v6 + 1);
    v9 = *((_QWORD *)v6 + 2);
    v10 = *((_QWORD *)v6 + 4);
    v11 = v6[40];
    if ((v6[41] & 1) != 0)
    {
      v12 = v6[24] & 1;
      v14 = v8;
      v15 = v7;
      v16 = v9;
      v17 = v12;
      v18 = v10;
      LOBYTE(v19) = v11 & 1;
      HIBYTE(v19) = 1;
      sub_24B495778();
      swift_bridgeObjectRetain();
      a4(&v14);
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = *(_QWORD *)v6;
      v15 = v7;
      v17 = 0;
      v18 = 0;
      v16 = 0;
      v19 = 0;
      sub_24B495778();
      sub_24B495778();
      swift_bridgeObjectRetain();
      a4(&v14);
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    if (qword_257990128 != -1)
      swift_once();
    v14 = qword_257994BD0;
    v15 = *(_QWORD *)algn_257994BD8;
    v16 = qword_257994BE0;
    LOBYTE(v17) = byte_257994BE8;
    v18 = qword_257994BF0;
    LOBYTE(v19) = byte_257994BF8;
    HIBYTE(v19) = 1;
    swift_bridgeObjectRetain();
    a4(&v14);
  }
  return sub_24B495780();
}

uint64_t sub_24B4905A0()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24B490610()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24B490680()
{
  return sub_24B490720();
}

uint64_t sub_24B490694()
{
  return sub_24B490720();
}

uint64_t sub_24B4906A8()
{
  return sub_24B49084C();
}

uint64_t sub_24B4906BC()
{
  return sub_24B49084C();
}

uint64_t sub_24B4906D0()
{
  return sub_24B49084C();
}

uint64_t sub_24B4906E4()
{
  return sub_24B49084C();
}

uint64_t sub_24B4906F8()
{
  return sub_24B49084C();
}

uint64_t sub_24B49070C()
{
  return sub_24B490720();
}

uint64_t sub_24B490720()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24B490788()
{
  return sub_24B49084C();
}

uint64_t sub_24B49079C()
{
  return sub_24B49084C();
}

double sub_24B4907B0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  char v6;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_24B490838()
{
  return sub_24B49084C();
}

uint64_t sub_24B49084C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_24B4908B4()
{
  uint64_t result;
  char v1;

  swift_beginAccess();
  if (swift_weakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    sub_24B4AD5CC();
  }
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24B4AD5C0();
    swift_release();
    swift_release();
    result = swift_release();
    if ((v1 & 1) == 0)
    {
      result = sub_24B4ADD64();
      if (result >= 3)
      {
        swift_beginAccess();
        result = swift_weakLoadStrong();
        if (result)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          return sub_24B4AD5CC();
        }
      }
    }
  }
  return result;
}

uint64_t sub_24B490A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _BYTE v21[40];
  _OWORD v22[2];
  uint64_t v23;

  v1 = v0;
  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22[0]) = 1;
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v22[0]) = 0;
  swift_retain();
  sub_24B4AD5CC();
  if (qword_257990130 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_24B4AD548();
  v8 = sub_24B4ADDE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B47A000, v7, v8, "[AccountCreation - Startup] Fetch suggestions started", v9, 2u);
    MEMORY[0x24BD20FF8](v9, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  v10 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v1+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository+ 24));
  v11 = *(void **)(*v10 + 16);
  v12 = *(void **)(*v10 + 24);
  v13 = (objc_class *)type metadata accessor for EmailSuggestionsAPIRequest();
  memset(v22, 0, sizeof(v22));
  v23 = 0;
  v14 = objc_allocWithZone(v13);
  sub_24B480840((uint64_t)v22, (uint64_t)v21, &qword_257990C48);
  v15 = v11;
  v16 = v12;
  v17 = sub_24B494FF8(v11, v16, (uint64_t)v21, &qword_2579915F0);

  sub_24B480884((uint64_t)v22, &qword_257990C48);
  v18 = sub_24B48DB30();

  *(_QWORD *)&v22[0] = v18;
  swift_allocObject();
  swift_weakInit();
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579915B0);
  sub_24B480FAC(&qword_2579915B8, &qword_2579915B0, MEMORY[0x24BDB9AF8]);
  sub_24B4AD5FC();
  swift_release();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_24B4AD578();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24B490D8C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint8_t *v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *);
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  int v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  uint64_t v50;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - v7;
  v10 = *(_QWORD *)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 24);
  v43 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(unsigned __int8 *)(a1 + 40);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (v9)
    {
      v39 = v10;
      v40 = v11;
      v41 = v13;
      v15 = qword_257990130;
      swift_bridgeObjectRetain();
      if (v15 != -1)
        swift_once();
      v16 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
      v37 = *(void (**)(char *))(v3 + 16);
      v38 = (void (*)(char *, uint64_t))v16;
      v37(v8);
      swift_bridgeObjectRetain_n();
      v17 = sub_24B4AD548();
      v18 = sub_24B4ADDF4();
      v19 = os_log_type_enabled(v17, v18);
      v42 = v6;
      v36 = v12;
      if (v19)
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v50 = v35;
        *(_DWORD *)v20 = 136315138;
        v33 = v20 + 4;
        v34 = v20;
        v44 = v39;
        v45 = v9;
        v46 = v43;
        v47 = v40 & 1;
        v48 = v12;
        v49 = v41 & 1;
        sub_24B4881AC();
        v21 = sub_24B4ADFE0();
        v44 = sub_24B49F648(v21, v22, &v50);
        v6 = v42;
        sub_24B4ADE90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        v23 = v34;
        _os_log_impl(&dword_24B47A000, v17, v18, "[AccountCreation - Startup] Fetch suggestions failed: %s", v34, 0xCu);
        v24 = v35;
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v24, -1, -1);
        MEMORY[0x24BD20FF8](v23, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v25 = *(void (**)(char *, uint64_t))(v3 + 8);
      v25(v8, v2);
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v44) = 1;
      swift_retain();
      sub_24B4AD5CC();
      ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v37)(v6, v38, v2);
      swift_bridgeObjectRetain();
      v26 = sub_24B4AD548();
      v27 = sub_24B4ADDF4();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = swift_slowAlloc();
        v38 = v25;
        v29 = (uint8_t *)v28;
        v30 = swift_slowAlloc();
        v50 = v30;
        *(_DWORD *)v29 = 136315138;
        v44 = v39;
        v45 = v9;
        v46 = v43;
        v47 = v40 & 1;
        v48 = v36;
        v49 = v41 & 1;
        sub_24B4881AC();
        v31 = sub_24B4ADFE0();
        v44 = sub_24B49F648(v31, v32, &v50);
        sub_24B4ADE90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24B47A000, v26, v27, "%s", v29, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v30, -1, -1);
        MEMORY[0x24BD20FF8](v29, -1, -1);

        v38(v42, v2);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v25(v6, v2);
      }
    }
    swift_getKeyPath();
    swift_getKeyPath();
    v44 = 0;
    v45 = 0xE000000000000000;
    swift_retain();
    sub_24B4AD5CC();
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v44) = 0;
    return sub_24B4AD5CC();
  }
  return result;
}

uint64_t sub_24B49129C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void (*v16)(char *, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v26 - v7;
  v9 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v28 = result;
    if (qword_257990130 != -1)
      swift_once();
    v11 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
    v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v12(v8, v11, v2);
    swift_bridgeObjectRetain();
    v13 = sub_24B4AD548();
    v14 = sub_24B4ADDE8();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v15 = 134217984;
      v30 = *(_QWORD *)(v9 + 16);
      sub_24B4ADE90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B47A000, v13, v14, "[AccountCreation - Startup] Fetch suggestions successful with count: %ld", v15, 0xCu);
      MEMORY[0x24BD20FF8](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v16 = *(void (**)(char *, uint64_t))(v3 + 8);
    v16(v8, v2);
    v12(v6, v11, v2);
    swift_bridgeObjectRetain_n();
    v17 = sub_24B4AD548();
    v18 = sub_24B4ADDE8();
    if (os_log_type_enabled(v17, v18))
    {
      v27 = v16;
      v19 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v30 = v26;
      *(_DWORD *)v19 = 136642819;
      swift_bridgeObjectRetain();
      v20 = sub_24B491680();
      swift_bridgeObjectRelease();
      if (v20)
      {
        v21 = sub_24B4ADD10();
        v23 = v22;
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = 0;
        v23 = 0xE000000000000000;
      }
      v29 = sub_24B49F648(v21, v23, &v30);
      sub_24B4ADE90();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B47A000, v17, v18, "[AccountCreation - Startup] Fetch suggestions successful with suggestions: %{sensitive}s", v19, 0xCu);
      v24 = v26;
      swift_arrayDestroy();
      MEMORY[0x24BD20FF8](v24, -1, -1);
      MEMORY[0x24BD20FF8](v19, -1, -1);

      v27(v6, v2);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v16(v6, v2);
    }
    *(_QWORD *)(v28 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions) = v9;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v25 = sub_24B495174(v9);
    swift_getKeyPath();
    swift_getKeyPath();
    v30 = v25;
    return sub_24B4AD5CC();
  }
  return result;
}

uint64_t sub_24B491680()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE v11[32];
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_24B4AD434();
  swift_allocObject();
  sub_24B4AD428();
  sub_24B495590();
  v0 = sub_24B4AD41C();
  v2 = v1;
  swift_release();
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_24B4AD4D0();
  *(_QWORD *)&v16[0] = 0;
  v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_24B4ADEB4();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = v6;
    v8 = (void *)sub_24B4AD488();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_24B480840((uint64_t)v16, (uint64_t)&v13, &qword_257990C50);
  if (v14)
  {
    sub_24B489C50(&v13, v12);
    sub_24B489C14((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991550);
    if ((swift_dynamicCast() & 1) == 0)
      v15 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v9 = v15;
  }
  else
  {
    v9 = 0;
    v15 = 0;
  }
  sub_24B489AAC(v0, v2);
  sub_24B480884((uint64_t)v16, &qword_257990C50);
  return v9;
}

uint64_t sub_24B491888()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _BYTE v11[32];
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  sub_24B4AD434();
  swift_allocObject();
  sub_24B4AD428();
  sub_24B48C18C();
  v0 = sub_24B4AD41C();
  v2 = v1;
  swift_release();
  v3 = (void *)objc_opt_self();
  v4 = (void *)sub_24B4AD4D0();
  *(_QWORD *)&v16[0] = 0;
  v5 = objc_msgSend(v3, sel_JSONObjectWithData_options_error_, v4, 4, v16);

  v6 = *(id *)&v16[0];
  if (v5)
  {
    sub_24B4ADEB4();
    swift_unknownObjectRelease();
  }
  else
  {
    v7 = v6;
    v8 = (void *)sub_24B4AD488();

    swift_willThrow();
    memset(v16, 0, sizeof(v16));
  }
  sub_24B480840((uint64_t)v16, (uint64_t)&v13, &qword_257990C50);
  if (v14)
  {
    sub_24B489C50(&v13, v12);
    sub_24B489C14((uint64_t)v12, (uint64_t)v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991550);
    if ((swift_dynamicCast() & 1) == 0)
      v15 = 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    v9 = v15;
  }
  else
  {
    v9 = 0;
    v15 = 0;
  }
  sub_24B489AAC(v0, v2);
  sub_24B480884((uint64_t)v16, &qword_257990C50);
  return v9;
}

uint64_t sub_24B491A90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _BYTE v21[40];
  _OWORD v22[2];
  uint64_t v23;

  v1 = v0;
  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (qword_257990130 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_24B4AD548();
  v8 = sub_24B4ADDE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B47A000, v7, v8, "[AccountCreation - Startup] Fetch email validation rules started", v9, 2u);
    MEMORY[0x24BD20FF8](v9, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  v10 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v1+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository+ 24));
  v11 = *(void **)(*v10 + 16);
  v12 = *(void **)(*v10 + 24);
  v13 = (objc_class *)type metadata accessor for iCloudMailValidationRulesAPIRequest();
  memset(v22, 0, sizeof(v22));
  v23 = 0;
  v14 = objc_allocWithZone(v13);
  sub_24B480840((uint64_t)v22, (uint64_t)v21, &qword_257990C48);
  v15 = v11;
  v16 = v12;
  v17 = sub_24B494FF8(v11, v16, (uint64_t)v21, &qword_257991598);

  sub_24B480884((uint64_t)v22, &qword_257990C48);
  v18 = sub_24B48DD34();

  *(_QWORD *)&v22[0] = v18;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991558);
  sub_24B480FAC(&qword_257991560, &qword_257991558, MEMORY[0x24BDB9AF8]);
  sub_24B4AD5FC();
  swift_release();
  swift_release();
  swift_beginAccess();
  sub_24B4AD578();
  swift_endAccess();
  return swift_release();
}

uint64_t sub_24B491D34(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = *(_QWORD *)a1;
    v9 = *(_BYTE *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 24);
    v11 = *(_QWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 16);
    v25 = v10;
    v12 = qword_257990130;
    swift_bridgeObjectRetain();
    if (v12 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    swift_bridgeObjectRetain();
    v14 = sub_24B4AD548();
    v15 = sub_24B4ADDF4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = v11;
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v19 = v9;
      v20 = v18;
      v32 = v18;
      *(_DWORD *)v17 = 136315138;
      v23 = v17 + 4;
      v26 = v8;
      v27 = v7;
      v28 = v24;
      v29 = v25 & 1;
      v30 = v16;
      v31 = v19 & 1;
      sub_24B4881AC();
      v21 = sub_24B4ADFE0();
      v26 = sub_24B49F648(v21, v22, &v32);
      sub_24B4ADE90();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B47A000, v14, v15, "[AccountCreation - Startup] Fetch email validation rules failed: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD20FF8](v20, -1, -1);
      MEMORY[0x24BD20FF8](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  return result;
}

uint64_t sub_24B491F94(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = result;
    if (qword_257990130 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    swift_bridgeObjectRetain();
    v10 = sub_24B4AD548();
    v11 = sub_24B4ADDE8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v12 = 134217984;
      v13 = *(_QWORD *)(v6 + 16);
      sub_24B4ADE90();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24B47A000, v10, v11, "[AccountCreation - Startup] Fetch email validation rules successful, count: %ld", v12, 0xCu);
      MEMORY[0x24BD20FF8](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    *(_QWORD *)(v8 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules) = v6;
    swift_bridgeObjectRetain();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24B49217C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  char *v33;
  uint8_t *v34;
  uint8_t *v35;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD v41[2];
  char *v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v6 = sub_24B4AD560();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)v41 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v41 - v14;
  if (a2)
  {
    v45 = v13;
    if (qword_257990130 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v6, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v15, v16, v6);
    v17 = a2;
    v18 = a2;
    v19 = sub_24B4AD548();
    v20 = sub_24B4ADDF4();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v44 = a3;
      v22 = (uint8_t *)v21;
      v23 = swift_slowAlloc();
      v42 = v10;
      v24 = v23;
      v47 = v23;
      v43 = a1;
      *(_DWORD *)v22 = 136315138;
      v41[1] = v22 + 4;
      swift_getErrorValue();
      v25 = sub_24B4ADFE0();
      v46 = sub_24B49F648(v25, v26, &v47);
      a1 = v43;
      sub_24B4ADE90();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24B47A000, v19, v20, "[AccountCreation - Startup] Fetch profile picture failed: %s", v22, 0xCu);
      swift_arrayDestroy();
      v27 = v24;
      v10 = v42;
      MEMORY[0x24BD20FF8](v27, -1, -1);
      MEMORY[0x24BD20FF8](v22, -1, -1);
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v6);
    v13 = v45;
  }
  if (a1)
  {
    v28 = qword_257990130;
    v29 = a1;
    if (v28 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v6, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v30, v6);
    v31 = sub_24B4AD548();
    v32 = sub_24B4ADDE8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = v10;
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_24B47A000, v31, v32, "[AccountCreation - Startup] Fetch profile picture successful", v34, 2u);
      v35 = v34;
      v10 = v33;
      MEMORY[0x24BD20FF8](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    swift_getKeyPath();
    swift_getKeyPath();
    v47 = (uint64_t)a1;
    swift_retain();
    return sub_24B4AD5CC();
  }
  else
  {
    if (qword_257990130 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v6, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v13, v37, v6);
    v38 = sub_24B4AD548();
    v39 = sub_24B4ADDF4();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_24B47A000, v38, v39, "[AccountCreation - Startup] Fetch profile picture failed, user image is nil", v40, 2u);
      MEMORY[0x24BD20FF8](v40, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v13, v6);
  }
}

uint64_t sub_24B4925E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  unint64_t v22;

  v3 = v2;
  v6 = sub_24B4AD560();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v21) = 1;
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  v21 = 0;
  v22 = 0xE000000000000000;
  swift_retain();
  sub_24B4AD5CC();
  if (qword_257990130 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = sub_24B4AD548();
  v12 = sub_24B4ADDE8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_24B47A000, v11, v12, "[AccountCreation - Startup] Check email availability started", v13, 2u);
    MEMORY[0x24BD20FF8](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v21 = a1;
  v22 = a2;
  swift_bridgeObjectRetain();
  sub_24B4ADD70();
  v14 = v21;
  v15 = v22;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
  v21 = sub_24B48AEDC(v14, v15);
  v16 = swift_allocObject();
  swift_weakInit();
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = v16;
  v17[3] = v14;
  v17[4] = v15;
  swift_allocObject();
  swift_weakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991540);
  sub_24B480FAC(&qword_257991548, &qword_257991540, MEMORY[0x24BDB9AF8]);
  v18 = sub_24B4AD5FC();
  swift_release();
  swift_release();
  swift_release();
  v19 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall);
  *(_QWORD *)(v3 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall) = v18;
  swift_retain();
  if (v19)
  {
    sub_24B4AD584();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_24B492918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  os_log_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  os_log_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  int v42;
  void (*v43)(char *);
  void (*v44)(char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  char v54;
  uint64_t v55;

  v5 = sub_24B4AD560();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v36 - v10;
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v46 = *(_QWORD *)(a1 + 16);
  v47 = v12;
  v14 = *(_QWORD *)(a1 + 32);
  v48 = *(_QWORD *)(a1 + 24);
  v15 = *(unsigned __int8 *)(a1 + 40);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (v13)
    {
      v41 = a3;
      v42 = v15;
      v17 = qword_257990130;
      swift_bridgeObjectRetain();
      if (v17 != -1)
        swift_once();
      v18 = __swift_project_value_buffer(v5, (uint64_t)qword_257994C18);
      v43 = *(void (**)(char *))(v6 + 16);
      v44 = (void (*)(char *, uint64_t))v18;
      v43(v11);
      swift_bridgeObjectRetain_n();
      v19 = sub_24B4AD548();
      v40 = sub_24B4ADDF4();
      v20 = os_log_type_enabled(v19, (os_log_type_t)v40);
      v45 = v9;
      if (v20)
      {
        v36 = v13;
        v38 = v19;
        v39 = v14;
        v21 = (uint8_t *)swift_slowAlloc();
        v37 = swift_slowAlloc();
        v49 = v37;
        *(_DWORD *)v21 = 136642819;
        swift_bridgeObjectRetain();
        v22 = sub_24B491888();
        swift_bridgeObjectRelease();
        if (v22)
        {
          v23 = sub_24B4ADD10();
          v25 = v24;
          swift_bridgeObjectRelease();
        }
        else
        {
          v23 = 0;
          v25 = 0xE000000000000000;
        }
        v55 = sub_24B49F648(v23, v25, &v49);
        sub_24B4ADE90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        v27 = v38;
        _os_log_impl(&dword_24B47A000, v38, (os_log_type_t)v40, "[AccountCreation - Startup] params: %{sensitive}s", v21, 0xCu);
        v28 = v37;
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v28, -1, -1);
        MEMORY[0x24BD20FF8](v21, -1, -1);

        v26 = *(void (**)(char *, uint64_t))(v6 + 8);
        v26(v11, v5);
        v9 = v45;
        v14 = v39;
        v13 = v36;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v26 = *(void (**)(char *, uint64_t))(v6 + 8);
        v26(v11, v5);
      }
      ((void (*)(char *, void (*)(char *, uint64_t), uint64_t))v43)(v9, v44, v5);
      swift_bridgeObjectRetain();
      v29 = sub_24B4AD548();
      v30 = sub_24B4ADDF4();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v44 = v26;
        v33 = v32;
        v55 = v32;
        *(_DWORD *)v31 = 136315138;
        v49 = v47;
        v50 = v13;
        v51 = v46;
        v52 = v48 & 1;
        v53 = v14;
        v54 = v42 & 1;
        sub_24B4881AC();
        v34 = sub_24B4ADFE0();
        v49 = sub_24B49F648(v34, v35, &v55);
        sub_24B4ADE90();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24B47A000, v29, v30, "[AccountCreation - Startup] Check email availability failed: %s", v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v33, -1, -1);
        MEMORY[0x24BD20FF8](v31, -1, -1);

        v44(v45, v5);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v26(v9, v5);
      }
      swift_getKeyPath();
      swift_getKeyPath();
      v49 = 0;
      v50 = 0xE000000000000000;
      swift_retain();
      sub_24B4AD5CC();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(v49) = 0;
      swift_retain();
      sub_24B4AD5CC();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v49) = 0;
    return sub_24B4AD5CC();
  }
  return result;
}

uint64_t sub_24B492E74(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t result;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t ObjCClassFromMetadata;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (qword_257990130 != -1)
      swift_once();
    v8 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
    v9 = sub_24B4AD548();
    v10 = sub_24B4ADDE8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 67109120;
      LODWORD(v18) = v6;
      sub_24B4ADE90();
      _os_log_impl(&dword_24B47A000, v9, v10, "[AccountCreation - Startup] Check email availability successful, available: %{BOOL}d", v11, 8u);
      MEMORY[0x24BD20FF8](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v18) = v6 ^ 1;
    swift_retain();
    sub_24B4AD5CC();
    v12 = 0xE000000000000000;
    if ((v6 & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      _s18CurrentBundleClassCMa();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v15 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      v18 = 2777980912;
      v19 = 0xA400000000000000;
      sub_24B4ADD70();
      sub_24B4ADD70();
      v13 = sub_24B4AD470();
      v12 = v16;

      swift_bridgeObjectRelease();
    }
    swift_getKeyPath();
    swift_getKeyPath();
    v18 = v13;
    v19 = v12;
    return sub_24B4AD5CC();
  }
  return result;
}

unint64_t sub_24B493158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v19) = 1;
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v19) = 1;
  swift_retain();
  sub_24B4AD5CC();
  if (qword_257990130 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_24B4AD548();
  v8 = sub_24B4ADDE8();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_24B47A000, v7, v8, "[AccountCreation - Startup] Create iCloud Mail Account started", v9, 2u);
    MEMORY[0x24BD20FF8](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  sub_24B4ADD70();
  swift_bridgeObjectRelease();
  v11 = v19;
  v10 = v20;
  v12 = *(_QWORD *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions);
  result = sub_24B4952D0(v12, v19, v20);
  if ((v14 & 1) != 0)
  {
    v17 = 0;
    v16 = 0xE000000000000000;
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v12 + 16))
  {
    v15 = v12 + 32 * result;
    v17 = *(_QWORD *)(v15 + 32);
    v16 = *(_QWORD *)(v15 + 40);
    swift_bridgeObjectRetain();
LABEL_10:
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v1 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    v18 = sub_24B48AFA0(v17, v16, v11, v10);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = v18;
    swift_allocObject();
    swift_weakInit();
    swift_allocObject();
    swift_weakInit();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991530);
    sub_24B480FAC(&qword_257991538, &qword_257991530, MEMORY[0x24BDB9AF8]);
    sub_24B4AD5FC();
    swift_release();
    swift_release();
    swift_release();
    swift_beginAccess();
    sub_24B4AD578();
    swift_endAccess();
    return swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_24B493524(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(a1 + 8);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if (v1)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_retain();
      sub_24B4AD5CC();
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_24B4AD5CC();
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_24B4AD5CC();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24B49367C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v2 = sub_24B4AD560();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v35 - v10;
  v13 = *a1;
  v12 = a1[1];
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
    return result;
  v15 = result;
  v39 = v6;
  v40 = v9;
  v41 = v2;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_bridgeObjectRetain();
  sub_24B4ADD70();
  swift_bridgeObjectRelease();
  if (v13 == v43 && v12 == v44)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    v17 = v41;
    if (qword_257990130 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v17, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v11, v18, v17);
    v19 = sub_24B4AD548();
    v20 = sub_24B4ADDE8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_24B47A000, v19, v20, "[AccountCreation - Startup] Create iCloud Mail Account successful", v21, 2u);
      MEMORY[0x24BD20FF8](v21, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v17);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v15 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v15 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    swift_retain();
    sub_24B48B330((uint64_t)sub_24B495394, v15);
    return swift_release_n();
  }
  v16 = sub_24B4ADFC8();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
    goto LABEL_6;
  v22 = v41;
  if (qword_257990130 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v22, (uint64_t)qword_257994C18);
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v38(v40, v23, v22);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v24 = sub_24B4AD548();
  v25 = sub_24B4ADDF4();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v37 = v3;
    v27 = v26;
    v36 = swift_slowAlloc();
    v42 = v36;
    *(_DWORD *)v27 = 136643075;
    swift_bridgeObjectRetain();
    v43 = sub_24B49F648(v13, v12, &v42);
    sub_24B4ADE90();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2085;
    v35[1] = v27 + 14;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24B4AD5C0();
    swift_release();
    swift_release();
    swift_bridgeObjectRetain();
    sub_24B4ADD70();
    swift_bridgeObjectRelease();
    v43 = sub_24B49F648(v43, v44, &v42);
    sub_24B4ADE90();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24B47A000, v24, v25, "[AccountCreation - Startup] response email: %{sensitive}s, user choice: %{sensitive}s", (uint8_t *)v27, 0x16u);
    v28 = v36;
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v28, -1, -1);
    v29 = v27;
    v22 = v41;
    MEMORY[0x24BD20FF8](v29, -1, -1);

    v30 = *(void (**)(char *, uint64_t))(v37 + 8);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    v30 = *(void (**)(char *, uint64_t))(v3 + 8);
  }
  v30(v40, v22);
  v31 = v39;
  v38(v39, v23, v22);
  v32 = sub_24B4AD548();
  v33 = sub_24B4ADDF4();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_24B47A000, v32, v33, "[AccountCreation - Startup] Create iCloud Mail Account successful, but email doesn't match", v34, 2u);
    MEMORY[0x24BD20FF8](v34, -1, -1);
  }

  v30(v31, v22);
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v43) = 0;
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  LOBYTE(v43) = 0;
  return sub_24B4AD5CC();
}

uint64_t sub_24B493CB0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_24B4AD5CC();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B493DA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;

  v1 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__profileImage;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991608);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__suggestedEmails;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991610);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__inputEmail;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991618);
  v7 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
  v7(v5, v6);
  v7(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__debouncedInputEmail, v6);
  v8 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isLoading;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991620);
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isCreating, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAlert, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingFinishView, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAvailableCheckSpinner, v9);
  v7(v0+ OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__emailValidAvailableErrorMessage, v6);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__disableContinueButton, v9);
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__getSuggestionsError, v9);
  v11 = v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__errorAlert;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991628);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v10(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__passedInitialLengthThreshold, v9);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t sub_24B493FC8()
{
  sub_24B493DA0();
  return swift_deallocClassInstance();
}

uint64_t sub_24B493FEC()
{
  return _s9ViewModelCMa();
}

uint64_t _s9ViewModelCMa()
{
  uint64_t result;

  result = qword_257991090;
  if (!qword_257991090)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24B494030()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_24B4941E0(319, &qword_2579910A0, &qword_2579910A8);
  if (v0 <= 0x3F)
  {
    sub_24B4941E0(319, &qword_2579910B0, &qword_2579910B8);
    if (v1 <= 0x3F)
    {
      sub_24B49419C(319, &qword_2579910C0);
      if (v2 <= 0x3F)
      {
        sub_24B49419C(319, &qword_2579910C8);
        if (v3 <= 0x3F)
        {
          sub_24B4941E0(319, &qword_2579910D0, qword_2579910D8);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

void sub_24B49419C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_24B4AD5D8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_24B4941E0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_24B4AD5D8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_24B49422C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_24B494238@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  _s9ViewModelCMa();
  result = sub_24B4AD590();
  *a1 = result;
  return result;
}

uint64_t sub_24B49428C@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void sub_24B4942B4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_24B4ADE90();
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

uint64_t sub_24B494364(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991ED0);
  v38 = a2;
  v6 = sub_24B4ADF5C();
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
    sub_24B4AE01C();
    sub_24B4ADD58();
    result = sub_24B4AE034();
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

uint64_t sub_24B494670(uint64_t a1, char a2)
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
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991EC0);
  v6 = sub_24B4ADF5C();
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
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
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
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_24B489C50(v24, v35);
      }
      else
      {
        sub_24B489C14((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_24B4AE01C();
      sub_24B4ADD58();
      result = sub_24B4AE034();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
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
            goto LABEL_40;
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
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_24B489C50(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_24B49496C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_24B495B1C(a2, a3);
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
    sub_24B494AC8();
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
  sub_24B494364(v15, a4 & 1);
  v20 = sub_24B495B1C(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_24B4ADFD4();
  __break(1u);
}

id sub_24B494AC8()
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991ED0);
  v2 = *v0;
  v3 = sub_24B4ADF50();
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

void *sub_24B494C78()
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
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991EC0);
  v2 = *v0;
  v3 = sub_24B4ADF50();
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
    v20 = 32 * v15;
    sub_24B489C14(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_24B489C50(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t sub_24B494E5C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_24B494E78(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_24B494E78(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579915C8);
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
  result = sub_24B4ADF74();
  __break(1u);
  return result;
}

id sub_24B494FE0(void *a1, void *a2, uint64_t a3)
{
  return sub_24B494FF8(a1, a2, a3, &qword_257991680);
}

id sub_24B494FEC(void *a1, void *a2, uint64_t a3)
{
  return sub_24B494FF8(a1, a2, a3, &qword_257991650);
}

id sub_24B494FF8(void *a1, void *a2, uint64_t a3, uint64_t *a4)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  objc_class *v23;
  id v24;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  objc_super v31;

  v29 = a3;
  v30 = a4;
  v5 = v4;
  v27 = a1;
  v28 = a2;
  v6 = sub_24B4AD524();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = qword_257990A18;
  *(_QWORD *)&v5[qword_257990A18] = 0;
  v11 = (uint64_t)&v5[qword_257990A28];
  *(_QWORD *)(v11 + 32) = 0;
  *(_OWORD *)v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  *(_QWORD *)&v5[qword_257990A30] = 0;
  v12 = (uint64_t *)&v5[qword_257990A38];
  v13 = v5;
  sub_24B4AD518();
  v14 = sub_24B4AD50C();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *v12 = v14;
  v12[1] = v16;
  v17 = *(void **)&v5[v10];
  v18 = v27;
  *(_QWORD *)&v5[v10] = v27;
  v19 = v18;

  v20 = v28;
  *(_QWORD *)&v13[qword_257990A20] = v28;
  swift_beginAccess();
  v21 = v20;
  v22 = v29;
  sub_24B495520(v29, v11);
  swift_endAccess();

  v23 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(v30);
  v31.receiver = v13;
  v31.super_class = v23;
  v24 = objc_msgSendSuper2(&v31, sel_init);
  sub_24B480884(v22, &qword_257990C48);
  return v24;
}

uint64_t sub_24B495174(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_24B494E5C(0, v1, 0);
    v2 = v12;
    sub_24B480634();
    v4 = a1 + 56;
    do
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v5 = (_QWORD *)sub_24B4ADEA8();
      if (v5[2])
      {
        v7 = v5[4];
        v6 = v5[5];
        swift_bridgeObjectRetain();
      }
      else
      {
        v7 = 0;
        v6 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_24B494E5C(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v7;
      *(_QWORD *)(v10 + 40) = v6;
      v4 += 32;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_24B4952D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  _QWORD *i;
  BOOL v8;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  v6 = 0;
  for (i = (_QWORD *)(a1 + 56); ; i += 4)
  {
    v8 = *(i - 1) == a2 && *i == a3;
    if (v8 || (sub_24B4ADFC8() & 1) != 0)
      break;
    if (v3 == ++v6)
      return 0;
  }
  return v6;
}

uint64_t sub_24B495360()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24B495384(uint64_t a1)
{
  return sub_24B493524(a1);
}

uint64_t sub_24B49538C(uint64_t *a1)
{
  return sub_24B49367C(a1);
}

uint64_t sub_24B495394()
{
  return sub_24B493CB0();
}

uint64_t sub_24B4953BC()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B4953E8(uint64_t a1)
{
  uint64_t v1;

  return sub_24B492918(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_24B4953F4(unsigned __int8 *a1)
{
  return sub_24B492E74(a1);
}

uint64_t sub_24B4953FC(uint64_t *a1)
{
  return sub_24B491F94(a1);
}

uint64_t sub_24B495404(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B48FEF8(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_251C5A9A8, (uint64_t)sub_24B49548C, (void (*)(uint64_t, uint64_t, uint64_t))sub_24B48C84C);
}

unint64_t sub_24B495434()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257991588;
  if (!qword_257991588)
  {
    v1 = sub_24B489CA0(255, (unint64_t *)&qword_257990550);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_257991588);
  }
  return result;
}

uint64_t sub_24B49548C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_24B48FF6C(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16), *(_QWORD *)(v3 + 24), &qword_2579915A8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B495508, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B495514, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B4959E0);
}

uint64_t sub_24B4954D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B495860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD, _QWORD))sub_24B48E3D0);
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

uint64_t sub_24B4954FC(uint64_t a1, uint64_t a2)
{
  return sub_24B49592C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24B48FA0C);
}

uint64_t sub_24B495508()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24B495514()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B495520(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990C48);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B495578(uint64_t a1)
{
  return sub_24B490D8C(a1);
}

uint64_t sub_24B495580(uint64_t *a1)
{
  return sub_24B49129C(a1);
}

unint64_t sub_24B495590()
{
  unint64_t result;

  result = qword_2579915C0;
  if (!qword_2579915C0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AFAAC, &type metadata for EmailSuggestionsAPIResponse);
    atomic_store(result, (unint64_t *)&qword_2579915C0);
  }
  return result;
}

uint64_t sub_24B4955D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B48FEF8(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_251C5AAC0, (uint64_t)sub_24B495604, (void (*)(uint64_t, uint64_t, uint64_t))sub_24B48C200);
}

uint64_t sub_24B495604(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_24B48FF6C(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16), *(_QWORD *)(v3 + 24), &qword_257991600, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B4959E4, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B4959E0, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_24B4959E0);
}

uint64_t sub_24B49564C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B495860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD, _QWORD))sub_24B48E340);
}

uint64_t sub_24B49565C(uint64_t a1, uint64_t a2)
{
  return sub_24B49592C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24B48FA00);
}

uint64_t sub_24B495668()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B49568C()
{
  uint64_t v0;

  return j__swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24B4956B4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24B4956D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B48FEF8(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_251C5AC28, (uint64_t)sub_24B49572C, (void (*)(uint64_t, uint64_t, uint64_t))sub_24B48D4E4);
}

uint64_t sub_24B495708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B49572C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_24B49037C(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16));
}

uint64_t sub_24B495734()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24B49575C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B495860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD, _QWORD))sub_24B48F8EC);
}

uint64_t sub_24B49576C(uint64_t a1, uint64_t a2)
{
  return sub_24B49592C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24B48FA24);
}

uint64_t sub_24B495778()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24B495780()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B495788(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B48FEF8(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)&unk_251C5AD90, (uint64_t)sub_24B4957B8, (void (*)(uint64_t, uint64_t, uint64_t))sub_24B48CE98);
}

uint64_t sub_24B4957B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_24B4901A4(a1, a2, a3, *(void (**)(uint64_t *))(v3 + 16));
}

uint64_t objectdestroy_56Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_24B4AD500();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B495854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24B495860(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD, _QWORD))sub_24B48EC74);
}

uint64_t sub_24B495860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v8;
  unint64_t v9;

  v8 = *(_QWORD *)(sub_24B4AD500() - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  return a4(a1, a2, a3, *(_QWORD *)(v4 + 16), v4 + v9, *(unsigned __int8 *)(v4 + v9 + *(_QWORD *)(v8 + 64)), *(_QWORD *)(((v9 + *(_QWORD *)(v8 + 64)) & 0xFFFFFFFFFFFFFFF8) + v4 + 8), *(_QWORD *)(((v9 + *(_QWORD *)(v8 + 64)) & 0xFFFFFFFFFFFFFFF8) + v4 + 16));
}

uint64_t objectdestroy_59Tm()
{
  id *v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_24B495920(uint64_t a1, uint64_t a2)
{
  return sub_24B49592C(a1, a2, (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_24B48FA18);
}

uint64_t sub_24B49592C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v3;

  return a3(a1, a2, v3[2], v3[3], v3[4], v3[5], v3[6]);
}

uint64_t sub_24B495940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if ((a7 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_24B495950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t result;

  if ((a7 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

CGFloat sub_24B4959E8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  char v3;
  CGRect v5;
  __int128 v6;
  __int128 v7;

  v0 = sub_24B4AD440();
  if (!v0)
  {
    v6 = 0u;
    v7 = 0u;
LABEL_10:
    sub_24B495ADC((uint64_t)&v6);
    return 0.0;
  }
  v1 = v0;
  sub_24B4ADD28();
  sub_24B4ADEE4();
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_24B495B80((uint64_t)&v5), (v3 & 1) != 0))
  {
    sub_24B489C14(*(_QWORD *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    v6 = 0u;
    v7 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_24B489CF0((uint64_t)&v5);
  if (!*((_QWORD *)&v7 + 1))
    goto LABEL_10;
  type metadata accessor for CGRect(0);
  if ((swift_dynamicCast() & 1) != 0)
    return CGRectGetHeight(v5);
  return 0.0;
}

uint64_t sub_24B495ADC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990C50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24B495B1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_24B4AE01C();
  sub_24B4ADD58();
  v4 = sub_24B4AE034();
  return sub_24B495BB0(a1, a2, v4);
}

unint64_t sub_24B495B80(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24B4ADECC();
  return sub_24B495C90(a1, v2);
}

unint64_t sub_24B495BB0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_24B4ADFC8() & 1) == 0)
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
      while (!v14 && (sub_24B4ADFC8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24B495C90(uint64_t a1, uint64_t a2)
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
      sub_24B489C60(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24BD209D4](v9, a1);
      sub_24B489CF0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

_QWORD *sub_24B495D54(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24B4AD6D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24B4AD704();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = a3[7];
    *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v14 = (_QWORD *)((char *)a1 + v13);
    v15 = (_QWORD *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    v17 = a3[8];
    v18 = (char *)a1 + v17;
    v19 = (char *)a2 + v17;
    v20 = *(_QWORD *)v19;
    v21 = *((_QWORD *)v19 + 1);
    v22 = v19[16];
    swift_retain();
    sub_24B495F5C();
    *(_QWORD *)v18 = v20;
    *((_QWORD *)v18 + 1) = v21;
    v18[16] = v22;
    v23 = a3[9];
    v24 = a3[10];
    v25 = (char *)a1 + v23;
    v26 = (char *)a2 + v23;
    *v25 = *v26;
    *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
    v25[16] = v26[16];
    v27 = (char *)a1 + v24;
    v28 = (char *)a2 + v24;
    *v27 = *v28;
    *((_QWORD *)v27 + 1) = *((_QWORD *)v28 + 1);
    v29 = a3[11];
    v30 = (_QWORD *)((char *)a1 + v29);
    v31 = (_QWORD *)((char *)a2 + v29);
    v32 = v31[1];
    *v30 = *v31;
    v30[1] = v32;
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_24B495F5C()
{
  return swift_retain();
}

uint64_t sub_24B495F64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24B4AD6D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24B4AD704();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_24B496074();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B496074()
{
  return swift_release();
}

_QWORD *sub_24B49607C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24B4AD6D4();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_24B4AD704();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[8];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *((_QWORD *)v17 + 1);
  v20 = v17[16];
  swift_retain();
  sub_24B495F5C();
  *(_QWORD *)v16 = v18;
  *((_QWORD *)v16 + 1) = v19;
  v16[16] = v20;
  v21 = a3[9];
  v22 = a3[10];
  v23 = (char *)a1 + v21;
  v24 = (char *)a2 + v21;
  *v23 = *v24;
  *((_QWORD *)v23 + 1) = *((_QWORD *)v24 + 1);
  v23[16] = v24[16];
  v25 = (char *)a1 + v22;
  v26 = (char *)a2 + v22;
  *v25 = *v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  v27 = a3[11];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  v30 = v29[1];
  *v28 = *v29;
  v28[1] = v30;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_24B496258(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;

  if (a1 != a2)
  {
    sub_24B480884((uint64_t)a1, &qword_257991690);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_24B4AD6D4();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = a3[5];
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_24B480884((uint64_t)a1 + v7, &qword_257991698);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_24B4AD704();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v11 = a3[7];
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_retain();
  swift_release();
  v15 = a3[8];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(_QWORD *)v17;
  v19 = *((_QWORD *)v17 + 1);
  v20 = v17[16];
  sub_24B495F5C();
  *(_QWORD *)v16 = v18;
  *((_QWORD *)v16 + 1) = v19;
  v16[16] = v20;
  sub_24B496074();
  v21 = a3[9];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  *v22 = *((_BYTE *)a2 + v21);
  *((_QWORD *)v22 + 1) = *(_QWORD *)((char *)a2 + v21 + 8);
  swift_retain();
  swift_release();
  v22[16] = v23[16];
  v24 = a3[10];
  v25 = (char *)a1 + v24;
  v26 = (char *)a2 + v24;
  *v25 = *v26;
  *((_QWORD *)v25 + 1) = *((_QWORD *)v26 + 1);
  swift_retain();
  swift_release();
  v27 = a3[11];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_24B4964A0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_24B4AD6D4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_24B4AD704();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  v14 = a3[8];
  v15 = a3[9];
  v16 = &a1[v14];
  v17 = &a2[v14];
  v18 = *(_OWORD *)v17;
  v16[16] = v17[16];
  *(_OWORD *)v16 = v18;
  v19 = &a1[v15];
  v20 = &a2[v15];
  *(_OWORD *)v19 = *(_OWORD *)v20;
  v19[16] = v20[16];
  v21 = a3[11];
  *(_OWORD *)&a1[a3[10]] = *(_OWORD *)&a2[a3[10]];
  *(_OWORD *)&a1[v21] = *(_OWORD *)&a2[v21];
  return a1;
}

char *sub_24B496618(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  char v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  if (a1 != a2)
  {
    sub_24B480884((uint64_t)a1, &qword_257991690);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24B4AD6D4();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = a3[5];
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_24B480884((uint64_t)&a1[v8], &qword_257991698);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24B4AD704();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = a3[7];
  a1[a3[6]] = a2[a3[6]];
  *(_OWORD *)&a1[v13] = *(_OWORD *)&a2[v13];
  swift_release();
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = v16[16];
  *(_OWORD *)v15 = *(_OWORD *)v16;
  v15[16] = v17;
  sub_24B496074();
  v18 = a3[9];
  v19 = &a1[v18];
  v20 = &a2[v18];
  *v19 = a2[v18];
  *((_QWORD *)v19 + 1) = *(_QWORD *)&a2[v18 + 8];
  swift_release();
  v19[16] = v20[16];
  v21 = a3[10];
  v22 = &a1[v21];
  v23 = &a2[v21];
  *v22 = *v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  swift_release();
  v24 = a3[11];
  v25 = &a1[v24];
  v26 = &a2[v24];
  v28 = *(_QWORD *)v26;
  v27 = *((_QWORD *)v26 + 1);
  *(_QWORD *)v25 = v28;
  *((_QWORD *)v25 + 1) = v27;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24B496810()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B49681C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579916A0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(qword_2579916A8);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_24B4968CC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B4968D8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579916A0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(qword_2579916A8);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for AccountCreationStartupPageView()
{
  uint64_t result;

  result = qword_257991708;
  if (!qword_257991708)
    return swift_getSingletonMetadata();
  return result;
}

void sub_24B4969C0()
{
  unint64_t v0;
  unint64_t v1;

  sub_24B496AA4(319, &qword_257991718, (void (*)(uint64_t))MEMORY[0x24BDEC038]);
  if (v0 <= 0x3F)
  {
    sub_24B496AA4(319, qword_257991720, (void (*)(uint64_t))MEMORY[0x24BDEC2E0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_24B496AA4(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_24B4AD68C();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_24B496AF0()
{
  return swift_getOpaqueTypeConformance2();
}

double sub_24B496B00@<D0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  double result;

  *(_QWORD *)&result = sub_24B496D38(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_257990408, &qword_2579905A0).n128_u64[0];
  return result;
}

uint64_t sub_24B496B58@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20;
  char v21;
  uint64_t v22;
  void *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v20 = a19;
  v21 = a18;
  v22 = a17;
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
    sub_24B4ADE00();
    v31 = (void *)sub_24B4AD92C();
    sub_24B4AD53C();

    v21 = a18;
    v20 = a19;
    v22 = a17;
  }
  sub_24B4AD764();
  *(_QWORD *)a9 = a16;
  *(_QWORD *)(a9 + 8) = v22;
  *(_BYTE *)(a9 + 16) = v21 & 1;
  *(_QWORD *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_24B4809E0(a16, v22, v21 & 1);
  return swift_bridgeObjectRetain();
}

__n128 sub_24B496D38@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
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
    sub_24B4ADE00();
    v28 = (void *)sub_24B4AD92C();
    sub_24B4AD53C();

    v19 = a17;
  }
  sub_24B4AD764();
  sub_24B480840(v17, a9, a16);
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

uint64_t sub_24B496F04@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  int *v10;
  uint64_t *v11;
  char *v12;
  uint64_t v13;
  char v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  char *v21;
  __int128 v22[2];
  char v23;

  *a5 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  swift_storeEnumTagMultiPayload();
  v10 = (int *)type metadata accessor for AccountCreationStartupPageView();
  v11 = (uint64_t *)((char *)a5 + v10[5]);
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  swift_storeEnumTagMultiPayload();
  v12 = (char *)a5 + v10[9];
  *v12 = sub_24B4AD668() & 1;
  *((_QWORD *)v12 + 1) = v13;
  v12[16] = v14 & 1;
  v15 = (char *)a5 + v10[10];
  v23 = 0;
  sub_24B4ADBA8();
  v16 = *((_QWORD *)&v22[0] + 1);
  *v15 = v22[0];
  *((_QWORD *)v15 + 1) = v16;
  v17 = (uint64_t *)((char *)a5 + v10[11]);
  *v17 = 0xD000000000000027;
  v17[1] = 0x800000024B4B1C00;
  v18 = (uint64_t *)((char *)a5 + v10[7]);
  *v18 = a3;
  v18[1] = a4;
  *((_BYTE *)a5 + v10[6]) = a2;
  sub_24B4A21FC(a1, (uint64_t)v22);
  v19 = swift_allocObject();
  sub_24B489CD8(v22, v19 + 16);
  result = __swift_destroy_boxed_opaque_existential_1(a1);
  v21 = (char *)a5 + v10[8];
  *(_QWORD *)v21 = sub_24B4A2264;
  *((_QWORD *)v21 + 1) = v19;
  v21[16] = 0;
  return result;
}

uint64_t sub_24B497094(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  _BYTE v15[24];
  uint64_t v16;

  sub_24B4A21FC(a1, (uint64_t)v15);
  v1 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v15, v16);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (_QWORD *)((char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v4 + 16))(v3);
  v5 = *v3;
  v6 = type metadata accessor for ACRepositoryDefault();
  v14[3] = v6;
  v14[4] = &off_251C5A6B0;
  v14[0] = v5;
  _s9ViewModelCMa();
  v7 = swift_allocObject();
  v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v6);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_QWORD *)((char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v11 + 16))(v10);
  v12 = sub_24B49FE08(*v10, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v12;
}

uint64_t sub_24B4971BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t OpaqueTypeConformance2;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31[2];
  char *v32;
  uint64_t v33;
  uint64_t v34;
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
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  _OWORD v49[2];
  __int128 v50;
  __int128 v51;
  _BYTE v52[25];
  uint64_t v53;
  char v54[8];

  v43 = a2;
  v3 = type metadata accessor for AccountCreationStartupPageView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991788);
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991780);
  v37 = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991778);
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v32 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = v6;
  sub_24B49F3F8(a1, (uint64_t)v6);
  v12 = *(unsigned __int8 *)(v4 + 80);
  v39 = ((v12 + 16) & ~v12) + v5;
  v13 = (v12 + 16) & ~v12;
  v40 = v13;
  v38 = v12 | 7;
  v14 = swift_allocObject();
  sub_24B49F440((uint64_t)v6, v14 + v13);
  v31[0] = a1;
  v31[1] = _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD6A4();
  swift_getKeyPath();
  sub_24B4AD71C();
  swift_release();
  swift_release();
  v50 = v47;
  v51 = v48;
  *(_OWORD *)v52 = v49[0];
  *(_OWORD *)&v52[9] = *(_OWORD *)((char *)v49 + 9);
  sub_24B4978B8((uint64_t)&v50, 19279, 0xE200000000000000, (uint64_t)sub_24B49F484, v14);
  v53 = v50;
  sub_24B49F4D8((uint64_t)&v53);
  swift_release();
  sub_24B4807FC((uint64_t)&v51, (uint64_t)v54, qword_2579910D8);
  sub_24B49F500((uint64_t)v54);
  swift_release();
  v44 = a1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991790);
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991798);
  v17 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579917A0);
  v18 = sub_24B480FAC(&qword_2579917A8, &qword_257991798, MEMORY[0x24BDEDA10]);
  v19 = sub_24B49EBE4();
  v20 = sub_24B480FAC(&qword_2579917B8, &qword_2579917A0, MEMORY[0x24BDF43B0]);
  *(_QWORD *)&v47 = v16;
  *((_QWORD *)&v47 + 1) = &type metadata for MSError;
  *(_QWORD *)&v48 = v17;
  *((_QWORD *)&v48 + 1) = v18;
  *(_QWORD *)&v49[0] = v19;
  *((_QWORD *)&v49[0] + 1) = v20;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v22 = sub_24B480FAC(&qword_2579917C0, &qword_257991790, MEMORY[0x24BDEF170]);
  v23 = v33;
  sub_24B4ADAF4();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v23);
  *(_QWORD *)&v47 = v23;
  *((_QWORD *)&v47 + 1) = v15;
  *(_QWORD *)&v48 = OpaqueTypeConformance2;
  *((_QWORD *)&v48 + 1) = v22;
  v24 = swift_getOpaqueTypeConformance2();
  v25 = v32;
  v26 = v35;
  sub_24B4ADAB8();
  (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v26);
  sub_24B4AD6A4();
  swift_getKeyPath();
  sub_24B4AD71C();
  swift_release();
  swift_release();
  v27 = (uint64_t)v36;
  sub_24B49F3F8(v31[0], (uint64_t)v36);
  v28 = swift_allocObject();
  sub_24B49F440(v27, v28 + v40);
  v45 = v26;
  v46 = v24;
  swift_getOpaqueTypeConformance2();
  sub_24B49EC28();
  v29 = v41;
  sub_24B4ADADC();
  swift_release();
  swift_release();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v25, v29);
}

double sub_24B497784@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  char v6;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_24B497810()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B4978B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;

  v9 = a4;
  v10 = a5;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991830);
  MEMORY[0x24BD206EC](&v8);
  if (*((_QWORD *)&v8 + 1))
    swift_bridgeObjectRelease();
  sub_24B4ADC14();
  v6 = MEMORY[0x24BD206EC](&v8, v5);
  MEMORY[0x24BDAC7A8](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991798);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579917A0);
  sub_24B480FAC(&qword_2579917A8, &qword_257991798, MEMORY[0x24BDEDA10]);
  sub_24B49EBE4();
  sub_24B480FAC(&qword_2579917B8, &qword_2579917A0, MEMORY[0x24BDF43B0]);
  sub_24B4ADAD0();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B497AA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  _QWORD v16[10];

  v16[1] = a2;
  v16[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917E8);
  MEMORY[0x24BDAC7A8](v16[0]);
  v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917F0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B4AD8CC();
  MEMORY[0x24BDAC7A8](v9);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917F8);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B4AD8B4();
  v16[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991800);
  sub_24B4A0944();
  sub_24B4AD758();
  sub_24B4AD8C0();
  v16[4] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991810);
  sub_24B480FAC(&qword_257991818, &qword_257991810, MEMORY[0x24BDF4498]);
  sub_24B4AD758();
  v14 = &v4[*(int *)(v16[0] + 48)];
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v4, v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v14, v8, v5);
  sub_24B4AD890();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

uint64_t sub_24B497CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t ObjCClassFromMetadata;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t KeyPath;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v26 = a2;
  v3 = type metadata accessor for AccountCreationStartupPageView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917A0);
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v10 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v27 = 2777980912;
  v28 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v11 = sub_24B4AD470();
  v13 = v12;

  swift_bridgeObjectRelease();
  v27 = v11;
  v28 = v13;
  sub_24B49F3F8(a1, (uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = swift_allocObject();
  sub_24B49F440((uint64_t)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14);
  sub_24B480634();
  sub_24B4ADBD8();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v4) = v27;
  KeyPath = swift_getKeyPath();
  v17 = swift_allocObject();
  *(_BYTE *)(v17 + 16) = v4;
  v19 = v24;
  v18 = v25;
  v20 = v26;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 16))(v26, v8, v25);
  v21 = (uint64_t *)(v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991800) + 36));
  *v21 = KeyPath;
  v21[1] = (uint64_t)sub_24B4A2350;
  v21[2] = v17;
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v8, v18);
}

uint64_t sub_24B497FD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(_QWORD);
  uint64_t v6;

  v0 = sub_24B4AD6D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B49EC6C(&qword_257991690, v4, 0x417373696D736944, (uint64_t)v3);
  sub_24B4AD6C8();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24B498070@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  *(_QWORD *)a2 = sub_24B4AD86C();
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991820);
  return sub_24B498740(a1, (_QWORD *)(a2 + *(int *)(v4 + 44)));
}

uint64_t sub_24B4980BC@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4980D0()
{
  return sub_24B49F310();
}

__n128 sub_24B4980E4@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  char v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __n128 result;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _OWORD v43[6];
  uint64_t v44;

  v39 = a1;
  v42 = a2;
  v2 = sub_24B4AD560();
  v36 = *(_QWORD *)(v2 - 8);
  v37 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AccountCreationStartupPageView();
  v5 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  v41 = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v38 = (uint64_t)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - v8;
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v10 = v43[0];
  sub_24B4AD698();
  swift_bridgeObjectRetain();
  swift_release();
  v43[0] = v10;
  swift_bridgeObjectRetain();
  sub_24B4ADD70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = *((_QWORD *)&v43[0] + 1);
  v12 = *(_QWORD *)&v43[0];
  v13 = v39;
  sub_24B49F3F8(v39, (uint64_t)v9);
  v14 = (*(unsigned __int8 *)(v41 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v41 = swift_allocObject();
  sub_24B49F440((uint64_t)v9, v41 + v14);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  v15 = v40;
  swift_release();
  swift_release();
  swift_release();
  v16 = *(_QWORD *)&v43[0];
  v17 = *(unsigned __int8 *)(v13 + *(int *)(v15 + 24));
  v18 = v13;
  v19 = v38;
  sub_24B49F3F8(v18, v38);
  if (v17 == 1)
  {
    v34 = v11;
    v39 = v12;
    v20 = sub_24B4AD698();
    if (qword_257990130 != -1)
      swift_once();
    v21 = v37;
    v22 = __swift_project_value_buffer(v37, (uint64_t)qword_257994C18);
    v24 = v35;
    v23 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v35, v22, v21);
    v25 = sub_24B4AD548();
    v26 = sub_24B4ADDE8();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_24B47A000, v25, v26, "[AccountCreation - Startup] checking if mail enabled", v27, 2u);
      MEMORY[0x24BD20FF8](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v21);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v20 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(v20 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
    v28 = sub_24B48B098();
    swift_release();
    v12 = v39;
    v11 = v34;
  }
  else
  {
    v28 = 0;
  }
  sub_24B4A2114(v19, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  sub_24B47FE64(v12, v11, (uint64_t)sub_24B49F604, v41, v16, v28 & 1, (uint64_t)v43);
  v29 = v43[5];
  v30 = v42;
  *(_OWORD *)(v42 + 64) = v43[4];
  *(_OWORD *)(v30 + 80) = v29;
  *(_QWORD *)(v30 + 96) = v44;
  v31 = v43[1];
  *(_OWORD *)v30 = v43[0];
  *(_OWORD *)(v30 + 16) = v31;
  result = (__n128)v43[3];
  *(_OWORD *)(v30 + 32) = v43[2];
  *(__n128 *)(v30 + 48) = result;
  return result;
}

uint64_t sub_24B49853C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v4 = sub_24B4AD6D4();
  v5 = MEMORY[0x24BDEC038];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t))(a2 + *(int *)(v9 + 28)))(a1);
  sub_24B49EC6C(&qword_257991690, (uint64_t (*)(_QWORD))v5, 0x417373696D736944, (uint64_t)v8);
  sub_24B4AD6C8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
}

uint64_t sub_24B498614()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v9;

  v0 = sub_24B4AD560();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257990130 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_24B4AD548();
  v6 = sub_24B4ADDE8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_24B47A000, v5, v6, "[AccountCreation - Startup] page viewed", v7, 2u);
    MEMORY[0x24BD20FF8](v7, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_24B498740@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  char v28;

  v27 = a2;
  v3 = type metadata accessor for AccountCreationStartupPageView();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917A0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991800);
  v10 = MEMORY[0x24BDAC7A8](v26);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v25 - v13;
  sub_24B49F3F8(a1, (uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = swift_allocObject();
  sub_24B49F440((uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15);
  sub_24B4ADBCC();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v15) = v28;
  KeyPath = swift_getKeyPath();
  v18 = swift_allocObject();
  *(_BYTE *)(v18 + 16) = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v6);
  v19 = (uint64_t *)&v12[*(int *)(v26 + 36)];
  *v19 = KeyPath;
  v19[1] = (uint64_t)sub_24B4A0AA0;
  v19[2] = v18;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_24B4807FC((uint64_t)v12, (uint64_t)v14, &qword_257991800);
  sub_24B480840((uint64_t)v14, (uint64_t)v12, &qword_257991800);
  v20 = v27;
  *v27 = 0;
  *((_BYTE *)v20 + 8) = 1;
  v21 = v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991828);
  sub_24B480840((uint64_t)v12, (uint64_t)v21 + *(int *)(v22 + 48), &qword_257991800);
  v23 = (uint64_t)v21 + *(int *)(v22 + 64);
  *(_QWORD *)v23 = 0;
  *(_BYTE *)(v23 + 8) = 1;
  sub_24B480884((uint64_t)v14, &qword_257991800);
  return sub_24B480884((uint64_t)v12, &qword_257991800);
}

uint64_t sub_24B498A58()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  _QWORD v13[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24B4AD704();
  v4 = MEMORY[0x24BDEC2E0];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AccountCreationStartupPageView();
  sub_24B49EC6C(&qword_257991698, (uint64_t (*)(_QWORD))v4, 0x414C52556E65704FLL, (uint64_t)v7);
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v9 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v13[0] = 2777980912;
  v13[1] = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  sub_24B4AD470();

  swift_bridgeObjectRelease();
  sub_24B4AD4B8();
  swift_bridgeObjectRelease();
  v10 = sub_24B4AD4C4();
  v11 = *(_QWORD *)(v10 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v2, 1, v10);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_24B4AD6F8();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v2, v10);
  }
  return result;
}

uint64_t sub_24B498C78@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  uint64_t result;
  uint64_t v5;
  char v6;
  uint64_t v7;

  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADD70();
  sub_24B4ADD70();
  sub_24B4AD470();

  swift_bridgeObjectRelease();
  sub_24B480634();
  result = sub_24B4ADA28();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6 & 1;
  *(_QWORD *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_24B498DA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (**v20)();
  uint64_t v22;
  uint64_t v23;

  v23 = a1;
  v5 = sub_24B4AD74C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for AccountCreationStartupPageView();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991838);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v14 = sub_24B4AD884();
  *((_QWORD *)v14 + 1) = 0;
  v14[16] = 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991840);
  sub_24B498F90(a2, &v14[*(int *)(v15 + 44)]);
  v22 = sub_24B4AABFC();
  sub_24B49F3F8(a2, (uint64_t)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v5);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (v11 + *(unsigned __int8 *)(v6 + 80) + v16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v18 = swift_allocObject();
  sub_24B49F440((uint64_t)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v18 + v16);
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v18 + v17, v8, v5);
  sub_24B480840((uint64_t)v14, a3, &qword_257991838);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991848);
  *(_QWORD *)(a3 + *(int *)(v19 + 52)) = v22;
  v20 = (uint64_t (**)())(a3 + *(int *)(v19 + 56));
  *v20 = sub_24B4A0C88;
  v20[1] = (uint64_t (*)())v18;
  return sub_24B480884((uint64_t)v14, &qword_257991838);
}

uint64_t sub_24B498F90@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  uint64_t v68;

  v50 = a1;
  v64 = a2;
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991850);
  v60 = *(_QWORD *)(v62 - 8);
  MEMORY[0x24BDAC7A8](v62);
  v56 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991858);
  v4 = MEMORY[0x24BDAC7A8](v59);
  v63 = (uint64_t)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v58 = (char *)&v49 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v61 = (uint64_t)&v49 - v8;
  v9 = sub_24B4AD8F0();
  v54 = *(_QWORD *)(v9 - 8);
  v55 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991860);
  v51 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991868);
  v53 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991870);
  v18 = *(_QWORD *)(v52 - 8);
  v19 = MEMORY[0x24BDAC7A8](v52);
  v57 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v49 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v49 - v24;
  v65 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991878);
  sub_24B480FAC(&qword_257991880, &qword_257991878, MEMORY[0x24BDF5428]);
  v26 = (uint64_t)v56;
  sub_24B4AD9BC();
  sub_24B4AD8E4();
  v27 = sub_24B480FAC(&qword_257991888, &qword_257991860, MEMORY[0x24BDF1A30]);
  sub_24B4ADAAC();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v11, v55);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v14, v12);
  v67 = v12;
  v68 = v27;
  swift_getOpaqueTypeConformance2();
  sub_24B4ADAA0();
  (*(void (**)(char *, uint64_t))(v53 + 8))(v17, v15);
  v28 = v23;
  v29 = v52;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v25, v28, v52);
  v30 = v50;
  sub_24B49AA44(v26);
  v31 = (char *)(v30 + *(int *)(type metadata accessor for AccountCreationStartupPageView() + 40));
  v32 = *v31;
  v33 = *((_QWORD *)v31 + 1);
  LOBYTE(v67) = v32;
  v68 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  if (v66 == 1)
    v34 = sub_24B4AD950();
  else
    v34 = sub_24B4AD944();
  v35 = v34;
  v36 = v60;
  v37 = v58;
  v38 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v58, v26, v62);
  v39 = &v37[*(int *)(v59 + 36)];
  *v39 = v35;
  *(_OWORD *)(v39 + 8) = 0u;
  *(_OWORD *)(v39 + 24) = 0u;
  v39[40] = 1;
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v26, v38);
  v40 = (uint64_t)v37;
  v41 = v61;
  sub_24B4807FC(v40, v61, &qword_257991858);
  v42 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
  v43 = v57;
  v42(v57, v25, v29);
  v44 = v63;
  sub_24B480840(v41, v63, &qword_257991858);
  v45 = v64;
  v42(v64, v43, v29);
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991890);
  sub_24B480840(v44, (uint64_t)&v45[*(int *)(v46 + 48)], &qword_257991858);
  sub_24B480884(v41, &qword_257991858);
  v47 = *(void (**)(char *, uint64_t))(v18 + 8);
  v47(v25, v29);
  sub_24B480884(v44, &qword_257991858);
  return ((uint64_t (*)(char *, uint64_t))v47)(v43, v29);
}

uint64_t sub_24B499448@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  uint64_t v46[4];

  v42 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v43 = (uint64_t)&v38 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v38 - v6;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918C0);
  MEMORY[0x24BDAC7A8](v39);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918C8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v38 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v38 - v16;
  v44 = a1;
  sub_24B499974((uint64_t)v8);
  sub_24B499E98(v46);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918D0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918D8);
  sub_24B4A0EB8();
  sub_24B4A118C();
  sub_24B4A1228();
  v18 = (uint64_t)v40;
  sub_24B4ADC38();
  v19 = v17;
  v20 = v9;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v17, v15, v9);
  v21 = v18;
  sub_24B49A0FC(v18);
  v22 = (char *)(a1 + *(int *)(type metadata accessor for AccountCreationStartupPageView() + 40));
  v23 = *v22;
  v24 = *((_QWORD *)v22 + 1);
  LOBYTE(v46[0]) = v23;
  v46[1] = v24;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  if (v45 == 1)
  {
    v25 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    v46[0] = MEMORY[0x24BD20614](v25);
    v26 = sub_24B4ADBE4();
    v27 = 1;
  }
  else
  {
    v27 = 0;
    v26 = 1;
  }
  v28 = v10;
  v29 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v30 = v41;
  v31 = v20;
  v29(v41, v19, v20);
  v32 = v43;
  sub_24B480840(v18, v43, &qword_2579918B8);
  v33 = v42;
  v29(v42, v30, v31);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919A8);
  sub_24B480840(v32, (uint64_t)&v33[*(int *)(v34 + 48)], &qword_2579918B8);
  v35 = &v33[*(int *)(v34 + 64)];
  *(_QWORD *)v35 = 0;
  *((_QWORD *)v35 + 1) = v27;
  *((_QWORD *)v35 + 2) = v26;
  sub_24B4A1284(0, v27, v26);
  sub_24B480884(v21, &qword_2579918B8);
  v36 = *(void (**)(char *, uint64_t))(v28 + 8);
  v36(v19, v31);
  sub_24B4A1298(0, v27, v26);
  sub_24B480884(v32, &qword_2579918B8);
  return ((uint64_t (*)(char *, uint64_t))v36)(v30, v31);
}

uint64_t sub_24B4997C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  _QWORD v15[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B18);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991988);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v6 = sub_24B4AD86C();
  *((_QWORD *)v6 + 1) = 0;
  v6[16] = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B20);
  sub_24B49BC54(a1, (uint64_t *)&v6[*(int *)(v10 + 44)]);
  sub_24B480840((uint64_t)v6, (uint64_t)v9, &qword_257991B18);
  v11 = &v9[*(int *)(v7 + 52)];
  *(_QWORD *)v11 = 0xD000000000000013;
  *((_QWORD *)v11 + 1) = 0x800000024B4B1A80;
  sub_24B480884((uint64_t)v6, &qword_257991B18);
  v12 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v15[1] = MEMORY[0x24BD20614](v12);
  swift_retain();
  v13 = sub_24B4ADBE4();
  sub_24B480840((uint64_t)v9, a2, &qword_257991988);
  swift_release();
  *(_QWORD *)(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579918D0) + 36)) = v13;
  return sub_24B480884((uint64_t)v9, &qword_257991988);
}

uint64_t sub_24B499974@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t KeyPath;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;

  v43 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B08);
  MEMORY[0x24BDAC7A8](v1);
  v42 = (char *)&v40 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991920);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991910);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991900);
  MEMORY[0x24BDAC7A8](v40);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918F0);
  MEMORY[0x24BDAC7A8](v41);
  v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B499D18();
  v17 = sub_24B4AD944();
  sub_24B4AD644();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v6, v3);
  v26 = &v9[*(int *)(v7 + 36)];
  *v26 = v17;
  *((_QWORD *)v26 + 1) = v19;
  *((_QWORD *)v26 + 2) = v21;
  *((_QWORD *)v26 + 3) = v23;
  *((_QWORD *)v26 + 4) = v25;
  v26[40] = 0;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  LOBYTE(v3) = sub_24B4AD968();
  sub_24B480840((uint64_t)v9, (uint64_t)v12, &qword_257991920);
  v27 = &v12[*(int *)(v10 + 36)];
  *v27 = v3;
  *(_OWORD *)(v27 + 8) = 0u;
  *(_OWORD *)(v27 + 24) = 0u;
  v27[40] = 1;
  sub_24B480884((uint64_t)v9, &qword_257991920);
  sub_24B480840((uint64_t)v12, (uint64_t)v14, &qword_257991910);
  v28 = &v14[*(int *)(v40 + 36)];
  v28[32] = 0;
  *(_OWORD *)v28 = 0u;
  *((_OWORD *)v28 + 1) = 0u;
  sub_24B480884((uint64_t)v12, &qword_257991910);
  v29 = sub_24B4ADB54();
  KeyPath = swift_getKeyPath();
  sub_24B480840((uint64_t)v14, (uint64_t)v16, &qword_257991900);
  v31 = (uint64_t *)&v16[*(int *)(v41 + 36)];
  *v31 = KeyPath;
  v31[1] = v29;
  sub_24B480884((uint64_t)v14, &qword_257991900);
  v32 = sub_24B4ADA10();
  v33 = (uint64_t)v42;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v42, 1, 1, v32);
  v34 = swift_getKeyPath();
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918C0);
  v36 = v43;
  v37 = (uint64_t *)(v43 + *(int *)(v35 + 36));
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991970);
  sub_24B480840(v33, (uint64_t)v37 + *(int *)(v38 + 28), &qword_257991B08);
  *v37 = v34;
  sub_24B480840((uint64_t)v16, v36, &qword_2579918F0);
  sub_24B480884(v33, &qword_257991B08);
  return sub_24B480884((uint64_t)v16, &qword_2579918F0);
}

uint64_t sub_24B499D18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t KeyPath;
  unint64_t v6;
  uint64_t v7;
  _QWORD v9[40];
  _BYTE v10[280];
  _BYTE v11[296];
  _BYTE v12[320];

  v1 = type metadata accessor for AccountCreationStartupPageView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  v4 = sub_24B4AD884();
  sub_24B49B0E8(v0, (uint64_t)v10);
  v11[288] = 0;
  memcpy(&v11[7], v10, 0x113uLL);
  KeyPath = swift_getKeyPath();
  v9[0] = v4;
  v9[1] = 0x4030000000000000;
  LOBYTE(v9[2]) = 0;
  memcpy((char *)&v9[2] + 1, v11, 0x11AuLL);
  v9[38] = KeyPath;
  LOBYTE(v9[39]) = 1;
  sub_24B49F3F8(v0, (uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v7 = swift_allocObject();
  sub_24B49F440((uint64_t)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991928);
  sub_24B4A10F0();
  sub_24B4ADA70();
  swift_release();
  memcpy(v12, v9, 0x139uLL);
  return sub_24B4A1B80((uint64_t)v12);
}

uint64_t sub_24B499E98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[6];
  unint64_t v24;

  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  result = swift_bridgeObjectRelease();
  v3 = HIBYTE(v24) & 0xF;
  if ((v24 & 0x2000000000000000) == 0)
    v3 = *(_QWORD *)v23 & 0xFFFFFFFFFFFFLL;
  if (v3)
  {
    sub_24B4AD698();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24B4AD5C0();
    swift_release();
    swift_release();
    swift_release();
    sub_24B480634();
    v4 = sub_24B4ADA28();
    v6 = v5;
    v8 = v7 & 1;
    sub_24B4AD9B0();
    v9 = sub_24B4ADA1C();
    v11 = v10;
    v13 = v12;
    swift_release();
    v14 = v13 & 1;
    sub_24B4808C0(v4, v6, v8);
    swift_bridgeObjectRelease();
    sub_24B4ADB24();
    v15 = sub_24B4ADA04();
    v17 = v16;
    v19 = v18;
    v21 = v20;
    swift_release();
    v22 = v19 & 1;
    sub_24B4808C0(v9, v11, v14);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
    v17 = 0;
    v22 = 0;
    v21 = 0;
  }
  *a1 = v15;
  a1[1] = v17;
  a1[2] = v22;
  a1[3] = v21;
  return result;
}

uint64_t sub_24B49A0FC@<X0>(uint64_t a1@<X8>)
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
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  char v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v35;
  uint64_t ObjCClassFromMetadata;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;
  uint64_t v63;

  v59 = a1;
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919B0);
  v52 = *(_QWORD *)(v56 - 8);
  MEMORY[0x24BDAC7A8](v56);
  v51 = (char *)&v48 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919B8);
  MEMORY[0x24BDAC7A8](v53);
  v55 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B8);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919C0);
  v50 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v49 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AccountCreationStartupPageView();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v58 = (uint64_t)&v48 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v48 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - v13;
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  v15 = v1;
  swift_release();
  v16 = v60;
  sub_24B49F3F8(v1, (uint64_t)v14);
  if ((v16 & 1) != 0)
  {
    sub_24B4A2114((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
    sub_24B49F3F8(v1, (uint64_t)v12);
LABEL_4:
    sub_24B4A2114((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
    goto LABEL_5;
  }
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  v15 = v1;
  swift_release();
  v17 = v60;
  sub_24B4A2114((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  sub_24B49F3F8(v1, (uint64_t)v12);
  if ((v17 & 1) != 0)
    goto LABEL_4;
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v35 = *(_QWORD *)(v60 + 16);
  swift_bridgeObjectRelease();
  sub_24B4A2114((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  if (v35 > 1)
  {
    _s18CurrentBundleClassCMa();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v37 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
    v60 = 2777980912;
    v61 = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v38 = sub_24B4AD470();
    v40 = v39;

    swift_bridgeObjectRelease();
    v60 = v38;
    v61 = v40;
    sub_24B480634();
    v60 = sub_24B4ADA28();
    v61 = v41;
    v62 = v42 & 1;
    v63 = v43;
    MEMORY[0x24BDAC7A8](v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991A30);
    sub_24B4A14EC();
    v44 = v49;
    sub_24B4ADC2C();
    v45 = v50;
    v46 = v54;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v55, v44, v54);
    swift_storeEnumTagMultiPayload();
    sub_24B4A1670(&qword_257991A20, &qword_2579919C0, (uint64_t (*)(void))sub_24B4A14EC);
    sub_24B4A1670(&qword_257991A68, &qword_2579919B0, (uint64_t (*)(void))sub_24B4A1344);
    v32 = (uint64_t)v57;
    sub_24B4AD8A8();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v44, v46);
    goto LABEL_9;
  }
LABEL_5:
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v18 = v60;
  v19 = v58;
  sub_24B49F3F8(v15, v58);
  if (v18 == 1)
  {
    sub_24B4A2114(v19, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
LABEL_8:
    _s18CurrentBundleClassCMa();
    v21 = swift_getObjCClassFromMetadata();
    v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v21);
    v60 = 2777980912;
    v61 = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v23 = sub_24B4AD470();
    v25 = v24;

    swift_bridgeObjectRelease();
    v60 = v23;
    v61 = v25;
    sub_24B480634();
    v60 = sub_24B4ADA28();
    v61 = v26;
    v62 = v27 & 1;
    v63 = v28;
    MEMORY[0x24BDAC7A8](v60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579919D0);
    sub_24B4A1344();
    v29 = v51;
    sub_24B4ADC2C();
    v30 = v52;
    v31 = v56;
    (*(void (**)(char *, char *, uint64_t))(v52 + 16))(v55, v29, v56);
    swift_storeEnumTagMultiPayload();
    sub_24B4A1670(&qword_257991A20, &qword_2579919C0, (uint64_t (*)(void))sub_24B4A14EC);
    sub_24B4A1670(&qword_257991A68, &qword_2579919B0, (uint64_t (*)(void))sub_24B4A1344);
    v32 = (uint64_t)v57;
    sub_24B4AD8A8();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v29, v31);
LABEL_9:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919C8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
    return sub_24B4807FC(v32, v59, &qword_2579918B8);
  }
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v20 = v60;
  sub_24B4A2114(v19, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  if (v20 == 1)
    goto LABEL_8;
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919C8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 56))(v59, 1, 1, v47);
}

uint64_t sub_24B49AA44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t KeyPath;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned __int8 v35;
  uint64_t (*v36)();
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE *(*v41)(_BYTE *);
  uint64_t v42;

  v26 = a1;
  v2 = type metadata accessor for AccountCreationStartupPageView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v25 = v1;
  v20[1] = _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD6A4();
  swift_getKeyPath();
  sub_24B4AD71C();
  swift_release();
  swift_release();
  v24 = v33;
  v23 = v34;
  v22 = v35;
  sub_24B49F3F8(v1, (uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v21 = swift_allocObject();
  sub_24B49F440((uint64_t)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v21 + v5);
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v29 = 2777980912;
  v30 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v9 = sub_24B4AD470();
  v11 = v10;

  swift_bridgeObjectRelease();
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v12 = v33;
  KeyPath = swift_getKeyPath();
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = v12;
  v33 = v24;
  v34 = v23;
  v35 = v22;
  v36 = sub_24B4A0D1C;
  v37 = v21;
  v38 = v9;
  v39 = v11;
  v40 = KeyPath;
  v41 = sub_24B4A2350;
  v42 = v14;
  v15 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  v29 = 2777980912;
  v30 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v16 = sub_24B4AD470();
  v18 = v17;

  swift_bridgeObjectRelease();
  v31 = v16;
  v32 = v18;
  sub_24B4AD6A4();
  swift_getKeyPath();
  sub_24B4AD71C();
  swift_release();
  swift_release();
  v28 = v25;
  v27 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991898);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579917A0);
  sub_24B4A0DD8();
  sub_24B480634();
  sub_24B480FAC(&qword_2579917B8, &qword_2579917A0, MEMORY[0x24BDF43B0]);
  sub_24B4ADA88();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_24B49AF88()
{
  sub_24B4ADC74();
  sub_24B4AD710();
  return swift_release();
}

uint64_t sub_24B49AFF0(double a1)
{
  BOOL v1;
  uint64_t result;

  v1 = a1 > 0.0;
  type metadata accessor for AccountCreationStartupPageView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBC0();
  result = sub_24B4ADBB4();
  if (v1)
  {
    sub_24B4ADC8C();
    return sub_24B4AD740();
  }
  return result;
}

void sub_24B49B0E8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30[10];
  _OWORD v31[9];
  _BYTE v32[27];
  _BYTE v33[178];
  char v34;
  __int128 v35;
  _BYTE v36[179];
  uint64_t v37[2];
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int16 v50;

  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v4 = MEMORY[0x24BD20614](objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, 0.784313725, 0.956862745, 1.0, 1.0));
  sub_24B4ACAE0(v37[0], v4, v30);
  v5 = sub_24B4AD884();
  sub_24B49B50C(a1, (uint64_t)v31);
  v34 = 0;
  *(_OWORD *)&v33[71] = v31[4];
  *(_OWORD *)&v33[55] = v31[3];
  *(_OWORD *)&v33[119] = v31[7];
  *(_OWORD *)&v33[135] = v31[8];
  *(_OWORD *)&v33[151] = *(_OWORD *)v32;
  *(_OWORD *)&v33[162] = *(_OWORD *)&v32[11];
  *(_OWORD *)&v33[87] = v31[5];
  *(_OWORD *)&v33[103] = v31[6];
  *(_OWORD *)&v33[7] = v31[0];
  *(_OWORD *)&v33[23] = v31[1];
  *(_OWORD *)&v33[39] = v31[2];
  *(_QWORD *)&v35 = v5;
  *((_QWORD *)&v35 + 1) = 0x4010000000000000;
  v36[0] = 0;
  v6 = *(_OWORD *)&v33[48];
  *(_OWORD *)&v36[49] = *(_OWORD *)&v33[48];
  v7 = *(_OWORD *)&v33[32];
  *(_OWORD *)&v36[33] = *(_OWORD *)&v33[32];
  v8 = *(_OWORD *)&v33[16];
  *(_OWORD *)&v36[17] = *(_OWORD *)&v33[16];
  v9 = *(_OWORD *)v33;
  *(_OWORD *)&v36[1] = *(_OWORD *)v33;
  v10 = *(_OWORD *)&v33[112];
  *(_OWORD *)&v36[113] = *(_OWORD *)&v33[112];
  v11 = *(_OWORD *)&v33[96];
  *(_OWORD *)&v36[97] = *(_OWORD *)&v33[96];
  v12 = *(_OWORD *)&v33[80];
  *(_OWORD *)&v36[81] = *(_OWORD *)&v33[80];
  v13 = *(_OWORD *)&v33[64];
  *(_OWORD *)&v36[65] = *(_OWORD *)&v33[64];
  v14 = *(_OWORD *)&v33[160];
  *(_OWORD *)&v36[161] = *(_OWORD *)&v33[160];
  v15 = *(_OWORD *)&v33[144];
  *(_OWORD *)&v36[145] = *(_OWORD *)&v33[144];
  v16 = *(_OWORD *)&v33[128];
  *(_OWORD *)&v36[129] = *(_OWORD *)&v33[128];
  v17 = *(_OWORD *)&v36[160];
  *(_OWORD *)(a2 + 240) = *(_OWORD *)&v36[144];
  *(_OWORD *)(a2 + 256) = v17;
  v18 = *(_OWORD *)&v36[96];
  *(_OWORD *)(a2 + 176) = *(_OWORD *)&v36[80];
  *(_OWORD *)(a2 + 192) = v18;
  v19 = *(_OWORD *)&v36[128];
  *(_OWORD *)(a2 + 208) = *(_OWORD *)&v36[112];
  *(_OWORD *)(a2 + 224) = v19;
  v20 = *(_OWORD *)&v36[32];
  *(_OWORD *)(a2 + 112) = *(_OWORD *)&v36[16];
  *(_OWORD *)(a2 + 128) = v20;
  v21 = *(_OWORD *)&v36[64];
  *(_OWORD *)(a2 + 144) = *(_OWORD *)&v36[48];
  *(_OWORD *)(a2 + 160) = v21;
  v22 = *(_OWORD *)v36;
  *(_OWORD *)(a2 + 80) = v35;
  *(_OWORD *)(a2 + 96) = v22;
  *(double *)(a2 + 8) = v30[1];
  *(double *)(a2 + 24) = v30[3];
  *(double *)(a2 + 40) = v30[5];
  *(double *)(a2 + 56) = v30[7];
  v47 = v16;
  v48 = v15;
  v49 = v14;
  v23 = v30[0];
  v24 = v30[2];
  v25 = v30[4];
  v26 = v30[6];
  v27 = v30[8];
  v28 = v30[9];
  *(_WORD *)&v36[177] = *(_WORD *)&v33[176];
  *(_DWORD *)(a2 + 271) = *(_DWORD *)&v36[175];
  *(double *)a2 = v23;
  *(double *)(a2 + 16) = v24;
  *(double *)(a2 + 32) = v25;
  *(double *)(a2 + 48) = v26;
  *(double *)(a2 + 64) = v27;
  *(double *)(a2 + 72) = v28;
  v37[0] = v5;
  v37[1] = 0x4010000000000000;
  v38 = 0;
  v50 = *(_WORD *)&v33[176];
  v43 = v13;
  v44 = v12;
  v45 = v11;
  v46 = v10;
  v39 = v9;
  v40 = v8;
  v41 = v7;
  v42 = v6;
  swift_retain();
  swift_retain();
  v29 = *(id *)&v23;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_24B4A1CE4((uint64_t)&v35);
  sub_24B4A1DD4((uint64_t)v37);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

uint64_t sub_24B49B50C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjCClassFromMetadata;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  id v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t KeyPath;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t v70;
  unint64_t v71;

  v60 = a1;
  v61 = type metadata accessor for AccountCreationStartupPageView();
  v3 = MEMORY[0x24BDAC7A8](v61);
  v59 = (uint64_t)&v56 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v56 - v5;
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v57 = (id)objc_opt_self();
  v58 = ObjCClassFromMetadata;
  v7 = objc_msgSend(v57, sel_bundleForClass_, ObjCClassFromMetadata);
  v70 = 2777980912;
  v71 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v8 = sub_24B4AD470();
  v10 = v9;

  swift_bridgeObjectRelease();
  v70 = v8;
  v71 = v10;
  v56 = sub_24B480634();
  v11 = sub_24B4ADA28();
  v13 = v12;
  LOBYTE(v10) = v14 & 1;
  sub_24B4AD980();
  v15 = sub_24B4ADA1C();
  v17 = v16;
  v19 = v18;
  swift_release();
  sub_24B4808C0(v11, v13, v10);
  swift_bridgeObjectRelease();
  sub_24B4AD998();
  v20 = sub_24B4AD9C8();
  v67 = v21;
  v68 = v20;
  v65 = v22;
  v63 = v23;
  sub_24B4808C0(v15, v17, v19 & 1);
  v24 = v60;
  swift_bridgeObjectRelease();
  v25 = sub_24B4AD944();
  KeyPath = swift_getKeyPath();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  v26 = (uint64_t)v62;
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v8) = v70;
  sub_24B49F3F8(v24, v26);
  v64 = v25;
  if ((v8 & 1) != 0)
  {
    sub_24B4A2114(v26, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
    v27 = v59;
    sub_24B49F3F8(v24, v59);
LABEL_4:
    sub_24B4A2114(v27, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
    goto LABEL_5;
  }
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v28 = v70;
  sub_24B4A2114(v26, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  v27 = v59;
  sub_24B49F3F8(v24, v59);
  if ((v28 & 1) != 0)
    goto LABEL_4;
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v55 = *(_QWORD *)(v70 + 16);
  swift_bridgeObjectRelease();
  sub_24B4A2114(v27, (uint64_t (*)(_QWORD))type metadata accessor for AccountCreationStartupPageView);
  if (!v55)
  {
    v61 = 0;
    v62 = 0;
    v59 = 0;
    v60 = 0;
    v43 = 0;
    v44 = 0;
    goto LABEL_6;
  }
LABEL_5:
  v29 = objc_msgSend(v57, sel_bundleForClass_, v58);
  v70 = 2777980912;
  v71 = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v30 = sub_24B4AD470();
  v32 = v31;

  swift_bridgeObjectRelease();
  v70 = v30;
  v71 = v32;
  v33 = sub_24B4ADA28();
  v35 = v34;
  v37 = v36 & 1;
  sub_24B4AD98C();
  v38 = sub_24B4ADA1C();
  v61 = v39;
  v62 = (char *)v38;
  v41 = v40;
  v60 = v42;
  swift_release();
  v59 = v41 & 1;
  sub_24B4808C0(v33, v35, v37);
  swift_bridgeObjectRelease();
  v43 = sub_24B4AD944();
  v44 = 65537;
LABEL_6:
  v45 = v65 & 1;
  LOBYTE(v70) = v65 & 1;
  v69 = 1;
  v47 = v67;
  v46 = v68;
  *(_QWORD *)a2 = v68;
  *(_QWORD *)(a2 + 8) = v47;
  v48 = v46;
  *(_BYTE *)(a2 + 16) = v45;
  v49 = (uint64_t)v62;
  *(_QWORD *)(a2 + 24) = v63;
  *(_BYTE *)(a2 + 32) = v64;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_BYTE *)(a2 + 72) = 1;
  *(_QWORD *)(a2 + 80) = KeyPath;
  *(_QWORD *)(a2 + 88) = 0x3FE999999999999ALL;
  v50 = v61;
  *(_QWORD *)(a2 + 96) = v49;
  *(_QWORD *)(a2 + 104) = v50;
  v51 = v59;
  *(_QWORD *)(a2 + 112) = v59;
  v52 = a2;
  v53 = v60;
  *(_QWORD *)(v52 + 120) = v60;
  *(_QWORD *)(v52 + 128) = v43;
  *(_OWORD *)(v52 + 152) = 0u;
  *(_OWORD *)(v52 + 136) = 0u;
  *(_BYTE *)(v52 + 170) = BYTE2(v44);
  *(_WORD *)(v52 + 168) = v44;
  sub_24B4809E0(v48, v47, v45);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24B4A1DA4(v49, v50, v51, v53);
  sub_24B4A1CB4(v49, v50, v51, v53);
  sub_24B4808C0(v68, v47, v45);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B49BBE8()
{
  type metadata accessor for AccountCreationStartupPageView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B0);
  return sub_24B4AD650();
}

uint64_t sub_24B49BC54@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjCClassFromMetadata;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned __int8 *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;

  v77 = a2;
  v3 = type metadata accessor for AccountCreationStartupPageView();
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  v72 = *(_QWORD *)(v3 - 8);
  v73 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = type metadata accessor for iCloudMailTextField();
  MEMORY[0x24BDAC7A8](v69);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B28);
  v75 = *(_QWORD *)(v8 - 8);
  v76 = v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v71 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v74 = (char *)&v54 - v11;
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v64 = ObjCClassFromMetadata;
  v63 = (id)objc_opt_self();
  v13 = objc_msgSend(v63, sel_bundleForClass_, ObjCClassFromMetadata);
  *(_QWORD *)&v80 = 2777980912;
  *((_QWORD *)&v80 + 1) = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v14 = sub_24B4AD470();
  v16 = v15;

  swift_bridgeObjectRelease();
  *(_QWORD *)&v80 = v14;
  *((_QWORD *)&v80 + 1) = v16;
  sub_24B480634();
  v17 = sub_24B4ADA28();
  v19 = v18;
  LOBYTE(v16) = v20 & 1;
  sub_24B4AD998();
  v68 = sub_24B4AD9C8();
  v66 = v21;
  v67 = v22;
  v65 = v23 & 1;
  sub_24B4808C0(v17, v19, v16);
  swift_bridgeObjectRelease();
  v62 = a1;
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD6A4();
  swift_getKeyPath();
  sub_24B4AD71C();
  swift_release();
  swift_release();
  v61 = v83;
  v60 = v84;
  v59 = v85;
  v24 = (unsigned __int8 *)(a1 + *(int *)(v3 + 36));
  v58 = *v24;
  v56 = *((_QWORD *)v24 + 1);
  v57 = v24[16];
  swift_retain();
  v25 = sub_24B4AD698();
  v26 = *(_QWORD *)(v25 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain + 8);
  v55 = *(_QWORD *)(v25 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain);
  swift_bridgeObjectRetain();
  swift_release();
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v3) = v80;
  v27 = objc_msgSend(v63, sel_bundleForClass_, v64);
  *(_QWORD *)&v80 = 2777980912;
  *((_QWORD *)&v80 + 1) = 0xA400000000000000;
  sub_24B4ADD70();
  sub_24B4ADD70();
  v28 = sub_24B4AD470();
  v30 = v29;

  swift_bridgeObjectRelease();
  *(_OWORD *)v7 = v61;
  v31 = v59;
  *((_QWORD *)v7 + 2) = v60;
  *((_QWORD *)v7 + 3) = v31;
  v7[32] = v58;
  *((_QWORD *)v7 + 5) = v56;
  v7[48] = v57;
  *((_QWORD *)v7 + 7) = v55;
  *((_QWORD *)v7 + 8) = v26;
  v7[72] = v3;
  *((_QWORD *)v7 + 10) = v28;
  *((_QWORD *)v7 + 11) = v30;
  type metadata accessor for CGRect(0);
  v78 = 0u;
  v79 = 0u;
  sub_24B4ADBA8();
  v32 = v82;
  v33 = v81;
  *((_OWORD *)v7 + 6) = v80;
  *((_OWORD *)v7 + 7) = v33;
  *((_QWORD *)v7 + 16) = v32;
  LOBYTE(v78) = 0;
  sub_24B4ADBA8();
  v34 = *((_QWORD *)&v80 + 1);
  v7[136] = v80;
  *((_QWORD *)v7 + 18) = v34;
  sub_24B4AD9EC();
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  v35 = v70;
  sub_24B49F3F8(v62, v70);
  v36 = (*(unsigned __int8 *)(v72 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v72 + 80);
  v37 = swift_allocObject();
  sub_24B49F440(v35, v37 + v36);
  sub_24B480EE8(&qword_257991B30, (uint64_t (*)(uint64_t))type metadata accessor for iCloudMailTextField, (uint64_t)&unk_24B4B0A48);
  v38 = v71;
  sub_24B4ADB0C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_24B4A2114((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for iCloudMailTextField);
  v40 = v74;
  v39 = v75;
  v41 = v76;
  (*(void (**)(char *, char *, uint64_t))(v75 + 32))(v74, v38, v76);
  v42 = *(void (**)(char *, char *, uint64_t))(v39 + 16);
  v43 = v39;
  v44 = v38;
  v45 = v38;
  v46 = v41;
  v42(v44, v40, v41);
  v47 = v77;
  v48 = v68;
  v49 = v66;
  *v77 = v68;
  v47[1] = v49;
  LOBYTE(v16) = v65;
  *((_BYTE *)v47 + 16) = v65;
  v47[3] = v67;
  v50 = v47;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B38);
  v42((char *)v50 + *(int *)(v51 + 48), v45, v46);
  sub_24B4809E0(v48, v49, v16);
  v52 = *(void (**)(char *, uint64_t))(v43 + 8);
  swift_bridgeObjectRetain();
  v52(v40, v46);
  v52(v45, v46);
  sub_24B4808C0(v48, v49, v16);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B49C410@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B49C424()
{
  return sub_24B49F1A4();
}

uint64_t sub_24B49C438(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;

  v2 = *a2;
  v3 = a2[1];
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  result = swift_release();
  if (v14 == 1)
  {
    sub_24B4AD698();
    v5 = *(_QWORD *)(sub_24B4AD698()
                   + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules);
    swift_bridgeObjectRetain();
    swift_release();
    v13 = v2;
    v6 = sub_24B4A2414(v5);
    v8 = v7;
    swift_bridgeObjectRelease();
    if (v8)
      v9 = v6;
    else
      v9 = 0;
    if (v8)
      v10 = v8;
    else
      v10 = 0xE000000000000000;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24B4AD5CC();
    sub_24B4AD698();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_24B4AD5C0();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    if ((v10 & 0x2000000000000000) != 0)
      v11 = HIBYTE(v10) & 0xF;
    else
      v11 = v9 & 0xFFFFFFFFFFFFLL;
    sub_24B4AD698();
    if (v11)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      return sub_24B4AD5CC();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_24B4AD5C0();
      swift_release();
      swift_release();
      swift_release();
      v12 = sub_24B49C800(v13, v3, (_QWORD *)v9);
      swift_bridgeObjectRelease();
      sub_24B4AD698();
      if ((v12 & 1) != 0)
      {
        swift_getKeyPath();
        swift_getKeyPath();
        sub_24B4AD5CC();
        sub_24B4AD698();
        swift_getKeyPath();
        swift_getKeyPath();
        return sub_24B4AD5CC();
      }
      else
      {
        sub_24B4925E4(v13, v3);
        return swift_release();
      }
    }
  }
  return result;
}

uint64_t sub_24B49C800(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_24B4ADFC8();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_24B4ADFC8() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_24B49C8C4(uint64_t result, uint64_t a2)
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

uint64_t sub_24B49C928(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = type metadata accessor for AccountCreationStartupPageView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_24B49F3F8(a1, (uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  sub_24B49F440((uint64_t)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v6 + v5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579910B8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991A40);
  sub_24B480FAC(&qword_257991A70, &qword_2579910B8, MEMORY[0x24BEE12D8]);
  sub_24B4A1550();
  return sub_24B4ADC20();
}

uint64_t sub_24B49CB14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t KeyPath;
  uint64_t v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v31 = a3;
  v5 = type metadata accessor for AccountCreationStartupPageView();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A60);
  v9 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A50);
  MEMORY[0x24BDAC7A8](v30);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *a1;
  v15 = a1[1];
  sub_24B49F3F8(a2, (uint64_t)v8);
  v16 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v17 = (v7 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  sub_24B49F440((uint64_t)v8, v18 + v16);
  v19 = (_QWORD *)(v18 + v17);
  *v19 = v14;
  v19[1] = v15;
  v32 = v14;
  v33 = v15;
  v34 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991A78);
  sub_24B480FAC(&qword_257991A80, &qword_257991A78, MEMORY[0x24BDF4498]);
  sub_24B4ADBCC();
  v20 = sub_24B4ADB54();
  KeyPath = swift_getKeyPath();
  v22 = v29;
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v11, v29);
  v23 = (uint64_t *)&v13[*(int *)(v30 + 36)];
  *v23 = KeyPath;
  v23[1] = v20;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v22);
  v24 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v35 = MEMORY[0x24BD20614](v24);
  swift_retain();
  v25 = sub_24B4ADBE4();
  v26 = v31;
  sub_24B480840((uint64_t)v13, v31, &qword_257991A50);
  swift_release();
  *(_QWORD *)(v26 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991A40) + 36)) = v25;
  return sub_24B480884((uint64_t)v13, &qword_257991A50);
}

uint64_t sub_24B49CDA4()
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49CE7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;

  *(_QWORD *)a4 = sub_24B4AD86C();
  *(_QWORD *)(a4 + 8) = 0;
  *(_BYTE *)(a4 + 16) = 0;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A88);
  return sub_24B49CEDC(a1, a2, a3, a4 + *(int *)(v8 + 44));
}

uint64_t sub_24B49CEDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v42[12];
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  _BYTE *v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int8 v67;
  uint64_t v68;

  v53 = a3;
  v54 = a2;
  v55 = a1;
  v58 = a4;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A90);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v59 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v57 = &v42[-v7];
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A98);
  MEMORY[0x24BDAC7A8](v51);
  v9 = (uint64_t *)&v42[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v60 = sub_24B4AD728();
  v10 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v12 = &v42[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AA0);
  v13 = MEMORY[0x24BDAC7A8](v50);
  v56 = &v42[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = &v42[-v16];
  MEMORY[0x24BDAC7A8](v15);
  v52 = &v42[-v18];
  v47 = sub_24B4AD86C();
  sub_24B49D4A8((uint64_t)&v61);
  v20 = v61;
  v19 = v62;
  v21 = v63;
  v22 = v64;
  v45 = v65;
  v44 = v66;
  v43 = v67;
  v46 = v68;
  KeyPath = swift_getKeyPath();
  v24 = *MEMORY[0x24BDED100];
  v48 = v12;
  v49 = v10;
  v25 = v60;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 104))(v12, v24, v60);
  (*(void (**)(char *, _BYTE *, uint64_t))(v10 + 16))((char *)v9 + *(int *)(v51 + 28), v12, v25);
  *v9 = KeyPath;
  sub_24B480840((uint64_t)v9, (uint64_t)&v17[*(int *)(v50 + 36)], &qword_257991A98);
  *(_QWORD *)v17 = v47;
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 0;
  *((_QWORD *)v17 + 3) = v20;
  *((_QWORD *)v17 + 4) = v19;
  v17[40] = v21;
  v26 = v45;
  *((_QWORD *)v17 + 6) = v22;
  *((_QWORD *)v17 + 7) = v26;
  v27 = v44;
  *((_QWORD *)v17 + 8) = v44;
  LOBYTE(v12) = v43;
  v17[72] = v43;
  *((_QWORD *)v17 + 10) = v46;
  sub_24B4809E0(v20, v19, v21);
  swift_bridgeObjectRetain();
  sub_24B4809E0(v26, v27, (char)v12);
  swift_bridgeObjectRetain();
  sub_24B480884((uint64_t)v9, &qword_257991A98);
  (*(void (**)(_BYTE *, uint64_t))(v49 + 8))(v48, v60);
  sub_24B4808C0(v20, v19, v21);
  swift_bridgeObjectRelease();
  v28 = (uint64_t)v52;
  sub_24B4808C0(v26, v27, (char)v12);
  swift_bridgeObjectRelease();
  sub_24B4807FC((uint64_t)v17, v28, &qword_257991AA0);
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  if (v61 == v55 && v62 == v54)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = sub_24B4ADFC8();
    swift_bridgeObjectRelease();
    if ((v29 & 1) == 0)
    {
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AA8);
      v33 = (uint64_t)v57;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v57, 1, 1, v35);
      goto LABEL_7;
    }
  }
  v30 = sub_24B4ADB78();
  v31 = sub_24B4ADB30();
  v32 = swift_getKeyPath();
  v61 = v30;
  v62 = v32;
  v63 = v31;
  sub_24B4AD9A4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991AB8);
  sub_24B4A1998();
  v33 = (uint64_t)v57;
  sub_24B4ADA4C();
  swift_release();
  swift_release();
  swift_release();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AA8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v33, 0, 1, v34);
LABEL_7:
  v36 = v56;
  sub_24B480840(v28, (uint64_t)v56, &qword_257991AA0);
  v37 = v59;
  sub_24B480840(v33, (uint64_t)v59, &qword_257991A90);
  v38 = v58;
  sub_24B480840((uint64_t)v36, v58, &qword_257991AA0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AB0);
  v40 = v38 + *(int *)(v39 + 48);
  *(_QWORD *)v40 = 0;
  *(_BYTE *)(v40 + 8) = 1;
  sub_24B480840((uint64_t)v37, v38 + *(int *)(v39 + 64), &qword_257991A90);
  sub_24B480884(v33, &qword_257991A90);
  sub_24B480884(v28, &qword_257991AA0);
  sub_24B480884((uint64_t)v37, &qword_257991A90);
  return sub_24B480884((uint64_t)v36, &qword_257991AA0);
}

uint64_t sub_24B49D4A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  sub_24B480634();
  swift_bridgeObjectRetain();
  v2 = sub_24B4ADA28();
  v20 = v3;
  v21 = v2;
  v22 = v4;
  v19 = v5 & 1;
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_bridgeObjectRetain();
  swift_release();
  v6 = sub_24B4ADA28();
  v8 = v7;
  v10 = v9 & 1;
  sub_24B4ADB60();
  v11 = sub_24B4ADA04();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_release();
  v15 &= 1u;
  sub_24B4808C0(v6, v8, v10);
  swift_bridgeObjectRelease();
  *(_QWORD *)a1 = v21;
  *(_QWORD *)(a1 + 8) = v20;
  *(_BYTE *)(a1 + 16) = v19;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = v11;
  *(_QWORD *)(a1 + 40) = v13;
  *(_BYTE *)(a1 + 48) = v15;
  *(_QWORD *)(a1 + 56) = v17;
  sub_24B4809E0(v21, v20, v19);
  swift_bridgeObjectRetain();
  sub_24B4809E0(v11, v13, v15);
  swift_bridgeObjectRetain();
  sub_24B4808C0(v11, v13, v15);
  swift_bridgeObjectRelease();
  sub_24B4808C0(v21, v20, v19);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B49D6A8()
{
  return sub_24B4AD7A0();
}

uint64_t sub_24B49D6C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B49F37C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

uint64_t sub_24B49D6DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24[2];

  v24[0] = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A18);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A08);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919F8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579919E8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v5 = sub_24B4AD884();
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 1;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AC8);
  sub_24B49D9B0(a1, (uint64_t)&v5[*(int *)(v15 + 44)]);
  v16 = sub_24B4ADC50();
  sub_24B496D38(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v8, 0.0, 1, 0.0, 1, v16, v17, &qword_257991A18, &qword_257991A08);
  sub_24B480884((uint64_t)v5, &qword_257991A18);
  LOBYTE(a1) = sub_24B4AD974();
  sub_24B480840((uint64_t)v8, (uint64_t)v11, &qword_257991A08);
  v18 = &v11[*(int *)(v9 + 36)];
  *v18 = a1;
  *(_OWORD *)(v18 + 8) = 0u;
  *(_OWORD *)(v18 + 24) = 0u;
  v18[40] = 1;
  sub_24B480884((uint64_t)v8, &qword_257991A08);
  LOBYTE(a1) = sub_24B4AD974();
  sub_24B480840((uint64_t)v11, (uint64_t)v14, &qword_2579919F8);
  v19 = &v14[*(int *)(v12 + 36)];
  *v19 = a1;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  v19[40] = 1;
  sub_24B480884((uint64_t)v11, &qword_2579919F8);
  v20 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemBackgroundColor);
  v24[1] = MEMORY[0x24BD20614](v20);
  swift_retain();
  v21 = sub_24B4ADBE4();
  v22 = v24[0];
  sub_24B480840((uint64_t)v14, v24[0], &qword_2579919E8);
  swift_release();
  *(_QWORD *)(v22 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579919D0) + 36)) = v21;
  return sub_24B480884((uint64_t)v14, &qword_2579919E8);
}

uint64_t sub_24B49D9B0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t ObjCClassFromMetadata;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t KeyPath;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;

  v83 = a2;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990418);
  v3 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v5 = (char *)&v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AD0);
  MEMORY[0x24BDAC7A8](v79);
  v80 = (uint64_t)&v63 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AD8);
  MEMORY[0x24BDAC7A8](v78);
  v8 = (uint64_t *)((char *)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AE0);
  MEMORY[0x24BDAC7A8](v9);
  v81 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AccountCreationStartupPageView();
  v69 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v70 = v12;
  v71 = (uint64_t)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579917A0);
  v74 = *(_QWORD *)(v13 - 8);
  v75 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v73 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AE8);
  v15 = MEMORY[0x24BDAC7A8](v72);
  v17 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v76 = a1;
  v77 = (uint64_t)&v63 - v18;
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  if (v84 == 1)
  {
    _s18CurrentBundleClassCMa();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v65 = ObjCClassFromMetadata;
    v64 = (id)objc_opt_self();
    v20 = objc_msgSend(v64, sel_bundleForClass_, ObjCClassFromMetadata);
    v84 = 2777980912;
    v85 = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v21 = sub_24B4AD470();
    v23 = v22;

    swift_bridgeObjectRelease();
    v84 = v21;
    v85 = v23;
    v67 = sub_24B480634();
    v24 = sub_24B4ADA28();
    v26 = v25;
    LOBYTE(v23) = v27 & 1;
    sub_24B4AD9B0();
    v28 = sub_24B4ADA1C();
    v30 = v29;
    v32 = v31;
    v68 = v8;
    swift_release();
    sub_24B4808C0(v24, v26, v23);
    swift_bridgeObjectRelease();
    sub_24B4ADB60();
    v33 = sub_24B4ADA04();
    v35 = v34;
    LOBYTE(v23) = v36;
    v66 = v37;
    swift_release();
    LOBYTE(v23) = v23 & 1;
    sub_24B4808C0(v28, v30, v32 & 1);
    swift_bridgeObjectRelease();
    v38 = objc_msgSend(v64, sel_bundleForClass_, v65);
    v84 = 2777980912;
    v85 = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    v39 = sub_24B4AD470();
    v41 = v40;

    swift_bridgeObjectRelease();
    v84 = v39;
    v85 = v41;
    v42 = v71;
    sub_24B49F3F8(v76, v71);
    v43 = (*(unsigned __int8 *)(v69 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80);
    v44 = swift_allocObject();
    sub_24B49F440(v42, v44 + v43);
    v45 = v73;
    sub_24B4ADBD8();
    v46 = sub_24B4AD9B0();
    KeyPath = swift_getKeyPath();
    v49 = v74;
    v48 = v75;
    (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v17, v45, v75);
    v50 = (uint64_t *)&v17[*(int *)(v72 + 36)];
    *v50 = KeyPath;
    v50[1] = v46;
    (*(void (**)(char *, uint64_t))(v49 + 8))(v45, v48);
    v51 = v77;
    sub_24B4807FC((uint64_t)v17, v77, &qword_257991AE8);
    sub_24B480840(v51, (uint64_t)v17, &qword_257991AE8);
    v52 = (uint64_t)v68;
    *v68 = v33;
    *(_QWORD *)(v52 + 8) = v35;
    *(_BYTE *)(v52 + 16) = v23;
    *(_QWORD *)(v52 + 24) = v66;
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B00);
    sub_24B480840((uint64_t)v17, v52 + *(int *)(v53 + 48), &qword_257991AE8);
    sub_24B4809E0(v33, v35, v23);
    swift_bridgeObjectRetain();
    sub_24B4809E0(v33, v35, v23);
    swift_bridgeObjectRetain();
    sub_24B480884((uint64_t)v17, &qword_257991AE8);
    sub_24B4808C0(v33, v35, v23);
    swift_bridgeObjectRelease();
    sub_24B480840(v52, v80, &qword_257991AD8);
    swift_storeEnumTagMultiPayload();
    sub_24B480FAC(&qword_257991AF8, &qword_257991AD8, MEMORY[0x24BDF5428]);
    sub_24B480FAC(&qword_257990410, &qword_257990418, MEMORY[0x24BDEBC00]);
    v54 = v81;
    sub_24B4AD8A8();
    sub_24B480884(v52, &qword_257991AD8);
    sub_24B480884(v51, &qword_257991AE8);
    sub_24B4808C0(v33, v35, v23);
    swift_bridgeObjectRelease();
    v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AF0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v54, 0, 1, v55);
    v56 = (uint64_t)v54;
    return sub_24B4807FC(v56, v83, &qword_257991AE0);
  }
  v57 = v80;
  v59 = v81;
  v58 = v82;
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  if (v84 == 1)
  {
    sub_24B4AD6B0();
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v57, v5, v58);
    swift_storeEnumTagMultiPayload();
    sub_24B480FAC(&qword_257991AF8, &qword_257991AD8, MEMORY[0x24BDF5428]);
    sub_24B480FAC(&qword_257990410, &qword_257990418, MEMORY[0x24BDEBC00]);
    sub_24B4AD8A8();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v58);
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AF0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v59, 0, 1, v60);
    v56 = (uint64_t)v59;
    return sub_24B4807FC(v56, v83, &qword_257991AE0);
  }
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991AF0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v62 - 8) + 56))(v83, 1, 1, v62);
}

uint64_t sub_24B49E2C0()
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  sub_24B490A38();
  return swift_release();
}

uint64_t sub_24B49E348@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49E35C()
{
  return sub_24B49F310();
}

uint64_t sub_24B49E370()
{
  type metadata accessor for AccountCreationStartupPageView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B0);
  sub_24B4AD650();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49E474@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49E488()
{
  return sub_24B49F310();
}

uint64_t sub_24B49E49C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjCClassFromMetadata;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v2 = type metadata accessor for AccountCreationStartupPageView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v6 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADD70();
  sub_24B4ADD70();
  v7 = sub_24B4AD470();
  v9 = v8;

  swift_bridgeObjectRelease();
  v13[0] = v7;
  v13[1] = v9;
  sub_24B49F3F8(a1, (uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v11 = swift_allocObject();
  sub_24B49F440((uint64_t)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
  sub_24B480634();
  return sub_24B4ADBD8();
}

uint64_t sub_24B49E644()
{
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  sub_24B493158();
  return swift_release();
}

uint64_t sub_24B49E6CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t ObjCClassFromMetadata;
  id v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257990BE8);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_24B4B02A0;
  type metadata accessor for AccountCreationStartupPageView();
  _s9ViewModelCMa();
  sub_24B480EE8(&qword_2579917D8, (uint64_t (*)(uint64_t))_s9ViewModelCMa, (uint64_t)&unk_24B4AFE58);
  sub_24B4AD698();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  swift_release();
  swift_release();
  sub_24B4AD698();
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRetain();
  sub_24B4ADD70();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 64) = sub_24B489B8C();
  *(_QWORD *)(v2 + 32) = v9;
  *(_QWORD *)(v2 + 40) = v10;
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v4 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADD70();
  sub_24B4ADD70();
  sub_24B4AD470();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24B4ADD34();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24B480634();
  result = sub_24B4ADA28();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_24B49E98C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t OpaqueTypeConformance2;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t (**v19)();
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  ValueMetadata *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v24 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991768);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = v1;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991770);
  v22 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991778);
  v21 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991780);
  v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991788);
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991790);
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991798);
  v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579917A0);
  v10 = sub_24B480FAC(&qword_2579917A8, &qword_257991798, MEMORY[0x24BDEDA10]);
  v11 = sub_24B49EBE4();
  v12 = sub_24B480FAC(&qword_2579917B8, &qword_2579917A0, MEMORY[0x24BDF43B0]);
  v26 = v8;
  v27 = &type metadata for MSError;
  v28 = v9;
  v29 = v10;
  v30 = v11;
  v31 = v12;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v14 = sub_24B480FAC(&qword_2579917C0, &qword_257991790, MEMORY[0x24BDEF170]);
  v26 = v6;
  v27 = (ValueMetadata *)v7;
  v28 = OpaqueTypeConformance2;
  v29 = v14;
  v15 = swift_getOpaqueTypeConformance2();
  v26 = v21;
  v27 = (ValueMetadata *)v15;
  v16 = swift_getOpaqueTypeConformance2();
  v17 = sub_24B49EC28();
  v26 = v22;
  v27 = &type metadata for AccountCreationFinishView;
  v28 = v16;
  v29 = v17;
  swift_getOpaqueTypeConformance2();
  sub_24B4AD734();
  v18 = v24;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v24, v5, v2);
  v19 = (uint64_t (**)())(v18 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2579917D0) + 36));
  *v19 = sub_24B498614;
  v19[1] = 0;
  v19[2] = 0;
  v19[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_24B49EBDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B4971BC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B49EBE4()
{
  unint64_t result;

  result = qword_2579917B0;
  if (!qword_2579917B0)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AF6C8, &type metadata for MSError);
    atomic_store(result, (unint64_t *)&qword_2579917B0);
  }
  return result;
}

unint64_t sub_24B49EC28()
{
  unint64_t result;

  result = qword_2579917C8;
  if (!qword_2579917C8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AEBBC, &type metadata for AccountCreationFinishView);
    atomic_store(result, (unint64_t *)&qword_2579917C8);
  }
  return result;
}

uint64_t sub_24B49EC6C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;

  v8 = v4;
  v10 = sub_24B4AD860();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B480840(v8, (uint64_t)v16, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a4, v16, v17);
  }
  else
  {
    v19 = sub_24B4ADE00();
    v20 = sub_24B4AD92C();
    v21 = v19;
    if (os_log_type_enabled(v20, v19))
    {
      v24[1] = a4;
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v22 = 136315138;
      v24[2] = sub_24B49F648(a3, 0xED00006E6F697463, &v25);
      sub_24B4ADE90();
      _os_log_impl(&dword_24B47A000, v20, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD20FF8](v23, -1, -1);
      MEMORY[0x24BD20FF8](v22, -1, -1);
    }

    sub_24B4AD854();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
}

uint64_t sub_24B49EEA8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24B49EF24(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49EF98@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24B49F014()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49F08C@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B49F0A0()
{
  return sub_24B49F1A4();
}

uint64_t sub_24B49F0B4@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F0C8()
{
  return sub_24B49F310();
}

uint64_t sub_24B49F0DC@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F0F0()
{
  return sub_24B49F310();
}

uint64_t sub_24B49F104@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B49F118@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24B49F190()
{
  return sub_24B49F1A4();
}

uint64_t sub_24B49F1A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49F220@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F234()
{
  return sub_24B49F310();
}

uint64_t sub_24B49F248@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F25C()
{
  return sub_24B49F310();
}

uint64_t sub_24B49F270@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F284@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_24B4AD5C0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24B49F2FC()
{
  return sub_24B49F310();
}

uint64_t sub_24B49F310()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_24B4AD5CC();
}

uint64_t sub_24B49F37C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

uint64_t sub_24B49F3F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B49F440(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B49F484@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountCreationStartupPageView() - 8) + 80);
  return sub_24B498DA4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_24B49F4D8(uint64_t a1)
{
  swift_release();
  return a1;
}

uint64_t sub_24B49F500(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24B49F528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B497AA4(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24B49F530@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B49F554()
{
  return sub_24B49F310();
}

double sub_24B49F57C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountCreationStartupPageView() - 8) + 80);
  *(_QWORD *)&result = sub_24B4980E4(v1 + ((v3 + 16) & (unint64_t)~v3), a1).n128_u64[0];
  return result;
}

uint64_t sub_24B49F5B8@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B49F5DC()
{
  return sub_24B49F1A4();
}

uint64_t sub_24B49F604(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountCreationStartupPageView() - 8) + 80);
  return sub_24B49853C(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_24B49F648(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24B49F718(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24B489C14((uint64_t)v12, *a3);
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
      sub_24B489C14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24B49F718(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24B4ADE9C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_24B49F8D0(a5, a6);
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
  v8 = sub_24B4ADF14();
  if (!v8)
  {
    sub_24B4ADF2C();
    __break(1u);
LABEL_17:
    result = sub_24B4ADF74();
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

uint64_t sub_24B49F8D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24B49F964(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_24B49FB3C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_24B49FB3C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24B49F964(uint64_t a1, unint64_t a2)
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
      v3 = sub_24B49FAD8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_24B4ADEFC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_24B4ADF2C();
      __break(1u);
LABEL_10:
      v2 = sub_24B4ADD88();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_24B4ADF74();
    __break(1u);
LABEL_14:
    result = sub_24B4ADF2C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_24B49FAD8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579917E0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24B49FB3C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579917E0);
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
  result = sub_24B4ADF74();
  __break(1u);
  return result;
}

uint64_t sub_24B49FC88@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD7C4();
  *a1 = result;
  return result;
}

uint64_t sub_24B49FCB0()
{
  return sub_24B4AD7D0();
}

uint64_t sub_24B49FCD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD788();
  *a1 = result;
  return result;
}

uint64_t sub_24B49FCFC()
{
  swift_retain();
  return sub_24B4AD794();
}

uint64_t sub_24B49FD24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD824();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24B49FD50()
{
  return sub_24B4AD830();
}

_BYTE *sub_24B49FD74(_BYTE *result, char a2)
{
  *result &= a2 ^ 1;
  return result;
}

uint64_t sub_24B49FD88(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B08);
  MEMORY[0x24BDAC7A8](v2);
  sub_24B480840(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_257991B08);
  return sub_24B4AD818();
}

uint64_t sub_24B49FE08(uint64_t a1, uint64_t a2)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  __int128 v97;
  _BYTE v98[25];
  _QWORD v99[5];

  v4 = sub_24B4AD560();
  v95 = *(_QWORD *)(v4 - 8);
  v96 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v94 = (char *)&v71 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991568);
  MEMORY[0x24BDAC7A8](v6);
  v89 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24B4ADE3C();
  v92 = *(_QWORD *)(v8 - 8);
  v93 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v86 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B40);
  v82 = *(_QWORD *)(v81 - 8);
  MEMORY[0x24BDAC7A8](v81);
  v78 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B48);
  v84 = *(_QWORD *)(v83 - 8);
  MEMORY[0x24BDAC7A8](v83);
  v79 = (char *)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B50);
  v13 = *(_QWORD *)(v12 - 8);
  v87 = v12;
  v88 = v13;
  MEMORY[0x24BDAC7A8](v12);
  v80 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991B58);
  v16 = *(_QWORD *)(v15 - 8);
  v90 = v15;
  v91 = v16;
  MEMORY[0x24BDAC7A8](v15);
  v85 = (char *)&v71 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991628);
  v76 = *(_QWORD *)(v77 - 8);
  MEMORY[0x24BDAC7A8](v77);
  v75 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991620);
  v73 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v20 = (char *)&v71 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991618);
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x24BDAC7A8](v72);
  v22 = (char *)&v71 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991610);
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (char *)&v71 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991608);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v71 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99[3] = type metadata accessor for ACRepositoryDefault();
  v99[4] = &off_251C5A6B0;
  v99[0] = a1;
  v31 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__profileImage;
  *(_QWORD *)&v97 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579910A8);
  sub_24B4AD5A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v31, v30, v27);
  v32 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__suggestedEmails;
  *(_QWORD *)&v97 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579910B8);
  sub_24B4AD5A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v32, v26, v23);
  v33 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__inputEmail;
  *(_QWORD *)&v97 = 0;
  *((_QWORD *)&v97 + 1) = 0xE000000000000000;
  sub_24B4AD5A8();
  v34 = *(void (**)(uint64_t, char *, uint64_t))(v71 + 32);
  v35 = v72;
  v34(v33, v22, v72);
  v36 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__debouncedInputEmail;
  *(_QWORD *)&v97 = 0;
  *((_QWORD *)&v97 + 1) = 0xE000000000000000;
  sub_24B4AD5A8();
  v34(v36, v22, v35);
  v37 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isLoading;
  LOBYTE(v97) = 1;
  sub_24B4AD5A8();
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v73 + 32);
  v39 = v74;
  v38(v37, v20, v74);
  v40 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__isCreating;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v40, v20, v39);
  v41 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAlert;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v41, v20, v39);
  v42 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingFinishView;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v42, v20, v39);
  v43 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__showingAvailableCheckSpinner;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v43, v20, v39);
  v44 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__emailValidAvailableErrorMessage;
  *(_QWORD *)&v97 = 0;
  *((_QWORD *)&v97 + 1) = 0xE000000000000000;
  sub_24B4AD5A8();
  v34(v44, v22, v35);
  v45 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__disableContinueButton;
  LOBYTE(v97) = 1;
  sub_24B4AD5A8();
  v38(v45, v20, v39);
  v46 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__getSuggestionsError;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v46, v20, v39);
  v47 = a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__errorAlert;
  v97 = 0u;
  memset(v98, 0, sizeof(v98));
  __swift_instantiateConcreteTypeFromMangledName(qword_2579910D8);
  v48 = v75;
  sub_24B4AD5A8();
  (*(void (**)(uint64_t, char *, uint64_t))(v76 + 32))(v47, v48, v77);
  v49 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_suggestions) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_validationRules) = v49;
  v50 = a2
      + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel__passedInitialLengthThreshold;
  LOBYTE(v97) = 0;
  sub_24B4AD5A8();
  v38(v50, v20, v39);
  v51 = (_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_domain);
  *v51 = 0x2E64756F6C636940;
  v51[1] = 0xEB000000006D6F63;
  *(_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_cancellables) = MEMORY[0x24BEE4B08];
  *(_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_availableApiCall) = 0;
  sub_24B4A21FC((uint64_t)v99, a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository);
  swift_beginAccess();
  v52 = v78;
  sub_24B4AD5B4();
  swift_endAccess();
  sub_24B480FAC(&qword_257991B60, &qword_257991B40, MEMORY[0x24BDB9EE8]);
  v53 = v79;
  v54 = v81;
  sub_24B4AD620();
  (*(void (**)(char *, uint64_t))(v82 + 8))(v52, v54);
  sub_24B480FAC(&qword_257991B68, &qword_257991B48, MEMORY[0x24BDB96F8]);
  v55 = v80;
  v56 = v83;
  sub_24B4AD62C();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v53, v56);
  v57 = v86;
  sub_24B4ADE30();
  sub_24B480E3C();
  *(_QWORD *)&v97 = sub_24B4ADE48();
  v58 = sub_24B4ADE24();
  v59 = (uint64_t)v89;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v89, 1, 1, v58);
  sub_24B480FAC(&qword_257991B70, &qword_257991B50, MEMORY[0x24BDB9658]);
  sub_24B480EE8((unint64_t *)&qword_257991588, (uint64_t (*)(uint64_t))sub_24B480E3C, MEMORY[0x24BEE5670]);
  v60 = v85;
  v61 = v87;
  sub_24B4AD614();
  sub_24B480884(v59, &qword_257991568);

  (*(void (**)(char *, uint64_t))(v92 + 8))(v57, v93);
  (*(void (**)(char *, uint64_t))(v88 + 8))(v55, v61);
  swift_allocObject();
  swift_weakInit();
  sub_24B480FAC(&qword_257991B78, &qword_257991B58, MEMORY[0x24BDB9920]);
  v62 = v90;
  sub_24B4AD638();
  swift_release();
  (*(void (**)(char *, uint64_t))(v91 + 8))(v60, v62);
  swift_beginAccess();
  sub_24B4AD578();
  swift_endAccess();
  swift_release();
  sub_24B490A38();
  sub_24B491A90();
  if (qword_257990130 != -1)
    swift_once();
  v63 = v96;
  v64 = __swift_project_value_buffer(v96, (uint64_t)qword_257994C18);
  v66 = v94;
  v65 = v95;
  (*(void (**)(char *, uint64_t, uint64_t))(v95 + 16))(v94, v64, v63);
  v67 = sub_24B4AD548();
  v68 = sub_24B4ADDE8();
  if (os_log_type_enabled(v67, v68))
  {
    v69 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v69 = 0;
    _os_log_impl(&dword_24B47A000, v67, v68, "[AccountCreation - Startup] Fetch profile picture started", v69, 2u);
    MEMORY[0x24BD20FF8](v69, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v65 + 8))(v66, v63);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository), *(_QWORD *)(a2 + OBJC_IVAR____TtCV19iCloudMailAccountUI30AccountCreationStartupPageView9ViewModel_repository + 24));
  swift_retain();
  sub_24B48B1BC((uint64_t)sub_24B4A22C0, a2);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v99);
  return a2;
}

uint64_t sub_24B4A093C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B497CD0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B4A0944()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991808;
  if (!qword_257991808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991800);
    v2[0] = sub_24B480FAC(&qword_2579917B8, &qword_2579917A0, MEMORY[0x24BDF43B0]);
    v2[1] = sub_24B480FAC(&qword_257990498, &qword_2579904A0, MEMORY[0x24BDF1248]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991808);
  }
  return result;
}

uint64_t sub_24B4A09E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B498070(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24B4A09EC()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B498A58);
}

uint64_t sub_24B4A09F8@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A0A1C()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A0A40@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD824();
  *a1 = result & 1;
  return result;
}

uint64_t sub_24B4A0A6C()
{
  return sub_24B4AD830();
}

uint64_t sub_24B4A0A90()
{
  return swift_deallocObject();
}

_BYTE *sub_24B4A0AA0(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_24B4A0ABC()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B497FD0);
}

uint64_t sub_24B4A0AC8()
{
  return swift_deallocObject();
}

uint64_t sub_24B4A0AD8()
{
  uint64_t v0;

  return sub_24B4A59AC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(uint64_t **)(v0 + 32));
}

uint64_t sub_24B4A0AE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = type metadata accessor for AccountCreationStartupPageView();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v11 = *(_QWORD *)(v2 + 64);
  v4 = sub_24B4AD74C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_24B4AD6D4();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v0 + v3, v7);
  }
  else
  {
    swift_release();
  }
  v8 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_24B4AD704();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_24B496074();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + ((v3 + v11 + v6) & ~v6), v4);
  return swift_deallocObject();
}

uint64_t sub_24B4A0C88()
{
  type metadata accessor for AccountCreationStartupPageView();
  sub_24B4AD74C();
  return sub_24B49AF88();
}

uint64_t sub_24B4A0CF0()
{
  uint64_t v0;

  return sub_24B49AFF0(*(double *)(v0 + 24));
}

uint64_t sub_24B4A0D10@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_24B499448(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_24B4A0D1C()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B49E370);
}

uint64_t sub_24B4A0D28@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A0D4C()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A0D70()
{
  return swift_deallocObject();
}

uint64_t sub_24B4A0D80@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A0DA4()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A0DC8()
{
  uint64_t v0;

  return sub_24B49E49C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24B4A0DD0@<X0>(uint64_t a1@<X8>)
{
  return sub_24B49E6CC(a1);
}

unint64_t sub_24B4A0DD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579918A0;
  if (!qword_2579918A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991898);
    v2[0] = sub_24B4A0E5C();
    v2[1] = sub_24B480FAC(&qword_257990498, &qword_2579904A0, MEMORY[0x24BDF1248]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579918A0);
  }
  return result;
}

unint64_t sub_24B4A0E5C()
{
  unint64_t result;

  result = qword_2579918A8;
  if (!qword_2579918A8)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4AED04, &type metadata for MSSubmitButton);
    atomic_store(result, (unint64_t *)&qword_2579918A8);
  }
  return result;
}

uint64_t sub_24B4A0EA4()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B49E644);
}

uint64_t sub_24B4A0EB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B4997C8(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B4A0EB8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579918E0;
  if (!qword_2579918E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579918C0);
    v2[0] = sub_24B4A0F3C();
    v2[1] = sub_24B480FAC(&qword_257991968, &qword_257991970, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579918E0);
  }
  return result;
}

unint64_t sub_24B4A0F3C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579918E8;
  if (!qword_2579918E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579918F0);
    v2[0] = sub_24B4A0FC0();
    v2[1] = sub_24B480FAC(&qword_257990518, &qword_257990520, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579918E8);
  }
  return result;
}

unint64_t sub_24B4A0FC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579918F8;
  if (!qword_2579918F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991900);
    v2[0] = sub_24B4A13FC(&qword_257991908, &qword_257991910, (uint64_t (*)(void))sub_24B4A105C);
    v2[1] = sub_24B480FAC(&qword_257991958, &qword_257991960, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579918F8);
  }
  return result;
}

unint64_t sub_24B4A105C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_257991918;
  if (!qword_257991918)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991920);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991928);
    v2[3] = sub_24B4A10F0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991918);
  }
  return result;
}

unint64_t sub_24B4A10F0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991930;
  if (!qword_257991930)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991928);
    v2[0] = sub_24B480FAC(&qword_257991938, &qword_257991940, MEMORY[0x24BDF4700]);
    v2[1] = sub_24B480FAC(&qword_257991948, &qword_257991950, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991930);
  }
  return result;
}

unint64_t sub_24B4A118C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991978;
  if (!qword_257991978)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579918D0);
    v2[0] = sub_24B480FAC(&qword_257991980, &qword_257991988, MEMORY[0x24BDF44C8]);
    v2[1] = sub_24B480FAC(&qword_257991990, &qword_257991998, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991978);
  }
  return result;
}

unint64_t sub_24B4A1228()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2579919A0;
  if (!qword_2579919A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579918D8);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2579919A0);
  }
  return result;
}

uint64_t sub_24B4A1284(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_retain();
  return result;
}

uint64_t sub_24B4A1298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3 != 1)
    return swift_release();
  return result;
}

uint64_t sub_24B4A12AC@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A12D0()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A12F4@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A1318()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A133C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_24B49D6DC(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_24B4A1344()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2579919D8;
  if (!qword_2579919D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579919D0);
    v2[0] = sub_24B4A13FC(&qword_2579919E0, &qword_2579919E8, sub_24B4A13E0);
    v2[1] = sub_24B480FAC(&qword_257991990, &qword_257991998, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2579919D8);
  }
  return result;
}

uint64_t sub_24B4A13E0()
{
  return sub_24B4A13FC(&qword_2579919F0, &qword_2579919F8, (uint64_t (*)(void))sub_24B4A1468);
}

uint64_t sub_24B4A13FC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
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
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24B4A1468()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991A00;
  if (!qword_257991A00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991A08);
    v2[0] = sub_24B480FAC(&qword_257991A10, &qword_257991A18, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991A00);
  }
  return result;
}

unint64_t sub_24B4A14EC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257991A28;
  if (!qword_257991A28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991A30);
    v2 = sub_24B4A1550();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257991A28);
  }
  return result;
}

unint64_t sub_24B4A1550()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991A38;
  if (!qword_257991A38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991A40);
    v2[0] = sub_24B4A15D4();
    v2[1] = sub_24B480FAC(&qword_257991990, &qword_257991998, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991A38);
  }
  return result;
}

unint64_t sub_24B4A15D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991A48;
  if (!qword_257991A48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991A50);
    v2[0] = sub_24B480FAC(&qword_257991A58, &qword_257991A60, MEMORY[0x24BDF43B0]);
    v2[1] = sub_24B480FAC(&qword_257990518, &qword_257990520, MEMORY[0x24BDF1028]);
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991A48);
  }
  return result;
}

uint64_t sub_24B4A1670(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[3];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BDF1F80];
    v8[1] = v7;
    v8[2] = MEMORY[0x24BDF5138];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDF4AF8], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B4A16F0()
{
  uint64_t v0;

  return sub_24B49C928(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24B4A16FC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountCreationStartupPageView() - 8) + 80);
  return sub_24B49CB14(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_24B4A1748()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AccountCreationStartupPageView();
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v3 = sub_24B4AD6D4();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v0 + v2, v3);
  }
  else
  {
    swift_release();
  }
  v4 = v0 + v2 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_24B4AD704();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_24B496074();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B4A18B4()
{
  type metadata accessor for AccountCreationStartupPageView();
  return sub_24B49CDA4();
}

uint64_t sub_24B4A18F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_24B49CE7C(v1[2], v1[3], v1[4], a1);
}

uint64_t sub_24B4A1904@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD788();
  *a1 = result;
  return result;
}

uint64_t sub_24B4A192C()
{
  swift_retain();
  return sub_24B4AD794();
}

uint64_t sub_24B4A1954()
{
  return sub_24B4AD7A0();
}

uint64_t sub_24B4A1974(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B49F37C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

unint64_t sub_24B4A1998()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_257991AC0;
  if (!qword_257991AC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991AB8);
    v2 = sub_24B480FAC(&qword_257990518, &qword_257990520, MEMORY[0x24BDF1028]);
    v3[0] = MEMORY[0x24BDF40E8];
    v3[1] = v2;
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_257991AC0);
  }
  return result;
}

uint64_t sub_24B4A1A20()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B49E2C0);
}

uint64_t sub_24B4A1A2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD7DC();
  *a1 = result;
  return result;
}

uint64_t sub_24B4A1A54()
{
  swift_retain();
  return sub_24B4AD7E8();
}

uint64_t sub_24B4A1A7C@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B4A1AA0()
{
  return sub_24B49F1A4();
}

uint64_t sub_24B4A1AC4()
{
  return sub_24B4AD80C();
}

uint64_t sub_24B4A1AE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_24B4AD7C4();
  *a1 = result;
  return result;
}

uint64_t sub_24B4A1B10()
{
  return sub_24B4AD7D0();
}

uint64_t sub_24B4A1B38()
{
  return sub_24B4A1B44((uint64_t (*)(uint64_t))sub_24B49BBE8);
}

uint64_t sub_24B4A1B44(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AccountCreationStartupPageView() - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_24B4A1B80(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 128);
  v4 = *(_QWORD *)(a1 + 136);
  v5 = *(_BYTE *)(a1 + 144);
  v10 = *(_QWORD *)(a1 + 224);
  v8 = *(_QWORD *)(a1 + 240);
  v9 = *(_QWORD *)(a1 + 232);
  v7 = *(_QWORD *)(a1 + 248);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_24B4808C0(v3, v4, v5);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24B4A1CB4(v10, v9, v8, v7);
  swift_release();
  return a1;
}

uint64_t sub_24B4A1CB4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24B4808C0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24B4A1CE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 120);
  v3 = *(_QWORD *)(a1 + 144);
  sub_24B4809E0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24B4A1DA4(v6, v5, v2, v3);
  return a1;
}

uint64_t sub_24B4A1DA4(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_24B4809E0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_24B4A1DD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(a1 + 136);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 120);
  v3 = *(_QWORD *)(a1 + 144);
  sub_24B4808C0(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  swift_bridgeObjectRelease();
  sub_24B4A1CB4(v6, v5, v2, v3);
  return a1;
}

uint64_t sub_24B4A1E94@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24B4AD7AC();
  *a1 = v3;
  return result;
}

uint64_t sub_24B4A1EBC()
{
  return sub_24B4AD7B8();
}

uint64_t sub_24B4A1EE0@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A1F04()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A1F28@<X0>(_QWORD *a1@<X8>)
{
  return sub_24B49F118(a1);
}

uint64_t sub_24B4A1F4C()
{
  return sub_24B49F1A4();
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for AccountCreationStartupPageView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991690);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24B4AD6D4();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  v5 = v0 + v3 + *(int *)(v1 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991698);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24B4AD704();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  swift_release();
  sub_24B496074();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B4A20C8(uint64_t a1, uint64_t *a2)
{
  type metadata accessor for AccountCreationStartupPageView();
  return sub_24B49C438(a1, a2);
}

uint64_t sub_24B4A2114(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24B4A2150@<X0>(_BYTE *a1@<X8>)
{
  return sub_24B49F284(a1);
}

uint64_t sub_24B4A2174()
{
  return sub_24B49F310();
}

uint64_t sub_24B4A2198()
{
  return sub_24B4AD7F4();
}

uint64_t sub_24B4A21B8()
{
  return sub_24B4AD800();
}

uint64_t sub_24B4A21D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B49F37C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEC2E0], MEMORY[0x24BDEE410]);
}

uint64_t sub_24B4A21FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24B4A2240()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_24B4A2264()
{
  uint64_t v0;

  return sub_24B497094(v0 + 16);
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

uint64_t sub_24B4A2294()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24B4A22B8()
{
  return sub_24B4908B4();
}

uint64_t sub_24B4A22C0(void *a1, void *a2)
{
  uint64_t v2;

  return sub_24B49217C(a1, a2, v2);
}

unint64_t sub_24B4A22CC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_257991B80;
  if (!qword_257991B80)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2579917D0);
    v2[0] = sub_24B480FAC(&qword_257991B88, &qword_257991768, MEMORY[0x24BDED358]);
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_257991B80);
  }
  return result;
}

uint64_t sub_24B4A2354()
{
  uint64_t v0;

  v0 = sub_24B4AD560();
  __swift_allocate_value_buffer(v0, qword_257994C18);
  __swift_project_value_buffer(v0, (uint64_t)qword_257994C18);
  return sub_24B4AD554();
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

uint64_t sub_24B4A2414(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v12;
  uint64_t v13;
  int v14;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = a1;
  sub_24B4A25DC();
  swift_bridgeObjectRetain();
  v3 = 0;
  v13 = v2;
  while (1)
  {
    v4 = v2 + v3;
    v5 = *(_QWORD *)(v2 + v3 + 48);
    v6 = *(_QWORD *)(v4 + 56);
    v12 = *(_QWORD *)(v4 + 80);
    v14 = *(unsigned __int8 *)(v4 + 96);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257990BE8);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_24B4B02A0;
    *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v7 + 64) = sub_24B489B8C();
    *(_QWORD *)(v7 + 32) = v5;
    *(_QWORD *)(v7 + 40) = v6;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v8 = (void *)sub_24B4ADDD0();
    v9 = (void *)sub_24B4ADD1C();
    v10 = objc_msgSend(v8, sel_evaluateWithObject_, v9);

    if (v14 != v10)
      break;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 += 72;
    --v1;
    v2 = v13;
    if (!v1)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_24B4A25DC()
{
  unint64_t result;

  result = qword_257991B90;
  if (!qword_257991B90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257991B90);
  }
  return result;
}

uint64_t sub_24B4A2618(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = v4 + ((v3 + 16) & ~(unint64_t)v3);
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    *(_QWORD *)(a1 + 8) = a2[1];
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
    v7 = a2[8];
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_QWORD *)(a1 + 64) = v7;
    *(_BYTE *)(a1 + 72) = *((_BYTE *)a2 + 72);
    v8 = a2[11];
    *(_QWORD *)(a1 + 80) = a2[10];
    *(_QWORD *)(a1 + 88) = v8;
    v9 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(a1 + 96) = *((_OWORD *)a2 + 6);
    *(_OWORD *)(a1 + 112) = v9;
    *(_QWORD *)(a1 + 128) = a2[16];
    *(_BYTE *)(a1 + 136) = *((_BYTE *)a2 + 136);
    v10 = *(int *)(a3 + 44);
    v14 = (uint64_t)a2 + v10;
    v15 = a1 + v10;
    *(_QWORD *)(a1 + 144) = a2[18];
    v11 = sub_24B4AD9F8();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v13(v15, v14, v11);
  }
  return v5;
}

uint64_t sub_24B4A2768(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 44);
  v5 = sub_24B4AD9F8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_24B4A27E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v7;
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  v9 = *(int *)(a3 + 44);
  v13 = a2 + v9;
  v14 = a1 + v9;
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v10 = sub_24B4AD9F8();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v12(v14, v13, v10);
  return a1;
}

uint64_t sub_24B4A2908(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 44);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_24B4AD9F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t sub_24B4A2A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v5 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v5;
  v6 = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 80) = v6;
  v7 = *(int *)(a3 + 44);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  v10 = sub_24B4AD9F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_24B4A2B18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release();
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  v8 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = v8;
  swift_bridgeObjectRelease();
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  swift_release();
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_release();
  v10 = *(int *)(a3 + 44);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_24B4AD9F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_24B4A2C1C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B4A2C28(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = sub_24B4AD9F8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 44), a2, v8);
  }
}

uint64_t sub_24B4A2CA4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B4A2CB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = sub_24B4AD9F8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 44), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for iCloudMailTextField()
{
  uint64_t result;

  result = qword_257991BF0;
  if (!qword_257991BF0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B4A2D60()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24B4AD9F8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24B4A2E08()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24B4A2E18@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
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
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD v36[2];
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

  v2 = v1;
  v41 = a1;
  v3 = type metadata accessor for iCloudMailTextField();
  v4 = *(_QWORD *)(v3 - 8);
  v36[1] = v3;
  v37 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v38 = v5;
  v39 = (uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C40);
  MEMORY[0x24BDAC7A8](v40);
  v7 = (char *)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C48);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v1;
  v12 = v1[1];
  v14 = v1[2];
  v13 = v1[3];
  v42 = *v1;
  v43 = v12;
  v44 = v14;
  v45 = v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C50);
  MEMORY[0x24BD206EC](&v46);
  v17 = v46;
  v16 = v47;
  swift_bridgeObjectRelease();
  v18 = HIBYTE(v16) & 0xF;
  if ((v16 & 0x2000000000000000) == 0)
    v18 = v17 & 0xFFFFFFFFFFFFLL;
  if (v18)
  {
    v42 = v11;
    v43 = v12;
    v44 = v14;
    v45 = v13;
    MEMORY[0x24BD206EC](&v46, v15);
    v20 = v46;
    v19 = v47;
  }
  else
  {
    v20 = v2[10];
    v19 = swift_bridgeObjectRetain();
  }
  v42 = v20;
  v43 = v19;
  sub_24B480634();
  v21 = sub_24B4ADA28();
  v23 = v22;
  v25 = v24 & 1;
  v26 = sub_24B4AD9D4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v10, 1, 1, v26);
  sub_24B4AD9E0();
  v28 = v27;
  v30 = v29;
  sub_24B480884((uint64_t)v10, &qword_257991C48);
  *(_QWORD *)v7 = sub_24B4AD86C();
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 0;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C58);
  sub_24B4A3108(v2, (uint64_t)&v7[*(int *)(v31 + 44)], v28, v30);
  v32 = v39;
  sub_24B4A43FC((uint64_t)v2, v39);
  v33 = (*(unsigned __int8 *)(v37 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
  v34 = swift_allocObject();
  sub_24B4A4504(v32, v34 + v33);
  sub_24B480FAC(&qword_257991C60, &qword_257991C40, MEMORY[0x24BDF4498]);
  sub_24B4ADA70();
  swift_release();
  sub_24B4808C0(v21, v23, v25);
  swift_bridgeObjectRelease();
  return sub_24B480884((uint64_t)v7, &qword_257991C40);
}

uint64_t sub_24B4A3108@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t KeyPath;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  char *v50;
  void (*v51)(char *, char *, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  uint64_t v77;
  _OWORD v78[9];
  _BYTE v79[151];
  char v80;

  v77 = a2;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990418);
  v66 = *(_QWORD *)(v7 - 8);
  v67 = v7;
  v8 = MEMORY[0x24BDAC7A8](v7);
  v65 = (char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v64 = (char *)&v63 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C68);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v75 = (uint64_t *)((char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v76 = (uint64_t)&v63 - v14;
  v15 = sub_24B4AD728();
  v72 = *(_QWORD *)(v15 - 8);
  v73 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v71 = (char *)&v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C70);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C78);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C80);
  v23 = MEMORY[0x24BDAC7A8](v69);
  v74 = (uint64_t)&v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v63 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v70 = (char *)&v63 - v28;
  *(_QWORD *)v19 = sub_24B4AD86C();
  *((_QWORD *)v19 + 1) = 0;
  v19[16] = 0;
  v29 = &v19[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991C88) + 44)];
  v68 = a1;
  sub_24B4A36E4(a1, v29);
  v30 = sub_24B4ADC5C();
  v32 = v31;
  v33 = sub_24B4AD86C();
  sub_24B4A3CD0((uint64_t)a1, (uint64_t)v78, a3, a4);
  *(_OWORD *)&v79[87] = v78[5];
  *(_OWORD *)&v79[103] = v78[6];
  *(_OWORD *)&v79[119] = v78[7];
  *(_OWORD *)&v79[135] = v78[8];
  *(_OWORD *)&v79[23] = v78[1];
  *(_OWORD *)&v79[39] = v78[2];
  *(_OWORD *)&v79[55] = v78[3];
  *(_OWORD *)&v79[71] = v78[4];
  v80 = 0;
  *(_OWORD *)&v79[7] = v78[0];
  sub_24B480840((uint64_t)v19, (uint64_t)v22, &qword_257991C70);
  v34 = &v22[*(int *)(v20 + 36)];
  v35 = *(_OWORD *)&v79[112];
  *(_OWORD *)(v34 + 113) = *(_OWORD *)&v79[96];
  *(_OWORD *)(v34 + 129) = v35;
  *(_OWORD *)(v34 + 145) = *(_OWORD *)&v79[128];
  v36 = *(_OWORD *)&v79[48];
  *(_OWORD *)(v34 + 49) = *(_OWORD *)&v79[32];
  *(_OWORD *)(v34 + 65) = v36;
  v37 = *(_OWORD *)&v79[80];
  *(_OWORD *)(v34 + 81) = *(_OWORD *)&v79[64];
  *(_OWORD *)(v34 + 97) = v37;
  v38 = *(_OWORD *)&v79[16];
  *(_OWORD *)(v34 + 17) = *(_OWORD *)v79;
  *(_QWORD *)v34 = v33;
  *((_QWORD *)v34 + 1) = 0;
  v34[16] = 0;
  v39 = *(_QWORD *)&v79[143];
  *(_OWORD *)(v34 + 33) = v38;
  *((_QWORD *)v34 + 20) = v39;
  *((_QWORD *)v34 + 21) = v30;
  *((_QWORD *)v34 + 22) = v32;
  sub_24B480884((uint64_t)v19, &qword_257991C70);
  KeyPath = swift_getKeyPath();
  v41 = v71;
  v42 = v72;
  v43 = v73;
  (*(void (**)(char *, _QWORD, uint64_t))(v72 + 104))(v71, *MEMORY[0x24BDED100], v73);
  v44 = (uint64_t *)&v27[*(int *)(v69 + 36)];
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991A98);
  (*(void (**)(char *, char *, uint64_t))(v42 + 16))((char *)v44 + *(int *)(v45 + 28), v41, v43);
  *v44 = KeyPath;
  sub_24B480840((uint64_t)v22, (uint64_t)v27, &qword_257991C78);
  (*(void (**)(char *, uint64_t))(v42 + 8))(v41, v43);
  v46 = (uint64_t)v22;
  v47 = (uint64_t)v70;
  sub_24B480884(v46, &qword_257991C78);
  sub_24B4807FC((uint64_t)v27, v47, &qword_257991C80);
  if (*((_BYTE *)v68 + 72) == 1)
  {
    v48 = v64;
    sub_24B4AD6B0();
    v50 = v65;
    v49 = v66;
    v51 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
    v52 = v67;
    v51(v65, v48, v67);
    v53 = (uint64_t)v75;
    *v75 = 0;
    *(_BYTE *)(v53 + 8) = 1;
    v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CA0);
    v51((char *)(v53 + *(int *)(v54 + 48)), v50, v52);
    v55 = *(void (**)(char *, uint64_t))(v49 + 8);
    v55(v48, v52);
    v55(v50, v52);
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C90);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v53, 0, 1, v56);
    v57 = v76;
    sub_24B4807FC(v53, v76, &qword_257991C68);
  }
  else
  {
    v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C90);
    v57 = v76;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 56))(v76, 1, 1, v58);
    v53 = (uint64_t)v75;
  }
  v59 = v74;
  sub_24B480840(v47, v74, &qword_257991C80);
  sub_24B480840(v57, v53, &qword_257991C68);
  v60 = v77;
  sub_24B480840(v59, v77, &qword_257991C80);
  v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C98);
  sub_24B480840(v53, v60 + *(int *)(v61 + 48), &qword_257991C68);
  sub_24B480884(v57, &qword_257991C68);
  sub_24B480884(v47, &qword_257991C80);
  sub_24B480884(v53, &qword_257991C68);
  return sub_24B480884(v59, &qword_257991C80);
}

uint64_t sub_24B4A36E4@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t OpaqueTypeConformance2;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char v37;
  char *v38;
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
  char v49;
  uint64_t KeyPath;
  void (*v51)(char *, char *, uint64_t);
  char *v52;
  char *v53;
  char *v54;
  void (*v55)(char *, uint64_t);
  _QWORD v57[2];
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  char *v74;
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

  v73 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CB8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CC0);
  v58 = *(_QWORD *)(v60 - 8);
  MEMORY[0x24BDAC7A8](v60);
  v7 = (char *)v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CC8);
  v62 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v59 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CD0);
  v63 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v61 = (char *)v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CD8);
  v68 = *(_QWORD *)(v10 - 8);
  v69 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v66 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CE0);
  v70 = *(_QWORD *)(v72 - 8);
  v12 = MEMORY[0x24BDAC7A8](v72);
  v71 = (char *)v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v65 = (char *)v57 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v74 = (char *)v57 - v16;
  v17 = *a1;
  v18 = a1[1];
  v20 = a1[2];
  v19 = a1[3];
  v81 = *a1;
  v82 = v18;
  v83 = v20;
  v84 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991C50);
  MEMORY[0x24BD206EC](&v75);
  v22 = v75;
  v21 = v76;
  swift_bridgeObjectRelease();
  v23 = HIBYTE(v21) & 0xF;
  if ((v21 & 0x2000000000000000) == 0)
    v23 = v22 & 0xFFFFFFFFFFFFLL;
  if (v23)
  {
    v24 = 0;
    v25 = 0xE000000000000000;
  }
  else
  {
    v24 = a1[10];
    v25 = swift_bridgeObjectRetain();
  }
  v79 = v24;
  v80 = v25;
  v75 = v17;
  v76 = v18;
  v77 = v20;
  v78 = v19;
  sub_24B4ADC08();
  v57[1] = sub_24B480634();
  sub_24B4ADC80();
  v26 = sub_24B480FAC(&qword_257991CE8, &qword_257991CC0, MEMORY[0x24BDF53E0]);
  v27 = v59;
  v28 = v60;
  MEMORY[0x24BD20590](1, v60, v26);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v7, v28);
  sub_24B4AD8FC();
  v29 = sub_24B4AD908();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v5, 0, 1, v29);
  v81 = v28;
  v82 = v26;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v31 = v61;
  v32 = v64;
  sub_24B4ADAC4();
  sub_24B480884((uint64_t)v5, &qword_257991CB8);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v27, v32);
  v81 = v32;
  v82 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2();
  v35 = v66;
  v34 = v67;
  sub_24B4ADA64();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v31, v34);
  v36 = a1[5];
  v37 = *((_BYTE *)a1 + 48);
  LOBYTE(v75) = *((_BYTE *)a1 + 32);
  v76 = v36;
  LOBYTE(v77) = v37;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B0);
  sub_24B4AD65C();
  v81 = v34;
  v82 = v33;
  swift_getOpaqueTypeConformance2();
  v38 = v65;
  v39 = v69;
  sub_24B4ADAE8();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v68 + 8))(v35, v39);
  v40 = v70;
  v41 = v74;
  v42 = v72;
  (*(void (**)(char *, char *, uint64_t))(v70 + 32))(v74, v38, v72);
  v43 = a1[8];
  v81 = a1[7];
  v82 = v43;
  swift_bridgeObjectRetain();
  v44 = sub_24B4ADA28();
  v46 = v45;
  v48 = v47;
  LOBYTE(v31) = v49 & 1;
  KeyPath = swift_getKeyPath();
  LODWORD(v69) = sub_24B4AD8D8();
  v51 = *(void (**)(char *, char *, uint64_t))(v40 + 16);
  v52 = v71;
  v51(v71, v41, v42);
  v53 = v73;
  v51(v73, v52, v42);
  v54 = &v53[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991CF0) + 48)];
  *(_QWORD *)v54 = v44;
  *((_QWORD *)v54 + 1) = v46;
  v54[16] = (char)v31;
  *((_QWORD *)v54 + 3) = v48;
  *((_QWORD *)v54 + 4) = KeyPath;
  *((_QWORD *)v54 + 5) = 1;
  v54[48] = 0;
  *((_DWORD *)v54 + 13) = v69;
  *((_QWORD *)v54 + 7) = 0;
  sub_24B4809E0(v44, v46, (char)v31);
  v55 = *(void (**)(char *, uint64_t))(v40 + 8);
  swift_bridgeObjectRetain();
  swift_retain();
  v55(v74, v42);
  sub_24B4808C0(v44, v46, (char)v31);
  swift_release();
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(char *, uint64_t))v55)(v52, v42);
}

uint64_t sub_24B4A3CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t KeyPath;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v8 = type metadata accessor for iCloudMailTextField();
  v51 = *(_QWORD *)(v8 - 8);
  v9 = *(_QWORD *)(v51 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v52 = (uint64_t)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v13 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v56 = *(_QWORD *)a1;
  v57 = v11;
  v58 = v13;
  v59 = v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C50);
  MEMORY[0x24BD206EC](&v60);
  v16 = v60;
  v15 = v61;
  swift_bridgeObjectRelease();
  v17 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v17 = v16 & 0xFFFFFFFFFFFFLL;
  if (v17)
  {
    v56 = v10;
    v57 = v11;
    v58 = v13;
    v59 = v12;
    MEMORY[0x24BD206EC](&v60, v14);
    v19 = v60;
    v18 = v61;
  }
  else
  {
    v19 = *(_QWORD *)(a1 + 80);
    v18 = swift_bridgeObjectRetain();
  }
  v56 = v19;
  v57 = v18;
  sub_24B480634();
  v48 = sub_24B4ADA28();
  v49 = v20;
  v22 = v21;
  v24 = v23 & 1;
  v47 = sub_24B4ADC50();
  v50 = v25;
  v26 = v52;
  sub_24B4A43FC(a1, v52);
  v27 = (*(unsigned __int8 *)(v51 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v51 + 80);
  v28 = (v9 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
  v29 = swift_allocObject();
  sub_24B4A4504(v26, v29 + v27);
  v30 = (double *)(v29 + v28);
  *v30 = a3;
  v30[1] = a4;
  v31 = *(_QWORD *)(a1 + 144);
  LOBYTE(v56) = *(_BYTE *)(a1 + 136);
  v57 = v31;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  sub_24B4ADBB4();
  LOBYTE(v26) = v60;
  v32 = *(_QWORD *)(a1 + 64);
  v56 = *(_QWORD *)(a1 + 56);
  v57 = v32;
  swift_bridgeObjectRetain();
  v33 = sub_24B4ADA28();
  v35 = v34;
  v37 = v36;
  v39 = v38 & 1;
  KeyPath = swift_getKeyPath();
  v41 = sub_24B4AD8D8();
  v53 = v24;
  LOBYTE(v56) = v24;
  LOBYTE(v60) = v26 ^ 1;
  v55 = v39;
  v54 = 0;
  v42 = v48;
  *(_QWORD *)a2 = v48;
  *(_QWORD *)(a2 + 8) = v22;
  v46 = v22;
  *(_BYTE *)(a2 + 16) = v24;
  *(_QWORD *)(a2 + 24) = v49;
  *(_QWORD *)(a2 + 32) = sub_24B4A464C;
  v43 = v47;
  *(_QWORD *)(a2 + 40) = v29;
  *(_QWORD *)(a2 + 48) = v43;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 56) = v50;
  *(_BYTE *)(a2 + 80) = v26;
  *(_BYTE *)(a2 + 81) = v26 ^ 1;
  *(_QWORD *)(a2 + 88) = v33;
  *(_QWORD *)(a2 + 96) = v35;
  *(_BYTE *)(a2 + 104) = v39;
  *(_QWORD *)(a2 + 112) = v37;
  *(_QWORD *)(a2 + 120) = KeyPath;
  *(_QWORD *)(a2 + 128) = 1;
  *(_BYTE *)(a2 + 136) = 0;
  *(_DWORD *)(a2 + 140) = v41;
  v44 = v42;
  sub_24B4809E0(v42, v22, v24);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24B4809E0(v33, v35, v39);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24B4808C0(v33, v35, v39);
  swift_release();
  swift_bridgeObjectRelease();
  sub_24B4808C0(v44, v46, v53);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B4A3FCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  double *v27;
  void (*v28)(unint64_t, char *, uint64_t);
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  double *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (**v37)();
  char *v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;

  v41 = a1;
  v46 = a3;
  v47 = sub_24B4AD6EC();
  v9 = *(_QWORD *)(v47 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v47);
  v11 = type metadata accessor for iCloudMailTextField();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991CA8);
  v44 = *(_QWORD *)(v15 - 8);
  v45 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v43 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = sub_24B4ADB3C();
  v17 = *(_OWORD *)a2;
  v18 = *(_QWORD *)(a2 + 16);
  v19 = *(_QWORD *)(a2 + 24);
  v42 = a2;
  v48 = v17;
  v49 = v18;
  v50 = v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991C50);
  MEMORY[0x24BD206EC](&v51, v20);
  v48 = v51;
  sub_24B4A43FC(a2, (uint64_t)v14);
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v39 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v21;
  v22 = v47;
  v21(v39, a1, v47);
  v23 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v24 = (v13 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (*(unsigned __int8 *)(v9 + 80) + v24 + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v26 = swift_allocObject();
  sub_24B4A4504((uint64_t)v14, v26 + v23);
  v27 = (double *)(v26 + v24);
  *v27 = a4;
  v27[1] = a5;
  v28 = *(void (**)(unint64_t, char *, uint64_t))(v9 + 32);
  v28(v26 + v25, (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v22);
  v29 = v43;
  sub_24B4ADB0C();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  sub_24B4A43FC(v42, (uint64_t)v14);
  v30 = v39;
  v31 = v47;
  v40(v39, v41, v47);
  v32 = swift_allocObject();
  sub_24B4A4504((uint64_t)v14, v32 + v23);
  v33 = (double *)(v32 + v24);
  *v33 = a4;
  v33[1] = a5;
  v28(v32 + v25, v30, v31);
  v35 = v44;
  v34 = v45;
  v36 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v44 + 16))(v46, v29, v45);
  v37 = (uint64_t (**)())(v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991CB0) + 36));
  *v37 = sub_24B4A48B0;
  v37[1] = (uint64_t (*)())v32;
  v37[2] = 0;
  v37[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v29, v34);
}

uint64_t sub_24B4A42BC()
{
  sub_24B4AD6E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  return sub_24B4ADBC0();
}

uint64_t sub_24B4A432C()
{
  sub_24B4AD6E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990430);
  return sub_24B4ADBC0();
}

uint64_t sub_24B4A439C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579918B0);
  return sub_24B4AD650();
}

uint64_t sub_24B4A43FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for iCloudMailTextField();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B4A4440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for iCloudMailTextField();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 44);
  v5 = sub_24B4AD9F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_24B4A4504(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for iCloudMailTextField();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B4A4548()
{
  type metadata accessor for iCloudMailTextField();
  return sub_24B4A439C();
}

uint64_t sub_24B4A457C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for iCloudMailTextField();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v4 = v3 + *(int *)(v1 + 44);
  v5 = sub_24B4AD9F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_deallocObject();
}

uint64_t sub_24B4A464C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  double *v7;

  v5 = *(_QWORD *)(type metadata accessor for iCloudMailTextField() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (double *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24B4A3FCC(a1, v2 + v6, a2, *v7, v7[1]);
}

uint64_t sub_24B4A46B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_24B4AD83C();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_24B4A46E0()
{
  return sub_24B4AD848();
}

uint64_t sub_24B4A4710()
{
  type metadata accessor for iCloudMailTextField();
  sub_24B4AD6EC();
  return sub_24B4A42BC();
}

uint64_t objectdestroy_9Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for iCloudMailTextField();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = sub_24B4AD6EC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (v4 + *(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  v8 = v0 + v3 + *(int *)(v1 + 44);
  v9 = sub_24B4AD9F8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

uint64_t sub_24B4A48B0()
{
  type metadata accessor for iCloudMailTextField();
  sub_24B4AD6EC();
  return sub_24B4A432C();
}

uint64_t sub_24B4A4924()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257991C40);
  sub_24B480FAC(&qword_257991C60, &qword_257991C40, MEMORY[0x24BDF4498]);
  return swift_getOpaqueTypeConformance2();
}

id iCloudMailAccountProviderSwift.__allocating_init(presenter:appleAccount:accountStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  objc_super v9;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_presenter] = a1;
  *(_QWORD *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount] = a2;
  *(_QWORD *)&v7[OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore] = a3;
  v9.receiver = v7;
  v9.super_class = v3;
  return objc_msgSendSuper2(&v9, sel_init);
}

id iCloudMailAccountProviderSwift.init(presenter:appleAccount:accountStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  objc_super v5;

  *(_QWORD *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator] = 0;
  *(_QWORD *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_presenter] = a1;
  *(_QWORD *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount] = a2;
  *(_QWORD *)&v3[OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore] = a3;
  v5.receiver = v3;
  v5.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t type metadata accessor for iCloudMailAccountProviderSwift()
{
  return objc_opt_self();
}

id sub_24B4A4B18()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  objc_super v17;

  v1 = OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator;
  v2 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator);
  }
  else
  {
    v4 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter);
    v5 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    v6 = *(void **)(v0 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    v7 = (objc_class *)type metadata accessor for LegacyMailAccountCreator();
    v8 = (char *)objc_allocWithZone(v7);
    v9 = &v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    *(_QWORD *)v9 = 0;
    *((_QWORD *)v9 + 1) = 0;
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController] = 0;
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels] = MEMORY[0x24BEE4AF8];
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader] = 0;
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter] = v4;
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount] = v5;
    *(_QWORD *)&v8[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore] = v6;
    v17.receiver = v8;
    v17.super_class = v7;
    v10 = v4;
    v11 = v5;
    v12 = v6;
    v13 = objc_msgSendSuper2(&v17, sel_init);
    v14 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v13;
    v3 = v13;

    v2 = 0;
  }
  v15 = v2;
  return v3;
}

void sub_24B4A4C38(int a1, uint64_t a2, uint64_t a3)
{
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  char v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t *v36;
  id v37;
  void *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  ValueMetadata *v51;
  _UNKNOWN **v52;

  v48 = a3;
  v47 = a2;
  v46 = a1;
  v3 = type metadata accessor for AccountCreationStartupPageView();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v44 = (uint64_t)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v45 = (uint64_t *)((char *)&v43 - v6);
  v7 = sub_24B4AD560();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v43 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v43 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v43 - v15;
  if (qword_257990130 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v7, (uint64_t)qword_257994C18);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v18(v16, v17, v7);
  v19 = sub_24B4AD548();
  v20 = sub_24B4ADDE8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v21 = 67109120;
    LODWORD(v50[0]) = v46 & 1;
    sub_24B4ADE90();
    _os_log_impl(&dword_24B47A000, v19, v20, "[iCloudMailAccountProviderSwift] present account creation with alert: %{BOOL}d", v21, 8u);
    MEMORY[0x24BD20FF8](v21, -1, -1);
  }

  v22 = *(void (**)(char *, uint64_t))(v8 + 8);
  v22(v16, v7);
  v51 = &type metadata for FeatureFlag;
  v52 = (_UNKNOWN **)sub_24B4A584C();
  v23 = sub_24B4AD530();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  if ((v23 & 1) != 0)
  {
    v18(v14, v17, v7);
    v24 = sub_24B4AD548();
    v25 = sub_24B4ADDE8();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_24B47A000, v24, v25, "[iCloudMailAccountProviderSwift] present account creation: new flow", v26, 2u);
      MEMORY[0x24BD20FF8](v26, -1, -1);
    }

    v22(v14, v7);
    v27 = v49;
    v28 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    v29 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    v30 = type metadata accessor for ACRepositoryDefault();
    v31 = swift_allocObject();
    *(_QWORD *)(v31 + 16) = v28;
    *(_QWORD *)(v31 + 24) = v29;
    v51 = (ValueMetadata *)v30;
    v52 = &off_251C5A6B0;
    v50[0] = v31;
    v32 = swift_allocObject();
    v33 = v48;
    *(_QWORD *)(v32 + 16) = v47;
    *(_QWORD *)(v32 + 24) = v33;
    v34 = v28;
    v35 = v29;
    swift_retain();
    v36 = v45;
    sub_24B496F04((uint64_t)v50, 0, (uint64_t)sub_24B48C070, v32, v45);
    sub_24B49F3F8((uint64_t)v36, v44);
    v37 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_257991D20));
    v38 = (void *)sub_24B4AD89C();
    objc_msgSend(*(id *)(v27 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter), sel_presentViewController_animated_completion_, v38, 1, 0);

    sub_24B4A58B4((uint64_t)v36);
  }
  else
  {
    v18(v11, v17, v7);
    v39 = sub_24B4AD548();
    v40 = sub_24B4ADDE8();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_24B47A000, v39, v40, "[iCloudMailAccountProviderSwift] present account creation: legacy flow", v41, 2u);
      MEMORY[0x24BD20FF8](v41, -1, -1);
    }

    v22(v11, v7);
    v42 = sub_24B4A4B18();
    sub_24B4A6880(v46 & 1, v47, v48);

  }
}

uint64_t sub_24B4A511C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  char v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  id v35;
  void *v36;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  char *v41;
  uint64_t v42;
  uint64_t (**v43)();
  uint64_t v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[3];
  ValueMetadata *v51;
  _UNKNOWN **v52;

  v48 = a2;
  v47 = a1;
  v2 = type metadata accessor for AccountCreationStartupPageView();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v45 = (uint64_t)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v46 = (uint64_t *)((char *)&v45 - v5);
  v6 = sub_24B4AD560();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v45 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v45 - v14;
  if (qword_257990130 != -1)
    swift_once();
  v16 = __swift_project_value_buffer(v6, (uint64_t)qword_257994C18);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v17(v15, v16, v6);
  v18 = sub_24B4AD548();
  v19 = sub_24B4ADDE8();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_24B47A000, v18, v19, "[iCloudMailAccountProviderSwift] present account creation from Unified Settings", v20, 2u);
    MEMORY[0x24BD20FF8](v20, -1, -1);
  }

  v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v15, v6);
  v51 = &type metadata for FeatureFlag;
  v52 = (_UNKNOWN **)sub_24B4A584C();
  v22 = sub_24B4AD530();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v50);
  if ((v22 & 1) != 0)
  {
    v17(v13, v16, v6);
    v23 = sub_24B4AD548();
    v24 = sub_24B4ADDE8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_24B47A000, v23, v24, "[iCloudMailAccountProviderSwift] present account creation: new flow", v25, 2u);
      MEMORY[0x24BD20FF8](v25, -1, -1);
    }

    v21(v13, v6);
    v26 = v49;
    v27 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore);
    v28 = *(void **)(v49 + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount);
    v29 = type metadata accessor for ACRepositoryDefault();
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v27;
    *(_QWORD *)(v30 + 24) = v28;
    v51 = (ValueMetadata *)v29;
    v52 = &off_251C5A6B0;
    v50[0] = v30;
    v31 = v27;
    v32 = v28;
    v33 = v48;
    swift_retain();
    v34 = v46;
    sub_24B496F04((uint64_t)v50, 1, v47, v33, v46);
    sub_24B49F3F8((uint64_t)v34, v45);
    v35 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_257991D20));
    v36 = (void *)sub_24B4AD89C();
    objc_msgSend(*(id *)(v26 + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter), sel_presentViewController_animated_completion_, v36, 1, 0);

    return sub_24B4A58B4((uint64_t)v34);
  }
  else
  {
    v17(v10, v16, v6);
    v38 = sub_24B4AD548();
    v39 = sub_24B4ADDE8();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_24B47A000, v38, v39, "[iCloudMailAccountProviderSwift] present account creation: legacy flow", v40, 2u);
      MEMORY[0x24BD20FF8](v40, -1, -1);
    }

    v21(v10, v6);
    v41 = (char *)sub_24B4A4B18();
    v42 = swift_allocObject();
    *(_QWORD *)(v42 + 16) = v47;
    *(_QWORD *)(v42 + 24) = v48;
    v43 = (uint64_t (**)())&v41[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    v44 = *(_QWORD *)&v41[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler];
    *v43 = sub_24B4A58F0;
    v43[1] = (uint64_t (*)())v42;
    swift_retain();
    swift_retain();
    sub_24B480AF4(v44);
    sub_24B4A6E5C();

    return swift_release();
  }
}

id iCloudMailAccountProviderSwift.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void iCloudMailAccountProviderSwift.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id iCloudMailAccountProviderSwift.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24B4A56F8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_24B4A5708(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_24B4A573C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *sub_24B4A574C(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_24B4ADF74();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_24B4A57E0(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_24B4A5804(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24B4A5824@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

unint64_t sub_24B4A584C()
{
  unint64_t result;

  result = qword_257991D18;
  if (!qword_257991D18)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4B0C28, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_257991D18);
  }
  return result;
}

uint64_t sub_24B4A5890()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B4A58B4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AccountCreationStartupPageView();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24B4A58F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
}

uint64_t method lookup function for iCloudMailAccountProviderSwift()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.__allocating_init(presenter:appleAccount:accountStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.present(with:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of iCloudMailAccountProviderSwift.present(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t sub_24B4A5960()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24B4A5984(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t sub_24B4A5998()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_24B4A59AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  _OWORD *v4;
  __int128 v5;
  _BYTE v7[48];
  uint64_t v8;

  v8 = *a3;
  sub_24B4A5A78((uint64_t)(a3 + 2), (uint64_t)v7);
  v4 = (_OWORD *)swift_allocObject();
  v5 = *((_OWORD *)a3 + 1);
  v4[1] = *(_OWORD *)a3;
  v4[2] = v5;
  v4[3] = *((_OWORD *)a3 + 2);
  *(_OWORD *)((char *)v4 + 57) = *(_OWORD *)((char *)a3 + 41);
  swift_bridgeObjectRetain();
  sub_24B4A5B54((uint64_t)&v8);
  swift_retain();
  sub_24B4A5B7C((uint64_t)v7);
  sub_24B480634();
  return sub_24B4ADBD8();
}

uint64_t sub_24B4A5A78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_2579910D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B4A5AC0()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24B4A5AF4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991830);
  return sub_24B4ADBFC();
}

uint64_t sub_24B4A5B54(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_24B4A5B7C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_24B4A5BA4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991ED0);
  v2 = (_QWORD *)sub_24B4ADF68();
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
    result = sub_24B495B1C(v5, v6);
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

unint64_t sub_24B4A5CBC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257991EC0);
  v2 = sub_24B4ADF68();
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
    sub_24B480840(v6, (uint64_t)&v15, &qword_257990C18);
    v7 = v15;
    v8 = v16;
    result = sub_24B495B1C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_24B489C50(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_24B4A5DF0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991EB8);
  v2 = (_QWORD *)sub_24B4ADF68();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_24B495B1C(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
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

uint64_t sub_24B4A5F04(uint64_t a1)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991EB0);
    v2 = sub_24B4ADF68();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
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
    sub_24B489C14(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_24B489C50(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_24B489C50(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_24B489C50(v36, v37);
    sub_24B489C50(v37, &v33);
    result = sub_24B4ADECC();
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
    result = (uint64_t)sub_24B489C50(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_24B4AA774();
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

uint64_t sub_24B4A62C8(uint64_t a1)
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
  _OWORD v36[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257991EB0);
    v2 = sub_24B4ADF68();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
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
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_24B489C50(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_24B489C50(v35, v36);
    sub_24B489C50(v36, &v32);
    result = sub_24B4ADECC();
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
    result = (uint64_t)sub_24B489C50(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_24B4AA774();
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

void sub_24B4A6670(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_24B4A66D0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_24B4A66FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___navigationController);
  }
  else
  {
    v4 = sub_24B4A6758();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_24B4A6758()
{
  id v0;
  id v1;
  id v2;
  uint64_t v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_init);
  v1 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v2 = objc_msgSend(v1, sel_userInterfaceIdiom);

  if ((sub_24B49C8C4((uint64_t)v2, (uint64_t)&unk_251C58F60) & 1) != 0)
    v3 = 2;
  else
    v3 = 0;
  objc_msgSend(v0, sel_setModalPresentationStyle_, v3);
  return v0;
}

id sub_24B4A67FC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator____lazy_storage___ruiLoader);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7EDC8]), sel_init);
    objc_msgSend(v4, sel_setDelegate_, v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_24B4A6880(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t ObjCClassFromMetadata;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t aBlock;
  unint64_t v25;
  void (*v26)(uint64_t, void *);
  void *v27;
  void (*v28)(uint64_t);
  uint64_t v29;

  v4 = v3;
  v6 = (_QWORD *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
  v7 = *(_QWORD *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
  *v6 = a2;
  v6[1] = a3;
  swift_retain();
  sub_24B480AF4(v7);
  if ((a1 & 1) != 0)
  {
    _s18CurrentBundleClassCMa();
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v9 = (void *)objc_opt_self();
    v10 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_24B4ADD70();
    sub_24B4ADD70();
    sub_24B4AD470();

    swift_bridgeObjectRelease();
    v11 = objc_msgSend(v9, (SEL)&stru_251C5C6F0.imp + 1, ObjCClassFromMetadata, 0xE000000000000000);
    sub_24B4ADD70();
    sub_24B4ADD70();
    sub_24B4AD470();

    swift_bridgeObjectRelease();
    v12 = (void *)sub_24B4ADD1C();
    swift_bridgeObjectRelease();
    v13 = (void *)sub_24B4ADD1C();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v12, v13, 1, 0xE000000000000000);

    v15 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    sub_24B4ADD70();
    sub_24B4ADD70();
    sub_24B4AD470();

    swift_bridgeObjectRelease();
    v16 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v17 = (void *)sub_24B4ADD1C();
    swift_bridgeObjectRelease();
    v28 = sub_24B4AAA44;
    v29 = v16;
    aBlock = MEMORY[0x24BDAC760];
    v25 = 1107296256;
    v26 = sub_24B4A6E0C;
    v27 = &block_descriptor_81;
    v18 = _Block_copy(&aBlock);
    swift_release();
    v19 = (void *)objc_opt_self();
    v20 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v17, 0, v18, 0xE000000000000000);
    _Block_release(v18);
    swift_release();

    v21 = objc_msgSend(v9, sel_bundleForClass_, ObjCClassFromMetadata);
    aBlock = 2777980912;
    v25 = 0xA400000000000000;
    sub_24B4ADD70();
    sub_24B4ADD70();
    sub_24B4AD470();

    swift_bridgeObjectRelease();
    v22 = (void *)sub_24B4ADD1C();
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v19, sel_actionWithTitle_style_handler_, v22, 1, 0, 0xE000000000000000);

    objc_msgSend(v14, sel_addAction_, v23);
    objc_msgSend(v14, sel_addAction_, v20);
    objc_msgSend(*(id *)(v4 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter), sel_presentViewController_animated_completion_, v14, 1, 0);

  }
  else
  {
    sub_24B4A6E5C();
  }
}

void sub_24B4A6DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x24BD21064](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_24B4A6E5C();

  }
}

void sub_24B4A6E0C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_24B4A6E5C()
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
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD aBlock[6];

  v1 = sub_24B4ADC98();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4ADCBC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v9 = (void *)sub_24B4ADE48();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v0;
  aBlock[4] = sub_24B4AA9C8;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_53;
  v11 = _Block_copy(aBlock);
  v12 = v0;
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v8, v4, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_24B4A7034(char *a1)
{
  uint64_t v2;
  void *v3;
  char *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  v3 = *(void **)&a1[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
  v4 = a1;
  v5 = objc_msgSend(v3, sel_identifier);

  if (!v5)
    goto LABEL_4;
  v6 = objc_msgSend(v3, sel_aa_authToken);
  if (v6)
  {

LABEL_4:
    v7 = objc_msgSend((id)objc_opt_self(), sel_sharedServer);
    v8 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v16 = sub_24B4AA9D8;
    v17 = v8;
    v12 = MEMORY[0x24BDAC760];
    v13 = 1107296256;
    v14 = sub_24B48B2BC;
    v15 = &block_descriptor_60;
    v9 = _Block_copy(&v12);
    swift_release();
    objc_msgSend(v7, sel_configurationWithCompletion_, v9);
LABEL_7:
    _Block_release(v9);

    swift_release();
    return;
  }
  v10 = objc_msgSend(v3, sel_accountStore);
  if (v10)
  {
    v7 = v10;
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = sub_24B4AA9D0;
    *(_QWORD *)(v11 + 24) = v2;
    v16 = sub_24B4AAA04;
    v17 = v11;
    v12 = MEMORY[0x24BDAC760];
    v13 = 1107296256;
    v14 = sub_24B4A6670;
    v15 = &block_descriptor_66;
    v9 = _Block_copy(&v12);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_renewCredentialsForAccount_completion_, v3, v9);
    goto LABEL_7;
  }

  __break(1u);
}

void sub_24B4A725C()
{
  id v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[6];

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedServer);
  v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3[4] = sub_24B4AA9D8;
  v3[5] = v1;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 1107296256;
  v3[2] = sub_24B48B2BC;
  v3[3] = &block_descriptor_77;
  v2 = _Block_copy(v3);
  swift_release();
  objc_msgSend(v0, sel_configurationWithCompletion_, v2);
  _Block_release(v2);

}

void sub_24B4A733C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v35 - v9;
  v11 = sub_24B4AD560();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v15 = MEMORY[0x24BD21064](a3 + 16);
  if (v15)
  {
    v16 = (char *)v15;
    if (a1 && (v17 = objc_msgSend(a1, sel_addEmailURL)) != 0)
    {
      v18 = v17;
      sub_24B4ADD28();

      v19 = *(void **)&v16[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
      v20 = objc_allocWithZone(MEMORY[0x24BE048F8]);
      v21 = v19;
      v22 = (void *)sub_24B4ADD1C();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v20, sel_initWithURLString_account_, v22, v21);

      v24 = sub_24B4A67FC();
      if (v23)
      {
        v25 = objc_msgSend(v23, sel_urlRequest);
        if (v25)
        {
          v26 = v25;
          sub_24B4AD3C8();

          v27 = sub_24B4AD3EC();
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v8, 0, 1, v27);
        }
        else
        {
          v27 = sub_24B4AD3EC();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v8, 1, 1, v27);
        }
        sub_24B4807FC((uint64_t)v8, (uint64_t)v10, &qword_257991E78);
        sub_24B4AD3EC();
        v34 = *(_QWORD *)(v27 - 8);
        v33 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v10, 1, v27) != 1)
        {
          v33 = (void *)sub_24B4AD3BC();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v27);
        }
      }
      else
      {
        v32 = sub_24B4AD3EC();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v10, 1, 1, v32);
        v33 = 0;
      }
      objc_msgSend(v24, sel_loadXMLUIWithRequest_, v33);

    }
    else
    {
      if (qword_257990130 != -1)
        swift_once();
      v28 = __swift_project_value_buffer(v11, (uint64_t)qword_257994C18);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v28, v11);
      v29 = sub_24B4AD548();
      v30 = sub_24B4ADDF4();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v31 = 0;
        _os_log_impl(&dword_24B47A000, v29, v30, "Add email url is missing from bag", v31, 2u);
        MEMORY[0x24BD20FF8](v31, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
}

uint64_t sub_24B4A76C0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[6];

  v8 = sub_24B4ADC98();
  v20 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_24B4ADCBC();
  v11 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v14 = (void *)sub_24B4ADE48();
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a1;
  v15[3] = a3;
  v15[4] = a4;
  v15[5] = a2;
  aBlock[4] = sub_24B4AAA38;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_72;
  v16 = _Block_copy(aBlock);
  swift_retain();
  v17 = a2;
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v13, v10, v16);
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v19);
}

uint64_t sub_24B4A78BC(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = sub_24B4AD560();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
    return a2(v9);
  if (qword_257990130 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v7, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
  v13 = a4;
  v14 = a4;
  v15 = sub_24B4AD548();
  v16 = sub_24B4ADDF4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v23 = (_QWORD *)swift_slowAlloc();
    v24 = a1;
    *(_DWORD *)v17 = 134218242;
    sub_24B4ADE90();
    *(_WORD *)(v17 + 12) = 2112;
    if (a4)
    {
      v18 = a4;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v24 = v19;
      sub_24B4ADE90();
    }
    else
    {
      v24 = 0;
      sub_24B4ADE90();
      v19 = 0;
    }
    v21 = v23;
    *v23 = v19;

    _os_log_impl(&dword_24B47A000, v15, v16, "Renew credentials for legacy iCloud mail creation failed. Result: %ld error: %@", (uint8_t *)v17, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579915A0);
    swift_arrayDestroy();
    MEMORY[0x24BD20FF8](v21, -1, -1);
    MEMORY[0x24BD20FF8](v17, -1, -1);
  }
  else
  {

  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
}

id sub_24B4A7B6C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LegacyMailAccountCreator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for LegacyMailAccountCreator()
{
  return objc_opt_self();
}

uint64_t sub_24B4A7C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v24 = a3;
  v25 = a5;
  v23 = a1;
  v6 = sub_24B4ADC98();
  v28 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B4ADCBC();
  v26 = *(_QWORD *)(v9 - 8);
  v27 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v15 = (void *)sub_24B4ADE48();
  sub_24B480840(a4, (uint64_t)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_257991E78);
  v16 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v17 = swift_allocObject();
  v18 = v24;
  *(_QWORD *)(v17 + 16) = v23;
  *(_QWORD *)(v17 + 24) = v18;
  sub_24B4807FC((uint64_t)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16, &qword_257991E78);
  v19 = v25;
  *(_QWORD *)(v17 + ((v14 + v16 + 7) & 0xFFFFFFFFFFFFFFF8)) = v25;
  aBlock[4] = sub_24B4AA95C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_47;
  v20 = _Block_copy(aBlock);
  v21 = v19;
  swift_retain();
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v11, v8, v20);
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v11, v27);
}

unint64_t sub_24B4A7EBC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
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
  char *v14;
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  unint64_t result;
  id v36;
  uint64_t v37;
  char *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (**v52)(char *, uint64_t);
  char *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t (**v61)(char *, uint64_t);
  uint64_t v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  uint64_t v66;
  char *v67;
  void *v68;
  id v69;
  id v70;
  void *v71;
  uint64_t (**v72)(char *, uint64_t);
  id v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  void (*v80)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  char *v91;
  unint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  id v105;
  uint64_t v106;
  char *v107;
  uint64_t (**v108)(char *, uint64_t);
  uint64_t v109;
  uint64_t v110[3];

  v105 = a4;
  v102 = a3;
  v103 = a2;
  v107 = (char *)a1;
  v106 = sub_24B4AD560();
  v108 = *(uint64_t (***)(char *, uint64_t))(v106 - 8);
  v4 = MEMORY[0x24BDAC7A8](v106);
  v104 = (char *)&v99 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v99 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v99 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v99 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v99 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v99 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)&v99 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v99 - v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v99 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v99 - v31;
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v99 - v33;
  if (v107)
  {
    result = (unint64_t)v105;
    if (v105)
    {
      v36 = objc_msgSend(v105, sel_URL);
      v37 = v106;
      v38 = v104;
      if (v36)
      {
        v39 = v36;
        sub_24B4AD4A0();

        v40 = sub_24B4AD4C4();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v29, 0, 1, v40);
      }
      else
      {
        v40 = sub_24B4AD4C4();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v29, 1, 1, v40);
      }
      sub_24B4807FC((uint64_t)v29, (uint64_t)v32, &qword_257991E70);
      sub_24B4AD4C4();
      v57 = *(_QWORD *)(v40 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v57 + 48))(v32, 1, v40) == 1)
      {
        sub_24B480884((uint64_t)v32, &qword_257991E70);
        v58 = 0xE300000000000000;
        v59 = 7104878;
      }
      else
      {
        v59 = sub_24B4AD494();
        v58 = v60;
        (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v40);
      }
      v61 = v108;
      if (qword_257990130 != -1)
        swift_once();
      v62 = __swift_project_value_buffer(v37, (uint64_t)qword_257994C18);
      ((void (*)(char *, uint64_t, uint64_t))v61[2])(v38, v62, v37);
      swift_bridgeObjectRetain();
      v63 = sub_24B4AD548();
      v64 = sub_24B4ADDF4();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc();
        v66 = swift_slowAlloc();
        v110[0] = v66;
        *(_DWORD *)v65 = 136315138;
        swift_bridgeObjectRetain();
        v109 = sub_24B49F648(v59, v58, v110);
        sub_24B4ADE90();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24B47A000, v63, v64, "Token renew failed for iCloud mail create url %s", v65, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24BD20FF8](v66, -1, -1);
        MEMORY[0x24BD20FF8](v65, -1, -1);

        return v108[1](v38, v37);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        return v61[1](v38, v37);
      }
    }
    goto LABEL_59;
  }
  v99 = v20;
  v100 = v14;
  v101 = v7;
  v104 = v17;
  v105 = v11;
  v107 = v23;
  v41 = v103 + 16;
  swift_beginAccess();
  result = MEMORY[0x24BD21064](v41);
  if (!result)
    return result;
  v42 = (char *)result;
  sub_24B480840(v102, (uint64_t)v25, &qword_257991E78);
  v43 = sub_24B4AD3EC();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v44 + 48);
  result = v45(v25, 1, v43);
  if ((_DWORD)result == 1)
    goto LABEL_60;
  sub_24B4AD3D4();
  v46 = *(void (**)(char *, uint64_t))(v44 + 8);
  v46(v25, v43);
  v47 = sub_24B4AD4C4();
  v48 = *(_QWORD *)(v47 - 8);
  v49 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v48 + 48))(v34, 1, v47);
  v50 = v106;
  if (v49 != 1)
  {
    sub_24B4AD494();
    (*(void (**)(char *, uint64_t))(v48 + 8))(v34, v47);
    v67 = v42;
    v68 = *(void **)&v42[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
    v69 = objc_allocWithZone(MEMORY[0x24BE048F8]);
    v70 = v68;
    v71 = (void *)sub_24B4ADD1C();
    swift_bridgeObjectRelease();
    v72 = (uint64_t (**)(char *, uint64_t))objc_msgSend(v69, sel_initWithURLString_account_, v71, v70);

    if (v72)
    {
      v73 = objc_msgSend(v72, sel_urlRequest);
      v74 = v102;
      if (v73)
      {
        v75 = v73;
        v76 = (uint64_t)v99;
        sub_24B4AD3C8();

        v77 = 0;
        v78 = v67;
        v79 = (uint64_t)v104;
      }
      else
      {
        v77 = 1;
        v78 = v67;
        v79 = (uint64_t)v104;
        v76 = (uint64_t)v99;
      }
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v76, v77, 1, v43);
      v81 = (uint64_t)v107;
      sub_24B4807FC(v76, (uint64_t)v107, &qword_257991E78);
      v82 = (uint64_t)v105;
    }
    else
    {
      v80 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v44 + 56);
      v81 = (uint64_t)v107;
      v80(v107, 1, 1, v43);
      v78 = v67;
      v79 = (uint64_t)v104;
      v82 = (uint64_t)v105;
      v74 = v102;
    }
    if (!v45((char *)v81, 1, v43))
    {
      v108 = v72;
      sub_24B480840(v74, v79, &qword_257991E78);
      result = v45((char *)v79, 1, v43);
      if ((_DWORD)result == 1)
      {
LABEL_62:
        __break(1u);
        return result;
      }
      sub_24B4AD3A4();
      v46((char *)v79, v43);
      sub_24B4AD3B0();
      v72 = v108;
    }
    v83 = v74;
    v84 = (uint64_t)v100;
    sub_24B480840(v83, (uint64_t)v100, &qword_257991E78);
    result = v45((char *)v84, 1, v43);
    if ((_DWORD)result == 1)
    {
LABEL_61:
      __break(1u);
      goto LABEL_62;
    }
    sub_24B4AD3A4();
    v86 = v85;
    v46((char *)v84, v43);
    if (!v86)
      goto LABEL_51;
    v87 = sub_24B4ADD4C();
    v89 = v88;
    swift_bridgeObjectRelease();
    if (v87 == 1414745936 && v89 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v90 = sub_24B4ADFC8();
      swift_bridgeObjectRelease();
      if ((v90 & 1) == 0)
        goto LABEL_51;
    }
    if (!v45((char *)v81, 1, v43))
    {
      v91 = &v78[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels];
      swift_beginAccess();
      v92 = *(_QWORD *)v91;
      if (v92 >> 62)
      {
        swift_bridgeObjectRetain();
        v93 = sub_24B4ADF44();
        if (v93)
        {
LABEL_41:
          result = v93 - 1;
          if (__OFSUB__(v93, 1))
          {
            __break(1u);
          }
          else if ((v92 & 0xC000000000000001) == 0)
          {
            if ((result & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (result < *(_QWORD *)((v92 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              v94 = *(id *)(v92 + 8 * result + 32);
              goto LABEL_46;
            }
            __break(1u);
LABEL_59:
            __break(1u);
LABEL_60:
            __break(1u);
            goto LABEL_61;
          }
          v94 = (id)MEMORY[0x24BD20A04](result, v92);
LABEL_46:
          v95 = v94;
          swift_bridgeObjectRelease();
          v96 = objc_msgSend(v95, sel_postbackData);

          if (v96)
          {
            sub_24B4AD4DC();

          }
          goto LABEL_50;
        }
      }
      else
      {
        v93 = *(_QWORD *)((v92 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v93)
          goto LABEL_41;
      }
      swift_bridgeObjectRelease();
LABEL_50:
      sub_24B4AD3E0();
    }
LABEL_51:
    v97 = sub_24B4A67FC();
    sub_24B480840(v81, v82, &qword_257991E78);
    if (v45((char *)v82, 1, v43) == 1)
    {
      v98 = 0;
    }
    else
    {
      v98 = (void *)sub_24B4AD3BC();
      v46((char *)v82, v43);
    }
    objc_msgSend(v97, sel_loadXMLUIWithRequest_, v98);

    return sub_24B480884(v81, &qword_257991E78);
  }
  sub_24B480884((uint64_t)v34, &qword_257991E70);
  if (qword_257990130 != -1)
    swift_once();
  v51 = __swift_project_value_buffer(v50, (uint64_t)qword_257994C18);
  v52 = v108;
  v53 = v101;
  ((void (*)(char *, uint64_t, uint64_t))v108[2])(v101, v51, v50);
  v54 = sub_24B4AD548();
  v55 = sub_24B4ADDF4();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v56 = 0;
    _os_log_impl(&dword_24B47A000, v54, v55, "Renewing account token for AddEmail is nil", v56, 2u);
    MEMORY[0x24BD20FF8](v56, -1, -1);
  }

  return v52[1](v53, v50);
}

void sub_24B4A8AA8(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[6];

  v5 = *(void **)(a1 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);
  v6 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v6;
  v7[3] = a2;
  v7[4] = a3;
  v11[4] = sub_24B4AA6E0;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_24B4A6670;
  v11[3] = &block_descriptor_13;
  v8 = _Block_copy(v11);
  v9 = a3;
  v10 = a2;
  swift_release();
  objc_msgSend(v5, sel_aa_updatePropertiesForAppleAccount_completion_, v10, v8);
  _Block_release(v8);
}

void sub_24B4A8BAC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD aBlock[6];

  v8 = a3 + 16;
  swift_beginAccess();
  v9 = MEMORY[0x24BD21064](v8);
  if (v9)
  {
    v10 = (void *)v9;
    v11 = *(id *)(v9 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);

    v12 = (_QWORD *)swift_allocObject();
    v12[2] = a3;
    v12[3] = a4;
    v12[4] = a5;
    aBlock[4] = sub_24B4AA724;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24B4A6670;
    aBlock[3] = &block_descriptor_19;
    v13 = _Block_copy(aBlock);
    v14 = a5;
    swift_retain();
    v15 = a4;
    swift_release();
    objc_msgSend(v11, sel_saveVerifiedAccount_withCompletionHandler_, v15, v13);
    _Block_release(v13);

  }
}

void sub_24B4A8CCC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD aBlock[6];

  v8 = a3 + 16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990FC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = sub_24B4ADD28();
  *(_QWORD *)(inited + 40) = v10;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 56) = sub_24B4ADD28();
  *(_QWORD *)(inited + 64) = v11;
  *(_BYTE *)(inited + 72) = 0;
  v12 = sub_24B4A5DF0(inited);
  swift_beginAccess();
  v13 = MEMORY[0x24BD21064](v8);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = *(id *)(v13 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_accountStore);

    sub_24B4A62C8(v12);
    swift_bridgeObjectRelease();
    v16 = (void *)sub_24B4ADCEC();
    swift_bridgeObjectRelease();
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = a5;
    *(_QWORD *)(v17 + 24) = a3;
    aBlock[4] = sub_24B4AA734;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24B4A6670;
    aBlock[3] = &block_descriptor_25;
    v18 = _Block_copy(aBlock);
    v19 = a5;
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_renewCredentialsForAccount_options_completion_, a4, v16, v18);
    _Block_release(v18);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_24B4A8EA4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD aBlock[6];

  v6 = sub_24B4ADC98();
  v19 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B4ADCBC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B489CA0(0, (unint64_t *)&qword_257990550);
  v13 = (void *)sub_24B4ADE48();
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a3;
  *(_QWORD *)(v14 + 24) = a4;
  aBlock[4] = sub_24B4AA76C;
  aBlock[5] = v14;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = &block_descriptor_31;
  v15 = _Block_copy(aBlock);
  v16 = a3;
  swift_retain();
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B48BF9C();
  sub_24B4ADEC0();
  MEMORY[0x24BD20950](0, v12, v8, v15);
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_24B4A9090(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD aBlock[6];

  if (a1)
  {
    v3 = a2 + 16;
    objc_msgSend(a1, sel_stopActivityIndicator);
    swift_beginAccess();
    v4 = MEMORY[0x24BD21064](v3);
    if (v4)
    {
      v5 = (void *)v4;
      v6 = sub_24B4A66FC();

      aBlock[4] = sub_24B4AA66C;
      aBlock[5] = a2;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_24B4A5F00;
      aBlock[3] = &block_descriptor_34;
      v7 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, v7);
      _Block_release(v7);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_24B4A9208(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(char *, uint64_t, uint64_t);
  uint64_t v35;
  char v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;

  v5 = v4;
  v44 = a3;
  v45 = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v42 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v42 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B480840(a2, (uint64_t)v19, &qword_257991E70);
  v20 = sub_24B4AD4C4();
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) == 1)
  {
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  sub_24B4AD494();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v20);
  v22 = *(void **)(v5 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount);
  v23 = objc_allocWithZone(MEMORY[0x24BE048F8]);
  v24 = v22;
  v25 = (void *)sub_24B4ADD1C();
  swift_bridgeObjectRelease();
  v26 = objc_msgSend(v23, sel_initWithURLString_account_, v25, v24);

  v43 = v26;
  if (v26)
  {
    v27 = objc_msgSend(v26, sel_urlRequest);
    if (v27)
    {
      v28 = v27;
      sub_24B4AD3C8();

      v29 = sub_24B4AD3EC();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v14, 0, 1, v29);
    }
    else
    {
      v31 = sub_24B4AD3EC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v14, 1, 1, v31);
    }
    sub_24B4807FC((uint64_t)v14, (uint64_t)v16, &qword_257991E78);
  }
  else
  {
    v30 = sub_24B4AD3EC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v16, 1, 1, v30);
  }
  v32 = sub_24B4AD3EC();
  v33 = *(_QWORD *)(v32 - 8);
  v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
  if (!v34(v16, 1, v32))
  {
    swift_bridgeObjectRetain();
    sub_24B4AD3B0();
  }
  if (!a4)
    goto LABEL_26;
  if (sub_24B4ADD4C() == 1414745936 && v35 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v36 = sub_24B4ADFC8();
    swift_bridgeObjectRelease();
    if ((v36 & 1) == 0)
      goto LABEL_20;
  }
  if (v34(v16, 1, v32))
  {
LABEL_20:
    v39 = sub_24B4A67FC();
    sub_24B480840((uint64_t)v16, (uint64_t)v11, &qword_257991E78);
    if (v34(v11, 1, v32) == 1)
    {
      v40 = 0;
    }
    else
    {
      v40 = (void *)sub_24B4AD3BC();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v32);
    }
    v41 = v45;
    objc_msgSend(v39, sel_loadXMLUIWithRequest_, v40);

    if (v41)
    {
      objc_msgSend(v41, sel_startActivityIndicator);

      sub_24B480884((uint64_t)v16, &qword_257991E78);
      return;
    }
    goto LABEL_27;
  }
  if (v45)
  {
    v37 = objc_msgSend(v45, sel_postbackData);
    if (v37)
    {
      v38 = v37;
      sub_24B4AD4DC();

    }
    sub_24B4AD3E0();
    goto LABEL_20;
  }
LABEL_28:
  __break(1u);
}

void sub_24B4A9764(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void (*v4)(void);

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24BD21064](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void (**)(void))(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_completionHandler);
    sub_24B4809D0((uint64_t)v4);

    if (v4)
    {
      v4();
      sub_24B480AF4((uint64_t)v4);
    }
  }
}

uint64_t sub_24B4A98E4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_24B49F648(v6, v7, a3);
  v8 = *a1 + 8;
  sub_24B4ADE90();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void sub_24B4A9954(void *a1, uint64_t a2)
{
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t inited;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t aBlock[6];

  v51 = a2;
  v4 = sub_24B4AD560();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E78);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  v11 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v44 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991E70);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
    return;
  }
  if (objc_msgSend(a1, sel_statusCode) != (id)401)
    return;
  v49 = v9;
  v50 = (uint64_t)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B480840(v51, (uint64_t)v13, &qword_257991E78);
  v17 = sub_24B4AD3EC();
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v13, 1, v17) == 1)
    goto LABEL_16;
  v48 = v2;
  sub_24B4AD3D4();
  (*(void (**)(char *, uint64_t))(v18 + 8))(v13, v17);
  v19 = sub_24B4AD4C4();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v16, 1, v19) == 1)
  {
    sub_24B480884((uint64_t)v16, &qword_257991E70);
    v47 = 0;
    v21 = 0xE000000000000000;
  }
  else
  {
    v47 = sub_24B4AD494();
    v21 = v22;
    (*(void (**)(char *, uint64_t))(v20 + 8))(v16, v19);
  }
  if (qword_257990130 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v4, (uint64_t)qword_257994C18);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v23, v4);
  swift_bridgeObjectRetain();
  v24 = sub_24B4AD548();
  v25 = sub_24B4ADE0C();
  if (os_log_type_enabled(v24, v25))
  {
    v45 = v5;
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v46 = a1;
    v28 = v27;
    aBlock[0] = v27;
    *(_DWORD *)v26 = 136315138;
    swift_bridgeObjectRetain();
    v52 = sub_24B49F648(v47, v21, aBlock);
    sub_24B4ADE90();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24B47A000, v24, v25, "Received 401 for URL %s", v26, 0xCu);
    swift_arrayDestroy();
    v29 = v28;
    a1 = v46;
    MEMORY[0x24BD20FF8](v29, -1, -1);
    MEMORY[0x24BD20FF8](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v45 + 8))(v7, v4);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990FC0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(inited + 32) = sub_24B4ADD28();
  *(_QWORD *)(inited + 40) = v31;
  *(_BYTE *)(inited + 48) = 1;
  *(_QWORD *)(inited + 56) = sub_24B4ADD28();
  *(_QWORD *)(inited + 64) = v32;
  *(_BYTE *)(inited + 72) = 0;
  v33 = sub_24B4A5DF0(inited);
  v34 = *(void **)(v48 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount);
  v35 = objc_msgSend(v34, sel_accountStore);
  if (!v35)
    goto LABEL_17;
  v36 = v35;
  sub_24B4A62C8(v33);
  swift_bridgeObjectRelease();
  v37 = (void *)sub_24B4ADCEC();
  swift_bridgeObjectRelease();
  v38 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v39 = v50;
  sub_24B480840(v51, v50, &qword_257991E78);
  v40 = (*(unsigned __int8 *)(v49 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80);
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v38;
  sub_24B4807FC(v39, v41 + v40, &qword_257991E78);
  *(_QWORD *)(v41 + ((v10 + v40 + 7) & 0xFFFFFFFFFFFFFFF8)) = a1;
  aBlock[4] = (uint64_t)sub_24B4AA838;
  aBlock[5] = v41;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24B4A6670;
  aBlock[3] = (uint64_t)&block_descriptor_41;
  v42 = _Block_copy(aBlock);
  v43 = a1;
  swift_release();
  objc_msgSend(v36, sel_renewCredentialsForAccount_options_completion_, v34, v37, v42);
  _Block_release(v42);

}

id sub_24B4A9EE4(void *a1, void *a2)
{
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
  id result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  char *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  id v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  id v45;
  char v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  void *v54;
  char *v55;
  _QWORD aBlock[9];

  v54 = a1;
  v3 = sub_24B4ADC98();
  v53 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v52 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B4ADCBC();
  v50 = *(_QWORD *)(v5 - 8);
  v51 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24B4ADCA4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24B4AD560();
  v13 = *(_QWORD *)(v12 - 8);
  result = (id)MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v49 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
    goto LABEL_29;
  if (objc_msgSend(a2, sel_topSignal) == (id)1)
  {
    v49 = v3;
    if (qword_257990130 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v12, (uint64_t)qword_257994C18);
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, v17, v12);
    v18 = sub_24B4AD548();
    v19 = sub_24B4ADE0C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_24B47A000, v18, v19, "Dismissing iCloud Mail Create flow", v20, 2u);
      MEMORY[0x24BD20FF8](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    v21 = v55;
    v22 = *(void **)&v55[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_appleAccount];
    objc_msgSend(v22, sel_setEnabled_forDataclass_, 1, *MEMORY[0x24BDB3E38]);
    sub_24B489CA0(0, (unint64_t *)&qword_257990550);
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BEE5490], v8);
    v23 = (void *)sub_24B4ADE60();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = v21;
    v24[3] = v22;
    v25 = v54;
    v24[4] = v54;
    aBlock[4] = sub_24B4AA6D0;
    aBlock[5] = v24;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24B4A5F00;
    aBlock[3] = &block_descriptor_6;
    v26 = _Block_copy(aBlock);
    v27 = v25;
    v28 = v21;
    v29 = v22;
    sub_24B4ADCB0();
    aBlock[6] = MEMORY[0x24BEE4AF8];
    sub_24B48BF54();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
    sub_24B48BF9C();
    v30 = v52;
    v31 = v49;
    sub_24B4ADEC0();
    MEMORY[0x24BD20950](0, v7, v30, v26);
    _Block_release(v26);

    (*(void (**)(char *, uint64_t))(v53 + 8))(v30, v31);
    (*(void (**)(char *, uint64_t))(v50 + 8))(v7, v51);
    return (id)swift_release();
  }
  result = objc_msgSend(a2, sel_topSignal);
  if (result != (id)2)
    return result;
  v32 = v55;
  v33 = &v55[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels];
  swift_beginAccess();
  v34 = *(_QWORD *)v33;
  if (*(_QWORD *)v33 >> 62)
  {
    swift_bridgeObjectRetain();
    result = (id)sub_24B4ADF44();
    v35 = (uint64_t)result;
    if (!result)
      goto LABEL_18;
  }
  else
  {
    v35 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (!v35)
      goto LABEL_18;
  }
  if (v35 < 1)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  for (i = 0; i != v35; ++i)
  {
    if ((v34 & 0xC000000000000001) != 0)
      v37 = (id)MEMORY[0x24BD20A04](i, v34);
    else
      v37 = *(id *)(v34 + 8 * i + 32);
    v38 = v37;
    objc_msgSend(v37, sel_stopActivityIndicator);

  }
LABEL_18:
  result = (id)swift_bridgeObjectRelease();
  v39 = v54;
  if (!v54)
  {
LABEL_30:
    __break(1u);
    return result;
  }
  v40 = sub_24B4A66FC();
  objc_msgSend(v39, sel_presentInParentViewController_animated_, v40, 1);

  objc_msgSend(v39, sel_setDelegate_, v32);
  v41 = *(void **)&v32[OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter];
  v42 = objc_msgSend(v41, sel_presentedViewController);
  v43 = sub_24B4A66FC();
  v44 = v43;
  if (v42)
  {
    sub_24B489CA0(0, (unint64_t *)&unk_257991E80);
    v45 = v42;
    v46 = sub_24B4ADE84();

    if ((v46 & 1) != 0)
      goto LABEL_24;
  }
  else
  {

  }
  v47 = sub_24B4A66FC();
  objc_msgSend(v41, sel_presentViewController_animated_completion_, v47, 1, 0);

LABEL_24:
  swift_beginAccess();
  v48 = v39;
  MEMORY[0x24BD20890]();
  if (*(_QWORD *)((*(_QWORD *)v33 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)v33 & 0xFFFFFFFFFFFFFF8)
                                                                               + 0x18) >> 1)
    sub_24B4ADDAC();
  sub_24B4ADDB8();
  sub_24B4ADDA0();
  return (id)swift_endAccess();
}

void sub_24B4AA4DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD aBlock[6];

  if (a2 && (a1 == 0x6C65636E6163 && a2 == 0xE600000000000000 || (sub_24B4ADFC8() & 1) != 0))
  {
    v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_objectModels);
    swift_beginAccess();
    *v3 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v4 = sub_24B4A67FC();
    objc_msgSend(v4, sel_cancel);

    v5 = sub_24B4A67FC();
    objc_msgSend(v5, sel_setDelegate_, 0);

    v6 = *(void **)(v2 + OBJC_IVAR____TtC19iCloudMailAccountUI24LegacyMailAccountCreator_presenter);
    v7 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_24B4AA66C;
    aBlock[5] = v7;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_24B4A5F00;
    aBlock[3] = &block_descriptor_2;
    v8 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v6, sel_dismissViewControllerAnimated_completion_, 1, v8);
    _Block_release(v8);
  }
}

uint64_t sub_24B4AA648()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24B4AA66C()
{
  uint64_t v0;

  sub_24B4A9764(v0);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_24B4AA69C()
{
  id *v0;

  return swift_deallocObject();
}

void sub_24B4AA6D0()
{
  uint64_t v0;

  sub_24B4A8AA8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

void sub_24B4AA6E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B4A8BAC(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t objectdestroy_9Tm_0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_24B4AA724(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B4A8CCC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32));
}

uint64_t sub_24B4AA734(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24B4A8EA4(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t objectdestroy_21Tm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_24B4AA76C()
{
  uint64_t v0;

  sub_24B4A9090(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_24B4AA774()
{
  return swift_release();
}

uint64_t sub_24B4AA77C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991E78) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  swift_release();
  v4 = sub_24B4AD3EC();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v2, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v2, v4);

  return swift_deallocObject();
}

uint64_t sub_24B4AA838(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991E78) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_24B4A7C48(a1, a2, *(_QWORD *)(v2 + 16), v2 + v6, *(void **)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_24B4AA8A0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991E78) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  swift_release();
  v4 = sub_24B4AD3EC();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v2, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v2, v4);

  return swift_deallocObject();
}

unint64_t sub_24B4AA95C()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257991E78) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  return sub_24B4A7EBC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + v2, *(void **)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_24B4AA9A4()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_24B4AA9C8()
{
  uint64_t v0;

  sub_24B4A7034(*(char **)(v0 + 16));
}

void sub_24B4AA9D0()
{
  sub_24B4A725C();
}

void sub_24B4AA9D8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B4A733C(a1, a2, v2);
}

uint64_t sub_24B4AA9E0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B4AAA04(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_24B4A76C0(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t sub_24B4AAA0C()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_24B4AAA38()
{
  uint64_t v0;

  return sub_24B4A78BC(*(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40));
}

void sub_24B4AAA44(uint64_t a1)
{
  uint64_t v1;

  sub_24B4A6DBC(a1, v1);
}

uint64_t storeEnumTagSinglePayload for FeatureFlag(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24B4AAB00 + 4 * asc_24B4B0B90[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24B4AAB20 + 4 * byte_24B4B0B95[v4]))();
}

_BYTE *sub_24B4AAB00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24B4AAB20(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B4AAB28(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B4AAB30(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24B4AAB38(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24B4AAB40(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlag()
{
  return &type metadata for FeatureFlag;
}

unint64_t sub_24B4AAB60()
{
  unint64_t result;

  result = qword_257991F40;
  if (!qword_257991F40)
  {
    result = MEMORY[0x24BD20F50](&unk_24B4B0C00, &type metadata for FeatureFlag);
    atomic_store(result, (unint64_t *)&qword_257991F40);
  }
  return result;
}

const char *sub_24B4AABA4()
{
  return "iCloudMailAccountUI";
}

const char *sub_24B4AABB8()
{
  return "iCloudMailAccountUIMain";
}

void sub_24B4AABCC(CGFloat *a1@<X8>)
{
  *a1 = sub_24B4959E8();
}

void sub_24B4AABF4(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_24B4AABFC()
{
  uint64_t v0;
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
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  void (*v16)(char *, uint64_t);
  id v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(unint64_t, char *, uint64_t);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991F48);
  v1 = *(_QWORD *)(v0 - 8);
  v30 = v0;
  v31 = v1;
  MEMORY[0x24BDAC7A8](v0);
  v29 = (char *)&v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_24B4ADE6C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257991F50);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v28 - v12;
  v14 = (void *)objc_opt_self();
  v15 = objc_msgSend(v14, sel_defaultCenter);
  sub_24B4ADE78();

  sub_24B4AAEF8();
  sub_24B4AD5F0();
  v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  v16(v6, v3);
  v17 = objc_msgSend(v14, sel_defaultCenter);
  sub_24B4ADE78();

  sub_24B4AD5F0();
  v16(v6, v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257991F60);
  v18 = *(_QWORD *)(v8 + 72);
  v19 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_24B4AE7A0;
  v21 = v20 + v19;
  v22 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 16);
  v22(v21, v13, v7);
  v22(v21 + v18, v11, v7);
  sub_24B480FAC(&qword_257991F68, &qword_257991F50, MEMORY[0x24BDB96C0]);
  v23 = v29;
  sub_24B4AD56C();
  sub_24B480FAC(&qword_257991F70, &qword_257991F48, MEMORY[0x24BDB99D8]);
  v24 = v30;
  v25 = sub_24B4AD5E4();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v23, v24);
  v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v11, v7);
  v26(v13, v7);
  return v25;
}

unint64_t sub_24B4AAEF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257991F58;
  if (!qword_257991F58)
  {
    v1 = sub_24B4ADE6C();
    result = MEMORY[0x24BD20F50](MEMORY[0x24BDD0070], v1);
    atomic_store(result, (unint64_t *)&qword_257991F58);
  }
  return result;
}

uint64_t sub_24B4AAF40()
{
  return swift_deallocClassInstance();
}

uint64_t _s18CurrentBundleClassCMa()
{
  return objc_opt_self();
}

uint64_t sub_24B4AAF70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t ObjCClassFromMetadata;
  id v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  id v18;
  id v19;
  uint64_t v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  id v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  uint64_t KeyPath;
  unsigned __int8 v54;
  uint64_t v55;
  id v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  _OWORD *v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  unsigned __int8 v105;
  char v106;
  char v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void **v143;
  __int128 v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  int v173;
  int v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  __int128 v190;
  __int128 v191;
  int v192;
  int v193;
  int v194;
  _OWORD *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  int v202;
  int v203;
  int v204;
  _OWORD *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  int v212;
  int v213;
  int v214;
  _OWORD *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  _OWORD *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  __int128 v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void (*v234)(char *, uint64_t);
  __int128 v235;
  _DWORD v236[2];
  _DWORD v237[3];
  __int16 v238;
  char v239;
  _DWORD v240[2];
  _DWORD v241[2];
  int v242;
  __int16 v243;
  _DWORD v244[2];
  _DWORD v245[2];
  int v246;
  __int16 v247;
  _DWORD v248[2];
  _DWORD v249[2];
  int v250;
  __int16 v251;
  _BYTE v252[7];
  char v253;
  _BYTE v254[7];
  char v255;
  int v256;
  __int16 v257;
  char v258;
  _QWORD v259[2];
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  _OWORD v265[3];
  __int128 v266;
  _OWORD *v267;
  uint64_t v268;
  uint64_t v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  _OWORD v276[2];
  __int128 v277;
  __int128 v278;
  __int128 v279;
  uint64_t v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  _OWORD v287[2];
  __int128 v288;
  __int128 v289;
  __int128 v290;
  uint64_t v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  _OWORD v298[2];
  __int128 v299;
  __int128 v300;
  __int128 v301;
  uint64_t v302;
  _OWORD v303[12];
  char v304;
  _BYTE v305[7];
  char v306;
  _BYTE v307[7];
  char v308;
  int v309;
  __int16 v310;
  _QWORD v311[2];
  unsigned __int8 v312;
  char v313;
  int v314;
  __int16 v315;
  uint64_t v316;
  char v317;
  _BYTE v318[7];
  uint64_t v319;
  char v320;
  _BYTE v321[7];
  uint64_t v322;
  uint64_t v323;
  void (*v324)(char *, uint64_t);
  void (*v325)(char *, uint64_t);
  uint64_t v326;
  uint64_t v327;
  __int128 v328;
  uint64_t v329;
  __int128 v330;
  uint64_t v331;
  uint64_t (*v332)();
  _OWORD *v333;
  uint64_t v334;
  uint64_t v335;
  _QWORD v336[2];
  char v337;
  char v338;
  int v339;
  __int16 v340;
  uint64_t v341;
  char v342;
  _BYTE v343[7];
  uint64_t v344;
  char v345;
  _BYTE v346[7];
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  __int128 v353;
  uint64_t v354;
  __int128 v355;
  uint64_t v356;
  uint64_t (*v357)();
  _OWORD *v358;
  uint64_t v359;
  uint64_t v360;
  _QWORD v361[2];
  char v362;
  char v363;
  int v364;
  __int16 v365;
  uint64_t v366;
  char v367;
  _BYTE v368[7];
  uint64_t v369;
  char v370;
  _BYTE v371[7];
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  __int128 v378;
  uint64_t v379;
  __int128 v380;
  uint64_t v381;
  uint64_t (*v382)();
  _OWORD *v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  __int128 v394;
  uint64_t v395;
  __int128 v396;
  __int128 v397;
  uint64_t v398;
  __int128 v399;
  uint64_t v400;
  uint64_t (*v401)();
  _OWORD *v402;
  uint64_t v403;
  uint64_t v404;
  _QWORD v405[6];
  unsigned __int8 v406;
  uint64_t v407;
  unsigned __int8 v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  unsigned __int8 v412;
  uint64_t v413;
  unsigned __int8 v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  unsigned __int8 v418;
  uint64_t v419;
  unsigned __int8 v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  unsigned __int8 v424;
  uint64_t v425;
  unsigned __int8 v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  unsigned __int8 v430;
  uint64_t v431;
  unsigned __int8 v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  char v436;
  uint64_t v437;
  char v438;
  uint64_t v439;
  uint64_t v440;
  id v441;
  uint64_t v442;
  _BYTE v443[7];
  unsigned __int8 v444;
  _BYTE v445[7];
  unsigned __int8 v446;
  int v447;
  __int16 v448;
  unsigned __int8 v449;
  _DWORD v450[2];
  _DWORD v451[2];
  int v452;
  __int16 v453;
  _BYTE v454[7];
  unsigned __int8 v455;
  _BYTE v456[7];
  unsigned __int8 v457;
  int v458;
  __int16 v459;
  unsigned __int8 v460;
  _DWORD v461[2];
  _DWORD v462[2];
  int v463;
  __int16 v464;
  _BYTE v465[7];
  unsigned __int8 v466;
  _BYTE v467[7];
  unsigned __int8 v468;
  int v469;
  __int16 v470;
  unsigned __int8 v471;
  _DWORD v472[2];
  _DWORD v473[2];
  int v474;
  __int16 v475;

  v166 = a2;
  v3 = sub_24B4ADB84();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v163 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257992010);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_24B4AE7A0;
  *(_QWORD *)(v7 + 32) = *(_QWORD *)(a1 + 72);
  swift_retain();
  *(_QWORD *)(v7 + 40) = sub_24B4ADB3C();
  *(_QWORD *)&v303[0] = v7;
  sub_24B4ADDA0();
  MEMORY[0x24BD20740](*(_QWORD *)&v303[0]);
  MEMORY[0x24BD20374](v405, 0.5, 0.0, 0.0, 0.75);
  v233 = v405[0];
  v181 = v405[2];
  v182 = v405[1];
  v179 = v405[4];
  v180 = v405[3];
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v173 = v406;
  v174 = v408;
  v175 = v409;
  v176 = v407;
  v177 = v410;
  v178 = v405[5];
  _s18CurrentBundleClassCMa();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v232 = ObjCClassFromMetadata;
  v189 = (id)objc_opt_self();
  v9 = objc_msgSend(v189, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_24B4ADB9C();
  LODWORD(v231) = *MEMORY[0x24BDF3FD0];
  *(_QWORD *)&v235 = *(_QWORD *)(v4 + 104);
  ((void (*)(char *))v235)(v6);
  v223 = sub_24B4ADB90();
  swift_release();
  v234 = *(void (**)(char *, uint64_t))(v4 + 8);
  v234(v6, v3);
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v10 = v412;
  v219 = v411;
  v220 = v413;
  v11 = v414;
  v221 = v416;
  v222 = v415;
  v303[0] = *(_OWORD *)(a1 + 8);
  *(_QWORD *)&v230 = __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  sub_24B4ADBB4();
  v12 = v386;
  sub_24B4ADC8C();
  v217 = v14;
  v218 = v13;
  sub_24B4ADB54();
  v216 = sub_24B4ADB48();
  swift_release();
  v449 = 1;
  v446 = v10;
  v444 = v11;
  v15 = (_OWORD *)swift_allocObject();
  v16 = *(_OWORD *)(a1 + 48);
  v15[3] = *(_OWORD *)(a1 + 32);
  v15[4] = v16;
  v15[5] = *(_OWORD *)(a1 + 64);
  v17 = *(_OWORD *)(a1 + 16);
  v15[1] = *(_OWORD *)a1;
  v15[2] = v17;
  v215 = v15;
  v214 = v449;
  v452 = v447;
  v453 = v448;
  v213 = v446;
  *(_DWORD *)((char *)v451 + 3) = *(_DWORD *)&v445[3];
  v451[0] = *(_DWORD *)v445;
  v212 = v444;
  v450[0] = *(_DWORD *)v443;
  *(_DWORD *)((char *)v450 + 3) = *(_DWORD *)&v443[3];
  sub_24B4ACF24((void **)a1);
  v18 = v189;
  v19 = objc_msgSend(v189, sel_bundleForClass_, v232);
  sub_24B4ADB9C();
  v20 = v231;
  ((void (*)(char *, _QWORD, uint64_t))v235)(v6, v231, v3);
  v211 = sub_24B4ADB90();
  swift_release();
  v234(v6, v3);
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v21 = v418;
  v207 = v417;
  v208 = v419;
  v22 = v420;
  v209 = v422;
  v210 = v421;
  v303[0] = *(_OWORD *)(a1 + 24);
  sub_24B4ADBB4();
  v23 = (uint64_t)v386;
  sub_24B4ADC8C();
  v171 = v25;
  v172 = v24;
  sub_24B4ADB54();
  v206 = sub_24B4ADB48();
  swift_release();
  v460 = 1;
  v457 = v21;
  v455 = v22;
  v26 = (_OWORD *)swift_allocObject();
  v27 = *(_OWORD *)(a1 + 48);
  v26[3] = *(_OWORD *)(a1 + 32);
  v26[4] = v27;
  v26[5] = *(_OWORD *)(a1 + 64);
  v28 = *(_OWORD *)(a1 + 16);
  v26[1] = *(_OWORD *)a1;
  v26[2] = v28;
  v205 = v26;
  v204 = v460;
  v463 = v458;
  v464 = v459;
  v203 = v457;
  *(_DWORD *)((char *)v462 + 3) = *(_DWORD *)&v456[3];
  v462[0] = *(_DWORD *)v456;
  v202 = v455;
  v461[0] = *(_DWORD *)v454;
  *(_DWORD *)((char *)v461 + 3) = *(_DWORD *)&v454[3];
  sub_24B4ACF24((void **)a1);
  v29 = objc_msgSend(v18, sel_bundleForClass_, v232);
  sub_24B4ADB9C();
  ((void (*)(char *, uint64_t, uint64_t))v235)(v6, v20, v3);
  v201 = sub_24B4ADB90();
  swift_release();
  *(_QWORD *)&v190 = v6;
  *(_QWORD *)&v191 = v3;
  v234(v6, v3);
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v30 = v424;
  v197 = v423;
  v198 = v425;
  v31 = v426;
  v199 = v428;
  v200 = v427;
  v303[0] = *(_OWORD *)(a1 + 40);
  sub_24B4ADBB4();
  v170 = (uint64_t)v386;
  sub_24B4ADC8C();
  v168 = v33;
  v169 = v32;
  sub_24B4ADB54();
  v196 = sub_24B4ADB48();
  swift_release();
  v471 = 1;
  v468 = v30;
  v466 = v31;
  v34 = (_OWORD *)swift_allocObject();
  v35 = *(_OWORD *)(a1 + 48);
  v34[3] = *(_OWORD *)(a1 + 32);
  v34[4] = v35;
  v34[5] = *(_OWORD *)(a1 + 64);
  v36 = *(_OWORD *)(a1 + 16);
  v34[1] = *(_OWORD *)a1;
  v34[2] = v36;
  v195 = v34;
  v194 = v471;
  v474 = v469;
  v475 = v470;
  *(_DWORD *)((char *)v473 + 3) = *(_DWORD *)&v467[3];
  v473[0] = *(_DWORD *)v467;
  v192 = v466;
  v193 = v468;
  v472[0] = *(_DWORD *)v465;
  *(_DWORD *)((char *)v472 + 3) = *(_DWORD *)&v465[3];
  sub_24B4AD010(a1, (uint64_t)&v441);
  sub_24B4AD010((uint64_t)&v441, (uint64_t)&v442);
  v224 = (_OWORD *)a1;
  if (v442)
  {
    sub_24B4AD09C(&v441);
    sub_24B4ACF24((void **)a1);
    sub_24B4AD09C(&v441);
    sub_24B4ADB6C();
    v37 = (char *)v190;
    v38 = v191;
    ((void (*)(_QWORD, _QWORD, _QWORD))v235)(v190, v231, v191);
    v39 = sub_24B4ADB90();
    swift_release();
    v234(v37, v38);
    sub_24B4ADC50();
    sub_24B4AD6BC();
    v40 = v429;
    v41 = v430;
    v42 = v431;
    v43 = v432;
    v44 = v433;
    v45 = v434;
    sub_24B4ADB54();
    v46 = sub_24B4ADB48();
    swift_release();
    v386 = (void *)v39;
    v387 = v40;
    v388 = v41;
    v389 = v42;
    v390 = v43;
    v391 = v44;
    v392 = v45;
    v393 = v46;
    v394 = xmmword_24B4AEB60;
    v395 = 0x4010000000000000;
    v396 = 0uLL;
    *(_QWORD *)&v397 = 0;
    BYTE8(v397) = 0;
    swift_retain();
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904C0);
    sub_24B480B0C(&qword_2579904C8, &qword_2579904B8, (uint64_t (*)(void))sub_24B480B78);
    sub_24B480B0C(&qword_2579904E0, &qword_2579904C0, (uint64_t (*)(void))sub_24B480BDC);
    sub_24B4AD8A8();
    sub_24B4AD0C4(&v441);
    swift_release();
    swift_release();
  }
  else
  {
    sub_24B4ACF24((void **)a1);
    sub_24B4ADB78();
    v47 = (char *)v190;
    v48 = v191;
    ((void (*)(_QWORD, _QWORD, _QWORD))v235)(v190, v231, v191);
    v49 = sub_24B4ADB90();
    swift_release();
    v234(v47, v48);
    sub_24B4ADC50();
    sub_24B4AD6BC();
    v50 = v429;
    v229 = v430;
    v227 = v432;
    v228 = v431;
    v51 = v433;
    v226 = v434;
    v52 = sub_24B4ADB60();
    KeyPath = swift_getKeyPath();
    v54 = sub_24B4AD950();
    sub_24B4ADB54();
    v55 = sub_24B4ADB48();
    swift_release();
    v386 = (void *)v49;
    v387 = v50;
    v388 = v229;
    v389 = v228;
    v390 = v227;
    v391 = v51;
    v392 = v226;
    v393 = KeyPath;
    *(_QWORD *)&v394 = v52;
    *((_QWORD *)&v394 + 1) = v54 | 0x10000;
    v396 = xmmword_24B4AEB60;
    v395 = v55;
    *(_QWORD *)&v397 = 0x4010000000000000;
    BYTE8(v397) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904B8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2579904C0);
    sub_24B480B0C(&qword_2579904C8, &qword_2579904B8, (uint64_t (*)(void))sub_24B480B78);
    sub_24B480B0C(&qword_2579904E0, &qword_2579904C0, (uint64_t (*)(void))sub_24B480BDC);
    sub_24B4AD8A8();
  }
  v164 = *(_QWORD *)&v303[0];
  v167 = *(_QWORD *)&v303[1];
  v187 = *((_QWORD *)&v303[2] + 1);
  v188 = *((_QWORD *)&v303[0] + 1);
  v185 = *(_QWORD *)&v303[2];
  v186 = *(_QWORD *)&v303[3];
  v183 = *((_QWORD *)&v303[1] + 1);
  v184 = *((_QWORD *)&v303[3] + 1);
  v229 = *(_QWORD *)&v303[4];
  v227 = *(_QWORD *)&v303[5];
  v228 = *((_QWORD *)&v303[4] + 1);
  v225 = *(_QWORD *)&v303[6];
  v226 = *((_QWORD *)&v303[5] + 1);
  v165 = *((_QWORD *)&v303[6] + 1);
  HIDWORD(v163) = LOBYTE(v303[7]);
  v56 = objc_msgSend(v189, sel_bundleForClass_, v232);
  sub_24B4ADB9C();
  v57 = (char *)v190;
  v58 = v191;
  ((void (*)(_QWORD, _QWORD, _QWORD))v235)(v190, v231, v191);
  v59 = sub_24B4ADB90();
  swift_release();
  v234(v57, v58);
  sub_24B4ADC50();
  sub_24B4AD6BC();
  v60 = v435;
  LOBYTE(v57) = v436;
  v61 = v437;
  v62 = v438;
  v63 = v439;
  v64 = v440;
  v303[0] = *(_OWORD *)((char *)v224 + 56);
  sub_24B4ADBB4();
  v234 = (void (*)(char *, uint64_t))v386;
  sub_24B4ADC8C();
  v232 = v65;
  v231 = v66;
  sub_24B4ADB54();
  v67 = sub_24B4ADB48();
  swift_release();
  v258 = 1;
  v255 = (char)v57;
  v253 = v62;
  v68 = (_OWORD *)swift_allocObject();
  v237[2] = v256;
  v238 = v257;
  v237[0] = *(_DWORD *)v254;
  *(_DWORD *)((char *)v237 + 3) = *(_DWORD *)&v254[3];
  v236[0] = *(_DWORD *)v252;
  *(_DWORD *)((char *)v236 + 3) = *(_DWORD *)&v252[3];
  v250 = v452;
  v251 = v453;
  v249[0] = v451[0];
  *(_DWORD *)((char *)v249 + 3) = *(_DWORD *)((char *)v451 + 3);
  v248[0] = v450[0];
  *(_DWORD *)((char *)v248 + 3) = *(_DWORD *)((char *)v450 + 3);
  v246 = v463;
  v247 = v464;
  v245[0] = v462[0];
  *(_DWORD *)((char *)v245 + 3) = *(_DWORD *)((char *)v462 + 3);
  v244[0] = v461[0];
  *(_DWORD *)((char *)v244 + 3) = *(_DWORD *)((char *)v461 + 3);
  v242 = v474;
  v243 = v475;
  v241[0] = v473[0];
  *(_DWORD *)((char *)v241 + 3) = *(_DWORD *)((char *)v473 + 3);
  v240[0] = v472[0];
  *(_DWORD *)((char *)v240 + 3) = *(_DWORD *)((char *)v472 + 3);
  WORD3(v260) = v453;
  *(_DWORD *)((char *)&v260 + 2) = v452;
  DWORD1(v261) = *(_DWORD *)((char *)v451 + 3);
  *(_DWORD *)((char *)&v261 + 1) = v451[0];
  DWORD1(v262) = *(_DWORD *)((char *)v450 + 3);
  *(_DWORD *)((char *)&v262 + 1) = v450[0];
  v191 = xmmword_24B4B0CA0;
  WORD3(v271) = v464;
  *(_DWORD *)((char *)&v271 + 2) = v463;
  DWORD1(v272) = *(_DWORD *)((char *)v462 + 3);
  *(_DWORD *)((char *)&v272 + 1) = v462[0];
  DWORD1(v273) = *(_DWORD *)((char *)v461 + 3);
  *(_DWORD *)((char *)&v273 + 1) = v461[0];
  v230 = xmmword_24B4B0CB0;
  WORD3(v282) = v475;
  *(_DWORD *)((char *)&v282 + 2) = v474;
  DWORD1(v283) = *(_DWORD *)((char *)v473 + 3);
  *(_OWORD *)((char *)v276 + 8) = xmmword_24B4B0CB0;
  *(_DWORD *)((char *)&v283 + 1) = v473[0];
  DWORD1(v284) = *(_DWORD *)((char *)v472 + 3);
  *(_DWORD *)((char *)&v284 + 1) = v472[0];
  v190 = xmmword_24B4B0CC0;
  WORD3(v293) = v257;
  v69 = v256;
  *(_DWORD *)((char *)&v293 + 2) = v256;
  DWORD1(v294) = *(_DWORD *)&v254[3];
  v70 = v237[0];
  *(_DWORD *)((char *)&v294 + 1) = v237[0];
  DWORD1(v295) = *(_DWORD *)&v252[3];
  v71 = v236[0];
  *(_DWORD *)((char *)&v295 + 1) = v236[0];
  v259[0] = v223;
  v259[1] = 0;
  LOWORD(v260) = v214;
  *((_QWORD *)&v260 + 1) = v219;
  LOBYTE(v261) = v213;
  *((_QWORD *)&v261 + 1) = v220;
  LOBYTE(v262) = v212;
  *((_QWORD *)&v262 + 1) = v222;
  *(_QWORD *)&v263 = v221;
  *((_QWORD *)&v263 + 1) = v12;
  *(_QWORD *)&v264 = v12;
  *((_QWORD *)&v264 + 1) = v218;
  *(_QWORD *)&v265[0] = v217;
  *(_OWORD *)((char *)v265 + 8) = xmmword_24B4B0CA0;
  v265[2] = xmmword_24B4AEB60;
  *(_OWORD *)((char *)v298 + 8) = xmmword_24B4B0CD0;
  *((_QWORD *)&v265[1] + 1) = v216;
  *(_QWORD *)&v266 = 0x4010000000000000;
  v308 = v173;
  *((_QWORD *)&v266 + 1) = sub_24B4ACEEC;
  v267 = v215;
  v269 = 0;
  v268 = 0;
  v270 = (unint64_t)v211;
  LOWORD(v271) = v204;
  *((_QWORD *)&v271 + 1) = v207;
  LOBYTE(v272) = v203;
  *((_QWORD *)&v272 + 1) = v208;
  LOBYTE(v273) = v202;
  *((_QWORD *)&v273 + 1) = v210;
  *(_QWORD *)&v274 = v209;
  *((_QWORD *)&v274 + 1) = v23;
  *(_QWORD *)&v275 = v23;
  v72 = v23;
  v189 = v12;
  v74 = v171;
  v73 = v172;
  *((_QWORD *)&v275 + 1) = v172;
  *(_QWORD *)&v276[0] = v171;
  *((_QWORD *)&v276[1] + 1) = v206;
  v306 = v174;
  v277 = xmmword_24B4AEB60;
  *(_QWORD *)&v278 = 0x4010000000000000;
  *((_QWORD *)&v278 + 1) = sub_24B4ACF98;
  v280 = 0;
  v279 = (unint64_t)v205;
  v281 = (unint64_t)v201;
  LOWORD(v282) = v194;
  *((_QWORD *)&v282 + 1) = v197;
  LOBYTE(v283) = v193;
  *((_QWORD *)&v283 + 1) = v198;
  LOBYTE(v284) = v192;
  *((_QWORD *)&v284 + 1) = v200;
  *(_QWORD *)&v285 = v199;
  v76 = v169;
  v75 = v170;
  *((_QWORD *)&v285 + 1) = v170;
  *(_QWORD *)&v286 = v170;
  *((_QWORD *)&v286 + 1) = v169;
  v77 = v168;
  *(_QWORD *)&v287[0] = v168;
  *(_OWORD *)((char *)v287 + 8) = xmmword_24B4B0CC0;
  v288 = xmmword_24B4AEB60;
  v291 = 0;
  v79 = (unint64_t)v223;
  v78 = v260;
  v80 = v261;
  v81 = v262;
  v82 = v263;
  v83 = v264;
  v84 = v265[0];
  v85 = v265[1];
  v86 = v266;
  v87 = (unint64_t)v215;
  v88 = v166;
  *(_QWORD *)(v166 + 272) = 0;
  *(_QWORD *)(v88 + 456) = v280;
  v89 = v278;
  *(_OWORD *)(v88 + 408) = v277;
  *(_OWORD *)(v88 + 424) = v89;
  *(_OWORD *)(v88 + 440) = v279;
  v90 = v275;
  *(_OWORD *)(v88 + 344) = v274;
  *(_OWORD *)(v88 + 360) = v90;
  v91 = v276[1];
  *(_OWORD *)(v88 + 376) = v276[0];
  *(_OWORD *)(v88 + 392) = v91;
  v92 = v271;
  *(_OWORD *)(v88 + 280) = v270;
  *(_OWORD *)(v88 + 296) = v92;
  v93 = v273;
  *(_OWORD *)(v88 + 312) = v272;
  *(_OWORD *)(v88 + 328) = v93;
  *(_QWORD *)(v88 + 640) = v291;
  *((_QWORD *)&v287[1] + 1) = v196;
  *(_QWORD *)&v289 = 0x4010000000000000;
  *((_QWORD *)&v289 + 1) = sub_24B4ACFD4;
  v290 = (unint64_t)v195;
  v302 = 0;
  *(_OWORD *)(v88 + 128) = v80;
  *(_OWORD *)(v88 + 144) = v81;
  v94 = v288;
  v95 = v289;
  v96 = v290;
  v97 = v285;
  v98 = v286;
  v99 = v287[0];
  v100 = v287[1];
  v101 = v281;
  v102 = v282;
  v103 = v283;
  v104 = v284;
  *(_QWORD *)((char *)&v303[11] + 7) = 0;
  *(_DWORD *)(v88 + 42) = v309;
  *(_WORD *)(v88 + 46) = v310;
  *(_DWORD *)(v88 + 57) = *(_DWORD *)v307;
  *(_DWORD *)(v88 + 60) = *(_DWORD *)&v307[3];
  *(_DWORD *)(v88 + 73) = *(_DWORD *)v305;
  *(_DWORD *)(v88 + 76) = *(_DWORD *)&v305[3];
  *(_WORD *)(v88 + 40) = 256;
  *(_QWORD *)(v88 + 48) = v178;
  *(_BYTE *)(v88 + 56) = v308;
  *(_QWORD *)(v88 + 64) = v176;
  *(_BYTE *)(v88 + 72) = v306;
  v105 = v258;
  *(_QWORD *)(v88 + 80) = v175;
  v106 = v255;
  v304 = BYTE4(v163);
  v107 = BYTE4(v163);
  *(_QWORD *)(v88 + 88) = v177;
  *(_BYTE *)(v88 + 760) = v304;
  v108 = v253;
  v109 = v59;
  v292 = (unint64_t)v59;
  LOWORD(v293) = v105;
  v110 = v60;
  *((_QWORD *)&v293 + 1) = v60;
  LOBYTE(v294) = v106;
  *((_QWORD *)&v294 + 1) = v61;
  LOBYTE(v295) = v253;
  v111 = v63;
  *((_QWORD *)&v295 + 1) = v63;
  v112 = v64;
  *(_QWORD *)&v296 = v64;
  v113 = v234;
  *((_QWORD *)&v296 + 1) = v234;
  *(_QWORD *)&v297 = v234;
  v114 = v232;
  *((_QWORD *)&v297 + 1) = v232;
  v115 = v231;
  *(_QWORD *)&v298[0] = v231;
  v116 = v67;
  *((_QWORD *)&v298[1] + 1) = v67;
  v314 = v69;
  v299 = xmmword_24B4AEB60;
  v235 = xmmword_24B4AEB60;
  *(_QWORD *)&v300 = 0x4010000000000000;
  *((_QWORD *)&v300 + 1) = sub_24B4AD064;
  v301 = (unint64_t)v68;
  *(_OWORD *)(v88 + 96) = v79;
  *(_OWORD *)(v88 + 112) = v78;
  *(_OWORD *)(v88 + 192) = v84;
  *(_OWORD *)(v88 + 208) = v85;
  *(_OWORD *)(v88 + 160) = v82;
  *(_OWORD *)(v88 + 176) = v83;
  *(_OWORD *)(v88 + 240) = v86;
  *(_OWORD *)(v88 + 256) = v87;
  *(_OWORD *)(v88 + 224) = xmmword_24B4AEB60;
  *(_OWORD *)(v88 + 592) = v94;
  *(_OWORD *)(v88 + 608) = v95;
  *(_OWORD *)(v88 + 624) = v96;
  *(_OWORD *)((char *)&v303[8] + 7) = v299;
  *(_OWORD *)((char *)&v303[9] + 7) = v300;
  *(_OWORD *)((char *)&v303[10] + 7) = v301;
  *(_OWORD *)((char *)&v303[4] + 7) = v296;
  *(_OWORD *)((char *)&v303[5] + 7) = v297;
  *(_OWORD *)((char *)&v303[6] + 7) = v298[0];
  *(_OWORD *)((char *)&v303[7] + 7) = v298[1];
  *(_OWORD *)((char *)v303 + 7) = v292;
  *(_OWORD *)((char *)&v303[1] + 7) = v293;
  *(_OWORD *)((char *)&v303[2] + 7) = v294;
  *(_OWORD *)((char *)&v303[3] + 7) = v295;
  v117 = v303[8];
  v118 = v303[9];
  v119 = v303[10];
  v120 = *(_OWORD *)((char *)&v303[10] + 15);
  v121 = v303[4];
  v122 = v303[5];
  v123 = v303[6];
  v124 = v303[7];
  v125 = v303[0];
  v126 = v303[1];
  v127 = v303[2];
  v128 = v303[3];
  *(_OWORD *)(v88 + 528) = v97;
  *(_OWORD *)(v88 + 544) = v98;
  *(_OWORD *)(v88 + 560) = v99;
  *(_OWORD *)(v88 + 576) = v100;
  *(_OWORD *)(v88 + 464) = v101;
  *(_OWORD *)(v88 + 480) = v102;
  *(_OWORD *)(v88 + 496) = v103;
  *(_OWORD *)(v88 + 512) = v104;
  *(_QWORD *)(v88 + 8) = v182;
  *(_QWORD *)(v88 + 16) = v181;
  *(_QWORD *)(v88 + 24) = v180;
  *(_QWORD *)(v88 + 32) = v179;
  *(_QWORD *)v88 = v233;
  v129 = v164;
  *(_QWORD *)(v88 + 648) = v164;
  v130 = v129;
  *(_QWORD *)(v88 + 656) = v188;
  v131 = v167;
  *(_QWORD *)(v88 + 664) = v167;
  *(_QWORD *)(v88 + 672) = v183;
  *(_QWORD *)(v88 + 680) = v185;
  *(_QWORD *)(v88 + 688) = v187;
  *(_QWORD *)(v88 + 696) = v186;
  *(_QWORD *)(v88 + 704) = v184;
  v132 = v229;
  *(_QWORD *)(v88 + 712) = v229;
  v133 = v132;
  v229 = v132;
  v134 = v228;
  *(_QWORD *)(v88 + 720) = v228;
  v135 = v134;
  v228 = v134;
  v136 = v227;
  *(_QWORD *)(v88 + 728) = v227;
  v137 = v136;
  v227 = v136;
  v138 = v226;
  *(_QWORD *)(v88 + 736) = v226;
  v139 = v138;
  v226 = v138;
  v140 = v225;
  *(_QWORD *)(v88 + 744) = v225;
  v141 = v140;
  v225 = v140;
  v142 = v165;
  *(_QWORD *)(v88 + 752) = v165;
  *(_OWORD *)(v88 + 889) = v117;
  *(_OWORD *)(v88 + 905) = v118;
  *(_OWORD *)(v88 + 921) = v119;
  *(_OWORD *)(v88 + 936) = v120;
  *(_OWORD *)(v88 + 825) = v121;
  *(_OWORD *)(v88 + 841) = v122;
  *(_OWORD *)(v88 + 857) = v123;
  *(_OWORD *)(v88 + 873) = v124;
  *(_OWORD *)(v88 + 761) = v125;
  *(_OWORD *)(v88 + 777) = v126;
  *(_OWORD *)(v88 + 793) = v127;
  *(_OWORD *)(v88 + 809) = v128;
  v312 = v105;
  v315 = v238;
  v316 = v110;
  v317 = v106;
  *(_DWORD *)v318 = v70;
  *(_DWORD *)&v318[3] = *(_DWORD *)((char *)v237 + 3);
  v319 = v61;
  v320 = v108;
  *(_DWORD *)v321 = v71;
  *(_DWORD *)&v321[3] = *(_DWORD *)((char *)v236 + 3);
  v322 = v111;
  v323 = v112;
  v329 = v116;
  v332 = sub_24B4AD064;
  v143 = (void **)v224;
  v144 = v224[3];
  v68[3] = v224[2];
  v68[4] = v144;
  v68[5] = *((_OWORD *)v143 + 4);
  v145 = *((_OWORD *)v143 + 1);
  v68[1] = *(_OWORD *)v143;
  v68[2] = v145;
  v333 = v68;
  v311[0] = v109;
  v239 = v107;
  LOBYTE(v61) = v107;
  v311[1] = 0;
  v313 = 0;
  v324 = (void (*)(_QWORD, _QWORD))v113;
  v325 = (void (*)(_QWORD, _QWORD))v113;
  v326 = v114;
  v327 = v115;
  v328 = xmmword_24B4B0CD0;
  v330 = xmmword_24B4AEB60;
  v331 = 0x4010000000000000;
  v334 = 0;
  v335 = 0;
  sub_24B4ACF24(v143);
  swift_bridgeObjectRetain();
  sub_24B480D74((uint64_t)v259);
  sub_24B480D74((uint64_t)&v270);
  sub_24B480D74((uint64_t)&v281);
  v162 = v61;
  v161 = v141;
  v159 = v137;
  v160 = v139;
  v157 = v133;
  v158 = v135;
  v146 = v130;
  v147 = v130;
  v148 = v187;
  v149 = v188;
  v150 = v131;
  v151 = v131;
  v152 = v183;
  v153 = v184;
  v154 = v185;
  v155 = v186;
  sub_24B480980(v147, v188, v150, v183, v185, v187, v186, v184, v157, v158, v159, v160, v161, v142, v162);
  sub_24B480D74((uint64_t)&v292);
  sub_24B480DD8((uint64_t)v311);
  sub_24B480A98(v146, v149, v151, v152, v154, v148, v155, v153, v229, v228, v227, v226, v225, v142, v239);
  v336[0] = v201;
  v336[1] = 0;
  v337 = v194;
  v338 = 0;
  v339 = v242;
  v340 = v243;
  v341 = v197;
  v342 = v193;
  *(_DWORD *)v343 = v241[0];
  *(_DWORD *)&v343[3] = *(_DWORD *)((char *)v241 + 3);
  v344 = v198;
  v345 = v192;
  *(_DWORD *)v346 = v240[0];
  *(_DWORD *)&v346[3] = *(_DWORD *)((char *)v240 + 3);
  v347 = v200;
  v348 = v199;
  v349 = v75;
  v350 = v75;
  v351 = v76;
  v352 = v77;
  v353 = v190;
  v354 = v196;
  v355 = v235;
  v356 = 0x4010000000000000;
  v357 = sub_24B4ACFD4;
  v358 = v195;
  v359 = 0;
  v360 = 0;
  sub_24B480DD8((uint64_t)v336);
  v361[0] = v211;
  v361[1] = 0;
  v362 = v204;
  v363 = 0;
  v364 = v246;
  v365 = v247;
  v366 = v207;
  v367 = v203;
  *(_DWORD *)v368 = v245[0];
  *(_DWORD *)&v368[3] = *(_DWORD *)((char *)v245 + 3);
  v369 = v208;
  v370 = v202;
  *(_DWORD *)&v371[3] = *(_DWORD *)((char *)v244 + 3);
  *(_DWORD *)v371 = v244[0];
  v372 = v210;
  v373 = v209;
  v374 = v72;
  v375 = v72;
  v376 = v73;
  v377 = v74;
  v378 = v230;
  v380 = v235;
  v379 = v206;
  v381 = 0x4010000000000000;
  v382 = sub_24B4ACF98;
  v383 = v205;
  v384 = 0;
  v385 = 0;
  sub_24B480DD8((uint64_t)v361);
  v386 = (void *)v223;
  v387 = 0;
  LOWORD(v388) = v214;
  *(_DWORD *)((char *)&v388 + 2) = v250;
  HIWORD(v388) = v251;
  v389 = v219;
  LOBYTE(v390) = v213;
  *(_DWORD *)((char *)&v390 + 1) = v249[0];
  HIDWORD(v390) = *(_DWORD *)((char *)v249 + 3);
  v391 = v220;
  LOBYTE(v392) = v212;
  HIDWORD(v392) = *(_DWORD *)((char *)v248 + 3);
  *(_DWORD *)((char *)&v392 + 1) = v248[0];
  v393 = v222;
  *(_QWORD *)&v394 = v221;
  *((_QWORD *)&v394 + 1) = v189;
  v395 = (uint64_t)v189;
  *(_QWORD *)&v396 = v218;
  *((_QWORD *)&v396 + 1) = v217;
  v397 = v191;
  v398 = v216;
  v399 = v235;
  v400 = 0x4010000000000000;
  v401 = sub_24B4ACEEC;
  v402 = v215;
  v403 = 0;
  v404 = 0;
  sub_24B480DD8((uint64_t)&v386);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B4AC760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  void *v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _QWORD v26[2];
  uint64_t v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];

  v29 = a4;
  v26[1] = a2;
  v27 = a3;
  v7 = sub_24B4ADC98();
  v32 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24B4ADCBC();
  v30 = *(_QWORD *)(v10 - 8);
  v31 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24B4ADCD4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v26 - v18;
  sub_24B480E3C();
  v20 = (void *)sub_24B4ADE48();
  sub_24B4ADCC8();
  MEMORY[0x24BD207DC](v17, a5);
  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v17, v13);
  v21 = (_OWORD *)swift_allocObject();
  v22 = *(_OWORD *)(a1 + 48);
  v21[3] = *(_OWORD *)(a1 + 32);
  v21[4] = v22;
  v21[5] = *(_OWORD *)(a1 + 64);
  v23 = *(_OWORD *)(a1 + 16);
  v21[1] = *(_OWORD *)a1;
  v21[2] = v23;
  aBlock[4] = v27;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B4A5F00;
  aBlock[3] = v29;
  v24 = _Block_copy(aBlock);
  sub_24B4ACF24((void **)a1);
  swift_release();
  sub_24B4ADCB0();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_24B48BF54();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990558);
  sub_24B480FAC((unint64_t *)&qword_257991EA0, &qword_257990558, MEMORY[0x24BEE12C8]);
  sub_24B4ADEC0();
  MEMORY[0x24BD20914](v19, v12, v9, v24);
  _Block_release(v24);

  (*(void (**)(char *, uint64_t))(v32 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v31);
  return ((uint64_t (*)(char *, uint64_t))v28)(v19, v13);
}

uint64_t sub_24B4AC9F8()
{
  sub_24B4ADC68();
  sub_24B4AD710();
  return swift_release();
}

void *sub_24B4ACA70@<X0>(uint64_t *a1@<X8>)
{
  _OWORD *v1;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v9[5];
  _BYTE __src[952];

  v3 = v1[3];
  v9[2] = v1[2];
  v9[3] = v3;
  v9[4] = v1[4];
  v4 = v1[1];
  v9[0] = *v1;
  v9[1] = v4;
  v5 = sub_24B4ADC50();
  v7 = v6;
  sub_24B4AAF70((uint64_t)v9, (uint64_t)__src);
  *a1 = v5;
  a1[1] = v7;
  return memcpy(a1 + 2, __src, 0x3B8uLL);
}

double sub_24B4ACAE0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, double *a3@<X8>)
{
  double result;
  double v7;
  uint64_t v8;

  sub_24B4ADBA8();
  sub_24B4ADBA8();
  sub_24B4ADBA8();
  sub_24B4ADBA8();
  result = v7;
  *(_QWORD *)a3 = a1;
  a3[1] = v7;
  *((_QWORD *)a3 + 2) = v8;
  a3[3] = v7;
  *((_QWORD *)a3 + 4) = v8;
  a3[5] = v7;
  *((_QWORD *)a3 + 6) = v8;
  a3[7] = v7;
  *((_QWORD *)a3 + 8) = v8;
  *((_QWORD *)a3 + 9) = a2;
  return result;
}

uint64_t destroy for AccountCreationHeaderMemojiView(id *a1)
{

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for AccountCreationHeaderMemojiView(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  v7 = *(_QWORD *)(a2 + 56);
  a1[6] = *(_QWORD *)(a2 + 48);
  a1[7] = v7;
  v8 = *(_QWORD *)(a2 + 72);
  a1[8] = *(_QWORD *)(a2 + 64);
  a1[9] = v8;
  v9 = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AccountCreationHeaderMemojiView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for AccountCreationHeaderMemojiView(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_release();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AccountCreationHeaderMemojiView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AccountCreationHeaderMemojiView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 72) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AccountCreationHeaderMemojiView()
{
  return &type metadata for AccountCreationHeaderMemojiView;
}

uint64_t sub_24B4ACED8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24B4ACEEC()
{
  uint64_t v0;

  return sub_24B4AC760(v0 + 16, (uint64_t)&unk_251C5BBA0, (uint64_t)sub_24B4AD2C8, (uint64_t)&block_descriptor_30, 0.525);
}

void **sub_24B4ACF24(void **a1)
{
  void *v2;
  id v3;

  v2 = *a1;
  swift_retain();
  swift_retain();
  v3 = v2;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_24B4ACF98()
{
  uint64_t v0;

  return sub_24B4AC760(v0 + 16, (uint64_t)&unk_251C5BB50, (uint64_t)sub_24B4AD200, (uint64_t)&block_descriptor_24, 0.325);
}

uint64_t sub_24B4ACFD4()
{
  uint64_t v0;

  return sub_24B4AC760(v0 + 16, (uint64_t)&unk_251C5BB00, (uint64_t)sub_24B4AD184, (uint64_t)&block_descriptor_18, 0.425);
}

uint64_t sub_24B4AD010(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2579910A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B4AD064()
{
  uint64_t v0;

  return sub_24B4AC760(v0 + 16, (uint64_t)&unk_251C5BAB0, (uint64_t)sub_24B4AD0F0, (uint64_t)&block_descriptor_3, 0.16);
}

id *sub_24B4AD09C(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

id *sub_24B4AD0C4(id *a1)
{

  return a1;
}

uint64_t sub_24B4AD0F0()
{
  return sub_24B4AC9F8();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_24B4AD128()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  return sub_24B4ADBC0();
}

uint64_t sub_24B4AD184()
{
  return sub_24B4AC9F8();
}

uint64_t sub_24B4AD1A4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  return sub_24B4ADBC0();
}

uint64_t sub_24B4AD200()
{
  return sub_24B4AC9F8();
}

uint64_t sub_24B4AD220()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  return sub_24B4ADBC0();
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B4AD2C8()
{
  return sub_24B4AC9F8();
}

uint64_t sub_24B4AD2E8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257990548);
  return sub_24B4ADBC0();
}

uint64_t sub_24B4AD340()
{
  return sub_24B480FAC(&qword_257992018, &qword_257992020, MEMORY[0x24BDF4750]);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_24B4AD3A4()
{
  return MEMORY[0x24BDCAFF0]();
}

uint64_t sub_24B4AD3B0()
{
  return MEMORY[0x24BDCAFF8]();
}

uint64_t sub_24B4AD3BC()
{
  return MEMORY[0x24BDCB030]();
}

uint64_t sub_24B4AD3C8()
{
  return MEMORY[0x24BDCB068]();
}

uint64_t sub_24B4AD3D4()
{
  return MEMORY[0x24BDCB088]();
}

uint64_t sub_24B4AD3E0()
{
  return MEMORY[0x24BDCB0A8]();
}

uint64_t sub_24B4AD3EC()
{
  return MEMORY[0x24BDCB0C0]();
}

uint64_t sub_24B4AD3F8()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_24B4AD404()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_24B4AD410()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_24B4AD41C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_24B4AD428()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_24B4AD434()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_24B4AD440()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_24B4AD44C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_24B4AD458()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_24B4AD464()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_24B4AD470()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_24B4AD47C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_24B4AD488()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_24B4AD494()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_24B4AD4A0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_24B4AD4AC()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_24B4AD4B8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_24B4AD4C4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_24B4AD4D0()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_24B4AD4DC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_24B4AD4E8()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_24B4AD4F4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_24B4AD500()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24B4AD50C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24B4AD518()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24B4AD524()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24B4AD530()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_24B4AD53C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_24B4AD548()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24B4AD554()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24B4AD560()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24B4AD56C()
{
  return MEMORY[0x24BDB99D0]();
}

uint64_t sub_24B4AD578()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_24B4AD584()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_24B4AD590()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_24B4AD59C()
{
  return MEMORY[0x24BDB9E50]();
}

uint64_t sub_24B4AD5A8()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_24B4AD5B4()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_24B4AD5C0()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_24B4AD5CC()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_24B4AD5D8()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_24B4AD5E4()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_24B4AD5F0()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_24B4AD5FC()
{
  return MEMORY[0x24BDB9FB0]();
}

uint64_t sub_24B4AD608()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_24B4AD614()
{
  return MEMORY[0x24BDBA0A0]();
}

uint64_t sub_24B4AD620()
{
  return MEMORY[0x24BDBA0C0]();
}

uint64_t sub_24B4AD62C()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_24B4AD638()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_24B4AD644()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_24B4AD650()
{
  return MEMORY[0x24BDEB0B0]();
}

uint64_t sub_24B4AD65C()
{
  return MEMORY[0x24BDEB0B8]();
}

uint64_t sub_24B4AD668()
{
  return MEMORY[0x24BDEB0E0]();
}

uint64_t sub_24B4AD674()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_24B4AD680()
{
  return MEMORY[0x24BDEB4A0]();
}

uint64_t sub_24B4AD68C()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_24B4AD698()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_24B4AD6A4()
{
  return MEMORY[0x24BDEB798]();
}

uint64_t sub_24B4AD6B0()
{
  return MEMORY[0x24BDEBBC8]();
}

uint64_t sub_24B4AD6BC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_24B4AD6C8()
{
  return MEMORY[0x24BDEC030]();
}

uint64_t sub_24B4AD6D4()
{
  return MEMORY[0x24BDEC038]();
}

uint64_t sub_24B4AD6E0()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_24B4AD6EC()
{
  return MEMORY[0x24BDEC148]();
}

uint64_t sub_24B4AD6F8()
{
  return MEMORY[0x24BDEC298]();
}

uint64_t sub_24B4AD704()
{
  return MEMORY[0x24BDEC2E0]();
}

uint64_t sub_24B4AD710()
{
  return MEMORY[0x24BDEC5A0]();
}

uint64_t sub_24B4AD71C()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_24B4AD728()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_24B4AD734()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_24B4AD740()
{
  return MEMORY[0x24BDED408]();
}

uint64_t sub_24B4AD74C()
{
  return MEMORY[0x24BDED420]();
}

uint64_t sub_24B4AD758()
{
  return MEMORY[0x24BDEDAE0]();
}

uint64_t sub_24B4AD764()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_24B4AD770()
{
  return MEMORY[0x24BDEDF08]();
}

uint64_t sub_24B4AD77C()
{
  return MEMORY[0x24BDEDF10]();
}

uint64_t sub_24B4AD788()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_24B4AD794()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_24B4AD7A0()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_24B4AD7AC()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_24B4AD7B8()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_24B4AD7C4()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_24B4AD7D0()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_24B4AD7DC()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_24B4AD7E8()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_24B4AD7F4()
{
  return MEMORY[0x24BDEE3F0]();
}

uint64_t sub_24B4AD800()
{
  return MEMORY[0x24BDEE400]();
}

uint64_t sub_24B4AD80C()
{
  return MEMORY[0x24BDEE448]();
}

uint64_t sub_24B4AD818()
{
  return MEMORY[0x24BDEE450]();
}

uint64_t sub_24B4AD824()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_24B4AD830()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_24B4AD83C()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_24B4AD848()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_24B4AD854()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_24B4AD860()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_24B4AD86C()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_24B4AD878()
{
  return MEMORY[0x24BDEE968]();
}

uint64_t sub_24B4AD884()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_24B4AD890()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_24B4AD89C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_24B4AD8A8()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_24B4AD8B4()
{
  return MEMORY[0x24BDEF710]();
}

uint64_t sub_24B4AD8C0()
{
  return MEMORY[0x24BDEF728]();
}

uint64_t sub_24B4AD8CC()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_24B4AD8D8()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_24B4AD8E4()
{
  return MEMORY[0x24BDF0CA0]();
}

uint64_t sub_24B4AD8F0()
{
  return MEMORY[0x24BDF0CB0]();
}

uint64_t sub_24B4AD8FC()
{
  return MEMORY[0x24BDF0D00]();
}

uint64_t sub_24B4AD908()
{
  return MEMORY[0x24BDF0D18]();
}

uint64_t sub_24B4AD914()
{
  return MEMORY[0x24BDF0D98]();
}

uint64_t sub_24B4AD920()
{
  return MEMORY[0x24BDF0DA8]();
}

uint64_t sub_24B4AD92C()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_24B4AD938()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_24B4AD944()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_24B4AD950()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_24B4AD95C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_24B4AD968()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_24B4AD974()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_24B4AD980()
{
  return MEMORY[0x24BDF1560]();
}

uint64_t sub_24B4AD98C()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_24B4AD998()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_24B4AD9A4()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_24B4AD9B0()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_24B4AD9BC()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_24B4AD9C8()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_24B4AD9D4()
{
  return MEMORY[0x24BDF1C00]();
}

uint64_t sub_24B4AD9E0()
{
  return MEMORY[0x24BDF1C18]();
}

uint64_t sub_24B4AD9EC()
{
  return MEMORY[0x24BDF1C20]();
}

uint64_t sub_24B4AD9F8()
{
  return MEMORY[0x24BDF1C28]();
}

uint64_t sub_24B4ADA04()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_24B4ADA10()
{
  return MEMORY[0x24BDF1D98]();
}

uint64_t sub_24B4ADA1C()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_24B4ADA28()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_24B4ADA34()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24B4ADA40()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24B4ADA4C()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_24B4ADA58()
{
  return MEMORY[0x24BDF22B0]();
}

uint64_t sub_24B4ADA64()
{
  return MEMORY[0x24BDF2500]();
}

uint64_t sub_24B4ADA70()
{
  return MEMORY[0x24BDF2548]();
}

uint64_t sub_24B4ADA7C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24B4ADA88()
{
  return MEMORY[0x24BDF2BE0]();
}

uint64_t sub_24B4ADA94()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_24B4ADAA0()
{
  return MEMORY[0x24BDF3198]();
}

uint64_t sub_24B4ADAAC()
{
  return MEMORY[0x24BDF31C8]();
}

uint64_t sub_24B4ADAB8()
{
  return MEMORY[0x24BDF32E8]();
}

uint64_t sub_24B4ADAC4()
{
  return MEMORY[0x24BDF3320]();
}

uint64_t sub_24B4ADAD0()
{
  return MEMORY[0x24BDF3500]();
}

uint64_t sub_24B4ADADC()
{
  return MEMORY[0x24BDF3640]();
}

uint64_t sub_24B4ADAE8()
{
  return MEMORY[0x24BDF3750]();
}

uint64_t sub_24B4ADAF4()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_24B4ADB00()
{
  return MEMORY[0x24BDF3880]();
}

uint64_t sub_24B4ADB0C()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_24B4ADB18()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_24B4ADB24()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_24B4ADB30()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_24B4ADB3C()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_24B4ADB48()
{
  return MEMORY[0x24BDF3D78]();
}

uint64_t sub_24B4ADB54()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_24B4ADB60()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_24B4ADB6C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_24B4ADB78()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_24B4ADB84()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_24B4ADB90()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_24B4ADB9C()
{
  return MEMORY[0x24BDF4130]();
}

uint64_t sub_24B4ADBA8()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_24B4ADBB4()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_24B4ADBC0()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_24B4ADBCC()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_24B4ADBD8()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_24B4ADBE4()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_24B4ADBF0()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_24B4ADBFC()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_24B4ADC08()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_24B4ADC14()
{
  return MEMORY[0x24BDF4808]();
}

uint64_t sub_24B4ADC20()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_24B4ADC2C()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_24B4ADC38()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_24B4ADC44()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_24B4ADC50()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_24B4ADC5C()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_24B4ADC68()
{
  return MEMORY[0x24BDF4F80]();
}

uint64_t sub_24B4ADC74()
{
  return MEMORY[0x24BDF4FE0]();
}

uint64_t sub_24B4ADC80()
{
  return MEMORY[0x24BDF5390]();
}

uint64_t sub_24B4ADC8C()
{
  return MEMORY[0x24BDF54A0]();
}

uint64_t sub_24B4ADC98()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24B4ADCA4()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_24B4ADCB0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24B4ADCBC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24B4ADCC8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_24B4ADCD4()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_24B4ADCE0()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_24B4ADCEC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24B4ADCF8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24B4ADD04()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24B4ADD10()
{
  return MEMORY[0x24BEE02A8]();
}

uint64_t sub_24B4ADD1C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24B4ADD28()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24B4ADD34()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24B4ADD40()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_24B4ADD4C()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_24B4ADD58()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24B4ADD64()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_24B4ADD70()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24B4ADD7C()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_24B4ADD88()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24B4ADD94()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_24B4ADDA0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_24B4ADDAC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_24B4ADDB8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24B4ADDC4()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_24B4ADDD0()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_24B4ADDDC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24B4ADDE8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24B4ADDF4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24B4ADE00()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24B4ADE0C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24B4ADE18()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_24B4ADE24()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_24B4ADE30()
{
  return MEMORY[0x24BEE5718]();
}

uint64_t sub_24B4ADE3C()
{
  return MEMORY[0x24BEE5728]();
}

uint64_t sub_24B4ADE48()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_24B4ADE54()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24B4ADE60()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_24B4ADE6C()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_24B4ADE78()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_24B4ADE84()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24B4ADE90()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24B4ADE9C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24B4ADEA8()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_24B4ADEB4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24B4ADEC0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24B4ADECC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_24B4ADED8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_24B4ADEE4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_24B4ADEF0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24B4ADEFC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24B4ADF08()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24B4ADF14()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24B4ADF20()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_24B4ADF2C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24B4ADF38()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24B4ADF44()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24B4ADF50()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24B4ADF5C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24B4ADF68()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_24B4ADF74()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24B4ADF80()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24B4ADF8C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_24B4ADF98()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_24B4ADFA4()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_24B4ADFB0()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_24B4ADFBC()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24B4ADFC8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24B4ADFD4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24B4ADFE0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_24B4ADFEC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24B4ADFF8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24B4AE004()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24B4AE010()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24B4AE01C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24B4AE028()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24B4AE034()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24B4AE040()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24B4AE04C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24B4AE058()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24B4AE064()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

