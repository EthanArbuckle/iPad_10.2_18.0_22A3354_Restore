uint64_t objectdestroy_32Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = (int *)type metadata accessor for AsyncIconImage(0, v5, v6, a4);
  v8 = (*(unsigned __int8 *)(*((_QWORD *)v7 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v7 - 1) + 80);
  v9 = v4 + v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_24B35DA30();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v4 + v8, v10);
  }
  else
  {
    swift_release();
  }
  v11 = v9 + v7[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_24B35DA54();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  sub_24B3599F4(*(_QWORD *)(v9 + v7[10]), *(_BYTE *)(v9 + v7[10] + 8));
  v13 = v9 + v7[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_24B35DB08();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  sub_24B359A00(*(_QWORD *)(v9 + v7[12]), *(_QWORD *)(v9 + v7[12] + 8), *(unsigned __int8 *)(v9 + v7[12] + 16), *(_BYTE *)(v9 + v7[12] + 17));
  sub_24B3599F4(*(_QWORD *)(v9 + v7[13]), *(_BYTE *)(v9 + v7[13] + 8));
  sub_24B359A0C(*(_QWORD *)(v9 + v7[14]), *(unsigned __int8 *)(v9 + v7[14] + 8), *(_BYTE *)(v9 + v7[14] + 9));
  sub_24B359A0C(*(_QWORD *)(v9 + v7[15]), *(unsigned __int8 *)(v9 + v7[15] + 8), *(_BYTE *)(v9 + v7[15] + 9));

  swift_release();
  swift_release();
  v15 = (id *)(v9 + v7[20]);

  v17 = type metadata accessor for AsyncIconImage.LoadingState(0, v5, v6, v16);
  v18 = (char *)v15 + *(int *)(v17 + 36);
  v19 = type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v18, 1, v19))
  {
    v20 = sub_24B35DA30();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v18, v20);
    v21 = &v18[*(int *)(v19 + 20)];
    v22 = sub_24B35DB08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
    v23 = &v18[*(int *)(v19 + 24)];
    v24 = sub_24B35DA54();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
  }
  swift_release();
  sub_24B359A18(*(unint64_t *)((char *)v15 + *(int *)(v17 + 44)));
  sub_24B35DBD4();
  swift_release();

  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1E4C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24BD1E478](a1, v6, a5);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1E4CC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

void type metadata accessor for ISImageDescriptorName(uint64_t a1)
{
  sub_24B3543D0(a1, &qword_2544D6BF0);
}

_QWORD *sub_24B353BBC(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24B35DA30();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = a3[8];
    v18 = (char *)a1 + v16;
    v19 = (char *)a2 + v16;
    *(_QWORD *)v18 = *(_QWORD *)v19;
    v18[8] = v19[8];
    *((_BYTE *)a1 + v17) = *((_BYTE *)a2 + v17);
  }
  return a1;
}

uint64_t sub_24B353CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_24B35DA30();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_24B35DB08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + *(int *)(a2 + 24);
  v8 = sub_24B35DA54();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_24B353D44(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_24B35DA30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24B35DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_24B35DA54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = a3[8];
  v17 = a1 + v15;
  v18 = a2 + v15;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  return a1;
}

uint64_t sub_24B353E18(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v6 = sub_24B35DA30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24B35DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_24B35DA54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = (uint64_t *)(a2 + v15);
  v18 = *v17;
  *(_BYTE *)(v16 + 8) = *((_BYTE *)v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_24B353EF0(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_24B35DA30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24B35DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_24B35DA54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a3[8];
  v17 = a1 + v15;
  v18 = a2 + v15;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  return a1;
}

uint64_t sub_24B353FC4(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = sub_24B35DA30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_24B35DB08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_24B35DA54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a3[8];
  v17 = a1 + v15;
  v18 = a2 + v15;
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *(_BYTE *)(v17 + 8) = *(_BYTE *)(v18 + 8);
  *(_BYTE *)(a1 + v16) = *(_BYTE *)(a2 + v16);
  return a1;
}

uint64_t sub_24B354098()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B3540A4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v16;
  int v17;

  v6 = sub_24B35DA30();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_24B35DB08();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_24B35DA54();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(unsigned __int8 *)(a1 + a3[8]);
  if (v16 >= 2)
    v17 = ((v16 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v17 = -2;
  if (v17 < 0)
    v17 = -1;
  return (v17 + 1);
}

uint64_t sub_24B35418C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B354198(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_24B35DA30();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_24B35DB08();
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_24B35DA54();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_BYTE *)(a1 + a4[8]) = a2 + 2;
  return result;
}

uint64_t type metadata accessor for IconEnvironmentTraits()
{
  uint64_t result;

  result = qword_2544D6B68;
  if (!qword_2544D6B68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24B35429C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_24B35DA30();
  if (v1 <= 0x3F)
  {
    result = sub_24B35DB08();
    if (v2 <= 0x3F)
    {
      result = sub_24B35DA54();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

void type metadata accessor for ISIconShape(uint64_t a1)
{
  sub_24B3543D0(a1, &qword_2544D6BE8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24B354374(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24B354394(uint64_t result, int a2, int a3)
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
  sub_24B3543D0(a1, &qword_2544D6BF8);
}

void sub_24B3543D0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24B354414()
{
  return sub_24B354ACC(&qword_257972DA0, (uint64_t (*)(uint64_t))type metadata accessor for ISIconShape, (uint64_t)&unk_24B35E22C);
}

uint64_t sub_24B354440()
{
  uint64_t v0;
  uint64_t v1;

  sub_24B35DD60();
  sub_24B35DA30();
  sub_24B354ACC(&qword_257972DD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB438]);
  sub_24B35DC10();
  v1 = type metadata accessor for IconEnvironmentTraits();
  sub_24B35DB08();
  sub_24B354ACC(&qword_257972DD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEE00], MEMORY[0x24BDEEE20]);
  sub_24B35DC10();
  sub_24B35DA54();
  sub_24B354ACC(&qword_257972DE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], MEMORY[0x24BDED150]);
  sub_24B35DC10();
  if (*(_BYTE *)(v0 + *(int *)(v1 + 28) + 8) == 1)
  {
    sub_24B35DD78();
  }
  else
  {
    sub_24B35DD78();
    sub_24B35DD6C();
  }
  if (*(_BYTE *)(v0 + *(int *)(v1 + 32)) != 2)
    sub_24B35DD78();
  sub_24B35DD78();
  return sub_24B35DD84();
}

uint64_t sub_24B3545BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B35DA30();
  sub_24B354ACC(&qword_257972DD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB438]);
  sub_24B35DC10();
  sub_24B35DB08();
  sub_24B354ACC(&qword_257972DD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEE00], MEMORY[0x24BDEEE20]);
  sub_24B35DC10();
  sub_24B35DA54();
  sub_24B354ACC(&qword_257972DE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], MEMORY[0x24BDED150]);
  sub_24B35DC10();
  if (*(_BYTE *)(v2 + *(int *)(a2 + 28) + 8) == 1)
  {
    sub_24B35DD78();
  }
  else
  {
    sub_24B35DD78();
    sub_24B35DD6C();
  }
  if (*(_BYTE *)(v2 + *(int *)(a2 + 32)) != 2)
    sub_24B35DD78();
  return sub_24B35DD78();
}

uint64_t sub_24B354718(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24B35DD60();
  sub_24B35DA30();
  sub_24B354ACC(&qword_257972DD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB438]);
  sub_24B35DC10();
  sub_24B35DB08();
  sub_24B354ACC(&qword_257972DD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEE00], MEMORY[0x24BDEEE20]);
  sub_24B35DC10();
  sub_24B35DA54();
  sub_24B354ACC(&qword_257972DE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], MEMORY[0x24BDED150]);
  sub_24B35DC10();
  if (*(_BYTE *)(v2 + *(int *)(a2 + 28) + 8) == 1)
  {
    sub_24B35DD78();
  }
  else
  {
    sub_24B35DD78();
    sub_24B35DD6C();
  }
  if (*(_BYTE *)(v2 + *(int *)(a2 + 32)) != 2)
    sub_24B35DD78();
  sub_24B35DD78();
  return sub_24B35DD84();
}

BOOL sub_24B354888(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_24B35489C(uint64_t a1, uint64_t a2)
{
  return sub_24B354C60(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_24B3548A8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_24B35DC28();
  *a2 = 0;
  return result;
}

uint64_t sub_24B35491C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_24B35DC34();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24B354998@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_24B35DC40();
  v2 = sub_24B35DC1C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24B3549D8()
{
  sub_24B35DD60();
  sub_24B35DD6C();
  return sub_24B35DD84();
}

uint64_t sub_24B354A1C()
{
  return sub_24B35DD6C();
}

uint64_t sub_24B354A44()
{
  sub_24B35DD60();
  sub_24B35DD6C();
  return sub_24B35DD84();
}

_QWORD *sub_24B354A84@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_24B354A94(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_24B354AA0()
{
  return sub_24B354ACC(&qword_2544D6B60, (uint64_t (*)(uint64_t))type metadata accessor for IconEnvironmentTraits, (uint64_t)&unk_24B35E40C);
}

uint64_t sub_24B354ACC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24BD1E4D8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B354B0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_24B35DC1C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24B354B50@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24B35DC40();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24B354B78()
{
  sub_24B354ACC(&qword_257972DC0, (uint64_t (*)(uint64_t))type metadata accessor for ISImageDescriptorName, (uint64_t)&unk_24B35E384);
  sub_24B354ACC(&qword_257972DC8, (uint64_t (*)(uint64_t))type metadata accessor for ISImageDescriptorName, (uint64_t)&unk_24B35E32C);
  return sub_24B35DD0C();
}

uint64_t sub_24B354BFC()
{
  return sub_24B354ACC(&qword_257972DA8, (uint64_t (*)(uint64_t))type metadata accessor for ISImageDescriptorName, (uint64_t)&unk_24B35E2F4);
}

uint64_t sub_24B354C28()
{
  return sub_24B354ACC(&qword_257972DB0, (uint64_t (*)(uint64_t))type metadata accessor for ISImageDescriptorName, (uint64_t)&unk_24B35E2CC);
}

uint64_t sub_24B354C54(uint64_t a1, uint64_t a2)
{
  return sub_24B354C60(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_24B354C60(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_24B35DC40();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24B354C9C()
{
  sub_24B35DC40();
  sub_24B35DC4C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B354CDC()
{
  uint64_t v0;

  sub_24B35DC40();
  sub_24B35DD60();
  sub_24B35DC4C();
  v0 = sub_24B35DD84();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24B354D4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_24B35DC40();
  v2 = v1;
  if (v0 == sub_24B35DC40() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_24B35DD24();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24B354DD4()
{
  return sub_24B354ACC(&qword_257972DB8, (uint64_t (*)(uint64_t))type metadata accessor for ISImageDescriptorName, (uint64_t)&unk_24B35E35C);
}

uint64_t sub_24B354E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  _BOOL4 v13;

  if ((sub_24B35DA24() & 1) == 0)
    return 0;
  v4 = type metadata accessor for IconEnvironmentTraits();
  if ((sub_24B35DA24() & 1) == 0 || (sub_24B35DA48() & 1) == 0)
    return 0;
  v5 = *(int *)(v4 + 28);
  v6 = (_QWORD *)(a1 + v5);
  v7 = *(_BYTE *)(a1 + v5 + 8);
  v8 = (_QWORD *)(a2 + v5);
  v9 = *(unsigned __int8 *)(a2 + v5 + 8);
  if ((v7 & 1) == 0)
  {
    if (*v6 != *v8)
      LOBYTE(v9) = 1;
    if ((v9 & 1) != 0)
      return 0;
LABEL_10:
    v10 = *(int *)(v4 + 32);
    v11 = *(unsigned __int8 *)(a1 + v10);
    v12 = *(unsigned __int8 *)(a2 + v10);
    if (v11 == 2)
    {
      if (v12 != 2)
        return 0;
    }
    else
    {
      v13 = (v11 & 1) == 0;
      if (v12 == 2 || ((v13 ^ v12) & 1) == 0)
        return 0;
    }
    return 1;
  }
  if (v9)
    goto LABEL_10;
  return 0;
}

void sub_24B354EDC(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
}

uint64_t sub_24B354EEC()
{
  sub_24B355A48();
  return sub_24B35DA3C();
}

void sub_24B354F3C(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_24B354F48()
{
  sub_24B3559EC();
  return sub_24B35DA3C();
}

uint64_t sub_24B354F98()
{
  sub_24B355970();
  return sub_24B35DA3C();
}

void sub_24B354FE8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t sub_24B354FF8()
{
  sub_24B3558C8();
  return sub_24B35DA3C();
}

uint64_t sub_24B355048()
{
  uint64_t v1;

  sub_24B355844();
  sub_24B35DACC();
  return v1;
}

uint64_t sub_24B355084()
{
  unsigned __int8 v1;

  sub_24B355800();
  sub_24B35DACC();
  return v1;
}

uint64_t sub_24B3550BC()
{
  return sub_24B3550E4((void (*)(void))sub_24B3557BC);
}

uint64_t sub_24B3550D0()
{
  return sub_24B3550E4((void (*)(void))sub_24B355778);
}

uint64_t sub_24B3550E4(void (*a1)(void))
{
  uint64_t v2;

  a1();
  sub_24B35DACC();
  return v2;
}

uint64_t View.iconSize(_:)()
{
  swift_getKeyPath();
  sub_24B35DB5C();
  return swift_release();
}

double sub_24B3551B0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  sub_24B355844();
  sub_24B35DACC();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

double sub_24B355204@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  char v4;

  sub_24B355844();
  sub_24B35DACC();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return result;
}

uint64_t sub_24B355258()
{
  sub_24B355844();
  return sub_24B35DAD8();
}

uint64_t sub_24B3552A8()
{
  sub_24B355844();
  return sub_24B35DAD8();
}

uint64_t View.iconDrawsBorder(_:)()
{
  swift_getKeyPath();
  sub_24B35DB5C();
  return swift_release();
}

uint64_t sub_24B355368@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_24B355800();
  result = sub_24B35DACC();
  *a1 = v3;
  return result;
}

uint64_t sub_24B3553B4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_24B355800();
  result = sub_24B35DACC();
  *a1 = v3;
  return result;
}

uint64_t sub_24B355400()
{
  sub_24B355800();
  return sub_24B35DAD8();
}

uint64_t sub_24B355448()
{
  sub_24B355800();
  return sub_24B35DAD8();
}

uint64_t View.iconShape(_:)()
{
  return sub_24B3554F8();
}

uint64_t sub_24B35549C@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_24B3557BC, a1);
}

uint64_t sub_24B3554B0@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_24B3557BC, a1);
}

uint64_t sub_24B3554C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24B3557BC);
}

uint64_t sub_24B3554D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24B3557BC);
}

uint64_t View.iconScale(_:)()
{
  return sub_24B3554F8();
}

uint64_t sub_24B3554F8()
{
  swift_getKeyPath();
  sub_24B35DB5C();
  return swift_release();
}

uint64_t sub_24B355578@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_24B355778, a1);
}

uint64_t keypath_get_6Tm@<X0>(void (*a1)(void)@<X3>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  char v5;

  a1();
  result = sub_24B35DACC();
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_24B3555E8@<X0>(uint64_t a1@<X8>)
{
  return keypath_get_6Tm((void (*)(void))sub_24B355778, a1);
}

uint64_t sub_24B3555FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24B355778);
}

uint64_t keypath_set_7Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  a5(a1, a2);
  return sub_24B35DAD8();
}

uint64_t sub_24B355660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_set_7Tm(a1, a2, a3, a4, (void (*)(uint64_t, uint64_t))sub_24B355778);
}

uint64_t sub_24B355674(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_2544D6C48, &qword_2544D6C40);
}

uint64_t sub_24B355688(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_2544D6C38, &qword_2544D6C30);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  v6 = sub_24B35DA60();
  v8[0] = v5;
  v8[1] = sub_24B355738(a3, a2);
  return MEMORY[0x24BD1E4D8](MEMORY[0x24BDED308], v6, v8);
}

uint64_t sub_24B355710(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_257972DE8, &qword_257972DF0);
}

uint64_t sub_24B355724(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySo6CGSizeVSgGGAaBHPxAaBHD1__AjA0cI0HPyHCHCTm(a1, &qword_257972DF8, &qword_257972E00);
}

uint64_t sub_24B355738(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BDF1028], v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24B355778()
{
  unint64_t result;

  result = qword_2544D6A38;
  if (!qword_2544D6A38)
  {
    result = MEMORY[0x24BD1E4D8](&unk_24B35E5E8, &type metadata for IconScaleKey);
    atomic_store(result, (unint64_t *)&qword_2544D6A38);
  }
  return result;
}

unint64_t sub_24B3557BC()
{
  unint64_t result;

  result = qword_2544D6B98;
  if (!qword_2544D6B98)
  {
    result = MEMORY[0x24BD1E4D8](&unk_24B35E5B0, &type metadata for IconShapeKey);
    atomic_store(result, (unint64_t *)&qword_2544D6B98);
  }
  return result;
}

unint64_t sub_24B355800()
{
  unint64_t result;

  result = qword_2544D6B58;
  if (!qword_2544D6B58)
  {
    result = MEMORY[0x24BD1E4D8](&unk_24B35E578, &type metadata for IconDrawsBorderKey);
    atomic_store(result, (unint64_t *)&qword_2544D6B58);
  }
  return result;
}

unint64_t sub_24B355844()
{
  unint64_t result;

  result = qword_2544D6B90;
  if (!qword_2544D6B90)
  {
    result = MEMORY[0x24BD1E4D8](&unk_24B35E540, &type metadata for IconSizeKey);
    atomic_store(result, (unint64_t *)&qword_2544D6B90);
  }
  return result;
}

ValueMetadata *type metadata accessor for IconSizeKey()
{
  return &type metadata for IconSizeKey;
}

ValueMetadata *type metadata accessor for IconDrawsBorderKey()
{
  return &type metadata for IconDrawsBorderKey;
}

ValueMetadata *type metadata accessor for IconShapeKey()
{
  return &type metadata for IconShapeKey;
}

ValueMetadata *type metadata accessor for IconScaleKey()
{
  return &type metadata for IconScaleKey;
}

unint64_t sub_24B3558C8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257972E08;
  if (!qword_257972E08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257972E10);
    v2 = sub_24B35592C();
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257972E08);
  }
  return result;
}

unint64_t sub_24B35592C()
{
  unint64_t result;

  result = qword_257972E18;
  if (!qword_257972E18)
  {
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BEE50E0], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_257972E18);
  }
  return result;
}

unint64_t sub_24B355970()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257972E20;
  if (!qword_257972E20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257972E28);
    v2 = sub_24B354ACC(&qword_257972DA0, (uint64_t (*)(uint64_t))type metadata accessor for ISIconShape, (uint64_t)&unk_24B35E22C);
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257972E20);
  }
  return result;
}

unint64_t sub_24B3559EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2544D6C58;
  if (!qword_2544D6C58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544D6C50);
    v2 = MEMORY[0x24BEE1340];
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2544D6C58);
  }
  return result;
}

unint64_t sub_24B355A48()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2544D6C70;
  if (!qword_2544D6C70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544D6C68);
    v2 = sub_24B354ACC(&qword_2544D6C60, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, MEMORY[0x24BDBD858]);
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BEE4AB8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2544D6C70);
  }
  return result;
}

uint64_t AsyncIconImagePhase.image.getter()
{
  _QWORD *v0;

  if (*v0 >> 62)
    return 0;
  else
    return swift_retain();
}

uint64_t AsyncIconImagePhase.error.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *v0;
  if ((unint64_t)*v0 >> 62 != 1)
    return 0;
  v2 = v1 & 0x3FFFFFFFFFFFFFFFLL;
  v3 = (id)(v1 & 0x3FFFFFFFFFFFFFFFLL);
  return v2;
}

double sub_24B355B34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  double v5;

  v2 = v1 + *(int *)(a1 + 40);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_24B35A36C(*(_QWORD *)v2, v4);
  v5 = sub_24B359244(v3, v4);
  sub_24B3599F4(v3, v4);
  return v5;
}

uint64_t sub_24B355B90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  v2 = v1 + *(int *)(a1 + 48);
  v3 = *(_QWORD *)v2;
  v4 = *(_QWORD *)(v2 + 8);
  v5 = *(unsigned __int8 *)(v2 + 16);
  v6 = *(unsigned __int8 *)(v2 + 17);
  sub_24B35A378(*(_QWORD *)v2, v4, v5, *(_BYTE *)(v2 + 17));
  v7 = sub_24B3593D8(v3, v4, v5 | (v6 << 8));
  sub_24B359A00(v3, v4, v5, v6);
  return v7;
}

uint64_t sub_24B355C2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = v1 + *(int *)(a1 + 52);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_24B35A36C(*(_QWORD *)v2, v4);
  v5 = sub_24B359590(v3, v4);
  sub_24B3599F4(v3, v4);
  return v5;
}

uint64_t sub_24B355C88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = v1 + *(int *)(a1 + 56);
  v3 = *(_QWORD *)v2;
  v4 = *(unsigned __int8 *)(v2 + 8);
  v5 = *(unsigned __int8 *)(v2 + 9);
  sub_24B35A384(*(_QWORD *)v2, v4, *(_BYTE *)(v2 + 9));
  v6 = sub_24B35972C(v3, v4 | (v5 << 8), 0xD000000000000015, 0x800000024B35F920, (void (*)(_QWORD, _QWORD, _QWORD))sub_24B35D9E8);
  sub_24B359A0C(v3, v4, v5);
  return v6;
}

uint64_t sub_24B355D28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = v1 + *(int *)(a1 + 60);
  v3 = *(_QWORD *)v2;
  v4 = *(unsigned __int8 *)(v2 + 8);
  v5 = *(unsigned __int8 *)(v2 + 9);
  sub_24B35A384(*(_QWORD *)v2, v4, *(_BYTE *)(v2 + 9));
  v6 = sub_24B35972C(v3, v4 | (v5 << 8), 0xD000000000000011, 0x800000024B35F900, (void (*)(_QWORD, _QWORD, _QWORD))sub_24B359A0C);
  sub_24B359A0C(v3, v4, v5);
  return v6;
}

uint64_t sub_24B355DC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = type metadata accessor for AsyncIconImage.LoadingState(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v9 - v7, a1, v5);
  sub_24B35DBB0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
}

uint64_t sub_24B355E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AsyncIconImage.LoadingState(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  sub_24B35DBD4();
  return sub_24B35DBBC();
}

uint64_t sub_24B355EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  int *v5;
  char *v6;
  uint64_t v7;
  uint64_t result;

  *a4 = 0;
  v5 = (int *)type metadata accessor for AsyncIconImage.LoadingState(0, a1, a2, a3);
  v6 = (char *)a4 + v5[9];
  v7 = type metadata accessor for IconEnvironmentTraits();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(_QWORD *)((char *)a4 + v5[10]) = 0;
  *(_QWORD *)((char *)a4 + v5[11]) = 0x8000000000000000;
  return result;
}

uint64_t sub_24B355F24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t result;
  uint64_t v9;

  sub_24B35903C(&qword_2544D6BA0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEB418], 0x686353726F6C6F43, 0xEB00000000656D65, a2);
  v4 = (int *)type metadata accessor for IconEnvironmentTraits();
  sub_24B35903C(&qword_2544D6BC0, (uint64_t (*)(_QWORD))MEMORY[0x24BDEEE00], 0xD000000000000013, 0x800000024B35F940, a2 + v4[5]);
  sub_24B35903C(&qword_2544D6BB0, (uint64_t (*)(_QWORD))MEMORY[0x24BDED130], 0x694474756F79614CLL, 0xEF6E6F6974636572, a2 + v4[6]);
  v5 = sub_24B355C88(a1);
  v7 = v6;
  result = sub_24B355C2C(a1);
  v9 = a2 + v4[7];
  *(_QWORD *)v9 = v5;
  *(_BYTE *)(v9 + 8) = v7 & 1;
  *(_BYTE *)(a2 + v4[8]) = result;
  return result;
}

uint64_t AsyncIconImage.init<>(icon:descriptor:)@<X0>(void *a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  id v7;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = a2;
  return sub_24B35620C((uint64_t)a1, (uint64_t)a2, 0, (uint64_t)sub_24B356204, v6, a3);
}

void sub_24B3560BC(uint64_t *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v5 = *a1;
  if (!((unint64_t)*a1 >> 62))
  {
    swift_retain();
LABEL_10:
    *a4 = v5;
    return;
  }
  if (a3)
    v8 = a3;
  else
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_init);
  v9 = a3;
  v5 = sub_24B35DBA4();
  v10 = objc_msgSend(a2, sel_imageForDescriptor_, v8);
  if (!v10)
  {

    goto LABEL_10;
  }
  v11 = v10;
  if (objc_msgSend(v10, sel_CGImage))
  {
    objc_msgSend(v11, sel_scale);
    v12 = sub_24B35DB98();

    swift_release();
    v5 = v12;
    goto LABEL_10;
  }
  __break(1u);
}

uint64_t sub_24B3561D8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_24B356204(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  sub_24B3560BC(a1, *(void **)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t sub_24B35620C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  int *v14;
  uint64_t *v15;
  char *v16;
  uint64_t *v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v31 = a4;
  v32 = a5;
  v29 = a2;
  v30 = a3;
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_2544D6AC8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (uint64_t *)((char *)&v29 - v12);
  *a6 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  swift_storeEnumTagMultiPayload();
  v14 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B50);
  v15 = (uint64_t *)((char *)a6 + v14[9]);
  *v15 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  swift_storeEnumTagMultiPayload();
  v16 = (char *)a6 + v14[10];
  *(_QWORD *)v16 = swift_getKeyPath();
  v16[8] = 0;
  v17 = (uint64_t *)((char *)a6 + v14[11]);
  *v17 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  swift_storeEnumTagMultiPayload();
  v18 = (char *)a6 + v14[12];
  *(_QWORD *)v18 = swift_getKeyPath();
  *((_QWORD *)v18 + 1) = 0;
  *((_WORD *)v18 + 8) = 0;
  v19 = (char *)a6 + v14[13];
  *(_QWORD *)v19 = swift_getKeyPath();
  v19[8] = 0;
  v20 = (char *)a6 + v14[14];
  *(_QWORD *)v20 = swift_getKeyPath();
  *((_WORD *)v20 + 4) = 0;
  v21 = (char *)a6 + v14[15];
  *(_QWORD *)v21 = swift_getKeyPath();
  *((_WORD *)v21 + 4) = 0;
  v22 = v14[17];
  *(uint64_t *)((char *)a6 + v22) = 0;
  *v13 = 0;
  v23 = (char *)v13 + v8[9];
  v24 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 1, 1, v24);
  *(_QWORD *)((char *)v13 + v8[10]) = 0;
  *(_QWORD *)((char *)v13 + v8[11]) = 0x8000000000000000;
  sub_24B35D8EC((uint64_t)v13, (uint64_t)v11, qword_2544D6AC8);
  sub_24B35DBB0();
  result = sub_24B35D930((uint64_t)v13, qword_2544D6AC8);
  *(uint64_t *)((char *)a6 + v14[21]) = 0;
  *(uint64_t *)((char *)a6 + v14[16]) = a1;
  v26 = v30;
  *(uint64_t *)((char *)a6 + v22) = v29;
  *(uint64_t *)((char *)a6 + v14[18]) = v26;
  v27 = (uint64_t *)((char *)a6 + v14[19]);
  v28 = v32;
  *v27 = v31;
  v27[1] = v28;
  return result;
}

uint64_t AsyncIconImage.init(icon:descriptor:transaction:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int *v18;
  uint64_t *v19;
  char *v20;
  uint64_t *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v32 = a4;
  v33 = a5;
  v14 = type metadata accessor for AsyncIconImage.LoadingState(0, a6, a7, a4);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t *)((char *)&v32 - v15);
  *a8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  swift_storeEnumTagMultiPayload();
  v18 = (int *)type metadata accessor for AsyncIconImage(0, a6, a7, v17);
  v19 = (uint64_t *)((char *)a8 + v18[9]);
  *v19 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  swift_storeEnumTagMultiPayload();
  v20 = (char *)a8 + v18[10];
  *(_QWORD *)v20 = swift_getKeyPath();
  v20[8] = 0;
  v21 = (uint64_t *)((char *)a8 + v18[11]);
  *v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  swift_storeEnumTagMultiPayload();
  v22 = (char *)a8 + v18[12];
  *(_QWORD *)v22 = swift_getKeyPath();
  *((_QWORD *)v22 + 1) = 0;
  *((_WORD *)v22 + 8) = 0;
  v23 = (char *)a8 + v18[13];
  *(_QWORD *)v23 = swift_getKeyPath();
  v23[8] = 0;
  v24 = (char *)a8 + v18[14];
  *(_QWORD *)v24 = swift_getKeyPath();
  *((_WORD *)v24 + 4) = 0;
  v25 = (char *)a8 + v18[15];
  *(_QWORD *)v25 = swift_getKeyPath();
  *((_WORD *)v25 + 4) = 0;
  v26 = v18[17];
  sub_24B355EA8(a6, a7, v27, v16);
  result = sub_24B355DC8((uint64_t)v16, a6, a7, v28);
  *(uint64_t *)((char *)a8 + v18[21]) = 0;
  *(uint64_t *)((char *)a8 + v18[16]) = a1;
  *(uint64_t *)((char *)a8 + v26) = a2;
  *(uint64_t *)((char *)a8 + v18[18]) = a3;
  v30 = (uint64_t *)((char *)a8 + v18[19]);
  v31 = v33;
  *v30 = v32;
  v30[1] = v31;
  return result;
}

uint64_t type metadata accessor for AsyncIconImage.LoadingState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncIconImage.LoadingState);
}

uint64_t AsyncIconImage.init<A, B>(icon:descriptor:transaction:content:placeholder:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v25[2];

  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a8;
  v18[3] = a10;
  v18[4] = a11;
  v18[5] = a12;
  v18[6] = a4;
  v18[7] = a5;
  v18[8] = a6;
  v18[9] = a7;
  v19 = sub_24B35DB2C();
  v25[0] = a11;
  v25[1] = a12;
  v20 = MEMORY[0x24BD1E4D8](MEMORY[0x24BDEF3E0], v19, v25);
  return AsyncIconImage.init(icon:descriptor:transaction:content:)(a1, a2, a3, (uint64_t)sub_24B359994, (uint64_t)v18, v19, v20, a9);
}

uint64_t sub_24B3567B0@<X0>(unint64_t *a1@<X0>, void (*a2)(uint64_t)@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  uint64_t v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  void (*v43)(uint64_t);
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];

  v47 = a8;
  v48 = a9;
  v40 = a5;
  v41 = a4;
  v42 = a3;
  v43 = a2;
  v49 = a10;
  v44 = *(_QWORD *)(a6 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v45 = (char *)&v40 - v17;
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v16);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v40 - v23;
  v25 = sub_24B35DB2C();
  v46 = *(_QWORD *)(v25 - 8);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v40 - v27;
  v29 = *a1;
  if (*a1 >> 62)
  {
    v41(v26);
    v36 = *(void (**)(char *, char *, uint64_t))(v19 + 16);
    v36(v24, v22, a7);
    v37 = *(void (**)(char *, uint64_t))(v19 + 8);
    v37(v22, a7);
    v36(v22, v24, a7);
    v35 = v47;
    sub_24B356B04((uint64_t)v22, a6, a7);
    v37(v22, a7);
    v37(v24, a7);
  }
  else
  {
    v30 = swift_retain();
    v43(v30);
    v31 = v44;
    v32 = v45;
    v33 = *(void (**)(char *, char *, uint64_t))(v44 + 16);
    v33(v45, v15, a6);
    v34 = *(void (**)(char *, uint64_t))(v31 + 8);
    v34(v15, a6);
    v33(v15, v32, a6);
    v35 = v47;
    sub_24B356A40((uint64_t)v15, a6);
    sub_24B359A18(v29);
    v34(v15, a6);
    v34(v32, a6);
  }
  v50[0] = v35;
  v50[1] = v49;
  MEMORY[0x24BD1E4D8](MEMORY[0x24BDEF3E0], v25, v50);
  v38 = v46;
  (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v48, v28, v25);
  return (*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v28, v25);
}

uint64_t sub_24B356A40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = sub_24B35DB14();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v7 - v5, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_24B35DB20();
}

uint64_t sub_24B356B04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v5 = sub_24B35DB14();
  MEMORY[0x24BDAC7A8](v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v8 - v6, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_24B35DB20();
}

uint64_t AsyncIconImage.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  void (*v62)(char *, uint64_t);
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  _QWORD v83[2];
  uint64_t (*v84)(uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v85;
  __int128 v86;
  __int128 v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v92;
  __int128 v93;
  __int128 v94;

  v79 = a2;
  v78 = type metadata accessor for IconEnvironmentTraits();
  v4 = MEMORY[0x24BDAC7A8](v78);
  v74 = (uint64_t)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](v4);
  v71 = (char *)&v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v64 - v9;
  v11 = *(_QWORD *)(a1 + 24);
  v69 = *(_QWORD *)(a1 + 16);
  v12 = v69;
  v80 = v11;
  v14 = type metadata accessor for AsyncIconImage.LoadingState(0, v69, v11, v13);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v64 - v16;
  v70 = type metadata accessor for AsyncIconImage.Inner(255, v12, v11, v18);
  v72 = sub_24B35DA60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544D6BD8);
  v76 = sub_24B35DA60();
  v77 = *(_QWORD *)(v76 - 8);
  v19 = MEMORY[0x24BDAC7A8](v76);
  v73 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v75 = (char *)&v64 - v21;
  sub_24B355E64(a1, v22, v23, v24);
  v25 = *(_QWORD *)&v17[*(int *)(v14 + 44)];
  sub_24B3599D0(v25);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v26 = a1;
  v27 = *(int *)(a1 + 76);
  v81 = v2;
  v28 = (uint64_t *)(v2 + v27);
  v29 = *v28;
  v65 = v28[1];
  v88 = v25;
  v89 = v29;
  v90 = v65;
  v30 = v6;
  v31 = *(void (**)(char *, uint64_t))(v6 + 16);
  v68 = v10;
  v32 = v26;
  v31(v10, v2);
  v33 = *(unsigned __int8 *)(v6 + 80);
  v34 = (v33 + 32) & ~v33;
  v64 = v34;
  v66 = v34 + v7;
  v67 = v33 | 7;
  v35 = swift_allocObject();
  v36 = v69;
  v37 = v80;
  *(_QWORD *)(v35 + 16) = v69;
  *(_QWORD *)(v35 + 24) = v37;
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v30 + 32);
  v39 = v32;
  v38(v35 + v34, v10, v32);
  v40 = v71;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v71, v81, v39);
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v36;
  *(_QWORD *)(v41 + 24) = v37;
  v42 = v36;
  v43 = v64;
  v38(v41 + v64, v40, v39);
  v84 = sub_24B359A38;
  *(_QWORD *)&v85 = v35;
  *((_QWORD *)&v85 + 1) = sub_24B359A48;
  *(_QWORD *)&v86 = v41;
  swift_retain();
  v44 = v70;
  v45 = MEMORY[0x24BD1E4D8](&unk_24B35E920, v70);
  MEMORY[0x24BD1E01C](&v91, &v84, v44, MEMORY[0x24BDF0928], v45);
  swift_release();
  swift_release();
  sub_24B359A18(v88);
  swift_release();
  v84 = v91;
  v85 = v92;
  v86 = v93;
  v87 = v94;
  v46 = v74;
  v47 = v39;
  v48 = v81;
  sub_24B355F24(v47, v74);
  v49 = v68;
  ((void (*)(char *, uint64_t, uint64_t))v31)(v68, v48, v47);
  v50 = swift_allocObject();
  v51 = v80;
  *(_QWORD *)(v50 + 16) = v42;
  *(_QWORD *)(v50 + 24) = v51;
  v38(v50 + v43, v49, v47);
  v83[0] = v45;
  v83[1] = MEMORY[0x24BDF0910];
  v52 = MEMORY[0x24BDED308];
  v53 = MEMORY[0x24BD1E4D8](MEMORY[0x24BDED308], v72, v83);
  sub_24B354ACC(&qword_2544D6B60, (uint64_t (*)(uint64_t))type metadata accessor for IconEnvironmentTraits, (uint64_t)&unk_24B35E40C);
  v54 = v73;
  sub_24B35DB8C();
  swift_release();
  sub_24B359B08(v46);
  v55 = v86;
  v56 = v87;
  sub_24B359A18((unint64_t)v84);
  swift_release();
  sub_24B359B44(v55);
  sub_24B359B44(v56);
  v57 = sub_24B35D7A8(&qword_2544D6BD0, &qword_2544D6BD8, MEMORY[0x24BDEF860]);
  v82[0] = v53;
  v82[1] = v57;
  v58 = v76;
  MEMORY[0x24BD1E4D8](v52, v76, v82);
  v59 = v77;
  v60 = *(void (**)(char *, char *, uint64_t))(v77 + 16);
  v61 = v75;
  v60(v75, v54, v58);
  v62 = *(void (**)(char *, uint64_t))(v59 + 8);
  v62(v54, v58);
  v60(v79, v61, v58);
  return ((uint64_t (*)(char *, uint64_t))v62)(v61, v58);
}

uint64_t sub_24B357168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v6 = type metadata accessor for IconEnvironmentTraits();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AsyncIconImage(0, a2, a3, v9);
  v11 = *(void **)(a1 + *(int *)(v10 + 64));
  sub_24B355F24(v10, (uint64_t)v8);
  sub_24B357208(v11, v8, v10);
  return sub_24B359B08((uint64_t)v8);
}

void sub_24B357208(void *a1, char *a2, uint64_t a3)
{
  char *v3;
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
  char *v25;
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
  char *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  char *v44;
  id v45;
  uint64_t v46;
  char *v47;
  id v48;
  id v49;
  char v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(char *, char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unsigned int (*v67)(uint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  id v76;
  void **v77;
  uint64_t v78;
  char *v79;
  id v80;
  id v81;
  char *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void (*v107)(char *, char *, uint64_t);
  uint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void **v116;
  uint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  char *v131;

  v129 = a2;
  v125 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BE0);
  MEMORY[0x24BDAC7A8](v5);
  v115 = (uint64_t)&v104 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a3 + 24);
  v120 = *(_QWORD *)(a3 + 16);
  v121 = v7;
  v9 = type metadata accessor for AsyncIconImage.LoadingState(255, v120, v7, v8);
  v122 = sub_24B35DBD4();
  v119 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v118 = (char *)&v104 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B88);
  MEMORY[0x24BDAC7A8](v11);
  v114 = (uint64_t)&v104 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v117 = (uint64_t)&v104 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v106 = (uint64_t)&v104 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v112 = (uint64_t)&v104 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v113 = (uint64_t)&v104 - v21;
  v127 = *(_QWORD *)(a3 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v109 = (char *)&v104 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v104 - v24;
  v128 = type metadata accessor for IconEnvironmentTraits();
  v124 = *(_QWORD *)(v128 - 8);
  v26 = MEMORY[0x24BDAC7A8](v128);
  v105 = (uint64_t)&v104 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = MEMORY[0x24BDAC7A8](v26);
  v123 = (uint64_t)&v104 - v29;
  v30 = *(_QWORD *)(v9 - 8);
  v31 = MEMORY[0x24BDAC7A8](v28);
  v116 = (void **)((char *)&v104 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0));
  v33 = MEMORY[0x24BDAC7A8](v31);
  v126 = (char *)&v104 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v37 = (char *)&v104 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v39 = (id *)((char *)&v104 - v38);
  v131 = v3;
  sub_24B355E64(a3, v40, v41, v42);
  v43 = *v39;
  v44 = *(char **)(v30 + 8);
  v45 = *v39;
  v130 = v9;
  v46 = v9;
  v47 = v44;
  ((void (*)(id *, uint64_t))v44)(v39, v46);
  v111 = v11;
  v110 = v37;
  if (v43)
  {
    sub_24B35D6A4(0, &qword_2544D6A30);
    v48 = v45;
    v49 = v125;
    v50 = sub_24B35DCDC();

  }
  else
  {
    v50 = 0;
  }
  v51 = v131;
  v52 = v127;
  v53 = v128;
  v54 = v123;
  sub_24B35CBD0((uint64_t)v129, v123);
  v55 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
  v55(v25, v51, a3);
  v107 = v55;
  if ((v50 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v52 + 8))(v25, a3);
    sub_24B359B08(v54);
    goto LABEL_13;
  }
  v56 = v113;
  sub_24B35CBD0(v54, v113);
  v57 = v124;
  v58 = v53;
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v124 + 56))(v56, 0, 1, v53);
  v59 = v110;
  sub_24B355E64(a3, v60, v61, v62);
  v63 = v130;
  v64 = v112;
  sub_24B35D8EC((uint64_t)&v59[*(int *)(v130 + 36)], v112, &qword_2544D6B78);
  v110 = v47;
  ((void (*)(char *, uint64_t))v47)(v59, v63);
  v65 = v114;
  v66 = v114 + *(int *)(v111 + 48);
  sub_24B35D8EC(v56, v114, &qword_2544D6B78);
  sub_24B35D8EC(v64, v66, &qword_2544D6B78);
  v67 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v57 + 48);
  if (v67(v65, 1, v58) == 1)
  {
    sub_24B35D930(v64, &qword_2544D6B78);
    sub_24B35D930(v56, &qword_2544D6B78);
    (*(void (**)(char *, uint64_t))(v127 + 8))(v25, a3);
    sub_24B359B08(v54);
    if (v67(v66, 1, v58) == 1)
    {
      sub_24B35D930(v65, &qword_2544D6B78);
      return;
    }
    goto LABEL_11;
  }
  v71 = v106;
  sub_24B35D8EC(v65, v106, &qword_2544D6B78);
  if (v67(v66, 1, v58) == 1)
  {
    sub_24B35D930(v64, &qword_2544D6B78);
    sub_24B35D930(v56, &qword_2544D6B78);
    (*(void (**)(char *, uint64_t))(v127 + 8))(v25, a3);
    sub_24B359B08(v123);
    sub_24B359B08(v71);
LABEL_11:
    sub_24B35D930(v65, &qword_2544D6B88);
    v47 = v110;
    goto LABEL_13;
  }
  v72 = v105;
  sub_24B35D0C4(v66, v105);
  v73 = sub_24B354E00(v71, v72);
  sub_24B359B08(v72);
  sub_24B35D930(v64, &qword_2544D6B78);
  sub_24B35D930(v56, &qword_2544D6B78);
  (*(void (**)(char *, uint64_t))(v127 + 8))(v25, a3);
  sub_24B359B08(v123);
  sub_24B359B08(v71);
  sub_24B35D930(v65, &qword_2544D6B78);
  v47 = v110;
  if ((v73 & 1) != 0)
    return;
LABEL_13:
  v74 = v126;
  sub_24B355E64(a3, v68, v69, v70);
  v75 = v130;
  if (*(_QWORD *)&v74[*(int *)(v130 + 40)])
  {
    swift_retain();
    ((void (*)(char *, uint64_t))v47)(v126, v75);
    sub_24B35DCAC();
    swift_release();
  }
  else
  {
    ((void (*)(char *, uint64_t))v47)(v126, v130);
  }
  v76 = v125;
  v77 = v116;
  v78 = (uint64_t)v129;
  v79 = v131;
  v80 = sub_24B357F00((uint64_t)v129, a3);
  v81 = objc_msgSend(v76, sel_imageForDescriptor_, v80);
  v82 = &v79[*(int *)(a3 + 80)];
  v83 = v122;
  sub_24B35DBBC();
  v84 = *v77;
  v126 = (char *)v76;

  *v77 = v76;
  sub_24B35DBC8();
  v85 = v117;
  sub_24B35CBD0(v78, v117);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v124 + 56))(v85, 0, 1, v128);
  v86 = v118;
  v87 = v119;
  (*(void (**)(char *, char *, uint64_t))(v119 + 16))(v118, v82, v83);
  sub_24B35DBBC();
  sub_24B35CC14(v85, (uint64_t)v77 + *(int *)(v130 + 36));
  sub_24B35DBC8();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v86, v83);
  if (v81)
  {
    v88 = v81;
    if (objc_msgSend(v88, sel_placeholder))
    {
      v89 = sub_24B35DCA0();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v89 - 8) + 56))(v115, 1, 1, v89);
      v90 = v109;
      v91 = a3;
      v107(v109, v131, a3);
      sub_24B35DC88();
      v129 = v126;
      v92 = (char *)v80;
      v131 = v92;
      v93 = sub_24B35DC7C();
      v94 = v127;
      v95 = (*(unsigned __int8 *)(v127 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v127 + 80);
      v96 = (char *)swift_allocObject();
      v97 = MEMORY[0x24BEE6930];
      *((_QWORD *)v96 + 2) = v93;
      *((_QWORD *)v96 + 3) = v97;
      v98 = v121;
      *((_QWORD *)v96 + 4) = v120;
      *((_QWORD *)v96 + 5) = v98;
      *((_QWORD *)v96 + 6) = v129;
      *((_QWORD *)v96 + 7) = v92;
      (*(void (**)(char *, char *, uint64_t))(v94 + 32))(&v96[v95], v90, v91);
      v99 = sub_24B358DCC(v115, (uint64_t)&unk_257972E50, (uint64_t)v96);
      sub_24B35DBBC();
      v100 = *(int *)(v130 + 40);
      swift_release();
      *(void **)((char *)v77 + v100) = (void *)v99;
      sub_24B35DBC8();

      return;
    }
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v131[*(int *)(a3 + 72)]);
    v102 = v121;
    *(&v104 - 4) = v120;
    *(&v104 - 3) = v102;
    *(&v104 - 2) = v103;
    *(&v104 - 1) = (uint64_t)v88;
    sub_24B35DA6C();

  }
  else
  {
    MEMORY[0x24BDAC7A8](*(_QWORD *)&v79[*(int *)(a3 + 72)]);
    v101 = v121;
    *(&v104 - 4) = v120;
    *(&v104 - 3) = v101;
    *(&v104 - 2) = (uint64_t)v79;
    sub_24B35DA6C();
  }

}

uint64_t sub_24B357BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t);
  uint64_t v17;

  v6 = type metadata accessor for AsyncIconImage.LoadingState(0, a2, a3, a4);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v17 - v8;
  v11 = type metadata accessor for AsyncIconImage(0, a2, a3, v10);
  sub_24B355E64(v11, v12, v13, v14);
  if (!*(_QWORD *)&v9[*(int *)(v6 + 40)])
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v15 = *(void (**)(char *, uint64_t))(v7 + 8);
  swift_retain();
  v15(v9, v6);
  sub_24B35DCAC();
  return swift_release();
}

uint64_t sub_24B357CE4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  unint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(unint64_t *);
  unint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  void (*v21)(char *, uint64_t);
  _QWORD v23[3];
  uint64_t v24;
  char *v25;
  unint64_t v26;
  _QWORD v27[2];

  v25 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  v24 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24B35DA60();
  MEMORY[0x24BDAC7A8](v7);
  v8 = *(_QWORD *)(a1 + 24);
  v23[1] = v8;
  v23[2] = (char *)v23 - v9;
  v10 = sub_24B35CB8C();
  v27[0] = v8;
  v27[1] = v10;
  v23[0] = MEMORY[0x24BD1E4D8](MEMORY[0x24BDED308], v7, v27);
  v11 = sub_24B35DAE4();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v23 - v16;
  v19 = *v2;
  v18 = (void (*)(unint64_t *))v2[1];
  v26 = v19;
  sub_24B3599D0(v19);
  v18(&v26);
  sub_24B359A18(v19);
  sub_24B35DB74();
  (*(void (**)(char *, uint64_t))(v24 + 8))(v6, v4);
  sub_24B35DAF0();
  MEMORY[0x24BD1E4D8](MEMORY[0x24BDEE898], v11);
  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v20(v17, v15, v11);
  v21 = *(void (**)(char *, uint64_t))(v12 + 8);
  v21(v15, v11);
  v20(v25, v17, v11);
  return ((uint64_t (*)(char *, uint64_t))v21)(v17, v11);
}

uint64_t sub_24B357EE4()
{
  return sub_24B35DB68();
}

id sub_24B357F00(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  void (*v31)(char *, uint64_t, uint64_t);
  double v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  void *v36;
  double v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  double v51;
  char v52;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v5 = sub_24B35DA54();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_24B35DB08();
  v57 = *(_QWORD *)(v9 - 8);
  v58 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v56 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_24B35DA30();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a2 - 8);
  v16 = MEMORY[0x24BDAC7A8](v12);
  v18 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v54 - v20;
  v22 = *(int *)(a2 + 68);
  v62 = a1;
  v63 = v2;
  v23 = *(void **)(v2 + v22);
  v60 = v6;
  v61 = v5;
  v59 = v8;
  v54 = v24;
  v55 = v19;
  if (v23)
  {
    v25 = v23;
  }
  else
  {
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_init);
    v23 = 0;
  }
  v26 = v23;
  v27 = v63;
  *(double *)&v28 = COERCE_DOUBLE(sub_24B355D28(a2));
  v30 = v29;
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v31(v21, v27, a2);
  if ((v30 & 1) != 0)
  {
    v36 = *(void **)&v21[*(int *)(a2 + 68)];
    if (v36)
    {
      objc_msgSend(v36, sel_scale);
      v32 = v37;
      v31(v18, (uint64_t)v21, a2);
    }
    else
    {
      v31(v18, (uint64_t)v21, a2);
      v32 = sub_24B355B34(a2);
    }
    v35 = v59;
    v34 = v60;
    v38 = *(void (**)(char *, uint64_t))(v15 + 8);
    v38(v18, a2);
    v38(v21, a2);
    v33 = v62;
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v21, a2);
    v32 = *(double *)&v28;
    v33 = v62;
    v35 = v59;
    v34 = v60;
  }
  v40 = v54;
  v39 = v55;
  (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v14, *MEMORY[0x24BDEB400], v55);
  v41 = sub_24B35DA24();
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v39);
  objc_msgSend(v25, sel_setAppearance_, (v41 & 1) == 0);
  v42 = type metadata accessor for IconEnvironmentTraits();
  v44 = v56;
  v43 = v57;
  v45 = v58;
  (*(void (**)(char *, _QWORD, uint64_t))(v57 + 104))(v56, *MEMORY[0x24BDEEDE8], v58);
  LOBYTE(v39) = sub_24B35DA24();
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
  objc_msgSend(v25, sel_setContrast_, (v39 & 1) == 0);
  v46 = v61;
  (*(void (**)(char *, _QWORD, uint64_t))(v34 + 104))(v35, *MEMORY[0x24BDED100], v61);
  LOBYTE(v39) = sub_24B35DA48();
  (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v46);
  if ((v39 & 1) != 0)
    v47 = 1;
  else
    v47 = 2;
  objc_msgSend(v25, sel_setLanguageDirection_, v47, v54, v55);
  objc_msgSend(v25, sel_setScale_, v32);
  v48 = v33 + *(int *)(v42 + 28);
  if ((*(_BYTE *)(v48 + 8) & 1) == 0)
    objc_msgSend(v25, sel_setShape_, *(_QWORD *)v48);
  v49 = *(unsigned __int8 *)(v33 + *(int *)(v42 + 32));
  if (v49 != 2)
    objc_msgSend(v25, sel_setDrawBorder_, v49 & 1);
  v50 = sub_24B355B90(a2);
  if ((v52 & 1) == 0)
    objc_msgSend(v25, sel_setSize_, *(double *)&v50, v51);
  return v25;
}

uint64_t sub_24B3582FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  v8[8] = type metadata accessor for AsyncIconImage.LoadingState(0, a7, a8, a4);
  v8[9] = swift_task_alloc();
  v8[10] = sub_24B35DC88();
  v8[11] = sub_24B35DC7C();
  v8[12] = sub_24B35DC64();
  v8[13] = v9;
  return swift_task_switch();
}

uint64_t sub_24B3583A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  __int128 v4;

  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 112) = sub_24B35DC7C();
  v1 = swift_task_alloc();
  *(_QWORD *)(v0 + 120) = v1;
  *(_OWORD *)(v1 + 16) = v4;
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C28);
  *v2 = v0;
  v2[1] = sub_24B358474;
  return sub_24B35DD18();
}

uint64_t sub_24B358474()
{
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24B3584DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
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
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  swift_release();
  v2 = *(void **)(v0 + 16);
  if (!v2)
  {
    v13 = *(_QWORD *)(v0 + 48);
    v14 = *(_QWORD *)(v0 + 56);
    v15 = *(_QWORD *)(v0 + 40);
    type metadata accessor for AsyncIconImage(0, v13, v14, v1);
    v16 = (_QWORD *)swift_task_alloc();
    v16[2] = v13;
    v16[3] = v14;
    v16[4] = v15;
    sub_24B35DA6C();
LABEL_6:
    swift_task_dealloc();
    goto LABEL_7;
  }
  v3 = v2;
  if ((objc_msgSend(v3, sel_placeholder) & 1) == 0)
  {
    v18 = *(_QWORD *)(v0 + 48);
    v17 = *(_QWORD *)(v0 + 56);
    v19 = *(_QWORD *)(v0 + 40);
    type metadata accessor for AsyncIconImage(0, v18, v17, v4);
    v20 = (_QWORD *)swift_task_alloc();
    v20[2] = v18;
    v20[3] = v17;
    v20[4] = v19;
    v20[5] = v3;
    sub_24B35DA6C();

    goto LABEL_6;
  }
  v6 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 48);
  v7 = *(_QWORD *)(v0 + 56);
  v9 = type metadata accessor for AsyncIconImage.LoadingError(0, v8, v7, v4);
  MEMORY[0x24BD1E4D8](&unk_24B35E990, v9);
  v10 = swift_allocError() | 0x4000000000000000;
  type metadata accessor for AsyncIconImage(0, v8, v7, v11);
  sub_24B35DBD4();
  sub_24B35DBBC();
  v12 = *(int *)(v6 + 44);
  sub_24B359A18(*(_QWORD *)(v5 + v12));
  *(_QWORD *)(v5 + v12) = v10;
  sub_24B35DBC8();

LABEL_7:
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24B3586B4(uint64_t a1, void *a2, void *a3)
{
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
  char *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v28 = a2;
  v29 = a3;
  v26 = a1;
  v30 = sub_24B35DBE0();
  v33 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24B35DC04();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](v8);
  v11 = sub_24B35DBEC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B35D6A4(0, &qword_2544D6C20);
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BEE5480], v11);
  v27 = sub_24B35DCD0();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v8);
  v15 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v16 = swift_allocObject();
  v18 = v28;
  v17 = v29;
  *(_QWORD *)(v16 + 16) = v28;
  *(_QWORD *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v15, (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
  aBlock[4] = sub_24B35D75C;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B358B7C;
  aBlock[3] = &block_descriptor;
  v19 = _Block_copy(aBlock);
  v20 = v18;
  v21 = v17;
  sub_24B35DBF8();
  v34 = MEMORY[0x24BEE4AF8];
  sub_24B354ACC(&qword_2544D6C00, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C08);
  sub_24B35D7A8(&qword_2544D6C10, &qword_2544D6C08, MEMORY[0x24BEE12C8]);
  v22 = v30;
  sub_24B35DCE8();
  v23 = (void *)v27;
  MEMORY[0x24BD1E160](0, v7, v4, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v22);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v7, v32);
  return swift_release();
}

void sub_24B3589AC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a3, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_24B35D84C;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24B358B28;
  aBlock[3] = &block_descriptor_62;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a1, sel_getImageForImageDescriptor_completion_, a2, v11);
  _Block_release(v11);
}

uint64_t sub_24B358AE4(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  return sub_24B35DC70();
}

void sub_24B358B28(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_24B358B7C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24B358BA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = type metadata accessor for AsyncIconImage.LoadingState(0, a2, a3, a4);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - v7;
  v10 = type metadata accessor for AsyncIconImage.LoadingError(0, a2, a3, v9);
  MEMORY[0x24BD1E4D8](&unk_24B35E990, v10);
  v11 = swift_allocError() | 0x4000000000000000;
  type metadata accessor for AsyncIconImage(0, a2, a3, v12);
  sub_24B35DBD4();
  sub_24B35DBBC();
  v13 = *(int *)(v6 + 44);
  sub_24B359A18(*(_QWORD *)&v8[v13]);
  *(_QWORD *)&v8[v13] = v11;
  return sub_24B35DBC8();
}

id sub_24B358CAC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = type metadata accessor for AsyncIconImage.LoadingState(0, a3, a4, a4);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - v8;
  v10 = a2;
  result = objc_msgSend(v10, sel_CGImage);
  if (result)
  {
    objc_msgSend(v10, sel_scale);
    v12 = sub_24B35DB98();

    type metadata accessor for AsyncIconImage(0, a3, a4, v13);
    sub_24B35DBD4();
    sub_24B35DBBC();
    v14 = *(int *)(v7 + 44);
    sub_24B359A18(*(_QWORD *)&v9[v14]);
    *(_QWORD *)&v9[v14] = v12;
    return (id)sub_24B35DBC8();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24B358DCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_24B35DCA0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24B35DC94();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_24B35D930(a1, &qword_2544D6BE0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24B35DC64();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24B358F2C()
{
  return sub_24B35DA78();
}

uint64_t sub_24B358F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B358F9C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDEB418], MEMORY[0x24BDEDEF8]);
}

uint64_t type metadata accessor for AsyncIconImage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncIconImage);
}

uint64_t sub_24B358F7C()
{
  return sub_24B35DA9C();
}

uint64_t sub_24B358F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
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

uint64_t sub_24B359018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B358F9C(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x24BDED130], MEMORY[0x24BDEE080]);
}

uint64_t sub_24B35903C@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v24 = a4;
  v9 = v5;
  v11 = sub_24B35DAC0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24B35D8EC(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_24B35DCB8();
    v21 = sub_24B35DB38();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = swift_slowAlloc();
      v23 = swift_slowAlloc();
      v25 = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v22 + 4) = sub_24B35D1B8(a3, v24, &v25);
      _os_log_impl(&dword_24B352000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD1E520](v23, -1, -1);
      MEMORY[0x24BD1E520](v22, -1, -1);
    }

    sub_24B35DAB4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

double sub_24B359244(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  double v14;

  v4 = sub_24B35DAC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  swift_retain();
  v8 = sub_24B35DCB8();
  v9 = sub_24B35DB38();
  if (os_log_type_enabled(v9, v8))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v14 = *(double *)&v11;
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v10 + 4) = sub_24B35D1B8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v14);
    _os_log_impl(&dword_24B352000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24BD1E520](v11, -1, -1);
    MEMORY[0x24BD1E520](v10, -1, -1);
  }

  sub_24B35DAB4();
  swift_getAtKeyPath();
  sub_24B3599F4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v14;
}

uint64_t sub_24B3593D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_24B35DAC0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a3 & 0x100) == 0)
  {
    swift_retain();
    v10 = sub_24B35DCB8();
    v11 = sub_24B35DB38();
    if (os_log_type_enabled(v11, v10))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      *(_QWORD *)(v12 + 4) = sub_24B35D1B8(0xD000000000000010, 0x800000024B35F8E0, &v16);
      _os_log_impl(&dword_24B352000, v11, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD1E520](v13, -1, -1);
      MEMORY[0x24BD1E520](v12, -1, -1);
    }

    sub_24B35DAB4();
    swift_getAtKeyPath();
    sub_24B359A00(a1, a2, a3, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v16;
  }
  return a1;
}

uint64_t sub_24B359590(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unsigned __int8 v14;

  v4 = sub_24B35DAC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    v8 = sub_24B35DCB8();
    v9 = sub_24B35DB38();
    if (os_log_type_enabled(v9, v8))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v13 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v10 + 4) = sub_24B35D1B8(0x6C616E6F6974704FLL, 0xEE003E6C6F6F423CLL, &v13);
      _os_log_impl(&dword_24B352000, v9, v8, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24BD1E520](v11, -1, -1);
      MEMORY[0x24BD1E520](v10, -1, -1);
    }

    sub_24B35DAB4();
    swift_getAtKeyPath();
    sub_24B3599F4(a1, 0);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return v14;
  }
  return a1;
}

uint64_t sub_24B35972C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void (*a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  os_log_type_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  void (*v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;

  v10 = sub_24B35DAC0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0x100) == 0)
  {
    swift_retain();
    v14 = sub_24B35DCB8();
    v15 = sub_24B35DB38();
    if (os_log_type_enabled(v15, v14))
    {
      v16 = swift_slowAlloc();
      v22 = a4;
      v17 = v16;
      v18 = swift_slowAlloc();
      v23 = a5;
      v24 = v18;
      v19 = v18;
      *(_DWORD *)v17 = 136315138;
      *(_QWORD *)(v17 + 4) = sub_24B35D1B8(a3, v22, &v24);
      _os_log_impl(&dword_24B352000, v15, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v17, 0xCu);
      swift_arrayDestroy();
      v20 = v19;
      a5 = v23;
      MEMORY[0x24BD1E520](v20, -1, -1);
      MEMORY[0x24BD1E520](v17, -1, -1);
    }

    sub_24B35DAB4();
    swift_getAtKeyPath();
    a5(a1, a2, 0);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v24;
  }
  return a1;
}

uint64_t sub_24B3598DC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24B35DA84();
  *a1 = v3;
  return result;
}

uint64_t sub_24B359904()
{
  return sub_24B35DA90();
}

uint64_t sub_24B359928()
{
  return sub_24B35DAA8();
}

uint64_t sub_24B359968()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B359994@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_24B3567B0(a1, *(void (**)(uint64_t))(v2 + 48), *(_QWORD *)(v2 + 56), *(void (**)(uint64_t))(v2 + 64), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), a2, *(_QWORD *)(v2 + 40));
}

uint64_t type metadata accessor for AsyncIconImage.Inner(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncIconImage.Inner);
}

unint64_t sub_24B3599D0(unint64_t result)
{
  if (result >> 62 == 1)
    return (unint64_t)(id)(result & 0x3FFFFFFFFFFFFFFFLL);
  if (!(result >> 62))
    return swift_retain();
  return result;
}

uint64_t sub_24B3599F4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_24B359A00(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_24B359A0C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_release();
  return result;
}

void sub_24B359A18(unint64_t a1)
{
  if (a1 >> 62 == 1)
  {

  }
  else if (!(a1 >> 62))
  {
    swift_release();
  }
}

uint64_t sub_24B359A38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B359A54(sub_24B357168, a2, a3, a4);
}

uint64_t sub_24B359A48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B359A54((uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_24B357BF8, a2, a3, a4);
}

uint64_t sub_24B359A54(uint64_t (*a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AsyncIconImage(0, v5, v6, a4) - 8) + 80);
  return a1(v4 + ((v7 + 32) & ~v7), v5, v6);
}

void sub_24B359AB8(char *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for AsyncIconImage(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  sub_24B357208(*(void **)(v4 + ((v7 + 32) & ~v7) + *(int *)(v6 + 64)), a1, v6);
}

uint64_t sub_24B359B08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24B359B44(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_24B359B54()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t *initializeBufferWithCopyOfBuffer for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a2;
  sub_24B3599D0(*a2);
  *a1 = v3;
  return a1;
}

void destroy for AsyncIconImagePhase(unint64_t *a1)
{
  sub_24B359A18(*a1);
}

unint64_t *assignWithCopy for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *a2;
  sub_24B3599D0(*a2);
  v4 = *a1;
  *a1 = v3;
  sub_24B359A18(v4);
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

unint64_t *assignWithTake for AsyncIconImagePhase(unint64_t *a1, unint64_t *a2)
{
  unint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  sub_24B359A18(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for AsyncIconImagePhase(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for AsyncIconImagePhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_24B359CE0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_24B359CFC(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_24B359D0C(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for AsyncIconImagePhase()
{
  return &type metadata for AsyncIconImagePhase;
}

uint64_t sub_24B359D48()
{
  return swift_allocateGenericValueMetadata();
}

void sub_24B359D50(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  sub_24B35CB00(319, &qword_2544D6BA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], MEMORY[0x24BDEB560]);
  if (v2 <= 0x3F)
  {
    sub_24B35CB00(319, &qword_2544D6BB8, (uint64_t (*)(uint64_t))MEMORY[0x24BDED130], MEMORY[0x24BDEB560]);
    if (v3 <= 0x3F)
    {
      sub_24B35CB00(319, &qword_2544D6BC8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEEE00], MEMORY[0x24BDEB560]);
      if (v5 <= 0x3F)
      {
        type metadata accessor for AsyncIconImage.LoadingState(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), v4);
        sub_24B35DBD4();
        if (v6 <= 0x3F)
          swift_initStructMetadata();
      }
    }
  }
}

_QWORD *sub_24B359EAC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  int *v58;
  unsigned int (*v59)(char *, uint64_t, int *);
  id v60;
  id v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v83;
  _QWORD *v84;
  char *__dst;
  uint64_t v86;
  char *v87;
  char *v88;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24B35DA30();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 36);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24B35DA54();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v13 = *(int *)(a3 + 40);
    v14 = (char *)a1 + v13;
    v15 = (char *)a2 + v13;
    v16 = *(_QWORD *)v15;
    v17 = v15[8];
    sub_24B35A36C(*(_QWORD *)v15, v17);
    *(_QWORD *)v14 = v16;
    v14[8] = v17;
    v18 = *(int *)(a3 + 44);
    v19 = (_QWORD *)((char *)a1 + v18);
    v20 = (_QWORD *)((char *)a2 + v18);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_24B35DB08();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v22 = *(int *)(a3 + 48);
    v23 = (char *)a1 + v22;
    v24 = (char *)a2 + v22;
    v25 = *(_QWORD *)v24;
    v26 = *((_QWORD *)v24 + 1);
    v27 = v24[17];
    v28 = v24[16];
    sub_24B35A378(*(_QWORD *)v24, v26, v28, v27);
    *(_QWORD *)v23 = v25;
    *((_QWORD *)v23 + 1) = v26;
    v23[16] = v28;
    v23[17] = v27;
    v29 = *(int *)(a3 + 52);
    v30 = (char *)a1 + v29;
    v31 = (char *)a2 + v29;
    v32 = *(_QWORD *)v31;
    LOBYTE(v26) = v31[8];
    sub_24B35A36C(*(_QWORD *)v31, v26);
    *(_QWORD *)v30 = v32;
    v30[8] = v26;
    v33 = *(int *)(a3 + 56);
    v34 = (char *)a1 + v33;
    v35 = (char *)a2 + v33;
    v36 = *(_QWORD *)v35;
    LOBYTE(v26) = v35[9];
    LOBYTE(v30) = v35[8];
    sub_24B35A384(*(_QWORD *)v35, v30, v26);
    *(_QWORD *)v34 = v36;
    v34[8] = (char)v30;
    v34[9] = v26;
    v37 = *(int *)(a3 + 60);
    v38 = (char *)a1 + v37;
    v39 = (char *)a2 + v37;
    v40 = *(_QWORD *)v39;
    LOBYTE(v26) = v39[9];
    LOBYTE(v30) = v39[8];
    sub_24B35A384(*(_QWORD *)v39, v30, v26);
    *(_QWORD *)v38 = v40;
    v38[8] = (char)v30;
    v38[9] = v26;
    v41 = *(int *)(a3 + 64);
    v42 = *(int *)(a3 + 68);
    v43 = a2;
    v44 = *(void **)((char *)a2 + v41);
    *(_QWORD *)((char *)a1 + v41) = v44;
    v45 = *(void **)((char *)v43 + v42);
    *(_QWORD *)((char *)a1 + v42) = v45;
    v46 = *(int *)(a3 + 76);
    *(_QWORD *)((char *)a1 + *(int *)(a3 + 72)) = *(_QWORD *)((char *)v43 + *(int *)(a3 + 72));
    v47 = (_QWORD *)((char *)a1 + v46);
    v48 = (_QWORD *)((char *)v43 + v46);
    v49 = v48[1];
    *v47 = *v48;
    v47[1] = v49;
    v50 = *(int *)(a3 + 80);
    v51 = (char *)a1 + v50;
    v84 = v43;
    v52 = (char *)v43 + v50;
    v53 = *(void **)((char *)v43 + v50);
    *(_QWORD *)((char *)a1 + v50) = v53;
    v55 = type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v54);
    v56 = *(int *)(v55 + 36);
    v87 = v52;
    v88 = v51;
    __dst = &v51[v56];
    v86 = v55;
    v57 = &v52[v56];
    v58 = (int *)type metadata accessor for IconEnvironmentTraits();
    v83 = *((_QWORD *)v58 - 1);
    v59 = *(unsigned int (**)(char *, uint64_t, int *))(v83 + 48);
    v60 = v44;
    v61 = v45;
    swift_retain();
    swift_retain();
    v62 = v53;
    if (v59(v57, 1, v58))
    {
      v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
      memcpy(__dst, v57, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
    }
    else
    {
      v64 = sub_24B35DA30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v64 - 8) + 16))(__dst, v57, v64);
      v65 = v58[5];
      v66 = &__dst[v65];
      v67 = &v57[v65];
      v68 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v68 - 8) + 16))(v66, v67, v68);
      v69 = v58[6];
      v70 = &__dst[v69];
      v71 = &v57[v69];
      v72 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v72 - 8) + 16))(v70, v71, v72);
      v73 = v58[7];
      v74 = &__dst[v73];
      v75 = &v57[v73];
      *(_QWORD *)v74 = *(_QWORD *)v75;
      v74[8] = v75[8];
      __dst[v58[8]] = v57[v58[8]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v83 + 56))(__dst, 0, 1, v58);
    }
    *(_QWORD *)&v88[*(int *)(v86 + 40)] = *(_QWORD *)&v87[*(int *)(v86 + 40)];
    v76 = *(int *)(v86 + 44);
    v77 = *(_QWORD *)&v87[v76];
    swift_retain();
    sub_24B3599D0(v77);
    *(_QWORD *)&v88[v76] = v77;
    v78 = sub_24B35DBD4();
    *(_QWORD *)&v88[*(int *)(v78 + 28)] = *(_QWORD *)&v87[*(int *)(v78 + 28)];
    v79 = *(int *)(a3 + 84);
    v80 = *(void **)((char *)v84 + v79);
    *(_QWORD *)((char *)a1 + v79) = v80;
    swift_retain();
    v81 = v80;
  }
  return a1;
}

uint64_t sub_24B35A36C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_24B35A378(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_24B35A384(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_retain();
  return result;
}

void sub_24B35A390(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_24B35DA30();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24B35DA54();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  else
  {
    swift_release();
  }
  sub_24B3599F4(*(_QWORD *)(a1 + *(int *)(a2 + 40)), *(_BYTE *)(a1 + *(int *)(a2 + 40) + 8));
  v7 = a1 + *(int *)(a2 + 44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_24B35DB08();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  else
  {
    swift_release();
  }
  sub_24B359A00(*(_QWORD *)(a1 + *(int *)(a2 + 48)), *(_QWORD *)(a1 + *(int *)(a2 + 48) + 8), *(unsigned __int8 *)(a1 + *(int *)(a2 + 48) + 16), *(_BYTE *)(a1 + *(int *)(a2 + 48) + 17));
  sub_24B3599F4(*(_QWORD *)(a1 + *(int *)(a2 + 52)), *(_BYTE *)(a1 + *(int *)(a2 + 52) + 8));
  sub_24B359A0C(*(_QWORD *)(a1 + *(int *)(a2 + 56)), *(unsigned __int8 *)(a1 + *(int *)(a2 + 56) + 8), *(_BYTE *)(a1 + *(int *)(a2 + 56) + 9));
  sub_24B359A0C(*(_QWORD *)(a1 + *(int *)(a2 + 60)), *(unsigned __int8 *)(a1 + *(int *)(a2 + 60) + 8), *(_BYTE *)(a1 + *(int *)(a2 + 60) + 9));

  swift_release();
  swift_release();
  v9 = (id *)(a1 + *(int *)(a2 + 80));

  v11 = type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), v10);
  v12 = (char *)v9 + *(int *)(v11 + 36);
  v13 = type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13))
  {
    v14 = sub_24B35DA30();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v12, v14);
    v15 = &v12[*(int *)(v13 + 20)];
    v16 = sub_24B35DB08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
    v17 = &v12[*(int *)(v13 + 24)];
    v18 = sub_24B35DA54();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v17, v18);
  }
  swift_release();
  sub_24B359A18(*(unint64_t *)((char *)v9 + *(int *)(v11 + 44)));
  sub_24B35DBD4();
  swift_release();

}

_QWORD *sub_24B35A640(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  unsigned __int8 v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  char *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  int *v56;
  unsigned int (*v57)(char *, uint64_t, int *);
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  uint64_t v81;
  _QWORD *v82;
  char *__dst;
  uint64_t v84;
  char *v85;
  char *v86;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_24B35DA30();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 36);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_24B35DA54();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  else
  {
    *v8 = *v9;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v11 = *(int *)(a3 + 40);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)v13;
  v15 = v13[8];
  sub_24B35A36C(*(_QWORD *)v13, v15);
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  v16 = *(int *)(a3 + 44);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v19 = sub_24B35DB08();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  }
  else
  {
    *v17 = *v18;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v20 = *(int *)(a3 + 48);
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  v23 = *(_QWORD *)v22;
  v24 = *((_QWORD *)v22 + 1);
  v25 = v22[17];
  v26 = v22[16];
  sub_24B35A378(*(_QWORD *)v22, v24, v26, v25);
  *(_QWORD *)v21 = v23;
  *((_QWORD *)v21 + 1) = v24;
  v21[16] = v26;
  v21[17] = v25;
  v27 = *(int *)(a3 + 52);
  v28 = (char *)a1 + v27;
  v29 = (char *)a2 + v27;
  v30 = *(_QWORD *)v29;
  LOBYTE(v24) = v29[8];
  sub_24B35A36C(*(_QWORD *)v29, v24);
  *(_QWORD *)v28 = v30;
  v28[8] = v24;
  v31 = *(int *)(a3 + 56);
  v32 = (char *)a1 + v31;
  v33 = (char *)a2 + v31;
  v34 = *(_QWORD *)v33;
  LOBYTE(v24) = v33[9];
  LOBYTE(v28) = v33[8];
  sub_24B35A384(*(_QWORD *)v33, v28, v24);
  *(_QWORD *)v32 = v34;
  v32[8] = (char)v28;
  v32[9] = v24;
  v35 = *(int *)(a3 + 60);
  v36 = (char *)a1 + v35;
  v37 = (char *)a2 + v35;
  v38 = *(_QWORD *)v37;
  LOBYTE(v24) = v37[9];
  LOBYTE(v28) = v37[8];
  sub_24B35A384(*(_QWORD *)v37, v28, v24);
  *(_QWORD *)v36 = v38;
  v36[8] = (char)v28;
  v36[9] = v24;
  v39 = *(int *)(a3 + 64);
  v40 = *(int *)(a3 + 68);
  v41 = a2;
  v42 = *(void **)((char *)a2 + v39);
  *(_QWORD *)((char *)a1 + v39) = v42;
  v43 = *(void **)((char *)v41 + v40);
  *(_QWORD *)((char *)a1 + v40) = v43;
  v44 = *(int *)(a3 + 76);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 72)) = *(_QWORD *)((char *)v41 + *(int *)(a3 + 72));
  v45 = (_QWORD *)((char *)a1 + v44);
  v46 = (_QWORD *)((char *)v41 + v44);
  v47 = v46[1];
  *v45 = *v46;
  v45[1] = v47;
  v48 = *(int *)(a3 + 80);
  v49 = (char *)a1 + v48;
  v82 = v41;
  v50 = (char *)v41 + v48;
  v51 = *(void **)((char *)v41 + v48);
  *(_QWORD *)((char *)a1 + v48) = v51;
  v53 = type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v52);
  v54 = *(int *)(v53 + 36);
  v85 = v50;
  v86 = v49;
  __dst = &v49[v54];
  v84 = v53;
  v55 = &v50[v54];
  v56 = (int *)type metadata accessor for IconEnvironmentTraits();
  v81 = *((_QWORD *)v56 - 1);
  v57 = *(unsigned int (**)(char *, uint64_t, int *))(v81 + 48);
  v58 = v42;
  v59 = v43;
  swift_retain();
  swift_retain();
  v60 = v51;
  if (v57(v55, 1, v56))
  {
    v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(__dst, v55, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
  }
  else
  {
    v62 = sub_24B35DA30();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v62 - 8) + 16))(__dst, v55, v62);
    v63 = v56[5];
    v64 = &__dst[v63];
    v65 = &v55[v63];
    v66 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v66 - 8) + 16))(v64, v65, v66);
    v67 = v56[6];
    v68 = &__dst[v67];
    v69 = &v55[v67];
    v70 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v70 - 8) + 16))(v68, v69, v70);
    v71 = v56[7];
    v72 = &__dst[v71];
    v73 = &v55[v71];
    *(_QWORD *)v72 = *(_QWORD *)v73;
    v72[8] = v73[8];
    __dst[v56[8]] = v55[v56[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v81 + 56))(__dst, 0, 1, v56);
  }
  *(_QWORD *)&v86[*(int *)(v84 + 40)] = *(_QWORD *)&v85[*(int *)(v84 + 40)];
  v74 = *(int *)(v84 + 44);
  v75 = *(_QWORD *)&v85[v74];
  swift_retain();
  sub_24B3599D0(v75);
  *(_QWORD *)&v86[v74] = v75;
  v76 = sub_24B35DBD4();
  *(_QWORD *)&v86[*(int *)(v76 + 28)] = *(_QWORD *)&v85[*(int *)(v76 + 28)];
  v77 = *(int *)(a3 + 84);
  v78 = *(void **)((char *)v82 + v77);
  *(_QWORD *)((char *)a1 + v77) = v78;
  swift_retain();
  v79 = v78;
  return a1;
}

_QWORD *sub_24B35AAD4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  unsigned __int8 v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  _QWORD *v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  char *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  int *v75;
  uint64_t (*v76)(char *, uint64_t, int *);
  int v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  int *v115;

  if (a1 != a2)
  {
    sub_24B35D930((uint64_t)a1, &qword_2544D6BA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_24B35DA30();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v7 = *(int *)(a3 + 36);
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_24B35D930((uint64_t)a1 + v7, &qword_2544D6BB0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_24B35DA54();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    }
    else
    {
      *v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v11 = *(int *)(a3 + 40);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = *(_QWORD *)v13;
  v15 = v13[8];
  sub_24B35A36C(*(_QWORD *)v13, v15);
  v16 = *(_QWORD *)v12;
  v17 = v12[8];
  *(_QWORD *)v12 = v14;
  v12[8] = v15;
  sub_24B3599F4(v16, v17);
  if (a1 != a2)
  {
    v18 = *(int *)(a3 + 44);
    v19 = (_QWORD *)((char *)a1 + v18);
    v20 = (_QWORD *)((char *)a2 + v18);
    sub_24B35D930((uint64_t)a1 + v18, &qword_2544D6BC0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v21 = sub_24B35DB08();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    }
    else
    {
      *v19 = *v20;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v22 = *(int *)(a3 + 48);
  v23 = (char *)a1 + v22;
  v24 = (char *)a2 + v22;
  v25 = *(_QWORD *)v24;
  v26 = *((_QWORD *)v24 + 1);
  v27 = v24[17];
  v28 = v24[16];
  sub_24B35A378(*(_QWORD *)v24, v26, v28, v27);
  v29 = *(_QWORD *)v23;
  v30 = *((_QWORD *)v23 + 1);
  v31 = v23[17];
  *(_QWORD *)v23 = v25;
  *((_QWORD *)v23 + 1) = v26;
  v32 = v23[16];
  v23[16] = v28;
  v23[17] = v27;
  sub_24B359A00(v29, v30, v32, v31);
  v33 = *(int *)(a3 + 52);
  v34 = (char *)a1 + v33;
  v35 = (char *)a2 + v33;
  v36 = *(_QWORD *)v35;
  LOBYTE(v26) = v35[8];
  sub_24B35A36C(*(_QWORD *)v35, v26);
  v37 = *(_QWORD *)v34;
  v38 = v34[8];
  *(_QWORD *)v34 = v36;
  v34[8] = v26;
  sub_24B3599F4(v37, v38);
  v39 = *(int *)(a3 + 56);
  v40 = (char *)a1 + v39;
  v41 = (char *)a2 + v39;
  v42 = *(_QWORD *)v41;
  LOBYTE(v26) = v41[9];
  LOBYTE(v34) = v41[8];
  sub_24B35A384(*(_QWORD *)v41, v34, v26);
  v43 = *(_QWORD *)v40;
  v44 = v40[9];
  *(_QWORD *)v40 = v42;
  v45 = v40[8];
  v40[8] = (char)v34;
  v40[9] = v26;
  sub_24B359A0C(v43, v45, v44);
  v46 = *(int *)(a3 + 60);
  v47 = (char *)a1 + v46;
  v48 = (char *)a2 + v46;
  v49 = *(_QWORD *)v48;
  LOBYTE(v26) = v48[9];
  LOBYTE(v34) = v48[8];
  sub_24B35A384(*(_QWORD *)v48, v34, v26);
  v50 = *(_QWORD *)v47;
  v51 = v47[9];
  *(_QWORD *)v47 = v49;
  v52 = v47[8];
  v47[8] = (char)v34;
  v47[9] = v26;
  sub_24B359A0C(v50, v52, v51);
  v53 = *(int *)(a3 + 64);
  v54 = *(void **)((char *)a2 + v53);
  v55 = *(void **)((char *)a1 + v53);
  *(_QWORD *)((char *)a1 + v53) = v54;
  v56 = v54;

  v57 = *(int *)(a3 + 68);
  v58 = *(void **)((char *)a1 + v57);
  v59 = *(void **)((char *)a2 + v57);
  *(_QWORD *)((char *)a1 + v57) = v59;
  v60 = v59;

  *(_QWORD *)((char *)a1 + *(int *)(a3 + 72)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 72));
  swift_retain();
  swift_release();
  v61 = *(int *)(a3 + 76);
  v62 = (_QWORD *)((char *)a1 + v61);
  v63 = (_QWORD *)((char *)a2 + v61);
  v64 = v63[1];
  *v62 = *v63;
  v62[1] = v64;
  swift_retain();
  swift_release();
  v65 = *(int *)(a3 + 80);
  v66 = (_QWORD *)((char *)a1 + v65);
  v67 = (char *)a2 + v65;
  v68 = *(void **)((char *)a1 + v65);
  v69 = *(void **)((char *)a2 + v65);
  *v66 = v69;
  v70 = v69;

  v115 = (int *)type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v71);
  v72 = v115[9];
  v73 = (char *)v66 + v72;
  v74 = &v67[v72];
  v75 = (int *)type metadata accessor for IconEnvironmentTraits();
  v114 = *((_QWORD *)v75 - 1);
  v76 = *(uint64_t (**)(char *, uint64_t, int *))(v114 + 48);
  LODWORD(v23) = v76(v73, 1, v75);
  v77 = v76(v74, 1, v75);
  if (!(_DWORD)v23)
  {
    if (!v77)
    {
      v101 = sub_24B35DA30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v101 - 8) + 24))(v73, v74, v101);
      v102 = v75[5];
      v103 = &v73[v102];
      v104 = &v74[v102];
      v105 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v105 - 8) + 24))(v103, v104, v105);
      v106 = v75[6];
      v107 = &v73[v106];
      v108 = &v74[v106];
      v109 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v109 - 8) + 24))(v107, v108, v109);
      v110 = v75[7];
      v111 = &v73[v110];
      v112 = &v74[v110];
      v113 = *(_QWORD *)v112;
      v111[8] = v112[8];
      *(_QWORD *)v111 = v113;
      v73[v75[8]] = v74[v75[8]];
      goto LABEL_20;
    }
    sub_24B359B08((uint64_t)v73);
    goto LABEL_19;
  }
  if (v77)
  {
LABEL_19:
    v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v73, v74, *(_QWORD *)(*(_QWORD *)(v91 - 8) + 64));
    goto LABEL_20;
  }
  v78 = sub_24B35DA30();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v78 - 8) + 16))(v73, v74, v78);
  v79 = v75[5];
  v80 = &v73[v79];
  v81 = &v74[v79];
  v82 = sub_24B35DB08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v82 - 8) + 16))(v80, v81, v82);
  v83 = v75[6];
  v84 = &v73[v83];
  v85 = &v74[v83];
  v86 = sub_24B35DA54();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v86 - 8) + 16))(v84, v85, v86);
  v87 = v75[7];
  v88 = &v73[v87];
  v89 = &v74[v87];
  v90 = *(_QWORD *)v89;
  v88[8] = v89[8];
  *(_QWORD *)v88 = v90;
  v73[v75[8]] = v74[v75[8]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v114 + 56))(v73, 0, 1, v75);
LABEL_20:
  *(_QWORD *)((char *)v66 + v115[10]) = *(_QWORD *)&v67[v115[10]];
  swift_retain();
  swift_release();
  v92 = v115[11];
  v93 = *(_QWORD *)&v67[v92];
  sub_24B3599D0(v93);
  v94 = *(_QWORD *)((char *)v66 + v92);
  *(_QWORD *)((char *)v66 + v92) = v93;
  sub_24B359A18(v94);
  v95 = sub_24B35DBD4();
  *(_QWORD *)((char *)v66 + *(int *)(v95 + 28)) = *(_QWORD *)&v67[*(int *)(v95 + 28)];
  swift_retain();
  swift_release();
  v96 = *(int *)(a3 + 84);
  v97 = *(void **)((char *)a1 + v96);
  v98 = *(void **)((char *)a2 + v96);
  *(_QWORD *)((char *)a1 + v96) = v98;
  v99 = v98;

  return a1;
}

char *sub_24B35B0F8(char *a1, char *a2, uint64_t a3)
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
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  int *v39;
  uint64_t v40;
  char *v41;
  char *v42;
  int *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v56;
  char *v57;
  char *v58;
  char *v59;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_24B35DA30();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 36);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 40);
  v14 = *(int *)(a3 + 44);
  v15 = &a1[v13];
  v16 = &a2[v13];
  *(_QWORD *)v15 = *(_QWORD *)v16;
  v15[8] = v16[8];
  v17 = &a1[v14];
  v18 = &a2[v14];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v20 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v17, v18, v20);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  v22 = *(int *)(a3 + 48);
  v23 = *(int *)(a3 + 52);
  v24 = &a1[v22];
  v25 = &a2[v22];
  *(_OWORD *)v24 = *(_OWORD *)v25;
  *((_WORD *)v24 + 8) = *((_WORD *)v25 + 8);
  v26 = &a1[v23];
  v27 = &a2[v23];
  *(_QWORD *)v26 = *(_QWORD *)v27;
  v26[8] = v27[8];
  v28 = *(int *)(a3 + 56);
  v29 = *(int *)(a3 + 60);
  v30 = &a1[v28];
  v31 = &a2[v28];
  *(_QWORD *)v30 = *(_QWORD *)v31;
  *((_WORD *)v30 + 4) = *((_WORD *)v31 + 4);
  v32 = &a1[v29];
  v33 = &a2[v29];
  *(_QWORD *)v32 = *(_QWORD *)v33;
  *((_WORD *)v32 + 4) = *((_WORD *)v33 + 4);
  v34 = *(int *)(a3 + 68);
  *(_QWORD *)&a1[*(int *)(a3 + 64)] = *(_QWORD *)&a2[*(int *)(a3 + 64)];
  *(_QWORD *)&a1[v34] = *(_QWORD *)&a2[v34];
  v35 = *(int *)(a3 + 76);
  *(_QWORD *)&a1[*(int *)(a3 + 72)] = *(_QWORD *)&a2[*(int *)(a3 + 72)];
  *(_OWORD *)&a1[v35] = *(_OWORD *)&a2[v35];
  v36 = *(int *)(a3 + 80);
  v37 = &a1[v36];
  v38 = &a2[v36];
  *(_QWORD *)&a1[v36] = *(_QWORD *)&a2[v36];
  v39 = (int *)type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v21);
  v40 = v39[9];
  v41 = &v37[v40];
  v42 = &v38[v40];
  v43 = (int *)type metadata accessor for IconEnvironmentTraits();
  v44 = *((_QWORD *)v43 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v44 + 48))(v42, 1, v43))
  {
    v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
  }
  else
  {
    v46 = sub_24B35DA30();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v46 - 8) + 32))(v41, v42, v46);
    v47 = v43[5];
    v56 = &v42[v47];
    v58 = &v41[v47];
    v48 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v58, v56, v48);
    v49 = v43[6];
    v57 = &v42[v49];
    v59 = &v41[v49];
    v50 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 32))(v59, v57, v50);
    v51 = v43[7];
    v52 = &v41[v51];
    v53 = &v42[v51];
    *(_QWORD *)v52 = *(_QWORD *)v53;
    v52[8] = v53[8];
    v41[v43[8]] = v42[v43[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v44 + 56))(v41, 0, 1, v43);
  }
  *(_QWORD *)&v37[v39[10]] = *(_QWORD *)&v38[v39[10]];
  *(_QWORD *)&v37[v39[11]] = *(_QWORD *)&v38[v39[11]];
  v54 = sub_24B35DBD4();
  *(_QWORD *)&v37[*(int *)(v54 + 28)] = *(_QWORD *)&v38[*(int *)(v54 + 28)];
  *(_QWORD *)&a1[*(int *)(a3 + 84)] = *(_QWORD *)&a2[*(int *)(a3 + 84)];
  return a1;
}

char *sub_24B35B4BC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  int *v67;
  uint64_t (*v68)(char *, uint64_t, int *);
  int v69;
  int v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  int *v103;

  if (a1 != a2)
  {
    sub_24B35D930((uint64_t)a1, &qword_2544D6BA0);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_24B35DA30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 36);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_24B35D930((uint64_t)&a1[v8], &qword_2544D6BB0);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v13 = *(int *)(a3 + 40);
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = *(_QWORD *)v15;
  LOBYTE(v15) = v15[8];
  v17 = *(_QWORD *)v14;
  v18 = v14[8];
  *(_QWORD *)v14 = v16;
  v14[8] = (char)v15;
  sub_24B3599F4(v17, v18);
  if (a1 != a2)
  {
    v19 = *(int *)(a3 + 44);
    v20 = &a1[v19];
    v21 = &a2[v19];
    sub_24B35D930((uint64_t)&a1[v19], &qword_2544D6BC0);
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v23 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
  }
  v24 = *(int *)(a3 + 48);
  v25 = &a1[v24];
  v26 = &a2[v24];
  v27 = v26[16];
  v28 = v26[17];
  v29 = *(_QWORD *)v25;
  v30 = *((_QWORD *)v25 + 1);
  v31 = v25[17];
  *(_OWORD *)v25 = *(_OWORD *)v26;
  v32 = v25[16];
  v25[16] = v27;
  v25[17] = v28;
  sub_24B359A00(v29, v30, v32, v31);
  v33 = *(int *)(a3 + 52);
  v34 = &a1[v33];
  v35 = &a2[v33];
  v36 = *(_QWORD *)v35;
  LOBYTE(v35) = v35[8];
  v37 = *(_QWORD *)v34;
  v38 = v34[8];
  *(_QWORD *)v34 = v36;
  v34[8] = (char)v35;
  sub_24B3599F4(v37, v38);
  v39 = *(int *)(a3 + 56);
  v40 = &a1[v39];
  v41 = &a2[v39];
  v42 = *(_QWORD *)v41;
  v43 = v41[8];
  LOBYTE(v41) = v41[9];
  v44 = *(_QWORD *)v40;
  v45 = v40[9];
  *(_QWORD *)v40 = v42;
  v46 = v40[8];
  v40[8] = v43;
  v40[9] = (char)v41;
  sub_24B359A0C(v44, v46, v45);
  v47 = *(int *)(a3 + 60);
  v48 = &a1[v47];
  v49 = &a2[v47];
  v50 = *(_QWORD *)v49;
  v51 = v49[8];
  LOBYTE(v49) = v49[9];
  v52 = *(_QWORD *)v48;
  v53 = v48[9];
  *(_QWORD *)v48 = v50;
  v54 = v48[8];
  v48[8] = v51;
  v48[9] = (char)v49;
  sub_24B359A0C(v52, v54, v53);
  v55 = *(int *)(a3 + 64);
  v56 = *(void **)&a1[v55];
  *(_QWORD *)&a1[v55] = *(_QWORD *)&a2[v55];

  v57 = *(int *)(a3 + 68);
  v58 = *(void **)&a1[v57];
  *(_QWORD *)&a1[v57] = *(_QWORD *)&a2[v57];

  *(_QWORD *)&a1[*(int *)(a3 + 72)] = *(_QWORD *)&a2[*(int *)(a3 + 72)];
  swift_release();
  *(_OWORD *)&a1[*(int *)(a3 + 76)] = *(_OWORD *)&a2[*(int *)(a3 + 76)];
  swift_release();
  v59 = *(int *)(a3 + 80);
  v60 = &a1[v59];
  v61 = &a2[v59];
  v62 = *(void **)&a1[v59];
  *(_QWORD *)v60 = *(_QWORD *)v61;

  v103 = (int *)type metadata accessor for AsyncIconImage.LoadingState(0, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v63);
  v64 = v103[9];
  v65 = &v60[v64];
  v66 = &v61[v64];
  v67 = (int *)type metadata accessor for IconEnvironmentTraits();
  v102 = *((_QWORD *)v67 - 1);
  v68 = *(uint64_t (**)(char *, uint64_t, int *))(v102 + 48);
  v69 = v68(v65, 1, v67);
  v70 = v68(v66, 1, v67);
  if (!v69)
  {
    if (!v70)
    {
      v90 = sub_24B35DA30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v90 - 8) + 40))(v65, v66, v90);
      v91 = v67[5];
      v92 = &v65[v91];
      v93 = &v66[v91];
      v94 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 40))(v92, v93, v94);
      v95 = v67[6];
      v96 = &v65[v95];
      v97 = &v66[v95];
      v98 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v98 - 8) + 40))(v96, v97, v98);
      v99 = v67[7];
      v100 = &v65[v99];
      v101 = &v66[v99];
      *(_QWORD *)v100 = *(_QWORD *)v101;
      v100[8] = v101[8];
      v65[v67[8]] = v66[v67[8]];
      goto LABEL_18;
    }
    sub_24B359B08((uint64_t)v65);
    goto LABEL_17;
  }
  if (v70)
  {
LABEL_17:
    v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v65, v66, *(_QWORD *)(*(_QWORD *)(v83 - 8) + 64));
    goto LABEL_18;
  }
  v71 = sub_24B35DA30();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(v65, v66, v71);
  v72 = v67[5];
  v73 = &v65[v72];
  v74 = &v66[v72];
  v75 = sub_24B35DB08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v75 - 8) + 32))(v73, v74, v75);
  v76 = v67[6];
  v77 = &v65[v76];
  v78 = &v66[v76];
  v79 = sub_24B35DA54();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v79 - 8) + 32))(v77, v78, v79);
  v80 = v67[7];
  v81 = &v65[v80];
  v82 = &v66[v80];
  *(_QWORD *)v81 = *(_QWORD *)v82;
  v81[8] = v82[8];
  v65[v67[8]] = v66[v67[8]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v102 + 56))(v65, 0, 1, v67);
LABEL_18:
  *(_QWORD *)&v60[v103[10]] = *(_QWORD *)&v61[v103[10]];
  swift_release();
  v84 = v103[11];
  v85 = *(_QWORD *)&v60[v84];
  *(_QWORD *)&v60[v84] = *(_QWORD *)&v61[v84];
  sub_24B359A18(v85);
  v86 = sub_24B35DBD4();
  *(_QWORD *)&v60[*(int *)(v86 + 28)] = *(_QWORD *)&v61[*(int *)(v86 + 28)];
  swift_release();
  v87 = *(int *)(a3 + 84);
  v88 = *(void **)&a1[v87];
  *(_QWORD *)&a1[v87] = *(_QWORD *)&a2[v87];

  return a1;
}

uint64_t sub_24B35BA54()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B35BA60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E30);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E38);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = *(int *)(a3 + 36);
LABEL_12:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E40);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = *(int *)(a3 + 44);
    goto LABEL_12;
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    type metadata accessor for AsyncIconImage.LoadingState(255, *(_QWORD *)(a3 + 16), *(_QWORD *)(a3 + 24), v15);
    v8 = sub_24B35DBD4();
    v12 = *(_QWORD *)(v8 - 8);
    v13 = *(int *)(a3 + 80);
    goto LABEL_12;
  }
  v16 = *(_QWORD *)(a1 + *(int *)(a3 + 64));
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_24B35BB6C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B35BB78(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E30);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E38);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 36);
    }
    else
    {
      result = __swift_instantiateConcreteTypeFromMangledName(&qword_257972E40);
      v14 = *(_QWORD *)(result - 8);
      if (*(_DWORD *)(v14 + 84) == a3)
      {
        v10 = result;
        v15 = *(int *)(a4 + 44);
      }
      else
      {
        if (a3 == 0x7FFFFFFF)
        {
          *(_QWORD *)(a1 + *(int *)(a4 + 64)) = (a2 - 1);
          return result;
        }
        type metadata accessor for AsyncIconImage.LoadingState(255, *(_QWORD *)(a4 + 16), *(_QWORD *)(a4 + 24), v17);
        v10 = sub_24B35DBD4();
        v14 = *(_QWORD *)(v10 - 8);
        v15 = *(int *)(a4 + 80);
      }
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_24B35BC80(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[2];
  _QWORD v10[2];

  v4 = type metadata accessor for AsyncIconImage.Inner(255, *a1, a1[1], a4);
  v5 = sub_24B35DA60();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2544D6BD8);
  v6 = sub_24B35DA60();
  v10[0] = MEMORY[0x24BD1E4D8](&unk_24B35E920, v4);
  v10[1] = MEMORY[0x24BDF0910];
  v7 = MEMORY[0x24BDED308];
  v9[0] = MEMORY[0x24BD1E4D8](MEMORY[0x24BDED308], v5, v10);
  v9[1] = sub_24B35D7A8(&qword_2544D6BD0, &qword_2544D6BD8, MEMORY[0x24BDEF860]);
  return MEMORY[0x24BD1E4D8](v7, v6, v9);
}

uint64_t sub_24B35BD58()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24B35BD64(unint64_t *a1)
{
  sub_24B359A18(*a1);
  return swift_release();
}

unint64_t *sub_24B35BD8C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  sub_24B3599D0(*a2);
  v6 = a2[1];
  v5 = a2[2];
  *a1 = v4;
  a1[1] = v6;
  a1[2] = v5;
  swift_retain();
  return a1;
}

unint64_t *sub_24B35BDD4(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  sub_24B3599D0(*a2);
  v5 = *a1;
  *a1 = v4;
  sub_24B359A18(v5);
  v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_24B35BE30(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  sub_24B359A18(v4);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t sub_24B35BE74(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_24B35BEBC(uint64_t result, int a2, int a3)
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

uint64_t sub_24B35BEFC()
{
  return swift_allocateGenericValueMetadata();
}

void sub_24B35BF04()
{
  unint64_t v0;

  sub_24B35CB00(319, &qword_2544D6B80, (uint64_t (*)(uint64_t))type metadata accessor for IconEnvironmentTraits, MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void **sub_24B35BF9C(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  int *v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, int *);
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[9];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = (int *)type metadata accessor for IconEnvironmentTraits();
    v12 = *((_QWORD *)v11 - 1);
    v13 = *(unsigned int (**)(char *, uint64_t, int *))(v12 + 48);
    v14 = v4;
    if (v13(v10, 1, v11))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      v16 = sub_24B35DA30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v9, v10, v16);
      v17 = v11[5];
      v18 = &v9[v17];
      v19 = &v10[v17];
      v20 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
      v21 = v11[6];
      v22 = &v9[v21];
      v23 = &v10[v21];
      v24 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v22, v23, v24);
      v25 = v11[7];
      v26 = &v9[v25];
      v27 = &v10[v25];
      *(_QWORD *)v26 = *(_QWORD *)v27;
      v26[8] = v27[8];
      v9[v11[8]] = v10[v11[8]];
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v12 + 56))(v9, 0, 1, v11);
    }
    v28 = a3[10];
    v29 = a3[11];
    *(void **)((char *)v7 + v28) = *(void **)((char *)a2 + v28);
    v30 = *(unint64_t *)((char *)a2 + v29);
    swift_retain();
    sub_24B3599D0(v30);
    *(void **)((char *)v7 + v29) = (void *)v30;
  }
  return v7;
}

void sub_24B35C148(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;

  v4 = (char *)a1 + *(int *)(a2 + 36);
  v5 = type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_24B35DA30();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    v7 = &v4[*(int *)(v5 + 20)];
    v8 = sub_24B35DB08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
    v9 = &v4[*(int *)(v5 + 24)];
    v10 = sub_24B35DA54();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  }
  swift_release();
  sub_24B359A18(*(unint64_t *)((char *)a1 + *(int *)(a2 + 44)));
}

void **sub_24B35C228(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, int *);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[9];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = (int *)type metadata accessor for IconEnvironmentTraits();
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(unsigned int (**)(char *, uint64_t, int *))(v11 + 48);
  v13 = v6;
  if (v12(v9, 1, v10))
  {
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    v15 = sub_24B35DA30();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v8, v9, v15);
    v16 = v10[5];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
    v20 = v10[6];
    v21 = &v8[v20];
    v22 = &v9[v20];
    v23 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v21, v22, v23);
    v24 = v10[7];
    v25 = &v8[v24];
    v26 = &v9[v24];
    *(_QWORD *)v25 = *(_QWORD *)v26;
    v25[8] = v26[8];
    v8[v10[8]] = v9[v10[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
  }
  v27 = a3[10];
  v28 = a3[11];
  *(void **)((char *)a1 + v27) = *(void **)((char *)a2 + v27);
  v29 = *(unint64_t *)((char *)a2 + v28);
  swift_retain();
  sub_24B3599D0(v29);
  *(void **)((char *)a1 + v28) = (void *)v29;
  return a1;
}

void **sub_24B35C3AC(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  int *v12;
  uint64_t v13;
  uint64_t (*v14)(_BYTE *, uint64_t, int *);
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;

  v6 = *a1;
  v7 = *a2;
  *a1 = *a2;
  v8 = v7;

  v9 = a3[9];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = (int *)type metadata accessor for IconEnvironmentTraits();
  v13 = *((_QWORD *)v12 - 1);
  v14 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v13 + 48);
  v15 = v14(v10, 1, v12);
  v16 = v14(v11, 1, v12);
  if (!v15)
  {
    if (!v16)
    {
      v35 = sub_24B35DA30();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v35 - 8) + 24))(v10, v11, v35);
      v36 = v12[5];
      v37 = &v10[v36];
      v38 = &v11[v36];
      v39 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 24))(v37, v38, v39);
      v40 = v12[6];
      v41 = &v10[v40];
      v42 = &v11[v40];
      v43 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v43 - 8) + 24))(v41, v42, v43);
      v44 = v12[7];
      v45 = &v10[v44];
      v46 = &v11[v44];
      v47 = *(_QWORD *)v46;
      v45[8] = v46[8];
      *(_QWORD *)v45 = v47;
      v10[v12[8]] = v11[v12[8]];
      goto LABEL_7;
    }
    sub_24B359B08((uint64_t)v10);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
    goto LABEL_7;
  }
  v17 = sub_24B35DA30();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, v11, v17);
  v18 = v12[5];
  v19 = &v10[v18];
  v20 = &v11[v18];
  v21 = sub_24B35DB08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  v22 = v12[6];
  v23 = &v10[v22];
  v24 = &v11[v22];
  v25 = sub_24B35DA54();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  v26 = v12[7];
  v27 = &v10[v26];
  v28 = &v11[v26];
  v29 = *(_QWORD *)v28;
  v27[8] = v28[8];
  *(_QWORD *)v27 = v29;
  v10[v12[8]] = v11[v12[8]];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v13 + 56))(v10, 0, 1, v12);
LABEL_7:
  *(void **)((char *)a1 + a3[10]) = *(void **)((char *)a2 + a3[10]);
  swift_retain();
  swift_release();
  v31 = a3[11];
  v32 = *(unint64_t *)((char *)a2 + v31);
  sub_24B3599D0(v32);
  v33 = *(unint64_t *)((char *)a1 + v31);
  *(void **)((char *)a1 + v31) = (void *)v32;
  sub_24B359A18(v33);
  return a1;
}

_QWORD *sub_24B35C618(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  *a1 = *a2;
  v6 = a3[9];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = (int *)type metadata accessor for IconEnvironmentTraits();
  v10 = *((_QWORD *)v9 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_24B35DA30();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
    v13 = v9[5];
    v14 = &v7[v13];
    v15 = &v8[v13];
    v16 = sub_24B35DB08();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
    v17 = v9[6];
    v18 = &v7[v17];
    v19 = &v8[v17];
    v20 = sub_24B35DA54();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v18, v19, v20);
    v21 = v9[7];
    v22 = &v7[v21];
    v23 = &v8[v21];
    *(_QWORD *)v22 = *(_QWORD *)v23;
    v22[8] = v23[8];
    v7[v9[8]] = v8[v9[8]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v10 + 56))(v7, 0, 1, v9);
  }
  v24 = a3[11];
  *(_QWORD *)((char *)a1 + a3[10]) = *(_QWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v24) = *(_QWORD *)((char *)a2 + v24);
  return a1;
}

void **sub_24B35C78C(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  int *v10;
  uint64_t v11;
  uint64_t (*v12)(_BYTE *, uint64_t, int *);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[9];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = (int *)type metadata accessor for IconEnvironmentTraits();
  v11 = *((_QWORD *)v10 - 1);
  v12 = *(uint64_t (**)(_BYTE *, uint64_t, int *))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      v31 = sub_24B35DA30();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v31 - 8) + 40))(v8, v9, v31);
      v32 = v10[5];
      v33 = &v8[v32];
      v34 = &v9[v32];
      v35 = sub_24B35DB08();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v35 - 8) + 40))(v33, v34, v35);
      v36 = v10[6];
      v37 = &v8[v36];
      v38 = &v9[v36];
      v39 = sub_24B35DA54();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 40))(v37, v38, v39);
      v40 = v10[7];
      v41 = &v8[v40];
      v42 = &v9[v40];
      *(_QWORD *)v41 = *(_QWORD *)v42;
      v41[8] = v42[8];
      v8[v10[8]] = v9[v10[8]];
      goto LABEL_7;
    }
    sub_24B359B08((uint64_t)v8);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
    goto LABEL_7;
  }
  v15 = sub_24B35DA30();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v8, v9, v15);
  v16 = v10[5];
  v17 = &v8[v16];
  v18 = &v9[v16];
  v19 = sub_24B35DB08();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v17, v18, v19);
  v20 = v10[6];
  v21 = &v8[v20];
  v22 = &v9[v20];
  v23 = sub_24B35DA54();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v21, v22, v23);
  v24 = v10[7];
  v25 = &v8[v24];
  v26 = &v9[v24];
  *(_QWORD *)v25 = *(_QWORD *)v26;
  v25[8] = v26[8];
  v8[v10[8]] = v9[v10[8]];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, int *))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(void **)((char *)a1 + a3[10]) = *(void **)((char *)a2 + a3[10]);
  swift_release();
  v28 = a3[11];
  v29 = *(unint64_t *)((char *)a1 + v28);
  *(void **)((char *)a1 + v28) = *(void **)((char *)a2 + v28);
  sub_24B359A18(v29);
  return a1;
}

uint64_t sub_24B35C9E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24B35C9F0(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 36)], a2, v9);
  }
}

uint64_t sub_24B35CA7C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_24B35CA88(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)result = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 36)], a2, a2, v7);
  }
  return result;
}

void sub_24B35CB00(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_24B35CB58()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24B35CB8C()
{
  unint64_t result;

  result = qword_2544D6A40[0];
  if (!qword_2544D6A40[0])
  {
    result = MEMORY[0x24BD1E4D8](MEMORY[0x24BDF1438], MEMORY[0x24BDF1448]);
    atomic_store(result, qword_2544D6A40);
  }
  return result;
}

uint64_t sub_24B35CBD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B35CC14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6B78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B35CC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_24B358BA8(v4[4], v4[2], v4[3], a4);
}

id sub_24B35CC78()
{
  uint64_t v0;

  return sub_24B358CAC(*(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_24B35CC94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;

  v5 = *(_QWORD *)(v4 + 32);
  v6 = *(_QWORD *)(v4 + 40);
  v7 = (int *)type metadata accessor for AsyncIconImage(0, v5, v6, a4);
  v8 = (*(unsigned __int8 *)(*((_QWORD *)v7 - 1) + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(*((_QWORD *)v7 - 1) + 80);
  swift_unknownObjectRelease();

  v9 = v4 + v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BA0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_24B35DA30();
    (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v4 + v8, v10);
  }
  else
  {
    swift_release();
  }
  v11 = v9 + v7[9];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BB0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_24B35DA54();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  }
  else
  {
    swift_release();
  }
  sub_24B3599F4(*(_QWORD *)(v9 + v7[10]), *(_BYTE *)(v9 + v7[10] + 8));
  v13 = v9 + v7[11];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6BC0);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_24B35DB08();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  sub_24B359A00(*(_QWORD *)(v9 + v7[12]), *(_QWORD *)(v9 + v7[12] + 8), *(unsigned __int8 *)(v9 + v7[12] + 16), *(_BYTE *)(v9 + v7[12] + 17));
  sub_24B3599F4(*(_QWORD *)(v9 + v7[13]), *(_BYTE *)(v9 + v7[13] + 8));
  sub_24B359A0C(*(_QWORD *)(v9 + v7[14]), *(unsigned __int8 *)(v9 + v7[14] + 8), *(_BYTE *)(v9 + v7[14] + 9));
  sub_24B359A0C(*(_QWORD *)(v9 + v7[15]), *(unsigned __int8 *)(v9 + v7[15] + 8), *(_BYTE *)(v9 + v7[15] + 9));

  swift_release();
  swift_release();
  v15 = (id *)(v9 + v7[20]);

  v17 = type metadata accessor for AsyncIconImage.LoadingState(0, v5, v6, v16);
  v18 = (char *)v15 + *(int *)(v17 + 36);
  v19 = type metadata accessor for IconEnvironmentTraits();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(v18, 1, v19))
  {
    v20 = sub_24B35DA30();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(v18, v20);
    v21 = &v18[*(int *)(v19 + 20)];
    v22 = sub_24B35DB08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v21, v22);
    v23 = &v18[*(int *)(v19 + 24)];
    v24 = sub_24B35DA54();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(v23, v24);
  }
  swift_release();
  sub_24B359A18(*(unint64_t *)((char *)v15 + *(int *)(v17 + 44)));
  sub_24B35DBD4();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_24B35CFC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
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

  v7 = v4[4];
  v8 = v4[5];
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AsyncIconImage(0, v7, v8, a4) - 8) + 80);
  v10 = v4[2];
  v11 = v4[3];
  v12 = v4[6];
  v13 = v4[7];
  v14 = (uint64_t)v4 + ((v9 + 64) & ~v9);
  v15 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v15;
  *v15 = v5;
  v15[1] = sub_24B35D07C;
  return sub_24B3582FC(a1, v10, v11, v12, v13, v14, v7, v8);
}

uint64_t sub_24B35D07C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24B35D0C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IconEnvironmentTraits();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24B35D108(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24B35D16C;
  return v6(a1);
}

uint64_t sub_24B35D16C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_24B35D1B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_24B35D288(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24B35D8AC((uint64_t)v12, *a3);
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
      sub_24B35D8AC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_24B35D288(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_24B35D384(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_24B35DD00();
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

uint64_t sub_24B35D384(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24B35D418(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24B35D514(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24B35D514((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24B35D418(uint64_t a1, unint64_t a2)
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
      v3 = sub_24B35D4B0(v2, 0);
      result = sub_24B35DCF4();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_24B35DC58();
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

_QWORD *sub_24B35D4B0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(qword_257972E68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24B35D514(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(qword_257972E68);
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

uint64_t sub_24B35D5FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24B35D620(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24B35D07C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257972E58 + dword_257972E58))(a1, v4);
}

uint64_t sub_24B35D690(uint64_t a1)
{
  uint64_t v1;

  return sub_24B3586B4(a1, *(void **)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t type metadata accessor for AsyncIconImage.LoadingError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncIconImage.LoadingError);
}

uint64_t sub_24B35D6A4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24B35D6DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_24B35D75C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18) - 8) + 80);
  sub_24B3589AC(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
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

uint64_t sub_24B35D7A8(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24BD1E4D8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24B35D7E8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_24B35D84C(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2544D6C18);
  return sub_24B358AE4(a1);
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

uint64_t sub_24B35D8AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24B35D8EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24B35D930(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_24B35D96C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24B35D974(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_24B35DA60();
  v5[0] = v1;
  v5[1] = sub_24B35CB8C();
  MEMORY[0x24BD1E4D8](MEMORY[0x24BDED308], v2, v5);
  v3 = sub_24B35DAE4();
  return MEMORY[0x24BD1E4D8](MEMORY[0x24BDEE898], v3);
}

id sub_24B35D9F4()
{
  return sub_24B35CC78();
}

uint64_t sub_24B35DA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24B35CC5C(a1, a2, a3, a4);
}

uint64_t sub_24B35DA24()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_24B35DA30()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_24B35DA3C()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_24B35DA48()
{
  return MEMORY[0x24BDED128]();
}

uint64_t sub_24B35DA54()
{
  return MEMORY[0x24BDED130]();
}

uint64_t sub_24B35DA60()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_24B35DA6C()
{
  return MEMORY[0x24BDED5F8]();
}

uint64_t sub_24B35DA78()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_24B35DA84()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_24B35DA90()
{
  return MEMORY[0x24BDEDF70]();
}

uint64_t sub_24B35DA9C()
{
  return MEMORY[0x24BDEE070]();
}

uint64_t sub_24B35DAA8()
{
  return MEMORY[0x24BDEE1C0]();
}

uint64_t sub_24B35DAB4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_24B35DAC0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_24B35DACC()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_24B35DAD8()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_24B35DAE4()
{
  return MEMORY[0x24BDEE880]();
}

uint64_t sub_24B35DAF0()
{
  return MEMORY[0x24BDEE890]();
}

uint64_t sub_24B35DAFC()
{
  return MEMORY[0x24BDEEDD8]();
}

uint64_t sub_24B35DB08()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_24B35DB14()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_24B35DB20()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_24B35DB2C()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_24B35DB38()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_24B35DB44()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_24B35DB50()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_24B35DB5C()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_24B35DB68()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_24B35DB74()
{
  return MEMORY[0x24BDF33E0]();
}

uint64_t sub_24B35DB80()
{
  return MEMORY[0x24BDF38C0]();
}

uint64_t sub_24B35DB8C()
{
  return MEMORY[0x24BDF3918]();
}

uint64_t sub_24B35DB98()
{
  return MEMORY[0x24BDF3F68]();
}

uint64_t sub_24B35DBA4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_24B35DBB0()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_24B35DBBC()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_24B35DBC8()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_24B35DBD4()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_24B35DBE0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24B35DBEC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_24B35DBF8()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24B35DC04()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24B35DC10()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_24B35DC1C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24B35DC28()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24B35DC34()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_24B35DC40()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24B35DC4C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24B35DC58()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24B35DC64()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24B35DC70()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_24B35DC7C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_24B35DC88()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_24B35DC94()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24B35DCA0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24B35DCAC()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_24B35DCB8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24B35DCC4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24B35DCD0()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_24B35DCDC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24B35DCE8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24B35DCF4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24B35DD00()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24B35DD0C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24B35DD18()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_24B35DD24()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24B35DD30()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24B35DD3C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24B35DD48()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24B35DD54()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24B35DD60()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24B35DD6C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24B35DD78()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_24B35DD84()
{
  return MEMORY[0x24BEE4328]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

