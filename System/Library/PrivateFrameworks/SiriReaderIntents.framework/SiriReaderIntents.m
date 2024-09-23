void static MockSafariReaderData.__derived_struct_equals(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;

  if ((MEMORY[0x249572DAC]() & 1) != 0
    && (v4 = type metadata accessor for MockSafariReaderData(),
        *(unsigned __int8 *)(a1 + *(int *)(v4 + 20)) == *(unsigned __int8 *)(a2 + *(int *)(v4 + 20)))
    && ((v5 = v4, OUTLINED_FUNCTION_1(*(int *)(v4 + 24)), v8) ? (v8 = v6 == v7) : (v8 = 0),
        (v8 || (sub_2471D78AC() & 1) != 0)
     && ((OUTLINED_FUNCTION_1(*(int *)(v5 + 28)), v8) ? (v11 = v9 == v10) : (v11 = 0), !v11)))
  {
    sub_2471D78AC();
  }
  else
  {
    OUTLINED_FUNCTION_3();
  }
}

uint64_t type metadata accessor for MockSafariReaderData()
{
  uint64_t result;

  result = qword_2576794F8;
  if (!qword_2576794F8)
    return swift_getSingletonMetadata();
  return result;
}

BOOL sub_2471C93C8(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_2471C93D8()
{
  return sub_2471D78D0();
}

uint64_t sub_2471C93FC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x6C725565676170 && a2 == 0xE700000000000000;
  if (v3 || (sub_2471D78AC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000002471D85C0 || (sub_2471D78AC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = a1 == 0x6554726564616572 && a2 == 0xEA00000000007478;
    if (v6 || (sub_2471D78AC() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 2;
    }
    else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v8 = sub_2471D78AC();
      swift_bridgeObjectRelease();
      if ((v8 & 1) != 0)
        return 3;
      else
        return 4;
    }
  }
}

uint64_t sub_2471C9594()
{
  return 4;
}

uint64_t sub_2471C959C()
{
  sub_2471D78C4();
  sub_2471D78D0();
  return sub_2471D78DC();
}

uint64_t sub_2471C95E0()
{
  return 0;
}

uint64_t sub_2471C95EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2471C9624 + 4 * byte_2471D7DB0[a1]))(0xD000000000000015, 0x80000002471D85C0);
}

uint64_t sub_2471C9624()
{
  return 0x6C725565676170;
}

uint64_t sub_2471C963C()
{
  return 0x6554726564616572;
}

uint64_t sub_2471C9658()
{
  return 0x656C61636F6CLL;
}

BOOL sub_2471C966C(char *a1, char *a2)
{
  return sub_2471C93C8(*a1, *a2);
}

uint64_t sub_2471C9678()
{
  return sub_2471C959C();
}

uint64_t sub_2471C9680()
{
  return sub_2471C93D8();
}

uint64_t sub_2471C9688()
{
  sub_2471D78C4();
  sub_2471D78D0();
  return sub_2471D78DC();
}

uint64_t sub_2471C96C8()
{
  unsigned __int8 *v0;

  return sub_2471C95EC(*v0);
}

uint64_t sub_2471C96D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2471C93FC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2471C96F4()
{
  return sub_2471C95E0();
}

uint64_t sub_2471C9710@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471C9594();
  *a1 = result;
  return result;
}

uint64_t sub_2471C9734()
{
  sub_2471C9974();
  return sub_2471D7900();
}

uint64_t sub_2471C975C()
{
  sub_2471C9974();
  return sub_2471D790C();
}

uint64_t MockSafariReaderData.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679478);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v7 = v6 - v5;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471C9974();
  sub_2471D78F4();
  sub_2471D7288();
  sub_2471C9C9C(&qword_257679488, MEMORY[0x24BDCDAE0]);
  sub_2471D7894();
  if (!v1)
  {
    type metadata accessor for MockSafariReaderData();
    sub_2471D7888();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_2();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v7, v3);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957373C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
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

unint64_t sub_2471C9974()
{
  unint64_t result;

  result = qword_257679480;
  if (!qword_257679480)
  {
    result = MEMORY[0x249573754](&unk_2471D7F6C, &type metadata for MockSafariReaderData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257679480);
  }
  return result;
}

uint64_t MockSafariReaderData.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = sub_2471D7288();
  v19 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v20 = v5 - v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679490);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v6 = (int *)type metadata accessor for MockSafariReaderData();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_0();
  v9 = v8 - v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2471C9974();
  sub_2471D78E8();
  if (v21)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v22 = (uint64_t)a1;
  sub_2471C9C9C(&qword_257679498, MEMORY[0x24BDCDB10]);
  sub_2471D7870();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32))(v9, v20, v3);
  *(_BYTE *)(v9 + v6[5]) = sub_2471D7864() & 1;
  v10 = sub_2471D7858();
  v11 = (uint64_t *)(v9 + v6[6]);
  *v11 = v10;
  v11[1] = v12;
  v13 = sub_2471D7858();
  v15 = v14;
  OUTLINED_FUNCTION_4();
  v16 = (uint64_t *)(v9 + v6[7]);
  *v16 = v13;
  v16[1] = v15;
  sub_2471C9CDC(v9, a2);
  __swift_destroy_boxed_opaque_existential_1(v22);
  return sub_2471C9D20(v9);
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

uint64_t sub_2471C9C9C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2471D7288();
    result = MEMORY[0x249573754](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2471C9CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MockSafariReaderData();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471C9D20(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MockSafariReaderData();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2471C9D5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MockSafariReaderData.init(from:)(a1, a2);
}

uint64_t sub_2471C9D70(_QWORD *a1)
{
  return MockSafariReaderData.encode(to:)(a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for MockSafariReaderData(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2471D7288();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (_QWORD *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = (_QWORD *)((char *)a1 + v12);
    v14 = (_QWORD *)((char *)a2 + v12);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for MockSafariReaderData(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2471D7288();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
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

  v6 = sub_2471D7288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_2471D7288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2471D7288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for MockSafariReaderData(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_2471D7288();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for MockSafariReaderData()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_2471CA0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7288();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    __swift_getEnumTagSinglePayload(a1, a2, v4);
  else
    OUTLINED_FUNCTION_3();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for MockSafariReaderData()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2471CA170(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;

  result = sub_2471D7288();
  if (*(_DWORD *)(*(_QWORD *)(result - 8) + 84) == a3)
    return __swift_storeEnumTagSinglePayload(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2471CA1F4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2471D7288();
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

uint64_t getEnumTagSinglePayload for MockSafariReaderData.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MockSafariReaderData.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2471CA354 + 4 * byte_2471D7DB9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2471CA388 + 4 * byte_2471D7DB4[v4]))();
}

uint64_t sub_2471CA388(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471CA390(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2471CA398);
  return result;
}

uint64_t sub_2471CA3A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2471CA3ACLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2471CA3B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471CA3B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471CA3C4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2471CA3D0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MockSafariReaderData.CodingKeys()
{
  return &type metadata for MockSafariReaderData.CodingKeys;
}

unint64_t sub_2471CA3EC()
{
  unint64_t result;

  result = qword_257679598;
  if (!qword_257679598)
  {
    result = MEMORY[0x249573754](&unk_2471D7F44, &type metadata for MockSafariReaderData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257679598);
  }
  return result;
}

unint64_t sub_2471CA42C()
{
  unint64_t result;

  result = qword_2576795A0;
  if (!qword_2576795A0)
  {
    result = MEMORY[0x249573754](&unk_2471D7EB4, &type metadata for MockSafariReaderData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576795A0);
  }
  return result;
}

unint64_t sub_2471CA46C()
{
  unint64_t result;

  result = qword_2576795A8;
  if (!qword_2576795A8)
  {
    result = MEMORY[0x249573754](&unk_2471D7EDC, &type metadata for MockSafariReaderData.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2576795A8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return sub_2471D787C();
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v1 - 104), *(_QWORD *)(v1 - 112));
}

void sub_2471CA4F8()
{
  strcpy((char *)&qword_257679970, "ListenToPage");
  algn_257679978[5] = 0;
  *(_WORD *)&algn_257679978[6] = -5120;
}

void sub_2471CA524()
{
  strcpy((char *)&qword_257679980, "StartReading");
  algn_257679988[5] = 0;
  *(_WORD *)&algn_257679988[6] = -5120;
}

uint64_t sub_2471CA550(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, __int128 *a6)
{
  uint64_t v6;
  _QWORD *v12;

  sub_2471CF4EC(a1, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_entity, &qword_257679C98);
  v12 = (_QWORD *)(v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_locale);
  *v12 = a2;
  v12[1] = a3;
  sub_2471CF518(a4, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker);
  sub_2471CF4EC(a5, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, &qword_257679C28);
  sub_2471CF518(a6, v6 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState);
  return v6;
}

void sub_2471CA5FC()
{
  os_log_type_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  OUTLINED_FUNCTION_8();
  v3 = v2;
  v4 = sub_2471D742C();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OUTLINED_FUNCTION_14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257679460 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v7, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_29((uint64_t)v10, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v6, v3, v4);
  v12 = OUTLINED_FUNCTION_68();
  v13 = sub_2471D7798();
  if (OUTLINED_FUNCTION_48(v13))
  {
    v14 = OUTLINED_FUNCTION_2_0();
    v20 = v8;
    v15 = (uint8_t *)v14;
    v19 = OUTLINED_FUNCTION_2_0();
    v22 = v19;
    *(_DWORD *)v15 = 136315138;
    v18[1] = v15 + 4;
    sub_2471CF478(&qword_257679C90, (uint64_t (*)(uint64_t))MEMORY[0x24BE98DD0], MEMORY[0x24BE98DE0]);
    v16 = sub_2471D78A0();
    v21 = sub_2471D43D0(v16, v17, &v22);
    sub_2471D77E0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_26((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    OUTLINED_FUNCTION_21(&dword_2471C7000, v12, v0, "ReadThisFlow.on input: %s", v15);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_26((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));

  OUTLINED_FUNCTION_38((uint64_t)v10, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2471CA810(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[27] = a1;
  v2[28] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C80);
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = OUTLINED_FUNCTION_12();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C88);
  v2[32] = OUTLINED_FUNCTION_12();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C00);
  v2[33] = v4;
  v2[34] = *(_QWORD *)(v4 - 8);
  v2[35] = OUTLINED_FUNCTION_12();
  v5 = OUTLINED_FUNCTION_14();
  v2[36] = v5;
  v2[37] = *(_QWORD *)(v5 - 8);
  v2[38] = OUTLINED_FUNCTION_54();
  v2[39] = OUTLINED_FUNCTION_54();
  v2[40] = OUTLINED_FUNCTION_54();
  v2[41] = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CA8D0()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v22;

  if (qword_257679460 != -1)
    swift_once();
  v1 = *(NSObject **)(v0 + 328);
  v2 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 296);
  *(_QWORD *)(v0 + 336) = __swift_project_value_buffer(v2, (uint64_t)qword_25767AA90);
  v4 = *(void (**)(uint64_t))(v3 + 16);
  *(_QWORD *)(v0 + 344) = v4;
  v5 = OUTLINED_FUNCTION_55();
  v4(v5);
  sub_2471D7624();
  v6 = OUTLINED_FUNCTION_70();
  if (OUTLINED_FUNCTION_10(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v1, (os_log_type_t)v2, "Entering ReadThisFlow execute", v7);
    OUTLINED_FUNCTION_0_0();
  }
  v8 = *(_QWORD *)(v0 + 328);
  v9 = *(_QWORD *)(v0 + 288);
  v10 = *(_QWORD *)(v0 + 296);

  v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  *(_QWORD *)(v0 + 352) = v11;
  v11(v8, v9);
  sub_2471CC484();
  if ((v12 & 1) == 0)
  {
    v15 = OUTLINED_FUNCTION_55();
    v4(v15);
    v16 = sub_2471D7624();
    v17 = sub_2471D7798();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      *(_WORD *)v18 = 0;
      OUTLINED_FUNCTION_13(&dword_2471C7000, v16, v17, "Safari not frontmost app, not reading", v18);
      OUTLINED_FUNCTION_0_0();
    }
    v19 = *(_QWORD *)(v0 + 312);
    v20 = *(_QWORD *)(v0 + 288);

    v11(v19, v20);
    sub_2471CB70C(0, (uint64_t *)(v0 + 16));
    OUTLINED_FUNCTION_39((_QWORD *)(v0 + 16));
    goto LABEL_11;
  }
  v14 = *(_QWORD *)(v0 + 256);
  v13 = *(_QWORD *)(v0 + 264);
  sub_2471CC014();
  if (__swift_getEnumTagSinglePayload(v14, 1, v13) == 1)
  {
    sub_2471CF4B4(*(_QWORD *)(v0 + 256), &qword_257679C88);
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_39((_QWORD *)(v0 + 56));
LABEL_11:
    sub_2471D73CC();
    OUTLINED_FUNCTION_74();
    OUTLINED_FUNCTION_17();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_28();
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_78();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  OUTLINED_FUNCTION_61(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 256), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 272) + 32));
  sub_2471D7768();
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 360) = v22;
  *v22 = v0;
  v22[1] = sub_2471CAB90;
  OUTLINED_FUNCTION_22();
  return sub_2471D7774();
}

uint64_t sub_2471CAB90()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CABD4()
{
  uint64_t v0;
  void *v1;
  int v2;
  NSObject *v3;
  id v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(void **)(v0 + 176);
  v2 = *(unsigned __int8 *)(v0 + 184);
  if (v2 == 255)
  {
    v15 = *(_QWORD *)(v0 + 272);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
    OUTLINED_FUNCTION_62();
    OUTLINED_FUNCTION_39((_QWORD *)(v0 + 96));
    sub_2471D73CC();
    OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    OUTLINED_FUNCTION_74();
  }
  else
  {
    if (v2 != 5)
    {
      sub_2471CF450(*(id *)(v0 + 176), v2);
      v16 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 368) = v16;
      *v16 = v0;
      v16[1] = sub_2471CAEC0;
      OUTLINED_FUNCTION_22();
      return sub_2471D7774();
    }
    v3 = *(NSObject **)(v0 + 320);
    (*(void (**)(NSObject *, _QWORD, _QWORD))(v0 + 344))(v3, *(_QWORD *)(v0 + 336), *(_QWORD *)(v0 + 288));
    sub_2471CF464(v1, 5);
    v4 = v1;
    sub_2471D7624();
    v5 = OUTLINED_FUNCTION_70();
    v6 = os_log_type_enabled(v3, v5);
    v7 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
    v8 = *(_QWORD *)(v0 + 320);
    v9 = *(_QWORD *)(v0 + 288);
    if (v6)
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      v22 = OUTLINED_FUNCTION_2_0();
      *(_DWORD *)v10 = 136315138;
      v11 = objc_msgSend(v4, sel_description);
      v12 = sub_2471D76CC();
      v14 = v13;

      sub_2471CF450(v1, 5);
      *(_QWORD *)(v0 + 208) = sub_2471D43D0(v12, v14, &v22);
      OUTLINED_FUNCTION_66();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_21(&dword_2471C7000, v3, v5, "connection: %s", v10);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_15();

    v7(v8, v9);
    v18 = *(_QWORD *)(v0 + 272);
    v20 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 248);
    v21 = *(_QWORD *)(v0 + 232);
    sub_2471CB160();
    sub_2471CB440();
    sub_2471D73D8();
    OUTLINED_FUNCTION_15();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
    OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8));
  }
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_78();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471CAEC0()
{
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CAF04()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  uint64_t v9;
  NSObject *v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  OUTLINED_FUNCTION_59();
  v1 = *(_QWORD *)(v0 + 336);
  v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 344);
  v3 = *(_QWORD *)(v0 + 304);
  v4 = *(_QWORD *)(v0 + 288);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 232));
  v2(v3, v1, v4);
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_58();
  v5 = OUTLINED_FUNCTION_68();
  v6 = sub_2471D7798();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    v8 = (_QWORD *)OUTLINED_FUNCTION_2_0();
    *(_DWORD *)v7 = 138412290;
    OUTLINED_FUNCTION_58();
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 200) = v9;
    OUTLINED_FUNCTION_66();
    *v8 = v9;
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_21(&dword_2471C7000, v5, v6, "Error: %@", v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_35();
  v10 = v5;
  v11 = *(void (**)(uint64_t, uint64_t))(v0 + 352);
  v12 = *(_QWORD *)(v0 + 304);
  v13 = *(_QWORD *)(v0 + 288);
  v17 = *(_QWORD *)(v0 + 280);
  v15 = *(_QWORD *)(v0 + 264);
  v14 = *(_QWORD *)(v0 + 272);

  v11(v12, v13);
  OUTLINED_FUNCTION_58();
  sub_2471CB440();
  OUTLINED_FUNCTION_35();
  sub_2471CB70C(0, (uint64_t *)(v0 + 136));
  OUTLINED_FUNCTION_39((_QWORD *)(v0 + 136));
  sub_2471D73CC();
  OUTLINED_FUNCTION_35();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v17, v15);
  __swift_destroy_boxed_opaque_existential_1(v0 + 136);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_78();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471CB0EC()
{
  type metadata accessor for ReadThisFlow(0);
  sub_2471CF478(&qword_257679C78, type metadata accessor for ReadThisFlow, (uint64_t)&unk_2471D8094);
  return sub_2471D72F4();
}

void sub_2471CB160()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_8();
  v23 = v0;
  v2 = OUTLINED_FUNCTION_14();
  v24 = *(_QWORD *)(v2 - 8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471D72AC();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84EE8]), sel_init);
  sub_2471D72A0();
  v6 = sub_2471D7294();
  v8 = v7;
  OUTLINED_FUNCTION_72(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_2471CF30C(v6, v8, v5, (SEL *)&selRef_setCardSectionId_);
  sub_2471CF364(0xD000000000000016, 0x80000002471D8820, v5);
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE811A0]), sel_init);
  sub_2471CF418(0, &qword_257679C60);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C68);
  v10 = OUTLINED_FUNCTION_47();
  v22 = xmmword_2471D7FD0;
  *(_OWORD *)(v10 + 16) = xmmword_2471D7FD0;
  *(_QWORD *)(v10 + 32) = v5;
  OUTLINED_FUNCTION_65(v10);
  v11 = v5;
  v12 = (void *)sub_2471D778C();
  swift_bridgeObjectRelease();

  v13 = objc_allocWithZone(MEMORY[0x24BE81858]);
  v14 = v12;
  v15 = objc_msgSend(v13, sel_init);
  v16 = OUTLINED_FUNCTION_47();
  *(_OWORD *)(v16 + 16) = v22;
  *(_QWORD *)(v16 + 32) = v14;
  OUTLINED_FUNCTION_65(v16);
  sub_2471CF3A8(v25, v15);
  v17 = OUTLINED_FUNCTION_39((_QWORD *)(v23
                                                  + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker));
  sub_2471D7408();
  if (qword_257679460 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v2, (uint64_t)qword_25767AA90);
  v19 = v24;
  OUTLINED_FUNCTION_29((uint64_t)v4, v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 16));
  OUTLINED_FUNCTION_68();
  v20 = OUTLINED_FUNCTION_70();
  if (OUTLINED_FUNCTION_79(v17))
  {
    v21 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    *(_WORD *)v21 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v17, v20, "Presented UI and returning from ReadThisFlow", v21);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_38((uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8));
  OUTLINED_FUNCTION_1_0();
}

void sub_2471CB440()
{
  void *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_8();
  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C50);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v18[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471D73A8();
  OUTLINED_FUNCTION_52();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_7();
  if (v1)
  {
    sub_2471D733C();
    v17 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    v4 = sub_2471D7378();
    OUTLINED_FUNCTION_60(v4, *MEMORY[0x24BE97878]);
    if (qword_257679448 != -1)
      swift_once();
    v5 = *MEMORY[0x24BE97068];
    v6 = sub_2471D7354();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v3, v5, v6);
    v7 = OUTLINED_FUNCTION_57();
    __swift_storeEnumTagSinglePayload(v7, v8, v9, v6);
    *(_QWORD *)(OUTLINED_FUNCTION_47() + 16) = v1;
    swift_bridgeObjectRetain();
    v10 = v1;
    sub_2471D736C();
  }
  else
  {
    sub_2471D733C();
    __swift_project_boxed_opaque_existential_1(v18, v19);
    v11 = sub_2471D7378();
    OUTLINED_FUNCTION_60(v11, *MEMORY[0x24BE97888]);
    if (qword_257679448 != -1)
      swift_once();
    v12 = *MEMORY[0x24BE970E8];
    v13 = sub_2471D7354();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v3, v12, v13);
    v14 = OUTLINED_FUNCTION_57();
    __swift_storeEnumTagSinglePayload(v14, v15, v16, v13);
    swift_bridgeObjectRetain();
    sub_2471D736C();
  }
  sub_2471D7348();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2471CB6C0(int a1, id a2)
{
  id v2;

  v2 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C58);
  sub_2471D76D8();
  return sub_2471D7360();
}

uint64_t sub_2471CB70C@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  uint64_t v11;
  _BYTE v12[40];

  sub_2471CF1AC(v2 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, (uint64_t)&v10, &qword_257679C28);
  if (v11)
  {
    sub_2471CF518(&v10, (uint64_t)v12);
  }
  else
  {
    sub_2471CF4B4((uint64_t)&v10, &qword_257679C28);
    sub_2471D7420();
  }
  sub_2471CF1D8((uint64_t)v12, (uint64_t)&v10);
  v5 = OUTLINED_FUNCTION_47();
  *(_BYTE *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v2;
  v6 = sub_2471D72DC();
  OUTLINED_FUNCTION_42();
  swift_retain();
  v7 = sub_2471D72D0();
  v8 = MEMORY[0x24BE960C0];
  a2[3] = v6;
  a2[4] = v8;
  *a2 = v7;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_2471CB804(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v3 + 272) = a2;
  *(_QWORD *)(v3 + 136) = a1;
  *(_QWORD *)(v3 + 144) = a3;
  v4 = sub_2471D7630();
  *(_QWORD *)(v3 + 152) = v4;
  *(_QWORD *)(v3 + 160) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 168) = swift_task_alloc();
  *(_QWORD *)(v3 + 176) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257679C40);
  *(_QWORD *)(v3 + 184) = swift_task_alloc();
  sub_2471D75E8();
  *(_QWORD *)(v3 + 192) = swift_task_alloc();
  v5 = sub_2471D73F0();
  *(_QWORD *)(v3 + 200) = v5;
  *(_QWORD *)(v3 + 208) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 216) = swift_task_alloc();
  *(_QWORD *)(v3 + 224) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2471CB8F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint8_t *v6;
  NSObject *v7;
  os_log_type_t v8;
  _WORD *v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _OWORD v14[2];
  uint64_t v15;

  if (sub_2471D2364(*(_BYTE *)(v0 + 272)) == 0xD000000000000015 && v2 == 0x80000002471D8840)
  {
    v3 = swift_bridgeObjectRelease();
  }
  else
  {
    v4 = sub_2471D78AC();
    v3 = OUTLINED_FUNCTION_56();
    if ((v4 & 1) == 0)
    {
      v12 = *(_QWORD *)(v0 + 192);
      v15 = 0;
      memset(v14, 0, sizeof(v14));
      sub_2471D75DC();
      type metadata accessor for ReadThisCATProvider();
      OUTLINED_FUNCTION_42();
      *(_QWORD *)(v0 + 232) = sub_2471D20A0(v12, (uint64_t)v14);
      v13 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 240) = v13;
      *v13 = v0;
      v13[1] = sub_2471CBAD8;
      return sub_2471D2214(*(_QWORD *)(v0 + 224), *(_BYTE *)(v0 + 272), MEMORY[0x24BEE4AF8]);
    }
  }
  if (qword_257679460 != -1)
    v3 = swift_once();
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(uint8_t **)(v0 + 160);
  OUTLINED_FUNCTION_9(v3, (uint64_t)qword_25767AA90);
  v7 = sub_2471D7624();
  v8 = sub_2471D77B0();
  if (OUTLINED_FUNCTION_10(v8))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_69(v9);
    OUTLINED_FUNCTION_13(&dword_2471C7000, v7, (os_log_type_t)v5, "Defaulting to generic error template response", v6);
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 256) = v10;
  *v10 = v0;
  v10[1] = sub_2471CBC00;
  return sub_2471D73B4();
}

uint64_t sub_2471CBAD8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_22();
  return swift_task_switch();
}

uint64_t sub_2471CBB40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_59();
  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 184);
  OUTLINED_FUNCTION_25(*(_QWORD *)(v0 + 144));
  v3 = OUTLINED_FUNCTION_77();
  v4 = OUTLINED_FUNCTION_43(v3);
  *(_OWORD *)(v0 + 72) = 0u;
  *(_QWORD *)(v0 + 88) = 0;
  *(_OWORD *)(v0 + 56) = 0u;
  OUTLINED_FUNCTION_76(v4, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_19();
  sub_2471CF4B4(v0 + 56, (uint64_t *)&unk_257679DA0);
  sub_2471CF4B4(v2, (uint64_t *)&unk_257679C40);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  return OUTLINED_FUNCTION_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2471CBC00()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_33();
  *v2 = *v1;
  *(_QWORD *)(v3 + 264) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CBC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_59();
  v1 = *(_QWORD *)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 184);
  OUTLINED_FUNCTION_25(*(_QWORD *)(v0 + 144));
  v3 = OUTLINED_FUNCTION_77();
  v4 = OUTLINED_FUNCTION_43(v3);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  OUTLINED_FUNCTION_76(v4, MEMORY[0x24BE99088]);
  OUTLINED_FUNCTION_19();
  sub_2471CF4B4(v0 + 16, (uint64_t *)&unk_257679DA0);
  sub_2471CF4B4(v2, (uint64_t *)&unk_257679C40);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  return OUTLINED_FUNCTION_11(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2471CBD10()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  NSObject *v20;
  os_log_type_t v21;
  _WORD *v22;
  _QWORD *v23;
  uint64_t v25;

  swift_release();
  if (qword_257679460 != -1)
    swift_once();
  v1 = (void *)v0[31];
  v3 = v0[20];
  v2 = v0[21];
  v4 = v0[19];
  v5 = __swift_project_value_buffer(v4, (uint64_t)qword_25767AA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  v6 = v1;
  v7 = v1;
  v8 = sub_2471D7624();
  v9 = sub_2471D77B0();
  v10 = os_log_type_enabled(v8, v9);
  v11 = v0[20];
  if (v10)
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    v25 = OUTLINED_FUNCTION_2_0();
    *(_DWORD *)v12 = 136315138;
    swift_getErrorValue();
    v13 = sub_2471D78B8();
    v0[16] = sub_2471D43D0(v13, v14, &v25);
    sub_2471D77E0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_21(&dword_2471C7000, v8, v9, "Could not get CAT template: %s", v12);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  v15 = OUTLINED_FUNCTION_55();
  v17 = v16(v15);
  if (qword_257679460 != -1)
    v17 = swift_once();
  v18 = v0[19];
  v19 = (uint8_t *)v0[20];
  OUTLINED_FUNCTION_9(v17, (uint64_t)qword_25767AA90);
  v20 = sub_2471D7624();
  v21 = sub_2471D77B0();
  if (OUTLINED_FUNCTION_10(v21))
  {
    v22 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_69(v22);
    OUTLINED_FUNCTION_13(&dword_2471C7000, v20, (os_log_type_t)v18, "Defaulting to generic error template response", v19);
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
  v23 = (_QWORD *)swift_task_alloc();
  v0[32] = v23;
  *v23 = v0;
  v23[1] = sub_2471CBC00;
  return sub_2471D73B4();
}

uint64_t sub_2471CBFC0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_27();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2471CC014()
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
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  OUTLINED_FUNCTION_8();
  v4 = v3;
  v5 = sub_2471D72C4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_18();
  v7 = sub_2471D72AC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_50();
  sub_2471CF418(0, &qword_257679BF8);
  v9 = sub_2471CC2E8();
  if (v9)
  {
    v10 = v9;
    v25 = v0;
    v26 = v6;
    if (qword_257679440 != -1)
      swift_once();
    v11 = qword_257679970;
    v12 = *(_QWORD *)algn_257679978;
    v13 = objc_allocWithZone(MEMORY[0x24BE5FBB0]);
    swift_bridgeObjectRetain();
    v14 = sub_2471CE964(v11, v12, 0, 0, 0, 0, 0);
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE5FFA0]), sel_init);
    OUTLINED_FUNCTION_71(1769105747, 0xE400000000000000);
    objc_msgSend(v15, sel_setSource_, 3);
    sub_2471D72A0();
    v16 = sub_2471D7294();
    v18 = v17;
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v2, v7);
    OUTLINED_FUNCTION_71(v16, v18);
    sub_2471CF418(0, &qword_257679C08);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v25 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState), *(_QWORD *)(v25 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState + 24));
    sub_2471D7390();
    sub_2471D72B8();
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v1, v5);
    v19 = sub_2471CC358();
    objc_msgSend(v15, sel_setEnvironment_, v19);

    sub_2471CC3C8((uint64_t)v14, (uint64_t)v15);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257679C00);
    v20 = OUTLINED_FUNCTION_57();
    __swift_storeEnumTagSinglePayload(v20, v21, v22, v23);
    OUTLINED_FUNCTION_1_0();
  }
  else
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C00);
    __swift_storeEnumTagSinglePayload(v4, 1, 1, v24);
  }
}

id sub_2471CC2E8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2471D76C0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  return v2;
}

id sub_2471CC358()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2471D76C0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithLocaleIdentifier_, v1);

  return v2;
}

uint64_t sub_2471CC3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C10);
  MEMORY[0x24BDAC7A8](v5);
  v10 = v2;
  v11 = a1;
  v12 = a2;
  (*(void (**)(_BYTE *, _QWORD))(v7 + 104))(&v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], *MEMORY[0x24BEE6CA0]);
  return sub_2471D7780();
}

void sub_2471CC484()
{
  uint64_t v0;
  uint64_t *v1;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _WORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  OUTLINED_FUNCTION_8();
  v2 = OUTLINED_FUNCTION_14();
  v3 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  v70 = v3;
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_31();
  v7 = v5 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v68 = (uint64_t)&v60 - v9;
  v10 = sub_2471D7654();
  v11 = *(_QWORD *)(v10 - 8);
  v62 = v10;
  v63 = v11;
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v12);
  v61 = (uint64_t)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_2471D76B4();
  v67 = *(_QWORD *)(v65 - 8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_31();
  v64 = v15 - v16;
  MEMORY[0x24BDAC7A8](v17);
  v66 = (char *)&v60 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679BE0);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_50();
  v20 = sub_2471D7678();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_51();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679BE8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_31();
  v25 = (uint8_t *)(v23 - v24);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v60 - v27;
  sub_2471D7510();
  OUTLINED_FUNCTION_42();
  sub_2471D7504();
  v29 = MEMORY[0x249573028]();
  swift_release();
  if (v29)
  {
    sub_2471D760C();
    v30 = sub_2471D7600();
    *v1 = v29;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v21 + 104))(v1, *MEMORY[0x24BEA59D0], v20);
    v31 = sub_2471D76A8();
    __swift_storeEnumTagSinglePayload(v0, 1, 1, v31);
    swift_retain();
    sub_2471D75F4();
    sub_2471CF4B4(v0, &qword_257679BE0);
    OUTLINED_FUNCTION_38((uint64_t)v1, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
    sub_2471CF1AC((uint64_t)v28, (uint64_t)v25, &qword_257679BE8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v67 = v30;
      v32 = *(_QWORD *)v25;
      if (qword_257679460 != -1)
        swift_once();
      v33 = __swift_project_value_buffer(v69, (uint64_t)qword_25767AA90);
      v34 = v70;
      v35 = v68;
      OUTLINED_FUNCTION_53(v68, v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v70 + 16));
      OUTLINED_FUNCTION_67();
      OUTLINED_FUNCTION_67();
      v36 = sub_2471D7624();
      v37 = sub_2471D77B0();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)OUTLINED_FUNCTION_2_0();
        v39 = OUTLINED_FUNCTION_2_0();
        v71 = v32;
        v72 = v39;
        v65 = v29;
        v66 = v28;
        *(_DWORD *)v38 = 136315138;
        OUTLINED_FUNCTION_67();
        __swift_instantiateConcreteTypeFromMangledName(qword_257679B68);
        v40 = sub_2471D76D8();
        v71 = sub_2471D43D0(v40, v41, &v72);
        OUTLINED_FUNCTION_66();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_6();
        OUTLINED_FUNCTION_21(&dword_2471C7000, v36, v37, "checkForSafariOnScreen | Received a failure: %s -> nil", v38);
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_0_0();
      }

      swift_release();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_45(v35, *(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
      sub_2471CF4B4((uint64_t)v28, &qword_257679BE8);
    }
    else
    {
      v49 = (uint64_t)v66;
      v48 = v67;
      v50 = OUTLINED_FUNCTION_55();
      v51 = v65;
      OUTLINED_FUNCTION_53(v50, v52, v53);
      v54 = v64;
      OUTLINED_FUNCTION_53(v64, v49, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 16));
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v48 + 88))(v54, v51) == *MEMORY[0x24BEA5AA8])
      {
        OUTLINED_FUNCTION_45(v54, *(uint64_t (**)(uint64_t, uint64_t))(v48 + 96));
        v55 = v62;
        v56 = v61;
        v57 = OUTLINED_FUNCTION_61(v61, v54, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v63 + 32));
        if (qword_257679450 != -1)
          v57 = swift_once();
        v58 = qword_25767AA80;
        MEMORY[0x24BDAC7A8](v57);
        *(&v60 - 2) = v56;
        swift_bridgeObjectRetain();
        sub_2471CCBF0((void (*)(_QWORD *__return_ptr, _QWORD))sub_2471CF150, (uint64_t)(&v60 - 4), v58);
        swift_bridgeObjectRelease();
        swift_release();
        OUTLINED_FUNCTION_64();
        OUTLINED_FUNCTION_56();
        OUTLINED_FUNCTION_45((uint64_t)v66, *(uint64_t (**)(uint64_t, uint64_t))(v67 + 8));
        sub_2471CF4B4((uint64_t)v28, &qword_257679BE8);
        (*(void (**)(uint64_t, uint64_t))(v63 + 8))(v56, v55);
      }
      else
      {
        OUTLINED_FUNCTION_64();
        swift_release();
        v59 = *(void (**)(uint64_t, uint64_t))(v48 + 8);
        v59(v49, v51);
        sub_2471CF4B4((uint64_t)v28, &qword_257679BE8);
        v59(v54, v51);
      }
    }
  }
  else
  {
    if (qword_257679460 != -1)
      swift_once();
    v42 = v69;
    v43 = __swift_project_value_buffer(v69, (uint64_t)qword_25767AA90);
    v44 = v70;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v70 + 16))(v7, v43, v42);
    v45 = sub_2471D7624();
    v46 = sub_2471D77A4();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_69(v47);
      OUTLINED_FUNCTION_13(&dword_2471C7000, v45, v46, "checkForSafariOnScreen UsoEntityBuilder_common_App | unable to convert entity builder to entity", v25);
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_26(v7, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
  }
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2471CCAF8@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t result;
  uint64_t v16;

  v4 = sub_2471D769C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v8 = a1[1];
  sub_2471D7648();
  v10 = sub_2471D7690();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (v10 == v9 && v12 == v8)
    v14 = 1;
  else
    v14 = sub_2471D78AC();
  result = swift_bridgeObjectRelease();
  *a2 = v14 & 1;
  return result;
}

uint64_t sub_2471CCBF0(void (*a1)(_QWORD *__return_ptr, _QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  void (*v22)(_QWORD *__return_ptr, _QWORD);
  uint64_t v23;
  int64_t v24;
  _QWORD v25[2];
  uint64_t v26;

  v23 = a3 + 56;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a3 + 56);
  v24 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  v11 = MEMORY[0x24BEE4AF8];
  v22 = a1;
  while (1)
  {
    if (v8)
    {
      v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v10++, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v10 >= v24)
      goto LABEL_31;
    v15 = *(_QWORD *)(v23 + 8 * v10);
    if (!v15)
      break;
LABEL_18:
    v8 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_19:
    v17 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 16 * v13);
    v18 = v17[1];
    v25[0] = *v17;
    v25[1] = v18;
    swift_bridgeObjectRetain();
    a1(&v26, v25);
    if (v3)
    {
      swift_bridgeObjectRelease();
      swift_release();
      swift_bridgeObjectRelease();
      return v11;
    }
    result = swift_bridgeObjectRelease();
    v19 = v26;
    if (v26 != 2)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_2471CED20(0, *(_QWORD *)(v11 + 16) + 1, 1, v11);
        v11 = result;
      }
      v21 = *(_QWORD *)(v11 + 16);
      v20 = *(_QWORD *)(v11 + 24);
      if (v21 >= v20 >> 1)
      {
        result = (uint64_t)sub_2471CED20((char *)(v20 > 1), v21 + 1, 1, v11);
        v11 = result;
      }
      *(_QWORD *)(v11 + 16) = v21 + 1;
      *(_BYTE *)(v11 + v21 + 32) = v19 & 1;
      a1 = v22;
    }
  }
  v16 = v10 + 1;
  if (v10 + 1 >= v24)
    goto LABEL_31;
  v15 = *(_QWORD *)(v23 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v10 + 2;
  if (v10 + 2 >= v24)
    goto LABEL_31;
  v15 = *(_QWORD *)(v23 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v10 + 3;
  if (v10 + 3 >= v24)
    goto LABEL_31;
  v15 = *(_QWORD *)(v23 + 8 * v16);
  if (v15)
    goto LABEL_17;
  v16 = v10 + 4;
  if (v10 + 4 >= v24)
  {
LABEL_31:
    swift_release();
    return v11;
  }
  v15 = *(_QWORD *)(v23 + 8 * v16);
  if (v15)
  {
LABEL_17:
    v10 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v24)
      goto LABEL_31;
    v15 = *(_QWORD *)(v23 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_18;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_2471CCE68()
{
  uint64_t v0;

  sub_2471CF4B4(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_entity, &qword_257679C98);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_aceServiceInvoker);
  sub_2471CF4B4(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_outputPublisher, &qword_257679C28);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC17SiriReaderIntents12ReadThisFlow_deviceState);
  return v0;
}

uint64_t sub_2471CCEE0()
{
  sub_2471CCE68();
  return swift_deallocClassInstance();
}

uint64_t sub_2471CCF04()
{
  return type metadata accessor for ReadThisFlow(0);
}

uint64_t type metadata accessor for ReadThisFlow(uint64_t a1)
{
  return sub_2471CE690(a1, (uint64_t *)&unk_2576799B8);
}

void sub_2471CCF20()
{
  unint64_t v0;

  sub_2471CCFAC();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2471CCFAC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576799D0)
  {
    sub_2471D769C();
    v0 = sub_2471D77D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576799D0);
  }
}

uint64_t sub_2471CD000()
{
  sub_2471CA5FC();
  return 1;
}

uint64_t sub_2471CD018()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2471CD080;
  return sub_2471D730C();
}

uint64_t sub_2471CD080(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3_0();
  return (*(uint64_t (**)(uint64_t))(v1 + 8))(a1);
}

uint64_t sub_2471CD0B4()
{
  return sub_2471CB0EC();
}

uint64_t sub_2471CD0D4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2471CD128;
  return sub_2471CA810(a1);
}

uint64_t sub_2471CD128()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471CD154()
{
  type metadata accessor for ReadThisFlow(0);
  return sub_2471D7318();
}

uint64_t sub_2471CD180(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  _BYTE v18[40];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B88);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v10, a1, v8);
  sub_2471D7384();
  v12 = objc_allocWithZone((Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0));
  v13 = sub_2471CD59C((uint64_t)v10, (uint64_t)v18);
  v14 = objc_msgSend(a2, sel_executorForAction_options_delegate_, a3, a4, v13);
  objc_msgSend(v14, sel_perform);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = v13;
  *(_QWORD *)(v15 + 24) = v14;
  return sub_2471D7738();
}

uint64_t sub_2471CD2A0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, uint64_t, uint64_t);
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint8_t *v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v4 = sub_2471D7630();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v31 - v9;
  if (qword_257679460 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v4, (uint64_t)qword_25767AA90);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v12(v10, v11, v4);
  v13 = a3;
  v14 = sub_2471D7624();
  v15 = sub_2471D77A4();
  if (os_log_type_enabled(v14, v15))
  {
    v34 = v5;
    v16 = swift_slowAlloc();
    v36 = v8;
    v17 = (uint8_t *)v16;
    v33 = swift_slowAlloc();
    v38 = v33;
    *(_DWORD *)v17 = 136315138;
    v31 = v17 + 4;
    v32 = v17;
    v18 = v13;
    v19 = v11;
    v20 = objc_msgSend(v18, sel_description);
    v21 = sub_2471D76CC();
    v35 = v12;
    v23 = v22;

    v11 = v19;
    v37 = sub_2471D43D0(v21, v23, &v38);
    sub_2471D77E0();

    v12 = v35;
    swift_bridgeObjectRelease();
    v24 = v32;
    _os_log_impl(&dword_2471C7000, v14, v15, "Stopping executor %s", v32, 0xCu);
    v25 = v33;
    swift_arrayDestroy();
    MEMORY[0x2495737C0](v25, -1, -1);
    v8 = v36;
    MEMORY[0x2495737C0](v24, -1, -1);

    v26 = *(void (**)(char *, uint64_t))(v34 + 8);
  }
  else
  {

    v26 = *(void (**)(char *, uint64_t))(v5 + 8);
  }
  v26(v10, v4);
  v12(v8, v11, v4);
  v27 = sub_2471D7624();
  v28 = sub_2471D77A4();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_2471C7000, v27, v28, "AsyncStream terminated", v29, 2u);
    MEMORY[0x2495737C0](v29, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t))v26)(v8, v4);
}

id sub_2471CD59C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  sub_2471CF1D8(a2, (uint64_t)v2 + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_aceService);
  v4 = (uint64_t)v2 + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_continuation;
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257679B88) - 8);
  OUTLINED_FUNCTION_61(v4, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
  v8.receiver = v2;
  v8.super_class = (Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
  v6 = objc_msgSendSuper2(&v8, sel_init);
  OUTLINED_FUNCTION_74();
  OUTLINED_FUNCTION_46(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  return v6;
}

void sub_2471CD648()
{
  sub_2471CD7A8();
}

void sub_2471CD6B8()
{
  sub_2471CD7A8();
}

void sub_2471CD728()
{
  sub_2471CD7A8();
}

void sub_2471CD798()
{
  sub_2471CD7A8();
}

void sub_2471CD7A8()
{
  uint64_t v0;
  int v1;
  int v2;
  const char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint8_t *v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[2];
  int v22;
  char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  char v29;

  OUTLINED_FUNCTION_8();
  v2 = v1;
  v25 = v3;
  v5 = v4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B80);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_18();
  if (qword_257679460 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v10, (uint64_t)qword_25767AA90);
  v27 = v11;
  OUTLINED_FUNCTION_53(v0, v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v13 = v5;
  v26 = v0;
  v14 = sub_2471D7624();
  v15 = sub_2471D77A4();
  if (OUTLINED_FUNCTION_79(v14))
  {
    v24 = v6;
    v16 = OUTLINED_FUNCTION_2_0();
    v23 = v9;
    v17 = (uint8_t *)v16;
    v21[0] = OUTLINED_FUNCTION_2_0();
    v21[1] = v10;
    *(_DWORD *)v17 = 138412290;
    v28 = v13;
    v18 = v13;
    v22 = v2;
    v19 = v18;
    sub_2471D77E0();
    *(_QWORD *)v21[0] = v13;

    OUTLINED_FUNCTION_21(&dword_2471C7000, v14, v15, v25, v17);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_45(v26, *(uint64_t (**)(uint64_t, uint64_t))(v27 + 8));
  v28 = v13;
  v29 = v2;
  v20 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679B88);
  sub_2471D7744();
  OUTLINED_FUNCTION_38((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_1_0();
}

void sub_2471CDA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  _QWORD v42[3];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;

  OUTLINED_FUNCTION_8();
  v49 = v0;
  v4 = v3;
  v6 = v5;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B88);
  v7 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  OUTLINED_FUNCTION_18();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B80);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_51();
  v10 = OUTLINED_FUNCTION_14();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_31();
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v42 - v14;
  if (v4)
  {
    OUTLINED_FUNCTION_41();
    if (qword_257679460 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v10, (uint64_t)qword_25767AA90);
    OUTLINED_FUNCTION_73(v16, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_41();
    v17 = sub_2471D7624();
    v18 = sub_2471D77A4();
    if (OUTLINED_FUNCTION_48(v18))
    {
      v19 = OUTLINED_FUNCTION_2_0();
      v48 = v11;
      v20 = (uint8_t *)v19;
      v21 = OUTLINED_FUNCTION_2_0();
      v51 = v4;
      v52 = v21;
      *(_DWORD *)v20 = 136315138;
      OUTLINED_FUNCTION_41();
      __swift_instantiateConcreteTypeFromMangledName(qword_257679B68);
      v22 = sub_2471D76D8();
      v51 = sub_2471D43D0(v22, v23, &v52);
      sub_2471D77E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_21(&dword_2471C7000, v17, (os_log_type_t)v7, "ReadThisAppIntentConnectionDelegate finished with error: %s", v20);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_40();

    OUTLINED_FUNCTION_26((uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    v52 = v4;
    OUTLINED_FUNCTION_41();
    sub_2471D7750();
    OUTLINED_FUNCTION_40();
    goto LABEL_14;
  }
  v24 = v13;
  v46 = v9;
  v47 = v2;
  v44 = v8;
  v45 = v1;
  if (qword_257679460 != -1)
    swift_once();
  v25 = __swift_project_value_buffer(v10, (uint64_t)qword_25767AA90);
  v26 = v24;
  OUTLINED_FUNCTION_73(v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v27 = (uint64_t)v6;
  v28 = v6;
  v29 = sub_2471D7624();
  v30 = sub_2471D77A4();
  v31 = os_log_type_enabled(v29, v30);
  v32 = v47;
  v43 = v28;
  if (v31)
  {
    v42[2] = v7;
    v48 = v11;
    v33 = v27;
    v34 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    v35 = OUTLINED_FUNCTION_2_0();
    *(_DWORD *)v34 = 138412290;
    if (v33)
    {
      v36 = (_QWORD *)v35;
      v42[1] = v34 + 12;
      v52 = (uint64_t)v28;
      v37 = v28;
      sub_2471D77E0();
      *v36 = v33;

      OUTLINED_FUNCTION_21(&dword_2471C7000, v29, v30, "ReadThisAppIntentConnectionDelegate finished with result: %@", v34);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
  }
  else
  {

    OUTLINED_FUNCTION_26(v26, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v45, v49 + OBJC_IVAR____TtC17SiriReaderIntents35ReadThisAppIntentConnectionDelegate_continuation, v50);
    v38 = v46;
    if (v27)
    {
      v52 = v27;
      v53 = 5;
      v39 = v43;
      sub_2471D7744();
      v40 = OUTLINED_FUNCTION_55();
      v41(v40);
      OUTLINED_FUNCTION_26(v32, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));
      v52 = 0;
      sub_2471D7750();
LABEL_14:
      OUTLINED_FUNCTION_1_0();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2471CDF34()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_14();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CDF74(uint64_t a1)
{
  uint64_t v1;
  uint8_t *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _WORD *v6;
  uint64_t v7;

  if (qword_257679460 != -1)
    a1 = swift_once();
  v2 = *(uint8_t **)(v1 + 24);
  v3 = *(_QWORD *)(v1 + 16);
  OUTLINED_FUNCTION_9(a1, (uint64_t)qword_25767AA90);
  v4 = sub_2471D7624();
  v5 = sub_2471D77A4();
  if (OUTLINED_FUNCTION_10(v5))
  {
    v6 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_69(v6);
    OUTLINED_FUNCTION_13(&dword_2471C7000, v4, (os_log_type_t)v3, "ReadThisAppIntentConnectionDelegate executorEnvironmentForViewSnippet", v2);
    OUTLINED_FUNCTION_0_0();
  }
  v7 = *(_QWORD *)(v1 + 24);

  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  OUTLINED_FUNCTION_24();
  return (*(uint64_t (**)(_QWORD))(v1 + 8))(0);
}

uint64_t sub_2471CE0AC(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_2471CE11C;
  return sub_2471CDF34();
}

uint64_t sub_2471CE11C(void *a1)
{
  uint64_t v1;
  _QWORD *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  void *v6;

  OUTLINED_FUNCTION_33();
  v4 = (void (**)(_QWORD, _QWORD))v3[4];
  v6 = (void *)v3[2];
  v5 = (void *)v3[3];
  OUTLINED_FUNCTION_5();

  ((void (**)(_QWORD, void *))v4)[2](v4, a1);
  _Block_release(v4);

  return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2471CE184(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679BA8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2471D772C();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &unk_257679BB8;
  v9[5] = v8;
  sub_2471CEB50((uint64_t)v6, (uint64_t)&unk_257679BC8, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_2471CE260()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  v1 = OUTLINED_FUNCTION_14();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_7();
  if (qword_257679460 != -1)
    swift_once();
  v3 = __swift_project_value_buffer(v1, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_29(v0, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  v4 = sub_2471D7624();
  v5 = sub_2471D77A4();
  if (OUTLINED_FUNCTION_79(v4))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v4, v5, "ReadThisAppIntentConnectionDelegate shouldRunShowOutputAction return false", v6);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_38(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return 0;
}

void sub_2471CE3B4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  _QWORD v14[3];
  char v15;

  OUTLINED_FUNCTION_8();
  v2 = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679B80);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OUTLINED_FUNCTION_14();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_7();
  if (qword_257679460 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v7, (uint64_t)qword_25767AA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v0, v9, v7);
  v10 = sub_2471D7624();
  v11 = sub_2471D77A4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    v14[1] = v2;
    *(_WORD *)v12 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v10, v11, "ReadThisAppIntentConnectionDelegate needsContinueInAppWith request", v12);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_72(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  v14[2] = v2;
  v15 = 4;
  v13 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679B88);
  sub_2471D7744();
  OUTLINED_FUNCTION_38((uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  OUTLINED_FUNCTION_1_0();
}

void sub_2471CE5B4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_2471CE5EC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2471CE674()
{
  return type metadata accessor for ReadThisAppIntentConnectionDelegate(0);
}

uint64_t type metadata accessor for ReadThisAppIntentConnectionDelegate(uint64_t a1)
{
  return sub_2471CE690(a1, (uint64_t *)&unk_257679B48);
}

uint64_t sub_2471CE690(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2471CE6C0()
{
  unint64_t v0;

  sub_2471CE738();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2471CE738()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257679B60)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257679B68);
    v0 = sub_2471D775C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257679B60);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249573748](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for LinkConnectionEvent(id *a1)
{

}

uint64_t assignWithCopy for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for LinkConnectionEvent(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for LinkConnectionEvent(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFB && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 250;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 8);
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

uint64_t storeEnumTagSinglePayload for LinkConnectionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 251;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_2471CE92C(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_2471CE934(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for LinkConnectionEvent()
{
  return &type metadata for LinkConnectionEvent;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_2471CE964(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, void *a6, void *a7)
{
  void *v7;
  void *v8;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = v7;
  v13 = (void *)sub_2471D76C0();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v14 = (void *)sub_2471D76C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  sub_2471CF418(0, &qword_257679C18);
  v15 = (void *)sub_2471D76FC();
  swift_bridgeObjectRelease();
  sub_2471CF418(0, &qword_257679C20);
  v16 = (void *)sub_2471D76FC();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v8, sel_initWithIdentifier_mangledTypeName_openAppWhenRun_outputFlags_outputType_systemProtocols_parameters_, v13, v14, a5 & 1, a6, a7, v15, v16);

  return v17;
}

uint64_t sub_2471CEAA8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2471CF538;
  return v6();
}

uint64_t sub_2471CEAFC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2471CF538;
  return v7();
}

uint64_t sub_2471CEB50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2471D772C();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_2471CF4B4(a1, &qword_257679BA8);
  }
  else
  {
    sub_2471D7720();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2471D7714();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2471CEC94(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2471CECF8;
  return v6(a1);
}

uint64_t sub_2471CECF8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_0();
  return OUTLINED_FUNCTION_30(*(uint64_t (**)(void))(v0 + 8));
}

char *sub_2471CED20(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257679BF0);
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
  if ((v5 & 1) != 0)
  {
    sub_2471D40D4((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2471CEE00(0, v8, v12, a4);
  }
  return v10;
}

char *sub_2471CEE00(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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
  result = (char *)sub_2471D7840();
  __break(1u);
  return result;
}

uint64_t sub_2471CEEEC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_2471CEF20()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2471CF538;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_257679B98 + dword_257679B98))(v2, v3, v4);
}

uint64_t sub_2471CEF90()
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
  v5[1] = sub_2471CF538;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_257679BB0 + dword_257679BB0))(v2, v3, v4);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2471CF038(uint64_t a1)
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
  v7[1] = sub_2471CF538;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_257679BC0 + dword_257679BC0))(a1, v4, v5, v6);
}

uint64_t sub_2471CF0BC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2471CF0E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2471CF534;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257679BD0 + dword_257679BD0))(a1, v4);
}

uint64_t sub_2471CF150@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_2471CCAF8(a1, a2);
}

uint64_t sub_2471CF16C(uint64_t a1)
{
  uint64_t v1;

  return sub_2471CD180(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2471CF178()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2471CF1A4(uint64_t a1)
{
  uint64_t v1;

  return sub_2471CD2A0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

void sub_2471CF1AC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_49(a1, a2, a3);
  OUTLINED_FUNCTION_75(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_44();
}

void sub_2471CF1D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2471CF218(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  char v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_BYTE *)(v1 + 16);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2471CF280;
  return sub_2471CB804(a1, v5, v4);
}

uint64_t sub_2471CF280()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_0();
  return OUTLINED_FUNCTION_30(*(uint64_t (**)(void))(v0 + 8));
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

uint64_t sub_2471CF2E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2471CF304(int a1)
{
  uint64_t v1;

  return sub_2471CB6C0(a1, *(id *)(v1 + 16));
}

void sub_2471CF30C(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_2471D76C0();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);

}

void sub_2471CF364(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2471D76C0();
  objc_msgSend(a3, sel_setPlaybackBundleIdentifier_, v4);

}

void sub_2471CF3A8(uint64_t a1, void *a2)
{
  id v3;

  sub_2471CF418(0, &qword_257679C70);
  v3 = (id)sub_2471D76FC();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setViews_, v3);

}

uint64_t sub_2471CF418(uint64_t a1, unint64_t *a2)
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

void sub_2471CF450(id a1, char a2)
{
  if (a2 != -1)

}

id sub_2471CF464(id result, char a2)
{
  if (a2 != -1)
    return result;
  return result;
}

void sub_2471CF478(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x249573754](a3, v5), a1);
  }
  OUTLINED_FUNCTION_44();
}

void sub_2471CF4B4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_44();
}

void sub_2471CF4EC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_49(a1, a2, a3);
  OUTLINED_FUNCTION_75(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2471CF518(__int128 *a1, uint64_t a2)
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

void OUTLINED_FUNCTION_0_0()
{
  JUMPOUT(0x2495737C0);
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_5()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v2, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v5, v2);
}

BOOL OUTLINED_FUNCTION_10(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_2471D7630();
}

void OUTLINED_FUNCTION_15()
{
  void *v0;

  sub_2471CF450(v0, 5);
  sub_2471CF450(v0, 5);
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return sub_2471D73C0();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_21(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_25@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + v1), *(_QWORD *)(a1 + v1 + 24));
  return sub_2471D739C();
}

uint64_t OUTLINED_FUNCTION_26@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_29@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_30(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_33()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_35()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_38@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

_QWORD *OUTLINED_FUNCTION_39(_QWORD *a1)
{
  uint64_t v1;

  return __swift_project_boxed_opaque_existential_1(a1, v1);
}

void OUTLINED_FUNCTION_40()
{
  void *v0;

}

id OUTLINED_FUNCTION_41()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_43(uint64_t a1)
{
  uint64_t v1;

  __swift_storeEnumTagSinglePayload(v1, 1, 1, a1);
  return sub_2471D745C();
}

uint64_t OUTLINED_FUNCTION_45@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_46@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_48(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

uint64_t OUTLINED_FUNCTION_53@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_56()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_57()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_58()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_61@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_62()
{
  uint64_t *v0;

  return sub_2471CB70C(2, v0);
}

void OUTLINED_FUNCTION_63()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_65(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_2471D7708();
}

uint64_t OUTLINED_FUNCTION_66()
{
  return sub_2471D77E0();
}

id OUTLINED_FUNCTION_67()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_68()
{
  return sub_2471D7624();
}

_WORD *OUTLINED_FUNCTION_69(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_2471D7798();
}

void OUTLINED_FUNCTION_71(uint64_t a1, uint64_t a2)
{
  SEL *v2;
  void *v3;

  sub_2471CF30C(a1, a2, v3, v2);
}

uint64_t OUTLINED_FUNCTION_72@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_73@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, v3);
}

uint64_t OUTLINED_FUNCTION_74()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0);
}

uint64_t OUTLINED_FUNCTION_75@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t *OUTLINED_FUNCTION_76@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1(v2);
}

uint64_t OUTLINED_FUNCTION_77()
{
  return sub_2471D73E4();
}

uint64_t OUTLINED_FUNCTION_78()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_79(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_2471CF994(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = sub_2471D742C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_43_0();
  if (qword_257679460 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v1, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_29(v2, v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_2471D7624();
  v12 = OUTLINED_FUNCTION_49_0();
  if (os_log_type_enabled(v3, v12))
  {
    v13 = OUTLINED_FUNCTION_2_0();
    v20 = v4;
    v14 = (uint8_t *)v13;
    v19 = OUTLINED_FUNCTION_2_0();
    v22 = v19;
    *(_DWORD *)v14 = 136315138;
    v18[1] = v14 + 4;
    sub_2471D1CD8(&qword_257679C90, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE98DD0], MEMORY[0x24BE98DE0]);
    v15 = sub_2471D78A0();
    v21 = sub_2471D43D0(v15, v16, &v22);
    sub_2471D77E0();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_40_0();
    OUTLINED_FUNCTION_21(&dword_2471C7000, v3, v12, "ReadThisFlow.on input: %s", v14);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_40_0();

  OUTLINED_FUNCTION_56_0(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  return 1;
}

void sub_2471CFBAC()
{
  uint64_t v0;

  type metadata accessor for ScreenReaderFlow();
  sub_2471D1CD8(&qword_257679DF8, v0, (uint64_t (*)(uint64_t))type metadata accessor for ScreenReaderFlow, (uint64_t)&unk_2471D8144);
  sub_2471D72F4();
  OUTLINED_FUNCTION_46_0();
}

uint64_t sub_2471CFC10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[22] = a1;
  v2[23] = v1;
  v3 = sub_2471D73FC();
  v2[24] = v3;
  v2[25] = *(_QWORD *)(v3 - 8);
  v2[26] = OUTLINED_FUNCTION_12();
  v4 = OUTLINED_FUNCTION_14();
  v2[27] = v4;
  v2[28] = *(_QWORD *)(v4 - 8);
  v2[29] = OUTLINED_FUNCTION_54();
  v2[30] = OUTLINED_FUNCTION_54();
  v2[31] = OUTLINED_FUNCTION_54();
  v2[32] = OUTLINED_FUNCTION_54();
  v2[33] = OUTLINED_FUNCTION_54();
  v2[34] = OUTLINED_FUNCTION_54();
  v2[35] = OUTLINED_FUNCTION_54();
  v2[36] = OUTLINED_FUNCTION_54();
  v2[37] = OUTLINED_FUNCTION_54();
  v2[38] = OUTLINED_FUNCTION_54();
  v2[39] = OUTLINED_FUNCTION_54();
  v2[40] = OUTLINED_FUNCTION_54();
  v2[41] = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471CFCDC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  _QWORD *v12;

  if (qword_257679460 != -1)
    swift_once();
  v1 = (void *)v0[41];
  v2 = v0[28];
  v3 = __swift_project_value_buffer(v0[27], (uint64_t)qword_25767AA90);
  v0[42] = v3;
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[43] = v4;
  OUTLINED_FUNCTION_29((uint64_t)v1, v3, v4);
  sub_2471D7624();
  v5 = OUTLINED_FUNCTION_70();
  if (OUTLINED_FUNCTION_10(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
    OUTLINED_FUNCTION_34_0(&dword_2471C7000, v6, v7, "Entering ScreenReaderFlow");
    OUTLINED_FUNCTION_0_0();
  }
  v8 = v0[41];
  v9 = v0[27];
  v10 = v0[28];

  v11 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
  v0[44] = v11;
  v11(v8, v9);
  v0[45] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE810B8]), sel_init);
  sub_2471D7384();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  v12 = (_QWORD *)swift_task_alloc();
  v0[46] = v12;
  sub_2471CF418(0, &qword_257679DF0);
  *v12 = v0;
  v12[1] = sub_2471CFE54;
  OUTLINED_FUNCTION_55();
  return sub_2471D7414();
}

uint64_t sub_2471CFE54(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 376) = v1;
  swift_task_dealloc();
  if (!v1)

  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_2471CFEB4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 360);
  sub_2471D73D8();

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_66_0();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471CFFAC()
{
  uint64_t *v0;
  uint64_t *v1;
  void *v2;
  _QWORD *v3;
  uint64_t *v4;
  _QWORD *v5;
  NSObject *v6;
  id v7;
  int v8;
  NSObject *v9;
  void (*v10)(uint64_t, NSObject *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  id v23;
  char *v24;
  id v25;
  uint64_t *v26;
  NSObject *v27;
  os_log_type_t v28;
  _WORD *v29;
  const char *v30;
  NSObject *v31;
  void (*v32)(uint64_t, NSObject *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v39;
  os_log_type_t v40;
  _QWORD *v41;
  uint8_t *v42;
  _QWORD *v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, _QWORD);
  os_log_type_t v48;
  _WORD *v49;
  void *v50;
  const char *v51;
  NSObject *v52;
  void (*v53)(uint64_t, NSObject *, uint64_t);
  uint64_t v54;
  uint64_t v55;
  os_log_type_t v56;
  _WORD *v57;
  void (*v58)(uint64_t, uint64_t);
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t *);
  uint64_t v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t, _QWORD);
  uint64_t v64;
  void (*v65)(NSObject *, uint64_t, uint64_t);
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  _BOOL4 v70;
  void *v71;
  uint8_t *v72;
  _QWORD *v73;
  id v74;
  uint64_t v75;
  os_log_type_t v76;
  _WORD *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t, _QWORD);
  os_log_type_t v80;
  _WORD *v81;
  os_log_type_t v82;
  _WORD *v83;
  NSObject *v84;
  uint64_t v85;
  void (*v86)(uint64_t, id);
  void *v87;
  uint64_t (*v89)(uint64_t);
  os_log_type_t v90;
  _WORD *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;

  OUTLINED_FUNCTION_45_0();
  v1 = v0;
  v2 = (void *)v0[47];
  v0[20] = (uint64_t)v2;
  v3 = v0 + 20;
  v4 = v0 + 18;
  v5 = v0 + 19;
  v6 = v0[24];
  v7 = v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_257679B68);
  OUTLINED_FUNCTION_55();
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v0[25] + 88))(v0[26], v0[24]);
  if (v8 == *MEMORY[0x24BE982C8])
  {
    v9 = v0[42];
    v10 = (void (*)(uint64_t, NSObject *, uint64_t))v0[43];
    v11 = v0[32];
    v12 = v1[26];
    v13 = v1[27];
    v14 = v1[24];
    v15 = v1[25];

    (*(void (**)(uint64_t, uint64_t))(v15 + 96))(v12, v14);
    v10(v11, v9, v13);
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_74_0();
    v16 = OUTLINED_FUNCTION_70();
    if (os_log_type_enabled(v9, v16))
    {
      v17 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      v18 = (_QWORD *)OUTLINED_FUNCTION_2_0();
      *(_DWORD *)v17 = 138412290;
      OUTLINED_FUNCTION_58();
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v1[21] = v19;
      sub_2471D77E0();
      *v18 = v19;
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_21(&dword_2471C7000, v9, v16, "SAAXStartSpeaking internalError: %@", v17);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_35();

    ((void (*)(uint64_t, uint64_t))v1[44])(v1[32], v1[27]);
    goto LABEL_43;
  }
  if (v8 != *MEMORY[0x24BE982D8])
  {
    if (v8 == *MEMORY[0x24BE982E0])
    {
      v31 = v0[42];
      v32 = (void (*)(uint64_t, NSObject *, uint64_t))v0[43];
      v33 = v0[31];
      v35 = (void **)v1[26];
      v34 = v1[27];
      v36 = v1[24];
      v37 = v1[25];

      (*(void (**)(void **, uint64_t))(v37 + 96))(v35, v36);
      v38 = *v35;
      v32(v33, v31, v34);
      v39 = v38;
      OUTLINED_FUNCTION_74_0();
      v40 = OUTLINED_FUNCTION_70();
      if (os_log_type_enabled(v31, v40))
      {
        v41 = v3 - 3;
        v42 = (uint8_t *)OUTLINED_FUNCTION_2_0();
        v43 = (_QWORD *)OUTLINED_FUNCTION_2_0();
        *(_DWORD *)v42 = 138412290;
        *v41 = v39;
        v44 = v39;
        sub_2471D77E0();
        *v43 = v39;

        OUTLINED_FUNCTION_21(&dword_2471C7000, v31, v40, "SAAXStartSpeaking unexpectedResponse: %@", v42);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_0_0();
      }

      v60 = (void (*)(uint64_t, uint64_t *))v1[44];
      v61 = v1[31];
      OUTLINED_FUNCTION_57_0();

      v60(v61, v4);
      goto LABEL_43;
    }
    if (v8 == *MEMORY[0x24BE982D0])
    {
      v52 = v0[42];
      v53 = (void (*)(uint64_t, NSObject *, uint64_t))v0[43];
      v54 = v0[30];
      v55 = v1[27];

      v53(v54, v52, v55);
      OUTLINED_FUNCTION_74_0();
      v56 = OUTLINED_FUNCTION_70();
      if (OUTLINED_FUNCTION_10(v56))
      {
        v57 = (_WORD *)OUTLINED_FUNCTION_2_0();
        OUTLINED_FUNCTION_31_0(v57);
        OUTLINED_FUNCTION_22_0(&dword_2471C7000, v52, (os_log_type_t)v55, "SAAXStartSpeaking nilResponse");
        OUTLINED_FUNCTION_0_0();
      }
      v58 = (void (*)(uint64_t, uint64_t))v1[44];
      v59 = v1[30];
      OUTLINED_FUNCTION_57_0();
      v58(v59, v55);
      goto LABEL_43;
    }
    (*(void (**)(uint64_t, uint64_t))(v0[25] + 8))(v0[26], v0[24]);
LABEL_26:
    v64 = v0[42];
    v65 = (void (*)(NSObject *, uint64_t, uint64_t))v1[43];
    v66 = v1[29];
    v67 = v1[27];
    OUTLINED_FUNCTION_60_0();
    v65(v66, v64, v67);
    OUTLINED_FUNCTION_30_0();
    OUTLINED_FUNCTION_30_0();
    v68 = v66;
    sub_2471D7624();
    v69 = OUTLINED_FUNCTION_70();
    v70 = os_log_type_enabled(v66, v69);
    v71 = (void *)v1[47];
    if (v70)
    {
      v72 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      v73 = (_QWORD *)OUTLINED_FUNCTION_2_0();
      *(_DWORD *)v72 = 138412290;
      v74 = v71;
      v75 = _swift_stdlib_bridgeErrorToNSError();
      *v4 = v75;
      sub_2471D77E0();
      *v73 = v75;
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_26_0();
      OUTLINED_FUNCTION_21(&dword_2471C7000, v68, v69, "SAAXStartSpeaking unknown error %@", v72);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257679B90);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_26_0();
    OUTLINED_FUNCTION_26_0();

    ((void (*)(uint64_t, uint64_t))v1[44])(v1[29], v1[27]);
    goto LABEL_44;
  }
  v20 = v0[25];
  v21 = (id *)v0[26];
  v22 = v0[24];

  (*(void (**)(id *, uint64_t))(v20 + 96))(v21, v22);
  v23 = *v21;
  v24 = (char *)v1;
  v1 = (uint64_t *)&unk_251875000;
  v25 = objc_msgSend(*v21, sel_errorCode);
  if ((id)*MEMORY[0x24BE81A28] == v25)
  {
    v26 = (uint64_t *)(v24 + 320);
    v27 = *((_QWORD *)v24 + 40);
    OUTLINED_FUNCTION_17_0(*((_QWORD *)v24 + 42), *((uint64_t (**)(uint64_t, uint64_t, _QWORD))v24 + 43));
    sub_2471D7624();
    v28 = OUTLINED_FUNCTION_70();
    v1 = (uint64_t *)v24;
    if (OUTLINED_FUNCTION_7_0(v28))
    {
      v29 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_31_0(v29);
      v30 = "SAAXScreenReaderNothingBeingSpokenErrorCode handler not handled";
      goto LABEL_33;
    }
    goto LABEL_40;
  }
  if ((id)*MEMORY[0x24BE81A30] == v25)
  {
    v45 = v3 - 8;
    OUTLINED_FUNCTION_52_0();
    OUTLINED_FUNCTION_17_0(v46, v47);
    sub_2471D7624();
    v48 = OUTLINED_FUNCTION_49_0();
    if (OUTLINED_FUNCTION_47_0(v48))
    {
      v49 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_31_0(v49);
      OUTLINED_FUNCTION_22_0(&dword_2471C7000, v6, (os_log_type_t)v5, "Handling SAAXScreenReaderNothingToSpeakErrorCode");
      OUTLINED_FUNCTION_0_0();
    }
    v50 = 0;
    OUTLINED_FUNCTION_65_0();
    OUTLINED_FUNCTION_73_0();
    sub_2471D109C(v45);
    v51 = "aceId";
    goto LABEL_17;
  }
  if ((id)*MEMORY[0x24BE81A40] == v25)
  {
    OUTLINED_FUNCTION_52_0();
    v26 = (uint64_t *)(v24 + 304);
    v27 = *((_QWORD *)v24 + 38);
    goto LABEL_31;
  }
  if ((id)*MEMORY[0x24BE81A48] == v25)
  {
    OUTLINED_FUNCTION_52_0();
    v26 = (uint64_t *)(v24 + 296);
    v27 = *((_QWORD *)v24 + 37);
LABEL_31:
    OUTLINED_FUNCTION_17_0(v62, v63);
    sub_2471D7624();
    v76 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_7_0(v76))
    {
      v77 = (_WORD *)OUTLINED_FUNCTION_2_0();
      OUTLINED_FUNCTION_31_0(v77);
      v30 = "SAAXScreenReaderSpeedAtMaxRateErrorCode handler not handled";
      goto LABEL_33;
    }
LABEL_40:
    v84 = v27;
LABEL_41:
    v85 = *v26;
    v86 = (void (*)(uint64_t, id))v1[44];
    OUTLINED_FUNCTION_57_0();

    v86(v85, v23);
LABEL_43:
    OUTLINED_FUNCTION_60_0();
LABEL_44:
    v87 = (void *)v1[45];
    sub_2471D73D8();

    goto LABEL_45;
  }
  if ((id)*MEMORY[0x24BE81A18] == v25)
  {
    OUTLINED_FUNCTION_52_0();
    v26 = (uint64_t *)(v24 + 288);
    v27 = *((_QWORD *)v24 + 36);
    OUTLINED_FUNCTION_17_0(v78, v79);
    sub_2471D7624();
    v80 = OUTLINED_FUNCTION_70();
    if (!OUTLINED_FUNCTION_7_0(v80))
      goto LABEL_40;
    v81 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_31_0(v81);
    v30 = "SAAXScreenReaderCannotSkipAheadErrorCode handler not handled";
LABEL_33:
    OUTLINED_FUNCTION_22_0(&dword_2471C7000, v27, (os_log_type_t)v3, v30);
    OUTLINED_FUNCTION_0_0();
  }
  if ((id)*MEMORY[0x24BE81A20] == v25)
  {
    v26 = (uint64_t *)(v24 + 280);
    v27 = *((_QWORD *)v24 + 35);
    OUTLINED_FUNCTION_21_0(*((uint64_t (**)(uint64_t))v24 + 43));
    sub_2471D7624();
    v82 = OUTLINED_FUNCTION_70();
    v1 = (uint64_t *)v24;
    if (!OUTLINED_FUNCTION_7_0(v82))
      goto LABEL_40;
    v83 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_31_0(v83);
    v30 = "SAAXScreenReaderCannotSkipBackErrorCode handler not handled";
    goto LABEL_33;
  }
  v89 = (uint64_t (*)(uint64_t))*((_QWORD *)v24 + 43);
  if ((id)*MEMORY[0x24BE81A38] != v25)
  {
    v26 = (uint64_t *)(v24 + 264);
    v92 = *((_QWORD *)v24 + 33);
    OUTLINED_FUNCTION_21_0(v89);
    v84 = v23;
    sub_2471D7624();
    v93 = OUTLINED_FUNCTION_70();
    if (OUTLINED_FUNCTION_10(v93))
    {
      v94 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      *(_DWORD *)v94 = 134217984;
      *v5 = -[NSObject errorCode](v84, sel_errorCode);
      sub_2471D77E0();

      OUTLINED_FUNCTION_21(&dword_2471C7000, v92, (os_log_type_t)v23, "Accessibility Assistant Bundle completion with unknown error code %ld", v94);
      OUTLINED_FUNCTION_0_0();
    }

    v1 = (uint64_t *)v24;
    goto LABEL_41;
  }
  v45 = v3 - 13;
  OUTLINED_FUNCTION_21_0(v89);
  sub_2471D7624();
  v90 = OUTLINED_FUNCTION_49_0();
  v1 = (uint64_t *)v24;
  if (OUTLINED_FUNCTION_47_0(v90))
  {
    v91 = (_WORD *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_31_0(v91);
    OUTLINED_FUNCTION_22_0(&dword_2471C7000, v6, (os_log_type_t)v5, "Handling SAAXScreenReaderSettingNotEnabledErrorCode");
    OUTLINED_FUNCTION_0_0();
  }
  v50 = (void *)*((_QWORD *)v24 + 45);
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_73_0();
  sub_2471D0958(v45);
  v51 = (const char *)v1[10];
LABEL_17:
  __swift_project_boxed_opaque_existential_1(v45, (uint64_t)v51);
  sub_2471D73CC();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  OUTLINED_FUNCTION_60_0();
LABEL_45:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v1 + 2));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_66_0();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v1[1])();
}

uint64_t sub_2471D0958@<X0>(uint64_t *a1@<X8>)
{
  return sub_2471D10A8(a1);
}

uint64_t sub_2471D0964(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[12] = a1;
  v2[13] = a2;
  v3 = sub_2471D7630();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257679C40);
  v2[17] = swift_task_alloc();
  sub_2471D75E8();
  v2[18] = swift_task_alloc();
  v4 = sub_2471D73F0();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2471D0A30()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  OUTLINED_FUNCTION_32_0();
  type metadata accessor for ReadThisCATProvider();
  v1 = OUTLINED_FUNCTION_42();
  v0[22] = OUTLINED_FUNCTION_36_0(v1, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = (_QWORD *)swift_task_alloc();
  v0[23] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_2471D0A9C;
  return OUTLINED_FUNCTION_25_0(v0[21], 3, MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2471D0A9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_14_0();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_2471D0AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t (*v11)(void);
  uint64_t v13;
  uint64_t v14;

  v13 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 104);
  sub_2471CF418(0, (unint64_t *)&unk_257679DD0);
  v3 = sub_2471D0F3C();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81888]), sel_init);
  sub_2471CF30C(0x746553206E65704FLL, 0xED000073676E6974, v4, (SEL *)&selRef_setText_);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C68);
  v5 = OUTLINED_FUNCTION_76_0();
  *(_OWORD *)(v5 + 16) = xmmword_2471D7FD0;
  *(_QWORD *)(v5 + 32) = v3;
  OUTLINED_FUNCTION_75_0();
  v6 = v3;
  sub_2471D1C74(v14, v4);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 80));
  sub_2471D739C();
  v7 = OUTLINED_FUNCTION_76_0();
  *(_OWORD *)(v7 + 16) = xmmword_2471D7FD0;
  *(_QWORD *)(v7 + 32) = v4;
  OUTLINED_FUNCTION_75_0();
  v8 = OUTLINED_FUNCTION_71_0();
  v9 = OUTLINED_FUNCTION_43(v8);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  OUTLINED_FUNCTION_76(v9, MEMORY[0x24BE99088]);
  v10 = v4;
  sub_2471D73C0();
  OUTLINED_FUNCTION_56();

  sub_2471D1A5C(v0 + 16, (uint64_t *)&unk_257679DA0);
  sub_2471D1A5C(v1, (uint64_t *)&unk_257679C40);
  OUTLINED_FUNCTION_50_0(v13);
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  v11 = (uint64_t (*)(void))OUTLINED_FUNCTION_42_0();
  return v11();
}

uint64_t sub_2471D0CFC()
{
  uint64_t v0;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_15_0();
  if (v0)
  {
    OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_24_0();
  }
  else
  {
    OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_36();
    v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_42_0();
    return OUTLINED_FUNCTION_23_0(v2);
  }
}

uint64_t sub_2471D0D4C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_45_0();
  v2 = swift_release();
  if (qword_257679460 != -1)
    v2 = swift_once();
  OUTLINED_FUNCTION_35_0(v2, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_30_0();
  v3 = sub_2471D7624();
  v4 = sub_2471D77B0();
  if (OUTLINED_FUNCTION_39_0(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_19_0(4.8149e-34);
    v6 = OUTLINED_FUNCTION_61_0();
    v12 = OUTLINED_FUNCTION_72_0(v6, v7, v8, v9, v10, v11);
    OUTLINED_FUNCTION_28_0(v12);
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_21(&dword_2471C7000, v3, v1, "Could not get CAT template: %s", v5);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  v13 = OUTLINED_FUNCTION_55();
  v14(v13);
  v15 = OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_51_0(v15, MEMORY[0x24BE99088]);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v16;
  v17 = OUTLINED_FUNCTION_67_0(v16);
  return OUTLINED_FUNCTION_8_0(v17);
}

uint64_t sub_2471D0EE8()
{
  uint64_t v0;

  __swift_deallocate_boxed_opaque_existential_1(*(_QWORD *)(v0 + 96));
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_28();
  return OUTLINED_FUNCTION_33_0(*(uint64_t (**)(void))(v0 + 8));
}

id sub_2471D0F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  sub_2471D72AC();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_43_0();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679DE8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81860]), sel_init);
  sub_2471D727C();
  v6 = sub_2471D7288();
  v7 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v6) != 1)
  {
    v7 = (void *)sub_2471D7264();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
  }
  objc_msgSend(v5, sel_setPunchOutUri_, v7);

  v8 = v5;
  sub_2471D72A0();
  v9 = sub_2471D7294();
  v11 = v10;
  OUTLINED_FUNCTION_56_0(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  sub_2471CF30C(v9, v11, v8, (SEL *)&selRef_setAceId_);

  return v8;
}

uint64_t sub_2471D109C@<X0>(uint64_t *a1@<X8>)
{
  return sub_2471D10A8(a1);
}

uint64_t sub_2471D10A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v7;
  uint64_t v8;
  _BYTE v9[40];

  sub_2471D1A14(v1 + 16, (uint64_t)&v7);
  if (v8)
  {
    sub_2471CF518(&v7, (uint64_t)v9);
  }
  else
  {
    sub_2471D1A5C((uint64_t)&v7, &qword_257679C28);
    sub_2471D7420();
  }
  sub_2471D1A8C((uint64_t)v9, (uint64_t)&v7);
  v3 = sub_2471D72DC();
  OUTLINED_FUNCTION_42();
  swift_retain();
  v4 = sub_2471D72D0();
  v5 = MEMORY[0x24BE960C0];
  a1[3] = v3;
  a1[4] = v5;
  *a1 = v4;
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
}

uint64_t sub_2471D1170(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[12] = a1;
  v2[13] = a2;
  v3 = sub_2471D7630();
  v2[14] = v3;
  v2[15] = *(_QWORD *)(v3 - 8);
  v2[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257679C40);
  v2[17] = swift_task_alloc();
  sub_2471D75E8();
  v2[18] = swift_task_alloc();
  v4 = sub_2471D73F0();
  v2[19] = v4;
  v2[20] = *(_QWORD *)(v4 - 8);
  v2[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2471D123C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  OUTLINED_FUNCTION_32_0();
  type metadata accessor for ReadThisCATProvider();
  v1 = OUTLINED_FUNCTION_42();
  v0[22] = OUTLINED_FUNCTION_36_0(v1, v2, v3, v4, v5, v6, v7, v8, v11);
  v9 = (_QWORD *)swift_task_alloc();
  v0[23] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_2471D12A8;
  return OUTLINED_FUNCTION_25_0(v0[21], 4, MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2471D12A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_14_0();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_6_0();
}

uint64_t sub_2471D12EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 104) + 56), *(_QWORD *)(*(_QWORD *)(v0 + 104) + 80));
  sub_2471D739C();
  v3 = OUTLINED_FUNCTION_71_0();
  v4 = OUTLINED_FUNCTION_43(v3);
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  OUTLINED_FUNCTION_76(v4, MEMORY[0x24BE99088]);
  sub_2471D73C0();
  sub_2471D1A5C(v0 + 16, (uint64_t *)&unk_257679DA0);
  sub_2471D1A5C(v2, (uint64_t *)&unk_257679C40);
  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_44_0();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  OUTLINED_FUNCTION_36();
  v5 = (uint64_t (*)(void))OUTLINED_FUNCTION_42_0();
  return v5();
}

uint64_t sub_2471D13FC()
{
  uint64_t v0;
  uint64_t (*v2)(void);

  OUTLINED_FUNCTION_15_0();
  if (v0)
  {
    OUTLINED_FUNCTION_22();
    return OUTLINED_FUNCTION_24_0();
  }
  else
  {
    OUTLINED_FUNCTION_48_0();
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_36();
    v2 = (uint64_t (*)(void))OUTLINED_FUNCTION_42_0();
    return OUTLINED_FUNCTION_23_0(v2);
  }
}

uint64_t sub_2471D144C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  OUTLINED_FUNCTION_45_0();
  v2 = swift_release();
  if (qword_257679460 != -1)
    v2 = swift_once();
  OUTLINED_FUNCTION_35_0(v2, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_30_0();
  v3 = sub_2471D7624();
  v4 = sub_2471D77B0();
  if (OUTLINED_FUNCTION_39_0(v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_2_0();
    OUTLINED_FUNCTION_19_0(4.8149e-34);
    v6 = OUTLINED_FUNCTION_61_0();
    v12 = OUTLINED_FUNCTION_72_0(v6, v7, v8, v9, v10, v11);
    OUTLINED_FUNCTION_28_0(v12);
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_21(&dword_2471C7000, v3, v1, "Could not get CAT template: %s", v5);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  v13 = OUTLINED_FUNCTION_55();
  v14(v13);
  v15 = OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_51_0(v15, MEMORY[0x24BE99088]);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 200) = v16;
  v17 = OUTLINED_FUNCTION_67_0(v16);
  return OUTLINED_FUNCTION_8_0(v17);
}

uint64_t sub_2471D15E8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257679C40);
  v2[9] = OUTLINED_FUNCTION_12();
  v3 = sub_2471D73F0();
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = OUTLINED_FUNCTION_12();
  v4 = OUTLINED_FUNCTION_14();
  v2[13] = v4;
  v2[14] = *(_QWORD *)(v4 - 8);
  v2[15] = OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471D1660()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_257679460 != -1)
    swift_once();
  v2 = v0[14];
  v1 = v0[15];
  v3 = __swift_project_value_buffer(v0[13], (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_29(v1, v3, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  v4 = (void *)sub_2471D7624();
  v5 = sub_2471D77B0();
  if (OUTLINED_FUNCTION_10(v5))
  {
    *(_WORD *)OUTLINED_FUNCTION_2_0() = 0;
    OUTLINED_FUNCTION_34_0(&dword_2471C7000, v6, v7, "Defaulting to generic error template response");
    OUTLINED_FUNCTION_0_0();
  }
  v8 = v0[14];

  OUTLINED_FUNCTION_16(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  v0[16] = (uint64_t)v9;
  *v9 = v0;
  v9[1] = sub_2471D175C;
  return sub_2471D73B4();
}

uint64_t sub_2471D175C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_4_0();
}

uint64_t sub_2471D17B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)(v0 + 64) + 56), *(_QWORD *)(*(_QWORD *)(v0 + 64) + 80));
  sub_2471D739C();
  v5 = OUTLINED_FUNCTION_71_0();
  __swift_storeEnumTagSinglePayload(v3, 1, 1, v5);
  *(_QWORD *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  sub_2471D73C0();
  sub_2471D1A5C(v0 + 16, (uint64_t *)&unk_257679DA0);
  sub_2471D1A5C(v3, (uint64_t *)&unk_257679C40);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v4);
  OUTLINED_FUNCTION_66_0();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_24();
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_42_0();
  return v6();
}

uint64_t sub_2471D18D0()
{
  uint64_t v0;

  swift_task_dealloc();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_24();
  return OUTLINED_FUNCTION_33_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2471D1910()
{
  uint64_t v0;

  sub_2471D1A5C(v0 + 16, &qword_257679C28);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ScreenReaderFlow()
{
  return objc_opt_self();
}

uint64_t sub_2471D1964(uint64_t a1)
{
  sub_2471CF994(a1);
  return 1;
}

void sub_2471D197C()
{
  sub_2471CFBAC();
}

uint64_t sub_2471D199C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2471CD128;
  return sub_2471CFC10(a1);
}

uint64_t sub_2471D19F0()
{
  type metadata accessor for ScreenReaderFlow();
  return sub_2471D7318();
}

uint64_t sub_2471D1A14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2471D1A5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a2);
  OUTLINED_FUNCTION_50_0(*(_QWORD *)(v2 - 8));
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2471D1A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2471D1AD0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_68_0(v1);
  return sub_2471D1170(v2, v3);
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x2495737C0);
  return result;
}

uint64_t sub_2471D1B4C(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_2471D1B6C(void (*a1)(void))
{
  a1();
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2471D1B88()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_68_0(v1);
  return sub_2471D0964(v2, v3);
}

void sub_2471D1BD0(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_2471D77E0();
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
  OUTLINED_FUNCTION_46_0();
}

void sub_2471D1C74(uint64_t a1, void *a2)
{
  id v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257679DE0);
  v3 = (id)sub_2471D76FC();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setCommands_, v3);

}

void sub_2471D1CD8(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x249573754](a4, v6), a1);
  }
  OUTLINED_FUNCTION_44();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return swift_task_switch();
}

BOOL OUTLINED_FUNCTION_7_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t a1)
{
  return sub_2471D15E8(a1);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 192) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 208) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_17_0@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v2, a1, *(_QWORD *)(v3 + 216));
}

uint64_t OUTLINED_FUNCTION_19_0(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getErrorValue();
}

uint64_t OUTLINED_FUNCTION_21_0@<X0>(uint64_t (*a1)(uint64_t)@<X8>)
{
  uint64_t v1;

  return a1(v1);
}

void OUTLINED_FUNCTION_22_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1, char a2, uint64_t a3)
{
  return sub_2471D2214(a1, a2, a3);
}

void OUTLINED_FUNCTION_26_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_28_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
  return sub_2471D77E0();
}

id OUTLINED_FUNCTION_30_0()
{
  void *v0;

  return v0;
}

_WORD *OUTLINED_FUNCTION_31_0(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return sub_2471D75DC();
}

uint64_t OUTLINED_FUNCTION_33_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_34_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_35_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v3, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  return sub_2471D20A0(v9, (uint64_t)&a9);
}

BOOL OUTLINED_FUNCTION_39_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_40_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return swift_task_dealloc();
}

BOOL OUTLINED_FUNCTION_47_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  return sub_2471D7798();
}

uint64_t OUTLINED_FUNCTION_50_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t *OUTLINED_FUNCTION_51_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  v2[3] = a1;
  v2[4] = a2;
  return __swift_allocate_boxed_opaque_existential_1(v2);
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return sub_2471D745C();
}

uint64_t OUTLINED_FUNCTION_56_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_57_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_60_0()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_61_0()
{
  return sub_2471D78B8();
}

void OUTLINED_FUNCTION_65_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_66_0()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_67_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_68_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_71_0()
{
  return sub_2471D73E4();
}

uint64_t OUTLINED_FUNCTION_72_0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  return sub_2471D43D0(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return sub_2471D7624();
}

uint64_t OUTLINED_FUNCTION_75_0()
{
  return sub_2471D7708();
}

uint64_t OUTLINED_FUNCTION_76_0()
{
  return swift_allocObject();
}

uint64_t type metadata accessor for ReadThisCATProvider()
{
  uint64_t result;

  result = qword_257679E00;
  if (!qword_257679E00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2471D2064()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2471D20A0(uint64_t a1, uint64_t a2)
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
  __int128 v14;
  uint64_t v15;
  _BYTE v16[40];

  v4 = sub_2471D75E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679DE8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2471D2434(a2, (uint64_t)&v14);
  if (v15)
  {
    sub_2471CF518(&v14, (uint64_t)v16);
    sub_2471D75B8();
    sub_2471D1A8C((uint64_t)v16, (uint64_t)&v14);
    sub_2471D75AC();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  }
  else
  {
    sub_2471D247C((uint64_t)&v14);
  }
  v11 = sub_2471D7288();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v12 = sub_2471D75C4();
  sub_2471D247C(a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v12;
}

uint64_t sub_2471D2214(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 + 24) = a3;
  *(_QWORD *)(v4 + 32) = v3;
  *(_BYTE *)(v4 + 64) = a2;
  *(_QWORD *)(v4 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2471D2234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t, _QWORD);

  v1 = sub_2471D2364(*(_BYTE *)(v0 + 64));
  v3 = v2;
  *(_QWORD *)(v0 + 40) = v2;
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))((int)*MEMORY[0x24BE92870] + MEMORY[0x24BE92870]);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v4;
  *v4 = v0;
  v4[1] = sub_2471D22BC;
  return v6(*(_QWORD *)(v0 + 16), v1, v3, *(_QWORD *)(v0 + 24));
}

uint64_t sub_2471D22BC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 56) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2471D2330()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2471D2364(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2471D239C + 4 * byte_2471D81B0[a1]))(0xD000000000000013, 0x80000002471D8A40);
}

uint64_t sub_2471D239C(uint64_t a1)
{
  return a1 + 9;
}

void sub_2471D23E4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2471D2410()
{
  sub_2471D75D0();
  return swift_deallocClassInstance();
}

uint64_t sub_2471D242C()
{
  return type metadata accessor for ReadThisCATProvider();
}

uint64_t sub_2471D2434(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679E58);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2471D247C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679E58);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2471D24BC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2471D522C(*a1, *a2);
}

uint64_t sub_2471D24C8@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2471D2364(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2471D24F0()
{
  uint64_t inited;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257679F58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2471D8220;
  *(_QWORD *)(inited + 32) = 0xD000000000000010;
  *(_QWORD *)(inited + 40) = 0x80000002471D8AF0;
  *(_QWORD *)(inited + 48) = 0xD000000000000016;
  *(_QWORD *)(inited + 56) = 0x80000002471D8820;
  *(_QWORD *)(inited + 64) = 0x697261666153;
  *(_QWORD *)(inited + 72) = 0xE600000000000000;
  *(_QWORD *)(inited + 80) = 0xD000000000000012;
  *(_QWORD *)(inited + 88) = 0x80000002471D8B10;
  result = sub_2471D4AE8(inited);
  qword_25767AA80 = result;
  return result;
}

uint64_t SiriReaderFlowProvider.__allocating_init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  SiriReaderFlowProvider.init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(a1, a2, a3, a4);
  return v8;
}

uint64_t SiriReaderFlowProvider.init(referenceResolver:aceServiceInvoker:deviceState:outputPublisher:)(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;

  sub_2471CF518(a1, v4 + 16);
  sub_2471CF518(a2, v4 + 56);
  sub_2471CF518(a3, v4 + 96);
  sub_2471D2654(a4, v4 + 136);
  return v4;
}

uint64_t sub_2471D2654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257679C28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void SiriReaderFlowProvider.findFlow(for:)()
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, uint64_t);
  NSObject *v33;
  os_log_type_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87[2];

  OUTLINED_FUNCTION_8();
  v80 = v0;
  v81 = v3;
  v5 = v4;
  v6 = sub_2471D7468();
  v68 = *(_QWORD *)(v6 - 8);
  v69 = v6;
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_7_1();
  v67 = v8;
  OUTLINED_FUNCTION_27_0();
  v9 = sub_2471D7450();
  OUTLINED_FUNCTION_26_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_7_1();
  v71 = v11;
  OUTLINED_FUNCTION_27_0();
  v12 = sub_2471D7594();
  v77 = *(_QWORD *)(v12 - 8);
  v78 = v12;
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_7_1();
  v76 = v14;
  OUTLINED_FUNCTION_27_0();
  v15 = sub_2471D7438();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_8_1();
  v83 = v17;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v18);
  v85 = (uint64_t)&v64 - v19;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v20);
  v79 = (uint64_t)&v64 - v21;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v64 - v23;
  v86 = OUTLINED_FUNCTION_14();
  v84 = *(_QWORD *)(v86 - 8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x24BDAC7A8](v26);
  v66 = (uint64_t)&v64 - v27;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v64 - v29;
  if (qword_257679460 != -1)
    swift_once();
  v74 = v1;
  v75 = v2;
  v70 = v9;
  v31 = __swift_project_value_buffer(v86, (uint64_t)qword_25767AA90);
  v32 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v84 + 16);
  v72 = v31;
  v73 = v32;
  OUTLINED_FUNCTION_39_1((uint64_t)v30, v31, v32);
  v82 = (uint8_t *)v5;
  OUTLINED_FUNCTION_20_0((uint64_t)v24, v5);
  v33 = sub_2471D7624();
  v34 = sub_2471D7798();
  v35 = (void (*)(uint64_t, uint64_t))v34;
  if (os_log_type_enabled(v33, v34))
  {
    v65 = v16;
    v36 = (uint8_t *)OUTLINED_FUNCTION_2_0();
    v87[0] = OUTLINED_FUNCTION_2_0();
    *(_DWORD *)v36 = 136315138;
    v64 = v36 + 4;
    OUTLINED_FUNCTION_20_0(v79, (uint64_t)v24);
    v37 = sub_2471D76D8();
    v39 = sub_2471D43D0(v37, v38, v87);
    OUTLINED_FUNCTION_44_1(v39);
    sub_2471D77E0();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v65 + 8))(v24, v15);
    OUTLINED_FUNCTION_21(&dword_2471C7000, v33, (os_log_type_t)v35, "Finding flow for parse: %s", v36);
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_0_0();
  }
  OUTLINED_FUNCTION_32_1((uint64_t)v24);

  OUTLINED_FUNCTION_22_1();
  v40 = v16;
  v41 = v85;
  v42 = (uint64_t)v82;
  OUTLINED_FUNCTION_20_0(v85, (uint64_t)v82);
  v43 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 88))(v41, v15);
  v44 = v83;
  if (v43 == *MEMORY[0x24BE98E08])
  {
    OUTLINED_FUNCTION_6_1();
    v46 = v76;
    v45 = v77;
    v47 = v78;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v77 + 32))(v76, v42, v78);
    sub_2471D3160();
    (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
  }
  else if (v43 == *MEMORY[0x24BE98E10])
  {
    OUTLINED_FUNCTION_6_1();
    OUTLINED_FUNCTION_35_1();
    swift_unknownObjectRelease();
  }
  else if (v43 == *MEMORY[0x24BE98E98])
  {
    OUTLINED_FUNCTION_6_1();
    v48 = v74;
    v50 = v70;
    v49 = v71;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v74 + 32))(v71, v42, v70);
    v51 = v67;
    sub_2471D7444();
    v52 = sub_2471D7474();
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v51, v69);
    if (v52)
    {
      OUTLINED_FUNCTION_35_1();
      swift_unknownObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
    }
    else
    {
      v60 = v66;
      OUTLINED_FUNCTION_42_1(v66);
      v61 = sub_2471D7624();
      v62 = sub_2471D7798();
      if (OUTLINED_FUNCTION_4_1(v62))
      {
        v63 = (uint8_t *)OUTLINED_FUNCTION_2_1();
        *(_WORD *)v63 = 0;
        OUTLINED_FUNCTION_13(&dword_2471C7000, v61, (os_log_type_t)v60, "Unable to convert user parse to user dialog act, returning no flow", v63);
        OUTLINED_FUNCTION_0_0();
      }

      v35(v60, v86);
      sub_2471D7324();
      (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v49, v50);
    }
  }
  else
  {
    v53 = v75;
    OUTLINED_FUNCTION_42_1(v75);
    OUTLINED_FUNCTION_20_0(v44, v42);
    v54 = sub_2471D7624();
    v55 = sub_2471D77B0();
    if (os_log_type_enabled(v54, v55))
    {
      v56 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      v84 = OUTLINED_FUNCTION_2_0();
      v87[0] = v84;
      *(_DWORD *)v56 = 136315138;
      v82 = v56 + 4;
      OUTLINED_FUNCTION_20_0(v79, v44);
      v57 = sub_2471D76D8();
      v59 = sub_2471D43D0(v57, v58, v87);
      OUTLINED_FUNCTION_44_1(v59);
      sub_2471D77E0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_32_1(v44);
      OUTLINED_FUNCTION_21(&dword_2471C7000, v54, v55, "Received unsupported parse: %s", v56);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_32_1(v44);

    v35(v53, v86);
    sub_2471D7324();
    OUTLINED_FUNCTION_32_1(v85);
  }
  OUTLINED_FUNCTION_1_0();
}

void sub_2471D2CA8()
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
  char *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42[2];
  __int128 v43[2];
  __int128 v44[3];

  OUTLINED_FUNCTION_8();
  v1 = v0;
  v41 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C98);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_1();
  v38 = v4;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)v37 - v6;
  v7 = OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_26_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8_1();
  v40 = v9;
  OUTLINED_FUNCTION_16_0();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v37 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v37 - v14;
  if (qword_257679460 != -1)
    swift_once();
  __swift_project_value_buffer(v7, (uint64_t)qword_25767AA90);
  OUTLINED_FUNCTION_17_1((uint64_t)v15);
  v16 = sub_2471D7624();
  v17 = sub_2471D7798();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)OUTLINED_FUNCTION_2_1();
    v37[1] = v7;
    *(_WORD *)v18 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v16, v17, "Handling NLv4 parse", v18);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_37((uint64_t)v15);
  v19 = swift_unknownObjectRetain();
  v20 = ReaderNLv4Intent.init(userDialogAct:)(v19);
  if ((ReaderNLv4Intent.shouldStartScreenReader.getter(v20, v21, v22) & 1) != 0)
  {
    OUTLINED_FUNCTION_17_1((uint64_t)v13);
    v23 = sub_2471D7624();
    v24 = sub_2471D7798();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)OUTLINED_FUNCTION_2_1();
      *(_WORD *)v25 = 0;
      OUTLINED_FUNCTION_13(&dword_2471C7000, v23, v24, "Creating ScreenReaderFlow", v25);
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_37((uint64_t)v13);
    sub_2471D4E4C(v1 + 136, (uint64_t)v44, &qword_257679C28);
    sub_2471CF1D8(v1 + 96, (uint64_t)v43);
    type metadata accessor for ScreenReaderFlow();
    v26 = swift_allocObject();
    sub_2471D2654((uint64_t)v44, v26 + 16);
    sub_2471CF518(v43, v26 + 56);
    *(_QWORD *)&v44[0] = v26;
    sub_2471CF478(&qword_257679DF8, (uint64_t (*)(uint64_t))type metadata accessor for ScreenReaderFlow, (uint64_t)&unk_2471D8144);
    sub_2471D72E8();
    swift_release();
    sub_2471D7330();
    OUTLINED_FUNCTION_38_0();
    swift_release();
    goto LABEL_14;
  }
  if ((ReaderNLv4Intent.read.getter() & 1) == 0)
  {
    sub_2471D7324();
    OUTLINED_FUNCTION_38_0();
LABEL_14:
    swift_release();
    swift_release();
    goto LABEL_15;
  }
  v27 = v40;
  OUTLINED_FUNCTION_17_1(v40);
  v28 = sub_2471D7624();
  v29 = sub_2471D7798();
  if (OUTLINED_FUNCTION_4_1(v29))
  {
    v30 = (uint8_t *)OUTLINED_FUNCTION_2_1();
    *(_WORD *)v30 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v28, v27, "Creating ReadThisFlow", v30);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_37(v40);
  v31 = (uint64_t)v39;
  sub_2471D3438();
  v32 = v38;
  sub_2471D4E4C(v31, v38, &qword_257679C98);
  sub_2471CF1D8(v1 + 56, (uint64_t)v44);
  sub_2471D4E4C(v1 + 136, (uint64_t)v43, &qword_257679C28);
  sub_2471CF1D8(v1 + 96, (uint64_t)v42);
  v33 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v34 = sub_2471D4E8C(v33);
  v36 = v35;
  type metadata accessor for ReadThisFlow(0);
  OUTLINED_FUNCTION_42();
  *(_QWORD *)&v44[0] = sub_2471CA550(v32, v34, v36, v44, (uint64_t)v43, v42);
  sub_2471CF478(&qword_257679C78, type metadata accessor for ReadThisFlow, (uint64_t)&unk_2471D8094);
  sub_2471D72E8();
  swift_release();
  sub_2471D7330();
  OUTLINED_FUNCTION_24_1();
  OUTLINED_FUNCTION_38_0();
  swift_release();
  swift_release();
  sub_2471CF4B4(v31, &qword_257679C98);
LABEL_15:
  OUTLINED_FUNCTION_1_0();
}

void sub_2471D3160()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  char v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[3];
  __int128 v25[2];
  _BYTE v26[40];
  __int128 v27[2];

  OUTLINED_FUNCTION_8();
  v5 = v4;
  v24[2] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679C98);
  OUTLINED_FUNCTION_32();
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_45_1();
  type metadata accessor for ReaderNLv3Intent();
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_18_0();
  v12 = sub_2471D7630();
  OUTLINED_FUNCTION_26_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_7();
  if (qword_257679460 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v12, (uint64_t)qword_25767AA90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v0, v14, v12);
  v15 = sub_2471D7624();
  v16 = sub_2471D7798();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_2_1();
    v24[1] = v2;
    *(_WORD *)v17 = 0;
    OUTLINED_FUNCTION_13(&dword_2471C7000, v15, v16, "Handling NLv3 parse", v17);
    OUTLINED_FUNCTION_0_0();
  }

  OUTLINED_FUNCTION_33_1(v0, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  v18 = sub_2471D7594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v2, v5, v18);
  ReaderNLv3Intent.read.getter();
  if ((v19 & 1) != 0)
  {
    sub_2471D3438();
    sub_2471D4E4C(v1, (uint64_t)v10, &qword_257679C98);
    sub_2471CF1D8(v0 + 56, (uint64_t)v27);
    sub_2471D4E4C(v0 + 136, (uint64_t)v26, &qword_257679C28);
    sub_2471CF1D8(v0 + 96, (uint64_t)v25);
    v20 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
    v21 = sub_2471D4E8C(v20);
    v23 = v22;
    type metadata accessor for ReadThisFlow(0);
    OUTLINED_FUNCTION_42();
    *(_QWORD *)&v27[0] = sub_2471CA550((uint64_t)v10, v21, v23, v27, (uint64_t)v26, v25);
    sub_2471CF478(&qword_257679C78, type metadata accessor for ReadThisFlow, (uint64_t)&unk_2471D8094);
    sub_2471D72E8();
    swift_release();
    sub_2471D7330();
    OUTLINED_FUNCTION_24_1();
    sub_2471CF4B4(v1, &qword_257679C98);
  }
  else
  {
    sub_2471D7324();
  }
  sub_2471D4E10(v2);
  OUTLINED_FUNCTION_1_0();
}

void sub_2471D3438()
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
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
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

  OUTLINED_FUNCTION_8();
  v44 = v0;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_14();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_19_1();
  MEMORY[0x24BDAC7A8](v7);
  v43 = (uint64_t)&v38 - v8;
  OUTLINED_FUNCTION_27_0();
  v9 = sub_2471D76B4();
  v42 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = (v12 - v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679BE8);
  OUTLINED_FUNCTION_32();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (void **)((char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_45_1();
  sub_2471D7540();
  OUTLINED_FUNCTION_42();
  v45 = sub_2471D7534();
  v18 = MEMORY[0x249573028]();
  if (!v18)
  {
    if (qword_257679460 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v5, (uint64_t)qword_25767AA90);
    OUTLINED_FUNCTION_43_1(v2, v30, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    sub_2471D7624();
    v31 = OUTLINED_FUNCTION_34_1();
    if (OUTLINED_FUNCTION_4_1(v31))
    {
      v32 = (uint8_t *)OUTLINED_FUNCTION_2_1();
      *(_WORD *)v32 = 0;
      OUTLINED_FUNCTION_13(&dword_2471C7000, v13, (os_log_type_t)v2, "Could not create query entity for SiriReferenceResolution", v32);
      OUTLINED_FUNCTION_0_0();
    }

    OUTLINED_FUNCTION_23_1();
    OUTLINED_FUNCTION_13_0(v2, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
    v35 = OUTLINED_FUNCTION_30_1();
    v36 = v4;
    goto LABEL_14;
  }
  v38 = v9;
  v39 = v6;
  v40 = v5;
  v41 = v4;
  v19 = v18;
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v44 + 16), *(_QWORD *)(v44 + 40));
  sub_2471D766C();
  OUTLINED_FUNCTION_42();
  swift_retain();
  sub_2471D7660();
  sub_2471D7618();
  swift_release();
  sub_2471D4E4C(v1, (uint64_t)v17, &qword_257679BE8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v44 = v19;
    v20 = *v17;
    if (qword_257679460 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v40, (uint64_t)qword_25767AA90);
    v22 = v39;
    v23 = v43;
    OUTLINED_FUNCTION_43_1(v43, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v39 + 16));
    v24 = v20;
    v25 = v20;
    sub_2471D7624();
    v26 = OUTLINED_FUNCTION_34_1();
    if (os_log_type_enabled(v13, v26))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_2_0();
      v47 = OUTLINED_FUNCTION_2_0();
      v42 = v1;
      *(_DWORD *)v27 = 136315138;
      swift_getErrorValue();
      v28 = sub_2471D78B8();
      v46 = sub_2471D43D0(v28, v29, &v47);
      sub_2471D77E0();
      OUTLINED_FUNCTION_56();
      OUTLINED_FUNCTION_15_1();
      OUTLINED_FUNCTION_15_1();
      OUTLINED_FUNCTION_21(&dword_2471C7000, v13, v26, "Failed to make SRR resolve call %s", v27);
      OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_0_0();
    }
    OUTLINED_FUNCTION_23_1();

    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_15_1();
    OUTLINED_FUNCTION_15_1();
    swift_release();
    OUTLINED_FUNCTION_13_0(v23, *(uint64_t (**)(uint64_t, uint64_t))(v22 + 8));
    sub_2471CF4B4(v1, &qword_257679BE8);
    v37 = v41;
    v35 = OUTLINED_FUNCTION_30_1();
    v36 = v37;
LABEL_14:
    __swift_storeEnumTagSinglePayload(v36, 1, 1, v35);
    goto LABEL_15;
  }
  v33 = v42;
  v34 = v38;
  OUTLINED_FUNCTION_39_1((uint64_t)v13, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 32));
  sub_2471D38C4();
  swift_release();
  OUTLINED_FUNCTION_23_1();
  (*(void (**)(NSObject *, uint64_t))(v33 + 8))(v13, v34);
  sub_2471CF4B4(v1, &qword_257679BE8);
LABEL_15:
  OUTLINED_FUNCTION_1_0();
}

void sub_2471D38C4()
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
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;

  OUTLINED_FUNCTION_8();
  v2 = v1;
  v25 = v3;
  v4 = OUTLINED_FUNCTION_30_1();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_0();
  v8 = v7 - v6;
  v9 = sub_2471D7654();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  v14 = sub_2471D76B4();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_43_1(v0, v2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 88))(v0, v14);
  if (v16 == *MEMORY[0x24BEA5AA8])
  {
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_39_1(v13, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 32));
    if (qword_257679450 != -1)
      swift_once();
    v17 = qword_25767AA80;
    sub_2471D7648();
    v18 = sub_2471D7684();
    v20 = v19;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
    LOBYTE(v18) = sub_2471D3B34(v18, v20, v17);
    swift_bridgeObjectRelease();
    if ((v18 & 1) != 0)
    {
      sub_2471D7648();
      OUTLINED_FUNCTION_40_0();
      v21 = v25;
      v22 = 0;
LABEL_12:
      OUTLINED_FUNCTION_36_1(v21, v22);
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_40_0();
LABEL_11:
    v21 = v25;
    v22 = 1;
    goto LABEL_12;
  }
  v23 = v16;
  if (v16 == *MEMORY[0x24BEA5AB8] || v16 == *MEMORY[0x24BEA5AB0])
  {
    OUTLINED_FUNCTION_10_0();
    sub_2471D3C68();
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  if (v16 == *MEMORY[0x24BEA5AC0])
  {
    OUTLINED_FUNCTION_10_0();
    if (!*(_QWORD *)(*(_QWORD *)v0 + 16))
    {
      OUTLINED_FUNCTION_56();
      goto LABEL_11;
    }
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_56();
    sub_2471D3C68();
    goto LABEL_9;
  }
  v24 = *MEMORY[0x24BEA5AC8];
  OUTLINED_FUNCTION_36_1(v25, 1);
  if (v23 != v24)
    OUTLINED_FUNCTION_13_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
LABEL_13:
  OUTLINED_FUNCTION_1_0();
}

uint64_t sub_2471D3B34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2471D78C4();
    sub_2471D76E4();
    v6 = sub_2471D78DC();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2471D78AC() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2471D78AC() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_2471D3C68()
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
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, NSObject *, uint64_t);
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  _QWORD v40[2];
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(NSObject *, uint64_t, uint64_t);
  NSObject *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  OUTLINED_FUNCTION_8();
  v2 = v1;
  v4 = v3;
  v5 = OUTLINED_FUNCTION_14();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_7_1();
  v43 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679F48);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_18_0();
  v9 = sub_2471D769C();
  v50 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_32();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v13 = v12 - v11;
  v14 = sub_2471D7654();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8_1();
  v49 = v16;
  OUTLINED_FUNCTION_16_0();
  MEMORY[0x24BDAC7A8](v17);
  v19 = ((char *)v40 - v18);
  v20 = MEMORY[0x24BEE4AF8];
  v52 = MEMORY[0x24BEE4AF8];
  v21 = *(_QWORD *)(v2 + 16);
  swift_bridgeObjectRetain();
  v51 = v15;
  if (v21)
  {
    v41 = v0;
    v42 = v4;
    v22 = *(unsigned __int8 *)(v15 + 80);
    v23 = *(_QWORD *)(v15 + 72);
    v40[1] = v2;
    v46 = (v22 + 32) & ~v22;
    v47 = v9;
    v24 = v2 + v46;
    v48 = *(void (**)(NSObject *, uint64_t, uint64_t))(v15 + 16);
    do
    {
      v48(v19, v24, v14);
      if (qword_257679450 != -1)
        swift_once();
      v25 = qword_25767AA80;
      sub_2471D7648();
      v26 = sub_2471D7684();
      v28 = v27;
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v13, v9);
      LOBYTE(v26) = sub_2471D3B34(v26, v28, v25);
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
      {
        v29 = *(void (**)(uint64_t, NSObject *, uint64_t))(v51 + 32);
        v29((uint64_t)v49, v19, v14);
        v30 = v52;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2471D4CB4(0, *(_QWORD *)(v30 + 16) + 1, 1);
          v30 = v52;
        }
        v32 = *(_QWORD *)(v30 + 16);
        v31 = *(_QWORD *)(v30 + 24);
        if (v32 >= v31 >> 1)
        {
          sub_2471D4CB4(v31 > 1, v32 + 1, 1);
          v30 = v52;
        }
        *(_QWORD *)(v30 + 16) = v32 + 1;
        v29(v30 + v46 + v32 * v23, v49, v14);
        v52 = v30;
        v9 = v47;
      }
      else
      {
        OUTLINED_FUNCTION_33_1((uint64_t)v19, *(uint64_t (**)(uint64_t, uint64_t))(v51 + 8));
      }
      v24 += v23;
      --v21;
    }
    while (v21);
    v20 = v52;
    v0 = v41;
    v4 = v42;
  }
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v20 + 16))
  {
    sub_2471D6D78(v20, v0);
    OUTLINED_FUNCTION_24_1();
    if (__swift_getEnumTagSinglePayload(v0, 1, v14) != 1)
    {
      sub_2471D7648();
      OUTLINED_FUNCTION_33_1(v0, *(uint64_t (**)(uint64_t, uint64_t))(v51 + 8));
      v39 = 0;
      goto LABEL_24;
    }
    sub_2471CF4B4(v0, &qword_257679F48);
  }
  else
  {
    OUTLINED_FUNCTION_24_1();
    if (qword_257679460 != -1)
      swift_once();
    v33 = v45;
    v34 = __swift_project_value_buffer(v45, (uint64_t)qword_25767AA90);
    v36 = v43;
    v35 = v44;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16))(v43, v34, v33);
    sub_2471D7624();
    v37 = OUTLINED_FUNCTION_34_1();
    if (OUTLINED_FUNCTION_4_1(v37))
    {
      v38 = (uint8_t *)OUTLINED_FUNCTION_2_1();
      *(_WORD *)v38 = 0;
      OUTLINED_FUNCTION_13(&dword_2471C7000, v19, (os_log_type_t)v36, "None of the entities are from Safari", v38);
      OUTLINED_FUNCTION_0_0();
    }

    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v33);
  }
  v39 = 1;
LABEL_24:
  __swift_storeEnumTagSinglePayload(v4, v39, 1, v9);
  OUTLINED_FUNCTION_1_0();
}

uint64_t SiriReaderFlowProvider.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  sub_2471CF4B4(v0 + 136, &qword_257679C28);
  return v0;
}

uint64_t SiriReaderFlowProvider.__deallocating_deinit()
{
  SiriReaderFlowProvider.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2471D4090(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_2471D40A0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

char *sub_2471D40D4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2471D7840();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2471D4154(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2471D7840();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_2471D7654(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_2471D7654();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_2471D4250(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_2471D7654() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_2471D7840();
  __break(1u);
  return result;
}

uint64_t sub_2471D4344(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2471D4364(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_2471D43D0(v6, v7, a3);
  v8 = *a1 + 8;
  sub_2471D77E0();
  result = OUTLINED_FUNCTION_56();
  *a1 = v8;
  return result;
}

uint64_t sub_2471D43D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2471D44A0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2471D4EF8((uint64_t)v12, *a3);
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
      sub_2471D4EF8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2471D44A0(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2471D45F4((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2471D77EC();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2471D46B8(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2471D781C();
    if (!v8)
    {
      result = sub_2471D7828();
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

void *sub_2471D45F4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2471D7840();
  __break(1u);
  return result;
}

uint64_t sub_2471D46B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2471D474C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2471D4920(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2471D4920((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2471D474C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2471D76F0();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_2471D48BC(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2471D7804();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2471D7840();
  __break(1u);
LABEL_14:
  result = sub_2471D7828();
  __break(1u);
  return result;
}

_QWORD *sub_2471D48BC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679F68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2471D4920(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257679F68);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2471D40D4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2471D49F4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2471D49F4(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2471D7840();
  __break(1u);
  return result;
}

_BYTE **sub_2471D4AB8(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t type metadata accessor for SiriReaderFlowProvider()
{
  return objc_opt_self();
}

uint64_t sub_2471D4AE8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679F60);
  result = sub_2471D77F8();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    sub_2471D78C4();
    swift_bridgeObjectRetain();
    sub_2471D76E4();
    result = sub_2471D78DC();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = sub_2471D78AC(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = sub_2471D78AC();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

size_t sub_2471D4CB4(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2471D4CD0(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

size_t sub_2471D4CD0(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257679F50);
  v10 = *(_QWORD *)(sub_2471D7654() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_2471D7654() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2471D4154(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2471D4250(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2471D4E10(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ReaderNLv3Intent();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2471D4E4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_44();
}

uint64_t sub_2471D4E8C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_languageCode);

  if (!v2)
    return 0;
  v3 = sub_2471D76CC();

  return v3;
}

uint64_t sub_2471D4EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_slowAlloc();
}

BOOL OUTLINED_FUNCTION_4_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 96))(*(_QWORD *)(v2 - 120), v0);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 96))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_13_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_15_1()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 128) + 8))(v0, *(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_24_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_30_1()
{
  return sub_2471D769C();
}

uint64_t OUTLINED_FUNCTION_32_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_33_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_34_1()
{
  return sub_2471D77B0();
}

void OUTLINED_FUNCTION_35_1()
{
  sub_2471D2CA8();
}

uint64_t OUTLINED_FUNCTION_36_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_37(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_39_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_42_1(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(v1 - 216))(a1, *(_QWORD *)(v1 - 224), *(_QWORD *)(v1 - 112));
}

uint64_t OUTLINED_FUNCTION_43_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_44_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return v1 - 104;
}

uint64_t OUTLINED_FUNCTION_45_1()
{
  return 0;
}

uint64_t sub_2471D50D0()
{
  uint64_t result;

  sub_2471D51F0();
  result = sub_2471D77C8();
  qword_25767AA88 = result;
  return result;
}

uint64_t sub_2471D5130()
{
  uint64_t v0;
  id v1;

  v0 = sub_2471D7630();
  __swift_allocate_value_buffer(v0, qword_25767AA90);
  __swift_project_value_buffer(v0, (uint64_t)qword_25767AA90);
  if (qword_257679458 != -1)
    swift_once();
  v1 = (id)qword_25767AA88;
  return sub_2471D763C();
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

unint64_t sub_2471D51F0()
{
  unint64_t result;

  result = qword_257679F70;
  if (!qword_257679F70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257679F70);
  }
  return result;
}

uint64_t sub_2471D522C(uint64_t a1, uint64_t a2)
{
  return sub_2471D5238(a1, a2, (uint64_t (*)(void))sub_2471D2364);
}

uint64_t sub_2471D5238(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v5 = a3();
  v7 = v6;
  if (v5 == ((uint64_t (*)(uint64_t))a3)(a2) && v7 == v8)
    v10 = 1;
  else
    v10 = OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2_2();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_2471D52B8(char a1)
{
  sub_2471D78C4();
  sub_2471D56FC(a1);
  sub_2471D76E4();
  swift_bridgeObjectRelease();
  return sub_2471D78DC();
}

uint64_t sub_2471D5318(uint64_t a1, char a2)
{
  sub_2471D56FC(a2);
  sub_2471D76E4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2471D5358(uint64_t a1, char a2)
{
  sub_2471D78C4();
  sub_2471D56FC(a2);
  sub_2471D76E4();
  swift_bridgeObjectRelease();
  return sub_2471D78DC();
}

uint64_t ReaderNLv3Intent.init(intent:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_8_2();
  return OUTLINED_FUNCTION_4_2(a2, a1, v4, *(uint64_t (**)(void))(*(_QWORD *)(v4 - 8) + 32));
}

void ReaderNLv3Intent.read.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE400000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

uint64_t sub_2471D54A8()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767A038);
  swift_allocObject();
  result = sub_2471D7498();
  qword_257679F78 = result;
  return result;
}

uint64_t sub_2471D5504()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767A030);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_2471D8290;
  if (qword_257679468 != -1)
    swift_once();
  v1 = qword_257679F78;
  *(_QWORD *)(v0 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_25767A038);
  *(_QWORD *)(v0 + 64) = sub_2471D63CC(&qword_25767A040, &qword_25767A038);
  *(_QWORD *)(v0 + 32) = v1;
  sub_2471D748C();
  swift_allocObject();
  swift_retain();
  result = sub_2471D7480();
  qword_257679F80 = result;
  return result;
}

uint64_t ReaderNLv3Intent.intent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_8_2();
  return OUTLINED_FUNCTION_4_2(a1, v1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 16));
}

uint64_t ReaderNLv3Intent.intent.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_8_2();
  return OUTLINED_FUNCTION_4_2(v1, a1, v3, *(uint64_t (**)(void))(*(_QWORD *)(v3 - 8) + 40));
}

uint64_t (*ReaderNLv3Intent.intent.modify())()
{
  return nullsub_1;
}

uint64_t ReaderNLv3Intent.domainOntologyNode.getter()
{
  if (qword_257679470 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_2471D56A8()
{
  unint64_t v0;

  v0 = sub_2471D784C();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

void *sub_2471D56F0()
{
  return &unk_251873918;
}

uint64_t sub_2471D56FC(char a1)
{
  return *(_QWORD *)&aRead_1[8 * a1];
}

uint64_t sub_2471D571C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_2471D5238(*a1, *a2, (uint64_t (*)(void))sub_2471D56FC) & 1;
}

uint64_t sub_2471D5744()
{
  char *v0;

  return sub_2471D52B8(*v0);
}

uint64_t sub_2471D574C(uint64_t a1)
{
  char *v1;

  return sub_2471D5318(a1, *v1);
}

uint64_t sub_2471D5754(uint64_t a1)
{
  char *v1;

  return sub_2471D5358(a1, *v1);
}

uint64_t sub_2471D575C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2471D56A8();
  *a1 = result;
  return result;
}

uint64_t sub_2471D5788@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2471D56FC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t type metadata accessor for ReaderNLv3Intent()
{
  uint64_t result;

  result = qword_257679FF0;
  if (!qword_257679FF0)
    return swift_getSingletonMetadata();
  return result;
}

void *sub_2471D57E8@<X0>(_QWORD *a1@<X8>)
{
  void *result;

  result = sub_2471D56F0();
  *a1 = result;
  return result;
}

uint64_t sub_2471D580C()
{
  sub_2471D6484();
  sub_2471D64C0();
  sub_2471D64FC();
  return sub_2471D7528();
}

void ReaderNLv3Intent.continue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE800000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.goto.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE400000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.inquire.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE700000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.select.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE600000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.skipBackward.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v11)
  {
    v9 = sub_2471D56FC(v8);
    v11 = v9 == 0x6B63614270696B73 && v10 == 0xEC00000064726177;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.skipForward.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v11)
  {
    v9 = sub_2471D56FC(v8);
    v11 = v9 == 0x77726F4670696B73 && v10 == 0xEB00000000647261;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

void ReaderNLv3Intent.stop.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;

  if (qword_257679468 != -1)
    swift_once();
  OUTLINED_FUNCTION_5_0();
  sub_2471D61D4(&qword_257679F88);
  v0 = OUTLINED_FUNCTION_0_1();
  v8 = OUTLINED_FUNCTION_7_2(v0, v1, v2, v3, v4, v5, v6, v7, v12, v13, SWORD2(v13), SBYTE6(v13), HIBYTE(v13));
  if (!v9)
  {
    OUTLINED_FUNCTION_6_2(v8);
    if (v9)
      v11 = v10 == 0xE400000000000000;
    else
      v11 = 0;
    if (!v11)
      OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_2_2();
  }
  OUTLINED_FUNCTION_46_0();
}

uint64_t sub_2471D5E24()
{
  return sub_2471D61D4(&qword_257679F88);
}

uint64_t sub_2471D5E48()
{
  return sub_2471D61D4(&qword_257679F90);
}

uint64_t sub_2471D5E6C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2471D7594();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_2471D5EA4()
{
  return ReaderNLv3Intent.domainOntologyNode.getter();
}

uint64_t sub_2471D5EB8()
{
  sub_2471D61D4(&qword_25767A028);
  return sub_2471D74BC();
}

uint64_t sub_2471D5F00()
{
  sub_2471D61D4(&qword_25767A028);
  return sub_2471D74A4();
}

uint64_t sub_2471D5F38()
{
  sub_2471D61D4(&qword_25767A028);
  return sub_2471D74B0();
}

uint64_t initializeBufferWithCopyOfBuffer for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7594();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t destroy for ReaderNLv3Intent(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2471D7594();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t assignWithCopy for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t initializeWithTake for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t assignWithTake for ReaderNLv3Intent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2471D7594();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for ReaderNLv3Intent()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2471D60FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_8_2();
  return __swift_getEnumTagSinglePayload(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ReaderNLv3Intent()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2471D6138(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_8_2();
  return __swift_storeEnumTagSinglePayload(a1, a2, a2, v4);
}

uint64_t sub_2471D616C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2471D7594();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2471D61D4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    type metadata accessor for ReaderNLv3Intent();
    OUTLINED_FUNCTION_9_0();
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ReaderNLv3Intent.Verb(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ReaderNLv3Intent.Verb(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2471D62E0 + 4 * byte_2471D82A5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2471D6314 + 4 * byte_2471D82A0[v4]))();
}

uint64_t sub_2471D6314(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471D631C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2471D6324);
  return result;
}

uint64_t sub_2471D6330(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2471D6338);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2471D633C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2471D6344(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ReaderNLv3Intent.Verb()
{
  return &type metadata for ReaderNLv3Intent.Verb;
}

unint64_t sub_2471D6364()
{
  unint64_t result;

  result = qword_25767A048;
  if (!qword_25767A048)
  {
    result = MEMORY[0x249573754](&unk_2471D8450, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A048);
  }
  return result;
}

uint64_t sub_2471D63A0()
{
  return sub_2471D63CC(&qword_25767A050, &qword_25767A058);
}

uint64_t sub_2471D63CC(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_9_0();
  }
  return result;
}

unint64_t sub_2471D6408()
{
  unint64_t result;

  result = qword_25767A060;
  if (!qword_25767A060)
  {
    result = MEMORY[0x249573754](&unk_2471D8388, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A060);
  }
  return result;
}

unint64_t sub_2471D6448()
{
  unint64_t result;

  result = qword_25767A068;
  if (!qword_25767A068)
  {
    result = MEMORY[0x249573754](&unk_2471D8490, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A068);
  }
  return result;
}

unint64_t sub_2471D6484()
{
  unint64_t result;

  result = qword_25767A070;
  if (!qword_25767A070)
  {
    result = MEMORY[0x249573754](&unk_2471D83F0, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A070);
  }
  return result;
}

unint64_t sub_2471D64C0()
{
  unint64_t result;

  result = qword_25767A078;
  if (!qword_25767A078)
  {
    result = MEMORY[0x249573754](&unk_2471D83B8, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A078);
  }
  return result;
}

unint64_t sub_2471D64FC()
{
  unint64_t result;

  result = qword_25767A080;
  if (!qword_25767A080)
  {
    result = MEMORY[0x249573754](&unk_2471D8418, &type metadata for ReaderNLv3Intent.Verb);
    atomic_store(result, (unint64_t *)&qword_25767A080);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_2471D74D4();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return sub_2471D78AC();
}

uint64_t OUTLINED_FUNCTION_4_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  return type metadata accessor for ReaderNLv3Intent();
}

uint64_t OUTLINED_FUNCTION_6_2(char a1)
{
  return sub_2471D56FC(a1);
}

uint64_t OUTLINED_FUNCTION_7_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, unsigned __int8 a13)
{
  return a13;
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  return sub_2471D7594();
}

void OUTLINED_FUNCTION_9_0()
{
  JUMPOUT(0x249573754);
}

uint64_t ReaderNLv4Intent.init(userDialogAct:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v2 = sub_2471D7630();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0();
  v6 = v5 - v4;
  objc_opt_self();
  v7 = (void *)swift_dynamicCastObjCClass();
  swift_unknownObjectRetain();
  if (!v7
    || (v8 = objc_msgSend(v7, sel_task), v9 = sub_2471D77BC(), v8, !v9))
  {
    if (qword_257679460 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v2, (uint64_t)qword_25767AA90);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v13, v2);
    v14 = sub_2471D7624();
    v15 = sub_2471D77B0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2471C7000, v14, v15, "Unable to convert USO serialized graph to USO graph Siri NL, no initial task", v16, 2u);
      MEMORY[0x2495737C0](v16, -1, -1);
    }

    OUTLINED_FUNCTION_8_3();
    OUTLINED_FUNCTION_5_1(v6, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    return a1;
  }
  v10 = swift_retain();
  v11 = MEMORY[0x249573004](v10);
  if (v11 >> 62)
  {
    result = sub_2471D7834();
    if (!result)
      goto LABEL_8;
  }
  else
  {
    result = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!result)
      goto LABEL_8;
  }
  if ((v11 & 0xC000000000000001) != 0)
  {
    MEMORY[0x24957334C](0, v11);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    swift_retain();
LABEL_8:
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_8_3();
    swift_release();
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t ReaderNLv4Intent.shouldStartScreenReader.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t result;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25767A090);
  OUTLINED_FUNCTION_1_1();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v38 - v8;
  v10 = sub_2471D757C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0();
  v14 = v13 - v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767A098);
  OUTLINED_FUNCTION_1_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0();
  v18 = v17 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25767A0A0);
  OUTLINED_FUNCTION_1_1();
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v38 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v38 - v23;
  if (!a3)
    goto LABEL_11;
  v25 = sub_2471D7588();
  v26 = sub_2471D6DF0(0x69746E4572657375, 0xEC00000073656974, v25);
  result = swift_bridgeObjectRelease();
  if (!v26)
    goto LABEL_11;
  v39 = v11;
  if (!(v26 >> 62))
  {
    if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_28:
    OUTLINED_FUNCTION_56();
    v11 = v39;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  v37 = sub_2471D7834();
  result = OUTLINED_FUNCTION_56();
  if (!v37)
    goto LABEL_28;
LABEL_5:
  if ((v26 & 0xC000000000000001) != 0)
  {
    v28 = MEMORY[0x24957334C](0, v26);
LABEL_8:
    OUTLINED_FUNCTION_56();
    v11 = v39;
    if (v28)
    {
      swift_retain();
      sub_2471D75A0();
      OUTLINED_FUNCTION_4_3();
      sub_2471D7558();
      OUTLINED_FUNCTION_3_2((uint64_t)v9);
      OUTLINED_FUNCTION_3_2((uint64_t)v7);
      v29 = sub_2471D7564();
      sub_2471D6E30((uint64_t)v7, &qword_25767A090);
      sub_2471D6E30((uint64_t)v9, &qword_25767A090);
      OUTLINED_FUNCTION_5_1(v14, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
      sub_2471D6CFC(v29, v18);
      OUTLINED_FUNCTION_56();
      v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767A0A8);
      if (__swift_getEnumTagSinglePayload(v18, 1, v30) != 1)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v24, v18 + *(int *)(v30 + 48), v10);
        OUTLINED_FUNCTION_36_1((uint64_t)v24, 0);
        v36 = sub_2471D754C();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 8))(v18, v36);
LABEL_12:
        sub_2471D71DC((uint64_t)v24, (uint64_t)v22, &qword_25767A0A0);
        if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, v10) == 1)
        {
          sub_2471D6E30((uint64_t)v22, &qword_25767A0A0);
        }
        else
        {
          v31 = (_QWORD *)sub_2471D7570();
          OUTLINED_FUNCTION_5_1((uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
          if (v31[2])
          {
            v33 = v31[4];
            v32 = v31[5];
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            if (v32)
            {
              if (v33 == 0x6E6565726373 && v32 == 0xE600000000000000)
                v35 = 1;
              else
                v35 = sub_2471D78AC();
              OUTLINED_FUNCTION_4_3();
              sub_2471D6E30((uint64_t)v24, &qword_25767A0A0);
              OUTLINED_FUNCTION_56();
              return v35 & 1;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
        }
        OUTLINED_FUNCTION_4_3();
        sub_2471D6E30((uint64_t)v24, &qword_25767A0A0);
        v35 = 0;
        return v35 & 1;
      }
      sub_2471D6E30(v18, &qword_25767A098);
    }
LABEL_11:
    OUTLINED_FUNCTION_36_1((uint64_t)v24, 1);
    goto LABEL_12;
  }
  if (*(_QWORD *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    v28 = *(_QWORD *)(v26 + 32);
    swift_retain();
    goto LABEL_8;
  }
  __break(1u);
  return result;
}

uint64_t ReaderNLv4Intent.read.getter()
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
  _QWORD v13[4];
  _BYTE v14[24];
  uint64_t v15;
  _BYTE v16[32];

  sub_2471D74E0();
  sub_2471D71DC((uint64_t)v16, (uint64_t)v14, (uint64_t *)&unk_25767A0B0);
  if (v15)
  {
    sub_2471D74F8();
    v0 = swift_dynamicCast();
    if ((_DWORD)v0)
    {
      v6 = swift_release();
      OUTLINED_FUNCTION_7_3(v6, v7, v8, v9, v10, v11);
      sub_2471D6E30((uint64_t)v14, (uint64_t *)&unk_25767A0B0);
      return 1;
    }
  }
  else
  {
    v0 = sub_2471D6E30((uint64_t)v14, (uint64_t *)&unk_25767A0B0);
  }
  OUTLINED_FUNCTION_7_3(v0, v1, v2, v3, v4, v5);
  sub_2471D6E6C((uint64_t)v14, (uint64_t)v13);
  if (v13[3])
  {
    sub_2471D751C();
    if ((swift_dynamicCast() & 1) != 0)
    {
      swift_release();
      return 1;
    }
  }
  else
  {
    sub_2471D6E30((uint64_t)v13, (uint64_t *)&unk_25767A0B0);
  }
  return 0;
}

uint64_t sub_2471D6CFC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25767A0A8);
  v6 = v5;
  if (v4)
  {
    v7 = *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80);
    sub_2471D71DC(a1 + ((v7 + 32) & ~v7), a2, &qword_25767A0A8);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v8, 1, v6);
}

uint64_t sub_2471D6D78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = sub_2471D7654();
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v7, 1, v6);
}

uint64_t sub_2471D6DF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_2471D7098(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

uint64_t sub_2471D6E30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2471D6E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25767A0B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t destroy for ReaderNLv4Intent()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_release();
}

_QWORD *_s17SiriReaderIntents16ReaderNLv4IntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ReaderNLv4Intent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
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

uint64_t assignWithTake for ReaderNLv4Intent(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectRelease();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ReaderNLv4Intent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ReaderNLv4Intent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ReaderNLv4Intent()
{
  return &type metadata for ReaderNLv4Intent;
}

unint64_t sub_2471D7098(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2471D78C4();
  sub_2471D76E4();
  v4 = sub_2471D78DC();
  return sub_2471D70FC(a1, a2, v4);
}

unint64_t sub_2471D70FC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2471D78AC() & 1) == 0)
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
      while (!v14 && (sub_2471D78AC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2471D71DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_5_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v6;
  va_list va;

  va_start(va, a6);
  return sub_2471D6E6C(v6 - 48, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_2471D7264()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2471D7270()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_2471D727C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2471D7288()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2471D7294()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2471D72A0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2471D72AC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2471D72B8()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2471D72C4()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2471D72D0()
{
  return MEMORY[0x24BE960B8]();
}

uint64_t sub_2471D72DC()
{
  return MEMORY[0x24BE960C8]();
}

uint64_t sub_2471D72E8()
{
  return MEMORY[0x24BE96E78]();
}

uint64_t sub_2471D72F4()
{
  return MEMORY[0x24BE96E98]();
}

uint64_t sub_2471D7300()
{
  return MEMORY[0x24BE96EA0]();
}

uint64_t sub_2471D730C()
{
  return MEMORY[0x24BE96EC0]();
}

uint64_t sub_2471D7318()
{
  return MEMORY[0x24BE96ED0]();
}

uint64_t sub_2471D7324()
{
  return MEMORY[0x24BE96EE8]();
}

uint64_t sub_2471D7330()
{
  return MEMORY[0x24BE96F08]();
}

uint64_t sub_2471D733C()
{
  return MEMORY[0x24BE96FC0]();
}

uint64_t sub_2471D7348()
{
  return MEMORY[0x24BE96FE8]();
}

uint64_t sub_2471D7354()
{
  return MEMORY[0x24BE970F8]();
}

uint64_t sub_2471D7360()
{
  return MEMORY[0x24BE97340]();
}

uint64_t sub_2471D736C()
{
  return MEMORY[0x24BE97360]();
}

uint64_t sub_2471D7378()
{
  return MEMORY[0x24BE97398]();
}

uint64_t sub_2471D7384()
{
  return MEMORY[0x24BE973E0]();
}

uint64_t sub_2471D7390()
{
  return MEMORY[0x24BE97550]();
}

uint64_t sub_2471D739C()
{
  return MEMORY[0x24BE975A8]();
}

uint64_t sub_2471D73A8()
{
  return MEMORY[0x24BE97890]();
}

uint64_t sub_2471D73B4()
{
  return MEMORY[0x24BE97AF8]();
}

uint64_t sub_2471D73C0()
{
  return MEMORY[0x24BE97CA0]();
}

uint64_t sub_2471D73CC()
{
  return MEMORY[0x24BE97D40]();
}

uint64_t sub_2471D73D8()
{
  return MEMORY[0x24BE97D58]();
}

uint64_t sub_2471D73E4()
{
  return MEMORY[0x24BE97E58]();
}

uint64_t sub_2471D73F0()
{
  return MEMORY[0x24BE97FE0]();
}

uint64_t sub_2471D73FC()
{
  return MEMORY[0x24BE982E8]();
}

uint64_t sub_2471D7408()
{
  return MEMORY[0x24BE98638]();
}

uint64_t sub_2471D7414()
{
  return MEMORY[0x24BE98640]();
}

uint64_t sub_2471D7420()
{
  return MEMORY[0x24BE986D0]();
}

uint64_t sub_2471D742C()
{
  return MEMORY[0x24BE98DD0]();
}

uint64_t sub_2471D7438()
{
  return MEMORY[0x24BE98EA8]();
}

uint64_t sub_2471D7444()
{
  return MEMORY[0x24BE99040]();
}

uint64_t sub_2471D7450()
{
  return MEMORY[0x24BE99050]();
}

uint64_t sub_2471D745C()
{
  return MEMORY[0x24BE99090]();
}

uint64_t sub_2471D7468()
{
  return MEMORY[0x24BE9C450]();
}

uint64_t sub_2471D7474()
{
  return MEMORY[0x24BE9E010]();
}

uint64_t sub_2471D7480()
{
  return MEMORY[0x24BE9EE58]();
}

uint64_t sub_2471D748C()
{
  return MEMORY[0x24BE9EE60]();
}

uint64_t sub_2471D7498()
{
  return MEMORY[0x24BE9EF18]();
}

uint64_t sub_2471D74A4()
{
  return MEMORY[0x24BE9FAB0]();
}

uint64_t sub_2471D74B0()
{
  return MEMORY[0x24BE9FAB8]();
}

uint64_t sub_2471D74BC()
{
  return MEMORY[0x24BE9FAC0]();
}

uint64_t sub_2471D74C8()
{
  return MEMORY[0x24BE9FFC8]();
}

uint64_t sub_2471D74D4()
{
  return MEMORY[0x24BEA0168]();
}

uint64_t sub_2471D74E0()
{
  return MEMORY[0x24BEA0690]();
}

uint64_t sub_2471D74EC()
{
  return MEMORY[0x24BEA06B0]();
}

uint64_t sub_2471D74F8()
{
  return MEMORY[0x24BEA08E8]();
}

uint64_t sub_2471D7504()
{
  return MEMORY[0x24BEA0B50]();
}

uint64_t sub_2471D7510()
{
  return MEMORY[0x24BEA0B58]();
}

uint64_t sub_2471D751C()
{
  return MEMORY[0x24BEA13E0]();
}

uint64_t sub_2471D7528()
{
  return MEMORY[0x24BEA1CD8]();
}

uint64_t sub_2471D7534()
{
  return MEMORY[0x24BEA2100]();
}

uint64_t sub_2471D7540()
{
  return MEMORY[0x24BEA2108]();
}

uint64_t sub_2471D754C()
{
  return MEMORY[0x24BEA33E0]();
}

uint64_t sub_2471D7558()
{
  return MEMORY[0x24BEA33F8]();
}

uint64_t sub_2471D7564()
{
  return MEMORY[0x24BEA3440]();
}

uint64_t sub_2471D7570()
{
  return MEMORY[0x24BEA3448]();
}

uint64_t sub_2471D757C()
{
  return MEMORY[0x24BEA3458]();
}

uint64_t sub_2471D7588()
{
  return MEMORY[0x24BEA3648]();
}

uint64_t sub_2471D7594()
{
  return MEMORY[0x24BEA3710]();
}

uint64_t sub_2471D75A0()
{
  return MEMORY[0x24BEA3760]();
}

uint64_t sub_2471D75AC()
{
  return MEMORY[0x24BE927F0]();
}

uint64_t sub_2471D75B8()
{
  return MEMORY[0x24BE92848]();
}

uint64_t sub_2471D75C4()
{
  return MEMORY[0x24BE92860]();
}

uint64_t sub_2471D75D0()
{
  return MEMORY[0x24BE92898]();
}

uint64_t sub_2471D75DC()
{
  return MEMORY[0x24BE92BF8]();
}

uint64_t sub_2471D75E8()
{
  return MEMORY[0x24BE92C20]();
}

uint64_t sub_2471D75F4()
{
  return MEMORY[0x24BEA5480]();
}

uint64_t sub_2471D7600()
{
  return MEMORY[0x24BEA54A8]();
}

uint64_t sub_2471D760C()
{
  return MEMORY[0x24BEA54B0]();
}

uint64_t sub_2471D7618()
{
  return MEMORY[0x24BEA54F0]();
}

uint64_t sub_2471D7624()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2471D7630()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2471D763C()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2471D7648()
{
  return MEMORY[0x24BEA5578]();
}

uint64_t sub_2471D7654()
{
  return MEMORY[0x24BEA5580]();
}

uint64_t sub_2471D7660()
{
  return MEMORY[0x24BEA5608]();
}

uint64_t sub_2471D766C()
{
  return MEMORY[0x24BEA5628]();
}

uint64_t sub_2471D7678()
{
  return MEMORY[0x24BEA59D8]();
}

uint64_t sub_2471D7684()
{
  return MEMORY[0x24BEA59F0]();
}

uint64_t sub_2471D7690()
{
  return MEMORY[0x24BEA5A40]();
}

uint64_t sub_2471D769C()
{
  return MEMORY[0x24BEA5A70]();
}

uint64_t sub_2471D76A8()
{
  return MEMORY[0x24BEA5A98]();
}

uint64_t sub_2471D76B4()
{
  return MEMORY[0x24BEA5AD0]();
}

uint64_t sub_2471D76C0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2471D76CC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2471D76D8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2471D76E4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2471D76F0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2471D76FC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2471D7708()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2471D7714()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2471D7720()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2471D772C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2471D7738()
{
  return MEMORY[0x24BEE6C90]();
}

uint64_t sub_2471D7744()
{
  return MEMORY[0x24BEE6CC0]();
}

uint64_t sub_2471D7750()
{
  return MEMORY[0x24BEE6CC8]();
}

uint64_t sub_2471D775C()
{
  return MEMORY[0x24BEE6CD0]();
}

uint64_t sub_2471D7768()
{
  return MEMORY[0x24BEE6CE0]();
}

uint64_t sub_2471D7774()
{
  return MEMORY[0x24BEE6CE8]();
}

uint64_t sub_2471D7780()
{
  return MEMORY[0x24BEE6D30]();
}

uint64_t sub_2471D778C()
{
  return MEMORY[0x24BE99120]();
}

uint64_t sub_2471D7798()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2471D77A4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2471D77B0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2471D77BC()
{
  return MEMORY[0x24BEA3850]();
}

uint64_t sub_2471D77C8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2471D77D4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2471D77E0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2471D77EC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2471D77F8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2471D7804()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2471D7810()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2471D781C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2471D7828()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2471D7834()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2471D7840()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2471D784C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2471D7858()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2471D7864()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2471D7870()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2471D787C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2471D7888()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2471D7894()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2471D78A0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2471D78AC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2471D78B8()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2471D78C4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2471D78D0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2471D78DC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2471D78E8()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2471D78F4()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2471D7900()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2471D790C()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

