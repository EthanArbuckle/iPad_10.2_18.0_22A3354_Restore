void type metadata accessor for SUIBAttendingStopReason(uint64_t a1)
{
  sub_24744C8B4(a1, &qword_2576A57A0);
}

void type metadata accessor for AFUIBridgeAttendingStopReason(uint64_t a1)
{
  sub_24744C8B4(a1, &qword_2576A57A8);
}

void type metadata accessor for SUIBMitigationResult(uint64_t a1)
{
  sub_24744C8B4(a1, (unint64_t *)&unk_2576A5870);
}

void sub_24744C8B4(uint64_t a1, unint64_t *a2)
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

uint64_t static IntelligenceFlowActionSummaryParameterMatcher.matches(in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE v11[16];
  uint64_t v12;
  uint64_t v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5940);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v11[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = a1;
  v13 = a2;
  sub_24745C470();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5948);
  sub_24744CA5C();
  sub_24744CF18(&qword_2576A5958, &qword_2576A5940, MEMORY[0x24BEE7460]);
  v8 = sub_24745C7F4();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  swift_bridgeObjectRetain();
  v9 = sub_24744CADC(v8, a1, a2);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957B758]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_24744CA5C()
{
  unint64_t result;

  result = qword_2576A5950;
  if (!qword_2576A5950)
  {
    result = MEMORY[0x24957B770](MEMORY[0x24BEE0D18], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A5950);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957B764](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24744CADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5A08);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2576A5968) - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a1 + 16);
  if (v13)
  {
    v19 = v3;
    v23 = MEMORY[0x24BEE4AF8];
    v21 = v10;
    v22 = a2;
    sub_24745C95C();
    v14 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v20 = *(_QWORD *)(v9 + 72);
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    do
    {
      v15(v12, v14, v21);
      swift_bridgeObjectRetain();
      sub_24745C47C();
      v16 = objc_allocWithZone((Class)type metadata accessor for BridgedMatch());
      sub_24744CD64((uint64_t)v12, v22, a3, (uint64_t)v8);
      sub_24745C944();
      sub_24745C968();
      sub_24745C974();
      sub_24745C950();
      v14 += v20;
      --v13;
    }
    while (v13);
    v17 = v23;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v17;
}

id IntelligenceFlowActionSummaryParameterMatcher.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher()
{
  return objc_opt_self();
}

id IntelligenceFlowActionSummaryParameterMatcher.__deallocating_deinit(uint64_t a1)
{
  return sub_24744D0F4(a1, type metadata accessor for IntelligenceFlowActionSummaryParameterMatcher);
}

id sub_24744CD64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  objc_super v18;

  v9 = &v4[OBJC_IVAR___SUIBBridgedMatch_match];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5968);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v9, a1, v10);
  v12 = &v4[OBJC_IVAR___SUIBBridgedMatch_originalString];
  *(_QWORD *)v12 = a2;
  *((_QWORD *)v12 + 1) = a3;
  v13 = &v4[OBJC_IVAR___SUIBBridgedMatch_captureReference];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5A08);
  v15 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, a4, v14);
  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for BridgedMatch();
  v16 = objc_msgSendSuper2(&v18, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a4, v14);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  return v16;
}

uint64_t sub_24744CE68()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5968);
  sub_24745C71C();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5978);
  sub_24744CF18(&qword_2576A5980, &qword_2576A5978, MEMORY[0x24BEE1BC0]);
  sub_24744CF58();
  return sub_24745C8E4();
}

uint64_t sub_24744CF18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24957B770](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_24744CF58()
{
  unint64_t result;

  result = qword_2576A5988;
  if (!qword_2576A5988)
  {
    result = MEMORY[0x24957B770](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A5988);
  }
  return result;
}

uint64_t sub_24744CFD4()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5968);
  sub_24745C710();
  return v1;
}

id BridgedMatch.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void BridgedMatch.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id BridgedMatch.__deallocating_deinit()
{
  return sub_24744D0F4(0, type metadata accessor for BridgedMatch);
}

id sub_24744D0F4(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for BridgedMatch()
{
  uint64_t result;

  result = qword_2576A59E8;
  if (!qword_2576A59E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24744D1E0()
{
  return type metadata accessor for BridgedMatch();
}

void sub_24744D1E8()
{
  unint64_t v0;
  unint64_t v1;

  sub_24744D2BC();
  if (v0 <= 0x3F)
  {
    sub_24744D314();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for BridgedMatch()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of BridgedMatch.range()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of BridgedMatch.captured()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

void sub_24744D2BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576A59F8)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2576A5948);
    v0 = sub_24745C728();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576A59F8);
  }
}

void sub_24744D314()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2576A5A00)
  {
    v0 = sub_24745C464();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2576A5A00);
  }
}

void sub_24744D360()
{
  qword_254447EF0 = 0x6567646972424955;
  *(_QWORD *)algn_254447EF8 = 0xE800000000000000;
}

uint64_t sub_24744D384()
{
  uint64_t v0;

  v0 = sub_24745C7A0();
  __swift_allocate_value_buffer(v0, qword_254447F40);
  __swift_project_value_buffer(v0, (uint64_t)qword_254447F40);
  sub_24744D948();
  if (qword_254447BF0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_24745C8F0();
  return sub_24745C7AC();
}

void sub_24744D444(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  static SignpostLogger.begin(_:enableTelemetry:)(a1, a2, a3, a4, a5, a6);
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 1) != 0)
    sub_24744D7B0(a1, a2, a3, a5, a6);
  else
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
}

void sub_24744D4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(a1, a2, a3, a4, a5, a6 & 0x1FF, a7, a8);
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8)
{
  void *v11;
  uint64_t v12;
  id v13;

  OUTLINED_FUNCTION_0();
  sub_24745C770();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_24745C8CC();
    v13 = (id)OUTLINED_FUNCTION_0();
    OUTLINED_FUNCTION_2();
    sub_24745C764();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_24745C8CC();
    v11 = (void *)OUTLINED_FUNCTION_0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5A10);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_24745D710;
    *(_QWORD *)(v12 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v12 + 64) = sub_24744D87C();
    *(_QWORD *)(v12 + 32) = a7;
    *(_QWORD *)(v12 + 40) = a8;
    OUTLINED_FUNCTION_2();
    sub_24745C758();

    swift_bridgeObjectRelease();
  }
}

void sub_24744D628()
{
  static SignpostLogger.end(_:_:)();
}

void static SignpostLogger.end(_:_:)()
{
  id v0;

  sub_24745C8C0();
  v0 = (id)OUTLINED_FUNCTION_1();
  sub_24745C764();

}

uint64_t sub_24744D6C4()
{
  return static SignpostLogger.event(_:)();
}

uint64_t static SignpostLogger.event(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t v6;

  v0 = sub_24745C788();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C8D8();
  v4 = (void *)OUTLINED_FUNCTION_1();
  sub_24745C77C();
  sub_24745C764();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

void sub_24744D7B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(uint64_t, uint64_t);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_24745C770();
  sub_24745C8CC();
  v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_24745C758();

}

unint64_t sub_24744D87C()
{
  unint64_t result;

  result = qword_2576A5A18;
  if (!qword_2576A5A18)
  {
    result = MEMORY[0x24957B770](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576A5A18);
  }
  return result;
}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
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

unint64_t sub_24744D948()
{
  unint64_t result;

  result = qword_254447E68;
  if (!qword_254447E68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254447E68);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0);
}

uint64_t UIBridge.__allocating_init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  swift_allocObject();
  return UIBridge.init(_:_:_:_:_:_:)(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t UIBridge.init(_:_:_:_:_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, void *a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v24;
  _BYTE v25[40];

  v9 = v7;
  v13 = sub_24745C7A0();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4();
  v15 = objc_allocWithZone((Class)type metadata accessor for UIBridgeService());
  swift_retain();
  v16 = a7;
  swift_unknownObjectRetain();
  *(_QWORD *)(v9 + qword_254447C18) = sub_2474509E0();
  swift_release();
  OUTLINED_FUNCTION_4();
  v24 = a6;
  sub_24744E668(a6, (uint64_t)v25);
  v17 = qword_254447E18;
  v18 = v16;
  swift_unknownObjectRetain();
  v19 = a5;
  if (v17 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v13, (uint64_t)qword_254447F40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v8, v20, v13);
  v21 = sub_24745C74C();
  swift_retain();
  sub_24744DBE4();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v24);
  __swift_destroy_boxed_opaque_existential_1(a3);
  return v21;
}

uint64_t sub_24744DBE4()
{
  sub_24745C4AC();
  OUTLINED_FUNCTION_0_0();
  sub_24745C494();
  OUTLINED_FUNCTION_0_0();
  sub_24745C4F4();
  OUTLINED_FUNCTION_0_0();
  sub_24745C4A0();
  OUTLINED_FUNCTION_0_0();
  sub_24745C488();
  OUTLINED_FUNCTION_0_0();
  sub_24745C5A8();
  OUTLINED_FUNCTION_0_0();
  sub_24745C5C0();
  OUTLINED_FUNCTION_0_0();
  sub_24745C6B0();
  OUTLINED_FUNCTION_0_0();
  sub_24745C530();
  OUTLINED_FUNCTION_0_0();
  sub_24745C5D8();
  OUTLINED_FUNCTION_0_0();
  sub_24745C5FC();
  OUTLINED_FUNCTION_0_0();
  sub_24745C4DC();
  OUTLINED_FUNCTION_0_0();
  sub_24745C4C4();
  OUTLINED_FUNCTION_0_0();
  sub_24745C638();
  OUTLINED_FUNCTION_0_0();
  sub_24745C5F0();
  OUTLINED_FUNCTION_0_0();
  sub_24745C62C();
  OUTLINED_FUNCTION_0_0();
  sub_24745C524();
  return sub_24745C734();
}

uint64_t (*sub_24744DD8C())()
{
  swift_retain();
  return sub_24744E820;
}

uint64_t (*sub_24744DDC0())()
{
  swift_retain();
  return sub_24744E81C;
}

void (*sub_24744DDF4())()
{
  swift_retain();
  return sub_24744E814;
}

void sub_24744DE24()
{
  sub_2474511E0();
}

void (*sub_24744DE50())()
{
  swift_retain();
  return sub_24744E80C;
}

void sub_24744DE80()
{
  sub_2474511FC();
}

void (*sub_24744DEAC())()
{
  swift_retain();
  return sub_24744E804;
}

void sub_24744DEDC()
{
  sub_24745143C();
}

void (*sub_24744DF08())()
{
  swift_retain();
  return sub_24744E7FC;
}

void sub_24744DF38()
{
  sub_247451458();
}

void (*sub_24744DF64())()
{
  swift_retain();
  return sub_24744E7F4;
}

void sub_24744DF94()
{
  sub_247451474();
}

void (*sub_24744DFC0())()
{
  swift_retain();
  return sub_24744E7EC;
}

void sub_24744DFF0()
{
  sub_2474514C8();
}

void (*sub_24744E01C())()
{
  swift_retain();
  return sub_24744E7E4;
}

void sub_24744E04C()
{
  sub_2474514E4();
}

void (*sub_24744E078())()
{
  swift_retain();
  return sub_24744E7DC;
}

void sub_24744E0A8()
{
  sub_247451500();
}

void (*sub_24744E0D4())()
{
  swift_retain();
  return sub_24744E7D4;
}

void sub_24744E104()
{
  sub_24745151C();
}

void (*sub_24744E130())()
{
  swift_retain();
  return sub_24744E7CC;
}

void sub_24744E160()
{
  sub_247451538();
}

void (*sub_24744E18C())()
{
  swift_retain();
  return sub_24744E7C4;
}

void sub_24744E1BC()
{
  sub_247451554();
}

void (*sub_24744E1E8())()
{
  swift_retain();
  return sub_24744E7BC;
}

void sub_24744E218()
{
  sub_247451570();
}

void (*sub_24744E244())()
{
  swift_retain();
  return sub_24744E7B4;
}

void sub_24744E274()
{
  sub_24745158C();
}

void (*sub_24744E2A0())()
{
  swift_retain();
  return sub_24744E7AC;
}

void sub_24744E2D0()
{
  sub_247451490();
}

void (*sub_24744E2FC())()
{
  swift_retain();
  return sub_24744E7A4;
}

void sub_24744E32C()
{
  sub_2474514AC();
}

uint64_t sub_24744E358(void *a1)
{
  return sub_24744E380(a1, "Handling SessionStartedMessage for session id: %s", (uint64_t (*)(id))sub_247450C7C);
}

uint64_t sub_24744E36C(void *a1)
{
  return sub_24744E380(a1, "Handling SessionEndedMessage for session id: %s", (uint64_t (*)(id))sub_247450DA4);
}

uint64_t sub_24744E380(void *a1, const char *a2, uint64_t (*a3)(id))
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v7 = sub_24745C458();
  v17 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_0();
  if (qword_254447E18 != -1)
    swift_once();
  v8 = sub_24745C7A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
  v9 = a1;
  v10 = sub_24745C794();
  v11 = sub_24745C878();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    *(_DWORD *)v12 = 136315138;
    sub_24745C680();
    sub_24744E764();
    v13 = sub_24745C9A4();
    v15 = v14;
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v3, v7);
    sub_247454954(v13, v15, &v18);
    sub_24745C8FC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247449000, v10, v11, a2, v12, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  return a3(v9);
}

void UIBridge.__allocating_init(_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void UIBridge.init(_:_:_:_:_:_:_:)()
{
  OUTLINED_FUNCTION_1_0();
  __break(1u);
}

void sub_24744E5E8()
{
  uint64_t v0;

}

uint64_t UIBridge.deinit()
{
  uint64_t v0;

  v0 = sub_24745C740();

  return v0;
}

uint64_t UIBridge.__deallocating_deinit()
{

  return swift_deallocClassInstance();
}

uint64_t sub_24744E668(uint64_t a1, uint64_t a2)
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

uint64_t type metadata accessor for UIBridge()
{
  uint64_t result;

  result = qword_254447B38;
  if (!qword_254447B38)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24744E704()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for UIBridge()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_24744E75C()
{
  return type metadata accessor for UIBridge();
}

unint64_t sub_24744E764()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447C00;
  if (!qword_254447C00)
  {
    v1 = sub_24745C458();
    result = MEMORY[0x24957B770](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_254447C00);
  }
  return result;
}

void sub_24744E7A4()
{
  sub_24744E32C();
}

void sub_24744E7AC()
{
  sub_24744E2D0();
}

void sub_24744E7B4()
{
  sub_24744E274();
}

void sub_24744E7BC()
{
  sub_24744E218();
}

void sub_24744E7C4()
{
  sub_24744E1BC();
}

void sub_24744E7CC()
{
  sub_24744E160();
}

void sub_24744E7D4()
{
  sub_24744E104();
}

void sub_24744E7DC()
{
  sub_24744E0A8();
}

void sub_24744E7E4()
{
  sub_24744E04C();
}

void sub_24744E7EC()
{
  sub_24744DFF0();
}

void sub_24744E7F4()
{
  sub_24744DF94();
}

void sub_24744E7FC()
{
  sub_24744DF38();
}

void sub_24744E804()
{
  sub_24744DEDC();
}

void sub_24744E80C()
{
  sub_24744DE80();
}

void sub_24744E814()
{
  sub_24744DE24();
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_24745C734();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return _swift_stdlib_reportUnimplementedInitializer();
}

void OUTLINED_FUNCTION_3()
{
  JUMPOUT(0x24957B7F4);
}

uint64_t OUTLINED_FUNCTION_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24744E668(v0, v1 - 120);
}

uint64_t SUIBUIBridgeClient.init(delegate:)(uint64_t a1)
{
  uint64_t v1;

  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_2_1()), sel_initWithDelegate_, a1);
  OUTLINED_FUNCTION_0_1();
  return v1;
}

void *SUIBUIBridgeClient.init(delegate:)(uint64_t a1)
{
  void *v1;

  objc_msgSend(v1, sel_initWithDelegate_delegateQueue_, a1, 0);
  OUTLINED_FUNCTION_0_1();
  return v1;
}

id SUIBUIBridgeClient.init(delegate:delegateQueue:)(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_2_1()), sel_initWithDelegate_delegateQueue_, a1, a2);
  swift_unknownObjectRelease();

  return v3;
}

uint64_t SUIBUIBridgeClient.init(delegate:delegateQueue:)(uint64_t a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  objc_super v12;

  v3 = v2;
  *(_QWORD *)&v3[OBJC_IVAR___SUIBUIBridgeClient_connection] = 0;
  v5 = OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper;
  *(_QWORD *)&v3[OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper] = 0;
  objc_allocWithZone((Class)type metadata accessor for UIBridgeServiceDelegateWrapper());
  v6 = a2;
  v7 = v3;
  v8 = swift_unknownObjectRetain();
  v9 = sub_247455CEC(v8, (uint64_t)a2);
  v10 = *(_QWORD *)&v3[v5];
  *(_QWORD *)&v3[v5] = v9;

  swift_unknownObjectRelease();
  v12.receiver = v7;
  v12.super_class = (Class)SUIBUIBridgeClient;
  objc_msgSendSuper2(&v12, sel_init);
  OUTLINED_FUNCTION_0_1();

  return v10;
}

id sub_24744EA80()
{
  void *v0;
  objc_super v2;

  sub_24744EAB8();
  v2.receiver = v0;
  v2.super_class = (Class)SUIBUIBridgeClient;
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_24744EAB8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = OBJC_IVAR___SUIBUIBridgeClient_connection;
  v2 = *(void **)(v0 + OBJC_IVAR___SUIBUIBridgeClient_connection);
  if (v2)
  {
    objc_msgSend(v2, sel_setInvalidationHandler_, 0);
    v2 = *(void **)(v0 + v1);
    if (v2)
    {
      objc_msgSend(v2, sel_invalidate);
      v2 = *(void **)(v0 + v1);
    }
  }
  *(_QWORD *)(v0 + v1) = 0;

}

Swift::Void __swiftcall SUIBUIBridgeClient.preheat()()
{
  sub_24744EFB0((SEL *)&selRef_preheat);
}

uint64_t sub_24744EB70()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[2];

  v1 = sub_24745C7A0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_24744F030();
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_remoteObjectProxy);

    sub_24745C914();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447BA8);
    if ((swift_dynamicCast() & 1) != 0)
      return v19;
  }
  if (qword_254447E18 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v1, (uint64_t)qword_254447F40);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v9, v1);
  v10 = v0;
  v11 = sub_24745C794();
  v12 = sub_24745C884();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v19 = v14;
    *(_DWORD *)v13 = 136315138;
    v15 = sub_24744F030();
    if (v15)
    {
      v16 = v15;
      v17 = objc_msgSend(v15, sel_remoteObjectProxy);

      sub_24745C914();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v20, 0, sizeof(v20));
    }
    sub_24744F960((uint64_t)v20);
    *(_QWORD *)&v20[0] = sub_247454954(0x6C616E6F6974704FLL, 0xED00003E796E413CLL, &v19);
    sub_24745C8FC();

    _os_log_impl(&dword_247449000, v11, v12, "Unexpected remoteObjectProxy type for UIBridge connection %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957B7F4](v14, -1, -1);
    MEMORY[0x24957B7F4](v13, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return 0;
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriDismissed()()
{
  sub_24744EFB0((SEL *)&selRef_siriDismissed);
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriPrompted()()
{
  sub_24744EFB0((SEL *)&selRef_siriPrompted);
}

void *SUIBUIBridgeClient.stopAttending(for:)(uint64_t a1)
{
  void *result;

  result = (void *)sub_24744EB70();
  if (result)
  {
    objc_msgSend(result, sel_stopAttendingForReason_, a1);
    return (void *)OUTLINED_FUNCTION_1_1();
  }
  return result;
}

Swift::Void __swiftcall SUIBUIBridgeClient.siriWillPrompt()()
{
  sub_24744EFB0((SEL *)&selRef_siriWillPrompt);
}

Swift::Void __swiftcall SUIBUIBridgeClient.startAttending()()
{
  sub_24744EFB0((SEL *)&selRef_startAttending);
}

void *sub_24744EFB0(SEL *a1)
{
  void *result;

  result = (void *)sub_24744EB70();
  if (result)
  {
    objc_msgSend(result, *a1);
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

void *sub_24744F030()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  uint64_t aBlock;
  uint64_t v38;
  uint64_t (*v39)(uint64_t);
  void *v40;
  void (*v41)();
  uint64_t v42;

  v1 = v0;
  v2 = OBJC_IVAR___SUIBUIBridgeClient_connection;
  if (!*(_QWORD *)(v0 + OBJC_IVAR___SUIBUIBridgeClient_connection))
  {
    sub_24744F9A0(0, &qword_254447AF0);
    v3 = sub_24744F5C8(0xD000000000000024, 0x800000024745DD20, 0);
    v4 = *(void **)(v0 + v2);
    *(_QWORD *)(v0 + v2) = v3;

    v5 = *(void **)(v0 + v2);
    if (v5)
    {
      v6 = (void *)objc_opt_self();
      v7 = v5;
      v8 = objc_msgSend(v6, sel_interfaceWithProtocol_, &unk_2576A6BE0);
      objc_msgSend(v7, sel_setRemoteObjectInterface_, v8);

    }
    v9 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_2576A7480);
    sub_24744F9A0(0, (unint64_t *)&unk_254447BB8);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447BE0);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_24745D750;
    v11 = sub_24744F9A0(0, &qword_254447BC8);
    v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447BD0);
    *(_QWORD *)(v10 + 56) = v12;
    *(_QWORD *)(v10 + 32) = v11;
    v13 = sub_24744F9A0(0, (unint64_t *)&qword_254447B90);
    *(_QWORD *)(v10 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_254447BA0);
    *(_QWORD *)(v10 + 64) = v13;
    v14 = sub_24744F640();
    sub_24745C860();

    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_24745D750;
    *(_QWORD *)(v15 + 56) = v12;
    *(_QWORD *)(v15 + 32) = v11;
    v16 = sub_24744F9A0(0, &qword_254447EA8);
    *(_QWORD *)(v15 + 88) = __swift_instantiateConcreteTypeFromMangledName(&qword_254447EB0);
    *(_QWORD *)(v15 + 64) = v16;
    v17 = sub_24744F640();
    sub_24745C860();

    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_24745D750;
    *(_QWORD *)(v18 + 56) = v12;
    *(_QWORD *)(v18 + 32) = v11;
    v19 = sub_24744F9A0(0, &qword_254447EB8);
    *(_QWORD *)(v18 + 88) = __swift_instantiateConcreteTypeFromMangledName(qword_254447EC0);
    *(_QWORD *)(v18 + 64) = v19;
    v20 = sub_24744F640();
    aBlock = 0;
    sub_24745C860();

    v21 = *(void **)(v1 + v2);
    if (v21)
    {
      objc_msgSend(v21, sel_setExportedInterface_, v9);
      v22 = *(void **)(v1 + v2);
      if (v22)
      {
        objc_msgSend(v22, sel_setExportedObject_, *(_QWORD *)(v1 + OBJC_IVAR___SUIBUIBridgeClient_delegateWrapper));
        v23 = *(void **)(v1 + v2);
        if (v23)
        {
          v24 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v41 = sub_24744F9FC;
          v42 = v24;
          v25 = MEMORY[0x24BDAC760];
          aBlock = MEMORY[0x24BDAC760];
          v38 = 1107296256;
          v39 = sub_24744FA48;
          v40 = &block_descriptor;
          v26 = _Block_copy(&aBlock);
          v27 = v23;
          swift_release();
          objc_msgSend(v27, sel_setInvalidationHandler_, v26);
          _Block_release(v26);

          v28 = *(void **)(v1 + v2);
          if (v28)
          {
            v29 = swift_allocObject();
            swift_unknownObjectWeakInit();
            v41 = sub_24744FA1C;
            v42 = v29;
            aBlock = v25;
            v38 = 1107296256;
            v39 = sub_24744FA48;
            v40 = &block_descriptor_5;
            v30 = _Block_copy(&aBlock);
            v31 = v28;
            swift_release();
            objc_msgSend(v31, sel_setInterruptionHandler_, v30);
            _Block_release(v30);

            v32 = *(void **)(v1 + v2);
            if (v32)
            {
              v33 = v32;
              objc_msgSend(v33, sel_resume);

            }
          }
        }
      }
    }

  }
  v34 = *(void **)(v1 + v2);
  v35 = v34;
  return v34;
}

id sub_24744F5C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_24745C800();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithMachServiceName_options_, v5, a3);

  return v6;
}

id sub_24744F640()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_24745C830();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithArray_, v1);

  return v2;
}

void sub_24744F6B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  char *v6;
  void *v7;

  v1 = a1 + 16;
  if (qword_254447E18 != -1)
    swift_once();
  v2 = sub_24745C7A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_254447F40);
  v3 = sub_24745C794();
  v4 = sub_24745C878();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247449000, v3, v4, "UIBridge Connection Invalidated", v5, 2u);
    MEMORY[0x24957B7F4](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = (char *)MEMORY[0x24957B86C](v1);
  if (v6)
  {
    v7 = *(void **)&v6[OBJC_IVAR___SUIBUIBridgeClient_connection];
    *(_QWORD *)&v6[OBJC_IVAR___SUIBUIBridgeClient_connection] = 0;

  }
}

void sub_24744F7C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v1 = a1 + 16;
  if (qword_254447E18 != -1)
    swift_once();
  v2 = sub_24745C7A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_254447F40);
  v3 = sub_24745C794();
  v4 = sub_24745C878();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247449000, v3, v4, "UIBridge Connection Interrupted", v5, 2u);
    MEMORY[0x24957B7F4](v5, -1, -1);
  }

  swift_beginAccess();
  v6 = MEMORY[0x24957B86C](v1);
  if (v6)
  {
    v7 = (char *)v6;
    v8 = OBJC_IVAR___SUIBUIBridgeClient_connection;
    v9 = *(void **)(v6 + OBJC_IVAR___SUIBUIBridgeClient_connection);
    if (v9)
    {
      objc_msgSend(v9, sel_invalidate);
      v10 = *(void **)&v7[v8];
    }
    else
    {
      v10 = 0;
    }
    *(_QWORD *)&v7[v8] = 0;

  }
}

void __swiftcall SUIBUIBridgeClient.init()(SUIBUIBridgeClient *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_2_1()), sel_init);
}

void SUIBUIBridgeClient.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for SUIBUIBridgeClient(uint64_t a1)
{
  return sub_24744F9A0(a1, &qword_2576A5A58);
}

uint64_t sub_24744F960(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447B50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24744F9A0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_24744F9D8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_24744F9FC()
{
  uint64_t v0;

  sub_24744F6B4(v0);
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

void sub_24744FA1C()
{
  uint64_t v0;

  sub_24744F7C4(v0);
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_2_1()
{
  return swift_getObjCClassFromMetadata();
}

uint64_t sub_24744FA48(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_24744FA74(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection) = a1;

}

void sub_24744FA88(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v14 = sub_24745C89C();
  v2 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  v5 = v4 - v3;
  sub_24745C890();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  sub_24745C7DC();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  *(_QWORD *)&v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection] = 0;
  swift_unknownObjectWeakInit();
  v6 = &v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
  *(_QWORD *)v6 = 0xD000000000000024;
  *((_QWORD *)v6 + 1) = 0x800000024745DD20;
  sub_24744F9A0(0, &qword_254447B30);
  v7 = v1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener] = sub_24744FD20();
  swift_unknownObjectWeakAssign();
  sub_24744F9A0(0, (unint64_t *)&qword_254447E58);
  sub_24745C7D0();
  v16 = MEMORY[0x24BEE4AF8];
  sub_2474508D4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447E38);
  sub_247450914();
  sub_24745C920();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x24BEE5750], v14);
  *(_QWORD *)&v7[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue] = sub_24745C8B4();

  v15.receiver = v7;
  v15.super_class = (Class)type metadata accessor for UIBridgeConnectionListener();
  v8 = (char *)objc_msgSendSuper2(&v15, sel_init);
  v9 = OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener;
  v10 = *(void **)&v8[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener];
  v11 = v8;
  objc_msgSend(v10, sel_setDelegate_, v11);
  v12 = *(id *)&v8[v9];
  objc_msgSend(v12, sel_resume);

  OUTLINED_FUNCTION_2_2();
}

id sub_24744FD20()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_24745C800();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithMachServiceName_, v1);

  return v2;
}

id sub_24744FD90()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_listener], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeConnectionListener();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24744FE68(int a1, id a2)
{
  void *v2;
  unsigned int v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  char aBlock[8];
  uint64_t v36;
  uint64_t v37;
  void (*v38)();
  uint64_t v39;
  char v40;
  _OWORD v41[2];

  v4 = objc_msgSend(a2, sel_processIdentifier);
  if (qword_254447E18 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v5, (uint64_t)qword_254447F40);
  v6 = v2;
  v7 = sub_24745C794();
  v8 = sub_24745C878();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = OUTLINED_FUNCTION_4_0();
    *(_QWORD *)aBlock = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v9 = 67109378;
    LODWORD(v41[0]) = v4;
    sub_24745C8FC();
    *(_WORD *)(v9 + 8) = 2080;
    v10 = &v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
    v11 = v6;
    v13 = *(_QWORD *)&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_machServiceName];
    v12 = *((_QWORD *)v10 + 1);
    swift_bridgeObjectRetain();
    *(_QWORD *)&v41[0] = sub_247454954(v13, v12, (uint64_t *)aBlock);
    sub_24745C8FC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_247449000, v7, v8, "Incoming connection request from %d for %s", (uint8_t *)v9, 0x12u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_3();
  }

  swift_bridgeObjectRetain();
  v14 = (void *)sub_24745C800();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(a2, sel_valueForEntitlement_, v14);

  if (v15)
  {
    sub_24745C914();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v41, 0, sizeof(v41));
  }
  sub_2474507D4((uint64_t)v41, (uint64_t)aBlock);
  if (v37)
  {
    if (swift_dynamicCast() && (v40 & 1) != 0)
    {
      objc_msgSend(a2, sel__setQueue_, *(_QWORD *)&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connectionQueue]);
      v16 = (void *)objc_opt_self();
      v17 = objc_msgSend(v16, sel_interfaceWithProtocol_, &unk_2576A6BE0);
      OUTLINED_FUNCTION_1_2((uint64_t)v17, sel_setExportedInterface_);

      v18 = (void *)MEMORY[0x24957B86C](&v6[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_uiBridgeService]);
      OUTLINED_FUNCTION_1_2((uint64_t)v18, sel_setExportedObject_);

      v19 = objc_msgSend(v16, sel_interfaceWithProtocol_, &unk_2576A7480);
      OUTLINED_FUNCTION_1_2((uint64_t)v19, sel_setRemoteObjectInterface_);

      v20 = OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_6();
      v21 = OUTLINED_FUNCTION_5();
      *(_DWORD *)(v21 + 16) = v4;
      *(_QWORD *)(v21 + 24) = v20;
      v38 = sub_247450864;
      v39 = v21;
      v22 = MEMORY[0x24BDAC760];
      v23 = OUTLINED_FUNCTION_8((uint64_t)&block_descriptor_0, v33, MEMORY[0x24BDAC760], 1107296256, v36, v37);
      swift_release();
      objc_msgSend(a2, sel_setInvalidationHandler_, v23);
      _Block_release(v23);
      v24 = OUTLINED_FUNCTION_5();
      OUTLINED_FUNCTION_6();
      v25 = OUTLINED_FUNCTION_5();
      *(_DWORD *)(v25 + 16) = v4;
      *(_QWORD *)(v25 + 24) = v24;
      v38 = sub_2474508A8;
      v39 = v25;
      v26 = OUTLINED_FUNCTION_8((uint64_t)&block_descriptor_11, v34, v22, 1107296256, v36, v37);
      v27 = swift_release();
      OUTLINED_FUNCTION_1_2(v27, sel_setInterruptionHandler_);
      _Block_release(v26);
      v28 = a2;
      sub_24744FA74((uint64_t)a2);
      objc_msgSend(v28, sel_resume);
      return 1;
    }
  }
  else
  {
    sub_24744F960((uint64_t)aBlock);
  }
  v30 = sub_24745C794();
  v31 = sub_24745C884();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_247449000, v30, v31, "Entitlement missing on incoming connection request", v32, 2u);
    OUTLINED_FUNCTION_3();
  }

  return 0;
}

void sub_24745034C(uint64_t a1, uint64_t a2, const char *a3, void (*a4)(void))
{
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a2 + 16;
  if (qword_254447E18 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_7();
  __swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
  v8 = sub_24745C794();
  v9 = sub_24745C878();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v10 = 67109120;
    sub_24745C8FC();
    _os_log_impl(&dword_247449000, v8, v9, a3, v10, 8u);
    OUTLINED_FUNCTION_3();
  }

  swift_beginAccess();
  v11 = MEMORY[0x24957B86C](v6);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = MEMORY[0x24957B86C](v11 + OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_uiBridgeService);
    if (v13)
    {
      v14 = (void *)v13;
      a4();

    }
  }
}

void sub_2474504F8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  id v17;
  uint64_t v18;
  _OWORD v19[2];

  v1 = v0;
  v2 = OUTLINED_FUNCTION_7();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_0();
  v6 = v5 - v4;
  v7 = OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection;
  v8 = *(void **)&v1[OBJC_IVAR____TtC12SiriUIBridge26UIBridgeConnectionListener_connection];
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v9, sel_remoteObjectProxy);
    sub_24745C914();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447B20);
    if (swift_dynamicCast())
    {

    }
    else
    {
      if (qword_254447E18 != -1)
        swift_once();
      v11 = __swift_project_value_buffer(v2, (uint64_t)qword_254447F40);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v6, v11, v2);
      v12 = v1;
      v13 = sub_24745C794();
      v14 = sub_24745C884();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)OUTLINED_FUNCTION_4_0();
        v18 = OUTLINED_FUNCTION_4_0();
        *(_DWORD *)v15 = 136315138;
        v16 = *(void **)&v1[v7];
        if (v16)
        {
          v17 = objc_msgSend(v16, sel_remoteObjectProxy);
          sub_24745C914();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v19, 0, sizeof(v19));
        }
        sub_24744F960((uint64_t)v19);
        *(_QWORD *)&v19[0] = sub_247454954(0x6C616E6F6974704FLL, 0xED00003E796E413CLL, &v18);
        sub_24745C8FC();

        _os_log_impl(&dword_247449000, v13, v14, "Unexpected remoteObjectProxy type for UIBridgeServiceDelegateWrapperProtocol %s", v15, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_3();
      }

      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  OUTLINED_FUNCTION_2_2();
}

void sub_24745077C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t type metadata accessor for UIBridgeConnectionListener()
{
  return objc_opt_self();
}

uint64_t sub_2474507D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447B50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24745081C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_247450840()
{
  swift_release();
  return swift_deallocObject();
}

void sub_247450864()
{
  uint64_t v0;

  sub_24745034C(*(unsigned int *)(v0 + 16), *(_QWORD *)(v0 + 24), "UIBridgeConnectionListener connection invalidated, client pid = %d", (void (*)(void))sub_247454428);
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

void sub_2474508A8()
{
  uint64_t v0;

  sub_24745034C(*(unsigned int *)(v0 + 16), *(_QWORD *)(v0 + 24), "UIBridgeConnectionListener connection interrupted, client pid = %d", (void (*)(void))sub_2474543E8);
}

unint64_t sub_2474508D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447E50;
  if (!qword_254447E50)
  {
    v1 = sub_24745C890();
    result = MEMORY[0x24957B770](MEMORY[0x24BEE5698], v1);
    atomic_store(result, (unint64_t *)&qword_254447E50);
  }
  return result;
}

unint64_t sub_247450914()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447E40;
  if (!qword_254447E40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254447E38);
    result = MEMORY[0x24957B770](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254447E40);
  }
  return result;
}

id OUTLINED_FUNCTION_1_2(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_24745C7A0();
}

void *OUTLINED_FUNCTION_8@<X0>(uint64_t a1@<X8>, uint64_t a2, char aBlock, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  a5 = v6;
  a6 = a1;
  return _Block_copy(&aBlock);
}

uint64_t sub_2474509C8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor) = a1;
  return swift_release();
}

char *sub_2474509E0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_8_0();
  v24 = v2;
  v25 = v3;
  v20 = v4;
  v21 = v5;
  v19 = v6;
  v18 = sub_24745C89C();
  v7 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_30();
  sub_24745C890();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_2_0();
  sub_24745C7DC();
  OUTLINED_FUNCTION_23();
  v9 = MEMORY[0x24BDAC7A8]();
  *(_QWORD *)&v0[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener] = 0;
  OUTLINED_FUNCTION_59(v9, (unint64_t *)&qword_254447E58);
  v10 = v0;
  sub_24745C7D0();
  v23 = MEMORY[0x24BEE4AF8];
  sub_247455814((unint64_t *)&qword_254447E50, v8, MEMORY[0x24BEE5698]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447E40);
  sub_24745C920();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v1, *MEMORY[0x24BEE5750], v18);
  *(_QWORD *)&v10[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_queue] = sub_24745C8B4();
  *(_QWORD *)&v10[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener] = v19;
  sub_24744E668(v20, (uint64_t)&v10[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher]);
  *(_QWORD *)&v10[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper] = v21;
  v11 = v19;
  swift_unknownObjectRetain();

  v22.receiver = v10;
  v22.super_class = (Class)type metadata accessor for UIBridgeService();
  v12 = objc_msgSendSuper2(&v22, sel_init);
  v13 = objc_allocWithZone((Class)type metadata accessor for UIBridgeConnectionListener());
  v14 = (char *)v12;
  sub_24744FA88(v12);
  v15 = *(void **)&v14[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener];
  *(_QWORD *)&v14[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener] = v16;

  OUTLINED_FUNCTION_46(v11, sel_setDelegate_);
  OUTLINED_FUNCTION_46(v11, sel_resumeConnectionWithBridgeProxy_);

  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v20);
  return v14;
}

void sub_247450C7C()
{
  sub_247450DC0();
}

uint64_t sub_247450C98(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[40];

  v2 = sub_24745C458();
  MEMORY[0x24BDAC7A8](v2);
  sub_24745C680();
  sub_24745C698();
  sub_24744E668((uint64_t)a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_messagePublisher, (uint64_t)v5);
  a1;
  AFDeviceSupportsSAE();
  type metadata accessor for UISessionProcessor();
  swift_allocObject();
  v3 = sub_247459744();
  return sub_2474509C8(v3);
}

uint64_t sub_247450D7C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = OUTLINED_FUNCTION_53();
  v1(v2);
  return swift_release();
}

void sub_247450DA4()
{
  sub_247450DC0();
}

void sub_247450DC0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_26();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_18();
  v2 = OUTLINED_FUNCTION_13();
  *(_QWORD *)(v2 + 16) = v0;
  *(_QWORD *)(v2 + 24) = v1;
  OUTLINED_FUNCTION_58();
  v3 = v0;
  v4 = v1;
  OUTLINED_FUNCTION_57();
  sub_247455814((unint64_t *)&qword_254447ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_29();
}

void sub_247450EC4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  const void *v20;

  _Block_release(v20);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_247450EE4(uint64_t a1, void *a2)
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
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint8_t *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_24745C458();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C704();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_247452484();
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE9B288], v8);
    swift_retain();
    sub_24745A15C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    sub_2474509C8(0);
    swift_release();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v12 = sub_24745C7A0();
    __swift_project_value_buffer(v12, (uint64_t)qword_254447F40);
    v21 = a2;
    v13 = sub_24745C794();
    v14 = sub_24745C878();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v23 = v16;
      *(_DWORD *)v15 = 136315138;
      v20 = v15 + 4;
      sub_24745C680();
      sub_247455814((unint64_t *)&qword_254447C00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v17 = sub_24745C9A4();
      v19 = v18;
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v22 = sub_247454954(v17, v19, &v23);
      sub_24745C8FC();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_247449000, v13, v14, "SessionHandler not found for session:%s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24957B7F4](v16, -1, -1);
      MEMORY[0x24957B7F4](v15, -1, -1);

    }
    else
    {

    }
  }
}

void sub_2474511E0()
{
  sub_247450DC0();
}

void sub_2474511FC()
{
  sub_247450DC0();
}

void sub_247451218()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void *);
  void (*v3)(void *);
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  OUTLINED_FUNCTION_8_0();
  v19 = v0;
  v20 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = *(_QWORD *)(sub_24745C458() - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_42();
  if (*(_QWORD *)(v7 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    OUTLINED_FUNCTION_53();
    v3(v5);
    swift_release();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_7();
    __swift_project_value_buffer(v9, (uint64_t)qword_254447F40);
    v17 = v5;
    v10 = sub_24745C794();
    v11 = sub_24745C878();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)OUTLINED_FUNCTION_4_0();
      v18 = OUTLINED_FUNCTION_4_0();
      *(_DWORD *)v12 = 136315138;
      sub_24745C680();
      sub_247455814((unint64_t *)&qword_254447C00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v13 = sub_24745C9A4();
      v15 = v14;
      OUTLINED_FUNCTION_62(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
      v16 = sub_247454954(v13, v15, &v18);
      OUTLINED_FUNCTION_25(v16);
      sub_24745C8FC();
      OUTLINED_FUNCTION_61();
      OUTLINED_FUNCTION_61();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_33(&dword_247449000, v10, v11, "SessionHandler not found for session:%s", v12);
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_3();
    }

    OUTLINED_FUNCTION_61();
  }
}

void sub_24745143C()
{
  sub_247450DC0();
}

void sub_247451458()
{
  sub_247450DC0();
}

void sub_247451474()
{
  sub_247450DC0();
}

void sub_247451490()
{
  sub_247450DC0();
}

void sub_2474514AC()
{
  sub_247450DC0();
}

void sub_2474514C8()
{
  sub_247450DC0();
}

void sub_2474514E4()
{
  sub_247450DC0();
}

void sub_247451500()
{
  sub_247450DC0();
}

void sub_24745151C()
{
  sub_247450DC0();
}

void sub_247451538()
{
  sub_247450DC0();
}

void sub_247451554()
{
  sub_247450DC0();
}

void sub_247451570()
{
  sub_247450DC0();
}

void sub_24745158C()
{
  sub_247450DC0();
}

void sub_2474515A8()
{
  sub_247451DE0("Received call in preheat()");
}

void sub_2474515DC()
{
  sub_247451648();
}

void sub_247451618()
{
  void *v0;

}

void sub_24745162C()
{
  sub_247451648();
}

void sub_247451648()
{
  void *v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  id v4;

  OUTLINED_FUNCTION_8_0();
  sub_24745C7B8();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_26();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_18();
  *(_QWORD *)(OUTLINED_FUNCTION_5() + 16) = v0;
  OUTLINED_FUNCTION_58();
  v4 = v0;
  OUTLINED_FUNCTION_57();
  sub_247455814((unint64_t *)&qword_254447ED8, v1, MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_29();
}

void sub_247451754(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  const void *v20;

  _Block_release(v20);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_247451774(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  os_log_type_t v6;
  uint8_t *v7;
  NSObject *oslog;

  if (qword_254447E18 != -1)
    swift_once();
  v2 = sub_24745C7A0();
  __swift_project_value_buffer(v2, (uint64_t)qword_254447F40);
  v3 = sub_24745C794();
  v4 = sub_24745C878();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_247449000, v3, v4, "Received siriPrompted", v5, 2u);
    MEMORY[0x24957B7F4](v5, -1, -1);
  }

  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    swift_retain();
    sub_247459B78();
    swift_release();
  }
  else
  {
    oslog = sub_24745C794();
    v6 = sub_24745C878();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_247449000, oslog, v6, "SessionHandler not found in UIBridgeService", v7, 2u);
      MEMORY[0x24957B7F4](v7, -1, -1);
    }

  }
}

void sub_24745191C()
{
  void *v0;

}

void sub_247451930()
{
  sub_2474519A8();
}

void sub_24745198C()
{
  sub_2474519A8();
}

void sub_2474519A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_26();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_18();
  v6 = OUTLINED_FUNCTION_13();
  *(_QWORD *)(v6 + 16) = v0;
  *(_QWORD *)(v6 + 24) = v3;
  v7 = OUTLINED_FUNCTION_58();
  v8 = v0;
  OUTLINED_FUNCTION_57();
  sub_247455814((unint64_t *)&qword_254447ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  sub_24745C920();
  MEMORY[0x24957B314](0, v2, v1, v7);
  _Block_release(v7);
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_247451AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *v12;

  v4 = sub_24745C704();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    type metadata accessor for UIBridgeService();
    swift_retain();
    sub_247451C5C(a2, (uint64_t)v7);
    sub_24745A15C();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_7();
    v12 = OUTLINED_FUNCTION_9(v8, (uint64_t)qword_254447F40);
    v9 = sub_24745C878();
    if (os_log_type_enabled(v12, v9))
    {
      v10 = (uint8_t *)OUTLINED_FUNCTION_4_0();
      *(_WORD *)v10 = 0;
      OUTLINED_FUNCTION_20(&dword_247449000, v12, v9, "SessionHandler not found in UIBridgeService", v10);
      OUTLINED_FUNCTION_3();
    }

  }
}

uint64_t sub_247451C5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;

  switch(a1)
  {
    case 0:
      goto LABEL_8;
    case 1:
      v3 = (unsigned int *)MEMORY[0x24BE9B278];
      break;
    case 2:
      v3 = (unsigned int *)MEMORY[0x24BE9B298];
      break;
    case 3:
      v3 = (unsigned int *)MEMORY[0x24BE9B270];
      break;
    case 4:
      v3 = (unsigned int *)MEMORY[0x24BE9B288];
      break;
    case 5:
      v3 = (unsigned int *)MEMORY[0x24BE9B280];
      break;
    default:
      if (qword_254447E18 != -1)
        swift_once();
      v4 = OUTLINED_FUNCTION_7();
      v5 = OUTLINED_FUNCTION_9(v4, (uint64_t)qword_254447F40);
      v6 = sub_24745C884();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)OUTLINED_FUNCTION_4_0();
        *(_WORD *)v7 = 0;
        OUTLINED_FUNCTION_20(&dword_247449000, v5, v6, "Unknown SUIBAttendingStopReason", v7);
        OUTLINED_FUNCTION_3();
      }

LABEL_8:
      v3 = (unsigned int *)MEMORY[0x24BE9B290];
      break;
  }
  v8 = *v3;
  v9 = sub_24745C704();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(a2, v8, v9);
}

void sub_247451DD4()
{
  sub_247451DE0("Received siriWillPrompt from the UI, this is not expected. Ignoring");
}

void sub_247451DE0(const char *a1)
{
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  NSObject *oslog;

  if (qword_254447E18 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_7();
  oslog = OUTLINED_FUNCTION_9(v2, (uint64_t)qword_254447F40);
  v3 = sub_24745C878();
  if (os_log_type_enabled(oslog, v3))
  {
    v4 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)v4 = 0;
    OUTLINED_FUNCTION_20(&dword_247449000, oslog, v3, a1, v4);
    OUTLINED_FUNCTION_3();
  }
  OUTLINED_FUNCTION_22(oslog);
}

void sub_247451EB4()
{
  sub_247451648();
}

void sub_247451ED0(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiSessionProcessor))
  {
    v3 = OUTLINED_FUNCTION_53();
    a2(v3);
    swift_release();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_7();
    oslog = OUTLINED_FUNCTION_9(v4, (uint64_t)qword_254447F40);
    v5 = sub_24745C878();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_4_0();
      *(_WORD *)v6 = 0;
      OUTLINED_FUNCTION_20(&dword_247449000, oslog, v5, "SessionHandler not found in UIBridgeService", v6);
      OUTLINED_FUNCTION_3();
    }

  }
}

void sub_247451FD0()
{
  void *v0;

}

void sub_247451FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v6 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  v7 = OUTLINED_FUNCTION_13();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v8 = OUTLINED_FUNCTION_10((uint64_t)sub_24745231C, MEMORY[0x24BDAC760], 1107296256, v22, v23);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v6, sel_notifyClientWithBlock_, v8);
  _Block_release(v8);
  v9 = OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener;
  v10 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v10)
  {
    v11 = v10;
    OUTLINED_FUNCTION_5_0();
    v13 = v12;

    if (v13)
    {
      v15 = (uint64_t)OUTLINED_FUNCTION_21(v14, sel_respondsToSelector_);
      if ((v15 & 1) != 0)
        OUTLINED_FUNCTION_21(v15, sel_uiBridgeServiceDidStartAttending);
      OUTLINED_FUNCTION_12();
    }
    v16 = *(void **)(v3 + v9);
    if (v16)
    {
      v17 = v16;
      OUTLINED_FUNCTION_5_0();
      v19 = v18;

      if (v19)
      {
        if ((OUTLINED_FUNCTION_21(v20, sel_respondsToSelector_) & 1) != 0)
        {
          v21 = (void *)sub_24745C800();
          OUTLINED_FUNCTION_55((uint64_t)v21, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_);
          OUTLINED_FUNCTION_12();

        }
        else
        {
          OUTLINED_FUNCTION_12();
        }
      }
    }
  }
}

void sub_247452158(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  os_log_type_t v3;
  uint8_t *v4;
  id v5;
  _BYTE v6[24];
  uint64_t v7;

  sub_24745553C(a1, (uint64_t)v6, (uint64_t *)&unk_254447B50);
  if (!v7)
  {
    sub_247455504((uint64_t)v6, (uint64_t *)&unk_254447B50);
    goto LABEL_8;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447E60);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    if (qword_254447E18 != -1)
      swift_once();
    v2 = sub_24745C7A0();
    __swift_project_value_buffer(v2, (uint64_t)qword_254447F40);
    v1 = sub_24745C794();
    v3 = sub_24745C86C();
    if (os_log_type_enabled(v1, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_247449000, v1, v3, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v4, 2u);
      MEMORY[0x24957B7F4](v4, -1, -1);
    }
    goto LABEL_12;
  }
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttending) & 1) != 0)
    objc_msgSend(v5, sel_uiBridgeServiceDidStartAttending);
  if ((objc_msgSend(v5, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_) & 1) != 0)
  {
    swift_unknownObjectRetain();
    v1 = sub_24745C800();
    objc_msgSend(v5, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, v1);
    swift_unknownObjectRelease_n();
LABEL_12:

    return;
  }
  swift_unknownObjectRelease();
}

void sub_24745231C(uint64_t a1, uint64_t a2)
{
  void (*v3)(__int128 *);
  __int128 v4;
  __int128 v5;

  v3 = *(void (**)(__int128 *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v5 + 1) = swift_getObjectType();
    *(_QWORD *)&v4 = a2;
  }
  else
  {
    v4 = 0u;
    v5 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v3(&v4);
  swift_release();
  sub_247455504((uint64_t)&v4, (uint64_t *)&unk_254447B50);
}

void sub_24745239C()
{
  sub_247452E18((uint64_t)sub_2474523B8, (uint64_t)&block_descriptor_91, (const char **)&selRef_uiBridgeServiceWillStartAttending);
}

void sub_2474523B8(uint64_t a1)
{
  sub_2474528C4(a1, (const char **)&selRef_uiBridgeServiceWillStartAttending);
}

void sub_2474523C4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeListener);
  v2 = OUTLINED_FUNCTION_10((uint64_t)sub_24745231C, MEMORY[0x24BDAC760], 1107296256, v6, v7);
  OUTLINED_FUNCTION_46(v1, sel_notifyClientWithBlock_);
  _Block_release(v2);
  v3 = *(void **)(v0 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v3)
  {
    v4 = v3;
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_28();
    if (v1)
    {
      if ((OUTLINED_FUNCTION_14(v5, sel_respondsToSelector_) & 1) != 0)
        OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_15();
    }
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_247452484()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_10((uint64_t)sub_24745231C, MEMORY[0x24BDAC760], 1107296256, v6, v7);
  OUTLINED_FUNCTION_24((uint64_t)v1, sel_notifyClientWithBlock_);
  OUTLINED_FUNCTION_47();
  v2 = *(void **)(v0 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v2)
  {
    v3 = v2;
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_34();
    if (v0)
    {
      v5 = (uint64_t)OUTLINED_FUNCTION_21(v4, sel_respondsToSelector_);
      if ((v5 & 1) != 0)
        OUTLINED_FUNCTION_55(v5, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_);
      OUTLINED_FUNCTION_12();
    }
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_247452544(uint64_t a1)
{
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _BYTE v7[24];
  uint64_t v8;

  sub_24745553C(a1, (uint64_t)v7, (uint64_t *)&unk_254447B50);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447E60);
    v2 = OUTLINED_FUNCTION_32();
    if ((v2 & 1) != 0)
    {
      if ((OUTLINED_FUNCTION_14(v2, sel_respondsToSelector_) & 1) != 0)
        OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_15();
      goto LABEL_12;
    }
  }
  else
  {
    sub_247455504((uint64_t)v7, (uint64_t *)&unk_254447B50);
  }
  if (qword_254447E18 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_7();
  v4 = OUTLINED_FUNCTION_9(v3, (uint64_t)qword_254447F40);
  v5 = sub_24745C86C();
  if (OUTLINED_FUNCTION_37(v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)v6 = 0;
    OUTLINED_FUNCTION_20(&dword_247449000, v4, v1, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v6);
    OUTLINED_FUNCTION_3();
  }

LABEL_12:
  OUTLINED_FUNCTION_3_1();
}

void sub_247452654(char a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)(OUTLINED_FUNCTION_5() + 16) = a1;
  OUTLINED_FUNCTION_10((uint64_t)sub_24745231C, MEMORY[0x24BDAC760], 1107296256, v7, v8);
  v3 = OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_24(v3, sel_notifyClientWithBlock_);
  OUTLINED_FUNCTION_47();
  v4 = *(void **)&v1[OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener];
  if (v4)
  {
    v5 = v4;
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_34();
    if (v1)
    {
      if ((OUTLINED_FUNCTION_21(v6, sel_respondsToSelector_) & 1) != 0)
        objc_msgSend(v1, sel_uiBridgeServiceDetectedSpeechStart_, a1 & 1);
      OUTLINED_FUNCTION_12();
    }
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_247452730(uint64_t a1, char a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  sub_24745553C(a1, (uint64_t)v8, (uint64_t *)&unk_254447B50);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447E60);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if ((objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_) & 1) != 0)
        objc_msgSend(v7, sel_uiBridgeServiceDetectedSpeechStart_, a2 & 1);
      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    sub_247455504((uint64_t)v8, (uint64_t *)&unk_254447B50);
  }
  if (qword_254447E18 != -1)
    swift_once();
  v3 = sub_24745C7A0();
  __swift_project_value_buffer(v3, (uint64_t)qword_254447F40);
  v4 = sub_24745C794();
  v5 = sub_24745C86C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_247449000, v4, v5, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v6, 2u);
    MEMORY[0x24957B7F4](v6, -1, -1);
  }

}

void sub_24745289C()
{
  sub_247452E18((uint64_t)sub_2474528B8, (uint64_t)&block_descriptor_76, (const char **)&selRef_uiBridgeServiceDetectedSiriDirectedSpeech);
}

void sub_2474528B8(uint64_t a1)
{
  sub_2474528C4(a1, (const char **)&selRef_uiBridgeServiceDetectedSiriDirectedSpeech);
}

void sub_2474528C4(uint64_t a1, const char **a2)
{
  os_log_type_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _BYTE v10[24];
  uint64_t v11;

  sub_24745553C(a1, (uint64_t)v10, (uint64_t *)&unk_254447B50);
  if (v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447E60);
    v4 = OUTLINED_FUNCTION_32();
    if ((v4 & 1) != 0)
    {
      v5 = (uint64_t)OUTLINED_FUNCTION_21(v4, sel_respondsToSelector_);
      if ((v5 & 1) != 0)
        OUTLINED_FUNCTION_21(v5, *a2);
      OUTLINED_FUNCTION_12();
      goto LABEL_12;
    }
  }
  else
  {
    sub_247455504((uint64_t)v10, (uint64_t *)&unk_254447B50);
  }
  if (qword_254447E18 != -1)
    swift_once();
  v6 = OUTLINED_FUNCTION_7();
  v7 = OUTLINED_FUNCTION_9(v6, (uint64_t)qword_254447F40);
  v8 = sub_24745C86C();
  if (OUTLINED_FUNCTION_37(v8))
  {
    v9 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)v9 = 0;
    OUTLINED_FUNCTION_20(&dword_247449000, v7, v2, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v9);
    OUTLINED_FUNCTION_3();
  }

LABEL_12:
  OUTLINED_FUNCTION_3_1();
}

void sub_2474529D8(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = OUTLINED_FUNCTION_5();
  swift_unknownObjectWeakInit();
  v4 = OUTLINED_FUNCTION_13();
  *(_BYTE *)(v4 + 16) = (_BYTE)a1;
  *(_QWORD *)(v4 + 24) = v3;
  OUTLINED_FUNCTION_10((uint64_t)sub_24745231C, MEMORY[0x24BDAC760], 1107296256, v14, v15);
  v5 = OUTLINED_FUNCTION_52();
  OUTLINED_FUNCTION_24(v5, sel_notifyClientWithBlock_);
  OUTLINED_FUNCTION_47();
  if ((a1 & 1) != 0)
  {
    v7 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper);
    if ((OUTLINED_FUNCTION_14(v6, sel_respondsToSelector_) & 1) != 0)
      objc_msgSend(v7, sel_notifySpeechDetectedIsUndirected);
    v8 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v8)
    {
      v9 = v8;
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_28();
      if (v7)
      {
        if ((OUTLINED_FUNCTION_14(v10, sel_respondsToSelector_) & 1) != 0)
          objc_msgSend(v7, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 1);
LABEL_12:
        OUTLINED_FUNCTION_15();
      }
    }
  }
  else
  {
    v11 = *(void **)(v1 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v11)
    {
      v12 = v11;
      OUTLINED_FUNCTION_5_0();
      OUTLINED_FUNCTION_28();
      if (a1)
      {
        if ((OUTLINED_FUNCTION_14(v13, sel_respondsToSelector_) & 1) != 0)
          objc_msgSend(a1, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 3);
        goto LABEL_12;
      }
    }
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_247452B48(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  _BYTE v16[24];
  uint64_t v17;

  sub_24745553C(a1, (uint64_t)v16, (uint64_t *)&unk_254447B50);
  if (v17)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447E60);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if ((a2 & 1) != 0)
      {
        swift_beginAccess();
        v5 = MEMORY[0x24957B86C](a3 + 16);
        if (v5)
        {
          v6 = v5;
          v7 = *(void **)(v5 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_serviceHelper);
          if ((objc_msgSend(v7, sel_respondsToSelector_, sel_notifySpeechDetectedIsUndirected) & 1) != 0)
            objc_msgSend(v7, sel_notifySpeechDetectedIsUndirected);
          if ((objc_msgSend(v15, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_) & 1) != 0)objc_msgSend(v15, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 1);
        }
        else
        {
          if (qword_254447E18 != -1)
            swift_once();
          v12 = sub_24745C7A0();
          __swift_project_value_buffer(v12, (uint64_t)qword_254447F40);
          v6 = sub_24745C794();
          v13 = sub_24745C884();
          if (os_log_type_enabled(v6, v13))
          {
            v14 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_247449000, v6, v13, "UIBridgeService expired", v14, 2u);
            MEMORY[0x24957B7F4](v14, -1, -1);
          }
        }

      }
      else if ((objc_msgSend(v15, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_) & 1) != 0)
      {
        objc_msgSend(v15, sel_uiBridgeServiceReceivedSpeechMitigationResult_, 3);
      }
      swift_unknownObjectRelease();
      return;
    }
  }
  else
  {
    sub_247455504((uint64_t)v16, (uint64_t *)&unk_254447B50);
  }
  if (qword_254447E18 != -1)
    swift_once();
  v8 = sub_24745C7A0();
  __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
  v9 = sub_24745C794();
  v10 = sub_24745C86C();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_247449000, v9, v10, "Registered delegate is not of expected type, it should implement AFUIBridgeServiceDelegate", v11, 2u);
    MEMORY[0x24957B7F4](v11, -1, -1);
  }

}

void sub_247452DFC()
{
  sub_247452E18((uint64_t)sub_247452ECC, (uint64_t)&block_descriptor_64, (const char **)&selRef_uiBridgeServiceReceivedShowAssetsDownloadPrompt);
}

void sub_247452E18(uint64_t a1, uint64_t a2, const char **a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[6];

  v10[4] = a1;
  v10[5] = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_24745231C;
  v10[3] = a2;
  v5 = _Block_copy(v10);
  OUTLINED_FUNCTION_24((uint64_t)v5, sel_notifyClientWithBlock_);
  OUTLINED_FUNCTION_47();
  v6 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v6)
  {
    v7 = v6;
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_34();
    if (v3)
    {
      v9 = (uint64_t)OUTLINED_FUNCTION_21(v8, sel_respondsToSelector_);
      if ((v9 & 1) != 0)
        OUTLINED_FUNCTION_21(v9, *a3);
      OUTLINED_FUNCTION_12();
    }
  }
  OUTLINED_FUNCTION_3_1();
}

void sub_247452ECC(uint64_t a1)
{
  sub_2474528C4(a1, (const char **)&selRef_uiBridgeServiceReceivedShowAssetsDownloadPrompt);
}

void sub_247452ED8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v4 = *(void **)(v3 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v4 && (v6 = v4, OUTLINED_FUNCTION_5_0(), OUTLINED_FUNCTION_28(), v2))
  {
    if ((OUTLINED_FUNCTION_14(v7, sel_respondsToSelector_) & 1) != 0)
    {
      if (a2)
        v8 = sub_24745C800();
      else
        v8 = 0;
      v9 = (void *)v8;
      objc_msgSend(v2, sel_uiBridgeServiceDidDetectLanguageMismatch_);
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_22(v9);
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  else
  {
    OUTLINED_FUNCTION_40();
  }
}

void sub_247452F88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(uint64_t, unint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  OUTLINED_FUNCTION_8_0();
  v27 = v0;
  v2 = sub_24745C6F8();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  OUTLINED_FUNCTION_42();
  v4 = sub_24745C59C();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v28 = MEMORY[0x24BEE4AF8];
    sub_24745C95C();
    v6 = v4 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v4 = *(_QWORD *)(v3 + 72);
    v7 = *(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v3 + 16);
    do
    {
      v8 = v7(v1, v6, v2);
      MEMORY[0x24BDAC7A8](v8);
      OUTLINED_FUNCTION_36();
      *(_QWORD *)(v9 - 16) = v1;
      v10 = objc_allocWithZone((Class)SUIBOrchestrationTask);
      sub_247454634((uint64_t)sub_2474554F8, (uint64_t)&v28, (uint64_t)&unk_2518A4B60, (uint64_t)sub_2474559F8, (uint64_t)sub_2474559F4, (uint64_t)&block_descriptor_61);
      OUTLINED_FUNCTION_62(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
      sub_24745C944();
      sub_24745C968();
      sub_24745C974();
      sub_24745C950();
      v6 += v4;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_254447E18 != -1)
    swift_once();
  v11 = OUTLINED_FUNCTION_7();
  v12 = __swift_project_value_buffer(v11, (uint64_t)qword_254447F40);
  swift_bridgeObjectRetain_n();
  sub_24745C794();
  v13 = OUTLINED_FUNCTION_35();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    v15 = OUTLINED_FUNCTION_4_0();
    v28 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = OUTLINED_FUNCTION_59(v15, (unint64_t *)&qword_254447B90);
    v17 = swift_bridgeObjectRetain();
    v18 = MEMORY[0x24957B2B4](v17, v16);
    v20 = v19;
    OUTLINED_FUNCTION_45();
    v21 = sub_247454954(v18, v20, &v28);
    OUTLINED_FUNCTION_25(v21);
    sub_24745C8FC();
    OUTLINED_FUNCTION_60();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33(&dword_247449000, v12, v13, "Calling delegate's didReceive with %s", v14);
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_3();
  }

  OUTLINED_FUNCTION_60();
  v22 = *(void **)(v27 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v22 && (v23 = v22, OUTLINED_FUNCTION_5_0(), OUTLINED_FUNCTION_28(), v4))
  {
    v25 = (uint64_t)OUTLINED_FUNCTION_14(v24, sel_respondsToSelector_);
    if ((v25 & 1) != 0)
    {
      OUTLINED_FUNCTION_59(v25, (unint64_t *)&qword_254447B90);
      v26 = (void *)sub_24745C830();
      OUTLINED_FUNCTION_48((uint64_t)v26, sel_uiBridgeServiceDidReceiveTasks_);
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_15();

    }
    else
    {
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_15();
    }
  }
  else
  {
    OUTLINED_FUNCTION_45();
  }
  OUTLINED_FUNCTION_2_2();
}

void sub_2474532C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v7;

  v2 = sub_24745C458();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C6EC();
  v6 = (void *)sub_24745C434();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  objc_msgSend(a1, sel_setTaskId_, v6);

}

void sub_247453370()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
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
  id v15;
  void *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  OUTLINED_FUNCTION_8_0();
  v2 = v0;
  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  OUTLINED_FUNCTION_23();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v33 - v9;
  v11 = sub_24745C458();
  v34 = *(_QWORD *)(v11 - 8);
  v35 = v11;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2_0();
  if (qword_254447E18 != -1)
    swift_once();
  v13 = OUTLINED_FUNCTION_7();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_254447F40);
  v15 = v4;
  v16 = (void *)v14;
  v17 = sub_24745C794();
  v18 = sub_24745C878();
  if (os_log_type_enabled(v17, v18))
  {
    v33[2] = v2;
    v19 = OUTLINED_FUNCTION_4_0();
    v33[3] = v10;
    v20 = (uint8_t *)v19;
    v36 = OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v20 = 136315138;
    v33[0] = v20 + 4;
    sub_24745C5B4();
    sub_247455814((unint64_t *)&qword_254447C00, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v21 = v15;
    v22 = v35;
    v23 = sub_24745C9A4();
    v33[1] = v8;
    v25 = v24;
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v1, v22);
    v26 = sub_247454954(v23, v25, &v36);
    OUTLINED_FUNCTION_25(v26);
    sub_24745C8FC();

    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_33(&dword_247449000, v17, v18, "Calling delegate's taskDidEnd with %s", v20);
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_3();
  }

  v27 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (v27)
  {
    v28 = v27;
    OUTLINED_FUNCTION_5_0();
    v30 = v29;

    if (v30)
    {
      if ((objc_msgSend(v30, sel_respondsToSelector_, sel_uiBridgeServiceTaskDidEnd_) & 1) != 0)
      {
        sub_24745C5B4();
        v31 = v35;
        __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v35);
        sub_24745553C((uint64_t)v10, (uint64_t)v8, &qword_254447C10);
        if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v31) == 1)
        {
          v32 = 0;
        }
        else
        {
          v32 = (void *)sub_24745C434();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v8, v31);
        }
        objc_msgSend(v30, sel_uiBridgeServiceTaskDidEnd_, v32);
        swift_unknownObjectRelease();

        sub_247455504((uint64_t)v10, &qword_254447C10);
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  OUTLINED_FUNCTION_2_2();
}

void sub_2474536A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  _BYTE v18[16];
  void *v19;
  _BYTE v20[16];
  uint64_t v21;
  id v22;

  v2 = v1;
  v21 = a1;
  v3 = objc_allocWithZone((Class)SUIBIntelligenceFlowActionSummary);
  v4 = (void *)sub_247454634((uint64_t)sub_2474550E4, (uint64_t)v20, (uint64_t)&unk_2518A4AC0, (uint64_t)sub_2474559F8, (uint64_t)sub_2474559F4, (uint64_t)&block_descriptor_49);
  v19 = v4;
  v5 = objc_allocWithZone((Class)SUIBRequestProgress);
  v6 = (void *)sub_247454634((uint64_t)sub_2474550EC, (uint64_t)v18, (uint64_t)&unk_2518A4A70, (uint64_t)sub_2474559F8, (uint64_t)sub_2474559F4, (uint64_t)&block_descriptor_43);
  if (qword_254447E18 != -1)
    swift_once();
  v7 = OUTLINED_FUNCTION_7();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
  v9 = v4;
  sub_24745C794();
  v10 = OUTLINED_FUNCTION_35();
  if (os_log_type_enabled(v8, v10))
  {
    v11 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    v12 = (_QWORD *)OUTLINED_FUNCTION_4_0();
    *(_DWORD *)v11 = 138412290;
    v22 = v9;
    v13 = v9;
    sub_24745C8FC();
    *v12 = v9;

    OUTLINED_FUNCTION_33(&dword_247449000, v8, v10, "Calling delegate's receivedRequestProgress with %@", v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5BF8);
    OUTLINED_FUNCTION_31();
    OUTLINED_FUNCTION_3();
  }

  v14 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
  if (!v14 || (v15 = v14, OUTLINED_FUNCTION_5_0(), OUTLINED_FUNCTION_28(), !v2))
  {

    goto LABEL_10;
  }
  if ((OUTLINED_FUNCTION_14(v16, sel_respondsToSelector_) & 1) != 0)
  {
    v17 = v6;
    OUTLINED_FUNCTION_48((uint64_t)v17, sel_uiBridgeServiceReceivedRequestProgress_);
    OUTLINED_FUNCTION_15();

LABEL_10:
    return;
  }

  OUTLINED_FUNCTION_15();
}

void sub_247453918(void *a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  sub_24745C614();
  v2 = (void *)sub_24745C800();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setFormatString_, v2);

  v3 = sub_24745C620();
  sub_247453A58(v3);
  swift_bridgeObjectRelease();
  sub_24744F9A0(0, &qword_2576A5C00);
  v4 = (id)sub_24745C7E8();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setParameterSummaries_, v4);

}

void sub_2474539EC(void *a1, uint64_t a2)
{
  id v3;

  objc_msgSend(a1, sel_setValueType_, a2);
  v3 = (id)sub_24745C800();
  objc_msgSend(a1, sel_setValue_, v3);

}

void sub_247453A58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, unint64_t, uint64_t);
  _QWORD *v23;
  char *v24;
  char *v25;
  int v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  char v45;
  unint64_t v46;
  BOOL v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD v50[2];
  _QWORD *v51;
  int v52;
  uint64_t v53;
  int64_t v54;
  int v55;
  char *v56;
  uint64_t v57;
  int64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;
  _QWORD v62[2];
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;

  v2 = sub_24745C608();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v61 = (char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C08);
  v5 = MEMORY[0x24BDAC7A8](v59);
  v51 = (_QWORD *)((char *)v50 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x24BDAC7A8](v5);
  v60 = (_QWORD *)((char *)v50 - v8);
  MEMORY[0x24BDAC7A8](v7);
  v56 = (char *)v50 - v9;
  v66 = MEMORY[0x24BEE4B00];
  sub_2474550FC(a1, v62);
  v57 = v62[0];
  v53 = v62[1];
  v58 = v64;
  v10 = v65;
  v50[0] = v63;
  v54 = (unint64_t)(v63 + 64) >> 6;
  v55 = *MEMORY[0x24BE9AB50];
  v52 = *MEMORY[0x24BE9AB58];
  swift_bridgeObjectRetain();
  while (1)
  {
    while (1)
    {
      if (v10)
      {
        v11 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v12 = v11 | (v58 << 6);
      }
      else
      {
        v13 = v58 + 1;
        if (__OFADD__(v58, 1))
          goto LABEL_41;
        if (v13 >= v54)
          goto LABEL_39;
        v14 = *(_QWORD *)(v53 + 8 * v13);
        v15 = v58 + 1;
        if (!v14)
        {
          v15 = v58 + 2;
          if (v58 + 2 >= v54)
            goto LABEL_39;
          v14 = *(_QWORD *)(v53 + 8 * v15);
          if (!v14)
          {
            v15 = v58 + 3;
            if (v58 + 3 >= v54)
              goto LABEL_39;
            v14 = *(_QWORD *)(v53 + 8 * v15);
            if (!v14)
            {
              v15 = v58 + 4;
              if (v58 + 4 >= v54)
                goto LABEL_39;
              v14 = *(_QWORD *)(v53 + 8 * v15);
              if (!v14)
              {
                v15 = v58 + 5;
                if (v58 + 5 >= v54)
                  goto LABEL_39;
                v14 = *(_QWORD *)(v53 + 8 * v15);
                if (!v14)
                {
                  v16 = v58 + 6;
                  while (v16 < v54)
                  {
                    v14 = *(_QWORD *)(v53 + 8 * v16++);
                    if (v14)
                    {
                      v15 = v16 - 1;
                      goto LABEL_19;
                    }
                  }
LABEL_39:
                  sub_247455484();
                  return;
                }
              }
            }
          }
        }
LABEL_19:
        v10 = (v14 - 1) & v14;
        v12 = __clz(__rbit64(v14)) + (v15 << 6);
        v58 = v15;
      }
      v17 = v56;
      v18 = (uint64_t *)(*(_QWORD *)(v57 + 48) + 16 * v12);
      v20 = *v18;
      v19 = v18[1];
      v21 = v59;
      v22 = *(void (**)(char *, unint64_t, uint64_t))(v3 + 16);
      v22(&v56[*(int *)(v59 + 48)], *(_QWORD *)(v57 + 56) + *(_QWORD *)(v3 + 72) * v12, v2);
      *v17 = v20;
      v17[1] = v19;
      v23 = v60;
      sub_247455134((uint64_t)v17, (uint64_t)v60);
      v24 = (char *)v23 + *(int *)(v21 + 48);
      v25 = v61;
      v22(v61, (unint64_t)v24, v2);
      v26 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v25, v2);
      if (v26 == v55)
      {
        v27 = 0;
        goto LABEL_24;
      }
      if (v26 == v52)
        break;
      swift_bridgeObjectRetain();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v61, v2);
LABEL_30:
      sub_247455504((uint64_t)v60, &qword_2576A5C08);
    }
    v27 = 1;
LABEL_24:
    v28 = v61;
    v29 = (*(uint64_t (**)(char *, uint64_t))(v3 + 96))(v61, v2);
    v30 = *((_QWORD *)v28 + 1);
    MEMORY[0x24BDAC7A8](v29);
    v50[-4] = v27;
    v50[-3] = v31;
    v50[-2] = v30;
    objc_allocWithZone((Class)SUIBIntelligenceFlowParameterSummary);
    swift_bridgeObjectRetain();
    v32 = sub_247454634((uint64_t)sub_24745517C, (uint64_t)&v50[-6], (uint64_t)&unk_2518A4B10, (uint64_t)sub_2474559F8, (uint64_t)sub_2474559F4, (uint64_t)&block_descriptor_55);
    swift_bridgeObjectRelease();
    if (!v32)
      goto LABEL_30;
    v33 = v51;
    v34 = (char *)v51 + *(int *)(v59 + 48);
    v36 = *v60;
    v35 = v60[1];
    *v51 = *v60;
    v33[1] = v35;
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v34, v24, v2);
    v37 = v66;
    v38 = *(_QWORD *)(v66 + 16);
    if (*(_QWORD *)(v66 + 24) <= v38)
    {
      sub_247455188(v38 + 1, 1);
      v37 = v66;
    }
    sub_24745C9B0();
    sub_24745C818();
    v39 = sub_24745C9BC();
    v40 = v37 + 64;
    v41 = -1 << *(_BYTE *)(v37 + 32);
    v42 = v39 & ~v41;
    v43 = v42 >> 6;
    if (((-1 << v42) & ~*(_QWORD *)(v37 + 64 + 8 * (v42 >> 6))) == 0)
      break;
    v44 = __clz(__rbit64((-1 << v42) & ~*(_QWORD *)(v37 + 64 + 8 * (v42 >> 6)))) | v42 & 0x7FFFFFFFFFFFFFC0;
LABEL_38:
    *(_QWORD *)(v40 + ((v44 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v44;
    v49 = (_QWORD *)(*(_QWORD *)(v37 + 48) + 16 * v44);
    *v49 = v36;
    v49[1] = v35;
    *(_QWORD *)(*(_QWORD *)(v37 + 56) + 8 * v44) = v32;
    ++*(_QWORD *)(v37 + 16);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v34, v2);
  }
  v45 = 0;
  v46 = (unint64_t)(63 - v41) >> 6;
  while (++v43 != v46 || (v45 & 1) == 0)
  {
    v47 = v43 == v46;
    if (v43 == v46)
      v43 = 0;
    v45 |= v47;
    v48 = *(_QWORD *)(v40 + 8 * v43);
    if (v48 != -1)
    {
      v44 = __clz(__rbit64(~v48)) + (v43 << 6);
      goto LABEL_38;
    }
  }
  __break(1u);
LABEL_41:
  __break(1u);
}

id sub_247453FF0(void *a1, uint64_t a2)
{
  objc_msgSend(a1, sel_setProgressType_, 1);
  return objc_msgSend(a1, sel_setIntelligenceFlowActionSummary_, a2);
}

void sub_247454030()
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
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;

  OUTLINED_FUNCTION_8_0();
  v2 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5BF0);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_30();
  v4 = sub_24745C50C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C518();
  if (__swift_getEnumTagSinglePayload(v1, 1, v4) != 1)
  {
    v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v1, v4);
    MEMORY[0x24BDAC7A8](v8);
    OUTLINED_FUNCTION_36();
    *(_QWORD *)(v9 - 16) = v7;
    v10 = objc_allocWithZone((Class)SUIBSiriInAppResponse);
    v12 = (void *)OUTLINED_FUNCTION_51((uint64_t)sub_24745493C, v11, (uint64_t)&unk_2518A4A20, (uint64_t)sub_2474559F8, (uint64_t)sub_2474559F4, (uint64_t)&block_descriptor_37);
    MEMORY[0x24BDAC7A8](v12);
    OUTLINED_FUNCTION_36();
    *(_QWORD *)(v14 - 16) = v13;
    v15 = objc_allocWithZone((Class)SUIBSiriResponse);
    v17 = (void *)OUTLINED_FUNCTION_51((uint64_t)sub_247454944, v16, (uint64_t)&unk_2518A49D0, (uint64_t)sub_2474550C0, (uint64_t)sub_247454724, (uint64_t)&block_descriptor_31);
    if (qword_254447E18 != -1)
      swift_once();
    v18 = OUTLINED_FUNCTION_7();
    v19 = __swift_project_value_buffer(v18, (uint64_t)qword_254447F40);
    v20 = v17;
    v21 = v19;
    sub_24745C794();
    v22 = OUTLINED_FUNCTION_35();
    if (os_log_type_enabled(v19, v22))
    {
      v23 = (uint8_t *)OUTLINED_FUNCTION_4_0();
      v24 = OUTLINED_FUNCTION_4_0();
      v33 = v5;
      v34 = v20;
      v30 = (_QWORD *)v24;
      v31 = v7;
      v32 = v4;
      *(_DWORD *)v23 = 138412290;
      v25 = v20;
      sub_24745C8FC();
      *v30 = v20;

      OUTLINED_FUNCTION_33(&dword_247449000, v21, v22, "Calling delegate's receivedSiriResponse with %@", v23);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5BF8);
      OUTLINED_FUNCTION_31();
      OUTLINED_FUNCTION_3();
    }

    v26 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge15UIBridgeService_uiBridgeConnectionListener);
    if (v26 && (v26, OUTLINED_FUNCTION_5_0(), OUTLINED_FUNCTION_34(), v20))
    {
      if ((OUTLINED_FUNCTION_21(v27, sel_respondsToSelector_) & 1) == 0)
      {

        OUTLINED_FUNCTION_12();
        goto LABEL_13;
      }
      v28 = v20;
      OUTLINED_FUNCTION_46(v20, sel_uiBridgeServiceReceivedSiriResponse_);
      OUTLINED_FUNCTION_12();

    }
    else
    {

    }
LABEL_13:
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    goto LABEL_14;
  }
  sub_247455504(v1, &qword_2576A5BF0);
LABEL_14:
  OUTLINED_FUNCTION_2_2();
}

void sub_247454390(void *a1)
{
  id v2;

  sub_24745C500();
  v2 = (id)sub_24745C800();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setBundleIdentifier_, v2);

}

void sub_2474543E8()
{
  sub_247454434("UIBridgeListener connection interrupted");
}

void sub_247454414()
{
  void *v0;

}

void sub_247454428()
{
  sub_247454434("UIBridgeListener connection invalidated");
}

void sub_247454434(const char *a1)
{
  NSObject *v1;
  uint64_t v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_254447E18 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9(v3, (uint64_t)qword_254447F40);
  v4 = OUTLINED_FUNCTION_35();
  if (os_log_type_enabled(v1, v4))
  {
    v5 = (uint8_t *)OUTLINED_FUNCTION_4_0();
    *(_WORD *)v5 = 0;
    OUTLINED_FUNCTION_20(&dword_247449000, v1, v4, a1, v5);
    OUTLINED_FUNCTION_3();
  }

  sub_247451930();
  sub_24745198C();
  sub_2474515DC();
}

void sub_247454520()
{
  void *v0;

}

id UIBridgeService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UIBridgeService.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UIBridgeService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_247454634(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  uint64_t v12;
  void *v13;
  id v14;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD v17[6];

  v12 = OUTLINED_FUNCTION_13();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v17[4] = a4;
  v17[5] = v12;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 1107296256;
  v17[2] = a5;
  v17[3] = a6;
  v13 = _Block_copy(v17);
  swift_retain();
  v14 = objc_msgSend(v6, sel_initWithBuilder_, v13);
  _Block_release(v13);
  swift_release();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
    return (uint64_t)v14;
  __break(1u);
  return result;
}

void sub_247454724(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_247454758()
{
  OUTLINED_FUNCTION_50();
  return swift_deallocObject();
}

void sub_247454778()
{
  uint64_t v0;

  sub_247451ED0(*(_QWORD *)(v0 + 16), (void (*)(uint64_t))sub_247459988);
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

void sub_2474547B0()
{
  uint64_t v0;

  sub_247451774(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2474547B8()
{
  OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_2474547D0()
{
  uint64_t v0;

  sub_247451AF8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_2474547E8()
{
  uint64_t v0;

  sub_247451ED0(*(_QWORD *)(v0 + 16), (void (*)(uint64_t))sub_24745A6F0);
}

uint64_t type metadata accessor for UIBridgeService()
{
  return objc_opt_self();
}

uint64_t method lookup function for UIBridgeService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UIBridgeService.preheat()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x140))();
}

uint64_t dispatch thunk of UIBridgeService.siriDismissed()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x148))();
}

uint64_t dispatch thunk of UIBridgeService.siriPrompted()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x150))();
}

uint64_t dispatch thunk of UIBridgeService.stopAttending(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of UIBridgeService.stopAttending(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of UIBridgeService.siriWillPrompt()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t dispatch thunk of UIBridgeService.startAttending()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x170))();
}

uint64_t dispatch thunk of UIBridgeService.connectionInterrupted()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E0))();
}

uint64_t dispatch thunk of UIBridgeService.connectionInvalidated()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x1E8))();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

void sub_24745493C(void *a1)
{
  sub_247454390(a1);
}

id sub_247454944(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, sel_setInAppResponse_, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247454954(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_247454A24(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2474554B8((uint64_t)v12, *a3);
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
      sub_2474554B8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_247454A24(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_247454B78((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24745C908();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_247454C3C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_24745C938();
    if (!v8)
    {
      result = sub_24745C980();
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

void *sub_247454B78(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_24745C998();
  __break(1u);
  return result;
}

uint64_t sub_247454C3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_247454CD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_247454EA4(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_247454EA4((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_247454CD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_24745C824();
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
  v3 = sub_247454E40(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_24745C92C();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_24745C998();
  __break(1u);
LABEL_14:
  result = sub_24745C980();
  __break(1u);
  return result;
}

_QWORD *sub_247454E40(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447BF8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_247454EA4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447BF8);
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
    sub_24745503C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_247454F78(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_247454F78(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_24745C998();
  __break(1u);
  return result;
}

char *sub_24745503C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24745C998();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2474550C0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_2474550E4(void *a1)
{
  sub_247453918(a1);
}

id sub_2474550EC(void *a1)
{
  uint64_t v1;

  return sub_247453FF0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2474550FC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
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

uint64_t sub_247455134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5C08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24745517C(void *a1)
{
  uint64_t v1;

  sub_2474539EC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_247455188(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2576A5C10);
  v38 = a2;
  v6 = sub_24745C98C();
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
    sub_24745C9B0();
    sub_24745C818();
    result = sub_24745C9BC();
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
      sub_24745548C(0, (unint64_t)(v34 + 63) >> 6, v17);
    else
      *v17 = -1 << v34;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_247455484()
{
  return swift_release();
}

uint64_t sub_24745548C(uint64_t result, uint64_t a2, _QWORD *a3)
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

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_2474554B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_2474554F8(void *a1)
{
  sub_2474532C8(a1);
}

void sub_247455504(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_43();
}

void sub_24745553C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_43();
}

uint64_t sub_24745557C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2474555A0()
{
  swift_release();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_2474555BC(uint64_t a1)
{
  uint64_t v1;

  sub_247452B48(a1, *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_2474555C8()
{
  return swift_deallocObject();
}

void sub_2474555D8(uint64_t a1)
{
  uint64_t v1;

  sub_247452730(a1, *(_BYTE *)(v1 + 16));
}

uint64_t sub_2474555E0()
{
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_2474555FC(uint64_t a1)
{
  sub_247452158(a1);
}

void sub_247455604()
{
  sub_247451218();
}

uint64_t sub_247455624()
{
  uint64_t v0;

  OUTLINED_FUNCTION_50();

  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_247455644()
{
  sub_247451218();
}

void sub_247455664()
{
  sub_247451218();
}

void sub_247455684()
{
  sub_247451218();
}

void sub_2474556A4()
{
  sub_247451218();
}

void sub_2474556C4()
{
  sub_247451218();
}

void sub_2474556E4()
{
  sub_247451218();
}

void sub_247455704()
{
  sub_247451218();
}

void sub_247455724()
{
  sub_247451218();
}

void sub_247455744()
{
  sub_247451218();
}

void sub_247455764()
{
  sub_247451218();
}

void sub_247455784()
{
  sub_247451218();
}

void sub_2474557A4()
{
  sub_247451218();
}

void sub_2474557C4()
{
  sub_247451218();
}

void sub_2474557E4()
{
  sub_247451218();
}

void sub_247455804()
{
  uint64_t v0;

  sub_247450EE4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_24745580C()
{
  uint64_t v0;

  return sub_247450C98(*(void **)(v0 + 16));
}

void sub_247455814(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24957B770](a3, v5), a1);
  }
  OUTLINED_FUNCTION_43();
}

void sub_247455850(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24957B770](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_43();
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_deallocObject();
}

void OUTLINED_FUNCTION_5_0()
{
  sub_2474504F8();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return sub_24745C7DC();
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_24745C794();
}

void *OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 144) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_14(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_24745C920();
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

id OUTLINED_FUNCTION_21(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void OUTLINED_FUNCTION_22(id a1)
{

}

id OUTLINED_FUNCTION_24(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_25(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t OUTLINED_FUNCTION_27()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_28()
{
  void *v0;

}

void OUTLINED_FUNCTION_29()
{
  JUMPOUT(0x24957B314);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_31()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_33(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_34()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_24745C878();
}

BOOL OUTLINED_FUNCTION_37(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_38(unint64_t *a1)
{
  uint64_t *v1;

  sub_247455850(a1, v1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t *v0;

  return __swift_instantiateConcreteTypeFromMangledName(v0);
}

id OUTLINED_FUNCTION_44()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 2264), 3);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_46(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void OUTLINED_FUNCTION_47()
{
  const void *v0;

  _Block_release(v0);
}

id OUTLINED_FUNCTION_48(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_release();
}

void OUTLINED_FUNCTION_50()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;

  return sub_247454634(a1, v6, a3, a4, a5, a6);
}

uint64_t OUTLINED_FUNCTION_52()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_retain();
}

id OUTLINED_FUNCTION_55(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_24745C7B8();
}

uint64_t OUTLINED_FUNCTION_57()
{
  return sub_24745C7C4();
}

void *OUTLINED_FUNCTION_58()
{
  uint64_t v0;

  return _Block_copy((const void *)(v0 - 128));
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1, unint64_t *a2)
{
  return sub_24744F9A0(0, a2);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return swift_bridgeObjectRelease_n();
}

void OUTLINED_FUNCTION_61()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_62@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

id sub_247455CEC(uint64_t a1, uint64_t a2)
{
  char *v2;
  id v4;
  objc_super v6;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  *(_QWORD *)&v2[OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue] = a2;
  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for UIBridgeServiceDelegateWrapper();
  v4 = objc_msgSendSuper2(&v6, sel_init);
  swift_unknownObjectRelease();
  return v4;
}

uint64_t sub_247455D6C()
{
  return sub_2474561F0(sub_247456A84);
}

uint64_t sub_247455DAC()
{
  return sub_2474561F0(sub_247456D1C);
}

uint64_t sub_247455DEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_10_0();
  v0 = OUTLINED_FUNCTION_13_0();
  return sub_247456FB4(v0, v1, v2, v3);
}

void sub_247455E30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v4 = a1 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x24957B86C](v4);
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)MEMORY[0x24957B86C](v5 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v7)
    {
      if ((objc_msgSend(v7, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_) & 1) != 0)
      {
        if (a3)
          a3 = (void *)sub_24745C800();
        objc_msgSend(v7, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, a3);
        swift_unknownObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_247455F5C(uint64_t a1)
{
  return sub_24745615C(a1, (uint64_t (*)(void))sub_2474572E4);
}

uint64_t sub_247455FA8()
{
  return sub_2474561F0(sub_2474575A8);
}

uint64_t sub_247455FE8(char a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  return sub_247457840(v1, v3, a1);
}

void sub_24745602C(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24957B86C](v3);
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x24957B86C](v4 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v6)
    {
      if ((objc_msgSend(v6, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_) & 1) != 0)
        objc_msgSend(v6, sel_uiBridgeServiceDetectedSpeechStart_, a2 & 1);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_247456110()
{
  return sub_2474561F0(sub_247457B08);
}

uint64_t sub_247456150(uint64_t a1)
{
  return sub_24745615C(a1, (uint64_t (*)(void))sub_247457DA0);
}

uint64_t sub_24745615C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_2_3(v2, v4, a1, a2);
}

uint64_t sub_2474561E4()
{
  return sub_2474561F0(sub_247458064);
}

uint64_t sub_2474561F0(uint64_t (*a1)(uint64_t, uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  return a1(v1, v2);
}

void sub_247456234(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 16;
  OUTLINED_FUNCTION_7_0();
  if (MEMORY[0x24957B86C](v1))
    OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_2474562EC(void *a1)
{
  return sub_2474567F8(a1, (uint64_t (*)(void))sub_2474582FC);
}

uint64_t sub_24745634C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_10_0();
  return sub_2474585E4(v1, v3, a1);
}

void sub_247456394(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24957B86C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x24957B86C](v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v4)
    {
      if ((objc_msgSend(v4, sel_respondsToSelector_, sel_uiBridgeServiceDidReceiveTasks_) & 1) != 0)
      {
        sub_247459420();
        v5 = (void *)sub_24745C830();
        objc_msgSend(v4, sel_uiBridgeServiceDidReceiveTasks_, v5);
        swift_unknownObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

void sub_2474564B0(uint64_t a1)
{
  sub_2474564E4(a1, (uint64_t)&unk_2518A5470, (void (*)(void))sub_2474593AC);
}

void sub_2474564D0(uint64_t a1)
{
  sub_2474564E4(a1, (uint64_t)&unk_2518A5448, (void (*)(void))sub_2474592A8);
}

void sub_2474564E4(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = OUTLINED_FUNCTION_6_1();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10 + v9, (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  swift_retain();
  sub_247458F24(a3, v10);
  swift_release();
  swift_release();
  OUTLINED_FUNCTION_2_2();
}

uint64_t sub_2474565D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  v3 = MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_7_0();
  result = MEMORY[0x24957B86C](a1 + 16);
  if (result)
    OUTLINED_FUNCTION_12_0();
  return result;
}

uint64_t sub_247456768(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v7 = OUTLINED_FUNCTION_6_1();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_18();
  sub_24745C44C();
  v9 = a1;
  a4(v4);

  return OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
}

uint64_t sub_2474567EC(void *a1)
{
  return sub_2474567F8(a1, (uint64_t (*)(void))sub_247458910);
}

uint64_t sub_2474567F8(void *a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;

  v4 = OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_2_3(v2, v4, (uint64_t)a1, a2);
}

void sub_247456844(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 + 16;
  OUTLINED_FUNCTION_7_0();
  if (MEMORY[0x24957B86C](v1))
    OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_8_1();
}

uint64_t sub_247456924()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_10_0();
  v0 = OUTLINED_FUNCTION_13_0();
  return sub_247458BF8(v0, v1, v2, v3);
}

void sub_247456968(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x24957B86C](v1);
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)MEMORY[0x24957B86C](v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);

    if (v4)
    {
      if ((objc_msgSend(v4, sel_respondsToSelector_, sel_uiBridgeServiceDidDetectLanguageMismatch_) & 1) != 0)
      {
        v5 = (void *)sub_24745C800();
        objc_msgSend(v4, sel_uiBridgeServiceDidDetectLanguageMismatch_, v5);
        swift_unknownObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
}

uint64_t sub_247456A84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = sub_24745C7B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C7DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2474595DC;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_139_0;
    v14 = _Block_copy(aBlock);
    swift_retain_n();
    v15 = v12;
    v21[0] = v5;
    v16 = v15;
    sub_24745C7C4();
    v21[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v11, v7, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
    return swift_release_n();
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceWillStartAttending) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceWillStartAttending);
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_247456D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = sub_24745C7B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C7DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2474595BC;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_131;
    v14 = _Block_copy(aBlock);
    swift_retain_n();
    v15 = v12;
    v21[0] = v5;
    v16 = v15;
    sub_24745C7C4();
    v21[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v11, v7, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
    return swift_release_n();
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttending) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceDidStartAttending);
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_247456FB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v8 = sub_24745C7B8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_24745C7DC();
  v27 = *(_QWORD *)(v12 - 8);
  v28 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  v16 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v16)
  {
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = sub_2474595B0;
    *(_QWORD *)(v17 + 24) = v15;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_123;
    v18 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    v19 = v16;
    v26 = v9;
    v20 = v19;
    swift_retain();
    swift_retain();
    sub_24745C7C4();
    v29 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v14, v11, v18);
    _Block_release(v18);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v8);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v28);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v21 = MEMORY[0x24957B86C](a2 + 16);
  if (!v21)
  {
    swift_bridgeObjectRetain();
    goto LABEL_10;
  }
  v22 = (void *)v21;
  v23 = (void *)MEMORY[0x24957B86C](v21 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_bridgeObjectRetain();
  swift_retain();

  if (!v23)
  {
    swift_release();
    goto LABEL_10;
  }
  if ((objc_msgSend(v23, sel_respondsToSelector_, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_) & 1) != 0)
  {
    if (a4)
      v24 = (void *)sub_24745C800();
    else
      v24 = 0;
    objc_msgSend(v23, sel_uiBridgeServiceDidStartAttendingWithRootRequestId_, v24);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2474572E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24745C7DC();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_247459564;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_112;
    v16 = _Block_copy(aBlock);
    swift_retain();
    v17 = v14;
    swift_retain();
    sub_24745C7C4();
    v24 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_) & 1) != 0)objc_msgSend(v20, sel_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason_, a3);
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_2474575A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = sub_24745C7B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C7DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_24745952C;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_101;
    v14 = _Block_copy(aBlock);
    swift_retain_n();
    v15 = v12;
    v21[0] = v5;
    v16 = v15;
    sub_24745C7C4();
    v21[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v11, v7, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
    return swift_release_n();
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSpeechStart);
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_247457840(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24745C7DC();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_BYTE *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_247459520;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_93;
    v16 = _Block_copy(aBlock);
    swift_retain();
    v17 = v14;
    swift_retain();
    sub_24745C7C4();
    v24 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSpeechStart_) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSpeechStart_, a3 & 1);
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_247457B08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = sub_24745C7B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C7DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2474594E0;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_82_0;
    v14 = _Block_copy(aBlock);
    swift_retain_n();
    v15 = v12;
    v21[0] = v5;
    v16 = v15;
    sub_24745C7C4();
    v21[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v11, v7, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
    return swift_release_n();
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceDetectedSiriDirectedSpeech) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceDetectedSiriDirectedSpeech);
  swift_release_n();
  return swift_unknownObjectRelease();
}

uint64_t sub_247457DA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24745C7DC();
  v23 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_2474594C0;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_74;
    v16 = _Block_copy(aBlock);
    swift_retain();
    v17 = v14;
    swift_retain();
    sub_24745C7C4();
    v24 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    v22[1] = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v12, v10);
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
  {
    swift_release();
    return swift_release();
  }
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSpeechMitigationResult_) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceReceivedSpeechMitigationResult_, a3);
  swift_release();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_247458064(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  _QWORD aBlock[6];

  v4 = sub_24745C7B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24745C7DC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2474594A0;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_63;
    v14 = _Block_copy(aBlock);
    swift_retain_n();
    v15 = v12;
    v21[0] = v5;
    v16 = v15;
    sub_24745C7C4();
    v21[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v11, v7, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v21[0] + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    swift_release_n();
    return swift_release();
  }
  swift_beginAccess();
  v18 = MEMORY[0x24957B86C](a2 + 16);
  if (!v18)
    return swift_release();
  v19 = (void *)v18;
  v20 = (void *)MEMORY[0x24957B86C](v18 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();

  if (!v20)
    return swift_release_n();
  if ((objc_msgSend(v20, sel_respondsToSelector_, sel_uiBridgeServiceReceivedShowAssetsDownloadPrompt) & 1) != 0)
    objc_msgSend(v20, sel_uiBridgeServiceReceivedShowAssetsDownloadPrompt);
  swift_release_n();
  return swift_unknownObjectRelease();
}

void sub_2474582FC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_24745C7DC();
  v10 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_247459480;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_55_0;
    v16 = _Block_copy(aBlock);
    v27[0] = v7;
    v17 = v16;
    swift_retain();
    v18 = a3;
    v19 = v14;
    v27[1] = a2;
    v20 = a3;
    v21 = v19;
    swift_retain();
    sub_24745C7C4();
    v29 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v17);
    _Block_release(v17);

    a3 = v20;
    (*(void (**)(char *, uint64_t))(v27[0] + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v28);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  swift_beginAccess();
  v22 = MEMORY[0x24957B86C](a2 + 16);
  if (!v22)
  {
    swift_retain();
    v26 = a3;
    goto LABEL_9;
  }
  v23 = (void *)v22;
  v24 = (void *)MEMORY[0x24957B86C](v22 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  v25 = a3;

  if (!v24)
  {
LABEL_9:
    swift_release();
    goto LABEL_10;
  }
  if ((objc_msgSend(v24, sel_respondsToSelector_, sel_uiBridgeServiceReceivedRequestProgress_) & 1) != 0)
    objc_msgSend(v24, sel_uiBridgeServiceReceivedRequestProgress_, v25);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
LABEL_11:

}

uint64_t sub_2474585E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_24745C7DC();
  v10 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_247459418;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_44;
    v16 = _Block_copy(aBlock);
    v25[0] = v7;
    v17 = v16;
    swift_retain();
    swift_bridgeObjectRetain();
    v18 = v14;
    v25[1] = a2;
    v19 = v18;
    swift_retain();
    sub_24745C7C4();
    v27 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v25[0] + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v26);
    swift_release();
    swift_release();
LABEL_9:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v20 = MEMORY[0x24957B86C](a2 + 16);
  if (!v20)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x24957B86C](v20 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  swift_bridgeObjectRetain();

  if (!v22)
  {
LABEL_8:
    swift_release();
    goto LABEL_9;
  }
  if ((objc_msgSend(v22, sel_respondsToSelector_, sel_uiBridgeServiceDidReceiveTasks_) & 1) != 0)
  {
    sub_247459420();
    v23 = (void *)sub_24745C830();
    objc_msgSend(v22, sel_uiBridgeServiceDidReceiveTasks_, v23);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void sub_247458910(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_24745C7DC();
  v10 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v14)
  {
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = sub_247459284;
    *(_QWORD *)(v15 + 24) = v13;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_25;
    v16 = _Block_copy(aBlock);
    v27[0] = v7;
    v17 = v16;
    swift_retain();
    v18 = a3;
    v19 = v14;
    v27[1] = a2;
    v20 = a3;
    v21 = v19;
    swift_retain();
    sub_24745C7C4();
    v29 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v12, v9, v17);
    _Block_release(v17);

    a3 = v20;
    (*(void (**)(char *, uint64_t))(v27[0] + 8))(v9, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v28);
    swift_release();
    swift_release();
LABEL_10:
    swift_release();
    goto LABEL_11;
  }
  swift_beginAccess();
  v22 = MEMORY[0x24957B86C](a2 + 16);
  if (!v22)
  {
    swift_retain();
    v26 = a3;
    goto LABEL_9;
  }
  v23 = (void *)v22;
  v24 = (void *)MEMORY[0x24957B86C](v22 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  v25 = a3;

  if (!v24)
  {
LABEL_9:
    swift_release();
    goto LABEL_10;
  }
  if ((objc_msgSend(v24, sel_respondsToSelector_, sel_uiBridgeServiceReceivedSiriResponse_) & 1) != 0)
    objc_msgSend(v24, sel_uiBridgeServiceReceivedSiriResponse_, v25);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
LABEL_11:

}

uint64_t sub_247458BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD aBlock[6];

  v8 = sub_24745C7B8();
  v27 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_24745C7DC();
  v11 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = a2;
  v14[3] = a3;
  v14[4] = a4;
  v15 = *(void **)(a1 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v15)
  {
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = sub_247459274;
    *(_QWORD *)(v16 + 24) = v14;
    aBlock[4] = sub_2474559F8;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_14;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_bridgeObjectRetain();
    v18 = v15;
    v25 = a2;
    v19 = v18;
    swift_retain();
    sub_24745C7C4();
    v28 = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v13, v10, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v8);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
    swift_release();
    swift_release();
LABEL_9:
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_beginAccess();
  v20 = MEMORY[0x24957B86C](a2 + 16);
  if (!v20)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    goto LABEL_8;
  }
  v21 = (void *)v20;
  v22 = (void *)MEMORY[0x24957B86C](v20 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegate);
  swift_retain();
  swift_bridgeObjectRetain();

  if (!v22)
  {
LABEL_8:
    swift_release();
    goto LABEL_9;
  }
  if ((objc_msgSend(v22, sel_respondsToSelector_, sel_uiBridgeServiceDidDetectLanguageMismatch_) & 1) != 0)
  {
    v23 = (void *)sub_24745C800();
    objc_msgSend(v22, sel_uiBridgeServiceDidDetectLanguageMismatch_, v23);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
  return swift_bridgeObjectRelease();
}

void sub_247458F24(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v6 = sub_24745C7B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24745C7DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_18();
  v12 = *(void **)(v2 + OBJC_IVAR____TtC12SiriUIBridge30UIBridgeServiceDelegateWrapper_delegateQueue);
  if (v12)
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a1;
    *(_QWORD *)(v13 + 24) = a2;
    aBlock[4] = sub_2474550C0;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_247450D7C;
    aBlock[3] = &block_descriptor_2;
    v14 = _Block_copy(aBlock);
    v15 = v12;
    swift_retain();
    sub_24745C7C4();
    v16[1] = MEMORY[0x24BEE4AF8];
    sub_2474591C8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254447EE0);
    sub_247459208();
    sub_24745C920();
    MEMORY[0x24957B314](0, v3, v9, v14);
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    OUTLINED_FUNCTION_11_0(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8));
    swift_release();
  }
  else
  {
    a1();
  }
  OUTLINED_FUNCTION_2_2();
}

void sub_2474590D4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_24745910C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for UIBridgeServiceDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for UIBridgeServiceDelegateWrapper()
{
  return objc_opt_self();
}

uint64_t sub_247459194()
{
  swift_release();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
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

unint64_t sub_2474591C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447ED8;
  if (!qword_254447ED8)
  {
    v1 = sub_24745C7B8();
    result = MEMORY[0x24957B770](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_254447ED8);
  }
  return result;
}

unint64_t sub_247459208()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254447EE8;
  if (!qword_254447EE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254447EE0);
    result = MEMORY[0x24957B770](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254447EE8);
  }
  return result;
}

uint64_t sub_24745924C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_247459274()
{
  uint64_t v0;

  sub_247456968(*(_QWORD *)(v0 + 16));
}

void sub_247459284()
{
  uint64_t v0;

  sub_247456844(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2474592A8()
{
  return sub_2474593B8();
}

uint64_t sub_2474592B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2474592FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroy_28Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_6_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  OUTLINED_FUNCTION_5_1();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2474593AC()
{
  return sub_2474593B8();
}

uint64_t sub_2474593B8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_6_1();
  return sub_2474565D0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2474593F8()
{
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_247459418()
{
  uint64_t v0;

  sub_247456394(*(_QWORD *)(v0 + 16));
}

unint64_t sub_247459420()
{
  unint64_t result;

  result = qword_254447B90;
  if (!qword_254447B90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254447B90);
  }
  return result;
}

uint64_t objectdestroy_17Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_1();

  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_247459480()
{
  uint64_t v0;

  sub_247456844(*(_QWORD *)(v0 + 16));
}

void sub_2474594A0()
{
  uint64_t v0;

  sub_247456234(v0);
}

void sub_2474594C0()
{
  uint64_t v0;

  sub_247456844(*(_QWORD *)(v0 + 16));
}

void sub_2474594E0()
{
  uint64_t v0;

  sub_247456234(v0);
}

uint64_t sub_247459500()
{
  OUTLINED_FUNCTION_5_1();
  return swift_deallocObject();
}

void sub_247459520()
{
  uint64_t v0;

  sub_24745602C(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

void sub_24745952C()
{
  uint64_t v0;

  sub_247456234(v0);
}

uint64_t sub_24745954C()
{
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_27();
  return swift_deallocObject();
}

void sub_247459564()
{
  uint64_t v0;

  sub_247456844(*(_QWORD *)(v0 + 16));
}

uint64_t objectdestroy_6Tm()
{
  OUTLINED_FUNCTION_5_1();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2474595B0()
{
  uint64_t v0;

  sub_247455E30(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

void sub_2474595BC()
{
  uint64_t v0;

  sub_247456234(v0);
}

void sub_2474595DC()
{
  uint64_t v0;

  sub_247456234(v0);
}

uint64_t sub_2474595FC(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_unknownObjectWeakInit();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return sub_24745C458();
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

void OUTLINED_FUNCTION_12_0()
{
  JUMPOUT(0x24957B86CLL);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_247459744()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  __int128 *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  __int128 *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 *v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  OUTLINED_FUNCTION_8_0();
  v34 = v1;
  v35 = v2;
  v3 = v0;
  v32 = v4;
  v30 = v5;
  v31 = v6;
  v28 = v7;
  v29 = v8;
  v27 = v9;
  v26 = sub_24745C89C();
  v10 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C890();
  v13 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_18();
  v16 = (_QWORD *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId);
  *v16 = 0;
  v16[1] = 0;
  v17 = (_QWORD *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_requestId);
  *v17 = 0;
  v17[1] = 0;
  v18 = (_QWORD *)(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId);
  sub_24745C278();
  *v18 = 0;
  v18[1] = 0;
  sub_24745C7D0();
  v33 = MEMORY[0x24BEE4AF8];
  sub_247455814((unint64_t *)&qword_254447E50, v13, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447E38);
  sub_247455850((unint64_t *)&qword_254447E40, &qword_254447E38);
  sub_24745C920();
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5750], v26);
  *(_QWORD *)(v0 + 16) = sub_24745C8B4();
  v19 = v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  v20 = OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 32))(v19, v27, v20);
  v21 = (_QWORD *)(v3 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_assistantId);
  v23 = v29;
  v22 = v30;
  *v21 = v28;
  v21[1] = v23;
  sub_24745C2B4(v22, v3 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher);
  v24 = v31;
  swift_unknownObjectUnownedInit();

  *(_BYTE *)(v3 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) = v32;
  return v3;
}

void sub_247459988()
{
  sub_247459B8C();
}

void sub_24745999C(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v2 = objc_allocWithZone((Class)sub_24745C6E0());
  v3 = sub_24745C6D4();
  if (v3)
  {
    oslog = v3;
    if (qword_254447E18 != -1)
      swift_once();
    v4 = sub_24745C7A0();
    __swift_project_value_buffer(v4, (uint64_t)qword_254447F40);
    v5 = sub_24745C794();
    v6 = sub_24745C878();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_247449000, v5, v6, "Going to post SiriDismissedMessage", v7, 2u);
      MEMORY[0x24957B7F4](v7, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_24745C68C();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = sub_24745C7A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
    oslog = sub_24745C794();
    v9 = sub_24745C884();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_247449000, oslog, v9, "Could not create SiriDismissedMessage", v10, 2u);
      MEMORY[0x24957B7F4](v10, -1, -1);
    }
  }

}

void sub_247459B78()
{
  sub_247459B8C();
}

void sub_247459B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  OUTLINED_FUNCTION_8_0();
  v2 = OUTLINED_FUNCTION_20_0();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = OUTLINED_FUNCTION_6_0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_18();
  v7 = OUTLINED_FUNCTION_58();
  swift_retain();
  OUTLINED_FUNCTION_57();
  sub_247455814((unint64_t *)&qword_254447ED8, v3, MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  OUTLINED_FUNCTION_14_0();
  sub_24745C920();
  v8 = OUTLINED_FUNCTION_16_0();
  MEMORY[0x24957B314](v8);
  _Block_release(v7);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v0, v2);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v5);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_247459CD8(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  NSObject *v15;

  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId + 8))
  {
    MEMORY[0x24BDAC7A8](a1);
    v2 = objc_allocWithZone((Class)sub_24745C6C8());
    swift_bridgeObjectRetain();
    v3 = (void *)sub_24745C6BC();
    swift_bridgeObjectRelease();
    if (v3)
    {
      if (qword_254447E18 != -1)
        swift_once();
      v4 = sub_24745C7A0();
      __swift_project_value_buffer(v4, (uint64_t)qword_254447F40);
      v5 = sub_24745C794();
      v6 = sub_24745C878();
      if (os_log_type_enabled(v5, v6))
      {
        v7 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_247449000, v5, v6, "Going to post SiriPromptedMessage", v7, 2u);
        MEMORY[0x24957B7F4](v7, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
      sub_24745C68C();

    }
    else
    {
      if (qword_254447E18 != -1)
        swift_once();
      v11 = sub_24745C7A0();
      __swift_project_value_buffer(v11, (uint64_t)qword_254447F40);
      v12 = sub_24745C794();
      v13 = sub_24745C884();
      if (os_log_type_enabled(v12, v13))
      {
        v14 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_247449000, v12, v13, "Could not create SiriPromptedMessage", v14, 2u);
        MEMORY[0x24957B7F4](v14, -1, -1);
      }

    }
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = sub_24745C7A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
    v15 = sub_24745C794();
    v9 = sub_24745C884();
    if (os_log_type_enabled(v15, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_247449000, v15, v9, "RootRequestId not found in UISessionProcessor. Cannot attribute the SiriPromptedMessage to a request in the current session, dropping.", v10, 2u);
      MEMORY[0x24957B7F4](v10, -1, -1);
    }

  }
}

uint64_t sub_247459FD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447E20);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD70];
  v10 = sub_24745C6A4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 104))(v8, v9, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  sub_24745C650();
  swift_bridgeObjectRetain();
  sub_24745C644();
  v11 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  v12 = sub_24745C458();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v5, v11, v12);
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 0, 1, v12);
  sub_24745C668();
  swift_bridgeObjectRetain();
  return sub_24745C65C();
}

void sub_24745A15C()
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
  unint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  void (*v23)();
  uint64_t v24;

  OUTLINED_FUNCTION_8_0();
  v3 = v2;
  v17 = *(_QWORD *)(OUTLINED_FUNCTION_20_0() - 8);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v4);
  v5 = OUTLINED_FUNCTION_6_0();
  v15 = *(_QWORD *)(v5 - 8);
  v16 = v5;
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_18();
  v7 = OUTLINED_FUNCTION_22_0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v7);
  v14[1] = *(_QWORD *)(v0 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, v7);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v0;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v11 + v10, (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
  v23 = sub_24745C1F8;
  v24 = v11;
  v19 = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_247450D7C;
  v22 = &block_descriptor_93_0;
  v12 = OUTLINED_FUNCTION_58();
  swift_retain();
  OUTLINED_FUNCTION_57();
  v18 = MEMORY[0x24BEE4AF8];
  sub_247455814((unint64_t *)&qword_254447ED8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  OUTLINED_FUNCTION_14_0();
  sub_24745C920();
  v13 = OUTLINED_FUNCTION_16_0();
  MEMORY[0x24957B314](v13);
  _Block_release(v12);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v1, v16);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_24745A324(uint64_t a1)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;

  v2 = objc_allocWithZone((Class)sub_24745C578());
  v3 = sub_24745C53C();
  if (v3)
  {
    v4 = v3;
    if (qword_254447E18 != -1)
      swift_once();
    v5 = sub_24745C7A0();
    __swift_project_value_buffer(v5, (uint64_t)qword_254447F40);
    v6 = sub_24745C794();
    v7 = sub_24745C878();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_247449000, v6, v7, "Going to post StopAttendingRequestedMessage", v8, 2u);
      MEMORY[0x24957B7F4](v8, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_24745C68C();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v9 = sub_24745C7A0();
    __swift_project_value_buffer(v9, (uint64_t)qword_254447F40);
    v4 = sub_24745C794();
    v10 = sub_24745C884();
    if (os_log_type_enabled(v4, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_247449000, v4, v10, "Could not create StopAttendingMessage", v11, 2u);
      MEMORY[0x24957B7F4](v11, -1, -1);
    }
  }

}

uint64_t sub_24745A50C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254447E28);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254447E20);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD70];
  v15 = sub_24745C6A4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  __swift_storeEnumTagSinglePayload((uint64_t)v13, 0, 1, v15);
  sub_24745C560();
  swift_bridgeObjectRetain();
  sub_24745C554();
  v16 = a2 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  v17 = sub_24745C458();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, v16, v17);
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v17);
  sub_24745C56C();
  v18 = sub_24745C704();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v7, a3, v18);
  __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v18);
  return sub_24745C548();
}

void sub_24745A6F0()
{
  sub_247459B8C();
}

void sub_24745A704(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v2 = objc_allocWithZone((Class)sub_24745C590());
  v3 = sub_24745C584();
  if (v3)
  {
    oslog = v3;
    if (qword_254447E18 != -1)
      swift_once();
    v4 = sub_24745C7A0();
    __swift_project_value_buffer(v4, (uint64_t)qword_254447F40);
    v5 = sub_24745C794();
    v6 = sub_24745C878();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_247449000, v5, v6, "Going to post StartAttendingRequestedMessage", v7, 2u);
      MEMORY[0x24957B7F4](v7, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher), *(_QWORD *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher + 24));
    sub_24745C68C();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = sub_24745C7A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
    oslog = sub_24745C794();
    v9 = sub_24745C884();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_247449000, oslog, v9, "Could not create StartAttendingRequestedMessage", v10, 2u);
      MEMORY[0x24957B7F4](v10, -1, -1);
    }
  }

}

void sub_24745A8E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *);
  void (*v23)(char *);
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(char *);
  void (*v27)(char *);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_8_0();
  a19 = v20;
  a20 = v21;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447C10);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&a9 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254447E20);
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&a9 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *MEMORY[0x24BE9AD70];
  v37 = sub_24745C6A4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v35, v36, v37);
  __swift_storeEnumTagSinglePayload((uint64_t)v35, 0, 1, v37);
  v27(v35);
  v38 = *(_QWORD *)(v29 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_assistantId);
  v39 = *(_QWORD *)(v29 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_assistantId + 8);
  swift_bridgeObjectRetain();
  v25(v38, v39);
  v40 = v29 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  v41 = OUTLINED_FUNCTION_6_1();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v32, v40, v41);
  __swift_storeEnumTagSinglePayload((uint64_t)v32, 0, 1, v41);
  v23(v32);
  OUTLINED_FUNCTION_2_2();
}

void sub_24745AA34()
{
  sub_24745ABE4();
}

void sub_24745AA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  NSObject *Strong;
  char v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v0 = sub_24745C458();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v4 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v4 & 1) != 0)
  {
    Strong = swift_unknownObjectUnownedLoadStrong();
    v6 = sub_24745C4E8();
    sub_247452654(v6 & 1);
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v7 = sub_24745C7A0();
    __swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
    Strong = sub_24745C794();
    v8 = sub_24745C878();
    if (os_log_type_enabled(Strong, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_247449000, Strong, v8, "SpeechStartDetectedMessage does not belong to current session", v9, 2u);
      MEMORY[0x24957B7F4](v9, -1, -1);
    }
  }

}

void sub_24745ABC8()
{
  sub_24745ABE4();
}

void sub_24745ABE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  OUTLINED_FUNCTION_8_0();
  v2 = v0;
  v4 = v3;
  OUTLINED_FUNCTION_20_0();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  OUTLINED_FUNCTION_23();
  MEMORY[0x24BDAC7A8]();
  v11 = OUTLINED_FUNCTION_6_0();
  v6 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_18();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v2;
  *(_QWORD *)(v7 + 24) = v4;
  v8 = OUTLINED_FUNCTION_58();
  swift_retain();
  v9 = v4;
  OUTLINED_FUNCTION_57();
  sub_247455814((unint64_t *)&qword_254447ED8, v5, MEMORY[0x24BEE5468]);
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_38((unint64_t *)&qword_254447EE8);
  sub_24745C920();
  v10 = OUTLINED_FUNCTION_16_0();
  MEMORY[0x24957B314](v10);
  _Block_release(v8);
  OUTLINED_FUNCTION_11();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v1, v11);
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_2_2();
}

void sub_24745AD58()
{
  sub_24745ABE4();
}

void sub_24745AD74(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[2];

  v4 = sub_24745C458();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v8 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) == 1)
      v9 = OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId;
    else
      v9 = OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_requestId;
    v17 = (_QWORD *)(a1 + v9);
    *v17 = 0;
    v17[1] = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v10 = sub_24745C7A0();
    __swift_project_value_buffer(v10, (uint64_t)qword_254447F40);
    v11 = a2;
    v12 = sub_24745C794();
    v13 = sub_24745C878();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v14 = 138412290;
      v18[1] = v11;
      v16 = v11;
      sub_24745C8FC();
      *v15 = v11;

      _os_log_impl(&dword_247449000, v12, v13, "%@ does not belong to current session", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5BF8);
      swift_arrayDestroy();
      MEMORY[0x24957B7F4](v15, -1, -1);
      MEMORY[0x24957B7F4](v14, -1, -1);

    }
    else
    {

    }
  }
}

void sub_24745AFB8()
{
  sub_24745ABE4();
}

void sub_24745AFD4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  os_log_type_t v11;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_24_0();
  v5 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_2();
  if ((v5 & 1) != 0)
  {
    v6 = sub_24745C674();
    v7 = (uint64_t *)(a1 + *a3);
    *v7 = v6;
    v7[1] = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v9 = OUTLINED_FUNCTION_7();
    v10 = (void *)__swift_project_value_buffer(v9, (uint64_t)qword_254447F40);
    sub_24745C794();
    v11 = OUTLINED_FUNCTION_35();
    if (OUTLINED_FUNCTION_19_0(v11))
    {
      *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
      OUTLINED_FUNCTION_9_0(&dword_247449000);
      OUTLINED_FUNCTION_3();
    }

  }
  OUTLINED_FUNCTION_12_1();
}

void sub_24745B0D0()
{
  sub_24745ABE4();
}

void sub_24745B0EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v2 = sub_24745C458();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v6 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v6 & 1) != 0)
  {
    v7 = sub_24745C674();
    v8 = (uint64_t *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_rootRequestId);
    *v8 = v7;
    v8[1] = v9;
    swift_bridgeObjectRelease();
    if (*(_BYTE *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_isSystemAssistantExperienceEnabled) == 1)
    {
      v10 = v8[1];
      v11 = (uint64_t *)(a1 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId);
      *v11 = *v8;
      v11[1] = v10;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v12 = sub_24745C7A0();
    __swift_project_value_buffer(v12, (uint64_t)qword_254447F40);
    v13 = sub_24745C794();
    v14 = sub_24745C878();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_247449000, v13, v14, "StartRootSpeechRequestMessage does not belong to current session", v15, 2u);
      MEMORY[0x24957B7F4](v15, -1, -1);
    }

  }
}

void sub_24745B298()
{
  sub_24745ABE4();
}

void sub_24745B2B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  void *Strong;
  NSObject *v6;
  char v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;

  v0 = sub_24745C458();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v4 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v4 & 1) != 0)
  {
    if ((sub_24745C5CC() & 1) == 0)
    {
      Strong = (void *)swift_unknownObjectUnownedLoadStrong();
      sub_24745289C();

    }
    v6 = swift_unknownObjectUnownedLoadStrong();
    v7 = sub_24745C5CC();
    sub_2474529D8((void *)(v7 & 1));
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = sub_24745C7A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
    v6 = sub_24745C794();
    v9 = sub_24745C878();
    if (os_log_type_enabled(v6, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_247449000, v6, v9, "MitigationDecisionFinalizedMessage does not belong to current session", v10, 2u);
      MEMORY[0x24957B7F4](v10, -1, -1);
    }
  }

}

void sub_24745B460()
{
  sub_24745ABE4();
}

void sub_24745B47C()
{
  sub_24745ABE4();
}

void sub_24745B498()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v5;
  NSObject *Strong;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = sub_24745C458();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v4 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v4 & 1) != 0)
  {
    sub_24745C4D0();
    if (v5)
    {
      swift_bridgeObjectRelease();
      Strong = swift_unknownObjectUnownedLoadStrong();
      sub_24745239C();
      goto LABEL_13;
    }
    if (qword_254447E18 != -1)
      swift_once();
    v11 = sub_24745C7A0();
    __swift_project_value_buffer(v11, (uint64_t)qword_254447F40);
    Strong = sub_24745C794();
    v8 = sub_24745C884();
    if (os_log_type_enabled(Strong, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      v10 = "RequestId not found in UISessionProcessor";
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v7 = sub_24745C7A0();
    __swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
    Strong = sub_24745C794();
    v8 = sub_24745C878();
    if (os_log_type_enabled(Strong, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      v10 = "AttendingWillStartMessage does not belong to current session";
LABEL_12:
      _os_log_impl(&dword_247449000, Strong, v8, v10, v9, 2u);
      MEMORY[0x24957B7F4](v9, -1, -1);
    }
  }
LABEL_13:

}

void sub_24745B69C()
{
  sub_24745ABE4();
}

void sub_24745B6B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *Strong;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;

  v0 = sub_24745C458();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v4 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v4 & 1) != 0)
  {
    v5 = sub_24745C4B8();
    if (v6)
    {
      v7 = v5;
      v8 = v6;
      Strong = swift_unknownObjectUnownedLoadStrong();
      sub_247451FE4(v7, v8);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    if (qword_254447E18 != -1)
      swift_once();
    v14 = sub_24745C7A0();
    __swift_project_value_buffer(v14, (uint64_t)qword_254447F40);
    Strong = sub_24745C794();
    v11 = sub_24745C884();
    if (os_log_type_enabled(Strong, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      v13 = "RequestId not found in UISessionProcessor";
      goto LABEL_12;
    }
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v10 = sub_24745C7A0();
    __swift_project_value_buffer(v10, (uint64_t)qword_254447F40);
    Strong = sub_24745C794();
    v11 = sub_24745C878();
    if (os_log_type_enabled(Strong, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      v13 = "AttendingStartedMessage does not belong to current session";
LABEL_12:
      _os_log_impl(&dword_247449000, Strong, v11, v13, v12, 2u);
      MEMORY[0x24957B7F4](v12, -1, -1);
    }
  }
LABEL_13:

}

void sub_24745B8CC()
{
  sub_24745ABE4();
}

void sub_24745B8E8(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  char v5;
  void *Strong;
  uint64_t v7;
  os_log_type_t v8;

  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_24_0();
  v5 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_2();
  if ((v5 & 1) != 0)
  {
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    a3();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_7();
    Strong = (void *)__swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
    sub_24745C794();
    v8 = OUTLINED_FUNCTION_35();
    if (OUTLINED_FUNCTION_19_0(v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_4_0() = 0;
      OUTLINED_FUNCTION_9_0(&dword_247449000);
      OUTLINED_FUNCTION_3();
    }
  }

  OUTLINED_FUNCTION_12_1();
}

void sub_24745B9E0()
{
  sub_24745ABE4();
}

void sub_24745B9FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  void *Strong;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;

  v0 = sub_24745C458();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24745C680();
  v4 = sub_24745C440();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  if ((v4 & 1) != 0)
  {
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    v6 = sub_24745C5E4();
    sub_247452ED8(v6, v7);

    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v8 = sub_24745C7A0();
    __swift_project_value_buffer(v8, (uint64_t)qword_254447F40);
    v9 = sub_24745C794();
    v10 = sub_24745C878();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_247449000, v9, v10, "UnsupportedLanguageDetectedMessage does not belong to current session", v11, 2u);
      MEMORY[0x24957B7F4](v11, -1, -1);
    }

  }
}

void sub_24745BB80()
{
  sub_24745ABE4();
}

void sub_24745BB9C()
{
  sub_24745ABE4();
}

void sub_24745BBB8()
{
  sub_24745ABE4();
}

void sub_24745BBD4()
{
  sub_24745ABE4();
}

void sub_24745BBF0()
{
  void (*v0)(void *);
  void (*v1)(void *);
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  void *Strong;
  uint64_t v7;
  NSObject *v8;
  id v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;

  OUTLINED_FUNCTION_8_0();
  v1 = v0;
  v3 = v2;
  OUTLINED_FUNCTION_6_1();
  OUTLINED_FUNCTION_11_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_3_2();
  sub_24745C680();
  v5 = OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_5_2();
  if ((v5 & 1) != 0)
  {
    Strong = (void *)swift_unknownObjectUnownedLoadStrong();
    v1(v3);
  }
  else
  {
    if (qword_254447E18 != -1)
      swift_once();
    v7 = OUTLINED_FUNCTION_7();
    v8 = __swift_project_value_buffer(v7, (uint64_t)qword_254447F40);
    v9 = v3;
    sub_24745C794();
    v10 = OUTLINED_FUNCTION_35();
    if (os_log_type_enabled(v8, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_4_0();
      v12 = (_QWORD *)OUTLINED_FUNCTION_4_0();
      *(_DWORD *)v11 = 138412290;
      v13 = v9;
      sub_24745C8FC();
      *v12 = v9;

      _os_log_impl(&dword_247449000, v8, v10, "%@ does not belong to current session", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2576A5BF8);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_3();
    }

    Strong = v9;
  }

  OUTLINED_FUNCTION_2_2();
}

void sub_24745BDAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_sessionId;
  v2 = OUTLINED_FUNCTION_6_1();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_7_1();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_messagePublisher);
  swift_unknownObjectUnownedDestroy();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_43();
}

uint64_t sub_24745BE40()
{
  sub_24745BDAC();
  return swift_deallocClassInstance();
}

uint64_t sub_24745BE64()
{
  return type metadata accessor for UISessionProcessor();
}

uint64_t type metadata accessor for UISessionProcessor()
{
  uint64_t result;

  result = qword_254447C48;
  if (!qword_254447C48)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24745BEA4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24745C458();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_24745BF58()
{
  sub_24745BBF0();
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

void sub_24745BF94()
{
  sub_24745BBF0();
}

void sub_24745BFB8()
{
  sub_24745BBF0();
}

void sub_24745BFDC()
{
  sub_24745BBF0();
}

void sub_24745C000()
{
  sub_24745B9FC();
}

void sub_24745C00C()
{
  uint64_t v0;

  sub_24745B8E8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), sub_247452DFC);
}

void sub_24745C038()
{
  sub_24745B6B8();
}

void sub_24745C044()
{
  sub_24745B498();
}

void sub_24745C050()
{
  uint64_t v0;

  sub_24745B8E8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), sub_2474523C4);
}

void sub_24745C07C()
{
  sub_24745B2B4();
}

void sub_24745C088()
{
  uint64_t v0;

  sub_24745B0EC(*(_QWORD *)(v0 + 16));
}

void sub_24745C094()
{
  uint64_t v0;

  sub_24745AFD4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_promptRequestId);
}

void sub_24745C0C0()
{
  uint64_t v0;

  sub_24745AD74(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

void sub_24745C0CC()
{
  uint64_t v0;

  sub_24745AFD4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR____TtC12SiriUIBridge18UISessionProcessor_requestId);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_24745C124()
{
  sub_24745AA50();
}

void sub_24745C12C()
{
  uint64_t v0;

  sub_24745A704(v0);
}

#error "24745C158: call analysis failed (funcsize=12)"

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_24745C188()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = OUTLINED_FUNCTION_22_0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

void sub_24745C1F8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_22_0();
  sub_24745A324(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24745C224(uint64_t a1)
{
  uint64_t v1;

  return sub_24745A50C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_24745C22C()
{
  uint64_t v0;

  sub_247459CD8(v0);
}

uint64_t sub_24745C234(uint64_t a1)
{
  uint64_t v1;

  return sub_247459FD8(a1, *(_QWORD *)(v1 + 16));
}

void sub_24745C240()
{
  uint64_t v0;

  sub_24745999C(v0);
}

#error "24745C26C: call analysis failed (funcsize=12)"

unint64_t sub_24745C278()
{
  unint64_t result;

  result = qword_254447E58;
  if (!qword_254447E58)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254447E58);
  }
  return result;
}

uint64_t sub_24745C2B4(__int128 *a1, uint64_t a2)
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

uint64_t OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_9_0(void *a1)
{
  const char *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  _os_log_impl(a1, v2, v3, v1, v4, 2u);
}

uint64_t OUTLINED_FUNCTION_14_0()
{
  uint64_t v0;

  return v0 - 136;
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_24745C440();
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return 0;
}

BOOL OUTLINED_FUNCTION_19_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return sub_24745C7B8();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return sub_24745C704();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return sub_24745C680();
}

uint64_t sub_24745C434()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_24745C440()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_24745C44C()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_24745C458()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24745C464()
{
  return MEMORY[0x24BEE5DF0]();
}

uint64_t sub_24745C470()
{
  return MEMORY[0x24BE52970]();
}

uint64_t sub_24745C47C()
{
  return MEMORY[0x24BE52978]();
}

uint64_t sub_24745C488()
{
  return MEMORY[0x24BE99D48]();
}

uint64_t sub_24745C494()
{
  return MEMORY[0x24BE99DD0]();
}

uint64_t sub_24745C4A0()
{
  return MEMORY[0x24BE99DF0]();
}

uint64_t sub_24745C4AC()
{
  return MEMORY[0x24BE99F50]();
}

uint64_t sub_24745C4B8()
{
  return MEMORY[0x24BE99F70]();
}

uint64_t sub_24745C4C4()
{
  return MEMORY[0x24BE99FA0]();
}

uint64_t sub_24745C4D0()
{
  return MEMORY[0x24BE9A458]();
}

uint64_t sub_24745C4DC()
{
  return MEMORY[0x24BE9A488]();
}

uint64_t sub_24745C4E8()
{
  return MEMORY[0x24BE9A5C0]();
}

uint64_t sub_24745C4F4()
{
  return MEMORY[0x24BE9A5F0]();
}

uint64_t sub_24745C500()
{
  return MEMORY[0x24BE9A798]();
}

uint64_t sub_24745C50C()
{
  return MEMORY[0x24BE9A7A0]();
}

uint64_t sub_24745C518()
{
  return MEMORY[0x24BE9A7B0]();
}

uint64_t sub_24745C524()
{
  return MEMORY[0x24BE9A7B8]();
}

uint64_t sub_24745C530()
{
  return MEMORY[0x24BE9A818]();
}

uint64_t sub_24745C53C()
{
  return MEMORY[0x24BE9A850]();
}

uint64_t sub_24745C548()
{
  return MEMORY[0x24BE9A858]();
}

uint64_t sub_24745C554()
{
  return MEMORY[0x24BE9A860]();
}

uint64_t sub_24745C560()
{
  return MEMORY[0x24BE9A868]();
}

uint64_t sub_24745C56C()
{
  return MEMORY[0x24BE9A870]();
}

uint64_t sub_24745C578()
{
  return MEMORY[0x24BE9A878]();
}

uint64_t sub_24745C584()
{
  return MEMORY[0x24BE9A928]();
}

uint64_t sub_24745C590()
{
  return MEMORY[0x24BE9A948]();
}

uint64_t sub_24745C59C()
{
  return MEMORY[0x24BE9A990]();
}

uint64_t sub_24745C5A8()
{
  return MEMORY[0x24BE9A998]();
}

uint64_t sub_24745C5B4()
{
  return MEMORY[0x24BE9A9C0]();
}

uint64_t sub_24745C5C0()
{
  return MEMORY[0x24BE9A9C8]();
}

uint64_t sub_24745C5CC()
{
  return MEMORY[0x24BE9AA58]();
}

uint64_t sub_24745C5D8()
{
  return MEMORY[0x24BE9AA60]();
}

uint64_t sub_24745C5E4()
{
  return MEMORY[0x24BE9AAB8]();
}

uint64_t sub_24745C5F0()
{
  return MEMORY[0x24BE9AAC0]();
}

uint64_t sub_24745C5FC()
{
  return MEMORY[0x24BE9AAD8]();
}

uint64_t sub_24745C608()
{
  return MEMORY[0x24BE9AB60]();
}

uint64_t sub_24745C614()
{
  return MEMORY[0x24BE9AB70]();
}

uint64_t sub_24745C620()
{
  return MEMORY[0x24BE9AB78]();
}

uint64_t sub_24745C62C()
{
  return MEMORY[0x24BE9AB80]();
}

uint64_t sub_24745C638()
{
  return MEMORY[0x24BE9AC08]();
}

uint64_t sub_24745C644()
{
  return MEMORY[0x24BE9ACF8]();
}

uint64_t sub_24745C650()
{
  return MEMORY[0x24BE9AD00]();
}

uint64_t sub_24745C65C()
{
  return MEMORY[0x24BE9AD08]();
}

uint64_t sub_24745C668()
{
  return MEMORY[0x24BE9AD10]();
}

uint64_t sub_24745C674()
{
  return MEMORY[0x24BE9AD18]();
}

uint64_t sub_24745C680()
{
  return MEMORY[0x24BE9AD48]();
}

uint64_t sub_24745C68C()
{
  return MEMORY[0x24BE9AD58]();
}

uint64_t sub_24745C698()
{
  return MEMORY[0x24BE9AD60]();
}

uint64_t sub_24745C6A4()
{
  return MEMORY[0x24BE9AD98]();
}

uint64_t sub_24745C6B0()
{
  return MEMORY[0x24BE9ADB0]();
}

uint64_t sub_24745C6BC()
{
  return MEMORY[0x24BE9ADC8]();
}

uint64_t sub_24745C6C8()
{
  return MEMORY[0x24BE9ADD0]();
}

uint64_t sub_24745C6D4()
{
  return MEMORY[0x24BE9ADD8]();
}

uint64_t sub_24745C6E0()
{
  return MEMORY[0x24BE9ADE0]();
}

uint64_t sub_24745C6EC()
{
  return MEMORY[0x24BE9B1A0]();
}

uint64_t sub_24745C6F8()
{
  return MEMORY[0x24BE9B1A8]();
}

uint64_t sub_24745C704()
{
  return MEMORY[0x24BE9B2A0]();
}

uint64_t sub_24745C710()
{
  return MEMORY[0x24BEE5E58]();
}

uint64_t sub_24745C71C()
{
  return MEMORY[0x24BEE7418]();
}

uint64_t sub_24745C728()
{
  return MEMORY[0x24BEE7428]();
}

uint64_t sub_24745C734()
{
  return MEMORY[0x24BEA61C8]();
}

uint64_t sub_24745C740()
{
  return MEMORY[0x24BEA6218]();
}

uint64_t sub_24745C74C()
{
  return MEMORY[0x24BEA6220]();
}

uint64_t sub_24745C758()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_24745C764()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_24745C770()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_24745C77C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_24745C788()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_24745C794()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24745C7A0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24745C7AC()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_24745C7B8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24745C7C4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24745C7D0()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_24745C7DC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24745C7E8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24745C7F4()
{
  return MEMORY[0x24BEE75F8]();
}

uint64_t sub_24745C800()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24745C80C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24745C818()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24745C824()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24745C830()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24745C83C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24745C848()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_24745C854()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_24745C860()
{
  return MEMORY[0x24BDCFCD0]();
}

uint64_t sub_24745C86C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_24745C878()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_24745C884()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24745C890()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24745C89C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24745C8A8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24745C8B4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24745C8C0()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_24745C8CC()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_24745C8D8()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_24745C8E4()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_24745C8F0()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_24745C8FC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24745C908()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24745C914()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24745C920()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24745C92C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24745C938()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24745C944()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24745C950()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24745C95C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24745C968()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24745C974()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24745C980()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24745C98C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_24745C998()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24745C9A4()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_24745C9B0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24745C9BC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x24BE08CA8]();
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return MEMORY[0x24BEE4FA8]();
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

