uint64_t AnnotatedResult.displayString.getter(uint64_t a1, uint64_t a2)
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
  uint64_t v14;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 16) + 8))(v6);
  v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, a1);
  if (!v12)
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 8) + 8))(a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
  return v10;
}

uint64_t dispatch thunk of FormattedString.formattedString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AnnotatedResult.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AnnotatedResult.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t FavoritesItem.translation.getter(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  if (a1 >> 62 == 1)
    v1 = a1 & 0x3FFFFFFFFFFFFFFFLL;
  else
    v1 = 0;
  if (a1 >> 62)
    v2 = v1;
  else
    v2 = a1;
  v3 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
  return v2;
}

void FavoritesItem.hash(into:)(uint64_t a1, unint64_t a2)
{
  id v3;
  id v4;
  id v5;

  if (!(a2 >> 62))
  {
    v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
    sub_2493CA71C();
    v3 = objc_msgSend((id)a2, sel_identifier);
    goto LABEL_5;
  }
  if (a2 >> 62 == 1)
  {
    v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
    sub_2493CA71C();
    v3 = objc_msgSend(v5, sel_identifier);
LABEL_5:
    v4 = v3;
    sub_2493CA704();

    sub_2493CA71C();
    swift_bridgeObjectRelease();

    return;
  }
  sub_2493CA71C();
}

uint64_t FavoritesItem.hashValue.getter(unint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  sub_2493CA9F8();
  if (a1 >> 62)
  {
    if (a1 >> 62 == 1)
    {
      v2 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
      sub_2493CA71C();
      v3 = objc_msgSend(v2, sel_identifier);
      sub_2493CA704();

      sub_2493CA71C();
      swift_bridgeObjectRelease();

    }
    else
    {
      sub_2493CA71C();
    }
  }
  else
  {
    v4 = (id)a1;
    sub_2493CA71C();
    v5 = objc_msgSend(v4, sel_identifier);
    sub_2493CA704();

    sub_2493CA71C();
    swift_bridgeObjectRelease();

  }
  return sub_2493CAA10();
}

uint64_t sub_2493AFE68()
{
  unint64_t *v0;

  return FavoritesItem.hashValue.getter(*v0);
}

void sub_2493AFE70(uint64_t a1)
{
  unint64_t *v1;

  FavoritesItem.hash(into:)(a1, *v1);
}

uint64_t sub_2493AFE78()
{
  unint64_t *v0;
  unint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2493CA9F8();
  FavoritesItem.hash(into:)((uint64_t)v3, v1);
  return sub_2493CAA10();
}

uint64_t sub_2493AFEB8(unint64_t *a1, unint64_t *a2)
{
  return _s22TranslationPersistence13FavoritesItemO2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t _s22TranslationPersistence13FavoritesItemO2eeoiySbAC_ACtFZ_0(unint64_t a1, unint64_t a2)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!(a1 >> 62))
  {
    if (!(a2 >> 62))
    {
      v4 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
      v5 = (id)a2;
      v15 = objc_msgSend((id)a1, sel_identifier);
      v16 = sub_2493CA704();
      v18 = v17;

      v19 = objc_msgSend(v5, sel_identifier);
      v20 = sub_2493CA704();
      v22 = v21;

      if (v16 == v20 && v18 == v22)
        goto LABEL_6;
LABEL_12:
      v14 = sub_2493CA9A4();
      goto LABEL_13;
    }
LABEL_15:
    v14 = 0;
    return v14 & 1;
  }
  if (a1 >> 62 != 1)
  {
    v14 = a2 == 0x8000000000000000;
    return v14 & 1;
  }
  if (a2 >> 62 != 1)
    goto LABEL_15;
  v4 = (id)(a1 & 0x3FFFFFFFFFFFFFFFLL);
  v5 = (id)(a2 & 0x3FFFFFFFFFFFFFFFLL);
  v6 = objc_msgSend(v4, sel_identifier);
  v7 = sub_2493CA704();
  v9 = v8;

  v10 = objc_msgSend(v5, sel_identifier);
  v11 = sub_2493CA704();
  v13 = v12;

  if (v7 != v11 || v9 != v13)
    goto LABEL_12;
LABEL_6:
  v14 = 1;
LABEL_13:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14 & 1;
}

unint64_t sub_2493B0070()
{
  unint64_t result;

  result = qword_2578600B8;
  if (!qword_2578600B8)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for FavoritesItem, &type metadata for FavoritesItem);
    atomic_store(result, (unint64_t *)&qword_2578600B8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for FavoritesItem(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for FavoritesItem(_QWORD *a1)
{

}

uint64_t *assignWithCopy for FavoritesItem(uint64_t *a1, uint64_t *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  v4 = *a1;
  *a1 = *a2;
  v5 = (void *)(v4 & 0x3FFFFFFFFFFFFFFFLL);
  v6 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *assignWithTake for FavoritesItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for FavoritesItem(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for FavoritesItem(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_2493B0218(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_2493B0234(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_2493B0244(unint64_t *result, uint64_t a2)
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

ValueMetadata *type metadata accessor for FavoritesItem()
{
  return &type metadata for FavoritesItem;
}

const char *TranslationPersistenceFeatures.domain.getter()
{
  return "Translate";
}

const char *TranslationPersistenceFeatures.feature.getter()
{
  return "favorites_sync";
}

uint64_t TranslationPersistenceFeatures.isEnabled.getter()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for TranslationPersistenceFeatures;
  v4 = sub_2493B02F8();
  v0 = sub_2493CA6A4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

unint64_t sub_2493B02F8()
{
  unint64_t result;

  result = qword_2578600C0;
  if (!qword_2578600C0)
  {
    result = MEMORY[0x2495AF458]("Uih\bp.", &type metadata for TranslationPersistenceFeatures);
    atomic_store(result, (unint64_t *)&qword_2578600C0);
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

uint64_t static TranslationPersistenceFeatures.== infix(_:_:)()
{
  return 1;
}

uint64_t TranslationPersistenceFeatures.hash(into:)()
{
  return sub_2493CAA04();
}

uint64_t TranslationPersistenceFeatures.hashValue.getter()
{
  sub_2493CA9F8();
  sub_2493CAA04();
  return sub_2493CAA10();
}

uint64_t sub_2493B03C8()
{
  return 1;
}

uint64_t sub_2493B03D0()
{
  sub_2493CA9F8();
  sub_2493CAA04();
  return sub_2493CAA10();
}

uint64_t sub_2493B0410()
{
  return sub_2493CAA04();
}

uint64_t sub_2493B0434()
{
  sub_2493CA9F8();
  sub_2493CAA04();
  return sub_2493CAA10();
}

unint64_t sub_2493B0474()
{
  unint64_t result;

  result = qword_2578600C8;
  if (!qword_2578600C8)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for TranslationPersistenceFeatures, &type metadata for TranslationPersistenceFeatures);
    atomic_store(result, (unint64_t *)&qword_2578600C8);
  }
  return result;
}

const char *sub_2493B04B8()
{
  return "Translate";
}

const char *sub_2493B04CC()
{
  return "favorites_sync";
}

uint64_t getEnumTagSinglePayload for TranslationPersistenceFeatures(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TranslationPersistenceFeatures(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2493B0578 + 4 * asc_2493CB0E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2493B0598 + 4 * byte_2493CB0E5[v4]))();
}

_BYTE *sub_2493B0578(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2493B0598(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B05A0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B05A8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B05B0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B05B8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2493B05C4()
{
  return 0;
}

ValueMetadata *type metadata accessor for TranslationPersistenceFeatures()
{
  return &type metadata for TranslationPersistenceFeatures;
}

uint64_t sub_2493B05E0()
{
  uint64_t v0;

  v0 = sub_2493CA6C8();
  __swift_allocate_value_buffer(v0, qword_2578634C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2578634C0);
  return sub_2493CA6BC();
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

uint64_t sub_2493B06B8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  __int128 v5[2];

  sub_2493B0774(a1, (uint64_t)v5);
  v3 = *a2 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_2493B0818(v5, v3);
  return swift_endAccess();
}

uint64_t sub_2493B0724@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  return sub_2493B0774(v3, a1);
}

uint64_t sub_2493B0774(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2493B07B8(__int128 *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  __swift_destroy_boxed_opaque_existential_1(v3);
  sub_2493B0818(a1, v3);
  return swift_endAccess();
}

uint64_t sub_2493B0818(__int128 *a1, uint64_t a2)
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

uint64_t (*sub_2493B0830())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2493B0878()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1Tm(v0, v0[3]);
  return sub_2493CA6EC();
}

id AnySpeechResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AnySpeechResult.init(from:)(a1);
}

id AnySpeechResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v4;
  id v5;
  id v6;
  objc_super v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v4 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v5 = v1;
  v6 = v4;
  sub_2493CAA1C();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for AnySpeechResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm(v12, v12[3]);
    v10 = type metadata accessor for StoredSpeechResult();
    v11 = sub_2493B1980(&qword_2578600D8, 255, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)&protocol conformance descriptor for StoredSpeechResult);
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
    sub_2493B1980(&qword_2578600E0, 255, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)"}lh\bh-");
    sub_2493CA9B0();
    sub_2493B0818(&v9, (uint64_t)v5 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for AnySpeechResult();
    v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t type metadata accessor for AnySpeechResult()
{
  return objc_opt_self();
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

uint64_t sub_2493B0B14(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[40];
  _BYTE v5[24];
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493CAA34();
  v2 = v1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  sub_2493B0774(v2, (uint64_t)v4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  sub_2493B0C10();
  sub_2493CA9BC();
  sub_2493B0C54((uint64_t)v4);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
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

unint64_t sub_2493B0C10()
{
  unint64_t result;

  result = qword_2578600E8;
  if (!qword_2578600E8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB274, &type metadata for AnySpeechResult.AnySpeechResultBox);
    atomic_store(result, (unint64_t *)&qword_2578600E8);
  }
  return result;
}

uint64_t sub_2493B0C54(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return a1;
}

id AnySpeechResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AnySpeechResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AnySpeechResult.__deallocating_deinit()
{
  return sub_2493B14D4(type metadata accessor for AnySpeechResult);
}

id sub_2493B0D1C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for AnySpeechResult());
  result = AnySpeechResult.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2493B0D6C(_QWORD *a1)
{
  return sub_2493B0B14(a1);
}

uint64_t sub_2493B0D8C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
  swift_beginAccess();
  return sub_2493B0774(v3, a2);
}

uint64_t method lookup function for AnySpeechResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnySpeechResult.value.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of AnySpeechResult.value.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of AnySpeechResult.value.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AnySpeechResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of AnySpeechResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t sub_2493B0E88()
{
  uint64_t result;

  result = sub_2493CA6F8();
  qword_2578634D8 = result;
  return result;
}

uint64_t sub_2493B0EDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];

  sub_2493B18C0(a1, (uint64_t)v9);
  if (v9[3])
  {
    type metadata accessor for AnySpeechResult();
    result = swift_dynamicCast();
    if ((result & 1) != 0)
    {
      sub_2493CA53C();
      swift_allocObject();
      sub_2493CA530();
      v9[0] = v8;
      sub_2493B1980(&qword_257860158, v4, (uint64_t (*)(uint64_t))type metadata accessor for AnySpeechResult, (uint64_t)&protocol conformance descriptor for AnySpeechResult);
      v5 = sub_2493CA524();
      v7 = v6;
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BDCDDE8];

      result = swift_release();
      *(_QWORD *)a2 = v5;
      *(_QWORD *)(a2 + 8) = v7;
      return result;
    }
  }
  else
  {
    result = sub_2493B181C((uint64_t)v9);
  }
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_2493B1004@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  double result;
  uint64_t v9;
  unint64_t v10;
  _QWORD v11[4];

  sub_2493B18C0(a1, (uint64_t)v11);
  if (v11[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_2493CA518();
      swift_allocObject();
      sub_2493CA50C();
      *(_QWORD *)(a2 + 24) = type metadata accessor for AnySpeechResult();
      sub_2493B1980(&qword_257860148, v3, (uint64_t (*)(uint64_t))type metadata accessor for AnySpeechResult, (uint64_t)&protocol conformance descriptor for AnySpeechResult);
      sub_2493CA500();
      swift_release();
      sub_2493B193C(v9, v10);
      return result;
    }
  }
  else
  {
    sub_2493B181C((uint64_t)v11);
  }
  if (qword_2578600A0 != -1)
    swift_once();
  v4 = sub_2493CA6C8();
  __swift_project_value_buffer(v4, (uint64_t)qword_2578634C0);
  v5 = sub_2493CA6B0();
  v6 = sub_2493CA7AC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2493AE000, v5, v6, "No reversed data", v7, 2u);
    MEMORY[0x2495AF4D0](v7, -1, -1);
  }

  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

id sub_2493B1378(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD *__return_ptr, _OWORD *))
{
  id v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _OWORD v15[2];
  _QWORD v16[3];
  uint64_t v17;

  if (a3)
  {
    v6 = a1;
    swift_unknownObjectRetain();
    sub_2493CA848();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v15, 0, sizeof(v15));
    v7 = a1;
  }
  a4(v16, v15);

  sub_2493B181C((uint64_t)v15);
  v8 = v17;
  if (!v17)
    return 0;
  v9 = __swift_project_boxed_opaque_existential_1Tm(v16, v17);
  v10 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v9, v9);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v12);
  v13 = (void *)sub_2493CA998();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v8);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
  return v13;
}

id sub_2493B14C8()
{
  return sub_2493B14D4(type metadata accessor for SourceInputValueTransformer);
}

id sub_2493B14D4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SourceInputValueTransformer()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for AnySpeechResult.AnySpeechResultBox(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AnySpeechResult.AnySpeechResultBox(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

uint64_t initializeWithCopy for AnySpeechResult.AnySpeechResultBox(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for AnySpeechResult.AnySpeechResultBox(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AnySpeechResult.AnySpeechResultBox(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for AnySpeechResult.AnySpeechResultBox(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AnySpeechResult.AnySpeechResultBox(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AnySpeechResult.AnySpeechResultBox()
{
  return &type metadata for AnySpeechResult.AnySpeechResultBox;
}

uint64_t sub_2493B181C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860140);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495AF440]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2493B18C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1Tm(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x2495AF4D0);
  return result;
}

uint64_t sub_2493B193C(uint64_t a1, unint64_t a2)
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

uint64_t sub_2493B1980(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2495AF458](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2493B19C0()
{
  unint64_t result;

  result = qword_257860160;
  if (!qword_257860160)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257860160);
  }
  return result;
}

TranslationPersistence::SpeechResultOrigin_optional __swiftcall SpeechResultOrigin.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  TranslationPersistence::SpeechResultOrigin_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2493CA8E4();
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

uint64_t SpeechResultOrigin.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6563696F76;
  else
    return 1954047348;
}

uint64_t sub_2493B1A8C(char *a1, char *a2)
{
  return sub_2493B57D8(*a1, *a2);
}

unint64_t sub_2493B1A9C()
{
  unint64_t result;

  result = qword_257860168;
  if (!qword_257860168)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for SpeechResultOrigin, &type metadata for SpeechResultOrigin);
    atomic_store(result, (unint64_t *)&qword_257860168);
  }
  return result;
}

uint64_t sub_2493B1AE0()
{
  return sub_2493B5D78();
}

uint64_t sub_2493B1AE8()
{
  return sub_2493B62BC();
}

uint64_t sub_2493B1AF0()
{
  return sub_2493B6810();
}

TranslationPersistence::SpeechResultOrigin_optional sub_2493B1AF8(Swift::String *a1)
{
  return SpeechResultOrigin.init(rawValue:)(*a1);
}

uint64_t sub_2493B1B04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SpeechResultOrigin.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2493B1B28()
{
  sub_2493B1D94();
  return sub_2493CA74C();
}

uint64_t sub_2493B1B84()
{
  sub_2493B1D94();
  return sub_2493CA740();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of SpeechTokenAlternatives.text.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SpeechTokenBin.tokenAlternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SpeechSausage.tokenBins.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SpeechResultOrigin(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SpeechResultOrigin(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493B1CD8 + 4 * byte_2493CB2A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2493B1D0C + 4 * byte_2493CB2A0[v4]))();
}

uint64_t sub_2493B1D0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B1D14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493B1D1CLL);
  return result;
}

uint64_t sub_2493B1D28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493B1D30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2493B1D34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B1D3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B1D48(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2493B1D50(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SpeechResultOrigin()
{
  return &type metadata for SpeechResultOrigin;
}

uint64_t dispatch thunk of SpeechResult.isFinal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SpeechResult.sentenceConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SpeechResult.isEmpty()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SpeechResult.alternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SpeechResult.origin.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

unint64_t sub_2493B1D94()
{
  unint64_t result;
  int vars0;

  result = qword_257860170;
  if (!qword_257860170)
  {
    result = MEMORY[0x2495AF458]("%ih\b4.", vars0);
    atomic_store(result, (unint64_t *)&qword_257860170);
  }
  return result;
}

uint64_t sub_2493B1DE0(char a1)
{
  return *(_QWORD *)&aIslowconhasspa[8 * a1];
}

BOOL sub_2493B1E00(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2493B1E14()
{
  sub_2493CA9F8();
  sub_2493CAA04();
  return sub_2493CAA10();
}

uint64_t sub_2493B1E58()
{
  return sub_2493CAA04();
}

uint64_t sub_2493B1E80()
{
  sub_2493CA9F8();
  sub_2493CAA04();
  return sub_2493CAA10();
}

uint64_t sub_2493B1EC0()
{
  char *v0;

  return sub_2493B1DE0(*v0);
}

uint64_t sub_2493B1EC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2493B43B0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2493B1EEC()
{
  return 0;
}

void sub_2493B1EF8(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_2493B1F04()
{
  sub_2493B5244();
  return sub_2493CAA4C();
}

uint64_t sub_2493B1F2C()
{
  sub_2493B5244();
  return sub_2493CAA58();
}

uint64_t sub_2493B1F54(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;
  char v15;

  v12[0] = a3;
  v12[1] = a4;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860350);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B5244();
  sub_2493CAA40();
  v15 = 0;
  sub_2493CA968();
  if (!v4)
  {
    v14 = 1;
    sub_2493CA968();
    v13 = 2;
    sub_2493CA95C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_2493B20AC()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_2493B20B4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_2493B20BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B20E8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  result = sub_2493B4514(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(_BYTE *)(a2 + 1) = BYTE1(result) & 1;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_2493B2120(_QWORD *a1)
{
  unsigned __int8 *v1;
  int v2;

  if (v1[1])
    v2 = 256;
  else
    v2 = 0;
  return sub_2493B1F54(a1, v2 | *v1, *((_QWORD *)v1 + 1), *((_QWORD *)v1 + 2));
}

uint64_t sub_2493B2150(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000011;
  else
    return 0x65746C4174736562;
}

uint64_t sub_2493B2198(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860310);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B4DD0();
  sub_2493CAA40();
  v14 = 0;
  sub_2493CA974();
  if (!v3)
  {
    v12[1] = a3;
    v13 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578602F8);
    sub_2493B4E58(&qword_257860318, &qword_2578602F8, (uint64_t (*)(void))sub_2493B4EBC, MEMORY[0x24BEE12A0]);
    sub_2493CA980();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

uint64_t sub_2493B22F8(char *a1, char *a2)
{
  return sub_2493B54C8(*a1, *a2);
}

uint64_t sub_2493B2304()
{
  return sub_2493B5DEC();
}

uint64_t sub_2493B230C()
{
  return sub_2493B613C();
}

uint64_t sub_2493B2314()
{
  return sub_2493B69C4();
}

uint64_t sub_2493B231C@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2493CA8E4();
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

uint64_t sub_2493B2378@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2493B2150(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2493B23A0()
{
  char *v0;

  return sub_2493B2150(*v0);
}

uint64_t sub_2493B23A8@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2493CA8E4();
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

void sub_2493B2408(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2493B2414()
{
  sub_2493B4DD0();
  return sub_2493CAA4C();
}

uint64_t sub_2493B243C()
{
  sub_2493B4DD0();
  return sub_2493CAA58();
}

uint64_t sub_2493B2464()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_2493B246C()
{
  uint64_t v0;

  return sub_2493B6A50(*(_QWORD *)(v0 + 8));
}

uint64_t sub_2493B2474@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_2493B46A0(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_2493B249C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_2493B2198(a1, *v1, v1[1]);
}

uint64_t sub_2493B24B4(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578602B8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B49E4();
  sub_2493CAA40();
  v10[1] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578602A0);
  sub_2493B4E58(&qword_2578602C0, &qword_2578602A0, (uint64_t (*)(void))sub_2493B4AB0, MEMORY[0x24BEE12A0]);
  sub_2493CA980();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t sub_2493B25E8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2493CA8E4();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2493B2638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2493B4834();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2493B2660@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2493CA8E4();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_2493B26B4(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2493B26C0()
{
  sub_2493B49E4();
  return sub_2493CAA4C();
}

uint64_t sub_2493B26E8()
{
  sub_2493B49E4();
  return sub_2493CAA58();
}

uint64_t sub_2493B2710()
{
  uint64_t *v0;

  return sub_2493B6B58(*v0);
}

_QWORD *sub_2493B2718@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  _QWORD *result;

  result = sub_2493B4850(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2493B2740(_QWORD *a1)
{
  uint64_t *v1;

  return sub_2493B24B4(a1, *v1);
}

uint64_t StoredSpeechResult.isFinal.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t StoredSpeechResult.isFinal.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*StoredSpeechResult.isFinal.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.sentenceConfidence.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t StoredSpeechResult.sentenceConfidence.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 8) = result;
  return result;
}

uint64_t (*StoredSpeechResult.sentenceConfidence.modify())()
{
  return nullsub_1;
}

uint64_t StoredSpeechResult.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 24);
  v4 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for StoredSpeechResult()
{
  uint64_t result;

  result = qword_257860228;
  if (!qword_257860228)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t StoredSpeechResult.locale.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 24);
  v4 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*StoredSpeechResult.locale.modify())()
{
  type metadata accessor for StoredSpeechResult();
  return nullsub_1;
}

uint64_t StoredSpeechResult.isLowConfidence.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 28));
}

uint64_t StoredSpeechResult.isLowConfidence.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for StoredSpeechResult();
  *(_BYTE *)(v1 + *(int *)(result + 28)) = a1;
  return result;
}

uint64_t (*StoredSpeechResult.isLowConfidence.modify())()
{
  type metadata accessor for StoredSpeechResult();
  return nullsub_1;
}

uint64_t StoredSpeechResult.sanitizedFormattedString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredSpeechResult.sanitizedFormattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for StoredSpeechResult() + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoredSpeechResult.sanitizedFormattedString.modify())()
{
  type metadata accessor for StoredSpeechResult();
  return nullsub_1;
}

uint64_t StoredSpeechResult.formattedString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for StoredSpeechResult() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredSpeechResult.formattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for StoredSpeechResult() + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*StoredSpeechResult.formattedString.modify())()
{
  type metadata accessor for StoredSpeechResult();
  return nullsub_1;
}

uint64_t StoredSpeechResult.origin.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for StoredSpeechResult();
  *a1 = *(_BYTE *)(v1 + *(int *)(result + 40));
  return result;
}

uint64_t StoredSpeechResult.origin.setter(char *a1)
{
  uint64_t v1;
  char v2;
  uint64_t result;

  v2 = *a1;
  result = type metadata accessor for StoredSpeechResult();
  *(_BYTE *)(v1 + *(int *)(result + 40)) = v2;
  return result;
}

uint64_t (*StoredSpeechResult.origin.modify())()
{
  type metadata accessor for StoredSpeechResult();
  return nullsub_1;
}

uint64_t StoredSpeechResult.alternatives.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + *(int *)(type metadata accessor for StoredSpeechResult() + 44));
  if (v3)
  {
    *(_QWORD *)(a1 + 24) = &type metadata for StoredSpeechSausage;
    *(_QWORD *)(a1 + 32) = sub_2493B2B30();
    *(_QWORD *)a1 = v3;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return swift_bridgeObjectRetain();
}

unint64_t sub_2493B2B30()
{
  unint64_t result;

  result = qword_257860178;
  if (!qword_257860178)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB754, &type metadata for StoredSpeechSausage);
    atomic_store(result, (unint64_t *)&qword_257860178);
  }
  return result;
}

uint64_t StoredSpeechResult.init(text:sanitizedText:locale:origin:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X5>, uint64_t a7@<X8>)
{
  char v13;
  int *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;

  v13 = *a6;
  v14 = (int *)type metadata accessor for StoredSpeechResult();
  v15 = (_QWORD *)(a7 + v14[8]);
  *(_QWORD *)(a7 + v14[11]) = 0;
  *(_BYTE *)a7 = 1;
  *(_QWORD *)(a7 + 8) = 1000;
  v16 = a7 + v14[6];
  v17 = sub_2493CA698();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v16, a5, v17);
  *(_BYTE *)(a7 + v14[7]) = 0;
  v19 = (_QWORD *)(a7 + v14[9]);
  *v19 = a1;
  v19[1] = a2;
  *v15 = a3;
  v15[1] = a4;
  *(_BYTE *)(a7 + v14[10]) = v13;
  return result;
}

Swift::Bool __swiftcall StoredSpeechResult.isEmpty()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  v2 = type metadata accessor for StoredSpeechResult();
  v4 = MEMORY[0x24BDAC7A8](v2, v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (uint64_t *)(v1 + *(int *)(v4 + 32));
  v9 = *v7;
  v8 = v7[1];
  sub_2493B3884(v1, (uint64_t)v6);
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = &v6[*(int *)(v2 + 36)];
    v9 = *(_QWORD *)v11;
    v10 = *((_QWORD *)v11 + 1);
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRetain();
  sub_2493B38C8((uint64_t)v6);
  swift_bridgeObjectRelease();
  v12 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v12 = v9 & 0xFFFFFFFFFFFFLL;
  return v12 == 0;
}

uint64_t sub_2493B2D0C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B2D44 + 4 * byte_2493CB410[a1]))(0xD000000000000012, 0x80000002493CC860);
}

uint64_t sub_2493B2D44()
{
  return 0x6C616E69467369;
}

uint64_t sub_2493B2D5C()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_2493B2D70()
{
  return 0x6E6F43776F4C7369;
}

uint64_t sub_2493B2D94(uint64_t a1)
{
  return a1 + 6;
}

uint64_t sub_2493B2DAC()
{
  return 0x657474616D726F66;
}

uint64_t sub_2493B2DD0()
{
  return 0x74616E7265746C61;
}

uint64_t sub_2493B2DF0()
{
  return 0x6E696769726FLL;
}

uint64_t sub_2493B2E04(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B2E3C + 4 * byte_2493CB418[a1]))(0xD000000000000012, 0x80000002493CC860);
}

uint64_t sub_2493B2E3C()
{
  return 0x6C616E69467369;
}

uint64_t sub_2493B2E54()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_2493B2E68()
{
  return 0x6E6F43776F4C7369;
}

uint64_t sub_2493B2E8C(uint64_t a1)
{
  return a1 + 6;
}

uint64_t sub_2493B2EA4()
{
  return 0x657474616D726F66;
}

uint64_t sub_2493B2EC8()
{
  return 0x74616E7265746C61;
}

uint64_t sub_2493B2EE8()
{
  return 0x6E696769726FLL;
}

void sub_2493B2EFC(char *a1)
{
  sub_2493B5578(*a1);
}

void sub_2493B2F08()
{
  char *v0;

  sub_2493B6880(0, *v0);
}

void sub_2493B2F14(uint64_t a1)
{
  char *v1;

  sub_2493B61A4(a1, *v1);
}

void sub_2493B2F1C(uint64_t a1)
{
  char *v1;

  sub_2493B6880(a1, *v1);
}

uint64_t sub_2493B2F24@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493B499C();
  *a1 = result;
  return result;
}

uint64_t sub_2493B2F50@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2493B2D0C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2493B2F78()
{
  unsigned __int8 *v0;

  return sub_2493B2E04(*v0);
}

uint64_t sub_2493B2F80@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493B499C();
  *a1 = result;
  return result;
}

void sub_2493B2FA4(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_2493B2FB0()
{
  sub_2493B3904();
  return sub_2493CAA4C();
}

uint64_t sub_2493B2FD8()
{
  sub_2493B3904();
  return sub_2493CAA58();
}

uint64_t StoredSpeechResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;

  v31 = a2;
  v37 = sub_2493CA698();
  v33 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37, v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860180);
  v7 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32, v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for StoredSpeechResult();
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v15[*(int *)(v13 + 32)];
  *(_QWORD *)v16 = 0;
  *((_QWORD *)v16 + 1) = 0;
  v34 = (uint64_t *)v16;
  v17 = (int *)v13;
  v35 = *(int *)(v13 + 44);
  v36 = a1;
  *(_QWORD *)&v15[v35] = 0;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B3904();
  sub_2493CAA28();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    v30 = v7;
    LOBYTE(v39) = 0;
    *v15 = sub_2493CA920() & 1;
    LOBYTE(v39) = 1;
    v18 = sub_2493CA92C();
    v19 = v37;
    *((_QWORD *)v15 + 1) = v18;
    LOBYTE(v39) = 2;
    sub_2493B3A94(&qword_257860190, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
    sub_2493CA938();
    (*(void (**)(char *, char *, uint64_t))(v33 + 32))(&v15[v17[6]], v6, v19);
    LOBYTE(v39) = 3;
    v15[v17[7]] = sub_2493CA920() & 1;
    LOBYTE(v39) = 4;
    v20 = sub_2493CA8F0();
    v22 = v35;
    v21 = (uint64_t)v36;
    v23 = v34;
    *v34 = v20;
    v23[1] = v24;
    LOBYTE(v39) = 5;
    v25 = sub_2493CA914();
    v26 = (uint64_t *)&v15[v17[9]];
    *v26 = v25;
    v26[1] = v27;
    v38 = 6;
    sub_2493B3948();
    sub_2493CA908();
    *(_QWORD *)&v15[v22] = v39;
    v38 = 7;
    sub_2493B398C();
    sub_2493CA908();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v32);
    v15[v17[10]] = v39 & 1;
    sub_2493B3884((uint64_t)v15, v31);
    __swift_destroy_boxed_opaque_existential_1(v21);
    return sub_2493B38C8((uint64_t)v15);
  }
}

uint64_t StoredSpeechResult.encode(to:)(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578601A8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B3904();
  sub_2493CAA40();
  LOBYTE(v13) = 0;
  sub_2493CA968();
  if (!v2)
  {
    LOBYTE(v13) = 1;
    sub_2493CA974();
    v10 = type metadata accessor for StoredSpeechResult();
    LOBYTE(v13) = 2;
    sub_2493CA698();
    sub_2493B3A94(&qword_2578601B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
    sub_2493CA980();
    LOBYTE(v13) = 3;
    sub_2493CA968();
    LOBYTE(v13) = 4;
    sub_2493CA944();
    LOBYTE(v13) = 5;
    sub_2493CA95C();
    v13 = *(_QWORD *)(v3 + *(int *)(v10 + 44));
    HIBYTE(v12) = 6;
    sub_2493B39D0();
    sub_2493CA950();
    LOBYTE(v13) = *(_BYTE *)(v3 + *(int *)(v10 + 40));
    HIBYTE(v12) = 7;
    sub_2493B3A14();
    sub_2493CA980();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

uint64_t sub_2493B3730()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t sub_2493B373C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(_QWORD *)(v2 + *(int *)(a1 + 44));
  if (v4)
  {
    *(_QWORD *)(a2 + 24) = &type metadata for StoredSpeechSausage;
    *(_QWORD *)(a2 + 32) = sub_2493B2B30();
    *(_QWORD *)a2 = v4;
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_2493B3798@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_BYTE *)(v2 + *(int *)(result + 40));
  return result;
}

uint64_t sub_2493B37A8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return StoredSpeechResult.init(from:)(a1, a2);
}

uint64_t sub_2493B37BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 24);
  v5 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_2493B37FC(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 28));
}

uint64_t sub_2493B3808(_QWORD *a1)
{
  return StoredSpeechResult.encode(to:)(a1);
}

uint64_t sub_2493B381C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2493B3850(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 36));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_2493B3884(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StoredSpeechResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2493B38C8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StoredSpeechResult();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2493B3904()
{
  unint64_t result;

  result = qword_257860188;
  if (!qword_257860188)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB704, &type metadata for StoredSpeechResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860188);
  }
  return result;
}

unint64_t sub_2493B3948()
{
  unint64_t result;

  result = qword_257860198;
  if (!qword_257860198)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB6DC, &type metadata for StoredSpeechSausage);
    atomic_store(result, (unint64_t *)&qword_257860198);
  }
  return result;
}

unint64_t sub_2493B398C()
{
  unint64_t result;

  result = qword_2578601A0;
  if (!qword_2578601A0)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for SpeechResultOrigin, &type metadata for SpeechResultOrigin);
    atomic_store(result, (unint64_t *)&qword_2578601A0);
  }
  return result;
}

unint64_t sub_2493B39D0()
{
  unint64_t result;

  result = qword_2578601B8;
  if (!qword_2578601B8)
  {
    result = MEMORY[0x2495AF458]("Ejh\b\\+", &type metadata for StoredSpeechSausage);
    atomic_store(result, (unint64_t *)&qword_2578601B8);
  }
  return result;
}

unint64_t sub_2493B3A14()
{
  unint64_t result;

  result = qword_2578601C0;
  if (!qword_2578601C0)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for SpeechResultOrigin, &type metadata for SpeechResultOrigin);
    atomic_store(result, (unint64_t *)&qword_2578601C0);
  }
  return result;
}

uint64_t sub_2493B3A58(uint64_t a1)
{
  uint64_t result;

  result = sub_2493B3A94(&qword_2578601C8, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)"]lh\b0-");
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2493B3A94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495AF458](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for StoredSpeechResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    a1[1] = a2[1];
    v7 = a3[6];
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_2493CA698();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[8];
    *((_BYTE *)v4 + a3[7]) = *((_BYTE *)a2 + a3[7]);
    v12 = (_QWORD *)((char *)v4 + v11);
    v13 = (_QWORD *)((char *)a2 + v11);
    v14 = v13[1];
    *v12 = *v13;
    v12[1] = v14;
    v15 = a3[9];
    v16 = a3[10];
    v17 = (_QWORD *)((char *)v4 + v15);
    v18 = (_QWORD *)((char *)a2 + v15);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    *((_BYTE *)v4 + v16) = *((_BYTE *)a2 + v16);
    *(_QWORD *)((char *)v4 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for StoredSpeechResult(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 24);
  v3 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  v14 = a3[9];
  v15 = a3[10];
  v16 = (_QWORD *)(a1 + v14);
  v17 = (_QWORD *)(a2 + v14);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  *(_BYTE *)(a1 + v15) = *(_BYTE *)(a2 + v15);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v10 = a3[8];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[9];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  *(_OWORD *)(a1 + v10) = *(_OWORD *)(a2 + v10);
  v11 = a3[10];
  *(_OWORD *)(a1 + a3[9]) = *(_OWORD *)(a2 + a3[9]);
  *(_BYTE *)(a1 + v11) = *(_BYTE *)(a2 + v11);
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  return a1;
}

uint64_t assignWithTake for StoredSpeechResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v6 = a3[6];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[8];
  *(_BYTE *)(a1 + a3[7]) = *(_BYTE *)(a2 + a3[7]);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v14 = *v12;
  v13 = v12[1];
  *v11 = v14;
  v11[1] = v13;
  swift_bridgeObjectRelease();
  v15 = a3[9];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (uint64_t *)(a2 + v15);
  v19 = *v17;
  v18 = v17[1];
  *v16 = v19;
  v16[1] = v18;
  swift_bridgeObjectRelease();
  v20 = a3[11];
  *(_BYTE *)(a1 + a3[10]) = *(_BYTE *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v20) = *(_QWORD *)(a2 + v20);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2493B3F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2493CA698();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 36) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredSpeechResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2493B4020(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2493CA698();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 36) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_2493B40A0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2493CA698();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredSpeechResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredSpeechResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493B421C + 4 * byte_2493CB425[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_2493B4250 + 4 * byte_2493CB420[v4]))();
}

uint64_t sub_2493B4250(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B4258(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493B4260);
  return result;
}

uint64_t sub_2493B426C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493B4274);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_2493B4278(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B4280(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2493B428C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechResult.CodingKeys()
{
  return &type metadata for StoredSpeechResult.CodingKeys;
}

ValueMetadata *type metadata accessor for StoredSpeechSausage()
{
  return &type metadata for StoredSpeechSausage;
}

unint64_t sub_2493B42B8()
{
  unint64_t result;

  result = qword_257860278;
  if (!qword_257860278)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB68C, &type metadata for StoredSpeechResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860278);
  }
  return result;
}

unint64_t sub_2493B4300()
{
  unint64_t result;

  result = qword_257860280;
  if (!qword_257860280)
  {
    result = MEMORY[0x2495AF458]("Ukh\b0,", &type metadata for StoredSpeechResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860280);
  }
  return result;
}

unint64_t sub_2493B4348()
{
  unint64_t result;

  result = qword_257860288;
  if (!qword_257860288)
  {
    result = MEMORY[0x2495AF458]("=kh\b\b,", &type metadata for StoredSpeechResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860288);
  }
  return result;
}

unint64_t sub_2493B438C(uint64_t a1)
{
  unint64_t result;

  result = sub_2493B39D0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2493B43B0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6E6F43776F4C7369 && a2 == 0xEF65636E65646966;
  if (v3 || (sub_2493CA9A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6563617053736168 && a2 == 0xED00007265746641 || (sub_2493CA9A4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1954047348 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2493CA9A4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2493B4514(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  char v9;
  int v11;
  uint64_t v12;
  char v13;
  char v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860340);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B5244();
  sub_2493CAA28();
  if (v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v15 = 0;
  v8 = sub_2493CA920();
  v14 = 1;
  v9 = sub_2493CA920();
  v13 = 2;
  sub_2493CA914();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  if ((v9 & 1) != 0)
    v11 = 256;
  else
    v11 = 0;
  return v11 & 0xFFFFFFFE | v8 & 1;
}

uint64_t sub_2493B46A0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  _BYTE v10[32];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578602E8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = a1[3];
  __swift_project_boxed_opaque_existential_1Tm(a1, v8);
  sub_2493B4DD0();
  sub_2493CAA28();
  if (!v1)
  {
    v10[31] = 0;
    v8 = sub_2493CA92C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578602F8);
    v10[15] = 1;
    sub_2493B4E58(&qword_257860300, &qword_2578602F8, (uint64_t (*)(void))sub_2493B4E14, MEMORY[0x24BEE12D0]);
    sub_2493CA938();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v7, v3);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v8;
}

uint64_t sub_2493B4834()
{
  return 0x6E69426E656B6F74;
}

_QWORD *sub_2493B4850(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  _QWORD v10[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860290);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B49E4();
  sub_2493CAA28();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578602A0);
    sub_2493B4E58(&qword_2578602A8, &qword_2578602A0, (uint64_t (*)(void))sub_2493B4A6C, MEMORY[0x24BEE12D0]);
    sub_2493CA938();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    v8 = (_QWORD *)v10[1];
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v8;
}

uint64_t sub_2493B499C()
{
  unint64_t v0;

  v0 = sub_2493CA8E4();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

unint64_t sub_2493B49E4()
{
  unint64_t result;

  result = qword_257860298;
  if (!qword_257860298)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB8C8, &type metadata for StoredSpeechSausage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860298);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495AF44C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2493B4A6C()
{
  unint64_t result;

  result = qword_2578602B0;
  if (!qword_2578602B0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB8A0, &type metadata for StoredSpeechTokenBin);
    atomic_store(result, (unint64_t *)&qword_2578602B0);
  }
  return result;
}

unint64_t sub_2493B4AB0()
{
  unint64_t result;

  result = qword_2578602C8;
  if (!qword_2578602C8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB878, &type metadata for StoredSpeechTokenBin);
    atomic_store(result, (unint64_t *)&qword_2578602C8);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for StoredSpeechSausage.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2493B4B34 + 4 * byte_2493CB42A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2493B4B54 + 4 * byte_2493CB42F[v4]))();
}

_BYTE *sub_2493B4B34(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2493B4B54(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B4B5C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B4B64(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B4B6C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B4B74(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechSausage.CodingKeys()
{
  return &type metadata for StoredSpeechSausage.CodingKeys;
}

_QWORD *initializeBufferWithCopyOfBuffer for StoredSpeechTokenBin(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for StoredSpeechTokenBin()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for StoredSpeechTokenBin(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for StoredSpeechTokenBin(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenBin(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenBin(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for StoredSpeechTokenBin()
{
  return &type metadata for StoredSpeechTokenBin;
}

unint64_t sub_2493B4CD8()
{
  unint64_t result;

  result = qword_2578602D0;
  if (!qword_2578602D0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB850, &type metadata for StoredSpeechSausage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578602D0);
  }
  return result;
}

unint64_t sub_2493B4D20()
{
  unint64_t result;

  result = qword_2578602D8;
  if (!qword_2578602D8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB788, &type metadata for StoredSpeechSausage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578602D8);
  }
  return result;
}

unint64_t sub_2493B4D68()
{
  unint64_t result;

  result = qword_2578602E0;
  if (!qword_2578602E0)
  {
    result = MEMORY[0x2495AF458]("yih\b|*", &type metadata for StoredSpeechSausage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578602E0);
  }
  return result;
}

unint64_t sub_2493B4DAC(uint64_t a1)
{
  unint64_t result;

  result = sub_2493B4AB0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2493B4DD0()
{
  unint64_t result;

  result = qword_2578602F0;
  if (!qword_2578602F0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBAA0, &type metadata for StoredSpeechTokenBin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578602F0);
  }
  return result;
}

unint64_t sub_2493B4E14()
{
  unint64_t result;

  result = qword_257860308;
  if (!qword_257860308)
  {
    result = MEMORY[0x2495AF458]("ifh\b\b(", &type metadata for StoredSpeechTokenAlternatives);
    atomic_store(result, (unint64_t *)&qword_257860308);
  }
  return result;
}

uint64_t sub_2493B4E58(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3();
    result = MEMORY[0x2495AF458](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2493B4EBC()
{
  unint64_t result;

  result = qword_257860320;
  if (!qword_257860320)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBA50, &type metadata for StoredSpeechTokenAlternatives);
    atomic_store(result, (unint64_t *)&qword_257860320);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenBin.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493B4F4C + 4 * byte_2493CB439[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2493B4F80 + 4 * byte_2493CB434[v4]))();
}

uint64_t sub_2493B4F80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B4F88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493B4F90);
  return result;
}

uint64_t sub_2493B4F9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493B4FA4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2493B4FA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B4FB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechTokenBin.CodingKeys()
{
  return &type metadata for StoredSpeechTokenBin.CodingKeys;
}

uint64_t destroy for StoredSpeechTokenAlternatives()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22TranslationPersistence29StoredSpeechTokenAlternativesVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_WORD *)a1 = *(_WORD *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredSpeechTokenAlternatives(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for StoredSpeechTokenAlternatives(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_BYTE *)(a1 + 1) = *(_BYTE *)(a2 + 1);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenAlternatives(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenAlternatives(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechTokenAlternatives()
{
  return &type metadata for StoredSpeechTokenAlternatives;
}

unint64_t sub_2493B514C()
{
  unint64_t result;

  result = qword_257860328;
  if (!qword_257860328)
  {
    result = MEMORY[0x2495AF458]("Ygh\b<(", &type metadata for StoredSpeechTokenBin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860328);
  }
  return result;
}

unint64_t sub_2493B5194()
{
  unint64_t result;

  result = qword_257860330;
  if (!qword_257860330)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB960, &type metadata for StoredSpeechTokenBin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860330);
  }
  return result;
}

unint64_t sub_2493B51DC()
{
  unint64_t result;

  result = qword_257860338;
  if (!qword_257860338)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB988, &type metadata for StoredSpeechTokenBin.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860338);
  }
  return result;
}

unint64_t sub_2493B5220(uint64_t a1)
{
  unint64_t result;

  result = sub_2493B4EBC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2493B5244()
{
  unint64_t result;

  result = qword_257860348;
  if (!qword_257860348)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBBC4, &type metadata for StoredSpeechTokenAlternatives.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860348);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredSpeechTokenAlternatives.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StoredSpeechTokenAlternatives.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493B5364 + 4 * byte_2493CB443[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2493B5398 + 4 * byte_2493CB43E[v4]))();
}

uint64_t sub_2493B5398(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B53A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493B53A8);
  return result;
}

uint64_t sub_2493B53B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493B53BCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2493B53C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B53C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoredSpeechTokenAlternatives.CodingKeys()
{
  return &type metadata for StoredSpeechTokenAlternatives.CodingKeys;
}

unint64_t sub_2493B53E8()
{
  unint64_t result;

  result = qword_257860358;
  if (!qword_257860358)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBB9C, &type metadata for StoredSpeechTokenAlternatives.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860358);
  }
  return result;
}

unint64_t sub_2493B5430()
{
  unint64_t result;

  result = qword_257860360;
  if (!qword_257860360)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBB0C, &type metadata for StoredSpeechTokenAlternatives.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860360);
  }
  return result;
}

unint64_t sub_2493B5478()
{
  unint64_t result;

  result = qword_257860368;
  if (!qword_257860368)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBB34, &type metadata for StoredSpeechTokenAlternatives.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860368);
  }
  return result;
}

uint64_t sub_2493B54C8(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000011;
  else
    v3 = 0x65746C4174736562;
  if (v2)
    v4 = 0xEF65766974616E72;
  else
    v4 = 0x80000002493CC830;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000011;
  else
    v5 = 0x65746C4174736562;
  if ((a2 & 1) != 0)
    v6 = 0x80000002493CC830;
  else
    v6 = 0xEF65766974616E72;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_2493B5578(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2493B55C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2493B56A0 + 4 * byte_2493CBC58[a2]))(0x6C616E69467369);
}

uint64_t sub_2493B56A0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6C616E69467369 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2493B57D8(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6563696F76;
  else
    v3 = 1954047348;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x6563696F76;
  else
    v5 = 1954047348;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_2493B586C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2493B58B8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2493B5924 + 4 * byte_2493CBC64[a2]))(0x656C61636F6CLL);
}

uint64_t sub_2493B5924(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656C61636F6CLL && v1 == 0xE600000000000000)
    v2 = 1;
  else
    v2 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2493B59D4(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2493B5A20(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2493B5AB4 + 4 * byte_2493CBC6E[a2]))(0x444965736E6573);
}

uint64_t sub_2493B5AB4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x444965736E6573 && v1 == 0xE700000000000000)
    v2 = 1;
  else
    v2 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_2493B5BA8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2493B5BF4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2493B5C94 + 4 * byte_2493CBC79[a2]))(0x6E6F43776F4C7369);
}

uint64_t sub_2493B5C94(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6E6F43776F4C7369 && v1 == 0xEF65636E65646966)
    v2 = 1;
  else
    v2 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_2493B5D78()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

uint64_t sub_2493B5DEC()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B5E7C(char a1)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B5ED0()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B5F70(char a1)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B5FC4()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B6070(char a1)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B60C4()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

uint64_t sub_2493B613C()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

void sub_2493B61A4(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2493B61E8()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2493B62BC()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

void sub_2493B6308(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2493B634C()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

void sub_2493B63B0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2493B63F4()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

void sub_2493B6480(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_2493B64C4()
{
  sub_2493CA71C();
  return swift_bridgeObjectRelease();
}

void sub_2493B655C(uint64_t a1, char a2)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B65AC()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B6658(uint64_t a1, char a2)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B66A8()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B6748(uint64_t a1, char a2)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B6798()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

uint64_t sub_2493B6810()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

void sub_2493B6880(uint64_t a1, char a2)
{
  sub_2493CA9F8();
  __asm { BR              X10 }
}

uint64_t sub_2493B68D4()
{
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

uint64_t sub_2493B69C4()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  swift_bridgeObjectRelease();
  return sub_2493CAA10();
}

uint64_t sub_2493B6A50(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  uint64_t v13;
  ValueMetadata *v14;
  unint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v16 = MEMORY[0x24BEE4AF8];
    sub_2493BA648(0, v1, 0);
    v2 = v16;
    v4 = (char *)(a1 + 32);
    do
    {
      v5 = *v4;
      v6 = v4[1];
      v8 = *((_QWORD *)v4 + 1);
      v7 = *((_QWORD *)v4 + 2);
      v16 = v2;
      v9 = *(_QWORD *)(v2 + 16);
      v10 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_2493BA648(v10 > 1, v9 + 1, 1);
        v2 = v16;
      }
      v4 += 24;
      v14 = &type metadata for StoredSpeechTokenAlternatives;
      v15 = sub_2493BB44C();
      LOBYTE(v12) = v5;
      BYTE1(v12) = v6;
      *((_QWORD *)&v12 + 1) = v8;
      v13 = v7;
      *(_QWORD *)(v2 + 16) = v9 + 1;
      sub_2493B0818(&v12, v2 + 40 * v9 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2493B6B58(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v10;
  ValueMetadata *v11;
  unint64_t v12;
  uint64_t v13;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_2493BA674(0, v1, 0);
    v2 = v13;
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v6 = *(v4 - 1);
      v5 = *v4;
      v13 = v2;
      v7 = *(_QWORD *)(v2 + 16);
      v8 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v7 >= v8 >> 1)
      {
        sub_2493BA674(v8 > 1, v7 + 1, 1);
        v2 = v13;
      }
      v11 = &type metadata for StoredSpeechTokenBin;
      v12 = sub_2493BA6A0();
      *(_QWORD *)&v10 = v6;
      *((_QWORD *)&v10 + 1) = v5;
      *(_QWORD *)(v2 + 16) = v7 + 1;
      sub_2493B0818(&v10, v2 + 40 * v7 + 32);
      v4 += 2;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2493B6C50(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  __int128 v20;
  ValueMetadata *v21;
  unint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v23 = MEMORY[0x24BEE4AF8];
    sub_2493BA6E4(0, v1, 0);
    v2 = v23;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 2);
      v6 = *v4;
      v17 = *(v4 - 1);
      v18 = *(v4 - 3);
      v7 = v4[2];
      v8 = v4[4];
      v15 = v4[3];
      v16 = v4[1];
      v9 = v4[5];
      v14 = *((_BYTE *)v4 + 48);
      v10 = *(_QWORD *)(v2 + 16);
      v11 = *(_QWORD *)(v2 + 24);
      v19 = v10 + 1;
      v23 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v10 >= v11 >> 1)
      {
        sub_2493BA6E4(v11 > 1, v19, 1);
        v2 = v23;
      }
      v4 += 10;
      v21 = &type metadata for StoredTranslationSense;
      v22 = sub_2493BB190();
      v12 = swift_allocObject();
      *(_QWORD *)&v20 = v12;
      *(_QWORD *)(v12 + 16) = v18;
      *(_QWORD *)(v12 + 24) = v5;
      *(_QWORD *)(v12 + 32) = v17;
      *(_QWORD *)(v12 + 40) = v6;
      *(_QWORD *)(v12 + 48) = v16;
      *(_QWORD *)(v12 + 56) = v7;
      *(_QWORD *)(v12 + 64) = v15;
      *(_QWORD *)(v12 + 72) = v8;
      *(_QWORD *)(v12 + 80) = v9;
      *(_BYTE *)(v12 + 88) = v14;
      *(_QWORD *)(v2 + 16) = v19;
      sub_2493B0818(&v20, v2 + 40 * v10 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2493B6DD0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  ValueMetadata *v18;
  unint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v20 = MEMORY[0x24BEE4AF8];
    sub_2493BA710(0, v1, 0);
    v2 = v20;
    v4 = (_QWORD *)(a1 + 88);
    do
    {
      v16 = *((_BYTE *)v4 - 56);
      v5 = *(v4 - 5);
      v6 = *(v4 - 3);
      v14 = *(v4 - 4);
      v15 = *(v4 - 6);
      v7 = *(v4 - 1);
      v13 = *(v4 - 2);
      v8 = *v4;
      v9 = *(_QWORD *)(v2 + 16);
      v10 = *(_QWORD *)(v2 + 24);
      v20 = v2;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v9 >= v10 >> 1)
      {
        sub_2493BA710(v10 > 1, v9 + 1, 1);
        v2 = v20;
      }
      v18 = &type metadata for StoredTranslationAlternative;
      v19 = sub_2493BB110();
      v11 = swift_allocObject();
      *(_QWORD *)&v17 = v11;
      *(_BYTE *)(v11 + 16) = v16;
      *(_QWORD *)(v11 + 24) = v15;
      *(_QWORD *)(v11 + 32) = v5;
      *(_QWORD *)(v11 + 40) = v14;
      *(_QWORD *)(v11 + 48) = v6;
      *(_QWORD *)(v11 + 56) = v13;
      *(_QWORD *)(v11 + 64) = v7;
      *(_QWORD *)(v11 + 72) = v8;
      *(_QWORD *)(v2 + 16) = v9 + 1;
      sub_2493B0818(&v17, v2 + 40 * v9 + 32);
      v4 += 8;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_2493B6F34(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B6F6C + 4 * byte_2493CBCBB[a1]))(0xD000000000000011, 0x80000002493CC900);
}

uint64_t sub_2493B6F6C()
{
  return 0x444965736E6573;
}

uint64_t sub_2493B6F84()
{
  return 0x6974696E69666564;
}

uint64_t sub_2493B6FA0()
{
  return 0x614D656372756F73;
}

uint64_t sub_2493B6FD0()
{
  return 0x736C6562616CLL;
}

uint64_t sub_2493B6FE4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B701C + 4 * byte_2493CBCC1[a1]))(0xD000000000000011, 0x80000002493CC900);
}

uint64_t sub_2493B701C()
{
  return 0x444965736E6573;
}

uint64_t sub_2493B7034()
{
  return 0x6974696E69666564;
}

uint64_t sub_2493B7050()
{
  return 0x614D656372756F73;
}

uint64_t sub_2493B7080()
{
  return 0x736C6562616CLL;
}

uint64_t sub_2493B7094(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];
  uint64_t v12;
  char v13;
  char v14;
  char v15;
  char v16;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860580);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = &v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493BB05C();
  sub_2493CAA40();
  v16 = 0;
  sub_2493CA95C();
  if (!v2)
  {
    v15 = 1;
    sub_2493CA95C();
    v14 = 2;
    sub_2493CA95C();
    v13 = 3;
    sub_2493CA95C();
    v12 = *(_QWORD *)(v3 + 64);
    v11[15] = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860570);
    sub_2493BB0A0(&qword_257860588, &qword_257860570, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_2493CA980();
    v11[14] = 5;
    sub_2493CA968();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_2493B728C(char *a1)
{
  sub_2493B59D4(*a1);
}

void sub_2493B7298()
{
  char *v0;

  sub_2493B5E7C(*v0);
}

void sub_2493B72A0(uint64_t a1)
{
  char *v1;

  sub_2493B63B0(a1, *v1);
}

void sub_2493B72A8(uint64_t a1)
{
  char *v1;

  sub_2493B6658(a1, *v1);
}

uint64_t sub_2493B72B0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493BAFCC();
  *a1 = result;
  return result;
}

uint64_t sub_2493B72DC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2493B6F34(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2493B7304()
{
  unsigned __int8 *v0;

  return sub_2493B6FE4(*v0);
}

uint64_t sub_2493B730C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493BAFCC();
  *a1 = result;
  return result;
}

void sub_2493B7330(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2493B733C()
{
  sub_2493BB05C();
  return sub_2493CAA4C();
}

uint64_t sub_2493B7364()
{
  sub_2493BB05C();
  return sub_2493CAA58();
}

uint64_t sub_2493B738C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B73B8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B73E4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B7410()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B743C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2493B7444()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 72);
}

__n128 sub_2493B744C@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[3];
  _OWORD v7[2];

  sub_2493BAB64(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v7[0];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 57) = *(_OWORD *)((char *)v7 + 9);
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_2493B7494(_QWORD *a1)
{
  return sub_2493B7094(a1);
}

uint64_t StoredTranslationAlternative.isLowConfidence.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t StoredTranslationAlternative.isLowConfidence.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*StoredTranslationAlternative.isLowConfidence.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.formattedString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.formattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.formattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.sanitizedFormattedString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.sanitizedFormattedString.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.sanitizedFormattedString.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.romanization.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredTranslationAlternative.romanization.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*StoredTranslationAlternative.romanization.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationAlternative.sensesMeta.getter()
{
  uint64_t v0;

  return sub_2493B6C50(*(_QWORD *)(v0 + 56));
}

void __swiftcall StoredTranslationAlternative.init(text:romanization:lowConfidence:)(TranslationPersistence::StoredTranslationAlternative *__return_ptr retstr, Swift::String text, Swift::String_optional romanization, Swift::Bool lowConfidence)
{
  retstr->isLowConfidence = lowConfidence;
  retstr->formattedString = text;
  retstr->sanitizedFormattedString.value._countAndFlagsBits = 0;
  retstr->sanitizedFormattedString.value._object = 0;
  retstr->romanization = romanization;
  retstr->_sensesMeta._rawValue = (void *)MEMORY[0x24BEE4AF8];
}

uint64_t StoredTranslationAlternative.init(from:)@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
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
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860370);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B798C();
  sub_2493CAA28();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    v35 = 0;
    v10 = sub_2493CA920();
    v34 = 1;
    v11 = sub_2493CA914();
    v14 = v13;
    v28 = v11;
    v33 = 4;
    swift_bridgeObjectRetain();
    v29 = v14;
    v15 = sub_2493CA8F0();
    v17 = v16;
    v26 = v15;
    v27 = a2;
    v32 = 2;
    swift_bridgeObjectRetain();
    v18 = sub_2493CA8F0();
    v20 = v19;
    v25 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860380);
    v31 = 3;
    sub_2493B4E58(&qword_257860388, &qword_257860380, (uint64_t (*)(void))sub_2493B79D0, MEMORY[0x24BEE12D0]);
    swift_bridgeObjectRetain();
    sub_2493CA938();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v22 = v29;
    v21 = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v23 = v27;
    v24 = v28;
    *v27 = v10 & 1;
    v23[1] = v24;
    v23[2] = v22;
    v23[3] = v25;
    v23[4] = v20;
    v23[5] = v26;
    v23[6] = v17;
    v23[7] = v21;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

unint64_t sub_2493B798C()
{
  unint64_t result;

  result = qword_257860378;
  if (!qword_257860378)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC3DC, &type metadata for StoredTranslationAlternative.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860378);
  }
  return result;
}

unint64_t sub_2493B79D0()
{
  unint64_t result;

  result = qword_257860390;
  if (!qword_257860390)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC3B4, &type metadata for StoredTranslationSense);
    atomic_store(result, (unint64_t *)&qword_257860390);
  }
  return result;
}

uint64_t StoredTranslationAlternative.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
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

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860398);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1[1];
  v24 = v1[2];
  v25 = v9;
  v10 = v1[3];
  v11 = v1[4];
  v22 = v1[5];
  v23 = v10;
  v12 = v1[6];
  v20 = v11;
  v21 = v12;
  v19 = v1[7];
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B798C();
  v13 = v4;
  sub_2493CAA40();
  LOBYTE(v26) = 0;
  sub_2493CA968();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v16 = v21;
  v15 = v22;
  v17 = v23;
  LOBYTE(v26) = 1;
  sub_2493CA95C();
  v26 = v15;
  v27 = v16;
  v28 = 4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578603A0);
  sub_2493BB0A0(&qword_2578603A8, &qword_2578603A0, MEMORY[0x24BEE0D08], MEMORY[0x24BEE4AA8]);
  sub_2493CA980();
  v26 = v17;
  v27 = v20;
  v28 = 2;
  sub_2493CA980();
  v26 = v19;
  v28 = 3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860380);
  sub_2493B4E58(&qword_2578603B0, &qword_257860380, (uint64_t (*)(void))sub_2493B7C84, MEMORY[0x24BEE12A0]);
  sub_2493CA980();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v13);
}

unint64_t sub_2493B7C84()
{
  unint64_t result;

  result = qword_2578603B8;
  if (!qword_2578603B8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC38C, &type metadata for StoredTranslationSense);
    atomic_store(result, (unint64_t *)&qword_2578603B8);
  }
  return result;
}

uint64_t sub_2493B7CC8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B7D00 + 4 * byte_2493CBCC7[a1]))(0xD000000000000018, 0x80000002493CC890);
}

uint64_t sub_2493B7D00()
{
  return 0x6E6F43776F4C7369;
}

uint64_t sub_2493B7D24()
{
  return 0x657474616D726F66;
}

uint64_t sub_2493B7D48()
{
  return 0x654D7365736E6573;
}

uint64_t sub_2493B7D64()
{
  return 0x617A696E616D6F72;
}

uint64_t sub_2493B7D84(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B7DBC + 4 * byte_2493CBCCC[a1]))(0xD000000000000018, 0x80000002493CC890);
}

uint64_t sub_2493B7DBC()
{
  return 0x6E6F43776F4C7369;
}

uint64_t sub_2493B7DE0()
{
  return 0x657474616D726F66;
}

uint64_t sub_2493B7E04()
{
  return 0x654D7365736E6573;
}

uint64_t sub_2493B7E20()
{
  return 0x617A696E616D6F72;
}

void sub_2493B7E40(char *a1)
{
  sub_2493B5BA8(*a1);
}

void sub_2493B7E4C()
{
  char *v0;

  sub_2493B5F70(*v0);
}

void sub_2493B7E54(uint64_t a1)
{
  char *v1;

  sub_2493B6480(a1, *v1);
}

void sub_2493B7E5C(uint64_t a1)
{
  char *v1;

  sub_2493B655C(a1, *v1);
}

uint64_t sub_2493B7E64@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493BB014();
  *a1 = result;
  return result;
}

uint64_t sub_2493B7E90@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2493B7CC8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_2493B7EB8()
{
  unsigned __int8 *v0;

  return sub_2493B7D84(*v0);
}

uint64_t sub_2493B7EC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2493BB014();
  *a1 = result;
  return result;
}

void sub_2493B7EE4(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_2493B7EF0()
{
  sub_2493B798C();
  return sub_2493CAA4C();
}

uint64_t sub_2493B7F18()
{
  sub_2493B798C();
  return sub_2493CAA58();
}

uint64_t sub_2493B7F40()
{
  uint64_t v0;

  return sub_2493B6C50(*(_QWORD *)(v0 + 56));
}

uint64_t sub_2493B7F48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2493B7F74@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  return StoredTranslationAlternative.init(from:)(a1, a2);
}

uint64_t sub_2493B7F88(_QWORD *a1)
{
  return StoredTranslationAlternative.encode(to:)(a1);
}

uint64_t sub_2493B7F9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t StoredDisambiguableResult.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t StoredDisambiguableResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  int v17;
  uint64_t v18;
  _DWORD *v19;
  void *v20;
  uint64_t v21;
  uint8_t *v22;
  _QWORD *v23;
  _DWORD *v24;
  _QWORD *v25;
  uint8_t *v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *v30;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578603C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B8328();
  sub_2493CAA28();
  if (!v2)
  {
    sub_2493B836C();
    sub_2493CA938();
    v11 = v28;
    v10 = v29;
    sub_2493B83B0(0, &qword_2578603D8);
    sub_2493B83B0(0, &qword_2578603E0);
    v12 = sub_2493CA7DC();
    if (v12)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
      sub_2493B193C(v11, v10);
      *a2 = v12;
    }
    else
    {
      if (qword_2578600A0 != -1)
        swift_once();
      v14 = sub_2493CA6C8();
      __swift_project_value_buffer(v14, (uint64_t)qword_2578634C0);
      v15 = sub_2493CA6B0();
      v16 = sub_2493CA7B8();
      v17 = v16;
      v30 = v15;
      if (os_log_type_enabled(v15, v16))
      {
        v18 = swift_slowAlloc();
        v27 = v17;
        v19 = (_DWORD *)v18;
        v25 = (_QWORD *)swift_slowAlloc();
        v26 = (uint8_t *)v19;
        *v19 = 138412290;
        v24 = v19 + 1;
        sub_2493B83E8();
        v20 = (void *)swift_allocError();
        v21 = sub_2493CA56C();

        v28 = v21;
        sub_2493CA824();
        v23 = v25;
        v22 = v26;
        *v25 = v21;
        _os_log_impl(&dword_2493AE000, v30, (os_log_type_t)v27, "Failed to decode container into _LTDisambiguableResult: %@", v22, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
        swift_arrayDestroy();
        MEMORY[0x2495AF4D0](v23, -1, -1);
        MEMORY[0x2495AF4D0](v22, -1, -1);
      }

      sub_2493B83E8();
      swift_allocError();
      swift_willThrow();
      sub_2493B193C(v11, v10);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_2493B8328()
{
  unint64_t result;

  result = qword_2578603C8;
  if (!qword_2578603C8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC33C, &type metadata for StoredDisambiguableResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578603C8);
  }
  return result;
}

unint64_t sub_2493B836C()
{
  unint64_t result;

  result = qword_2578603D0;
  if (!qword_2578603D0)
  {
    result = MEMORY[0x2495AF458](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2578603D0);
  }
  return result;
}

uint64_t sub_2493B83B0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2493B83E8()
{
  unint64_t result;

  result = qword_2578603E8;
  if (!qword_2578603E8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC2FC, &type metadata for PersistenceError);
    atomic_store(result, (unint64_t *)&qword_2578603E8);
  }
  return result;
}

uint64_t StoredDisambiguableResult.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v18[3];

  v18[2] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578603F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v18[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B8328();
  sub_2493CAA40();
  v9 = (void *)objc_opt_self();
  v18[0] = 0;
  v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v8, 1, v18);
  v11 = v18[0];
  if (v10)
  {
    v12 = (void *)sub_2493CA5C0();
    v14 = v13;

    v18[0] = v12;
    v18[1] = v14;
    sub_2493B9350();
    sub_2493CA980();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    return sub_2493B193C((uint64_t)v12, (unint64_t)v14);
  }
  else
  {
    v16 = v11;
    sub_2493CA578();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

uint64_t sub_2493B85E4()
{
  return sub_2493BAA84();
}

uint64_t sub_2493B860C()
{
  return sub_2493BAB1C();
}

uint64_t sub_2493B8630@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2493CA8E4();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2493B8680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2493BB0FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2493B86A8@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2493CA8E4();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2493B86FC()
{
  sub_2493B8328();
  return sub_2493CAA4C();
}

uint64_t sub_2493B8724()
{
  sub_2493B8328();
  return sub_2493CAA58();
}

uint64_t sub_2493B874C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return StoredDisambiguableResult.init(from:)(a1, a2);
}

uint64_t sub_2493B8760(_QWORD *a1)
{
  return StoredDisambiguableResult.encode(to:)(a1);
}

uint64_t StoredTranslationResult.locale.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t StoredTranslationResult.locale.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*StoredTranslationResult.locale.modify())()
{
  return nullsub_1;
}

uint64_t StoredTranslationResult.alternatives.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = type metadata accessor for StoredTranslationResult();
  return sub_2493B6DD0(*(_QWORD *)(v0 + *(int *)(v1 + 20)));
}

uint64_t StoredTranslationResult.isOffline.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for StoredTranslationResult() + 24));
}

uint64_t StoredTranslationResult.isOffline.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for StoredTranslationResult();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*StoredTranslationResult.isOffline.modify())()
{
  type metadata accessor for StoredTranslationResult();
  return nullsub_1;
}

uint64_t StoredTranslationResult.isFinal.getter()
{
  return 1;
}

void *StoredTranslationResult.disambiguableResult.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + *(int *)(type metadata accessor for StoredTranslationResult() + 28));
  v2 = v1;
  return v1;
}

uint64_t StoredTranslationResult.init(text:locale:isOffline:romanization:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;

  v13 = (int *)type metadata accessor for StoredTranslationResult();
  *(_QWORD *)(a7 + v13[7]) = 0;
  v14 = sub_2493CA698();
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(a7, a3, v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860400);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2493CC570;
  *(_BYTE *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 40) = a1;
  *(_QWORD *)(v16 + 48) = a2;
  *(_QWORD *)(v16 + 56) = 0;
  *(_QWORD *)(v16 + 64) = 0;
  *(_QWORD *)(v16 + 72) = a5;
  *(_QWORD *)(v16 + 80) = a6;
  *(_QWORD *)(v16 + 88) = MEMORY[0x24BEE4AF8];
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  *(_QWORD *)(a7 + v13[5]) = v16;
  *(_BYTE *)(a7 + v13[6]) = a4;
  return result;
}

void StoredTranslationResult.init(from:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  _QWORD *v29;
  char *v30;
  char v31;
  uint64_t v32;

  v24 = a2;
  v3 = sub_2493CA698();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v25 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860408);
  v7 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26, v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for StoredTranslationResult();
  v28 = *(int *)(MEMORY[0x24BDAC7A8](v11, v12) + 28);
  v30 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v30[v28] = 0;
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B93D0();
  v27 = v10;
  v14 = (uint64_t)v29;
  sub_2493CAA28();
  if (v14)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);

  }
  else
  {
    v15 = v7;
    v29 = a1;
    LOBYTE(v32) = 0;
    sub_2493B3A94(&qword_257860190, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE8]);
    v16 = v25;
    v17 = v26;
    sub_2493CA938();
    v18 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v19 = (uint64_t)v30;
    v18(v30, v16, v3);
    LOBYTE(v32) = 2;
    *(_BYTE *)(v19 + *(int *)(v11 + 24)) = sub_2493CA8FC() & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860418);
    v31 = 1;
    sub_2493B4E58(&qword_257860420, &qword_257860418, (uint64_t (*)(void))sub_2493B9414, MEMORY[0x24BEE12D0]);
    v20 = v27;
    sub_2493CA908();
    v21 = v32;
    if (!v32)
      v21 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v19 + *(int *)(v11 + 20)) = v21;
    v31 = 3;
    sub_2493B9458();
    sub_2493CA908();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v20, v17);
    v22 = v32;
    v23 = v28;

    *(_QWORD *)(v19 + v23) = v22;
    sub_2493B949C(v19, v24);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    sub_2493B94E0(v19);
  }
}

uint64_t StoredTranslationResult.encode(to:)(_QWORD *a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  char v19;
  uint64_t v20;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860438);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493B93D0();
  sub_2493CAA40();
  LOBYTE(v20) = 0;
  sub_2493CA698();
  sub_2493B3A94(&qword_2578601B0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEC8]);
  sub_2493CA980();
  if (!v2)
  {
    v10 = type metadata accessor for StoredTranslationResult();
    LOBYTE(v20) = 2;
    sub_2493CA968();
    v11 = *(_QWORD *)(v3 + *(int *)(v10 + 20));
    v20 = v11;
    v19 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860418);
    sub_2493B4E58(&qword_257860440, &qword_257860418, (uint64_t (*)(void))sub_2493B951C, MEMORY[0x24BEE12A0]);
    sub_2493CA980();
    v12 = *(_QWORD *)(v3 + *(int *)(v10 + 28));
    v20 = v12;
    v19 = 3;
    sub_2493B9560();
    sub_2493CA950();
    if (!v12 && !*(_QWORD *)(v11 + 16))
    {
      if (qword_2578600A0 != -1)
        swift_once();
      v13 = sub_2493CA6C8();
      __swift_project_value_buffer(v13, (uint64_t)qword_2578634C0);
      v14 = sub_2493CA6B0();
      v15 = sub_2493CA7C4();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_2493AE000, v14, v15, "No translated result of any kind to encode", v16, 2u);
        MEMORY[0x2495AF4D0](v16, -1, -1);
      }

    }
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TranslationPersistence::StoredTranslationResult::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2493CA8E4();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  TranslationPersistence::StoredTranslationResult::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = StoredTranslationResult.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional __swiftcall StoredTranslationResult.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 4;
  return (TranslationPersistence::StoredTranslationResult::CodingKeys_optional)intValue;
}

uint64_t StoredTranslationResult.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t StoredTranslationResult.CodingKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B90E4 + 4 * byte_2493CBCD1[*v0]))(0xD000000000000019, 0x80000002493CC940);
}

uint64_t sub_2493B90E4()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_2493B90F8()
{
  return 0x6E696C66664F7369;
}

uint64_t sub_2493B9114()
{
  return 0x74616E7265746C61;
}

uint64_t StoredTranslationResult.CodingKeys.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2493B9168 + 4 * byte_2493CBCD5[*v0]))(0xD000000000000019, 0x80000002493CC940);
}

uint64_t sub_2493B9168()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_2493B917C()
{
  return 0x6E696C66664F7369;
}

uint64_t sub_2493B9198()
{
  return 0x74616E7265746C61;
}

void sub_2493B91B8(char *a1)
{
  sub_2493B586C(*a1);
}

void sub_2493B91C4()
{
  char *v0;

  sub_2493B6070(*v0);
}

void sub_2493B91CC(uint64_t a1)
{
  char *v1;

  sub_2493B6308(a1, *v1);
}

void sub_2493B91D4(uint64_t a1)
{
  char *v1;

  sub_2493B6748(a1, *v1);
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional sub_2493B91DC(Swift::String *a1)
{
  return StoredTranslationResult.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_2493B91E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = StoredTranslationResult.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

TranslationPersistence::StoredTranslationResult::CodingKeys_optional sub_2493B9210@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  TranslationPersistence::StoredTranslationResult::CodingKeys_optional result;
  char v5;

  result.value = StoredTranslationResult.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_2493B9244(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_2493B9250()
{
  sub_2493B93D0();
  return sub_2493CAA4C();
}

uint64_t sub_2493B9278()
{
  sub_2493B93D0();
  return sub_2493CAA58();
}

uint64_t sub_2493B92A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_2493CA698();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_2493B92D8(uint64_t a1)
{
  uint64_t v1;

  return sub_2493B6DD0(*(_QWORD *)(v1 + *(int *)(a1 + 20)));
}

uint64_t sub_2493B92E4(uint64_t a1)
{
  uint64_t v1;

  return *(unsigned __int8 *)(v1 + *(int *)(a1 + 24));
}

void *sub_2493B92F0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v2 = *(void **)(v1 + *(int *)(a1 + 28));
  v3 = v2;
  return v2;
}

void sub_2493B9318(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  StoredTranslationResult.init(from:)(a1, a2);
}

uint64_t sub_2493B932C(_QWORD *a1)
{
  return StoredTranslationResult.encode(to:)(a1);
}

unint64_t sub_2493B9350()
{
  unint64_t result;

  result = qword_2578603F8;
  if (!qword_2578603F8)
  {
    result = MEMORY[0x2495AF458](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_2578603F8);
  }
  return result;
}

uint64_t type metadata accessor for StoredTranslationResult()
{
  uint64_t result;

  result = qword_2578604D0;
  if (!qword_2578604D0)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_2493B93D0()
{
  unint64_t result;

  result = qword_257860410;
  if (!qword_257860410)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationResult.CodingKeys, &type metadata for StoredTranslationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860410);
  }
  return result;
}

unint64_t sub_2493B9414()
{
  unint64_t result;

  result = qword_257860428;
  if (!qword_257860428)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationAlternative, &type metadata for StoredTranslationAlternative);
    atomic_store(result, (unint64_t *)&qword_257860428);
  }
  return result;
}

unint64_t sub_2493B9458()
{
  unint64_t result;

  result = qword_257860430;
  if (!qword_257860430)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredDisambiguableResult, &type metadata for StoredDisambiguableResult);
    atomic_store(result, (unint64_t *)&qword_257860430);
  }
  return result;
}

uint64_t sub_2493B949C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StoredTranslationResult();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2493B94E0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StoredTranslationResult();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2493B951C()
{
  unint64_t result;

  result = qword_257860448;
  if (!qword_257860448)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationAlternative, &type metadata for StoredTranslationAlternative);
    atomic_store(result, (unint64_t *)&qword_257860448);
  }
  return result;
}

unint64_t sub_2493B9560()
{
  unint64_t result;

  result = qword_257860450;
  if (!qword_257860450)
  {
    result = MEMORY[0x2495AF458]("yih\b$%", &type metadata for StoredDisambiguableResult);
    atomic_store(result, (unint64_t *)&qword_257860450);
  }
  return result;
}

unint64_t sub_2493B95A4(uint64_t a1)
{
  unint64_t result;

  result = sub_2493B951C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2493B95CC()
{
  unint64_t result;

  result = qword_257860458;
  if (!qword_257860458)
  {
    result = MEMORY[0x2495AF458]("qih\b@%", &type metadata for StoredTranslationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860458);
  }
  return result;
}

unint64_t sub_2493B9614()
{
  unint64_t result;

  result = qword_257860460;
  if (!qword_257860460)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationResult.CodingKeys, &type metadata for StoredTranslationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860460);
  }
  return result;
}

unint64_t sub_2493B965C()
{
  unint64_t result;

  result = qword_257860468;
  if (!qword_257860468)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationResult.CodingKeys, &type metadata for StoredTranslationResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860468);
  }
  return result;
}

uint64_t sub_2493B96A0(uint64_t a1)
{
  uint64_t result;

  result = sub_2493B3A94(&qword_257860470, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t destroy for StoredTranslationAlternative()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StoredTranslationAlternative(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationAlternative(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationAlternative(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationAlternative()
{
  return &type metadata for StoredTranslationAlternative;
}

ValueMetadata *type metadata accessor for StoredDisambiguableResult()
{
  return &type metadata for StoredDisambiguableResult;
}

_QWORD *initializeBufferWithCopyOfBuffer for StoredTranslationResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_2493CA698();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[7];
    v10 = *(void **)((char *)a2 + v9);
    *(_QWORD *)((char *)a1 + v9) = v10;
    swift_bridgeObjectRetain();
    v11 = v10;
  }
  return a1;
}

void destroy for StoredTranslationResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();

}

uint64_t initializeWithCopy for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = *(void **)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v9;
  swift_bridgeObjectRetain();
  v10 = v9;
  return a1;
}

uint64_t assignWithCopy for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v7 = a3[7];
  v8 = *(void **)(a1 + v7);
  v9 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v9;
  v10 = v9;

  return a1;
}

uint64_t initializeWithTake for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for StoredTranslationResult(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_2493CA698();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_bridgeObjectRelease();
  v7 = a3[7];
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2493B9C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_2493CA698();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2493B9CE4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_2493CA698();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_2493B9D5C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2493CA698();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StoredTranslationResult.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StoredTranslationResult.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493B9EC0 + 4 * byte_2493CBCDE[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2493B9EF4 + 4 * byte_2493CBCD9[v4]))();
}

uint64_t sub_2493B9EF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B9EFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493B9F04);
  return result;
}

uint64_t sub_2493B9F10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493B9F18);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2493B9F1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493B9F24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationResult.CodingKeys()
{
  return &type metadata for StoredTranslationResult.CodingKeys;
}

ValueMetadata *type metadata accessor for PersistenceError()
{
  return &type metadata for PersistenceError;
}

uint64_t _s22TranslationPersistence16PersistenceErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2493B9F98 + 4 * byte_2493CBCE3[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2493B9FB8 + 4 * byte_2493CBCE8[v4]))();
}

_BYTE *sub_2493B9F98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2493B9FB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B9FC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B9FC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2493B9FD0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2493B9FD8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for StoredDisambiguableResult.CodingKeys()
{
  return &type metadata for StoredDisambiguableResult.CodingKeys;
}

uint64_t destroy for StoredTranslationSense()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StoredTranslationSense(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StoredTranslationSense(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for StoredTranslationSense(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  return a1;
}

uint64_t getEnumTagSinglePayload for StoredTranslationSense(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 73))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationSense(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 72) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 73) = 1;
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
    *(_BYTE *)(result + 73) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationSense()
{
  return &type metadata for StoredTranslationSense;
}

uint64_t getEnumTagSinglePayload for StoredTranslationAlternative.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for StoredTranslationAlternative.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493BA3AC + 4 * byte_2493CBCF2[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2493BA3E0 + 4 * byte_2493CBCED[v4]))();
}

uint64_t sub_2493BA3E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493BA3E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493BA3F0);
  return result;
}

uint64_t sub_2493BA3FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493BA404);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2493BA408(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493BA410(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationAlternative.CodingKeys()
{
  return &type metadata for StoredTranslationAlternative.CodingKeys;
}

unint64_t sub_2493BA430()
{
  unint64_t result;

  result = qword_257860510;
  if (!qword_257860510)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC160, &type metadata for StoredTranslationAlternative.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860510);
  }
  return result;
}

unint64_t sub_2493BA474(uint64_t a1)
{
  unint64_t result;

  result = sub_2493B7C84();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2493BA49C()
{
  unint64_t result;

  result = qword_257860518;
  if (!qword_257860518)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC26C, &type metadata for StoredDisambiguableResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860518);
  }
  return result;
}

unint64_t sub_2493BA4E4()
{
  unint64_t result;

  result = qword_257860520;
  if (!qword_257860520)
  {
    result = MEMORY[0x2495AF458]("}dh\bh ", &type metadata for PersistenceError);
    atomic_store(result, (unint64_t *)&qword_257860520);
  }
  return result;
}

unint64_t sub_2493BA52C()
{
  unint64_t result;

  result = qword_257860528;
  if (!qword_257860528)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC1A4, &type metadata for StoredDisambiguableResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860528);
  }
  return result;
}

unint64_t sub_2493BA574()
{
  unint64_t result;

  result = qword_257860530;
  if (!qword_257860530)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC1CC, &type metadata for StoredDisambiguableResult.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860530);
  }
  return result;
}

unint64_t sub_2493BA5BC()
{
  unint64_t result;

  result = qword_257860538;
  if (!qword_257860538)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC098, &type metadata for StoredTranslationAlternative.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860538);
  }
  return result;
}

unint64_t sub_2493BA604()
{
  unint64_t result;

  result = qword_257860540;
  if (!qword_257860540)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC0C0, &type metadata for StoredTranslationAlternative.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860540);
  }
  return result;
}

uint64_t sub_2493BA648(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2493BA75C(a1, a2, a3, (_QWORD *)*v3, &qword_2578605E8, &qword_2578605F0);
  *v3 = result;
  return result;
}

uint64_t sub_2493BA674(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2493BA75C(a1, a2, a3, (_QWORD *)*v3, &qword_257860550, &qword_257860558);
  *v3 = result;
  return result;
}

unint64_t sub_2493BA6A0()
{
  unint64_t result;

  result = qword_257860548;
  if (!qword_257860548)
  {
    result = MEMORY[0x2495AF458](&unk_2493CB918, &type metadata for StoredSpeechTokenBin);
    atomic_store(result, (unint64_t *)&qword_257860548);
  }
  return result;
}

uint64_t sub_2493BA6E4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2493BA75C(a1, a2, a3, (_QWORD *)*v3, &qword_2578605B8, &qword_2578605C0);
  *v3 = result;
  return result;
}

uint64_t sub_2493BA710(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2493BA75C(a1, a2, a3, (_QWORD *)*v3, &qword_2578605A0, &qword_2578605A8);
  *v3 = result;
  return result;
}

uint64_t sub_2493BA73C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2493BA900(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2493BA75C(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v15 = (unint64_t)(v13 + 4);
  v16 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11)
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_2493CA8D8();
  __break(1u);
  return result;
}

uint64_t sub_2493BA900(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860590);
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
  result = sub_2493CA8D8();
  __break(1u);
  return result;
}

uint64_t sub_2493BAA68()
{
  return sub_2493BAA84();
}

uint64_t sub_2493BAA84()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  return sub_2493CAA10();
}

uint64_t sub_2493BAAD0()
{
  return sub_2493CA71C();
}

uint64_t sub_2493BAAE4()
{
  return sub_2493CA71C();
}

uint64_t sub_2493BAB00()
{
  return sub_2493BAB1C();
}

uint64_t sub_2493BAB1C()
{
  sub_2493CA9F8();
  sub_2493CA71C();
  return sub_2493CAA10();
}

uint64_t sub_2493BAB64@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v21;
  char v22;
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
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860560);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493BB05C();
  sub_2493CAA28();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v42 = 0;
  v11 = sub_2493CA914();
  v13 = v12;
  v41 = 1;
  swift_bridgeObjectRetain();
  v14 = sub_2493CA914();
  v35 = v15;
  v30 = v14;
  v31 = v11;
  v40 = 2;
  swift_bridgeObjectRetain();
  v34 = 0;
  v29 = sub_2493CA914();
  v39 = 3;
  v17 = v16;
  swift_bridgeObjectRetain();
  v18 = sub_2493CA914();
  v33 = v17;
  v28 = v18;
  v20 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860570);
  v38 = 4;
  sub_2493BB0A0(&qword_257860578, &qword_257860570, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_2493CA908();
  v32 = v20;
  if (v36)
    v21 = v36;
  else
    v21 = MEMORY[0x24BEE4AF8];
  v37 = 5;
  swift_bridgeObjectRetain();
  v22 = sub_2493CA8FC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  v23 = v32;
  swift_bridgeObjectRelease();
  v24 = v21;
  v25 = v33;
  swift_bridgeObjectRelease();
  v26 = v35;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v31;
  *(_QWORD *)(a2 + 8) = v13;
  *(_QWORD *)(a2 + 16) = v30;
  *(_QWORD *)(a2 + 24) = v26;
  *(_QWORD *)(a2 + 32) = v29;
  *(_QWORD *)(a2 + 40) = v25;
  *(_QWORD *)(a2 + 48) = v28;
  *(_QWORD *)(a2 + 56) = v23;
  *(_QWORD *)(a2 + 64) = v24;
  *(_BYTE *)(a2 + 72) = v22 & 1;
  return result;
}

uint64_t sub_2493BAFCC()
{
  unint64_t v0;

  v0 = sub_2493CA8E4();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

uint64_t sub_2493BB014()
{
  unint64_t v0;

  v0 = sub_2493CA8E4();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

unint64_t sub_2493BB05C()
{
  unint64_t result;

  result = qword_257860568;
  if (!qword_257860568)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC51C, &type metadata for StoredTranslationSense.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257860568);
  }
  return result;
}

uint64_t sub_2493BB0A0(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9 = a3;
    result = MEMORY[0x2495AF458](a4, v8, &v9);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2493BB0FC()
{
  return 0x746C75736572;
}

unint64_t sub_2493BB110()
{
  unint64_t result;

  result = qword_257860598;
  if (!qword_257860598)
  {
    result = MEMORY[0x2495AF458](&protocol conformance descriptor for StoredTranslationAlternative, &type metadata for StoredTranslationAlternative);
    atomic_store(result, (unint64_t *)&qword_257860598);
  }
  return result;
}

uint64_t sub_2493BB154()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_2493BB190()
{
  unint64_t result;

  result = qword_2578605B0;
  if (!qword_2578605B0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC188, &type metadata for StoredTranslationSense);
    atomic_store(result, (unint64_t *)&qword_2578605B0);
  }
  return result;
}

uint64_t sub_2493BB1D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t getEnumTagSinglePayload for StoredTranslationSense.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StoredTranslationSense.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2493BB2F4 + 4 * byte_2493CBCFC[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2493BB328 + 4 * byte_2493CBCF7[v4]))();
}

uint64_t sub_2493BB328(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493BB330(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2493BB338);
  return result;
}

uint64_t sub_2493BB344(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2493BB34CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2493BB350(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2493BB358(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for StoredTranslationSense.CodingKeys()
{
  return &type metadata for StoredTranslationSense.CodingKeys;
}

unint64_t sub_2493BB378()
{
  unint64_t result;

  result = qword_2578605C8;
  if (!qword_2578605C8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC4F4, &type metadata for StoredTranslationSense.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578605C8);
  }
  return result;
}

unint64_t sub_2493BB3C0()
{
  unint64_t result;

  result = qword_2578605D0;
  if (!qword_2578605D0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC42C, &type metadata for StoredTranslationSense.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578605D0);
  }
  return result;
}

unint64_t sub_2493BB408()
{
  unint64_t result;

  result = qword_2578605D8;
  if (!qword_2578605D8)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC454, &type metadata for StoredTranslationSense.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2578605D8);
  }
  return result;
}

unint64_t sub_2493BB44C()
{
  unint64_t result;

  result = qword_2578605E0;
  if (!qword_2578605E0)
  {
    result = MEMORY[0x2495AF458](&unk_2493CBAF0, &type metadata for StoredSpeechTokenAlternatives);
    atomic_store(result, (unint64_t *)&qword_2578605E0);
  }
  return result;
}

id AnyTranslationResult.__allocating_init(from:)(_QWORD *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AnyTranslationResult.init(from:)(a1);
}

id AnyTranslationResult.init(from:)(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v4;
  id v5;
  id v6;
  objc_super v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v4 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v5 = v1;
  v6 = v4;
  sub_2493CAA1C();
  if (v2)
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    type metadata accessor for AnyTranslationResult();
    swift_deallocPartialClassInstance();
  }
  else
  {
    __swift_project_boxed_opaque_existential_1Tm(v12, v12[3]);
    v10 = type metadata accessor for StoredTranslationResult();
    v11 = sub_2493B1980(&qword_2578605F8, 255, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v9);
    sub_2493B1980(&qword_257860600, 255, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
    sub_2493CA9B0();
    sub_2493B0818(&v9, (uint64_t)v5 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);

    v8.receiver = v5;
    v8.super_class = (Class)type metadata accessor for AnyTranslationResult();
    v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  return v6;
}

uint64_t type metadata accessor for AnyTranslationResult()
{
  return objc_opt_self();
}

uint64_t sub_2493BB69C(_QWORD *a1)
{
  uint64_t v1;
  _BYTE v3[40];
  _BYTE v4[24];
  uint64_t v5;

  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  sub_2493CAA34();
  sub_2493B0774(v1 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value, (uint64_t)v3);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v4, v5);
  sub_2493BB758();
  sub_2493CA9BC();
  sub_2493B0C54((uint64_t)v3);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
}

unint64_t sub_2493BB758()
{
  unint64_t result;

  result = qword_257860610;
  if (!qword_257860610)
  {
    result = MEMORY[0x2495AF458](&unk_2493CC648, &type metadata for AnyTranslationResult.AnyTranslationResultBox);
    atomic_store(result, (unint64_t *)&qword_257860610);
  }
  return result;
}

id AnyTranslationResult.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AnyTranslationResult.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AnyTranslationResult.__deallocating_deinit()
{
  return sub_2493B14D4(type metadata accessor for AnyTranslationResult);
}

id sub_2493BB840@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  id v5;
  id result;

  v5 = objc_allocWithZone((Class)type metadata accessor for AnyTranslationResult());
  result = AnyTranslationResult.init(from:)(a1);
  if (!v2)
    *a2 = result;
  return result;
}

uint64_t sub_2493BB890(_QWORD *a1)
{
  return sub_2493BB69C(a1);
}

uint64_t method lookup function for AnyTranslationResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AnyTranslationResult.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of AnyTranslationResult.encode(to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t sub_2493BB900()
{
  uint64_t result;

  result = sub_2493CA6F8();
  qword_2578634E0 = result;
  return result;
}

double sub_2493BB954@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;
  void *v8;
  _QWORD v9[4];

  sub_2493B18C0(a1, (uint64_t)v9);
  if (v9[3])
  {
    type metadata accessor for AnyTranslationResult();
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_2493CA53C();
      swift_allocObject();
      sub_2493CA530();
      v9[0] = v8;
      sub_2493B1980(&qword_257860670, v3, (uint64_t (*)(uint64_t))type metadata accessor for AnyTranslationResult, (uint64_t)&protocol conformance descriptor for AnyTranslationResult);
      v4 = sub_2493CA524();
      v6 = v5;
      *(_QWORD *)(a2 + 24) = MEMORY[0x24BDCDDE8];

      swift_release();
      *(_QWORD *)a2 = v4;
      *(_QWORD *)(a2 + 8) = v6;
      return result;
    }
  }
  else
  {
    sub_2493B181C((uint64_t)v9);
  }
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

double sub_2493BBCBC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  double result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[4];

  sub_2493B18C0(a1, (uint64_t)v7);
  if (v7[3])
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_2493CA518();
      swift_allocObject();
      sub_2493CA50C();
      *(_QWORD *)(a2 + 24) = type metadata accessor for AnyTranslationResult();
      sub_2493B1980(&qword_257860668, v3, (uint64_t (*)(uint64_t))type metadata accessor for AnyTranslationResult, (uint64_t)&protocol conformance descriptor for AnyTranslationResult);
      sub_2493CA500();
      swift_release();
      sub_2493B193C(v5, v6);
      return result;
    }
  }
  else
  {
    sub_2493B181C((uint64_t)v7);
  }
  result = 0.0;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

id sub_2493BBFC4()
{
  return sub_2493B14D4(type metadata accessor for TargetResultValueTransformer);
}

uint64_t type metadata accessor for TargetResultValueTransformer()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for AnyTranslationResult.AnyTranslationResultBox()
{
  return &type metadata for AnyTranslationResult.AnyTranslationResultBox;
}

uint64_t sub_2493BC004()
{
  return sub_2493BC01C((SEL *)&selRef_sourceIdentifier);
}

uint64_t sub_2493BC010()
{
  return sub_2493BC01C((SEL *)&selRef_targetIdentifier);
}

uint64_t sub_2493BC01C(SEL *a1)
{
  void *v1;
  id v2;

  v2 = objc_msgSend(v1, *a1);
  sub_2493CA704();

  return sub_2493CA620();
}

uint64_t sub_2493BC074()
{
  void *v0;
  void *v1;
  uint64_t v2;
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
  uint64_t v13;
  uint64_t v15;

  v1 = v0;
  v2 = sub_2493CA5F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v1, sel_favoriteDate);
  if (v11)
  {
    v12 = v11;
    sub_2493CA5D8();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v6, v2);
    v13 = 1;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v10, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) != 1)
      goto LABEL_6;
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, 1, 1, v2);
  }
  v13 = 0;
LABEL_6:
  sub_2493BFD2C((uint64_t)v10, &qword_257860678);
  return v13;
}

uint64_t sub_2493BC1C0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v11[3];
  uint64_t v12;
  uint64_t v13;

  sub_2493BCB64(v11);
  v0 = v12;
  v1 = v13;
  __swift_project_boxed_opaque_existential_1Tm(v11, v12);
  v2 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  if (v2)
  {
    sub_2493BC6A0(v11);
    v4 = v12;
    v3 = v13;
    __swift_project_boxed_opaque_existential_1Tm(v11, v12);
    (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 16) + 16) + 8))(v4);
    if (!v5)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      v9 = objc_msgSend(v2, sel_sourceText);
      v8 = sub_2493CA704();

      return v8;
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);

  }
  sub_2493BC6A0(v11);
  v6 = v12;
  v7 = v13;
  __swift_project_boxed_opaque_existential_1Tm(v11, v12);
  v8 = AnnotatedResult.displayString.getter(v6, *(_QWORD *)(v7 + 16));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v8;
}

uint64_t sub_2493BC2F4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14[3];
  uint64_t v15;
  uint64_t v16;

  v1 = objc_msgSend(v0, sel_targetResult);

  if (v1)
  {
    sub_2493BCB64(v14);
    v2 = v15;
    v3 = v16;
    __swift_project_boxed_opaque_existential_1Tm(v14, v15);
    v4 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) + 16);
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
    if (v4 >= 2)
    {
      sub_2493BCB64(v14);
      v5 = v15;
      v6 = v16;
      __swift_project_boxed_opaque_existential_1Tm(v14, v15);
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
      if (!*(_QWORD *)(result + 16))
      {
        __break(1u);
        return result;
      }
      sub_2493B0774(result + 32, (uint64_t)v11);
      swift_bridgeObjectRelease();
      v8 = v12;
      v9 = v13;
      __swift_project_boxed_opaque_existential_1Tm(v11, v12);
      v10 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9) + 16);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
      if (v10)
        return PersistedTranslation.selectedAlternativeIndex.getter();
    }
  }
  return 0;
}

unint64_t sub_2493BC430()
{
  void *v0;
  void *v1;
  id v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t result;
  uint64_t v20;
  uint64_t v21;
  id v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[3];
  uint64_t v27;
  uint64_t v28;

  v1 = v0;
  v2 = sub_2493BD264();
  v3 = objc_msgSend(v2, sel_isPassthrough);

  if (v3)
    return sub_2493BC1C0();
  sub_2493BCB64(v26);
  v5 = v27;
  v6 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v6 + 48))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  if (v7)
  {
    sub_2493BC6A0(v26);
    v9 = v27;
    v8 = v28;
    __swift_project_boxed_opaque_existential_1Tm(v26, v27);
    (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v8 + 16) + 16) + 8))(v9);
    if (!v10)
    {
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
      v22 = objc_msgSend(v7, sel_targetText);
      v4 = sub_2493CA704();

      return v4;
    }
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);

  }
  v11 = objc_msgSend(v1, sel_targetResult);

  if (!v11)
    return 0;
  v12 = sub_2493BC2F4();
  sub_2493BCB64(v26);
  v13 = v27;
  v14 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  v15 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14) + 16);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  if (v12 >= v15)
    return 0;
  sub_2493BCB64(v26);
  v16 = v27;
  v17 = v28;
  __swift_project_boxed_opaque_existential_1Tm(v26, v27);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
  result = sub_2493BC2F4();
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(_QWORD *)(v18 + 16))
  {
    sub_2493B0774(v18 + 40 * result + 32, (uint64_t)v23);
    swift_bridgeObjectRelease();
    v20 = v24;
    v21 = v25;
    __swift_project_boxed_opaque_existential_1Tm(v23, v24);
    v4 = TranslationAlternative.displayString.getter(v20, v21);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
    return v4;
  }
  __break(1u);
  return result;
}

uint64_t sub_2493BC694(uint64_t a1)
{
  return sub_2493BCAC8(a1, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_2493BF518);
}

void sub_2493BC6A0(uint64_t *a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint8_t *v17;
  unsigned int v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30[4];

  v2 = v1;
  v4 = sub_2493CA6C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(v2, sel_sourceInput);
  if (v9)
  {
    v10 = v9;
    v11 = (uint64_t)v9 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value;
    swift_beginAccess();
    sub_2493B0774(v11, (uint64_t)a1);

  }
  else
  {
    if (qword_2578600A0 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v4, (uint64_t)qword_2578634C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v12, v4);
    v13 = v2;
    v14 = sub_2493CA6B0();
    v15 = sub_2493CA7C4();
    v16 = v15;
    if (os_log_type_enabled(v14, v15))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v30[0] = v29;
      *(_DWORD *)v17 = 136446210;
      v18 = objc_msgSend(v13, sel_isFault);
      v19 = v18 == 0;
      if (v18)
        v20 = 7562585;
      else
        v20 = 28494;
      HIDWORD(v28) = v16;
      if (v19)
        v21 = 0xE200000000000000;
      else
        v21 = 0xE300000000000000;
      v30[3] = sub_2493BE2C4(v20, v21, v30);
      sub_2493CA824();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2493AE000, v14, BYTE4(v28), "Attempted to get speech result but it doesn't exist, returning a blank StoredSpeechResult. Is the Translation a fault? %{public}s", v17, 0xCu);
      v22 = v29;
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v22, -1, -1);
      MEMORY[0x2495AF4D0](v17, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v23 = (int *)type metadata accessor for StoredSpeechResult();
    a1[3] = (uint64_t)v23;
    a1[4] = sub_2493B3A94(&qword_2578600D8, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)&protocol conformance descriptor for StoredSpeechResult);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    sub_2493CA620();
    v25 = v23[8];
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v23[11]) = 0;
    v26 = (uint64_t *)((char *)boxed_opaque_existential_1 + v25);
    *(_BYTE *)boxed_opaque_existential_1 = 1;
    boxed_opaque_existential_1[1] = 1000;
    *((_BYTE *)boxed_opaque_existential_1 + v23[7]) = 0;
    v27 = (uint64_t *)((char *)boxed_opaque_existential_1 + v23[9]);
    *v27 = 0;
    v27[1] = 0xE000000000000000;
    *v26 = 0;
    v26[1] = 0;
    *((_BYTE *)boxed_opaque_existential_1 + v23[10]) = 0;
  }
}

void (*sub_2493BC9B4(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  sub_2493BC6A0(v3);
  return sub_2493BCA00;
}

void sub_2493BCA00(uint64_t *a1, char a2)
{
  sub_2493BCF70(a1, a2, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_2493BF518);
}

uint64_t sub_2493BCA0C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(_BYTE *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE v16[24];
  uint64_t v17;
  uint64_t v18;

  sub_2493B0774(a1, (uint64_t)v16);
  v7 = *a2;
  v8 = v17;
  v9 = v18;
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v16, v17);
  MEMORY[0x24BDAC7A8](v10, v10);
  v12 = &v16[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v13 + 16))(v12);
  a5(v12, v7, v8, v9);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v16);
}

uint64_t sub_2493BCABC(uint64_t a1)
{
  return sub_2493BCAC8(a1, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_2493BF69C);
}

uint64_t sub_2493BCAC8(uint64_t a1, void (*a2)(char *, uint64_t, uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v5);
  MEMORY[0x24BDAC7A8](v7, v7);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  a2(v9, v2, v5, v6);
  return __swift_destroy_boxed_opaque_existential_1(a1);
}

void sub_2493BCB64(uint64_t *a1@<X8>)
{
  void *v1;
  void *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  int v19;
  uint64_t v20;
  uint8_t *v21;
  unsigned int v22;
  BOOL v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t v27;
  int *v28;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  int v33;
  uint64_t v34;
  os_log_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;

  v2 = v1;
  v4 = (_QWORD *)sub_2493CA698();
  v5 = *(v4 - 1);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2493CA6C8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(v2, sel_targetResult);
  if (v14)
  {
    v36 = v14;
    sub_2493B0774((uint64_t)v14 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value, (uint64_t)a1);

  }
  else
  {
    if (qword_2578600A0 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v9, (uint64_t)qword_2578634C0);
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v15, v9);
    v16 = v2;
    v17 = sub_2493CA6B0();
    v18 = sub_2493CA7C4();
    v19 = v18;
    if (os_log_type_enabled(v17, v18))
    {
      v35 = v17;
      v20 = swift_slowAlloc();
      v33 = v19;
      v21 = (uint8_t *)v20;
      v34 = swift_slowAlloc();
      v38 = v34;
      v36 = v4;
      *(_DWORD *)v21 = 136446210;
      v22 = objc_msgSend(v16, sel_isFault);
      v23 = v22 == 0;
      if (v22)
        v24 = 7562585;
      else
        v24 = 28494;
      if (v23)
        v25 = 0xE200000000000000;
      else
        v25 = 0xE300000000000000;
      v32 = a1;
      v37 = sub_2493BE2C4(v24, v25, &v38);
      a1 = v32;
      v4 = v36;
      sub_2493CA824();

      swift_bridgeObjectRelease();
      v26 = v35;
      _os_log_impl(&dword_2493AE000, v35, (os_log_type_t)v33, "Attempted to get translation result but it doesn't exist, returning a blank StoredTranslationResult. Is the Translation a fault? %{public}s", v21, 0xCu);
      v27 = v34;
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v27, -1, -1);
      MEMORY[0x2495AF4D0](v21, -1, -1);

    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    sub_2493CA620();
    v28 = (int *)type metadata accessor for StoredTranslationResult();
    a1[3] = (uint64_t)v28;
    a1[4] = sub_2493B3A94(&qword_2578605F8, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a1);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v28[7]) = 0;
    (*(void (**)(void))(v5 + 16))();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860400);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_2493CC570;
    *(_BYTE *)(v30 + 32) = 0;
    *(_QWORD *)(v30 + 40) = 0;
    *(_QWORD *)(v30 + 48) = 0xE000000000000000;
    *(_OWORD *)(v30 + 56) = 0u;
    *(_OWORD *)(v30 + 72) = 0u;
    *(_QWORD *)(v30 + 88) = MEMORY[0x24BEE4AF8];
    (*(void (**)(char *, _QWORD *))(v5 + 8))(v8, v4);
    *(uint64_t *)((char *)boxed_opaque_existential_1 + v28[5]) = v30;
    *((_BYTE *)boxed_opaque_existential_1 + v28[6]) = 1;
  }
}

void (*sub_2493BCF18(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t *v3;

  v3 = (uint64_t *)malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  sub_2493BCB64(v3);
  return sub_2493BCF64;
}

void sub_2493BCF64(uint64_t *a1, char a2)
{
  sub_2493BCF70(a1, a2, (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_2493BF69C);
}

void sub_2493BCF70(uint64_t *a1, char a2, void (*a3)(char *, uint64_t, uint64_t, uint64_t))
{
  _QWORD *v4;
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

  v4 = (_QWORD *)*a1;
  if ((a2 & 1) != 0)
  {
    v5 = v4[10];
    sub_2493B0774(*a1, (uint64_t)(v4 + 5));
    v6 = v4[8];
    v7 = v4[9];
    v8 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v4 + 5), v6);
    MEMORY[0x24BDAC7A8](v8, v8);
    v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v10);
    a3(v10, v5, v6, v7);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)(v4 + 5));
  }
  else
  {
    v12 = v4[10];
    v13 = v4[3];
    v14 = v4[4];
    v15 = __swift_mutable_project_boxed_opaque_existential_1(*a1, v13);
    MEMORY[0x24BDAC7A8](v15, v15);
    v17 = (char *)&v19 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v17);
    a3(v17, v12, v13, v14);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  free(v4);
}

uint64_t sub_2493BD0C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_2493BCB64(v4);
  v0 = v5;
  v1 = v6;
  __swift_project_boxed_opaque_existential_1Tm(v4, v5);
  v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2;
}

uint64_t sub_2493BD128()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15[3];
  uint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(v0, sel_targetResult);

  if (!v1)
    return 0;
  sub_2493BCB64(v15);
  v2 = v16;
  v3 = v17;
  __swift_project_boxed_opaque_existential_1Tm(v15, v16);
  v4 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3) + 16);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  if (v4 < 2)
    return 0;
  sub_2493BCB64(v15);
  v5 = v16;
  v6 = v17;
  __swift_project_boxed_opaque_existential_1Tm(v15, v16);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 24))(v5, v6);
  if (*(_QWORD *)(result + 16))
  {
    sub_2493B0774(result + 32, (uint64_t)v12);
    swift_bridgeObjectRelease();
    v8 = v13;
    v9 = v14;
    __swift_project_boxed_opaque_existential_1Tm(v12, v13);
    v10 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9) + 16);
    swift_bridgeObjectRelease();
    v11 = v10 != 0;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    return v11;
  }
  __break(1u);
  return result;
}

id sub_2493BD264()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void (*v16)(char *, uint64_t);
  uint64_t v18;

  v1 = sub_2493CA698();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1, v3);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v7);
  v9 = (char *)&v18 - v8;
  v10 = objc_msgSend(v0, sel_sourceIdentifier);
  sub_2493CA704();

  sub_2493CA620();
  v11 = objc_msgSend(v0, sel_targetIdentifier);
  sub_2493CA704();

  sub_2493CA620();
  v12 = objc_allocWithZone(MEMORY[0x24BDF6410]);
  v13 = (void *)sub_2493CA65C();
  v14 = (void *)sub_2493CA65C();
  v15 = objc_msgSend(v12, sel_initWithSourceLocale_targetLocale_, v13, v14);

  v16 = *(void (**)(char *, uint64_t))(v2 + 8);
  v16(v6, v1);
  v16(v9, v1);
  return v15;
}

void sub_2493BD3D0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(char *, uint64_t, uint64_t);
  int v47;
  void (*v48)(char *, uint64_t);
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  id v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  char *v65;
  unint64_t v66;
  id v67;
  unsigned int v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  char v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  id v99;
  _QWORD *v100;
  uint64_t v101;
  void *v102;
  char *v103;
  char *v104;
  __int128 v105;
  char *v106;
  char *v107;
  char *v108;
  char *v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  id v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;

  v1 = sub_2493CA680();
  v2 = *(_QWORD *)(v1 - 8);
  v4 = MEMORY[0x24BDAC7A8](v1, v3);
  v108 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v103 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578606D0);
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v109 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v103 - v14;
  v115 = sub_2493CA698();
  v112 = *(_QWORD *)(v115 - 8);
  v17 = MEMORY[0x24BDAC7A8](v115, v16);
  v104 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x24BDAC7A8](v17, v19);
  v103 = (char *)&v103 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20, v22);
  v107 = (char *)&v103 - v24;
  v26 = MEMORY[0x24BDAC7A8](v23, v25);
  v106 = (char *)&v103 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26, v28);
  v31 = (char *)&v103 - v30;
  v33 = MEMORY[0x24BDAC7A8](v29, v32);
  v114 = (char *)&v103 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33, v35);
  v38 = (char *)&v103 - v37;
  MEMORY[0x24BDAC7A8](v36, v39);
  v41 = (char *)&v103 - v40;
  sub_2493CA668();
  v113 = v0;
  v42 = objc_msgSend(v0, sel_sourceIdentifier);
  sub_2493CA704();

  sub_2493CA620();
  sub_2493CA68C();
  sub_2493CA674();
  v43 = *(void (**)(char *, uint64_t))(v2 + 8);
  v110 = v1;
  v43(v8, v1);
  v44 = sub_2493CA644();
  v45 = *(_QWORD *)(v44 - 8);
  v46 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v45 + 48);
  v47 = v46(v15, 1, v44);
  *(_QWORD *)&v105 = v45;
  if (v47 == 1)
  {
    sub_2493BFD2C((uint64_t)v15, &qword_2578606D0);
  }
  else
  {
    sub_2493CA638();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v15, v44);
  }
  v48 = *(void (**)(char *, uint64_t))(v112 + 8);
  v49 = v115;
  v48(v38, v115);
  v50 = sub_2493CA650();
  v52 = v51;
  swift_bridgeObjectRelease();
  v53 = v41;
  v54 = v49;
  v48(v53, v49);
  if (v52)
    v55 = v50;
  else
    v55 = 0;
  v56 = 0xE000000000000000;
  if (v52)
    v56 = v52;
  v111 = v55;
  v112 = v56;
  sub_2493CA668();
  v57 = v113;
  v58 = objc_msgSend(v113, sel_targetIdentifier);
  sub_2493CA704();

  sub_2493CA620();
  v59 = v108;
  sub_2493CA68C();
  v60 = (uint64_t)v109;
  sub_2493CA674();
  v43(v59, v110);
  if (v46((char *)v60, 1, v44) == 1)
  {
    sub_2493BFD2C(v60, &qword_2578606D0);
  }
  else
  {
    sub_2493CA638();
    (*(void (**)(uint64_t, uint64_t))(v105 + 8))(v60, v44);
  }
  v48(v31, v54);
  v61 = v114;
  v62 = sub_2493CA650();
  v64 = v63;
  swift_bridgeObjectRelease();
  v48(v61, v54);
  if (v64)
    v65 = (char *)v62;
  else
    v65 = 0;
  if (v64)
    v66 = v64;
  else
    v66 = 0xE000000000000000;
  v67 = sub_2493BD264();
  v68 = objc_msgSend(v67, sel_isPassthrough);

  if (v68)
  {
    swift_bridgeObjectRelease();
    v69 = (void *)sub_2493CA6F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v57, sel_setDisplayLocalePairText_, v69);

    return;
  }
  v108 = (char *)__swift_instantiateConcreteTypeFromMangledName(&qword_257860590);
  v70 = swift_allocObject();
  v105 = xmmword_2493CC680;
  *(_OWORD *)(v70 + 16) = xmmword_2493CC680;
  v71 = v112;
  *(_QWORD *)(v70 + 32) = v111;
  *(_QWORD *)(v70 + 40) = v71;
  v109 = v65;
  *(_QWORD *)(v70 + 48) = v65;
  *(_QWORD *)(v70 + 56) = v66;
  v122 = (_QWORD *)v70;
  swift_bridgeObjectRetain();
  v114 = (char *)v66;
  swift_bridgeObjectRetain();
  v72 = v106;
  sub_2493CA668();
  v120 = sub_2493CA62C();
  v121 = v73;
  v118 = 45;
  v119 = 0xE100000000000000;
  v116 = 95;
  v117 = 0xE100000000000000;
  sub_2493BFCE8();
  v110 = sub_2493CA83C();
  v75 = v74;
  swift_bridgeObjectRelease();
  v48(v72, v115);
  v76 = objc_msgSend(v57, sel_sourceIdentifier);
  sub_2493CA704();

  v77 = v107;
  sub_2493CA620();
  v120 = sub_2493CA62C();
  v121 = v78;
  v118 = 45;
  v119 = 0xE100000000000000;
  v116 = 95;
  v117 = 0xE100000000000000;
  v79 = v115;
  v80 = sub_2493CA83C();
  v82 = v81;
  swift_bridgeObjectRelease();
  v48(v77, v79);
  if (v110 == v80 && v75 == v82)
  {
    swift_bridgeObjectRelease_n();
LABEL_24:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_31;
  }
  v83 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v83 & 1) != 0)
    goto LABEL_24;
  v84 = v103;
  sub_2493CA668();
  v120 = sub_2493CA62C();
  v121 = v85;
  v118 = 45;
  v119 = 0xE100000000000000;
  v116 = 95;
  v117 = 0xE100000000000000;
  v110 = sub_2493CA83C();
  v87 = v86;
  swift_bridgeObjectRelease();
  v48(v84, v79);
  v88 = objc_msgSend(v113, sel_targetIdentifier);
  sub_2493CA704();

  v89 = v104;
  sub_2493CA620();
  v120 = sub_2493CA62C();
  v121 = v90;
  v118 = 45;
  v119 = 0xE100000000000000;
  v116 = 95;
  v117 = 0xE100000000000000;
  v91 = sub_2493CA83C();
  v93 = v92;
  swift_bridgeObjectRelease();
  v48(v89, v79);
  if (v110 == v91 && v87 == v93)
  {
    swift_bridgeObjectRelease_n();
    v94 = v109;
LABEL_29:
    v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = v105;
    v97 = v114;
    *(_QWORD *)(v96 + 32) = v94;
    *(_QWORD *)(v96 + 40) = v97;
    v98 = v112;
    *(_QWORD *)(v96 + 48) = v111;
    *(_QWORD *)(v96 + 56) = v98;
    swift_bridgeObjectRelease();
    v122 = (_QWORD *)v96;
    goto LABEL_31;
  }
  v95 = sub_2493CA9A4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v94 = v109;
  if ((v95 & 1) != 0)
    goto LABEL_29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2493BDD60(&v122);
LABEL_31:
  v99 = v113;
  v100 = v122;
  if (!v122[2])
  {
    __break(1u);
    goto LABEL_36;
  }
  v101 = v122[5];
  v120 = v122[4];
  v121 = v101;
  swift_bridgeObjectRetain_n();
  sub_2493CA728();
  swift_bridgeObjectRelease();
  if (v100[2] < 2uLL)
  {
LABEL_36:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2493CA728();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v102 = (void *)sub_2493CA6F8();
  swift_bridgeObjectRelease();
  objc_msgSend(v99, sel_setDisplayLocalePairText_, v102);
  swift_bridgeObjectRelease();

}

uint64_t sub_2493BDD60(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2493BF504(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_2493BE904(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_2493BDE88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_2493BCB64(v4);
  v0 = v5;
  v1 = v6;
  __swift_project_boxed_opaque_existential_1Tm(v4, v5);
  v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v0, v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  return v2;
}

BOOL sub_2493BDEEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5[3];
  uint64_t v6;
  uint64_t v7;

  sub_2493BC6A0(v5);
  v0 = v6;
  v1 = v7;
  __swift_project_boxed_opaque_existential_1Tm(v5, v6);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 16) + 16) + 8))(v0);
  v3 = v2;
  if (v2)
    swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
  return v3 == 0;
}

uint64_t sub_2493BDF60(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860688);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2493BF820(a1, (uint64_t)v7);
  v8 = *a2 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  sub_2493BF868((uint64_t)v7, v8);
  return swift_endAccess();
}

uint64_t sub_2493BE00C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  return sub_2493BF820(v3, a1);
}

uint64_t sub_2493BE05C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  sub_2493BF868(a1, v3);
  return swift_endAccess();
}

uint64_t (*sub_2493BE0B4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id PersistedTranslation.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PersistedTranslation.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for PersistedTranslation();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id PersistedTranslation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PersistedTranslation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2493BE2C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2493BE394(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2493BFD68((uint64_t)v12, *a3);
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
      sub_2493BFD68((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_2493BE394(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2493CA830();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2493BE54C(a5, a6);
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
  v8 = sub_2493CA86C();
  if (!v8)
  {
    sub_2493CA8B4();
    __break(1u);
LABEL_17:
    result = sub_2493CA8D8();
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

uint64_t sub_2493BE54C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2493BE5E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2493BE7B8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2493BE7B8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2493BE5E0(uint64_t a1, unint64_t a2)
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
      v3 = sub_2493BE754(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2493CA854();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2493CA8B4();
      __break(1u);
LABEL_10:
      v2 = sub_2493CA734();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2493CA8D8();
    __break(1u);
LABEL_14:
    result = sub_2493CA8B4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2493BE754(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578606E8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2493BE7B8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578606E8);
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
  result = sub_2493CA8D8();
  __break(1u);
  return result;
}

uint64_t sub_2493BE904(uint64_t *a1)
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
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_2493CA98C();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_2493BEFEC(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_2493BF0B8((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_2493BF4F0((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_2493CA77C();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (*v17 == v15 && v17[1] == v16)
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_2493CA9A4();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*v23 == *(v21 - 1) && v23[1] == *v21)
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_2493CA9A4()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_2493BF350(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_2493BF350((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_2493BF0B8((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = *(v38 - 2) == v35 && *(v38 - 1) == v36;
          if (v39 || (sub_2493CA9A4() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
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
LABEL_160:
  result = sub_2493CA8B4();
  __break(1u);
  return result;
}

uint64_t sub_2493BEFEC(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    v10 = *v9;
    v11 = v9[1];
    v12 = v6;
    v13 = (_QWORD *)v8;
    while (1)
    {
      result = *(v13 - 2);
      v14 = result == v10 && *(v13 - 1) == v11;
      if (v14 || (result = sub_2493CA9A4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v10 = *v13;
      v11 = v13[1];
      *(_OWORD *)v13 = *((_OWORD *)v13 - 1);
      *(v13 - 1) = v11;
      *(v13 - 2) = v10;
      v13 -= 2;
      if (v4 == ++v12)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_2493BF0B8(char *__src, char *a2, unint64_t a3, char *__dst)
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
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = v21 == *((_QWORD *)v17 - 2) && v22 == *((_QWORD *)v17 - 1);
          if (v23 || (sub_2493CA9A4() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v4 == *(_QWORD *)v6 && *((_QWORD *)v4 + 1) == *((_QWORD *)v6 + 1);
        if (v15 || (sub_2493CA9A4() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_2493BF448((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_2493CA8D8();
  __break(1u);
  return result;
}

char *sub_2493BF350(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578606E0);
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
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_2493BF448(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_2493CA8D8();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_2493BF4F0(uint64_t a1)
{
  return sub_2493BF350(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

_QWORD *sub_2493BF504(_QWORD *a1)
{
  return sub_2493C042C(0, a1[2], 0, a1);
}

uint64_t sub_2493BF518(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *boxed_opaque_existential_1;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  objc_super v19;
  _BYTE v20[40];
  uint64_t v21[5];

  v8 = sub_2493CA698();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = a3;
  v21[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  (*(void (**)(uint64_t))(*(_QWORD *)(a4 + 16) + 24))(a3);
  sub_2493CA62C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v14 = (void *)sub_2493CA6F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setSourceIdentifier_, v14);

  sub_2493B0774((uint64_t)v21, (uint64_t)v20);
  v15 = (objc_class *)type metadata accessor for AnySpeechResult();
  v16 = objc_allocWithZone(v15);
  sub_2493B0774((uint64_t)v20, (uint64_t)v16 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);
  v19.receiver = v16;
  v19.super_class = v15;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  objc_msgSend(a2, sel_setSourceInput_, v17);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_2493BF69C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t *boxed_opaque_existential_1;
  void *v14;
  objc_class *v15;
  id v16;
  id v17;
  objc_super v19;
  _BYTE v20[40];
  uint64_t v21[5];

  v8 = sub_2493CA698();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = a3;
  v21[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  (*(void (**)(uint64_t, uint64_t))(a4 + 16))(a3, a4);
  sub_2493CA62C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  v14 = (void *)sub_2493CA6F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTargetIdentifier_, v14);

  sub_2493B0774((uint64_t)v21, (uint64_t)v20);
  v15 = (objc_class *)type metadata accessor for AnyTranslationResult();
  v16 = objc_allocWithZone(v15);
  sub_2493B0774((uint64_t)v20, (uint64_t)v16 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);
  v19.receiver = v16;
  v19.super_class = v15;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  objc_msgSend(a2, sel_setTargetResult_, v17);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v21);
}

uint64_t sub_2493BF820(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2493BF868(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860688);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for PersistedTranslation()
{
  uint64_t result;

  result = qword_2578606B8;
  if (!qword_2578606B8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_2493BF8EC(uint64_t *a1@<X8>)
{
  sub_2493BC6A0(a1);
}

uint64_t sub_2493BF90C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2493BCA0C(a1, a2, a3, a4, (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))sub_2493BF518);
}

void sub_2493BF928(uint64_t *a1@<X8>)
{
  sub_2493BCB64(a1);
}

uint64_t sub_2493BF948(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_2493BCA0C(a1, a2, a3, a4, (void (*)(_BYTE *, uint64_t, uint64_t, uint64_t))sub_2493BF69C);
}

char *keypath_get_selector_ttsPlaybackRateDouble()
{
  return sel_ttsPlaybackRateDouble;
}

id sub_2493BF970@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_ttsPlaybackRateDouble);
  *a2 = v4;
  return result;
}

id sub_2493BF9A0(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTtsPlaybackRateDouble_, *a1);
}

uint64_t sub_2493BF9B4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = *a1 + OBJC_IVAR___PersistedTranslation_selfLoggingInvocationId;
  swift_beginAccess();
  return sub_2493BF820(v3, a2);
}

uint64_t sub_2493BFA0C()
{
  return type metadata accessor for PersistedTranslation();
}

void sub_2493BFA14()
{
  unint64_t v0;

  sub_2493BFC94();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for PersistedTranslation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PersistedTranslation.sourceLocale.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PersistedTranslation.targetLocale.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PersistedTranslation.isFavorite.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PersistedTranslation.displaySourceText.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PersistedTranslation.displayText.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PersistedTranslation.speechResult.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PersistedTranslation.translationResult.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PersistedTranslation.alternatives.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PersistedTranslation.hasAlternatives.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PersistedTranslation.disambiguableResult.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PersistedTranslation.showDisambiguation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x100))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x108))();
}

uint64_t dispatch thunk of PersistedTranslation.selfLoggingInvocationId.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x110))();
}

void sub_2493BFC94()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2578606C8)
  {
    sub_2493CA614();
    v0 = sub_2493CA818();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2578606C8);
  }
}

unint64_t sub_2493BFCE8()
{
  unint64_t result;

  result = qword_2578606D8;
  if (!qword_2578606D8)
  {
    result = MEMORY[0x2495AF458](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2578606D8);
  }
  return result;
}

uint64_t sub_2493BFD2C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2493BFD68(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t PersistedTranslation.selectedAlternativeIndex.getter()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v1 = (void *)sub_2493CA6F8();
  objc_msgSend(v0, sel_willAccessValueForKey_, v1);

  v2 = (void *)sub_2493CA6F8();
  v3 = objc_msgSend(v0, sel_primitiveValueForKey_, v2);

  if (v3)
  {
    sub_2493CA848();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  sub_2493BFEE4((uint64_t)v8, (uint64_t)v9);
  if (!v10)
  {
    sub_2493B181C((uint64_t)v9);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = v7;
LABEL_9:
  v5 = (void *)sub_2493CA6F8();
  objc_msgSend(v0, sel_didAccessValueForKey_, v5);

  return v4;
}

uint64_t sub_2493BFEE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static PersistedTranslation.fetchRequest()()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2493CA6F8();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_2493BFF98@<X0>(id *a1@<X0>, SEL *a2@<X3>, uint64_t a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    sub_2493CA5D8();

    v6 = sub_2493CA5F0();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 0;
  }
  else
  {
    v6 = sub_2493CA5F0();
    v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
    v8 = a3;
    v9 = 1;
  }
  return v7(v8, v9, 1, v6);
}

void sub_2493C0018(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2493C0A54(a1, (uint64_t)v11);
  v12 = *a2;
  v13 = sub_2493CA5F0();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1)
  {
    v15 = (void *)sub_2493CA5CC();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
  }
  objc_msgSend(v12, *a5, v15);

}

void PersistedTranslation.selectedAlternativeIndex.setter(uint64_t a1)
{
  void *v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  id v12;

  v3 = (void *)sub_2493CA6F8();
  objc_msgSend(v1, sel_willChangeValueForKey_, v3);

  v4 = (void *)sub_2493CA788();
  v5 = (void *)sub_2493CA6F8();
  objc_msgSend(v1, sel_setPrimitiveValue_forKey_, v4, v5);

  v6 = (void *)sub_2493CA6F8();
  objc_msgSend(v1, sel_didChangeValueForKey_, v6);

  v7 = objc_msgSend(v1, sel_interactedIndices);
  if (v7)
  {
    v8 = v7;
    v9 = (_QWORD *)sub_2493CA764();

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v9 = sub_2493C0538(0, v9[2] + 1, 1, v9);
    v11 = v9[2];
    v10 = v9[3];
    if (v11 >= v10 >> 1)
      v9 = sub_2493C0538((_QWORD *)(v10 > 1), v11 + 1, 1, v9);
    v9[2] = v11 + 1;
    v9[v11 + 4] = a1;
    v12 = (id)sub_2493CA758();
    swift_bridgeObjectRelease();
    objc_msgSend(v1, sel_setInteractedIndices_, v12);

  }
  else
  {
    objc_msgSend(v1, sel_setInteractedIndices_, 0);
  }
}

void (*PersistedTranslation.selectedAlternativeIndex.modify(uint64_t *a1))(uint64_t *a1)
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = PersistedTranslation.selectedAlternativeIndex.getter();
  return sub_2493C02FC;
}

void sub_2493C02FC(uint64_t *a1)
{
  PersistedTranslation.selectedAlternativeIndex.setter(*a1);
}

void sub_2493C031C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_interactedIndices);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2493CA764();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_2493C0380(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
    v3 = sub_2493CA758();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setInteractedIndices_);

}

void sub_2493C03DC(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = objc_msgSend(*a1, *a2);
  v5 = sub_2493CA704();
  v7 = v6;

  *a3 = v5;
  a3[1] = v7;
}

_QWORD *sub_2493C042C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860590);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2493C0964(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_2493C0538(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2578606F0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2493C0A9C(0, v8, (char *)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *keypath_get_selector_creationDate()
{
  return sel_creationDate;
}

uint64_t sub_2493C0650@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2493BFF98(a1, (SEL *)&selRef_creationDate, a2);
}

void sub_2493C066C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2493C0018(a1, a2, a3, a4, (SEL *)&selRef_setCreationDate_);
}

char *keypath_get_selector_favoriteDate()
{
  return sel_favoriteDate;
}

uint64_t sub_2493C0694@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2493BFF98(a1, (SEL *)&selRef_favoriteDate, a2);
}

void sub_2493C06B0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2493C0018(a1, a2, a3, a4, (SEL *)&selRef_setFavoriteDate_);
}

char *keypath_get_selector_identifier()
{
  return sel_identifier;
}

void sub_2493C06D8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_identifier, a2);
}

void sub_2493C06F4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setIdentifier_);
}

char *keypath_get_selector_sessionID()
{
  return sel_sessionID;
}

void sub_2493C070C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_sessionID, a2);
}

void sub_2493C0728(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setSessionID_);
}

char *keypath_get_selector_requestID()
{
  return sel_requestID;
}

void sub_2493C0740(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_requestID, a2);
}

void sub_2493C075C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setRequestID_);
}

char *keypath_get_selector_sourceInput()
{
  return sel_sourceInput;
}

id sub_2493C0774@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_sourceInput);
  *a2 = result;
  return result;
}

id sub_2493C07AC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSourceInput_, *a1);
}

char *keypath_get_selector_sourceIdentifier()
{
  return sel_sourceIdentifier;
}

void sub_2493C07CC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_sourceIdentifier, a2);
}

void sub_2493C07E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setSourceIdentifier_);
}

char *keypath_get_selector_targetIdentifier()
{
  return sel_targetIdentifier;
}

void sub_2493C0800(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_targetIdentifier, a2);
}

void sub_2493C081C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setTargetIdentifier_);
}

char *keypath_get_selector_targetResult()
{
  return sel_targetResult;
}

id sub_2493C0834@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_targetResult);
  *a2 = result;
  return result;
}

id sub_2493C086C(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTargetResult_, *a1);
}

uint64_t sub_2493C0880@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PersistedTranslation.selectedAlternativeIndex.getter();
  *a1 = result;
  return result;
}

void sub_2493C08A8(uint64_t *a1)
{
  PersistedTranslation.selectedAlternativeIndex.setter(*a1);
}

char *keypath_get_selector_interactedIndices()
{
  return sel_interactedIndices;
}

char *keypath_get_selector_displayLocalePairText()
{
  return sel_displayLocalePairText;
}

void sub_2493C08EC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_2493C03DC(a1, (SEL *)&selRef_displayLocalePairText, a2);
}

void sub_2493C0908(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  keypath_set_4Tm(a1, a2, a3, a4, (SEL *)&selRef_setDisplayLocalePairText_);
}

void keypath_set_4Tm(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  id v7;

  v6 = *a2;
  v7 = (id)sub_2493CA6F8();
  objc_msgSend(v6, *a5, v7);

}

uint64_t sub_2493C0964(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_2493CA8D8();
  __break(1u);
  return result;
}

uint64_t sub_2493C0A54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_2493C0A9C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 8 * a1 + 32);
    v6 = 8 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2493CA8D8();
  __break(1u);
  return result;
}

id static PersistedTranslation.favoritedFetchRequest()()
{
  return sub_2493C0DD8();
}

id static PersistedTranslation.favoritedSortedByLocalePairAndCreationDateFetchRequest()()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2493CA6F8();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_2493B83B0(0, &qword_2578606F8);
  v3 = (void *)sub_2493CA794();
  objc_msgSend(v2, sel_setPredicate_, v3);

  v4 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v5 = (void *)sub_2493CA6F8();
  v6 = objc_msgSend(v4, sel_initWithKey_ascending_, v5, 1);

  v7 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v8 = (void *)sub_2493CA6F8();
  v9 = objc_msgSend(v7, sel_initWithKey_ascending_, v8, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2493CC6E0;
  *(_QWORD *)(v10 + 32) = v6;
  *(_QWORD *)(v10 + 40) = v9;
  sub_2493CA770();
  sub_2493B83B0(0, &qword_257860708);
  v11 = v6;
  v12 = v9;
  v13 = (void *)sub_2493CA758();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setSortDescriptors_, v13);

  return v2;
}

id static PersistedTranslation.nilSourceOrTargetFetchRequest()()
{
  return sub_2493C0DD8();
}

id sub_2493C0DD8()
{
  id v0;
  void *v1;
  id v2;
  void *v3;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2493CA6F8();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  sub_2493B83B0(0, &qword_2578606F8);
  v3 = (void *)sub_2493CA794();
  objc_msgSend(v2, sel_setPredicate_, v3);

  return v2;
}

id static PersistedTranslation.favoritedSortedByCreationDateFetchRequest(localePair:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v5 = (void *)sub_2493CA6F8();
  v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  sub_2493B83B0(0, &qword_2578606F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860710);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2493CC570;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_2493C10B8();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  v8 = (void *)sub_2493CA794();
  objc_msgSend(v6, sel_setPredicate_, v8);

  v9 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v10 = (void *)sub_2493CA6F8();
  v11 = objc_msgSend(v9, sel_initWithKey_ascending_, v10, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_2493CC6F0;
  *(_QWORD *)(v12 + 32) = v11;
  sub_2493CA770();
  sub_2493B83B0(0, &qword_257860708);
  v13 = v11;
  v14 = (void *)sub_2493CA758();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setSortDescriptors_, v14);

  return v6;
}

unint64_t sub_2493C10B8()
{
  unint64_t result;

  result = qword_257860718;
  if (!qword_257860718)
  {
    result = MEMORY[0x2495AF458](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257860718);
  }
  return result;
}

id static PersistedTranslation.sortedByCreationDateFetchRequest(sessionIDs:)(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;

  v1 = _s22TranslationPersistence09PersistedA0C12fetchRequest10sessionIDsSo07NSFetchE0CyACGSaySSG_tFZ_0(a1);
  v2 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v3 = (void *)sub_2493CA6F8();
  v4 = objc_msgSend(v2, sel_initWithKey_ascending_, v3, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_2493CC6F0;
  *(_QWORD *)(v5 + 32) = v4;
  sub_2493CA770();
  sub_2493B83B0(0, &qword_257860708);
  v6 = v4;
  v7 = (void *)sub_2493CA758();
  swift_bridgeObjectRelease();
  objc_msgSend(v1, sel_setSortDescriptors_, v7);

  return v1;
}

id _s22TranslationPersistence09PersistedA0C12fetchRequest10sessionIDsSo07NSFetchE0CyACGSaySSG_tFZ_0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v2 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v3 = (void *)sub_2493CA6F8();
  v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    sub_2493CA890();
    sub_2493B83B0(0, &qword_2578606F8);
    v6 = (uint64_t *)(a1 + 40);
    v7 = MEMORY[0x24BEE0D00];
    do
    {
      v9 = *(v6 - 1);
      v8 = *v6;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860710);
      v10 = swift_allocObject();
      *(_OWORD *)(v10 + 16) = xmmword_2493CC570;
      *(_QWORD *)(v10 + 56) = v7;
      *(_QWORD *)(v10 + 64) = sub_2493C10B8();
      *(_QWORD *)(v10 + 32) = v9;
      *(_QWORD *)(v10 + 40) = v8;
      swift_bridgeObjectRetain_n();
      sub_2493CA794();
      swift_bridgeObjectRelease();
      sub_2493CA878();
      sub_2493CA89C();
      sub_2493CA8A8();
      sub_2493CA884();
      v6 += 2;
      --v5;
    }
    while (v5);
  }
  sub_2493B83B0(0, &qword_2578606F8);
  v11 = (void *)sub_2493CA758();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend((id)objc_opt_self(), sel_orPredicateWithSubpredicates_, v11);

  objc_msgSend(v4, sel_setPredicate_, v12);
  return v4;
}

id _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;

  v4 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v5 = (void *)sub_2493CA6F8();
  v6 = objc_msgSend(v4, sel_initWithEntityName_, v5);

  sub_2493B83B0(0, &qword_2578606F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860710);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2493CC570;
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_2493C10B8();
  *(_QWORD *)(v7 + 32) = a1;
  *(_QWORD *)(v7 + 40) = a2;
  swift_bridgeObjectRetain();
  v8 = (void *)sub_2493CA794();
  objc_msgSend(v6, sel_setPredicate_, v8);

  return v6;
}

uint64_t TranslationAlternative.displayString.getter(uint64_t a1, uint64_t a2)
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
  uint64_t v14;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v9 + 24) + 8))(v6);
  v12 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v2, a1);
  if (!v12)
    v10 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 16) + 8))(a1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, a1);
  return v10;
}

uint64_t TranslationResult.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v2 = (*(uint64_t (**)(void))(a2 + 24))();
  if (!*(_QWORD *)(v2 + 16))
  {
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_5;
  }
  sub_2493B0774(v2 + 32, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  v3 = *((_QWORD *)&v8 + 1);
  if (!*((_QWORD *)&v8 + 1))
  {
LABEL_5:
    sub_2493C16E8((uint64_t)&v7);
    v5 = 0;
    return v5 & 1;
  }
  v4 = v9;
  __swift_project_boxed_opaque_existential_1Tm(&v7, *((uint64_t *)&v8 + 1));
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 32))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v7);
  return v5 & 1;
}

uint64_t sub_2493C16E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of TranslationSense.senseID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationSense.definition.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationSense.sourceMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationSense.targetMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TranslationSense.labels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TranslationSense.isPhrasebookMatch.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of TranslationAlternative.isLowConfidence.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationAlternative.sensesMeta.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TranslationAlternative.romanization.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of TranslationResult.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationResult.alternatives.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationResult.isFinal.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

BOOL TranslationStore.hasFavorites.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))() > 0;
}

uint64_t dispatch thunk of TranslationStore.hasFavorites.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of TranslationStore.totalCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TranslationStore.favoriteCount.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of TranslationStore.getAllFavorites()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of TranslationStore.toggleFavorite(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of TranslationStore.toggleFavoriteBackground(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of TranslationStore.updateDisambiguation(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of TranslationStore.insert(speech:translationResult:isFavorite:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 64))();
}

uint64_t dispatch thunk of TranslationStore.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 72))();
}

uint64_t dispatch thunk of TranslationStore.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of TranslationStore.save()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of TranslationStore.translations(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 104))();
}

uint64_t dispatch thunk of TranslationStore.clearHistory(sessionID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 112))();
}

uint64_t dispatch thunk of TranslationStore.clear(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t sub_2493C182C(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
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
    sub_2493BA73C(0, v1, 0);
    v2 = v12;
    v4 = (_QWORD *)(a1 + 32);
    do
    {
      v5 = sub_2493C5E98(v4);
      v7 = v6;
      v9 = *(_QWORD *)(v12 + 16);
      v8 = *(_QWORD *)(v12 + 24);
      if (v9 >= v8 >> 1)
        sub_2493BA73C(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v12 + 16) = v9 + 1;
      v10 = v12 + 16 * v9;
      *(_QWORD *)(v10 + 32) = v5;
      *(_QWORD *)(v10 + 40) = v7;
      v4 += 5;
      --v1;
    }
    while (v1);
  }
  return v2;
}

id sub_2493C1904()
{
  uint64_t v0;
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
  char *v12;
  uint64_t ObjCClassFromMetadata;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void (*v18)(char *, char *, uint64_t);
  id v19;
  void *v20;
  id v21;
  char v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  void *v36;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  void *v43;
  _BYTE v45[24];
  ValueMetadata *v46;
  unint64_t v47;

  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257860830);
  MEMORY[0x24BDAC7A8](v0, v1);
  v3 = &v45[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v4 = sub_2493CA5B4();
  v5 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  v9 = &v45[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  MEMORY[0x24BDAC7A8](v7, v10);
  v12 = &v45[-v11 - 8];
  type metadata accessor for TranslationStoreCoreData();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v14 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v15 = (void *)sub_2493CA6F8();
  v16 = (void *)sub_2493CA6F8();
  v17 = objc_msgSend(v14, sel_URLForResource_withExtension_, v15, v16);

  if (!v17)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
    goto LABEL_11;
  }
  sub_2493CA59C();

  v18 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  v18(v3, v9, v4);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
LABEL_11:
    sub_2493BFD2C((uint64_t)v3, (uint64_t *)&unk_257860830);
    goto LABEL_12;
  }
  v18(v12, v3, v4);
  v19 = objc_allocWithZone(MEMORY[0x24BDBB6B0]);
  v20 = (void *)sub_2493CA590();
  v21 = objc_msgSend(v19, sel_initWithContentsOfURL_, v20);

  if (v21)
  {
    v46 = &type metadata for TranslationPersistenceFeatures;
    v47 = sub_2493B02F8();
    v22 = sub_2493CA6A4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
    if ((v22 & 1) != 0)
    {
      if (qword_2578600A0 != -1)
        swift_once();
      v23 = sub_2493CA6C8();
      __swift_project_value_buffer(v23, (uint64_t)qword_2578634C0);
      v24 = sub_2493CA6B0();
      v25 = sub_2493CA7A0();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_2493AE000, v24, v25, "Persistant container type: CloudKit", v26, 2u);
        MEMORY[0x2495AF4D0](v26, -1, -1);
      }

      v27 = objc_allocWithZone(MEMORY[0x24BDBB6D8]);
      v28 = v21;
      v29 = (void *)sub_2493CA6F8();
      v30 = objc_msgSend(v27, sel_initWithName_managedObjectModel_, v29, v28);

      sub_2493C1E98();
    }
    else
    {
      if (qword_2578600A0 != -1)
        swift_once();
      v38 = sub_2493CA6C8();
      __swift_project_value_buffer(v38, (uint64_t)qword_2578634C0);
      v39 = sub_2493CA6B0();
      v40 = sub_2493CA7A0();
      if (os_log_type_enabled(v39, v40))
      {
        v41 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v41 = 0;
        _os_log_impl(&dword_2493AE000, v39, v40, "Persistant container type: Local", v41, 2u);
        MEMORY[0x2495AF4D0](v41, -1, -1);
      }

      v42 = objc_allocWithZone(MEMORY[0x24BDBB700]);
      v43 = (void *)sub_2493CA6F8();
      v30 = objc_msgSend(v42, sel_initWithName_managedObjectModel_, v43, v21);

    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
    return v30;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
LABEL_12:
  if (qword_2578600A0 != -1)
    swift_once();
  v31 = sub_2493CA6C8();
  __swift_project_value_buffer(v31, (uint64_t)qword_2578634C0);
  v32 = sub_2493CA6B0();
  v33 = sub_2493CA7B8();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v34 = 0;
    _os_log_impl(&dword_2493AE000, v32, v33, "Failed to load core data model from bundle", v34, 2u);
    MEMORY[0x2495AF4D0](v34, -1, -1);
  }

  v35 = objc_allocWithZone(MEMORY[0x24BDBB700]);
  v36 = (void *)sub_2493CA6F8();
  v30 = objc_msgSend(v35, sel_initWithName_, v36);

  return v30;
}

void sub_2493C1E98()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  NSObject *oslog;

  v1 = v0;
  if (qword_2578600A0 != -1)
    swift_once();
  v2 = sub_2493CA6C8();
  __swift_project_value_buffer(v2, (uint64_t)qword_2578634C0);
  v3 = sub_2493CA6B0();
  v4 = sub_2493CA7A0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2493AE000, v3, v4, "Enable E2E encryption for persistent stores", v5, 2u);
    MEMORY[0x2495AF4D0](v5, -1, -1);
  }

  v6 = objc_msgSend(v0, sel_persistentStoreDescriptions);
  sub_2493B83B0(0, &qword_257860820);
  v7 = sub_2493CA764();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (!v8)
  {
    oslog = sub_2493CA6B0();
    v18 = sub_2493CA7B8();
    if (os_log_type_enabled(oslog, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_2493AE000, oslog, v18, "Failed to enable E2E encryption due to no persistent store descriptions", v19, 2u);
      MEMORY[0x2495AF4D0](v19, -1, -1);
    }
    goto LABEL_21;
  }
  v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB9048]), sel_init);
  objc_msgSend(v9, sel_setUseZoneWidePCS_, 1);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB608]), sel_init);
  objc_msgSend(v10, sel_setUseDeviceToDeviceEncryption_, 1);
  v20 = v9;
  objc_msgSend(v10, sel_setCkContainerOptions_, v9);
  oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB600]), sel_initWithOptions_, v10);
  v11 = objc_msgSend(v1, sel_persistentStoreDescriptions);
  v12 = sub_2493CA764();

  if (!(v12 >> 62))
  {
    v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_10;
LABEL_20:
    swift_bridgeObjectRelease_n();
    sub_2493C5540(1);

LABEL_21:
    return;
  }
  swift_bridgeObjectRetain();
  v13 = sub_2493CA8C0();
  if (!v13)
    goto LABEL_20;
LABEL_10:
  if (v13 >= 1)
  {
    v14 = 0;
    do
    {
      if ((v12 & 0xC000000000000001) != 0)
        v15 = (id)MEMORY[0x2495AEF30](v14, v12);
      else
        v15 = *(id *)(v12 + 8 * v14 + 32);
      v16 = v15;
      ++v14;
      sub_2493CA704();
      v17 = (void *)sub_2493CA6F8();
      swift_bridgeObjectRelease();
      objc_msgSend(v16, sel_setOption_forMirroringKey_, oslog, v17);

    }
    while (v13 != v14);
    goto LABEL_20;
  }
  __break(1u);
}

id TranslationStoreCoreData.persistentContainer.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t TranslationStoreCoreData.__allocating_init(inMemoryOnly:)(char a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(a1);
  return v2;
}

uint64_t TranslationStoreCoreData.init(inMemoryOnly:)(char a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;

  *(_QWORD *)(v1 + 16) = sub_2493C1904();
  *(_QWORD *)(v1 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF64D0]), sel_init);
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SourceInputValueTransformer()), sel_init);
  if (qword_2578600A8 != -1)
    swift_once();
  objc_msgSend(v3, sel_setValueTransformer_forName_, v4, qword_2578634D8);

  v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TargetResultValueTransformer()), sel_init);
  if (qword_2578600B0 != -1)
    swift_once();
  objc_msgSend(v3, sel_setValueTransformer_forName_, v5, qword_2578634E0);

  sub_2493C23A4(a1 & 1);
  return v1;
}

void sub_2493C23A4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[6];

  v2 = v1;
  if ((a1 & 1) != 0)
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBB740]), sel_init);
    objc_msgSend(v3, sel_setType_, *MEMORY[0x24BDBB418]);
    v4 = *(void **)(v1 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_2493CC6F0;
    *(_QWORD *)(v5 + 32) = v3;
    v26[0] = v5;
    sub_2493CA770();
    sub_2493B83B0(0, &qword_257860820);
    v6 = v3;
    v7 = (void *)sub_2493CA758();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setPersistentStoreDescriptions_, v7, v26[0]);

  }
  v8 = *(void **)(v1 + 16);
  v9 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  sub_2493B83B0(0, &qword_257860820);
  v10 = sub_2493CA764();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_5;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_5:
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x2495AEF30](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    v11 = *(id *)(v10 + 32);
  }
  v12 = v11;
  swift_bridgeObjectRelease();
  sub_2493B83B0(0, &qword_257860828);
  v13 = (void *)sub_2493CA800();
  objc_msgSend(v12, sel_setOption_forKey_, v13, *MEMORY[0x24BDBB4C8]);

LABEL_11:
  v15 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  v10 = sub_2493CA764();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
    if (v19)
    {
LABEL_13:
      if ((v10 & 0xC000000000000001) == 0)
      {
        if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_32;
        }
        v16 = *(id *)(v10 + 32);
        goto LABEL_16;
      }
LABEL_30:
      v16 = (id)MEMORY[0x2495AEF30](0, v10);
LABEL_16:
      v17 = v16;
      swift_bridgeObjectRelease();
      sub_2493B83B0(0, &qword_257860828);
      v18 = (void *)sub_2493CA800();
      objc_msgSend(v17, sel_setOption_forKey_, v18, *MEMORY[0x24BDBB488]);

      goto LABEL_19;
    }
  }
  else if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_13;
  }
  swift_bridgeObjectRelease();
LABEL_19:
  v20 = objc_msgSend(v8, sel_persistentStoreDescriptions);
  v10 = sub_2493CA764();

  if (!(v10 >> 62))
  {
    if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_21;
LABEL_26:
    swift_bridgeObjectRelease();
    goto LABEL_27;
  }
  swift_bridgeObjectRetain();
  v24 = sub_2493CA8C0();
  swift_bridgeObjectRelease();
  if (!v24)
    goto LABEL_26;
LABEL_21:
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_32:
    v21 = (id)MEMORY[0x2495AEF30](0, v10);
    goto LABEL_24;
  }
  if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v21 = *(id *)(v10 + 32);
LABEL_24:
    v22 = v21;
    swift_bridgeObjectRelease();
    sub_2493B83B0(0, &qword_257860828);
    v23 = (void *)sub_2493CA800();
    objc_msgSend(v22, sel_setOption_forKey_, v23, *MEMORY[0x24BDBB420]);

LABEL_27:
    v26[4] = sub_2493CA3EC;
    v26[5] = v2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 1107296256;
    v26[2] = sub_2493C3864;
    v26[3] = &block_descriptor_83;
    v25 = _Block_copy(v26);
    swift_retain();
    swift_release();
    objc_msgSend(v8, sel_loadPersistentStoresWithCompletionHandler_, v25);
    _Block_release(v25);
    return;
  }
  __break(1u);
}

void sub_2493C2844(void *a1, uint64_t a2, _QWORD *a3)
{
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
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  uint8_t *v24;
  id v25;
  _QWORD *v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  _QWORD *v32;
  id v33;
  _QWORD *v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  _QWORD *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  uint64_t v69;
  NSObject *v70;
  os_log_type_t v71;
  uint8_t *v72;
  id v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  NSObject *v77;
  os_log_type_t v78;
  uint8_t *v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  id v84;
  uint64_t v85;
  _QWORD *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  _QWORD *v92;
  id aBlock[8];

  aBlock[7] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_2493CA5B4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257860830);
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v90 = (char *)&v85 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v15);
  v91 = (uint64_t)&v85 - v16;
  v92 = a3;
  v17 = &unk_257860000;
  if (!a2)
  {
    if (qword_2578600A0 == -1)
      goto LABEL_7;
    goto LABEL_51;
  }
  v18 = (void *)sub_2493CA56C();
  if (qword_2578600A0 != -1)
    swift_once();
  v19 = sub_2493CA6C8();
  __swift_project_value_buffer(v19, (uint64_t)qword_2578634C0);
  v20 = v18;
  v21 = sub_2493CA6B0();
  v22 = sub_2493CA7B8();
  v23 = os_log_type_enabled(v21, v22);
  v88 = v7;
  v89 = v6;
  v87 = v10;
  if (v23)
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v86 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v24 = 138412290;
    aBlock[0] = v20;
    v25 = v20;
    a3 = v92;
    sub_2493CA824();
    v26 = v86;
    *v86 = v20;

    v17 = (_QWORD *)&unk_257860000;
    _os_log_impl(&dword_2493AE000, v21, v22, "Failed to load Persistent Store on first try: %@", v24, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
    swift_arrayDestroy();
    MEMORY[0x2495AF4D0](v26, -1, -1);
    MEMORY[0x2495AF4D0](v24, -1, -1);

  }
  else
  {

  }
  a3 = (_QWORD *)a3[2];
  v35 = objc_msgSend(a3, sel_persistentStoreDescriptions);
  a1 = (void *)sub_2493B83B0(0, &qword_257860820);
  v36 = sub_2493CA764();

  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    v37 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v37 < 1)
  {

    a3 = v92;
    goto LABEL_29;
  }
  v38 = objc_msgSend(a3, sel_persistentStoreDescriptions);
  v39 = sub_2493CA764();

  if ((v39 & 0xC000000000000001) != 0)
  {
    v42 = (id)MEMORY[0x2495AEF30](0, v39);
    v41 = v88;
    v40 = v89;
    goto LABEL_16;
  }
  v41 = v88;
  v40 = v89;
  if (!*(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    __break(1u);
LABEL_51:
    swift_once();
LABEL_7:
    v27 = sub_2493CA6C8();
    __swift_project_value_buffer(v27, (uint64_t)qword_2578634C0);
    v28 = a1;
    v29 = sub_2493CA6B0();
    v30 = sub_2493CA7A0();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      v32 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v31 = 138477827;
      aBlock[0] = v28;
      v33 = v28;
      v17 = (_QWORD *)&unk_257860000;
      sub_2493CA824();
      *v32 = v28;

      _os_log_impl(&dword_2493AE000, v29, v30, "Successfully loaded Persistent Store on first try: %{private}@", v31, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      v34 = v32;
      a3 = v92;
      MEMORY[0x2495AF4D0](v34, -1, -1);
      MEMORY[0x2495AF4D0](v31, -1, -1);

    }
    else
    {

    }
    goto LABEL_29;
  }
  v42 = *(id *)(v39 + 32);
LABEL_16:
  swift_bridgeObjectRelease();
  v43 = objc_msgSend(v42, sel_URL);

  if (v43)
  {
    v44 = (uint64_t)v90;
    sub_2493CA59C();

    v45 = 0;
  }
  else
  {
    v45 = 1;
    v44 = (uint64_t)v90;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v41 + 56))(v44, v45, 1, v40);
  v46 = v91;
  sub_2493CA3F4(v44, v91);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v46, 1, v40))
  {

    sub_2493BFD2C(v46, (uint64_t *)&unk_257860830);
    a3 = v92;
  }
  else
  {
    v47 = v87;
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v87, v46, v40);
    sub_2493BFD2C(v46, (uint64_t *)&unk_257860830);
    sub_2493CA5A8();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v47, v40);
    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1580]), sel_init);
    v49 = (void *)sub_2493CA6F8();
    swift_bridgeObjectRelease();
    aBlock[0] = 0;
    LODWORD(v47) = objc_msgSend(v48, sel_removeItemAtPath_error_, v49, aBlock);

    v50 = aBlock[0];
    if ((_DWORD)v47)
    {
      aBlock[4] = sub_2493C3548;
      aBlock[5] = 0;
      aBlock[0] = (id)MEMORY[0x24BDAC760];
      aBlock[1] = (id)1107296256;
      aBlock[2] = sub_2493C3864;
      aBlock[3] = &block_descriptor_86;
      v51 = _Block_copy(aBlock);
      v52 = v50;
      objc_msgSend(a3, sel_loadPersistentStoresWithCompletionHandler_, v51);

      _Block_release(v51);
      a3 = v92;
    }
    else
    {
      v53 = aBlock[0];
      v54 = (void *)sub_2493CA578();

      swift_willThrow();
      v55 = v54;
      v56 = v54;
      v57 = sub_2493CA6B0();
      v58 = sub_2493CA7B8();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        v60 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v59 = 138412290;
        v61 = v20;
        v62 = (void *)sub_2493CA56C();
        aBlock[0] = v62;
        sub_2493CA824();
        *v60 = v62;

        _os_log_impl(&dword_2493AE000, v57, v58, "File manager failed to delete sqlite file: %@", v59, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
        swift_arrayDestroy();
        MEMORY[0x2495AF4D0](v60, -1, -1);
        MEMORY[0x2495AF4D0](v59, -1, -1);

      }
      else
      {

      }
      a3 = v92;
      v17 = &unk_257860000;
    }
  }
LABEL_29:
  v63 = (void *)a3[2];
  v64 = objc_msgSend(v63, sel_viewContext);
  objc_msgSend(v64, sel_setAutomaticallyMergesChangesFromParent_, 1);

  v65 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v66 = (void *)sub_2493CA6F8();
  v67 = objc_msgSend(v65, sel_initWithEntityName_, v66);

  sub_2493B83B0(0, &qword_2578606F8);
  v68 = (void *)sub_2493CA794();
  objc_msgSend(v67, sel_setPredicate_, v68);

  if (v17[20] != -1)
    swift_once();
  v69 = sub_2493CA6C8();
  __swift_project_value_buffer(v69, (uint64_t)qword_2578634C0);
  v70 = sub_2493CA6B0();
  v71 = sub_2493CA7A0();
  if (os_log_type_enabled(v70, v71))
  {
    v72 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v72 = 0;
    _os_log_impl(&dword_2493AE000, v70, v71, "Attempt to delete invalid data", v72, 2u);
    MEMORY[0x2495AF4D0](v72, -1, -1);
  }

  v73 = objc_msgSend(v63, sel_viewContext);
  type metadata accessor for PersistedTranslation();
  v74 = sub_2493CA7F4();

  v75 = v74 >> 62;
  if (!(v74 >> 62))
  {
    v76 = *(_QWORD *)((v74 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v76 >= 1)
      goto LABEL_35;
LABEL_53:
    swift_bridgeObjectRelease();
    goto LABEL_54;
  }
  swift_bridgeObjectRetain();
  v76 = sub_2493CA8C0();
  swift_bridgeObjectRelease();
  if (v76 < 1)
    goto LABEL_53;
LABEL_35:
  swift_bridgeObjectRetain();
  v77 = sub_2493CA6B0();
  v78 = sub_2493CA7C4();
  if (os_log_type_enabled(v77, v78))
  {
    v79 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v79 = 134217984;
    aBlock[0] = (id)v76;
    sub_2493CA824();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2493AE000, v77, v78, "Found %ld translations with invalid source or target", v79, 0xCu);
    MEMORY[0x2495AF4D0](v79, -1, -1);

    if (v75)
      goto LABEL_37;
  }
  else
  {

    swift_bridgeObjectRelease();
    if (v75)
    {
LABEL_37:
      swift_bridgeObjectRetain();
      v80 = sub_2493CA8C0();
      swift_bridgeObjectRelease();
      if (!v80)
        goto LABEL_47;
LABEL_41:
      if (v80 < 1)
        __break(1u);
      v81 = 0;
      do
      {
        if ((v74 & 0xC000000000000001) != 0)
          v82 = (id)MEMORY[0x2495AEF30](v81, v74);
        else
          v82 = *(id *)(v74 + 8 * v81 + 32);
        v83 = v82;
        ++v81;
        v84 = objc_msgSend(v63, sel_viewContext);
        objc_msgSend(v84, sel_deleteObject_, v83);

      }
      while (v80 != v81);
      goto LABEL_47;
    }
  }
  v80 = *(_QWORD *)((v74 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v80)
    goto LABEL_41;
LABEL_47:
  swift_bridgeObjectRelease();
  sub_2493C38FC();
LABEL_54:

}

void sub_2493C3548(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;
  id v15;

  if (a2)
  {
    v2 = (void *)sub_2493CA56C();
    if (qword_2578600A0 != -1)
      swift_once();
    v3 = sub_2493CA6C8();
    __swift_project_value_buffer(v3, (uint64_t)qword_2578634C0);
    v15 = v2;
    v4 = sub_2493CA6B0();
    v5 = sub_2493CA7B8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v6 = 138412290;
      v8 = v15;
      sub_2493CA824();
      *v7 = v15;

      _os_log_impl(&dword_2493AE000, v4, v5, "Failed to load Persistent Store on second try: %@", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v7, -1, -1);
      MEMORY[0x2495AF4D0](v6, -1, -1);

LABEL_10:
      return;
    }

  }
  else
  {
    if (qword_2578600A0 != -1)
      swift_once();
    v10 = sub_2493CA6C8();
    __swift_project_value_buffer(v10, (uint64_t)qword_2578634C0);
    v15 = a1;
    v4 = sub_2493CA6B0();
    v11 = sub_2493CA7A0();
    if (os_log_type_enabled(v4, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138477827;
      v14 = v15;
      sub_2493CA824();
      *v13 = v15;

      _os_log_impl(&dword_2493AE000, v4, v11, "Successfully loaded Persistent Store on second try: %{private}@", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v13, -1, -1);
      MEMORY[0x2495AF4D0](v12, -1, -1);
      goto LABEL_10;
    }

  }
}

void sub_2493C3864(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

id sub_2493C38D8()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
}

void sub_2493C38FC()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  if (objc_msgSend(v12, sel_hasChanges))
  {
    v13[0] = 0;
    if (objc_msgSend(v12, sel_save_, v13))
    {
      v1 = v13[0];

    }
    else
    {
      v2 = v13[0];
      v3 = (void *)sub_2493CA578();

      swift_willThrow();
      if (qword_2578600A0 != -1)
        swift_once();
      v4 = sub_2493CA6C8();
      __swift_project_value_buffer(v4, (uint64_t)qword_2578634C0);
      v5 = v3;
      v6 = v3;
      v7 = sub_2493CA6B0();
      v8 = sub_2493CA7B8();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        v10 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v9 = 138412290;
        v11 = (void *)sub_2493CA56C();
        v13[0] = v11;
        sub_2493CA824();
        *v10 = v11;

        _os_log_impl(&dword_2493AE000, v7, v8, "Failed to save view context: %@", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
        swift_arrayDestroy();
        MEMORY[0x2495AF4D0](v10, -1, -1);
        MEMORY[0x2495AF4D0](v9, -1, -1);

      }
      else
      {

      }
    }
  }
  else
  {

  }
}

uint64_t TranslationStoreCoreData.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t TranslationStoreCoreData.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_2493C3BE4()
{
  return TranslationStoreCoreData.totalCount.getter();
}

uint64_t TranslationStoreCoreData.totalCount.getter()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;

  v1 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v2 = (void *)sub_2493CA6F8();
  v3 = objc_msgSend(v1, sel_initWithEntityName_, v2);

  v4 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  v5 = sub_2493CA7E8();

  return v5;
}

uint64_t sub_2493C3E60()
{
  return TranslationStoreCoreData.favoriteCount.getter();
}

uint64_t TranslationStoreCoreData.favoriteCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = v0;
  v2 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v3 = (void *)sub_2493CA6F8();
  v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  sub_2493B83B0(0, &qword_2578606F8);
  v5 = (void *)sub_2493CA794();
  objc_msgSend(v4, sel_setPredicate_, v5);

  v6 = objc_msgSend(*(id *)(v1 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  v7 = sub_2493CA7E8();

  return v7;
}

uint64_t sub_2493C413C()
{
  return TranslationStoreCoreData.getAllFavorites()();
}

uint64_t TranslationStoreCoreData.getAllFavorites()()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;

  v1 = v0;
  v2 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v3 = (void *)sub_2493CA6F8();
  v4 = objc_msgSend(v2, sel_initWithEntityName_, v3);

  sub_2493B83B0(0, &qword_2578606F8);
  v5 = (void *)sub_2493CA794();
  objc_msgSend(v4, sel_setPredicate_, v5);

  v6 = objc_msgSend(*(id *)(v1 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  v7 = sub_2493CA7F4();

  return v7;
}

void sub_2493C43FC(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  v3 = *v1;
  v4 = *(void **)(v3 + 16);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v3;
  v8[4] = sub_2493CA4FC;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_2493C641C;
  v8[3] = &block_descriptor_80;
  v6 = _Block_copy(v8);
  v7 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v4, sel_performBackgroundTask_, v6);
  _Block_release(v6);
}

void TranslationStoreCoreData.toggleFavoriteBackground(_:)(void *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  v3 = *(void **)(v1 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = v1;
  v7[4] = sub_2493C94F8;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2493C641C;
  v7[3] = &block_descriptor;
  v5 = _Block_copy(v7);
  v6 = a1;
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void sub_2493C4590(void *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  v3 = *(void **)(*(_QWORD *)v1 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  v7[4] = sub_2493CA480;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2493C641C;
  v7[3] = &block_descriptor_73;
  v5 = _Block_copy(v7);
  v6 = a1;
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void TranslationStoreCoreData.updateDisambiguation(for:)(void *a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[6];

  v3 = *(void **)(v1 + 16);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  v7[4] = sub_2493C953C;
  v7[5] = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_2493C641C;
  v7[3] = &block_descriptor_6;
  v5 = _Block_copy(v7);
  v6 = a1;
  swift_release();
  objc_msgSend(v3, sel_performBackgroundTask_, v5);
  _Block_release(v5);
}

void *sub_2493C4704(_QWORD *a1, _QWORD *a2, int a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v6 = *v3;
  v7 = a1[3];
  v8 = a1[4];
  v9 = __swift_project_boxed_opaque_existential_1Tm(a1, v7);
  v10 = a2[3];
  v11 = a2[4];
  v12 = __swift_project_boxed_opaque_existential_1Tm(a2, v10);
  return sub_2493C8F68((uint64_t)v9, (uint64_t)v12, a3, v6, v7, v10, v8, v11);
}

void *TranslationStoreCoreData.insert(speech:translationResult:isFavorite:)(_QWORD *a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = a1[3];
  v7 = a1[4];
  v8 = __swift_project_boxed_opaque_existential_1Tm(a1, v6);
  v9 = a2[3];
  v10 = a2[4];
  v11 = __swift_project_boxed_opaque_existential_1Tm(a2, v9);
  return sub_2493C8F68((uint64_t)v8, (uint64_t)v11, a3, v3, v6, v9, v7, v10);
}

uint64_t sub_2493C47F8(void *a1, uint64_t a2, uint64_t a3)
{
  return TranslationStoreCoreData.deleteBackground(_:completion:)(a1, a2, a3);
}

uint64_t TranslationStoreCoreData.deleteBackground(_:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  _QWORD v15[6];

  v4 = v3;
  v7 = objc_msgSend(a1, sel_identifier);
  v8 = sub_2493CA704();
  v10 = v9;

  v11 = *(void **)(v4 + 16);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v8;
  v12[3] = v10;
  v12[4] = v4;
  v12[5] = a2;
  v12[6] = a3;
  v15[4] = sub_2493C9548;
  v15[5] = v12;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_2493C641C;
  v15[3] = &block_descriptor_12;
  v13 = _Block_copy(v15);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_performBackgroundTask_, v13);
  _Block_release(v13);
  return swift_bridgeObjectRelease();
}

void sub_2493C492C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[6];

  v9 = *v4;
  v10 = *(void **)(v9 + 16);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  v13[4] = sub_2493C9548;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2493C641C;
  v13[3] = &block_descriptor_66;
  v12 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBackgroundTask_, v12);
  _Block_release(v12);
}

void TranslationStoreCoreData.deleteBackground(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[6];

  v9 = *(void **)(v4 + 16);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = v4;
  v10[5] = a3;
  v10[6] = a4;
  v12[4] = sub_2493C9548;
  v12[5] = v10;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_2493C641C;
  v12[3] = &block_descriptor_19;
  v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBackgroundTask_, v11);
  _Block_release(v11);
}

void sub_2493C4B00()
{
  TranslationStoreCoreData.save()();
}

Swift::Void __swiftcall TranslationStoreCoreData.save()()
{
  uint64_t v0;
  id v1;
  unsigned int v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
  v13[0] = 0;
  v2 = objc_msgSend(v1, sel_save_, v13);

  if (v2)
  {
    v3 = v13[0];
  }
  else
  {
    v4 = v13[0];
    v5 = (void *)sub_2493CA578();

    swift_willThrow();
    if (qword_2578600A0 != -1)
      swift_once();
    v6 = sub_2493CA6C8();
    __swift_project_value_buffer(v6, (uint64_t)qword_2578634C0);
    v7 = v5;
    v8 = sub_2493CA6B0();
    v9 = sub_2493CA7B8();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      v12 = (void *)sub_2493CA56C();
      v13[0] = v12;
      sub_2493CA824();
      *v11 = v12;

      _os_log_impl(&dword_2493AE000, v8, v9, "Failed to save: %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v11, -1, -1);
      MEMORY[0x2495AF4D0](v10, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_2493C4D74(uint64_t a1, uint64_t a2)
{
  return TranslationStoreCoreData.translations(with:)(a1, a2);
}

uint64_t TranslationStoreCoreData.translations(with:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;

  v3 = v2;
  v6 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v7 = (void *)sub_2493CA6F8();
  v8 = objc_msgSend(v6, sel_initWithEntityName_, v7);

  sub_2493B83B0(0, &qword_2578606F8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860710);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2493CC570;
  *(_QWORD *)(v9 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v9 + 64) = sub_2493C10B8();
  *(_QWORD *)(v9 + 32) = a1;
  *(_QWORD *)(v9 + 40) = a2;
  swift_bridgeObjectRetain();
  v10 = (void *)sub_2493CA794();
  objc_msgSend(v8, sel_setPredicate_, v10);

  v11 = objc_allocWithZone(MEMORY[0x24BDD17C0]);
  v12 = (void *)sub_2493CA6F8();
  v13 = objc_msgSend(v11, sel_initWithKey_ascending_, v12, 0);

  __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2493CC6F0;
  *(_QWORD *)(v14 + 32) = v13;
  sub_2493CA770();
  sub_2493B83B0(0, &qword_257860708);
  v15 = v13;
  v16 = (void *)sub_2493CA758();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setSortDescriptors_, v16);

  v17 = objc_msgSend(*(id *)(v3 + 16), sel_viewContext);
  type metadata accessor for PersistedTranslation();
  v18 = sub_2493CA7F4();

  return v18;
}

void sub_2493C500C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];

  v5 = *v2;
  v6 = *(void **)(v5 + 16);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v5;
  v7[5] = a1;
  v7[6] = a2;
  v9[4] = sub_2493C955C;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2493C641C;
  v9[3] = &block_descriptor_59;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBackgroundTask_, v8);
  _Block_release(v8);
}

void TranslationStoreCoreData.clearHistory(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[6];

  v5 = *(void **)(v2 + 16);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v2;
  v6[5] = a1;
  v6[6] = a2;
  v8[4] = sub_2493C955C;
  v8[5] = v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_2493C641C;
  v8[3] = &block_descriptor_25;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_performBackgroundTask_, v7);
  _Block_release(v7);
}

void sub_2493C51C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  _QWORD v13[6];

  v9 = *v4;
  v10 = *(void **)(v9 + 16);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = v9;
  v11[5] = a3;
  v11[6] = a4;
  v13[4] = sub_2493C955C;
  v13[5] = v11;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2493C641C;
  v13[3] = &block_descriptor_52;
  v12 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_performBackgroundTask_, v12);
  _Block_release(v12);
}

void TranslationStoreCoreData.clearHistory(sessionID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[6];

  v9 = *(void **)(v4 + 16);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = a2;
  v10[4] = v4;
  v10[5] = a3;
  v10[6] = a4;
  v12[4] = sub_2493C955C;
  v12[5] = v10;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_2493C641C;
  v12[3] = &block_descriptor_32;
  v11 = _Block_copy(v12);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_performBackgroundTask_, v11);
  _Block_release(v11);
}

void sub_2493C5394(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  _QWORD v9[6];

  v5 = *v2;
  v6 = *(void **)(v5 + 16);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v5;
  v7[3] = a1;
  v7[4] = a2;
  v9[4] = sub_2493CA484;
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2493C641C;
  v9[3] = &block_descriptor_45;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBackgroundTask_, v8);
  _Block_release(v8);
}

void TranslationStoreCoreData.clear(completion:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v8[6];

  v5 = *(void **)(v2 + 16);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v2;
  v6[3] = a1;
  v6[4] = a2;
  v8[4] = sub_2493C9570;
  v8[5] = v6;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_2493C641C;
  v8[3] = &block_descriptor_38;
  v7 = _Block_copy(v8);
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v5, sel_performBackgroundTask_, v7);
  _Block_release(v7);
}

uint64_t sub_2493C5540(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v2 = v1;
  v4 = sub_2493CA560();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2578600A0 != -1)
    swift_once();
  v9 = sub_2493CA6C8();
  __swift_project_value_buffer(v9, (uint64_t)qword_2578634C0);
  v10 = sub_2493CA6B0();
  v11 = sub_2493CA7A0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v12 = 67109120;
    LODWORD(v21) = a1 & 1;
    sub_2493CA824();
    _os_log_impl(&dword_2493AE000, v10, v11, "Exclude persistent stores from iCloud Backup: %{BOOL}d", v12, 8u);
    MEMORY[0x2495AF4D0](v12, -1, -1);
  }

  sub_2493CA554();
  sub_2493CA548();
  v13 = objc_msgSend(v2, sel_persistentStoreDescriptions);
  sub_2493B83B0(0, &qword_257860820);
  v14 = sub_2493CA764();

  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_7;
LABEL_14:
    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  }
  swift_bridgeObjectRetain();
  result = sub_2493CA8C0();
  v15 = result;
  if (!result)
    goto LABEL_14;
LABEL_7:
  if (v15 >= 1)
  {
    v17 = 0;
    do
    {
      if ((v14 & 0xC000000000000001) != 0)
        v18 = (id)MEMORY[0x2495AEF30](v17, v14);
      else
        v18 = *(id *)(v14 + 8 * v17 + 32);
      v19 = v18;
      ++v17;
      v21 = v18;
      sub_2493C57B0(&v21, (uint64_t)v8);

    }
    while (v15 != v17);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

void sub_2493C57B0(id *a1, uint64_t a2)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;

  v37 = a2;
  v3 = sub_2493CA560();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257860830);
  v10 = MEMORY[0x24BDAC7A8](v8, v9);
  v36 = (uint64_t)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10, v12);
  v15 = (char *)&v35 - v14;
  v17 = MEMORY[0x24BDAC7A8](v13, v16);
  v19 = (char *)&v35 - v18;
  MEMORY[0x24BDAC7A8](v17, v20);
  v22 = (char *)&v35 - v21;
  v38 = *a1;
  v23 = objc_msgSend(v38, sel_URL);
  if (v23)
  {
    v24 = v23;
    sub_2493CA59C();

    v25 = sub_2493CA5B4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v19, 0, 1, v25);
  }
  else
  {
    v25 = sub_2493CA5B4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v19, 1, 1, v25);
  }
  sub_2493CA3F4((uint64_t)v19, (uint64_t)v22);
  sub_2493CA5B4();
  v26 = *(_QWORD *)(v25 - 8);
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48);
  if (v27(v22, 1, v25))
  {
    sub_2493CA43C((uint64_t)v22, (uint64_t)v15, (uint64_t *)&unk_257860830);
    if (v27(v15, 1, v25) == 1)
    {
      v28 = 0;
    }
    else
    {
      v28 = (void *)sub_2493CA590();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v15, v25);
    }
    objc_msgSend(v38, sel_setURL_, v28);

    sub_2493BFD2C((uint64_t)v22, (uint64_t *)&unk_257860830);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, v37, v3);
    v29 = v39;
    sub_2493CA584();
    if (v29)
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      v30 = v36;
      sub_2493CA43C((uint64_t)v22, v36, (uint64_t *)&unk_257860830);
      v31 = 0;
      if (v27((char *)v30, 1, v25) != 1)
      {
        v31 = (void *)sub_2493CA590();
        (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v30, v25);
      }
      objc_msgSend(v38, sel_setURL_, v31);

      sub_2493BFD2C((uint64_t)v22, (uint64_t *)&unk_257860830);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
      v32 = v27(v22, 1, v25);
      v33 = v38;
      if (v32 == 1)
      {
        v34 = 0;
      }
      else
      {
        v34 = (void *)sub_2493CA590();
        (*(void (**)(char *, uint64_t))(v26 + 8))(v22, v25);
      }
      objc_msgSend(v33, sel_setURL_, v34);

    }
  }
}

void sub_2493C5B14(void *a1, void *a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
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
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38[3];
  uint64_t v39;
  uint64_t v40;

  objc_msgSend(v2, sel_deleteObject_, a1);
  if ((sub_2493BD128() & 1) != 0)
  {
    v5 = objc_msgSend(a1, sel_requestID);
    v6 = sub_2493CA704();
    v8 = v7;

    swift_bridgeObjectRelease();
    v9 = HIBYTE(v8) & 0xF;
    if ((v8 & 0x2000000000000000) == 0)
      v9 = v6 & 0xFFFFFFFFFFFFLL;
    if (v9)
    {
      v10 = objc_msgSend(a1, sel_interactedIndices);
      if (v10)
      {
        v11 = v10;
        v12 = sub_2493CA764();

        v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF64B8]), sel_init);
        v14 = objc_msgSend(a1, sel_sessionID);
        objc_msgSend(v13, sel_setConversationID_, v14);

        v15 = objc_msgSend(a1, sel_requestID);
        objc_msgSend(v13, sel_setRequestID_, v15);

        sub_2493BCB64(v38);
        v16 = v39;
        v17 = v40;
        __swift_project_boxed_opaque_existential_1Tm(v38, v39);
        v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 24))(v16, v17);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
        sub_2493C182C(v18);
        swift_bridgeObjectRelease();
        v19 = (void *)sub_2493CA758();
        swift_bridgeObjectRelease();
        objc_msgSend(v13, sel_setSenses_, v19);

        v20 = *(_QWORD *)(v12 + 16);
        if (v20)
        {
          v35 = v13;
          v36 = a2;
          v37 = MEMORY[0x24BEE4AF8];
          v21 = a1;
          sub_2493BA73C(0, v20, 0);
          v22 = 0;
          while (1)
          {
            v23 = *(_QWORD *)(v12 + 8 * v22 + 32);
            sub_2493BCB64(v38);
            v24 = v39;
            v25 = v40;
            __swift_project_boxed_opaque_existential_1Tm(v38, v39);
            v26 = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 24))(v24, v25);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
            if ((v23 & 0x8000000000000000) != 0)
              break;
            if (v23 >= *(_QWORD *)(v26 + 16))
              goto LABEL_18;
            v27 = v12;
            sub_2493B0774(v26 + 40 * v23 + 32, (uint64_t)v38);
            swift_bridgeObjectRelease();
            v28 = sub_2493C5E98(v38);
            v30 = v29;
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
            v32 = *(_QWORD *)(v37 + 16);
            v31 = *(_QWORD *)(v37 + 24);
            if (v32 >= v31 >> 1)
              sub_2493BA73C(v31 > 1, v32 + 1, 1);
            ++v22;
            *(_QWORD *)(v37 + 16) = v32 + 1;
            v33 = v37 + 16 * v32;
            *(_QWORD *)(v33 + 32) = v28;
            *(_QWORD *)(v33 + 40) = v30;
            v12 = v27;
            if (v20 == v22)
            {
              swift_bridgeObjectRelease();

              v13 = v35;
              a2 = v36;
              goto LABEL_15;
            }
          }
          __break(1u);
LABEL_18:
          __break(1u);
        }
        else
        {
          swift_bridgeObjectRelease();
LABEL_15:
          v34 = (void *)sub_2493CA758();
          swift_bridgeObjectRelease();
          objc_msgSend(v13, sel_setUserInteractedSenses_, v34);

          objc_msgSend(a2, sel_log_, v13);
        }
      }
    }
  }
}

uint64_t sub_2493C5E98(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[2];
  uint64_t v19;

  v1 = a1[3];
  v2 = a1[4];
  __swift_project_boxed_opaque_existential_1Tm(a1, v1);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
  if (*(_QWORD *)(v3 + 16))
  {
    sub_2493B0774(v3 + 32, (uint64_t)v18);
  }
  else
  {
    v19 = 0;
    memset(v18, 0, sizeof(v18));
  }
  swift_bridgeObjectRelease();
  sub_2493CA43C((uint64_t)v18, (uint64_t)&v13, &qword_2578607F8);
  if (v14)
  {
    sub_2493B0818(&v13, (uint64_t)v15);
    v4 = v16;
    v5 = v17;
    __swift_project_boxed_opaque_existential_1Tm(v15, v16);
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 56))(v4, v5);
    if ((v6 & 1) != 0)
      v7 = 0x747365626ELL;
    else
      v7 = 0x6769626D61736964;
    if ((v6 & 1) != 0)
      v8 = 0xE500000000000000;
    else
      v8 = 0xE800000000000000;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    v7 = 7104878;
    sub_2493BFD2C((uint64_t)&v13, &qword_2578607F8);
    v8 = 0xE300000000000000;
  }
  sub_2493CA43C((uint64_t)v18, (uint64_t)v15, &qword_2578607F8);
  v9 = v16;
  if (v16)
  {
    v10 = v17;
    __swift_project_boxed_opaque_existential_1Tm(v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  }
  else
  {
    sub_2493BFD2C((uint64_t)v15, &qword_2578607F8);
  }
  v15[0] = v7;
  v15[1] = v8;
  sub_2493CA728();
  sub_2493CA728();
  swift_bridgeObjectRelease();
  v11 = v15[0];
  sub_2493BFD2C((uint64_t)v18, &qword_2578607F8);
  return v11;
}

id TranslationStoreCoreData.moc.getter()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_viewContext);
}

void *TranslationStoreCoreData.insert(speech:translationResult:context:isFavorite:)(_QWORD *a1, _QWORD *a2, uint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v7 = a1[3];
  v8 = a1[4];
  v9 = __swift_project_boxed_opaque_existential_1Tm(a1, v7);
  v10 = a2[3];
  v11 = a2[4];
  v12 = __swift_project_boxed_opaque_existential_1Tm(a2, v10);
  return sub_2493C957C((uint64_t)v9, (uint64_t)v12, a3, a4, v7, v10, v8, v11);
}

uint64_t sub_2493C6114(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  id v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v26[3];

  v26[2] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(a2, a3);
  type metadata accessor for PersistedTranslation();
  v9 = sub_2493CA7F4();
  v18 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v24 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
    if (v24)
      goto LABEL_8;
LABEL_16:

    v17 = swift_bridgeObjectRelease();
    return a5(v17);
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_16;
LABEL_8:
  if ((v18 & 0xC000000000000001) != 0)
  {
    v19 = (id)MEMORY[0x2495AEF30](0, v18);
  }
  else
  {
    if (!*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v19 = *(id *)(v18 + 32);
  }
  v20 = v19;
  swift_bridgeObjectRelease();
  sub_2493C5B14(v20, *(void **)(a4 + 24));
  v26[0] = 0;
  if (objc_msgSend(a1, sel_save_, v26))
  {
    v21 = v26[0];

  }
  else
  {
    v22 = v26[0];
    v23 = (void *)sub_2493CA578();

    swift_willThrow();
    if (qword_2578600A0 != -1)
      swift_once();
    v10 = sub_2493CA6C8();
    __swift_project_value_buffer(v10, (uint64_t)qword_2578634C0);
    v11 = v23;
    v12 = sub_2493CA6B0();
    v13 = sub_2493CA7B8();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v16 = (void *)sub_2493CA56C();
      v26[0] = v16;
      sub_2493CA824();
      *v15 = v16;

      _os_log_impl(&dword_2493AE000, v12, v13, "Failed to delete translation: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v15, -1, -1);
      MEMORY[0x2495AF4D0](v14, -1, -1);

    }
    else
    {

    }
  }
  return a5(v17);
}

void sub_2493C641C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_2493C646C(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, id a5)
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  unint64_t v34;
  uint64_t (**v35)(_QWORD, _QWORD);
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t (**v43)(_QWORD, _QWORD);
  unint64_t v44;
  uint64_t v45;
  uint64_t (**v46)(_QWORD, _QWORD);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t (**v63)(_QWORD, _QWORD);
  uint64_t v64;
  void *v65;
  int64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  uint8_t *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t (**v88)(_QWORD, _QWORD);
  os_log_type_t v89;
  uint8_t *v90;
  _QWORD *v91;
  void *v92;
  unint64_t v93;
  unint64_t v94;
  void *v95;
  uint64_t (**v96)(_QWORD, _QWORD);
  id v97;
  id v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  void *v103;
  unint64_t v104;
  uint64_t v105;
  void *v106;
  unint64_t v107;
  uint64_t v109;
  _QWORD v110[3];
  uint64_t v111;
  uint64_t v112;
  id v113[3];
  uint64_t v114;
  uint64_t (**v115)(_QWORD, _QWORD);
  uint64_t v116;

  v116 = *MEMORY[0x24BDAC8D0];
  v9 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v10 = (void *)sub_2493CA6F8();
  v11 = objc_msgSend(v9, sel_initWithEntityName_, v10);

  sub_2493B83B0(0, &qword_2578606F8);
  v12 = (void *)sub_2493CA794();
  objc_msgSend(v11, sel_setPredicate_, v12);

  if (a3)
  {
    swift_bridgeObjectRetain();
    v13 = objc_msgSend(v11, sel_predicate);
    if (v13)
    {
      v14 = v13;
      v102 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860710);
      v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_2493CC570;
      *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v15 + 64) = sub_2493C10B8();
      *(_QWORD *)(v15 + 32) = a2;
      *(_QWORD *)(v15 + 40) = a3;
      swift_bridgeObjectRetain();
      v100 = v11;
      v16 = (void *)sub_2493CA794();
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860700);
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_2493CC6E0;
      *(_QWORD *)(v17 + 32) = v14;
      *(_QWORD *)(v17 + 40) = v16;
      v113[0] = (id)v17;
      sub_2493CA770();
      v18 = v14;
      v19 = v16;
      v11 = v100;
      v20 = v19;
      v21 = (void *)sub_2493CA758();
      swift_bridgeObjectRelease();
      v22 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v21);

      objc_msgSend(v100, sel_setPredicate_, v22);
      if (qword_2578600A0 != -1)
        swift_once();
      v23 = sub_2493CA6C8();
      __swift_project_value_buffer(v23, (uint64_t)qword_2578634C0);
      swift_bridgeObjectRetain();
      v24 = sub_2493CA6B0();
      v25 = sub_2493CA7A0();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        v106 = v18;
        v27 = a5;
        v28 = (void *)swift_slowAlloc();
        v113[0] = v28;
        *(_DWORD *)v26 = 136315138;
        swift_bridgeObjectRetain();
        v110[0] = sub_2493BE2C4(a2, a3, (uint64_t *)v113);
        v11 = v100;
        sub_2493CA824();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2493AE000, v24, v25, "Attempt to delete session (id: %s) history", v26, 0xCu);
        swift_arrayDestroy();
        v29 = v28;
        a5 = v27;
        MEMORY[0x2495AF4D0](v29, -1, -1);
        MEMORY[0x2495AF4D0](v26, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      a1 = v102;
      goto LABEL_15;
    }
    swift_bridgeObjectRelease();
  }
  if (qword_2578600A0 != -1)
    swift_once();
  v30 = sub_2493CA6C8();
  __swift_project_value_buffer(v30, (uint64_t)qword_2578634C0);
  v31 = sub_2493CA6B0();
  v32 = sub_2493CA7A0();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_2493AE000, v31, v32, "Attempt to delete history", v33, 2u);
    MEMORY[0x2495AF4D0](v33, -1, -1);
  }

LABEL_15:
  type metadata accessor for PersistedTranslation();
  v34 = sub_2493CA7F4();
  v35 = 0;
  v36 = v34;
  v93 = v34 >> 62;
  if (!(v34 >> 62))
  {
    v37 = *(_QWORD *)((v34 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v37)
      goto LABEL_17;
LABEL_41:
    swift_bridgeObjectRelease();
    v113[0] = 0;
    if (!objc_msgSend(a1, sel_save_, v113))
    {
      v86 = v113[0];
      swift_bridgeObjectRelease();
      v35 = (uint64_t (**)(_QWORD, _QWORD))sub_2493CA578();

      swift_willThrow();
      if (qword_2578600A0 == -1)
        goto LABEL_47;
      goto LABEL_58;
    }
    v79 = qword_2578600A0;
    v80 = v113[0];
    if (v79 == -1)
    {
LABEL_43:
      v81 = sub_2493CA6C8();
      __swift_project_value_buffer(v81, (uint64_t)qword_2578634C0);
      swift_bridgeObjectRetain();
      v82 = sub_2493CA6B0();
      v83 = sub_2493CA7A0();
      if (!os_log_type_enabled(v82, v83))
      {

        swift_bridgeObjectRelease_n();
        goto LABEL_51;
      }
      v84 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v84 = 134217984;
      if (v93)
      {
        swift_bridgeObjectRetain();
        v85 = (void *)sub_2493CA8C0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v85 = *(void **)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v113[0] = v85;
      sub_2493CA824();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2493AE000, v82, v83, "Deleted %ld old translations", v84, 0xCu);
      MEMORY[0x2495AF4D0](v84, -1, -1);
      goto LABEL_50;
    }
LABEL_62:
    swift_once();
    goto LABEL_43;
  }
  swift_bridgeObjectRetain();
  v37 = sub_2493CA8C0();
  if (!v37)
    goto LABEL_41;
LABEL_17:
  if (v37 < 1)
  {
    __break(1u);
    goto LABEL_62;
  }
  v38 = 0;
  v97 = *(id *)(a4 + 24);
  v105 = v37;
  v107 = v36 & 0xC000000000000001;
  v104 = v36 + 32;
  v99 = a5;
  v101 = v11;
  v103 = a1;
  v94 = v36;
  while (1)
  {
    while (1)
    {
      v39 = v107 ? (id)MEMORY[0x2495AEF30](v38, v36) : *(id *)(v104 + 8 * v38);
      v40 = v39;
      v109 = v38 + 1;
      objc_msgSend(a1, sel_deleteObject_, v39, v93);
      v41 = objc_msgSend(v40, sel_targetResult);

      if (v41)
      {
        sub_2493BCB64((uint64_t *)v113);
        v42 = v114;
        v43 = v115;
        __swift_project_boxed_opaque_existential_1Tm(v113, v114);
        v44 = *(_QWORD *)(v43[3](v42, v43) + 16);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
        if (v44 >= 2)
        {
          sub_2493BCB64((uint64_t *)v113);
          v45 = v114;
          v46 = v115;
          __swift_project_boxed_opaque_existential_1Tm(v113, v114);
          v47 = v46[3](v45, v46);
          if (!*(_QWORD *)(v47 + 16))
            goto LABEL_57;
          sub_2493B0774(v47 + 32, (uint64_t)v110);
          swift_bridgeObjectRelease();
          v48 = v111;
          v49 = v112;
          __swift_project_boxed_opaque_existential_1Tm(v110, v111);
          v50 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v49 + 40))(v48, v49) + 16);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v110);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
          if (v50)
          {
            v51 = objc_msgSend(v40, sel_requestID);
            v52 = sub_2493CA704();
            v54 = v53;

            swift_bridgeObjectRelease();
            v55 = HIBYTE(v54) & 0xF;
            if ((v54 & 0x2000000000000000) == 0)
              v55 = v52 & 0xFFFFFFFFFFFFLL;
            if (v55)
            {
              v56 = objc_msgSend(v40, sel_interactedIndices);
              if (v56)
                break;
            }
          }
        }
      }

      v38 = v109;
      if (v109 == v105)
        goto LABEL_41;
    }
    v57 = v56;
    v58 = sub_2493CA764();

    v59 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF64B8]), sel_init);
    v60 = objc_msgSend(v40, sel_sessionID);
    objc_msgSend(v59, sel_setConversationID_, v60);

    v61 = objc_msgSend(v40, sel_requestID);
    objc_msgSend(v59, sel_setRequestID_, v61);

    sub_2493BCB64((uint64_t *)v113);
    v62 = v114;
    v63 = v115;
    __swift_project_boxed_opaque_existential_1Tm(v113, v114);
    v64 = v63[3](v62, v63);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    sub_2493C182C(v64);
    swift_bridgeObjectRelease();
    v65 = (void *)sub_2493CA758();
    swift_bridgeObjectRelease();
    v98 = v59;
    objc_msgSend(v59, sel_setSenses_, v65);

    v66 = *(_QWORD *)(v58 + 16);
    if (v66)
      break;
    swift_bridgeObjectRelease();
LABEL_40:
    v78 = (void *)sub_2493CA758();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_setUserInteractedSenses_, v78);

    objc_msgSend(v97, sel_log_, v98);
    v38 = v109;
    a1 = v103;
    if (v109 == v105)
      goto LABEL_41;
  }
  v96 = v35;
  v110[0] = MEMORY[0x24BEE4AF8];
  v95 = v40;
  a5 = v40;
  sub_2493BA73C(0, v66, 0);
  v11 = 0;
  v67 = v110[0];
  while (1)
  {
    v68 = v58;
    v69 = *(_QWORD *)(v58 + 8 * (_QWORD)v11 + 32);
    sub_2493BCB64((uint64_t *)v113);
    v70 = v114;
    v35 = v115;
    __swift_project_boxed_opaque_existential_1Tm(v113, v114);
    v71 = v35[3](v70, v35);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    if ((v69 & 0x8000000000000000) != 0)
      break;
    if (v69 >= *(_QWORD *)(v71 + 16))
      goto LABEL_56;
    sub_2493B0774(v71 + 40 * v69 + 32, (uint64_t)v113);
    swift_bridgeObjectRelease();
    v72 = sub_2493C5E98(v113);
    v74 = v73;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v113);
    v110[0] = v67;
    v76 = *(_QWORD *)(v67 + 16);
    v75 = *(_QWORD *)(v67 + 24);
    if (v76 >= v75 >> 1)
    {
      sub_2493BA73C(v75 > 1, v76 + 1, 1);
      v67 = v110[0];
    }
    v11 = (char *)v11 + 1;
    *(_QWORD *)(v67 + 16) = v76 + 1;
    v77 = v67 + 16 * v76;
    *(_QWORD *)(v77 + 32) = v72;
    *(_QWORD *)(v77 + 40) = v74;
    v58 = v68;
    if ((id)v66 == v11)
    {
      swift_bridgeObjectRelease();

      a5 = v99;
      v11 = v101;
      v36 = v94;
      v40 = v95;
      v35 = v96;
      goto LABEL_40;
    }
  }
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  swift_once();
LABEL_47:
  v87 = sub_2493CA6C8();
  __swift_project_value_buffer(v87, (uint64_t)qword_2578634C0);
  v88 = v35;
  v82 = sub_2493CA6B0();
  v89 = sub_2493CA7B8();
  if (!os_log_type_enabled(v82, v89))
  {

LABEL_50:
    goto LABEL_51;
  }
  v90 = (uint8_t *)swift_slowAlloc();
  v91 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v90 = 138412290;
  v92 = (void *)sub_2493CA56C();
  v113[0] = v92;
  sub_2493CA824();
  *v91 = v92;

  _os_log_impl(&dword_2493AE000, v82, v89, "Failed to clear history: %@", v90, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
  swift_arrayDestroy();
  MEMORY[0x2495AF4D0](v91, -1, -1);
  MEMORY[0x2495AF4D0](v90, -1, -1);

LABEL_51:
  ((void (*)(void))a5)();

}

void sub_2493C7188(uint64_t (**a1)(_QWORD, _QWORD), _QWORD *a2, id a3, unint64_t a4)
{
  id v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t (**v22)(_QWORD, _QWORD);
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t (**v26)(_QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t (**v44)(_QWORD, _QWORD);
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  void *v59;
  unsigned int v60;
  id v61;
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  _QWORD *v75;
  void *v76;
  unint64_t v77;
  uint64_t (**v78)(_QWORD, _QWORD);
  unint64_t v79;
  id v80;
  id v81;
  id v82;
  _QWORD *v83;
  unint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  _QWORD v88[3];
  uint64_t v89;
  uint64_t v90;
  id v91[3];
  uint64_t v92;
  uint64_t (**v93)(_QWORD, _QWORD);
  uint64_t v94;

  v94 = *MEMORY[0x24BDAC8D0];
  v8 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v9 = (void *)sub_2493CA6F8();
  v10 = objc_msgSend(v8, sel_initWithEntityName_, v9);

  if (qword_2578600A0 != -1)
    goto LABEL_45;
  while (1)
  {
    v11 = sub_2493CA6C8();
    __swift_project_value_buffer(v11, (uint64_t)qword_2578634C0);
    v12 = sub_2493CA6B0();
    v13 = sub_2493CA7A0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2493AE000, v12, v13, "Attempting to delete all data", v14, 2u);
      MEMORY[0x2495AF4D0](v14, -1, -1);
    }

    type metadata accessor for PersistedTranslation();
    v15 = sub_2493CA7F4();
    v83 = v10;
    v84 = v15;
    v77 = v15 >> 62;
    if (v15 >> 62)
      break;
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v16)
      goto LABEL_30;
LABEL_6:
    if (v16 < 1)
      __break(1u);
    v17 = 0;
    v80 = a3;
    v81 = (id)a2[3];
    v85 = v16;
    v78 = a1;
    v79 = a4;
    while (1)
    {
      while (1)
      {
        v18 = (v84 & 0xC000000000000001) != 0
            ? (id)MEMORY[0x2495AEF30](v17, v84)
            : *(id *)(v84 + 32 + 8 * v17);
        v19 = v18;
        v87 = v17 + 1;
        objc_msgSend(a1, sel_deleteObject_, v18);
        v20 = objc_msgSend(v19, sel_targetResult);

        if (v20)
        {
          sub_2493BCB64((uint64_t *)v91);
          v86 = v19;
          v21 = v92;
          v22 = v93;
          __swift_project_boxed_opaque_existential_1Tm(v91, v92);
          v23 = v21;
          v19 = v86;
          v24 = *(_QWORD *)(v22[3](v23, v22) + 16);
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
          if (v24 >= 2)
          {
            sub_2493BCB64((uint64_t *)v91);
            v25 = v92;
            v26 = v93;
            __swift_project_boxed_opaque_existential_1Tm(v91, v92);
            v27 = v26[3](v25, v26);
            if (!*(_QWORD *)(v27 + 16))
              goto LABEL_44;
            sub_2493B0774(v27 + 32, (uint64_t)v88);
            swift_bridgeObjectRelease();
            v28 = v89;
            v29 = v90;
            __swift_project_boxed_opaque_existential_1Tm(v88, v89);
            v30 = *(_QWORD *)((*(uint64_t (**)(uint64_t, uint64_t))(v29 + 40))(v28, v29) + 16);
            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v88);
            __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
            v19 = v86;
            if (v30)
            {
              v31 = objc_msgSend(v86, sel_requestID);
              v32 = sub_2493CA704();
              v34 = v33;

              swift_bridgeObjectRelease();
              v35 = HIBYTE(v34) & 0xF;
              v36 = v32 & 0xFFFFFFFFFFFFLL;
              v19 = v86;
              if ((v34 & 0x2000000000000000) == 0)
                v35 = v36;
              if (v35)
              {
                v37 = objc_msgSend(v86, sel_interactedIndices);
                if (v37)
                  break;
              }
            }
          }
        }

        v17 = v87;
        if (v87 == v85)
          goto LABEL_30;
      }
      v38 = v37;
      v39 = sub_2493CA764();

      v40 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDF64B8]), sel_init);
      v41 = objc_msgSend(v86, sel_sessionID);
      objc_msgSend(v40, sel_setConversationID_, v41);

      v42 = objc_msgSend(v86, sel_requestID);
      objc_msgSend(v40, sel_setRequestID_, v42);

      sub_2493BCB64((uint64_t *)v91);
      a2 = v86;
      v43 = v92;
      v44 = v93;
      __swift_project_boxed_opaque_existential_1Tm(v91, v92);
      v45 = v44[3](v43, v44);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      sub_2493C182C(v45);
      swift_bridgeObjectRelease();
      v46 = (void *)sub_2493CA758();
      swift_bridgeObjectRelease();
      v82 = v40;
      v47 = v40;
      v48 = v39;
      objc_msgSend(v47, sel_setSenses_, v46);

      v49 = *(_QWORD *)(v39 + 16);
      if (v49)
        break;
      swift_bridgeObjectRelease();
LABEL_29:
      v59 = (void *)sub_2493CA758();
      swift_bridgeObjectRelease();
      objc_msgSend(v82, sel_setUserInteractedSenses_, v59);

      objc_msgSend(v81, sel_log_, v82);
      v17 = v87;
      v10 = v83;
      if (v87 == v85)
        goto LABEL_30;
    }
    v88[0] = MEMORY[0x24BEE4AF8];
    a3 = v86;
    sub_2493BA73C(0, v49, 0);
    v50 = 0;
    v10 = (_QWORD *)v88[0];
    while (1)
    {
      a4 = *(_QWORD *)(v48 + 8 * v50 + 32);
      sub_2493BCB64((uint64_t *)v91);
      v51 = v92;
      a1 = v93;
      __swift_project_boxed_opaque_existential_1Tm(v91, v92);
      v52 = a1[3](v51, a1);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      if ((a4 & 0x8000000000000000) != 0)
        break;
      if (a4 >= *(_QWORD *)(v52 + 16))
        goto LABEL_43;
      a2 = (_QWORD *)v48;
      sub_2493B0774(v52 + 40 * a4 + 32, (uint64_t)v91);
      swift_bridgeObjectRelease();
      v53 = sub_2493C5E98(v91);
      v55 = v54;
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
      v88[0] = v10;
      v57 = v10[2];
      v56 = v10[3];
      if (v57 >= v56 >> 1)
      {
        sub_2493BA73C(v56 > 1, v57 + 1, 1);
        v10 = (_QWORD *)v88[0];
      }
      ++v50;
      v10[2] = v57 + 1;
      v58 = &v10[2 * v57];
      v58[4] = v53;
      v58[5] = v55;
      v48 = (uint64_t)a2;
      if (v49 == v50)
      {
        swift_bridgeObjectRelease();

        a4 = v79;
        a3 = v80;
        a1 = v78;
        goto LABEL_29;
      }
    }
    __break(1u);
LABEL_43:
    __break(1u);
LABEL_44:
    __break(1u);
LABEL_45:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v16 = sub_2493CA8C0();
  if (v16)
    goto LABEL_6;
LABEL_30:
  swift_bridgeObjectRelease();
  v91[0] = 0;
  v60 = objc_msgSend(a1, sel_save_, v91);
  v61 = v91[0];
  if (v60)
  {
    swift_bridgeObjectRetain();
    v62 = v61;
    v63 = sub_2493CA6B0();
    v64 = sub_2493CA7A0();
    if (os_log_type_enabled(v63, v64))
    {
      v65 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v65 = 134217984;
      if (v77)
      {
        swift_bridgeObjectRetain();
        v66 = (void *)sub_2493CA8C0();
        swift_bridgeObjectRelease();
      }
      else
      {
        v66 = *(void **)((v84 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v91[0] = v66;
      sub_2493CA824();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2493AE000, v63, v64, "Deleted %ld old translations", v65, 0xCu);
      MEMORY[0x2495AF4D0](v65, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    v67 = v91[0];
    swift_bridgeObjectRelease();
    v68 = (void *)sub_2493CA578();

    swift_willThrow();
    v69 = a3;
    v70 = v68;
    v71 = v68;
    v72 = sub_2493CA6B0();
    v73 = sub_2493CA7B8();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      v75 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v74 = 138412290;
      v76 = (void *)sub_2493CA56C();
      v91[0] = v76;
      sub_2493CA824();
      *v75 = v76;

      _os_log_impl(&dword_2493AE000, v72, v73, "Failed to clear history: %@", v74, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
      swift_arrayDestroy();
      MEMORY[0x2495AF4D0](v75, -1, -1);
      MEMORY[0x2495AF4D0](v74, -1, -1);

    }
    else
    {

    }
    a3 = v69;
    v10 = v83;
  }
  ((void (*)(void))a3)();

}

unint64_t sub_2493C7B04(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860818);
  v2 = (_QWORD *)sub_2493CA8CC();
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
    result = sub_2493C8E24(v5, v6);
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

void sub_2493C7C1C(void *a1, id a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  void *v15;
  unint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  os_log_type_t v32;
  uint8_t *v33;
  _QWORD *v34;
  id v35;
  id v36;
  id v37[3];

  v37[2] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a2, sel_identifier);
  v5 = sub_2493CA704();
  v7 = v6;

  v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(v5, v7);
  swift_bridgeObjectRelease();
  type metadata accessor for PersistedTranslation();
  v9 = sub_2493CA7F4();
  v16 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v30 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
    if (v30)
      goto LABEL_8;
LABEL_20:
    swift_bridgeObjectRelease();
    if (qword_2578600A0 == -1)
      goto LABEL_21;
    goto LABEL_28;
  }
  if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_20;
LABEL_8:
  if ((v16 & 0xC000000000000001) != 0)
  {
    v17 = (id)MEMORY[0x2495AEF30](0, v16);
    goto LABEL_11;
  }
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v17 = *(id *)(v16 + 32);
LABEL_11:
    v18 = v17;
    swift_bridgeObjectRelease();
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v18);
    v37[0] = 0;
    if (!objc_msgSend(a1, sel_save_, v37))
    {
      v28 = v37[0];
      v29 = (void *)sub_2493CA578();

      swift_willThrow();
      if (qword_2578600A0 != -1)
        swift_once();
      v10 = sub_2493CA6C8();
      __swift_project_value_buffer(v10, (uint64_t)qword_2578634C0);
      v11 = v29;
      v8 = sub_2493CA6B0();
      v12 = sub_2493CA7B8();
      if (os_log_type_enabled(v8, v12))
      {
        v13 = (uint8_t *)swift_slowAlloc();
        v14 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v13 = 138412290;
        v15 = (void *)sub_2493CA56C();
        v37[0] = v15;
        sub_2493CA824();
        *v14 = v15;

        _os_log_impl(&dword_2493AE000, v8, v12, "Failed to favorite translation: %@", v13, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
        swift_arrayDestroy();
        MEMORY[0x2495AF4D0](v14, -1, -1);
        MEMORY[0x2495AF4D0](v13, -1, -1);

        return;
      }

      goto LABEL_24;
    }
    v19 = qword_2578600A0;
    v20 = v37[0];
    if (v19 != -1)
      swift_once();
    v21 = sub_2493CA6C8();
    __swift_project_value_buffer(v21, (uint64_t)qword_2578634C0);
    v22 = v18;
    v23 = sub_2493CA6B0();
    v24 = sub_2493CA7A0();
    if (!os_log_type_enabled(v23, v24))
    {

      return;
    }
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v25 = 138739971;
    v37[0] = v22;
    v27 = v22;
    sub_2493CA824();
    *v26 = v22;

    _os_log_impl(&dword_2493AE000, v23, v24, "Favorited translation: %{sensitive}@", v25, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
    swift_arrayDestroy();
    MEMORY[0x2495AF4D0](v26, -1, -1);
    MEMORY[0x2495AF4D0](v25, -1, -1);

LABEL_23:
LABEL_24:

    return;
  }
  __break(1u);
LABEL_28:
  swift_once();
LABEL_21:
  v31 = sub_2493CA6C8();
  __swift_project_value_buffer(v31, (uint64_t)qword_2578634C0);
  v36 = a2;
  v23 = sub_2493CA6B0();
  v32 = sub_2493CA7B8();
  if (os_log_type_enabled(v23, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    v34 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v33 = 138739971;
    v37[0] = v36;
    v35 = v36;
    sub_2493CA824();
    *v34 = v36;

    _os_log_impl(&dword_2493AE000, v23, v32, "Failed to find translation in store: %{sensitive}@", v33, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
    swift_arrayDestroy();
    MEMORY[0x2495AF4D0](v34, -1, -1);
    MEMORY[0x2495AF4D0](v33, -1, -1);
    goto LABEL_23;
  }

}

void sub_2493C8220(void *a1, id a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  void *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v34[3];
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a2, sel_identifier);
  v5 = sub_2493CA704();
  v7 = v6;

  v8 = _s22TranslationPersistence09PersistedA0C12fetchRequest10identifierSo07NSFetchE0CyACGSS_tFZ_0(v5, v7);
  swift_bridgeObjectRelease();
  type metadata accessor for PersistedTranslation();
  v9 = sub_2493CA7F4();
  v16 = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v32 = sub_2493CA8C0();
    swift_bridgeObjectRelease();
    if (v32)
    {
LABEL_8:
      if ((v16 & 0xC000000000000001) != 0)
      {
        v17 = (id)MEMORY[0x2495AEF30](0, v16);
      }
      else
      {
        if (!*(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_23;
        }
        v17 = *(id *)(v16 + 32);
      }
      v2 = v17;
      swift_bridgeObjectRelease();
      sub_2493BCB64((uint64_t *)v34);
      v18 = v35;
      v19 = v36;
      v20 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
      MEMORY[0x24BDAC7A8](v20, v20);
      v22 = (char *)v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v23 + 16))(v22);
      sub_2493BF69C((uint64_t)v22, v2, v18, v19);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
      v34[0] = 0;
      if (!objc_msgSend(a1, sel_save_, v34))
      {
        v30 = v34[0];
        v31 = (void *)sub_2493CA578();

        swift_willThrow();
        if (qword_2578600A0 != -1)
          swift_once();
        v10 = sub_2493CA6C8();
        __swift_project_value_buffer(v10, (uint64_t)qword_2578634C0);
        v11 = v31;
        v8 = sub_2493CA6B0();
        v12 = sub_2493CA7B8();
        if (os_log_type_enabled(v8, v12))
        {
          v13 = (uint8_t *)swift_slowAlloc();
          v14 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v13 = 138412290;
          v15 = (void *)sub_2493CA56C();
          v34[0] = v15;
          sub_2493CA824();
          *v14 = v15;

          _os_log_impl(&dword_2493AE000, v8, v12, "Failed to update disambiguation selection for translation: %@", v13, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_257860150);
          swift_arrayDestroy();
          MEMORY[0x2495AF4D0](v14, -1, -1);
          MEMORY[0x2495AF4D0](v13, -1, -1);

          return;
        }

        goto LABEL_17;
      }
      v24 = qword_2578600A0;
      v25 = v34[0];
      if (v24 == -1)
      {
LABEL_13:
        v26 = sub_2493CA6C8();
        __swift_project_value_buffer(v26, (uint64_t)qword_2578634C0);
        v27 = sub_2493CA6B0();
        v28 = sub_2493CA7A0();
        if (os_log_type_enabled(v27, v28))
        {
          v29 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v29 = 0;
          _os_log_impl(&dword_2493AE000, v27, v28, "Updated disambiguation selection for translation", v29, 2u);
          MEMORY[0x2495AF4D0](v29, -1, -1);
        }

LABEL_17:
        return;
      }
LABEL_23:
      swift_once();
      goto LABEL_13;
    }
  }
  else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_8;
  }

  swift_bridgeObjectRelease();
}

uint64_t static TranslationStoreCoreData.mockTranslationLTR2LTR.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t result;
  uint64_t v20;

  v0 = sub_2493CA698();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for StoredTranslationResult();
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for StoredSpeechResult();
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  v13 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_2493CA620();
  v14 = &v12[v9[8]];
  *(_QWORD *)&v12[v9[11]] = 0;
  *v12 = 1;
  *((_QWORD *)v12 + 1) = 1000;
  v12[v9[7]] = 0;
  v15 = &v12[v9[9]];
  *(_QWORD *)v15 = 0x6F6C6C6548;
  *((_QWORD *)v15 + 1) = 0xE500000000000000;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v12[v9[10]] = 0;
  sub_2493CA620();
  *(_QWORD *)&v8[v5[7]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v8, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860400);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2493CC570;
  *(_BYTE *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 40) = 1634496328;
  *(_QWORD *)(v16 + 48) = 0xE400000000000000;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_QWORD *)(v16 + 88) = MEMORY[0x24BEE4AF8];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(_QWORD *)&v8[v5[5]] = v16;
  v8[v5[6]] = 1;
  v17 = objc_msgSend(*(id *)(v13 + 16), sel_viewContext);
  v18 = sub_2493C9C08((uint64_t)v12, (uint64_t)v8, (uint64_t)v17, 0);

  sub_2493CA254((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for StoredTranslationResult);
  result = sub_2493CA254((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for StoredSpeechResult);
  if (v18)
  {
    swift_release();
    return (uint64_t)v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static TranslationStoreCoreData.mockTranslationLTR2RTL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t result;
  uint64_t v20;

  v0 = sub_2493CA698();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for StoredTranslationResult();
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for StoredSpeechResult();
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  v13 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_2493CA620();
  v14 = &v12[v9[8]];
  *(_QWORD *)&v12[v9[11]] = 0;
  *v12 = 1;
  *((_QWORD *)v12 + 1) = 1000;
  v12[v9[7]] = 0;
  v15 = &v12[v9[9]];
  *(_QWORD *)v15 = 0x6F6C6C6548;
  *((_QWORD *)v15 + 1) = 0xE500000000000000;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v12[v9[10]] = 0;
  sub_2493CA620();
  *(_QWORD *)&v8[v5[7]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v8, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860400);
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_2493CC570;
  *(_BYTE *)(v16 + 32) = 0;
  *(_QWORD *)(v16 + 40) = 0xA8D8ADD8B1D885D9;
  *(_QWORD *)(v16 + 48) = 0xAA0000000000A7D8;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_QWORD *)(v16 + 88) = MEMORY[0x24BEE4AF8];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(_QWORD *)&v8[v5[5]] = v16;
  v8[v5[6]] = 1;
  v17 = objc_msgSend(*(id *)(v13 + 16), sel_viewContext);
  v18 = sub_2493C9C08((uint64_t)v12, (uint64_t)v8, (uint64_t)v17, 0);

  sub_2493CA254((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for StoredTranslationResult);
  result = sub_2493CA254((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for StoredSpeechResult);
  if (v18)
  {
    swift_release();
    return (uint64_t)v18;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t static TranslationStoreCoreData.mockTranslationRTL2LTR.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t result;
  uint64_t v21;

  v0 = sub_2493CA698();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (int *)type metadata accessor for StoredTranslationResult();
  MEMORY[0x24BDAC7A8](v5, v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (int *)type metadata accessor for StoredSpeechResult();
  MEMORY[0x24BDAC7A8](v9, v10);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TranslationStoreCoreData();
  v13 = swift_allocObject();
  TranslationStoreCoreData.init(inMemoryOnly:)(1);
  sub_2493CA620();
  v14 = v9[8];
  *(_QWORD *)&v12[v9[11]] = 0;
  *v12 = 1;
  *((_QWORD *)v12 + 1) = 1000;
  v12[v9[7]] = 0;
  v15 = &v12[v14];
  v16 = &v12[v9[9]];
  *(_QWORD *)v16 = 0xA8D8ADD8B1D885D9;
  *((_QWORD *)v16 + 1) = 0xAA0000000000A7D8;
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v12[v9[10]] = 0;
  sub_2493CA620();
  *(_QWORD *)&v8[v5[7]] = 0;
  (*(void (**)(char *, char *, uint64_t))(v1 + 16))(v8, v4, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860400);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_2493CC570;
  *(_BYTE *)(v17 + 32) = 0;
  *(_QWORD *)(v17 + 40) = 0x6F6C6C6548;
  *(_QWORD *)(v17 + 48) = 0xE500000000000000;
  *(_OWORD *)(v17 + 56) = 0u;
  *(_OWORD *)(v17 + 72) = 0u;
  *(_QWORD *)(v17 + 88) = MEMORY[0x24BEE4AF8];
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  *(_QWORD *)&v8[v5[5]] = v17;
  v8[v5[6]] = 1;
  v18 = objc_msgSend(*(id *)(v13 + 16), sel_viewContext);
  v19 = sub_2493C9C08((uint64_t)v12, (uint64_t)v8, (uint64_t)v18, 0);

  sub_2493CA254((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for StoredTranslationResult);
  result = sub_2493CA254((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for StoredSpeechResult);
  if (v19)
  {
    swift_release();
    return (uint64_t)v19;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2493C8E24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2493CA9F8();
  sub_2493CA71C();
  v4 = sub_2493CAA10();
  return sub_2493C8E88(a1, a2, v4);
}

unint64_t sub_2493C8E88(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2493CA9A4() & 1) == 0)
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
      while (!v14 && (sub_2493CA9A4() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2493C8F68(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v15;
  void *v16;

  v15 = objc_msgSend(*(id *)(a4 + 16), sel_viewContext);
  v16 = sub_2493C957C(a1, a2, (uint64_t)v15, a3, a5, a6, a7, a8);

  return v16;
}

uint64_t sub_2493C9000(uint64_t a1, void *a2)
{
  uint64_t *boxed_opaque_existential_1;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  objc_super v10;
  _BYTE v11[40];
  uint64_t v12[5];

  v12[3] = type metadata accessor for StoredSpeechResult();
  v12[4] = sub_2493B3A94(&qword_2578600D8, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)&protocol conformance descriptor for StoredSpeechResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  sub_2493CA3A8(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for StoredSpeechResult);
  sub_2493CA62C();
  v5 = (void *)sub_2493CA6F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setSourceIdentifier_, v5);

  sub_2493B0774((uint64_t)v12, (uint64_t)v11);
  v6 = (objc_class *)type metadata accessor for AnySpeechResult();
  v7 = objc_allocWithZone(v6);
  sub_2493B0774((uint64_t)v11, (uint64_t)v7 + OBJC_IVAR____TtC22TranslationPersistence15AnySpeechResult_value);
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  objc_msgSend(a2, sel_setSourceInput_, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_2493C9138(uint64_t a1, void *a2)
{
  uint64_t *boxed_opaque_existential_1;
  void *v5;
  objc_class *v6;
  id v7;
  id v8;
  objc_super v10;
  _BYTE v11[40];
  uint64_t v12[5];

  v12[3] = type metadata accessor for StoredTranslationResult();
  v12[4] = sub_2493B3A94(&qword_2578605F8, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  sub_2493CA3A8(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for StoredTranslationResult);
  sub_2493CA62C();
  v5 = (void *)sub_2493CA6F8();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setTargetIdentifier_, v5);

  sub_2493B0774((uint64_t)v12, (uint64_t)v11);
  v6 = (objc_class *)type metadata accessor for AnyTranslationResult();
  v7 = objc_allocWithZone(v6);
  sub_2493B0774((uint64_t)v11, (uint64_t)v7 + OBJC_IVAR____TtC22TranslationPersistence20AnyTranslationResult_value);
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  objc_msgSend(a2, sel_setTargetResult_, v8);

  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

void _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(void *a1)
{
  uint64_t v2;
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
  void *v13;
  void *v14;
  uint64_t inited;
  void *v16;
  uint64_t v17;

  v2 = sub_2493CA5F0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_favoriteDate);
  if (v11)
  {
    v12 = v11;
    sub_2493CA5D8();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v10, v6, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v10, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v10, 1, v2) != 1)
    {
      sub_2493BFD2C((uint64_t)v10, &qword_257860678);
      objc_msgSend(a1, sel_setFavoriteDate_, 0);
      return;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v10, 1, 1, v2);
  }
  sub_2493BFD2C((uint64_t)v10, &qword_257860678);
  sub_2493CA5E4();
  v13 = (void *)sub_2493CA5CC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  objc_msgSend(a1, sel_setFavoriteDate_, v13);

  v14 = (void *)sub_2493CA6F8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257860800);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2493CC570;
  *(_QWORD *)(inited + 32) = 0x6D614E746E657665;
  *(_QWORD *)(inited + 40) = 0xE900000000000065;
  sub_2493B83B0(0, &qword_257860808);
  *(_QWORD *)(inited + 48) = sub_2493CA80C();
  sub_2493C7B04(inited);
  sub_2493B83B0(0, &qword_257860810);
  v16 = (void *)sub_2493CA6E0();
  swift_bridgeObjectRelease();
  AnalyticsSendEvent();

}

void sub_2493C94F8(void *a1)
{
  uint64_t v1;

  sub_2493C7C1C(a1, *(id *)(v1 + 16));
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

uint64_t sub_2493C9518()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2493C953C(void *a1)
{
  uint64_t v1;

  sub_2493C8220(a1, *(id *)(v1 + 16));
}

uint64_t sub_2493C9548(uint64_t a1)
{
  return sub_2493CA320(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2493C6114);
}

uint64_t sub_2493C955C(uint64_t a1)
{
  return sub_2493CA320(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2493C646C);
}

void sub_2493C9570(uint64_t (**a1)(_QWORD, _QWORD))
{
  uint64_t v1;

  sub_2493C7188(a1, *(_QWORD **)(v1 + 16), *(id *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void *sub_2493C957C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  char *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void *v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  id v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int v65;
  uint64_t v66[5];
  uint64_t v67;
  _BYTE v68[24];
  uint64_t v69;
  uint64_t v70[5];
  uint64_t v71[6];

  v65 = a4;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  MEMORY[0x24BDAC7A8](v15, v16);
  v64 = (char *)&v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_2493CA5F0();
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63, v18);
  v59 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2493CA614();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20, v22);
  v24 = (char *)&v58 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71[3] = a5;
  v71[4] = a7;
  v60 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v71);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
  v70[3] = a6;
  v70[4] = a8;
  v62 = a8;
  v26 = __swift_allocate_boxed_opaque_existential_1(v70);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(v26, a2, a6);
  v27 = (void *)objc_opt_self();
  v28 = (void *)sub_2493CA6F8();
  v29 = objc_msgSend(v27, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v28, a3);

  type metadata accessor for PersistedTranslation();
  v30 = swift_dynamicCastClass();
  if (v30)
  {
    v31 = (void *)v30;
    v58 = v29;
    sub_2493CA608();
    sub_2493CA5FC();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v24, v20);
    v32 = (void *)sub_2493CA6F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v31, sel_setIdentifier_, v32);

    v33 = v59;
    sub_2493CA5E4();
    v34 = (void *)sub_2493CA5CC();
    v35 = v61;
    v36 = v63;
    (*(void (**)(char *, uint64_t))(v61 + 8))(v33, v63);
    objc_msgSend(v31, sel_setCreationDate_, v34);

    sub_2493B0774((uint64_t)v71, (uint64_t)v68);
    v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v68, v69);
    MEMORY[0x24BDAC7A8](v37, v37);
    v39 = (char *)&v58 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v40 + 16))(v39);
    sub_2493BF518((uint64_t)v39, v31, a5, v60);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    sub_2493B0774((uint64_t)v70, (uint64_t)v68);
    v41 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v68, v69);
    MEMORY[0x24BDAC7A8](v41, v41);
    v43 = (char *)&v58 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v44 + 16))(v43);
    sub_2493BF69C((uint64_t)v43, v31, a6, v62);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    sub_2493BD3D0();
    v45 = (void *)sub_2493CA758();
    objc_msgSend(v31, sel_setInteractedIndices_, v45);

    v46 = objc_msgSend(v31, sel_favoriteDate);
    if (v46)
    {
      v47 = v46;
      sub_2493CA5D8();

      v48 = (uint64_t)v64;
      (*(void (**)(char *, char *, uint64_t))(v35 + 32))(v64, v33, v36);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v35 + 56))(v48, 0, 1, v36);
      LODWORD(v47) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v48, 1, v36) != 1;
      sub_2493BFD2C(v48, &qword_257860678);
      if ((_DWORD)v47 == (v65 & 1))
      {
LABEL_5:

        goto LABEL_14;
      }
    }
    else
    {
      v56 = (uint64_t)v64;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v64, 1, 1, v36);
      sub_2493BFD2C(v56, &qword_257860678);
      if ((v65 & 1) == 0)
        goto LABEL_5;
    }
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v31);
    goto LABEL_5;
  }
  if (qword_2578600A0 != -1)
    swift_once();
  v49 = sub_2493CA6C8();
  __swift_project_value_buffer(v49, (uint64_t)qword_2578634C0);
  sub_2493B0774((uint64_t)v70, (uint64_t)v68);
  v50 = sub_2493CA6B0();
  v51 = sub_2493CA7B8();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = swift_slowAlloc();
    v67 = v53;
    *(_DWORD *)v52 = 136642819;
    sub_2493B0774((uint64_t)v68, (uint64_t)v66);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578607F0);
    v54 = sub_2493CA710();
    v66[0] = sub_2493BE2C4(v54, v55, &v67);
    sub_2493CA824();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
    _os_log_impl(&dword_2493AE000, v50, v51, "Failed to insert translation %{sensitive}s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495AF4D0](v53, -1, -1);
    MEMORY[0x2495AF4D0](v52, -1, -1);

  }
  else
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v68);
  }

  v31 = 0;
LABEL_14:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v71);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v70);
  return v31;
}

uint64_t type metadata accessor for TranslationStoreCoreData()
{
  return objc_opt_self();
}

void *sub_2493C9C08(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
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
  char *v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  char *v53;
  int v54;
  uint64_t v55[5];
  uint64_t v56;
  _BYTE v57[24];
  uint64_t v58;
  uint64_t v59[5];
  uint64_t v60[6];

  v54 = a4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257860678);
  MEMORY[0x24BDAC7A8](v7, v8);
  v53 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2493CA5F0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2493CA614();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60[3] = type metadata accessor for StoredSpeechResult();
  v60[4] = sub_2493B3A94(&qword_2578600D8, (uint64_t (*)(uint64_t))type metadata accessor for StoredSpeechResult, (uint64_t)&protocol conformance descriptor for StoredSpeechResult);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v60);
  sub_2493CA364(a1, (uint64_t)boxed_opaque_existential_1, (uint64_t (*)(_QWORD))type metadata accessor for StoredSpeechResult);
  v59[3] = type metadata accessor for StoredTranslationResult();
  v59[4] = sub_2493B3A94(&qword_2578605F8, (uint64_t (*)(uint64_t))type metadata accessor for StoredTranslationResult, (uint64_t)&protocol conformance descriptor for StoredTranslationResult);
  v21 = __swift_allocate_boxed_opaque_existential_1(v59);
  sub_2493CA364(a2, (uint64_t)v21, (uint64_t (*)(_QWORD))type metadata accessor for StoredTranslationResult);
  v22 = (void *)objc_opt_self();
  v23 = (void *)sub_2493CA6F8();
  v24 = objc_msgSend(v22, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v23, a3);

  type metadata accessor for PersistedTranslation();
  v25 = swift_dynamicCastClass();
  if (v25)
  {
    v26 = (void *)v25;
    v27 = v24;
    sub_2493CA608();
    sub_2493CA5FC();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v19, v15);
    v28 = (void *)sub_2493CA6F8();
    swift_bridgeObjectRelease();
    objc_msgSend(v26, sel_setIdentifier_, v28);

    sub_2493CA5E4();
    v29 = (void *)sub_2493CA5CC();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    objc_msgSend(v26, sel_setCreationDate_, v29);

    sub_2493B0774((uint64_t)v60, (uint64_t)v57);
    v30 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v58);
    MEMORY[0x24BDAC7A8](v30, v30);
    v32 = (char *)&v53 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v33 + 16))(v32);
    sub_2493C9000((uint64_t)v32, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    sub_2493B0774((uint64_t)v59, (uint64_t)v57);
    v34 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v57, v58);
    MEMORY[0x24BDAC7A8](v34, v34);
    v36 = (char *)&v53 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v37 + 16))(v36);
    sub_2493C9138((uint64_t)v36, v26);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    sub_2493BD3D0();
    v38 = (void *)sub_2493CA758();
    objc_msgSend(v26, sel_setInteractedIndices_, v38);

    v39 = objc_msgSend(v26, sel_favoriteDate);
    if (v39)
    {
      v40 = v39;
      sub_2493CA5D8();

      v41 = (uint64_t)v53;
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v53, v14, v10);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v11 + 56))(v41, 0, 1, v10);
      v42 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v41, 1, v10) != 1;
      sub_2493BFD2C(v41, &qword_257860678);
      if (v42 == (v54 & 1))
      {
LABEL_5:

        goto LABEL_14;
      }
    }
    else
    {
      v50 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      v51 = (uint64_t)v53;
      v50(v53, 1, 1, v10);
      sub_2493BFD2C(v51, &qword_257860678);
      if ((v54 & 1) == 0)
        goto LABEL_5;
    }
    _s22TranslationPersistence0A13StoreCoreDataC14toggleFavoriteyyAA09PersistedA0CF_0(v26);
    goto LABEL_5;
  }
  if (qword_2578600A0 != -1)
    swift_once();
  v43 = sub_2493CA6C8();
  __swift_project_value_buffer(v43, (uint64_t)qword_2578634C0);
  sub_2493B0774((uint64_t)v59, (uint64_t)v57);
  v44 = sub_2493CA6B0();
  v45 = sub_2493CA7B8();
  if (os_log_type_enabled(v44, v45))
  {
    v46 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v56 = v47;
    *(_DWORD *)v46 = 136642819;
    sub_2493B0774((uint64_t)v57, (uint64_t)v55);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578607F0);
    v48 = sub_2493CA710();
    v55[0] = sub_2493BE2C4(v48, v49, &v56);
    sub_2493CA824();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
    _os_log_impl(&dword_2493AE000, v44, v45, "Failed to insert translation %{sensitive}s", v46, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2495AF4D0](v47, -1, -1);
    MEMORY[0x2495AF4D0](v46, -1, -1);

  }
  else
  {

    __swift_destroy_boxed_opaque_existential_1((uint64_t)v57);
  }

  v26 = 0;
LABEL_14:
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v59);
  return v26;
}

uint64_t sub_2493CA254(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t method lookup function for TranslationStoreCoreData()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranslationStoreCoreData.__allocating_init(inMemoryOnly:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of TranslationStoreCoreData.viewContext.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t objectdestroy_34Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t objectdestroy_8Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2493CA320(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2493CA364(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2493CA3A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_2493CA3EC(void *a1, uint64_t a2)
{
  _QWORD *v2;

  sub_2493C2844(a1, a2, v2);
}

uint64_t sub_2493CA3F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257860830);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2493CA43C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2493CA500()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_2493CA50C()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_2493CA518()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_2493CA524()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_2493CA530()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_2493CA53C()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_2493CA548()
{
  return MEMORY[0x24BDCC7A0]();
}

uint64_t sub_2493CA554()
{
  return MEMORY[0x24BDCC808]();
}

uint64_t sub_2493CA560()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_2493CA56C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2493CA578()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2493CA584()
{
  return MEMORY[0x24BDCD8A0]();
}

uint64_t sub_2493CA590()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2493CA59C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2493CA5A8()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_2493CA5B4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2493CA5C0()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2493CA5CC()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2493CA5D8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2493CA5E4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2493CA5F0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2493CA5FC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2493CA608()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_2493CA614()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2493CA620()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_2493CA62C()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_2493CA638()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_2493CA644()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_2493CA650()
{
  return MEMORY[0x24BDCEBE8]();
}

uint64_t sub_2493CA65C()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2493CA668()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2493CA674()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_2493CA680()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_2493CA68C()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_2493CA698()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2493CA6A4()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_2493CA6B0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2493CA6BC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2493CA6C8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2493CA6D4()
{
  return MEMORY[0x24BDB9D68]();
}

uint64_t sub_2493CA6E0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2493CA6EC()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_2493CA6F8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2493CA704()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2493CA710()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2493CA71C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2493CA728()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2493CA734()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2493CA740()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_2493CA74C()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_2493CA758()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2493CA764()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2493CA770()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2493CA77C()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2493CA788()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_2493CA794()
{
  return MEMORY[0x24BDCFDD8]();
}

uint64_t sub_2493CA7A0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2493CA7AC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2493CA7B8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2493CA7C4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2493CA7D0()
{
  return MEMORY[0x24BDBB320]();
}

uint64_t sub_2493CA7DC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_2493CA7E8()
{
  return MEMORY[0x24BDBB388]();
}

uint64_t sub_2493CA7F4()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_2493CA800()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2493CA80C()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_2493CA818()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2493CA824()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2493CA830()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2493CA83C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_2493CA848()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2493CA854()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2493CA860()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2493CA86C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2493CA878()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2493CA884()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2493CA890()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2493CA89C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2493CA8A8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2493CA8B4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2493CA8C0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2493CA8CC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2493CA8D8()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2493CA8E4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2493CA8F0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2493CA8FC()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_2493CA908()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2493CA914()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2493CA920()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2493CA92C()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2493CA938()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2493CA944()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2493CA950()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2493CA95C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2493CA968()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2493CA974()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2493CA980()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2493CA98C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2493CA998()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2493CA9A4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2493CA9B0()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_2493CA9BC()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_2493CA9C8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2493CA9D4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2493CA9E0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2493CA9EC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2493CA9F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2493CAA04()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2493CAA10()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2493CAA1C()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_2493CAA28()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2493CAA34()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_2493CAA40()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2493CAA4C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2493CAA58()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

