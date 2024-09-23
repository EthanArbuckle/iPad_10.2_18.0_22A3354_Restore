void Version.__allocating_init()()
{
  id v0;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6C418]), sel_init);
  type metadata accessor for Version();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v0;
  OUTLINED_FUNCTION_1();
}

uint64_t type metadata accessor for Version()
{
  return objc_opt_self();
}

void Version.__allocating_init(major:minor:)(uint64_t a1, uint64_t a2)
{
  id v2;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6C418]), sel_initWithMajor_minor_, a1, a2);
  type metadata accessor for Version();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v2;
  OUTLINED_FUNCTION_1();
}

id sub_243B49000()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_major);
}

id sub_243B49010()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_minor);
}

uint64_t static Version.== infix(_:_:)(uint64_t a1)
{
  OUTLINED_FUNCTION_12(a1, &qword_2572EB100);
  return sub_243B4A190() & 1;
}

BOOL static Version.< infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 16), sel_compare_, *(_QWORD *)(a2 + 16)) == (id)-1;
}

BOOL sub_243B49098(uint64_t *a1, uint64_t *a2)
{
  return static Version.< infix(_:_:)(*a1, *a2);
}

uint64_t sub_243B490C4(uint64_t *a1)
{
  return static Version.== infix(_:_:)(*a1) & 1;
}

void Identifier.__allocating_init(name:)(uint64_t a1)
{
  id v1;

  OUTLINED_FUNCTION_12(a1, &qword_2572EB108);
  v1 = sub_243B49138();
  type metadata accessor for Identifier();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v1;
  OUTLINED_FUNCTION_1();
}

id sub_243B49138()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_243B4A16C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithName_, v1);

  return v2;
}

uint64_t sub_243B491A8()
{
  return sub_243B491C0((SEL *)&selRef_namespace);
}

uint64_t sub_243B491B4()
{
  return sub_243B491C0((SEL *)&selRef_name);
}

uint64_t sub_243B491C0(SEL *a1)
{
  id v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_2(a1);
  v2 = sub_243B4A178();

  return v2;
}

uint64_t Identifier.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t Identifier.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

BOOL static ChannelType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void ChannelType.hash(into:)()
{
  sub_243B4A1FC();
  OUTLINED_FUNCTION_1();
}

void ChannelType.hashValue.getter()
{
  sub_243B4A1F0();
  OUTLINED_FUNCTION_7();
  sub_243B4A208();
  OUTLINED_FUNCTION_11();
}

void sub_243B492C0()
{
  sub_243B4A1F0();
  OUTLINED_FUNCTION_7();
  sub_243B4A208();
  OUTLINED_FUNCTION_11();
}

void sub_243B492F0()
{
  sub_243B493C8((SEL *)&selRef_channel, (void (*)(void))type metadata accessor for Channel);
}

void sub_243B49304()
{
  sub_243B492F0();
  OUTLINED_FUNCTION_1();
}

void static Channel.primary.getter()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_primary);
  type metadata accessor for Channel();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v0;
  OUTLINED_FUNCTION_1();
}

void ConcretePipeline.__allocating_init(identifier:)(uint64_t a1)
{
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6C450]), sel_initWithIdentifier_, *(_QWORD *)(a1 + 16));
  swift_release();
  type metadata accessor for ConcretePipeline();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v1;
  OUTLINED_FUNCTION_1();
}

void sub_243B493B4()
{
  sub_243B493C8((SEL *)&selRef_identifier, (void (*)(void))type metadata accessor for Identifier);
}

void sub_243B493C8(SEL *a1, void (*a2)(void))
{
  id v3;

  v3 = OUTLINED_FUNCTION_2(a1);
  a2();
  *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v3;
  OUTLINED_FUNCTION_1();
}

uint64_t sub_243B493FC()
{
  return sub_243B49414((SEL *)&selRef_inputChannels);
}

uint64_t sub_243B49408()
{
  return sub_243B49414((SEL *)&selRef_outputChannels);
}

uint64_t sub_243B49414(SEL *a1)
{
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_12((uint64_t)v1, &qword_2572EB110);
  v2 = sub_243B4A184();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_11:
    OUTLINED_FUNCTION_6();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v3 = sub_243B4A1E4();
  OUTLINED_FUNCTION_6();
  if (!v3)
    goto LABEL_11;
LABEL_3:
  v9 = MEMORY[0x24BEE4AF8];
  result = sub_243B4A1C0();
  if ((v3 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x249501270](v5, v2);
      else
        v6 = *(id *)(v2 + 8 * v5 + 32);
      v7 = v6;
      ++v5;
      type metadata accessor for Channel();
      *(_QWORD *)(OUTLINED_FUNCTION_0() + 16) = v7;
      sub_243B4A1A8();
      sub_243B4A1CC();
      sub_243B4A1D8();
      sub_243B4A1B4();
    }
    while (v3 != v5);
    v8 = v9;
    OUTLINED_FUNCTION_6();
    return v8;
  }
  __break(1u);
  return result;
}

void sub_243B49578(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23[2];

  v3 = v2;
  v23[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = sub_243B491A8();
  v8 = v7;
  v9 = sub_243B491B4();
  v11 = v10;
  v12 = objc_msgSend(*(id *)(a1 + 16), sel_version);
  v13 = objc_allocWithZone(MEMORY[0x24BE6C3A8]);
  v14 = sub_243B49B68(v6, v8, v9, v11, v12);
  v15 = *(void **)(v3 + 16);
  v23[0] = 0;
  v16 = objc_msgSend(v15, sel_addPipelineWithIdentifier_error_, v14, v23);
  v17 = v23[0];
  if (v16)
  {
    objc_opt_self();
    v18 = OUTLINED_FUNCTION_5();
    v19 = type metadata accessor for ConcretePipeline();
    v20 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v20 + 16) = v18;
    a2[3] = v19;
    a2[4] = (uint64_t)&protocol witness table for ConcretePipeline;
    v21 = v17;

    *a2 = v20;
  }
  else
  {
    v22 = v23[0];
    sub_243B4A13C();

    OUTLINED_FUNCTION_8();
  }
}

id sub_243B496F0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = *(void **)(v1 + 16);
  v4 = (void *)sub_243B4A16C();
  v12[0] = 0;
  v5 = objc_msgSend(v3, sel_addCIFilterPipelineWithName_error_, v4, v12);

  v6 = v12[0];
  if (v5)
  {
    objc_opt_self();
    v7 = OUTLINED_FUNCTION_5();
    v8 = type metadata accessor for ConcretePipeline();
    v9 = OUTLINED_FUNCTION_0();
    *(_QWORD *)(v9 + 16) = v7;
    a1[3] = v8;
    a1[4] = (uint64_t)&protocol witness table for ConcretePipeline;
    *a1 = v9;
    return v6;
  }
  else
  {
    v11 = v12[0];
    sub_243B4A13C();

    return (id)OUTLINED_FUNCTION_8();
  }
}

uint64_t sub_243B497F8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_243B49810(a1, (SEL *)&selRef_addInputChannel_, a2);
}

uint64_t sub_243B49804@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_243B49810(a1, (SEL *)&selRef_addOutputChannel_, a2);
}

uint64_t sub_243B49810@<X0>(uint64_t a1@<X0>, SEL *a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v5 = objc_msgSend(*(id *)(v3 + 16), *a2, *(_QWORD *)(a1 + 16));
  objc_opt_self();
  v6 = swift_dynamicCastObjCClassUnconditional();
  v7 = type metadata accessor for ConcreteChannelPort();
  result = OUTLINED_FUNCTION_0();
  *(_QWORD *)(result + 16) = v6;
  a3[3] = v7;
  a3[4] = (uint64_t)&off_25144D258;
  *a3 = result;
  return result;
}

void sub_243B4989C(uint64_t a1, uint64_t a2)
{
  sub_243B4993C(a1, a2, (SEL *)&selRef_canConnectInputPort_toOutputPort_error_);
}

void sub_243B498EC(uint64_t a1, uint64_t a2)
{
  sub_243B4993C(a1, a2, (SEL *)&selRef_connectInputPort_toOutputPort_error_);
}

void sub_243B4993C(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12[6];

  v12[5] = *(id *)MEMORY[0x24BDAC8D0];
  sub_243B49CB0(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572EB118);
  type metadata accessor for ConcreteChannelPort();
  OUTLINED_FUNCTION_3();
  v6 = *(id *)(v11 + 16);
  swift_release();
  sub_243B49CB0(a2, (uint64_t)v12);
  OUTLINED_FUNCTION_3();
  v7 = *(id *)(v11 + 16);
  swift_release();
  v8 = *(void **)(v3 + 16);
  v12[0] = 0;
  if ((objc_msgSend(v8, *a3, v6, v7, v12) & 1) != 0)
  {
    v9 = v12[0];

  }
  else
  {
    v10 = v12[0];
    sub_243B4A13C();

    OUTLINED_FUNCTION_8();
  }
}

void sub_243B49A6C(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_243B49578(a1, a2);
  OUTLINED_FUNCTION_4();
}

void sub_243B49A88(uint64_t *a1@<X8>)
{
  sub_243B496F0(a1);
  OUTLINED_FUNCTION_4();
}

void sub_243B49AA4(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_243B497F8(a1, a2);
  OUTLINED_FUNCTION_1();
}

void sub_243B49AC0(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  sub_243B49804(a1, a2);
  OUTLINED_FUNCTION_1();
}

void sub_243B49ADC(uint64_t a1, uint64_t a2)
{
  sub_243B4989C(a1, a2);
  OUTLINED_FUNCTION_4();
}

void sub_243B49AF8(uint64_t a1, uint64_t a2)
{
  sub_243B498EC(a1, a2);
  OUTLINED_FUNCTION_4();
}

void sub_243B49B14()
{
  sub_243B493B4();
  OUTLINED_FUNCTION_1();
}

void sub_243B49B30()
{
  sub_243B493FC();
  OUTLINED_FUNCTION_1();
}

void sub_243B49B4C()
{
  sub_243B49408();
  OUTLINED_FUNCTION_1();
}

id sub_243B49B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v5;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_243B4A16C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_243B4A16C();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v5, sel_initWithNamespace_name_version_, v7, v8, a5);

  return v9;
}

uint64_t type metadata accessor for Identifier()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for Channel()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for ConcretePipeline()
{
  return objc_opt_self();
}

uint64_t sub_243B49C58(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for ConcreteChannelPort()
{
  return objc_opt_self();
}

uint64_t sub_243B49CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249501408]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_243B49D38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572EB120;
  if (!qword_2572EB120)
  {
    v1 = type metadata accessor for Version();
    result = MEMORY[0x249501414](&protocol conformance descriptor for Version, v1);
    atomic_store(result, (unint64_t *)&qword_2572EB120);
  }
  return result;
}

unint64_t sub_243B49D78()
{
  unint64_t result;

  result = qword_2572EB128;
  if (!qword_2572EB128)
  {
    result = MEMORY[0x249501414](&protocol conformance descriptor for ChannelType, &type metadata for ChannelType);
    atomic_store(result, (unint64_t *)&qword_2572EB128);
  }
  return result;
}

uint64_t method lookup function for Version()
{
  return swift_lookUpClassMethod();
}

uint64_t method lookup function for Identifier()
{
  return swift_lookUpClassMethod();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ChannelType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ChannelType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_243B49EB0 + 4 * byte_243B4A375[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_243B49EE4 + 4 * byte_243B4A370[v4]))();
}

uint64_t sub_243B49EE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_243B49EEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x243B49EF4);
  return result;
}

uint64_t sub_243B49F00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x243B49F08);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_243B49F0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243B49F14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_243B49F20(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_243B49F2C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ChannelType()
{
  return &type metadata for ChannelType;
}

uint64_t dispatch thunk of ChannelPort.channel.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t method lookup function for Channel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of Pipeline.inputChannels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of Pipeline.outputChannels.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MutablePipeline.addPipeline(with:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of MutablePipeline.addPipeline(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of MutablePipeline.addInputChannel(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of MutablePipeline.addOutputChannel(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of MutablePipeline.canConnect(inputPort:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of MutablePipeline.connect(inputPort:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t method lookup function for ConcretePipeline()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConcretePipeline.identifier.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of ConcretePipeline.inputChannels.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of ConcretePipeline.outputChannels.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of ConcretePipeline.addPipeline(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of ConcretePipeline.addInputChannel(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ConcretePipeline.addOutputChannel(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of ConcretePipeline.canConnect(inputPort:to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of ConcretePipeline.connect(inputPort:to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t OUTLINED_FUNCTION_0()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_2(SEL *a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), *a1);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_dynamicCastObjCClassUnconditional();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return sub_243B4A1FC();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, unint64_t *a2)
{
  return sub_243B49C58(0, a2);
}

uint64_t sub_243B4A13C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_243B4A148()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_243B4A154()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_243B4A160()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_243B4A16C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_243B4A178()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_243B4A184()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_243B4A190()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_243B4A19C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_243B4A1A8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_243B4A1B4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_243B4A1C0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_243B4A1CC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_243B4A1D8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_243B4A1E4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_243B4A1F0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_243B4A1FC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_243B4A208()
{
  return MEMORY[0x24BEE4328]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

