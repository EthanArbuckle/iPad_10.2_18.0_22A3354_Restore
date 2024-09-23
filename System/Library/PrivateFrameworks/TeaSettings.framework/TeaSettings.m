unint64_t sub_1A0382A0C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED0CC890;
  if (!qword_1ED0CC890)
  {
    v1 = sub_1A0395CB0();
    result = MEMORY[0x1A1AF8C30](MEMORY[0x1E0CB08B8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED0CC890);
  }
  return result;
}

uint64_t static Settings.CompositionalList.useDiffableDataSource.getter()
{
  if (qword_1ED0CC858 != -1)
    swift_once();
  return swift_retain();
}

uint64_t type metadata accessor for PresetStartupTask()
{
  return objc_opt_self();
}

uint64_t sub_1A0382AAC()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for SettingReader();
  v0 = swift_allocObject();
  type metadata accessor for SettingReader.Reader();
  result = swift_allocObject();
  *(_QWORD *)(v0 + 16) = result;
  qword_1ED0CCBF8 = v0;
  return result;
}

#error "1A0382B7C: call analysis failed (funcsize=45)"

_QWORD *PresetManager.init()()
{
  _QWORD *v0;

  sub_1A0388968();
  v0[4] = sub_1A0395D40();
  type metadata accessor for Updater();
  v0[2] = swift_allocObject();
  v0[3] = &protocol witness table for Updater;
  return v0;
}

uint64_t static SettingReader.shared.getter()
{
  if (qword_1ED0CCC20 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_1A0382C54()
{
  return swift_initClassMetadata2();
}

uint64_t sub_1A0382CA4()
{
  id v0;
  uint64_t v1;
  uint64_t result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  type metadata accessor for SettingsStore();
  v1 = OUTLINED_FUNCTION_0();
  result = sub_1A0383148(v0);
  qword_1ED0CD200 = v1;
  return result;
}

void AppGroup.init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  v3 = v2;
  v6 = v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  v7 = OUTLINED_FUNCTION_1_4();
  __swift_storeEnumTagSinglePayload(v6, 1, 1, v7);
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = a2;
  v8 = (uint64_t *)(v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain);
  *v8 = a1;
  v8[1] = a2;
  objc_allocWithZone(MEMORY[0x1E0C99EA0]);
  swift_bridgeObjectRetain_n();
  sub_1A03878E4(a1, a2);
  if (v9)
  {
    *(_QWORD *)(v3 + OBJC_IVAR____TtC11TeaSettings8AppGroup_userDefaults) = v9;
    OUTLINED_FUNCTION_0_5();
  }
  else
  {
    __break(1u);
  }
}

void SettingProperty.observe<A>(disposeOn:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  _QWORD *v14;

  v9 = *v4;
  v10 = OUTLINED_FUNCTION_6_3();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  OUTLINED_FUNCTION_1_7();
  *v5 = OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v11 + 104))(v5, *MEMORY[0x1E0DEF740], v10);
  v12 = sub_1A0395D34();
  (*(void (**)(uint64_t *, uint64_t))(v11 + 8))(v5, v10);
  if ((v12 & 1) != 0)
  {
    v13 = OUTLINED_FUNCTION_0();
    swift_unknownObjectWeakInit();
    v14 = (_QWORD *)OUTLINED_FUNCTION_0();
    v14[2] = *(_QWORD *)(v9 + 80);
    v14[3] = a4;
    v14[4] = *(_QWORD *)(v9 + 88);
    v14[5] = v13;
    v14[6] = a2;
    v14[7] = a3;
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_3_4();
    OUTLINED_FUNCTION_11_0();
    swift_retain();
    swift_retain();
    OUTLINED_FUNCTION_10_0();
    swift_endAccess();
    swift_release();
    OUTLINED_FUNCTION_0_4();
  }
  else
  {
    __break(1u);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for Domain(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1A0382F14()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v3 = sub_1A0395EF0();

  v4 = v1 + 2;
  v6 = v1[5];
  v5 = v1[6];
  __swift_project_boxed_opaque_existential_1(v4, v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v5);
  swift_bridgeObjectRelease();
  sub_1A0388B44();
  swift_allocObject();
  return sub_1A0395CEC();
}

void sub_1A0382FD4(uint64_t a1, void (*a2)(uint64_t), uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
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
  BOOL v16;
  BOOL v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  _QWORD *v21;

  v4 = v3;
  v18 = a3;
  v19 = a2;
  v20 = a1;
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 88);
  v7 = sub_1A0395F14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v18 - v10;
  v12 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = swift_bridgeObjectRetain();
  v16 = sub_1A0386DD0(v15);
  swift_bridgeObjectRelease();
  if (v16)
  {
    v21 = v4;
    OUTLINED_FUNCTION_1();
    MEMORY[0x1A1AF8C30](&unk_1A0396B54, v5);
    v17 = sub_1A0383418();
    swift_release();
    if (!v17)
    {
      v19(v20);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v6) == 1)
      {
        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v14, v11, v6);
        sub_1A038A5D0(v4);
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v6);
      }
    }
  }
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A0383148(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;

  v3 = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v3;
  v4 = (void *)objc_opt_self();
  v5 = a1;
  v6 = objc_msgSend(v4, sel_defaultCenter);
  v7 = *MEMORY[0x1E0CB3420];
  OUTLINED_FUNCTION_13_0();
  objc_msgSend(v6, sel_addObserver_selector_name_object_, v1, sel_defaultsDidChange, v7, 0);

  OUTLINED_FUNCTION_20();
  return v1;
}

uint64_t Configurable.isEnabled(_:with:)(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  void (*v8)(uint64_t *__return_ptr, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  char v10;
  uint64_t v12;

  v8 = *(void (**)(uint64_t *__return_ptr, uint64_t, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a4 + 8);
  v9 = sub_1A03832FC();
  v8(&v12, a1, &type metadata for FeatureState, v9, a3, a4);
  if (!(_BYTE)v12)
  {
    if (a2 != 2)
    {
      v10 = a2 & 1;
      return v10 & 1;
    }
    if (*(_BYTE *)(a1 + 32))
    {
      if (*(_BYTE *)(a1 + 32) == 1)
      {
        swift_bridgeObjectRelease();
        v10 = 1;
        return v10 & 1;
      }
    }
    else
    {
      OUTLINED_FUNCTION_0_8();
    }
    v10 = sub_1A039601C();
    OUTLINED_FUNCTION_4();
    return v10 & 1;
  }
  v10 = v12 == 1;
  return v10 & 1;
}

unint64_t sub_1A03832FC()
{
  unint64_t result;

  result = qword_1ED0CCB60;
  if (!qword_1ED0CCB60)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for FeatureState, &type metadata for FeatureState);
    atomic_store(result, (unint64_t *)&qword_1ED0CCB60);
  }
  return result;
}

uint64_t type metadata accessor for Settings()
{
  return objc_opt_self();
}

uint64_t sub_1A0383358()
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

#error "1A0383400: call analysis failed (funcsize=15)"

BOOL sub_1A0383418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v7;

  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_6_0(v2, v7);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_16();
  v4 = v3;
  OUTLINED_FUNCTION_35();
  if (v4)
  {
    OUTLINED_FUNCTION_5_1();
    v5 = sub_1A03877C4();

    OUTLINED_FUNCTION_23();
  }
  else
  {
    v5 = 0;
  }
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  return v5;
}

uint64_t sub_1A03834A8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_13_0();
  v1(v2);
  return swift_release();
}

uint64_t sub_1A03834D0()
{
  uint64_t v0;

  return sub_1A0386588(v0);
}

uint64_t sub_1A03834D8(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((a1
                                                                                            + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)
                                                                                            + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
  return swift_bridgeObjectRelease();
}

void AppGroup.containerURL.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  sub_1A03836F8();
  v4 = MEMORY[0x1E0C80A78](v3);
  v6 = &v11[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v8 = &v11[-v7];
  v9 = v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  OUTLINED_FUNCTION_3_2();
  sub_1A0383678(v9, (uint64_t)v8);
  v10 = OUTLINED_FUNCTION_1_4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v10) == 1)
  {
    sub_1A03836BC((uint64_t)v8);
    sub_1A038374C(a1);
    OUTLINED_FUNCTION_4_3((uint64_t)v6, a1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16));
    __swift_storeEnumTagSinglePayload((uint64_t)v6, 0, 1, v10);
    OUTLINED_FUNCTION_3_2();
    sub_1A0383990((uint64_t)v6, v9);
    swift_endAccess();
  }
  else
  {
    OUTLINED_FUNCTION_4_3(a1, (uint64_t)v8, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32));
  }
  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_1A0383678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03836F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A03836BC(uint64_t a1)
{
  uint64_t v2;

  sub_1A03836F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A03836F8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCB20)
  {
    sub_1A0395C80();
    v0 = sub_1A0395F14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCB20);
  }
}

uint64_t sub_1A038374C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  id v11;
  void (*v12)(char *, char *, uint64_t);
  NSString *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD v20[2];

  v2 = sub_1A0395C80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A03836F8();
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v10 = (void *)sub_1A0395D64();
  v11 = objc_msgSend(v9, sel_containerURLForSecurityApplicationGroupIdentifier_, v10);

  if (v11)
  {
    sub_1A0395C74();

    v12 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v12(v8, v5, v2);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v2);
    if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v2) != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v8, v2);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 1, 1, v2);
  }
  v14 = NSTemporaryDirectory();
  v15 = sub_1A0395D70();
  v17 = v16;

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3A28]), sel_init);
  v19 = objc_msgSend(v18, sel_UUIDString);

  sub_1A0395D70();
  v20[0] = v15;
  v20[1] = v17;
  swift_bridgeObjectRetain();
  sub_1A0395D94();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A0395C5C();
  swift_bridgeObjectRelease();
  return sub_1A03836BC((uint64_t)v8);
}

uint64_t sub_1A0383990(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03836F8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1A03839D4()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[6];

  v2[4] = MEMORY[0x1E0DE9D18] + 64;
  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2[5] = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

void Setting<>.init(_:defaultValue:min:max:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24[3];
  char v25;

  v22 = a4;
  v23 = a5;
  v12 = *(_QWORD *)(v6 + 88);
  v13 = type metadata accessor for Trait(0, v12, a3, a4);
  v14 = OUTLINED_FUNCTION_5_2(v13);
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v21 - v16;
  v18 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v15);
  OUTLINED_FUNCTION_6_1();
  LOBYTE(a6) = *a6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v7, a3, v12);
  v25 = (char)a6;
  v24[0] = 0;
  v24[1] = 0;
  Setting.__allocating_init(_:defaultValue:domain:access:)(a1, a2, v7, v24, &v25);
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(a3, v12);
  v19 = &v17[*(int *)(swift_getTupleTypeMetadata2() + 48)];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 32);
  v20(v17, v22, v12);
  v20(v19, v23, v12);
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_4();
  swift_endAccess();
  OUTLINED_FUNCTION_0_4();
}

uint64_t Option.init(label:value:description:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X8>)
{
  uint64_t v12;
  uint64_t result;
  uint64_t *v14;

  *(_QWORD *)a7 = a1;
  *((_QWORD *)a7 + 1) = a2;
  v12 = type metadata accessor for Option(0, a6, a3, a4);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(&a7[*(int *)(v12 + 28)], a3, a6);
  v14 = (uint64_t *)&a7[*(int *)(v12 + 32)];
  *v14 = a4;
  v14[1] = a5;
  return result;
}

uint64_t type metadata accessor for Option(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Option);
}

uint64_t Updatable.save<A>(setting:value:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD *v12;

  v2 = *a1;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v3 = qword_1ED0CD200;
  v12 = a1;
  v6 = v2 + 88;
  v5 = *(_QWORD *)(v2 + 88);
  v4 = *(_QWORD *)(v6 + 8);
  v7 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v4 + 32);
  swift_retain();
  v7(v11, v5, v4);
  v9 = type metadata accessor for Setting(0, v5, v4, v8);
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v9);
  sub_1A0383CFC((uint64_t)&v12, v11, v3, v9);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return swift_release();
}

void sub_1A0383CFC(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13[4];

  v5 = *(_QWORD *)(a4 - 8);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v5 + 16))((char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = OUTLINED_FUNCTION_12();
  v8 = OUTLINED_FUNCTION_33(v7);
  OUTLINED_FUNCTION_2_3();
  if (v8)
  {
    OUTLINED_FUNCTION_3_1();
    v13[0] = v13[2];
    v13[1] = v13[3];
    sub_1A0387730(v13);
    v10 = v9;
    swift_bridgeObjectRelease();
    if (v10)
    {
      __swift_project_boxed_opaque_existential_1(a2, a2[3]);
      v11 = sub_1A0396010();
      OUTLINED_FUNCTION_5_1();
      v12 = (void *)OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_2_3();
      objc_msgSend(v10, sel_setObject_forKey_, v11, v12);

      swift_unknownObjectRelease();
    }
  }
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  OUTLINED_FUNCTION_18();
}

uint64_t Setting.__deallocating_deinit()
{
  Setting.deinit();
  return swift_deallocClassInstance();
}

void Setting.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_1();
  v2 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 152);
  v5 = type metadata accessor for Trait(0, v0, v3, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_1A0383E88(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = *(unsigned __int8 *)(v4 + 80);
  v7 = v5 + v6;
  v8 = ((v5 + v6) & ~v6) + v5;
  if (v8 <= 8)
    v8 = 8;
  v9 = *(unsigned __int8 *)(a1 + v8);
  if (v9 >= 2)
  {
    if (v8 <= 3)
      v10 = v8;
    else
      v10 = 4;
    __asm { BR              X15 }
  }
  if (v9 != 1)
    return swift_bridgeObjectRelease();
  v12 = ~v6;
  v13 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v13(a1, v3);
  return ((uint64_t (*)(uint64_t, uint64_t))v13)((v7 + a1) & v12, v3);
}

uint64_t type metadata accessor for SettingReader()
{
  return objc_opt_self();
}

uint64_t SettingGroup.__allocating_init(key:defaultValue:access:domain:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  char v13;

  v13 = *a4;
  v8 = (*(uint64_t (**)(void))(v4 + 136))();
  v9 = *(_QWORD *)(v8 + 16);
  if (v9)
  {
    v10 = *(_QWORD *)(v9 + 16);
    v11 = *(_QWORD *)(v9 + 24);
    sub_1A0388548(0, v5, v6, v7);
    OUTLINED_FUNCTION_0();
    *(_QWORD *)(v8 + 16) = sub_1A0384434(v10, v11);
    swift_bridgeObjectRetain();
    swift_release();
    return v8;
  }
  else
  {
    swift_retain();
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

_QWORD *SettingGroup.init(key:defaultValue:access:)(uint64_t a1, uint64_t a2, int a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(__int128 *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  _UNKNOWN **v27;
  __int128 v28;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __int128 v34;
  uint64_t v35;

  v4 = v3;
  v21 = a3;
  v19 = a2;
  v18 = a1;
  v17 = *v3;
  v23 = sub_1A039607C();
  v22 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4[2] = 0;
  v24 = type metadata accessor for SettingGroup();
  *((_QWORD *)&v34 + 1) = v24;
  v32 = (unint64_t)v4;
  OUTLINED_FUNCTION_1();
  sub_1A0396064();
  v20 = v6;
  sub_1A0396070();
  sub_1A0395FB0();
  swift_release();
  swift_retain();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0();
  while (v35)
  {
    swift_bridgeObjectRelease();
    sub_1A0385308(&v34, &v28);
    sub_1A0384B38(0, &qword_1ED0CCAA8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_1A0384B84(&v25, (uint64_t)v29);
      v8 = v30;
      v7 = v31;
      __swift_project_boxed_opaque_existential_1(v29, v30);
      *((_QWORD *)&v26 + 1) = v24;
      v27 = &off_1E43710F0;
      *(_QWORD *)&v25 = v4;
      v9 = *(void (**)(__int128 *, uint64_t, uint64_t))(v7 + 80);
      OUTLINED_FUNCTION_1();
      v9(&v25, v8, v7);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v25);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
    }
    else
    {
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      sub_1A0389C70((uint64_t)&v25);
    }
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_4_0();
  }
  swift_release_n();
  v13 = v19;
  if (v19)
  {
    v14 = v18;
  }
  else
  {
    v32 = 0;
    v33 = 0xE000000000000000;
    sub_1A0395F44();
    swift_bridgeObjectRelease();
    v32 = 0xD000000000000011;
    v33 = 0x80000001A03976F0;
    sub_1A0396088();
    sub_1A0395D94();
    swift_bridgeObjectRelease();
    v14 = v32;
    v13 = v33;
  }
  sub_1A0388548(0, v10, v11, v12);
  OUTLINED_FUNCTION_0();
  v15 = sub_1A0384434(v14, v13);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v20, v23);
  v4[2] = v15;
  swift_release();
  return v4;
}

uint64_t type metadata accessor for SettingGroup()
{
  return objc_opt_self();
}

uint64_t sub_1A038439C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A03843E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1A03843E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCAC0)
  {
    sub_1A0388A6C();
    v0 = sub_1A0395F14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCAC0);
  }
}

uint64_t sub_1A0384434(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  __n128 *v8;

  OUTLINED_FUNCTION_7(a1, a2);
  v3 = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)(v2 + 32) = v4;
  *(_BYTE *)(v2 + 40) = v4;
  *(_QWORD *)(v2 + 64) = v3;
  *(_QWORD *)(v2 + 72) = v5;
  *(_QWORD *)(v2 + 80) = v6;
  *(_BYTE *)(v2 + 88) = v7;
  sub_1A03847E4(0, (unint64_t *)&qword_1ED0CCD80, (unint64_t *)&qword_1ED0CCC28, (uint64_t)&protocol descriptor for ConditionType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v8 = (__n128 *)OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_2_1(v8, (unint64_t)&type metadata for Access, (__n128)xmmword_1A03964B0);
}

uint64_t Setting<>.init(_:defaultValue:access:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, char *a4)
{
  char v4;
  char v6;
  uint64_t v7[2];
  unsigned __int8 v8;

  v4 = *a4;
  v8 = *a3;
  v7[0] = 0;
  v7[1] = 0;
  v6 = v4;
  return Setting<>.init(_:defaultValue:domain:access:)(a1, a2, &v8, v7, &v6);
}

uint64_t Setting<>.init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t *a4, char *a5)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v7 = *a4;
  v8 = a4[1];
  v9 = *a5;
  v10 = *a3;
  sub_1A03845DC(0, a2, (uint64_t)a3, (uint64_t)a4);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1A0396D80;
  *(_BYTE *)(v11 + 48) = 0;
  *(_QWORD *)(v11 + 32) = 0x746C7561666544;
  *(_QWORD *)(v11 + 40) = 0xE700000000000000;
  *(_QWORD *)(v11 + 56) = 0;
  *(_QWORD *)(v11 + 64) = 0;
  *(_BYTE *)(v11 + 88) = 1;
  *(_QWORD *)(v11 + 72) = 0x64656C62616E45;
  *(_QWORD *)(v11 + 80) = 0xE700000000000000;
  *(_BYTE *)(v11 + 128) = 2;
  *(_QWORD *)(v11 + 96) = 0;
  *(_QWORD *)(v11 + 104) = 0;
  *(_QWORD *)(v11 + 112) = 0x64656C6261736944;
  *(_QWORD *)(v11 + 120) = 0xE800000000000000;
  *(_QWORD *)(v11 + 136) = 0;
  *(_QWORD *)(v11 + 144) = 0;
  return sub_1A0384630(a1, a2, v10, v7, v8, v9, v11);
}

void sub_1A03845DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CCB08)
  {
    sub_1A038FA00(255, a2, a3, a4);
    v4 = sub_1A0396004();
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CCB08);
  }
}

uint64_t sub_1A0384630(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  char v16;

  swift_allocObject();
  v14 = sub_1A03846E4(a1, a2, a3, a4, a5, a6);
  swift_beginAccess();
  v15 = *(_QWORD *)(v14 + 104);
  *(_QWORD *)(v14 + 104) = a7;
  v16 = *(_BYTE *)(v14 + 112);
  *(_BYTE *)(v14 + 112) = 0;
  sub_1A0384894(v15, v16);
  return v14;
}

uint64_t sub_1A03846E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  char v10;
  unint64_t v11;
  uint64_t v12;
  __n128 *v13;
  __int128 v15;
  uint64_t v16;

  OUTLINED_FUNCTION_7(a1, a2);
  *(_BYTE *)(v6 + 32) = v10;
  if (v10)
  {
    if (v10 == 1)
    {
      v11 = 0xE700000000000000;
      v12 = 0x64656C62616E65;
    }
    else
    {
      v11 = 0xE800000000000000;
      v12 = 0x64656C6261736964;
    }
  }
  else
  {
    v11 = 0xE700000000000000;
    v12 = 0x746C7561666564;
  }
  v16 = MEMORY[0x1E0DEA968];
  *(_QWORD *)&v15 = v12;
  *((_QWORD *)&v15 + 1) = v11;
  sub_1A0385308(&v15, (_OWORD *)(v6 + 40));
  *(_QWORD *)(v6 + 72) = a4;
  *(_QWORD *)(v6 + 80) = a5;
  *(_BYTE *)(v6 + 88) = a6;
  sub_1A03847E4(0, (unint64_t *)&qword_1ED0CCD80, (unint64_t *)&qword_1ED0CCC28, (uint64_t)&protocol descriptor for ConditionType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DED1E8]);
  v13 = (__n128 *)OUTLINED_FUNCTION_0();
  return OUTLINED_FUNCTION_2_1(v13, (unint64_t)&type metadata for Access, (__n128)xmmword_1A03964B0);
}

void sub_1A03847E4(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t))
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;

  if (!*a2)
  {
    v8 = sub_1A0384B38(255, a3);
    v9 = a5(a1, v8);
    if (!v10)
      atomic_store(v9, a2);
  }
}

void sub_1A0384844(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_1A0384B38(255, a3);
    v4 = sub_1A0396004();
    if (!v5)
      atomic_store(v4, a2);
  }
  OUTLINED_FUNCTION_2();
}

uint64_t sub_1A0384894(uint64_t a1, char a2)
{
  uint64_t result;

  if (!a2)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_1A03848A4(uint64_t a1)
{
  return sub_1A03848C4(a1);
}

uint64_t sub_1A03848C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 144));
  sub_1A0384ADC();
  v4 = *(_QWORD **)(*v3 + 16);
  sub_1A0384924(v4);
  v5 = *v3;
  *(_QWORD *)(v5 + 16) = (char *)v4 + 1;
  return sub_1A0386F1C(a1, v5 + 40 * (_QWORD)v4 + 32);
}

_QWORD *sub_1A0384924(_QWORD *result)
{
  _QWORD **v1;
  unint64_t v2;

  v2 = (*v1)[3];
  if ((uint64_t)result + 1 > (uint64_t)(v2 >> 1))
  {
    result = sub_1A0384978((_QWORD *)(v2 > 1), (int64_t)result + 1, 1, *v1, (unint64_t *)&qword_1ED0CCD80, (unint64_t *)&qword_1ED0CCC28);
    *v1 = result;
  }
  return result;
}

_QWORD *sub_1A0384978(_QWORD *result, int64_t a2, char a3, _QWORD *a4, unint64_t *a5, unint64_t *a6)
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;

  v8 = (char)result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_1A0384844(0, a5, a6);
    v13 = (_QWORD *)OUTLINED_FUNCTION_0();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((v8 & 1) != 0)
  {
    if (v13 != a4 || &a4[5 * v11 + 4] <= v13 + 4)
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
  }
  else
  {
    sub_1A0384B38(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v13;
}

char *sub_1A0384AB4(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[40 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_10(a3, result);
  return result;
}

void sub_1A0384ADC()
{
  _QWORD **v0;
  _QWORD *v1;
  _QWORD *isUniquelyReferenced_nonNull_native;

  v1 = *v0;
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)isUniquelyReferenced_nonNull_native)
    *v0 = sub_1A0384978(isUniquelyReferenced_nonNull_native, v1[2] + 1, 1, v1, (unint64_t *)&qword_1ED0CCD80, (unint64_t *)&qword_1ED0CCC28);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_1A0384B38(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1A0384B84(__int128 *a1, uint64_t a2)
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

uint64_t sub_1A0384BC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD aBlock[6];

  v1 = sub_1A0395D04();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1A0395D1C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    sub_1A0384ED4();
    v14 = (void *)sub_1A0395EFC();
    aBlock[4] = sub_1A03834D0;
    aBlock[5] = v0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A03834A8;
    aBlock[3] = &block_descriptor;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1A0395D10();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1A0384E94(&qword_1ED0CCC00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1A0384F10();
    sub_1A0384E94(&qword_1ED0CCC10, (uint64_t (*)(uint64_t))sub_1A0384F10, MEMORY[0x1E0DEAF38]);
    sub_1A0395F2C();
    MEMORY[0x1A1AF884C](0, v8, v4, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  sub_1A03869C8();
  swift_beginAccess();
  v9 = *(_QWORD *)(v0 + 24);
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain_n();
    result = sub_1A0395FE0();
    v10 = result;
    if (result)
      goto LABEL_4;
    return swift_bridgeObjectRelease_n();
  }
  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain_n();
  if (!v10)
    return swift_bridgeObjectRelease_n();
LABEL_4:
  if (v10 >= 1)
  {
    for (i = 0; i != v10; ++i)
    {
      if ((v9 & 0xC000000000000001) != 0)
      {
        v13 = MEMORY[0x1A1AF88A0](i, v9);
      }
      else
      {
        v13 = *(_QWORD *)(v9 + 8 * i + 32);
        swift_retain();
      }
      (*(void (**)(void))(v13 + 24))();
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A0384E94(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1A1AF8C30](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1A0384ED4()
{
  unint64_t result;

  result = qword_1ED0CCC18;
  if (!qword_1ED0CCC18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CCC18);
  }
  return result;
}

void sub_1A0384F10()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCC08)
  {
    sub_1A0395D04();
    v0 = sub_1A0395EB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCC08);
  }
}

uint64_t sub_1A0384F64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t inited;

  v0 = swift_checkMetadataState();
  v3 = v0;
  if (v4 <= 0x3F)
  {
    v3 = type metadata accessor for Trait(319, v0, v1, v2);
    if (v5 <= 0x3F)
    {
      inited = swift_initClassMetadata2();
      if (inited)
        return inited;
      else
        return 0;
    }
  }
  return v3;
}

void Setting<>.init(_:defaultValue:domain:access:options:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _BYTE *a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  char v24;

  v21 = a2;
  v22 = a6;
  v20 = a1;
  v11 = *(_QWORD *)(v6 + 88);
  v12 = type metadata accessor for Trait(0, v11, a3, (uint64_t)a4);
  v13 = OUTLINED_FUNCTION_5_2(v12);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (uint64_t *)((char *)&v20 - v15);
  v17 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v14);
  OUTLINED_FUNCTION_6_1();
  v19 = *a4;
  v18 = a4[1];
  LOBYTE(a5) = *a5;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v7, a3, v11);
  v23[0] = v19;
  v23[1] = v18;
  v24 = (char)a5;
  Setting.__allocating_init(_:defaultValue:domain:access:)(v20, v21, v7, v23, &v24);
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(a3, v11);
  *v16 = v22;
  swift_storeEnumTagMultiPayload();
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_4_4();
  swift_endAccess();
  OUTLINED_FUNCTION_0_4();
}

uint64_t Setting.__allocating_init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char *a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  Setting.init(_:defaultValue:domain:access:)(a1, a2, a3, a4, a5);
  return v10;
}

char *Setting.init(_:defaultValue:domain:access:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, char *a5)
{
  char *v5;
  char *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_OWORD *__return_ptr, uint64_t, uint64_t);
  char *v18;
  uint64_t v19;
  _OWORD v21[2];

  v6 = v5;
  v10 = *(_QWORD *)v6;
  v11 = *a4;
  v12 = a4[1];
  v13 = *a5;
  v14 = *(_QWORD *)(*(_QWORD *)v6 + 88);
  type metadata accessor for Trait(0, v14, a3, (uint64_t)a4);
  swift_storeEnumTagMultiPayload();
  *((_QWORD *)v6 + 2) = a1;
  *((_QWORD *)v6 + 3) = a2;
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(&v6[*(_QWORD *)(*(_QWORD *)v6 + 112)], a3, v14);
  v16 = *(_QWORD *)(v10 + 96);
  v17 = *(void (**)(_OWORD *__return_ptr, uint64_t, uint64_t))(v16 + 32);
  OUTLINED_FUNCTION_1();
  v17(v21, v14, v16);
  sub_1A0385308(v21, &v6[*(_QWORD *)(*(_QWORD *)v6 + 120)]);
  v18 = &v6[*(_QWORD *)(*(_QWORD *)v6 + 128)];
  *(_QWORD *)v18 = v11;
  *((_QWORD *)v18 + 1) = v12;
  v6[*(_QWORD *)(*(_QWORD *)v6 + 136)] = v13;
  sub_1A0385318();
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1A03964B0;
  *(_QWORD *)(v19 + 56) = &type metadata for Access;
  *(_QWORD *)(v19 + 64) = &off_1E4371990;
  *(_BYTE *)(v19 + 32) = v13;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a3, v14);
  *(_QWORD *)&v6[*(_QWORD *)(*(_QWORD *)v6 + 144)] = v19;
  swift_release();
  return v6;
}

uint64_t type metadata accessor for Trait(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Trait);
}

_OWORD *sub_1A0385308(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1A0385318()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCD80)
  {
    sub_1A0389574();
    v0 = sub_1A0396004();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCD80);
  }
}

uint64_t Bool.toData()@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 + 24) = MEMORY[0x1E0DEAFA0];
  *(_BYTE *)a2 = result;
  return result;
}

uint64_t sub_1A0385380@<X0>(uint64_t a1@<X8>)
{
  unsigned __int8 *v1;

  return Bool.toData()(*v1, a1);
}

unsigned __int8 *sub_1A0385388(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unsigned __int8 *, uint64_t);
  unsigned int v16;
  uint64_t v17;
  void (*v18)(unsigned __int8 *, unsigned __int8 *, uint64_t);

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    v10 = ((v7 + v8) & ~v8) + v7;
    if (v10 <= 8)
      v11 = 8;
    else
      v11 = v10;
    v12 = __dst[v11];
    if (v12 >= 2)
    {
      if (v11 <= 3)
        v13 = v11;
      else
        v13 = 4;
      __asm { BR              X13 }
    }
    v14 = ~v8;
    if (v12 == 1)
    {
      v15 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v15(__dst, *(_QWORD *)(a3 + 16));
      v15((unsigned __int8 *)((unint64_t)&__dst[v9] & v14), v5);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v16 = __src[v11];
    if (v16 >= 2)
    {
      if (v11 <= 3)
        v17 = v11;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
    {
      v18 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 32);
      v18(__dst, __src, v5);
      v18((unsigned __int8 *)((unint64_t)&__dst[v9] & v14), (unsigned __int8 *)((unint64_t)&__src[v9] & v14), v5);
      __dst[v11] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v11] = 0;
    }
  }
  return __dst;
}

uint64_t RawRepresentable<>.toData()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v7 = (char *)&v9 - v6;
  sub_1A0395E0C();
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(AssociatedTypeWitness, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
}

uint64_t String.toData()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  a3[3] = MEMORY[0x1E0DEA968];
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A0385654@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return String.toData()(*v1, v1[1], a1);
}

uint64_t Int.toData()@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  return OUTLINED_FUNCTION_5_0(result, a2);
}

uint64_t sub_1A0385668@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return Int.toData()(*v1, a1);
}

void Double.toData()(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEB070];
  *(double *)a1 = a2;
}

void sub_1A0385684(uint64_t a1@<X8>)
{
  double *v1;

  Double.toData()(a1, *v1);
}

uint64_t Date.toData()@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1A0395CA4();
  a1[3] = MEMORY[0x1E0DEB070];
  *a1 = v3;
  return result;
}

uint64_t sub_1A03856C0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return Array<A>.toData()(*v1, a1);
}

uint64_t Array<A>.toData()@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;

  sub_1A0387FA8();
  a2[3] = v4;
  *a2 = a1;
  return swift_bridgeObjectRetain();
}

_QWORD *SettingProperty.init(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_8_2();
  v8 = v7 - v6;
  swift_getFunctionTypeMetadata1();
  v9 = sub_1A0395E6C();
  v1[2] = a1;
  v1[3] = v9;
  v10 = OUTLINED_FUNCTION_0();
  swift_weakInit();
  v11 = (_QWORD *)OUTLINED_FUNCTION_0();
  v11[2] = v4;
  v11[3] = *(_QWORD *)(v3 + 88);
  v11[4] = v10;
  swift_retain();
  swift_retain();
  Configurable.setting<A>(_:_:)();
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_12_0(v8, *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8));
  swift_release();
  return v1;
}

void Configurable.setting<A>(_:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD v16[2];

  OUTLINED_FUNCTION_5_3();
  v16[0] = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *v8;
  v11 = *(_QWORD *)(*v8 + 88);
  v12 = sub_1A0395F14();
  OUTLINED_FUNCTION_7_2();
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v16 - v14;
  __swift_storeEnumTagSinglePayload((uint64_t)v16 - v14, 1, 1, v11);
  (*(void (**)(uint64_t *, char *, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(v3 + 32))(v9, v15, v7, v5, v11, *(_QWORD *)(v10 + 96), v16[0], v3);
  (*(void (**)(char *, uint64_t))(v0 + 8))(v15, v12);
  OUTLINED_FUNCTION_0_4();
}

void Configurable.setting<A>(_:defaultValue:_:)()
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
  uint64_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31[5];

  OUTLINED_FUNCTION_5_3();
  v27 = v0;
  v28 = v2;
  v4 = v3;
  v6 = v5;
  v29 = v7;
  v30 = v8;
  v26 = v9;
  v11 = v10;
  v12 = *v10;
  v13 = *(_QWORD *)(*v10 + 88);
  v14 = OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_2();
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v26 - v16;
  v18 = swift_bridgeObjectRetain();
  v19 = sub_1A0386DD0(v18);
  swift_bridgeObjectRelease();
  if (v19)
  {
    v26 = swift_allocBox();
    v21 = v20;
    (*(void (**)(uint64_t *, uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 8))(v11, v13, *(_QWORD *)(v12 + 96), v6, v4);
    if (qword_1ED0CCD90 != -1)
      swift_once();
    v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v23 = (_QWORD *)swift_allocObject();
    v23[2] = v6;
    v23[3] = v4;
    v23[4] = v22;
    v23[5] = v11;
    v24 = v28;
    v25 = v29;
    v23[6] = v26;
    v23[7] = v24;
    v23[8] = v25;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A0385B44((uint64_t)sub_1A0386688, (uint64_t)v23, v31);
    swift_release();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v31, v31[3]);
    sub_1A0395CBC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
    swift_beginAccess();
    OUTLINED_FUNCTION_4_5(v30, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16));
    swift_release();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v17, v26, v14);
    if (__swift_getEnumTagSinglePayload((uint64_t)v17, 1, v13) == 1)
    {
      OUTLINED_FUNCTION_4_5(v30, (uint64_t)v11 + *(_QWORD *)(*v11 + 112), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16));
      (*(void (**)(char *, uint64_t))(v1 + 8))(v17, v14);
    }
    else
    {
      OUTLINED_FUNCTION_4_5(v30, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 32));
    }
  }
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A0385B44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
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
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v4 = v3;
  v8 = sub_1A0395D04();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1A0395D1C();
  v25 = *(_QWORD *)(v12 - 8);
  v26 = v12;
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for SettingsStore.SettingObserver();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_13_0();
  v16 = swift_retain();
  v17 = sub_1A0385EB0(v16, a1, a2);
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    sub_1A0385DDC(v4);
  }
  else
  {
    sub_1A0384ED4();
    v18 = sub_1A0395EFC();
    v24 = v9;
    v19 = (void *)v18;
    v20 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v20 + 16) = v4;
    *(_QWORD *)(v20 + 24) = v17;
    aBlock[4] = sub_1A0389658;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A03834A8;
    aBlock[3] = &block_descriptor_3;
    v21 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    OUTLINED_FUNCTION_20();
    sub_1A0395D10();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1A0384E94(&qword_1ED0CCC00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1A0384F10();
    sub_1A0384E94(&qword_1ED0CCC10, (uint64_t (*)(uint64_t))sub_1A0384F10, MEMORY[0x1E0DEAF38]);
    sub_1A0395F2C();
    MEMORY[0x1A1AF884C](0, v14, v11, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v26);
  }
  a3[3] = v15;
  result = sub_1A0384E94(&qword_1ED0CC898, (uint64_t (*)(uint64_t))type metadata accessor for SettingsStore.SettingObserver, (uint64_t)&unk_1A03967E8);
  a3[4] = result;
  *a3 = v17;
  return result;
}

uint64_t sub_1A0385DDC(uint64_t a1)
{
  uint64_t v2;

  sub_1A03869C8();
  swift_beginAccess();
  v2 = swift_retain();
  MEMORY[0x1A1AF8768](v2);
  sub_1A0385E64(*(_QWORD *)((*(_QWORD *)(a1 + 24) & 0xFFFFFFFFFFFFF8) + 0x10));
  sub_1A0395E84();
  sub_1A0395E48();
  return swift_endAccess();
}

uint64_t sub_1A0385E64(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_1A0395E60();
  return result;
}

uint64_t type metadata accessor for SettingsStore.SettingObserver()
{
  return objc_opt_self();
}

uint64_t sub_1A0385EB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  *(_QWORD *)(v3 + 24) = a2;
  *(_QWORD *)(v3 + 32) = a3;
  return v3;
}

uint64_t sub_1A0385F00()
{
  return sub_1A0385F20();
}

uint64_t sub_1A0385F20()
{
  return swift_unknownObjectWeakAssign();
}

void sub_1A0385F30()
{
  Configurable.setting<A>(_:defaultValue:_:)();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_1_0(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_1A038789C(a1, (uint64_t)va);
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_1A0395C80();
}

uint64_t OUTLINED_FUNCTION_1_5()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v0 + 88) - 8) + 8))(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112), *(_QWORD *)(v0 + 88));
}

void OUTLINED_FUNCTION_1_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  Configurable.setting<A>(_:)(a1, a4, a5, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19, a20);
}

unint64_t OUTLINED_FUNCTION_1_7()
{
  return sub_1A0384ED4();
}

uint64_t OUTLINED_FUNCTION_1_8()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return 1;
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_0_3()
{
  return sub_1A039604C();
}

void OUTLINED_FUNCTION_0_6()
{
  Configurable.setting<A>(_:_:)();
}

_QWORD *OUTLINED_FUNCTION_0_7()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return 0x746C7561666564;
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 32))(v0, v1);
}

void *OUTLINED_FUNCTION_0_10@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return swift_bridgeObjectRetain();
}

_QWORD *OUTLINED_FUNCTION_0_12()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(char *))(v2 + 16))((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0));
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return sub_1A0395F14();
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  return sub_1A0395D28();
}

void OUTLINED_FUNCTION_6_4()
{
  sub_1A0394D58();
}

uint64_t OUTLINED_FUNCTION_7(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 104) = 0;
  *(_BYTE *)(v2 + 112) = 2;
  *(_QWORD *)(v2 + 16) = result;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t *OUTLINED_FUNCTION_7_0(uint64_t a1)
{
  uint64_t *v1;

  v1[3] = a1;
  return __swift_allocate_boxed_opaque_existential_0(v1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_3()
{
  return sub_1A0395EFC();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1A1AF8BE8](a1, v6, a5);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
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

uint64_t OUTLINED_FUNCTION_2_1@<X0>(__n128 *a1@<X0>, unint64_t a2@<X8>, __n128 a3@<Q0>)
{
  unint64_t v3;
  unsigned __int8 v4;
  uint64_t v5;

  a1[1] = a3;
  a1[3].n128_u64[1] = a2;
  a1[4].n128_u64[0] = v3;
  a1[2].n128_u8[0] = v4;
  *(_QWORD *)(v5 + 96) = a1;
  return v5;
}

void OUTLINED_FUNCTION_2_2(_BYTE *a1@<X8>)
{
  char v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  return swift_beginAccess();
}

void OUTLINED_FUNCTION_2_6()
{
  Configurable.setting<A>(_:defaultValue:_:)();
}

uint64_t OUTLINED_FUNCTION_2_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  return type metadata accessor for Item(0, v4, *(_QWORD *)(v5 + 88), a4);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_3_0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  if (!a1)
    return 0;
  return a10;
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 40))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_2()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + *(_QWORD *)(*(_QWORD *)v0 + 120));
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return swift_getFunctionTypeMetadata1();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;

  return sub_1A038439C(v0 - 184, v0 - 136);
}

uint64_t OUTLINED_FUNCTION_4_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return sub_1A0395D64();
}

uint64_t OUTLINED_FUNCTION_4_3@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 120) + 40))(v2, v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_5@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  return 0;
}

void OUTLINED_FUNCTION_4_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  Configurable.setting<A>(_:)(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return sub_1A0395FEC();
}

uint64_t OUTLINED_FUNCTION_5_0@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  a2[3] = v2;
  *a2 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_5_2(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 120) = *(_QWORD *)(result - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_retain();
}

double OUTLINED_FUNCTION_5_5()
{
  uint64_t v0;
  double result;
  uint64_t v2;

  result = 0.0;
  v2 = *(_QWORD *)(v0 - 152);
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)v2 = 0u;
  *(_BYTE *)(v2 + 80) = 11;
  return result;
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return sub_1A0395E48();
}

_QWORD *OUTLINED_FUNCTION_9()
{
  _QWORD *v0;

  return __swift_project_boxed_opaque_existential_1(v0, v0[3]);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_beginAccess();
}

BOOL OUTLINED_FUNCTION_9_1@<W0>(char a1@<W8>)
{
  return (a1 & 1) == 0;
}

id OUTLINED_FUNCTION_15(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  uint64_t v10;

  return objc_msgSend(a10, a2, v10);
}

uint64_t OUTLINED_FUNCTION_12()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 56))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_12_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_16()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 - 72);
  *(_QWORD *)(v0 - 96) = *(_QWORD *)(v0 - 80);
  *(_QWORD *)(v0 - 88) = v1;
  sub_1A0387730((uint64_t *)(v0 - 96));
}

uint64_t sub_1A0386588(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  uint64_t v6;

  sub_1A03869C8();
  swift_beginAccess();
  v2 = *(_QWORD *)(a1 + 24);
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  result = sub_1A0395FE0();
  v3 = result;
  if (!result)
    return swift_bridgeObjectRelease_n();
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x1A1AF88A0](i, v2);
      }
      else
      {
        v6 = *(_QWORD *)(v2 + 8 * i + 32);
        swift_retain();
      }
      (*(void (**)(void))(v6 + 24))();
      swift_release();
    }
    return swift_bridgeObjectRelease_n();
  }
  __break(1u);
  return result;
}

uint64_t sub_1A0386688()
{
  uint64_t v0;

  return sub_1A03866E8(*(_QWORD *)(v0 + 32), *(uint64_t **)(v0 + 40), *(_QWORD *)(v0 + 48), *(void (**)(char *))(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

#error "1A03866D4: call analysis failed (funcsize=18)"

uint64_t sub_1A03866E8(uint64_t a1, uint64_t *a2, uint64_t a3, void (*a4)(char *), uint64_t a5, uint64_t a6, uint64_t a7)
{
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
  uint64_t result;
  void (*v22)(char *, uint64_t, uint64_t);
  char v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  void (*v26)(char *);

  v25 = a5;
  v26 = a4;
  v10 = *a2;
  v11 = *(_QWORD *)(*a2 + 88);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x1E0C80A78](a1);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v25 - v17;
  v19 = v16 + 16;
  v20 = swift_projectBox();
  swift_beginAccess();
  result = MEMORY[0x1A1AF8D20](v19);
  if (result)
  {
    (*(void (**)(uint64_t *, uint64_t, _QWORD, uint64_t, uint64_t))(a7 + 8))(a2, v11, *(_QWORD *)(v10 + 96), a6, a7);
    swift_beginAccess();
    v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v22(v15, v20, v11);
    v23 = sub_1A0395D58();
    v24 = *(void (**)(char *, uint64_t))(v12 + 8);
    v24(v15, v11);
    if ((v23 & 1) != 0)
    {
      v24(v18, v11);
      return swift_unknownObjectRelease();
    }
    else
    {
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v12 + 24))(v20, v18, v11);
      swift_beginAccess();
      v22(v15, v20, v11);
      v26(v15);
      swift_unknownObjectRelease();
      v24(v15, v11);
      return ((uint64_t (*)(char *, uint64_t))v24)(v18, v11);
    }
  }
  return result;
}

void Configurable.setting<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;

  OUTLINED_FUNCTION_5_3();
  a19 = v20;
  a20 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = *v26;
  v29 = *(_QWORD *)(*v26 + 88);
  v30 = sub_1A0395F14();
  v31 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v33 = (char *)&a9 - v32;
  __swift_storeEnumTagSinglePayload((uint64_t)&a9 - v32, 1, 1, v29);
  (*(void (**)(uint64_t *, char *, uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 16))(v27, v33, v29, *(_QWORD *)(v28 + 96), v25, v23);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v33, v30);
  OUTLINED_FUNCTION_0_4();
}

uint64_t type metadata accessor for SettingReader.Reader()
{
  return objc_opt_self();
}

void sub_1A03869A4()
{
  Configurable.setting<A>(_:defaultValue:)();
}

void sub_1A03869BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t *v20;

  Configurable.setting<A>(_:)(a1, *v20, a5, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t sub_1A03869C8()
{
  uint64_t v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = (_QWORD *)(v0 + 24);
  swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 24);
  v10 = MEMORY[0x1E0DEE9D8];
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v3)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x1E0DEE9D8];
LABEL_17:
    swift_bridgeObjectRelease();
    *v1 = v9;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain_n();
  result = sub_1A0395FE0();
  v3 = result;
  if (!result)
    goto LABEL_16;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x1A1AF88A0](i, v2);
      }
      else
      {
        v6 = *(_QWORD *)(v2 + 8 * i + 32);
        swift_retain();
      }
      v7 = MEMORY[0x1A1AF8D20](v6 + 16);
      v8 = swift_unknownObjectRelease();
      if (v7)
      {
        MEMORY[0x1A1AF8768](v8);
        if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1A0395E60();
        sub_1A0395E84();
        sub_1A0395E48();
      }
      else
      {
        swift_release();
      }
    }
    swift_bridgeObjectRelease();
    v9 = v10;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void Configurable.setting<A>(_:defaultValue:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28[4];
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  OUTLINED_FUNCTION_5_3();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 88);
  v8 = OUTLINED_FUNCTION_6_2();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v27 = (char *)&v28[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v28[-1] - v13;
  v15 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v28[-1] - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v14, v1, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v14, 1, v7) == 1)
  {
    OUTLINED_FUNCTION_4_5((uint64_t)v17, (uint64_t)v3 + *(_QWORD *)(*v3 + 112), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
  else
  {
    OUTLINED_FUNCTION_4_5((uint64_t)v17, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
  }
  v18 = swift_bridgeObjectRetain();
  v19 = sub_1A0386DD0(v18);
  swift_bridgeObjectRelease();
  if (!v19)
  {
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
    v25 = v5;
LABEL_11:
    v26 = (uint64_t)v17;
    goto LABEL_12;
  }
  v21 = v5;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v30 = type metadata accessor for Setting(0, v7, *(_QWORD *)(v6 + 96), v20);
  v31 = MEMORY[0x1A1AF8C30](&unk_1A0396B54, v30);
  v28[3] = v7;
  v29[0] = v3;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v28);
  OUTLINED_FUNCTION_4_5((uint64_t)boxed_opaque_existential_0, (uint64_t)v17, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  swift_retain();
  sub_1A0386FAC(v29);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  v23 = (uint64_t)v27;
  if (!swift_dynamicCast())
  {
    OUTLINED_FUNCTION_8(v23, 1);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v23, v8);
    v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
    v25 = v21;
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_8(v23, 0);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v7);
  v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
  v25 = v21;
  v26 = v23;
LABEL_12:
  OUTLINED_FUNCTION_4_5(v25, v26, v24);
  OUTLINED_FUNCTION_0_4();
}

BOOL sub_1A0386DD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v12[2];
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = MEMORY[0x1E0DEE9D8];
  v16 = MEMORY[0x1E0DEE9D8];
  v3 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (v3)
  {
    v4 = a1 + 32;
    v5 = MEMORY[0x1E0DEE9D8];
    do
    {
      sub_1A0386F1C(v4, (uint64_t)&v13);
      v6 = v14;
      v7 = v15;
      __swift_project_boxed_opaque_existential_1(&v13, v14);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7) & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v13);
      }
      else
      {
        sub_1A0384B84(&v13, (uint64_t)v12);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_1A0387FF0(0, *(_QWORD *)(v5 + 16) + 1, 1);
        v5 = v16;
        v9 = *(_QWORD *)(v16 + 16);
        v8 = *(_QWORD *)(v16 + 24);
        if (v9 >= v8 >> 1)
        {
          sub_1A0387FF0(v8 > 1, v9 + 1, 1);
          v5 = v16;
        }
        *(_QWORD *)(v5 + 16) = v9 + 1;
        sub_1A0384B84(v12, v5 + 40 * v9 + 32);
      }
      v4 += 40;
      --v3;
    }
    while (v3);
    v2 = v16;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(v2 + 16);
  swift_release();
  return v10 == 0;
}

uint64_t sub_1A0386F1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1A0386F64()
{
  _BYTE *v0;

  if (!*v0)
    return 1;
  if (*v0 == 1)
    return (uint64_t)objc_msgSend((id)objc_opt_self(), sel_isInternalBuild);
  return 0;
}

void sub_1A0386FAC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[3];
  uint64_t v16[2];

  v2 = a1[3];
  v3 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 56))(v2, v3);
  LOBYTE(v2) = OUTLINED_FUNCTION_33(v4);
  OUTLINED_FUNCTION_2_3();
  if ((v2 & 1) == 0)
    goto LABEL_5;
  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v6 + 40))(v15, v5, v6);
  v16[0] = v15[0];
  v16[1] = v15[1];
  sub_1A0387730(v16);
  v14 = v7;
  OUTLINED_FUNCTION_35();
  if (v14)
  {
    OUTLINED_FUNCTION_1_1();
    v8 = sub_1A03877C4();
    swift_bridgeObjectRelease();
    if (v8)
    {
      v9 = a1[3];
      v10 = a1[4];
      __swift_project_boxed_opaque_existential_1(a1, v9);
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v10 + 64))(v16, v9, v10);
      __asm { BR              X10 }
    }
    OUTLINED_FUNCTION_26();
    OUTLINED_FUNCTION_19();

  }
  else
  {
LABEL_5:
    OUTLINED_FUNCTION_19();
    sub_1A038789C(v11, v12);
  }
}

#error "1A038715C: call analysis failed (funcsize=34)"

#error "1A0387200: call analysis failed (funcsize=29)"

#error "1A03873C4: call analysis failed (funcsize=45)"

uint64_t sub_1A03876AC()
{
  return sub_1A03876CC();
}

uint64_t sub_1A03876CC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A03876F8@<X0>(_QWORD *a1@<X8>)
{
  return sub_1A0387718(a1);
}

uint64_t sub_1A0387718@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 128));
  v3 = v2[1];
  *a1 = *v2;
  a1[1] = v3;
  return swift_bridgeObjectRetain();
}

void sub_1A0387730(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v2 = a1[1];
  if (v2)
  {
    v3 = *a1;
    objc_allocWithZone(MEMORY[0x1E0C99EA0]);
    swift_bridgeObjectRetain();
    sub_1A03878E4(v3, v2);
  }
  else
  {
    v4 = *(id *)(v1 + 16);
  }
}

uint64_t sub_1A0387794()
{
  return sub_1A03877B4();
}

uint64_t sub_1A03877B4()
{
  return swift_bridgeObjectRetain();
}

BOOL sub_1A03877C4()
{
  void *v0;
  void *v1;
  id v2;
  _OWORD v4[2];

  v1 = (void *)sub_1A0395D64();
  v2 = objc_msgSend(v0, sel_objectForKey_, v1);

  if (v2)
  {
    sub_1A0395F20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_1A038793C((uint64_t)v4);
  return v2 != 0;
}

void sub_1A0387850()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCD88)
  {
    v0 = sub_1A0395F14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCD88);
  }
}

uint64_t sub_1A038789C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t type metadata accessor for Setting(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Setting);
}

void sub_1A03878E4(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (a2)
  {
    v3 = (void *)sub_1A0395D64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(v2, sel_initWithSuiteName_, v3);

  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_1A038793C(uint64_t a1)
{
  uint64_t v2;

  sub_1A0387850();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1A0387978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1A03879E4(a1, a2);
}

uint64_t sub_1A0387998()
{
  return sub_1A03879B8();
}

uint64_t sub_1A03879B8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)v0 + 96) + 16))();
}

uint64_t sub_1A03879E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v3 = v2;
  v6 = *v2;
  v7 = *(_QWORD *)(*v2 + 88);
  v8 = sub_1A0395F14();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v13 - v10;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 + 96) + 24))(a1, v7);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v7) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a2, v11, v7);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a2, (uint64_t)v3 + *(_QWORD *)(*v3 + 112), v7);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t storeEnumTagSinglePayload for FeatureState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A0387B2C + 4 * byte_1A0396D95[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A0387B60 + 4 * byte_1A0396D90[v4]))();
}

uint64_t sub_1A0387B60(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0387B68(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A0387B70);
  return result;
}

uint64_t sub_1A0387B7C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A0387B84);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A0387B88(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0387B90(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t static RawRepresentable<>.dataType.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t static RawRepresentable<>.convert(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness;
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
  char *v16;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[32];

  v19 = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_1A0395F14();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v18 - v9;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x1E0C80A78](v8);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v18 - v15;
  sub_1A038789C(a1, (uint64_t)v20);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_4_1((uint64_t)v10, 0);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v16, v10, AssociatedTypeWitness);
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, AssociatedTypeWitness);
    sub_1A0395E18();
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v16, AssociatedTypeWitness);
  }
  else
  {
    OUTLINED_FUNCTION_4_1((uint64_t)v10, 1);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    return __swift_storeEnumTagSinglePayload(v19, 1, 1, a2);
  }
}

void static String.dataType.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static Bool.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

uint64_t sub_1A0387DB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _BYTE *a4@<X8>)
{
  uint64_t result;

  result = static Bool.convert(from:)(a1, a2, a3);
  *a4 = result;
  return result;
}

uint64_t static Bool.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v4;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  if (OUTLINED_FUNCTION_0_1())
    return v4;
  else
    return 2;
}

uint64_t getEnumTagSinglePayload for Access(unsigned __int8 *a1, unsigned int a2)
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

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_bridgeObjectRelease();
}

double OUTLINED_FUNCTION_8_3@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  double result;

  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v2;
  result = 0.0;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  return result;
}

uint64_t sub_1A0387EF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;

  result = static Array<A>.convert(from:)(a1, a2, a3);
  *a4 = result;
  return result;
}

void sub_1A0387F14(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
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

void static Array<A>.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

uint64_t static Array<A>.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  sub_1A0387FA8();
  if (OUTLINED_FUNCTION_0_1())
    return v4;
  else
    return 0;
}

void sub_1A0387FA8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CC868)
  {
    v0 = sub_1A0395EB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CC868);
  }
}

void sub_1A0387FF0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A038802C(a1, a2, a3, *v3, (unint64_t *)&qword_1ED0CCD80, (unint64_t *)&qword_1ED0CCC28, (uint64_t)&protocol descriptor for ConditionType, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1A0384AB4);
  *v3 = v4;
}

void sub_1A038802C(char a1, int64_t a2, char a3, uint64_t a4, unint64_t *a5, unint64_t *a6, uint64_t a7, void (*a8)(uint64_t, uint64_t, _QWORD *))
{
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  size_t v17;

  if ((a3 & 1) != 0)
  {
    v12 = *(_QWORD *)(a4 + 24);
    v13 = v12 >> 1;
    if ((uint64_t)(v12 >> 1) < a2)
    {
      if (v13 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v13 = v12 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v12 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v13 = a2;
    }
  }
  else
  {
    v13 = a2;
  }
  v14 = *(_QWORD *)(a4 + 16);
  if (v13 <= v14)
    v15 = *(_QWORD *)(a4 + 16);
  else
    v15 = v13;
  if (v15)
  {
    sub_1A0384844(0, a5, a6);
    v16 = (_QWORD *)OUTLINED_FUNCTION_0();
    v17 = _swift_stdlib_malloc_size(v16);
    v16[2] = v14;
    v16[3] = 2 * ((uint64_t)(v17 - 32) / 40);
  }
  else
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  if ((a1 & 1) != 0)
  {
    a8(a4 + 32, v14, v16 + 4);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A0384B38(0, a6);
    swift_arrayInitWithCopy();
  }
  swift_release();
  OUTLINED_FUNCTION_0_4();
}

uint64_t sub_1A0388148()
{
  char v0;

  sub_1A03883A4();
  return v0 & 1;
}

BOOL SettingReader.isEnabled(_:with:)(uint64_t a1, char a2)
{
  return sub_1A0388190(a1, a2);
}

BOOL sub_1A0388190(uint64_t a1, char a2)
{
  char v5;
  char v6;

  sub_1A0388274(a1, 3, &v6);
  if (v6)
    return v6 == 1;
  if (a2 != 2)
    return a2 & 1;
  if (*(_BYTE *)(a1 + 32) && *(_BYTE *)(a1 + 32) == 1)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_1A039601C();
    swift_bridgeObjectRelease();
    return v5 & 1;
  }
}

uint64_t sub_1A0388274@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  char v3;
  uint64_t v6;
  BOOL v7;
  uint64_t result;
  uint64_t v9;
  _BYTE v10[24];
  ValueMetadata *v11;
  _QWORD v12[5];

  v3 = a2;
  if (a2 == 3)
    v3 = *(_BYTE *)(a1 + 32);
  v6 = swift_bridgeObjectRetain();
  v7 = sub_1A0386DD0(v6);
  result = swift_bridgeObjectRelease();
  if (!v7)
    goto LABEL_8;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  sub_1A0388598(0);
  v12[3] = v9;
  v12[4] = sub_1A0388508(qword_1ED0CCB70, (uint64_t (*)(uint64_t))sub_1A0388598);
  v12[0] = a1;
  v11 = &type metadata for FeatureState;
  v10[0] = v3;
  swift_retain();
  sub_1A0386FAC(v12);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
    *a3 = v12[0];
  else
LABEL_8:
    *a3 = v3;
  return result;
}

void sub_1A03883A4()
{
  uint64_t v0;
  uint64_t v1;

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = OUTLINED_FUNCTION_1();
    sub_1A03883DC(v1, 2);
    OUTLINED_FUNCTION_3();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1A03883DC(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[24];
  uint64_t v12;
  _QWORD v13[5];

  if (a2 == 2)
    v3 = *(unsigned __int8 *)(a1 + 32);
  else
    v3 = a2 & 1;
  v4 = swift_bridgeObjectRetain();
  v5 = sub_1A0386DD0(v4);
  swift_bridgeObjectRelease();
  if (v5)
  {
    if (qword_1ED0CCD90 != -1)
      swift_once();
    sub_1A0388548(0, v6, v7, v8);
    v13[3] = v9;
    v13[4] = sub_1A0388508(&qword_1ED0CCAD0, (uint64_t (*)(uint64_t))sub_1A0388548);
    v13[0] = a1;
    v12 = MEMORY[0x1E0DEAFA0];
    v11[0] = v3;
    swift_retain();
    sub_1A0386FAC(v13);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v13);
    if (swift_dynamicCast())
      return v13[0] & 1;
  }
  return v3;
}

uint64_t sub_1A0388508(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = a2(255);
    result = MEMORY[0x1A1AF8C30](&unk_1A0396B54, v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_1A0388548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CCAB0)
  {
    v4 = type metadata accessor for Setting(0, MEMORY[0x1E0DEAFA0], (uint64_t)&protocol witness table for Bool, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CCAB0);
  }
}

void sub_1A0388598(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CCB68)
  {
    v2 = sub_1A03832FC();
    v4 = type metadata accessor for Setting(a1, (uint64_t)&type metadata for FeatureState, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CCB68);
  }
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_1A0395E90();
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_1A038C418(a1, a2, a3, a4, a5, a6, v6);
}

void static Int.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

uint64_t sub_1A038863C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = static Int.convert(from:)(a1, a2, a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t sub_1A0388668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  v3 = swift_dynamicCast();
  return OUTLINED_FUNCTION_3_0(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13);
}

uint64_t static Int.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A0388668(a1, MEMORY[0x1E0DEB418], a3);
}

uint64_t sub_1A03886C0(unsigned __int8 a1, char a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v8;

  v2 = 0x746C7561666564;
  v3 = a1;
  if (a1)
  {
    if (a1 == 1)
      v4 = 0x64656C62616E65;
    else
      v4 = 0x64656C6261736964;
    if (v3 == 1)
      v5 = 0xE700000000000000;
    else
      v5 = 0xE800000000000000;
  }
  else
  {
    v5 = 0xE700000000000000;
    v4 = OUTLINED_FUNCTION_0_8();
  }
  if (a2)
  {
    if (a2 == 1)
      v2 = 0x64656C62616E65;
    else
      v2 = 0x64656C6261736964;
    if (a2 == 1)
      v6 = 0xE700000000000000;
    else
      v6 = 0xE800000000000000;
  }
  else
  {
    v6 = 0xE700000000000000;
  }
  if (v4 == v2 && v5 == v6)
    v8 = 1;
  else
    v8 = sub_1A039601C();
  OUTLINED_FUNCTION_4();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1A03887B8(unsigned __int8 *a1, char *a2)
{
  return sub_1A03886C0(*a1, *a2);
}

ValueMetadata *type metadata accessor for Access()
{
  return &type metadata for Access;
}

_BYTE *sub_1A03887D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_QWORD *sub_1A03887DC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for Domain()
{
  return &type metadata for Domain;
}

uint64_t dispatch thunk of SettingGroup.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_1A0388820()
{
  return swift_allocateGenericValueMetadata();
}

ValueMetadata *type metadata accessor for FeatureState()
{
  return &type metadata for FeatureState;
}

uint64_t sub_1A0388838()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1A0388844(unsigned __int8 *a1)
{
  return *a1;
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
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

uint64_t static Double.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  v3 = OUTLINED_FUNCTION_0_1();
  return OUTLINED_FUNCTION_3_0(v3, v4, v5, v6, v7, v8, v9, v10, v12, v13);
}

uint64_t sub_1A03888C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = static Double.convert(from:)(a1, a2, a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

unint64_t sub_1A03888EC(uint64_t a1)
{
  unint64_t result;

  result = sub_1A0388910();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A0388910()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1ED0CC870;
  if (!qword_1ED0CC870)
  {
    sub_1A0387FA8();
    v2 = MEMORY[0x1E0DEA990];
    result = MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF30], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1ED0CC870);
  }
  return result;
}

void sub_1A0388968()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CC888)
  {
    type metadata accessor for Preset();
    v0 = sub_1A0395EB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CC888);
  }
}

uint64_t sub_1A03889BC@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;

  if ((_BYTE)result)
  {
    v2 = 0xE700000000000000;
    v3 = 0x64656C62616E65;
    if (result != 1)
    {
      v3 = 0x64656C6261736964;
      v2 = 0xE800000000000000;
    }
  }
  else
  {
    v2 = 0xE700000000000000;
    v3 = 0x746C7561666564;
  }
  a2[3] = MEMORY[0x1E0DEA968];
  *a2 = v3;
  a2[1] = v2;
  return result;
}

void sub_1A0388A24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCAC8)
  {
    v0 = sub_1A0395F14();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCAC8);
  }
}

void sub_1A0388A6C()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_1ED0CCAB8)
  {
    sub_1A0388A24();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_1ED0CCAB8);
  }
}

uint64_t static String.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  if (OUTLINED_FUNCTION_0_1())
    return v4;
  else
    return 0;
}

uint64_t sub_1A0388B20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;
  uint64_t v6;

  result = static String.convert(from:)(a1, a2, a3);
  *a4 = result;
  a4[1] = v6;
  return result;
}

void sub_1A0388B44()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CC878)
  {
    v0 = sub_1A0395CF8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CC878);
  }
}

void sub_1A0388B90()
{
  unint64_t v0;

  sub_1A03836F8();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t type metadata accessor for AppGroup()
{
  uint64_t result;

  result = qword_1ED0CCB10;
  if (!qword_1ED0CCB10)
    return swift_getSingletonMetadata();
  return result;
}

void AppGroup.cachesDirectoryURL.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v0 = OUTLINED_FUNCTION_1_4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  AppGroup.containerURL.getter((uint64_t)v3);
  sub_1A0395C68();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  OUTLINED_FUNCTION_2_0();
}

id AppGroup.userDefaults.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC11TeaSettings8AppGroup_userDefaults);
}

uint64_t AppGroup.identifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for Updater()
{
  return objc_opt_self();
}

void Setting.migrate(from:)(uint64_t a1)
{
  if (qword_1ED0CCD90 != -1)
    swift_once();
  sub_1A0388DAC(a1, qword_1ED0CD200);
}

uint64_t sub_1A0388DA4(uint64_t a1)
{
  uint64_t v1;

  return sub_1A0382AF8(a1, v1);
}

void sub_1A0388DAC(uint64_t a1, uint64_t a2)
{
  sub_1A0382FD4(a2, (void (*)(uint64_t))sub_1A0388DA4, a1);
}

uint64_t type metadata accessor for Preset()
{
  return objc_opt_self();
}

_QWORD *sub_1A0388DE4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  swift_bridgeObjectRetain();
  v10(v8, v9, v5);
  v11 = *(_QWORD *)(v6 + 64) + 7;
  v12 = (_QWORD *)((v11 + v8) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  return a1;
}

ValueMetadata *type metadata accessor for Group()
{
  return &type metadata for Group;
}

uint64_t PresetStartupTask.init(presetManager:)(__int128 *a1)
{
  uint64_t v1;

  sub_1A0384B84(a1, v1 + 16);
  return v1;
}

uint64_t sub_1A0388EB0()
{
  return sub_1A0382F14();
}

uint64_t sub_1A0388ED0(uint64_t a1)
{
  uint64_t *v1;

  return sub_1A0388EDC(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_1A0388EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t result;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v26 = a4;
  v7 = sub_1A0395D04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1A0395D1C();
  v27 = *(_QWORD *)(v11 - 8);
  v28 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(a3 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v12);
  if (objc_msgSend((id)objc_opt_self(), sel_isMainThread))
  {
    swift_beginAccess();
    result = swift_weakLoadStrong();
    if (result)
    {
      sub_1A03891B8(a1);
      return swift_release();
    }
  }
  else
  {
    sub_1A0384ED4();
    v25 = v8;
    v24 = sub_1A0395EFC();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
    v18 = (*(unsigned __int8 *)(v15 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v19 = (char *)swift_allocObject();
    v20 = v26;
    *((_QWORD *)v19 + 2) = a3;
    *((_QWORD *)v19 + 3) = v20;
    *((_QWORD *)v19 + 4) = a2;
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v19[v18], (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
    aBlock[4] = sub_1A038EF68;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1A03834A8;
    aBlock[3] = &block_descriptor_0;
    v21 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_1A0395D10();
    aBlock[0] = MEMORY[0x1E0DEE9D8];
    sub_1A0384E94(&qword_1ED0CCC00, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8], MEMORY[0x1E0DEF510]);
    sub_1A0384F10();
    sub_1A0384E94(&qword_1ED0CCC10, (uint64_t (*)(uint64_t))sub_1A0384F10, MEMORY[0x1E0DEAF38]);
    sub_1A0395F2C();
    v22 = (void *)v24;
    MEMORY[0x1A1AF884C](0, v14, v10, v21);
    _Block_release(v21);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v10, v7);
    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v14, v28);
  }
  return result;
}

uint64_t type metadata accessor for SettingProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SettingProperty);
}

uint64_t sub_1A03891B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t FunctionTypeMetadata1;
  uint64_t v5;
  char v6;
  void (*v7)(uint64_t);
  uint64_t result;
  uint64_t v9;

  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 24);
  FunctionTypeMetadata1 = swift_getFunctionTypeMetadata1();
  swift_bridgeObjectRetain();
  v5 = sub_1A0395E3C();
  v9 = v5;
  if (v5 == MEMORY[0x1A1AF87E0](v3, FunctionTypeMetadata1))
    return swift_bridgeObjectRelease();
  while (1)
  {
    v6 = sub_1A0395E78();
    sub_1A0395E54();
    if ((v6 & 1) == 0)
      break;
    v7 = *(void (**)(uint64_t))(v3 + 32 + 16 * v5);
    swift_retain();
    swift_bridgeObjectRetain();
    MEMORY[0x1A1AF87EC](&v9, v3, FunctionTypeMetadata1);
    swift_bridgeObjectRelease();
    v7(a1);
    swift_release();
    v5 = v9;
    if (v5 == MEMORY[0x1A1AF87E0](v3, FunctionTypeMetadata1))
      return swift_bridgeObjectRelease();
  }
  result = sub_1A0395F50();
  __break(1u);
  return result;
}

uint64_t SettingProperty.projectedValue.getter()
{
  return swift_retain();
}

uint64_t SettingProperty.wrappedValue.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)OUTLINED_FUNCTION_5_4();
  Updatable.save<A>(setting:value:)(v3);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))(a1);
}

uint64_t type metadata accessor for PresetManager()
{
  return objc_opt_self();
}

void sub_1A0389370(Swift::OpaquePointer a1)
{
  PresetManager.apply(_:)(a1);
}

Swift::Void __swiftcall PresetManager.apply(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;

  v18 = *((_QWORD *)a1._rawValue + 2);
  if (v18)
  {
    v2 = v1;
    v19 = (char *)a1._rawValue + 32;
    v20 = (uint64_t *)(v1 + 32);
    swift_bridgeObjectRetain();
    v3 = 0;
    while (1)
    {
      v4 = (uint64_t *)&v19[16 * v3];
      v5 = *v4;
      v6 = v4[1];
      swift_beginAccess();
      v7 = *v20;
      v8 = *(_QWORD *)(*v20 + 16);
      swift_bridgeObjectRetain();
      if (!v8)
        goto LABEL_18;
      swift_bridgeObjectRetain();
      v9 = sub_1A03933AC(v5, v6);
      if ((v10 & 1) == 0)
      {
        swift_bridgeObjectRelease();
LABEL_18:
        swift_endAccess();
        swift_bridgeObjectRelease();
LABEL_19:
        swift_bridgeObjectRelease();
        return;
      }
      v21 = v3;
      v11 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v9);
      swift_endAccess();
      OUTLINED_FUNCTION_0_11();
      swift_bridgeObjectRelease_n();
      if (v11 >> 62)
      {
        OUTLINED_FUNCTION_0_11();
        v12 = sub_1A0395FE0();
        if (!v12)
          goto LABEL_13;
      }
      else
      {
        v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
        OUTLINED_FUNCTION_0_11();
        if (!v12)
          goto LABEL_13;
      }
      if (v12 < 1)
      {
        __break(1u);
        return;
      }
      v13 = 0;
      do
      {
        if ((v11 & 0xC000000000000001) != 0)
        {
          v14 = MEMORY[0x1A1AF88A0](v13, v11);
        }
        else
        {
          v14 = *(_QWORD *)(v11 + 8 * v13 + 32);
          swift_retain();
        }
        ++v13;
        v15 = *(_QWORD *)(v2 + 24);
        ObjectType = swift_getObjectType();
        v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32);
        swift_unknownObjectRetain();
        v17(v14, ObjectType, v15);
        swift_release();
        swift_unknownObjectRelease();
      }
      while (v12 != v13);
LABEL_13:
      v3 = v21 + 1;
      swift_bridgeObjectRelease_n();
      if (v21 + 1 == v18)
        goto LABEL_19;
    }
  }
}

unint64_t sub_1A0389574()
{
  unint64_t result;

  result = qword_1ED0CCC28;
  if (!qword_1ED0CCC28)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED0CCC28);
  }
  return result;
}

unint64_t sub_1A03895C8()
{
  unint64_t result;

  result = qword_1ED0CCB58;
  if (!qword_1ED0CCB58)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for FeatureState, &type metadata for FeatureState);
    atomic_store(result, (unint64_t *)&qword_1ED0CCB58);
  }
  return result;
}

unint64_t sub_1A0389604(uint64_t a1)
{
  unint64_t result;

  result = sub_1A03895C8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1A0389628@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  return sub_1A03889BC(*v1, a1);
}

uint64_t dispatch thunk of Configurable.setting<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 24))();
}

uint64_t type metadata accessor for SettingsStore()
{
  return objc_opt_self();
}

uint64_t sub_1A0389658()
{
  uint64_t v0;

  return sub_1A0385DDC(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1A0389660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  sub_1A0388548(0, a2, a3, a4);
  swift_allocObject();
  result = sub_1A0384434(0xD00000000000002BLL, 0x80000001A0397970);
  qword_1ED0CC860 = result;
  return result;
}

void static Date.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

unint64_t sub_1A03896CC(uint64_t a1)
{
  unint64_t result;

  result = sub_1A0382A0C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t dispatch thunk of Resettable.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t Preset.extends.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *Preset.__allocating_init(extends:apply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

_QWORD *Preset.init(extends:apply:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[2] = a1;
  v3[3] = a2;
  v3[4] = a3;
  return v3;
}

uint64_t sub_1A0389754()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t Preset.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t Preset.__deallocating_deinit()
{
  Preset.deinit();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Preset()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Preset.__allocating_init(extends:apply:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1A03897C8(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v5 = result;
    v6 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v6 + 16) = v5;
    *(_QWORD *)(v6 + 24) = a2;
    OUTLINED_FUNCTION_1();
    swift_retain();
    sub_1A0389AA0(v3, 2, (uint64_t)sub_1A0389A7C, v6);
    OUTLINED_FUNCTION_3();
    swift_release();
    return v2 & 1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A0389850(uint64_t result)
{
  uint64_t v1;
  char v2;
  uint64_t v3;

  if (*(_QWORD *)(v1 + 16))
  {
    v2 = result;
    v3 = OUTLINED_FUNCTION_1();
    sub_1A0389890(v3, v2 & 1);
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1A0389890(uint64_t a1, char a2)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11[2];

  if (qword_1ED0CCD90 != -1)
    swift_once();
  swift_retain_n();
  v4 = swift_bridgeObjectRetain();
  v5 = sub_1A0386DD0(v4);
  swift_bridgeObjectRelease();
  if (v5
    && (v6 = *(_QWORD *)(a1 + 80),
        v11[0] = *(_QWORD *)(a1 + 72),
        v11[1] = v6,
        swift_bridgeObjectRetain(),
        sub_1A0387730(v11),
        v8 = v7,
        swift_bridgeObjectRelease(),
        v8))
  {
    LOBYTE(v11[0]) = a2 & 1;
    v9 = sub_1A0396028();
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1A0395D64();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setObject_forKey_, v9, v10);
    swift_release_n();

    swift_unknownObjectRelease();
  }
  else
  {
    swift_release_n();
  }
}

uint64_t SettingGroup.__allocating_init(key:defaultValue:access:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;

  v6 = OUTLINED_FUNCTION_0();
  SettingGroup.init(key:defaultValue:access:)(a1, a2, a3);
  return v6;
}

uint64_t SettingGroup.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6();
  return v0;
}

uint64_t SettingGroup.__deallocating_deinit()
{
  OUTLINED_FUNCTION_6();
  return swift_deallocClassInstance();
}

uint64_t sub_1A0389A58()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A0389A7C(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_1A0389AA0(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v15[4];

  v8 = swift_bridgeObjectRetain();
  v9 = sub_1A0386DD0(v8);
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = swift_allocObject();
    *(_BYTE *)(v10 + 16) = sub_1A03883DC(a1, 2) & 1;
    if (qword_1ED0CCD90 != -1)
      swift_once();
    v11 = swift_allocObject();
    swift_weakInit();
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v11;
    v12[3] = a1;
    v12[4] = v10;
    v12[5] = a3;
    v12[6] = a4;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    sub_1A0385B44((uint64_t)sub_1A0389E34, (uint64_t)v12, v15);
    swift_release();
    swift_release();
    __swift_project_boxed_opaque_existential_1(v15, v15[3]);
    sub_1A0395CBC();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    swift_beginAccess();
    v13 = *(unsigned __int8 *)(v10 + 16);
    swift_release();
  }
  else if (a2 == 2)
  {
    return *(unsigned __int8 *)(a1 + 32);
  }
  else
  {
    return a2 & 1;
  }
  return v13;
}

uint64_t sub_1A0389C70(uint64_t a1)
{
  uint64_t v2;

  sub_1A03847E4(0, &qword_1ED0CC880, &qword_1ED0CCAA8, (uint64_t)&protocol descriptor for SettingType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0DEB940]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t method lookup function for SettingGroup()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SettingGroup.isEnabled(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SettingGroup.setEnabled(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SettingGroup.__allocating_init(key:defaultValue:access:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_1A0389CF8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t result;
  _BYTE *v8;
  int v9;
  char v10;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v8 = (_BYTE *)(a3 + 16);
    v9 = sub_1A03883DC(a2, 2) & 1;
    swift_beginAccess();
    if (v9 != *v8)
    {
      swift_beginAccess();
      *v8 = v9;
      v10 = v9;
      a4(&v10);
    }
    return swift_release();
  }
  return result;
}

uint64_t sub_1A0389DC8()
{
  return swift_deallocObject();
}

uint64_t sub_1A0389DD8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A0389DFC()
{
  OUTLINED_FUNCTION_6();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A0389E34()
{
  uint64_t v0;

  return sub_1A0389CF8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void (**)(char *))(v0 + 40));
}

BOOL static Access.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t Access.hash(into:)()
{
  return sub_1A039604C();
}

uint64_t Access.hashValue.getter()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

uint64_t sub_1A0389ED0()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

unint64_t sub_1A0389F14()
{
  unint64_t result;

  result = qword_1EE596728;
  if (!qword_1EE596728)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for Access, &type metadata for Access);
    atomic_store(result, (unint64_t *)&qword_1EE596728);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for Access(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A0389F9C + 4 * byte_1A039652D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1A0389FD0 + 4 * byte_1A0396528[v4]))();
}

uint64_t sub_1A0389FD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0389FD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A0389FE0);
  return result;
}

uint64_t sub_1A0389FEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A0389FF4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1A0389FF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A038A000(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t dispatch thunk of Groupable.label.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of Groupable.cellStyle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Groupable.isEnabled.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Groupable.isVisible.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A038A034()
{
  return OUTLINED_FUNCTION_0_0();
}

uint64_t sub_1A038A044()
{
  return OUTLINED_FUNCTION_0_0() & 1;
}

void static Int64.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

uint64_t static Int64.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1A0388668(a1, MEMORY[0x1E0DEDC60], a3);
}

uint64_t Int64.toData()@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  return OUTLINED_FUNCTION_5_0(result, a2);
}

uint64_t sub_1A038A08C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t result;
  char v6;

  result = static Int64.convert(from:)(a1, a2, a3);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v6 & 1;
  return result;
}

uint64_t sub_1A038A0B8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return Int64.toData()(*v1, a1);
}

void static Float.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

unint64_t static Float.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  unsigned int v6;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  v3 = OUTLINED_FUNCTION_0_1();
  v4 = v6;
  if (!v3)
    v4 = 0;
  return v4 | ((unint64_t)(v3 ^ 1u) << 32);
}

void Float.toData()(uint64_t a1@<X8>, float a2@<S0>)
{
  *(_QWORD *)(a1 + 24) = MEMORY[0x1E0DEB188];
  *(float *)a1 = a2;
}

unint64_t sub_1A038A134@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t result;

  result = static Float.convert(from:)(a1, a2, a3);
  *(_DWORD *)a4 = result;
  *(_BYTE *)(a4 + 4) = BYTE4(result) & 1;
  return result;
}

void sub_1A038A160(uint64_t a1@<X8>)
{
  float *v1;

  Float.toData()(a1, *v1);
}

void static Data.dataType.getter(_BYTE *a1@<X8>)
{
  OUTLINED_FUNCTION_2_2(a1);
}

uint64_t static Data.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  if (OUTLINED_FUNCTION_0_1())
    return v4;
  else
    return 0;
}

uint64_t Data.toData()@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  a3[3] = MEMORY[0x1E0CB0338];
  *a3 = a1;
  a3[1] = a2;
  return sub_1A038A1D0(a1, a2);
}

uint64_t sub_1A038A1D0(uint64_t a1, unint64_t a2)
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

uint64_t sub_1A038A218@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t result;
  uint64_t v6;

  result = static Data.convert(from:)(a1, a2, a3);
  *a4 = result;
  a4[1] = v6;
  return result;
}

uint64_t sub_1A038A23C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return Data.toData()(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), a1);
}

void sub_1A038A244(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

char sub_1A038A24C@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  int v3;
  Swift::String v5;
  _BYTE v6[32];

  sub_1A038789C(a1, (uint64_t)v6);
  v3 = swift_dynamicCast();
  if (v3)
    LOBYTE(v3) = FeatureState.init(rawValue:)(v5);
  else
    *a2 = 3;
  return v3;
}

uint64_t static Date.convert(from:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_1_0(a1, a2, a3);
  if (OUTLINED_FUNCTION_0_1())
  {
    sub_1A0395C98();
    v5 = 0;
  }
  else
  {
    v5 = 1;
  }
  v6 = sub_1A0395CB0();
  return __swift_storeEnumTagSinglePayload(a4, v5, 1, v6);
}

unint64_t sub_1A038A334(uint64_t a1)
{
  unint64_t result;

  result = sub_1A038A358();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1A038A358()
{
  unint64_t result;

  result = qword_1EE596730;
  if (!qword_1EE596730)
  {
    result = MEMORY[0x1A1AF8C30](MEMORY[0x1E0CB0360], MEMORY[0x1E0CB0338]);
    atomic_store(result, (unint64_t *)&qword_1EE596730);
  }
  return result;
}

uint64_t dispatch thunk of static Settable.dataType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Settable.convert(from:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of Settable.toData()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_1A038A3BC()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1A038A3C8()
{
  uint64_t v0;

  sub_1A038B0CC(v0 + 16);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_1A038A3F4()
{
  return sub_1A038A3BC();
}

uint64_t sub_1A038A434(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD *);
  uint64_t v9;
  void (*v10)(_QWORD *);
  uint64_t v11;
  uint64_t v13;
  _QWORD v14[3];
  uint64_t v15;
  _UNKNOWN **v16;

  v2 = a1;
  v3 = *v1;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4 >> 62)
    goto LABEL_11;
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1();
  for (; v5; v5 = sub_1A0395FE0())
  {
    v13 = v2;
    v6 = 4;
    while (1)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        v2 = MEMORY[0x1A1AF88A0](v6 - 4, v4);
      }
      else
      {
        v2 = *(_QWORD *)(v4 + 8 * v6);
        swift_retain();
      }
      v7 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v8 = *(void (**)(_QWORD *))(v2 + 24);
      v15 = v3;
      v16 = &off_1E4370D40;
      v14[0] = v1;
      OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_13_0();
      v8(v14);
      v9 = OUTLINED_FUNCTION_20();
      OUTLINED_FUNCTION_27(v9);
      swift_release();
      ++v6;
      if (v7 == v5)
      {
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_23();
        v2 = v13;
        goto LABEL_13;
      }
    }
    __break(1u);
LABEL_11:
    OUTLINED_FUNCTION_30();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_31();
  OUTLINED_FUNCTION_23();
LABEL_13:
  OUTLINED_FUNCTION_23();
  v10 = *(void (**)(_QWORD *))(v2 + 24);
  v15 = v3;
  v16 = &off_1E4370D40;
  v14[0] = v1;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_13_0();
  v10(v14);
  v11 = OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_27(v11);
}

uint64_t sub_1A038A58C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A038A5B0()
{
  sub_1A038A58C();
  return swift_deallocClassInstance();
}

uint64_t sub_1A038A5D0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD *v12;

  v2 = v1;
  v3 = *a1;
  v12 = a1;
  v5 = *(_QWORD *)(v3 + 88);
  v4 = *(_QWORD *)(v3 + 96);
  v6 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v4 + 32);
  swift_retain();
  v6(v11, v5, v4);
  v8 = type metadata accessor for Setting(0, v5, v4, v7);
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v8);
  sub_1A0383CFC((uint64_t)&v12, v11, v2, v8);
  OUTLINED_FUNCTION_27(v9);
  return swift_release();
}

uint64_t sub_1A038A674(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  v4 = type metadata accessor for Setting(0, *(_QWORD *)(*(_QWORD *)a1 + 88), *(_QWORD *)(*(_QWORD *)a1 + 96), a4);
  OUTLINED_FUNCTION_1();
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v4);
  sub_1A038B034();
  return OUTLINED_FUNCTION_31();
}

uint64_t sub_1A038A6E4(_QWORD *a1)
{
  return sub_1A038A5D0(a1);
}

uint64_t sub_1A038A704(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1A038A674(a1, a2, a3, a4);
}

unsigned __int8 *sub_1A038A724(uint64_t a1, uint64_t a2, uint64_t a3)
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
  v5 = sub_1A0395DDC();
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
  v5 = sub_1A038AA84();
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
    v7 = (unsigned __int8 *)sub_1A0395F74();
  }
LABEL_7:
  v11 = sub_1A038A808(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_1A038A808(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
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
        if (result)
        {
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
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
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
  }
  __break(1u);
  return result;
}

uint64_t sub_1A038AA84()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1A038AAE0();
  v4 = sub_1A038AB14(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1A038AAE0()
{
  return sub_1A0395DE8();
}

uint64_t sub_1A038AB14(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1A038AC58(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1A038AD44(v9, 0);
      v12 = sub_1A038ADBC((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1A1AF86C0](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1A1AF86C0);
LABEL_9:
      sub_1A0395F74();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1A1AF86C0]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1A038AC58(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_1A038AFBC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1A038AFBC(a2, a3, a4);
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
    return sub_1A0395DB8();
  }
  __break(1u);
  return result;
}

_QWORD *sub_1A038AD44(uint64_t a1, uint64_t a2)
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
  sub_1A0387F14(0, &qword_1EE596738, MEMORY[0x1E0DEDE70], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_1A038ADBC(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
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
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_1A038AFBC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1A0395DC4();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1A0395F74();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_1A038AFBC(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_1A0395DA0();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_1A038AFBC(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_1A0395DD0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1A1AF86F0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_1A038B034()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10();
  MEMORY[0x1E0C80A78](v1);
  OUTLINED_FUNCTION_6_0(v2, v8);
  v3 = OUTLINED_FUNCTION_12();
  v4 = OUTLINED_FUNCTION_33(v3);
  OUTLINED_FUNCTION_2_3();
  if (v4)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_16();
    v6 = v5;
    OUTLINED_FUNCTION_35();
    if (v6)
    {
      OUTLINED_FUNCTION_5_1();
      v7 = (void *)OUTLINED_FUNCTION_4_2();
      OUTLINED_FUNCTION_2_3();
      objc_msgSend(v6, sel_removeObjectForKey_, v7);

    }
  }
  OUTLINED_FUNCTION_14(*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_18();
}

uint64_t sub_1A038B0CC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1A038B0F0()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A038B11C(uint64_t a1, unint64_t a2)
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

uint64_t OUTLINED_FUNCTION_14@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_release();
}

void OUTLINED_FUNCTION_21(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;
  uint64_t v1;

  return sub_1A038789C(v1, v0);
}

uint64_t OUTLINED_FUNCTION_27(uint64_t a1, ...)
{
  va_list va;

  va_start(va, a1);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)va);
}

void OUTLINED_FUNCTION_28()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return a10;
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_release();
}

void OUTLINED_FUNCTION_32()
{
  void *v0;

}

BOOL OUTLINED_FUNCTION_33(uint64_t a1)
{
  return sub_1A0386DD0(a1);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease();
}

BOOL static ChangeBehavior.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ChangeBehavior.hash(into:)()
{
  return sub_1A039604C();
}

void _s11TeaSettings14ChangeBehaviorO9hashValueSivg_0()
{
  sub_1A0396040();
  OUTLINED_FUNCTION_0_3();
  sub_1A0396058();
  OUTLINED_FUNCTION_1_2();
}

void sub_1A038B2CC()
{
  sub_1A0396040();
  OUTLINED_FUNCTION_0_3();
  sub_1A0396058();
  OUTLINED_FUNCTION_1_2();
}

unint64_t sub_1A038B300()
{
  unint64_t result;

  result = qword_1EE596740;
  if (!qword_1EE596740)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for ChangeBehavior, &type metadata for ChangeBehavior);
    atomic_store(result, (unint64_t *)&qword_1EE596740);
  }
  return result;
}

unint64_t sub_1A038B340()
{
  unint64_t result;

  result = qword_1EE596748;
  if (!qword_1EE596748)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for SettingCellStyle.ButtonStyle, &type metadata for SettingCellStyle.ButtonStyle);
    atomic_store(result, (unint64_t *)&qword_1EE596748);
  }
  return result;
}

_BYTE *sub_1A038B384(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

void type metadata accessor for ChangeBehavior()
{
  OUTLINED_FUNCTION_2_4();
}

uint64_t initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_1A038B3CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  switch(a11)
  {
    case 0:
    case 4:
    case 5:
    case 7:
    case 8:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRetain();
      swift_retain();
      goto LABEL_8;
    case 2:
    case 3:
    case 10:
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 6:
      return swift_bridgeObjectRetain();
    case 9:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
LABEL_7:
      swift_bridgeObjectRetain();
LABEL_8:
      result = swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for SettingCellStyle(uint64_t a1)
{
  return sub_1A038B510(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_BYTE *)(a1 + 80));
}

uint64_t sub_1A038B510(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, char a11)
{
  uint64_t result;

  switch(a11)
  {
    case 0:
    case 4:
    case 5:
    case 7:
    case 8:
      goto LABEL_7;
    case 1:
      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_8;
    case 2:
    case 3:
    case 10:
      swift_bridgeObjectRelease();
      goto LABEL_7;
    case 6:
      return swift_bridgeObjectRelease();
    case 9:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_7:
      swift_bridgeObjectRelease();
LABEL_8:
      result = swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t initializeWithCopy for SettingCellStyle(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  char v14;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v13 = *(_QWORD *)(a2 + 72);
  v14 = *(_BYTE *)(a2 + 80);
  sub_1A038B3CC(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v13, v14);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v13;
  *(_BYTE *)(a1 + 80) = v14;
  return a1;
}

uint64_t assignWithCopy for SettingCellStyle(uint64_t a1, uint64_t a2)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  char v25;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a2 + 64);
  v24 = *(_QWORD *)(a2 + 72);
  v25 = *(_BYTE *)(a2 + 80);
  sub_1A038B3CC(*(_QWORD *)a2, v4, v5, v6, v7, v8, v9, v10, v11, v24, v25);
  v12 = *(_QWORD *)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_QWORD *)(a1 + 48);
  v19 = *(_QWORD *)(a1 + 56);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_BYTE *)(a1 + 80);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  *(_QWORD *)(a1 + 72) = v24;
  *(_BYTE *)(a1 + 80) = v25;
  sub_1A038B510(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

uint64_t assignWithTake for SettingCellStyle(uint64_t a1, uint64_t a2)
{
  char v3;
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
  __int128 v15;
  __int128 v16;

  v3 = *(_BYTE *)(a2 + 80);
  v4 = *(_QWORD *)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_BYTE *)(a1 + 80);
  v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v15;
  v16 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v16;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = v3;
  sub_1A038B510(v4, v6, v5, v7, v8, v9, v10, v11, v12, v13, v14);
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingCellStyle(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xF5 && *(_BYTE *)(a1 + 81))
    {
      v2 = *(_DWORD *)a1 + 244;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 80);
      if (v3 <= 0xB)
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

uint64_t storeEnumTagSinglePayload for SettingCellStyle(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF4)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 245;
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xF5)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_1A038B8B8(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 80) <= 0xAu)
    return *(unsigned __int8 *)(a1 + 80);
  else
    return (*(_DWORD *)a1 + 11);
}

uint64_t sub_1A038B8D0(uint64_t result, unsigned int a2)
{
  if (a2 >= 0xB)
  {
    *(_QWORD *)result = a2 - 11;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)(result + 72) = 0;
    LOBYTE(a2) = 11;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

void type metadata accessor for SettingCellStyle()
{
  OUTLINED_FUNCTION_2_4();
}

uint64_t _s11TeaSettings14ChangeBehaviorOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11TeaSettings14ChangeBehaviorOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A038B9E0 + 4 * byte_1A039684B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A038BA14 + 4 * byte_1A0396846[v4]))();
}

uint64_t sub_1A038BA14(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A038BA1C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A038BA24);
  return result;
}

uint64_t sub_1A038BA30(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A038BA38);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A038BA3C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A038BA44(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for SettingCellStyle.ButtonStyle()
{
  OUTLINED_FUNCTION_2_4();
}

void Group.title.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2();
}

void Group.footer.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2();
}

uint64_t Group.items.getter()
{
  return swift_bridgeObjectRetain();
}

void Group.visibleItems.getter()
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
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE v17[24];
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD *)(v0 + 32);
  v23 = MEMORY[0x1E0DEE9D8];
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  if (v2)
  {
    v3 = 0;
    v4 = v1 + 32;
    while (v3 < *(_QWORD *)(v1 + 16))
    {
      sub_1A0386F1C(v4, (uint64_t)&v20);
      v5 = v21;
      v6 = v22;
      __swift_project_boxed_opaque_existential_1(&v20, v21);
      if (((*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6) & 1) != 0)
      {
        sub_1A0384B84(&v20, (uint64_t)v17);
        v7 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1A038C45C(0, *(_QWORD *)(v7 + 16) + 1, 1);
          v7 = v23;
        }
        v9 = *(_QWORD *)(v7 + 16);
        v8 = *(_QWORD *)(v7 + 24);
        if (v9 >= v8 >> 1)
          sub_1A038C45C(v8 > 1, v9 + 1, 1);
        v10 = v18;
        v11 = v19;
        v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v17, v18);
        MEMORY[0x1E0C80A78](v12);
        v14 = &v17[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
        (*(void (**)(_BYTE *))(v15 + 16))(v14);
        sub_1A038C73C(v9, (uint64_t)v14, &v23, v10, v11);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v20);
      }
      ++v3;
      v4 += 40;
      if (v2 == v3)
        goto LABEL_12;
    }
    __break(1u);
  }
  else
  {
LABEL_12:
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_0_4();
  }
}

uint64_t Group.init(title:footer:_:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  *a6 = result;
  a6[1] = a2;
  a6[2] = a3;
  a6[3] = a4;
  a6[4] = a5;
  return result;
}

uint64_t Group.init(title:footer:group:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t result;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v26;

  sub_1A0384844(0, &qword_1EE596750, (unint64_t *)&qword_1EE596758);
  result = OUTLINED_FUNCTION_0();
  *(_OWORD *)(result + 16) = xmmword_1A03964B0;
  v13 = *(_QWORD *)(a5 + 16);
  if (v13)
  {
    v14 = (_QWORD *)result;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_1A0395D94();
    swift_bridgeObjectRelease();
    sub_1A038C7DC(0, v15, v16, v17);
    v19 = v18;
    v20 = OUTLINED_FUNCTION_0();
    *(_BYTE *)(v20 + 48) = 1;
    *(_QWORD *)(v20 + 56) = 1065353216;
    *(_WORD *)(v20 + 64) = 128;
    *(_QWORD *)(v20 + 16) = v13;
    *(_QWORD *)(v20 + 24) = 0x20656C62616E45;
    *(_BYTE *)(v20 + 66) = 0;
    *(_WORD *)(v20 + 49) = 256;
    v21 = MEMORY[0x1E0DEE9D8];
    *(_QWORD *)(v20 + 32) = 0xE700000000000000;
    *(_QWORD *)(v20 + 40) = v21;
    v14[7] = v19;
    v14[8] = &protocol witness table for Item<A>;
    v14[4] = v20;
    v26 = v14;
    swift_retain();
    v22 = sub_1A038BE14(a6, a5);
    swift_bridgeObjectRelease();
    v23 = (_QWORD *)sub_1A038BF70(v22);
    swift_bridgeObjectRelease();
    sub_1A038C094(v23);
    result = swift_release();
    *a7 = a1;
    a7[1] = a2;
    a7[2] = a3;
    a7[3] = a4;
    a7[4] = v26;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A038BE14(uint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v14[2];
  _OWORD v15[2];
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1A038C498(0, v3, 0);
    v5 = a1 + 32;
    do
    {
      sub_1A0386F1C(v5, (uint64_t)v14);
      sub_1A0384B84(v14, (uint64_t)v15);
      *((_QWORD *)&v16 + 1) = sub_1A038CB54;
      v17 = a2;
      v6 = v18;
      swift_retain();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1A038C498(0, *(_QWORD *)(v6 + 16) + 1, 1);
        v6 = v18;
      }
      v8 = *(_QWORD *)(v6 + 16);
      v7 = *(_QWORD *)(v6 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_1A038C498(v7 > 1, v8 + 1, 1);
        v6 = v18;
      }
      *(_QWORD *)(v6 + 16) = v8 + 1;
      v9 = v6 + 56 * v8;
      v10 = v15[0];
      v11 = v15[1];
      v12 = v16;
      *(_QWORD *)(v9 + 80) = v17;
      *(_OWORD *)(v9 + 48) = v11;
      *(_OWORD *)(v9 + 64) = v12;
      *(_OWORD *)(v9 + 32) = v10;
      v5 += 40;
      --v3;
    }
    while (v3);
    swift_release();
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9D8];
  }
  return v6;
}

uint64_t sub_1A038BF70(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  ValueMetadata *v9;
  _UNKNOWN **v10;
  _BYTE v11[56];
  uint64_t v12;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v12 = MEMORY[0x1E0DEE9D8];
    sub_1A038C45C(0, v1, 0);
    v2 = v12;
    v4 = a1 + 32;
    do
    {
      sub_1A038CAB8(v4, (uint64_t)v11);
      v12 = v2;
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1A038C45C(v5 > 1, v6 + 1, 1);
        v2 = v12;
      }
      v9 = &type metadata for ConditionalItem;
      v10 = &protocol witness table for ConditionalItem;
      *(_QWORD *)&v8 = swift_allocObject();
      sub_1A038CAB8((uint64_t)v11, v8 + 16);
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1A0384B84(&v8, v2 + 40 * v6 + 32);
      sub_1A038CB20((uint64_t)v11);
      v4 += 56;
      --v1;
    }
    while (v1);
  }
  return v2;
}

_QWORD *sub_1A038C094(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)result || v5 > v3[3] >> 1)
  {
    if (v4 <= v5)
      v7 = v4 + v2;
    else
      v7 = v4;
    result = sub_1A039301C(result, v7, 1, v3);
    v3 = result;
  }
  if (!v6[2])
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_1A0384B38(0, (unint64_t *)&qword_1EE596758);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v8 = v3[2];
  v9 = __OFADD__(v8, v2);
  v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_1A038C194(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1A0395FE0();
    OUTLINED_FUNCTION_4();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    OUTLINED_FUNCTION_1_3();
    v5 = sub_1A0395FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
  {
    __break(1u);
    goto LABEL_24;
  }
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_16;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    OUTLINED_FUNCTION_1_3();
    v4 = MEMORY[0x1A1AF88AC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_16:
    result = sub_1A038C5AC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    OUTLINED_FUNCTION_1_3();
    v9 = sub_1A0395FE0();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_20;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_20:
    swift_bridgeObjectRelease();
    return sub_1A0395E48();
  }
  __break(1u);
  return result;
}

void sub_1A038C338(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 16);
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
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v4 + v2;
    else
      v8 = v4;
    sub_1A039312C(isUniquelyReferenced_nonNull_native, v8, 1, (char *)v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  if ((*(_QWORD *)(v3 + 24) >> 1) - *(_QWORD *)(v3 + 16) < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    OUTLINED_FUNCTION_4();
    *v1 = v3;
    return;
  }
  v10 = *(_QWORD *)(v3 + 16);
  v11 = __OFADD__(v10, v2);
  v12 = v10 + v2;
  if (!v11)
  {
    *(_QWORD *)(v3 + 16) = v12;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_1A038C41C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5, char a6, uint64_t a7)
{
  uint64_t v7;

  *(_BYTE *)(v7 + 48) = 1;
  *(_QWORD *)(v7 + 56) = 1065353216;
  *(_WORD *)(v7 + 64) = 128;
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  *(_BYTE *)(v7 + 66) = a4 & 1;
  *(_BYTE *)(v7 + 50) = a5 & 1;
  *(_BYTE *)(v7 + 49) = a6 & 1;
  *(_QWORD *)(v7 + 32) = a3;
  *(_QWORD *)(v7 + 40) = a7;
  return v7;
}

void sub_1A038C45C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v4;

  sub_1A038802C(a1, a2, a3, *v3, &qword_1EE596750, (unint64_t *)&qword_1EE596758, (uint64_t)&protocol descriptor for Groupable, (void (*)(uint64_t, uint64_t, _QWORD *))sub_1A0393274);
  *v3 = v4;
}

uint64_t sub_1A038C498(uint64_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1A038C4B4(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_1A038C4B4(uint64_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;

  v5 = result;
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
    sub_1A038CB58();
    v10 = swift_allocObject();
    v11 = _swift_stdlib_malloc_size((const void *)v10);
    *(_QWORD *)(v10 + 16) = v8;
    *(_QWORD *)(v10 + 24) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = MEMORY[0x1E0DEE9D8];
  }
  if ((v5 & 1) != 0)
  {
    sub_1A0392D64((char *)(a4 + 32), v8, (char *)(v10 + 32));
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_1A038C5AC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13[4];

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1A0395FE0();
    result = swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      v8 = sub_1A0395FE0();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_1A038CA24();
          sub_1A038CA78();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            v10 = sub_1A0395540(v13, i, a3);
            v12 = *v11;
            swift_retain();
            ((void (*)(uint64_t **, _QWORD))v10)(v13, 0);
            *(_QWORD *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        type metadata accessor for SettingAction();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1A038C73C(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_0;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_0, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_1A0384B84(&v12, v10 + 40 * a1 + 32);
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

void sub_1A038C7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1EE596760)
  {
    v4 = type metadata accessor for Item(0, MEMORY[0x1E0DEAFA0], (uint64_t)&protocol witness table for Bool, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1EE596760);
  }
}

uint64_t destroy for Group()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for Group(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Group(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
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

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 32);
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

uint64_t storeEnumTagSinglePayload for Group(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void sub_1A038CA24()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE596768)
  {
    type metadata accessor for SettingAction();
    v0 = sub_1A0395EB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE596768);
  }
}

unint64_t sub_1A038CA78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE596770;
  if (!qword_1EE596770)
  {
    sub_1A038CA24();
    result = MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EE596770);
  }
  return result;
}

uint64_t sub_1A038CAB8(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for ConditionalItem(a2, a1);
  return a2;
}

uint64_t sub_1A038CAF4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A038CB20(uint64_t a1)
{
  destroy for ConditionalItem(a1);
  return a1;
}

void sub_1A038CB58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE596778)
  {
    v0 = sub_1A0396004();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE596778);
  }
}

uint64_t sub_1A038CBA0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = sub_1A0395C80();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return AppGroup.containerURL.setter((uint64_t)v4);
}

uint64_t AppGroup.containerURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  sub_1A03836F8();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OUTLINED_FUNCTION_1_4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(v5, a1, v6);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v6);
  v7 = v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL;
  OUTLINED_FUNCTION_3_2();
  sub_1A0383990((uint64_t)v5, v7);
  return swift_endAccess();
}

void (*AppGroup.containerURL.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = OUTLINED_FUNCTION_1_4();
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  AppGroup.containerURL.getter((uint64_t)v7);
  return sub_1A038CD60;
}

void sub_1A038CD60(uint64_t a1, char a2)
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
    OUTLINED_FUNCTION_4_3(*(_QWORD *)(*(_QWORD *)a1 + 24), (uint64_t)v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
    AppGroup.containerURL.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    AppGroup.containerURL.setter(*(_QWORD *)(*(_QWORD *)a1 + 32));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t AppGroup.settingsDomain.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain + 8);
  *a1 = *(_QWORD *)(v1 + OBJC_IVAR____TtC11TeaSettings8AppGroup_settingsDomain);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void AppGroup.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  AppGroup.init(identifier:)(a1, a2);
  OUTLINED_FUNCTION_0_5();
}

uint64_t AppGroup.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_1A03836BC(v0 + OBJC_IVAR____TtC11TeaSettings8AppGroup____lazy_storage___containerURL);
  swift_bridgeObjectRelease();

  return v0;
}

uint64_t AppGroup.__deallocating_deinit()
{
  AppGroup.deinit();
  return swift_deallocClassInstance();
}

void sub_1A038CEB8(uint64_t a1@<X8>)
{
  AppGroup.containerURL.getter(a1);
}

uint64_t sub_1A038CEDC()
{
  return type metadata accessor for AppGroup();
}

uint64_t method lookup function for AppGroup()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppGroup.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1A038CEF8()
{
  return swift_deallocClassInstance();
}

BOOL SettingReader.isDisabled(_:with:)(uint64_t a1, char a2)
{
  return !sub_1A0388190(a1, a2);
}

uint64_t SettingReader.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t SettingReader.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t method lookup function for SettingReader()
{
  return swift_lookUpClassMethod();
}

uint64_t Option.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1 + 32));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t *sub_1A038CFB0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  _QWORD *v15;
  _QWORD *v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = *(_QWORD *)(v5 + 64) + 7;
  if (v6 > 7
    || (*(_DWORD *)(v5 + 80) & 0x100000) != 0
    || ((v7 + ((v6 + 16) & ~v6)) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v6 & 0xF8 ^ 0x1F8) & (v6 + 16)));
    swift_retain();
  }
  else
  {
    v11 = a2[1];
    *a1 = *a2;
    a1[1] = v11;
    v12 = ((unint64_t)a1 + v6 + 16) & ~v6;
    v13 = ((unint64_t)a2 + v6 + 16) & ~v6;
    v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
    swift_bridgeObjectRetain();
    v14(v12, v13, v4);
    v15 = (_QWORD *)((v7 + v12) & 0xFFFFFFFFFFFFFFF8);
    v16 = (_QWORD *)((v7 + v13) & 0xFFFFFFFFFFFFFFF8);
    *v15 = *v16;
    v15[1] = v16[1];
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *sub_1A038D0A0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = ((unint64_t)a1 + v7 + 16) & ~v7;
  v9 = ((unint64_t)a2 + v7 + 16) & ~v7;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v8, v9);
  v10 = *(_QWORD *)(v6 + 64) + 7;
  v11 = (_QWORD *)((v10 + v8) & 0xFFFFFFFFFFFFFFF8);
  v12 = (_QWORD *)((v10 + v9) & 0xFFFFFFFFFFFFFFF8);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *sub_1A038D158(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = ((unint64_t)a1 + v5 + 16) & ~v5;
  v7 = ((unint64_t)a2 + v5 + 16) & ~v5;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v6, v7);
  *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v6) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)((*(_QWORD *)(v4 + 64) + 7 + v7) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1A038D1D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v9, v10);
  v11 = *(_QWORD *)(v7 + 64) + 7;
  v12 = (_QWORD *)((v11 + v9) & 0xFFFFFFFFFFFFFFF8);
  v13 = (_QWORD *)((v11 + v10) & 0xFFFFFFFFFFFFFFF8);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1A038D278(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  if (v7 >= a2)
  {
    if ((v6 & 0x80000000) != 0)
    {
      return __swift_getEnumTagSinglePayload((a1 + v8 + 16) & ~v8, v6, v4);
    }
    else
    {
      v13 = *(_QWORD *)(a1 + 8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
  }
  else
  {
    if (((((*(_QWORD *)(v5 + 64) + ((v8 + 16) & ~v8) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_1A038D304 + 4 * byte_1A0396A68[v11]))();
  }
}

void sub_1A038D380(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
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
     + 16;
  if (v6 >= a3)
  {
    v10 = 0u;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~*(unsigned __int8 *)(v5 + 80)) + 7) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v8 = a3 - v6 + 1;
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
  }
  if (a2 > v6)
  {
    if ((_DWORD)v7)
    {
      v11 = ~v6 + a2;
      bzero(a1, v7);
      *a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t sub_1A038D480@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;

  *((_BYTE *)v5 + v6) = 0;
  if ((_DWORD)a1)
  {
    if ((a2 & 0x80000000) != 0)
    {
      return __swift_storeEnumTagSinglePayload(((unint64_t)v5 + v4 + 16) & a4, a1, a2, a3);
    }
    else if ((a1 & 0x80000000) != 0)
    {
      *v5 = a1 ^ 0x80000000;
      v5[1] = 0;
    }
    else
    {
      v5[1] = (a1 - 1);
    }
  }
  return result;
}

TeaSettings::Page __swiftcall Page.init(title:_:)(Swift::String title, Swift::OpaquePointer _)
{
  uint64_t v2;
  TeaSettings::Page result;

  *(Swift::String *)v2 = title;
  *(Swift::OpaquePointer *)(v2 + 16) = _;
  result.title = title;
  result.layout = _;
  return result;
}

uint64_t Page.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Page.cellStyle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 6;
  return swift_bridgeObjectRetain();
}

uint64_t Page.isEnabled.getter()
{
  return 1;
}

uint64_t Page.reset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12[2];
  uint64_t v13;
  _BYTE v14[40];
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 16);
  result = MEMORY[0x1E0DEE9D8];
  v18 = MEMORY[0x1E0DEE9D8];
  v11 = *(_QWORD *)(v1 + 16);
  if (v11)
  {
    v10 = v1 + 32;
    swift_bridgeObjectRetain();
    for (i = 0; i != v11; ++i)
    {
      v4 = *(_QWORD *)(v10 + 40 * i + 32);
      v5 = *(_QWORD *)(v4 + 16);
      if (v5)
      {
        v6 = v4 + 32;
        swift_bridgeObjectRetain();
        do
        {
          sub_1A0386F1C(v6, (uint64_t)v14);
          sub_1A0384B38(0, (unint64_t *)&qword_1EE596758);
          sub_1A0384B38(0, &qword_1EE596780);
          if (swift_dynamicCast())
          {
            sub_1A0384B84(v12, (uint64_t)v15);
            v7 = v16;
            v8 = v17;
            __swift_project_boxed_opaque_existential_1(v15, v16);
            v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
            sub_1A038C194(v9);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
          }
          else
          {
            v13 = 0;
            memset(v12, 0, sizeof(v12));
            sub_1A038D700((uint64_t)v12);
          }
          v6 += 40;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    return v18;
  }
  return result;
}

uint64_t sub_1A038D700(uint64_t a1)
{
  uint64_t v2;

  sub_1A038D73C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_1A038D73C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE596788[0])
  {
    sub_1A0384B38(255, &qword_1EE596780);
    v0 = sub_1A0395F14();
    if (!v1)
      atomic_store(v0, qword_1EE596788);
  }
}

uint64_t destroy for Page()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s11TeaSettings4PageVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for Page(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
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

uint64_t assignWithTake for Page(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Page(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for Page(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Page()
{
  return &type metadata for Page;
}

uint64_t sub_1A038D958(_QWORD *a1)
{
  return Updatable.save<A>(setting:value:)(a1);
}

uint64_t sub_1A038D96C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Updatable.reset<A>(setting:)(a1, a2, a3, a4);
}

uint64_t Updatable.reset<A>(setting:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v5 = type metadata accessor for Setting(0, *(_QWORD *)(v4 + 88), *(_QWORD *)(v4 + 96), a4);
  swift_retain();
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v5);
  sub_1A038B034();
  return swift_release();
}

uint64_t sub_1A038DA28(uint64_t a1)
{
  return Updatable.apply(preset:)(a1);
}

uint64_t sub_1A038DA3C(uint64_t a1)
{
  if (qword_1ED0CCD90 != -1)
    swift_once();
  return sub_1A038A434(a1);
}

uint64_t Updatable.apply(preset:)(uint64_t a1)
{
  if (qword_1ED0CCD90 != -1)
    swift_once();
  return sub_1A038A434(a1);
}

uint64_t sub_1A038DAE4(uint64_t a1)
{
  return sub_1A038DA3C(a1);
}

uint64_t Updatable.toggle(setting:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  BOOL v8;
  uint64_t v9;

  v6 = MEMORY[0x1E0DEAFA0];
  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD, _UNKNOWN **, uint64_t))(*(_QWORD *)(a3 + 8) + 8))(&v9, a1, MEMORY[0x1E0DEAFA0], &protocol witness table for Bool, a2);
  v8 = (v9 & 1) == 0;
  return (*(uint64_t (**)(uint64_t, BOOL *, uint64_t, _UNKNOWN **, uint64_t, uint64_t))(a3 + 16))(a1, &v8, v6, &protocol witness table for Bool, a2, a3);
}

uint64_t dispatch thunk of Updatable.save<A>(setting:value:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of Updatable.reset<A>(setting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of Updatable.apply(preset:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t sub_1A038DBA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_7_1();
  v2 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 152);
  v5 = type metadata accessor for Trait(0, v0, v3, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
}

void Setting.migrate(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v6 = MEMORY[0x1E0C80A78](qword_1ED0CD200);
  v7[1] = *(_OWORD *)(v5 + 88);
  v8 = a1;
  v9 = a2;
  sub_1A0382FD4(v6, (void (*)(uint64_t))sub_1A038DC88, (uint64_t)v7);
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_1A038DC88(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _UNKNOWN **))(v1 + 32))(a1, &off_1E4370D18);
}

uint64_t method lookup function for Setting()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Setting.__allocating_init(_:defaultValue:domain:access:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

_QWORD *sub_1A038DCC4(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(_BYTE *, unsigned __int8 *, uint64_t);

  v4 = __dst;
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_DWORD *)(v6 + 80);
  v9 = v8;
  v10 = v7 + v8;
  v11 = (v10 & ~(unint64_t)v8) + v7;
  if (v11 <= 8)
    v12 = 8;
  else
    v12 = v11;
  if (v8 > 7u || (v8 & 0x100000) != 0 || (unint64_t)(v12 + 1) > 0x18)
  {
    v15 = *(_QWORD *)__src;
    *v4 = *(_QWORD *)__src;
    v4 = (_QWORD *)(v15 + ((v8 & 0xF8 ^ 0x1F8u) & (v8 + 16)));
    swift_retain();
  }
  else
  {
    v16 = __src[v12];
    if (v16 >= 2)
    {
      if (v12 <= 3)
        v17 = v12;
      else
        v17 = 4;
      __asm { BR              X14 }
    }
    if (v16 == 1)
    {
      v18 = ~v9;
      v19 = *(void (**)(_BYTE *, unsigned __int8 *, uint64_t))(v6 + 16);
      v19(__dst, __src, v5);
      v19((_BYTE *)(((unint64_t)v4 + v10) & v18), (unsigned __int8 *)((unint64_t)&__src[v10] & v18), v5);
      *((_BYTE *)v4 + v12) = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v12] = 0;
      swift_bridgeObjectRetain();
    }
  }
  return v4;
}

_BYTE *sub_1A038DE40(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_BYTE *, unsigned __int8 *, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  v10 = ((v7 + v8) & ~v8) + v7;
  if (v10 <= 8)
    v11 = 8;
  else
    v11 = v10;
  v12 = __src[v11];
  if (v12 >= 2)
  {
    if (v11 <= 3)
      v13 = v11;
    else
      v13 = 4;
    __asm { BR              X14 }
  }
  if (v12 == 1)
  {
    v14 = ~v8;
    v15 = *(void (**)(_BYTE *, unsigned __int8 *, uint64_t))(v6 + 16);
    v15(__dst, __src, *(_QWORD *)(a3 + 16));
    v15((_BYTE *)((unint64_t)&__dst[v9] & v14), (unsigned __int8 *)((unint64_t)&__src[v9] & v14), v5);
    __dst[v11] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *(_QWORD *)__src;
    __dst[v11] = 0;
    swift_bridgeObjectRetain();
  }
  return __dst;
}

unsigned __int8 *sub_1A038DF80(unsigned __int8 *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(unsigned __int8 *, uint64_t);
  unsigned int v16;
  uint64_t v17;
  void (*v18)(unsigned __int8 *, unsigned __int8 *, uint64_t);

  if (__dst != __src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = *(unsigned __int8 *)(v6 + 80);
    v9 = v7 + v8;
    v10 = ((v7 + v8) & ~v8) + v7;
    if (v10 <= 8)
      v11 = 8;
    else
      v11 = v10;
    v12 = __dst[v11];
    if (v12 >= 2)
    {
      if (v11 <= 3)
        v13 = v11;
      else
        v13 = 4;
      __asm { BR              X13 }
    }
    v14 = ~v8;
    if (v12 == 1)
    {
      v15 = *(void (**)(unsigned __int8 *, uint64_t))(v6 + 8);
      v15(__dst, *(_QWORD *)(a3 + 16));
      v15((unsigned __int8 *)((unint64_t)&__dst[v9] & v14), v5);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v16 = __src[v11];
    if (v16 >= 2)
    {
      if (v11 <= 3)
        v17 = v11;
      else
        v17 = 4;
      __asm { BR              X12 }
    }
    if (v16 == 1)
    {
      v18 = *(void (**)(unsigned __int8 *, unsigned __int8 *, uint64_t))(v6 + 16);
      v18(__dst, __src, v5);
      v18((unsigned __int8 *)((unint64_t)&__dst[v9] & v14), (unsigned __int8 *)((unint64_t)&__src[v9] & v14), v5);
      __dst[v11] = 1;
    }
    else
    {
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v11] = 0;
      swift_bridgeObjectRetain();
    }
  }
  return __dst;
}

_BYTE *sub_1A038E174(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(_BYTE *, unsigned __int8 *, uint64_t);

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(unsigned __int8 *)(v6 + 80);
  v9 = v7 + v8;
  v10 = ((v7 + v8) & ~v8) + v7;
  if (v10 <= 8)
    v11 = 8;
  else
    v11 = v10;
  v12 = __src[v11];
  if (v12 >= 2)
  {
    if (v11 <= 3)
      v13 = v11;
    else
      v13 = 4;
    __asm { BR              X14 }
  }
  if (v12 == 1)
  {
    v14 = ~v8;
    v15 = *(void (**)(_BYTE *, unsigned __int8 *, uint64_t))(v6 + 32);
    v15(__dst, __src, *(_QWORD *)(a3 + 16));
    v15((_BYTE *)((unint64_t)&__dst[v9] & v14), (unsigned __int8 *)((unint64_t)&__src[v9] & v14), v5);
    __dst[v11] = 1;
  }
  else
  {
    *(_QWORD *)__dst = *(_QWORD *)__src;
    __dst[v11] = 0;
  }
  return __dst;
}

uint64_t sub_1A038E2B0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  char v5;
  int v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  v3 = 8;
  if (((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) > 8)
    v3 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
         + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
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
  return ((uint64_t (*)(void))((char *)&loc_1A038E384 + 4 * byte_1A0396B40[(v4 - 1)]))();
}

void sub_1A038E3D0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (v5 <= 8)
    v5 = 8;
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

uint64_t sub_1A038E584(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;

  v2 = 8;
  if (((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64) > 8)
    v2 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64)
         + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (*(unsigned __int8 *)(a1 + v2) < 2u)
    return *(unsigned __int8 *)(a1 + v2);
  if (v2 <= 3)
    v3 = v2;
  else
    v3 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1A038E5DC + 4 * byte_1A0396B4E[v3]))();
}

void sub_1A038E624(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  if (((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
       + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
     + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64) <= 8)
    v4 = 8;
  else
    v4 = ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64)
         + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 80))
       + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
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

uint64_t Settings.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Settings.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Settings()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for Settings.CompositionalList()
{
  return &type metadata for Settings.CompositionalList;
}

uint64_t sub_1A038E73C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1A038E760()
{
  Configurable.setting<A>(_:_:)();
}

uint64_t sub_1A038E76C()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:defaultValue:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of Configurable.setting<A>(_:defaultValue:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 32))();
}

uint64_t SettingProperty.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0();
  SettingProperty.init(_:)(a1);
  return v2;
}

uint64_t sub_1A038E7FC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_1A03891B8(a2);
    return swift_release();
  }
  return result;
}

uint64_t sub_1A038E858(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  MEMORY[0x1E0C80A78](a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return SettingProperty.wrappedValue.setter((uint64_t)v2);
}

void (*SettingProperty.wrappedValue.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v3[4] = malloc(v6);
  SettingProperty.wrappedValue.getter();
  return sub_1A038E94C;
}

void sub_1A038E94C(uint64_t a1, char a2)
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
    SettingProperty.wrappedValue.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    SettingProperty.wrappedValue.setter(*(_QWORD *)(*(_QWORD *)a1 + 32));
  }
  free(v4);
  free(v3);
  free(v2);
}

uint64_t SettingProperty.observe(block:)(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t result;
  _QWORD *v11;

  v6 = *v2;
  v7 = OUTLINED_FUNCTION_6_3();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  OUTLINED_FUNCTION_4_6();
  sub_1A0384ED4();
  *v3 = OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v8 + 104))(v3, *MEMORY[0x1E0DEF740], v7);
  v9 = sub_1A0395D34();
  result = (*(uint64_t (**)(uint64_t *, uint64_t))(v8 + 8))(v3, v7);
  if ((v9 & 1) != 0)
  {
    v11 = (_QWORD *)OUTLINED_FUNCTION_0();
    v11[2] = *(_QWORD *)(v6 + 80);
    v11[3] = *(_QWORD *)(v6 + 88);
    v11[4] = a1;
    v11[5] = a2;
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_3_4();
    OUTLINED_FUNCTION_11_0();
    swift_retain();
    OUTLINED_FUNCTION_10_0();
    return swift_endAccess();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1A038EAF8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  uint64_t result;

  v4 = a2 + 16;
  swift_beginAccess();
  result = MEMORY[0x1A1AF8D20](v4);
  if (result)
  {
    a3();
    return swift_unknownObjectRelease();
  }
  return result;
}

void SettingProperty.eagerObserve(block:)(void (*a1)(uint64_t), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;

  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v2 + 80) - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_4_6();
  v8 = sub_1A0395D28();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  OUTLINED_FUNCTION_1_7();
  *v4 = OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v9 + 104))(v4, *MEMORY[0x1E0DEF740], v8);
  v10 = sub_1A0395D34();
  (*(void (**)(uint64_t *, uint64_t))(v9 + 8))(v4, v8);
  if ((v10 & 1) != 0)
  {
    v11 = SettingProperty.observe(block:)((uint64_t)a1, a2);
    SettingProperty.wrappedValue.getter(v11);
    a1(v3);
    OUTLINED_FUNCTION_12_0(v3, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
    OUTLINED_FUNCTION_0_4();
  }
  else
  {
    __break(1u);
  }
}

void SettingProperty.eagerObserve<A>(disposeOn:block:)(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  char v17;
  uint64_t v18;
  uint64_t v20;

  v20 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v8 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](a1);
  OUTLINED_FUNCTION_8_2();
  v11 = v10 - v9;
  v12 = OUTLINED_FUNCTION_6_3();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  OUTLINED_FUNCTION_8_2();
  v16 = (uint64_t *)(v15 - v14);
  sub_1A0384ED4();
  *v16 = OUTLINED_FUNCTION_7_3();
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v13 + 104))(v16, *MEMORY[0x1E0DEF740], v12);
  v17 = sub_1A0395D34();
  (*(void (**)(uint64_t *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) != 0)
  {
    SettingProperty.observe<A>(disposeOn:block:)(a1, (uint64_t)a2, a3, a4);
    SettingProperty.wrappedValue.getter(v18);
    a2(a1, v11);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v11, v20);
    OUTLINED_FUNCTION_0_4();
  }
  else
  {
    __break(1u);
  }
}

uint64_t SettingProperty.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t SettingProperty.__deallocating_deinit()
{
  SettingProperty.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A038EDC4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A038EDE8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A038EE0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A038EE30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))();
}

uint64_t sub_1A038EE50()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A038EE74()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A038EEA0(uint64_t a1)
{
  uint64_t v1;

  return sub_1A038EAF8(a1, *(_QWORD *)(v1 + 40), *(void (**)(void))(v1 + 48));
}

uint64_t sub_1A038EEB0(uint64_t a1)
{
  return SettingProperty.wrappedValue.getter(a1);
}

uint64_t sub_1A038EED4()
{
  return 16;
}

__n128 sub_1A038EEE0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t method lookup function for SettingProperty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SettingProperty.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1A038EF00()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 16) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  swift_release();
  OUTLINED_FUNCTION_12_0(v0 + v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  return swift_deallocObject();
}

uint64_t sub_1A038EF68()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80);
  return sub_1A038E7FC(*(_QWORD *)(v0 + 32), v0 + ((v1 + 40) & ~v1));
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return sub_1A0395EB4();
}

uint64_t sub_1A038EF94(_QWORD *a1)
{
  return PresetApplicatorType.set<A>(_:to:)(a1);
}

uint64_t PresetApplicatorType.set<A>(_:to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[4];
  _QWORD *v12;

  v2 = *a1;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v3 = qword_1ED0CD200;
  v12 = a1;
  v6 = v2 + 88;
  v5 = *(_QWORD *)(v2 + 88);
  v4 = *(_QWORD *)(v6 + 8);
  v7 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v4 + 32);
  swift_retain();
  v7(v11, v5, v4);
  v9 = type metadata accessor for Setting(0, v5, v4, v8);
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v9);
  sub_1A0383CFC((uint64_t)&v12, v11, v3, v9);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return swift_release();
}

uint64_t sub_1A038F084(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return PresetApplicatorType.reset<A>(_:)(a1, a2, a3, a4);
}

uint64_t PresetApplicatorType.reset<A>(_:)(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *a1;
  if (qword_1ED0CCD90 != -1)
    swift_once();
  v5 = type metadata accessor for Setting(0, *(_QWORD *)(v4 + 88), *(_QWORD *)(v4 + 96), a4);
  swift_retain();
  MEMORY[0x1A1AF8C30](&unk_1A0396B54, v5);
  sub_1A038B034();
  return swift_release();
}

uint64_t dispatch thunk of PresetApplicatorType.set<A>(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of PresetApplicatorType.reset<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 16))();
}

uint64_t If.init(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v5;

  *a4 = a1;
  a4[1] = a2;
  v5 = swift_retain();
  a3(v5);
  return swift_release();
}

uint64_t If.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_7();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v1);
}

uint64_t If.cellStyle.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t If.isEnabled.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_7();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v0, v1) & 1;
}

uint64_t If.isVisible.getter()
{
  uint64_t (**v0)(void);

  return (*v0)() & 1;
}

uint64_t destroy for If(uint64_t a1)
{
  swift_release();
  return __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
}

uint64_t initializeWithCopy for If(uint64_t a1, uint64_t a2)
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
  swift_retain();
  v7(a1 + 16, v4, v6);
  return a1;
}

_QWORD *assignWithCopy for If(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for If(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for If(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 56))
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

uint64_t storeEnumTagSinglePayload for If(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for If()
{
  return &type metadata for If;
}

uint64_t PresetItem.preset.getter()
{
  return swift_retain();
}

uint64_t PresetItem.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PresetItem.actions.getter()
{
  return swift_bridgeObjectRetain();
}

_QWORD *PresetItem.__allocating_init(_:label:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  result[5] = a4;
  return result;
}

_QWORD *PresetItem.init(_:label:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
  return v4;
}

uint64_t sub_1A038F674@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 40);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = sub_1A038F708;
  *(_QWORD *)(a1 + 24) = v1;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 8;
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_1A038F6B4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16);
  if (qword_1ED0CCD90 != -1)
    swift_once();
  return sub_1A038A434(v1);
}

uint64_t sub_1A038F708()
{
  uint64_t v0;

  return sub_1A038F6B4(v0);
}

uint64_t PresetItem.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PresetItem.__deallocating_deinit()
{
  PresetItem.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A038F75C()
{
  return PresetItem.label.getter();
}

uint64_t sub_1A038F77C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A038F674(a1);
}

uint64_t type metadata accessor for PresetItem()
{
  return objc_opt_self();
}

uint64_t method lookup function for PresetItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PresetItem.__allocating_init(_:label:actions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of PresetItem.cellStyle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PresetItem.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

TeaSettings::FeatureState_optional __swiftcall FeatureState.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TeaSettings::FeatureState_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1A0395FF8();
  result.value = OUTLINED_FUNCTION_4();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t FeatureState.rawValue.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x64656C62616E65;
  if (*v0 != 1)
    v1 = 0x64656C6261736964;
  if (*v0)
    return v1;
  else
    return 0x746C7561666564;
}

uint64_t sub_1A038F898()
{
  return sub_1A038F8A0();
}

uint64_t sub_1A038F8A0()
{
  return sub_1A038F934();
}

uint64_t sub_1A038F8AC()
{
  return sub_1A038F8B4();
}

uint64_t sub_1A038F8B4()
{
  sub_1A0395D88();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A038F92C()
{
  return sub_1A038F934();
}

uint64_t sub_1A038F934()
{
  sub_1A0396040();
  sub_1A0395D88();
  swift_bridgeObjectRelease();
  return sub_1A0396058();
}

TeaSettings::FeatureState_optional sub_1A038F9D0(Swift::String *a1)
{
  return FeatureState.init(rawValue:)(*a1);
}

uint64_t sub_1A038F9DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FeatureState.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_1A038FA00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1ED0CCB00)
  {
    v4 = type metadata accessor for Option(0, (uint64_t)&type metadata for FeatureState, a3, a4);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1ED0CCB00);
  }
}

uint64_t sub_1A038FA4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v5;

  result = type metadata accessor for Option(319, *(_QWORD *)(a1 + 80), a3, a4);
  if (v5 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1A038FAD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  swift_allocObject();
  sub_1A038FB24(a1, a2, a3, v6);
  OUTLINED_FUNCTION_0_5();
}

void sub_1A038FB24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v7 = *v4;
  v4[2] = a1;
  v8 = (char *)v4 + *(_QWORD *)(v7 + 104);
  v9 = type metadata accessor for Option(0, *(_QWORD *)(v7 + 80), a3, a4);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8, a2, v9);
  *(_QWORD *)((char *)v4 + *(_QWORD *)(*v4 + 112)) = a3;
  OUTLINED_FUNCTION_0_5();
}

#error "1A038FBE4: call analysis failed (funcsize=49)"

void sub_1A038FC50()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *v0;
  swift_release();
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 104);
  v5 = type metadata accessor for Option(0, *(_QWORD *)(v1 + 80), v3, v4);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v2, v5);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_0_5();
}

uint64_t sub_1A038FCB4()
{
  sub_1A038FC50();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for OptionItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for OptionItem);
}

uint64_t sub_1A038FCE4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A038FD1C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)a1 = *(_QWORD *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 112));
  *(_QWORD *)(a1 + 8) = sub_1A038FE8C;
  *(_QWORD *)(a1 + 16) = v1;
  *(_QWORD *)(a1 + 24) = sub_1A038FE90;
  *(_QWORD *)(a1 + 32) = v1;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 1;
  swift_retain_n();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A038FD84(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  if ((result & 1) != 0)
  {
    v4 = (_QWORD *)a2[2];
    type metadata accessor for Option(0, *(_QWORD *)(*a2 + 80), a3, a4);
    return Updatable.save<A>(setting:value:)(v4);
  }
  return result;
}

BOOL sub_1A038FDE4()
{
  uint64_t v0;
  BOOL v1;

  v0 = swift_bridgeObjectRetain();
  v1 = sub_1A0386DD0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_1A038FE28()
{
  return sub_1A038FCE4();
}

uint64_t sub_1A038FE48@<X0>(uint64_t a1@<X8>)
{
  return sub_1A038FD1C(a1);
}

BOOL sub_1A038FE68()
{
  return sub_1A038FDE4();
}

uint64_t sub_1A038FE90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  return sub_1A038FD84(a1, v4, a3, a4);
}

uint64_t Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, char *a5, uint64_t a6)
{
  char v6;
  char v8;
  char v9;

  v6 = *a5;
  v9 = *a4;
  v8 = v6;
  return sub_1A0390444(a1, a2, a3, 0, &v9, &v8, a6);
}

uint64_t sub_1A038FED4(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t AssociatedTypeWitness;
  void (*v45)(char *, char *);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[32];
  uint64_t v51;

  v37 = a5;
  v38 = a8;
  v45 = a1;
  v46 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  MEMORY[0x1E0C80A78](a1);
  v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v13 = (char *)&v34 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v17 = MEMORY[0x1E0C80A78](v16);
  v35 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - v19;
  v21 = sub_1A0395ECC();
  if (!v21)
    return sub_1A0395E6C();
  v22 = v21;
  v51 = sub_1A0395F98();
  v41 = sub_1A0395FA4();
  sub_1A0395F80();
  v43 = a6;
  result = sub_1A0395EC0();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v24 = v22;
    v42 = v15;
    while (v24)
    {
      v48 = v24;
      v25 = (void (*)(char *, _QWORD))sub_1A0395EE4();
      v26 = *(void (**)(char *))(v10 + 16);
      v27 = v10;
      v28 = AssociatedTypeWitness;
      v26(v13);
      v25(v50, 0);
      v29 = v20;
      v30 = v49;
      v45(v13, v47);
      if (v30)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v47, v37);
      }
      v49 = 0;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
      sub_1A0395F8C();
      result = sub_1A0395ED8();
      v24 = v48 - 1;
      v10 = v27;
      if (v48 == 1)
      {
        v32 = v39;
        v31 = v40;
        v33 = v35;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v29, v40);
        sub_1A0395F38();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
        return v51;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void static Item.RangeControlType.slider.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

BOOL static Item.ResetBehavior.== infix(_:_:)(_BYTE *a1, _BYTE *a2)
{
  return OUTLINED_FUNCTION_9_1(*a1 ^ *a2);
}

uint64_t Item.ResetBehavior.hash(into:)()
{
  return sub_1A039604C();
}

uint64_t Item.ResetBehavior.hashValue.getter()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

uint64_t sub_1A03902BC()
{
  sub_1A0396040();
  Item.ResetBehavior.hash(into:)();
  return sub_1A0396058();
}

uint64_t Item.setting.getter()
{
  return swift_retain();
}

uint64_t Item.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Item.actions.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Item.isVisible.getter()
{
  return 1;
}

void sub_1A0390338(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 56);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t sub_1A039034C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 65);
}

BOOL sub_1A0390354(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_1A0390364()
{
  return sub_1A039604C();
}

uint64_t sub_1A0390388()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

BOOL sub_1A03903CC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1A0390354(*a1, *a2);
}

uint64_t sub_1A03903E0()
{
  return sub_1A0390388();
}

uint64_t sub_1A03903F0()
{
  return sub_1A0390364();
}

uint64_t sub_1A0390400()
{
  sub_1A0396040();
  sub_1A0390364();
  return sub_1A0396058();
}

uint64_t sub_1A0390444(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char *a5, char *a6, uint64_t a7)
{
  char v13;
  uint64_t result;
  char v15;
  char v16;

  v13 = a4 & 1;
  result = swift_allocObject();
  v15 = *a5;
  v16 = *a6;
  *(_BYTE *)(result + 48) = 1;
  *(_QWORD *)(result + 56) = 1065353216;
  *(_WORD *)(result + 64) = 128;
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  *(_BYTE *)(result + 66) = v13;
  *(_BYTE *)(result + 50) = v15;
  *(_BYTE *)(result + 49) = v16;
  *(_QWORD *)(result + 32) = a3;
  *(_QWORD *)(result + 40) = a7;
  return result;
}

void sub_1A03904D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = type metadata accessor for Trait(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = MEMORY[0x1E0C80A78](v5);
  MEMORY[0x1E0C80A78](v6);
  sub_1A03879B8();
  __asm { BR              X10 }
}

void sub_1A0390594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
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
  _QWORD *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void (*v47)(uint64_t *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;

  v12 = OUTLINED_FUNCTION_2_7(a1, a2, a3, a4);
  OUTLINED_FUNCTION_4_7(v12, v13, (uint64_t)&protocol witness table for Item<A>, v14, v15, v16, v17, v18, v48, v49, v50, v51, v52, v53, v54, v55, v56, v57, v58,
    v59);
  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_3_5();
  if (OUTLINED_FUNCTION_1_8())
  {
    v19 = *(_QWORD *)(v11 - 136);
    v20 = *(_QWORD *)(v11 - 128);
    v21 = v9 + *(_QWORD *)(*(_QWORD *)v9 + 152);
    swift_beginAccess();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(v8, v21, v7);
    if (swift_getEnumCaseMultiPayload())
    {
      if ((*(_BYTE *)(v4 + 66) & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v22 = OUTLINED_FUNCTION_5_5();
        (*(void (**)(uint64_t *, uint64_t, double))(v10 + 8))(v8, v7, v22);
      }
      else
      {
        v41 = *(unsigned __int8 *)(v4 + 65);
        v42 = *(_QWORD *)(v4 + 40);
        v43 = *(_QWORD **)(v11 - 152);
        *v43 = v19;
        v43[1] = v20;
        v43[2] = v42;
        v44 = (uint64_t)(v43 + 5);
        if (v41 == 1)
        {
          OUTLINED_FUNCTION_14_0(v44);
          v46 = 3;
        }
        else
        {
          OUTLINED_FUNCTION_14_0(v44);
          v46 = 2;
        }
        *(_BYTE *)(v45 + 80) = v46;
        v47 = *(void (**)(uint64_t *, uint64_t))(v10 + 8);
        OUTLINED_FUNCTION_13();
        swift_bridgeObjectRetain();
        v47(v8, v7);
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v23 = *v8;
      *(_QWORD *)(v11 - 136) = *v8;
      type metadata accessor for Option(255, v5, v24, v25);
      v26 = sub_1A0395EB4();
      v28 = type metadata accessor for OptionItem(0, v5, v6, v27);
      *(_QWORD *)(v11 - 160) = v28;
      v29 = MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF50], v26);
      v31 = sub_1A038FED4((void (*)(char *, char *))sub_1A0391E8C, v4, v26, v28, MEMORY[0x1E0DEDCE8], v29, MEMORY[0x1E0DEDD18], v30);
      *(_QWORD *)(v11 - 136) = v23;
      MEMORY[0x1E0C80A78](v31);
      MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF38], v26);
      v32 = MEMORY[0x1E0DEA968];
      v33 = sub_1A0395DF4();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v11 - 136) = v33;
      sub_1A0387F14(0, (unint64_t *)&qword_1ED0CC868, v32, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
      sub_1A0391EC0();
      v34 = sub_1A0395D4C();
      v36 = v35;
      swift_bridgeObjectRelease();
      sub_1A0387F14(0, &qword_1EE596818, (uint64_t)&type metadata for Group, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
      v37 = OUTLINED_FUNCTION_0();
      *(_OWORD *)(v37 + 16) = xmmword_1A03964B0;
      sub_1A0391F18();
      v38 = sub_1A0395FBC();
      *(_QWORD *)(v37 + 32) = 0;
      *(_QWORD *)(v37 + 40) = 0;
      *(_QWORD *)(v37 + 48) = v34;
      *(_QWORD *)(v37 + 56) = v36;
      *(_QWORD *)(v37 + 64) = v38;
      v39 = (_QWORD *)OUTLINED_FUNCTION_0();
      v39[2] = v5;
      v39[3] = v6;
      v39[4] = v31;
      v40 = *(_QWORD *)(v11 - 152);
      *(_QWORD *)v40 = v37;
      *(_QWORD *)(v40 + 8) = sub_1A0391F90;
      *(_QWORD *)(v40 + 16) = v39;
      *(_OWORD *)(v40 + 24) = 0u;
      *(_OWORD *)(v40 + 40) = 0u;
      *(_OWORD *)(v40 + 56) = 0u;
      *(_QWORD *)(v40 + 72) = 0;
      *(_BYTE *)(v40 + 80) = 7;
    }
  }
  else
  {
    OUTLINED_FUNCTION_5_5();
  }
}

uint64_t sub_1A0390A24@<X0>(char a1@<W0>, uint64_t *a2@<X1>, _BYTE *a3@<X8>)
{
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  _BYTE *v21;
  _BYTE v22[24];
  uint64_t v23;

  v21 = a3;
  v5 = *a2;
  v6 = *(_QWORD *)(*a2 + 80);
  v7 = sub_1A0395F14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v13 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = MEMORY[0x1E0DEAFA0];
  v22[0] = a1;
  v16 = *(_QWORD *)(v5 + 88);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 24))(v22, v6, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v22);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v6);
    v17 = (_QWORD *)a2[2];
    type metadata accessor for Item(0, v6, v16, v18);
    Updatable.save<A>(setting:value:)(v17);
    result = (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v6);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v6);
    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  *v21 = *((_BYTE *)a2 + 50);
  return result;
}

uint64_t sub_1A0390BE8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v8 = *a2;
  v9 = *(_QWORD *)(*a2 + 80);
  v10 = type metadata accessor for Option(0, v9, a3, a4);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v18 - v12;
  type metadata accessor for OptionItem(0, v9, *(_QWORD *)(v8 + 88), v14);
  v15 = a2[2];
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  sub_1A038FAD8(v15, (uint64_t)v13, a2[5]);
  *a5 = v16;
  swift_retain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A0390CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t *v6;
  uint64_t result;
  unint64_t v8;

  v6 = (uint64_t *)(a1 + *(int *)(type metadata accessor for Option(0, a2, a3, a4) + 32));
  result = *v6;
  if (v6[1])
  {
    sub_1A0395D94();
    result = 547520738;
    v8 = 0xA400000000000000;
  }
  else
  {
    v8 = 0;
  }
  *a5 = result;
  a5[1] = v8;
  return result;
}

double sub_1A0390D48@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  double result;
  uint64_t v8;

  v5 = type metadata accessor for OptionItem(255, a1, a2, a3);
  v6 = sub_1A0395EB4();
  MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF38], v6);
  sub_1A0395E00();
  if (v8)
  {
    *(_QWORD *)(a4 + 24) = v5;
    *(_QWORD *)(a4 + 32) = &off_1E4370E60;
    *(_QWORD *)a4 = v8;
  }
  else
  {
    *(_QWORD *)(a4 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1A0390DF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
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
  void (*v17)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t *v22;
  _QWORD v23[4];

  v22 = a3;
  v5 = *a3;
  v6 = *(_QWORD *)(*a3 + 80);
  v7 = sub_1A0395F14();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v13 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23[3] = MEMORY[0x1E0DEA968];
  v23[0] = a1;
  v23[1] = a2;
  v16 = *(_QWORD *)(v5 + 88);
  v17 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v16 + 24);
  swift_bridgeObjectRetain();
  v17(v23, v6, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 0, 1, v6);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v6);
    v18 = (_QWORD *)v22[2];
    type metadata accessor for Item(0, v6, v16, v19);
    Updatable.save<A>(setting:value:)(v18);
    return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v6);
  }
  else
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
}

uint64_t sub_1A0390FB4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  _QWORD v21[4];

  v6 = *a3;
  v7 = *(_QWORD *)(*a3 + 80);
  v8 = sub_1A0395F14();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v21 - v11;
  v13 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v10);
  v15 = (char *)v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[3] = MEMORY[0x1E0DEA968];
  v21[0] = a1;
  v21[1] = a2;
  v16 = *(_QWORD *)(v6 + 88);
  v17 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v16 + 24);
  swift_bridgeObjectRetain();
  v17(v21, v7, v16);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v21);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v7) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v12, v7);
  v19 = (_QWORD *)a3[2];
  type metadata accessor for Item(0, v7, v16, v20);
  Updatable.save<A>(setting:value:)(v19);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v7);
}

uint64_t sub_1A0391128(uint64_t a1, _QWORD *a2)
{
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
  uint64_t v15;
  void (*v16)(_QWORD *, uint64_t, uint64_t);
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[4];

  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + 80);
  v6 = sub_1A0395F14();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v20 - v9;
  v11 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v8);
  v13 = (char *)v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A0387F14(0, (unint64_t *)&qword_1ED0CC868, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
  v20[3] = v14;
  v20[0] = a1;
  v15 = *(_QWORD *)(v4 + 88);
  v16 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v15 + 24);
  swift_bridgeObjectRetain();
  v16(v20, v5, v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v20);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v5) == 1)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v10, v5);
  v18 = (_QWORD *)a2[2];
  type metadata accessor for Item(0, v5, v15, v19);
  Updatable.save<A>(setting:value:)(v18);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v5);
}

float sub_1A03912B0(uint64_t *a1)
{
  return (float)*a1;
}

_QWORD *sub_1A03912C0@<X0>(float (*a1)(char *)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  _QWORD *v6;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(_QWORD *__return_ptr, uint64_t, uint64_t);
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t EnumCaseMultiPayload;
  uint64_t v52;
  char *v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  char *v56;
  void (*v57)(char *, uint64_t);
  char *v58;
  uint64_t (*v59)(char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
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
  _QWORD *result;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t, uint64_t, uint64_t);
  char *v85;
  uint64_t v86;
  void (*v87)(uint64_t, uint64_t, uint64_t);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  float (*v93)(uint64_t);
  float v94;
  float v95;
  float v96;
  void (*v97)(uint64_t, uint64_t);
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  _QWORD *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  float v108;
  uint64_t v109;
  _QWORD *v110;
  uint64_t v111;
  uint64_t v112;
  void (*v113)(char *, uint64_t);
  float v114;
  uint64_t v115;
  _QWORD *v116;
  uint64_t v117;
  void (*v118)(uint64_t, uint64_t);
  char *v119;
  void (*v120)(char *, uint64_t);
  char *v121;
  float (*v122)(uint64_t);
  float v123;
  float v124;
  float v125;
  void (*v126)(uint64_t, uint64_t);
  void (*v127)(char *, uint64_t);
  uint64_t v128;
  _QWORD *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, char *, uint64_t);
  char *v134;
  void (*v135)(_QWORD *__return_ptr, uint64_t, uint64_t);
  void (*v136)(char *, uint64_t);
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  float (*v143)(char *);
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  _QWORD *v148;
  uint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  _QWORD v157[4];

  v145 = a4;
  v144 = a3;
  v142 = a2;
  v143 = a1;
  v156 = a6;
  v8 = *v6;
  v9 = *(_QWORD *)(*v6 + 80);
  v151 = type metadata accessor for Trait(0, v9, a2, a3);
  v149 = *(_QWORD *)(v151 - 8);
  MEMORY[0x1E0C80A78](v151);
  v150 = (char *)&v132 - v10;
  v11 = sub_1A0395F14();
  v152 = *(_QWORD *)(v11 - 8);
  v153 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v140 = (uint64_t)&v132 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v141 = (uint64_t)&v132 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v132 - v17;
  v19 = *(_QWORD *)(v9 - 8);
  v20 = MEMORY[0x1E0C80A78](v16);
  v147 = (char *)&v132 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v20);
  v146 = (char *)&v132 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v132 - v25;
  v154 = *(_QWORD *)(a5 - 8);
  v27 = MEMORY[0x1E0C80A78](v24);
  v139 = (uint64_t)&v132 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v132 - v30;
  MEMORY[0x1E0C80A78](v29);
  v155 = (char *)&v132 - v32;
  v33 = v6[2];
  v34 = *(_QWORD *)(v8 + 88);
  v36 = type metadata accessor for Item(0, v9, v34, v35);
  v148 = v6;
  Configurable.setting<A>(_:)(v33, v36, (uint64_t)&protocol witness table for Item<A>, v37, v38, v39, v40, v41, v132, (uint64_t)v133, (uint64_t)v134, (uint64_t)v135, (uint64_t)v136, v137, v138, v139, v140, v141, v142,
    (uint64_t)v143);
  v42 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v34 + 32);
  v42(v157, v9, v34);
  v43 = *(void (**)(char *, uint64_t))(v19 + 8);
  v43(v26, v9);
  if (!swift_dynamicCast())
  {
    __swift_storeEnumTagSinglePayload((uint64_t)v18, 1, 1, a5);
    v59 = *(uint64_t (**)(char *, uint64_t))(v152 + 8);
    v58 = v18;
LABEL_7:
    v60 = v153;
LABEL_12:
    result = (_QWORD *)v59(v58, v60);
    v77 = v156;
    *(_OWORD *)(v156 + 48) = 0u;
    *(_OWORD *)(v77 + 64) = 0u;
    *(_OWORD *)(v77 + 16) = 0u;
    *(_OWORD *)(v77 + 32) = 0u;
    *(_OWORD *)v77 = 0u;
    *(_BYTE *)(v77 + 80) = 11;
    return result;
  }
  v135 = v42;
  v137 = v19;
  v134 = v31;
  v138 = v34;
  v136 = v43;
  v44 = (uint64_t)v148;
  __swift_storeEnumTagSinglePayload((uint64_t)v18, 0, 1, a5);
  v45 = v154;
  v46 = v155;
  v47 = v18;
  v48 = a5;
  v133 = *(void (**)(char *, char *, uint64_t))(v154 + 32);
  v133(v155, v47, a5);
  v49 = v33 + *(_QWORD *)(*(_QWORD *)v33 + 152);
  swift_beginAccess();
  v50 = v150;
  (*(void (**)(char *, uint64_t, uint64_t))(v149 + 16))(v150, v49, v151);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (!(_DWORD)EnumCaseMultiPayload)
  {
    v157[0] = *(_QWORD *)v50;
    MEMORY[0x1E0C80A78](EnumCaseMultiPayload);
    v61 = a5;
    *(&v132 - 2) = a5;
    *(&v132 - 1) = v44;
    v62 = v9;
    type metadata accessor for Option(255, v9, v63, v64);
    v65 = sub_1A0395EB4();
    v66 = v9;
    v67 = v138;
    v69 = type metadata accessor for OptionItem(0, v66, v138, v68);
    v70 = MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF50], v65);
    v72 = sub_1A038FED4((void (*)(char *, char *))sub_1A0392868, (uint64_t)(&v132 - 4), v65, v69, MEMORY[0x1E0DEDCE8], v70, MEMORY[0x1E0DEDD18], v71);
    swift_bridgeObjectRelease();
    sub_1A0387F14(0, &qword_1EE596818, (uint64_t)&type metadata for Group, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DED1E8]);
    v73 = swift_allocObject();
    *(_OWORD *)(v73 + 16) = xmmword_1A03964B0;
    sub_1A0391F18();
    v74 = sub_1A0395FBC();
    *(_OWORD *)(v73 + 32) = 0u;
    *(_OWORD *)(v73 + 48) = 0u;
    *(_QWORD *)(v73 + 64) = v74;
    (*(void (**)(char *, uint64_t))(v154 + 8))(v155, v61);
    result = (_QWORD *)swift_allocObject();
    result[2] = v62;
    result[3] = v61;
    result[4] = v67;
    result[5] = v72;
    v76 = v156;
    *(_QWORD *)v156 = v73;
    *(_QWORD *)(v76 + 8) = sub_1A03928A8;
    *(_QWORD *)(v76 + 16) = result;
    *(_OWORD *)(v76 + 24) = 0u;
    *(_OWORD *)(v76 + 40) = 0u;
    *(_OWORD *)(v76 + 56) = 0u;
    *(_QWORD *)(v76 + 72) = 0;
    *(_BYTE *)(v76 + 80) = 7;
    return result;
  }
  if ((_DWORD)EnumCaseMultiPayload != 1)
  {
    if ((*(_BYTE *)(v44 + 66) & 1) != 0)
    {
      v59 = *(uint64_t (**)(char *, uint64_t))(v45 + 8);
      v58 = v46;
      goto LABEL_11;
    }
    v103 = v44;
    v104 = v45;
    v105 = *(_QWORD *)(v103 + 56);
    v106 = v156;
    if (*(char *)(v103 + 64) < 0)
    {
      v114 = v143(v46);
      (*(void (**)(char *, uint64_t))(v104 + 8))(v46, v48);
      v115 = *(_QWORD *)(v103 + 40);
      v116 = (_QWORD *)swift_allocObject();
      v117 = v144;
      v116[2] = v48;
      v116[3] = v117;
      v116[4] = v145;
      v116[5] = v103;
      *(_QWORD *)v106 = LODWORD(v114) | (unint64_t)(v105 << 32);
      *(_QWORD *)(v106 + 8) = 0x7F7FFFFF00000000;
      *(_QWORD *)(v106 + 16) = v115;
      *(_QWORD *)(v106 + 24) = sub_1A03928B4;
      *(_QWORD *)(v106 + 32) = v116;
      *(_OWORD *)(v106 + 40) = 0u;
      *(_OWORD *)(v106 + 56) = 0u;
      *(_QWORD *)(v106 + 72) = 0;
      *(_BYTE *)(v106 + 80) = 4;
    }
    else
    {
      v107 = *(_BYTE *)(v103 + 64) & 1;
      v108 = v143(v46);
      if ((_DWORD)v107)
        v105 = 0;
      (*(void (**)(char *, uint64_t))(v104 + 8))(v46, v48);
      v109 = *(_QWORD *)(v103 + 40);
      v110 = (_QWORD *)swift_allocObject();
      v111 = v144;
      v110[2] = v48;
      v110[3] = v111;
      v110[4] = v145;
      v110[5] = v103;
      *(_QWORD *)v106 = LODWORD(v108);
      *(_QWORD *)(v106 + 8) = v105;
      *(_QWORD *)(v106 + 16) = v107;
      *(_QWORD *)(v106 + 24) = 2139095039;
      *(_QWORD *)(v106 + 32) = v109;
      *(_QWORD *)(v106 + 40) = sub_1A03928B4;
      *(_QWORD *)(v106 + 48) = v110;
      *(_QWORD *)(v106 + 56) = 0;
      *(_QWORD *)(v106 + 64) = 0;
      *(_QWORD *)(v106 + 72) = 0;
      *(_BYTE *)(v106 + 80) = 5;
    }
    swift_retain();
    goto LABEL_26;
  }
  v52 = v9;
  v53 = &v50[*(int *)(swift_getTupleTypeMetadata2() + 48)];
  v54 = *(void (**)(char *, char *, uint64_t))(v137 + 32);
  v55 = v146;
  v54(v146, v50, v9);
  v56 = v147;
  v54(v147, v53, v9);
  if ((*(_BYTE *)(v44 + 66) & 1) != 0)
  {
    v57 = v136;
    v136(v56, v9);
    v57(v55, v9);
    v58 = v155;
    v59 = *(uint64_t (**)(char *, uint64_t))(v154 + 8);
LABEL_11:
    v60 = v48;
    goto LABEL_12;
  }
  v78 = v44;
  v79 = v9;
  v80 = v138;
  v81 = v135;
  v135(v157, v79, v138);
  v82 = v141;
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload(v82, 1, 1, v48);
    v112 = v82;
    v113 = v136;
    v136(v147, v52);
    v113(v55, v52);
    (*(void (**)(char *, uint64_t))(v154 + 8))(v155, v48);
    v59 = *(uint64_t (**)(char *, uint64_t))(v152 + 8);
    v58 = (char *)v112;
    goto LABEL_7;
  }
  __swift_storeEnumTagSinglePayload(v82, 0, 1, v48);
  v83 = (uint64_t)v134;
  v84 = (void (*)(uint64_t, uint64_t, uint64_t))v133;
  v133(v134, (char *)v82, v48);
  v85 = v147;
  v81(v157, v52, v80);
  v86 = v140;
  if ((swift_dynamicCast() & 1) == 0)
  {
    __swift_storeEnumTagSinglePayload(v86, 1, 1, v48);
    v118 = *(void (**)(uint64_t, uint64_t))(v154 + 8);
    v118(v83, v48);
    v119 = v85;
    v120 = v136;
    v136(v119, v52);
    v120(v55, v52);
    v118((uint64_t)v155, v48);
    v59 = *(uint64_t (**)(char *, uint64_t))(v152 + 8);
    v58 = (char *)v86;
    goto LABEL_7;
  }
  __swift_storeEnumTagSinglePayload(v86, 0, 1, v48);
  v87 = v84;
  v88 = v139;
  v87(v139, v86, v48);
  v89 = *(_QWORD *)(v78 + 56);
  v90 = v48;
  if ((*(char *)(v78 + 64) & 0x80000000) == 0)
  {
    v91 = *(_BYTE *)(v78 + 64) & 1;
    v92 = v155;
    v93 = (float (*)(uint64_t))v143;
    v94 = v143(v155);
    if ((_DWORD)v91)
      v89 = 0;
    v95 = v93(v83);
    v96 = v93(v88);
    v97 = *(void (**)(uint64_t, uint64_t))(v154 + 8);
    v97(v88, v90);
    v97(v83, v90);
    v98 = v136;
    v136(v147, v52);
    v98(v146, v52);
    v97((uint64_t)v92, v90);
    v99 = *(_QWORD *)(v78 + 40);
    v100 = (_QWORD *)swift_allocObject();
    v101 = v144;
    v100[2] = v90;
    v100[3] = v101;
    v100[4] = v145;
    v100[5] = v78;
    v102 = v156;
    *(_QWORD *)v156 = LODWORD(v94);
    *(_QWORD *)(v102 + 8) = v89;
    *(_QWORD *)(v102 + 16) = v91 | ((unint64_t)LODWORD(v95) << 32);
    *(_QWORD *)(v102 + 24) = LODWORD(v96);
    *(_QWORD *)(v102 + 32) = v99;
    *(_QWORD *)(v102 + 40) = sub_1A03928B4;
    *(_QWORD *)(v102 + 48) = v100;
    *(_QWORD *)(v102 + 56) = 0;
    *(_QWORD *)(v102 + 64) = 0;
    *(_QWORD *)(v102 + 72) = 0;
    *(_BYTE *)(v102 + 80) = 5;
    swift_retain();
LABEL_26:
    swift_retain();
    return (_QWORD *)swift_bridgeObjectRetain();
  }
  v121 = v155;
  v122 = (float (*)(uint64_t))v143;
  v123 = v143(v155);
  v124 = v122(v83);
  v125 = v122(v88);
  v126 = *(void (**)(uint64_t, uint64_t))(v154 + 8);
  v126(v88, v48);
  v126(v83, v48);
  v127 = v136;
  v136(v147, v52);
  v127(v146, v52);
  v126((uint64_t)v121, v48);
  v128 = *(_QWORD *)(v78 + 40);
  v129 = (_QWORD *)swift_allocObject();
  v130 = v144;
  v129[2] = v48;
  v129[3] = v130;
  v129[4] = v145;
  v129[5] = v78;
  v131 = v156;
  *(_QWORD *)v156 = LODWORD(v123) | (unint64_t)(v89 << 32);
  *(_QWORD *)(v131 + 8) = LODWORD(v124) | ((unint64_t)LODWORD(v125) << 32);
  *(_QWORD *)(v131 + 16) = v128;
  *(_QWORD *)(v131 + 24) = sub_1A039284C;
  *(_QWORD *)(v131 + 32) = v129;
  *(_OWORD *)(v131 + 40) = 0u;
  *(_OWORD *)(v131 + 56) = 0u;
  *(_QWORD *)(v131 + 72) = 0;
  *(_BYTE *)(v131 + 80) = 4;
  swift_bridgeObjectRetain();
  swift_retain();
  return (_QWORD *)swift_retain();
}

void sub_1A0391DFC(_QWORD *a1@<X8>, float a2@<S0>)
{
  if ((~LODWORD(a2) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (a2 <= -9.2234e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (a2 < 9.2234e18)
  {
    *a1 = (uint64_t)a2;
    return;
  }
LABEL_7:
  __break(1u);
}

float sub_1A0391E40(uint64_t a1)
{
  return *(double *)a1;
}

double sub_1A0391E4C@<D0>(double *a1@<X8>, float a2@<S0>)
{
  double result;

  result = a2;
  *a1 = result;
  return result;
}

float sub_1A0391E58(uint64_t a1)
{
  return *(float *)a1;
}

void sub_1A0391E60(float *a1@<X8>, float a2@<S0>)
{
  *a1 = a2;
}

uint64_t type metadata accessor for Item(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Item);
}

uint64_t sub_1A0391E74(uint64_t a1)
{
  _QWORD *v1;

  return sub_1A0391128(a1, v1);
}

uint64_t sub_1A0391E7C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  return sub_1A0390FB4(a1, a2, v2);
}

uint64_t sub_1A0391E84(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_1A0390DF4(a1, a2, v2);
}

uint64_t sub_1A0391E8C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  _QWORD *v4;

  return sub_1A0390BE8(a1, v4, a2, a3, a4);
}

uint64_t sub_1A0391EA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;

  return sub_1A0390CD0(a1, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), a2, a3);
}

unint64_t sub_1A0391EC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EE596810;
  if (!qword_1EE596810)
  {
    sub_1A0387F14(255, (unint64_t *)&qword_1ED0CC868, MEMORY[0x1E0DEA968], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x1E0DEAEC8]);
    result = MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF20], v1);
    atomic_store(result, (unint64_t *)&qword_1EE596810);
  }
  return result;
}

unint64_t sub_1A0391F18()
{
  unint64_t result;

  result = qword_1EE596758;
  if (!qword_1EE596758)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_1EE596758);
  }
  return result;
}

uint64_t sub_1A0391F6C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_1A0391F90@<D0>(uint64_t a1@<X3>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1A0390D48(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a1, a2);
}

uint64_t sub_1A0391F9C@<X0>(char a1@<W0>, _BYTE *a2@<X8>)
{
  uint64_t *v2;

  return sub_1A0390A24(a1, v2, a2);
}

uint64_t Item.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t Item.__deallocating_deinit()
{
  Item.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A0391FF0()
{
  return Item.label.getter();
}

void sub_1A0392010(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1A03904D4(a1, a2, a3, a4);
}

uint64_t Item.reset()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)(v4 + 49) & 1) != 0)
    return MEMORY[0x1E0DEE9D8];
  v6 = *(uint64_t **)(v4 + 16);
  v7 = type metadata accessor for Item(0, *(_QWORD *)(*(_QWORD *)v4 + 80), *(_QWORD *)(*(_QWORD *)v4 + 88), a4);
  Updatable.reset<A>(setting:)(v6, v7, (uint64_t)&protocol witness table for Item<A>, v8);
  return swift_bridgeObjectRetain();
}

uint64_t type metadata accessor for Item.ResetBehavior(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Item.ResetBehavior);
}

uint64_t sub_1A0392098(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Item.reset()(a1, a2, a3, a4);
}

uint64_t Item<>.init(_:label:resetBehavior:type:)(uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t *a5)
{
  uint64_t v5;
  char v6;
  uint64_t result;
  char v8;
  char v9;

  v5 = *a5;
  v6 = *((_BYTE *)a5 + 8);
  v9 = *a4;
  v8 = 0;
  result = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(a1, a2, a3, &v8, &v9, MEMORY[0x1E0DEE9D8]);
  *(_QWORD *)(result + 56) = v5;
  *(_BYTE *)(result + 64) = v6;
  return result;
}

uint64_t Item<>.init(_:label:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5)
{
  __int16 v6;

  v6 = *a4;
  return sub_1A0390444(a1, a2, a3, 1, (char *)&v6 + 1, (char *)&v6, a5);
}

void Item<>.init(_:label:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v7;

  v7 = *a4;
  sub_1A03921A8(0, a2, a3, (uint64_t)a4);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_10_1(a1, a2, a3, 0, 0, v7);
  OUTLINED_FUNCTION_2_0();
}

void sub_1A03921A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v5;

  if (!qword_1EE596820[0])
  {
    v4 = type metadata accessor for Item(0, MEMORY[0x1E0DEA968], (uint64_t)&protocol witness table for String, a4);
    if (!v5)
      atomic_store(v4, qword_1EE596820);
  }
}

void Item<>.init(_:label:secure:changeBehavior:resetBehavior:actions:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6)
{
  char v6;
  uint64_t v10;

  v6 = a4;
  v10 = *a6;
  sub_1A03921A8(0, a2, a3, a4);
  OUTLINED_FUNCTION_0();
  *(_BYTE *)(OUTLINED_FUNCTION_10_1(a1, a2, a3, 0, 0, v10) + 65) = v6;
  OUTLINED_FUNCTION_2_0();
}

void sub_1A0392260()
{
  JUMPOUT(0x1A1AF8C30);
}

uint64_t sub_1A0392270()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for Item()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Item.isEnabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of Item.cellStyle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_1A0392320(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2)
  {
    if (a2 >= 0x7F && *(_BYTE *)(a1 + 9))
    {
      v2 = *(_DWORD *)a1 + 126;
    }
    else
    {
      v2 = (*(_BYTE *)(a1 + 8) & 0x7E | (*(unsigned __int8 *)(a1 + 8) >> 7)) ^ 0x7F;
      if (v2 >= 0x7E)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return v2 + 1;
}

uint64_t sub_1A0392368(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7E)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 127;
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7F)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_BYTE *)(result + 8) = 2 * (((-a2 >> 1) & 0x3F) - ((_BYTE)a2 << 6));
    }
  }
  return result;
}

uint64_t sub_1A03923BC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8) >> 7;
}

uint64_t sub_1A03923C8(uint64_t result)
{
  *(_BYTE *)(result + 8) &= ~0x80u;
  return result;
}

uint64_t sub_1A03923D8(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = *(_BYTE *)(result + 8) & 1 | (a2 << 7);
  return result;
}

uint64_t type metadata accessor for Item.RangeControlType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Item.RangeControlType);
}

uint64_t sub_1A03923F8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A0392418(uint64_t result, int a2, int a3)
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

uint64_t sub_1A0392448(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1A0392464(uint64_t result, int a2)
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

uint64_t type metadata accessor for Item.RangeControlType.Precision(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Item.RangeControlType.Precision);
}

uint64_t sub_1A0392494(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A03924E0 + 4 * byte_1A0396F0D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1A0392514 + 4 * byte_1A0396F08[v4]))();
}

uint64_t sub_1A0392514(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A039251C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A0392524);
  return result;
}

uint64_t sub_1A0392530(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A0392538);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1A039253C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0392544(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t type metadata accessor for Item.Context(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Item.Context);
}

void sub_1A039255C()
{
  JUMPOUT(0x1A1AF8C30);
}

uint64_t sub_1A039256C()
{
  return OUTLINED_FUNCTION_11_1() & 1;
}

double sub_1A0392590@<D0>(uint64_t a1@<X1>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;

  v4 = type metadata accessor for OptionItem(255, a1, a2, a2);
  v5 = sub_1A0395EB4();
  MEMORY[0x1A1AF8C30](MEMORY[0x1E0DEAF38], v5);
  sub_1A0395E00();
  if (v7)
  {
    *(_QWORD *)(a3 + 24) = v4;
    *(_QWORD *)(a3 + 32) = &off_1E4370E60;
    *(_QWORD *)a3 = v7;
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

uint64_t sub_1A0392644(void (*a1)(float), float a2, uint64_t a3, uint64_t *a4, uint64_t a5)
{
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
  _QWORD *v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24[4];

  v23 = a4;
  v8 = *a4;
  v9 = *(_QWORD *)(*a4 + 80);
  v10 = sub_1A0395F14();
  v22 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v15 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24[3] = a5;
  __swift_allocate_boxed_opaque_existential_0(v24);
  a1(a2);
  v18 = *(_QWORD *)(v8 + 88);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 24))(v24, v9, v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v24);
  if ((swift_dynamicCast() & 1) != 0)
  {
    OUTLINED_FUNCTION_8((uint64_t)v13, 0);
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v9);
    v19 = (_QWORD *)v23[2];
    type metadata accessor for Item(0, v9, v18, v20);
    Updatable.save<A>(setting:value:)(v19);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v9);
  }
  else
  {
    OUTLINED_FUNCTION_8((uint64_t)v13, 1);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v10);
  }
}

uint64_t objectdestroy_3Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A039284C(float a1)
{
  uint64_t v1;

  return sub_1A0392644(*(void (**)(float))(v1 + 24), a1, *(_QWORD *)(v1 + 32), *(uint64_t **)(v1 + 40), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1A0392868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;

  return sub_1A0390BE8(a1, *(_QWORD **)(v3 + 24), *(_QWORD *)(v3 + 16), a2, a3);
}

uint64_t sub_1A0392884()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

double sub_1A03928A8@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A0392590(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 32), a1);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return sub_1A038FB88();
}

double OUTLINED_FUNCTION_14_0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  *(_QWORD *)(v2 + 24) = v1;
  *(_QWORD *)(v2 + 32) = v3;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

void sub_1A03928DC()
{
  _QWORD *v0;
  uint64_t v1;

  type metadata accessor for SettingAction();
  v0 = (_QWORD *)OUTLINED_FUNCTION_0();
  v1 = MEMORY[0x1E0DEE9D8];
  v0[2] = 0x7070615F6C6C696BLL;
  v0[3] = 0xE800000000000000;
  v0[5] = 0;
  v0[6] = 0;
  v0[4] = v1;
  sub_1A0392C1C();
  swift_release();
  qword_1EE596AA8 = (uint64_t)v0;
  OUTLINED_FUNCTION_2();
}

void SettingAction.__allocating_init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;

  v8 = (_QWORD *)OUTLINED_FUNCTION_0();
  v9 = MEMORY[0x1E0DEE9D8];
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = v9;
  v8[5] = a3;
  v8[6] = a4;
  OUTLINED_FUNCTION_2_0();
}

uint64_t static SettingActions.restart.getter()
{
  if (qword_1EE596720 != -1)
    swift_once();
  return swift_retain();
}

uint64_t SettingActions.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t SettingActions.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t static SettingAction.PostInstruction.== infix(_:_:)()
{
  return 1;
}

void SettingAction.PostInstruction.hash(into:)()
{
  sub_1A039604C();
  OUTLINED_FUNCTION_2();
}

uint64_t SettingAction.PostInstruction.hashValue.getter()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

uint64_t sub_1A0392A48()
{
  return SettingAction.PostInstruction.hashValue.getter();
}

void sub_1A0392A5C()
{
  SettingAction.PostInstruction.hash(into:)();
}

uint64_t sub_1A0392A70()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

void SettingAction.identifier.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_1A0392AD4()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_1A0392B2C(v0);
}

uint64_t sub_1A0392AFC()
{
  OUTLINED_FUNCTION_3_2();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1A0392B2C(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3_2();
  *(_QWORD *)(v1 + 32) = a1;
  return swift_bridgeObjectRelease();
}

void sub_1A0392B6C()
{
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2();
}

_QWORD *SettingAction.init(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v5 = MEMORY[0x1E0DEE9D8];
  v4[2] = a1;
  v4[3] = a2;
  v4[4] = v5;
  v4[5] = a3;
  v4[6] = a4;
  return v4;
}

void sub_1A0392BC0()
{
  uint64_t v0;
  void (*v1)(uint64_t, _UNKNOWN **);

  v1 = *(void (**)(uint64_t, _UNKNOWN **))(v0 + 40);
  if (v1)
  {
    if (qword_1ED0CCD90 != -1)
      swift_once();
    v1(qword_1ED0CD200, &off_1E4370D58);
  }
  OUTLINED_FUNCTION_2();
}

uint64_t sub_1A0392C1C()
{
  uint64_t v0;
  char *v1;

  OUTLINED_FUNCTION_3_2();
  sub_1A0392D8C();
  v1 = *(char **)(*(_QWORD *)(v0 + 32) + 16);
  sub_1A0392DD4(v1);
  *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16) = v1 + 1;
  return swift_retain();
}

uint64_t sub_1A0392C84()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return sub_1A0392E10(*(_QWORD *)(v0 + 40));
}

uint64_t SettingAction.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A0392E10(*(_QWORD *)(v0 + 40));
  return v0;
}

uint64_t SettingAction.__deallocating_deinit()
{
  SettingAction.deinit();
  return swift_deallocClassInstance();
}

void sub_1A0392CF4()
{
  SettingAction.identifier.getter();
}

uint64_t static SettingAction.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24))
    return 1;
  else
    return sub_1A039601C();
}

uint64_t sub_1A0392D44(uint64_t *a1, uint64_t *a2)
{
  return static SettingAction.== infix(_:_:)(*a1, *a2) & 1;
}

char *sub_1A0392D64(char *result, uint64_t a2, char *a3)
{
  if (a3 != result || &result[56 * a2] <= a3)
    return (char *)OUTLINED_FUNCTION_0_10(a3, result);
  return result;
}

char *sub_1A0392D8C()
{
  char **v0;
  char *v1;
  char *result;

  v1 = *v0;
  result = (char *)swift_isUniquelyReferenced_nonNull_native();
  *v0 = v1;
  if (!(_DWORD)result)
  {
    result = sub_1A0393038(result, *((_QWORD *)v1 + 2) + 1, 1, v1);
    *v0 = result;
  }
  return result;
}

char *sub_1A0392DD4(char *result)
{
  char **v1;
  unint64_t v2;

  v2 = *((_QWORD *)*v1 + 3);
  if ((uint64_t)(result + 1) > (uint64_t)(v2 >> 1))
  {
    result = sub_1A0393038((char *)(v2 > 1), (int64_t)(result + 1), 1, *v1);
    *v1 = result;
  }
  return result;
}

uint64_t sub_1A0392E10(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_1A0392E24()
{
  unint64_t result;

  result = qword_1EE596AB0;
  if (!qword_1EE596AB0)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for SettingAction.PostInstruction, &type metadata for SettingAction.PostInstruction);
    atomic_store(result, (unint64_t *)&qword_1EE596AB0);
  }
  return result;
}

void sub_1A0392E60(uint64_t *a1@<X8>)
{
  *a1 = sub_1A0392AFC();
  OUTLINED_FUNCTION_2();
}

uint64_t type metadata accessor for SettingActions()
{
  return objc_opt_self();
}

uint64_t method lookup function for SettingActions()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for SettingAction()
{
  return objc_opt_self();
}

uint64_t method lookup function for SettingAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SettingAction.postInstructions.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of SettingAction.postInstructions.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of SettingAction.postInstructions.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SettingAction.__allocating_init(_:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of SettingAction.perform()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SettingAction.then(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t getEnumTagSinglePayload for SettingAction.PostInstruction(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SettingAction.PostInstruction(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1A0392FB8 + 4 * byte_1A0397198[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1A0392FD8 + 4 * byte_1A039719D[v4]))();
}

_BYTE *sub_1A0392FB8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1A0392FD8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A0392FE0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A0392FE8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1A0392FF0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1A0392FF8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1A0393004()
{
  return 0;
}

ValueMetadata *type metadata accessor for SettingAction.PostInstruction()
{
  return &type metadata for SettingAction.PostInstruction;
}

_QWORD *sub_1A039301C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1A0384978(a1, a2, a3, a4, &qword_1EE596750, (unint64_t *)&qword_1EE596758);
}

char *sub_1A0393038(char *result, int64_t a2, char a3, char *a4)
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
    sub_1A0393234(0, &qword_1EE596AB8);
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
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[v8] <= v12)
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

void sub_1A039312C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
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
    sub_1A0393234(0, &qword_1EE596818);
    v10 = (char *)OUTLINED_FUNCTION_0();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || &v13[40 * v8] <= v12)
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_2_0();
}

void sub_1A0393234(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_1A0396004();
    if (!v4)
      atomic_store(v3, a2);
  }
  OUTLINED_FUNCTION_2();
}

uint64_t Updater.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Updater.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t method lookup function for Updater()
{
  return swift_lookUpClassMethod();
}

uint64_t PresetManager.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  PresetManager.init()();
  return v0;
}

Swift::Void __swiftcall PresetManager.register(_:presets:)(Swift::String _, Swift::OpaquePointer presets)
{
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;

  object = _._object;
  countAndFlagsBits = _._countAndFlagsBits;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v4 = swift_bridgeObjectRetain();
  sub_1A03934F0(v4, countAndFlagsBits, (uint64_t)object);
  swift_endAccess();
  swift_bridgeObjectRelease();
}

uint64_t PresetManager.deinit()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PresetManager.__deallocating_deinit()
{
  PresetManager.deinit();
  return swift_deallocClassInstance();
}

void sub_1A039338C(uint64_t a1, uint64_t a2, Swift::OpaquePointer a3)
{
  PresetManager.register(_:presets:)(*(Swift::String *)&a1, a3);
}

unint64_t sub_1A03933AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1A0396040();
  sub_1A0395D88();
  v4 = sub_1A0396058();
  return sub_1A0393410(a1, a2, v4);
}

unint64_t sub_1A0393410(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1A039601C() & 1) == 0)
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
      while (!v14 && (sub_1A039601C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1A03934F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_1A0393590(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of PresetManagerType.register(_:presets:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 8))();
}

uint64_t dispatch thunk of PresetManagerType.apply(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t method lookup function for PresetManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PresetManager.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1A0393590(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_1A03933AC(a2, a3);
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  sub_1A03936A0();
  if ((sub_1A0395FC8() & 1) == 0)
    goto LABEL_5;
  v13 = sub_1A03933AC(a2, a3);
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = sub_1A0396034();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = v15[7];
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(v16 + 8 * v11) = a1;
  }
  else
  {
    sub_1A0393704(v11, a2, a3, a1, v15);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void sub_1A03936A0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EE596AC0)
  {
    sub_1A0388968();
    v0 = sub_1A0395FD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EE596AC0);
  }
}

unint64_t sub_1A0393704(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
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

uint64_t SettingsBundle.label.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t SettingsBundle.cellStyle.getter@<X0>(uint64_t a1@<X8>)
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
  char v12;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v6 = *(_QWORD *)(v1 + 48);
  v7 = *(_QWORD *)(v1 + 56);
  v8 = *(_QWORD *)(v1 + 64);
  v9 = *(_QWORD *)(v1 + 72);
  v10 = *(_QWORD *)(v1 + 80);
  v11 = *(_QWORD *)(v1 + 88);
  v12 = *(_BYTE *)(v1 + 96);
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_BYTE *)(a1 + 80) = v12;
  return sub_1A038B3CC(v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12);
}

uint64_t SettingsBundle.isEnabled.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 97);
}

uint64_t SettingsBundle.isVisible.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 98);
}

uint64_t SettingsBundle.init(title:layout:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = a3;
  *(_QWORD *)(a4 + 24) = sub_1A0393814;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_WORD *)(a4 + 96) = 263;
  *(_BYTE *)(a4 + 98) = 1;
  *(_QWORD *)(a4 + 104) = a3;
  return swift_bridgeObjectRetain();
}

double sub_1A0393814@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t SettingsBundle.callAsFunction(title:additionalGroups:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v10;

  v10 = *(_QWORD *)(v4 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1A038C338(a3);
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = v10;
  *(_QWORD *)(a4 + 24) = sub_1A0393814;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 80) = 0u;
  *(_WORD *)(a4 + 96) = 263;
  *(_BYTE *)(a4 + 98) = 1;
  *(_QWORD *)(a4 + 104) = v10;
  return swift_bridgeObjectRetain();
}

uint64_t destroy for SettingsBundle(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_1A038B510(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_BYTE *)(a1 + 96));
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SettingsBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 32);
  v15 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 40);
  v7 = *(_QWORD *)(a2 + 48);
  v8 = *(_QWORD *)(a2 + 56);
  v9 = *(_QWORD *)(a2 + 64);
  v10 = *(_QWORD *)(a2 + 80);
  v14 = *(_QWORD *)(a2 + 72);
  v11 = *(_QWORD *)(a2 + 88);
  v12 = *(_BYTE *)(a2 + 96);
  swift_bridgeObjectRetain();
  sub_1A038B3CC(v16, v15, v5, v6, v7, v8, v9, v14, v10, v11, v12);
  *(_QWORD *)(a1 + 16) = v16;
  *(_QWORD *)(a1 + 24) = v15;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = v8;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v14;
  *(_QWORD *)(a1 + 80) = v10;
  *(_QWORD *)(a1 + 88) = v11;
  *(_BYTE *)(a1 + 96) = v12;
  *(_WORD *)(a1 + 97) = *(_WORD *)(a2 + 97);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SettingsBundle(uint64_t a1, uint64_t a2)
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
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v24;
  uint64_t v25;
  char v26;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 48);
  v9 = *(_QWORD *)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 64);
  v11 = *(_QWORD *)(a2 + 72);
  v24 = *(_QWORD *)(a2 + 80);
  v25 = *(_QWORD *)(a2 + 88);
  v26 = *(_BYTE *)(a2 + 96);
  sub_1A038B3CC(v4, v5, v6, v7, v8, v9, v10, v11, v24, v25, v26);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_QWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 64);
  v19 = *(_QWORD *)(a1 + 72);
  v20 = *(_QWORD *)(a1 + 80);
  v21 = *(_QWORD *)(a1 + 88);
  v22 = *(_BYTE *)(a1 + 96);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 32) = v6;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v8;
  *(_QWORD *)(a1 + 56) = v9;
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v11;
  *(_QWORD *)(a1 + 80) = v24;
  *(_QWORD *)(a1 + 88) = v25;
  *(_BYTE *)(a1 + 96) = v26;
  sub_1A038B510(v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22);
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  *(_BYTE *)(a1 + 98) = *(_BYTE *)(a2 + 98);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t assignWithTake for SettingsBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
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
  char v16;
  __int128 v17;
  __int128 v18;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_BYTE *)(a2 + 96);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 56);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 80);
  v15 = *(_QWORD *)(a1 + 88);
  v16 = *(_BYTE *)(a1 + 96);
  v17 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v17;
  v18 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v18;
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 96) = v5;
  sub_1A038B510(v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16);
  *(_BYTE *)(a1 + 97) = *(_BYTE *)(a2 + 97);
  *(_BYTE *)(a1 + 98) = *(_BYTE *)(a2 + 98);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SettingsBundle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
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

uint64_t storeEnumTagSinglePayload for SettingsBundle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SettingsBundle()
{
  return &type metadata for SettingsBundle;
}

uint64_t PresetStartupTask.__allocating_init(presetManager:)(__int128 *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  sub_1A0384B84(a1, v2 + 16);
  return v2;
}

uint64_t PresetStartupTask.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t PresetStartupTask.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t method lookup function for PresetStartupTask()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PresetStartupTask.__allocating_init(presetManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PresetStartupTask.run(launchOptions:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

void FeatureFlags.items.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE v14[24];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 16);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    OUTLINED_FUNCTION_3_6();
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    return;
  }
  OUTLINED_FUNCTION_3_6();
  v2 = sub_1A0395FE0();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v17 = MEMORY[0x1E0DEE9D8];
  sub_1A038C45C(0, v2 & ~(v2 >> 63), 0);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = 0;
    v4 = v17;
    do
    {
      if ((v1 & 0xC000000000000001) != 0)
      {
        v5 = MEMORY[0x1A1AF88A0](v3, v1);
        sub_1A0386F1C(v5 + 16, (uint64_t)v14);
        swift_unknownObjectRelease();
      }
      else
      {
        sub_1A0386F1C(*(_QWORD *)(v1 + 8 * v3 + 32) + 16, (uint64_t)v14);
      }
      v17 = v4;
      v7 = *(_QWORD *)(v4 + 16);
      v6 = *(_QWORD *)(v4 + 24);
      if (v7 >= v6 >> 1)
        sub_1A038C45C(v6 > 1, v7 + 1, 1);
      ++v3;
      v8 = v15;
      v9 = v16;
      v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v14, v15);
      MEMORY[0x1E0C80A78](v10);
      v12 = &v14[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
      (*(void (**)(_BYTE *))(v13 + 16))(v12);
      sub_1A038C73C(v7, (uint64_t)v12, &v17, v8, v9);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
      v4 = v17;
    }
    while (v2 != v3);
    swift_bridgeObjectRelease();
  }
}

uint64_t FeatureFlags.__allocating_init(_:)(uint64_t a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t FeatureFlags.init(_:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t FeatureFlags.enableAllItem(title:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = *(_QWORD *)(v3 + 16);
  v8 = type metadata accessor for FeatureFlags.EnableAllItem();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_6();
  swift_bridgeObjectRetain();
  result = sub_1A0394394(a1, a2, v7);
  a3[3] = v8;
  a3[4] = (uint64_t)&off_1E4370F50;
  *a3 = result;
  return result;
}

uint64_t FeatureFlags.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FeatureFlags.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1A0393FFC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  swift_retain();
  v3 = swift_bridgeObjectRetain();
  v4 = sub_1A0394114(v3, v1);
  swift_bridgeObjectRelease();
  sub_1A0394D58();
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1A0397450;
  if (qword_1EE596720 != -1)
    swift_once();
  *(_QWORD *)(v5 + 32) = qword_1EE596AA8;
  sub_1A0395E48();
  v6 = v5;
  v7 = swift_allocObject();
  swift_weakInit();
  *(_QWORD *)a1 = v4 & 1;
  *(_QWORD *)(a1 + 8) = v6;
  *(_QWORD *)(a1 + 16) = sub_1A0394F54;
  *(_QWORD *)(a1 + 24) = v7;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 0;
  return swift_retain();
}

uint64_t sub_1A0394114(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  if (a1 >> 62)
    goto LABEL_12;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v4; v4 = sub_1A0395FE0())
  {
    v5 = 4;
    while (1)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v6 = MEMORY[0x1A1AF88A0](v5 - 4, a1);
      }
      else
      {
        v6 = *(_QWORD *)(a1 + 8 * v5);
        swift_retain();
      }
      v7 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v8 = (*(uint64_t (**)(uint64_t, _UNKNOWN **))(v6 + 56))(a2, &off_1E4370F28);
      swift_release();
      if ((v8 & 1) != 0)
      {
        ++v5;
        if (v7 != v4)
          continue;
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  v8 = 1;
LABEL_14:
  swift_release();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1A0394228@<X0>(char a1@<W0>, char *a2@<X8>)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD, uint64_t, _UNKNOWN **);
  char v11;
  char *v12;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (!result)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v5 = result;
  v12 = a2;
  v6 = *(_QWORD *)(result + 16);
  if (!(v6 >> 62))
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain_n();
    if (v7)
      goto LABEL_4;
LABEL_10:
    swift_bridgeObjectRelease_n();
    result = swift_release();
    v11 = 1;
    a2 = v12;
LABEL_12:
    *a2 = v11;
    return result;
  }
  swift_bridgeObjectRetain_n();
  result = sub_1A0395FE0();
  v7 = result;
  if (!result)
    goto LABEL_10;
LABEL_4:
  if (v7 >= 1)
  {
    v8 = 0;
    do
    {
      if ((v6 & 0xC000000000000001) != 0)
      {
        v9 = MEMORY[0x1A1AF88A0](v8, v6);
      }
      else
      {
        v9 = *(_QWORD *)(v6 + 8 * v8 + 32);
        swift_retain();
      }
      ++v8;
      v10 = *(void (**)(_QWORD, uint64_t, _UNKNOWN **))(v9 + 72);
      swift_retain();
      v10(a1 & 1, v5, &off_1E4370F78);
      swift_release();
      swift_release();
    }
    while (v7 != v8);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1A0394394(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = a2;
  *(_QWORD *)(v3 + 16) = a3;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1A0395FE0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_BYTE *)(v3 + 40) = v4 != 0;
  return v3;
}

uint64_t sub_1A039440C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A0394430()
{
  sub_1A039440C();
  return swift_deallocClassInstance();
}

uint64_t sub_1A039444C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1A039447C@<X0>(uint64_t a1@<X8>)
{
  return sub_1A0393FFC(a1);
}

uint64_t sub_1A039449C()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 40);
}

uint64_t FeatureFlag.item.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1A0386F1C(v1 + 16, a1);
}

uint64_t FeatureFlag.__allocating_init(_:label:invertValue:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_0();
  FeatureFlag.init(_:label:invertValue:)(a1, a2, a3, a4);
  return v8;
}

void FeatureFlag.init(_:label:invertValue:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
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

  v6 = v4;
  OUTLINED_FUNCTION_6_4();
  v8 = OUTLINED_FUNCTION_0();
  *(_OWORD *)(v8 + 16) = xmmword_1A0397450;
  v9 = qword_1EE596720;
  OUTLINED_FUNCTION_13();
  if (v9 != -1)
    swift_once();
  *(_QWORD *)(v8 + 32) = qword_1EE596AA8;
  OUTLINED_FUNCTION_5_6();
  sub_1A038C7DC(0, v10, v11, v12);
  v14 = v13;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_8();
  v22 = sub_1A038C418(v15, v16, v17, v18, v19, v20, v21);
  v6[5] = v14;
  v6[6] = &protocol witness table for Item<A>;
  v6[2] = v22;
  v23 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v23 + 16) = v5;
  *(_BYTE *)(v23 + 24) = a4 & 1;
  v6[7] = sub_1A0394DC8;
  v6[8] = v23;
  v24 = OUTLINED_FUNCTION_0();
  *(_QWORD *)(v24 + 16) = v5;
  *(_BYTE *)(v24 + 24) = a4 & 1;
  v6[9] = sub_1A0394DD4;
  v6[10] = v24;
  OUTLINED_FUNCTION_13();
  swift_retain();
  OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1A0394640(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t ObjectType;
  uint64_t v9;

  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, _QWORD, _UNKNOWN **, uint64_t, uint64_t))(a2 + 8))(&v9, a3, MEMORY[0x1E0DEAFA0], &protocol witness table for Bool, ObjectType, a2);
  return (v9 ^ a4) & 1;
}

uint64_t sub_1A03946B4(char a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  char v7;
  uint64_t ObjectType;
  char v10;

  v7 = a1 ^ a5;
  ObjectType = swift_getObjectType();
  v10 = v7;
  return (*(uint64_t (**)(uint64_t, char *, _QWORD, _UNKNOWN **, uint64_t, uint64_t))(a3 + 16))(a4, &v10, MEMORY[0x1E0DEAFA0], &protocol witness table for Bool, ObjectType, a3);
}

uint64_t FeatureFlag.__allocating_init(_:label:)()
{
  uint64_t v0;

  v0 = OUTLINED_FUNCTION_0();
  FeatureFlag.init(_:label:)();
  return v0;
}

void FeatureFlag.init(_:label:)()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v0;
  OUTLINED_FUNCTION_6_4();
  v3 = OUTLINED_FUNCTION_0();
  *(_OWORD *)(v3 + 16) = xmmword_1A0397450;
  v4 = qword_1EE596720;
  OUTLINED_FUNCTION_13();
  if (v4 != -1)
    swift_once();
  *(_QWORD *)(v3 + 32) = qword_1EE596AA8;
  OUTLINED_FUNCTION_5_6();
  sub_1A0394DE0(0);
  v6 = v5;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_8();
  v14 = sub_1A038C418(v7, v8, v9, v10, v11, v12, v13);
  v2[5] = v6;
  v2[6] = &protocol witness table for Item<A>;
  v2[2] = v14;
  v2[7] = sub_1A0394E38;
  v2[8] = v1;
  v2[9] = sub_1A0394E40;
  v2[10] = v1;
  OUTLINED_FUNCTION_13();
  swift_retain();
  OUTLINED_FUNCTION_1_9();
}

uint64_t sub_1A0394864(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t ObjectType;

  ObjectType = swift_getObjectType();
  return Configurable.isEnabled(_:with:)(a3, 2, ObjectType, a2) & 1;
}

uint64_t sub_1A03948B0(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v6;
  uint64_t ObjectType;
  uint64_t (*v8)(uint64_t, char *, ValueMetadata *, unint64_t, uint64_t, uint64_t);
  unint64_t v9;
  char v11;

  if ((a1 & 1) != 0)
    v6 = 1;
  else
    v6 = 2;
  ObjectType = swift_getObjectType();
  v11 = v6;
  v8 = *(uint64_t (**)(uint64_t, char *, ValueMetadata *, unint64_t, uint64_t, uint64_t))(a3 + 16);
  v9 = sub_1A03832FC();
  return v8(a4, &v11, &type metadata for FeatureState, v9, ObjectType, a3);
}

uint64_t FeatureFlag.__allocating_init<A>(_:label:isEnabled:setEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;

  v14 = OUTLINED_FUNCTION_0();
  FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)(a1, a2, a3, a4, a5, a6, a7);
  return v14;
}

_QWORD *FeatureFlag.init<A>(_:label:isEnabled:setEnabled:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  char v23;
  char v24;
  char v25;
  uint64_t v26;

  v8 = v7;
  v13 = type metadata accessor for Item(0, *(_QWORD *)(*(_QWORD *)a1 + 88), *(_QWORD *)(*(_QWORD *)a1 + 96), a4);
  sub_1A0394D58();
  v14 = OUTLINED_FUNCTION_0();
  *(_OWORD *)(v14 + 16) = xmmword_1A0397450;
  v15 = qword_1EE596720;
  swift_retain();
  if (v15 != -1)
    swift_once();
  *(_QWORD *)(v14 + 32) = qword_1EE596AA8;
  v26 = v14;
  sub_1A0395E48();
  sub_1A038A244(&v25);
  v24 = v25;
  v23 = 0;
  v16 = Item.__allocating_init(_:label:changeBehavior:resetBehavior:actions:)(a1, a2, a3, &v24, &v23, v14);
  v8[5] = v13;
  v8[6] = &protocol witness table for Item<A>;
  v8[2] = v16;
  v17 = (_QWORD *)OUTLINED_FUNCTION_0();
  v17[2] = a4;
  v17[3] = a5;
  v17[4] = a1;
  v8[7] = sub_1A0394E74;
  v8[8] = v17;
  v18 = (_QWORD *)OUTLINED_FUNCTION_0();
  v18[2] = a1;
  v18[3] = a6;
  v18[4] = a7;
  v8[9] = sub_1A0394EAC;
  v8[10] = v18;
  swift_retain();
  OUTLINED_FUNCTION_13();
  return v8;
}

uint64_t sub_1A0394B44(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *), uint64_t a4, uint64_t *a5)
{
  uint64_t *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t ObjectType;
  uint64_t v15;

  v5 = a5;
  v8 = *a5;
  v9 = *(_QWORD *)(*a5 + 88);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *, uint64_t, _QWORD, uint64_t, uint64_t))(a2 + 8))(v5, v9, *(_QWORD *)(v8 + 96), ObjectType, a2);
  LOBYTE(v5) = a3(v12);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v5 & 1;
}

uint64_t sub_1A0394C10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, void (*a5)(uint64_t))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t ObjectType;
  uint64_t v15;
  void (*v16)(uint64_t);

  v16 = a5;
  v8 = *a4;
  v9 = *(_QWORD *)(*a4 + 88);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](a1);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  ObjectType = swift_getObjectType();
  v16(a1);
  (*(void (**)(uint64_t *, char *, uint64_t, _QWORD, uint64_t, uint64_t))(a3 + 16))(a4, v12, v9, *(_QWORD *)(v8 + 96), ObjectType, a3);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t FeatureFlag.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();
  return v0;
}

uint64_t FeatureFlag.__deallocating_deinit()
{
  FeatureFlag.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FeatureFlags.EnableAllItem()
{
  return objc_opt_self();
}

void sub_1A0394D58()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED0CCA78)
  {
    v0 = sub_1A0396004();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED0CCA78);
  }
}

uint64_t sub_1A0394DA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A0394DC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A0394640(a1, a2, *(_QWORD *)(v2 + 16), *(unsigned __int8 *)(v2 + 24));
}

uint64_t sub_1A0394DD4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1A03946B4(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_BYTE *)(v3 + 24));
}

void sub_1A0394DE0(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if (!qword_1EE596AC8)
  {
    v2 = sub_1A03832FC();
    v4 = type metadata accessor for Item(a1, (uint64_t)&type metadata for FeatureState, v2, v3);
    if (!v5)
      atomic_store(v4, (unint64_t *)&qword_1EE596AC8);
  }
}

uint64_t sub_1A0394E38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A0394864(a1, a2, v2);
}

uint64_t sub_1A0394E40(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1A03948B0(a1, a2, a3, v3);
}

uint64_t sub_1A0394E48()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A0394E74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1A0394B44(a1, a2, *(uint64_t (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(uint64_t **)(v2 + 32));
}

uint64_t sub_1A0394E80()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1A0394EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1A0394C10(a1, a2, a3, *(uint64_t **)(v3 + 16), *(void (**)(uint64_t))(v3 + 24));
}

uint64_t type metadata accessor for FeatureFlags()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeatureFlags()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureFlags.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t type metadata accessor for FeatureFlag()
{
  return objc_opt_self();
}

uint64_t method lookup function for FeatureFlag()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init(_:label:invertValue:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init(_:label:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of FeatureFlag.__allocating_init<A>(_:label:isEnabled:setEnabled:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t sub_1A0394F30()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A0394F54@<X0>(char a1@<W0>, char *a2@<X8>)
{
  return sub_1A0394228(a1, a2);
}

uint64_t ResetItem.isEnabled.getter()
{
  return 1;
}

uint64_t ResetItem.isVisible.getter()
{
  return 1;
}

uint64_t ResetItem.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

double ResetItem.cellStyle.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double result;
  uint64_t v6;

  v2 = OUTLINED_FUNCTION_0();
  swift_weakInit();
  type metadata accessor for SettingAction();
  OUTLINED_FUNCTION_0();
  SettingAction.init(_:_:)(0xD000000000000015, 0x80000001A0397C20, (uint64_t)sub_1A039520C, v2);
  v3 = sub_1A0392C1C();
  swift_release();
  sub_1A0394D58();
  v4 = OUTLINED_FUNCTION_0();
  *(_OWORD *)(v4 + 16) = xmmword_1A0397450;
  *(_QWORD *)(v4 + 32) = v3;
  v6 = v4;
  sub_1A0395E48();
  *(_QWORD *)&result = 1;
  *(_OWORD *)a1 = xmmword_1A0397530;
  *(_OWORD *)(a1 + 16) = xmmword_1A0397540;
  *(_QWORD *)(a1 + 32) = 0x80000001A0397C40;
  *(_QWORD *)(a1 + 40) = 0xD00000000000002FLL;
  *(_QWORD *)(a1 + 48) = 0x80000001A0397C60;
  *(_QWORD *)(a1 + 56) = v6;
  *(_QWORD *)(a1 + 64) = nullsub_1;
  *(_QWORD *)(a1 + 72) = 0;
  *(_BYTE *)(a1 + 80) = 9;
  return result;
}

uint64_t sub_1A03950C4()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1A03950E8()
{
  uint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = swift_bridgeObjectRetain();
    v2 = sub_1A0395214(v1);
    swift_bridgeObjectRelease();
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_1A0395FE0();
      v3 = result;
      if (result)
        goto LABEL_4;
    }
    else
    {
      v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v3)
      {
LABEL_4:
        if (v3 < 1)
        {
          __break(1u);
          return result;
        }
        for (i = 0; i != v3; ++i)
        {
          if ((v2 & 0xC000000000000001) != 0)
            MEMORY[0x1A1AF88A0](i, v2);
          else
            swift_retain();
          sub_1A0392BC0();
          swift_release();
        }
      }
    }
    swift_release();
    return swift_bridgeObjectRelease_n();
  }
  return result;
}

uint64_t sub_1A039520C()
{
  return sub_1A03950E8();
}

uint64_t sub_1A0395214(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13[2];
  uint64_t v14;
  _BYTE v15[40];
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  result = MEMORY[0x1E0DEE9D8];
  v19 = MEMORY[0x1E0DEE9D8];
  v12 = *(_QWORD *)(a1 + 16);
  if (v12)
  {
    v3 = a1 + 32;
    swift_bridgeObjectRetain();
    v4 = 0;
    v11 = v3;
    do
    {
      v5 = *(_QWORD *)(v3 + 40 * v4 + 32);
      v6 = *(_QWORD *)(v5 + 16);
      if (v6)
      {
        v7 = v5 + 32;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        do
        {
          sub_1A0386F1C(v7, (uint64_t)v15);
          sub_1A0384B38(0, (unint64_t *)&qword_1EE596758);
          sub_1A0384B38(0, &qword_1EE596780);
          if (swift_dynamicCast())
          {
            sub_1A0384B84(v13, (uint64_t)v16);
            v8 = v17;
            v9 = v18;
            __swift_project_boxed_opaque_existential_1(v16, v17);
            v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
            sub_1A038C194(v10);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
          }
          else
          {
            v14 = 0;
            memset(v13, 0, sizeof(v13));
            sub_1A038D700((uint64_t)v13);
          }
          v7 += 40;
          --v6;
        }
        while (v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        v3 = v11;
      }
      ++v4;
    }
    while (v4 != v12);
    swift_bridgeObjectRelease();
    return v19;
  }
  return result;
}

uint64_t ResetItem.__allocating_init(layout:)(uint64_t a1)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0();
  *(_WORD *)(result + 16) = 257;
  *(_QWORD *)(result + 24) = 0xD000000000000012;
  *(_QWORD *)(result + 32) = 0x80000001A0397C40;
  *(_QWORD *)(result + 40) = a1;
  return result;
}

uint64_t ResetItem.init(layout:)(uint64_t a1)
{
  uint64_t v1;

  *(_WORD *)(v1 + 16) = 257;
  *(_QWORD *)(v1 + 24) = 0xD000000000000012;
  *(_QWORD *)(v1 + 32) = 0x80000001A0397C40;
  *(_QWORD *)(v1 + 40) = a1;
  return v1;
}

uint64_t ResetItem.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ResetItem.__deallocating_deinit()
{
  ResetItem.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1A03954A8()
{
  return ResetItem.label.getter();
}

double sub_1A03954C8@<D0>(uint64_t a1@<X8>)
{
  return ResetItem.cellStyle.getter(a1);
}

uint64_t type metadata accessor for ResetItem()
{
  return objc_opt_self();
}

uint64_t method lookup function for ResetItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ResetItem.__allocating_init(layout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

unint64_t sub_1A039551C(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void (*sub_1A0395540(uint64_t **a1, unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t *v6;

  v6 = (uint64_t *)malloc(0x28uLL);
  *a1 = v6;
  v6[4] = (uint64_t)sub_1A03955C0(v6, a2, a3);
  return sub_1A0395594;
}

void sub_1A0395594(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1A03955C0(uint64_t *a1, unint64_t a2, uint64_t a3))()
{
  unint64_t v6;
  uint64_t v7;

  v6 = a3 & 0xC000000000000001;
  sub_1A039551C(a2, (a3 & 0xC000000000000001) == 0, a3);
  if (v6)
    v7 = MEMORY[0x1A1AF88A0](a2, a3);
  else
    v7 = swift_retain();
  *a1 = v7;
  return sub_1A039562C;
}

uint64_t sub_1A039562C()
{
  return swift_release();
}

uint64_t Presets.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Presets.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Presets()
{
  return objc_opt_self();
}

uint64_t method lookup function for Presets()
{
  return swift_lookUpClassMethod();
}

BOOL static DataType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DataType.hash(into:)()
{
  return sub_1A039604C();
}

uint64_t DataType.hashValue.getter()
{
  sub_1A0396040();
  sub_1A039604C();
  return sub_1A0396058();
}

unint64_t sub_1A0395708()
{
  unint64_t result;

  result = qword_1EE596AD0;
  if (!qword_1EE596AD0)
  {
    result = MEMORY[0x1A1AF8C30](&protocol conformance descriptor for DataType, &type metadata for DataType);
    atomic_store(result, (unint64_t *)&qword_1EE596AD0);
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

uint64_t storeEnumTagSinglePayload for DataType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1A0395818 + 4 * byte_1A03975D5[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_1A039584C + 4 * byte_1A03975D0[v4]))();
}

uint64_t sub_1A039584C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A0395854(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1A039585CLL);
  return result;
}

uint64_t sub_1A0395868(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1A0395870);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_1A0395874(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1A039587C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DataType()
{
  return &type metadata for DataType;
}

uint64_t ConditionalItem.label.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_12();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v1);
}

uint64_t ConditionalItem.cellStyle.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[3];
  v2 = v0[4];
  __swift_project_boxed_opaque_existential_1(v0, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 16))(v1, v2);
}

uint64_t ConditionalItem.isEnabled.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_12();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 24))(v0, v1) & 1;
}

uint64_t ConditionalItem.isVisible.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))() & 1;
}

uint64_t destroy for ConditionalItem(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return swift_release();
}

uint64_t initializeWithCopy for ConditionalItem(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for ConditionalItem(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_1(a1, a2);
  v4 = a2[6];
  a1[5] = a2[5];
  a1[6] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for ConditionalItem(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ConditionalItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 56))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
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

uint64_t storeEnumTagSinglePayload for ConditionalItem(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConditionalItem()
{
  return &type metadata for ConditionalItem;
}

uint64_t destroy for Domain()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Domain(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for Domain(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Domain(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for Domain(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_1A0395C44(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_1A0395C5C()
{
  return MEMORY[0x1E0CAFDD8]();
}

uint64_t sub_1A0395C68()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1A0395C74()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1A0395C80()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1A0395C8C()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1A0395C98()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_1A0395CA4()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1A0395CB0()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1A0395CBC()
{
  return MEMORY[0x1E0DB3090]();
}

uint64_t sub_1A0395CC8()
{
  return MEMORY[0x1E0DB3AB0]();
}

uint64_t sub_1A0395CD4()
{
  return MEMORY[0x1E0DB3AC0]();
}

uint64_t sub_1A0395CE0()
{
  return MEMORY[0x1E0DB3AC8]();
}

uint64_t sub_1A0395CEC()
{
  return MEMORY[0x1E0DB4C58]();
}

uint64_t sub_1A0395CF8()
{
  return MEMORY[0x1E0DB4D08]();
}

uint64_t sub_1A0395D04()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1A0395D10()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1A0395D1C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1A0395D28()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1A0395D34()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1A0395D40()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1A0395D4C()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1A0395D58()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1A0395D64()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1A0395D70()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1A0395D7C()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1A0395D88()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1A0395D94()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1A0395DA0()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1A0395DAC()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1A0395DB8()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1A0395DC4()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1A0395DD0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1A0395DDC()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1A0395DE8()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1A0395DF4()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1A0395E00()
{
  return MEMORY[0x1E0DEAB00]();
}

uint64_t sub_1A0395E0C()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1A0395E18()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1A0395E24()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1A0395E30()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1A0395E3C()
{
  return MEMORY[0x1E0DEADA8]();
}

uint64_t sub_1A0395E48()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1A0395E54()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1A0395E60()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1A0395E6C()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1A0395E78()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1A0395E84()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1A0395E90()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1A0395E9C()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1A0395EA8()
{
  return MEMORY[0x1E0DEAEA8]();
}

uint64_t sub_1A0395EB4()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1A0395EC0()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1A0395ECC()
{
  return MEMORY[0x1E0DEB560]();
}

uint64_t sub_1A0395ED8()
{
  return MEMORY[0x1E0DEB5B0]();
}

uint64_t sub_1A0395EE4()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1A0395EF0()
{
  return MEMORY[0x1E0DB5358]();
}

uint64_t sub_1A0395EFC()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1A0395F08()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1A0395F14()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1A0395F20()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1A0395F2C()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1A0395F38()
{
  return MEMORY[0x1E0DEC130]();
}

uint64_t sub_1A0395F44()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1A0395F50()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1A0395F5C()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1A0395F68()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1A0395F74()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1A0395F80()
{
  return MEMORY[0x1E0DEC680]();
}

uint64_t sub_1A0395F8C()
{
  return MEMORY[0x1E0DEC6E0]();
}

uint64_t sub_1A0395F98()
{
  return MEMORY[0x1E0DEC700]();
}

uint64_t sub_1A0395FA4()
{
  return MEMORY[0x1E0DEC708]();
}

uint64_t sub_1A0395FB0()
{
  return MEMORY[0x1E0DEC888]();
}

uint64_t sub_1A0395FBC()
{
  return MEMORY[0x1E0DEC8D8]();
}

uint64_t sub_1A0395FC8()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1A0395FD4()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1A0395FE0()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1A0395FEC()
{
  return MEMORY[0x1E0DECD90]();
}

uint64_t sub_1A0395FF8()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1A0396004()
{
  return MEMORY[0x1E0DED1E8]();
}

uint64_t sub_1A0396010()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1A039601C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1A0396028()
{
  return MEMORY[0x1E0DED9F8]();
}

uint64_t sub_1A0396034()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1A0396040()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1A039604C()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1A0396058()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1A0396064()
{
  return MEMORY[0x1E0DEDF80]();
}

uint64_t sub_1A0396070()
{
  return MEMORY[0x1E0DEDFF8]();
}

uint64_t sub_1A039607C()
{
  return MEMORY[0x1E0DEE000]();
}

uint64_t sub_1A0396088()
{
  return MEMORY[0x1E0DEE978]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x1E0DEEC60]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x1E0DEEC98]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
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

