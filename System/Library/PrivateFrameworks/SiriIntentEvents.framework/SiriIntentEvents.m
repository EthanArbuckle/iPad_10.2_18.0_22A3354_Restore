void EntityRejection.parameterName.getter()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void EntityRejection.intentType.getter()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void EntityRejection.entityType.getter()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void EntityRejection.entityId.getter()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void EntityRejection.bundleId.getter()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t EntityRejection.timestamp.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  type metadata accessor for EntityRejection();
  OUTLINED_FUNCTION_7();
  v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t type metadata accessor for EntityRejection()
{
  uint64_t result;

  result = qword_253F01700;
  if (!qword_253F01700)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EntityRejection.init(parameterName:intentType:entityType:entityId:timestamp:bundleId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char *v17;
  uint64_t v18;
  uint64_t result;

  *a9 = a1;
  a9[1] = a2;
  swift_bridgeObjectRetain();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  v17 = (char *)a9 + *(int *)(type metadata accessor for EntityRejection() + 36);
  v18 = OUTLINED_FUNCTION_7();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a10, v18);
  a9[8] = a11;
  a9[9] = a12;
  return result;
}

BOOL sub_2132CC89C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2132CC8AC()
{
  return sub_2132DEC9C();
}

uint64_t sub_2132CC8D0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  char v11;

  v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x7954797469746E65 && a2 == 0xEA00000000006570;
      if (v7 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else
      {
        v8 = a1 == 0x6449797469746E65 && a2 == 0xE800000000000000;
        if (v8 || (sub_2132DEC48() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 3;
        }
        else
        {
          v9 = a1 == 0x6449656C646E7562 && a2 == 0xE800000000000000;
          if (v9 || (sub_2132DEC48() & 1) != 0)
          {
            swift_bridgeObjectRelease();
            return 4;
          }
          else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
          {
            swift_bridgeObjectRelease();
            return 5;
          }
          else
          {
            v11 = sub_2132DEC48();
            swift_bridgeObjectRelease();
            if ((v11 & 1) != 0)
              return 5;
            else
              return 6;
          }
        }
      }
    }
  }
}

uint64_t sub_2132CCB44()
{
  return 6;
}

uint64_t sub_2132CCB4C()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t sub_2132CCB90()
{
  return 0;
}

uint64_t sub_2132CCB9C(char a1)
{
  return *(_QWORD *)&aParameteintent[8 * a1];
}

BOOL sub_2132CCBBC(char *a1, char *a2)
{
  return sub_2132CC89C(*a1, *a2);
}

uint64_t sub_2132CCBC8()
{
  return sub_2132CCB4C();
}

uint64_t sub_2132CCBD0()
{
  return sub_2132CC8AC();
}

uint64_t sub_2132CCBD8()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t sub_2132CCC18()
{
  char *v0;

  return sub_2132CCB9C(*v0);
}

uint64_t sub_2132CCC20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132CC8D0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132CCC44()
{
  return sub_2132CCB90();
}

uint64_t sub_2132CCC60@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132CCB44();
  *a1 = result;
  return result;
}

uint64_t sub_2132CCC84()
{
  sub_2132CCEE4();
  return sub_2132DECCC();
}

uint64_t sub_2132CCCAC()
{
  sub_2132CCEE4();
  return sub_2132DECD8();
}

uint64_t EntityRejection.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F338);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CCEE4();
  sub_2132DECC0();
  OUTLINED_FUNCTION_0();
  if (!v1)
  {
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_0();
    sub_2132DEBF4();
    type metadata accessor for EntityRejection();
    sub_2132DEA14();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    sub_2132DEC24();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B0CA4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_2132CCEE4()
{
  unint64_t result;

  result = qword_254B8F340;
  if (!qword_254B8F340)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF1CC, &type metadata for EntityRejection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F340);
  }
  return result;
}

uint64_t EntityRejection.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  char v28;
  char v29;
  char v30;
  char v31;
  char v32;
  char v33;

  v22 = a2;
  v4 = sub_2132DEA14();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F348);
  v8 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v9 = type metadata accessor for EntityRejection();
  MEMORY[0x24BDAC7A8]();
  v25 = (uint64_t *)((char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CCEE4();
  v24 = v2;
  v11 = v27;
  sub_2132DECB4();
  if (v11)
    return OUTLINED_FUNCTION_2();
  v21 = v5;
  v33 = 0;
  v12 = OUTLINED_FUNCTION_3();
  v13 = v25;
  *v25 = v12;
  v13[1] = v14;
  v27 = v14;
  v32 = 1;
  v13[2] = OUTLINED_FUNCTION_3();
  v13[3] = v15;
  v31 = 2;
  v13[4] = OUTLINED_FUNCTION_3();
  v13[5] = v16;
  v30 = 3;
  v13[6] = sub_2132DEBDC();
  v13[7] = v17;
  v29 = 4;
  v13[8] = sub_2132DEBB8();
  v13[9] = v18;
  v28 = 5;
  sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
  sub_2132DEBE8();
  OUTLINED_FUNCTION_1(*(uint64_t (**)(_QWORD, uint64_t))(v8 + 8));
  (*(void (**)(char *, char *, uint64_t))(v21 + 32))((char *)v13 + *(int *)(v9 + 36), v7, v4);
  sub_2132CD2F4((uint64_t)v13, v22);
  OUTLINED_FUNCTION_2();
  return sub_2132CD338((uint64_t)v13);
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

uint64_t sub_2132CD2B4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2132DEA14();
    result = MEMORY[0x2199B0CB0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2132CD2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EntityRejection();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132CD338(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EntityRejection();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132CD374@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return EntityRejection.init(from:)(a1, a2);
}

uint64_t sub_2132CD388(_QWORD *a1)
{
  return EntityRejection.encode(to:)(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for EntityRejection(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
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
    a1[4] = a2[4];
    a1[5] = v7;
    v8 = a2[7];
    a1[6] = a2[6];
    a1[7] = v8;
    v9 = a2[9];
    v10 = *(int *)(a3 + 36);
    v11 = (char *)a2 + v10;
    v12 = (char *)a1 + v10;
    a1[8] = a2[8];
    a1[9] = v9;
    v13 = sub_2132DEA14();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v14(v12, v11, v13);
  }
  return v3;
}

uint64_t destroy for EntityRejection(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = sub_2132DEA14();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *initializeWithCopy for EntityRejection(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);

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
  v9 = *(int *)(a3 + 36);
  v10 = (char *)a2 + v9;
  v11 = (char *)a1 + v9;
  a1[8] = a2[8];
  a1[9] = v8;
  v12 = sub_2132DEA14();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13(v11, v10, v12);
  return a1;
}

_QWORD *assignWithCopy for EntityRejection(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2132DEA14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for EntityRejection(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  a1[4] = a2[4];
  v6 = *(int *)(a3 + 36);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2132DEA14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *assignWithTake for EntityRejection(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

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
  v11 = *(int *)(a3 + 36);
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_2132DEA14();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for EntityRejection()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2132CD7D0(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for EntityRejection()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2132CD858(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = OUTLINED_FUNCTION_7();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2132CD8CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for EntityRejection.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for EntityRejection.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132CDA34 + 4 * byte_2132DF035[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2132CDA68 + 4 * byte_2132DF030[v4]))();
}

uint64_t sub_2132CDA68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CDA70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132CDA78);
  return result;
}

uint64_t sub_2132CDA84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132CDA8CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2132CDA90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CDA98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CDAA4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2132CDAB0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for EntityRejection.CodingKeys()
{
  return &type metadata for EntityRejection.CodingKeys;
}

unint64_t sub_2132CDACC()
{
  unint64_t result;

  result = qword_254B8F358;
  if (!qword_254B8F358)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF1A4, &type metadata for EntityRejection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F358);
  }
  return result;
}

unint64_t sub_2132CDB0C()
{
  unint64_t result;

  result = qword_254B8F360;
  if (!qword_254B8F360)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF114, &type metadata for EntityRejection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F360);
  }
  return result;
}

unint64_t sub_2132CDB4C()
{
  unint64_t result;

  result = qword_254B8F368;
  if (!qword_254B8F368)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF13C, &type metadata for EntityRejection.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F368);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_2132DEC18();
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t (*a1)(_QWORD, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(*(_QWORD *)(v2 - 112), v1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 96));
}

uint64_t OUTLINED_FUNCTION_3()
{
  return sub_2132DEBDC();
}

uint64_t OUTLINED_FUNCTION_5()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_2132DEA14();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t IntentStart.intentType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t IntentStart.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  v4 = OUTLINED_FUNCTION_7();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void IntentStart.__allocating_init(intentType:timestamp:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  v5 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(v5);
  OUTLINED_FUNCTION_7_0();
}

void IntentStart.init(intentType:timestamp:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0(v3);
  OUTLINED_FUNCTION_7_0();
}

uint64_t IntentStart.__allocating_init(intent:timestamp:)(void *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_5_0();
  IntentStart.init(intent:timestamp:)(a1, a2);
  return v4;
}

uint64_t IntentStart.init(intent:timestamp:)(void *a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a1, sel__className);
  v6 = sub_2132DEA8C();
  v8 = v7;

  *(_QWORD *)(v2 + 16) = v6;
  *(_QWORD *)(v2 + 24) = v8;
  v9 = v2 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp;
  v10 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9, a2, v10);
  return v2;
}

unint64_t sub_2132CDDD8()
{
  sub_2132DEB58();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132DEAA4();
  OUTLINED_FUNCTION_7();
  sub_2132CD2B4(&qword_254B8F370, MEMORY[0x24BDCE988]);
  sub_2132DEC30();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132DEAA4();
  return 0xD000000000000018;
}

BOOL sub_2132CDEE4(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_2132CDEF4()
{
  return sub_2132DEC9C();
}

uint64_t sub_2132CDF18(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v7;

  v3 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v7 = sub_2132DEC48();
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2132CE00C()
{
  return 2;
}

uint64_t sub_2132CE014()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t sub_2132CE058(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6D617473656D6974;
  else
    return 0x7954746E65746E69;
}

BOOL sub_2132CE098(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2132CDEE4(*a1, *a2);
}

uint64_t sub_2132CE0A4()
{
  return sub_2132CE014();
}

uint64_t sub_2132CE0AC()
{
  return sub_2132CDEF4();
}

uint64_t sub_2132CE0B4()
{
  char *v0;

  return sub_2132CE058(*v0);
}

uint64_t sub_2132CE0BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132CDF18(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132CE0E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132CE00C();
  *a1 = result;
  return result;
}

uint64_t sub_2132CE104()
{
  sub_2132CE30C();
  return sub_2132DECCC();
}

uint64_t sub_2132CE12C()
{
  sub_2132CE30C();
  return sub_2132DECD8();
}

uint64_t IntentStart.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  v1 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(v1);
  return v0;
}

uint64_t IntentStart.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  v0 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(v0);
  return swift_deallocClassInstance();
}

uint64_t sub_2132CE1D0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F378);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CE30C();
  sub_2132DECC0();
  sub_2132DEC18();
  if (!v1)
  {
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    sub_2132DEC24();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

unint64_t sub_2132CE30C()
{
  unint64_t result;

  result = qword_254B8F380;
  if (!qword_254B8F380)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF41C, &type metadata for IntentStart.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F380);
  }
  return result;
}

uint64_t IntentStart.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_5_0();
  IntentStart.init(from:)(a1);
  return v2;
}

uint64_t IntentStart.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = OUTLINED_FUNCTION_7();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_0();
  v7 = v6 - v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F388);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CE30C();
  sub_2132DECB4();
  if (v1)
  {
    v9 = v12;
    type metadata accessor for IntentStart();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v11 = v4;
    v9 = v12;
    *(_QWORD *)(v12 + 16) = sub_2132DEBDC();
    *(_QWORD *)(v12 + 24) = v10;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    sub_2132DEBE8();
    OUTLINED_FUNCTION_0_0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12 + OBJC_IVAR____TtC16SiriIntentEvents11IntentStart_timestamp, v7, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v9;
}

uint64_t type metadata accessor for IntentStart()
{
  uint64_t result;

  result = qword_254B8F3B8;
  if (!qword_254B8F3B8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2132CE5A0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = IntentStart.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2132CE5C8(_QWORD *a1)
{
  return sub_2132CE1D0(a1);
}

unint64_t sub_2132CE5E8()
{
  return sub_2132CDDD8();
}

uint64_t sub_2132CE608()
{
  return type metadata accessor for IntentStart();
}

uint64_t sub_2132CE610()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for IntentStart()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntentStart.__allocating_init(intentType:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of IntentStart.__allocating_init(intent:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of IntentStart.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of IntentStart.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of IntentStart.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t getEnumTagSinglePayload for IntentStart.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntentStart.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132CE7C8 + 4 * byte_2132DF285[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2132CE7FC + 4 * byte_2132DF280[v4]))();
}

uint64_t sub_2132CE7FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CE804(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132CE80CLL);
  return result;
}

uint64_t sub_2132CE818(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132CE820);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2132CE824(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CE82C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2132CE838(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IntentStart.CodingKeys()
{
  return &type metadata for IntentStart.CodingKeys;
}

unint64_t sub_2132CE858()
{
  unint64_t result;

  result = qword_254B8F468;
  if (!qword_254B8F468)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF3F4, &type metadata for IntentStart.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F468);
  }
  return result;
}

unint64_t sub_2132CE898()
{
  unint64_t result;

  result = qword_254B8F470;
  if (!qword_254B8F470)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF364, &type metadata for IntentStart.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F470);
  }
  return result;
}

unint64_t sub_2132CE8D8()
{
  unint64_t result;

  result = qword_254B8F478;
  if (!qword_254B8F478)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF38C, &type metadata for IntentStart.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F478);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 104));
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v2, v1, a1);
}

uint64_t OUTLINED_FUNCTION_3_0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return swift_allocObject();
}

void ConfirmationOffer.parameterName.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void ConfirmationOffer.intentType.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t ConfirmationOffer.multicardinalIndexValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

void ConfirmationOffer.item.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_5();
  sub_2132CE9F4(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t sub_2132CE9F4(uint64_t a1, unint64_t a2)
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

uint64_t ConfirmationOffer.timestamp.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_2132DEA14();
  v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

void ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7, uint64_t a8)
{
  char v15;

  v15 = a6 & 1;
  OUTLINED_FUNCTION_11();
  ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(a1, a2, a3, a4, a5, v15, a7, a8);
  OUTLINED_FUNCTION_0_1();
}

uint64_t ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v8;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  *(_QWORD *)(v8 + 48) = a5;
  *(_BYTE *)(v8 + 56) = a6 & 1;
  v11 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v22[0] = 0;
  v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_2132DEC3C(), 0, v22);
  swift_unknownObjectRelease();
  v13 = v22[0];
  if (v12)
  {
    v14 = sub_2132DE9E4();
    v16 = v15;

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    *(_QWORD *)(v8 + 64) = v14;
    *(_QWORD *)(v8 + 72) = v16;
    v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp;
    v18 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a8, v18);
  }
  else
  {
    v19 = v13;
    sub_2132DE9C0();

    swift_willThrow();
    v20 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a8, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_2_0();
  }
  return v8;
}

uint64_t type metadata accessor for ConfirmationOffer()
{
  uint64_t result;

  result = qword_254B8F4C8;
  if (!qword_254B8F4C8)
    return swift_getSingletonMetadata();
  return result;
}

void ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7)
{
  char v13;

  v13 = a6 & 1;
  OUTLINED_FUNCTION_11();
  ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:)(a1, a2, a3, a4, a5, v13, a7);
  OUTLINED_FUNCTION_0_1();
}

uint64_t ConfirmationOffer.init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30[2];

  v30[1] = *(id *)MEMORY[0x24BDAC8D0];
  v15 = OUTLINED_FUNCTION_7();
  v28 = *(_QWORD *)(v15 - 8);
  v29 = v15;
  MEMORY[0x24BDAC7A8]();
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a4;
  *(_QWORD *)(v7 + 48) = a5;
  *(_BYTE *)(v7 + 56) = a6 & 1;
  v18 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v19 = sub_2132DEC3C();
  v30[0] = 0;
  v20 = objc_msgSend(v18, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v19, 0, v30);
  swift_unknownObjectRelease();
  v21 = v30[0];
  if (v20)
  {
    v22 = sub_2132DE9E4();
    v24 = v23;

    *(_QWORD *)(v7 + 64) = v22;
    *(_QWORD *)(v7 + 72) = v24;
    sub_2132DEA08();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp, v17, v29);
  }
  else
  {
    v25 = v21;
    sub_2132DE9C0();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_2_0();
  }
  return v7;
}

uint64_t sub_2132CEF00(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x80000002132E1150 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 1835365481 && a2 == 0xE400000000000000;
      if (v7 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_2132DEC48();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_2132CF108()
{
  return 5;
}

uint64_t sub_2132CF110(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132CF148 + 4 * byte_2132DF470[a1]))(0xD000000000000017, 0x80000002132E1150);
}

uint64_t sub_2132CF148()
{
  return 0x6574656D61726170;
}

uint64_t sub_2132CF16C()
{
  return 0x7954746E65746E69;
}

uint64_t sub_2132CF188()
{
  return 1835365481;
}

uint64_t sub_2132CF198()
{
  return 0x6D617473656D6974;
}

uint64_t sub_2132CF1B4()
{
  unsigned __int8 *v0;

  return sub_2132CF110(*v0);
}

uint64_t sub_2132CF1BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132CEF00(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132CF1E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132CF108();
  *a1 = result;
  return result;
}

uint64_t sub_2132CF204()
{
  sub_2132CF4B0();
  return sub_2132DECCC();
}

uint64_t sub_2132CF22C()
{
  sub_2132CF4B0();
  return sub_2132DECD8();
}

uint64_t ConfirmationOffer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2132CF2B0(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp;
  v2 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t sub_2132CF2B0(uint64_t a1, unint64_t a2)
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

uint64_t ConfirmationOffer.__deallocating_deinit()
{
  ConfirmationOffer.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132CF318(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F480);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CF4B0();
  sub_2132DECC0();
  OUTLINED_FUNCTION_4_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_4_1();
    sub_2132DEC00();
    sub_2132CF4EC();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_12();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_2132CF4B0()
{
  unint64_t result;

  result = qword_254B8F488;
  if (!qword_254B8F488)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF634, &type metadata for ConfirmationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F488);
  }
  return result;
}

unint64_t sub_2132CF4EC()
{
  unint64_t result;

  result = qword_253F013E0;
  if (!qword_253F013E0)
  {
    result = MEMORY[0x2199B0CB0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_253F013E0);
  }
  return result;
}

uint64_t ConfirmationOffer.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_11();
  ConfirmationOffer.init(from:)(a1);
  return v2;
}

void ConfirmationOffer.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  __int128 v10;

  v4 = OUTLINED_FUNCTION_7();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F490);
  MEMORY[0x24BDAC7A8]();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132CF4B0();
  sub_2132DECB4();
  if (v1)
  {
    OUTLINED_FUNCTION_8_0();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v9 + 16) = OUTLINED_FUNCTION_7_1();
    *(_QWORD *)(v9 + 24) = v6;
    *(_QWORD *)(v9 + 32) = OUTLINED_FUNCTION_7_1();
    *(_QWORD *)(v9 + 40) = v7;
    LOBYTE(v10) = 2;
    *(_QWORD *)(v9 + 48) = sub_2132DEBC4();
    *(_BYTE *)(v9 + 56) = v8 & 1;
    sub_2132CF7F4();
    OUTLINED_FUNCTION_10();
    *(_OWORD *)(v9 + 64) = v10;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v9 + OBJC_IVAR____TtC16SiriIntentEvents17ConfirmationOffer_timestamp, v2, v4);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_2132CF7F4()
{
  unint64_t result;

  result = qword_254B8F498;
  if (!qword_254B8F498)
  {
    result = MEMORY[0x2199B0CB0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254B8F498);
  }
  return result;
}

uint64_t sub_2132CF830@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = ConfirmationOffer.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2132CF858(_QWORD *a1)
{
  return sub_2132CF318(a1);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  return type metadata accessor for ConfirmationOffer();
}

uint64_t sub_2132CF880()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ConfirmationOffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationOffer.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ConfirmationOffer.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for ConfirmationOffer.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ConfirmationOffer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132CFA58 + 4 * byte_2132DF47A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132CFA8C + 4 * byte_2132DF475[v4]))();
}

uint64_t sub_2132CFA8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CFA94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132CFA9CLL);
  return result;
}

uint64_t sub_2132CFAA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132CFAB0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132CFAB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132CFABC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationOffer.CodingKeys()
{
  return &type metadata for ConfirmationOffer.CodingKeys;
}

unint64_t sub_2132CFADC()
{
  unint64_t result;

  result = qword_254B8F588;
  if (!qword_254B8F588)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF60C, &type metadata for ConfirmationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F588);
  }
  return result;
}

unint64_t sub_2132CFB1C()
{
  unint64_t result;

  result = qword_254B8F590;
  if (!qword_254B8F590)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF57C, &type metadata for ConfirmationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F590);
  }
  return result;
}

unint64_t sub_2132CFB5C()
{
  unint64_t result;

  result = qword_254B8F598;
  if (!qword_254B8F598)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF5A4, &type metadata for ConfirmationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F598);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 8))(v1, *(_QWORD *)(v2 - 120));
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  return sub_2132DEC18();
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return sub_2132DEBDC();
}

uint64_t OUTLINED_FUNCTION_10()
{
  return sub_2132DEBE8();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_2132DEC24();
}

uint64_t IntentEvent.intentId.getter()
{
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_5();
}

void IntentEvent.eventType.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t IntentEvent.eventData.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_5();
  sub_2132CE9F4(v0, v1);
  return OUTLINED_FUNCTION_5();
}

uint64_t IntentEvent.createdAt.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_7();
  v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

void sub_2132CFCB4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 v13[24];

  v4 = OUTLINED_FUNCTION_8_1();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = &v13[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F013F0);
  v7 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = &v13[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v7);
  v11 = &v13[-v10];
  v12 = v1 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  swift_beginAccess();
  sub_2132CFE60(v12, (uint64_t)v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v4) == 1)
  {
    sub_2132CFEA8((uint64_t)v11);
    v13[0] = *(_BYTE *)(v1 + 32);
    sub_2132CE9F4(*(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
    sub_2132DBFF4(v13);
    if (v2)
      return;
    sub_2132CFEE8((uint64_t)v6, (uint64_t)v9);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v4);
    swift_beginAccess();
    sub_2132CFF2C((uint64_t)v9, v12);
    swift_endAccess();
  }
  else
  {
    v6 = v11;
  }
  sub_2132CFF74((uint64_t)v6, a1);
}

uint64_t sub_2132CFE60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F013F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132CFEA8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F013F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132CFEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132CFF2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F013F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132CFF74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void IntentEvent.__allocating_init(intentId:intentStart:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:intentStart:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 0, (uint64_t (*)(uint64_t))type metadata accessor for IntentStart, &qword_254B8F5A0, (uint64_t)&protocol conformance descriptor for IntentStart);
}

uint64_t type metadata accessor for IntentEvent()
{
  uint64_t result;

  result = qword_253F01530;
  if (!qword_253F01530)
    return swift_getSingletonMetadata();
  return result;
}

void IntentEvent.__allocating_init(intentId:disambiguationOffer:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:disambiguationOffer:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 2, (uint64_t (*)(uint64_t))type metadata accessor for DisambiguationOffer, &qword_254B8F5A8, (uint64_t)&protocol conformance descriptor for DisambiguationOffer);
}

void sub_2132D0088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;

  v11 = v8;
  v15 = v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  v16 = OUTLINED_FUNCTION_8_1();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_BYTE *)(v11 + 32) = a5;
  v17 = v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  v18 = sub_2132DEA14();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, a4, v18);
  sub_2132DE9B4();
  OUTLINED_FUNCTION_11_0();
  sub_2132DE9A8();
  a6(0);
  sub_2132D0570(a7, a6, a8);
  v20 = sub_2132DE99C();
  if (v27)
  {
    OUTLINED_FUNCTION_6_0();
    v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v22(a4, v18);
    swift_release();
    swift_bridgeObjectRelease();
    v22(v17, v18);
    sub_2132CFEA8(v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_3_1();
  }
  else
  {
    v23 = v20;
    v24 = v21;
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
    swift_release();
    OUTLINED_FUNCTION_6_0();
    *(_QWORD *)(v11 + 40) = v23;
    *(_QWORD *)(v11 + 48) = v24;
  }
  OUTLINED_FUNCTION_1_2();
}

void IntentEvent.__allocating_init(intentId:disambiguationResult:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:disambiguationResult:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 3, (uint64_t (*)(uint64_t))type metadata accessor for DisambiguationResult, &qword_254B8F5B0, (uint64_t)&protocol conformance descriptor for DisambiguationResult);
}

void IntentEvent.__allocating_init(intentId:confirmationOffer:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:confirmationOffer:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 4, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmationOffer, &qword_254B8F5B8, (uint64_t)&protocol conformance descriptor for ConfirmationOffer);
}

void IntentEvent.__allocating_init(intentId:confirmationResult:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:confirmationResult:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 5, (uint64_t (*)(uint64_t))type metadata accessor for ConfirmationResult, &qword_254B8F5C0, (uint64_t)&protocol conformance descriptor for ConfirmationResult);
}

void IntentEvent.__allocating_init(intentId:intentResult:createdAt:)()
{
  sub_2132D0308();
}

void sub_2132D0308()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4_2();
}

void IntentEvent.init(intentId:intentResult:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D0088(a1, a2, a3, a4, 1, (uint64_t (*)(uint64_t))type metadata accessor for IntentResult, &qword_254B8F5C8, (uint64_t)&protocol conformance descriptor for IntentResult);
}

void IntentEvent.__allocating_init(intentId:entityRejection:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:entityRejection:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D03FC(a1, a2, a3, a4, 6, (uint64_t (*)(uint64_t))type metadata accessor for EntityRejection, &qword_254B8F5D0, (uint64_t)&protocol conformance descriptor for EntityRejection);
}

void IntentEvent.__allocating_init(intentId:customSignal:createdAt:)()
{
  sub_2132D0308();
}

void IntentEvent.init(intentId:customSignal:createdAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D03FC(a1, a2, a3, a4, 7, (uint64_t (*)(uint64_t))type metadata accessor for CustomSignal, &qword_253F01410, (uint64_t)&protocol conformance descriptor for CustomSignal);
}

void sub_2132D03FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t (*a6)(uint64_t), unint64_t *a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v15;
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
  uint64_t v28;

  v11 = v8;
  v15 = v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  v16 = OUTLINED_FUNCTION_8_1();
  __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  *(_BYTE *)(v11 + 32) = a5;
  v17 = v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  v18 = sub_2132DEA14();
  v19 = *(_QWORD *)(v18 - 8);
  v25 = v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v17, a4, v18);
  sub_2132DE9B4();
  OUTLINED_FUNCTION_11_0();
  sub_2132DE9A8();
  a6(0);
  sub_2132D0570(a7, a6, a8);
  v20 = sub_2132DE99C();
  if (v28)
  {
    OUTLINED_FUNCTION_6_0();
    v22 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
    v22(a4, v18);
    OUTLINED_FUNCTION_12_0();
    swift_bridgeObjectRelease();
    v22(v25, v18);
    sub_2132CFEA8(v11 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
    type metadata accessor for IntentEvent();
    OUTLINED_FUNCTION_3_1();
  }
  else
  {
    v23 = v20;
    v24 = v21;
    OUTLINED_FUNCTION_6_0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
    OUTLINED_FUNCTION_12_0();
    *(_QWORD *)(v11 + 40) = v23;
    *(_QWORD *)(v11 + 48) = v24;
  }
  OUTLINED_FUNCTION_1_2();
}

void sub_2132D0570(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2199B0CB0](a3, v5), a1);
  }
  OUTLINED_FUNCTION_4();
}

void sub_2132D05AC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  OUTLINED_FUNCTION_3_0(v2);
  OUTLINED_FUNCTION_4();
}

uint64_t sub_2132D05D4(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v12 = *a3;
  v13 = v6 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content;
  v14 = type metadata accessor for IntentEventContent();
  __swift_storeEnumTagSinglePayload(v13, 1, 1, v14);
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_BYTE *)(v6 + 32) = v12;
  v15 = v6 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent_createdAt;
  v16 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v15, a6, v16);
  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = a5;
  return v6;
}

void IntentEvent.deinit()
{
  uint64_t v0;
  uint64_t v1;

  swift_bridgeObjectRelease();
  sub_2132CF2B0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  v1 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3_0(v1);
  sub_2132CFEA8(v0 + OBJC_IVAR____TtC16SiriIntentEvents11IntentEvent__content);
  OUTLINED_FUNCTION_4();
}

uint64_t IntentEvent.__deallocating_deinit()
{
  IntentEvent.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132D06EC()
{
  return type metadata accessor for IntentEvent();
}

void sub_2132D06F4()
{
  unint64_t v0;
  unint64_t v1;

  sub_2132DEA14();
  if (v0 <= 0x3F)
  {
    sub_2132D0884();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for IntentEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntentEvent.content()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:intentStart:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:disambiguationOffer:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:disambiguationResult:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:confirmationOffer:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:confirmationResult:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:intentResult:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:entityRejection:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 200))();
}

uint64_t dispatch thunk of IntentEvent.__allocating_init(intentId:customSignal:createdAt:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

void sub_2132D0884()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253F014B0)
  {
    type metadata accessor for IntentEventContent();
    v0 = sub_2132DEB40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253F014B0);
  }
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return v0(v4, v3, v2, v1);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_deallocPartialClassInstance();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return type metadata accessor for IntentEventContent();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_12_0()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_2132D05AC(v1, v0);
}

uint64_t sub_2132D098C()
{
  uint64_t v0;

  v0 = sub_2132DEA5C();
  __swift_allocate_value_buffer(v0, qword_253F017A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_253F017A0);
  return sub_2132DEA50();
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

_QWORD *initializeBufferWithCopyOfBuffer for IntentEventLoggerError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for IntentEventLoggerError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for IntentEventLoggerError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for IntentEventLoggerError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for IntentEventLoggerError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IntentEventLoggerError(uint64_t result, int a2, int a3)
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

uint64_t sub_2132D0BA0()
{
  return 0;
}

ValueMetadata *type metadata accessor for IntentEventLoggerError()
{
  return &type metadata for IntentEventLoggerError;
}

uint64_t dispatch thunk of IntentEventLogger.log(event:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of IntentEventLogger.log(event:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

void CustomSignal.signalType.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

void CustomSignal.turnId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void CustomSignal.source.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

void CustomSignal.resultCandidateId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void CustomSignal.item.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_5();
  sub_2132CE9F4(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t CustomSignal.timestamp.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7();
  v0 = OUTLINED_FUNCTION_5();
  return OUTLINED_FUNCTION_0_3(v0, v1, v2, v3);
}

uint64_t type metadata accessor for CustomSignal()
{
  uint64_t result;

  result = qword_253F01660;
  if (!qword_253F01660)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t CustomSignal.init(signalType:item:timestamp:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v14;
  uint64_t v15;

  *(_BYTE *)a3 = *a1;
  v5 = (void *)objc_opt_self();
  v6 = OUTLINED_FUNCTION_16(v5, sel_archivedDataWithRootObject_requiringSecureCoding_error_);
  v7 = 0;
  if (v6)
  {
    v8 = sub_2132DE9E4();
    v10 = v9;

    OUTLINED_FUNCTION_10_0();
    *(_QWORD *)(a3 + 48) = v8;
    *(_QWORD *)(a3 + 56) = v10;
    *(_QWORD *)(a3 + 8) = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_QWORD *)(a3 + 32) = 0;
    *(_QWORD *)(a3 + 40) = 0;
    *(_BYTE *)(a3 + 24) = 2;
    v11 = a3 + *(int *)(OUTLINED_FUNCTION_9_0() + 36);
    v12 = OUTLINED_FUNCTION_7();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a2, v12);
  }
  else
  {
    v14 = v7;
    sub_2132DE9C0();

    swift_willThrow();
    OUTLINED_FUNCTION_10_0();
    v15 = OUTLINED_FUNCTION_7();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a2, v15);
  }
}

uint64_t CustomSignal.init(signalType:item:turnId:resultCandidateId:source:timestamp:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, char *a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  char v25;

  v25 = *a6;
  *(_BYTE *)a8 = *a1;
  v13 = (void *)objc_opt_self();
  v14 = OUTLINED_FUNCTION_16(v13, sel_archivedDataWithRootObject_requiringSecureCoding_error_);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = sub_2132DE9E4();
    v19 = v18;

    OUTLINED_FUNCTION_10_0();
    *(_QWORD *)(a8 + 48) = v17;
    *(_QWORD *)(a8 + 56) = v19;
    *(_QWORD *)(a8 + 8) = a2;
    *(_QWORD *)(a8 + 16) = a3;
    *(_QWORD *)(a8 + 32) = a4;
    *(_QWORD *)(a8 + 40) = a5;
    *(_BYTE *)(a8 + 24) = v25;
    v20 = a8 + *(int *)(OUTLINED_FUNCTION_9_0() + 36);
    v21 = OUTLINED_FUNCTION_7();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20, a7, v21);
  }
  else
  {
    v23 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2132DE9C0();

    swift_willThrow();
    OUTLINED_FUNCTION_10_0();
    v24 = OUTLINED_FUNCTION_7();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 8))(a7, v24);
  }
}

uint64_t CustomSignal.init(signalType:itemData:timestamp:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a5 = *a1;
  *(_QWORD *)(a5 + 48) = a2;
  *(_QWORD *)(a5 + 56) = a3;
  *(_QWORD *)(a5 + 8) = 0;
  *(_QWORD *)(a5 + 16) = 0;
  *(_QWORD *)(a5 + 32) = 0;
  *(_QWORD *)(a5 + 40) = 0;
  *(_BYTE *)(a5 + 24) = 2;
  v6 = a5 + *(int *)(OUTLINED_FUNCTION_9_0() + 36);
  v7 = OUTLINED_FUNCTION_7();
  return OUTLINED_FUNCTION_0_3(v6, a4, v7, *(uint64_t (**)(void))(*(_QWORD *)(v7 - 8) + 32));
}

uint64_t CustomSignal.init(signalType:itemData:turnId:resultCandidateId:source:timestamp:)@<X0>(_BYTE *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char *a8@<X7>, uint64_t a9@<X8>)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);

  v9 = *a8;
  *(_BYTE *)a9 = *a1;
  *(_QWORD *)(a9 + 48) = a2;
  *(_QWORD *)(a9 + 56) = a3;
  *(_QWORD *)(a9 + 8) = a4;
  *(_QWORD *)(a9 + 16) = a5;
  *(_QWORD *)(a9 + 32) = a6;
  *(_QWORD *)(a9 + 40) = a7;
  *(_BYTE *)(a9 + 24) = v9;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_7();
  v10 = OUTLINED_FUNCTION_5();
  return OUTLINED_FUNCTION_0_3(v10, v11, v12, v13);
}

uint64_t sub_2132D1060(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v3 = a1 == 0x79546C616E676973 && a2 == 0xEA00000000006570;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x64496E727574 && a2 == 0xE600000000000000;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x656372756F73 && a2 == 0xE600000000000000;
      if (v7 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0xD000000000000011 && a2 == 0x80000002132E1210 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v8 = a1 == 1835365481 && a2 == 0xE400000000000000;
        if (v8 || (sub_2132DEC48() & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
        {
          swift_bridgeObjectRelease();
          return 5;
        }
        else
        {
          v10 = sub_2132DEC48();
          swift_bridgeObjectRelease();
          if ((v10 & 1) != 0)
            return 5;
          else
            return 6;
        }
      }
    }
  }
}

uint64_t sub_2132D12A0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132D12D8 + 4 * byte_2132DF7B0[a1]))(0xD000000000000011, 0x80000002132E1210);
}

uint64_t sub_2132D12D8()
{
  return 0x79546C616E676973;
}

uint64_t sub_2132D12F4()
{
  return 0x64496E727574;
}

uint64_t sub_2132D1308()
{
  return 0x656372756F73;
}

uint64_t sub_2132D131C()
{
  return 1835365481;
}

uint64_t sub_2132D132C()
{
  return 0x6D617473656D6974;
}

uint64_t sub_2132D1348()
{
  unsigned __int8 *v0;

  return sub_2132D12A0(*v0);
}

uint64_t sub_2132D1350@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132D1060(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132D1374()
{
  sub_2132D1588();
  return sub_2132DECCC();
}

uint64_t sub_2132D139C()
{
  sub_2132D1588();
  return sub_2132DECD8();
}

uint64_t CustomSignal.encode(to:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F01458);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4_0();
  v5 = v4 - v3;
  OUTLINED_FUNCTION_15();
  sub_2132DECC0();
  sub_2132D15C4();
  OUTLINED_FUNCTION_5_1();
  if (!v0)
  {
    OUTLINED_FUNCTION_2_2(1);
    sub_2132D1600();
    sub_2132DEC0C();
    OUTLINED_FUNCTION_2_2(3);
    sub_2132CF4EC();
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    sub_2132DEC24();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
}

unint64_t sub_2132D1588()
{
  unint64_t result;

  result = qword_253F01408;
  if (!qword_253F01408)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF94C, &type metadata for CustomSignal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_253F01408);
  }
  return result;
}

unint64_t sub_2132D15C4()
{
  unint64_t result;

  result = qword_253F01418;
  if (!qword_253F01418)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalType, &type metadata for CustomSignalType);
    atomic_store(result, (unint64_t *)&qword_253F01418);
  }
  return result;
}

unint64_t sub_2132D1600()
{
  unint64_t result;

  result = qword_253F01428;
  if (!qword_253F01428)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalSource, &type metadata for CustomSignalSource);
    atomic_store(result, (unint64_t *)&qword_253F01428);
  }
  return result;
}

uint64_t CustomSignal.init(from:)@<X0>(uint64_t a1@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  v1 = OUTLINED_FUNCTION_7();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_4_0();
  v5 = v4 - v3;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F5D8);
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_0();
  v7 = OUTLINED_FUNCTION_9_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_4_0();
  v15 = v9 - v8;
  OUTLINED_FUNCTION_15();
  sub_2132DECB4();
  if (v16)
    return OUTLINED_FUNCTION_13();
  sub_2132D1968();
  sub_2132DEBE8();
  *(_BYTE *)v15 = v17;
  *(_QWORD *)(v15 + 8) = OUTLINED_FUNCTION_6_1(1);
  *(_QWORD *)(v15 + 16) = v10;
  sub_2132D19A4();
  OUTLINED_FUNCTION_11_1();
  sub_2132DEBD0();
  *(_BYTE *)(v15 + 24) = v17;
  *(_QWORD *)(v15 + 32) = OUTLINED_FUNCTION_6_1(3);
  *(_QWORD *)(v15 + 40) = v11;
  sub_2132CF7F4();
  OUTLINED_FUNCTION_11_1();
  sub_2132DEBE8();
  *(_OWORD *)(v15 + 48) = v17;
  sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
  sub_2132DEBE8();
  OUTLINED_FUNCTION_1_3(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v15 + *(int *)(v7 + 36), v5, v1);
  sub_2132D19E0(v15, a1);
  OUTLINED_FUNCTION_13();
  return sub_2132D1A24(v15);
}

unint64_t sub_2132D1968()
{
  unint64_t result;

  result = qword_254B8F5E0;
  if (!qword_254B8F5E0)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalType, &type metadata for CustomSignalType);
    atomic_store(result, (unint64_t *)&qword_254B8F5E0);
  }
  return result;
}

unint64_t sub_2132D19A4()
{
  unint64_t result;

  result = qword_254B8F5E8;
  if (!qword_254B8F5E8)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalSource, &type metadata for CustomSignalSource);
    atomic_store(result, (unint64_t *)&qword_254B8F5E8);
  }
  return result;
}

uint64_t sub_2132D19E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CustomSignal();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132D1A24(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CustomSignal();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2132D1A60@<X0>(uint64_t a1@<X8>)
{
  return CustomSignal.init(from:)(a1);
}

uint64_t sub_2132D1A74()
{
  return CustomSignal.encode(to:)();
}

_BYTE *initializeBufferWithCopyOfBuffer for CustomSignal(_BYTE *a1, uint64_t *a2, uint64_t a3)
{
  _BYTE *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = (_BYTE *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *a1 = *(_BYTE *)a2;
    v7 = a2[2];
    *((_QWORD *)v4 + 1) = a2[1];
    *((_QWORD *)v4 + 2) = v7;
    v4[24] = *((_BYTE *)a2 + 24);
    v8 = a2[5];
    *((_QWORD *)v4 + 4) = a2[4];
    *((_QWORD *)v4 + 5) = v8;
    v9 = a2[6];
    v10 = a2[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2132CE9F4(v9, v10);
    *((_QWORD *)v4 + 6) = v9;
    *((_QWORD *)v4 + 7) = v10;
    v11 = *(int *)(a3 + 36);
    v12 = &v4[v11];
    v13 = (uint64_t)a2 + v11;
    v14 = sub_2132DEA14();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return v4;
}

uint64_t destroy for CustomSignal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2132CF2B0(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = a1 + *(int *)(a2 + 36);
  v5 = sub_2132DEA14();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2132CE9F4(v8, v9);
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(int *)(a3 + 36);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t assignWithCopy for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  sub_2132CE9F4(v6, v7);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  sub_2132CF2B0(v8, v9);
  v10 = *(int *)(a3 + 36);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  v5 = *(int *)(a3 + 36);
  v6 = a1 + v5;
  v7 = a2 + v5;
  v8 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CustomSignal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  sub_2132CF2B0(v8, v9);
  v10 = *(int *)(a3 + 36);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for CustomSignal()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2132D1E40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = OUTLINED_FUNCTION_7();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 36), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for CustomSignal()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2132D1EC8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 16) = a2;
  }
  else
  {
    v7 = OUTLINED_FUNCTION_7();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2132D1F30()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for CustomSignal.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D2008 + 4 * byte_2132DF7BB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2132D203C + 4 * byte_2132DF7B6[v4]))();
}

uint64_t sub_2132D203C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D2044(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D204CLL);
  return result;
}

uint64_t sub_2132D2058(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D2060);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2132D2064(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D206C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CustomSignal.CodingKeys()
{
  return &type metadata for CustomSignal.CodingKeys;
}

unint64_t sub_2132D208C()
{
  unint64_t result;

  result = qword_254B8F5F0;
  if (!qword_254B8F5F0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF924, &type metadata for CustomSignal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F5F0);
  }
  return result;
}

unint64_t sub_2132D20CC()
{
  unint64_t result;

  result = qword_253F01400;
  if (!qword_253F01400)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF894, &type metadata for CustomSignal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_253F01400);
  }
  return result;
}

unint64_t sub_2132D210C()
{
  unint64_t result;

  result = qword_253F013F8;
  if (!qword_253F013F8)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DF8BC, &type metadata for CustomSignal.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_253F013F8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_1_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_2@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_2132DEBF4();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return sub_2132DEC24();
}

uint64_t OUTLINED_FUNCTION_6_1@<X0>(char a1@<W8>)
{
  uint64_t v1;

  *(_BYTE *)(v1 - 96) = a1;
  return sub_2132DEBB8();
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return type metadata accessor for CustomSignal();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(*(_QWORD *)(v0 - 120));
}

unint64_t OUTLINED_FUNCTION_15()
{
  _QWORD *v0;
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1(v0, v1);
  return sub_2132D1588();
}

id OUTLINED_FUNCTION_16(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2, 1);
}

uint64_t static AppSelectionSignal.ValidationError.== infix(_:_:)()
{
  return 1;
}

uint64_t AppSelectionSignal.ValidationError.hash(into:)()
{
  return sub_2132DEC9C();
}

uint64_t AppSelectionSignal.ValidationError.hashValue.getter()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t sub_2132D2264()
{
  return 1;
}

uint64_t sub_2132D226C()
{
  return AppSelectionSignal.ValidationError.hashValue.getter();
}

uint64_t sub_2132D2280()
{
  return AppSelectionSignal.ValidationError.hash(into:)();
}

uint64_t sub_2132D2294()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t static AppSelectionSignal.supportsSecureCoding.getter()
{
  OUTLINED_FUNCTION_3_2();
  return byte_254B8F600;
}

void static AppSelectionSignal.supportsSecureCoding.setter(char a1)
{
  OUTLINED_FUNCTION_3_2();
  byte_254B8F600 = a1;
  OUTLINED_FUNCTION_17();
}

void static AppSelectionSignal.supportsSecureCoding.modify()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4();
}

void AppSelectionSignal.name.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_4();
}

uint64_t AppSelectionSignal.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
}

uint64_t AppSelectionSignal.rows.getter()
{
  return swift_bridgeObjectRetain();
}

void sub_2132D2404()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_2132D2470(v0);
}

uint64_t sub_2132D242C()
{
  OUTLINED_FUNCTION_3_2();
  return swift_bridgeObjectRetain();
}

void sub_2132D2470(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
  OUTLINED_FUNCTION_3_2();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_17();
}

void sub_2132D24B4()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_4();
}

void AppSelectionSignal.__allocating_init(name:version:timeElapsed:rows:info:signalTiming:test:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, double a8)
{
  OUTLINED_FUNCTION_16_0();
  AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(a1, a2, a3, a4, a5, a6, a7, a8);
  OUTLINED_FUNCTION_6_2();
}

id AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, double a8)
{
  _BYTE *v8;
  _QWORD *v9;
  objc_super v11;

  v9 = &v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name];
  *v9 = a1;
  v9[1] = a2;
  *(_QWORD *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version] = a3;
  *(double *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed] = a8;
  *(_QWORD *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows] = a4;
  *(_QWORD *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info] = a5;
  *(_QWORD *)&v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming] = a6;
  v8[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test] = a7;
  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for AppSelectionSignal();
  return objc_msgSendSuper2(&v11, sel_init);
}

uint64_t type metadata accessor for AppSelectionSignal()
{
  return objc_opt_self();
}

id sub_2132D2608(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;

  if (*(_QWORD *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16) == *(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16))
  {
    MEMORY[0x24BDAC7A8](a1);
    v3 = OUTLINED_FUNCTION_13_0();
    v4 = sub_2132D299C(v3, (uint64_t (*)(uint64_t, uint64_t))sub_2132D289C);
    swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name);
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name + 8);
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
    v8 = *(double *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed)
       + *(double *)(a1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed);
    v9 = (uint64_t *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
    OUTLINED_FUNCTION_18();
    v10 = *v9;
    OUTLINED_FUNCTION_18();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = OUTLINED_FUNCTION_5_2();
    v12 = sub_2132D28A4(v11, v10);
    v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming);
    swift_bridgeObjectRetain();
    v14 = swift_bridgeObjectRetain();
    v15 = sub_2132D2920(v14, v13);
    v16 = *(_BYTE *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
    v17 = objc_allocWithZone((Class)type metadata accessor for AppSelectionSignal());
    return AppSelectionSignal.init(name:version:timeElapsed:rows:info:signalTiming:test:)(v5, v6, v7, v4, v12, v15, v16, v8);
  }
  else
  {
    sub_2132D27EC();
    swift_allocError();
    return (id)swift_willThrow();
  }
}

unint64_t sub_2132D27EC()
{
  unint64_t result;

  result = qword_254B8F640;
  if (!qword_254B8F640)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for AppSelectionSignal.ValidationError, &type metadata for AppSelectionSignal.ValidationError);
    atomic_store(result, (unint64_t *)&qword_254B8F640);
  }
  return result;
}

unint64_t sub_2132D2828(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(*(_QWORD *)(a3 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows) + 16) > result)
  {
    swift_bridgeObjectRetain();
    v4 = swift_bridgeObjectRetain();
    return sub_2132D28A4(v4, a2);
  }
  __break(1u);
  return result;
}

unint64_t sub_2132D289C(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2132D2828(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2132D28A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_2132D3F70(a1, (uint64_t)sub_2132D3D40, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2132D2920(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_2132D3D74(a1, (uint64_t)sub_2132D4F0C, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_2132D299C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  sub_2132D48B4(0, 0, 0);
  v4 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v4)
  {
    v5 = 0;
    v6 = a1 + 32;
    do
    {
      v7 = *(_QWORD *)(v6 + 8 * v5);
      swift_bridgeObjectRetain();
      v8 = a2(v5, v7);
      swift_bridgeObjectRelease();
      v10 = *(_QWORD *)(v12 + 16);
      v9 = *(_QWORD *)(v12 + 24);
      if (v10 >= v9 >> 1)
        sub_2132D48B4((char *)(v9 > 1), v10 + 1, 1);
      ++v5;
      *(_QWORD *)(v12 + 16) = v10 + 1;
      *(_QWORD *)(v12 + 8 * v10 + 32) = v8;
    }
    while (v4 != v5);
  }
  swift_bridgeObjectRelease();
  return v12;
}

void sub_2132D2AB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t inited;
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v2 = v1;
  OUTLINED_FUNCTION_7_2(a1, (unint64_t *)&qword_253F01468);
  v3 = MEMORY[0x24BEE0D00];
  v4 = sub_2132DEA74();
  v33 = v4;
  if (qword_254B8F308 != -1)
    swift_once();
  v6 = qword_254B92D90;
  v5 = *(_QWORD *)algn_254B92D98;
  v7 = *(double *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed) * 1000.0;
  v8 = objc_allocWithZone(MEMORY[0x24BDD16E0]);
  OUTLINED_FUNCTION_5_2();
  v9 = objc_msgSend(v8, sel_initWithDouble_, v7);
  if (v9)
  {
    v10 = (uint64_t)v9;
    swift_isUniquelyReferenced_nonNull_native();
    sub_2132D4B4C(v10, v6, v5);
    v33 = v4;
    OUTLINED_FUNCTION_9_1();
    v11 = swift_bridgeObjectRelease();
  }
  else
  {
    v12 = (void *)sub_2132D49B0(v6, v5);
    OUTLINED_FUNCTION_9_1();

  }
  MEMORY[0x24BDAC7A8](v11);
  v13 = swift_bridgeObjectRetain();
  sub_2132D2F2C(v13, (void (*)(uint64_t, uint64_t, id))sub_2132D4AC8);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F650);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2132DF9B0;
  if (qword_254B8F328 != -1)
    swift_once();
  v15 = *(_QWORD *)algn_254B92DD8;
  *(_QWORD *)(inited + 32) = qword_254B92DD0;
  *(_QWORD *)(inited + 40) = v15;
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name + 8);
  *(_QWORD *)(inited + 72) = v3;
  *(_QWORD *)(inited + 48) = v16;
  *(_QWORD *)(inited + 56) = v17;
  v18 = qword_254B8F330;
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5_2();
  if (v18 != -1)
    swift_once();
  v19 = *(_QWORD *)algn_254B92DE8;
  *(_QWORD *)(inited + 80) = qword_254B92DE0;
  *(_QWORD *)(inited + 88) = v19;
  v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version);
  *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1768];
  *(_QWORD *)(inited + 96) = v20;
  v21 = qword_254B8F300;
  swift_bridgeObjectRetain();
  if (v21 != -1)
    swift_once();
  v22 = *(_QWORD *)algn_254B92D88;
  *(_QWORD *)(inited + 128) = qword_254B92D80;
  *(_QWORD *)(inited + 136) = v22;
  *(_QWORD *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F658);
  *(_QWORD *)(inited + 144) = v33;
  v23 = qword_254B8F310;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_13_0();
  if (v23 != -1)
    swift_once();
  v24 = *(_QWORD *)algn_254B92DA8;
  *(_QWORD *)(inited + 176) = qword_254B92DA0;
  *(_QWORD *)(inited + 184) = v24;
  v25 = *(_QWORD *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows);
  *(_QWORD *)(inited + 216) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F660);
  *(_QWORD *)(inited + 192) = v25;
  v26 = qword_254B8F320;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_13_0();
  if (v26 != -1)
    swift_once();
  v27 = *(_QWORD *)algn_254B92DC8;
  *(_QWORD *)(inited + 224) = qword_254B92DC0;
  *(_QWORD *)(inited + 232) = v27;
  v28 = (uint64_t *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info);
  OUTLINED_FUNCTION_3_2();
  v29 = *v28;
  *(_QWORD *)(inited + 264) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F668);
  *(_QWORD *)(inited + 240) = v29;
  v30 = qword_254B8F318;
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_13_0();
  if (v30 != -1)
    swift_once();
  v31 = *(_QWORD *)algn_254B92DB8;
  *(_QWORD *)(inited + 272) = qword_254B92DB0;
  *(_QWORD *)(inited + 280) = v31;
  v32 = *(_BYTE *)(v2 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
  *(_QWORD *)(inited + 312) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 288) = v32;
  swift_bridgeObjectRetain();
  sub_2132DEA74();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_2();
}

uint64_t sub_2132D2EE0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_bridgeObjectRetain();
  sub_2132D4AD0((uint64_t)a3, a1, a2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2132D2F2C(uint64_t a1, void (*a2)(uint64_t, uint64_t, id))
{
  uint64_t v3;
  int64_t v4;
  unint64_t v5;
  int64_t v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[5];
  uint64_t v20;

  sub_2132D52F0(a1, v19);
  v3 = v19[0];
  v20 = v19[1];
  v4 = v19[3];
  v5 = v19[4];
  v6 = (unint64_t)(v19[2] + 64) >> 6;
  result = swift_bridgeObjectRetain();
  if (!v5)
    goto LABEL_3;
LABEL_2:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  v9 = v8 | (v4 << 6);
  while (1)
  {
    v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = *(void **)(*(_QWORD *)(v3 + 56) + 8 * v9);
    swift_bridgeObjectRetain();
    v18 = v17;
    a2(v15, v16, v18);

    result = swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_2;
LABEL_3:
    v10 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v10 >= v6)
      return swift_release();
    v11 = *(_QWORD *)(v20 + 8 * v10);
    v12 = v4 + 1;
    if (!v11)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v6)
        return swift_release();
      v11 = *(_QWORD *)(v20 + 8 * v12);
      if (!v11)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v6)
          return swift_release();
        v11 = *(_QWORD *)(v20 + 8 * v12);
        if (!v11)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v6)
            return swift_release();
          v11 = *(_QWORD *)(v20 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v6)
              return swift_release();
            v11 = *(_QWORD *)(v20 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 6;
              while (v13 < v6)
              {
                v11 = *(_QWORD *)(v20 + 8 * v13++);
                if (v11)
                {
                  v12 = v13 - 1;
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
    v5 = (v11 - 1) & v11;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
    v4 = v12;
  }
  __break(1u);
  return result;
}

void sub_2132D30CC(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v3 = (void *)OUTLINED_FUNCTION_1_4();
  if (qword_254B8F328 != -1)
    swift_once();
  v4 = (void *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4();

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16E0]), sel_initWithInteger_, *(_QWORD *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version));
  if (qword_254B8F330 != -1)
    swift_once();
  v6 = (void *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4();

  v7 = *(double *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed);
  if (qword_254B8F308 != -1)
    swift_once();
  v8 = (void *)OUTLINED_FUNCTION_1_4();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v8, v7);

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F668);
  v9 = (void *)sub_2132DEAD4();
  if (qword_254B8F310 != -1)
    swift_once();
  v10 = (void *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4();

  OUTLINED_FUNCTION_3_2();
  swift_bridgeObjectRetain();
  v11 = (void *)sub_2132DEA68();
  OUTLINED_FUNCTION_10_1();
  if (qword_254B8F320 != -1)
    swift_once();
  v12 = (void *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4();

  OUTLINED_FUNCTION_7_2(v13, (unint64_t *)&qword_253F01468);
  v14 = (void *)sub_2132DEA68();
  if (qword_254B8F300 != -1)
    swift_once();
  v15 = (void *)OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_4();

  v16 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test);
  if (qword_254B8F318 != -1)
    swift_once();
  v17 = (void *)OUTLINED_FUNCTION_1_4();
  objc_msgSend(a1, sel_encodeBool_forKey_, v16, v17);

}

id AppSelectionSignal.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_16_0();
  return AppSelectionSignal.init(coder:)(a1);
}

id AppSelectionSignal.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __n128 v25;
  __n128 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __n128 v34;
  uint64_t v35;
  char *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  unsigned __int8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  objc_super v55;
  uint64_t v56;
  char v57[24];
  uint64_t v58;

  v2 = v1;
  OUTLINED_FUNCTION_7_2((uint64_t)a1, &qword_254B8F670);
  v5 = v4;
  v6 = qword_254B8F328;
  v7 = v2;
  if (v6 != -1)
    swift_once();
  v8 = sub_2132DEB10();
  if (!v8)
  {

LABEL_25:
    type metadata accessor for AppSelectionSignal();
    swift_deallocPartialClassInstance();
    return 0;
  }
  v9 = (void *)v8;
  v10 = sub_2132DEA8C();
  v12 = v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F678);
  v13 = OUTLINED_FUNCTION_8_2();
  *(_OWORD *)(v13 + 16) = xmmword_2132DF9C0;
  OUTLINED_FUNCTION_7_2(v13, &qword_254B8F680);
  *(_QWORD *)(v13 + 32) = v14;
  OUTLINED_FUNCTION_7_2(v14, &qword_254B8F688);
  *(_QWORD *)(v13 + 40) = v15;
  *(_QWORD *)(v13 + 48) = v5;
  OUTLINED_FUNCTION_7_2(v15, (unint64_t *)&qword_253F01468);
  *(_QWORD *)(v13 + 56) = v16;
  if (qword_254B8F310 != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_10_1();
  if (!v58)
  {

    OUTLINED_FUNCTION_9_1();
    sub_2132D53C4((uint64_t)v57, &qword_254B8F690);
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F660);
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {

LABEL_24:
    OUTLINED_FUNCTION_9_1();
    goto LABEL_25;
  }
  v17 = (__n128 *)OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1(v17, v18, v19, v20, v21, v22, v23, v24, v47, v49, v56, v10, v25);
  if (qword_254B8F320 != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_10_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F668);
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {

LABEL_23:
    swift_bridgeObjectRelease();
    goto LABEL_24;
  }
  v26 = (__n128 *)OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_1(v26, v27, v28, v29, v30, v31, v32, v33, v48, v56, v51, v53, v34);
  if (qword_254B8F300 != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_10_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F658);
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {

    swift_bridgeObjectRelease();
    goto LABEL_23;
  }
  v35 = v56;
  v36 = &v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_name];
  *(_QWORD *)v36 = v54;
  *((_QWORD *)v36 + 1) = v12;
  if (qword_254B8F330 != -1)
    swift_once();
  v37 = (void *)sub_2132DEB10();
  if (v37)
  {
    v38 = v37;
    v39 = (uint64_t)objc_msgSend(v37, sel_integerValue);

  }
  else
  {
    v39 = -1;
  }
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_version] = v39;
  if (qword_254B8F308 != -1)
    swift_once();
  v42 = (void *)OUTLINED_FUNCTION_1_4();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v42);
  v44 = v43;

  *(_QWORD *)&v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_timeElapsed] = v44;
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_rows] = v52;
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_info] = v50;
  *(_QWORD *)&v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_signalTiming] = v35;
  if (qword_254B8F318 != -1)
    swift_once();
  v45 = (void *)OUTLINED_FUNCTION_1_4();
  v46 = objc_msgSend(a1, sel_decodeBoolForKey_, v45);

  v7[OBJC_IVAR____TtC16SiriIntentEvents18AppSelectionSignal_test] = v46;
  v55.receiver = v7;
  v55.super_class = (Class)type metadata accessor for AppSelectionSignal();
  v40 = objc_msgSendSuper2(&v55, sel_init);

  return v40;
}

void sub_2132D3980()
{
  qword_254B92D80 = 0x6C6C694D656D6974;
  *(_QWORD *)algn_254B92D88 = 0xEA00000000007369;
}

void sub_2132D39A8()
{
  qword_254B92D90 = 0x6C6C694D656D6974;
  *(_QWORD *)algn_254B92D98 = 0xEF6C61746F547369;
}

void sub_2132D39D8()
{
  qword_254B92DA0 = 1937207154;
  *(_QWORD *)algn_254B92DA8 = 0xE400000000000000;
}

void sub_2132D39F4()
{
  qword_254B92DB0 = 0x747365547369;
  *(_QWORD *)algn_254B92DB8 = 0xE600000000000000;
}

void sub_2132D3A14()
{
  qword_254B92DC0 = 1868983913;
  *(_QWORD *)algn_254B92DC8 = 0xE400000000000000;
}

void sub_2132D3A30()
{
  qword_254B92DD0 = 1701667182;
  *(_QWORD *)algn_254B92DD8 = 0xE400000000000000;
}

void sub_2132D3A4C()
{
  qword_254B92DE0 = 0x6E6F6973726576;
  *(_QWORD *)algn_254B92DE8 = 0xE700000000000000;
}

id AppSelectionSignal.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_16_0(), sel_init);
}

void AppSelectionSignal.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AppSelectionSignal.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppSelectionSignal();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

char *sub_2132D3B50(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2132DEBA0();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

uint64_t sub_2132D3BD4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_2132DEBA0();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F668);
    return swift_arrayInitWithCopy();
  }
  return result;
}

uint64_t sub_2132D3CC0(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;

  *a1 = a4;
  swift_bridgeObjectRetain();
  v6 = a4;
  return a2;
}

uint64_t sub_2132D3D04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2132D5330(a4, a1);
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_2132D3D40@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = sub_2132D3D04((uint64_t)(a2 + 2), *a1, a1[1], (uint64_t)(a1 + 2));
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t sub_2132D3D74(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  char v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  __int128 v32;

  sub_2132D4F4C(a1, a2, a3, &v32);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2132D4F88();
  if (v8)
  {
    v10 = v7;
    v11 = v8;
    v12 = v9;
    while (1)
    {
      v13 = (_QWORD *)*a5;
      v15 = sub_2132D4754(v10, v11);
      v16 = v13[2];
      v17 = (v14 & 1) == 0;
      v18 = v16 + v17;
      if (__OFADD__(v16, v17))
        break;
      v19 = v14;
      if (v13[3] >= v18)
      {
        if ((a4 & 1) == 0)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F728);
          sub_2132DEB7C();
        }
      }
      else
      {
        sub_2132D4160(v18, a4 & 1);
        v20 = sub_2132D4754(v10, v11);
        if ((v19 & 1) != (v21 & 1))
          goto LABEL_17;
        v15 = v20;
      }
      v22 = (_QWORD *)*a5;
      if ((v19 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v23 = v22[7];

        *(_QWORD *)(v23 + 8 * v15) = v12;
      }
      else
      {
        v22[(v15 >> 6) + 8] |= 1 << v15;
        v24 = (uint64_t *)(v22[6] + 16 * v15);
        *v24 = v10;
        v24[1] = v11;
        *(_QWORD *)(v22[7] + 8 * v15) = v12;
        v25 = v22[2];
        v26 = __OFADD__(v25, 1);
        v27 = v25 + 1;
        if (v26)
          goto LABEL_16;
        v22[2] = v27;
      }
      sub_2132D4F88();
      v10 = v28;
      v11 = v29;
      v12 = v30;
      a4 = 1;
      if (!v29)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2132DEC54();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_2132D5328();
    return swift_release();
  }
  return result;
}

uint64_t sub_2132D3F70(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v7;
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
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  _OWORD *v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v7 = (_QWORD *)a3;
  sub_2132D4F4C(a1, a2, a3, &v51);
  swift_bridgeObjectRetain();
  v9 = swift_retain();
  OUTLINED_FUNCTION_15_0(v9, v10, v11, v12, v13, v14, v15, v16, (uint64_t)v7, a1, v43, *((uint64_t *)&v43 + 1), v44, v45, v46, *((uint64_t *)&v46 + 1), v47, v48, v49);
  v17 = *((_QWORD *)&v49 + 1);
  if (!*((_QWORD *)&v49 + 1))
  {
LABEL_14:
    swift_release();
    swift_bridgeObjectRelease();
    sub_2132D5328();
    return swift_release();
  }
  while (1)
  {
    v18 = v49;
    sub_2132D536C(&v50, &v46);
    v20 = OUTLINED_FUNCTION_11_2();
    v21 = v7[2];
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (v7[3] >= v23)
    {
      if ((a4 & 1) != 0)
      {
        if ((v19 & 1) != 0)
          goto LABEL_9;
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B8F738);
        v7 = a5;
        sub_2132DEB7C();
        if ((v24 & 1) != 0)
          goto LABEL_9;
      }
    }
    else
    {
      v7 = a5;
      sub_2132D445C(v23, a4 & 1);
      v25 = OUTLINED_FUNCTION_11_2();
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_17;
      v20 = v25;
      if ((v24 & 1) != 0)
      {
LABEL_9:
        sub_2132D5330((uint64_t)&v46, (uint64_t)&v43);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)&v46);
        swift_bridgeObjectRelease();
        v27 = (_OWORD *)(*(_QWORD *)(*a5 + 56) + 32 * v20);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
        v28 = sub_2132D536C(&v43, v27);
        goto LABEL_13;
      }
    }
    v7 = (_QWORD *)*a5;
    *(_QWORD *)(*a5 + 8 * (v20 >> 6) + 64) |= 1 << v20;
    v36 = (_QWORD *)(v7[6] + 16 * v20);
    *v36 = v18;
    v36[1] = v17;
    v28 = sub_2132D536C(&v46, (_OWORD *)(v7[7] + 32 * v20));
    v37 = v7[2];
    v38 = __OFADD__(v37, 1);
    v39 = v37 + 1;
    if (v38)
      goto LABEL_16;
    v7[2] = v39;
LABEL_13:
    OUTLINED_FUNCTION_15_0((uint64_t)v28, v29, v30, v31, v32, v33, v34, v35, v41, v42, v43, *((uint64_t *)&v43 + 1), v44, v45, v46, *((uint64_t *)&v46 + 1), v47, v48, v49);
    v17 = *((_QWORD *)&v49 + 1);
    a4 = 1;
    if (!*((_QWORD *)&v49 + 1))
      goto LABEL_14;
  }
  __break(1u);
LABEL_16:
  __break(1u);
LABEL_17:
  result = sub_2132DEC54();
  __break(1u);
  return result;
}

uint64_t sub_2132D4160(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F730);
  v38 = a2;
  v6 = sub_2132DEB94();
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
    sub_2132DEC90();
    sub_2132DEA98();
    result = sub_2132DECA8();
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
      sub_2132D4898(0, (unint64_t)(v34 + 63) >> 6, v17);
    else
      *v17 = -1 << v34;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2132D445C(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F01450);
  v6 = sub_2132DEB94();
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
        sub_2132D536C(v22, v35);
      }
      else
      {
        sub_2132D5330((uint64_t)v22, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_2132DEC90();
      sub_2132DEA98();
      result = sub_2132DECA8();
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
      result = (uint64_t)sub_2132D536C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v26));
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
                sub_2132D4898(0, (unint64_t)(v32 + 63) >> 6, v34);
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

unint64_t sub_2132D4754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2132DEC90();
  sub_2132DEA98();
  v4 = sub_2132DECA8();
  return sub_2132D47B8(a1, a2, v4);
}

unint64_t sub_2132D47B8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2132DEC48() & 1) == 0)
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
      while (!v14 && (sub_2132DEC48() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2132D4898(uint64_t result, uint64_t a2, _QWORD *a3)
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

char *sub_2132D48B4(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2132D48D0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_2132D48D0(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F758);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2132D3B50(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2132D3BD4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_2132D49B0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_2132D4754(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F728);
  sub_2132DEB70();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 8 * v6);
  sub_2132D4C60(0, (unint64_t *)&qword_253F01468);
  sub_2132DEB88();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2132D4AC8(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_2132D2EE0(a1, a2, a3);
}

uint64_t sub_2132D4AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2132D4B4C(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

void sub_2132D4B4C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v9 = sub_2132D4754(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F728);
  if ((sub_2132DEB70() & 1) == 0)
    goto LABEL_5;
  v13 = sub_2132D4754(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    sub_2132DEC54();
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
    sub_2132D4EC4(v11, a2, a3, a1, v15);
    swift_bridgeObjectRetain();
  }
}

void sub_2132D4C60(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_4();
}

unint64_t sub_2132D4C98()
{
  unint64_t result;

  result = qword_254B8F698;
  if (!qword_254B8F698)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for AppSelectionSignal.ValidationError, &type metadata for AppSelectionSignal.ValidationError);
    atomic_store(result, (unint64_t *)&qword_254B8F698);
  }
  return result;
}

uint64_t sub_2132D4CD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2132D242C();
  *a1 = result;
  return result;
}

uint64_t method lookup function for AppSelectionSignal()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSelectionSignal.info.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of AppSelectionSignal.info.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of AppSelectionSignal.info.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of AppSelectionSignal.__allocating_init(name:version:timeElapsed:rows:info:signalTiming:test:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppSelectionSignal.merging(otherSignal:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of AppSelectionSignal.json()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of AppSelectionSignal.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of AppSelectionSignal.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t getEnumTagSinglePayload for AppSelectionSignal.ValidationError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSelectionSignal.ValidationError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2132D4E68 + 4 * byte_2132DF9D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2132D4E88 + 4 * byte_2132DF9D5[v4]))();
}

_BYTE *sub_2132D4E68(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2132D4E88(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132D4E90(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132D4E98(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132D4EA0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132D4EA8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AppSelectionSignal.ValidationError()
{
  return &type metadata for AppSelectionSignal.ValidationError;
}

unint64_t sub_2132D4EC4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t sub_2132D4F0C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = sub_2132D3CC0(&v6, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16));
  v4 = v6;
  *a2 = result;
  a2[1] = v5;
  a2[2] = v4;
  return result;
}

uint64_t sub_2132D4F4C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
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

void sub_2132D4F88()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (*v11)(uint64_t *__return_ptr, _QWORD *);
  id v12;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  int64_t v18;
  uint64_t v19;
  _QWORD v20[3];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = *(void **)(*(_QWORD *)(v1 + 56) + 8 * v6);
    v0[3] = v4;
    v0[4] = v5;
    v11 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v20[0] = v8;
    v20[1] = v9;
    v20[2] = v10;
    swift_bridgeObjectRetain();
    v12 = v10;
    v11(&v19, v20);

    swift_bridgeObjectRelease();
    return;
  }
  v13 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v14 = (unint64_t)(v0[2] + 64) >> 6;
    if (v13 < v14)
    {
      v15 = v0[1];
      v16 = *(_QWORD *)(v15 + 8 * v13);
      if (v16)
      {
LABEL_7:
        v5 = (v16 - 1) & v16;
        v6 = __clz(__rbit64(v16)) + (v13 << 6);
        v4 = v13;
        goto LABEL_3;
      }
      v17 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v14)
      {
        v16 = *(_QWORD *)(v15 + 8 * v17);
        if (v16)
        {
LABEL_10:
          v13 = v17;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v14)
        {
          v16 = *(_QWORD *)(v15 + 8 * (v3 + 3));
          if (v16)
          {
            v13 = v3 + 3;
            goto LABEL_7;
          }
          v17 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v14)
          {
            v16 = *(_QWORD *)(v15 + 8 * v17);
            if (v16)
              goto LABEL_10;
            v13 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v14)
            {
              v16 = *(_QWORD *)(v15 + 8 * v13);
              if (v16)
                goto LABEL_7;
              v4 = v14 - 1;
              v18 = v3 + 6;
              while (v18 < v14)
              {
                v16 = *(_QWORD *)(v15 + 8 * v18++);
                if (v16)
                {
                  v13 = v18 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    v0[3] = v4;
    v0[4] = 0;
  }
}

uint64_t sub_2132D5114@<X0>(_OWORD *a1@<X8>)
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
    sub_2132D5330(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
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
  result = sub_2132D537C((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_2132D53C4((uint64_t)v21, (uint64_t *)&unk_253F01440);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_2132D52F0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_2132D5328()
{
  return swift_release();
}

uint64_t sub_2132D5330(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_2132D536C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2132D537C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254B8F748);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132D53C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id OUTLINED_FUNCTION_0_4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, (SEL)(v3 + 328), v1, v2);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_2132DEA80();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return sub_2132DEB1C();
}

uint64_t OUTLINED_FUNCTION_5_2()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_7_2(uint64_t a1, unint64_t *a2)
{
  sub_2132D4C60(0, a2);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return swift_bridgeObjectRelease();
}

unint64_t OUTLINED_FUNCTION_11_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2132D4754(v1, v0);
}

__n128 OUTLINED_FUNCTION_12_1(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __n128 a13)
{
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  __n128 result;

  result = a13;
  a1[1] = a13;
  a1[2].n128_u64[0] = v16;
  a1[2].n128_u64[1] = v15;
  a1[3].n128_u64[0] = v13;
  a1[3].n128_u64[1] = v14;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 a19)
{
  return sub_2132D5114(&a19);
}

id OUTLINED_FUNCTION_16_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_beginAccess();
}

void DisambiguationOffer.parameterName.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

void DisambiguationOffer.intentType.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t DisambiguationOffer.multicardinalIndexValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

void DisambiguationOffer.disambiguationItems.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_5();
  sub_2132CE9F4(v0, v1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4();
}

uint64_t DisambiguationOffer.timestamp.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  sub_2132DEA14();
  v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

void DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  char v11;

  v11 = a6 & 1;
  OUTLINED_FUNCTION_11();
  DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(a1, a2, a3, a4, a5, v11);
  OUTLINED_FUNCTION_0_1();
}

uint64_t DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28[2];

  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v13 = OUTLINED_FUNCTION_7();
  v26 = *(_QWORD *)(v13 - 8);
  v27 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 32) = a3;
  *(_QWORD *)(v6 + 40) = a4;
  *(_QWORD *)(v6 + 48) = a5;
  *(_BYTE *)(v6 + 56) = a6 & 1;
  v16 = (void *)objc_opt_self();
  v17 = (void *)sub_2132DEAD4();
  swift_bridgeObjectRelease();
  v28[0] = 0;
  v18 = objc_msgSend(v16, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v17, 0, v28);

  v19 = v28[0];
  if (v18)
  {
    v20 = sub_2132DE9E4();
    v22 = v21;

    *(_QWORD *)(v6 + 64) = v20;
    *(_QWORD *)(v6 + 72) = v22;
    sub_2132DEA08();
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))(v6 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp, v15, v27);
  }
  else
  {
    v23 = v19;
    sub_2132DE9C0();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_2();
    OUTLINED_FUNCTION_2_0();
  }
  return v6;
}

uint64_t type metadata accessor for DisambiguationOffer()
{
  uint64_t result;

  result = qword_254B8F808;
  if (!qword_254B8F808)
    return swift_getSingletonMetadata();
  return result;
}

void DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  char v15;

  v15 = a6 & 1;
  OUTLINED_FUNCTION_11();
  DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(a1, a2, a3, a4, a5, v15, a7, a8);
  OUTLINED_FUNCTION_0_1();
}

uint64_t DisambiguationOffer.init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  *(_QWORD *)(v8 + 48) = a5;
  *(_BYTE *)(v8 + 56) = a6 & 1;
  v10 = (void *)objc_opt_self();
  v11 = (void *)sub_2132DEAD4();
  swift_bridgeObjectRelease();
  v22[0] = 0;
  v12 = objc_msgSend(v10, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v11, 0, v22);

  v13 = v22[0];
  if (v12)
  {
    v14 = sub_2132DE9E4();
    v16 = v15;

    *(_QWORD *)(v8 + 64) = v14;
    *(_QWORD *)(v8 + 72) = v16;
    v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp;
    v18 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a8, v18);
  }
  else
  {
    v19 = v13;
    sub_2132DE9C0();

    swift_willThrow();
    v20 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a8, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_10_2();
    OUTLINED_FUNCTION_2_0();
  }
  return v8;
}

uint64_t sub_2132D5A10()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  sub_2132DEB58();
  OUTLINED_FUNCTION_6_3();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_10_1();
  sub_2132DEAA4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_10_1();
  OUTLINED_FUNCTION_6_3();
  if ((*(_BYTE *)(v0 + 56) & 1) == 0)
  {
    sub_2132D5B84();
    sub_2132DEB4C();
  }
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132DEAA4();
  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  sub_2132CE9F4(v2, v1);
  sub_2132DE9CC();
  sub_2132DEAA4();
  OUTLINED_FUNCTION_10_1();
  sub_2132CF2B0(v2, v1);
  return 0;
}

unint64_t sub_2132D5B84()
{
  unint64_t result;

  result = qword_254B8F7C0;
  if (!qword_254B8F7C0)
  {
    result = MEMORY[0x2199B0CB0](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254B8F7C0);
  }
  return result;
}

uint64_t sub_2132D5BC0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else if (a1 == 0xD000000000000017 && a2 == 0x80000002132E1150 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0xD000000000000013 && a2 == 0x80000002132E14C0 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
    {
      swift_bridgeObjectRelease();
      return 4;
    }
    else
    {
      v8 = sub_2132DEC48();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 4;
      else
        return 5;
    }
  }
}

uint64_t sub_2132D5DDC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132D5E18 + 4 * byte_2132DFAD0[a1]))(0xD000000000000017, 0x80000002132E1150);
}

uint64_t sub_2132D5E18()
{
  return 0x6574656D61726170;
}

uint64_t sub_2132D5E3C()
{
  return 0x7954746E65746E69;
}

unint64_t sub_2132D5E58()
{
  return 0xD000000000000013;
}

uint64_t sub_2132D5E74()
{
  return 0x6D617473656D6974;
}

uint64_t sub_2132D5E90()
{
  unsigned __int8 *v0;

  return sub_2132D5DDC(*v0);
}

uint64_t sub_2132D5E98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132D5BC0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132D5EBC()
{
  sub_2132D6124();
  return sub_2132DECCC();
}

uint64_t sub_2132D5EE4()
{
  sub_2132D6124();
  return sub_2132DECD8();
}

uint64_t DisambiguationOffer.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2132CF2B0(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp;
  v2 = sub_2132DEA14();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DisambiguationOffer.__deallocating_deinit()
{
  DisambiguationOffer.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132D5F8C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F7C8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132D6124();
  sub_2132DECC0();
  OUTLINED_FUNCTION_4_1();
  if (!v1)
  {
    OUTLINED_FUNCTION_4_1();
    sub_2132DEC00();
    sub_2132CF4EC();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_12();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_2132D6124()
{
  unint64_t result;

  result = qword_254B8F7D0;
  if (!qword_254B8F7D0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFCC4, &type metadata for DisambiguationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F7D0);
  }
  return result;
}

uint64_t DisambiguationOffer.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_11();
  DisambiguationOffer.init(from:)(a1);
  return v2;
}

void DisambiguationOffer.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;

  v4 = OUTLINED_FUNCTION_7();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F7D8);
  MEMORY[0x24BDAC7A8](v9);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132D6124();
  sub_2132DECB4();
  if (v1)
  {
    OUTLINED_FUNCTION_10_2();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v10 + 16) = OUTLINED_FUNCTION_7_1();
    *(_QWORD *)(v10 + 24) = v6;
    *(_QWORD *)(v10 + 32) = OUTLINED_FUNCTION_7_1();
    *(_QWORD *)(v10 + 40) = v7;
    LOBYTE(v11) = 2;
    *(_QWORD *)(v10 + 48) = sub_2132DEBC4();
    *(_BYTE *)(v10 + 56) = v8 & 1;
    sub_2132CF7F4();
    OUTLINED_FUNCTION_10();
    *(_OWORD *)(v10 + 64) = v11;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(v10 + OBJC_IVAR____TtC16SiriIntentEvents19DisambiguationOffer_timestamp, v2, v4);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_1();
}

uint64_t sub_2132D642C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = DisambiguationOffer.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2132D6454(_QWORD *a1)
{
  return sub_2132D5F8C(a1);
}

uint64_t sub_2132D6474()
{
  return sub_2132D5A10();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return type metadata accessor for DisambiguationOffer();
}

uint64_t sub_2132D649C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DisambiguationOffer()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(parameterName:intentType:multicardinalIndexValue:disambiguationItems:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationOffer.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of DisambiguationOffer.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of DisambiguationOffer.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t storeEnumTagSinglePayload for DisambiguationOffer.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D65F8 + 4 * byte_2132DFADA[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132D662C + 4 * byte_2132DFAD5[v4]))();
}

uint64_t sub_2132D662C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D6634(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D663CLL);
  return result;
}

uint64_t sub_2132D6648(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D6650);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132D6654(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D665C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationOffer.CodingKeys()
{
  return &type metadata for DisambiguationOffer.CodingKeys;
}

unint64_t sub_2132D667C()
{
  unint64_t result;

  result = qword_254B8F8D0;
  if (!qword_254B8F8D0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFC9C, &type metadata for DisambiguationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F8D0);
  }
  return result;
}

unint64_t sub_2132D66BC()
{
  unint64_t result;

  result = qword_254B8F8D8;
  if (!qword_254B8F8D8)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFC0C, &type metadata for DisambiguationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F8D8);
  }
  return result;
}

unint64_t sub_2132D66FC()
{
  unint64_t result;

  result = qword_254B8F8E0;
  if (!qword_254B8F8E0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFC34, &type metadata for DisambiguationOffer.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F8E0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_2132DEAA4();
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_2132DEAA4();
}

uint64_t sub_2132D6758()
{
  uint64_t v0;
  unsigned int v1;

  sub_2132DEBAC();
  OUTLINED_FUNCTION_25();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_2132D67A4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x65756C6176;
  else
    return 1701869940;
}

uint64_t sub_2132D67D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2132D9A84(*a1, *a2);
}

uint64_t sub_2132D67DC()
{
  unsigned __int8 *v0;

  return sub_2132DBF0C(*v0);
}

uint64_t sub_2132D67E4(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_2132DA004(a1, *v1);
}

uint64_t sub_2132D67EC(uint64_t a1)
{
  unsigned __int8 *v1;

  return sub_2132DA384(a1, *v1);
}

uint64_t sub_2132D67F4()
{
  unint64_t v0;

  sub_2132DEBAC();
  OUTLINED_FUNCTION_25();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_2132D6834()
{
  return sub_2132DEC9C();
}

uint64_t sub_2132D6858()
{
  sub_2132DEC90();
  sub_2132DEC9C();
  return sub_2132DECA8();
}

uint64_t sub_2132D6898@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132D6758();
  *a1 = result;
  return result;
}

uint64_t sub_2132D68C4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2132D67A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2132D68EC()
{
  char *v0;

  return sub_2132D67A4(*v0);
}

uint64_t sub_2132D68F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132D67A0();
  *a1 = result;
  return result;
}

void sub_2132D6918(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2132D6924()
{
  sub_2132D6B28();
  return sub_2132DECCC();
}

uint64_t sub_2132D694C()
{
  sub_2132D6B28();
  return sub_2132DECD8();
}

void DisambiguationResolution.encode(to:)()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10_3();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F8E8);
  v8 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  v6 = *v0;
  v5 = v0[1];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2132D6B28();
  sub_2132DECC0();
  v7 = (v5 >> 60) & 3;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v7 != 1)
    {
      OUTLINED_FUNCTION_19();
      OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
      goto LABEL_9;
    }
    sub_2132CE9F4(v6, v5 & 0xCFFFFFFFFFFFFFFFLL);
    sub_2132CF4EC();
    OUTLINED_FUNCTION_5_3();
    if (!v1)
      goto LABEL_6;
  }
  else
  {
    sub_2132CE9F4(v6, v5);
    sub_2132CF4EC();
    OUTLINED_FUNCTION_5_3();
    if (!v1)
LABEL_6:
      OUTLINED_FUNCTION_19();
  }
  OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  sub_2132D6B64(v6, v5);
LABEL_9:
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_2132D6B28()
{
  unint64_t result;

  result = qword_254B8F8F0;
  if (!qword_254B8F8F0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0178, &unk_24CF85608);
    atomic_store(result, (unint64_t *)&qword_254B8F8F0);
  }
  return result;
}

uint64_t sub_2132D6B64(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  v2 = (a2 >> 60) & 3;
  if ((_DWORD)v2)
  {
    if ((_DWORD)v2 != 1)
      return result;
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return sub_2132CF2B0(result, a2);
}

void DisambiguationResolution.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  char *v4;

  OUTLINED_FUNCTION_10_3();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F8F8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2132D6B28();
  sub_2132DECB4();
  if (!v0)
  {
    sub_2132DEBDC();
    v4 = (char *)sub_2132D6C78 + 4 * byte_2132DFD20[sub_2132D67F4()];
    __asm { BR              X10 }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_0_1();
}

void sub_2132D6C78()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_5();
  if (!v0)
  {
    v3 = *(_QWORD *)(v2 - 88);
    *v1 = *(_QWORD *)(v2 - 96);
    v1[1] = v3;
  }
  JUMPOUT(0x2132D6C40);
}

void sub_2132D6CE0()
{
  sub_2132D6D0C();
  swift_allocError();
  swift_willThrow();
  JUMPOUT(0x2132D6C3CLL);
}

unint64_t sub_2132D6D0C()
{
  unint64_t result;

  result = qword_254B8F900;
  if (!qword_254B8F900)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0138, &unk_24CF85578);
    atomic_store(result, (unint64_t *)&qword_254B8F900);
  }
  return result;
}

void sub_2132D6D48()
{
  DisambiguationResolution.init(from:)();
}

void sub_2132D6D5C()
{
  DisambiguationResolution.encode(to:)();
}

uint64_t DisambiguationResult.parameterName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationResult.multicardinalIndexValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t DisambiguationResult.intentType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DisambiguationResult.resolution.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_2132D6DE0(v2, v3);
}

uint64_t sub_2132D6DE0(uint64_t result, unint64_t a2)
{
  uint64_t v2;

  v2 = (a2 >> 60) & 3;
  if ((_DWORD)v2)
  {
    if ((_DWORD)v2 != 1)
      return result;
    a2 &= 0xCFFFFFFFFFFFFFFFLL;
  }
  return sub_2132CE9F4(result, a2);
}

uint64_t DisambiguationResult.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  v4 = OUTLINED_FUNCTION_7();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _OWORD *a7)
{
  char v13;
  char v14;
  uint64_t v15;

  OUTLINED_FUNCTION_15_1();
  v14 = v13 & 1;
  v15 = swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(a1, a2, a3, a4, a5, v14, a7);
  return v15;
}

void DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _OWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_20();
  v14 = OUTLINED_FUNCTION_7();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_0();
  v18 = v17 - v16;
  *(_QWORD *)(v7 + 16) = v12;
  *(_QWORD *)(v7 + 24) = v11;
  *(_QWORD *)(v7 + 48) = v10;
  *(_QWORD *)(v7 + 56) = v9;
  *(_QWORD *)(v7 + 32) = v8;
  *(_BYTE *)(v7 + 40) = a6 & 1;
  *(_OWORD *)(v7 + 64) = *a7;
  sub_2132DEA08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v18, v14);
  OUTLINED_FUNCTION_7_3();
}

void DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)()
{
  _QWORD *v0;
  _QWORD *v1;
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
  char v12;
  char v13;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_15_1();
  v13 = v12 & 1;
  OUTLINED_FUNCTION_11();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(v11, v9, v7, v5, v3, v13, v1);
  OUTLINED_FUNCTION_0_1();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  v15 = OUTLINED_FUNCTION_7();
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4_0();
  v18 = v17 - v16;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 48) = a3;
  *(_QWORD *)(v7 + 56) = a4;
  *(_QWORD *)(v7 + 32) = a5;
  *(_BYTE *)(v7 + 40) = a6 & 1;
  v19 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v29[0] = 0;
  v20 = objc_msgSend(v19, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_2132DEC3C(), 0, v29);
  swift_unknownObjectRelease();
  v21 = v29[0];
  if (v20)
  {
    v22 = sub_2132DE9E4();
    v24 = v23;

    *(_QWORD *)(v7 + 64) = v22;
    *(_QWORD *)(v7 + 72) = v24;
    sub_2132DEA08();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v18, v28);
  }
  else
  {
    v25 = v21;
    sub_2132DE9C0();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_2_0();
  }
  return v7;
}

uint64_t type metadata accessor for DisambiguationResult()
{
  uint64_t result;

  result = qword_254B8F958;
  if (!qword_254B8F958)
    return swift_getSingletonMetadata();
  return result;
}

void DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v15;
  char v16;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_15_1();
  v16 = v15 & 1;
  swift_allocObject();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(v12, v11, v10, v9, v8, v16, a7, a8);
  OUTLINED_FUNCTION_7_3();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_16_1(a1, a2, a3, a4, a5, a6);
  *(_OWORD *)(v8 + 64) = *v10;
  v11 = v8 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  v12 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a8, v12);
  return v8;
}

void DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  char v14;
  char v15;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  OUTLINED_FUNCTION_15_1();
  v15 = v14 & 1;
  OUTLINED_FUNCTION_11();
  DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(v13, v11, v9, v7, v5, v15, v3, v1);
  OUTLINED_FUNCTION_0_1();
}

uint64_t DisambiguationResult.init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v8;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16_1(a1, a2, a3, a4, a5, a6);
  v11 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v22[0] = 0;
  v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_2132DEC3C(), 0, v22);
  swift_unknownObjectRelease();
  v13 = v22[0];
  if (v12)
  {
    v14 = sub_2132DE9E4();
    v16 = v15;

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    *(_QWORD *)(v8 + 64) = v14;
    *(_QWORD *)(v8 + 72) = v16;
    v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
    v18 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a8, v18);
  }
  else
  {
    v19 = v13;
    sub_2132DE9C0();

    swift_willThrow();
    v20 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a8, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_2_0();
  }
  return v8;
}

uint64_t sub_2132D7488(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x6574656D61726170 && a2 == 0xED0000656D614E72;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x80000002132E1150 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else
    {
      v7 = a1 == 0x6974756C6F736572 && a2 == 0xEA00000000006E6FLL;
      if (v7 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 4;
      }
      else
      {
        v9 = sub_2132DEC48();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 4;
        else
          return 5;
      }
    }
  }
}

uint64_t sub_2132D76A4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132D76DC + 4 * byte_2132DFD24[a1]))(0xD000000000000017, 0x80000002132E1150);
}

uint64_t sub_2132D76DC()
{
  return 0x6574656D61726170;
}

uint64_t sub_2132D7700()
{
  return 0x7954746E65746E69;
}

uint64_t sub_2132D771C()
{
  return 0x6974756C6F736572;
}

uint64_t sub_2132D773C()
{
  return 0x6D617473656D6974;
}

uint64_t sub_2132D7758()
{
  unsigned __int8 *v0;

  return sub_2132D76A4(*v0);
}

uint64_t sub_2132D7760@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132D7488(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132D7784()
{
  sub_2132D79E0();
  return sub_2132DECCC();
}

uint64_t sub_2132D77AC()
{
  sub_2132D79E0();
  return sub_2132DECD8();
}

uint64_t DisambiguationResult.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2132D6B64(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp;
  v2 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t DisambiguationResult.__deallocating_deinit()
{
  DisambiguationResult.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132D7850(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F908);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132D79E0();
  sub_2132DECC0();
  OUTLINED_FUNCTION_4_1();
  if (!v1)
  {
    sub_2132DEC00();
    OUTLINED_FUNCTION_4_1();
    sub_2132D7A1C();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_12();
  }
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

unint64_t sub_2132D79E0()
{
  unint64_t result;

  result = qword_254B8F910;
  if (!qword_254B8F910)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E00E8, &type metadata for DisambiguationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8F910);
  }
  return result;
}

unint64_t sub_2132D7A1C()
{
  unint64_t result;

  result = qword_254B8F918;
  if (!qword_254B8F918)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for DisambiguationResolution, &type metadata for DisambiguationResolution);
    atomic_store(result, (unint64_t *)&qword_254B8F918);
  }
  return result;
}

uint64_t DisambiguationResult.__allocating_init(from:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_1();
  v0 = OUTLINED_FUNCTION_11();
  DisambiguationResult.init(from:)();
  return v0;
}

void DisambiguationResult.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  OUTLINED_FUNCTION_10_3();
  v11 = v0;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_7();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8F920);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2132D79E0();
  sub_2132DECB4();
  if (v1)
  {
    OUTLINED_FUNCTION_22();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v11 + 16) = OUTLINED_FUNCTION_14();
    *(_QWORD *)(v11 + 24) = v7;
    *(_QWORD *)(v11 + 32) = sub_2132DEBC4();
    *(_BYTE *)(v11 + 40) = v8 & 1;
    LOBYTE(v12) = 2;
    *(_QWORD *)(v11 + 48) = OUTLINED_FUNCTION_14();
    *(_QWORD *)(v11 + 56) = v9;
    sub_2132D7D24();
    OUTLINED_FUNCTION_10();
    *(_OWORD *)(v11 + 64) = v12;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v11 + OBJC_IVAR____TtC16SiriIntentEvents20DisambiguationResult_timestamp, v2, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_2132D7D24()
{
  unint64_t result;

  result = qword_254B8F928;
  if (!qword_254B8F928)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for DisambiguationResolution, &type metadata for DisambiguationResolution);
    atomic_store(result, (unint64_t *)&qword_254B8F928);
  }
  return result;
}

uint64_t sub_2132D7D60@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = DisambiguationResult.__allocating_init(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_2132D7D88(_QWORD *a1)
{
  return sub_2132D7850(a1);
}

uint64_t *initializeBufferWithCopyOfBuffer for DisambiguationResolution(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  sub_2132D6DE0(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t destroy for DisambiguationResolution(uint64_t a1)
{
  return sub_2132D6B64(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *assignWithCopy for DisambiguationResolution(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = *a2;
  v4 = a2[1];
  sub_2132D6DE0(*a2, v4);
  v5 = *a1;
  v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_2132D6B64(v5, v6);
  return a1;
}

uint64_t *assignWithTake for DisambiguationResolution(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *a1;
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2132D6B64(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DisambiguationResolution(uint64_t a1, int a2)
{
  int v2;

  if (a2)
  {
    if (a2 == 1 || !*(_BYTE *)(a1 + 16))
    {
      if ((~*(_QWORD *)(a1 + 8) & 0x3000000000000000) != 0)
        v2 = -1;
      else
        v2 = 0;
    }
    else
    {
      v2 = *(_DWORD *)a1 + 1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DisambiguationResolution(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 2)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_OWORD *)result = xmmword_2132E01D0;
  }
  return result;
}

uint64_t sub_2132D7EF0(uint64_t a1)
{
  if (((*(_QWORD *)(a1 + 8) >> 60) & 2) != 0)
    return (*(_DWORD *)a1 + 2);
  else
    return (*(_QWORD *)(a1 + 8) >> 60) & 3;
}

uint64_t sub_2132D7F10(uint64_t result)
{
  *(_QWORD *)(result + 8) &= 0xCFFFFFFFFFFFFFFFLL;
  return result;
}

_QWORD *sub_2132D7F20(_QWORD *result, uint64_t a2)
{
  if (a2 < 2)
  {
    result[1] = result[1] & 0xCFFFFFFFFFFFFFFFLL | (a2 << 60);
  }
  else
  {
    *result = (a2 - 2);
    result[1] = 0x2000000000000000;
  }
  return result;
}

void type metadata accessor for DisambiguationResolution()
{
  OUTLINED_FUNCTION_27();
}

uint64_t OUTLINED_FUNCTION_22()
{
  return type metadata accessor for DisambiguationResult();
}

uint64_t sub_2132D7F5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for DisambiguationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 136))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolvedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 144))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of DisambiguationResult.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of DisambiguationResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t storeEnumTagSinglePayload for DisambiguationResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D80C4 + 4 * byte_2132DFD2E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132D80F8 + 4 * byte_2132DFD29[v4]))();
}

uint64_t sub_2132D80F8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D8100(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D8108);
  return result;
}

uint64_t sub_2132D8114(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D811CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132D8120(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D8128(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguationResult.CodingKeys()
{
  return &type metadata for DisambiguationResult.CodingKeys;
}

uint64_t sub_2132D8144(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2132D8184 + 4 * byte_2132DFD33[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2132D81A4 + 4 * byte_2132DFD38[v4]))();
}

_BYTE *sub_2132D8184(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2132D81A4(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132D81AC(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132D81B4(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132D81BC(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132D81C4(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for DisambiguationResolution.DecoderError()
{
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2132D81DC(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D8228 + 4 * byte_2132DFD42[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2132D825C + 4 * byte_2132DFD3D[v4]))();
}

uint64_t sub_2132D825C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D8264(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D826CLL);
  return result;
}

uint64_t sub_2132D8278(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D8280);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2132D8284(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D828C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for DisambiguationResolution.CodingKeys()
{
  OUTLINED_FUNCTION_27();
}

unint64_t sub_2132D82A8()
{
  unint64_t result;

  result = qword_254B8FA28;
  if (!qword_254B8FA28)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFFA0, &unk_24CF85608);
    atomic_store(result, (unint64_t *)&qword_254B8FA28);
  }
  return result;
}

unint64_t sub_2132D82E8()
{
  unint64_t result;

  result = qword_254B8FA30;
  if (!qword_254B8FA30)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0008, &unk_24CF85578);
    atomic_store(result, (unint64_t *)&qword_254B8FA30);
  }
  return result;
}

unint64_t sub_2132D8328()
{
  unint64_t result;

  result = qword_254B8FA38;
  if (!qword_254B8FA38)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E00C0, &type metadata for DisambiguationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FA38);
  }
  return result;
}

unint64_t sub_2132D8368()
{
  unint64_t result;

  result = qword_254B8FA40;
  if (!qword_254B8FA40)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0030, &type metadata for DisambiguationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FA40);
  }
  return result;
}

unint64_t sub_2132D83A8()
{
  unint64_t result;

  result = qword_254B8FA48;
  if (!qword_254B8FA48)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0058, &type metadata for DisambiguationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FA48);
  }
  return result;
}

unint64_t sub_2132D83E8()
{
  unint64_t result;

  result = qword_254B8FA50;
  if (!qword_254B8FA50)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFED8, &unk_24CF85608);
    atomic_store(result, (unint64_t *)&qword_254B8FA50);
  }
  return result;
}

unint64_t sub_2132D8428()
{
  unint64_t result;

  result = qword_254B8FA58;
  if (!qword_254B8FA58)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132DFF00, &unk_24CF85608);
    atomic_store(result, (unint64_t *)&qword_254B8FA58);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  return sub_2132DEBE8();
}

uint64_t OUTLINED_FUNCTION_4_4@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return sub_2132DEC24();
}

uint64_t OUTLINED_FUNCTION_13_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2132DEBDC();
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  *(_QWORD *)(v6 + 16) = result;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)(v6 + 48) = a3;
  *(_QWORD *)(v6 + 56) = a4;
  *(_QWORD *)(v6 + 32) = a5;
  *(_BYTE *)(v6 + 40) = a6 & 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_2132DEC18();
}

unint64_t OUTLINED_FUNCTION_24()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 1;
  return sub_2132CF7F4();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_bridgeObjectRelease();
}

id IntentEventStore.init()@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0CD88]), sel_initWithPublicStream_, 35);
  *a1 = result;
  return result;
}

id static IntentEventStore.temporary()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id result;
  unint64_t v18;
  unint64_t v19;

  v2 = sub_2132DEA38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2132DEA2C();
  sub_2132DEA20();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_2132DEB58();
  swift_bridgeObjectRelease();
  v18 = 0xD00000000000001BLL;
  v19 = 0x80000002132E1530;
  OUTLINED_FUNCTION_4_5();
  v6 = v18;
  v7 = v19;
  v8 = NSTemporaryDirectory();
  v9 = sub_2132DEA8C();
  v11 = v10;

  v18 = v9;
  v19 = v11;
  sub_2132DEAA4();
  OUTLINED_FUNCTION_4_5();
  swift_bridgeObjectRelease();
  v12 = v18;
  v13 = v19;
  v14 = (void *)objc_opt_self();
  v15 = sub_2132D926C(v12, v13, v14);
  v16 = objc_allocWithZone(MEMORY[0x24BE0CD88]);
  result = sub_2132D9128(v6, v7, v15);
  *a1 = result;
  return result;
}

void IntentEventStore.log(event:)(uint64_t a1)
{
  __asm { BR              X11 }
}

void sub_2132D8774()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;

  v4 = *(_QWORD *)(v2 + 40);
  v5 = *(_QWORD *)(v2 + 48);
  v6 = objc_allocWithZone(MEMORY[0x24BE0CD38]);
  swift_bridgeObjectRetain();
  sub_2132CE9F4(v4, v5);
  v7 = sub_2132D9188(v1, v3, 0x7453746E65746E69, 0xEB00000000747261, v4, v5);
  sub_2132DE9FC();
  v9 = v8;
  v10 = objc_msgSend(v0, sel_source);
  objc_msgSend(v10, sel_sendEvent_timestamp_, v7, v9);

}

uint64_t IntentEventStore.findEvents(intentId:eventType:startDate:endDate:limit:reversed:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int a8)
{
  void **v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  _QWORD *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  _QWORD v42[2];
  int v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(void *);
  _QWORD *v50;

  v43 = a7;
  LODWORD(v44) = a8;
  v42[1] = a6;
  v45 = a1;
  v46 = a2;
  v12 = sub_2132DEA14();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F01470);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v42 - v20;
  v22 = *a3;
  v23 = *v8;
  sub_2132D92C4(a4, (uint64_t)v42 - v20);
  v24 = 0;
  if (OUTLINED_FUNCTION_3_4((uint64_t)v21) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v21, v12);
    OUTLINED_FUNCTION_1_6();
    sub_2132DE9FC();
    v24 = sub_2132DEB28();
    OUTLINED_FUNCTION_0_5();
  }
  sub_2132D92C4(a5, (uint64_t)v19);
  if (OUTLINED_FUNCTION_3_4((uint64_t)v19) == 1)
  {
    v25 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v19, v12);
    OUTLINED_FUNCTION_1_6();
    sub_2132DE9FC();
    v25 = (void *)sub_2132DEB28();
    OUTLINED_FUNCTION_0_5();
  }
  if ((v43 & 1) != 0)
  {
    v26 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_1_6();
    v26 = (void *)sub_2132DEB34();
  }
  if (v22 == 8)
  {
    v27 = 0;
    v28 = 0;
  }
  else
  {
    LOBYTE(v47) = v22;
    v27 = IntentEventType.rawValue.getter();
    v28 = v29;
  }
  v30 = objc_msgSend(v23, sel_publisherWithStartTime_endTime_maxEvents_lastN_reversed_, v24, v25, v26, 0, v44 & 1);
  v44 = v25;
  v31 = v30;
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = MEMORY[0x24BEE4AF8];
  v49 = (void (*)(void *))nullsub_1;
  v50 = 0;
  v33 = MEMORY[0x24BDAC760];
  v47 = MEMORY[0x24BDAC760];
  v48 = 1107296256;
  v34 = OUTLINED_FUNCTION_2_4((uint64_t)sub_2132D8C88);
  v35 = (_QWORD *)swift_allocObject();
  v36 = (void *)v24;
  v37 = v46;
  v35[2] = v45;
  v35[3] = v37;
  v35[4] = v27;
  v35[5] = v28;
  v35[6] = v32;
  v49 = sub_2132D937C;
  v50 = v35;
  v47 = v33;
  v48 = 1107296256;
  v38 = OUTLINED_FUNCTION_2_4((uint64_t)sub_2132D8C88);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  v39 = objc_msgSend(v31, sel_sinkWithCompletion_receiveInput_, v34, v38);

  _Block_release(v38);
  _Block_release(v34);

  swift_beginAccess();
  v40 = *(_QWORD *)(v32 + 16);
  swift_bridgeObjectRetain();
  swift_release();
  return v40;
}

void sub_2132D8C8C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  NSObject *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  Swift::String v43;
  char v44;
  _QWORD *v45;
  char *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  char v61[24];

  v12 = sub_2132DEA14();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v56 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v56 - v17;
  v19 = objc_msgSend(a1, sel_eventBody);
  if (!v19)
  {
    if (qword_253F01438 != -1)
      swift_once();
    v30 = sub_2132DEA5C();
    __swift_project_value_buffer(v30, (uint64_t)qword_253F017A0);
    v60 = sub_2132DEA44();
    v31 = sub_2132DEB04();
    if (os_log_type_enabled(v60, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_2132CA000, v60, v31, "found BMStoreEvent<BMSiriIntentEvent> with no body", v32, 2u);
      MEMORY[0x2199B0D28](v32, -1, -1);
    }
    v19 = v60;
    goto LABEL_14;
  }
  v58 = a6;
  v59 = v18;
  v60 = v19;
  if (a3)
  {
    v57 = a1;
    v20 = a4;
    v21 = v16;
    v22 = v13;
    v23 = v12;
    v24 = -[NSObject intentId](v19, sel_intentId);
    v25 = sub_2132DEA8C();
    v27 = v26;

    if (v25 == a2 && v27 == a3)
    {
      swift_bridgeObjectRelease();
      v12 = v23;
      v13 = v22;
      v19 = v60;
      v16 = v21;
      a4 = v20;
      a1 = v57;
    }
    else
    {
      v29 = sub_2132DEC48();
      swift_bridgeObjectRelease();
      v12 = v23;
      v13 = v22;
      v19 = v60;
      v16 = v21;
      a4 = v20;
      a1 = v57;
      if ((v29 & 1) == 0)
        goto LABEL_14;
    }
  }
  if (!a5)
    goto LABEL_24;
  v33 = -[NSObject eventType](v19, sel_eventType);
  v34 = sub_2132DEA8C();
  v36 = v35;

  if (v34 == a4 && v36 == a5)
  {
    swift_bridgeObjectRelease();
    v19 = v60;
    goto LABEL_24;
  }
  v38 = sub_2132DEC48();
  swift_bridgeObjectRelease();
  v19 = v60;
  if ((v38 & 1) == 0)
  {
LABEL_14:

    return;
  }
LABEL_24:
  v39 = -[NSObject eventType](v19, sel_eventType);
  v40 = sub_2132DEA8C();
  v42 = v41;

  v43._countAndFlagsBits = v40;
  v43._object = v42;
  IntentEventType.init(rawValue:)(v43);
  v44 = v61[0];
  if (v61[0] == 8)
  {

  }
  else
  {
    v45 = (_QWORD *)(v58 + 16);
    objc_msgSend(a1, sel_timestamp);
    v46 = v59;
    sub_2132DE9F0();
    v47 = -[NSObject intentId](v60, sel_intentId);
    v48 = sub_2132DEA8C();
    v50 = v49;

    v61[0] = v44;
    v51 = -[NSObject eventData](v60, sel_eventData);
    v52 = sub_2132DE9E4();
    v54 = v53;

    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v46, v12);
    type metadata accessor for IntentEvent();
    swift_allocObject();
    sub_2132D05D4(v48, v50, v61, v52, v54, (uint64_t)v16);
    swift_beginAccess();
    v55 = swift_retain();
    MEMORY[0x2199B0860](v55);
    sub_2132D9240(*(_QWORD *)((*v45 & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_2132DEAF8();
    sub_2132DEAE0();
    swift_endAccess();
    swift_release();

    (*(void (**)(char *, uint64_t))(v13 + 8))(v46, v12);
  }
}

void sub_2132D90D8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_2132D9128(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;

  v5 = (void *)sub_2132DEA80();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v3, sel_initWithPrivateStreamIdentifier_storeConfig_, v5, a3);

  return v6;
}

id sub_2132D9188(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  void *v6;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v9 = (void *)sub_2132DEA80();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_2132DEA80();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_2132DE9D8();
  v12 = objc_msgSend(v6, sel_initWithIntentId_eventType_eventData_, v9, v10, v11);
  sub_2132CF2B0(a5, a6);

  return v12;
}

uint64_t sub_2132D9240(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_2132DEAEC();
  return result;
}

id sub_2132D926C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = (void *)sub_2132DEA80();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(a3, sel_newPrivateStreamDefaultConfigurationWithStoreBasePath_, v4);

  return v5;
}

uint64_t sub_2132D92C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_253F01470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2132D930C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_2132D9348()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2132D937C(void *a1)
{
  uint64_t *v1;

  sub_2132D8C8C(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

unint64_t sub_2132D938C()
{
  unint64_t result;

  result = qword_253F01468;
  if (!qword_253F01468)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F01468);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentEventStore()
{
  return &type metadata for IntentEventStore;
}

uint64_t OUTLINED_FUNCTION_0_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

unint64_t OUTLINED_FUNCTION_1_6()
{
  return sub_2132D938C();
}

void *OUTLINED_FUNCTION_2_4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = a1;
  *(_QWORD *)(v2 - 120) = v1;
  return _Block_copy((const void *)(v2 - 144));
}

uint64_t OUTLINED_FUNCTION_3_4(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return sub_2132DEAA4();
}

SiriIntentEvents::CustomSignalSource_optional __swiftcall CustomSignalSource.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  SiriIntentEvents::CustomSignalSource_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2132DEBAC();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t CustomSignalSource.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x746E65696C63;
  else
    return 0x726576726573;
}

void sub_2132D94A8(char *a1, char *a2)
{
  sub_2132D9AFC(*a1, *a2);
}

unint64_t sub_2132D94B8()
{
  unint64_t result;

  result = qword_254B8FA60;
  if (!qword_254B8FA60)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalSource, &type metadata for CustomSignalSource);
    atomic_store(result, (unint64_t *)&qword_254B8FA60);
  }
  return result;
}

void sub_2132D94F4()
{
  sub_2132D9F8C();
}

uint64_t sub_2132D94FC()
{
  return sub_2132DA04C();
}

void sub_2132D9504()
{
  sub_2132DA330();
}

SiriIntentEvents::CustomSignalSource_optional sub_2132D950C(Swift::String *a1)
{
  return CustomSignalSource.init(rawValue:)(*a1);
}

uint64_t sub_2132D9518@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CustomSignalSource.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2132D953C()
{
  sub_2132D96B0();
  return sub_2132DEABC();
}

uint64_t sub_2132D9598()
{
  sub_2132D96B0();
  return sub_2132DEAB0();
}

uint64_t storeEnumTagSinglePayload for CustomSignalSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D9630 + 4 * byte_2132E0215[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2132D9664 + 4 * asc_2132E0210[v4]))();
}

uint64_t sub_2132D9664(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D966C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D9674);
  return result;
}

uint64_t sub_2132D9680(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D9688);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2132D968C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D9694(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CustomSignalSource()
{
  return &type metadata for CustomSignalSource;
}

unint64_t sub_2132D96B0()
{
  unint64_t result;

  result = qword_253F01430;
  if (!qword_253F01430)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalSource, &type metadata for CustomSignalSource);
    atomic_store(result, (unint64_t *)&qword_253F01430);
  }
  return result;
}

SiriIntentEvents::CustomSignalType_optional __swiftcall CustomSignalType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriIntentEvents::CustomSignalType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2132DEBAC();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t CustomSignalType.rawValue.getter()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000010;
  if (*v0 == 1)
    v1 = 0x63656C6553707061;
  if (*v0)
    return v1;
  else
    return 0x614C686365657073;
}

void sub_2132D97B8(unsigned __int8 *a1, char *a2)
{
  sub_2132D9B6C(*a1, *a2);
}

unint64_t sub_2132D97C8()
{
  unint64_t result;

  result = qword_254B8FA68;
  if (!qword_254B8FA68)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalType, &type metadata for CustomSignalType);
    atomic_store(result, (unint64_t *)&qword_254B8FA68);
  }
  return result;
}

void sub_2132D9804()
{
  sub_2132D9F98();
}

uint64_t sub_2132D980C(uint64_t a1)
{
  char *v1;

  return sub_2132DA088(a1, *v1);
}

void sub_2132D9814()
{
  sub_2132DA2C8();
}

SiriIntentEvents::CustomSignalType_optional sub_2132D981C(Swift::String *a1)
{
  return CustomSignalType.init(rawValue:)(*a1);
}

uint64_t sub_2132D9828@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = CustomSignalType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2132D984C()
{
  sub_2132D9A48();
  return sub_2132DEABC();
}

uint64_t sub_2132D98A8()
{
  sub_2132D9A48();
  return sub_2132DEAB0();
}

uint64_t getEnumTagSinglePayload for CustomSignalType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CustomSignalType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132D99C8 + 4 * byte_2132E0335[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2132D99FC + 4 * byte_2132E0330[v4]))();
}

uint64_t sub_2132D99FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D9A04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132D9A0CLL);
  return result;
}

uint64_t sub_2132D9A18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132D9A20);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2132D9A24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132D9A2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CustomSignalType()
{
  return &type metadata for CustomSignalType;
}

unint64_t sub_2132D9A48()
{
  unint64_t result;

  result = qword_253F01420;
  if (!qword_253F01420)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for CustomSignalType, &type metadata for CustomSignalType);
    atomic_store(result, (unint64_t *)&qword_253F01420);
  }
  return result;
}

void sub_2132D9A88(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x65756C6176;
  else
    v3 = 1701869940;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x65756C6176;
  else
    v5 = 1701869940;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 != v5 || v4 != v6)
    OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_2132D9AFC(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((a1 & 1) != 0)
    v2 = 0x746E65696C63;
  else
    v2 = 0x726576726573;
  if ((a2 & 1) != 0)
    v3 = 0x746E65696C63;
  else
    v3 = 0x726576726573;
  if (v2 != v3)
    sub_2132DEC48();
  swift_bridgeObjectRelease_n();
  OUTLINED_FUNCTION_4();
}

void sub_2132D9B6C(unsigned __int8 a1, char a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x63656C6553707061;
    else
      v3 = 0xD000000000000010;
    if (v2 == 1)
      v4 = 0xEC0000006E6F6974;
    else
      v4 = 0x80000002132E0FF0;
  }
  else
  {
    v3 = 0x614C686365657073;
    v4 = 0xED00006563697474;
  }
  if (a2)
  {
    if (a2 == 1)
      v5 = 0x63656C6553707061;
    else
      v5 = 0xD000000000000010;
    if (a2 == 1)
      v6 = 0xEC0000006E6F6974;
    else
      v6 = 0x80000002132E0FF0;
  }
  else
  {
    v5 = 0x614C686365657073;
    v6 = 0xED00006563697474;
  }
  if (v3 != v5 || v4 != v6)
    OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_2132D9C74(char a1)
{
  __asm { BR              X13 }
}

uint64_t sub_2132D9CD8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2132D9D9C + 4 * byte_2132E0468[a2]))(0x7453746E65746E69);
}

void sub_2132D9D9C(uint64_t a1)
{
  uint64_t v1;

  if (a1 != 0x7453746E65746E69 || v1 != 0xEB00000000747261)
    OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_2132D9E78(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_2132D9EDC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_2132D9F2C + 4 * byte_2132E0475[a2]))();
}

void sub_2132D9F2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (a1 != a3 || v4 != ((v3 - 32) | 0x8000000000000000))
    OUTLINED_FUNCTION_4_6();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_7_0();
}

void sub_2132D9F8C()
{
  sub_2132DA330();
}

void sub_2132D9F98()
{
  sub_2132DA2C8();
}

void sub_2132D9FA4()
{
  sub_2132DA388();
}

void sub_2132D9FC0()
{
  sub_2132D9FD8();
}

void sub_2132D9FCC()
{
  sub_2132D9FD8();
}

void sub_2132D9FD8()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_40();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

uint64_t sub_2132DA008()
{
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_0_6();
}

uint64_t sub_2132DA04C()
{
  sub_2132DEA98();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2132DA088(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_19_0();
  else
    OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_0_6();
}

void sub_2132DA0E0(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_2132DA128()
{
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_0_6();
}

void sub_2132DA1EC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2132DA230()
{
  OUTLINED_FUNCTION_15_2();
  return OUTLINED_FUNCTION_0_6();
}

void sub_2132DA280()
{
  sub_2132DA298();
}

void sub_2132DA28C()
{
  sub_2132DA298();
}

void sub_2132DA298()
{
  uint64_t v0;

  v0 = sub_2132DEC90();
  OUTLINED_FUNCTION_39(v0);
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

void sub_2132DA2C8()
{
  char v0;

  OUTLINED_FUNCTION_21();
  if (v0)
    OUTLINED_FUNCTION_19_0();
  else
    OUTLINED_FUNCTION_8_4();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

void sub_2132DA330()
{
  OUTLINED_FUNCTION_21();
  sub_2132DEA98();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

void sub_2132DA388()
{
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

void sub_2132DA3DC()
{
  sub_2132DEBAC();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_4();
}

void sub_2132DA428()
{
  sub_2132DEBAC();
  OUTLINED_FUNCTION_7_4();
  OUTLINED_FUNCTION_4();
}

void sub_2132DA468()
{
  OUTLINED_FUNCTION_40();
  sub_2132DEC9C();
  OUTLINED_FUNCTION_16_2();
  OUTLINED_FUNCTION_3_5();
}

uint64_t sub_2132DA494(char *a1, char *a2)
{
  char v2;

  sub_2132D9A88(*a1, *a2);
  return v2 & 1;
}

void sub_2132DA4B4()
{
  sub_2132D9FA4();
}

uint64_t sub_2132DA4BC()
{
  return sub_2132DA008();
}

void sub_2132DA4D4()
{
  sub_2132DA388();
}

void sub_2132DA4EC(_BYTE *a1@<X8>)
{
  char v2;

  sub_2132DA3DC();
  *a1 = v2;
}

uint64_t sub_2132DA518@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132DA424();
  *a1 = result;
  return result;
}

uint64_t sub_2132DA53C()
{
  sub_2132DA738();
  return sub_2132DECCC();
}

uint64_t sub_2132DA564()
{
  sub_2132DA738();
  return sub_2132DECD8();
}

void ConfirmationResolution.encode(to:)()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  OUTLINED_FUNCTION_10_3();
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FA70);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  v6 = *v0;
  v7 = v0[1];
  __swift_project_boxed_opaque_existential_1(v3, v3[3]);
  sub_2132DA738();
  sub_2132DECC0();
  v8 = v7 >> 60;
  if (v7 >> 60 == 7 || (_DWORD)v8 == 11 || (_DWORD)v8 == 15)
  {
    OUTLINED_FUNCTION_38();
    sub_2132DEC18();
    OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  }
  else
  {
    sub_2132CE9F4(v6, v7);
    sub_2132CF4EC();
    sub_2132DEC24();
    if (!v1)
    {
      OUTLINED_FUNCTION_38();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
    sub_2132DA774(v6, v7);
  }
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_2132DA738()
{
  unint64_t result;

  result = qword_254B8FA78;
  if (!qword_254B8FA78)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E08D8, &unk_24CF85C20);
    atomic_store(result, (unint64_t *)&qword_254B8FA78);
  }
  return result;
}

uint64_t sub_2132DA774(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xF || ((1 << (a2 >> 60)) & 0x8880) == 0)
    return sub_2132CF2B0(a1, a2);
  return a1;
}

void ConfirmationResolution.init(from:)()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_10_3();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FA80);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2132DA738();
  sub_2132DECB4();
  if (!v0)
  {
    sub_2132DEBDC();
    sub_2132DA428();
    __asm { BR              X10 }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  OUTLINED_FUNCTION_0_1();
}

void sub_2132DA900()
{
  sub_2132DA92C();
  swift_allocError();
  swift_willThrow();
  JUMPOUT(0x2132DA858);
}

unint64_t sub_2132DA92C()
{
  unint64_t result;

  result = qword_254B8FA88;
  if (!qword_254B8FA88)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0898, &unk_24CF85B90);
    atomic_store(result, (unint64_t *)&qword_254B8FA88);
  }
  return result;
}

void sub_2132DA968()
{
  ConfirmationResolution.init(from:)();
}

void sub_2132DA97C()
{
  ConfirmationResolution.encode(to:)();
}

uint64_t ConfirmationResult.parameterName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationResult.multicardinalIndexValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ConfirmationResult.intentType.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConfirmationResult.resolution.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  *a1 = v2;
  a1[1] = v3;
  return sub_2132DAA00(v2, v3);
}

uint64_t sub_2132DAA00(uint64_t a1, unint64_t a2)
{
  if ((a2 >> 60) > 0xF || ((1 << (a2 >> 60)) & 0x8880) == 0)
    return sub_2132CE9F4(a1, a2);
  return a1;
}

uint64_t ConfirmationResult.timestamp.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  v4 = OUTLINED_FUNCTION_7();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _OWORD *a7)
{
  char v13;
  char v14;
  uint64_t v15;

  OUTLINED_FUNCTION_15_1();
  v14 = v13 & 1;
  v15 = swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(a1, a2, a3, a4, a5, v14, a7);
  return v15;
}

void ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _OWORD *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_20();
  v14 = OUTLINED_FUNCTION_7();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_0();
  v18 = v17 - v16;
  *(_QWORD *)(v7 + 16) = v12;
  *(_QWORD *)(v7 + 24) = v11;
  *(_QWORD *)(v7 + 48) = v10;
  *(_QWORD *)(v7 + 56) = v9;
  *(_QWORD *)(v7 + 32) = v8;
  *(_BYTE *)(v7 + 40) = a6 & 1;
  *(_OWORD *)(v7 + 64) = *a7;
  sub_2132DEA08();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v18, v14);
  OUTLINED_FUNCTION_7_3();
}

void ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)()
{
  _QWORD *v0;
  _QWORD *v1;
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
  char v12;
  char v13;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  OUTLINED_FUNCTION_15_1();
  v13 = v12 & 1;
  OUTLINED_FUNCTION_11();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(v11, v9, v7, v5, v3, v13, v1);
  OUTLINED_FUNCTION_0_1();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  id v29[2];

  v29[1] = *(id *)MEMORY[0x24BDAC8D0];
  v15 = OUTLINED_FUNCTION_7();
  v27 = *(_QWORD *)(v15 - 8);
  v28 = v15;
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_4_0();
  v18 = v17 - v16;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_QWORD *)(v7 + 48) = a3;
  *(_QWORD *)(v7 + 56) = a4;
  *(_QWORD *)(v7 + 32) = a5;
  *(_BYTE *)(v7 + 40) = a6 & 1;
  v19 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v29[0] = 0;
  v20 = objc_msgSend(v19, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_2132DEC3C(), 0, v29);
  swift_unknownObjectRelease();
  v21 = v29[0];
  if (v20)
  {
    v22 = sub_2132DE9E4();
    v24 = v23;

    *(_QWORD *)(v7 + 64) = v22;
    *(_QWORD *)(v7 + 72) = v24;
    sub_2132DEA08();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 32))(v7 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v18, v28);
  }
  else
  {
    v25 = v21;
    sub_2132DE9C0();

    swift_willThrow();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_2_0();
  }
  return v7;
}

uint64_t type metadata accessor for ConfirmationResult()
{
  uint64_t result;

  result = qword_254B8FAE0;
  if (!qword_254B8FAE0)
    return swift_getSingletonMetadata();
  return result;
}

void ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v15;
  char v16;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_15_1();
  v16 = v15 & 1;
  swift_allocObject();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(v12, v11, v10, v9, v8, v16, a7, a8);
  OUTLINED_FUNCTION_7_3();
}

void ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_16_1(a1, a2, a3, a4, a5, a6);
  *(_OWORD *)(v8 + 64) = *v10;
  v11 = v8 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  v12 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a8, v12);
  OUTLINED_FUNCTION_7_0();
}

void ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
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
  char v14;
  char v15;

  OUTLINED_FUNCTION_10_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  OUTLINED_FUNCTION_15_1();
  v15 = v14 & 1;
  OUTLINED_FUNCTION_11();
  ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(v13, v11, v9, v7, v5, v15, v3, v1);
  OUTLINED_FUNCTION_0_1();
}

uint64_t ConfirmationResult.init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, _QWORD *a7, uint64_t a8)
{
  uint64_t v8;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16_1(a1, a2, a3, a4, a5, a6);
  v11 = (void *)objc_opt_self();
  __swift_project_boxed_opaque_existential_1(a7, a7[3]);
  v22[0] = 0;
  v12 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, sub_2132DEC3C(), 0, v22);
  swift_unknownObjectRelease();
  v13 = v22[0];
  if (v12)
  {
    v14 = sub_2132DE9E4();
    v16 = v15;

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    *(_QWORD *)(v8 + 64) = v14;
    *(_QWORD *)(v8 + 72) = v16;
    v17 = v8 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
    v18 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17, a8, v18);
  }
  else
  {
    v19 = v13;
    sub_2132DE9C0();

    swift_willThrow();
    v20 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a8, v20);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_29();
    OUTLINED_FUNCTION_2_0();
  }
  return v8;
}

uint64_t sub_2132DB0AC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132DB0E4 + 4 * byte_2132E048C[a1]))(0xD000000000000017, 0x80000002132E1150);
}

uint64_t sub_2132DB0E4()
{
  return 0x6574656D61726170;
}

uint64_t sub_2132DB108()
{
  return 0x7954746E65746E69;
}

uint64_t sub_2132DB124()
{
  return 0x6974756C6F736572;
}

uint64_t sub_2132DB144()
{
  return 0x6D617473656D6974;
}

uint64_t sub_2132DB160()
{
  unsigned __int8 *v0;

  return sub_2132DB0AC(*v0);
}

uint64_t sub_2132DB168()
{
  sub_2132DB3CC();
  return sub_2132DECCC();
}

uint64_t sub_2132DB190()
{
  sub_2132DB3CC();
  return sub_2132DECD8();
}

uint64_t ConfirmationResult.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2132DA774(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp;
  v2 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t ConfirmationResult.__deallocating_deinit()
{
  ConfirmationResult.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132DB234(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FA90);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132DB3CC();
  sub_2132DECC0();
  OUTLINED_FUNCTION_0();
  if (!v1)
  {
    sub_2132DEC00();
    OUTLINED_FUNCTION_0();
    sub_2132DB408();
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    OUTLINED_FUNCTION_12();
  }
  return OUTLINED_FUNCTION_13_1(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
}

unint64_t sub_2132DB3CC()
{
  unint64_t result;

  result = qword_254B8FA98;
  if (!qword_254B8FA98)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0848, &type metadata for ConfirmationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FA98);
  }
  return result;
}

unint64_t sub_2132DB408()
{
  unint64_t result;

  result = qword_254B8FAA0;
  if (!qword_254B8FAA0)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for ConfirmationResolution, &type metadata for ConfirmationResolution);
    atomic_store(result, (unint64_t *)&qword_254B8FAA0);
  }
  return result;
}

uint64_t ConfirmationResult.__allocating_init(from:)()
{
  uint64_t v0;

  OUTLINED_FUNCTION_15_1();
  v0 = OUTLINED_FUNCTION_11();
  ConfirmationResult.init(from:)();
  return v0;
}

void ConfirmationResult.init(from:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  OUTLINED_FUNCTION_10_3();
  v11 = v0;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_7();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FAA8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4_0();
  __swift_project_boxed_opaque_existential_1(v4, v4[3]);
  sub_2132DB3CC();
  sub_2132DECB4();
  if (v1)
  {
    OUTLINED_FUNCTION_29();
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v11 + 16) = OUTLINED_FUNCTION_14();
    *(_QWORD *)(v11 + 24) = v7;
    *(_QWORD *)(v11 + 32) = sub_2132DEBC4();
    *(_BYTE *)(v11 + 40) = v8 & 1;
    LOBYTE(v12) = 2;
    *(_QWORD *)(v11 + 48) = OUTLINED_FUNCTION_14();
    *(_QWORD *)(v11 + 56) = v9;
    sub_2132DB70C();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_30();
    *(_OWORD *)(v11 + 64) = v12;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32))(v11 + OBJC_IVAR____TtC16SiriIntentEvents18ConfirmationResult_timestamp, v2, v5);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  OUTLINED_FUNCTION_0_1();
}

unint64_t sub_2132DB70C()
{
  unint64_t result;

  result = qword_254B8FAB0;
  if (!qword_254B8FAB0)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for ConfirmationResolution, &type metadata for ConfirmationResolution);
    atomic_store(result, (unint64_t *)&qword_254B8FAB0);
  }
  return result;
}

uint64_t sub_2132DB748@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = ConfirmationResult.__allocating_init(from:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t sub_2132DB770(_QWORD *a1)
{
  return sub_2132DB234(a1);
}

uint64_t *destroy for ConfirmationResolution(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
    return (uint64_t *)sub_2132CF2B0(*result, v1);
  return result;
}

void _s16SiriIntentEvents22ConfirmationResolutionOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *a2;
    sub_2132CE9F4(*a2, a2[1]);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v3;
  }
  OUTLINED_FUNCTION_7_0();
}

uint64_t *assignWithCopy for ConfirmationResolution(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a1[1];
  v5 = a2[1];
  v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      v9 = *a2;
      sub_2132CE9F4(v9, v5);
      v10 = *a1;
      v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_2132CF2B0(v10, v11);
      return a1;
    }
    sub_2132CF2B0(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v7 = *a2;
  sub_2132CE9F4(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

uint64_t *assignWithTake for ConfirmationResolution(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_2132CF2B0(v7, v4);
      return a1;
    }
    sub_2132CF2B0(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ConfirmationResolution(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xA && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 10);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 16 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = 0;
  if (v4 >= 4)
    return v4 - 3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ConfirmationResolution(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 9)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 10;
    if (a3 >= 0xA)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xA)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (13 - a2)) | ((13 - a2) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_2132DB998(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v1) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v1) & 0xC | (v1 >> 2));
  else
    return 0;
}

_QWORD *sub_2132DB9C0(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

void type metadata accessor for ConfirmationResolution()
{
  OUTLINED_FUNCTION_27();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return type metadata accessor for ConfirmationResult();
}

uint64_t sub_2132DBA04()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ConfirmationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 120))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 128))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:resolution:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 136))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(parameterName:intentType:multicardinalIndexValue:confirmedValue:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v6 + 144))(a1, a2, a3, a4, a5, a6 & 1);
}

uint64_t dispatch thunk of ConfirmationResult.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ConfirmationResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t storeEnumTagSinglePayload for ConfirmationResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132DBB6C + 4 * byte_2132E0496[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132DBBA0 + 4 * byte_2132E0491[v4]))();
}

uint64_t sub_2132DBBA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DBBA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132DBBB0);
  return result;
}

uint64_t sub_2132DBBBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132DBBC4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132DBBC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DBBD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ConfirmationResult.CodingKeys()
{
  return &type metadata for ConfirmationResult.CodingKeys;
}

uint64_t sub_2132DBBEC(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2132DBC2C + 4 * byte_2132E049B[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2132DBC4C + 4 * byte_2132E04A0[v4]))();
}

_BYTE *sub_2132DBC2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2132DBC4C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132DBC54(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132DBC5C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2132DBC64(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2132DBC6C(_DWORD *result)
{
  *result = 0;
  return result;
}

void type metadata accessor for ConfirmationResolution.DecoderError()
{
  OUTLINED_FUNCTION_27();
}

uint64_t sub_2132DBC84(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132DBCD0 + 4 * byte_2132E04AA[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2132DBD04 + 4 * byte_2132E04A5[v4]))();
}

uint64_t sub_2132DBD04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DBD0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132DBD14);
  return result;
}

uint64_t sub_2132DBD20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132DBD28);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2132DBD2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DBD34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for ConfirmationResolution.CodingKeys()
{
  OUTLINED_FUNCTION_27();
}

unint64_t sub_2132DBD50()
{
  unint64_t result;

  result = qword_254B8FBB0;
  if (!qword_254B8FBB0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0700, &unk_24CF85C20);
    atomic_store(result, (unint64_t *)&qword_254B8FBB0);
  }
  return result;
}

unint64_t sub_2132DBD90()
{
  unint64_t result;

  result = qword_254B8FBB8;
  if (!qword_254B8FBB8)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0768, &unk_24CF85B90);
    atomic_store(result, (unint64_t *)&qword_254B8FBB8);
  }
  return result;
}

unint64_t sub_2132DBDD0()
{
  unint64_t result;

  result = qword_254B8FBC0;
  if (!qword_254B8FBC0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0820, &type metadata for ConfirmationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FBC0);
  }
  return result;
}

unint64_t sub_2132DBE10()
{
  unint64_t result;

  result = qword_254B8FBC8;
  if (!qword_254B8FBC8)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0790, &type metadata for ConfirmationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FBC8);
  }
  return result;
}

unint64_t sub_2132DBE50()
{
  unint64_t result;

  result = qword_254B8FBD0;
  if (!qword_254B8FBD0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E07B8, &type metadata for ConfirmationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FBD0);
  }
  return result;
}

unint64_t sub_2132DBE90()
{
  unint64_t result;

  result = qword_254B8FBD8;
  if (!qword_254B8FBD8)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0638, &unk_24CF85C20);
    atomic_store(result, (unint64_t *)&qword_254B8FBD8);
  }
  return result;
}

unint64_t sub_2132DBED0()
{
  unint64_t result;

  result = qword_254B8FBE0;
  if (!qword_254B8FBE0)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0660, &unk_24CF85C20);
    atomic_store(result, (unint64_t *)&qword_254B8FBE0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return sub_2132DEC48();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return sub_2132DEA98();
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return sub_2132DECA8();
}

uint64_t OUTLINED_FUNCTION_21()
{
  return sub_2132DEC90();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return sub_2132DEBE8();
}

void OUTLINED_FUNCTION_38()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 96) = 0;
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, ...)
{
  uint64_t (*v1)(char *, uint64_t);
  uint64_t v2;
  va_list va;

  va_start(va, a1);
  return v1(va, v2);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return sub_2132DEC90();
}

void sub_2132DBFF4(unsigned __int8 *a1)
{
  uint64_t v2;

  type metadata accessor for CustomSignal();
  MEMORY[0x24BDAC7A8]();
  type metadata accessor for EntityRejection();
  MEMORY[0x24BDAC7A8]();
  v2 = *a1;
  sub_2132DE990();
  swift_allocObject();
  sub_2132DE984();
  __asm { BR              X9 }
}

uint64_t sub_2132DC0D4()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for IntentStart();
  sub_2132DD430(&qword_254B8FC30, (uint64_t (*)(uint64_t))type metadata accessor for IntentStart, (uint64_t)&protocol conformance descriptor for IntentStart);
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_2_5();
  result = OUTLINED_FUNCTION_6_0();
  if (!v0)
  {
    OUTLINED_FUNCTION_1_7();
    OUTLINED_FUNCTION_5_4();
    return swift_storeEnumTagMultiPayload();
  }
  return result;
}

uint64_t IntentEventType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_4_7
                                                                     + 4 * byte_2132E0968[*v0]))(0xD000000000000013, 0x80000002132E0F30);
}

uint64_t sub_2132DC3E8()
{
  return 0x6552746E65746E69;
}

uint64_t sub_2132DC454()
{
  return 0x69536D6F74737563;
}

SiriIntentEvents::IntentEventType_optional __swiftcall IntentEventType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriIntentEvents::IntentEventType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2132DEBAC();
  result.value = swift_bridgeObjectRelease();
  v5 = 8;
  if (v3 < 8)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t IntentEventType.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_4_7_0
                                                                     + 4 * byte_2132E0970[*v0]))(0xD000000000000013, 0x80000002132E0F30);
}

uint64_t sub_2132DC508()
{
  return 0x6552746E65746E69;
}

uint64_t sub_2132DC574()
{
  return 0x69536D6F74737563;
}

void sub_2132DC594(char *a1)
{
  sub_2132D9C74(*a1);
}

unint64_t sub_2132DC5A4()
{
  unint64_t result;

  result = qword_254B8FBE8;
  if (!qword_254B8FBE8)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentEventType, &type metadata for IntentEventType);
    atomic_store(result, (unint64_t *)&qword_254B8FBE8);
  }
  return result;
}

void sub_2132DC5E0()
{
  sub_2132D9FC0();
}

void sub_2132DC5E8(uint64_t a1)
{
  char *v1;

  sub_2132DA0E0(a1, *v1);
}

void sub_2132DC5F0()
{
  sub_2132DA28C();
}

uint64_t sub_2132DC5F8()
{
  sub_2132DD3B0();
  return sub_2132DEABC();
}

uint64_t sub_2132DC654()
{
  sub_2132DD3B0();
  return sub_2132DEAB0();
}

SiriIntentEvents::IntentEventType_optional sub_2132DC6A4(Swift::String *a1)
{
  return IntentEventType.init(rawValue:)(*a1);
}

uint64_t sub_2132DC6B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = IntentEventType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for IntentEventType(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xF9)
  {
    if (a2 + 7 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 7) >> 8 < 0xFF)
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
    v5 = (*a1 | (v4 << 8)) - 8;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v5 = v6 - 8;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IntentEventType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_2132DC7A8 + 4 * byte_2132E097D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2132DC7DC + 4 * byte_2132E0978[v4]))();
}

uint64_t sub_2132DC7DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DC7E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132DC7ECLL);
  return result;
}

uint64_t sub_2132DC7F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132DC800);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2132DC804(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DC80C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntentEventType()
{
  return &type metadata for IntentEventType;
}

uint64_t initializeBufferWithCopyOfBuffer for IntentEventContent(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_2132DC888 + 4 * byte_2132E0982[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for IntentEventContent(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      result = swift_release();
      break;
    case 6:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v3 = type metadata accessor for EntityRejection();
      goto LABEL_5;
    case 7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2132CF2B0(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
      v3 = type metadata accessor for CustomSignal();
LABEL_5:
      v4 = a1 + *(int *)(v3 + 36);
      v5 = sub_2132DEA14();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for IntentEventContent()
{
  char *v0;

  v0 = (char *)sub_2132DCBBC + 4 * byte_2132E0992[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_2132DCBBC()
{
  _QWORD *v0;
  _QWORD *v1;

  *v0 = *v1;
  swift_retain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for IntentEventContent(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_2132DD030(result);
    v2 = (char *)&loc_2132DCE0C + 4 * byte_2132E099A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_2132DD030(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IntentEventContent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for IntentEventContent()
{
  uint64_t result;

  result = qword_253F01478;
  if (!qword_253F01478)
    return swift_getSingletonMetadata();
  return result;
}

_OWORD *initializeWithTake for IntentEventContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 7)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
    *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
    v13 = a2[3];
    a1[2] = a2[2];
    a1[3] = v13;
    v14 = *(int *)(type metadata accessor for CustomSignal() + 36);
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_2132DEA14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
  }
  else
  {
    if (EnumCaseMultiPayload != 6)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      return a1;
    }
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    a1[4] = a2[4];
    v9 = *(int *)(type metadata accessor for EntityRejection() + 36);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_2132DEA14();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

_OWORD *assignWithTake for IntentEventContent(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  if (a1 != a2)
  {
    sub_2132DD030((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 7)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_OWORD *)((char *)a1 + 8) = *(_OWORD *)((char *)a2 + 8);
      *((_BYTE *)a1 + 24) = *((_BYTE *)a2 + 24);
      v13 = a2[3];
      a1[2] = a2[2];
      a1[3] = v13;
      v14 = *(int *)(type metadata accessor for CustomSignal() + 36);
      v15 = (char *)a1 + v14;
      v16 = (char *)a2 + v14;
      v17 = sub_2132DEA14();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v15, v16, v17);
    }
    else
    {
      if (EnumCaseMultiPayload != 6)
      {
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        return a1;
      }
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      v8 = a2[3];
      a1[2] = a2[2];
      a1[3] = v8;
      a1[4] = a2[4];
      v9 = *(int *)(type metadata accessor for EntityRejection() + 36);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_2132DEA14();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_2132DD308()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2132DD318()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for EntityRejection();
  if (v1 <= 0x3F)
  {
    result = type metadata accessor for CustomSignal();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

unint64_t sub_2132DD3B0()
{
  unint64_t result;

  result = qword_254B8FBF0;
  if (!qword_254B8FBF0)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentEventType, &type metadata for IntentEventType);
    atomic_store(result, (unint64_t *)&qword_254B8FBF0);
  }
  return result;
}

uint64_t sub_2132DD3EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2132DD430(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199B0CB0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return sub_2132DE978();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  uint64_t v0;

  **(_QWORD **)(v0 - 88) = *(_QWORD *)(v0 - 72);
  return type metadata accessor for IntentEventContent();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  unint64_t v0;
  uint64_t v1;

  return sub_2132CF2B0(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return 0x7453746E65746E69;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  uint64_t v0;

  return v0;
}

unint64_t OUTLINED_FUNCTION_6_4()
{
  return 0xD000000000000011;
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  return sub_2132DD3EC(a1, *(_QWORD *)(v3 - 88), a3);
}

SiriIntentEvents::IntentResultType_optional __swiftcall IntentResultType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriIntentEvents::IntentResultType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2132DEBAC();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t IntentResultType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2132DD594 + 4 * byte_2132E0B40[*v0]))(0xD000000000000013, 0x80000002132E1030);
}

uint64_t sub_2132DD5C4()
{
  return 0x64656C696166;
}

void sub_2132DD5D8(char *a1)
{
  sub_2132D9E78(*a1);
}

void sub_2132DD5E4()
{
  sub_2132D9FCC();
}

void sub_2132DD5EC(uint64_t a1)
{
  char *v1;

  sub_2132DA1EC(a1, *v1);
}

void sub_2132DD5F4()
{
  sub_2132DA280();
}

SiriIntentEvents::IntentResultType_optional sub_2132DD5FC(Swift::String *a1)
{
  return IntentResultType.init(rawValue:)(*a1);
}

uint64_t sub_2132DD608@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = IntentResultType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2132DD62C()
{
  sub_2132DE908();
  return sub_2132DEABC();
}

uint64_t sub_2132DD688()
{
  sub_2132DE908();
  return sub_2132DEAB0();
}

uint64_t IntentResult.intentType.getter()
{
  swift_bridgeObjectRetain();
  return OUTLINED_FUNCTION_5();
}

void IntentResult.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 32);
}

uint64_t IntentResult.intentData.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_5();
  sub_2132CE9F4(v0, v1);
  return OUTLINED_FUNCTION_5();
}

uint64_t IntentResult.timestamp.getter()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  OUTLINED_FUNCTION_7();
  v0 = OUTLINED_FUNCTION_5();
  return v1(v0);
}

uint64_t IntentResult.__allocating_init(intentType:type:intent:)(uint64_t a1, uint64_t a2, _BYTE *a3, void *a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_5_0();
  IntentResult.init(intentType:type:intent:)(a1, a2, a3, a4);
  return v8;
}

uint64_t IntentResult.init(intentType:type:intent:)(uint64_t a1, uint64_t a2, _BYTE *a3, void *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21[2];

  v21[1] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = OUTLINED_FUNCTION_7();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v11) = *a3;
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  *(_BYTE *)(v4 + 32) = v11;
  v13 = (void *)objc_opt_self();
  v21[0] = 0;
  v14 = objc_msgSend(v13, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a4, 0, v21);
  v15 = v21[0];
  if (v14)
  {
    v16 = sub_2132DE9E4();
    v18 = v17;

    *(_QWORD *)(v4 + 40) = v16;
    *(_QWORD *)(v4 + 48) = v18;
    sub_2132DEA08();

    (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v4 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp, v12, v9);
  }
  else
  {
    v19 = v15;
    sub_2132DE9C0();

    swift_willThrow();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_2_0();
  }
  return v4;
}

uint64_t type metadata accessor for IntentResult()
{
  uint64_t result;

  result = qword_254B8FC90;
  if (!qword_254B8FC90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t IntentResult.__allocating_init(intentType:type:intent:timestamp:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  uint64_t v10;

  v10 = OUTLINED_FUNCTION_5_0();
  IntentResult.init(intentType:type:intent:timestamp:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t IntentResult.init(intentType:type:intent:timestamp:)(uint64_t a1, uint64_t a2, char *a3, void *a4, uint64_t a5)
{
  uint64_t v5;
  char v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v19[2];

  v19[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = *a3;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_BYTE *)(v5 + 32) = v8;
  v19[0] = 0;
  v9 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, a4, 0, v19);
  v10 = v19[0];
  if (v9)
  {
    v11 = sub_2132DE9E4();
    v13 = v12;

    *(_QWORD *)(v5 + 40) = v11;
    *(_QWORD *)(v5 + 48) = v13;
    v14 = v5 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp;
    v15 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a5, v15);
  }
  else
  {
    v16 = v10;
    sub_2132DE9C0();

    swift_willThrow();
    v17 = OUTLINED_FUNCTION_7();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(a5, v17);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9_2();
    OUTLINED_FUNCTION_2_0();
  }
  return v5;
}

uint64_t sub_2132DDB2C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  __int128 v4;

  BYTE8(v4) = 0;
  sub_2132DEB58();
  sub_2132DEAA4();
  swift_bridgeObjectRetain();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132DEAA4();
  *(_QWORD *)&v4 = *(unsigned __int8 *)(v0 + 32);
  sub_2132DEB64();
  sub_2132DEAA4();
  OUTLINED_FUNCTION_7();
  sub_2132CD2B4(&qword_254B8F370, MEMORY[0x24BDCE988]);
  sub_2132DEC30();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132DEAA4();
  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  sub_2132CE9F4(v2, v1);
  sub_2132DE9CC();
  sub_2132DEAA4();
  swift_bridgeObjectRelease();
  sub_2132CF2B0(v2, v1);
  sub_2132DEAA4();
  return *(_QWORD *)((char *)&v4 + 1);
}

uint64_t sub_2132DDCE8(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  char v9;

  v3 = a1 == 0x7954746E65746E69 && a2 == 0xEA00000000006570;
  if (v3 || (sub_2132DEC48() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    v6 = a1 == 1701869940 && a2 == 0xE400000000000000;
    if (v6 || (sub_2132DEC48() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    else
    {
      v7 = a1 == 0x6144746E65746E69 && a2 == 0xEA00000000006174;
      if (v7 || (sub_2132DEC48() & 1) != 0)
      {
        swift_bridgeObjectRelease();
        return 2;
      }
      else if (a1 == 0x6D617473656D6974 && a2 == 0xE900000000000070)
      {
        swift_bridgeObjectRelease();
        return 3;
      }
      else
      {
        v9 = sub_2132DEC48();
        swift_bridgeObjectRelease();
        if ((v9 & 1) != 0)
          return 3;
        else
          return 4;
      }
    }
  }
}

uint64_t sub_2132DDE80()
{
  return 4;
}

uint64_t sub_2132DDE88(char a1)
{
  return *(_QWORD *)&aIntenttytype[8 * a1];
}

uint64_t sub_2132DDEA8()
{
  char *v0;

  return sub_2132DDE88(*v0);
}

uint64_t sub_2132DDEB0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2132DDCE8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2132DDED4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2132DDE80();
  *a1 = result;
  return result;
}

uint64_t sub_2132DDEF8()
{
  sub_2132DE148();
  return sub_2132DECCC();
}

uint64_t sub_2132DDF20()
{
  sub_2132DE148();
  return sub_2132DECD8();
}

uint64_t IntentResult.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  sub_2132CF2B0(*(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
  v1 = v0 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp;
  v2 = OUTLINED_FUNCTION_7();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t IntentResult.__deallocating_deinit()
{
  IntentResult.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2132DDFBC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FC38);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132DE148();
  sub_2132DECC0();
  sub_2132DEC18();
  if (!v1)
  {
    sub_2132DE184();
    OUTLINED_FUNCTION_5_1();
    sub_2132CF4EC();
    OUTLINED_FUNCTION_5_1();
    OUTLINED_FUNCTION_7();
    sub_2132CD2B4(&qword_253F013E8, MEMORY[0x24BDCE920]);
    sub_2132DEC24();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
}

unint64_t sub_2132DE148()
{
  unint64_t result;

  result = qword_254B8FC40;
  if (!qword_254B8FC40)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0E1C, &type metadata for IntentResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FC40);
  }
  return result;
}

unint64_t sub_2132DE184()
{
  unint64_t result;

  result = qword_254B8FC48;
  if (!qword_254B8FC48)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentResultType, &type metadata for IntentResultType);
    atomic_store(result, (unint64_t *)&qword_254B8FC48);
  }
  return result;
}

uint64_t IntentResult.__allocating_init(from:)(_QWORD *a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_5_0();
  IntentResult.init(from:)(a1);
  return v2;
}

uint64_t IntentResult.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v4 = OUTLINED_FUNCTION_7();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B8FC50);
  MEMORY[0x24BDAC7A8](v10);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2132DE148();
  sub_2132DECB4();
  if (v1)
  {
    v7 = v11;
    OUTLINED_FUNCTION_9_2();
    swift_deallocPartialClassInstance();
  }
  else
  {
    v9 = v5;
    LOBYTE(v12) = 0;
    v7 = v11;
    *(_QWORD *)(v11 + 16) = sub_2132DEBDC();
    *(_QWORD *)(v11 + 24) = v8;
    sub_2132DE454();
    OUTLINED_FUNCTION_1_8();
    *(_BYTE *)(v11 + 32) = 0;
    sub_2132CF7F4();
    OUTLINED_FUNCTION_1_8();
    *(_OWORD *)(v11 + 40) = v12;
    sub_2132CD2B4(&qword_254B8F350, MEMORY[0x24BDCE960]);
    sub_2132DEBE8();
    OUTLINED_FUNCTION_1_1();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v11 + OBJC_IVAR____TtC16SiriIntentEvents12IntentResult_timestamp, v2, v4);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v7;
}

unint64_t sub_2132DE454()
{
  unint64_t result;

  result = qword_254B8FC58;
  if (!qword_254B8FC58)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentResultType, &type metadata for IntentResultType);
    atomic_store(result, (unint64_t *)&qword_254B8FC58);
  }
  return result;
}

unint64_t sub_2132DE494()
{
  unint64_t result;

  result = qword_254B8FC60;
  if (!qword_254B8FC60)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentResultType, &type metadata for IntentResultType);
    atomic_store(result, (unint64_t *)&qword_254B8FC60);
  }
  return result;
}

uint64_t sub_2132DE4D0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  result = IntentResult.__allocating_init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2132DE4F8(_QWORD *a1)
{
  return sub_2132DDFBC(a1);
}

uint64_t storeEnumTagSinglePayload for IntentResultType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132DE564 + 4 * byte_2132E0B4A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2132DE598 + 4 * byte_2132E0B45[v4]))();
}

uint64_t sub_2132DE598(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DE5A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132DE5A8);
  return result;
}

uint64_t sub_2132DE5B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132DE5BCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2132DE5C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DE5C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntentResultType()
{
  return &type metadata for IntentResultType;
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return type metadata accessor for IntentResult();
}

uint64_t sub_2132DE5EC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2132DEA14();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for IntentResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of IntentResult.__allocating_init(intentType:type:intent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of IntentResult.__allocating_init(intentType:type:intent:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of IntentResult.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of IntentResult.encode(to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of IntentResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t getEnumTagSinglePayload for IntentResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntentResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2132DE7C8 + 4 * byte_2132E0B54[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2132DE7FC + 4 * byte_2132E0B4F[v4]))();
}

uint64_t sub_2132DE7FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DE804(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2132DE80CLL);
  return result;
}

uint64_t sub_2132DE818(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2132DE820);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2132DE824(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2132DE82C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IntentResult.CodingKeys()
{
  return &type metadata for IntentResult.CodingKeys;
}

unint64_t sub_2132DE84C()
{
  unint64_t result;

  result = qword_254B8FD50;
  if (!qword_254B8FD50)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0DF4, &type metadata for IntentResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FD50);
  }
  return result;
}

unint64_t sub_2132DE88C()
{
  unint64_t result;

  result = qword_254B8FD58;
  if (!qword_254B8FD58)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0D64, &type metadata for IntentResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FD58);
  }
  return result;
}

unint64_t sub_2132DE8CC()
{
  unint64_t result;

  result = qword_254B8FD60;
  if (!qword_254B8FD60)
  {
    result = MEMORY[0x2199B0CB0](&unk_2132E0D8C, &type metadata for IntentResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254B8FD60);
  }
  return result;
}

unint64_t sub_2132DE908()
{
  unint64_t result;

  result = qword_254B8FD68;
  if (!qword_254B8FD68)
  {
    result = MEMORY[0x2199B0CB0](&protocol conformance descriptor for IntentResultType, &type metadata for IntentResultType);
    atomic_store(result, (unint64_t *)&qword_254B8FD68);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return sub_2132DEBE8();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_2132DE978()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2132DE984()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2132DE990()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2132DE99C()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2132DE9A8()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2132DE9B4()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2132DE9C0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2132DE9CC()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_2132DE9D8()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2132DE9E4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2132DE9F0()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2132DE9FC()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_2132DEA08()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2132DEA14()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2132DEA20()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2132DEA2C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2132DEA38()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2132DEA44()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2132DEA50()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2132DEA5C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2132DEA68()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2132DEA74()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2132DEA80()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2132DEA8C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2132DEA98()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2132DEAA4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2132DEAB0()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2132DEABC()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2132DEAC8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2132DEAD4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2132DEAE0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2132DEAEC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2132DEAF8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2132DEB04()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2132DEB10()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2132DEB1C()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_2132DEB28()
{
  return MEMORY[0x24BDD01E0]();
}

uint64_t sub_2132DEB34()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2132DEB40()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2132DEB4C()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_2132DEB58()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2132DEB64()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2132DEB70()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2132DEB7C()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_2132DEB88()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2132DEB94()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2132DEBA0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2132DEBAC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2132DEBB8()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2132DEBC4()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_2132DEBD0()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2132DEBDC()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2132DEBE8()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2132DEBF4()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2132DEC00()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_2132DEC0C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2132DEC18()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2132DEC24()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2132DEC30()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2132DEC3C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2132DEC48()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2132DEC54()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2132DEC60()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2132DEC6C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2132DEC78()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2132DEC84()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2132DEC90()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2132DEC9C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2132DECA8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2132DECB4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2132DECC0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2132DECCC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2132DECD8()
{
  return MEMORY[0x24BEE4A10]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
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

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

