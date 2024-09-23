void sub_24766DF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSGStringPreprocessingTransformerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!CoreSuggestionsMLLibraryCore_frameworkLibrary)
  {
    CoreSuggestionsMLLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CoreSuggestionsMLLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getSGStringPreprocessingTransformerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("SGStringPreprocessingTransformer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getSGStringPreprocessingTransformerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t one-time initialization function for standard(uint64_t a1)
{
  return one-time initialization function for standard(a1, static Logger.standard);
}

uint64_t Logger.standard.unsafeMutableAddressor()
{
  return Logger.standard.unsafeMutableAddressor(&one-time initialization token for standard, (uint64_t)static Logger.standard);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.standard.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.standard.getter(&one-time initialization token for standard, (uint64_t)static Logger.standard, a1);
}

uint64_t one-time initialization function for signpost(uint64_t a1)
{
  return one-time initialization function for standard(a1, static Logger.signpost);
}

uint64_t one-time initialization function for standard(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = type metadata accessor for Logger();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.signpost.unsafeMutableAddressor()
{
  return Logger.standard.unsafeMutableAddressor(&one-time initialization token for signpost, (uint64_t)static Logger.signpost);
}

uint64_t Logger.standard.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for Logger();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.standard.getter(&one-time initialization token for signpost, (uint64_t)static Logger.signpost, a1);
}

uint64_t static Logger.standard.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for Logger();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t default argument 3 of MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)()
{
  return 0;
}

void variable initialization expression of ServerRequestHandler.purgableModelKey(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  a1[4] = 0;
  a1[5] = 0xE000000000000000;
  a1[6] = 0;
  a1[7] = 0xE000000000000000;
}

uint64_t variable initialization expression of ServerRequestHandler.purgeableModel()
{
  return 0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for espresso_network_t(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for espresso_network_t(uint64_t result, int a2, int a3)
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

void type metadata accessor for espresso_network_t(uint64_t a1)
{
  type metadata accessor for espresso_network_t(a1, &lazy cache variable for type metadata for espresso_network_t);
}

void type metadata accessor for espresso_return_status_t(uint64_t a1)
{
  type metadata accessor for espresso_network_t(a1, &lazy cache variable for type metadata for espresso_return_status_t);
}

void type metadata accessor for espresso_storage_type_t(uint64_t a1)
{
  type metadata accessor for espresso_network_t(a1, &lazy cache variable for type metadata for espresso_storage_type_t);
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance espresso_return_status_t(_DWORD *a1, _DWORD *a2)
{
  return *a1 == *a2;
}

_DWORD *protocol witness for RawRepresentable.init(rawValue:) in conformance espresso_return_status_t@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance espresso_return_status_t(_DWORD *a1@<X8>)
{
  _DWORD *v1;

  *a1 = *v1;
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

uint64_t initializeBufferWithCopyOfBuffer for espresso_buffer_t(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy168_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __n128 result;
  __int128 v8;
  __int128 v9;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  result = (__n128)a2[7];
  v8 = a2[8];
  v9 = a2[9];
  *(_QWORD *)(a1 + 160) = *((_QWORD *)a2 + 20);
  *(_OWORD *)(a1 + 128) = v8;
  *(_OWORD *)(a1 + 144) = v9;
  *(__n128 *)(a1 + 112) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for espresso_buffer_t(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 168))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for espresso_buffer_t(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(_BYTE *)(result + 168) = v3;
  return result;
}

void type metadata accessor for espresso_buffer_t(uint64_t a1)
{
  type metadata accessor for espresso_network_t(a1, &lazy cache variable for type metadata for espresso_buffer_t);
}

void type metadata accessor for espresso_network_t(uint64_t a1, unint64_t *a2)
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

void MultiHeadEspressoModel.inputName.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t MultiHeadEspressoModel.__allocating_init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10;

  v10 = swift_allocObject();
  MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(a1, a2, a3, a4, a5);
  return v10;
}

uint64_t MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t context;
  uint64_t v14;
  uint64_t plan;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  int v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  Swift::String v22;
  Swift::String v23;
  Swift::String v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t *v28;
  unint64_t *v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  void *v34;
  int v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  Swift::String v39;
  Swift::String v40;
  Swift::String v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  Swift::String v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t *v53;
  Swift::String v54;
  uint64_t v55;
  unint64_t v56;
  int v57;
  uint64_t *v58;
  Swift::String v59;
  Swift::String v60;
  Swift::String v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  NSObject *v75;
  os_log_type_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  Swift::String v89;
  uint64_t v90;
  Swift::String v91;
  unint64_t v92;
  int v93;
  uint64_t v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  int v124;
  uint64_t v125;
  int v126;
  uint64_t v127;

  v101 = a3;
  v127 = *MEMORY[0x24BDAC8D0];
  v9 = type metadata accessor for String.Encoding();
  v10 = *(_QWORD *)(v9 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v12 = (char *)&v96 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  context = espresso_create_context();
  if (!context)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v29 = v28;
    v30 = 0xD000000000000025;
    v31 = "Unable to create context for Espresso";
LABEL_7:
    *v28 = v30;
    v28[1] = (unint64_t)(v31 - 32) | 0x8000000000000000;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v29, *MEMORY[0x24BEAA548], v27);
    goto LABEL_8;
  }
  v14 = context;
  v102 = a5;
  v103 = a4;
  plan = espresso_create_plan();
  if (!plan)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v29 = v28;
    v30 = 0xD000000000000022;
    v31 = "Unable to create plan for Espresso";
    goto LABEL_7;
  }
  v16 = plan;
  v98 = v14;
  v99 = a1;
  v125 = 0;
  v126 = 0;
  v108 = 0;
  *(_QWORD *)&v114 = a1;
  *((_QWORD *)&v114 + 1) = a2;
  static String.Encoding.utf8.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.cString(using:)();
  v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v12, v9);
  v18 = espresso_plan_add_network();
  swift_bridgeObjectRelease();
  v108 = v18;
  if (v18)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v21 = v20;
    *(_QWORD *)&v114 = 0;
    *((_QWORD *)&v114 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(80);
    v22._object = (void *)0x800000024767E1D0;
    v22._countAndFlagsBits = 0xD000000000000029;
    String.append(_:)(v22);
    v23._countAndFlagsBits = v99;
    v23._object = a2;
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    v24._countAndFlagsBits = 0xD000000000000013;
    v24._object = (void *)0x800000024767E200;
    String.append(_:)(v24);
    LODWORD(v110) = 65568;
    type metadata accessor for espresso_storage_type_t(0);
    _print_unlocked<A, B>(_:_:)();
    v25._countAndFlagsBits = 0x737574617473202CLL;
    v25._object = (void *)0xEE002065646F6320;
    String.append(_:)(v25);
    LODWORD(v110) = v108;
    type metadata accessor for espresso_return_status_t(0);
    _print_unlocked<A, B>(_:_:)();
    v26 = *((_QWORD *)&v114 + 1);
    *v21 = v114;
    v21[1] = v26;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEAA548], v19);
LABEL_8:
    swift_willThrow();
    v32 = v104;
    goto LABEL_9;
  }
  v99 = v16;
  swift_bridgeObjectRelease();
  v34 = v103;
  *(_QWORD *)&v114 = v101;
  *((_QWORD *)&v114 + 1) = v103;
  static String.Encoding.utf8.getter();
  StringProtocol.cString(using:)();
  v17(v12, v9);
  v35 = espresso_network_declare_input();
  swift_bridgeObjectRelease();
  v108 = v35;
  if (v35)
  {
    swift_bridgeObjectRelease();
    v36 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v38 = v37;
    *(_QWORD *)&v114 = 0;
    *((_QWORD *)&v114 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(59);
    v39._object = (void *)0x800000024767E220;
    v39._countAndFlagsBits = 0xD000000000000029;
    String.append(_:)(v39);
    v40._countAndFlagsBits = v101;
    v40._object = v34;
    String.append(_:)(v40);
    swift_bridgeObjectRelease();
    v41._countAndFlagsBits = 0x737574617473202CLL;
    v41._object = (void *)0xEE002065646F6320;
    String.append(_:)(v41);
    LODWORD(v110) = v108;
    type metadata accessor for espresso_return_status_t(0);
    _print_unlocked<A, B>(_:_:)();
    v42 = *((_QWORD *)&v114 + 1);
    *v38 = v114;
    v38[1] = v42;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEAA548], v36);
    goto LABEL_8;
  }
  v43 = swift_bridgeObjectRetain();
  v44 = v100;
  v45 = specialized Sequence.filter(_:)(v43, (uint64_t)&v125);
  v32 = v104;
  if (*(_QWORD *)(v45 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v48 = v47;
    *(_QWORD *)&v114 = 0;
    *((_QWORD *)&v114 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(45);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v114 = 0xD00000000000002BLL;
    *((_QWORD *)&v114 + 1) = 0x800000024767E250;
    v49._countAndFlagsBits = MEMORY[0x24957EF7C](v45, MEMORY[0x24BEE0D00]);
    String.append(_:)(v49);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = *((_QWORD *)&v114 + 1);
    *v48 = v114;
    v48[1] = v50;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v48, *MEMORY[0x24BEAA548], v46);
LABEL_20:
    swift_willThrow();
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
  v108 = espresso_plan_build();
  if (v108)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v51 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v53 = v52;
    *(_QWORD *)&v114 = 0;
    *((_QWORD *)&v114 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(45);
    v54._countAndFlagsBits = 0xD00000000000002BLL;
    v54._object = (void *)0x800000024767E280;
    String.append(_:)(v54);
    LODWORD(v110) = v108;
    type metadata accessor for espresso_return_status_t(0);
    _print_unlocked<A, B>(_:_:)();
    v56 = *((_QWORD *)&v114 + 1);
    v55 = v114;
LABEL_19:
    *v53 = v55;
    v53[1] = v56;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v51 - 8) + 104))(v53, *MEMORY[0x24BEAA548], v51);
    goto LABEL_20;
  }
  v100 = v44;
  v124 = 0;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v110 = v101;
  v111 = (unint64_t)v103;
  static String.Encoding.utf8.getter();
  StringProtocol.cString(using:)();
  v17(v12, v9);
  v57 = espresso_network_bind_buffer();
  swift_bridgeObjectRelease();
  v108 = v57;
  if (v57)
  {
    swift_bridgeObjectRelease();
    v51 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v53 = v58;
    v110 = 0;
    v111 = 0xE000000000000000;
    _StringGuts.grow(_:)(98);
    v59._object = (void *)0x800000024767E2B0;
    v59._countAndFlagsBits = 0xD000000000000029;
    String.append(_:)(v59);
    v60._countAndFlagsBits = v101;
    v60._object = v103;
    String.append(_:)(v60);
    swift_bridgeObjectRelease();
    v61._countAndFlagsBits = 0xD000000000000035;
    v61._object = (void *)0x800000024767E2E0;
    String.append(_:)(v61);
    LODWORD(v109) = v108;
    type metadata accessor for espresso_return_status_t(0);
    _print_unlocked<A, B>(_:_:)();
    v55 = v110;
    v56 = v111;
    goto LABEL_19;
  }
  v107 = 0;
  v62 = static Array._allocateBufferUninitialized(minimumCapacity:)();
  *(_QWORD *)(v62 + 16) = 10;
  *(_OWORD *)(v62 + 48) = 0u;
  *(_OWORD *)(v62 + 64) = 0u;
  *(_OWORD *)(v62 + 80) = 0u;
  *(_OWORD *)(v62 + 96) = 0u;
  *(_OWORD *)(v62 + 32) = 0u;
  v106 = v62;
  v108 = espresso_buffer_unpack_tensor_shape();
  if (v107 < 1)
  {
    v70 = 0;
    v67 = v100;
  }
  else
  {
    if (v107 >= 10)
      v63 = 10;
    else
      v63 = v107;
    swift_bridgeObjectRetain();
    v64 = v63;
    v65 = v100;
    v66 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSnySiG_Sis5NeverOTg50123_s18SmartRepliesServer22MultiHeadEspressoModelC26numberOfParametersForShape33_84A6DA17DEFC71D37DEB31DDFEFF66EELL_4rankSiSayZ15G_SitFZS2iXEfU_SaySiGTf1cn_nTf4ng_n(0, v64, v62);
    v67 = v65;
    v68 = *(_QWORD *)(v66 + 16);
    if (v68)
    {
      v69 = (uint64_t *)(v66 + 32);
      v70 = 1;
      while (1)
      {
        v71 = *v69++;
        v72 = v70 * v71;
        if ((unsigned __int128)(v70 * (__int128)v71) >> 64 != (v70 * v71) >> 63)
          break;
        v70 = v72;
        if (!--v68)
        {
          swift_bridgeObjectRelease();
          goto LABEL_32;
        }
      }
      __break(1u);
      goto LABEL_41;
    }
    swift_bridgeObjectRelease();
    v70 = 1;
LABEL_32:
    swift_bridgeObjectRelease();
  }
  v100 = v67;
  if (one-time initialization token for standard != -1)
LABEL_41:
    swift_once();
  v73 = type metadata accessor for Logger();
  __swift_project_value_buffer(v73, (uint64_t)static Logger.standard);
  v74 = (unint64_t)v103;
  swift_bridgeObjectRetain_n();
  v75 = Logger.logObject.getter();
  v76 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v75, v76))
  {
    v77 = swift_slowAlloc();
    v97 = swift_slowAlloc();
    v112 = v97;
    *(_DWORD *)v77 = 136315906;
    swift_bridgeObjectRetain();
    v110 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v101, v74, &v112);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v77 + 12) = 2048;
    swift_beginAccess();
    v109 = v107;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v77 + 22) = 2080;
    swift_beginAccess();
    v78 = swift_bridgeObjectRetain();
    v79 = MEMORY[0x24957EF7C](v78, MEMORY[0x24BEE1768]);
    v81 = v80;
    swift_bridgeObjectRelease();
    v105 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v81, &v112);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    *(_WORD *)(v77 + 32) = 2048;
    v105 = v70;
    v32 = v104;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl(&dword_24766C000, v75, v76, "Input layer %s has rank %ld, shape %s, # of parameters %ld", (uint8_t *)v77, 0x2Au);
    v82 = v97;
    swift_arrayDestroy();
    MEMORY[0x24957F624](v82, -1, -1);
    MEMORY[0x24957F624](v77, -1, -1);

  }
  else
  {

    v83 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x24BDAC7A8](v83);
  *(&v96 - 2) = (uint64_t)&v108;
  *(&v96 - 1) = (uint64_t)&v125;
  v84 = v102;
  v85 = specialized Sequence.compactMap<A>(_:)(v102, (uint64_t (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #2 in MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:));
  if (!*(_QWORD *)(v85 + 16))
  {
    swift_bridgeObjectRelease();
    v93 = v126;
    *(_QWORD *)(v32 + 16) = v125;
    *(_DWORD *)(v32 + 24) = v93;
    v94 = v98;
    *(_QWORD *)(v32 + 32) = v99;
    *(_QWORD *)(v32 + 40) = v94;
    v95 = v103;
    *(_QWORD *)(v32 + 48) = v101;
    *(_QWORD *)(v32 + 56) = v95;
    *(_QWORD *)(v32 + 64) = v70;
    *(_QWORD *)(v32 + 72) = v84;
    swift_bridgeObjectRelease();
    return v32;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v86 = type metadata accessor for SRSmartRepliesError();
  lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
  swift_allocError();
  v88 = v87;
  v112 = 0;
  v113 = 0xE000000000000000;
  _StringGuts.grow(_:)(92);
  v89._countAndFlagsBits = 0xD00000000000005ALL;
  v89._object = (void *)0x800000024767E320;
  String.append(_:)(v89);
  v90 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Int, Int));
  v91._countAndFlagsBits = MEMORY[0x24957EF7C](v85, v90);
  String.append(_:)(v91);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v92 = v113;
  *v88 = v112;
  v88[1] = v92;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v86 - 8) + 104))(v88, *MEMORY[0x24BEAA548], v86);
  swift_willThrow();
  swift_bridgeObjectRelease();
LABEL_9:
  type metadata accessor for MultiHeadEspressoModel();
  swift_deallocPartialClassInstance();
  return v32;
}

unint64_t lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type SRSmartRepliesError and conformance SRSmartRepliesError;
  if (!lazy protocol witness table cache variable for type SRSmartRepliesError and conformance SRSmartRepliesError)
  {
    v1 = type metadata accessor for SRSmartRepliesError();
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEAA578], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type SRSmartRepliesError and conformance SRSmartRepliesError);
  }
  return result;
}

uint64_t type metadata accessor for MultiHeadEspressoModel()
{
  return objc_opt_self();
}

unint64_t lazy protocol witness table accessor for type String and conformance String()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type String and conformance String;
  if (!lazy protocol witness table cache variable for type String and conformance String)
  {
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type String and conformance String);
  }
  return result;
}

uint64_t specialized Sequence.filter(_:)(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t i;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a2;
  v4 = type metadata accessor for String.Encoding();
  v33 = *(_QWORD *)(v4 - 8);
  v34 = v4;
  result = MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = 0;
  v36 = a1;
  v11 = *(_QWORD *)(a1 + 64);
  v10 = a1 + 64;
  v9 = v11;
  v12 = 1 << *(_BYTE *)(v10 - 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v9;
  v31 = v10;
  v32 = (unint64_t)(v12 + 63) >> 6;
  v30 = MEMORY[0x24BEE4AF8];
  if ((v13 & v9) == 0)
    goto LABEL_7;
LABEL_4:
  v15 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v15 | (v8 << 6); ; i = __clz(__rbit64(v23)) + (v8 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v36 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(unsigned int *)(v35 + 8);
    v37 = *v17;
    v38 = v18;
    swift_bridgeObjectRetain();
    static String.Encoding.utf8.getter();
    lazy protocol witness table accessor for type String and conformance String();
    StringProtocol.cString(using:)();
    (*(void (**)(char *, uint64_t))(v33 + 8))(v7, v34);
    v2 = v2 & 0xFFFFFFFF00000000 | v20;
    v21 = espresso_network_declare_output();
    swift_bridgeObjectRelease();
    if (v21)
    {
      v25 = v30;
      result = swift_isUniquelyReferenced_nonNull_native();
      v39 = v25;
      if ((result & 1) == 0)
      {
        result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v25 + 16) + 1, 1);
        v25 = v39;
      }
      v27 = *(_QWORD *)(v25 + 16);
      v26 = *(_QWORD *)(v25 + 24);
      if (v27 >= v26 >> 1)
      {
        result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v26 > 1, v27 + 1, 1);
        v25 = v39;
      }
      *(_QWORD *)(v25 + 16) = v27 + 1;
      v30 = v25;
      v28 = v25 + 16 * v27;
      *(_QWORD *)(v28 + 32) = v19;
      *(_QWORD *)(v28 + 40) = v18;
      if (v14)
        goto LABEL_4;
    }
    else
    {
      result = swift_bridgeObjectRelease();
      if (v14)
        goto LABEL_4;
    }
LABEL_7:
    v22 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v22 >= v32)
      goto LABEL_29;
    v23 = *(_QWORD *)(v31 + 8 * v22);
    ++v8;
    if (!v23)
    {
      v8 = v22 + 1;
      if (v22 + 1 >= v32)
        goto LABEL_29;
      v23 = *(_QWORD *)(v31 + 8 * v8);
      if (!v23)
      {
        v8 = v22 + 2;
        if (v22 + 2 >= v32)
          goto LABEL_29;
        v23 = *(_QWORD *)(v31 + 8 * v8);
        if (!v23)
        {
          v8 = v22 + 3;
          if (v22 + 3 >= v32)
            goto LABEL_29;
          v23 = *(_QWORD *)(v31 + 8 * v8);
          if (!v23)
            break;
        }
      }
    }
LABEL_22:
    v14 = (v23 - 1) & v23;
  }
  v24 = v22 + 4;
  if (v24 >= v32)
  {
LABEL_29:
    swift_release();
    return v30;
  }
  v23 = *(_QWORD *)(v31 + 8 * v24);
  if (v23)
  {
    v8 = v24;
    goto LABEL_22;
  }
  while (1)
  {
    v8 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v8 >= v32)
      goto LABEL_29;
    v23 = *(_QWORD *)(v31 + 8 * v8);
    ++v24;
    if (v23)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t closure #2 in MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(uint64_t a1, unint64_t a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47[3];
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  int v59;
  uint64_t v60;

  v42 = a3;
  v60 = *MEMORY[0x24BDAC8D0];
  v7 = type metadata accessor for String.Encoding();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = 0;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v47[0] = a1;
  v47[1] = a2;
  static String.Encoding.utf8.getter();
  lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.cString(using:)();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  LODWORD(v7) = espresso_network_bind_buffer();
  swift_bridgeObjectRelease();
  *a4 = v7;
  if (!(_DWORD)v7)
  {
    v45 = 0;
    v16 = static Array._allocateBufferUninitialized(minimumCapacity:)();
    *(_QWORD *)(v16 + 16) = 10;
    *(_OWORD *)(v16 + 48) = 0u;
    *(_OWORD *)(v16 + 64) = 0u;
    *(_OWORD *)(v16 + 80) = 0u;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    v44 = v16;
    v17 = espresso_buffer_unpack_tensor_shape();
    *a4 = v17;
    if (v17)
    {
      if (one-time initialization token for standard != -1)
        swift_once();
      v18 = type metadata accessor for Logger();
      __swift_project_value_buffer(v18, (uint64_t)static Logger.standard);
      swift_bridgeObjectRetain_n();
      v19 = Logger.logObject.getter();
      v20 = static os_log_type_t.fault.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v22 = swift_slowAlloc();
        v47[0] = v22;
        *(_DWORD *)v21 = 136315138;
        swift_bridgeObjectRetain();
        v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v47);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_24766C000, v19, v20, "Unable to get output shape to layer %s in Espresso plan during initialization", v21, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24957F624](v22, -1, -1);
        MEMORY[0x24957F624](v21, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      goto LABEL_23;
    }
    if (v45 <= 0)
    {
      v30 = 0;
      if (!v42)
        goto LABEL_28;
    }
    else
    {
      if (v45 >= 10)
        v23 = 10;
      else
        v23 = v45;
      swift_bridgeObjectRetain();
      v24 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSnySiG_Sis5NeverOTg50123_s18SmartRepliesServer22MultiHeadEspressoModelC26numberOfParametersForShape33_84A6DA17DEFC71D37DEB31DDFEFF66EELL_4rankSiSayZ15G_SitFZS2iXEfU_SaySiGTf1cn_nTf4ng_n(0, v23, v16);
      v25 = *(_QWORD *)(v24 + 16);
      if (v25)
      {
        v26 = 0;
        v27 = 1;
        do
        {
          v28 = *(_QWORD *)(v24 + 8 * v26 + 32);
          v29 = (unsigned __int128)(v27 * (__int128)v28) >> 64;
          v27 *= v28;
          if (v29 != v27 >> 63)
          {
            __break(1u);
            goto LABEL_35;
          }
          ++v26;
        }
        while (v25 != v26);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v27 != v42)
          goto LABEL_23;
        v30 = v42;
        goto LABEL_28;
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v30 = 1;
      if (v42 == 1)
      {
LABEL_28:
        if (one-time initialization token for standard != -1)
          swift_once();
        v32 = type metadata accessor for Logger();
        __swift_project_value_buffer(v32, (uint64_t)static Logger.standard);
        swift_bridgeObjectRetain_n();
        v33 = Logger.logObject.getter();
        v34 = static os_log_type_t.debug.getter();
        if (os_log_type_enabled(v33, v34))
        {
          v35 = swift_slowAlloc();
          v36 = swift_slowAlloc();
          v48 = v36;
          *(_DWORD *)v35 = 136315906;
          swift_bridgeObjectRetain();
          v47[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v48);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v35 + 12) = 2048;
          swift_beginAccess();
          v46 = v45;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          *(_WORD *)(v35 + 22) = 2080;
          swift_beginAccess();
          v37 = swift_bridgeObjectRetain();
          v38 = MEMORY[0x24957EF7C](v37, MEMORY[0x24BEE1768]);
          v40 = v39;
          swift_bridgeObjectRelease();
          v43 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v38, v40, &v48);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          swift_bridgeObjectRelease();
          *(_WORD *)(v35 + 32) = 2048;
          v43 = v30;
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          _os_log_impl(&dword_24766C000, v33, v34, "Output head %s has rank %ld, shape %s, # of parameters %ld", (uint8_t *)v35, 0x2Au);
          swift_arrayDestroy();
          MEMORY[0x24957F624](v36, -1, -1);
          MEMORY[0x24957F624](v35, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        swift_bridgeObjectRelease();
        return 0;
      }
    }
LABEL_23:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return a1;
  }
  if (one-time initialization token for standard != -1)
LABEL_35:
    swift_once();
  v11 = type metadata accessor for Logger();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.standard);
  swift_bridgeObjectRetain_n();
  v12 = Logger.logObject.getter();
  v13 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v47[0] = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v46 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, v47);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24766C000, v12, v13, "Could not bind the output buffer to layer %s in Espresso plan during initialization", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957F624](v15, -1, -1);
    MEMORY[0x24957F624](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t partial apply for closure #2 in MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #2 in MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(a1, a2, a3, *(_DWORD **)(v3 + 16));
}

uint64_t MultiHeadEspressoModel.inference(onInput:heads:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  Swift::String v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  int v52;
  _QWORD *v53;
  _QWORD *v54;
  Swift::String v55;
  uint64_t v56;
  void *v57;
  Swift::String v58;
  Swift::String v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  _QWORD *v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  unint64_t v75;
  int v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  char v80;
  _QWORD *v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  _QWORD *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _QWORD *v94;
  _QWORD *v95;
  Swift::String v96;
  uint64_t v97;
  Swift::String v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  int v102;
  int v103;
  _QWORD *v104;
  Swift::String v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  uint64_t v117;
  uint64_t v118;
  unint64_t v119;
  char v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  char v124;
  char v125;
  unint64_t v126;
  uint64_t v127;
  _BOOL8 v128;
  uint64_t v129;
  char v130;
  unint64_t v131;
  char v132;
  unint64_t *v133;
  uint64_t v134;
  BOOL v135;
  uint64_t v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  uint64_t result;
  _QWORD v147[3];
  void (*v148)(char *, uint64_t);
  unint64_t v149;
  _QWORD *v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  unint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  uint64_t v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  uint64_t v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  uint64_t v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  int v203;
  uint64_t v204;

  v4 = v3;
  v5 = v2;
  v204 = *MEMORY[0x24BDAC8D0];
  v8 = type metadata accessor for String.Encoding();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v147 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a2 + 16);
  if (!v13)
    return MEMORY[0x24BEE4B00];
  v152 = v9;
  v153 = v10;
  v150 = a1;
  v151 = v12;
  v147[1] = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  v14 = 0;
  v147[2] = a2;
  v15 = a2 + 40;
  v16 = -(uint64_t)v13;
  v155 = MEMORY[0x24BEE4AF8];
  v156 = v13;
  v157 = v5;
  v154 = a2 + 40;
  do
  {
    if (v14 <= v13)
      v17 = v13;
    else
      v17 = v14;
    v18 = -(uint64_t)v17;
    v19 = (uint64_t *)(v15 + 16 * v14++);
    while (1)
    {
      if (v18 + v14 == 1)
      {
        __break(1u);
LABEL_76:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        return (uint64_t)v19;
      }
      v21 = *(v19 - 1);
      v20 = *v19;
      v22 = *(_QWORD *)(*(_QWORD *)(v5 + 72) + 16);
      swift_bridgeObjectRetain();
      if (!v22)
        goto LABEL_13;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      specialized __RawDictionaryStorage.find<A>(_:)(v21, v20);
      v24 = v23;
      swift_bridgeObjectRelease();
      if ((v24 & 1) == 0)
        break;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v14;
      v19 += 2;
      v5 = v157;
      if (v16 + v14 == 1)
        goto LABEL_18;
    }
    swift_bridgeObjectRelease();
LABEL_13:
    v25 = v155;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v181 = v25;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v25 + 16) + 1, 1);
      v25 = v181;
    }
    v28 = *(_QWORD *)(v25 + 16);
    v27 = *(_QWORD *)(v25 + 24);
    if (v28 >= v27 >> 1)
    {
      specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v27 > 1, v28 + 1, 1);
      v25 = v181;
    }
    *(_QWORD *)(v25 + 16) = v28 + 1;
    v155 = v25;
    v29 = v25 + 16 * v28;
    *(_QWORD *)(v29 + 32) = v21;
    *(_QWORD *)(v29 + 40) = v20;
    v13 = v156;
    v5 = v157;
    v15 = v154;
  }
  while (v16 + v14);
LABEL_18:
  swift_bridgeObjectRelease();
  swift_release();
  v19 = (uint64_t *)v155;
  if (*(_QWORD *)(v155 + 16))
  {
    v30 = type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v32 = v31;
    *(_QWORD *)&v181 = 0;
    *((_QWORD *)&v181 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    *(_QWORD *)&v181 = 0xD00000000000002ALL;
    *((_QWORD *)&v181 + 1) = 0x800000024767E380;
    v33._countAndFlagsBits = MEMORY[0x24957EF7C](v19, MEMORY[0x24BEE0D00]);
    String.append(_:)(v33);
    swift_release();
    swift_bridgeObjectRelease();
    v34 = *((_QWORD *)&v181 + 1);
    *v32 = v181;
    v32[1] = v34;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v30 - 8) + 104))(v32, *MEMORY[0x24BEAA540], v30);
    goto LABEL_53;
  }
  swift_release();
  if (one-time initialization token for standard != -1)
    swift_once();
  v35 = type metadata accessor for Logger();
  v36 = __swift_project_value_buffer(v35, (uint64_t)static Logger.standard);
  swift_bridgeObjectRetain_n();
  v37 = Logger.logObject.getter();
  v38 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v37, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    v155 = swift_slowAlloc();
    *(_QWORD *)&v181 = v155;
    *(_DWORD *)v39 = 136315138;
    v154 = (uint64_t)(v39 + 4);
    v147[0] = v36;
    v40 = v39;
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x24957EF7C](v41, MEMORY[0x24BEE0D00]);
    v44 = v43;
    swift_bridgeObjectRelease();
    *(_QWORD *)&v193 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v44, (uint64_t *)&v181);
    v5 = v157;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24766C000, v37, v38, "Running multi-head inference on heads %s", v40, 0xCu);
    v45 = v155;
    swift_arrayDestroy();
    MEMORY[0x24957F624](v45, -1, -1);
    v46 = v40;
    v36 = v147[0];
    MEMORY[0x24957F624](v46, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v203 = 0;
  v201 = 0u;
  v202 = 0u;
  v199 = 0u;
  v200 = 0u;
  v197 = 0u;
  v198 = 0u;
  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  v47 = *(_QWORD *)(v5 + 56);
  *(_QWORD *)&v181 = *(_QWORD *)(v5 + 48);
  *((_QWORD *)&v181 + 1) = v47;
  swift_bridgeObjectRetain();
  v48 = v151;
  static String.Encoding.utf8.getter();
  v49 = lazy protocol witness table accessor for type String and conformance String();
  StringProtocol.cString(using:)();
  v50 = v48;
  v51 = *(void (**)(char *, uint64_t))(v153 + 8);
  v51(v50, v152);
  swift_bridgeObjectRelease();
  v52 = espresso_network_bind_buffer();
  swift_bridgeObjectRelease();
  if (v52)
  {
    v19 = (uint64_t *)type metadata accessor for SRSmartRepliesError();
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v54 = v53;
    *(_QWORD *)&v181 = 0;
    *((_QWORD *)&v181 + 1) = 0xE000000000000000;
    _StringGuts.grow(_:)(76);
    v55._countAndFlagsBits = 0xD000000000000029;
    v55._object = (void *)0x800000024767E3B0;
    String.append(_:)(v55);
    v56 = *(_QWORD *)(v5 + 48);
    v57 = *(void **)(v5 + 56);
    swift_bridgeObjectRetain();
    v58._countAndFlagsBits = v56;
    v58._object = v57;
    String.append(_:)(v58);
    swift_bridgeObjectRelease();
    v59._object = (void *)0x800000024767E3E0;
    v59._countAndFlagsBits = 0xD00000000000001FLL;
    String.append(_:)(v59);
    LODWORD(v170) = v52;
    type metadata accessor for espresso_return_status_t(0);
    _print_unlocked<A, B>(_:_:)();
    v60 = *((_QWORD *)&v181 + 1);
    *v54 = v181;
    v54[1] = v60;
    (*(void (**)(_QWORD *, _QWORD, uint64_t *))(*(v19 - 1) + 104))(v54, *MEMORY[0x24BEAA540], v19);
    goto LABEL_53;
  }
  v148 = v51;
  v149 = v49;
  v61 = *v150;
  v158 = v61;
  v62 = *(_QWORD *)(v61 + 16);
  v63 = v156;
  if (*(_QWORD *)(v5 + 64) < v62)
  {
    swift_retain();
    outlined retain of [Float]((uint64_t)&v158);
    v64 = Logger.logObject.getter();
    v65 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v64, v65))
    {
      v66 = swift_slowAlloc();
      *(_DWORD *)v66 = 134218240;
      *(_QWORD *)&v181 = v62;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      outlined release of [Float]((uint64_t)&v158);
      *(_WORD *)(v66 + 12) = 2048;
      *(_QWORD *)&v181 = *(_QWORD *)(v5 + 64);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_release();
      _os_log_impl(&dword_24766C000, v64, v65, "Inference on input tokens will be truncated from %ld to %ld", (uint8_t *)v66, 0x16u);
      v67 = v66;
      v63 = v156;
      MEMORY[0x24957F624](v67, -1, -1);

    }
    else
    {
      outlined release of [Float]((uint64_t)&v158);

      swift_release();
    }
  }
  v147[0] = v36;
  if (!(_QWORD)v193)
  {
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  memcpy((void *)v193, (const void *)(v61 + 32), 4 * *(_QWORD *)(v5 + 64));
  v68 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v69 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v150 = (_QWORD *)MEMORY[0x24BEE4AF8];
  do
  {
    v155 = (uint64_t)v69;
    v156 = v63;
    v71 = *(v68 - 1);
    v72 = *v68;
    LODWORD(v191) = 0;
    v189 = 0u;
    v190 = 0u;
    v187 = 0u;
    v188 = 0u;
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v181 = 0u;
    v182 = 0u;
    v73 = *(unsigned int *)(v5 + 24);
    v153 = v71;
    *(_QWORD *)&v170 = v71;
    *((_QWORD *)&v170 + 1) = v72;
    swift_bridgeObjectRetain();
    v74 = v151;
    static String.Encoding.utf8.getter();
    StringProtocol.cString(using:)();
    v148(v74, v152);
    v75 = v154 & 0xFFFFFFFF00000000 | v73;
    v76 = espresso_network_bind_buffer();
    swift_bridgeObjectRelease();
    v154 = v75;
    if (v76)
    {
      v69 = (_QWORD *)v155;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v69 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v69[2] + 1, 1, v69);
      v5 = v157;
      v77 = v153;
      v79 = v69[2];
      v78 = v69[3];
      if (v79 >= v78 >> 1)
        v69 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v78 > 1), v79 + 1, 1, v69);
      v69[2] = v79 + 1;
      v70 = &v69[3 * v79];
      v70[4] = v77;
      v70[5] = v72;
      *((_DWORD *)v70 + 12) = v76;
    }
    else
    {
      v178 = v189;
      v179 = v190;
      v180 = v191;
      v174 = v185;
      v175 = v186;
      v176 = v187;
      v177 = v188;
      v170 = v181;
      v171 = v182;
      v172 = v183;
      v173 = v184;
      v80 = swift_isUniquelyReferenced_nonNull_native();
      v69 = (_QWORD *)v155;
      if ((v80 & 1) != 0)
      {
        v5 = v157;
        v81 = v150;
      }
      else
      {
        v81 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v150[2] + 1, 1, v150);
        v5 = v157;
      }
      v82 = v153;
      v84 = v81[2];
      v83 = v81[3];
      if (v84 >= v83 >> 1)
        v81 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v83 > 1), v84 + 1, 1, v81);
      v163 = v174;
      v164 = v175;
      v161 = v172;
      v162 = v173;
      v169 = v180;
      v167 = v178;
      v168 = v179;
      v165 = v176;
      v166 = v177;
      v159 = v170;
      v160 = v171;
      v81[2] = v84 + 1;
      v150 = v81;
      v85 = &v81[23 * v84];
      v85[4] = v82;
      v85[5] = v72;
      v86 = v159;
      v87 = v161;
      *((_OWORD *)v85 + 4) = v160;
      *((_OWORD *)v85 + 5) = v87;
      *((_OWORD *)v85 + 3) = v86;
      v88 = v162;
      v89 = v163;
      v90 = v165;
      *((_OWORD *)v85 + 8) = v164;
      *((_OWORD *)v85 + 9) = v90;
      *((_OWORD *)v85 + 6) = v88;
      *((_OWORD *)v85 + 7) = v89;
      v91 = v166;
      v92 = v167;
      v93 = v168;
      v85[26] = v169;
      *((_OWORD *)v85 + 11) = v92;
      *((_OWORD *)v85 + 12) = v93;
      *((_OWORD *)v85 + 10) = v91;
    }
    v68 += 2;
    v63 = v156 - 1;
  }
  while (v156 != 1);
  swift_bridgeObjectRelease();
  if (!v69[2])
  {
    v99 = Logger.logObject.getter();
    v100 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v99, v100))
    {
      v101 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v101 = 0;
      _os_log_impl(&dword_24766C000, v99, v100, "Input and output buffers bound, proceeding to run inference", v101, 2u);
      MEMORY[0x24957F624](v101, -1, -1);
    }

    v102 = espresso_plan_execute_sync();
    if (v102)
    {
      v103 = v102;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v19 = (uint64_t *)type metadata accessor for SRSmartRepliesError();
      lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
      swift_allocError();
      v95 = v104;
      *(_QWORD *)&v181 = 0;
      *((_QWORD *)&v181 + 1) = 0xE000000000000000;
      _StringGuts.grow(_:)(47);
      v105._countAndFlagsBits = 0xD00000000000002DLL;
      v105._object = (void *)0x800000024767E460;
      String.append(_:)(v105);
      LODWORD(v170) = v103;
      type metadata accessor for espresso_return_status_t(0);
      _print_unlocked<A, B>(_:_:)();
      goto LABEL_52;
    }
    v107 = v150[2];
    if (v107)
    {
      v155 = (uint64_t)v69;
      swift_bridgeObjectRetain();
      v108 = v150;
      v109 = *((_OWORD *)v150 + 11);
      v189 = *((_OWORD *)v150 + 10);
      v190 = v109;
      v191 = *((_OWORD *)v150 + 12);
      v192 = v150[26];
      v110 = *((_OWORD *)v150 + 7);
      v185 = *((_OWORD *)v150 + 6);
      v186 = v110;
      v111 = *((_OWORD *)v150 + 9);
      v187 = *((_OWORD *)v150 + 8);
      v188 = v111;
      v112 = *((_OWORD *)v150 + 3);
      v181 = *((_OWORD *)v150 + 2);
      v182 = v112;
      v113 = *((_OWORD *)v150 + 5);
      v183 = *((_OWORD *)v150 + 4);
      v184 = v113;
      v114 = *((_QWORD *)&v181 + 1);
      v115 = v107 - 1;
      v19 = (uint64_t *)MEMORY[0x24BEE4B00];
      for (i = 27; ; i += 23)
      {
        v117 = *(_QWORD *)(v5 + 72);
        if (!*(_QWORD *)(v117 + 16))
          goto LABEL_71;
        v118 = v181;
        outlined retain of (String, espresso_buffer_t)((uint64_t)&v181);
        outlined retain of (String, espresso_buffer_t)((uint64_t)&v181);
        swift_bridgeObjectRetain();
        v156 = v118;
        v119 = specialized __RawDictionaryStorage.find<A>(_:)(v118, v114);
        if ((v120 & 1) != 0)
          break;
LABEL_70:
        swift_bridgeObjectRelease();
        outlined release of (String, espresso_buffer_t)((uint64_t)&v181);
        outlined release of (String, espresso_buffer_t)((uint64_t)&v181);
        v108 = v150;
LABEL_71:
        if (!v115)
          goto LABEL_76;
        v137 = *(_OWORD *)&v108[i];
        v138 = *(_OWORD *)&v108[i + 2];
        v139 = *(_OWORD *)&v108[i + 6];
        v183 = *(_OWORD *)&v108[i + 4];
        v184 = v139;
        v181 = v137;
        v182 = v138;
        v140 = *(_OWORD *)&v108[i + 8];
        v141 = *(_OWORD *)&v108[i + 10];
        v142 = *(_OWORD *)&v108[i + 14];
        v187 = *(_OWORD *)&v108[i + 12];
        v188 = v142;
        v185 = v140;
        v186 = v141;
        v143 = *(_OWORD *)&v108[i + 16];
        v144 = *(_OWORD *)&v108[i + 18];
        v145 = *(_OWORD *)&v108[i + 20];
        v192 = v108[i + 22];
        v190 = v144;
        v191 = v145;
        v189 = v143;
        v114 = *((_QWORD *)&v181 + 1);
        --v115;
      }
      v153 = v115;
      v121 = v114;
      v122 = (char *)v182;
      v123 = *(_QWORD *)(*(_QWORD *)(v117 + 56) + 8 * v119);
      swift_bridgeObjectRelease();
      outlined release of (String, espresso_buffer_t)((uint64_t)&v181);
      if (!v122)
        goto LABEL_83;
      v154 = specialized _copyCollectionToContiguousArray<A>(_:)(v122, v123);
      swift_bridgeObjectRetain();
      v124 = swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v170 = v19;
      v126 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v121);
      v127 = v19[2];
      v128 = (v125 & 1) == 0;
      v129 = v127 + v128;
      if (__OFADD__(v127, v128))
      {
        __break(1u);
LABEL_81:
        __break(1u);
      }
      v130 = v125;
      if (v19[3] < v129)
      {
        specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v129, v124);
        v131 = specialized __RawDictionaryStorage.find<A>(_:)(v156, v121);
        if ((v130 & 1) != (v132 & 1))
          goto LABEL_84;
        v126 = v131;
        v19 = (uint64_t *)v170;
        if ((v130 & 1) == 0)
          goto LABEL_63;
LABEL_68:
        *(_QWORD *)(v19[7] + 8 * v126) = v154;
        swift_bridgeObjectRelease();
LABEL_69:
        v5 = v157;
        v115 = v153;
        goto LABEL_70;
      }
      if ((v124 & 1) != 0)
      {
        v19 = (uint64_t *)v170;
        if ((v125 & 1) != 0)
          goto LABEL_68;
      }
      else
      {
        specialized _NativeDictionary.copy()();
        v19 = (uint64_t *)v170;
        if ((v130 & 1) != 0)
          goto LABEL_68;
      }
LABEL_63:
      v19[(v126 >> 6) + 8] |= 1 << v126;
      v133 = (unint64_t *)(v19[6] + 16 * v126);
      *v133 = v156;
      v133[1] = v121;
      *(_QWORD *)(v19[7] + 8 * v126) = v154;
      v134 = v19[2];
      v135 = __OFADD__(v134, 1);
      v136 = v134 + 1;
      if (v135)
        goto LABEL_81;
      v19[2] = v136;
      swift_bridgeObjectRetain();
      goto LABEL_69;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  swift_bridgeObjectRelease();
  v19 = (uint64_t *)type metadata accessor for SRSmartRepliesError();
  lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
  swift_allocError();
  v95 = v94;
  *(_QWORD *)&v181 = 0;
  *((_QWORD *)&v181 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(88);
  v96._countAndFlagsBits = 0xD000000000000056;
  v96._object = (void *)0x800000024767E400;
  String.append(_:)(v96);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, espresso_return_status_t));
  v98._countAndFlagsBits = MEMORY[0x24957EF7C](v69, v97);
  String.append(_:)(v98);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_52:
  v106 = *((_QWORD *)&v181 + 1);
  *v95 = v181;
  v95[1] = v106;
  (*(void (**)(_QWORD *, _QWORD, uint64_t *))(*(v19 - 1) + 104))(v95, *MEMORY[0x24BEAA540], v19);
LABEL_53:
  swift_willThrow();
  return (uint64_t)v19;
}

uint64_t MultiHeadEspressoModel.deinit()
{
  uint64_t v0;

  espresso_plan_destroy();
  espresso_context_destroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MultiHeadEspressoModel.__deallocating_deinit()
{
  espresso_plan_destroy();
  espresso_context_destroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t serialize(_:at:)(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t closure #1 in osLogInternal(_:log:type:)(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_QWORD *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, Int, Int)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
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
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, espresso_return_status_t)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 24);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[3 * v8 + 4])
          memmove(v12, a4 + 4, 24 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(String, espresso_buffer_t)>);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 184);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[23 * v8 + 4])
          memmove(v12, a4 + 4, 184 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    specialized _ArrayBuffer._copyContents(subRange:initializing:)(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t implicit closure #1 in OSLogInterpolation.appendInterpolation(_:align:privacy:)(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t closure #1 in OSLogArguments.append(_:)(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v6, v7, a3);
  v8 = *a1 + 8;
  UnsafeMutableRawBufferPointer.copyMemory(from:)();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
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
  v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
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
      v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = _StringGuts.copyUTF8(into:)();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      v2 = String.UTF8View._foreignCount()();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    result = _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_BYTE **closure #1 in OSLogArguments.append(_:)(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void *closure #1 in serialize<A>(_:at:)(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

{
  char **v3;
  uint64_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Int>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(char *a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  int64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;

  if (!a2)
    return MEMORY[0x24BEE4AF8];
  if (a2 > 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Float>);
    v4 = 4 * a2;
    v5 = (char *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 29;
    *((_QWORD *)v5 + 2) = a2;
    *((_QWORD *)v5 + 3) = 2 * (v7 >> 2);
    v8 = v5 + 32;
    if (&v5[v4 + 32] <= a1 || v8 >= &a1[v4])
    {
      memcpy(v8, a1, 4 * a2);
      return (uint64_t)v5;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized _copyCollectionToContiguousArray<A>(_:)(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    specialized Array._copyContents(initializing:)((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
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
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [Float]>);
  v37 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
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
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v35;
        if ((v37 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v36 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
  v37 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SRSmartRepliesPredictionItem]>);
  v36 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
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
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    result = Hasher._finalize()();
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

void *specialized _NativeDictionary.copy()()
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
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [Float]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
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
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, Int>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, [SRSmartRepliesPredictionItem]>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
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
    result = (void *)swift_bridgeObjectRetain();
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

uint64_t specialized Array._copyContents(initializing:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        lazy protocol witness table accessor for type [SRSmartRepliesConversationTurn] and conformance [A]();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SRSmartRepliesConversationTurn]);
          v12 = specialized protocol witness for Collection.subscript.read in conformance [A](v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    type metadata accessor for SRSmartRepliesConversationTurn();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSnySiG_Sis5NeverOTg50123_s18SmartRepliesServer22MultiHeadEspressoModelC26numberOfParametersForShape33_84A6DA17DEFC71D37DEB31DDFEFF66EELL_4rankSiSayZ15G_SitFZS2iXEfU_SaySiGTf1cn_nTf4ng_n(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2 - result;
  if (__OFSUB__(a2, result))
    goto LABEL_16;
  v4 = result;
  result = MEMORY[0x24BEE4AF8];
  if (v3)
  {
    v13 = MEMORY[0x24BEE4AF8];
    result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
    if (a2 < v4 || v3 < 0)
      goto LABEL_17;
    result = v13;
    v7 = *(_QWORD *)(a3 + 16);
    if (v7 <= v4)
      v7 = v4;
    v8 = v7 - v4;
    v9 = (uint64_t *)(a3 + 8 * v4 + 32);
    while ((v4 & 0x8000000000000000) == 0)
    {
      if (!v8)
        goto LABEL_15;
      v10 = *v9;
      v14 = result;
      v12 = *(_QWORD *)(result + 16);
      v11 = *(_QWORD *)(result + 24);
      if (v12 >= v11 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v11 > 1, v12 + 1, 1);
        result = v14;
      }
      *(_QWORD *)(result + 16) = v12 + 1;
      *(_QWORD *)(result + 8 * v12 + 32) = v10;
      --v8;
      ++v9;
      if (!--v3)
        return result;
    }
    __break(1u);
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  return result;
}

uint64_t specialized _ArrayBuffer._copyContents(subRange:initializing:)(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, Int, Int));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 184 * a1 + 32;
    v6 = a3 + 184 * v4;
    if (v5 >= v6 || v5 + 184 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for (String, espresso_buffer_t));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

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
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (String, espresso_return_status_t));
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t specialized Sequence.compactMap<A>(_:)(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  int64_t v7;
  unint64_t v8;
  unint64_t i;
  uint64_t *v10;
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
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  int64_t v30;

  v29 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  v28 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v5)
    goto LABEL_7;
LABEL_4:
  v8 = __clz(__rbit64(v5));
  v5 &= v5 - 1;
  for (i = v8 | (v7 << 6); ; i = __clz(__rbit64(v22)) + (v7 << 6))
  {
    v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v12 = *v10;
    v11 = v10[1];
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v14 = a2(v12, v11, v13);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    result = swift_bridgeObjectRelease();
    if (v16)
    {
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28[2] + 1, 1, v28);
        v28 = (_QWORD *)result;
      }
      v25 = v28[2];
      v24 = v28[3];
      v26 = v25 + 1;
      if (v25 >= v24 >> 1)
      {
        result = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v24 > 1), v25 + 1, 1, v28);
        v26 = v25 + 1;
        v28 = (_QWORD *)result;
      }
      v28[2] = v26;
      v27 = &v28[4 * v25];
      v27[4] = v14;
      v27[5] = v16;
      v27[6] = v18;
      v27[7] = v20;
      if (v5)
        goto LABEL_4;
    }
    else if (v5)
    {
      goto LABEL_4;
    }
LABEL_7:
    v21 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_31;
    }
    if (v21 >= v30)
      goto LABEL_29;
    v22 = *(_QWORD *)(v29 + 8 * v21);
    ++v7;
    if (!v22)
    {
      v7 = v21 + 1;
      if (v21 + 1 >= v30)
        goto LABEL_29;
      v22 = *(_QWORD *)(v29 + 8 * v7);
      if (!v22)
      {
        v7 = v21 + 2;
        if (v21 + 2 >= v30)
          goto LABEL_29;
        v22 = *(_QWORD *)(v29 + 8 * v7);
        if (!v22)
        {
          v7 = v21 + 3;
          if (v21 + 3 >= v30)
            goto LABEL_29;
          v22 = *(_QWORD *)(v29 + 8 * v7);
          if (!v22)
            break;
        }
      }
    }
LABEL_22:
    v5 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v30)
  {
LABEL_29:
    swift_release();
    return (uint64_t)v28;
  }
  v22 = *(_QWORD *)(v29 + 8 * v23);
  if (v22)
  {
    v7 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    v7 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v7 >= v30)
      goto LABEL_29;
    v22 = *(_QWORD *)(v29 + 8 * v7);
    ++v23;
    if (v22)
      goto LABEL_22;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957F5AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t outlined retain of (String, espresso_buffer_t)(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of (String, espresso_buffer_t)(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t outlined retain of [Float](uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t outlined release of [Float](uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t lazy protocol witness table accessor for type [SRSmartRepliesConversationTurn] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [SRSmartRepliesConversationTurn] and conformance [A];
  if (!lazy protocol witness table cache variable for type [SRSmartRepliesConversationTurn] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [SRSmartRepliesConversationTurn]);
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [SRSmartRepliesConversationTurn] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24957F5B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t one-time initialization function for machServiceName()
{
  uint64_t result;
  void *v1;

  result = smartRepliesInferenceServiceName.getter();
  machServiceName._countAndFlagsBits = result;
  machServiceName._object = v1;
  return result;
}

objc_class *one-time initialization function for clientXPCInterface()
{
  objc_class *result;

  result = (objc_class *)srSmartRepliesXPCClientInterface.getter();
  clientXPCInterface.super.isa = result;
  return result;
}

id one-time initialization function for shared()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SRSSmartRepliesServerXPCServer()), sel_init);
  static SRSSmartRepliesServerXPCServer.shared = (uint64_t)result;
  return result;
}

uint64_t static SRSSmartRepliesServerXPCServer.registerXPCListeners()()
{
  uint64_t result;

  if (one-time initialization token for shared != -1)
    return swift_once();
  return result;
}

char *SRSSmartRepliesServerXPCServer.().init()()
{
  void *v0;
  objc_class *ObjectType;
  uint64_t v2;
  char *v3;
  uint64_t countAndFlagsBits;
  void *object;
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  char *v10;
  void *v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = one-time initialization token for machServiceName;
  v3 = v0;
  if (v2 != -1)
    swift_once();
  countAndFlagsBits = machServiceName._countAndFlagsBits;
  object = machServiceName._object;
  v6 = objc_allocWithZone(MEMORY[0x24BDD1998]);
  swift_bridgeObjectRetain();
  v7 = (void *)MEMORY[0x24957EEEC](countAndFlagsBits, object);
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithMachServiceName_, v7);

  *(_QWORD *)&v3[OBJC_IVAR____TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer_xpcListener] = v8;
  type metadata accessor for ServerRequestHandler();
  v9 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v9[14] = 0;
  v9[15] = 0xE000000000000000;
  v9[16] = 0;
  v9[17] = 0xE000000000000000;
  v9[18] = 0;
  v9[19] = 0xE000000000000000;
  v9[20] = 0;
  v9[21] = 0xE000000000000000;
  v9[22] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer_serverRequestHandler] = v9;

  v22.receiver = v3;
  v22.super_class = ObjectType;
  v10 = (char *)objc_msgSendSuper2(&v22, sel_init);
  v11 = *(void **)&v10[OBJC_IVAR____TtC18SmartRepliesServer30SRSSmartRepliesServerXPCServer_xpcListener];
  v12 = v10;
  objc_msgSend(v11, sel_setDelegate_, v12);
  objc_msgSend(v11, sel_resume);
  if (one-time initialization token for standard != -1)
    swift_once();
  v13 = type metadata accessor for Logger();
  __swift_project_value_buffer(v13, (uint64_t)static Logger.standard);
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v21 = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = machServiceName._countAndFlagsBits;
    v19 = machServiceName._object;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v18, (unint64_t)v19, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24766C000, v14, v15, "SmartReplies XPC service is up listening under \"%s\"!", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24957F624](v17, -1, -1);
    MEMORY[0x24957F624](v16, -1, -1);
  }

  return v12;
}

Swift::Bool __swiftcall SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(NSXPCListener _, NSXPCConnection shouldAcceptNewConnection)
{
  return specialized SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(shouldAcceptNewConnection.super.isa);
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id closure #1 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(uint64_t a1, unint64_t a2, void *a3, const char *a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v16;
  uint64_t v17;

  if (one-time initialization token for standard != -1)
    swift_once();
  v8 = type metadata accessor for Logger();
  __swift_project_value_buffer(v8, (uint64_t)static Logger.standard);
  swift_bridgeObjectRetain_n();
  v9 = Logger.logObject.getter();
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v17 = v12;
    *(_DWORD *)v11 = 136315394;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v11 + 12) = 2080;
    if (one-time initialization token for machServiceName != -1)
      swift_once();
    countAndFlagsBits = machServiceName._countAndFlagsBits;
    object = machServiceName._object;
    swift_bridgeObjectRetain();
    v16 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &v17);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24766C000, v9, v10, a4, (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957F624](v12, -1, -1);
    MEMORY[0x24957F624](v11, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return objc_msgSend(a3, sel_invalidate, v16, v17);
}

uint64_t SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)(v9 + 104) = v13;
  *(_QWORD *)(v9 + 112) = v8;
  *(_QWORD *)(v9 + 96) = v12;
  *(_OWORD *)(v9 + 80) = v11;
  *(_QWORD *)(v9 + 64) = a7;
  *(_QWORD *)(v9 + 72) = a8;
  *(_QWORD *)(v9 + 48) = a5;
  *(_QWORD *)(v9 + 56) = a6;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  return swift_task_switch();
}

uint64_t SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)()
{
  uint64_t *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  _QWORD *v5;

  if (one-time initialization token for standard != -1)
    swift_once();
  v1 = type metadata accessor for Logger();
  __swift_project_value_buffer(v1, (uint64_t)static Logger.standard);
  v2 = Logger.logObject.getter();
  v3 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_24766C000, v2, v3, "Received a request for predictFor async", v4, 2u);
    MEMORY[0x24957F624](v4, -1, -1);
  }

  v5 = (_QWORD *)swift_task_alloc();
  v0[15] = (uint64_t)v5;
  *v5 = v0;
  v5[1] = SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
  return ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(v0[2], v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9]);
}

uint64_t SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, void *aBlock)
{
  _QWORD *v8;
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
  id v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;

  v8[2] = v30;
  v8[3] = _Block_copy(aBlock);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v28 = v10;
  v29 = v9;
  v8[4] = v10;
  type metadata accessor for SRSmartRepliesConversationTurn();
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8[5] = v11;
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = v12;
  v8[6] = v12;
  v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;
  v8[7] = v14;
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;
  v8[8] = v16;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v19;
  v8[9] = v19;
  v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v8[10] = v21;
  v22 = v30;
  v23 = (_QWORD *)swift_task_alloc();
  v8[11] = v23;
  *v23 = v8;
  v23[1] = @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
  v23[13] = v21;
  v23[14] = v22;
  v23[11] = v18;
  v23[12] = v20;
  v23[9] = v25;
  v23[10] = v17;
  v23[7] = v26;
  v23[8] = v15;
  v23[5] = v27;
  v23[6] = v13;
  v23[3] = v28;
  v23[4] = v11;
  v23[2] = v29;
  return swift_task_switch();
}

uint64_t @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v3 = v1;
  v4 = *v2;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v3)
  {
    v7 = _convertErrorToNSError(_:)();

    isa = 0;
    v9 = (void *)v7;
  }
  else
  {
    v7 = a1;
    if (a1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [SRSmartRepliesPredictionItem]);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease();
      v7 = 0;
      v9 = isa;
    }
    else
    {
      isa = 0;
      v9 = 0;
    }
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v4 + 24);
  ((void (**)(_QWORD, Class, uint64_t))v10)[2](v10, isa, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id SRSSmartRepliesServerXPCServer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = type metadata accessor for TaskPriority();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  outlined destroy of TaskPriority?(a1, (uint64_t *)&demangling cache variable for type metadata for TaskPriority?);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t specialized SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  Swift::String v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD *v25;
  void *v26;
  id v27;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t aBlock;
  unint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  id (*v39)();
  _QWORD *v40;
  char v41;
  _OWORD v42[2];

  v2 = v1;
  v4 = objc_msgSend(a1, sel_processIdentifier);
  type metadata accessor for NSProcessInfo();
  v5 = static NSProcessInfo.processNameForPID(_:)();
  if (v6)
  {
    v7 = v5;
    v8 = v6;
  }
  else
  {
    _StringGuts.grow(_:)(17);
    swift_bridgeObjectRelease();
    aBlock = 0x6E776F6E6B6E753CLL;
    v36 = 0xEF2064697028203ELL;
    LODWORD(v42[0]) = v4;
    v9._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
    String.append(_:)(v9);
    swift_bridgeObjectRelease();
    v7 = 0x6E776F6E6B6E753CLL;
    v8 = 0xEF2064697028203ELL;
  }
  if (one-time initialization token for standard != -1)
    swift_once();
  v10 = type metadata accessor for Logger();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.standard);
  swift_bridgeObjectRetain_n();
  v11 = Logger.logObject.getter();
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    *(_QWORD *)&v42[0] = v14;
    *(_DWORD *)v13 = 67109378;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v13 + 8) = 2080;
    v36 = v8;
    swift_bridgeObjectRetain();
    v15 = String.init<A>(reflecting:)();
    aBlock = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v15, v16, (uint64_t *)v42);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24766C000, v11, v12, "Received incoming connection from pid %d with process name %s", (uint8_t *)v13, 0x12u);
    swift_arrayDestroy();
    v17 = v14;
    v2 = v1;
    MEMORY[0x24957F624](v17, -1, -1);
    MEMORY[0x24957F624](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (one-time initialization token for machServiceName != -1)
    swift_once();
  v18 = (void *)MEMORY[0x24957EEEC](machServiceName._countAndFlagsBits, machServiceName._object);
  v19 = objc_msgSend(a1, sel_valueForEntitlement_, v18);

  if (v19)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v42, 0, sizeof(v42));
  }
  outlined init with take of Any?((uint64_t)v42, (uint64_t)&aBlock);
  if (v38)
  {
    if ((swift_dynamicCast() & 1) != 0 && v41 == 1)
    {
      if (one-time initialization token for clientXPCInterface != -1)
        swift_once();
      objc_msgSend(a1, sel_setExportedInterface_, clientXPCInterface.super.isa);
      objc_msgSend(a1, sel_setExportedObject_, v2);
      v20 = (_QWORD *)swift_allocObject();
      v20[2] = v7;
      v20[3] = v8;
      v20[4] = a1;
      v39 = partial apply for closure #1 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:);
      v40 = v20;
      v21 = v7;
      v22 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v36 = 1107296256;
      v37 = thunk for @escaping @callee_guaranteed () -> ();
      v38 = &block_descriptor;
      v23 = _Block_copy(&aBlock);
      swift_bridgeObjectRetain();
      v24 = a1;
      swift_release();
      objc_msgSend(v24, sel_setInterruptionHandler_, v23);
      _Block_release(v23);
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = v21;
      v25[3] = v8;
      v25[4] = v24;
      v39 = partial apply for closure #2 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:);
      v40 = v25;
      aBlock = v22;
      v36 = 1107296256;
      v37 = thunk for @escaping @callee_guaranteed () -> ();
      v38 = &block_descriptor_29;
      v26 = _Block_copy(&aBlock);
      v27 = v24;
      swift_release();
      objc_msgSend(v27, sel_setInvalidationHandler_, v26);
      _Block_release(v26);
      objc_msgSend(v27, sel_resume);
      return 1;
    }
  }
  else
  {
    outlined destroy of TaskPriority?((uint64_t)&aBlock, &demangling cache variable for type metadata for Any?);
  }
  swift_bridgeObjectRetain();
  v29 = Logger.logObject.getter();
  v30 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    aBlock = v32;
    *(_DWORD *)v31 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v42[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v7, v8, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v31 + 12) = 2080;
    countAndFlagsBits = machServiceName._countAndFlagsBits;
    object = machServiceName._object;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v42[0] = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(countAndFlagsBits, (unint64_t)object, &aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24766C000, v29, v30, "Rejecting connection from %s due to missing entitlement \"%s\"", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24957F624](v32, -1, -1);
    MEMORY[0x24957F624](v31, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

uint64_t type metadata accessor for SRSSmartRepliesServerXPCServer()
{
  return objc_opt_self();
}

uint64_t sub_247674CF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 72));
  return swift_deallocObject();
}

void partial apply for @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = partial apply for @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
  __asm { BR              X8; @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:) }
}

uint64_t partial apply for @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _sIeghH_IeAgH_TRTA()
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
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu))(v2, v3, v4);
}

uint64_t objectdestroy_6Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
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
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu
                                                                   + _sIeAgH_ytIeAgHr_TRTu))(a1, v4, v5, v6);
}

uint64_t sub_247674F80()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = partial apply for @objc closure #1 in SRSSmartRepliesServerXPCServer.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu))(a1, v4);
}

unint64_t type metadata accessor for NSProcessInfo()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSProcessInfo;
  if (!lazy cache variable for type metadata for NSProcessInfo)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSProcessInfo);
  }
  return result;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t outlined destroy of TaskPriority?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

id partial apply for closure #1 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)()
{
  uint64_t v0;

  return closure #1 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), "Connection to %s for \"%s\" interrupted");
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

uint64_t objectdestroy_22Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

id partial apply for closure #2 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)()
{
  uint64_t v0;

  return closure #1 in SRSSmartRepliesServerXPCServer.listener(_:shouldAcceptNewConnection:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32), "Connection to %s for \"%s\" invalidated");
}

_QWORD *ServerRequestHandler.__allocating_init()()
{
  _QWORD *v0;

  v0 = (_QWORD *)swift_allocObject();
  swift_defaultActor_initialize();
  v0[14] = 0;
  v0[15] = 0xE000000000000000;
  v0[16] = 0;
  v0[17] = 0xE000000000000000;
  v0[18] = 0;
  v0[19] = 0xE000000000000000;
  v0[20] = 0;
  v0[21] = 0xE000000000000000;
  v0[22] = 0;
  return v0;
}

void static ServerRequestHandler.createInferenceBundle(language:plistPath:espressoModelPath:vocabPath:)(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X4>, void *a4@<X5>, uint64_t a5@<X6>, void *a6@<X7>, uint64_t *a7@<X8>)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *object;
  uint64_t *v25;
  unsigned int *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  Swift::String v41;
  uint64_t v42;
  void *v43;
  Swift::String v44;
  uint64_t v45;
  Swift::String v46;
  Swift::String v47;
  Swift::String v48;
  Swift::String v49;
  Swift::String v50;
  void *v51;
  Swift::String v52;
  Swift::String v53;
  Swift::String v54;
  void *v55;
  Swift::String v56;
  Swift::String v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  unint64_t v64;
  unint64_t v65;
  int64_t v66;
  unint64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char isUniquelyReferenced_nonNull_native;
  char v77;
  unint64_t v78;
  uint64_t v79;
  _BOOL8 v80;
  uint64_t v81;
  char v82;
  unint64_t v83;
  char v84;
  uint64_t *v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  Swift::String v101;
  Swift::String v102;
  void *v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t countAndFlagsBits;
  unint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;
  int64_t v116;
  uint64_t v117;
  Swift::String v118;
  uint64_t v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  Swift::String v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;

  v120 = a2;
  v121 = a6;
  v117 = a5;
  v118._countAndFlagsBits = a3;
  v118._object = a4;
  v119 = a1;
  v124 = a7;
  v7 = type metadata accessor for SRSmartRepliesError();
  v122 = *(_QWORD *)(v7 - 8);
  v123 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v105 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for URL.DirectoryHint();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v105 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for URL();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56))(v16, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BDCD7A0], v10);
  swift_bridgeObjectRetain();
  URL.init(filePath:directoryHint:relativeTo:)();
  v21 = Data.init(contentsOf:options:)();
  v23 = v22;
  v114 = v9;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  type metadata accessor for PropertyListDecoder();
  swift_allocObject();
  PropertyListDecoder.init()();
  lazy protocol witness table accessor for type InferenceConfig and conformance InferenceConfig();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
  outlined consume of Data._Representation(v21, v23);
  swift_release();
  v27 = v129;
  v28 = v130;
  v29 = v131;
  if (!*(_QWORD *)(v131 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v32 = v119;
    v31 = v120;
LABEL_22:
    v125._countAndFlagsBits = 0;
    v125._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(62);
    v47._countAndFlagsBits = 0x65676175676E614CLL;
    v47._object = (void *)0xE900000000000020;
    String.append(_:)(v47);
    v48._countAndFlagsBits = v32;
    v48._object = v31;
    String.append(_:)(v48);
    v49._countAndFlagsBits = 0xD000000000000033;
    v49._object = (void *)0x800000024767EB00;
    String.append(_:)(v49);
    object = v125._object;
    v25 = v124;
    *v124 = v125._countAndFlagsBits;
    v25[1] = (uint64_t)object;
    v26 = (unsigned int *)MEMORY[0x24BEAA550];
    goto LABEL_2;
  }
  v113 = v127;
  v111 = 0;
  countAndFlagsBits = v125._countAndFlagsBits;
  v30 = v125._object;
  v108 = v126;
  v112 = v128;
  swift_bridgeObjectRetain();
  v31 = v120;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v32 = v119;
  v33 = specialized __RawDictionaryStorage.find<A>(_:)(v119, (uint64_t)v31);
  if ((v34 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  v110 = v27;
  v35 = *(_QWORD *)(*(_QWORD *)(v29 + 56) + 8 * v33);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v36 = v121;
  swift_bridgeObjectRetain();
  v37 = v117;
  v38 = (void *)MEMORY[0x24957EE98](v117, v36);
  if (v38)
  {
    v106 = v29;
    v107 = v38;
    if (v110)
      v39 = v112;
    else
      v39 = 0;
    if (v110)
      v40 = v110;
    else
      v40 = 0xE000000000000000;
    v41._countAndFlagsBits = 1952804398;
    v41._object = (void *)0xE400000000000000;
    v42 = v118._countAndFlagsBits;
    v43 = v118._object;
    if (String.hasSuffix(_:)(v41))
      goto LABEL_18;
    v44._countAndFlagsBits = 1852400174;
    v44._object = (void *)0xE400000000000000;
    if (String.hasSuffix(_:)(v44))
    {
      v45 = HIBYTE(v40) & 0xF;
      if ((v40 & 0x2000000000000000) == 0)
        v45 = v39 & 0xFFFFFFFFFFFFLL;
      if (v45)
      {
LABEL_18:
        v46._countAndFlagsBits = 1952804398;
        v46._object = (void *)0xE400000000000000;
        if (String.hasSuffix(_:)(v46))
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRetain();
        }
        else
        {
          v125._countAndFlagsBits = v42;
          v125._object = v43;
          swift_bridgeObjectRetain();
          v56._countAndFlagsBits = 58;
          v56._object = (void *)0xE100000000000000;
          String.append(_:)(v56);
          v57._countAndFlagsBits = v39;
          v57._object = (void *)v40;
          String.append(_:)(v57);
          swift_bridgeObjectRelease();
          v118 = v125;
        }
        v58 = 0;
        v59 = *(_QWORD *)(v35 + 64);
        v115 = v35 + 64;
        v60 = 1 << *(_BYTE *)(v35 + 32);
        v61 = -1;
        if (v60 < 64)
          v61 = ~(-1 << v60);
        v62 = v61 & v59;
        v116 = (unint64_t)(v60 + 63) >> 6;
        v63 = (_QWORD *)MEMORY[0x24BEE4B00];
        v117 = v28;
        while (1)
        {
          if (v62)
          {
            v64 = __clz(__rbit64(v62));
            v62 &= v62 - 1;
            v121 = v58;
            v65 = v64 | ((_QWORD)v58 << 6);
          }
          else
          {
            v66 = (int64_t)v58 + 1;
            if (__OFADD__(v58, 1))
              goto LABEL_65;
            if (v66 >= v116)
            {
LABEL_58:
              swift_release();
              type metadata accessor for MultiHeadEspressoModel();
              swift_allocObject();
              v89 = v118._object;
              swift_bridgeObjectRetain();
              v90 = v111;
              v91 = MultiHeadEspressoModel.init(espressoModelFilePath:inputName:headDimensionality:espressoEngine:)(v118._countAndFlagsBits, v89, 0x7165537475706E69, (void *)0xED000065636E6575, (uint64_t)v63);
              if (!v90)
              {
                v95 = v91;
                swift_bridgeObjectRelease();
                v96 = v124;
                v97 = (uint64_t)v120;
                *v124 = v119;
                v96[1] = v97;
                v96[2] = countAndFlagsBits;
                v96[3] = (uint64_t)v30;
                v98 = v113;
                v96[4] = v108;
                v96[5] = v98;
                v99 = v110;
                v96[6] = v112;
                v96[7] = v99;
                v100 = v106;
                v96[8] = v28;
                v96[9] = v100;
                v96[10] = (uint64_t)v107;
                v96[11] = v95;
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<InferenceBundle, SRSmartRepliesError>);
                swift_storeEnumTagMultiPayload();
                swift_bridgeObjectRetain();
                return;
              }
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v125._countAndFlagsBits = (uint64_t)v90;
              v92 = v90;
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
              v93 = v114;
              v94 = v123;
              if ((swift_dynamicCast() & 1) != 0)
              {

                swift_bridgeObjectRelease();
                (*(void (**)(uint64_t *, char *, uint64_t))(v122 + 32))(v124, v93, v94);
                __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<InferenceBundle, SRSmartRepliesError>);
                swift_storeEnumTagMultiPayload();

                return;
              }

              v125._countAndFlagsBits = 0;
              v125._object = (void *)0xE000000000000000;
              _StringGuts.grow(_:)(45);
              v101._countAndFlagsBits = 0xD000000000000020;
              v101._object = (void *)0x800000024767EBD0;
              String.append(_:)(v101);
              String.append(_:)(v118);
              swift_bridgeObjectRelease();
              v102._countAndFlagsBits = 0x3A6F742065756420;
              v102._object = (void *)0xE900000000000020;
              String.append(_:)(v102);
              v132 = v90;
              _print_unlocked<A, B>(_:_:)();

              v103 = v125._object;
              v104 = v124;
              *v124 = v125._countAndFlagsBits;
              v104[1] = (uint64_t)v103;
              (*(void (**)(uint64_t *, _QWORD, uint64_t))(v122 + 104))(v104, *MEMORY[0x24BEAA540], v94);
              goto LABEL_3;
            }
            v67 = *(_QWORD *)(v115 + 8 * v66);
            v68 = (int64_t)v58 + 1;
            if (!v67)
            {
              v68 = (int64_t)v58 + 2;
              if ((uint64_t)v58 + 2 >= v116)
                goto LABEL_58;
              v67 = *(_QWORD *)(v115 + 8 * v68);
              if (!v67)
              {
                v68 = (int64_t)v58 + 3;
                if ((uint64_t)v58 + 3 >= v116)
                  goto LABEL_58;
                v67 = *(_QWORD *)(v115 + 8 * v68);
                if (!v67)
                {
                  v69 = (uint64_t)v58 + 4;
                  if ((uint64_t)v58 + 4 >= v116)
                    goto LABEL_58;
                  v67 = *(_QWORD *)(v115 + 8 * v69);
                  if (!v67)
                  {
                    while (1)
                    {
                      v68 = v69 + 1;
                      if (__OFADD__(v69, 1))
                        goto LABEL_66;
                      if (v68 >= v116)
                        goto LABEL_58;
                      v67 = *(_QWORD *)(v115 + 8 * v68);
                      ++v69;
                      if (v67)
                        goto LABEL_46;
                    }
                  }
                  v68 = (int64_t)v58 + 4;
                }
              }
            }
LABEL_46:
            v62 = (v67 - 1) & v67;
            v121 = (void *)v68;
            v65 = __clz(__rbit64(v67)) + (v68 << 6);
          }
          v70 = 16 * v65;
          v71 = v35;
          v72 = (uint64_t *)(*(_QWORD *)(v35 + 48) + v70);
          v74 = *v72;
          v73 = v72[1];
          v75 = *(_QWORD *)(*(_QWORD *)(v35 + 56) + v70 + 8);
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v125._countAndFlagsBits = (uint64_t)v63;
          v78 = specialized __RawDictionaryStorage.find<A>(_:)(v74, v73);
          v79 = v63[2];
          v80 = (v77 & 1) == 0;
          v81 = v79 + v80;
          if (__OFADD__(v79, v80))
          {
            __break(1u);
LABEL_64:
            __break(1u);
LABEL_65:
            __break(1u);
LABEL_66:
            __break(1u);
LABEL_67:
            KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
            __break(1u);
            return;
          }
          v82 = v77;
          if (v63[3] >= v81)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v63 = (_QWORD *)v125._countAndFlagsBits;
              if ((v77 & 1) != 0)
                goto LABEL_29;
            }
            else
            {
              specialized _NativeDictionary.copy()();
              v63 = (_QWORD *)v125._countAndFlagsBits;
              if ((v82 & 1) != 0)
                goto LABEL_29;
            }
          }
          else
          {
            specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v81, isUniquelyReferenced_nonNull_native);
            v83 = specialized __RawDictionaryStorage.find<A>(_:)(v74, v73);
            if ((v82 & 1) != (v84 & 1))
              goto LABEL_67;
            v78 = v83;
            v63 = (_QWORD *)v125._countAndFlagsBits;
            if ((v82 & 1) != 0)
            {
LABEL_29:
              *(_QWORD *)(v63[7] + 8 * v78) = v75;
              goto LABEL_30;
            }
          }
          v63[(v78 >> 6) + 8] |= 1 << v78;
          v85 = (uint64_t *)(v63[6] + 16 * v78);
          *v85 = v74;
          v85[1] = v73;
          *(_QWORD *)(v63[7] + 8 * v78) = v75;
          v86 = v63[2];
          v87 = __OFADD__(v86, 1);
          v88 = v86 + 1;
          if (v87)
            goto LABEL_64;
          v63[2] = v88;
          swift_bridgeObjectRetain();
LABEL_30:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v28 = v117;
          v35 = v71;
          v58 = v121;
        }
      }
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v125._countAndFlagsBits = 0;
    v125._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(71);
    v52._countAndFlagsBits = 0xD000000000000024;
    v52._object = (void *)0x800000024767EB70;
    String.append(_:)(v52);
    v53._countAndFlagsBits = v42;
    v53._object = v43;
    String.append(_:)(v53);
    v54._countAndFlagsBits = 0xD000000000000021;
    v54._object = (void *)0x800000024767EBA0;
    String.append(_:)(v54);

    v55 = v125._object;
    v25 = v124;
    *v124 = v125._countAndFlagsBits;
    v25[1] = (uint64_t)v55;
    v26 = (unsigned int *)MEMORY[0x24BEAA548];
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v125._countAndFlagsBits = 0;
    v125._object = (void *)0xE000000000000000;
    _StringGuts.grow(_:)(44);
    swift_bridgeObjectRelease();
    v125._countAndFlagsBits = 0xD00000000000002ALL;
    v125._object = (void *)0x800000024767EB40;
    v50._countAndFlagsBits = v37;
    v50._object = v36;
    String.append(_:)(v50);
    v51 = v125._object;
    v25 = v124;
    *v124 = v125._countAndFlagsBits;
    v25[1] = (uint64_t)v51;
    v26 = (unsigned int *)MEMORY[0x24BEAA558];
  }
LABEL_2:
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v122 + 104))(v25, *v26, v123);
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<InferenceBundle, SRSmartRepliesError>);
  swift_storeEnumTagMultiPayload();
}

uint64_t static ServerRequestHandler.runInference(message:conversationTurns:inferenceBundle:heads:)@<X0>(unint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id *v12;
  double v13;
  id *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  Swift::String v34;
  Swift::String v35;
  unint64_t v36;
  void *v38;
  Class isa;
  id v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v44 = a5;
  v48 = a6;
  v49 = a3;
  v47 = type metadata accessor for SRSmartRepliesError();
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v43[1] = (char *)v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a4;
  v10 = (void *)a4[1];
  v12 = (id *)a4[2];
  v13 = *((double *)a4 + 3);
  v14 = (id *)a4[4];
  v15 = a4[5];
  v16 = a4[9];
  v45 = a4[8];
  v18 = (void *)a4[10];
  v17 = a4[11];
  swift_bridgeObjectRetain();
  v19 = v18;
  swift_retain();
  v20 = specialized static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:)(a1, a2, v49, v12, v14, v15, v13);
  v22 = v21;
  if (!*(_QWORD *)(v16 + 16))
  {
    v31 = v48;
    v32 = v47;
    v33 = v46;
    v25 = v11;
LABEL_8:
    swift_bridgeObjectRelease();
    v51 = 0;
    v52 = 0xE000000000000000;
    _StringGuts.grow(_:)(54);
    v34._countAndFlagsBits = 0xD000000000000034;
    v34._object = (void *)0x800000024767EA70;
    String.append(_:)(v34);
    v35._countAndFlagsBits = v25;
    v35._object = v10;
    String.append(_:)(v35);

    swift_release();
    swift_bridgeObjectRelease();
    v36 = v52;
    *v31 = v51;
    v31[1] = v36;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v33 + 104))(v31, *MEMORY[0x24BEAA540], v32);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
    return swift_storeEnumTagMultiPayload();
  }
  v23 = v20;
  swift_bridgeObjectRetain();
  v24 = specialized __RawDictionaryStorage.find<A>(_:)(v11, (uint64_t)v10);
  v25 = v11;
  if ((v26 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    v31 = v48;
    v32 = v47;
    v33 = v46;
    goto LABEL_8;
  }
  v27 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = (void *)MEMORY[0x24957EEEC](v23, v22);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v45 + 16))
  {
    specialized __RawDictionaryStorage.find<A>(_:)(v25, (uint64_t)v10);
    v29 = v44;
    if ((v30 & 1) != 0)
      swift_bridgeObjectRetain();
  }
  else
  {
    v29 = v44;
  }
  swift_bridgeObjectRelease();
  v38 = (void *)objc_opt_self();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v40 = objc_msgSend(v38, sel_transformMessage_withMethods_, v28, isa);

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  WordPieceTokenizer.encode(text:)();
  swift_bridgeObjectRelease();
  v41 = (*(uint64_t (**)(uint64_t *, uint64_t))(*(_QWORD *)v17 + 280))(&v51, v29);
  v50 = v51;
  outlined release of [Float]((uint64_t)&v50);
  v60 = v52;
  outlined release of [Float]((uint64_t)&v60);
  v59 = v53;
  outlined release of [Float]((uint64_t)&v59);
  v58 = v54;
  outlined release of [Float]((uint64_t)&v58);
  v56 = v55;
  v42 = outlined release of (String, espresso_buffer_t)((uint64_t)&v56);
  v57 = MEMORY[0x24BEE4B00];
  MEMORY[0x24BDAC7A8](v42);
  v43[-2] = v27;
  v43[-1] = &v57;
  specialized Sequence.forEach(_:)(v41, (void (*)(uint64_t, uint64_t, uint64_t))closure #1 in static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:)partial apply);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  *v48 = v57;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
  return swift_storeEnumTagMultiPayload();
}

uint64_t static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:)(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x24BEE4B00];
  specialized Sequence.forEach(_:)(a1, (void (*)(uint64_t, uint64_t, uint64_t))partial apply for closure #1 in static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:));
  return v2;
}

uint64_t closure #2 in static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  char v22;
  uint64_t result;
  double v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;

  v31 = a7;
  v29 = a8;
  v30 = a6;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for Date();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = SRSmartRepliesConversationTurn.senderID.getter();
  if (v19)
  {
    v20 = v19;
  }
  else
  {
    v18 = 0;
    v20 = 0xE000000000000000;
  }
  if (v18 == a3 && v20 == a4)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v22 & 1) == 0)
      return result;
  }
  SRSmartRepliesConversationTurn.timestamp.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    static Date.distantPast.getter();
    outlined destroy of TaskPriority?((uint64_t)v13, (uint64_t *)&demangling cache variable for type metadata for Date?);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  }
  Date.timeIntervalSince(_:)();
  if (v24 > a1)
  {
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    return 0;
  }
  SRSmartRepliesConversationTurn.text.getter();
  v25 = String.count.getter();
  swift_bridgeObjectRelease();
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v26 = v25 + v31;
  if (__OFADD__(v25, v31))
  {
    __break(1u);
  }
  else
  {
    v27 = __OFADD__(*v30, v26);
    v28 = *v30 + v26;
    if (!v27)
    {
      *v30 = v28;
      return v28 <= v29;
    }
  }
  __break(1u);
  return result;
}

void specialized Collection.prefix(while:)(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::Int v14;
  Swift::Int v15;
  uint64_t v16;
  id v17;

  v6 = a3 & 0xFFFFFFFFFFFFFF8;
  v7 = a3 >> 62;
  if (!(a3 >> 62))
  {
    v8 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v8)
    {
      v9 = 0;
      goto LABEL_17;
    }
LABEL_3:
    v16 = v7;
    v9 = 0;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        swift_bridgeObjectRetain();
        v10 = (id)MEMORY[0x24957F054](v9, a3);
        swift_bridgeObjectRelease();
      }
      else
      {
        v10 = *(id *)(a3 + 8 * v9 + 32);
      }
      v17 = v10;
      v7 = a1(&v17);

      if (v3)
      {
        swift_bridgeObjectRelease();
        return;
      }
      if ((v7 & 1) == 0)
        break;
      v11 = v9 + 1;
      if (__OFADD__(v9, 1))
      {
        __break(1u);
        goto LABEL_27;
      }
      ++v9;
      if (v11 == v8)
      {
        v9 = v8;
        break;
      }
    }
    v7 = v16;
    if (v9 < 0)
      goto LABEL_30;
    v6 = a3 & 0xFFFFFFFFFFFFFF8;
    if (v16)
      goto LABEL_14;
LABEL_17:
    v13 = *(_QWORD *)(v6 + 16);
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v8 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v8)
    goto LABEL_3;
  v9 = 0;
LABEL_14:
  swift_bridgeObjectRetain();
  v12 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (v12 < 0)
  {
LABEL_31:
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  v13 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
LABEL_18:
  if (v13 < v9)
  {
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if ((a3 & 0xC000000000000001) != 0 && v9)
  {
    type metadata accessor for SRSmartRepliesConversationTurn();
    v14 = 0;
    do
    {
      v15 = v14 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v14);
      v14 = v15;
    }
    while (v9 != v15);
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.subscript.getter();
    swift_bridgeObjectRelease_n();
  }
}

uint64_t closure #1 in static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  if (*(_QWORD *)(a4 + 16))
  {
    swift_bridgeObjectRetain();
    v10 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
    if ((v11 & 1) != 0)
    {
      v12 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 16 * v10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12)
      {
        v13 = swift_bridgeObjectRetain();
        v14 = _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs12Zip2SequenceVySaySfGSaySSGG_12SmartReplies07SRSmartG14PredictionItemCs5NeverOTg508_sSfSS12f9Replies07h3B14ij7CIgygo_m8_SStACs5k119OIegnrzr_TR04_s18ab78Server0C14RequestHandlerC13formatOutputs_21modelHeadOutputLabelsSDySSSay0aB007c3B14de16CGGSDySSSaym41GG_R44SSAA05ModelI0VGtFZySS_AKtXEfU_AHSf_R16XEfU0_Tf3nnnpf_nTf1cn_n(v13, v12);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v23 = *a5;
        *a5 = 0x8000000000000000;
        v16 = v14;
        goto LABEL_11;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  v17 = *(_QWORD *)(a3 + 16);
  v18 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    v24 = MEMORY[0x24BEE4AF8];
    specialized ContiguousArray.reserveCapacity(_:)();
    v19 = a3 + 32;
    v20 = (objc_class *)type metadata accessor for SRSmartRepliesPredictionItem();
    do
    {
      v19 += 4;
      v21 = objc_allocWithZone(v20);
      SRSmartRepliesPredictionItem.init(score:label:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v17;
    }
    while (v17);
    v18 = v24;
  }
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v23 = *a5;
  *a5 = 0x8000000000000000;
  v16 = v18;
LABEL_11:
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(v16, a1, a2, isUniquelyReferenced_nonNull_native);
  *a5 = v23;
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _sSTsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFs12Zip2SequenceVySaySfGSaySSGG_12SmartReplies07SRSmartG14PredictionItemCs5NeverOTg508_sSfSS12f9Replies07h3B14ij7CIgygo_m8_SStACs5k119OIegnrzr_TR04_s18ab78Server0C14RequestHandlerC13formatOutputs_21modelHeadOutputLabelsSDySSSay0aB007c3B14de16CGGSDySSSaym41GG_R44SSAA05ModelI0VGtFZySS_AKtXEfU_AHSf_R16XEfU0_Tf3nnnpf_nTf1cn_n(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a2 + 16);
  if (v5 >= v4)
    v6 = *(_QWORD *)(a1 + 16);
  else
    v6 = *(_QWORD *)(a2 + 16);
  v20 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray.reserveCapacity(_:)();
  v17 = v5;
  v19 = a2;
  v18 = v4;
  if (v6)
  {
    v7 = a1 + 32;
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
    v9 = a2 + 40;
    v10 = v6;
    while (v4)
    {
      if (!v5)
        goto LABEL_22;
      v7 += 4;
      objc_allocWithZone((Class)type metadata accessor for SRSmartRepliesPredictionItem());
      swift_bridgeObjectRetain();
      SRSmartRepliesPredictionItem.init(score:label:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      result = specialized ContiguousArray._endMutation()();
      --v5;
      --v4;
      v9 += 16;
      if (!--v10)
        goto LABEL_11;
    }
    __break(1u);
LABEL_22:
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRetain();
    result = swift_bridgeObjectRetain();
LABEL_11:
    if (v18 <= v17)
    {
LABEL_20:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v20;
    }
    v11 = 0;
    if (v6 <= (uint64_t)v17)
      v12 = v17;
    else
      v12 = v6;
    v13 = v12 - v6;
    v14 = v18 - v6;
    v15 = v17 - v6;
    v16 = v19 + 16 * v6 + 40;
    while (v14 != v11)
    {
      if (v15 == v11)
        goto LABEL_20;
      if (v13 == v11)
        goto LABEL_24;
      objc_allocWithZone((Class)type metadata accessor for SRSmartRepliesPredictionItem());
      swift_bridgeObjectRetain();
      SRSmartRepliesPredictionItem.init(score:label:)();
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      result = specialized ContiguousArray._endMutation()();
      ++v11;
      v16 += 16;
      if (v14 == v11)
        goto LABEL_20;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
  return result;
}

uint64_t ServerRequestHandler.initializePurgeableModel(language:plistPath:espressoModelPath:vocabPath:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v9 = v8;
  v15 = v9[15];
  v16 = v9[17];
  v24 = v9[16];
  v25 = v9[14];
  v17 = v9[19];
  v18 = v9[21];
  v22 = v9[20];
  v23 = v9[18];
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v21 = v25;
  v26 = a1;
  LOBYTE(a1) = specialized != infix<A, B, C, D>(_:_:)(a1, a2, a3, a4, a5, a6, a7, a8, v21, v15, v24, v16, v23, v17, v22, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    v9[14] = v26;
    v9[15] = a2;
    v9[16] = a3;
    v9[17] = a4;
    v9[18] = a5;
    v9[19] = a6;
    v9[20] = a7;
    v9[21] = a8;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = v26;
    v19[3] = a2;
    v19[4] = a3;
    v19[5] = a4;
    v19[6] = a5;
    v19[7] = a6;
    v19[8] = a7;
    v19[9] = a8;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TUSLazyPurgeable<Result<InferenceBundle, SRSmartRepliesError>>);
    swift_allocObject();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9[22] = TUSLazyPurgeable.init(initialize:)();
    return swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t specialized != infix<A, B, C, D>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  BOOL v22;
  BOOL v23;
  BOOL v24;
  char v26;

  v22 = a1 == a9 && a2 == a10;
  if ((v22 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    && (a3 == a11 ? (v23 = a4 == a12) : (v23 = 0),
        (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
     && (a5 == a13 ? (v24 = a6 == a14) : (v24 = 0), v24 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)))
  {
    if (a7 == a15 && a8 == a16)
      v26 = 0;
    else
      v26 = _stringCompareWithSmolCheck(_:_:expecting:)() ^ 1;
  }
  else
  {
    v26 = 1;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v26 & 1;
}

uint64_t ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)(v9 + 120) = v14;
  *(_QWORD *)(v9 + 128) = v8;
  *(_QWORD *)(v9 + 112) = v13;
  *(_OWORD *)(v9 + 96) = v12;
  *(_QWORD *)(v9 + 80) = a7;
  *(_QWORD *)(v9 + 88) = a8;
  *(_QWORD *)(v9 + 64) = a5;
  *(_QWORD *)(v9 + 72) = a6;
  *(_QWORD *)(v9 + 48) = a3;
  *(_QWORD *)(v9 + 56) = a4;
  *(_QWORD *)(v9 + 32) = a1;
  *(_QWORD *)(v9 + 40) = a2;
  v10 = type metadata accessor for SRSmartRepliesError();
  *(_QWORD *)(v9 + 136) = v10;
  *(_QWORD *)(v9 + 144) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 152) = swift_task_alloc();
  *(_QWORD *)(v9 + 160) = swift_task_alloc();
  *(_QWORD *)(v9 + 168) = swift_task_alloc();
  *(_QWORD *)(v9 + 176) = swift_task_alloc();
  *(_QWORD *)(v9 + 184) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
  *(_QWORD *)(v9 + 192) = swift_task_alloc();
  *(_QWORD *)(v9 + 200) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _QWORD *v7;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(_QWORD, uint64_t (*)@<X0>(uint64_t@<X0>, _QWORD *@<X8>), uint64_t, _QWORD);
  void (*v33)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 128);
  ServerRequestHandler.initializePurgeableModel(language:plistPath:espressoModelPath:vocabPath:)(*(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 112));
  v2 = *(_QWORD *)(v1 + 176);
  *(_QWORD *)(v0 + 208) = v2;
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 120);
    v4 = *(_QWORD *)(v0 + 32);
    v5 = swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v5;
    v6 = *(_OWORD *)(v0 + 40);
    *(_QWORD *)(v5 + 16) = v4;
    *(_OWORD *)(v5 + 24) = v6;
    *(_QWORD *)(v5 + 40) = v3;
    v32 = (uint64_t (*)(_QWORD, uint64_t (*)@<X0>(uint64_t@<X0>, _QWORD *@<X8>), uint64_t, _QWORD))(**(int **)(*(_QWORD *)v2 + 200) + *(_QWORD *)(*(_QWORD *)v2 + 200));
    swift_retain();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 224) = v7;
    *v7 = v0;
    v7[1] = ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:);
    return v32(*(_QWORD *)(v0 + 200), partial apply for closure #1 in ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:), v5, *(_QWORD *)(v0 + 184));
  }
  else
  {
    v9 = *(_QWORD **)(v0 + 160);
    v10 = *(_QWORD *)(v0 + 144);
    *v9 = 0xD000000000000052;
    v9[1] = 0x800000024767E9B0;
    (*(void (**)(void))(v10 + 104))();
    if (one-time initialization token for standard != -1)
      swift_once();
    v11 = *(_QWORD *)(v0 + 152);
    v12 = *(_QWORD *)(v0 + 160);
    v13 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 144);
    v15 = type metadata accessor for Logger();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.standard);
    v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16);
    v16(v11, v12, v13);
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.fault.getter();
    v19 = os_log_type_enabled(v17, v18);
    v21 = *(_QWORD *)(v0 + 144);
    v20 = *(_QWORD *)(v0 + 152);
    v22 = *(_QWORD *)(v0 + 136);
    if (v19)
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v33 = v16;
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138412290;
      lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
      swift_allocError();
      v33(v25, v20, v22);
      v26 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 16) = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v24 = v26;
      v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
      v27(v20, v22);
      _os_log_impl(&dword_24766C000, v17, v18, "Internal error: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      v28 = v24;
      v16 = v33;
      MEMORY[0x24957F624](v28, -1, -1);
      MEMORY[0x24957F624](v23, -1, -1);
    }
    else
    {
      v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
      v27(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    }

    v29 = *(_QWORD *)(v0 + 160);
    v30 = *(_QWORD *)(v0 + 136);
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v16(v31, v29, v30);
    swift_willThrow();
    v27(v29, v30);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;
  int EnumCaseMultiPayload;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t);
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  outlined init with copy of Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 192), &demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v2 = *(uint64_t **)(v0 + 192);
  if (EnumCaseMultiPayload == 1)
  {
    (*(void (**)(_QWORD, uint64_t *, _QWORD))(*(_QWORD *)(v0 + 144) + 32))(*(_QWORD *)(v0 + 176), v2, *(_QWORD *)(v0 + 136));
    if (one-time initialization token for standard != -1)
      swift_once();
    v3 = *(_QWORD *)(v0 + 168);
    v4 = *(_QWORD *)(v0 + 176);
    v5 = *(_QWORD *)(v0 + 136);
    v6 = *(_QWORD *)(v0 + 144);
    v7 = type metadata accessor for Logger();
    __swift_project_value_buffer(v7, (uint64_t)static Logger.standard);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    v8(v3, v4, v5);
    v9 = Logger.logObject.getter();
    v10 = static os_log_type_t.error.getter();
    v11 = os_log_type_enabled(v9, v10);
    v12 = *(_QWORD *)(v0 + 168);
    v13 = *(_QWORD *)(v0 + 136);
    v14 = *(_QWORD *)(v0 + 144);
    if (v11)
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v30 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138412290;
      lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
      swift_allocError();
      v8(v16, v12, v13);
      v17 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 24) = v17;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v30 = v17;
      v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v18(v12, v13);
      _os_log_impl(&dword_24766C000, v9, v10, "Unable to run SmartReplies inference due to: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      MEMORY[0x24957F624](v30, -1, -1);
      MEMORY[0x24957F624](v15, -1, -1);
    }
    else
    {
      v18 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
      v18(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 136));
    }

    v26 = *(_QWORD *)(v0 + 200);
    v27 = *(_QWORD *)(v0 + 176);
    v28 = *(_QWORD *)(v0 + 136);
    lazy protocol witness table accessor for type SRSmartRepliesError and conformance SRSmartRepliesError();
    swift_allocError();
    v8(v29, v27, v28);
    swift_willThrow();
    swift_release();
    v18(v27, v28);
    outlined destroy of TaskPriority?(v26, &demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v19 = *v2;
    if (one-time initialization token for standard != -1)
      swift_once();
    v20 = type metadata accessor for Logger();
    __swift_project_value_buffer(v20, (uint64_t)static Logger.standard);
    v21 = Logger.logObject.getter();
    v22 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_24766C000, v21, v22, "Completed SmartReplies inference run", v23, 2u);
      MEMORY[0x24957F624](v23, -1, -1);
    }
    v24 = *(_QWORD *)(v0 + 200);

    swift_release();
    outlined destroy of TaskPriority?(v24, &demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v19);
  }
}

uint64_t closure #1 in ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[6];

  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<InferenceBundle, SRSmartRepliesError>);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (_OWORD *)((char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  outlined init with copy of Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>(a1, (uint64_t)v14, &demangling cache variable for type metadata for Result<InferenceBundle, SRSmartRepliesError>);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = type metadata accessor for SRSmartRepliesError();
    (*(void (**)(_QWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(a6, v14, v15);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Result<[String : [SRSmartRepliesPredictionItem]], SRSmartRepliesError>);
    return swift_storeEnumTagMultiPayload();
  }
  else
  {
    v17 = v14[3];
    v20[2] = v14[2];
    v20[3] = v17;
    v18 = v14[5];
    v20[4] = v14[4];
    v20[5] = v18;
    v19 = v14[1];
    v20[0] = *v14;
    v20[1] = v19;
    type metadata accessor for ServerRequestHandler();
    static ServerRequestHandler.runInference(message:conversationTurns:inferenceBundle:heads:)(a2, a3, a4, (uint64_t *)v20, a5, a6);
    return outlined release of InferenceBundle((uint64_t)v20);
  }
}

uint64_t ServerRequestHandler.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t ServerRequestHandler.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

_QWORD *ServerRequestHandler.init()()
{
  _QWORD *v0;

  swift_defaultActor_initialize();
  v0[14] = 0;
  v0[15] = 0xE000000000000000;
  v0[16] = 0;
  v0[17] = 0xE000000000000000;
  v0[18] = 0;
  v0[19] = 0xE000000000000000;
  v0[20] = 0;
  v0[21] = 0xE000000000000000;
  v0[22] = 0;
  return v0;
}

uint64_t ServerRequestHandler.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t protocol witness for Actor.unownedExecutor.getter in conformance ServerRequestHandler()
{
  uint64_t v0;

  return v0;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
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
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v21 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized MutableCollection<>.sort(by:)(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    specialized _ContiguousArrayBuffer._consumeAndCreateNew()();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(v6);
  return specialized ContiguousArray._endMutation()();
}

void specialized UnsafeMutableBufferPointer._stableSortImpl(by:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  Swift::Int v32;
  Swift::Int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  Swift::Int v43;
  void *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  unsigned int v50;
  uint64_t v51;
  Swift::Int v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  char *v59;
  id *v60;
  char *v61;
  char v62;
  void (*v63)(char *, uint64_t);
  char v64;
  char *v65;
  void *v66;
  id v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  Swift::Int v75;
  Swift::Int v76;
  uint64_t *v77;
  uint64_t v78;
  Swift::Int v79;
  char *v80;
  uint64_t v81;
  void *v82;
  char *v83;
  char *v84;
  void *v85;
  id v86;
  id v87;
  unsigned int (*v88)(char *, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  void (*v91)(char *, char *, uint64_t);
  char *v92;
  char *v93;
  char *v94;
  char *v95;
  char v96;
  void (*v97)(char *, uint64_t);
  void *v98;
  char *v99;
  char *v100;
  unint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  char *v105;
  unint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  BOOL v117;
  unint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  BOOL v127;
  uint64_t v128;
  char v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  BOOL v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  char *v146;
  char *v147;
  uint64_t v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  unint64_t v153;
  char *v154;
  uint64_t v155;
  unint64_t v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  char *v162;
  char *v163;
  char *v164;
  unint64_t v165;
  uint64_t *v166;
  uint64_t v167;
  uint64_t v168;
  char *v169;
  char *v170;
  char *v171;
  char *v172;
  char *v173;
  Swift::Int v174;
  uint64_t v175;
  char *v176;
  char *v177;
  char *v178;
  char *v179;
  char *v180;
  char *v181;
  char *v182;
  char *v183;
  char *v184;
  id *v185;
  uint64_t v186;
  char *v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  char *v192;
  char *v193;
  id v194;
  uint64_t v195;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v188 = (char *)&v166 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v166 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v166 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v181 = (char *)&v166 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v166 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v166 - v17;
  v190 = type metadata accessor for Date();
  v175 = *(_QWORD *)(v190 - 8);
  v19 = MEMORY[0x24BDAC7A8](v190);
  v187 = (char *)&v166 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v166 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v176 = (char *)&v166 - v25;
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (char *)&v166 - v27;
  v29 = MEMORY[0x24BDAC7A8](v26);
  v170 = (char *)&v166 - v30;
  MEMORY[0x24BDAC7A8](v29);
  v172 = (char *)&v166 - v31;
  v32 = a1[1];
  v33 = _minimumMergeRunLength(_:)(v32);
  if (v33 < v32)
  {
    if (v32 >= 0)
      v34 = v32;
    else
      v34 = v32 + 1;
    if (v32 >= -1)
    {
      v169 = v16;
      v179 = v11;
      v174 = v33;
      v186 = v1;
      v166 = a1;
      if (v32 < 2)
      {
        v37 = (char *)MEMORY[0x24BEE4AF8];
        v195 = MEMORY[0x24BEE4AF8];
        v185 = (id *)((MEMORY[0x24BEE4AF8] & 0xFFFFFFFFFFFFFF8) + 32);
        if (v32 != 1)
        {
          v42 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
          if (v42 < 2)
            goto LABEL_130;
          goto LABEL_117;
        }
      }
      else
      {
        v35 = v34 >> 1;
        type metadata accessor for SRSmartRepliesConversationTurn();
        v36 = static Array._allocateBufferUninitialized(minimumCapacity:)();
        *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) = v35;
        v185 = (id *)((v36 & 0xFFFFFFFFFFFFFF8) + 32);
        v195 = v36;
      }
      v38 = *a1;
      v167 = *a1 + 16;
      v168 = v38 - 8;
      v177 = (char *)MEMORY[0x24BEE4AF8];
      v39 = v8;
      v40 = 0;
      v191 = v8;
      v171 = v18;
      v173 = v23;
      v178 = v28;
      v41 = v38;
      v182 = (char *)v32;
      v189 = v38;
LABEL_15:
      v43 = v40 + 1;
      v183 = (char *)v40;
      if (v40 + 1 >= v32)
      {
        v52 = v174;
        v51 = v175;
      }
      else
      {
        v44 = *(void **)(v41 + 8 * v40);
        v45 = (char *)*(id *)(v41 + 8 * v43);
        v46 = v44;
        SRSmartRepliesConversationTurn.timestamp.getter();
        v47 = v175;
        v48 = *(char **)(v175 + 48);
        v49 = v190;
        v50 = ((uint64_t (*)(char *, uint64_t, uint64_t))v48)(v18, 1, v190);
        v180 = v48;
        if (v50 == 1)
        {
          outlined destroy of TaskPriority?((uint64_t)v18, (uint64_t *)&demangling cache variable for type metadata for Date?);
          LODWORD(v194) = 0;
          v51 = v47;
          v39 = v191;
        }
        else
        {
          v193 = v45;
          v53 = *(void (**)(char *, char *, uint64_t))(v47 + 32);
          v54 = v172;
          v53(v172, v18, v49);
          v55 = v46;
          v56 = (uint64_t)v169;
          v192 = v55;
          SRSmartRepliesConversationTurn.timestamp.getter();
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v48)(v56, 1, v49) == 1)
          {
            (*(void (**)(char *, uint64_t))(v47 + 8))(v54, v49);
            outlined destroy of TaskPriority?(v56, (uint64_t *)&demangling cache variable for type metadata for Date?);
            LODWORD(v194) = 0;
          }
          else
          {
            v57 = v170;
            v53(v170, (char *)v56, v49);
            LODWORD(v194) = static Date.< infix(_:_:)();
            v58 = *(void (**)(char *, uint64_t))(v47 + 8);
            v58(v57, v49);
            v58(v54, v49);
          }
          v51 = v47;
          v39 = v191;
          v46 = v192;
          v45 = v193;
        }

        v32 = (Swift::Int)v182;
        v40 = (uint64_t)v183;
        v43 = (Swift::Int)(v183 + 2);
        v59 = v180;
        if ((uint64_t)(v183 + 2) < (uint64_t)v182)
        {
          v192 = v183 + 2;
          v60 = (id *)(v167 + 8 * (_QWORD)v183);
          while (1)
          {
            v65 = v39;
            v66 = *(v60 - 1);
            v67 = *v60;
            v68 = v66;
            v69 = (uint64_t)v181;
            SRSmartRepliesConversationTurn.timestamp.getter();
            v70 = v190;
            if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v59)(v69, 1, v190) == 1)
            {
              outlined destroy of TaskPriority?(v69, (uint64_t *)&demangling cache variable for type metadata for Date?);

              v39 = v65;
              if ((v194 & 1) != 0)
                goto LABEL_32;
            }
            else
            {
              v71 = v178;
              v184 = *(char **)(v51 + 32);
              ((void (*)(char *, uint64_t, uint64_t))v184)(v178, v69, v70);
              v72 = (uint64_t)v179;
              v193 = v68;
              SRSmartRepliesConversationTurn.timestamp.getter();
              if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v59)(v72, 1, v70) == 1)
              {
                (*(void (**)(char *, uint64_t))(v51 + 8))(v71, v70);
                outlined destroy of TaskPriority?(v72, (uint64_t *)&demangling cache variable for type metadata for Date?);

                v39 = v191;
                v59 = v180;
                if ((v194 & 1) != 0)
                {
LABEL_32:
                  v23 = v173;
                  v32 = (Swift::Int)v182;
                  v40 = (uint64_t)v183;
                  v52 = v174;
                  v41 = v189;
                  v43 = (Swift::Int)v192;
                  goto LABEL_37;
                }
              }
              else
              {
                v61 = v176;
                ((void (*)(char *, uint64_t, uint64_t))v184)(v176, v72, v70);
                v62 = static Date.< infix(_:_:)();
                v63 = *(void (**)(char *, uint64_t))(v51 + 8);
                v63(v61, v70);
                v63(v71, v70);

                v64 = v194 ^ v62;
                v39 = v191;
                v59 = v180;
                if ((v64 & 1) != 0)
                {
                  v23 = v173;
                  v32 = (Swift::Int)v182;
                  v40 = (uint64_t)v183;
                  v41 = v189;
                  v43 = (Swift::Int)v192;
                  goto LABEL_36;
                }
              }
            }
            ++v60;
            if (v182 == ++v192)
            {
              v32 = (Swift::Int)v182;
              v40 = (uint64_t)v183;
              v43 = (Swift::Int)v182;
              v23 = v173;
              v41 = v189;
              goto LABEL_36;
            }
          }
        }
        v41 = v189;
LABEL_36:
        v52 = v174;
        if ((v194 & 1) != 0)
        {
LABEL_37:
          if (v43 < v40)
            goto LABEL_154;
          if (v40 < v43)
          {
            v73 = (uint64_t *)(v168 + 8 * v43);
            v74 = v40;
            v75 = v43;
            v76 = v74;
            v77 = (uint64_t *)(v41 + 8 * v74);
            do
            {
              if (v76 != --v75)
              {
                if (!v41)
                  goto LABEL_159;
                v78 = *v77;
                *v77 = *v73;
                *v73 = v78;
              }
              ++v76;
              --v73;
              ++v77;
            }
            while (v76 < v75);
            v40 = (uint64_t)v183;
          }
        }
      }
      if (v43 >= v32)
        goto LABEL_68;
      if (__OFSUB__(v43, v40))
        goto LABEL_152;
      if (v43 - v40 >= v52)
        goto LABEL_68;
      if (__OFADD__(v40, v52))
        goto LABEL_155;
      if (v40 + v52 >= v32)
        v79 = v32;
      else
        v79 = v40 + v52;
      if (v79 >= v40)
      {
        if (v43 == v79)
          goto LABEL_68;
        v80 = (char *)(v168 + 8 * v43);
        v180 = (char *)v79;
LABEL_58:
        v192 = (char *)v43;
        v82 = *(void **)(v41 + 8 * v43);
        v83 = (char *)v40;
        v184 = v80;
        v84 = v80;
        while (1)
        {
          v193 = v83;
          v85 = *(void **)v84;
          v86 = v82;
          v87 = v85;
          v194 = v86;
          SRSmartRepliesConversationTurn.timestamp.getter();
          v88 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v51 + 48);
          v89 = v190;
          if (v88(v39, 1, v190) == 1)
            break;
          v90 = v51;
          v91 = *(void (**)(char *, char *, uint64_t))(v51 + 32);
          v91(v23, v39, v89);
          v92 = v23;
          v93 = v188;
          SRSmartRepliesConversationTurn.timestamp.getter();
          v94 = v93;
          if (v88(v93, 1, v89) == 1)
          {
            (*(void (**)(char *, uint64_t))(v90 + 8))(v92, v89);
            v81 = (uint64_t)v93;
            v51 = v90;
            v23 = v92;
            v39 = v191;
            v41 = v189;
            goto LABEL_56;
          }
          v95 = v187;
          v91(v187, v94, v89);
          v96 = static Date.< infix(_:_:)();
          v97 = *(void (**)(char *, uint64_t))(v90 + 8);
          v97(v95, v89);
          v97(v92, v89);

          v51 = v90;
          v23 = v92;
          if ((v96 & 1) == 0)
          {
            v39 = v191;
            v41 = v189;
LABEL_57:
            v43 = (Swift::Int)(v192 + 1);
            v40 = (uint64_t)v183;
            v80 = v184 + 8;
            if (v192 + 1 != v180)
              goto LABEL_58;
            v43 = (Swift::Int)v180;
LABEL_68:
            v99 = v177;
            if (v43 < v40)
              goto LABEL_147;
            v100 = v39;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v99 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *((_QWORD *)v99 + 2) + 1, 1, v99);
            v102 = *((_QWORD *)v99 + 2);
            v101 = *((_QWORD *)v99 + 3);
            v42 = v102 + 1;
            v103 = v183;
            if (v102 >= v101 >> 1)
            {
              v154 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v101 > 1), v102 + 1, 1, v99);
              v103 = v183;
              v99 = v154;
            }
            *((_QWORD *)v99 + 2) = v42;
            v104 = v99 + 32;
            v105 = &v99[16 * v102 + 32];
            *(_QWORD *)v105 = v103;
            *((_QWORD *)v105 + 1) = v43;
            v192 = (char *)v43;
            if (v102)
            {
              v39 = v100;
              while (1)
              {
                v106 = v42 - 1;
                if (v42 >= 4)
                {
                  v111 = &v104[16 * v42];
                  v112 = *((_QWORD *)v111 - 8);
                  v113 = *((_QWORD *)v111 - 7);
                  v117 = __OFSUB__(v113, v112);
                  v114 = v113 - v112;
                  if (v117)
                    goto LABEL_136;
                  v116 = *((_QWORD *)v111 - 6);
                  v115 = *((_QWORD *)v111 - 5);
                  v117 = __OFSUB__(v115, v116);
                  v109 = v115 - v116;
                  v110 = v117;
                  if (v117)
                    goto LABEL_137;
                  v118 = v42 - 2;
                  v119 = &v104[16 * v42 - 32];
                  v121 = *(_QWORD *)v119;
                  v120 = *((_QWORD *)v119 + 1);
                  v117 = __OFSUB__(v120, v121);
                  v122 = v120 - v121;
                  if (v117)
                    goto LABEL_139;
                  v117 = __OFADD__(v109, v122);
                  v123 = v109 + v122;
                  if (v117)
                    goto LABEL_142;
                  if (v123 >= v114)
                  {
                    v141 = &v104[16 * v106];
                    v143 = *(_QWORD *)v141;
                    v142 = *((_QWORD *)v141 + 1);
                    v117 = __OFSUB__(v142, v143);
                    v144 = v142 - v143;
                    if (v117)
                      goto LABEL_146;
                    v134 = v109 < v144;
                    goto LABEL_106;
                  }
                }
                else
                {
                  if (v42 != 3)
                  {
                    v135 = *((_QWORD *)v99 + 4);
                    v136 = *((_QWORD *)v99 + 5);
                    v117 = __OFSUB__(v136, v135);
                    v128 = v136 - v135;
                    v129 = v117;
                    goto LABEL_100;
                  }
                  v108 = *((_QWORD *)v99 + 4);
                  v107 = *((_QWORD *)v99 + 5);
                  v117 = __OFSUB__(v107, v108);
                  v109 = v107 - v108;
                  v110 = v117;
                }
                if ((v110 & 1) != 0)
                  goto LABEL_138;
                v118 = v42 - 2;
                v124 = &v104[16 * v42 - 32];
                v126 = *(_QWORD *)v124;
                v125 = *((_QWORD *)v124 + 1);
                v127 = __OFSUB__(v125, v126);
                v128 = v125 - v126;
                v129 = v127;
                if (v127)
                  goto LABEL_141;
                v130 = &v104[16 * v106];
                v132 = *(_QWORD *)v130;
                v131 = *((_QWORD *)v130 + 1);
                v117 = __OFSUB__(v131, v132);
                v133 = v131 - v132;
                if (v117)
                  goto LABEL_144;
                if (__OFADD__(v128, v133))
                  goto LABEL_145;
                if (v128 + v133 >= v109)
                {
                  v134 = v109 < v133;
LABEL_106:
                  if (v134)
                    v106 = v118;
                  goto LABEL_108;
                }
LABEL_100:
                if ((v129 & 1) != 0)
                  goto LABEL_140;
                v137 = &v104[16 * v106];
                v139 = *(_QWORD *)v137;
                v138 = *((_QWORD *)v137 + 1);
                v117 = __OFSUB__(v138, v139);
                v140 = v138 - v139;
                if (v117)
                  goto LABEL_143;
                if (v140 < v128)
                  goto LABEL_14;
LABEL_108:
                v145 = v106 - 1;
                if (v106 - 1 >= v42)
                {
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
LABEL_154:
                  __break(1u);
LABEL_155:
                  __break(1u);
                  goto LABEL_156;
                }
                if (!v41)
                  goto LABEL_158;
                v146 = v99;
                v147 = &v104[16 * v145];
                v148 = *(_QWORD *)v147;
                v149 = &v104[16 * v106];
                v150 = *((_QWORD *)v149 + 1);
                v151 = v186;
                specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v41 + 8 * *(_QWORD *)v147), (id *)(v41 + 8 * *(_QWORD *)v149), (char *)(v41 + 8 * v150), v185);
                v186 = v151;
                if (v151)
                  goto LABEL_130;
                if (v150 < v148)
                  goto LABEL_133;
                if (v106 > *((_QWORD *)v146 + 2))
                  goto LABEL_134;
                v152 = v146;
                *(_QWORD *)v147 = v148;
                *(_QWORD *)&v104[16 * v145 + 8] = v150;
                v153 = *((_QWORD *)v146 + 2);
                if (v106 >= v153)
                  goto LABEL_135;
                v99 = v152;
                v42 = v153 - 1;
                memmove(&v104[16 * v106], v149 + 16, 16 * (v153 - 1 - v106));
                *((_QWORD *)v99 + 2) = v153 - 1;
                v39 = v191;
                if (v153 <= 2)
                  goto LABEL_14;
              }
            }
            v42 = 1;
            v39 = v100;
LABEL_14:
            v177 = v99;
            v32 = (Swift::Int)v182;
            v40 = (uint64_t)v192;
            v18 = v171;
            v23 = v173;
            if ((uint64_t)v192 >= (uint64_t)v182)
            {
              v37 = v177;
              if (v42 < 2)
              {
LABEL_130:
                swift_bridgeObjectRelease();
                *(_QWORD *)((v195 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
                specialized Array._endMutation()();
                swift_bridgeObjectRelease();
                return;
              }
LABEL_117:
              v155 = *v166;
              while (1)
              {
                v156 = v42 - 2;
                if (v42 < 2)
                  goto LABEL_148;
                if (!v155)
                  goto LABEL_160;
                v157 = v37;
                v158 = v37 + 32;
                v159 = *(_QWORD *)&v37[16 * v156 + 32];
                v160 = *(_QWORD *)&v37[16 * v42 + 24];
                v161 = v186;
                specialized _merge<A>(low:mid:high:buffer:by:)((char *)(v155 + 8 * v159), (id *)(v155 + 8 * *(_QWORD *)&v158[16 * v42 - 16]), (char *)(v155 + 8 * v160), v185);
                v186 = v161;
                if (v161)
                  goto LABEL_130;
                if (v160 < v159)
                  goto LABEL_149;
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v157 = specialized _ArrayBuffer._consumeAndCreateNew()((uint64_t)v157);
                if (v156 >= *((_QWORD *)v157 + 2))
                  goto LABEL_150;
                v162 = v157;
                v163 = v157 + 32;
                v164 = &v157[16 * v156 + 32];
                *(_QWORD *)v164 = v159;
                *((_QWORD *)v164 + 1) = v160;
                v165 = *((_QWORD *)v157 + 2);
                if (v42 > v165)
                  goto LABEL_151;
                v37 = v162;
                memmove(&v163[16 * v42 - 16], &v163[16 * v42], 16 * (v165 - v42));
                *((_QWORD *)v37 + 2) = v165 - 1;
                v42 = v165 - 1;
                if (v165 <= 2)
                  goto LABEL_130;
              }
            }
            goto LABEL_15;
          }
          v39 = v191;
          v41 = v189;
          if (!v189)
            goto LABEL_157;
          v98 = *(void **)v84;
          v82 = (void *)*((_QWORD *)v84 + 1);
          *(_QWORD *)v84 = v82;
          *((_QWORD *)v84 + 1) = v98;
          v84 -= 8;
          v83 = v193 + 1;
          if (v192 == v193 + 1)
            goto LABEL_57;
        }
        v81 = (uint64_t)v39;
LABEL_56:
        outlined destroy of TaskPriority?(v81, (uint64_t *)&demangling cache variable for type metadata for Date?);

        goto LABEL_57;
      }
LABEL_156:
      __break(1u);
LABEL_157:
      __break(1u);
LABEL_158:
      __break(1u);
LABEL_159:
      __break(1u);
LABEL_160:
      __break(1u);
    }
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
    return;
  }
  if (v32 < 0)
    goto LABEL_153;
  if (v32)
    specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(0, v32, 1, a1);
}

void specialized MutableCollection<>._insertionSort(within:sortedEnd:by:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;

  v34 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v38 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v32 - v10;
  v39 = type metadata accessor for Date();
  v12 = *(_QWORD *)(v39 - 8);
  v13 = MEMORY[0x24BDAC7A8](v39);
  v36 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v33 = a2;
  if (a3 != a2)
  {
    v16 = (char *)&v32 - v15;
    v40 = *a4;
    v17 = v40 + 8 * a3 - 8;
    v37 = v11;
    while (2)
    {
      v19 = *(void **)(v40 + 8 * a3);
      v41 = a3;
      v42 = v34;
      v35 = v17;
      while (1)
      {
        v20 = *(void **)v17;
        v21 = v19;
        v22 = v20;
        v43 = v21;
        SRSmartRepliesConversationTurn.timestamp.getter();
        v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
        v24 = v39;
        if (v23(v11, 1, v39) == 1)
          break;
        v25 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
        v25(v16, v11, v24);
        v26 = v38;
        SRSmartRepliesConversationTurn.timestamp.getter();
        v27 = v26;
        if (v23(v26, 1, v24) == 1)
        {
          (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v24);
          v18 = (uint64_t)v26;
          a3 = v41;
          v11 = v37;
          goto LABEL_5;
        }
        v28 = v36;
        v25(v36, v27, v24);
        v29 = static Date.< infix(_:_:)();
        v30 = *(void (**)(char *, uint64_t))(v12 + 8);
        v30(v28, v24);
        v30(v16, v24);

        a3 = v41;
        v11 = v37;
        if ((v29 & 1) == 0)
          goto LABEL_6;
        if (!v40)
        {
          __break(1u);
          return;
        }
        v31 = *(void **)v17;
        v19 = *(void **)(v17 + 8);
        *(_QWORD *)v17 = v19;
        *(_QWORD *)(v17 + 8) = v31;
        v17 -= 8;
        if (a3 == ++v42)
          goto LABEL_6;
      }
      v18 = (uint64_t)v11;
LABEL_5:
      outlined destroy of TaskPriority?(v18, (uint64_t *)&demangling cache variable for type metadata for Date?);

LABEL_6:
      ++a3;
      v17 = v35 + 8;
      if (a3 == v33)
        return;
      continue;
    }
  }
}

uint64_t specialized _merge<A>(low:mid:high:buffer:by:)(char *a1, id *a2, char *a3, id *a4)
{
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void **v29;
  char *v30;
  void **v31;
  void *v32;
  id v33;
  id v34;
  _QWORD *v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  int v38;
  uint64_t v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  id *v43;
  unint64_t v44;
  char *v45;
  uint64_t v46;
  char v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  id *v54;
  _QWORD *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t (*v60)(char *, uint64_t, uint64_t);
  uint64_t v61;
  int v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  id *v67;
  char *v68;
  void (*v69)(char *, uint64_t);
  uint64_t result;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  char *v76;
  void (*v77)(char *, char *, uint64_t);
  id *v78;
  char *v79;
  void **v80;
  _QWORD *v81;
  char *v82;
  char *v83;
  uint64_t v84;
  id *v85;
  char *v86;
  void **v87;
  id *v88;

  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v75 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v76 = (char *)&v71 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v77 = (void (*)(char *, char *, uint64_t))((char *)&v71 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v71 - v15;
  v84 = type metadata accessor for Date();
  v81 = *(_QWORD **)(v84 - 8);
  v17 = MEMORY[0x24BDAC7A8](v84);
  v73 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v72 = (char *)&v71 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v78 = a4;
  v79 = (char *)&v71 - v23;
  v24 = (char *)a2 - a1;
  v25 = (char *)a2 - a1 + 7;
  if ((char *)a2 - a1 >= 0)
    v25 = (char *)a2 - a1;
  v26 = v25 >> 3;
  v82 = a1;
  v83 = a3;
  v27 = a3 - (char *)a2;
  v28 = v27 / 8;
  v88 = (id *)a1;
  v87 = a4;
  if (v25 >> 3 >= v27 / 8)
  {
    v74 = v22;
    if (v27 < -7)
      goto LABEL_51;
    v50 = (char *)v78;
    v51 = v76;
    if (v78 != a2 || &a2[v28] <= v78)
      memmove(v78, a2, 8 * v28);
    v52 = &v50[8 * v28];
    v86 = v52;
    v88 = a2;
    if (v27 < 8 || v82 >= (char *)a2)
    {
LABEL_50:
      specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)((void **)&v88, (const void **)&v87, &v86);
      return 1;
    }
    v53 = v83 - 8;
    v54 = a2;
    v55 = v81;
    while (1)
    {
      v85 = a2;
      v79 = v53 + 8;
      v80 = (void **)v52;
      v57 = (void *)*((_QWORD *)v52 - 1);
      v52 -= 8;
      v56 = v57;
      v58 = *--v54;
      v59 = v56;
      v83 = v58;
      SRSmartRepliesConversationTurn.timestamp.getter();
      v60 = (uint64_t (*)(char *, uint64_t, uint64_t))v55[6];
      v61 = v84;
      v62 = v60(v51, 1, v84);
      v63 = (uint64_t)v51;
      if (v62 == 1)
        goto LABEL_37;
      v64 = v74;
      v77 = (void (*)(char *, char *, uint64_t))v55[4];
      v77(v74, v51, v61);
      v65 = v75;
      SRSmartRepliesConversationTurn.timestamp.getter();
      v66 = v84;
      if (v60(v65, 1, v84) == 1)
        break;
      v68 = v73;
      v77(v73, v65, v66);
      LODWORD(v77) = static Date.< infix(_:_:)();
      v69 = (void (*)(char *, uint64_t))v55[1];
      v69(v68, v66);
      v69(v64, v66);

      v50 = (char *)v78;
      v51 = v76;
      if ((v77 & 1) == 0)
        goto LABEL_38;
      v52 = (char *)v80;
      v67 = (id *)v82;
      if (v79 != (char *)v85 || v53 >= (char *)v85)
        *(_QWORD *)v53 = *v54;
      v88 = v54;
      if (v52 <= v50)
        goto LABEL_50;
LABEL_43:
      v53 -= 8;
      a2 = v54;
      if (v54 <= v67)
        goto LABEL_50;
    }
    ((void (*)(char *, uint64_t))v55[1])(v64, v66);
    v63 = (uint64_t)v65;
    v50 = (char *)v78;
    v51 = v76;
LABEL_37:
    outlined destroy of TaskPriority?(v63, (uint64_t *)&demangling cache variable for type metadata for Date?);

LABEL_38:
    v86 = v52;
    v67 = (id *)v82;
    v54 = v85;
    if (v79 < (char *)v80 || v53 >= (char *)v80 || v79 != (char *)v80)
      *(_QWORD *)v53 = *(_QWORD *)v52;
    if (v52 <= v50)
      goto LABEL_50;
    goto LABEL_43;
  }
  if (v24 >= -7)
  {
    v29 = v78;
    v30 = v79;
    v31 = (void **)v82;
    if (v78 != (id *)v82 || &v82[8 * v26] <= (char *)v78)
      memmove(v78, v82, 8 * v26);
    v80 = &v29[v26];
    v86 = (char *)v80;
    if (v24 >= 8 && a2 < (id *)v83)
    {
      v74 = v16;
      while (1)
      {
        v85 = a2;
        v32 = *v29;
        v33 = *a2;
        v34 = v32;
        SRSmartRepliesConversationTurn.timestamp.getter();
        v35 = v81;
        v36 = (uint64_t (*)(char *, uint64_t, uint64_t))v81[6];
        v37 = v84;
        v38 = v36(v16, 1, v84);
        v39 = (uint64_t)v16;
        if (v38 == 1)
          goto LABEL_14;
        v82 = (char *)v31;
        v40 = (void (*)(char *, char *, uint64_t))v35[4];
        v40(v30, v16, v37);
        v41 = (char *)v77;
        SRSmartRepliesConversationTurn.timestamp.getter();
        v42 = v84;
        if (v36(v41, 1, v84) == 1)
          break;
        v45 = v72;
        v40(v72, v41, v42);
        v46 = v42;
        v47 = static Date.< infix(_:_:)();
        v48 = (void (*)(char *, uint64_t))v35[1];
        v49 = v45;
        v30 = v79;
        v48(v49, v46);
        v48(v30, v46);

        v31 = (void **)v82;
        v16 = v74;
        if ((v47 & 1) != 0)
        {
          v44 = (unint64_t)(v85 + 1);
          if (v82 < (char *)v85 || (unint64_t)v82 >= v44 || v82 != (char *)v85)
            *(_QWORD *)v82 = *v85;
          v30 = v79;
          goto LABEL_18;
        }
LABEL_15:
        v43 = v85;
        if (v31 != v29)
          *v31 = *v29;
        v87 = ++v29;
        v44 = (unint64_t)v43;
LABEL_18:
        v88 = ++v31;
        if (v29 < v80)
        {
          a2 = (id *)v44;
          if (v44 < (unint64_t)v83)
            continue;
        }
        goto LABEL_50;
      }
      ((void (*)(char *, uint64_t))v35[1])(v30, v42);
      v39 = (uint64_t)v41;
      v31 = (void **)v82;
      v16 = v74;
LABEL_14:
      outlined destroy of TaskPriority?(v39, (uint64_t *)&demangling cache variable for type metadata for Date?);

      goto LABEL_15;
    }
    goto LABEL_50;
  }
LABEL_51:
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Range<Int>>);
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

char *specialized $defer #1 <A>() in _merge<A>(low:mid:high:buffer:by:)(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *specialized _ArrayBuffer._consumeAndCreateNew()(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void (*specialized protocol witness for Collection.subscript.read in conformance [A](void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = specialized Array.subscript.read(v6, a2, a3);
  return protocol witness for Collection.subscript.read in conformance [A]specialized ;
}

void protocol witness for Collection.subscript.read in conformance [A]specialized (_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*specialized Array.subscript.read(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24957F054](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return Array.subscript.readspecialized ;
  }
  __break(1u);
  return result;
}

void Array.subscript.readspecialized (id *a1)
{

}

void specialized _ArrayBuffer._consumeAndCreateNew()(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x24957F060);
}

void specialized _ContiguousArrayBuffer._consumeAndCreateNew()()
{
  JUMPOUT(0x24957F15CLL);
}

void specialized _ArrayBufferProtocol.init(copying:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  int64_t v3;
  uint64_t v4;
  _QWORD *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v3 = a3 >> 1;
  v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_13;
  if (!v4)
  {
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v3 >= a2)
      goto LABEL_6;
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
  v6 = (_QWORD *)swift_allocObject();
  v7 = _swift_stdlib_malloc_size(v6);
  v8 = v7 - 32;
  if (v7 < 32)
    v8 = v7 - 25;
  v6[2] = v4;
  v6[3] = (2 * (v8 >> 3)) | 1;
  if (v3 < a2)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
LABEL_6:
  type metadata accessor for SRSmartRepliesConversationTurn();
  swift_arrayInitWithCopy();
  if (__OFSUB__(0, a2))
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v9 = v6[2];
  v10 = __OFADD__(a2, v9);
  v11 = a2 + v9;
  if (v10)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v11 < a2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v11 < 0)
LABEL_17:
    __break(1u);
}

uint64_t specialized static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:)(unint64_t a1, uint64_t a2, unint64_t a3, id *a4, id *a5, uint64_t a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  id *v22;
  id *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  int v32;
  id *v33;
  unint64_t v34;
  uint64_t v35;
  id *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  id v43;
  void *v44;
  unint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  void *v58;
  id *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  id *v66;
  unint64_t v67;
  id *v68;
  id v69;
  id *v70;
  unint64_t v71;
  id *v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint8_t *v78;
  uint64_t result;
  uint64_t v80;
  uint64_t v81;
  id *v82;
  id *v83;
  id *v84;
  uint64_t v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  id v89;
  char *v90;
  id *v91;
  uint64_t v92;
  unint64_t v93;

  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (uint64_t)&v81 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (id *)type metadata accessor for Date();
  MEMORY[0x24BDAC7A8](v17);
  v20 = (id *)((char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (a3 >> 62)
    goto LABEL_99;
  v21 = a3 & 0xFFFFFFFFFFFFFF8;
  if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= 1uLL)
    goto LABEL_107;
  v90 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = v19;
  v22 = v17;
  v23 = a5;
  swift_bridgeObjectRetain();
  while (1)
  {
    v92 = v21;
    specialized MutableCollection<>.sort(by:)(&v92);
    v24 = v92;
    v93 = v92;
    if (v92 < 0 || (v92 & 0x4000000000000000) != 0)
      break;
    v25 = *(_QWORD *)(v92 + 16);
    swift_retain();
    if (!v25)
      goto LABEL_102;
LABEL_7:
    v26 = v25 - 1;
    if (__OFSUB__(v25, 1))
    {
      __break(1u);
LABEL_110:
      v27 = (id)MEMORY[0x24957F054](v26, v24);
      goto LABEL_12;
    }
    if ((v24 & 0xC000000000000001) != 0)
      goto LABEL_110;
    if ((v26 & 0x8000000000000000) != 0)
    {
      __break(1u);
LABEL_112:
      __break(1u);
      goto LABEL_113;
    }
    if (v26 >= *(_QWORD *)(v24 + 16))
      goto LABEL_112;
    v27 = *(id *)(v24 + 8 * v26 + 32);
LABEL_12:
    v28 = v27;
    swift_release();
    v87 = a4;
    v89 = v28;
    if (SRSmartRepliesConversationTurn.text.getter() == a1 && v29 == a2)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v30 = _stringCompareWithSmolCheck(_:_:expecting:)();
      swift_bridgeObjectRelease();
      if ((v30 & 1) == 0)
      {

        goto LABEL_103;
      }
    }
    SRSmartRepliesConversationTurn.timestamp.getter();
    v31 = v88;
    v32 = (*(uint64_t (**)(uint64_t, uint64_t, id *))(v88 + 48))(v16, 1, v22);
    v84 = v22;
    if (v32 == 1)
    {
      static Date.distantPast.getter();
      outlined destroy of TaskPriority?(v16, (uint64_t *)&demangling cache variable for type metadata for Date?);
    }
    else
    {
      (*(void (**)(char *, uint64_t, id *))(v31 + 32))(v90, v16, v22);
    }
    v33 = v23;
    v17 = v87;
    v34 = (unint64_t)v89;
    v35 = SRSmartRepliesConversationTurn.senderID.getter();
    if (v36)
      v37 = v35;
    else
      v37 = 0;
    if (v36)
      a4 = v36;
    else
      a4 = (id *)0xE000000000000000;
    v38 = String.count.getter();
    if (__OFSUB__(0, v38))
    {
      __break(1u);
    }
    else
    {
      a1 = v38;
      v85 = v37;
      v86 = a6;
      v92 = -v38;
      v34 = v93;
      v83 = v33;
      if (!(v93 >> 62))
      {
        v16 = *(_QWORD *)((v93 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v16)
          goto LABEL_48;
        v39 = v16 - 1;
        if (__OFSUB__(v16, 1))
          goto LABEL_118;
        goto LABEL_29;
      }
    }
    swift_bridgeObjectRetain();
    v80 = _CocoaArrayWrapper.endIndex.getter();
    v38 = swift_bridgeObjectRelease();
    if (!v80)
      goto LABEL_48;
    swift_bridgeObjectRetain();
    v16 = _CocoaArrayWrapper.endIndex.getter();
    v38 = swift_bridgeObjectRelease();
    v39 = v16 - 1;
    if (__OFSUB__(v16, 1))
    {
LABEL_118:
      __break(1u);
LABEL_119:
      __break(1u);
      result = swift_release();
      __break(1u);
      return result;
    }
LABEL_29:
    if (v39 >= 1)
    {
      v82 = a4;
      a5 = 0;
      a6 = v16 + 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        a4 = (id *)(v16 - 1);
        v40 = v93;
        if ((v93 & 0xC000000000000001) != 0)
        {
          v42 = MEMORY[0x24957F054](a5, v93);
          v43 = (id)MEMORY[0x24957F054](v16 - 1, v40);
        }
        else
        {
          v17 = *(id **)((v93 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (a5 >= v17)
            goto LABEL_93;
          v41 = *(id *)(v93 + 8 * (_QWORD)a5 + 32);
          if (a4 >= v17)
            goto LABEL_95;
          v42 = (uint64_t)v41;
          v43 = *(id *)(v40 + 8 * v16 + 24);
        }
        a2 = (uint64_t)v43;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v40 & 0x8000000000000000) != 0
          || (v40 & 0x4000000000000000) != 0)
        {
          specialized _ArrayBuffer._consumeAndCreateNew()(v40);
        }
        v44 = *(void **)((v40 & 0xFFFFFFFFFFFFFF8) + 8 * (_QWORD)a5 + 0x20);
        *(_QWORD *)((v40 & 0xFFFFFFFFFFFFFF8) + 8 * (_QWORD)a5 + 0x20) = a2;

        specialized Array._endMutation()();
        v45 = v93;
        if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
          || (v45 & 0x8000000000000000) != 0
          || (v45 & 0x4000000000000000) != 0)
        {
          specialized _ArrayBuffer._consumeAndCreateNew()(v45);
        }
        v20 = *(id **)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (a4 >= v20)
          goto LABEL_94;
        v46 = *(void **)((v45 & 0xFFFFFFFFFFFFFF8) + 8 * v16 + 0x18);
        *(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 8 * v16 + 0x18) = v42;

        v38 = specialized Array._endMutation()();
        if ((id *)a6 == a5)
          goto LABEL_96;
        a5 = (id *)((char *)a5 + 1);
        v47 = v16 - 2;
        --v16;
      }
      while ((uint64_t)a5 < v47);
      v34 = v93;
      a6 = v86;
      v17 = v87;
      a4 = v82;
    }
LABEL_48:
    a5 = (id *)&v81;
    MEMORY[0x24BDAC7A8](v38);
    *(&v81 - 8) = v85;
    *(&v81 - 7) = (uint64_t)a4;
    *(&v81 - 6) = (uint64_t)v90;
    *((double *)&v81 - 5) = a7;
    *(&v81 - 4) = (uint64_t)&v92;
    *(&v81 - 3) = a1;
    *(&v81 - 2) = (uint64_t)v17;
    swift_bridgeObjectRetain();
    specialized Collection.prefix(while:)((uint64_t (*)(id *))partial apply for closure #2 in static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:), (uint64_t)(&v81 - 10), v34);
    v49 = v48;
    v51 = v50;
    a1 = v52;
    swift_bridgeObjectRelease();
    v17 = (id *)(a1 >> 1);
    if (v51 == a1 >> 1)
    {
      v16 = v51;
      a2 = (uint64_t)v17 - v51;
      if (__OFSUB__(v17, v51))
        goto LABEL_88;
    }
    else
    {
      a6 = (uint64_t)v17 - 1;
      if (v51 < (uint64_t)v17 - 1)
      {
        v16 = v51;
        while (v51 >= v16)
        {
          v17 = (id *)(a1 >> 1);
          if (v51 >= (uint64_t)(a1 >> 1))
            break;
          if (a6 < v16 || a6 >= (uint64_t)v17)
            goto LABEL_90;
          v53 = *(void **)(v49 + 8 * a6);
          a5 = (id *)*(id *)(v49 + 8 * v51);
          a4 = v53;
          if ((a1 & 1) == 0 || (swift_isUniquelyReferenced_nonNull() & 1) == 0)
          {
            specialized _ArrayBufferProtocol.init(copying:)(v49, v16, a1);
            a2 = v54;
            v49 = v55;
            v16 = v56;
            a1 = v57;
            swift_unknownObjectRelease();
            v17 = (id *)(a1 >> 1);
          }
          if (v51 < v16 || v51 >= (uint64_t)v17)
            goto LABEL_91;
          v58 = *(void **)(v49 + 8 * v51);
          *(_QWORD *)(v49 + 8 * v51) = a4;

          if ((a1 & 1) == 0)
          {
            specialized _ArrayBufferProtocol.init(copying:)(v49, v16, a1);
            a4 = v59;
            v49 = v60;
            v16 = v61;
            a1 = v62;
            swift_unknownObjectRelease();
            v17 = (id *)(a1 >> 1);
          }
          if (a6 < v16 || a6 >= (uint64_t)v17)
            goto LABEL_92;
          v63 = *(void **)(v49 + 8 * a6);
          *(_QWORD *)(v49 + 8 * a6) = a5;

          if (++v51 >= --a6)
          {
            v17 = (id *)(a1 >> 1);
            goto LABEL_68;
          }
        }
LABEL_89:
        __break(1u);
LABEL_90:
        __break(1u);
LABEL_91:
        __break(1u);
LABEL_92:
        __break(1u);
LABEL_93:
        __break(1u);
LABEL_94:
        __break(1u);
LABEL_95:
        __break(1u);
LABEL_96:
        __break(1u);
        goto LABEL_97;
      }
      v16 = v51;
LABEL_68:
      a6 = v86;
      a2 = (uint64_t)v17 - v16;
      if (__OFSUB__(v17, v16))
      {
LABEL_88:
        __break(1u);
        goto LABEL_89;
      }
    }
    a5 = (id *)MEMORY[0x24BEE4AF8];
    if (!a2)
    {
LABEL_85:
      swift_bridgeObjectRelease();
      v91 = a5;
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
      lazy protocol witness table accessor for type [String] and conformance [A]();
      a1 = BidirectionalCollection<>.joined(separator:)();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      (*(void (**)(char *, id *))(v88 + 8))(v90, v84);
      return a1;
    }
    v91 = (id *)MEMORY[0x24BEE4AF8];
    swift_unknownObjectRetain();
    specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, a2 & ~(a2 >> 63), 0);
    if (a2 < 0)
      goto LABEL_119;
    a5 = v91;
    if (v16 <= (uint64_t)v17)
      v64 = (uint64_t)v17;
    else
      v64 = v16;
    a6 = v64 - v16;
    v17 = (id *)(v49 + 8 * v16);
    if ((a1 & 1) != 0)
    {
      while (a6)
      {
        v69 = *v17;
        v16 = SRSmartRepliesConversationTurn.text.getter();
        a4 = v70;

        v91 = a5;
        a1 = (unint64_t)a5[2];
        v71 = (unint64_t)a5[3];
        if (a1 >= v71 >> 1)
        {
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v71 > 1, a1 + 1, 1);
          a5 = v91;
        }
        a5[2] = (id)(a1 + 1);
        v72 = &a5[2 * a1];
        v72[4] = (id)v16;
        v72[5] = a4;
        --a6;
        ++v17;
        if (!--a2)
        {
LABEL_84:
          swift_unknownObjectRelease();
          goto LABEL_85;
        }
      }
      goto LABEL_98;
    }
    while (a6)
    {
      v65 = *v17;
      v16 = SRSmartRepliesConversationTurn.text.getter();
      a4 = v66;

      v91 = a5;
      a1 = (unint64_t)a5[2];
      v67 = (unint64_t)a5[3];
      if (a1 >= v67 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v67 > 1, a1 + 1, 1);
        a5 = v91;
      }
      a5[2] = (id)(a1 + 1);
      v68 = &a5[2 * a1];
      v68[4] = (id)v16;
      v68[5] = a4;
      --a6;
      ++v17;
      if (!--a2)
        goto LABEL_84;
    }
LABEL_97:
    __break(1u);
LABEL_98:
    __break(1u);
LABEL_99:
    v88 = v19;
    v90 = (char *)v20;
    swift_bridgeObjectRetain();
    v73 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v73 < 2)
      goto LABEL_107;
    v22 = v17;
    v23 = a5;
    v74 = swift_bridgeObjectRetain();
    v21 = (uint64_t)specialized _copyCollectionToContiguousArray<A>(_:)(v74);
    swift_bridgeObjectRelease();
  }
  swift_retain();
  v25 = _CocoaArrayWrapper.endIndex.getter();
  if (v25)
    goto LABEL_7;
LABEL_102:
  swift_release();
LABEL_103:
  swift_bridgeObjectRelease();
  if (one-time initialization token for standard == -1)
    goto LABEL_104;
LABEL_113:
  swift_once();
LABEL_104:
  v75 = type metadata accessor for Logger();
  __swift_project_value_buffer(v75, (uint64_t)static Logger.standard);
  v76 = Logger.logObject.getter();
  v77 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v76, v77))
  {
    v78 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v78 = 0;
    _os_log_impl(&dword_24766C000, v76, v77, "Most recent message in conversation turns does not match specified current message", v78, 2u);
    MEMORY[0x24957F624](v78, -1, -1);
  }

LABEL_107:
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t partial apply for closure #1 in static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return closure #1 in static ServerRequestHandler.formatOutputs(_:modelHeadOutputLabels:)(a1, a2, a3, *(_QWORD *)(v3 + 16), *(uint64_t **)(v3 + 24));
}

uint64_t specialized Sequence.forEach(_:)(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  while (1)
  {
    if (v7)
    {
      v11 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v12 = v11 | (v10 << 6);
      goto LABEL_5;
    }
    v17 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v17 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v17);
    ++v10;
    if (!v18)
    {
      v10 = v17 + 1;
      if (v17 + 1 >= v8)
        return swift_release();
      v18 = *(_QWORD *)(v4 + 8 * v10);
      if (!v18)
      {
        v10 = v17 + 2;
        if (v17 + 2 >= v8)
          return swift_release();
        v18 = *(_QWORD *)(v4 + 8 * v10);
        if (!v18)
        {
          v10 = v17 + 3;
          if (v17 + 3 >= v8)
            return swift_release();
          v18 = *(_QWORD *)(v4 + 8 * v10);
          if (!v18)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v18 - 1) & v18;
    v12 = __clz(__rbit64(v18)) + (v10 << 6);
LABEL_5:
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v12);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    a2(v14, v15, v16);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v19 = v17 + 4;
  if (v19 >= v8)
    return swift_release();
  v18 = *(_QWORD *)(v4 + 8 * v19);
  if (v18)
  {
    v10 = v19;
    goto LABEL_22;
  }
  while (1)
  {
    v10 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v10 >= v8)
      return swift_release();
    v18 = *(_QWORD *)(v4 + 8 * v10);
    ++v19;
    if (v18)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t partial apply for closure #1 in ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return closure #1 in ServerRequestHandler.predictFor(message:conversationTurns:language:plistPath:espressoModelPath:vocabPath:heads:)(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t type metadata accessor for ServerRequestHandler()
{
  return objc_opt_self();
}

uint64_t destroy for InferenceBundle(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for InferenceBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  v6 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v6;
  v8 = *(void **)(a2 + 80);
  v7 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 88) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = v8;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for InferenceBundle(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[10];
  v5 = (void *)a1[10];
  a1[10] = v4;
  v6 = v4;

  a1[11] = a2[11];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for InferenceBundle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 80);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);

  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceBundle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InferenceBundle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for InferenceBundle()
{
  return &unk_2518CD810;
}

uint64_t outlined release of InferenceBundle(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 80);
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24767A640()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in ServerRequestHandler.initializePurgeableModel(language:plistPath:espressoModelPath:vocabPath:)(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = v1[2];
  v4 = (void *)v1[3];
  v5 = v1[6];
  v6 = (void *)v1[7];
  v8 = v1[8];
  v7 = (void *)v1[9];
  type metadata accessor for ServerRequestHandler();
  static ServerRequestHandler.createInferenceBundle(language:plistPath:espressoModelPath:vocabPath:)(v3, v4, v5, v6, v8, v7, a1);
}

unint64_t lazy protocol witness table accessor for type InferenceConfig and conformance InferenceConfig()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceConfig and conformance InferenceConfig;
  if (!lazy protocol witness table cache variable for type InferenceConfig and conformance InferenceConfig)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceConfig, &type metadata for InferenceConfig);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceConfig and conformance InferenceConfig);
  }
  return result;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t partial apply for closure #2 in static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:)(uint64_t a1)
{
  uint64_t v1;

  return closure #2 in static ServerRequestHandler.mergeMessages(message:conversationTurns:maxPromptLength:maxPromptWindowSeconds:promptJoiningString:)(*(double *)(v1 + 40), a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD **)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64)) & 1;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [String] and conformance [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance [A]);
  }
  return result;
}

uint64_t InferenceParameters.maxPromptLength.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

double InferenceParameters.maxPromptWindowSeconds.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 8);
}

uint64_t InferenceParameters.promptJoiningString.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t InferenceParameters.subModelKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

SmartRepliesServer::InferenceParameters::CodingKeys_optional __swiftcall InferenceParameters.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = stringValue._object;
  v2._countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of InferenceParameters.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return (SmartRepliesServer::InferenceParameters::CodingKeys_optional)4;
  else
    return (SmartRepliesServer::InferenceParameters::CodingKeys_optional)v3;
}

SmartRepliesServer::InferenceParameters::CodingKeys_optional __swiftcall InferenceParameters.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SmartRepliesServer::InferenceParameters::CodingKeys_optional)4;
}

uint64_t InferenceParameters.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t InferenceParameters.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24767A900
                                                                     + 4 * asc_24767DB40[a1]))(0xD000000000000011, 0x800000024767E060);
}

uint64_t sub_24767A900(uint64_t a1)
{
  return a1 + 8;
}

uint64_t InferenceParameters.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_24767A970 + 4 * byte_24767DB44[a1]))(0xD000000000000011, 0x800000024767E060);
}

uint64_t sub_24767A970(uint64_t a1)
{
  return a1 + 8;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InferenceParameters.CodingKeys(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = InferenceParameters.CodingKeys.rawValue.getter(*a1);
  v5 = v4;
  if (v3 == InferenceParameters.CodingKeys.rawValue.getter(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InferenceParameters.CodingKeys()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  InferenceParameters.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance InferenceParameters.CodingKeys(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_24767AADC()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InferenceParameters.CodingKeys()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  InferenceParameters.CodingKeys.rawValue.getter(v1);
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InferenceParameters.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized InferenceParameters.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance InferenceParameters.CodingKeys@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = InferenceParameters.CodingKeys.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance InferenceParameters.CodingKeys()
{
  unsigned __int8 *v0;

  return InferenceParameters.CodingKeys.stringValue.getter(*v0);
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance InferenceParameters.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized InferenceParameters.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

uint64_t protocol witness for CodingKey.intValue.getter in conformance InferenceParameters.CodingKeys()
{
  return 0;
}

void protocol witness for CodingKey.init(intValue:) in conformance InferenceParameters.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance InferenceParameters.CodingKeys()
{
  lazy protocol witness table accessor for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance InferenceParameters.CodingKeys()
{
  lazy protocol witness table accessor for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys();
  return CodingKey.debugDescription.getter();
}

double InferenceParameters.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  specialized InferenceParameters.init(from:)(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

void __swiftcall InferenceParameters.init(maxPromptLength:maxPromptWindowSeconds:promptJoiningString:subModelKey:)(SmartRepliesServer::InferenceParameters *__return_ptr retstr, Swift::Int maxPromptLength, Swift::Double maxPromptWindowSeconds, Swift::String promptJoiningString, Swift::String_optional subModelKey)
{
  retstr->maxPromptLength = maxPromptLength;
  retstr->maxPromptWindowSeconds = maxPromptWindowSeconds;
  retstr->promptJoiningString = promptJoiningString;
  retstr->subModelKey = subModelKey;
}

double protocol witness for Decodable.init(from:) in conformance InferenceParameters@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;

  specialized InferenceParameters.init(from:)(a1, (uint64_t *)v6);
  if (!v2)
  {
    v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t ModelHead.numberOfDimensions.getter(uint64_t a1, uint64_t a2)
{
  return a2;
}

SmartRepliesServer::ModelHead::CodingKeys_optional __swiftcall ModelHead.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  SmartRepliesServer::ModelHead::CodingKeys_optional v4;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ModelHead.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = SmartRepliesServer_ModelHead_CodingKeys_numberOfDimensions;
  else
    v4.value = SmartRepliesServer_ModelHead_CodingKeys_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

SmartRepliesServer::ModelHead::CodingKeys_optional __swiftcall ModelHead.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;
  SmartRepliesServer::ModelHead::CodingKeys_optional v4;

  object = stringValue._object;
  v2._countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ModelHead.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 == 1)
    v4.value = SmartRepliesServer_ModelHead_CodingKeys_numberOfDimensions;
  else
    v4.value = SmartRepliesServer_ModelHead_CodingKeys_unknownDefault;
  if (v3)
    return v4;
  else
    return 0;
}

SmartRepliesServer::ModelHead::CodingKeys_optional __swiftcall ModelHead.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SmartRepliesServer::ModelHead::CodingKeys_optional)2;
}

uint64_t ModelHead.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t ModelHead.CodingKeys.rawValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x534C4542414CLL;
}

uint64_t ModelHead.CodingKeys.stringValue.getter(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x534C4542414CLL;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance ModelHead.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v8;

  v2 = *a1 == 0;
  if (*a1)
    v3 = 0xD000000000000014;
  else
    v3 = 0x534C4542414CLL;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0x800000024767E0E0;
  if (*a2)
    v5 = 0xD000000000000014;
  else
    v5 = 0x534C4542414CLL;
  if (*a2)
    v6 = 0x800000024767E0E0;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v8 = 1;
  else
    v8 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance ModelHead.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance ModelHead.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance ModelHead.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance ModelHead.CodingKeys@<X0>(Swift::String *a1@<X0>, char *a2@<X8>)
{
  Swift::Int v3;
  uint64_t result;
  char v5;

  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ModelHead.CodingKeys.init(rawValue:), *a1);
  result = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *a2 = v5;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance ModelHead.CodingKeys(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;

  v2 = 0x534C4542414CLL;
  if (*v1)
    v2 = 0xD000000000000014;
  v3 = 0x800000024767E0E0;
  if (!*v1)
    v3 = 0xE600000000000000;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance ModelHead.CodingKeys()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000014;
  else
    return 0x534C4542414CLL;
}

uint64_t protocol witness for CodingKey.init(stringValue:) in conformance ModelHead.CodingKeys@<X0>(Swift::String string@<0:X0, 8:X1>, char *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;
  char v7;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of ModelHead.CodingKeys.init(rawValue:), v3);
  result = swift_bridgeObjectRelease();
  if (v5 == 1)
    v7 = 1;
  else
    v7 = 2;
  if (!v5)
    v7 = 0;
  *a2 = v7;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance ModelHead.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance ModelHead.CodingKeys()
{
  lazy protocol witness table accessor for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance ModelHead.CodingKeys()
{
  lazy protocol witness table accessor for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys();
  return CodingKey.debugDescription.getter();
}

uint64_t ModelHead.init(from:)(_QWORD *a1)
{
  return specialized ModelHead.init(from:)(a1);
}

uint64_t protocol witness for Decodable.init(from:) in conformance ModelHead@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = specialized ModelHead.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t InferenceConfig.inferenceParameters.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1[1];
  v4 = v1[2];
  v3 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  *a1 = *v1;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t InferenceConfig.stringPreprocessingMethods.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t InferenceConfig.modelHeads.getter()
{
  return swift_bridgeObjectRetain();
}

SmartRepliesServer::InferenceConfig::CodingKeys_optional __swiftcall InferenceConfig.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = stringValue._object;
  v2._countAndFlagsBits = stringValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of InferenceConfig.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return (SmartRepliesServer::InferenceConfig::CodingKeys_optional)3;
  else
    return (SmartRepliesServer::InferenceConfig::CodingKeys_optional)v3;
}

SmartRepliesServer::InferenceConfig::CodingKeys_optional __swiftcall InferenceConfig.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (SmartRepliesServer::InferenceConfig::CodingKeys_optional)3;
}

uint64_t InferenceConfig.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t InferenceConfig.CodingKeys.rawValue.getter(char a1)
{
  uint64_t result;

  result = 0xD000000000000015;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000020;
    else
      return 0x45485F4C45444F4DLL;
  }
  return result;
}

uint64_t InferenceConfig.CodingKeys.stringValue.getter(char a1)
{
  uint64_t result;

  result = 0xD000000000000015;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000020;
    else
      return 0x45485F4C45444F4DLL;
  }
  return result;
}

uint64_t protocol witness for static Equatable.== infix(_:_:) in conformance InferenceConfig.CodingKeys(_BYTE *a1, _BYTE *a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  v2 = *a1;
  v3 = 0xD000000000000020;
  v4 = 0x800000024767E120;
  v5 = 0x45485F4C45444F4DLL;
  v6 = 0xEB00000000534441;
  if (v2 == 1)
  {
    v5 = 0xD000000000000020;
    v6 = 0x800000024767E120;
  }
  if (*a1)
    v7 = v5;
  else
    v7 = 0xD000000000000015;
  if (v2)
    v8 = v6;
  else
    v8 = 0x800000024767E100;
  if (*a2 != 1)
  {
    v3 = 0x45485F4C45444F4DLL;
    v4 = 0xEB00000000534441;
  }
  if (*a2)
    v9 = v3;
  else
    v9 = 0xD000000000000015;
  if (*a2)
    v10 = v4;
  else
    v10 = 0x800000024767E100;
  if (v7 == v9 && v8 == v10)
    v11 = 1;
  else
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance InferenceConfig.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

uint64_t protocol witness for Hashable.hash(into:) in conformance InferenceConfig.CodingKeys()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance InferenceConfig.CodingKeys()
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  return Hasher._finalize()();
}

unint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance InferenceConfig.CodingKeys@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized InferenceConfig.CodingKeys.init(rawValue:)(*a1);
  *a2 = result;
  return result;
}

void protocol witness for RawRepresentable.rawValue.getter in conformance InferenceConfig.CodingKeys(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = 0xD000000000000015;
  v3 = 0xD000000000000020;
  v4 = 0x800000024767E120;
  if (*v1 != 1)
  {
    v3 = 0x45485F4C45444F4DLL;
    v4 = 0xEB00000000534441;
  }
  if (*v1)
  {
    v2 = v3;
    v5 = v4;
  }
  else
  {
    v5 = 0x800000024767E100;
  }
  *a1 = v2;
  a1[1] = v5;
}

unint64_t protocol witness for CodingKey.stringValue.getter in conformance InferenceConfig.CodingKeys()
{
  _BYTE *v0;
  unint64_t v1;

  v1 = 0xD000000000000020;
  if (*v0 != 1)
    v1 = 0x45485F4C45444F4DLL;
  if (*v0)
    return v1;
  else
    return 0xD000000000000015;
}

unint64_t protocol witness for CodingKey.init(stringValue:) in conformance InferenceConfig.CodingKeys@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = specialized InferenceConfig.CodingKeys.init(rawValue:)(a1);
  *a2 = result;
  return result;
}

void protocol witness for CodingKey.init(intValue:) in conformance InferenceConfig.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance InferenceConfig.CodingKeys()
{
  lazy protocol witness table accessor for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys();
  return CodingKey.description.getter();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance InferenceConfig.CodingKeys()
{
  lazy protocol witness table accessor for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys();
  return CodingKey.debugDescription.getter();
}

double InferenceConfig.init(from:)@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  specialized InferenceConfig.init(from:)(a1, v7);
  if (!v2)
  {
    v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    result = *(double *)&v8;
    v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

void __swiftcall InferenceConfig.init(inferenceParameters:stringPreprocessingMethods:modelHeads:)(SmartRepliesServer::InferenceConfig *__return_ptr retstr, SmartRepliesServer::InferenceParameters *inferenceParameters, Swift::OpaquePointer stringPreprocessingMethods, Swift::OpaquePointer modelHeads)
{
  Swift::Double maxPromptWindowSeconds;
  uint64_t countAndFlagsBits;
  void *object;

  maxPromptWindowSeconds = inferenceParameters->maxPromptWindowSeconds;
  countAndFlagsBits = inferenceParameters->promptJoiningString._countAndFlagsBits;
  object = inferenceParameters->promptJoiningString._object;
  retstr->inferenceParameters.maxPromptLength = inferenceParameters->maxPromptLength;
  retstr->inferenceParameters.maxPromptWindowSeconds = maxPromptWindowSeconds;
  retstr->inferenceParameters.promptJoiningString._countAndFlagsBits = countAndFlagsBits;
  retstr->inferenceParameters.promptJoiningString._object = object;
  retstr->inferenceParameters.subModelKey = inferenceParameters->subModelKey;
  retstr->stringPreprocessingMethods = stringPreprocessingMethods;
  retstr->modelHeads = modelHeads;
}

double protocol witness for Decodable.init(from:) in conformance InferenceConfig@<D0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;

  specialized InferenceConfig.init(from:)(a1, v7);
  if (!v2)
  {
    v5 = v7[1];
    *a2 = v7[0];
    a2[1] = v5;
    result = *(double *)&v8;
    v6 = v9;
    a2[2] = v8;
    a2[3] = v6;
  }
  return result;
}

unint64_t specialized InferenceParameters.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of InferenceParameters.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

uint64_t specialized InferenceParameters.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  char v22;
  char v23;
  char v24;
  char v25;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<InferenceParameters.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v25 = 0;
  v9 = KeyedDecodingContainer.decode(_:forKey:)();
  v24 = 1;
  KeyedDecodingContainer.decode(_:forKey:)();
  v11 = v10;
  v23 = 2;
  v12 = KeyedDecodingContainer.decode(_:forKey:)();
  v14 = v13;
  v21 = v12;
  v22 = 3;
  swift_bridgeObjectRetain();
  v15 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
  v17 = v16;
  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v19 = v15;
  v18(v8, v5);
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v21;
  a2[3] = v14;
  a2[4] = v19;
  a2[5] = v17;
  return result;
}

uint64_t specialized ModelHead.init(from:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[8];
  uint64_t v10;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<ModelHead.CodingKeys>);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  lazy protocol witness table accessor for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String]);
    v9[7] = 0;
    lazy protocol witness table accessor for type [String] and conformance <A> [A]();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v7 = v10;
    v9[6] = 1;
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode(_:forKey:)();
    (*(void (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  return v7;
}

unint64_t specialized InferenceConfig.CodingKeys.init(rawValue:)(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of InferenceConfig.CodingKeys.init(rawValue:), v2);
  swift_bridgeObjectRelease();
  if (v3 >= 3)
    return 3;
  else
    return v3;
}

uint64_t specialized InferenceConfig.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
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
  uint64_t result;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<InferenceConfig.CodingKeys>);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  lazy protocol witness table accessor for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v22 = 0;
  lazy protocol witness table accessor for type InferenceParameters and conformance InferenceParameters();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v20 = v23;
  v21 = a2;
  v9 = v24;
  v10 = v26;
  v11 = v28;
  v18 = v27;
  v19 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String]]);
  v22 = 1;
  lazy protocol witness table accessor for type [String : [String]] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : [String]] and conformance <> [A : B], &demangling cache variable for type metadata for [String : [String]], (uint64_t (*)(void))lazy protocol witness table accessor for type [String] and conformance <A> [A]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  v12 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : [String : ModelHead]]);
  v22 = 2;
  lazy protocol witness table accessor for type [String : [String]] and conformance <> [A : B](&lazy protocol witness table cache variable for type [String : [String : ModelHead]] and conformance <> [A : B], &demangling cache variable for type metadata for [String : [String : ModelHead]], lazy protocol witness table accessor for type [String : ModelHead] and conformance <> [A : B]);
  v17 = v12;
  swift_bridgeObjectRetain();
  KeyedDecodingContainer.decode<A>(_:forKey:)();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v13 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  v14 = v17;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v16 = v21;
  *v21 = v20;
  v16[1] = v9;
  v16[2] = v19;
  v16[3] = v10;
  v16[4] = v18;
  v16[5] = v11;
  v16[6] = v14;
  v16[7] = v13;
  return result;
}

unint64_t lazy protocol witness table accessor for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceParameters.CodingKeys, &type metadata for InferenceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceParameters.CodingKeys, &type metadata for InferenceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceParameters.CodingKeys, &type metadata for InferenceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceParameters.CodingKeys, &type metadata for InferenceParameters.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceParameters.CodingKeys and conformance InferenceParameters.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for ModelHead.CodingKeys, &type metadata for ModelHead.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for ModelHead.CodingKeys, &type metadata for ModelHead.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for ModelHead.CodingKeys, &type metadata for ModelHead.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys;
  if (!lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for ModelHead.CodingKeys, &type metadata for ModelHead.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModelHead.CodingKeys and conformance ModelHead.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceConfig.CodingKeys, &type metadata for InferenceConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceConfig.CodingKeys, &type metadata for InferenceConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceConfig.CodingKeys, &type metadata for InferenceConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys;
  if (!lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceConfig.CodingKeys, &type metadata for InferenceConfig.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceConfig.CodingKeys and conformance InferenceConfig.CodingKeys);
  }
  return result;
}

uint64_t destroy for InferenceParameters()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InferenceParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for InferenceParameters(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

_QWORD *assignWithTake for InferenceParameters(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *a2;
  a1[1] = a2[1];
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceParameters(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InferenceParameters(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InferenceParameters()
{
  return &type metadata for InferenceParameters;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InferenceParameters.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InferenceParameters.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24767C558 + 4 * byte_24767DB51[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24767C58C + 4 * byte_24767DB4C[v4]))();
}

uint64_t sub_24767C58C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767C594(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24767C59CLL);
  return result;
}

uint64_t sub_24767C5A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24767C5B0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_24767C5B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767C5BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for InferenceParameters.CodingKeys()
{
  return &type metadata for InferenceParameters.CodingKeys;
}

_QWORD *initializeBufferWithCopyOfBuffer for ModelHead(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ModelHead()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for ModelHead(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *assignWithTake for ModelHead(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelHead(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelHead(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelHead()
{
  return &type metadata for ModelHead;
}

uint64_t getEnumTagSinglePayload for ModelHead.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ModelHead.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24767C830 + 4 * byte_24767DB5B[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24767C864 + 4 * byte_24767DB56[v4]))();
}

uint64_t sub_24767C864(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767C86C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24767C874);
  return result;
}

uint64_t sub_24767C880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24767C888);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24767C88C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767C894(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for ModelHead.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for ModelHead.CodingKeys(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ModelHead.CodingKeys()
{
  return &type metadata for ModelHead.CodingKeys;
}

uint64_t destroy for InferenceConfig()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for InferenceConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for InferenceConfig(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
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

uint64_t assignWithTake for InferenceConfig(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InferenceConfig(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InferenceConfig(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InferenceConfig()
{
  return &type metadata for InferenceConfig;
}

uint64_t getEnumTagSinglePayload for InferenceConfig.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InferenceConfig.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24767CC18 + 4 * byte_24767DB65[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_24767CC4C + 4 * byte_24767DB60[v4]))();
}

uint64_t sub_24767CC4C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767CC54(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24767CC5CLL);
  return result;
}

uint64_t sub_24767CC68(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24767CC70);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_24767CC74(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24767CC7C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for InferenceConfig.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for InferenceConfig.CodingKeys()
{
  return &type metadata for InferenceConfig.CodingKeys;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t lazy protocol witness table accessor for type InferenceParameters and conformance InferenceParameters()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type InferenceParameters and conformance InferenceParameters;
  if (!lazy protocol witness table cache variable for type InferenceParameters and conformance InferenceParameters)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for InferenceParameters, &type metadata for InferenceParameters);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type InferenceParameters and conformance InferenceParameters);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type [String] and conformance <A> [A]()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = lazy protocol witness table cache variable for type [String] and conformance <A> [A];
  if (!lazy protocol witness table cache variable for type [String] and conformance <A> [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [String]);
    v2 = MEMORY[0x24BEE0D38];
    result = MEMORY[0x24957F5C4](MEMORY[0x24BEE12D0], v1, &v2);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [String] and conformance <A> [A]);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type ModelHead and conformance ModelHead()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type ModelHead and conformance ModelHead;
  if (!lazy protocol witness table cache variable for type ModelHead and conformance ModelHead)
  {
    result = MEMORY[0x24957F5C4](&protocol conformance descriptor for ModelHead, &type metadata for ModelHead);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type ModelHead and conformance ModelHead);
  }
  return result;
}

void __getSGStringPreprocessingTransformerClass_block_invoke_cold_1()
{
  abort_report_np();
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t dispatch thunk of PropertyListDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t PropertyListDecoder.init()()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t type metadata accessor for PropertyListDecoder()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t type metadata accessor for URL.DirectoryHint()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t URL.init(filePath:directoryHint:relativeTo:)()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.init(contentsOf:options:)()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t static Date.distantPast.getter()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t static Date.< infix(_:_:)()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t srSmartRepliesXPCClientInterface.getter()
{
  return MEMORY[0x24BEAA4A8]();
}

uint64_t smartRepliesInferenceServiceName.getter()
{
  return MEMORY[0x24BEAA4B0]();
}

uint64_t SRSmartRepliesPredictionItem.init(score:label:)()
{
  return MEMORY[0x24BEAA500]();
}

uint64_t type metadata accessor for SRSmartRepliesPredictionItem()
{
  return MEMORY[0x24BEAA508]();
}

uint64_t SRSmartRepliesConversationTurn.text.getter()
{
  return MEMORY[0x24BEAA518]();
}

uint64_t SRSmartRepliesConversationTurn.senderID.getter()
{
  return MEMORY[0x24BEAA520]();
}

uint64_t SRSmartRepliesConversationTurn.timestamp.getter()
{
  return MEMORY[0x24BEAA528]();
}

uint64_t type metadata accessor for SRSmartRepliesConversationTurn()
{
  return MEMORY[0x24BEAA530]();
}

uint64_t type metadata accessor for SRSmartRepliesError()
{
  return MEMORY[0x24BEAA568]();
}

uint64_t TUSLazyPurgeable.init(initialize:)()
{
  return MEMORY[0x24BEB6C98]();
}

uint64_t WordPieceTokenizer.init(path:)()
{
  return MEMORY[0x24BEB6CB0]();
}

uint64_t WordPieceTokenizer.encode(text:)()
{
  return MEMORY[0x24BEB6CB8]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return MEMORY[0x24BEE07D0]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(reflecting:)()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t String.count.getter()
{
  return MEMORY[0x24BEE0B68]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

Swift::Bool __swiftcall String.hasSuffix(_:)(Swift::String a1)
{
  return MEMORY[0x24BEE0CD0](a1._countAndFlagsBits, a1._object);
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t static Array._allocateBufferUninitialized(minimumCapacity:)()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t static NSProcessInfo.processNameForPID(_:)()
{
  return MEMORY[0x24BEB6DA0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static os_log_type_t.fault.getter()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t static os_log_type_t.default.getter()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t StringProtocol.cString(using:)()
{
  return MEMORY[0x24BDD0618]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

Swift::Void __swiftcall _ArrayBuffer._typeCheckSlowPath(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2648](a1);
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _print_unlocked<A, B>(_:_:)()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t _CocoaArrayWrapper.subscript.getter()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

{
  return MEMORY[0x24BEE3360]();
}

{
  return MEMORY[0x24BEE3370]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE3540]();
}

Swift::Int __swiftcall _minimumMergeRunLength(_:)(Swift::Int a1)
{
  return MEMORY[0x24BEE3548](a1);
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x24BE2FAF0]();
}

uint64_t espresso_context_destroy()
{
  return MEMORY[0x24BE2FB00]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x24BE2FB18]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x24BE2FB38]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x24BE2FB88]();
}

uint64_t espresso_network_declare_input()
{
  return MEMORY[0x24BE2FC10]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x24BE2FC18]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x24BE2FC70]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x24BE2FC80]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x24BE2FC90]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x24BE2FCA0]();
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_isUniquelyReferenced_nonNull()
{
  return MEMORY[0x24BEE4E88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

