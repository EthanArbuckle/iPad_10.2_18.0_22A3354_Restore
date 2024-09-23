uint64_t sub_213485868()
{
  sub_21349B8C4();
  sub_21349B6B4();
  swift_bridgeObjectRetain();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  swift_bridgeObjectRetain();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  swift_bridgeObjectRetain();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  return 0;
}

uint64_t sub_2134859E4()
{
  uint64_t v0;

  if (!*(_QWORD *)(v0 + 24))
    return sub_21349BA20();
  sub_21349BA20();
  swift_bridgeObjectRetain();
  sub_21349B6A8();
  return swift_bridgeObjectRelease();
}

uint64_t App.appIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.pluginIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.systemExtensionBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t App.systemUIExtensionBundleId.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

_QWORD *App.__allocating_init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[6] = a3;
  result[7] = a4;
  result[8] = a5;
  result[9] = a6;
  result[4] = a7;
  result[5] = a8;
  return result;
}

_QWORD *App.init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[2] = a1;
  v8[3] = a2;
  v8[6] = a3;
  v8[7] = a4;
  v8[8] = a5;
  v8[9] = a6;
  v8[4] = a7;
  v8[5] = a8;
  return v8;
}

double App.__allocating_init(appIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  double result;

  type metadata accessor for App();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  result = 0.0;
  *(_OWORD *)(v4 + 32) = 0u;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  return result;
}

double App.__allocating_init(appIdentifier:pluginIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  double result;

  type metadata accessor for App();
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  result = 0.0;
  *(_OWORD *)(v8 + 48) = 0u;
  *(_OWORD *)(v8 + 64) = 0u;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  return result;
}

uint64_t App.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t App.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213485C98()
{
  uint64_t v0;

  sub_21349BA08();
  if (*(_QWORD *)(v0 + 24))
  {
    sub_21349BA20();
    swift_bridgeObjectRetain();
    sub_21349B6A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21349BA20();
  }
  return sub_21349BA2C();
}

uint64_t sub_213485D1C()
{
  return sub_213485868();
}

uint64_t sub_213485D3C(uint64_t *a1, uint64_t *a2)
{
  return _s17SiriAppResolution0B0C2eeoiySbAC_ACtFZ_0(*a1, *a2);
}

uint64_t sub_213485D48()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  sub_21349BA08();
  if (*(_QWORD *)(v1 + 24))
  {
    sub_21349BA20();
    swift_bridgeObjectRetain();
    sub_21349B6A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21349BA20();
  }
  return sub_21349BA2C();
}

uint64_t sub_213485DD0()
{
  uint64_t v0;

  if (!*(_QWORD *)(*(_QWORD *)v0 + 24))
    return sub_21349BA20();
  sub_21349BA20();
  swift_bridgeObjectRetain();
  sub_21349B6A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213485E48()
{
  uint64_t v0;

  sub_21349BA08();
  if (*(_QWORD *)(*(_QWORD *)v0 + 24))
  {
    sub_21349BA20();
    swift_bridgeObjectRetain();
    sub_21349B6A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21349BA20();
  }
  return sub_21349BA2C();
}

uint64_t sub_213485ECC()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

uint64_t sub_213485F10()
{
  return sub_21349BA14();
}

uint64_t sub_213485F38()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

BOOL sub_213485F78(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_213485F8C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_213485F9C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t _s17SiriAppResolution0B0C2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  BOOL v7;

  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a2 + 24);
  result = (v4 | v5) == 0;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && v4 == v5)
      return 1;
    else
      return sub_21349B9A8();
  }
  return result;
}

uint64_t type metadata accessor for App()
{
  return objc_opt_self();
}

uint64_t sub_213486014(uint64_t a1, uint64_t a2)
{
  return sub_213486120(&qword_254B9CC68, a2, (uint64_t (*)(uint64_t))type metadata accessor for App, (uint64_t)&protocol conformance descriptor for App);
}

uint64_t method lookup function for App()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of App.description.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of App.debugDescription.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of App.hash(into:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of App.__allocating_init(appIdentifier:systemExtensionBundleId:systemUIExtensionBundleId:pluginIdentifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of App.hashValue.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

void type metadata accessor for DMFPolicy(uint64_t a1)
{
  sub_2134860AC(a1, &qword_254B9CC70);
}

void type metadata accessor for INSiriAuthorizationStatus(uint64_t a1)
{
  sub_2134860AC(a1, &qword_254B9CC78);
}

void sub_2134860AC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2134860F0()
{
  return sub_213486120(&qword_254B9CC80, 255, (uint64_t (*)(uint64_t))type metadata accessor for INSiriAuthorizationStatus, (uint64_t)"鋳9d!");
}

uint64_t sub_213486120(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x2199B4270](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t AppDisplayInfo.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppDisplayInfo.isFirstParty.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

SiriAppResolution::AppDisplayInfo __swiftcall AppDisplayInfo.init(displayName:isFirstParty:)(Swift::String displayName, Swift::Bool isFirstParty)
{
  uint64_t v2;
  SiriAppResolution::AppDisplayInfo result;

  *(Swift::String *)v2 = displayName;
  *(_BYTE *)(v2 + 16) = isFirstParty;
  result.displayName = displayName;
  result.isFirstParty = isFirstParty;
  return result;
}

uint64_t destroy for AppDisplayInfo()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s17SiriAppResolution14AppDisplayInfoVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AppDisplayInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
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

uint64_t assignWithTake for AppDisplayInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppDisplayInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppDisplayInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppDisplayInfo()
{
  return &type metadata for AppDisplayInfo;
}

uint64_t sub_213486324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t result;
  _QWORD v6[2];

  v0 = sub_21349B7D4();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21349B7C8();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_21349B60C();
  MEMORY[0x24BDAC7A8]();
  sub_213489258();
  sub_21349B5F4();
  v6[1] = MEMORY[0x24BEE4AF8];
  sub_213489294(&qword_254B9CD10, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CD18);
  sub_2134892D4(&qword_254B9CD20, &qword_254B9CD18);
  sub_21349B840();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_21349B7F8();
  qword_254B9CC88 = result;
  return result;
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  void (*v30)(uint64_t@<X0>, uint64_t@<X1>, uint64_t *@<X8>);
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  const char *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71[4];
  uint64_t v72;
  uint64_t aBlock[3];
  void *v74;
  uint64_t (*v75)();
  _QWORD *v76;

  v6 = sub_21349B5C4();
  v66 = *(_QWORD *)(v6 - 8);
  v67 = v6;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (uint64_t *)((char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v68 = sub_21349B624();
  v64 = *(_QWORD *)(v68 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v62 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v63 = (char *)&v58 - v10;
  v11 = sub_21349B5E8();
  MEMORY[0x24BDAC7A8](v11);
  v61 = sub_21349B594();
  v60 = *(_QWORD *)(v61 - 8);
  MEMORY[0x24BDAC7A8](v61);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254B9CC10 != -1)
    swift_once();
  v14 = (id)qword_254B9E3A8;
  sub_21349B588();
  sub_21349B810();
  v59 = v13;
  sub_21349B57C();
  if (qword_254B9CC08 != -1)
    swift_once();
  v15 = sub_21349B5AC();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain_n();
  v17 = sub_21349B5A0();
  v18 = sub_21349B78C();
  v19 = os_log_type_enabled(v17, v18);
  v69 = v16;
  if (v19)
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v58 = v11;
    v22 = a3;
    v23 = v21;
    aBlock[0] = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    v71[0] = sub_213487AF0(a1, a2, aBlock);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v17, v18, "[AppFinder] Searching for Apps Plugins supporting Intent '%s'", v20, 0xCu);
    swift_arrayDestroy();
    v24 = v23;
    a3 = v22;
    MEMORY[0x2199B4300](v24, -1, -1);
    MEMORY[0x2199B4300](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = 0;
  v26 = (unint64_t *)(v25 + 16);
  v27 = (_QWORD *)swift_allocObject();
  v27[2] = v25;
  v27[3] = a1;
  v27[4] = a2;
  v75 = sub_213488198;
  v76 = v27;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_213486FC0;
  v74 = &block_descriptor;
  _Block_copy(aBlock);
  v71[0] = MEMORY[0x24BEE4AF8];
  sub_213489294(&qword_254B9CC90, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  swift_bridgeObjectRetain();
  v58 = v25;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CC98);
  sub_2134892D4(&qword_254B9CCA0, &qword_254B9CC98);
  sub_21349B840();
  sub_21349B648();
  swift_allocObject();
  sub_21349B63C();
  swift_release();
  if (qword_254B9CC00 != -1)
    swift_once();
  sub_21349B7EC();
  if (*(_QWORD *)(a3 + 16))
  {
    v28 = swift_bridgeObjectRetain();
    v29 = sub_213488338(v28);
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = 0;
  }
  v30 = (void (*)(uint64_t@<X0>, uint64_t@<X1>, uint64_t *@<X8>))off_254B9CC58;
  swift_bridgeObjectRetain();
  v30(a1, a2, aBlock);
  v31 = __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v74);
  MEMORY[0x24BDAC7A8](v31);
  *(&v58 - 4) = a1;
  *(&v58 - 3) = a2;
  *(&v58 - 2) = (uint64_t)v29;
  *(&v58 - 1) = 0;
  type metadata accessor for App();
  v32 = sub_21349B6CC();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v33 = sub_213488EB4(v32);
  swift_bridgeObjectRelease();
  v72 = v33;
  v34 = v62;
  sub_21349B618();
  v36 = v65;
  v35 = v66;
  *v65 = 250;
  v37 = v67;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v35 + 104))(v36, *MEMORY[0x24BEE5410], v67);
  v38 = v63;
  MEMORY[0x2199B3BEC](v34, v36);
  (*(void (**)(_QWORD *, uint64_t))(v35 + 8))(v36, v37);
  v39 = *(void (**)(char *, uint64_t))(v64 + 8);
  v40 = v68;
  v39(v34, v68);
  sub_21349B630();
  v39(v38, v40);
  if ((sub_21349B5D0() & 1) != 0)
  {
    v41 = sub_21349B5A0();
    v42 = sub_21349B7A4();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      v44 = "[AppFinder] Unexpected timeout waiting for prefetching of [App]";
LABEL_20:
      _os_log_impl(&dword_213483000, v41, v42, v44, v43, 2u);
      MEMORY[0x2199B4300](v43, -1, -1);
    }
  }
  else
  {
    swift_beginAccess();
    v45 = *v26;
    if (v45)
    {
      swift_bridgeObjectRetain();
      goto LABEL_22;
    }
    v41 = sub_21349B5A0();
    v42 = sub_21349B7A4();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      v44 = "[AppFinder] Unexpected nil for prefetched [App]";
      goto LABEL_20;
    }
  }

  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  v45 = sub_213495284(a1, a2);
LABEL_22:
  if (v45 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_21349B960();
    v46 = result;
    if (!result)
      goto LABEL_31;
  }
  else
  {
    v46 = *(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v46)
      goto LABEL_31;
  }
  if (v46 < 1)
  {
    __break(1u);
    return result;
  }
  v48 = 0;
  do
  {
    if ((v45 & 0xC000000000000001) != 0)
    {
      v49 = MEMORY[0x2199B3E74](v48, v45);
    }
    else
    {
      v49 = *(_QWORD *)(v45 + 8 * v48 + 32);
      swift_retain();
    }
    ++v48;
    v71[0] = v49;
    sub_213486FEC(v71, &v72, a1, a2);
    swift_release();
  }
  while (v46 != v48);
LABEL_31:
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRetain_n();
  v50 = sub_21349B5A0();
  v51 = sub_21349B78C();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = swift_slowAlloc();
    v53 = swift_slowAlloc();
    v71[0] = v53;
    *(_DWORD *)v52 = 134218242;
    swift_beginAccess();
    if ((v72 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v54 = sub_21349B864();
      swift_bridgeObjectRelease();
    }
    else
    {
      v54 = *(_QWORD *)(v72 + 16);
    }
    v70 = v54;
    sub_21349B828();
    *(_WORD *)(v52 + 12) = 2080;
    swift_bridgeObjectRetain();
    v70 = sub_213487AF0(a1, a2, v71);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v50, v51, "Found %ld Apps supporting Intent '%s'", (uint8_t *)v52, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v53, -1, -1);
    MEMORY[0x2199B4300](v52, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  v55 = swift_bridgeObjectRetain();
  v56 = sub_213488240(v55);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease_n();
  sub_21349B804();
  v57 = v59;
  sub_21349B57C();
  (*(void (**)(char *, uint64_t))(v60 + 8))(v57, v61);
  return v56;
}

uint64_t sub_213486F3C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;

  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  v6 = sub_213495284(a2, a3);
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_213486FC0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_213486FEC(uint64_t *a1, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v6 = *a1;
  v7 = *a2;
  swift_bridgeObjectRetain();
  v8 = sub_213487248(v6, v7);
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v9 = sub_21349B5AC();
    __swift_project_value_buffer(v9, (uint64_t)qword_254B9E390);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v10 = sub_21349B5A0();
    v11 = sub_21349B78C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v13 = swift_slowAlloc();
      v16 = v13;
      *(_DWORD *)v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_213487AF0(a3, a4, &v16);
      sub_21349B828();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      v14 = sub_213485868();
      sub_213487AF0(v14, v15, &v16);
      sub_21349B828();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213483000, v10, v11, "[AppFinder] Duplicate App supporting Intent '%s' : %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v13, -1, -1);
      MEMORY[0x2199B4300](v12, -1, -1);

    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
  }
  else
  {
    swift_retain();
    sub_213497224(&v16, v6);
    swift_release();
  }
}

uint64_t sub_213487248(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;

  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_retain();
    v4 = sub_21349B888();
    swift_release();
    return v4 & 1;
  }
  if (*(_QWORD *)(a2 + 16))
  {
    sub_21349BA08();
    v6 = *(_QWORD *)(a1 + 16);
    v7 = *(_QWORD *)(a1 + 24);
    sub_21349BA20();
    if (v7)
    {
      swift_bridgeObjectRetain();
      sub_21349B6A8();
      swift_bridgeObjectRelease();
    }
    v8 = sub_21349BA2C();
    v9 = -1 << *(_BYTE *)(a2 + 32);
    v10 = v8 & ~v9;
    v11 = a2 + 56;
    if (((*(_QWORD *)(a2 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
    {
      v12 = ~v9;
      v13 = *(_QWORD *)(a2 + 48);
      do
      {
        v14 = *(_QWORD *)(v13 + 8 * v10);
        v15 = *(_QWORD *)(v14 + 24);
        if (v15)
        {
          if (v7)
          {
            v16 = *(_QWORD *)(v14 + 16) == v6 && v15 == v7;
            if (v16 || (sub_21349B9A8() & 1) != 0)
              return 1;
          }
        }
        else if (!v7)
        {
          return 1;
        }
        v10 = (v10 + 1) & v12;
      }
      while (((*(_QWORD *)(v11 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
  }
  return 0;
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v16;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_21349B768();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = a4;
  v14[5] = a5;
  v14[6] = a1;
  v14[7] = a2;
  v14[8] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213487780((uint64_t)v12, (uint64_t)&unk_254B9CCB8, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_2134874A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  return swift_task_switch();
}

uint64_t sub_2134874C8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[10];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = swift_bridgeObjectRetain();
    v3 = sub_213488338(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = v0[9];
  v0[2] = v0[8];
  v0[11] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_213487580;
  return sub_2134934C8(v0 + 2);
}

uint64_t sub_213487580(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2134875F8()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 48))(*(_QWORD *)(v0 + 104));
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a2;
  v3[8] = a3;
  v3[6] = a1;
  return swift_task_switch();
}

uint64_t sub_213487654()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[8];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = swift_bridgeObjectRetain();
    v3 = sub_213488338(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = v0[7];
  v0[2] = v0[6];
  v0[9] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_21348770C;
  return sub_2134934C8(v0 + 2);
}

uint64_t sub_21348770C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_213487780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21349B768();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21349B75C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_213489128(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21349B738();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t static AppFinder.listApps(intentID:siriAuthorizationRestriction:extensionPointIdentifierRestriction:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[8] = a3;
  v4[9] = a4;
  v4[6] = a1;
  v4[7] = a2;
  return swift_task_switch();
}

uint64_t sub_2134878E0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = v0[8];
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = swift_bridgeObjectRetain();
    v3 = sub_213488338(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v0[10] = (uint64_t)v3;
  if (*(_QWORD *)(v0[9] + 16))
  {
    v4 = swift_bridgeObjectRetain();
    v5 = sub_21348845C(v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v6 = v0[7];
  v0[2] = v0[6];
  v0[11] = (uint64_t)v5;
  v0[3] = v6;
  v0[4] = (uint64_t)v3;
  v0[5] = (uint64_t)v5;
  swift_bridgeObjectRetain();
  v7 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_2134879C8;
  return sub_2134934C8(v0 + 2);
}

uint64_t sub_2134879C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_213487A40(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213487AA4;
  return v6(a1);
}

uint64_t sub_213487AA4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_213487AF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_213487BC0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21348921C((uint64_t)v12, *a3);
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
      sub_21348921C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_213487BC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21349B834();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_213487D78(a5, a6);
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
  v8 = sub_21349B8E8();
  if (!v8)
  {
    sub_21349B948();
    __break(1u);
LABEL_17:
    result = sub_21349B990();
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

uint64_t sub_213487D78(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_213487E0C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_213487FE4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_213487FE4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_213487E0C(uint64_t a1, unint64_t a2)
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
      v3 = sub_213487F80(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21349B8D0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21349B948();
      __break(1u);
LABEL_10:
      v2 = sub_21349B6C0();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21349B990();
    __break(1u);
LABEL_14:
    result = sub_21349B948();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_213487F80(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCE8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_213487FE4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCE8);
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
  result = sub_21349B990();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_213488148()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21348816C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213488198()
{
  uint64_t v0;

  return sub_213486F3C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B4258]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199B4264](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_213488240(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_21349B864();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCF0);
    v3 = (_QWORD *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_213488628((uint64_t)&v8, v3 + 4, v2, a1);
  result = sub_21348911C();
  if (v6 == v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

_QWORD *sub_213488338(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CD00);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_213488928(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21348911C();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_213488440@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_2134947E4(a1, *(_QWORD *)(v2 + 32), *(_QWORD **)(v2 + 40), a2);
}

_QWORD *sub_21348845C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCD0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_213488ABC((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21348911C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_213488544(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCD0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_213488CB8((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_21348911C();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_213488628(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  unint64_t v31;

  v4 = a4;
  v6 = a2;
  v7 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_21349B858();
    type metadata accessor for App();
    sub_213489294((unint64_t *)&qword_254B9CCF8, (uint64_t (*)(uint64_t))type metadata accessor for App, (uint64_t)&protocol conformance descriptor for App);
    result = sub_21349B780();
    v4 = v27;
    v8 = v28;
    v9 = v29;
    v10 = v30;
    v11 = v31;
    v24 = v7;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
LABEL_46:
    *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return v12;
  }
  v10 = 0;
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 56;
  v9 = ~v20;
  v21 = -v20;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v11 = v22 & *(_QWORD *)(a4 + 56);
  v24 = (_QWORD *)result;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0)
    goto LABEL_48;
  v12 = 0;
  v25 = (unint64_t)(v9 + 64) >> 6;
  v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_21349B87C())
        goto LABEL_45;
      type metadata accessor for App();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v15 = v26;
      result = swift_unknownObjectRelease();
      if (!v26)
        goto LABEL_45;
      goto LABEL_8;
    }
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    v16 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v16 >= v25)
    {
      v11 = 0;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    if (v17)
      goto LABEL_23;
    v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    v17 = *(_QWORD *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25)
        goto LABEL_42;
      v17 = *(_QWORD *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        v16 = v10 + 3;
        goto LABEL_23;
      }
      v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      v17 = *(_QWORD *)(v8 + 8 * v18);
      if (!v17)
      {
        v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          v11 = 0;
          v10 = v18;
          goto LABEL_45;
        }
        v17 = *(_QWORD *)(v8 + 8 * v16);
        if (!v17)
        {
          v19 = v10 + 6;
          while (v25 != v19)
          {
            v17 = *(_QWORD *)(v8 + 8 * v19++);
            if (v17)
            {
              v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          v11 = 0;
          v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    v16 = v18;
LABEL_23:
    v11 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v10 = v16;
LABEL_7:
    v15 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    result = swift_retain();
    if (!v15)
      goto LABEL_45;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      v12 = a3;
LABEL_45:
      v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

_QWORD *sub_213488928(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
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

  v4 = a4 + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v8 = 0;
    a3 = 0;
LABEL_35:
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
    goto LABEL_35;
  }
  if (a3 < 0)
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v8 = 0;
  v9 = 0;
  v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    v12 = v11 | (v8 << 6);
LABEL_8:
    ++v9;
    *a2++ = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 8 * v12);
    if (v9 == a3)
      goto LABEL_35;
  }
  v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_37;
  }
  if (v13 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v13);
  if (v14)
    goto LABEL_19;
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    v7 = 0;
    v8 = v13;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_15:
    v13 = v8;
LABEL_19:
    v16 = __clz(__rbit64(v14));
    v7 = (v14 - 1) & v14;
    v12 = v16 + (v13 << 6);
    v8 = v13;
    goto LABEL_8;
  }
  v15 = v13 + 2;
  if (v13 + 2 >= v10)
    goto LABEL_30;
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_18:
    v13 = v15;
    goto LABEL_19;
  }
  v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    v7 = 0;
    v8 = v13 + 2;
    goto LABEL_34;
  }
  v14 = *(_QWORD *)(v4 + 8 * v8);
  if (v14)
    goto LABEL_15;
  v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_30:
    v7 = 0;
LABEL_34:
    a3 = v9;
    goto LABEL_35;
  }
  v14 = *(_QWORD *)(v4 + 8 * v15);
  if (v14)
    goto LABEL_18;
  while (1)
  {
    v13 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v13 >= v10)
    {
      v7 = 0;
      v8 = v10 - 1;
      goto LABEL_34;
    }
    v14 = *(_QWORD *)(v4 + 8 * v13);
    ++v15;
    if (v14)
      goto LABEL_19;
  }
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_213488ABC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_213488CB8(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_213488EB4(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21349B960();
    swift_bridgeObjectRelease();
  }
  type metadata accessor for App();
  sub_213489294((unint64_t *)&qword_254B9CCF8, (uint64_t (*)(uint64_t))type metadata accessor for App, (uint64_t)&protocol conformance descriptor for App);
  result = sub_21349B774();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_21349B960();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = MEMORY[0x2199B3E74](i, a1);
        sub_213497224(&v9, v6);
        swift_release();
      }
    }
    else
    {
      v7 = (uint64_t *)(a1 + 32);
      do
      {
        v8 = *v7++;
        swift_retain();
        sub_213497224(&v9, v8);
        swift_release();
        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_213489018()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213489054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(_OWORD *)(v0 + 56);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_2134890C4;
  *(_OWORD *)(v3 + 72) = v5;
  *(_QWORD *)(v3 + 64) = v2;
  *(_OWORD *)(v3 + 48) = v4;
  return swift_task_switch();
}

uint64_t sub_2134890C4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

ValueMetadata *type metadata accessor for AppFinder()
{
  return &type metadata for AppFinder;
}

uint64_t sub_21348911C()
{
  return swift_release();
}

uint64_t sub_213489128(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213489168()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21348918C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2134890C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254B9CCD8 + dword_254B9CCD8))(a1, v4);
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

uint64_t sub_21348921C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_213489258()
{
  unint64_t result;

  result = qword_254B9CD08;
  if (!qword_254B9CD08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B9CD08);
  }
  return result;
}

uint64_t sub_213489294(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199B4270](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2134892D4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199B4270](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_213489314()
{
  sub_21349B954();
  __break(1u);
}

void AppFinding.findElgibleAppsFor(intentTypeName:completion:)()
{
  sub_21349B954();
  __break(1u);
}

uint64_t AppFinding.findEligibleApps(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of AppFinding.findElgibleAppsFor(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

uint64_t dispatch thunk of AppFinding.findEligibleApps(intentTypeName:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t sub_2134893E0()
{
  uint64_t v0;
  id v1;

  v0 = sub_21349B5AC();
  __swift_allocate_value_buffer(v0, qword_254B9E390);
  __swift_project_value_buffer(v0, (uint64_t)qword_254B9E390);
  if (qword_254B9CC10 != -1)
    swift_once();
  v1 = (id)qword_254B9E3A8;
  return sub_21349B5B8();
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

uint64_t sub_2134894A0()
{
  uint64_t result;

  sub_213489504();
  result = sub_21349B81C();
  qword_254B9E3A8 = result;
  return result;
}

unint64_t sub_213489504()
{
  unint64_t result;

  result = qword_254B9CD28;
  if (!qword_254B9CD28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B9CD28);
  }
  return result;
}

_QWORD *sub_213489540()
{
  _QWORD *result;

  type metadata accessor for AppPolicyHandler();
  swift_allocObject();
  result = sub_213489578();
  qword_254B9E3B0 = (uint64_t)result;
  return result;
}

_QWORD *sub_213489578()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_21349B7D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21349B7C8();
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_21349B60C();
  MEMORY[0x24BDAC7A8](v7);
  v1[2] = 0;
  sub_21348C174(0, (unint64_t *)&qword_254B9CD08);
  sub_21349B600();
  sub_21349B7BC();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BEE5750], v2);
  v8 = sub_21349B7F8();
  v9 = MEMORY[0x24BEE4B00];
  v1[3] = v8;
  v1[4] = v9;
  v10 = objc_allocWithZone(MEMORY[0x24BE2C7C0]);
  aBlock[4] = sub_21348C1AC;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213486FC0;
  aBlock[3] = &block_descriptor_22;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v12 = objc_msgSend(v10, sel_initWithPolicyChangeHandler_, v11);
  _Block_release(v11);
  v13 = (void *)v1[2];
  v1[2] = v12;

  return v1;
}

uint64_t sub_213489774()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_BYTE *, uint64_t);
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;

  v0 = sub_21349B5E8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = &v9[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4AF8];
  sub_21349B5DC();
  v5 = swift_allocObject();
  swift_weakInit();
  v10 = v5;
  v11 = sub_21348C1B4;
  v12 = v4;
  sub_21349B7E0();
  v6 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  swift_retain();
  v6(v3, v0);
  swift_release();
  swift_release();
  swift_beginAccess();
  v7 = swift_bridgeObjectRetain();
  sub_21348AC58(v7);
  swift_release();
  return swift_bridgeObjectRelease();
}

BOOL sub_2134898DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v35[2];
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;

  v3 = v2;
  v6 = sub_21349B5AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254B9CC08 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain_n();
  v11 = sub_21349B5A0();
  v12 = sub_21349B798();
  if (os_log_type_enabled(v11, v12))
  {
    v36 = v6;
    v13 = swift_slowAlloc();
    v37 = v9;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v35[1] = v3;
    v16 = a1;
    v17 = v15;
    v39 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v38 = sub_213487AF0(v16, a2, &v39);
    v6 = v36;
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v11, v12, "AppPolicyHandler isAllowedByScreenTime called for : %s", v14, 0xCu);
    swift_arrayDestroy();
    v18 = v17;
    a1 = v16;
    MEMORY[0x2199B4300](v18, -1, -1);
    v19 = v14;
    v9 = v37;
    MEMORY[0x2199B4300](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v20 = sub_21348A5E4(a1, a2);
  if ((v21 & 1) != 0)
  {
    swift_bridgeObjectRetain_n();
    v28 = sub_21349B5A0();
    v29 = sub_21349B798();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v39 = v31;
      *(_DWORD *)v30 = 136315138;
      swift_bridgeObjectRetain();
      v38 = sub_213487AF0(a1, a2, &v39);
      sub_21349B828();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213483000, v28, v29, "AppPolicyHandler isAllowedByScreenTime, policy undefined for app. Default to enabled. %s", v30, 0xCu);
      v32 = 1;
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v31, -1, -1);
      MEMORY[0x2199B4300](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      return 1;
    }
  }
  else
  {
    v22 = v20;
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
    swift_bridgeObjectRetain_n();
    v23 = sub_21349B5A0();
    v24 = sub_21349B798();
    if (os_log_type_enabled(v23, v24))
    {
      v37 = v9;
      v25 = swift_slowAlloc();
      v36 = swift_slowAlloc();
      v39 = v36;
      *(_DWORD *)v25 = 136315394;
      swift_bridgeObjectRetain();
      v38 = sub_213487AF0(a1, a2, &v39);
      sub_21349B828();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v25 + 12) = 2080;
      v26 = 0xD000000000000014;
      v27 = 0x800000021349D150;
      switch(v22)
      {
        case 0:
          v27 = 0xEC0000004B4F2E79;
          goto LABEL_17;
        case 1:
          v27 = 0xEE006E7261772E79;
          goto LABEL_17;
        case 2:
          v27 = 0xED00006B73612E79;
LABEL_17:
          v26 = 0x63696C6F50464D44;
          break;
        case 3:
          break;
        case 4:
          v27 = 0x800000021349D130;
          v26 = 0xD000000000000011;
          break;
        default:
          v27 = 0x800000021349D110;
          break;
      }
      v38 = sub_213487AF0(v26, v27, &v39);
      sub_21349B828();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213483000, v23, v24, "AppPolicyHandler DMFPolicy : %s == %s", (uint8_t *)v25, 0x16u);
      v33 = v36;
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v33, -1, -1);
      MEMORY[0x2199B4300](v25, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v37, v6);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    return v22 == 0;
  }
  return v32;
}

unint64_t DMFPolicy.debugDescription.getter(uint64_t a1)
{
  unint64_t result;

  result = 0xD000000000000014;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
      result = 0x63696C6F50464D44;
      break;
    case 4:
      result = 0xD000000000000011;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_213489F2C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t result;
  uint64_t v4;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v4 = result + 32;
    swift_beginAccess();
    a2(v4);
    swift_endAccess();
    return swift_release();
  }
  return result;
}

uint64_t sub_213489FC4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = sub_21349B5E8();
  v4 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v19 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254B9CC08 != -1)
    swift_once();
  v6 = sub_21349B5AC();
  __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain_n();
  v7 = sub_21349B5A0();
  v8 = sub_21349B798();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v21 = v10;
    v17 = v4;
    *(_DWORD *)v9 = 136315138;
    swift_bridgeObjectRetain();
    v20 = sub_213487AF0(a1, a2, &v21);
    v4 = v17;
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v7, v8, "AppPolicyHandler register, %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v10, -1, -1);
    MEMORY[0x2199B4300](v9, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  swift_bridgeObjectRetain();
  v12 = v19;
  sub_21349B5DC();
  v13 = swift_allocObject();
  v14 = swift_weakInit();
  MEMORY[0x24BDAC7A8](v14);
  *(&v17 - 4) = v13;
  *(&v17 - 3) = (uint64_t)sub_21348C16C;
  *(&v17 - 2) = v11;
  sub_21349B7E0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v18);
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCD0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_21349C180;
  *(_QWORD *)(v15 + 32) = a1;
  *(_QWORD *)(v15 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_21348AC58(v15);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21348A2CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = sub_21349B5AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(*(_QWORD *)a1 + 16))
  {
    swift_bridgeObjectRetain();
    sub_213491B7C(a2, a3);
    v11 = v10;
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  if (qword_254B9CC08 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
  swift_bridgeObjectRetain_n();
  v13 = sub_21349B5A0();
  v14 = sub_21349B798();
  if (!os_log_type_enabled(v13, v14))
  {

    swift_bridgeObjectRelease_n();
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v11 & 1) != 0)
      return result;
    goto LABEL_16;
  }
  v15 = swift_slowAlloc();
  v22 = swift_slowAlloc();
  v27 = v22;
  *(_DWORD *)v15 = 136315394;
  if ((v11 & 1) != 0)
    v16 = 1702195828;
  else
    v16 = 0x65736C6166;
  v23 = v7;
  v24 = v6;
  if ((v11 & 1) != 0)
    v17 = 0xE400000000000000;
  else
    v17 = 0xE500000000000000;
  v18 = sub_213487AF0(v16, v17, &v27);
  v25 = a1;
  v26 = v18;
  sub_21349B828();
  swift_bridgeObjectRelease();
  *(_WORD *)(v15 + 12) = 2080;
  swift_bridgeObjectRetain();
  v26 = sub_213487AF0(a2, a3, &v27);
  a1 = v25;
  sub_21349B828();
  swift_bridgeObjectRelease_n();
  _os_log_impl(&dword_213483000, v13, v14, "AppPolicyHandler isRegistered, %s %s", (uint8_t *)v15, 0x16u);
  v19 = v22;
  swift_arrayDestroy();
  MEMORY[0x2199B4300](v19, -1, -1);
  MEMORY[0x2199B4300](v15, -1, -1);

  result = (*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v9, v24);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v27 = *(_QWORD *)a1;
    *(_QWORD *)a1 = 0x8000000000000000;
    sub_21348BE08(0, a2, a3, isUniquelyReferenced_nonNull_native);
    *(_QWORD *)a1 = v27;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_21348A5E4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[4];

  v21 = sub_21349B5E8();
  v4 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213489FC4(a1, a2);
  if (qword_254B9CC08 != -1)
    swift_once();
  v7 = sub_21349B5AC();
  __swift_project_value_buffer(v7, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain_n();
  v8 = sub_21349B5A0();
  v9 = sub_21349B798();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v23[0] = v11;
    v20 = v6;
    *(_DWORD *)v10 = 136315138;
    swift_bridgeObjectRetain();
    v22 = sub_213487AF0(a1, a2, v23);
    v6 = v20;
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v8, v9, "AppPolicyHandler getDMFPolicy, %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v11, -1, -1);
    MEMORY[0x2199B4300](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = 0;
  *(_BYTE *)(v12 + 24) = 1;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v12;
  v13[3] = a1;
  v13[4] = a2;
  swift_bridgeObjectRetain();
  sub_21349B5DC();
  v14 = swift_allocObject();
  v15 = swift_weakInit();
  MEMORY[0x24BDAC7A8](v15);
  *(&v19 - 4) = v14;
  *(&v19 - 3) = (uint64_t)sub_21348C13C;
  *(&v19 - 2) = (uint64_t)v13;
  sub_21349B7E0();
  v16 = *(void (**)(char *, uint64_t))(v4 + 8);
  swift_retain();
  v16(v6, v21);
  swift_release();
  swift_release();
  swift_beginAccess();
  v17 = *(_QWORD *)(v12 + 16);
  swift_release();
  return v17;
}

void sub_21348A910(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  unint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  unint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v5 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    v8 = sub_213491B7C(a3, a4);
    if ((v9 & 1) != 0)
      v10 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v8);
    else
      v10 = 0;
    v11 = v9 ^ 1;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
    v11 = 1;
  }
  swift_beginAccess();
  *(_QWORD *)(a2 + 16) = v10;
  *(_BYTE *)(a2 + 24) = v11 & 1;
  if (qword_254B9CC08 != -1)
    swift_once();
  v12 = sub_21349B5AC();
  __swift_project_value_buffer(v12, (uint64_t)qword_254B9E390);
  swift_retain_n();
  v13 = sub_21349B5A0();
  v14 = sub_21349B798();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v16;
    *(_DWORD *)v15 = 136315138;
    swift_beginAccess();
    v17 = *(_BYTE *)(a2 + 24);
    v24 = *(_QWORD *)(a2 + 16);
    v25 = v17;
    __swift_instantiateConcreteTypeFromMangledName(qword_254B9CE50);
    v18 = sub_21349B69C();
    v24 = sub_213487AF0(v18, v19, &v23);
    sub_21349B828();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v13, v14, "AppPolicyHandler getDMFPolicy, %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v16, -1, -1);
    MEMORY[0x2199B4300](v15, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  swift_beginAccess();
  if (*(_BYTE *)(a2 + 24) == 1)
  {
    v20 = sub_21349B5A0();
    v21 = sub_21349B798();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_213483000, v20, v21, "AppPolicyHandler checkPolicy, app policy undefined", v22, 2u);
      MEMORY[0x2199B4300](v22, -1, -1);
    }

  }
}

uint64_t sub_21348ABEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = swift_bridgeObjectRetain();
  v4 = sub_213488540(v3);
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)(a2 + 16) = v4;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21348AC58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint8_t *v17;
  void *v18;
  id v19;
  void *v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  const char *v30;
  uint64_t v32;
  char *v33;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_21349B594();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - v8;
  if (qword_254B9CC10 != -1)
    swift_once();
  v10 = (id)qword_254B9E3A8;
  sub_21349B588();
  sub_21349B810();
  sub_21349B57C();
  if (qword_254B9CC08 != -1)
    swift_once();
  v11 = sub_21349B5AC();
  __swift_project_value_buffer(v11, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain();
  v12 = sub_21349B5A0();
  v13 = sub_21349B798();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = v5;
    v15 = v4;
    v16 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v16 = 134217984;
    aBlock[0] = *(_QWORD *)(a1 + 16);
    sub_21349B828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v12, v13, "AppPolicyHandler refreshApps : %ld", v16, 0xCu);
    v17 = v16;
    v4 = v15;
    v5 = v14;
    MEMORY[0x2199B4300](v17, -1, -1);

    if (*(_QWORD *)(a1 + 16))
      goto LABEL_7;
LABEL_10:
    v27 = sub_21349B5A0();
    v28 = sub_21349B798();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      v30 = "AppPolicyHandler refreshApps, no apps registered";
LABEL_14:
      _os_log_impl(&dword_213483000, v27, v28, v30, v29, 2u);
      MEMORY[0x2199B4300](v29, -1, -1);
    }
LABEL_15:

    sub_21349B804();
    sub_21349B57C();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  }

  swift_bridgeObjectRelease();
  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_10;
LABEL_7:
  v18 = *(void **)(v1 + 16);
  if (!v18)
  {
    v27 = sub_21349B5A0();
    v28 = sub_21349B7A4();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      v30 = "AppPolicyHandler appPolicyMonitor not initialized";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v19 = v18;
  v20 = (void *)sub_21349B6F0();
  v21 = v33;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v33, v9, v4);
  v22 = v2;
  v23 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v24 = (v6 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v25 + v23, v21, v4);
  *(_QWORD *)(v25 + v24) = v22;
  aBlock[4] = sub_21348BD24;
  aBlock[5] = v25;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21348BBB8;
  aBlock[3] = &block_descriptor_0;
  v26 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v19, sel_requestPoliciesForBundleIdentifiers_completionHandler_, v20, v26);
  _Block_release(v26);

  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v9, v4);
}

void sub_21348B07C(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint8_t *v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v31[2];
  uint64_t v32;

  v4 = sub_21349B5E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254B9CC08 != -1)
    swift_once();
  v8 = sub_21349B5AC();
  __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
  v9 = sub_21349B5A0();
  v10 = sub_21349B798();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v31[0] = a2;
    v12 = v11;
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_213483000, v9, v10, "AppPolicyHandler requestPolicies completion returned", v11, 2u);
    a2 = (void *)v31[0];
    MEMORY[0x2199B4300](v12, -1, -1);
  }

  if (!a2)
  {
    if (a1)
    {
      v22 = swift_allocObject();
      *(_QWORD *)(v22 + 16) = a1;
      swift_bridgeObjectRetain();
      sub_21349B5DC();
      v23 = swift_allocObject();
      v24 = swift_weakInit();
      MEMORY[0x24BDAC7A8](v24);
      v31[-4] = v23;
      v31[-3] = sub_21348BDC0;
      v31[-2] = v22;
      sub_21349B7E0();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      swift_release();
      swift_release();
      v25 = sub_21349B5A0();
      v26 = sub_21349B798();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_213483000, v25, v26, "AppPolicyHandler refreshApps complete", v27, 2u);
        MEMORY[0x2199B4300](v27, -1, -1);
      }

      sub_21349B804();
      if (qword_254B9CC10 == -1)
        goto LABEL_20;
    }
    else
    {
      v28 = sub_21349B5A0();
      v29 = sub_21349B7A4();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_213483000, v28, v29, "AppPolicyHandler refreshApps policies not set", v30, 2u);
        MEMORY[0x2199B4300](v30, -1, -1);
      }

      sub_21349B804();
      if (qword_254B9CC10 == -1)
        goto LABEL_20;
    }
    swift_once();
LABEL_20:
    sub_21349B57C();
    return;
  }
  v13 = a2;
  v14 = a2;
  v15 = a2;
  v16 = sub_21349B5A0();
  v17 = sub_21349B7A4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v32 = v19;
    *(_DWORD *)v18 = 136315138;
    swift_getErrorValue();
    v20 = sub_21349B9CC();
    v31[1] = sub_213487AF0(v20, v21, &v32);
    sub_21349B828();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213483000, v16, v17, "AppPolicyHandler refreshApps appPolicyMonitor requestPolicies has an error : %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v19, -1, -1);
    MEMORY[0x2199B4300](v18, -1, -1);
  }
  else
  {

  }
  sub_21349B804();
  if (qword_254B9CC10 != -1)
    swift_once();
  sub_21349B57C();

}

uint64_t sub_21348B628(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  __int128 v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  const char *v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v33;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  char v39;
  unint64_t v40;
  char v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  const char *v48;
  const char *v49;
  unint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  int64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int64_t v60;
  id v61;
  _QWORD *v62;

  v4 = sub_21349B5AC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a2 + 64);
  v54 = a2 + 64;
  v9 = 1 << *(_BYTE *)(a2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v8;
  v55 = (unint64_t)(v9 + 63) >> 6;
  swift_bridgeObjectRetain();
  v12 = 0;
  *(_QWORD *)&v13 = 136315394;
  v52 = v13;
  v50 = (unint64_t)"DMFPolicy.blocked";
  v51 = MEMORY[0x24BEE4AD8] + 8;
  v48 = "DMFPolicy.UNKNOWN";
  v49 = "SiriAppResolution";
  v57 = v4;
  v58 = v5;
  v56 = v7;
  v53 = a2;
  while (1)
  {
    if (v11)
    {
      v59 = (v11 - 1) & v11;
      v60 = v12;
      v14 = __clz(__rbit64(v11)) | (v12 << 6);
      goto LABEL_22;
    }
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_47;
    if (v15 >= v55)
      return swift_release();
    v16 = *(_QWORD *)(v54 + 8 * v15);
    v17 = v12 + 1;
    if (!v16)
    {
      v17 = v12 + 2;
      if (v12 + 2 >= v55)
        return swift_release();
      v16 = *(_QWORD *)(v54 + 8 * v17);
      if (!v16)
      {
        v17 = v12 + 3;
        if (v12 + 3 >= v55)
          return swift_release();
        v16 = *(_QWORD *)(v54 + 8 * v17);
        if (!v16)
        {
          v18 = v12 + 4;
          if (v12 + 4 >= v55)
            return swift_release();
          v16 = *(_QWORD *)(v54 + 8 * v18);
          if (!v16)
          {
            while (1)
            {
              v17 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_48;
              if (v17 >= v55)
                return swift_release();
              v16 = *(_QWORD *)(v54 + 8 * v17);
              ++v18;
              if (v16)
                goto LABEL_21;
            }
          }
          v17 = v12 + 4;
        }
      }
    }
LABEL_21:
    v59 = (v16 - 1) & v16;
    v60 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_22:
    v19 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v14);
    v20 = *v19;
    v21 = v19[1];
    v22 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v14);
    swift_bridgeObjectRetain_n();
    v61 = v22;
    v23 = sub_21348BF58(v61);
    if (qword_254B9CC08 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v4, (uint64_t)qword_254B9E390);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v24, v4);
    swift_bridgeObjectRetain_n();
    v25 = sub_21349B5A0();
    v26 = sub_21349B798();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      v62 = (_QWORD *)v28;
      *(_DWORD *)v27 = v52;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v27 + 4) = sub_213487AF0(v20, v21, (uint64_t *)&v62);
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v27 + 12) = 2080;
      v29 = 0xD000000000000014;
      v30 = v50 | 0x8000000000000000;
      switch((unint64_t)v23)
      {
        case 0uLL:
          v30 = 0xEC0000004B4F2E79;
          goto LABEL_31;
        case 1uLL:
          v30 = 0xEE006E7261772E79;
          goto LABEL_31;
        case 2uLL:
          v30 = 0xED00006B73612E79;
LABEL_31:
          v29 = 0x63696C6F50464D44;
          goto LABEL_34;
        case 3uLL:
          goto LABEL_34;
        case 4uLL:
          v31 = v48;
          goto LABEL_33;
        default:
          v31 = v49;
LABEL_33:
          v30 = (unint64_t)v31 | 0x8000000000000000;
          v29 = 0xD000000000000011;
LABEL_34:
          *(_QWORD *)(v27 + 14) = sub_213487AF0(v29, v30, (uint64_t *)&v62);
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_213483000, v25, v26, "AppPolicyHandler refreshApps, %s to %s", (uint8_t *)v27, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x2199B4300](v28, -1, -1);
          MEMORY[0x2199B4300](v27, -1, -1);

          (*(void (**)(char *, uint64_t))(v58 + 8))(v56, v57);
          a2 = v53;
          break;
      }
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v62 = (_QWORD *)*a1;
    v33 = (uint64_t)v62;
    *a1 = 0x8000000000000000;
    v35 = sub_213491B7C(v20, v21);
    v36 = *(_QWORD *)(v33 + 16);
    v37 = (v34 & 1) == 0;
    v38 = v36 + v37;
    if (__OFADD__(v36, v37))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      sub_21349B9C0();
      __break(1u);
      JUMPOUT(0x21348BBA4);
    }
    v39 = v34;
    if (*(_QWORD *)(v33 + 24) >= v38)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_2134925D8();
    }
    else
    {
      sub_213491BE0(v38, isUniquelyReferenced_nonNull_native);
      v40 = sub_213491B7C(v20, v21);
      if ((v39 & 1) != (v41 & 1))
        goto LABEL_49;
      v35 = v40;
    }
    v5 = v58;
    v42 = v62;
    if ((v39 & 1) != 0)
    {
      *(_QWORD *)(v62[7] + 8 * v35) = v23;
    }
    else
    {
      v62[(v35 >> 6) + 8] |= 1 << v35;
      v43 = (uint64_t *)(v42[6] + 16 * v35);
      *v43 = v20;
      v43[1] = v21;
      *(_QWORD *)(v42[7] + 8 * v35) = v23;
      v44 = v42[2];
      v45 = __OFADD__(v44, 1);
      v46 = v44 + 1;
      if (v45)
        goto LABEL_46;
      v42[2] = v46;
      swift_bridgeObjectRetain();
    }
    *a1 = (uint64_t)v42;

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v7 = v56;
    v4 = v57;
    v11 = v59;
    v12 = v60;
  }
}

uint64_t sub_21348BBB8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  void (*v5)(uint64_t, void *);
  id v6;

  v4 = a2;
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
  {
    sub_21348C174(0, &qword_254B9CE40);
    v4 = sub_21349B66C();
  }
  swift_retain();
  v6 = a3;
  v5(v4, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_21348BC54()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_21348BC88()
{
  uint64_t *v0;

  return DMFPolicy.debugDescription.getter(*v0);
}

uint64_t type metadata accessor for AppPolicyHandler()
{
  return objc_opt_self();
}

uint64_t sub_21348BCB0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21349B594();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_21348BD24(uint64_t a1, void *a2)
{
  sub_21349B594();
  sub_21348B07C(a1, a2);
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

uint64_t sub_21348BD9C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21348BDC0(uint64_t *a1)
{
  uint64_t v1;

  return sub_21348B628(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_21348BDC8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_21348BDEC()
{
  uint64_t v0;

  return sub_213489F2C(*(_QWORD *)(v0 + 16), *(void (**)(uint64_t))(v0 + 24));
}

uint64_t sub_21348BE08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  v12 = sub_213491B7C(a2, a3);
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
    result = (uint64_t)sub_2134925D8();
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
  sub_213491BE0(result, a4 & 1);
  result = sub_213491B7C(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_21349B9C0();
  __break(1u);
  return result;
}

id sub_21348BF58(void *a1)
{
  id result;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;

  result = objc_msgSend(a1, sel_integerValue);
  if ((unint64_t)result >= 5)
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v3 = sub_21349B5AC();
    __swift_project_value_buffer(v3, (uint64_t)qword_254B9E390);
    v4 = a1;
    v5 = sub_21349B5A0();
    v6 = sub_21349B7A4();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v9 = v4;
      sub_21349B828();
      *v8 = v4;

      _os_log_impl(&dword_213483000, v5, v6, "DMFPolicy parse unknown number %@, default to OK", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CE48);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v8, -1, -1);
      MEMORY[0x2199B4300](v7, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return result;
}

uint64_t sub_21348C100()
{
  return swift_deallocObject();
}

uint64_t sub_21348C110()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21348C13C(uint64_t *a1)
{
  uint64_t *v1;

  sub_21348A910(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_21348C148()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21348C16C(uint64_t a1)
{
  uint64_t v1;

  return sub_21348A2CC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_21348C174(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21348C1AC()
{
  return sub_213489774();
}

uint64_t sub_21348C1B4(uint64_t a1)
{
  uint64_t v1;

  return sub_21348ABEC(a1, v1);
}

uint64_t sub_21348C1C8()
{
  return sub_21348BDEC();
}

uint64_t sub_21348C1DC()
{
  uint64_t result;

  type metadata accessor for AppResolutionEventSending();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = 0;
  off_253F0AD70 = (_UNKNOWN *)result;
  return result;
}

uint64_t static AppResolutionEventSending.onEventSent(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;

  if (qword_253F0AD78 != -1)
    swift_once();
  v4 = off_253F0AD70;
  v5 = *((_QWORD *)off_253F0AD70 + 2);
  *((_QWORD *)off_253F0AD70 + 2) = a1;
  v4[3] = a2;
  swift_retain();
  return sub_21348C278(v5);
}

uint64_t sub_21348C278(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t AppResolutionEventSending.deinit()
{
  uint64_t v0;

  sub_21348C278(*(_QWORD *)(v0 + 16));
  return v0;
}

uint64_t AppResolutionEventSending.__deallocating_deinit()
{
  uint64_t v0;

  sub_21348C278(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppResolutionEventSending()
{
  return objc_opt_self();
}

uint64_t method lookup function for AppResolutionEventSending()
{
  return swift_lookUpClassMethod();
}

void sub_21348C2F4(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  void *v7;
  char v8;
  int v9;
  void (*v10)(uint64_t, uint64_t, uint64_t *, NSObject *);
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint8_t *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *oslog;
  os_log_t osloga;
  uint64_t v31;
  uint64_t v32;
  char v33;

  v7 = *(void **)a3;
  v8 = *(_BYTE *)(a3 + 8);
  v9 = *(unsigned __int8 *)(a3 + 9);
  if (qword_253F0AD78 != -1)
    swift_once();
  v10 = (void (*)(uint64_t, uint64_t, uint64_t *, NSObject *))*((_QWORD *)off_253F0AD70 + 2);
  if (v10)
  {
    if (v9)
    {
      v11 = qword_254B9CC08;
      swift_retain();
      if (v11 != -1)
        swift_once();
      v12 = sub_21349B5AC();
      __swift_project_value_buffer(v12, (uint64_t)qword_254B9E390);
      v13 = sub_21349B5A0();
      v14 = sub_21349B798();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = a1;
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_213483000, v13, v14, "AppSelectionService: failed to resolved app", v16, 2u);
        v17 = v16;
        a1 = v15;
        MEMORY[0x2199B4300](v17, -1, -1);
      }

      v32 = 0x8000000000000000;
      v33 = 3;
      v10(a1, a2, &v32, a4);
      sub_21348C278((uint64_t)v10);
    }
    else
    {
      sub_21348C74C(*((_QWORD *)off_253F0AD70 + 2));
      sub_21348C75C(v7, v8, 0);
      if (qword_254B9CC08 != -1)
        swift_once();
      v21 = sub_21349B5AC();
      __swift_project_value_buffer(v21, (uint64_t)qword_254B9E390);
      sub_21348C768((uint64_t)v7, v8);
      sub_21348C768((uint64_t)v7, v8);
      v22 = sub_21349B5A0();
      v23 = sub_21349B798();
      if (os_log_type_enabled(v22, v23))
      {
        osloga = a4;
        v24 = (uint8_t *)swift_slowAlloc();
        v28 = swift_slowAlloc();
        v31 = v28;
        v32 = (uint64_t)v7;
        *(_DWORD *)v24 = 136315138;
        v33 = v8;
        AppResolutionResult.description.getter();
        v32 = sub_213487AF0(v25, v26, &v31);
        sub_21349B828();
        swift_bridgeObjectRelease();
        sub_21348C7A4(v7, v8, 0);
        sub_21348C7A4(v7, v8, 0);
        _os_log_impl(&dword_213483000, v22, v23, "AppSelectionService: resolved app with result=%s", v24, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x2199B4300](v28, -1, -1);
        v27 = v24;
        a4 = osloga;
        MEMORY[0x2199B4300](v27, -1, -1);
      }
      else
      {
        sub_21348C7A4(v7, v8, 0);
        sub_21348C7A4(v7, v8, 0);
      }

      v32 = (uint64_t)v7;
      v33 = v8;
      v10(a1, a2, &v32, a4);
      sub_21348C278((uint64_t)v10);
      sub_21348C7A4(v7, v8, 0);
    }
  }
  else
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v18 = sub_21349B5AC();
    __swift_project_value_buffer(v18, (uint64_t)qword_254B9E390);
    oslog = sub_21349B5A0();
    v19 = sub_21349B798();
    if (os_log_type_enabled(oslog, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_213483000, oslog, v19, "The event handler for app resolution didn't get initialized or dropping the event.", v20, 2u);
      MEMORY[0x2199B4300](v20, -1, -1);
    }

  }
}

uint64_t sub_21348C74C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

id sub_21348C75C(id a1, char a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)sub_21348C768((uint64_t)a1, a2);
}

uint64_t sub_21348C768(uint64_t a1, char a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
    case 2:
    case 3:
      result = swift_retain();
      break;
    case 1:
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

void sub_21348C7A4(id a1, char a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    sub_21348C7B0((uint64_t)a1, a2);
}

uint64_t sub_21348C7B0(uint64_t a1, char a2)
{
  uint64_t result;

  switch(a2)
  {
    case 0:
    case 2:
    case 3:
      result = swift_release();
      break;
    case 1:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t AppResolutionService.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  AppResolutionService.init()();
  return v0;
}

_QWORD *AppResolutionService.init()()
{
  _QWORD *v0;
  uint64_t v1;

  if (qword_254B9CC18 != -1)
    swift_once();
  v1 = qword_254B9E3B0;
  v0[5] = type metadata accessor for AppPolicyHandler();
  v0[6] = &off_24CFD4D70;
  v0[2] = v1;
  swift_retain();
  return v0;
}

uint64_t sub_21348C88C(uint64_t a1, _QWORD *a2, void (*a3)(uint64_t *))
{
  return sub_21348C9A4(a2, a3);
}

BOOL sub_21348C89C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  BOOL v5;
  _QWORD v7[5];

  sub_21348CD5C(v1 + 16, (uint64_t)v7);
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  if (*(_QWORD *)(a1 + 24))
  {
    v3 = *(_QWORD *)(a1 + 16);
    v4 = *(_QWORD *)(a1 + 24);
  }
  else
  {
    v4 = 0xEA00000000007070;
    v3 = 0x416E776F6E6B6E75;
  }
  swift_bridgeObjectRetain();
  v5 = sub_2134898DC(v3, v4);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  return v5;
}

uint64_t AppResolutionService.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t AppResolutionService.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_21348C97C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 112))();
}

uint64_t sub_21348C9A4(_QWORD *a1, void (*a2)(uint64_t *))
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
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
  uint64_t v20;
  unint64_t v21;

  if (qword_254B9CC10 != -1)
    swift_once();
  sub_21349B78C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CEF0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_21349C180;
  v20 = 0;
  v21 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CEF8);
  sub_21349B93C();
  v4 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  v5 = sub_21348CDA0();
  *(_QWORD *)(v3 + 64) = v5;
  *(_QWORD *)(v3 + 32) = 0;
  *(_QWORD *)(v3 + 40) = 0xE000000000000000;
  sub_21349B570();
  swift_bridgeObjectRelease();
  v6 = a1[3];
  v7 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v6);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v6, v7);
  if (v8
    || (v9 = a1[3],
        v10 = a1[4],
        __swift_project_boxed_opaque_existential_1(a1, v9),
        (v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 16))(v9, v10)) != 0))
  {
    v11 = v8;
    sub_21349B78C();
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_21349C180;
    v13 = sub_213485868();
    *(_QWORD *)(v12 + 56) = v4;
    *(_QWORD *)(v12 + 64) = v5;
    *(_QWORD *)(v12 + 32) = v13;
    *(_QWORD *)(v12 + 40) = v14;
    sub_21349B570();
    swift_bridgeObjectRelease();
    if (sub_21348C89C(v11))
    {
      v20 = v11;
      LOWORD(v21) = 2;
    }
    else
    {
      sub_21349B798();
      v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_21349C180;
      v16 = sub_213485868();
      *(_QWORD *)(v15 + 56) = v4;
      *(_QWORD *)(v15 + 64) = v5;
      *(_QWORD *)(v15 + 32) = v16;
      *(_QWORD *)(v15 + 40) = v17;
      sub_21349B570();
      swift_bridgeObjectRelease();
      v20 = v11 | 0x4000000000000000;
      LOWORD(v21) = 3;
    }
    swift_retain();
    a2(&v20);
    return swift_release_n();
  }
  else
  {
    sub_21349B78C();
    sub_21349B570();
    v20 = 0x8000000000000000;
    LOWORD(v21) = 3;
    return ((uint64_t (*)(uint64_t *))a2)(&v20);
  }
}

uint64_t sub_21348CCF0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AppResolutionService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppResolutionService);
}

uint64_t method lookup function for AppResolutionService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppResolutionService.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AppResolutionService.resolveApp(intent:appResolutionState:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t sub_21348CD5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_21348CDA0()
{
  unint64_t result;

  result = qword_254B9CF00;
  if (!qword_254B9CF00)
  {
    result = MEMORY[0x2199B4270](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254B9CF00);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2199B4234](a1, v6, a5);
}

uint64_t sub_21348CE10(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aCancelleconfir[8 * a1] == *(_QWORD *)&aCancelleconfir[8 * a2]
    && *(_QWORD *)&aCancelleconfir[8 * a1 + 24] == *(_QWORD *)&aCancelleconfir[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_21349B9A8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

SiriAppResolution::AppResolutionConfirmation_optional sub_21348CE94()
{
  return AppResolutionStateProviding.getCorrectionResponse()();
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProviding.getCorrectionResponse()()
{
  _BYTE *v0;
  SiriAppResolution::AppResolutionConfirmation_optional result;

  *v0 = 3;
  return result;
}

uint64_t sub_21348CEB4()
{
  return 0;
}

uint64_t AppResolutionStateProviding.aceAppSelectionState.getter()
{
  return 0;
}

uint64_t static AppResolutionConfirmation.from(appConfirmationState:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char v8;
  char v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  char v15;

  if (!a2)
  {
    v9 = 3;
    goto LABEL_16;
  }
  v5 = result;
  if (sub_21349B690() == result && v6 == a2)
  {
    v9 = 0;
    goto LABEL_15;
  }
  v8 = sub_21349B9A8();
  result = swift_bridgeObjectRelease();
  v9 = 0;
  if ((v8 & 1) != 0)
    goto LABEL_16;
  if (sub_21349B690() == v5 && v10 == a2)
  {
    v9 = 1;
    goto LABEL_15;
  }
  v12 = sub_21349B9A8();
  result = swift_bridgeObjectRelease();
  if ((v12 & 1) != 0)
  {
    v9 = 1;
    goto LABEL_16;
  }
  v9 = 2;
  if (sub_21349B690() == v5 && v13 == a2)
  {
LABEL_15:
    result = swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v15 = sub_21349B9A8();
  result = swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
    v9 = 2;
  else
    v9 = 3;
LABEL_16:
  *a3 = v9;
  return result;
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionConfirmation.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  SiriAppResolution::AppResolutionConfirmation_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21349B99C();
  result.value = swift_bridgeObjectRelease();
  v5 = 3;
  if (v3 < 3)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AppResolutionConfirmation.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aCancelleconfir[8 * *v0];
}

uint64_t sub_21348D07C(char *a1, char *a2)
{
  return sub_21348CE10(*a1, *a2);
}

uint64_t sub_21348D088()
{
  return sub_21348D090();
}

uint64_t sub_21348D090()
{
  sub_21349BA08();
  sub_21349B6A8();
  swift_bridgeObjectRelease();
  return sub_21349BA2C();
}

uint64_t sub_21348D0F8()
{
  return sub_21348D100();
}

uint64_t sub_21348D100()
{
  sub_21349B6A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21348D140()
{
  return sub_21348D148();
}

uint64_t sub_21348D148()
{
  sub_21349BA08();
  sub_21349B6A8();
  swift_bridgeObjectRelease();
  return sub_21349BA2C();
}

SiriAppResolution::AppResolutionConfirmation_optional sub_21348D1AC(Swift::String *a1)
{
  return AppResolutionConfirmation.init(rawValue:)(*a1);
}

uint64_t sub_21348D1B8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AppResolutionConfirmation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t AppResolutionStateProvider.debugDescription.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *v0;
  v1 = v0[1];
  sub_21349B8C4();
  sub_21349B6B4();
  if (v2)
    sub_213485868();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  if (v1)
    sub_213485868();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  return 0;
}

void *AppResolutionStateProvider.aceAppSelectionState.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

void AppResolutionStateProvider.init(appSelectionState:)(id a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char v33;

  if (!a1)
  {
    v5 = 0;
    v10 = 0;
    goto LABEL_20;
  }
  v4 = objc_msgSend(a1, sel_requestedApp);
  v5 = (uint64_t)v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, sel_bundleId);

    if (v6)
    {
      v7 = sub_21349B690();
      v9 = v8;

      type metadata accessor for App();
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v7;
      *(_QWORD *)(v5 + 24) = v9;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
    }
    else
    {
      v5 = 0;
    }
  }
  v11 = objc_msgSend(a1, sel_eligibleApps);
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  sub_21348DA20();
  v13 = sub_21349B6FC();

  if (v13 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_21349B960();
    swift_bridgeObjectRelease();
    if (v19)
      goto LABEL_10;
    goto LABEL_16;
  }
  if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
LABEL_10:
  if ((v13 & 0xC000000000000001) != 0)
  {
    v14 = (id)MEMORY[0x2199B3E74](0, v13);
  }
  else
  {
    if (!*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    v14 = *(id *)(v13 + 32);
  }
  v15 = v14;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v15, sel_bundleId);

  if (v10)
  {
    v16 = sub_21349B690();
    v18 = v17;

    type metadata accessor for App();
    v10 = (id)swift_allocObject();
    *((_QWORD *)v10 + 2) = v16;
    *((_QWORD *)v10 + 3) = v18;
    *((_OWORD *)v10 + 2) = 0u;
    *((_OWORD *)v10 + 3) = 0u;
    *((_OWORD *)v10 + 4) = 0u;
  }
LABEL_18:
  v20 = objc_msgSend(a1, sel_appConfirmationState);
  if (v20)
  {
    v21 = v20;
    v22 = sub_21349B690();
    v24 = v23;

    goto LABEL_21;
  }
LABEL_20:
  v22 = 0;
  v24 = 0;
LABEL_21:
  static AppResolutionConfirmation.from(appConfirmationState:)(v22, v24, &v33);
  swift_bridgeObjectRelease();
  v25 = v33;
  if (a1 && (v26 = objc_msgSend(a1, sel_appCorrectionState)) != 0)
  {
    v27 = v26;
    v28 = sub_21349B690();
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0;
  }
  static AppResolutionConfirmation.from(appConfirmationState:)(v28, v30, &v32);
  swift_bridgeObjectRelease();
  v31 = v32;
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v10;
  *(_BYTE *)(a2 + 16) = v25;
  *(_BYTE *)(a2 + 17) = v31;
  *(_QWORD *)(a2 + 24) = a1;
}

uint64_t AppResolutionStateProvider.getRequestedApp()()
{
  return swift_retain();
}

uint64_t AppResolutionStateProvider.getSuggestedApp()()
{
  return swift_retain();
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProvider.getConfirmationResponse()()
{
  _BYTE *v0;
  uint64_t v1;
  SiriAppResolution::AppResolutionConfirmation_optional result;

  *v0 = *(_BYTE *)(v1 + 16);
  return result;
}

SiriAppResolution::AppResolutionConfirmation_optional __swiftcall AppResolutionStateProvider.getCorrectionResponse()()
{
  _BYTE *v0;
  uint64_t v1;
  SiriAppResolution::AppResolutionConfirmation_optional result;

  *v0 = *(_BYTE *)(v1 + 17);
  return result;
}

uint64_t sub_21348D698()
{
  return swift_retain();
}

uint64_t sub_21348D6A0()
{
  return swift_retain();
}

void sub_21348D6A8(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

void sub_21348D6B4(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

void *sub_21348D6C0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 24);
  v2 = v1;
  return v1;
}

uint64_t AppSelectionResponse.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21348D71C + 4 * byte_21349C270[*v0]))(0xD00000000000001CLL, 0x800000021349D4C0);
}

uint64_t sub_21348D71C(uint64_t a1)
{
  return a1 + 2;
}

BOOL static AppSelectionResponse.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppSelectionResponse.hash(into:)()
{
  return sub_21349BA14();
}

uint64_t AppSelectionResponse.hashValue.getter()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

BOOL sub_21348D7D4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_21348D7E8()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

uint64_t sub_21348D82C()
{
  return sub_21349BA14();
}

uint64_t sub_21348D854()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

void AppResolutionStateProviding.previousSelectionResponse.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(a2 + 24))(&v2);
  __asm { BR              X10 }
}

_QWORD *sub_21348D8E0()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  result = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v1 + 32))(&v4, v2, v1);
  if (v4 == 1)
    *v0 = 3;
  else
    *v0 = 0;
  return result;
}

uint64_t AppResolutionStateProviding.needsRunAppResolution(preResolvedApp:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  char v14;

  AppResolutionStateProviding.previousSelectionResponse.getter(a2, a3);
  if (v14 != 3 && a1 != 0)
  {
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 8))(a2, a3);
    if (!v8)
      goto LABEL_18;
    v9 = *(_QWORD *)(v8 + 24);
    v10 = *(_QWORD *)(a1 + 24);
    v7 = v10 != 0;
    if (!v9)
    {
      swift_release();
      return v7 & 1;
    }
    if (v10)
    {
      if (*(_QWORD *)(v8 + 16) != *(_QWORD *)(a1 + 16) || v9 != v10)
      {
        v12 = sub_21349B9A8();
        swift_release();
        v7 = v12 ^ 1;
        return v7 & 1;
      }
      swift_release();
LABEL_18:
      v7 = 0;
      return v7 & 1;
    }
    swift_release();
  }
  v7 = 1;
  return v7 & 1;
}

unint64_t sub_21348DA20()
{
  unint64_t result;

  result = qword_254B9CF08;
  if (!qword_254B9CF08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254B9CF08);
  }
  return result;
}

unint64_t sub_21348DA60()
{
  unint64_t result;

  result = qword_254B9CF10;
  if (!qword_254B9CF10)
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppResolutionConfirmation, &type metadata for AppResolutionConfirmation);
    atomic_store(result, (unint64_t *)&qword_254B9CF10);
  }
  return result;
}

unint64_t sub_21348DAA8()
{
  unint64_t result;

  result = qword_254B9CF18;
  if (!qword_254B9CF18)
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppSelectionResponse, &type metadata for AppSelectionResponse);
    atomic_store(result, (unint64_t *)&qword_254B9CF18);
  }
  return result;
}

uint64_t dispatch thunk of AppResolutionStateProviding.getRequestedApp()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getSuggestedApp()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getConfirmationResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.getCorrectionResponse()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of AppResolutionStateProviding.aceAppSelectionState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AppResolutionConfirmation(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppResolutionConfirmation(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21348DC00 + 4 * byte_21349C27D[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21348DC34 + 4 * byte_21349C278[v4]))();
}

uint64_t sub_21348DC34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21348DC3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21348DC44);
  return result;
}

uint64_t sub_21348DC50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21348DC58);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21348DC5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21348DC64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionConfirmation()
{
  return &type metadata for AppResolutionConfirmation;
}

uint64_t initializeBufferWithCopyOfBuffer for AppResolutionStateProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for AppResolutionStateProvider(uint64_t a1)
{
  swift_release();
  swift_release();

}

uint64_t initializeWithCopy for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain();
  swift_retain();
  v5 = v4;
  return a1;
}

uint64_t assignWithCopy for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v5;
  v6 = v5;

  return a1;
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

uint64_t assignWithTake for AppResolutionStateProvider(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionStateProvider(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppResolutionStateProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionStateProvider()
{
  return &type metadata for AppResolutionStateProvider;
}

uint64_t getEnumTagSinglePayload for AppSelectionResponse(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppSelectionResponse(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21348DFB0 + 4 * byte_21349C287[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_21348DFE4 + 4 * byte_21349C282[v4]))();
}

uint64_t sub_21348DFE4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21348DFEC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21348DFF4);
  return result;
}

uint64_t sub_21348E000(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21348E008);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_21348E00C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21348E014(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21348E020(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21348E028(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppSelectionResponse()
{
  return &type metadata for AppSelectionResponse;
}

uint64_t SiriRememberedAppResolver.selectAppWithMetadata(intent:fromEligibleApps:_:)(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, unint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21349AE30(a2);
  v6 = sub_213488540(v5);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_21349B090(a1, v6, v5, a3);
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release();
  return swift_release();
}

uint64_t sub_21348E0E4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t *, unint64_t))
{
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  uint64_t result;
  void (*v32)(unint64_t *, unint64_t);
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21349C180;
  *(_QWORD *)(inited + 32) = 0xD000000000000012;
  *(_QWORD *)(inited + 40) = 0x800000021349D550;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF38);
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_21349C510;
  *(_QWORD *)(v9 + 32) = 0x746C75736572;
  *(_QWORD *)(v9 + 40) = 0xE600000000000000;
  *(_QWORD *)(v9 + 48) = sub_21349B564();
  *(_QWORD *)(v9 + 56) = v10;
  *(_QWORD *)(v9 + 64) = 0xD000000000000011;
  *(_QWORD *)(v9 + 72) = 0x800000021349D570;
  *(_QWORD *)(v9 + 80) = MEMORY[0x2199B3CA0](a2, MEMORY[0x24BEE0D00]);
  *(_QWORD *)(v9 + 88) = v11;
  v12 = sub_2134902FC(v9);
  *(_QWORD *)(inited + 72) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF40);
  *(_QWORD *)(inited + 48) = v12;
  v13 = sub_2134901D4(inited);
  swift_bridgeObjectRetain();
  v14 = sub_21348EC04(a2, a3);
  swift_bridgeObjectRelease();
  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_3;
LABEL_18:
    swift_bridgeObjectRelease_n();
    v33 = 0;
    LOWORD(v34) = 256;
    a4(&v33, v13);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  if (!sub_21349B960())
    goto LABEL_18;
LABEL_3:
  if ((v14 & 0xC000000000000001) != 0)
  {
    v16 = MEMORY[0x2199B3E74](0, v14);
  }
  else
  {
    if (!*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      result = swift_bridgeObjectRelease();
      __break(1u);
      return result;
    }
    v16 = *(_QWORD *)(v14 + 32);
    swift_retain();
  }
  swift_bridgeObjectRelease();
  v32 = a4;
  if (a1 == 2)
  {
    v17 = sub_21349BA38();
    v19 = v23;
    v20 = 1;
    v21 = 1;
  }
  else if (a1 == 1)
  {
    swift_bridgeObjectRelease();
    swift_retain();
    v17 = sub_21349BA38();
    v19 = v22;
    v21 = 0;
    v20 = 1;
    v14 = v16;
  }
  else
  {
    swift_bridgeObjectRelease();
    if (a1)
    {
      v14 = 0;
      v20 = 0;
      v17 = 0;
      v19 = 0;
      v21 = 0x8000000000000000;
    }
    else
    {
      swift_retain();
      v17 = sub_21349BA38();
      v19 = v18;
      v20 = 1;
      v21 = 2;
      v14 = v16;
    }
  }
  v34 = v21;
  v35 = v17;
  v36 = v19;
  sub_21349A220();
  v25 = v24;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v33 = v13;
  sub_21348E8B0(v25, (uint64_t)sub_213492B1C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v33);
  v27 = v33;
  swift_bridgeObjectRelease();
  if (v20)
  {
    sub_21348C768(v14, v21);
    v28 = v14;
    v29 = v21;
  }
  else
  {
    v28 = 0;
    v29 = 0;
  }
  v30 = v20 ^ 1;
  v33 = v28;
  LOBYTE(v34) = v29;
  BYTE1(v34) = v30;
  v32(&v33, v27);
  swift_release();
  swift_bridgeObjectRelease();
  sub_21348EE38(v14, v21);
  return sub_21348EE88(v28, v29, v30);
}

uint64_t sub_21348E47C()
{
  swift_getDynamicType();
  return sub_21349BA38();
}

uint64_t sub_21348E4A0(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, unint64_t))
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_21349AE30(a2);
  v6 = sub_213488540(v5);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_21349B090(a1, v6, v5, a3);
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release();
  return swift_release();
}

uint64_t DefaultAppSelector.selectAppWithMetadata(intent:fromEligibleApps:_:)(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, uint64_t))
{
  uint64_t v3;

  swift_retain();
  sub_213499554(a2, v3, a3);
  return swift_release();
}

uint64_t sub_21348E58C(uint64_t a1, unint64_t a2, void (*a3)(unint64_t *, uint64_t))
{
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  swift_retain();
  sub_213499554(a2, v6, a3);
  return swift_release();
}

uint64_t sub_21348E5DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t);
  __int128 v23[2];
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  uint64_t v27;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v6, v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF20);
  if (swift_dynamicCast())
  {
    sub_21348EDDC(v23, (uint64_t)v25);
    v16 = v26;
    v17 = v27;
    __swift_project_boxed_opaque_existential_1(v25, v26);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a3;
    *(_QWORD *)(v18 + 24) = a4;
    v19 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(v17 + 8);
    swift_retain();
    v19(a1, a2, sub_21348EDF4, v18, v16, v17);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
  }
  else
  {
    v24 = 0;
    memset(v23, 0, sizeof(v23));
    sub_21348ED30((uint64_t)v23);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = a3;
    *(_QWORD *)(v21 + 24) = a4;
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t *), uint64_t, uint64_t, uint64_t))(a6 + 8);
    swift_retain();
    v22(a1, a2, sub_21348ED94, v21, a5, a6);
    return swift_release();
  }
}

unint64_t AppResolutionResult.AppResolutionResultError.debugDescription.getter()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v4;

  v1 = 0xD000000000000010;
  v2 = *v0 >> 62;
  if (!(_DWORD)v2)
  {
    swift_retain();
    sub_21349B8C4();
    swift_bridgeObjectRelease();
    v4 = 0xD00000000000001CLL;
    sub_213485868();
    sub_21349B6B4();
    swift_bridgeObjectRelease();
    swift_release();
    return v4;
  }
  if ((_DWORD)v2 == 1)
  {
    swift_retain();
    sub_21349B8C4();
    swift_bridgeObjectRelease();
    v4 = 0xD000000000000023;
    sub_213485868();
    sub_21349B6B4();
    swift_release();
    swift_bridgeObjectRelease();
    return v4;
  }
  return v1;
}

uint64_t sub_21348E8B0(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  _OWORD *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t i;
  _OWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  _OWORD v46[2];
  _OWORD v47[2];
  __int128 v48;
  _OWORD v49[2];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v7 = -1 << *(_BYTE *)(a1 + 32);
  v8 = ~v7;
  v9 = *(_QWORD *)(a1 + 64);
  v10 = -v7;
  v50 = a1;
  v51 = a1 + 64;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  else
    v11 = -1;
  v52 = v8;
  v53 = 0;
  v54 = v11 & v9;
  v55 = a2;
  v56 = a3;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_213492B5C(&v48);
  v12 = *((_QWORD *)&v48 + 1);
  if (!*((_QWORD *)&v48 + 1))
    goto LABEL_27;
  v13 = v48;
  sub_21348EE94(v49, v47);
  v14 = *(_QWORD **)a5;
  v16 = sub_213491B7C(v13, v12);
  v17 = v14[2];
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v20 = v15;
  if (v14[3] >= v19)
  {
    if ((a4 & 1) != 0)
    {
      if ((v15 & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_213492938();
      if ((v20 & 1) != 0)
        goto LABEL_12;
    }
LABEL_14:
    v24 = *(_QWORD **)a5;
    *(_QWORD *)(*(_QWORD *)a5 + 8 * (v16 >> 6) + 64) |= 1 << v16;
    v25 = (uint64_t *)(v24[6] + 16 * v16);
    *v25 = v13;
    v25[1] = v12;
    sub_21348EE94(v47, (_OWORD *)(v24[7] + 32 * v16));
    v26 = v24[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
    {
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    v24[2] = v28;
LABEL_16:
    sub_213492B5C(&v48);
    for (i = *((_QWORD *)&v48 + 1); *((_QWORD *)&v48 + 1); i = *((_QWORD *)&v48 + 1))
    {
      v31 = v48;
      sub_21348EE94(v49, v47);
      v32 = *(_QWORD **)a5;
      v34 = sub_213491B7C(v31, i);
      v35 = v32[2];
      v36 = (v33 & 1) == 0;
      v37 = v35 + v36;
      if (__OFADD__(v35, v36))
        goto LABEL_28;
      v38 = v33;
      if (v32[3] < v37)
      {
        sub_2134921FC(v37, 1);
        v39 = sub_213491B7C(v31, i);
        if ((v38 & 1) != (v40 & 1))
          goto LABEL_30;
        v34 = v39;
      }
      if ((v38 & 1) != 0)
      {
        sub_21348921C((uint64_t)v47, (uint64_t)v46);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
        swift_bridgeObjectRelease();
        v30 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v34);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
        sub_21348EE94(v46, v30);
      }
      else
      {
        v41 = *(_QWORD **)a5;
        *(_QWORD *)(*(_QWORD *)a5 + 8 * (v34 >> 6) + 64) |= 1 << v34;
        v42 = (uint64_t *)(v41[6] + 16 * v34);
        *v42 = v31;
        v42[1] = i;
        sub_21348EE94(v47, (_OWORD *)(v41[7] + 32 * v34));
        v43 = v41[2];
        v27 = __OFADD__(v43, 1);
        v44 = v43 + 1;
        if (v27)
          goto LABEL_29;
        v41[2] = v44;
      }
      sub_213492B5C(&v48);
    }
LABEL_27:
    swift_release();
    swift_bridgeObjectRelease();
    sub_21348911C();
    return swift_release();
  }
  sub_2134921FC(v19, a4 & 1);
  v21 = sub_213491B7C(v13, v12);
  if ((v20 & 1) == (v22 & 1))
  {
    v16 = v21;
    if ((v20 & 1) == 0)
      goto LABEL_14;
LABEL_12:
    sub_21348921C((uint64_t)v47, (uint64_t)v46);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v47);
    swift_bridgeObjectRelease();
    v23 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)a5 + 56) + 32 * v16);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v23);
    sub_21348EE94(v46, v23);
    goto LABEL_16;
  }
LABEL_30:
  result = sub_21349B9C0();
  __break(1u);
  return result;
}

uint64_t sub_21348EC04(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  result = MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE4AF8];
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain();
    v6 = (uint64_t *)(a1 + 40);
    do
    {
      if (*(_QWORD *)(a2 + 16))
      {
        v7 = *(v6 - 1);
        v8 = *v6;
        swift_bridgeObjectRetain_n();
        sub_213491B7C(v7, v8);
        if ((v9 & 1) != 0)
        {
          swift_retain();
          v10 = swift_bridgeObjectRelease_n();
          MEMORY[0x2199B3C7C](v10);
          if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_21349B720();
          sub_21349B72C();
          sub_21349B714();
        }
        else
        {
          swift_bridgeObjectRelease_n();
        }
      }
      v6 += 2;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease();
    return v11;
  }
  return result;
}

uint64_t sub_21348ED30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21348ED70()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21348ED94(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *, _QWORD);
  char v3;
  char v4;
  uint64_t v6;
  char v7;
  char v8;

  v2 = *(uint64_t (**)(uint64_t *, _QWORD))(v1 + 16);
  v3 = *((_BYTE *)a1 + 8);
  v4 = *((_BYTE *)a1 + 9);
  v6 = *a1;
  v7 = v3;
  v8 = v4;
  return v2(&v6, 0);
}

uint64_t sub_21348EDDC(__int128 *a1, uint64_t a2)
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

uint64_t sub_21348EDF4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  char v3;
  char v4;
  uint64_t v6;
  char v7;
  char v8;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = *((_BYTE *)a1 + 8);
  v4 = *((_BYTE *)a1 + 9);
  v6 = *a1;
  v7 = v3;
  v8 = v4;
  return v2(&v6);
}

uint64_t sub_21348EE38(uint64_t result, unint64_t a2)
{
  switch(a2 >> 61)
  {
    case 0uLL:
      sub_21348C7B0(result, a2);
      result = swift_bridgeObjectRelease();
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      result = sub_21348C7B0(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_21348EE88(uint64_t a1, char a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_21348C7B0(a1, a2);
  return a1;
}

_OWORD *sub_21348EE94(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t AppResolutionResult.AppResolutionResultError.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = (unint64_t)*v0 >> 62;
  if ((_DWORD)v2)
  {
    if ((_DWORD)v2 != 1)
      return sub_21349BA14();
    sub_21349BA14();
    if (*(_QWORD *)(v1 + 24))
      goto LABEL_6;
  }
  else
  {
    sub_21349BA14();
    if (*(_QWORD *)(v1 + 24))
    {
LABEL_6:
      sub_21349BA20();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_21349B6A8();
      swift_release();
      return swift_bridgeObjectRelease();
    }
  }
  return sub_21349BA20();
}

uint64_t AppResolutionResult.AppResolutionResultError.hashValue.getter()
{
  sub_21349BA08();
  AppResolutionResult.AppResolutionResultError.hash(into:)();
  return sub_21349BA2C();
}

uint64_t sub_21348EFE8()
{
  sub_21349BA08();
  AppResolutionResult.AppResolutionResultError.hash(into:)();
  return sub_21349BA2C();
}

uint64_t sub_21348F034()
{
  sub_21349BA08();
  AppResolutionResult.AppResolutionResultError.hash(into:)();
  return sub_21349BA2C();
}

void AppResolutionResult.hash(into:)()
{
  __asm { BR              X10 }
}

uint64_t sub_21348F0B4()
{
  uint64_t v0;

  sub_21349BA14();
  if (!*(_QWORD *)(v0 + 24))
    return sub_21349BA20();
  sub_21349BA20();
  sub_21348C768(v0, 0);
  swift_bridgeObjectRetain();
  sub_21349B6A8();
  swift_bridgeObjectRelease();
  return sub_21348C7B0(v0, 0);
}

unint64_t sub_21348F238(unint64_t result, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v2 = a2;
  v3 = result;
  v4 = result >> 62;
  if (result >> 62)
    goto LABEL_51;
  v5 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = a2 >> 62;
  if (a2 >> 62)
    goto LABEL_52;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    return 0;
  while (1)
  {
    if (!v5)
      return 1;
    v7 = v3 & 0xFFFFFFFFFFFFFF8;
    if (v3 < 0)
      v7 = v3;
    if (!v4)
      v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
    v8 = v2 & 0xFFFFFFFFFFFFFF8;
    v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
    if (v2 < 0)
      v10 = v2;
    else
      v10 = v2 & 0xFFFFFFFFFFFFFF8;
    if (v6)
      v9 = v10;
    if (v7 == v9)
      return 1;
    if (v5 < 0)
      goto LABEL_55;
    if (((v2 | v3) & 0xC000000000000001) != 0)
      break;
    v3 += 32;
    v2 += 32;
    v17 = *(_QWORD *)(v8 + 16);
    while (v17)
    {
      v18 = *(_QWORD *)(*(_QWORD *)v3 + 24);
      v19 = *(_QWORD *)(*(_QWORD *)v2 + 24);
      if (v18)
      {
        if (!v19)
          return 0;
        v20 = *(_QWORD *)(*(_QWORD *)v3 + 16) == *(_QWORD *)(*(_QWORD *)v2 + 16) && v18 == v19;
        if (!v20 && (sub_21349B9A8() & 1) == 0)
          return 0;
      }
      else if (v19)
      {
        return 0;
      }
      --v17;
      v3 += 8;
      v2 += 8;
      if (!--v5)
        return 1;
    }
LABEL_50:
    __break(1u);
LABEL_51:
    swift_bridgeObjectRetain();
    v5 = sub_21349B960();
    result = swift_bridgeObjectRelease();
    v6 = (unint64_t)v2 >> 62;
    if (!((unint64_t)v2 >> 62))
      goto LABEL_3;
LABEL_52:
    swift_bridgeObjectRetain();
    v21 = sub_21349B960();
    result = swift_bridgeObjectRelease();
    if (v5 != v21)
      return 0;
  }
  v11 = 0;
  v12 = v2 & 0xC000000000000001;
  while (1)
  {
    if (v5 == v11)
    {
      __break(1u);
      __break(1u);
      goto LABEL_50;
    }
    if ((v3 & 0xC000000000000001) != 0)
    {
      result = MEMORY[0x2199B3E74](v11, v3);
      v4 = result;
      if (v12)
        goto LABEL_24;
    }
    else
    {
      v4 = *(_QWORD *)(v3 + 8 * v11 + 32);
      result = swift_retain();
      if (v12)
      {
LABEL_24:
        v13 = MEMORY[0x2199B3E74](v11, v2);
        goto LABEL_28;
      }
    }
    if (v11 >= *(_QWORD *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10))
      break;
    v13 = *(_QWORD *)(v2 + 8 * v11 + 32);
    swift_retain();
LABEL_28:
    v14 = *(_QWORD *)(v4 + 24);
    v15 = *(_QWORD *)(v13 + 24);
    if (!v14)
    {
      if (v15)
        goto LABEL_47;
LABEL_19:
      swift_release();
      swift_release();
      goto LABEL_20;
    }
    if (!v15)
    {
LABEL_47:
      swift_release();
      swift_release();
      return 0;
    }
    if (*(_QWORD *)(v4 + 16) == *(_QWORD *)(v13 + 16) && v14 == v15)
      goto LABEL_19;
    v16 = sub_21349B9A8();
    swift_release();
    swift_release();
    if ((v16 & 1) == 0)
      return 0;
LABEL_20:
    if (v5 == ++v11)
      return 1;
  }
  __break(1u);
LABEL_55:
  __break(1u);
  return result;
}

uint64_t AppResolutionResult.hashValue.getter()
{
  sub_21349BA08();
  AppResolutionResult.hash(into:)();
  return sub_21349BA2C();
}

uint64_t sub_21348F51C()
{
  sub_21349BA08();
  AppResolutionResult.hash(into:)();
  return sub_21349BA2C();
}

uint64_t sub_21348F570()
{
  sub_21349BA08();
  AppResolutionResult.hash(into:)();
  return sub_21349BA2C();
}

uint64_t sub_21348F5C0(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  unint64_t v6;

  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_21349B960();
    swift_bridgeObjectRelease();
    sub_21349BA14();
    swift_bridgeObjectRetain();
    v4 = sub_21349B960();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return result;
  }
  else
  {
    result = sub_21349BA14();
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return result;
  }
  if (v4 < 1)
  {
    __break(1u);
  }
  else if ((a2 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)(MEMORY[0x2199B3E74](i, a2) + 24))
      {
        sub_21349BA20();
        swift_bridgeObjectRetain();
        sub_21349B6A8();
        swift_unknownObjectRelease();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        sub_21349BA20();
        result = swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    v6 = a2 + 32;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)v6 + 24))
      {
        sub_21349BA20();
        swift_retain();
        swift_bridgeObjectRetain();
        sub_21349B6A8();
        swift_release();
        result = swift_bridgeObjectRelease();
      }
      else
      {
        result = sub_21349BA20();
      }
      v6 += 8;
      --v4;
    }
    while (v4);
  }
  return result;
}

uint64_t _s17SiriAppResolution0bC6ResultO0bcD5ErrorO2eeoiySbAE_AEtFZ_0(uint64_t *a1, unint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v2 = *a1;
  v3 = *a2;
  v4 = (unint64_t)*a1 >> 62;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 != 1)
    {
      if (v3 == 0x8000000000000000)
      {
        swift_release();
        return 1;
      }
      return 0;
    }
    if (v3 >> 62 != 1)
      return 0;
  }
  else if (v3 >> 62)
  {
    return 0;
  }
  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v3 + 24);
  if (!v5)
    return !v6;
  if (!v6)
    return 0;
  v7 = *(_QWORD *)(v2 + 16) == *(_QWORD *)(v3 + 16) && v5 == v6;
  return v7 || (sub_21349B9A8() & 1) != 0;
}

void _s17SiriAppResolution0bC6ResultO2eeoiySbAC_ACtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_21348F830()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char v7;
  uint64_t v8;
  char v9;
  char v10;

  if (v3)
  {
    sub_21348C768(v0, v3);
    sub_21348C768(v1, v2);
    sub_21348C7B0(v1, v2);
    v8 = v0;
    v9 = v3;
    goto LABEL_11;
  }
  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v0 + 24);
  if (v4)
  {
    if (v5)
    {
      if (*(_QWORD *)(v1 + 16) == *(_QWORD *)(v0 + 16) && v4 == v5)
      {
        sub_21348C768(v0, 0);
        sub_21348C768(v1, 0);
        sub_21348C7B0(v1, 0);
        sub_21348C7B0(v0, 0);
        v10 = 1;
        return v10 & 1;
      }
      v7 = sub_21349B9A8();
      sub_21348C768(v0, 0);
      sub_21348C768(v1, 0);
      sub_21348C7B0(v1, 0);
      sub_21348C7B0(v0, 0);
      if ((v7 & 1) != 0)
        goto LABEL_15;
      goto LABEL_12;
    }
    sub_21348C768(v0, 0);
    sub_21348C768(v1, 0);
    sub_21348C7B0(v1, 0);
    v8 = v0;
    v9 = 0;
LABEL_11:
    sub_21348C7B0(v8, v9);
    goto LABEL_12;
  }
  sub_21348C768(v0, 0);
  sub_21348C768(v1, 0);
  sub_21348C7B0(v1, 0);
  sub_21348C7B0(v0, 0);
  if (!v5)
  {
LABEL_15:
    v10 = 1;
    return v10 & 1;
  }
LABEL_12:
  v10 = 0;
  return v10 & 1;
}

unint64_t sub_21348FB68()
{
  unint64_t result;

  result = qword_254B9CF48;
  if (!qword_254B9CF48)
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppResolutionResult.AppResolutionResultError, &type metadata for AppResolutionResult.AppResolutionResultError);
    atomic_store(result, (unint64_t *)&qword_254B9CF48);
  }
  return result;
}

unint64_t sub_21348FBB0()
{
  unint64_t result;

  result = qword_254B9CF50;
  if (!qword_254B9CF50)
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppResolutionResult, &type metadata for AppResolutionResult);
    atomic_store(result, (unint64_t *)&qword_254B9CF50);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_21348C768(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t destroy for AppResolutionResult(uint64_t a1)
{
  return sub_21348C7B0(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_21348C768(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_21348C7B0(v5, v6);
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

uint64_t assignWithTake for AppResolutionResult(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  char v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(_QWORD *)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_21348C7B0(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionResult(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AppResolutionResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_21348FD74(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_21348FD7C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AppResolutionResult()
{
  return &type metadata for AppResolutionResult;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppResolutionResult.AppResolutionResultError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  return a1;
}

uint64_t destroy for AppResolutionResult.AppResolutionResultError()
{
  return swift_release();
}

_QWORD *assignWithCopy for AppResolutionResult.AppResolutionResultError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *assignWithTake for AppResolutionResult.AppResolutionResultError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppResolutionResult.AppResolutionResultError(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AppResolutionResult.AppResolutionResultError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_21348FEFC(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_21348FF18(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_21348FF28(unint64_t *result, uint64_t a2)
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

ValueMetadata *type metadata accessor for AppResolutionResult.AppResolutionResultError()
{
  return &type metadata for AppResolutionResult.AppResolutionResultError;
}

uint64_t dispatch thunk of AppResolving.resolveApp(intent:appResolutionState:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t static AppSelectionFailure.== infix(_:_:)()
{
  return 1;
}

uint64_t AppSelectionFailure.hash(into:)()
{
  return sub_21349BA14();
}

uint64_t AppSelectionFailure.hashValue.getter()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

uint64_t sub_21348FFE0()
{
  return 1;
}

uint64_t sub_21348FFE8()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

uint64_t sub_213490028()
{
  return sub_21349BA14();
}

uint64_t sub_21349004C()
{
  sub_21349BA08();
  sub_21349BA14();
  return sub_21349BA2C();
}

unint64_t sub_21349008C()
{
  unint64_t result;

  result = qword_254B9CF58[0];
  if (!qword_254B9CF58[0])
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppSelectionFailure, &type metadata for AppSelectionFailure);
    atomic_store(result, qword_254B9CF58);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AppSelectionFailure(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSelectionFailure(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_213490164 + 4 * asc_21349C710[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_213490184 + 4 * byte_21349C715[v4]))();
}

_BYTE *sub_213490164(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_213490184(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21349018C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_213490194(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21349019C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2134901A4(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2134901B0()
{
  return 0;
}

ValueMetadata *type metadata accessor for AppSelectionFailure()
{
  return &type metadata for AppSelectionFailure;
}

uint64_t dispatch thunk of InstrumentedAppSelecting.selectAppWithMetadata(intent:fromEligibleApps:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 8))();
}

unint64_t sub_2134901D4(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D078);
  v2 = sub_21349B984();
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
    sub_21349313C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_213491B7C(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_21348EE94(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

unint64_t sub_2134902FC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0B0);
  v2 = (_QWORD *)sub_21349B984();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_213491B7C(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
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

_QWORD *AppSelectionService.__allocating_init(resolvers:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_allocObject();
  return AppSelectionService.init(resolvers:)(a1, v2, v3, v4);
}

_QWORD *AppSelectionService.init(resolvers:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2134904C4(a1, (uint64_t)sub_21349047C, a3, a4);
}

uint64_t type metadata accessor for AppSelectionService.EligibleAppFinder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppSelectionService.EligibleAppFinder);
}

uint64_t sub_21349046C()
{
  return swift_allocObject();
}

_QWORD *AppSelectionService.__allocating_init(resolverArray:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_allocObject();
  return AppSelectionService.init(resolverArray:)(a1, v2, v3, v4);
}

_QWORD *AppSelectionService.init(resolverArray:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_2134904C4(a1, (uint64_t)sub_21349047C, a3, a4);
}

_QWORD *sub_2134904C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v4;
  v4[12] = a1;
  v7 = type metadata accessor for AppSelectionService.EligibleAppFinder(0, *(_QWORD *)(v6 + 128), a3, a4);
  v8 = swift_allocObject();
  v4[10] = v7;
  v4[11] = (uint64_t)&off_24CFD56F8;
  v4[7] = v8;
  v4[13] = a2;
  v4[14] = 0;
  return AppResolutionService.init()();
}

_QWORD *AppSelectionService.__allocating_init(resolvers:eligibleAppFinder:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return AppSelectionService.init(resolvers:eligibleAppFinder:)(a1, a2);
}

_QWORD *AppSelectionService.init(resolvers:eligibleAppFinder:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[12] = a1;
  sub_21348CD5C(a2, (uint64_t)(v2 + 7));
  v2[13] = sub_21349047C;
  v2[14] = 0;
  v4 = AppResolutionService.init()();
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  return v4;
}

void sub_2134905B4(uint64_t a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  char v4;
  char v5;
  uint64_t v6;
  char v7;
  char v8;

  v4 = *((_BYTE *)a3 + 8);
  v5 = *((_BYTE *)a3 + 9);
  v6 = *a3;
  v7 = v4;
  v8 = v5;
  sub_21348C2F4(a1, a2, (uint64_t)&v6, a4);
}

uint64_t sub_2134905EC(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  id v10;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a3;
  v9[5] = a4;
  swift_retain();
  v10 = a1;
  swift_retain();
  sub_213490B98(v10, a2, (uint64_t)sub_2134907DC, (uint64_t)v9);
  return swift_release();
}

void sub_213490678(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(void **))
{
  void *v8;
  char v9;
  char v10;
  id v11;
  void (*v12)(uint64_t, uint64_t, void **, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v18;
  char v19;
  void *v20;
  char v21;
  char v22;

  v8 = *(void **)a1;
  v9 = *(_BYTE *)(a1 + 8);
  v10 = *(_BYTE *)(a1 + 9);
  if ((v10 & 1) != 0)
  {
    v11 = v8;
  }
  else
  {
    v20 = *(void **)a1;
    v21 = v9;
    sub_21348C75C(v8, v9, 0);
    sub_2134907E8((uint64_t)&v20, (uint64_t)&v18);
    sub_21348C7A4(v8, v9, 0);
    v8 = v18;
    v9 = v19;
  }
  v12 = *(void (**)(uint64_t, uint64_t, void **, uint64_t))(a3 + 104);
  v13 = objc_msgSend(a4, sel_typeName);
  v14 = sub_21349B690();
  v16 = v15;

  v20 = v8;
  v21 = v9;
  v22 = v10;
  v12(v14, v16, &v20, a2);
  swift_bridgeObjectRelease();
  v20 = v8;
  v21 = v9;
  v22 = v10;
  a5(&v20);
  sub_21348C7A4(v8, v9, v10);
}

uint64_t sub_2134907A8()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_2134907DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_213490678(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void (**)(void **))(v2 + 32));
}

void sub_2134907E8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;

  v3 = *(_QWORD *)a1;
  v4 = *(unsigned __int8 *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 8))
  {
    v15 = swift_retain();
    if (!sub_21348C89C(v15))
    {
      if (qword_254B9CC08 != -1)
        swift_once();
      v16 = sub_21349B5AC();
      __swift_project_value_buffer(v16, (uint64_t)qword_254B9E390);
      sub_21348C768(v3, 0);
      swift_retain();
      v7 = sub_21349B5A0();
      v8 = sub_21349B7B0();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        v10 = swift_slowAlloc();
        v22 = v10;
        *(_DWORD *)v9 = 136315138;
        swift_retain();
        v17 = sub_213485868();
        v19 = v18;
        sub_21348C7B0(v3, 0);
        sub_213487AF0(v17, v19, &v22);
        sub_21349B828();
        swift_bridgeObjectRelease();
        sub_21348C7B0(v3, 0);
        sub_21348C7B0(v3, 0);
        v14 = "App(to be confirmed) restricted by screentime: %s";
        goto LABEL_15;
      }
      sub_21348C7B0(v3, 0);
      v20 = v3;
      v21 = 0;
LABEL_18:
      sub_21348C7B0(v20, v21);
      goto LABEL_19;
    }
    goto LABEL_9;
  }
  if (v4 != 2)
  {
LABEL_10:
    *(_QWORD *)a2 = v3;
    *(_BYTE *)(a2 + 8) = v4;
    sub_21348C768(v3, v4);
    return;
  }
  v5 = swift_retain();
  if (sub_21348C89C(v5))
  {
LABEL_9:
    sub_21348C7B0(v3, v4);
    goto LABEL_10;
  }
  if (qword_254B9CC08 != -1)
    swift_once();
  v6 = sub_21349B5AC();
  __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
  sub_21348C768(v3, 2);
  swift_retain();
  v7 = sub_21349B5A0();
  v8 = sub_21349B7B0();
  if (!os_log_type_enabled(v7, v8))
  {
    sub_21348C7B0(v3, 2);
    v20 = v3;
    v21 = 2;
    goto LABEL_18;
  }
  v9 = (uint8_t *)swift_slowAlloc();
  v10 = swift_slowAlloc();
  v22 = v10;
  *(_DWORD *)v9 = 136315138;
  swift_retain();
  v11 = sub_213485868();
  v13 = v12;
  sub_21348C7B0(v3, 2);
  sub_213487AF0(v11, v13, &v22);
  sub_21349B828();
  swift_bridgeObjectRelease();
  sub_21348C7B0(v3, 2);
  sub_21348C7B0(v3, 2);
  v14 = "App(selected) restricted by screentime: %s";
LABEL_15:
  _os_log_impl(&dword_213483000, v7, v8, v14, v9, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x2199B4300](v10, -1, -1);
  MEMORY[0x2199B4300](v9, -1, -1);
LABEL_19:

  *(_QWORD *)a2 = v3 | 0x4000000000000000;
  *(_BYTE *)(a2 + 8) = 3;
}

uint64_t sub_213490B98(void *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void (*v17)(uint64_t, uint64_t, void (*)(unint64_t), _QWORD *, uint64_t, uint64_t);
  id v18;
  __int128 v20;

  sub_213490F80(a2, (uint64_t *)&v20);
  if (*((_QWORD *)&v20 + 1) >> 2 != 0xFFFFFFFFLL)
    __asm { BR              X10 }
  v9 = v4[10];
  v10 = v4[11];
  __swift_project_boxed_opaque_existential_1(v4 + 7, v9);
  v11 = a3;
  v12 = objc_msgSend(a1, sel__className);
  v13 = sub_21349B690();
  v15 = v14;

  sub_21348CD5C((uint64_t)a2, (uint64_t)&v20);
  v16 = (_QWORD *)swift_allocObject();
  sub_21348EDDC(&v20, (uint64_t)(v16 + 2));
  v16[7] = v11;
  v16[8] = a4;
  v16[9] = v4;
  v16[10] = a1;
  v17 = *(void (**)(uint64_t, uint64_t, void (*)(unint64_t), _QWORD *, uint64_t, uint64_t))(v10 + 16);
  swift_retain();
  swift_retain();
  v18 = a1;
  v17(v13, v15, sub_2134931C0, v16, v9, v10);
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_213490DDC(unint64_t a1, _QWORD *a2, void (*a3)(__int128 *, uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v11;
  unint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unsigned __int8 v20;
  void *v21;
  char v22;
  char v23;

  v11 = 0x2000000000000002;
  v12 = sub_213498E44(a1);
  v14 = (void *)v12;
  if (!v13)
    goto LABEL_6;
  if (v13 != 1)
  {
    v11 = 0x2000000000000003;
    v14 = (void *)0x8000000000000000;
LABEL_6:
    sub_21348C768((uint64_t)v14, v11);
    v18 = v11;
    goto LABEL_7;
  }
  sub_213493278(v12, 1);
  v15 = a2[3];
  v16 = a2[4];
  __swift_project_boxed_opaque_existential_1(a2, v15);
  AppResolutionStateProviding.previousSelectionResponse.getter(v15, v16);
  if ((v20 | 2) == 3)
  {
    v17 = swift_bridgeObjectRetain();
    v18 = 1;
    sub_21348C768(v17, 1);
    v11 = 0x6000000000000001;
    v14 = (void *)a1;
LABEL_7:
    v21 = v14;
    v22 = v18;
    v23 = 0;
    sub_213493294((uint64_t)v14, v11);
    sub_21349A220();
    a3((__int128 *)&v21, v19);
    swift_bridgeObjectRelease();
    sub_21348EE38((uint64_t)v14, v11);
    sub_213493214((uint64_t)v14, v11);
    sub_21348C7A4(v14, v18, 0);
    return;
  }
  sub_213491390(a6, a1, 0, a3, a4);
}

double sub_213490F80@<D0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  AppResolutionStateProviding.previousSelectionResponse.getter(v4, v5);
  if (v31 == 3)
    goto LABEL_2;
  v7 = a1[3];
  v8 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  if (v9)
  {
    v10 = v9;
    if (qword_254B9CC08 != -1)
      swift_once();
    v11 = sub_21349B5AC();
    __swift_project_value_buffer(v11, (uint64_t)qword_254B9E390);
    swift_retain_n();
    v12 = sub_21349B5A0();
    v13 = sub_21349B7B0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v31 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_retain();
      v16 = sub_213485868();
      v18 = v17;
      swift_release();
      sub_213487AF0(v16, v18, &v31);
      sub_21349B828();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213483000, v12, v13, "Selected requested app from appResolutionState: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v15, -1, -1);
      MEMORY[0x2199B4300](v14, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    *a2 = v10;
    a2[1] = 0x4000000000000002;
    goto LABEL_15;
  }
  v19 = a1[3];
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 16))(v19, v20);
  if (!v21)
  {
LABEL_2:
    result = 0.0;
    *(_OWORD *)a2 = xmmword_21349C830;
LABEL_15:
    a2[2] = 0;
    a2[3] = 0;
    return result;
  }
  v22 = v21;
  if (qword_254B9CC08 != -1)
    swift_once();
  v23 = sub_21349B5AC();
  __swift_project_value_buffer(v23, (uint64_t)qword_254B9E390);
  swift_retain_n();
  v24 = sub_21349B5A0();
  v25 = sub_21349B7B0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v31 = v27;
    *(_DWORD *)v26 = 136315138;
    swift_retain();
    v28 = sub_213485868();
    v30 = v29;
    swift_release();
    sub_213487AF0(v28, v30, &v31);
    sub_21349B828();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v24, v25, "Selected suggested app from appResolutionState: %s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v27, -1, -1);
    MEMORY[0x2199B4300](v26, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  *a2 = v22;
  *(_QWORD *)&result = 2;
  *(_OWORD *)(a2 + 1) = xmmword_21349C820;
  a2[3] = 0x800000021349D5C0;
  return result;
}

uint64_t sub_213491390(uint64_t result, uint64_t a2, uint64_t a3, void (*a4)(__int128 *, uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  __int128 v17[2];
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v9 = *(_QWORD *)(v5 + 96);
  if (*(_QWORD *)(v9 + 16) <= a3)
  {
    *(_QWORD *)&v17[0] = a2;
    WORD4(v17[0]) = 1;
    v18[0] = a2;
    v18[1] = 0x2000000000000001;
    v18[2] = 0;
    v19 = 0;
    swift_bridgeObjectRetain_n();
    sub_21349A220();
    a4(v17, v16);
    swift_bridgeObjectRelease_n();
    return swift_bridgeObjectRelease();
  }
  else if (a3 < 0)
  {
    __break(1u);
  }
  else
  {
    v11 = (void *)result;
    sub_21348CD5C(v9 + 40 * a3 + 32, (uint64_t)v18);
    v12 = v19;
    v13 = v20;
    __swift_project_boxed_opaque_existential_1(v18, v19);
    sub_21348CD5C((uint64_t)v18, (uint64_t)v17);
    v14 = (_QWORD *)swift_allocObject();
    v14[2] = a4;
    v14[3] = a5;
    sub_21348EDDC(v17, (uint64_t)(v14 + 4));
    v14[9] = v5;
    v14[10] = v11;
    v14[11] = a2;
    v14[12] = a3;
    swift_retain();
    swift_retain();
    v15 = v11;
    swift_bridgeObjectRetain();
    sub_21348E5DC((uint64_t)v15, a2, (uint64_t)sub_21349304C, (uint64_t)v14, v12, v13);
    swift_release();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }
  return result;
}

uint64_t sub_213491510(uint64_t result, uint64_t a2, void (*a3)(uint64_t *, uint64_t), uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _QWORD *v14;
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
  char v25;
  char v26;

  if ((*(_BYTE *)(result + 9) & 1) != 0)
  {
    if (__OFADD__(a9, 1))
    {
      __break(1u);
    }
    else
    {
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = a2;
      v14[3] = a3;
      v14[4] = a4;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_213491390(a7, a8, a9 + 1, sub_2134930A8, v14);
      return swift_release();
    }
  }
  else
  {
    v15 = *(_QWORD *)result;
    v16 = *(unsigned __int8 *)(result + 8);
    if (a2)
    {
      v20 = *(_QWORD *)result;
      LOWORD(v21) = v16;
      sub_21348C768(v15, v16);
      a3(&v20, a2);
    }
    else
    {
      __swift_project_boxed_opaque_existential_1(a5, a5[3]);
      sub_21348C768(v15, v16);
      sub_21348C768(v15, v16);
      v17 = sub_21348E47C();
      v23 = v18;
      v24 = v15;
      v25 = v16;
      v26 = 0;
      v20 = v15;
      v21 = v16;
      v22 = v17;
      sub_21348C768(v15, v16);
      sub_21349A220();
      a3(&v24, v19);
      swift_bridgeObjectRelease();
      sub_21348C7B0(v15, v16);
      swift_bridgeObjectRelease();
      sub_21348EE88(v15, v16, 0);
    }
    return sub_21348EE88(v15, v16, 0);
  }
  return result;
}

uint64_t sub_2134916D8(uint64_t *a1, uint64_t a2, unint64_t a3, void (*a4)(uint64_t *, uint64_t))
{
  uint64_t v6;
  char v7;
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  char v16;
  char v17;

  v6 = *a1;
  v7 = *((_BYTE *)a1 + 8);
  v8 = *((_BYTE *)a1 + 9);
  v9 = sub_2134901D4(MEMORY[0x24BEE4AF8]);
  if (a3)
    v10 = a3;
  else
    v10 = sub_2134901D4(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRetain();
  v11 = sub_2134917AC(v10, v9);
  v12 = swift_bridgeObjectRetain();
  v13 = sub_2134917AC(v12, v11);
  v15 = v6;
  v16 = v7;
  v17 = v8;
  a4(&v15, v13);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2134917AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_21348E8B0(a1, (uint64_t)sub_213492B1C, 0, isUniquelyReferenced_nonNull_native, (uint64_t)&v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_213491828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  return swift_task_switch();
}

uint64_t sub_213491844()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = sub_213492D30((uint64_t)&unk_24CFD4A00);
  v0[10] = v1;
  type metadata accessor for AppSupportService();
  swift_initStaticObject();
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = swift_bridgeObjectRetain();
    v3 = sub_213488338(v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = v0[7];
  v0[2] = v0[6];
  v0[11] = (uint64_t)v3;
  v0[3] = v4;
  v0[4] = (uint64_t)v3;
  v0[5] = 0;
  swift_bridgeObjectRetain();
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = sub_213491908;
  return sub_2134934C8(v0 + 2);
}

uint64_t sub_213491908(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_213491994()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(v0 + 64))(*(_QWORD *)(v0 + 104));
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2134919D4()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2134919E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21349B768();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a1;
  v12[5] = a2;
  v12[6] = a3;
  v12[7] = a4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_213487780((uint64_t)v10, (uint64_t)&unk_254B9D068, (uint64_t)v12);
  return swift_release();
}

void AppSelectionService.__allocating_init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AppSelectionService.init()()
{
  sub_213492E70();
}

uint64_t sub_213491B00()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t AppSelectionService.deinit()
{
  uint64_t v0;

  v0 = AppResolutionService.deinit();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t AppSelectionService.__deallocating_deinit()
{
  AppSelectionService.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_213491B7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21349BA08();
  sub_21349B6A8();
  v4 = sub_21349BA2C();
  return sub_2134924F8(a1, a2, v4);
}

uint64_t sub_213491BE0(uint64_t a1, char a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D098);
  v37 = a2;
  v6 = sub_21349B978();
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
    sub_21349BA08();
    sub_21349B6A8();
    result = sub_21349BA2C();
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

uint64_t sub_213491EE8(uint64_t a1, char a2)
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
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0A0);
  v36 = a2;
  v6 = sub_21349B978();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
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
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_21349BA08();
    sub_21349B6A8();
    result = sub_21349BA2C();
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
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
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

uint64_t sub_2134921FC(uint64_t a1, char a2)
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
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D078);
  v6 = sub_21349B978();
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
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_21348EE94(v24, v35);
      }
      else
      {
        sub_21348921C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_21349BA08();
      sub_21349B6A8();
      result = sub_21349BA2C();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_21348EE94(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_2134924F8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21349B9A8() & 1) == 0)
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
      while (!v14 && (sub_21349B9A8() & 1) == 0);
    }
  }
  return v6;
}

void *sub_2134925D8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D098);
  v2 = *v0;
  v3 = sub_21349B96C();
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

void *sub_213492784()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0A0);
  v2 = *v0;
  v3 = sub_21349B96C();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
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
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
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
LABEL_28:
  __break(1u);
  return result;
}

void *sub_213492938()
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
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D078);
  v2 = *v0;
  v3 = sub_21349B96C();
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
    v20 = 32 * v15;
    sub_21348921C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_21348EE94(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
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

uint64_t sub_213492B1C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v4 = *a1;
  v3 = a1[1];
  sub_21348921C((uint64_t)(a1 + 2), (uint64_t)(a2 + 2));
  *a2 = v4;
  a2[1] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_213492B5C@<X0>(_OWORD *a1@<X8>)
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
    sub_21348921C(*(_QWORD *)(v3 + 56) + 32 * v10, (uint64_t)v24);
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
            while (v15 != v18)
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
  result = sub_2134930B4((uint64_t)&v23, (uint64_t)v22);
  if (*((_QWORD *)&v22[0] + 1))
  {
    v21[0] = v22[0];
    v21[1] = v22[1];
    v21[2] = v22[2];
    v19(v21);
    return sub_2134930FC((uint64_t)v21);
  }
  else
  {
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
  }
  return result;
}

uint64_t sub_213492D30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D070);
    v3 = sub_21349B8B8();
    v4 = 0;
    v5 = v3 + 56;
    v6 = a1 + 32;
    while (1)
    {
      v7 = *(_QWORD *)(v6 + 8 * v4);
      sub_21349BA08();
      sub_21349BA14();
      result = sub_21349BA2C();
      v9 = -1 << *(_BYTE *)(v3 + 32);
      v10 = result & ~v9;
      v11 = v10 >> 6;
      v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
      v13 = 1 << v10;
      v14 = *(_QWORD *)(v3 + 48);
      if (((1 << v10) & v12) != 0)
      {
        if (*(_QWORD *)(v14 + 8 * v10) == v7)
          goto LABEL_3;
        v15 = ~v9;
        while (1)
        {
          v10 = (v10 + 1) & v15;
          v11 = v10 >> 6;
          v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
          v13 = 1 << v10;
          if ((v12 & (1 << v10)) == 0)
            break;
          if (*(_QWORD *)(v14 + 8 * v10) == v7)
            goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
      *(_QWORD *)(v14 + 8 * v10) = v7;
      v16 = *(_QWORD *)(v3 + 16);
      v17 = __OFADD__(v16, 1);
      v18 = v16 + 1;
      if (v17)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v18;
LABEL_3:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

void sub_213492E70()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_213492E9C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for AppSelectionService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AppSelectionService);
}

uint64_t method lookup function for AppSelectionService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolvers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolverArray:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of AppSelectionService.__allocating_init(resolvers:eligibleAppFinder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

uint64_t sub_213492F28()
{
  return swift_initClassMetadata2();
}

uint64_t sub_213492F5C()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213492F90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 56);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_2134890C4;
  *(_QWORD *)(v4 + 72) = v3;
  *(_OWORD *)(v4 + 56) = v5;
  *(_QWORD *)(v4 + 48) = v2;
  return swift_task_switch();
}

uint64_t sub_213493008()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 32);
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21349304C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_213491510(a1, a2, *(void (**)(uint64_t *, uint64_t))(v2 + 16), *(_QWORD *)(v2 + 24), (_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 72), *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88), *(_QWORD *)(v2 + 96));
}

uint64_t sub_21349307C()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2134930A8(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2134916D8(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t *, uint64_t))(v2 + 24));
}

uint64_t sub_2134930B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D080);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2134930FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D088);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21349313C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D090);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213493184()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_2134931C0(unint64_t a1)
{
  uint64_t v1;

  sub_213490DDC(a1, (_QWORD *)(v1 + 16), *(void (**)(__int128 *, uint64_t))(v1 + 56), *(_QWORD *)(v1 + 64), *(_QWORD *)(v1 + 72), *(_QWORD *)(v1 + 80));
}

unint64_t sub_2134931D0()
{
  unint64_t result;

  result = qword_254B9D0A8;
  if (!qword_254B9D0A8)
  {
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for AppSelectionFailure, &type metadata for AppSelectionFailure);
    atomic_store(result, (unint64_t *)&qword_254B9D0A8);
  }
  return result;
}

uint64_t sub_213493214(uint64_t result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF)
    return sub_21348EE38(result, a2);
  return result;
}

uint64_t sub_213493228(uint64_t result, unint64_t a2)
{
  switch(a2 >> 61)
  {
    case 0uLL:
      sub_21348C768(result, a2);
      result = swift_bridgeObjectRetain();
      break;
    case 1uLL:
    case 2uLL:
    case 3uLL:
      result = sub_21348C768(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_213493278(uint64_t a1, char a2)
{
  uint64_t result;

  if (a2 == 1)
    return swift_bridgeObjectRelease();
  if (!a2)
    return swift_release();
  return result;
}

uint64_t sub_213493294(uint64_t result, unint64_t a2)
{
  if (a2 >> 2 != 0xFFFFFFFF)
    return sub_213493228(result, a2);
  return result;
}

uint64_t AppSupportQuery.init(intentID:allowedSiriAuthorizationStatus:allowedExtensionPointIdentifiers:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  v5 = *a3;
  v6 = *a4;
  *a5 = result;
  a5[1] = a2;
  a5[2] = v5;
  a5[3] = v6;
  return result;
}

uint64_t sub_2134932BC(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

uint64_t sub_213493320(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_21349B9A8();
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
    if (v12 || (sub_21349B9A8() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2134933E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  a3[3] = &type metadata for AppSupportService.SystemAppRecordData;
  a3[4] = sub_213498BF8();
  *a3 = a1;
  a3[1] = a2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_21349342C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_2134987E8(a1, a2);
  a3[3] = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D208);
  result = sub_213498B74(&qword_254B9D210, &qword_254B9D208, MEMORY[0x24BEE12C8]);
  a3[4] = result;
  *a3 = v4;
  return result;
}

uint64_t static AppSupportService.sharedInstance.getter()
{
  type metadata accessor for AppSupportService();
  return swift_initStaticObject();
}

uint64_t type metadata accessor for AppSupportService()
{
  return objc_opt_self();
}

uint64_t sub_2134934C8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v2 + 56) = v1;
  v4 = sub_21349B594();
  *(_QWORD *)(v2 + 64) = v4;
  *(_QWORD *)(v2 + 72) = *(_QWORD *)(v4 - 8);
  v5 = swift_task_alloc();
  v6 = *a1;
  v7 = a1[1];
  *(_QWORD *)(v2 + 80) = v5;
  *(_QWORD *)(v2 + 88) = v6;
  *(_QWORD *)(v2 + 96) = v7;
  *(_OWORD *)(v2 + 104) = *((_OWORD *)a1 + 1);
  return swift_task_switch();
}

uint64_t sub_21349353C()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  unint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;

  if (qword_254B9CC10 != -1)
    swift_once();
  v1 = (id)qword_254B9E3A8;
  sub_21349B588();
  sub_21349B810();
  sub_21349B57C();
  if (qword_254B9CC08 != -1)
    swift_once();
  v2 = sub_21349B5AC();
  v0[15] = __swift_project_value_buffer(v2, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v3 = sub_21349B5A0();
  v4 = sub_21349B78C();
  v5 = os_log_type_enabled(v3, v4);
  v6 = v0[12];
  if (v5)
  {
    v15 = v0[11];
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v17 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[6] = sub_213487AF0(v15, v6, &v17);
    sub_21349B828();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v3, v4, "Searching for Apps Plugins supporting Intent '%s'", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v8, -1, -1);
    MEMORY[0x2199B4300](v7, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v9 = v0[14];
  v16 = *((_OWORD *)v0 + 6);
  v10 = v0[11];
  v11 = v0[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0C0);
  v12 = swift_task_alloc();
  v0[16] = v12;
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v10;
  *(_OWORD *)(v12 + 32) = v16;
  *(_QWORD *)(v12 + 48) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0D8);
  v13 = (_QWORD *)swift_task_alloc();
  v0[17] = v13;
  *v13 = v0;
  v13[1] = sub_213493834;
  return sub_21349B8F4();
}

uint64_t sub_213493834()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213493890()
{
  uint64_t v0;
  unint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v2 = sub_21349B5A0();
  v3 = sub_21349B78C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = v17;
    *(_DWORD *)v4 = 134218498;
    if (v1 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_21349B960();
      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v7 = *(_QWORD *)(v0 + 88);
    v6 = *(_QWORD *)(v0 + 96);
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 24) = v5;
    sub_21349B828();
    swift_bridgeObjectRelease();
    *(_WORD *)(v4 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_213487AF0(v7, v6, &v18);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v4 + 22) = 2080;
    v8 = type metadata accessor for App();
    v9 = swift_bridgeObjectRetain();
    v10 = MEMORY[0x2199B3CA0](v9, v8);
    v12 = v11;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 40) = sub_213487AF0(v10, v12, &v18);
    sub_21349B828();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213483000, v2, v3, "Found %ld apps supporting %s: %s", (uint8_t *)v4, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v17, -1, -1);
    MEMORY[0x2199B4300](v4, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v14 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v15 = *(_QWORD *)(v0 + 64);
  sub_21349B804();
  sub_21349B57C();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  swift_task_dealloc();
  return (*(uint64_t (**)(unint64_t))(v0 + 8))(v1);
}

uint64_t sub_213493BAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;

  v7[8] = a6;
  v7[9] = a7;
  v7[6] = a4;
  v7[7] = a5;
  v7[4] = a2;
  v7[5] = a3;
  v7[3] = a1;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1A0);
  v7[10] = v8;
  v7[11] = *(_QWORD *)(v8 - 8);
  v7[12] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  v7[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213493C40()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  void (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v1 = v0[13];
  v3 = v0[8];
  v2 = v0[9];
  v4 = v0[6];
  v5 = v0[7];
  v6 = v0[5];
  v7 = sub_21349B768();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v12(v1, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v6;
  v8[5] = v4;
  v8[6] = v5;
  v8[7] = v3;
  v8[8] = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2134941AC(v1, (uint64_t)&unk_254B9D1B0, (uint64_t)v8);
  sub_213489128(v1);
  v12(v1, 1, 1, v7);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v6;
  v9[5] = v4;
  v9[6] = v5;
  v9[7] = v3;
  v9[8] = v2;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2134941AC(v1, (uint64_t)&unk_254B9D1C0, (uint64_t)v9);
  sub_213489128(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0C0);
  sub_21349B744();
  v0[14] = sub_213498B74(&qword_254B9D1C8, &qword_254B9D1A0, MEMORY[0x24BEE68A8]);
  v10 = (_QWORD *)swift_task_alloc();
  v0[15] = v10;
  *v10 = v0;
  v10[1] = sub_213493E24;
  return sub_21349B750();
}

uint64_t sub_213493E24()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[11] + 8))(v2[12], v2[10]);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2[16] = MEMORY[0x24BEE4B08];
  }
  return swift_task_switch();
}

uint64_t sub_213493EAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t *v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 128);
  if (v1)
  {
    *(_QWORD *)(v0 + 136) = sub_213494568(v1, *(_QWORD *)(v0 + 128));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v3;
    *v3 = v0;
    v3[1] = sub_213493F98;
    return sub_21349B750();
  }
  else
  {
    v5 = *(uint64_t **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
    swift_bridgeObjectRelease();
    v6 = sub_213488240(v2);
    swift_bridgeObjectRelease();
    *v5 = v6;
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_213493F98()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v2 = (_QWORD *)*v1;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[11] + 8))(v2[12], v2[10]);
    swift_bridgeObjectRelease();
  }
  else
  {
    v2[16] = v2[17];
  }
  return swift_task_switch();
}

uint64_t sub_213494020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  v7 = sub_21349B594();
  v6[6] = v7;
  v6[7] = *(_QWORD *)(v7 - 8);
  v6[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213494084()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;

  if (qword_254B9CC10 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 40);
  v10 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = *(uint64_t **)(v0 + 16);
  v6 = (id)qword_254B9E3A8;
  sub_21349B588();
  sub_21349B810();
  sub_21349B57C();
  v7 = sub_213495284(v4, v3);
  v8 = sub_213488EB4(v7);
  swift_bridgeObjectRelease();
  sub_21349B804();
  sub_21349B57C();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v10);
  *v5 = v8;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2134941AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];
  _QWORD v21[4];

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21349870C(a1, (uint64_t)v10);
  v11 = sub_21349B768();
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_213489128((uint64_t)v10);
    if (*(_QWORD *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      v13 = sub_21349B738();
      v15 = v14;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    sub_21349B75C();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
    if (*(_QWORD *)(a3 + 16))
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v16 = *v4;
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0C0);
  v18 = (_QWORD *)(v15 | v13);
  if (v15 | v13)
  {
    v21[0] = 0;
    v21[1] = 0;
    v18 = v21;
    v21[2] = v13;
    v21[3] = v15;
  }
  v20[1] = 1;
  v20[2] = v18;
  v20[3] = v16;
  swift_task_create();
  return swift_release();
}

uint64_t sub_213494350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[11] = a7;
  v8[12] = a8;
  v8[9] = a5;
  v8[10] = a6;
  v8[7] = a1;
  v8[8] = a4;
  v9 = sub_21349B594();
  v8[13] = v9;
  v8[14] = *(_QWORD *)(v9 - 8);
  v8[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2134943B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_254B9CC10 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 120);
  v13 = *(_QWORD *)(v0 + 112);
  v14 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 88);
  v4 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  v11 = *(_QWORD *)(v0 + 96);
  v12 = *(uint64_t **)(v0 + 56);
  v6 = (id)qword_254B9E3A8;
  sub_21349B588();
  sub_21349B810();
  sub_21349B57C();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v4, v3);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 40));
  v7 = (_QWORD *)swift_task_alloc();
  v7[2] = v4;
  v7[3] = v3;
  v7[4] = v2;
  v7[5] = v11;
  type metadata accessor for App();
  v8 = sub_21349B6CC();
  swift_task_dealloc();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  v9 = sub_213488EB4(v8);
  swift_bridgeObjectRelease();
  sub_21349B804();
  sub_21349B57C();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v1, v14);
  *v12 = v9;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213494568(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v2 = result;
  v19 = a2;
  if ((result & 0xC000000000000001) != 0)
  {
    sub_21349B858();
    type metadata accessor for App();
    sub_2134981A8();
    result = sub_21349B780();
    v2 = v20;
    v17 = v21;
    v3 = v22;
    v4 = v23;
    v5 = v24;
  }
  else
  {
    v4 = 0;
    v6 = -1 << *(_BYTE *)(result + 32);
    v17 = result + 56;
    v3 = ~v6;
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v5 = v8 & *(_QWORD *)(result + 56);
  }
  v9 = (unint64_t)(v3 + 64) >> 6;
  if (v2 < 0)
    goto LABEL_10;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v4 << 6);
      v12 = v4;
      goto LABEL_29;
    }
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
      break;
    if (v14 >= v9)
      goto LABEL_32;
    v15 = *(_QWORD *)(v17 + 8 * v14);
    v12 = v4 + 1;
    if (!v15)
    {
      v12 = v4 + 2;
      if (v4 + 2 >= v9)
        goto LABEL_32;
      v15 = *(_QWORD *)(v17 + 8 * v12);
      if (!v15)
      {
        v12 = v4 + 3;
        if (v4 + 3 >= v9)
          goto LABEL_32;
        v15 = *(_QWORD *)(v17 + 8 * v12);
        if (!v15)
        {
          v12 = v4 + 4;
          if (v4 + 4 >= v9)
            goto LABEL_32;
          v15 = *(_QWORD *)(v17 + 8 * v12);
          if (!v15)
          {
            v12 = v4 + 5;
            if (v4 + 5 >= v9)
              goto LABEL_32;
            v15 = *(_QWORD *)(v17 + 8 * v12);
            if (!v15)
            {
              v16 = v4 + 6;
              while (v9 != v16)
              {
                v15 = *(_QWORD *)(v17 + 8 * v16++);
                if (v15)
                {
                  v12 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_32:
              sub_21348911C();
              return v19;
            }
          }
        }
      }
    }
LABEL_28:
    v10 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v12 << 6);
LABEL_29:
    v13 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v11);
    swift_retain();
    if (!v13)
      goto LABEL_32;
    while (1)
    {
      sub_213497224(&v18, v13);
      result = swift_release();
      v4 = v12;
      v5 = v10;
      if ((v2 & 0x8000000000000000) == 0)
        break;
LABEL_10:
      if (sub_21349B87C())
      {
        type metadata accessor for App();
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v13 = v18;
        swift_unknownObjectRelease();
        v12 = v4;
        v10 = v5;
        if (v13)
          continue;
      }
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_2134947E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X3>, _QWORD *a3@<X4>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t result;
  uint64_t *v58;
  os_log_type_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  os_log_type_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  _QWORD v80[2];
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91[3];
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v5 = v4;
  v86 = a3;
  v88 = a4;
  v8 = sub_21349B5AC();
  v87 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v80 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v12 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v11);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
  if (!v14)
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
    sub_21348CD5C((uint64_t)a1, (uint64_t)v91);
    v27 = sub_21349B5A0();
    v28 = sub_21349B7A4();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v94 = v30;
      *(_DWORD *)v29 = 136315138;
      sub_21348CD5C((uint64_t)v91, (uint64_t)&v89);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1F0);
      v31 = sub_21349B69C();
      v89 = sub_213487AF0(v31, v32, &v94);
      sub_21349B828();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v91);
      _os_log_impl(&dword_213483000, v27, v28, "Error enumerating plugins, no pluginIdentifier on proxy object: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v30, -1, -1);
      v33 = (uint64_t)v29;
LABEL_45:
      MEMORY[0x2199B4300](v33, -1, -1);
LABEL_48:

      v58 = v88;
      result = 0;
      goto LABEL_49;
    }
LABEL_47:
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v91);
    goto LABEL_48;
  }
  v15 = v14;
  v83 = v13;
  v16 = a1[3];
  v17 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v16);
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(v16, v17);
  v84 = a2;
  v85 = v18;
  v20 = v19;
  if (!v19)
  {
    v81 = 0;
    if (qword_254B9CC08 != -1)
      swift_once();
    __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
    swift_bridgeObjectRetain_n();
    v21 = sub_21349B5A0();
    v22 = sub_21349B78C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      v82 = v4;
      v25 = v24;
      v91[0] = v24;
      *(_DWORD *)v23 = 136315138;
      v80[1] = v23 + 4;
      swift_bridgeObjectRetain();
      v89 = sub_213487AF0(v83, v15, v91);
      sub_21349B828();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213483000, v21, v22, "Plugin %s has no containing bundle or bundleId.", v23, 0xCu);
      swift_arrayDestroy();
      v26 = v25;
      v5 = v82;
      MEMORY[0x2199B4300](v26, -1, -1);
      MEMORY[0x2199B4300](v23, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v20 = v81;
  }
  v34 = a1[3];
  v35 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v34);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v35 + 40))(v34, v35) & 1) == 0)
  {
    v46 = a1[3];
    v47 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v46);
    v48 = (*(uint64_t (**)(uint64_t, uint64_t))(v47 + 32))(v46, v47);
    if ((v49 & 1) == 0 && v84 && (sub_2134932BC(v48, v84) & 1) == 0)
    {
      swift_bridgeObjectRelease();
      if (qword_254B9CC08 != -1)
        swift_once();
      __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
      sub_21348CD5C((uint64_t)a1, (uint64_t)v91);
      swift_bridgeObjectRetain();
      v27 = sub_21349B5A0();
      v59 = sub_21349B798();
      if (os_log_type_enabled(v27, v59))
      {
        v60 = swift_slowAlloc();
        v61 = swift_slowAlloc();
        v94 = v61;
        *(_DWORD *)v60 = 136315394;
        v89 = v85;
        v90 = v20;
        swift_bridgeObjectRetain();
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1F8);
        v62 = sub_21349B69C();
        v89 = sub_213487AF0(v62, v63, &v94);
        sub_21349B828();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v60 + 12) = 2080;
        v64 = v92;
        v65 = v93;
        __swift_project_boxed_opaque_existential_1(v91, v92);
        v89 = (*(uint64_t (**)(uint64_t, uint64_t))(v65 + 32))(v64, v65);
        LOBYTE(v90) = v66 & 1;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D200);
        v67 = sub_21349B69C();
        v89 = sub_213487AF0(v67, v68, &v94);
        sub_21349B828();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v91);
        _os_log_impl(&dword_213483000, v27, v59, "Siri authorization status restriction is set and %s does not qualify due to status: %s", (uint8_t *)v60, 0x16u);
        swift_arrayDestroy();
        v69 = v61;
LABEL_44:
        MEMORY[0x2199B4300](v69, -1, -1);
        v33 = v60;
        goto LABEL_45;
      }
      goto LABEL_46;
    }
    v50 = a1[3];
    v51 = a1[4];
    __swift_project_boxed_opaque_existential_1(a1, v50);
    v52 = *(uint64_t (**)(uint64_t, uint64_t))(v51 + 24);
    v53 = v86;
    swift_bridgeObjectRetain();
    v54 = v52(v50, v51);
    if (v53)
    {
      if (!v55)
      {
        swift_bridgeObjectRelease();
        goto LABEL_40;
      }
      v56 = sub_213493320(v54, v55, v53);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v56 & 1) == 0)
      {
LABEL_40:
        swift_bridgeObjectRelease();
        if (qword_254B9CC08 != -1)
          swift_once();
        __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
        sub_21348CD5C((uint64_t)a1, (uint64_t)v91);
        swift_bridgeObjectRetain();
        v27 = sub_21349B5A0();
        v70 = sub_21349B78C();
        if (os_log_type_enabled(v27, v70))
        {
          v60 = swift_slowAlloc();
          v71 = swift_slowAlloc();
          v82 = v5;
          v72 = v71;
          v94 = v71;
          *(_DWORD *)v60 = 136315394;
          v89 = v85;
          v90 = v20;
          swift_bridgeObjectRetain();
          __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1F8);
          v73 = sub_21349B69C();
          v89 = sub_213487AF0(v73, v74, &v94);
          sub_21349B828();
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v60 + 12) = 2080;
          v75 = v92;
          v76 = v93;
          __swift_project_boxed_opaque_existential_1(v91, v92);
          v89 = (*(uint64_t (**)(uint64_t, uint64_t))(v76 + 24))(v75, v76);
          v90 = v77;
          v78 = sub_21349B69C();
          v89 = sub_213487AF0(v78, v79, &v94);
          sub_21349B828();
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v91);
          _os_log_impl(&dword_213483000, v27, v70, "Extension point identifier restriction is set and %s does not qualify due to identifier %s", (uint8_t *)v60, 0x16u);
          swift_arrayDestroy();
          v69 = v72;
          goto LABEL_44;
        }
LABEL_46:
        swift_bridgeObjectRelease_n();
        goto LABEL_47;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    type metadata accessor for App();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v85;
    *(_QWORD *)(result + 24) = v20;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_QWORD *)(result + 32) = v83;
    *(_QWORD *)(result + 40) = v15;
    v58 = v88;
    goto LABEL_49;
  }
  swift_bridgeObjectRelease();
  if (qword_254B9CC08 != -1)
    swift_once();
  v36 = __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
  v37 = v87;
  (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v10, v36, v8);
  swift_bridgeObjectRetain();
  v38 = sub_21349B5A0();
  v39 = sub_21349B78C();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = swift_slowAlloc();
    v86 = (_QWORD *)v8;
    v41 = (uint8_t *)v40;
    v42 = swift_slowAlloc();
    v82 = v5;
    v43 = v42;
    v91[0] = v42;
    *(_DWORD *)v41 = 136315138;
    if (v20)
      v44 = v85;
    else
      v44 = 7104878;
    if (v20)
      v45 = v20;
    else
      v45 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v89 = sub_213487AF0(v44, v45, v91);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v38, v39, "Omitting hidden app %s from results", v41, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v43, -1, -1);
    MEMORY[0x2199B4300](v41, -1, -1);

    (*(void (**)(char *, _QWORD *))(v87 + 8))(v10, v86);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v8);
  }
  result = 0;
  v58 = v88;
LABEL_49:
  *v58 = result;
  return result;
}

uint64_t sub_213495284(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17[4];

  (*(void (**)(uint64_t *__return_ptr))(v2 + 16))(v17);
  __swift_project_boxed_opaque_existential_1(v17, v17[3]);
  v5 = type metadata accessor for App();
  v6 = sub_21349B6CC();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v17);
  if (qword_254B9CC08 != -1)
    swift_once();
  v7 = sub_21349B5AC();
  __swift_project_value_buffer(v7, (uint64_t)qword_254B9E390);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v8 = sub_21349B5A0();
  v9 = sub_21349B78C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v17[0] = v11;
    *(_DWORD *)v10 = 136315394;
    swift_bridgeObjectRetain();
    sub_213487AF0(a1, a2, v17);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v10 + 12) = 2080;
    v12 = swift_bridgeObjectRetain();
    v13 = MEMORY[0x2199B3CA0](v12, v5);
    v15 = v14;
    swift_bridgeObjectRelease();
    sub_213487AF0(v13, v15, v17);
    sub_21349B828();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v8, v9, "searchApps(intentID: %s) returning %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v11, -1, -1);
    MEMORY[0x2199B4300](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  return v6;
}

uint64_t sub_213495504@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  _BYTE v28[40];
  _QWORD v29[5];
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = a1[3];
  v5 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v4);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5) & 1) != 0)
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v6 = sub_21349B5AC();
    __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
    sub_21348CD5C((uint64_t)a1, (uint64_t)v30);
    v7 = sub_21349B5A0();
    v8 = sub_21349B78C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v33 = v10;
      *(_DWORD *)v9 = 136315138;
      v11 = v31;
      v12 = v32;
      __swift_project_boxed_opaque_existential_1(v30, v31);
      v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
      v15 = v14;
      sub_21348CD5C((uint64_t)v30, (uint64_t)v29);
      if (!v15)
      {
        sub_21348CD5C((uint64_t)v29, (uint64_t)v28);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1E8);
        v13 = sub_21349B69C();
        v15 = v16;
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
      v29[0] = sub_213487AF0(v13, v15, &v33);
      sub_21349B828();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);
      _os_log_impl(&dword_213483000, v7, v8, "Omitting hidden app  %s from results", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v10, -1, -1);
      MEMORY[0x2199B4300](v9, -1, -1);

    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v30);

    }
LABEL_16:
    result = 0;
    goto LABEL_17;
  }
  v17 = a1[3];
  v18 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v17);
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 8))(v17, v18);
  if (!v20)
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v24 = sub_21349B5AC();
    __swift_project_value_buffer(v24, (uint64_t)qword_254B9E390);
    v25 = sub_21349B5A0();
    v26 = sub_21349B78C();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213483000, v25, v26, "AppRecord does not contain bundleIdentifier", v27, 2u);
      MEMORY[0x2199B4300](v27, -1, -1);
    }

    goto LABEL_16;
  }
  v21 = v19;
  v22 = v20;
  type metadata accessor for App();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = v21;
  *(_QWORD *)(result + 24) = v22;
  *(_OWORD *)(result + 32) = 0u;
  *(_OWORD *)(result + 48) = 0u;
  *(_OWORD *)(result + 64) = 0u;
LABEL_17:
  *a2 = result;
  return result;
}

uint64_t sub_21349584C(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  _QWORD *v6;

  v5 = objc_msgSend(a1, sel_supportedIntents);
  v6 = (_QWORD *)sub_21349B6FC();

  LOBYTE(a3) = sub_213493320(a2, a3, v6);
  swift_bridgeObjectRelease();
  return a3 & 1;
}

uint64_t sub_2134958C0(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  LOBYTE(v3) = v3();
  swift_release();

  return v3 & 1;
}

double sub_213495910@<D0>(uint64_t a1@<X8>)
{
  id *v1;
  id v3;
  id v4;
  double result;

  v3 = objc_msgSend(*v1, sel_nextObject);
  if (v3)
  {
    v4 = v3;
    *(_QWORD *)(a1 + 24) = sub_21348C174(0, &qword_254B9D238);
    *(_QWORD *)(a1 + 32) = &off_24CFD57D8;
    *(_QWORD *)a1 = v4;
  }
  else
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_213495984@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t result;
  _QWORD v9[6];

  v4 = *v1;
  v3 = v1[1];
  v5 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 0);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v6 + 24) = v3;
  v9[4] = sub_213498E3C;
  v9[5] = v6;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = sub_2134958C0;
  v9[3] = &block_descriptor_37;
  v7 = _Block_copy(v9);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_setFilter_, v7);
  _Block_release(v7);
  result = swift_bridgeObjectRelease();
  *a1 = v5;
  return result;
}

uint64_t sub_213495A7C()
{
  return 2;
}

uint64_t sub_213495A84()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_2134983AC(*v0, v0[1]);
  v2 = v1;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_213495AB8(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;

  return sub_213495AC0(a1, a2, a3, *v3, v3[1]);
}

uint64_t sub_213495AC0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t result;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  _UNKNOWN **v20;
  __int128 aBlock;
  uint64_t (*v22)(uint64_t, void *);
  void *v23;
  uint64_t (*v24)(void *);
  uint64_t v25;

  v10 = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithOptions_, 0);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a4;
  *(_QWORD *)(v11 + 24) = a5;
  v24 = sub_213498DE4;
  v25 = v11;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v22 = sub_2134958C0;
  v23 = &block_descriptor_23;
  v12 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v10, sel_setFilter_, v12);
  _Block_release(v12);
  result = swift_bridgeObjectRelease();
  v14 = 0;
  if (!a2 || !a3)
  {
LABEL_11:
    *a1 = v10;
    return v14;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    v15 = objc_msgSend(v10, sel_nextObject);
    if (v15)
    {
      v16 = v15;
      v17 = sub_21348C174(0, &qword_254B9D238);
      v14 = 0;
      while (1)
      {
        v19 = v17;
        v20 = &off_24CFD57D8;
        *(_QWORD *)&v18 = v16;
        sub_21348EDDC(&v18, (uint64_t)&aBlock);
        sub_21348EDDC(&aBlock, a2);
        if (a3 - 1 == v14)
          break;
        a2 += 40;
        v16 = objc_msgSend(v10, sel_nextObject);
        ++v14;
        if (!v16)
          goto LABEL_11;
      }
      v14 = a3;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_11;
  }
  __break(1u);
  return result;
}

uint64_t sub_213495C94()
{
  return sub_21349B6D8();
}

uint64_t sub_213495CB4(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22[8];

  v6 = sub_21349B5AC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_beginAccess();
    v10 = a1;
    MEMORY[0x2199B3C7C]();
    if (*(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(a3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                       + 0x18) >> 1)
      sub_21349B720();
    sub_21349B72C();
    sub_21349B714();
    return swift_endAccess();
  }
  else
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v12 = __swift_project_value_buffer(v6, (uint64_t)qword_254B9E390);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
    v13 = a2;
    v14 = a2;
    v15 = sub_21349B5A0();
    v16 = sub_21349B7A4();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v22[0] = v18;
      *(_DWORD *)v17 = 136315138;
      if (a2)
      {
        swift_getErrorValue();
        v19 = sub_21349B9CC();
        v21 = v20;
      }
      else
      {
        v21 = 0xEA00000000003E72;
        v19 = 0x6F727265206F6E3CLL;
      }
      v22[7] = sub_213487AF0(v19, v21, v22);
      sub_21349B828();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213483000, v15, v16, "Error enumerating plugins: %s", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v18, -1, -1);
      MEMORY[0x2199B4300](v17, -1, -1);
    }
    else
    {

    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_213495F60(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_213495FD4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void **v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_21349B960();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v17 = MEMORY[0x24BEE4AF8];
  result = sub_2134981F0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = MEMORY[0x2199B3E74](v5, a1);
        v17 = v3;
        v8 = *(_QWORD *)(v3 + 16);
        v7 = *(_QWORD *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_2134981F0(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = sub_21348C174(0, &qword_254B9D218);
        v16 = &off_24CFD57F8;
        *(_QWORD *)&v14 = v6;
        *(_QWORD *)(v3 + 16) = v8 + 1;
        sub_21348EDDC(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (void **)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v12 = *(_QWORD *)(v3 + 16);
        v11 = *(_QWORD *)(v3 + 24);
        v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_2134981F0(v11 > 1, v12 + 1, 1);
          v3 = v17;
        }
        v15 = sub_21348C174(0, &qword_254B9D218);
        v16 = &off_24CFD57F8;
        *(_QWORD *)&v14 = v13;
        *(_QWORD *)(v3 + 16) = v12 + 1;
        sub_21348EDDC(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t AppSupportService.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t AppSupportService.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t AppSupportQuery.intentID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AppSupportQuery.intentID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*AppSupportQuery.intentID.modify())()
{
  return nullsub_1;
}

uint64_t AppSupportQuery.allowedSiriAuthorizationStatus.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 16);
  return swift_bridgeObjectRetain();
}

uint64_t AppSupportQuery.allowedSiriAuthorizationStatus.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  return result;
}

uint64_t (*AppSupportQuery.allowedSiriAuthorizationStatus.modify())()
{
  return nullsub_1;
}

uint64_t AppSupportQuery.allowedExtensionPointIdentifiers.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t AppSupportQuery.allowedExtensionPointIdentifiers.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 24) = v2;
  return result;
}

uint64_t (*AppSupportQuery.allowedExtensionPointIdentifiers.modify())()
{
  return nullsub_1;
}

id sub_213496324()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;

  v1 = objc_msgSend(v0, sel_bundleIdentifier);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_applicationWithBundleIdentifier_, v1);

    v4 = objc_msgSend(v3, sel_isHidden);
  }
  else
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v5 = sub_21349B5AC();
    __swift_project_value_buffer(v5, (uint64_t)qword_254B9E390);
    v6 = v0;
    v7 = sub_21349B5A0();
    v8 = sub_21349B78C();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v9 = 138412290;
      v11 = v6;
      sub_21349B828();
      *v10 = v6;

      _os_log_impl(&dword_213483000, v7, v8, "No app bundle id found for %@. Hidden app check is not applicable.", v9, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CE48);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v10, -1, -1);
      MEMORY[0x2199B4300](v9, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v4;
}

uint64_t sub_213496524()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_bundleIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21349B690();

  return v3;
}

unint64_t sub_213496588()
{
  return (unint64_t)sub_213496324() & 1;
}

id sub_2134965AC()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;

  v1 = objc_msgSend(v0, sel_containingBundle);
  if (v1
    && (v2 = v1, v3 = objc_msgSend(v1, sel_bundleIdentifier), v2, v3))
  {
    sub_21349B690();

    v4 = (void *)objc_opt_self();
    v5 = (void *)sub_21349B684();
    swift_bridgeObjectRelease();
    v6 = objc_msgSend(v4, sel_applicationWithBundleIdentifier_, v5);

    v7 = objc_msgSend(v6, sel_isHidden);
  }
  else
  {
    if (qword_254B9CC08 != -1)
      swift_once();
    v8 = sub_21349B5AC();
    __swift_project_value_buffer(v8, (uint64_t)qword_254B9E390);
    v9 = v0;
    v10 = sub_21349B5A0();
    v11 = sub_21349B78C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v12 = 138412290;
      v14 = v9;
      sub_21349B828();
      *v13 = v9;

      _os_log_impl(&dword_213483000, v10, v11, "No container app bundle id found for plugin proxy %@. Hidden app check is not applicable.", v12, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CE48);
      swift_arrayDestroy();
      MEMORY[0x2199B4300](v13, -1, -1);
      MEMORY[0x2199B4300](v12, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v7;
}

id sub_213496800()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  void *v4;
  void *v5;

  v1 = objc_msgSend(v0, sel_containingBundle);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_bundleIdentifier);

    if (v3)
    {
      sub_21349B690();

      v4 = (void *)objc_opt_self();
      v5 = (void *)sub_21349B684();
      swift_bridgeObjectRelease();
      v2 = objc_msgSend(v4, sel__siriAuthorizationStatusForAppID_, v5);

    }
    else
    {
      return 0;
    }
  }
  return v2;
}

uint64_t sub_2134968D0()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_pluginIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21349B690();

  return v3;
}

uint64_t sub_213496934(uint64_t a1, uint64_t a2)
{
  return sub_21349695C(a1, a2, (SEL *)&selRef_containingBundle, (SEL *)&selRef_bundleIdentifier);
}

uint64_t sub_213496948(uint64_t a1, uint64_t a2)
{
  return sub_21349695C(a1, a2, (SEL *)&selRef_extensionPoint, (SEL *)&selRef_identifier);
}

uint64_t sub_21349695C(uint64_t a1, uint64_t a2, SEL *a3, SEL *a4)
{
  id *v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;

  v6 = objc_msgSend(*v4, *a3);
  v7 = v6;
  if (!v6)
    return 0;
  v8 = objc_msgSend(v6, *a4);

  if (!v8)
    return 0;
  v9 = sub_21349B690();

  return v9;
}

id sub_2134969EC()
{
  return sub_213496800();
}

unint64_t sub_213496A10()
{
  return (unint64_t)sub_2134965AC() & 1;
}

uint64_t sub_213496A34(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_213498E0C;
  return sub_213493BAC(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t method lookup function for AppSupportService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AppSupportService.findApps(matching:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 96) + *(_QWORD *)(*(_QWORD *)v1 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213496B34;
  return v6(a1);
}

uint64_t sub_213496B34(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t destroy for AppSupportQuery()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for AppSupportQuery(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppSupportQuery(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for AppSupportQuery(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportQuery(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSupportQuery(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSupportQuery()
{
  return &type metadata for AppSupportQuery;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppSupportQuery.AllowedSiriAuthorizationStatuses(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AppSupportQuery.AllowedSiriAuthorizationStatuses()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for AppSupportQuery.AllowedSiriAuthorizationStatuses(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AppSupportQuery.AllowedSiriAuthorizationStatuses(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_213496E0C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_213496E24(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AppSupportQuery.AllowedSiriAuthorizationStatuses()
{
  return &type metadata for AppSupportQuery.AllowedSiriAuthorizationStatuses;
}

uint64_t _s17SiriAppResolution15AppSupportQueryV32AllowedSiriAuthorizationStatusesOwet_0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t _s17SiriAppResolution15AppSupportQueryV32AllowedSiriAuthorizationStatusesOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSupportQuery.AllowedExtensionPointIdentifiers()
{
  return &type metadata for AppSupportQuery.AllowedExtensionPointIdentifiers;
}

uint64_t destroy for AppSupportService.DataSource()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for AppSupportService.DataSource(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AppSupportService.DataSource(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for AppSupportService.DataSource(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportService.DataSource(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppSupportService.DataSource(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppSupportService.DataSource()
{
  return &type metadata for AppSupportService.DataSource;
}

uint64_t sub_2134970B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_213498E0C;
  return sub_213494020(a1, v4, v5, v6, v7, v8);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213497190(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_2134890C4;
  return sub_213494350(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_213497224(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    swift_retain();
    v8 = sub_21349B870();
    swift_release();
    if (v8)
    {
      swift_bridgeObjectRelease();
      swift_release();
      type metadata accessor for App();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v24;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_21349B864();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v10 = sub_2134974F8(v7, result + 1);
    v25 = v10;
    if (*(_QWORD *)(v10 + 24) <= *(_QWORD *)(v10 + 16))
    {
      swift_retain();
      sub_213497734();
      v11 = v25;
    }
    else
    {
      v11 = v10;
      swift_retain();
    }
    sub_213497A58(a2, v11);
    *v3 = v11;
  }
  else
  {
    sub_21349BA08();
    if (*(_QWORD *)(a2 + 24))
    {
      sub_21349BA20();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_21349B6A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21349BA20();
      swift_bridgeObjectRetain();
    }
    v12 = sub_21349BA2C();
    v13 = -1 << *(_BYTE *)(v6 + 32);
    v14 = v12 & ~v13;
    if (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      v15 = ~v13;
      v16 = *(_QWORD *)(v6 + 48);
      v17 = *(_QWORD *)(a2 + 16);
      v18 = *(_QWORD *)(a2 + 24);
      do
      {
        v19 = *(_QWORD *)(v16 + 8 * v14);
        v20 = *(_QWORD *)(v19 + 24);
        if (v20)
        {
          if (v18)
          {
            v21 = *(_QWORD *)(v19 + 16) == v17 && v20 == v18;
            if (v21 || (sub_21349B9A8() & 1) != 0)
            {
LABEL_24:
              swift_release();
              swift_bridgeObjectRelease();
              *a1 = *(_QWORD *)(*(_QWORD *)(*v3 + 48) + 8 * v14);
              swift_retain();
              return 0;
            }
          }
        }
        else if (!v18)
        {
          goto LABEL_24;
        }
        v14 = (v14 + 1) & v15;
      }
      while (((*(_QWORD *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v26 = *v3;
    *v3 = 0x8000000000000000;
    v23 = swift_retain();
    sub_213497B3C(v23, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v26;
  }
  swift_bridgeObjectRelease();
  *a1 = a2;
  return 1;
}

uint64_t sub_2134974F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1D0);
    v2 = sub_21349B8AC();
    v14 = v2;
    sub_21349B858();
    if (sub_21349B87C())
    {
      type metadata accessor for App();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_213497734();
          v2 = v14;
        }
        sub_21349BA08();
        if (*(_QWORD *)(v13 + 24))
        {
          sub_21349BA20();
          swift_bridgeObjectRetain();
          sub_21349B6A8();
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_21349BA20();
        }
        result = sub_21349BA2C();
        v5 = v2 + 56;
        v6 = -1 << *(_BYTE *)(v2 + 32);
        v7 = result & ~v6;
        v8 = v7 >> 6;
        if (((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6))) != 0)
        {
          v3 = __clz(__rbit64((-1 << v7) & ~*(_QWORD *)(v2 + 56 + 8 * (v7 >> 6)))) | v7 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v6) >> 6;
          do
          {
            if (++v8 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v8 == v10;
            if (v8 == v10)
              v8 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v5 + 8 * v8);
          }
          while (v12 == -1);
          v3 = __clz(__rbit64(~v12)) + (v8 << 6);
        }
        *(_QWORD *)(v5 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v3;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v3) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_21349B87C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_213497734()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  _QWORD *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1D0);
  v3 = sub_21349B8A0();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v27 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v26 = (unint64_t)(v5 + 63) >> 6;
    v8 = v3 + 56;
    result = swift_retain();
    v10 = 0;
    while (1)
    {
      if (v7)
      {
        v12 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v13 = v12 | (v10 << 6);
      }
      else
      {
        v14 = v10 + 1;
        if (__OFADD__(v10, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v14 >= v26)
          goto LABEL_36;
        v15 = v27[v14];
        ++v10;
        if (!v15)
        {
          v10 = v14 + 1;
          if (v14 + 1 >= v26)
            goto LABEL_36;
          v15 = v27[v10];
          if (!v15)
          {
            v10 = v14 + 2;
            if (v14 + 2 >= v26)
              goto LABEL_36;
            v15 = v27[v10];
            if (!v15)
            {
              v16 = v14 + 3;
              if (v16 >= v26)
              {
LABEL_36:
                swift_release();
                v1 = v0;
                v25 = 1 << *(_BYTE *)(v2 + 32);
                if (v25 > 63)
                  bzero(v27, ((unint64_t)(v25 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v27 = -1 << v25;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v15 = v27[v16];
              if (!v15)
              {
                while (1)
                {
                  v10 = v16 + 1;
                  if (__OFADD__(v16, 1))
                    goto LABEL_42;
                  if (v10 >= v26)
                    goto LABEL_36;
                  v15 = v27[v10];
                  ++v16;
                  if (v15)
                    goto LABEL_23;
                }
              }
              v10 = v16;
            }
          }
        }
LABEL_23:
        v7 = (v15 - 1) & v15;
        v13 = __clz(__rbit64(v15)) + (v10 << 6);
      }
      v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
      sub_21349BA08();
      if (*(_QWORD *)(v17 + 24))
      {
        sub_21349BA20();
        swift_bridgeObjectRetain();
        sub_21349B6A8();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_21349BA20();
      }
      result = sub_21349BA2C();
      v18 = -1 << *(_BYTE *)(v4 + 32);
      v19 = result & ~v18;
      v20 = v19 >> 6;
      if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
      {
        v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v21 = 0;
        v22 = (unint64_t)(63 - v18) >> 6;
        do
        {
          if (++v20 == v22 && (v21 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v23 = v20 == v22;
          if (v20 == v22)
            v20 = 0;
          v21 |= v23;
          v24 = *(_QWORD *)(v8 + 8 * v20);
        }
        while (v24 == -1);
        v11 = __clz(__rbit64(~v24)) + (v20 << 6);
      }
      *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_213497A58(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_21349BA08();
  if (*(_QWORD *)(a1 + 24))
  {
    sub_21349BA20();
    swift_bridgeObjectRetain();
    sub_21349B6A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21349BA20();
  }
  sub_21349BA2C();
  result = sub_21349B84C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_213497B3C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_23;
  if ((a3 & 1) != 0)
  {
    sub_213497734();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_213497D04();
      goto LABEL_23;
    }
    sub_213497EAC();
  }
  v8 = *v3;
  sub_21349BA08();
  if (*(_QWORD *)(v5 + 24))
  {
    sub_21349BA20();
    swift_bridgeObjectRetain();
    sub_21349B6A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21349BA20();
  }
  result = sub_21349BA2C();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  v10 = v8 + 56;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v9;
    result = type metadata accessor for App();
    v12 = *(_QWORD *)(v8 + 48);
    v13 = *(_QWORD *)(v5 + 16);
    v14 = *(_QWORD *)(v5 + 24);
    do
    {
      v15 = *(_QWORD *)(v12 + 8 * a2);
      v16 = *(_QWORD *)(v15 + 24);
      if (v16)
      {
        if (v14)
        {
          v17 = *(_QWORD *)(v15 + 16) == v13 && v16 == v14;
          if (v17 || (result = sub_21349B9A8(), (result & 1) != 0))
          {
LABEL_22:
            result = sub_21349B9B4();
            __break(1u);
            break;
          }
        }
      }
      else if (!v14)
      {
        goto LABEL_22;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(_QWORD *)(v10 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_23:
  v18 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v18 + 48) + 8 * a2) = v5;
  v19 = *(_QWORD *)(v18 + 16);
  v20 = __OFADD__(v19, 1);
  v21 = v19 + 1;
  if (v20)
    __break(1u);
  else
    *(_QWORD *)(v18 + 16) = v21;
  return result;
}

void *sub_213497D04()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1D0);
  v2 = *v0;
  v3 = sub_21349B894();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = (void *)swift_retain();
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_213497EAC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  int64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1D0);
  v3 = sub_21349B8A0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_38:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v25 = v2 + 56;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(v2 + 56);
  v26 = (unint64_t)(v5 + 63) >> 6;
  v8 = v3 + 56;
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v10 << 6);
      goto LABEL_24;
    }
    v14 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v14 >= v26)
      goto LABEL_36;
    v15 = *(_QWORD *)(v25 + 8 * v14);
    ++v10;
    if (!v15)
    {
      v10 = v14 + 1;
      if (v14 + 1 >= v26)
        goto LABEL_36;
      v15 = *(_QWORD *)(v25 + 8 * v10);
      if (!v15)
      {
        v10 = v14 + 2;
        if (v14 + 2 >= v26)
          goto LABEL_36;
        v15 = *(_QWORD *)(v25 + 8 * v10);
        if (!v15)
          break;
      }
    }
LABEL_23:
    v7 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v10 << 6);
LABEL_24:
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v13);
    sub_21349BA08();
    if (*(_QWORD *)(v17 + 24))
    {
      sub_21349BA20();
      swift_retain();
      swift_bridgeObjectRetain();
      sub_21349B6A8();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_21349BA20();
      swift_retain();
    }
    result = sub_21349BA2C();
    v18 = -1 << *(_BYTE *)(v4 + 32);
    v19 = result & ~v18;
    v20 = v19 >> 6;
    if (((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v19) & ~*(_QWORD *)(v8 + 8 * (v19 >> 6)))) | v19 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v21 = 0;
      v22 = (unint64_t)(63 - v18) >> 6;
      do
      {
        if (++v20 == v22 && (v21 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v23 = v20 == v22;
        if (v20 == v22)
          v20 = 0;
        v21 |= v23;
        v24 = *(_QWORD *)(v8 + 8 * v20);
      }
      while (v24 == -1);
      v11 = __clz(__rbit64(~v24)) + (v20 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v11) = v17;
    ++*(_QWORD *)(v4 + 16);
  }
  v16 = v14 + 3;
  if (v16 >= v26)
  {
LABEL_36:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_38;
  }
  v15 = *(_QWORD *)(v25 + 8 * v16);
  if (v15)
  {
    v10 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v10 >= v26)
      goto LABEL_36;
    v15 = *(_QWORD *)(v25 + 8 * v10);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_40:
  __break(1u);
  return result;
}

unint64_t sub_2134981A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B9CCF8;
  if (!qword_254B9CCF8)
  {
    v1 = type metadata accessor for App();
    result = MEMORY[0x2199B4270](&protocol conformance descriptor for App, v1);
    atomic_store(result, (unint64_t *)&qword_254B9CCF8);
  }
  return result;
}

uint64_t sub_2134981F0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21349820C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21349820C(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D220);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D1F0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21349B990();
  __break(1u);
  return result;
}

void sub_2134983AC(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  _UNKNOWN **v28;
  __int128 aBlock;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  uint64_t (*v32)();
  uint64_t v33;

  v4 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v5 = objc_msgSend(v4, sel_enumeratorWithOptions_, 0);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v32 = sub_213498E3C;
  v33 = v6;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v30 = sub_2134958C0;
  v31 = &block_descriptor_30;
  v7 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  objc_msgSend(v5, sel_setFilter_, v7);
  _Block_release(v7);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_nextObject);
  v9 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (v8)
  {
    v10 = v8;
    v11 = sub_21348C174(0, &qword_254B9D238);
    v12 = 0;
    v13 = (uint64_t)(v9 + 4);
    while (1)
    {
      v27 = v11;
      v28 = &off_24CFD57D8;
      *(_QWORD *)&v26 = v10;
      sub_21348EDDC(&v26, (uint64_t)&aBlock);
      if (!v12)
      {
        v14 = v9[3];
        if ((uint64_t)((v14 >> 1) + 0x4000000000000000) < 0)
          goto LABEL_26;
        v15 = v14 & 0xFFFFFFFFFFFFFFFELL;
        if (v15 <= 1)
          v16 = 1;
        else
          v16 = v15;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D240);
        v17 = (_QWORD *)swift_allocObject();
        v18 = (uint64_t)(_swift_stdlib_malloc_size(v17) - 32) / 40;
        v17[2] = v16;
        v17[3] = 2 * v18;
        v19 = (unint64_t)(v17 + 4);
        v20 = v9[3] >> 1;
        if (v9[2])
        {
          if (v17 != v9 || v19 >= (unint64_t)&v9[5 * v20 + 4])
            memmove(v17 + 4, v9 + 4, 40 * v20);
          v9[2] = 0;
        }
        v13 = v19 + 40 * v20;
        v12 = (v18 & 0x7FFFFFFFFFFFFFFFLL) - v20;
        swift_release();
        v9 = v17;
      }
      v22 = __OFSUB__(v12--, 1);
      if (v22)
        break;
      sub_21348EDDC(&aBlock, v13);
      v13 += 40;
      v10 = objc_msgSend(v5, sel_nextObject);
      if (!v10)
        goto LABEL_21;
    }
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v12 = 0;
LABEL_21:

  v23 = v9[3];
  if (v23 >= 2)
  {
    v24 = v23 >> 1;
    v22 = __OFSUB__(v24, v12);
    v25 = v24 - v12;
    if (v22)
    {
LABEL_27:
      __break(1u);
      return;
    }
    v9[2] = v25;
  }
}

uint64_t sub_213498654(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 24) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 32) = v3;
  *v3 = v2;
  v3[1] = sub_2134986BC;
  return v5(v2 + 16);
}

uint64_t sub_2134986BC()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_QWORD **)(*v0 + 24);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_QWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_21349870C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CCA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213498754()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213498778(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2134890C4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254B9D1D8 + dword_254B9D1D8))(a1, v4);
}

uint64_t sub_2134987E8(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t aBlock[21];

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21349C180;
  *(_QWORD *)(inited + 32) = sub_21349B690();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  swift_bridgeObjectRetain();
  aBlock[19] = sub_2134901D4(inited);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = MEMORY[0x24BEE4AF8];
  if (qword_254B9CC08 != -1)
    swift_once();
  v7 = sub_21349B5AC();
  __swift_project_value_buffer(v7, (uint64_t)qword_254B9E390);
  v8 = sub_21349B5A0();
  v9 = sub_21349B78C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)v10 = 136315138;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v12 = sub_21349B678();
    v14 = v13;
    swift_bridgeObjectRelease();
    aBlock[6] = sub_213487AF0(v12, v14, aBlock);
    sub_21349B828();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_213483000, v8, v9, "Enumerating plugins matching query: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v11, -1, -1);
    MEMORY[0x2199B4300](v10, -1, -1);
  }

  v15 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v15)
  {
    v16 = v15;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v17 = (void *)sub_21349B660();
    swift_bridgeObjectRelease();
    aBlock[4] = (uint64_t)sub_213498BD8;
    aBlock[5] = v6;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_213495F60;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    v18 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v16, sel_enumeratePluginsMatchingQuery_withBlock_, v17, v18);
    _Block_release(v18);

  }
  swift_beginAccess();
  v19 = swift_bridgeObjectRetain();
  v20 = sub_213495FD4(v19);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v20;
}

uint64_t sub_213498B74(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199B4270](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_213498BB4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213498BD8(void *a1, void *a2)
{
  uint64_t v2;

  return sub_213495CB4(a1, a2, v2);
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

unint64_t sub_213498BF8()
{
  unint64_t result;

  result = qword_254B9D228;
  if (!qword_254B9D228)
  {
    result = MEMORY[0x2199B4270](&unk_21349CAB4, &type metadata for AppSupportService.SystemAppRecordData);
    atomic_store(result, (unint64_t *)&qword_254B9D228);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppSupportService.SystemAppRecordData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AppSupportService.SystemAppRecordData(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for AppSupportService.SystemAppRecordData(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AppSupportService.SystemAppRecordData(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AppSupportService.SystemAppRecordData(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AppSupportService.SystemAppRecordData()
{
  return &type metadata for AppSupportService.SystemAppRecordData;
}

unint64_t sub_213498D7C()
{
  unint64_t result;

  result = qword_254B9D230;
  if (!qword_254B9D230)
  {
    result = MEMORY[0x2199B4270](&unk_21349CB1C, &type metadata for AppSupportService.SystemAppRecordData.Iterator);
    atomic_store(result, (unint64_t *)&qword_254B9D230);
  }
  return result;
}

uint64_t sub_213498DC0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213498DE4(void *a1)
{
  uint64_t v1;

  return sub_21349584C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

ValueMetadata *type metadata accessor for AppSupportService.SystemAppRecordData.Iterator()
{
  return &type metadata for AppSupportService.SystemAppRecordData.Iterator;
}

unint64_t sub_213498E44(unint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = result;
  if (!(result >> 62))
  {
    v2 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v2)
      return v2;
    if (v2 == 1)
      goto LABEL_4;
LABEL_10:
    swift_bridgeObjectRetain();
    return v1;
  }
  swift_bridgeObjectRetain();
  v3 = sub_21349B960();
  swift_bridgeObjectRelease();
  if (!v3)
    return 0;
  swift_bridgeObjectRetain();
  v4 = sub_21349B960();
  result = swift_bridgeObjectRelease();
  if (v4 != 1)
    goto LABEL_10;
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v2 = MEMORY[0x2199B3E74](0, v1);
    swift_bridgeObjectRelease();
    return v2;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v2 = *(_QWORD *)(v1 + 32);
    swift_retain();
    return v2;
  }
  __break(1u);
  return result;
}

uint64_t DefaultAppSelector.__allocating_init(defaultAppBundles:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  DefaultAppSelector.init(defaultAppBundles:)(a1);
  return v2;
}

uint64_t DefaultAppSelector.init(defaultAppBundles:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  unint64_t v12;

  v2 = v1;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v12 = MEMORY[0x24BEE4AF8];
    sub_21349B918();
    type metadata accessor for App();
    v5 = (uint64_t *)(a1 + 40);
    do
    {
      v7 = *(v5 - 1);
      v6 = *v5;
      v8 = swift_allocObject();
      *(_QWORD *)(v8 + 16) = v7;
      *(_QWORD *)(v8 + 24) = v6;
      *(_OWORD *)(v8 + 32) = 0u;
      *(_OWORD *)(v8 + 48) = 0u;
      *(_OWORD *)(v8 + 64) = 0u;
      swift_bridgeObjectRetain();
      sub_21349B900();
      sub_21349B924();
      sub_21349B930();
      sub_21349B90C();
      v5 += 2;
      --v4;
    }
    while (v4);
    v9 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  *(_QWORD *)(v2 + 16) = v9;
  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_21349B960();
    swift_bridgeObjectRelease();
    if (v11)
      return v2;
  }
  else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return v2;
  }
  if (qword_254B9CC10 != -1)
    swift_once();
  sub_21349B7A4();
  sub_21349B570();
  return v2;
}

uint64_t DefaultAppSelector.__allocating_init(defaultApps:)(unint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_21349B960();
    swift_bridgeObjectRelease();
    if (v4)
      return v2;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return v2;
  }
  if (qword_254B9CC10 != -1)
    swift_once();
  sub_21349B7A4();
  sub_21349B570();
  return v2;
}

uint64_t DefaultAppSelector.init(defaultApps:)(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  *(_QWORD *)(v1 + 16) = a1;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_21349B960();
    swift_bridgeObjectRelease();
    if (v3)
      return v1;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return v1;
  }
  if (qword_254B9CC10 != -1)
    swift_once();
  sub_21349B7A4();
  sub_21349B570();
  return v1;
}

uint64_t sub_2134992F0(uint64_t a1, unint64_t a2, void (*a3)(_QWORD **))
{
  return sub_2134999D4(a2, a3);
}

uint64_t DefaultAppSelector.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t DefaultAppSelector.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_213499340(uint64_t a1, unint64_t a2, void (*a3)(_QWORD **))
{
  return sub_2134999D4(a2, a3);
}

uint64_t sub_21349936C(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t i;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v13;

  v13 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_22:
    swift_bridgeObjectRetain();
    v4 = sub_21349B960();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      for (i = 4; ; ++i)
      {
        v6 = i - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v7 = (_QWORD *)MEMORY[0x2199B3E74](i - 4, a1);
          v8 = i - 3;
          if (__OFADD__(v6, 1))
            goto LABEL_21;
        }
        else
        {
          v7 = *(_QWORD **)(a1 + 8 * i);
          swift_retain();
          v8 = i - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_21:
            __break(1u);
            goto LABEL_22;
          }
        }
        if (v7[7])
          goto LABEL_12;
        v9 = v7[3];
        if (v9 && *(_QWORD *)(a2 + 16))
        {
          v10 = v7[2];
          swift_bridgeObjectRetain();
          sub_213491B7C(v10, v9);
          if ((v11 & 1) != 0)
          {
            swift_retain();
            swift_release();
            swift_bridgeObjectRelease();
LABEL_12:
            MEMORY[0x2199B3C7C]();
            if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_21349B720();
            sub_21349B72C();
            sub_21349B714();
            goto LABEL_5;
          }
          swift_release();
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_release();
        }
LABEL_5:
        if (v8 == v4)
        {
          swift_bridgeObjectRelease();
          return v13;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_213499554(unint64_t a1, uint64_t a2, void (*a3)(unint64_t *, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char isUniquelyReferenced_nonNull_native;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  __int16 v46;

  v3 = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v4 = sub_21349B960();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v40 = v3 & 0xC000000000000001;
      v5 = (_QWORD *)MEMORY[0x24BEE4B00];
      v6 = 4;
      v39 = v3;
      while (1)
      {
        v7 = v6 - 4;
        if (v40)
        {
          v8 = MEMORY[0x2199B3E74](v6 - 4, v3);
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
            goto LABEL_24;
        }
        else
        {
          v8 = *(_QWORD *)(v3 + 8 * v6);
          swift_retain();
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        v10 = *(_QWORD *)(v8 + 24);
        if (v10)
          break;
        swift_release();
LABEL_5:
        ++v6;
        if (v9 == v4)
          goto LABEL_29;
      }
      v3 = v4;
      v11 = *(_QWORD *)(v8 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v41 = v5;
      v14 = sub_213491B7C(v11, v10);
      v15 = v5[2];
      v16 = (v13 & 1) == 0;
      v17 = v15 + v16;
      if (__OFADD__(v15, v16))
        goto LABEL_25;
      v18 = v13;
      if (v5[3] < v17)
      {
        sub_213491EE8(v17, isUniquelyReferenced_nonNull_native);
        v19 = sub_213491B7C(v11, v10);
        if ((v18 & 1) != (v20 & 1))
        {
          swift_release();
          result = sub_21349B9C0();
          __break(1u);
          return result;
        }
        v14 = v19;
        v5 = v41;
        if ((v18 & 1) == 0)
          goto LABEL_21;
LABEL_19:
        v21 = v5[7];
        swift_release();
        *(_QWORD *)(v21 + 8 * v14) = v8;
LABEL_23:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v4 = v3;
        v3 = v39;
        goto LABEL_5;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v5 = v41;
        if ((v13 & 1) != 0)
          goto LABEL_19;
      }
      else
      {
        sub_213492784();
        v5 = v41;
        if ((v18 & 1) != 0)
          goto LABEL_19;
      }
LABEL_21:
      v5[(v14 >> 6) + 8] |= 1 << v14;
      v22 = (uint64_t *)(v5[6] + 16 * v14);
      *v22 = v11;
      v22[1] = v10;
      *(_QWORD *)(v5[7] + 8 * v14) = v8;
      v23 = v5[2];
      v24 = __OFADD__(v23, 1);
      v25 = v23 + 1;
      if (v24)
        goto LABEL_26;
      v5[2] = v25;
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
  }
  v5 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_29:
  swift_bridgeObjectRelease();
  v26 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  v27 = swift_bridgeObjectRetain();
  v28 = sub_21349936C(v27, (uint64_t)v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v29 = sub_213498E44(v28);
  v31 = v30;
  swift_bridgeObjectRelease();
  if (v31)
  {
    if (v31 == 1)
    {
      v44 = 0;
      v45 = v29;
      v46 = 1;
      v41 = (_QWORD *)v29;
      v42 = 0x2000000000000001;
      v43 = 0;
      swift_bridgeObjectRetain();
      sub_21349A220();
      a3(&v45, v32);
      sub_213493278(v29, 1);
      swift_bridgeObjectRelease();
      return sub_213493278(v29, 1);
    }
    else
    {
      if (qword_254B9CC10 != -1)
        swift_once();
      sub_21349B7A4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CEF0);
      v35 = swift_allocObject();
      *(_OWORD *)(v35 + 16) = xmmword_21349C180;
      *(_QWORD *)(v35 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0D8);
      *(_QWORD *)(v35 + 64) = sub_213499E10();
      *(_QWORD *)(v35 + 32) = v26;
      swift_bridgeObjectRetain();
      sub_21349B570();
      swift_bridgeObjectRelease();
      v41 = 0;
      LOWORD(v42) = 256;
      v36 = sub_2134901D4(MEMORY[0x24BEE4AF8]);
      a3((unint64_t *)&v41, v36);
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v44 = 0;
    v45 = v29;
    v46 = 2;
    v41 = (_QWORD *)v29;
    v42 = 0x2000000000000002;
    v43 = 0;
    swift_retain();
    sub_21349A220();
    a3(&v45, v34);
    swift_bridgeObjectRelease();
    sub_213493278(v29, 0);
    return sub_213493278(v29, 0);
  }
}

uint64_t sub_2134999D4(unint64_t a1, void (*a2)(_QWORD **))
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  char v30;
  uint64_t result;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  __int16 v38;

  v2 = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v3 = sub_21349B960();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3)
    {
LABEL_3:
      v36 = v2 & 0xC000000000000001;
      v4 = (_QWORD *)MEMORY[0x24BEE4B00];
      v5 = 4;
      v35 = v2;
      while (1)
      {
        v6 = v5 - 4;
        if (v36)
        {
          v7 = MEMORY[0x2199B3E74](v5 - 4, v2);
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
            goto LABEL_24;
        }
        else
        {
          v7 = *(_QWORD *)(v2 + 8 * v5);
          swift_retain();
          v8 = v5 - 3;
          if (__OFADD__(v6, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        v9 = *(_QWORD *)(v7 + 24);
        if (v9)
          break;
        swift_release();
LABEL_5:
        ++v5;
        if (v8 == v3)
          goto LABEL_29;
      }
      v2 = v3;
      v10 = *(_QWORD *)(v7 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v37 = v4;
      v13 = sub_213491B7C(v10, v9);
      v14 = v4[2];
      v15 = (v12 & 1) == 0;
      v16 = v14 + v15;
      if (__OFADD__(v14, v15))
        goto LABEL_25;
      v17 = v12;
      if (v4[3] < v16)
      {
        sub_213491EE8(v16, isUniquelyReferenced_nonNull_native);
        v18 = sub_213491B7C(v10, v9);
        if ((v17 & 1) != (v19 & 1))
        {
          result = sub_21349B9C0();
          __break(1u);
          return result;
        }
        v13 = v18;
        v4 = v37;
        if ((v17 & 1) == 0)
          goto LABEL_21;
LABEL_19:
        v20 = v4[7];
        swift_release();
        *(_QWORD *)(v20 + 8 * v13) = v7;
LABEL_23:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v3 = v2;
        v2 = v35;
        goto LABEL_5;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        v4 = v37;
        if ((v12 & 1) != 0)
          goto LABEL_19;
      }
      else
      {
        sub_213492784();
        v4 = v37;
        if ((v17 & 1) != 0)
          goto LABEL_19;
      }
LABEL_21:
      v4[(v13 >> 6) + 8] |= 1 << v13;
      v21 = (uint64_t *)(v4[6] + 16 * v13);
      *v21 = v10;
      v21[1] = v9;
      *(_QWORD *)(v4[7] + 8 * v13) = v7;
      v22 = v4[2];
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
        goto LABEL_26;
      v4[2] = v24;
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
  }
  v4 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_29:
  swift_bridgeObjectRelease();
  v25 = *(_QWORD *)(v33 + 16);
  swift_bridgeObjectRetain();
  v26 = swift_bridgeObjectRetain();
  v27 = sub_21349936C(v26, (uint64_t)v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v28 = sub_213498E44(v27);
  v30 = v29;
  swift_bridgeObjectRelease();
  if (v30)
  {
    if (v30 == 1)
    {
      v37 = (_QWORD *)v28;
      v38 = 1;
      a2(&v37);
      return sub_213493278(v28, 1);
    }
    else
    {
      if (qword_254B9CC10 != -1)
        swift_once();
      sub_21349B7A4();
      __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CEF0);
      v32 = swift_allocObject();
      *(_OWORD *)(v32 + 16) = xmmword_21349C180;
      *(_QWORD *)(v32 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_254B9D0D8);
      *(_QWORD *)(v32 + 64) = sub_213499E10();
      *(_QWORD *)(v32 + 32) = v25;
      swift_bridgeObjectRetain();
      sub_21349B570();
      swift_bridgeObjectRelease();
      v37 = 0;
      v38 = 256;
      return ((uint64_t (*)(_QWORD **))a2)(&v37);
    }
  }
  else
  {
    v37 = (_QWORD *)v28;
    v38 = 2;
    swift_retain();
    a2(&v37);
    sub_213493278(v28, 0);
    return sub_213493278(v28, 0);
  }
}

uint64_t type metadata accessor for DefaultAppSelector()
{
  return objc_opt_self();
}

uint64_t method lookup function for DefaultAppSelector()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DefaultAppSelector.__allocating_init(defaultAppBundles:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of DefaultAppSelector.__allocating_init(defaultApps:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of DefaultAppSelector.selectAppFor(intent:fromEligibleApps:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

unint64_t sub_213499E10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254B9D2F8[0];
  if (!qword_254B9D2F8[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254B9D0D8);
    result = MEMORY[0x2199B4270](MEMORY[0x24BDCFBF8], v1);
    atomic_store(result, qword_254B9D2F8);
  }
  return result;
}

_QWORD *InstrumentedAppResolutionService.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 56) = sub_2134905B4;
  *(_QWORD *)(v0 + 64) = 0;
  return AppResolutionService.init()();
}

_QWORD *InstrumentedAppResolutionService.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = sub_2134905B4;
  *(_QWORD *)(v0 + 64) = 0;
  return AppResolutionService.init()();
}

uint64_t InstrumentedAppResolutionService.resolveApp(intent:appResolutionState:_:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  void (*v10)(id, uint64_t, uint64_t (*)(uint64_t *, uint64_t), _QWORD *);
  id v11;

  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a3;
  v9[5] = a4;
  v10 = *(void (**)(id, uint64_t, uint64_t (*)(uint64_t *, uint64_t), _QWORD *))(*(_QWORD *)v4 + 152);
  swift_retain();
  v11 = a1;
  swift_retain();
  v10(v11, a2, sub_21349A040, v9);
  return swift_release();
}

uint64_t sub_213499F44(uint64_t *a1, uint64_t a2, uint64_t a3, id a4, uint64_t (*a5)(uint64_t *))
{
  uint64_t v7;
  char v8;
  char v9;
  void (*v10)(uint64_t, uint64_t, uint64_t *, uint64_t);
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  char v17;
  char v18;

  v7 = *a1;
  v8 = *((_BYTE *)a1 + 8);
  v9 = *((_BYTE *)a1 + 9);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t *, uint64_t))(a3 + 56);
  v11 = objc_msgSend(a4, sel_typeName);
  v12 = sub_21349B690();
  v14 = v13;

  v16 = v7;
  v17 = v8;
  v18 = v9;
  v10(v12, v14, &v16, a2);
  swift_bridgeObjectRelease();
  v16 = v7;
  v17 = v8;
  v18 = v9;
  return a5(&v16);
}

uint64_t sub_21349A00C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21349A040(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_213499F44(a1, a2, *(_QWORD *)(v2 + 16), *(id *)(v2 + 24), *(uint64_t (**)(uint64_t *))(v2 + 32));
}

uint64_t sub_21349A04C(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a3;
  *(_QWORD *)(v7 + 24) = a4;
  swift_retain();
  sub_21348C9A4(a2, (void (*)(uint64_t *))sub_21349A148);
  return swift_release();
}

uint64_t sub_21349A0BC(uint64_t *a1, void (*a2)(uint64_t *, unint64_t))
{
  char v3;
  char v4;
  unint64_t v5;
  uint64_t v7;
  char v8;
  char v9;

  v3 = *((_BYTE *)a1 + 8);
  v4 = *((_BYTE *)a1 + 9);
  v7 = *a1;
  v8 = v3;
  v9 = v4;
  v5 = sub_2134901D4(MEMORY[0x24BEE4AF8]);
  a2(&v7, v5);
  return swift_bridgeObjectRelease();
}

uint64_t sub_21349A124()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21349A148(uint64_t *a1)
{
  uint64_t v1;

  return sub_21349A0BC(a1, *(void (**)(uint64_t *, unint64_t))(v1 + 16));
}

uint64_t sub_21349A150()
{
  return swift_release();
}

uint64_t InstrumentedAppResolutionService.deinit()
{
  uint64_t v0;

  v0 = AppResolutionService.deinit();
  swift_release();
  return v0;
}

uint64_t InstrumentedAppResolutionService.__deallocating_deinit()
{
  AppResolutionService.deinit();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_21349A1B8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for InstrumentedAppResolutionService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InstrumentedAppResolutionService);
}

uint64_t method lookup function for InstrumentedAppResolutionService()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of InstrumentedAppResolutionService.resolveApp(forIntent:withConversionState:_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

void sub_21349A220()
{
  __asm { BR              X10 }
}

unint64_t sub_21349A264()
{
  char v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CF30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21349CC00;
  sub_21348C768(v1, v0);
  v5 = qword_254B9CC20;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v6 = *(_QWORD *)algn_254B9D388;
  *(_QWORD *)(inited + 32) = qword_254B9D380;
  *(_QWORD *)(inited + 40) = v6;
  sub_21349A888();
  v7 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v8;
  *(_QWORD *)(inited + 56) = v9;
  v10 = qword_254B9CC28;
  swift_bridgeObjectRetain();
  if (v10 != -1)
    swift_once();
  v11 = *(_QWORD *)algn_254B9D398;
  *(_QWORD *)(inited + 80) = qword_254B9D390;
  *(_QWORD *)(inited + 88) = v11;
  *(_QWORD *)(inited + 96) = 0x6465727265666E49;
  *(_QWORD *)(inited + 104) = 0xE800000000000000;
  *(_QWORD *)(inited + 120) = v7;
  *(_QWORD *)(inited + 128) = 0xD000000000000011;
  *(_QWORD *)(inited + 168) = v7;
  *(_QWORD *)(inited + 136) = 0x800000021349D850;
  *(_QWORD *)(inited + 144) = v3;
  *(_QWORD *)(inited + 152) = v2;
  swift_bridgeObjectRetain();
  v12 = sub_2134901D4(inited);
  sub_21348C7B0(v1, v0);
  return v12;
}

void sub_21349A82C()
{
  qword_254B9D380 = 0x6C646E7542707061;
  *(_QWORD *)algn_254B9D388 = 0xEB00000000644965;
}

void sub_21349A858()
{
  strcpy((char *)&qword_254B9D390, "resolutionType");
  algn_254B9D398[7] = -18;
}

void sub_21349A888()
{
  __asm { BR              X12 }
}

unint64_t sub_21349A8D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  if (!*(_QWORD *)(a1 + 24))
    return 0xD000000000000012;
  v1 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

void AppResolutionResult.description.getter()
{
  __asm { BR              X10 }
}

unint64_t sub_21349A960()
{
  uint64_t v0;

  swift_retain();
  sub_21349B8C4();
  swift_bridgeObjectRelease();
  sub_213485868();
  sub_21349B6B4();
  swift_bridgeObjectRelease();
  sub_21349B6B4();
  sub_21348C7B0(v0, 0);
  return 0xD000000000000019;
}

_QWORD *SiriRememberedAppResolver.__allocating_init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v0 = (_QWORD *)swift_allocObject();
  v1 = type metadata accessor for SiriRemembersAppRecommender();
  v2 = swift_allocObject();
  v0[5] = v1;
  v0[6] = &off_24CFD5EC8;
  v0[2] = v2;
  return v0;
}

_QWORD *SiriRememberedAppResolver.init()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = type metadata accessor for SiriRemembersAppRecommender();
  v2 = swift_allocObject();
  v0[5] = v1;
  v0[6] = &off_24CFD5EC8;
  v0[2] = v2;
  return v0;
}

uint64_t type metadata accessor for SiriRemembersAppRecommender()
{
  return objc_opt_self();
}

uint64_t sub_21349AC2C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  v9 = sub_21349AE30(a2);
  v10 = sub_213488540(v9);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_21349B090(a1, v10, v9, (void (*)(unint64_t *, unint64_t))sub_21349AD1C);
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release_n();
  return swift_release();
}

uint64_t sub_21349ACF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t SiriRememberedAppResolver.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return v0;
}

uint64_t SiriRememberedAppResolver.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocClassInstance();
}

uint64_t sub_21349AD60(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a3;
  *(_QWORD *)(v8 + 24) = a4;
  swift_retain();
  v9 = sub_21349AE30(a2);
  v10 = sub_213488540(v9);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_21349B090(a1, v10, v9, (void (*)(unint64_t *, unint64_t))sub_21349AD1C);
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release_n();
  return swift_release();
}

uint64_t sub_21349AE30(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  unint64_t v26;

  v1 = a1;
  if (a1 >> 62)
  {
LABEL_27:
    swift_bridgeObjectRetain();
    v2 = sub_21349B960();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v26 = v1 & 0xC000000000000001;
      v3 = (_QWORD *)MEMORY[0x24BEE4B00];
      v4 = 4;
      v25 = v1;
      while (1)
      {
        v5 = v4 - 4;
        if (v26)
        {
          v6 = MEMORY[0x2199B3E74](v4 - 4, v1);
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
            goto LABEL_24;
        }
        else
        {
          v6 = *(_QWORD *)(v1 + 8 * v4);
          swift_retain();
          v7 = v4 - 3;
          if (__OFADD__(v5, 1))
          {
LABEL_24:
            __break(1u);
LABEL_25:
            __break(1u);
LABEL_26:
            __break(1u);
            goto LABEL_27;
          }
        }
        v8 = *(_QWORD *)(v6 + 24);
        if (v8)
          break;
        swift_release();
LABEL_5:
        ++v4;
        if (v7 == v2)
          goto LABEL_29;
      }
      v1 = v2;
      v9 = *(_QWORD *)(v6 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v12 = sub_213491B7C(v9, v8);
      v13 = v3[2];
      v14 = (v11 & 1) == 0;
      v15 = v13 + v14;
      if (__OFADD__(v13, v14))
        goto LABEL_25;
      v16 = v11;
      if (v3[3] < v15)
      {
        sub_213491EE8(v15, isUniquelyReferenced_nonNull_native);
        v17 = sub_213491B7C(v9, v8);
        if ((v16 & 1) != (v18 & 1))
        {
          result = sub_21349B9C0();
          __break(1u);
          return result;
        }
        v12 = v17;
        if ((v16 & 1) == 0)
          goto LABEL_21;
LABEL_19:
        v19 = v3[7];
        swift_release();
        *(_QWORD *)(v19 + 8 * v12) = v6;
LABEL_23:
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v2 = v1;
        v1 = v25;
        goto LABEL_5;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v11 & 1) != 0)
          goto LABEL_19;
      }
      else
      {
        sub_213492784();
        if ((v16 & 1) != 0)
          goto LABEL_19;
      }
LABEL_21:
      v3[(v12 >> 6) + 8] |= 1 << v12;
      v20 = (uint64_t *)(v3[6] + 16 * v12);
      *v20 = v9;
      v20[1] = v8;
      *(_QWORD *)(v3[7] + 8 * v12) = v6;
      v21 = v3[2];
      v22 = __OFADD__(v21, 1);
      v23 = v21 + 1;
      if (v22)
        goto LABEL_26;
      v3[2] = v23;
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
  }
  v3 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_29:
  swift_bridgeObjectRelease();
  return (uint64_t)v3;
}

uint64_t sub_21349B090(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t *, unint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  int v15;
  uint64_t v16;
  uint8_t *v17;
  NSObject *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[3];
  _QWORD *v24;
  int v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;

  v6 = sub_21349B540();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21349B534();
  v10 = (void *)sub_21349B528();
  if (qword_254B9CC08 != -1)
    swift_once();
  v11 = sub_21349B5AC();
  __swift_project_value_buffer(v11, (uint64_t)qword_254B9E390);
  v12 = v10;
  v13 = sub_21349B5A0();
  v14 = sub_21349B798();
  v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    v27 = a3;
    v16 = swift_slowAlloc();
    v25 = v15;
    v17 = (uint8_t *)v16;
    v24 = (_QWORD *)swift_slowAlloc();
    v26 = v17;
    *(_DWORD *)v17 = 138412290;
    v28 = v12;
    v23[1] = &v29;
    v23[2] = v17 + 4;
    v18 = v12;
    sub_21349B828();
    v19 = v24;
    *v24 = v12;

    a3 = v27;
    _os_log_impl(&dword_213483000, v13, (os_log_type_t)v25, "AppSelectionService Successfully got appMatches from Siri Remembers: %@", v26, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254B9CE48);
    swift_arrayDestroy();
    MEMORY[0x2199B4300](v19, -1, -1);
    MEMORY[0x2199B4300](v26, -1, -1);
  }
  else
  {

    v13 = v12;
  }

  v20 = sub_21349B54C();
  v21 = sub_21349B558();
  sub_21348E0E4(v20, v21, a3, a4);

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t type metadata accessor for SiriRememberedAppResolver()
{
  return objc_opt_self();
}

uint64_t method lookup function for SiriRememberedAppResolver()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriRememberedAppResolver.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of SiriRememberedAppResolver.selectAppFor(intent:fromEligibleApps:completion:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t sub_21349B528()
{
  return MEMORY[0x24BE93290]();
}

uint64_t sub_21349B534()
{
  return MEMORY[0x24BE93298]();
}

uint64_t sub_21349B540()
{
  return MEMORY[0x24BE932A0]();
}

uint64_t sub_21349B54C()
{
  return MEMORY[0x24BE932A8]();
}

uint64_t sub_21349B558()
{
  return MEMORY[0x24BE932B0]();
}

uint64_t sub_21349B564()
{
  return MEMORY[0x24BE93960]();
}

uint64_t sub_21349B570()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_21349B57C()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_21349B588()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_21349B594()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21349B5A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21349B5AC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21349B5B8()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21349B5C4()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21349B5D0()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_21349B5DC()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_21349B5E8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21349B5F4()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_21349B600()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_21349B60C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21349B618()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21349B624()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21349B630()
{
  return MEMORY[0x24BEE55C8]();
}

uint64_t sub_21349B63C()
{
  return MEMORY[0x24BEE55D8]();
}

uint64_t sub_21349B648()
{
  return MEMORY[0x24BEE55F8]();
}

uint64_t sub_21349B654()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_21349B660()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21349B66C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21349B678()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21349B684()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21349B690()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21349B69C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21349B6A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21349B6B4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21349B6C0()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21349B6CC()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_21349B6D8()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_21349B6E4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21349B6F0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21349B6FC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21349B708()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21349B714()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21349B720()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21349B72C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21349B738()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21349B744()
{
  return MEMORY[0x24BEE6860]();
}

uint64_t sub_21349B750()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_21349B75C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21349B768()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21349B774()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21349B780()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_21349B78C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21349B798()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21349B7A4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21349B7B0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21349B7BC()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_21349B7C8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21349B7D4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21349B7E0()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_21349B7EC()
{
  return MEMORY[0x24BEE5798]();
}

uint64_t sub_21349B7F8()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21349B804()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21349B810()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21349B81C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21349B828()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21349B834()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21349B840()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21349B84C()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21349B858()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_21349B864()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_21349B870()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21349B87C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_21349B888()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_21349B894()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21349B8A0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21349B8AC()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_21349B8B8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21349B8C4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21349B8D0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21349B8DC()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21349B8E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21349B8F4()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_21349B900()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21349B90C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21349B918()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21349B924()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21349B930()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21349B93C()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21349B948()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21349B954()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21349B960()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21349B96C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21349B978()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21349B984()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21349B990()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21349B99C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21349B9A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21349B9B4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21349B9C0()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21349B9CC()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21349B9D8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21349B9E4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21349B9F0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21349B9FC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21349BA08()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21349BA14()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21349BA20()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21349BA2C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21349BA38()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

