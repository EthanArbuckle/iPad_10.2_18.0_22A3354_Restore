uint64_t SnippetClientContext.onReceiveActionFromHost.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + qword_25757AE80;
  v4 = sub_24648256C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

void sub_24645CA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_24645D86C((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  OUTLINED_FUNCTION_9();
}

uint64_t SnippetClientContext.viewModel.getter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_246482170();
  swift_release();
  return swift_release();
}

uint64_t sub_24645CB9C()
{
  return SnippetClientContext.viewModel.getter();
}

uint64_t sub_24645CBBC(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  MEMORY[0x24BDAC7A8](a1, a1);
  v2 = (char *)&v6 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v6 - v1);
  return SnippetClientContext.viewModel.setter(v2, v4);
}

uint64_t SnippetClientContext.viewModel.setter(char *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t);
  uint64_t v18;
  char *v19;
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

  v3 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v18 = *(_QWORD *)(v3 - 8);
  v19 = a1;
  v4 = MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)&v18 - v8;
  v11 = v10[11];
  v12 = v10[12];
  v32 = v3;
  v33 = v11;
  v13 = v10[13];
  v34 = v12;
  v35 = v13;
  swift_getKeyPath();
  v28 = v3;
  v29 = v11;
  v30 = v12;
  v31 = v13;
  swift_getKeyPath();
  sub_246482170();
  swift_release();
  swift_release();
  v24 = v3;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  swift_getKeyPath();
  v20 = v3;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  swift_getKeyPath();
  v15 = v18;
  v14 = v19;
  (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v6, v19, v3);
  swift_retain();
  sub_24648217C();
  sub_24645CDC0();
  v16 = *(uint64_t (**)(char *, uint64_t))(v15 + 8);
  v16(v14, v3);
  return v16(v9, v3);
}

void sub_24645CDC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ValueMetadata *v8;
  _QWORD *Description;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, ValueMetadata *);
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22[3];
  ValueMetadata *v23;
  __int128 v24;

  v1 = v0;
  v2 = *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575797D0);
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v7 = (char *)v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(ValueMetadata **)(v2 + 80);
  Description = v8[-1].Description;
  MEMORY[0x24BDAC7A8](v5, v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  SnippetClientContext.viewModel.getter();
  v13 = sub_2464823D4();
  v14 = (void (*)(char *, ValueMetadata *))Description[1];
  v14(v12, v8);
  if ((v13 & 1) == 0)
  {
    v23 = &type metadata for Feature;
    *(_QWORD *)&v24 = sub_24645D944();
    v15 = sub_246482038();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
    v16 = *v1;
    if ((v15 & 1) != 0)
    {
      v17 = MEMORY[0x24955BD20]((char *)v1 + *(_QWORD *)(v16 + 128));
      if (v17)
      {
        v18 = (void *)v17;
        sub_24646B148((uint64_t)v7);

        v19 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2575797E0);
        if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v19) == 1)
        {
          sub_24645D9E8((uint64_t)v7);
        }
        else
        {
          SnippetClientContext.viewModel.getter();
          sub_246465278();
          v14(v12, v8);
          swift_getOpaqueTypeConformance2();
          sub_24645DA28();
          sub_246482098();
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v7, v19);
        }
      }
    }
    else
    {
      v20 = MEMORY[0x24955BD20]((char *)v1 + *(_QWORD *)(v16 + 136));
      if (v20)
      {
        v21 = (void *)v20;
        v23 = v8;
        v24 = *(_OWORD *)(v2 + 88);
        __swift_allocate_boxed_opaque_existential_2(v22);
        SnippetClientContext.viewModel.getter();
        sub_246461D00((uint64_t)v22);

      }
    }
  }
}

void SnippetClientContext.viewModel.modify()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OUTLINED_FUNCTION_16();
  v2 = OUTLINED_FUNCTION_15(v1);
  v4 = *(_QWORD *)(v3 + 80);
  v2[1] = v4;
  v2[2] = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v0 + 24) = OUTLINED_FUNCTION_11();
  *(_QWORD *)(v0 + 32) = OUTLINED_FUNCTION_11();
  SnippetClientContext.viewModel.getter();
  OUTLINED_FUNCTION_13();
}

void sub_24645D050(uint64_t a1, char a2)
{
  sub_24645D284(a1, a2, (void (*)(void *))SnippetClientContext.viewModel.setter);
}

uint64_t SnippetClientContext.$viewModel.getter()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_17();
  sub_246482158();
  return swift_endAccess();
}

uint64_t sub_24645D0B0()
{
  return SnippetClientContext.$viewModel.getter();
}

void sub_24645D0D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_246482188();
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v7 - v4;
  (*(void (**)(char *, uint64_t))(v6 + 16))((char *)&v7 - v4, a1);
  SnippetClientContext.$viewModel.setter((uint64_t)v5);
}

void SnippetClientContext.$viewModel.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = sub_246482188();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - v5, a1, v2);
  OUTLINED_FUNCTION_0();
  sub_246482194();
  sub_246482164();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  OUTLINED_FUNCTION_9();
}

void SnippetClientContext.$viewModel.modify()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1);
  v2 = sub_246482188();
  v0[1] = v2;
  v0[2] = *(_QWORD *)(v2 - 8);
  v0[3] = OUTLINED_FUNCTION_11();
  v0[4] = OUTLINED_FUNCTION_11();
  SnippetClientContext.$viewModel.getter();
  OUTLINED_FUNCTION_13();
}

void sub_24645D278(uint64_t a1, char a2)
{
  sub_24645D284(a1, a2, (void (*)(void *))SnippetClientContext.$viewModel.setter);
}

void sub_24645D284(uint64_t a1, char a2, void (*a3)(void *))
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD **)a1;
  v5 = *(void **)(*(_QWORD *)a1 + 24);
  v6 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7 = v4[1];
    v8 = v4[2];
    (*(void (**)(_QWORD, void *, uint64_t))(v8 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v6, v7);
    a3(v5);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v7);
  }
  else
  {
    a3(*(void **)(*(_QWORD *)a1 + 32));
  }
  free(v6);
  free(v5);
  free(v4);
}

void sub_24645D31C(uint64_t a1, uint64_t a2)
{
  sub_24645D43C(a1, a2, (void (*)(uint64_t, uint64_t))sub_24645D328);
}

void sub_24645D328()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1, v2);
  OUTLINED_FUNCTION_12();
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_257579610 != -1)
    swift_once();
  sub_246482578();

  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_3();
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  swift_endAccess();

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
}

void sub_24645D430(uint64_t a1, uint64_t a2)
{
  sub_24645D43C(a1, a2, (void (*)(uint64_t, uint64_t))sub_24645D484);
}

void sub_24645D43C(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, uint64_t))
{
  swift_allocObject();
  a3(a1, a2);
  OUTLINED_FUNCTION_13();
}

void sub_24645D484()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;

  OUTLINED_FUNCTION_1();
  MEMORY[0x24BDAC7A8](v1, v2);
  OUTLINED_FUNCTION_12();
  v3 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_257579610 != -1)
    swift_once();
  sub_246482578();

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3();
  swift_unknownObjectWeakAssign();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8();
  swift_endAccess();

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5();
}

uint64_t SnippetClientContext.sendAction(_:)()
{
  uint64_t v0;
  uint64_t result;

  result = MEMORY[0x24955BD20](v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
  if (result)
    _SnippetClientController.sendAction(_:)();
  return result;
}

void SnippetClientContext.deinit()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_24648256C();
  OUTLINED_FUNCTION_7(v0);
  v1 = OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_7(v1);
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_13();
}

uint64_t SnippetClientContext.__deallocating_deinit()
{
  SnippetClientContext.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24645D66C()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_24645D678@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2464820F8();
  *a1 = result;
  return result;
}

uint64_t sub_24645D6B4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24648256C();
  if (v1 <= 0x3F)
  {
    result = sub_246482194();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void type metadata accessor for SnippetClientContext()
{
  JUMPOUT(0x24955BB70);
}

uint64_t method lookup function for SnippetClientContext()
{
  return swift_lookUpClassMethod();
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24645D774(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24645D794(uint64_t result, int a2, int a3)
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
  sub_24645DA78(a1, &qword_257579760);
}

uint64_t sub_24645D7D0(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24645D80C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24645D82C(uint64_t result, int a2, int a3)
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
  sub_24645DA78(a1, &qword_257579768);
}

uint64_t sub_24645D86C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_24648214C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24955BBD0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24645D944()
{
  unint64_t result;

  result = qword_2575797D8;
  if (!qword_2575797D8)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for Feature, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_2575797D8);
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

uint64_t *__swift_allocate_boxed_opaque_existential_2(uint64_t *a1)
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

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_24645D9E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2575797D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_24645DA28()
{
  unint64_t result;

  result = qword_25757A8E0;
  if (!qword_25757A8E0)
  {
    result = MEMORY[0x24955BBE8](&unk_2464847B0, &type metadata for DataModelKey);
    atomic_store(result, (unint64_t *)&qword_25757A8E0);
  }
  return result;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_24645DA78(a1, (unint64_t *)&unk_2575797F0);
}

void sub_24645DA78(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return 32;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v0, v1);
}

__n128 OUTLINED_FUNCTION_6(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t OUTLINED_FUNCTION_7(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

void OUTLINED_FUNCTION_8()
{
  uint64_t v0;
  uint64_t v1;

  sub_24645CA6C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

void *OUTLINED_FUNCTION_11()
{
  size_t v0;

  return malloc(v0);
}

_QWORD *OUTLINED_FUNCTION_15(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = result;
  *result = v2;
  return result;
}

void *OUTLINED_FUNCTION_16()
{
  return malloc(0x28uLL);
}

uint64_t OUTLINED_FUNCTION_17()
{
  return sub_246482194();
}

uint64_t SizeDimensionRequestType.description.getter(uint64_t a1)
{
  uint64_t result;

  if (a1 == 1)
    return 0x6465786966;
  if (!a1)
    return 0x63696D616E7964;
  result = OUTLINED_FUNCTION_7_0();
  __break(1u);
  return result;
}

BOOL SizeDimensionRequestType.init(rawValue:)(uint64_t a1)
{
  return a1 && a1 == 1;
}

BOOL sub_24645DC64(uint64_t *a1, uint64_t *a2)
{
  return sub_24647326C(*a1, *a2);
}

void sub_24645DC70()
{
  sub_2464733AC();
}

void sub_24645DC78()
{
  sub_246473464();
}

void sub_24645DC80()
{
  sub_246473548();
}

BOOL sub_24645DC88@<W0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  _BOOL8 result;
  char v4;

  result = SizeDimensionRequestType.init(rawValue:)(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_24645DCB8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

double SizeDimensionRequest.minimum.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
}

double SizeDimensionRequest.maximum.getter()
{
  uint64_t v0;

  return *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
}

uint64_t SizeDimensionRequest.type.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
}

void SizeDimensionRequest.__allocating_init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  OUTLINED_FUNCTION_5_0();
  SizeDimensionRequest.init(minimum:maximum:type:)(a1, a2, a3);
  OUTLINED_FUNCTION_8_0();
}

id SizeDimensionRequest.init(minimum:maximum:type:)(uint64_t a1, double a2, double a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  if (a2 <= 0.0)
    a2 = 0.0;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = a2;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = a3;
  *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = a1;
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return OUTLINED_FUNCTION_6_0((uint64_t)v11.super_class, sel_init, v4, v5, v6, v7, v8, v9, v11);
}

uint64_t type metadata accessor for SizeDimensionRequest()
{
  return objc_opt_self();
}

id SizeDimensionRequest.__allocating_init(minimum:maximum:)(double a1, double a2)
{
  objc_class *v2;

  return objc_msgSend(objc_allocWithZone(v2), sel_initWithMinimum_maximum_type_, 0, a1, a2);
}

id SizeDimensionRequest.init(minimum:maximum:)()
{
  void *v0;

  return objc_msgSend(v0, sel_initWithMinimum_maximum_type_, 0);
}

void sub_24645DEA0(double a1)
{
  id v2;

  v2 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
  SizeDimensionRequest.init(minimum:maximum:type:)(1, a1, a1);
  OUTLINED_FUNCTION_8_0();
}

double sub_24645DED8(double a1)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v2 == 1)
    return *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  result = 0.0;
  if (!v2)
  {
    result = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
    if (result >= a1)
      result = a1;
    if (result <= *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum))
      return *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
  }
  return result;
}

uint64_t sub_24645DF58()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v1 = *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
  if ((~*(_QWORD *)&v1 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (v1 <= -9.22337204e18)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (v1 >= 9.22337204e18)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v2 = 39 * (uint64_t)v1;
  if ((unsigned __int128)((uint64_t)v1 * (__int128)39) >> 64 != v2 >> 63)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v3 = *(double *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  if ((~*(_QWORD *)&v3 & 0x7FF0000000000000) == 0)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (v3 <= -9.22337204e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v3 >= 9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v4 = v2 * (uint64_t)v3;
  if ((unsigned __int128)(v2 * (__int128)(uint64_t)v3) >> 64 != v4 >> 63)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v5 >= 1)
    v5 = 1;
  result = v4 * v5;
  if ((unsigned __int128)(v4 * (__int128)v5) >> 64 != (v4 * v5) >> 63)
    goto LABEL_21;
  return result;
}

BOOL sub_24645E040(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v5;
  _BYTE v6[24];
  uint64_t v7;

  sub_24645E100(a1, (uint64_t)v6);
  if (v7)
  {
    type metadata accessor for SizeDimensionRequest();
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum) == *(double *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum]
        && *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) == *(double *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum])
      {
        v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
        v3 = *(_QWORD *)&v5[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type];

        return v2 == v3;
      }

    }
  }
  else
  {
    sub_24645E148((uint64_t)v6);
  }
  return 0;
}

uint64_t sub_24645E100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24645E148(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24645E250()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (!v1)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v2 = v1;
  v3 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  if (v3 == 1)
  {
    v4 = 0xE500000000000000;
    v5 = 0x6465786966;
    goto LABEL_6;
  }
  if (!v3)
  {
    v4 = 0xE700000000000000;
    v5 = 0x63696D616E7964;
LABEL_6:
    sub_24645E914(v5, v4, 1701869940, 0xE400000000000000, v2);

    v6 = sub_24645EA0C(v2);
    if (v7)
    {
      v8 = v6;

      return v8;
    }
    goto LABEL_9;
  }
LABEL_10:
  result = OUTLINED_FUNCTION_7_0();
  __break(1u);
  return result;
}

id sub_24645E36C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  double v3;
  double v4;
  uint64_t v5;
  objc_class *v6;
  id v7;
  id result;

  v3 = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum);
  v4 = *(double *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  v6 = (objc_class *)type metadata accessor for SizeDimensionRequest();
  v7 = objc_allocWithZone(v6);
  result = SizeDimensionRequest.init(minimum:maximum:type:)(v5, v3, v4);
  a1[3] = v6;
  *a1 = result;
  return result;
}

uint64_t static SizeDimensionRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_24645E454(void *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();

  v4 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_0();

  v5 = *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type);
  v6 = (id)OUTLINED_FUNCTION_4_0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v5, v6);

}

id SizeDimensionRequest.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_5_0();
  return SizeDimensionRequest.init(coder:)(a1);
}

id SizeDimensionRequest.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  objc_super v24;

  v3 = v1;
  v4 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  v6 = v5;

  v7 = 0.0;
  if (v6 > 0.0)
    v7 = v6;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = v7;
  v8 = (void *)OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3_0();
  v10 = v9;

  *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = v10;
  v11 = (void *)OUTLINED_FUNCTION_4_0();
  v12 = objc_msgSend(a1, sel_decodeIntegerForKey_, v11);

  v13 = SizeDimensionRequestType.init(rawValue:)((uint64_t)v12);
  v15 = (v14 & 1) != 0 || v13;
  *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = v15;

  v24.receiver = v3;
  v24.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  v22 = OUTLINED_FUNCTION_6_0((uint64_t)v24.super_class, sel_init, v16, v17, v18, v19, v20, v21, v24);

  return v22;
}

uint64_t SizeDimensionRequest.__allocating_init(xpcDictionary:)(void *a1)
{
  OUTLINED_FUNCTION_5_0();
  return SizeDimensionRequest.init(xpcDictionary:)(a1);
}

uint64_t SizeDimensionRequest.init(xpcDictionary:)(void *a1)
{
  void *v1;
  char *v3;
  double v4;
  uint64_t result;
  uint64_t v6;
  int64_t int64;
  _BOOL8 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  objc_super v18;

  v3 = v1;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  if (v4 <= 0.0)
    v4 = 0.0;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_minimum] = v4;
  result = BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum] = v6;
  if (a1)
  {
    int64 = xpc_dictionary_get_int64(a1, "type");
    v8 = SizeDimensionRequestType.init(rawValue:)(int64);
    v10 = (v9 & 1) != 0 || v8;
    *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type] = v10;

    v18.receiver = v3;
    v18.super_class = (Class)type metadata accessor for SizeDimensionRequest();
    v17 = OUTLINED_FUNCTION_6_0((uint64_t)v18.super_class, sel_init, v11, v12, v13, v14, v15, v16, v18);
    swift_unknownObjectRelease();
    return (uint64_t)v17;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24645E7CC(void *a1)
{
  uint64_t v1;

  if (a1)
  {
    BSSerializeDoubleToXPCDictionaryWithKey();
    BSSerializeDoubleToXPCDictionaryWithKey();
    xpc_dictionary_set_int64(a1, "type", *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_type));
  }
}

id SizeDimensionRequest.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_5_0(), sel_init);
}

void SizeDimensionRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SizeDimensionRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SizeDimensionRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24645E914(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v7 = (id)sub_2464823E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a5, sel_appendString_withName_, v6, v7);

}

id sub_24645E99C(double a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(a4, sel_appendFloat_withName_, v6, a1);

  return v7;
}

uint64_t sub_24645EA0C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_build);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2464823EC();

  return v3;
}

unint64_t sub_24645EA70()
{
  unint64_t result;

  result = qword_2575798E0;
  if (!qword_2575798E0)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for SizeDimensionRequestType, &type metadata for SizeDimensionRequestType);
    atomic_store(result, (unint64_t *)&qword_2575798E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SizeDimensionRequestType()
{
  return &type metadata for SizeDimensionRequestType;
}

uint64_t method lookup function for SizeDimensionRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(minimum:maximum:type:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static SizeDimensionRequest.fixed(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of SizeDimensionRequest.resolveIfNecessary(intrinsicLength:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SizeDimensionRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SizeDimensionRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SizeDimensionRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_2464823E0();
}

id OUTLINED_FUNCTION_1_0(unsigned int a1, double a2)
{
  void *v2;

  return sub_24645E99C(a2, a1 | 0x6D756D00000000, 0xE700000000000000, v2);
}

id OUTLINED_FUNCTION_2_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  double v3;

  return objc_msgSend(v0, (SEL)(v2 + 3016), v1, v3);
}

id OUTLINED_FUNCTION_3_0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, (SEL)(v2 + 2376), v1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_2464823E0();
}

id OUTLINED_FUNCTION_5_0()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_6_0(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  return objc_msgSendSuper2(&a9, a2);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return sub_246482770();
}

id sub_24645EBFC()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_6_1();
  return sub_24645EF20(v0, (uint64_t (*)(_QWORD, _OWORD *))type metadata accessor for SnippetHostingAction.ClientToHost);
}

void sub_24645EC30(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24645F0BC(a3, (uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.ClientToHost);
}

void sub_24645EC5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  sub_24645F138(a3, (uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.ClientToHost);
}

id sub_24645EC94(void *a1)
{
  id result;

  result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    OUTLINED_FUNCTION_8_1();
    type metadata accessor for _SnippetHostingController();
  }
  return result;
}

void sub_24645EDD8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_24645EC94(v4);

}

void sub_24645EE2C()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645EE54(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_24645EE2C();
}

void sub_24645EE70()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645EE98(int a1, int a2, void *a3, void *a4, void *a5)
{
  sub_24645F47C(a1, a2, a3, a4, a5, (uint64_t)&unk_2517A03E0, (void (*)(void *))sub_24645EE70);
}

void sub_24645EEAC()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645EED4()
{
  sub_24645EEAC();
}

id sub_24645EEE0()
{
  return sub_24645F514((uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.ClientToHost);
}

id sub_24645EEEC()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_6_1();
  return sub_24645EF20(v0, (uint64_t (*)(_QWORD, _OWORD *))type metadata accessor for SnippetHostingAction.HostToClient);
}

id sub_24645EF20(_QWORD *a1, uint64_t (*a2)(_QWORD, _OWORD *))
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  objc_class *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  _OWORD v20[2];
  objc_super v21;

  v3 = v2;
  v5 = *v2;
  v6 = *MEMORY[0x24BEE4EA0];
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_246481F9C();
  swift_allocObject();
  sub_246481F90();
  v8 = sub_246481F84();
  v10 = v9;
  swift_release();
  v11 = v6 & v5;
  v12 = (void *)sub_246482008();
  v17 = *(_OWORD *)(v11 + 96);
  v18 = *(_OWORD *)(v11 + 80);
  objc_msgSend(v7, sel_setObject_forSetting_, v12, 0);

  v13 = v7;
  v20[0] = v18;
  v20[1] = v17;
  v14 = (objc_class *)a2(0, v20);
  v21.receiver = v3;
  v21.super_class = v14;
  v15 = objc_msgSendSuper2(&v21, sel_initWithInfo_responder_, v13, 0);
  sub_24645F708(v8, v10);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v15;
}

void sub_24645F0BC(void *a1, uint64_t (*a2)(_QWORD, __int128 *))
{
  void *v2;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  objc_super v16;

  v16.receiver = v2;
  v16.super_class = (Class)OUTLINED_FUNCTION_0_1(a2, v10, v13);
  OUTLINED_FUNCTION_7_1((int)v16.super_class, sel_initWithCoder_, v4, v5, v6, v7, v8, v9, v11, v12, v14, v15, v16);

  OUTLINED_FUNCTION_5_1();
}

void sub_24645F10C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_24645F0BC(a3, (uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.HostToClient);
}

void sub_24645F138(uint64_t a1, uint64_t (*a2)(_QWORD, __int128 *))
{
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  v15.receiver = v2;
  v15.super_class = (Class)OUTLINED_FUNCTION_0_1(a2, v9, v12);
  OUTLINED_FUNCTION_7_1((int)v15.super_class, sel_initWithXPCDictionary_, v3, v4, v5, v6, v7, v8, v10, v11, v13, v14, v15);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_5_1();
}

void sub_24645F188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_unknownObjectRetain();
  sub_24645F138(a3, (uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.HostToClient);
}

id sub_24645F1C0(void *a1)
{
  id result;
  void *v2;
  void *v3;
  id v4;
  void *v5;

  result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    v2 = (void *)swift_dynamicCastObjCProtocolConditional();
    if (v2)
    {
      v3 = v2;
      if ((objc_msgSend(v2, sel_respondsToSelector_, sel_window) & 1) != 0)
      {
        v4 = objc_msgSend(v3, sel_window);
        if (v4)
        {
          v5 = v4;
          if (objc_msgSend(v4, sel_rootViewController))
          {
            OUTLINED_FUNCTION_8_1();
            type metadata accessor for _SnippetClientController();
          }

        }
      }
    }
    return (id)OUTLINED_FUNCTION_1_1();
  }
  return result;
}

void sub_24645F3A8(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_24645F1C0(v4);

}

void sub_24645F3FC()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645F424(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_24645F3FC();
}

void sub_24645F440()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645F468(int a1, int a2, void *a3, void *a4, void *a5)
{
  sub_24645F47C(a1, a2, a3, a4, a5, (uint64_t)&unk_2517A03B8, (void (*)(void *))sub_24645F440);
}

void sub_24645F47C(int a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, void (*a7)(void *))
{
  void *v10;
  id v11;

  v10 = _Block_copy(aBlock);
  if (v10)
    *(_QWORD *)(swift_allocObject() + 16) = v10;
  v11 = a3;
  a7(a4);
  JUMPOUT(0x24645F4D0);
}

void sub_24645F4D4()
{
  OUTLINED_FUNCTION_2_1();
  __break(1u);
}

void sub_24645F4FC()
{
  sub_24645F4D4();
}

id sub_24645F508()
{
  return sub_24645F514((uint64_t (*)(_QWORD, __int128 *))type metadata accessor for SnippetHostingAction.HostToClient);
}

id sub_24645F514(uint64_t (*a1)(_QWORD, __int128 *))
{
  void *v1;
  __int128 v3;
  __int128 v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)OUTLINED_FUNCTION_0_1(a1, v3, v4);
  return objc_msgSendSuper2(&v5, sel_dealloc);
}

uint64_t sub_24645F558()
{
  return swift_deallocClassInstance();
}

uint64_t sub_24645F568()
{
  uint64_t result;

  result = sub_2464823E0();
  qword_257579A90 = result;
  return result;
}

id static NSNotificationName.onReceiveActionFromHost.getter()
{
  return sub_24645F608(&qword_257579610, (id *)&qword_257579A90);
}

uint64_t sub_24645F5B8()
{
  uint64_t result;

  result = sub_2464823E0();
  qword_257579A98 = result;
  return result;
}

id static NSNotificationName.onReceiveActionFromClient.getter()
{
  return sub_24645F608(&qword_257579618, (id *)&qword_257579A98);
}

id sub_24645F608(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

void type metadata accessor for SnippetHostingAction()
{
  JUMPOUT(0x24955BB70);
}

void type metadata accessor for SnippetHostingAction.ClientToHost()
{
  JUMPOUT(0x24955BB70);
}

uint64_t sub_24645F65C()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for SnippetHostingAction.HostToClient()
{
  JUMPOUT(0x24955BB70);
}

uint64_t sub_24645F69C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_24645F6C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24645F708(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_0_1@<X0>(uint64_t (*a1)(_QWORD, __int128 *)@<X8>, __int128 a2, __int128 a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v5 = v4 & v3;
  v6 = *(_OWORD *)(v5 + 96);
  a2 = *(_OWORD *)(v5 + 80);
  a3 = v6;
  return a1(0, &a2);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13)
{
  return sub_24645F6C0((uint64_t)&a9, (uint64_t)&a13);
}

id OUTLINED_FUNCTION_6_1()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_7_1(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13)
{
  uint64_t v13;

  return objc_msgSendSuper2(&a13, a2, v13);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return 0;
}

id sub_24645F7D0(uint64_t a1)
{
  _BYTE *v1;
  objc_super v3;

  v1[OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_assertions] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for SceneCancelTouchAssertion();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_24645F818()
{
  void *v0;
  objc_super v2;

  if ((*((_BYTE *)v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated) & 1) == 0)
    objc_msgSend(v0, sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneCancelTouchAssertion();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24645F89C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for SceneCancelTouchAssertion()
{
  return objc_opt_self();
}

void sub_24645F8F4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated;
  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_isInvalidated) & 1) == 0)
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SceneCancelTouchAssertion_assertions);
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      v3 = sub_24648271C();
      if (v3)
        goto LABEL_4;
    }
    else
    {
      v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return;
        }
        for (i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0)
            v5 = (id)MEMORY[0x24955B5B8](i, v2);
          else
            v5 = *(id *)(v2 + 8 * i + 32);
          v6 = v5;
          objc_msgSend(v5, sel_invalidate);

        }
      }
    }
    swift_bridgeObjectRelease();
    *(_BYTE *)(v0 + v1) = 1;
  }
}

uint64_t sub_24645FA1C()
{
  uint64_t result;

  type metadata accessor for SnippetHostingContext();
  swift_allocObject();
  result = sub_246467764();
  qword_257579D88 = result;
  return result;
}

uint64_t static SnippetHostingContextKey.defaultValue.getter()
{
  if (qword_257579620 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_24645FA98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static SnippetHostingContextKey.defaultValue.getter();
  *a1 = result;
  return result;
}

uint64_t EnvironmentValues.snippetHostingContext.getter()
{
  uint64_t v1;

  sub_24645FAF8();
  sub_246482224();
  return v1;
}

unint64_t sub_24645FAF8()
{
  unint64_t result;

  result = qword_257579D90;
  if (!qword_257579D90)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for SnippetHostingContextKey, &type metadata for SnippetHostingContextKey);
    atomic_store(result, (unint64_t *)&qword_257579D90);
  }
  return result;
}

void sub_24645FB34()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
}

void sub_24645FB50()
{
  swift_retain();
  EnvironmentValues.snippetHostingContext.setter();
  OUTLINED_FUNCTION_1_2();
}

uint64_t EnvironmentValues.snippetHostingContext.setter()
{
  sub_24645FAF8();
  return sub_246482230();
}

uint64_t (*EnvironmentValues.snippetHostingContext.modify(uint64_t a1))(_QWORD *a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_24645FAF8();
  sub_246482224();
  return sub_24645FBF8;
}

uint64_t sub_24645FBF8(_QWORD *a1, char a2)
{
  a1[1] = *a1;
  if ((a2 & 1) == 0)
    return OUTLINED_FUNCTION_0_2();
  swift_retain();
  OUTLINED_FUNCTION_0_2();
  return swift_release();
}

void sub_24645FC60()
{
  uint64_t *v0;

  *v0 = OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2();
}

ValueMetadata *type metadata accessor for SnippetHostingContextKey()
{
  return &type metadata for SnippetHostingContextKey;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return sub_246482230();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return EnvironmentValues.snippetHostingContext.getter();
}

void sub_24645FCB4(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics) = a1;

}

id sub_24645FCE8()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
}

void sub_24645FD40(void *a1)
{
  uint64_t v2;

  objc_msgSend(a1, sel_copy);
  sub_2464825FC();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2_3();
  swift_dynamicCast();
  sub_24645FCB4(v2);

}

void sub_24645FDBC(id *a1)
{
  sub_24645FD40(*a1);
}

void (*sub_24645FDE4(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  return sub_24645FE24;
}

void sub_24645FE24(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    sub_24645FD40(v3);
    OUTLINED_FUNCTION_0_3(v3);
  }
  else
  {
    sub_24645FD40(v2);
  }
}

id SceneMetricsRequest.__allocating_init(lockScreenMetrics:)()
{
  uint64_t v0;
  objc_class *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v2 = (char *)OUTLINED_FUNCTION_6_1();
  *(_QWORD *)&v2[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v0;
  v10.receiver = v2;
  v10.super_class = v1;
  return OUTLINED_FUNCTION_6_0((uint64_t)v2, sel_init, v3, v4, v5, v6, v7, v8, v10);
}

id SceneMetricsRequest.init(lockScreenMetrics:)(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = a1;
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  return OUTLINED_FUNCTION_6_0((uint64_t)v9.super_class, sel_init, v2, v3, v4, v5, v6, v7, v9);
}

uint64_t type metadata accessor for SceneMetricsRequest()
{
  return objc_opt_self();
}

uint64_t sub_24645FF5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics), sel_hash);
  if (v1 >= 1)
    v2 = 1;
  else
    v2 = v1;
  result = 23 * v2;
  if ((unsigned __int128)(v2 * (__int128)23) >> 64 != (23 * v2) >> 63)
    __break(1u);
  return result;
}

uint64_t sub_24645FFA4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  char v6;
  char *v8;
  _BYTE v9[24];
  uint64_t v10;

  sub_24645E100(a1, (uint64_t)v9);
  if (!v10)
  {
    sub_24645E148((uint64_t)v9);
    goto LABEL_5;
  }
  type metadata accessor for SceneMetricsRequest();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v6 = 0;
    return v6 & 1;
  }
  sub_246460070();
  v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  v3 = *(void **)&v8[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics];
  v4 = v2;
  v5 = v3;
  v6 = sub_2464825C0();

  return v6 & 1;
}

unint64_t sub_246460070()
{
  unint64_t result;

  result = qword_257579DB0;
  if (!qword_257579DB0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257579DB0);
  }
  return result;
}

id sub_246460174()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  id v4;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;

    result = (id)sub_24645EA0C(v2);
    if (v3)
    {
      v4 = result;

      return v4;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id SceneMetricsRequest.__allocating_init(xpcDictionary:)()
{
  OUTLINED_FUNCTION_6_1();
  return SceneMetricsRequest.init(xpcDictionary:)();
}

id SceneMetricsRequest.init(xpcDictionary:)()
{
  void *v0;
  char *v1;
  id v2;
  id v3;
  void *v5;
  objc_super v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = v0;
  if ((id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey())
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_24645F6C0((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_24645E148((uint64_t)v8);
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_2_3();
  if (!swift_dynamicCast())
  {
LABEL_8:
    OUTLINED_FUNCTION_2_3();
    v2 = sub_246465D8C();
    goto LABEL_9;
  }
  v2 = v5;
LABEL_9:
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v2;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  v3 = objc_msgSendSuper2(&v6, sel_init);
  swift_unknownObjectRelease();
  return v3;
}

uint64_t sub_246460370(uint64_t result)
{
  if (result)
    return BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
  return result;
}

id sub_2464603E8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  objc_class *v4;
  char *v5;
  id v6;
  id result;
  objc_super v8;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  v4 = (objc_class *)type metadata accessor for SceneMetricsRequest();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  v6 = v3;
  result = objc_msgSendSuper2(&v8, sel_init);
  a1[3] = v4;
  *a1 = result;
  return result;
}

uint64_t static SceneMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_2464604C4(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;

  v3 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
  v4 = (void *)sub_2464823E0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v3, v4);

  OUTLINED_FUNCTION_0_3(v4);
}

id SceneMetricsRequest.__allocating_init(coder:)()
{
  void *v0;

  OUTLINED_FUNCTION_6_1();
  return SceneMetricsRequest.init(coder:)(v0);
}

id SceneMetricsRequest.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_super v13;

  OUTLINED_FUNCTION_2_3();
  v3 = v1;
  v4 = sub_24648259C();
  if (!v4)
    v4 = (uint64_t)sub_246465D8C();
  *(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v4;

  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  v11 = OUTLINED_FUNCTION_6_0((uint64_t)v13.super_class, sel_init, v5, v6, v7, v8, v9, v10, v13);

  return v11;
}

id SceneMetricsRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SceneMetricsRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SceneMetricsRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_24646070C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v6 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(a4, sel_appendObject_withName_, a1, v6);

  return v7;
}

id sub_24646077C@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_24645FCE8();
  *a1 = result;
  return result;
}

uint64_t method lookup function for SceneMetricsRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SceneMetricsRequest.lockScreenMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(lockScreenMetrics:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SceneMetricsRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SceneMetricsRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SceneMetricsRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SceneMetricsRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

void OUTLINED_FUNCTION_0_3(id a1)
{

}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return type metadata accessor for SceneItemMetricsRequest();
}

__CFString *sub_246460888()
{
  qword_257579DE0 = (uint64_t)CFSTR("SiriInteractiveSessionRoleSnippet");
  return CFSTR("SiriInteractiveSessionRoleSnippet");
}

id static UISceneSessionRole.interactiveSnippet.getter()
{
  if (qword_257579628 != -1)
    swift_once();
  return (id)qword_257579DE0;
}

uint64_t sub_2464608E0()
{
  return sub_246460908((SEL *)&selRef_settings, (void (*)(_QWORD))type metadata accessor for SnippetSceneSettings);
}

uint64_t sub_2464608F4()
{
  return sub_246460908((SEL *)&selRef_clientSettings, (void (*)(_QWORD))type metadata accessor for SnippetSceneClientSettings);
}

uint64_t sub_246460908(SEL *a1, void (*a2)(_QWORD))
{
  void *v2;
  id v5;
  id v6;

  v5 = objc_msgSend(v2, sel__FBSScene);
  v6 = objc_msgSend(v5, *a1);

  a2(0);
  return swift_dynamicCastClassUnconditional();
}

char *sub_246460980(void *a1, void *a2)
{
  _BYTE *v2;
  uint64_t v5;
  id v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void *v11;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  objc_super v17;

  v2[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate] = 0;
  v5 = OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer;
  v6 = objc_allocWithZone((Class)type metadata accessor for SettingsDiffer());
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v8 = &v7[OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;

  v17.receiver = v7;
  v17.super_class = (Class)type metadata accessor for SnippetScene();
  v9 = (char *)objc_msgSendSuper2(&v17, sel_initWithSession_connectionOptions_, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579E58);
  v10 = OUTLINED_FUNCTION_3_2();
  *(_OWORD *)(v10 + 16) = xmmword_246483AA0;
  v11 = *(void **)&v9[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  *(_QWORD *)(v10 + 32) = v11;
  sub_246482458();
  v12 = v9;
  v13 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579E60);
  v14 = (void *)sub_246482434();
  swift_bridgeObjectRelease();
  sub_246462618();
  v15 = (void *)sub_2464825CC();
  objc_msgSend(v12, sel__registerSettingsDiffActionArray_forKey_, v14, v15);

  return v12;
}

void sub_246460B68(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  id v6;

  v5 = *a1;
  BSDispatchQueueAssertMain();
  v6 = (id)sub_2464608E0();
  sub_24646E3C0(*(_QWORD *)(*MEMORY[0x24BEE46A8] + v5 + 8), a2, a3);

}

void sub_246460BD8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = *a1;
  v16 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257579DE8);
  v14 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + v1 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = sub_2464825D8();
  v15 = sub_246462188();
  v3 = sub_2464820C8();
  v17 = *(_QWORD *)(v3 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v4, v5);
  v12 = (char *)v9 - v6;
  v9[0] = v2;
  v7 = sub_24648211C();
  v8 = MEMORY[0x24955BBE8](MEMORY[0x24BDB96C0], v3);
  v11 = v8;
  v10 = MEMORY[0x24955BBE8](MEMORY[0x24BDB9D08], v7);
  v18 = v3;
  v19 = v7;
  v20 = v8;
  v21 = v10;
  v9[3] = sub_2464820D4();
  OUTLINED_FUNCTION_18();
}

void sub_246460D28(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  *(_QWORD *)(v1 - 192) = sub_2464820B0();
  OUTLINED_FUNCTION_18();
}

void sub_246460D50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  char *v10;
  uint64_t *v11;
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
  char *v26;
  void *v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  *(_QWORD *)(v13 - 184) = a1;
  v14 = sub_2464820A4();
  *(_QWORD *)(v13 - 136) = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v15, v16);
  *(_QWORD *)(v13 - 224) = (char *)&a9 - v17;
  *(_QWORD *)(v13 - 208) = MEMORY[0x24955BBE8](MEMORY[0x24BDB94C8], v14);
  v18 = sub_2464820BC();
  *(_QWORD *)(v13 - 176) = v18;
  *(_QWORD *)(v13 - 144) = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v19, v20);
  *(_QWORD *)(v13 - 264) = (char *)&a9 - v21;
  OUTLINED_FUNCTION_5_2();
  MEMORY[0x24BDAC7A8](v22, v23);
  v25 = (char *)&a9 - v24;
  BSDispatchQueueAssertMain();
  v26 = v10;
  v27 = (void *)sub_2464608E0();
  sub_24646E4DC(v11, v9, (uint64_t)v25);

  sub_246482128();
  v28 = *(id *)&v26[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  v29 = sub_24646781C(v11, v9);

  *(_QWORD *)(v13 - 120) = v29;
  v30 = (_QWORD *)OUTLINED_FUNCTION_3_2();
  v30[2] = v9;
  v30[3] = v26;
  v30[4] = v11;
  v31 = (_QWORD *)OUTLINED_FUNCTION_3_2();
  v32 = *(_QWORD *)(v13 - 168);
  v31[2] = v32;
  v31[3] = v9;
  v31[4] = sub_2464621F8;
  v31[5] = v30;
  v33 = v26;
  swift_retain();
  v34 = *(_QWORD *)(v13 - 216);
  sub_2464821B8();
  OUTLINED_FUNCTION_13_0();
  swift_release();
  v35 = sub_2464821D0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 128) + 8))(v34, v12);
  *(_QWORD *)(v13 - 120) = v35;
  v36 = sub_246482140();
  OUTLINED_FUNCTION_13_0();
  *(_QWORD *)(v13 - 120) = v36;
  v37 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v37 + 16) = v32;
  *(_QWORD *)(v37 + 24) = v9;
  v38 = *(_QWORD *)(v13 - 224);
  sub_2464821AC();
  OUTLINED_FUNCTION_13_0();
  swift_release();
  swift_getAssociatedConformanceWitness();
  sub_2464821DC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 136) + 8))(v38, v14);
  OUTLINED_FUNCTION_18();
}

uint64_t sub_246460FE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = sub_2464821A0();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
  return v3;
}

void sub_24646103C(_QWORD *a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  id v6;

  v6 = (id)sub_2464608E0();
  sub_24646E4DC(a1, a2, a3);

}

uint64_t sub_246461098@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  swift_getAssociatedTypeWitness();
  v4 = sub_2464825D8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t sub_2464610FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_2;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v16 = a3;
  v15 = sub_2464825D8();
  MEMORY[0x24BDAC7A8](v15, v7);
  v9 = (char *)&v15 - v8;
  v10 = (void *)sub_2464608F4();
  v11 = objc_msgSend(v10, sel_otherSettings, v15);
  OUTLINED_FUNCTION_2_4();
  if (objc_msgSend(v11, sel_objectForSetting_, qword_25757A168))
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
    sub_246462270(&v17, &v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  if ((swift_dynamicCast() & 1) == 0)
    v17 = xmmword_246483AB0;

  if (*((_QWORD *)&v17 + 1) >> 60 == 15)
  {
    result = sub_246482710();
    __break(1u);
  }
  else
  {
    sub_246481F78();
    swift_allocObject();
    sub_246481F6C();
    sub_246481F60();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_21((uint64_t)v9, 0);
    v12 = *(_QWORD *)(a1 - 8);
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(a4, v9, a1);
    *((_QWORD *)&v19 + 1) = a1;
    v20 = a2;
    v21 = v16;
    boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v18);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 16))(boxed_opaque_existential_2, a4, a1);
    sub_246461D00((uint64_t)&v18);
    return OUTLINED_FUNCTION_16_0();
  }
  return result;
}

void sub_246461380(void (*a1)(void *, _UNKNOWN **))
{
  void *v1;

  sub_246461390(v1, a1);
}

void sub_246461390(void *a1, void (*a2)(void *, _UNKNOWN **))
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  BSDispatchQueueAssertMain();
  if ((*((_BYTE *)a1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate) & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    a2(a1, &protocol witness table for SnippetScene);
    v4 = objc_msgSend(a1, sel__FBSScene);
    v5 = OUTLINED_FUNCTION_1_3();
    *(_QWORD *)(v5 + 16) = 0;
    *(_QWORD *)(v5 + 24) = a1;
    v6 = OUTLINED_FUNCTION_1_3();
    *(_QWORD *)(v6 + 16) = sub_246462728;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = OUTLINED_FUNCTION_11_0((uint64_t)sub_246461824, MEMORY[0x24BDAC760], 1107296256, v10, v11);
    v8 = a1;
    swift_retain();
    swift_release();
    objc_msgSend(v4, sel_updateClientSettingsWithTransitionBlock_, v7);

    _Block_release(v7);
    v9 = OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_13_0();
    if ((v9 & 1) == 0)
    {
      OUTLINED_FUNCTION_8_2();
      return;
    }
  }
  __break(1u);
}

uint64_t sub_2464614C8(uint64_t (*a1)(_BYTE *, _UNKNOWN **))
{
  _BYTE *v1;
  uint64_t result;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;

  result = BSDispatchQueueAssertMain();
  if ((v1[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate] & 1) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  v4 = (void *)a1(v1, &protocol witness table for SnippetScene);
  v5 = objc_msgSend(v1, sel__FBSScene);
  v6 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v1;
  v7 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v7 + 16) = sub_246462280;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = OUTLINED_FUNCTION_11_0((uint64_t)sub_246461824, MEMORY[0x24BDAC760], 1107296256, v11, v12);
  v9 = v4;
  v10 = v1;
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithTransitionBlock_, v8);

  _Block_release(v8);
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_20();
  result = OUTLINED_FUNCTION_9_0();
  if ((v1 & 1) != 0)
LABEL_5:
    __break(1u);
  return result;
}

void *sub_246461624(void *a1, void *a2, uint64_t a3)
{
  id v3;
  id *v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  _QWORD v24[3];
  uint64_t v25;

  type metadata accessor for SnippetSceneMutableClientSettings();
  if (swift_dynamicCastClass())
  {
    v7 = (id *)(a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
    swift_beginAccess();
    v8 = *v7;
    v9 = *v7;
    v3 = a1;
    sub_24647365C(v8);

    v10 = (uint64_t *)(a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects);
    swift_beginAccess();
    v11 = *v10;
    swift_bridgeObjectRetain_n();
    sub_2464735C0(v11);
    swift_bridgeObjectRelease();
    v12 = a3 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
    swift_beginAccess();
    sub_2464622D4(v12, (uint64_t)v24);
    v13 = v25;
    if (v25)
    {
      v14 = __swift_project_boxed_opaque_existential_0(v24, v25);
      v15 = *(_QWORD *)(v13 - 8);
      MEMORY[0x24BDAC7A8](v14, v14);
      v17 = (char *)v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
      (*(void (**)(char *))(v15 + 16))(v17);
      sub_24646236C((uint64_t)v24);
      v18 = sub_246465278();
      v20 = v19;
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
LABEL_7:
      sub_246462654(v18, v20);
      sub_2464735B4(v18, v20);
      sub_24646225C(v18, v20);

      goto LABEL_8;
    }
LABEL_6:
    sub_24646236C((uint64_t)v24);
    v18 = 0;
    v20 = 0xF000000000000000;
    goto LABEL_7;
  }
  if (!a2)
  {
    __break(1u);
    goto LABEL_6;
  }
LABEL_8:
  v21 = a2;
  return a2;
}

id sub_246461824(uint64_t a1, void *a2)
{
  uint64_t (*v2)(void);
  id v3;
  void *v4;

  v2 = *(uint64_t (**)(void))(a1 + 32);
  v3 = a2;
  v4 = (void *)v2();

  return v4;
}

void sub_246461860(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_246461934(v1);
}

void sub_24646188C(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v3;
  id v4;

  v2 = (void **)(a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
  swift_beginAccess();
  v3 = *v2;
  v4 = v3;
  sub_24647365C(v3);

}

void sub_2464618F4()
{
  uint64_t v0;
  id *v1;
  id v2;

  v1 = (id *)(v0 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
  OUTLINED_FUNCTION_2_4();
  v2 = *v1;
  OUTLINED_FUNCTION_22();
}

void sub_246461934(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = (void **)(v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics);
  OUTLINED_FUNCTION_2_4();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  BSDispatchQueueAssertMain();
  OUTLINED_FUNCTION_17_0((uint64_t)sub_2464622C4, v6, v7, v8, v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_4_2();
}

void sub_24646199C(uint64_t a1)
{
  OUTLINED_FUNCTION_12_0(a1);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_2464619D4()
{
  sub_246461DB0();
}

void sub_2464619E0()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_246461AA8(v0);
}

uint64_t sub_246461A08(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain_n();
  sub_2464735C0(v3);
  return swift_bridgeObjectRelease();
}

void sub_246461A6C()
{
  OUTLINED_FUNCTION_2_4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22();
}

void sub_246461AA8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_snippetSceneHostTouchRestrictedRects);
  OUTLINED_FUNCTION_2_4();
  *v3 = a1;
  swift_bridgeObjectRelease();
  BSDispatchQueueAssertMain();
  OUTLINED_FUNCTION_17_0((uint64_t)sub_2464622CC, v4, v5, v6, v7, v8, v9, v10, v11);
  OUTLINED_FUNCTION_4_2();
}

void sub_246461B04(uint64_t a1)
{
  OUTLINED_FUNCTION_12_0(a1);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246461B3C()
{
  sub_246461DB0();
}

void sub_246461B48(uint64_t a1)
{
  _BYTE v1[48];

  sub_2464622D4(a1, (uint64_t)v1);
  sub_246461D00((uint64_t)v1);
}

uint64_t sub_246461B80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v13[3];
  uint64_t v14;

  v2 = a2 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  swift_beginAccess();
  sub_2464622D4(v2, (uint64_t)v13);
  v3 = v14;
  if (v14)
  {
    v4 = __swift_project_boxed_opaque_existential_0(v13, v14);
    v5 = *(_QWORD *)(v3 - 8);
    MEMORY[0x24BDAC7A8](v4, v4);
    v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0) + 16;
    (*(void (**)(char *))(v5 + 16))(v7);
    sub_24646236C((uint64_t)v13);
    v8 = sub_246465278();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  }
  else
  {
    sub_24646236C((uint64_t)v13);
    v8 = 0;
    v10 = 0xF000000000000000;
  }
  sub_246462654(v8, v10);
  sub_2464735B4(v8, v10);
  return sub_24646225C(v8, v10);
}

uint64_t sub_246461CB4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  OUTLINED_FUNCTION_2_4();
  return sub_2464622D4(v3, a1);
}

void sub_246461D00(uint64_t a1)
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

  v3 = v1 + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel;
  OUTLINED_FUNCTION_2_4();
  sub_24646231C(a1, v3);
  swift_endAccess();
  BSDispatchQueueAssertMain();
  OUTLINED_FUNCTION_17_0((uint64_t)sub_246462364, v4, v5, v6, v7, v8, v9, v10, v11);
  sub_24646236C(a1);
  OUTLINED_FUNCTION_4_2();
}

void sub_246461D6C(uint64_t a1)
{
  OUTLINED_FUNCTION_12_0(a1);
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246461DA4()
{
  sub_246461DB0();
}

void sub_246461DB0()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_14();
  if ((v0 & 1) == 0)
  {
    v1 = BSDispatchQueueAssertMain();
    MEMORY[0x24BDAC7A8](v1, v2);
    OUTLINED_FUNCTION_6_2();
  }
  OUTLINED_FUNCTION_13();
}

void sub_246461DF8(uint64_t a1, uint64_t a2)
{
  _BYTE *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  BSDispatchQueueAssertMain();
  if ((v2[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__inClientSettingsUpdate] & 1) != 0)
    goto LABEL_3;
  v5 = objc_msgSend(v2, sel__FBSScene);
  v6 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v7 + 16) = sub_2464626B0;
  *(_QWORD *)(v7 + 24) = v6;
  v8 = OUTLINED_FUNCTION_11_0((uint64_t)sub_246461F98, MEMORY[0x24BDAC760], 1107296256, v9, v10);
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_updateClientSettingsWithBlock_, v8);

  _Block_release(v8);
  swift_isEscapingClosureAtFileLocation();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_9_0();
  if ((v5 & 1) != 0)
    __break(1u);
  else
LABEL_3:
    OUTLINED_FUNCTION_8_2();
}

void sub_246461F20(void *a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  type metadata accessor for SnippetSceneMutableClientSettings();
  v4 = swift_dynamicCastClass();
  if (v4)
  {
    v5 = v4;
    v6 = a1;
    a2(v5);

  }
}

void sub_246461F98(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id SnippetScene.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetScene();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void (*sub_24646205C(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2464619D4;
}

void (*sub_2464620AC(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_246461B3C;
}

void (*sub_2464620FC(uint64_t a1))()
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_246461DA4;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24955BBDC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_246462188()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257579DF0;
  if (!qword_257579DF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257579DE8);
    result = MEMORY[0x24955BBE8](MEMORY[0x24BDB9CB0], v1);
    atomic_store(result, (unint64_t *)&qword_257579DF0);
  }
  return result;
}

uint64_t sub_2464621CC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_2464621F8(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_24646103C(*(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_246462204()
{
  swift_release();
  return swift_deallocObject();
}

void sub_246462228()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 32))();
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_246462248@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_246461098(a1, a2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_24646225C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_24645F708(a1, a2);
  return a1;
}

_OWORD *sub_246462270(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_246462280(void *a1)
{
  uint64_t v1;

  return sub_246461624(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_24646228C()
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

void sub_2464622C4(uint64_t a1)
{
  uint64_t v1;

  sub_24646188C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2464622CC(uint64_t a1)
{
  uint64_t v1;

  return sub_246461A08(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2464622D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24646231C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_246462364(uint64_t a1)
{
  uint64_t v1;

  return sub_246461B80(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24646236C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for SnippetScene()
{
  return objc_opt_self();
}

void sub_2464623CC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_2464618F4();
  *a1 = v2;
  OUTLINED_FUNCTION_1_2();
}

void sub_2464623F4(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_246461A6C();
  *a1 = v2;
  OUTLINED_FUNCTION_1_2();
}

void sub_24646241C(uint64_t a1@<X8>)
{
  sub_246461CB4(a1);
  OUTLINED_FUNCTION_1_2();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.resolvedMetrics.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.snippetSceneHostTouchRestrictedRects.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of SnippetSceneClientSettingsUpdating.viewModel.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t method lookup function for SnippetScene()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SnippetScene.subscript.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SnippetScene.observe<A>(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SnippetScene.loadViewModel<A>()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SnippetScene.updateClientSettings(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SnippetScene.updateClientSettingsWithTransitionContext(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SnippetScene.resolvedMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of SnippetScene.snippetSceneHostTouchRestrictedRects.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SnippetScene.viewModel.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

unint64_t sub_246462618()
{
  unint64_t result;

  result = qword_257579E68;
  if (!qword_257579E68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257579E68);
  }
  return result;
}

uint64_t sub_246462654(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_246462668(a1, a2);
  return a1;
}

uint64_t sub_246462668(uint64_t a1, unint64_t a2)
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

void sub_2464626B0(void *a1)
{
  uint64_t v1;

  sub_246461F20(a1, *(void (**)(uint64_t))(v1 + 16));
}

void sub_2464626BC()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 16))();
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_2464626D8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_allocObject();
}

void OUTLINED_FUNCTION_6_2()
{
  uint64_t v0;
  uint64_t v1;

  sub_246461DF8(v0, (uint64_t)&v1);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_isEscapingClosureAtFileLocation();
}

void *OUTLINED_FUNCTION_11_0@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_12_0(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(result + 24) = v1;
  return result;
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_endAccess();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  uint64_t v0;
  unint64_t v1;

  return sub_24646225C(v0, v1);
}

void OUTLINED_FUNCTION_17_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_246461DF8(a1, (uint64_t)&a9);
}

void OUTLINED_FUNCTION_18()
{
  JUMPOUT(0x24955BBE8);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t sub_246462838(uint64_t a1)
{
  char *v1;
  char *v2;
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
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
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
  __int128 v32;
  __int128 v33;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579F08);
  v27 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579F10);
  v30 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28, v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579F18);
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  v14 = (void *)sub_2464608E0();
  sub_2464645DC(&v33);

  v32 = v33;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F20);
  swift_allocObject();
  v26 = sub_246482134();
  v15 = *(id *)&v2[OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer];
  v16 = sub_246464318(a1);

  *(_QWORD *)&v33 = v16;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v2;
  *(_QWORD *)(v17 + 24) = a1;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_246464A08;
  *(_QWORD *)(v18 + 24) = v17;
  v19 = v2;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F28);
  sub_246465188(&qword_257579DF0, &qword_257579DE8);
  sub_2464821B8();
  swift_release();
  swift_release();
  sub_246465188(&qword_257579F30, &qword_257579F08);
  sub_246465188(&qword_257579F38, &qword_257579F20);
  v20 = sub_2464821D0();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v4);
  *(_QWORD *)&v33 = v20;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F40);
  sub_246465188(&qword_257579F48, &qword_257579F40);
  v21 = sub_246482140();
  swift_release();
  *(_QWORD *)&v33 = v21;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F50);
  sub_246465188(&qword_257579F58, &qword_257579F50);
  sub_2464821AC();
  swift_release();
  sub_246465188(&qword_257579F60, &qword_257579F10);
  sub_24646514C();
  v22 = v28;
  sub_2464821DC();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v22);
  sub_246465188(&qword_257579F70, &qword_257579F18);
  v23 = v29;
  v24 = sub_2464821A0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v23);
  return v24;
}

void sub_246462C34(_OWORD *a1@<X8>)
{
  id v2;

  v2 = (id)sub_2464608E0();
  sub_2464645DC(a1);

}

uint64_t sub_246462C74@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return sub_246462654(a1, a2);
}

void SiriSceneViewController.__allocating_init<A, B>(scene:rootView:modelType:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  objc_class *v9;
  id v10;

  v10 = objc_allocWithZone(v9);
  SiriSceneViewController.init<A, B>(scene:rootView:modelType:)();
}

void SiriSceneViewController.init<A, B>(scene:rootView:modelType:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_getObjectType();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E70);
  MEMORY[0x24BDAC7A8](v0, v1);
  OUTLINED_FUNCTION_2_5();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E78);
  MEMORY[0x24BDAC7A8](v3, v2);
  OUTLINED_FUNCTION_2_5();
  type metadata accessor for SnippetClientContext();
}

id sub_246462DE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  char *v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t KeyPath;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  _BYTE v46[96];

  sub_2464825D8();
  *(_QWORD *)(v6 - 272) = sub_2464822CC();
  v8 = sub_246482200();
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  *(_QWORD *)(v6 - 168) = *(_QWORD *)(v5 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = &v46[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12, v15);
  v17 = &v46[-v16];
  *(_QWORD *)&v4[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = 0;
  v18 = v4;
  v19 = (MEMORY[0x24BEE4AF8] & 0xC000000000000000) == 0;
  *(_QWORD *)(v6 - 176) = v2;
  *(_QWORD *)(v6 - 248) = v1;
  if (v19 || !sub_24648271C())
  {
    v20 = v3;
    v21 = MEMORY[0x24BEE4B08];
  }
  else
  {
    v20 = v3;
    v21 = sub_2464646CC(MEMORY[0x24BEE4AF8]);
  }
  *(_QWORD *)&v18[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_cancellables] = v21;
  swift_unknownObjectWeakInit();
  v22 = v17;
  v23 = (uint64_t)v17;
  *(_QWORD *)(v6 - 240) = v5;
  *(_QWORD *)(v6 - 232) = v17;
  v24 = *(void **)(v6 - 216);
  sub_2464610FC(v5, *(_QWORD *)(v6 - 264), *(_QWORD *)(v6 - 256), v23);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v6 - 168) + 16))(v14, v22, v5);
  v25 = v24;
  sub_24645D430((uint64_t)v24, (uint64_t)v14);
  v27 = v26;
  MEMORY[0x24955BBE8](&protocol conformance descriptor for SnippetClientContext<A>, a1);
  v28 = v20;
  v29 = *(_QWORD *)(v6 - 192);
  sub_246482308();
  v30 = MEMORY[0x24955BBE8](MEMORY[0x24BDF1028], *(_QWORD *)(v6 - 272));
  *(_QWORD *)(v6 - 136) = v29;
  *(_QWORD *)(v6 - 128) = v30;
  MEMORY[0x24955BBE8](MEMORY[0x24BDED308], v8, v6 - 136);
  v31 = sub_246482338();
  *(_QWORD *)(v6 - 216) = v31;
  *(_QWORD *)&v18[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_anyRootView] = v31;
  *(_QWORD *)(v6 - 256) = v25;
  swift_unknownObjectWeakAssign();
  swift_retain();

  v32 = *(_QWORD *)(v6 - 248);
  *(_QWORD *)(v6 - 152) = v18;
  *(_QWORD *)(v6 - 144) = v32;
  v33 = objc_msgSendSuper2((objc_super *)(v6 - 152), sel_initWithNibName_bundle_, 0, 0);
  KeyPath = swift_getKeyPath();
  *(_QWORD *)&v46[-16] = MEMORY[0x24BDAC7A8](KeyPath, v35);
  v36 = swift_getKeyPath();
  v37 = v33;
  v38 = sub_246462838(v36);
  swift_release();
  *(_QWORD *)(v6 - 120) = v38;
  sub_246464954(0, &qword_25757AB60);
  *(_QWORD *)(v6 - 160) = sub_246482548();
  v39 = sub_246482530();
  v40 = *(_QWORD *)(v6 - 224);
  __swift_storeEnumTagSinglePayload(v40, 1, 1, v39);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579EA0);
  sub_246465188(&qword_257579EA8, &qword_257579EA0);
  sub_2464633D8();
  v41 = *(_QWORD *)(v6 - 208);
  sub_2464821C4();
  sub_246463428(v40);

  swift_release();
  v42 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v43 = (_QWORD *)swift_allocObject();
  v43[2] = v28;
  v43[3] = v29;
  v43[4] = v42;
  v43[5] = v27;
  sub_246465188(&qword_257579EB8, &qword_257579E78);
  swift_retain();
  v44 = *(_QWORD *)(v6 - 184);
  sub_2464821E8();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 200) + 8))(v41, v44);
  swift_beginAccess();
  sub_2464820E0();
  swift_endAccess();
  swift_release();
  swift_release();

  swift_release();
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(*(_QWORD *)(v6 - 176), v28);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v6 - 168) + 8))(*(_QWORD *)(v6 - 232), *(_QWORD *)(v6 - 240));
  return v37;
}

uint64_t sub_2464632A8()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F88);
  return sub_2464823D4() & 1;
}

uint64_t sub_246463300()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F88);
  return sub_2464823C8();
}

void sub_246463344()
{
  sub_246482710();
  __break(1u);
}

void sub_24646339C()
{
  sub_246463344();
}

uint64_t sub_2464633A4()
{
  return 8;
}

uint64_t sub_2464633B0()
{
  return swift_release();
}

uint64_t sub_2464633B8(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_2464633CC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

unint64_t sub_2464633D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257579EB0;
  if (!qword_257579EB0)
  {
    v1 = sub_246464954(255, &qword_25757AB60);
    result = MEMORY[0x24955BBE8](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_257579EB0);
  }
  return result;
}

uint64_t sub_246463428(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257579E70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_246463468()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24646348C(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = *a1;
  v5 = a1[1];
  v6 = a2 + 16;
  swift_beginAccess();
  v7 = MEMORY[0x24955BD20](v6);
  if (v7)
  {
    v8 = (void *)v7;
    sub_246463534(v4, v5, a3);

  }
}

uint64_t sub_2464634FC()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_246463528(uint64_t *a1)
{
  uint64_t v1;

  sub_24646348C(a1, *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_246463534(uint64_t a1, unint64_t a2, uint64_t a3)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  int v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint8_t *v37;
  os_log_t v38;
  uint64_t v39;
  uint64_t v40;
  uint8_t *v42;
  os_log_t v43;
  uint8_t *v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v46 = a3;
  v5 = *(_QWORD *)(*(_QWORD *)a3 + 80);
  v6 = sub_2464825D8();
  v47 = *(_QWORD *)(v6 - 8);
  v48 = v6;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v42 - v9;
  v11 = *(_QWORD *)(v5 - 8);
  v13 = MEMORY[0x24BDAC7A8](v8, v12);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v16);
  v18 = (char *)&v42 - v17;
  sub_246481F78();
  swift_allocObject();
  sub_246481F6C();
  v19 = a1;
  v20 = a2;
  sub_246481F60();
  swift_release();
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v5);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v18, v10, v5);
  SnippetClientContext.viewModel.getter();
  v21 = sub_2464823D4();
  v22 = *(void (**)(char *, uint64_t))(v11 + 8);
  v22(v15, v5);
  v23 = v5;
  if ((v21 & 1) == 0)
  {
    if (qword_257579648 != -1)
      swift_once();
    v24 = sub_24648205C();
    __swift_project_value_buffer(v24, (uint64_t)qword_25757A4D8);
    v25 = v19;
    v26 = v19;
    v27 = v20;
    sub_246462668(v26, v20);
    sub_246462668(v25, v20);
    v28 = sub_246482044();
    v29 = sub_2464824E8();
    v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      v31 = swift_slowAlloc();
      v45 = v30;
      v32 = (uint8_t *)v31;
      v47 = swift_slowAlloc();
      v50 = v47;
      v48 = v11;
      v44 = v32;
      *(_DWORD *)v32 = 136315138;
      v42 = v32 + 4;
      sub_246462668(v25, v27);
      v33 = sub_246481FFC();
      v43 = v28;
      v34 = v33;
      v36 = v35;
      sub_24645F708(v25, v27);
      v49 = sub_24646CE94(v34, v36, &v50);
      v11 = v48;
      sub_2464825E4();
      swift_bridgeObjectRelease();
      sub_24645F708(v25, v27);
      sub_24645F708(v25, v27);
      v38 = v43;
      v37 = v44;
      _os_log_impl(&dword_24645B000, v43, (os_log_type_t)v45, "#SiriSceneViewController received model update from host: %s", v44, 0xCu);
      v39 = v47;
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v39, -1, -1);
      MEMORY[0x24955BC78](v37, -1, -1);

    }
    else
    {
      sub_24645F708(v25, v27);
      sub_24645F708(v25, v27);

    }
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v15, v18, v23);
    SnippetClientContext.viewModel.setter(v15, v40);
  }
  return ((uint64_t (*)(char *, uint64_t))v22)(v18, v23);
}

void sub_246463914()
{
  char *v0;
  unint64_t v1;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = 0;
  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_24648271C())
    v1 = sub_2464646CC(MEMORY[0x24BEE4AF8]);
  else
    v1 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_cancellables] = v1;
  swift_unknownObjectWeakInit();

  sub_246482710();
  __break(1u);
}

Swift::Void __swiftcall SiriSceneViewController.viewDidLoad()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)OUTLINED_FUNCTION_4_3();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  sub_246463A8C();
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

  }
  else
  {
    __break(1u);
  }
}

void sub_246463A8C()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  void *v44;

  v1 = v0;
  v2 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_257579EE8));
  swift_retain();
  v3 = (void *)sub_24648223C();
  objc_msgSend(v0, sel_addChildViewController_, v3);
  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_15;
  }
  v5 = v4;
  v6 = objc_msgSend(v3, sel_view);
  if (!v6)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v7 = v6;
  objc_msgSend(v5, sel_addSubview_, v6);

  objc_msgSend(v3, sel_didMoveToParentViewController_, v1);
  v8 = objc_msgSend(v3, sel_view);
  if (!v8)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v9 = v8;
  v10 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v9, sel_setBackgroundColor_, v10);

  v11 = objc_msgSend(v3, sel_view);
  if (!v11)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v12 = v11;
  objc_msgSend(v11, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257579E58);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_246483B40;
  v14 = objc_msgSend(v3, sel_view);
  if (!v14)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_centerXAnchor);

  v17 = objc_msgSend(v1, sel_view);
  if (!v17)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v18 = v17;
  v19 = objc_msgSend(v17, sel_centerXAnchor);

  v20 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v19);
  *(_QWORD *)(v13 + 32) = v20;
  v21 = objc_msgSend(v3, sel_view);
  if (!v21)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, sel_centerYAnchor);

  v24 = objc_msgSend(v1, sel_view);
  if (!v24)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_centerYAnchor);

  v27 = objc_msgSend(v23, sel_constraintEqualToAnchor_, v26);
  *(_QWORD *)(v13 + 40) = v27;
  v28 = objc_msgSend(v3, sel_view);
  if (!v28)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v29 = v28;
  v30 = objc_msgSend(v28, sel_widthAnchor);

  v31 = objc_msgSend(v1, sel_view);
  if (!v31)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_widthAnchor);

  v34 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v33);
  *(_QWORD *)(v13 + 48) = v34;
  v35 = objc_msgSend(v3, sel_view);
  if (!v35)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v36 = v35;
  v37 = objc_msgSend(v35, sel_heightAnchor);

  v38 = objc_msgSend(v1, sel_view);
  if (v38)
  {
    v39 = v38;
    v40 = (void *)objc_opt_self();
    v41 = objc_msgSend(v39, sel_heightAnchor);

    v42 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v41);
    *(_QWORD *)(v13 + 56) = v42;
    sub_246482458();
    sub_246464954(0, (unint64_t *)&qword_25757AA40);
    v43 = (void *)sub_246482434();
    swift_bridgeObjectRelease();
    objc_msgSend(v40, sel_activateConstraints_, v43);

    v44 = *(void **)&v1[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController];
    *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController] = v3;

    return;
  }
LABEL_25:
  __break(1u);
}

Swift::Void __swiftcall SiriSceneViewController.viewDidLayoutSubviews()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = v0;
  v5.super_class = (Class)OUTLINED_FUNCTION_4_3();
  objc_msgSendSuper2(&v5, sel_viewDidLayoutSubviews);
  v1 = MEMORY[0x24955BD20](&v0[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController__scene]);
  if (v1)
  {
    v3 = (void *)v1;
    v4 = (void *)MEMORY[0x24BDAC7A8](v1, v2);
    sub_246461390(v4, (void (*)(void *, _UNKNOWN **))sub_246464910);

  }
}

void sub_246464008(uint64_t a1, uint64_t a2, char *a3)
{
  void *v3;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  id v17;
  uint64_t ObjectType;
  uint64_t v19;
  void *v20;
  id v21;
  char v22;
  void (*v23)(id, uint64_t, uint64_t);
  id v24;
  id v25;

  v3 = *(void **)&a3[OBJC_IVAR____TtC15SiriInteractive23SiriSceneViewController_embeddedController];
  if (!v3)
  {
    __break(1u);
    goto LABEL_9;
  }
  v6 = objc_msgSend(v3, sel_view);
  if (!v6)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v7 = v6;
  objc_msgSend(v6, sel_intrinsicContentSize);
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(a3, sel_view);
  if (!v12)
  {
LABEL_10:
    __break(1u);
    return;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_layer);

  objc_msgSend(v14, sel_cornerRadius);
  v16 = v15;

  v17 = objc_allocWithZone((Class)type metadata accessor for SceneMetrics());
  v25 = SceneMetrics.init(size:cornerRadius:)(v9, v11, v16);
  ObjectType = swift_getObjectType();
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(ObjectType, a2);
  if (!v19
    || (v20 = (void *)v19,
        v21 = v25,
        v22 = sub_2464825C0(),
        v20,
        v21,
        (v22 & 1) == 0))
  {
    v23 = *(void (**)(id, uint64_t, uint64_t))(a2 + 16);
    v24 = v25;
    v23(v25, ObjectType, a2);
  }

}

id SiriSceneViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2464823E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void SiriSceneViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SiriSceneViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4_3();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_246464318(uint64_t a1)
{
  char *v1;
  void *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[6];

  v2 = v1;
  v4 = (uint64_t *)&v1[OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects];
  swift_beginAccess();
  v5 = *v4;
  swift_bridgeObjectRetain();
  v6 = swift_retain();
  v7 = sub_246464504(v6, v5);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v7)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
    swift_allocObject();
    v7 = sub_246482110();
    v8 = swift_allocObject();
    swift_weakInit();
    swift_beginAccess();
    v9 = qword_25757A670;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = sub_2464651E4;
    *(_QWORD *)(v10 + 24) = v8;
    v14[4] = sub_246465210;
    v14[5] = v10;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 1107296256;
    v14[2] = sub_24646D908;
    v14[3] = &block_descriptor_0;
    v11 = _Block_copy(v14);
    swift_retain_n();
    swift_release();
    objc_msgSend(v2, sel_observeOtherSetting_withBlock_, v9, v11);
    _Block_release(v11);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    v12 = swift_retain();
    sub_246464A10(v12, a1);
    swift_endAccess();
    swift_release();
  }
  return v7;
}

uint64_t sub_246464504(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  uint64_t v8;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v5 = sub_24647EC78(a1);
      if ((v6 & 1) != 0)
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v5);
        swift_retain();
        return v4;
      }
    }
    return 0;
  }
  swift_retain();
  v3 = sub_2464826EC();
  swift_release();
  if (!v3)
    return 0;
  swift_unknownObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
  swift_dynamicCast();
  v4 = v8;
  swift_unknownObjectRelease();
  return v4;
}

double sub_2464645DC@<D0>(_OWORD *a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  double result;
  __int128 v6;
  _OWORD v7[2];

  v3 = objc_msgSend(v1, sel_otherSettings);
  swift_beginAccess();
  v4 = objc_msgSend(v3, sel_objectForSetting_, qword_25757A670);

  if (v4)
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
    sub_246462270(&v6, v7);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  if ((swift_dynamicCast() & 1) == 0)
  {
    result = 0.0;
    *a1 = xmmword_246483AB0;
  }
  return result;
}

unint64_t sub_2464646CC(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;

  v1 = result;
  v2 = result >> 62;
  if (result >> 62)
  {
    OUTLINED_FUNCTION_0_5();
    v5 = sub_24648271C();
    result = OUTLINED_FUNCTION_1_4();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_257579EF0);
      result = sub_246482674();
      v3 = result;
      if (!v2)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if (*(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (!v2)
  {
LABEL_4:
    v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      goto LABEL_24;
    goto LABEL_9;
  }
LABEL_8:
  OUTLINED_FUNCTION_0_5();
  v4 = sub_24648271C();
  result = OUTLINED_FUNCTION_1_4();
  if (!v4)
  {
LABEL_24:
    OUTLINED_FUNCTION_1_4();
    return v3;
  }
LABEL_9:
  v6 = 0;
  v7 = v3 + 56;
  v21 = v1 & 0xC000000000000001;
  v18 = v1 + 32;
  v19 = v1 & 0xFFFFFFFFFFFFFF8;
  v20 = v1;
  while (1)
  {
    if (v21)
    {
      result = MEMORY[0x24955B5B8](v6, v1);
      v8 = result;
    }
    else
    {
      if (v6 >= *(_QWORD *)(v19 + 16))
        goto LABEL_27;
      v8 = *(_QWORD *)(v18 + 8 * v6);
      result = swift_retain();
    }
    v9 = __OFADD__(v6++, 1);
    if (v9)
      break;
    sub_2464820EC();
    sub_24646498C(&qword_257579EF8);
    result = sub_2464823BC();
    v10 = -1 << *(_BYTE *)(v3 + 32);
    v11 = result & ~v10;
    v12 = v11 >> 6;
    v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
    v14 = 1 << v11;
    if (((1 << v11) & v13) != 0)
    {
      v15 = ~v10;
      sub_24646498C(&qword_257579F00);
      while (1)
      {
        result = sub_2464823D4();
        if ((result & 1) != 0)
          break;
        v11 = (v11 + 1) & v15;
        v12 = v11 >> 6;
        v13 = *(_QWORD *)(v7 + 8 * (v11 >> 6));
        v14 = 1 << v11;
        if ((v13 & (1 << v11)) == 0)
        {
          v1 = v20;
          goto LABEL_20;
        }
      }
      result = swift_release();
      v1 = v20;
    }
    else
    {
LABEL_20:
      *(_QWORD *)(v7 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v8;
      v16 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v16, 1);
      v17 = v16 + 1;
      if (v9)
        goto LABEL_26;
      *(_QWORD *)(v3 + 16) = v17;
    }
    if (v6 == v4)
      goto LABEL_24;
  }
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

void sub_246464910(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_246464008(a1, a2, *(char **)(v2 + 16));
}

uint64_t type metadata accessor for SiriSceneViewController()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriSceneViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriSceneViewController.__allocating_init<A, B>(scene:rootView:modelType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_246464954(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24646498C(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    sub_2464820EC();
    OUTLINED_FUNCTION_3_3();
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2464649DC()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_246464A08(_OWORD *a1@<X8>)
{
  sub_246462C34(a1);
}

uint64_t sub_246464A10(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_24648262C();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_246464AB0(v7, result + 1);
LABEL_7:
    swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    *v3 = 0x8000000000000000;
    sub_246464FD4(a1, a2);
    *v3 = v9;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_246464AB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F80);
  v2 = sub_246482734();
  v17 = v2;
  sub_2464826D4();
  v3 = sub_2464826F8();
  if (!v3)
  {
LABEL_15:
    swift_release();
    return v2;
  }
  while (1)
  {
    v15 = v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
    swift_dynamicCast();
    v4 = *(_QWORD *)(v2 + 16);
    if (*(_QWORD *)(v2 + 24) <= v4)
    {
      sub_246464CD4(v4 + 1, 1);
      v2 = v17;
    }
    result = sub_2464823BC();
    v6 = v2 + 64;
    v7 = -1 << *(_BYTE *)(v2 + 32);
    v8 = result & ~v7;
    v9 = v8 >> 6;
    if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) == 0)
      break;
    v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
LABEL_14:
    *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v10) = v16;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v10) = v15;
    ++*(_QWORD *)(v2 + 16);
    v3 = sub_2464826F8();
    if (!v3)
      goto LABEL_15;
  }
  v11 = 0;
  v12 = (unint64_t)(63 - v7) >> 6;
  while (++v9 != v12 || (v11 & 1) == 0)
  {
    v13 = v9 == v12;
    if (v9 == v12)
      v9 = 0;
    v11 |= v13;
    v14 = *(_QWORD *)(v6 + 8 * v9);
    if (v14 != -1)
    {
      v10 = __clz(__rbit64(~v14)) + (v9 << 6);
      goto LABEL_14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_246464CD4(uint64_t a1, char a2)
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
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  char v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F80);
  v33 = a2;
  v6 = sub_246482728();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v32 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v31 = (unint64_t)(v8 + 63) >> 6;
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
    v20 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * i);
    v21 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
    if ((v33 & 1) == 0)
    {
      swift_retain();
      swift_retain();
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
    result = sub_2464823BC();
    v22 = -1 << *(_BYTE *)(v7 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
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
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v11 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v11 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v25) = v20;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v25) = v21;
    ++*(_QWORD *)(v7 + 16);
    if (v10)
      goto LABEL_6;
LABEL_7:
    v16 = v13 + 1;
    if (__OFADD__(v13, 1))
      goto LABEL_41;
    if (v16 >= v31)
    {
      swift_release();
      v17 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v17 = (_QWORD *)(v5 + 64);
    v18 = *(_QWORD *)(v32 + 8 * v16);
    ++v13;
    if (!v18)
    {
      v13 = v16 + 1;
      if (v16 + 1 >= v31)
        goto LABEL_32;
      v18 = *(_QWORD *)(v32 + 8 * v13);
      if (!v18)
        break;
    }
LABEL_18:
    v10 = (v18 - 1) & v18;
  }
  v19 = v16 + 2;
  if (v19 < v31)
  {
    v18 = *(_QWORD *)(v32 + 8 * v19);
    if (!v18)
    {
      while (1)
      {
        v13 = v19 + 1;
        if (__OFADD__(v19, 1))
          goto LABEL_42;
        if (v13 >= v31)
          goto LABEL_32;
        v18 = *(_QWORD *)(v32 + 8 * v13);
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
LABEL_34:
  if ((v33 & 1) != 0)
  {
    v30 = 1 << *(_BYTE *)(v5 + 32);
    if (v30 >= 64)
      sub_24647EE84(0, (unint64_t)(v30 + 63) >> 6, v17);
    else
      *v17 = -1 << v30;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_246464FD4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t result;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_24647EC78(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579F78);
  if ((sub_2464826BC() & 1) == 0)
    goto LABEL_5;
  v11 = sub_24647EC78(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
    result = sub_246482794();
    __break(1u);
    return result;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) != 0)
  {
    v14 = v13[7];
    result = swift_release();
    *(_QWORD *)(v14 + 8 * v9) = a1;
  }
  else
  {
    sub_2464650DC(v9, a2, a1, v13);
    return swift_retain();
  }
  return result;
}

unint64_t sub_2464650DC(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

uint64_t sub_246465120()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_246465140@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_246462C74(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), a2);
}

unint64_t sub_24646514C()
{
  unint64_t result;

  result = qword_257579F68;
  if (!qword_257579F68)
  {
    result = MEMORY[0x24955BBE8](MEMORY[0x24BDCDE20], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257579F68);
  }
  return result;
}

uint64_t sub_246465188(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_3_3();
  }
  return result;
}

uint64_t sub_2464651C0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2464651E4()
{
  return sub_24646799C();
}

uint64_t sub_2464651EC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_246465210(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24646DA4C(a1, a2, *(void (**)(void))(v2 + 16));
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

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_3_3()
{
  JUMPOUT(0x24955BBE8);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_getObjectType();
}

uint64_t sub_246465278()
{
  uint64_t v0;

  sub_246481F9C();
  swift_allocObject();
  sub_246481F90();
  v0 = sub_246481F84();
  swift_release();
  return v0;
}

uint64_t static Feature.isEnabled(_:)()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for Feature;
  v4 = sub_24645D944();
  v0 = sub_246482038();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

const char *Feature.domain.getter()
{
  return "SiriInteractive";
}

const char *Feature.feature.getter()
{
  return "nativeHosting";
}

uint64_t static Feature.== infix(_:_:)()
{
  return 1;
}

uint64_t Feature.hash(into:)()
{
  return sub_2464827F4();
}

uint64_t Feature.hashValue.getter()
{
  sub_2464827E8();
  sub_2464827F4();
  return sub_24648280C();
}

uint64_t sub_2464654B0()
{
  return 1;
}

unint64_t sub_2464654BC()
{
  unint64_t result;

  result = qword_257579F90;
  if (!qword_257579F90)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for Feature, &type metadata for Feature);
    atomic_store(result, (unint64_t *)&qword_257579F90);
  }
  return result;
}

uint64_t sub_2464654F8()
{
  return Feature.hashValue.getter();
}

uint64_t sub_24646550C()
{
  return Feature.hash(into:)();
}

uint64_t sub_246465520()
{
  sub_2464827E8();
  sub_2464827F4();
  return sub_24648280C();
}

const char *sub_24646555C()
{
  return "SiriInteractive";
}

const char *sub_246465570()
{
  return "nativeHosting";
}

uint64_t getEnumTagSinglePayload for Feature(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Feature(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_246465618 + 4 * byte_246483BC8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_246465638 + 4 * byte_246483BCD[v4]))();
}

_BYTE *sub_246465618(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_246465638(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246465640(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246465648(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_246465650(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_246465658(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_246465664()
{
  return 0;
}

ValueMetadata *type metadata accessor for Feature()
{
  return &type metadata for Feature;
}

void sub_246465680(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
}

id sub_2464656AC()
{
  return OUTLINED_FUNCTION_9_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
}

void sub_246465700(void *a1)
{
  sub_246465808(a1, (void (*)())sub_246465680);
}

void sub_24646570C(id *a1)
{
  sub_246465700(*a1);
}

void sub_246465734(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_1_2();
}

void sub_246465770(void **a1, char a2)
{
  sub_2464658F8(a1, a2, (void (*)(void))sub_246465700);
}

void sub_24646577C(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
}

id sub_2464657A8()
{
  return OUTLINED_FUNCTION_9_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
}

void sub_2464657FC(void *a1)
{
  sub_246465808(a1, (void (*)())sub_24646577C);
}

void sub_246465808(void *a1, void (*a2)())
{
  objc_msgSend(a1, sel_copy);
  sub_2464825FC();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_2_6();
  swift_dynamicCast();
  a2();

}

void sub_246465888(id *a1)
{
  sub_2464657FC(*a1);
}

void sub_2464658B0(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  *a1 = v2;
  a1[1] = v1;
  v3 = v2;
  OUTLINED_FUNCTION_1_2();
}

void sub_2464658EC(void **a1, char a2)
{
  sub_2464658F8(a1, a2, (void (*)(void))sub_2464657FC);
}

void sub_2464658F8(void **a1, char a2, void (*a3)(void))
{
  void *v4;
  id v5;

  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    v5 = v4;
    a3();

  }
  else
  {
    ((void (*)(void *))a3)(v4);
  }
}

double sub_246465970()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius;
  OUTLINED_FUNCTION_1_5();
  return *(double *)v1;
}

uint64_t sub_2464659CC(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

void sub_246465A1C()
{
  swift_beginAccess();
  OUTLINED_FUNCTION_1_2();
}

double sub_246465A80()
{
  uint64_t v0;
  double v1;

  v1 = *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
  sub_24645DED8(200.0);
  return v1;
}

double sub_246465AFC()
{
  uint64_t v0;

  return *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                   + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum);
}

id SceneItemMetricsRequest.__allocating_init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  OUTLINED_FUNCTION_5_0();
  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(a1, a2, a3);
}

id SceneItemMetricsRequest.init(width:height:cornerRadius:)(void *a1, void *a2, double a3)
{
  void *v3;
  char *v7;
  id v8;
  objc_super v10;
  uint64_t v11;

  v7 = v3;
  objc_msgSend(a1, sel_copy);
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_5_3();
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v11;
  objc_msgSend(a2, sel_copy);
  sub_2464825FC();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_5_3();
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v11;
  *(double *)&v7[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = a3;

  v10.receiver = v7;
  v10.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  v8 = objc_msgSendSuper2(&v10, sel_init);

  return v8;
}

uint64_t type metadata accessor for SceneItemMetricsRequest()
{
  return objc_opt_self();
}

BOOL sub_246465CE0()
{
  uint64_t v0;
  double *v1;

  if (*(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) != 0.0
    || *(double *)(*(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest)
                 + OBJC_IVAR____TtC15SiriInteractive20SizeDimensionRequest_maximum) != 0.0)
  {
    return 1;
  }
  v1 = (double *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  OUTLINED_FUNCTION_1_5();
  return *v1 != 0.0;
}

id sub_246465D8C()
{
  objc_class *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_6();
  v1 = objc_allocWithZone(v0);
  v2 = OUTLINED_FUNCTION_0_6();
  v3 = objc_allocWithZone(v0);
  v4 = OUTLINED_FUNCTION_0_6();
  v5 = objc_allocWithZone((Class)type metadata accessor for SceneItemMetricsRequest());
  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(v2, v4, 0.0);
}

uint64_t sub_246465E1C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double *v6;
  double v7;

  result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest), sel_hash);
  if (result >= 1)
    v2 = 1;
  else
    v2 = result;
  v3 = 31 * v2;
  if ((unsigned __int128)(v2 * (__int128)31) >> 64 != (31 * v2) >> 63)
  {
    __break(1u);
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = (uint64_t)objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest), sel_hash);
  if (result >= 1)
    v4 = 1;
  else
    v4 = result;
  v5 = v3 * v4;
  if ((unsigned __int128)(v3 * (__int128)v4) >> 64 != (v3 * v4) >> 63)
    goto LABEL_17;
  v6 = (double *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  result = OUTLINED_FUNCTION_1_5();
  v7 = *v6;
  if (*v6 > 1.0)
    v7 = 1.0;
  if ((~*(_QWORD *)&v7 & 0x7FF0000000000000) == 0)
    goto LABEL_18;
  if (v7 <= -9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v7 >= 9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  result = v5 * (uint64_t)v7;
  if ((unsigned __int128)(v5 * (__int128)(uint64_t)v7) >> 64 != result >> 63)
LABEL_21:
    __break(1u);
  return result;
}

BOOL sub_246465F2C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  char v6;
  id v7;
  id v8;
  char v9;
  double *v10;
  double v11;
  double *v12;
  double v13;
  char *v15;
  _BYTE v16[24];
  uint64_t v17;

  v3 = v1;
  sub_24645E100(a1, (uint64_t)v16);
  if (v17)
  {
    type metadata accessor for SceneItemMetricsRequest();
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_246460070();
      v4 = OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
      v5 = v2;
      v6 = OUTLINED_FUNCTION_14_0();

      if ((v6 & 1) != 0)
      {
        v7 = OUTLINED_FUNCTION_16_1(OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
        v8 = v2;
        v9 = OUTLINED_FUNCTION_14_0();

        if ((v9 & 1) != 0)
        {
          v10 = (double *)(v3 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
          OUTLINED_FUNCTION_1_5();
          v11 = *v10;
          v12 = (double *)&v15[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius];
          OUTLINED_FUNCTION_1_5();
          v13 = *v12;

          return v11 == v13;
        }
      }

    }
  }
  else
  {
    sub_24645E148((uint64_t)v16);
  }
  return 0;
}

id sub_246466120()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  id v11;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE08]), sel_initWithObject_, v0);
  if (result)
  {
    v2 = result;
    OUTLINED_FUNCTION_17_1();

    OUTLINED_FUNCTION_15_0();
    v9 = (double *)(v0 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
    OUTLINED_FUNCTION_1_5();

    result = (id)sub_24645EA0C(v2);
    if (v10)
    {
      v11 = result;

      return v11;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_246466210(uint64_t result)
{
  if (result)
  {
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();
    OUTLINED_FUNCTION_1_5();
    return BSSerializeDoubleToXPCDictionaryWithKey();
  }
  return result;
}

id SceneItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  OUTLINED_FUNCTION_5_0();
  return SceneItemMetricsRequest.init(xpcDictionary:)();
}

id SceneItemMetricsRequest.init(xpcDictionary:)()
{
  void *v0;
  char *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[24];
  uint64_t v22;

  v1 = v0;
  v2 = (id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v2)
  {
    OUTLINED_FUNCTION_8_3();
    v2 = (id)OUTLINED_FUNCTION_20_0();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  OUTLINED_FUNCTION_18_0((uint64_t)v2, v3, v4, v5);
  if (v22)
  {
    OUTLINED_FUNCTION_2_6();
    if (OUTLINED_FUNCTION_6_3())
    {
      v6 = v17;
      goto LABEL_9;
    }
  }
  else
  {
    sub_24645E148((uint64_t)v21);
  }
  v7 = objc_allocWithZone((Class)OUTLINED_FUNCTION_2_6());
  v6 = OUTLINED_FUNCTION_0_6();
LABEL_9:
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v6;
  v8 = (id)BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey();
  if (v8)
  {
    OUTLINED_FUNCTION_8_3();
    v8 = (id)OUTLINED_FUNCTION_20_0();
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
  }
  OUTLINED_FUNCTION_18_0((uint64_t)v8, v9, v10, v11);
  if (!v22)
  {
    sub_24645E148((uint64_t)v21);
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_2_6();
  if (!OUTLINED_FUNCTION_6_3())
  {
LABEL_16:
    v13 = objc_allocWithZone((Class)OUTLINED_FUNCTION_2_6());
    v12 = OUTLINED_FUNCTION_0_6();
    goto LABEL_17;
  }
  v12 = v17;
LABEL_17:
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v12;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = v14;

  v18.receiver = v1;
  v18.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  v15 = objc_msgSendSuper2(&v18, sel_init);
  swift_unknownObjectRelease();
  return v15;
}

void sub_2464664B0(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  double *v5;
  double v6;
  objc_class *v7;
  id v8;
  id v9;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  v4 = *(void **)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  v5 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  OUTLINED_FUNCTION_1_5();
  v6 = *v5;
  v7 = (objc_class *)type metadata accessor for SceneItemMetricsRequest();
  v8 = objc_allocWithZone(v7);
  v9 = SceneItemMetricsRequest.init(width:height:cornerRadius:)(v3, v4, v6);
  a1[3] = v7;
  *a1 = v9;
  OUTLINED_FUNCTION_4_4();
}

uint64_t static SceneItemMetricsRequest.supportsSecureCoding.getter()
{
  return 1;
}

void sub_2464665AC(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  double *v7;
  double v8;
  void *v9;

  v3 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest);
  v4 = (void *)sub_2464823E0();
  OUTLINED_FUNCTION_10_1();

  v5 = *(id *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest);
  v6 = (void *)sub_2464823E0();
  OUTLINED_FUNCTION_10_1();

  v7 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius);
  OUTLINED_FUNCTION_1_5();
  v8 = *v7;
  v9 = (void *)OUTLINED_FUNCTION_3_4();
  objc_msgSend(a1, sel_encodeDouble_forKey_, v9, v8);

  OUTLINED_FUNCTION_4_4();
}

id SceneItemMetricsRequest.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_5_0();
  return SceneItemMetricsRequest.init(coder:)(a1);
}

id SceneItemMetricsRequest.init(coder:)(void *a1)
{
  void *v1;
  objc_class *v3;
  char *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v3 = (objc_class *)OUTLINED_FUNCTION_2_6();
  v4 = v1;
  OUTLINED_FUNCTION_17_1();
  v5 = OUTLINED_FUNCTION_21_0();
  if (!v5)
  {
    v6 = objc_allocWithZone(v3);
    v5 = (uint64_t)OUTLINED_FUNCTION_0_6();
  }
  *(_QWORD *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest] = v5;
  OUTLINED_FUNCTION_15_0();
  v7 = OUTLINED_FUNCTION_21_0();
  if (!v7)
  {
    v8 = objc_allocWithZone(v3);
    v7 = (uint64_t)OUTLINED_FUNCTION_0_6();
  }
  *(_QWORD *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest] = v7;
  v9 = (void *)OUTLINED_FUNCTION_3_4();
  objc_msgSend(a1, sel_decodeDoubleForKey_, v9);
  v11 = v10;

  *(_QWORD *)&v4[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius] = v11;
  v14.receiver = v4;
  v14.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  v12 = objc_msgSendSuper2(&v14, sel_init);

  return v12;
}

id SceneItemMetricsRequest.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_5_0(), sel_init);
}

void SceneItemMetricsRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SceneItemMetricsRequest.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneItemMetricsRequest();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2464668D4()
{
  id *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_2464656AC();
  OUTLINED_FUNCTION_1_2();
}

void sub_2464668F4()
{
  id *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_2464657A8();
  OUTLINED_FUNCTION_1_2();
}

void sub_246466914()
{
  double *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_246465970();
  OUTLINED_FUNCTION_1_2();
}

void sub_246466930(double *a1)
{
  sub_2464659CC(*a1);
  OUTLINED_FUNCTION_1_2();
}

uint64_t method lookup function for SceneItemMetricsRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.widthRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.heightRequest.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.initialSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.maximumSize.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(width:height:cornerRadius:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 240))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.isValid()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of static SceneItemMetricsRequest.empty()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 272))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.copy(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of SceneItemMetricsRequest.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 296))();
}

id OUTLINED_FUNCTION_0_6()
{
  return SizeDimensionRequest.init(minimum:maximum:type:)(1, 0.0, 0.0);
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  return type metadata accessor for SizeDimensionRequest();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return sub_2464823E0();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_7_2(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v3;

  v3 = *(void **)(v2 + a2);
  *(_QWORD *)(v2 + a2) = a1;

}

uint64_t OUTLINED_FUNCTION_8_3()
{
  return sub_2464825FC();
}

id OUTLINED_FUNCTION_9_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

id OUTLINED_FUNCTION_10_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, (SEL)(v3 + 328), v1, v2);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  return sub_2464825C0();
}

id OUTLINED_FUNCTION_16_1@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return *(id *)(v1 + a1);
}

uint64_t OUTLINED_FUNCTION_18_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  uint64_t v5;
  va_list va;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v5 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  return sub_24645F6C0((uint64_t)va, (uint64_t)va1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_24648259C();
}

id SceneMetrics.__allocating_init(size:cornerRadius:)(double a1, double a2, double a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return SceneMetrics.init(size:cornerRadius:)(a1, a2, a3);
}

double sub_246466CC8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size;
  OUTLINED_FUNCTION_1_5();
  return *(double *)v1;
}

void sub_246466D24(double a1, double a2)
{
  uint64_t v2;
  double *v5;

  v5 = (double *)(v2 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size);
  OUTLINED_FUNCTION_2_4();
  *v5 = a1;
  v5[1] = a2;
  OUTLINED_FUNCTION_4_5();
}

void sub_246466D68(double *a1)
{
  sub_246466D24(*a1, a1[1]);
}

uint64_t (*sub_246466D8C())()
{
  OUTLINED_FUNCTION_2_4();
  return j_j__swift_endAccess;
}

double sub_246466DEC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius;
  OUTLINED_FUNCTION_1_5();
  return *(double *)v1;
}

void sub_246466E48(double a1)
{
  uint64_t v1;
  double *v3;

  v3 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius);
  OUTLINED_FUNCTION_2_4();
  *v3 = a1;
  OUTLINED_FUNCTION_4_5();
}

uint64_t (*sub_246466E88())()
{
  OUTLINED_FUNCTION_2_4();
  return j__swift_endAccess;
}

id SceneMetrics.__allocating_init(xpcDictionary:)()
{
  OUTLINED_FUNCTION_5_0();
  return SceneMetrics.init(xpcDictionary:)();
}

id SceneMetrics.init(xpcDictionary:)()
{
  void *v0;
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  objc_super v14;

  v1 = v0;
  BSDeserializeCGSizeFromXPCDictionaryWithKey();
  v2 = &v1[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *(_QWORD *)v2 = v3;
  *((_QWORD *)v2 + 1) = v4;
  BSDeserializeDoubleFromXPCDictionaryWithKey();
  *(_QWORD *)&v1[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = v5;

  v14.receiver = v1;
  v14.super_class = (Class)type metadata accessor for SceneMetrics();
  v12 = OUTLINED_FUNCTION_6_0((uint64_t)v14.super_class, sel_init, v6, v7, v8, v9, v10, v11, v14);
  swift_unknownObjectRelease();
  return v12;
}

uint64_t sub_246466FB4(uint64_t result)
{
  if (result)
  {
    OUTLINED_FUNCTION_1_5();
    BSSerializeCGSizeToXPCDictionaryWithKey();
    OUTLINED_FUNCTION_1_5();
    return BSSerializeDoubleToXPCDictionaryWithKey();
  }
  return result;
}

id SceneMetrics.init(size:cornerRadius:)(double a1, double a2, double a3)
{
  char *v3;
  double *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v4 = (double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *v4 = a1;
  v4[1] = a2;
  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = a3;
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for SceneMetrics();
  return OUTLINED_FUNCTION_6_0((uint64_t)v12.super_class, sel_init, v5, v6, v7, v8, v9, v10, v12);
}

uint64_t type metadata accessor for SceneMetrics()
{
  return objc_opt_self();
}

uint64_t static SceneMetrics.supportsSecureCoding.getter()
{
  return 1;
}

void sub_246467128(void *a1)
{
  uint64_t v1;
  double *v3;
  double v4;
  double v5;
  void *v6;
  double *v7;
  void *v8;
  double v9;

  v3 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size);
  OUTLINED_FUNCTION_1_5();
  v5 = *v3;
  v4 = v3[1];
  v6 = (void *)OUTLINED_FUNCTION_3_5();
  objc_msgSend(a1, sel_encodeCGSize_forKey_, v6, v5, v4);

  v7 = (double *)(v1 + OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius);
  OUTLINED_FUNCTION_1_5();
  *(float *)&v4 = *v7;
  v8 = (void *)OUTLINED_FUNCTION_3_4();
  LODWORD(v9) = LODWORD(v4);
  objc_msgSend(a1, sel_encodeFloat_forKey_, v8, v9);

}

id SceneMetrics.__allocating_init(coder:)(void *a1)
{
  OUTLINED_FUNCTION_5_0();
  return SceneMetrics.init(coder:)(a1);
}

id SceneMetrics.init(coder:)(void *a1)
{
  void *v1;
  char *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  objc_super v20;

  v3 = v1;
  v4 = (void *)OUTLINED_FUNCTION_3_5();
  objc_msgSend(a1, sel_decodeCGSizeForKey_, v4);
  v6 = v5;
  v8 = v7;

  v9 = &v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
  *(_QWORD *)v9 = v6;
  *((_QWORD *)v9 + 1) = v8;
  v10 = (void *)OUTLINED_FUNCTION_3_4();
  objc_msgSend(a1, sel_decodeFloatForKey_, v10);
  LODWORD(v6) = v11;

  *(double *)&v3[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_cornerRadius] = *(float *)&v6;
  v20.receiver = v3;
  v20.super_class = (Class)type metadata accessor for SceneMetrics();
  v18 = OUTLINED_FUNCTION_6_0((uint64_t)v20.super_class, sel_init, v12, v13, v14, v15, v16, v17, v20);

  return v18;
}

id SceneMetrics.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_5_0(), sel_init);
}

void SceneMetrics.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SceneMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2464673D8(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(double *)a1 = sub_246466CC8();
  *(_QWORD *)(a1 + 8) = v2;
  OUTLINED_FUNCTION_1_2();
}

void sub_246467400(double *a1@<X8>)
{
  *a1 = sub_246466DEC();
  OUTLINED_FUNCTION_1_2();
}

void sub_246467424(double *a1)
{
  sub_246466E48(*a1);
  OUTLINED_FUNCTION_1_2();
}

uint64_t method lookup function for SceneMetrics()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SceneMetrics.size.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of SceneMetrics.size.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SceneMetrics.size.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SceneMetrics.cornerRadius.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(xpcDictionary:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of SceneMetrics.encode(withXPCDictionary:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(size:cornerRadius:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of SceneMetrics.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SceneMetrics.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return sub_2464823E0();
}

uint64_t SnippetHostingContext.onReceiveActionFromClient.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_onReceiveActionFromClient;
  v4 = OUTLINED_FUNCTION_2_7();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t SnippetHostingContext.sendAction(_:)(uint64_t result)
{
  uint64_t v1;
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  if (v2)
  {
    v3 = result;
    swift_retain();
    v2(v3);
    return sub_246467610((uint64_t)v2);
  }
  return result;
}

uint64_t sub_246467610(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t SnippetHostingContext.deinit()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_7(v1);
  OUTLINED_FUNCTION_1_6(OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  return v0;
}

uint64_t SnippetHostingContext.__deallocating_deinit()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_7(v0);
  OUTLINED_FUNCTION_1_6(OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  return swift_deallocClassInstance();
}

uint64_t sub_2464676A4()
{
  return type metadata accessor for SnippetHostingContext();
}

uint64_t type metadata accessor for SnippetHostingContext()
{
  uint64_t result;

  result = qword_25757A040;
  if (!qword_25757A040)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2464676E4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24648256C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for SnippetHostingContext()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_246467764()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_257579618 != -1)
    swift_once();
  sub_246482578();

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive21SnippetHostingContext_actionHandler);
  *v3 = 0;
  v3[1] = 0;
  return v1;
}

uint64_t OUTLINED_FUNCTION_1_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_246467610(*(_QWORD *)(v1 + a1));
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return sub_24648256C();
}

uint64_t sub_24646781C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;

  v3 = v2;
  v6 = *a1;
  v7 = (uint64_t *)(v2 + OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects);
  OUTLINED_FUNCTION_1_5();
  v8 = *v7;
  swift_bridgeObjectRetain();
  v9 = swift_retain();
  v10 = sub_246464504(v9, v8);
  swift_release();
  swift_bridgeObjectRelease();
  if (!v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
    swift_allocObject();
    v10 = sub_246482110();
    v11 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + v6 + 8);
    v12 = swift_allocObject();
    swift_weakInit();
    v13 = *(_QWORD *)(a2 + 8);
    v14 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 24);
    v15 = type metadata accessor for SettingsDiffer();
    swift_retain();
    v14(v3, sub_2464651E4, v12, v15, v11, v13);
    swift_release_n();
    swift_beginAccess();
    swift_retain();
    v16 = swift_retain();
    sub_246464A10(v16, (uint64_t)a1);
    swift_endAccess();
    swift_release();
  }
  return v10;
}

uint64_t sub_24646799C()
{
  uint64_t result;

  OUTLINED_FUNCTION_1_5();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_246482104();
    return swift_release();
  }
  return result;
}

void sub_2464679E8(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = v3;
    sub_246462618();
    v6 = a3;
    v7[0] = (id)sub_2464825CC();
    objc_msgSend(v4, sel_inspectDiff_withContext_, v6, v7);

  }
}

id sub_246467B3C()
{
  char *v0;
  uint64_t v1;
  char *v2;
  objc_super v4;

  v1 = OBJC_IVAR____TtC15SiriInteractive14SettingsDiffer_subjects;
  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579DE8);
  *(_QWORD *)&v0[v1] = sub_2464823A4();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for SettingsDiffer();
  return objc_msgSendSuper2(&v4, sel_init);
}

id sub_246467BEC()
{
  return sub_246467D54(type metadata accessor for SettingsDiffer);
}

uint64_t type metadata accessor for SettingsDiffer()
{
  return objc_opt_self();
}

void sub_246467C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = sub_246467DD0;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_24646D908;
  v9[3] = &block_descriptor_1;
  v8 = _Block_copy(v9);
  sub_246467E10(a2);
  swift_release();
  objc_msgSend(v3, sel_observeOtherSetting_withBlock_, a1, v8);
  _Block_release(v8);
}

id sub_246467CF8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_246467D48()
{
  return sub_246467D54(type metadata accessor for SnippetSceneClientSettingsDiffInspector);
}

id sub_246467D54(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SnippetSceneClientSettingsDiffInspector()
{
  return objc_opt_self();
}

uint64_t sub_246467DA4()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_246467DD0()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t result;

  v1 = *(uint64_t (**)(void))(v0 + 16);
  if (v1)
    return v1();
  return result;
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

uint64_t sub_246467E10(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_246467E20()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A138 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_7_3();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.setter()
{
  OUTLINED_FUNCTION_6_4();
}

void static SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A150 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246467FD0()
{
  qword_25757A158 = 0x6F6C6F4374786574;
  unk_25757A160 = 0xE900000000000072;
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.getter()
{
  sub_246468300(&qword_257579630);
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  sub_246468374(a1, a2, &qword_257579630);
}

void static SceneClientSettingScopes.SnippetSceneSettings.TextColorKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_13_2();
  if (qword_257579630 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A168 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_24646813C()
{
  strcpy((char *)&qword_25757A170, "viewModelData");
  *(_WORD *)&algn_25757A178[6] = -4864;
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.getter()
{
  sub_246468300(&qword_257579638);
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  sub_246468374(a1, a2, &qword_257579638);
}

void static SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_13_2();
  if (qword_257579638 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A180 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_2464682B0()
{
  qword_25757A188 = 0x6465766C6F736572;
  unk_25757A190 = 0xEF7363697274654DLL;
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.getter()
{
  sub_246468300(&qword_257579640);
}

void sub_246468300(_QWORD *a1)
{
  if (*a1 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  sub_246468374(a1, a2, &qword_257579640);
}

void sub_246468374(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_4();
}

void static SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_13_2();
  if (qword_257579640 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A198 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_7_3();
}

void sub_2464684E0()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_9_2();
  OUTLINED_FUNCTION_22();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.setter()
{
  OUTLINED_FUNCTION_6_4();
}

void sub_246468524()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_8_4();
}

void static SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_2464685B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25757A1B0;
  if (!qword_25757A1B0)
  {
    sub_246468CA8(255, &qword_25757A1B8);
    result = MEMORY[0x24955BBE8](MEMORY[0x24BEE5BE0], v1);
    atomic_store(result, (unint64_t *)&qword_25757A1B0);
  }
  return result;
}

unint64_t sub_24646860C()
{
  return sub_246468638();
}

unint64_t sub_246468638()
{
  unint64_t *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  unint64_t *v3;
  unint64_t result;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_13_2();
  result = *v3;
  if (!result)
  {
    v5 = v2;
    v6 = v1(255);
    result = MEMORY[0x24955BBE8](v5, v6);
    atomic_store(result, v0);
  }
  return result;
}

unint64_t sub_246468678()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_25757A248;
  if (!qword_25757A248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25757A250);
    v2 = sub_246468638();
    result = MEMORY[0x24955BBE8](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_25757A248);
  }
  return result;
}

void type metadata accessor for SceneClientSettingScopes()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.BackgroundTintColorKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.TextColorKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.ViewModelDataKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.ResolvedMetricsKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneClientSettingScopes.SnippetSceneSettings.SnippetSceneHostTouchRestrictedRectsKey()
{
  OUTLINED_FUNCTION_4_6();
}

uint64_t sub_246468748@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  _OWORD v17[2];
  __int128 v18;
  __int128 v19;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_246468CA8(0, &qword_25757A1B8);
  if (AssociatedTypeWitness != v9)
  {
    if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2)))
    {
      sub_2464825FC();
      swift_unknownObjectRelease();
      sub_246462270(v17, &v18);
    }
    else
    {
      v18 = 0u;
      v19 = 0u;
    }
    v10 = (uint64_t *)&unk_257579C80;
    goto LABEL_8;
  }
  if (objc_msgSend(a1, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a3 + 8) + 16))(a2)))
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_24645F6C0((uint64_t)v17, (uint64_t)&v18);
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_24645E148((uint64_t)&v18);
    goto LABEL_14;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_14:
    v12 = a4;
    v11 = 1;
    return __swift_storeEnumTagSinglePayload(v12, v11, 1, AssociatedTypeWitness);
  }
  sub_246468CA8(0, &qword_25757A2F8);
  v14 = sub_246482518();
  sub_24645F708(v15, v16);
  *(_QWORD *)&v18 = v14;
  v10 = (uint64_t *)&unk_25757A300;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(v10);
  v11 = swift_dynamicCast() ^ 1;
  v12 = a4;
  return __swift_storeEnumTagSinglePayload(v12, v11, 1, AssociatedTypeWitness);
}

void sub_246468970(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_246468994(*(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), a2, a3);
}

void sub_246468994(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v3;
  id v7;

  v7 = objc_msgSend(v3, sel_otherSettings);
  sub_246468748(v7, a1, a2, a3);

}

id sub_246468A74()
{
  return sub_246467D54(type metadata accessor for SnippetSceneClientSettings);
}

uint64_t type metadata accessor for SnippetSceneClientSettings()
{
  return objc_opt_self();
}

void sub_246468AA0(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_246468994(a1, a2, a3);
}

void sub_246468AC0(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  sub_246468970(a1, a2, a3);
}

id sub_246468AE4@<X0>(uint64_t (*a1)(void)@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  objc_class *v4;
  id result;

  v4 = (objc_class *)a1();
  result = objc_msgSend(objc_allocWithZone(v4), sel_initWithSettings_, v2);
  a2[3] = v4;
  *a2 = result;
  return result;
}

void sub_246468B38(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  id v5;
  _QWORD v6[4];

  v5 = a1;
  sub_246468AE4(a4, v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  sub_246482758();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  OUTLINED_FUNCTION_22();
}

id sub_246468B94(void *a1, uint64_t (*a2)(void))
{
  void *v2;
  id v4;
  objc_super v6;

  v6.receiver = v2;
  v6.super_class = (Class)a2();
  v4 = objc_msgSendSuper2(&v6, sel_initWithSettings_, a1);

  return v4;
}

id sub_246468C14(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_246468C70()
{
  return sub_246467D54(type metadata accessor for SnippetSceneMutableClientSettings);
}

uint64_t type metadata accessor for SnippetSceneMutableClientSettings()
{
  return objc_opt_self();
}

_UNKNOWN **sub_246468C9C()
{
  return &protocol witness table for SceneClientSettingScopes.SnippetSceneSettings;
}

void sub_246468CA8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_1_2();
}

void OUTLINED_FUNCTION_6_4()
{
  sub_246468524();
}

void OUTLINED_FUNCTION_7_3()
{
  sub_2464684E0();
}

uint64_t OUTLINED_FUNCTION_9_2()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  *v1 = v3;
  *v0 = v2;
  return swift_bridgeObjectRelease();
}

void SnippetHostingView.init(bundleIdentifier:viewModel:)(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  type metadata accessor for SnippetHostingView();
}

uint64_t sub_246468D80(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + *(int *)(a1 + 52);
  v4 = sub_24648235C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, v1, v4);
}

void type metadata accessor for SnippetHostingView()
{
  JUMPOUT(0x24955BB70);
}

void SnippetHostingView.body.getter()
{
  OUTLINED_FUNCTION_0_7();
  type metadata accessor for _SnippetHostingView();
}

void sub_246468E04(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 272) = a1;
  OUTLINED_FUNCTION_0_7();
  type metadata accessor for SnippetHostView();
}

uint64_t sub_246468E18(uint64_t a1)
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
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(_BYTE *, _BYTE *, uint64_t);
  void (*v26)(_BYTE *, uint64_t);
  _BYTE v28[96];

  *(_QWORD *)(v5 - 264) = a1;
  v6 = sub_246482260();
  v7 = sub_24648232C();
  *(_QWORD *)(v5 - 240) = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = &v28[-v9];
  v11 = sub_246482200();
  *(_QWORD *)(v5 - 248) = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = &v28[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13, v16);
  v18 = &v28[-v17];
  *(_QWORD *)(v5 - 208) = v1;
  *(_QWORD *)(v5 - 200) = v3;
  *(_QWORD *)(v5 - 192) = v2;
  *(_QWORD *)(v5 - 184) = v4;
  *(_QWORD *)(v5 - 176) = *(_QWORD *)(v5 - 256);
  v19 = MEMORY[0x24955BBE8](&unk_246484690, *(_QWORD *)(v5 - 272));
  v20 = MEMORY[0x24955BBE8](&unk_246484560, *(_QWORD *)(v5 - 264));
  *(_QWORD *)(v5 - 136) = v19;
  *(_QWORD *)(v5 - 128) = v20;
  v21 = MEMORY[0x24955BBE8](MEMORY[0x24BDEF3E0], v6, v5 - 136);
  sub_246482320();
  *(_QWORD *)(v5 - 144) = v21;
  v22 = MEMORY[0x24955BBE8](MEMORY[0x24BDF3F50], v7, v5 - 144);
  sub_246482314();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v5 - 240) + 8))(v10, v7);
  v23 = MEMORY[0x24BDEDB80];
  *(_QWORD *)(v5 - 160) = v22;
  *(_QWORD *)(v5 - 152) = v23;
  MEMORY[0x24955BBE8](MEMORY[0x24BDED308], v11, v5 - 160);
  v24 = *(_QWORD *)(v5 - 248);
  v25 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v24 + 16);
  v25(v18, v15, v11);
  v26 = *(void (**)(_BYTE *, uint64_t))(v24 + 8);
  v26(v15, v11);
  v25(*(_BYTE **)(v5 - 232), v18, v11);
  return ((uint64_t (*)(_BYTE *, uint64_t))v26)(v18, v11);
}

void sub_246469018()
{
  type metadata accessor for SnippetHostView();
}

void sub_246469064(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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

  *(_QWORD *)(v13 - 240) = *(_QWORD *)(a1 - 8);
  v14 = MEMORY[0x24BDAC7A8](a1, a2);
  MEMORY[0x24BDAC7A8](v14, v15);
  *(_QWORD *)(v13 - 232) = (char *)&a9 - v16;
  v17 = sub_24648235C();
  *(_QWORD *)(v13 - 216) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v13 - 208) = v17;
  MEMORY[0x24BDAC7A8](v17, v18);
  *(_QWORD *)(v13 - 128) = v12;
  *(_QWORD *)(v13 - 120) = v11;
  *(_QWORD *)(v13 - 200) = v11;
  *(_QWORD *)(v13 - 192) = v10;
  *(_QWORD *)(v13 - 112) = v10;
  *(_QWORD *)(v13 - 104) = v9;
  *(_QWORD *)(v13 - 184) = v9;
  type metadata accessor for _SnippetHostingView();
}

void sub_24646910C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v18[96];

  *(_QWORD *)(v4 - 256) = *(_QWORD *)(a1 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1, a2);
  MEMORY[0x24BDAC7A8](v5, v6);
  *(_QWORD *)(v4 - 248) = &v18[-v7];
  v8 = sub_246482260();
  *(_QWORD *)(v4 - 168) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v4 - 160) = v8;
  MEMORY[0x24BDAC7A8](v8, v9);
  *(_QWORD *)(v4 - 176) = &v18[-v10];
  *(_QWORD *)(v4 - 104) = &type metadata for Feature;
  *(_QWORD *)(v4 - 96) = sub_24645D944();
  v11 = sub_246482038();
  __swift_destroy_boxed_opaque_existential_1(v4 - 128);
  *(_QWORD *)(v4 - 224) = *v2;
  if ((v11 & 1) != 0)
  {
    v13 = *(_QWORD *)(v4 - 200);
    v12 = *(_QWORD *)(v4 - 192);
    *(_QWORD *)(v4 - 128) = v3;
    *(_QWORD *)(v4 - 120) = v13;
    v14 = *(_QWORD *)(v4 - 184);
    *(_QWORD *)(v4 - 112) = v12;
    *(_QWORD *)(v4 - 104) = v14;
    type metadata accessor for SnippetHostingView();
  }
  v16 = *(_QWORD *)(v4 - 200);
  v15 = *(_QWORD *)(v4 - 192);
  *(_QWORD *)(v4 - 128) = v3;
  *(_QWORD *)(v4 - 120) = v16;
  v17 = *(_QWORD *)(v4 - 184);
  *(_QWORD *)(v4 - 112) = v15;
  *(_QWORD *)(v4 - 104) = v17;
  type metadata accessor for SnippetHostingView();
}

void sub_2464692F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v5 - 216) + 16))(v1, v3 + *(int *)(a1 + 52), *(_QWORD *)(v5 - 208));
  sub_24646ECA0(*(_QWORD *)(v5 - 224), v2, v4);
}

void sub_246469330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void (*v7)(uint64_t, uint64_t);

  MEMORY[0x24955BBE8](&unk_246484560, v0);
  v4 = *(_QWORD *)(v3 - 240);
  v5 = *(_QWORD *)(v3 - 232);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v6(v5, v2, v0);
  v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  swift_bridgeObjectRetain();
  v7(v2, v0);
  v6(v2, v5, v0);
  MEMORY[0x24955BBE8](&unk_246484690, v1);
  sub_246469528(v2, v1, v0);
  v7(v2, v0);
  v7(v5, v0);
  JUMPOUT(0x2464693CCLL);
}

void sub_246469454()
{
  sub_246469018();
}

uint64_t sub_246469464(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v4 = sub_246482248();
  MEMORY[0x24BDAC7A8](v4, v5);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v8 - v6, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_246482254();
}

uint64_t sub_246469528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v5 = sub_246482248();
  MEMORY[0x24BDAC7A8](v5, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v9 - v7, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_246482254();
}

uint64_t sub_2464695EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_246469628()
{
  return sub_2464822FC();
}

uint64_t sub_246469644()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24646964C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24648235C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_2464696C4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  void (*v23)(unint64_t, unint64_t, uint64_t);

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = v6 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v9 = v8 & (v6 + 16);
  v10 = v6 & 0x100000;
  if (v7 > 7 || v10 != 0 || ((v7 + 16) & (unint64_t)~v7) + *(_QWORD *)(v5 + 64) + v9 > 0x18)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + v9);
    swift_retain();
  }
  else
  {
    v14 = ~v7;
    v15 = a2[1];
    *a1 = *a2;
    a1[1] = v15;
    v16 = (_QWORD *)(v8 & ((unint64_t)a1 + 23));
    v17 = (_QWORD *)(v8 & ((unint64_t)a2 + 23));
    *v16 = *v17;
    v18 = (_QWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFFFF8);
    v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v18 = *v19;
    v20 = v7 + 8;
    v21 = ((unint64_t)v18 + v20) & v14;
    v22 = ((unint64_t)v19 + v20) & v14;
    v23 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v23(v21, v22, v4);
  }
  return a1;
}

uint64_t sub_2464697C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  return (*(uint64_t (**)(unint64_t, uint64_t))(v5 + 8))((v6 + ((((a1 + (v6 | 7) + 16) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v4);
}

_QWORD *sub_246469838(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 | 7) + 16;
  v9 = (_QWORD *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  v10 = (_QWORD *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  *v9 = *v10;
  v11 = (_QWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v13 = ((unint64_t)v11 + v7 + 8) & ~v7;
  v14 = ((unint64_t)v12 + v7 + 8) & ~v7;
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v15(v13, v14, v5);
  return a1;
}

_QWORD *sub_2464698F0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 | 7) + 16;
  v10 = (_QWORD *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  v11 = (_QWORD *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *v10 = *v11;
  swift_retain();
  swift_release();
  v12 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  return a1;
}

_OWORD *sub_2464699CC(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 | 7) + 16;
  v7 = (_QWORD *)(((unint64_t)a1 + v6) & ~(v5 | 7));
  v8 = (_QWORD *)(((unint64_t)a2 + v6) & ~(v5 | 7));
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)v9 + v5 + 8) & ~v5, ((unint64_t)v10 + v5 + 8) & ~v5);
  return a1;
}

_QWORD *sub_246469A4C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + 16;
  v11 = (_QWORD *)(((unint64_t)a1 + v10) & ~(v9 | 7));
  v12 = (_QWORD *)(((unint64_t)a2 + v10) & ~(v9 | 7));
  *v11 = *v12;
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  return a1;
}

uint64_t sub_246469B00(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v16;
  int v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if ((int)v6 >= 0)
    v8 = 0x7FFFFFFF;
  else
    v8 = v7;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v5 + 80);
  v10 = v9 | 7;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_25;
  v12 = ((v9 + 16) & ~v9) + *(_QWORD *)(v5 + 64) + ((v9 + 16) & ~v10);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v16 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_25;
      goto LABEL_18;
    }
    if (v16 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_25;
      goto LABEL_18;
    }
    if (v16 < 2)
    {
LABEL_25:
      if (v8 != 0x7FFFFFFF)
        return __swift_getEnumTagSinglePayload((v9 + ((((a1 + v10 + 16) & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v9, v6, v4);
      v18 = *(_QWORD *)(a1 + 8);
      if (v18 >= 0xFFFFFFFF)
        LODWORD(v18) = -1;
      return (v18 + 1);
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_25;
LABEL_18:
  v17 = (v14 - 1) << v13;
  if (v12 > 3)
    v17 = 0;
  if (!(_DWORD)v12)
    return v8 + v17 + 1;
  if (v12 > 3)
    LODWORD(v12) = 4;
  return ((uint64_t (*)(void))((char *)&loc_246469BE8 + 4 * byte_246483FB0[(v12 - 1)]))();
}

void sub_246469C74(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  size_t v9;
  char v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (v7 >= 0)
    v8 = 0x7FFFFFFF;
  v9 = ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64)
     + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(*(unsigned __int8 *)(v6 + 80) | 7));
  v10 = 8 * v9;
  v11 = a3 >= v8;
  v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v9 <= 3)
    {
      v15 = ((v12 + ~(-1 << v10)) >> v10) + 1;
      if (HIWORD(v15))
      {
        v13 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v13 = 2;
      }
      else
      {
        v13 = v15 > 1;
      }
    }
    else
    {
      v13 = 1u;
    }
  }
  else
  {
    v13 = 0;
  }
  if (v8 < a2)
  {
    v14 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v16 = v14 & ~(-1 << v10);
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v16;
          *((_BYTE *)a1 + 2) = BYTE2(v16);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v16;
        }
        else
        {
          *(_BYTE *)a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

void sub_246469E98()
{
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for _SnippetHostingView();
}

void sub_246469EC0()
{
  OUTLINED_FUNCTION_1_7();
  type metadata accessor for SnippetHostView();
}

uint64_t sub_246469ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  uint64_t v8;
  _QWORD v9[14];

  v3 = sub_246482260();
  v4 = sub_24648232C();
  v5 = sub_246482200();
  v9[0] = MEMORY[0x24955BBE8](&unk_246484690, v1);
  v9[1] = MEMORY[0x24955BBE8](&unk_246484560, a1);
  v8 = MEMORY[0x24955BBE8](MEMORY[0x24BDEF3E0], v3, v9);
  v7[0] = MEMORY[0x24955BBE8](MEMORY[0x24BDF3F50], v4, &v8);
  v7[1] = MEMORY[0x24BDEDB80];
  return MEMORY[0x24955BBE8](MEMORY[0x24BDED308], v5, v7);
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 120) = v0;
  *(_QWORD *)(v4 - 112) = v2;
  *(_QWORD *)(v4 - 104) = v1;
  *(_QWORD *)(v4 - 96) = v3;
  return 255;
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return 255;
}

uint64_t sub_246469FC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  *(_QWORD *)(v5 + 16) = 0;
  *(_QWORD *)(v5 + 24) = 0;
  *(_BYTE *)(v5 + 80) = 1;
  *(_QWORD *)(v5 + 88) = 0;
  *(_QWORD *)(v5 + 32) = a1;
  *(_QWORD *)(v5 + 40) = a2;
  *(_QWORD *)(v5 + 48) = a3;
  *(_QWORD *)(v5 + 56) = a4;
  *(_QWORD *)(v5 + 64) = a5;
  *(_QWORD *)(v5 + 72) = 0;
  return v5;
}

id *sub_246469FE4()
{
  id *v0;

  sub_24646A7F4();

  swift_bridgeObjectRelease();
  swift_release();

  return v0;
}

uint64_t sub_24646A024()
{
  sub_246469FE4();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BackOffTimer()
{
  return objc_opt_self();
}

void sub_24646A064()
{
  uint64_t v0;
  os_log_type_t v1;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint32_t v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t aBlock[6];
  uint64_t v35;

  v2 = (_QWORD *)v0;
  if (*(_QWORD *)(v0 + 16))
  {
    if (qword_257579658 != -1)
      swift_once();
    v3 = sub_24648205C();
    v4 = __swift_project_value_buffer(v3, (uint64_t)qword_25757A508);
    OUTLINED_FUNCTION_6_5();
    sub_246482044();
    v5 = OUTLINED_FUNCTION_7_4();
    if (OUTLINED_FUNCTION_4_7(v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      aBlock[0] = OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v6 = 136315138;
      v7 = OUTLINED_FUNCTION_9_3();
      v35 = OUTLINED_FUNCTION_3_6(v7);
      sub_2464825E4();
      OUTLINED_FUNCTION_2_8();
      swift_bridgeObjectRelease();
      v8 = "[%s] Back off timer is already on";
      v9 = v4;
      v10 = v1;
      v11 = v6;
      v12 = 12;
      goto LABEL_17;
    }

    swift_release();
  }
  else
  {
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    v13 = *(void **)(v0 + 88);
    *(_QWORD *)(v0 + 88) = 0;

    if (qword_257579658 != -1)
      swift_once();
    v14 = sub_24648205C();
    v15 = __swift_project_value_buffer(v14, (uint64_t)qword_25757A508);
    OUTLINED_FUNCTION_6_5();
    sub_246482044();
    v16 = OUTLINED_FUNCTION_7_4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = OUTLINED_FUNCTION_1_8();
      aBlock[0] = OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v17 = 136315394;
      v18 = OUTLINED_FUNCTION_9_3();
      v35 = OUTLINED_FUNCTION_3_6(v18);
      sub_2464825E4();
      swift_bridgeObjectRelease();
      *(_WORD *)(v17 + 12) = 2048;
      v35 = *(_QWORD *)(v0 + 24);
      sub_2464825E4();
      OUTLINED_FUNCTION_2_8();
      _os_log_impl(&dword_24645B000, v15, v16, "[%s] scheduling new backoff with base interval: %f.", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_8();
    }

    OUTLINED_FUNCTION_2_8();
    sub_24646A960();
    v19 = sub_24646A528();
    v20 = *(void **)(v0 + 16);
    *(_QWORD *)(v0 + 16) = v19;

    v21 = *(double *)(v0 + 24);
    if (v21 >= 0.1)
      v22 = v21 + v21;
    else
      v22 = 0.1;
    v23 = fmin(v22, 120.0);
    *(double *)(v0 + 24) = v23;
    v24 = *(void **)(v0 + 16);
    if (v24)
    {
      v25 = *(_QWORD *)(v0 + 48);
      v26 = OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_5_5();
      aBlock[4] = (uint64_t)sub_24646ABCC;
      aBlock[5] = v26;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_24646A7A4;
      aBlock[3] = (uint64_t)&block_descriptor_4;
      v27 = _Block_copy(aBlock);
      v28 = v24;
      swift_release();
      objc_msgSend(v28, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v25, v27, v23, 0.0);
      _Block_release(v27);

      OUTLINED_FUNCTION_6_5();
      v29 = v15;
      sub_246482044();
      v30 = OUTLINED_FUNCTION_7_4();
      if (OUTLINED_FUNCTION_4_7(v30))
      {
        v31 = OUTLINED_FUNCTION_1_8();
        aBlock[0] = OUTLINED_FUNCTION_1_8();
        *(_DWORD *)v31 = 136315394;
        v32 = v2[4];
        v33 = v2[5];
        swift_bridgeObjectRetain();
        v35 = sub_24646CE94(v32, v33, aBlock);
        sub_2464825E4();
        swift_bridgeObjectRelease();
        *(_WORD *)(v31 + 12) = 2048;
        v35 = v2[3];
        sub_2464825E4();
        OUTLINED_FUNCTION_2_8();
        v8 = "[%s] Back off timer is scheduled with fire interval: %f";
        v9 = v29;
        v10 = v27;
        v11 = (uint8_t *)v31;
        v12 = 22;
LABEL_17:
        _os_log_impl(&dword_24645B000, v9, v10, v8, v11, v12);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0_8();
      }

      OUTLINED_FUNCTION_2_8();
    }
    else
    {
      __break(1u);
    }
  }
}

id sub_24646A528()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithIdentifier_, v1);

  return v2;
}

uint64_t sub_24646A598(void *a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  void *v13;
  uint64_t v14;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = (_QWORD *)result;
    if (qword_257579658 != -1)
      swift_once();
    v4 = sub_24648205C();
    __swift_project_value_buffer(v4, (uint64_t)qword_25757A508);
    swift_retain();
    v5 = sub_246482044();
    v6 = sub_24648250C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v14 = v8;
      *(_DWORD *)v7 = 136315138;
      v9 = v3[4];
      v10 = v3[5];
      swift_bridgeObjectRetain();
      sub_24646CE94(v9, v10, &v14);
      sub_2464825E4();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24645B000, v5, v6, "[%s] Back off timer fired", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v8, -1, -1);
      MEMORY[0x24955BC78](v7, -1, -1);

    }
    else
    {

      swift_release();
    }
    v11 = (void (*)(uint64_t))v3[7];
    v12 = swift_retain();
    v11(v12);
    swift_release();
    objc_msgSend(a1, sel_invalidate);
    v13 = (void *)v3[2];
    v3[2] = 0;

    sub_24646A83C();
    return swift_release();
  }
  return result;
}

void sub_24646A7A4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_24646A7F4()
{
  uint64_t v0;
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
  v1 = *(void **)(v0 + 16);
  *(_QWORD *)(v0 + 16) = 0;

  objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
  v2 = *(void **)(v0 + 88);
  *(_QWORD *)(v0 + 88) = 0;

}

void sub_24646A83C()
{
  uint64_t v0;
  double v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  if ((*(_BYTE *)(v0 + 80) & 1) == 0)
  {
    v1 = *(double *)(v0 + 72);
    objc_msgSend(*(id *)(v0 + 88), sel_invalidate);
    sub_24646A960();
    swift_bridgeObjectRetain();
    v2 = sub_24646A528();
    v3 = *(void **)(v0 + 88);
    *(_QWORD *)(v0 + 88) = v2;

    v4 = *(void **)(v0 + 88);
    if (v4)
    {
      v5 = *(_QWORD *)(v0 + 48);
      v6 = OUTLINED_FUNCTION_8_5();
      OUTLINED_FUNCTION_5_5();
      v9[4] = sub_24646ABAC;
      v9[5] = v6;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 1107296256;
      v9[2] = sub_24646A7A4;
      v9[3] = &block_descriptor_2;
      v7 = _Block_copy(v9);
      v8 = v4;
      swift_release();
      objc_msgSend(v8, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v5, v7, v1, 0.0);
      _Block_release(v7);

    }
  }
}

unint64_t sub_24646A960()
{
  unint64_t result;

  result = qword_25757A4D0;
  if (!qword_25757A4D0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25757A4D0);
  }
  return result;
}

uint64_t sub_24646A99C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

void sub_24646A9C0()
{
  uint64_t Strong;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = Strong;
    if (qword_257579658 != -1)
      swift_once();
    v2 = sub_24648205C();
    __swift_project_value_buffer(v2, (uint64_t)qword_25757A508);
    swift_retain();
    v3 = sub_246482044();
    v4 = sub_24648250C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      v6 = swift_slowAlloc();
      v10 = v6;
      *(_DWORD *)v5 = 136315138;
      v7 = *(_QWORD *)(v1 + 32);
      v8 = *(_QWORD *)(v1 + 40);
      swift_bridgeObjectRetain();
      sub_24646CE94(v7, v8, &v10);
      sub_2464825E4();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24645B000, v3, v4, "[%s] Reset interval satiated, resetting", v5, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v6, -1, -1);
      MEMORY[0x24955BC78](v5, -1, -1);

    }
    else
    {

      swift_release();
    }
    *(_QWORD *)(v1 + 24) = 0;
    objc_msgSend(*(id *)(v1 + 88), sel_invalidate);
    v9 = *(void **)(v1 + 88);
    *(_QWORD *)(v1 + 88) = 0;
    swift_release();

  }
}

void sub_24646ABAC()
{
  sub_24646A9C0();
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

uint64_t sub_24646ABCC(void *a1)
{
  return sub_24646A598(a1);
}

void OUTLINED_FUNCTION_0_8()
{
  JUMPOUT(0x24955BC78);
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2_8()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t a1, ...)
{
  uint64_t v1;
  unint64_t v2;
  va_list va;

  va_start(va, a1);
  return sub_24646CE94(v1, v2, (uint64_t *)va);
}

BOOL OUTLINED_FUNCTION_4_7(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_weakInit();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return sub_24648250C();
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_9_3()
{
  return swift_bridgeObjectRetain();
}

void sub_24646AC4C(uint64_t a1)
{
  sub_24646AD90(a1, qword_25757A4D8);
}

uint64_t static Logger.scene.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24646ACCC(&qword_257579648, (uint64_t)qword_25757A4D8, a1);
}

void sub_24646AC84(uint64_t a1)
{
  sub_24646AD90(a1, qword_25757A4F0);
}

uint64_t static Logger.viewController.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24646ACCC(&qword_257579650, (uint64_t)qword_25757A4F0, a1);
}

uint64_t sub_24646ACCC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_24648205C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

void sub_24646AD34(uint64_t a1)
{
  sub_24646AD90(a1, qword_25757A508);
}

uint64_t static Logger.processIdentity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24646ACCC(&qword_257579658, (uint64_t)qword_25757A508, a1);
}

void sub_24646AD74(uint64_t a1)
{
  sub_24646AD90(a1, qword_25757A520);
}

void sub_24646AD90(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24648205C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  sub_246482050();
  OUTLINED_FUNCTION_13();
}

uint64_t static Logger.view.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24646ACCC(&qword_257579660, (uint64_t)qword_25757A520, a1);
}

unint64_t static SnippetSceneCategory.subsystem.getter()
{
  return 0xD00000000000001ELL;
}

SiriInteractive::SnippetSceneCategory_optional __swiftcall SnippetSceneCategory.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  char v4;
  SiriInteractive::SnippetSceneCategory_optional result;

  v2 = v1;
  v3 = sub_24648274C();
  swift_bridgeObjectRelease();
  v4 = 4;
  if (v3 < 4)
    v4 = v3;
  *v2 = v4;
  OUTLINED_FUNCTION_13();
  return result;
}

uint64_t SnippetSceneCategory.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24646AEB8 + 4 * byte_2464840C0[*v0]))(0xD000000000000010, 0x8000000246484B40);
}

uint64_t sub_24646AEB8()
{
  return 0x656E6563735FLL;
}

uint64_t sub_24646AECC()
{
  return 0x776569765FLL;
}

uint64_t sub_24646AEE0()
{
  return 0x6E6F43776569765FLL;
}

void sub_24646AF04(char *a1)
{
  sub_246473278(*a1);
}

unint64_t sub_24646AF14()
{
  unint64_t result;

  result = qword_25757A538;
  if (!qword_25757A538)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for SnippetSceneCategory, &type metadata for SnippetSceneCategory);
    atomic_store(result, (unint64_t *)&qword_25757A538);
  }
  return result;
}

void sub_24646AF50()
{
  sub_2464733D4();
}

void sub_24646AF58(uint64_t a1)
{
  char *v1;

  sub_246473484(a1, *v1);
}

void sub_24646AF60()
{
  sub_24647351C();
}

SiriInteractive::SnippetSceneCategory_optional sub_24646AF68(Swift::String *a1)
{
  return SnippetSceneCategory.init(rawValue:)(*a1);
}

uint64_t sub_24646AF74@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SnippetSceneCategory.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SnippetSceneCategory(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SnippetSceneCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24646B078 + 4 * byte_2464840C9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24646B0AC + 4 * byte_2464840C4[v4]))();
}

uint64_t sub_24646B0AC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24646B0B4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24646B0BCLL);
  return result;
}

uint64_t sub_24646B0C8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24646B0D0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24646B0D4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24646B0DC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24646B0E8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_24646B0F0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SnippetSceneCategory()
{
  return &type metadata for SnippetSceneCategory;
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

void sub_24646B148(uint64_t a1@<X8>)
{
  sub_24646B448(MEMORY[0x24BEBD020], (uint64_t *)&unk_2575797E0, a1);
}

void _SnippetClientController.sendAction(_:)()
{
  type metadata accessor for SnippetHostingAction.ClientToHost();
}

void sub_24646B1A4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t *boxed_opaque_existential_2;
  id v6;
  id v7;
  void *v8;
  uint64_t v9[14];

  v2 = v0[3];
  v3 = v0[5];
  v4 = __swift_project_boxed_opaque_existential_0(v0, v2);
  v9[3] = v2;
  v9[4] = v3;
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v9);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(boxed_opaque_existential_2, v4, v2);
  v6 = sub_24645EBFC();
  v7 = objc_msgSend(v1, sel__hostedWindowScene);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_sendAction_, v6);

  }
}

void sub_24646B23C()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;

  if (qword_257579648 != -1)
    swift_once();
  v1 = sub_24648205C();
  __swift_project_value_buffer(v1, (uint64_t)qword_25757A4D8);
  v2 = v0;
  v3 = sub_246482044();
  v4 = sub_24648250C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v6 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v5 = 138543362;
    v7 = v2;
    sub_2464825E4();
    *v6 = v2;

    _os_log_impl(&dword_24645B000, v3, v4, "[%{public}@] Client received action from Host", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_257579610 != -1)
    swift_once();
  v9 = qword_257579A90;
  v10 = (void *)sub_246482008();
  objc_msgSend(v8, sel_postNotificationName_object_, v9, v10);

}

void sub_24646B448(void (*a1)(void)@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v7 = objc_msgSend(v3, sel_viewIfLoaded);
  if (v7
    && (v8 = v7, v9 = objc_msgSend(v7, sel_window), v8, v9)
    && (v11 = objc_msgSend(v9, sel_windowScene), v9, v11))
  {
    a1();

  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
    __swift_storeEnumTagSinglePayload(a3, 1, 1, v10);
  }
}

void _SnippetClientController.__allocating_init<A>(scene:rootView:modelType:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  objc_class *v5;
  uint64_t v7;

  OUTLINED_FUNCTION_7_5();
  _SnippetClientController.init<A>(scene:rootView:modelType:)(v5, v4, v7, a4);
}

void sub_24646B564()
{
  OUTLINED_FUNCTION_9();
}

void _SnippetClientController.init<A>(scene:rootView:modelType:)(objc_class *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  _QWORD *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[4];
  uint64_t v39;
  uint64_t v40;
  objc_class *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  objc_super v50;

  v41 = (objc_class *)OUTLINED_FUNCTION_4_3();
  v44 = *MEMORY[0x24BEE4EA0] & *v4;
  v9 = *(_QWORD *)(v44 + 80);
  v10 = sub_2464825D8();
  v38[0] = *(_QWORD *)(v10 - 8);
  v38[1] = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v46 = (uint64_t)v38 - v12;
  v40 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_18_1();
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v38[3] = (char *)v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v17);
  v39 = (uint64_t)v38 - v18;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A540);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v19, v20);
  OUTLINED_FUNCTION_9_4();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A548);
  v45 = *(_QWORD *)(v21 - 8);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v22, v23);
  OUTLINED_FUNCTION_8_6();
  v26 = v25 - v24;
  MEMORY[0x24BDAC7A8](v27, v28);
  OUTLINED_FUNCTION_8_6();
  v31 = v30 - v29;
  *(_QWORD *)((char *)v4 + qword_25757A550) = 0;
  *(_QWORD *)((char *)v4 + qword_25757A558) = 0;
  *(_QWORD *)((char *)v4 + qword_25757A560) = 0;
  v38[2] = v32;
  v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
  v42 = a2;
  v33(v31, a2, a4);
  v34 = v4;
  v43 = a4;
  *(_QWORD *)((char *)v34 + qword_25757A568) = sub_246482338();

  v50.receiver = v34;
  v50.super_class = v41;
  v35 = OUTLINED_FUNCTION_12_1(&v50, sel_initWithNibName_bundle_);
  v41 = a1;
  sub_2464825A8();
  if (__swift_getEnumTagSinglePayload(v5, 1, v21) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v26, v5, v21);
    sub_246481F78();
    swift_allocObject();
    sub_246481F6C();
    swift_getOpaqueTypeConformance2();
    sub_24645DA28();
    sub_246482080();
    v36 = *(_QWORD *)(v44 + 88);
    sub_246481F60();
    OUTLINED_FUNCTION_16_2();
    OUTLINED_FUNCTION_11_2();
    v37 = v46;
    OUTLINED_FUNCTION_21(v46, 0);
    OUTLINED_FUNCTION_14_1(v39, v37, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v40 + 32));
    v47 = v9;
    v48 = v36;
    v49 = *(_OWORD *)(v44 + 96);
    type metadata accessor for SnippetClientContext();
  }
  sub_24646B964(v5);
  OUTLINED_FUNCTION_6_6();
  __break(1u);
}

uint64_t sub_24646B964(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void _SnippetClientController.__allocating_init<A>(rootView:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_7_5();
  _SnippetClientController.init<A>(rootView:viewModel:)(v4, v3, a3);
}

void sub_24646B9DC()
{
  OUTLINED_FUNCTION_9();
}

void _SnippetClientController.init<A>(rootView:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  objc_class *v13;
  objc_super v14;

  v13 = (objc_class *)OUTLINED_FUNCTION_4_3();
  v7 = MEMORY[0x24BDAC7A8](v13, v6);
  v8 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  OUTLINED_FUNCTION_8_6();
  *(_QWORD *)&v3[qword_25757A550] = 0;
  *(_QWORD *)&v3[qword_25757A558] = 0;
  *(_QWORD *)&v3[qword_25757A560] = 0;
  OUTLINED_FUNCTION_14_1(v11 - v10, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  v12 = v3;
  *(_QWORD *)&v12[qword_25757A568] = sub_246482338();

  v14.receiver = v12;
  v14.super_class = v13;
  OUTLINED_FUNCTION_12_1(&v14, sel_initWithNibName_bundle_);
  type metadata accessor for SnippetClientContext();
}

void sub_24646BB1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *(_QWORD *)(v5 - 136);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v0, v6, v2);
  sub_24645D31C((uint64_t)v3, v0);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v6, v2);
  OUTLINED_FUNCTION_15_1(*(_QWORD *)(v5 - 144), *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_10_3(qword_25757A550);
  OUTLINED_FUNCTION_2_9();
}

void sub_24646BB88()
{
  char *v0;

  *(_QWORD *)&v0[qword_25757A550] = 0;
  *(_QWORD *)&v0[qword_25757A558] = 0;
  *(_QWORD *)&v0[qword_25757A560] = 0;

  OUTLINED_FUNCTION_6_6();
  __break(1u);
}

void sub_24646BBFC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_24646BB88();
}

Swift::Void __swiftcall _SnippetClientController.loadView()()
{
  objc_super v0;

  v0.super_class = (Class)OUTLINED_FUNCTION_4_3();
  objc_msgSendSuper2(&v0, sel_loadView);
  sub_24646BC48();
}

void sub_24646BC48()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + qword_25757A550))
  {
    swift_retain();
    swift_retain();
    type metadata accessor for SnippetClientContext();
  }
  __break(1u);
  JUMPOUT(0x24646C1E4);
}

void sub_24646C214(void *a1)
{
  a1;
  _SnippetClientController.loadView()();
}

void sub_24646C234()
{
  void *v0;

}

Swift::Void __swiftcall _SnippetClientController.viewDidAppear(_:)(Swift::Bool a1)
{
  char *v1;
  uint64_t v2;
  char *v3;
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  objc_super v11;

  v3 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A540);
  OUTLINED_FUNCTION_18_1();
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_9_4();
  v11.receiver = v3;
  v11.super_class = ObjectType;
  objc_msgSendSuper2(&v11, sel_viewDidAppear_, a1);
  sub_24646B448((void (*)(void))MEMORY[0x24BEBD010], &qword_25757A548, v2);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A548);
  if (__swift_getEnumTagSinglePayload(v2, 1, v8) == 1)
  {
    sub_24646B964(v2);
    v9 = 0;
  }
  else
  {
    *(_QWORD *)(swift_allocObject() + 16) = v3;
    v10 = v3;
    swift_getOpaqueTypeConformance2();
    sub_24645DA28();
    v9 = sub_246482074();
    OUTLINED_FUNCTION_11_2();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v2, v8);
  }
  *(_QWORD *)&v3[qword_25757A558] = v9;
  swift_unknownObjectRelease();
}

uint64_t sub_24646C3B0(uint64_t a1, _QWORD *a2)
{
  _QWORD *v3;
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
  char *v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint8_t *v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  uint64_t result;
  char *v37;
  uint64_t v38;
  char v39;
  void (*v40)(char *, uint64_t);
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  char *v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;

  v60 = a1;
  v3 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *a2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v3[10];
  v9 = sub_2464825D8();
  v58 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v61 = (char *)v52 - v12;
  v13 = *(_QWORD *)(v8 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v16 = MEMORY[0x24BDAC7A8](v11, v15);
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)v52 - v18;
  if (qword_257579648 != -1)
    swift_once();
  v20 = sub_24648205C();
  __swift_project_value_buffer(v20, (uint64_t)qword_25757A4D8);
  v21 = a2;
  v22 = sub_246482044();
  v23 = sub_24648250C();
  v24 = os_log_type_enabled(v22, v23);
  v53 = v7;
  v54 = (char *)v52 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = v21;
  v57 = v19;
  v52[1] = v14;
  v55 = v13;
  if (v24)
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v52[0] = swift_slowAlloc();
    *(_DWORD *)v25 = 138543362;
    v62 = (uint64_t)v21;
    v26 = v3;
    v27 = v21;
    sub_2464825E4();
    v28 = v52[0];
    *(_QWORD *)v52[0] = v21;

    v3 = v26;
    _os_log_impl(&dword_24645B000, v22, v23, "[%{public}@] Client received a new value from host", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    swift_arrayDestroy();
    MEMORY[0x24955BC78](v28, -1, -1);
    MEMORY[0x24955BC78](v25, -1, -1);

  }
  else
  {

  }
  sub_246481F78();
  swift_allocObject();
  sub_246481F6C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AA20);
  sub_246482068();
  v30 = v62;
  v29 = v63;
  v31 = v3[11];
  v32 = (uint64_t)v61;
  sub_246481F60();
  swift_release();
  sub_24645F708(v30, v29);
  __swift_storeEnumTagSinglePayload(v32, 0, 1, v8);
  v33 = v55;
  v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v55 + 32);
  v35 = v57;
  result = v34(v57, v32, v8);
  if (*(_QWORD *)&v56[qword_25757A550])
  {
    swift_retain();
    v37 = v54;
    SnippetClientContext.viewModel.getter();
    swift_release();
    v38 = v3[13];
    v39 = sub_2464823D4();
    v40 = *(void (**)(char *, uint64_t))(v33 + 8);
    v40(v37, v8);
    if ((v39 & 1) != 0)
    {
      v41 = v35;
    }
    else
    {
      v42 = sub_2464824AC();
      __swift_storeEnumTagSinglePayload((uint64_t)v53, 1, 1, v42);
      (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v37, v35, v8);
      sub_246482494();
      v43 = v56;
      v44 = sub_246482488();
      v45 = *(unsigned __int8 *)(v33 + 80);
      v46 = v3;
      v47 = (v45 + 72) & ~v45;
      v48 = (char *)swift_allocObject();
      v49 = v37;
      v50 = (uint64_t)v48;
      v51 = MEMORY[0x24BEE6930];
      *((_QWORD *)v48 + 2) = v44;
      *((_QWORD *)v48 + 3) = v51;
      *((_QWORD *)v48 + 4) = v8;
      *((_QWORD *)v48 + 5) = v31;
      *((_QWORD *)v48 + 6) = v46[12];
      *((_QWORD *)v48 + 7) = v38;
      *((_QWORD *)v48 + 8) = v43;
      v34(&v48[v47], (uint64_t)v49, v8);
      sub_24646ED0C((uint64_t)v53, (uint64_t)&unk_25757A608, v50);
      swift_release();
      v41 = v57;
    }
    return ((uint64_t (*)(char *, uint64_t))v40)(v41, v8);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_24646C878()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_24646C89C(uint64_t a1)
{
  uint64_t v1;

  return sub_24646C3B0(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_24646C8A4(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[2] = a4;
  v5[3] = a5;
  v6 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a4) + 0x50);
  v5[4] = v6;
  v5[5] = *(_QWORD *)(v6 - 8);
  v5[6] = swift_task_alloc();
  sub_246482494();
  v5[7] = sub_246482488();
  sub_24648247C();
  return swift_task_switch();
}

uint64_t sub_24646C948()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  char *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  result = swift_release();
  if (*(_QWORD *)(v1 + qword_25757A550))
  {
    v3 = *(char **)(v0 + 48);
    (*(void (**)(char *, _QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 16))(v3, *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    swift_retain();
    SnippetClientContext.viewModel.setter(v3, v4);
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24646C9C4(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  _SnippetClientController.viewDidAppear(_:)(a3);

}

Swift::Void __swiftcall _SnippetClientController.viewDidDisappear(_:)(Swift::Bool a1)
{
  char *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)OUTLINED_FUNCTION_4_3();
  objc_msgSendSuper2(&v3, sel_viewDidDisappear_, a1);
  *(_QWORD *)&v1[qword_25757A558] = 0;
  swift_unknownObjectRelease();
}

void sub_24646CA58(void *a1, uint64_t a2, Swift::Bool a3)
{
  id v4;

  v4 = a1;
  _SnippetClientController.viewDidDisappear(_:)(a3);

}

Swift::Void __swiftcall _SnippetClientController.viewDidLayoutSubviews()()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  objc_super v19;

  v19.receiver = v0;
  v19.super_class = (Class)OUTLINED_FUNCTION_4_3();
  objc_msgSendSuper2(&v19, sel_viewDidLayoutSubviews);
  v1 = *(void **)&v0[qword_25757A560];
  if (!v1)
  {
    __break(1u);
    goto LABEL_9;
  }
  v2 = objc_msgSend(v1, sel_view);
  if (!v2)
  {
LABEL_9:
    __break(1u);
    return;
  }
  v3 = v2;
  objc_msgSend(v2, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;

  if (qword_257579648 != -1)
    swift_once();
  v8 = sub_24648205C();
  __swift_project_value_buffer(v8, (uint64_t)qword_25757A4D8);
  v9 = v0;
  v10 = sub_246482044();
  v11 = sub_24648250C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = OUTLINED_FUNCTION_1_8();
    v13 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    v18 = OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v12 = 138543618;
    v14 = v9;
    sub_2464825E4();
    *v13 = v9;

    *(_WORD *)(v12 + 12) = 2080;
    v15 = MEMORY[0x24955B4B0](v5, v7);
    sub_24646CE94(v15, v16, &v18);
    sub_2464825E4();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24645B000, v10, v11, "[%{public}@] viewDidLayoutSubviews with intrinsicContentSize: %s", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  v17 = objc_msgSend(v9, sel__hostedWindowScene);
  objc_msgSend(v17, sel__setPreferredContentSize_, v5, v7);

}

void sub_24646CD14(void *a1)
{
  id v1;

  v1 = a1;
  _SnippetClientController.viewDidLayoutSubviews()();

}

id _SnippetClientController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2464823E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void _SnippetClientController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_24646CDE8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  if (a3)
    sub_2464823EC();
  v5 = a4;
  _SnippetClientController.init(nibName:bundle:)();
}

id _SnippetClientController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)OUTLINED_FUNCTION_4_3();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24646CE3C(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_unknownObjectRelease();

}

uint64_t sub_24646CE94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_24646CFDC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_24646D130((uint64_t)v12, *a3);
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
      sub_24646D130((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_24646CF64()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for _SnippetClientController()
{
  JUMPOUT(0x24955BB70);
}

uint64_t method lookup function for _SnippetClientController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SnippetClientController.__allocating_init<A>(scene:rootView:modelType:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of _SnippetClientController.__allocating_init<A>(rootView:viewModel:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t sub_24646CFDC(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_24646D16C((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2464825F0();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_24646D230(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2464826A4();
    if (!v8)
    {
      result = sub_246482704();
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

uint64_t sub_24646D130(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_24646D16C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246482740();
  __break(1u);
  return result;
}

uint64_t sub_24646D230(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_24646D2C4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_24646D498(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_24646D498((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24646D2C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_24648241C();
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
  v3 = sub_24646D434(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_24648268C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_246482740();
  __break(1u);
LABEL_14:
  result = sub_246482704();
  __break(1u);
  return result;
}

_QWORD *sub_24646D434(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_24646D498(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F0);
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
    sub_24646D630(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24646D56C(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_24646D56C(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_246482740();
  __break(1u);
  return result;
}

char *sub_24646D630(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_246482740();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_24646D6B4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 32) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_unknownObjectRelease();

  OUTLINED_FUNCTION_15_1(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

uint64_t sub_24646D724(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[3];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(v1[4] - 8) + 80);
  v6 = v1[2];
  v7 = (_QWORD *)v1[8];
  v8 = (uint64_t)v1 + ((v5 + 72) & ~v5);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_24646D7B4;
  return sub_24646C8A4(a1, v6, v4, v7, v8);
}

uint64_t sub_24646D7B4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_24646D7FC()
{
  unint64_t result;

  result = qword_25757AA40;
  if (!qword_25757AA40)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25757AA40);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_4_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 160) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return sub_246482710();
}

id OUTLINED_FUNCTION_7_5()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

uint64_t OUTLINED_FUNCTION_10_3@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + a1) = v1;
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return swift_release();
}

id OUTLINED_FUNCTION_12_1(objc_super *a1, SEL a2)
{
  return objc_msgSendSuper2(a1, a2, 0, 0);
}

uint64_t OUTLINED_FUNCTION_13_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_14_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  unint64_t v0;
  uint64_t v1;

  return sub_24645F708(v1, v0);
}

void SceneSettingDynamicLookup.subscript.getter()
{
  SceneSettingDynamicLookup.subscript.getter();
}

{
  sub_246482710();
  __break(1u);
}

{
  SceneSettingDynamicLookup.subscript.getter();
}

uint64_t sub_24646D908(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = OUTLINED_FUNCTION_9_5();
  v1(v2);
  return swift_release();
}

void sub_24646D94C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  OUTLINED_FUNCTION_8_7(a1, a2, a3, a4, a5, a6);
}

void static AnySceneSetting.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a6 + 16))(a4, a6);
  v10 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v10 + 16) = a2;
  *(_QWORD *)(v10 + 24) = a3;
  v11 = OUTLINED_FUNCTION_11_0((uint64_t)sub_24646D908, MEMORY[0x24BDAC760], 1107296256, v12, v13);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeOtherSetting_withBlock_, v9, v11);
  _Block_release(v11);
}

void sub_24646DA34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  static AnySceneSetting.observe<A>(differ:call:)(a1, a2, a3, a5, a5, a6);
}

void sub_24646DA4C(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A610 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_24646DB0C()
{
  qword_25757A618 = 0x656D617266;
  qword_25757A620 = 0xE500000000000000;
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.getter()
{
  if (qword_257579668 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  if (qword_257579668 != -1)
    swift_once();
  OUTLINED_FUNCTION_2_4();
  qword_25757A618 = a1;
  qword_25757A620 = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_4();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.keyDescription.modify()
{
  if (qword_257579668 != -1)
    swift_once();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.ApplicationSettings.FrameKey.observe<A>(differ:call:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = OUTLINED_FUNCTION_1_3();
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  v7 = OUTLINED_FUNCTION_11_0((uint64_t)sub_24646DD14, MEMORY[0x24BDAC760], 1107296256, v8, v9);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_observeFrameWithBlock_, v7);
  _Block_release(v7);
}

uint64_t sub_24646DD14(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A628 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_2_10();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_9(a1, a2, qword_25757A630);
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A640 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_2_10();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_9(a1, a2, qword_25757A648);
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A658 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_2_10();
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_9(a1, a2, qword_25757A660);
}

void static SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.getter()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.setter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_11_1();
  OUTLINED_FUNCTION_2_4();
  qword_25757A670 = v0;
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyIndex.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.getter()
{
  OUTLINED_FUNCTION_2_10();
}

void sub_24646E0D8()
{
  OUTLINED_FUNCTION_2_4();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_9_5();
  OUTLINED_FUNCTION_22();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.setter(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_1_9(a1, a2, qword_25757A678);
}

void sub_24646E124(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  OUTLINED_FUNCTION_2_4();
  *a3 = a1;
  *a4 = a2;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_8_4();
}

void static SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey.keyDescription.modify()
{
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_24646E214()
{
  swift_release();
  return swift_deallocObject();
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

uint64_t sub_24646E25C()
{
  return sub_24646E2EC(&qword_25757A258, (uint64_t (*)(uint64_t))type metadata accessor for CGRect, MEMORY[0x24BDBD830]);
}

uint64_t sub_24646E288()
{
  return sub_24646E2EC(&qword_25757A220, (uint64_t (*)(uint64_t))type metadata accessor for SceneMetrics, MEMORY[0x24BEE5BE0]);
}

uint64_t sub_24646E2B4()
{
  return MEMORY[0x24BEE0D28];
}

uint64_t sub_24646E2C0()
{
  return sub_24646E2EC(&qword_25757A6E8, (uint64_t (*)(uint64_t))type metadata accessor for SceneMetricsRequest, MEMORY[0x24BEE5BE0]);
}

uint64_t sub_24646E2EC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24955BBE8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t dispatch thunk of static AnySceneSetting.keyDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static AnySceneSetting.keyIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static AnySceneSetting.observe<A>(differ:call:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 24))();
}

void type metadata accessor for SceneSettingScopes()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.ApplicationSettings()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.ApplicationSettings.FrameKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SceneMetricsKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey()
{
  OUTLINED_FUNCTION_4_6();
}

void type metadata accessor for SceneSettingDynamicLookup()
{
  OUTLINED_FUNCTION_4_6();
}

uint64_t dispatch thunk of TypedSettings.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t sub_24646E3C0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  void *v3;
  void *v4;
  id v8;
  id v9;
  uint64_t AssociatedTypeWitness;
  int v11;
  __int128 v13;
  _OWORD v14[2];

  v4 = v3;
  v8 = objc_msgSend(v4, sel_otherSettings);
  v9 = objc_msgSend(v8, sel_objectForSetting_, (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 8) + 16))(a1));

  if (v9)
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
    sub_246462270(&v13, v14);
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = swift_dynamicCast();
  return __swift_storeEnumTagSinglePayload(a3, v11 ^ 1u, 1, AssociatedTypeWitness);
}

uint64_t sub_24646E4DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_24646E3C0(*(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8), a2, a3);
}

id sub_24646E574()
{
  return sub_246467D54(type metadata accessor for SnippetSceneSettings);
}

uint64_t type metadata accessor for SnippetSceneSettings()
{
  return objc_opt_self();
}

uint64_t sub_24646E5A0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_24646E3C0(a1, a2, a3);
}

uint64_t sub_24646E5C0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  return sub_24646E4DC(a1, a2, a3);
}

uint64_t sub_24646E5F0(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  void *v2;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  objc_super v12;

  OUTLINED_FUNCTION_2_4();
  if (qword_25757A658 == a1)
  {
    v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SceneMetricsRequestKey;
LABEL_7:
    ((void (__cdecl *)())v5[1])();
    return v7;
  }
  OUTLINED_FUNCTION_2_4();
  if (qword_25757A640 == a1)
  {
    v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SnippetSceneHostIdentifierKey;
    goto LABEL_7;
  }
  v6 = OUTLINED_FUNCTION_2_4();
  if (qword_25757A670 == a1)
  {
    v5 = &protocol witness table for SceneSettingScopes.SnippetSceneSettings.SnippetSceneViewDataKey;
    goto LABEL_7;
  }
  v12.receiver = v2;
  v12.super_class = (Class)a2(v6);
  v10 = objc_msgSendSuper2(&v12, sel_keyDescriptionForSetting_, a1);
  if (!v10)
    return 0;
  v11 = v10;
  v8 = sub_2464823EC();

  return v8;
}

id sub_24646E738(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v6 = a1;
  sub_24646E5F0(a3, a4);
  v8 = v7;

  if (v8)
  {
    OUTLINED_FUNCTION_9_5();
    v9 = (void *)sub_2464823E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

id sub_24646E808()
{
  return sub_246467D54(type metadata accessor for LiveMutableSceneSettings);
}

uint64_t type metadata accessor for LiveMutableSceneSettings()
{
  return objc_opt_self();
}

_UNKNOWN **sub_24646E834()
{
  return &protocol witness table for SceneSettingScopes.SnippetSceneSettings;
}

void OUTLINED_FUNCTION_1_9(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  sub_24646E124(a1, a2, a3, a3 + 1);
}

void OUTLINED_FUNCTION_2_10()
{
  sub_24646E0D8();
}

void OUTLINED_FUNCTION_8_7(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  static AnySceneSetting.observe<A>(differ:call:)(a1, a2, a3, a5, a5, a6);
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24646E874()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24648235C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24646E8EC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  unsigned int v16;
  int v17;
  unint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if ((int)v6 >= 0)
    v8 = 0x7FFFFFFF;
  else
    v8 = v7;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v5 + 80);
  v10 = v9 | 7;
  v11 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_25;
  v12 = ((v9 + 16) & ~v9) + *(_QWORD *)(v5 + 64) + ((v9 + 16) & ~v10);
  v13 = 8 * v12;
  if (v12 <= 3)
  {
    v16 = ((v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      v14 = *(_DWORD *)(a1 + v12);
      if (!v14)
        goto LABEL_25;
      goto LABEL_18;
    }
    if (v16 > 0xFF)
    {
      v14 = *(unsigned __int16 *)(a1 + v12);
      if (!*(_WORD *)(a1 + v12))
        goto LABEL_25;
      goto LABEL_18;
    }
    if (v16 < 2)
    {
LABEL_25:
      if (v8 != 0x7FFFFFFF)
        return __swift_getEnumTagSinglePayload((v9 + ((((a1 + v10 + 16) & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v9, v6, v4);
      v18 = *(_QWORD *)(a1 + 8);
      if (v18 >= 0xFFFFFFFF)
        LODWORD(v18) = -1;
      return (v18 + 1);
    }
  }
  v14 = *(unsigned __int8 *)(a1 + v12);
  if (!*(_BYTE *)(a1 + v12))
    goto LABEL_25;
LABEL_18:
  v17 = (v14 - 1) << v13;
  if (v12 > 3)
    v17 = 0;
  if (!(_DWORD)v12)
    return v8 + v17 + 1;
  if (v12 > 3)
    LODWORD(v12) = 4;
  return ((uint64_t (*)(void))((char *)&loc_24646E9D4 + 4 * byte_2464844A0[(v12 - 1)]))();
}

void sub_24646EA60(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  size_t v9;
  char v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  int v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (v7 >= 0)
    v8 = 0x7FFFFFFF;
  v9 = ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + *(_QWORD *)(v6 + 64)
     + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(*(unsigned __int8 *)(v6 + 80) | 7));
  v10 = 8 * v9;
  v11 = a3 >= v8;
  v12 = a3 - v8;
  if (v12 != 0 && v11)
  {
    if (v9 <= 3)
    {
      v15 = ((v12 + ~(-1 << v10)) >> v10) + 1;
      if (HIWORD(v15))
      {
        v13 = 4u;
      }
      else if (v15 >= 0x100)
      {
        v13 = 2;
      }
      else
      {
        v13 = v15 > 1;
      }
    }
    else
    {
      v13 = 1u;
    }
  }
  else
  {
    v13 = 0;
  }
  if (v8 < a2)
  {
    v14 = ~v8 + a2;
    if (v9 < 4)
    {
      if ((_DWORD)v9)
      {
        v16 = v14 & ~(-1 << v10);
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v16;
          *((_BYTE *)a1 + 2) = BYTE2(v16);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v16;
        }
        else
        {
          *(_BYTE *)a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

void type metadata accessor for SnippetHostView()
{
  JUMPOUT(0x24955BB70);
}

void sub_24646EC90()
{
  JUMPOUT(0x24955BBE8);
}

void sub_24646ECA0(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  OUTLINED_FUNCTION_3_7();
}

uint64_t sub_24646ECD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + *(int *)(a1 + 52);
  v4 = OUTLINED_FUNCTION_2_11();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, v1, v4);
}

uint64_t sub_24646ED0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2464824AC();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_24646F67C(a1);
  }
  else
  {
    sub_2464824A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24648247C();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24646EE48(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  v3 = sub_24648235C();
  return a2(v3);
}

uint64_t sub_24646EE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24955BBE8](&unk_2464844E8, a3);
  return sub_2464822B4();
}

uint64_t sub_24646EEE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24955BBE8](&unk_2464844E8, a3);
  return sub_246482284();
}

void sub_24646EF44(uint64_t a1)
{
  MEMORY[0x24955BBE8](&unk_2464844E8, a1);
  sub_2464822A8();
  __break(1u);
}

id sub_24646EF74(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
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
  id v16;
  uint64_t v18;

  v3 = v2;
  v5 = a2[2];
  v6 = OUTLINED_FUNCTION_2_11();
  MEMORY[0x24BDAC7A8](v6, v7);
  v9 = (char *)&v18 - v8;
  if (qword_257579660 != -1)
    swift_once();
  v10 = sub_24648205C();
  __swift_project_value_buffer(v10, (uint64_t)qword_25757A520);
  v11 = sub_246482044();
  v12 = sub_24648250C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_5_6();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_24645B000, v11, v12, "SnippetHostView.makeUIViewController(_:context:)", v13, 2u);
    OUTLINED_FUNCTION_0_8();
  }

  type metadata accessor for SnippetHostViewController();
  v14 = *v3;
  v15 = v3[1];
  swift_bridgeObjectRetain();
  sub_24646EE48((uint64_t)a2, MEMORY[0x24BDF47E0]);
  v16 = SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)(v14, v15, (uint64_t)v9, v5, a2[3], a2[4], a2[5]);
  BSDispatchQueueAssertMain();
  sub_24647898C(1u, 0);
  return v16;
}

uint64_t sub_24646F0E4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v26;

  v4 = v3;
  v7 = *(_QWORD *)(a3 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](a1, a2);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_257579660 != -1)
    swift_once();
  v14 = sub_24648205C();
  __swift_project_value_buffer(v14, (uint64_t)qword_25757A520);
  v15 = sub_246482044();
  v16 = sub_24648250C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)OUTLINED_FUNCTION_5_6();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_24645B000, v15, v16, "SnippetHostView.updateUIViewController(_:context:)", v17, 2u);
    OUTLINED_FUNCTION_0_8();
  }

  v18 = sub_2464824AC();
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 1, 1, v18);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a3);
  sub_246482494();
  v19 = a1;
  v20 = sub_246482488();
  v21 = (*(unsigned __int8 *)(v7 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v22 = swift_allocObject();
  v23 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v22 + 16) = v20;
  *(_QWORD *)(v22 + 24) = v23;
  v24 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v22 + 32) = *(_OWORD *)(a3 + 16);
  *(_OWORD *)(v22 + 48) = v24;
  *(_QWORD *)(v22 + 64) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v22 + v21, v9, a3);
  sub_24646ED0C((uint64_t)v13, (uint64_t)&unk_25757A830, v22);
  return swift_release();
}

uint64_t sub_24646F2E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[10] = a8;
  v8[11] = v10;
  v8[8] = a6;
  v8[9] = a7;
  v8[6] = a4;
  v8[7] = a5;
  v8[12] = *(_QWORD *)(a6 - 8);
  v8[13] = swift_task_alloc();
  sub_246482494();
  v8[14] = sub_246482488();
  sub_24648247C();
  return swift_task_switch();
}

void sub_24646F378()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[11];
  v3 = v0[9];
  v2 = v0[10];
  v4 = v0[8];
  swift_release();
  v0[2] = v4;
  v0[3] = v3;
  v0[4] = v2;
  v0[5] = v1;
  OUTLINED_FUNCTION_3_7();
}

uint64_t sub_24646F3C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_24646EE48(a1, (uint64_t (*)(uint64_t))MEMORY[0x24BDF47B0]);
  sub_246476D24(v1, v6, v5, v4, v2);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void sub_24646F428()
{
  sub_2464767A0();
}

uint64_t sub_24646F45C()
{
  return sub_246482278();
}

uint64_t sub_24646F494()
{
  return MEMORY[0x24BDF5560];
}

void sub_24646F4A0()
{
  OUTLINED_FUNCTION_3_7();
}

uint64_t sub_24646F4CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = (v3 + 72) & ~v3;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v5 = v1 + v4 + *(int *)(a1 + 52);
  swift_release();
  swift_release();
  v6 = OUTLINED_FUNCTION_2_11();
  (*(void (**)(uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v5 + *(int *)(v6 + 32));
  return swift_deallocObject();
}

void sub_24646F56C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v0[5];
  v3 = v0[6];
  v4 = v0[7];
  v1[2] = v0[4];
  v1[3] = v2;
  v1[4] = v3;
  v1[5] = v4;
  OUTLINED_FUNCTION_3_7();
}

uint64_t sub_24646F5B0(uint64_t a1)
{
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v9 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v10 = v2[2];
  v11 = v2[3];
  v12 = v2[8];
  v13 = (uint64_t)v2 + ((v9 + 72) & ~v9);
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 48) = v14;
  *v14 = v4;
  v14[1] = sub_24646F634;
  *(_QWORD *)(v8 + 16) = v7;
  return sub_24646F2E0(v1, v10, v11, v12, v13, v3, v5, v6);
}

uint64_t sub_24646F634()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24646F67C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24646F6BC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_24646F720;
  return v6(a1);
}

uint64_t sub_24646F720()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_9();
  return OUTLINED_FUNCTION_1_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24646F748()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24646F76C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24646F7DC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25757A838 + dword_25757A838))(a1, v4);
}

uint64_t sub_24646F7DC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_9();
  return OUTLINED_FUNCTION_1_10(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_1_10(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_11()
{
  return sub_24648235C();
}

void OUTLINED_FUNCTION_3_7()
{
  type metadata accessor for SnippetHostView();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_slowAlloc();
}

uint64_t sub_24646F84C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24646F854()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24648235C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24646F8D4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void (*v24)(unint64_t, unint64_t, uint64_t);
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = v6 & 0xF8 ^ 0xFFFFFFFFFFFFFFF8;
  v9 = v8 & (v6 + 16);
  v10 = ((v7 + 16) & ~v7) + *(_QWORD *)(v5 + 64) + 7;
  v11 = v6 & 0x100000;
  if (v7 > 7 || v11 != 0 || ((v10 + v9) & 0xFFFFFFFFFFFFFFF8) + 9 > 0x18)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + v9);
  }
  else
  {
    v15 = ~v7;
    v16 = a2[1];
    *a1 = *a2;
    a1[1] = v16;
    v17 = (_QWORD *)(v8 & ((unint64_t)a1 + 23));
    v18 = (_QWORD *)(v8 & ((unint64_t)a2 + 23));
    *v17 = *v18;
    v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
    v20 = (_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v19 = *v20;
    v21 = v7 + 8;
    v22 = ((unint64_t)v19 + v21) & v15;
    v23 = ((unint64_t)v20 + v21) & v15;
    v24 = *(void (**)(unint64_t, unint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v24(v22, v23, v4);
    v25 = ((unint64_t)v18 + v10) & 0xFFFFFFFFFFFFFFF8;
    v26 = *(_QWORD *)v25;
    LOBYTE(v25) = *(_BYTE *)(v25 + 8);
    v27 = ((unint64_t)v17 + v10) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)v27 = v26;
    *(_BYTE *)(v27 + 8) = v25;
  }
  swift_retain();
  return a1;
}

uint64_t sub_24646FA10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))((v6 + ((((a1 + (v6 | 7) + 16) & ~(v6 | 7)) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v6, v4);
  return swift_release();
}

_QWORD *sub_24646FAB4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v20;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v7 | 7) + 16;
  v9 = (_QWORD *)(((unint64_t)a2 + v8) & ~(v7 | 7));
  v20 = (_QWORD *)(((unint64_t)a1 + v8) & ~(v7 | 7));
  *v20 = *v9;
  v10 = (_QWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_QWORD *)(((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v10 = *v11;
  v12 = ((unint64_t)v10 + v7 + 8) & ~v7;
  v13 = ((unint64_t)v11 + v7 + 8) & ~v7;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v14(v12, v13, v5);
  v15 = *(_QWORD *)(v6 + 64) + ((v7 + 16) & ~v7) + 7;
  v16 = (unint64_t)v20 + v15;
  v17 = ((unint64_t)v9 + v15) & 0xFFFFFFFFFFFFFFF8;
  v18 = *(_QWORD *)v17;
  LOBYTE(v17) = *(_BYTE *)(v17 + 8);
  v16 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v17;
  swift_retain();
  return a1;
}

_QWORD *sub_24646FBC4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 | 7) + 16;
  v10 = (_QWORD *)(((unint64_t)a1 + v9) & ~(v8 | 7));
  v11 = (_QWORD *)(((unint64_t)a2 + v9) & ~(v8 | 7));
  *v10 = *v11;
  swift_retain();
  swift_release();
  v12 = (_QWORD *)(((unint64_t)v10 + 15) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  swift_retain();
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 24))(((unint64_t)v12 + v8 + 8) & ~v8, ((unint64_t)v13 + v8 + 8) & ~v8, v6);
  v14 = *(_QWORD *)(v7 + 64) + ((v8 + 16) & ~v8) + 7;
  v15 = ((unint64_t)v10 + v14) & 0xFFFFFFFFFFFFFFF8;
  v16 = ((unint64_t)v11 + v14) & 0xFFFFFFFFFFFFFFF8;
  v17 = *(_QWORD *)v16;
  LOBYTE(v16) = *(_BYTE *)(v16 + 8);
  *(_QWORD *)v15 = v17;
  *(_BYTE *)(v15 + 8) = v16;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24646FCF4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v5 | 7) + 16;
  v7 = (_QWORD *)(((unint64_t)a1 + v6) & ~(v5 | 7));
  v8 = (_QWORD *)(((unint64_t)a2 + v6) & ~(v5 | 7));
  *v7 = *v8;
  v9 = (_QWORD *)(((unint64_t)v7 + 15) & 0xFFFFFFFFFFFFFFF8);
  v10 = (_QWORD *)(((unint64_t)v8 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v9 = *v10;
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))(((unint64_t)v9 + v5 + 8) & ~v5, ((unint64_t)v10 + v5 + 8) & ~v5);
  v11 = *(_QWORD *)(v4 + 64) + ((v5 + 16) & ~v5) + 7;
  v12 = (unint64_t)v7 + v11;
  v13 = ((unint64_t)v8 + v11) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_BYTE *)(v13 + 8);
  v12 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *(_BYTE *)(v12 + 8) = v14;
  return a1;
}

_QWORD *sub_24646FDC0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v9 | 7) + 16;
  v11 = (_QWORD *)(((unint64_t)a1 + v10) & ~(v9 | 7));
  v12 = (_QWORD *)(((unint64_t)a2 + v10) & ~(v9 | 7));
  *v11 = *v12;
  swift_release();
  v13 = (_QWORD *)(((unint64_t)v11 + 15) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_QWORD *)(((unint64_t)v12 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  swift_release();
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))(((unint64_t)v13 + v9 + 8) & ~v9, ((unint64_t)v14 + v9 + 8) & ~v9, v7);
  v15 = *(_QWORD *)(v8 + 64) + ((v9 + 16) & ~v9) + 7;
  v16 = ((unint64_t)v11 + v15) & 0xFFFFFFFFFFFFFFF8;
  v17 = ((unint64_t)v12 + v15) & 0xFFFFFFFFFFFFFFF8;
  v18 = *(_QWORD *)v17;
  LOBYTE(v17) = *(_BYTE *)(v17 + 8);
  *(_QWORD *)v16 = v18;
  *(_BYTE *)(v16 + 8) = v17;
  swift_release();
  return a1;
}

uint64_t sub_24646FEC0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v17;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if ((int)v6 >= 0)
    v8 = 0x7FFFFFFF;
  else
    v8 = v7;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v5 + 80);
  v10 = v9 | 7;
  if (v8 >= a2)
  {
    if (v8 == 0x7FFFFFFF)
    {
      v17 = *(_QWORD *)(a1 + 8);
      if (v17 >= 0xFFFFFFFF)
        LODWORD(v17) = -1;
      return (v17 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload((v9 + ((((a1 + v10 + 16) & ~v10) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & ~v9, v6, v4);
    }
  }
  else
  {
    v11 = ((*(_QWORD *)(v5 + 64) + ((v9 + 16) & ~v9) + ((v9 + 16) & ~v10) + 7) & 0xFFFFFFFFFFFFFFF8) + 9;
    v12 = (a2 - v8 + 255) >> (8 * v11);
    if (v11 < 4)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24646FF6C + 4 * byte_2464845B0[v15]))();
  }
}

void sub_246470018(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  size_t v9;
  unsigned int v10;
  unsigned int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0x7FFFFFFF)
    v8 = 0x7FFFFFFF;
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (v7 >= 0)
    v8 = 0x7FFFFFFF;
  v9 = ((*(_QWORD *)(v6 + 64)
       + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(*(unsigned __int8 *)(v6 + 80) | 7))
       + ((*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
       + 7) & 0xFFFFFFFFFFFFFFF8)
     + 9;
  if (v8 >= a3)
  {
    v13 = 0;
  }
  else
  {
    v10 = (a3 - v8 + 255) >> (8 * v9);
    if (v9 <= 3)
      v11 = v10 + 1;
    else
      v11 = 2;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
  }
  if (v8 < a2)
  {
    v14 = ~v8 + a2;
    v15 = (~(_BYTE)v8 + a2);
    if (v9 >= 4)
      v16 = v14;
    else
      v16 = v15;
    bzero(a1, v9);
    if ((_DWORD)v9 == 1)
      *a1 = v16;
    else
      *(_DWORD *)a1 = v16;
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

void sub_24647015C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x2464701E0);
}

void sub_246470164(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x24647016CLL);
  JUMPOUT(0x2464701E0);
}

void sub_2464701BC()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x2464701E0);
}

void sub_2464701C4()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x2464701E0);
}

uint64_t sub_2464701CC@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_WORD *)(v9 + v10) = 0;
  if (!(_DWORD)a1)
    goto LABEL_6;
  if (v6 == 0x7FFFFFFF)
  {
    if ((a1 & 0x80000000) != 0)
      JUMPOUT(0x2464701D8);
    *(_QWORD *)(v9 + 8) = (a1 - 1);
LABEL_6:
    JUMPOUT(0x2464701E0);
  }
  return __swift_storeEnumTagSinglePayload((v5 + ((((v9 + v7 + 16) & v8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8) & a4, a1, a2, a3);
}

void type metadata accessor for _SnippetHostingView()
{
  JUMPOUT(0x24955BB70);
}

void sub_246470204()
{
  JUMPOUT(0x24955BBE8);
}

void sub_246470214(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  OUTLINED_FUNCTION_4_9();
}

uint64_t sub_24647024C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = v2 + *(int *)(a1 + 52);
  v5 = sub_24648235C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v4, v1, v5);
  v6 = v2 + *(int *)(a1 + 56);
  result = swift_getKeyPath();
  *(_QWORD *)v6 = result;
  *(_BYTE *)(v6 + 8) = 0;
  return result;
}

uint64_t sub_2464702B0()
{
  uint64_t v0;

  v0 = sub_24648235C();
  return MEMORY[0x24955B264](v0);
}

uint64_t sub_2464702E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  OUTLINED_FUNCTION_6_7((uint64_t)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  sub_24648235C();
  sub_246482350();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
}

uint64_t sub_246470388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24955BBE8](&unk_246484618, a3);
  return sub_2464822B4();
}

uint64_t sub_2464703E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24955BBE8](&unk_246484618, a3);
  return sub_246482284();
}

void sub_246470440(uint64_t a1)
{
  MEMORY[0x24955BBE8](&unk_246484618, a1);
  sub_2464822A8();
  __break(1u);
}

void sub_246470470(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;

  v3 = MEMORY[0x24BDAC7A8](a1, a2);
  MEMORY[0x24BDAC7A8](v3, v4);
  if (qword_257579660 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v5, (uint64_t)qword_25757A520);
  OUTLINED_FUNCTION_3_8();
  v6 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v2, v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_5_6();
    *(_WORD *)v7 = 0;
    OUTLINED_FUNCTION_8_8(&dword_24645B000, v2, v6, "_SnippetHostingView.makeUIViewController(_:context:)", v7);
    OUTLINED_FUNCTION_0_8();
  }

  type metadata accessor for _SnippetHostingController();
}

void sub_2464706D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  MEMORY[0x24BDAC7A8](a1, a1);
  (*(void (**)(char *))(v11 + 16))((char *)v12 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12[0] = a3;
  v12[1] = a4;
  v12[2] = a5;
  v12[3] = a6;
  type metadata accessor for _SnippetHostingView();
}

uint64_t sub_246470754(uint64_t a1)
{
  uint64_t v1;

  return sub_2464702E8(v1, a1);
}

void (*sub_24647077C(void *a1))()
{
  id v2;

  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v2 = a1;
  return sub_246470D44;
}

uint64_t sub_2464707D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  char v15;
  void (*v16)(char *, uint64_t);
  uint64_t result;
  uint64_t v18;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)&v18 - v10;
  if (qword_257579660 != -1)
    swift_once();
  v12 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v12, (uint64_t)qword_25757A520);
  OUTLINED_FUNCTION_3_8();
  v13 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v3, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_5_6();
    *(_WORD *)v14 = 0;
    OUTLINED_FUNCTION_8_8(&dword_24645B000, v3, v13, "SnippetHostView.updateUIViewController(_:context:)", v14);
    OUTLINED_FUNCTION_0_8();
  }

  sub_246470E74((uint64_t)v11);
  OUTLINED_FUNCTION_7_6();
  v15 = sub_2464823D4();
  v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v8, v4);
  result = ((uint64_t (*)(char *, uint64_t))v16)(v11, v4);
  if ((v15 & 1) == 0)
  {
    OUTLINED_FUNCTION_7_6();
    return sub_246471094();
  }
  return result;
}

uint64_t sub_246470954()
{
  NSObject *v0;
  uint64_t v1;
  os_log_type_t v2;
  uint8_t *v3;

  if (qword_257579660 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v1, (uint64_t)qword_25757A520);
  OUTLINED_FUNCTION_3_8();
  v2 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v0, v2))
  {
    v3 = (uint8_t *)OUTLINED_FUNCTION_5_6();
    *(_WORD *)v3 = 0;
    OUTLINED_FUNCTION_8_8(&dword_24645B000, v0, v2, "SnippetHostView.dismantleUIViewController(_:coordinator:)", v3);
    OUTLINED_FUNCTION_0_8();
  }

  return sub_246471FFC();
}

void sub_246470A18()
{
  OUTLINED_FUNCTION_4_9();
}

uint64_t sub_246470A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  v4 = v1 + ((v3 + 48) & ~v3);
  swift_bridgeObjectRelease();
  v5 = v4 + *(int *)(a1 + 52);
  swift_release();
  swift_release();
  v6 = sub_24648235C();
  (*(void (**)(uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v5 + *(int *)(v6 + 32));
  swift_release();
  return swift_deallocObject();
}

void sub_246470AF0()
{
  OUTLINED_FUNCTION_4_9();
}

void sub_246470B24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 - 8) + 80);
  sub_2464706D8(v1, v2 + ((v7 + 48) & ~v7), v3, v4, v5, v6);
}

uint64_t sub_246470B64(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = sub_246482218();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  if ((a2 & 1) == 0)
  {
    v9 = sub_246482500();
    v10 = sub_2464822D8();
    v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315138;
      v15 = sub_24646CE94(0xD000000000000015, 0x8000000246485E00, &v16);
      sub_2464825E4();
      _os_log_impl(&dword_24645B000, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v13, -1, -1);
      MEMORY[0x24955BC78](v12, -1, -1);
    }

    sub_24648220C();
    swift_getAtKeyPath();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return v16;
  }
  return a1;
}

uint64_t sub_246470D20()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_246470D44()
{
  sub_246472000();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_246482044();
}

void OUTLINED_FUNCTION_4_9()
{
  type metadata accessor for _SnippetHostingView();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return sub_24648205C();
}

uint64_t OUTLINED_FUNCTION_6_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  return sub_2464702B0();
}

void OUTLINED_FUNCTION_8_8(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

void _SnippetHostingController.__allocating_init(bundleIdentifier:viewModel:onViewModelUpdate:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  _SnippetHostingController.init(bundleIdentifier:viewModel:onViewModelUpdate:)(a1, a2);
}

uint64_t sub_246470E00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1, a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - v2);
  return sub_246471094();
}

void sub_246470E74(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t EnumTagSinglePayload;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v15 = a1;
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50);
  v4 = sub_2464825D8();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v15 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A8D0);
  OUTLINED_FUNCTION_20_1();
  MEMORY[0x24BDAC7A8](v8, v9);
  OUTLINED_FUNCTION_5_8();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A8D8);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v2, 1, v10);
  if ((_DWORD)EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_27(EnumTagSinglePayload, &qword_25757A8D0);
    v12 = 0;
    v13 = 0xC000000000000000;
  }
  else
  {
    OUTLINED_FUNCTION_25();
    sub_24645DA28();
    v12 = sub_24648208C();
    v13 = v14;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v2, v10);
  }
  sub_246481F78();
  swift_allocObject();
  sub_246481F6C();
  sub_246481F60();
  swift_release();
  OUTLINED_FUNCTION_21((uint64_t)v7, 0);
  sub_24645F708(v12, v13);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v15, v7, v3);
  OUTLINED_FUNCTION_2_9();
}

uint64_t sub_246471094()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A8D0);
  OUTLINED_FUNCTION_20_1();
  MEMORY[0x24BDAC7A8](v0, v1);
  OUTLINED_FUNCTION_5_8();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A8D8);
  if (OUTLINED_FUNCTION_15_2(v2) == 1)
  {
    v3 = OUTLINED_FUNCTION_14_2();
    return OUTLINED_FUNCTION_27(v3, &qword_25757A8D0);
  }
  else
  {
    sub_246465278();
    OUTLINED_FUNCTION_25();
    sub_24645DA28();
    sub_246482098();
    OUTLINED_FUNCTION_14_2();
    return OUTLINED_FUNCTION_12_2();
  }
}

void (*sub_24647118C(_QWORD *a1))(uint64_t a1, char a2)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  sub_246470E74((uint64_t)v7);
  return sub_24647121C;
}

void sub_24647121C(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    v5 = v2[1];
    v6 = v2[2];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v4, v5);
    sub_246471094();
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    sub_246471094();
  }
  free(v4);
  free(v3);
  free(v2);
}

void sub_2464712A8()
{
  sub_2464712C0(MEMORY[0x24BEBCDE0]);
}

void sub_2464712B4()
{
  sub_2464712C0(MEMORY[0x24BEBCDF0]);
}

void sub_2464712C0(void (*a1)(void))
{
  void *v2;
  void *v3;

  v2 = sub_246471304();
  if (v2)
  {
    v3 = v2;
    a1();
    OUTLINED_FUNCTION_6_8(v3);
  }
  else
  {
    __break(1u);
  }
}

void *sub_246471304()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + qword_25757A8E8);
  v2 = v1;
  return v1;
}

void sub_246471330(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + qword_25757A8E8);
  *(_QWORD *)(v1 + qword_25757A8E8) = a1;

}

uint64_t sub_246471344(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + qword_25757A8F0) = a1;
  return swift_unknownObjectRelease();
}

uint64_t sub_24647135C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + qword_25757A8F8);
  swift_retain();
  return v1;
}

void _SnippetHostingController.init(bundleIdentifier:viewModel:onViewModelUpdate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  MEMORY[0x24BDAC7A8](a1, a2);
  *(_QWORD *)(v2 + qword_25757A8E8) = 0;
  *(_QWORD *)(v2 + qword_25757A8F0) = 0;
  v3 = (_QWORD *)(v2 + qword_25757A8F8);
  *v3 = v4;
  v3[1] = v5;
  swift_retain();
  OUTLINED_FUNCTION_13_4();
}

id sub_246471450(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  *(_QWORD *)(v6 - 96) = v2;
  *(_QWORD *)(v6 - 88) = a1;
  v7 = objc_msgSendSuper2((objc_super *)(v6 - 96), sel_initWithNibName_bundle_, 0, 0);
  sub_2464723D0();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v1, v3);
  sub_246471094();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v1, v3);
  return v7;
}

void type metadata accessor for _SnippetHostingController()
{
  JUMPOUT(0x24955BB70);
}

void sub_2464714F4()
{
  char *v0;

  *(_QWORD *)&v0[qword_25757A8E8] = 0;
  *(_QWORD *)&v0[qword_25757A8F0] = 0;

  OUTLINED_FUNCTION_18_2();
  __break(1u);
}

void sub_24647155C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;

  v3 = a3;
  sub_2464714F4();
}

void _SnippetHostingController.__deallocating_deinit(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int128 a11, __int128 a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
  void *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  id v33;

  OUTLINED_FUNCTION_17_2();
  if (qword_257579650 != -1)
    swift_once();
  v26 = OUTLINED_FUNCTION_5_7();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_25757A4F0);
  v28 = v25;
  v29 = v27;
  sub_246482044();
  v30 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v27, v30))
  {
    v31 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v32 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v31 = 138543362;
    v33 = v28;
    sub_2464825E4();
    *v32 = v28;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v29, v30, "[%{public}@] Dealloc", v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  OUTLINED_FUNCTION_13_4();
}

#error "246471708: call analysis failed (funcsize=6)"

uint64_t sub_246471718(uint64_t a1)
{

  swift_unknownObjectRelease();
  return swift_release();
}

void sub_246471764()
{
  OUTLINED_FUNCTION_17_2();
  OUTLINED_FUNCTION_13_4();
}

void sub_2464717A0(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, objc_super a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  uint64_t v27;
  void *v28;
  void *v29;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  _QWORD *v36;
  id v37;
  id v38;
  uint64_t v39;
  unint64_t v40;

  a15.receiver = v28;
  a15.super_class = a1;
  -[objc_class preferredContentSizeDidChangeForChildContentContainer:](&a15, sel_preferredContentSizeDidChangeForChildContentContainer_, v27);
  if (qword_257579650 != -1)
    swift_once();
  v31 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v31, (uint64_t)qword_25757A4F0);
  v32 = v28;
  swift_unknownObjectRetain_n();
  v33 = v32;
  OUTLINED_FUNCTION_29();
  v34 = OUTLINED_FUNCTION_7_4();
  if (OUTLINED_FUNCTION_16_3(v34))
  {
    v35 = OUTLINED_FUNCTION_1_8();
    v36 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    a11 = OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v35 = 138543618;
    v37 = v29;
    sub_2464825E4();
    *v36 = v29;

    *(_WORD *)(v35 + 12) = 2080;
    v38 = OUTLINED_FUNCTION_26();
    v39 = MEMORY[0x24955B4B0](v38);
    sub_24646CE94(v39, v40, &a11);
    sub_2464825E4();
    OUTLINED_FUNCTION_23();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24645B000, v32, v30, "[%{public}@] preferredContentSizeDidChange: %s", (uint8_t *)v35, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_26();
  objc_msgSend(v29, sel_setPreferredContentSize_);
  OUTLINED_FUNCTION_2_12();
}

void sub_246471974(void *a1)
{
  swift_unknownObjectRetain();
  a1;
  sub_246471764();
}

void sub_2464719AC()
{
  void *v0;

  swift_unknownObjectRelease();

}

void sub_2464719C8()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A908);
  OUTLINED_FUNCTION_20_1();
  MEMORY[0x24BDAC7A8](v0, v1);
  OUTLINED_FUNCTION_13_4();
}

void sub_246471A4C(uint64_t a1)
{
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  *(_QWORD *)(v7 - 96) = v1;
  *(_QWORD *)(v7 - 88) = a1;
  objc_msgSendSuper2((objc_super *)(v7 - 96), sel_viewWillAppear_, v2 & 1);
  sub_2464712B4();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A910);
  v9 = OUTLINED_FUNCTION_15_2(v8);
  if ((_DWORD)v9 == 1)
  {
    OUTLINED_FUNCTION_27(v9, &qword_25757A908);
    v10 = 0;
  }
  else
  {
    v11 = OUTLINED_FUNCTION_3_2();
    swift_unknownObjectWeakInit();
    v12 = (_QWORD *)OUTLINED_FUNCTION_3_2();
    v12[2] = v3;
    v12[3] = v4;
    v12[4] = v5;
    v12[5] = v6;
    v12[6] = v11;
    OUTLINED_FUNCTION_25();
    sub_24645DA28();
    v10 = sub_246482074();
    swift_release();
    OUTLINED_FUNCTION_12_2();
  }
  sub_246471344(v10);
  OUTLINED_FUNCTION_2_9();
}

void sub_246471B44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  void *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  void *v32;
  NSObject *v33;
  _QWORD *v34;
  uint8_t *v35;
  void (*v36)(char *);
  _QWORD *v37;
  char *v38;
  uint8_t *v39;
  uint64_t v40;
  NSObject *v41;
  unint64_t v42;

  v39 = (uint8_t *)sub_2464825D8();
  v10 = MEMORY[0x24BDAC7A8](v39, v9);
  v12 = (char *)&v37 - v11;
  v13 = *(_QWORD *)(a3 - 8);
  v15 = MEMORY[0x24BDAC7A8](v10, v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v37 - v19;
  swift_beginAccess();
  v40 = MEMORY[0x24955BD20](a2 + 16);
  if (v40)
  {
    v37 = a6;
    v38 = v20;
    sub_246481F78();
    swift_allocObject();
    sub_246481F6C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757AA20);
    sub_246482068();
    v22 = (uint64_t)v41;
    v21 = v42;
    sub_246481F60();
    swift_release();
    sub_24645F708(v22, v21);
    __swift_storeEnumTagSinglePayload((uint64_t)v12, 0, 1, a3);
    v23 = v38;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v38, v12, a3);
    v24 = (void *)v40;
    sub_246470E74((uint64_t)v17);
    v25 = sub_2464823D4();
    v26 = *(void (**)(char *, uint64_t))(v13 + 8);
    v26(v17, a3);
    if ((v25 & 1) != 0)
    {
      v26(v23, a3);

    }
    else
    {
      if (qword_257579648 != -1)
        swift_once();
      v27 = sub_24648205C();
      __swift_project_value_buffer(v27, (uint64_t)qword_25757A4D8);
      v28 = v24;
      v29 = sub_246482044();
      v30 = sub_24648250C();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v37 = (_QWORD *)swift_slowAlloc();
        v32 = v24;
        v39 = v31;
        *(_DWORD *)v31 = 138543362;
        v41 = v28;
        v33 = v28;
        sub_2464825E4();
        v34 = v37;
        *v37 = v32;

        v23 = v38;
        v35 = v39;
        _os_log_impl(&dword_24645B000, v29, v30, "[%{public}@] Host received a new value from client", v39, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
        swift_arrayDestroy();
        MEMORY[0x24955BC78](v34, -1, -1);
        MEMORY[0x24955BC78](v35, -1, -1);
      }
      else
      {

        v29 = v28;
      }

      v36 = (void (*)(char *))sub_24647135C();
      v36(v23);

      swift_release();
      v26(v23, a3);
    }
  }
}

void sub_246471F14(void *a1)
{
  a1;
  sub_2464719C8();
}

void sub_246471F40()
{
  void *v0;

}

void sub_246471F54()
{
  OUTLINED_FUNCTION_13_4();
}

uint64_t sub_246471F8C(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  char v17;
  void *v18;
  objc_super v20;

  v20.receiver = v18;
  v20.super_class = a1;
  -[objc_class viewWillDisappear:](&v20, sel_viewWillDisappear_, v17 & 1);
  return sub_246471344(0);
}

void sub_246471FBC(void *a1)
{
  a1;
  sub_246471F54();
}

void sub_246471FE8()
{
  void *v0;

}

void sub_246472000()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;

  OUTLINED_FUNCTION_17_2();
  if (qword_257579650 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v2, (uint64_t)qword_25757A4F0);
  v3 = v0;
  OUTLINED_FUNCTION_29();
  v4 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v0, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v6 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v5 = 138543362;
    v7 = v1;
    sub_2464825E4();
    *v6 = v1;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v0, v4, "[%{public}@] Sending action to client", v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  type metadata accessor for SnippetHostingAction.HostToClient();
}

void sub_2464721DC()
{
  void *v0;
  os_log_type_t v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  if (qword_257579648 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_7();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25757A4D8);
  v4 = v0;
  v5 = v3;
  sub_246482044();
  v6 = OUTLINED_FUNCTION_7_4();
  if (OUTLINED_FUNCTION_16_3(v6))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v8 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v7 = 138543362;
    v9 = v4;
    sub_2464825E4();
    *v8 = v4;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v5, v1, "[%{public}@] Host received action from Client", v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  v10 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_257579618 != -1)
    swift_once();
  v11 = qword_257579A98;
  v12 = (void *)sub_246482008();
  objc_msgSend(v10, sel_postNotificationName_object_, v11, v12);

}

void sub_2464723D0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  id v48;
  os_log_type_t v49;
  uint8_t *v50;
  _QWORD *v51;
  id v52;
  NSObject *v53;
  void *v54;

  v1 = sub_246471304();

  if (v1)
    return;
  if (qword_257579650 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_7();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25757A4F0);
  v4 = v0;
  v53 = v3;
  sub_246482044();
  v5 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v3, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v7 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v6 = 138543362;
    v8 = v4;
    sub_2464825E4();
    *v7 = v4;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v3, v5, "[%{public}@] Creating snippet scene", v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  sub_246464954(0, &qword_25757AA28);
  swift_bridgeObjectRetain();
  v9 = sub_2464729F0();
  sub_246464954(0, (unint64_t *)&unk_25757AA30);
  v10 = objc_allocWithZone((Class)type metadata accessor for SceneHostingSpecification());
  v11 = v9;
  v12 = sub_246472A70(v11, objc_msgSend(v10, sel_init));
  sub_246471330((uint64_t)v12);
  v13 = sub_246471304();
  if (!v13)
  {
    __break(1u);
    goto LABEL_19;
  }
  v14 = v13;
  OUTLINED_FUNCTION_30(v13, sel_setDelegate_);

  v15 = sub_246471304();
  if (!v15)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, sel_sceneViewController);

  objc_msgSend(v4, sel_addChildViewController_, v17);
  v18 = objc_msgSend(v17, sel_view);
  if (!v18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v19 = v18;
  v20 = OUTLINED_FUNCTION_3_9();
  if (!v20)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v21 = v20;
  objc_msgSend(v20, sel_addSubview_, v19);

  objc_msgSend(v19, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257579E58);
  v22 = OUTLINED_FUNCTION_3_2();
  *(_OWORD *)(v22 + 16) = xmmword_246483B40;
  v23 = OUTLINED_FUNCTION_19(v22, sel_leadingAnchor);
  v24 = OUTLINED_FUNCTION_3_9();
  if (!v24)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v25 = v24;
  v26 = objc_msgSend(v24, sel_leadingAnchor);
  OUTLINED_FUNCTION_28();
  v27 = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_24();

  *(_QWORD *)(v22 + 32) = v25;
  v29 = OUTLINED_FUNCTION_19(v28, sel_trailingAnchor);
  v30 = OUTLINED_FUNCTION_3_9();
  if (!v30)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v31 = v30;
  v54 = v17;
  v32 = objc_msgSend(v30, sel_trailingAnchor);
  OUTLINED_FUNCTION_28();
  v33 = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_24();

  *(_QWORD *)(v22 + 40) = v31;
  v35 = OUTLINED_FUNCTION_19(v34, sel_topAnchor);
  v36 = OUTLINED_FUNCTION_3_9();
  if (!v36)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v37 = v36;
  v38 = objc_msgSend(v36, sel_topAnchor);
  OUTLINED_FUNCTION_28();
  v39 = OUTLINED_FUNCTION_7_7();
  OUTLINED_FUNCTION_24();

  *(_QWORD *)(v22 + 48) = v37;
  v41 = OUTLINED_FUNCTION_19(v40, sel_bottomAnchor);
  v42 = OUTLINED_FUNCTION_3_9();
  if (!v42)
  {
LABEL_25:
    __break(1u);
    return;
  }
  v43 = v42;
  v44 = (void *)objc_opt_self();
  v45 = objc_msgSend(v43, sel_bottomAnchor);

  v46 = objc_msgSend(v41, sel_constraintEqualToAnchor_, v45);
  *(_QWORD *)(v22 + 56) = v46;
  sub_246482458();
  sub_246464954(0, (unint64_t *)&qword_25757AA40);
  v47 = (void *)sub_246482434();
  swift_bridgeObjectRelease();
  objc_msgSend(v44, sel_activateConstraints_, v47);

  OUTLINED_FUNCTION_30(v54, sel_didMoveToParentViewController_);
  v48 = v4;
  sub_246482044();
  v49 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v53, v49))
  {
    v50 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v51 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v50 = 138543362;
    v52 = v48;
    sub_2464825E4();
    *v51 = v4;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v53, v49, "[%{public}@] Snippet scene did move to parent", v50);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

}

id sub_2464729F0()
{
  void *v0;
  id v1;

  v0 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityForEmbeddedApplicationIdentifier_, v0);

  return v1;
}

id SceneHostingSpecification.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id sub_246472A70(void *a1, void *a2)
{
  id v4;

  v4 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithProcessIdentity_sceneSpecification_, a1, a2);

  return v4;
}

void sub_246472AC8()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;

  v0 = sub_246471304();
  if (v0)
  {
    v1 = v0;
    v4 = objc_msgSend(v0, sel_sceneViewController);
    objc_msgSend(v4, sel_willMoveToParentViewController_, 0);
    v2 = objc_msgSend(v4, sel_view);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, sel_removeFromSuperview);

      objc_msgSend(v4, sel_removeFromParentViewController);
      sub_246471330(0);

      OUTLINED_FUNCTION_6_8(v4);
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_246472B80()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  id v6;
  id v7;

  if (qword_257579650 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v1, (uint64_t)qword_25757A4F0);
  v7 = v0;
  v2 = sub_246482044();
  v3 = sub_24648250C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v5 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v4 = 138543362;
    v6 = v7;
    sub_2464825E4();
    *v5 = v7;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v2, v3, "[%{public}@] clientIsReady", v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

}

void sub_246472D0C(void *a1)
{
  id v1;

  v1 = a1;
  sub_246472B80();

}

id _SnippetHostingController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2464823E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void _SnippetHostingController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_246472DE0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;

  if (a3)
    sub_2464823EC();
  v5 = a4;
  _SnippetHostingController.init(nibName:bundle:)();
}

id sub_246472E34()
{
  if (qword_257579628 != -1)
    swift_once();
  return (id)qword_257579DE0;
}

id SceneHostingSpecification.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingSpecification();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SceneHostingSpecification.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneHostingSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_246472EF4@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = xmmword_246484710;
  return result;
}

uint64_t sub_246472F04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_246472F40()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_246472F64()
{
  swift_release();
  return swift_deallocObject();
}

void sub_246472F88(uint64_t a1)
{
  uint64_t v1;

  sub_246471B44(a1, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD **)(v1 + 40));
}

uint64_t type metadata accessor for SceneHostingSpecification()
{
  return objc_opt_self();
}

void sub_246472FB8(uint64_t a1@<X8>)
{
  sub_246470E74(a1);
}

uint64_t sub_246472FDC()
{
  return 32;
}

__n128 sub_246472FE8(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_246472FF4()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for _SnippetHostingController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of _SnippetHostingController.viewModel.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of _SnippetHostingController.__allocating_init(bundleIdentifier:viewModel:onViewModelUpdate:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of _SnippetHostingController.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of _SnippetHostingController.sendAction(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of _SnippetHostingController.clientIsReady()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x128))();
}

ValueMetadata *type metadata accessor for DataModelKey()
{
  return &type metadata for DataModelKey;
}

id OUTLINED_FUNCTION_3_9()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

void OUTLINED_FUNCTION_5_8()
{
  sub_2464712A8();
}

void OUTLINED_FUNCTION_6_8(id a1)
{

}

id OUTLINED_FUNCTION_7_7()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  return objc_msgSend(v2, (SEL)(v1 + 3918), v0);
}

void OUTLINED_FUNCTION_10_4(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_12_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

void OUTLINED_FUNCTION_13_4()
{
  type metadata accessor for _SnippetHostingController();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15_2(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, a1);
}

BOOL OUTLINED_FUNCTION_16_3(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  return sub_246482710();
}

id OUTLINED_FUNCTION_19(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_unknownObjectRelease_n();
}

void OUTLINED_FUNCTION_24()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_getOpaqueTypeConformance2();
}

id OUTLINED_FUNCTION_26()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  return sub_246472F04(v2, a2);
}

void OUTLINED_FUNCTION_28()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_29()
{
  return sub_246482044();
}

id OUTLINED_FUNCTION_30(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

BOOL sub_246473260(int a1, int a2)
{
  return a1 == a2;
}

BOOL sub_24647326C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_246473278(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2464732C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_246473320 + 4 * byte_2464847E4[a2]))(0x656E6563735FLL);
}

uint64_t sub_246473320(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x656E6563735FLL && v1 == 0xE600000000000000)
    v3 = 1;
  else
    v3 = sub_246482764();
  OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_64();
  return v3 & 1;
}

void sub_2464733AC()
{
  OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22_0();
}

void sub_2464733D4()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_62();
  OUTLINED_FUNCTION_128(v0);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22_0();
}

uint64_t sub_2464733FC()
{
  sub_2464827E8();
  sub_246482800();
  return sub_24648280C();
}

uint64_t sub_246473440()
{
  return sub_246482800();
}

void sub_246473464()
{
  sub_2464827F4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246473484(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2464734C8()
{
  sub_246482404();
  return swift_bridgeObjectRelease();
}

void sub_24647351C()
{
  uint64_t v0;

  v0 = sub_2464827E8();
  OUTLINED_FUNCTION_128(v0);
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22_0();
}

void sub_246473548()
{
  sub_2464827E8();
  OUTLINED_FUNCTION_129();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22_0();
}

uint64_t sub_246473574()
{
  sub_2464827E8();
  sub_246482800();
  return sub_24648280C();
}

void sub_2464735B4(uint64_t a1, unint64_t a2)
{
  sub_246473668(a1, a2, &qword_25757A168);
}

void sub_2464735C0(uint64_t a1)
{
  id v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_21_1(a1, sel_otherSettings);
  if (a1)
  {
    OUTLINED_FUNCTION_46();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A250);
    sub_24648277C();
  }
  v3 = OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_135(v3, sel_setObject_forSetting_);
  OUTLINED_FUNCTION_65();

  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_8_4();
}

void sub_24647365C(void *a1)
{
  sub_246473734(a1);
}

void sub_246473668(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  void *v3;
  void *v5;
  id v8;
  uint64_t v9;

  v5 = v3;
  v8 = objc_msgSend(v5, sel_otherSettings);
  if (a2 >> 60 == 15)
  {
    v9 = 0;
  }
  else
  {
    sub_246462668(a1, a2);
    v9 = sub_24648277C();
  }
  OUTLINED_FUNCTION_1_5();
  objc_msgSend(v8, sel_setObject_forSetting_, v9, *a3);

  swift_unknownObjectRelease();
  sub_24646225C(a1, a2);
  OUTLINED_FUNCTION_70();
}

void sub_246473734(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_21_1((uint64_t)a1, sel_otherSettings);
  v3 = OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_135(v3, sel_setObject_forSetting_);

  OUTLINED_FUNCTION_8_4();
}

id SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  objc_class *v7;
  id v15;

  v15 = objc_allocWithZone(v7);
  return SnippetHostViewController.init<A>(bundleIdentifier:viewModel:)(a1, a2, a3, a4, a5, a6, a7);
}

void sub_24647382C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate;
  OUTLINED_FUNCTION_1_5();
  MEMORY[0x24955BD20](v1);
  OUTLINED_FUNCTION_22();
}

void sub_2464738B0()
{
  OUTLINED_FUNCTION_2_4();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_22();
}

void sub_2464738FC()
{
  swift_unknownObjectRetain();
  sub_2464738B0();
}

void sub_246473924(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  OUTLINED_FUNCTION_2_4();
  v3[3] = MEMORY[0x24955BD20](v5);
  OUTLINED_FUNCTION_13();
}

void sub_246473988(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t SnippetHostViewController.PresentationMode.description.getter(unsigned int a1)
{
  uint64_t result;

  if (a1 < 3)
    return *(_QWORD *)&aNone[8 * a1];
  result = sub_246482770();
  __break(1u);
  return result;
}

unint64_t SnippetHostViewController.PresentationMode.init(rawValue:)(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;

  v1 = a1;
  v2 = 2;
  if (a1 != 2)
    v2 = 0;
  v3 = a1 != 2;
  if (a1 == 1)
    v3 = 0;
  else
    v1 = v2;
  if (!a1)
  {
    v1 = 0;
    v3 = 0;
  }
  return v1 | ((unint64_t)v3 << 32);
}

BOOL sub_246473AA0(int *a1, int *a2)
{
  return sub_246473260(*a1, *a2);
}

uint64_t sub_246473AAC()
{
  return sub_2464733FC();
}

uint64_t sub_246473AB4()
{
  return sub_246473440();
}

uint64_t sub_246473ABC()
{
  return sub_246473574();
}

unint64_t sub_246473AC4@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;

  result = SnippetHostViewController.PresentationMode.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_246473AF4(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
}

uint64_t sub_246473B00()
{
  unsigned int *v0;

  return SnippetHostViewController.PresentationMode.description.getter(*v0);
}

uint64_t sub_246473B28()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
}

void sub_246473B78(unsigned int a1)
{
  BSDispatchQueueAssertMain();
  sub_24647898C(a1, 0);
}

void (*sub_246473BA0(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_DWORD *)(a1 + 8) = *(_DWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
  return sub_246473BC4;
}

void sub_246473BC4(uint64_t a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)(a1 + 8);
  BSDispatchQueueAssertMain();
  sub_24647898C(v1, 0);
  OUTLINED_FUNCTION_1_2();
}

void sub_246473C10()
{
  uint64_t v0;
  id *v1;
  id v2;

  v1 = (id *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics);
  OUTLINED_FUNCTION_1_5();
  v2 = *v1;
  OUTLINED_FUNCTION_22();
}

void sub_246473C94(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;
  id v5;

  v3 = (void **)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics);
  OUTLINED_FUNCTION_2_4();
  v4 = *v3;
  *v3 = a1;
  v5 = a1;

  BSDispatchQueueAssertMain();
  sub_24647A8C4();

  OUTLINED_FUNCTION_8_4();
}

void sub_246473CF0(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  sub_246473C94(v1);
}

void sub_246473D64()
{
  OUTLINED_FUNCTION_1_5();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_22();
}

void sub_246473DF8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects);
  OUTLINED_FUNCTION_2_4();
  *v3 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_22();
}

void sub_246473E3C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  sub_246473DF8(v0);
}

id sub_246473E84()
{
  uint64_t v0;
  id *v1;

  v1 = (id *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
  OUTLINED_FUNCTION_1_5();
  return *v1;
}

void sub_246473F08(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
  OUTLINED_FUNCTION_2_4();
  v4 = *v3;
  *v3 = a1;

  OUTLINED_FUNCTION_22();
}

void sub_246473F4C(id *a1)
{
  sub_246473F08(*a1);
}

void sub_246473F74()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246473FB0()
{
  uint64_t v0;

  sub_246468CA8(0, &qword_25757AD48);
  sub_2464765F8();
  qword_25757AA50 = v0;
}

void sub_246474008(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
}

uint64_t sub_246474014(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter) = a1;
  return swift_unknownObjectRelease();
}

void sub_24647402C(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView);
}

void sub_246474038(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
}

void sub_246474044()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier);
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier + 8))
  {
    *v1 = sub_2464740B0();
    v1[1] = v2;
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_28_0();
  }
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_13();
}

uint64_t sub_2464740B0()
{
  sub_2464826B0();
  sub_246482410();
  swift_bridgeObjectRetain();
  sub_246482410();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_246474150()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  v1 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue);
  if (!v2)
  {
    v3 = (void *)sub_2464741A8();
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    v5 = v3;

    v2 = 0;
  }
  v6 = v2;
  OUTLINED_FUNCTION_13();
}

uint64_t sub_2464741A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  uint64_t v13;

  v12 = sub_24648253C();
  v0 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v1);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_246482524();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4, v6);
  v7 = sub_246482380();
  MEMORY[0x24BDAC7A8](v7, v8);
  sub_246468CA8(0, &qword_25757AB60);
  v11[1] = v9;
  sub_246474044();
  sub_246482374();
  v13 = MEMORY[0x24BEE4AF8];
  sub_24646E2EC(&qword_25757AD70, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD78);
  sub_246480644(&qword_25757AD80, &qword_25757AD78);
  sub_246482608();
  (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v3, *MEMORY[0x24BEE5750], v12);
  return sub_246482560();
}

uint64_t sub_246474370(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer) = a1;
  return swift_release();
}

void sub_246474388(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer);
}

void sub_246474394(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer);
}

void sub_2464743A0(uint64_t a1)
{
  OUTLINED_FUNCTION_7_2(a1, OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController);
}

void sub_2464743AC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  char *v11;
  char isEscapingClosureAtFileLocation;
  _QWORD v13[6];

  v1 = v0;
  BSDispatchQueueAssertMain();
  if (qword_257579650 != -1)
    swift_once();
  v2 = sub_24648205C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25757A4F0);
  v3 = sub_246482044();
  v4 = sub_2464824E8();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_24645B000, v3, v4, "Host didSet wrappedValue and about to forward to client.", v5, 2u);
    MEMORY[0x24955BC78](v5, -1, -1);
  }

  v6 = *(void **)&v1[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v1;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = sub_24648083C;
    *(_QWORD *)(v8 + 24) = v7;
    v13[4] = sub_246480F54;
    v13[5] = v8;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_24647468C;
    v13[3] = &block_descriptor_138;
    v9 = _Block_copy(v13);
    v10 = v6;
    v11 = v1;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_performUpdate_, v9);

    _Block_release(v9);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
}

uint64_t sub_2464745A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD v11[5];

  type metadata accessor for LiveMutableSceneSettings();
  result = swift_dynamicCastClass();
  if (result)
  {
    v6 = a3 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
    swift_beginAccess();
    sub_24647FEB8(v6, (uint64_t)v11);
    __swift_project_boxed_opaque_existential_0(v11, v11[3]);
    v7 = a1;
    v8 = sub_246465278();
    v10 = v9;
    sub_246462668(v8, v9);
    sub_246473668(v8, v10, &qword_25757A670);
    sub_24645F708(v8, v10);

    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  }
  return result;
}

void sub_24647468C(uint64_t a1, void *a2, void *a3)
{
  void (*v4)(id, id);
  id v5;
  id v6;

  v4 = *(void (**)(id, id))(a1 + 32);
  v6 = a2;
  v5 = a3;
  v4(v6, v5);

}

id SnippetHostViewController.init<A>(bundleIdentifier:viewModel:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  uint64_t v12;
  uint64_t v13;
  objc_class *v14;
  char *v15;
  id v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  objc_class *v23;
  char *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  os_log_type_t v31;
  uint8_t *v32;
  id v33;
  _QWORD *v35;
  objc_super v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  objc_super v44;

  OUTLINED_FUNCTION_131();
  *(_DWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics] = 0;
  v12 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v13 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  v14 = (objc_class *)objc_allocWithZone((Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector());
  v15 = v7;
  v16 = OUTLINED_FUNCTION_39((uint64_t)v15, sel_init);
  *(_QWORD *)&v7[v13] = v16;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReady] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReadyBlocks] = v12;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks] = v12;
  v17 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions;
  OUTLINED_FUNCTION_16_4((uint64_t)v16, &qword_25757AAE0);
  *(_QWORD *)&v15[v17] = sub_2464823A4();
  v18 = &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer] = 0;
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer] = 0;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimeout] = 0x4014000000000000;
  if ((v12 & 0xC000000000000000) != 0 && sub_24648271C())
    v19 = sub_2464646CC(MEMORY[0x24BEE4AF8]);
  else
    v19 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_cancellables] = v19;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController] = 0;
  v20 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification;
  *(_QWORD *)&v15[v20] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneSpecification()), sel_init);
  v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost] = 0;
  v21 = &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
  *(_QWORD *)v21 = a1;
  *((_QWORD *)v21 + 1) = a2;
  v22 = OUTLINED_FUNCTION_2_3();
  sub_246465D8C();
  v23 = (objc_class *)OUTLINED_FUNCTION_59();
  v24 = (char *)OUTLINED_FUNCTION_117(v23);
  *(_QWORD *)&v24[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v22;
  v44.receiver = v24;
  v44.super_class = v14;
  *(_QWORD *)&v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics] = objc_msgSendSuper2(&v44, sel_init);
  v41 = a4;
  v42 = a5;
  v43 = a6;
  __swift_allocate_boxed_opaque_existential_2((uint64_t *)&v40);
  v25 = OUTLINED_FUNCTION_2_11();
  MEMORY[0x24955B264]();
  sub_246478EEC(&v40, &v15[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel]);

  v39.receiver = v15;
  v39.super_class = (Class)type metadata accessor for SnippetHostViewController();
  v26 = objc_msgSendSuper2(&v39, sel_initWithNibName_bundle_, 0, 0);
  v27 = qword_257579650;
  v28 = v26;
  if (v27 != -1)
    swift_once();
  v29 = OUTLINED_FUNCTION_5_7();
  v30 = OUTLINED_FUNCTION_55(v29, (uint64_t)qword_25757A4F0);
  OUTLINED_FUNCTION_54();
  v31 = OUTLINED_FUNCTION_7_4();
  if (OUTLINED_FUNCTION_79(v31))
  {
    v32 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v35 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v32 = 138543362;
    *(_QWORD *)&v40 = v30;
    v33 = v30;
    sub_2464825E4();
    *v35 = v30;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v28, (os_log_type_t)a2, "[%{public}@] Created", v32);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  sub_2464775D8(a3, a4, a5, a6, a7);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8))(a3, v25);
  return v30;
}

void sub_246474B4C()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_131();
  *(_DWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics] = 0;
  v1 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activityTouchRestrictedRects] = MEMORY[0x24BEE4AF8];
  v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  v3 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneClientSettingsDiffInspector()), sel_init);
  *(_QWORD *)&v0[v2] = v3;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReady] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_waitingForArchiveContentReadyBlocks] = v1;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks] = v1;
  v4 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions;
  OUTLINED_FUNCTION_16_4((uint64_t)v3, &qword_25757AAE0);
  *(_QWORD *)&v0[v4] = sub_2464823A4();
  v5 = &v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___logIdentifier];
  *v5 = 0;
  v5[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController____lazy_storage___queue] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer] = 0;
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimeout] = 0x4014000000000000;
  if ((v1 & 0xC000000000000000) != 0 && sub_24648271C())
    v6 = sub_2464646CC(MEMORY[0x24BEE4AF8]);
  else
    v6 = MEMORY[0x24BEE4B08];
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_cancellables] = v6;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_modalSceneViewController] = 0;
  v7 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneSpecification()), sel_init);
  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost] = 0;

  sub_246482710();
  __break(1u);
}

void SnippetHostViewController.__deallocating_deinit()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;

  OUTLINED_FUNCTION_67();
  if (qword_257579650 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_7();
  v3 = (char *)OUTLINED_FUNCTION_55(v2, (uint64_t)qword_25757A4F0);
  OUTLINED_FUNCTION_54();
  v4 = OUTLINED_FUNCTION_7_4();
  if (OUTLINED_FUNCTION_27_0(v0))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v6 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    OUTLINED_FUNCTION_26_0(5.8381e-34);
    OUTLINED_FUNCTION_14_3();
    *v6 = v3;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v0, v4, "[%{public}@] Dealloc", v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  objc_msgSend(*(id *)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector], sel_removeAllObservers);
  sub_2464767A0();
  v15.receiver = v3;
  v15.super_class = (Class)type metadata accessor for SnippetHostViewController();
  OUTLINED_FUNCTION_144((int)v15.super_class, sel_dealloc, v7, v8, v9, v10, v11, v12, v13, v14, v15);
  OUTLINED_FUNCTION_13_5();
}

void sub_24647503C()
{
  void *v0;
  objc_class *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  objc_class *v15;
  char *v16;
  id v17;
  objc_super v18;
  objc_super v19;

  BSDispatchQueueAssertMain();
  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for SnippetHostViewController();
  OUTLINED_FUNCTION_144((int)v19.super_class, sel_viewDidLoad, v2, v3, v4, v5, v6, v7, (uint64_t)v18.receiver, (uint64_t)v18.super_class, v19);
  sub_24647BB8C();
  v9 = OUTLINED_FUNCTION_21_1(v8, sel_view);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_frame);
    OUTLINED_FUNCTION_141();
    v11 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_116();
    OUTLINED_FUNCTION_58();
    v12 = OUTLINED_FUNCTION_85();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel__cornerRadius);

      v14 = objc_allocWithZone((Class)OUTLINED_FUNCTION_2_3());
      OUTLINED_FUNCTION_36();
      v15 = (objc_class *)OUTLINED_FUNCTION_59();
      v16 = (char *)OUTLINED_FUNCTION_117(v15);
      *(_QWORD *)&v16[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v10;
      v18.receiver = v16;
      v18.super_class = v1;
      v17 = objc_msgSendSuper2(&v18, sel_init);
      sub_246473F08(v17);
      OUTLINED_FUNCTION_4_4();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_246475168(char a1)
{
  void *v1;
  uint64_t v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v5, sel_viewWillAppear_, a1 & 1);
  v3 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_136();
  sub_24647A6C4((uint64_t)sub_24647EC60, v3);
  return OUTLINED_FUNCTION_2_8();
}

void sub_2464751D4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v4 = a3 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x24955BD20](v4);
  if (v5)
  {
    v6 = (void *)v5;
    type metadata accessor for LiveMutableSceneSettings();
    v7 = swift_dynamicCastClass();
    if (v7)
    {
      v8 = (void *)v7;
      v9 = a1;
      v10 = objc_msgSend(v6, sel_traitCollection);
      v11 = objc_msgSend(v10, sel_userInterfaceStyle);

      objc_msgSend(v8, sel_setUserInterfaceStyle_, v11);
      v6 = v9;
    }

  }
}

void sub_2464752EC(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v5[4];
  objc_super v6;

  BSDispatchQueueAssertMain();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v6, sel_willTransitionToTraitCollection_withTransitionCoordinator_, a1, a2);
  v5[2] = a1;
  sub_24647A6C4((uint64_t)sub_24647EC68, (uint64_t)v5);
  OUTLINED_FUNCTION_70();
}

void sub_246475350(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  type metadata accessor for LiveMutableSceneSettings();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = a1;
    objc_msgSend(v6, sel_setUserInterfaceStyle_, objc_msgSend(a3, sel_userInterfaceStyle));

  }
}

void sub_24647544C(uint64_t a1, char a2)
{
  char *v2;
  char *v5;
  objc_super v6;

  BSDispatchQueueAssertMain();
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a1, a2 & 1);
  v5 = &v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost];
  OUTLINED_FUNCTION_1_5();
  if (*v5 == 1)
  {
    if (a1)
      sub_24647AF60();
    else
      sub_24647B9F8();
  }
  OUTLINED_FUNCTION_70();
}

void sub_246475530()
{
  void *v0;
  objc_class *v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  objc_class *v15;
  char *v16;
  id v17;
  objc_super v18;
  objc_super v19;

  v19.receiver = v0;
  v19.super_class = (Class)type metadata accessor for SnippetHostViewController();
  v8 = OUTLINED_FUNCTION_144((int)v19.super_class, sel_viewDidLayoutSubviews, v2, v3, v4, v5, v6, v7, (uint64_t)v18.receiver, (uint64_t)v18.super_class, v19);
  v9 = OUTLINED_FUNCTION_21_1((uint64_t)v8, sel_view);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_frame);
    OUTLINED_FUNCTION_141();
    v11 = objc_allocWithZone((Class)type metadata accessor for SizeDimensionRequest());
    OUTLINED_FUNCTION_60();
    OUTLINED_FUNCTION_116();
    OUTLINED_FUNCTION_58();
    v12 = OUTLINED_FUNCTION_85();
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel__cornerRadius);

      v14 = objc_allocWithZone((Class)OUTLINED_FUNCTION_2_3());
      OUTLINED_FUNCTION_36();
      v15 = (objc_class *)OUTLINED_FUNCTION_59();
      v16 = (char *)OUTLINED_FUNCTION_117(v15);
      *(_QWORD *)&v16[OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics] = v10;
      v18.receiver = v16;
      v18.super_class = v1;
      v17 = objc_msgSendSuper2(&v18, sel_init);
      sub_246473F08(v17);
      OUTLINED_FUNCTION_4_4();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_246475654(uint64_t a1)
{
  void *v1;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = v1;
  v6.super_class = (Class)type metadata accessor for SnippetHostViewController();
  objc_msgSendSuper2(&v6, sel_traitCollectionDidChange_, a1);
  v5 = v1;
  return sub_24647A6C4((uint64_t)sub_24647EC70, (uint64_t)&v4);
}

void sub_2464756A8(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  type metadata accessor for LiveMutableSceneSettings();
  v5 = swift_dynamicCastClass();
  if (v5)
  {
    v6 = (void *)v5;
    v9 = a1;
    v7 = objc_msgSend(a3, sel_traitCollection);
    v8 = objc_msgSend(v7, sel_userInterfaceStyle);

    objc_msgSend(v6, sel_setUserInterfaceStyle_, v8);
  }
}

void sub_2464757BC()
{
  strcpy((char *)&qword_25757AE98, "sceneActivated");
  unk_25757AEA7 = -18;
}

void sub_2464757EC(uint64_t a1, uint64_t a2, void *a3, double a4)
{
  void *v4;
  uint64_t v8;
  NSObject *v9;
  char *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  void *v19;
  char aBlock;
  char *v21;
  id v22;
  id v23;
  unsigned __int8 *v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint8_t *v28;
  _QWORD *v29;
  uint8_t *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  char *v36;
  id v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t ObjectType;
  uint64_t v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  ObjectType = swift_getObjectType();
  BSDispatchQueueAssertMain();
  if (qword_257579650 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_5_7();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_25757A4F0);
  v10 = v4;
  sub_246482044();
  v11 = OUTLINED_FUNCTION_7_4();
  if (os_log_type_enabled(v9, v11))
  {
    v12 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v13 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v12 = 138543362;
    v14 = v10;
    sub_2464825E4();
    *v13 = v10;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v9, v11, "[%{public}@] Ensure content begin", v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  if (!*(_QWORD *)&v10[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene])
    sub_24647898C(*(_DWORD *)&v10[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode], 1);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BEB8]), sel_init);
  if (qword_257579678 != -1)
    swift_once();
  v16 = qword_25757AE98;
  v17 = unk_25757AEA0;
  OUTLINED_FUNCTION_112();
  sub_24647FDB0(v16, v17, v15);
  OUTLINED_FUNCTION_28_0();
  v18 = (_QWORD *)OUTLINED_FUNCTION_3_2();
  v19 = (void *)a1;
  v18[2] = v15;
  v18[3] = a1;
  v18[4] = v10;
  v18[5] = a2;
  v18[6] = a3;
  aBlock = MEMORY[0x24BDAC760];
  OUTLINED_FUNCTION_115((uint64_t)sub_24646DD14, v49, v51, ObjectType, a1, MEMORY[0x24BDAC760], 1107296256, v57, v59);
  v21 = v10;
  v22 = v15;
  v23 = v19;
  swift_retain();
  OUTLINED_FUNCTION_29_0();
  OUTLINED_FUNCTION_30(v22, sel_setCompletionBlock_);
  OUTLINED_FUNCTION_23_0();
  LODWORD(v16) = v21[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated];
  v24 = v21;
  v25 = v9;
  sub_246482044();
  v26 = OUTLINED_FUNCTION_7_4();
  v27 = os_log_type_enabled(v9, v26);
  if ((_DWORD)v16 == 1)
  {
    if (v27)
    {
      v28 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      v29 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v28 = 138543362;
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_75();
      *v29 = v24;

      OUTLINED_FUNCTION_10_4(&dword_24645B000, v25, v26, "[%{public}@] Ensure content: scene activated", v28);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

    v32 = qword_25757AE98;
    v33 = unk_25757AEA0;
    swift_bridgeObjectRetain();
    sub_24647FE74(v32, v33, v22);
    OUTLINED_FUNCTION_64();
  }
  else
  {
    if (v27)
    {
      v30 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      v31 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v30 = 138543362;
      OUTLINED_FUNCTION_76();
      OUTLINED_FUNCTION_123();
      OUTLINED_FUNCTION_75();
      *v31 = v24;

      OUTLINED_FUNCTION_10_4(&dword_24645B000, v25, v26, "[%{public}@] Ensure content: waiting on scene activation", v30);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

    v34 = (_QWORD *)OUTLINED_FUNCTION_3_2();
    v34[2] = v24;
    v34[3] = v22;
    v34[4] = v54;
    v35 = (char *)&v24[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks];
    OUTLINED_FUNCTION_2_4();
    v36 = v24;
    v37 = v22;
    sub_24647E7E8();
    v38 = *(char **)(*(_QWORD *)v35 + 16);
    sub_24647E830(v38);
    v39 = *(_QWORD *)v35;
    *(_QWORD *)(v39 + 16) = v38 + 1;
    v40 = v39 + 16 * (_QWORD)v38;
    *(_QWORD *)(v40 + 32) = sub_24647FE60;
    *(_QWORD *)(v40 + 40) = v34;
    swift_endAccess();
  }
  objc_msgSend(v22, sel_begin);
  v41 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer;
  OUTLINED_FUNCTION_16_4((uint64_t)objc_msgSend(*(id *)&v24[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer], sel_invalidate), &qword_25757AB58);
  sub_2464765F8();
  sub_246474388(v42);
  v44 = *(void **)&v24[v41];
  if (v44)
  {
    OUTLINED_FUNCTION_16_4(v43, &qword_25757AB60);
    v45 = v44;
    v46 = sub_246482548();
    *(_QWORD *)(OUTLINED_FUNCTION_3_2() + 16) = v22;
    v47 = OUTLINED_FUNCTION_115((uint64_t)sub_24646A7A4, v50, v52, v54, v56, aBlock, 1107296256, v58, v60);
    v48 = v22;
    OUTLINED_FUNCTION_11_2();
    objc_msgSend(v45, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v46, v47, a4, 0.0);

    _Block_release(v47);
    v22 = (id)v46;
  }

}

uint64_t sub_246475E18(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v25[1] = a3;
  v10 = sub_246482368();
  v26 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_246482380();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend(a2, sel_error);
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = v19;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  aBlock[4] = sub_246480878;
  aBlock[5] = v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_246476408;
  aBlock[3] = &block_descriptor_144;
  v21 = _Block_copy(aBlock);
  v22 = v19;
  v23 = a4;
  swift_retain();
  sub_246482374();
  v27 = MEMORY[0x24BEE4AF8];
  sub_24646E2EC(&qword_25757AD50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD58);
  sub_246480644(&qword_25757AD60, &qword_25757AD58);
  sub_246482608();
  MEMORY[0x24955B474](0, v18, v13, v21);
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  return swift_release();
}

uint64_t sub_246476038(void *a1, void *a2, uint64_t (*a3)(void *))
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;

  if (a1)
  {
    if (qword_257579650 != -1)
      swift_once();
    v6 = sub_24648205C();
    __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
    v7 = a2;
    v8 = a1;
    v9 = v7;
    v10 = a1;
    v11 = sub_246482044();
    v12 = sub_24648250C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v26 = v25;
      *(_DWORD *)v13 = 138543618;
      v15 = v9;
      sub_2464825E4();
      *v14 = v9;

      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      v16 = sub_2464827A0();
      sub_24646CE94(v16, v17, &v26);
      sub_2464825E4();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24645B000, v11, v12, "[%{public}@] Ensure content failed: %{public}s", (uint8_t *)v13, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v14, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v25, -1, -1);
      MEMORY[0x24955BC78](v13, -1, -1);
    }
    else
    {

    }
  }
  else
  {
    if (qword_257579650 != -1)
      swift_once();
    v18 = sub_24648205C();
    __swift_project_value_buffer(v18, (uint64_t)qword_25757A4F0);
    v11 = a2;
    v19 = sub_246482044();
    v20 = sub_24648250C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v21 = 138543362;
      v26 = (uint64_t)v11;
      v23 = v11;
      sub_2464825E4();
      *v22 = v11;

      _os_log_impl(&dword_24645B000, v19, v20, "[%{public}@] Ensure content complete", v21, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v22, -1, -1);
      MEMORY[0x24955BC78](v21, -1, -1);

      return a3(0);
    }

  }
  return a3(a1);
}

uint64_t sub_24647640C(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  if (qword_257579650 != -1)
    swift_once();
  v4 = sub_24648205C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25757A4F0);
  v5 = a1;
  v6 = sub_246482044();
  v7 = sub_24648250C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138543362;
    v10 = v5;
    sub_2464825E4();
    *v9 = v5;

    _os_log_impl(&dword_24645B000, v6, v7, "[%{public}@] Ensure content: scene activated", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    swift_arrayDestroy();
    MEMORY[0x24955BC78](v9, -1, -1);
    MEMORY[0x24955BC78](v8, -1, -1);

  }
  else
  {

  }
  if (qword_257579678 != -1)
    swift_once();
  v11 = qword_25757AE98;
  v12 = unk_25757AEA0;
  swift_bridgeObjectRetain();
  sub_24647FE74(v11, v12, a2);
  return swift_bridgeObjectRelease();
}

void sub_2464765F8()
{
  id v0;
  void *v1;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2464823E0();
  OUTLINED_FUNCTION_65();
  objc_msgSend(v0, sel_initWithIdentifier_, v1);

  OUTLINED_FUNCTION_13();
}

id sub_24647665C(void *a1, id a2)
{
  if ((objc_msgSend(a2, sel_isComplete) & 1) == 0)
    sub_24647FEFC(0x756F2064656D6974, 0xE900000000000074, a2, (SEL *)&selRef_failWithReason_);
  return objc_msgSend(a1, sel_invalidate);
}

void sub_246476754(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_246481FCC();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_2464767A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  char *v7;

  OUTLINED_FUNCTION_67();
  BSDispatchQueueAssertMain();
  v1 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated;
  if ((*((_BYTE *)&v0->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) & 1) == 0)
  {
    if (qword_257579650 != -1)
      swift_once();
    v2 = OUTLINED_FUNCTION_5_7();
    v3 = (char *)OUTLINED_FUNCTION_56(v2, (uint64_t)qword_25757A4F0);
    sub_246482044();
    v4 = OUTLINED_FUNCTION_7_4();
    if (os_log_type_enabled(v0, v4))
    {
      v5 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      v6 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v5 = 138543362;
      v7 = v3;
      OUTLINED_FUNCTION_75();
      *v6 = v3;

      OUTLINED_FUNCTION_10_4(&dword_24645B000, v0, v4, "[%{public}@] Invalidated", v5);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

    OUTLINED_FUNCTION_2_4();
    swift_unknownObjectWeakAssign();
    *((_BYTE *)&v0->isa + v1) = 1;
    sub_24647A7E8();
    if (*(_QWORD *)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer])
    {
      OUTLINED_FUNCTION_44();
      sub_24646A7F4();
      OUTLINED_FUNCTION_9_0();
    }
    sub_246474370(0);
    OUTLINED_FUNCTION_66(*(void **)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_ensureContentTimer]);
    sub_246474388(0);
    OUTLINED_FUNCTION_66(*(void **)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer]);
    sub_246474394(0);
  }
  OUTLINED_FUNCTION_13_5();
}

unint64_t sub_246476A10()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v12;
  unint64_t v13;

  v1 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode;
  v2 = *(_DWORD *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode);
  if (v2 == 1)
  {
    sub_246482680();
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000014;
    v13 = 0x8000000246485FE0;
    v5 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView);
    if (v5)
    {
      v6 = OUTLINED_FUNCTION_92(v5);
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_103();
    }
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_40();
  }
  else if (v2 == 2)
  {
    sub_246482680();
    swift_bridgeObjectRelease();
    v12 = 0xD000000000000012;
    v13 = 0x8000000246486000;
    v3 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
    if (v3)
    {
      v4 = OUTLINED_FUNCTION_92(v3);
      OUTLINED_FUNCTION_83();
      OUTLINED_FUNCTION_103();
    }
    OUTLINED_FUNCTION_34();
    OUTLINED_FUNCTION_40();
    OUTLINED_FUNCTION_93();
  }
  v12 = 0;
  v13 = 0xE000000000000000;
  sub_246482680();
  sub_246482410();
  SnippetHostViewController.PresentationMode.description.getter(*(_DWORD *)(v0 + v1));
  sub_246482410();
  OUTLINED_FUNCTION_105();
  sub_246482410();
  sub_246482410();
  OUTLINED_FUNCTION_105();
  sub_246482410();
  v7 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v7)
  {
    v8 = OUTLINED_FUNCTION_92(v7);
    OUTLINED_FUNCTION_83();

  }
  sub_246482410();
  OUTLINED_FUNCTION_105();
  OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_40();
  sub_246482410();
  v9 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v9)
  {
    v10 = OUTLINED_FUNCTION_92(v9);
    OUTLINED_FUNCTION_83();

  }
  sub_246482410();
  OUTLINED_FUNCTION_28_0();
  sub_246482410();
  return v12;
}

void sub_246476D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
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
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  void (*v31)(uint64_t, uint64_t);
  uint64_t v32;
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
  _BYTE v43[56];

  v33 = a5;
  v38 = a4;
  v36 = a3;
  v42 = a1;
  v7 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v40 = (uint64_t)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2464825D8();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v34 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v11 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v10);
  v13 = (char *)&v33 - v12;
  MEMORY[0x24BDAC7A8](v11, v14);
  OUTLINED_FUNCTION_87();
  v41 = v15 - v16;
  v19 = MEMORY[0x24BDAC7A8](v17, v18);
  v21 = (char *)&v33 - v20;
  MEMORY[0x24BDAC7A8](v19, v22);
  v24 = (char *)&v33 - v23;
  v37 = v5;
  v25 = v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
  OUTLINED_FUNCTION_1_5();
  sub_24647FEB8(v25, (uint64_t)v43);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AB68);
  v26 = OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_121((uint64_t)v24, v26 ^ 1u);
  v39 = v7;
  OUTLINED_FUNCTION_119((uint64_t)v21);
  OUTLINED_FUNCTION_121((uint64_t)v21, 0);
  v35 = TupleTypeMetadata2;
  v27 = (uint64_t)&v13[*(int *)(TupleTypeMetadata2 + 48)];
  OUTLINED_FUNCTION_95((uint64_t)v13, (uint64_t)v24);
  OUTLINED_FUNCTION_95(v27, (uint64_t)v21);
  OUTLINED_FUNCTION_80((uint64_t)v13);
  if (v28)
  {
    OUTLINED_FUNCTION_52((uint64_t)v21);
    OUTLINED_FUNCTION_80(v27);
    if (v28)
    {
      OUTLINED_FUNCTION_52((uint64_t)v13);
      OUTLINED_FUNCTION_52((uint64_t)v24);
      goto LABEL_12;
    }
LABEL_9:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v13, v35);
    OUTLINED_FUNCTION_52((uint64_t)v24);
LABEL_11:
    v32 = v40;
    OUTLINED_FUNCTION_119(v40);
    sub_24647FF50(v32, v37, a2, v36, v38);
    goto LABEL_12;
  }
  OUTLINED_FUNCTION_95(v41, (uint64_t)v13);
  OUTLINED_FUNCTION_80(v27);
  if (v28)
  {
    OUTLINED_FUNCTION_52((uint64_t)v21);
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, a2);
    goto LABEL_9;
  }
  v29 = v40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v40, v27, a2);
  v30 = sub_2464823D4();
  v31 = *(void (**)(uint64_t, uint64_t))(v39 + 8);
  v31(v29, a2);
  OUTLINED_FUNCTION_99((uint64_t)v21);
  v31(v41, a2);
  OUTLINED_FUNCTION_99((uint64_t)v13);
  OUTLINED_FUNCTION_99((uint64_t)v24);
  if ((v30 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  OUTLINED_FUNCTION_2_9();
}

uint64_t sub_24647702C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost);
  OUTLINED_FUNCTION_1_5();
  return *v1;
}

void sub_2464770A8(char a1)
{
  uint64_t v1;
  _BYTE *v3;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost);
  OUTLINED_FUNCTION_2_4();
  *v3 = a1;
  sub_2464770EC();
  OUTLINED_FUNCTION_8_4();
}

void sub_2464770EC()
{
  uint64_t v0;
  _BYTE *v1;

  BSDispatchQueueAssertMain();
  v1 = (_BYTE *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_shouldShareTouchesWithHost);
  swift_beginAccess();
  if (*v1 == 1)
    sub_24647AF60();
  else
    sub_24647B9F8();
}

void sub_246477148(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void sub_246477188(uint64_t a1, char a2)
{
  swift_endAccess();
  if ((a2 & 1) == 0)
    sub_2464770EC();
  OUTLINED_FUNCTION_1_2();
}

void sub_2464771B4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  double v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  __int128 v35;
  uint64_t v36;
  __int128 v37;
  void (*v38)(uint64_t, void *);
  void *v39;
  void (*v40)(void *);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  OUTLINED_FUNCTION_74();
  v42 = v4;
  v43 = v5;
  sub_246481FF0();
  OUTLINED_FUNCTION_104();
  MEMORY[0x24BDAC7A8](v6, v7);
  OUTLINED_FUNCTION_9_4();
  BSDispatchQueueAssertMain();
  v8 = OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v8 + 16) = v0;
  v40 = sub_24647FFE4;
  v41 = v8;
  *(_QWORD *)&v37 = MEMORY[0x24BDAC760];
  *((_QWORD *)&v37 + 1) = 1107296256;
  v38 = sub_246477554;
  v39 = &block_descriptor_18;
  _Block_copy(&v37);
  v9 = v0;
  OUTLINED_FUNCTION_29_0();
  v10 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
  OUTLINED_FUNCTION_23_0();
  v12 = OUTLINED_FUNCTION_21_1(v11, sel_view);
  if (!v12)
  {
    __break(1u);
    goto LABEL_20;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_window);

  if (!v14)
    goto LABEL_17;
  if (!v10)
  {

LABEL_18:
    OUTLINED_FUNCTION_86();
    return;
  }
  v15 = *(void **)&v9[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v15)
  {

LABEL_17:
    swift_unknownObjectRelease();
    goto LABEL_18;
  }
  v16 = (void *)*MEMORY[0x24BEBDF78];
  if (*MEMORY[0x24BEBDF78])
  {
    swift_unknownObjectRetain();
    v17 = v15;
    v33 = v14;
    v18 = objc_msgSend(v16, sel__initialTouchTimestampForWindow_, v14);
    v20 = v19;
    v32 = v17;
    v21 = OUTLINED_FUNCTION_21_1((uint64_t)v18, sel_layerManager);
    v22 = objc_msgSend(v21, sel_layers);

    v36 = MEMORY[0x24BEE4AF8];
    v31 = v22;
    sub_2464824DC();
    OUTLINED_FUNCTION_100();
    while (v39)
    {
      sub_246462270(&v37, &v35);
      sub_246468CA8(0, (unint64_t *)&unk_25757AB70);
      if ((OUTLINED_FUNCTION_81() & 1) != 0)
      {
        v23 = objc_msgSend(v34, sel_contextID, v31, v32);
        v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0B6F0]), sel_init);
        v25 = objc_msgSend((id)objc_opt_self(), sel_policyCancelingTouchesDeliveredToContextId_withInitialTouchTimestamp_, v23, v20);
        v26 = v25;
        if (v25)
        {
          v27 = v25;
          objc_msgSend(v27, sel_setAssertionEndpoint_, OUTLINED_FUNCTION_21_1((uint64_t)v27, sel_endpoint));

          swift_unknownObjectRelease();
        }
        OUTLINED_FUNCTION_96(v10, sel_ipc_addPolicy_);
        v28 = v24;
        MEMORY[0x24955B348]();
        if (*(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_246482464();
        sub_246482470();
        sub_246482458();

      }
      OUTLINED_FUNCTION_100();
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
    v29 = objc_allocWithZone((Class)type metadata accessor for SceneCancelTouchAssertion());
    v30 = OUTLINED_FUNCTION_127();
    sub_24645F7D0(v30);
    OUTLINED_FUNCTION_97();

    swift_unknownObjectRelease_n();
    goto LABEL_18;
  }
LABEL_20:
  __break(1u);
}

void sub_246477554(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

void sub_2464775D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = v5;
  v31 = a4;
  v32 = a5;
  v29 = a2;
  v30 = a3;
  v28 = a1;
  v7 = sub_24648235C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v28 - v10;
  v12 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector;
  v13 = *(void **)(v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector);
  v14 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_136();
  OUTLINED_FUNCTION_1_5();
  v15 = qword_25757A180;
  v16 = v13;
  OUTLINED_FUNCTION_111();
  sub_246467C28(v15, (uint64_t)sub_246480A48, v14);

  OUTLINED_FUNCTION_110();
  v17 = *(void **)(v6 + v12);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_1_5();
  v18 = v17;
  v19 = OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_89(v19, (uint64_t)sub_246480A50);

  OUTLINED_FUNCTION_110();
  v20 = *(void **)(v6 + v12);
  v21 = OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_137();
  OUTLINED_FUNCTION_73((uint64_t)v11, v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
  v22 = (*(unsigned __int8 *)(v8 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v23 = (_QWORD *)swift_allocObject();
  v24 = v30;
  v23[2] = v29;
  v23[3] = v24;
  v25 = v32;
  v23[4] = v31;
  v23[5] = v25;
  v23[6] = v21;
  OUTLINED_FUNCTION_73((uint64_t)v23 + v22, (uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
  OUTLINED_FUNCTION_1_5();
  v26 = v20;
  v27 = swift_retain();
  OUTLINED_FUNCTION_89(v27, (uint64_t)sub_246480AE0);
  OUTLINED_FUNCTION_2_8();
  OUTLINED_FUNCTION_13_0();

  OUTLINED_FUNCTION_2_9();
}

void sub_2464777C0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  IMP *p_imp;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  id v21;
  void *v22;
  os_log_type_t v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24955BD20](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
    if (!v4)
      goto LABEL_26;
    v5 = objc_msgSend(v4, sel_clientSettings);
    if (!v5)
      goto LABEL_26;
    v6 = v5;
    type metadata accessor for SnippetSceneClientSettings();
    v7 = swift_dynamicCastClass();
    if (!v7)
    {
LABEL_25:

LABEL_26:
      return;
    }
    v8 = (void *)v7;
    if (qword_257579650 != -1)
      swift_once();
    v9 = sub_24648205C();
    __swift_project_value_buffer(v9, (uint64_t)qword_25757A4F0);
    v10 = v3;
    v11 = v6;
    v6 = v10;
    v12 = v11;
    v13 = sub_246482044();
    v14 = sub_2464824E8();
    p_imp = (IMP *)(&stru_2517A3FF0 + 16);
    if (!os_log_type_enabled(v13, v14))
    {

      v13 = v6;
LABEL_18:

      v21 = objc_msgSend(v8, (SEL)p_imp[231]);
      swift_beginAccess();
      if (objc_msgSend(v21, sel_objectForSetting_, qword_25757A180))
      {
        sub_2464825FC();
        swift_unknownObjectRelease();
        sub_246462270(v24, &v25);
      }
      else
      {
        v25 = 0u;
        v26 = 0u;
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
      type metadata accessor for SceneMetrics();
      if (swift_dynamicCast())
      {
        v22 = *(void **)&v24[0];
      }
      else
      {
        v22 = 0;
        *(_QWORD *)&v24[0] = 0;
      }

      sub_246473C94(v22);
      v3 = v12;
      goto LABEL_25;
    }
    v23 = v14;
    v16 = swift_slowAlloc();
    v17 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v16 = 138543618;
    *(_QWORD *)&v25 = v6;
    v18 = v6;
    sub_2464825E4();
    *v17 = v3;

    *(_WORD *)(v16 + 12) = 2114;
    v19 = objc_msgSend(v8, sel_otherSettings);
    swift_beginAccess();
    if (objc_msgSend(v19, sel_objectForSetting_, qword_25757A180))
    {
      sub_2464825FC();
      swift_unknownObjectRelease();
      sub_246462270(v24, &v25);
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
    type metadata accessor for SceneMetrics();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v20 = v27;

      if (v20)
      {
        *(_QWORD *)&v25 = v20;
        sub_2464825E4();
LABEL_17:
        v17[1] = v20;

        _os_log_impl(&dword_24645B000, v13, v23, "[%{public}@] ClientSetting[resolvedMetrics] did change to %{public}@", (uint8_t *)v16, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
        swift_arrayDestroy();
        MEMORY[0x24955BC78](v17, -1, -1);
        MEMORY[0x24955BC78](v16, -1, -1);
        p_imp = &stru_2517A3FF0.imp;
        goto LABEL_18;
      }
    }
    else
    {
      v27 = 0;

    }
    *(_QWORD *)&v25 = 0;
    sub_2464825E4();
    v20 = 0;
    goto LABEL_17;
  }
}

void sub_246477C24(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  NSObject *log;
  os_log_type_t type;
  uint64_t v26;
  __int128 v27;
  _OWORD v28[2];
  uint64_t v29;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24955BD20](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
    if (!v4)
      goto LABEL_20;
    v5 = objc_msgSend(v4, sel_clientSettings);
    if (!v5)
      goto LABEL_20;
    v6 = v5;
    type metadata accessor for SnippetSceneClientSettings();
    v7 = (void *)swift_dynamicCastClass();
    if (v7)
    {
      v8 = objc_msgSend(v7, sel_otherSettings);
      swift_beginAccess();
      if (objc_msgSend(v8, sel_objectForSetting_, qword_25757A198))
      {
        sub_2464825FC();
        swift_unknownObjectRelease();
        sub_246462270(&v27, v28);
      }
      else
      {
        memset(v28, 0, sizeof(v28));
      }
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A250);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v10 = v29;

        if (v10)
        {
          if (qword_257579650 != -1)
            swift_once();
          v11 = sub_24648205C();
          __swift_project_value_buffer(v11, (uint64_t)qword_25757A4F0);
          v12 = v3;
          swift_bridgeObjectRetain_n();
          v9 = v12;
          v13 = sub_246482044();
          v14 = sub_2464824E8();
          if (os_log_type_enabled(v13, v14))
          {
            type = v14;
            v15 = swift_slowAlloc();
            log = v13;
            v16 = (_QWORD *)swift_slowAlloc();
            v26 = swift_slowAlloc();
            *(_QWORD *)&v27 = v9;
            *(_QWORD *)&v28[0] = v26;
            *(_DWORD *)v15 = 138543618;
            v17 = v9;
            sub_2464825E4();
            *v16 = v3;

            *(_WORD *)(v15 + 12) = 2082;
            type metadata accessor for CGRect(0);
            v19 = v18;
            v20 = swift_bridgeObjectRetain();
            v21 = MEMORY[0x24955B36C](v20, v19);
            v23 = v22;
            swift_bridgeObjectRelease();
            *(_QWORD *)&v27 = sub_24646CE94(v21, v23, (uint64_t *)v28);
            sub_2464825E4();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_24645B000, log, type, "[%{public}@] ClientSetting[touchRestrictedRects] did change to %{public}s", (uint8_t *)v15, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
            swift_arrayDestroy();
            MEMORY[0x24955BC78](v16, -1, -1);
            swift_arrayDestroy();
            MEMORY[0x24955BC78](v26, -1, -1);
            MEMORY[0x24955BC78](v15, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          sub_246473DF8(v10);
          goto LABEL_19;
        }
      }
      else
      {
        v29 = 0;

      }
      v9 = v3;
    }
    else
    {
      v9 = v6;
      v6 = v3;
    }
LABEL_19:

    v3 = v6;
LABEL_20:

  }
}

void sub_246477FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  unint64_t v35;
  id v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _BOOL4 v43;
  _DWORD *v44;
  _QWORD *v45;
  id v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  _DWORD *v70;
  uint8_t *v71;
  uint8_t *v72;
  char *v73;
  _QWORD *v74;
  uint64_t v75;
  int v76;
  char *v77;
  id v78;
  uint64_t v79;
  NSObject *v80;
  uint64_t v81;
  id v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  _OWORD v93[2];
  _OWORD v94[2];
  __int128 v95;

  v87 = a5;
  v92 = a4;
  v84 = a2;
  v91 = sub_24648235C();
  v86 = *(_QWORD *)(v91 - 8);
  v9 = *(_QWORD *)(v86 + 64);
  MEMORY[0x24BDAC7A8](v91, v10);
  v90 = (char *)&v70 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25757A5F8);
  MEMORY[0x24BDAC7A8](v12, v13);
  v89 = (uint64_t)&v70 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2464825D8();
  v17 = MEMORY[0x24BDAC7A8](v15, v16);
  v19 = (char *)&v70 - v18;
  v85 = *(_QWORD *)(a3 - 8);
  v20 = *(_QWORD *)(v85 + 64);
  v22 = MEMORY[0x24BDAC7A8](v17, v21);
  MEMORY[0x24BDAC7A8](v22, v23);
  v88 = (char *)&v70 - v24;
  swift_beginAccess();
  v25 = MEMORY[0x24955BD20](a1 + 16);
  if (!v25)
    return;
  v26 = (void *)v25;
  v27 = *(void **)(v25 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (!v27 || (v28 = objc_msgSend(v27, sel_clientSettings)) == 0)
  {
LABEL_8:

    return;
  }
  v29 = v28;
  type metadata accessor for SnippetSceneClientSettings();
  v30 = (void *)swift_dynamicCastClass();
  if (!v30)
  {

    goto LABEL_8;
  }
  v82 = v29;
  v79 = a6;
  v31 = objc_msgSend(v30, sel_otherSettings);
  swift_beginAccess();
  if (objc_msgSend(v31, sel_objectForSetting_, qword_25757A168))
  {
    sub_2464825FC();
    swift_unknownObjectRelease();
    sub_246462270(v93, v94);
  }
  else
  {
    memset(v94, 0, sizeof(v94));
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257579C80);
  if ((swift_dynamicCast() & 1) == 0)
    v95 = xmmword_246483AB0;

  if (*((_QWORD *)&v95 + 1) >> 60 == 15)
  {

  }
  else
  {
    v77 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    v83 = *((_QWORD *)&v95 + 1);
    v32 = v95;
    if (qword_257579650 != -1)
      swift_once();
    v33 = sub_24648205C();
    v80 = __swift_project_value_buffer(v33, (uint64_t)qword_25757A4F0);
    v34 = v26;
    v35 = v83;
    sub_246462654(v32, v83);
    v36 = v34;
    v37 = v35;
    v38 = v36;
    v81 = v32;
    v39 = v32;
    v40 = v37;
    sub_246462654(v39, v37);
    v41 = sub_246482044();
    v42 = sub_2464824E8();
    v80 = v41;
    v76 = v42;
    v43 = os_log_type_enabled(v41, v42);
    v78 = v38;
    if (v43)
    {
      v44 = (_DWORD *)swift_slowAlloc();
      v45 = (_QWORD *)swift_slowAlloc();
      v74 = v45;
      v75 = swift_slowAlloc();
      *(_QWORD *)&v94[0] = v75;
      v71 = (uint8_t *)v44;
      *v44 = 138543618;
      v72 = (uint8_t *)(v44 + 1);
      v70 = v44 + 3;
      *(_QWORD *)&v93[0] = v38;
      v73 = (char *)v93 + 8;
      v46 = v38;
      sub_2464825E4();
      *v45 = v26;

      v47 = v71;
      *((_WORD *)v71 + 6) = 2082;
      v72 = v47 + 14;
      v48 = v81;
      sub_246462668(v81, v83);
      v49 = sub_246481FFC();
      v51 = v50;
      sub_24646225C(v48, v83);
      v52 = v49;
      v53 = v83;
      *(_QWORD *)&v93[0] = sub_24646CE94(v52, v51, (uint64_t *)v94);
      sub_2464825E4();
      swift_bridgeObjectRelease();
      sub_24646225C(v48, v53);
      sub_24646225C(v48, v53);
      _os_log_impl(&dword_24645B000, v80, (os_log_type_t)v76, "[%{public}@] ClientSetting[viewModelData] did change to %{public}s", v47, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      v54 = v74;
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v54, -1, -1);
      v55 = v75;
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v55, -1, -1);
      MEMORY[0x24955BC78](v47, -1, -1);
    }
    else
    {

      v56 = v81;
      sub_24646225C(v81, v40);
      sub_24646225C(v56, v40);
    }

    v57 = v77;
    sub_246481F78();
    swift_allocObject();
    sub_246481F6C();
    v58 = v92;
    sub_246481F60();
    swift_release();
    __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, a3);
    v59 = v57;
    v60 = v85;
    v80 = *(NSObject **)(v85 + 32);
    v61 = v88;
    ((void (*)(char *, char *, uint64_t))v80)(v88, v19, a3);
    v62 = sub_2464824AC();
    __swift_storeEnumTagSinglePayload(v89, 1, 1, v62);
    v63 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v86 + 16))(v90, v84, v91);
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v59, v61, a3);
    sub_246482494();
    v64 = sub_246482488();
    v65 = (*(unsigned __int8 *)(v63 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
    v66 = (v9 + *(unsigned __int8 *)(v60 + 80) + v65) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
    v67 = (char *)swift_allocObject();
    v68 = MEMORY[0x24BEE6930];
    *((_QWORD *)v67 + 2) = v64;
    *((_QWORD *)v67 + 3) = v68;
    *((_QWORD *)v67 + 4) = a3;
    *((_QWORD *)v67 + 5) = v58;
    v69 = v79;
    *((_QWORD *)v67 + 6) = v87;
    *((_QWORD *)v67 + 7) = v69;
    (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v67[v65], v90, v91);
    ((void (*)(char *, char *, uint64_t))v80)(&v67[v66], v59, a3);
    sub_24646ED0C(v89, (uint64_t)&unk_25757ADE0, (uint64_t)v67);
    swift_release();

    sub_24646225C(v81, v83);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v88, a3);
  }
}

uint64_t sub_246478830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v8;

  v6[4] = a6;
  v6[5] = v8;
  v6[2] = a4;
  v6[3] = a5;
  v6[6] = *(_QWORD *)(a6 - 8);
  v6[7] = swift_task_alloc();
  sub_246482494();
  v6[8] = sub_246482488();
  sub_24648247C();
  return swift_task_switch();
}

uint64_t sub_2464788C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release();
  sub_24648235C();
  MEMORY[0x24955B264]();
  v4 = sub_2464823D4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if ((v4 & 1) == 0)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 48) + 16))(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
    sub_246482350();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_24647898C(unsigned int a1, char a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  os_log_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD aBlock[6];
  char *v54;

  v6 = sub_246482368();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  OUTLINED_FUNCTION_9_4();
  v9 = sub_246482380();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  BSDispatchQueueAssertMain();
  if ((v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated] & 1) == 0
    && ((a2 & 1) != 0
     || *(_DWORD *)&v2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] != a1))
  {
    v48 = v13;
    v50 = v9;
    if (qword_257579650 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_5_7();
    v15 = __swift_project_value_buffer(v14, (uint64_t)qword_25757A4F0);
    v16 = v2;
    v47 = v15;
    v17 = OUTLINED_FUNCTION_72();
    v18 = sub_24648250C();
    v19 = OUTLINED_FUNCTION_27_0(v17);
    v51 = v3;
    v52 = v7;
    v49 = v10;
    if (v19)
    {
      v20 = OUTLINED_FUNCTION_1_8();
      v46 = v6;
      v21 = v20;
      v22 = OUTLINED_FUNCTION_1_8();
      v44 = v17;
      v23 = (_QWORD *)v22;
      v45 = OUTLINED_FUNCTION_1_8();
      aBlock[0] = v45;
      *(_DWORD *)v21 = 138543874;
      v54 = v16;
      v24 = v16;
      sub_2464825E4();
      *v23 = v16;

      *(_WORD *)(v21 + 12) = 2082;
      v25 = SnippetHostViewController.PresentationMode.description.getter(a1);
      v27 = OUTLINED_FUNCTION_139(v25, v26);
      OUTLINED_FUNCTION_124(v27);
      OUTLINED_FUNCTION_122();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 22) = 1026;
      LODWORD(v54) = a2 & 1;
      sub_2464825E4();
      _os_log_impl(&dword_24645B000, v44, v18, "[%{public}@] Updating presentationMode to: %{public}s - (forced? %{BOOL,public}d).", (uint8_t *)v21, 0x1Cu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

    *(_DWORD *)&v16[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] = a1;
    if (a1 >= 2)
    {
      if (a1 != 2)
      {
        LODWORD(aBlock[0]) = a1;
        sub_246482770();
        __break(1u);
        return;
      }
      v28 = *(void **)&v16[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
      if (!v28)
      {
        v37 = v16;
        v38 = sub_246482044();
        v39 = sub_2464824F4();
        if (OUTLINED_FUNCTION_68(v39))
        {
          v40 = (uint8_t *)OUTLINED_FUNCTION_1_8();
          aBlock[0] = OUTLINED_FUNCTION_1_8();
          *(_DWORD *)v40 = 136446210;
          sub_246474044();
          v43 = OUTLINED_FUNCTION_139(v41, v42);
          OUTLINED_FUNCTION_125(v43);
          OUTLINED_FUNCTION_75();

          OUTLINED_FUNCTION_64();
          OUTLINED_FUNCTION_10_4(&dword_24645B000, v38, (os_log_type_t)v10, "[%{public}s] Snapshot failed because there is no scene found", v40);
          OUTLINED_FUNCTION_13_3();
          OUTLINED_FUNCTION_0_8();
        }

        goto LABEL_17;
      }
      v29 = v28;
      if (objc_msgSend(v29, sel_contentState) != (id)2)
        sub_246479254();
      sub_246478F24();

    }
    else
    {
      sub_24647BCF0(0, 1);
      sub_246479254();
    }
    sub_246474150();
    v31 = v30;
    v32 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v32 + 16) = v16;
    *(_BYTE *)(v32 + 24) = a1 == 1;
    aBlock[4] = sub_246480CE4;
    aBlock[5] = v32;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246476408;
    aBlock[3] = &block_descriptor_176;
    v33 = _Block_copy(aBlock);
    v34 = v16;
    v35 = v48;
    sub_246482374();
    v54 = (char *)MEMORY[0x24BEE4AF8];
    sub_24646E2EC(&qword_25757AD50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD58);
    sub_246480644(&qword_25757AD60, &qword_25757AD58);
    v36 = v51;
    sub_246482608();
    MEMORY[0x24955B474](0, v35, v36, v33);
    OUTLINED_FUNCTION_23_0();

    (*(void (**)(uint64_t, uint64_t))(v52 + 8))(v36, v6);
    (*(void (**)(char *, uint64_t))(v49 + 8))(v35, v50);
    swift_release();
  }
LABEL_17:
  OUTLINED_FUNCTION_2_9();
}

_OWORD *sub_246478EEC(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t type metadata accessor for SnippetHostViewController()
{
  return objc_opt_self();
}

uint64_t sub_246478F24()
{
  char *v0;
  uint64_t result;
  uint64_t v2;
  char *v3;
  char *v4;

  result = BSDispatchQueueAssertMain();
  if (*(_DWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] == 2)
  {
    v2 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v2 + 16) = v0;
    v3 = v0;
    BSDispatchQueueAssertMain();
    v4 = v3;
    OUTLINED_FUNCTION_127();
    swift_retain();
    sub_24647C600((uint64_t)v3, v3, (uint64_t)sub_246480524, v2);
    return OUTLINED_FUNCTION_57();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_246478FA0(unsigned __int8 a1, void *a2)
{
  int v4;
  char v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  _QWORD *v11;
  id v12;
  unsigned __int8 *v13;
  os_log_type_t type;
  uint64_t v15;

  v4 = a1;
  BSDispatchQueueAssertMain();
  if (v4 == 3)
  {
    v5 = 1;
  }
  else
  {
    if (qword_257579650 != -1)
      swift_once();
    v6 = sub_24648205C();
    __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
    v7 = a2;
    v8 = sub_246482044();
    v9 = sub_2464824F4();
    if (os_log_type_enabled(v8, v9))
    {
      type = v9;
      v10 = swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138543618;
      v12 = v7;
      sub_2464825E4();
      *v11 = v7;

      *(_WORD *)(v10 + 12) = 2114;
      sub_2464805BC();
      swift_allocError();
      *v13 = a1;
      v15 = _swift_stdlib_bridgeErrorToNSError();
      sub_2464825E4();
      v11[1] = v15;
      _os_log_impl(&dword_24645B000, v8, type, "[%{public}@] Snapshot failed so backgrounding scene without updated snapshot: %{public}@", (uint8_t *)v10, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v11, -1, -1);
      MEMORY[0x24955BC78](v10, -1, -1);

    }
    else
    {

    }
    v5 = 0;
  }
  sub_24647BCF0(v5, 0);
  sub_246479254();
}

void sub_2464791C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v1 = sub_24648238C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  OUTLINED_FUNCTION_9_4();
  sub_246474150();
  *v0 = v4;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v0, *MEMORY[0x24BEE5610], v1);
  v5 = sub_246482398();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v0, v1);
  if ((v5 & 1) != 0)
    OUTLINED_FUNCTION_13();
  else
    __break(1u);
}

void sub_246479254()
{
  _BYTE *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  void (*v7)(void);
  void (*v8)(void);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  _BYTE *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _BYTE *v29;
  uint64_t v30;
  uint64_t (**v31)(uint64_t, uint64_t, uint64_t);
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t (**v41)(uint64_t, uint64_t, uint64_t);
  NSObject *v42;
  NSObject *v43;
  char v44;
  NSObject *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  void *v50;
  void *v51;
  uint64_t v52;
  char v53;
  id v54;
  _QWORD *v55;
  char *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double *v61;
  char *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  uint64_t v69;
  char v70;
  uint64_t v71;
  NSObject *v72;
  os_log_type_t v73;
  uint64_t v74;
  uint64_t v75;
  _QWORD *v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  os_log_type_t v84;
  uint64_t v85;
  _BYTE *v86;
  char v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  NSObject *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t (**v99)(uint64_t, uint64_t, uint64_t);
  void (*v100)(void);
  uint64_t v101;
  id v102;
  char *v103;
  id v104;
  uint64_t v105;
  _QWORD *v106;
  NSObject *v107;
  uint64_t v108;
  _QWORD *v109;
  _BYTE *v110;
  NSObject *v111;
  NSObject *v112;
  uint64_t v113;
  double v114;
  double v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void (*v119)();
  uint64_t (**v120)(uint64_t, uint64_t, uint64_t);
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;

  OUTLINED_FUNCTION_67();
  v124 = v3;
  v125 = v4;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_104();
  MEMORY[0x24BDAC7A8](v11, v12);
  OUTLINED_FUNCTION_87();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16, v17);
  v19 = (char *)&v97 - v18;
  BSDispatchQueueAssertMain();
  v20 = *(void **)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v20)
  {
    v31 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v2;
    v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
    v32 = *(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity + 8];
    v33 = sub_246481758(v2, v32);
    if (!v33)
    {
LABEL_28:
      v110 = v6;
      if (qword_257579650 != -1)
        swift_once();
      v83 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_25757A4F0);
      v6 = v0;
      sub_246482044();
      v84 = OUTLINED_FUNCTION_88();
      if (OUTLINED_FUNCTION_27_0(v83))
      {
        v85 = OUTLINED_FUNCTION_1_8();
        v109 = (_QWORD *)OUTLINED_FUNCTION_1_8();
        v112 = OUTLINED_FUNCTION_1_8();
        v117 = (uint64_t)v112;
        *(_DWORD *)v85 = 138543619;
        v111 = v83;
        v116 = (uint64_t)v6;
        v86 = v6;
        sub_2464825E4();
        *v109 = v6;

        *(_WORD *)(v85 + 12) = 2081;
        OUTLINED_FUNCTION_112();
        v116 = sub_24646CE94(v2, v32, &v117);
        sub_2464825E4();

        OUTLINED_FUNCTION_28_0();
        OUTLINED_FUNCTION_37(&dword_24645B000, v111, v84, "[%{public}@] Couldn't create a scene with %{private}s", (uint8_t *)v85);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
        OUTLINED_FUNCTION_13_3();
        OUTLINED_FUNCTION_0_8();
      }
      goto LABEL_34;
    }
    v34 = v33;
    v108 = v15;
    v111 = v1;
    LODWORD(v106) = v10;
    v35 = (void *)objc_opt_self();
    v107 = v34;
    v36 = objc_msgSend(v35, sel_identityForProcessIdentity_, v34);
    if (qword_257579670 != -1)
      swift_once();
    v37 = (void *)qword_25757AA50;
    v38 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v38 + 16) = v0;
    *(_QWORD *)(v38 + 24) = v36;
    v39 = OUTLINED_FUNCTION_3_2();
    v39[2].isa = (Class)sub_246480454;
    v39[3].isa = (Class)v38;
    v105 = v38;
    v119 = sub_2464626BC;
    v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v39;
    v117 = MEMORY[0x24BDAC760];
    v118 = 1107296256;
    v40 = OUTLINED_FUNCTION_10_5((uint64_t)sub_24647A2FC);
    v41 = v120;
    v42 = v0;
    v104 = v36;
    swift_retain();
    swift_release();
    v43 = objc_msgSend(v37, sel_createScene_, v40);
    _Block_release(v40);
    v44 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_2_8();
    if ((v44 & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      v45 = v43;
      sub_246474008((uint64_t)v43);
      v46 = OUTLINED_FUNCTION_96(v45, sel_setDelegate_);
      v47 = OUTLINED_FUNCTION_39((uint64_t)v46, sel_layerManager);
      OUTLINED_FUNCTION_96(v47, sel_addObserver_);

      v112 = v45;
      v49 = OUTLINED_FUNCTION_39(v48, sel_uiPresentationManager);
      if (!v49)
      {
        __break(1u);
        goto LABEL_42;
      }
      v50 = v49;
      v41 = v31;
      v51 = (void *)sub_2464823E0();
      v31 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))objc_msgSend(v50, sel_createPresenterWithIdentifier_, v51);

      v52 = swift_unknownObjectRetain();
      v43 = v42;
      sub_246474014(v52);
      v119 = (void (*)())sub_24647A3C4;
      v120 = 0;
      v37 = (void *)MEMORY[0x24BDAC760];
      v117 = MEMORY[0x24BDAC760];
      v118 = 1107296256;
      v39 = OUTLINED_FUNCTION_10_5((uint64_t)sub_246480F58);
      swift_release();
      OUTLINED_FUNCTION_30(v31, sel_modifyPresentationContext_);
      OUTLINED_FUNCTION_23_0();
      v53 = OUTLINED_FUNCTION_35();
      v40 = v111;
      if ((v53 & 1) == 0)
      {
        objc_msgSend(v31, sel_activate);
        v54 = objc_msgSend(v31, sel_presentationView);
        v55 = (Class *)((char *)&v42->isa
                      + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics);
        OUTLINED_FUNCTION_1_5();
        v56 = *(char **)(*v55 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
        v114 = 0.0;
        v115 = 0.0;
        v57 = 0.0;
        v58 = 0.0;
        v59 = 0.0;
        if (sub_246465CE0())
        {
          v58 = sub_246465A80();
          v57 = v60;
          v114 = v58;
          v115 = v60;
          v61 = (double *)&v56[OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest_cornerRadius];
          OUTLINED_FUNCTION_1_5();
          v59 = *v61;
        }
        v62 = v56;
        v63 = v54;
        sub_24647402C((uint64_t)v54);
        v64 = OUTLINED_FUNCTION_140();
        if (v64)
        {
          v65 = v64;
          v103 = v62;
          objc_msgSend(v64, sel_addSubview_, v63);

          v66 = OUTLINED_FUNCTION_140();
          if (v66)
          {
            v67 = v66;
            objc_msgSend(v66, sel_setNeedsLayout);

            objc_msgSend(v63, sel_setClipsToBounds_, 1);
            v68 = objc_msgSend(v63, sel_layer);
            sub_24647FEFC(0xD00000000000001CLL, 0x8000000246486600, v68, (SEL *)&selRef_setName_);

            v102 = v63;
            objc_msgSend(v63, sel__setContinuousCornerRadius_, v59);
            -[NSObject setPreferredContentSize:](v42, sel_setPreferredContentSize_, v58, v57);
            v69 = OUTLINED_FUNCTION_3_2();
            *(_QWORD *)(v69 + 16) = v42;
            v43 = OUTLINED_FUNCTION_3_2();
            v43[2].isa = (Class)sub_246480460;
            v43[3].isa = (Class)v69;
            v101 = v69;
            v119 = sub_246480F54;
            v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v43;
            v117 = MEMORY[0x24BDAC760];
            v118 = 1107296256;
            OUTLINED_FUNCTION_10_5((uint64_t)sub_246461F98);
            v37 = v120;
            v39 = v42;
            OUTLINED_FUNCTION_44();
            OUTLINED_FUNCTION_29_0();
            OUTLINED_FUNCTION_113(v112, sel_configureParameters_);
            OUTLINED_FUNCTION_77();
            v70 = OUTLINED_FUNCTION_35();
            OUTLINED_FUNCTION_9_0();
            if ((v70 & 1) == 0)
            {
              v100 = v8;
              v37 = (void *)v108;
              if (qword_257579650 == -1)
                goto LABEL_21;
              goto LABEL_40;
            }
LABEL_39:
            __break(1u);
LABEL_40:
            swift_once();
LABEL_21:
            v99 = v31;
            v71 = __swift_project_value_buffer((uint64_t)v40, (uint64_t)qword_25757A4F0);
            OUTLINED_FUNCTION_73((uint64_t)v37, v71, v41[2]);
            v72 = v39;
            OUTLINED_FUNCTION_72();
            v73 = OUTLINED_FUNCTION_7_4();
            if (OUTLINED_FUNCTION_79(v73))
            {
              v74 = OUTLINED_FUNCTION_1_8();
              v75 = OUTLINED_FUNCTION_1_8();
              v110 = v6;
              v76 = (_QWORD *)v75;
              v98 = OUTLINED_FUNCTION_1_8();
              v117 = v98;
              *(_DWORD *)v74 = 138543618;
              v109 = v41;
              v113 = (uint64_t)v72;
              v77 = v72;
              sub_2464825E4();
              *v76 = v42;

              *(_WORD *)(v74 + 12) = 2082;
              if ((v106 & 1) != 0)
                v78 = 0x756F726765726F66;
              else
                v78 = 0x756F72676B636162;
              v113 = OUTLINED_FUNCTION_69(v78);
              OUTLINED_FUNCTION_106();
              OUTLINED_FUNCTION_98();
              OUTLINED_FUNCTION_37(&dword_24645B000, v43, (os_log_type_t)v8, "[%{public}@] Creating snippet scene to %{public}s.", (uint8_t *)v74);
              __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
              OUTLINED_FUNCTION_13_3();
              OUTLINED_FUNCTION_0_8();
            }

            ((void (*)(void *, NSObject *))v41[1])(v37, v40);
            v87 = (char)v106;
            v88 = v104;
            v89 = OUTLINED_FUNCTION_3_2();
            *(_QWORD *)(v89 + 16) = &v114;
            *(_BYTE *)(v89 + 24) = v87 & 1;
            *(_QWORD *)(v89 + 32) = v72;
            v90 = OUTLINED_FUNCTION_3_2();
            *(_QWORD *)(v90 + 16) = sub_246480484;
            *(_QWORD *)(v90 + 24) = v89;
            v119 = sub_2464626BC;
            v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v90;
            v8 = (void (*)(void))MEMORY[0x24BDAC760];
            v117 = MEMORY[0x24BDAC760];
            v118 = 1107296256;
            v91 = OUTLINED_FUNCTION_10_5((uint64_t)sub_24647468C);
            v92 = v72;
            swift_retain();
            OUTLINED_FUNCTION_11_2();
            v93 = OUTLINED_FUNCTION_3_2();
            v94 = (uint64_t)v100;
            *(_QWORD *)(v93 + 16) = v100;
            *(_QWORD *)(v93 + 24) = v6;
            v119 = (void (*)())sub_24648049C;
            v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v93;
            v117 = (uint64_t)v8;
            v118 = 1107296256;
            v95 = OUTLINED_FUNCTION_10_5((uint64_t)sub_24647A120);
            sub_246467E10(v94);
            OUTLINED_FUNCTION_11_2();
            v96 = v112;
            -[NSObject performUpdate:withCompletion:](v112, sel_performUpdate_withCompletion_, v91, v95);

            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_49((uint64_t)&v122);
            OUTLINED_FUNCTION_49((uint64_t)&v121);

            OUTLINED_FUNCTION_49((uint64_t)&v123);
            OUTLINED_FUNCTION_77();
            OUTLINED_FUNCTION_23_0();
            v83 = OUTLINED_FUNCTION_35();
            OUTLINED_FUNCTION_9_0();
            swift_release();
            swift_release();
            OUTLINED_FUNCTION_29_0();
            if ((v83 & 1) != 0)
            {
              __break(1u);
LABEL_34:

              if (v8)
                v8();
              return;
            }
            return;
          }
LABEL_43:
          __break(1u);
          return;
        }
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
    }
    __break(1u);
    goto LABEL_39;
  }
  v21 = qword_257579650;
  v112 = v20;
  if (v21 != -1)
    swift_once();
  v22 = __swift_project_value_buffer((uint64_t)v1, (uint64_t)qword_25757A4F0);
  OUTLINED_FUNCTION_73((uint64_t)v19, v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
  v23 = v0;
  OUTLINED_FUNCTION_54();
  v24 = OUTLINED_FUNCTION_88();
  if (OUTLINED_FUNCTION_27_0(v21))
  {
    v25 = OUTLINED_FUNCTION_1_8();
    v109 = (_QWORD *)v2;
    v26 = v25;
    v27 = OUTLINED_FUNCTION_1_8();
    v110 = v6;
    v106 = (_QWORD *)v27;
    v108 = OUTLINED_FUNCTION_1_8();
    v117 = v108;
    *(_DWORD *)v26 = 138543618;
    v111 = v1;
    v116 = (uint64_t)v23;
    v107 = v21;
    v28 = v10;
    v29 = v23;
    sub_2464825E4();
    *v106 = v23;

    *(_WORD *)(v26 + 12) = 2082;
    if ((v28 & 1) != 0)
      v30 = 0x756F726765726F66;
    else
      v30 = 0x756F72676B636162;
    v116 = OUTLINED_FUNCTION_69(v30);
    sub_2464825E4();
    OUTLINED_FUNCTION_98();
    OUTLINED_FUNCTION_37(&dword_24645B000, v107, v24, "[%{public}@] Updating snippet scene to %{public}s.", (uint8_t *)v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  (*(void (**)(char *, NSObject *))(v2 + 8))(v19, v1);
  v0 = (_BYTE *)OUTLINED_FUNCTION_3_2();
  v0[16] = v10 & 1;
  v32 = OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v32 + 16) = sub_2464804B0;
  *(_QWORD *)(v32 + 24) = v0;
  v119 = sub_246480F54;
  v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v32;
  v79 = MEMORY[0x24BDAC760];
  v117 = MEMORY[0x24BDAC760];
  v118 = 1107296256;
  v80 = OUTLINED_FUNCTION_10_5((uint64_t)sub_24647468C);
  OUTLINED_FUNCTION_111();
  OUTLINED_FUNCTION_2_8();
  v81 = OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v81 + 16) = v8;
  *(_QWORD *)(v81 + 24) = v6;
  v119 = (void (*)())sub_24648049C;
  v120 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v81;
  v117 = v79;
  v118 = 1107296256;
  v82 = OUTLINED_FUNCTION_10_5((uint64_t)sub_24647A120);
  sub_246467E10((uint64_t)v8);
  OUTLINED_FUNCTION_11_2();
  v1 = v112;
  -[NSObject performUpdate:withCompletion:](v112, sel_performUpdate_withCompletion_, v80, v82);

  OUTLINED_FUNCTION_23_0();
  _Block_release(v80);
  LOBYTE(v82) = OUTLINED_FUNCTION_35();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_13_0();
  if ((v82 & 1) != 0)
  {
    __break(1u);
    goto LABEL_28;
  }
}

void sub_24647A120(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

id sub_24647A180(void *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  _QWORD v14[2];

  v6 = sub_24648202C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = 0x3A656E656373;
  v14[1] = 0xE600000000000000;
  sub_246482020();
  sub_246482014();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  sub_246482410();
  swift_bridgeObjectRelease();
  sub_246482410();
  v11 = objc_msgSend(a2, sel_description);
  sub_2464823EC();

  sub_246482410();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setIdentifier_, v12);

  objc_msgSend(a1, sel_setClientIdentity_, a3);
  return objc_msgSend(a1, sel_setSpecification_, *(_QWORD *)&a2[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneSpecification]);
}

uint64_t sub_24647A2FC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_24647A338(void *a1)
{
  objc_msgSend(a1, sel_setPresentedLayerTypes_, 26);
  objc_msgSend(a1, sel_setAppearanceStyle_, 2);
  objc_msgSend(a1, sel_setBackgroundColorWhileHosting_, 0);
  objc_msgSend(a1, sel_setBackgroundColorWhileNotHosting_, 0);
  objc_msgSend(a1, sel_setInheritsSecurity_, 1);
  return objc_msgSend(a1, sel_setResizesHostedContext_, 1);
}

void sub_24647A3C8(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD v9[5];

  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SnippetSceneMutableClientSettings()), sel_init);
  v5 = a2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel;
  swift_beginAccess();
  sub_24647FEB8(v5, (uint64_t)v9);
  __swift_project_boxed_opaque_existential_0(v9, v9[3]);
  v6 = sub_246465278();
  v8 = v7;
  sub_246462668(v6, v7);
  sub_246473668(v6, v8, &qword_25757A168);
  sub_24645F708(v6, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  objc_msgSend(a1, sel_setClientSettings_, v4);

}

void sub_24647A4C0(void *a1, uint64_t a2, uint64_t a3, char a4, char *a5)
{
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void **v20;
  void *v21;
  id v22;

  type metadata accessor for LiveMutableSceneSettings();
  v8 = swift_dynamicCastClass();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_opt_self();
    v11 = a1;
    v12 = objc_msgSend(v10, sel__applicationKeyWindow);
    if (v12)
    {
      v13 = v12;
      v14 = (uint64_t)objc_msgSend(v12, sel_interfaceOrientation);

    }
    else
    {
      v14 = 1;
    }
    v15 = v11;
    BSRectWithSize();
    objc_msgSend(v9, sel_setFrame_);

    objc_msgSend(v9, sel_setInterfaceOrientation_, v14);
    v16 = objc_msgSend((id)objc_opt_self(), sel_mainConfiguration);
    objc_msgSend(v9, sel_setDisplayConfiguration_, v16);

    objc_msgSend(v9, sel_setForeground_, a4 & 1);
    v17 = v15;
    v18 = objc_msgSend(a5, sel_traitCollection);
    v19 = objc_msgSend(v18, sel_userInterfaceStyle);

    objc_msgSend(v9, sel_setUserInterfaceStyle_, v19);
    v20 = (void **)&a5[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics];
    swift_beginAccess();
    v21 = *v20;
    v22 = v21;
    sub_246473734(v21);

  }
}

uint64_t sub_24647A6C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  char v10;
  _QWORD v11[6];

  result = BSDispatchQueueAssertMain();
  v6 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v6)
  {
    v7 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v7 + 16) = a1;
    *(_QWORD *)(v7 + 24) = a2;
    v8 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v8 + 16) = sub_2464626BC;
    *(_QWORD *)(v8 + 24) = v7;
    v11[4] = sub_246480F54;
    v11[5] = v8;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 1107296256;
    v11[2] = sub_24647468C;
    v11[3] = &block_descriptor_160;
    _Block_copy(v11);
    v9 = v6;
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_113(v9, sel_performUpdate_);

    OUTLINED_FUNCTION_77();
    v10 = OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_2_8();
    result = OUTLINED_FUNCTION_9_0();
    if ((v10 & 1) != 0)
      __break(1u);
  }
  return result;
}

void sub_24647A7E8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  BSDispatchQueueAssertMain();
  v1 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v1)
    OUTLINED_FUNCTION_66(v1);
  sub_246474014(0);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isSceneForeground) = 0;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_activatedSceneView), sel_removeFromSuperview);
  sub_24647402C(0);
  v2 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene;
  v3 = *(void **)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_layerManager);
    objc_msgSend(v4, sel_remove_, v0);

    v3 = *(void **)(v0 + v2);
    if (v3)
    {
      objc_msgSend(v3, sel_setDelegate_, 0);
      v3 = *(void **)(v0 + v2);
    }
  }
  OUTLINED_FUNCTION_66(v3);
  sub_246474008(0);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) = 1;
  OUTLINED_FUNCTION_13();
}

void sub_24647A8C4()
{
  char *v0;
  CGFloat v1;
  CGFloat v2;
  char *v3;
  void **v4;
  char *v5;
  double *v6;
  double v7;
  double v8;
  char *v9;
  void *v10;
  id v11;
  char *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  CGSize v17;
  CGSize v18;

  v3 = v0;
  BSDispatchQueueAssertMain();
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene])
  {
    v4 = (void **)&v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_resolvedMetrics];
    OUTLINED_FUNCTION_1_5();
    v5 = (char *)*v4;
    if (*v4)
    {
      v6 = (double *)&v5[OBJC_IVAR____TtC15SiriInteractive12SceneMetrics_size];
      OUTLINED_FUNCTION_1_5();
      v8 = *v6;
      v7 = v6[1];
      v15 = *v6;
      v16 = v7;
      v9 = &v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_systemProvidedMetrics];
      OUTLINED_FUNCTION_1_5();
      v10 = *(void **)(*(_QWORD *)v9 + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics);
      if (sub_246465CE0())
      {
        v8 = sub_24645DED8(v8);
        v15 = v8;
        v16 = v7;
      }
      v11 = v10;
      v12 = v5;
      v13 = objc_msgSend(v3, sel_view);
      if (v13)
      {
        objc_msgSend(v13, sel_bounds);
        OUTLINED_FUNCTION_108();
        if (v7 <= 40.0)
        {

        }
        else
        {
          v17.width = v1;
          v17.height = v2;
          v18.width = v8;
          v18.height = v7;
          if (!CGSizeEqualToSize(v17, v18))
          {
            v14 = (void *)MEMORY[0x24955B810]();
            sub_24647AA50(v3, &v15);
            objc_autoreleasePoolPop(v14);
          }

        }
      }
      else
      {
        __break(1u);
      }
    }
  }
}

id sub_24647AA50(void *a1, double *a2)
{
  double v4;
  double v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  char v21[16];
  double *v22;
  void *v23;
  uint64_t v24;
  double v25;
  uint64_t v26;

  v22 = a2;
  v23 = a1;
  sub_24647A6C4((uint64_t)sub_246480434, (uint64_t)v21);
  v4 = *a2;
  v5 = a2[1];
  if (qword_257579650 != -1)
    swift_once();
  v6 = sub_24648205C();
  __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
  v7 = a1;
  v8 = sub_246482044();
  v9 = sub_24648250C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v19 = (_QWORD *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v26 = v20;
    *(_DWORD *)v10 = 138543874;
    v24 = (uint64_t)v7;
    v11 = v7;
    sub_2464825E4();
    *v19 = v7;

    *(_WORD *)(v10 + 12) = 2082;
    v24 = *(_QWORD *)&v4;
    v25 = v5;
    type metadata accessor for CGSize(0);
    v12 = sub_2464823F8();
    v24 = sub_24646CE94(v12, v13, &v26);
    sub_2464825E4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 22) = 2082;
    objc_msgSend(v11, sel_preferredContentSize);
    v24 = v14;
    v25 = v15;
    v16 = sub_2464823F8();
    v24 = sub_24646CE94(v16, v17, &v26);
    sub_2464825E4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24645B000, v8, v9, "[%{public}@] Updating preferred content size with requested size: %{public}s, current size: %{public}s", (uint8_t *)v10, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    swift_arrayDestroy();
    MEMORY[0x24955BC78](v19, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x24955BC78](v20, -1, -1);
    MEMORY[0x24955BC78](v10, -1, -1);

  }
  else
  {

  }
  return objc_msgSend(v7, sel_setPreferredContentSize_, v4, v5);
}

void sub_24647AD40(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  type metadata accessor for LiveMutableSceneSettings();
  v7 = swift_dynamicCastClass();
  if (!v7)
    return;
  v8 = (void *)v7;
  v9 = (void *)objc_opt_self();
  v10 = a1;
  v11 = objc_msgSend(v9, sel__applicationKeyWindow);
  if (!v11)
  {
    __break(1u);
    goto LABEL_15;
  }
  v12 = v11;
  v13 = objc_msgSend(v11, sel_interfaceOrientation);

  if (v13 != (id)4)
  {
    v14 = objc_msgSend(v9, sel__applicationKeyWindow);
    if (!v14)
    {
LABEL_16:
      __break(1u);
      return;
    }
    v15 = v14;
    objc_msgSend(v14, sel_interfaceOrientation);

  }
  v22 = v10;
  BSRectWithSize();
  objc_msgSend(v8, sel_setFrame_);

  v16 = objc_msgSend(a4, sel_view);
  if (!v16)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v17 = v16;
  v18 = objc_msgSend(v16, sel_window);

  if (v18)
  {
    v19 = objc_msgSend(v18, sel_windowScene);

    if (v19)
    {
      v20 = objc_msgSend(v19, sel__synchronizedDrawingFence);

      if (v20)
      {
        v21 = v20;
        objc_msgSend(a2, sel_setAnimationFence_, v21);

      }
    }
  }

}

void sub_24647AF60()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  char *v31;
  char *v32;
  id v33;
  char *v34;
  id v35;
  _QWORD *v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  char *v48;
  _QWORD *v49;
  unsigned int v50;
  unint64_t v51;
  char v52;
  id v53;
  unint64_t v54;
  char v55;
  unint64_t v56;
  _QWORD *v57;
  void *v58;
  id v59;
  _QWORD v60[5];
  id v61;
  uint64_t v62;
  char *v63;
  unsigned int v64;
  uint64_t v65;
  id v66;
  _QWORD *v67;
  char *v68;
  __int128 v69;
  void (*v70)(uint64_t, void *);
  void *v71;
  void (*v72)(void *);
  uint64_t v73;
  _QWORD *v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;

  OUTLINED_FUNCTION_74();
  v79 = v1;
  v80 = v2;
  v3 = v0;
  v4 = sub_246481FF0();
  v60[4] = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  OUTLINED_FUNCTION_87();
  v8 = v6 - v7;
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)v60 - v11;
  BSDispatchQueueAssertMain();
  v13 = *(void **)&v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene];
  if (!v13)
  {
LABEL_32:
    OUTLINED_FUNCTION_86();
    return;
  }
  v61 = v13;
  v14 = objc_msgSend(v3, sel_view);
  if (!v14)
    goto LABEL_36;
  v15 = v14;
  v16 = objc_msgSend(v14, sel_window);

  if (!v16)
  {
    OUTLINED_FUNCTION_86();

    return;
  }
  v60[3] = v4;
  v17 = objc_msgSend(v61, sel_layerManager);
  v18 = objc_msgSend(v17, sel_layers);

  OUTLINED_FUNCTION_16_4(v19, &qword_25757ADB0);
  v20 = &v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions];
  OUTLINED_FUNCTION_1_5();
  v68 = v20;
  v21 = OUTLINED_FUNCTION_46();
  v22 = sub_24647EEA0(v21);
  OUTLINED_FUNCTION_65();
  sub_24647B634(v22);
  OUTLINED_FUNCTION_13_0();
  v66 = sub_24647B750();
  v60[2] = v16;
  v64 = objc_msgSend(v16, sel__contextId);
  v60[1] = v18;
  sub_2464824DC();
  OUTLINED_FUNCTION_101();
  v65 = v8;
  if (!v76)
  {
LABEL_22:
    OUTLINED_FUNCTION_102((uint64_t)v12);
    sub_2464824DC();
    OUTLINED_FUNCTION_134();
    if (v71)
    {
      v48 = v68;
      do
      {
        sub_246462270(&v69, &v75);
        if ((OUTLINED_FUNCTION_81() & 1) != 0)
        {
          v49 = *(_QWORD **)v68;
          if (*(_QWORD *)(*(_QWORD *)v68 + 16))
          {
            v50 = v74;
            v51 = sub_24647ECE8(v74);
            if ((v52 & 1) != 0)
            {
              v53 = *(id *)(v49[7] + 8 * v51);
              objc_msgSend(v53, sel_invalidate);
              OUTLINED_FUNCTION_2_4();
              v54 = sub_24647ECE8(v50);
              if ((v55 & 1) != 0)
              {
                v56 = v54;
                swift_isUniquelyReferenced_nonNull_native();
                v74 = *(_QWORD **)v48;
                *(_QWORD *)v48 = 0x8000000000000000;
                __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADB8);
                sub_2464826BC();
                v57 = v74;
                v58 = *(void **)(v74[7] + 8 * v56);
                sub_246468CA8(0, &qword_25757AAE0);
                sub_2464826C8();
                *(_QWORD *)v48 = v57;

                v8 = v65;
                swift_bridgeObjectRelease();
              }
              swift_endAccess();

            }
          }
        }
        OUTLINED_FUNCTION_134();
      }
      while (v71);
    }
    OUTLINED_FUNCTION_102(v8);

    OUTLINED_FUNCTION_49((uint64_t)&v78);
    OUTLINED_FUNCTION_49((uint64_t)&v77);

    goto LABEL_32;
  }
  v63 = v12;
  v62 = MEMORY[0x24BEE4AD8] + 8;
  while (1)
  {
    sub_246462270(&v75, &v69);
    sub_246468CA8(0, (unint64_t *)&unk_25757AB70);
    if ((OUTLINED_FUNCTION_81() & 1) == 0)
      goto LABEL_21;
    v67 = v74;
    v23 = objc_msgSend(v74, sel_contextID);
    v24 = (void *)sub_246482818();
    OUTLINED_FUNCTION_30(v66, sel_removeObject_);

    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0B6F0]), sel_init);
    v26 = objc_msgSend((id)objc_opt_self(), sel_policyRequiringSharingOfTouchesDeliveredToChildContextId_withHostContextId_, v23, v64);
    v27 = v26;
    if (v26)
    {
      v28 = v26;
      v29 = OUTLINED_FUNCTION_21_1((uint64_t)v28, sel_endpoint);
      OUTLINED_FUNCTION_113(v28, sel_setAssertionEndpoint_);

      swift_unknownObjectRelease();
    }
    v30 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v30 + 16) = v3;
    v72 = sub_246480884;
    v73 = v30;
    *(_QWORD *)&v69 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v69 + 1) = 1107296256;
    v70 = sub_246477554;
    v71 = &block_descriptor_150;
    _Block_copy(&v69);
    v31 = v3;
    v32 = v3;
    OUTLINED_FUNCTION_13_0();
    v33 = (id)BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler();
    OUTLINED_FUNCTION_23_0();
    v34 = v68;
    OUTLINED_FUNCTION_2_4();
    v35 = v25;
    swift_isUniquelyReferenced_nonNull_native();
    v74 = *(_QWORD **)v34;
    v36 = v74;
    *(_QWORD *)v34 = 0x8000000000000000;
    v37 = sub_24647ECE8(v23);
    if (__OFADD__(v36[2], (v38 & 1) == 0))
      break;
    v39 = v37;
    v40 = v38;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADB8);
    if ((sub_2464826BC() & 1) != 0)
    {
      v41 = sub_24647ECE8(v23);
      if ((v40 & 1) != (v42 & 1))
        goto LABEL_37;
      v39 = v41;
    }
    v43 = v74;
    if ((v40 & 1) != 0)
    {
      v44 = v74[7];

      *(_QWORD *)(v44 + 8 * v39) = v35;
    }
    else
    {
      v74[(v39 >> 6) + 8] |= 1 << v39;
      *(_DWORD *)(v43[6] + 4 * v39) = (_DWORD)v23;
      *(_QWORD *)(v43[7] + 8 * v39) = v35;
      v45 = v43[2];
      v46 = __OFADD__(v45, 1);
      v47 = v45 + 1;
      if (v46)
        goto LABEL_35;
      v43[2] = v47;
    }
    *(_QWORD *)v68 = v43;
    swift_bridgeObjectRelease();
    swift_endAccess();
    v3 = v31;
    if (v33)
    {
      objc_msgSend((id)swift_unknownObjectRetain(), sel_ipc_addPolicy_, v27);
      OUTLINED_FUNCTION_97();
      swift_unknownObjectRelease_n();
    }
    else
    {
      OUTLINED_FUNCTION_97();
    }

    v8 = v65;
    v12 = v63;
LABEL_21:
    OUTLINED_FUNCTION_101();
    if (!v76)
      goto LABEL_22;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  sub_246482794();
  __break(1u);
}

uint64_t sub_24647B634(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_24647EF80(0, v1, 0);
    v4 = a1 + 32;
    v2 = v9;
    do
    {
      v4 += 4;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_24647EF80(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_24647EF80((char *)(v5 > 1), v6 + 1, 1);
        v2 = v9;
      }
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_246462270(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_24647B750()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_246482434();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_24647B7C4(void *a1, void *a2, const char *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  NSObject *oslog;
  uint64_t v20;

  if (a1)
  {
    v6 = a1;
    if (qword_257579650 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v7, (uint64_t)qword_25757A4F0);
    v8 = a1;
    v9 = a2;
    v10 = (id)OUTLINED_FUNCTION_127();
    v11 = a2;
    oslog = OUTLINED_FUNCTION_72();
    v12 = sub_24648250C();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = OUTLINED_FUNCTION_1_8();
      v14 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      v20 = OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v13 = 138543618;
      v18 = a3;
      v15 = v11;
      sub_2464825E4();
      *v14 = v11;

      *(_WORD *)(v13 + 12) = 2082;
      swift_getErrorValue();
      v16 = sub_2464827A0();
      sub_24646CE94(v16, v17, &v20);
      sub_2464825E4();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_37(&dword_24645B000, oslog, v12, v18, (uint8_t *)v13);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }
    OUTLINED_FUNCTION_45();

    OUTLINED_FUNCTION_45();
    OUTLINED_FUNCTION_45();

  }
}

id sub_24647B9F8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  id result;
  int64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;

  BSDispatchQueueAssertMain();
  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_touchDeliveryPolicyAssertions);
  OUTLINED_FUNCTION_1_5();
  v2 = *v1;
  v3 = *v1 + 64;
  v4 = 1 << *(_BYTE *)(*v1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(*v1 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = (id)OUTLINED_FUNCTION_46();
  v9 = 0;
  if (!v6)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  for (i = v10 | (v9 << 6); ; i = __clz(__rbit64(v13)) + (v9 << 6))
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(v2 + 56) + 8 * i), sel_invalidate);
    if (v6)
      goto LABEL_4;
LABEL_5:
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v12 >= v7)
      goto LABEL_21;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v7)
        goto LABEL_21;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v7)
          goto LABEL_21;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v6 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v7)
  {
LABEL_21:
    OUTLINED_FUNCTION_2_8();
    OUTLINED_FUNCTION_2_4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADD0);
    sub_2464823B0();
    return (id)swift_endAccess();
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_21;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_23:
  __break(1u);
  return result;
}

void sub_24647BB8C()
{
  double v0;
  double v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  id v12;

  BSDispatchQueueAssertMain();
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v3 = objc_msgSend(v2, sel_layer);
  sub_24647FEFC(0xD000000000000018, 0x8000000246486720, v3, (SEL *)&selRef_setName_);

  v5 = OUTLINED_FUNCTION_21_1(v4, sel_view);
  if (v5)
  {
    objc_msgSend(v5, sel_bounds);
    v7 = v6;
    v9 = v8;
    OUTLINED_FUNCTION_108();
    objc_msgSend(v2, sel_setFrame_, v7, v9, v0, v1);
    objc_msgSend(v2, sel_setClipsToBounds_, 1);
    v10 = OUTLINED_FUNCTION_21_1((uint64_t)objc_msgSend(v2, sel_setAutoresizingMask_, 18), sel_view);
    if (v10)
    {
      v11 = v10;
      OUTLINED_FUNCTION_30(v10, sel_addSubview_);

      v12 = v2;
      sub_246474038((uint64_t)v2);
      sub_24647BCF0(0, 0);
      OUTLINED_FUNCTION_53(v12);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_24647BCF0(char a1, char a2)
{
  uint64_t v2;
  void *v5;
  int v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  char aBlock;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  BSDispatchQueueAssertMain();
  v5 = *(void **)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
  if (!v5)
    return;
  v19 = *(id *)(v2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView);
  if (a1 != 2)
  {
    v6 = a1 & 1;
    v8 = v5;
    if ((a2 & 1) == 0)
      goto LABEL_4;
LABEL_8:
    v9 = (void *)objc_opt_self();
    v10 = OUTLINED_FUNCTION_3_2();
    *(_BYTE *)(v10 + 16) = v6;
    *(_QWORD *)(v10 + 24) = v19;
    aBlock = MEMORY[0x24BDAC760];
    v12 = OUTLINED_FUNCTION_107((uint64_t)sub_246476408, v17, (uint64_t)v19, MEMORY[0x24BDAC760], 1107296256, v21, v23);
    v13 = v20;
    OUTLINED_FUNCTION_29_0();
    v14 = OUTLINED_FUNCTION_3_2();
    *(_QWORD *)(v14 + 16) = v13;
    *(_BYTE *)(v14 + 24) = v6;
    v15 = OUTLINED_FUNCTION_107((uint64_t)sub_24646DD14, v18, (uint64_t)v20, aBlock, 1107296256, v22, v24);
    v16 = v13;
    OUTLINED_FUNCTION_29_0();
    objc_msgSend(v9, sel_animateWithDuration_animations_completion_, v12, v15, 0.4);

    OUTLINED_FUNCTION_23_0();
    OUTLINED_FUNCTION_77();
    return;
  }
  v6 = objc_msgSend(v5, sel_isHidden);
  if ((a2 & 1) != 0)
    goto LABEL_8;
LABEL_4:
  v7 = 0.0;
  if (v6)
    v7 = 1.0;
  objc_msgSend(v19, sel_setAlpha_, v7);
  objc_msgSend(v19, sel_setHidden_, v6 ^ 1u);

}

uint64_t sub_24647BEC8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_44();
  v1(v2);
  return OUTLINED_FUNCTION_57();
}

void sub_24647BEEC(void *a1, char a2, void *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock;
  uint64_t v27;
  uint64_t (*v28)();
  void *v29;
  void (*v30)();
  _QWORD *v31;

  if ((a2 & 1) != 0)
  {
    if (qword_257579650 != -1)
      swift_once();
    v12 = sub_24648205C();
    __swift_project_value_buffer(v12, (uint64_t)qword_25757A4F0);
    v13 = a3;
    v14 = sub_246482044();
    v15 = sub_2464824F4();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v24 = a5;
      v17 = (_QWORD *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      aBlock = v25;
      *(_DWORD *)v16 = 138543618;
      v18 = v13;
      sub_2464825E4();
      *v17 = v13;
      v19 = v17;
      a5 = v24;

      *(_WORD *)(v16 + 12) = 2080;
      sub_2464805BC();
      v20 = sub_2464827A0();
      sub_24646CE94(v20, v21, &aBlock);
      sub_2464825E4();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24645B000, v14, v15, "[%{public}@] Snapshot failed - %s", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v19, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v25, -1, -1);
      MEMORY[0x24955BC78](v16, -1, -1);

    }
    else
    {

    }
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = a4;
    *(_QWORD *)(v22 + 24) = a5;
    *(_BYTE *)(v22 + 32) = (_BYTE)a1;
    v30 = sub_246480598;
    v31 = (_QWORD *)v22;
    aBlock = MEMORY[0x24BDAC760];
    v27 = 1107296256;
    v28 = sub_246476408;
    v29 = &block_descriptor_119;
    v23 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v23);
  }
  else
  {
    v9 = (_QWORD *)swift_allocObject();
    v9[2] = a3;
    v9[3] = a1;
    v9[4] = a4;
    v9[5] = a5;
    v30 = sub_246480620;
    v31 = v9;
    aBlock = MEMORY[0x24BDAC760];
    v27 = 1107296256;
    v28 = sub_246476408;
    v29 = &block_descriptor_125;
    v10 = _Block_copy(&aBlock);
    sub_24648062C(a1, 0);
    sub_24648062C(a1, 0);
    v11 = a3;
    swift_retain();
    swift_release();
    BSDispatchMain();
    _Block_release(v10);
    sub_246480638(a1, 0);
  }
}

void sub_24647C26C(char *a1, void *a2, void (*a3)(_QWORD))
{
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void (*v12)(_QWORD);
  char *v13;
  id v14;
  void *v15;
  id v16;

  if (*(_DWORD *)&a1[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController__presentationMode] == 2)
  {
    if (qword_257579650 != -1)
      swift_once();
    v6 = sub_24648205C();
    __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
    v7 = a1;
    v8 = sub_246482044();
    v9 = sub_24648250C();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138543362;
      v12 = a3;
      v13 = v7;
      sub_2464825E4();
      *v11 = v7;

      a3 = v12;
      _os_log_impl(&dword_24645B000, v8, v9, "[%{public}@] Snapshot success - Updating layer.", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      swift_arrayDestroy();
      MEMORY[0x24955BC78](v11, -1, -1);
      MEMORY[0x24955BC78](v10, -1, -1);

    }
    else
    {

    }
    v14 = objc_msgSend(a2, sel_IOSurface);
    if (!v14)
      v14 = objc_msgSend(a2, sel_fallbackIOSurface);
    v15 = *(void **)&v7[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_snippetSceneSnapshotView];
    if (v15)
    {
      v16 = objc_msgSend(v15, sel_layer);
      objc_msgSend(v16, sel_setContents_, v14);

    }
    a3(3);

  }
}

unint64_t sub_24647C4C0(char a1)
{
  unint64_t result;

  result = 0xD00000000000001DLL;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000025;
    else
      return 0xD000000000000021;
  }
  return result;
}

BOOL sub_24647C520(char a1, char a2)
{
  return a1 == a2;
}

void sub_24647C530()
{
  sub_2464827F4();
  OUTLINED_FUNCTION_1_2();
}

void sub_24647C550()
{
  OUTLINED_FUNCTION_62();
  sub_2464827F4();
  OUTLINED_FUNCTION_61();
  OUTLINED_FUNCTION_22_0();
}

BOOL sub_24647C580(char *a1, char *a2)
{
  return sub_24647C520(*a1, *a2);
}

void sub_24647C58C()
{
  sub_24647C550();
}

void sub_24647C594()
{
  sub_24647C530();
}

uint64_t sub_24647C59C()
{
  sub_2464827E8();
  sub_2464827F4();
  return sub_24648280C();
}

unint64_t sub_24647C5DC()
{
  char *v0;

  return sub_24647C4C0(*v0);
}

uint64_t sub_24647C600(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  _QWORD *v23;
  const void *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v8 = sub_246482368();
  v33 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v27 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_246482380();
  v31 = *(_QWORD *)(v12 - 8);
  v32 = v12;
  MEMORY[0x24BDAC7A8](v12, v13);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v17 = a2;
  swift_retain();
  BSDispatchQueueAssertMain();
  v18 = *(void **)(a1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scenePresenter);
  if (v18 && (v19 = *(void **)(a1 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene)) != 0)
  {
    swift_unknownObjectRetain();
    v20 = v19;
    if (objc_msgSend(v20, sel_contentState) != (id)2)
    {
      sub_24647BEEC((void *)1, 1, v17, a3, a4);

      swift_release();
      swift_unknownObjectRelease();

      return swift_release();
    }
    v21 = objc_msgSend(v18, sel_newSnapshot);
    sub_246474150();
    v30 = v22;
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = sub_246480548;
    v23[3] = v16;
    v23[4] = v21;
    aBlock[4] = sub_246480570;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_246476408;
    aBlock[3] = &block_descriptor_113;
    v28 = _Block_copy(aBlock);
    swift_retain();
    v29 = v21;
    sub_246482374();
    v34 = MEMORY[0x24BEE4AF8];
    v27 = sub_24646E2EC(&qword_25757AD50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD58);
    sub_246480644(&qword_25757AD60, &qword_25757AD58);
    sub_246482608();
    v24 = v28;
    v25 = v30;
    MEMORY[0x24955B474](0, v15, v11, v28);
    _Block_release(v24);

    swift_unknownObjectRelease();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v32);

    swift_release();
  }
  else
  {
    sub_24647BEEC(0, 1, v17, a3, a4);

  }
  swift_release();
  return swift_release();
}

uint64_t sub_24647C920(uint64_t (*a1)(uint64_t, _QWORD), int a2, id a3)
{
  unsigned int v5;
  uint64_t v6;

  v5 = objc_msgSend(a3, sel_capture);
  v6 = 2;
  if (v5)
    v6 = (uint64_t)a3;
  return a1(v6, v5 ^ 1);
}

void SnippetHostViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_2464823E0();
    OUTLINED_FUNCTION_40();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  OUTLINED_FUNCTION_13();
}

void SnippetHostViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void *sub_24647CA2C(void *result)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  id v9;
  id v10;

  if (result)
  {
    v1 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD90);
    sub_246468CA8(0, &qword_25757AD98);
    if ((swift_dynamicCast() & 1) == 0)
      return 0;
    v2 = objc_msgSend(v10, sel_domain);
    v3 = sub_2464823EC();
    v5 = v4;

    if (v3 == sub_2464823EC() && v5 == v6)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v8 = sub_246482764();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {

        return 0;
      }
    }
    v9 = objc_msgSend(v10, sel_code);

    return (void *)(v9 == (id)4);
  }
  return result;
}

void SnippetHostViewController.sceneDidActivate(_:)()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  char *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;

  OUTLINED_FUNCTION_67();
  if (qword_257579650 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_5_7();
  v3 = (char *)OUTLINED_FUNCTION_55(v2, (uint64_t)qword_25757A4F0);
  OUTLINED_FUNCTION_54();
  v4 = OUTLINED_FUNCTION_84();
  if (OUTLINED_FUNCTION_27_0(v0))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v6 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    OUTLINED_FUNCTION_26_0(5.8381e-34);
    OUTLINED_FUNCTION_14_3();
    *v6 = v3;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v0, v4, "[%{public}@] Scene did activate.", v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 1;
  v7 = &v3[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivatedBlocks];
  OUTLINED_FUNCTION_2_4();
  v8 = *(_QWORD *)v7;
  v9 = *(_QWORD *)(*(_QWORD *)v7 + 16);
  if (v9)
  {
    OUTLINED_FUNCTION_112();
    v10 = v8 + 40;
    do
    {
      v11 = *(void (**)(uint64_t))(v10 - 8);
      v12 = OUTLINED_FUNCTION_44();
      v11(v12);
      OUTLINED_FUNCTION_9_0();
      v10 += 16;
      --v9;
    }
    while (v9);
    OUTLINED_FUNCTION_28_0();
  }
  *(_QWORD *)v7 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_13_5();
}

void SnippetHostViewController.sceneDidInvalidate(_:)()
{
  _BYTE *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;
  _BYTE *v6;
  _BYTE *v7;

  v0[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated] = 0;
  if (qword_257579650 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v1, (uint64_t)qword_25757A4F0);
  v7 = v0;
  v2 = sub_246482044();
  v3 = sub_2464824E8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v5 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v4 = 138543362;
    v6 = v7;
    sub_2464825E4();
    *v5 = v7;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v2, v3, "[%{public}@] Scene did invalidate.", v4);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  OUTLINED_FUNCTION_53(v7);
}

void SnippetHostViewController.sceneDidDeactivate(_:withError:)(void *a1, void *a2)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  NSObject *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  os_log_type_t v18;
  uint8_t *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  NSObject *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  NSObject *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  _QWORD *v76;
  _QWORD *v77;
  void *v78;
  uint64_t aBlock;
  unint64_t v80;
  void (*v81)(uint64_t, void *);
  void *v82;
  void (*v83)(void *);
  uint64_t v84;
  uint64_t v85;

  v3 = v2;
  *((_BYTE *)&v2->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneActivated) = 0;
  if (a2)
  {
    OUTLINED_FUNCTION_38();
    if (qword_257579650 != -1)
      swift_once();
    v6 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
    OUTLINED_FUNCTION_38();
    v7 = v2;
    OUTLINED_FUNCTION_38();
    v8 = v7;
    v9 = sub_246482044();
    v10 = sub_2464824E8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = OUTLINED_FUNCTION_1_8();
      v12 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      aBlock = OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v11 = 138543618;
      v85 = (uint64_t)v8;
      v13 = v8;
      sub_2464825E4();
      *v12 = v8;

      *(_WORD *)(v11 + 12) = 2082;
      swift_getErrorValue();
      v14 = sub_2464827A0();
      v16 = sub_24646CE94(v14, v15, &aBlock);
      OUTLINED_FUNCTION_124(v16);
      sub_2464825E4();
      OUTLINED_FUNCTION_64();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_37(&dword_24645B000, v9, v10, "[%{public}@] Scene did deactivate with error: %{public}s.", (uint8_t *)v11);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }
    OUTLINED_FUNCTION_18_3();

    OUTLINED_FUNCTION_18_3();
    OUTLINED_FUNCTION_18_3();
  }
  else
  {
    if (qword_257579650 != -1)
      swift_once();
    v17 = OUTLINED_FUNCTION_5_7();
    v9 = OUTLINED_FUNCTION_56(v17, (uint64_t)qword_25757A4F0);
    sub_246482044();
    v18 = OUTLINED_FUNCTION_84();
    if (os_log_type_enabled(v2, v18))
    {
      v19 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      v77 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v19 = 138543362;
      aBlock = (uint64_t)v9;
      v20 = v9;
      sub_2464825E4();
      *v77 = v9;

      OUTLINED_FUNCTION_10_4(&dword_24645B000, v2, v18, "[%{public}@] Scene did deactivate.", v19);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

  }
  v21 = *(Class *)((char *)&v2->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_scene);
  if (v21)
  {
    v22 = v21;
    v23 = (uint64_t)sub_24647CA2C(a2);
    if ((v23 & 1) != 0)
    {
      v78 = a1;
      v24 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout;
      if (*((_BYTE *)&v2->isa
           + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout) == 1)
      {
        if (qword_257579650 != -1)
          swift_once();
        v25 = OUTLINED_FUNCTION_5_7();
        v26 = OUTLINED_FUNCTION_56(v25, (uint64_t)qword_25757A4F0);
        sub_246482044();
        v27 = OUTLINED_FUNCTION_88();
        if (OUTLINED_FUNCTION_68(v27))
        {
          v28 = OUTLINED_FUNCTION_1_8();
          v29 = (_QWORD *)OUTLINED_FUNCTION_1_8();
          aBlock = OUTLINED_FUNCTION_1_8();
          *(_DWORD *)v28 = 138543874;
          v85 = (uint64_t)v26;
          v30 = (char *)v26;
          sub_2464825E4();
          *v29 = v26;

          *(_WORD *)(v28 + 12) = 2082;
          v31 = *(_QWORD *)&v30[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity];
          swift_bridgeObjectRetain();
          v33 = OUTLINED_FUNCTION_118(v31, v32, &aBlock);
          OUTLINED_FUNCTION_124(v33);
          OUTLINED_FUNCTION_106();

          OUTLINED_FUNCTION_120();
          *(_WORD *)(v28 + 22) = 2050;
          v85 = 0x4014000000000000;
          sub_2464825E4();

          _os_log_impl(&dword_24645B000, (os_log_t)&unk_257579000, (os_log_type_t)a2, "[%{public}@] This is the second %{public}s exit within %{public}f seconds, ending the session", (uint8_t *)v28, 0x20u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
          OUTLINED_FUNCTION_13_3();
          OUTLINED_FUNCTION_0_8();
        }

        return;
      }
      if (qword_257579650 != -1)
        swift_once();
      v44 = OUTLINED_FUNCTION_5_7();
      v45 = OUTLINED_FUNCTION_56(v44, (uint64_t)qword_25757A4F0);
      OUTLINED_FUNCTION_38();
      v46 = v45;
      OUTLINED_FUNCTION_38();
      v47 = v46;
      sub_246482044();
      v48 = OUTLINED_FUNCTION_88();
      if (os_log_type_enabled(v46, v48))
      {
        v49 = OUTLINED_FUNCTION_1_8();
        v76 = (_QWORD *)OUTLINED_FUNCTION_1_8();
        aBlock = OUTLINED_FUNCTION_1_8();
        *(_DWORD *)v49 = 138544130;
        v85 = (uint64_t)v47;
        v50 = v47;
        sub_2464825E4();
        *v76 = v47;

        *(_WORD *)(v49 + 12) = 2082;
        v51 = *(uint64_t *)((char *)&v50->isa
                         + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity);
        v52 = *(unint64_t *)((char *)&v50[1].isa
                                  + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_processIdentity);
        swift_bridgeObjectRetain();
        v53 = sub_24646CE94(v51, v52, &aBlock);
        OUTLINED_FUNCTION_124(v53);
        OUTLINED_FUNCTION_122();

        OUTLINED_FUNCTION_40();
        *(_WORD *)(v49 + 22) = 2050;
        v85 = 0x4014000000000000;
        sub_2464825E4();

        *(_WORD *)(v49 + 32) = 2080;
        v85 = (uint64_t)a2;
        OUTLINED_FUNCTION_38();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757AB80);
        v54 = sub_2464823F8();
        v85 = sub_24646CE94(v54, v55, &aBlock);
        OUTLINED_FUNCTION_122();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_18_3();
        OUTLINED_FUNCTION_18_3();
        _os_log_impl(&dword_24645B000, v46, v48, "[%{public}@] %{public}s exited for the first time within %{public}f seconds with error: %s", (uint8_t *)v49, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
        OUTLINED_FUNCTION_13_3();
        OUTLINED_FUNCTION_0_8();
      }

      OUTLINED_FUNCTION_18_3();
      OUTLINED_FUNCTION_18_3();

      *((_BYTE *)&v3->isa + v24) = 1;
      v56 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer;
      a1 = v78;
      if (!*(Class *)((char *)&v47->isa
                     + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientExitTimer))
      {
        OUTLINED_FUNCTION_16_4(v23, &qword_25757AB58);
        sub_2464765F8();
        sub_246474394(v57);
        v58 = *(Class *)((char *)&v47->isa + v56);
        if (v58)
        {
          OUTLINED_FUNCTION_16_4(v23, &qword_25757AB60);
          v59 = v58;
          v60 = (void *)sub_246482548();
          v61 = OUTLINED_FUNCTION_3_2();
          swift_unknownObjectWeakInit();
          v83 = sub_24648002C;
          v84 = v61;
          aBlock = MEMORY[0x24BDAC760];
          v80 = 1107296256;
          v81 = sub_24646A7A4;
          v82 = &block_descriptor_26;
          v62 = _Block_copy(&aBlock);
          swift_release();
          objc_msgSend(v59, sel_scheduleWithFireInterval_leewayInterval_queue_handler_, v60, v62, 5.0, 0.0);
          OUTLINED_FUNCTION_23_0();

        }
      }
    }
    OUTLINED_FUNCTION_16_4(v23, (unint64_t *)&qword_257579DB0);
    if ((sub_2464825C0() & 1) != 0)
    {
      v63 = OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer;
      if (!*(Class *)((char *)&v3->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_backOffTimer))
      {
        aBlock = 0;
        v80 = 0xE000000000000000;
        sub_246482680();
        v64 = swift_bridgeObjectRelease();
        aBlock = 0xD00000000000001BLL;
        v80 = 0x8000000246486070;
        v65 = OUTLINED_FUNCTION_39(v64, sel_description);
        sub_2464823EC();
        v66 = v3;

        sub_246482410();
        v67 = OUTLINED_FUNCTION_40();
        v68 = aBlock;
        v69 = v80;
        OUTLINED_FUNCTION_16_4(v67, &qword_25757AB60);
        v70 = sub_246482548();
        v71 = OUTLINED_FUNCTION_3_2();
        swift_unknownObjectWeakInit();
        v72 = OUTLINED_FUNCTION_3_2();
        *(_QWORD *)(v72 + 16) = v71;
        *(_QWORD *)(v72 + 24) = a1;
        type metadata accessor for BackOffTimer();
        OUTLINED_FUNCTION_3_2();
        v73 = sub_246469FC0(v68, v69, v70, (uint64_t)sub_246480024, v72);
        v74 = a1;
        sub_246474370(v73);
        v75 = *(uint64_t *)((char *)&v66->isa + v63);
        if (!v75
          || (*(_QWORD *)(v75 + 72) = 0x4046800000000000,
              *(_BYTE *)(v75 + 80) = 0,
              !*(Class *)((char *)&v66->isa + v63)))
        {
          __break(1u);
          return;
        }
      }
      OUTLINED_FUNCTION_44();
      sub_24646A064();
      OUTLINED_FUNCTION_9_0();
    }

    return;
  }
  if (qword_257579650 != -1)
    swift_once();
  v34 = OUTLINED_FUNCTION_5_7();
  __swift_project_value_buffer(v34, (uint64_t)qword_25757A4F0);
  v35 = a1;
  v36 = sub_246482044();
  v37 = sub_2464824F4();
  if (OUTLINED_FUNCTION_27_0(v36))
  {
    v38 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v39 = OUTLINED_FUNCTION_1_8();
    aBlock = v39;
    *(_DWORD *)v38 = 136315138;
    v40 = OUTLINED_FUNCTION_39(v39, sel_identifier);
    v41 = sub_2464823EC();

    v43 = OUTLINED_FUNCTION_118(v41, v42, &aBlock);
    OUTLINED_FUNCTION_125(v43);
    sub_2464825E4();

    OUTLINED_FUNCTION_120();
    OUTLINED_FUNCTION_10_4(&dword_24645B000, v36, v37, "No snippet scene found: %s", v38);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

}

void sub_24647DAF4(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24955BD20](v3);
  if (v4)
  {
    v5 = (void *)v4;
    *(_BYTE *)(v4
             + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_sceneClientAlreadyExitedOnceWithinTimeout) = 0;
    objc_msgSend(a1, sel_invalidate);
    sub_246474394(0);

  }
}

void sub_24647DB68(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  NSObject *v14;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24955BD20](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(a2, sel_settings);
    v7 = objc_msgSend(v6, sel_isForeground);

    if ((*((_BYTE *)v5 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) & 1) == 0 && v7)
    {
      if (qword_257579650 != -1)
        swift_once();
      v8 = sub_24648205C();
      __swift_project_value_buffer(v8, (uint64_t)qword_25757A4F0);
      v9 = v5;
      v10 = sub_246482044();
      v11 = sub_24648250C();
      if (os_log_type_enabled(v10, v11))
      {
        v12 = (uint8_t *)swift_slowAlloc();
        v13 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v12 = 138543362;
        v14 = v9;
        sub_2464825E4();
        *v13 = v5;

        _os_log_impl(&dword_24645B000, v10, v11, "[%{public}@] Scene did deactivate but was foreground - reactivating.", v12, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
        swift_arrayDestroy();
        MEMORY[0x24955BC78](v13, -1, -1);
        MEMORY[0x24955BC78](v12, -1, -1);
      }
      else
      {

        v10 = v9;
      }

      objc_msgSend(a2, sel_activateWithTransitionContext_, 0);
    }

  }
}

void SnippetHostViewController.scene(_:didReceive:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32[5];

  if (qword_257579650 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v5 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v5, (uint64_t)qword_25757A4F0);
    v6 = (id)v2;
    OUTLINED_FUNCTION_127();
    swift_bridgeObjectRetain_n();
    v7 = (id)v2;
    OUTLINED_FUNCTION_72();
    v8 = OUTLINED_FUNCTION_7_4();
    if (OUTLINED_FUNCTION_16_3(v8))
    {
      v9 = OUTLINED_FUNCTION_1_8();
      v10 = (_QWORD *)OUTLINED_FUNCTION_1_8();
      v28 = OUTLINED_FUNCTION_1_8();
      v31 = (uint64_t)v7;
      v32[0] = v28;
      *(_DWORD *)v9 = 138543619;
      v11 = v7;
      sub_2464825E4();
      *v10 = v7;

      *(_WORD *)(v9 + 12) = 2081;
      OUTLINED_FUNCTION_16_4(v12, &qword_25757AB88);
      sub_246480034();
      OUTLINED_FUNCTION_46();
      v13 = sub_2464824C4();
      OUTLINED_FUNCTION_65();
      v31 = OUTLINED_FUNCTION_118(v13, v14, v32);
      sub_2464825E4();
      OUTLINED_FUNCTION_138();
      OUTLINED_FUNCTION_120();
      OUTLINED_FUNCTION_37(&dword_24645B000, v2, (os_log_type_t)v3, "[%{public}@] Scene did receive actions: %{private}s", (uint8_t *)v9);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
      OUTLINED_FUNCTION_13_3();
      OUTLINED_FUNCTION_0_8();
    }

    OUTLINED_FUNCTION_138();
    if ((*((_BYTE *)&v7->isa + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_isInvalidated) & 1) != 0)
      break;
    v31 = MEMORY[0x24BEE4B08];
    if ((a2 & 0xC000000000000001) != 0)
    {
      OUTLINED_FUNCTION_46();
      v15 = sub_246482620();
      OUTLINED_FUNCTION_16_4(v15, &qword_25757AB88);
      sub_246480034();
      sub_2464824D0();
      a2 = v32[0];
      v29 = v32[1];
      v2 = v32[2];
      v16 = v32[3];
      v17 = v32[4];
    }
    else
    {
      v18 = -1 << *(_BYTE *)(a2 + 32);
      v29 = a2 + 56;
      v2 = ~v18;
      v19 = -v18;
      if (v19 < 64)
        v20 = ~(-1 << v19);
      else
        v20 = -1;
      v17 = v20 & *(_QWORD *)(a2 + 56);
      OUTLINED_FUNCTION_46();
      v16 = 0;
    }
    v21 = (unint64_t)(v2 + 64) >> 6;
    if (a2 < 0)
    {
      while (sub_246482644())
      {
        sub_246468CA8(0, &qword_25757AB88);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v24 = v30;
        swift_unknownObjectRelease();
        v23 = v16;
        v3 = v17;
        if (!v24)
          break;
LABEL_32:
        v2 = (uint64_t)&v31;
        sub_24647F07C(&v30, v24);

        v16 = v23;
        v17 = v3;
        if ((a2 & 0x8000000000000000) == 0)
          goto LABEL_12;
      }
      goto LABEL_34;
    }
LABEL_12:
    if (v17)
    {
      v3 = (v17 - 1) & v17;
      v22 = __clz(__rbit64(v17)) | (v16 << 6);
      v23 = v16;
LABEL_31:
      v24 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v22);
      if (v24)
        goto LABEL_32;
      goto LABEL_34;
    }
    v25 = v16 + 1;
    if (!__OFADD__(v16, 1))
    {
      if (v25 < v21)
      {
        v26 = *(_QWORD *)(v29 + 8 * v25);
        v23 = v16 + 1;
        if (!v26)
        {
          v23 = v16 + 2;
          if (v16 + 2 >= v21)
            goto LABEL_34;
          v26 = *(_QWORD *)(v29 + 8 * v23);
          if (!v26)
          {
            v23 = v16 + 3;
            if (v16 + 3 >= v21)
              goto LABEL_34;
            v26 = *(_QWORD *)(v29 + 8 * v23);
            if (!v26)
            {
              v23 = v16 + 4;
              if (v16 + 4 >= v21)
                goto LABEL_34;
              v26 = *(_QWORD *)(v29 + 8 * v23);
              if (!v26)
              {
                v27 = v16 + 5;
                while (v27 < v21)
                {
                  v26 = *(_QWORD *)(v29 + 8 * v27++);
                  if (v26)
                  {
                    v23 = v27 - 1;
                    goto LABEL_30;
                  }
                }
                goto LABEL_34;
              }
            }
          }
        }
LABEL_30:
        v3 = (v26 - 1) & v26;
        v22 = __clz(__rbit64(v26)) + (v23 << 6);
        goto LABEL_31;
      }
LABEL_34:
      sub_246480A38();
      swift_bridgeObjectRelease();
      return;
    }
    __break(1u);
  }
}

void SnippetHostViewController.scene(_:didUpdateClientSettingsWith:oldClientSettings:transitionContext:)()
{
  void *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  char *v13;
  uint64_t v14;
  id v15;
  void *v16;

  OUTLINED_FUNCTION_74();
  v3 = v2;
  v5 = v4;
  if (qword_257579650 != -1)
    swift_once();
  v6 = OUTLINED_FUNCTION_5_7();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_25757A4F0);
  v8 = v0;
  v9 = v7;
  sub_246482044();
  v10 = OUTLINED_FUNCTION_84();
  if (OUTLINED_FUNCTION_16_3(v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v12 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v11 = 138543362;
    v13 = v8;
    sub_2464825E4();
    *v12 = v8;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v9, v1, "[%{public}@] Scene did receive new client settings.", v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

  if (v3)
  {
    v15 = OUTLINED_FUNCTION_39(v14, sel_animationFence);
    if (v15)
    {
      v16 = v15;
      objc_msgSend((id)objc_opt_self(), sel__synchronizeDrawingWithFence_, v15);

    }
  }
  objc_msgSend(*(id *)&v8[OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_settingsDiffInspector], sel_inspectDiff_withContext_, v5, 0);
  OUTLINED_FUNCTION_31();
}

void SnippetHostViewController.sceneLayerManagerDidUpdateLayers(_:)()
{
  sub_24647E5F4();
}

void SnippetHostViewController.sceneLayerManagerDidStopTrackingLayers(_:)()
{
  sub_24647E5F4();
}

void SnippetHostViewController.sceneLayerManagerDidStartTrackingLayers(_:)()
{
  sub_24647E5F4();
}

void sub_24647E5F4()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  const char *v3;
  void (*v4)(void);
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  id v10;

  OUTLINED_FUNCTION_74();
  v3 = v2;
  v4();
  if (qword_257579650 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_5_7();
  v10 = OUTLINED_FUNCTION_55(v5, (uint64_t)qword_25757A4F0);
  OUTLINED_FUNCTION_54();
  v6 = OUTLINED_FUNCTION_84();
  if (OUTLINED_FUNCTION_27_0(v0))
  {
    v7 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    v8 = (_QWORD *)OUTLINED_FUNCTION_1_8();
    *(_DWORD *)v7 = 138543362;
    v9 = v10;
    OUTLINED_FUNCTION_14_3();
    *v8 = v10;

    OUTLINED_FUNCTION_10_4(&dword_24645B000, v0, v6, v3, v7);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A900);
    OUTLINED_FUNCTION_13_3();
    OUTLINED_FUNCTION_0_8();
  }

}

Swift::Void __swiftcall SnippetHostViewController.presentationControllerDidDismiss(_:)(UIPresentationController a1)
{
  sub_2464743A0(0);
}

char *sub_24647E7E8()
{
  uint64_t *v0;
  uint64_t v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_24647E86C(result, *(_QWORD *)(v1 + 16) + 1, 1, v1);
    *v0 = (uint64_t)result;
  }
  return result;
}

char *sub_24647E830(char *result)
{
  uint64_t *v1;
  unint64_t v2;

  v2 = *(_QWORD *)(*v1 + 24);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_24647E86C((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = (uint64_t)result;
  }
  return result;
}

char *sub_24647E86C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADA0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_24647EAF0((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_24647E958(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_24647E958(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADA8);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_246482740();
  __break(1u);
  return result;
}

char *sub_24647EA6C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246482740();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_24647EAF0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_246482740();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_24647EB74(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 32 * a2 <= a1 || a1 + 32 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_246482740();
  __break(1u);
  return result;
}

uint64_t sub_24647EC44()
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_90();
  return swift_deallocObject();
}

void sub_24647EC60(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_2464751D4(a1, a2, v2);
}

void sub_24647EC68(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_246475350(a1, a2, *(void **)(v2 + 16));
}

void sub_24647EC70(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_2464756A8(a1, a2, *(void **)(v2 + 16));
}

unint64_t sub_24647EC78(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
  v2 = sub_2464823BC();
  return sub_24647ED1C(a1, v2);
}

unint64_t sub_24647ECE8(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x24955B6FC](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_24647EDE8(a1, v3);
}

unint64_t sub_24647ED1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757A130);
    do
    {
      if ((sub_2464823D4() & 1) != 0)
        break;
      v4 = (v4 + 1) & v5;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_24647EDE8(int a1, uint64_t a2)
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
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

uint64_t sub_24647EE84(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t sub_24647EEA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADC8);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * ((uint64_t)(v4 - 32) / 4);
  v5 = sub_2464808A4(&v7, (_DWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_246480A38();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

char *sub_24647EF80(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_24647EF9C(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_24647EF9C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25757ADC0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 32);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24647EA6C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_24647EB74((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_24647F07C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  char v14;
  uint64_t v15;
  id v16;
  char v17;
  void *v18;
  id v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_246482638();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_246468CA8(0, &qword_25757AB88);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_24648262C();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_24647F314(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_24647F4F8();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_24647F790((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v10 = sub_2464825B4();
    v11 = -1 << *(_BYTE *)(v6 + 32);
    v12 = v10 & ~v11;
    if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
    {
      sub_246468CA8(0, &qword_25757AB88);
      v13 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v12);
      v14 = sub_2464825C0();

      if ((v14 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v18 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v12);
        *a1 = v18;
        v19 = v18;
        return 0;
      }
      v15 = ~v11;
      while (1)
      {
        v12 = (v12 + 1) & v15;
        if (((*(_QWORD *)(v6 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
          break;
        v16 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v12);
        v17 = sub_2464825C0();

        if ((v17 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_24647F810((uint64_t)v8, v12, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_24647F314(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD88);
  v2 = sub_246482668();
  v14 = v2;
  sub_246482620();
  if (!sub_246482644())
  {
LABEL_16:
    swift_release();
    return v2;
  }
  sub_246468CA8(0, &qword_25757AB88);
  while (1)
  {
    swift_dynamicCast();
    v2 = v14;
    if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
    {
      sub_24647F4F8();
      v2 = v14;
    }
    result = sub_2464825B4();
    v4 = v2 + 56;
    v5 = -1 << *(_BYTE *)(v2 + 32);
    v6 = result & ~v5;
    v7 = v6 >> 6;
    if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) == 0)
      break;
    v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
    ++*(_QWORD *)(v2 + 16);
    if (!sub_246482644())
      goto LABEL_16;
  }
  v9 = 0;
  v10 = (unint64_t)(63 - v5) >> 6;
  while (++v7 != v10 || (v9 & 1) == 0)
  {
    v11 = v7 == v10;
    if (v7 == v10)
      v7 = 0;
    v9 |= v11;
    v12 = *(_QWORD *)(v4 + 8 * v7);
    if (v12 != -1)
    {
      v8 = __clz(__rbit64(~v12)) + (v7 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24647F4F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD88);
  v3 = sub_24648265C();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    if (!v8)
      goto LABEL_7;
LABEL_6:
    v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * i);
      result = sub_2464825B4();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v19) >> 6;
        while (++v21 != v24 || (v23 & 1) == 0)
        {
          v25 = v21 == v24;
          if (v21 == v24)
            v21 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v21);
          if (v26 != -1)
          {
            v22 = __clz(__rbit64(~v26)) + (v21 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
      ++*(_QWORD *)(v4 + 16);
      if (v8)
        goto LABEL_6;
LABEL_7:
      v15 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_38;
      if (v15 >= v9)
        goto LABEL_32;
      v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        v12 = v15 + 1;
        if (v15 + 1 >= v9)
          goto LABEL_32;
        v16 = v6[v12];
        if (!v16)
        {
          v12 = v15 + 2;
          if (v15 + 2 >= v9)
            goto LABEL_32;
          v16 = v6[v12];
          if (!v16)
          {
            v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              v1 = v28;
              v27 = 1 << *(_BYTE *)(v2 + 32);
              if (v27 > 63)
                sub_24647EE84(0, (unint64_t)(v27 + 63) >> 6, (_QWORD *)(v2 + 56));
              else
                *v6 = -1 << v27;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                v12 = v17 + 1;
                if (__OFADD__(v17, 1))
                  goto LABEL_39;
                if (v12 >= v9)
                  goto LABEL_32;
                v16 = v6[v12];
                ++v17;
                if (v16)
                  goto LABEL_20;
              }
            }
            v12 = v17;
          }
        }
      }
LABEL_20:
      v8 = (v16 - 1) & v16;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_24647F790(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2464825B4();
  result = sub_246482614();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_24647F810(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_24647F4F8();
  }
  else
  {
    if (v7 > v6)
    {
      sub_24647F994();
      goto LABEL_14;
    }
    sub_24647FB3C();
  }
  v8 = *v3;
  v9 = sub_2464825B4();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_246468CA8(0, &qword_25757AB88);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_2464825C0();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_246482788();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_2464825C0();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

id sub_24647F994()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD88);
  v2 = *v0;
  v3 = sub_246482650();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * i) = v20;
    result = v20;
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_24647FB3C()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25757AD88);
  v3 = sub_24648265C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    result = sub_2464825B4();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6))) == 0)
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v19) >> 6;
      while (++v21 != v24 || (v23 & 1) == 0)
      {
        v25 = v21 == v24;
        if (v21 == v24)
          v21 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v21);
        if (v26 != -1)
        {
          v22 = __clz(__rbit64(~v26)) + (v21 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v22 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v10 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v10 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v22) = v18;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_36;
    if (v15 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v9)
        goto LABEL_32;
      v16 = *(_QWORD *)(v6 + 8 * v12);
      if (!v16)
      {
        v12 = v15 + 2;
        if (v15 + 2 >= v9)
          goto LABEL_32;
        v16 = *(_QWORD *)(v6 + 8 * v12);
        if (!v16)
          break;
      }
    }
LABEL_20:
    v8 = (v16 - 1) & v16;
  }
  v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_34;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v9)
      goto LABEL_32;
    v16 = *(_QWORD *)(v6 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_24647FDB0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2464823E0();
  objc_msgSend(a3, sel_addMilestone_, v4);

}

uint64_t sub_24647FDF4()
{
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_94();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24647FE20(uint64_t a1)
{
  uint64_t v1;

  return sub_246475E18(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_24647FE48()
{
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_43();
  return swift_deallocObject();
}

uint64_t sub_24647FE60()
{
  uint64_t v0;

  return sub_24647640C(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

id sub_24647FE6C(void *a1)
{
  uint64_t v1;

  return sub_24647665C(a1, *(id *)(v1 + 16));
}

void sub_24647FE74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2464823E0();
  objc_msgSend(a3, sel_satisfyMilestone_, v4);

}

uint64_t sub_24647FEB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_24647FEFC(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_2464823E0();
  OUTLINED_FUNCTION_28_0();
  objc_msgSend(a3, *a4, v6);

}

uint64_t sub_24647FF50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_2;
  uint64_t *v9;
  uint64_t v11[6];

  v11[3] = a3;
  v11[4] = a4;
  v11[5] = a5;
  boxed_opaque_existential_2 = __swift_allocate_boxed_opaque_existential_2(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_2, a1, a3);
  v9 = (uint64_t *)(a2 + OBJC_IVAR____TtC15SiriInteractive25SnippetHostViewController_viewModel);
  OUTLINED_FUNCTION_2_4();
  __swift_assign_boxed_opaque_existential_2(v9, v11);
  swift_endAccess();
  sub_2464743AC();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

void sub_24647FFE4(void *a1)
{
  uint64_t v1;

  sub_24647B7C4(a1, *(void **)(v1 + 16), "[%{public}@] Sending cancellation touch delivery policy failed with error: %{public}s");
}

uint64_t sub_246480004()
{
  swift_release();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_42();
  return swift_deallocObject();
}

void sub_246480024()
{
  uint64_t v0;

  sub_24647DB68(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24648002C(void *a1)
{
  uint64_t v1;

  sub_24647DAF4(a1, v1);
}

unint64_t sub_246480034()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25757AB90;
  if (!qword_25757AB90)
  {
    sub_246468CA8(255, &qword_25757AB88);
    result = MEMORY[0x24955BBE8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25757AB90);
  }
  return result;
}

unint64_t sub_246480088()
{
  unint64_t result;

  result = qword_25757AB98;
  if (!qword_25757AB98)
  {
    result = MEMORY[0x24955BBE8](&protocol conformance descriptor for SnippetHostViewController.PresentationMode, &type metadata for SnippetHostViewController.PresentationMode);
    atomic_store(result, (unint64_t *)&qword_25757AB98);
  }
  return result;
}

void sub_2464800C4()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  sub_24647382C();
  *v0 = v1;
  OUTLINED_FUNCTION_1_2();
}

void sub_2464800E4()
{
  _DWORD *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_246473B28();
  OUTLINED_FUNCTION_1_2();
}

void sub_246480100(unsigned int *a1)
{
  sub_246473B78(*a1);
  OUTLINED_FUNCTION_1_2();
}

void sub_246480120()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  sub_246473C10();
  *v0 = v1;
  OUTLINED_FUNCTION_1_2();
}

void sub_246480140()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_1();
  sub_246473D64();
  *v0 = v1;
  OUTLINED_FUNCTION_1_2();
}

void sub_246480160()
{
  id *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_246473E84();
  OUTLINED_FUNCTION_1_2();
}

void sub_246480180()
{
  _BYTE *v0;

  OUTLINED_FUNCTION_13_1();
  *v0 = sub_24647702C() & 1;
  OUTLINED_FUNCTION_1_2();
}

void sub_2464801A0(char *a1)
{
  sub_2464770A8(*a1);
  OUTLINED_FUNCTION_1_2();
}

uint64_t method lookup function for SnippetHostViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of SnippetHostViewController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x178))();
}

uint64_t dispatch thunk of SnippetHostViewController.presentationMode.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x180))();
}

uint64_t dispatch thunk of SnippetHostViewController.resolvedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x188))();
}

uint64_t dispatch thunk of SnippetHostViewController.activityTouchRestrictedRects.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1A0))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1B8))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C0))();
}

uint64_t dispatch thunk of SnippetHostViewController.systemProvidedMetrics.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1C8))();
}

uint64_t dispatch thunk of SnippetHostViewController.__allocating_init<A>(bundleIdentifier:viewModel:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 992))();
}

uint64_t dispatch thunk of SnippetHostViewController.ensureContent(timeout:queue:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3E8))();
}

uint64_t dispatch thunk of SnippetHostViewController.invalidate()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F0))();
}

uint64_t dispatch thunk of SnippetHostViewController.updateViewModel<A>(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x3F8))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x400))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x408))();
}

uint64_t dispatch thunk of SnippetHostViewController.shouldShareTouchesWithHost.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x410))();
}

uint64_t dispatch thunk of SnippetHostViewController.cancelTouchesForCurrentEventInHostedContent()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x418))();
}

ValueMetadata *type metadata accessor for SnippetHostViewController.PresentationMode()
{
  return &type metadata for SnippetHostViewController.PresentationMode;
}

uint64_t sub_2464803DC()
{
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_42();
  return swift_deallocObject();
}

id sub_2464803F4()
{
  uint64_t v0;
  double v1;

  v1 = 0.0;
  if (*(_BYTE *)(v0 + 16))
    v1 = 1.0;
  return objc_msgSend(*(id *)(v0 + 24), sel_setAlpha_, v1);
}

id sub_246480418()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setHidden_, (*(_BYTE *)(v0 + 24) & 1) == 0);
}

void sub_246480434(void *a1, void *a2)
{
  uint64_t v2;

  sub_24647AD40(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_24648043C()
{
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_25_0();
  OUTLINED_FUNCTION_42();
  return swift_deallocObject();
}

id sub_246480454(void *a1)
{
  uint64_t v1;

  return sub_24647A180(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_246480460(void *a1)
{
  uint64_t v1;

  sub_24647A3C8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24648046C()
{
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_43();
  return swift_deallocObject();
}

void sub_246480484(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_24647A4C0(a1, a2, *(_QWORD *)(v2 + 16), *(_BYTE *)(v2 + 24), *(char **)(v2 + 32));
}

uint64_t sub_2464804A0()
{
  return swift_deallocObject();
}

id sub_2464804B0(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setForeground_, *(unsigned __int8 *)(v1 + 16));
}

uint64_t objectdestroy_81Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  OUTLINED_FUNCTION_42();
  return swift_deallocObject();
}

void sub_2464804EC()
{
  uint64_t v0;
  void (*v1)(void);

  v1 = *(void (**)(void))(v0 + 16);
  if (v1)
    v1();
  OUTLINED_FUNCTION_1_2();
}

uint64_t sub_246480510()
{
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_90();
  return swift_deallocObject();
}

void sub_246480524(unsigned __int8 a1)
{
  uint64_t v1;

  sub_246478FA0(a1, *(void **)(v1 + 16));
}

uint64_t sub_24648052C()
{
  OUTLINED_FUNCTION_12_3();
  swift_release();
  OUTLINED_FUNCTION_43();
  return swift_deallocObject();
}

void sub_246480548(void *a1, char a2)
{
  uint64_t v2;

  sub_24647BEEC(a1, a2 & 1, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_246480558()
{
  OUTLINED_FUNCTION_109();
  OUTLINED_FUNCTION_94();
  OUTLINED_FUNCTION_43();
  return swift_deallocObject();
}

uint64_t sub_246480570()
{
  uint64_t v0;

  return sub_24647C920(*(uint64_t (**)(uint64_t, _QWORD))(v0 + 16), *(_QWORD *)(v0 + 24), *(id *)(v0 + 32));
}

uint64_t sub_24648057C()
{
  OUTLINED_FUNCTION_109();
  return swift_deallocObject();
}

void sub_246480598()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32));
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_2464805BC()
{
  unint64_t result;

  result = qword_25757AD68;
  if (!qword_25757AD68)
  {
    result = MEMORY[0x24955BBE8](&unk_246484A24, &type metadata for SnippetHostViewController.SceneCaptureError);
    atomic_store(result, (unint64_t *)&qword_25757AD68);
  }
  return result;
}

uint64_t sub_2464805F8()
{
  OUTLINED_FUNCTION_12_3();
  OUTLINED_FUNCTION_25_0();
  swift_release();
  return swift_deallocObject();
}

void sub_246480620()
{
  uint64_t v0;

  sub_24647C26C(*(char **)(v0 + 16), *(void **)(v0 + 24), *(void (**)(_QWORD))(v0 + 32));
}

id sub_24648062C(id result, char a2)
{
  if ((a2 & 1) == 0)
    return result;
  return result;
}

void sub_246480638(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

uint64_t sub_246480644(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24955BBE8](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_246480684()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  OUTLINED_FUNCTION_90();
  return swift_deallocObject();
}

void sub_2464806A0(uint64_t a1)
{
  uint64_t v1;

  sub_246476754(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2464806A8(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_2(uint64_t *result, uint64_t *a2)
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
      result[5] = a2[5];
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

uint64_t sub_24648083C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2464745A0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_246480848()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_0();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_246480878()
{
  uint64_t v0;

  return sub_246476038(*(void **)(v0 + 16), *(void **)(v0 + 24), *(uint64_t (**)(void *))(v0 + 32));
}

void sub_246480884(void *a1)
{
  uint64_t v1;

  sub_24647B7C4(a1, *(void **)(v1 + 16), "[%{public}@] Sending touch delivery policy failed with error: %{public}s");
}

_QWORD *sub_2464808A4(_QWORD *result, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;

  v4 = a4 + 64;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_36:
    *result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (_QWORD *)a3;
  }
  if (!a3)
  {
    v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(_DWORD *)(*(_QWORD *)(a4 + 48) + 4 * v12);
    if (v9 == a3)
      goto LABEL_36;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_18;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    v13 = v8;
LABEL_18:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_19;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_31;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    v13 = v15;
    goto LABEL_18;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_14;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_17;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_35;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_246480A38()
{
  return swift_release();
}

void sub_246480A48()
{
  uint64_t v0;

  sub_2464777C0(v0);
}

void sub_246480A50()
{
  uint64_t v0;

  sub_246477C24(v0);
}

uint64_t sub_246480A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = OUTLINED_FUNCTION_2_11();
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  v4 = (v3 + 56) & ~v3;
  swift_release();
  OUTLINED_FUNCTION_114();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v4 + *(int *)(v2 + 32), v1);
  return swift_deallocObject();
}

void sub_246480AE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  v5 = *(unsigned __int8 *)(*(_QWORD *)(OUTLINED_FUNCTION_2_11() - 8) + 80);
  sub_246477FF0(v0[6], (uint64_t)v0 + ((v5 + 56) & ~v5), v1, v2, v3, v4);
}

uint64_t sub_246480B3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void (*v8)(unint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 32);
  v2 = OUTLINED_FUNCTION_2_11();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v1 - 8);
  v6 = (v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_114();
  swift_release();
  v7 = v4 + *(int *)(v2 + 32);
  v8 = *(void (**)(unint64_t, uint64_t))(v5 + 8);
  v8(v7, v1);
  v8(v0 + v6, v1);
  return swift_deallocObject();
}

uint64_t sub_246480BF0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = v1[4];
  v5 = *(_QWORD *)(sub_24648235C() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v4 - 8) + 80);
  v8 = v1[2];
  v9 = v1[3];
  v10 = (uint64_t)v1 + v6;
  v11 = (uint64_t)v1 + ((v6 + *(_QWORD *)(v5 + 64) + v7) & ~v7);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_24646D7B4;
  return sub_246478830(a1, v8, v9, v10, v11, v4);
}

uint64_t sub_246480CC8()
{
  OUTLINED_FUNCTION_12_3();
  return swift_deallocObject();
}

void sub_246480CE4()
{
  sub_2464791C8();
  OUTLINED_FUNCTION_1_2();
}

uint64_t getEnumTagSinglePayload for SnippetHostViewController.SceneCaptureError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SnippetHostViewController.SceneCaptureError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_246480DD8 + 4 * byte_2464847F1[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_246480E0C + 4 * byte_2464847EC[v4]))();
}

uint64_t sub_246480E0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_246480E14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x246480E1CLL);
  return result;
}

uint64_t sub_246480E28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x246480E30);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_246480E34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_246480E3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SnippetHostViewController.SceneCaptureError()
{
  return &type metadata for SnippetHostViewController.SceneCaptureError;
}

unint64_t sub_246480E60()
{
  unint64_t result;

  result = qword_25757ADE8;
  if (!qword_25757ADE8)
  {
    result = MEMORY[0x24955BBE8](&unk_2464849FC, &type metadata for SnippetHostViewController.SceneCaptureError);
    atomic_store(result, (unint64_t *)&qword_25757ADE8);
  }
  return result;
}

void *OUTLINED_FUNCTION_10_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  return _Block_copy((const void *)(v2 - 168));
}

void OUTLINED_FUNCTION_12_3()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_14_3()
{
  return sub_2464825E4();
}

void OUTLINED_FUNCTION_16_4(uint64_t a1, unint64_t *a2)
{
  sub_246468CA8(0, a2);
}

void OUTLINED_FUNCTION_17_3(uint64_t a1@<X8>)
{
  uint64_t v1;

}

void OUTLINED_FUNCTION_18_3()
{
  void *v0;

}

id OUTLINED_FUNCTION_21_1(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_23_0()
{
  const void *v0;

  _Block_release(v0);
}

void OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

}

id OUTLINED_FUNCTION_26_0(float a1)
{
  void *v1;
  float *v2;

  *v2 = a1;
  return v1;
}

BOOL OUTLINED_FUNCTION_27_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return sub_246482410();
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_isEscapingClosureAtFileLocation();
}

id OUTLINED_FUNCTION_36()
{
  void *v0;
  void *v1;
  double v2;

  return SceneItemMetricsRequest.init(width:height:cornerRadius:)(v1, v0, v2);
}

void OUTLINED_FUNCTION_37(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

id OUTLINED_FUNCTION_38()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_39(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_40()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_45()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_49(uint64_t a1@<X8>)
{

}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void OUTLINED_FUNCTION_53(id a1)
{

}

uint64_t OUTLINED_FUNCTION_54()
{
  return sub_246482044();
}

id OUTLINED_FUNCTION_55(uint64_t a1, uint64_t a2)
{
  void *v2;

  __swift_project_value_buffer(a1, a2);
  return v2;
}

id OUTLINED_FUNCTION_56(uint64_t a1, uint64_t a2)
{
  void *v2;

  __swift_project_value_buffer(a1, a2);
  return v2;
}

uint64_t OUTLINED_FUNCTION_57()
{
  return swift_release();
}

id OUTLINED_FUNCTION_58()
{
  double v0;

  return SizeDimensionRequest.init(minimum:maximum:type:)(1, v0, v0);
}

uint64_t OUTLINED_FUNCTION_59()
{
  return type metadata accessor for SceneMetricsRequest();
}

id OUTLINED_FUNCTION_60()
{
  double v0;

  return SizeDimensionRequest.init(minimum:maximum:type:)(1, v0, v0);
}

uint64_t OUTLINED_FUNCTION_61()
{
  return sub_24648280C();
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_2464827E8();
}

uint64_t OUTLINED_FUNCTION_64()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_65()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_66(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3784));
}

BOOL OUTLINED_FUNCTION_68(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_69(uint64_t a1)
{
  uint64_t v1;

  return sub_24646CE94(a1, 0xEA0000000000646ELL, (uint64_t *)(v1 - 168));
}

uint64_t OUTLINED_FUNCTION_72()
{
  return sub_246482044();
}

uint64_t OUTLINED_FUNCTION_73@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_2464825E4();
}

id OUTLINED_FUNCTION_76()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_77()
{
  const void *v0;

  _Block_release(v0);
}

BOOL OUTLINED_FUNCTION_79(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_80(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_2464823EC();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return sub_2464824E8();
}

id OUTLINED_FUNCTION_85()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 328));
}

uint64_t OUTLINED_FUNCTION_88()
{
  return sub_24648250C();
}

void OUTLINED_FUNCTION_89(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_246467C28(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_90()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_92(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 1864));
}

uint64_t OUTLINED_FUNCTION_93()
{
  return sub_246482410();
}

void OUTLINED_FUNCTION_94()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_95(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

id OUTLINED_FUNCTION_96(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void OUTLINED_FUNCTION_97()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_98()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_99(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_100()
{
  return sub_246481FE4();
}

uint64_t OUTLINED_FUNCTION_101()
{
  return sub_246481FE4();
}

uint64_t OUTLINED_FUNCTION_102(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);
  uint64_t v2;

  return v1(a1, *(_QWORD *)(v2 - 296));
}

void OUTLINED_FUNCTION_103()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_105()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_2464825E4();
}

void *OUTLINED_FUNCTION_107@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, char aBlock, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  a6 = a1;
  a7 = v7;
  return _Block_copy(&aBlock);
}

void OUTLINED_FUNCTION_108()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_109()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_110()
{
  return swift_release_n();
}

uint64_t OUTLINED_FUNCTION_111()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_112()
{
  return swift_bridgeObjectRetain();
}

id OUTLINED_FUNCTION_113(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_114()
{
  return swift_release();
}

void *OUTLINED_FUNCTION_115@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char aBlock, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  a8 = a1;
  a9 = v9;
  return _Block_copy(&aBlock);
}

id OUTLINED_FUNCTION_116()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

id OUTLINED_FUNCTION_117(Class a1)
{
  return objc_allocWithZone(a1);
}

uint64_t OUTLINED_FUNCTION_118(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_24646CE94(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_119(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, *(_QWORD *)(v3 - 168), v2);
}

uint64_t OUTLINED_FUNCTION_120()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_121(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_122()
{
  return sub_2464825E4();
}

uint64_t OUTLINED_FUNCTION_124(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_125(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return v1 - 88;
}

uint64_t OUTLINED_FUNCTION_127()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_128(uint64_t a1, ...)
{
  char v1;
  va_list va;

  va_start(va, a1);
  sub_246473484((uint64_t)va, v1);
}

uint64_t OUTLINED_FUNCTION_129()
{
  return sub_2464827F4();
}

uint64_t OUTLINED_FUNCTION_131()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_134()
{
  return sub_246481FE4();
}

id OUTLINED_FUNCTION_135(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_137()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_138()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_139(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_24646CE94(a1, a2, (uint64_t *)(v2 - 136));
}

id OUTLINED_FUNCTION_140()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 328));
}

void OUTLINED_FUNCTION_141()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_143()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_144(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, objc_super a11)
{
  return objc_msgSendSuper2(&a11, a2);
}

id SnippetSceneSpecification.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

uint64_t sub_24648150C()
{
  return type metadata accessor for SnippetSceneSettings();
}

uint64_t sub_246481528()
{
  return type metadata accessor for SnippetSceneClientSettings();
}

uint64_t sub_246481580()
{
  return type metadata accessor for SnippetScene();
}

id SnippetSceneSpecification.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SnippetSceneSpecification()
{
  return objc_opt_self();
}

id SnippetSceneSpecification.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SnippetSceneSpecification();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *initializeBufferWithCopyOfBuffer for ProcessIdentity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ProcessIdentity()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ProcessIdentity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for ProcessIdentity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ProcessIdentity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ProcessIdentity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ProcessIdentity()
{
  return &type metadata for ProcessIdentity;
}

id sub_246481758(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  unint64_t v9;
  objc_class *v10;
  objc_class *v11;
  id v12;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v5 = objc_allocWithZone(MEMORY[0x24BDC1540]);
  swift_bridgeObjectRetain();
  v6 = sub_246481DFC(a1, a2, 0);
  if (!v6)
  {
    if (qword_257579658 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v14, (uint64_t)qword_25757A508);
    OUTLINED_FUNCTION_2_13();
    v7 = sub_246482044();
    v15 = sub_2464824F4();
    if (os_log_type_enabled(v7, v15))
    {
      v16 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_1_8();
      *(_DWORD *)v16 = 136380675;
      v17 = swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_5_9(v17, v18, v19, v20);
      sub_2464825E4();
      OUTLINED_FUNCTION_6_9();
      _os_log_impl(&dword_24645B000, v7, v15, "No application record created with bundle identifier: %{private}s", v16, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0_8();
    }
    goto LABEL_26;
  }
  v7 = v6;
  v8 = -[NSObject identities](v7, sel_identities);
  sub_246464954(0, &qword_25757AE78);
  v9 = sub_246482440();

  if (!(v9 >> 62))
  {
    if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10) == 1)
      goto LABEL_4;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  v2 = sub_24648271C();
  OUTLINED_FUNCTION_64();
  if (v2 != 1)
  {
LABEL_20:
    OUTLINED_FUNCTION_64();
    if (qword_257579658 != -1)
      swift_once();
    v30 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v30, (uint64_t)qword_25757A508);
    OUTLINED_FUNCTION_2_13();
    sub_246482044();
    v31 = OUTLINED_FUNCTION_12_4();
    if (OUTLINED_FUNCTION_16_3(v31))
    {
      v24 = (uint8_t *)OUTLINED_FUNCTION_1_8();
      OUTLINED_FUNCTION_1_8();
      v32 = OUTLINED_FUNCTION_8_9(4.845e-34);
      OUTLINED_FUNCTION_5_9(v32, v33, v34, v35);
      OUTLINED_FUNCTION_4_10();
      OUTLINED_FUNCTION_6_9();
      v29 = "Multiple identities found with bundle identifier: %{private}s";
      goto LABEL_24;
    }

LABEL_26:
    OUTLINED_FUNCTION_11_3();
    return 0;
  }
  swift_bridgeObjectRetain();
  v21 = sub_24648271C();
  OUTLINED_FUNCTION_64();
  if (!v21)
  {
    OUTLINED_FUNCTION_64();
    if (qword_257579658 != -1)
      swift_once();
    v22 = OUTLINED_FUNCTION_5_7();
    __swift_project_value_buffer(v22, (uint64_t)qword_25757A508);
    OUTLINED_FUNCTION_2_13();
    sub_246482044();
    v23 = OUTLINED_FUNCTION_12_4();
    if (!OUTLINED_FUNCTION_16_3(v23))
      goto LABEL_29;
    v24 = (uint8_t *)OUTLINED_FUNCTION_1_8();
    OUTLINED_FUNCTION_1_8();
    v25 = OUTLINED_FUNCTION_8_9(4.845e-34);
    OUTLINED_FUNCTION_5_9(v25, v26, v27, v28);
    OUTLINED_FUNCTION_4_10();
    OUTLINED_FUNCTION_6_9();
    v29 = "No lsIdentity found for bundle identifier: %{private}s";
LABEL_24:
    _os_log_impl(&dword_24645B000, (os_log_t)v9, (os_log_type_t)v2, v29, v24, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_8();
  }
LABEL_4:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v10 = (objc_class *)MEMORY[0x24955B5B8](0, v9);
    goto LABEL_7;
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_29:

    OUTLINED_FUNCTION_11_3();
    return 0;
  }
  v10 = (objc_class *)*(id *)(v9 + 32);
LABEL_7:
  v11 = v10;
  OUTLINED_FUNCTION_64();
  v12 = objc_msgSend((id)objc_opt_self(), sel_identityForLSApplicationIdentity_LSApplicationRecord_, v11, v7);

  return v12;
}

id sub_246481DFC(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_246481FD8();

    swift_willThrow();
  }
  return v6;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return sub_2464825E4();
}

uint64_t OUTLINED_FUNCTION_4_10()
{
  return sub_2464825E4();
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  unint64_t v4;
  uint64_t v5;
  va_list va;

  va_start(va, a4);
  return sub_24646CE94(v5, v4, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_6_9()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_8_9(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  return sub_2464824F4();
}

id OUTLINED_FUNCTION_13_6(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_246481F60()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_246481F6C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_246481F78()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_246481F84()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_246481F90()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_246481F9C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_246481FA8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_246481FB4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_246481FC0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_246481FCC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_246481FD8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_246481FE4()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_246481FF0()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_246481FFC()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_246482008()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_246482014()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_246482020()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24648202C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_246482038()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_246482044()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_246482050()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24648205C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_246482068()
{
  return MEMORY[0x24BEBC020]();
}

uint64_t sub_246482074()
{
  return MEMORY[0x24BEBC2F0]();
}

uint64_t sub_246482080()
{
  return MEMORY[0x24BEBC300]();
}

uint64_t sub_24648208C()
{
  return MEMORY[0x24BEBC808]();
}

uint64_t sub_246482098()
{
  return MEMORY[0x24BEBC810]();
}

uint64_t sub_2464820A4()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_2464820B0()
{
  return MEMORY[0x24BDB9500]();
}

uint64_t sub_2464820BC()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_2464820C8()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_2464820D4()
{
  return MEMORY[0x24BDB99E0]();
}

uint64_t sub_2464820E0()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2464820EC()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_2464820F8()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_246482104()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_246482110()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_24648211C()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_246482128()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_246482134()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_246482140()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t sub_24648214C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_246482158()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_246482164()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_246482170()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_24648217C()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_246482188()
{
  return MEMORY[0x24BDB9ED8]();
}

uint64_t sub_246482194()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_2464821A0()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2464821AC()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_2464821B8()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2464821C4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2464821D0()
{
  return MEMORY[0x24BDBA0C8]();
}

uint64_t sub_2464821DC()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_2464821E8()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2464821F4()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_246482200()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_24648220C()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_246482218()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_246482224()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_246482230()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_24648223C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_246482248()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_246482254()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_246482260()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_24648226C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_246482278()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_246482284()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_246482290()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_24648229C()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_2464822A8()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_2464822B4()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_2464822C0()
{
  return MEMORY[0x24BDF0F38]();
}

uint64_t sub_2464822CC()
{
  return MEMORY[0x24BDF1008]();
}

uint64_t sub_2464822D8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_2464822E4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_2464822F0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_2464822FC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_246482308()
{
  return MEMORY[0x24BDF2A70]();
}

uint64_t sub_246482314()
{
  return MEMORY[0x24BDF39B0]();
}

uint64_t sub_246482320()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_24648232C()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_246482338()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_246482344()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_246482350()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_24648235C()
{
  return MEMORY[0x24BDF4870]();
}

uint64_t sub_246482368()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_246482374()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_246482380()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24648238C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_246482398()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_2464823A4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2464823B0()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_2464823BC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2464823C8()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_2464823D4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2464823E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2464823EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2464823F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_246482404()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_246482410()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24648241C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_246482428()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_246482434()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_246482440()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24648244C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_246482458()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_246482464()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_246482470()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_24648247C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_246482488()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_246482494()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2464824A0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2464824AC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2464824B8()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_2464824C4()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2464824D0()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2464824DC()
{
  return MEMORY[0x24BDCFE90]();
}

uint64_t sub_2464824E8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2464824F4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_246482500()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_24648250C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_246482518()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_246482524()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_246482530()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_24648253C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_246482548()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_246482554()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_246482560()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24648256C()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_246482578()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_246482584()
{
  return MEMORY[0x24BDD00F0]();
}

uint64_t sub_246482590()
{
  return MEMORY[0x24BDBD840]();
}

uint64_t sub_24648259C()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_2464825A8()
{
  return MEMORY[0x24BEBD010]();
}

uint64_t sub_2464825B4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2464825C0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2464825CC()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_2464825D8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2464825E4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2464825F0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2464825FC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_246482608()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_246482614()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_246482620()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_24648262C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_246482638()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_246482644()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_246482650()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_24648265C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_246482668()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_246482674()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_246482680()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24648268C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_246482698()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2464826A4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2464826B0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2464826BC()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2464826C8()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2464826D4()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2464826E0()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_2464826EC()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_2464826F8()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_246482704()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_246482710()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24648271C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_246482728()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_246482734()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_246482740()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24648274C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_246482758()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_246482764()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_246482770()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_24648277C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_246482788()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_246482794()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2464827A0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2464827AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2464827B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2464827C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2464827D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2464827DC()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_2464827E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2464827F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_246482800()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_24648280C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_246482818()
{
  return MEMORY[0x24BDD07D0]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x24BE0B640]();
}

uint64_t BSDeserializeBSXPCEncodableObjectFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAF0]();
}

uint64_t BSDeserializeCGFloatFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BAF8]();
}

uint64_t BSDeserializeCGSizeFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB08]();
}

uint64_t BSDeserializeDoubleFromXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BB18]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCE0]();
}

uint64_t BSSerializeCGFloatToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCE8]();
}

uint64_t BSSerializeCGSizeToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BCF8]();
}

uint64_t BSSerializeDoubleToXPCDictionaryWithKey()
{
  return MEMORY[0x24BE0BD08]();
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return MEMORY[0x24BDBF138]((__n128)size1, *(__n128 *)&size1.height, (__n128)size2, *(__n128 *)&size2.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

