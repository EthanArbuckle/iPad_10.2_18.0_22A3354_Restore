uint64_t ClientLibEvent.__allocating_init(withClientEventName:andSink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];

  swift_allocObject();
  v4 = (uint64_t *)sub_21C512378();
  v6 = *v4;
  v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_21C512768();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C5014B0(a3, (uint64_t)v9);
  v7 = sub_21C512318();
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v7;
}

uint64_t ClientLibEvent.init(withClientEventName:andSink:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];

  v4 = (uint64_t *)sub_21C512378();
  v6 = *v4;
  v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_21C512768();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C5014B0(a3, (uint64_t)v9);
  v7 = sub_21C512318();
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v7;
}

uint64_t static ClientLibEvent.toFullEventName(_:)()
{
  uint64_t v1;

  v1 = *(_QWORD *)sub_21C512378();
  swift_bridgeObjectRetain();
  sub_21C512768();
  sub_21C512768();
  return v1;
}

uint64_t sub_21C5014B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

void ClientLibEvent.__allocating_init(withName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void ClientLibEvent.init(withName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ClientLibEvent.__deallocating_deinit()
{
  _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClientLibEvent()
{
  return objc_opt_self();
}

uint64_t sub_21C5015AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v0 = sub_21C512360();
  swift_allocObject();
  v1 = sub_21C512354();
  v5 = v0;
  v6 = MEMORY[0x24BEC78C8];
  *(_QWORD *)&v4 = v1;
  type metadata accessor for ClientLibEvents();
  v2 = swift_allocObject();
  result = sub_21C501668(&v4, v2 + 16);
  qword_2540B2638 = v2;
  return result;
}

uint64_t sub_21C501624()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClientLibEvents()
{
  return objc_opt_self();
}

uint64_t sub_21C501668(__int128 *a1, uint64_t a2)
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

id sub_21C5018F0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DelayedOffer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C501934()
{
  return type metadata accessor for DelayedOffer();
}

uint64_t type metadata accessor for DelayedOffer()
{
  uint64_t result;

  result = qword_255284488;
  if (!qword_255284488)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C501978()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C512588();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_21C5019E4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21C512588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C501A28(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21C512588();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t FailsafeClientLibEvent.__allocating_init(withSink:failsafeEvent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  return FailsafeClientLibEvent.init(withSink:failsafeEvent:)(a1, a2, a3);
}

uint64_t FailsafeClientLibEvent.init(withSink:failsafeEvent:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, unint64_t, uint64_t, uint64_t);
  _QWORD v12[5];
  _BYTE v13[40];

  sub_21C5014B0(a1, (uint64_t)v13);
  v6 = (uint64_t *)sub_21C512378();
  v8 = *v6;
  v7 = v6[1];
  v12[0] = v8;
  v12[1] = v7;
  swift_bridgeObjectRetain();
  sub_21C512768();
  sub_21C512768();
  sub_21C5014B0((uint64_t)v13, (uint64_t)v12);
  v9 = sub_21C512318();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  v10 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)v9 + 192);
  swift_retain();
  v10(0x656661736C696166, 0xED0000746E657645, a2, a3);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v9;
}

void FailsafeClientLibEvent.__allocating_init(withClientEventName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void FailsafeClientLibEvent.init(withClientEventName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t FailsafeClientLibEvent.__deallocating_deinit()
{
  _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FailsafeClientLibEvent()
{
  return objc_opt_self();
}

unint64_t sub_21C501D28()
{
  void *v0;
  id v1;
  id v2;

  sub_21C512810();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend(v0, sel_newOfferResponse);
  v2 = objc_msgSend(v1, sel_description);
  sub_21C512720();

  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  return 0xD000000000000027;
}

id sub_21C501E68()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FailsafeDelayedOffer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FailsafeDelayedOffer()
{
  return objc_opt_self();
}

unint64_t sub_21C501EB8()
{
  uint64_t inited;
  uint64_t v1;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2718);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C513160;
  v1 = MEMORY[0x24BEE0D00];
  sub_21C512804();
  *(_QWORD *)(inited + 96) = v1;
  strcpy((char *)(inited + 72), "iCloudStorage");
  *(_WORD *)(inited + 86) = -4864;
  result = sub_21C506928(inited);
  qword_255284998 = result;
  return result;
}

unint64_t sub_21C502058()
{
  void *v0;
  id v1;

  sub_21C512810();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend(v0, sel_toContext);
  sub_21C5126F0();

  sub_21C5126FC();
  sub_21C512768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C512768();
  return 0xD000000000000022;
}

id sub_21C50220C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FailsafeNewOfferResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for FailsafeNewOfferResponse()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22077DF44]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t MethodCallClientLibEvent.__allocating_init(withMethod:andSink:)(char a1, uint64_t a2)
{
  swift_allocObject();
  return MethodCallClientLibEvent.init(withMethod:andSink:)(a1, a2);
}

uint64_t MethodCallClientLibEvent.MethodName.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21C502328
                                                                     + 4 * asc_21C513190[a1]))(0xD000000000000016, 0x800000021C513800);
}

uint64_t sub_21C502328()
{
  uint64_t v0;

  return v0 + 4;
}

void sub_21C5023B0(char *a1)
{
  sub_21C5023BC(*a1);
}

void sub_21C5023BC(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_21C502408(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_21C5024B0 + 4 * byte_21C5131A0[a2]))(v2 + 4);
}

uint64_t sub_21C5024B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 4 && v2 == 0x800000021C513820)
    v3 = 1;
  else
    v3 = sub_21C512870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_21C502588()
{
  char *v0;

  sub_21C502688(0, *v0);
}

void sub_21C502594(uint64_t a1)
{
  char *v1;

  sub_21C50259C(a1, *v1);
}

void sub_21C50259C(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21C5025E4()
{
  sub_21C512750();
  return swift_bridgeObjectRelease();
}

void sub_21C502680(uint64_t a1)
{
  char *v1;

  sub_21C502688(a1, *v1);
}

void sub_21C502688(uint64_t a1, char a2)
{
  sub_21C5128B8();
  __asm { BR              X10 }
}

uint64_t sub_21C5026E0()
{
  sub_21C512750();
  swift_bridgeObjectRelease();
  return sub_21C5128D0();
}

uint64_t sub_21C502794@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s33iCloudSubscriptionOptimizerClient010MethodCallD8LibEventC0E4NameO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21C5027C0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = MethodCallClientLibEvent.MethodName.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

BOOL static MethodCallClientLibEvent.MethodState.__derived_enum_equals(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t MethodCallClientLibEvent.MethodState.hash(into:)()
{
  return sub_21C5128C4();
}

uint64_t MethodCallClientLibEvent.MethodState.hashValue.getter()
{
  sub_21C5128B8();
  sub_21C5128C4();
  return sub_21C5128D0();
}

BOOL sub_21C502860(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_21C502878()
{
  sub_21C5128B8();
  sub_21C5128C4();
  return sub_21C5128D0();
}

uint64_t sub_21C5028BC()
{
  return sub_21C5128C4();
}

uint64_t sub_21C5028E4()
{
  sub_21C5128B8();
  sub_21C5128C4();
  return sub_21C5128D0();
}

uint64_t MethodCallClientLibEvent.init(withMethod:andSink:)(char a1, uint64_t a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  unint64_t v11;

  sub_21C5014B0(a2, (uint64_t)&v10);
  v4 = (uint64_t *)sub_21C512378();
  v6 = *v4;
  v5 = v4[1];
  v9[0] = v6;
  v9[1] = v5;
  swift_bridgeObjectRetain();
  sub_21C512768();
  sub_21C512768();
  sub_21C5014B0((uint64_t)&v10, (uint64_t)v9);
  v7 = sub_21C512318();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v10);
  v10 = 0;
  v11 = 0xE000000000000000;
  LOBYTE(v9[0]) = a1;
  swift_retain();
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v7 + 192))(0x646F6874656DLL, 0xE600000000000000, v10, v11);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(a2);
  return v7;
}

uint64_t MethodCallClientLibEvent.add(state:)(char a1)
{
  uint64_t v1;
  __int128 v3;

  BYTE8(v3) = 0;
  *(_QWORD *)&v3 = a1 & 1;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, _QWORD, unint64_t))(*(_QWORD *)v1 + 192))(0x6574617473, 0xE500000000000000, *(_QWORD *)((char *)&v3 + 1), 0xE000000000000000);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(duration:)()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v0 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v1);
  swift_release();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(wasSuccessful:)(uint64_t a1)
{
  return sub_21C502B8C(a1, 0x6563637553736177, 0xED00006C75667373);
}

uint64_t MethodCallClientLibEvent.add(isFailsafe:)(uint64_t a1)
{
  return sub_21C502B8C(a1, 0x61736C6961467369, 0xEA00000000006566);
}

uint64_t sub_21C502B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v3 + 184))(a2, a3, a1);
  swift_release();
  return swift_retain();
}

uint64_t MethodCallClientLibEvent.add(litmusInfo:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v5)(uint64_t, unint64_t, uint64_t, uint64_t);

  v5 = *(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(*(_QWORD *)v2 + 192);
  swift_bridgeObjectRetain();
  v5(0x6E4973756D74696CLL, 0xEA00000000006F66, a1, a2);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_retain();
}

void MethodCallClientLibEvent.__allocating_init(withClientEventName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void MethodCallClientLibEvent.init(withClientEventName:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t MethodCallClientLibEvent.__deallocating_deinit()
{
  _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return swift_deallocClassInstance();
}

uint64_t _s33iCloudSubscriptionOptimizerClient010MethodCallD8LibEventC0E4NameO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21C512858();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

unint64_t sub_21C502CF0()
{
  unint64_t result;

  result = qword_2552845C0;
  if (!qword_2552845C0)
  {
    result = MEMORY[0x22077DF50](&protocol conformance descriptor for MethodCallClientLibEvent.MethodName, &type metadata for MethodCallClientLibEvent.MethodName);
    atomic_store(result, (unint64_t *)&qword_2552845C0);
  }
  return result;
}

unint64_t sub_21C502D38()
{
  unint64_t result;

  result = qword_2552845C8;
  if (!qword_2552845C8)
  {
    result = MEMORY[0x22077DF50](&protocol conformance descriptor for MethodCallClientLibEvent.MethodState, &type metadata for MethodCallClientLibEvent.MethodState);
    atomic_store(result, (unint64_t *)&qword_2552845C8);
  }
  return result;
}

uint64_t type metadata accessor for MethodCallClientLibEvent()
{
  return objc_opt_self();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MethodCallClientLibEvent.MethodName(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MethodCallClientLibEvent.MethodName(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C502E88 + 4 * byte_21C5131BD[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_21C502EBC + 4 * byte_21C5131B8[v4]))();
}

uint64_t sub_21C502EBC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C502EC4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C502ECCLL);
  return result;
}

uint64_t sub_21C502ED8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C502EE0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_21C502EE4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C502EEC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C502EF8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21C502F00(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MethodCallClientLibEvent.MethodName()
{
  return &type metadata for MethodCallClientLibEvent.MethodName;
}

uint64_t getEnumTagSinglePayload for MethodCallClientLibEvent.MethodState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MethodCallClientLibEvent.MethodState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21C502FF4 + 4 * byte_21C5131C7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21C503028 + 4 * byte_21C5131C2[v4]))();
}

uint64_t sub_21C503028(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C503030(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21C503038);
  return result;
}

uint64_t sub_21C503044(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21C50304CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21C503050(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21C503058(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_21C503064(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MethodCallClientLibEvent.MethodState()
{
  return &type metadata for MethodCallClientLibEvent.MethodState;
}

uint64_t sub_21C503080(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, uint64_t, unint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, unint64_t, uint64_t, unint64_t);
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t aBlock;
  unint64_t v27;
  uint64_t (*v28)();
  void *v29;
  uint64_t (*v30)(void *);
  _QWORD *v31;
  _BYTE v32[40];

  v24 = a2;
  v25 = a3;
  v5 = 0xED0000454C42414CLL;
  v6 = 0x494156415F544F4ELL;
  sub_21C5122D0();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NotificationContent();
  if (swift_dynamicCastClass())
  {
    v9 = a1;
    if ((sub_21C51248C() & 1) != 0)
    {
      sub_21C512474();
      v6 = sub_21C5122C4();
      v5 = v10;

      sub_21C5053CC((uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7698]);
    }
    else
    {

    }
  }
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v11, (uint64_t)&aBlock);
  type metadata accessor for NewOfferClientLibEvent();
  v23 = v3;
  swift_allocObject();
  sub_21C5014B0((uint64_t)&aBlock, (uint64_t)v32);
  v12 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  aBlock = 0;
  v27 = 0xE000000000000000;
  v32[0] = 0;
  sub_21C512828();
  v13 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v12 + 192);
  v13(0x6574617473, 0xE500000000000000, aBlock, v27);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v13(0x6E4973756D74696CLL, 0xEA00000000006F66, v6, v5);
  swift_release();
  v14 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v12 + 200))(v14);
  swift_release();
  sub_21C5126CC();
  v15 = sub_21C5126C0();
  sub_21C5014B0(v11, (uint64_t)&aBlock);
  swift_allocObject();
  sub_21C5014B0((uint64_t)&aBlock, (uint64_t)v32);
  v16 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&aBlock);
  v17 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v16 + 192);
  swift_bridgeObjectRetain();
  v17(0x6E4973756D74696CLL, 0xEA00000000006F66, v6, v5);
  swift_release();
  swift_retain();
  swift_bridgeObjectRelease_n();
  aBlock = 0;
  v27 = 0xE000000000000000;
  v32[0] = 1;
  sub_21C512828();
  v17(0x6574617473, 0xE500000000000000, aBlock, v27);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v18 = *(void **)(v23 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = v16;
  v19[3] = v15;
  v20 = v25;
  v19[4] = v24;
  v19[5] = v20;
  v30 = sub_21C5052F4;
  v31 = v19;
  aBlock = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = sub_21C503700;
  v29 = &block_descriptor_21;
  v21 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_newOffer_andCallback_, a1, v21);
  _Block_release(v21);
  swift_release();
  return swift_release();
}

uint64_t sub_21C503470(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  id v17;
  id v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21C512588();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NewOfferResponse();
  v13 = swift_dynamicCastClass();
  if (v13)
  {
    sub_21C505300(v13 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    {
      sub_21C505348((uint64_t)v8);
    }
    else
    {
      sub_21C505388((uint64_t)v8, (uint64_t)v12);
      v14 = sub_21C512570();
      v16 = v15;
      v17 = a1;
      sub_21C5053CC((uint64_t)v12, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
      v24 = 0;
      v25 = 0xE000000000000000;
      v22 = v14;
      v23 = v16 & 1;
      sub_21C512828();
      sub_21C5122E8();

      swift_release();
      swift_bridgeObjectRelease();
    }
  }
  v18 = objc_msgSend(a1, sel_error);
  if (v18)

  sub_21C5122F4();
  swift_release();
  v19 = *(void (**)(uint64_t))(*(_QWORD *)a3 + 96);
  v20 = swift_retain();
  v19(v20);
  sub_21C5126D8();
  sub_21C512300();
  swift_release();
  sub_21C51230C();
  swift_release();
  return a4(a1);
}

uint64_t sub_21C503784(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t aBlock;
  unint64_t v16;
  uint64_t (*v17)();
  void *v18;
  uint64_t (*v19)(void *);
  _QWORD *v20;
  char v21;

  v3 = v2;
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&aBlock);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(1, (uint64_t)&aBlock);
  aBlock = 0;
  v16 = 0xE000000000000000;
  v21 = 0;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&aBlock);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(1, (uint64_t)&aBlock);
  aBlock = 0;
  v16 = 0xE000000000000000;
  v21 = 1;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = *(void **)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = a1;
  v11[5] = a2;
  v19 = sub_21C5052A8;
  v20 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = sub_21C503700;
  v18 = &block_descriptor_12;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_isNotificationPending_, v12);
  _Block_release(v12);
  swift_release();
  return swift_release();
}

uint64_t sub_21C5039F0(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void *))
{
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;

  (*(void (**)(void))(*(_QWORD *)a3 + 96))();
  v7 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)a2 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v7);
  swift_release();
  swift_retain();
  v8 = objc_msgSend(a1, sel_error);
  v9 = v8;
  if (v8)

  (*(void (**)(uint64_t, unint64_t, BOOL))(*(_QWORD *)a2 + 184))(0x6563637553736177, 0xED00006C75667373, v9 == 0);
  v10 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 200))(v10);
  swift_release();
  return a4(a1);
}

void sub_21C503B04(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_21C503B70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t aBlock;
  unint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  uint64_t (*v19)(uint64_t);
  _QWORD *v20;
  char v21;

  v3 = v2;
  v5 = *(_QWORD *)(v2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&aBlock);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(0, (uint64_t)&aBlock);
  aBlock = 0;
  v16 = 0xE000000000000000;
  v21 = 0;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&aBlock);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(0, (uint64_t)&aBlock);
  aBlock = 0;
  v16 = 0xE000000000000000;
  v21 = 1;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, aBlock, v16);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = *(void **)(v3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v9;
  v11[3] = v8;
  v11[4] = a1;
  v11[5] = a2;
  v19 = sub_21C505278;
  v20 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v16 = 1107296256;
  v17 = sub_21C503ED0;
  v18 = &block_descriptor;
  v12 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_clearNotificationState_, v12);
  _Block_release(v12);
  swift_release();
  return swift_release();
}

uint64_t sub_21C503DDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  void (*v8)(uint64_t, unint64_t, BOOL);
  uint64_t v9;

  (*(void (**)(void))(*(_QWORD *)a3 + 96))();
  v7 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)a2 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v7);
  swift_release();
  v8 = *(void (**)(uint64_t, unint64_t, BOOL))(*(_QWORD *)a2 + 184);
  swift_retain();
  v8(0x6563637553736177, 0xED00006C75667373, a1 == 0);
  v9 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 200))(v9);
  swift_release();
  return a4(a1);
}

void sub_21C503ED0(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_21C503F40(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

uint64_t sub_21C5040A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  void (*v15)(uint64_t, unint64_t, uint64_t, unint64_t);
  uint64_t result;
  uint64_t v17;

  v6 = 0xED0000454C42414CLL;
  v7 = 0x494156415F544F4ELL;
  sub_21C5122D0();
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (void *)sub_21C5126E4();
  v12 = objc_msgSend(v10, sel_parseNotification_, v11);

  if (v12)
  {
    type metadata accessor for NotificationContent();
    if (swift_dynamicCastClass())
    {
      v13 = v12;
      if ((sub_21C51248C() & 1) != 0)
      {
        sub_21C512474();
        v7 = sub_21C5122C4();
        v6 = v14;

        sub_21C5053CC((uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7698]);
      }
      else
      {

      }
    }
  }
  v15 = *(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)a1 + 192);
  swift_bridgeObjectRetain();
  v15(0x6E4973756D74696CLL, 0xEA00000000006F66, v7, v6);
  swift_release();
  result = swift_bridgeObjectRelease_n();
  *a3 = v12;
  return result;
}

uint64_t sub_21C5043B0(char a1, uint64_t a2, void *a3)
{
  uint64_t v4;

  v4 = sub_21C504A74(a1, a2, (uint64_t)a3);

  swift_bridgeObjectRelease();
  return v4;
}

id sub_21C50441C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MetricsQuotaClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MetricsQuotaClient()
{
  return objc_opt_self();
}

id sub_21C5044A4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void (*v14)(uint64_t, unint64_t, BOOL);
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&v17);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&v17);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (void *)sub_21C5126E4();
  v12 = objc_msgSend(v10, sel_parseDelayedOffer_, v11);

  (*(void (**)(void))(*(_QWORD *)v8 + 96))();
  v13 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v13);
  swift_release();
  v14 = *(void (**)(uint64_t, unint64_t, BOOL))(*(_QWORD *)v9 + 184);
  swift_retain();
  v14(0x6563637553736177, 0xED00006C75667373, v12 != 0);
  v15 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v15);
  swift_release_n();
  swift_release();
  return v12;
}

id sub_21C50476C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void (*v15)(uint64_t, unint64_t, BOOL);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  unint64_t v21;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&v20);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v20);
  v20 = 0;
  v21 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, v20, v21);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&v20);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v20);
  v20 = 0;
  v21 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, v20, v21);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (void *)sub_21C512714();
  v12 = objc_msgSend(v10, sel_parseDelayedOfferFromJson_, v11);

  if (v12)
  {
    type metadata accessor for FailsafeDelayedOffer();
    v13 = (void *)swift_dynamicCastClass();
    if (v13)
      v14 = v12;
  }
  else
  {
    v13 = 0;
  }

  v15 = *(void (**)(uint64_t, unint64_t, BOOL))(*(_QWORD *)v9 + 184);
  v15(0x61736C6961467369, 0xEA00000000006566, v13 != 0);
  v16 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 96))(v16);
  v17 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v17);
  swift_release();
  swift_retain();
  v15(0x6563637553736177, 0xED00006C75667373, v12 != 0);
  v18 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v18);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_21C504A74(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  void (*v14)(uint64_t, unint64_t, _BOOL8);
  uint64_t v15;
  uint64_t v17;
  unint64_t v18;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&v17);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&v17);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v17);
  v17 = 0;
  v18 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, v17, v18);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = sub_21C5040A4(v9, a3, &v17);
  (*(void (**)(uint64_t))(*(_QWORD *)v8 + 96))(v10);
  v11 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v11);
  swift_release();
  v12 = v17;
  v13 = v17 != 0;
  v14 = *(void (**)(uint64_t, unint64_t, _BOOL8))(*(_QWORD *)v9 + 184);
  swift_retain();
  v14(0x6563637553736177, 0xED00006C75667373, v13);
  v15 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v15);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_21C504CFC(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, unint64_t, BOOL);
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&v19);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v19);
  v19 = 0;
  v20 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, v19, v20);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&v19);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v19);
  v19 = 0;
  v20 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, v19, v20);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(*(id *)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient), sel_failsafeDelayedOfferJsonContext);
  if (v10)
  {
    v11 = v10;
    v12 = sub_21C512720();
    v14 = v13;

  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)v8 + 96))();
  v15 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v15);
  swift_release();
  v16 = *(void (**)(uint64_t, unint64_t, BOOL))(*(_QWORD *)v9 + 184);
  swift_retain();
  v16(0x6563637553736177, 0xED00006C75667373, v14 != 0);
  v17 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v17);
  swift_release_n();
  swift_release();
  return v12;
}

uint64_t sub_21C504FB0(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void (*v13)(uint64_t, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;

  v5 = *(_QWORD *)(a2 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents) + 16;
  sub_21C5014B0(v5, (uint64_t)&v16);
  type metadata accessor for MethodCallClientLibEvent();
  swift_allocObject();
  v6 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v16);
  v16 = 0;
  v17 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v6 + 192))(0x6574617473, 0xE500000000000000, v16, v17);
  swift_release();
  v7 = swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)v6 + 200))(v7);
  swift_release();
  sub_21C5126CC();
  v8 = sub_21C5126C0();
  sub_21C5014B0(v5, (uint64_t)&v16);
  swift_allocObject();
  v9 = MethodCallClientLibEvent.init(withMethod:andSink:)(a1, (uint64_t)&v16);
  v16 = 0;
  v17 = 0xE000000000000000;
  sub_21C512828();
  (*(void (**)(uint64_t, unint64_t, uint64_t, unint64_t))(*(_QWORD *)v9 + 192))(0x6574617473, 0xE500000000000000, v16, v17);
  swift_release();
  swift_bridgeObjectRelease();
  v10 = *(void **)(a3 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient);
  v11 = (void *)sub_21C512714();
  objc_msgSend(v10, sel_logFailsafeEvent_, v11);

  (*(void (**)(void))(*(_QWORD *)v8 + 96))();
  v12 = sub_21C5126D8();
  (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 168))(0x6E6F697461727564, 0xEE0073696C6C694DLL, v12);
  swift_release();
  v13 = *(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)v9 + 184);
  swift_retain();
  v13(0x6563637553736177, 0xED00006C75667373, 1);
  v14 = swift_release();
  (*(void (**)(uint64_t))(*(_QWORD *)v9 + 200))(v14);
  swift_release_n();
  swift_release();
  return 42;
}

uint64_t sub_21C505248()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_21C50526C(uint64_t a1)
{
  uint64_t v1;

  sub_21C50FAE8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C505278(uint64_t a1)
{
  uint64_t v1;

  return sub_21C503DDC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(uint64_t))(v1 + 32));
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

uint64_t sub_21C50529C(uint64_t a1)
{
  uint64_t v1;

  return sub_21C512174(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C5052A8(void *a1)
{
  uint64_t v1;

  return sub_21C5039F0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 32));
}

uint64_t sub_21C5052B4(uint64_t a1)
{
  uint64_t v1;

  return sub_21C50FAD4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroy_2Tm()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C5052F4(void *a1)
{
  uint64_t v1;

  return sub_21C503470(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(uint64_t (**)(void *))(v1 + 32));
}

uint64_t sub_21C505300(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C505348(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C505388(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21C512588();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C5053CC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t NewOfferClientLibEvent.__allocating_init(withSink:)(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[40];

  swift_allocObject();
  sub_21C5014B0(a1, (uint64_t)v4);
  v2 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t NewOfferClientLibEvent.init(withSink:)(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[40];

  sub_21C5014B0(a1, (uint64_t)v4);
  v2 = MethodCallClientLibEvent.init(withMethod:andSink:)(2, (uint64_t)v4);
  __swift_destroy_boxed_opaque_existential_1(a1);
  return v2;
}

uint64_t NewOfferClientLibEvent.add(responseAction:)()
{
  sub_21C512828();
  sub_21C5122E8();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_retain();
}

void NewOfferClientLibEvent.__allocating_init(withMethod:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void NewOfferClientLibEvent.init(withMethod:andSink:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t NewOfferClientLibEvent.__deallocating_deinit()
{
  _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for NewOfferClientLibEvent()
{
  return objc_opt_self();
}

unint64_t sub_21C5055F8()
{
  unint64_t result;

  result = sub_21C506928(MEMORY[0x24BEE4AF8]);
  qword_255284748 = result;
  return result;
}

uint64_t sub_21C50561C()
{
  uint64_t v0;

  v0 = sub_21C512468();
  MEMORY[0x24BDAC7A8](v0);
  sub_21C512408();
  sub_21C51257C();
  sub_21C512534();
  sub_21C5123F0();
  sub_21C51254C();
  sub_21C5123FC();
  return sub_21C512564();
}

uint64_t sub_21C5056D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t refreshed;
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21C512588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C505300(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_21C505348((uint64_t)v3);
    if (qword_255284328 != -1)
      swift_once();
    refreshed = qword_255284748;
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_21C505388((uint64_t)v3, (uint64_t)v7);
    refreshed = _s33iCloudSubscriptionOptimizerClient19QuotaServerProtocolV02toF14RefreshDetailsySDys11AnyHashableVypG01iabC4Core0iJ7ContextVFZ_0((uint64_t)v7);
    sub_21C501A28((uint64_t)v7);
  }
  return refreshed;
}

unint64_t sub_21C505908()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  uint64_t v8;
  id v9;
  unint64_t v10;
  unint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = 0;
  v11 = 0xE000000000000000;
  sub_21C512810();
  swift_bridgeObjectRelease();
  v10 = 0xD00000000000001ALL;
  v11 = 0x800000021C513F70;
  sub_21C505300(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  sub_21C51272C();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  v5 = v10;
  v4 = v11;
  v10 = 0x5B3D726F727265;
  v11 = 0xE700000000000000;
  v9 = *(id *)(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError);
  v6 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552847A0);
  sub_21C51272C();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  v10 = v5;
  v11 = v4;
  swift_bridgeObjectRetain();
  sub_21C512768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21C505AF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  _BOOL8 v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2552845E0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21C512588();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v16 - v9;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError))
    return 1;
  sub_21C505300(v0 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_21C505348((uint64_t)v3);
    return 1;
  }
  sub_21C505388((uint64_t)v3, (uint64_t)v10);
  sub_21C512570();
  v13 = sub_21C51236C();
  v11 = 1;
  v14 = sub_21C51236C();
  sub_21C5019E4((uint64_t)v10, (uint64_t)v8);
  if (v13 != v14)
  {
    sub_21C512570();
    v15 = sub_21C51236C();
    v11 = v15 == sub_21C51236C();
  }
  sub_21C501A28((uint64_t)v8);
  sub_21C501A28((uint64_t)v10);
  return v11;
}

id sub_21C505CDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NewOfferResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C505D48()
{
  return type metadata accessor for NewOfferResponse();
}

uint64_t type metadata accessor for NewOfferResponse()
{
  uint64_t result;

  result = qword_255284788;
  if (!qword_255284788)
    return swift_getSingletonMetadata();
  return result;
}

void sub_21C505D8C()
{
  unint64_t v0;

  sub_21C505E00();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_21C505E00()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255284798)
  {
    sub_21C512588();
    v0 = sub_21C5127D4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255284798);
  }
}

uint64_t sub_21C505EB0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_21C512468();
  MEMORY[0x24BDAC7A8](v0);
  v1 = sub_21C5122D0();
  MEMORY[0x24BDAC7A8](v1);
  sub_21C512498();
  sub_21C512390();
  sub_21C512474();
  sub_21C512384();
  sub_21C5124B0();
  sub_21C51239C();
  sub_21C5124C8();
  return sub_21C5123A8();
}

id sub_21C506114()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationContent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C506158()
{
  return type metadata accessor for NotificationContent();
}

uint64_t type metadata accessor for NotificationContent()
{
  uint64_t result;

  result = qword_2552847D0;
  if (!qword_2552847D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21C50619C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21C512504();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_21C506208(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21C512504();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21C506370()
{
  uint64_t v0;
  id v1;

  sub_21C512810();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255284818);
  sub_21C51272C();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  sub_21C512768();
  swift_bridgeObjectRelease();
  v1 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552847A0);
  sub_21C51272C();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  swift_bridgeObjectRetain();
  sub_21C512768();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21C512768();
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

id sub_21C5065CC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NotificationPendingResponse();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NotificationPendingResponse()
{
  return objc_opt_self();
}

unint64_t sub_21C506630()
{
  unint64_t result;

  result = qword_255284820;
  if (!qword_255284820)
  {
    result = MEMORY[0x22077DF50](&unk_21C513424, &type metadata for QuotaClientError);
    atomic_store(result, (unint64_t *)&qword_255284820);
  }
  return result;
}

uint64_t sub_21C506674()
{
  return 1;
}

uint64_t sub_21C50667C()
{
  sub_21C5128B8();
  sub_21C5128C4();
  return sub_21C5128D0();
}

uint64_t sub_21C5066BC()
{
  return sub_21C5128C4();
}

uint64_t sub_21C5066E0()
{
  sub_21C5128B8();
  sub_21C5128C4();
  return sub_21C5128D0();
}

uint64_t sub_21C50672C()
{
  id v0;
  uint64_t v1;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = sub_21C5121B0();

  return v1;
}

uint64_t getEnumTagSinglePayload for QuotaClientError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for QuotaClientError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21C50687C + 4 * asc_21C5133D0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21C50689C + 4 * byte_21C5133D5[v4]))();
}

_BYTE *sub_21C50687C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21C50689C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21C5068A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21C5068AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21C5068B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21C5068BC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_21C5068C8()
{
  return 0;
}

ValueMetadata *type metadata accessor for QuotaClientError()
{
  return &type metadata for QuotaClientError;
}

unint64_t sub_21C5068E4()
{
  unint64_t result;

  result = qword_255284828;
  if (!qword_255284828)
  {
    result = MEMORY[0x22077DF50](&unk_21C5134C4, &type metadata for QuotaClientError);
    atomic_store(result, (unint64_t *)&qword_255284828);
  }
  return result;
}

unint64_t sub_21C506928(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2710);
  v2 = sub_21C51284C();
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
    sub_21C50BED4(v6, (uint64_t)v15);
    result = sub_21C508DF4((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21C50B534(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
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

uint64_t sub_21C506A58()
{
  uint64_t v0;

  v0 = sub_21C5126A8();
  __swift_allocate_value_buffer(v0, qword_255284830);
  __swift_project_value_buffer(v0, (uint64_t)qword_255284830);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552848A0);
  return sub_21C5126B4();
}

void *QuotaServerProtocol.kMlServerScoreNotSet.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.kMlServerScoreNotSet;
}

double static QuotaServerProtocol.kMlServerScoreNotSet.getter()
{
  return 100.0;
}

const char *QuotaServerProtocol.FetchOffers.kSubdContext.unsafeMutableAddressor()
{
  return "subdContext";
}

uint64_t static QuotaServerProtocol.FetchOffers.kSubdContext.getter()
{
  return 0x746E6F4364627573;
}

const char *QuotaServerProtocol.FetchOffers.kOfferId.unsafeMutableAddressor()
{
  return "offerId";
}

uint64_t static QuotaServerProtocol.FetchOffers.kOfferId.getter()
{
  return 0x6449726566666FLL;
}

const char *QuotaServerProtocol.PushNotification.kCallSubD.unsafeMutableAddressor()
{
  return "callSubD";
}

uint64_t static QuotaServerProtocol.PushNotification.kCallSubD.getter()
{
  return 0x446275536C6C6163;
}

const char *QuotaServerProtocol.PushNotification.kMlServerScore.unsafeMutableAddressor()
{
  return "mlServerScore";
}

uint64_t static QuotaServerProtocol.PushNotification.kMlServerScore.getter()
{
  return 0x7265767265536C6DLL;
}

const char *QuotaServerProtocol.PushNotification.kLitmus.unsafeMutableAddressor()
{
  return "litmus";
}

uint64_t static QuotaServerProtocol.PushNotification.kLitmus.getter()
{
  return 0x73756D74696CLL;
}

const char *QuotaServerProtocol.PushNotification.kMaxDelayInSecs.unsafeMutableAddressor()
{
  return "maxDelayInSecs";
}

uint64_t static QuotaServerProtocol.PushNotification.kMaxDelayInSecs.getter()
{
  return 0x79616C654478616DLL;
}

const char *QuotaServerProtocol.PushNotification.kPreviousState.unsafeMutableAddressor()
{
  return "previousState";
}

uint64_t static QuotaServerProtocol.PushNotification.kPreviousState.getter()
{
  return 0x73756F6976657270;
}

const char *QuotaServerProtocol.PushNotification.kNotificationId.unsafeMutableAddressor()
{
  return "notificationId";
}

uint64_t static QuotaServerProtocol.PushNotification.kNotificationId.getter()
{
  return 0x6163696669746F6ELL;
}

void *QuotaServerProtocol.PushNotification.kLitmusInfoSeparator.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.PushNotification.kLitmusInfoSeparator;
}

uint64_t static QuotaServerProtocol.PushNotification.kLitmusInfoSeparator.getter()
{
  return 46;
}

void *QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kShouldDisplayNotificationNow.getter()
{
  return 0xD00000000000001CLL;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kSubdWasCalled.unsafeMutableAddressor()
{
  return "subdWasCalled";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kSubdWasCalled.getter()
{
  return 0x4373615764627573;
}

void *QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kNotificationWasDelayed.getter()
{
  return 0xD000000000000016;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kPreviousState.unsafeMutableAddressor()
{
  return "previousState";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kPreviousState.getter()
{
  return 0x73756F6976657270;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kNotificationId.unsafeMutableAddressor()
{
  return "notificationId";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kNotificationId.getter()
{
  return 0x6163696669746F6ELL;
}

const char *QuotaServerProtocol.RefreshOfferDetails.kOfferId.unsafeMutableAddressor()
{
  return "offerId";
}

uint64_t static QuotaServerProtocol.RefreshOfferDetails.kOfferId.getter()
{
  return 0x6449726566666FLL;
}

void *QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs.unsafeMutableAddressor()
{
  return &static QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs;
}

unint64_t static QuotaServerProtocol.RefreshOfferDetails.kExpectedCallbackTs.getter()
{
  return 0xD000000000000012;
}

uint64_t static QuotaServerProtocol.toServerPushNotification(_:)()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;
  _BYTE v16[40];

  v0 = sub_21C512468();
  v1 = MEMORY[0x24BEC7AE0];
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21C50B28C();
  strcpy((char *)&v14, "notificationId");
  HIBYTE(v14) = -18;
  v5 = MEMORY[0x24BEE0D00];
  sub_21C512804();
  sub_21C5124C8();
  v6 = sub_21C512438();
  v8 = v7;
  sub_21C5053CC((uint64_t)v3, (uint64_t (*)(_QWORD))v1);
  v15 = v5;
  *(_QWORD *)&v14 = v6;
  *((_QWORD *)&v14 + 1) = v8;
  sub_21C50B534(&v14, v13);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v12 = v4;
  sub_21C5094AC(v13, (uint64_t)v16, isUniquelyReferenced_nonNull_native);
  v10 = v12;
  swift_bridgeObjectRelease();
  sub_21C50B544((uint64_t)v16);
  return v10;
}

uint64_t sub_21C506EAC(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  _OWORD v7[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_21C50B534((_OWORD *)a1, v7);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v6 = *v2;
    *v2 = 0x8000000000000000;
    sub_21C5094AC(v7, a2, isUniquelyReferenced_nonNull_native);
    *v2 = v6;
    swift_bridgeObjectRelease();
    return sub_21C50B544(a2);
  }
  else
  {
    sub_21C50B608(a1, &qword_255284850);
    sub_21C508EE8(a2, v7);
    sub_21C50B544(a2);
    return sub_21C50B608((uint64_t)v7, &qword_255284850);
  }
}

unint64_t static QuotaServerProtocol.toServerFetchOffers(_:)()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  char *v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v0 = sub_21C512468();
  v1 = MEMORY[0x24BEC7AE0];
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2718);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C5134F0;
  v11 = 0x6449726566666FLL;
  v12 = 0xE700000000000000;
  v5 = MEMORY[0x24BEE0D00];
  sub_21C512804();
  sub_21C5124C8();
  v6 = sub_21C512450();
  v8 = v7;
  sub_21C5053CC((uint64_t)v3, (uint64_t (*)(_QWORD))v1);
  *(_QWORD *)(inited + 96) = v5;
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 80) = v8;
  v11 = 0x746E6F4364627573;
  v12 = 0xEB00000000747865;
  sub_21C512804();
  v9 = sub_21C50B28C();
  *(_QWORD *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&qword_255284848);
  *(_QWORD *)(inited + 144) = v9;
  return sub_21C506928(inited);
}

uint64_t static QuotaServerProtocol.parse(fromFetchOffers:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t (*v14)(void);
  unint64_t v15;
  const char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;

  v4 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = 0x6449726566666FLL;
  v22 = 0xE700000000000000;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_21C508DF4((uint64_t)&v23), (v8 & 1) != 0))
  {
    sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_21C50B544((uint64_t)&v23);
  if (!*((_QWORD *)&v26 + 1))
  {
    sub_21C50B608((uint64_t)&v25, &qword_255284850);
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_255284330 != -1)
      swift_once();
    v13 = __swift_project_value_buffer(v4, (uint64_t)qword_255284830);
    v14 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v13, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v23 = 0;
    v24 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    v15 = 0xD00000000000002BLL;
    v16 = "The key [offerId] is not present. context=[";
    goto LABEL_23;
  }
  v10 = v21;
  v9 = v22;
  v21 = 0x746E6F4364627573;
  v22 = 0xEB00000000747865;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16) && (v11 = sub_21C508DF4((uint64_t)&v23), (v12 & 1) != 0))
  {
    sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_21C50B544((uint64_t)&v23);
  if (*((_QWORD *)&v26 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255284848);
    if ((swift_dynamicCast() & 1) != 0)
    {
      static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)(v21, 0, 0, v10, v9, a2);
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_21C50B608((uint64_t)&v25, &qword_255284850);
  }
  if (qword_255284330 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v4, (uint64_t)qword_255284830);
  v14 = MEMORY[0x24BEC8230];
  sub_21C50BF1C(v18, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v23 = 0;
  v24 = 0xE000000000000000;
  sub_21C512810();
  swift_bridgeObjectRelease();
  v15 = 0xD00000000000002FLL;
  v16 = "The key [subdContext] is not present. context=[";
LABEL_23:
  v23 = v15;
  v24 = (unint64_t)(v16 - 32) | 0x8000000000000000;
  sub_21C5126FC();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  sub_21C512690();
  swift_bridgeObjectRelease();
  sub_21C5053CC((uint64_t)v6, (uint64_t (*)(_QWORD))v14);
  v19 = sub_21C512504();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 1, 1, v19);
}

uint64_t static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  char v26;
  void *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t (*v34)(void);
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  uint64_t v43;
  uint64_t (*v44)(void);
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  char v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t);
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  __int128 v88;
  __int128 v89;

  v78 = a5;
  v74 = a4;
  v77 = a3;
  v73 = a2;
  v81 = a6;
  v76 = sub_21C512468();
  MEMORY[0x24BDAC7A8](v76);
  v75 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255284858);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C5122D0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v80 = (uint64_t)&v71 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21C5126A8();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v71 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v79 = (uint64_t)&v71 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v71 - v23;
  *(_QWORD *)&v83 = 0x446275536C6C6163;
  *((_QWORD *)&v83 + 1) = 0xE800000000000000;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16) && (v25 = sub_21C508DF4((uint64_t)&v86), (v26 & 1) != 0))
  {
    sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v25, (uint64_t)&v88);
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
  }
  sub_21C50B544((uint64_t)&v86);
  if (!*((_QWORD *)&v89 + 1))
  {
    sub_21C50B608((uint64_t)&v88, &qword_255284850);
    goto LABEL_11;
  }
  sub_21C50B5CC();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_255284330 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v14, (uint64_t)qword_255284830);
    sub_21C50BF1C(v30, (uint64_t)v17, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v86 = 0;
    v87 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v83 = 0x5B20646E756F46;
    *((_QWORD *)&v83 + 1) = 0xE700000000000000;
    *(_QWORD *)&v88 = 0x446275536C6C6163;
    *((_QWORD *)&v88 + 1) = 0xE800000000000000;
    sub_21C512804();
    if (*(_QWORD *)(a1 + 16))
    {
      v31 = sub_21C508DF4((uint64_t)&v86);
      v32 = v81;
      if ((v33 & 1) != 0)
      {
        sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v31, (uint64_t)&v88);
      }
      else
      {
        v88 = 0u;
        v89 = 0u;
      }
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
      v32 = v81;
    }
    sub_21C50B544((uint64_t)&v86);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255284850);
    sub_21C51272C();
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C512768();
    v86 = 0xD000000000000025;
    v87 = 0x800000021C514240;
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C51269C();
    swift_bridgeObjectRelease();
    v34 = MEMORY[0x24BEC8230];
    v35 = (uint64_t)v17;
    goto LABEL_19;
  }
  v27 = (void *)v83;
  v85 = 0x4059000000000000;
  strcpy((char *)&v83, "mlServerScore");
  HIWORD(v83) = -4864;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16))
  {
    v28 = sub_21C508DF4((uint64_t)&v86);
    if ((v29 & 1) != 0)
    {
      sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v28, (uint64_t)&v83);
    }
    else
    {
      v83 = 0u;
      v84 = 0u;
    }
  }
  else
  {
    v83 = 0u;
    v84 = 0u;
  }
  sub_21C50B544((uint64_t)&v86);
  if (*((_QWORD *)&v84 + 1))
  {
    sub_21C50B534(&v83, &v88);
    sub_21C50B590((uint64_t)&v88, (uint64_t)&v86);
    if (!swift_dynamicCast())
    {
      if (qword_255284330 != -1)
        swift_once();
      v41 = __swift_project_value_buffer(v14, (uint64_t)qword_255284830);
      v42 = MEMORY[0x24BEC8230];
      sub_21C50BF1C(v41, (uint64_t)v24, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
      v86 = 0;
      v87 = 0xE000000000000000;
      sub_21C512810();
      swift_bridgeObjectRelease();
      v86 = 0;
      v87 = 0xE000000000000000;
      sub_21C512810();
      sub_21C512768();
      sub_21C512828();
      sub_21C512768();
      v86 = 0xD000000000000023;
      v87 = 0x800000021C514300;
      sub_21C512768();
      swift_bridgeObjectRelease();
      sub_21C51269C();

      swift_bridgeObjectRelease();
      sub_21C5053CC((uint64_t)v24, (uint64_t (*)(_QWORD))v42);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v88);
      goto LABEL_40;
    }
    v38 = v83;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v88);
    v85 = v38;
  }
  else
  {
    sub_21C50B608((uint64_t)&v83, &qword_255284850);
  }
  *(_QWORD *)&v83 = 0x73756D74696CLL;
  *((_QWORD *)&v83 + 1) = 0xE600000000000000;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16))
  {
    v39 = sub_21C508DF4((uint64_t)&v86);
    if ((v40 & 1) != 0)
    {
      sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v39, (uint64_t)&v88);
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
    }
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
  }
  sub_21C50B544((uint64_t)&v86);
  if (!*((_QWORD *)&v89 + 1))
  {
    sub_21C50B608((uint64_t)&v88, &qword_255284850);
    goto LABEL_42;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_42:
    if (qword_255284330 != -1)
      swift_once();
    v46 = __swift_project_value_buffer(v14, (uint64_t)qword_255284830);
    sub_21C50BF1C(v46, (uint64_t)v20, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v86 = 0;
    v87 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    *(_QWORD *)&v83 = 0x5B20646E756F46;
    *((_QWORD *)&v83 + 1) = 0xE700000000000000;
    *(_QWORD *)&v88 = 0x73756D74696CLL;
    *((_QWORD *)&v88 + 1) = 0xE600000000000000;
    sub_21C512804();
    if (*(_QWORD *)(a1 + 16))
    {
      v47 = sub_21C508DF4((uint64_t)&v86);
      v32 = v81;
      if ((v48 & 1) != 0)
      {
        sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v47, (uint64_t)&v88);
      }
      else
      {
        v88 = 0u;
        v89 = 0u;
      }
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
      v32 = v81;
    }
    sub_21C50B544((uint64_t)&v86);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255284850);
    sub_21C51272C();
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C512768();
    v86 = 0xD000000000000022;
    v87 = 0x800000021C514270;
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C51269C();
    swift_bridgeObjectRelease();

    v34 = MEMORY[0x24BEC8230];
    v35 = (uint64_t)v20;
LABEL_19:
    sub_21C5053CC(v35, (uint64_t (*)(_QWORD))v34);
    v36 = sub_21C512504();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56))(v32, 1, 1, v36);
  }
  v72 = v27;
  static QuotaServerProtocol.parseLitmusInfo(_:)(v83, *((unint64_t *)&v83 + 1), (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_21C50B608((uint64_t)v10, &qword_255284858);
    if (qword_255284330 != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v14, (uint64_t)qword_255284830);
    v44 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v43, (uint64_t)v24, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v86 = 0;
    v87 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    v86 = 0xD000000000000024;
    v87 = 0x800000021C5142A0;
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C512768();
    sub_21C51269C();
    swift_bridgeObjectRelease();

    sub_21C5053CC((uint64_t)v24, (uint64_t (*)(_QWORD))v44);
LABEL_40:
    v45 = sub_21C512504();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 56))(v81, 1, 1, v45);
  }
  swift_bridgeObjectRelease();
  v49 = (uint64_t)v10;
  v50 = v80;
  sub_21C50B644(v49, v80);
  strcpy((char *)&v83, "maxDelayInSecs");
  HIBYTE(v83) = -18;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16))
  {
    v51 = sub_21C508DF4((uint64_t)&v86);
    v52 = v72;
    if ((v53 & 1) != 0)
    {
      sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v51, (uint64_t)&v88);
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
    }
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v52 = v72;
  }
  sub_21C50B544((uint64_t)&v86);
  if (*((_QWORD *)&v89 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v54 = v83;
      *(_QWORD *)&v83 = 0;
      *((_QWORD *)&v83 + 1) = 0xE000000000000000;
      strcpy((char *)v82, "previousState");
      HIWORD(v82[1]) = -4864;
      sub_21C512804();
      if (*(_QWORD *)(a1 + 16))
      {
        v55 = sub_21C508DF4((uint64_t)&v86);
        v56 = v81;
        v57 = (uint64_t)v75;
        if ((v58 & 1) != 0)
        {
          sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v55, (uint64_t)&v88);
        }
        else
        {
          v88 = 0u;
          v89 = 0u;
        }
      }
      else
      {
        v88 = 0u;
        v89 = 0u;
        v56 = v81;
        v57 = (uint64_t)v75;
      }
      sub_21C50B544((uint64_t)&v86);
      if (*((_QWORD *)&v89 + 1))
      {
        if ((swift_dynamicCast() & 1) != 0)
        {
          v65 = v82[0];
          v66 = v82[1];
          swift_bridgeObjectRelease();
          *(_QWORD *)&v83 = v65;
          *((_QWORD *)&v83 + 1) = v66;
        }
      }
      else
      {
        sub_21C50B608((uint64_t)&v88, &qword_255284850);
      }
      v67 = objc_msgSend(v52, sel_BOOLValue);
      if ((_DWORD)v67)
        v68 = 2;
      else
        v68 = 1;
      MEMORY[0x24BDAC7A8](v67);
      *(&v71 - 2) = (uint64_t)&v83;
      sub_21C50BD5C(&qword_255284868, (uint64_t (*)(uint64_t))MEMORY[0x24BEC7AE0], MEMORY[0x24BEC7AC0]);
      sub_21C5121D4();
      if (v77)
      {
        swift_bridgeObjectRetain();
        sub_21C512444();
      }
      if (v78)
      {
        swift_bridgeObjectRetain();
        sub_21C51245C();
      }
      v69 = sub_21C512504();
      MEMORY[0x24BDAC7A8](v69);
      *(&v71 - 6) = v68;
      *((_BYTE *)&v71 - 40) = 1;
      *(&v71 - 4) = v50;
      *(&v71 - 3) = v54;
      *(&v71 - 2) = (uint64_t)&v85;
      *(&v71 - 1) = v57;
      sub_21C50BD5C(&qword_255284870, v70, MEMORY[0x24BEC7BD8]);
      sub_21C5121D4();

      sub_21C5053CC(v50, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7698]);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v56, 0, 1, v69);
      sub_21C5053CC(v57, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7AE0]);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_21C50B608((uint64_t)&v88, &qword_255284850);
  }
  if (qword_255284330 != -1)
    swift_once();
  v59 = __swift_project_value_buffer(v14, (uint64_t)qword_255284830);
  v60 = v79;
  sub_21C50BF1C(v59, v79, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v86 = 0;
  v87 = 0xE000000000000000;
  sub_21C512810();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v83 = 0x5B20646E756F46;
  *((_QWORD *)&v83 + 1) = 0xE700000000000000;
  strcpy((char *)&v88, "maxDelayInSecs");
  HIBYTE(v88) = -18;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16))
  {
    v61 = sub_21C508DF4((uint64_t)&v86);
    v62 = v81;
    if ((v63 & 1) != 0)
    {
      sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v61, (uint64_t)&v88);
    }
    else
    {
      v88 = 0u;
      v89 = 0u;
    }
  }
  else
  {
    v88 = 0u;
    v89 = 0u;
    v62 = v81;
  }
  sub_21C50B544((uint64_t)&v86);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255284850);
  sub_21C51272C();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  v86 = 0xD00000000000002ALL;
  v87 = 0x800000021C5142D0;
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C51269C();
  swift_bridgeObjectRelease();

  sub_21C5053CC(v60, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  sub_21C5053CC(v50, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7698]);
  v64 = sub_21C512504();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v62, 1, 1, v64);
}

uint64_t static QuotaServerProtocol.parse(fromPushNotification:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v14[2];
  unint64_t v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;

  v4 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  strcpy((char *)v14, "notificationId");
  HIBYTE(v14[1]) = -18;
  sub_21C512804();
  if (*(_QWORD *)(a1 + 16) && (v7 = sub_21C508DF4((uint64_t)&v15), (v8 & 1) != 0))
  {
    sub_21C50B590(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v17);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }
  sub_21C50B544((uint64_t)&v15);
  if (*((_QWORD *)&v18 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      static QuotaServerProtocol.toFetchOffersContext(context:notificationId:offerId:)(a1, v14[0], v14[1], 0, 0, a2);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_21C50B608((uint64_t)&v17, &qword_255284850);
  }
  if (qword_255284330 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_255284830);
  v11 = MEMORY[0x24BEC8230];
  sub_21C50BF1C(v10, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v15 = 0;
  v16 = 0xE000000000000000;
  sub_21C512810();
  swift_bridgeObjectRelease();
  v15 = 0xD000000000000032;
  v16 = 0x800000021C514350;
  sub_21C5126FC();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  sub_21C512690();
  swift_bridgeObjectRelease();
  sub_21C5053CC((uint64_t)v6, (uint64_t (*)(_QWORD))v11);
  v12 = sub_21C512504();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a2, 1, 1, v12);
}

uint64_t static QuotaServerProtocol.parseLitmusInfo(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(void);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int16 v46;
  __int16 v47;
  uint64_t v48;
  int v49;
  uint64_t (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[16];
  unint64_t *v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;

  v6 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = 46;
  v60 = 0xE100000000000000;
  v57 = &v59;
  swift_bridgeObjectRetain();
  v9 = sub_21C509840(0x7FFFFFFFFFFFFFFFLL, 1, sub_21C50B6F8, (uint64_t)v56, a1, a2);
  v10 = v9;
  v11 = *((_QWORD *)v9 + 2);
  if (v11 != 4)
  {
    if (qword_255284330 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v6, (uint64_t)qword_255284830);
    v19 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v18, (uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v59 = 0;
    v60 = 0xE000000000000000;
    sub_21C512810();
    sub_21C512768();
    sub_21C512708();
    sub_21C512768();
    v59 = 0xD000000000000031;
    v60 = 0x800000021C514390;
    sub_21C512768();
    swift_bridgeObjectRelease();
    v21 = v59;
    v20 = v60;
    v59 = 0;
    v60 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v59 = 0x5B20646E756F46;
    v60 = 0xE700000000000000;
    v58 = v11;
    sub_21C512864();
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C512768();
    v59 = v21;
    v60 = v20;
    swift_bridgeObjectRetain();
    sub_21C512768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21C51269C();
    swift_bridgeObjectRelease();
    sub_21C5053CC((uint64_t)v8, (uint64_t (*)(_QWORD))v19);
    v22 = sub_21C5122D0();
    v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
    v24 = a3;
    return v23(v24, 1, 1, v22);
  }
  v54 = a1;
  v55 = a3;
  v12 = *((_QWORD *)v9 + 4);
  v13 = *((_QWORD *)v9 + 5);
  if ((v13 ^ (unint64_t)v12) < 0x4000)
    goto LABEL_20;
  v15 = *((_QWORD *)v9 + 6);
  v14 = *((_QWORD *)v9 + 7);
  result = sub_21C50A87C(*((_QWORD *)v9 + 4), *((_QWORD *)v9 + 5), v15, v14, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v17 = sub_21C509C58(v12, v13, v15, v14, 10);
    result = swift_bridgeObjectRelease();
    if ((v17 & 0x100000000) != 0)
      goto LABEL_20;
  }
  else
  {
    LODWORD(v17) = result;
    if ((result & 0x100000000) != 0)
      goto LABEL_20;
  }
  if (*((_QWORD *)v10 + 2) < 2uLL)
  {
    __break(1u);
    goto LABEL_30;
  }
  v26 = *((_QWORD *)v10 + 8);
  v25 = *((_QWORD *)v10 + 9);
  if ((v25 ^ (unint64_t)v26) < 0x4000)
  {
LABEL_20:
    swift_bridgeObjectRelease();
LABEL_21:
    v34 = v55;
    if (qword_255284330 != -1)
      swift_once();
    v35 = __swift_project_value_buffer(v6, (uint64_t)qword_255284830);
    v36 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v35, (uint64_t)v8, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v59 = 0x5B20646E756F46;
    v60 = 0xE700000000000000;
    sub_21C512768();
    sub_21C512768();
    v59 = 0xD000000000000053;
    v60 = 0x800000021C5143D0;
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C51269C();
    swift_bridgeObjectRelease();
    sub_21C5053CC((uint64_t)v8, (uint64_t (*)(_QWORD))v36);
    v22 = sub_21C5122D0();
    v23 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
    v24 = v34;
    return v23(v24, 1, 1, v22);
  }
  v27 = *((_QWORD *)v10 + 10);
  v28 = *((_QWORD *)v10 + 11);
  result = sub_21C50A87C(*((_QWORD *)v10 + 8), *((_QWORD *)v10 + 9), v27, v28, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v29 = sub_21C509C58(v26, v25, v27, v28, 10);
    result = swift_bridgeObjectRelease();
    v53 = v29;
    if ((v29 & 0x100000000) == 0)
      goto LABEL_16;
    goto LABEL_20;
  }
  v53 = result;
  if ((result & 0x100000000) != 0)
    goto LABEL_20;
LABEL_16:
  if (*((_QWORD *)v10 + 2) < 3uLL)
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
    return result;
  }
  v30 = *((_QWORD *)v10 + 12);
  v31 = *((_QWORD *)v10 + 13);
  if ((v31 ^ (unint64_t)v30) < 0x4000)
    goto LABEL_20;
  v32 = *((_QWORD *)v10 + 14);
  v33 = *((_QWORD *)v10 + 15);
  result = sub_21C50A87C(*((_QWORD *)v10 + 12), *((_QWORD *)v10 + 13), v32, v33, 10);
  if ((result & 0x10000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v37 = sub_21C509C58(v30, v31, v32, v33, 10);
    swift_bridgeObjectRelease();
    result = v37;
    if ((v37 & 0x100000000) != 0)
      goto LABEL_20;
  }
  else if ((result & 0x100000000) != 0)
  {
    goto LABEL_20;
  }
  v52 = result;
  if (*((_QWORD *)v10 + 2) < 4uLL)
    goto LABEL_31;
  v38 = *((_QWORD *)v10 + 16);
  v39 = *((_QWORD *)v10 + 17);
  v40 = *((_QWORD *)v10 + 18);
  v41 = *((_QWORD *)v10 + 19);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x22077DB0C](v38, v39, v40, v41);
  v44 = v43;
  swift_bridgeObjectRelease();
  v45 = sub_21C50BB70(v42, v44);
  v47 = v46;
  swift_bridgeObjectRelease();
  if ((v47 & 0x100) != 0)
    goto LABEL_21;
  v48 = sub_21C5122D0();
  MEMORY[0x24BDAC7A8](v48);
  v49 = v53;
  *((_DWORD *)&v52 - 8) = v17;
  *((_DWORD *)&v52 - 7) = v49;
  *((_DWORD *)&v52 - 6) = v52;
  *(&v52 - 2) = v45;
  *((_BYTE *)&v52 - 8) = v47 & 1;
  sub_21C50BD5C(&qword_255284878, v50, MEMORY[0x24BEC7660]);
  v51 = v55;
  sub_21C5121D4();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v51, 0, 1, v48);
}

uint64_t sub_21C508C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  char *v14;
  uint64_t v16;
  uint64_t v17;

  v17 = a7;
  v8 = sub_21C512468();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C5122D0();
  v12 = MEMORY[0x24BEC7698];
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v16 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C5124F8();
  sub_21C50BF1C(a4, (uint64_t)v14, (uint64_t (*)(_QWORD))v12);
  sub_21C512480();
  sub_21C5124BC();
  sub_21C5124A4();
  sub_21C50BF1C(v17, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7AE0]);
  return sub_21C5124D4();
}

uint64_t sub_21C508D8C()
{
  sub_21C5122A0();
  sub_21C512264();
  sub_21C5122B8();
  return sub_21C512288();
}

unint64_t sub_21C508DF4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21C5127EC();
  return sub_21C508E24(a1, v2);
}

unint64_t sub_21C508E24(uint64_t a1, uint64_t a2)
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
      sub_21C50BE98(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22077DBCC](v9, a1);
      sub_21C50B544((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

double sub_21C508EE8@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21C508DF4(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_21C50965C();
      v9 = v11;
    }
    sub_21C50B544(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_21C50B534((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_21C5092E4(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_21C508FD0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2710);
  v6 = sub_21C512840();
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
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_22;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v21 >= v11)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v11)
        goto LABEL_34;
      v23 = *(_QWORD *)(v36 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v11)
        {
LABEL_34:
          swift_release();
          if ((a2 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_43;
            if (v14 >= v11)
              goto LABEL_34;
            v23 = *(_QWORD *)(v36 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_21;
          }
        }
        v14 = v24;
      }
    }
LABEL_21:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_22:
    v25 = *(_QWORD *)(v5 + 48) + 40 * v20;
    if ((a2 & 1) != 0)
    {
      v26 = *(_OWORD *)v25;
      v27 = *(_OWORD *)(v25 + 16);
      v40 = *(_QWORD *)(v25 + 32);
      v38 = v26;
      v39 = v27;
      sub_21C50B534((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v20), v37);
    }
    else
    {
      sub_21C50BE98(v25, (uint64_t)&v38);
      sub_21C50B590(*(_QWORD *)(v5 + 56) + 32 * v20, (uint64_t)v37);
    }
    result = sub_21C5127EC();
    v28 = -1 << *(_BYTE *)(v7 + 32);
    v29 = result & ~v28;
    v30 = v29 >> 6;
    if (((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v29) & ~*(_QWORD *)(v12 + 8 * (v29 >> 6)))) | v29 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v28) >> 6;
      do
      {
        if (++v30 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v33 = v30 == v32;
        if (v30 == v32)
          v30 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v30);
      }
      while (v34 == -1);
      v15 = __clz(__rbit64(~v34)) + (v30 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = *(_QWORD *)(v7 + 48) + 40 * v15;
    v17 = v38;
    v18 = v39;
    *(_QWORD *)(v16 + 32) = v40;
    *(_OWORD *)v16 = v17;
    *(_OWORD *)(v16 + 16) = v18;
    result = (uint64_t)sub_21C50B534(v37, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v15));
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v22, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_21C5092E4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_21C5127E0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_21C50BE98(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_21C5127EC();
        result = sub_21C50B544((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_21C5094AC(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _OWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_21C508DF4(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_OWORD *)(v16[7] + 32 * v10);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
        return sub_21C50B534(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_21C50965C();
      goto LABEL_7;
    }
    sub_21C508FD0(v13, a3 & 1);
    v19 = sub_21C508DF4(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_21C50BE98(a2, (uint64_t)v21);
      return sub_21C5095E4(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)sub_21C51287C();
  __break(1u);
  return result;
}

_OWORD *sub_21C5095E4(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_21C50B534(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

void *sub_21C50965C()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2710);
  v2 = *v0;
  v3 = sub_21C512834();
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_21C50BE98(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_21C50B590(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_21C50B534(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_21C509840(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  unint64_t v44;
  _QWORD v46[4];

  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v11 = a5;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = MEMORY[0x24BEE4AF8];
  v43 = swift_allocObject();
  *(_QWORD *)(v43 + 16) = 15;
  v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v16 = HIBYTE(a6) & 0xF) : (v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v15 = v11 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_21C50A560(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  v38 = a1;
  v39 = v14;
  v44 = 4 * v16;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v9 = 15;
  v8 = 15;
  v17 = 15;
  while (1)
  {
    v46[0] = sub_21C5127B0();
    v46[1] = v18;
    v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    v6 = v19;
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      break;
    v9 = sub_21C51275C();
LABEL_9:
    if (v44 == v9 >> 14)
      goto LABEL_29;
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    v9 = sub_21C51275C();
    *(_QWORD *)(v43 + 16) = v9;
    v8 = v9;
    v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  v20 = sub_21C5127C8();
  v40 = v21;
  v41 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v10 = sub_21C50A66C(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
  v27 = *((_QWORD *)v10 + 2);
  v26 = *((_QWORD *)v10 + 3);
  v6 = v27 + 1;
  if (v27 >= v26 >> 1)
    v10 = sub_21C50A66C((char *)(v26 > 1), v27 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v6;
  v28 = &v10[32 * v27];
  *((_QWORD *)v28 + 4) = v41;
  *((_QWORD *)v28 + 5) = v23;
  *((_QWORD *)v28 + 6) = v25;
  *((_QWORD *)v28 + 7) = v40;
  *(_QWORD *)(v39 + 16) = v10;
  v29 = sub_21C51275C();
  v9 = v29;
  *(_QWORD *)(v43 + 16) = v29;
  if (*((_QWORD *)v10 + 2) != v38)
  {
    v8 = v29;
    v17 = v29;
    goto LABEL_9;
  }
  v17 = v29;
  v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    v6 = sub_21C5127C8();
    v8 = v31;
    v9 = v32;
    v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      goto LABEL_43;
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  v10 = sub_21C50A66C(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
LABEL_34:
  v35 = *((_QWORD *)v10 + 2);
  v34 = *((_QWORD *)v10 + 3);
  if (v35 >= v34 >> 1)
    v10 = sub_21C50A66C((char *)(v34 > 1), v35 + 1, 1, v10);
  *((_QWORD *)v10 + 2) = v35 + 1;
  v36 = &v10[32 * v35];
  *((_QWORD *)v36 + 4) = v6;
  *((_QWORD *)v36 + 5) = v8;
  *((_QWORD *)v36 + 6) = v9;
  *((_QWORD *)v36 + 7) = v11;
  *(_QWORD *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_21C509C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int8 *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v15 = a1;
  v16 = a2;
  v17 = a3;
  v18 = a4;
  sub_21C50BDE0();
  swift_bridgeObjectRetain();
  v7 = sub_21C5127BC();
  v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v10 = HIBYTE(v8) & 0xF;
    v15 = v7;
    v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  v7 = sub_21C509FC8();
  v12 = v11;
  swift_bridgeObjectRelease();
  v8 = v12;
  if ((v12 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = (unsigned __int8 *)sub_21C51281C();
  }
LABEL_7:
  v13 = sub_21C509D48(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13 | ((((unint64_t)v13 >> 32) & 1) << 32);
}

unsigned __int8 *sub_21C509D48(unsigned __int8 *result, uint64_t a2, uint64_t a3)
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

uint64_t sub_21C509FC8()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21C5127C8();
  v4 = sub_21C50A044(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21C50A044(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21C50A188(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21C50A274(v9, 0);
      v12 = sub_21C50A2D8((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
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
    v13 = MEMORY[0x22077DB18](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22077DB18);
LABEL_9:
      sub_21C51281C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22077DB18]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21C50A188(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
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
    result = sub_21C50A4E8(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21C50A4E8(a2, a3, a4);
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
    return sub_21C51278C();
  }
  __break(1u);
  return result;
}

_QWORD *sub_21C50A274(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255284890);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

unint64_t sub_21C50A2D8(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
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
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21C50A4E8(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21C512798();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21C51281C();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21C50A4E8(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21C512774();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_21C50A4E8(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_21C5127A4();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x22077DB54](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_21C50A560(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  char *v18;

  v10 = *(_QWORD *)(a2 + 16) >> 14;
  v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1)
    return v11 ^ 1u;
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  v4 = a4;
  v5 = sub_21C5127C8();
  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = *(char **)(v4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    v9 = sub_21C50A66C(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  v17 = *((_QWORD *)v9 + 2);
  v16 = *((_QWORD *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    v9 = sub_21C50A66C((char *)(v16 > 1), v17 + 1, 1, v9);
    *(_QWORD *)(v4 + 16) = v9;
  }
  *((_QWORD *)v9 + 2) = v17 + 1;
  v18 = &v9[32 * v17];
  *((_QWORD *)v18 + 4) = v5;
  *((_QWORD *)v18 + 5) = v6;
  *((_QWORD *)v18 + 6) = v7;
  *((_QWORD *)v18 + 7) = v8;
  return v11 ^ 1u;
}

char *sub_21C50A66C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255284898);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_21C50A76C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_21C50A788(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_21C50A788(char *result, int64_t a2, char a3, char *a4)
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
  size_t v15;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255284880);
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
  v15 = 16 * v8;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, v15);
  }
  swift_release();
  return v10;
}

uint64_t sub_21C50A87C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t result;
  _QWORD v13[2];
  unsigned __int8 v14;

  if ((a4 & 0x1000000000000000) != 0)
  {
    LODWORD(result) = 0;
    v14 = 0;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  if ((a4 & 0x2000000000000000) != 0)
  {
    v13[0] = a3;
    v13[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    v11 = v13;
  }
  else if ((a3 & 0x1000000000000000) != 0)
  {
    v11 = (_QWORD *)((a4 & 0xFFFFFFFFFFFFFFFLL) + 32);
  }
  else
  {
    v11 = (_QWORD *)sub_21C51281C();
  }
  result = sub_21C50B74C((uint64_t)v11, a1, a2, a3, a4, a5);
  if (!v5)
  {
    v14 = BYTE4(result) & 1;
    return result | ((unint64_t)v14 << 32) | (((a4 >> 60) & 1) << 40);
  }
  return result;
}

uint64_t sub_21C50A94C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[4];
  _BYTE v10[40];

  v4 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v4 = a3 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    swift_bridgeObjectRetain();
    v7 = MEMORY[0x24BEE0D00];
    sub_21C512804();
    v9[3] = v7;
    v9[0] = a3;
    v9[1] = a4;
    swift_bridgeObjectRetain();
    return sub_21C506EAC((uint64_t)v9, (uint64_t)v10);
  }
  return result;
}

uint64_t _s33iCloudSubscriptionOptimizerClient19QuotaServerProtocolV02toF14RefreshDetailsySDys11AnyHashableVypG01iabC4Core0iJ7ContextVFZ_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t v4;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(void);
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  uint64_t (*v28)(void);
  uint64_t v29;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(void);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(void);
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  _OWORD v72[2];
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  _OWORD v79[2];
  __int128 v80;
  uint64_t v81;
  _BYTE v82[40];
  uint64_t v83;

  sub_21C512468();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v70 = (char *)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21C512588();
  v3 = MEMORY[0x24BEC7CB8];
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v69 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v67 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v67 = (uint64_t)&v67 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v67 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v67 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v67 - v17;
  v19 = sub_21C506928(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v79[0] = 0xD00000000000001CLL;
  *((_QWORD *)&v79[0] + 1) = 0x800000021C514180;
  sub_21C512804();
  sub_21C512570();
  v20 = sub_21C51236C();
  v21 = sub_21C51236C();
  sub_21C50BF1C(a1, (uint64_t)v18, (uint64_t (*)(_QWORD))v3);
  v68 = v8;
  if (v20 == v21)
  {
    v22 = MEMORY[0x24BEC7CB8];
    sub_21C5053CC((uint64_t)v18, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    sub_21C50BF1C(a1, (uint64_t)v16, (uint64_t (*)(_QWORD))v22);
    v23 = 1;
  }
  else
  {
    sub_21C512570();
    v24 = sub_21C51236C();
    v23 = 1;
    v25 = sub_21C51236C();
    v26 = MEMORY[0x24BEC7CB8];
    sub_21C5053CC((uint64_t)v18, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    sub_21C50BF1C(a1, (uint64_t)v16, (uint64_t (*)(_QWORD))v26);
    if (v24 != v25)
    {
      sub_21C512570();
      v27 = sub_21C51236C();
      v23 = v27 == sub_21C51236C();
    }
  }
  v28 = MEMORY[0x24BEC7CB8];
  sub_21C5053CC((uint64_t)v16, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
  v29 = MEMORY[0x24BEE1328];
  v81 = MEMORY[0x24BEE1328];
  LOBYTE(v80) = v23;
  sub_21C50B534(&v80, v79);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v75 = v19;
  sub_21C5094AC(v79, (uint64_t)v82, isUniquelyReferenced_nonNull_native);
  v31 = v75;
  swift_bridgeObjectRelease();
  sub_21C50B544((uint64_t)v82);
  strcpy((char *)&v75, "subdWasCalled");
  HIWORD(v75) = -4864;
  sub_21C512804();
  v32 = sub_21C512528();
  v33 = v29;
  v76 = v29;
  LOBYTE(v75) = v32 & 1;
  sub_21C50B534(&v75, &v77);
  v34 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v73 = v31;
  sub_21C5094AC(&v77, (uint64_t)v79, v34);
  v35 = v73;
  v83 = v73;
  swift_bridgeObjectRelease();
  sub_21C50B544((uint64_t)v79);
  *(_QWORD *)&v75 = 0xD000000000000016;
  *((_QWORD *)&v75 + 1) = 0x800000021C5141A0;
  sub_21C512804();
  sub_21C512570();
  v36 = sub_21C51236C();
  v37 = sub_21C51236C();
  sub_21C50BF1C(a1, (uint64_t)v13, (uint64_t (*)(_QWORD))v28);
  if (v36 == v37)
  {
    v38 = MEMORY[0x24BEC7CB8];
    sub_21C5053CC((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    v39 = v67;
    sub_21C50BF1C(a1, v67, (uint64_t (*)(_QWORD))v38);
LABEL_8:
    v42 = MEMORY[0x24BEC7CB8];
    sub_21C5053CC(v39, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    v43 = (uint64_t)v68;
    sub_21C50BF1C(a1, (uint64_t)v68, (uint64_t (*)(_QWORD))v42);
    v44 = 1;
    v45 = (uint64_t)v69;
    goto LABEL_9;
  }
  sub_21C512570();
  v40 = sub_21C51236C();
  v41 = sub_21C51236C();
  sub_21C5053CC((uint64_t)v13, (uint64_t (*)(_QWORD))v28);
  v39 = v67;
  sub_21C50BF1C(a1, v67, (uint64_t (*)(_QWORD))v28);
  if (v40 == v41)
    goto LABEL_8;
  sub_21C512570();
  v61 = sub_21C51236C();
  v44 = 1;
  v62 = sub_21C51236C();
  sub_21C5053CC(v39, (uint64_t (*)(_QWORD))v28);
  v63 = (uint64_t)v68;
  sub_21C50BF1C(a1, (uint64_t)v68, (uint64_t (*)(_QWORD))v28);
  v64 = v61 == v62;
  v43 = v63;
  v45 = (uint64_t)v69;
  if (!v64)
  {
    sub_21C512570();
    v65 = sub_21C51236C();
    v44 = v65 == sub_21C51236C();
  }
LABEL_9:
  sub_21C5053CC(v43, (uint64_t (*)(_QWORD))v28);
  v78 = v33;
  LOBYTE(v77) = v44;
  sub_21C50B534(&v77, &v75);
  v46 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)&v73 = v35;
  sub_21C5094AC(&v75, (uint64_t)v79, v46);
  v83 = v73;
  swift_bridgeObjectRelease();
  sub_21C50B544((uint64_t)v79);
  v47 = (uint64_t)v70;
  sub_21C512540();
  v48 = sub_21C512438();
  sub_21C50A94C(0x6163696669746F6ELL, 0xEE0064496E6F6974, v48, v49);
  swift_bridgeObjectRelease();
  v50 = sub_21C512450();
  sub_21C50A94C(0x6449726566666FLL, 0xE700000000000000, v50, v51);
  swift_bridgeObjectRelease();
  v52 = sub_21C512420();
  sub_21C50A94C(0x73756F6976657270, 0xED00006574617453, v52, v53);
  swift_bridgeObjectRelease();
  sub_21C512570();
  v54 = sub_21C51236C();
  sub_21C50BF1C(a1, v45, (uint64_t (*)(_QWORD))v28);
  if (v54 == v37)
  {
    sub_21C5053CC(v45, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
  }
  else
  {
    sub_21C512570();
    v55 = sub_21C51236C();
    v56 = sub_21C51236C();
    sub_21C5053CC(v45, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    if (v55 != v56)
    {
      sub_21C5053CC(v47, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7AE0]);
      return v83;
    }
  }
  *(_QWORD *)&v73 = 0xD000000000000012;
  *((_QWORD *)&v73 + 1) = 0x800000021C5141C0;
  sub_21C512804();
  v57 = sub_21C512558();
  v74 = MEMORY[0x24BEE4008];
  *(_QWORD *)&v73 = v57;
  sub_21C50B534(&v73, v72);
  v58 = v83;
  v59 = swift_isUniquelyReferenced_nonNull_native();
  v71 = v58;
  sub_21C5094AC(v72, (uint64_t)&v75, v59);
  v60 = v71;
  swift_bridgeObjectRelease();
  sub_21C50B544((uint64_t)&v75);
  sub_21C5053CC(v47, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7AE0]);
  return v60;
}

uint64_t sub_21C50B168()
{
  uint64_t v1;

  sub_21C512294();
  v1 = sub_21C512864();
  sub_21C512768();
  sub_21C512258();
  sub_21C512864();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  sub_21C5122AC();
  sub_21C512864();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  sub_21C51227C();
  sub_21C512768();
  return v1;
}

uint64_t sub_21C50B28C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t (*v4)(void);
  uint64_t v5;
  char *v6;
  uint64_t inited;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD v21[2];

  v0 = sub_21C512468();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v21[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_21C5122D0();
  v4 = MEMORY[0x24BEC7698];
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v21[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2718);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C513500;
  strcpy((char *)v21, "callSubD");
  BYTE1(v21[1]) = 0;
  WORD1(v21[1]) = 0;
  HIDWORD(v21[1]) = -402653184;
  v8 = MEMORY[0x24BEE0D00];
  sub_21C512804();
  sub_21C5124EC();
  v9 = sub_21C5124E0();
  v10 = v9 == sub_21C5124E0();
  *(_QWORD *)(inited + 96) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 72) = v10;
  strcpy((char *)v21, "mlServerScore");
  HIWORD(v21[1]) = -4864;
  sub_21C512804();
  sub_21C512498();
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE13C8];
  *(_QWORD *)(inited + 144) = v11;
  v21[0] = 0x73756D74696CLL;
  v21[1] = 0xE600000000000000;
  sub_21C512804();
  sub_21C512474();
  v12 = sub_21C50B168();
  v14 = v13;
  sub_21C5053CC((uint64_t)v6, (uint64_t (*)(_QWORD))v4);
  *(_QWORD *)(inited + 240) = v8;
  *(_QWORD *)(inited + 216) = v12;
  *(_QWORD *)(inited + 224) = v14;
  strcpy((char *)v21, "maxDelayInSecs");
  HIBYTE(v21[1]) = -18;
  sub_21C512804();
  v15 = sub_21C5124B0();
  *(_QWORD *)(inited + 312) = MEMORY[0x24BEE4008];
  *(_QWORD *)(inited + 288) = v15;
  v21[0] = sub_21C506928(inited);
  sub_21C5124C8();
  v16 = sub_21C512420();
  v18 = v17;
  sub_21C5053CC((uint64_t)v2, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7AE0]);
  sub_21C50A94C(0x73756F6976657270, 0xED00006574617453, v16, v18);
  swift_bridgeObjectRelease();
  return v21[0];
}

_OWORD *sub_21C50B534(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21C50B544(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21C50B590(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21C50B5CC()
{
  unint64_t result;

  result = qword_255284860;
  if (!qword_255284860)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255284860);
  }
  return result;
}

uint64_t sub_21C50B608(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21C50B644(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21C5122D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C50B688()
{
  swift_bridgeObjectRetain();
  return sub_21C51242C();
}

uint64_t sub_21C50B6D4(uint64_t a1)
{
  uint64_t v1;

  return sub_21C508C68(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_21C50B6F8(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_21C512870() & 1;
}

uint64_t sub_21C50B74C(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unsigned __int8 *v19;
  int v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned int v24;
  unsigned __int8 *v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  unsigned int v29;
  unsigned __int8 v30;
  uint64_t v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned __int8 v35;
  unsigned __int8 *v36;
  uint64_t v37;
  unsigned int v38;
  char v39;
  uint64_t v40;
  unsigned __int8 v41;
  unsigned __int8 v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  unsigned int v45;
  char v46;
  uint64_t v47;
  unsigned __int8 v48;

  v10 = a2;
  v11 = result;
  v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0)
    LOBYTE(v12) = 1;
  v13 = 4 << v12;
  v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    result = sub_21C50A4E8(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      v15 = a2 >> 16;
      if (v14 != v13)
        goto LABEL_6;
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0)
    v16 = HIBYTE(a5) & 0xF;
  if (v16 < a2 >> 16)
    goto LABEL_104;
  result = sub_21C51278C();
  v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    result = sub_21C50A4E8(v10, a4, a5);
    v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    result = sub_21C50A4E8(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0)
      goto LABEL_8;
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0)
    v17 = a4 & 0xFFFFFFFFFFFFLL;
  if (v17 < v10 >> 16)
    goto LABEL_100;
  if (v17 < a3 >> 16)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  result = sub_21C51278C();
LABEL_21:
  v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_99;
  }
  if (v18 < v15)
  {
LABEL_99:
    __break(1u);
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11)
    v19 = 0;
  v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        v33 = a6 + 87;
        if (a6 > 10)
        {
          v34 = a6 + 55;
        }
        else
        {
          v33 = 97;
          v34 = 65;
        }
        if (a6 <= 10)
          v35 = a6 + 48;
        else
          v35 = 58;
        if (v19)
        {
          v24 = 0;
          v36 = v19 + 1;
          v37 = result - 1;
          do
          {
            v38 = *v36;
            if (v38 < 0x30 || v38 >= v35)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                v29 = 0;
                v30 = 1;
                if (v38 < 0x61 || v38 >= v33)
                  return v29 | ((unint64_t)v30 << 32);
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
            v40 = (int)v24 * (uint64_t)(int)a6;
            if (v40 != (int)v40)
              goto LABEL_96;
            v41 = v38 + v39;
            v24 = v40 + v41;
            if (__OFADD__((_DWORD)v40, v41))
              goto LABEL_96;
            ++v36;
            --v37;
          }
          while (v37);
LABEL_94:
          v30 = 0;
          v29 = v24;
          return v29 | ((unint64_t)v30 << 32);
        }
        goto LABEL_95;
      }
      goto LABEL_96;
    }
    goto LABEL_103;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      v42 = a6 + 87;
      if (a6 > 10)
      {
        v43 = a6 + 55;
      }
      else
      {
        v42 = 97;
        v43 = 65;
      }
      if (a6 <= 10)
        v44 = a6 + 48;
      else
        v44 = 58;
      if (v19)
      {
        v24 = 0;
        while (1)
        {
          v45 = *v19;
          if (v45 < 0x30 || v45 >= v44)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              v29 = 0;
              v30 = 1;
              if (v45 < 0x61 || v45 >= v42)
                return v29 | ((unint64_t)v30 << 32);
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
          v47 = (int)v24 * (uint64_t)(int)a6;
          if (v47 != (int)v47)
            goto LABEL_96;
          v48 = v45 + v46;
          v24 = v47 + v48;
          if (__OFADD__((_DWORD)v47, v48))
            goto LABEL_96;
          ++v19;
          if (!--result)
            goto LABEL_94;
        }
      }
      goto LABEL_95;
    }
LABEL_96:
    v29 = 0;
    v30 = 1;
    return v29 | ((unint64_t)v30 << 32);
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      v21 = a6 + 87;
      if (a6 > 10)
      {
        v22 = a6 + 55;
      }
      else
      {
        v21 = 97;
        v22 = 65;
      }
      if (a6 <= 10)
        v23 = a6 + 48;
      else
        v23 = 58;
      if (v19)
      {
        v24 = 0;
        v25 = v19 + 1;
        v26 = result - 1;
        while (1)
        {
          v27 = *v25;
          if (v27 < 0x30 || v27 >= v23)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              v29 = 0;
              v30 = 1;
              if (v27 < 0x61 || v27 >= v21)
                return v29 | ((unint64_t)v30 << 32);
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
          v31 = (int)v24 * (uint64_t)(int)a6;
          if (v31 != (int)v31)
            goto LABEL_96;
          v32 = v27 + v28;
          v24 = v31 - v32;
          if (__OFSUB__((_DWORD)v31, v32))
            goto LABEL_96;
          ++v25;
          if (!--v26)
            goto LABEL_94;
        }
      }
LABEL_95:
      v29 = 0;
      v30 = 0;
      return v29 | ((unint64_t)v30 << 32);
    }
    goto LABEL_96;
  }
LABEL_102:
  __break(1u);
LABEL_103:
  __break(1u);
LABEL_104:
  __break(1u);
  return result;
}

uint64_t sub_21C50BB70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char v14;

  v2 = a2;
  if (!a2)
    return v2;
  v4 = sub_21C512270();
  swift_beginAccess();
  v5 = *(_QWORD *)(*(_QWORD *)v4 + 16);
  if (v5)
  {
    v6 = (unsigned __int8 *)(swift_bridgeObjectRetain() + 40);
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    while (1)
    {
      v11 = *((_QWORD *)v6 - 1);
      v12 = *v6;
      if (v12 == 1)
      {
        v13 = *(_QWORD *)&aU[8 * v11];
        if (v2 != 0xE100000000000000)
          goto LABEL_14;
      }
      else
      {
        v13 = 85;
        if (v2 != 0xE100000000000000)
          goto LABEL_14;
      }
      if (v13 == a1)
      {
        swift_bridgeObjectRelease();
LABEL_15:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_21C50A76C(0, v7[2] + 1, 1);
        v9 = v7[2];
        v8 = v7[3];
        if (v9 >= v8 >> 1)
          sub_21C50A76C((char *)(v8 > 1), v9 + 1, 1);
        v7[2] = v9 + 1;
        v10 = &v7[2 * v9];
        v10[4] = v11;
        *((_BYTE *)v10 + 40) = v12;
        goto LABEL_7;
      }
LABEL_14:
      v14 = sub_21C512870();
      swift_bridgeObjectRelease();
      if ((v14 & 1) != 0)
        goto LABEL_15;
LABEL_7:
      v6 += 16;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        if (v7[2])
          goto LABEL_18;
LABEL_20:
        swift_release();
        return 0;
      }
    }
  }
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!*(_QWORD *)(MEMORY[0x24BEE4AF8] + 16))
    goto LABEL_20;
LABEL_18:
  v2 = v7[4];
  swift_release();
  return v2;
}

uint64_t sub_21C50BD38()
{
  return sub_21C508D8C();
}

uint64_t sub_21C50BD5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22077DF50](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol()
{
  return &type metadata for QuotaServerProtocol;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.FetchOffers()
{
  return &type metadata for QuotaServerProtocol.FetchOffers;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.PushNotification()
{
  return &type metadata for QuotaServerProtocol.PushNotification;
}

ValueMetadata *type metadata accessor for QuotaServerProtocol.RefreshOfferDetails()
{
  return &type metadata for QuotaServerProtocol.RefreshOfferDetails;
}

unint64_t sub_21C50BDE0()
{
  unint64_t result;

  result = qword_255284888;
  if (!qword_255284888)
  {
    result = MEMORY[0x22077DF50](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_255284888);
  }
  return result;
}

uint64_t sub_21C50BE24()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21C50BE48()
{
  return swift_deallocObject();
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

uint64_t sub_21C50BE98(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21C50BED4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2708);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C50BF1C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id SharedInstance.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SharedInstance.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedInstance();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SharedInstance.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharedInstance();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s33iCloudSubscriptionOptimizerClient14SharedInstanceC3getSo08ISOQuotaD0CyFZ_0()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  objc_class *v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  objc_super v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v0 = (void *)qword_2540B2700;
  if (qword_2540B2700)
  {
    v1 = (id)qword_2540B2700;
  }
  else
  {
    v2 = sub_21C51224C();
    swift_allocObject();
    v3 = sub_21C512240();
    v14 = v2;
    v15 = MEMORY[0x24BEC7610];
    *(_QWORD *)&v13 = v3;
    type metadata accessor for ClientLibEvents();
    v4 = swift_allocObject();
    sub_21C501668(&v13, v4 + 16);
    if (qword_2540B2640 != -1)
      swift_once();
    qword_2540B2638 = v4;
    swift_release();
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for XpcQuotaClient()), sel_init);
    v6 = (objc_class *)type metadata accessor for MetricsQuotaClient();
    v7 = (char *)objc_allocWithZone(v6);
    *(_QWORD *)&v7[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_innerClient] = v5;
    *(_QWORD *)&v7[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient18MetricsQuotaClient_clientLibEvents] = qword_2540B2638;
    v12.receiver = v7;
    v12.super_class = v6;
    swift_retain();
    v8 = objc_msgSendSuper2(&v12, sel_init);
    v9 = (void *)qword_2540B2700;
    qword_2540B2700 = (uint64_t)v8;
    v1 = v8;

    v0 = 0;
  }
  v10 = v0;
  return v1;
}

uint64_t type metadata accessor for SharedInstance()
{
  return objc_opt_self();
}

uint64_t *sub_21C50C1AC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21C512228();
      if (!(*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(a2, 1, v6))
      {
        v14 = (char *)&loc_21C50C2DC + 4 * word_21C513690[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
      v15 = *(int *)(sub_21C512234() + 20);
      v16 = (char *)a1 + v15;
      v17 = (char *)a2 + v15;
      v18 = sub_21C5121C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    }
    else
    {
      v9 = sub_21C5121C8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
      v10 = *(int *)(sub_21C512348() + 20);
      v11 = (uint64_t *)((char *)a1 + v10);
      v12 = (uint64_t *)((char *)a2 + v10);
      v13 = v12[1];
      *v11 = *v12;
      v11[1] = v13;
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21C50CC70(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_21C512228();
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2))
    {
      switch(swift_getEnumCaseMultiPayload())
      {
        case 0u:
          v8 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
          sub_21C512348();
          goto LABEL_28;
        case 1u:
          v9 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
          sub_21C51233C();
          goto LABEL_28;
        case 2u:
          v10 = sub_21C5121C8();
          v11 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
          v11(a1, v10);
          v12 = a1 + *(int *)(sub_21C512414() + 28);
          v13 = sub_21C512468();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 48))(v12, 1, v13))
          {
            v11(v12, v10);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          goto LABEL_28;
        case 3u:
          swift_bridgeObjectRelease();
          v14 = sub_21C5123CC();
          goto LABEL_20;
        case 4u:
          v15 = sub_21C5121C8();
          v16 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8);
          v16(a1, v15);
          v17 = a1 + *(int *)(sub_21C5123D8() + 20);
          v18 = sub_21C5122DC();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v17, 1, v18))
          {
            v16(v17, v15);
            swift_release();
          }
          break;
        case 5u:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v19 = sub_21C512330();
          goto LABEL_24;
        case 6u:
        case 8u:
        case 0xAu:
        case 0xCu:
        case 0xEu:
          v7 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
          break;
        case 7u:
          v20 = sub_21C5121C8();
          v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 8);
          v21(a1, v20);
          v22 = a1 + *(int *)(sub_21C5125AC() + 20);
          v23 = sub_21C5123C0();
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v22, 1, v23))
            break;
          v21(v22, v20);
          goto LABEL_28;
        case 9u:
          swift_bridgeObjectRelease();
          v14 = sub_21C512594();
          goto LABEL_20;
        case 0xBu:
          swift_bridgeObjectRelease();
          v14 = sub_21C5125A0();
LABEL_20:
          v24 = *(int *)(v14 + 20);
          goto LABEL_25;
        case 0xDu:
          v25 = sub_21C5121C8();
          v26 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 8);
          v26(a1, v25);
          v27 = a1 + *(int *)(sub_21C5125B8() + 20);
          v28 = sub_21C51260C();
          if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v27, 1, v28))
          {
            swift_bridgeObjectRelease();
            v26(v27 + *(int *)(v28 + 20), v25);
          }
          break;
        case 0xFu:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v19 = sub_21C5125DC();
LABEL_24:
          v24 = *(int *)(v19 + 24);
LABEL_25:
          v29 = a1 + v24;
          v30 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v29, v30);
          break;
        case 0x10u:
          v31 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 8))(a1, v31);
          sub_21C512648();
          goto LABEL_28;
        case 0x11u:
          v32 = sub_21C5121C8();
          (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 8))(a1, v32);
          sub_21C5125E8();
LABEL_28:
          swift_bridgeObjectRelease();
          break;
        default:
          break;
      }
    }
    v3 = a1 + *(int *)(sub_21C512234() + 20);
    v4 = sub_21C5121C8();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  }
  else
  {
    v6 = sub_21C5121C8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    sub_21C512348();
    return swift_bridgeObjectRelease();
  }
}

char *sub_21C50D0E0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_21C512228();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a2, 1, v4))
    {
      v11 = (char *)&loc_21C50D1DC + 4 * word_21C5136C6[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    v12 = *(int *)(sub_21C512234() + 20);
    v13 = &a1[v12];
    v14 = &a2[v12];
    v15 = sub_21C5121C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  }
  else
  {
    v6 = sub_21C5121C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = *(int *)(sub_21C512348() + 20);
    v8 = &a1[v7];
    v9 = &a2[v7];
    v10 = *((_QWORD *)v9 + 1);
    *(_QWORD *)v8 = *(_QWORD *)v9;
    *((_QWORD *)v8 + 1) = v10;
    swift_bridgeObjectRetain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_21C50DB70(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  if (a1 != a2)
  {
    sub_21C50E678((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_21C512228();
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a2, 1, v4))
      {
        v10 = (char *)&loc_21C50DC84 + 4 * word_21C5136EA[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      v11 = *(int *)(sub_21C512234() + 20);
      v12 = &a1[v11];
      v13 = &a2[v11];
      v14 = sub_21C5121C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
    }
    else
    {
      v6 = sub_21C5121C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      v7 = *(int *)(sub_21C512348() + 20);
      v8 = &a1[v7];
      v9 = &a2[v7];
      *(_QWORD *)v8 = *(_QWORD *)v9;
      *((_QWORD *)v8 + 1) = *((_QWORD *)v9 + 1);
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21C50E678(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for XpcClientError();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for XpcClientError()
{
  uint64_t result;

  result = qword_255284938;
  if (!qword_255284938)
    return swift_getSingletonMetadata();
  return result;
}

char *sub_21C50E6F0(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_21C512228();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a2, 1, v4))
    {
      v8 = (char *)&loc_21C50E7E0 + 4 * word_21C51370E[swift_getEnumCaseMultiPayload()];
      __asm { BR              X10 }
    }
    v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
    v9 = *(int *)(sub_21C512234() + 20);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_21C5121C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  }
  else
  {
    v6 = sub_21C5121C8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    v7 = sub_21C512348();
    *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

char *sub_21C50F084(char *a1, char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (a1 != a2)
  {
    sub_21C50E678((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v4 = sub_21C512228();
      if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a2, 1, v4))
      {
        v8 = (char *)&loc_21C50F184 + 4 * word_21C513732[swift_getEnumCaseMultiPayload()];
        __asm { BR              X10 }
      }
      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      v9 = *(int *)(sub_21C512234() + 20);
      v10 = &a1[v9];
      v11 = &a2[v9];
      v12 = sub_21C5121C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    }
    else
    {
      v6 = sub_21C5121C8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      v7 = sub_21C512348();
      *(_OWORD *)&a1[*(int *)(v7 + 20)] = *(_OWORD *)&a2[*(int *)(v7 + 20)];
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_21C50FA28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_21C50FA34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21C50FA44()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21C50FA54()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_21C512348();
  if (v1 <= 0x3F)
  {
    result = sub_21C512234();
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t sub_21C50FAD4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_21C50FAE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_21C5121BC();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t sub_21C50FB34()
{
  uint64_t v0;

  v0 = sub_21C5126A8();
  __swift_allocate_value_buffer(v0, qword_2540B2610);
  __swift_project_value_buffer(v0, (uint64_t)qword_2540B2610);
  type metadata accessor for XpcQuotaClient();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540B2630);
  return sub_21C5126B4();
}

void sub_21C50FCF0(void *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_class *v23;
  char *v24;
  char *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  objc_super v35;

  v4 = v3;
  ObjectType = swift_getObjectType();
  v9 = sub_21C51221C();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_21C5123B4();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for NotificationContent();
  v15 = swift_dynamicCastClass();
  if (v15)
  {
    v30 = ObjectType;
    v31 = v4;
    v32 = a3;
    *(&v28 - 2) = MEMORY[0x24BDAC7A8](v15);
    sub_21C50BD5C(&qword_255284980, (uint64_t (*)(uint64_t))MEMORY[0x24BEC79C8], MEMORY[0x24BEC79B8]);
    v29 = a1;
    sub_21C5121D4();
    if (qword_2540B2628 != -1)
      swift_once();
    v16 = sub_21C5126A8();
    __swift_project_value_buffer(v16, (uint64_t)qword_2540B2610);
    v33 = 0;
    v34 = 0xE000000000000000;
    sub_21C512810();
    sub_21C512768();
    sub_21C512828();
    sub_21C512768();
    sub_21C512684();
    swift_bridgeObjectRelease();
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = a2;
    v18 = v30;
    v17[3] = v32;
    v17[4] = v18;
    MEMORY[0x24BDAC7A8](v17);
    *(&v28 - 2) = (uint64_t)v14;
    v19 = MEMORY[0x24BEC7548];
    sub_21C50BD5C(&qword_2540B24A0, (uint64_t (*)(uint64_t))MEMORY[0x24BEC7548], MEMORY[0x24BEC7538]);
    swift_retain();
    sub_21C5121D4();
    v20 = *(_QWORD *)(v31 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient + 24);
    v21 = *(_QWORD *)(v31 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v31 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient14XpcQuotaClient_protoClient), v20);
    (*(void (**)(char *, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v21 + 8))(v11, sub_21C5120F4, v17, v20, v21);

    swift_release();
    sub_21C5053CC((uint64_t)v11, (uint64_t (*)(_QWORD))v19);
    sub_21C5053CC((uint64_t)v14, (uint64_t (*)(_QWORD))MEMORY[0x24BEC79C8]);
  }
  else
  {
    sub_21C506630();
    v22 = swift_allocError();
    v23 = (objc_class *)type metadata accessor for NewOfferResponse();
    v24 = (char *)objc_allocWithZone(v23);
    v25 = &v24[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
    v26 = sub_21C512588();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v25, 1, 1, v26);
    *(_QWORD *)&v24[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = v22;
    v35.receiver = v24;
    v35.super_class = v23;
    v27 = objc_msgSendSuper2(&v35, sel_init);
    a2();

  }
}

uint64_t sub_21C5100AC(uint64_t a1, void (*a2)(id), uint64_t a3)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  uint64_t v25;
  uint64_t (*v26)(void);
  objc_class *v27;
  char *v28;
  char *v29;
  id v30;
  uint64_t (*v31)(void);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(id);
  uint64_t v37;
  objc_super v38;
  uint64_t v39;
  unint64_t v40;

  v35 = a3;
  v36 = a2;
  v4 = sub_21C512588();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21C512414();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v33 - v15;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v33 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v33 - v21;
  v37 = a1;
  sub_21C512054(a1, (uint64_t)&v33 - v21);
  v23 = sub_21C512228();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 48))(v22, 1, v23) != 1)
  {
    sub_21C512054((uint64_t)v22, (uint64_t)v20);
    if (swift_getEnumCaseMultiPayload() == 2)
    {
      sub_21C512130((uint64_t)v20, (uint64_t)v16, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7A90]);
      if (qword_2540B2628 != -1)
        swift_once();
      v34 = __swift_project_value_buffer(v8, (uint64_t)qword_2540B2610);
      v24 = MEMORY[0x24BEC8230];
      sub_21C50BF1C(v34, (uint64_t)v10, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
      v39 = 0;
      v40 = 0xE000000000000000;
      sub_21C512810();
      swift_bridgeObjectRelease();
      v39 = 0x6C65646F6D204C4DLL;
      v40 = 0xEF5B3D6465737520;
      sub_21C5123E4();
      sub_21C512768();
      swift_bridgeObjectRelease();
      sub_21C512768();
      sub_21C512684();
      swift_bridgeObjectRelease();
      sub_21C5053CC((uint64_t)v10, (uint64_t (*)(_QWORD))v24);
      v25 = sub_21C50BF1C((uint64_t)v16, (uint64_t)v14, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7A90]);
      MEMORY[0x24BDAC7A8](v25);
      *(&v33 - 2) = (uint64_t)v14;
      v26 = MEMORY[0x24BEC7CB8];
      sub_21C50BD5C(&qword_255284988, (uint64_t (*)(uint64_t))MEMORY[0x24BEC7CB8], MEMORY[0x24BEC7C90]);
      sub_21C5121D4();
      v27 = (objc_class *)type metadata accessor for NewOfferResponse();
      v28 = (char *)objc_allocWithZone(v27);
      v29 = &v28[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context];
      sub_21C50BF1C((uint64_t)v7, (uint64_t)&v28[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_context], (uint64_t (*)(_QWORD))v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v29, 0, 1, v4);
      *(_QWORD *)&v28[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient16NewOfferResponse_serverError] = 0;
      v38.receiver = v28;
      v38.super_class = v27;
      v30 = objc_msgSendSuper2(&v38, sel_init);
      sub_21C5053CC((uint64_t)v7, (uint64_t (*)(_QWORD))v26);
      v31 = MEMORY[0x24BEC7A90];
      sub_21C5053CC((uint64_t)v14, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7A90]);
      v36(v30);
      v39 = 0;
      v40 = 0xE000000000000000;
      sub_21C512810();
      sub_21C512768();
      sub_21C512234();
      sub_21C512828();
      sub_21C512768();
      sub_21C512684();

      swift_bridgeObjectRelease();
      sub_21C5053CC((uint64_t)v16, (uint64_t (*)(_QWORD))v31);
      return sub_21C50B608((uint64_t)v22, &qword_2540B24A8);
    }
    sub_21C5053CC((uint64_t)v20, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7558]);
  }
  if (qword_2540B2628 != -1)
    swift_once();
  __swift_project_value_buffer(v8, (uint64_t)qword_2540B2610);
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_21C512810();
  sub_21C512768();
  sub_21C512234();
  sub_21C512828();
  sub_21C512768();
  sub_21C51269C();
  swift_bridgeObjectRelease();
  return sub_21C50B608((uint64_t)v22, &qword_2540B24A8);
}

uint64_t sub_21C5105E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(_QWORD);
  uint64_t v7;

  v3 = sub_21C5123B4();
  MEMORY[0x24BDAC7A8](v3);
  sub_21C50BF1C(a2, (uint64_t)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  return sub_21C512210();
}

uint64_t sub_21C5106F0(uint64_t a1, void (*a2)(id))
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  objc_class *v18;
  char *v19;
  char v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;
  uint64_t v28;
  unint64_t v29;

  v4 = sub_21C51263C();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v27 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v27 - v14;
  sub_21C512054(a1, (uint64_t)&v27 - v14);
  v16 = sub_21C512228();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16) != 1)
  {
    sub_21C512054((uint64_t)v15, (uint64_t)v13);
    if (swift_getEnumCaseMultiPayload() == 6)
    {
      v17 = MEMORY[0x24BEC80C0];
      sub_21C512130((uint64_t)v13, (uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BEC80C0]);
      sub_21C50BF1C((uint64_t)v9, (uint64_t)v7, (uint64_t (*)(_QWORD))v17);
      v18 = (objc_class *)type metadata accessor for NotificationPendingResponse();
      v19 = (char *)objc_allocWithZone(v18);
      *(_QWORD *)&v19[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_responseError] = 0;
      v20 = sub_21C512624();
      v21 = 0;
      if ((v20 & 1) != 0)
        v21 = sub_21C512630();
      v22 = &v19[OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient27NotificationPendingResponse_maxDelayTsMillis];
      *(_QWORD *)v22 = v21;
      v22[8] = (v20 & 1) == 0;
      v27.receiver = v19;
      v27.super_class = v18;
      v23 = objc_msgSendSuper2(&v27, sel_init);
      sub_21C5053CC((uint64_t)v7, (uint64_t (*)(_QWORD))MEMORY[0x24BEC80C0]);
      a2(v23);
      if (qword_2540B2628 != -1)
        swift_once();
      v24 = sub_21C5126A8();
      __swift_project_value_buffer(v24, (uint64_t)qword_2540B2610);
      v28 = 0;
      v29 = 0xE000000000000000;
      sub_21C512810();
      sub_21C512768();
      sub_21C512234();
      sub_21C512828();
      sub_21C512768();
      sub_21C512684();

      swift_bridgeObjectRelease();
      sub_21C5053CC((uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BEC80C0]);
      return sub_21C50B608((uint64_t)v15, &qword_2540B24A8);
    }
    sub_21C5053CC((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7558]);
  }
  if (qword_2540B2628 != -1)
    swift_once();
  v25 = sub_21C5126A8();
  __swift_project_value_buffer(v25, (uint64_t)qword_2540B2610);
  v28 = 0;
  v29 = 0xE000000000000000;
  sub_21C512810();
  sub_21C512768();
  sub_21C512234();
  sub_21C512828();
  sub_21C512768();
  sub_21C51269C();
  swift_bridgeObjectRelease();
  return sub_21C50B608((uint64_t)v15, &qword_2540B24A8);
}

uint64_t sub_21C510AA8()
{
  uint64_t v0;

  v0 = sub_21C512600();
  MEMORY[0x24BDAC7A8](v0);
  sub_21C5125F4();
  return sub_21C512204();
}

uint64_t sub_21C510CFC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_21C5125D0();
  MEMORY[0x24BDAC7A8](v0);
  sub_21C50BD5C(&qword_2540B24B0, v1, MEMORY[0x24BEC7E90]);
  sub_21C5121D4();
  return sub_21C5121F8();
}

uint64_t sub_21C510DB0()
{
  return sub_21C5125C4();
}

uint64_t sub_21C510DE0(uint64_t a1, void (*a2)(void *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  int EnumCaseMultiPayload;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t (*v21)(void);
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(void);
  void *v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;

  v4 = sub_21C512348();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21C5125E8();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v28 - v14;
  sub_21C512054(a1, (uint64_t)&v28 - v14);
  v16 = sub_21C512228();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 48))(v15, 1, v16) == 1)
  {
LABEL_11:
    if (qword_2540B2628 != -1)
      swift_once();
    v23 = sub_21C5126A8();
    __swift_project_value_buffer(v23, (uint64_t)qword_2540B2610);
    v28 = 0;
    v29 = 0xE000000000000000;
    sub_21C512810();
    sub_21C512768();
    sub_21C512234();
    v24 = MEMORY[0x24BEC7600];
    sub_21C512828();
    sub_21C512768();
    sub_21C51269C();
    swift_bridgeObjectRelease();
    type metadata accessor for XpcClientError();
    sub_21C50BD5C(&qword_255284978, (uint64_t (*)(uint64_t))type metadata accessor for XpcClientError, (uint64_t)&unk_21C513774);
    v25 = (void *)swift_allocError();
    sub_21C50BF1C(a1, v26, (uint64_t (*)(_QWORD))v24);
    swift_storeEnumTagMultiPayload();
    a2(v25);

    return sub_21C50B608((uint64_t)v15, &qword_2540B24A8);
  }
  sub_21C512054((uint64_t)v15, (uint64_t)v13);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 17)
    {
      sub_21C512130((uint64_t)v13, (uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7EC8]);
      if (qword_2540B2628 != -1)
        swift_once();
      v18 = sub_21C5126A8();
      __swift_project_value_buffer(v18, (uint64_t)qword_2540B2610);
      v28 = 0;
      v29 = 0xE000000000000000;
      sub_21C512810();
      sub_21C512768();
      sub_21C512828();
      sub_21C512768();
      sub_21C512684();
      swift_bridgeObjectRelease();
      a2(0);
      sub_21C5053CC((uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7EC8]);
      return sub_21C50B608((uint64_t)v15, &qword_2540B24A8);
    }
    sub_21C5053CC((uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7558]);
    goto LABEL_11;
  }
  sub_21C512130((uint64_t)v13, (uint64_t)v6, (uint64_t (*)(_QWORD))MEMORY[0x24BEC78B8]);
  if (qword_2540B2628 != -1)
    swift_once();
  v19 = sub_21C5126A8();
  __swift_project_value_buffer(v19, (uint64_t)qword_2540B2610);
  v28 = 0;
  v29 = 0xE000000000000000;
  sub_21C512810();
  sub_21C512768();
  sub_21C512234();
  sub_21C512828();
  sub_21C512768();
  sub_21C51269C();
  swift_bridgeObjectRelease();
  type metadata accessor for XpcClientError();
  sub_21C50BD5C(&qword_255284978, (uint64_t (*)(uint64_t))type metadata accessor for XpcClientError, (uint64_t)&unk_21C513774);
  v20 = (void *)swift_allocError();
  v21 = MEMORY[0x24BEC78B8];
  sub_21C50BF1C((uint64_t)v6, v22, (uint64_t (*)(_QWORD))MEMORY[0x24BEC78B8]);
  swift_storeEnumTagMultiPayload();
  a2(v20);

  sub_21C5053CC((uint64_t)v6, (uint64_t (*)(_QWORD))v21);
  return sub_21C50B608((uint64_t)v15, &qword_2540B24A8);
}

id sub_21C511674()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for XpcQuotaClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for XpcQuotaClient()
{
  return objc_opt_self();
}

id sub_21C5116D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t (*v23)(void);
  id v24;
  uint64_t (*v25)(void);
  objc_class *v26;
  id v27;
  uint64_t v28;
  objc_class *v29;
  id v30;
  objc_super v32;
  objc_super v33;
  unint64_t v34;
  unint64_t v35;

  v2 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255284990);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v32 - v9;
  v11 = sub_21C512504();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v32 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v32 - v19;
  static QuotaServerProtocol.parse(fromFetchOffers:)(a1, (uint64_t)v10);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  if (v21(v10, 1, v11) != 1)
  {
    v25 = MEMORY[0x24BEC7BF8];
    sub_21C512130((uint64_t)v10, (uint64_t)v20, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7BF8]);
    sub_21C50BF1C((uint64_t)v20, (uint64_t)v18, (uint64_t (*)(_QWORD))v25);
    v26 = (objc_class *)type metadata accessor for NotificationContent();
    v27 = objc_allocWithZone(v26);
    sub_21C50BF1C((uint64_t)v18, (uint64_t)v27 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient19NotificationContent_context, (uint64_t (*)(_QWORD))v25);
    v32.receiver = v27;
    v32.super_class = v26;
    v24 = objc_msgSendSuper2(&v32, sel_init);
    sub_21C5053CC((uint64_t)v18, (uint64_t (*)(_QWORD))v25);
    v28 = (uint64_t)v20;
LABEL_8:
    sub_21C5053CC(v28, (uint64_t (*)(_QWORD))v25);
    return v24;
  }
  sub_21C50B608((uint64_t)v10, &qword_255284990);
  static QuotaServerProtocol.parse(fromPushNotification:)(a1, (uint64_t)v8);
  if (v21(v8, 1, v11) != 1)
  {
    v25 = MEMORY[0x24BEC7BF8];
    sub_21C512130((uint64_t)v8, (uint64_t)v15, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7BF8]);
    sub_21C50BF1C((uint64_t)v15, (uint64_t)v18, (uint64_t (*)(_QWORD))v25);
    v29 = (objc_class *)type metadata accessor for NotificationContent();
    v30 = objc_allocWithZone(v29);
    sub_21C50BF1C((uint64_t)v18, (uint64_t)v30 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient19NotificationContent_context, (uint64_t (*)(_QWORD))v25);
    v33.receiver = v30;
    v33.super_class = v29;
    v24 = objc_msgSendSuper2(&v33, sel_init);
    sub_21C5053CC((uint64_t)v18, (uint64_t (*)(_QWORD))v25);
    v28 = (uint64_t)v15;
    goto LABEL_8;
  }
  sub_21C50B608((uint64_t)v8, &qword_255284990);
  if (qword_2540B2628 != -1)
    swift_once();
  v22 = __swift_project_value_buffer(v2, (uint64_t)qword_2540B2610);
  v23 = MEMORY[0x24BEC8230];
  sub_21C50BF1C(v22, (uint64_t)v4, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
  v34 = 0;
  v35 = 0xE000000000000000;
  sub_21C512810();
  swift_bridgeObjectRelease();
  v34 = 0xD000000000000027;
  v35 = 0x800000021C5147D0;
  sub_21C5126FC();
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512768();
  v34 = 0xD000000000000031;
  v35 = 0x800000021C514790;
  sub_21C512768();
  swift_bridgeObjectRelease();
  sub_21C512684();
  swift_bridgeObjectRelease();
  sub_21C5053CC((uint64_t)v4, (uint64_t (*)(_QWORD))v23);
  return 0;
}

id sub_21C511AAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t v18;
  uint64_t (*v19)(void);
  id v20;
  id v21;
  uint64_t v22;
  uint64_t (*v23)(void);
  uint64_t v25;
  uint64_t (*v26)(void);
  uint64_t v27;
  uint64_t (*v28)(void);
  objc_class *v29;
  id v30;
  uint64_t (*v31)(void);
  objc_super v32;
  unint64_t v33;
  unint64_t v34;

  v4 = sub_21C512588();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24B8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21C512678();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_21C5126A8();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1 && a2 == 0xE000000000000000 || (sub_21C512870() & 1) != 0)
  {
    v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FailsafeDelayedOffer()), sel_init);
    if (qword_2540B2628 != -1)
      swift_once();
    v18 = __swift_project_value_buffer(v14, (uint64_t)qword_2540B2610);
    v19 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v18, (uint64_t)v16, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v33 = 91;
    v34 = 0xE100000000000000;
    v20 = objc_msgSend(v17, sel_newOfferResponse);
    v21 = objc_msgSend(v20, sel_toContext);

    sub_21C5126F0();
    sub_21C5126FC();
    sub_21C512768();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_21C512768();
    v33 = 0xD000000000000094;
    v34 = 0x800000021C514530;
    sub_21C512768();
    swift_bridgeObjectRelease();
    sub_21C512690();
    swift_bridgeObjectRelease();
    v22 = (uint64_t)v16;
    v23 = v19;
    goto LABEL_7;
  }
  sub_21C51251C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_21C50B608((uint64_t)v9, &qword_2540B24B8);
    if (qword_2540B2628 != -1)
      swift_once();
    v25 = __swift_project_value_buffer(v14, (uint64_t)qword_2540B2610);
    v26 = MEMORY[0x24BEC8230];
    sub_21C50BF1C(v25, (uint64_t)v16, (uint64_t (*)(_QWORD))MEMORY[0x24BEC8230]);
    v33 = 0;
    v34 = 0xE000000000000000;
    sub_21C512810();
    swift_bridgeObjectRelease();
    v33 = 0xD00000000000001DLL;
    v34 = 0x800000021C5144D0;
    sub_21C512768();
    sub_21C512768();
    sub_21C51269C();
    swift_bridgeObjectRelease();
    v27 = (uint64_t)v16;
    v28 = v26;
LABEL_21:
    sub_21C5053CC(v27, (uint64_t (*)(_QWORD))v28);
    return 0;
  }
  sub_21C512130((uint64_t)v9, (uint64_t)v13, (uint64_t (*)(_QWORD))MEMORY[0x24BEC81B0]);
  if ((sub_21C51266C() & 1) != 0)
  {
    v17 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for FailsafeDelayedOffer()), sel_init);
  }
  else
  {
    if ((sub_21C512660() & 1) == 0)
    {
      if (qword_2540B2628 != -1)
        swift_once();
      __swift_project_value_buffer(v14, (uint64_t)qword_2540B2610);
      v33 = 0;
      v34 = 0xE000000000000000;
      sub_21C512810();
      sub_21C512768();
      sub_21C512828();
      sub_21C512768();
      sub_21C51269C();
      swift_bridgeObjectRelease();
      v28 = MEMORY[0x24BEC81B0];
      v27 = (uint64_t)v13;
      goto LABEL_21;
    }
    sub_21C512654();
    v29 = (objc_class *)type metadata accessor for DelayedOffer();
    v30 = objc_allocWithZone(v29);
    v31 = MEMORY[0x24BEC7CB8];
    sub_21C50BF1C((uint64_t)v6, (uint64_t)v30 + OBJC_IVAR____TtC33iCloudSubscriptionOptimizerClient12DelayedOffer_context, (uint64_t (*)(_QWORD))MEMORY[0x24BEC7CB8]);
    v32.receiver = v30;
    v32.super_class = v29;
    v17 = objc_msgSendSuper2(&v32, sel_init);
    sub_21C5053CC((uint64_t)v6, (uint64_t (*)(_QWORD))v31);
  }
  v23 = MEMORY[0x24BEC81B0];
  v22 = (uint64_t)v13;
LABEL_7:
  sub_21C5053CC(v22, (uint64_t (*)(_QWORD))v23);
  return v17;
}

uint64_t sub_21C512000()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_21C512048(uint64_t a1)
{
  uint64_t v1;

  return sub_21C510DE0(a1, *(void (**)(void *))(v1 + 16));
}

uint64_t sub_21C512054(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540B24A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21C51209C(uint64_t a1)
{
  uint64_t v1;

  return sub_21C5106F0(a1, *(void (**)(id))(v1 + 16));
}

uint64_t sub_21C5120A8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_21C5120B8()
{
  return sub_21C505EB0();
}

uint64_t sub_21C5120D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C5120F4(uint64_t a1)
{
  uint64_t v1;

  return sub_21C5100AC(a1, *(void (**)(id))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21C512100(uint64_t a1)
{
  uint64_t v1;

  return sub_21C5105E8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21C512118()
{
  return sub_21C50561C();
}

uint64_t sub_21C512130(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_21C51218C()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21C512198()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21C5121A4()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21C5121B0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21C5121BC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21C5121C8()
{
  return MEMORY[0x24BE5BF10]();
}

uint64_t sub_21C5121D4()
{
  return MEMORY[0x24BE5C1F0]();
}

uint64_t sub_21C5121E0()
{
  return MEMORY[0x24BEC7500]();
}

uint64_t sub_21C5121EC()
{
  return MEMORY[0x24BEC7508]();
}

uint64_t sub_21C5121F8()
{
  return MEMORY[0x24BEC7528]();
}

uint64_t sub_21C512204()
{
  return MEMORY[0x24BEC7530]();
}

uint64_t sub_21C512210()
{
  return MEMORY[0x24BEC7540]();
}

uint64_t sub_21C51221C()
{
  return MEMORY[0x24BEC7548]();
}

uint64_t sub_21C512228()
{
  return MEMORY[0x24BEC7558]();
}

uint64_t sub_21C512234()
{
  return MEMORY[0x24BEC7600]();
}

uint64_t sub_21C512240()
{
  return MEMORY[0x24BEC7618]();
}

uint64_t sub_21C51224C()
{
  return MEMORY[0x24BEC7620]();
}

uint64_t sub_21C512258()
{
  return MEMORY[0x24BEC7628]();
}

uint64_t sub_21C512264()
{
  return MEMORY[0x24BEC7630]();
}

uint64_t sub_21C512270()
{
  return MEMORY[0x24BEC7638]();
}

uint64_t sub_21C51227C()
{
  return MEMORY[0x24BEC7650]();
}

uint64_t sub_21C512288()
{
  return MEMORY[0x24BEC7658]();
}

uint64_t sub_21C512294()
{
  return MEMORY[0x24BEC7668]();
}

uint64_t sub_21C5122A0()
{
  return MEMORY[0x24BEC7670]();
}

uint64_t sub_21C5122AC()
{
  return MEMORY[0x24BEC7678]();
}

uint64_t sub_21C5122B8()
{
  return MEMORY[0x24BEC7680]();
}

uint64_t sub_21C5122C4()
{
  return MEMORY[0x24BEC7688]();
}

uint64_t sub_21C5122D0()
{
  return MEMORY[0x24BEC7698]();
}

uint64_t sub_21C5122DC()
{
  return MEMORY[0x24BEC77B8]();
}

uint64_t sub_21C5122E8()
{
  return MEMORY[0x24BEC7810]();
}

uint64_t sub_21C5122F4()
{
  return MEMORY[0x24BEC7818]();
}

uint64_t sub_21C512300()
{
  return MEMORY[0x24BEC7828]();
}

uint64_t sub_21C51230C()
{
  return MEMORY[0x24BEC7830]();
}

uint64_t sub_21C512318()
{
  return MEMORY[0x24BEC7838]();
}

uint64_t _s33iCloudSubscriptionOptimizerClient0D8LibEventCfd_0()
{
  return MEMORY[0x24BEC7848]();
}

uint64_t sub_21C512330()
{
  return MEMORY[0x24BEC7880]();
}

uint64_t sub_21C51233C()
{
  return MEMORY[0x24BEC7898]();
}

uint64_t sub_21C512348()
{
  return MEMORY[0x24BEC78B8]();
}

uint64_t sub_21C512354()
{
  return MEMORY[0x24BEC78D0]();
}

uint64_t sub_21C512360()
{
  return MEMORY[0x24BEC78D8]();
}

uint64_t sub_21C51236C()
{
  return MEMORY[0x24BEC7908]();
}

uint64_t sub_21C512378()
{
  return MEMORY[0x24BEC7918]();
}

uint64_t sub_21C512384()
{
  return MEMORY[0x24BEC7980]();
}

uint64_t sub_21C512390()
{
  return MEMORY[0x24BEC7990]();
}

uint64_t sub_21C51239C()
{
  return MEMORY[0x24BEC79A0]();
}

uint64_t sub_21C5123A8()
{
  return MEMORY[0x24BEC79B0]();
}

uint64_t sub_21C5123B4()
{
  return MEMORY[0x24BEC79C8]();
}

uint64_t sub_21C5123C0()
{
  return MEMORY[0x24BEC7A00]();
}

uint64_t sub_21C5123CC()
{
  return MEMORY[0x24BEC7A20]();
}

uint64_t sub_21C5123D8()
{
  return MEMORY[0x24BEC7A38]();
}

uint64_t sub_21C5123E4()
{
  return MEMORY[0x24BEC7A40]();
}

uint64_t sub_21C5123F0()
{
  return MEMORY[0x24BEC7A50]();
}

uint64_t sub_21C5123FC()
{
  return MEMORY[0x24BEC7A68]();
}

uint64_t sub_21C512408()
{
  return MEMORY[0x24BEC7A80]();
}

uint64_t sub_21C512414()
{
  return MEMORY[0x24BEC7A90]();
}

uint64_t sub_21C512420()
{
  return MEMORY[0x24BEC7AA0]();
}

uint64_t sub_21C51242C()
{
  return MEMORY[0x24BEC7AA8]();
}

uint64_t sub_21C512438()
{
  return MEMORY[0x24BEC7AB0]();
}

uint64_t sub_21C512444()
{
  return MEMORY[0x24BEC7AB8]();
}

uint64_t sub_21C512450()
{
  return MEMORY[0x24BEC7AC8]();
}

uint64_t sub_21C51245C()
{
  return MEMORY[0x24BEC7AD0]();
}

uint64_t sub_21C512468()
{
  return MEMORY[0x24BEC7AE0]();
}

uint64_t sub_21C512474()
{
  return MEMORY[0x24BEC7B90]();
}

uint64_t sub_21C512480()
{
  return MEMORY[0x24BEC7B98]();
}

uint64_t sub_21C51248C()
{
  return MEMORY[0x24BEC7BA0]();
}

uint64_t sub_21C512498()
{
  return MEMORY[0x24BEC7BA8]();
}

uint64_t sub_21C5124A4()
{
  return MEMORY[0x24BEC7BB0]();
}

uint64_t sub_21C5124B0()
{
  return MEMORY[0x24BEC7BB8]();
}

uint64_t sub_21C5124BC()
{
  return MEMORY[0x24BEC7BC0]();
}

uint64_t sub_21C5124C8()
{
  return MEMORY[0x24BEC7BC8]();
}

uint64_t sub_21C5124D4()
{
  return MEMORY[0x24BEC7BD0]();
}

uint64_t sub_21C5124E0()
{
  return MEMORY[0x24BEC7BE0]();
}

uint64_t sub_21C5124EC()
{
  return MEMORY[0x24BEC7BE8]();
}

uint64_t sub_21C5124F8()
{
  return MEMORY[0x24BEC7BF0]();
}

uint64_t sub_21C512504()
{
  return MEMORY[0x24BEC7BF8]();
}

uint64_t sub_21C512510()
{
  return MEMORY[0x24BEC7C10]();
}

uint64_t sub_21C51251C()
{
  return MEMORY[0x24BEC7C18]();
}

uint64_t sub_21C512528()
{
  return MEMORY[0x24BEC7C70]();
}

uint64_t sub_21C512534()
{
  return MEMORY[0x24BEC7C78]();
}

uint64_t sub_21C512540()
{
  return MEMORY[0x24BEC7C80]();
}

uint64_t sub_21C51254C()
{
  return MEMORY[0x24BEC7C88]();
}

uint64_t sub_21C512558()
{
  return MEMORY[0x24BEC7C98]();
}

uint64_t sub_21C512564()
{
  return MEMORY[0x24BEC7CA0]();
}

uint64_t sub_21C512570()
{
  return MEMORY[0x24BEC7CA8]();
}

uint64_t sub_21C51257C()
{
  return MEMORY[0x24BEC7CB0]();
}

uint64_t sub_21C512588()
{
  return MEMORY[0x24BEC7CB8]();
}

uint64_t sub_21C512594()
{
  return MEMORY[0x24BEC7D40]();
}

uint64_t sub_21C5125A0()
{
  return MEMORY[0x24BEC7D50]();
}

uint64_t sub_21C5125AC()
{
  return MEMORY[0x24BEC7D68]();
}

uint64_t sub_21C5125B8()
{
  return MEMORY[0x24BEC7D80]();
}

uint64_t sub_21C5125C4()
{
  return MEMORY[0x24BEC7E70]();
}

uint64_t sub_21C5125D0()
{
  return MEMORY[0x24BEC7E98]();
}

uint64_t sub_21C5125DC()
{
  return MEMORY[0x24BEC7EB0]();
}

uint64_t sub_21C5125E8()
{
  return MEMORY[0x24BEC7EC8]();
}

uint64_t sub_21C5125F4()
{
  return MEMORY[0x24BEC8038]();
}

uint64_t sub_21C512600()
{
  return MEMORY[0x24BEC8040]();
}

uint64_t sub_21C51260C()
{
  return MEMORY[0x24BEC8058]();
}

uint64_t sub_21C512618()
{
  return MEMORY[0x24BEC8088]();
}

uint64_t sub_21C512624()
{
  return MEMORY[0x24BEC8090]();
}

uint64_t sub_21C512630()
{
  return MEMORY[0x24BEC80A8]();
}

uint64_t sub_21C51263C()
{
  return MEMORY[0x24BEC80C0]();
}

uint64_t sub_21C512648()
{
  return MEMORY[0x24BEC8120]();
}

uint64_t sub_21C512654()
{
  return MEMORY[0x24BEC8188]();
}

uint64_t sub_21C512660()
{
  return MEMORY[0x24BEC8198]();
}

uint64_t sub_21C51266C()
{
  return MEMORY[0x24BEC81A0]();
}

uint64_t sub_21C512678()
{
  return MEMORY[0x24BEC81B0]();
}

uint64_t sub_21C512684()
{
  return MEMORY[0x24BEC8208]();
}

uint64_t sub_21C512690()
{
  return MEMORY[0x24BEC8218]();
}

uint64_t sub_21C51269C()
{
  return MEMORY[0x24BEC8228]();
}

uint64_t sub_21C5126A8()
{
  return MEMORY[0x24BEC8230]();
}

uint64_t sub_21C5126B4()
{
  return MEMORY[0x24BEC8238]();
}

uint64_t sub_21C5126C0()
{
  return MEMORY[0x24BEC82E0]();
}

uint64_t sub_21C5126CC()
{
  return MEMORY[0x24BEC82E8]();
}

uint64_t sub_21C5126D8()
{
  return MEMORY[0x24BEC8330]();
}

uint64_t sub_21C5126E4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21C5126F0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21C5126FC()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21C512708()
{
  return MEMORY[0x24BEE06E8]();
}

uint64_t sub_21C512714()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21C512720()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C51272C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21C512738()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21C512744()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21C512750()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C51275C()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_21C512768()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21C512774()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21C512780()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21C51278C()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21C512798()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21C5127A4()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21C5127B0()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21C5127BC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21C5127C8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21C5127D4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21C5127E0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21C5127EC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21C5127F8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21C512804()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21C512810()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21C51281C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C512828()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21C512834()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21C512840()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21C51284C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21C512858()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21C512864()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21C512870()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C51287C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21C512888()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21C512894()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21C5128A0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21C5128AC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21C5128B8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C5128C4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21C5128D0()
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

