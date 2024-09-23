uint64_t type metadata accessor for PPayloadFunction()
{
  uint64_t result;

  result = qword_257373EE8;
  if (!qword_257373EE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445D1714()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445D1750()
{
  return 1;
}

uint64_t sub_2445D1758(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD v20[2];
  _BYTE v21[16];
  uint64_t v22;
  _QWORD v23[4];
  uint64_t v24;

  v20[1] = a1;
  v24 = sub_2445E67E8();
  v5 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2445E6998();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v2 + qword_257374790;
  if (MEMORY[0x249513A54](v2 + qword_257374790))
  {
    v13 = *(_QWORD *)(v12 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(ObjectType, v13);
    result = swift_unknownObjectRelease();
    if (!v3)
    {
      if (*(_QWORD *)(a2 + 16))
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, a2 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80)), v8);
        sub_2445E6920();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
        swift_unknownObjectRelease();
        sub_2445D1B00((uint64_t)&v22, (uint64_t)v23);
        sub_2445D1B44((uint64_t)v21);
        __swift_project_boxed_opaque_existential_1(v23, v23[3]);
        v17 = sub_2445E6D10();
        v19 = v18;
        sub_2445E67DC();
        sub_2445E6890();
        sub_2445D1B9C(v17, v19);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v24);
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v16 = 0xD000000000000012;
    *(_QWORD *)(v16 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v16 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2445D19C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)(swift_allocObject() + qword_257374790 + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  v3 = sub_2445E6A70();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_2445D1A38()
{
  uint64_t v0;

  v0 = sub_2445E6A7C();
  sub_2445D1A80(v0 + qword_257374790);
  return swift_deallocClassInstance();
}

uint64_t sub_2445D1A78()
{
  return type metadata accessor for PPayloadFunction();
}

uint64_t sub_2445D1A80(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

unint64_t sub_2445D1AA4()
{
  unint64_t result;

  result = qword_257373F38;
  if (!qword_257373F38)
  {
    result = MEMORY[0x24951397C](&unk_2445E870C, &type metadata for UDFError);
    atomic_store(result, (unint64_t *)&qword_257373F38);
  }
  return result;
}

uint64_t sub_2445D1AE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_2445DF3BC(a1, a2, v3, a3);
}

uint64_t sub_2445D1B00(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2445D1B44(uint64_t a1)
{
  destroy for AttributedMessage(a1);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2445D1B9C(uint64_t a1, unint64_t a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t __swift_memcpy12_4(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_DWORD *)(result + 8) = *((_DWORD *)a2 + 2);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_2445D1C18(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 12))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2445D1C38(uint64_t result, int a2, int a3)
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

void type metadata accessor for sqlite3_index_constraint()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_257373F40)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_257373F40);
  }
}

uint64_t type metadata accessor for POneOfFunction()
{
  uint64_t result;

  result = qword_257373F48;
  if (!qword_257373F48)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445D1CF4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445D1D30()
{
  return 2;
}

uint64_t sub_2445D1D38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t ObjectType;
  uint64_t v16;
  _BYTE v18[16];
  _QWORD v19[4];

  v4 = v2;
  v6 = sub_2445E6998();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v10 = &v18[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = *(_QWORD *)(a2 + 16);
  if (!v11)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v12 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  if ((sub_2445E6950() & 1) != 0)
    return sub_2445E689C();
  v13 = v4 + qword_257374790;
  if (MEMORY[0x249513A54](v13))
  {
    v14 = *(_QWORD *)(v13 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(ObjectType, v14);
    result = swift_unknownObjectRelease();
    if (!v3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
      sub_2445E6920();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
      result = swift_unknownObjectRelease();
      if (v11 >= 2)
      {
        sub_2445E692C();
        __swift_project_boxed_opaque_existential_1(v19, v19[3]);
        sub_2445E6D34();
        sub_2445E68FC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return sub_2445D1B44((uint64_t)v18);
      }
      goto LABEL_12;
    }
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v16 = 0xD000000000000012;
    *(_QWORD *)(v16 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v16 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2445D1FF8()
{
  return type metadata accessor for POneOfFunction();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249513964]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for PHasOneOfFunction()
{
  uint64_t result;

  result = qword_257373FA0;
  if (!qword_257373FA0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445D207C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445D20C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v25[16];
  uint64_t v26;
  _QWORD v27[4];
  __int128 v28;
  _QWORD v29[4];

  v4 = v2;
  v6 = sub_2445E6998();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v10 = &v25[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v11 = *(_QWORD *)(a2 + 16);
  if (!v11)
  {
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v12 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
  result = sub_2445E6950();
  if ((result & 1) != 0)
  {
    sub_2445D25CC();
    swift_allocError();
    v14 = 0xD000000000000016;
    v15 = "Message cannot be NULL";
LABEL_11:
    *v13 = v14;
    v13[1] = (unint64_t)(v15 - 32) | 0x8000000000000000;
    return swift_willThrow();
  }
  if (v11 < 2)
    goto LABEL_21;
  if ((sub_2445E6950() & 1) != 0 || (sub_2445E695C() & 1) == 0)
  {
    sub_2445D25CC();
    swift_allocError();
    v14 = 0xD00000000000002CLL;
    v15 = "Oneof name cannot be NULL and must be a TEXT";
    goto LABEL_11;
  }
  v16 = v4 + qword_257374790;
  if (!MEMORY[0x249513A54](v16))
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v19 = 0xD000000000000012;
    *(_QWORD *)(v19 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v19 + 16) = 1;
    return swift_willThrow();
  }
  v17 = *(_QWORD *)(v16 + 8);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(ObjectType, v17);
  if (v3)
    return swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if ((sub_2445E695C() & 1) != 0)
  {
    swift_unknownObjectRetain();
    sub_2445E692C();
    swift_getObjectType();
    sub_2445E6C8C();
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    if ((sub_2445E6944() & 1) == 0)
    {
      sub_2445D25CC();
      swift_allocError();
      *v20 = 0xD000000000000040;
      v20[1] = 0x80000002445E7340;
      swift_willThrow();
      return swift_unknownObjectRelease();
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v12, v6);
    sub_2445E6920();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_2445D1B00((uint64_t)&v26, (uint64_t)v27);
    sub_2445D1B44((uint64_t)v25);
    __swift_project_boxed_opaque_existential_1(v27, v27[3]);
    sub_2445E6D04();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  }
  sub_2445D2610(&v28, (uint64_t)v29);
  __swift_project_boxed_opaque_existential_1(v29, v29[3]);
  v21 = (_QWORD *)sub_2445E6CE0();
  v22 = sub_2445E692C();
  sub_2445D2500(v22, v23, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2445E6884();
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
}

uint64_t sub_2445D2500(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_2445E6ECC();
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
    if (v12 || (sub_2445E6ECC() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2445D25C4()
{
  return type metadata accessor for PHasOneOfFunction();
}

unint64_t sub_2445D25CC()
{
  unint64_t result;

  result = qword_257373FF0;
  if (!qword_257373FF0)
  {
    result = MEMORY[0x24951397C](&unk_2445E7EE8, &type metadata for PHasOneOfFunctionError);
    atomic_store(result, (unint64_t *)&qword_257373FF0);
  }
  return result;
}

uint64_t sub_2445D2610(__int128 *a1, uint64_t a2)
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

_QWORD *initializeBufferWithCopyOfBuffer for PHasOneOfFunctionError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for PHasOneOfFunctionError()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for PHasOneOfFunctionError(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for PHasOneOfFunctionError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PHasOneOfFunctionError(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PHasOneOfFunctionError(uint64_t result, int a2, int a3)
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

uint64_t sub_2445D275C()
{
  return 0;
}

ValueMetadata *type metadata accessor for PHasOneOfFunctionError()
{
  return &type metadata for PHasOneOfFunctionError;
}

uint64_t dispatch thunk of StreamTableProviding.estimatedElementCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamTableProviding.singleElementCost.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamTableProviding.supportsTimestampConstraints.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StreamTableProviding.schemaProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StreamTableProviding.makeEnumerator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t BaseStreamSchemaProvider.messageName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t BaseStreamSchemaProvider.schemaManifest.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2445D4560(v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, a1, &qword_257373FF8);
}

uint64_t sub_2445D2834(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2445D289C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2445D28E4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2445D2934())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t BaseStreamSchemaProvider.__allocating_init(messageName:manifestData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  BaseStreamSchemaProvider.init(messageName:manifestData:)(a1, a2, a3);
  return v6;
}

uint64_t BaseStreamSchemaProvider.init(messageName:manifestData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v27 = a1;
  v4 = v3;
  v29 = a2;
  v6 = sub_2445E6C20();
  v25 = *(_QWORD *)(v6 - 8);
  v26 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2445E6C14();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374000);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257373FF8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x24BEE4AF8];
  swift_weakInit();
  v17 = v29;
  *(_QWORD *)(v4 + 16) = v27;
  *(_QWORD *)(v4 + 24) = v17;
  v29 = a3;
  sub_2445D4560(a3, (uint64_t)v14, &qword_257374000);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9) == 1)
  {
    v18 = sub_2445E6B6C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v16, 1, 1, v18);
LABEL_6:
    sub_2445D432C(v29, &qword_257374000);
    sub_2445D2CE8((uint64_t)v16, v4 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest);
    return v4;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v14, v9);
  v19 = sub_2445E6BFC();
  v21 = v20;
  sub_2445E6C08();
  v22 = v28;
  sub_2445E6AB8();
  if (!v22)
  {
    sub_2445D1B9C(v19, v21);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v26);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    v23 = sub_2445E6B6C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v16, 0, 1, v23);
    goto LABEL_6;
  }
  sub_2445D1B9C(v19, v21);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v26);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_2445D432C(v29, &qword_257374000);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  type metadata accessor for BaseStreamSchemaProvider();
  swift_deallocPartialClassInstance();
  return v4;
}

uint64_t sub_2445D2CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257373FF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BaseStreamSchemaProvider()
{
  uint64_t result;

  result = qword_257374038;
  if (!qword_257374038)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t BaseStreamSchemaProvider.__allocating_init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x24BEE4AF8];
  swift_weakInit();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_2445D2CE8(a3, v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest);
  return v6;
}

uint64_t BaseStreamSchemaProvider.init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x24BEE4AF8];
  swift_weakInit();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  sub_2445D2CE8(a3, v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest);
  return v3;
}

void BaseStreamSchemaProvider.configure(withContext:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = v1;
  v5 = sub_2445E6B18();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (_QWORD *)(a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  if (!*(_QWORD *)(a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge))
  {
    sub_2445DBA54();
    if (v2)
      return;
    v19 = v11;
    v18 = v12;
    type metadata accessor for MessageInBlobBridge();
    v13 = (_QWORD *)swift_allocObject();
    v14 = MEMORY[0x24BEE4AF8];
    v13[2] = MEMORY[0x24BEE4AF8];
    v15 = sub_2445D3B08(v14);
    v16 = v19;
    v13[3] = v15;
    v13[4] = v16;
    v13[5] = v18;
    *v9 = v13;
    v9[1] = &off_251532E80;
    swift_retain();
    swift_unknownObjectRelease();
  }
  type metadata accessor for MessageInBlobBridge();
  v10 = swift_dynamicCastClass();
  swift_unknownObjectRetain();
  if (!v10)
    swift_unknownObjectRelease();
  swift_weakAssign();
  swift_release();
  sub_2445DBA54();
  if (!v2)
  {
    swift_getObjectType();
    sub_2445E6C98();
    swift_unknownObjectRelease();
    (*(void (**)(char *))(*(_QWORD *)v3 + 176))(v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

void sub_2445D3034()
{
  sub_2445E6E90();
  __break(1u);
}

void sub_2445D308C()
{
  sub_2445E6E90();
  __break(1u);
}

double sub_2445D30E4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _OWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double result;
  _OWORD *v23;
  uint64_t v24;
  char *v25;
  _QWORD v26[4];
  uint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v28 = a4;
  v29 = a2;
  v27 = sub_2445E6BC0();
  v7 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2445E6D88();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374008);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v30 = *a3;
  v18 = *(_OWORD *)(a3 + 1);
  v20 = (char *)v26 - v19;
  v31 = v18;
  v21 = v32;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v4 + 184))(a1, v29, &v30);
  if (!v21)
  {
    v26[1] = v13;
    v26[2] = v11;
    v32 = 0;
    v26[3] = v9;
    v29 = v7;
    v23 = v28;
    sub_2445D4560((uint64_t)v20, (uint64_t)v17, &qword_257374008);
    v24 = sub_2445E6D70();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v17, 1, v24) != 1)
    {
      v25 = (char *)&loc_2445D329C + dword_2445D35E4[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    sub_2445D432C((uint64_t)v20, &qword_257374008);
    result = 0.0;
    *v23 = 0u;
    v23[1] = 0u;
  }
  return result;
}

void sub_2445D3488()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
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
  _BYTE v16[176];

  v8 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  sub_2445D1B9C(v1, v0);
  v9 = v7 - v8;
  if (__OFSUB__(v7, v8))
    __break(1u);
  v10 = *(_QWORD *)(v6 - 72);
  if (!__OFADD__(v9, 4))
  {
    v11 = sub_2445D4278(v9 + 4);
    *(_QWORD *)(v6 - 104) = v11;
    *(_QWORD *)(v6 - 96) = v12;
    MEMORY[0x24BDAC7A8](v11);
    v13 = *(_QWORD *)(v6 - 136);
    *(_QWORD *)&v16[-16] = v3;
    *(_QWORD *)&v16[-8] = v13;
    sub_2445D3F9C();
    if (v10)
    {
      sub_2445D1B9C(*(_QWORD *)(v6 - 104), *(_QWORD *)(v6 - 96));
      sub_2445D432C(v2, &qword_257374008);
      swift_release();
    }
    else
    {
      v14 = *(_QWORD *)(v6 - 104);
      v15 = *(_QWORD *)(v6 - 96);
      v4[3] = MEMORY[0x24BDCDDE8];
      swift_release();
      *v4 = v14;
      v4[1] = v15;
      sub_2445D432C(v2, &qword_257374008);
    }
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 112) + 8))(v13, v5);
    JUMPOUT(0x2445D3464);
  }
  __break(1u);
  JUMPOUT(0x2445D359CLL);
}

void sub_2445D34A4()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE v13[176];

  sub_2445D1B9C(v1, v0);
  v7 = *(_QWORD *)(v6 - 72);
  v8 = sub_2445D4278(4);
  *(_QWORD *)(v6 - 104) = v8;
  *(_QWORD *)(v6 - 96) = v9;
  MEMORY[0x24BDAC7A8](v8);
  v10 = *(_QWORD *)(v6 - 136);
  *(_QWORD *)&v13[-16] = v3;
  *(_QWORD *)&v13[-8] = v10;
  sub_2445D3F9C();
  if (v7)
  {
    sub_2445D1B9C(*(_QWORD *)(v6 - 104), *(_QWORD *)(v6 - 96));
    sub_2445D432C(v2, &qword_257374008);
    swift_release();
  }
  else
  {
    v11 = *(_QWORD *)(v6 - 104);
    v12 = *(_QWORD *)(v6 - 96);
    v4[3] = MEMORY[0x24BDCDDE8];
    swift_release();
    *v4 = v11;
    v4[1] = v12;
    sub_2445D432C(v2, &qword_257374008);
  }
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 112) + 8))(v10, v5);
  JUMPOUT(0x2445D3464);
}

void sub_2445D34B8()
{
  unint64_t v0;
  uint64_t v1;

  sub_2445D1B9C(v1, v0);
  if (!__OFSUB__(HIDWORD(v1), (_DWORD)v1))
    JUMPOUT(0x2445D34D4);
  __break(1u);
  JUMPOUT(0x2445D35A0);
}

void sub_2445D3620(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v2 = sub_2445E6B54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7[0] = a1;
  if (a1)
  {
    sub_2445E6B78();
    sub_2445E6B48();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_2445E6B84();
    __asm { BR              X9 }
  }
  sub_2445E6E90();
  __break(1u);
  JUMPOUT(0x2445D3968);
}

uint64_t BaseStreamSchemaProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return v0;
}

uint64_t BaseStreamSchemaProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_2445D3A3C@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return sub_2445D4560(*v1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, a1, &qword_257373FF8);
}

uint64_t sub_2445D3A6C()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2445D3AB8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 176))();
}

uint64_t sub_2445D3AE0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 184))();
}

unint64_t sub_2445D3B08(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374150);
  v2 = (_QWORD *)sub_2445E6EB4();
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
    result = sub_2445DFDB0(v5, v6);
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

unint64_t sub_2445D3C18(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374130);
  v2 = (_QWORD *)sub_2445E6EB4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v13 = *v4;
    swift_bridgeObjectRetain();
    result = sub_2445DFDB0(v5, v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_2445D3D34(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  __int128 v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374148);
  v2 = (_QWORD *)sub_2445E6EB4();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v13 = *v4;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    result = sub_2445DFDB0(v5, v6);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = (uint64_t *)(v2[6] + 16 * result);
    *v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    v10 = v2[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v2[2] = v12;
    v4 += 2;
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

unint64_t sub_2445D3E5C(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374138);
  v2 = sub_2445E6EB4();
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
    sub_2445D4560(v6, (uint64_t)&v15, &qword_257374140);
    v7 = v15;
    v8 = v16;
    result = sub_2445DFDB0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_2445D2610(&v17, v3[7] + 40 * result);
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

void sub_2445D3F9C()
{
  __asm { BR              X12 }
}

uint64_t sub_2445D3FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *, char *);
  _QWORD *v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v6 = v1;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  v8 = BYTE4(a1);
  v9 = BYTE5(a1);
  v10 = BYTE6(a1);
  result = v2(&v6, (char *)&v6 + BYTE6(a1));
  v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  *v3 = v6;
  v3[1] = v5;
  return result;
}

uint64_t sub_2445D41D0(uint64_t (*a1)(uint64_t, uint64_t))
{
  int *v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = sub_2445E67A0();
  v4 = *v1;
  v5 = v1[1];
  if ((int)v5 < (int)v4)
  {
    __break(1u);
    goto LABEL_9;
  }
  result = sub_2445E6758();
  if (!result)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v6 = result;
  result = sub_2445E677C();
  v7 = v4 - result;
  if (__OFSUB__(v4, result))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v8 = v5 - v4;
  v9 = sub_2445E6770();
  if (v9 >= v8)
    v10 = v8;
  else
    v10 = v9;
  return a1(v6 + v7, v6 + v7 + v10);
}

uint64_t sub_2445D4278(uint64_t result)
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
      sub_2445E6788();
      swift_allocObject();
      sub_2445E6764();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_2445E67B8();
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

void sub_2445D4314(uint64_t a1)
{
  sub_2445D3620(a1);
}

uint64_t sub_2445D432C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2445D4368@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2445D43C0()
{
  return type metadata accessor for BaseStreamSchemaProvider();
}

void sub_2445D43C8()
{
  unint64_t v0;

  sub_2445D450C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for BaseStreamSchemaProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.columns.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.__allocating_init(messageName:manifestData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.__allocating_init(messageName:manifest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.configure(withSchemaStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.getValue(forColumn:streamElement:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of BaseStreamSchemaProvider.getSQLValue(forColumn:streamElement:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

void sub_2445D450C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257374048[0])
  {
    sub_2445E6B6C();
    v0 = sub_2445E6E3C();
    if (!v1)
      atomic_store(v0, qword_257374048);
  }
}

uint64_t sub_2445D4560(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2445D45A4(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for PBGetFunction()
{
  uint64_t result;

  result = qword_257374160;
  if (!qword_257374160)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445D4624()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445D4670()
{
  return 3;
}

const unsigned __int8 *sub_2445D4678(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  const unsigned __int8 *result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  sqlite3_value *v21;
  const unsigned __int8 *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  sqlite3_value *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  _DWORD v50[4];
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;

  v65 = sub_2445E6BF0();
  v5 = *(_QWORD *)(v65 - 8);
  v6 = MEMORY[0x24BDAC7A8](v65);
  v58 = (uint64_t *)((char *)v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v9 = (uint64_t *)((char *)v50 - v8);
  v10 = sub_2445E6998();
  v11 = *(_QWORD *)(v10 - 8);
  result = (const unsigned __int8 *)MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = *(_QWORD *)(a2 + 16);
  if (!v60)
  {
LABEL_46:
    __break(1u);
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v59 = a1;
  v15 = a2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v15, v10);
  MEMORY[0x24BDAC7A8](v16);
  *(_QWORD *)&v50[-4] = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573741B0);
  sub_2445E6920();
  if (v2)
    return (const unsigned __int8 *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if ((v64 & 1) != 0)
  {
    sub_2445D4D10();
    swift_allocError();
    *(_QWORD *)(v17 + 8) = 0;
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)v17 = 6;
    *(_BYTE *)(v17 + 24) = 5;
    swift_willThrow();
    return (const unsigned __int8 *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  v18 = v62;
  v19 = v63;
  result = (const unsigned __int8 *)(*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  if (v60 < 2)
    goto LABEL_47;
  v20 = *(_QWORD *)(v11 + 72);
  v21 = (sqlite3_value *)sub_2445E6968();
  result = sqlite3_value_text(v21);
  if (!result)
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v49 = 0xD000000000000024;
    *(_QWORD *)(v49 + 8) = 0x80000002445E74B0;
    *(_BYTE *)(v49 + 16) = 0;
    return (const unsigned __int8 *)swift_willThrow();
  }
  v22 = result;
  v51 = v19;
  v52 = v20;
  v54 = 0;
  v55 = v18;
  v53 = v15;
  LOBYTE(v19) = *result;
  if (!*result)
    goto LABEL_40;
  v23 = 0;
  v24 = 0;
  v57 = qword_257374158;
  v50[3] = *MEMORY[0x24BE747C0];
  v56 = *MEMORY[0x24BE747B8];
  while (v19 < 0x30u)
  {
    if ((v24 & (v23 != 0)) == 0)
      goto LABEL_40;
    v25 = 0;
LABEL_16:
    *v9 = v23;
    v9[1] = v25;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v9, v56, v65);
    v27 = v61;
    v28 = v57;
    v29 = *(_QWORD **)(v61 + v57);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v27 + v28) = v29;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v29 = (_QWORD *)sub_2445E3B68(0, v29[2] + 1, 1, v29);
      *(_QWORD *)(v61 + v57) = v29;
    }
    v32 = v29[2];
    v31 = v29[3];
    if (v32 >= v31 >> 1)
    {
      v29 = (_QWORD *)sub_2445E3B68(v31 > 1, v32 + 1, 1, v29);
      *(_QWORD *)(v61 + v57) = v29;
    }
    v29[2] = v32 + 1;
    result = (const unsigned __int8 *)(*(uint64_t (**)(unint64_t, uint64_t *, uint64_t))(v5 + 32))((unint64_t)v29+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v32, v9, v65);
    if (!(_BYTE)v19)
      goto LABEL_40;
LABEL_21:
    v24 = 0;
    v25 = v23;
LABEL_12:
    v26 = *++v22;
    LOBYTE(v19) = v26;
    v23 = v25;
    if (!v26)
      goto LABEL_40;
  }
  if (v19 > 0x39u)
  {
    if (v19 == 105)
    {
      v25 = 0;
LABEL_11:
      v24 = 1;
      goto LABEL_12;
    }
    if ((v24 & (v23 != 0)) == 0)
      goto LABEL_40;
    v25 = 0;
    LOBYTE(v19) = 1;
    goto LABEL_16;
  }
  v25 = 0;
  do
  {
    v33 = (unsigned __int128)(v25 * (__int128)10) >> 64;
    v34 = 10 * v25;
    if (v33 != v34 >> 63)
    {
      __break(1u);
LABEL_45:
      __break(1u);
      goto LABEL_46;
    }
    v35 = __OFADD__(v34, (v19 - 48));
    v25 = v34 + (v19 - 48);
    if (v35)
      goto LABEL_45;
    v36 = *++v22;
    LODWORD(v19) = v36;
  }
  while ((v36 - 58) > 0xF5u);
  if ((_DWORD)v19 == 105)
    goto LABEL_11;
  if ((v24 & 1) == 0)
  {
    if (!v25)
      goto LABEL_40;
    *v58 = v25;
    (*(void (**)(void))(v5 + 104))();
    v37 = v61;
    v38 = v57;
    v39 = *(_QWORD **)(v61 + v57);
    v40 = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v37 + v38) = v39;
    if ((v40 & 1) == 0)
    {
      v39 = (_QWORD *)sub_2445E3B68(0, v39[2] + 1, 1, v39);
      *(_QWORD *)(v61 + v57) = v39;
    }
    v42 = v39[2];
    v41 = v39[3];
    if (v42 >= v41 >> 1)
    {
      v39 = (_QWORD *)sub_2445E3B68(v41 > 1, v42 + 1, 1, v39);
      *(_QWORD *)(v61 + v57) = v39;
    }
    v39[2] = v42 + 1;
    result = (const unsigned __int8 *)(*(uint64_t (**)(unint64_t, uint64_t *, uint64_t))(v5 + 32))((unint64_t)v39+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v42, v58, v65);
    if (!(_DWORD)v19)
      goto LABEL_40;
    goto LABEL_21;
  }
  if (v23)
    goto LABEL_16;
LABEL_40:
  v43 = v55;
  if (v60 < 3)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v44 = (sqlite3_value *)sub_2445E6968();
  result = sqlite3_value_text(v44);
  if (result)
  {
    v45 = qword_257374158;
    v46 = v61;
    v47 = *(_QWORD *)(v61 + qword_257374158);
    v48 = *result;
    swift_bridgeObjectRetain();
    sub_2445E64F8(v59, v43, v51, v47, v48);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v46 + v45) = MEMORY[0x24BEE4AF8];
    return (const unsigned __int8 *)swift_bridgeObjectRelease();
  }
LABEL_49:
  __break(1u);
  return result;
}

uint64_t sub_2445D4C04(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_allocObject();
  *(_QWORD *)(v3 + qword_257374158) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + qword_257374790 + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  v4 = sub_2445E6A70();
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_2445D4C90()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2445D4CA0()
{
  uint64_t v0;

  v0 = sub_2445E6A7C();
  sub_2445D1A80(v0 + qword_257374790);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2445D4CF0()
{
  return type metadata accessor for PBGetFunction();
}

uint64_t sub_2445D4CF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2445DE3E8(a1, a2, a3);
}

unint64_t sub_2445D4D10()
{
  unint64_t result;

  result = qword_2573741B8;
  if (!qword_2573741B8)
  {
    result = MEMORY[0x24951397C](MEMORY[0x24BE74230], MEMORY[0x24BE74228]);
    atomic_store(result, (unint64_t *)&qword_2573741B8);
  }
  return result;
}

uint64_t type metadata accessor for PGetManyConnection(uint64_t a1)
{
  return sub_2445D563C(a1, qword_2573741C8);
}

uint64_t sub_2445D4D68()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445D4DB0()
{
  sub_2445D6934();
  return sub_2445E680C();
}

void sub_2445D4DF0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2445E6F20();
  __asm { BR              X9 }
}

uint64_t sub_2445D4E38()
{
  sub_2445E6DF4();
  swift_bridgeObjectRelease();
  return sub_2445E6F38();
}

void sub_2445D4EC8()
{
  __asm { BR              X10 }
}

uint64_t sub_2445D4F00()
{
  sub_2445E6DF4();
  return swift_bridgeObjectRelease();
}

void sub_2445D4F7C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_2445E6F20();
  __asm { BR              X9 }
}

uint64_t sub_2445D4FC0()
{
  sub_2445E6DF4();
  swift_bridgeObjectRelease();
  return sub_2445E6F38();
}

uint64_t sub_2445D5050@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2445D70C8();
  *a1 = result;
  return result;
}

uint64_t sub_2445D507C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_2445D50A8 + 4 * byte_2445E800F[*v0]))();
}

void sub_2445D50A8(_QWORD *a1@<X8>)
{
  *a1 = 0x7463656A626FLL;
  a1[1] = 0xE600000000000000;
}

void sub_2445D50C0(_QWORD *a1@<X8>)
{
  *a1 = 0x64616F6C796170;
  a1[1] = 0xE700000000000000;
}

void sub_2445D50DC(_QWORD *a1@<X8>)
{
  *a1 = 0x614E616D65686373;
  a1[1] = 0xEA0000000000656DLL;
}

void sub_2445D50FC(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "propertyPath");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

BOOL sub_2445D5120()
{
  _BYTE *v0;

  return *v0 != 0;
}

void sub_2445D5130(_QWORD *a1@<X8>)
{
  *a1 = &unk_2515323C8;
}

void sub_2445D5140()
{
  __asm { BR              X10 }
}

uint64_t sub_2445D5178()
{
  uint64_t v0;

  v0 = MEMORY[0x24BDCDDE8];
  sub_2445D6A4C();
  return v0;
}

uint64_t sub_2445D51AC()
{
  sub_2445D68EC();
  sub_2445D6A08();
  return sub_2445E6AAC();
}

uint64_t sub_2445D51E8()
{
  return sub_2445E6818() & 1;
}

uint64_t sub_2445D5200()
{
  sub_2445D6934();
  return sub_2445E6800();
}

uint64_t sub_2445D5234()
{
  swift_allocObject();
  return sub_2445D5294();
}

uint64_t sub_2445D5294()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;

  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573742D0);
  v3 = (_QWORD *)swift_dynamicCastClass();
  if (!v3)
  {
    sub_2445D6BCC();
    swift_allocError();
    *v10 = xmmword_2445E8320;
LABEL_7:
    swift_willThrow();
    swift_release();
    goto LABEL_8;
  }
  v4 = (char *)v3 + *(_QWORD *)(qword_2573750A8 + *v3 + 16);
  if (!MEMORY[0x249513A54](v4))
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v11 = 0xD000000000000012;
    *(_QWORD *)(v11 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v11 + 16) = 1;
    goto LABEL_7;
  }
  v5 = *((_QWORD *)v4 + 1);
  ObjectType = swift_getObjectType();
  v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  swift_retain();
  swift_retain();
  v8 = v7(ObjectType, v5);
  if (!v1)
  {
    v13 = v8;
    v14 = v9;
    swift_unknownObjectRelease();
    v15 = (uint64_t *)(v0 + qword_2573741C0);
    *v15 = v13;
    v15[1] = v14;
    swift_release();
    v2 = sub_2445E6A34();
    swift_release();
    return v2;
  }
  swift_release();
  swift_release_n();
  swift_unknownObjectRelease();
LABEL_8:
  swift_deallocPartialClassInstance();
  return v2;
}

uint64_t sub_2445D5494(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  unsigned __int8 *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char v12;

  v10 = (_QWORD *)result;
  v1 = *(int *)result;
  if ((v1 & 0x80000000) != 0)
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    return result;
  }
  if ((_DWORD)v1)
  {
    v2 = 0;
    v3 = 0;
    v11 = *(_QWORD *)(result + 8);
    v4 = (unsigned __int8 *)(v11 + 5);
    while (v11)
    {
      v6 = *(v4 - 1);
      v7 = *v4;
      sub_2445D6934();
      sub_2445D6AD8();
      sub_2445D6A08();
      result = sub_2445E6824();
      if (v12)
      {
        result = 19;
        if (v12 == 5 || !v7 || v6 != 2)
          return result;
        if (__OFADD__(v3++, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        v9 = v10[4];
        if (!v9)
        {
          __break(1u);
          goto LABEL_14;
        }
        v5 = v9 + v2;
        *(_DWORD *)v5 = v3;
        *(_BYTE *)(v5 + 4) = 1;
      }
      v2 += 8;
      v4 += 12;
      if (!--v1)
        goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_14:
  v3 = 0;
LABEL_15:
  v10[8] = 0;
  v10[9] = 1;
  return (v3 & 0xFFFFFFFE) != 2;
}

uint64_t sub_2445D55D4()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_2445D55E4()
{
  sub_2445E6A28();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2445D5620()
{
  return type metadata accessor for PGetManyConnection(0);
}

uint64_t type metadata accessor for PGetManyCursor(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374218);
}

uint64_t sub_2445D563C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2445D5670()
{
  unint64_t v0;

  sub_2445D687C();
  if (v0 <= 0x3F)
    swift_initClassMetadata2();
}

uint64_t sub_2445D5704()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _OWORD *v6;

  v0 = swift_allocObject();
  v1 = v0 + qword_257375038;
  v2 = sub_2445E6BC0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)(v0 + qword_257375040);
  *v3 = 0;
  v3[1] = 0;
  *(_QWORD *)(v0 + qword_257375050) = MEMORY[0x24BEE4AF8];
  type metadata accessor for PGetManyConnection(0);
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    *(_OWORD *)(v0 + qword_257375048) = *(_OWORD *)(v4 + qword_2573741C0);
    swift_unknownObjectRetain();
    return sub_2445E69F8();
  }
  else
  {
    sub_2445D6BCC();
    swift_allocError();
    *v6 = xmmword_2445E8320;
    swift_willThrow();
    swift_release();
    sub_2445D432C(v1, &qword_2573742A8);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_deallocPartialClassInstance();
  }
}

uint64_t sub_2445D5874(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint64_t v38[2];
  char v39;
  _QWORD v40[3];
  uint64_t v41;
  uint64_t v42;

  v3 = v1;
  v5 = sub_2445E6998();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v33 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742A8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v33 - v15;
  v17 = *(_QWORD *)(a1 + 16);
  if (v17 != 3)
  {
    if (v17 != 2)
    {
      sub_2445D6BCC();
      swift_allocError();
      *v21 = 0;
      v21[1] = 0;
      return swift_willThrow();
    }
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80)), v5);
    swift_unknownObjectRetain();
    sub_2445E6920();
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      return swift_unknownObjectRelease();
    }
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    swift_unknownObjectRelease();
    sub_2445D1B00((uint64_t)v38, (uint64_t)v40);
    sub_2445D1B44((uint64_t)v37);
    __swift_project_boxed_opaque_existential_1(v40, v41);
    sub_2445E6D40();
    v22 = sub_2445E6BC0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v16, 0, 1, v22);
    v23 = v3 + qword_257375038;
    swift_beginAccess();
    sub_2445D6C10((uint64_t)v16, v23);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    v25 = sub_2445E692C();
    v26 = (uint64_t *)(v3 + qword_257375040);
    goto LABEL_10;
  }
  v35 = v14;
  v36 = v3;
  v42 = *(_QWORD *)(*(_QWORD *)(v3 + qword_257375048) + 40);
  v18 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v19 = *(_QWORD *)(v6 + 72);
  swift_unknownObjectRetain();
  sub_2445E692C();
  if (v2)
    return swift_unknownObjectRelease();
  v33[1] = v19;
  v34 = v18;
  swift_getObjectType();
  sub_2445E6C8C();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v37, v38[1]);
  v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v34, v5);
  MEMORY[0x24BDAC7A8](v27);
  v33[-2] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573741B0);
  sub_2445E6920();
  if ((v39 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    sub_2445E6CBC();
    __swift_project_boxed_opaque_existential_1(v40, v41);
    v29 = v35;
    sub_2445E6D40();
    v30 = sub_2445E6BC0();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v29, 0, 1, v30);
    v31 = v36;
    v32 = v36 + qword_257375038;
    swift_beginAccess();
    sub_2445D6C10(v29, v32);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
    v25 = sub_2445E692C();
    v26 = (uint64_t *)(v31 + qword_257375040);
LABEL_10:
    *v26 = v25;
    v26[1] = v24;
    return swift_bridgeObjectRelease();
  }
  sub_2445D4D10();
  swift_allocError();
  *(_QWORD *)(v28 + 8) = 0;
  *(_QWORD *)(v28 + 16) = 0;
  *(_QWORD *)v28 = 6;
  *(_BYTE *)(v28 + 24) = 5;
  swift_willThrow();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v37);
}

uint64_t sub_2445D5D9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;

  v5 = v3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2445E6BC0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573742C0);
  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_2445E6860();
  v17 = v16(a1, a2, a3);
  v18 = v17;
  if (!v4 && !(_DWORD)v17)
  {
    sub_2445D5874(a3);
    v19 = v5 + qword_257375038;
    swift_beginAccess();
    sub_2445D4560(v19, (uint64_t)v11, &qword_2573742A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
    {
      sub_2445D432C((uint64_t)v11, &qword_2573742A8);
LABEL_8:
      sub_2445D6BCC();
      swift_allocError();
      *v20 = 0xD000000000000012;
      v20[1] = 0x80000002445E7560;
      swift_willThrow();
      return v18;
    }
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
    if (!*(_QWORD *)(v5 + qword_257375040 + 8))
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    v21 = sub_2445E6BB4();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v5 + qword_257375050) = v21;
    swift_bridgeObjectRelease();
  }
  return v18;
}

uint64_t sub_2445D6018()
{
  uint64_t v0;

  return *(_QWORD *)(*(_QWORD *)(v0 + qword_257375050) + 16);
}

uint64_t sub_2445D602C(uint64_t a1, uint64_t a2)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[9];
  unsigned __int8 v20;

  v19[8] = a2;
  v3 = sub_2445E6B54();
  v19[6] = *(_QWORD *)(v3 - 8);
  v19[7] = v3;
  MEMORY[0x24BDAC7A8](v3);
  v19[3] = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2445E67E8();
  v19[4] = *(_QWORD *)(v5 - 8);
  v19[5] = v5;
  MEMORY[0x24BDAC7A8](v5);
  v19[2] = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2445E6D70();
  MEMORY[0x24BDAC7A8](v7);
  v19[0] = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2445E6BC0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19[1] = sub_2445E6854();
  sub_2445D6934();
  sub_2445D6AD8();
  sub_2445D6A08();
  sub_2445E6824();
  v16 = v20;
  if (v20 != 5)
  {
    v17 = v2 + qword_257375038;
    swift_beginAccess();
    sub_2445D4560(v17, (uint64_t)v11, &qword_2573742A8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
      __asm { BR              X9 }
    }
    sub_2445D432C((uint64_t)v11, &qword_2573742A8);
  }
  return 1;
}

void sub_2445D6288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)(v5 - 168);
  if ((v6 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v7 = *(_QWORD *)(v3 + qword_257375050);
    if (v6 < *(_QWORD *)(v7 + 16))
    {
      v8 = *(_QWORD *)(v5 - 176);
      v9 = sub_2445D6B34(v7+ ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80))+ *(_QWORD *)(v4 + 72) * v6, v8);
      MEMORY[0x24BDAC7A8](v9);
      sub_2445E6D64();
      sub_2445D6B90(v8);
      (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
      JUMPOUT(0x2445D6238);
    }
  }
  __break(1u);
  JUMPOUT(0x2445D64C4);
}

uint64_t sub_2445D64D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v6 = sub_2445E6B24();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742B8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(_QWORD *)(a2 + qword_257375048);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v18 - v14, a1, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  sub_2445D4560((uint64_t)v15, (uint64_t)v13, &qword_2573742B8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v13, 1, v6) == 1)
  {
    swift_unknownObjectRetain();
    sub_2445D432C((uint64_t)v13, &qword_2573742B8);
    sub_2445E689C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v13, v6);
    swift_unknownObjectRetain();
    sub_2445DE820(a3, v16);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  sub_2445D432C((uint64_t)v15, &qword_2573742B8);
  return swift_unknownObjectRelease();
}

uint64_t sub_2445D66A4(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const void *v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  swift_unknownObjectRetain();
  v5 = (const void *)sub_2445E6CF8();
  v7 = v6;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445E6D04();
  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  v8 = sub_2445E6BE4();
  sub_2445DED9C(v5, v7, v8, v9, a3);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return swift_unknownObjectRelease();
}

uint64_t sub_2445D67A8()
{
  uint64_t v0;

  sub_2445D432C(v0 + qword_257375038, &qword_2573742A8);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2445D6800()
{
  uint64_t v0;

  v0 = sub_2445E69EC();
  sub_2445D432C(v0 + qword_257375038, &qword_2573742A8);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_2445D687C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_257374250)
  {
    sub_2445E6BC0();
    v0 = sub_2445E6E3C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_257374250);
  }
}

uint64_t sub_2445D68D0()
{
  return type metadata accessor for PGetManyCursor(0);
}

ValueMetadata *type metadata accessor for PGetManyConfig()
{
  return &type metadata for PGetManyConfig;
}

unint64_t sub_2445D68EC()
{
  unint64_t result;

  result = qword_257374270;
  if (!qword_257374270)
  {
    result = MEMORY[0x24951397C](&unk_2445E8108, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_257374270);
  }
  return result;
}

unint64_t sub_2445D6934()
{
  unint64_t result;

  result = qword_257374278;
  if (!qword_257374278)
  {
    result = MEMORY[0x24951397C](&unk_2445E8138, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_257374278);
  }
  return result;
}

unint64_t sub_2445D697C()
{
  unint64_t result;

  result = qword_257374280;
  if (!qword_257374280)
  {
    result = MEMORY[0x24951397C](&unk_2445E81A8, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_257374280);
  }
  return result;
}

unint64_t sub_2445D69C4()
{
  unint64_t result;

  result = qword_257374288;
  if (!qword_257374288)
  {
    result = MEMORY[0x24951397C](&unk_2445E8180, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_257374288);
  }
  return result;
}

unint64_t sub_2445D6A08()
{
  unint64_t result;

  result = qword_257374290;
  if (!qword_257374290)
  {
    result = MEMORY[0x24951397C](&unk_2445E82E0, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_257374290);
  }
  return result;
}

unint64_t sub_2445D6A4C()
{
  unint64_t result;

  result = qword_257374298;
  if (!qword_257374298)
  {
    result = MEMORY[0x24951397C](MEMORY[0x24BE74050], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257374298);
  }
  return result;
}

unint64_t sub_2445D6A90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573742A0;
  if (!qword_2573742A0)
  {
    v1 = sub_2445E6AA0();
    result = MEMORY[0x24951397C](MEMORY[0x24BE74468], v1);
    atomic_store(result, (unint64_t *)&qword_2573742A0);
  }
  return result;
}

unint64_t sub_2445D6AD8()
{
  unint64_t result;

  result = qword_2573742B0;
  if (!qword_2573742B0)
  {
    result = MEMORY[0x24951397C](&unk_2445E82A8, &type metadata for PGetManyColumn);
    atomic_store(result, (unint64_t *)&qword_2573742B0);
  }
  return result;
}

uint64_t sub_2445D6B1C(_QWORD *a1)
{
  uint64_t v1;

  return sub_2445D66A4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2445D6B34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2445E6D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445D6B78(uint64_t a1)
{
  uint64_t v1;

  return sub_2445D64D8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2445D6B90(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2445E6D70();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2445D6BCC()
{
  unint64_t result;

  result = qword_2573742C8;
  if (!qword_2573742C8)
  {
    result = MEMORY[0x24951397C](&unk_2445E8268, &type metadata for PGetManyError);
    atomic_store(result, (unint64_t *)&qword_2573742C8);
  }
  return result;
}

uint64_t sub_2445D6C10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t destroy for PGetManyError(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s10PoirotUDFs13PGetManyErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for PGetManyError(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for PGetManyError(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PGetManyError(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *(_BYTE *)(a1 + 16))
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

uint64_t storeEnumTagSinglePayload for PGetManyError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 1;
  }
  return result;
}

uint64_t sub_2445D6E6C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2445D6E84(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for PGetManyError()
{
  return &type metadata for PGetManyError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PGetManyColumn(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PGetManyColumn(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2445D6F9C + 4 * byte_2445E801E[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2445D6FD0 + 4 * byte_2445E8019[v4]))();
}

uint64_t sub_2445D6FD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445D6FD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2445D6FE0);
  return result;
}

uint64_t sub_2445D6FEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2445D6FF4);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2445D6FF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445D7000(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445D700C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2445D7014(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for PGetManyColumn()
{
  return &type metadata for PGetManyColumn;
}

unint64_t sub_2445D7038()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573742D8;
  if (!qword_2573742D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573742E0);
    result = MEMORY[0x24951397C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2573742D8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249513970](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2445D70C8()
{
  unint64_t v0;

  v0 = sub_2445E6EC0();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_2445D7110@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  char v9;
  uint64_t v10;

  v2 = v1;
  v4 = sub_2445E6CA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if ((_DWORD)result == *MEMORY[0x24BE74878])
  {
    *a1 = 0;
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if ((_DWORD)result == *MEMORY[0x24BE748E0])
  {
    *a1 = 10;
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if ((_DWORD)result == *MEMORY[0x24BE74890])
    goto LABEL_7;
  if ((_DWORD)result == *MEMORY[0x24BE748C0])
  {
LABEL_9:
    v9 = 4;
    goto LABEL_10;
  }
  if ((_DWORD)result == *MEMORY[0x24BE748A8])
    goto LABEL_7;
  if ((_DWORD)result == *MEMORY[0x24BE748D0])
    goto LABEL_9;
  if ((_DWORD)result == *MEMORY[0x24BE748E8])
  {
LABEL_7:
    v9 = 2;
    goto LABEL_10;
  }
  if ((_DWORD)result == *MEMORY[0x24BE74898])
  {
LABEL_16:
    v9 = 3;
    goto LABEL_10;
  }
  if ((_DWORD)result == *MEMORY[0x24BE748C8])
    goto LABEL_18;
  if ((_DWORD)result == *MEMORY[0x24BE748B0])
    goto LABEL_16;
  if ((_DWORD)result == *MEMORY[0x24BE748D8])
  {
LABEL_18:
    v9 = 5;
    goto LABEL_10;
  }
  if ((_DWORD)result == *MEMORY[0x24BE748F0])
    goto LABEL_16;
  if ((_DWORD)result == *MEMORY[0x24BE748A0])
  {
    v9 = 7;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE74888])
  {
    v9 = 6;
  }
  else if ((_DWORD)result == *MEMORY[0x24BE74870])
  {
    v9 = 9;
  }
  else
  {
    if ((_DWORD)result == *MEMORY[0x24BE748B8])
    {
      *a1 = 0;
      return result;
    }
    if ((_DWORD)result != *MEMORY[0x24BE74880])
    {
      result = sub_2445E6E90();
      __break(1u);
      return result;
    }
    v9 = 1;
  }
LABEL_10:
  *a1 = v9;
  return result;
}

uint64_t DefaultStreamSchemaProvider.__allocating_init(messageName:manifestData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374000);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = swift_allocObject();
  v10 = v9 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_QWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v9 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x24BEE4B08];
  v11 = (_QWORD *)(v9 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  *v11 = 0;
  v11[1] = 0;
  sub_2445D4560(a3, (uint64_t)v8, &qword_257374000);
  v12 = BaseStreamSchemaProvider.init(messageName:manifestData:)(a1, a2, (uint64_t)v8);
  sub_2445D432C(a3, &qword_257374000);
  return v12;
}

uint64_t DefaultStreamSchemaProvider.init(messageName:manifestData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374000);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  *(_OWORD *)v10 = 0u;
  *(_OWORD *)(v10 + 16) = 0u;
  *(_QWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x24BEE4B08];
  v11 = (_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  *v11 = 0;
  v11[1] = 0;
  sub_2445D4560(a3, (uint64_t)v9, &qword_257374000);
  v12 = BaseStreamSchemaProvider.init(messageName:manifestData:)(a1, a2, (uint64_t)v9);
  sub_2445D432C(a3, &qword_257374000);
  return v12;
}

uint64_t DefaultStreamSchemaProvider.__allocating_init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = swift_allocObject();
  v7 = v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_QWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x24BEE4B08];
  v8 = (_QWORD *)(v6 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  *v8 = 0;
  v8[1] = 0;
  sub_2445D4560(a3, v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  *(_QWORD *)(v6 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x24BEE4AF8];
  swift_weakInit();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  sub_2445D432C(a3, &qword_257373FF8);
  return v6;
}

uint64_t DefaultStreamSchemaProvider.init(messageName:manifest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;

  v7 = v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_QWORD *)(v7 + 32) = 0;
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs) = MEMORY[0x24BEE4B08];
  v8 = (_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
  *v8 = 0;
  v8[1] = 0;
  sub_2445D4560(a3, v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns) = MEMORY[0x24BEE4AF8];
  swift_weakInit();
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  sub_2445D432C(a3, &qword_257373FF8);
  return v3;
}

uint64_t sub_2445D779C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v1 = sub_2445E6BE4();
  v3 = v2;
  swift_beginAccess();
  sub_2445D8BF4(&v10, v1, v3);
  swift_endAccess();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573744A0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_2445E8390;
  v8 = sub_2445E6BE4();
  v9 = v5;
  swift_bridgeObjectRetain();
  sub_2445E6E18();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v4 + 32) = v8;
  *(_QWORD *)(v4 + 40) = v9;
  *(_WORD *)(v4 + 48) = 256;
  *(_QWORD *)(v4 + 56) = sub_2445E6BE4();
  *(_QWORD *)(v4 + 64) = v6;
  *(_WORD *)(v4 + 72) = 266;
  return v4;
}

uint64_t sub_2445D78EC@<X0>(_QWORD *a1@<X1>, char **a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  _QWORD v9[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2445E6CEC();
  if (!v3)
  {
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    v7 = sub_2445E6C74();
    result = sub_2445D97EC(a2, v7);
    v8 = *((_QWORD *)*a2 + 2);
    if (v8 < result)
    {
      __break(1u);
    }
    else
    {
      sub_2445D9B94(result, v8);
      swift_bridgeObjectRelease();
      *a3 = sub_2445D779C(v9);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
    }
  }
  return result;
}

uint64_t sub_2445D79F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_2445E6F20();
    sub_2445E6DF4();
    v6 = sub_2445E6F38();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_2445E6ECC() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_2445E6ECC() & 1) != 0)
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

char *sub_2445D7B2C(void (*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  char *result;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _QWORD v20[2];
  uint64_t v21;

  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  if (!v5)
    return (char *)MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v7 = (uint64_t *)(a3 + 40);
  v8 = (char *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    v9 = *v7;
    v20[0] = *(v7 - 1);
    v20[1] = v9;
    swift_bridgeObjectRetain();
    a1(&v21, v20);
    if (v4)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    result = (char *)swift_bridgeObjectRelease();
    v11 = v21;
    v12 = *(_QWORD *)(v21 + 16);
    v13 = *((_QWORD *)v8 + 2);
    v14 = v13 + v12;
    if (__OFADD__(v13, v12))
      break;
    result = (char *)swift_isUniquelyReferenced_nonNull_native();
    if ((_DWORD)result && v14 <= *((_QWORD *)v8 + 3) >> 1)
    {
      if (*(_QWORD *)(v11 + 16))
        goto LABEL_15;
    }
    else
    {
      if (v13 <= v14)
        v15 = v13 + v12;
      else
        v15 = v13;
      result = sub_2445E3920(result, v15, 1, v8);
      v8 = result;
      if (*(_QWORD *)(v11 + 16))
      {
LABEL_15:
        if ((*((_QWORD *)v8 + 3) >> 1) - *((_QWORD *)v8 + 2) < v12)
          goto LABEL_25;
        result = (char *)swift_arrayInitWithCopy();
        if (v12)
        {
          v16 = *((_QWORD *)v8 + 2);
          v17 = __OFADD__(v16, v12);
          v18 = v16 + v12;
          if (v17)
            goto LABEL_26;
          *((_QWORD *)v8 + 2) = v18;
        }
        goto LABEL_4;
      }
    }
    if (v12)
      goto LABEL_24;
LABEL_4:
    v7 += 2;
    swift_bridgeObjectRelease();
    if (!--v5)
    {
      swift_bridgeObjectRelease();
      return v8;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_2445D7CD8@<X0>(_QWORD *a1@<X1>, _BYTE *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  char *v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _QWORD v22[3];
  uint64_t v23;
  unsigned __int8 v24;

  v20 = a3;
  v21 = a2;
  v5 = sub_2445E6CA4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  result = sub_2445E6CB0();
  if (!v3)
  {
    v10 = v8;
    v18 = v6;
    v19 = v5;
    v11 = v20;
    v12 = v21;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    if ((sub_2445E6C5C() & 1) != 0)
    {
      *v12 = 1;
      *(_QWORD *)v11 = 0;
      *(_QWORD *)(v11 + 8) = 0;
      *(_WORD *)(v11 + 16) = 0;
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v22, v23);
      v13 = sub_2445E6BE4();
      v15 = v14;
      __swift_project_boxed_opaque_existential_1(v22, v23);
      sub_2445E6C68();
      sub_2445D7110((char *)&v24);
      (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v19);
      v16 = v24;
      *(_QWORD *)v11 = v13;
      *(_QWORD *)(v11 + 8) = v15;
      *(_WORD *)(v11 + 16) = v16;
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  }
  return result;
}

char *sub_2445D7E78(void (*a1)(uint64_t *__return_ptr, _QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  _QWORD v21[4];

  v21[3] = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a3 + 16);
  if (!v5)
    return (char *)MEMORY[0x24BEE4AF8];
  swift_bridgeObjectRetain();
  v7 = (uint64_t *)(a3 + 40);
  v8 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    v10 = *v7;
    v21[0] = *(v7 - 1);
    v21[1] = v10;
    swift_bridgeObjectRetain();
    a1(&v18, v21);
    if (v4)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v8;
    }
    swift_bridgeObjectRelease();
    v11 = v19;
    if (v19)
    {
      v12 = v18;
      v13 = v20;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v8 = sub_2445E3920(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v15 = *((_QWORD *)v8 + 2);
      v14 = *((_QWORD *)v8 + 3);
      if (v15 >= v14 >> 1)
        v8 = sub_2445E3920((char *)(v14 > 1), v15 + 1, 1, v8);
      *((_QWORD *)v8 + 2) = v15 + 1;
      v9 = &v8[24 * v15];
      *((_QWORD *)v9 + 4) = v12;
      *((_QWORD *)v9 + 5) = v11;
      v9[48] = v13;
      v9[49] = HIBYTE(v13) & 1;
    }
    v7 += 2;
    --v5;
  }
  while (v5);
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_2445D7FEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[16];
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;
  char v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v2 = v0;
  v3 = v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  swift_beginAccess();
  sub_2445D4560(v3, (uint64_t)&v22, &qword_2573742E8);
  if (!v23)
    goto LABEL_19;
  sub_2445D2610(&v22, (uint64_t)v24);
  __swift_project_boxed_opaque_existential_1(v24, v25);
  v26 = sub_2445E6CD4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  sub_2445D4560(v3, (uint64_t)&v22, &qword_2573742E8);
  if (!v23)
    goto LABEL_19;
  sub_2445D2610(&v22, (uint64_t)v24);
  __swift_project_boxed_opaque_existential_1(v24, v25);
  v4 = sub_2445E6CE0();
  MEMORY[0x24BDAC7A8](v4);
  v17 = v24;
  v18 = &v26;
  v19 = v2;
  v5 = sub_2445D7B2C((void (*)(uint64_t *__return_ptr, _QWORD *))sub_2445D97B4, (uint64_t)v16, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  if (v1)
    return swift_bridgeObjectRelease();
  v21 = 0;
  v6 = v26;
  sub_2445D4560(v3, (uint64_t)&v22, &qword_2573742E8);
  if (v23)
  {
    v7 = sub_2445D2610(&v22, (uint64_t)v24);
    MEMORY[0x24BDAC7A8](v7);
    v17 = v24;
    v18 = (uint64_t *)&v21;
    v19 = v2;
    v8 = sub_2445D7E78((void (*)(uint64_t *__return_ptr, _QWORD *))sub_2445D97D0, (uint64_t)v16, v6);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
    swift_bridgeObjectRelease();
    if (v21)
      v10 = &unk_2515322F8;
    else
      v10 = (void *)MEMORY[0x24BEE4AF8];
    v11 = &unk_251532308;
    if (!v21)
      v11 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    if (*v11)
    {
      if (v21)
        v12 = &unk_2515322F8;
      else
        v12 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = v12[4];
      v14 = swift_bridgeObjectRetain();
    }
    else
    {
      v13 = 0;
      v14 = 0;
    }
    v15 = (_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName);
    *v15 = v13;
    v15[1] = v14;
    swift_bridgeObjectRelease();
    v24[0] = v10;
    sub_2445E3FD0((uint64_t)v8);
    sub_2445E3FD0((uint64_t)v5);
    return v24[0];
  }
  else
  {
LABEL_19:
    sub_2445D432C((uint64_t)&v22, &qword_2573742E8);
    v20 = 0;
    v19 = 192;
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445D82EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _BYTE v7[40];
  _BYTE v8[40];

  v2 = v0;
  sub_2445E6B0C();
  swift_getObjectType();
  sub_2445E6C8C();
  if (v1)
    return swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  sub_2445D1B00((uint64_t)v8, (uint64_t)v7);
  v4 = v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  swift_beginAccess();
  sub_2445D83F4((uint64_t)v7, v4);
  swift_endAccess();
  v5 = sub_2445D7FEC();
  v6 = (uint64_t *)(v2 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_columns);
  swift_beginAccess();
  *v6 = v5;
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

uint64_t sub_2445D83F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445D843C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t result;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t *, uint64_t, uint64_t, uint64_t);
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t *v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  _QWORD v66[4];
  uint64_t v67;

  v62 = a3;
  v7 = sub_2445E6B00();
  v56 = *(_QWORD *)(v7 - 8);
  v57 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v55 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742F0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v58 = (char *)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v61 = (char *)&v54 - v12;
  v13 = sub_2445E6AE8();
  v59 = *(_QWORD *)(v13 - 8);
  v60 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v54 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_2445E6BC0();
  v63 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema;
  swift_beginAccess();
  sub_2445D4560(v17, (uint64_t)&v64, &qword_2573742E8);
  if (!v65)
  {
LABEL_24:
    sub_2445D432C((uint64_t)&v64, &qword_2573742E8);
    result = sub_2445E6E90();
    __break(1u);
    return result;
  }
  sub_2445D2610(&v64, (uint64_t)v66);
  __swift_project_boxed_opaque_existential_1(v66, v66[3]);
  sub_2445E6CC8();
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v66);
  if (!v4)
  {
    v19 = *(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName + 8);
    if (v19
      && (*(_QWORD *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageColumnName) == a1
       && v19 == a2
       || (sub_2445E6ECC() & 1) != 0))
    {
      v20 = v62;
      (*(void (**)(uint64_t *, char *, uint64_t))(v63 + 32))(v62, v16, v67);
      v21 = sub_2445E6D70();
      swift_storeEnumTagMultiPayload();
      v22 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
      v23 = v20;
LABEL_8:
      v24 = 0;
      v25 = v21;
      return v22(v23, v24, 1, v25);
    }
    if ((sub_2445E6E24() & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v26 = sub_2445E6E00();
      v27 = sub_2445E6E00();
      v28 = __OFSUB__(v26, v27);
      v29 = v26 - v27;
      if (!v28)
      {
        v30 = sub_2445D9684(v29);
        v32 = v31;
        v34 = v33;
        v36 = v35;
        swift_bridgeObjectRelease();
        MEMORY[0x249513670](v30, v32, v34, v36);
        swift_bridgeObjectRelease();
        v37 = v61;
        sub_2445E6B9C();
        swift_bridgeObjectRelease();
        v46 = v59;
        v45 = v60;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v37, 1, v60) != 1)
        {
          v47 = v54;
          (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v54, v37, v45);
          v48 = v55;
          sub_2445E6AD0();
          v49 = sub_2445E6AF4();
          v51 = v50;
          (*(void (**)(char *, uint64_t))(v56 + 8))(v48, v57);
          (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v45);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v16, v67);
          v52 = v62;
          *v62 = v49;
          v52[1] = v51;
          v21 = sub_2445E6D70();
          swift_storeEnumTagMultiPayload();
          v22 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
          v23 = v52;
          goto LABEL_8;
        }
        (*(void (**)(char *, uint64_t))(v63 + 8))(v16, v67);
        v44 = (uint64_t)v37;
LABEL_20:
        sub_2445D432C(v44, &qword_2573742F0);
        v25 = sub_2445E6D70();
        v22 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
        v23 = v62;
        v24 = 1;
        return v22(v23, v24, 1, v25);
      }
      __break(1u);
      goto LABEL_24;
    }
    v38 = (uint64_t *)(v3 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_oneofs);
    swift_beginAccess();
    v39 = *v38;
    swift_bridgeObjectRetain();
    v40 = sub_2445D79F8(a1, a2, v39);
    swift_bridgeObjectRelease();
    if ((v40 & 1) != 0)
    {
      v41 = v58;
      sub_2445E6B9C();
      v43 = v59;
      v42 = v60;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v41, 1, v60) != 1)
      {
        v53 = v62;
        sub_2445E6ADC();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v16, v67);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v42);
        v25 = sub_2445E6D70();
        v22 = *(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
        v23 = v53;
        v24 = 0;
        return v22(v23, v24, 1, v25);
      }
      (*(void (**)(char *, uint64_t))(v63 + 8))(v16, v67);
      v44 = (uint64_t)v41;
      goto LABEL_20;
    }
    sub_2445E6B90();
    return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v16, v67);
  }
  return result;
}

uint64_t sub_2445D8A68()
{
  uint64_t v0;

  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema, &qword_2573742E8);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t DefaultStreamSchemaProvider.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema, &qword_2573742E8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DefaultStreamSchemaProvider.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs24BaseStreamSchemaProvider_schemaManifest, &qword_257373FF8);
  swift_bridgeObjectRelease();
  swift_weakDestroy();
  sub_2445D432C(v0 + OBJC_IVAR____TtC10PoirotUDFs27DefaultStreamSchemaProvider_messageSchema, &qword_2573742E8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2445D8BF4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2445E6F20();
  swift_bridgeObjectRetain();
  sub_2445E6DF4();
  v8 = sub_2445E6F38();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2445E6ECC() & 1) != 0)
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
      if (v19 || (sub_2445E6ECC() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2445D907C(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2445D8DA0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573744A8);
  v3 = sub_2445E6E6C();
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
      sub_2445E6F20();
      sub_2445E6DF4();
      result = sub_2445E6F38();
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

uint64_t sub_2445D907C(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2445D8DA0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2445D9214();
      goto LABEL_22;
    }
    sub_2445D93C4();
  }
  v11 = *v4;
  sub_2445E6F20();
  sub_2445E6DF4();
  result = sub_2445E6F38();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2445E6ECC(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2445E6ED8();
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
          result = sub_2445E6ECC();
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

void *sub_2445D9214()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573744A8);
  v2 = *v0;
  v3 = sub_2445E6E60();
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

uint64_t sub_2445D93C4()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2573744A8);
  v3 = sub_2445E6E6C();
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
    sub_2445E6F20();
    swift_bridgeObjectRetain();
    sub_2445E6DF4();
    result = sub_2445E6F38();
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

char *sub_2445D9670(uint64_t a1)
{
  return sub_2445E3CDC(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_2445D9684(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_2445E6E0C();
    return sub_2445E6E30();
  }
  return result;
}

uint64_t sub_2445D970C()
{
  return type metadata accessor for DefaultStreamSchemaProvider();
}

uint64_t type metadata accessor for DefaultStreamSchemaProvider()
{
  uint64_t result;

  result = qword_257374320;
  if (!qword_257374320)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445D9750()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for DefaultStreamSchemaProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2445D97B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_2445D78EC(*(_QWORD **)(v1 + 16), *(char ***)(v1 + 24), a1);
}

uint64_t sub_2445D97D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2445D7CD8(*(_QWORD **)(v1 + 16), *(_BYTE **)(v1 + 24), a1);
}

uint64_t sub_2445D97EC(char **a1, uint64_t a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  BOOL v14;
  _QWORD *v15;
  BOOL v16;
  char *v17;
  uint64_t result;
  unint64_t v19;
  uint64_t v20;
  unint64_t *v21;
  BOOL v22;
  unint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  BOOL v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t i;
  _QWORD *v37;
  BOOL v38;
  unint64_t v39;
  unint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v45;
  uint64_t v46;
  uint64_t v47;

  v2 = *a1;
  v3 = *((_QWORD *)*a1 + 2);
  if (v3)
  {
    v4 = a2;
    v47 = a2 + 56;
    swift_bridgeObjectRetain();
    v5 = 0;
    v46 = v4;
    while (1)
    {
      if (!*(_QWORD *)(v4 + 16))
        goto LABEL_4;
      v6 = &v2[16 * v5 + 32];
      v8 = *(_QWORD *)v6;
      v7 = *((_QWORD *)v6 + 1);
      sub_2445E6F20();
      swift_bridgeObjectRetain();
      sub_2445E6DF4();
      v9 = sub_2445E6F38();
      v10 = -1 << *(_BYTE *)(v4 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v47 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
        break;
LABEL_3:
      swift_bridgeObjectRelease();
      v4 = v46;
LABEL_4:
      if (++v5 == v3)
      {
        swift_bridgeObjectRelease();
        return *((_QWORD *)v2 + 2);
      }
    }
    v12 = *(_QWORD *)(v46 + 48);
    v13 = (_QWORD *)(v12 + 16 * v11);
    v14 = *v13 == v8 && v13[1] == v7;
    if (!v14 && (sub_2445E6ECC() & 1) == 0)
    {
      do
      {
        v11 = (v11 + 1) & ~v10;
        if (((*(_QWORD *)(v47 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
          goto LABEL_3;
        v15 = (_QWORD *)(v12 + 16 * v11);
        v16 = *v15 == v8 && v15[1] == v7;
      }
      while (!v16 && (sub_2445E6ECC() & 1) == 0);
    }
    v17 = v2;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v19 = v5 + 1;
    v20 = v46;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    while (1)
    {
      while (1)
      {
        v23 = *((_QWORD *)v17 + 2);
        if (v19 == v23)
          return v5;
        if (v19 >= v23)
        {
          __break(1u);
LABEL_57:
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          __break(1u);
LABEL_61:
          __break(1u);
LABEL_62:
          __break(1u);
          return result;
        }
        v24 = v17 + 32;
        v25 = &v17[16 * v19 + 32];
        if (*(_QWORD *)(v20 + 16))
          break;
LABEL_45:
        if (v5 != v19)
        {
          if ((v5 & 0x8000000000000000) != 0)
            goto LABEL_59;
          v39 = *((_QWORD *)v17 + 2);
          if (v5 >= v39)
            goto LABEL_60;
          if (v19 >= v39)
            goto LABEL_61;
          v40 = (unint64_t *)&v24[16 * v5];
          v11 = *v40;
          v12 = v40[1];
          v41 = *(_QWORD *)v25;
          v42 = *((_QWORD *)v25 + 1);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v17 = sub_2445D9670((uint64_t)v17);
          v2 = v17 + 32;
          v43 = &v17[16 * v5 + 32];
          *(_QWORD *)v43 = v41;
          *((_QWORD *)v43 + 1) = v42;
          result = swift_bridgeObjectRelease();
          if (v19 >= *((_QWORD *)v17 + 2))
            goto LABEL_62;
LABEL_21:
          v21 = (unint64_t *)&v2[16 * v19];
          *v21 = v11;
          v21[1] = v12;
          result = swift_bridgeObjectRelease();
          *a1 = v17;
          v20 = v46;
        }
        v22 = __OFADD__(v5++, 1);
        if (v22)
          goto LABEL_58;
        v22 = __OFADD__(v19++, 1);
        if (v22)
          goto LABEL_57;
      }
      v45 = v17;
      v27 = *(_QWORD *)v25;
      v26 = *((_QWORD *)v25 + 1);
      sub_2445E6F20();
      swift_bridgeObjectRetain();
      sub_2445E6DF4();
      v28 = sub_2445E6F38();
      v29 = -1 << *(_BYTE *)(v20 + 32);
      v30 = v28 & ~v29;
      if (((*(_QWORD *)(v47 + ((v30 >> 3) & 0xFFFFFFFFFFFFF8)) >> v30) & 1) == 0)
        goto LABEL_44;
      v31 = *(_QWORD *)(v46 + 48);
      v32 = (_QWORD *)(v31 + 16 * v30);
      v33 = *v32 == v27 && v32[1] == v26;
      if (!v33 && (sub_2445E6ECC() & 1) == 0)
        break;
LABEL_33:
      result = swift_bridgeObjectRelease();
      v17 = v45;
      v20 = v46;
      v22 = __OFADD__(v19++, 1);
      if (v22)
        goto LABEL_57;
    }
    v34 = v30 + 1;
    v35 = ~v29;
    for (i = v34 & ~v29; ((*(_QWORD *)(v47 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v35)
    {
      v37 = (_QWORD *)(v31 + 16 * i);
      v38 = *v37 == v27 && v37[1] == v26;
      if (v38 || (sub_2445E6ECC() & 1) != 0)
        goto LABEL_33;
    }
LABEL_44:
    result = swift_bridgeObjectRelease();
    v17 = v45;
    v20 = v46;
    goto LABEL_45;
  }
  return 0;
}

uint64_t sub_2445D9B94(uint64_t result, int64_t a2)
{
  char **v2;
  char *v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  char *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_21;
  }
  v4 = *v2;
  v5 = *((_QWORD *)*v2 + 2);
  if (v5 < a2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > *((_QWORD *)v4 + 3) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_2445E3CDC(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_19;
  v12 = *((_QWORD *)v4 + 2);
  v13 = __OFSUB__(v12, a2);
  v14 = v12 - a2;
  if (v13)
    goto LABEL_25;
  v15 = &v4[16 * a2 + 32];
  if (v6 != a2 || &v4[16 * v6 + 32] >= &v15[16 * v14])
    result = (uint64_t)memmove(&v4[16 * v6 + 32], v15, 16 * v14);
  v16 = *((_QWORD *)v4 + 2);
  v13 = __OFADD__(v16, v8);
  v17 = v16 - v7;
  if (!v13)
  {
    *((_QWORD *)v4 + 2) = v17;
LABEL_19:
    *v2 = v4;
    return result;
  }
LABEL_26:
  __break(1u);
  return result;
}

unint64_t sub_2445D9CA8()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t v2;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257374778);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2445E8400;
  *(_QWORD *)(inited + 32) = 0x6D756E655F70;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = type metadata accessor for PEnumFunction();
  *(_QWORD *)(inited + 56) = &off_251532A70;
  *(_QWORD *)(inited + 64) = 0x6A626F5F70;
  *(_QWORD *)(inited + 72) = 0xE500000000000000;
  *(_QWORD *)(inited + 80) = type metadata accessor for PObjFunction();
  *(_QWORD *)(inited + 88) = &off_251532A70;
  *(_QWORD *)(inited + 96) = 0x7465675F70;
  *(_QWORD *)(inited + 104) = 0xE500000000000000;
  *(_QWORD *)(inited + 112) = type metadata accessor for PGetFunction();
  *(_QWORD *)(inited + 120) = &off_251532A70;
  *(_QWORD *)(inited + 128) = 0x6E616D7465675F70;
  *(_QWORD *)(inited + 136) = 0xE900000000000079;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742D0);
  v2 = sub_2445DCDA0();
  *(_QWORD *)(inited + 144) = v1;
  *(_QWORD *)(inited + 152) = v2;
  *(_QWORD *)(inited + 160) = 0x666F656E6F5F70;
  *(_QWORD *)(inited + 168) = 0xE700000000000000;
  *(_QWORD *)(inited + 176) = type metadata accessor for POneOfFunction();
  *(_QWORD *)(inited + 184) = &off_251532A70;
  *(_QWORD *)(inited + 192) = 0x6E6F5F7361685F70;
  *(_QWORD *)(inited + 200) = 0xEB00000000666F65;
  *(_QWORD *)(inited + 208) = type metadata accessor for PHasOneOfFunction();
  *(_QWORD *)(inited + 216) = &off_251532A70;
  *(_QWORD *)(inited + 224) = 0x6E6F736A5F70;
  *(_QWORD *)(inited + 232) = 0xE600000000000000;
  *(_QWORD *)(inited + 240) = type metadata accessor for PJSONFunction();
  *(_QWORD *)(inited + 248) = &off_251532A70;
  *(_QWORD *)(inited + 256) = 0x616F6C7961705F70;
  *(_QWORD *)(inited + 264) = 0xE900000000000064;
  *(_QWORD *)(inited + 272) = type metadata accessor for PPayloadFunction();
  *(_QWORD *)(inited + 280) = &off_251532A70;
  strcpy((char *)(inited + 288), "p_message_name");
  *(_BYTE *)(inited + 303) = -18;
  *(_QWORD *)(inited + 304) = type metadata accessor for PMessageNameFunction();
  *(_QWORD *)(inited + 312) = &off_251532A70;
  *(_QWORD *)(inited + 320) = 0x7465675F6270;
  *(_QWORD *)(inited + 328) = 0xE600000000000000;
  *(_QWORD *)(inited + 336) = type metadata accessor for PBGetFunction();
  *(_QWORD *)(inited + 344) = &off_251532A70;
  *(_QWORD *)(inited + 352) = 0x65646F6365645F70;
  *(_QWORD *)(inited + 360) = 0xEF3436657361625FLL;
  *(_QWORD *)(inited + 368) = type metadata accessor for PBase64DecodeFunction();
  *(_QWORD *)(inited + 376) = &off_251532A70;
  result = sub_2445D3C18(inited);
  qword_257375080 = result;
  return result;
}

uint64_t sub_2445D9EB0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*a1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database);
  if (v2)
  {
    *a2 = v2;
    return swift_retain();
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445D9F2C()
{
  uint64_t v0;
  uint64_t result;

  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
    return swift_retain();
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445D9FA0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = a1;
  return swift_release();
}

uint64_t (*sub_2445D9FB8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*result)(_QWORD *);

  v3 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  a1[1] = v1;
  a1[2] = v3;
  v4 = *(_QWORD *)(v1 + v3);
  if (v4)
  {
    *a1 = v4;
    swift_retain();
    return sub_2445DA054;
  }
  else
  {
    result = (uint64_t (*)(_QWORD *))sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445DA054(_QWORD *a1)
{
  *(_QWORD *)(a1[1] + a1[2]) = *a1;
  return swift_release();
}

uint64_t sub_2445DA068()
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
  uint64_t result;
  uint64_t v11;

  v2 = v0;
  v3 = sub_2445E6848();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule;
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule))
  {
    v8 = *(_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule);
    goto LABEL_3;
  }
  type metadata accessor for PStreamTable(0);
  *(_QWORD *)(swift_allocObject() + qword_257374C40 + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = &off_251532A28;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE741E8], v3);
  v9 = sub_2445E6A4C();
  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    v8 = v9;
    swift_retain();
    sub_2445E686C();
    if (v1)
    {
      swift_release();
      swift_release();
      return v8;
    }
    swift_release();
    *(_QWORD *)(v2 + v7) = v8;
    swift_retain();
    swift_release();
LABEL_3:
    swift_retain();
    return v8;
  }
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445DA23C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v7 = (uint64_t *)(v3 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
  swift_beginAccess();
  v8 = *v7;
  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2445DFDB0(a1, a2);
    if ((v10 & 1) != 0)
    {
      sub_2445D1B00(*(_QWORD *)(v8 + 56) + 40 * v9, (uint64_t)&v12);
    }
    else
    {
      v14 = 0;
      v12 = 0u;
      v13 = 0u;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v13 + 1))
      return sub_2445D2610(&v12, a3);
  }
  else
  {
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
  }
  sub_2445D432C((uint64_t)&v12, &qword_257374770);
  *(_QWORD *)&v12 = 0;
  *((_QWORD *)&v12 + 1) = 0xE000000000000000;
  sub_2445E6E78();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v12 = 0x206E776F6E6B6E55;
  *((_QWORD *)&v12 + 1) = 0xEF203A656C626174;
  sub_2445E6E18();
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445DA3A8(uint64_t a1)
{
  uint64_t v2;

  type metadata accessor for UDFContext(0);
  v2 = swift_allocObject();
  UDFContext.init(databaseConnection:ownsConnection:)(a1, 0);
  return v2;
}

uint64_t UDFContext.__allocating_init(databaseConnection:ownsConnection:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  UDFContext.init(databaseConnection:ownsConnection:)(a1, a2);
  return v4;
}

uint64_t type metadata accessor for UDFContext(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374500);
}

uint64_t sub_2445DA468()
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
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v13 = sub_2445E6C20();
  v1 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2445E6B6C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2445E6BFC();
  v10 = v9;
  sub_2445E6C08();
  sub_2445E6AB8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v13);
  if (v0)
    return sub_2445D1B9C(v8, v10);
  sub_2445D1B9C(v8, v10);
  sub_2445DA5BC((uint64_t)v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_2445DA5BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD v10[5];

  v10[1] = a1;
  v2 = sub_2445E6B6C();
  MEMORY[0x24BDAC7A8](v2);
  v3 = type metadata accessor for UDFContext.StoreState(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v10 - v6;
  v8 = v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
  swift_beginAccess();
  sub_2445DB21C(v8, (uint64_t)v7);
  v9 = (char *)sub_2445DA6E0 + 4 * byte_2445E8410[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2445DA6E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v5, v1);
  v7 = *(_QWORD *)(v6 - 72);
  sub_2445E6B60();
  if (!v7)
  {
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    sub_2445DB260(v4, v3);
    swift_endAccess();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_2445DA860(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (*(_QWORD *)(result + 16))
  {
    v2 = result;
    result = sub_2445DA068();
    if (!v1)
    {
      sub_2445DC0C4(v2, (void (*)(uint64_t, uint64_t, _BYTE *))sub_2445DB2A4);
      v3 = sub_2445DC4C4(v2, (void (*)(_QWORD, _QWORD, _OWORD *))sub_2445DC28C);
      MEMORY[0x24BDAC7A8](v3);
      sub_2445DC4C4(v2, (void (*)(_QWORD, _QWORD, _OWORD *))sub_2445DC6E0);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_2445DA934(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t result;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v7 = (uint64_t *)(a4 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
  swift_beginAccess();
  v8 = *v7;
  if (!*(_QWORD *)(*v7 + 16))
  {
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
LABEL_7:
    sub_2445D432C((uint64_t)&v12, &qword_257374770);
    sub_2445D1B00(a3, (uint64_t)&v12);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_2445DAAFC((uint64_t)&v12, a1, a2);
    return swift_endAccess();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_2445DFDB0(a1, a2);
  if ((v10 & 1) != 0)
  {
    sub_2445D1B00(*(_QWORD *)(v8 + 56) + 40 * v9, (uint64_t)&v12);
  }
  else
  {
    v14 = 0;
    v12 = 0u;
    v13 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_7;
  sub_2445D432C((uint64_t)&v12, &qword_257374770);
  *(_QWORD *)&v12 = 0;
  *((_QWORD *)&v12 + 1) = 0xE000000000000000;
  sub_2445E6E78();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v12 = 0xD000000000000021;
  *((_QWORD *)&v12 + 1) = 0x80000002445E7820;
  sub_2445E6E18();
  sub_2445E6E18();
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445DAAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  __int128 v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_2445D2610((__int128 *)a1, (uint64_t)v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_2445E0670(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_2445D432C(a1, &qword_257374770);
    sub_2445DBDE4(a2, a3, (uint64_t)v9);
    swift_bridgeObjectRelease();
    return sub_2445D432C((uint64_t)v9, &qword_257374770);
  }
}

uint64_t sub_2445DABD0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257373FF8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2445E6B6C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_2445E6DDC();
  if (!v3)
  {
    v13 = a3[3];
    v14 = a3[4];
    __swift_project_boxed_opaque_existential_1(a3, v13);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v14 + 32))(v18, v13, v14);
    v15 = v19;
    v16 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_2445D432C((uint64_t)v7, &qword_257373FF8);
      return __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
      sub_2445DA5BC((uint64_t)v11);
      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    }
  }
  return result;
}

uint64_t sub_2445DAD78(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  _QWORD v16[3];
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;

  v16[1] = a1;
  v16[2] = a2;
  v7 = sub_2445E6B18();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3[3];
  v12 = a3[4];
  __swift_project_boxed_opaque_existential_1(a3, v11);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v12 + 32))(v17, v11, v12);
  v14 = v18;
  v13 = v19;
  v20 = __swift_project_boxed_opaque_existential_1(v17, v18);
  sub_2445DBA54();
  if (v4)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  swift_getObjectType();
  sub_2445E6C98();
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 24))(v10, v14, v13);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  if (*(_QWORD *)(a4 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    sub_2445E45DC();
    return swift_release();
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445DAF54(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t result;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    v3 = sub_2445E69B0();
    swift_release();
    if (v3)
      v4 = v3 == a1;
    else
      v4 = 0;
    if (v4)
    {
      return sub_2445DB524();
    }
    else
    {
      sub_2445D1AA4();
      swift_allocError();
      *(_QWORD *)v5 = 0xD00000000000003ALL;
      *(_QWORD *)(v5 + 8) = 0x80000002445E7700;
      *(_BYTE *)(v5 + 16) = 3;
      return swift_willThrow();
    }
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t UDFContext.init(databaseConnection:ownsConnection:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = (_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *v4 = 0;
  v4[1] = 0;
  v5 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + v5) = sub_2445D3D34(MEMORY[0x24BEE4AF8]);
  v7 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(_QWORD *)(v2 + v7) = sub_2445D3E5C(v6);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  v8 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  *(_QWORD *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  sub_2445E69E0();
  swift_allocObject();
  v9 = sub_2445E69A4();
  if (v3)
  {
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    type metadata accessor for UDFContext(0);
    swift_deallocPartialClassInstance();
  }
  else
  {
    *(_QWORD *)(v2 + v8) = v9;
    swift_release();
    *(_BYTE *)(v2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = a2 & 1;
    type metadata accessor for UDFContext.StoreState(0);
    swift_storeEnumTagMultiPayload();
    sub_2445DB91C();
  }
  return v2;
}

uint64_t type metadata accessor for UDFContext.StoreState(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374738);
}

uint64_t sub_2445DB21C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445DB260(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445DB2A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2445DA934(a1, a2, a3, v3);
}

uint64_t UDFContext.__allocating_init()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = swift_allocObject();
  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *v1 = 0;
  v1[1] = 0;
  v2 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + v2) = sub_2445D3D34(MEMORY[0x24BEE4AF8]);
  v4 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(_QWORD *)(v0 + v4) = sub_2445D3E5C(v3);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = 0;
  type metadata accessor for UDFContext.StoreState(0);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t UDFContext.init()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  *v1 = 0;
  v1[1] = 0;
  v2 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  v3 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v0 + v2) = sub_2445D3D34(MEMORY[0x24BEE4AF8]);
  v4 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders;
  *(_QWORD *)(v0 + v4) = sub_2445D3E5C(v3);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) = 0;
  type metadata accessor for UDFContext.StoreState(0);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t UDFContext.deinit()
{
  uint64_t v0;

  sub_2445DB524();
  sub_2445DC6F8(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t UDFContext.__deallocating_deinit()
{
  uint64_t v0;

  sub_2445DB524();
  sub_2445DC6F8(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2445DB524()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for UDFContext.StoreState(0);
  result = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    swift_retain();
    v7 = sub_2445E69BC();
    result = swift_release();
    if (v7)
    {
      if (*(_QWORD *)(v0 + v6))
      {
        v8 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
        v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions);
        swift_bridgeObjectRetain();
        v10 = swift_retain();
        sub_2445DCDF4(v10, v9);
        swift_bridgeObjectRelease();
        swift_release();
        if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_tableModule))
        {
          v11 = (uint64_t *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_streamProviders);
          v12 = swift_beginAccess();
          v13 = *v11;
          MEMORY[0x24BDAC7A8](v12);
          swift_bridgeObjectRetain();
          swift_retain();
          sub_2445DC0C4(v13, (void (*)(uint64_t, uint64_t, _BYTE *))sub_2445DCDEC);
          swift_bridgeObjectRelease();
          if (!*(_QWORD *)(v0 + v6))
            goto LABEL_11;
          swift_retain();
          sub_2445E683C();
          swift_release();
          swift_release();
        }
        swift_storeEnumTagMultiPayload();
        v14 = v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
        swift_beginAccess();
        sub_2445DB260((uint64_t)v5, v14);
        swift_endAccess();
        *(_QWORD *)(v1 + v8) = MEMORY[0x24BEE4B00];
        result = swift_bridgeObjectRelease();
        if ((*(_BYTE *)(v1 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_ownsConnection) & 1) != 0)
          return result;
        if (*(_QWORD *)(v1 + v6))
        {
          swift_retain();
          sub_2445E69B0();
          return swift_release();
        }
      }
LABEL_11:
      result = sub_2445E6E90();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2445DB790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  _WORD v12[8];

  v6 = sub_2445E6A94();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a5 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
  {
    strcpy((char *)v12, "DROP TABLE \"");
    HIBYTE(v12[6]) = 0;
    v12[7] = -5120;
    swift_retain();
    sub_2445E6E18();
    sub_2445E6E18();
    sub_2445E69D4();
    swift_bridgeObjectRelease();
    sub_2445E6A88();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return swift_release();
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

void sub_2445DB91C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions;
  if (!*(_QWORD *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_functions) + 16))
  {
    if (qword_257373EE0 != -1)
      swift_once();
    v2 = qword_257375080;
    swift_retain();
    v3 = sub_2445DC2A4(v2);
    swift_release();
    *(_QWORD *)(v0 + v1) = v3;
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database))
    {
      v4 = *(_QWORD *)(v0 + v1);
      swift_bridgeObjectRetain();
      v5 = swift_retain();
      sub_2445DCF9C(v5, v4);
      swift_bridgeObjectRelease();
      swift_release();
    }
    else
    {
      sub_2445E6E90();
      __break(1u);
    }
  }
}

void sub_2445DBA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  sub_2445E6B6C();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  type metadata accessor for UDFContext.StoreState(0);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v6 - v2;
  v4 = v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_storeState;
  swift_beginAccess();
  sub_2445DB21C(v4, (uint64_t)v3);
  v5 = (char *)sub_2445DBB58 + 4 * byte_2445E8414[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2445DBB58()
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

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v2, v5, v7);
  v8 = sub_2445E6AC4();
  if (!v0)
  {
    v1 = v8;
    *v3 = v8;
    v3[1] = v9;
    swift_storeEnumTagMultiPayload();
    swift_beginAccess();
    swift_unknownObjectRetain();
    sub_2445DB260((uint64_t)v3, v6);
    swift_endAccess();
  }
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v7);
  return v1;
}

_QWORD *sub_2445DBCAC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (_QWORD *)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  if (*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge))
  {
    v0 = *(_QWORD **)((char *)v0 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext_bridge);
  }
  else
  {
    sub_2445DBA54();
    if (v1)
      return v0;
    v6 = v3;
    v7 = v4;
    type metadata accessor for MessageInBlobBridge();
    v0 = (_QWORD *)swift_allocObject();
    v8 = MEMORY[0x24BEE4AF8];
    v0[2] = MEMORY[0x24BEE4AF8];
    v0[3] = sub_2445D3B08(v8);
    v0[4] = v6;
    v0[5] = v7;
    *v2 = v0;
    v2[1] = &off_251532E80;
    swift_retain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v0;
}

_QWORD *sub_2445DBD78()
{
  return sub_2445DBCAC();
}

void sub_2445DBD8C()
{
  sub_2445DBA54();
}

uint64_t sub_2445DBDA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_2445DA23C(a1, a2, a3);
}

uint64_t sub_2445DBDC4(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

double sub_2445DBDE4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  v8 = sub_2445DFDB0(a1, a2);
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
      sub_2445E09BC();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_2445D2610((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_2445DBEDC(v8, v11);
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

unint64_t sub_2445DBEDC(unint64_t result, uint64_t a2)
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
    result = sub_2445E6E54();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2445E6F20();
        swift_bridgeObjectRetain();
        sub_2445E6DF4();
        v11 = sub_2445E6F38();
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

uint64_t sub_2445DC0C4(uint64_t a1, void (*a2)(uint64_t, uint64_t, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  _QWORD v18[2];
  _BYTE v19[40];
  uint64_t v20;

  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v15 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v15 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v15);
    ++v9;
    if (!v16)
    {
      v9 = v15 + 1;
      if (v15 + 1 >= v7)
        return swift_release();
      v16 = *(_QWORD *)(v20 + 8 * v9);
      if (!v16)
      {
        v9 = v15 + 2;
        if (v15 + 2 >= v7)
          return swift_release();
        v16 = *(_QWORD *)(v20 + 8 * v9);
        if (!v16)
        {
          v9 = v15 + 3;
          if (v15 + 3 >= v7)
            return swift_release();
          v16 = *(_QWORD *)(v20 + 8 * v9);
          if (!v16)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v16 - 1) & v16;
    v11 = __clz(__rbit64(v16)) + (v9 << 6);
LABEL_5:
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
    v13 = *v12;
    v14 = v12[1];
    sub_2445D1B00(*(_QWORD *)(a1 + 56) + 40 * v11, (uint64_t)v19);
    v18[0] = v13;
    v18[1] = v14;
    swift_bridgeObjectRetain();
    a2(v13, v14, v19);
    result = sub_2445D432C((uint64_t)v18, &qword_257374788);
  }
  v17 = v15 + 4;
  if (v17 >= v7)
    return swift_release();
  v16 = *(_QWORD *)(v20 + 8 * v17);
  if (v16)
  {
    v9 = v17;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v16 = *(_QWORD *)(v20 + 8 * v9);
    ++v17;
    if (v16)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2445DC28C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return sub_2445DABD0(a1, a2, a3);
}

uint64_t sub_2445DC2A4(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, _UNKNOWN **, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257374148);
  result = sub_2445E6E9C();
  v3 = (_QWORD *)result;
  v4 = 0;
  v30 = a1;
  v5 = *(_QWORD *)(a1 + 64);
  v27 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v28 = (unint64_t)(v6 + 63) >> 6;
  v29 = result + 64;
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v9 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v9 | (v4 << 6); ; i = __clz(__rbit64(v12)) + (v4 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(v30 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    v17 = (uint64_t *)(*(_QWORD *)(v30 + 56) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    v20 = *(uint64_t (**)(uint64_t, _UNKNOWN **, uint64_t, uint64_t))(v19 + 24);
    swift_bridgeObjectRetain();
    v21 = swift_retain();
    result = v20(v21, &off_251532A28, v18, v19);
    *(_QWORD *)(v29 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v22 = (_QWORD *)(v3[6] + 16 * i);
    *v22 = v15;
    v22[1] = v16;
    v23 = (uint64_t *)(v3[7] + 16 * i);
    *v23 = result;
    v23[1] = v19;
    v24 = v3[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v26;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v11 >= v28)
      return (uint64_t)v3;
    v12 = *(_QWORD *)(v27 + 8 * v11);
    ++v4;
    if (!v12)
    {
      v4 = v11 + 1;
      if (v11 + 1 >= v28)
        return (uint64_t)v3;
      v12 = *(_QWORD *)(v27 + 8 * v4);
      if (!v12)
      {
        v4 = v11 + 2;
        if (v11 + 2 >= v28)
          return (uint64_t)v3;
        v12 = *(_QWORD *)(v27 + 8 * v4);
        if (!v12)
          break;
      }
    }
LABEL_18:
    v8 = (v12 - 1) & v12;
  }
  v13 = v11 + 3;
  if (v13 >= v28)
    return (uint64_t)v3;
  v12 = *(_QWORD *)(v27 + 8 * v13);
  if (v12)
  {
    v4 = v13;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v4 >= v28)
      return (uint64_t)v3;
    v12 = *(_QWORD *)(v27 + 8 * v4);
    ++v13;
    if (v12)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_2445DC4C4(uint64_t a1, void (*a2)(_QWORD, _QWORD, _OWORD *))
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
    sub_2445D1B00(*(_QWORD *)(a1 + 56) + 40 * v10, (uint64_t)v24);
    *(_QWORD *)&v23 = v13;
    *((_QWORD *)&v23 + 1) = v12;
    v20 = v23;
    v21[0] = v24[0];
    v21[1] = v24[1];
    v22 = v25;
    v14 = v23;
    swift_bridgeObjectRetain();
    v26(v14, *((_QWORD *)&v14 + 1), v21);
    result = sub_2445D432C((uint64_t)&v20, &qword_257374788);
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

uint64_t sub_2445DC6E0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;

  return sub_2445DAD78(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_2445DC6F8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for UDFContext.StoreState(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2445DC738(_QWORD *a1, _QWORD *a2)
{
  *(_QWORD *)(*a2 + OBJC_IVAR____TtC10PoirotUDFs10UDFContext__database) = *a1;
  swift_retain();
  return swift_release();
}

uint64_t sub_2445DC770()
{
  return type metadata accessor for UDFContext(0);
}

uint64_t sub_2445DC778()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for UDFContext.StoreState(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for UDFContext()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UDFContext.database.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of UDFContext.database.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of UDFContext.database.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of static UDFContext.makeUDFContext(withSQLiteConnection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 320))();
}

uint64_t dispatch thunk of UDFContext.register(schema:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of UDFContext.register(streamTables:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of UDFContext.unregister(withSQLiteConnection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of UDFContext.__allocating_init(databaseConnection:ownsConnection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 360))();
}

uint64_t dispatch thunk of UDFContext.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 368))();
}

uint64_t dispatch thunk of UDFContext.ensureFunctions()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of UDFContext.getSchemaStore()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t *sub_2445DC934(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      swift_unknownObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v8 = sub_2445E6B6C();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2445DCA10(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
    return swift_unknownObjectRelease();
  if (!(_DWORD)result)
  {
    v3 = sub_2445E6B6C();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

_OWORD *sub_2445DCA70(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 1)
  {
    *a1 = *a2;
    swift_unknownObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload)
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v7 = sub_2445E6B6C();
    (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_2445DCB24(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;

  if (a1 != a2)
  {
    sub_2445DC6F8((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 1)
    {
      *a1 = *a2;
      swift_unknownObjectRetain();
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload)
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v7 = sub_2445E6B6C();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

void *sub_2445DCBE8(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload())
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v6 = sub_2445E6B6C();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

void *sub_2445DCC70(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_2445DC6F8((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload())
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
    else
    {
      v6 = sub_2445E6B6C();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
  }
  return a1;
}

uint64_t sub_2445DCD08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2445DCD14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2445DCD24()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2445DCD34()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2445E6B6C();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_2445DCDA0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257374780;
  if (!qword_257374780)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2573742D0);
    result = MEMORY[0x24951397C](&unk_2445E86B8, v1);
    atomic_store(result, (unint64_t *)&qword_257374780);
  }
  return result;
}

uint64_t sub_2445DCDEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_2445DB790(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_2445DCDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;

  v18 = a2 + 64;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_17;
    }
    if (__OFADD__(v9++, 1))
    {
      __break(1u);
      goto LABEL_24;
    }
    if (v9 >= v7)
      return swift_release();
    v13 = *(_QWORD *)(v18 + 8 * v9);
    if (!v13)
      break;
LABEL_16:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_17:
    v15 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v11 + 8);
    ObjectType = swift_getObjectType();
    v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
    swift_unknownObjectRetain();
    v17(a1, ObjectType, v15);
    result = swift_unknownObjectRelease();
  }
  v14 = v9 + 1;
  if (v9 + 1 >= v7)
    return swift_release();
  v13 = *(_QWORD *)(v18 + 8 * v14);
  if (v13)
    goto LABEL_15;
  v14 = v9 + 2;
  if (v9 + 2 >= v7)
    return swift_release();
  v13 = *(_QWORD *)(v18 + 8 * v14);
  if (v13)
    goto LABEL_15;
  v14 = v9 + 3;
  if (v9 + 3 >= v7)
    return swift_release();
  v13 = *(_QWORD *)(v18 + 8 * v14);
  if (v13)
  {
LABEL_15:
    v9 = v14;
    goto LABEL_16;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      return swift_release();
    v13 = *(_QWORD *)(v18 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_2445DCF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  uint64_t v10;
  int64_t v11;
  int64_t v12;

  v3 = a2 + 64;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 64);
  v12 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  for (v6 &= v6 - 1; ; v6 = (v10 - 1) & v10)
  {
    swift_unknownObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_2445E69C8();
    if (v2)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return swift_unknownObjectRelease_n();
    }
    swift_bridgeObjectRelease();
    result = swift_unknownObjectRelease_n();
    if (v6)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v8++, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v8 >= v12)
      return swift_release();
    v10 = *(_QWORD *)(v3 + 8 * v8);
    if (!v10)
      break;
LABEL_15:
    ;
  }
  v11 = v8 + 1;
  if (v8 + 1 >= v12)
    return swift_release();
  v10 = *(_QWORD *)(v3 + 8 * v11);
  if (v10)
    goto LABEL_14;
  v11 = v8 + 2;
  if (v8 + 2 >= v12)
    return swift_release();
  v10 = *(_QWORD *)(v3 + 8 * v11);
  if (v10)
    goto LABEL_14;
  v11 = v8 + 3;
  if (v8 + 3 >= v12)
    return swift_release();
  v10 = *(_QWORD *)(v3 + 8 * v11);
  if (v10)
  {
LABEL_14:
    v8 = v11;
    goto LABEL_15;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v12)
      return swift_release();
    v10 = *(_QWORD *)(v3 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_15;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for BasePoirotScalarUDF()
{
  uint64_t result;

  result = qword_257374798;
  if (!qword_257374798)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445DD1B8()
{
  return swift_initClassMetadata2();
}

void sub_2445DD200()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2445DD22C()
{
  return 2049;
}

void sub_2445DD234(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;

  v5 = (void *)MEMORY[0x2495137E4]();
  v6 = v2 + qword_257374790;
  if (MEMORY[0x249513A54](v2 + qword_257374790))
  {
    v7 = *(_QWORD *)(v6 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 32))(v2, a1, a2, ObjectType, v7);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v9 = 0xD000000000000012;
    *(_QWORD *)(v9 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v9 + 16) = 1;
    swift_willThrow();
  }
  objc_autoreleasePoolPop(v5);
}

uint64_t sub_2445DD328(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)(swift_allocObject() + qword_257374790 + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  v3 = sub_2445E6A70();
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_2445DD39C()
{
  uint64_t v0;

  return sub_2445D1A80(v0 + qword_257374790);
}

uint64_t sub_2445DD3AC()
{
  uint64_t v0;

  v0 = sub_2445E6A7C();
  sub_2445D1A80(v0 + qword_257374790);
  return swift_deallocClassInstance();
}

uint64_t sub_2445DD3E8()
{
  return type metadata accessor for BasePoirotScalarUDF();
}

uint64_t sub_2445DD3F0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(qword_257375098 + v0 + 32))();
}

uint64_t sub_2445DD404()
{
  return sub_2445E6A64();
}

PoirotUDFs::Column __swiftcall Column.init(name:type:hidden:)(Swift::String name, PoirotUDFs::ColumnType type, Swift::Bool hidden)
{
  uint64_t v3;
  char v4;
  PoirotUDFs::Column result;

  v4 = *(_BYTE *)type;
  *(Swift::String *)v3 = name;
  *(_BYTE *)(v3 + 16) = v4;
  *(_BYTE *)(v3 + 17) = hidden;
  result.name = name;
  result.type = type;
  return result;
}

uint64_t ColumnType.hash(into:)()
{
  return sub_2445E6F2C();
}

BOOL static ColumnType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ColumnType.hashValue.getter()
{
  sub_2445E6F20();
  sub_2445E6F2C();
  return sub_2445E6F38();
}

uint64_t sub_2445DD4AC()
{
  sub_2445E6F20();
  sub_2445E6F2C();
  return sub_2445E6F38();
}

uint64_t sub_2445DD4F0()
{
  return sub_2445E6F2C();
}

uint64_t sub_2445DD518()
{
  sub_2445E6F20();
  sub_2445E6F2C();
  return sub_2445E6F38();
}

BOOL sub_2445DD558(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Column.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void Column.type.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t Column.hidden.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t _s10PoirotUDFs6ColumnV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  char v7;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 16);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = *(unsigned __int8 *)(a2 + 16);
  v5 = *(unsigned __int8 *)(a2 + 17);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    if (v2 != v4)
      return 0;
    return v3 ^ v5 ^ 1u;
  }
  v7 = sub_2445E6ECC();
  result = 0;
  if ((v7 & 1) != 0 && v2 == v4)
    return v3 ^ v5 ^ 1u;
  return result;
}

unint64_t sub_2445DD640()
{
  unint64_t result;

  result = qword_2573747E8[0];
  if (!qword_2573747E8[0])
  {
    result = MEMORY[0x24951397C](&protocol conformance descriptor for ColumnType, &type metadata for ColumnType);
    atomic_store(result, qword_2573747E8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ColumnType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ColumnType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2445DD760 + 4 * byte_2445E8545[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_2445DD794 + 4 * byte_2445E8540[v4]))();
}

uint64_t sub_2445DD794(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445DD79C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2445DD7A4);
  return result;
}

uint64_t sub_2445DD7B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2445DD7B8);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_2445DD7BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445DD7C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ColumnType()
{
  return &type metadata for ColumnType;
}

uint64_t sub_2445DD7E4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Column(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Column(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for Column(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 18))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Column(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 18) = 1;
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
    *(_BYTE *)(result + 18) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Column()
{
  return &type metadata for Column;
}

uint64_t dispatch thunk of StreamSchemaProviding.schemaManifest.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamSchemaProviding.columns.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamSchemaProviding.configure(withSchemaStore:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of StreamSchemaProviding.getValue(forColumn:streamElement:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_2445DD9A8()
{
  return swift_initClassMetadata2();
}

void sub_2445DD9F4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2445DDA20()
{
  _QWORD *v0;

  return sub_2445D1A80((uint64_t)v0 + *(_QWORD *)(qword_2573750A8 + *v0 + 16));
}

uint64_t sub_2445DDA3C()
{
  _QWORD *v0;

  v0 = (_QWORD *)sub_2445E6A58();
  sub_2445D1A80((uint64_t)v0 + *(_QWORD *)(qword_2573750A8 + *v0 + 16));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BasePoirotTableUDF(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BasePoirotTableUDF);
}

uint64_t sub_2445DDA90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = sub_2445DDBD0(a1, a2, a3, a4);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_2445DDAC0()
{
  return sub_2445E683C();
}

uint64_t sub_2445DDAE4(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24951397C](MEMORY[0x24BE743E0]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2445DDB10(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_2445E6848();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)((char *)v2 + *(_QWORD *)(qword_2573750A8 + *v2 + 16) + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE741E0], v4);
  return sub_2445E6A4C();
}

uint64_t sub_2445DDBD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for BasePoirotTableUDF(0, *(_QWORD *)(v4 + qword_2573750A8), *(_QWORD *)(v4 + qword_2573750A8 + 8), a4);
  swift_allocObject();
  return sub_2445DDB10(a1, a2);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x249513940](a1, v6, a5);
}

uint64_t sub_2445DDC58(uint64_t a1)
{
  _QWORD *v1;
  __int128 v3;
  uint64_t v4;
  _QWORD v5[4];

  sub_2445DDD20(a1, (uint64_t)&v3);
  if (v4)
  {
    sub_2445D2610(&v3, (uint64_t)v5);
    v1 = __swift_project_boxed_opaque_existential_1(v5, v5[3]);
    MEMORY[0x24BDAC7A8](v1);
    sub_2445E6C2C();
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  }
  else
  {
    sub_2445DDD68((uint64_t)&v3);
    return sub_2445E689C();
  }
}

uint64_t sub_2445DDD20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445DDD68(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374870);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2445DDDA8(const void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  sqlite3_context *v10;
  void (__cdecl *v11)(void *);
  uint64_t v12;

  v4 = sub_2445E67E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2445E6878();
  if (a1)
    v9 = a2 - (_QWORD)a1;
  else
    v9 = 0;
  if (v9 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v9 <= 0x7FFFFFFF)
  {
    v10 = (sqlite3_context *)v8;
    sub_2445E67DC();
    v11 = (void (__cdecl *)(void *))sub_2445E67C4();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    sqlite3_result_blob(v10, a1, v9, v11);
    return;
  }
  __break(1u);
}

void sub_2445DDE94(const void *a1, uint64_t a2)
{
  sub_2445DDDA8(a1, a2);
}

uint64_t type metadata accessor for PObjFunction()
{
  uint64_t result;

  result = qword_257374878;
  if (!qword_257374878)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445DDEE8()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445DDF24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD v30[2];
  char v31;
  _QWORD v32[5];
  uint64_t *v33;

  v4 = v2;
  v7 = sub_2445E6998();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a2 + 16);
  if (!v12)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  v13 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if ((sub_2445E6950() & 1) != 0)
    return sub_2445E689C();
  v14 = v4 + qword_257374790;
  if (MEMORY[0x249513A54](v14))
  {
    v15 = *(_QWORD *)(v14 + 8);
    ObjectType = swift_getObjectType();
    v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(ObjectType, v15);
    result = swift_unknownObjectRelease();
    if (!v3)
    {
      v33 = (uint64_t *)v17;
      v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
      MEMORY[0x24BDAC7A8](v18);
      v30[-2] = v11;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2573741B0);
      sub_2445E6920();
      if ((v31 & 1) != 0)
      {
        sub_2445D4D10();
        swift_allocError();
        *(_QWORD *)(v19 + 8) = 0;
        *(_QWORD *)(v19 + 16) = 0;
        *(_QWORD *)v19 = 6;
        *(_BYTE *)(v19 + 24) = 5;
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        return swift_unknownObjectRelease();
      }
      v21 = v30[0];
      v22 = v30[1];
      result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      v32[3] = MEMORY[0x24BEE0F88];
      v32[4] = MEMORY[0x24BE749C0];
      v32[0] = v21;
      v32[1] = v22;
      if (v12 >= 2)
      {
        v23 = sub_2445E692C();
        v24 = v33;
        v25 = v23;
        v27 = v26;
        v28 = MEMORY[0x24BEE0F88];
        v29 = __swift_project_boxed_opaque_existential_1(v32, MEMORY[0x24BEE0F88]);
        sub_2445DF534((uint64_t)v29, v25, v27, a1, v24, v28, MEMORY[0x24BE749C0]);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      }
      goto LABEL_13;
    }
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v20 = 0xD000000000000012;
    *(_QWORD *)(v20 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v20 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2445DE1FC()
{
  return type metadata accessor for PObjFunction();
}

uint64_t sub_2445DE208(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for UDFError(uint64_t a1)
{
  return sub_2445DE230(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_2445DE230(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 3u)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s10PoirotUDFs8UDFErrorOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned __int8 v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_2445DE208(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for UDFError(uint64_t a1, uint64_t a2)
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
  sub_2445DE208(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_2445DE230(v6, v7, v8);
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

uint64_t assignWithTake for UDFError(uint64_t a1, uint64_t a2)
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
  sub_2445DE230(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for UDFError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for UDFError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_2445DE3C8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_2445DE3D0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UDFError()
{
  return &type metadata for UDFError;
}

uint64_t sub_2445DE3E8@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (result)
  {
    *(_QWORD *)a3 = result;
    *(_QWORD *)(a3 + 8) = result + a2;
  }
  else
  {
    result = sub_2445E6950();
    if ((result & 1) != 0)
    {
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      *(_BYTE *)(a3 + 16) = 1;
      return result;
    }
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
  }
  *(_BYTE *)(a3 + 16) = 0;
  return result;
}

uint64_t sub_2445DE448(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _QWORD v23[4];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v7 = sub_2445E6B24();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742B8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v23 - v15;
  v25 = a1;
  v26 = a2;
  v27 = 64;
  v28 = 0xE100000000000000;
  sub_2445DE794();
  if ((sub_2445E6E48() & 1) != 0)
    return sub_2445E68A8();
  v23[0] = v7;
  v24 = a3;
  v18 = v3[5];
  v23[1] = v3 + 2;
  __swift_project_boxed_opaque_existential_1(v3 + 2, v18);
  v23[2] = a1;
  v23[3] = a2;
  sub_2445E6D1C();
  v19 = *v3;
  sub_2445DE7D8((uint64_t)v16, (uint64_t)v14);
  v20 = v23[0];
  v21 = (*(uint64_t (**)(char *, uint64_t, _QWORD))(v8 + 48))(v14, 1, v23[0]);
  v22 = v24;
  if (v21 == 1)
  {
    sub_2445D432C((uint64_t)v14, &qword_2573742B8);
    sub_2445E689C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v14, v20);
    sub_2445DE820(v22, v19);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v20);
  }
  return sub_2445D432C((uint64_t)v16, &qword_2573742B8);
}

unint64_t sub_2445DE794()
{
  unint64_t result;

  result = qword_2573748C8;
  if (!qword_2573748C8)
  {
    result = MEMORY[0x24951397C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2573748C8);
  }
  return result;
}

uint64_t sub_2445DE7D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445DE820(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
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
  __int128 *v15;
  int v16;
  uint64_t result;
  uint64_t v18;
  const void *v19;
  const void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  _QWORD v32[3];
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v30 = a2;
  v5 = sub_2445E67E8();
  v28 = *(_QWORD *)(v5 - 8);
  v29 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2445E6B3C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2445E6B24();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (__int128 *)((char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(__int128 *, uint64_t, uint64_t))(v13 + 16))(v15, v3, v12);
  v16 = (*(uint64_t (**)(__int128 *, uint64_t))(v13 + 88))(v15, v12);
  if (v16 == *MEMORY[0x24BE74580])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E68CC();
  }
  else if (v16 == *MEMORY[0x24BE745A0])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E6908();
  }
  else if (v16 == *MEMORY[0x24BE74588])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E68D8();
  }
  else if (v16 == *MEMORY[0x24BE745A8])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E6914();
  }
  else if (v16 == *MEMORY[0x24BE74578])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E68C0();
  }
  else if (v16 == *MEMORY[0x24BE74590])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E68F0();
  }
  else if (v16 == *MEMORY[0x24BE74560])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    return sub_2445E6884();
  }
  else if (v16 == *MEMORY[0x24BE74568])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    (*(void (**)(char *, __int128 *, uint64_t))(v9 + 32))(v11, v15, v8);
    v18 = v34;
    sub_2445E6B30();
    if (v18)
    {
      MEMORY[0x24951391C](v18);
      sub_2445E689C();
    }
    else
    {
      sub_2445E68FC();
      swift_bridgeObjectRelease();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else if (v16 == *MEMORY[0x24BE74598])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    sub_2445E68FC();
    return swift_bridgeObjectRelease();
  }
  else if (v16 == *MEMORY[0x24BE74570])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    sub_2445D2610(v15, (uint64_t)v32);
    sub_2445D1B00((uint64_t)v32, (uint64_t)v31);
    sub_2445DDC58((uint64_t)v31);
    sub_2445D432C((uint64_t)v31, &qword_257374870);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else if (v16 == *MEMORY[0x24BE745B0])
  {
    (*(void (**)(__int128 *, uint64_t))(v13 + 96))(v15, v12);
    sub_2445D2610(v15, (uint64_t)v32);
    if (v30)
    {
      __swift_project_boxed_opaque_existential_1(v32, v33);
      swift_unknownObjectRetain();
      v19 = (const void *)sub_2445E6CF8();
      v21 = v20;
      __swift_project_boxed_opaque_existential_1(v32, v33);
      sub_2445E6D04();
      __swift_project_boxed_opaque_existential_1(v31, v31[3]);
      v22 = sub_2445E6BE4();
      sub_2445DED9C(v19, v21, v22, v23, a1);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
      swift_unknownObjectRelease();
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(v32, v33);
      v24 = sub_2445E6D10();
      v26 = v25;
      sub_2445E67DC();
      sub_2445E6890();
      sub_2445D1B9C(v24, v26);
      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v29);
    }
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t (*sub_2445DED9C(const void *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5))(_QWORD)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t (*result)(_QWORD);
  int64_t v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  _BYTE *v21;
  int v22;
  _QWORD v23[3];
  const void *v24[5];

  v10 = sub_2445E67E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = (const void *)MEMORY[0x24BEE0F88];
  v24[4] = (const void *)MEMORY[0x24BE749C0];
  v24[0] = a1;
  v24[1] = a2;
  result = (uint64_t (*)(_QWORD))__swift_project_boxed_opaque_existential_1(v24, MEMORY[0x24BEE0F88]);
  v15 = (_BYTE *)a2 - (_BYTE *)a1;
  if (!a1)
    v15 = 0;
  v16 = v15 + 4;
  if (__OFADD__(v15, 4))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = result;
  result = (uint64_t (*)(_QWORD))sub_2445E67F4();
  if (v16 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_15:
    __break(1u);
    return result;
  }
  v23[0] = a5;
  v18 = (char *)result(v16);
  swift_release();
  if (v18)
  {
    if (*v17)
      v19 = v17[1] - *v17;
    else
      v19 = 0;
    v22 = sub_2445DFA9C(a3, a4);
    memcpy(v18, v24[0], v19);
    *(_DWORD *)&v18[v19] = v22;
    sub_2445E67DC();
    sub_2445E68E4();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    sub_2445DEFE0();
    v20 = swift_allocError();
    *v21 = 3;
    swift_willThrow();
    v23[1] = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257373F98);
    sub_2445E68B4();
    MEMORY[0x24951391C](v20);
  }
  return (uint64_t (*)(_QWORD))__swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
}

unint64_t sub_2445DEFE0()
{
  unint64_t result;

  result = qword_2573748D0;
  if (!qword_2573748D0)
  {
    result = MEMORY[0x24951397C](&unk_2445E88B4, &type metadata for MessageSchemaRegistry.Error);
    atomic_store(result, (unint64_t *)&qword_2573748D0);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AttributedMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AttributedMessage(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 16;
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1(v1);
}

_OWORD *initializeWithCopy for AttributedMessage(_OWORD *a1, _OWORD *a2)
{
  _OWORD *v3;
  _OWORD *v4;
  __int128 v5;
  uint64_t v6;
  void (*v7)(_OWORD *, _OWORD *, uint64_t);

  *a1 = *a2;
  v3 = a1 + 1;
  v4 = a2 + 1;
  v5 = *(_OWORD *)((char *)a2 + 40);
  *(_OWORD *)((char *)a1 + 40) = v5;
  v6 = v5;
  v7 = **(void (***)(_OWORD *, _OWORD *, uint64_t))(v5 - 8);
  swift_unknownObjectRetain();
  v7(v3, v4, v6);
  return a1;
}

_QWORD *assignWithCopy for AttributedMessage(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = v4;
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

uint64_t assignWithTake for AttributedMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = v4;
  __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AttributedMessage(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AttributedMessage(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributedMessage()
{
  return &type metadata for AttributedMessage;
}

uint64_t sub_2445DF3BC@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  __int128 v8;
  _QWORD v9[4];

  if (result)
  {
    if (__OFSUB__(a2, 4))
    {
      __break(1u);
    }
    else
    {
      result = sub_2445DFD08(*(_DWORD *)(result + a2 - 4), (uint64_t)v9);
      if (!v4)
      {
        __swift_project_boxed_opaque_existential_1(v9, v9[3]);
        sub_2445E6CBC();
        *a4 = a3;
        a4[1] = &off_251532E80;
        sub_2445D2610(&v8, (uint64_t)(a4 + 2));
        swift_retain();
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
      }
    }
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v7 = 0xD000000000000031;
    *(_QWORD *)(v7 + 8) = 0x80000002445E79E0;
    *(_BYTE *)(v7 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2445DF4E0()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessageInBlobBridge()
{
  return objc_opt_self();
}

uint64_t (*sub_2445DF534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7))(uint64_t)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t *boxed_opaque_existential_1;
  uint64_t (*result)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32[3];
  uint64_t v33;
  uint64_t v34;

  v27 = a3;
  v28 = a5;
  v26 = a2;
  v11 = sub_2445E67E8();
  v24 = *(_QWORD *)(v11 - 8);
  v25 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = a6;
  v34 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v32);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(boxed_opaque_existential_1, a1, a6);
  __swift_project_boxed_opaque_existential_1(v32, v33);
  result = (uint64_t (*)(uint64_t))sub_2445E6C38();
  v16 = (uint64_t)result + 4;
  if (__OFADD__(result, 4))
  {
    __break(1u);
    goto LABEL_9;
  }
  result = (uint64_t (*)(uint64_t))sub_2445E67F4();
  if (v16 < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v16 > 0x7FFFFFFF)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  v29 = a4;
  v17 = result(v16);
  swift_release();
  if (v17)
  {
    v31 = v17;
    v18 = sub_2445E6C38();
    v19 = sub_2445DFA9C(v26, v27);
    v28 = &v24;
    v22 = MEMORY[0x24BDAC7A8](v19);
    *(&v24 - 2) = (uint64_t)&v31;
    *(&v24 - 1) = v18;
    v23 = v22;
    sub_2445E6C2C();
    *(_DWORD *)(v30 + v18) = v23;
    sub_2445E67DC();
    sub_2445E68E4();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v13, v25);
  }
  else
  {
    sub_2445DEFE0();
    v20 = swift_allocError();
    *v21 = 3;
    swift_willThrow();
    v31 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257373F98);
    sub_2445E68B4();
    MEMORY[0x24951391C](v20);
  }
  return (uint64_t (*)(uint64_t))__swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
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

void *sub_2445DF81C@<X0>(void *__src@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  void *v4;
  void *result;

  v4 = **(void ***)(v2 + 16);
  result = memcpy(v4, __src, *(_QWORD *)(v2 + 24));
  if (v4)
    *a2 = v4;
  else
    __break(1u);
  return result;
}

double StreamElement.timestamp.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

uint64_t StreamElement.data.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_2445D45A4(v1, *(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t StreamElement.init(timestamp:data:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  *(double *)a3 = a4;
  *(_QWORD *)(a3 + 8) = result;
  *(_QWORD *)(a3 + 16) = a2;
  return result;
}

uint64_t destroy for StreamElement(uint64_t a1)
{
  return sub_2445D1B9C(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

_QWORD *_s10PoirotUDFs13StreamElementVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  v4 = a2[2];
  sub_2445D45A4(v3, v4);
  a1[1] = v3;
  a1[2] = v4;
  return a1;
}

_QWORD *assignWithCopy for StreamElement(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a2[2];
  sub_2445D45A4(v3, v4);
  v5 = a1[1];
  v6 = a1[2];
  a1[1] = v3;
  a1[2] = v4;
  sub_2445D1B9C(v5, v6);
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

_QWORD *assignWithTake for StreamElement(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  *a1 = *(_QWORD *)a2;
  v3 = a1[1];
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_2445D1B9C(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamElement(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StreamElement(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for StreamElement()
{
  return &type metadata for StreamElement;
}

uint64_t dispatch thunk of StreamEnumerating.currentElement.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of StreamEnumerating.setTimeRange(_:reversed:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of StreamEnumerating.startEnumeration()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of StreamEnumerating.advance()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of StreamEnumerating.hasEvent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

unint64_t sub_2445DFA9C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  __int128 v18[2];
  _BYTE v19[40];
  uint64_t v20;

  v5 = v2;
  swift_beginAccess();
  v8 = (_QWORD *)v2[3];
  if (v8[2])
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = sub_2445DFDB0(a1, a2);
    if ((v10 & 1) != 0)
    {
      v4 = *(_QWORD *)(v8[7] + 8 * v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v4 & 0x8000000000000000) != 0)
      {
        __break(1u);
        goto LABEL_16;
      }
      if (!HIDWORD(v4))
        return v4;
      __break(1u);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v11 = *(_QWORD *)(v5[2] + 16);
  if (v11 > 0x7FFFFFFE)
  {
    sub_2445DEFE0();
    swift_allocError();
    *v16 = 0;
    swift_willThrow();
    return v4;
  }
  v4 = v5[5];
  swift_getObjectType();
  swift_unknownObjectRetain();
  sub_2445E6C8C();
  swift_unknownObjectRelease();
  if (!v3)
  {
    v4 = v11 + 1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = v5[3];
    v5[3] = 0x8000000000000000;
    sub_2445E0520(v11 + 1, a1, a2, isUniquelyReferenced_nonNull_native);
    v5[3] = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_2445D1B00((uint64_t)v19, (uint64_t)v18);
    v8 = (_QWORD *)v5[2];
    v13 = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v8;
    if ((v13 & 1) != 0)
    {
LABEL_10:
      v15 = v8[2];
      v14 = v8[3];
      if (v15 >= v14 >> 1)
      {
        v8 = sub_2445E3A34((_QWORD *)(v14 > 1), v15 + 1, 1, v8);
        v5[2] = v8;
      }
      v8[2] = v15 + 1;
      sub_2445D2610(v18, (uint64_t)&v8[5 * v15 + 4]);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
      return v4;
    }
LABEL_16:
    v8 = sub_2445E3A34(0, v8[2] + 1, 1, v8);
    v5[2] = v8;
    goto LABEL_10;
  }
  return v4;
}

uint64_t sub_2445DFD08@<X0>(unsigned int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char *v5;

  if (!a1)
  {
    v4 = 2;
    goto LABEL_5;
  }
  v3 = *(_QWORD *)(v2 + 16);
  if (*(_QWORD *)(v3 + 16) < (unint64_t)a1)
  {
    v4 = 1;
LABEL_5:
    sub_2445DEFE0();
    swift_allocError();
    *v5 = v4;
    return swift_willThrow();
  }
  return sub_2445D1B00(v3 + 40 * (a1 - 1) + 32, a2);
}

uint64_t type metadata accessor for MessageSchemaRegistry()
{
  return objc_opt_self();
}

unint64_t sub_2445DFDB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2445E6F20();
  sub_2445E6DF4();
  v4 = sub_2445E6F38();
  return sub_2445DFE14(a1, a2, v4);
}

unint64_t sub_2445DFE14(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2445E6ECC() & 1) == 0)
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
      while (!v14 && (sub_2445E6ECC() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2445DFEF4(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374150);
  v37 = a2;
  v6 = sub_2445E6EA8();
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
    sub_2445E6F20();
    sub_2445E6DF4();
    result = sub_2445E6F38();
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

uint64_t sub_2445E01FC(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374138);
  v37 = a2;
  v6 = sub_2445E6EA8();
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
      sub_2445D2610(v25, (uint64_t)v38);
    }
    else
    {
      sub_2445D1B00((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_2445E6F20();
    sub_2445E6DF4();
    result = sub_2445E6F38();
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
    result = sub_2445D2610(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
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

uint64_t sub_2445E0520(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2445DFDB0(a2, a3);
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
    result = (uint64_t)sub_2445E0810();
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
  sub_2445DFEF4(result, a4 & 1);
  result = sub_2445DFDB0(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2445E6EE4();
  __break(1u);
  return result;
}

uint64_t sub_2445E0670(__int128 *a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_2445DFDB0(a2, a3);
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
        return sub_2445D2610(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_2445E09BC();
      goto LABEL_7;
    }
    sub_2445E01FC(v15, a4 & 1);
    v21 = sub_2445DFDB0(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_2445E07A4(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_2445E6EE4();
  __break(1u);
  return result;
}

uint64_t sub_2445E07A4(unint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, _QWORD *a5)
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
  result = sub_2445D2610(a4, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_2445E0810()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374150);
  v2 = *v0;
  v3 = sub_2445E6E9C();
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

void *sub_2445E09BC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374138);
  v2 = *v0;
  v3 = sub_2445E6E9C();
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
    sub_2445D1B00(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_2445D2610(v26, *(_QWORD *)(v4 + 56) + v20);
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

uint64_t getEnumTagSinglePayload for MessageSchemaRegistry.Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageSchemaRegistry.Error(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2445E0C80 + 4 * byte_2445E8805[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2445E0CB4 + 4 * asc_2445E8800[v4]))();
}

uint64_t sub_2445E0CB4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445E0CBC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2445E0CC4);
  return result;
}

uint64_t sub_2445E0CD0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2445E0CD8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2445E0CDC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445E0CE4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessageSchemaRegistry.Error()
{
  return &type metadata for MessageSchemaRegistry.Error;
}

unint64_t sub_2445E0D04()
{
  unint64_t result;

  result = qword_257374B38;
  if (!qword_257374B38)
  {
    result = MEMORY[0x24951397C](&unk_2445E888C, &type metadata for MessageSchemaRegistry.Error);
    atomic_store(result, (unint64_t *)&qword_257374B38);
  }
  return result;
}

uint64_t type metadata accessor for PMessageNameFunction()
{
  uint64_t result;

  result = qword_257374B40;
  if (!qword_257374B40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445E0D84()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E0DC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  _QWORD v16[2];
  uint64_t v17[2];
  _QWORD v18[4];

  v4 = v2;
  v6 = sub_2445E6998();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16))
  {
    v11 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    if ((sub_2445E6950() & 1) != 0)
    {
      return sub_2445E689C();
    }
    else
    {
      v12 = v4 + qword_257374790;
      if (MEMORY[0x249513A54](v12))
      {
        v13 = *(_QWORD *)(v12 + 8);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(ObjectType, v13);
        result = swift_unknownObjectRelease();
        if (!v3)
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
          sub_2445E6920();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
          swift_unknownObjectRelease();
          sub_2445D1B00((uint64_t)v17, (uint64_t)v18);
          sub_2445D1B44((uint64_t)v16);
          __swift_project_boxed_opaque_existential_1(v18, v18[3]);
          sub_2445E6D04();
          __swift_project_boxed_opaque_existential_1(v16, v17[1]);
          sub_2445E6BE4();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
          sub_2445E68FC();
          return swift_bridgeObjectRelease();
        }
      }
      else
      {
        sub_2445D1AA4();
        swift_allocError();
        *(_QWORD *)v15 = 0xD000000000000012;
        *(_QWORD *)(v15 + 8) = 0x80000002445E7270;
        *(_BYTE *)(v15 + 16) = 1;
        return swift_willThrow();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2445E1014()
{
  return type metadata accessor for PMessageNameFunction();
}

uint64_t type metadata accessor for PEnumFunction()
{
  uint64_t result;

  result = qword_257374B90;
  if (!qword_257374B90)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445E1058()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E1094(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;

  if (*(_QWORD *)(a2 + 16) < 2uLL)
  {
    __break(1u);
    goto LABEL_16;
  }
  v4 = v2;
  sub_2445E6998();
  result = sub_2445E692C();
  if (!v3)
  {
    v6 = v2 + qword_257374790;
    if (MEMORY[0x249513A54](v4 + qword_257374790))
    {
      v7 = *(_QWORD *)(v6 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v7 + 16))(ObjectType, v7);
      swift_unknownObjectRelease();
      swift_getObjectType();
      sub_2445E6C80();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      if ((sub_2445E695C() & 1) == 0)
      {
        if ((sub_2445E698C() & 1) != 0)
        {
          sub_2445E6974();
          __swift_project_boxed_opaque_existential_1(v11, v12);
          sub_2445E6C44();
          sub_2445E68FC();
          swift_bridgeObjectRelease();
        }
        return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      }
      sub_2445E692C();
      __swift_project_boxed_opaque_existential_1(v11, v12);
      v10 = sub_2445E6C50();
      result = swift_bridgeObjectRelease();
      if (v10 >= (uint64_t)0xFFFFFFFF80000000)
      {
        if (v10 <= 0x7FFFFFFF)
        {
          sub_2445E68CC();
          return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
        }
        goto LABEL_17;
      }
LABEL_16:
      __break(1u);
LABEL_17:
      __break(1u);
      return result;
    }
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v9 = 0xD000000000000012;
    *(_QWORD *)(v9 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v9 + 16) = 1;
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2445E1374()
{
  return type metadata accessor for PEnumFunction();
}

unint64_t sub_2445E1380()
{
  unint64_t result;

  result = qword_257374BE0;
  if (!qword_257374BE0)
  {
    result = MEMORY[0x24951397C](&unk_2445E89B8, &type metadata for StreamColumnSchema);
    atomic_store(result, (unint64_t *)&qword_257374BE0);
  }
  return result;
}

uint64_t sub_2445E13C4()
{
  sub_2445E1B88();
  return sub_2445E680C();
}

uint64_t sub_2445E1404()
{
  sub_2445E6F20();
  sub_2445E6DF4();
  return sub_2445E6F38();
}

uint64_t sub_2445E1458()
{
  return sub_2445E6DF4();
}

uint64_t sub_2445E1474()
{
  sub_2445E6F20();
  sub_2445E6DF4();
  return sub_2445E6F38();
}

uint64_t sub_2445E14C4@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2445E6EC0();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2445E1514(_QWORD *a1@<X8>)
{
  *a1 = 0x6D617473656D6974;
  a1[1] = 0xE900000000000070;
}

void sub_2445E1534(_QWORD *a1@<X8>)
{
  *a1 = &unk_251532428;
}

uint64_t sub_2445E1544()
{
  return MEMORY[0x24BEE13C8];
}

uint64_t sub_2445E1558()
{
  sub_2445E176C();
  sub_2445E17B0();
  return sub_2445E6AAC();
}

uint64_t sub_2445E1594()
{
  sub_2445E1B88();
  return sub_2445E6800();
}

uint64_t sub_2445E15C8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
    return *(_BYTE *)(v0 + 32) & 1;
  else
    return 0;
}

unint64_t sub_2445E15E8()
{
  unint64_t result;

  result = qword_257374BE8;
  if (!qword_257374BE8)
  {
    result = MEMORY[0x24951397C](&unk_2445E8A28, &type metadata for StreamColumnSchema);
    atomic_store(result, (unint64_t *)&qword_257374BE8);
  }
  return result;
}

unint64_t sub_2445E1630()
{
  unint64_t result;

  result = qword_257374BF0;
  if (!qword_257374BF0)
  {
    result = MEMORY[0x24951397C](&unk_2445E8A00, &type metadata for StreamColumnSchema);
    atomic_store(result, (unint64_t *)&qword_257374BF0);
  }
  return result;
}

uint64_t sub_2445E1674()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8))
    return *(_QWORD *)(v0 + 16);
  else
    return MEMORY[0x24BEE13C8];
}

uint64_t sub_2445E1698()
{
  uint64_t *v0;
  uint64_t v1;

  if (v0[1])
  {
    v1 = *v0;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_2445E176C();
    sub_2445E17B0();
    return sub_2445E6AAC();
  }
  return v1;
}

uint64_t sub_2445E16F8()
{
  sub_2445E1380();
  return sub_2445E680C();
}

uint64_t sub_2445E1738()
{
  sub_2445E1380();
  return sub_2445E6800();
}

unint64_t sub_2445E176C()
{
  unint64_t result;

  result = qword_257374BF8;
  if (!qword_257374BF8)
  {
    result = MEMORY[0x24951397C](&unk_2445E8C3C, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374BF8);
  }
  return result;
}

unint64_t sub_2445E17B0()
{
  unint64_t result;

  result = qword_257374C00;
  if (!qword_257374C00)
  {
    result = MEMORY[0x24951397C](&unk_2445E8C04, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374C00);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StandardStreamColumn(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StandardStreamColumn(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2445E1888 + 4 * byte_2445E8960[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2445E18A8 + 4 * byte_2445E8965[v4]))();
}

_BYTE *sub_2445E1888(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2445E18A8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2445E18B0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2445E18B8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2445E18C0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2445E18C8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StandardStreamColumn()
{
  return &type metadata for StandardStreamColumn;
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

uint64_t getEnumTagSinglePayload for StreamColumnSchema(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for StreamColumnSchema(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StreamColumnSchema()
{
  return &type metadata for StreamColumnSchema;
}

unint64_t sub_2445E19C8(uint64_t a1)
{
  unint64_t result;

  result = sub_2445E19EC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2445E19EC()
{
  unint64_t result;

  result = qword_257374C08;
  if (!qword_257374C08)
  {
    result = MEMORY[0x24951397C](&unk_2445E8988, &type metadata for StreamColumnSchema);
    atomic_store(result, (unint64_t *)&qword_257374C08);
  }
  return result;
}

unint64_t sub_2445E1A34()
{
  unint64_t result;

  result = qword_257374C10;
  if (!qword_257374C10)
  {
    result = MEMORY[0x24951397C](&unk_2445E8AA0, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374C10);
  }
  return result;
}

unint64_t sub_2445E1A7C()
{
  unint64_t result;

  result = qword_257374C18;
  if (!qword_257374C18)
  {
    result = MEMORY[0x24951397C](&unk_2445E8BDC, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374C18);
  }
  return result;
}

unint64_t sub_2445E1AC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257374C20;
  if (!qword_257374C20)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257374C28);
    result = MEMORY[0x24951397C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_257374C20);
  }
  return result;
}

unint64_t sub_2445E1B18()
{
  unint64_t result;

  result = qword_257374C30;
  if (!qword_257374C30)
  {
    result = MEMORY[0x24951397C](&unk_2445E8B10, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374C30);
  }
  return result;
}

unint64_t sub_2445E1B60(uint64_t a1)
{
  unint64_t result;

  result = sub_2445E176C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2445E1B88()
{
  unint64_t result;

  result = qword_257374C38;
  if (!qword_257374C38)
  {
    result = MEMORY[0x24951397C](&unk_2445E8AC8, &type metadata for StandardStreamColumn);
    atomic_store(result, (unint64_t *)&qword_257374C38);
  }
  return result;
}

uint64_t _s10PoirotUDFs18StreamColumnSchemaV9ContainerOwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s10PoirotUDFs18StreamColumnSchemaV9ContainerOwca_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t _s10PoirotUDFs18StreamColumnSchemaV9ContainerOwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for StreamColumnSchema.Container(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for StreamColumnSchema.Container(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_2445E1D68(uint64_t result, int a2)
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

ValueMetadata *type metadata accessor for StreamColumnSchema.Container()
{
  return &type metadata for StreamColumnSchema.Container;
}

uint64_t type metadata accessor for PStreamTable(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374C48);
}

uint64_t sub_2445E1DBC()
{
  return swift_initClassMetadata2();
}

void sub_2445E1E04()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2445E1E30()
{
  uint64_t v0;

  return sub_2445D1A80(v0 + qword_257374C40);
}

uint64_t sub_2445E1E40()
{
  uint64_t v0;

  v0 = sub_2445E6A58();
  sub_2445D1A80(v0 + qword_257374C40);
  return swift_deallocClassInstance();
}

uint64_t sub_2445E1E7C()
{
  return type metadata accessor for PStreamTable(0);
}

uint64_t type metadata accessor for StreamConnection(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374CA8);
}

uint64_t sub_2445E1E98()
{
  return sub_2445E31FC();
}

uint64_t sub_2445E1EB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = sub_2445E6848();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PStreamTable(0);
  *(_QWORD *)(swift_allocObject() + qword_257374C40 + 8) = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = a2;
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE741E8], v3);
  v7 = sub_2445E6A4C();
  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_2445E1F94()
{
  uint64_t v0;
  uint64_t result;

  v0 = swift_allocObject() + qword_257374C98;
  *(_OWORD *)v0 = 0u;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_QWORD *)(v0 + 32) = 0;
  swift_weakInit();
  type metadata accessor for PStreamTable(0);
  if (swift_dynamicCastClass())
  {
    swift_weakAssign();
    return sub_2445E6A1C();
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445E20AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[40];
  _BYTE v12[40];
  __int128 v13;
  uint64_t v14;

  v4 = v1 + qword_257374C98;
  swift_beginAccess();
  sub_2445E49A8(v4, (uint64_t)&v13);
  if (v14)
    return sub_2445D2610(&v13, a1);
  sub_2445D432C((uint64_t)&v13, &qword_257374770);
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v7 = Strong + qword_257374C40;
    if (MEMORY[0x249513A54](Strong + qword_257374C40))
    {
      v8 = *(_QWORD *)(v7 + 8);
      swift_getObjectType();
      v9 = sub_2445E6830();
      (*(void (**)(__int128 *__return_ptr, uint64_t))(v8 + 24))(&v13, v9);
      if (!v2)
      {
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        sub_2445D1B00((uint64_t)&v13, (uint64_t)v12);
        sub_2445E49F0((uint64_t)v12, (uint64_t)v11, &qword_257374770);
        swift_beginAccess();
        sub_2445E4A34((uint64_t)v11, v4);
        swift_endAccess();
        return sub_2445D2610(&v13, a1);
      }
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2445D1AA4();
      swift_allocError();
      *(_QWORD *)v10 = 0xD000000000000012;
      *(_QWORD *)(v10 + 8) = 0x80000002445E7270;
      *(_BYTE *)(v10 + 16) = 1;
      swift_willThrow();
    }
    return swift_release();
  }
  else
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  return result;
}

uint64_t sub_2445E22D4()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = MEMORY[0x24BEE4AF8];
  v2 = sub_2445E3DDC(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_2445E3DDC((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[40 * v4];
  *((_OWORD *)v5 + 2) = 0u;
  *((_OWORD *)v5 + 3) = 0u;
  v5[64] = 0;
  sub_2445E20AC((uint64_t)v16);
  if (!v0)
  {
    v6 = v17;
    v7 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v7 + 32))(v13, v6, v7);
    v8 = v14;
    v9 = v15;
    __swift_project_boxed_opaque_existential_1(v13, v14);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v8, v9);
    v11 = *(_QWORD *)(v10 + 16);
    if (v11)
    {
      v19 = v1;
      sub_2445E42AC(0, v11, 0);
      __asm { BR              X9 }
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
    v16[0] = v2;
    sub_2445E40BC(v1);
    sub_2445E6A04();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2445E25C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  sub_2445E20AC((uint64_t)v14);
  if (v0)
    return v1;
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v4 = Strong + qword_257374C40;
    if (MEMORY[0x249513A54](Strong + qword_257374C40))
    {
      v5 = *(_QWORD *)(v4 + 8);
      swift_release();
      ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(ObjectType, v5);
      v9 = v8;
      swift_unknownObjectRelease();
      type metadata accessor for InternalStreamEnumerator();
      v1 = swift_allocObject();
      *(_QWORD *)(v1 + 104) = 0;
      swift_unknownObjectWeakInit();
      v10 = v15;
      v11 = v16;
      __swift_project_boxed_opaque_existential_1(v14, v15);
      (*(void (**)(uint64_t, uint64_t))(v11 + 40))(v10, v11);
      v12 = v15;
      v13 = v16;
      __swift_project_boxed_opaque_existential_1(v14, v15);
      (*(void (**)(uint64_t, uint64_t))(v13 + 32))(v12, v13);
      *(_QWORD *)(v1 + 104) = v9;
      swift_unknownObjectWeakAssign();
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    }
    else
    {
      sub_2445D1AA4();
      swift_allocError();
      *(_QWORD *)v7 = 0xD000000000000012;
      *(_QWORD *)(v7 + 8) = 0x80000002445E7270;
      *(_BYTE *)(v7 + 16) = 1;
      swift_willThrow();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      swift_release();
    }
    return v1;
  }
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445E27F4(uint64_t a1)
{
  _QWORD v3[5];

  sub_2445E20AC((uint64_t)v3);
  sub_2445E285C(a1, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  return 0;
}

int64_t sub_2445E285C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  char v27;
  int64_t v28;
  int64_t result;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  unint64_t v34;
  unint64_t v35;
  size_t v36;
  uint64_t __dst;
  void *__dsta;
  _QWORD v39[3];
  _OWORD v40[5];
  __int128 v41;
  _QWORD *v42;

  v5 = *(_OWORD *)(a1 + 48);
  v40[2] = *(_OWORD *)(a1 + 32);
  v40[3] = v5;
  v6 = *(_OWORD *)(a1 + 80);
  v40[4] = *(_OWORD *)(a1 + 64);
  v41 = v6;
  v7 = *(_OWORD *)(a1 + 16);
  v40[0] = *(_OWORD *)a1;
  v40[1] = v7;
  v8 = sub_2445E2DD4((unsigned int *)v40, a2);
  if (v2)
    return 1;
  v11 = v9;
  v12 = v10;
  __dst = v8;
  v14 = a2[3];
  v13 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v14);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v14, v13);
  if ((v16 & 1) != 0)
    v17 = 100;
  else
    v17 = v15;
  v18 = a2[3];
  v19 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v18);
  v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 16))(v18, v19);
  v22 = *((_QWORD *)&v41 + 1);
  if (v17 >= 0)
    v23 = v17;
  else
    v23 = v17 + 1;
  v39[0] = v17;
  v39[1] = v23 >> 1;
  v39[2] = 1;
  v24 = v39[v11 + __dst];
  *(_QWORD *)(a1 + 72) = v24;
  v25 = 0.0;
  if (v22 >= 2)
  {
    v26 = *(double *)&v20;
    if ((v21 & 1) != 0)
      v26 = 0.01;
    v25 = v26 * (double)v24;
  }
  *(double *)(a1 + 64) = v25;
  v27 = sub_2445E2B04(a1, a2);
  v28 = *(_QWORD *)(v12 + 16);
  result = v28 + 2;
  if (__OFADD__(v28, 2))
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if ((unint64_t)result >> 31)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  result = (int64_t)sqlite3_malloc(result);
  if (result)
  {
    __dsta = (void *)result;
    *(_QWORD *)(a1 + 48) = result;
    if ((v27 & 1) != 0)
      v30 = &unk_251532450;
    else
      v30 = &unk_251532478;
    if (v28)
    {
      v42 = (_QWORD *)MEMORY[0x24BEE4AF8];
      result = (int64_t)sub_2445E42C8(0, v28, 0);
      v31 = 0;
      v32 = (uint64_t)v42;
      while (1)
      {
        v33 = *(char *)(v12 + v31 + 32);
        if (v33 < 0)
          break;
        v42 = (_QWORD *)v32;
        v35 = *(_QWORD *)(v32 + 16);
        v34 = *(_QWORD *)(v32 + 24);
        if (v35 >= v34 >> 1)
        {
          result = (int64_t)sub_2445E42C8((char *)(v34 > 1), v35 + 1, 1);
          v32 = (uint64_t)v42;
        }
        ++v31;
        *(_QWORD *)(v32 + 16) = v35 + 1;
        *(_BYTE *)(v32 + v35 + 32) = v33;
        if (v28 == v31)
        {
          swift_bridgeObjectRelease();
          goto LABEL_27;
        }
      }
      __break(1u);
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_27:
    v42 = v30;
    sub_2445E41A8(v32);
    v36 = v42[2];
    memcpy(__dsta, v42 + 4, v36);
    swift_bridgeObjectRelease();
    *((_BYTE *)__dsta + v36) = 0;
    *(_DWORD *)(a1 + 56) = 1;
    return 1;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_2445E2B04(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v2 = *(unsigned int *)(a1 + 16);
  if (!(_DWORD)v2)
    return 1;
  if ((_DWORD)v2 != 1)
  {
    v13 = a2[3];
    v14 = a2[4];
    __swift_project_boxed_opaque_existential_1(a2, v13);
    if (((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14) & 1) == 0)
      return 1;
    if ((v2 & 0x80000000) == 0)
    {
      v21 = *(_QWORD *)(a1 + 24);
      v15 = (unsigned __int8 *)(v21 + 4);
      while (v21)
      {
        v16 = *((int *)v15 - 1);
        v17 = *v15;
        v18 = *(_QWORD *)(sub_2445E6A10() + 16);
        swift_bridgeObjectRelease();
        if (v18 <= v16)
          goto LABEL_31;
        v19 = sub_2445E6A10();
        if ((v16 & 0x80000000) != 0)
        {
          __break(1u);
LABEL_25:
          __break(1u);
          goto LABEL_26;
        }
        if (*(_QWORD *)(v19 + 16) <= v16)
          goto LABEL_25;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_2445E1630();
        v20 = sub_2445E6DA0();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          return v17 == 0;
        v15 += 8;
        if (!--v2)
          return 1;
      }
      goto LABEL_29;
    }
LABEL_28:
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v5 = *(int **)(a1 + 24);
  if (!v5)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v6 = *v5;
  v7 = *(_QWORD *)(sub_2445E6A10() + 16);
  swift_bridgeObjectRelease();
  if (v7 > v6)
  {
    v8 = sub_2445E6A10();
    if ((v6 & 0x80000000) != 0)
    {
LABEL_26:
      __break(1u);
    }
    else if (*(_QWORD *)(v8 + 16) > v6)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_2445E1630();
      v9 = sub_2445E6DA0();
      swift_bridgeObjectRelease();
      if ((v9 & 1) != 0)
      {
        v10 = a2[3];
        v11 = a2[4];
        __swift_project_boxed_opaque_existential_1(a2, v10);
        if (((*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11) & 1) != 0)
        {
          *(_DWORD *)(a1 + 60) = 1;
          return *((_BYTE *)v5 + 4) == 0;
        }
        *(_DWORD *)(a1 + 60) = *((_BYTE *)v5 + 4) == 0;
      }
      return 1;
    }
    __break(1u);
    goto LABEL_28;
  }
LABEL_31:
  result = sub_2445E6E90();
  __break(1u);
  return result;
}

uint64_t sub_2445E2DD4(unsigned int *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  char *v26;
  _BYTE v27[16];
  uint64_t v28;

  v3 = a2[3];
  v4 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v3);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v4 + 24))(v3, v4) & 1) != 0)
  {
    v5 = *a1;
    if ((v5 & 0x80000000) != 0)
      goto LABEL_31;
    if ((_DWORD)v5)
    {
      v22 = a1;
      sub_2445E49F0((uint64_t)(a1 + 2), (uint64_t)v27, &qword_257374D80);
      v6 = 0;
      v7 = 0;
      v23 = 0;
      v25 = 0;
      v8 = 12 * v5;
      v26 = (char *)MEMORY[0x24BEE4AF8];
      v24 = 12 * v5;
      while (v8 != v7)
      {
        sub_2445E49F0((uint64_t)v27, (uint64_t)&v28, &qword_257374D80);
        if (!v28)
          goto LABEL_32;
        v9 = *(int *)(v28 + v7);
        v10 = *(unsigned __int8 *)(v28 + v7 + 4);
        v11 = *(unsigned __int8 *)(v28 + v7 + 5);
        v12 = *(_QWORD *)(sub_2445E6A10() + 16);
        swift_bridgeObjectRelease();
        if (v12 <= v9)
          goto LABEL_34;
        v13 = sub_2445E6A10();
        if ((v9 & 0x80000000) != 0)
          goto LABEL_28;
        if (*(_QWORD *)(v13 + 16) <= v9)
          goto LABEL_29;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_2445E1630();
        v14 = sub_2445E6DA0();
        swift_bridgeObjectRelease();
        if ((v14 & 1) != 0 && v11)
        {
          HIDWORD(v15) = v10;
          LODWORD(v15) = v10 - 4;
          v8 = v24;
          switch((v15 >> 2))
          {
            case 0u:
            case 7u:
              v23 = 1;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                goto LABEL_24;
              v23 = 1;
              goto LABEL_19;
            case 1u:
            case 3u:
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                goto LABEL_19;
LABEL_24:
              v26 = sub_2445E3EEC(0, *((_QWORD *)v26 + 2) + 1, 1, v26, &qword_257374D88);
LABEL_19:
              v17 = *((_QWORD *)v26 + 2);
              v16 = *((_QWORD *)v26 + 3);
              if (v17 >= v16 >> 1)
                v26 = sub_2445E3EEC((char *)(v16 > 1), v17 + 1, 1, v26, &qword_257374D88);
              *((_QWORD *)v26 + 2) = v17 + 1;
              v26[v17 + 32] = v10;
              if (__OFADD__(v25++, 1))
                goto LABEL_30;
              v19 = *((_QWORD *)v22 + 4);
              if (!v19)
                goto LABEL_33;
              v20 = v19 + v6;
              *(_DWORD *)v20 = v25;
              *(_BYTE *)(v20 + 4) = 1;
              break;
            case 2u:
            case 4u:
            case 5u:
            case 6u:
              break;
            default:
              goto LABEL_5;
          }
        }
        else
        {
LABEL_5:
          v8 = v24;
        }
        v7 += 12;
        v6 += 8;
        if (v8 == v7)
          return v23;
      }
      __break(1u);
LABEL_28:
      __break(1u);
LABEL_29:
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
LABEL_34:
      sub_2445E6E90();
      __break(1u);
      JUMPOUT(0x2445E3118);
    }
  }
  return 0;
}

uint64_t sub_2445E3138()
{
  uint64_t v0;

  sub_2445D432C(v0 + qword_257374C98, &qword_257374770);
  return swift_weakDestroy();
}

uint64_t sub_2445E316C()
{
  uint64_t v0;

  v0 = sub_2445E6A28();
  sub_2445D432C(v0 + qword_257374C98, &qword_257374770);
  swift_weakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_2445E31C0()
{
  return type metadata accessor for StreamConnection(0);
}

uint64_t type metadata accessor for StreamCursor(uint64_t a1)
{
  return sub_2445D563C(a1, qword_257374D08);
}

uint64_t sub_2445E31DC()
{
  return sub_2445E31FC();
}

uint64_t sub_2445E31FC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E323C()
{
  swift_allocObject();
  return sub_2445E3284();
}

uint64_t sub_2445E3284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;

  v2 = v0;
  swift_weakInit();
  type metadata accessor for StreamConnection(0);
  if (swift_dynamicCastClass())
  {
    swift_weakAssign();
    swift_retain();
    swift_retain();
    v3 = sub_2445E25C8();
    if (!v1)
    {
      *(_QWORD *)(v0 + qword_257374D00) = v3;
      swift_release();
      v2 = sub_2445E69F8();
      swift_release();
      return v2;
    }
    swift_release();
    swift_release();
  }
  else
  {
    sub_2445E4960();
    swift_allocError();
    *v4 = 1;
    swift_willThrow();
  }
  swift_release();
  swift_weakDestroy();
  type metadata accessor for StreamCursor(0);
  swift_deallocPartialClassInstance();
  return v2;
}

uint64_t sub_2445E33CC(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v8)(uint64_t, _BYTE *, uint64_t);
  uint64_t result;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257374D60);
  v8 = (uint64_t (*)(uint64_t, _BYTE *, uint64_t))sub_2445E6860();
  result = v8(a1, a2, a3);
  if (!v4 && !(_DWORD)result)
  {
    result = sub_2445E4720(a2, a3);
    if (!(_DWORD)result)
    {
      v10 = *(_QWORD **)(v3 + qword_257374D00);
      v11 = v10[5];
      v12 = v10[6];
      __swift_project_boxed_opaque_existential_1(v10 + 2, v11);
      (*(void (**)(uint64_t, uint64_t))(v12 + 24))(v11, v12);
      return 0;
    }
  }
  return result;
}

uint64_t sub_2445E34A8(int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v21[2];
  unint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374008);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD **)(v1 + qword_257374D00);
  if (!swift_weakLoadStrong())
    goto LABEL_14;
  v8 = *(_QWORD *)(sub_2445E6A10() + 16);
  swift_bridgeObjectRelease();
  if (v8 <= a1)
    goto LABEL_14;
  v9 = sub_2445E6A10();
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_13;
  }
  if (*(_QWORD *)(v9 + 16) <= a1)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v10 = v9 + 40 * a1;
  v12 = *(_QWORD *)(v10 + 32);
  v11 = *(_QWORD *)(v10 + 40);
  swift_bridgeObjectRetain();
  swift_release();
  swift_bridgeObjectRelease();
  if (!v11)
  {
    v13 = v7 + 2;
    v14 = v7[5];
    v15 = v7[6];
    __swift_project_boxed_opaque_existential_1(v13, v14);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v15 + 8))(v21, v14, v15);
    v16 = v22;
    if (v22 >> 60 != 15)
    {
      v18 = v21[0];
      v17 = v21[1];
      sub_2445E68F0();
      sub_2445E4944(v18, v17, v16);
      return 0;
    }
    while (1)
    {
LABEL_14:
      sub_2445E6E90();
      __break(1u);
    }
  }
  swift_bridgeObjectRetain();
  sub_2445E54E4(v12, v11);
  if (!v2)
  {
    sub_2445E5744((uint64_t)v6);
    sub_2445D432C((uint64_t)v6, &qword_257374008);
  }
  swift_bridgeObjectRelease_n();
  return 0;
}

uint64_t sub_2445E3730()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t (*v6)(void);

  v2 = *(_QWORD **)(v0 + qword_257374D00);
  v3 = v2[5];
  v4 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v3);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  if (!v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D60);
    v6 = (uint64_t (*)(void))sub_2445E6860();
    return v6();
  }
  return result;
}

uint64_t sub_2445E37CC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD **)(v0 + qword_257374D00);
  v2 = v1[5];
  v3 = v1[6];
  __swift_project_boxed_opaque_existential_1(v1 + 2, v2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 40))(v2, v3) & 1;
}

uint64_t sub_2445E3820()
{
  swift_weakDestroy();
  return swift_release();
}

uint64_t sub_2445E384C()
{
  sub_2445E69EC();
  swift_weakDestroy();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_2445E3898()
{
  return type metadata accessor for StreamCursor(0);
}

ValueMetadata *type metadata accessor for PStreamTableConfig()
{
  return &type metadata for PStreamTableConfig;
}

unint64_t sub_2445E38B4(uint64_t a1)
{
  unint64_t result;

  result = sub_2445E38D8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2445E38D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257374D58;
  if (!qword_257374D58)
  {
    v1 = type metadata accessor for PStreamTable(255);
    result = MEMORY[0x24951397C](MEMORY[0x24BE743E0], v1);
    atomic_store(result, (unint64_t *)&qword_257374D58);
  }
  return result;
}

char *sub_2445E3920(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573744A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_2445E3A34(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D90);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D98);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_2445E3B68(size_t result, int64_t a2, char a3, _QWORD *a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257374DA8);
  v10 = *(_QWORD *)(sub_2445E6BF0() - 8);
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
  v15 = *(_QWORD *)(sub_2445E6BF0() - 8);
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

char *sub_2445E3CDC(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374DA0);
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

char *sub_2445E3DDC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2445E3EEC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v9])
      memmove(v13, v14, v9);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2445E3FD0(uint64_t result)
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
  result = (uint64_t)sub_2445E3920((char *)result, v10, 1, (char *)v3);
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

uint64_t sub_2445E40BC(uint64_t result)
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
  result = (uint64_t)sub_2445E3DDC((char *)result, v10, 1, (char *)v3);
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

uint64_t sub_2445E41A8(uint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  int64_t v11;

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
    v11 = v4 + v2;
  else
    v11 = v4;
  result = (uint64_t)sub_2445E3EEC((char *)result, v11, 1, (char *)v3, &qword_257374D70);
  v3 = result;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  v7 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = (uint64_t)memcpy((void *)(v3 + v7 + 32), (const void *)(v6 + 32), v2);
  if (!v2)
  {
LABEL_14:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v8 = *(_QWORD *)(v3 + 16);
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    *(_QWORD *)(v3 + 16) = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

char *sub_2445E4290(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2445E42E4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2445E42AC(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2445E43E4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2445E42C8(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_2445E44F4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2445E42E4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374DA0);
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

char *sub_2445E43E4(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2445E44F4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257374D70);
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
  swift_release();
  return v10;
}

uint64_t sub_2445E45DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;

  v1 = sub_2445E6A94();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = 0;
  v7 = 0xE000000000000000;
  sub_2445E6E78();
  swift_bridgeObjectRelease();
  v6 = 0xD000000000000016;
  v7 = 0x80000002445E7C00;
  sub_2445E6E18();
  sub_2445E6E18();
  sub_2445E6E18();
  sub_2445E69D4();
  result = swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_2445E6A88();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_2445E4720(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;
  double v3;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  double v13;
  int v14;
  double v15;
  unint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v3 = 0.0;
  if (!a1)
    goto LABEL_32;
  v6 = *a1 == 0;
  v7 = *(_QWORD *)(a2 + 16);
  if (!v7)
  {
LABEL_33:
    v21 = INFINITY;
    goto LABEL_34;
  }
  v8 = *(_QWORD *)(sub_2445E6998() - 8);
  v9 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a1 + 1;
  v12 = INFINITY;
  v13 = 0.0;
  do
  {
    v14 = *v11++;
    sub_2445E6980();
    HIDWORD(v16) = v14;
    LODWORD(v16) = v14 - 4;
    switch((v16 >> 2))
    {
      case 0u:
        if (v13 < v15)
        {
          v13 = v15 + 0.0;
          if (v15 + 0.0 < INFINITY)
            *(_QWORD *)&v13 += (*(uint64_t *)&v13 >> 63) | 1;
        }
        break;
      case 1u:
        if (v15 <= v12)
          v12 = v15;
        break;
      case 3u:
        if (v15 < v12)
        {
          v17 = 0.0 - v15;
          if (v17 < INFINITY)
            *(_QWORD *)&v17 += (*(uint64_t *)&v17 >> 63) | 1;
          v12 = -v17;
        }
        break;
      case 7u:
        if (v13 <= v15)
          v13 = v15;
        break;
      default:
        break;
    }
    v9 += v10;
    --v7;
  }
  while (v7);
  if (v12 >= v13)
    v18 = v12;
  else
    v18 = v13;
  v19 = fmax(v13, 0.0);
  if (v12 >= 0.0)
  {
    v20 = v12;
  }
  else
  {
    v18 = v19;
    v20 = 0.0;
  }
  if (v13 < 0.0)
    v21 = v20;
  else
    v21 = v18;
  if (v13 < 0.0)
    v3 = 0.0;
  else
    v3 = v13;
  v2 = v28;
  if (v3 > v21)
  {
    __break(1u);
LABEL_32:
    v6 = 0;
    goto LABEL_33;
  }
LABEL_34:
  if (v3 != 0.0 || v21 != INFINITY || v6)
  {
    v24 = *(_QWORD **)(v2 + qword_257374D00);
    v25 = v24[5];
    v26 = v24[6];
    __swift_project_boxed_opaque_existential_1(v24 + 2, v25);
    (*(void (**)(_BOOL8, uint64_t, uint64_t, double, double))(v26 + 16))(v6, v25, v26, v3, v21);
  }
  return 0;
}

uint64_t sub_2445E4944(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 >> 60 != 15)
    return sub_2445D1B9C(a2, a3);
  return result;
}

unint64_t sub_2445E4960()
{
  unint64_t result;

  result = qword_257374D68;
  if (!qword_257374D68)
  {
    result = MEMORY[0x24951397C](&unk_2445E8E5C, &type metadata for StreamTableError);
    atomic_store(result, (unint64_t *)&qword_257374D68);
  }
  return result;
}

uint64_t sub_2445E49A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445E49F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2445E4A34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for StreamTableError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StreamTableError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2445E4B58 + 4 * byte_2445E8C90[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2445E4B8C + 4 * byte_2445E8C8B[v4]))();
}

uint64_t sub_2445E4B8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445E4B94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2445E4B9CLL);
  return result;
}

uint64_t sub_2445E4BA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2445E4BB0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2445E4BB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2445E4BBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StreamTableError()
{
  return &type metadata for StreamTableError;
}

unint64_t sub_2445E4BDC()
{
  unint64_t result;

  result = qword_257374DB0;
  if (!qword_257374DB0)
  {
    result = MEMORY[0x24951397C](&unk_2445E8E34, &type metadata for StreamTableError);
    atomic_store(result, (unint64_t *)&qword_257374DB0);
  }
  return result;
}

uint64_t type metadata accessor for PBase64DecodeFunction()
{
  uint64_t result;

  result = qword_257374DB8;
  if (!qword_257374DB8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445E4C5C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E4C98()
{
  return 0xFFFFFFFFLL;
}

uint64_t sub_2445E4CA0(uint64_t a1, uint64_t a2)
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
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
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
  char *v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;

  v5 = sub_2445E6998();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2445E67E8();
  v61 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v54 = (char *)&v46 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2445E6DC4();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v19 = (char *)&v46 - v18;
  v20 = *(_QWORD *)(a2 + 16);
  if ((unint64_t)(v20 - 1) > 1)
  {
    *(_QWORD *)&v58 = 0;
    *((_QWORD *)&v58 + 1) = 0xE000000000000000;
    sub_2445E6E78();
    swift_bridgeObjectRelease();
    return sub_2445E68A8();
  }
  v51 = v14;
  v52 = v9;
  v48 = v17;
  v49 = v16;
  v50 = v15;
  v53 = a1;
  v21 = a2 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v22 = sub_2445E6938();
  if (v23 >> 60 == 15)
  {
    v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v21, v5);
    MEMORY[0x24BDAC7A8](v24);
    *(&v46 - 2) = (uint64_t)v8;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2573741B0);
    sub_2445E6920();
    if (v2)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      v35 = v55;
      v36 = v56;
      v37 = v57;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v37 & 1) != 0)
      {
        v60 = 0;
        v58 = 0u;
        v59 = 0u;
      }
      else
      {
        *((_QWORD *)&v59 + 1) = MEMORY[0x24BEE0F88];
        v60 = MEMORY[0x24BE749C0];
        *(_QWORD *)&v58 = v35;
        *((_QWORD *)&v58 + 1) = v36;
      }
      sub_2445DDC58((uint64_t)&v58);
      return sub_2445DDD68((uint64_t)&v58);
    }
  }
  else
  {
    v26 = v22;
    v27 = v23;
    v47 = v2;
    sub_2445E6DB8();
    sub_2445E6DAC();
    if (v28)
    {
      sub_2445E67AC();
      v30 = v29;
      swift_bridgeObjectRelease();
      if (v30 >> 60 != 15)
        __asm { BR              X9 }
    }
    v31 = v26;
    v32 = v27;
    if (v20 != 2)
    {
      sub_2445D45A4(v26, v27);
      v34 = v54;
      sub_2445E67DC();
      sub_2445E6890();
      sub_2445D1B9C(v26, v27);
      sub_2445D1B9C(v26, v27);
      return (*(uint64_t (**)(char *, uint64_t))(v61 + 8))(v34, v52);
    }
    v33 = v47;
    sub_2445E692C();
    if (v33)
      return sub_2445D1B9C(v26, v27);
    if (sub_2445E6DD0() == 946238581 && v38 == 0xE400000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v40 = sub_2445E6ECC();
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0)
      {
        *(_QWORD *)&v58 = 0;
        *((_QWORD *)&v58 + 1) = 0xE000000000000000;
        sub_2445E6E78();
        swift_bridgeObjectRelease();
        *(_QWORD *)&v58 = 0xD000000000000011;
        *((_QWORD *)&v58 + 1) = 0x80000002445E7C80;
        sub_2445E6E18();
        swift_bridgeObjectRelease();
        sub_2445E6E18();
        sub_2445E68A8();
        sub_2445D1B9C(v26, v32);
        return swift_bridgeObjectRelease();
      }
    }
    v41 = v48;
    sub_2445E6DB8();
    swift_bridgeObjectRelease();
    v43 = v49;
    v42 = v50;
    v44 = v51;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 32))(v49, v41, v51);
    (*(void (**)(char *, uint64_t, uint64_t))(v42 + 16))(v19, v43, v44);
    sub_2445E6DAC();
    if (v45)
    {
      sub_2445E68FC();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_2445E689C();
    }
    sub_2445D1B9C(v31, v32);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 8))(v43, v44);
  }
}

uint64_t sub_2445E5234()
{
  return type metadata accessor for PBase64DecodeFunction();
}

uint64_t sub_2445E523C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2445D1B9C(a1, a2);
  return a1;
}

uint64_t type metadata accessor for PGetFunction()
{
  uint64_t result;

  result = qword_257374E08;
  if (!qword_257374E08)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445E528C()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E52C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v21[56];

  v4 = v2;
  v7 = sub_2445E6998();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = &v21[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v12 = *(_QWORD *)(a2 + 16);
  if (!v12)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  v13 = a2 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  if ((sub_2445E6950() & 1) != 0)
    return sub_2445E689C();
  v14 = v4 + qword_257374790;
  if (MEMORY[0x249513A54](v14))
  {
    v15 = *(_QWORD *)(v14 + 8);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(ObjectType, v15);
    result = swift_unknownObjectRelease();
    if (!v3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v13, v7);
      sub_2445E6920();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      result = swift_unknownObjectRelease();
      if (v12 >= 2)
      {
        v18 = sub_2445E692C();
        sub_2445DE448(v18, v19, a1);
        swift_bridgeObjectRelease();
        return sub_2445D1B44((uint64_t)v21);
      }
      goto LABEL_12;
    }
  }
  else
  {
    sub_2445D1AA4();
    swift_allocError();
    *(_QWORD *)v17 = 0xD000000000000012;
    *(_QWORD *)(v17 + 8) = 0x80000002445E7270;
    *(_BYTE *)(v17 + 16) = 1;
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2445E54DC()
{
  return type metadata accessor for PGetFunction();
}

uint64_t sub_2445E54E4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v5 = v2[5];
  v6 = v2[6];
  __swift_project_boxed_opaque_existential_1(v2 + 2, v5);
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v6 + 8))(&v13, v5, v6);
  v7 = v15;
  if (v15 >> 60 == 15)
  {
    result = sub_2445E6E90();
    __break(1u);
  }
  else
  {
    v8 = v13;
    v9 = v14;
    v10 = v2[10];
    v11 = v2[11];
    __swift_project_boxed_opaque_existential_1(v2 + 7, v10);
    v13 = v8;
    v14 = v9;
    v15 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))(v11 + 32))(a1, a2, &v13, v10, v11);
    return sub_2445E4944(v8, v9, v7);
  }
  return result;
}

uint64_t sub_2445E5604(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  const void *v6;
  const void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  v6 = (const void *)sub_2445E6CF8();
  v8 = v7;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2445E6D04();
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  v9 = sub_2445E6BE4();
  sub_2445DED9C(v6, v8, v9, v10, a4);
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_2445E56F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  sub_2445D1A80(v0 + 96);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for InternalStreamEnumerator()
{
  return objc_opt_self();
}

uint64_t sub_2445E5744(uint64_t a1)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = sub_2445E6BC0();
  v19 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v18 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2445E6D88();
  MEMORY[0x24BDAC7A8](v17);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374008);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2445E6D70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  sub_2445E5B94(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    sub_2445E5BDC((uint64_t)v6, (uint64_t)v13);
    sub_2445D6B34((uint64_t)v13, (uint64_t)v11);
    v15 = (char *)&loc_2445E5900 + 4 * byte_2445E8F20[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  sub_2445D432C((uint64_t)v6, &qword_257374008);
  return sub_2445E689C();
}

uint64_t sub_2445E5B94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445E5BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2445E6D70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2445E5C20(_QWORD *a1)
{
  uint64_t *v1;

  return sub_2445E5604(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for PJSONFunction()
{
  uint64_t result;

  result = qword_257374F68;
  if (!qword_257374F68)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2445E5C78()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2445E5CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;
  _BYTE v17[16];
  _QWORD v18[4];

  v4 = v2;
  v6 = sub_2445E6998();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (*(_QWORD *)(a2 + 16))
  {
    v11 = a2 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    if ((sub_2445E6950() & 1) != 0)
    {
      return sub_2445E689C();
    }
    else
    {
      v12 = v4 + qword_257374790;
      if (MEMORY[0x249513A54](v12))
      {
        v13 = *(_QWORD *)(v12 + 8);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t))(v13 + 8))(ObjectType, v13);
        result = swift_unknownObjectRelease();
        if (!v3)
        {
          (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v11, v6);
          sub_2445E6920();
          (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
          swift_unknownObjectRelease();
          __swift_project_boxed_opaque_existential_1(v18, v18[3]);
          sub_2445E6D28();
          sub_2445E68FC();
          swift_bridgeObjectRelease();
          return sub_2445D1B44((uint64_t)v17);
        }
      }
      else
      {
        sub_2445D1AA4();
        swift_allocError();
        *(_QWORD *)v15 = 0xD000000000000012;
        *(_QWORD *)(v15 + 8) = 0x80000002445E7270;
        *(_BYTE *)(v15 + 16) = 1;
        return swift_willThrow();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2445E5F20()
{
  return type metadata accessor for PJSONFunction();
}

uint64_t sub_2445E5F28@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  unsigned int *v8;
  uint64_t result;
  uint64_t v10;

  v4 = sub_2445E6CA4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (unsigned int *)MEMORY[0x24BE74890];
  switch(a1)
  {
    case 'F':
      v8 = (unsigned int *)MEMORY[0x24BE748D8];
      goto LABEL_15;
    case 'G':
      v8 = (unsigned int *)MEMORY[0x24BE748F0];
      goto LABEL_15;
    case 'I':
      v8 = (unsigned int *)MEMORY[0x24BE74898];
      goto LABEL_15;
    case 'S':
      v8 = (unsigned int *)MEMORY[0x24BE748B0];
      goto LABEL_15;
    case 'U':
      v8 = (unsigned int *)MEMORY[0x24BE748C8];
      goto LABEL_15;
    case 'b':
      v8 = (unsigned int *)MEMORY[0x24BE74880];
      goto LABEL_15;
    case 'd':
      v8 = (unsigned int *)MEMORY[0x24BE748A0];
      goto LABEL_15;
    case 'f':
      v8 = (unsigned int *)MEMORY[0x24BE748D0];
      goto LABEL_15;
    case 'g':
      v8 = (unsigned int *)MEMORY[0x24BE748E8];
      goto LABEL_15;
    case 'i':
      goto LABEL_15;
    case 's':
      v8 = (unsigned int *)MEMORY[0x24BE748A8];
      goto LABEL_15;
    case 't':
      v8 = (unsigned int *)MEMORY[0x24BE748B8];
      goto LABEL_15;
    case 'u':
      v8 = (unsigned int *)MEMORY[0x24BE748C0];
LABEL_15:
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v8, v4);
      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
      result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
      break;
    default:
      result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
      break;
  }
  return result;
}

uint64_t sub_2445E60BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v1 = sub_2445E6BF0();
  v15 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_2445E6B24();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573742B8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v13 - v10;
  sub_2445E6D4C();
  sub_2445E6D58();
  sub_2445DE7D8((uint64_t)v11, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v9, 1, v2) == 1)
  {
    sub_2445D432C((uint64_t)v9, &qword_2573742B8);
    sub_2445E689C();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v9, v2);
    sub_2445DE820(v14, 0);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return sub_2445D432C((uint64_t)v11, &qword_2573742B8);
}

uint64_t sub_2445E64F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
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
  _QWORD v21[2];

  v21[1] = a3;
  v7 = sub_2445E6BD8();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257374FB8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2445E6CA4();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v21 - v18;
  sub_2445E5F28(a5, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
    sub_2445D432C((uint64_t)v12, &qword_257374FB8);
    return sub_2445E68A8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v12, v13);
    (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v17, v19, v13);
    swift_bridgeObjectRetain();
    sub_2445E6BCC();
    sub_2445E60BC(a1);
    sub_2445E66D0((uint64_t)v9);
    return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v19, v13);
  }
}

uint64_t sub_2445E66D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2445E6BD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2445E670C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257374FC8;
  if (!qword_257374FC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257374FC0);
    result = MEMORY[0x24951397C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_257374FC8);
  }
  return result;
}

uint64_t sub_2445E6758()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2445E6764()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2445E6770()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2445E677C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2445E6788()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2445E6794()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2445E67A0()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_2445E67AC()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_2445E67B8()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_2445E67C4()
{
  return MEMORY[0x24BE740F0]();
}

uint64_t sub_2445E67D0()
{
  return MEMORY[0x24BE740F8]();
}

uint64_t sub_2445E67DC()
{
  return MEMORY[0x24BE74100]();
}

uint64_t sub_2445E67E8()
{
  return MEMORY[0x24BE74108]();
}

uint64_t sub_2445E67F4()
{
  return MEMORY[0x24BE74110]();
}

uint64_t sub_2445E6800()
{
  return MEMORY[0x24BE74130]();
}

uint64_t sub_2445E680C()
{
  return MEMORY[0x24BE74138]();
}

uint64_t sub_2445E6818()
{
  return MEMORY[0x24BE74140]();
}

uint64_t sub_2445E6824()
{
  return MEMORY[0x24BE74150]();
}

uint64_t sub_2445E6830()
{
  return MEMORY[0x24BE741D0]();
}

uint64_t sub_2445E683C()
{
  return MEMORY[0x24BE741D8]();
}

uint64_t sub_2445E6848()
{
  return MEMORY[0x24BE741F0]();
}

uint64_t sub_2445E6854()
{
  return MEMORY[0x24BE74200]();
}

uint64_t sub_2445E6860()
{
  return MEMORY[0x24BE74210]();
}

uint64_t sub_2445E686C()
{
  return MEMORY[0x24BE74218]();
}

uint64_t sub_2445E6878()
{
  return MEMORY[0x24BE74248]();
}

uint64_t sub_2445E6884()
{
  return MEMORY[0x24BE74250]();
}

uint64_t sub_2445E6890()
{
  return MEMORY[0x24BE74258]();
}

uint64_t sub_2445E689C()
{
  return MEMORY[0x24BE74260]();
}

uint64_t sub_2445E68A8()
{
  return MEMORY[0x24BE74268]();
}

uint64_t sub_2445E68B4()
{
  return MEMORY[0x24BE74270]();
}

uint64_t sub_2445E68C0()
{
  return MEMORY[0x24BE74278]();
}

uint64_t sub_2445E68CC()
{
  return MEMORY[0x24BE74280]();
}

uint64_t sub_2445E68D8()
{
  return MEMORY[0x24BE74288]();
}

uint64_t sub_2445E68E4()
{
  return MEMORY[0x24BE74290]();
}

uint64_t sub_2445E68F0()
{
  return MEMORY[0x24BE74298]();
}

uint64_t sub_2445E68FC()
{
  return MEMORY[0x24BE742A0]();
}

uint64_t sub_2445E6908()
{
  return MEMORY[0x24BE742A8]();
}

uint64_t sub_2445E6914()
{
  return MEMORY[0x24BE742B0]();
}

uint64_t sub_2445E6920()
{
  return MEMORY[0x24BE742B8]();
}

uint64_t sub_2445E692C()
{
  return MEMORY[0x24BE742C0]();
}

uint64_t sub_2445E6938()
{
  return MEMORY[0x24BE742C8]();
}

uint64_t sub_2445E6944()
{
  return MEMORY[0x24BE742D0]();
}

uint64_t sub_2445E6950()
{
  return MEMORY[0x24BE742D8]();
}

uint64_t sub_2445E695C()
{
  return MEMORY[0x24BE742E0]();
}

uint64_t sub_2445E6968()
{
  return MEMORY[0x24BE742E8]();
}

uint64_t sub_2445E6974()
{
  return MEMORY[0x24BE742F0]();
}

uint64_t sub_2445E6980()
{
  return MEMORY[0x24BE742F8]();
}

uint64_t sub_2445E698C()
{
  return MEMORY[0x24BE74300]();
}

uint64_t sub_2445E6998()
{
  return MEMORY[0x24BE74308]();
}

uint64_t sub_2445E69A4()
{
  return MEMORY[0x24BE74318]();
}

uint64_t sub_2445E69B0()
{
  return MEMORY[0x24BE74328]();
}

uint64_t sub_2445E69BC()
{
  return MEMORY[0x24BE74330]();
}

uint64_t sub_2445E69C8()
{
  return MEMORY[0x24BE74348]();
}

uint64_t sub_2445E69D4()
{
  return MEMORY[0x24BE74350]();
}

uint64_t sub_2445E69E0()
{
  return MEMORY[0x24BE74358]();
}

uint64_t sub_2445E69EC()
{
  return MEMORY[0x24BE74378]();
}

uint64_t sub_2445E69F8()
{
  return MEMORY[0x24BE74380]();
}

uint64_t sub_2445E6A04()
{
  return MEMORY[0x24BE74388]();
}

uint64_t sub_2445E6A10()
{
  return MEMORY[0x24BE74390]();
}

uint64_t sub_2445E6A1C()
{
  return MEMORY[0x24BE743A0]();
}

uint64_t sub_2445E6A28()
{
  return MEMORY[0x24BE743A8]();
}

uint64_t sub_2445E6A34()
{
  return MEMORY[0x24BE743B8]();
}

uint64_t sub_2445E6A40()
{
  return MEMORY[0x24BE743C0]();
}

uint64_t sub_2445E6A4C()
{
  return MEMORY[0x24BE743C8]();
}

uint64_t sub_2445E6A58()
{
  return MEMORY[0x24BE743D8]();
}

uint64_t sub_2445E6A64()
{
  return MEMORY[0x24BE743E8]();
}

uint64_t sub_2445E6A70()
{
  return MEMORY[0x24BE743F0]();
}

uint64_t sub_2445E6A7C()
{
  return MEMORY[0x24BE74400]();
}

uint64_t sub_2445E6A88()
{
  return MEMORY[0x24BE74440]();
}

uint64_t sub_2445E6A94()
{
  return MEMORY[0x24BE74458]();
}

uint64_t sub_2445E6AA0()
{
  return MEMORY[0x24BE74470]();
}

uint64_t sub_2445E6AAC()
{
  return MEMORY[0x24BE74478]();
}

uint64_t sub_2445E6AB8()
{
  return MEMORY[0x24BE74500]();
}

uint64_t sub_2445E6AC4()
{
  return MEMORY[0x24BE74508]();
}

uint64_t sub_2445E6AD0()
{
  return MEMORY[0x24BE74510]();
}

uint64_t sub_2445E6ADC()
{
  return MEMORY[0x24BE74518]();
}

uint64_t sub_2445E6AE8()
{
  return MEMORY[0x24BE74520]();
}

uint64_t sub_2445E6AF4()
{
  return MEMORY[0x24BE74530]();
}

uint64_t sub_2445E6B00()
{
  return MEMORY[0x24BE74538]();
}

uint64_t sub_2445E6B0C()
{
  return MEMORY[0x24BE74548]();
}

uint64_t sub_2445E6B18()
{
  return MEMORY[0x24BE74550]();
}

uint64_t sub_2445E6B24()
{
  return MEMORY[0x24BE745B8]();
}

uint64_t sub_2445E6B30()
{
  return MEMORY[0x24BE74668]();
}

uint64_t sub_2445E6B3C()
{
  return MEMORY[0x24BE74670]();
}

uint64_t sub_2445E6B48()
{
  return MEMORY[0x24BE746B0]();
}

uint64_t sub_2445E6B54()
{
  return MEMORY[0x24BE746B8]();
}

uint64_t sub_2445E6B60()
{
  return MEMORY[0x24BE74700]();
}

uint64_t sub_2445E6B6C()
{
  return MEMORY[0x24BE74710]();
}

uint64_t sub_2445E6B78()
{
  return MEMORY[0x24BE74750]();
}

uint64_t sub_2445E6B84()
{
  return MEMORY[0x24BE74758]();
}

uint64_t sub_2445E6B90()
{
  return MEMORY[0x24BE74760]();
}

uint64_t sub_2445E6B9C()
{
  return MEMORY[0x24BE74770]();
}

uint64_t sub_2445E6BA8()
{
  return MEMORY[0x24BE74780]();
}

uint64_t sub_2445E6BB4()
{
  return MEMORY[0x24BE74788]();
}

uint64_t sub_2445E6BC0()
{
  return MEMORY[0x24BE74790]();
}

uint64_t sub_2445E6BCC()
{
  return MEMORY[0x24BE747A0]();
}

uint64_t sub_2445E6BD8()
{
  return MEMORY[0x24BE747A8]();
}

uint64_t sub_2445E6BE4()
{
  return MEMORY[0x24BE747B0]();
}

uint64_t sub_2445E6BF0()
{
  return MEMORY[0x24BE747C8]();
}

uint64_t sub_2445E6BFC()
{
  return MEMORY[0x24BE747D8]();
}

uint64_t sub_2445E6C08()
{
  return MEMORY[0x24BE747E8]();
}

uint64_t sub_2445E6C14()
{
  return MEMORY[0x24BE747F0]();
}

uint64_t sub_2445E6C20()
{
  return MEMORY[0x24BE74808]();
}

uint64_t sub_2445E6C2C()
{
  return MEMORY[0x24BE74818]();
}

uint64_t sub_2445E6C38()
{
  return MEMORY[0x24BE74820]();
}

uint64_t sub_2445E6C44()
{
  return MEMORY[0x24BE74828]();
}

uint64_t sub_2445E6C50()
{
  return MEMORY[0x24BE74830]();
}

uint64_t sub_2445E6C5C()
{
  return MEMORY[0x24BE74838]();
}

uint64_t sub_2445E6C68()
{
  return MEMORY[0x24BE74840]();
}

uint64_t sub_2445E6C74()
{
  return MEMORY[0x24BE74848]();
}

uint64_t sub_2445E6C80()
{
  return MEMORY[0x24BE74858]();
}

uint64_t sub_2445E6C8C()
{
  return MEMORY[0x24BE74860]();
}

uint64_t sub_2445E6C98()
{
  return MEMORY[0x24BE74868]();
}

uint64_t sub_2445E6CA4()
{
  return MEMORY[0x24BE748F8]();
}

uint64_t sub_2445E6CB0()
{
  return MEMORY[0x24BE74910]();
}

uint64_t sub_2445E6CBC()
{
  return MEMORY[0x24BE74918]();
}

uint64_t sub_2445E6CC8()
{
  return MEMORY[0x24BE74920]();
}

uint64_t sub_2445E6CD4()
{
  return MEMORY[0x24BE74928]();
}

uint64_t sub_2445E6CE0()
{
  return MEMORY[0x24BE74930]();
}

uint64_t sub_2445E6CEC()
{
  return MEMORY[0x24BE74938]();
}

uint64_t sub_2445E6CF8()
{
  return MEMORY[0x24BE74948]();
}

uint64_t sub_2445E6D04()
{
  return MEMORY[0x24BE74950]();
}

uint64_t sub_2445E6D10()
{
  return MEMORY[0x24BE74958]();
}

uint64_t sub_2445E6D1C()
{
  return MEMORY[0x24BE74960]();
}

uint64_t sub_2445E6D28()
{
  return MEMORY[0x24BE74968]();
}

uint64_t sub_2445E6D34()
{
  return MEMORY[0x24BE74970]();
}

uint64_t sub_2445E6D40()
{
  return MEMORY[0x24BE74978]();
}

uint64_t sub_2445E6D4C()
{
  return MEMORY[0x24BE74980]();
}

uint64_t sub_2445E6D58()
{
  return MEMORY[0x24BE74988]();
}

uint64_t sub_2445E6D64()
{
  return MEMORY[0x24BE74990]();
}

uint64_t sub_2445E6D70()
{
  return MEMORY[0x24BE74998]();
}

uint64_t sub_2445E6D7C()
{
  return MEMORY[0x24BE749A8]();
}

uint64_t sub_2445E6D88()
{
  return MEMORY[0x24BE749B0]();
}

uint64_t sub_2445E6D94()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2445E6DA0()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2445E6DAC()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_2445E6DB8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2445E6DC4()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2445E6DD0()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_2445E6DDC()
{
  return MEMORY[0x24BE74490]();
}

uint64_t sub_2445E6DE8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_2445E6DF4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2445E6E00()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2445E6E0C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_2445E6E18()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2445E6E24()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_2445E6E30()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2445E6E3C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2445E6E48()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_2445E6E54()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2445E6E60()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2445E6E6C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2445E6E78()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2445E6E84()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2445E6E90()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2445E6E9C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2445E6EA8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2445E6EB4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2445E6EC0()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2445E6ECC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2445E6ED8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2445E6EE4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2445E6EF0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2445E6EFC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2445E6F08()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2445E6F14()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2445E6F20()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2445E6F2C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2445E6F38()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void *__cdecl sqlite3_malloc(int a1)
{
  return (void *)MEMORY[0x24BEDE198](*(_QWORD *)&a1);
}

void sqlite3_result_blob(sqlite3_context *a1, const void *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x24BEDE1E8](a1, a2, *(_QWORD *)&a3, a4);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE358](a1);
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

